#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Deforming-hypersymplectic-four-manifolds-to-hyperkahler-triples-September-23-2026]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A #emph[hypersymplectic structure] on an oriented four-manifold is a triple of closed real two-forms whose pointwise span is three-dimensional and positive definite for the wedge product. Such a triple determines a conformal structure, but its forms need not be parallel. After a constant normalization of their intersection matrix, the question is whether one can deform the forms to a hyperkähler triple while retaining their three cohomology classes.

#prodef([Theorem 1.1.])[
  #emph[Let $X$ be a closed connected oriented smooth four-manifold, and let $omega = \( omega_1 \, omega_2 \, omega_3 \)$ be a smooth hypersymplectic structure normalized by 
#[#set math.equation(numbering: n => "(1.1)")
 $ integral_X omega_i and omega_j = delta_(i j) . $ <eq:intro-normalization>]

 There is a smooth family of hypersymplectic structures $omega \( t \)$, $0 lt.eq t lt.eq 1$, such that 
$ omega \( 0 \) = omega \, #h(2em) \[ omega_i \( t \) \] = \[ omega_i \] quad \( i = 1 \, 2 \, 3 \) \, $

 and a positive volume form $mu_1$ with 
#[#set math.equation(numbering: n => "(1.2)")
 $ omega_i \( 1 \) and omega_j \( 1 \) = 2 delta_(i j) mu_1 . $ <eq:intro-endpoint>]

 The endpoint forms are parallel and self-dual for a hyperkähler metric.]
] <thm:main>

For an arbitrary positive volume form $mu$, write $omega_i and omega_j = 2 cal(Q)_(i j) mu$. There is a unique choice of $mu$ for which $det cal(Q) = 1$, and (1.2) is exactly $cal(Q) = I_3$ in this convention. The statement is unaffected by a constant orthogonal change of the ordered triple.

The normalization also specifies the conclusion for any initial positive closed triple. Let $G_(i j) = integral_X omega_i and omega_j$; this matrix is positive definite. Choose a constant invertible real matrix $L$ with $L G L^(sans(T)) = I_3$ and apply 1 to $L omega$. Applying $L^(- 1)$ to the resulting path preserves positivity and each original class. Its endpoint satisfies

$ omega_i \( 1 \) and omega_j \( 1 \) = 2 G_(i j) mu_1 \, $

where $mu_1$ is the volume form of the normalized endpoint metric. Thus the original basis consists of parallel self-dual forms for a hyperkähler metric, with its original Gram matrix $G$.

#prodef([Corollary 1.2.])[
  (Individual Kähler realizations).  #emph[Let $X$ be a closed connected oriented smooth four-manifold with a smooth positive triple $omega$ of closed real two-forms. For every fixed $c in bb(R)^3 \\ { 0 }$, the form $alpha_c = sum_i c_i omega_i$ is a Kähler form for a parallel integrable complex structure $J_c$ of some hyperkähler metric $g_c$ on $X$: 
$ alpha_c \( v \, w \) = g_c \( J_c v \, w \) . $

 The compatible structure is chosen separately for each $c$; no simultaneous transport of the triple is asserted.]
] <cor:individual-kahler>

#proof[
  Use the fixed-class path for the original basis described above and put $alpha_t = sum_i c_i omega_i \( t \)$. Positivity of the pointwise wedge-product matrix gives $alpha_t and alpha_t > 0$. Thus $alpha_t$ is symplectic, and its class is fixed because each $\[ omega_i \( t \) \]$ is fixed.
  For the endpoint metric $g$, set $r_c = \( c^(sans(T)) G c \)^(1 \/ 2) > 0$. The endpoint identities show that $alpha_1 \/ r_c$ is parallel and self-dual with $g$-norm $sqrt(2)$. It therefore defines a parallel integrable complex structure $J_c^(upright("end"))$ with $alpha_1 \/ r_c = g \( J_c^(upright("end")) thin dot.op \, dot.op \)$. Hence $alpha_1$ is its Kähler form for the hyperkähler metric $r_c g$.
  Since $X$ is closed, Moser’s theorem gives an isotopy $phi.alt_(c \, t)$ with $phi.alt_(c \, 0) = upright("id")$ and $phi.alt_(c \, t)^(*) alpha_t = alpha_c$. Pulling back $r_c g$ and $J_c^(upright("end"))$ by $phi.alt_(c \, 1)$ gives the claimed hyperkähler metric and compatible integrable structure on $X$. Fine and Yao note this Moser implication for a constituent in #cite(label("FineYao2017")) Section 1. ◻
]

#prodef([Corollary 1.3.])[
  (Smooth type).  #emph[Let $X$ be a closed connected smooth four-manifold admitting a smooth positive triple of closed real two-forms. Then $X$ is diffeomorphic to the standard K3 manifold or to $T^4$.]
] <cor:smooth-type>

#proof[
  Give $X$ the orientation induced by the triple. The normalization above and 1 give a global hyperkähler triple on $X$. Choosing one of its complex structures makes $X$ a compact Kähler surface with a nowhere-vanishing holomorphic two-form. The compact hyperkähler surface classification #cite(label("Boyer1988")) Section 2, p. 162 therefore identifies $X$ itself as a complex two-torus or a K3 surface. A complex two-torus is smoothly $T^4$, while every complex K3 surface is diffeomorphic to a nonsingular quartic surface in $upright(bold(P))^3$, the standard K3 manifold #cite(label("Kodaira1970")) p. 58. ◻
]

=== 1.1 History and significance <history-and-significance>

Donaldson’s study of closed two-forms on four-manifolds links their pointwise wedge-product geometry to nonlinear elliptic equations #cite(label("Donaldson2006")). His Question 3 in Section 5.3 asks whether a compact oriented four-manifold carrying a positive closed triple admits a hyperkähler structure. In the same section he proposes a prescribed-volume continuity argument in the simply connected case, conditional on a priori estimates and an auxiliary involution. The involution keeps the evolving form in a fixed cohomology class #cite(label("Donaldson2006")) Section 5.3. Fine and Yao formulate the normalized deformation problem, retaining all three cohomology classes, as Conjecture 1.1 of #cite(label("FineYao2017")). 1 resolves this deformation conjecture positively. Keeping the classes connects the given triple to a metric with its prescribed periods, beyond existence of some hyperkähler metric on the same manifold.

The main analytic approach has been the hypersymplectic flow. Fine and Yao obtained this flow by reducing the $G_2$-Laplacian flow on the product with a three-torus. They proved that a finite-time solution extends while the associated seven-dimensional scalar curvature, equivalently the torsion, remains bounded #cite(label("FineYao2017")) Theorem 1.3. Their later work gives an integral torsion extension criterion, global existence near pointwise orthogonality, and subsequential convergence of global solutions under additional geometric bounds #cite(label("FineYao2020")) Theorems 4.7, 4.10, 4.15 and 4.16.

Several restricted classes admit complete convergence results. Huang, Wang and Yao proved convergence, after pullback by diffeomorphisms, for simple-type hypersymplectic structures on the standard four-torus, a diagonal one-variable class #cite(label("HuangWangYao2018")) Theorems 3.5 and 3.6. Picard and Suan treated $G_2$ flows associated with Kähler Calabi–Yau data; their complex-dimension-two case supplies a hypersymplectic convergence theorem #cite(label("PicardSuan2024")) Theorem 1.3. Fine, He and Yao extended the simple-type convergence result, modulo diffeomorphisms, to $T^3$-invariant triples on $T^4$ in symmetric normal form #cite(label("FineHeYao2024")) Theorem 1.5. They subsequently proved a linear cohomologous isotopy to a hyperkähler triple when an effective smooth circle action preserves the initial triple #cite(label("FineHeYao2025")) Theorem 1.2. Related reductions and coflow constructions appear in work of Petcu, Yao and Zhou, and Karigiannis, Picard and Suan #cite(label("Petcu2026")) #cite(label("YaoZhou2026")) #cite(label("KarigiannisPicardSuan2026")). These results retain their stated symmetry or integrability hypotheses. The path constructed here starts from an arbitrary positive closed triple; its existence is a separate question from convergence or uniqueness for the hypersymplectic flow.

The topology already places strong restrictions on such a triple. Any two of its forms determine an almost-complex structure whose canonical line is trivial, and the third form tames that structure. Here a real two-form $beta$ #emph[tames] $J$ if $beta \( v \, J v \) > 0$ for every nonzero vector $v$; it is #emph[compatible] if it is also $J$-invariant. A closed tamer is symplectic. Bauer’s bound for symplectic four-manifolds with torsion first Chern class #cite(label("Bauer2008")) Corollary 1.2, together with the three positive period classes, gives $b^(+) = 3$, where $b^(+)$ is the positive index of the intersection form. The resulting free intersection lattice is the K3 lattice or three hyperbolic planes. These facts supply the lattice used below; they do not presuppose a smooth identification of the initial manifold with a K3 surface or torus.

For controlling closed positive forms, Sullivan’s structure currents provide the cone-duality framework #cite(label("Sullivan1976")). Harvey and Lawson developed the positive-current characterization of Kähler geometry #cite(label("HarveyLawson1983")), and Li and Zhang compared the taming and compatible cones in almost-complex geometry assuming the compatible cone is nonempty #cite(label("LiZhang2009")). A separate article proves that every tamed smooth almost-complex structure on a closed connected real four-manifold admits a compatible symplectic form #cite(label("OpenAITaming2026")) Theorem 1.1. Its current estimates and density-splitting argument are also used here, with the needed proofs included in Section 3, Section 4. In particular, smooth density-weight closedness already appears in the proof in Section 6 of that article. Its compatible class is unrestricted. The additional class criterion below converts closed normalized density thresholds into curves, using Preiss’s rectifiability theorem and Rivière–Tian’s regularity theorem for integral cycles #cite(label("Preiss1987")) #cite(label("RiviereTian2009")). This supplies the prescribed taming class needed along the deformation.

=== 1.2 The main ideas <the-main-ideas>

The proof organizes the deformation around a pair of forms. Write an ordered triple as $\( A \, C \, B \)$, and write products of forms for wedge products. The positive plane spanned by $A \, C$ determines an almost-complex structure $J$, with sign chosen so that $B$ tames it. A pair deformation gives the desired triple deformation provided the original third class continues to contain a tamer. The argument first proves a criterion for this availability, then constructs a fibration and an auxiliary equal-square pair, and finally uses two classical Kähler steps to reach the endpoint.

===== 1.2.1 Currents and a prescribed class. <currents-and-a-prescribed-class.>

Separation of the cone of positive forms gives a positive current obstructing a desired closed form. Quadratic mass estimates bound its mass in a ball of radius $r$ by $K r^2$ for a fixed constant $K$. Resolvent regularization also controls how its complex-line directions vary on that scale. Together these estimates prove closedness after weighting by smooth functions of the two-dimensional density. The zero-density part can then be handled by the intersection form, while normalized thresholds of the positive-density part give integral pseudoholomorphic cycles. Compatibility is proved before the integral-cycle regularity theorem is applied, so that its local symplectic hypothesis is available.

The output is Theorem 4.1, Theorem 4.2. For the second theorem, let $V$ be the intersection-orthogonal complement of $\[ A \] \, \[ C \]$. It has Lorentz signature because $b^(+) = 3$. A positive-square class $H in V$ is a taming class if it is in the same positive component as a known positive-square taming class $U in V$ and pairs positively with every irreducible closed $J$-curve. The criterion will keep $\[ B \]$ available as the pair changes.

===== 1.2.2 Marked curves and a torus fibration. <marked-curves-and-a-torus-fibration.>

The initial triple supplies an entire coefficient sphere of almost-complex structures: for $v in S^2$, the forms $a dot.op omega$ with $a dot.op v = 0$ constitute its anti-invariant plane (a form $xi$ is anti-invariant when $xi \( J u \, J w \) = - xi \( u \, w \)$), and $v dot.op omega$ tames the corresponding structure. Compatible forms can be selected smoothly over this sphere by a constant-rank elliptic correction. After projecting their classes to the original positive period plane and normalizing, one obtains a degree-one map to its unit sphere. Li proposed using such winding sphere families, parametrized wall crossing, and Taubes’s curve correspondence to construct elliptic fibrations #cite(label("Li2010SCY")) Section 7.4.1. The marked-family construction below carries out this approach for the coefficient sphere of the initial triple. Li–Liu’s families wall-crossing and index formulas #cite(label("LiLiu2001")), together with Taubes’s canonical nonvanishing and large-parameter curve extraction #cite(label("Taubes1994")) #cite(label("Taubes1996")) #cite(label("Taubes1999")), then give curves through every point in a chosen nonzero integral square-zero class. To impose passage through a chosen point, the proof requires one component of the Seiberg–Witten spinor to vanish there. As the parameter moves over the sphere, the line containing that component also varies and has degree of absolute value one. Its contribution must be retained in the marked wall-crossing calculation, even though the underlying Spin-c structure is fixed throughout the family.

The integral class is chosen to prevent any such curve configuration from splitting. Eichler’s criterion supplies the lattice normal form #cite(label("GritsenkoHulekSankaran2009")) Proposition 3.3(i); a further finite-coset argument works for the arbitrary real positive period plane of the original triple. Pseudoholomorphic adjunction and positivity of intersections then reduce the possible fibers to tori and rational curves with one singularity #cite(label("McDuffSalamon2012")) #cite(label("Wendl2020")). To obtain ordinary nodes, we prove transversality using exact perturbations of $A \, C$ with $B$ fixed. The first-jet method is related to that of Oh and Zhu #cite(label("OhZhu2008")), but the allowable closed-form variations require their own cokernel calculation. Relative nodal replacement and local deformation theory now produce the fibration of 38: a proper map from $X$ to a closed oriented surface, with torus regular fibers and rational singular fibers having one ordinary node.

===== 1.2.3 An auxiliary volume equation. <an-auxiliary-volume-equation.>

The fibration supplies classes with small positive fiber area. Near a nodal fiber we use the Gibbons–Hawking construction #cite(label("GibbonsHawking1978")) and the periodic Ooguri–Vafa model #cite(label("OoguriVafa1996")). Gross and Wilson developed the corresponding mathematical collapsing and semi-flat gluing methods for elliptic K3 surfaces #cite(label("GrossWilson2000")). Here the nodal holomorphic model is constructed independently, since a global complex structure is not yet available. On fixed annuli the model and regular data agree up to exponentially small error. Matching the fiber area and the period on the surface swept out by the monodromy-invariant fiber cycle ensures that the discrepancy has a primitive.

After exact preparation of the pair, these local forms glue to an approximate auxiliary form of fiber area $epsilon.alt$. The correction in 52 is solved on exact two-forms. For any Riemannian metric on the oriented closed four-manifold, let $h^(+)$ denote the self-dual part of an exact two-form $h$. The exact-form identity used in Donaldson’s elliptic formulation #cite(label("Donaldson2006")) Section 2, proof of Proposition 1; Section 4, Lemma 1

$ parallel h parallel_(L^2)^2 = 2 parallel h^(+) parallel_(L^2)^2 #h(2em) \( h upright(" exact") \) $

controls the inverse while the fibers collapse. The remaining finite Sobolev estimates lose only powers of $epsilon.alt^(- 1)$, which are absorbed by the exponentially small gluing error. This produces a closed form $D$ satisfying $A D = C D = 0$ and $D^2 = A^2$. The class inequality in 53 holds for all later curves at one fixed choice of $epsilon.alt$; it transfers positivity from $\[ D \]$ to the original class $\[ B \]$.

===== 1.2.4 Two Kähler steps in the original classes. <two-kähler-steps-in-the-original-classes.>

The closed equal-square pair $A \, D$ defines an integrable complex structure with holomorphic two-form $A plus.minus i D$, choosing the sign so that $C$ tames it. The compact-surface criteria of Buchdahl and Lamari, and the numerical Kähler-cone criterion, put $\[ C \]$ in the Kähler cone #cite(label("Buchdahl1999")) #cite(label("Lamari1999")) #cite(label("DemaillyPaun2004")). Yau’s volume theorem #cite(label("Yau1978")) gives $C_1 in \[ C \]$ with $C_1^2 = A^2$. Interpolate from $C$ to $C_1$; the uniform class inequality and the taming criterion keep $\[ B \]$ available throughout. The pair $A \, C_1$ is now itself an integrable equal-square pair. A second Kähler step in $\[ B \]$ gives $B_1$, completing the hyperkähler triple. Smooth selection of the third forms, with both endpoints prescribed, gives the actual path $\( A \, C_t \, B_t \)$ shown in 1. Every component retains its original class.

=== 1.3 Organization and conventions <organization-and-conventions>

2 establishes the preliminary geometry and topology. The positive-current results occupy Section 3, Section 4. Section 5, Section 6, Section 7 construct the torus fibration, and Section 8, Section 9, Section 10 construct the auxiliary equal-square pair. The proof of 1 is completed in 11.

We write products of two-forms for wedge products and products of degree-two cohomology classes for their intersection pairing. Curve classes are identified with their Poincaré duals in cohomology. Integral lattice statements use

$ Lambda = H^2 \( X \; bb(Z) \) \/ "torsion" . $

The original positive period plane is $P = "span" { \[ omega_1 \] \, \[ omega_2 \] \, \[ omega_3 \] }$. No rationality of this plane is assumed. All deformations of forms are smooth in the manifold variable; parameter regularity is stated where it is used. Constants in local estimates may depend on fixed smooth background data and on the indicated finite differentiation order.

== 2 Definite pairs and the coefficient sphere <sec:definite-pairs>

We first associate an almost-complex structure to a definite pair and identify the condition on a third form that makes the triple positive. This converts the later deformation problem into the choice of taming forms in a prescribed class. We also establish the topological restrictions and the degree-one sphere of structures needed to produce curves in 5.

#prodef([Definition 2.1.])[
  A pair $\( A \, C \)$ of real two-forms is #emph[definite] if its wedge-product matrix is positive definite at every point. A two-form $B$ #emph[tames] an almost-complex structure $J$ if $B \( v \, J v \) > 0$ for every nonzero tangent vector $v$. It is #emph[compatible] if, in addition, $B \( J u \, J v \) = B \( u \, v \)$. When these forms are called symplectic, closedness is included.
]

#prodef([Lemma 2.2.])[
  #emph[A definite pair $\( A \, C \)$ on an oriented four-manifold determines an almost-complex structure up to sign. Its anti-invariant real two-form bundle is pointwise spanned by $A \, C$, and its canonical complex line bundle is trivial. A third form $B$ completes a positive triple if and only if it tames one of the two signs of this almost-complex structure. On a connected manifold the sign is fixed by $B$.]
  #emph[A real two-plane is Lagrangian for both $A$ and $C$ if and only if it is a complex line, without specifying its orientation.]
] <lem:definite-pair>

#proof[
  Ratios of positive four-forms are smooth functions. Set
  #[#set math.equation(numbering: n => "(2.1)")
   $ x = frac(A C, A^2) \, #h(2em) y = (C^2 / A^2 - x^2)^(1 \/ 2) > 0 \, #h(2em) T = frac(C - x A, y) . $ <eq:pair-normalization>]
  Then $A T = 0$ and $T^2 = A^2 > 0$. Consequently
  $ Omega = A + i T \, #h(2em) Omega^2 = 0 \, #h(2em) Omega overline(Omega) = 2 A^2 > 0 . $
  The form $Omega$ is complex decomposable and its kernel in the complexified tangent bundle is complementary to its conjugate. Taking this kernel as $T^(0 \, 1)$ defines an almost-complex structure with the given orientation. Replacing $y$ by $- y$ conjugates $Omega$ and changes $J$ to $- J$. The real and imaginary parts of $Omega$ span the anti-invariant forms, and $Omega$ is a nowhere-zero section of the canonical bundle.
  Choose any Hermitian metric for $J$. The invariant two-forms are the wedge-orthogonal complement of $"span" \( A \, C \)$ and have signature $\( 1 \, 3 \)$. For the decomposition $B = B^(1 \, 1) + B^(2 \, 0 + 0 \, 2)$, the positive-triple condition is exactly $\( B^(1 \, 1) \)^2 > 0$. A real $\( 1 \, 1 \)$ form in complex dimension two has positive square precisely when its two Hermitian eigenvalues have the same strict sign. The positive component is the cone of forms positive on every complex line. The anti-invariant summand vanishes on such lines, so this is equivalent to taming by $B$. The other component is positive for $- J$. Connectedness fixes the choice continuously and globally.
  Finally, for independent real vectors $u \, v$, $A \( u \, v \) = C \( u \, v \) = 0$ is equivalent to $Omega \( u \, v \) = 0$. In a complex two-dimensional vector space with a nondegenerate complex volume form, this says that $u \, v$ are complex dependent, equivalently that their real span is a complex line. ◻
]

In particular, for fixed $J$ the space of taming two-forms is an open convex cone. Its intersection with the closed representatives of any one class is also convex. The associated notion of positivity will always use the sign of $J$ fixed by a stated tamer.

#prodef([Proposition 2.3.])[
  #emph[If $X$ carries a positive closed triple, then 
$ b^(+) \( X \) = 3 \, #h(2em) \( b_1 \( X \) \, b^(-) \( X \) \) = \( 0 \, 19 \) med upright("or") med \( 4 \, 3 \) . $

 The free integral intersection lattice is respectively $3 H xor 2 \( - E_8 \)$ or $3 H$, where $H$ is the hyperbolic plane. Every almost-complex structure obtained from a definite pair in the triple has vanishing integral first Chern class.]
] <prop:topology>

#proof[
  By 5, one member of the triple is a symplectic form taming an almost-complex structure whose canonical bundle is trivial. The first Chern class of this symplectic form therefore vanishes: the space of its tamed almost-complex structures is contractible and contains compatible structures. Bauer’s bound for a closed symplectic four-manifold with torsion first Chern class gives $b^(+) lt.eq 3$ #cite(label("Bauer2008")) Corollary 1.2. The three independent positive cohomology classes give the reverse inequality.
  The characteristic-number identity $c_1^2 = 2 chi + 3 sigma$, obtained from $p_1 = c_1^2 - 2 c_2$, the Euler-number identity and the signature theorem #cite(label("MilnorStasheff1974")) Corollaries 11.12 and 15.5, Theorem 19.4, together with $b^(+) = 3$, gives
  $ 0 = 19 - 4 b_1 - b^(-) \, #h(2em) sigma = 4 b_1 - 16 . $
  Moreover $w_2 equiv c_1 = 0 med \( mod med 2 \)$, so $X$ is spin #cite(label("MilnorStasheff1974")) Problem 14-B. Rokhlin’s theorem makes $sigma$ divisible by $16$ #cite(label("Rokhlin1952")). Since $b^(-) gt.eq 0$, these relations give $b_1 in { 0 \, 4 }$ and the displayed alternatives. Poincaré duality makes the free intersection form unimodular, and the Wu formula makes it even #cite(label("MilnorStasheff1974")) Theorem 11.14. Classification of indefinite even unimodular lattices now gives the two stated forms #cite(label("Serre1973")) Chapter V, Section 2.2, Theorems 5–6. Only the intersection lattice has been classified at this stage. ◻
]

The positive three-plane bundle spanned by the triple is the self-dual bundle of a unique oriented conformal structure. Choose one metric $g_0$ in that conformal class. Since the original forms are closed and self-dual, they are harmonic, and

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(H)_(g_0)^(+) = "span"_(bb(R)) { omega_1 \, omega_2 \, omega_3 } $ <eq:pair-harmonic-basis>]

by 6. Here the span is the vector space of global forms, with constant coefficients.

For $v in S^2 subset bb(R)^3$, let $B_v = v dot.op omega$ and let $cal(A)_v$ be the plane of forms $a dot.op omega$ with $a perp v$. Choosing the sign tamed by $B_v$ defines an almost-complex structure $J_v$. This construction uses the plane $cal(A)_v$ itself and does not require a global choice of its ordered basis over $S^2$.

#prodef([Lemma 2.4.])[
  #emph[The family $J_v$ is smooth and is Hermitian for $g_0$. At every point of $X$ its map to the twistor sphere has degree of absolute value one. The closed $J_v$-anti-invariant forms form the two-dimensional space $cal(A)_v$.]
] <lem:twistor-degree>

#proof[
  The first assertion follows from the construction and the self-dual description of Hermitian almost-complex structures in dimension four. At a fixed point, let $K$ be the positive Gram matrix of the triple for $g_0$. A vector normal to the coefficient plane $v^perp$, for this Gram matrix, has coefficients $K^(- 1) v$. Its pairing with $B_v$ is positive. Thus, after normalization, the fundamental forms give the map
  $ v mapsto frac(K^(- 1) v, \| K^(- 1) v \|) $
  in radial coefficient coordinates. Positive definite matrices connect to the identity through positive definite matrices, so this map has degree one. The orientation convention identifying coefficient and twistor spheres can change only its sign.
  A closed anti-invariant form is self-dual for $g_0$, hence harmonic. By (2.2) it is a constant combination of the original triple. It is anti-invariant for $J_v$ exactly when that coefficient vector lies in $v^perp$. This proves the final assertion. ◻
]

After a constant orthogonal change of coefficients we will denote a chosen original ordered triple by $\( A \, C \, B \)$. For all later exact deformations of the pair, set

#[#set math.equation(numbering: n => "(2.3)")
 $ V = \[ A \]^perp ∩ \[ C \]^perp subset H^2 \( X \; bb(R) \) . $ <eq:pair-lorentz-space>]

This space has signature $\( 1 \, b^(-) \)$, and $\[ B \] in V$ is a unit timelike vector. It determines the future component of the timelike cone.

#prodef([Lemma 2.5.])[
  #emph[Let $A \, D$ be closed real two-forms with $A D = 0$ and $A^2 = D^2 > 0$ pointwise. Then $A + i D$ defines an integrable complex structure, and is a nowhere-zero holomorphic two-form for it. If a closed third form $C$ has $A C = D C = 0$ and $C^2 = A^2$, then the resulting triple is hyperkähler, after choosing the sign of the complex structure so that $C$ is positive.]
] <lem:complex-symplectic>

#proof[
  Set $Omega = A + i D$ and use its kernel as $T^(0 \, 1)$ as in 5. For vector fields $U \, V$ in that kernel, Cartan’s formula and $upright(d) Omega = 0$ give
  $ cal(L)_U Omega = 0 \, #h(2em) iota_(\[ U \, V \]) Omega = cal(L)_U \( iota_V Omega \) - iota_V \( cal(L)_U Omega \) = 0 . $
  The kernel is involutive. The smooth Newlander–Nirenberg theorem therefore gives integrability #cite(label("NewlanderNirenberg1957")), and closedness of the $\( 2 \, 0 \)$ form $Omega$ gives holomorphicity.
  Under the additional assumptions, $C$ is a positive closed $\( 1 \, 1 \)$ form, hence a Kähler form. Its metric volume is $C^2 \/ 2 = A^2 \/ 2$. The ratio $Omega overline(Omega) \/ C^2$ is constant, so the holomorphic volume form has constant pointwise norm. The Chern connection of the canonical line then makes $Omega$ parallel. For a Kähler metric this is the connection induced by the Levi-Civita connection. Thus $A \, D \, C$ are parallel; their normalized self-dual algebra gives the hyperkähler structure. Explicitly, if $\( eta_1 \, eta_2 \, eta_3 \) = \( A \, D \, C \)$ and $mu = A^2 \/ 2$, then $eta_i and eta_j = 2 delta_(i j) mu$; thus their normalized matrix $cal(Q)$ from the introduction is the identity. ◻
]

== 3 Separation, quadratic mass, and angular energy <sec:current-energy>

The two separation arguments below produce a positive current, possibly with an anti-invariant correction. We first control its trace measure at the two-dimensional scale. An intersection pairing then controls the correction and the variation of the complex-line directions. These estimates will permit the density decomposition in 4.

Separation by positive currents follows the framework of Sullivan and Harvey–Lawson #cite(label("Sullivan1976")) #cite(label("HarveyLawson1983")), with the almost-complex formulation of Li–Zhang #cite(label("LiZhang2009")) Section 3. The closed lift, quadratic mass estimate and resolvent argument also occur in #emph[Taming implies compatibility on four-manifolds] #cite(label("OpenAITaming2026")) Sections 2–4. We develop the estimates for both separators together. In the prescribed-class application, the closed current can have nonzero cohomology class, and its square must remain in the energy identity.

=== 3.1 Conventions and separation <conventions-and-separation>

Fix a smooth almost-complex structure $J$ on the closed four-manifold $X$, give $X$ its complex orientation, and choose a smooth $J$-Hermitian metric $g$. Its fundamental form is

$ G \( u \, v \) = g \( J u \, v \) . $

The pointwise orthogonal decomposition is

#[#set math.equation(numbering: n => "(3.1)")
 $ Lambda^2 = I xor E \, #h(2em) I = Lambda_J^(+) = bb(R) G xor Lambda_g^(-) \, #h(2em) E = Lambda_J^(-) subset Lambda_g^(+) . $ <eq:current-bundles>]

Let $R$ denote the orthogonal projection onto $E$. A unit complex-line bivector is $ell = e and J e$, where $\| e \|_g = 1$. We use $g$ to identify bivectors and two-forms. Consequently

#[#set math.equation(numbering: n => "(3.2)")
 $ \| ell \|_g = 1 \, #h(2em) ell^(+) = G \/ 2 \, #h(2em) G \( ell \) = 1 \, #h(2em) \| G \|_g^2 = 2 . $ <eq:current-line-normalization>]

The bundle of these bivectors is denoted by $cal(L) arrow.r X$.

A two-current is a continuous real linear functional on $Omega^2 \( X \) = C^oo \( X \, Lambda^2 \)$. Under the metric identification its coefficient is a distributional two-form, denoted by the same letter: $T \( xi \) = chevron.l T \, xi chevron.r$. Thus

#[#set math.equation(numbering: n => "(3.3)")
 $ T upright(" is closed") med arrow.l.r.double med T \( upright(d) alpha \) = 0 upright(" for all ") alpha in Omega^1 \( X \) med arrow.l.r.double med upright(d)^(*) T = 0 med arrow.l.r.double med upright(d) \( * T \) = 0 . $ <eq:current-dual-convention>]

The cohomology class dual to a closed current is $\[ * T \] in H^2 \( X \; bb(R) \)$. For smooth coefficients this convention gives $T \( xi \) = integral_X xi and * T$. Inner products between $L^2$ coefficients will be written $chevron.l med \, med chevron.r_2$.

Let

$ cal(P)_J = { xi in Omega^2 \( X \) : xi \( ell \) > 0 upright(" for every ") ell in cal(L) } \, #h(2em) cal(Z)_J = { xi in C^oo \( X \, I \) : upright(d) xi = 0 } . $

The set $cal(P)_J$ is an open convex cone in the smooth topology; openness already holds in the uniform topology. Its closed elements are precisely the symplectic forms taming $J$. The elements of $cal(P)_J ∩ cal(Z)_J$ are the compatible symplectic forms.

#prodef([Lemma 3.1.])[
  (The two separators).  #emph[The following statements hold.]
  + #emph[If $cal(P)_J ∩ cal(Z)_J$ is empty, there is a nonzero current $N$ which annihilates $cal(Z)_J$ and all anti-invariant forms, and is nonnegative on semipositive invariant forms.]
  + #emph[If $H in H^2 \( X \; bb(R) \)$ has no representative in $cal(P)_J$, there is a nonzero positive invariant current $N$ which is closed and satisfies $N \( H \) lt.eq 0$.]
  #emph[In either case one can normalize $N \( G \) = 1$ and choose a positive Borel measure $lambda$ on $cal(L)$ such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ N \( xi \) = integral_(cal(L)) xi_y \( ell \) thin upright(d) lambda \( y \, ell \) \, #h(2em) mu = \( "pr"_X \)_(*) lambda \, #h(2em) mu \( X \) = 1 . $ <eq:current-line-measure>]

 In particular $N$ has order zero and belongs to $H^(- 3) \( X \, Lambda^2 \)$.]
] <lem:current-separators>

#proof[
  For (i), apply separation of an open convex set and a disjoint linear subspace in the real locally convex space $C^oo \( X \, I \)$. The separating continuous functional vanishes on $cal(Z)_J$ and is nonnegative on its positive cone. Extend it to all two-forms by precomposing with $1 - R$. Adding a positive multiple of $G$ and taking a limit proves nonnegativity on every semipositive invariant form.
  For (ii), choose a smooth closed representative $beta$ of $H$ and separate the open cone $cal(P)_J$ from the affine subspace $beta + upright(d) Omega^1 \( X \)$ in $Omega^2 \( X \)$. If $N$ is the separating functional, the unbounded translation directions in this affine subspace give $N \( upright(d) alpha \) = 0$. Every positive form can be multiplied by any positive scalar, so the separation inequalities imply both $N \( cal(P)_J \) gt.eq 0$ and $N \( beta \) lt.eq 0$. Adding an arbitrary real multiple of an anti-invariant form to an element of $cal(P)_J$ shows that $N$ annihilates anti-invariant forms. The same limiting argument gives positivity on semipositive invariant forms.
  For either functional, comparison of an invariant form with sufficiently large positive multiples of $G$ gives
  $ \| N \( xi \) \| lt.eq C N \( G \) parallel xi parallel_(C^0) . $
  If $N \( G \)$ were zero, this inequality and anti-invariance would make the functional zero. Normalize $N \( G \) = 1$. Locally, the functional is therefore represented by a positive Hermitian matrix of measures. Its trace is a positive measure $mu$; the Radon–Nikodym matrix relative to $mu$ is positive semidefinite with trace one. A measurable spectral decomposition of this $2 times 2$ matrix expresses it as a convex combination of rank-one Hermitian projections. Borel local frames and a Borel partition of $X$ give the global measure $lambda$ in (3.4). Finally $H^3 arrow.r.hook C^0$ in real dimension four, so every such measure coefficient belongs to $H^(- 3)$. ◻
]

=== 3.2 A closed lift of anti-invariant forms <a-closed-lift-of-anti-invariant-forms>

#prodef([Lemma 3.2.])[
  (Closed lift).  #emph[There is a classical pseudodifferential operator $D : C^oo \( X \, E \) arrow.r Omega^2 \( X \)$ of order zero with 
#[#set math.equation(numbering: n => "(3.5)")
 $ upright(d) D = 0 \, #h(2em) R D = "Id" . $ <eq:current-lift-identities>]

 It maps distributions to distributions. For the separator in 9(i), define 
#[#set math.equation(numbering: n => "(3.6)")
 $ Q \( xi \) = - N \( D R xi \) \, #h(2em) T = N + Q . $ <eq:current-correction>]

 Then $Q$ is anti-invariant and self-dual, $Q \, T in H^(- 3)$, and $T$ annihilates every closed smooth two-form. In particular $T$ is a closed current and $\[ * T \] = 0$.]
  #emph[For a smooth family of $\( J \, g \)$ with constant dimension of the space of closed anti-invariant forms, these lifts can be chosen smoothly in the parameter as operators between the corresponding smooth bundles.]
] <lem:closed-lift>

#proof[
  On sections of $E$ consider $P = R upright(d) upright(d)^(*)$. If $a$ is self-dual, then the self-dual projection of $xi and iota_xi a$ is $\| xi \|^2 a \/ 2$: in a frame with first covector $xi \/ \| xi \|$, the two self-dual halves of $a$ have equal length. Hence
  $ sigma_2 \( P \) \( x \, xi \) = 1 / 2 \| xi \|_g^2 "Id"_E \, #h(2em) chevron.l P a \, a chevron.r_2 = parallel upright(d)^(*) a parallel_2^2 . $
  Thus $P$ is elliptic, self-adjoint, and nonnegative. Its kernel consists of smooth sections with $upright(d)^(*) a = 0$. Since $a = * a$, these sections also satisfy $upright(d) a = 0$, and hence are harmonic. Conversely a closed anti-invariant form is self-dual and therefore harmonic and in the kernel.
  Let $H_0$ be the orthogonal projection onto this finite-dimensional kernel, and let $L$ be the inverse of $P$ on its orthogonal complement, extended by zero on the kernel. Elliptic Fredholm theory and the parametrix give $L$ as a classical operator of order $- 2$, with $H_0$ smoothing and $P L = "Id" - H_0$; see #cite(label("TaylorPseudodifferentialNotes")) Sections 4–5 and 10. Indeed, if $B_0 P = "Id" + K$ is a parametrix identity with $K$ smoothing, then $B_0 \( "Id" - H_0 \) = L + K L$. Elliptic regularity makes $K L$ smoothing, which gives the asserted order of $L$. Set
  #[#set math.equation(numbering: n => "(3.7)")
   $ D = upright(d) upright(d)^(*) L + H_0 . $ <eq:current-lift-definition>]
  The image of both summands is closed, and $R D = P L + H_0 = "Id"$. This proves (3.5).
  For closed $xi$, the form $xi - D R xi$ is closed and invariant, so $T \( xi \) = N \( xi - D R xi \) = 0$. The functional $Q$ only depends on $R xi$, which proves its anti-invariance and self-duality. Its $H^(- 3)$ membership follows because an order-zero operator and its adjoint act boundedly on every Sobolev space #cite(label("TaylorPseudodifferentialNotes")) Proposition 5.5. The vanishing on exact forms makes $T$ closed. Its pairings with all closed two-forms vanish, so Poincare duality, or the harmonic projection of $* T$, gives $\[ * T \] = 0$.
  For the family assertion, identify the varying bundles locally in the parameter and use a smooth unitary identification of the $L^2$ spaces. The elliptic operators then have common domain $H^2$ in a fixed Hilbert space. Choose a spectral contour enclosing only zero at one parameter value. The resolvent identity and elliptic regularity give a smooth family of resolvents on this contour after shrinking the parameter neighborhood. Its spectral projection has locally constant rank. Since the kernel dimension is constant with that rank, the enclosed spectral subspace consists exactly of the kernel. Thus $H_0$ depends smoothly on the parameter, and so does
  $ L = \( P + H_0 \)^(- 1) \( "Id" - H_0 \) $
  on every Sobolev scale. (3.7) gives the required smooth lifts. ◻
]

The projected elliptic operator also underlies Lejmi’s local compatibility construction #cite(label("Lejmi2006")) Theorem 2.1; the related global linear correction appears in #cite(label("DraghiciZhang2012")) Proposition 3.1. The harmonic projection in (3.7) records the possibly nonzero kernel. The lift provides closedness and the prescribed anti-invariant part. The estimates below will address existence of a positive closed invariant form.

