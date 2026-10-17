#set page(paper: "us-letter", margin: (x: 84.9pt, y: 84.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The abelianity conjecture for \
special compact Kähler manifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Campana’s classification program separates compact Kähler geometry into special varieties and bases of general type. Specialness records the absence of differential forms that would detect such a base. One of the program’s central predictions is topological: the fundamental group of a special compact Kähler manifold should become abelian after passage to a finite unramified cover #cite(label("ClaudonHoring2013")) Conjecture A.1.

We first specify the notion of specialness. For a holomorphic line bundle $L$ on a compact complex manifold $X$, its Iitaka dimension $kappa \( X \, L \)$ is $- oo$ if no positive tensor power has a nonzero section, and otherwise is the largest dimension of the images of the meromorphic maps defined by its complete plurisection systems. A manifold $X$ of dimension $n$ is #emph[special] if there is no integer $1 lt.eq p lt.eq n$ and no nonzero sheaf morphism

$ L arrow.r Omega_X^p #h(2em) upright("with") #h(2em) kappa \( X \, L \) = p . $

A line bundle with such a morphism and equality is a #emph[Bogomolov sheaf]. A point is special. We prove the following form of Campana’s abelianity conjecture.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a connected smooth compact Kähler manifold of arbitrary complex dimension. If $X$ is special, then $pi_1 \( X \)$ has an abelian subgroup of finite index. Equivalently, $X$ has a connected finite unramified holomorphic cover with abelian fundamental group.]
] <thm:abelianity>

This is a positive resolution of the conjecture in the compact Kähler setting. The conclusion concerns the entire discrete topological fundamental group. It requires no linearity, residual finiteness, projectivity, or prescribed Kodaira dimension. The finite index may depend on $X$, and torsion in $pi_1 \( X \)$ is allowed.

=== 1.1 Kodaira dimension zero <kodaira-dimension-zero>

Campana’s Theorem 6.7, applied to the zero-boundary orbifold $\( X \| 0 \)$, shows that a smooth connected compact Kähler manifold of Kodaira dimension zero is special #cite(label("CampanaOrbifolds")) Theorem 6.7, p. 92. Combining this implication with Theorem 1 gives the following consequence.

#thm([Corollary 1.2.])[
  (Fundamental groups in Kodaira dimension zero).  #emph[Let $X$ be a smooth compact connected Kähler manifold with $kappa \( X \) = kappa \( X \, K_X \) = 0$. Then its ordinary topological fundamental group $pi_1 \( X \)$ is virtually abelian.]
] <cor:kappa-zero-abelianity>

#proof[
  By Campana’s established specialness implication, $X$ is special. Theorem 1 therefore applies. ◻
]

The specialness implication is also recorded in the orbifold core formulation of #cite(label("OpenAIIitaka2026")) Corollary #emph[Kodaira dimension along the core], where its established provenance is noted. No projectivity, vanishing of $c_1 \( X \)$, linearity, or residual-finiteness assumption is required for Corollary 2.

=== 1.2 Conjecture S and affine-space uniformization <conjecture-s-and-affine-space-uniformization>

We also record two geometric consequences identified by Campana. For a connected compact Kähler manifold $X$, let $gamma_X : X arrow.r.dashed Gamma \( X \)$ be its ordinary $Gamma$-reduction. An irreducible compact analytic subspace $Z$ through a very general point is contained in the corresponding fibre precisely when $pi_1 \( hat(Z) \) arrow.r pi_1 \( X \)$ has finite image, where $hat(Z)$ is the normalization of $Z$. Set $gamma d \( X \) = dim Gamma \( X \)$. This is the reduction for the identity quotient of $pi_1 \( X \)$, and maximal ordinary $Gamma$-dimension means $gamma d \( X \) = dim X$ #cite(label("ClaudonHoring2013")) Definition 2.2 and the paragraph preceding Conjecture A.3. The two cases below are, respectively, Campana’s Conjecture S and the bimeromorphic formulation of Iitaka’s conjecture in his appendix #cite(label("ClaudonHoring2013")) Conjecture A.3 and Remark A.4(2).

#thm([Corollary 1.3.])[
  (Conjecture S and bimeromorphic Iitaka uniformization).  #emph[Let $X$ be a connected compact Kähler manifold of complex dimension $n$. Suppose that at least one of the following holds:]
  + #emph[$X$ is special and $gamma d \( X \) = n$;]
  + #emph[the ordinary universal cover of $X$ is biholomorphic to $bb(C)^n$.]
  #emph[Then $X$ has a connected finite étale cover $X' arrow.r X$ such that $X'$ is bimeromorphic to a complex torus.]
] <cor:conjecture-s-iitaka>

#proof[
  Theorem 1 supplies the Abelianity Conjecture. Campana proves that the Abelianity Conjecture implies Conjecture S in #cite(label("ClaudonHoring2013")) Remark A.4(3). We spell out the finite-cover step. A finitely generated virtually abelian group has a torsion-free abelian subgroup of finite index, so take the corresponding connected finite étale cover $X'$. Specialness persists on $X'$. Maximal ordinary $Gamma$-dimension persists as well. A positive-dimensional compact subvariety through a very general point with finite group image upstairs would have an image of the same dimension downstairs. The induced map between the normalizations is finite étale, so their fundamental-group images differ by finite index. The image downstairs would therefore have finite group image, contrary to the $Gamma$-reduction criterion.
  The Albanese map of $X'$ is surjective with connected fibres by Theorem 6. Since $pi_1 \( X' \)$ is torsion-free abelian, its map to the Albanese lattice $H_1 \( X' \, bb(Z) \) \/ upright("torsion")$ is an isomorphism. The group of a smooth general Albanese fibre therefore has trivial image in $pi_1 \( X' \)$. Maximal ordinary $Gamma$-dimension forces that fibre to have dimension zero. Connectedness makes the general fibre one point, so the Albanese map is bimeromorphic to its torus target. This proves (i). Campana’s second implication, Conjecture S to the stated bimeromorphic Iitaka conclusion, is #cite(label("ClaudonHoring2013")) Remark A.4(2); it gives (ii). ◻
]

=== 1.3 Holomorphic convexity of the universal cover <holomorphic-convexity-of-the-universal-cover>

The compact Kähler linear Shafarevich theorem gives a further geometric consequence. Recall that a complex manifold is #emph[holomorphically convex] if the holomorphic hull of every nonempty compact subset is compact.

#thm([Corollary 1.4.])[
  (Holomorphic convexity for special manifolds).  #emph[Let $X$ be a connected smooth compact Kähler manifold. If $X$ is special, then its ordinary universal cover is holomorphically convex.]
] <cor:special-shafarevich>

#proof[
  The group $G = pi_1 \( X \)$ is finitely generated because $X$ is a compact smooth manifold. By Theorem 1, it has an abelian subgroup $H$ of finite index, which is also finitely generated. Write $H tilde.equiv bb(Z)^r xor T$ with $T$ finite. Decomposing $T$ into cyclic factors gives a faithful finite-dimensional complex representation $sigma : H arrow.r "GL" \( V \)$: represent each infinite cyclic factor by powers of $2$ on its own coordinate and each finite cyclic factor by a primitive root of the corresponding order on its own coordinate. For the trivial group, use the one-dimensional trivial representation.
  The induced representation $"Ind"_H^G sigma$ is finite dimensional because $\[ G : H \] < oo$, and it is faithful. Indeed, in its direct-sum realization indexed by the left cosets $G \/ H$, an element of its kernel must preserve the summand indexed by $H$, so it belongs to $H$; its action on that summand is given by the faithful representation $sigma$. Thus $G$ admits a faithful finite-dimensional complex linear representation. The compact Kähler linear Shafarevich theorem of Campana–Claudon–Eyssidieux #cite(label("CCE2015")) author’s version, Corollary 5.9 now gives the claimed holomorphic convexity of the ordinary universal cover. ◻
]

No projectivity or maximal ordinary $Gamma$-dimension is required here. The conclusion is holomorphic convexity, not Steinness: for example, $bb(P)^1$ is special and its universal cover is compact. In contrast, the smooth projective surface constructed in #cite(label("OpenAIShafarevich2026")) has a universal cover that is not holomorphically convex. That surface is therefore not special.

=== 1.4 Compactifiable covers <compactifiable-covers>

Claudon–Höring’s compactifiable-cover results give another consequence. Here a #emph[Zariski-open] embedding is holomorphic and has closed analytic complement. The two parts require different compactifications.

#thm([Corollary 1.5.])[
  (Analytically compactifiable covers).  #emph[]
  + #emph[Let $X$ be a connected normal compact Kähler space and $p : V arrow.r X$ a connected infinite étale Galois covering of complex spaces, with deck group $Gamma$. If $V$ embeds as a Zariski-open subset of a normal compact complex space, then $Gamma$ is virtually abelian.]
  + #emph[Let $X$ be a connected compact Kähler manifold and $U$ its ordinary universal cover. If $U$ embeds as a Zariski-open subset of a normal compact Kähler space, then there is a connected finite étale cover $X' arrow.r X$ whose Albanese map 
$ alpha_(X') : X' arrow.r A = "Alb" \( X' \) $

 is a locally trivial holomorphic fibre bundle with simply connected compact Kähler fibre $F$. Writing $q = dim_(bb(C)) A$, there is a biholomorphism 
$ U tilde.eq F times bb(C)^q . $

 A point is allowed as $A$ or $F$.]
] <cor:compactifiable-covers>

#proof[
  Suppose (i) has a counterexample and choose one of minimal base dimension. The cover is normal because it is étale over normal $X$; normalizing an analytic compactification leaves this open set unchanged. Claudon–Höring’s minimal-counterexample reduction #cite(label("ClaudonHoring2013")) Proposition 1.4 says that this minimal base is smooth and special. Theorem 1 makes its fundamental group virtually abelian. Its quotient $Gamma$ is then virtually abelian, a contradiction.
  For (ii), if $pi_1 \( X \)$ is infinite, apply (i) to the ordinary universal cover; if it is finite, it is already virtually abelian. The Kähler compactification hypothesis is the one in #cite(label("ClaudonHoring2013")) Definition 2.3, so #cite(label("ClaudonHoring2013")) Theorem 1.5 gives the asserted Albanese bundle on a connected finite étale cover $X'$. Pull this bundle back along the universal cover $bb(C)^q arrow.r A$. The automorphism group of the compact Kähler fibre $F$ is a complex Lie group, as recalled in #cite(label("ClaudonHoring2013")) Section 2.C. The associated principal $"Aut" \( F \)$-bundle is topologically trivial over the contractible base $bb(C)^q$, and the Oka–Grauert principle makes it holomorphically trivial over this Stein base. Thus the pullback is $F times bb(C)^q$, the product consequence also recorded in #cite(label("ClaudonHoring2013")) Conjecture 1.1. Since $F$ is simply connected, the pullback is the ordinary universal cover of $X'$, and hence also of $X$. ◻
]

In (i), the compactifying space need not be Kähler and the deck action need not extend to it. For a nonuniversal cover, only the deck group $Gamma$, not the entire fundamental group of $X$, is controlled. The stronger Kähler compactification is used in (ii): the finite cover $X'$ need not be a product, and its fibre $F$ need not be projective.

=== 1.5 Prior work and the remaining group-theoretic obstacle <prior-work-and-the-remaining-group-theoretic-obstacle>

Campana introduced specialness together with its orbifold framework and the special/general-type decomposition in #cite(label("Campana2004")). The same work established restrictions on solvable and linear quotients of special fundamental groups. An important advance for the full group was the proof of the abelianity conjecture for compact Kähler threefolds by Campana–Claudon #cite(label("CampanaClaudonThreefolds")) Theorem 1.1, using the geometry of orbifold surfaces. Their later work proves specialness of general Albanese fibres in the smooth projective setting and reduces the projective conjecture to a finiteness question when all finite covers have irregularity zero #cite(label("CampanaClaudon")) author’s version, Theorem 2.4 and Proposition 3.2. These results explain the role of finite covers and Albanese fibre groups in the argument below. We do not assume specialness of the general Albanese fibre in the arbitrary compact Kähler case.

A classical predecessor is the case $c_1 \( X \) = 0$ in real cohomology: Beauville’s decomposition gives a finite étale cover that is a product of a complex torus and simply connected factors, and therefore gives virtual abelianity in that case #cite(label("Beauville1983")) Section 5, Theorem 2.

The linear case has a separate geometric structure theory. Building on work of Zuo and Eyssidieux, Campana–Claudon–Eyssidieux describe linear Shafarevich reductions by torus fibrations over bases of general type after finite cover and modification #cite(label("CCE2015")) author’s version, Theorem 6.5. Their semisimple theorem gives a general-type base for the torsion-free representations used here #cite(label("CCE2015")) author’s version, Theorems 1 and 6.3. This supplies one branch of our proof. An infinite group, however, need not have an infinite finite-dimensional complex linear image. Controlling these remaining quotients is essential for a statement about the full fundamental group.

The relation between fundamental groups and holomorphic tensors has several relevant predecessors. Brunebarbe–Klingler–Totaro prove that an infinite finite-dimensional linear image over any field forces a nonzero symmetric differential on a compact Kähler manifold #cite(label("BrunebarbeKlinglerTotaro2013")) Theorem 0.1. Brunebarbe–Campana prove that vanishing of all positive symmetric powers of all exterior cotangent powers forces simple connectedness; their argument develops the use of $L^2$ forms and the Poincaré–Atiyah–Gromov method #cite(label("BrunebarbeCampana2016")) Theorem 1.1. Specialness permits many nonzero tensors, so their vanishing hypothesis differs from ours. The task here is to obtain sufficient #emph[positivity] from tensors with unitary Hilbert space coefficients. Only after constructing a big ordinary line bundle, whose Iitaka dimension equals the dimension of the base, and establishing projectivity do we invoke the orbifold cotangent positivity theorem of Campana–Păun #cite(label("CampanaPaun2019")) Theorem 7.11.

The spectral step also belongs to the study of $L^2$ invariants of infinite coverings. Atiyah’s index theorem and regular-coefficient bundle interpretation #cite(label("Atiyah1976")) Theorem 3.8 and Section 6.1, and Dodziuk’s reduced $L^2$ de Rham–Hodge theory #cite(label("Dodziuk1977")), provide foundational models for working on a cover through Hilbert coefficients downstairs. Lott surveys the zero-in-the-spectrum question and several geometric cases #cite(label("Lott1996")). The unrestricted Riemannian assertion has counterexamples #cite(label("FarberWeinberger2001")); the Kähler spectral statement needed here is proved in Section 3.

A second issue is geometric descent over a possibly nonprojective torus. Campana’s correction to the Albanese theorem preserves surjectivity and connectedness for special compact Kähler manifolds, but its repaired assertion excluding multiple fibres requires a projective target #cite(label("CampanaCorrection")) Theorem 1.2. Our proof therefore keeps the actual orders of meridians in the chosen group quotient, including on exceptional divisors of new models. Juanyong Wang’s subadditivity and Albanese theorems provide the required geometric input over arbitrary complex tori #cite(label("JWang2021")) Theorems A(II) and C. They apply to the smooth klt pairs arising here: the boundary has simple normal crossings and rational coefficients strictly less than one.

=== 1.6 Overview of the proof <overview-of-the-proof>

===== 1.6.1 The group to be excluded. <the-group-to-be-excluded.>

Finite étale covers preserve specialness. Since the Albanese map of each cover is surjective, its first Betti number is bounded by twice the dimension of $X$. Pass to a finite cover on which that number is maximal. Write $alpha : X arrow.r A = "Alb" \( X \)$, and let $N$ be the image in $G = pi_1 \( X \)$ of the fundamental group of a smooth general Albanese fibre. We prove

$ 1 arrow.r N arrow.r G arrow.r pi_1 \( A \) arrow.r 1 \, $

and show that $N$ is finitely generated and #emph[FAb]: every finite-index subgroup of $N$ has finite abelianization. The latter step uses Botong Wang’s torsion theorem for isolated characters in cohomology jump loci #cite(label("BWang2016")) Theorem 1.3. It remains to exclude infinite $N$; a finite kernel of a lattice quotient gives virtual abelianity by elementary group theory.

===== 1.6.2 A minimal base carrying an infinite quotient. <a-minimal-base-carrying-an-infinite-quotient.>

Assuming $N$ infinite, consider fibrations of Albanese fibres on all finite covers for which the quotient by the fibre-group image is still infinite. Minimize the dimension $ell > 0$ of their bases. Compact analytic cycle spaces and Campana’s meromorphic $Gamma$-reduction #cite(label("Barlet1975")) #cite(label("CampanaGamma")) globalize a minimizer to a factorization

$ X arrow.r.dashed Z arrow.r A . $

If $B_0$ is the actual group image of a general fibre of the first map, then $Q = N \/ B_0$ is an infinite subgroup of $R = G \/ B_0$, and

$ 1 arrow.r Q arrow.r R arrow.r pi_1 \( A \) arrow.r 1 . $

A very general fibre $Y$ of $Z arrow.r A$ has dimension $ell$. The actual meridian orders in $R$ restrict to the same orders in $Q$ on $Y$. For each boundary divisor $D subset Y$, denote this finite order by $m_D$, and put $Delta_Y = sum_D \( 1 - m_D^(- 1) \) D$. The resulting orbifold $\( Y \, Delta_Y \)$ maps onto $Q$ on fundamental groups. Minimality holds simultaneously after the compatible finite covers and for every further infinite quotient. This is the input to the two branches in Figure 1.

===== 1.6.3 Positivity in the absence of an infinite linear image. <positivity-in-the-absence-of-an-infinite-linear-image.>

Theorem 13 first shows that an infinite normal cover of a compact Kähler orbifold has zero in the spectrum of its scalar Dolbeault Laplacian, with ordinary complex-valued coefficients, in #emph[some] holomorphic degree. The argument places the compact diagonal on $\( U times U \) \/ P$, where $U$ is the cover and its deck group $P$ acts diagonally. The diagonal ${ \( u \, u \) : u in U }$ therefore has compact quotient. Under a contrary spectral gap, weighted solutions and finite-propagation smoothing preserve the nonzero cohomology class of the diagonal after push-down, while making its pairing tend to zero. The contradiction produces the required low spectrum.

When every finite-dimensional complex linear image of $Q$ is finite, we construct nonzero holomorphic tensors with unitary Hilbert coefficients. We use the spectral construction in the nonamenable case and Shalom’s reduced-cohomology theorem in the amenable case #cite(label("Shalom2006")) Theorem 4.2. Taking exterior powers gives tensors with rank-one coefficient image; these lines define maps to Hilbert projective space. We minimize the rank among such maps, prove discreteness of the monodromy on their regular image germs, and compactify the fibres using transverse volume bounds. A rank smaller than $ell$ would contradict the minimal-base condition. Full rank yields a big cotangent line, and hence $K_Y + Delta_Y$ is big by Theorem 19. When $Q$ instead has an infinite linear image, its FAb property produces the required semisimple image and minimality gives generic largeness. The general-type criterion of Campana–Claudon–Eyssidieux then gives $K_Y$ big.

===== 1.6.4 Descent and the contradiction. <descent-and-the-contradiction.>

Both branches give fibre positivity on every sufficiently prepared model. Theorem 33 turns it into a positive-dimensional orbifold base of general type whose orbifold pluriforms pull back to a Bogomolov sheaf on a finite cover of $X$. The key point is to retain actual quotient meridian orders on each model; no birational invariance of the associated log Kodaira dimension is assumed. Differential vanishing cancels the boundary poles on a neat model. Specialness excludes the resulting sheaf, so $N$ is finite and Theorem 1 follows.

#figure(
  [Infinite FAb group $N$: minimize a base dimension $ell > 0$. Obtain $Q = N \/ B_0$ and $\( Y \, Delta_Y \)$ over the Albanese torus.
  $arrow.b.double$
  #[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$Q$ has an infinite complex linear image in finite dimension.

FAb, minimality, and the semisimple general-type criterion

$arrow.r.double K_Y$ big
], table.cell(rowspan: 1, colspan: 1)[Every finite-dimensional complex linear image of $Q$ is finite.

Hilbert tensors, discrete monodromy, and minimality

$arrow.r.double K_Y + Delta_Y$ big
],
)
]
  $arrow.b.double$
  Torus descent with actual meridian orders
  A Bogomolov sheaf on a finite cover of $X$: contradiction.],
  caption: [Figure 1: The contradiction when the Albanese fibre-group image $N$ is infinite. The minimal quotient $Q$ and the fibre $\( Y \, Delta_Y \)$ are constructed together. Each branch must give positivity on all sufficiently prepared models before torus descent applies. The arrows show logical implications. ],
) <fig:proof>

===== 1.6.5 Organization. <organization.>

Section 2 fixes specialness, group reductions, and the precise external geometric inputs. Section 3 proves the scalar spectral theorem. Section 4 constructs the Hilbert tensors and proves their positivity theorem under the minimality condition. Section 5 develops meridian bookkeeping and torus descent. Section 6 establishes the Albanese exact sequence and FAb property, constructs the minimal relative base, and assembles the two representation cases to finish the proof.

== 2 Geometric and group-theoretic preliminaries <sec:preliminaries>

We collect the geometric input that detects a forbidden Bogomolov sheaf and the group lemmas that will convert a finite Albanese fibre image into virtual abelianity.

All manifolds are connected unless stated otherwise. A fibration is a dominant meromorphic map with connected general fibre. We resolve its graph when making differential or fundamental-group arguments. A smooth compact space in Fujiki’s class $cal(C)$ is replaced, when needed, by a compact Kähler modification. Smooth compact bimeromorphic models have the same fundamental group. Fibre groups always mean groups of smooth models of general fibres; their images are understood up to base-point transport. The image of a general fibre group is normal in the total fundamental group: over a smooth fibration locus this follows from the homotopy exact sequence, and the fundamental group of the open total space surjects onto that of the total space.

=== 2.1 Specialness and quotient reductions <specialness-and-quotient-reductions>

We recall the precise established inputs used in the proof.

#thm([Theorem 2.1.])[
  (Bogomolov–Campana).  #emph[For smooth compact Kähler manifolds, specialness in the definition of Section 1 is bimeromorphically invariant and is preserved by connected finite étale covers. The Albanese morphism of a special manifold is surjective with connected fibres. Moreover, if a line bundle $L$ has a nonzero morphism to $Omega_X^p$, then $kappa \( X \, L \) lt.eq p$.]
] <thm:specialness-inputs>

The Bogomolov-sheaf characterization and stability under finite étale covers are given in #cite(label("Campana2004")) author’s version, Theorems 2.26 and 5.12; the remaining specialness properties are developed there. The Iitaka bound originates in Bogomolov’s projective work #cite(label("Bogomolov1979")); for its compact Kähler formulation, see #cite(label("Campana2015Survey")). The Albanese statement is recorded with its correction in #cite(label("CampanaCorrection")) Theorem 1.2. Related projective stability results are developed in #cite(label("CampanaClaudon")). We only use surjectivity and connectedness from that correction. The meridian statement needed for arbitrary, possibly nonprojective Albanese tori will be proved in Lemma 34. Saturating a rank-one subsheaf and taking its double dual does not decrease its Iitaka dimension. Thus the line-bundle definition agrees with the saturated Bogomolov-sheaf formulation.

#thm([Lemma 2.2.])[
  (Effective divisors on a torus).  #emph[Let $D eq.not 0$ be an effective rational divisor on a compact complex torus $A$. There are a quotient homomorphism $p : A arrow.r B$ with connected fibres, where $B$ is a positive-dimensional abelian variety, and an ample effective rational divisor $D_B$ on $B$ such that $D = p^(*) D_B$. In particular, $kappa \( A \, D \) > 0$.]
] <lem:torus-divisor>

#proof[
  We give the standard torus argument; see also #cite(label("Debarre1999")). After multiplying $D$ by a positive integer, assume it is integral. Average its positive integration current $\[ D \]$ over translations of $A$. The result is a smooth translation-invariant semipositive $\( 1 \, 1 \)$-form $theta$ representing $c_1 \( cal(O)_A \( D \) \)$. Write $A = V \/ Lambda$. The alternating form of $theta$ is integral on $Lambda$, so its radical $W$ is defined over $bb(Q)$. It is a complex subspace because $theta$ has type $\( 1 \, 1 \)$. Thus $K = W \/ \( W ∩ Lambda \)$ is a subtorus. Let $p : A arrow.r B = A \/ K$ be the quotient.
  On every $K$-coset, $cal(O)_A \( D \)$ has zero real first Chern class. If its defining section is not identically zero on that coset, its zero divisor must be empty: a nonzero effective divisor on the positive-dimensional Kähler torus $K$ has strictly positive pairing with the $\( dim K - 1 \)$-st power of a Kähler class. For $K = 0$ the same conclusion is immediate. Each coset is therefore either contained in $"Supp" D$ or disjoint from it. If $B$ were a point, this argument with $K = A$ would make the defining section of $D$ nowhere zero, contrary to $D eq.not 0$. Hence $dim B > 0$.
  Translations by the connected group $K$ consequently preserve each prime component $D_i$ of $D$, since a connected group cannot permute their finite set. The image $overline(D)_i = p \( D_i \)$ is a prime divisor on $B$: properness gives an analytic image, and invariance gives $dim overline(D)_i = dim D_i - dim K = dim B - 1$. Moreover $p^(- 1) \( overline(D)_i \) = D_i$, and smoothness of $p$ gives $p^(*) overline(D)_i = D_i$ with multiplicity one. Keeping the coefficients of the $D_i$ therefore defines an effective integral divisor $D_B$ with $D = p^(*) D_B$.
  Since $p^(*) D_B = D$, uniqueness of translation-invariant cohomology representatives identifies $c_1 \( cal(O)_B \( D_B \) \)$ with the positive definite form induced by $theta$ on $B$. The positivity criterion for line bundles on a complex torus makes $D_B$ ample and $B$ an abelian variety. Dividing $D_B$ by the initial integer proves the rational statement. Ratios of sections of its ample multiples remain independent after pullback, so $kappa \( A \, D \) gt.eq dim B > 0$. ◻
]

#thm([Theorem 2.3.])[
  (Meromorphic $Gamma$-reduction).  #emph[Let $M$ be a smooth compact Kähler manifold and let $rho : pi_1 \( M \) arrow.r P$ be a homomorphism. There is a fibration $gamma_rho : M arrow.r.dashed B_rho$ whose general fibre has finite fundamental-group image under $rho$, and which contracts every compact irreducible subvariety through a very general point whose fundamental group has finite image under $rho$. The groups of subvarieties may be computed on their smooth resolutions. The base has a compact Kähler model.]
] <thm:gamma-reduction>

The contraction assertion is Campana’s $Gamma$-reduction #cite(label("CampanaGamma")) Theorem 3.5 and Remark 3.6; the arbitrary-quotient formulation is also stated in #cite(label("CCE2015")) author’s version, Theorem 2.1 and Corollary 2.2. The Kähler-model assertion uses separately the standard stability of Fujiki’s class $cal(C)$ under meromorphic images: the base belongs to $cal(C)$, and a smooth model admits a compact Kähler modification. We call $dim B_rho$ the #emph[$Gamma$-dimension] for $rho$, and call $rho$ #emph[generically large] when this dimension is $dim M$. The target group need not be linear. The qualifier “very general” means outside a countable union of proper analytic subsets. The contraction criterion also applies when the relevant subvarieties exist through a full-measure set: intersect this set with the very general locus in the theorem.

#thm([Theorem 2.4.])[
  (Linear general-type criterion).  #emph[Suppose a compact Kähler manifold has a generically large complex linear representation with torsion-free image and connected simple semisimple Zariski closure. Then it is of general type.]
] <thm:linear-general-type>

#proof[
  Let $M$ be the manifold, and regard $rho$ as a Zariski-dense representation into its semisimple closure. By #cite(label("CCE2015")) author’s version, Theorem 1 and Theorem 6.3, it has a Shafarevich morphism
  $ "sh"_rho : M arrow.r "Sh"_rho \( M \) $
  with normal projective target of general type. This morphism is a model of the connected $Gamma$-reduction #cite(label("CCE2015")) author’s version, Definition 2.13. Generic largeness gives $dim "Sh"_rho \( M \) = dim M$. The connected general fibre is then a point, so $"sh"_rho$ is bimeromorphic. Bimeromorphic invariance of Kodaira dimension proves that $M$ is of general type. ◻
]

=== 2.2 Root orbifolds and adjoint positivity <root-orbifolds-and-adjoint-positivity>

For a smooth compact Kähler manifold $Y$ and a simple normal crossing divisor $sum D_i$ with integers $m_i gt.eq 1$, let $cal(Y)$ be the analytic root orbifold of orders $m_i$, and write

$ Delta = sum_i \( 1 - m_i^(- 1) \) D_i . $

Locally, if the divisor coordinates are $z_i$, its charts have $z_i = w_i^(m_i)$ with the corresponding product of cyclic groups. Tensors and smooth metrics are invariant tensors and smooth metrics upstairs. Its fundamental group is the fundamental group of the divisor complement modulo the normal subgroup generated by the $m_i$-th powers of meridians. Orders equal to one add no boundary. Orbifold covering space theory supplies a connected cover for each subgroup; the cover need not be a manifold.

These orbifolds are Kähler. Add to a sufficiently large pullback of a coarse Kähler form the $upright(i) partial macron(partial)$ of local squared root norms, using smooth metrics on the divisor bundles and cutoffs. Their root-direction terms are positive near the divisor and their negative parts away from it are bounded by the coarse metric. On a cover of a compact orbifold, finitely many uniformizing charts give uniform local elliptic estimates, bounded-overlap partitions and cutoffs. All complete-metric differential operators below are their closed $L^2$ extensions. We use $upright(d) upright(d)^c = upright(i) partial macron(partial)$.

#thm([Theorem 2.5.])[
  (Klt Kähler results over tori).  #emph[Let $Z$ be a smooth compact Kähler manifold, let $D$ be an effective rational divisor such that $\( Z \, D \)$ is klt, and let $g : Z arrow.r A$ be a fibration onto a complex torus. For a general smooth fibre $F$, 
$ kappa \( Z \, K_Z + D \) gt.eq kappa \( F \, K_F + D \|_F \) . $

 If $kappa \( Z \, K_Z + D \) = 0$, the Albanese morphism of $Z$ is surjective with connected fibres.]
] <thm:wang-torus>

These are Theorems A(II) and C of #cite(label("JWang2021")); the torus is not required to be projective. We apply them to smooth pairs with simple normal crossing boundaries and coefficients strictly less than one.

For a projective smooth pair, we also use the bigness consequence of orbifold cotangent positivity in #cite(label("CampanaPaun2019")) Theorem 7.11: a big ordinary line bundle injecting into a tensor power of the orbifold cotangent, on adapted covers, forces the log canonical divisor to be big. The projectivity hypothesis will be established before this result is applied in Section 4.

=== 2.3 Finite kernels and finite covers <finite-kernels-and-finite-covers>

#thm([Lemma 2.6.])[
  #emph[Let $E$ be a finitely generated group in an exact sequence 
$ 1 arrow.r F arrow.r E arrow.r bb(Z)^r arrow.r 1 $

 with $F$ finite. Then $E$ is virtually abelian and residually finite. In particular it has a finite-index subgroup disjoint from $F$.]
] <lem:finite-by-abelian>

#proof[
  The centralizer $E_0$ of $F$ has finite index. Its commutator subgroup is contained in the finite central group $F ∩ E_0$. Choose generators $x_1 \, dots.h \, x_t$ of $E_0$ and an integer $e > 0$ annihilating $F$. Commutators are central, so $\[ x_i^e \, x_j^e \] = \[ x_i \, x_j \]^(e^2) = 1$. The subgroup generated by the $x_i^e$ is abelian and has finite index: its image has finite index in the finitely generated abelianization, and the commutator subgroup is finite. This abelian subgroup has a torsion-free subgroup of finite index. Its core in $E$ is a normal free abelian subgroup of finite index. Multiples of this core have finite index in $E$ and separate its nonzero elements; the finite quotient by the core separates elements outside it. Hence $E$ is residually finite. Since $F$ is finite, intersecting finitely many finite-index subgroups separates all its nonidentity elements at once. ◻
]

#thm([Lemma 2.7.])[
  #emph[Suppose $G$ has a finitely generated normal subgroup $N$ with $G \/ N tilde.equiv bb(Z)^r$. For every finite-index subgroup $N_0 lt.eq N$, there is a finite-index subgroup $G_0 lt.eq G$ satisfying $G_0 ∩ N subset.eq N_0$.]
] <lem:realize-finite-index>

#proof[
  A finitely generated group has only finitely many subgroups of any given finite index. Intersect all automorphic images of the core of $N_0$ in $N$. The result is a characteristic finite-index subgroup $K lt.eq N$ contained in $N_0$, and hence is normal in $G$. The group $G \/ K$ is finite-by-$bb(Z)^r$. By Lemma 11, it has a finite-index subgroup disjoint from $N \/ K$. Its inverse image is a suitable $G_0$. ◻
]

A group is #emph[FAb] if every finite-index subgroup has finite abelianization. Quotients of FAb groups and their finite-index subgroups are FAb. A finitely generated complex linear FAb group with virtually solvable image has finite image: after passage to finite index its Zariski closure is connected and solvable and hence triangularizable. The image is then solvable, and applying finite abelianization successively to the finite-index derived subgroups shows that the image is finite. This observation is used only for linear images; it imposes no linearity hypothesis on the original fundamental group.

== 3 Zero in the Dolbeault spectrum <sec:spectral>

We first establish the analytic input needed for representations on Hilbert spaces. All metrics and differential forms on an orbifold are smooth in its finite uniformizing charts. In particular, the covering in the following theorem need not be a manifold.

#thm([Theorem 3.1.])[
  #emph[Let $\( M \, omega \)$ be a connected compact Kähler orbifold of complex dimension $n$, and let $U arrow.r M$ be a connected normal orbifold covering with infinite deck group $P$. For some $p in { 0 \, dots.h \, n }$, zero belongs to the spectrum of the $L^2$ Dolbeault Laplacian on scalar $\( p \, 0 \)$-forms on $U$, with the lifted metric.]
] <thm:zero-spectrum>

We use the nonnegative Laplacian $Delta'' = macron(partial) macron(partial)^(*) + macron(partial)^(*) macron(partial)$. For functions, the operator $"tr"_omega upright(d) upright(d)^c$ has the opposite sign, up to a fixed positive normalization. Norms without a bundle subscript use the fixed bundle metrics introduced below.

The invariant throughout the proof is the cohomology class of the compact diagonal after push-down to the compact product. The estimates below construct representatives with decreasing norm while controlling the volume of their supports. We first build negative potentials and a weighted inverse, then localize and smooth repeatedly. The final pairing with the diagonal class makes these estimates incompatible with a spectral gap in every degree.

=== 3.1 Complete operators and uniform local estimates <sp:operators>

Lifting a finite collection of nested uniformizing charts on $M$ gives uniform coordinate radii, uniformly equivalent Euclidean metrics, bounds for all metric derivatives, and partitions of unity with bounded overlap and bounded derivatives. A lifted chart has a subgroup of the original finite uniformizing group. The orders of all such groups are consequently bounded. Euclidean estimates applied to invariant lifts descend with uniform constants, since the chart integrals differ from the orbifold integrals by these bounded orders. The same assertions hold on coverings of $M times M$ and for vector bundles with metrics pulled back from the compact base.

We write $H^k$ for the real $L^2$ Sobolev spaces defined with these charts. The local interior elliptic estimates, followed by summation over bounded overlap, have the following consequence. If $A$ is a scalar uniformly elliptic second-order operator, or a system with scalar uniformly elliptic principal symbol, whose coefficients have bounded derivatives of all orders, then

#[#set math.equation(numbering: n => "(1)")
 $ parallel v parallel_(H^(k + 2)) lt.eq C_k #scale(x: 120%, y: 120%)[\(] parallel A v parallel_(H^k) + parallel v parallel_2 #scale(x: 120%, y: 120%)[\)] . $ <sp:global-elliptic>]

Here the estimate applies whenever the right side is finite, initially in the distributional sense. One obtains it first on a smaller chart from the corresponding larger chart and then sums the squared estimates. The constants depend only on the ellipticity and the indicated coefficient bounds; see the interior estimates in #cite(label("GilbargTrudinger2001")) Theorems 6.2 and 9.11, followed by differentiation for higher Sobolev orders. Sobolev embedding is uniform for the same reason. In particular, an $H^k$ function, with $k$ sufficiently large, tends to zero at infinity together with any prescribed fixed number of derivatives: the local Sobolev norms on fixed-radius charts outside a compact set are bounded by the tail of its global Sobolev norm.

The lifted metric is complete. Smooth compactly supported cutoffs $chi_R$, tending to one, can be chosen with $\| upright(d) chi_R \| lt.eq C \/ R$ by smoothing truncated distance functions in the uniform charts. They show that the minimal and maximal closed extensions of $macron(partial)$ agree. They also justify the identities involving formal adjoints: first approximate locally by smooth invariant sections and then use

$ \[ macron(partial) \, chi_R \] = macron(partial) chi_R and med \, #h(2em) parallel \[ macron(partial) \, chi_R \] parallel lt.eq C \/ R . $

The same commutator bound holds for its adjoint and for the Chern differential. Thus compactly supported smooth sections form a core for the associated quadratic forms. Equivalently, the symmetric Dolbeault Dirac operator $sqrt(2) \( macron(partial) + macron(partial)^(*) \)$ is essentially self-adjoint. For completeness, its deficiency equation $D^(*) v = plus.minus upright(i) v$, tested against $chi_R^2 v$, gives $parallel chi_R v parallel_2^2 lt.eq C R^(- 1) parallel v parallel_2^2$; local elliptic regularity makes this test legitimate. Letting $R$ tend to infinity eliminates both deficiency spaces. These arguments remain valid with each of the smooth bundle multipliers used below, which have positive upper and lower bounds for each fixed value of the parameters. The Kähler identities and the Bochner–Kodaira identity therefore extend from compact supports to their complete-metric form domains; their local identities are those of #cite(label("DemaillyCADG")) Chapter VI, Section 6, and Chapter VII, Theorems 1.1–1.2.

Suppose, towards a contradiction to Theorem 13, that all the scalar $\( p \, 0 \)$ Laplacians have positive lower bounds. Since there are only finitely many degrees, choose a common lower bound $delta > 0$, decreasing it whenever necessary by a fixed normalization constant. The pointwise Lefschetz isomorphisms

$ L^(n - p) : Lambda^(p \, 0) arrow.r Lambda^(n \, n - p) \, #h(2em) L = omega and med \, $

commute with the scalar Laplacian and, after normalization, are isometries. Thus the same type of positive lower bound holds on every $\( n \, q \)$ degree. In degree zero it gives

#[#set math.equation(numbering: n => "(2)")
 $ parallel v parallel_2^2 lt.eq C parallel upright(d) v parallel_2^2 \, #h(2em) v in H^1 \( U \) . $ <sp:poincare>]

The group $P$ is infinite, so $U$ is noncompact and $n > 0$.

=== 3.2 Negative potentials with controlled mass <sp:potentials>

We need negative potentials with increasing depth on each fixed compact set and controlled global $L^2$ mass. The depth will make the later weights large near that set, while the mass bound limits the volume of regions where the potential is very negative and hence the growth of supports during localization.

#thm([Lemma 3.2.])[
  #emph[Under (2), there are smooth functions $u_N$ on $U$, for all sufficiently large integers $N$, such that 
#[#set math.equation(numbering: n => "(3)")
 $ u_N lt.eq 0 \, #h(2em) upright(d) upright(d)^c u_N gt.eq - omega \, #h(2em) parallel u_N parallel_2 lt.eq C N^n . $ <sp:potential-bounds>]

 For every compact set $K subset U$, there are $c_K > 0$ and $N_K$ with 
#[#set math.equation(numbering: n => "(4)")
 $ sup_K u_N lt.eq - c_K N #h(2em) \( N gt.eq N_K \) . $ <sp:potential-depth>]

 For each fixed $N$, the function $u_N$ belongs to every $H^k$ and has bounded derivatives of all orders.]
] <sp:potential-lemma>