From now on we use one of the two following setups:

+ $N$ is the normalized separator in 9(i), and $Q \, T$ are given by (3.6);
+ $N$ is a normalized positive invariant closed current, $Q = 0$, and $T = N$.

The second setup includes 9(ii). In both cases $T$ is closed, but the obstructions to be removed are different. In setup (A), we will prove $Q = 0$: the positive current $N = T$ would then annihilate every closed form, which is impossible when $J$ has a closed tamer. In setup (B), a class separator satisfies $N \( H \) lt.eq 0$; the task is instead to prove $N \( H \) > 0$ from the hypotheses on the proposed taming class. The estimates below apply to both setups. They first put $Q$ in $L^2$ and control nearby line directions; 4 will then eliminate the two obstructions.

Constants below can depend on $J \, g$ and the fixed operators, but are independent of the center, the small scale, and the choice of submeasure of $lambda$.

=== 3.3 The quadratic mass estimate <the-quadratic-mass-estimate>

We will use the following elementary consequence of the order-zero calculus. The proof records the dependence on the radial scale.

#prodef([Lemma 3.3.])[
  (Radial order-zero estimate).  #emph[Let $A$ be a fixed classical operator of order zero between smooth vector bundles on a compact four-manifold. Fix a coordinate radius below the injectivity radius. Suppose that smooth sections $a_(s \, p)$, supported in that coordinate neighborhood of $p$, satisfy, for $0 < s < s_0$, 
$ \| nabla^j a_(s \, p) \( y \) \| lt.eq C_j \( s + "dist" \( p \, y \) \)^(- a - j) \, #h(2em) 0 lt.eq j lt.eq 6 \, #h(2em) a in { 0 \, 1 } \, $

 with uniform boundedness on a fixed outer annulus. Then, for $delta = s + "dist" \( p \, x \)$ small, 
#[#set math.equation(numbering: n => "(3.8)")
 $ \| A a_(s \, p) \( x \) \| lt.eq cases(delim: "{", C delta^(- 1) \, & a = 1 \,, C \( 1 + \| log delta \| \) \, & a = 0 .) $ <eq:current-radial-operator>]

 Away from a smaller fixed neighborhood of $p$, the output is uniformly bounded in $s$ and $p$.]
] <lem:current-radial-operator>

#proof[
  We use two precise facts of the order-zero calculus: in local left quantization its symbol is bounded uniformly in the covariable, and its off-diagonal kernel satisfies $\| K_A \( x \, y \) \| lt.eq C "dist" \( x \, y \)^(- 4)$ for small positive distance. Smooth remainders have uniformly bounded kernels. These statements hold for bundle-valued classical operators, after finitely many coordinate localizations; see #cite(label("TaylorPseudodifferentialNotes")) Section 2, Propositions 2.1–2.2.
  For a fixed evaluation point $x$, split the input using a smooth cutoff supported in $B_(c delta) \( x \)$ and equal to one on $B_(c delta \/ 2) \( x \)$, with a fixed small $c$. On its support $s + "dist" \( p \, y \)$ is comparable to $delta$. After translation and dilation by $delta$, the localized input has derivatives through order six bounded by $C delta^(- a)$. Integration by parts in its Fourier transform therefore bounds its Fourier $L^1$ norm by $C delta^(- a)$, since $\( 1 + \| xi \| \)^(- 6)$ is integrable in dimension four. The bounded symbol gives the same bound for the local contribution to $A a_(s \, p) \( x \)$.
  The remaining part has distance at least $c delta \/ 2$ from $x$. Its portion in $B_(C delta) \( p \)$ contributes at most
  $ C delta^(- 4) integral_(B_(C delta) \( p \)) \( s + "dist" \( p \, y \) \)^(- a) thin upright(d) V_g \( y \) lt.eq C delta^(- a) . $
  On a shell of radius $r = 2^j delta gt.eq C delta$ about $x$, distance from $p$ is comparable to $r$, so its contribution is at most $C r^(- 4) r^4 r^(- a) = C r^(- a)$. The shells up to the fixed coordinate radius sum to $C delta^(- 1)$ if $a = 1$, and to $C \( 1 + \| log delta \| \)$ if $a = 0$. The rest is uniformly bounded. If $x$ stays away from $p$, the singular input near $p$ has uniformly bounded $L^1$ norm and the kernel there is bounded; the remaining input is uniformly smooth. This proves the final assertion. ◻
]

#prodef([Lemma 3.4.])[
  (Quadratic trace mass).  #emph[In either setup (A) or (B), there is a constant $C$ such that 
#[#set math.equation(numbering: n => "(3.9)")
 $ mu \( B_s \( p \) \) lt.eq C s^2 #h(2em) \( p in X \, med 0 < s lt.eq 1 \) . $ <eq:current-quadratic-mass>]

]
] <lem:quadratic-mass>

#proof[
  Fix first a radius $rho_0 > 0$ for uniform normal coordinates and a smooth radial cutoff which is one on $B_(2 rho_0) \( p \)$ and supported in $B_(3 rho_0) \( p \)$. This cutoff will not change when a smaller inner radius is chosen below. The logarithmic potential will detect the mass of $B_s \( p \)$, while a square-root potential will dominate the inverse-distance errors caused by varying $J$ and by the closed lift. With $t = "dist" \( p \, dot.op \)$ define the globally smooth cut-off functions
  $ u_s = chi \( t \) log sqrt(s^2 + t^2) \, #h(2em) h_s = chi \( t \) sqrt(s^2 + t^2) \, #h(2em) upright(d)_J^c u = - upright(d) u compose J . $
  Smoothness at $p$ follows from the dependence on $t^2$ and from $s > 0$. For a function $f$, put
  $ beta \( f \) = cases(delim: "{", \( 1 - D R \) upright(d) upright(d)_J^c f \, & upright("in setup (A)") \,, upright(d) upright(d)_J^c f \, & upright("in setup (B)") .) $
  In setup (A), $beta \( f \)$ is closed and invariant, and in setup (B) it is exact. Hence $N \( beta \( f \) \) = 0$ in both cases.
  The principal symbol of $upright(d) upright(d)_J^c$ on functions is a multiple of $xi and J^(*) xi$, which is $J$-invariant. Thus $R upright(d) upright(d)_J^c$ is a first-order operator. Differentiating the radial functions gives, for $0 lt.eq j lt.eq 6$,
  $ \| nabla^j R upright(d) upright(d)_J^c u_s \| lt.eq C_j \( s + t \)^(- 1 - j) \, #h(2em) \| nabla^j R upright(d) upright(d)_J^c h_s \| lt.eq C_j \( s + t \)^(- j) . $
  On the cutoff annulus these inputs and their derivatives are uniformly bounded. 11 applied to $D$ therefore bounds the two correction terms by $C \/ \( s + t \)$ and $C \( 1 + \| log \( s + t \) \| \)$ respectively.
  For clarity, the positive part of the test can be computed in a fixed Hermitian Euclidean space. If $f = f \( t \)$ and $ell$ is a unit complex line, its Hessian trace is
  $ upright(d) upright(d)_(J_p)^c f \( ell \) = 2 f' \( t \) \/ t + #scale(x: 120%, y: 120%)[\(] f'' \( t \) - f' \( t \) \/ t #scale(x: 120%, y: 120%)[\)] a \, #h(2em) 0 lt.eq a lt.eq 1 \, $
  where $a$ is the squared length of the radial unit vector projected onto the line. For the two functions without cutoff this gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ upright(d) upright(d)_(J_p)^c log sqrt(s^2 + t^2) \( ell \) & gt.eq frac(2 s^2, \( s^2 + t^2 \)^2) \,\
upright(d) upright(d)_(J_p)^c sqrt(s^2 + t^2) \( ell \) & gt.eq 1 / sqrt(s^2 + t^2) . $ <eq:current-log-trace>]
  In normal coordinates $g - g_p = O \( t^2 \)$ and $J - J_p = O \( t \)$, while the first derivatives of $J$ are bounded. Replacing the frozen complex line and operator by the actual ones changes these estimates by at most $C \/ \( s + t \)$ for $u_s$ and $C$ for $h_s$. Indeed the Hessian errors are bounded by $C t \| nabla^2 f \|$ and the coefficient-derivative errors by $C \| nabla f \|$. With $delta = s + t$, it follows that on $B_(rho_0) \( p \)$
  #[#set math.equation(numbering: n => "(3.11)")
   $ beta \( u_s \) \( ell \) & gt.eq c_1 s^2 delta^(- 4) - C_1 delta^(- 1) \,\
beta \( h_s \) \( ell \) & gt.eq c_2 delta^(- 1) - C_2 \( 1 + \| log delta \| \) . $ <eq:current-log-corrected>]
  The inequalities include setup (B), where the correction terms are absent.
  All constants just obtained use the already fixed cutoff. Now choose $0 < rho < rho_0$ so small that
  $ C_2 \( 1 + \| log delta \| \) lt.eq c_2 \/ \( 2 delta \) #h(2em) \( 0 < delta lt.eq 2 rho \) . $
  Next choose a fixed multiplier $M gt.eq 2 C_1 \/ c_2$. If $s lt.eq rho$ and $t lt.eq rho$, (3.11), (3.11) give $beta \( u_s + M h_s \) \( ell \) gt.eq c_1 s^2 delta^(- 4)$. On $X \\ B_rho \( p \)$ all terms are bounded independently of $s$, including the nonlocal corrections, by the last assertion of 11. Since $delta lt.eq 2 s$ on $B_s \( p \)$, we conclude globally that
  $ beta \( u_s + M h_s \) \( ell \) gt.eq c s^(- 2) upright(bold(1))_(B_s \( p \)) - C . $
  Apply $N$ and use $N \( beta \( u_s + M h_s \) \) = 0$ and $mu \( X \) = 1$ to obtain (3.9) for $s lt.eq rho$. For larger $s$ the same assertion follows from $mu \( X \) = 1$. Compactness makes all choices uniform in $p$. ◻
]

=== 3.4 The resolvent kernel and positive pairings <the-resolvent-kernel-and-positive-pairings>

We now have a uniform mass bound at the two-dimensional scale. The next step is to compare directions of nearby complex lines. Smoothing allows this comparison through an intersection pairing while keeping the error controlled by the mass bound just proved.

Let $Delta = upright(d) upright(d)^(*) + upright(d)^(*) upright(d)$ be the nonnegative Hodge Laplacian and set

#[#set math.equation(numbering: n => "(3.12)")
 $ S_s = \( 1 + s^2 Delta \)^(- 3) \, #h(2em) 0 < s lt.eq s_0 . $ <eq:current-smoothing>]

It commutes with $upright(d) \, upright(d)^(*)$ and $*$. At each fixed scale it maps $H^(- 3)$ to $H^3$, which suffices for all the pairings below. The kernel of $S_s^2$ is continuous, being of order $- 12$ in dimension four.

#prodef([Lemma 3.5.])[
  (Resolvent kernel).  #emph[Choose a fixed radius $r_0$ smaller than the injectivity radius, and let $tau_(z arrow.r y)$ be parallel transport along the minimizing geodesic when $"dist" \( y \, z \) < r_0$. The kernel $K_s$ of $S_s^2$ can be written 
#[#set math.equation(numbering: n => "(3.13)")
 $ K_s \( y \, z \) = k_s \( y \, z \) tau_(z arrow.r y) + E_s \( y \, z \) \, $ <eq:current-kernel-split>]

 where $k_s$ is nonnegative and supported where $"dist" \( y \, z \) < r_0$. For each integer $k gt.eq 0$ there are constants such that 
#[#set math.equation(numbering: n => "(3.14)")
 $ k_s \( y \, z \) & gt.eq c s^(- 4) &  & upright("if ") "dist" \( y \, z \) < s \,\
k_s \( y \, z \) & lt.eq C_k s^(- 4) \( 1 + "dist" \( y \, z \) \/ s \)^(- k) \,\
\| E_s \( y \, z \) \| & lt.eq C_k s^(- 2) \( 1 + "dist" \( y \, z \) \/ s \)^(- k) . $ <eq:current-kernel-lower>]

 The small upper bound on $s_0$ is fixed independently of $y \, z$.]
] <lem:current-kernel>

#proof[
  The spectral theorem gives the operator identity
  #[#set math.equation(numbering: n => "(3.15)")
   $ S_s^2 = frac(1, 5 !) integral_0^oo h^5 e^(- h) e^(- s^2 h Delta) thin upright(d) h . $ <eq:current-gamma-resolvent>]
  We recall the precise heat-kernel facts being used for the nonnegative Hodge Laplacian on the closed manifold. Its local small-time kernel has a parametrix
  $ chi \( d \) \( 4 pi t \)^(- 2) e^(- d^2 \/ \( 4 t \)) #scale(x: 120%, y: 120%)[\(] a_0 \( y \, z \) + t a_1 \( y \, z \) + dots.h.c + t^m a_m \( y \, z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) d = "dist" \( y \, z \) \, $
  with arbitrarily high-order uniform remainder after increasing $m$; see #cite(label("Ludewig2019")) Theorems 1.1 and 3.1. Here $chi$ is supported inside the injectivity radius and equals one near the diagonal. For the Hodge Laplacian $a_0 \( y \, z \) = j \( y \, z \)^(- 1 \/ 2) tau_(z arrow.r y)$, with $j$ smooth, strictly positive, and equal to one on the diagonal #cite(label("Ludewig2018")) Section 3, equation (3.4), author version. After subtracting the leading term, for every prescribed $L$ the kernel is bounded, for $0 < t < t_0$, by
  $ C t^(- 1) e^(- d^2 \/ \( C t \)) + C_L t^L . $
  The local expansion gives the Gaussian part of this bound; away from the diagonal, the global Gaussian estimate makes the cutoff error smaller than every power of $t$ #cite(label("Ludewig2019")) Theorem 3.5. For $t gt.eq t_0$, the heat kernel is uniformly bounded: factor the heat operator through two fixed positive-time smoothing operators and the $L^2$ contraction $e^(- \( t - t_0 \) Delta)$. This last assertion uses the nonnegativity and self-adjointness of the Hodge Laplacian.
  Take $chi gt.eq 0$ and use its leading coefficient to define
  $ k_s \( y \, z \) = frac(chi \( d \) j \( y \, z \)^(- 1 \/ 2), 5 ! \( 4 pi \)^2) s^(- 4) integral_0^oo h^3 e^(- h - d^2 \/ \( 4 s^2 h \)) thin upright(d) h . $
  For $d < s$, integration over $1 lt.eq h lt.eq 2$ gives (3.14). For every fixed $k$, the elementary inequality $e^(- r^2 \/ \( c h \)) lt.eq C_k \( 1 + r \)^(- k) \( 1 + h^(k \/ 2) \)$ shows that the last integral is bounded by $C_k \( 1 + d \/ s \)^(- k)$. This proves (3.14).
  Integrating the $t^(- 1)$ heat-kernel error in (3.15) gives
  $ C s^(- 2) integral_0^oo h^4 e^(- h - d^2 \/ \( C s^2 h \)) thin upright(d) h lt.eq C_k s^(- 2) \( 1 + d \/ s \)^(- k) . $
  For the uniform remainder, integration over $s^2 h < t_0$ gives $C_L s^(2 L)$. Since $d lt.eq "diam" X$, this is bounded by the right side of (3.14) when $2 L gt.eq k - 2$. On $s^2 h gt.eq t_0$, the factor $e^(- h)$ makes both the heat-kernel contribution and the extended leading term smaller than every power of $s$. This proves the claimed error for each $k$. ◻
]

For any positive submeasure $lambda_i lt.eq lambda$, let $N_i$ be its current and $mu_i$ its projection to $X$. These currents need not be closed. Define

#[#set math.equation(numbering: n => "(3.16)")
 $ B_(s \, mu_i) \( z \) = s^(- 2) integral_X \( 1 + "dist" \( y \, z \) \/ s \)^(- 6) thin upright(d) mu_i \( y \) \, #h(2em) B_s = B_(s \, mu) . $ <eq:current-error-bracket>]

By 12, a dyadic-shell sum gives

#[#set math.equation(numbering: n => "(3.17)")
 $ 0 lt.eq B_(s \, mu_i) \( z \) lt.eq B_s \( z \) lt.eq C . $ <eq:current-bracket-bound>]

Indeed the shell of radius $2^j s$ contributes at most $C 2^(- 4 j)$; the estimate for radii above a fixed coordinate radius follows from $mu \( X \) = 1$.

#prodef([Lemma 3.6.])[
  (Positive-current pairing).  #emph[For any $lambda_1 \, lambda_2 lt.eq lambda$ and their currents, 
#[#set math.equation(numbering: n => "(3.18)")
 $ chevron.l S_s N_1 \, * S_s N_2 chevron.r_2 & gt.eq c s^(- 4) integral.double_("dist" \( y \, z \) < s) \| ell - tau_(z arrow.r y) m \|^2 thin upright(d) lambda_1 \( y \, ell \) upright(d) lambda_2 \( z \, m \)\
 & #h(8mm)  - C integral_X B_(s \, mu_1) \( z \) thin upright(d) mu_2 \( z \) \,\
parallel S_s N_i parallel_2 & lt.eq C \/ s . $ <eq:current-positive-pairing>]

 One can replace $B_(s \, mu_1)$ in the lower bound by $B_s$.]
] <lem:current-positive-pairing>

#proof[
  Parallel transport preserves the Hodge star. From (3.2), direct expansion gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ chevron.l ell \, * tau_(z arrow.r y) m chevron.r = 1 / 2 \| ell - tau_(z arrow.r y) m \|^2 - 1 / 4 \| G_y - tau_(z arrow.r y) G_z \|^2 . $ <eq:current-angular-identity>]
  For example, the right side equals $- chevron.l ell \, tau m chevron.r + 1 / 2 chevron.l G_y \, tau G_z chevron.r$, which is the left side after splitting into self-dual and anti-self-dual parts. The last squared difference is bounded by $C d^2$, where $d = "dist" \( y \, z \)$.
  Express the pairing using the continuous kernel of $S_s^2$ and (3.4). Its leading scalar is nonnegative, so (3.14), (3.19) supply the positive term. The $C d^2$ term, using (3.14) with exponent at least eight, and the error kernel, using (3.14) with exponent six, are bounded in absolute value by
  $ C s^(- 2) integral.double \( 1 + d \/ s \)^(- 6) thin upright(d) mu_1 \( y \) upright(d) mu_2 \( z \) . $
  This is the asserted error. The norm estimate follows by using the absolute kernel bound in the unstarred pairing:
  $ parallel S_s N_i parallel_2^2 lt.eq C s^(- 4) integral.double \( 1 + d \/ s \)^(- 6) thin upright(d) mu_i \( y \) upright(d) mu_i \( z \) lt.eq C s^(- 2) mu_i \( X \) lt.eq C s^(- 2) . $
  The kernel formulas are legitimate for measure coefficients because the kernel is continuous at fixed $s$; alternatively they follow by smooth approximation at that fixed scale. ◻
]

=== 3.5 Projection leakage and the topological energy <projection-leakage-and-the-topological-energy>

#prodef([Lemma 3.7.])[
  (Projection commutator).  #emph[If $Pi$ is a smooth orthogonal bundle projection and $Pi W = 0$ for a distributional form $W$ with $S_s W in L^2$, then 
#[#set math.equation(numbering: n => "(3.20)")
 $ parallel Pi S_s W parallel_2 lt.eq C s parallel S_s W parallel_2 . $ <eq:current-projection-leakage>]

 Consequently, for every positive submeasure current $N' lt.eq_lambda N$ and every anti-invariant distribution $Z$ with $S_s Z in L^2$, 
#[#set math.equation(numbering: n => "(3.21)")
 $ \| chevron.l S_s N' \, S_s Z chevron.r_2 \| lt.eq C parallel S_s Z parallel_2 . $ <eq:current-mixed-bound>]

 Here $N' lt.eq_lambda N$ means that $N'$ is represented by some $lambda' lt.eq lambda$.]
] <lem:current-commutator>

#proof[
  Set $A_s = S_s^(- 1) = \( 1 + s^2 Delta \)^3$ and $U = S_s W$. Since $Pi A_s U = Pi W = 0$, the distributional identity
  $ Pi U = S_s \[ A_s \, Pi \] U $
  holds. The commutator expands as a sum of $binom(3, j) s^(2 j) \[ Delta^j \, Pi \]$, $1 lt.eq j lt.eq 3$. Because the principal symbol of $Delta$ is scalar, $\[ Delta^j \, Pi \]$ is a differential operator of order at most $2 j - 1$. The spectral theorem and elliptic Sobolev equivalence give
  $ parallel S_s parallel_(L^2 arrow.r H^m) lt.eq C_m s^(- m) \, #h(2em) 0 lt.eq m lt.eq 6 . $
  If $B_j = \[ Delta^j \, Pi \]$, its formal adjoint has the same order, so
  $ parallel S_s s^(2 j) B_j parallel_(L^2 arrow.r L^2) = parallel s^(2 j) B_j^(*) S_s parallel_(L^2 arrow.r L^2) lt.eq C s^(2 j) s^(- \( 2 j - 1 \)) = C s . $
  This proves (3.20), including its meaning for distributional $W$ by the bounded extension of the displayed operator.
  Apply this result to $R N' = 0$ and $\( 1 - R \) Z = 0$. With $u = S_s N'$ and $v = S_s Z$, the orthogonal splitting gives
  $ \| chevron.l u \, v chevron.r_2 \| lt.eq parallel R u parallel_2 parallel R v parallel_2 + parallel \( 1 - R \) u parallel_2 parallel \( 1 - R \) v parallel_2 lt.eq C s parallel u parallel_2 parallel v parallel_2 . $
  Now use (3.18). ◻
]

The topological pairing used next applies to the distributional coefficients just constructed. If $C_1 \, C_2 in H^(- 3)$ are closed currents, Hodge decomposition of the closed distributional forms $* C_i$ and commutation of $S_s$ with $upright(d)$ give

#[#set math.equation(numbering: n => "(3.22)")
 $ chevron.l S_s C_1 \, * S_s C_2 chevron.r_2 = integral_X \( * S_s C_1 \) and \( * S_s C_2 \) = \[ * C_1 \] dot.op \[ * C_2 \] . $ <eq:current-topological-pairing>]

For the underlying Green-operator decomposition, see #cite(label("TaylorHodge2010")) Sections 1–2, equations (1.20)–(1.22) and (2.1)–(2.2). Its extension to distributions follows from the Sobolev mapping properties of the Green operator. To see the regularity involved, write $* C_i = h_i + upright(d) a_i$, with $h_i$ harmonic and $a_i in H^(- 2)$. Then $S_s h_i = h_i$ and $S_s a_i in H^4$. Integration by parts eliminates all terms containing an exact factor, leaving $integral_X h_1 and h_2$. Thus no product of the unsmoothed distributions is used in (3.22).

#prodef([Proposition 3.8.])[
  (Angular energy).  #emph[In setup (A) or (B), the correction satisfies $Q in L^2 \( X \, E \)$ and 
#[#set math.equation(numbering: n => "(3.23)")
 $ integral.double_("dist" \( y \, z \) < s) \| ell - tau_(z arrow.r y) m \|^2 thin upright(d) lambda \( y \, ell \) upright(d) lambda \( z \, m \) lt.eq C s^4 . $ <eq:current-angular-energy>]

 The estimates in Lemma 3.6, Lemma 3.7 hold for all the indicated submeasures, and, for every such fixed submeasure current $N'$, 
#[#set math.equation(numbering: n => "(3.24)")
 $ lim_(s arrow.b 0) chevron.l S_s N' \, S_s Q chevron.r_2 = 0 . $ <eq:current-mixed-vanishing>]

 In fact the convergence in (3.24) is uniform over $lambda' lt.eq lambda$.]
] <prop:angular-energy>

#proof[
  Let $cal(A)_s$ denote the double integral in (3.23) and put $x_s = parallel S_s Q parallel_2$. Since $Q$ is self-dual and $S_s$ commutes with $*$, (3.22) applied to $T = N + Q$ gives
  $ \[ * T \]^2 = chevron.l S_s N \, * S_s N chevron.r_2 + 2 chevron.l S_s N \, S_s Q chevron.r_2 + x_s^2 . $
  Use (3.18), (3.17) for the first term and (3.21) for the second. The result is
  #[#set math.equation(numbering: n => "(3.25)")
   $ c s^(- 4) cal(A)_s + x_s^2 - C x_s lt.eq C + \[ * T \]^2 . $ <eq:current-energy-coercivity>]
  The right side is independent of $s$. In setup (A) its intersection term is zero. In setup (B) that term is bounded uniformly for mass-one $N$: its harmonic coefficients are pairings with fixed smooth forms and are bounded by (3.4). Completing the square in $x_s$ bounds both $x_s$ and $s^(- 4) cal(A)_s$.
  As $s arrow.b 0$, $S_s Q$ converges to $Q$ distributionally. A weakly convergent subsequence of the bounded $L^2$ family therefore has limit $Q$, proving $Q in L^2$. Its anti-invariance is preserved in this limit, and the spectral theorem now gives $S_s Q arrow.r Q$ strongly in $L^2$.
  Choose smooth anti-invariant $Q_j$ with $parallel Q_j - Q parallel_2 arrow.r 0$; for example apply $R$ to a smooth approximation. By (3.21) and the $L^2$ contraction property of $S_s$,
  $ \| chevron.l S_s N' \, S_s \( Q - Q_j \) chevron.r_2 \| lt.eq C parallel Q - Q_j parallel_2 . $
  For fixed $j$, $S_s^2 Q_j arrow.r Q_j$ in $C^oo$, whereas $N' \( Q_j \) = 0$. Therefore
  $ chevron.l S_s N' \, S_s Q_j chevron.r_2 = N' \( S_s^2 Q_j - Q_j \) arrow.r 0 . $
  The last convergence is uniform over the submeasures, because their trace masses are at most one. First let $s$ tend to zero and then $j$ to infinity to obtain (3.24). ◻
]

== 4 Density splitting and the taming cone <sec:density-splitting>

The estimates of the preceding section have two consequences. The first requires no definite pair and imposes no condition on the cohomology class of the resulting form. It is the fixed-structure theorem of #emph[Taming implies compatibility on four-manifolds] #cite(label("OpenAITaming2026")) Theorem 1.1. The second consequence keeps a specified class available, provided that it pairs positively with all irreducible curves. This prescribed-class statement will be used along the pair deformations in Section 9, Section 11.

#prodef([Theorem 4.1.])[
  (From taming to compatibility).  #emph[Let $X$ be a closed connected smooth four-manifold and let $J$ be a smooth almost complex structure, with its complex orientation. If a smooth symplectic form tames $J$, then there is a smooth symplectic form compatible with $J$.]
] <thm:tamed-compatible>

In the following statement, curve classes are identified with their Poincaré dual classes in $H^2 \( X \; bb(R) \)$. An irreducible $J$-holomorphic curve means the image of a nonconstant somewhere-injective $J$-holomorphic map from a closed connected Riemann surface, endowed with its complex orientation.

#prodef([Theorem 4.2.])[
  (A curve criterion for taming classes).  #emph[Let $X$ be a closed connected oriented smooth four-manifold with $b^(+) \( X \) = 3$, and let $J$ be a smooth almost complex structure inducing the given orientation. Suppose that smooth closed real two-forms $A \, C$ span a pointwise definite plane and form a basis of the $J$-anti-invariant two-forms at every point. Set 
$ V = \[ A \]^perp ∩ \[ C \]^perp subset H^2 \( X \; bb(R) \) . $

 Suppose $U in V$ has positive square and contains a smooth form taming $J$. If $H in V$ has positive square, belongs to the same component of ${ v in V : v^2 > 0 }$ as $U$, and satisfies 
$ H dot.op d > 0 $

 for every irreducible closed $J$-holomorphic curve of class $d$, then $H$ contains a smooth symplectic form taming $J$.]
] <thm:taming-cone>

We first combine 16 with the tangent-measure analysis to prove closedness of density weights in 22. The general splitting argument and its smooth density-weight conclusion are shared with #cite(label("OpenAITaming2026")) Theorem 5.1 and Section 6, “Passing to the positive-density set”; we give the argument with the conventions used here. The diffuse pairing then proves 17 without integral-current regularity. Finally, the integral threshold cycles of 25 give 18; integral-current regularity enters only this last step.

=== 4.1 Densities and almost-everywhere planar tangents <densities-and-almost-everywhere-planar-tangents>

We use the conventions and separator constructions of Lemma 3.1, Proposition 3.8. Thus $g$ is a smooth $J$-Hermitian metric with fundamental form $G$,

$ N \( xi \) = integral xi_y \( ell \) thin d lambda \( y \, ell \) \, #h(2em) mu = \( "pr"_X \)_(*) lambda \, #h(2em) T = N + Q \, $

where $ell$ ranges over the unit positively oriented complex-line bivectors. The current $T$ is closed, $Q$ is anti-invariant and belongs to $L^2$, and

#[#set math.equation(numbering: n => "(4.1)")
 $ mu \( B_s \( p \) \) lt.eq C s^2 \, #h(2em) cal(A)_s := integral.double_("dist" \( y \, z \) < s) \| ell - tau_(z y) m \|^2 thin d lambda \( y \, ell \) d lambda \( z \, m \) lt.eq C s^4 . $ <eq:density-basic-bounds>]

The map $tau_(z y)$ denotes parallel transport from $z$ to $y$ along the short geodesic. Constants in this section depend on the fixed geometry and the current bounds, and may increase from line to line. All radii are smaller than a fixed fraction of the injectivity radius.

Under the metric identification of coefficients, closedness of a two-current means coclosedness of its distributional two-form. We write $frak(c) \( S \) = \[ * S \]$ for its Poincaré dual cohomology class when $S$ is closed. In particular,

#[#set math.equation(numbering: n => "(4.2)")
 $ frak(c) \( S \) dot.op \[ alpha \] = S \( alpha \) $ <eq:density-intersection-convention>]

for a smooth closed two-form $alpha$. This convention distinguishes the current from its Hodge-dual differential-form representative.

The radial comparison below follows the Lelong–Jensen method for almost-complex currents #cite(label("ElkhadhraMimouni2007")) Proposition 1 and Corollary 2. Here we apply closedness to $N + Q$ and estimate the $L^2$ correction $Q$ directly.

#prodef([Lemma 4.3.])[
  (Existence of the quadratic density).  #emph[At every $p in X$, the limit 
#[#set math.equation(numbering: n => "(4.3)")
 $ theta.alt \( p \) = lim_(s arrow.b 0) s^(- 2) mu \( B_s \( p \) \) $ <eq:density-definition>]

 exists and is finite. The function $theta.alt$ is measurable and bounded, and it is zero almost everywhere with respect to $d V_g$.]
] <lem:density-existence>

#proof[
  Put $nu = mu + \| Q \| thin d V_g$. Cauchy–Schwarz and the four-dimensional volume bound give
  $ integral_(B_s \( p \)) \| Q \| thin d V_g lt.eq "vol"_g \( B_s \( p \) \)^(1 \/ 2) parallel Q parallel_(L^2 \( B_s \( p \) \)) lt.eq C s^2 \, $
  so $nu \( B_s \( p \) \) lt.eq C s^2$, uniformly in $p$. Fix $p$, identify a normal-coordinate ball with a Euclidean ball, and freeze $J_p$ and $G_p$ as constant tensors $J_0 \, G_0$. If $t = \| zeta \| = "dist" \( p \, exp_p zeta \)$, define
  $ b_p \( s \) = s^(- 2) T \( upright(bold(1))_(B_s \( p \)) G_0 \) . $
  These evaluations are well-defined because $T$ has measure coefficients. Since $G \( ell \) = 1$, $G - G_0 = O \( t \)$, and $Q$ annihilates the invariant form $G$, we have
  #[#set math.equation(numbering: n => "(4.4)")
   $ b_p \( s \) = s^(- 2) mu \( B_s \( p \) \) + O \( s \) . $ <eq:density-frozen-ratio>]
  Indeed, both error integrals are bounded by $C s^(- 2) s nu \( B_s \( p \) \)$.
  Call a radius good if its sphere has zero $nu$-measure. All but countably many radii are good. For good $0 < r < s$, closedness implies
  #[#set math.equation(numbering: n => "(4.5)")
   $ b_p \( s \) - b_p \( r \) = 1 / 2 T #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ r < t < s }) thin d d_(J_0)^c log t #scale(x: 120%, y: 120%)[\)] \, #h(2em) d_(J_0)^c u = - d u compose J_0 . $ <eq:density-frozen-monotonicity>]
  For completeness, replace $log t$ inside $B_s$ by
  $ phi.alt_s \( t \) = cases(delim: "{", t^2 \/ \( 2 s^2 \) + log s - 1 \/ 2 \, & t < s \,, log t \, & t gt.eq s .) $
  The difference $phi.alt_s - phi.alt_r$ is compactly supported and $C^(1 \, 1)$. Inside $B_s$, the quadratic part has $d d_(J_0)^c \( t^2 \/ \( 2 s^2 \) \) = 2 G_0 \/ s^2$. Expanding $T \( d d_(J_0)^c \( phi.alt_s - phi.alt_r \) \) = 0$ gives (4.5). This use of $C^(1 \, 1)$ tests is justified by smoothing: for fixed positive $r \, s$, their Hessians are uniformly bounded, converge away from the two spheres, and the spheres have zero $nu$-measure.
  The frozen form $d d_(J_0)^c log t$ is semipositive on $J_0$-complex lines and has norm at most $C t^(- 2)$. A $J$-complex line at distance $t$ is $O \( t \)$ from a $J_0$-complex line. Its evaluation can therefore be negative only by $C \/ t$. Likewise the projection of this form onto the actual anti-invariant summand has norm at most $C \/ t$, because its frozen anti-invariant projection vanishes. Thus
  $ b_p \( s \) - b_p \( r \) gt.eq - C integral_(0 < t < s) t^(- 1) thin d nu . $
  Quadratic growth, or a sum over the annuli $2^(- j - 1) s < t lt.eq 2^(- j) s$, bounds this integral by $C s$. It follows that
  #[#set math.equation(numbering: n => "(4.6)")
   $ b_p \( r \) lt.eq b_p \( s \) + C s #h(2em) \( 0 < r < s \, med r \, s upright(" good") \) . $ <eq:density-almost-monotonicity>]
  The bounded function $b_p$ therefore has a limit along good radii. To see this directly, choose good $s_j arrow.b 0$ realizing its limit inferior and apply (4.6) to all smaller good $r$; the limit superior is at most the same value. Equation (4.4) gives the same limit for the mass ratio. Squeezing an arbitrary radius between good radii with ratios tending to one gives (4.3).
  Measurability follows by taking a fixed sequence of radii tending to zero, and boundedness follows from (4.1). For the last assertion, work in a fixed relatively compact coordinate chart, localizing the measures before extending them to Euclidean space. Apply the differentiation theorem for Radon measures, with smooth four-dimensional volume as denominator #cite(label("Kinnunen2026")) Theorem 4.19. At volume-almost every center, the measure-to-volume ratios of sufficiently small Euclidean coordinate balls are bounded. A geodesic ball of radius $s$ is contained in a coordinate ball of comparable radius, whose smooth volume is $O \( s^4 \)$. Hence $mu \( B_s \( p \) \) = O_p \( s^4 \)$ at those centers, and $s^(- 2) mu \( B_s \( p \) \) arrow.r 0$. A finite chart cover proves the assertion on $X$. ◻
]

Write $N = M mu$, where $M$ is the measurable positive Hermitian bivector of trace one obtained by disintegrating $lambda$. This means $M \( p \) = integral ell thin d lambda_p \( ell \)$, where $lambda_p$ is a probability measure on complex lines for $mu$-almost every $p$.

#prodef([Lemma 4.4.])[
  (Classification of the relevant tangent measures).  #emph[At $mu$-almost every point $p$ with $theta.alt \( p \) > 0$, the matrix $M \( p \)$ is a single unit complex-line bivector $ell_p$, the conditional measure $lambda_p$ is supported on that line, and 
$ s^(- 2) \( exp_p^(- 1) \/ s \)_(*) mu med arrow.r med frac(theta.alt \( p \), pi) thin cal(H)^2 #h(-0.16667em) harpoon.tr P_p $

 locally weakly on $T_p X$, where $P_p$ is the plane of $ell_p$. The pushforward here is restricted to the normal-coordinate ball before rescaling.]
] <lem:density-planar-tangents>

#proof[
  Choose a positive-density point where differentiation of the bounded matrix $M$ with respect to $mu$ holds in a fixed Euclidean coordinate chart and smooth local trivialization #cite(label("Kinnunen2026")) Theorem 4.33 and Corollary 4.34. This excludes a set of zero $mu$-measure. No doubling hypothesis is needed: for fixed $R$, enclose $B_(R s) \( p \)$ in a coordinate ball $E_s$ of radius comparable to $R s$. Quadratic growth bounds $s^(- 2) mu \( E_s \)$, while differentiation makes the mean oscillation of $M$ on $E_s$ tend to zero. Therefore
  $ s^(- 2) integral_(B_(R s) \( p \)) \| M \( y \) - M \( p \) \| thin d mu \( y \) arrow.r 0 . $
  A smooth change of frame adds a vanishing $O \( s \)$ error after this normalization. The quadratic mass bound gives subsequential locally weak limits $gamma$ of the rescaled scalar measures on all of $T_p X tilde.eq bb(R)^4$. The existence of the density, followed by approximation of balls from inside and outside, gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ gamma \( B_R \) = theta.alt \( p \) R^2 #h(2em) \( R > 0 \) . $ <eq:density-tangent-ball-mass>]
  In particular every centered sphere has zero $gamma$-measure. The rescaled $Q$ mass on that ball satisfies the sharper estimate
  #[#set math.equation(numbering: n => "(4.8)")
   $ s^(- 2) integral_(B_(R s) \( p \)) \| Q \| thin d V_g lt.eq C R^2 parallel Q parallel_(L^2 \( B_(R s) \( p \) \)) arrow.r 0 . $ <eq:density-rescaled-correction>]
  Passing to the limit in closedness of the rescaled $T$ therefore shows that the constant-coefficient current $M \( p \) gamma$ is closed.
  Identify $M \( p \)$ with a constant skew-symmetric matrix. The equation $partial \( M \( p \) gamma \) = 0$ says that all distributional derivatives of $gamma$ in the column space of that matrix vanish. Equivalently, $gamma$ is translation invariant along $"im" M \( p \)$. The nonzero positive Hermitian matrix $M \( p \)$ has real rank two or four. Rank four would make $gamma$ a nonzero multiple of Lebesgue measure on $bb(R)^4$, which contradicts (4.7). Thus its rank is two. Trace-one normalization then makes $M \( p \) = ell_p$, the unit bivector of a complex line $P_p$. The rank-one positive Hermitian matrix is an extreme point of the trace-one positive matrices: if its quadratic form vanishes on a vector, positivity forces almost every matrix in any convex decomposition to vanish there too. Hence $lambda_p$ is concentrated on $ell_p$.
  A locally finite measure invariant under translations in $P_p$ has the form $cal(H)^2 #h(-0.16667em) harpoon.tr P_p ⊗ sigma$, with $sigma$ a locally finite measure on $P_p^perp$. Equation (4.7) now becomes
  $ theta.alt \( p \) = pi integral_(P_p^perp) #scale(x: 120%, y: 120%)[\(] 1 - \| z_perp \|^2 \/ R^2 #scale(x: 120%, y: 120%)[\)]_(+) thin d sigma \( z_perp \) #h(2em) \( R > 0 \) . $
  Each integrand is nondecreasing in $R$, and is strictly increasing once $R > \| z_perp \| > 0$. Constancy for all $R$ forces $sigma$ to be supported at zero. Its mass is $theta.alt \( p \) \/ pi$. Every convergent subsequence has consequently the same limit, proving the asserted convergence. ◻
]