#proof[
  Fix a nonnegative $f in C_c^oo \( U \)$ which is strictly positive on a chart ball, and put
  $ F_N = log \( 1 + N^n f \) \, #h(2em) lambda = N^(- 2 n) . $
  We solve
  #[#set math.equation(numbering: n => "(5)")
   $ omega_u^n = e^(F_N + lambda u) omega^n \, #h(2em) omega_u = omega + upright(d) upright(d)^c u > 0 . $ <sp:ma-equation>]
  We give the complete continuity argument, including the global estimates which distinguish this problem from a bounded-solution existence result.
  Fix an integer $k > n + 6$ and consider
  $ cal(B) = { u in H^(k + 2) \( U \, bb(R) \) : omega_u gt.eq c omega upright(" for some ") c > 0 } . $
  This is open in $H^(k + 2)$. The map $u mapsto log \( omega_u^n \/ omega^n \) - lambda u$ is smooth from $cal(B)$ to $H^k$, by Sobolev multiplication and composition in the uniform charts. Its linearization at $u$ is
  #[#set math.equation(numbering: n => "(6)")
   $ v mapsto "tr"_(omega_u) upright(d) upright(d)^c v - lambda v . $ <sp:ma-linearization>]
  At a smooth solution with bounded derivatives this is an isomorphism $H^(k + 2) arrow.r H^k$. Indeed its negative is coercive on $H^1$ when integrated with $omega_u^n$: its quadratic form is a positive multiple of the gradient norm plus $lambda parallel v parallel_2^2$. Lax–Milgram gives an $H^1$ inverse, and (1) gives the asserted higher regularity and bounded inverse. The metric $omega_u$ is complete and uniformly equivalent to $omega$ at this individual solution. A solution in $cal(B)$ is smooth with bounded derivatives by local elliptic bootstrapping, since initially $k > n + 6$. The implicit function theorem therefore gives openness for
  #[#set math.equation(numbering: n => "(7)")
   $ log \( omega_u^n \/ omega^n \) - lambda u = s F_N \, #h(2em) 0 lt.eq s lt.eq 1 . $ <sp:ma-path>]
  At $s = 0$ the solution is $u = 0$.
  We next obtain estimates uniform in $s$, with $N$ fixed. Every solution in $cal(B)$ tends to zero at infinity with its first several derivatives. At an interior maximum of $u$, the determinant ratio is at most one; at an interior minimum it is at least one. The same bounds hold when an extremum is approached at infinity, where $u$ tends to zero. Consequently
  #[#set math.equation(numbering: n => "(8)")
   $ - lambda^(- 1) parallel F_N parallel_oo lt.eq u lt.eq 0 . $ <sp:ma-czero>]
  In particular the determinant ratio in (7) has positive upper and lower bounds depending only on $N$.
  Here are the second-order and higher local estimates in the order in which they are needed. Write $Delta_u = "tr"_(omega_u) upright(d) upright(d)^c$. Since $"tr"_omega upright(d) upright(d)^c u gt.eq - n$,
  $ Delta_omega \( s F_N + lambda u \) gt.eq - C_N - lambda n . $
  The differential trace estimate #cite(label("CampanaGuenanciaPaun2013")) Lemma 2.2 is
  $ Delta_u log "tr"_omega omega_u gt.eq frac(Delta_omega \( s F_N + lambda u \), "tr"_omega omega_u) - B "tr"_(omega_u) omega . $
  It gives
  #[#set math.equation(numbering: n => "(9)")
   $ Delta_u log "tr"_omega omega_u gt.eq - B "tr"_(omega_u) omega - C_N . $ <sp:yau-trace>]
  In this estimate $B$ depends on a lower bound for the background holomorphic bisectional curvature. The possible negative term involving $Delta_omega \( s F_N + lambda u \)$ is divided by $"tr"_omega omega_u$, which is bounded below by the determinant lower bound. Apply (9) to $Q = log "tr"_omega omega_u - A u$, where $A > B + 1$ is fixed. Since $Delta_u u = n - "tr"_(omega_u) omega$, at a maximum of $Q$ one obtains
  $ \( A - B \) "tr"_(omega_u) omega lt.eq A n + C_N . $
  If the supremum is not attained, it is bounded by the value $log n$ at infinity. At an attained maximum, the determinant upper bound and the inverse-trace bound control $"tr"_omega omega_u$ there. The oscillation bound in (8) then controls it everywhere. It follows that
  #[#set math.equation(numbering: n => "(10)")
   $ c_N omega lt.eq omega_u lt.eq C_N omega $ <sp:ma-equivalence>]
  uniformly along the path.
  This also bounds the background real Laplacian of $u$. Local Poisson $W^(2 \, p)$ estimates, for $p$ larger than the real dimension, give a uniform $C^(1 \, alpha)$ bound on smaller charts. The equation now has a uniformly elliptic complex Hessian and a controlled Hölder right side. Fix $0 < beta < alpha$. The local complex Monge–Ampère $C^(2 \, beta)$ estimate #cite(label("YuWang2012")) arXiv:1111.0902v1, Theorem 1.1 applies after adding a local potential for $omega$: the resulting function is strictly plurisubharmonic with local sup norm controlled by (8), its Euclidean Laplacian is bounded by (10), and the positive density is bounded below with its $n$-th root uniformly $C^alpha$. Differentiation of the equation and local Schauder estimates then give bounds for every derivative. These are local bounds uniform over all lifted charts and all $s$, with constants depending on $N$ and the derivative order; no global higher Sobolev bound has been assumed in obtaining them.
  There is a global estimate with a better dependence on $N$. Integration by parts gives
  #[#set math.equation(numbering: n => "(11)")
   $ integral_U \( - u \) \( omega_u^n - omega^n \) & = sum_(a = 0)^(n - 1) integral_U upright(i) partial u and accent(partial u, ‾) and omega_u^a and omega^(n - 1 - a) \,\
c parallel upright(d) u parallel_2^2 & lt.eq integral_U \( - u \) \( omega_u^n - omega^n \) lt.eq N^n parallel f parallel_2 parallel u parallel_2 . $ <sp:ma-energy>]
  The first mixed term is the fixed background metric, so the lower constant is independent of $N$. For the upper bound use $u lt.eq 0$ and
  $ e^(s F_N + lambda u) - 1 lt.eq \( 1 + N^n f \)^s - 1 lt.eq N^n f . $
  The integrand in (11) is absolutely integrable: away from $"Supp" f$, its absolute value is at most $lambda u^2$, and on $"Supp" f$ it is integrable. To justify the integration by parts, insert the complete-metric cutoffs. The mixed metrics are bounded by (10), and the cutoff errors tend to zero by $u \, upright(d) u in L^2$. Combining (11) with (2) gives
  #[#set math.equation(numbering: n => "(12)")
   $ parallel u parallel_2 lt.eq C N^n $ <sp:ma-ltwo>]
  uniformly in $s$ and $N$.
  It remains to establish closedness in the global Banach space. In local coordinates, (7) can be written
  $ a_u^(i macron(j)) u_(i macron(j)) - lambda u = s F_N \, #h(2em) a_u^(i macron(j)) = integral_0^1 \( g_(a macron(b)) + t u_(a macron(b)) \)^(i macron(j)) thin d t . $
  The superscript $i macron(j)$ denotes the corresponding entry of the inverse Hermitian matrix. The coefficients have uniform ellipticity and all required derivative bounds by the preceding local estimates. Thus (1) and (12) give global bounds in every fixed Sobolev order. If $s_nu arrow.r s$, a subsequence of the corresponding solutions converges smoothly on compact sets. The limit solves (7), satisfies the uniform positive lower bound in (10), and belongs to $H^(k + 2)$ by lower semicontinuity of the global norms. It is therefore still in $cal(B)$. This proves closedness and hence solvability at $s = 1$. Denote that solution by $u_N$. The first three assertions of (3) and the stated regularity have been proved.
  Suppose (4) fails for a fixed nonempty compact set $K$. Along a subsequence, $sup_K \( u_N \/ N \) arrow.r 0$. Local plurisubharmonic compactness, after adding a local potential for $omega \/ N$, gives an $L_(upright("loc"))^1$ limit $v$ which is plurisubharmonic and nonpositive. The alternative of uniform collapse to $- oo$ is excluded by the supremum on $K$. Hartogs’ lemma implies that $v$ attains zero on $K$. Since $U$ is connected, the maximum principle gives $v = 0$ everywhere.
  The trace–determinant inequality applied to (5) gives
  #[#set math.equation(numbering: n => "(13)")
   $ "tr"_omega upright(d) upright(d)^c \( u_N \/ N \) gt.eq n f^(1 \/ n) e^(lambda u_N \/ n) - n \/ N . $ <sp:ma-trace-limit>]
  Pass to a further almost-everywhere convergent subsequence of $u_N \/ N$. As $n gt.eq 1$, $lambda u_N = N^(1 - 2 n) \( u_N \/ N \) arrow.r 0$ almost everywhere. The right side of (13) converges in $L^1$ on a ball where $f > 0$ to $n f^(1 \/ n) > 0$, by dominated convergence and $u_N lt.eq 0$. The left side converges to zero as a distribution because $u_N \/ N arrow.r 0$ in local $L^1$. Testing against a nonzero nonnegative function supported in that ball is a contradiction. This proves (4). ◻
]

Choose once and for all a compact region $L subset U$, of positive volume, whose translates have interiors covering $U$. It may be enlarged to be connected. Properness and cocompactness of the deck action give bounded overlap and a bounded number of neighbors within any fixed distance. For $a \, g in P$ put

#[#set math.equation(numbering: n => "(14)")
 $ A_a \( g \) = - sup_(x in g L) u_N \( a^(- 1) x \) . $ <sp:cell-depth>]

#thm([Lemma 3.3.])[
  #emph[There are $C \, epsilon.alt > 0$, independent of $N \, a \, g$, such that 
#[#set math.equation(numbering: n => "(15)")
 $ \# { g in P : A_a \( g \) gt.eq 1 } lt.eq C N^(2 n) \, $ <sp:cell-count>]

 and 
#[#set math.equation(numbering: n => "(16)")
 $ integral_(g L) exp #h(-0.16667em) (frac(- epsilon.alt u_N \( a^(- 1) x \), A_a \( g \) + 1)) omega^n lt.eq C . $ <sp:cell-exponential>]

 For each $R < oo$ there is $C_R$ such that 
#[#set math.equation(numbering: n => "(17)")
 $ C_R^(- 1) \( A_a \( g \) + 1 \) lt.eq A_a \( h \) + 1 lt.eq C_R \( A_a \( g \) + 1 \) $ <sp:cell-neighbors>]

 whenever the distance between $g L$ and $h L$ is at most $R$.]
] <sp:cell-lemma>

#proof[
  Every cell counted in (15) contributes at least $"vol" \( L \)$ to the integral of $\| u_N \( a^(- 1) x \) \|^2$. Bounded overlap and (3) prove the count.
  Translate $g L$ to $L$ and normalize the potential by $A_a \( g \) + 1$. The resulting functions are nonpositive, have $upright(d) upright(d)^c$ bounded below by $- omega$, and have supremum in $\[ - 1 \, 0 \]$ on $L$. Plurisubharmonic compactness on a connected neighborhood of any fixed enlargement of $L$ makes this a relatively compact family in local $L^1$. In particular its supremum cannot tend to $- oo$ on another fixed cell. There are only finitely many possible relative neighbors; this gives the upper comparison in (17), and exchanging the two cells gives the lower comparison.
  On finitely many smaller charts covering $L$, add fixed local potentials to make the normalized functions plurisubharmonic. Each limit has a positive local exponential integrability exponent. Compactness and the semicontinuity and integrability statement of #cite(label("DemaillyKollar2001")) Main Theorem 0.2 give a common sufficiently small exponent and a uniform integral bound. The added local potentials are bounded, so they can be removed at the cost of a constant. Summing the chart estimates and translating back gives (16). ◻
]

=== 3.3 A weighted inverse on the diagonal covering <sp:weighted>

The potentials now have both a depth estimate and a uniform exponential integrability bound on cells. The next step is an inverse estimate that makes a closed form inexpensive to solve where the potential is deep. Its dependence on the weight, not merely existence of an inverse, will be needed when the solution is localized.

Set

$ D = \( U times U \) \/ P \, #h(2em) Omega_S = omega_x + S omega_y \, #h(2em) E = p_y^(*) K_M \, $

where $P$ acts diagonally and $S gt.eq 1$. The maps $p_x \, p_y$ here are to $M$. We give $E$ the metric from the original, unscaled metric $omega$. The space $D$ is an orbifold covering of $M times M$; write $m = 2 n$ for its complex dimension. The subgroup defining this covering is the inverse image of the diagonal in $P times P$. In particular the diagonal map $M arrow.r M times M$ lifts to $D$.

Unweighted norms for $Omega_S$ are denoted by $parallel dot.op parallel_S$; an additional bundle metric multiplier $h$ is indicated by $parallel dot.op parallel_(S \, h)$. On the $\( m \, * \)$ complex with coefficients $E^(*)$, the unweighted Dolbeault Laplacian has a positive lower bound $delta$ independent of $S$. To verify this on a compactly supported section of $D$, lift it to $U times U$ and integrate first in $x$, with $y$ in a fundamental region. Product splitting expresses the energy as its nonnegative $x$ and $y$ parts. The $x$ part uses scalar $\( n \, q_x \)$-forms, so the previously obtained gaps apply. The same argument on $E^(*)$-valued $\( p \, 0 \)$-forms uses the original scalar $\( p_x \, 0 \)$ gaps and gives

#[#set math.equation(numbering: n => "(18)")
 $ parallel macron(partial) xi parallel_S^2 gt.eq delta parallel xi parallel_S^2 quad upright("for ") xi upright(" of type ") \( p \, 0 \) upright(".") $ <sp:x-gap>]

These calculations are local product calculations and hence descend to the diagonal quotient. Bounded finite chart stabilizers do not change them.

#thm([Lemma 3.4.])[
  #emph[Suppose a smooth positive multiplier $h$ on $E^(*)$ satisfies 
#[#set math.equation(numbering: n => "(19)")
 $ 1 lt.eq h lt.eq e^b \, #h(2em) upright(i) Theta_(E^(*) \, h) gt.eq - C_0 t Omega_S \, #h(2em) b \, t gt.eq 0 . $ <sp:weight-hypotheses>]

 Then the complete $macron(partial)$ complex of $E$-valued $\( 0 \, * \)$-forms with multiplier $k = h^(- 1)$ is exact with closed ranges. Every closed form $F$ in this complex has a solution $accent(partial v, ‾) = F$ satisfying 
#[#set math.equation(numbering: n => "(20)")
 $ parallel v parallel_(S \, k) lt.eq C #scale(x: 120%, y: 120%)[\(] e^(b \/ 4) + sqrt(t) thin e^(b \/ 2) #scale(x: 120%, y: 120%)[\)] parallel F parallel_(S \, k) . $ <sp:weighted-solution>]

 The constant depends on $M$, $C_0$ and $delta$, but not on $S \, b \, t$.]
] <sp:weighted-inverse>

#proof[
  First work on the $\( m \, * \)$ complex with coefficients $E^(*)$. Its unweighted gap gives exactness and closed ranges: the bounded Green operator yields the decomposition into the images of $macron(partial)$ and $macron(partial)^(*)$. Weighted and unweighted differential graph norms are equivalent for fixed $b$. Thus the domains, kernels and ranges of the closed differential $d = macron(partial)$ are the same, and weighted exactness and closed ranges follow. This argument does not assert equality of the weighted and unweighted adjoint domains.
  Let $D'_h$ be the $\( 1 \, 0 \)$ part of the Chern connection and let $*_S$ be the complex-linear Hodge star on form indices. On $\( m \, q \)$-forms it takes values in $\( m - q \, 0 \)$, and
  $ \( D'_h \)^(*) = plus.minus *_S macron(partial) *_S . $
  This formula acts trivially on the coefficient index. The derivative of the bundle metric in the adjoint cancels the corresponding Chern connection term. The Bochner–Kodaira identity and (19) imply
  #[#set math.equation(numbering: n => "(21)")
   $ cal(E)_(S \, h) \( eta \) + C_1 t parallel eta parallel_(S \, h)^2 gt.eq parallel \( D'_h \)^(*) eta parallel_(S \, h)^2 gt.eq delta parallel eta parallel_S^2 . $ <sp:bochner-weighted>]
  Here $cal(E)_(S \, h) \( eta \) = parallel macron(partial) eta parallel_(S \, h)^2 + parallel macron(partial)_h^(*) eta parallel_(S \, h)^2$ is the weighted Dolbeault energy. Indeed $D'_h eta = 0$ in top holomorphic degree, and the curvature commutator there is a sum of $q$ curvature eigenvalues. For the last inequality drop $h gt.eq 1$ from the differential norm and apply (18) to $*_S eta$. The star is an isometry. Compact support approximation from Section 3.1 proves the same inequality on the form domain.
  Fix a degree $q$ and put $A = d d_h^(*)$ on the closed subspace $"Im" d$. For a nonzero vector $eta$ in a spectral band of $A$ up to $mu > 0$, its minimal weighted lift has squared norm $chevron.l A^(- 1) eta \, eta chevron.r_(S \, h)$, hence at least $mu^(- 1) parallel eta parallel_(S \, h)^2$. The minimal unweighted lift is also an admissible weighted lift, with norm at most $e^(b \/ 2) delta^(- 1 \/ 2) parallel eta parallel_S$. Consequently
  $ parallel eta parallel_S^2 gt.eq delta e^(- b) mu^(- 1) parallel eta parallel_(S \, h)^2 . $
  On this spectral band $d eta = 0$ and $cal(E)_(S \, h) \( eta \) lt.eq mu parallel eta parallel_(S \, h)^2$. Substitution in (21) gives
  #[#set math.equation(numbering: n => "(22)")
   $ mu \( mu + C_1 t \) gt.eq delta^2 e^(- b) . $ <sp:spectral-quadratic>]
  This holds for every nonzero lower spectral band. Solving the quadratic inequality shows that the minimal inverses of $d$ have norm at most $C \( e^(b \/ 4) + sqrt(t) thin e^(b \/ 2) \)$ in every degree.
  Finally use the conjugate-linear bundle-metric star for Serre duality, which is distinct from the linear star used above. It identifies the $\( m \, q \)$ complex for $E^(*)$ with multiplier $h$ with the reversed $\( 0 \, m - q \)$ complex for $E$ with multiplier $h^(- 1)$, interchanging the differential and its adjoint. It is an isometry for these norms. The complete-domain identities therefore transfer exactness, closed ranges, and the inverse bounds to the latter complex. This proves (20). ◻
]

=== 3.4 A smoothing operator with fixed propagation <sp:smoothing>

For the rest of the proof all distances, cell neighborhoods, and support volumes refer to the standard metric $Omega_1$. This convention is independent of the parameter $S$ in the preceding estimates. Write $pi : D arrow.r M times M$ for the covering and $E_0 = p_y^(*) K_M$ for the bundle downstairs, so that $E = pi^(*) E_0$.

#thm([Lemma 3.5.])[
  #emph[There is a smoothing operator $K$ on the complete Dolbeault complex of $E$-valued $\( 0 \, * \)$-forms on $D$ with the following properties:]
  + #emph[$K$ commutes with $macron(partial)$ and preserves separately the antiholomorphic degrees in $x$ and $y$.]
  + #emph[Its propagation is at most a fixed $R$, and its kernel and all kernel derivatives are uniformly bounded in the lifted charts.]
  + #emph[For compactly supported currents, $K$ commutes with trace to $M times M$. On closed such currents it preserves the cohomology class of their trace.]
  #emph[If $B$ is an $E$-valued $\( 0 \, n \)$ current with cellwise $L^1$ coefficients, then 
#[#set math.equation(numbering: n => "(23)")
 $ parallel K B parallel_S lt.eq C S^(n \/ 2) (sum_C (integral_C \| B \|_S thin upright(d) V_1)^2)^(1 \/ 2) \, $ <sp:smoothing-norm>]

 where $C$ runs through the product cells modulo the diagonal action.]
] <sp:smoothing-lemma>

#proof[
  Choose an even Schwartz function $f_0$ whose Fourier transform is smooth and compactly supported, with $f_0 \( 0 \) = 1$, and set $K = f_0 \( sqrt(Delta''_1) \)$, using the standard unweighted product metric and the fixed metric on $E$. The product splitting of $Delta''_1$ proves the degree assertions. Commutation with $macron(partial)$ follows first on its domain from the Dolbeault identities and then on currents by duality.
  The wave equation has finite propagation with a speed bounded by the principal symbol. In the present setting this can be seen from the symmetric first-order operator $D_1 = sqrt(2) \( macron(partial) + macron(partial)^(*) \)$: the energy identity for a moving cutoff contains only its commutator, whose norm is bounded by a fixed multiple of the cutoff gradient. It gives the domain-of-dependence estimate for $e^(upright(i) t D_1)$. Since $f_0$ is even, the Fourier expression for $f_0 \( sqrt(Delta''_1) \)$ uses only these finite-time wave operators. Thus $K$ has fixed propagation. The coefficient curvature contributes only lower-order terms and does not alter this argument. The identical energy calculation in invariant charts proves it on the orbifold.
  To see smoothing with uniform kernel bounds, use (1) and local Sobolev embedding to bound point evaluation, and derivative evaluation, after $\( 1 + Delta''_1 \)^(- a)$ for $a$ sufficiently large. The factorization
  $ K = \( 1 + Delta''_1 \)^(- a) #scale(x: 120%, y: 120%)[\(] \( 1 + Delta''_1 \)^(2 a) K #scale(x: 120%, y: 120%)[\)] \( 1 + Delta''_1 \)^(- a) $
  has bounded middle factor by the Schwartz decay of $f_0$. Evaluating the outside factors and their adjoints bounds the kernel at any two points, uniformly in the charts. Increasing $a$ gives every derivative bound. This argument also defines $K$ on distributions.
  For a compactly supported $E$-valued current $A$, define its orbifold trace by
  $ chevron.l "Tr" A \, beta chevron.r = chevron.l A \, pi^(*) beta chevron.r $
  for smooth $E_0^(*)$-valued test forms $beta$ of complementary bidegree. On a covering chart $\[ V \/ H \] arrow.r \[ V \/ G \]$, this is the sum over cosets $G \/ H$, with the natural action on form and coefficient indices, summed also over the local sheets met by the support. The $\| G : H \|$ terms convert the downstairs integration factor $1 \/ \| G \|$ into the upstairs factor $1 \/ \| H \|$. This description applies even when $H$ is not normal; it includes the stabilizer multiplicities at singular strata.
  For a compactly supported current, the wave-evolved support stays in a fixed compact neighborhood for bounded time, by completeness and finite propagation. Its local trace is therefore a finite sum. Since the operator and coefficient metric are pulled back from the base, the local transfer commutes with the differential operator. The traced wave is thus the downstairs wave with traced initial data, by uniqueness. Integrating in time proves that trace commutes with $K$. On the compact base, a spectral function with value one at zero is the identity on harmonic representatives and therefore on Dolbeault cohomology, also computed by currents. This proves (iii).
  It remains to check the dependence on $S$. For an $E$-valued $\( 0 \, n \)$ block of $y$ antiholomorphic degree $q$, the unscaled metric on $E$ gives
  #[#set math.equation(numbering: n => "(24)")
   $ \| B \|_S = S^(- q \/ 2) \| B \|_1 \, #h(2em) upright(d) V_S = S^n upright(d) V_1 \, #h(2em) parallel B parallel_S = S^(\( n - q \) \/ 2) parallel B parallel_1 . $ <sp:scaling-block>]
  Put $a_C^S \( B \) = integral_C \| B \|_S upright(d) V_1$. The kernel bound and fixed propagation imply $parallel K B parallel_1 lt.eq C parallel \( a_C^1 \( B \) \)_C parallel_(ell^2)$: each output cell sees only boundedly many input neighbors, and the neighbor matrix has uniformly bounded row and column sums. Since $K$ preserves $q$,
  $ parallel K B parallel_S lt.eq C S^(\( n - q \) \/ 2) S^(q \/ 2) parallel \( a_C^S \( B \) \)_C parallel_(ell^2) = C S^(n \/ 2) parallel \( a_C^S \( B \) \)_C parallel_(ell^2) . $
  The finitely many orthogonal blocks give (23). Product cells may overlap and have bounded finite chart multiplicities; these change only the fixed constant. ◻
]

=== 3.5 Cell weights and one localization step <sp:localization>

We now combine the weighted inverse with the fixed-propagation smoother. One step replaces a compactly supported closed form by a smaller representative of the same traced class. The thresholds are nested so that the output support of one step is an admissible input for the next.

Fix an integer $r > 30 n + 6$ and choose $0 < zeta < 1 \/ \( 8 r \)$. These choices are made before $N$ tends to infinity. At step $j in { 1 \, dots.h \, r }$ set

#[#set math.equation(numbering: n => "(25)")
 $ S = N^2 \, quad H_j = N^(3 \/ 4 - 2 \( j - 1 \) zeta) \, quad H_j^(-) = H_j N^(- zeta) \, quad t_j = frac(2 log N, H_j) . $ <sp:thresholds>]

In particular $H_j gt.eq N^(1 \/ 2)$, $H_j lt.eq S$, and $t_j S arrow.r oo$. Constants in the following construction may depend on the fixed $r$.

For each step choose a bump $w^(\( j \)) in C_c^oo \( U \, \[ 0 \, 1 \] \)$, equal to one on a neighborhood of $L$, and let $w_a^(\( j \)) \( y \) = w^(\( j \)) \( a^(- 1) y \)$. The bumps can be chosen as squares so that

$ \| upright(d) w_a^(\( j \)) \|^2 lt.eq C_j w_a^(\( j \)) . $

Their translates have bounded overlap and bounded derivatives. Choose the support at step $j + 1$ sufficiently large that $w^(\( j + 1 \))$ equals one on every fixed-radius neighborhood of $"Supp" w^(\( j \))$ required below. Only finitely many enlargements are made, all independent of $N$.

We suppress $j$ temporarily and write $H \, H^(-) \, t \, w_a$ for the data at that step. Let $rho$ be a smooth convex regularization of $max \( 0 \, s \)$, equal to zero for $s lt.eq - 1$ and to $s$ for $s gt.eq 1$, with $0 lt.eq rho' lt.eq 1$, $rho'' gt.eq 0$, and $rho gt.eq max \( 0 \, s \)$. Define

$ ell_a \( x \) & = - 2 H + rho #scale(x: 120%, y: 120%)[\(] u_N \( a^(- 1) x \) + 2 H #scale(x: 120%, y: 120%)[\)] \,\
p_H \( ell \) & = ell + frac(ell^2, 8 H) \,\
T \( x \, y \) & = sum_(a in P) w_a \( y \) p_H \( ell_a \( x \) \) \,\
phi \( x \, y \) & = - H \/ 2 + rho #scale(x: 120%, y: 120%)[\(] T \( x \, y \) + H \/ 2 #scale(x: 120%, y: 120%)[\)] . $

For large $N$, the clipped functions satisfy $- 2 H lt.eq ell_a lt.eq 0$ and $- H \/ 2 lt.eq phi lt.eq 0$. The sum is locally finite and invariant under the diagonal action. Moreover

#[#set math.equation(numbering: n => "(26)")
 $ upright(d) upright(d)^c phi gt.eq - C_j \( omega_x + H omega_y \) . $ <sp:weight-curvature>]

Here is the estimate including mixed terms. On $\[ - 2 H \, 0 \]$, $1 \/ 2 lt.eq p'_H lt.eq 1$ and $p''_H = 1 \/ \( 4 H \)$. The $x$ Hessian of each summand contains $w_a p''_H upright(i) partial ell_a and macron(partial) ell_a$ as a positive term. The mixed derivative is bounded by half this term plus a constant times $H \| upright(d) w_a \|^2 \/ w_a$ in the $y$ direction, using Cauchy–Schwarz; the expression is interpreted as zero where $w_a = 0$. The bump inequality bounds the latter term by $C_j H omega_y$. The pure $y$ Hessian has the same bound because $\| p_H \( ell_a \) \| lt.eq 2 H$. The remaining $x$ Hessian is bounded below by $- w_a omega_x$. Bounded overlap and the final convex clipping give (26).

Put

#[#set math.equation(numbering: n => "(27)")
 $ h_j = e^(- t_j phi) \, #h(2em) k_j = h_j^(- 1) \, #h(2em) b = log N . $ <sp:actual-weights>]

These are smooth multipliers on $D$. They satisfy (19), with a constant independent of $N$ and $S$. Indeed $1 lt.eq h_j lt.eq N$, and

$ upright(i) Theta_(E^(*) \, h_j) = upright(i) Theta_(E^(*)) + t_j upright(d) upright(d)^c phi . $

The first term is bounded below by $- C omega_y$, which is absorbed by $- C' t_j Omega_S$ because $t_j S arrow.r oo$; the second is controlled by (26) and $H_j lt.eq S$.

Call the following set the deep region at step $j$:

#[#set math.equation(numbering: n => "(28)")
 $ cal(D)_j = { \( x \, y \) : x in g L \, med A_a \( g \) gt.eq H_j \, med w_a^(\( j \)) \( y \) = 1 upright(" for some ") a \, g } \/ P . $ <sp:deep-region>]

On this region $ell_a lt.eq - H_j$ for a witnessing index and $p_(H_j) \( ell_a \) lt.eq - 7 H_j \/ 8$. The final clipping is consequently constant, $phi = - H_j \/ 2$, and

#[#set math.equation(numbering: n => "(29)")
 $ h_j = N \, #h(2em) k_j = N^(- 1) quad upright("on ") cal(D)_j . $ <sp:deep-weight>]

A product cell $g L times g' L$, modulo the diagonal action, is marked at step $j$ when some $a$ satisfies

#[#set math.equation(numbering: n => "(30)")
 $ A_a \( g \) gt.eq H_j^(-) \, #h(2em) g' L ∩ "Supp" w_a^(\( j \)) eq.not diameter . $ <sp:marked-cells>]

There are at most $C_j N^(2 n)$ marked cells. In fact, translating by $a^(- 1)$ leaves only a bounded number of possible second cells meeting $"Supp" w^(\( j \))$, and (15) bounds the number of first cells. Any fixed enlargement of their union has the same bound on its number of cells and on its standard volume.

On every unmarked cell $C$ one has

#[#set math.equation(numbering: n => "(31)")
 $ integral_C h_j thin upright(d) V_1 lt.eq C_j . $ <sp:unmarked-weight>]

Indeed $ell_a gt.eq u_N \( a^(- 1) x \)$, $p_H \( ell_a \) gt.eq ell_a$, and $phi gt.eq T$. Since all the potentials are nonpositive and $0 lt.eq w_a lt.eq 1$, this bounds $h_j$ on a cell by the product of $exp \( - t_j u_N \( a^(- 1) x \) \)$ over the bounded number of indices whose $y$ supports meet that cell. Each such index has $A_a \( g \) < H_j^(-)$ when the cell is unmarked. Hölder’s inequality and (16) apply, because

$ t_j \( H_j^(-) + 1 \) lt.eq 2 \( log N \) \( N^(- zeta) + N^(- 1 \/ 2) \) arrow.r 0 . $

Integration in the $y$ cell contributes only a fixed volume factor.

Choose a smooth compactly supported cutoff $chi_j$ equal to one on a neighborhood of all marked cells, with support in a fixed enlargement of their union and with $\| upright(d) chi_j \|_1 lt.eq C_j$. Such cutoffs are obtained by smoothing the distance cutoff in the uniform charts. Every cell meeting $"Supp" upright(d) chi_j$ is unmarked. Enlarge the supports of $w^(\( j + 1 \))$ as specified above so that

#[#set math.equation(numbering: n => "(32)")
 $ upright("the ") R upright("-neighborhood of ") "Supp" chi_j upright(" lies in ") cal(D)_(j + 1) #h(2em) \( j < r \) . $ <sp:nested-supports>]

To verify this, a point in that neighborhood has an $x$ cell within a fixed distance of a cell witnessing (30). By (17), its depth is at least $c_j H_j^(-) - 1$, which exceeds $H_(j + 1)$ for large $N$, since $H_j^(-) \/ H_(j + 1) = N^zeta$. Its $y$ coordinate lies within a fixed distance of $"Supp" w_a^(\( j \))$, where the next bump is one. This proves (32). Similarly, (4) shows that $cal(D)_1$ contains every prescribed fixed-radius neighborhood of the lifted diagonal for large $N$.

#thm([Lemma 3.6.])[
  #emph[Let $F$ be a smooth compactly supported closed $E$-valued $\( 0 \, n \)$-form supported in $cal(D)_j$. There is a smooth compactly supported closed form $F_(upright("new"))$ of the same type whose traced cohomology class is that of $F$, with 
#[#set math.equation(numbering: n => "(33)")
 $ parallel F_(upright("new")) parallel_S lt.eq C_j N^(- 1 \/ 6) parallel F parallel_S . $ <sp:one-step-norm>]

 Its support is in the fixed $R$-neighborhood of $"Supp" chi_j$, has standard volume at most $C_j N^(2 n)$, and lies in $cal(D)_(j + 1)$ when $j < r$.]
] <sp:one-step>

#proof[
  By Lemma 16 and (29), solve $accent(partial v, ‾) = F$ with
  $ parallel v parallel_(S \, k_j) & lt.eq C_j #scale(x: 120%, y: 120%)[\(] N^(1 \/ 4) + sqrt(t_j) thin N^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] N^(- 1 \/ 2) parallel F parallel_S\
 & lt.eq C_j N^(- 1 \/ 6) parallel F parallel_S . $
  The last inequality uses $sqrt(t_j) lt.eq C \( log N \)^(1 \/ 2) N^(- 1 \/ 4)$. The compactly supported closed current
  $ B = F - macron(partial) \( chi_j v \) = - macron(partial) chi_j and v $
  has the same traced cohomology class as $F$. The equality uses $chi_j = 1$ near $"Supp" F$. On any cell meeting $"Supp" B$, which is unmarked, Cauchy–Schwarz and (31) give
  $ integral_C \| B \|_S thin upright(d) V_1 lt.eq C_j (integral_C \| v \|_S^2 k_j thin upright(d) V_1)^(1 \/ 2) . $
  Here wedging with $macron(partial) chi_j$ has bounded operator norm for $Omega_S$, because $S gt.eq 1$. After summing squares and using bounded overlap and $upright(d) V_S = S^n upright(d) V_1$, we obtain
  $ (sum_C (integral_C \| B \|_S thin upright(d) V_1)^2)^(1 \/ 2) lt.eq C_j S^(- n \/ 2) N^(- 1 \/ 6) parallel F parallel_S . $
  Set $F_(upright("new")) = K B$ with the fixed operator of Lemma 17. Its norm estimate is (33); its closedness and traced class follow from the same lemma. Fixed propagation, the marked-cell count and (32) give all support assertions. Only the compactly supported current $chi_j v$ is traced; no sum of the global solution $v$ is used. ◻
]

=== 3.6 The compact diagonal class <sp:diagonal-class>

#proof[
  Continue under the assumption of positive lower bounds in all $\( p \, 0 \)$ degrees. Let $iota : M arrow.r D$ be the lifted diagonal and let $\[ iota \( M \) \]$ be its integration current of type $\( n \, n \)$. Orbifold integration defines this current directly by pullback of test forms to $M$, regardless of singularities of the coarse spaces. Project it to the component whose holomorphic degree lies entirely in the $y$ factor. Under the natural identification with $E$-valued $\( 0 \, n \)$ currents, call the result $T_0$. This projection commutes with $macron(partial)$, so $T_0$ is closed and compactly supported.
  Its trace to $M times M$ has a nonzero cohomology class. More explicitly, the canonical isomorphism $K_(M times M) ⊗ E_0^(*) tilde.eq p_x^(*) K_M$ identifies $p_x^(*) omega^n$ with a closed $E_0^(*)$-valued $\( m \, n \)$ test form $beta$. The holomorphic-degree projection used to define $T_0$ does not change the pairing with this form, since all other components vanish on wedging with $p_x^(*) omega^n$. Hence
  #[#set math.equation(numbering: n => "(34)")
   $ chevron.l "Tr" T_0 \, beta chevron.r = integral_M omega^n > 0 . $ <sp:diagonal-pairing>]
  Let $F_0 = K T_0$. It is smooth, compactly supported, and closed; its traced class has the same pairing (34). It is independent of $N$, and its support lies in a fixed neighborhood of the lifted diagonal. Thus it lies in $cal(D)_1$ for all sufficiently large $N$. Apply Lemma 18 successively for the fixed number $r$ of steps to obtain $F_r$. Its standard support volume is at most $C_r N^(2 n)$, while
  $ parallel F_r parallel_S lt.eq C_r N^(- r \/ 6) parallel F_0 parallel_S . $
  For degree $\( 0 \, n \)$, (24) and $0 lt.eq q lt.eq n$ show that $parallel F_r parallel_1 lt.eq parallel F_r parallel_S$ and $parallel F_0 parallel_S lt.eq S^(n \/ 2) parallel F_0 parallel_1$. The constant norm conversions are used only at these endpoints. Since $S = N^2$,
  $ parallel F_r parallel_1 lt.eq C_r N^(n - r \/ 6) . $
  The pullback of the fixed test form $beta$ is uniformly bounded for the standard metric. Therefore Cauchy–Schwarz gives
  $ \| chevron.l "Tr" F_r \, beta chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq C "vol"_1 \( "Supp" F_r \)^(1 \/ 2) parallel F_r parallel_1 lt.eq C_r N^(2 n - r \/ 6) arrow.r 0 . $
  Our fixed choice $r > 30 n + 6$ more than suffices for this decay. Every step preserves the traced cohomology class, so its pairing is the strictly positive constant in (34). This is a contradiction. At least one scalar $\( p \, 0 \)$ Dolbeault Laplacian has no positive lower bound, which proves the theorem. ◻
]

== 4 Hilbert tensors and minimal quotients <sec:hilbert>

The purpose of this section is to turn an infinite quotient with no infinite linear image into positivity on a base of minimal dimension. The auxiliary compact manifold in the following statement allows the minimality condition to be imposed before passing to an orbifold base. For a homomorphism $rho$ on the fundamental group of a compact Kähler manifold $V$, write $"gdim" \( V \, rho \)$ for the dimension of its $Gamma$-reduction.

#thm([Theorem 4.1.])[
  #emph[Let $Y$ be a connected smooth compact Kähler manifold of dimension $ell > 0$, and let 
$ Delta = sum_i \( 1 - m_i^(- 1) \) D_i \, #h(2em) m_i in bb(N) \, quad m_i gt.eq 2 \, $

 have simple normal crossing support. Denote its root orbifold by $cal(Y)$. Suppose that 
$ q : pi_1^(upright("orb")) \( cal(Y) \) arrow.r Q $

 is surjective, that $Q$ is infinite, and that every finite-dimensional complex linear representation of $Q$ has finite image.]
  #emph[Suppose that a connected smooth compact Kähler manifold $S$ admits a dominant meromorphic map $a : S arrow.r.dashed Y$ and a homomorphism $nu : pi_1 \( S \) arrow.r Q$ with finite-index image. Assume that $a$ and $nu$ are compatible with $q$ on a dense analytic Zariski-open subset where $a$ is holomorphic and takes values in $Y \\ "Supp" Delta$.]
  #emph[Finally, suppose that for every finite-index subgroup $Q_0 lt.eq Q$ there is a connected finite étale cover $S' arrow.r S$ such that, writing $nu'$ for the induced homomorphism and $Q' = "Im" nu'$, one has $Q' subset Q_0$ and 
#[#set math.equation(numbering: n => "(M)")
 $ "gdim" \( S' \, psi compose nu' \) gt.eq ell quad upright("whenever ") psi : Q' arrow.r.twohead H \, quad H upright(" is infinite") . $ <hi:minimality>]

 Then $K_Y + Delta$ is big.]
] <thm:hilbert-positivity>

In (M), the cover may depend on $Q_0$; after it has been chosen, the lower bound is required for every infinite quotient of its image. Each $Q'$ is automatically of finite index in $Q$. No linearity assumption is imposed on the groups $H$.

=== 4.1 Holomorphic forms with Hilbert coefficients <holomorphic-forms-with-hilbert-coefficients>

We use flat unitary Hilbert bundles in the usual local sense: their transition functions are constant unitary operators. Differential operators act on the finite-dimensional form indices and on the Hilbert coefficients componentwise. The local elliptic and Sobolev estimates used in Section 3 extend to these coefficients, as explained below.

#thm([Lemma 4.2.])[
  #emph[Every finite-index subgroup $Q_0$ of $Q$ has only finite finite-dimensional complex linear images. In particular, $H^1 \( Q_0 \, bb(C) \) = 0$.]
] <hi:finite-images>

#proof[
  Inducing a finite-dimensional representation of $Q_0$ to $Q$ produces a finite-dimensional representation of $Q$. Its restriction to $Q_0$ contains the original representation, whose image is therefore finite. The group $Q$, and hence $Q_0$, is finitely generated. A nonzero homomorphism $Q_0 arrow.r \( bb(C) \, + \)$ would give an infinite unipotent two-dimensional representation, proving the last assertion. ◻
]

#thm([Proposition 4.3.])[
  #emph[There exist an integer $p > 0$, a separable unitary representation $rho : Q arrow.r U \( cal(H) \)$ with no nonzero finite-dimensional invariant subspace, and a nonzero holomorphic section 
$ eta in H^0 #scale(x: 120%, y: 120%)[\(] cal(Y) \, Omega_(cal(Y))^p ⊗ cal(H)_rho #scale(x: 120%, y: 120%)[\)] . $

]
] <hi:coefficients>