#prodef([Corollary 4.5.])[
  (Integrated transverse estimate).  #emph[With the plane projection taken in $T_y X$, one has 
#[#set math.equation(numbering: n => "(4.9)")
 $ cal(T)_s := integral d lambda \( y \, ell \) integral_(B_s \( y \)) lr(|"pr"_(ell^perp) exp_y^(- 1) \( z \) \/ s|)^2 thin d mu \( z \) = o \( s^2 \) . $ <eq:density-transverse>]

]
] <cor:density-transverse>

#proof[
  At the positive-density points covered by 20, divide the inner integral by $s^2$ and pass to the planar tangent measure. The integrand vanishes on that plane, and the limiting sphere has zero measure. At zero-density points the same normalized integral is bounded by $s^(- 2) mu \( B_s \( y \) \)$, which tends to zero. These two arguments apply for $lambda$-almost every $\( y \, ell \)$. The quadratic mass bound gives a uniform integrable bound, so dominated convergence proves (4.9). ◻
]

=== 4.2 Closedness of density weights <closedness-of-density-weights>

The tangent measures now show that displacement normal to the local complex line has a vanishing averaged contribution. We combine this with the angular estimate to control derivatives of a smoothed density. That control will allow the density weights to preserve closedness.

#prodef([Proposition 4.6.])[
  (Closed density weights).  #emph[For either separator construction of 9, let $theta.alt$ be the density in 19. If $b : bb(R) arrow.r bb(R)$ is smooth and bounded with $b \( 0 \) = 0$, then the current $b \( theta.alt \) N$ is closed. The currents 
#[#set math.equation(numbering: n => "(4.10)")
 $ N^(+) = upright(bold(1))_({ theta.alt > 0 }) N \, #h(2em) I_a = upright(bold(1))_({ theta.alt > a }) pi / theta.alt N quad \( a > 0 \) $ <eq:density-weighted-restrictions>]

 are also closed. In particular, if $N^d = upright(bold(1))_({ theta.alt = 0 }) N$, then $N^d + Q$ is closed.]
] <prop:density-weights>

#proof[
  We first smooth the scalar density. Fix a nonnegative function $h in C_c^oo \( \( 0 \, 1 \) \)$, normalized by $integral_0^1 h \( u \) thin d u = 1$. For small $s$, put
  #[#set math.equation(numbering: n => "(4.11)")
   $ f_s \( y \) = s^(- 2) integral_X h #scale(x: 120%, y: 120%)[\(] "dist" \( y \, z \)^2 \/ s^2 #scale(x: 120%, y: 120%)[\)] thin d mu \( z \) \, #h(2em) M_s \( z \) = mu \( B_s \( z \) \) . $ <eq:density-smoothed>]
  The function $f_s$ is smooth: the support lies inside the injectivity radius, and the cutoff vanishes near its boundary. The mass bound makes $f_s$ uniformly bounded. Integration with respect to the radial distribution of $mu$ gives
  $ f_s \( y \) = - integral_0^1 h' \( u \) thin frac(mu \( B_(s sqrt(u)) \( y \) \), s^2) thin d u arrow.r - theta.alt \( y \) integral_0^1 u h' \( u \) thin d u = theta.alt \( y \) . $
  There are no atoms by quadratic growth, so no endpoint term occurs at $u = 0$. Thus $f_s arrow.r 0$ volume-almost-everywhere as well.
  Fix a smooth one-form $alpha$. To prove that $b \( theta.alt \) N$ is closed, apply closedness of $T = N + Q$ before passing to the density limit:
  #[#set math.equation(numbering: n => "(4.12)")
   $ 0 = T #scale(x: 120%, y: 120%)[\(] d \( b \( f_s \) alpha \) #scale(x: 120%, y: 120%)[\)] = T #scale(x: 120%, y: 120%)[\(] b \( f_s \) d alpha #scale(x: 120%, y: 120%)[\)] + T #scale(x: 120%, y: 120%)[\(] b' \( f_s \) thin d f_s and alpha #scale(x: 120%, y: 120%)[\)] . $ <eq:density-weight-product-rule>]
  The first term has the required limit. Indeed, dominated convergence gives
  $ b \( f_s \) N arrow.r b \( theta.alt \) N \, #h(2em) b \( f_s \) Q arrow.r 0 $
  as currents. The second convergence uses $b \( 0 \) = 0$, the volume-almost-everywhere convergence of $f_s$, and domination by $C \| Q \|$.
  It remains to show that the derivative term in (4.12) vanishes. The derivative of $b$ is bounded on the common bounded range of the $f_s$. Write $\| d f_s \|_ell$ for the norm of the restriction to the plane of $ell$. The $N$ contribution is bounded by a constant times $parallel alpha parallel_(C^0) integral \| d f_s \|_ell thin d lambda$, and the $Q$ contribution is bounded by a constant times $parallel alpha parallel_(C^0) integral \| Q \| thin \| d f_s \| thin d V_g$. We therefore need exactly two estimates:
  #[#set math.equation(numbering: n => "(4.13)")
   $ integral_X \| Q \| thin \| d f_s \| thin d V_g = o \( 1 \) \, #h(2em) integral \| d f_s \|_ell thin d lambda \( y \, ell \) = o \( 1 \) . $ <eq:density-two-gradient-estimates>]
  #emph[The derivative against $Q$.] Differentiating the radial kernel gives $\| d f_s \( z \) \| lt.eq C s^(- 3) M_s \( z \)$. Fubini and the volume bound give
  $ integral_X M_s thin d V_g = integral_X "vol"_g \( B_s \( y \) \) thin d mu \( y \) lt.eq C s^4 . $
  Moreover $M_s \/ s^2$ is uniformly bounded and tends to zero volume-almost-everywhere. Therefore
  #[#set math.equation(numbering: n => "(4.14)")
   $ s^(- 3) integral_X \| Q \| M_s thin d V_g & lt.eq (integral_X \| Q \|^2 M_s / s^2 thin d V_g)^(1 \/ 2) (s^(- 4) integral_X M_s thin d V_g)^(1 \/ 2)\
 & = o \( 1 \) . $ <eq:density-q-gradient>]
  The first factor tends to zero by dominated convergence against $\| Q \|^2 d V_g$, and the second is bounded. This proves the first estimate in (4.13).
  #emph[The tangential derivative.] Closedness will convert tangential differentiation into normal derivatives. The radial kernel then supplies a transverse displacement factor, multiplied by the difference between nearby complex-line directions. The transverse estimate of 21 and the angular-energy bound will control these two factors together.
  Fix a center and line $\( y \, ell \)$. Choose an orthonormal basis of $T_y X$ whose first two vectors span the oriented plane of $ell$, and let $zeta_1 \, dots.h \, zeta_4$ be the corresponding normal coordinates. The estimates below are uniform in this choice, so a measurable choice of such bases suffices when integrating in $\( y \, ell \)$. Write
  $ k_s^y \( z \) = h \( \| zeta \|^2 \/ s^2 \) \, #h(2em) q_i \( z \) = partial_(zeta_i) k_s^y \( z \) \, #h(2em) omega_12 = d zeta_1 and d zeta_2 . $
  First variation of squared distance yields
  #[#set math.equation(numbering: n => "(4.15)")
   $ d f_s \( y \) \( e_i \) = - s^(- 2) integral q_i \( z \) thin d mu \( z \) \, #h(2em) i = 1 \, 2 . $ <eq:density-first-variation>]
  The sign comes from differentiating the center; the displayed $q_i$ differentiates the radial expression in its coordinate variable.
  We replace this scalar integral by $T \( q_i omega_12 \)$. On $B_s \( y \)$, normal coordinates and parallel transport differ by $O \( s^2 \)$, and hence
  #[#set math.equation(numbering: n => "(4.16)")
   $ omega_12 \( m \) & = chevron.l ell \, tau_(z y) m chevron.r + O \( s^2 \) \,\
\| 1 - omega_12 \( m \) \| & lt.eq C #scale(x: 120%, y: 120%)[\(] s^2 + \| ell - tau_(z y) m \|^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:density-tangent-form-error>]
  The second identity uses that both bivectors have unit length. Since $\| q_i \| lt.eq C \/ s$, the integrated replacement error is at most
  #[#set math.equation(numbering: n => "(4.17)")
   $ & s^(- 2) integral lr(|integral q_i thin d mu - T \( q_i omega_12 \)|) d lambda \( y \, ell \)\
 & #h(1cm)  lt.eq C s^(- 3) (s^2 integral.double_("dist" \( y \, z \) < s) d mu \( y \) d mu \( z \) + cal(A)_s) + C s^(- 3) integral_X \| Q \| M_s thin d V_g = o \( 1 \) . $ <eq:density-replacement-error>]
  Here the double mass is $O \( s^2 \)$, the angular integral is $O \( s^4 \)$, and the last term tends to zero by (4.14). The normal-coordinate term is consequently $O \( s \)$.
  For $i = 1$, closedness of $T$ on $d \( k_s^y thin d zeta_2 \)$ gives
  $ T \( q_1 omega_12 \) = - sum_(a = 3)^4 T \( q_a thin d zeta_a and d zeta_2 \) . $
  For $i = 2$, using $d \( k_s^y thin d zeta_1 \)$ gives the analogous formula, with an irrelevant overall sign. These are legitimate smooth compactly supported tests because the cutoff vanishes near the boundary of the coordinate ball. The mixed forms satisfy, for $k = 1 \, 2$ and $a = 3 \, 4$,
  #[#set math.equation(numbering: n => "(4.18)")
   $ \| \( d zeta_a and d zeta_k \) \( m \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] s^2 + \| ell - tau_(z y) m \| #scale(x: 120%, y: 120%)[\)] . $ <eq:density-mixed-form-error>]
  Their value on the transported center line is zero, accounting for the linear angular bound. The normal derivative of the radial kernel has the sharper estimate
  #[#set math.equation(numbering: n => "(4.19)")
   $ \| q_a \( z \) \| lt.eq C s^(- 1) lr(|"pr"_(ell^perp) zeta \/ s|) . $ <eq:density-normal-derivative>]
  Replacing $T$ by $N + Q$ in these mixed terms, the $Q$ contribution again tends to zero by (4.14); the $s^2$ geometric error contributes $O \( s \)$. Cauchy–Schwarz for the two remaining angular and transverse factors bounds the rest by
  #[#set math.equation(numbering: n => "(4.20)")
   $ C s^(- 3) cal(A)_s^(1 \/ 2) cal(T)_s^(1 \/ 2) = s^(- 3) O \( s^2 \) o \( s \) = o \( 1 \) . $ <eq:density-angular-transverse-product>]
  Combining (4.15), (4.17), (4.20) proves the second estimate in (4.13).
  #emph[The closed weighted limit.] The two derivative estimates now allow passage to the limit in (4.12). Its derivative term tends to zero, and its first term tends to $b \( theta.alt \) N \( d alpha \)$. Hence this last expression vanishes for every smooth one-form $alpha$, proving the first assertion.
  The remaining weights are obtained in a separate limit, after this argument has been completed for each fixed smooth $b$. Choose a smooth nondecreasing function $chi : bb(R) arrow.r \[ 0 \, 1 \]$ which is zero on $\( - oo \, 0 \]$ and one on $\[ 1 \, oo \)$. The smooth bounded functions $chi \( n t \)$ converge pointwise to $upright(bold(1))_({ t > 0 })$ on $\[ 0 \, oo \)$, and vanish at zero. For fixed $a > 0$, the functions
  $ b_(a \, n) \( t \) = cases(delim: "{", pi thin chi \( n \( t - a \) \) \/ t \, & t > 0 \,, 0 \, & t lt.eq 0) $
  are smooth, vanish near zero, and are uniformly bounded by $pi \/ a$. They converge at every $t gt.eq 0$ to $upright(bold(1))_({ t > a }) pi \/ t$, with value zero at $t = a$. Dominated convergence and closedness of each smooth-weight current prove (4.10). No derivative bound uniform in $n$ is used: the smoothing limit was taken first for each $n$. Finally $N^d + Q = T - N^(+)$ is closed. ◻
]

=== 4.3 The diffuse pairing and compatible forms <the-diffuse-pairing-and-compatible-forms>

We can now subtract the closed positive-density part of the current. On the remaining zero-density set, the negative kernel error tends to zero. The resulting intersection pairing first proves compatibility and then gives the nonnegative square needed for the class criterion.

#prodef([Lemma 4.7.])[
  (Vanishing of the diffuse kernel error).  #emph[Set 
$ B_s \( z \) = s^(- 2) integral_X \( 1 + "dist" \( y \, z \) \/ s \)^(- 6) thin d mu \( y \) . $

 These functions are uniformly bounded, and $B_s \( z \) arrow.r 0$ whenever $theta.alt \( z \) = 0$. In particular, 
#[#set math.equation(numbering: n => "(4.21)")
 $ integral_X B_s \( z \) thin d mu^d \( z \) arrow.r 0 \, #h(2em) mu^d = upright(bold(1))_({ theta.alt = 0 }) mu . $ <eq:density-diffuse-error>]

]
] <lem:density-diffuse-error>

#proof[
  For each dyadic shell, quadratic growth gives the summable bound
  $ s^(- 2) \( 1 + 2^j \)^(- 6) mu \( B_(2^(j + 1) s) \( z \) \) lt.eq C thin 2^(- 4 j) . $
  The same estimate holds once the radius exceeds a fixed small radius, by increasing $C$ and using the finite total mass. This proves uniform boundedness. If $theta.alt \( z \) = 0$, each fixed shell contribution tends to zero, because $s^(- 2) mu \( B_(2^(j + 1) s) \( z \) \) arrow.r 0$. The summable bound then proves pointwise convergence. A second application of dominated convergence proves (4.21). ◻
]

For closed currents $S \, S'$ under consideration, the smoothing operator $S_s = \( 1 + s^2 Delta_g \)^(- 3)$ preserves their cohomology classes and commutes with the Hodge star. Hodge decomposition therefore gives

#[#set math.equation(numbering: n => "(4.22)")
 $ chevron.l S_s S \, * S_s S' chevron.r_(L^2) = frak(c) \( S \) dot.op frak(c) \( S' \) \, $ <eq:density-smoothed-intersection>]

independently of $s$. Their Sobolev regularity after smoothing is sufficient for this identity; it can also be obtained by an additional heat regularization and passage to the limit.

#proof[
  Suppose that no compatible symplectic form exists. The separator in 9 gives a nonzero positive current $N$, normalized to have trace mass one, and an anti-invariant $Q$ such that $T = N + Q$ annihilates all smooth closed two-forms. In particular $T$ is closed and $frak(c) \( T \) = 0$. The preceding results apply to this separator.
  By 22, $T^d = N^d + Q$ is closed. Equation (4.22) gives
  #[#set math.equation(numbering: n => "(4.23)")
   $ 0 & = chevron.l S_s T \, * S_s T^d chevron.r\
 & = chevron.l S_s N \, * S_s N^d chevron.r + chevron.l S_s N \, S_s Q chevron.r + chevron.l S_s Q \, S_s N^d chevron.r + parallel S_s Q parallel_2^2 . $ <eq:density-compatibility-pairing>]
  The self-duality of $Q$ accounts for the signs in this expansion. Both mixed terms tend to zero by 16. The positive-current lower bound of 14, applied with second submeasure $lambda^d = upright(bold(1))_({ theta.alt = 0 }) lambda$, gives
  $ chevron.l S_s N \, * S_s N^d chevron.r gt.eq - C integral_X B_s thin d mu^d = o \( 1 \) . $
  Since $S_s Q arrow.r Q$ in $L^2$, taking a limit inferior in (4.23) forces $parallel Q parallel_2^2 = 0$. Thus $T = N$ is a nonzero positive current annihilating all closed forms.
  Let $eta$ be a taming symplectic form. Compactness of the bundle of unit complex lines and strict taming give $eta_y \( ell \) gt.eq c_eta > 0$. Consequently
  $ N \( eta \) gt.eq c_eta mu \( X \) > 0 \, $
  contradicting its annihilation property. This proves compatible-form existence. The proof has used neither rectifiability nor a theorem representing integral cycles by curves. ◻
]

#prodef([Lemma 4.8.])[
  (Nonnegative diffuse square).  #emph[If $Q = 0$, then $N^d$ is closed and $frak(c) \( N^d \)^2 gt.eq 0$.]
] <lem:density-diffuse-square>

#proof[
  Closedness follows from 22. By (4.22), Lemma 3.6,
  $ frak(c) \( N^d \)^2 = chevron.l S_s N^d \, * S_s N^d chevron.r gt.eq - C integral_X B_s thin d mu^d . $
  The right side tends to zero by 23. ◻
]

=== 4.4 Integral thresholds and positivity of the class <integral-thresholds-and-positivity-of-the-class>

To use the hypothesis on curve classes, we must turn the positive-density current into integral cycles. The factor $pi \/ theta.alt$ in $I_a$ is chosen to make their multiplicity one. Rectifiability and closedness will be checked before applying the regularity theorem that produces curves.

#prodef([Lemma 4.9.])[
  (The threshold cycles).  #emph[For every $a > 0$, the current $I_a$ in (4.10) is an integral two-cycle with positive $J$-complex tangent orientation. If $J$ is tamed, it is a finite sum of currents of integration over irreducible closed $J$-holomorphic curves, with positive integer multiplicities. Moreover the identity 
#[#set math.equation(numbering: n => "(4.24)")
 $ N^(+) = 1 / pi integral_0^oo I_a thin d a $ <eq:density-layer-cake>]

 holds as an absolutely convergent integral of currents.]
] <lem:density-integral-thresholds>

#proof[
  Put $E_(+) = { theta.alt > 0 }$ and $mu^(+) = upright(bold(1))_(E_(+)) mu$. At $mu^(+)$-almost every $p$, Euclidean coordinate-ball differentiation of $upright(bold(1))_(E_(+))$ gives value one. The coordinate-ball enclosure argument in 20, applied to this bounded function, gives
  $ s^(- 2) \( mu - mu^(+) \) \( B_(R s) \( p \) \) arrow.r 0 #h(2em) \( R < oo upright(" fixed") \) . $
  Thus $mu^(+)$ has the same positive finite two-density and the same planar tangent measure as $mu$ at almost every such point. Under a smooth coordinate change its limit is the linear image of the same plane measure. Thus, in any fixed coordinate chart, the Euclidean two-density exists and is positive and finite almost everywhere for the pushed-forward measure: every Euclidean sphere has zero mass for the limiting plane measure. Preiss’s rectifiability theorem therefore makes $mu^(+)$ a two-rectifiable measure #cite(label("Preiss1987")); see also the theorem’s formulation in #cite(label("KenigPreissToro2009")) p. 771, opening paragraph. On a countably rectifiable carrier $E$ it has the representation
  #[#set math.equation(numbering: n => "(4.25)")
   $ mu^(+) = theta.alt / pi thin cal(H)_g^2 #h(-0.16667em) harpoon.tr E . $ <eq:density-rectifiable-measure>]
  Here $pi$ is the area of the Euclidean unit two-disk. The density identification follows from differentiation on a rectifiable carrier. Its approximate tangent plane agrees almost everywhere with the unique plane in 20. Thus $N^(+)$ is integration over $E$ with that complex tangent orientation and multiplicity $theta.alt \/ pi$.
  Multiplying by the weight defining $I_a$ cancels this multiplicity: $I_a$ is integration with integer multiplicity one over $E ∩ { theta.alt > a }$. Its mass is at most $pi mu \( X \) \/ a$, and its boundary vanishes by 22. It is consequently an integral current: it is integer rectifiable, has finite mass, and has the zero integral current as its boundary.
  Suppose now that $J$ is tamed. By the already proved 17, a compatible symplectic form exists. In particular, the local compatibility hypothesis of the Rivière–Tian regularity theorem holds. That theorem applies to integer rectifiable almost complex cycles and represents them by $J$-holomorphic curves, with only isolated singularities #cite(label("RiviereTian2009")) Theorem I.1. Integral multiplicity and complex orientation do not depend on the choice of Hermitian metric, so we may use the metric of this compatible symplectic form for that application. Normalize the resulting curve by separating its local branches at the isolated singularities; the local completion is part of the curve representation #cite(label("RiviereTian2009")) Section VIII. Its normalization components are closed. Compactness and local finiteness give only finitely many global components; equivalently, small-ball monotonicity gives a uniform positive lower area for each nonconstant closed component, whereas the total mass is finite. Factoring each component through its somewhere-injective image gives the asserted finite sum of irreducible closed curves with positive integer multiplicities.
  Finally, pointwise on ${ theta.alt > 0 }$,
  $ integral_0^oo upright(bold(1))_({ theta.alt > a }) pi / theta.alt thin d a = pi . $
  For a smooth two-form $alpha$, Fubini is justified by
  $ integral_0^oo \| I_a \( alpha \) \| thin d a lt.eq pi parallel alpha parallel_(C^0) mu^(+) \( X \) . $
  This proves (4.24) with its stated normalization. ◻
]

#proof[
  Assume that the class $H$ has no taming representative. The class separator of 9 gives a nonzero closed positive current $N$, with $Q = 0$, satisfying
  #[#set math.equation(numbering: n => "(4.26)")
   $ H dot.op frak(c) \( N \) lt.eq 0 . $ <eq:density-cone-separator>]
  Its positive-density and diffuse parts are separately closed. The anti-invariance of $A \, C$ implies
  $ frak(c) \( N^d \) dot.op \[ A \] = N^d \( A \) = 0 \, #h(2em) frak(c) \( N^d \) dot.op \[ C \] = N^d \( C \) = 0 . $
  Thus $w = frak(c) \( N^d \)$ lies in $V$, and $w^2 gt.eq 0$ by 24.
  If $N^d eq.not 0$, choose a taming form $eta$ in $U$. Strict taming on the compact bundle of unit complex lines gives
  $ U dot.op w = N^d \( eta \) > 0 . $
  In particular $w eq.not 0$. Since $\[ A \] \, \[ C \]$ span a positive two-plane and $b^(+) = 3$, the intersection form on $V$ has signature $\( 1 \, b^(-) \)$. The conditions $w^2 gt.eq 0$ and $U dot.op w > 0$ put $w$ in the nonzero closed time cone determined by $U$. Every timelike $H$ in that component has $H dot.op w > 0$. Explicitly, take a unit timelike vector $u$ in the direction of $U$, and write $H = h_0 u + h_(-)$, $w = w_0 u + w_(-)$, with orthogonal negative components. Then
  $ h_0 > \| h_(-) \| \, #h(2em) w_0 gt.eq \| w_(-) \| \, #h(2em) w_0 > 0 \, $
  so
  $ H dot.op w gt.eq h_0 w_0 - \| h_(-) \| thin \| w_(-) \| > 0 . $
  If $N^d = 0$, its pairing is instead zero. This distinguishes the nonzero diffuse case required for strict positivity.
  For every $a > 0$, 25 expresses $I_a$ as a positive integral sum of irreducible closed $J$-holomorphic curves. The hypothesis on $H$ therefore gives
  $ H dot.op frak(c) \( I_a \) gt.eq 0 \, $
  with strict inequality whenever $I_a eq.not 0$. If $N^(+) eq.not 0$, the layer identity has positive total mass, so the set of $a$ for which $I_a eq.not 0$ has positive Lebesgue measure. Pairing (4.24) with any smooth representative of $H$ then gives $H dot.op frak(c) \( N^(+) \) > 0$. The pairing is zero when $N^(+) = 0$. At least one of $N^d \, N^(+)$ is nonzero, and hence
  $ H dot.op frak(c) \( N \) = H dot.op frak(c) \( N^d \) + H dot.op frak(c) \( N^(+) \) > 0 . $
  This contradicts (4.26) and proves the theorem. A smooth closed taming representative is symplectic by pointwise nondegeneracy. ◻
]

== 5 The coefficient sphere and curves through a point <sec:families>

The sphere of almost-complex structures associated with a definite triple has one more useful feature than an individual tamed structure: its symplectic perturbations wind once around the Seiberg–Witten wall. The use of this winding sphere to construct an elliptic fibration realizes the program proposed in #cite(label("Li2010SCY")) Section 7.4.1. We calculate the resulting families invariant, including the line bundle involved in evaluating a spinor at a point. Only the existence and compactness direction of Taubes’s theorem is needed.

Throughout this section, curve classes are identified with their Poincare duals. An integral class written in $Lambda = H^2 \( X \; bb(Z) \) \/ upright("torsion")$ may be lifted to $H^2 \( X \; bb(Z) \)$ when specifying a line bundle. Curve configurations and their total classes will only be required modulo torsion. By 6,

#[#set math.equation(numbering: n => "(5.1)")
 $ b^(+) = 3 \, #h(2em) \( b_1 \, sigma \) = \( 0 \, - 16 \) med upright("or") med \( 4 \, 0 \) \, #h(2em) 2 chi + 3 sigma = 0 . $ <eq:families-topology>]

Let $J_v$, $v in S^2$, be the coefficient sphere of 7, with sign chosen so that $B_v = v dot.op omega$ tames $J_v$. Write $P = "span" { \[ omega_1 \] \, \[ omega_2 \] \, \[ omega_3 \] }$ for the original positive period plane.

A positive curve configuration is a finite sum of irreducible closed pseudoholomorphic curves with positive integer multiplicities. The main output of the section is the following existence statement.

#prodef([Theorem 5.1.])[
  #emph[Let $F in Lambda$ be nonzero with $F^2 = 0$, and write $F^(+) = "pr"_P F$. For every $p in X$, there exists a finite positive $J_v$-holomorphic configuration of total class $F$ whose support contains $p$. Its parameter is necessarily the coefficient direction 
$ v = frac(F^(+), \| F^(+) \|) \, $

 where $P$ is identified with $bb(R)^3$ by the normalized ordered period basis. Thus the almost-complex structure is the same for all prescribed points.]
] <thm:family-curves>

The proof uses the wall-crossing calculation to force a zero of the first spinor component at a prescribed point, then retains that point in a large-parameter curve limit. It produces configurations; the choice of class in 6 will make each of them one reduced irreducible curve.

=== 5.1 A smooth compatible family <a-smooth-compatible-family>

#prodef([Lemma 5.2.])[
  #emph[There is a smooth family of closed $J_v$-compatible forms $eta_v$. Orthogonal projection to the original positive plane $P$ satisfies 
$ "pr"_P \[ eta_v \] = a \( v \) \[ B_v \] \, #h(2em) a \( v \) > 0 . $

 Consequently the normalized period projection of this family has degree one in the coefficient coordinates.]
] <lem:compatible-family>

#proof[
  Fix a metric $g_0$ in the conformal class determined by the original triple. All $J_v$ are orthogonal for $g_0$, and the three closed self-dual forms $omega_i$ span its self-dual harmonic forms because $b^(+) = 3$. Denote by $R_v$ the projection to the $J_v$-anti-invariant two-forms, and consider
  $ L_v^(upright("ell")) = R_v upright(d) upright(d)^(*) quad upright("on the anti-invariant forms") \, $
  where the adjoint is taken with respect to $g_0$. This is the nonnegative elliptic operator in 10. Its kernel consists exactly of the closed anti-invariant forms: its quadratic form is $parallel upright(d)^(*) xi parallel_2^2$, and an anti-invariant form is self-dual, so coclosedness implies closedness. Its kernel is therefore precisely
  $ {sum_(i = 1)^3 a_i omega_i : a dot.op v = 0} \, $
  a smooth vector bundle of rank two over $S^2$.
  Let $H_v$ be the projection onto this explicit kernel. In local parameter coordinates, identify the varying anti-invariant bundles by their orthogonal projections. The kernel projection is then smooth, and $L_v^(upright("ell")) + H_v$ is invertible from $H^(s + 2)$ to $H^s$. The inverse identity and elliptic regularity give smooth dependence on each Sobolev scale, as in the parameter statement of 10. Thus the generalized inverse is
  $ G_v = \( L_v^(upright("ell")) + H_v \)^(- 1) \( "Id" - H_v \) \, $
  and
  #[#set math.equation(numbering: n => "(5.2)")
   $ D_v = upright(d) upright(d)^(*) G_v + H_v \, #h(2em) R_v D_v = "Id" \, #h(2em) upright(d) D_v = 0 $ <eq:families-closed-correction>]
  is a smooth family of closed lifts.
  For any $v_0$, 17 supplies a compatible form $eta$ for $J_(v_0)$. For $v$ near $v_0$, set $eta_v^(\( v_0 \)) = eta - D_v R_v eta$. These forms are closed and $J_v$-invariant, equal $eta$ at $v_0$, and remain positive after shrinking the parameter neighborhood. A finite parameter partition of unity patches these local families. Since its coefficients depend only on $v$, this operation preserves closedness on $X$; positivity and invariance are preserved by convexity.
  The class $\[ eta_v \]$ is orthogonal to the classes of the two anti-invariant forms, so its projection to $P$ is a multiple of $\[ B_v \]$. Moreover $integral_X eta_v and B_v > 0$: the invariant part of $B_v$ is positive, and its anti-invariant part wedges trivially with $eta_v$. Since $\[ B_v \]^2 = 1$, the multiple is positive. ◻
]

=== 5.2 The fixed spin-c structure and the equations <the-fixed-spin-c-structure-and-the-equations>

Fix the canonical $upright("Spin")^c$ structure of one $J_v$, and denote its isomorphism type by $frak(s)_0$. The structures $J_v$ form a connected family, so all their canonical structures have this same fiberwise isomorphism type. For $E in H^2 \( X \; bb(Z) \)$, let $frak(s)_E = frak(s)_0 ⊗ L_E$, where $c_1 \( L_E \) = E$. We use the extension of this fixed structure over the contractible space of metrics; there is no twist from the parameter base. Its determinant class and dimensions are

#[#set math.equation(numbering: n => "(5.3)")
 $ c_1 \( det frak(s)_E \) = 2 E \, #h(2em) d \( frak(s)_E \) = E^2 \, #h(2em) "ind"_(bb(C)) "D̸"_E = frac(4 E^2 - sigma, 8) . $ <eq:families-dimensions>]

Fix a homology orientation once and for all.

Given a compatible pair $\( eta \, J \)$, put $g \( u \, w \) = eta \( u \, J w \)$. Then $eta$ is self-dual and has length $sqrt(2)$. For a fixed $upright("Spin")^c$ structure with positive spinor bundle $W^(+)$ and determinant line $L$, we use the following normalization of the symplectic Seiberg–Witten equations:

#[#set math.equation(numbering: n => "(5.4)")
 $ "D̸"_(cal(A)) psi = 0 \, #h(2em) F_(cal(A))^(+) = r thin frak(q)_g \( psi \) - frac(i r, 4) eta \, #h(2em) r gt.eq 1 . $ <eq:families-taubes-equations>]

Here $cal(A)$ is a unitary determinant connection and $frak(q)_g$ is the quadratic map with the normalization of #cite(label("Taubes1999")) Equation (2.9). The spinor is normalized by $r^(- 1 \/ 2)$ relative to the usual unscaled equations.

Clifford multiplication by $eta$ splits $W^(+) = cal(E) xor K_J^(- 1) cal(E)$, with $psi = \( alpha \, beta \)$; the first summand is its $- i sqrt(2) \| eta \| = - 2 i$ eigenspace. Equivalently,

#[#set math.equation(numbering: n => "(5.5)")
 $ alpha = 1 / 2 ("Id" + i / 2 c^(+) \( eta \)) psi . $ <eq:families-first-component>]

This is the convention of #cite(label("Taubes1999")) Equation (3.17) and Section 6, which is used in its zero-support proof. In particular this is an intrinsic projection in a fixed $upright("Spin")^c$ structure, and its zero set does not depend on a local identification with the canonical structure.

For the coefficient family $J_v$ and the fixed structure $frak(s)_E$, the Spin-c twisting action, together with the actual homotopy of the canonical structures, identifies this first summand on every fiber with a line of integral Chern class $E$. This identification uses the Spin-c structure itself: equality of determinant Chern classes alone would lose possible two-torsion.

#prodef([Lemma 5.3.])[
  (Compact-family Taubes compactness with incidence).  #emph[Let $\( eta_n \, J_n \, g_n \)$ be compatible symplectic backgrounds on $X$ converging in $C^oo$ to $\( eta_oo \, J_oo \, g_oo \)$, with $g_n = eta_n \( dot.op \, J_n dot.op \)$. Fix a $upright("Spin")^c$ structure. Suppose that $r_n arrow.r oo$ and that $\( cal(A)_n \, psi_n \)$ solves (5.4) for the $n$-th background. If the first eigenline has Chern class $E$ on each fiber, there is a subsequence and a possibly empty finite positive $J_oo$-holomorphic configuration 
$ cal(C) = sum_a m_a C_a \, #h(2em) m_a in bb(N) \, #h(2em) \[ cal(C) \] = E quad upright("in ") H^2 \( X \; bb(R) \) . $

 Every limit of points $p_n in alpha_n^(- 1) \( 0 \)$ belongs to $"spt" cal(C)$. In particular, if $E = 0$ over $bb(R)$, then no such sequence of zeros exists. Over any compact smooth family of compatible backgrounds, all first components in this zero-class case are nowhere zero for sufficiently large $r$, with one threshold for the whole family.]
] <lem:families-taubes-compactness>

The proof, including the passage to the limiting almost-complex structure and retention of the point constraint, is given in 5.7.

#prodef([Remark 5.4.])[
  Equation (5.4) uses no additional bounded curvature term in its perturbation. This is the exact normalization of #cite(label("Taubes1999")) Theorem 2.2. Adding the usual bounded canonical-curvature term gives the same large-parameter chamber, but such a change is unnecessary here. Canonical determinant connections will enter the curvature current in the compactness proof; only their restrictions and curvatures along $X$ occur. No connection in parameter directions is required by the equations.
] <rem:families-exact-equations>

=== 5.3 The spherical wall coefficient <the-spherical-wall-coefficient>

For $p in X$, quotient the irreducible configuration space first by the gauge transformations equal to one at $p$. Its remaining circle bundle defines a degree-two class $U_p$. Choose its sign so that, on a reducible link given by projectivizing Dirac kernels, it restricts to $c_1 \( cal(O) \( 1 \) \)$. The spinor gauge action has weight one in this convention.

Write

$ "Pic"^0 \( X \) = H^1 \( X \; bb(R) \) \/ "im" #scale(x: 120%, y: 120%)[\(] H^1 \( X \; bb(Z) \) arrow.r H^1 \( X \; bb(R) \) #scale(x: 120%, y: 120%)[\)] $

for the torus of topologically trivial unitary flat line bundles. It is the identity component of the space of unitary flat line bundles; the universal line over $X times "Pic"^0 \( X \)$ is normalized at $p$.

#prodef([Lemma 5.5.])[
  (Critical spherical wall crossing).  #emph[Suppose $E^2 gt.eq - 2$, and put $q = \( E^2 + 2 \) \/ 2$. For the product manifold family over $S^2$, with the fixed $frak(s)_E$ just specified, the difference between two chamber evaluations of $U_p^q$ is 
#[#set math.equation(numbering: n => "(5.6)")
 $ plus.minus deg \( upright("difference of wall sections") \) integral_("Pic"^0 \( X \)) s_(b_1 \/ 2) \( "Ind" "D̸"_E \) . $ <eq:families-wall-formula>]

 Here $s$ denotes the inverse total Chern class, and the Dirac family over $"Pic"^0 \( X \)$ uses the universal flat twisting line normalized at $p$. The constant family evaluation is zero. For the large-parameter family (5.4) associated with $eta_v$, the degree difference from a constant family has absolute value one.]
] <lem:families-wall-crossing>