#proof[
  We treat the nonamenable and amenable cases separately.
  #emph[The nonamenable case.] Let $U arrow.r cal(Y)$ be the normal orbifold covering associated with $ker q$. By Theorem 13, in some fixed degree $\( p \, 0 \)$ there are unit vectors with spectral support in $\[ 0 \, j^(- 1) \]$, for $j arrow.r oo$. Folding forms from $U$ to the compact base identifies them with sections $s_j$ having coefficients in the regular representation $lambda_Q$ on $ell^2 \( Q \)$. This is the regular-coefficient bundle interpretation of covering-space analysis #cite(label("Atiyah1976")) Section 6.1. To include the orbifold normalization, work on a chart $\[ V \/ G \]$ and put $H = ker \( G arrow.r Q \)$. The cover has components $\[ V \/ H \]$ indexed by the cosets of $"Im" \( G arrow.r Q \)$ in $Q$. A $G$-invariant form with regular coefficients is exactly the corresponding family of scalar forms on these components. In the norm, the $\| G \/ H \|$ regular coordinates cancel the downstairs factor $1 \/ \| G \|$, leaving the upstairs factor $1 \/ \| H \|$. The differential operators agree componentwise. Thus the identification preserves the $L^2$ norms and operators even when $U$ has nontrivial isotropy.
  Here is the compactness statement needed for these coefficients. For every integer $k gt.eq 0$, elliptic estimates give
  $ parallel s_j parallel_(H^(2 k)) lt.eq C_k #scale(x: 120%, y: 120%)[\(] parallel \( Delta'' \)^k s_j parallel_2 + parallel s_j parallel_2 #scale(x: 120%, y: 120%)[\)] lt.eq 2 C_k . $
  The constants do not depend on the coefficient dimension. Indeed, in a flat chart the coefficients of the operator are finite matrices tensored with the identity on the Hilbert space. Summing the scalar elliptic estimates over an orthonormal expansion gives the Hilbert estimate. The same conclusion holds on invariant orbifold charts, whose local group orders are uniformly bounded. A finite atlas then gives the displayed global estimate. Hilbert-valued Sobolev embedding, obtained from Fourier inversion and Cauchy–Schwarz, bounds every derivative uniformly on smaller charts.
  Fix a nonprincipal ultrafilter. Form the Hilbert ultrapower $cal(H)^omega$ and define the values and derivatives of $s$ by the corresponding pointwise classes of those of $s_j$. Uniform bounds for the next derivative give uniform Taylor remainders. Thus these classes are the derivatives of a smooth section, and the exact transition identities make it a section of the ultrapower flat bundle.
  This section retains its norm. The functions $x mapsto parallel s_j \( x \) parallel^2$ are uniformly bounded and uniformly Lipschitz on the finite atlas. A finite $epsilon$-net shows that their pointwise ultralimit is approached uniformly along the ultrafilter: first control the finitely many net values, then use the common Lipschitz bound. Consequently
  $ parallel s parallel_2^2 = lim_omega parallel s_j parallel_2^2 = 1 . $
  Applying the same elliptic estimates to $Delta'' s_j$ shows convergence to zero in every fixed $C^r$ norm, since $parallel \( Delta'' \)^(k + 1) s_j parallel_2 lt.eq j^(- k - 1)$. Hence $Delta'' s = 0$. Integration by parts on the compact base, in antiholomorphic degree zero, gives $accent(partial s, ‾) = 0$.
  The ultrapower representation has no nonzero finite-dimensional invariant subspace. Otherwise such a subspace would have finite image, by the hypothesis on $Q$, and would be fixed by a finite-index subgroup $Q_0$. This subgroup is nonamenable. For a finite generating set $F subset Q_0$ and some $epsilon > 0$,
  $ sum_(g in F) parallel lambda \( g \) v - v parallel^2 gt.eq epsilon parallel v parallel^2 $
  on its regular representation. Indeed, failure would give unit almost invariant vectors; their squared absolute values would be almost invariant probability measures in $ell^1 \( Q_0 \)$, yielding an invariant mean. Summing over copies gives the same inequality on the restriction of $lambda_Q$ to $Q_0$. A nonzero $Q_0$-fixed ultrapower vector, represented by a bounded sequence of limiting norm one, contradicts this inequality after taking the ultralimit. There are only finitely many terms on its left side.
  Finally, restrict to the closed span of all coefficient values of the section and their $Q$-translates. Countable charts, continuity, and countability of $Q$ make this subspace separable. It still contains the nonzero section and has no finite-dimensional invariant subspace.
  #emph[The amenable case.] An infinite amenable group does not have property $\( T \)$: its regular representation has almost invariant vectors and no invariant vector. Shalom’s reduced-cohomology theorem therefore gives a unitary representation with nonzero reduced first cohomology #cite(label("Shalom2006")) Theorem 4.2. We may restrict to a separable invariant subspace generated by the values of a cocycle on the countable group.
  The closed span of the finite-dimensional invariant subspaces contributes no reduced first cohomology. To see this, decompose it orthogonally into finite-dimensional irreducible summands. On any finite sum the representation has finite image. Its kernel $Q_0$ has $H^1 \( Q_0 \, bb(C) \) = 0$, by Lemma 20; restriction of a cocycle to that kernel is zero, and averaging over the finite quotient makes the cocycle a coboundary. Finite partial sums approximate a cocycle on a finite generating set, so the same vanishing holds for reduced cohomology of the closed sum. The orthogonal complement therefore has a cocycle $b$ that is not a limit of coboundaries and has no finite-dimensional subrepresentation.
  Pullback by the surjection $q$ preserves this nonvanishing: approximating the pullback cocycle on lifts of finitely many generators of $Q$ would approximate $b$ itself. The associated flat affine Hilbert bundle on $cal(Y)$ has a smooth section, constructed by local sections and a partition of unity, averaged in the finite orbifold charts. Its covariant differential is a smooth closed Hilbert-valued one-form $alpha$ representing the pulled-back cocycle.
  The harmonic projection of $alpha$ is nonzero. Otherwise, the orthogonal decomposition of the closed de Rham Hilbert complex would put the closed form $alpha$ in the $L^2$ closure of exact forms. For fixed $t > 0$, the heat operator $e^(- t Delta)$ commutes with the differential and maps $L^2$ convergence to $C^0$ convergence, by the dimension-independent elliptic estimates just used. Thus $e^(- t Delta) alpha$ would be a uniform limit of smooth exact forms. Periods along finitely many fixed generator loops, with flat parallel transport of coefficients, would approximate its cocycle by coboundaries. Letting $t arrow.b 0$ gives the same conclusion for $alpha$, contrary to the choice of $b$. The orthogonal decomposition of the closed de Rham Hilbert complex now gives a nonzero harmonic one-form; local elliptic regularity makes it smooth.
  The Kähler identities for flat unitary coefficients split this harmonic form into types. A nonzero $\( 1 \, 0 \)$-part is holomorphic. If only the $\( 0 \, 1 \)$-part is nonzero, complex conjugation gives a holomorphic $\( 1 \, 0 \)$-form with conjugate coefficients. The conjugate representation again has no finite-dimensional invariant subspace.
  In either case, degree zero is impossible: a holomorphic section of a flat unitary Hilbert bundle on a compact Kähler orbifold is parallel, by integration of the Laplacian of its squared norm. A nonzero parallel section would give an invariant line. ◻
]

=== 4.2 The line associated with a tensor <the-line-associated-with-a-tensor>

Proposition 21 supplies a nonzero tensor, but nonvanishing alone does not contradict specialness. We next isolate its coefficient line and measure the variation of that line by a positive curvature current. This connects the group to cotangent positivity, as in the finite-dimensional setting of #cite(label("BrunebarbeKlinglerTotaro2013")); the Hilbert coefficient space and the subsequent minimal-rank argument require the constructions proved here.

For a finite-index subgroup $Gamma lt.eq Q$, let $cal(Y)_Gamma arrow.r cal(Y)$ be the cover associated with $q^(- 1) \( Gamma \)$. All finite orbifold covers considered in this subsection and the next are of this form.

Call a holomorphic tensor

$ tau in H^0 #scale(x: 120%, y: 120%)[\(] cal(Y)_0 \, \( Omega_(cal(Y)_0)^1 \)^(⊗ m) ⊗ cal(B)_rho #scale(x: 120%, y: 120%)[\)] $

a #emph[line tensor] if the map from the dual of its cotangent tensor factor to its Hilbert coefficient space has generic rank one. Here $cal(Y)_0$ is a connected finite orbifold cover of $cal(Y)$, and $rho$ is a unitary representation of its corresponding finite-index subgroup of $Q$. On the $Q$-cover, the coefficient lines define a holomorphic map to $bb(P) \( cal(B) \)$ away from an analytic degeneracy locus. We always replace $cal(B)$ by the closed span of these lines.

#thm([Lemma 4.4.])[
  #emph[There is a line tensor whose coefficient lines have infinite-dimensional closed span.]
] <hi:plucker>

#proof[
  Let $eta$ be given by Proposition 21, and let $r$ be the generic rank of $\( Omega_(cal(Y))^p \)^(*) arrow.r cal(H)$. Taking its $r$-th exterior power gives a nonzero rank-one tensor with coefficient space $and.big^r cal(H)$. Antisymmetrization embeds its finite-dimensional tensor factor into $\( Omega_(cal(Y))^1 \)^(⊗ p r)$.
  If the resulting decomposable lines spanned a finite-dimensional space, $Q$ would act on that span through a finite group. The orbit of one of these lines would be finite. A decomposable exterior line determines its $r$-dimensional original coefficient plane, so the corresponding orbit of planes would also be finite. Their sum would be a nonzero finite-dimensional invariant subspace of $cal(H)$, a contradiction. ◻
]

#thm([Lemma 4.5.])[
  #emph[A line tensor determines a saturated orbifold line subsheaf 
$ cal(L) subset \( Omega_(cal(Y)_0)^1 \)^(⊗ m) $

 and a positive curvature current on $cal(L)$. On the regular locus this current is the pullback of the Fubini–Study form of its coefficient-line map.]
] <hi:saturated-line>

#proof[
  Work in a uniformizing chart with a flat coefficient trivialization. Any nonzero scalar coefficient of $tau$ determines its meromorphic direction in the finite-rank tensor bundle. All scalar coefficients have this direction, since the coefficient rank is one. These local meromorphic directions agree on overlaps. Their saturations are coherent rank-one subsheaves of the tensor bundle. A saturated subsheaf of a locally free sheaf is reflexive in rank one, and on a smooth chart a rank-one reflexive sheaf is a line bundle. The invariant constructions give the asserted orbifold line.
  Write a local line generator as $e$. Off its codimension-two degeneracy set the tensor has the form $e ⊗ u$, with $u$ Hilbert-valued and holomorphic. There are no divisorial poles, by saturation. The Hilbert-valued Hartogs extension, obtained from the Cauchy integral formula on transverse polydiscs, extends $u$ across the remaining set.
  The weights $log parallel u parallel^2$ are plurisubharmonic. If $e_beta = g_(alpha beta) e_alpha$, then $u_beta = g_(alpha beta)^(- 1) u_alpha$, so
  $ log parallel u_beta parallel^2 = log parallel u_alpha parallel^2 - log \| g_(alpha beta) \|^2 . $
  They therefore define the metric $parallel e_alpha parallel^2 = parallel u_alpha parallel^(- 2)$ on $cal(L)$, with positive curvature. Where $u eq.not 0$, its curvature is $upright(d) upright(d)^c log parallel u parallel^2$, the pulled-back Fubini–Study form. A positive power of $cal(L)$ kills the finitely many chart stabilizer actions and descends to an ordinary line bundle on the coarse space; its weights descend as psh weights. ◻
]

The degeneracy loci used here and below are analytic even though the coefficient space may be infinite-dimensional. Locally their rank conditions are the vanishing of holomorphic scalar minors. The ideal of their germs at a point is generated by finitely many of those minors. On sufficiently small representatives of the finitely many local components, every remaining minor vanishes by the identity theorem. This proves local analyticity of the common zero set; it does not require a global finite list of coefficients.

=== 4.3 Minimal rank and discrete monodromy <minimal-rank-and-discrete-monodromy>

Among all line tensors with infinite-dimensional span on finite orbifold covers, choose one for which the generic complex rank $s$ of the coefficient-line map is minimal. This is a minimum in the finite set ${ 1 \, dots.h \, ell }$: rank zero would make the map constant on its connected covering, giving a one-dimensional span. Let $Gamma lt.eq Q$ be the subgroup defining the selected cover, let $cal(B)$ be its separable coefficient span, and write

$ F : U^compose arrow.r bb(P) \( cal(B) \) $

on the connected regular open subset of the $Q$-cover. We may delete the chart isotropy locus as well. These deletions are proper analytic sets and do not disconnect the covering.

#thm([Proposition 4.6.])[
  #emph[After replacing $Gamma$ by a finite-index subgroup, the action on the regular image germs of $F$ has infinite discrete image in a Lie group acting properly on a connected complex manifold of dimension $s$.]
] <hi:discrete-monodromy>

#proof[
  #emph[The manifold of image germs.] At each point of $U^compose$, the holomorphic constant-rank theorem writes $F$ as a submersion onto an embedded $s$-dimensional plaque. This theorem also holds for the present Hilbert target: choose a finite-dimensional projection of rank $s$, use it for source coordinates, and observe that all derivatives in the remaining source directions vanish.
  Let $Z$ consist of the image points together with the germs of these embedded plaques at those points. A plaque supplies its own coordinate chart on $Z$. The map $U^compose arrow.r Z$ is an open holomorphic submersion, so $Z$ is connected and second countable. It is Hausdorff. Indeed, two germs over the same image point can both be written as graphs over one finite-dimensional transverse projection and one small connected ball. If their plaque neighborhoods shared a germ, the graph functions would agree on an open set and hence everywhere on that ball. The original germs would be equal. Points lying over different image points are separated by the Hilbert projective space.
  The natural immersion $iota : Z arrow.r bb(P) \( cal(B) \)$ gives $Z$ a Kähler metric. We use its intrinsic Riemannian length distance, which induces the manifold topology and is locally compact even when the metric is incomplete. Its isometry group acts properly #cite(label("Manoussos2010")) Corollary 4 and is a Lie group #cite(label("MatveevTroyanov2017")) author’s version, Theorem 6.3. Let $I$ be the closure of the $Gamma$-image in this isometry group with its compact-open topology. Its elements are holomorphic. Indeed, if holomorphic isometries $g_j$ converge to $g$, choose a relatively compact neighborhood whose image under $g$ lies compactly inside one target complex chart. Eventually the $g_j$ also take its closure into that chart, and their coordinate maps converge locally uniformly. The Weierstrass theorem makes $g$ holomorphic there. Inversion is continuous in the isometry group, so the same argument applies to $g^(- 1)$.
  #emph[A locally compact unitary extension.] Let $J$ be the closure of the simultaneous image of $Gamma$ in $I times U \( cal(B) \)$, with the strong group topology on the unitary factor. Every $\( g \, A \) in J$ satisfies $A iota \( z \) = iota \( g z \)$ projectively, by continuity. The projection $J arrow.r I$ is proper and surjective. For properness, suppose that the isometry components of a sequence converge. Choose countably many unit vectors in coefficient lines whose span is dense in $cal(B)$. The images of each such vector lie in convergent projective lines. Compactness of the scalar circle gives a convergent subsequence of the unit vectors. Diagonal extraction, performed also for inverse operators, gives strong convergence to a unitary operator. This proves properness, since the spaces involved are metrizable. The image is consequently closed and contains the dense $Gamma$-image, proving surjectivity.
  The kernel is a closed subgroup of the scalar circle. A kernel element preserves every coefficient line; a unitary operator has the same eigenvalue on two nonorthogonal eigenlines. Nearby lines are nonorthogonal, so connectedness of $Z$ makes this scalar the same everywhere. Their span is all of $cal(B)$. It follows that $J$ is locally compact. It has no small subgroups: use such a neighborhood in the Lie quotient $I$, then one in the scalar kernel. The locally compact no-small-subgroups theorem therefore makes $J$ a Lie group #cite(label("Tao2014")) author’s version, Corollary 1.5.8.
  Its adjoint representation, complexified, has finite image on $Gamma$, by Lemma 20. Pass to its kernel in $Gamma$, and replace both $I$ and $J$ by the corresponding closures. They are open finite-index subgroups of the old closures, with unchanged identity components; $J arrow.r I$ remains surjective and proper. The $Q$-cover and the map $F$ are unchanged. Every element of the new $J$ centralizes $J^compose$, since its conjugation has identity differential on the connected group. In particular, $J^compose$ is abelian.
  #emph[Spectral projection of holomorphic data.] The spectral theorem for the continuous unitary representation of the connected abelian Lie group $J^compose$, in its commutative $C^(*)$-algebra formulation #cite(label("Williams2007")), gives a direct integral
  $ cal(B) = integral^xor cal(B)_chi thin upright(d) mu \( chi \) \, #h(2em) t \|_(cal(B)_chi) = chi \( t \) "Id" . $
  We take $mu$ finite, as is possible because $cal(B)$ is separable. Because $Gamma$ centralizes $J^compose$, its operators are decomposable in this integral #cite(label("Williams2007")). Write $j_gamma$ for the simultaneous image of $gamma$ in $J$, and put
  $ D = { j_gamma : gamma in Gamma } ∩ J^compose . $
  Countability of $Gamma$ allows the group identities to hold on one common full-measure set, giving unitary representations $rho_chi$ of $Gamma$. On that set we also impose the countably many identities
  $ rho_chi \( gamma \) = chi \( j_gamma \) "Id" #h(2em) upright("when ") j_gamma in D . $
  We explain carefully how the holomorphic tensors pass to these fibres. These are almost-everywhere decompositions of a countable family of Taylor coefficients; no bounded point-evaluation projection from the direct integral is asserted. Let $pi.alt : U^compose arrow.r Z$ be the submersion. Choose a countable uniformizing atlas for $cal(Y)_Gamma$ and all its lifts to the $Q$-cover, still a countable family. Choose also local nonvanishing holomorphic vector representatives $v_alpha$ of $iota$ on a countable cover of $Z$. On a source polydisc mapping into the domain of $v_alpha$, the finitely many tensor coefficients satisfy vector identities
  $ tau_a \( x \) = c_a \( x \) v_alpha \( pi.alt \( x \) \) \, $
  with holomorphic scalar functions $c_a$, obtained after shrinking by applying a bounded functional nonzero on $v_alpha$. On suitable overlap domains the equivariance identities have the form
  $ v_beta \( gamma z \) = c_(gamma \, alpha beta) \( z \) rho \( gamma \) v_alpha \( z \) \, $
  where $c_(gamma \, alpha beta)$ is a holomorphic unit. Here $rho$ is the selected unitary representation of $Gamma$. These identities are kept as vector identities before projectivizing.
  Expand the tensor coefficients and the $v_alpha$ in Hilbert-valued power series. On every strictly smaller polydisc the sums of coefficient norms times the monomial radii are finite. Cauchy–Schwarz in the spectral variable, followed by Tonelli, gives the corresponding absolute sums in $cal(B)_chi$ for almost every $chi$. The projected series are therefore holomorphic there. After restricting to countably many smaller overlap polydiscs, normal convergence permits composition with the fixed coordinate maps and multiplication by the scalar functions above term by term. For each resulting coefficient sum, its partial sums converge in the direct-integral norm, while its fibre series converges absolutely almost everywhere. A subsequence converging almost everywhere identifies the two limits. There are only countably many such sums and Taylor-coefficient identities, including the tensor transition and orbifold isotropy identities. They therefore hold, together with the group identities above, on one common full-measure set and give global holomorphic tensors on $cal(Y)_Gamma$ of coefficient rank at most one, and holomorphic projective maps
  $ F_chi : Z \\ E_chi arrow.r bb(P) \( cal(B)_chi \) $
  of rank at most $s$, where $E_chi$ is the common zero locus of the projected representatives.
  The countable family of Taylor coefficients of the tensor on the lifted charts has closed span $cal(B)$: the series give all coefficient values, while Cauchy integrals express their coefficients as limits of linear combinations of those values. The orthogonal projection onto the fibrewise complement of the projected coefficient spans is a measurable field, obtained by countable Gram–Schmidt orthogonalization. Its direct integral annihilates this dense family and is therefore zero. Thus the projected Taylor coefficients span $cal(B)_chi$ almost everywhere. By the same series and Cauchy formulas, so do the projected coefficient values. On every nonzero such spectral fibre the projected tensor is therefore nonzero, has generic coefficient rank one, and is a line tensor whose coefficient lines span $cal(B)_chi$. We henceforth restrict to these nonzero fibres.
  #emph[The identity component cannot move an image germ.] The subgroup $D$ is dense in $J^compose$, since that component is open. It acts by the character $chi$ on each spectral fibre, so $F_chi$ is invariant under its action on $Z$. The closed analytic set $E_chi$ is invariant as well. Continuity extends both invariances to $J^compose$.
  Suppose that $J^compose$ acts nontrivially on $Z$. If some $F_chi$ had rank $s$ at $z in.not E_chi$, a finite-dimensional target projection of full rank and the inverse function theorem would make $F_chi$ locally injective at $z$. The connected $J^compose$-orbit of $z$ stays in the domain and in its fibre by invariance. The point $z$ is isolated in that fibre, and its singleton is open there by isolation and closed because $Z$ is Hausdorff. The orbit is therefore ${ z }$. Applying this at every point of the nonempty open full-rank locus, each element of $J^compose$ fixes that open set. It is holomorphic, so the identity theorem on connected $Z$ makes it the identity everywhere, a contradiction. Thus every $F_chi$ has rank strictly less than $s$. Minimality of $s$ then forces $cal(B)_chi$ to be finite-dimensional almost everywhere. By Lemma 20, $rho_chi \( Gamma \)$ is finite. The character $chi$ consequently has finite image on the dense subgroup of $J^compose$ just used. Continuity and connectedness force $chi$ to be trivial on $J^compose$. Hence $J^compose$ acts trivially on $cal(B)$. It then acts trivially on $Z$: each orbit maps to a point under the immersion $iota$, and is connected. This contradicts the assumed nontrivial action.
  We have proved that $J^compose$ acts trivially on $Z$. The surjective proper Lie-group homomorphism $J arrow.r I$ maps identity component onto identity component; since $I$ is an effective isometry group, $I^compose = { 1 }$. Thus $I$ is discrete and acts properly.
  Its $Gamma$-image is infinite. Otherwise a finite-index subgroup would fix every image germ and would act on $cal(B)$ by scalars. Its scalar character has finite image; on a further finite orbifold cover the tensor would be untwisted. An untwisted Hilbert-valued tensor on a compact orbifold has finite-dimensional coefficient span: its scalar tensor space is finite-dimensional, and expansion in a basis writes the tensor as a finite sum of scalar tensors times fixed Hilbert vectors. This contradicts our choice of the line tensor. ◻
]

=== 4.4 Compact fibres from transverse volume <compact-fibres-from-transverse-volume>

Discrete monodromy gives a genuine quotient of the image-germ manifold. To use minimality, its local fibres must determine compact subvarieties with finite group image. The following argument obtains these subvarieties from the mass of the positive current; only the source is assumed compact.

#thm([Lemma 4.7.])[
  #emph[Let $V$ be a connected smooth compact Kähler manifold of dimension $d$, and let $V^compose$ be the complement of a proper analytic subset. Let a discrete group $I$ act properly and effectively by holomorphic isometries on a connected Kähler manifold $Z$ of dimension $s > 0$. Suppose that $f : V^compose arrow.r Z \/ I$ has local holomorphic lifts to $Z$ of rank $s$, whose continuation is compatible with a homomorphism $rho : pi_1 \( V \) arrow.r I$. If a positive closed $\( 1 \, 1 \)$-current on $V$ restricts to a positive constant multiple of $f^(*) omega_Z$, then 
#[#set math.equation(numbering: n => "(35)")
 $ "gdim" \( V \, rho \) lt.eq s . $ <hi:gamma-upper-bound>]

]
] <hi:compact-fibres>

#proof[
  Let $T$ be the current and let $omega$ be a Kähler form on $V$. The mass of $T^s and omega^(d - s)$ on $V^compose$ is finite; this is the positive-current mass bound #cite(label("Boucksom2002")). One can see the bound directly by writing $T = alpha + upright(d) upright(d)^c phi$, choosing $C$ with $beta = alpha + C omega > 0$, and truncating $phi_j = max \( phi \, - j \)$. The bounded-potential products satisfy
  $ integral_V \( beta + upright(d) upright(d)^c phi_j \)^s and omega^(d - s) = integral_V beta^s and omega^(d - s) . $
  On ${ phi > - j } ∩ V^compose$ they equal $\( T + C omega \)^s and omega^(d - s)$, which dominates $T^s and omega^(d - s)$. Exhaustion gives the bound.
  Use the free locus of the orbifold $Z \/ I$ for the coarea formula. The discarded isotropy values, and their inverse images under the local submersions, have measure zero. With normalized volumes,
  $ f^(*) frac(omega_Z^s, s !) and frac(omega^(d - s), \( d - s \) !) = J_f thin frac(omega^d, d !) \, $
  where $J_f$ is the real normal Jacobian. Its value is the product of the squared nonzero complex singular values of the differential. The coarea formula and the mass bound show that almost every fibre has finite $\( d - s \)$-dimensional complex volume in $V^compose$. The formula is applied to a countable disjoint measurable decomposition subordinate to target charts, so it counts whole fibres and requires neither compactness nor bounded geometry of the target. Moreover, this yields a full-measure set of source points: the inverse image of the exceptional null set has integral of $J_f$ equal to zero, and $J_f > 0$ on the submersion locus.
  For a good free value, its fibre is closed analytic and pure of dimension $d - s$ in $V^compose$. Its integration current has finite mass. Extension by zero across $V \\ V^compose$ is positive and closed, by the extension theorem of El Mir #cite(label("ElMir1984")). Siu’s analyticity theorem for positive Lelong superlevel sets #cite(label("Siu1974")) then makes its closure analytic of pure dimension $d - s$: the level set with Lelong number at least one contains the fibre, has dimension at most $d - s$, and agrees with the smooth fibre on $V^compose$. Take its components meeting $V^compose$. Equivalently, one may apply the finite-volume closure theorem directly #cite(label("ElMir1984")).
  Let $tilde(C) arrow.r C$ resolve one such closure component. The preimage of $C ∩ V^compose$ has proper analytic complement in the smooth manifold $tilde(C)$, and its inclusion induces a surjection on fundamental groups: every loop may be perturbed off an analytic set of real codimension at least two. Along the open fibre the continued lift to $Z$ is constant. Thus its monodromy fixes one point of $Z$, and lies in a finite stabilizer. The same is true of the image of $pi_1 \( tilde(C) \)$, by that surjection.
  The $Gamma$-reduction contracts these compact subvarieties through very general points, by Theorem 8. The full-measure set just obtained meets the complement of its countable union of proper analytic exceptional sets. Its general fibres consequently have dimension at least $d - s$, proving (35). ◻
]

=== 4.5 Descent of the big line <descent-of-the-big-line>

#proof[
  Choose the minimal line tensor and the finite-index subgroup $Gamma$ of Proposition 24. Let $cal(L)$ and its positive curvature current be as in Lemma 23. The current has rank $s$ on the regular open set.
  Suppose that $s < ell$. Apply (M) with $Q_0 = Gamma$, obtaining $S'$ with image $Q' subset Gamma$. The map $S' arrow.r.dashed Y$ lifts meromorphically to the coarse space of $cal(Y)_Gamma$. Indeed, the monodromy condition gives a lift on the complementary open set; the selected component of the normalized finite pullback extends its graph. Resolve this map on a smooth compact Kähler modification $V$ of $S'$.
  The descended power of $cal(L)$ pulls back to an ordinary line bundle on $V$. Its psh weights pull back, since the map is dominant, giving a positive current. On a regular analytic Zariski-open subset the local coefficient-line maps give
  $ V^compose arrow.r Z \/ I $
  of rank $s$, with monodromy the composite $pi_1 \( V \) arrow.r Q' arrow.r I$. The pulled-back current is a positive constant multiple of its transverse Kähler form. Lemma 25 gives a $Gamma$-dimension at most $s$. The image of $Q'$ in $I$ is infinite: it has finite index in the infinite image of $Gamma$. This image is an infinite quotient to which (M) applies. Bimeromorphic invariance of the $Gamma$-reduction therefore gives a dimension at least $ell$, a contradiction. Hence $s = ell$.
  Take a finite Galois orbifold cover $hat(cal(Y)) arrow.r cal(Y)$ dominating $cal(Y)_Gamma$, and pull $cal(L)$ to it. If $G$ is its deck group, form
  $ cal(M) = ⨂_(gamma in G) gamma^(*) cal(L) . $
  The permutation action gives a canonical $G$-linearization. All its factors inject into the pullback of the same cotangent tensor bundle. Multiplication in the symmetric algebra gives a nonzero morphism from $cal(M)$ to the $\| G \|$-th symmetric power of that tensor bundle, and hence into a cotangent tensor power. It is nonzero because a product of nonzero vectors in a symmetric algebra is nonzero. Equivariant descent gives an orbifold line $cal(M)_0$ and a nonzero cotangent-tensor morphism on $cal(Y)$.
  The tensor product of the translated metrics is invariant. Its curvature is positive and strictly positive on a nonempty open set, since $s = ell$. A power of $cal(M)_0$ kills the chart stabilizers and descends to an ordinary line bundle $A$ on $Y$ with the same positivity property. The volume criterion #cite(label("Boucksom2002")) author’s preprint, Theorem 1.2 makes $A$ big. The Iitaka map of a big line bundle makes $Y$ Moishezon. The projectivity theorem for Kähler Moishezon manifolds #cite(label("Moishezon1967")) therefore makes $Y$ projective.
  It remains to interpret the tensor inclusion on an adapted projective cover. Choose the smooth Galois Kawamata cover $pi : Y' arrow.r Y$ supplied by #cite(label("CampanaPaun2019")) Lemma 5.2. It is projective, being finite over $Y$, and its ramification order over $D_i$ is exactly the denominator $m_i$. Near that component the root chart and the cover are $z_i = u_i^(m_i) = w_i^(m_i)$. Choosing the local root lift $u_i = w_i$, the cotangent generator pulls back as
  $ upright(d) u_i = upright(d) w_i . $
  Along an auxiliary ramification divisor $z_j = w_j^(a_j)$, the orbifold coefficient is zero and the generator is $upright(d) z_j = a_j w_j^(a_j - 1) upright(d) w_j$. These are precisely the local generators of the adapted orbifold cotangent bundle in #cite(label("CampanaPaun2019")) Definition 5.3. Thus a suitable tensor power of the descended inclusion gives a nonzero map
  $ pi^(*) A arrow.r #scale(x: 120%, y: 120%)[\(] pi^(*) Omega^1 \( Y \, Delta \) #scale(x: 120%, y: 120%)[\)]^(⊗ M) $
  on this projective adapted cover. The big-line criterion for orbifold cotangent tensors #cite(label("CampanaPaun2019")) Theorem 7.11 now implies that $K_Y + Delta$ is big. Its hypotheses are satisfied because projectivity and the ordinary big line $A$ have already been established. No pseudoeffectivity assumption is needed in that criterion. ◻
]

== 5 Inertia and descent over a torus <sec:descent>

We attach boundary coefficients to the orders of meridians in a fixed group quotient. These orders also control components whose images are exceptional for an intermediate map. Keeping them on every model will allow us to descend positivity from the fibres over a torus.

=== 5.1 Meridian orders and differential pullback <meridian-orders-and-differential-pullback>

Let $c : M arrow.r.dashed Z$ be a fibration from a smooth compact Kähler manifold, and let $rho : pi_1 \( M \) arrow.r.twohead R$ kill the image of the group of a smooth general $c$-fibre. Replace the source and target by smooth models so that $c$ is holomorphic, and choose an analytic Zariski open $Z^compose$ over which it is smooth. The homotopy sequence of the smooth fibration gives a homomorphism

$ psi : pi_1 \( Z^compose \) arrow.r R $

compatible with $rho$. It is surjective: the open source maps surjectively on the fundamental group of the compact source. The homomorphism is independent of a further shrinking, in this compatibility sense.

For a prime divisor $D$ on the smooth base, let $m_D$ be the order in $R$ of a meridian about its general point. Meridians are defined up to conjugacy, which does not affect their orders. Set $m_D = 1$ for divisors outside the deleted locus. Every $m_D$ is finite. Indeed, if a component $E$ of $c^(*) D$ dominates $D$ with multiplicity $e > 0$, a small transverse disc at a general point of $E$ has boundary mapping to a conjugate of the $e$-th power of the meridian. This boundary contracts in the compact source, so its image under $rho$ is trivial.

#prodef([Definition 5.1.])[
  The #emph[inertial boundary] associated with $rho$ on this model of $Z$ is
  $ Delta_Z = sum_D \( 1 - m_D^(- 1) \) D . $
  A #emph[prepared model] is a smooth compact Kähler base model, together with a resolved source, on which the divisorial deleted locus has simple normal crossings. If a map to a fixed torus is present, the model is required to map holomorphically to that torus.
] <de:inertial-boundary>

There are only finitely many nonzero coefficients on a fixed model. The pair $\( Z \, Delta_Z \)$ on a prepared model is klt. Preparation uses resolution of the graph and discriminant; further smooth modifications can again be prepared. The orders on all these models refer to the same quotient $R$. In particular, the strict transform of a divisor has the same order. No invariance of $kappa \( Z \, K_Z + Delta_Z \)$ under modification is assumed. A collection of prepared models is #emph[cofinal] if every prepared model is dominated by a member through a holomorphic modification.

#thm([Lemma 5.2.])[
  (Inertia over a smooth intermediate map).  #emph[Let $f : X arrow.r Z$ be a dominant holomorphic map of connected smooth complex manifolds. Suppose that a homomorphism $rho : pi_1 \( X \) arrow.r R$ is compatible, over a dense analytic Zariski open $Z^compose$, with a homomorphism $psi : pi_1 \( Z^compose \) arrow.r R$. Let $p : Z arrow.r W$ be a smooth proper surjective map with connected fibres, with $W$ smooth. Assume that the nontrivial divisorial meridian orders of $psi$ give the boundary 
$ Delta_Z = p^(*) Delta_W \, #h(2em) Delta_W = sum_D \( 1 - m_D^(- 1) \) D \, #h(2em) m_D in bb(Z)_(gt.eq 2) . $

 Thus every other divisorial meridian has trivial image. If a prime divisor $E subset X$ dominates $D subset W$ under $p compose f$, then 
#[#set math.equation(numbering: n => "(36)")
 $ m_D divides "ord"_E #scale(x: 120%, y: 120%)[\(] \( p compose f \)^(*) D #scale(x: 120%, y: 120%)[\)] . $ <de:all-component-divisibility>]

 This includes the case in which $f \( E \)$ is a proper subvariety of $p^(- 1) \( D \)$.]
] <de:inertia-divisibility>

#proof[
  Take a general point $w in D$, avoiding its singularities and the other components of $Delta_W$. The divisor $p^(- 1) \( D \)$ is smooth near every point over $w$. Fix such a point $z$, and a small coordinate ball $U$ around it. In this ball the only nontrivial inertial support is the smooth hypersurface $p^(- 1) \( D \) ∩ U$.
  The map from the fundamental group of the original deleted-locus complement in $U$ to $pi_1 \( U \\ p^(- 1) \( D \) \)$ is surjective. Its kernel is normally generated by meridians around the other deleted divisors: a transverse perturbation of a null homotopy gives precisely these meridians. Their $R$-images are trivial. Removing the remaining analytic subsets of complex codimension at least two does not change this fundamental group, by the same transverse perturbation applied to loops and homotopies. Consequently $psi$ factors locally through
  $ pi_1 \( U \\ p^(- 1) \( D \) \) tilde.equiv bb(Z) . $
  At a general point of $E$ over $w$, choose a transverse disc whose punctured part avoids all deleted inverse images. Its image winds $e = "ord"_E \( \( p compose f \)^(*) D \)$ times around the one remaining hypersurface. Its boundary contracts in $X$, so compatibility with $rho$ gives $psi \( mu \)^e = 1$. The order of $psi \( mu \)$ is $m_D$, proving (36). ◻
]

The next consequence will also be used directly for the Albanese map. It handles the source divisors whose images have codimension at least two by decreasing the boundary on a fixed torus.

#thm([Lemma 5.3.])[
  (A small ample boundary on a torus).  #emph[Let $u : X arrow.r B$ be a surjective holomorphic map from a smooth compact Kähler manifold to a positive-dimensional complex torus. Let $Delta = sum_D \( 1 - m_D^(- 1) \) D$ be an ample rational divisor on $B$, with integers $m_D gt.eq 2$. Suppose that 
$ m_D divides "ord"_E \( u^(*) D \) $

 for every prime divisor $E$ dominating $D$ under $u$. Then $X$ is not special.]
] <de:small-boundary>

#proof[
  Put $r = dim B$, and let $cal(L) subset Omega_X^r$ be the saturated differential line of $u$. For a local nonvanishing generator $eta$ of $K_B$, write $a_E$ for the common divisorial vanishing order of $u^(*) eta$ along $E$, measured in $cal(L)$, and put $v_E = "ord"_E \( u^(*) Delta \)$. If $E$ dominates a component $D$, with multiplicity $e$, the local differential of a defining function of $D$ gives
  $ a_E gt.eq e - 1 gt.eq e \( 1 - m_D^(- 1) \) = v_E . $
  If $u \( E \)$ has codimension at least two, the tangent rank along $E$ is at most $r - 2$, and the normal direction increases it by at most one. Thus every maximal minor of $upright(d) u$ vanishes along $E$, and $a_E gt.eq 1$.
  The pullback of the fixed divisor $Delta$ has finitely many prime components on $X$. We may therefore choose a rational $epsilon.alt > 0$ such that $epsilon.alt lt.eq 1$ and
  $ epsilon.alt v_E lt.eq a_E quad upright("for every prime divisor ") E subset X . $
  Only components with $v_E > 0$ impose a condition. This choice also handles components whose images lie in intersections of boundary divisors, since their $v_E$ includes the sum of all pullback coefficients.
  The torus has trivial canonical bundle. For divisible $m$, pullback of a section of $m epsilon.alt Delta$, multiplied by the $m$-th power of its top differential, is thus a holomorphic section of $cal(L)^(⊗ m)$. The inequality above checks every divisorial pole; extension across codimension two finishes the check. The ratios of these sections retain the $r$ parameters of the ample linear systems on $B$. Hence $kappa \( X \, cal(L) \) gt.eq r$, and Theorem 6 gives equality. This contradicts specialness. ◻
]

#prodef([Remark 5.4.])[
  The vanishing just used concerns the top differential of the fixed map $u : X arrow.r B$. Saturation records its common vanishing in the map $u^(*) K_B arrow.r cal(L)$. It does not assert that arbitrary lower-degree forms vanish on exceptional divisors of a modification; that distinction is relevant to #cite(label("CampanaCorrection")) Remark 2.2.
] <de:fixed-map-vanishing>

We will use the corresponding pullback statement on a neat model. A prime divisor is $u$-exceptional when its image has codimension at least two. The needed preparation is a smooth fibration model $u : hat(X) arrow.r W$, with a modification $nu : hat(X) arrow.r X$ to a smooth source model, such that every $u$-exceptional divisor is $nu$-exceptional. Such models exist after modifying the base; see #cite(label("JWang2021")) Lemma 1.4, whose base and source modifications are projective morphisms. A projective initial base therefore remains projective. Concretely, flatten the strict transform over a modification of the base and then resolve it. The flat strict transform has no divisors mapping into codimension at least two. Any such divisor introduced by the final resolution is exceptional over the original source.

#thm([Lemma 5.5.])[
  (Pullback on a neat model).  #emph[Let $u : hat(X) arrow.r W$ and $nu : hat(X) arrow.r X$ be as above, with $X$ smooth compact Kähler and $W$ smooth of dimension $r > 0$. Let $Delta_W = sum_D \( 1 - m_D^(- 1) \) D$, with $m_D gt.eq 2$. Suppose that $K_W + Delta_W$ is big and that $m_D$ divides $"ord"_E \( u^(*) D \)$ for every component $E$ dominating $D$. Then $X$ is not special.]
] <de:neat-pullback>

#proof[
  Let $cal(L) subset Omega_X^r$ be the saturated differential line of the meromorphic map induced by $u$. A section of a divisible multiple of $K_W + Delta_W$ pulls back as a meromorphic section of $cal(L)^(⊗ m)$. Along a component of multiplicity $e$ over $D$, its allowed pole is cancelled because
  #[#set math.equation(numbering: n => "(37)")
   $ e - 1 gt.eq e \( 1 - m_D^(- 1) \) . $ <de:differential-cancellation>]
  Divisors dominating $W$ produce no boundary pole. The remaining source divisors are $u$-exceptional and hence disappear in codimension at least two on $X$. Every prime divisor of $X$ therefore satisfies the holomorphicity condition. Extension across codimension two gives
  $ H^0 #scale(x: 120%, y: 120%)[\(] W \, m \( K_W + Delta_W \) #scale(x: 120%, y: 120%)[\)] arrow.r.hook H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(L)^(⊗ m) #scale(x: 120%, y: 120%)[\)] . $
  Pullback preserves the ratios of sections because the map is dominant. Bigness gives $kappa \( X \, cal(L) \) gt.eq r$, and Theorem 6 again gives the forbidden equality. ◻
]

=== 5.2 Two comparisons of models <two-comparisons-of-models>

#thm([Lemma 5.6.])[
  #emph[Let $mu : Z' arrow.r Z$ be a modification between smooth base models of the same fibration and quotient. For sufficiently divisible $m$, there is a natural injection 
$ H^0 #scale(x: 120%, y: 120%)[\(] Z' \, m \( K_(Z') + Delta_(Z') \) #scale(x: 120%, y: 120%)[\)] arrow.r.hook H^0 #scale(x: 120%, y: 120%)[\(] Z \, m \( K_Z + Delta_Z \) #scale(x: 120%, y: 120%)[\)] . $

]
] <de:birational-pushdown>

#proof[
  View a section upstairs as a meromorphic pluricanonical form in the common function field. Every prime divisor of $Z$ has a strict transform with the same meridian order. Its divisorial pole bound is therefore the required bound on $Z$. Extension across codimension two gives the section downstairs, and the function-field identification makes this map injective. ◻
]

Now suppose $c : M arrow.r.dashed Z$ lies over a torus $A$, and let $B_c$ be the image of its general fibre group. Use $R = pi_1 \( M \) \/ B_c$. An isogeny $A' arrow.r A$ induces a subgroup $G' lt.eq G = pi_1 \( M \)$ containing the kernel of $G arrow.r pi_1 \( A \)$, hence containing $B_c$. General $c$-fibres lift unchanged to the source cover. The induced quotient is consequently

#[#set math.equation(numbering: n => "(38)")
 $ R' = G' \/ B_c med arrow.r.hook med G \/ B_c = R . $ <de:quotient-inclusion>]

On corresponding pulled-back base models, meridians lift with winding number one. Their lattice image is zero, so their images lie in $R'$, and (38) preserves their orders. Thus both the canonical divisor and the true inertial boundary pull back under this finite unramified base change.

#thm([Lemma 5.7.])[
  (Restriction to common general fibres).  #emph[Let $g : Z arrow.r A$ and $h : Z arrow.r W$ be surjective holomorphic maps with connected general fibres between compact complex manifolds, with $Z$ smooth. Let $L$ be a rational line bundle whose restriction to a very general smooth $g$-fibre is big. Then $L$ restricts big to every component of a general fibre of the map 
$ \( h \, g \) : Z arrow.r J subset.eq W times A \, $

 where $J$ denotes its image. Equivalently, one may first take a very general $h$-fibre $H$, and then a general fibre of $g \|_H$ over its image. No equality $g \( H \) = A$ is required.]
] <de:common-fibres>

#proof[
  For each divisible $m$, properness gives the coherent direct image $g_(*) cal(O)_Z \( m L \)$. Choose a very general smooth fibre where base change holds for all these countably many sheaves. Bigness on that fibre supplies one $m$ for which its section map has full generic rank. On the open set where the direct image is locally free and base change holds, evaluation defines the relative meromorphic map to its projective bundle. The locus where its vertical differential has full rank contains a dense analytic Zariski open $U subset Z$. This condition is intrinsic to the relative evaluation and jet maps, so it is defined over the base open, independently of a local frame of the direct image.
  A general fibre component of $Z arrow.r J$ meets $U$. Otherwise the proper analytic subset $Z \\ U$ would contain a general component of a family of fibres covering $Z$, contrary to the fibre-dimension theorem. On such a component the relative section map still has injective differential at a general point: its tangent space is contained in the vertical tangent space of $g$. The restrictions of these sections therefore define a generically finite meromorphic map, proving bigness. General choices in $J$, followed by general choices in its projection to $W$, give the last formulation. All assertions can be restricted to the smooth loci supplied by generic smoothness. ◻
]