#proof[
  The critical wall-crossing theorem and its section-class version are #cite(label("LiLiu2001")) Theorem 4.10 and Proposition 4.11. We check the normalization and degree relevant here. A transverse homotopy between two families meets the harmonic wall at isolated parameters in $S^2 times \[ 0 \, 1 \]$, because its normal rank is $b^(+) = 3$. Above such a parameter the reducibles form the torus $"Pic"^0 \( X \)$. Represent the complex Dirac index on this torus as $K - O$, with ranks $k \, o$, using a stabilization when necessary. Write $x = c_1 \( cal(O) \( 1 \) \)$ on the projective bundle of lines $pi : bb(P) \( K \) arrow.r "Pic"^0 \( X \)$. The obstruction bundle contributes $e \( cal(O) \( 1 \) ⊗ O \) = sum_i x^(o - i) c_i \( O \)$. Projective pushforward therefore gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ pi_(*) (x^q sum_i x^(o - i) c_i \( O \)) & = sum_i s_(q + o - \( k - 1 \) - i) \( K \) c_i \( O \)\
 & = s_(b_1 \/ 2) \( K - O \) \, $ <eq:families-projective-pushforward>]
  since (5.1), (5.3) imply $q + o - \( k - 1 \) = b_1 \/ 2$. The normal crossing signs sum to the degree difference, giving (5.6).
  The based-gauge normalization makes the universal flat line trivial at $p$. Thus no Picard-base line is added to $x$. Writing a determinant connection as a canonical connection plus twice a twisting connection does not alter this conclusion: the remaining circle acts on the spinor with weight one, as used in (5.7).
  For a constant regular family, negative ordinary expected dimension gives an empty moduli space. Otherwise the moduli space is the product of an ordinary $E^2$-dimensional moduli space with $S^2$, while $U_p^q$ is pulled back from the former and has degree $E^2 + 2$. Its pairing is therefore zero.
  Every maximal positive harmonic plane projects isomorphically to $P$: the kernel would lie in the negative definite space $P^perp$. This identifies the harmonic-wall bundle with the fixed oriented vector space $P$. For the perturbation in (5.4), its wall section has leading term $\( r \/ 4 \) \[ eta_v \]$, with a bounded shift from $2 E$. By 27, it is nonzero for all sufficiently large $r$ and its normalization has degree one. The same is true after sufficiently small generic family perturbations. ◻
]

All families pairings below are computed with such generic perturbations in the indicated chamber. The following elementary compactness observation specifies how we return to the exact equations. At a fixed $r$, consider a sequence of backgrounds in a compact smooth parameter family and a sequence of smooth perturbations converging in $C^oo$. Any corresponding sequence of solutions has, modulo gauge, a smoothly convergent subsequence solving the limiting equations. This follows from the spinor Weitzenbock bound, the abelian curvature equation, gauge fixing and elliptic bootstrapping; see #cite(label("LiLiu2001")) Section 2.1. Thus nonemptiness for perturbations tending to zero gives a solution of the exact equations. If all the perturbed solutions chosen satisfy $alpha \( p \) = 0$, that condition is retained. In using 28 we first take this perturbation limit at each fixed $r$, and only then let $r arrow.r oo$.

=== 5.4 The evaluation line over the coefficient sphere <the-evaluation-line-over-the-coefficient-sphere>

For $E^2 = 0$, write $"FSW"_E \( U_p \)$ for the spherical pairing of $U_p$ in the large-parameter chamber, and $"SW"_X \( E \)$ for the ordinary dimension-zero invariant of $frak(s)_E$. Denote by $pi$ the projection of the regular family moduli space to $S^2$.

Let $h in H^2 \( S^2 \; bb(Z) \)$ be the oriented generator. The first eigenline in the fixed spin-c family is a line bundle $cal(E)_E arrow.r X times S^2$, whose restriction to each fiber has Chern class $E$.

#prodef([Lemma 5.6.])[
  #emph[There is an integer $e$, with $\| e \| = 1$, such that 
$ c_1 \( cal(E)_E \) = E + e h . $

 If $E^2 = 0$, first-component evaluation at $p$ on a regular two-dimensional family moduli space is a section of a line bundle with first Chern class $U_p + e pi^(*) h$. Consequently, if that evaluation is nowhere zero, 
#[#set math.equation(numbering: n => "(5.8)")
 $ "FSW"_E \( U_p \) + e "SW"_X \( E \) = 0 . $ <eq:families-evaluation-identity>]

 If the left side is nonzero, the exact large-parameter family has a solution with $alpha \( p \) = 0$.]
] <lem:families-evaluation-line>

#proof[
  Since $H^1 \( S^2 \) = 0$, the Kunneth decomposition shows that $c_1 \( cal(E)_E \) = E + e h$ for some integer $e$. At $p$, deform the compatible metrics to $g_0$ through $J_v$-Hermitian metrics. The fixed spin-c extension over metric space identifies the positive spinor bundles along this homotopy. For $g_0$, the first eigenspaces give the tautological line in the projective spinor sphere, pulled back by the coefficient sphere map. The latter has degree of absolute value one by 7, proving $\| e \| = 1$.
  The evaluation transforms with the same gauge weight as the spinor. Its sign can also be checked on a reducible link: evaluation on a kernel line $ell$ is a map $ell arrow.r cal(E)_E \|_p$, hence lies in $"Hom" \( ell \, cal(E)_E \|_p \) = cal(O) \( 1 \) ⊗ cal(E)_E \|_p$. On the quotient it is therefore a section of the tensor product of the based-gauge evaluation line with the pullback of $cal(E)_E \|_({ p } times S^2)$. Its Chern class is $U_p + e pi^(*) h$. Pairing $pi^(*) h$ with the family moduli cycle gives the ordinary dimension-zero invariant $"SW"_X \( E \)$; equivalently, restrict the family to a regular base point. A nowhere-zero evaluation section trivializes its line, giving (5.8).
  For the last assertion, suppose the exact family had no evaluation zero. Fixed-$r$ compactness would give the same absence for all sufficiently small perturbations: otherwise a sequence of their zeros would limit to an exact zero. Apply the preceding identity to a regular such perturbation to obtain a contradiction. ◻
]

The parameter line just computed also explains the globalization of the spinor splitting. The varying canonical determinant over $X times S^2$ has Chern class $- 2 e h$, while $c_1 \( cal(E)_E \) = E + e h$. Hence

$ c_1 \( K^(- 1) cal(E)_E^2 \) = - 2 e h + 2 \( E + e h \) = 2 E \, $

as required for the fixed determinant family. Fiberwise canonical identifications may therefore be used on parameter charts, with their natural transition maps, even though the canonical family itself is not the pulled-back fixed family. The vertical canonical connections and their curvature two-forms are globally defined.

=== 5.5 The Picard-torus calculation <the-picard-torus-calculation>

For $b_1 = 0$, the integral in (5.6) equals one. For $b_1 = 4$ we must calculate rather than assume a torus cohomology ring. Let $u in H^1 \( X \; bb(Z) \) ⊗ H^1 \( "Pic"^0 \( X \) \; bb(Z) \)$ be the mixed Chern class of the normalized universal flat line. The families index theorem, in the form used in #cite(label("LiLiu2001")) Section 4.2, gives

#[#set math.equation(numbering: n => "(5.9)")
 $ "ch" \( "Ind" "D̸"_E \) = integral_X e^(E + u) hat(A) \( T X \) \, #h(2em) "ch"_1 = integral_X frac(E u^2, 2) \, quad "ch"_2 = integral_X u^4 / 24 . $ <eq:families-index-character>]

In degree four on the Picard torus,

#[#set math.equation(numbering: n => "(5.10)")
 $ s_2 = c_1^2 - c_2 = 1 / 2 "ch"_1^2 + "ch"_2 . $ <eq:families-segre-two>]

The real cohomology-ring conclusion is known for symplectic Calabi–Yau surfaces with $b_1 = 4$; see #cite(label("Li2010SCY")) Proposition 7.8(4). We recover it here from the marked family calculation, which also gives the Segre pairing needed below.

#prodef([Proposition 5.7.])[
  #emph[If $b_1 = 4$, the quadruple cup product on $H^1 \( X \; bb(R) \)$ is nonzero. The cup-product map $and.big^2 H^1 \( X \; bb(R) \) arrow.r H^2 \( X \; bb(R) \)$ is an isomorphism, and every spherical homology class vanishes over $bb(R)$. For every $E$ with $E^2 = 0$, 
$ integral_("Pic"^0 \( X \)) s_2 \( "Ind" "D̸"_E \) eq.not 0 . $

]
] <prop:cup-product>

#proof[
  First take $E = 0$. Taubes’s canonical nonvanishing theorem #cite(label("Taubes1994")) gives $\| "SW"_X \( 0 \) \| = 1$, since $b^(+) > 1$. By 28, the exact symplectic family has no first-component zeros for all sufficiently large $r$. Fixed-$r$ compactness transfers this absence to sufficiently small regular perturbations. Applying (5.8) gives $\| "FSW"_0 \( U_p \) \| = 1$. On the other hand, 30 and (5.9), (5.10) identify this number, up to sign, with
  $ integral_("Pic"^0 \( X \)) integral_X u^4 / 24 \, $
  because $"ch"_1 = 0$ when $E = 0$. It follows that the quadruple cup product is nonzero.
  Here is an explicit calculation of the remaining assertion. Choose a basis $a_1 \, dots.h \, a_4$ of $H^1 \( X \; bb(R) \)$, let $t_1 \, dots.h \, t_4$ be the corresponding Picard-torus basis, and write
  $ delta = integral_X a_1 a_2 a_3 a_4 eq.not 0 \, #h(2em) u = sum_i a_i t_i . $
  The wedge pairing on $and.big^2 H^1 \( X \; bb(R) \)$ induced by this nonzero volume element is nondegenerate. Thus the cup-product map into $H^2 \( X \; bb(R) \)$ is injective. Both spaces have dimension six, by 6, so it is an isomorphism. We may consequently write $E = sum_(i < j) e_(i j) a_i a_j$. The graded-product signs give
  #[#set math.equation(numbering: n => "(5.11)")
   $ "ch"_2 & = delta thin t_1 t_2 t_3 t_4 \,\
"ch"_1 & = - delta #scale(x: 120%, y: 120%)[\(] e_34 t_1 t_2 - e_24 t_1 t_3 + e_23 t_1 t_4\
 & #h(40mm)  + e_14 t_2 t_3 - e_13 t_2 t_4 + e_12 t_3 t_4 #scale(x: 120%, y: 120%)[\)] \,\
E^2 & = 2 delta \( e_12 e_34 - e_13 e_24 + e_14 e_23 \) \,\
"ch"_1^2 & = delta E^2 thin t_1 t_2 t_3 t_4 . $ <eq:families-exterior-calculation>]
  Thus $E^2 = 0$ implies $"ch"_1^2 = 0$, and the Segre integral equals the same nonzero integral of $"ch"_2$ found for $E = 0$.
  Finally, a map $S^2 arrow.r X$ pulls back every class in $H^1 \( X \; bb(R) \)$ to zero, and therefore pulls back every product of two such classes to zero. These products span $H^2 \( X \; bb(R) \)$, so its homology class is zero by Poincare duality. ◻
]

=== 5.6 Curves through a point and exclusion of roots <curves-through-a-point-and-exclusion-of-roots>

#proof[
  The projection $F^(+)$ is nonzero: otherwise $F$ would be a nonzero square-zero vector in the negative definite space $P^perp$. Lift $F$ to an integral class and use the fixed spin-c structure $frak(s)_F$.
  Its ordinary invariant is zero. Indeed, choose the opposite coefficient direction $w = - F^(+) \/ \| F^(+) \|$, so that $F \[ B_w \] < 0$. If $"SW"_X \( F \) eq.not 0$, ordinary invariance and fixed-parameter monopole compactness would give solutions of (5.4) for arbitrarily large $r$ at this fixed background. Taubes compactness would give a nonempty positive $J_w$-holomorphic configuration of class $F$, contradicting its negative $B_w$-area.
  The spherical $U_p$ pairing is nonzero. For $b_1 = 0$, this follows directly from 30; for $b_1 = 4$, use 32 as well. Since the ordinary invariant vanishes, 31 forces a first-component zero over $p$ in the exact family for each sufficiently large $r$. Extracting a convergent parameter subsequence and applying 28 gives a configuration through $p$ in some $J_v$, with total class $F$.
  The two closed forms whose coefficients are perpendicular to $v$ are $J_v$-anti-invariant and restrict to zero on every component of this configuration. Thus $F^(+)$ is parallel to $\[ B_v \]$. Its $B_v$-area is positive, so the proportionality factor is positive, which proves the asserted direction. ◻
]

The unmarked wall calculation also excludes the square-minus-two classes needed in the lattice argument. This is a separate consequence of 30.

#prodef([Proposition 5.8.])[
  #emph[If $b_1 = 0$, no class $E in Lambda$ with $E^2 = - 2$ is orthogonal to $P$.]
] <prop:root-exclusion>

#proof[
  Lift $E$ to an integral line-bundle class. Its ordinary expected dimension is $- 2$, and its spherical family has dimension zero. By 30, its large-parameter unmarked family invariant is $plus.minus 1$. For each sufficiently large $r$, take small regular perturbations and then a fixed-$r$ limit to obtain an actual solution of (5.4) at some parameter $v_r$. Pass to a sequence with $v_r arrow.r v$, and apply 28. The limit is a nonempty positive $J_v$-holomorphic configuration of class $E$. Every nonconstant component has positive $B_v$-area, since $B_v$ tames $J_v$. This contradicts $E \[ B_v \] = 0$, which follows from $E perp P$. ◻
]

#prodef([Remark 5.9.])[
  The results of this section can be reapplied to any other definite closed triple with the same ordered periods. The positive plane $P$, the excluded roots, and the prescribed direction of $F$ then remain the same. In particular, the curve-through-every-point conclusion remains available after the small exact perturbations used below. At this stage the curves may have several components or multiplicities; their reduction and irreducibility will follow from the choice of $F$ in the next section.
] <rem:families-period-stability>

=== 5.7 Compactness under varying backgrounds <subsec:families-varying-compactness>

We now prove the compact-family input used above. The uniform Seiberg–Witten estimates produce a limiting curvature current and retain the zero sets. To recognize this limit as curves for $J_oo$, the remaining task is to construct an integer intersection assignment and prove its positivity on $J_oo$-holomorphic disks. This is where variation of the background must be addressed explicitly.

#proof[
  For a fixed background, this is the compactness and incidence part of Taubes’s existence theorem. For the equations in (5.4), use #cite(label("Taubes1999")) Theorem 2.2, with its zero-support conclusion as proved in Lemma 7.1 and Equation (7.5) for the first component defined in Equation (3.17) of that paper. The symplectic form has empty zero locus, so the transverse-zero hypothesis is vacuous. The class formula is
  $ 2 \[ cal(C) \] = c_1 \( L ⊗ K_J \) . $
  The splitting above gives $L = K_J^(- 1) cal(E)^2$, so this is exactly $\[ cal(C) \] = E$ over $bb(R)$. The original fixed-background symplectic statement also includes incidence with prescribed closed sets #cite(label("Taubes1996")) Theorem 1.3; the curve-recognition argument is understood in its corrected form #cite(label("Taubes2000")).
  #emph[Uniform estimates and support convergence.] We explain the uniformity needed here. Smooth convergence provides a common positive normal-coordinate radius, uniform ellipticity, and uniform bounds on all derivatives of the metrics, forms, and induced canonical connections. It also bounds the topological terms $c_1 \( L \) \[ eta_n \]$. In the following estimates, constants are independent of $n$ and $r$ after these quantities have been bounded. For readability write $w = 1 - \| alpha \|^2$ and $w_(+) = max \( w \, 0 \)$, and use the projected spinor covariant derivatives. The estimates used in the compactness proof include
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| psi \|^2 & lt.eq 1 + C r^(- 1) \, & \| beta \|^2 & lt.eq C r^(- 1) w_(+) + C r^(- 2) \,\
\| F_(cal(A))^(+) \| & lt.eq frac(r, 2 sqrt(2)) w_(+) + C \, & \| F_(cal(A))^(-) \| & lt.eq frac(r, 2 sqrt(2)) \( 1 + C r^(- 1 \/ 2) \) w_(+) + C \,\
\| nabla_(cal(A)) alpha \|^2 + r \| nabla_(cal(A)) beta \|^2 & lt.eq C r w_(+) + C \, & r integral_X \| 1 - \| psi \|^2 \| thin "vol"_g & lt.eq C . $ <eq:families-taubes-basic>]
  These are the specialization to a nowhere-vanishing symplectic form of #cite(label("Taubes1999")) Lemma 3.1, Proposition 3.1, Equation (3.27), and Propositions 3.2–3.3. The global pointwise bound follows directly from the spinor Weitzenbock formula and the maximum principle. The remaining bounds use its two eigenline projections, the curvature equation and its derivative, and the scalar Green kernel. All the geometric coefficients in those arguments are uniformly bounded on the chosen charts. In particular, $integral w_(+) lt.eq integral \| 1 - \| psi \|^2 \| + integral \| beta \|^2$. Integrating the bound for $beta$ and absorbing $C r^(- 1) integral w_(+)$ for large $r$ therefore bounds $r integral w_(+)$. The inequality $w gt.eq - C r^(- 1)$, followed by (5.12), then gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ r integral_X \| w \| thin "vol"_g + integral_X \| F_(cal(A)) \| thin "vol"_g lt.eq C . $ <eq:families-taubes-mass>]
  For the nonnegative energy $cal(E)_r \( U \) = r integral_U \| 1 - \| psi \|^2 \| thin "vol"_g$, the monotonicity estimate gives uniform constants $c \, C \, s_0 > 0$ such that, whenever $C r^(- 1 \/ 2) lt.eq s lt.eq s_0$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ cal(E)_r \( B_s \( x \) \) lt.eq C s^2 \, #h(2em) x in alpha^(- 1) \( 0 \) med arrow.r.double quad cal(E)_r \( B_s \( x \) \) gt.eq c s^2 . $ <eq:families-taubes-monotonicity>]
  This is #cite(label("Taubes1999")) Proposition 4.1, with its universal normalizing factor absorbed into the constants. Consequently the zero sets have covers by at most $C s^(- 2)$ such balls.
  Here is also the scale and derivative dependence in the local compactness step. Use normal coordinates for each individual $g_n$, rescale by $r_n^(1 \/ 2)$, and compare on a ball of fixed radius $R$. After identifying the center with Euclidean $bb(C)^2$, the rescaled coefficients satisfy
  #[#set math.equation(numbering: n => "(5.15)")
   $ parallel g'_n - g_(upright(E)) parallel_(C^0 \( B_R \)) & lt.eq C_R r_n^(- 1) \, & parallel partial^k g'_n parallel_(C^0 \( B_R \)) & lt.eq C_(R \, k) r_n^(- k \/ 2) &  & \( k gt.eq 2 \) \,\
parallel eta'_n - eta'_n \( 0 \) parallel_(C^0 \( B_R \)) & lt.eq C_R r_n^(- 1 \/ 2) \, & parallel partial^k eta'_n parallel_(C^0 \( B_R \)) & lt.eq C_(R \, k) r_n^(- k \/ 2) &  & \( k gt.eq 1 \) . $ <eq:families-taubes-rescaling>]
  The first derivatives of $g'_n$ are $O_R \( r_n^(- 1) \)$. The scale in #cite(label("Taubes1999")) Equation (5.1) is $\( r_n \| eta_n \| \)^(1 \/ 2) = 2^(1 \/ 4) sqrt(r_n)$. A fixed dilation therefore converts these coordinates to that paper’s flat-model normalization; all estimates below absorb this fixed factor, and curvature integrals are unchanged by it. These estimates follow by Taylor expansion in each metric’s own normal coordinates; compare #cite(label("Taubes1999")) Section 6, Step 4. For every fixed $R \, k$, the rescaled equations therefore have uniform coefficient bounds through order $k$. Gauge fixing and interior elliptic estimates give the rescaled local approximation in any prescribed $C^k$ norm by the flat model, as in #cite(label("Taubes1999")) Proposition 5.2. Its quantifiers are: for each $R \, k \, epsilon > 0$, a common lower bound on $r$ makes the approximation error smaller than $epsilon$. We retain smooth background convergence, so every derivative order required in this argument is available; no assertion about a minimal finite regularity threshold is needed.
  Let $cal(A)_(upright("can") \, n)$ be the canonical connection on $K_(J_n)^(- 1)$. The first eigenline connection $a_n$ has curvature $F_(a_n) = 1 / 2 \( F_(cal(A)_n) - F_(cal(A)_(upright("can") \, n)) \)$. The corresponding closed currents
  #[#set math.equation(numbering: n => "(5.16)")
   $ T_n \( zeta \) = frac(i, 2 pi) integral_X F_(a_n) and zeta $ <eq:families-taubes-current>]
  have uniformly bounded mass by (5.13). Their periods on closed test forms are those of $E$. On the complement of the first-component zero set, its unit section identifies the determinant with the canonical determinant. In that identification the further estimate is
  #[#set math.equation(numbering: n => "(5.17)")
   $ \| cal(A) - cal(A)_(upright("can")) \| + \| F_(cal(A)) - F_(cal(A)_(upright("can"))) \| lt.eq C r^(- 1) + C r exp #scale(x: 120%, y: 120%)[\(] - sqrt(r) thin "dist" \( x \, alpha^(- 1) \( 0 \) \) \/ C #scale(x: 120%, y: 120%)[\)] $ <eq:families-taubes-off-zeros>]
  when the distance is at least $r^(- 1 \/ 2)$ #cite(label("Taubes1999")) Proposition 6.1.
  The ball covers, the lower bound at zeros, and (5.17) now give a subsequence whose zero sets converge to the support $Z_(*)$ of a weak limit of $T_n$; the support has finite two-dimensional Hausdorff measure. These are the arguments of #cite(label("Taubes1999")) Equations (7.1)–(7.5) and Lemma 7.1, using exactly the uniform estimates just listed.
  We give the disk argument needed when the backgrounds vary. Write
  $ f_n = frac(i, 2 pi) F_(a_n) = frac(i, 4 pi) \( F_(cal(A)_n) - F_(cal(A)_(upright("can") \, n)) \) . $
  The sharper estimate #cite(label("Taubes1999")) Proposition 4.2, Equation (4.9), specialized to $\| eta_n \| = sqrt(2)$, is
  #[#set math.equation(numbering: n => "(5.18)")
   $ \| F_(cal(A)_n)^(-) \| lt.eq frac(r_n, 2 sqrt(2)) \( 1 - \| alpha_n \|^2 \) + C . $ <eq:families-taubes-sharp>]
  Its constants have the same uniform geometric dependence as the estimates above. If $ell$ is a unit, positively oriented $J_n$-complex bivector, then $ell^(+) = eta_n \/ 2$, $\| ell^(-) \| = 1 \/ sqrt(2)$, and the curvature equation gives
  $ i F_(cal(A)_n)^(+) \( ell \) = r_n / 4 \( 1 - \| alpha_n \|^2 + \| beta_n \|^2 \) \, #h(2em) i F_(cal(A)_n)^(-) \( ell \) gt.eq - r_n / 4 \( 1 - \| alpha_n \|^2 \) - C . $
  The leading terms cancel. The canonical curvatures are uniformly bounded, so there is one constant $C_0 gt.eq 1$ such that every $J_n$-holomorphic disk $u$ satisfies
  #[#set math.equation(numbering: n => "(5.19)")
   $ u^(*) f_n gt.eq - C_0 thin upright(d) A_u . $ <eq:families-disk-lower-bound>]
  Here $upright(d) A_u$ is the induced area density, counted on the source; the inequality also holds at critical points. This derives the disk bound directly for our normalization, including the factor one half in the twisting connection.
  #emph[The relative integer assignment.] First construct the integer assignment independently of positivity. A smooth disk $u$ is admissible when its boundary misses $Z_(*)$. For large $n$, $u^(*) alpha_n$ is nonzero on a boundary collar and defines a relative Chern number $k_n \( u \) in bb(Z)$. The unit first component trivializes the eigenline there, and (5.17) gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ integral_D u^(*) f_n = k_n \( u \) + o \( 1 \) . $ <eq:families-relative-degree>]
  The error is uniform for disks with bounded first derivatives whose boundary collars have a common positive distance from $Z_(*)$. For each sufficiently large $n$, relative Chern numbers agree along any fixed admissible homotopy. The same conclusion holds for the varying homotopies below: pointwise short geodesics between uniformly close boundary maps stay in one fixed zero-free neighborhood of the original boundary. Thus their pulled-back unit sections extend over the boundary homotopy, uniformly in large $n$.
  For an immersed disk, take small normal translates, with a smooth averaging function in the two normal parameters. The normal bundle is taken over the source, so self-intersections cause no difficulty. All these disks have the same $k_n$. Cut off the source near its boundary collar; the removed flux tends to zero by (5.17). The averaged remaining flux is the pairing of $T_n$ with a fixed smooth two-form: the normal coordinate map is a local diffeomorphism, and a finite partition of unity pushes the compactly supported averaging forms to $X$. Weak convergence of $T_n$ proves convergence of these averages. Thus $k_n$, being integer valued, is eventually constant. A general admissible smooth disk has an arbitrarily close immersed perturbation, connected to it by an admissible homotopy, and hence has the same conclusion. Denote the eventual integer by $I \( u \)$. It is zero for disks missing $Z_(*)$, invariant under admissible homotopy, additive under subdivision, and multiplied by the degree under proper disk maps; these are the corresponding properties of relative first Chern numbers. This is the Stokes and averaging construction of #cite(label("Taubes1996")) Proposition 5.6 and Lemma 6.2. Only positivity for the limiting complex structure remains.
  #emph[Disk deformations with prescribed incidences.] We need the following elementary disk deformation fact. For a holomorphic map on a slightly larger disk, with no boundary condition, the linearized Cauchy–Riemann operator has a bounded right inverse even after prescribing values and complex-linear first derivatives at any finite set of distinct interior source points. Work, for example, in $H^k arrow.r H^(k - 1)$, $k gt.eq 4$, so these evaluations are continuous. Extend the bundle and operator to a closed surface, and extend the target sections by a bounded Sobolev extension. The closed-surface operator augmented by the finite evaluations is Fredholm. Finitely many smooth forcing terms supported outside the larger disk make it onto. Indeed, an annihilator of all such exterior terms vanishes there. Away from the specified points it is smooth by elliptic regularity and vanishes everywhere by unique continuation for the adjoint real Cauchy–Riemann operator #cite(label("Wendl2014Lectures")) Theorem 2.78 and Proposition 3.12. It is therefore a sum of distributions supported at the specified points. The invertible principal symbol eliminates derivatives of point masses of positive order: their highest derivative after applying the adjoint has order at least two, whereas the evaluation constraints have order at most one. The remaining term at each point is $q delta$. Testing independently the complex-linear and anti-complex-linear first derivatives eliminates both $q$ and the first-derivative constraint covector; testing the value then eliminates its covector. The annihilator is zero, proving the assertion about exterior forcing. A bounded right inverse of this surjective Fredholm operator, restricted to the disk, proves the claimed right inverse.
  The implicit function theorem and interior regularity consequently give nearby holomorphic disks for nearby almost-complex structures, with those finite values and complex-linear derivatives prescribed. All domain restrictions are chosen first, and all constraints lie in the smaller disk. The right-inverse bounds persist for nearby operators. Constants may depend on the chosen finite set of points and on a fixed neighborhood of the original map; this is harmless because these choices precede $n arrow.r oo$. In particular, while retaining finitely many incident values, one may choose the tangent line at each of them independently in a nonempty open cap. At a critical point one first chooses a sufficiently small nonzero complex-linear derivative. This gives a fixed small $J_oo$-holomorphic perturbation of the original disk; its $J_n$-holomorphic transfers converge smoothly to that perturbation on the smaller closed disk. They need not converge to the unperturbed disk, and admissible boundary homotopy is what identifies their integers.
  #emph[Positive flux at a retained incidence.] Here is the positive contribution at each retained incidence. Choose actual zeros $p_(j \, n)$ tending to the finitely many specified values in $Z_(*)$. After a joint subsequence, rescaling at these zeros gives centered flat models on all fixed balls. Their first components vanish at the origin. The quadratic energy bound excludes the identically zero first component. Each limiting model has a polynomial divisor by #cite(label("Taubes1999")) Proposition 5.1. For any nonempty open cap of complex lines through the origin, choose a direction where the highest homogeneous part of that polynomial is nonzero; only finitely many directions are excluded. Along the chosen line, distance from the divisor grows linearly at infinity. The exponential off-divisor estimate in #cite(label("Taubes1999")) Proposition 5.1 makes the boundary connection term tend to zero. Stokes’ theorem therefore identifies the total line flux $\( i \/ 2 pi \) integral F_(a_0)$ with the positive degree $m_j gt.eq 1$ of the restricted divisor, which contains the origin. The determinant connection in #cite(label("Taubes1999")) Proposition 5.2 converges to $2 a_0$, so this is precisely the limiting normalization of $f_n$, with the bounded canonical curvature disappearing under rescaling. Choose a fixed large radius $R_j$ so that the boundary is zero-free and the flux differs from $m_j$ by less than $1 \/ 8$. These are the polynomial-model and line-selection steps in #cite(label("Taubes1996")) Proposition 5.6, Steps 3–4, using the flat limits of #cite(label("Taubes1999")) Proposition 5.2.
  Prescribe those good tangent directions in the disk deformation just constructed. Choose a fixed approximation tolerance making the flux error on each model disk less than $1 \/ 8$; only then take $n$ large. Because the prescribed derivatives are nonzero and the disk maps have uniform higher derivative bounds, the rescaled maps on microscopic source disks converge to the chosen complex-linear maps. Each resulting source core therefore contributes more than $m_j - 1 \/ 4 gt.eq 3 \/ 4$ to the flux. The finitely many core radii tend to zero, so the cores are source-disjoint. Distinct source incidences may have the same target value: the flux is integrated on the source, and this does not affect the argument. The nonzero derivative sizes, the caps, the models, $R_j$, and the approximation tolerances are all fixed before the final lower bound on $n$ is imposed.
  #emph[Positivity for the limiting complex structure.] We now prove positivity for any admissible $J_oo$-holomorphic disk $u$ meeting $Z_(*)$, allowing critical points and self-intersections. Shrink its domain inside a slightly larger disk so that every incidence lies in its interior and its boundary collar has a fixed positive gap from $Z_(*)$. First fix a small $C^1$ neighborhood in which this gap persists and all disk areas are bounded by a number $A_(*)$. Put $S = u^(- 1) \( Z_(*) \)$.
  If $S$ is finite, retain all its points. Choose disjoint fixed neighborhoods of them whose total induced area, for all sufficiently close disks, is less than $1 \/ \( 4 C_0 \)$. On the compact complement the original disk has a positive distance from $Z_(*)$; shrink the allowed disk neighborhood to preserve half that distance. Choose the good tangent caps and the fixed small holomorphic perturbation within this neighborhood, and transfer it to $J_n$, retaining the chosen zeros. The cores contribute at least $3 \/ 4$ each. Their complement inside the selected neighborhoods contributes more than $- 1 \/ 4$ by (5.19). On the remaining compact domain the flux tends to zero by (5.17). Thus the limiting integer in (5.20) is positive.
  If $S$ is infinite, choose a finite number $N$ of distinct source points in it with $3 N \/ 4 > C_0 A_(*) + 1$. The area bound was fixed before $N$. Apply the same finite-constraint construction at these points, keeping the perturbed disks in the chosen area neighborhood. The $N$ source-disjoint cores contribute more than $3 N \/ 4$, whereas their full complement contributes at least $- C_0 A_(*)$. The flux is therefore bounded below by a positive number. Its limit is the unchanged integer $I \( u \)$, so again $I \( u \) > 0$. Every choice was finite and fixed before the last passage to large $n$; no rate relating $J_n arrow.r J_oo$ and $r_n arrow.r oo$ has been imposed.
  #emph[Curve recognition and retention of the marked point.] In particular the positivity axiom for embedded holomorphic test disks holds. The resulting positive cohomology assignment permits the corrected recognition theorem to be applied to the fixed structure $J_oo$, as in #cite(label("Taubes1999")) Lemmas 7.2–7.3 and Proposition 7.1 and #cite(label("Taubes2000")). The recognized normalization map is proper. Since $X$ is compact, its source is compact and has finitely many components; its locally finite exceptional set is finite as well. The multiplicity of a resulting curve at a smooth point is the integer $I$ of a small transverse disk there. The averaging construction identifies this same integer with the transverse coefficient of the weak curvature current: on each smooth branch, a closed current of order zero supported there is a constant multiple of its oriented integration current. The remaining difference is supported on the finite singular set, where a closed two-current of order zero must vanish. Thus the recognized configuration has current equal to the weak limit of $T_n$, as in #cite(label("Taubes1999")) Proposition 7.1 and Equation (7.12) in the proof of Lemma 7.4; in particular its class is $E$.
  The support convergence retains every limit of first-component zeros. If $E = 0$, a retained zero would give a nonempty positive configuration with $integral_(cal(C)) eta_oo = E \[ eta_oo \] = 0$, which is impossible. Failure of the final uniform assertion would supply a sequence with $r_n arrow.r oo$; compactness of the parameter space would reduce it to the situation just proved. ◻
]

== 6 An integral null class with a uniform chamber <sec:lattice-chamber>

The curve-existence result of 26 applies to every nonzero integral null class. We now choose one for which a positive curve configuration cannot split. The choice depends only on the original period plane, so the resulting restrictions on curve classes persist under later deformations of the definite pair that preserve its two periods. The arithmetic step is to find a primitive null class whose projection direction avoids a finite set of obstructions. Adjunction then relates this arithmetic choice to curve classes. Taming and the resulting class alternatives rule out splitting or multiplicity in a positive configuration in the chosen class; positivity of intersections makes distinct curves in that class disjoint.

We use the free lattice

$ Lambda = H^2 \( X \; bb(Z) \) \/ upright("torsion") \, #h(2em) Lambda_(bb(Q)) = Lambda ⊗_(bb(Z)) bb(Q) \, #h(2em) Lambda_(bb(R)) = Lambda ⊗_(bb(Z)) bb(R) . $

A curve class will mean the image in $Lambda$ of its integral Poincaré dual, with the complex orientation of the curve. Equalities of integral classes in this section are therefore equalities modulo torsion. This convention does not affect intersections or integrals of closed real forms. The original positive period plane is denoted by $P$, and $d^(+)$ denotes the orthogonal projection of $d in Lambda_(bb(R))$ to $P$. By 6,

$ Lambda tilde.eq 3 U xor 2 E_8 \( - 1 \) quad upright("or") quad Lambda tilde.eq 3 U \, $

where $U$ is the hyperbolic plane. In particular, $P^perp$ is negative definite. No rationality of $P$ is assumed.

#prodef([Proposition 6.1.])[
  (Choice of chamber class).  #emph[There is a primitive class $F in Lambda$ with $F^2 = 0$ such that the following implication holds for every $d in Lambda$ and every real number $c > 0$: 
#[#set math.equation(numbering: n => "(6.1)")
 $ d^2 gt.eq - 2 \, #h(2em) d^(+) = c F^(+) \, #h(2em) d dot.op F lt.eq 0 quad arrow.r.double quad c in bb(Z)_(> 0) \, #h(2em) d dot.op F = 0 . $ <eq:lattice-chamber-implication>]

 Moreover, $F^(+) eq.not 0$.]
] <prop:chamber-class>

#proof[
  We first construct a rational null subspace with enough integral directions, and then exclude finitely many of those directions.
  #emph[A positive integral vector and a null lattice.] Set
  $ W_(bb(Q)) = Lambda_(bb(Q)) ∩ P^perp \, #h(2em) W_(bb(R)) = "span"_(bb(R)) W_(bb(Q)) . $
  The subspace $W_(bb(R))$ is rational and negative definite. Hence its orthogonal complement is rational and contains $P$. Positive square is an open condition, so density of rational vectors in this complement gives a positive rational vector in $W_(bb(R))^perp$. Clearing denominators and dividing out the common integral divisor produces a primitive vector $l in Lambda$ satisfying
  #[#set math.equation(numbering: n => "(6.2)")
   $ l^2 > 0 \, #h(2em) l dot.op W_(bb(Q)) = 0 . $ <eq:lattice-positive-vector>]
  Write $l^2 = 2 n$, where $n in bb(Z)_(> 0)$. We use the following form of Eichler’s criterion: in an even lattice containing two orthogonal hyperbolic planes, the orbit of a primitive vector under the stable orthogonal group is determined by its square and its normalized class in the discriminant group #cite(label("GritsenkoHulekSankaran2009")) Proposition 3.3(i). Here the lattice is unimodular. Thus its discriminant group is zero, and every primitive vector has divisibility one. The criterion sends $l$ to $e_1 + n f_1$, where
  $ e_i^2 = f_i^2 = 0 \, #h(2em) e_i dot.op f_i = 1 $
  are standard bases of the three mutually orthogonal copies of $U$. In these coordinates the lattice generated by $f_1 \, e_2 \, e_3$ is primitive and totally null. Pulling it back gives a rational three-dimensional totally null subspace $L_(bb(R))$ and its lattice $L = Lambda ∩ L_(bb(R))$, with an element $f_0 in L$ such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ l dot.op f_0 = 1 . $ <eq:lattice-affine-slice>]
  Consequently
  $ cal(F) = { F in L : l dot.op F = 1 } $
  is an affine lattice of rank two. Every $F in cal(F)$ is primitive in $Lambda$, since a nontrivial integral divisor of $F$ would divide $l dot.op F = 1$. It is also nonzero and null. Its projection to $P$ is nonzero by negative definiteness of $P^perp$.
  #emph[Only finitely many cosets can obstruct a direction.] The set
  $ K = { r in P^perp : r^2 gt.eq - 2 } $
  is compact. Suppose temporarily that $F in cal(F)$, $d in Lambda$, and $c > 0$ satisfy the three conditions on the left side of (6.1). Then
  #[#set math.equation(numbering: n => "(6.4)")
   $ r = d - c F in P^perp \, #h(2em) r^2 = d^2 - 2 c \( d dot.op F \) gt.eq - 2 \, $ <eq:lattice-bounded-residual>]
  so $r in K$.
  Let $q : Lambda_(bb(R)) arrow.r Lambda_(bb(R)) \/ L_(bb(R))$ be the quotient map. Because $L_(bb(R))$ is rational and $L$ is saturated, a basis of $L$ extends to an integral basis of $Lambda$; the remaining basis vectors project to a lattice basis in the real quotient. Thus $q \( Lambda \)$ is discrete and $ker \( q \|_Lambda \) = L$. Since $q \( d \) = q \( r \) in q \( K \)$, only finitely many cosets $d + L$ can occur in (6.4). This finite set is independent of $F$.
  #emph[Avoiding irrational points in a torus.] Orthogonal projection restricts to an isomorphism
  $ pi : L_(bb(R)) arrow.r P : $
  its kernel is null and lies in the negative-definite space $P^perp$, and both spaces have dimension three. Hence $pi \( L \)$ is a lattice in $P$. Each of the finitely many cosets just found determines one point of
  $ bb(T) = P \/ pi \( L \) \, $
  because adding an element of $L$ changes the projection by an element of $pi \( L \)$.
  For a primitive $F in L$, let
  $ bb(S)_F = { t pi \( F \) + pi \( L \) : t in bb(R) } subset bb(T) . $
  Two such circles with different directions intersect only in torsion points. Indeed, if $t pi \( F \) - s pi \( F' \) in pi \( L \)$ and $F \, F'$ are not collinear, choose an integral linear functional on $L$ which vanishes on $F$ and is nonzero on $F'$. Applying it to $t F - s F' in L$ shows that $s in bb(Q)$, so the common point is torsion. In particular, any non-torsion point of $bb(T)$ lies on at most one primitive direction circle.
  The elements of $cal(F)$ have distinct directions: two collinear elements with $l$-pairing one are equal. Since $cal(F)$ is infinite, we can choose $F in cal(F)$ whose circle contains none of the non-torsion points among the finitely many possible coset points.
  For this $F$, every $d \, c$ satisfying the hypotheses of (6.1) gives a torsion point
  $ d^(+) + pi \( L \) = c pi \( F \) + pi \( L \) . $
  There is therefore an integer $k > 0$ with $k c F in L$. Pairing with $l$ shows that $k c in bb(Z)$, so $c in bb(Q)$. It follows that $r = d - c F in W_(bb(Q))$, and (6.2) now gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ c = l dot.op d in bb(Z)_(> 0) . $ <eq:lattice-integral-coefficient>]
  If $m = d dot.op F < 0$, then $m$ is a negative integer and
  $ r^2 = d^2 - 2 c m gt.eq - 2 + 2 c gt.eq 0 . $
  Negative definiteness of $P^perp$ forces $r = 0$, which would imply $m = 0$. This contradiction proves $d dot.op F = 0$, and completes the proof. ◻
]

Fix $F$ as in 35. Make a constant orthogonal change of the coefficient basis of the original triple and denote the result by $\( A \, C \, B \)$, choosing

#[#set math.equation(numbering: n => "(6.6)")
 $ \[ B \] = F^(+) / lr(bar.v.double F^(+) bar.v.double) \, #h(2em) \[ A \] dot.op F = \[ C \] dot.op F = 0 \, #h(2em) beta = \[ B \] dot.op F = lr(bar.v.double F^(+) bar.v.double) > 0 . $ <eq:lattice-adapted-periods>]

Here the norm is the positive intersection norm on $P$. The three classes remain orthonormal, and

$ V = \[ A \]^perp ∩ \[ C \]^perp $

has signature $\( 1 \, b^(-) \)$. The following conclusion is deliberately stated for arbitrary later definite pairs with these two periods.

#prodef([Corollary 6.2.])[
  (Curve-class alternatives).  #emph[Let $tilde(A) \, tilde(C)$ be any smooth closed definite pair on $X$ with 
$ \[ tilde(A) \] = \[ A \] \, #h(2em) \[ tilde(C) \] = \[ C \] \, $

 and let $J$ be either of its associated almost complex structures. For every nonconstant irreducible closed $J$-holomorphic curve whose class $d in Lambda$ is nonzero, there is a real number $c eq.not 0$ with $d^(+) = c F^(+)$. Exactly one of the following alternatives holds:]
  + #emph[$d dot.op F eq.not 0$, and $"sgn" \( d dot.op F \) = "sgn" \( c \) = "sgn" \( \[ B \] dot.op d \)$;]
  + #emph[$d = c F$ in $Lambda$, with $c in bb(Z) \\ { 0 }$.]
  #emph[If $J$ admits a closed taming form, every nonconstant irreducible closed $J$-holomorphic curve has nonzero real class, so the nonzero-class hypothesis is automatic.]
] <cor:curve-signs>

#proof[
  Represent the irreducible image by a somewhere-injective $J$-holomorphic map $u : Sigma arrow.r X$, with its covering multiplicity factored out. The standard adjunction and singularity theorems for simple curves in real dimension four give
  #[#set math.equation(numbering: n => "(6.7)")
   $ d^2 = c_1 \( T X \, J \) dot.op d + 2 g \( Sigma \) - 2 + 2 delta \( u \) \, #h(2em) delta \( u \) in bb(Z)_(gt.eq 0) \, $ <eq:lattice-adjunction>]
  where $delta \( u \)$ is the weighted singularity defect and is zero precisely for an embedding; see #cite(label("Wendl2020")) Theorem 2.8, using the numbering of the cited prepublication version throughout. Positivity of intersections of distinct simple images is #cite(label("Wendl2020")) Theorem 2.3 and Corollary 2.4. The critical points are isolated, and a simple curve is locally injective, including at critical points #cite(label("Wendl2020")) Propositions B.26 and B.41. These facts prevent accumulation of distinct double-point pairs at the diagonal of the product of the source with itself. Local intersection isolation, unique continuation, and simplicity prevent accumulation off the diagonal. Compactness therefore makes the critical and noninjective sets finite. The definite pair trivializes the canonical bundle by 5, so $c_1 \( T X \, J \) = 0$ for either sign of $J$. In particular, $d^2 gt.eq - 2$.
  Both members of the pair vanish on complex lines. Integrating their pullbacks gives $\[ A \] dot.op d = \[ C \] dot.op d = 0$; hence
  $ d^(+) = c F^(+) \, #h(2em) \[ B \] dot.op d = beta c $
  for a real number $c$. If $c = 0$, the nonzero integral class $d$ lies in $P^perp$. Evenness, negative definiteness, and $d^2 gt.eq - 2$ force $d^2 = - 2$. When $b_1 = 0$, this contradicts 33. When $b_1 = 4$, (6.7) gives $g \( Sigma \) = delta \( u \) = 0$, so $d$ is the class of an embedded sphere. This contradicts the vanishing of spherical real classes in 32. Thus $c eq.not 0$.
  Suppose first that $c > 0$. By 35, $d dot.op F < 0$ is impossible. If $d dot.op F > 0$, alternative (i) holds. If $d dot.op F = 0$, the same proposition gives $c in bb(Z)_(> 0)$, so $r = d - c F$ is integral and lies in $P^perp$. Moreover $r^2 = d^2 gt.eq - 2$. Either $r = 0$, or negative definiteness and evenness give $r^2 = d^2 = - 2$. The latter is excluded by 33 when $b_1 = 0$; when $b_1 = 4$, it would make the original curve $u$ an embedded sphere by (6.7), again contradicting 32. Therefore $d = c F$.
  If $c < 0$, apply the same lattice argument to $- d$, whose square is still at least $- 2$. This use of 35 is purely arithmetic and does not require a $J$-holomorphic representative of $- d$. It gives $d dot.op F < 0$ or $d = c F$ with $c in bb(Z)_(< 0)$. Indeed, a nonzero residual in $P^perp$ would again have square $d^2 = - 2$. In the $b_1 = 4$ case, adjunction is applied to the original curve in class $d$, making it an embedded sphere and giving the same contradiction to 32. The two alternatives are disjoint because $F^2 = 0$.
  Finally, the integral of a closed taming form over any nonconstant curve is strictly positive. Its real homology class, and hence its image in $Lambda$, cannot vanish. ◻
]

#prodef([Proposition 6.3.])[
  (No splitting in the fiber class).  #emph[Let $\( tilde(A) \, tilde(C) \, tilde(B) \)$ be any smooth closed positive triple with the same three cohomology classes as $\( A \, C \, B \)$, and let $J$ be the structure associated to its first two members and tamed by $tilde(B)$. Then:]
  + #emph[Every positive $J$-holomorphic curve configuration whose total class is $F$ in $Lambda$ consists of one reduced irreducible component of class $F$.]
  + #emph[Through every point of $X$ there is such a component, and distinct components of class $F$ are disjoint.]
  + #emph[Every simple parametrization of such a component is either an embedded torus or a rational curve with total adjunction defect one. If the rational parametrization is immersed, its image has exactly one transverse positive double point and no other singularity.]
  #emph[These statements in particular hold after any exact perturbation of the triple that preserves positivity.]
] <prop:nonsplitting>

#proof[
  Write a positive configuration as
  $ F = sum_(i = 1)^r n_i d_i quad upright("in ") Lambda \, #h(2em) n_i in bb(Z)_(> 0) \, $
  where the $d_i$ are the classes of its distinct irreducible images. Taming excludes zero real component classes. In the notation of 36,
  $ 0 < integral_(d_i) tilde(B) = \[ B \] dot.op d_i = beta c_i \, $
  so $c_i > 0$. The corollary gives $m_i = d_i dot.op F gt.eq 0$, whereas
  $ 0 = F^2 = sum_(i = 1)^r n_i m_i . $
  Every $m_i$ therefore vanishes. Again by the corollary, $d_i = c_i F$ with $c_i in bb(Z)_(> 0)$, and comparison of the total classes yields
  #[#set math.equation(numbering: n => "(6.8)")
   $ sum_(i = 1)^r n_i c_i = 1 . $ <eq:lattice-no-splitting>]
  There is exactly one summand, with $n_1 = c_1 = 1$. This proves (i), including the exclusion of a nontrivial covering multiplicity.
  Apply 26 to the present triple. Its period plane is still $P$, and (6.6) forces the direction of the configuration to be precisely the one whose anti-invariant plane is $"span" \( tilde(A) \, tilde(C) \)$ and whose tamer is $tilde(B)$. Thus the theorem gives a positive $J$-holomorphic configuration in $F$ through any prescribed point. Part (i) makes it a single reduced component. Two distinct components of class $F$ cannot meet: their intersection number is $F^2 = 0$, while any intersection of distinct simple images has positive local intersection number. This proves (ii).
  For the remaining assertion, adjunction becomes
  $ 0 = F^2 = 2 g \( Sigma \) - 2 + 2 delta \( u \) \, #h(2em) upright("or equivalently") #h(2em) g \( Sigma \) + delta \( u \) = 1 . $
  If $g \( Sigma \) = 1$, the defect is zero and the curve is embedded. If $g \( Sigma \) = 0$, the total defect is one; critical points of the parametrization have not yet been excluded. When the map is immersed, its singular defect is the sum of positive intersection multiplicities between distinct local branches. Total defect one then forces exactly one pair of branches meeting with multiplicity one, which is a transverse positive double point. A tangency has larger multiplicity, and a point with three or more branches contributes at least three. There can be no additional singularity. ◻
]

== 7 A torus pencil with ordinary nodes <sec:pencil>

We keep the notation of 37. In particular, curve classes are identified with their Poincaré duals modulo torsion, and $F$ is primitive, $F^2 = 0$, $\[ A \] F = \[ C \] F = 0$, and $\[ B \] F > 0$. The form $B$ will remain fixed throughout the construction. There is already a unique curve image through every point. To turn these images into the fibers of a smooth map, we first remove critical points of their sphere parametrizations using exact pair variations. The normal equation will then supply foliated neighborhoods of the embedded tori. Finally, exact local changes near the remaining nodal spheres will supply the corresponding charts at singular fibers.

#prodef([Theorem 7.1.])[
  (The pencil).  #emph[There are smooth one-forms $a_t \, c_t$, $0 lt.eq t lt.eq 1$, with $a_0 = c_0 = 0$, such that 
$ A_t = A + upright(d) a_t \, #h(2em) C_t = C + upright(d) c_t $

 and $\( A_t \, C_t \, B \)$ is a positive closed triple for every $t$. For the structure $J$ determined by $\( A_1 \, C_1 \)$ and tamed by $B$, the irreducible curves of class $F$ are precisely the fibers of a smooth proper map 
$ p_X : X arrow.r S $

 to a closed connected oriented surface. Each regular fiber is an embedded torus. The singular fibers, if any, are finitely many immersed rational curves, each with one transverse positive double point.]
  #emph[Every singular fiber has a neighborhood identified with a proper holomorphic elliptic fibration $p_Y : Y arrow.r Delta$ with smooth total space, a section, and one ordinary nodal central fiber. In this identification there are constants $x_i in bb(R)$, $y_i in bb(R) \\ { 0 }$ such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ A_1 = "Re" Sigma_i \, #h(2em) C_1 = x_i "Re" Sigma_i + y_i "Im" Sigma_i . $ <eq:pencil-model-pair>]

 Here $Sigma_i$ is a nowhere-zero holomorphic two-form, and the model can be chosen with punctured-disk presentation 
#[#set math.equation(numbering: n => "(7.2)")
 $ z = a + tau \( s \) b med \( mod med bb(Z) + tau \( s \) bb(Z) \) \, #h(2em) tau \( s \) = frac(log s, 2 pi i) \, #h(2em) Sigma_i = h_i thin upright(d) s and upright(d) z \, quad h_i in bb(C) \\ { 0 } . $ <eq:pencil-model-periods>]

 Both $A_1$ and $C_1$ vanish on every fiber.]
] <thm:pencil>

Only the qualitative existence of the holomorphic model in 44 is needed in this section. Its construction is local and independent of the pencil; none of the estimates involving the collapsing parameter is used here.

=== 7.1 Curve compactness in the primitive class <curve-compactness-in-the-primitive-class>

We use closed pseudoholomorphic curve theory for smooth almost complex structures tamed by a symplectic form. The particular inputs are factorization of nonconstant maps into a simple map and a branched cover #cite(label("McDuffSalamon2012")) Proposition 2.5.1, positivity of intersections in dimension four, and the adjunction formula with its nonnegative weighted singularity defect #cite(label("Wendl2020")) Theorem 2.3, Corollary 2.4, and Theorem 2.8. For compactness we use the genus-zero theory, including marked spheres and their stable limits #cite(label("McDuffSalamon2012")) Theorems 5.3.1 and 5.5.5. These results do not require regularity of the moduli space. Our later genericity argument must instead work within the allowed exact variations of the pair, with $B$ fixed.

For every triple used below, 37 gives a curve of class $F$ through every point, and every positive configuration of total class $F$ consists of one simple image with multiplicity one. Two different such images are disjoint: an intersection would contribute positively to their intersection number $F^2 = 0$. A simple parametrization $u : L arrow.r X$ has

#[#set math.equation(numbering: n => "(7.3)")
 $ g \( L \) + delta \( u \) = 1 . $ <eq:pencil-adjunction>]

Consequently it is an embedded torus or a rational curve of defect one. The latter may initially have a critical point. The singularity theorem for a simple curve implies that its critical and noninjective points on the normalization form a finite set #cite(label("Wendl2020")) Propositions B.26 and B.41 and Theorem 2.3. If it is immersed, (7.3) says that it has exactly one double point, and that its two branches meet transversely.

#prodef([Lemma 7.2.])[
  (Compactness without bubbling).  #emph[Let $\( A_nu \, C_nu \, B_nu \)$ converge smoothly to a positive closed triple, with all three cohomology classes equal to $\[ A \] \, \[ C \] \, \[ B \]$, respectively. Let $u_nu : S^2 arrow.r X$ be simple curves of class $F$ for the structures determined by $\( A_nu \, C_nu \)$ and tamed by $B_nu$. After passage to a subsequence and reparametrization, $u_nu$ converges smoothly to a simple sphere of class $F$. The same statement holds with one marked point. In particular, the absence of critical points on all such spheres is open in a sufficiently high finite differentiability topology.]
] <lem:pencil-compactness>

#proof[
  Let $B_oo$ be the limiting third form. It tames the limiting structure with a positive lower bound on the unit tangent bundle of a fixed metric. Smooth convergence therefore makes this same fixed form tame every sufficiently late structure. Its area on each sphere is $\[ B_oo \] F = \[ B \] F$. The fixed-tamer hypotheses and uniform energy bound in the cited Gromov compactness theorem are consequently satisfied. The nonconstant components in the stable limit give a positive configuration of total class $F$ for the limiting triple. By 37, there is exactly one simple image and its total multiplicity is one. In particular, the surviving map is not a nontrivial cover.
  The domain of a genus-zero stable limit is a tree of spheres. With only one nonconstant vertex, a nonempty tree of constant vertices would have a constant leaf with at most one node and the one permitted mark. It would have at most two special points and hence would be unstable. There are therefore no constant components. Gromov convergence is now smooth convergence on the whole sphere after reparametrization, and the marked points converge as well. The same argument gives convergence in the corresponding finite differentiability orders when the backgrounds converge in a sufficiently high finite order.
  If the limiting triple had no critical spheres but nearby triples had such spheres, mark a critical point on each. The conclusion just proved would give a critical point on a limiting sphere. This contradiction proves openness. This argument applies uniformly on any compact parameter set of positive triples with the stipulated periods. ◻
]

=== 7.2 Transversality using exact variations of the pair <transversality-using-exact-variations-of-the-pair>

The two closed pullback equations have two unavoidable integral constraints. We include the coefficient sphere in the universal problem to account for them explicitly.

#prodef([Lemma 7.3.])[
  (Restricted first-jet transversality).  #emph[An arbitrarily small smooth exact perturbation of $\( A \, C \)$, with $B$ fixed and the triple positive, makes every simple sphere in class $F$ immersed. The same assertion holds for a path of such pairs, relative to immersed endpoints.]
  #emph[These perturbations may preserve any finite set of specified immersed $F$-spheres that are common Lagrangians throughout the path. At an endpoint they may also leave fixed closed model subdisks already foliated by $F$-curves.]
] <lem:pencil-jets>

#proof[
  We prove universal surjectivity in the allowed space of perturbations. We reduce an annihilator to two constants arising from the pullback periods and a distribution supported at the marked point. The elliptic symbol and first-jet tests remove the point-supported part; variations of the coefficient sphere remove the two constants. Fix the complex structure $j$ on $S^2$. Write $v_0 = \( 0 \, 0 \, 1 \)$ for the coefficient direction of $B$. For $v$ close to $v_0$, a convenient closed anti-invariant pair for the structure $J_v$ is
  #[#set math.equation(numbering: n => "(7.4)")
   $ A_v = A - v_1 / v_3 B \, #h(2em) C_v = C - v_2 / v_3 B . $ <eq:pencil-coefficient-pair>]
  For any map $u$ in class $F$, the two pullback periods are
  $ (integral_(S^2) u^(*) A_v \, integral_(S^2) u^(*) C_v) = - \[ B \] F (v_1 / v_3 \, v_2 / v_3) . $
  Both pullbacks vanish when $u$ is $J_v$-holomorphic, so every $F$-curve forces $v = v_0$. Exact changes of $A \, C$ leave the two periods unchanged, whereas varying $v$ supplies both period directions in the universal linearization. Thus this auxiliary parameter removes the period constraints without adding solutions in other coefficient directions. We retain it in the section
  #[#set math.equation(numbering: n => "(7.5)")
   $ \( u \, z \, v \; A \, C \) mapsto (overline(partial)_(j \, J_v) u \, partial_(j \, J_v) u \( z \)) . $ <eq:pencil-universal-section>]
  The second component is valued in the real rank-four bundle of complex linear maps $T_z S^2 arrow.r T_(u \( z \)) X$. On the zero set of the first component, its vanishing is exactly $upright(d) u \( z \) = 0$.
  Use $W^(k \, p)$ maps with $p > 2$, $k gt.eq 8$, and backgrounds of finite class $C^r$, with $r gt.eq k + 8$. The first target is $W^(k - 1 \, p)$. Sobolev embedding gives $W^(k \, p) subset C^(k - 1 \, alpha)$ for some $alpha > 0$, so first-jet evaluation at the moving mark is at least $C^(k - 2)$, hence $C^6$. The background regularity gives the same $C^6$ regularity for the composition maps in the first component. Perturbing forms are $upright(d) beta_A \, upright(d) beta_C$, where the primitives belong to the $C^(r + 1)$ closure of smooth one-forms in the indicated support class. This gives separable Banach spaces. We use the ordinary Banach bundle construction for (7.5); compare the first-jet framework in #cite(label("OhZhu2008")) Sections 2–3. The surjectivity argument for our restricted perturbations is given next.
  Suppose $\( eta \, lambda \)$ annihilates the derivative of (7.5) at a simple critical sphere. Here $eta$ is a distribution dual to the Cauchy–Riemann target and $lambda$ is a covector on the jet target. Testing map variations supported away from $z$ gives $D_u^(*) eta = 0$ there. Elliptic regularity makes $eta$ continuously differentiable away from $z$, with the further finite regularity supplied by the coefficients. The choice of $r$ gives more derivatives than are needed for all distributional products and integrations by parts below.
  #emph[Removal of tangential coefficients.] Although the index uses a fixed $j$, we may test every infinitesimal variation $dot(j)$ of the domain complex structure. On $S^2$ the map $xi mapsto cal(L)_xi j$ is onto: its cokernel is $H^(0 \, 1) \( T S^2 \) = 0$, by the line-bundle surjectivity criterion since $deg T S^2 = 2 > - 2$ #cite(label("Wendl2014Lectures")) Theorem 3.23. Naturality under a domain diffeomorphism, with the marked point moved by the inverse diffeomorphism, expresses the $dot(j)$ test as a combination of the already allowed map and mark tests. The direct variation of the jet with respect to $j$ vanishes at $z$, because $upright(d) u \( z \) = 0$. Thus
  $ eta (1 / 2 J upright(d) u thin dot(j)) = 0 quad upright("for every ") dot(j) . $
  At an immersion point these variations span the tangential Cauchy–Riemann residuals. Hence $eta$ annihilates that tangential subbundle away from $z$.
  #emph[The two pullback coefficients.] There are bundle maps $L_A \, L_C$, with the regularity of the coefficients, from Cauchy–Riemann residuals to real two-forms on the domain such that, at a solution,
  #[#set math.equation(numbering: n => "(7.6)")
   $ delta \( u^(*) A_v \) = L_A thin delta \( overline(partial u) \) \, #h(2em) delta \( u^(*) C_v \) = L_C thin delta \( overline(partial u) \) . $ <eq:pencil-pullback-linearization>]
  These identities hold also for variations of the background pair and of $v$. To see that they extend without loss of regularity at a critical point, choose $j partial_s = partial_t$ and put $e = \( u_s + J u_t \) \/ 2$. Anti-invariance gives the exact identity
  $ A_v \( u_s \, u_t \) = - 2 A_v \( u_s \, J e \) \, $
  and the same identity holds for $C_v$. Differentiation at $e = 0$ proves (7.6). In particular the maps $L_A \, L_C$ contain $upright(d) u$, not its inverse, and extend continuously across every critical point. At an immersion point they vanish on tangential residuals and identify the real two-dimensional normal residual with the two pullback values: contraction with a nonzero complex tangent vector by a nonzero complex volume form pairs the complex normal line isomorphically with $bb(C)$.
  Consequently, on the injective immersion locus away from $z$, there are unique continuously differentiable real functions $f_A \, f_C$ such that
  #[#set math.equation(numbering: n => "(7.7)")
   $ eta \( e \) = integral_(S^2) #scale(x: 120%, y: 120%)[\(] f_A L_A e + f_C L_C e #scale(x: 120%, y: 120%)[\)] $ <eq:pencil-annihilator-coefficients>]
  for tests supported in that locus. Let $U$ be a relatively compact injective disk in the locus. A neighborhood of its image can be chosen to meet no other part of the curve. Restrictions of smooth ambient one-forms supported in this neighborhood are dense in $Omega_c^1 \( U \)$ in the $C^1$ topology. Indeed, the available regularity of $u$ gives a compactly supported $C^2$ ambient extension of any such source one-form in tubular coordinates. Approximate this extension in $C^1$ by smooth ambient one-forms, keeping their supports in the same isolated neighborhood. Their pullbacks converge in $C^1$. Testing the variations $upright(d) beta_A$ for these smooth primitives with $u$ fixed and passing to the limit gives
  $ integral_U f_A thin upright(d) theta = 0 quad upright("for every ") theta in Omega_c^1 \( U \) \, $
  since $f_A$ is continuous on the compact source support. The jet contribution of this background variation is zero because $upright(d) u \( z \) = 0$. Integration by parts proves $upright(d) f_A = 0$ on $U$; independent variations of $C$ prove $upright(d) f_C = 0$. The complement of the finite exceptional set in $S^2$ is connected, so these functions are global constants $k_A \, k_C$ on that locus.
  Define on the whole source the distribution with continuous coefficients
  $ eta_0 \( e \) = k_A integral_(S^2) L_A e + k_C integral_(S^2) L_C e . $
  Continuity of the $L$’s and elliptic regularity away from $z$ show that $eta - eta_0$ is supported at $z$, including when there are other critical or double points. For every map variation $w$, closedness of the two forms gives
  $ eta_0 \( D_u w \) = k_A integral_(S^2) upright(d) #scale(x: 120%, y: 120%)[\(] u^(*) iota_w A #scale(x: 120%, y: 120%)[\)] + k_C integral_(S^2) upright(d) #scale(x: 120%, y: 120%)[\(] u^(*) iota_w C #scale(x: 120%, y: 120%)[\)] = 0 . $
  #emph[Elimination of the point-supported remainder.] Set $R = eta - eta_0$. The annihilator equation for map variations is
  #[#set math.equation(numbering: n => "(7.8)")
   $ D_u^(*) R = - cal(J)_z^(*) lambda \, $ <eq:pencil-point-distribution>]
  where $cal(J)_z$ is the linearization of the complex-linear first jet, with the mark fixed. The right side has distributional order at most one and is supported at $z$. A point-supported distribution is a finite sum of derivatives of the Dirac delta. If its largest nonzero order were $m gt.eq 1$, its homogeneous coefficient polynomial $R_m \( xi \)$ would satisfy
  $ sigma \( D_u \)^(*) \( xi \) R_m \( xi \) = 0 quad \( xi in T_z^(*) S^2 \) . $
  There are enough coefficient derivatives for this comparison: a point-supported functional on $W^(k - 1 \, p)$ in real dimension two has order at most $k - 2$ when $p > 2$, while $r gt.eq k + 8$. The first-order Cauchy–Riemann symbol is invertible for every real $xi eq.not 0$, so this polynomial must vanish identically, a contradiction. Hence $R = q delta_z$ for a single covector $q$. Test (7.8) on variations with $w \( z \) = 0$. Since $upright(d) u \( z \) = 0$, the values of $D_u w$ and $cal(J)_z w$ at $z$ are respectively the complex-antilinear and complex-linear parts of $nabla w \( z \)$. These parts can be specified independently by a smooth variation supported near $z$. It follows that $q = 0$ and $lambda = 0$.
  Finally, variation of $v$ in (7.4) gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ delta (integral_F A_v \, integral_F C_v) = - \[ B \] F thin \( dot(v)_1 \, dot(v)_2 \) . $ <eq:pencil-period-cokernel>]
  This map is onto $bb(R)^2$. Applying the remaining annihilator $eta_0$ to these tests yields $k_A = k_C = 0$. Thus the universal derivative is onto. Its range is closed: the map-and-jet operator with background fixed is Fredholm and has finite-codimensional closed range, and adding parameter directions preserves this property.
  #emph[Index and allowed genericity.] The parametrized sphere operator has real index $4$, since $c_1 \( u^(*) T X \) = 0$ #cite(label("Wendl2014Lectures")) Theorem 3.22. Adding $v$ and the mark and imposing the first-jet constraint gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ 4 + 2 + 2 - 4 = 4 . $ <eq:pencil-critical-index>]
  For a path, allowing its parameter adds one and gives index $5$. The projection from the universal zero set to the space of perturbing primitives is therefore Fredholm of index $4$, or $5$ for paths. The projection is $C^6$, and $6 > 5$, so Sard–Smale applies with the chosen regularities #cite(label("Smale1965")) Theorem 1.3. For a regular parameter its fiber would be a manifold of that dimension. But the six-dimensional group $"PSL" \( 2 \, bb(C) \)$ acts freely on simple parametrized spheres, with the marked point transformed contragrediently, and preserves the fiber. Freeness follows because a reparametrization fixing a simple map fixes its injective locus and hence is the identity. A manifold of dimension $4$ or $5$ cannot contain this six-dimensional orbit. The fiber is empty.
  For a path, the local perturbations just used may be multiplied by arbitrary bumps in the path parameter, supported away from its endpoints. If finitely many immersed $F$-spheres are retained, a critical simple $F$-sphere cannot have one of those images. It is therefore disjoint from all of them by positivity of intersections, so every injective disk needed in the proof still admits the allowed local variations. Use the closure of smooth primitives supported off the retained images; this preserves them exactly without requiring a fixed forbidden tubular neighborhood. At a fixed model subdisk, every point already lies on a model $F$-curve. A competing critical sphere is disjoint from the whole subdisk for the same reason. The endpoint assertion follows with perturbations supported in its complement.
  There are countably many map-space charts and homotopy components, so the regular parameter choices can be made simultaneously for all of them. The conclusions are open by 39. Approximation in the defining closures by smooth primitives therefore gives smooth perturbations with the same conclusion and the same support restrictions. For paths with immersed endpoints, openness allows fixed small parameter collars at both ends. Smallness ensures positivity with $B$ fixed; the straight segment realizes the initial small perturbation by an exact positive-pair path. ◻
]

=== 7.3 Deforming immersed curves <deforming-immersed-curves>

The identification of normal deformations with one-forms follows the approach of McLean’s deformation theory for compact special Lagrangians #cite(label("McLean1998")) Theorem 3.6 and Corollary 3.9. Here the definite pair leads to a variable-coefficient operator, which we solve directly.

#prodef([Lemma 7.4.])[
  (The normal operator).  #emph[Let $u : L arrow.r X$ be a closed connected common Lagrangian immersion for a definite closed pair $\( A \, C \)$, with the complex orientation chosen by $B$. Nearby common Lagrangian immersions represented as normal graphs over $u$ form a smooth manifold of real dimension $b_1 \( L \)$. Its linearized kernel is naturally isomorphic to $H^1 \( L \; bb(R) \)$. If $u$ is simple, this also describes the local unparametrized moduli. These descriptions hold with smoothly varying pairs whose periods on $\[ u \( L \) \]$ remain zero.]
  #emph[An immersed $F$-sphere is isolated and continues uniquely under small pair variations. Near an embedded $F$-torus the nearby $F$-curves form a smooth foliation of an open neighborhood.]
] <lem:pencil-normal>

#proof[
  Represent nearby immersions by normal graphs over $u$, removing the infinitesimal reparametrizations. If $u$ is simple, its stabilizer under reparametrization is trivial: an automorphism fixing the map fixes its injective locus and hence is the identity. The normal-graph slice then also parametrizes the local unparametrized moduli. For a multiply covered immersion we make the smoothness assertion only for this slice. The symplectic form $A$ identifies the real normal bundle with $T^(*) L$ by $w mapsto alpha = u^(*) iota_w A$. Write along the source
  #[#set math.equation(numbering: n => "(7.11)")
   $ H = frac(C - x A, y) \, #h(2em) Omega = A + i H \, #h(2em) x = frac(A and C, A^2) \, #h(2em) y^2 = C^2 / A^2 - x^2 \, $ <eq:pencil-volume-normalization>]
  where the nonzero sign of $y$ is the one giving $J$ tamed by $B$. Let $*_L$ be the star on one-forms for the induced conformal structure and orientation, with $*_L alpha = - alpha compose j$. The complex volume identity gives
  $ u^(*) iota_w C = x alpha + y *_L alpha . $
  Cartan’s formula now gives the normal derivative
  #[#set math.equation(numbering: n => "(7.12)")
   $ cal(D) alpha = (upright(d) alpha \, upright(d) \( x alpha + y *_L alpha \)) . $ <eq:pencil-normal-operator>]
  The nonlinear pullbacks and their derivatives take values in pairs of exact two-forms: their integrals are the two fixed zero periods.
  For completeness we solve (7.12). Given exact two-forms $zeta_1 \, zeta_2$, choose $alpha_0$ with $upright(d) alpha_0 = zeta_1$. Adding $upright(d) f$ changes only the second equation, by
  #[#set math.equation(numbering: n => "(7.13)")
   $ cal(P) f = upright(d) \( x upright(d) f + y *_L upright(d) f \) = upright(d) x and upright(d) f + upright(d) \( y *_L upright(d) f \) . $ <eq:pencil-scalar-operator>]
  After division by a positive area form its principal part is the nonzero signed multiple $y Delta f$ of the scalar Laplacian. Its sign is constant on connected $L$, it has no zeroth-order term, and the strong maximum principle shows that its kernel consists exactly of constants #cite(label("KiselevRoquejoffreRyzhik2012")) Chapter 1, Theorem 1.6. Here one first adjusts the overall sign of the operator and then applies the principle at a maximum on the connected closed surface. It has index zero, by homotopy through scalar elliptic operators to the signed Laplacian, with the sign of $y$ held fixed; the Fredholm index is constant along this homotopy #cite(label("TaylorFunctionalNotes")) Section 7, Propositions 7.3–7.4. Its image has integral zero by Stokes’ theorem. Its cokernel has dimension one, so its range is exactly the integral-zero two-forms. We can therefore solve
  $ cal(P) f = zeta_2 - upright(d) \( x alpha_0 + y *_L alpha_0 \) . $
  This proves surjectivity onto the asserted target, with bounded elliptic right inverses in the usual Sobolev or Hölder spaces.
  If $cal(D) alpha = 0$, then $alpha$ is closed. Every class in $H^1 \( L \; bb(R) \)$ has a unique representative of this kind: start with any closed representative and solve (7.13) for an exact correction. Uniqueness follows from the constant kernel of $cal(P)$. Thus
  #[#set math.equation(numbering: n => "(7.14)")
   $ ker cal(D) arrow.r H^1 \( L \; bb(R) \) \, #h(2em) alpha mapsto \[ alpha \] $ <eq:pencil-kernel-cohomology>]
  is an isomorphism. The implicit function theorem applied to the pullback equations, with exact two-forms as target, proves the first assertion and its parameter version. For $L = S^2$ the derivative is an isomorphism, giving isolation and unique continuation.
  For an embedded torus, the kernel has dimension two. In complex normal notation its elements solve the real-linear normal Cauchy–Riemann equation. Indeed, the normal projection of a linearized map equation is unchanged by variation of the source complex structure, and the two maps in (7.6) identify that normal equation with (7.12). The complex normal line has degree $F^2 = 0$. The similarity principle says that a nonzero solution has isolated positive zeros, whose total number with multiplicity is the degree; in the closed case this is the zero formula of #cite(label("Wendl2010")) Section 2.2, Equation (2.7). Therefore every nonzero kernel section is nowhere vanishing. Evaluation at each point of the torus is consequently an isomorphism from the two-dimensional kernel to its real normal plane.
  Let $u_q$, $q in bb(R)^2$ small, be the family supplied by the implicit function theorem. The derivative of $\( x \, q \) mapsto u_q \( x \)$ is an isomorphism at every $\( x \, 0 \)$. Compactness of the torus gives a common small parameter disk on which this is a local diffeomorphism. The individual maps remain embeddings; different images cannot meet by $F^2 = 0$ and positivity. The immersion slice distinguishes the images, so evaluation is injective after shrinking the disk. It is thus a diffeomorphism onto an open tube, foliated by the $u_q \( L \)$. ◻
]

#prodef([Corollary 7.5.])[
  (The number of nodes along a path).  #emph[If all $F$-spheres for a triple are immersed, there are finitely many of them. Along a compact smooth path of triples with the original periods and with all $F$-spheres immersed, their number is constant.]
] <cor:pencil-node-count>

#proof[
  The unparametrized sphere space is compact by 39 and discrete by 41, so it is finite. Over a path, the total space of such spheres is compact and, by the parameter version of 41, its projection to the path interval is a local diffeomorphism, also in relative half-interval charts at the endpoints. Hence it is a finite covering of the interval. Equivalently, each isolated sphere has a unique local continuation, and compactness prevents any additional sphere from entering those local descriptions. The number is constant. ◻
]

=== 7.4 Exact insertion of holomorphic nodal neighborhoods <exact-insertion-of-holomorphic-nodal-neighborhoods>

#prodef([Lemma 7.6.])[
  (Insertion while retaining the sphere).  #emph[Let $K$ be the image of an immersed $F$-sphere with one transverse positive double point. Inside an arbitrarily small neighborhood of $K$, an exact path of the pair, with $B$ fixed, makes the pair equal near $K$ to (7.1) for a model satisfying (7.2). The triple stays positive and the same immersed sphere is a common Lagrangian throughout. The construction may be performed in disjoint neighborhoods of finitely many such spheres.]
] <lem:pencil-insertion>