=== 5.3 Descent of positivity <descent-of-positivity>

#thm([Theorem 5.8.])[
  (Descent over a torus).  #emph[Let $M$ be a special smooth compact Kähler manifold, and let $alpha : M arrow.r A$ be a surjective map to a complex torus with connected fibres. Suppose that 
$ M arrow.r.dashed Z arrow.r^g A $

 is a factorization by fibrations, and that $d = dim Z - dim A > 0$. On every prepared model of $Z$, take the inertial boundary for 
$ R = pi_1 \( M \) \/ "Im" #scale(x: 120%, y: 120%)[\(] pi_1 \( F_c \) arrow.r pi_1 \( M \) #scale(x: 120%, y: 120%)[\)] \, $

 where $F_c$ is a smooth general fibre of $M arrow.r.dashed Z$. It is impossible that, on a cofinal collection of prepared models, $K_Y + Delta_Z \|_Y$ is big for a very general $g$-fibre $Y$. The torus $A$ is allowed to be a point.]
] <thm:torus-descent>

#proof[
  Assume the stated bigness on the cofinal collection. We may further prepare a model whenever necessary. By Theorem 10, every model in this collection satisfies
  #[#set math.equation(numbering: n => "(39)")
   $ kappa \( Z \, K_Z + Delta_Z \) gt.eq d . $ <de:minimum>]
  Choose a model $Z_0$ for which this integer is minimal, and put $b = kappa \( Z_0 \, K_(Z_0) + Delta_(Z_0) \)$. Then $b gt.eq d > 0$.
  #emph[The Iitaka fibres.] Resolve the Iitaka map on a modification $mu : Z_1 arrow.r Z_0$, obtaining a fibration $h : Z_1 arrow.r W$ with $W$ smooth projective of dimension $b$. For this step introduce an auxiliary klt boundary $Delta_1$. It has the strict-transform coefficients of $Delta_(Z_0)$ and exceptional coefficients sufficiently close to one to dominate the true inertial coefficients on $Z_1$. They may also be chosen so that
  #[#set math.equation(numbering: n => "(40)")
   $ K_(Z_1) + Delta_1 = mu^(*) \( K_(Z_0) + Delta_(Z_0) \) + E \, #h(2em) E gt.eq 0 upright(" is ") mu upright("-exceptional") . $ <de:auxiliary-boundary>]
  Indeed all discrepancies of the log-smooth klt pair are greater than $- 1$; an exceptional coefficient less than one can be chosen above the negatives of these discrepancies and above the corresponding inertial coefficient. A simultaneous log resolution makes all the supports simple normal crossing.
  Equation (40) preserves sections in divisible degrees, hence the Iitaka dimension and map. A very general smooth $h$-fibre $H$ consequently satisfies
  #[#set math.equation(numbering: n => "(41)")
   $ kappa #scale(x: 120%, y: 120%)[\(] H \, K_H + Delta_1 \|_H #scale(x: 120%, y: 120%)[\)] = 0 . $ <de:iitaka-fibre>]
  Here we use the ordinary Iitaka-fibre property, as in #cite(label("JWang2021")) Section 6.3. It can also be seen directly in this setting. Write $L = K_(Z_1) + Delta_1$. By Kodaira’s lemma on the projective Iitaka base, after taking a further multiple and absorbing the pullback of the effective remainder, the resolved system gives $a L tilde.op h^(*) B + E$ for some divisible $a > 0$, with $B$ ample on $W$ and $E gt.eq 0$. If a multiple $j L \|_H$ had a positive-dimensional section map on a very general fibre, coherent direct image and base change, followed by a sufficiently large ample twist $h^(*) \( k B \)$, would extend sections whose ratios vary on that fibre. Multiplication by the canonical section of $k E$ turns them into sections of $\( j + k a \) L$. This fibrewise variation, together with the $b$ base parameters supplied by $B$, contradicts $kappa \( Z_1 \, L \) = b$. The restriction has a nonzero section because a general fibre is not contained in $E$, so its Iitaka dimension is zero. Adjunction identifies $L \|_H$ with the divisor appearing in (41).
  We can arrange that a very general fibre of $g : Z_1 arrow.r A$ has big restriction of $K_(Z_1) + Delta_1$. For example, dominate $Z_1$ by a prepared member of the cofinal collection, perform the same auxiliary-boundary construction relative to $Z_0$, and replace $Z_1$ by this model. Its map to $W$ is already holomorphic. The auxiliary boundary dominates its true boundary, whose fibre adjoint is big by assumption. Any further log resolution preserves this fibre bigness by pullback and an effective exceptional remainder, and (40) still holds. Lemma 32 now makes the log canonical divisor big on general components of common fibres of $h$ and $g$. Generic smoothness, also for the finitely many boundary strata, justifies the adjunction restrictions to these common fibres.
  Apply Theorem 10 to the klt pair in (41). Its Albanese map is surjective with connected fibres. The map $g \|_H$ factors through a homomorphism from $"Alb" \( H \)$ to $A$, followed by a translation. Quotienting by the connected kernel shows that its Stein base is a torus finite étale over its image subtorus translate. Torus subadditivity on $H$, using the bigness of the common fibres, forces their dimension to be zero. The Albanese map of $H$ is therefore birational, and $g \|_H$ is, birationally, an isogeny onto a subtorus translate.
  Every component of $Delta_1 \|_H$ is exceptional for this birational Albanese map. To prove this, suppose that a component maps onto a divisor $D$ of the torus. The relative canonical divisor of the birational map to the smooth torus is effective, with positive coefficients on all exceptional primes. For sufficiently small rational $epsilon.alt > 0$, it absorbs the exceptional components of the pullback of $epsilon.alt D$, while the chosen boundary component supplies its strict transform. Thus $K_H + Delta_1 \|_H$ contains that pullback up to rational linear equivalence. By Lemma 7, a nonzero effective divisor on a complex torus has positive Iitaka dimension. This contradicts (41).
  #emph[A torus-bundle model.] On the connected smooth parameter open of $h$, the image of $H_1 \( H \, bb(Z) \)$ in $H_1 \( A \, bb(Z) \)$ is locally constant. Transport in the proper smooth family and the total map to $A$ identify these images. Their real span determines a fixed subtorus $T subset A$, so the image of a general $H$ is a translate of $T$. Write $Lambda_T$ for its lattice and $L_H$ for the finite-index image lattice. Choose $k > 0$ with $k Lambda_T subset.eq L_H$, and use the isogeny $A_1 arrow.r A$ given by multiplication by $k$.
  Let $T_1$ be the identity component of the inverse image of $T$. The lattice of a subtorus is primitive in the ambient lattice, so the image of the lattice of $T_1$ is $k Lambda_T$. The choice of $k$ makes each connected lifted general $H$-fibre map with degree one onto a translate of $T_1$. This is a lattice construction; no splitting of the torus extension is required.
  Pull back both the source and $Z_1$ to $A_1$. These covers are connected, since the original maps to $A$ are surjective with connected fibres and therefore surject on $pi_1 \( A \)$. Write $M_1$ for the source cover. The Stein factorization of the pulled-back map to $W$ has a finite base over $W$; take a smooth projective model $W_1$ of that base. The map to $A_1 \/ T_1$ is constant on its general fibres and hence descends meromorphically to $W_1$. Resolve this map as well. The pair of projection maps then gives a birational model
  #[#set math.equation(numbering: n => "(42)")
   $ Z_(*) = W_1 times_(A_1 \/ T_1) A_1 \, #h(2em) p : Z_(*) arrow.r W_1 . $ <de:torus-bundle>]
  Indeed it has degree one on the general fibres just described. The space $Z_(*)$ is smooth, and it is a closed submanifold of the compact Kähler product $W_1 times A_1$. The map $p$ is a principal holomorphic bundle with connected torus fibre $T_1$. Its transition functions are translations, so an invariant top form on $T_1$ trivializes the relative canonical bundle. In particular,
  #[#set math.equation(numbering: n => "(43)")
   $ K_(Z_(*)) = p^(*) K_(W_1) . $ <de:canonical-pullback>]
  We are free to replace $W_1$ by any further smooth projective modification and use its corresponding fibre product in (42).
  The true inertia on $Z_(*)$ has no horizontal divisor over $W_1$. To check this on a morphism of models, resolve the maps from the pulled-back $Z_1$ to $W_1$ and $Z_(*)$, and carry the auxiliary boundary by the rule (40). Its restriction to a general fibre still has only Albanese-exceptional components. Indeed finite étale covers of a birational torus are birational to torus covers. An exceptional prime on a further model either misses the general fibre or restricts to a divisor exceptional over the old general fibre, so it remains Albanese-exceptional. The strict transform of a horizontal prime of $Z_(*)$ maps onto a divisor of its general torus fibre. It cannot occur in this auxiliary boundary, which dominates true inertia. Its meridian order is therefore one.
  Every vertical prime divisor of the smooth bundle $p$ is the full inverse image of a prime divisor of $W_1$. A divisor cannot map into codimension at least two by the fibre-dimension formula, and connected smooth fibres are irreducible. We have consequently obtained a rational boundary $Delta_(W_1)$ with
  #[#set math.equation(numbering: n => "(44)")
   $ Delta_(Z_(*)) = p^(*) Delta_(W_1) \, $ <de:boundary-pullback>]
  with the same finite integral meridian orders on corresponding divisors.
  #emph[The true boundary is big downstairs.] Let $F$ denote the finite deck group of $A_1 arrow.r A$. Write $tilde(Z)_1 = Z_1 times_A A_1$ and let $phi.alt : tilde(Z)_1 arrow.r.dashed Z_(*)$ be the birational comparison. Take the closure of the simultaneous graph of $phi.alt compose f$, for $f in F$, in $tilde(Z)_1 times \( Z_(*) \)^F$. The group acts on this graph by its action on $tilde(Z)_1$ and permutation of the other factors. Resolve equivariantly and take a further equivariant Kähler modification using #cite(label("JiaMeng2024")) Theorem 1.1 in the author’s version; the finite group preserves the average of a big class. This gives a smooth Kähler $V$ mapping to $tilde(Z)_1$, to $Z_(*)$, and to $A_1$. The action is free because its map to $A_1$ is equivariant for the free translation action. The quotient $V \/ F$ is thus smooth Kähler and is a modification of $Z_1$, hence of $Z_0$, over the original torus $A$. Moreover, $V arrow.r V \/ F$ is the pullback of $A_1 arrow.r A$: each deck orbit maps bijectively onto the corresponding isogeny fibre.
  Further prepare this quotient, and, if necessary, dominate it by a member of the cofinal collection. Pull this modification back along $A_1 arrow.r A$; all comparison morphisms persist. We continue to call the resulting cover $V$. Its true inertial adjoint is the unramified pullback of that on its downstairs quotient, by (38). The minimum in (39) therefore gives
  $ kappa \( V \, K_V + Delta_V \) gt.eq b . $
  All boundaries in this inequality are true inertial boundaries; the auxiliary exceptional coefficients of $Delta_1$ are not used here. Lemma 31 applied to $V arrow.r Z_(*)$ gives the same lower bound on $Z_(*)$. Equations (43) and (44), together with $p_(*) cal(O)_(Z_(*)) = cal(O)_(W_1)$, now yield
  $ kappa \( W_1 \, K_(W_1) + Delta_(W_1) \) gt.eq b = dim W_1 . $
  Thus $K_(W_1) + Delta_(W_1)$ is big.
  This argument applies after any chosen further smooth projective modification of $W_1$: form its fibre product, repeat the equivariant comparison, and use the same minimum on the prepared quotient over $A$. The newly appearing true coefficients are read on the new model. No comparison of exceptional coefficients on unrelated models is needed.
  #emph[The differential contradiction.] Choose $W_1$ sufficiently modified that the induced fibration from a resolution of $M_1$ to $W_1$ is neat, as described before Lemma 30. The preceding argument still gives bigness on this choice. The source resolution maps holomorphically to $Z_(*)$, using its maps to $W_1$ and $A_1$. Its fundamental-group quotient is the one used to define the true inertia on $Z_(*)$. Lemma 27, with the smooth map $p$, shows that every boundary order on $W_1$ divides the multiplicity of every source component dominating that divisor. Lemma 30 therefore gives a Bogomolov sheaf on a smooth source model of $M_1$. This contradicts Theorem 6, since $M_1$ is a connected finite étale cover of the special manifold $M$. ◻
]

== 6 Albanese fibre groups and completion of the proof <sec:completion>

The remaining task is group-theoretic and geometric assembly: isolate the Albanese fibre-group image, establish the minimality hypotheses of the positivity theorem, and apply torus descent in both representation cases.

Let $X$ be special. If $dim X = 0$, its fundamental group is trivial, so assume $dim X > 0$. Every connected finite étale cover is special and has surjective Albanese morphism by Theorem 6. Its first Betti number is therefore at most $2 dim X$. Pass to a cover on which this number is maximal, and continue to denote the cover by $X$. Pullback on $H^1 \( - \, bb(Q) \)$ is injective by transfer, so any further connected finite étale cover has the same first Betti number. Write

$ alpha : X arrow.r A = "Alb" \( X \) \, #h(2em) G = pi_1 \( X \) \, #h(2em) N = "Im" #scale(x: 120%, y: 120%)[\(] pi_1 \( S \) arrow.r G #scale(x: 120%, y: 120%)[\)] \, $

where $S$ is a smooth general Albanese fibre. The group $N$ is finitely generated and normal. When $A$ is a point, these statements mean $S = X$ and $N = G$.

=== 6.1 Exactness over an arbitrary Albanese torus <exactness-over-an-arbitrary-albanese-torus>

#thm([Lemma 6.1.])[
  #emph[The natural sequence is exact: 
$ 1 arrow.r N arrow.r G arrow.r^(alpha_(*)) pi_1 \( A \) arrow.r 1 . $

]
] <lem:albanese-exactness>

#proof[
  Set $R = G \/ N$. Over the smooth fibration locus in $A$, fibrewise exactness gives a monodromy homomorphism to $R$, compatible with the quotient map on the total space. A meridian around a base divisor has finite order in $R$, since a component of its inverse image kills a positive power of that meridian. Form the actual inertial divisor $D_A$ using these orders, as in Section 5.
  Suppose $D_A eq.not 0$. Lemma 7 gives a quotient torus $p : A arrow.r B$ with connected fibres, where $B$ is an abelian variety of dimension $b > 0$, and an ample effective rational divisor $D_B$ such that $D_A = p^(*) D_B$. The smooth quotient map pulls back each prime divisor with multiplicity one, so the components of $D_B$ retain the meridian orders of their inverse images.
  Lemma 27, applied to the smooth torus bundle $A arrow.r B$, shows that each such order divides the multiplicity of #emph[every] prime divisor of $X$ dominating the corresponding divisor of $B$ under $p alpha$. This includes components whose images in $A$ have larger codimension. For prime divisors whose images in $B$ have codimension at least two, the top differential of $p alpha$ vanishes: at their general points its restriction to the divisor has rank at most $b - 2$, so the total rank is at most $b - 1$. There are only finitely many relevant components over the fixed support of $D_B$. Thus a sufficiently small rational $epsilon > 0$ makes their differential vanishing orders compensate the poles allowed by $epsilon D_B$. This is the fixed-map argument of Lemma 28.
  Let $L subset Omega_X^b$ be the saturated line generated by the top differentials from $B$. For sufficiently divisible $m$, pullback of pluriforms gives
  $ H^0 #scale(x: 120%, y: 120%)[\(] B \, m \( K_B + epsilon D_B \) #scale(x: 120%, y: 120%)[\)] arrow.r H^0 \( X \, L^(⊗ m) \) . $
  The pullback is injective, and ratios of sections retain their independence because $X arrow.r B$ is surjective. Since $K_B$ is trivial and $epsilon D_B$ is ample, $kappa \( X \, L \) gt.eq b$. The opposite inequality follows from Theorem 6. This contradicts specialness.
  All meridians therefore have trivial image in $R$. The monodromy homomorphism factors through $pi_1 \( A \)$, by normal meridian generation for the complement of the discriminant. Its composition with $G arrow.r pi_1 \( A \)$ is the quotient $G arrow.r R$. Conversely, $alpha_(*)$ kills $N$ and factors through $R$. These two factorizations are inverse because the maps from $G$ are surjective. This proves $R tilde.equiv pi_1 \( A \)$. ◻
]

For a further connected finite cover $X' arrow.r X$ corresponding to $G' lt.eq G$, write $A' = "Alb" \( X' \)$. The induced homomorphism $A' arrow.r A$ is surjective and, by maximality of the first Betti number, is an isogeny. Lemma 34 on both manifolds shows that the new Albanese fibre-group image is

#[#set math.equation(numbering: n => "(45)")
 $ N' = N ∩ G' . $ <eq:fibre-intersection>]

Indeed the map on torus fundamental groups induced by an isogeny is injective. Lemma 12 consequently realizes every prescribed finite-index condition on $N$ after shrinking the total group by finite index.

=== 6.2 Finite abelianization on all finite covers <finite-abelianization-on-all-finite-covers>

#thm([Proposition 6.2.])[
  #emph[The group $N$ is FAb.]
] <prop:fibre-fab>