#proof[
  Denote the node by $p$ and its two preimages on the normalization by $p_(+) \, p_(-)$. We first identify the model with a neighborhood of $K$ so that straight interpolation of the two pairs stays positive. We then localize this interpolation by two exact changes. At the node, equality of the forms as tensors makes the radial cutoff correction small. Along the rest of the sphere, the difference of the pairs need not be small; a logarithmic transverse cutoff makes its cutoff error small while retaining the positive interpolation.
  Use $x \, y \, Omega$ from (7.11) on a neighborhood of $K$. Choose the qualitative model of 44; write its normalization as $u_Y : S^2 arrow.r Y$ with node preimages $q_(+) \, q_(-)$. Uniformization supplies a biholomorphism $f$ of the normalized spheres carrying $p_plus.minus$ to $q_plus.minus$.
  #emph[Matching the derivative and the complex volume.] At $p$, the two complex tangent lines of the branches are transverse. Their prescribed tangent maps, obtained from $f$, define one complex linear isomorphism
  $ T : T_p X arrow.r T_(p_Y) Y . $
  Choose the nonzero complex scale $h$ of the model volume so that $T^(*) Sigma_Y = Omega \( p \)$. Along each smooth point of the normalization, the tangent map and equality of complex volumes determine the map on the normal quotient. More explicitly, a nonvanishing complex volume identifies the complex normal line with the dual of the tangent line. The prescribed tangent map therefore gives the required normal-line isomorphism globally. The possible lifts to a map of the two ambient complex plane bundles form an affine bundle with fiber the complex-linear maps from the normal line to the target tangent line. A smooth section exists by partitions of unity. Its values at both preimages of the node can be chosen to equal the single map $T$.
  These prescribed first derivatives need only be realized to arbitrary accuracy along $K$, with exact realization at the node. Here is a construction that addresses the crossing. First straighten the two transverse branches by smooth ambient charts in the source and target. Writing the restrictions of $f$ in these charts as $f_(+) \( u \)$ and $f_(-) \( v \)$, the product map $Phi_0 \( u \, v \) = \( f_(+) \( u \) \, f_(-) \( v \) \)$ is a genuine local diffeomorphism carrying the branches by $f$ and having derivative $T$ at $p$. Its derivative along either branch and the prescribed complex-linear derivative have the same tangent restriction and agree at $p$. They are consequently arbitrarily close on sufficiently short branch collars. On those collars interpolate their normal derivative data, keeping $Phi_0$ near $p$ and the prescribed data away from the collars. The interpolated derivatives remain invertible when the collars are sufficiently short.
  Away from the crossing the normal tubular construction realizes these jets: in normal coordinates send the zero section by $f$ and use the prescribed normal derivative on the normal coordinate. This can be patched to $Phi_0$ where the jets already agree; a partition in normal coordinates preserves the prescribed first jets. Shrinking the tubes gives a diffeomorphism $Phi$ of neighborhoods of the nodal images. To check injectivity, any hypothetical pair of coincident images in arbitrarily shrinking neighborhoods would limit to two points of $K$ with the same image. The map on the nodal image is a homeomorphism, and the map is a local diffeomorphism at every point, including the crossing. These facts rule out such a pair. We have arranged that
  #[#set math.equation(numbering: n => "(7.15)")
   $ Phi^(*) Sigma_Y = Omega quad upright("at ") p \, #h(2em) Phi^(*) Sigma_Y upright(" is arbitrarily close to ") Omega quad upright("along ") K . $ <eq:pencil-volume-matching>]
  Both volumes vanish when pulled back to the normalization.
  Put $x_p = x \( p \)$, $y_p = y \( p \)$ and set on this neighborhood
  $ A_(*) = "Re" Phi^(*) Sigma_Y \, #h(2em) C_(*) = x_p "Re" Phi^(*) Sigma_Y + y_p "Im" Phi^(*) Sigma_Y . $
  These forms are closed. If the volume matching along $K$ were exact, their pointwise relation to the old pair would be
  #[#set math.equation(numbering: n => "(7.16)")
   $ A_(*) = A \, #h(2em) C_(*) = (x_p - frac(y_p x, y)) A + y_p / y C . $ <eq:pencil-triangular-matching>]
  The ratio $y_p \/ y$ is positive. Thus every straight interpolation of the two pairs in (7.16) has the same positive anti-invariant plane and remains in the same component relative to $B$. In particular its triple Gram matrix has a uniform positive lower bound along $K$, with the interpolation parameter in $\[ 0 \, 1 \]$. Choose the approximation in (7.15) small compared with this bound. The actual straight interpolation between $\( A \, C \)$ and $\( A_(*) \, C_(*) \)$ is then positive along $K$, and on a smaller neighborhood by compactness and continuity. The biholomorphism $f$ uses the complex orientation selected by $B$, so $B$ is positive on the transported model’s complex tangent line at each smooth point of $K$. Together with positivity of the triple, this selects the model complex structure as the sign tamed by $B$. That sign persists on a smaller connected model neighborhood, independently of whether $y_p$ is positive or negative.
  #emph[The first exact correction, at the crossing.] For either closed difference $xi = A_(*) - A$ or $xi = C_(*) - C$, one has $xi \( p \) = 0$ as a tensor, and the pullback of $xi$ to each branch vanishes. In a crossing chart with $p = 0$, the radial homotopy primitive is
  #[#set math.equation(numbering: n => "(7.17)")
   $ beta_z \( v \) = integral_0^1 t thin xi_(t z) \( z \, v \) thin upright(d) t \, #h(2em) upright(d) beta = xi . $ <eq:pencil-radial-primitive>]
  It satisfies $\| beta \( z \) \| lt.eq C \| z \|^2$. Since radial contraction preserves each straightened branch, $beta$ pulls back to zero on both branches. Choose $chi_r$ equal to one on the ball of radius $r$, supported in the ball of radius $2 r$, and satisfying $\| upright(d) chi_r \| lt.eq C \/ r$. The exact change $upright(d) \( chi_r beta \)$ has norm $O \( r \)$: the two terms $chi_r xi$ and $upright(d) chi_r and beta$ both have that bound. For sufficiently small $r$ its scalar multiples preserve positivity with $B$ fixed. They preserve the common Lagrangian sphere because the primitive restricts to zero there. Do this for both differences. The resulting pair $\( A' \, C' \)$ equals $\( A_(*) \, C_(*) \)$ on the ball of radius $r$ and differs from $\( A \, C \)$ by $O \( r \)$ near that ball.
  #emph[The exact correction along the rest of the sphere.] The remaining differences $xi' = A_(*) - A'$ and $xi' = C_(*) - C'$ are closed, vanish on a neighborhood of the crossing, and pull back to zero on the source. Outside a smaller crossing ball, take normal tubes of the embedded part of the source. Normal contraction $h_t \( s \, n \) = \( s \, t n \)$ gives a relative primitive $beta'$ satisfying
  #[#set math.equation(numbering: n => "(7.18)")
   $ upright(d) beta' = xi' \, #h(2em) \| beta' \| lt.eq C d \, #h(2em) d = \| n \| . $ <eq:pencil-tubular-primitive>]
  This is the homotopy identity $upright(d) beta' = xi' - pi^(*) u^(*) xi'$. Choose the tubes in the inner collars so that the contraction stays where $xi' = 0$. Then $beta' = 0$ on those collars and extends by zero into the crossing ball. The two branch tubes are disjoint outside that ball after shrinking. This gives a single smooth relative primitive on the required tubular region, without a compatibility condition left at the node.
  Choose a transverse cutoff equal to one for $d lt.eq r_(upright("in"))$ and zero for $d gt.eq r_(upright("out"))$, where the outer tube is already small. Using a fixed smooth function of $log \( d \/ r_(upright("in")) \) \/ log \( r_(upright("out")) \/ r_(upright("in")) \)$ gives
  #[#set math.equation(numbering: n => "(7.19)")
   $ d thin \| upright(d) chi \| lt.eq frac(C, log \( r_(upright("out")) \/ r_(upright("in")) \)) . $ <eq:pencil-log-cutoff>]
  The inner radius can be made sufficiently small that the right side is any prescribed $eta > 0$. For $0 lt.eq t lt.eq 1$, the exact change is
  $ A' + t upright(d) \( chi beta'_A \) = A' + t chi \( A_(*) - A' \) + t upright(d) chi and beta'_A \, $
  and likewise for $C'$. The last terms have norm at most $C eta$ by (7.18), (7.19). The first terms are pointwise straight interpolation with parameter $t chi in \[ 0 \, 1 \]$. Taking $r$ small in the first correction preserves the positive margin already established along $K$. Shrinking the outer tubes preserves that margin throughout them. Finally take $eta$ small compared with the margin. These choices prove positivity along the entire exact path.
  The final pair agrees with the model on a neighborhood of the whole nodal image, and its primitives have compact support in the original chosen neighborhood. A sufficiently small complete model subdisk lies in this region: properness of $p_Y$ and compactness of its central fiber imply that $p_Y^(- 1) \( Delta_rho \)$ lies in any chosen neighborhood of that fiber when $rho$ is sufficiently small. Every modification restricts to zero on the normalization, so the same sphere is retained. Disjoint supports prove the last assertion. ◻
]

=== 7.5 Retaining the nodes and forming the base <retaining-the-nodes-and-forming-the-base>

#proof[
  First apply 40 to make a small exact perturbation with $B$ fixed so that all $F$-spheres are immersed. Connect it to the starting pair by a small straight segment of positive pairs. There is no assertion about immersion along this initial segment. By 42 the perturbed pair has finitely many nodal spheres $K_1 \, dots.h \, K_N$, all disjoint. If $N = 0$, the torus argument below already applies.
  For $N > 0$, use 43 at all the $K_i$, keeping $B$ fixed and retaining every $K_i$ along the resulting path. Choose smaller closed model subdisks at its endpoint. Make the endpoint generic by an arbitrarily small exact perturbation outside those subdisks. The relative assertion of 40 applies because any competing $F$-curve is disjoint from every model fiber. The endpoint now has no critical spheres, and the smaller model neighborhoods remain unchanged. Extend this endpoint perturbation a short distance into the path using a parameter cutoff; all retained $K_i$ are still common Lagrangians.
  The two ends of this latter path have only immersed spheres. Apply the path version of 40, keeping its endpoints and every $K_i$ fixed, to remove all critical spheres from its interior. The resulting smooth path stays positive with $B$ fixed. By 42, its endpoints have the same number of nodal spheres. All the original $N$ spheres were retained, so they exhaust the endpoint spheres. This argument is needed to exclude additional immersed spheres outside the inserted model regions.
  We now work at the endpoint. By 37, every point of $X$ lies on a unique simple $F$-curve image. Each is an embedded torus or one of the $K_i$. Define $S$ as the set of these images, with quotient map $p_X$. For a torus, 41 supplies an open tube diffeomorphic to $T^2 times Delta$. It is saturated: any other $F$-curve meeting a torus in this tube must equal it by intersection positivity. For a nodal sphere choose an open model subdisk. Its fibers also represent $F$, since they are homologous to its central fiber. The same argument makes this open subset saturated. Its quotient is its base disk, since the proper holomorphic model projection is open and has connected fibers. Thus the torus tubes and the model subdisks give disk neighborhoods in $S$ and cover it.
  These saturated neighborhoods can be chosen arbitrarily small around an entire fiber. For tori this follows by shrinking the parameter disk in the tube; for nodes it follows from properness of the model projection. Two distinct fibers are disjoint compact subsets of $X$, so they admit disjoint ambient neighborhoods. Choose saturated neighborhoods inside them. Their images are disjoint open neighborhoods of the two points of $S$. The quotient is therefore Hausdorff.
  The disk charts have smooth transition maps. To verify this even at a singular value, choose a smooth point of the corresponding fiber. Near that point both local quotient projections are smooth submersions with the same fibers. A local section of either submersion expresses the other base coordinate as a smooth function of it; interchanging the two gives its smooth inverse. The charts therefore make $S$ a smooth surface without boundary and $p_X$ a smooth map. They also make $p_X$ open. Since $X$ is second countable, images of a countable open basis under this open surjection form a countable basis for $S$. Compactness and connectedness of $X$ give compactness and connectedness of $S$.
  On regular fibers use their complex orientation and the complex orientation of the normal plane to orient the base. Evaluation along a connected torus preserves this choice, and the holomorphic model gives the same orientation on its regular part. Hence the orientation extends across each singular value. The map is proper because its domain is compact and its base is Hausdorff. Its singularities are precisely the ordinary holomorphic nodes of the models (locally $s = z_1 z_2$ after complex coordinate changes). The pair vanishes on every fiber by construction, and the prescribed model identities hold on the unchanged smaller neighborhoods.
  All paths used above consist of exact changes to $A \, C$ and keep $B$ fixed. Their finitely many joins can be made smooth by reparametrizations constant to infinite order at the join times. Concatenating them proves the theorem. ◻
]

== 8 The collapsing nodal model <sec:local-models>

We construct a holomorphic elliptic fibration over a disk with one ordinary node, together with a fixed holomorphic symplectic form and Kähler forms of decreasing fiber area. This local construction supplies the model used in the insertion argument of 43; it starts independently of the global pencil. We use the Gibbons–Hawking ansatz #cite(label("GibbonsHawking1978")) in the periodic form of Ooguri–Vafa #cite(label("OoguriVafa1996")), with the collapsing and semi-flat comparison developed by Gross–Wilson #cite(label("GrossWilson2000")) Section 3.

There are two further requirements for its later use. The holomorphic family and its symplectic form must stay fixed as the area decreases, and the local Kähler form must have the same two annular periods as its translation-invariant approximation. We first normalize the periodic potential and complete its node. We then identify the completed complex families and prove the annular comparison and intrinsic metric estimates needed in 10.

Write $Delta_R = { s in bb(C) : \| s \| < R }$, where $0 < R < 1$, and set

#[#set math.equation(numbering: n => "(8.1)")
 $ tau \( s \) = frac(1, 2 pi i) log s \, #h(2em) tau_2 \( s \) = "Im" tau \( s \) = - frac(1, 2 pi) log \| s \| . $ <eq:nodal-period>]

The period $tau$ is understood on branches, with its integral monodromy.

#prodef([Theorem 8.1.])[
  (The nodal model).  #emph[There are a smooth complex surface $Y$, a proper holomorphic map $p : Y arrow.r Delta_R$, and a holomorphic section disjoint from its critical point, with the following properties. The central fiber is a reduced irreducible rational curve with one ordinary node, and every other fiber is a smooth elliptic curve. On the regular part there are coordinates, relative to the section, 
#[#set math.equation(numbering: n => "(8.2)")
 $ z = a + tau \( s \) b med \( mod med bb(Z) + tau \( s \) bb(Z) \) \, #h(2em) \( a \, b \) in bb(R)^2 \/ bb(Z)^2 \, $ <eq:nodal-elliptic-coordinates>]

 and $d s and d z$ extends as a nowhere-zero holomorphic two-form. The real group $H_2 \( Y \; bb(R) \)$ is generated by a regular fiber.]
  #emph[Fix $h in bb(C) \\ { 0 }$, put $Sigma = h thin d s and d z$, and fix $0 < r < R$. For every sufficiently small $epsilon.alt > 0$ there is a Kähler form $D_epsilon.alt^(upright("loc"))$ on $Y$, with metric $g_epsilon.alt$, such that 
#[#set math.equation(numbering: n => "(8.3)")
 $ D_epsilon.alt^(upright("loc")) and "Re" Sigma = D_epsilon.alt^(upright("loc")) and "Im" Sigma = 0 \, #h(2em) \( D_epsilon.alt^(upright("loc")) \)^2 = \( "Re" Sigma \)^2 \,\
integral_(p^(- 1) \( s \)) D_epsilon.alt^(upright("loc")) = epsilon.alt quad \( s eq.not 0 \) . $ <eq:nodal-exact-identities>]

 These three forms are parallel, mutually orthogonal and of equal square, and $"vol"_(g_epsilon.alt) = \( "Re" Sigma \)^2 \/ 2$. Moreover:]
  + #emph[On each fixed closed annulus $K = { r_(-) lt.eq \| s \| lt.eq r_(+) } subset Delta_R \\ { 0 }$, the form 
#[#set math.equation(numbering: n => "(8.4)")
 $ D_epsilon.alt^(upright("sf")) = epsilon.alt thin d a and d b + frac(\| h \|^2, epsilon.alt) tau_2 \( s \) thin d x_1 and d x_2 \, #h(2em) s = x_1 + i x_2 \, $ <eq:nodal-semiflat>]

 is well-defined and closed. For every integer $m gt.eq 0$, in fixed smooth charts on this annular bundle, 
#[#set math.equation(numbering: n => "(8.5)")
 $ parallel D_epsilon.alt^(upright("loc")) - D_epsilon.alt^(upright("sf")) parallel_(C^m) lt.eq C_m e^(- c_m \/ epsilon.alt) \, #h(2em) C_m \, c_m > 0 . $ <eq:nodal-exponential-estimate>]

]
  + #emph[These forms have the same real cohomology class on $p^(- 1) \( K \)$. Their periods are $epsilon.alt$ on a fiber and zero on the torus sweeping the invariant $a$-circle at $b = 0$ around the base annulus. That swept torus bounds in $Y$.]
  + #emph[On $p^(- 1) \( overline(Delta_r) \)$, for every fixed $m$ there is a finite coordinate cover with smaller concentric domains still covering this set, such that the number of charts, the reciprocals of their radii and interior margins, and the $C^m$ bounds for the metric coefficients and their inverses are at most $C_m epsilon.alt^(- N_m)$. All intrinsic curvature derivatives of fixed finite order have polynomial bounds as well.]
  #emph[All disks, annuli and $h$ are fixed before $epsilon.alt$ tends to zero. The charts in (iii) may depend on $epsilon.alt$.]
] <thm:nodal-model>

Thus, for fixed real $x_0 \, y_0$, $y_0 eq.not 0$, the pair

$ A = "Re" Sigma \, #h(2em) C = x_0 "Re" Sigma + y_0 "Im" Sigma $

is orthogonal to $D_epsilon.alt^(upright("loc"))$. Its span with this form is positive, and its metric in volume $A^2 \/ 2$ is $g_epsilon.alt$. No normalization of $A \, C$ relative to one another is required.

=== 8.1 The periodic potential <the-periodic-potential>

The normalization follows the periodic-potential construction in #cite(label("GrossWilson2000")) Lemma 3.1 and Proposition 3.2. First take $h = 1$, and denote the area parameter by $rho$. On $\( Delta_R times bb(R) \/ rho bb(Z) \) \\ { \( 0 \, 0 \) }$ use coordinates $\( x_1 \, x_2 \, t \)$. For a precise choice of the additive constant define

#[#set math.equation(numbering: n => "(8.6)")
 $ cal(V) \( u \, v \) = frac(1, 4 pi) { & 1 / sqrt(\| v \|^2 + u^2)\
 & + sum_(n = 1)^oo (1 / sqrt(\| v \|^2 + \( u + n \)^2) + 1 / sqrt(\| v \|^2 + \( u - n \)^2) - 2 / n) } . $ <eq:nodal-unit-potential>]

The paired summands are $O \( n^(- 3) \)$ locally, with locally uniformly convergent differentiated series away from the poles. The resulting function is smooth, harmonic, and periodic with period one in $u$. Its mean is

#[#set math.equation(numbering: n => "(8.7)")
 $ integral_(- 1 \/ 2)^(1 \/ 2) cal(V) \( u \, v \) thin d u = - frac(log \| v \|, 2 pi) + frac(log 2 - gamma_(upright(E)), 2 pi) \, $ <eq:nodal-unit-mean>]

where $gamma_(upright(E))$ is Euler’s constant. Indeed, the integral of the sum truncated at $\| n \| lt.eq N$, before the factor $1 \/ \( 4 pi \)$, is

$ 2 "arsinh" frac(N + 1 \/ 2, \| v \|) - 2 sum_(n = 1)^N 1 / n arrow.r 2 log \( 2 \/ \| v \| \) - 2 gamma_(upright(E)) . $

Consequently

#[#set math.equation(numbering: n => "(8.8)")
 $ V_rho \( s \, t \) = 1 / rho {cal(V) (t / rho \, s / rho) - frac(log rho, 2 pi) + frac(gamma_(upright(E)) - log 2, 2 pi)} $ <eq:nodal-scaled-potential>]

has a positive unit monopole $1 \/ \( 4 pi sqrt(\| s \|^2 + t^2) \)$, and

#[#set math.equation(numbering: n => "(8.9)")
 $ 1 / rho integral_0^rho V_rho \( s \, t \) thin d t = frac(tau_2 \( s \), rho) . $ <eq:nodal-mean>]

The term $- \( log rho \) \/ \( 2 pi \)$ in the scaled potential is essential for keeping the periods fixed.

For $s eq.not 0$, its Fourier expansion is

#[#set math.equation(numbering: n => "(8.10)")
 $ V_rho \( s \, t \) = frac(tau_2 \( s \), rho) + frac(1, 2 pi rho) sum_(n eq.not 0) e^(2 pi i n t \/ rho) K_0 (frac(2 pi \| n s \|, rho)) . $ <eq:nodal-fourier>]

It follows by the Gaussian integral representation of the Newton kernel and integration in the periodic variable. The nonzero Fourier coefficient is proportional to

$ integral_0^oo ell^(- 1) exp (- ell \| s \/ rho \|^2 - frac(pi^2 n^2, ell)) d ell . $

Alternatively $K_0 \( a \) = integral_0^oo e^(- a cosh u) thin d u$. These representations, including their differentiated versions, give for each fixed annulus and each $m$

#[#set math.equation(numbering: n => "(8.11)")
 $ ∥V_rho - tau_2 / rho∥_(C^m \( { r_(-) lt.eq \| s \| lt.eq r_(+) } times bb(R) \/ rho bb(Z) \)) lt.eq C_m rho^(- N_m) e^(- 2 pi r_(-) \/ rho) . $ <eq:nodal-potential-tail>]

Derivatives in $t$ are taken on periodic local lifts. Differentiation introduces powers of $rho^(- 1)$ and $\| n \|$; the exponential decay makes the corresponding sums convergent. Any smaller positive exponential rate absorbs the polynomial prefactors.

The function $V_rho$ is positive on the whole punctured solid torus when $rho$ is sufficiently small. Choose $L > 1$ large enough that the Fourier tail of $rho V_rho$ on $\| s \| \/ rho gt.eq L$ is less than $- \( log R \) \/ \( 4 pi \)$. Its mean is at least $- \( log R \) \/ \( 2 pi \) > 0$, proving positivity there. On the remaining compact scaled region $\| s \| \/ rho lt.eq L$, the function $cal(V)$ is bounded below, including near its positive pole. The additive term $- \( log rho \) \/ \( 2 pi \)$ then proves positivity there also. This argument gives a positive lower bound for $rho V_rho$ off a fixed scaled pole neighborhood.

=== 8.2 The metric and the smooth nodal fiber <the-metric-and-the-smooth-nodal-fiber>

The Euclidean Hodge star uses the orientation $d x_1 and d x_2 and d t$. The form $* d V_rho$ has integral $- 1$ on a small positively oriented linking sphere. That sphere generates the second homology of the punctured solid torus. Hence it is the curvature of a real connection $theta$ on a principal $bb(R) \/ bb(Z)$-bundle, normalized by integral one on its circle fibers:

#[#set math.equation(numbering: n => "(8.12)")
 $ d theta = * d V_rho . $ <eq:nodal-connection>]

In this period-one convention the curvature itself represents the first Chern class. We may change $theta$ by a closed basic one-form.

With $x_3 = t$, set, for cyclic $\( i \, j \, k \)$,

#[#set math.equation(numbering: n => "(8.13)")
 $ g_rho & = V_rho \( d x_1^2 + d x_2^2 + d t^2 \) + V_rho^(- 1) theta^2 \,\
gamma_i & = d x_i and theta + V_rho thin d x_j and d x_k . $ <eq:nodal-gh-triple>]

The signs follow directly from

$ d \( d x_i and theta \) = - partial_i V_rho thin d x_1 and d x_2 and d x_3 \, #h(2em) d \( V_rho d x_j and d x_k \) = partial_i V_rho thin d x_1 and d x_2 and d x_3 . $

Thus all three forms are closed. In the coframe $V_rho^(1 \/ 2) d x_i \, V_rho^(- 1 \/ 2) theta$ they form the standard orthogonal equal-square self-dual frame, with the induced four-dimensional orientation. To check parallelness, write the connection on this frame in terms of three real one-forms $a_i$. After a consistent choice of frame signs, the equations for closedness are

$ I_2 a_3 - I_3 a_2 = 0 \, #h(2em) I_3 a_1 - I_1 a_3 = 0 \, #h(2em) I_1 a_2 - I_2 a_1 = 0 \, $

where $I_i alpha = * \( alpha and gamma_i \)$, with an overall sign chosen so $I_1 I_2 = I_3$. The first two equations give $a_3 = - I_1 a_2$ and $a_1 = - I_2 a_3 = - I_3 a_2$. The third then gives $2 I_1 a_2 = 0$, so all $a_i$ vanish. The frame is parallel. In particular

#[#set math.equation(numbering: n => "(8.14)")
 $ Omega_rho = gamma_1 + i gamma_2 = d s and \( theta - i V_rho d t \) . $ <eq:nodal-gh-complex-form>]

It is decomposable and has positive product with its conjugate. Its kernel defines the complex structure for which $gamma_3$ is Kähler. This kernel is involutive: closedness and Cartan’s formula give $iota_(\[ U \, W \]) Omega_rho = 0$ whenever $U \, W$ annihilate $Omega_rho$. The function $s$ is holomorphic.

Here is the completion and the quantitative information at its pole. In scaled coordinates $upright(bold(X)) = \( x_1 \, x_2 \, t \) \/ rho$, write

#[#set math.equation(numbering: n => "(8.15)")
 $ W = rho V_rho = W_m + H_rho \, #h(2em) W_m = frac(1, 4 pi r) \, quad r = \| upright(bold(X)) \| . $ <eq:nodal-pole-split>]

On a fixed ball of radius less than $1 \/ 4$, $H_rho = H_0 - \( log rho \) \/ \( 2 pi \)$, where $H_0$ is smooth harmonic and independent of $rho$. A local gauge gives $theta = theta_m + beta$, where $d theta_m = * d W_m$ and $beta$ is smooth basic with $d beta = * d H_0$. Its derivatives on a smaller ball are bounded independently of $rho$.

The charge-one Hopf chart completes $W_m thin d upright(bold(X))^2 + W_m^(- 1) theta_m^2$ to a flat smooth four-dimensional ball. In this chart $upright(bold(X))$ and $r$ are smooth quadratic expressions, and $r theta_m$ is smooth. The coefficient $1 \/ \( 4 pi \)$, with connection period one, is the smooth Hopf normalization. Now

#[#set math.equation(numbering: n => "(8.16)")
 $ W^(- 1) = frac(4 pi r, 1 + 4 pi r H_rho) \, #h(2em) frac(W^(- 1) - W_m^(- 1), r^2) = - frac(\( 4 pi \)^2 H_rho, 1 + 4 pi r H_rho) . $ <eq:nodal-pole-inverse>]

It follows that

$ g_rho \/ rho = W thin d upright(bold(X))^2 + W^(- 1) \( theta_m + beta \)^2 $

is smooth at the added point. In particular, the coefficient of the apparently singular squared-connection difference is smooth by the second identity in (8.16). Subtracting the flat Hopf triple in

$ gamma_i \/ rho = d X_i and \( theta_m + beta \) + W thin d X_j and d X_k $

shows that the forms also extend smoothly. At the added point their values are the flat triple, so they remain nondegenerate. We obtain a smooth hyperkähler surface $Y_rho$, and its holomorphic function $s$ extends over the added point.

At that point $d s = 0$. The quadratic term of $s$ is the nondegenerate holomorphic quadratic of the Hopf map; in linear complex coordinates it is a nonzero multiple of $w_1 w_2$. The holomorphic Morse lemma therefore gives an ordinary node. Away from this point the central fiber is a circle bundle over $\( bb(R) \/ rho bb(Z) \) \\ { 0 }$. Completing its two ends at the pole gives a reduced irreducible nodal curve with spherical normalization. The fibers for $s eq.not 0$ are two-tori, and their relative holomorphic one-form from $Omega_rho$ has no zeros; they are elliptic curves. The projection $p_rho : Y_rho arrow.r Delta_R$ is proper: over a compact base set its complement of a pole neighborhood is a circle bundle over a compact set, and the missing part is a compact subset of the completed Hopf chart.

The potential is invariant under $t mapsto rho - t$, so the curvature restricts to zero on $t = rho \/ 2$. The flat circle connection over this disk has a horizontal section $S_rho$. It is holomorphic: its tangent space has $d t = theta = 0$, so $Omega_rho$ vanishes there, while $d s$ is an isomorphism to the base tangent. It avoids the critical point.

Integrate the relative holomorphic differential from this section to obtain the Abel coordinate $z$ on each smooth fiber. The connection circle has period one. Orient the other cycle in the negative $t$-direction. Its period $tau_rho$ then satisfies

$ "Im" tau_rho \( s \) = integral_0^rho V_rho \( s \, t \) thin d t = tau_2 \( s \) . $

The periods are holomorphic on each branch of the regular base. Thus $tau_rho - tau$ is a real constant. Adding a real multiple of $d t \/ rho$ to $theta$ changes exactly this real period; we choose it to make $tau_rho = tau$. An integral change only changes the cycle basis. This does not affect curvature or the horizontal section in the midpoint slice. In the resulting coordinates $Omega_rho = d s and d z$.

=== 8.3 The fixed complex surface across the node <the-fixed-complex-surface-across-the-node>

The common periods identify the regular elliptic families, preserving their sections and relative differentials. The following argument extends the identification across zero.

#prodef([Lemma 8.2.])[
  #emph[The preceding identifications extend to holomorphic symplectic isomorphisms of the completed families $Y_rho arrow.r Delta_R$.]
] <lem:nodal-fixed-family>

#proof[
  We compare the families through the degree-three divisors given by three times their sections. Their line bundles embed the fibers as plane cubics. Laurent coefficients at the section, measured in the normalized Abel coordinate, will identify the three-dimensional spaces of sections across the puncture; taking closures will then identify the completed families.
  Each $p_rho$ is a flat proper family of connected reduced curves. For flatness, the local ring of the smooth total surface has no torsion over the local ring of the one-dimensional smooth base, since $p_rho - s_0$ is not a zero divisor. Torsion-free modules over this discrete valuation ring are flat. The fibers have arithmetic genus one, and $S_rho$ is a Cartier divisor in the fiberwise smooth locus.
  Set $cal(L)_rho = cal(O)_(Y_rho) \( 3 S_rho \)$. This line bundle is flat over the base, since it is locally free on the flat family. Its restriction to each fiber is a degree-three very ample line bundle, with $h^0 = 3$ and $h^1 = 0$. For the complex-linear Dolbeault operator on a line bundle of degree $d$ over a closed connected Riemann surface of genus $g$, the complex index is $d + 1 - g$, and $d > 2 g - 2$ gives surjectivity #cite(label("Wendl2014Lectures")) Section 3.4, Theorems 3.22–3.23. On a smooth genus-one fiber this gives the asserted dimensions. After imposing any length-two subscheme, the remaining degree is one and the first cohomology still vanishes. This proves very ampleness on those fibers. For the nodal curve one can check the assertion explicitly. Normalize it by $bb(P)^1$, with the two preimages of the node at $0 \, oo$. A degree-three line bundle pulls back to $cal(O)_(bb(P)^1) \( 3 \)$, with a nonzero gluing parameter $lambda$ for its fibers at these points. Its sections are degree-at-most-three polynomials with constant coefficient $lambda$ times the leading coefficient. The basis $w \, w^2 \, w^3 + lambda$ gives the map
  $ w mapsto \[ w : w^2 : w^3 + lambda \] . $
  It identifies exactly $0$ and $oo$; away from these points the ratio of the second coordinate to the first is $w$. At $0$ and $oo$ the two tangent lines are distinct, as is seen in the affine chart about $\[ 0 : 0 : 1 \]$. Thus it embeds the nodal curve as a nodal cubic. To compute its cohomology directly, let $N$ denote the nodal fiber, $nu : bb(P)^1 arrow.r N$ its normalization, and $L = cal(L)_rho \|_N$. The gluing condition gives the exact sequence
  $ 0 arrow.r L arrow.r nu_(*) cal(O)_(bb(P)^1) \( 3 \) arrow.r^("ev"_0 - lambda "ev"_oo) bb(C)_(upright("node")) arrow.r 0 \, $
  where the last sheaf is supported at the node and its fiber is $bb(C)$. In the polynomial trivializations just used, the map on global sections is the constant coefficient minus $lambda$ times the leading coefficient. It is surjective. The normalization is finite, so the cohomology of its direct image is that of $cal(O)_(bb(P)^1) \( 3 \)$. The latter has $h^0 = 4$ and $h^1 = 0$. The cohomology exact sequence therefore gives $h^0 \( N \, L \) = 3$ and $h^1 \( N \, L \) = 0$.
  We use the following proper holomorphic base-change theorem: for a proper holomorphic map to a reduced base and a coherent sheaf flat over that base, constancy of the fiber dimensions $h^q$ implies that the $q$-th direct image is locally free and its restriction to each base point is the cohomology of that fiber; see #cite(label("Grauert1960")) Section 7, Satz 5 and the correction #cite(label("Grauert1963")). Our map is proper and surjective, the disk is reduced, and $cal(L)_rho$ is flat over it. Applying the theorem with $q = 0$ and the constant value $h^0 = 3$ gives a holomorphic rank-three bundle
  $ E_rho = \( p_rho \)_(*) cal(L)_rho $
  with those spaces as fibers. Evaluation gives a relative closed embedding in $bb(P) \( E_rho^(*) \)$. Indeed the fiberwise embeddings and base change give the evaluation and separation properties locally over the base. At the nodal point, the fiber’s Zariski tangent space is the whole tangent space of the smooth total surface, so tangent separation there also gives an immersion of the total surface. Properness then gives the closed embedding.
  Near the section $p_rho$ is a submersion. Write $Omega_rho = f \( s \, w \) thin d s and d w$, with $w = 0$ on the section. The coordinate
  $ z \( s \, w \) = integral_0^w f \( s \, u \) thin d u $
  is holomorphic, has nonzero relative derivative, and is zero on the section. It extends the normalized local Abel coordinate also across $s = 0$. Regard sections of $cal(L)_rho$ as meromorphic functions with poles of order at most three on $S_rho$. Their Laurent coefficients in degrees $- 3 \, - 2 \, - 1 \, 0$ define
  #[#set math.equation(numbering: n => "(8.17)")
   $ E_rho arrow.r cal(O)_(Delta_R)^(thin 4) . $ <eq:nodal-jet-map>]
  This map is fiberwise injective. A function in its kernel has no pole and hence is constant on the compact connected reduced fiber; its zero constant coefficient makes it zero. Thus its image is a rank-three subbundle, including over zero.
  The images agree on the punctured disk by the regular elliptic identifications. Continuity of their Grassmannian-valued maps makes them agree also at zero, identifying the bundles $E_rho$. Their relative cubic images agree as well: each is the closure of its image over the punctured disk, and both are reduced analytic subspaces. This gives an isomorphism of the completed families. The holomorphic two-forms agree on the regular part and therefore everywhere. ◻
]

Fix one small reference parameter and take its surface as $Y$. Using 45, the form $Sigma_0 = d s and d z$ is fixed on $Y$, while the transported forms $gamma_3$ are its varying Kähler forms. In particular the qualitative model existence used to insert nodes does not assume a global fibration.

=== 8.4 Comparison and periods on fixed annuli <comparison-and-periods-on-fixed-annuli>

The complex family is now fixed. To glue its Kähler forms later, we need estimates in the same smooth annular coordinates for every area parameter, together with equality of their annular classes. Work over a fixed annulus with positive inner radius and on bounded branches relative to the midpoint section. The imaginary part of the Abel coordinate is

#[#set math.equation(numbering: n => "(8.18)")
 $ q = "Im" z = integral_t^(rho \/ 2) V_rho \( s \, u \) thin d u . $ <eq:nodal-q-coordinate>]

Consequently (8.11) gives

#[#set math.equation(numbering: n => "(8.19)")
 $ q = frac(rho \/ 2 - t, rho) tau_2 \( s \) + E_rho \( s \, t \) \, #h(2em) parallel E_rho parallel_(C^m) lt.eq C_m rho^(- N_m) e^(- c \/ rho) . $ <eq:nodal-q-tail>]

The interval of integration has length $O \( rho \)$; differentiated endpoints cost only powers of $rho^(- 1)$. Since $q = tau_2 b$ and $tau_2$ is bounded above and below,

#[#set math.equation(numbering: n => "(8.20)")
 $ b = frac(rho \/ 2 - t, rho) + O \( e^(- c' \/ rho) \) \, #h(2em) t = rho / 2 - rho b + O \( e^(- c' \/ rho) \) $ <eq:nodal-inverse-t>]

with all fixed finite-order derivatives in the corresponding coordinates. For the inverse statement, $partial_t b = - V_rho \/ tau_2$ has absolute value bounded below by a constant times $rho^(- 1)$. Successive differentiation of the inverse relation introduces only polynomial factors, absorbed by reducing $c' > 0$.

There is a complex function $k$ on each branch such that

#[#set math.equation(numbering: n => "(8.21)")
 $ d z - \( theta - i V_rho d t \) = k thin d s . $ <eq:nodal-connection-comparison>]

The difference gives zero relative differential and has zero wedge with $d s$, by (8.14). Its imaginary part says

$ "Im" \( k thin d s \) = d_s q = b thin d tau_2 + O \( e^(- c' \/ rho) \) \, $

where $t$ is held fixed. Since $tau$ is holomorphic, $"Im" \( b tau' \( s \) thin d s \) = b thin d tau_2$. The real-linear map taking $k$ to $"Im" \( k thin d s \)$ is an isomorphism onto real base one-forms. Thus $k = b tau' \( s \) + O \( e^(- c' \/ rho) \)$. Substituting $d z = d a + tau thin d b + b tau' \( s \) thin d s$ in (8.21) gives

#[#set math.equation(numbering: n => "(8.22)")
 $ theta = d a + "Re" tau thin d b + O \( e^(- c' \/ rho) \) . $ <eq:nodal-theta-tail>]

All the errors here have their fixed finite-order derivative bounds in the fixed $\( s \, a \, b \)$ charts. Therefore

#[#set math.equation(numbering: n => "(8.23)")
 $ gamma_3 & = d t and theta + V_rho d x_1 and d x_2\
 & = rho thin d a and d b + frac(tau_2 \( s \), rho) thin d x_1 and d x_2 + O \( e^(- c' \/ rho) \) . $ <eq:nodal-area-one-comparison>]

The fiber sign follows from $\( - thin rho thin d b \) and d a = rho thin d a and d b$. Its exact area is $rho$, since on a fiber $gamma_3 = d t and theta$, and the two periods are $rho$ and one, with this complex orientation.

Under monodromy $tau mapsto tau + 1$, the angle change is $\( a \, b \) mapsto \( a - b \, b \)$. It preserves $d a and d b$, and $tau_2$ is single-valued. Hence the invariant comparison form and the finite-chart estimates descend to the annular bundle.

To identify the periods that test exactness on the annular bundle, we first determine the topology of the completed disk neighborhood. A one-critical-point Lefschetz fibration over a disk has the homotopy type of a regular fiber with its vanishing thimble attached. Here this description follows by trivializing over a slit disk: the circle over a path to the critical value collapses to the Hopf point and gives the one attached disk, while the complement of that path is a trivial smooth fibration. The vanishing circle is the primitive connection circle $a$. Thus the cellular description is a torus with one additional two-cell attached along $a$. Collapsing that cell together with $a$ leaves a one-cell $b$ and the torus two-cell with trivial attaching map, so the homotopy type is $S^1 or S^2$. More precisely its cellular boundary sends the additional two-cell to $a$ and sends the torus two-cell to zero. Consequently its second real homology is generated by the original torus fiber, as asserted.

#prodef([Lemma 8.3.])[
  #emph[The two forms in (8.23) have the same real cohomology class on the annular bundle: their periods are $rho$ on a fiber and zero on the invariant-cycle sweep.]
] <lem:nodal-annular-periods>

#proof[
  We use the two-cycle comparison from #cite(label("GrossWilson2000")) proof of Lemma 4.3. The annular bundle retracts to the mapping torus of one shear. Its homology exact sequence is
  $ 0 arrow.r H_2 \( T^2 \; bb(R) \) arrow.r H_2 \( p^(- 1) \( K \) \; bb(R) \) arrow.r ker \( T_(*) - 1 : H_1 \( T^2 \; bb(R) \) arrow.r H_1 \( T^2 \; bb(R) \) \) arrow.r 0 . $
  The first term is generated by a fiber, and the last by the invariant $a$-circle. This circle has a sweep at $b = 0$. These two cycles thus test all real two-periods.
  The fiber periods were computed above. The sweep is the connection circle bundle over a base circle in $t = rho \/ 2$. The connection circle bundle over the full base disk in this slice is a solid torus bounding it in $Y$. On the sweep $d t = 0$, and the base has only one tangent direction, so the restriction of $d t and theta + V_rho d x_1 and d x_2$ is zero. The invariant comparison form also has zero restriction, because $d b = 0$ and the same dimensional observation applies. ◻
]

=== 8.5 Polynomial intrinsic geometry <polynomial-intrinsic-geometry>

The annular estimates use a fixed smooth atlas, as the gluing requires. For the remaining metric estimates the charts may instead vary with $rho$: we transport each metric together with its own controlled charts. This is enough to bound intrinsic derivatives on the model cores in 10. We prove these bounds on a fixed smaller disk.

Near the pole use the Hopf chart of (8.15). For small $rho$, the function $H_rho$ is positive on this chart; its positive-order derivatives are bounded and $\| H_rho \| lt.eq C \( 1 + \| log rho \| \)$. The formulas (8.16) show that the coefficients of $g_rho \/ rho$ and their derivatives have polynomial bounds in $1 + \| log rho \|$. For the inverse bounds compare

$ W thin d upright(bold(X))^2 + W^(- 1) \( theta_m + beta \)^2 quad upright("with") quad W_m thin d upright(bold(X))^2 + W_m^(- 1) theta_m^2 . $

The ratio $W \/ W_m = 1 + 4 pi r H_rho$ and its reciprocal have polynomial bounds. Replacing $theta_m$ by $theta_m + beta$ is a shear with smooth bounded coefficients in the flat Hopf metric, because $beta$ is basic and smooth in the quadratic base coordinates. This gives upper and lower polynomial metric comparisons. Differentiation of the matrix inverse gives its derivative estimates. Restoring the factor $rho$ yields polynomial bounds in $rho^(- 1)$.

Off a smaller scaled pole neighborhood, use fixed-radius balls in scaled coordinates $\( s \/ rho \, t \/ rho \)$. On such balls over $overline(Delta_r)$, the periodic sum and the Fourier formula give, for every multi-index,

#[#set math.equation(numbering: n => "(8.24)")
 $ c lt.eq W \, #h(2em) W lt.eq C \( 1 + \| log rho \| \) \, #h(2em) \| partial^alpha W \| lt.eq C_alpha \( 1 + \| log rho \| \) . $ <eq:nodal-scaled-regular-bounds>]

The lower bound follows from positivity on the fixed larger disk. Bounded scaled distance uses the periodic sum; large scaled distance uses the mean and Fourier tails. The curvature is $* d W$ in these coordinates, so radial local gauges give connection coefficients with the same finite-order bounds. Cover the period-one connection circle by fixed coordinate intervals. The metric in these charts is

$ rho { W thin d upright(bold(X))^2 + W^(- 1) \( d theta.alt + beta \)^2 } . $

(8.24) gives polynomial bounds for its coefficients, inverse and all fixed derivatives.

There are polynomially many charts with the required margins. The scaled base disk has radius $O \( rho^(- 1) \)$, and its periodic direction has length one. A grid of fixed-radius balls, with a fixed number of circle charts above each, uses at most $C rho^(- 2)$ charts off the pole. Refining the grid by a fixed factor makes smaller concentric balls still cover. Use similarly smaller circle intervals. The fixed gap $R - r$ supplies room at the outer boundary, and the Hopf chart covers the omitted pole region. Coordinate formulas for the connection and curvature, with the inverse metric estimates, also give polynomial bounds for each fixed intrinsic curvature derivative.

These bounds survive transport to the fixed complex surface. If $I_rho : Y arrow.r Y_rho$ is the isomorphism from 45, transport the charts by $I_rho^(- 1)$ and the metric by $I_rho^(*)$. Their metric coefficients are exactly the coefficients already estimated, and

$ I_rho^(*) \( gamma_1 + i gamma_2 \) = Sigma_0 . $

Thus the fixed real and imaginary parts of $Sigma_0$ and the transported $gamma_3$ are parallel, and the volume is the fixed form $\( "Re" Sigma_0 \)^2 \/ 2$. No bound for derivatives of $I_rho$ in a separately fixed smooth atlas is used. On annuli, where a fixed atlas is needed for gluing, (8.18), (8.22) give that distinct estimate.

#proof[
  #emph[Completion of the proof of 44.] The construction and 45 give the fixed holomorphic nodal disk. For general $h = \| h \| e^(i phi.alt)$, rotate $gamma_1 + i gamma_2$ by $e^(i phi.alt)$, scale the full triple and the metric by $\| h \|$, and take
  $ rho = epsilon.alt \/ \| h \| \, #h(2em) D_epsilon.alt^(upright("loc")) = \| h \| gamma_3 \, #h(2em) g_epsilon.alt = \| h \| g_rho . $
  The holomorphic two-form becomes $Sigma = h thin d s and d z$, the fiber area becomes $epsilon.alt$, and the equal-square identities give (8.3). The scaled annular expression is precisely (8.4), with coefficient $\| h \|^2 \/ epsilon.alt$. The exponential comparison and both period identities follow from (8.23), Lemma 8.3. The polynomial estimates persist because $h$ is fixed and nonzero. This proves all assertions. ◻
]

== 9 Preparing the regular fibers <sec:regular-preparation>

The torus fibration gives a way to average the pair along its regular fibers. We use this averaging to construct an invariant pair and a closed form of unit fiber area orthogonal to both members. These are the data needed for the auxiliary volume equation in 10. Every change to the pair is exact, and the curve criterion keeps a taming form in the original third class throughout the preparation.

Write $p : X arrow.r S$ for the fibration of 38, and let $Delta subset S$ be its finite set of critical values. Put

$ S^compose = S \\ Delta \, #h(2em) X^compose = p^(- 1) \( S^compose \) . $

The fiber and base orientations are the complex orientations supplied by that theorem. We identify the class of an oriented fiber with its Poincaré dual $F in H^2 \( X \; bb(Z) \) \/ upright("torsion")$. In particular, if $nu_S$ is a positive area form with $integral_S nu_S = 1$, then

#[#set math.equation(numbering: n => "(9.1)")
 $ \[ p^(*) nu_S \] = F . $ <eq:regular-basic-class>]

For example, this follows by first taking a representative of the unit class supported near a regular value, whose pullback is a Thom form for the corresponding fiber.

#prodef([Proposition 9.1.])[
  #emph[Let $\( A_0 \, C_0 \, B_0 \)$ and $p : X arrow.r S$ be the positive triple and fibration obtained in 38. Retain the normalized original periods and the class $F$ of 36. On disjoint disks $U_j$ about the critical values, use the models of 44, with 
#[#set math.equation(numbering: n => "(9.2)")
 $ Sigma_j = h_j thin upright(d) s and upright(d) z \, #h(2em) A_0 = Re Sigma_j \, #h(2em) C_0 = x_j Re Sigma_j + y_j Im Sigma_j \, #h(2em) y_j eq.not 0 \, $ <eq:regular-input-model>]

 where $h_j eq.not 0$, $x_j$, and $y_j$ are constants and $z = a + tau \( s \) b$ modulo the elliptic period lattice.]
  #emph[There are smaller disks $U'_j subset.double U_j$ and a smooth path of positive closed triples $\( A_t \, C_t \, B_t \)$, $0 lt.eq t lt.eq 1$, starting at $\( A_0 \, C_0 \, B_0 \)$, with the following properties.]
  + #emph[Each of the three cohomology classes is constant. The restrictions of $A_t \, C_t$ to the fibers vanish, and the pair equals $\( A_0 \, C_0 \)$ on $p^(- 1) \( U'_j \)$ for every $t$.]
  + #emph[The endpoint pair $A = A_1$, $C = C_1$ is invariant under the torus group bundle acting on $X^compose$ by the action-angle translations of $A_0$. This is also the torus action determined by $A$.]
  + #emph[There is a smooth closed invariant two-form $Psi$ on $X^compose$ such that 
#[#set math.equation(numbering: n => "(9.3)")
 $ integral_(p^(- 1) \( s \)) Psi = 1 \, #h(2em) Psi and A = Psi and C = 0 quad upright("on ") X^compose . $ <eq:regular-prepared-data>]

 On each punctured $p^(- 1) \( U'_j \\ { s_j } \)$ it equals $upright(d) a and upright(d) b$. In particular, $Psi^2$ vanishes there.]
  #emph[The fibration and its smaller nodal models remain fixed. All of these choices are made before introducing the parameter $epsilon$ in the auxiliary-volume construction.]
] <prop:regular-preparation>

We first describe averaging and the positive pair paths it permits.

=== 9.1 Fiber translations and exact averaging <fiber-translations-and-exact-averaging>

The regular torus fibration is a torsor: there are local choices of an origin in each fiber, but a global choice is unnecessary. Here is a direct description of its translations. If $alpha_s in T_s^(*) S^compose$, the equation

$ iota_(Y_alpha) A_0 = - p^(*) alpha $

defines a unique vertical vector field along $p^(- 1) \( s \)$, since the fibers are Lagrangian for $A_0$. Locally take $alpha = upright(d) f$ on the base. The fields $Y_(upright(d) f)$ are Hamiltonian; their brackets vanish because their Hamiltonians are pulled back from the base and their fields are vertical. Their complete flows on each compact fiber therefore give a transitive $T_s^(*) S^compose$-action with a rank-two stabilizer lattice $cal(L)_s$. The lattices vary smoothly locally: choose a local origin section and apply the implicit function theorem to the return equation for each member of a lattice basis. The derivative in the orbit parameter is an isomorphism onto the vertical tangent plane, so the two periods continue smoothly and remain a lattice basis after shrinking the base chart.

A local smooth section $alpha$ of $cal(L)$ is a closed one-form. Indeed, its vertical flow $phi.alt_t$ has $phi.alt_1 = "Id"$, whereas Cartan’s formula gives

$ phi.alt_t^(*) A_0 = A_0 - t p^(*) \( upright(d) alpha \) . $

Putting $t = 1$ proves $upright(d) alpha = 0$. A local lattice basis thus consists of closed one-forms, and these are differentials of local base coordinates. The corresponding period-one flows define translations by constant angles in $bb(R)^2 \/ bb(Z)^2$, and each such translation preserves $A_0$. In two overlapping choices of angle coordinates the change has the form

#[#set math.equation(numbering: n => "(9.4)")
 $ theta' = M theta + g \( s \) \, #h(2em) M in "GL" \( 2 \, bb(Z) \) upright(" locally constant") . $ <eq:regular-angle-transition>]

Thus translation by $u$ in one chart is translation by $M u$ in the other, independently of the base-dependent change of origin $g$.

On a model disk, the translations are exactly $z mapsto z + a_0 + tau \( s \) b_0$ for constant real $a_0 \, b_0$ modulo integers. They preserve $Sigma_j$, since the extra term in $upright(d) z$ is a multiple of $upright(d) s$. Equivalently, contraction of $A_0$ with the period-one fields $partial_a \, partial_b$ gives the closed base one-forms $- Re \( h_j upright(d) s \)$ and $- Re \( h_j tau \( s \) upright(d) s \)$. They form the period basis just described. Both model forms in (9.2) are consequently invariant.

#prodef([Lemma 9.2.])[
  #emph[There is a well-defined averaging projection $"Av" : Omega^(*) \( X^compose \) arrow.r Omega^(*) \( X^compose \)$ onto forms invariant under these local translations, and it commutes with $upright(d)$. If a closed form $xi$ satisfies $"Av" xi = 0$, then $xi = upright(d) beta$ for a smooth form $beta$ with $"Av" beta = 0$. The primitive can be chosen without enlarging support over the base: if $xi$ vanishes over an open set in $S^compose$, then so does $beta$.]
  #emph[In particular, a closed form and its average represent the same class on $X^compose$. If their difference is supported over a compact subset of $S^compose$, the primitive extends by zero over the nodal neighborhoods and gives exactness on $X$.]
] <lem:regular-averaging>

#proof[
  In a local translation chart define the average by integrating pullbacks against normalized Haar measure on $bb(R)^2 \/ bb(Z)^2$. The conjugacy in (9.4) and invariance of Haar measure make the definitions agree on overlaps. Each pullback commutes with $upright(d)$, which proves the assertion about differentiation.
  For exactness, choose a translation-invariant horizontal splitting of $T X^compose arrow.r p^(*) T S^compose$ and a smoothly varying invariant flat metric on the vertical tori. Such choices exist: make them locally and patch horizontal lifts and vertical inner products by partitions of unity pulled back from the base. The transition rule above preserves invariance, and the relevant sets of choices are affine or convex.
  Filter differential forms by horizontal degree. On the associated graded complex the leading differential is the vertical exterior derivative $upright(d)_v$. For each horizontal degree, fiberwise Hodge theory #cite(label("TaylorHodge2010")) Equations (1.11)–(1.22) provides a homotopy $H_v = upright(d)_v^(*) G_v$ on the vertical complex, with the usual sign for its horizontal degree. Here $G_v$ is the inverse of the vertical Laplacian on the complement of its kernel. Its harmonic forms are precisely the translation-invariant forms. On the zero-average subspace, therefore,
  #[#set math.equation(numbering: n => "(9.5)")
   $ upright(d)_v H_v + H_v upright(d)_v = "Id" . $ <eq:regular-vertical-homotopy>]
  These operators act smoothly in the base: in a local torus chart they are the inverses on nonzero Fourier modes for a smoothly varying flat metric. They preserve zero average and use no values at other base points.
  Suppose the smallest horizontal degree of the closed zero-average form $xi$ is $r$, and denote its component of that degree by $xi_r$. Closedness gives $upright(d)_v xi_r = 0$. By (9.5), subtracting $upright(d) \( H_v xi_r \)$ removes $xi_r$, and the remainder is closed, has zero average, and has horizontal degree at least $r + 1$. Repeat this step. The horizontal degree is at most two, so the procedure terminates. A component of vertical degree zero that is vertically closed and has zero average is already zero. The sum of the primitives gives $beta$. Every operation is local in the base, including the differentiations used in the successive remainders. Hence the support assertion follows. Applying the construction to $xi - "Av" xi$ proves the remaining claims. ◻
]

=== 9.2 The positive cone and the third class <the-positive-cone-and-the-third-class>

#prodef([Lemma 9.3.])[
  #emph[Fix a symplectic two-form $A$ with $A^2 > 0$ and a Lagrangian two-plane $L$ in an oriented four-dimensional vector space. Among two-forms $C$ satisfying $C \|_L = 0$, each component of the condition that $\( A \, C \)$ be a definite pair is convex. Adding a two-form pulled back from the quotient by $L$ to either member of the pair does not change its wedge-product matrix.]
  #emph[Consequently the path from $C$ to its translation average, with $A$ fixed, preserves definiteness for a fiber-Lagrangian pair on $X^compose$. Basic additions to either member do so as well. Along these paths the fiber complex orientation and the quotient complex orientation remain the ones fixed at the start.]
] <lem:regular-mixed-cone>

#proof[
  Choose covectors $e_1 \, e_2$ vanishing on $L$ and complementary covectors $f_1 \, f_2$ so that
  $ A = e_1 and f_1 + e_2 and f_2 \, #h(2em) C = sum_(i \, j = 1)^2 M_(i j) e_i and f_j + c thin e_1 and e_2 . $
  Direct wedge multiplication yields
  $ A and C = 1 / 2 "tr" \( M \) A^2 \, #h(2em) C^2 = det \( M \) A^2 . $
  Writing $h = "tr" \( M \) \/ 2$ and $T = M - h "Id"$ gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ \( r A + t C \)^2 = #scale(x: 120%, y: 120%)[\(] \( r + t h \)^2 + t^2 det T #scale(x: 120%, y: 120%)[\)] A^2 . $ <eq:regular-mixed-square>]
  Thus the pair is definite exactly when $det T > 0$. Set
  $ T = mat(delim: "(", u, v; w, - u) \, #h(2em) q = 1 / 2 \( v - w \) \, #h(2em) r_0 = 1 / 2 \( v + w \) . $
  Then $det T = q^2 - r_0^2 - u^2$. Its two positive components are $q > sqrt(r_0^2 + u^2)$ and $q < - sqrt(r_0^2 + u^2)$, both convex; $h$ and $c$ are unrestricted. This proves the first assertion. A quotient two-form wedges to zero with both members of a fiber-Lagrangian pair, and its own square vanishes. This proves the assertion about basic additions, also when both members change.
  At a fixed point all translated pullbacks of $C$ lie in one of the two components: translations preserve $A$ and can be connected to the identity within the torus. Their compact average remains strictly inside that convex component, as does the segment to the average. The common Lagrangian plane is a complex line by 5. Continuing the choice of sign of the almost complex structure along the path keeps its orientation on this plane, and hence the quotient orientation, fixed. ◻
]

The next lemma separates the smooth choice of representatives from the pointwise question of whether a class contains a tamer. It will also be used when the final endpoint representatives have been chosen.

#prodef([Lemma 9.4.])[
  #emph[Let $J_t$, $0 lt.eq t lt.eq 1$, be a smooth family of almost-complex structures on a compact manifold. Suppose each $J_t$ admits a closed tamer in one fixed class $H$. Given such representatives $beta_0$ and $beta_1$ at the endpoints, there is a smooth family of closed tamers $beta_t in H$ with those endpoints.]
] <lem:smooth-tamers>

#proof[
  A fixed tamer for $J_(t_0)$ remains a tamer on a parameter neighborhood of $t_0$, by openness and compactness of $X$. Choose finitely many such neighborhoods and corresponding fixed representatives. Near $0$ and $1$ use the prescribed representatives. Choose a subordinate smooth nonnegative partition of unity in the parameter, with the endpoint representative having weight one sufficiently near its endpoint. Their weighted sum is closed on $X$ and represents $H$, because all coefficients depend only on $t$ and sum to one. It tames $J_t$ by convexity of the taming cone. ◻
]

#prodef([Lemma 9.5.])[
  #emph[Suppose $\( A_t \, C_t \)$ is a smooth compact path of definite closed pairs with the original two periods. Suppose the fibers of $p$ remain common Lagrangians with the original complex orientation, and the pair equals $\( A_0 \, C_0 \)$ on smaller nodal neighborhoods. Then the class $\[ B_0 \]$ contains a taming form for the associated almost complex structure at every parameter. If the initial pair is $\( A_0 \, C_0 \)$, these representatives can be chosen smoothly starting at $B_0$; an endpoint representative can also be prescribed whenever it tames the endpoint structure.]
] <lem:regular-tamer-path>

#proof[
  Let $J_t$ be the structures defined by the pair, with the continued sign. First produce a convenient taming class. On the regular region, $J_t$ preserves the vertical tangent planes and induces an oriented complex structure on each quotient $T_x X \/ ker upright(d) p_x$. This quotient structure need not be independent of the point in the fiber. Nevertheless the positive base form satisfies
  $ p^(*) nu_S \( zeta \, J_t zeta \) > 0 quad upright("whenever ") upright(d) p \( zeta \) eq.not 0 \, $
  and it vanishes on vertical vectors. The restriction of $B_0$ to the oriented vertical planes stays positive.
  On a compact regular region containing the supports of the pair changes, use a smooth splitting $zeta = v + h$ into vertical and horizontal vectors and any fixed background norm. Compactness in space and parameter gives positive constants $a \, b$ and a finite $M$ such that
  $ B_0 \( zeta \, J_t zeta \) & gt.eq a \| v \|^2 - M \| v \| \| h \| - M \| h \|^2 gt.eq a / 2 \| v \|^2 - M' \| h \|^2 \,\
p^(*) nu_S \( zeta \, J_t zeta \) & gt.eq b \| h \|^2 . $
  Thus $B_0 + K p^(*) nu_S$ tames for one sufficiently large $K > 0$. On the unchanged nodal neighborhoods, $B_0$ already tames and $p^(*) nu_S$ is semipositive. Indeed, the model matching in 43 chooses its complex structure with the sign tamed by $B_0$, and its projection is holomorphic for that sign. The same $K$ therefore works on all of $X$ and at every parameter.
  Put $H_K = \[ B_0 \] + K F$ and $V = \[ A_0 \]^perp ∩ \[ C_0 \]^perp$. By (9.1), $H_K$ is the class just constructed. It belongs to $V$, and
  $ H_K^2 = 1 + 2 K \[ B_0 \] F > 0 \, #h(2em) H_K \[ B_0 \] = 1 + K \[ B_0 \] F > 0 . $
  Consequently $H_K$ and $\[ B_0 \]$ lie in the same timelike component of $V$. To apply 18, let $d$ be the class, identified with its Poincaré dual, of a nonconstant irreducible $J_t$-curve. It has $H_K d > 0$. By 36, either $F d eq.not 0$ and its sign is the sign of the coefficient $c$ in $d^(+) = c F^(+)$, or $d = c F$. Also $\[ B_0 \] d = c \[ B_0 \] F$, with $\[ B_0 \] F > 0$. If $\[ B_0 \] d$ were nonpositive, the alternatives would give $c < 0$ and $F d lt.eq 0$, so $H_K d = \[ B_0 \] d + K F d < 0$, a contradiction. Thus every such curve pairs positively with $\[ B_0 \]$. The hypotheses of 18 hold with the already tamed class $H_K$, and that theorem supplies a tamer in $\[ B_0 \]$.
  When the initial pair is $\( A_0 \, C_0 \)$, apply 50 to the family $J_t$ and the fixed class $\[ B_0 \]$, using $B_0$ at the initial endpoint and any prescribed endpoint tamer. This gives the asserted smooth representatives. By 5, their triples with $\( A_t \, C_t \)$ are positive. ◻
]

=== 9.3 Construction of the prepared pair <construction-of-the-prepared-pair>

We have established that averaging and basic additions preserve the definite pair, and that the original third class remains available along the resulting paths. It remains to arrange the two orthogonality equations for the unit-fiber-area form without changing the nodal data.

#proof[
  We first average the pair and construct a closed invariant form of unit fiber area. We then adjust its two total pairings so that exact basic changes of the pair can impose pointwise orthogonality. Throughout, disks may be replaced by smaller nested disks, with closures inside the original model disks.
  #emph[Averaging the second form.] On $X^compose$ set $overline(C) = "Av" C_0$. It is closed and equals $C_0$ on every model disk, so it extends smoothly over $X$. The difference $overline(C) - C_0$ is supported over a compact subset of $S^compose$ and is exact on $X$ by 48. The path
  $ \( A_0 \, \( 1 - t \) C_0 + t overline(C) \) $
  is a definite pair path by 49, with the same periods and the same oriented fiber planes. It admits a completion in $\[ B_0 \]$ by 51. For the remaining construction write $A = A_0$ and $C = overline(C)$. Both are invariant.
  #emph[A closed form of unit fiber area.] The positive number $q_0 = \[ B_0 \] F$ is the common integral of $B_0$ over the regular fibers. Start with
  $ Psi^(\( 0 \)) = "Av" \( B_0 \/ q_0 \) quad upright("on ") X^compose . $
  This is closed and invariant, and its restriction to every fiber is the invariant two-form of integral one.
  We next make it equal to $upright(d) a and upright(d) b$ near every puncture. On a punctured model disk, the two real two-homology generators are the fiber and the torus obtained by sweeping the invariant $a$-cycle around a base circle at $b = 0$. One can see this from the homology sequence for a torus mapping torus: the monodromy is one shear, so the fiber contributes one generator and the invariant part of its first homology contributes one more. The second generator bounds a three-chain in the full nodal neighborhood, as described in 44. The smooth closed form $B_0 \/ q_0$ consequently has periods $1$ and $0$ on these generators. Averaging does not change them, by 48. The form $upright(d) a and upright(d) b$ has the same periods: its fiber integral is one, and its restriction to the sweep at $b = 0$ is zero. It is a well-defined closed form under the shear transition of the angular coordinates.
  It follows that $Psi^(\( 0 \)) - upright(d) a and upright(d) b = upright(d) beta_j$ on the punctured neighborhood. Replace $beta_j$ by its average, so it is invariant. Choose a basic cutoff $chi_j$ that is one on a smaller punctured disk and zero near the outer boundary, and replace $Psi^(\( 0 \))$ there by
  $ Psi^(\( 0 \)) - upright(d) #scale(x: 120%, y: 120%)[\(] \( p^(*) chi_j \) beta_j #scale(x: 120%, y: 120%)[\)] . $
  These disjoint modifications give a smooth closed invariant form $Psi^(\( 1 \))$ on $X^compose$, equal to $upright(d) a and upright(d) b$ near the punctures. Its fiber restriction is unchanged: the two invariant forms being compared already have the same restriction of integral one, and a differential of a basic cutoff has zero vertical restriction.
  #emph[The obstruction to an exact orthogonality correction.] The form $Psi^(\( 1 \))$ has the required fiber restriction and nodal behavior. It remains to arrange orthogonality to the pair while preserving the pair’s cohomology classes. Invariance reduces these pointwise equations to a calculation on the base.
  Let $Phi$ be an invariant two-form on $X^compose$ whose restriction to each fiber has integral one. For any invariant four-form $Xi$, we have the pointwise identity
  #[#set math.equation(numbering: n => "(9.7)")
   $ Phi and p^(*) \( p_(*) Xi \) = Xi . $ <eq:regular-invariant-top-form>]
  Indeed, only the vertical restriction of $Phi$ contributes to its wedge with a basic two-form. Invariant top forms have constant vertical density on each fiber and are therefore determined by their fiber integral; both sides of (9.7) have the same integral on every fiber after fixing two base tangent vectors.
  In particular, replacing $A$ by $A - p^(*) p_(*) \( Phi and A \)$ makes it orthogonal to $Phi$, and the same holds for $C$. On the closed oriented surface $S$, a smooth two-form is exact precisely when its integral is zero. We therefore first adjust $Psi^(\( 1 \))$ so that both resulting base two-forms have zero integral. Their vanishing near the punctures will allow us to regard them as smooth forms on all of $S$.
  #emph[Removing the two total pairings.] There are smooth closed invariant forms $tilde(A) \, tilde(C)$ on $X$, representing $\[ A \] \, \[ C \]$, supported over a compact subset of $S^compose$, and vanishing on vertical planes. To construct them, observe that a full one-node neighborhood has the homotopy type of a torus with its primitive vanishing cycle collapsed; its real second homology is generated by the fiber. Hence $A \, C$ are exact there, since their fiber integrals vanish. Subtract differentials of local primitives multiplied by basic cutoffs equal to one near the nodal fiber. This gives global cohomologous forms that vanish on smaller model neighborhoods. Their restrictions to vertical planes remain zero, because both the original forms and the differentials of the cutoffs have that property in the required restriction. Averaging these forms, and extending by zero near the nodes, gives $tilde(A) \, tilde(C)$. Their cohomology classes are unchanged by 48.
  On a punctured model disk, $Sigma_j = h_j upright(d) s and \( upright(d) a + tau upright(d) b \)$: the term $b tau' \( s \) upright(d) s$ in $upright(d) z$ disappears after wedging with $upright(d) s$. Thus $A \, C$ have only mixed base–fiber terms there, and
  $ \( upright(d) a and upright(d) b \) and A = \( upright(d) a and upright(d) b \) and C = 0 . $
  Consequently the integrals
  $ I_A = integral_(X^compose) Psi^(\( 1 \)) and A \, #h(2em) I_C = integral_(X^compose) Psi^(\( 1 \)) and C $
  are well-defined: their integrands vanish over smaller punctured disks. The matrix of pairings of $tilde(A) \, tilde(C)$ with $A \, C$ is their cohomology Gram matrix, hence the identity under our normalization. Set
  #[#set math.equation(numbering: n => "(9.8)")
   $ Psi = Psi^(\( 1 \)) - I_A tilde(A) - I_C tilde(C) . $ <eq:regular-psi-class-correction>]
  The form $Psi$ remains closed, invariant, of unit fiber area, and equal to $upright(d) a and upright(d) b$ near the punctures. By construction,
  #[#set math.equation(numbering: n => "(9.9)")
   $ integral_(X^compose) Psi and A = integral_(X^compose) Psi and C = 0 . $ <eq:regular-zero-total-pairings>]
  Without the normalization one would solve the same two equations using the positive invertible period Gram matrix.
  #emph[Removing the pointwise pairings.] Fiber integration of the invariant four-forms gives base two-forms
  $ zeta_A = p_(*) \( Psi and A \) \, #h(2em) zeta_C = p_(*) \( Psi and C \) . $
  They vanish near the punctures and so extend by zero to smooth forms on $S$. Their integrals are zero by (9.9). Since $S$ is a closed connected oriented surface, there are smooth one-forms $kappa_A \, kappa_C$ on $S$ with $zeta_A = upright(d) kappa_A$ and $zeta_C = upright(d) kappa_C$.
  Now make the simultaneous basic deformation
  #[#set math.equation(numbering: n => "(9.10)")
   $ A'_t = A - t p^(*) zeta_A \, #h(2em) C'_t = C - t p^(*) zeta_C \, #h(2em) 0 lt.eq t lt.eq 1 . $ <eq:regular-final-basic-path>]
  Both changes are globally exact, since the primitives are the smooth pullbacks of $kappa_A \, kappa_C$. The changed forms are invariant, have zero vertical restriction, and agree with the original pair on smaller model neighborhoods. Their wedge-product matrix is unchanged by 49, so the path remains definite. (9.7) shows that its endpoint satisfies
  $ Psi and A'_1 = Psi and C'_1 = 0 . $
  Moreover, contraction of a basic two-form with a vertical vector is zero. Hence the vertical Hamiltonian fields of base functions for $A'_t$ are the same as those for $A$, and their period lattice and torus translations are unchanged.
  Finally concatenate the two pair paths, making their parameters flat at the join. They preserve the original pair periods, oriented fibers, and smaller nodal models. 51 gives a smooth completion by forms in $\[ B_0 \]$, with initial value $B_0$. This proves all the assertions. We henceforth denote the endpoint pair again by $A \, C$ and its chosen third form by $B$. ◻
]

== 10 An auxiliary prescribed-volume solution <sec:auxiliary-volume>

We retain the fibration and prepared forms supplied by 47. Thus the closed definite pair $\( A \, C \)$ has the original periods, both forms vanish on the fibers, and on the regular locus they are invariant under the fiber torus translations. The closed invariant form $Psi$ has fiber integral one and satisfies

#[#set math.equation(numbering: n => "(10.1)")
 $ Psi and A = Psi and C = 0 . $ <eq:auxiliary-prepared-orthogonality>]

Near each punctured nodal fiber it is the form $upright(d) a and upright(d) b$ of 44. All the model disks, smaller disks, and annuli in this section are fixed before the parameter $epsilon$ is chosen. We write $F$ for the Poincaré dual of an oriented fiber and

$ V = \[ A \]^perp ∩ \[ C \]^perp . $

In particular $F in V$, $F^2 = 0$, and $\[ B \] F > 0$.

#prodef([Theorem 10.1.])[
  (Auxiliary volume equation).  #emph[For every sufficiently small $epsilon > 0$ there is a smooth closed real two-form $D_epsilon$ such that 
#[#set math.equation(numbering: n => "(10.2)")
 $ A and D_epsilon = C and D_epsilon = 0 \, #h(2em) D_epsilon^2 = A^2 \, $ <eq:auxiliary-exact-equations>]

 and $\( A \, C \, D_epsilon \)$ is a positive triple. Its sign agrees with positive area on the oriented fibers. The construction uses an auxiliary cohomology class, whose relation to the required class $\[ B \]$ is stated in 53.]
] <thm:auxiliary-solution>

The form $D_epsilon$ supplies a known taming class for the later pair deformation. To recover the original third class, we need the following comparison, with one choice of $epsilon$ valid for every curve that may appear along that deformation.

#prodef([Proposition 10.2.])[
  (Class and chamber of the auxiliary form).  #emph[Fix a norm on the finite-dimensional space $V$. The forms of 52 can be chosen so that 
#[#set math.equation(numbering: n => "(10.3)")
 $ \[ D_epsilon \] & = lambda_epsilon F + epsilon u_epsilon \, #h(2em) u_epsilon in V \,\
parallel u_epsilon parallel & lt.eq K \, #h(2em) u_epsilon F gt.eq a_0 > 0 \,\
c_0 epsilon^(- 1) & lt.eq lambda_epsilon lt.eq c_1 epsilon^(- 1) \, $ <eq:auxiliary-class-expansion>]

 for fixed positive constants and all sufficiently small $epsilon$. Moreover $\[ D_epsilon \]$ and $\[ B \]$ belong to the same component of the positive cone of $V$.]
  #emph[There is a single sufficiently small choice of $epsilon$ with the following property. For every definite closed pair with periods $\[ A \] \, \[ C \]$, with either associated almost-complex sign, and every irreducible closed curve for that structure with class $d in H^2 \( X \; bb(Z) \) \/ upright("torsion")$, 
#[#set math.equation(numbering: n => "(10.4)")
 $ \[ D_epsilon \] d > 0 quad arrow.r.double quad \[ B \] d > 0 . $ <eq:auxiliary-uniform-transfer>]

 The choice depends only on the prepared construction and its period data, and is independent of the later pair or curve.]
] <prop:auxiliary-class>

We first glue an invariant solution on the regular region to the exact nodal models and impose three cohomological moments. The remaining errors are exponential in $epsilon^(- 1)$, whereas the inverse and multiplication estimates needed to correct them have only polynomial losses. This balance between exponential gluing error and polynomial analytic loss follows the collapsing strategy of Gross–Wilson #cite(label("GrossWilson2000")) Sections 4–5. Here the correction is an exact two-form: a global complex structure, needed for a scalar complex Monge–Ampère equation, is not yet available. The final subsection proves 53 by computing $\[ D_epsilon \]$ from the prepared fibration and excluding all curve classes with negative fiber pairing at once.

=== 10.1 The invariant solution and its gluing <the-invariant-solution-and-its-gluing>

On the regular part define

#[#set math.equation(numbering: n => "(10.5)")
 $ beta_epsilon & = frac(1, 2 epsilon) p_(*) \( A^2 \) - epsilon / 2 p_(*) \( Psi^2 \) \,\
D_epsilon^(upright("sf")) & = epsilon Psi + p^(*) beta_epsilon . $ <eq:auxiliary-semiflat>]

Here $p_(*)$ is integration along the oriented torus fibers. Every two-form on the two-dimensional base is closed, so $D_epsilon^(upright("sf"))$ is closed. Since $A$ and $C$ have zero vertical restriction, their products with a basic two-form vanish. Thus (10.1) gives

$ D_epsilon^(upright("sf")) and A = D_epsilon^(upright("sf")) and C = 0 . $

For any invariant top form $zeta$ on the regular part,

#[#set math.equation(numbering: n => "(10.6)")
 $ zeta = Psi and p^(*) \( p_(*) zeta \) . $ <eq:auxiliary-fiber-integration>]

This is the invariant fiber-integration identity (9.7) for the prepared form $Psi$. Expanding the square in (10.5) and using (10.6), we obtain

#[#set math.equation(numbering: n => "(10.7)")
 $ \( D_epsilon^(upright("sf")) \)^2 & = epsilon^2 Psi^2 + 2 epsilon Psi and p^(*) beta_epsilon\
 & = epsilon^2 Psi^2 + Psi and p^(*) #scale(x: 120%, y: 120%)[\(] p_(*) \( A^2 \) - epsilon^2 p_(*) \( Psi^2 \) #scale(x: 120%, y: 120%)[\)] = A^2 . $ <eq:auxiliary-semiflat-square>]

The resulting triple is positive, and the sign of its third form is specified by its vertical restriction, which has integral $epsilon > 0$.

In a nodal disk with holomorphic volume form $Sigma = h thin upright(d) s and upright(d) z$, the prepared data are

$ A = "Re" Sigma \, #h(2em) C = x_0 "Re" Sigma + y_0 "Im" Sigma \, #h(2em) y_0 eq.not 0 \, $

with $x_0 \, y_0$ constant. On its regular part $Psi = upright(d) a and upright(d) b$, so $Psi^2 = 0$. Consequently (10.5) is precisely

#[#set math.equation(numbering: n => "(10.8)")
 $ epsilon thin upright(d) a and upright(d) b + frac(\| h \|^2, epsilon) "Im" tau \( s \) thin upright(d) x_1 and upright(d) x_2 \, #h(2em) s = x_1 + i x_2 . $ <eq:auxiliary-model-semiflat>]

The form $D_epsilon^(upright("loc"))$ of 44 has the same two periods on a regular annular torus bundle and differs from (10.8) exponentially in every fixed finite number of derivatives.

Here is an explicit bounded primitive construction for this gluing. After choosing a radial trivialization, a fixed annular bundle is $M times \[ r_0 \, r_1 \]$, where $M$ is its compact three-dimensional mapping torus. If $zeta$ is an exact closed two-form on this annulus, radial homotopy gives

$ zeta = pi_M^(*) \( zeta \|_(M times { r_(*) }) \) + upright(d) K zeta \, #h(2em) K zeta \( r \) = integral_(r_(*))^r iota_(partial_r) zeta \( u \) thin upright(d) u . $

The restriction at $r_(*)$ is exact. For a fixed metric on $M$, let $G_M$ be the Green operator on the complement of harmonic forms. Then $upright(d)_M^(*) G_M \( zeta \|_(r_(*)) \)$ is a primitive of that restriction. Adding its pullback to $K zeta$ produces a primitive on a slightly smaller annulus. Fixed-geometry elliptic estimates on $M$ and the radial integral bound its $C^j$ norm by finitely many $C^ell$ norms of $zeta$. All these operators and domains are independent of $epsilon$.