#proof[
  We first show that every group $N' = N ∩ G'$ arising from a finite cover has $"Hom" \( N' \, bb(C) \) = 0$. Set $Lambda = pi_1 \( A' \)$ and $V = "Hom" \( N' \, bb(C) \)$. The vector space $V$ is finite dimensional because $N'$ is finitely generated. Conjugation defines an action of the abelian group $Lambda$ on it. Write $T_lambda$ for the operator
  $ \( T_lambda v \) \( n \) = v \( tilde(lambda)^(- 1) n tilde(lambda) \) \, $
  where $tilde(lambda)$ is any lift to $G'$. Inner conjugation acts trivially on additive homomorphisms, so the operator is independent of this lift.
  For a nontrivial character $beta : Lambda arrow.r bb(C)^(*)$, the cohomology of $Lambda$ with coefficients in $bb(C)_beta$ vanishes in every degree. This follows, for example, from the Koszul resolution: one generator acts by a scalar different from one, making that factor contractible. Inflation–restriction gives
  #[#set math.equation(numbering: n => "(46)")
   $ H^1 \( G' \, bb(C)_beta \) tilde.equiv \( V ⊗ bb(C)_beta \)^Lambda . $ <eq:twisted-inflation>]
  Choose a basis $lambda_1 \, dots.h \, lambda_r$ of $Lambda$ and put $T_i = T_(lambda_i)$. A nonzero invariant on the right of (46) corresponds to a vector $w eq.not 0$ satisfying
  $ T_i w = beta \( lambda_i \)^(- 1) w #h(2em) \( 1 lt.eq i lt.eq r \) . $
  Each $T_i$ has finitely many eigenvalues, and the values on this basis determine a character. Hence only finitely many nontrivial $beta$ have $H^1 \( G' \, bb(C)_beta \) eq.not 0$.
  Inflation identifies the character group of $Lambda$ with the open and closed identity component of $"Hom" \( G' \, bb(C)^(*) \)$: the Albanese lattice is $H_1 \( X' \, bb(Z) \)$ modulo torsion, and the character group has finitely many components. Group and manifold cohomology agree in degree one for these local systems. The nontrivial support points just found are therefore isolated in the full degree-one rank-one cohomology jump locus. B. Wang’s torsion-translate theorem for compact Kähler manifolds #cite(label("BWang2016")) author’s version, Theorem 1.3 makes them torsion.
  Suppose $V eq.not 0$. The commuting complex operators $T_i$ have a common eigenvector $v eq.not 0$: successively take an eigenspace of the next operator inside the nonzero common eigenspace already chosen, which remains stable by commutativity. Their invertibility makes the eigenvalues nonzero, and they define a character $chi : Lambda arrow.r bb(C)^(*)$. If $chi eq.not 1$, the vector $v$ makes $beta = chi^(- 1)$ one of the nontrivial support points above, so $chi$ is torsion. If $chi = 1$, it is already torsion. For $r = 0$, take any nonzero $v$ and the unique trivial character.
  Let $A_0 arrow.r A'$ be the isogeny with lattice $Lambda_0 = ker chi$, and pull it back to $X'$. The total-space cover $X_0$ is connected because $G' arrow.r Lambda$ is surjective; its group is $G_0 = \( alpha'_(*) \)^(- 1) \( Lambda_0 \)$, with kernel still exactly $N'$. Thus the vector space $V = "Hom" \( N' \, bb(C) \)$ has not changed, and the same $v$ is fixed by the restricted lattice. The pulled-back fibration has connected fibres. By the Albanese universal property it factors through a surjective homomorphism $"Alb" \( X_0 \) arrow.r A_0$, which maximality makes an isogeny. Connectedness of the pulled-back fibres forces its degree to be one. We may therefore relabel $X_0 \, A_0 \, G_0 \, Lambda_0$ as $X' \, A' \, G' \, Lambda$, with the same $V$ and $V^Lambda eq.not 0$.
  The untwisted inflation–restriction sequence contains
  #[#set math.equation(numbering: n => "(47)")
   $ 0 & arrow.r H^1 \( Lambda \, bb(C) \) arrow.r H^1 \( G' \, bb(C) \) arrow.r V^Lambda\
 & arrow.r H^2 \( Lambda \, bb(C) \) arrow.r H^2 \( G' \, bb(C) \) . $ <eq:transgression>]
  The last arrow is injective. To see this, its composition with the natural map to $H^2 \( X' \, bb(C) \)$ is the pullback $H^2 \( A' \, bb(C) \) arrow.r H^2 \( X' \, bb(C) \)$, since a torus is a $K \( Lambda \, 1 \)$. That pullback is injective for a surjective map from a compact Kähler manifold. In fact, if $a = dim A'$ and $d = dim X' - a$, fibre integration of a Kähler class $\[ omega \]^d$ is a positive constant. For $eta in H^2 \( A' \, bb(C) \)$ and $theta in H^(2 a - 2) \( A' \, bb(C) \)$,
  $ integral_(X') alpha' ""^(*) \( eta smile theta \) smile \[ omega \]^d = c integral_(A') eta smile theta \, #h(2em) c > 0 . $
  Poincaré duality proves the claim. For $a = 0$ there is no degree-two group to consider.
  The transgression in (47) is zero. Hence a nonzero invariant vector would give $b_1 \( X' \) > 2 dim A'$, contrary to the defining equality for the Albanese torus. The isogeny kept $N'$ and $V$ unchanged, so this contradiction proves $V = 0$ for the original cover as well. Maximality ensured that all intervening Albanese tori were isogenous and that the pulled-back torus was itself the new Albanese torus.
  Finally, let $N_0 lt.eq N$ have finite index. By Lemma 12, it contains some $N ∩ G'$. The latter has no nonzero homomorphism to $bb(C)$. A homomorphism from $N_0$ to $bb(C)$ restricting to zero on a finite-index subgroup is zero. Thus $"Hom" \( N_0 \, bb(C) \) = 0$. Since $N_0$ is finitely generated, its abelianization is finite. ◻
]

If $N$ is finite, Lemmas 34 and 11 prove the theorem. For the rest of the proof suppose that $N$ is infinite.

=== 6.3 A simultaneous choice of general Albanese fibres <a-simultaneous-choice-of-general-albanese-fibres>

We specify the generality needed to globalize a fibration from a single Albanese fibre. A finitely generated group has countably many finite-index subgroups. Thus there are countably many connected finite covers of $X$, up to the choices relevant here. Their Albanese tori are isogenous to $A$.

On each cover, Barlet’s space of compact analytic cycles #cite(label("Barlet1975")) has countably many irreducible components, each compact in the Kähler case #cite(label("CampanaGamma")) Section 3, Convention 3.1. We will use a countable list of families with holomorphic maps

$ p_j : W_j arrow.r T_j \, #h(2em) e_j : W_j arrow.r X \, #h(2em) W_j^compose = p_j^(- 1) \( T_j^compose \) subset W_j . $

Here $W_j$ is a connected smooth compact complex manifold, $T_j^compose$ is a connected smooth dense analytic Zariski open subset of a compact parameter space $T_j$, and $p_j : W_j^compose arrow.r T_j^compose$ is proper and smooth with connected fibres. Every irreducible reduced compact cycle $V subset X$ occurs as $e_j \( \( W_j \)_t \) = V$ for some $t in T_j^compose$, with the fibre map proper and bimeromorphic. In particular, $W_j^compose$ is the complement of a proper analytic subset in the same compact $W_j$.

Here is a construction of this list. On a fixed compact irreducible component $P$ of the space of $k$-cycles, Kähler volume is constant, say $v$. A cycle is reducible or nonreduced precisely when it is a sum of two nonzero cycles. Both summands have volume at most $v$. Bounded-volume compactness and local finiteness of the components of the Barlet space leave only finitely many possible component pairs for these summands. Addition of cycles is holomorphic, and its images from these compact pairs are analytic by proper mapping. Thus the decomposable locus in $P$ is a closed analytic subset. It is proper whenever $P$ contains an irreducible reduced cycle; components containing no such cycle can be omitted.

Resolve $P$ and restrict to the locus where this resolution is an isomorphism. Pull back the reduced universal incidence, take the closure of its component dominating the irreducible-cycle locus, and resolve that compact incidence. Delete the critical parameter values, the parameters whose whole support fibre lies in the exceptional image, and those for which a component of the full non-isomorphism locus has full fibre dimension. These are proper analytic subsets by proper generic smoothness and the proper fibre-dimension theorem. Over the remaining open, each resolved fibre is smooth, connected, and bimeromorphic to its cycle. Repeat on the irreducible components of the omitted parameter subsets, including the image omitted in resolving $P$. Each repetition lowers the parameter dimension, and a compact analytic subset has finitely many irreducible components. The countably many initial components therefore give the claimed countable list. This construction requires no Kähler metric on $W_j$ or $T_j$; their role is properness and fundamental-group transport.

Each nondominant evaluation image $e_j \( W_j \)$ is a proper analytic subset of the cover. On the smooth Albanese locus let $s$ be the fibre dimension. An evaluation image dominating the torus has general fibre dimension at most $s - 1$; the locus where this dimension is at least $s$ is proper analytic by the proper fibre-dimension theorem. An image not dominating the torus already projects to a proper analytic subset. Exclude these loci and the singular-fibre locus. A smooth Albanese fibre contained in an evaluation image has been excluded. Make these exclusions for every family and finite cover, and project them to $A$ through the finite isogenies. The resulting union is countable. Call a point outside it #emph[good], and use the same term for any of its lifts to a later Albanese torus.

If the torus has dimension zero, its fibre is the whole cover, which no proper evaluation image contains; no exclusion is needed for these images. Thus this convention includes irregularity zero. For any fibre above a good point, every nondominant evaluation image meets that fibre in a proper analytic subset. A countable union of such subsets cannot cover an open part of that fibre. This will allow us to choose a fibration cycle in a family dominating the total space.

=== 6.4 The minimal relative base <the-minimal-relative-base>

Consider all finite covers just described and their good Albanese fibres $S$. For each connected meromorphic fibration $S arrow.r.dashed T$, let $C$ be the image in the corresponding Albanese fibre group $N$ of a resolved general fibration fibre. Then $C lt.closed N$. Among these fibrations for which $N \/ C$ is infinite, minimize $dim T$, and denote the minimum by $ell$. The identity fibration is admissible because $N$ is infinite; the fibration to a point is not. Hence

$ 1 lt.eq ell lt.eq dim S . $

All covers used below remain within this simultaneous minimum.

#thm([Proposition 6.3.])[
  #emph[After a further connected finite étale cover, there is a fibration $c : X arrow.r.dashed Z$ over the Albanese torus $A$, with connected general fibres and relative base dimension $ell$. If $B_0$ is the actual image of a general $c$-fibre group, then $B_0 subset.eq N$, $B_0 lt.closed G$, and $Q = N \/ B_0$ is infinite.]
  #emph[For each prepared smooth model of $Z$, a very general good point of $A$ gives an Albanese fibre $S$ and a torus fibre $Y$. With the restricted actual inertial boundary $Delta_Y$ for $R = G \/ B_0$, there is a surjection 
$ pi_1^(upright("orb")) \( Y \, Delta_Y \) arrow.r.twohead Q $

 compatible with $S arrow.r.dashed Y$ and the natural $nu : pi_1 \( S \) arrow.r.twohead Q$. For every finite-index subgroup $Q_0 lt.eq Q$, there is a connected finite étale cover $S' arrow.r S$ with induced homomorphism $nu'$ whose image $Q' = "Im" nu'$ lies in $Q_0$. This one cover satisfies 
$ "gdim" \( S' \, psi compose nu' \) gt.eq ell $

 for every surjection $psi : Q' arrow.r.twohead P$ with $P$ infinite.]
] <prop:minimal-base>

#proof[
  Choose a cover, a good fibre $S$, and a fibration attaining $ell$. Write $C lt.closed N$ for its fibre-group image. The general fibration fibres give compact irreducible cycles of dimension $dim S - ell$, after taking their images in $X$. Choose one through a point of the fibration’s general locus in $S$ outside all the nondominant evaluation images prepared above. Choose a family from the list, with $p : W arrow.r T$ and $e : W arrow.r X$, containing this member. Its compact evaluation must dominate $X$, and hence is surjective.
  The homotopy sequence of the smooth proper family $W^compose = p^(- 1) \( T^compose \) arrow.r T^compose$ makes its fibre-group image normal in $pi_1 \( W^compose \)$. The selected fibre is bimeromorphic to the selected cycle, so its image under $e_(*)$ is $C$. Consequently $H = e_(*) pi_1 \( W^compose \)$ normalizes $C$. The complement of $W^compose$ in the smooth $W$ is analytic, so $pi_1 \( W^compose \) arrow.r pi_1 \( W \)$ is surjective and $H = e_(*) pi_1 \( W \)$.
  Put $Lambda = pi_1 \( A \)$ and $Lambda_0 = \( alpha e \)_(*) pi_1 \( W \)$. Lift the surjective holomorphic map $alpha e : W arrow.r A$ to the connected complex covering $A_(Lambda_0) arrow.r A$. Its lifted image is compact analytic by proper mapping. Surjectivity downstairs forces this image to have dimension $dim A$, so it is all of the connected manifold $A_(Lambda_0)$. The covering is therefore compact and has finite degree. Thus $alpha_(*) \( H \) = Lambda_0$ has finite index in $Lambda$.
  Let $L = N_G \( C \)$. It contains $N$ and $H$, so Albanese exactness gives
  $ \[ G : L \] = \[ Lambda : alpha_(*) \( L \) \] lt.eq \[ Lambda : alpha_(*) \( H \) \] < oo . $
  Pass to the cover corresponding to $L$. Its fibre-group image is still $N$, by (45), and $C$ is now normal in the total group. Continue to write $X \, G \, A \, Lambda$ for this cover, its group, its Albanese torus and its lattice. The whole compact evaluation $e : W arrow.r X$ lifts, since $e_(*) pi_1 \( W \) = H subset.eq L$. Its lift has full rank somewhere, and its compact analytic image is therefore the entire connected cover. The proper fibre-dimension theorem, applied to $W \\ W^compose subset.neq W$, shows that a general evaluation fibre meets $W^compose$. Hence members with parameters in $T^compose$ cover general total points. Smooth proper transport gives their fibre-group image $C$ after compatible base-point transport.
  Apply Theorem 8 to $G arrow.r G \/ C$, giving $c : X arrow.r.dashed Z$. The covering cycles just constructed have dimension $dim S - ell$ and are contracted through very general points. Thus
  $ dim Z lt.eq dim X - \( dim S - ell \) = dim A + ell . $
  This map is over $A$: a compact subvariety with finite image in the quotient lattice $G \/ N$ maps constantly to $A$. To verify the last assertion, resolve the subvariety. A finite image in the torsion-free lattice is trivial, so its map lifts to the universal cover of $A$, a complex vector space; compactness makes that lift constant. Consequently the Albanese map factors through $c$, after resolving. The induced map $g : Z arrow.r A$ has connected general fibres: a nontrivial finite Stein factor of $g$ would split a general fibre of the connected Albanese map.
  Let $B_0$ be the actual group image of a general $c$-fibre. It is normal in $G$, lies in $N$, and has finite image $B_0 C \/ C$ in $G \/ C$. If $N \/ B_0$ were finite, the image of $N$ in $G \/ C$ would be a finite union of translates of this finite image, contradicting $N \/ C$ infinite. Thus $N \/ B_0$ is infinite. For the dimension comparison, restrict $c$ to a very general good Albanese fibre. On simultaneous smooth loci, its fibres are the same general $c$-fibres, so they are connected and have image $B_0$ in $N$. This restricted fibration is admissible in the minimum, giving $dim Z - dim A gt.eq ell$. Equality follows. No equality or inclusion between $B_0$ and $C$ has been used.
  For inertia use $R = G \/ B_0$, so
  $ 1 arrow.r Q = N \/ B_0 arrow.r R = G \/ B_0 arrow.r Lambda arrow.r 1 . $
  Fix any prepared smooth model of $Z$, with actual inertial boundary $D_Z$ for $R$, and write $mu : tilde(X) arrow.r X$ for its resolved source, with $c : tilde(X) arrow.r Z$ holomorphic. Choose afresh a very general good point $a in A$ so that
  $ S = alpha^(- 1) \( a \) \, #h(2em) tilde(S) = \( alpha mu \)^(- 1) \( a \) \, #h(2em) Y = g^(- 1) \( a \) $
  are smooth, $tilde(S) arrow.r S$ is a modification, and $Y$ is transverse to every dominating stratum of the deleted divisor and avoids the images of the other strata. This choice may depend on the prepared model. The induced $S arrow.r.dashed Y$ is meromorphic, and $dim Y = ell$.
  Let $Z^compose$ be the prepared smooth fibration locus for $c$, put $Y^compose = Y ∩ Z^compose$, and put $tilde(S)^compose = c^(- 1) \( Y^compose \)$. The monodromy $psi_Z : pi_1 \( Z^compose \) arrow.r.twohead R$ has composite $g_(*)$ in $Lambda$, by compatibility after precomposing with the surjection from the open source group. Its restriction to $pi_1 \( Y^compose \)$ therefore lands in $Q$, giving the commutative diagram
  $ pi_1 \( tilde(S)^compose \) & arrow.r & pi_1 \( Y^compose \)\
arrow.b &  & arrow.b psi_Y\
pi_1 \( S \) & arrow.r^nu & N \/ B_0 med subset med G \/ B_0 . $
  The left map is surjective, by removal of an analytic subset and bimeromorphic invariance of the smooth fundamental group. The map $nu$ is surjective by the definition of $N$. Thus $psi_Y$ is surjective. The upper map is the map of a smooth proper fibration with connected fibres, so this is the monodromy compatible with $S arrow.r.dashed Y$.
  Transversality gives $Delta_Y = D_Z \|_Y$ with simple normal crossing support. For a deleted prime divisor $D$, if $E$ is a component of $D ∩ Y$, its meridian $mu_E$ maps to a conjugate of the meridian $mu_D$ in $Z^compose$. The injection $Q subset R$ therefore gives
  $ "ord"_Q #scale(x: 120%, y: 120%)[\(] psi_Y \( mu_E \) #scale(x: 120%, y: 120%)[\)] = "ord"_R #scale(x: 120%, y: 120%)[\(] psi_Z \( mu_D \) #scale(x: 120%, y: 120%)[\)] = m_D . $
  The proper fibre-dimension theorem ensures that the deleted subsets of codimension at least two remain of codimension at least two on this very general restriction, and filling them does not change the fundamental group. Filling divisors of order one kills already trivial meridians. The $m_D$-th powers of the remaining meridians are also killed, so $psi_Y$ factors as a surjection
  $ pi_1^(upright("orb")) \( Y \, Delta_Y \) arrow.r.twohead Q . $
  Finally fix a finite-index subgroup $Q_0 lt.eq Q$, and let $N_0$ be its inverse image in $N$. Lemma 12 gives a further global finite cover with group $G'$ such that
  $ N' = N ∩ G' subset.eq N_0 \, #h(2em) Q' = "Im" \( N' arrow.r Q \) tilde.equiv N' \/ \( N' ∩ B_0 \) subset.eq Q_0 . $
  The image $Q'$ has finite index in $Q$. Choose a point of the new Albanese torus above the current $a$. Its fibre $S'$ is a connected component of the pullback of $S$, because the new Albanese fibres are connected and the map of tori is finite. Thus $S' arrow.r S$ is a connected finite étale cover, and its induced homomorphism $nu'$ has image $Q'$. The good-point convention makes $S'$ eligible for the same minimum.
  Choose this cover before choosing a further quotient. For every surjection $psi : Q' arrow.r.twohead P$ with $P$ infinite, the $Gamma$-reduction of $psi compose nu'$ on $S'$ has resolved general fibre image $C' lt.closed N'$ with finite image in $P$. If $N' \/ C'$ were finite, the whole image in $P$ would be a finite union of translates of that finite image, which is impossible. The reduction is therefore an admissible fibration in the minimum, and its dimension is at least $ell$. This one cover works for every infinite quotient of $Q'$, as required by (M). The prepared model was arbitrary; repeating the choice of a very general good $S$ on each model proves the assertion on every prepared model. ◻
]

=== 6.5 The two representation cases <the-two-representation-cases>

Apply Proposition 36. The quotient $Q$ is FAb by Proposition 35. Suppose first that all finite-dimensional complex linear images of $Q$ are finite. On each prepared model of $Z$, choose the very general good fibre and the data in Proposition 36. They satisfy the hypotheses of Theorem 19. Hence

$ K_Y + Delta_Y quad upright("is big") $

on the very general torus fibre, of positive dimension $ell$. The same minimum applies after the fresh fibre choice on each prepared model. Theorem 33 contradicts the specialness of $X$.

Suppose instead that $Q$ has an infinite complex linear image. An infinite virtually solvable image is impossible for an FAb group, as observed in Section 2. Pass to finite index so that the Zariski closure $upright(bold(L))$ is connected. Its semisimple quotient is nontrivial. Choose a simple factor $upright(bold(H))$ of the adjoint semisimple quotient

$ #scale(x: 120%, y: 120%)[\(] upright(bold(L)) \/ "Rad" \( upright(bold(L)) \) #scale(x: 120%, y: 120%)[\)]_(upright("ad")) \, $

where $"Rad" \( upright(bold(L)) \)$ is the solvable radical. This quotient is a product of connected simple adjoint groups. Projection gives a Zariski-dense image in $upright(bold(H))$. In its faithful adjoint representation this image is finitely generated and linear, so Selberg’s lemma #cite(label("Selberg1960")) gives a finite-index subgroup with torsion-free image. Pull this condition back to $N$ and realize it on a global finite cover by Lemma 12. Write $X' \, G' \, N' \, A'$ for the resulting cover and its groups and Albanese torus. The induced $rho_N : N' arrow.r upright(bold(H)) \( bb(C) \)$ has torsion-free image. That image is still Zariski dense, since it has finite index in a dense subgroup of the connected group $upright(bold(H))$.

Take the Stein factorization $c' : X' arrow.r.dashed Z'$ of the old map $c$ after this cover. A connected $c'$-fibre maps under the new Albanese map into a finite fibre of $A' arrow.r A$, and hence to one point. Thus $c'$ lies over a map $g' : Z' arrow.r A'$; connected Albanese fibres again make $g'$ a fibration. Use a smooth model for $Z'$. Its relative dimension is still $ell$: the new Stein base is finite over the old base on the general locus, and $A' arrow.r A$ is an isogeny. Let $B'_0 lt.closed G'$ be the actual image of a general $c'$-fibre group. It lies in $N'$. A general $c'$-fibre is a connected component of a finite cover of an old $c$-fibre, so its image in $G$ lies in $B_0$. The representation $rho_N$, defined through the old $Q = N \/ B_0$, therefore kills $B'_0$. Set

$ R' = G' \/ B'_0 \, #h(2em) overline(rho) : N' \/ B'_0 arrow.r upright(bold(H)) \( bb(C) \) . $

Albanese exactness gives

$ 1 arrow.r N' \/ B'_0 arrow.r R' arrow.r pi_1 \( A' \) arrow.r 1 . $

On each prepared model of $Z'$, use the actual inertial boundary for $R'$ and choose a fresh very general good Albanese fibre $S'$ and corresponding torus fibre $Y$. Denote the restricted boundary by $Delta_Y$, and let $Y^compose$ be the restricted smooth fibration locus. The monodromy argument in Proposition 36, applied to this restricted fibration, gives

$ psi'_Y : pi_1 \( Y^compose \) arrow.r.twohead N' \/ B'_0 subset R' . $

Compose it with $overline(rho)$. A meridian has finite order in $R'$; its image under $overline(rho) compose psi'_Y$ has order dividing that actual inertial order. Since the representation image is torsion free, every meridian is killed. Filling the deleted locus therefore gives a representation $rho_Y : pi_1 \( Y \) arrow.r upright(bold(H)) \( bb(C) \)$ of the ordinary fundamental group, with the same torsion-free Zariski-dense image.

This representation is generically large. Otherwise its $Gamma$-reduction has base dimension less than $dim Y = ell$. Compose it with $S' arrow.r.dashed Y$ and take connected fibres by Stein factorization. A resolved general fibre maps to a resolved $Gamma$-fibre, so its group image $C' lt.closed N'$ has finite image under $rho_N$. The total image is infinite; if $N' \/ C'$ were finite, the total representation image would be a finite union of translates of that finite fibre image. Thus $N' \/ C'$ is infinite, and this composed fibration would be admissible in the minimum with base dimension less than $ell$, a contradiction.

By Theorem 9, $K_Y$ is big, and hence so is $K_Y + Delta_Y$. The argument applies after the fresh good fibre choice on every prepared model, using the same minimum and the boundary defined by the fixed actual quotient $R'$ on each model. Theorem 33 yields the same contradiction.

Both cases exclude infinite $N$. Thus $N$ is finite and the exact sequence of Lemma 34, followed by Lemma 11, makes $G$ virtually abelian. The group of the finite cover used at the start has finite index in the original fundamental group, so the same conclusion holds for the original $X$. A finite-index subgroup corresponds to a connected finite topological cover; the complex structure lifts uniquely, making it an unramified holomorphic cover. Base-point changes only conjugate the subgroups. This completes the proof of Theorem 1.0◻


#bibliography("refs.bib", style: "ieee", title: [References])