Apply this construction to $D_epsilon^(upright("loc")) - D_epsilon^(upright("sf"))$. Exactness follows from the two annular period equalities in 44. We obtain a primitive $alpha_epsilon$ with exponential finite-order bounds. For a fixed cutoff $chi$ equal to one at the inner edge and zero at the outer edge, replace $D_epsilon^(upright("sf"))$ on the annulus by

$ D_epsilon^(upright("sf")) + upright(d) \( chi alpha_epsilon \) . $

It equals $D_epsilon^(upright("loc"))$ at the inner edge and $D_epsilon^(upright("sf"))$ at the outer edge. Filling the inner disk with $D_epsilon^(upright("loc"))$ gives a smooth closed form $E_epsilon$ on $X$. The differences from the exact equations are supported on the fixed gluing annuli and have exponential finite-order bounds there. In particular the wedge Gram matrix remains positive for small $epsilon$. When there are no nodal fibers, simply take $E_epsilon = D_epsilon^(upright("sf"))$ on all of $X$.

The remaining correction will be exact. It therefore cannot change $integral_X A and D$, $integral_X C and D$, or $integral_X D^2$ for a closed form $D$. We must first impose the values required by the three target equations: zero for the first two integrals and one for the third. Set

#[#set math.equation(numbering: n => "(10.9)")
 $ a_epsilon & = integral_X E_epsilon and A \, & b_epsilon & = integral_X E_epsilon and C \,\
hat(E)_epsilon & = E_epsilon - a_epsilon A - b_epsilon C \, & q_epsilon & = integral_X hat(E)_epsilon^2 \,\
r_epsilon & = q_epsilon^(- 1 \/ 2) \, & D_epsilon^0 & = r_epsilon hat(E)_epsilon . $ <eq:auxiliary-normalization>]

The period normalization gives $integral A^2 = integral C^2 = 1$ and $integral A and C = 0$. Thus

#[#set math.equation(numbering: n => "(10.10)")
 $ integral_X A and D_epsilon^0 = integral_X C and D_epsilon^0 = 0 \, #h(2em) integral_X \( D_epsilon^0 \)^2 = 1 . $ <eq:auxiliary-exact-moments>]

The approximate equations give $a_epsilon \, b_epsilon = O \( e^(- c \/ epsilon) \)$ and $q_epsilon = 1 + O \( e^(- c \/ epsilon) \)$, after reducing $c > 0$ if necessary. Hence $q_epsilon > 0$ and $r_epsilon = 1 + O \( e^(- c \/ epsilon) \)$. Subtracting constant multiples of $A \, C$ and multiplying the third form by a positive constant do not change the pointwise three-plane spanned by the triple.

=== 10.2 Polynomial geometry and Sobolev bounds <polynomial-geometry-and-sobolev-bounds>

Let $g_epsilon$ be the metric whose self-dual three-plane is $"span" \( A \, C \, D_epsilon^0 \)$ and whose volume form is

#[#set math.equation(numbering: n => "(10.11)")
 $ nu = A^2 / 2 . $ <eq:auxiliary-fixed-volume>]

The preceding span observation allows us to use $E_epsilon$ in this definition as well. In particular $"vol"_(g_epsilon) \( X \) = 1 \/ 2$. Sobolev norms in the rest of this section are intrinsic norms for $g_epsilon$, using its covariant derivative and volume.

#prodef([Lemma 10.3.])[
  (Bounds for the approximate triple).  #emph[For every fixed nonnegative integer $k$, the following statements hold for sufficiently small $epsilon$.]
  + #emph[The metric has a finite coordinate cover whose cardinality, inverse coordinate radii, inverse interior margins, metric and inverse-metric comparisons, and coefficient derivatives through any prescribed finite order are bounded by powers of $epsilon^(- 1)$.]
  + #emph[The frame $\( A \, C \, D_epsilon^0 \)$ and the inverse of its pointwise Gram matrix have polynomial intrinsic derivative bounds through order $k$. The Gram matrix itself is uniformly positive and bounded.]
  + #emph[Sobolev embedding and multiplication at a fixed sufficiently large order have polynomial constants. In particular, for an integer $k gt.eq 6$ there are constants $C \, q$ such that 
#[#set math.equation(numbering: n => "(10.12)")
 $ parallel h and tilde(h) parallel_(H^k) lt.eq C epsilon^(- q) parallel h parallel_(H^k) parallel tilde(h) parallel_(H^k) $ <eq:auxiliary-product>]

 for two-forms $h \, tilde(h)$.]
  + #emph[The three free residuals 
#[#set math.equation(numbering: n => "(10.13)")
 $ cal(R)_epsilon = (- A and D_epsilon^0 \, thin - C and D_epsilon^0 \, thin frac(A^2 - \( D_epsilon^0 \)^2, 2)) $ <eq:auxiliary-residual>]

 satisfy, for some $C \, s \, c > 0$ depending on the chosen finite order, 
#[#set math.equation(numbering: n => "(10.14)")
 $ parallel cal(R)_epsilon parallel_(H^k) lt.eq C epsilon^(- s) e^(- c \/ epsilon) . $ <eq:auxiliary-residual-estimate>]

]
] <lem:auxiliary-geometry>

#proof[
  We first check the three types of region in the construction. On a model core, $A$ and $C$ are fixed constant linear combinations of the two parallel real components of $Sigma$, and $E_epsilon$ is the local parallel Kähler form. The model metric has volume $A^2 \/ 2$. Consequently it is exactly $g_epsilon$ there. The intrinsic charts and bounds of 44 therefore apply. This argument transports the metric, forms, and charts together through the holomorphic identification of the model disks. It requires no bound on derivatives of that identification in a separate fixed smooth atlas.
  On the complement of smaller nodal disks, use finitely many fixed regular bundle charts. The coefficients in (10.5) and all their fixed-order derivatives grow at most polynomially in $epsilon^(- 1)$. Its products with $A \, C$ vanish and its square is $A^2$. The remaining two-by-two wedge block is that of the fixed definite pair. It is uniformly positive on this compact region, and the same assertion holds on the cores because there its coefficients are fixed constants. The exponential annular gluing errors preserve these bounds on all of $X$.
  For completeness, the passage from these form bounds to metric bounds is algebraic. Normalize the frame by the positive square root of its wedge Gram matrix, obtaining $Theta_1 \, Theta_2 \, Theta_3$ with $Theta_i and Theta_j = 2 delta_(i j) nu$ and with the frame orientation chosen for a positive metric. In oriented coordinates, the identity
  #[#set math.equation(numbering: n => "(10.15)")
   $ g_epsilon \( v \, w \) nu = 1 / 6 sum_(i \, j \, ell = 1)^3 epsilon.alt_(i j ell) \( iota_v Theta_i \) and \( iota_w Theta_j \) and Theta_ell $ <eq:auxiliary-metric-algebra>]
  follows by evaluating on a standard self-dual orthonormal frame. In the fixed regular charts this gives polynomial coefficient and derivative bounds for $g_epsilon$. Its determinant in these charts is fixed by $nu$, so the adjugate formula gives polynomial bounds for the inverse metric as well. The core metric and inverse bounds were already supplied by the transported model charts. Matrix square roots and inverses have bounded derivatives on the uniformly positive Gram matrices in question. This also proves the claimed frame bounds. On the fixed annuli all comparisons remain polynomial after the exponential changes. Curvature and any fixed number of its covariant derivatives are consequently polynomially bounded.
  We spell out why local chart control gives a polynomial global cover. Shrink the charts uniformly by powers of $epsilon$ so that every point has a chart containing an intrinsic ball of radius $rho_epsilon gt.eq c_1 epsilon^(a_1)$. In that chart both the coordinate domain radius and the upper and lower metric eigenvalue bounds are controlled by powers of $epsilon$. A coordinate ball of polynomial radius lies in a fixed smaller intrinsic ball, and its volume density has a polynomial lower bound. It follows that every intrinsic ball of radius, say, $rho_epsilon \/ 8$ has volume at least $c_2 epsilon^(a_2)$, after a further common polynomial shrinkage if needed. A maximal disjoint collection of these balls has at most $\( 2 c_2 epsilon^(a_2) \)^(- 1)$ members because the total volume is $1 \/ 2$. Their enlarged balls cover $X$ and still fit in controlled charts. Coordinate cutoff functions and a normalized partition of unity have polynomial derivative bounds. Even the crude overlap bound by the number of charts is polynomial. This proves (i) with the asserted global control.
  Euclidean Sobolev estimates on this cover, followed by the polynomial coordinate and covariant-derivative comparisons, give polynomial intrinsic Sobolev constants. Since the dimension is four and $k gt.eq 6$, derivatives of order at most $floor.l k \/ 2 floor.r$ are bounded in $L^oo$ by the $H^k$ norm with such a constant. Apply the intrinsic product rule to each derivative of $h and tilde(h)$, placing the factor with fewer derivatives in $L^oo$ and the other in $L^2$. This proves (10.12).
  Before normalization the residuals vanish on the cores and outside the gluing annuli. On the annuli their fixed-coordinate derivatives are exponentially small; all conversions just described cost only powers of $epsilon^(- 1)$. The constant corrections in (10.9) introduce exponentially small coefficients multiplying forms with polynomial intrinsic bounds. The fixed total volume then gives (10.14) and proves (iv). ◻
]

=== 10.3 An inverse on exact two-forms <an-inverse-on-exact-two-forms>

The three moment equations now allow us to invert the linearized wedge equations on exact two-forms. Stokes’ theorem will control their full $L^2$ norm by their self-dual part. Estimating the exact two-form itself in this way avoids a spectral estimate for its one-form primitive in the collapsing metrics. The exact-form elliptic framework and the Stokes identity occur in Donaldson’s study of closed two-forms #cite(label("Donaldson2006")) Section 2, Proposition 1, and Section 4, Lemma 1; the estimates below track the constants through the collapsing family.

#prodef([Lemma 10.4.])[
  (Exact-form inverse).  #emph[For fixed $epsilon$, let $f = \( f_1 \, f_2 \, f_3 \)$ be top forms with $integral_X f_i = 0$. There is a unique exact two-form $h = cal(L)_epsilon f$ satisfying 
#[#set math.equation(numbering: n => "(10.16)")
 $ A and h = f_1 \, #h(2em) C and h = f_2 \, #h(2em) D_epsilon^0 and h = f_3 . $ <eq:auxiliary-linear-system>]

 For each fixed integer $k gt.eq 0$, this inverse extends to the corresponding Sobolev spaces and satisfies 
#[#set math.equation(numbering: n => "(10.17)")
 $ parallel cal(L)_epsilon f parallel_(H^k) lt.eq P_epsilon parallel f parallel_(H^k) \, #h(2em) P_epsilon lt.eq C_k epsilon^(- p_k) . $ <eq:auxiliary-inverse-bound>]

 No lower bound for the first positive eigenvalue on one-forms is required.]
] <lem:auxiliary-inverse>

#proof[
  Put $E_1 = A$, $E_2 = C$, and $E_3 = D_epsilon^0$, and let $M$ be their pointwise inner-product Gram matrix for $g_epsilon$. The equations uniquely specify the self-dual part $phi.alt = h^(+)$: if $f_i = t_i nu$, then
  #[#set math.equation(numbering: n => "(10.18)")
   $ phi.alt = sum_(j = 1)^3 \( M^(- 1) t \)_j E_j . $ <eq:auxiliary-selfdual-data>]
  Moreover
  #[#set math.equation(numbering: n => "(10.19)")
   $ chevron.l phi.alt \, E_i chevron.r_(L^2) = integral_X f_i = 0 . $ <eq:auxiliary-cokernel-moments>]
  Each $E_i$ is closed and self-dual, hence harmonic. 6 gives $b^(+) \( X \) = 3$, so these three linearly independent forms are a basis of the harmonic self-dual forms. Thus (10.19) is exactly the solvability condition for $upright(d)^(+) a = phi.alt$.
  One may see existence directly from the Hodge Green operator $G$ for $g_epsilon$ #cite(label("TaylorHodge2010")) Equations (2.1)–(2.2). Since $phi.alt$ is orthogonal to the harmonic self-dual forms and the Hodge Laplacian commutes with the star, $G phi.alt$ is self-dual and $Delta G phi.alt = phi.alt$. For a self-dual two-form $psi$, $2 \( upright(d) upright(d)^(*) psi \)^(+) = Delta psi$. Therefore
  #[#set math.equation(numbering: n => "(10.20)")
   $ h = 2 upright(d) upright(d)^(*) G phi.alt $ <eq:auxiliary-green-formula>]
  is exact and has self-dual part $phi.alt$. This formula proves existence for each fixed metric; we will not estimate the Green operator itself.
  If $h$ is exact, Stokes’ theorem gives
  #[#set math.equation(numbering: n => "(10.21)")
   $ 0 = integral_X h and h = parallel h^(+) parallel_2^2 - parallel h^(-) parallel_2^2 \, #h(2em) parallel h parallel_2 = sqrt(2) thin parallel h^(+) parallel_2 . $ <eq:auxiliary-exact-ltwo>]
  In particular an exact anti-self-dual two-form is zero, proving uniqueness. This identity is also the required $L^2$ estimate, independent of any positive spectral gap.
  For higher derivatives use
  #[#set math.equation(numbering: n => "(10.22)")
   $ upright(d) h = 0 \, #h(2em) upright(d) \( * h \) = 2 upright(d) phi.alt \, #h(2em) upright(d)^(*) h = - 2 * upright(d) phi.alt . $ <eq:auxiliary-divergence-identities>]
  The integrated Weitzenböck identity for two-forms gives
  $ parallel nabla h parallel_2^2 lt.eq 4 parallel upright(d) phi.alt parallel_2^2 + C parallel "Rm" parallel_oo parallel h parallel_2^2 . $
  To iterate, apply the same identity to the tensor-valued form $nabla^j h$. Commuting covariant differentiation with alternating derivative and divergence produces only curvature derivatives multiplied by lower derivatives of $h$. Using (10.22), this yields, for fixed $j$,
  $ parallel nabla^(j + 1) h parallel_2 lt.eq C_j parallel phi.alt parallel_(H^(j + 1)) + K_(j \, epsilon) parallel h parallel_(H^j) \, $
  where $K_(j \, epsilon)$ is a polynomial in finitely many suprema of curvature and its derivatives. Those suprema are polynomially bounded by 54. Induction starting with (10.21) thus bounds $parallel h parallel_(H^k)$ by a polynomial multiple of $parallel phi.alt parallel_(H^k)$, without losing derivatives. Finally (10.18) and the frame and inverse-Gram bounds give the same estimate in terms of $f$. Smooth approximation, or the fixed-metric Green formula, gives the Sobolev version. Uniqueness is always asserted for $h$, rather than for its one-form primitive. ◻
]

=== 10.4 The nonlinear correction <the-nonlinear-correction>

#proof[
  Fix once and for all an integer $k gt.eq 6$. Every constant and exponent in the following argument uses only finitely many derivatives at this order. Let $cal(E)_epsilon^k$ be the closed subspace of $H^k$ two-forms consisting of exact forms. Equivalently, its elements are distributionally closed and have zero harmonic projection; they possess $H^(k + 1)$ primitives for this fixed metric.
  Writing $D_epsilon = D_epsilon^0 + h$, the desired equations become the fixed-point equation
  #[#set math.equation(numbering: n => "(10.23)")
   $ h = cal(T)_epsilon \( h \) := cal(L)_epsilon (- A and D_epsilon^0 \, thin - C and D_epsilon^0 \, thin frac(A^2 - \( D_epsilon^0 \)^2 - h and h, 2)) . $ <eq:auxiliary-contraction-map>]
  This map is defined on all of $cal(E)_epsilon^k$. Indeed, the first two data have integral zero by (10.10), as does the free term in the third slot. For each exact iterate, including Sobolev iterates, $integral_X h and h = 0$ by approximation and Stokes’ theorem. Thus every iteration satisfies precisely the three mean conditions of 55.
  Let $delta_epsilon = parallel cal(R)_epsilon parallel_(H^k)$, let $P_epsilon$ be an inverse bound from (10.17), and let $Q_epsilon$ be a multiplication bound from (10.12). Increasing them if necessary, write
  #[#set math.equation(numbering: n => "(10.24)")
   $ P_epsilon lt.eq C epsilon^(- p) \, #h(2em) Q_epsilon lt.eq C epsilon^(- q) \, #h(2em) delta_epsilon lt.eq C epsilon^(- s) e^(- c \/ epsilon) . $ <eq:auxiliary-polynomial-losses>]
  On the ball of radius $R_epsilon = 2 P_epsilon delta_epsilon$ in $cal(E)_epsilon^k$,
  #[#set math.equation(numbering: n => "(10.25)")
   $ parallel cal(T)_epsilon \( h \) parallel_(H^k) & lt.eq P_epsilon delta_epsilon + 1 / 2 P_epsilon Q_epsilon R_epsilon^2 \,\
parallel cal(T)_epsilon \( h \) - cal(T)_epsilon \( tilde(h) \) parallel_(H^k) & lt.eq P_epsilon Q_epsilon R_epsilon thin parallel h - tilde(h) parallel_(H^k) . $ <eq:auxiliary-ball-bound>]
  Choose $epsilon$ so small that
  #[#set math.equation(numbering: n => "(10.26)")
   $ 2 P_epsilon^2 Q_epsilon delta_epsilon < 1 / 2 . $ <eq:auxiliary-smallness>]
  This is possible because its left side is at most $C epsilon^(- \( 2 p + q + s \)) e^(- c \/ epsilon)$, which tends to zero. The ball is invariant and the Lipschitz constant is less than $1 \/ 2$. The contraction theorem gives an exact solution with
  #[#set math.equation(numbering: n => "(10.27)")
   $ parallel h parallel_(H^k) lt.eq 2 P_epsilon delta_epsilon . $ <eq:auxiliary-correction-size>]
  If the residual is zero, the same conclusion follows directly by taking $h = 0$. Polynomial losses can always be absorbed by replacing $c$ with any fixed smaller positive exponent. Thus the correction is exponentially small also in $C^0$, by the polynomial Sobolev embedding bound. The uniformly positive Gram matrix of the approximate triple stays positive, with the same choice of sign. (10.23) gives (10.2) exactly.
  We finish by proving spatial smoothness; no simultaneous estimate over infinitely many derivative orders is needed. For the now fixed $epsilon$, choose a Coulomb primitive $a in H^(k + 1)$ of $h$, so $upright(d) a = h$ and $upright(d)^(*) a = 0$. The three equations for $D_epsilon^0 + upright(d) a$, together with this gauge, form a first-order nonlinear system for the four components of $a$. At the solution the principal symbol of its linearization sends a covector-valued unknown $b$ at a nonzero covector $xi$ to the three wedge slots of $xi and b$ against $A \, C \, D_epsilon$, together with $iota_(xi^sharp) b$. If the three wedge slots vanish, $xi and b$ belongs to the negative-definite wedge-orthogonal complement of the positive three-plane. But $\( xi and b \)^2 = 0$, so $xi and b = 0$. It follows that $b$ is a multiple of $xi$, and the gauge slot then forces $b = 0$. The symbol is square, hence invertible.
  Since $k gt.eq 6$ in real dimension four, the initial Sobolev order gives $a in C^(4 \, alpha)$ and at least $C^(3 \, alpha)$ coefficients for this elliptic linearization, for some $0 < alpha < 1$. Differentiate the system in a smooth coordinate chart. The derivative of $a$ satisfies the linearized elliptic system, with right-hand side involving only smooth background derivatives and already controlled first derivatives of $a$. These coefficients and the right-hand side are $C^(3 \, alpha)$, so local first-order elliptic estimates with finitely differentiable coefficients #cite(label("TaylorNonlinearEllipticNotes")) Section 4, Theorem 4.3 give $partial a in C^(4 \, alpha)$ and hence $a in C^(5 \, alpha)$. Repeating this argument gives smoothness. All constants in this bootstrap may depend on the fixed $epsilon$. The resulting $D_epsilon$ is therefore smooth and proves the theorem. ◻
]

=== 10.5 The auxiliary class and a uniform chamber estimate <the-auxiliary-class-and-a-uniform-chamber-estimate>

We now prove 53. The prepared fibration lets us compute the class modulo $bb(R) F$. The resulting estimate will apply to every later definite pair with the same periods, even when the fibers are no longer complex lines for that pair.

#proof[
  We identify integral curve classes with their Poincaré duals. Choose disjoint closed nodal neighborhoods $N_i$ whose boundaries lie outside all gluing cutoffs, and put $U = X \\ union.big_i "int" N_i$. The restriction of $E_epsilon$ to $U$ is $D_epsilon^(upright("sf"))$. If there is at least one node, $U$ fibers over a compact surface with nonempty boundary, whose second real cohomology is zero. Thus the basic term in (10.5) is exact on $U$, and
  #[#set math.equation(numbering: n => "(10.28)")
   $ \[ D_epsilon^0 \] \|_U = r_epsilon #scale(x: 120%, y: 120%)[\(] epsilon \[ Psi \] \|_U - a_epsilon \[ A \] \|_U - b_epsilon \[ C \] \|_U #scale(x: 120%, y: 120%)[\)] . $ <eq:auxiliary-restriction-class>]
  In particular its restriction divided by $epsilon$ is bounded.
  When there is a node, the kernel of the restriction map $H^2 \( X \; bb(R) \) arrow.r H^2 \( U \; bb(R) \)$ is exactly $bb(R) F$. To verify this assertion, excision and Poincaré–Lefschetz duality identify
  $ H^2 \( X \, U \; bb(R) \) tilde.eq xor.big_i H^2 \( N_i \, partial N_i \; bb(R) \) tilde.eq xor.big_i H_2 \( N_i \; bb(R) \) . $
  A one-node neighborhood has the homotopy type of a torus with its primitive vanishing cycle killed, and its second homology is generated by the fiber. Under the map to $H^2 \( X \; bb(R) \)$ these generators give the Poincaré dual fiber classes, all equal to the nonzero class $F$. The long exact sequence of the pair gives the assertion. Hence restriction induces an injective map from $H^2 \( X \; bb(R) \) \/ bb(R) F$ onto its image. Its inverse on that finite-dimensional image is bounded. (10.28) proves that the class $\[ D_epsilon^0 \]$ modulo $bb(R) F$ is $O \( epsilon \)$.
  The nonlinear correction is exact, so $\[ D_epsilon \] = \[ D_epsilon^0 \] in V$. Choose a fixed linear complement of $bb(R) F$ in $V$ and use it to lift the quotient class divided by $epsilon$ to a bounded vector $u_epsilon$. This gives $\[ D_epsilon \] = lambda_epsilon F + epsilon u_epsilon$. Choose any regular fiber outside the gluing region. The original glued form has integral $epsilon$ there; the subtracted forms $A \, C$ have zero fiber integrals, and the correction is exact. Therefore
  #[#set math.equation(numbering: n => "(10.29)")
   $ \[ D_epsilon \] F = r_epsilon epsilon \, #h(2em) u_epsilon F = r_epsilon = 1 + O \( e^(- c \/ epsilon) \) . $ <eq:auxiliary-fiber-area>]
  The square normalization and $F^2 = 0$ now give
  #[#set math.equation(numbering: n => "(10.30)")
   $ lambda_epsilon = frac(1 - epsilon^2 u_epsilon^2, 2 epsilon \( u_epsilon F \)) . $ <eq:auxiliary-lambda>]
  Boundedness of $u_epsilon$ and (10.29) prove (10.3).
  If there are no nodal fibers, $Psi$ is defined on all of $X$ and the basic term in (10.5) is a multiple of $F$ in cohomology. The form $D_epsilon^(upright("sf"))$ already solves the equations, so one takes it for $D_epsilon$; the same conclusions follow with $u_epsilon = \[ Psi \]$, $r_epsilon = 1$, and the coefficient computed by (10.30).
  It remains to establish the uniform implication. By 36, every curve class under consideration with $\[ D_epsilon \] d > 0$ satisfies $d^2 gt.eq - 2$ and the following exhaustive alternatives: either $m = F d eq.not 0$ has the same sign as $\[ B \] d$, or $d = c F$ for a nonzero real number $c$. The latter alternative has no sign difficulty, since both $\[ D_epsilon \] F$ and $\[ B \] F$ are positive.
  Choose a null vector $G_1 in V$ with $F G_1 = 1$. Such a choice is obtained from any vector pairing to one with $F$ by subtracting half its square times $F$. The orthogonal complement of $"span" \( F \, G_1 \)$ in the Lorentzian space $V$ is negative definite. Decompose
  $ d = m G_1 + n F + z \, #h(2em) u_epsilon = alpha_epsilon G_1 + beta_epsilon F + w_epsilon \, $
  where $z \, w_epsilon$ lie in that complement, and use the Euclidean norm $\| z \|^2 = - z^2$ there. We have $alpha_epsilon = u_epsilon F gt.eq a_0$ and uniform bounds for $alpha_epsilon \, beta_epsilon \, w_epsilon$.
  Suppose that $m < 0$. Integrality of $F$ and $d$ means $m = - a$ for an integer $a gt.eq 1$. The square bound gives
  #[#set math.equation(numbering: n => "(10.31)")
   $ - 2 a n - \| z \|^2 = d^2 gt.eq - 2 \, #h(2em) n lt.eq frac(2 - \| z \|^2, 2 a) . $ <eq:auxiliary-negative-intersection>]
  Complete the square in the negative-definite component:
  #[#set math.equation(numbering: n => "(10.32)")
   $ u_epsilon d & lt.eq alpha_epsilon / a - frac(alpha_epsilon \| z \|^2, 2 a) + \| w_epsilon \| \| z \| + \| beta_epsilon \| a\
 & lt.eq alpha_epsilon / a + a (frac(\| w_epsilon \|^2, 2 alpha_epsilon) + \| beta_epsilon \|) lt.eq K a . $ <eq:auxiliary-completed-square>]
  The constant $K$ is independent of $a \, z \, d$, and of the future almost-complex structure. It follows that
  #[#set math.equation(numbering: n => "(10.33)")
   $ \[ D_epsilon \] d = - lambda_epsilon a + epsilon u_epsilon d lt.eq a (- c_0 / epsilon + K epsilon) < 0 $ <eq:auxiliary-chamber-exclusion>]
  whenever $epsilon^2 < c_0 \/ K$ (with no restriction from this inequality if $K = 0$). This contradicts $\[ D_epsilon \] d > 0$ and excludes every negative integer $m$ simultaneously. The remaining alternative $m > 0$ gives $\[ B \] d > 0$, proving (10.4).
  Finally, both $\[ D_epsilon \]$ and $\[ B \]$ have positive square and pair positively with the same nonzero null vector $F$. In a Lorentzian space the two components of the positive cone are distinguished by the sign of pairing with a fixed nonzero null vector: no positive vector is orthogonal to it. Thus the two classes are in the same component. All restrictions on $epsilon$ in this proof depend only on fixed construction data and the original periods. They can therefore be imposed before choosing any later pair deformation. ◻
]

== 11 The hyperkähler endpoint <sec:endpoint>

We now use the auxiliary form $D$ to construct the endpoint while the actual triples retain the three original classes. The first Kähler step produces $C_1 in \[ C \]$; the uniform chamber estimate keeps $\[ B \]$ available along the segment from $C$ to $C_1$; and the second Kähler step produces its prescribed endpoint $B_1 in \[ B \]$. We then choose the third form smoothly along that segment with both endpoint values fixed, using 50. We first record the classical class and volume criteria used in the two Kähler steps.

#prodef([Lemma 11.1.])[
  #emph[Let $\( X \, J \)$ be a compact connected complex surface with even first Betti number. Suppose a real $\( 1 \, 1 \)$ class $H$ has $H^2 > 0$ and contains a closed form $beta$ taming $J$. Then $H$ is a Kähler class. If $nu$ is a smooth positive four-form with $integral_X nu = H^2$, there is a Kähler form $beta_1 in H$ with $beta_1^2 = nu$.]
] <lem:endpoint-kahler-class>

#proof[
  The compact-surface Kähler criterion gives a Kähler form $kappa$ because $b_1$ is even #cite(label("Buchdahl1999")) Theorem 11; see also #cite(label("Lamari1999")) Corollaire 5.7. Taming gives
  $ H dot.op \[ D \] > 0 quad upright("for every nonzero effective curve ") D \, #h(2em) H dot.op \[ kappa \] > 0 . $
  For the second inequality, pointwise $beta kappa = beta^(1 \, 1) kappa > 0$, since the invariant part of a tamer is positive definite. Together with $H^2 > 0$, these inequalities are the numerical Kähler-class criterion on a surface #cite(label("Buchdahl1999")) Corollary 15. Equivalently, the segment from $\[ kappa \]$ to $H$ has positive square and remains positive on every curve, so the component condition in the numerical characterization of the Kähler cone is satisfied #cite(label("DemaillyPaun2004")) Theorem 0.1.
  Choose a Kähler representative $kappa_H in H$ and set $f = log \( nu \/ kappa_H^2 \)$. The volume hypothesis says $integral_X e^f kappa_H^2 = integral_X kappa_H^2$. Yau’s theorem produces a smooth cohomologous Kähler form $beta_1$ with $beta_1^2 = e^f kappa_H^2 = nu$ #cite(label("Yau1978")) Section 4, Theorem 1. ◻
]

#prodef([Lemma 11.2.])[
  #emph[Let $X$ be a compact connected Kähler surface with a nowhere-zero holomorphic two-form $Omega$. A real degree-two class $H$ is of type $\( 1 \, 1 \)$ if and only if it is intersection-orthogonal to $\[ Re Omega \]$ and $\[ Im Omega \]$.]
] <lem:endpoint-hodge-type>

#proof[
  Every holomorphic two-form is $f Omega$ for a global holomorphic function $f$, hence is a constant multiple of $Omega$. Thus $H^(2 \, 0) \( X \) = bb(C) \[ Omega \]$. The real plane generated by its real and imaginary parts is nondegenerate and positive for the intersection form: their squares are equal and positive and their mixed product vanishes. Hodge decomposition and type considerations make its orthogonal complement exactly $H^(1 \, 1) \( X \; bb(R) \)$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Prepared triple#linebreak()$A,C,B$]]])])
  content((4.65, 0), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Moving triple#linebreak()$A,C_t,B_t$]]])])
  content((9.3, 0), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hyperkähler triple#linebreak()$A,C_1,B_1$]]])])
  line((1.851, 0), (2.799, 0), stroke: (paint: rgb("#000080"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000080"))))
  content((2.325, 0.7056), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$C_t in [C]$#linebreak()$B_t in [B]$]]])], anchor: "south")
  line((6.501, 0), (7.449, 0), stroke: (paint: rgb("#000080"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000080"))))
  content((6.975, 0.7056), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[prescribed#linebreak()endpoint]]])], anchor: "south")
  content((4.65, -2.25), [#box(width: 4.453cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#002d00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7fbf7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Auxiliary closed form $D$#linebreak()$"AD"="CD"=0$, $D^2=A^2$]]])])
  line((0, -0.525), (0, -2.25), (2.424, -2.25), stroke: (paint: rgb("#002d00"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#002d00"))))
  content((1.212, -2.25), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[small fiber area]]])], anchor: "north")
  line((4.65, -1.725), (4.65, -0.525), stroke: (paint: rgb("#002d00"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#002d00"))))
  content((4.65, -1.125), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[Kähler step for $A plus.minus "iD"$#linebreak()in $[C]$; taming criterion for $[B]$]]])], anchor: "west")
  line((6.876, -2.25), (9.3, -2.25), (9.3, -0.525), stroke: (paint: rgb("#002d00"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#002d00"))))
  content((9.3, -1.387), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[using $C_1$ and#linebreak()a tamer in $[B]$:#linebreak()Kähler step for#linebreak()$A plus.minus "iC"_1$]]])], anchor: "west")
})],
  caption: [Figure 1: The final deformation. Solid arrows trace the deformation; dashed arrows indicate auxiliary dependencies. The upper row consists of actual triples in the original classes. The auxiliary form supplies the first integrable pair and the numerical control that keeps $\[ B \]$ available along the moving pair. After both Kähler steps, the tamers $B_t$ are chosen with initial value $B$ and final value $B_1$. ],
) <fig:endpoint-path>

#proof[
  We trace the actual form paths and then construct the endpoint; 1 summarizes the final stages. All coefficient changes below are constant orthogonal changes, and will be undone at the end.
  ===== 11.1 #emph[The prepared pair.] <the-prepared-pair.>
  Choose the primitive null class $F$ of 35 and rotate the coefficient basis so that $\[ B \]$ points in the direction of $F^(+)$ and the pair $\[ A \] \, \[ C \]$ spans its orthogonal plane in $P$. The rotated initial triple is denoted $\( A \, C \, B \)$; its cohomology Gram matrix is still the identity.
  The families result and Proposition 6.3, Theorem 7.1 give an exact pair deformation to a torus fibration with the stated standard nodal neighborhoods, keeping $B$ fixed. 47 then gives a further path of positive closed triples to invariant regular data with the auxiliary form $Psi$. Both stages preserve the three individual classes and start at the actual representatives supplied by the preceding stage. Retain the notation $\( A \, C \, B \)$ for the resulting triple. In particular
  #[#set math.equation(numbering: n => "(11.1)")
   $ \[ A \]^2 = \[ C \]^2 = \[ B \]^2 = 1 \, #h(2em) \[ A \] \[ C \] = \[ A \] \[ B \] = \[ C \] \[ B \] = 0 . $ <eq:endpoint-periods>]
  ===== 11.2 #emph[The auxiliary solution.] <the-auxiliary-solution.>
  Fix a sufficiently small $epsilon.alt > 0$ for Theorem 10.1, Proposition 10.2, and set $D = D_epsilon.alt$. The form $D$ is closed and smooth and satisfies
  #[#set math.equation(numbering: n => "(11.2)")
   $ A D = C D = 0 \, #h(2em) D^2 = A^2 > 0 . $ <eq:endpoint-auxiliary>]
  The triple with forms $A \, C \, D$ is positive. The same choice of $epsilon.alt$ gives the numerical conclusion of 53 for every later definite pair with the classes $\[ A \] \, \[ C \]$. These choices precede the Kähler constructions that follow.
  ===== 11.3 #emph[The first Kähler step.] <the-first-kähler-step.>
  By 8, $A plus.minus i D$ is a nowhere-zero holomorphic two-form for an integrable complex structure $I$; choose the sign so that $C$ tames $I$. This is possible by 5 and positivity of $\( A \, D \, C \)$. 6 gives even $b_1$, so the surface is Kähler. The period relations (11.1) and (11.2) give $\[ C \] \[ A \] = \[ C \] \[ D \] = 0$. Therefore 57 puts $\[ C \]$ in real type $\( 1 \, 1 \)$.
  Apply 56 with $H = \[ C \]$ and $nu = A^2$. Its integral condition holds by (11.1). We obtain a Kähler representative $C_1 in \[ C \]$ satisfying
  #[#set math.equation(numbering: n => "(11.3)")
   $ A C_1 = D C_1 = 0 \, #h(2em) C_1^2 = A^2 . $ <eq:endpoint-first-yau>]
  Let $C_t = \( 1 - t \) C + t C_1$. Both endpoints tame $I$, so the entire segment does. Thus $\( A \, D \, C_t \)$ is positive, and $\( A \, C_t \)$ is a definite pair in the original pair classes. Moreover $D$ tames its associated almost-complex structure with the continuously chosen sign. Indeed $D$ is wedge-orthogonal to both pair forms by (11.2) and (11.3), and has positive square.
  ===== 11.4 #emph[Keeping the third class.] <keeping-the-third-class.>
  Let $J_t$ now denote the structure associated with the moving pair $\( A \, C_t \)$ and tamed by $D$. For every irreducible $J_t$ curve, its class $d$ has $\[ D \] d > 0$. 53 implies $\[ B \] d > 0$, and places $\[ B \]$ and $\[ D \]$ in the same open timelike cone of the fixed space $V$ from (2.3). The hypotheses of 18 therefore hold with $U = \[ D \]$ and $H = \[ B \]$. Thus $\[ B \]$ contains a tamer for every $J_t$.
  At $t = 0$ this sign of $J_t$ agrees with the sign previously tamed by the actual third form $B$. To check this pointwise, take a regular fiber with its prepared orientation. Both $B$ and $D$ restrict positively to its tangent planes, which are complex lines for the prepared pair. They therefore select the same sign there. On the connected manifold $X$ this choice of sign cannot jump, so $B$ tames $J_0$ everywhere. We will choose the family of tamers after fixing its final representative in the next step.
  ===== 11.5 #emph[The second Kähler step.] <the-second-kähler-step.>
  The final pair $\( A \, C_1 \)$ is orthogonal with equal square by (11.3). Thus the structure $J_1$ already selected by $D$ is integrable, with holomorphic volume form $A plus.minus i C_1$ for the corresponding sign. The preceding step supplies a representative of $\[ B \]$ taming this same $J_1$. Even $b_1$ gives Kählerness again, and (11.1) together with 57 puts $\[ B \]$ in type $\( 1 \, 1 \)$. Apply 56 with $H = \[ B \]$ and $nu = A^2$. This yields a Kähler representative $B_1 in \[ B \]$ such that
  #[#set math.equation(numbering: n => "(11.4)")
   $ A B_1 = C_1 B_1 = 0 \, #h(2em) B_1^2 = A^2 = C_1^2 . $ <eq:endpoint-final-identities>]
  Now apply 50 to the family $J_t$, prescribing the actual prepared form $B$ at $t = 0$ and the newly constructed $B_1$ at $t = 1$. It gives closed tamers $B_t in \[ B \]$ with these two endpoint values. Thus $\( A \, C_t \, B_t \)$ is a path of positive closed triples in the original classes, joining the prepared triple to $\( A \, C_1 \, B_1 \)$ itself.
  Concatenate the finitely many triple paths, reparametrizing each to be constant to all orders at its endpoints. This produces a smooth path on $\[ 0 \, 1 \]$. Each component is closed and remains in its original class, and positivity holds at every parameter. By (11.3) and (11.4), if $\( eta_1 \, eta_2 \, eta_3 \) = \( A \, C_1 \, B_1 \)$ and $mu_1 = A^2 \/ 2$, then
  $ eta_i and eta_j = 2 delta_(i j) mu_1 . $
  By 8, these forms are parallel and self-dual for a hyperkähler metric with volume $mu_1$. Finally undo the initial orthogonal change of coefficients. Orthogonality preserves the displayed identity and restores the original ordered classes, proving the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
