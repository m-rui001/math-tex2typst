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

#align(center)[#text(size: 16pt, weight: "bold")[The Stable Hurewicz Image of the Sphere at Two]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

For $n gt.eq 0$, let $Q S^n = "colim"_r Omega^r S^(n + r)$, and let $Q_0 S^0$ be its basepoint component. For $d > 0$, the identification $pi_d \( Q_0 S^0 \) = pi_d^S$ gives the mod-2 Hurewicz homomorphism

$ h_d : pi_d^S arrow.r H_d \( Q_0 S^0 \; bb(F)_2 \) . $

It sends a representative $S^d arrow.r Q_0 S^0$ to the image of the mod-2 fundamental class. Curtis’s conjecture describes the positive-degree image of these maps #cite(label("Curtis1975")). The target has an explicit homology algebra, while the stable homotopy groups in the source contain many families whose images are difficult to determine. The image problem asks which of the readily described homology classes are represented by maps from spheres.

Curtis proposed the Hopf–Kervaire description in his study of the Dyer–Lashof and lambda algebras #cite(label("Curtis1975")). May’s subsequent account records a gap found by Wellington in the proposed proof #cite(label("May1977")) p. 484, footnote 3. We prove the following form of the conjecture.

#thm([Theorem 1.1.])[
  #emph[The image of $xor.big_(d > 0) h_d$ is spanned over $bb(F)_2$ by the Hurewicz images of the Hopf-invariant-one classes $eta \, nu \, sigma$, in degrees $1 \, 3 \, 7$, and the Kervaire-invariant-one classes $theta_j$, in degrees $2^(j + 1) - 2$, $j gt.eq 1$, whenever they exist. In particular, Curtis’s conjecture is true in all positive degrees.]
] <thm:curtis>

Here Kervaire invariant one means that the corresponding framed manifold, under the Pontryagin–Thom identification, has Arf invariant one. The notation $theta_j$ is used only when such a class exists. The theorem does not posit existence in any additional degree.

Eccles’s conjecture concerns the analogous realization problem for $Q X$. In the formulation recorded in #cite(label("Zare2009Thesis")) pp. 14–15, for a path-connected CW complex $X$ of finite type, a positive-dimensional sphere map to $Q X$ with nonzero mod-2 Hurewicz image has stable adjoint detected either by homology or by a primary cohomology operation in its mapping cone. Theorem 1 gives this conclusion when $X$ is a positive-dimensional sphere.

For $n > 0$, write $e_n in H_n \( Q S^n \; bb(F)_2 \)$ for the bottom spherical class, and write $sigma_(*)^n$ for $n$-fold homology suspension from $Q_0 S^0$.

#thm([Corollary 1.2.])[
  (Eccles’s conjecture for spheres).  #emph[For every integer $n > 0$, each nonzero mod-2 spherical class in $H_(*) \( Q S^n \; bb(F)_2 \)$ is either $e_n$, or a nonzero class of the form 
$ sigma_(*)^n h_d \( alpha \) \, #h(2em) \( alpha \, d \) in { \( eta \, 1 \) \, \( nu \, 3 \) \, \( sigma \, 7 \) } . $

 Consequently Eccles’s conjecture holds for every sphere $S^n$, $n > 0$: the alternatives are the bottom stably spherical class and Hopf-invariant-one classes.]
] <cor:eccles-spheres>

#proof[
  For a spherical representative $f : S^(n + d) arrow.r Q S^n$ with $d > 0$, adjunction gives $f_0 : S^d arrow.r Q_0 S^0$, and naturality gives $h \( f \) = sigma_(*)^n h_d \( \[ f_0 \] \)$. By Theorem 1, the level-zero image is spanned by the Hopf and Kervaire images. The latter are squares killed by the first homology suspension, leaving the stated Hopf possibilities; this is the Curtis-to-Eccles sphere implication recorded in #cite(label("Zare2009Thesis")) Chapter 5, pp. 81–82. In degree $n$, $pi_n \( Q S^n \) = pi_0^S = bb(Z)$ gives the bottom image represented by the unit $S^n arrow.r Q S^n$; connectivity excludes lower degrees. ◻
]

#thm([Corollary 1.3.])[
  (Finite positive stable Hurewicz image).  #emph[The image of $xor.big_(d > 0) h_d$ is finite, and 
$ h_d = 0 #h(2em) upright("if ") d > 0 upright(" and ") d in.not { 1 \, 2 \, 3 \, 6 \, 7 \, 14 \, 30 \, 62 \, 126 } . $

 In particular, the positive stable mod-2 Hurewicz image vanishes above degree $126$.]
] <cor:finite-image>

#proof[
  Hill, Hopkins, and Ravenel prove that $theta_j$ can exist only for $j lt.eq 6$ #cite(label("HillHopkinsRavenel2016")) Theorem 1.1. By Theorem 1, the positive image is therefore spanned by the named images in Hopf degrees $1 \, 3 \, 7$ and Kervaire degrees $2 \, 6 \, 14 \, 30 \, 62 \, 126$. Finitely many generators over $bb(F)_2$ give a finite image and the stated support. ◻
]

Corollary 2 concerns only positive-dimensional spheres, not general spaces. The support in Corollary 3 is an upper bound; it does not assert nonvanishing in every listed degree or an exact dimension of the image.

Adams’s Hopf invariant one theorem identifies the Hopf cases #cite(label("Adams1960")). Browder’s work relates the framed Kervaire invariant to the classes $h_j^2$ in the mod-2 Adams spectral sequence #cite(label("Browder1969")). Hill–Hopkins–Ravenel’s nonexistence theorem leaves dimension $126$ as the last possible Kervaire dimension. In their preprint, Lin, Wang, and Xu prove existence in that dimension #cite(label("LinWangXu2025")) Theorems 1.1 and 1.4. This endpoint result is separate from the upper bound used in Corollary 3.

On the homology side, the free infinite-loop-space calculation describes a large algebra generated by Dyer–Lashof operations #cite(label("CLM1976")). A spherical class must be primitive and annihilated by positive Steenrod operations, but these necessary conditions alone do not establish its realization. The theorem concerns the image of actual stable homotopy classes.

Eccles and Zare give restrictions on spherical squares and their roots, including the exclusion of higher iterated squares #cite(label("EcclesZare2009")) Theorem 3.10 and Lemma 3.12. Section 4 proves the exclusion of fourth powers by spectrum pairings and integral characteristic classes; the conclusion itself is already present in that prior work. The Dickson-algebra approach to spherical classes also appears in Hung and Peterson’s study of the Lannes–Zarati homomorphism and products in the unstable Adams $E_2$-term #cite(label("HungPeterson1998")). Hunter’s cohomological construction of the Curtis–Wellington spectral sequence exhibits Dickson-algebra quotients in a width filtration #cite(label("Hunter2025")) arXiv version 2, Theorem 1.2.

The argument here combines classical detection by mapping-cone operations with an obstruction for the specific Steenrod modules dual to primitives. The cone of an #emph[actual] sphere map supplies a nonzero extension. A detecting functional inherited from the preceding suspension level then restricts that extension through the algebraic obstruction proved in Section 5.

The free-algebra model constructed below is compatible with Kuhn’s structured splitting and completion maps #cite(label("Kuhn2006")); we prove the required finite weight projections and their suspension compatibility directly. For the final passage from leading weight to Adams filtration, we use Kuhn’s lifting theorem #cite(label("Kuhn2018")) and the derived ideal-power constructions of #cite(label("KuhnPereira2017")).

===== 1.1 Outline of the proof. <outline-of-the-proof.>

The proof is organized around the last nonzero homology suspension of a spherical class. For a representative $f_0 : S^d arrow.r Q_0 S^0$, let $f_j : S^(d + j) arrow.r Q S^j$ be its successive adjoints and put $z_j = h \( f_j \)$. Suspension gives $z_(j + 1) = sigma_(*) z_j$, and the homology degree bounds imply that $z_j = 0$ for $j > d$. Thus a nonzero initial image has a last nonzero term $z_e$. We show that this terminal class is a square $z_e = w^2$ whose primitive, Steenrod-annihilated root still has nonzero suspension. At a positive terminal level, the preceding spherical suspension forces the root to have odd degree. At level zero, we instead exclude fourth powers using spectrum pairings and integral characteristic classes (Section 4). The mapping cone of the next adjoint then converts the square into a nonzero Steenrod-module extension (Section 3).

At positive level $n$, weight counts the inputs of an extended power. The primitives of weight $2^k$, $k gt.eq 1$, are dual to $M_k \( n \) = Sigma^n d_0^n D_k$, where $D_k$ is a binary Dickson algebra and $d_0$ is its generator of degree $2^k - 1$; the bottom summand is $M_0 \( n \) = Sigma^n bb(F)_2$. Section 2 constructs these modules, identifies the dual of homology suspension with inclusion of the next $d_0$-ideal, and supplies compatible finite weight projections at level zero. Section 5 shows that the cone extension on a nonbottom weight, when its detecting functional lifts from the preceding suspension level, is possible only for $n = k = 1$ and in a power-of-two degree. Cartier halving and an injection on even-degree Tor cycles retain the exponent-floor information needed for this restriction.

Section 6 assembles the argument. At a positive terminal level the obstruction leaves only the bottom weight, giving stable Hopf detection. At terminal level zero it forces the root to have leading weight two, so the original spherical class has leading weight four. Kuhn’s theorem bounds its Adams filtration by two, and Browder’s identification gives Kervaire detection. Additivity of the detecting invariants then gives the asserted span.

Figure 1 summarizes the two terminal cases.

#figure(
  [An actual sphere map $f_0 : S^d arrow.r Q_0 S^0$, with $h \( f_0 \) eq.not 0$ $z_j = sigma_(*)^j h \( f_0 \)$, with $e = max { j : z_j eq.not 0 }$
  $arrow.b.double$suspension kernel; the root survives by parity when $e gt.eq 1$, or exclusion of fourth powers when $e = 0$
  $z_e = w^2$, with $w$ primitive and Steenrod-annihilated, $sigma_(*) w eq.not 0$ The cone of $f_(e + 1)$ supplies a nonzero square operation.
  $arrow.b.double$the algebra obstruction with the lifted functional
  #[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$e gt.eq 1$ Only the bottom weight remains. Stable Hopf detection $d = 1 \, 3 \, 7$
], table.cell(rowspan: 1, colspan: 1)[$e = 0$ The leading weight of $z_0$ is four. Adams filtration two Kervaire detection
],
)
]],
  caption: [Figure 1: The proof follows the successive adjoints of one stable sphere class. The root $w$ need not itself be spherical: the next adjoint and its cone provide the realization information used by the Steenrod-module obstruction. ],
) <fig:proof-route>

===== 1.2 Conventions. <conventions.>

Spaces are based and of CW homotopy type; for a based space $X$, write $Q X = Omega^oo Sigma^oo X$. Homology and cohomology have coefficients in $bb(F)_2$ unless stated otherwise. Let $A$ be the mod-2 Steenrod algebra and $I = A^(> 0)$ its augmentation ideal. The dual homology action is denoted $"Sq"_(*)^i$. A homology class is $A$-annihilated if every $"Sq"_(*)^i$, $i > 0$, kills it. Equivalently, its functional on cohomology vanishes on the image of $I$. For a positive graded cohomology algebra $B$, write $Q B = B \/ B^2$ for its indecomposables.

Primitivity refers to the ordinary space diagonal, with the basepoint as coaugmentation, unless the linear coproduct is explicitly specified. Products in homology of an infinite loop space are its additive Pontryagin products, written $*$ when a distinction is needed. The block pairing introduced later is written $compose$. Homology suspension between infinite loop levels is $sigma_(*)$. We distinguish it from stable homology evaluation $H_(*) \( Omega^oo E \) arrow.r H_(*) \( E \)$, induced by the counit.

The symbol $S$ denotes the sphere spectrum. We write $D_r T = \( T^(and r) \)_(h Sigma_r)$ for an extended power and $bb(P) \( T \) = or.big_(r gt.eq 0) D_r T$ for the free commutative ring spectrum on $T$. All constructions are derived and homotopy coherent, including free algebras, pushouts, group completion, localization and parametrized families of maps. We use the usual mod-2 Dyer–Lashof operations on infinite loop spaces and commutative ring spectra #cite(label("CLM1976")) #cite(label("BMMS1986")). Whenever a module is written with a suspension shift, polynomial exponents refer to the unshifted monomial; its total degree also includes that shift.

== 2 Weights, primitives, and homology suspension <sec:weights>

Homology suspension supplies two inputs to the last nonzero-suspension argument. Its kernel identifies a terminal spherical class as a Pontryagin square. On primitive weight components, its dual identifies a detecting functional with the restriction of a functional at the preceding level. We establish these statements together with finite weight projections at level zero, where group completion requires a filtration in place of the positive-level splitting.

For a spectrum $T$, put

$ D_r T = \( T^(and r) \)_(h Sigma_r) \, #h(2em) bb(P) \( T \) = or.big_(r gt.eq 0) D_r T \, #h(2em) D_0 T = S . $

Thus $bb(P) \( T \)$ is the free commutative ring spectrum on $T$, and its $r$th summand has #emph[weight] $r$. Throughout, extended powers, free algebras, pushouts, and localizations are derived constructions. We work with their natural maps and families in the relevant homotopy coherent categories. In particular, naturality of a construction includes its action on mapping spaces, not just on homotopy classes of individual maps.

=== 2.1 A structured free-algebra model <a-structured-free-algebra-model>

Let $C \( X \)$ be the reduced free $E_oo$ monoid on a based space $X$: the basepoint of $X$ is identified with the monoid unit. The usual approximation and homology theorems identify its group completion with $Q X$ and calculate its homology by Dyer–Lashof operations #cite(label("CLM1976")) Part I, Theorems 4.1–4.2 and Corollary 4.5. We first record the structured splitting that will specify our weights, including their behavior in families.

#thm([Proposition 2.1.])[
  #emph[There is a natural equivalence of augmented commutative ring spectra 
$ Sigma_(+)^oo C \( X \) tilde.eq bb(P) \( Sigma^oo X \) . $

 The reduced suspension spectrum of $C \( X \)$, based at its unit, corresponds to the sum of the positive weights. The adjoint of projection to weight one is the canonical map 
$ C \( X \) arrow.r Q X . $

 This map is group completion and is an equivalence when $X$ is connected. In the connected case, the weight-one projection is consequently the stable counit $Sigma^oo Q X arrow.r Sigma^oo X$.]
] <prop:free-ring>

#proof[
  Let $F$ denote the free unbased commutative monoid in spaces. The reduced free monoid is the homotopy pushout
  $ C \( X \) tilde.eq F \( X \) product.co_(F \( * \)) * . $
  Indeed, mapping this pushout into a commutative monoid $Y$ gives the homotopy fibre of $"Map" \( X \, Y \) arrow.r "Map" \( * \, Y \) = Y$ over the unit. This is exactly the mapping space of based maps from $X$ to $Y$, based at its unit. The pushout therefore has the required reduced free universal property, including the basepoint homotopy.
  The functor $Sigma_(+)^oo$ is a strong symmetric monoidal left adjoint from cartesian spaces to spectra. On commutative algebra objects it is again a left adjoint, and hence preserves this pushout. Write $T = Sigma^oo X$. The basepoint section and augmentation give a natural stable splitting
  $ Sigma_(+)^oo X tilde.eq S or T . $
  Under it, the spectrum map induced by the basepoint is the inclusion of the first summand. Since the free commutative algebra functor sends a direct sum to a coproduct of algebras, the pushout after suspension is
  $ Sigma_(+)^oo C \( X \) & tilde.eq bb(P) \( S or T \) product.co_(bb(P) \( S \)) S\
 & tilde.eq #scale(x: 120%, y: 120%)[\(] bb(P) \( S \) product.co bb(P) \( T \) #scale(x: 120%, y: 120%)[\)] product.co_(bb(P) \( S \)) S tilde.eq bb(P) \( T \) . $
  Here $bb(P) \( S \) arrow.r S$ sends its generator to the ring unit. The augmentation of the resulting algebra sends $T$ to zero. Thus the positive-weight summands are precisely the augmentation fibre, or equivalently the reduced suspension spectrum at the unit. In this description the generating spectrum map is the #emph[difference] between the inclusion of $X$ and its basepoint section.
  We identify the weight-one adjoint using the algebra projection
  $ bb(P) \( T \) arrow.r S xor T \, $
  where the target is the split square-zero algebra. For any spectrum $M$, the fibre over the unit point of
  $ upright("GL")_1 \( S xor M \) arrow.r upright("GL")_1 S $
  identifies with $Omega^oo M$, via $y mapsto 1 + y$, as a grouplike commutative monoid. To see the structure as well as the underlying space, expand a multiproduct using distributivity in $\( S xor M \)^(and t)$. The term with no $M$ factors gives the base unit. The terms with one $M$ factor give the sum of the inputs. Every term with two or more $M$ factors vanishes by the square-zero structure. These formulas respect permutations and iterated products: the structure maps on the fibre are the additive sum-over-fibres maps. They therefore give the stated identification with the additive infinite loop space of $M$.
  The adjunction from the suspension ring now gives an $E_oo$ map $C \( X \) arrow.r Omega^oo T$. On the generating based space it is the usual map $X arrow.r Omega^oo Sigma^oo X$. Reduced freeness identifies it with the canonical stabilization map. Equivalently, maps from its group completion into a grouplike commutative monoid $Omega^oo E$ are based maps $X arrow.r Omega^oo E$, or spectrum maps $Sigma^oo X arrow.r E$. This identifies the group completion with $Q X$. For connected $X$, the reduced free monoid has trivial $pi_0$, so it is already grouplike and no group completion is needed. Under $C \( X \) tilde.eq Q X$, the adjoint of the weight-one projection is then the identity of $Q X$. By the suspension-spectrum adjunction this says exactly that the projection is the stable counit. ◻
]

#prodef([Remark 2.2.])[
  For connected $X$, the underlying stable decomposition is the Snaith splitting #cite(label("Snaith1974")) Theorem 1.1. The argument above also establishes the augmented commutative ring-spectrum structure and based naturality needed for multiplication and suspension below. For a free-algebra formulation of this structured splitting, see #cite(label("Kuhn2006")) Theorem 2.2 and Appendix A.
]

=== 2.2 Suspension and the linear coproduct <suspension-and-the-linear-coproduct>

#thm([Lemma 2.3.])[
  #emph[Under the splitting of Proposition 4, the stable adjoint suspension on reduced pieces is weight preserving. At weight $r$ it is the natural map 
#[#set math.equation(numbering: n => "(1)")
 $ Sigma D_r T arrow.r D_r \( Sigma T \) \, #h(2em) T = Sigma^oo X \, $ <eq:weight-suspension>]

 formed by using the same suspension coordinate in all $r$ factors. For $T = Sigma^n S$, this is the Thom spectrum map induced by the inclusion of the diagonal trivial line into the permutation representation.]
  #emph[Under group completion the map is the ordinary homology suspension $sigma_(*) : H_(*) Q X arrow.r H_(* + 1) Q Sigma X$. It commutes with the upper-index Dyer–Lashof operations on reduced classes and kills products of two positive-dimensional classes. If $c$ is the class of a component point and $z$ has positive degree, then 
$ sigma_(*) \( c * z \) = sigma_(*) z . $

]
] <lem:weight-suspension>

#proof[
  For $v in S^1$, the based map $x mapsto v and x$ induces $C \( X \) arrow.r C \( Sigma X \)$. These maps form a pointed family, since the basepoint of $S^1$ induces the constant map to the monoid unit. Its adjoint is
  $ S^1 and C \( X \) arrow.r C \( Sigma X \) . $
  Since $Sigma X$ is connected, the target is $Q Sigma X$. On the generating space $X$, adjunction identifies this family with the usual stabilization into $Omega Q Sigma X tilde.eq Q X$. Reduced freeness and group completion therefore identify its adjoint with the usual structure map of the infinite loop spaces.
  The positive-weight equivalence in Proposition 4 is a natural equivalence between the reduced functors
  $ X mapsto "fib" \( Sigma_(+)^oo C \( X \) arrow.r S \) \, #h(2em) X mapsto or.big_(r > 0) D_r \( Sigma^oo X \) . $
  Both send the one-point based space to zero. Their action on mapping spaces therefore respects the basepoint given by factorization through that space, including its nullhomotopy. Apply this naturality to the pointed mapping-space family $v mapsto \( v and - \)$, and then take the stable adjunction. On the $r$th extended power the same $v$ is used in every tensor factor. This gives (1) with no mixing of weights. For a sphere, $D_r \( Sigma^n S \)$ is the Thom spectrum of $n rho_r$ over $B Sigma_r$, where $rho_r$ is the permutation representation. The map in question is the Thom map associated to
  $ n rho_r xor bb(R) arrow.r \( n + 1 \) rho_r \, $
  using the diagonal line $bb(R) subset rho_r$.
  The commutation rule with upper-index Dyer–Lashof operations is the usual suspension rule for free infinite loop space homology #cite(label("May1977")) §20, p. 481. The product rules can also be read directly from the adjunction of loop multiplication: the suspension of loop concatenation factors through the pinch map and gives the sum of the two suspensions. Thus a cross product of two positive-dimensional classes has zero image. For a product with a component point, the surviving term is the suspension of the positive-dimensional factor, multiplied by the augmentation of the point class, which is one. ◻
]

For every $n gt.eq 0$ we may equip $bb(P) \( Sigma^n S \)$ with the #emph[linear coproduct]: it is the commutative ring map whose restriction to the generating spectrum is the sum of its inclusions in the two factors. At $n = 0$ this is auxiliary structure and is not asserted to be the space diagonal. At positive levels it is the space diagonal, as the following observation shows.

#thm([Lemma 2.4.])[
  #emph[For a suspension $X$, the space diagonal on $C \( X \)$ corresponds under Proposition 4 to the linear coproduct on $bb(P) \( Sigma^oo X \)$. Its component from weight $r$ to weights $\( i \, r - i \)$ is the stable transfer for 
$ Sigma_i times Sigma_(r - i) subset Sigma_r . $

]
] <lem:linear-diagonal>

#proof[
  In terms of the reduced generator, the diagonal is the sum of its two linear inclusions and the term induced by the reduced diagonal $X arrow.r X and X$. The latter is null for a suspension. Because the source ring is free, a homotopy on the generating spectrum gives the required homotopy of commutative ring maps.
  Apply $D_r$ to the linear map $T arrow.r T or T$. The terms choosing the first summand $i$ times are indexed by the transitive $Sigma_r$-set $Sigma_r \/ \( Sigma_i times Sigma_(r - i) \)$. Equivariantly, the map into these terms is the diagonal into a finite sum indexed by that set. On homotopy orbits it is the stable transfer to the indicated subgroup. This describes every component, including the two end components. ◻
]

=== 2.3 The Steenrod modules in a primitive weight <the-steenrod-modules-in-a-primitive-weight>

At weight $r > 0$, let $P_r \( n \)$ denote the subspace of $H_(*) D_r \( Sigma^n S \)$ primitive for the linear coproduct: all components with $0 < i < r$ vanish. Its degreewise dual is the quotient of $H^(*) D_r \( Sigma^n S \)$ by the sum of the images of the proper two-block cohomology transfers. At each fixed weight these groups are of finite type, so this duality is exact degree by degree. For $n > 0$, put

$ B_n = tilde(H)^(*) \( Q S^n \) \, #h(2em) Q B_n = B_n \/ B_n^2 . $

Lemma 7 identifies the transfer quotients with the corresponding weight parts of $Q B_n$.

At weight $2^k$, restriction to the regular elementary abelian subgroup of $Sigma_(2^k)$ will identify this quotient with an ideal in a polynomial invariant ring. We first describe that ring.

For $k gt.eq 1$, write

$ P_k = bb(F)_2 \[ x_1 \, dots.h \, x_k \] \, #h(2em) \| x_i \| = 1 \, #h(2em) D_k = P_k^("GL"_k \( bb(F)_2 \)) = bb(F)_2 \[ d_0 \, dots.h \, d_(k - 1) \] \, $

where $\| d_j \| = 2^k - 2^j$. Here $D_k$ is a Dickson algebra, in contrast to the extended-power spectrum $D_r T$. We suppress the rank $k$ on the generators $d_j$ and set $d_k = 1$. The Dickson generators are the coefficients of the additive polynomial

#[#set math.equation(numbering: n => "(2)")
 $ product_(a in "span" { x_1 \, dots.h \, x_k }) \( U + a \) = sum_(j = 0)^k d_j U^(2^j) . $ <eq:dickson-polynomial>]

The invariant-ring description is Dickson’s theorem #cite(label("Dickson1911")). We recall the root-polynomial proof of the binary case, also developed in Wilkerson’s account #cite(label("Wilkerson1983")) §I.

#thm([Lemma 2.5.])[
  #emph[The coefficients $d_0 \, dots.h \, d_(k - 1)$ in (2) are algebraically independent, have degrees $2^k - 2^j$, and generate $P_k^("GL"_k \( bb(F)_2 \))$.]
] <lem:dickson-ring>

#proof[
  The product over a finite binary vector space is additive in $U$. Indeed, if $W' = W xor chevron.l a chevron.r$ and its root polynomial for $W$ is $P_W$, then
  $ P_(W') \( U \) = P_W \( U \) P_W \( U + a \) = P_W \( U \)^2 + P_W \( a \) P_W \( U \) . $
  Induction from $P_({ 0 }) \( U \) = U$ proves additivity and the displayed powers of $U$. Homogeneity gives the degrees of the coefficients. They are invariant because an invertible binary linear change of variables permutes the roots.
  Put $B = bb(F)_2 \[ d_0 \, dots.h \, d_(k - 1) \] subset P_k$ and $L = bb(F)_2 \( x_1 \, dots.h \, x_k \)$. Each $x_i$ satisfies the monic root polynomial, so $P_k$ is integral over $B$. Therefore $B$ has transcendence degree $k$; its $k$ indicated generators are algebraically independent and $B$ is integrally closed. The derivative of the root polynomial is the nonzero product $d_0$ of all nonzero binary linear forms. Its splitting field over $"Frac" B$ is $L$. Every automorphism of this splitting field acts invertibly and linearly on the root space; conversely every such linear transformation fixes the coefficients. Consequently $L^("GL"_k \( bb(F)_2 \)) = "Frac" B$. An invariant polynomial lies in this fraction field and is integral over $B$, hence belongs to $B$. This proves the assertion. ◻
]

#thm([Lemma 2.6.])[
  #emph[The only nonzero positive-weight transfer quotients are at weights $r = 2^k$, $k gt.eq 0$. As Steenrod modules they are 
#[#set math.equation(numbering: n => "(3)")
 $ M_0 \( n \) = Sigma^n bb(F)_2 \, #h(2em) M_k \( n \) = Sigma^n d_0^n D_k quad \( k gt.eq 1 \) \, #h(2em) n gt.eq 0 . $ <eq:weight-modules>]

 For $n > 0$ these give the weight decomposition of $Q B_n$. The action on $d_0^n D_k$ is its ordinary action as an ideal in $P_k$.]
  #emph[The dual of (1) on these quotients is, after the common grading suspension, the inclusion 
#[#set math.equation(numbering: n => "(4)")
 $ d_0^(n + 1) D_k arrow.r.hook d_0^n D_k #h(2em) \( k gt.eq 1 \) . $ <eq:module-suspension>]

 In weight one it is the identity with the corresponding shift.]
] <lem:weight-modules>

#proof[
  We first determine dimensions and the weights in which primitives can occur. The free infinite loop space homology theorem gives, for $n > 0$,
  #[#set math.equation(numbering: n => "(5)")
   $ H_(*) Q S^n = bb(F)_2 #scale(x: 120%, y: 120%)[\[] Q_(j_1) dots.h.c Q_(j_k) g_n : 0 < j_1 lt.eq dots.h.c lt.eq j_k #scale(x: 120%, y: 120%)[\]] \, $ <eq:free-homology-basis>]
  including the empty word $g_n$, where $Q_j z = Q^(j + \| z \|) z$ and $\| g_n \| = n$ #cite(label("CLM1976")). The generator $g_n$ is primitive. Naturality of the operations for the coproduct, together with Cartan and the vanishing of positive operations on the unit, shows that every displayed polynomial generator is primitive.
  For $n = 0$, the same polynomial description holds for $H_(*) bb(P) \( S \)$ on the free degree-zero generator, which we denote here by $u$. One may see this from the free unbased monoid $product.co_r B Sigma_r$, whose suspension ring is free on a degree-zero spectrum generator. The Dyer–Lashof operations for commutative ring spectra agree with the space operations on such suspension rings #cite(label("BMMS1986")). Naturality for the #emph[linear] ring coproduct again makes the polynomial generators primitive. This argument does not identify that coproduct with the actual space diagonal at level zero.
  In both calculations, the bottom generator has weight one, a Dyer–Lashof operation doubles weight, and multiplication adds weights. In a polynomial Hopf algebra on primitive generators, the primitives have basis the iterated $2$-powers of those generators. For example, this follows by writing the primitive identity as $f \( upright(bold(x)) + upright(bold(y)) \) = f \( upright(bold(x)) \) + f \( upright(bold(y)) \)$: a monomial involving distinct variables produces a nonzero cross term, and for a single variable all interior binomial coefficients vanish exactly when the exponent is a power of two. Every polynomial involves only finitely many variables, so the argument also applies to the infinite polynomial algebra.
  It follows that a primitive basis is given by the words
  $ Q_(j_1) dots.h.c Q_(j_k) g_n \, #h(2em) 0 lt.eq j_1 lt.eq dots.h.c lt.eq j_k \, $
  with $u$ in place of $g_n$ at $n = 0$. Initial zero indices record iterated squares. A word of length $k$ has weight $2^k$ and degree
  $ 2^k n + j_1 + 2 j_2 + dots.h.c + 2^(k - 1) j_k . $
  Thus primitives vanish at the other positive weights. Setting $a_1 = j_1$ and $a_i = j_i - j_(i - 1)$ for $i > 1$ rewrites this degree as
  #[#set math.equation(numbering: n => "(6)")
   $ 2^k n + sum_(i = 1)^k \( 2^k - 2^(i - 1) \) a_i \, #h(2em) a_i gt.eq 0 . $ <eq:primitive-degree-count>]
  These are exactly the monomial degrees in $Sigma^n d_0^n D_k$. At $n = 0$ we perform this count at fixed weight, allowing degree zero; it remains finite in each degree at that weight.
  We next identify the Steenrod module, rather than just its graded dimension. Fix $r = 2^k$ with $k gt.eq 1$ and let $V = \( bb(Z) \/ 2 \)^k subset Sigma_r$ be the regular elementary abelian subgroup. The extended power $D_r \( Sigma^n S \)$ is the Thom spectrum of $n rho_r$ over $B Sigma_r$. Restrict its cohomology to $B V$. Every proper two-block transfer restricts to zero. Indeed, the double coset formula expresses its restriction as transfers from subgroups
  $ V ∩ g \( Sigma_i times Sigma_(r - i) \) g^(- 1) \, #h(2em) 0 < i < r . $
  Each is proper, because $V$ acts transitively on the particles whereas a two-block subgroup preserves a nonempty proper subset. If $W < V$, restriction $H^(*) B V arrow.r H^(*) B W$ is surjective. The projection formula then expresses transfer of any class as a class from $H^(*) B V$ times the transfer of $1$, which is the even index $\[ V : W \]$, hence zero. Naturality of the mod-$2$ Thom class gives the same assertion with the representation twist.
  The normalizer of $V$ acts through $"GL"_k \( bb(F)_2 \)$, so the restriction image is contained in $D_k$ times the Thom class. It contains all of that module: the Stiefel–Whitney classes of $rho_r$ restrict to the Dickson generators in (2). More explicitly, $rho_r \|_V$ is the sum of all the real one-dimensional characters, and its total Stiefel–Whitney class is the product of $1 + a$ over all $a in V^(*)$. Thus $w_(2^k - 2^j) \( rho_r \) \|_(B V) = d_j$, and polynomials in these classes, multiplied by the Thom class, give the claimed image. Restriction therefore gives a surjection from the transfer quotient onto $D_k$ times the Thom class. The dimension computation (6) makes this surjection an isomorphism in every degree.
  Finally, split the regular representation over $B V$ as $bb(R) xor macron(rho)_r$. Pulling the Thom class back along the trivial $n$-plane inclusion
  $ bb(R)^n arrow.r n rho_r $
  multiplies it by the Euler class of $n macron(rho)_r$, namely $d_0^n$, and leaves the trivial Thom shift $Sigma^n$. Multiplication by $d_0^n$ is injective in the polynomial algebra. All maps used here are stable cohomology maps; hence the resulting identification is the Steenrod module $Sigma^n d_0^n D_k$ with its inherited action. In particular this also proves stability of that ideal under $A$. Weight one is immediate from $D_1 \( Sigma^n S \) = Sigma^n S$.
  For compatibility with suspension, the Thom map in Lemma 6 has complement $macron(rho)_r$. Its pullback sends a Thom coefficient $f$ to $d_0 f$. The level-$n$ identification then sends this coefficient to $d_0^n \( d_0 f \) = d_0^(n + 1) f$, which is its image under the level-$\( n + 1 \)$ identification. Thus, after the common suspension shift, the map is
  $ M_k \( n + 1 \) = Sigma^(n + 1) d_0^(n + 1) D_k arrow.r Sigma M_k \( n \) = Sigma^(n + 1) d_0^n D_k \, $
  given by inclusion. This proves (4), with all degree shifts as asserted. ◻
]

=== 2.4 The weight filtration at level zero <the-weight-filtration-at-level-zero>

At positive levels the structured splitting gives a direct sum of weights. At level zero we instead construct compatible finite weight projections and show that they determine the first nonzero weight. This requires a truncation of the free algebra.

For $N gt.eq 0$, write $bb(P)_(lt.eq N) \( T \)$ for the algebra obtained by discarding weights greater than $N$. Its underlying spectrum is $or.big_(0 lt.eq r lt.eq N) D_r T$, and an operation whose output weight exceeds $N$ is zero. More formally, one first truncates in nonnegatively graded spectra, with the truncated tensor product. Extend the result by zero to the full category of nonnegatively graded spectra, using the induced lax monoidal structure, and then take its direct sum. Nonnegative grading ensures that an operation killed by the truncation cannot subsequently return to a retained weight. This gives a commutative ring spectrum and a natural algebra projection $bb(P) \( T \) arrow.r bb(P)_(lt.eq N) \( T \)$.

The particle monoid at level zero is $C \( S^0 \) = product.co_(r gt.eq 0) B Sigma_r$. It is essential to distinguish its particle generator from the reduced generator of Proposition 4. Denote the former by $t$ and the latter by $u$, so that $t = 1 + u$. The symbol $1$ here is the additive monoid unit, represented in homology by the empty-particle component point; it is not the point in component $- 1$ of $Q S^0$.

#thm([Lemma 2.7.])[
  #emph[There is an equivalence of augmented commutative ring spectra 
#[#set math.equation(numbering: n => "(7)")
 $ R := Sigma_(+)^oo Q S^0 tilde.eq bb(P) \( S { u } \) \[ \( 1 + u \)^(- 1) \] \, #h(2em) t = 1 + u \, $ <eq:zero-localization>]

 and compatible augmented commutative ring maps 
#[#set math.equation(numbering: n => "(8)")
 $ R arrow.r bb(P)_(lt.eq N) \( S { u } \) \, #h(2em) N gt.eq 0 . $ <eq:weight-projections>]

 The induced homology maps jointly detect all classes. Consequently a nonzero positive-dimensional class has a well-defined smallest nonzero weight, called its #emph[leading weight]. Multiplication by a power of $t$ does not change its leading component.]
  #emph[Let $z in H_d Q_0 S^0$, $d > 0$, be primitive and annihilated by positive Steenrod operations. Its leading component $z_r$ is primitive and $A$-annihilated for the linear coproduct calculation of Lemma 9 at $n = 0$. In particular $r = 2^k$ for some $k gt.eq 1$. The weight-$r$ component of $sigma_(*) z$ is the image of $z_r$ under (1); its functional on $M_k \( 1 \)$ is the restriction, shifted by one, of the functional on $D_k$ defined by $z_r$. If $d$ is odd, this component is nonzero.]
] <lem:zero-weights>

#proof[
  Under Proposition 4, the particle is the ring element $t = 1 + u$. Group completion of $C \( S^0 \)$ inverts this particle component. For a commutative ring spectrum $A'$, a map from its suspension ring is a map from the additive $E_oo$ particle monoid to the multiplicative $E_oo$ space of $A'$. Such a map extends over group completion precisely when the particle maps to a unit. Equivalently, the resulting ring map inverts $1 + u$. This is the universal property of the localization in (7), including its mapping spaces. The augmentation sends $u$ to zero and $t$ to one, so the equivalence is augmented. The underlying module of localization at a degree-zero element is its multiplication telescope. Therefore ordinary homology satisfies
  $ H_(*) R = H_(*) bb(P) \( S { u } \) \[ \( 1 + u \)^(- 1) \] . $
  In $bb(P)_(lt.eq N) \( S { u } \)$, the element $u$ is nilpotent in $pi_0$. Thus $1 + u$ is a unit, with inverse $sum_(j = 0)^N \( - u \)^j$ in $pi_0$, and the truncation extends across localization to give (8). Their compatibility follows from the localization universal property.
  Every class of $H_(*) R$ can be multiplied by a sufficiently large power of $t$ to become a class in the free homology algebra $H_(*) bb(P) \( S { u } \)$. This algebra is polynomial, as used in Lemma 9, and is a direct sum of weights. Hence such a numerator has only finitely many nonzero weights. If its smallest nonzero component has weight $r$, multiplying by $\( 1 + u \)^a$ leaves that component unchanged: the weight-zero term is one and every other term has positive weight. Conversely, in a finite truncation the inverse of $1 + u$ has weight-zero term one and only positive weights otherwise. Thus a nonzero numerator remains nonzero in every truncation retaining its leading weight. This proves joint detection, independence of the leading component from the chosen numerator, and invariance under powers of $t$. The inclusion $H_(*) Q_0 S^0 arrow.r H_(*) Q S^0$ is injective, since it is the inclusion of one component, so these conclusions apply to the base component as well.
  Before localization, the actual space diagonal on the reduced generator is
  #[#set math.equation(numbering: n => "(9)")
   $ Delta u = u ⊗ 1 + 1 ⊗ u + u ⊗ u . $ <eq:zero-diagonal>]
  Consequently, a weight-$r$ class maps only to terms of total weight at least $r$, and its terms of total weight $r$ are given by the linear coproduct. This follows by applying extended powers to (9) and then multiplying. It remains true after localization: the diagonal of $t$ is $t ⊗ t$, whose inverse has constant term one and only positive total weights otherwise. These statements may all be made in finite truncations in the two target factors, so no convergence of an infinite sum is required.
  The kernels of the projections through weight $r - 1$ define a decreasing weight filtration. The preceding calculation identifies its associated graded coproduct with the linear coproduct. Since $z$ is primitive, comparison in its leading total weight gives
  $ Delta_(upright("lin")) z_r = z_r ⊗ 1 + 1 ⊗ z_r . $
  The weight projections are maps of spectra, so they commute with the stable Steenrod action. Thus $z_r$ is also $A$-annihilated. Lemma 9 makes $r$ a power of two; weight one has no positive-dimensional homology, so $r = 2^k$ with $k gt.eq 1$.
  For the suspension assertion, choose $a gt.eq 0$ such that $t^a z$ has a finite numerator in the particle monoid homology. The translation rule in Lemma 6 gives
  $ sigma_(*) \( t^a z \) = sigma_(*) z . $
  The numerator has the same leading component $z_r$ and no smaller weights. Apply the weight-preserving family of Lemma 6 before group completion. It follows that the weight-$r$ component of the suspension is exactly the image of $z_r$ under (1). By (4), the corresponding functional is the restriction from $D_k$ to $d_0 D_k$, with one suspension shift.
  Finally, all the generators of $D_k \/ \( d_0 \)$ have even degrees: $\| d_j \| = 2^k - 2^j$ is even for $j gt.eq 1$ (and for $k = 1$ the quotient is just $bb(F)_2$). A nonzero odd-degree functional on $D_k$ therefore cannot vanish on $d_0 D_k$. This proves that the leading component survives suspension when $d$ is odd. ◻
]

=== 2.5 The suspension kernel and square roots of primitives <the-suspension-kernel-and-square-roots-of-primitives>

Let $H^(+)$ denote the positive-degree part of a connected homology algebra, and call $\( H^(+) \)^2$ its subspace of decomposables.

#thm([Lemma 2.8.])[
  #emph[For $n gt.eq 1$, a positive-dimensional class in the kernel of 
$ sigma_(*) : H_(*) Q S^n arrow.r H_(* + 1) Q S^(n + 1) $

 is decomposable. The same assertion holds for $sigma_(*) : H_(*) Q_0 S^0 arrow.r H_(* + 1) Q S^1$. In each case the kernel in positive dimensions is precisely the subspace of decomposables.]
] <lem:suspension-kernel>

#proof[
  The product rule of Lemma 6 kills the decomposables. For the reverse inclusion, use the polynomial generators in (5). Suspension commutes with upper-index operations. When the bottom class changes from $g_n$ to $g_(n + 1)$, every intermediate word with those same upper indices increases in degree by one. Thus each lower index of a nonempty polynomial generator decreases by one. The original indices satisfy $0 < j_1 lt.eq dots.h.c lt.eq j_k$, so the resulting indices satisfy
  $ 0 lt.eq j_1 - 1 lt.eq dots.h.c lt.eq j_k - 1 . $
  These are distinct nonzero primitive words in the target. The empty-word generator $g_n$ suspends to $g_(n + 1)$, also nonzero. Hence suspension is injective on the span of the polynomial generators modulo decomposables.
  At level zero, localization at the particle gives
  $ H_(*) Q S^0 = bb(F)_2 #scale(x: 120%, y: 120%)[\[] t \, t^(- 1) \, Q_(j_1) dots.h.c Q_(j_k) t : k gt.eq 1 \, med 0 < j_1 lt.eq dots.h.c lt.eq j_k #scale(x: 120%, y: 120%)[\]] . $
  A word of length $k$ has component degree $2^k$. Replacing each such generator by its product with $t^(- 2^k)$ identifies this algebra with the Laurent polynomial algebra on $t$ over a polynomial algebra concentrated in component zero. Thus $H_(*) Q_0 S^0$ is polynomial, with generators the translates to component zero of the nonempty positive-excess particle generators $Q_(j_1) dots.h.c Q_(j_k) t$ with $0 < j_1 lt.eq dots.h.c lt.eq j_k$. A word of length $k$ is translated by $t^(- 2^k)$. Suspension ignores that translation and commutes with its upper-index operations, giving the same distinct nonzero words on $g_1$ with all lower indices decreased by one. One may equivalently start with the reduced generator $u = t - 1$: positive operations on the additive monoid unit vanish, so the positive operations on $u$ and $t$ agree. This proves injectivity on indecomposables at level zero as well.
  The injectivity here is into the full homology of the target. Some of the resulting words have initial lower index zero and are themselves squares; they must not be discarded by projecting the target to indecomposables. Their independence as primitive words is exactly what gives the asserted kernel description. ◻
]

#thm([Lemma 2.9.])[
  #emph[Let $H$ be a connected graded commutative Hopf algebra over $bb(F)_2$ which is polynomial as an algebra on positive-degree generators. Every decomposable primitive of $H$ is a square, and its unique square root is primitive. If $H$ also has a Steenrod action satisfying the homology Cartan formula, an $A$-annihilated square has an $A$-annihilated root.]
  #emph[These statements apply to $H_(*) Q_0 S^0$ and to $H_(*) Q S^n$ for $n gt.eq 1$.]
] <lem:primitive-roots>

#proof[
  Put $Q H = H^(+) \/ \( H^(+) \)^2$, let $pi : H arrow.r Q H$ send $1$ to zero, and define
  $ partial = \( 1 ⊗ pi \) Delta : H arrow.r H ⊗ Q H . $
  The identity $pi \( a b \) = epsilon.alt \( a \) pi \( b \) + epsilon.alt \( b \) pi \( a \)$ shows that $partial$ is a derivation. If $y_i$ are homogeneous polynomial generators, connectedness and grading give
  $ partial y_i = 1 ⊗ \[ y_i \] + upright("terms with smaller positive degree in the second factor") . $
  For a polynomial $f$, the derivation rule yields
  $ partial f = sum_i frac(partial f, partial y_i) thin partial y_i . $
  Only finitely many variables occur in $f$. If $partial f = 0$, inspect the coefficient of $\[ y_i \]$ for variables of largest degree occurring in $f$. There is no contribution from a higher-degree generator, so their ordinary polynomial partial derivatives vanish. Descending through generator degrees shows that every $partial f \/ partial y_i$ vanishes. Over $bb(F)_2$, this means that every exponent in every monomial of $f$ is even; equivalently, $f = z^2$ for a unique polynomial $z$.
  If $f$ is a decomposable primitive, then $partial f = 1 ⊗ pi \( f \) = 0$, so this argument applies. Moreover,
  $ #scale(x: 120%, y: 120%)[\(] Delta z - z ⊗ 1 - 1 ⊗ z #scale(x: 120%, y: 120%)[\)]^2 = 0 . $
  The tensor product $H ⊗ H$ is again a polynomial algebra, so its Frobenius map is injective. Hence the displayed reduced coproduct is zero and $z$ is primitive.
  Finally, the homology Cartan formula in characteristic two gives
  $ "Sq"_(*)^(2 a) \( z^2 \) = \( "Sq"_(*)^a z \)^2 \, #h(2em) "Sq"_(*)^(2 a + 1) \( z^2 \) = 0 . $
  If $z^2$ is $A$-annihilated, injectivity of Frobenius forces $"Sq"_(*)^a z = 0$ for every $a > 0$. Since these squares generate the positive Steenrod action, the root is $A$-annihilated. The polynomial homology descriptions above verify the algebra hypotheses for the infinite loop spaces under consideration. ◻
]

== 3 Mapping-cone squares and a module extension <sec:cones>

The mapping cone of an actual sphere map supplies the realization information needed by the algebraic obstruction. We first recover a cone square from the square Hurewicz image of the loop adjoint. For targets $Q S^n$ with $n > 0$, we then retain the top cone class while passing to indecomposable cohomology, and obtain a nonzero tensor in $I ⊗_A M_k \( n \)$. The first step is valid for every connected target, including those that are not simply connected.

#thm([Lemma 3.1.])[
  (The cone-square detector).  #emph[Let $T$ be a connected based space and $m gt.eq 2$. Suppose that $g : S^(2 m - 1) arrow.r T$ has zero mod-2 Hurewicz image and that its adjoint $g^flat : S^(2 m - 2) arrow.r Omega T$ has Hurewicz image $x^2$, where $x in H_(m - 1) \( Omega_0 T \; bb(F)_2 \)$ and the square uses the loop product. If $u in H^m \( T \; bb(F)_2 \)$ satisfies $u^2 = 0$, then it has a unique extension $tilde(u) in H^m \( C_g \; bb(F)_2 \)$, and 
#[#set math.equation(numbering: n => "(10)")
 $ tilde(u)^2 = chevron.l u \, sigma_(*) x chevron.r a \, $ <eq:cone-square>]

 where $a in H^(2 m) \( C_g \; bb(F)_2 \)$ is the image of the top relative class. This relative class is nonzero.]
] <lem:cone-square>

#proof[
  The cohomology sequence of the attachment shows that restriction in degree $m$ is an isomorphism: $m < 2 m - 1$. It also shows that the top relative class injects, since $g^(*) : H^(2 m - 1) \( T \) arrow.r H^(2 m - 1) \( S^(2 m - 1) \)$ is zero. Thus $tilde(u)^2$ is a scalar multiple of $a$.
  To determine the scalar, we use the universal space for a cohomology class equipped with a nullhomotopy of its square. Write $K \( j \) = K \( bb(F)_2 \, j \)$ and set
  $ F = "hofib" #scale(x: 120%, y: 120%)[\(] "Sq"^m : K \( m \) arrow.r K \( 2 m \) #scale(x: 120%, y: 120%)[\)] . $
  A map representing $u$ lifts to $F$ because its square is zero. Looping the defining map represents $"Sq"^m$ on the fundamental class of degree $m - 1$, which is zero by instability. Consequently the fibration
  $ K \( 2 m - 2 \) arrow.r Omega F arrow.r K \( m - 1 \) $
  is trivial up to fibre homotopy. This is a statement about spaces over $K \( m - 1 \)$; its splitting need not preserve loop products.
  We need the additive square-zero property of Eilenberg–MacLane spaces: every positive-degree mod-two homology class of $K \( j \)$, $j gt.eq 1$, has zero square for its additive Pontryagin product. This follows from Serre’s cohomology calculation #cite(label("Serre1953")); the following chain argument gives the precise property used here. Use the simplicial abelian group $G_r = Z^j \( Delta \[ r \] \; bb(F)_2 \)$ of normalized simplicial $j$-cocycles, with faces given by restriction. Its Moore complex is $bb(F)_2$ in degree $j$ and zero elsewhere: below that degree there are no $j$-cochains; in higher degrees the vanishing faces and the cocycle equation force the remaining face to vanish. Thus its realization is an additive model for $K \( j \)$. The normalized #emph[linearized] complex $N \( bb(F)_2 \[ G \] \)$, rather than the Moore complex of $G$, computes its homology. Addition induces the chain product through the shuffle map and $\[ a \] \[ b \] = \[ a + b \]$. For a chain $z$ of degree $q > 0$, the terms in $z * z$ pair under exchange of the two complementary $\( q \, q \)$-shuffle blocks and of the two chosen simplices of $z$. This involution has no fixed point, and the paired summands agree because addition is commutative. They cancel over $bb(F)_2$, even before normalization. Hence $z * z = 0$, proving the property.
  Let $c in H_(m - 1) \( Omega F \)$ be the bottom class. Its image in $H_(m - 1) K \( m - 1 \)$ has square zero for the additive multiplication. This is the additive square-zero property just proved. It follows that $c^2$ lies in the kernel of the projection to $K \( m - 1 \)$. In degree $2 m - 2$ this kernel is one-dimensional, generated by the bottom class of the fibre. The homotopy long exact sequence gives $pi_(2 m - 2) Omega F = bb(F)_2$, and the space splitting shows that its Hurewicz map identifies its nonzero element with that fibre class.
  It remains to show that $c^2$ is the nonzero fibre class. We do this by showing that the product of bottom classes survives the cobar spectral sequence. The space $F$ is $\( m - 1 \)$-connected, so it is simply connected even when $m = 2$. Adams’s cobar construction #cite(label("Adams1956")) has a multiplicative comparison with chains on its based loop space; we use the modern comparison in #cite(label("Rivera2019")) Theorem 1. Choose a 1-reduced Kan model for $F$; the comparison for its cobar algebra follows from #cite(label("Rivera2019")) Corollary 8 and Theorem 9. Each desuspended reduced chain has positive degree, so the tensor-length filtration is finite in each total degree. The resulting spectral sequence therefore converges to actual loop homology, without a completion ambiguity. Write its first page as
  $ E_1^(s \, t) = \( tilde(H)_(*) \( F \)^(⊗ s) \)_t \, #h(2em) E_1^(s \, t) arrow.r.double H_(t - s) \( Omega F \) \, #h(2em) d_r : \( s \, t \) mapsto \( s + r \, t + r - 1 \) . $
  Let $c_0 in H_m \( F \)$ be the bottom class. In length two and internal degree $2 m$, the term $\[ c_0 divides c_0 \]$ is not a boundary for the coproduct differential: the relevant coefficient is dual to the square of the bottom cohomology class of $F$, and that square vanishes by the defining fibre construction. The term is a cycle since the reduced coproduct of $c_0$ is zero.
  There is no higher incoming differential: its source would be $\( 2 - r \, 2 m - r + 1 \)$, hence have negative length or length zero and positive internal degree. A higher outgoing differential would land in length $2 + r$ and internal degree $2 m + r - 1$, where $r gt.eq 2$. Such a term vanishes, since each reduced homology factor has degree at least $m$ and
  $ \( 2 + r \) m > 2 m + r - 1 . $
  This argument includes $m = 2$: the term is then in $\( s \, t \) = \( 2 \, 4 \)$, and a higher outgoing target has internal degree $r + 3 < 2 \( r + 2 \)$. The same connectivity bound shows that $\[ c_0 \]$ is permanent and detects the unique bottom class $c$. Cobar concatenation represents the loop product on the associated graded. The nonzero surviving product $\[ c_0 divides c_0 \]$ consequently implies $c^2 eq.not 0$ in actual loop homology. It is therefore the nonzero fibre class.
  Under any lift $T arrow.r F$, the loop image of $x$ is $chevron.l u \, sigma_(*) x chevron.r c$, by homology suspension and the one-dimensional bottom homology. Thus the adjoint of the composite $S^(2 m - 1) arrow.r T arrow.r F$ has Hurewicz image $chevron.l u \, sigma_(*) x chevron.r c^2$. The injectivity just proved shows that this composite is null precisely when the coefficient is zero.
  Finally, $tilde(u)^2 = 0$ is equivalent to the existence of a lift of its representing map over $C_g$ to $F$. Such a lift restricts to a lift on $T$ whose composite with $g$ is null; conversely, any such lift extends over the attachment. The calculation applies to every choice of lift. One can also see the independence directly: changes of lift are measured by $H^(2 m - 1) \( T \)$, whose pullback along $g$ is zero. This proves (10). ◻
]

Retain the maps and classes of Lemma 13, specialize to $T = Q S^n$ with $n > 0$, and suppose in addition that $x$ is primitive and $A$-annihilated. Put $B = tilde(H)^(*) \( T \; bb(F)_2 \)$. The homology Hopf algebra is polynomial on primitives, so its graded dual cohomology algebra is exterior: each divided-power factor is exterior on the generators at powers of two. Degreewise finite type justifies the duality. In particular every positive cohomology class has square zero. Define

$ lambda : B^m arrow.r bb(F)_2 \, #h(2em) lambda \( u \) = chevron.l u \, sigma_(*) x chevron.r . $

This functional vanishes on decomposables and on positive Steenrod images, since $sigma_(*) x$ is primitive and $A$-annihilated.

#thm([Proposition 3.2.])[
  #emph[Under these assumptions, the cohomology extension of the cone induces an extension of graded $A$-modules 
#[#set math.equation(numbering: n => "(11)")
 $ 0 arrow.r bb(F)_2 { a } arrow.r cal(E) arrow.r Q B arrow.r 0 \, $ <eq:indecomposable-cone-extension>]

 where $\| a \| = 2 m$. On any lift of a degree-$m$ class $v in Q B$, the operation $"Sq"^m$ has value $lambda \( v \) a$.]
] <prop:cone-extension>

#proof[
  The hypothesis $h \( g \) = 0$ gives an exact sequence of positive cohomology $A$-modules
  $ 0 arrow.r bb(F)_2 { a } arrow.r tilde(H)^(*) \( C_g \) arrow.r B arrow.r 0 . $
  The relative module structure implies that $a$ times any positive-degree class is zero. Choose exterior algebra generators of $B$ lifting a homogeneous basis of $Q B$, choosing the basis in degree $m$ so that at most one generator has nonzero $lambda$. Choose lifts of these generators to $tilde(H)^(*) \( C_g \)$. Their squares are zero except possibly for that one distinguished degree-$m$ generator, whose square is $a$ by Lemma 13.
  The nonempty square-free monomials in these lifts, together with $a$, form a graded vector-space basis of $tilde(H)^(*) \( C_g \)$. Quotienting by all products could kill $a$, since it may itself be a square. Instead we remove only products of distinct generators. Let $L$ be the span of the products of at least two distinct lifted generators, with no repetitions. Restriction maps $L$ isomorphically onto $B^2$. We claim that $L$ is an $A$-submodule. Apply Cartan to such a product and expand each factor in the lifted basis. A term involving $a$ vanishes against any remaining positive factor. A repeated generator also gives zero, except that two occurrences of the distinguished generator give $a$; if another positive factor remains, this term again vanishes.
  The only possible contribution outside $L$ is therefore a product of exactly two linear occurrences of the distinguished generator. A positive Steenrod operation on a factor cannot supply such a linear coefficient, because $lambda$ annihilates positive Steenrod images. If both operations are zero, the original two distinct generators cannot both be the distinguished generator. This proves the claim.
  Taking the quotient by $L$ gives (11). In degree $m$, the square detector is unaffected, and its value is still $lambda$. ◻
]

#thm([Corollary 3.3.])[
  #emph[If $lambda \( v \) = 1$ for a degree-$m$ monomial $v$ in a summand $M_k \( n \)$ of $Q B$, then 
#[#set math.equation(numbering: n => "(12)")
 $ "Sq"^m ⊗ v eq.not 0 quad upright("in ") I ⊗_A M_k \( n \) . $ <eq:tensor-detection>]

 The same conclusion holds for the bottom summand $M_0 \( n \) = Sigma^n bb(F)_2$ when its degree is $m$.]
] <cor:tensor-detection>

#proof[
  Pull back (11) to the summand $M = M_k \( n \)$ and choose a graded additive section $s$. In total degree $2 m$, define the scalar $phi \( alpha ⊗ z \)$ by
  $ alpha s \( z \) - s \( alpha z \) = phi \( alpha ⊗ z \) a \, #h(2em) alpha in I . $
  It respects balancing. Indeed, in comparing $alpha beta ⊗ z$ and $alpha ⊗ beta z$, the intermediate degree $\| beta \| + \| z \|$ is strictly less than $2 m$ because $\| alpha \| > 0$. The possible discrepancy in the section therefore vanishes, and associativity gives equality. Thus $phi$ descends to $\( I ⊗_A M \)_(2 m)$.
  Since $n > 0$, the module $M_k \( n \)$ is a positive suspension of an unstable polynomial module; hence $"Sq"^m v = 0$. This is also true in the one-dimensional bottom summand. Proposition 14 therefore gives $phi \( "Sq"^m ⊗ v \) = lambda \( v \) = 1$, proving (12). ◻
]

== 4 Excluding fourth and higher powers <sec:powers>

A spherical class whose homology suspension vanishes is a Pontryagin square. To apply the cone-square argument to such a class, we will need its square root to have nonzero suspension. At level zero this requires a separate argument: a fourth power and its square root both disappear under one homology suspension. We exclude this possibility using the weight projections and an integral characteristic class.

In this section, $*$ denotes the additive Pontryagin product. A pairing of spectra $E_1 and E_2 arrow.r E_3$ induces a based pairing of their zero spaces, and we write $compose$ for the corresponding pairing on homology. Thus $*$ and $compose$ are different operations. We write $a^(* N)$ and $a^(compose N)$ for their respective powers whenever both are present.

#thm([Proposition 4.1.])[
  #emph[There is no positive-dimensional stable sphere class whose nonzero mod-$2$ Hurewicz image is a fourth or higher iterated Pontryagin square. Equivalently, if $f : S^d arrow.r Q_0 S^0$, $d > 0$, and 
$ h \( f \) = z^(* 2^a) \, #h(2em) a gt.eq 2 \, $

 then $h \( f \) = 0$.]
] <prop:no-fourth-powers>

Eccles and Zare exclude higher iterated squares when the root survives homology suspension #cite(label("EcclesZare2009")) Theorem 3.10, and state that the root of a spherical square is odd-dimensional #cite(label("EcclesZare2009")) Lemma 3.12. Here we prove the required exclusion using spectrum pairings and integral characteristic classes.

The space maps adjoint to individual weight projections need not preserve Pontryagin squares. We first compute their correction term, which is expressed through the block pairings of extended powers.

For $v gt.eq 1$, set

$ X_v = \( B Sigma_v \)_(+) \, #h(2em) E_v = D_v S tilde.eq Sigma^oo X_v . $

Block inclusion gives pairings $E_v and E_w arrow.r E_(v + w)$, associative and commutative coherently, and thus associative and commutative pairings $compose$ on their zero-space homology. Write

$ epsilon_v : Sigma^oo Q X_v arrow.r E_v $

for the stable counit; its induced map on positive-dimensional homology is stable homology evaluation.

Fix an integer $N > 0$. Let

$ tau : Sigma_(+)^oo Q S^0 arrow.r bb(P)_(lt.eq N) \( S { u } \) $

be the augmented commutative ring projection of (8). For $1 lt.eq i lt.eq N$, let

$ j_i : Q S^0 arrow.r Omega^oo E_i = Q X_i $

be the based adjoint of its weight-$i$ projection, and write $J_i = \( j_i \)_(*)$ on positive-dimensional homology. These are generally #emph[not] additive infinite loop maps. Their multiplication formula is the following.

#thm([Lemma 4.2.])[
  (Multiplication under the weight projections).  #emph[For points $x \, y in Q S^0$, there is a homotopy 
#[#set math.equation(numbering: n => "(13)")
 $ j_i \( x + y \) tilde.eq j_i \( x \) + j_i \( y \) + sum_(0 < t < i) j_t \( x \) compose j_(i - t) \( y \) \, $ <eq:weight-product>]

 where addition in the target is its additive infinite loop structure. For positive primitives $A_1 \, A_2 in H_(*) Q_0 S^0$, this implies 
#[#set math.equation(numbering: n => "(14)")
 $ J_i \( A_1 * A_2 \) = \( J_i A_1 \) * \( J_i A_2 \) + sum_(0 < t < i) \( J_t A_1 \) compose \( J_(i - t) A_2 \) . $ <eq:primitive-weight-product>]

 Each $J_i$ preserves primitivity and $A$-annihilation. In particular, 
#[#set math.equation(numbering: n => "(15)")
 $ J_i \( A^(* 2) \) = \( J_i A \)^(* 2) + cases(delim: "{", \( J_(i \/ 2) A \)^(compose 2) \, & i upright(" even") \,, 0 \, & i upright(" odd") .) $ <eq:weight-square>]

]
] <lem:weight-product>

#proof[
  Under the adjunction between suspension ring spectra and $E_oo$ spaces, $tau$ gives an $E_oo$ map from the additive structure of $Q S^0$ to the multiplicative space of the truncated ring. The source is grouplike, so this map lands in units. Its weight-zero coordinate is constantly $1$, since $tau$ is augmented; the positive coordinates at the source basepoint are zero. Multiplication in the truncated graded ring has weight-$i$ coordinate equal to the right side of (13). This proves that formula, including its compatibility with all lower coordinates in the single chosen truncation. Group completion causes no further terms: $1 + u$ is a unit in the target, so the map is precisely the extension of the free-monoid map through the localization (7).
  To evaluate (13) on $A_1 times A_2$, distribute the two primitive diagonals across its additive summands. Either the two positive inputs enter the two linear terms, giving their Pontryagin product, or both enter one bilinear summand, giving its block pairing. Every other allocation pairs a positive class with the zero point and vanishes. This gives (14). Although $j_i$ need not preserve addition, it is a based space map, so it preserves ordinary primitivity and commutes with the dual Steenrod operations. When $A_1 = A_2$, the terms with indices $t$ and $i - t$ cancel by block commutativity; only the equal-block term can remain. This proves (15). ◻
]

To remove the extra block-square term in (15), we will use nilpotence for primitives whose stable homology evaluation vanishes. The block pairings arise from spectrum maps, so they have coherent additive structure in each variable. The following calculation uses that structure; it does not require the maps $j_i$ to be additive.

#thm([Lemma 4.3.])[
  (Dyer–Lashof operations and spectrum pairings).  #emph[Let $E_1 and E_2 arrow.r E_3$ be a pairing of spectra. If $u in H_a Omega^oo E_1$ is homogeneous and $y in H_b Omega^oo E_2$, where $b > 0$, is $A$-annihilated, then, for $i gt.eq a$, 
#[#set math.equation(numbering: n => "(16)")
 $ \( Q^i u \) compose y = cases(delim: "{", Q^i \( u compose y \) \, & i gt.eq a + b \,, 0 \, & a lt.eq i < a + b .) $ <eq:pairing-rule>]

 If, in addition, $y$ is primitive and belongs to the basepoint component, then $\( u_1 * u_2 \) compose y = 0$ for positive-dimensional $u_1 \, u_2$. Translating a positive-dimensional first factor by a component point does not change its pairing with $y$.]
] <lem:pairing>

#proof[
  Put $X = Omega^oo E_1$ and $Y = Omega^oo E_2$. The pairing is a coherent family of additive infinite loop maps in its first variable. Indeed its adjoint is a spectrum map $E_2 arrow.r F \( E_1 \, E_3 \)$; passing to zero spaces gives a map from $Y$ to the space of spectrum maps $E_1 arrow.r E_3$, and hence to the space of additive infinite loop maps. Connective covers may be taken without changing the zero spaces. In particular, the naturality homotopies for the additive $E_oo$ structure vary coherently over $Y$.
  For an unbased space $U$, write
  $ cal(E)_2 U = E C_2 times_(C_2) \( U times U \) \, $
  where $C_2$ interchanges the factors. The naturality just described factors the pairing of an additive square operation with $Y$ through
  $ delta : cal(E)_2 X times Y arrow.r cal(E)_2 \( X times Y \) \, #h(2em) \[ e \; x_1 \, x_2 \] \, y mapsto \[ e \; \( x_1 \, y \) \, \( x_2 \, y \) \] . $
  Let $W$ be the free periodic $bb(F)_2 \[ C_2 \]$-resolution with generators $e_j$ and differential $d e_j = \( 1 + tau \) e_(j - 1)$. The chain model
  $ W ⊗_(C_2) C_(*) \( U \)^(⊗ 2) $
  computes $H_(*) cal(E)_2 U$. Choosing cycles for a homology basis of $U$ gives an equivariant quasi-isomorphism before taking homotopy orbits. It follows that a basis of the resulting homology consists of unordered unequal pairs in resolution degree zero and classes $e_j ⊗ z ⊗ z$, $j gt.eq 0$, on equal basis elements.
  We claim the universal formula
  #[#set math.equation(numbering: n => "(17)")
   $ delta_(*) #scale(x: 120%, y: 120%)[\(] \( e_j ⊗ u ⊗ u \) times y #scale(x: 120%, y: 120%)[\)] = sum_(t gt.eq 0) e_(j - b + 2 t) ⊗ \( u times "Sq"_(*)^t y \) ⊗ \( u times "Sq"_(*)^t y \) \, $ <eq:external-pairing>]
  with terms of negative resolution degree omitted. This is the extended-square calculation underlying May’s formula #cite(label("Madsen1975")) §2, formula (2.11), pp. 246–247; we include its verification.
  Transfer from $cal(E)_2 U$ to $U^2$ sends an unequal pair to the sum of its two ordered versions and kills all equal-pair classes. Thus it detects the unequal-pair part injectively. Transfer is natural for $delta$, since its pulled-back double cover is the double cover of $cal(E)_2 X times Y$ obtained from $cal(E)_2 X$. The input of (17) has transfer zero. The output therefore has no unequal-pair terms.
  For $beta in H^q U$, let $P \( beta \) in H^(2 q) cal(E)_2 U$ be its external square, and let $h in H^1 B C_2$ be the characteristic class of the double cover. In the dual resolution model, a cocycle $f$ representing $beta$ gives $P \( beta \)$ by $f ⊗ f$ in resolution column zero. This description is independent of $f$: if $f' = f + d c$, then $P \( f' \) - P \( f \)$ is the total coboundary of the cochain whose columns zero and one are, respectively,
  $ f ⊗ c + c ⊗ f + c ⊗ d c \, #h(2em) c ⊗ c . $
  Multiplication by $h^l$ is the resolution shift, so $h^l P \( beta \)$ is represented by $f ⊗ f$ in column $l$. It evaluates on $e_j ⊗ z ⊗ z$ as $delta_(l j) chevron.l beta \, z chevron.r^2$.
  External squares respect cross products over the common base $B C_2$. Moreover, pulling $P \( beta \)$ back along the Borel diagonal $B C_2 times U arrow.r cal(E)_2 U$ gives
  $ sum_(t = 0)^q h^(q - t) "Sq"^t beta \; $
  this is the total-square definition of the Steenrod operations. Consequently, for $alpha in H^(*) X$ and $beta in H^q Y$,
  $ delta^(*) #scale(x: 120%, y: 120%)[\(] h^l P \( alpha times beta \) #scale(x: 120%, y: 120%)[\)] = h^l P \( alpha \) sum_(t = 0)^q h^(q - t) "Sq"^t beta . $
  Its evaluation on the input in (17) can be nonzero only when
  $ \| alpha \| = a \, #h(2em) q + t = b \, #h(2em) j = l + q - t = l + b - 2 t . $
  The coefficient is then $chevron.l alpha \, u chevron.r chevron.l beta \, "Sq"_(*)^t y chevron.r$. Tensor cohomology classes detect all equal-pair coefficients; in each evaluation only finitely many homology basis elements are involved. Together with the transfer calculation, these evaluations prove (17).
  Now take $j = i - a$ and apply the label pairing, followed by the additive square operation. The term with index $t$ becomes $Q^(i + t) \( u compose "Sq"_(*)^t y \)$. When $y$ is $A$-annihilated, only $t = 0$ remains. Its resolution index is $i - a - b$, which proves both cases of (16).
  Finally, for a primitive $y$ in the basepoint component, $Delta y = y ⊗ \[ 0 \] + \[ 0 \] ⊗ y$. Distributivity of a spectrum pairing over addition gives
  $ \( u_1 * u_2 \) compose y = \( u_1 compose y \) * \( u_2 compose \[ 0 \] \) + \( u_1 compose \[ 0 \] \) * \( u_2 compose y \) = 0 \, $
  because pairing a positive-dimensional class with the zero point is zero. If one first factor is a component point $\[ c \]$, its pairing with $\[ 0 \]$ is the additive unit $\[ 0 \]$ in the target; the same formula proves the translation assertion. ◻
]

#thm([Lemma 4.4.])[
  (Triple block nilpotence).  #emph[Suppose $B in H_i \( Q_0 X_v \)$, $i > 0$, is primitive and $A$-annihilated. If $epsilon_(v *) B = 0$, then 
$ B^(compose 3) = 0 . $

]
] <lem:block-nilpotence>

#proof[
  The free infinite loop space homology theorem and group completion describe $H_(*) Q_0 X_v$ as a polynomial Pontryagin algebra #cite(label("CLM1976")) Part I. Its generators are the positive-dimensional particle classes from a basis of $H_(*) B Sigma_v$, and the admissible positive-excess Dyer–Lashof words of positive length on particle classes, including the degree-zero particle. Each is translated to the basepoint component. There is one degree-zero particle component to invert in group completion; these translations do not change stable homology evaluation in positive dimensions.
  The counit takes the length-zero positive-dimensional generators independently to their corresponding basis classes in $H_(*) E_v$. Stable homology evaluation kills products of positive-dimensional classes. It also kills positive-length words: upper-index operations commute with homology suspension, and repeated suspension eventually makes their outer operation unstable. Therefore, modulo Pontryagin decomposables, the hypothesis $epsilon_(v *) B = 0$ expresses $B$ as a sum of positive-length words only.
  Pair this expression with $B$. The preceding lemma discards the decomposables and translations in the first factor. A remaining term has the form $Q^q c$ with $q + \| c \| = i$. Its pairing can be nonzero only if
  $ q gt.eq \| c \| + i = q + 2 \| c \| \, $
  so $\| c \| = 0$. In this case
  $ \( Q^i c \) compose B = Q^i \( c compose B \) = \( c compose B \)^(* 2) . $
  Thus $B compose B$ is Pontryagin decomposable, and another pairing with $B$ is zero by Lemma 18.
  We also record a property used below: the block pairing of two positive primitives in their basepoint components is primitive. Indeed, naturality of the ordinary diagonal leaves the two end terms; each crossed term pairs a positive-dimensional class with the zero point and vanishes. ◻
]

#proof[
  It suffices to exclude fourth powers, since every higher iterated square is a fourth power. Suppose, therefore, that
  $ h \( f \) = z^(* 4) eq.not 0 . $
  Applying Lemma 12 twice shows that the homogeneous positive-dimensional root $z$ is primitive and $A$-annihilated.
  #emph[Choosing the detector.] Let $r = 2^(k_0) gt.eq 2$ be the leading weight of this root, as in Lemma 10, and let $z_r in H_(*) D_r S$ be its leading component. Put
  $ x = z^(* 2) \, #h(2em) b = \| x \| \, #h(2em) s = 2 r = 2^ell . $
  Here $b$ is positive and even, $ell gt.eq 2$, and $d = 2 b$. In the polynomial associated weight algebra the leading component of $x$ is
  $ p = z_r^2 in H_b D_s S \, $
  and is nonzero. This square is taken in the graded homology algebra $H_(*) bb(P) \( S \)$, rather than by the unstable pairing $compose$.
  The class $p$ is primitive for the linear weight coproduct and is a product of positive-dimensional factors. It therefore dies under the weight suspension (1). One may see this before group completion: homology suspension from the free monoid kills positive-dimensional Pontryagin products, and Lemma 6 identifies its weight components. Thus, under the dual description in Lemma 9, the functional defined by $p$ on the Dickson algebra $D_ell$ kills $d_0 D_ell$. It is nonzero on some monomial in $d_1 \, dots.h \, d_(ell - 1)$. The restriction description of that lemma lifts $d_j$ to $w_(s - 2^j) \( rho_s \)$, where $rho_s$ is the permutation representation of $Sigma_s$. Hence there is a class
  #[#set math.equation(numbering: n => "(18)")
   $ v in H^b \( B Sigma_s \) \, #h(2em) chevron.l v \, p chevron.r = 1 \, $ <eq:even-characteristic-detector>]
  which is a polynomial in the #emph[even-index] Stiefel–Whitney classes of $rho_s$.
  #emph[Removing the block correction.] Use one truncation through weight $s = 2 r$ to define all the maps $j_i$. We claim
  #[#set math.equation(numbering: n => "(19)")
   $ J_s h \( f \) & = \( J_s x \)^(* 2) + \( J_r x \)^(compose 2)\
 & = \( J_s x \)^(* 2) + \( J_(r \/ 2) z \)^(compose 4)\
 & = \( J_s x \)^(* 2) . $ <eq:power-projection>]
  The first equality is (15). For the second, apply that formula to $x = z^(* 2)$:
  $ J_r x = \( J_r z \)^(* 2) + \( J_(r \/ 2) z \)^(compose 2) . $
  Each $J_i z$ lies in the basepoint component and is primitive and $A$-annihilated, by Lemma 17. Thus $\( J_r z \)^(* 2)$ is a primitive Pontryagin decomposable, and its block square is zero by Lemma 18. Block commutativity over $bb(F)_2$ cancels the mixed terms. This gives $\( J_r x \)^(compose 2) = \( J_(r \/ 2) z \)^(compose 4)$. The indices are integral because $r$ is a power of two at least two, and all block products have total weight at most $s$.
  For the last equality in (19), observe that stable counit followed by an adjoint recovers the original spectrum map. Thus, on positive-dimensional homology,
  #[#set math.equation(numbering: n => "(20)")
   $ epsilon_(i *) J_i = \( "pr"_i tau \)_(*) . $ <eq:projected-counit>]
  In particular $B = J_(r \/ 2) z$ has zero stable homology evaluation, because $r \/ 2$ is below the leading weight of $z$. It is a primitive, $A$-annihilated class in $Q_0 X_(r \/ 2)$. Lemma 19 gives $B^(compose 3) = 0$, hence $B^(compose 4) = 0$. This proves the last equality in (19). The same counit identity gives
  #[#set math.equation(numbering: n => "(21)")
   $ epsilon_(s *) J_s x = p . $ <eq:root-stable-projection>]
  #emph[Contradictory cone squares.] Let
  $ g : S^(2 b + 1) arrow.r T = Q Sigma X_s $
  be the adjoint of $j_s compose f : S^(2 b) arrow.r Q_0 X_s$, using the equivalence $Q X_s tilde.eq Omega Q Sigma X_s$. The space $Sigma X_s$, and hence $T$, is connected. The loop product under this equivalence is the additive Pontryagin product. Equation (19) therefore says that the loop adjoint has Hurewicz class $\( J_s x \)^(* 2)$, and gives $h \( g \) = 0$ after homology suspension.
  Let $epsilon : Sigma^oo T arrow.r Sigma^oo Sigma X_s$ be the stable counit and define
  $ u = epsilon^(*) \( Sigma v \) in H^(b + 1) T . $
  Counit compatibility with homology suspension and (21) give
  $ chevron.l u \, sigma_(*) J_s x chevron.r = chevron.l v \, epsilon_(s *) J_s x chevron.r = chevron.l v \, p chevron.r = 1 . $
  Stable Steenrod naturality gives
  $ u^2 = "Sq"^(b + 1) u = epsilon^(*) \( Sigma "Sq"^(b + 1) v \) = 0 . $
  With $m = b + 1$, the hypotheses of Lemma 13 now hold. The unique extension $tilde(u) in H^m C_g$ consequently satisfies
  #[#set math.equation(numbering: n => "(22)")
   $ "Sq"^m tilde(u) eq.not 0 . $ <eq:nonzero-power-cone-square>]
  On the other hand, the restriction of $"Sq"^(m - 1) tilde(u)$ to $T$ is
  $ "Sq"^b u = epsilon^(*) \( Sigma "Sq"^b v \) = epsilon^(*) \( Sigma \( v^2 \) \) . $
  This class has an integral torsion lift. Indeed, for real vector bundles the reduction of the integral Pontryagin class is
  $ rho_2 \( p_i \) = w_(2 i)^(thin 2) . $
  For completeness, this follows from $p_i \( xi \) = \( - 1 \)^i c_(2 i) \( xi ⊗ bb(C) \)$: the underlying real bundle of $xi ⊗ bb(C)$ is $xi xor xi$, and reduction of its Chern classes gives its even Stiefel–Whitney classes. Because $v$ is a polynomial in even-index Stiefel–Whitney classes, its square is the reduction of an integral polynomial $V in H^(2 b) \( B Sigma_s \; bb(Z) \)$ in the Pontryagin classes of $rho_s$. The degree is positive. Restriction to the trivial subgroup followed by transfer shows that positive-degree integral cohomology of the finite group $Sigma_s$ is annihilated by $\| Sigma_s \|$; thus $V$ is torsion. The integral class
  $ U = epsilon^(*) \( Sigma V \) in H^(2 b + 1) \( T \; bb(Z) \) $
  is torsion as well.
  Since $H^(2 b + 1) \( S^(2 b + 1) \; bb(Z) \) = bb(Z)$ is torsion-free, $g^(*) U = 0$. The integral cohomology sequence of the mapping cone supplies an extension $tilde(U) in H^(2 b + 1) \( C_g \; bb(Z) \)$. Restriction
  $ H^(2 b + 1) \( C_g \; bb(F)_2 \) arrow.r H^(2 b + 1) \( T \; bb(F)_2 \) $
  is injective, since the preceding group in the cone sequence is $tilde(H)^(2 b) \( S^(2 b + 1) \; bb(F)_2 \) = 0$. Consequently
  $ rho_2 \( tilde(U) \) = "Sq"^b tilde(u) . $
  The mod-$2$ Bockstein $"Sq"^1$ annihilates an integral reduction. Finally $b$ is even, so the Adem relation gives
  $ "Sq"^(b + 1) tilde(u) = "Sq"^1 "Sq"^b tilde(u) = "Sq"^1 rho_2 \( tilde(U) \) = 0 \, $
  contradicting (22). ◻
]

== 5 An obstruction in Steenrod modules <sec:algebra>

The mapping-cone construction in Section 3 supplies a nonzero tensor on a weight summand. In our application, its detecting functional also lifts from an annihilated functional at the preceding level. The obstruction below uses both inputs. Cartier halving of the lifted functional gives a lower bound on the $d_0$-exponent. An even-degree Tor injection then lets us halve the tensor without losing its nonvanishing. The exponent bound controls the change of ideal at each step.

Throughout this section $k gt.eq 1$,

$ P_k = bb(F)_2 \[ x_1 \, dots.h \, x_k \] \, #h(2em) D_k = P_k^("GL"_k \( bb(F)_2 \)) = bb(F)_2 \[ d_0 \, dots.h \, d_(k - 1) \] \, #h(2em) \| d_j \| = 2^k - 2^j \, $

and $d_k = 1$. The invariants are normalized by

#[#set math.equation(numbering: n => "(23)")
 $ P \( U \) = product_(a in chevron.l x_1 \, dots.h \, x_k chevron.r_(bb(F)_2)) \( U + a \) = sum_(j = 0)^k d_j U^(2^j) . $ <eq:algebra-dickson-polynomial>]

For $n gt.eq 0$ we use the module $M_k \( n \) = Sigma^n d_0^n D_k$ of Lemma 9. A monomial in $M_k \( n \)$ means its underlying polynomial monomial, followed by the grading shift. In particular,

#[#set math.equation(numbering: n => "(24)")
 $ lr(|Sigma^n d_0^c product_(j = 1)^(k - 1) d_j^(b_j)|) = n + c \( 2^k - 1 \) + sum_(j = 1)^(k - 1) b_j \( 2^k - 2^j \) equiv n + c med \( mod med 2 \) . $ <eq:algebra-degree-parity>]

An annihilated functional on a graded $A$-module $M$ is a homogeneous linear functional $lambda$ such that $lambda \( I M \) = 0$.

The Steenrod indecomposables of the ideals $d_0^p D_k$ have been studied by Giambalvo and Peterson #cite(label("GiambalvoPeterson2001")). Here we first take coinvariants for the exterior algebra of Milnor primitives, and retain the least allowed $d_0$-exponent throughout the subsequent degree-halving argument. Both the lifted functional and the tensor nonvanishing in the next statement will be needed.

The tensor product $I ⊗_A M$ uses the right $A$-module structure on $I$; its balancing relation is $\( alpha beta \) ⊗ z = alpha ⊗ \( beta z \)$, for $alpha in I$ and $beta in A$.

#thm([Lemma 5.1.])[
  (Algebra obstruction).  #emph[Let $k gt.eq 1$, $n = e + 1$ with $e gt.eq 0$, and $m gt.eq 2$. Let $v$ be a degree-$m$ monomial of $M_k \( n \)$. Suppose that its underlying monomial is detected by an annihilated functional on $M_k \( e \)$ in degree $m - 1$; equivalently, $v$ is detected by the shifted restriction of that functional along the ideal inclusion. If 
#[#set math.equation(numbering: n => "(25)")
 $ "Sq"^m ⊗ v eq.not 0 #h(2em) upright("in ") I ⊗_A M_k \( n \) \, $ <eq:obstruction-tensor>]

 then $m$ is a power of two and $n = k = 1$.]
  #emph[Without the functional hypothesis, the tensor in (25) is still zero whenever $n > 0$ and $m gt.eq 3$ is odd.]
] <lem:algebra-obstruction>

The two halving arguments start at different exponent floors: the functional is defined on $M_k \( n - 1 \)$, whereas the tensor lies over $M_k \( n \)$. We first compute the Milnor coinvariants and Cartier map, then obtain the functional’s exponent bound. The Tor injection and the remaining square calculations will turn that bound into the asserted tensor obstruction.

=== 5.1 Milnor primitives and coinvariants <milnor-primitives-and-coinvariants>

Let $E subset A$ be the exterior sub-Hopf algebra on the Milnor primitives $q_i$, indexed by $\| q_i \| = 2^(i + 1) - 1$ for $i gt.eq 0$. Put $I_E = E^(> 0)$.

#thm([Lemma 5.2.])[
  #emph[There is a quotient homomorphism 
$ V : A arrow.r A \, #h(2em) V \( "Sq"^(2 a) \) = "Sq"^a \, #h(2em) V \( "Sq"^(2 a + 1) \) = 0 \, $

 where the target is regarded as having doubled degrees. Its kernel is 
$ K = I_E A = A I_E . $

 Consequently $H_0 \( E \, M \) = M \/ I_E M$ is naturally a module over $A \/ K$, for every $A$-module $M$.]
] <lem:algebra-milnor-quotient>

#proof[
  Milnor’s polynomial dual and coproduct description #cite(label("Milnor1958")) §5, Theorem 3, and Appendix 1 gives $A_(*) = bb(F)_2 \[ xi_1 \, xi_2 \, dots.h \]$. It implies that restriction to $E_(*)$ is the quotient by the squares of these generators: their images are the exterior generators dual to the Milnor primitives. Squaring is an injective Hopf algebra homomorphism on $A_(*)$; its degreewise dual is the indicated map $V$. The formulas on the squares follow by pairing with the powers of $xi_1$.
  For completeness, the kernel can be read directly from the Milnor coproduct. After restricting its first factor to $E_(*)$, that coproduct becomes
  $ xi_i mapsto macron(xi)_i ⊗ 1 + 1 ⊗ xi_i . $
  The other terms have an even positive exponent in the first factor and therefore vanish. A polynomial has trivial coaction under this map exactly when it is a square: the coefficients of the single generators $macron(xi)_i$ are its ordinary partial derivatives, and their simultaneous vanishing in characteristic two is equivalent to every exponent being even. Conversely, a square has trivial coaction since $macron(xi)_i^2 = 0$. Thus the annihilator of $I_E A$ is exactly the subalgebra of squares, which also annihilates $ker V$. Degreewise duality proves $I_E A = ker V$. Conjugation preserves $E$ and the subalgebra of squares in $A_(*)$, so it also gives $A I_E = ker V$. Finally $K M = I_E M$, using $K = I_E A$ and $A M = M$, and hence the stated quotient module is well defined. ◻
]

#thm([Lemma 5.3.])[
  #emph[The first $k$ Milnor primitives act on $D_k$ by 
#[#set math.equation(numbering: n => "(26)")
 $ q_i = d_0 frac(partial, partial d_(i + 1)) quad \( 0 lt.eq i < k - 1 \) \, #h(2em) q_(k - 1) = d_0 sum_(j = 0)^(k - 1) d_j frac(partial, partial d_j) . $ <eq:milnor-action>]

 Every later primitive is a linear combination of these with coefficients that are squares in $D_k$. All ideals $d_0^p D_k$, $p gt.eq 0$, are $A$-submodules.]
  #emph[The quotient $H_0 \( E \, d_0^p D_k \)$ has a monomial basis consisting of all monomials of $d_0$-exponent $p$, together with 
#[#set math.equation(numbering: n => "(27)")
 $ d_0^c product_(j = 1)^(k - 1) d_j^(b_j) \, #h(2em) c > p \, quad c equiv k med \( mod med 2 \) \, quad b_j upright(" odd for every ") j gt.eq 1 . $ <eq:coinvariants>]

]
] <lem:milnor-coinvariants>

#proof[
  The $q_i$ are derivations and $q_i x_s = x_s^(2^(i + 1))$. The initial formulas on Dickson generators appear in #cite(label("Wilkerson1983")) Corollary 2.3(b) and are also recorded, with indexing shifted by one, in #cite(label("Sum2020")) Proposition 2.3; we give the calculation. Apply $q_i$ to $P \( x_s \) = 0$. Only the linear power of $x_s$ contributes a derivative, so
  $ sum_(j = 0)^(k - 1) q_i \( d_j \) x_s^(2^j) = d_0 x_s^(2^(i + 1)) . $
  This identity holds on the whole binary span of the $x_s$, by additivity. A linearized polynomial of degree at most $2^(k - 1)$ is uniquely determined by its values on that span: the difference of two such polynomials cannot have $2^k$ distinct roots unless it is zero. For $i < k - 1$ this gives the partial-derivative formula. For $i = k - 1$, substituting $x_s^(2^k) = sum_(j < k) d_j x_s^(2^j)$ gives the Euler formula.
  For $t gt.eq 0$, raising the same root equation to the power $2^(t + 1)$ gives, as an equality of derivations on $P_k$,
  $ q_(k + t) = sum_(j = 0)^(k - 1) d_j^(2^(t + 1)) q_(j + t) . $
  Induction on $t$ expresses every later primitive in the first $k$ with square coefficients. These coefficients belong to $D_k$.
  Since $d_0$ is the product of the nonzero binary linear forms and the total square of such a form $a$ is $a + a^2$, the total square of $d_0$ is divisible by $d_0$. Its quotient is invariant and therefore belongs to $D_k$. The Cartan formula now proves the stability of every $d_0^p D_k$.
  Each nonzero term in (26) raises the $d_0$-exponent by exactly one. Thus no monomial at exponent $p$ is hit. Above this floor, a monomial with some even $b_j$ is the $q_(j - 1)$-image of the monomial obtained by decreasing $c$ by one and increasing $b_j$ by one. This preimage is still in $d_0^p D_k$. If all $b_j$ are odd, the Euler primitive on the monomial at exponent $c - 1$ has coefficient
  $ \( c - 1 \) + sum_(j = 1)^(k - 1) b_j equiv c + k med \( mod med 2 \) . $
  It hits the given monomial exactly when $c equiv.not k med \( mod med 2 \)$. The images of the first $k$ primitives are spanned by these individual monomials. Later primitives add no new images: a square coefficient passes inside any of the derivations. This proves the basis assertion, including the case $k = 1$, when the list of $b_j$ is empty. ◻
]

=== 5.2 Cartier halving, with its exponent threshold <cartier-halving-with-its-exponent-threshold>

We call the span of the monomials in (27) the #emph[above-floor part] of the coinvariants. The following lemma keeps track both of the action and of the first exponent in this part.

#thm([Lemma 5.4.])[
  #emph[The above-floor part of $H_0 \( E \, d_0^p D_k \)$ is an $A \/ K$-submodule. After identifying $A \/ K$ with the Steenrod algebra by halving degrees, the map 
#[#set math.equation(numbering: n => "(28)")
 $ C : quad d_0^c product_(j = 1)^(k - 1) d_j^(b_j) mapsto d_0^(\( c + k - 2 \) \/ 2) product_(j = 1)^(k - 1) d_j^(\( b_j - 1 \) \/ 2) $ <eq:cartier>]

 identifies it with an ideal in $D_k$. More precisely, if $c_0$ is the least integer greater than $p$ with $c_0 equiv k med \( mod med 2 \)$, the target ideal is $d_0^(\( c_0 + k - 2 \) \/ 2) D_k$. Internal polynomial degrees transform by $d mapsto \( d - k \) \/ 2$.]
] <lem:cartier>

#proof[
  On $P_k$ define $C_x$ to be zero on a monomial unless all its exponents are odd, and in the latter case set
  $ C_x \( x_1^(2 a_1 + 1) dots.h.c x_k^(2 a_k + 1) \) = x_1^(a_1) dots.h.c x_k^(a_k) . $
  This is the dual Kameko squaring map #cite(label("Kameko1990")); see #cite(label("Hung2005")) §2, p. 4069 for the dual formula. It is also the polynomial top-form version of Cartier’s differential-form construction #cite(label("Cartier1957")); see also #cite(label("Cartier1958")) Chapter II, §6, pp. 200–203. We include the polynomial identities and naturality needed for its restriction to the present ideals. The binomial formula for squares on a one-variable polynomial, together with the Cartan formula, gives
  #[#set math.equation(numbering: n => "(29)")
   $ C_x "Sq"^(2 i) = "Sq"^i C_x \, #h(2em) C_x "Sq"^(2 i + 1) = 0 \, #h(2em) C_x \( a^2 f \) = a C_x \( f \) . $ <eq:algebra-cartier-action>]
  Indeed, on an odd exponent the parity of $binom(2 a + 1, 2 i)$ is the parity of $binom(a, i)$; an odd square makes that exponent even. An even input exponent can never contribute an odd output exponent, since the corresponding binomial coefficient then vanishes. Applying these facts in all variables proves the identities.
  The operator $C_x$ commutes with $"GL"_k \( bb(F)_2 \)$. To see this, write a polynomial uniquely as a sum of square-free monomials with square coefficients. The coefficient of $x_1 dots.h.c x_k$ after a linear change of variables is multiplied by its determinant; no square-free monomial of smaller degree can contribute to that coefficient. Over $bb(F)_2$ the determinant is one, and taking the square root of the coefficient commutes with the linear change of variables. Hence $C_x$ preserves $D_k$.
  We compute this restriction by an elementary form of Cartier naturality. If $y_1 \, dots.h \, y_k$ are algebraically independent polynomials and $J = det \( partial y_j \/ partial x_i \)$, then
  #[#set math.equation(numbering: n => "(30)")
   $ C_x #scale(x: 120%, y: 120%)[\(] J f \( y_1 \, dots.h \, y_k \) #scale(x: 120%, y: 120%)[\)] = J thin C_y \( f \) \( y_1 \, dots.h \, y_k \) . $ <eq:algebra-cartier-jacobian>]
  Here $C_y$ is the same odd-exponent extractor in formal variables $y_j$. For a proof, the polynomial differential-form complex in one variable has cohomology generated by $1$ and $\[ x thin d x \]$ over $bb(F)_2 \[ x^2 \]$. Tensoring these complexes gives the corresponding assertion in $k$ variables. Thus there is an isomorphism from the algebra of forms, regarded without differential, to its cohomology, given by
  $ f mapsto f^2 \, #h(2em) d x_i mapsto \[ x_i thin d x_i \] . $
  This isomorphism is natural under polynomial substitution. On differentials the required fact is that $f mapsto \[ f thin d f \]$ is additive and satisfies the derivation rule with coefficients squared: its additivity follows because the cross term is $d \( f g \)$, and its product rule follows by expanding $\( f g \) d \( f g \)$. In top degree the inverse isomorphism sends $\[ h thin d x_1 dots.h.c d x_k \]$ to $C_x \( h \) thin d x_1 dots.h.c d x_k$. Pulling back a top form in the $y$ variables proves (30).
  For Dickson coordinates $y_j = d_(j - 1)$ the Jacobian is
  #[#set math.equation(numbering: n => "(31)")
   $ J = d_0^(k - 1) . $ <eq:algebra-dickson-jacobian>]
  In fact, differentiating $P \( x_s \) = 0$ with respect to each $x_i$ gives the matrix identity whose two factors have entries $x_s^(2^j)$ and $partial d_j \/ partial x_i$, and whose product is $d_0$ times the identity matrix. The determinant of the first factor is $d_0$: it is nonzero, is divisible by every nonzero binary linear form, and has degree $2^k - 1$. Taking determinants gives (31).
  For $c gt.eq k - 1$, apply (30) to $f = d_0^(c - k + 1) product_(j gt.eq 1) d_j^(b_j)$. It is zero unless $c equiv k med \( mod med 2 \)$ and every $b_j$ is odd; otherwise it is exactly (28). The same assertion holds for smaller nonnegative $c$. Multiply first by a sufficiently large even power $d_0^(2 N)$, use $C_x \( d_0^(2 N) f \) = d_0^N C_x \( f \)$, and cancel $d_0^N$ in the polynomial domain. The output exponents in the nonzero cases are nonnegative.
  The description of the hits in Lemma 22 now shows that $C_x$ descends to coinvariants and is a bijection on the stated above-floor monomials. Squares do not decrease the $d_0$-exponent: this follows from the divisibility of the total square of $d_0$ used above and the Cartan formula. Consequently the above-floor span is a submodule. Equation (29) gives the claimed action on its image. The least possible target exponent is the one displayed in the statement, and a direct degree calculation in (28) gives the change $d mapsto \( d - k \) \/ 2$. ◻
]

#prodef([Remark 5.5.])[
  On its image, the inverse monomial transformation in (28) is $f mapsto f^2 d_0^(2 - k) d_1 dots.h.c d_(k - 1)$, with nonnegative resulting exponents. Giambalvo and Peterson use this transformation in their study of Dickson ideals #cite(label("GiambalvoPeterson2001")) §4. Lemma 23 specifies the simultaneous Milnor-coinvariant quotient and the exact exponent floor used in the argument here.
]

=== 5.3 The lifted functional and its exponent bound <the-lifted-functional-and-its-exponent-bound>

We first use Cartier halving on the functional from the preceding level. Its ideal has exponent floor $n - 1$, while the monomial it detects already belongs to the next ideal, with floor $n$. The resulting bound will control which ideal occurs when we halve the tensor itself, including whether the floor can contribute.

#thm([Lemma 5.6.])[
  #emph[Let $n = e + 1 > 0$, let $m$ be even, and let $v$ be a degree-$m$ monomial in $M_k \( n \)$ with $d_0$-exponent $c$. Suppose that its underlying monomial is detected by an annihilated functional on $M_k \( e \)$ in degree $m - 1$. If $b = 2^(nu_2 \( m \))$, then 
#[#set math.equation(numbering: n => "(32)")
 $ n equiv k med \( mod med b \) \, #h(2em) c gt.eq n + b - 2 . $ <eq:halving-bounds>]

 If $m$ is a power of two, this functional hypothesis alone forces $n = k = 1$.]
] <lem:algebra-functional-halving>

#proof[
  The monomial lies above the exponent floor $e$ in $M_k \( e \)$. Since the functional factors through exterior coinvariants, Lemma 22 forces $c equiv k med \( mod med 2 \)$ and all its other exponents to be odd. Its total degree there is $m - 1$, so (24) gives $n equiv k med \( mod med 2 \)$.
  Restrict the induced functional to the above-floor submodule and use Lemma 23. The first allowed exponent in this submodule is $c = n$, so its image has first exponent
  $ e' = frac(n + k - 2, 2) . $
  Give that image the grading shift $e'$, and put
  #[#set math.equation(numbering: n => "(33)")
   $ m' = m / 2 \, #h(2em) n' = frac(n + k, 2) \, #h(2em) e' = n' - 1 \, #h(2em) c' = frac(c + k - 2, 2) . $ <eq:algebra-functional-recursion>]
  The image is exactly $M_k \( e' \)$, and its paired monomial has degree $m' - 1$: if the old internal degree is $d$, then $e' + \( d - k \) \/ 2 = \( m - 2 \) \/ 2$. The new functional is again annihilated, because the Cartier map intertwines the halved action. If $m'$ is even, its paired monomial cannot be at the floor $c' = e'$; a monomial at that floor has even total degree, whereas $m' - 1$ is odd. It therefore lies in the next ideal and satisfies the same hypothesis, allowing the step to repeat.
  Iterate while the paired parameter $m$ is even, for $t = nu_2 \( m \)$ steps. With $b = 2^t$, the resulting parameters obey
  $ n_t = frac(n + \( b - 1 \) k, b) \, #h(2em) c_t - n_t + 2 = frac(c - n + 2, b) \, #h(2em) c_t gt.eq n_t - 1 . $
  The integrality of $n_t$ gives the congruence in (32), and the last two relations give its inequality. All shifts $e_t = n_t - 1$ are nonnegative.
  If $m = b$, the final paired monomial has degree zero in $M_k \( e_t \)$. The smallest degree in that module is $2^k e_t$, so $e_t = 0$. Thus
  $ n + \( m - 1 \) k = m . $
  Since $n \, k gt.eq 1$, this equality forces $n = k = 1$. ◻
]

=== 5.4 Injectivity for degree-one Tor <injectivity-for-degree-one-tor>

The exact sequence $0 arrow.r I arrow.r A arrow.r bb(F)_2 arrow.r 0$ identifies $"Tor"_1^A \( bb(F)_2 \, M \)$ with the kernel of the action map $I ⊗_A M arrow.r M$. We refer to elements of this kernel as #emph[cycles]. A cycle represents zero precisely when it is zero in the balanced tensor product.

#thm([Lemma 5.7.])[
  #emph[Let $n gt.eq 0$ and $n equiv k med \( mod med 2 \)$. On cycles of even total degree, the projection 
#[#set math.equation(numbering: n => "(34)")
 $ I ⊗_A M_k \( n \) arrow.r I_(A \/ K) ⊗_(A \/ K) H_0 \( E \, M_k \( n \) \) $ <eq:tor-injection>]

 is injective.]
] <lem:tor-injection>

#proof[
  Put $M = M_k \( n \)$ and $B = A \/ K$. The exact sequence of right $A$-modules $K arrow.r I arrow.r I_B arrow.r 0$, followed by tensoring with $M$, shows that the kernel of (34) is the image of $K ⊗_A M$. Here we have used
  $ I_B ⊗_A M = I_B ⊗_B \( B ⊗_A M \) = I_B ⊗_B H_0 \( E \, M \) . $
  Multiplication gives a surjection $I_E ⊗_E A arrow.r K = I_E A$; tensoring again gives a surjection $I_E ⊗_E M arrow.r K ⊗_A M$. Thus every element in this kernel has a preimage in $I_E ⊗_E M$. The action maps from both tensor products to $M$ commute with this map. A preimage of a cycle is therefore a cycle itself.
  We prove that every even-total-degree cycle in $I_E ⊗_E M$ is zero. Write a homogeneous such cycle as
  $ z = sum_i q_i ⊗ z_i . $
  Each $z_i$ has odd total degree in $M$. By (24), its monomials have $d_0$-exponent $c gt.eq n + 1$ and parity opposite to $n$, hence opposite to $k$. Lemma 22 gives $z_i in I_E M$.
  This last property allows us to replace later primitives by the first $k$ inside the tensor product. If $q_i = sum_(j < k) a_j^2 q_j$ on $M$, then
  #[#set math.equation(numbering: n => "(35)")
   $ q_i ⊗ z_i = sum_(j < k) q_j ⊗ a_j^2 z_i #h(2em) \( z_i in I_E M \) . $ <eq:algebra-hit-balancing>]
  It suffices to check this for $z_i = q_s y$. Balancing, commutativity of the exterior generators, and their vanishing on squares give
  $ q_i ⊗ q_s y & = q_s ⊗ q_i y = sum_(j < k) q_s ⊗ a_j^2 q_j y\
 & = sum_(j < k) q_s ⊗ q_j \( a_j^2 y \) = sum_(j < k) q_j ⊗ a_j^2 q_s y . $
  Thus $z$ has a cycle representative using only $q_j$, $j < k$, whose coefficients still have exponents at least $n + 1$.
  Let $E_(\[ k \]) = Lambda \( q_0 \, dots.h \, q_(k - 1) \)$ and $L = D_k \[ d_0^(- 1) \]$. We first show that $L$ is projective over $E_(\[ k \])$. For $T subset.eq { 0 \, dots.h \, k - 1 }$ write $q_T = product_(i in T) q_i$, and put
  $ v_0 = d_0^(- k) product_(j = 1)^(k - 1) d_j . $
  The first $k - 1$ primitives take $v_0$ to $d_0^(- 1)$, and the last, Euler primitive takes $d_0^(- 1)$ to $1$. Hence $q_({ 0 \, dots.h \, k - 1 }) v_0 = 1$. The action map from the free module $E_(\[ k \]) ⊗_(bb(F)_2) L$ to $L$ has the following section:
  #[#set math.equation(numbering: n => "(36)")
   $ s \( x \) = sum_(T subset.eq { 0 \, dots.h \, k - 1 }) q_T ⊗ v_0 #scale(x: 120%, y: 120%)[\(] q_(T^c) x #scale(x: 120%, y: 120%)[\)] . $ <eq:algebra-projective-section>]
  It is $E_(\[ k \])$-linear: multiplying its first factor by $q_i$ and reindexing the subsets gives $s \( q_i x \)$, since terms with repeated $q_i$ vanish. To compute the composite with the action map, expand each $q_T \( v_0 q_(T^c) x \)$ by the Cartan formula. For a fixed subset $U$, the term $\( q_U v_0 \) \( q_(U^c) x \)$ occurs once for every $T$ with $U subset.eq T subset.eq { 0 \, dots.h \, k - 1 }$. Its coefficient is $2^(k - \| U \|)$, so only the full subset remains. The composite is therefore $x$. The formula preserves degrees, since $v_0$ has the negative of the degree of the product of all the $q_i$. This proves the asserted projectivity.
  Consider now the tensor product of the usual periodic free resolutions for the one-generator exterior algebras. After tensoring with an $E_(\[ k \])$-module, its first differential is
  $ \( u_0 \, dots.h \, u_(k - 1) \) mapsto sum_(i < k) q_i u_i . $
  The degree-two terms have one generator for each repeated pair $i \, i$ and each distinct pair $i \, j$. Writing $e_i$ for the degree-one generators, their images are
  $ e_i ⊗ q_i y \, #h(2em) e_i ⊗ q_j y + e_j ⊗ q_i y quad \( i < j \) . $
  The cokernel of this differential is $I_(E_(\[ k \])) ⊗_(E_(\[ k \])) M$: the displayed relations become $q_i^2 ⊗ y = 0$ and $\( q_i q_j + q_j q_i \) ⊗ y = 0$ under balancing. Projectivity of $L$ implies that every degree-one cycle in this complex with coefficients in $L$ has a degree-two filling.
  Apply this to the cycle representative obtained above, ignoring its harmless shift by $n$. Choose a filling with Laurent-polynomial coefficients. In each of the first two differentials, every nonzero term raises the $d_0$-exponent of its coefficient by exactly one, by (26). Delete from the filling all monomials with exponent less than $n$. Their differential has exponents at most $n$, whereas the retained part has exponents at least $n + 1$. Since the given cycle has only exponents at least $n + 1$, the retained part is still a filling. Its coefficients belong to $d_0^n D_k$. All Laurent polynomials and sums used here are finite, so this deletion requires no completion.
  We have proved that the representative is a boundary already over $E_(\[ k \])$ with coefficients in $M$. Equivalently, it is zero in $I_(E_(\[ k \])) ⊗_(E_(\[ k \])) M$, and hence also in $I_E ⊗_E M$. Its image in $I ⊗_A M$ is zero, which proves the lemma. ◻
]

=== 5.5 Proof of the obstruction lemma <proof-of-the-obstruction-lemma>

#thm([Lemma 5.8.])[
  #emph[If $n > 0$, $m gt.eq 3$ is odd, and $v in M_k \( n \)$ is homogeneous of degree $m$, then $"Sq"^m ⊗ v = 0$ in $I ⊗_A M_k \( n \)$.]
] <lem:algebra-odd-tensor>

#proof[
  The Adem relation $"Sq"^m = "Sq"^1 "Sq"^(m - 1)$ gives $"Sq"^m ⊗ v = "Sq"^1 ⊗ "Sq"^(m - 1) v$. For $n gt.eq 2$ the second operation exceeds the internal polynomial degree $m - n$, so this is zero. For $n = 1$ it is the internal square $v^2$. By linearity we may take $v = d_0^c product_(j gt.eq 1) d_j^(b_j)$, where $c gt.eq 1$. For $k gt.eq 2$, formula (26) gives
  $ v^2 = "Sq"^1 (d_0^(2 c - 1) d_1^(2 b_1 + 1) product_(j = 2)^(k - 1) d_j^(2 b_j)) . $
  The preimage belongs to $d_0 D_k$. For $k = 1$ use instead $"Sq"^1 \( d_0^(2 c - 1) \) = d_0^(2 c)$. Balancing once more and using $\( "Sq"^1 \)^2 = 0$ proves the assertion. ◻
]

The even-degree argument below uses the following square formulas only in its final case. These are the square-action formulas of Hai and Hung, recorded in #cite(label("Hung1991")) Theorem B; the proof below uses the root-polynomial method of #cite(label("Wilkerson1983")) §II.

#thm([Lemma 5.9.])[
  #emph[The total Steenrod square on a Dickson generator is 
#[#set math.equation(numbering: n => "(37)")
 $ "Sq" \( d_j \) = d_j^2 + (sum_(i = 0)^j d_i) (sum_(a = j + 1)^k d_a) . $ <eq:algebra-total-dickson-square>]

 In particular the operation one below the top on $d_j$ is $d_0 d_(j + 1)$. For a positive-degree monomial $v = product_(j = 0)^(k - 1) d_j^(b_j)$ of internal degree $d$, 
#[#set math.equation(numbering: n => "(38)")
 $ "Sq"^(d - 1) v = v^2 sum_(j : med b_j med upright("odd")) frac(d_0 d_(j + 1), d_j^2) . $ <eq:algebra-one-below-top>]

 Every displayed summand is a polynomial.]
] <lem:algebra-near-top-square>

#proof[
  Apply the total square simultaneously to the variables $x_s$ and $U$ in (23). Since $"Sq" \( U + a \) = \( U + a \) \( U + a + 1 \)$ and $P$ is additive,
  $ sum_(j = 0)^k "Sq" \( d_j \) \( U + U^2 \)^(2^j) = P \( U \) P \( U + 1 \) = P \( U \)^2 + P \( 1 \) P \( U \) . $
  Comparison of the coefficients of $U^(2^j)$ gives $"Sq" \( d_0 \) = P \( 1 \) d_0$ and, for $1 lt.eq j < k$,
  $ "Sq" \( d_j \) + "Sq" \( d_(j - 1) \) = d_(j - 1)^2 + P \( 1 \) d_j . $
  Summing these identities yields
  $ "Sq" \( d_j \) = P \( 1 \) sum_(i = 0)^j d_i + sum_(i = 0)^(j - 1) d_i^2 \, $
  which is (37). The term of degree $2 \| d_j \| - 1$ in that formula is exactly $d_0 d_(j + 1)$. In the Cartan expansion of an operation one below the top on a product, exactly one factor receives its operation one below the top and every other factor receives its top operation. Equal choices cancel in pairs, leaving precisely (38). ◻
]

#thm([Lemma 5.10.])[
  #emph[Let $m$ be even and not a power of two, let $b = 2^(nu_2 \( m \))$, and let $v in M_k \( n \)$ be a degree-$m$ monomial with $n > 0$ and $d_0$-exponent $c$. If (32) holds, then $"Sq"^m ⊗ v = 0$ in $I ⊗_A M_k \( n \)$.]
] <lem:algebra-even-vanishing>

#proof[
  The tensor is a cycle, because $"Sq"^m$ exceeds the internal degree $m - n$ of $v$. We induct on $nu_2 \( m \)$, using Lemma 26 throughout; its parity assumption follows from (32). Here we halve coinvariants of the current ideal, with floor $n$. This differs from the floor $n - 1$ used for the functional in Lemma 25.
  Suppose first that $b gt.eq 4$. The image of $v$ in exterior coinvariants is either zero, in which case the injectivity lemma gives the result immediately, or is an above-floor survivor. Indeed $c gt.eq n + b - 2 gt.eq n + 2$. In this case the first allowed exponent in the above-floor part of $M_k \( n \)$ is $n + 2$, and its Cartier image has first exponent
  $ n' = frac(n + k, 2) . $
  With this shift the image is $M_k \( n' \)$, with total degrees halved. The image of our cycle in (34) consequently comes from $"Sq"^(m \/ 2) ⊗ v'$ in $I ⊗_A M_k \( n' \)$, where $v' = C \( v \)$. Put $c' = \( c + k - 2 \) \/ 2$ and $b' = b \/ 2$. Then
  $ n' equiv k med \( mod med b' \) \, #h(2em) c' - n' + 2 = frac(c - n + 2, 2) gt.eq b' . $
  Thus the same bounds hold for $m \/ 2 \, n' \, c'$. Since $m \/ 2$ is still not a power of two, induction makes this latter tensor zero, and injectivity gives the required vanishing of the original cycle.
  It remains to treat $b = 2$. Write $m = 2 L$, with $L gt.eq 3$ odd. All coinvariants of $M_k \( n \)$ have even total degree: this is clear at the floor from (24), and above it from $c equiv k equiv n med \( mod med 2 \)$. Regrade them by half and call the resulting $A$-module $C_n$. The projected tensor is
  $ "Sq"^L ⊗ \[ v \] = "Sq"^1 ⊗ "Sq"^(L - 1) \[ v \] . $
  The second factor is the class of the original operation $"Sq"^(m - 2) v$. It suffices to show that this class is zero or an image of $"Sq"^1$ in $C_n$, since balancing then introduces $\( "Sq"^1 \)^2 = 0$.
  If $n gt.eq 3$, the operation already exceeds the internal degree of $v$. If $n = 2$, then $k$ is even and at least two, and the operation is the internal square $v^2$. This lies above the floor and has all nonzero-index exponents even, so it is zero in coinvariants by Lemma 22.
  Suppose $n = 1$, so $k$ is odd. For $k = 1$ the coinvariant basis, including the floor, consists of all odd monomials in $d_0$. The map $C_x$ identifies $C_1$ with $Sigma D_1$, and the image of $v = d_0^(2 L - 1)$ is $d_0^(L - 1)$. Its image under $"Sq"^(L - 1)$ is
  $ d_0^(2 L - 2) = "Sq"^1 \( d_0^(2 L - 3) \) \, $
  as required.
  Finally, suppose $n = 1$ and $k gt.eq 3$ is odd. The internal degree of $v$ is $m - 1$, so Lemma 28 applies to $"Sq"^(m - 2) v$. In each summand of (38), at most one exponent of $d_j$ with $j gt.eq 1$ is odd. Since there are at least two such indices, every term above the floor dies in exterior coinvariants. The only possible floor term comes from the index $j = 0$ when $v = d_0 w$, where $w$ involves only $d_j$, $j gt.eq 1$. It is $d_0 d_1 w^2$.
  This remaining term is an image for the halved first square. Formula (37) gives $"Sq"^2 d_2 = d_1$ and $"Sq"^1 d_0 = "Sq"^2 d_0 = 0$ for $k gt.eq 3$. Together with (26) and the Cartan formula, it therefore gives the explicit identity
  #[#set math.equation(numbering: n => "(39)")
   $ "Sq"^2 \( d_0 d_2 w^2 \) = d_0 d_1 w^2 + d_0^3 d_2 (frac(partial w, partial d_1))^2 . $ <eq:algebra-floor-witness>]
  The extra term is an exterior hit in $d_0 D_k$, with preimage
  $ q_0 (d_0^2 d_1 d_2 (frac(partial w, partial d_1))^2) = d_0^3 d_2 (frac(partial w, partial d_1))^2 . $
  Hence the class of $d_0 d_1 w^2$ is the original $"Sq"^2$-image of $\[ d_0 d_2 w^2 \]$, or equivalently a $"Sq"^1$-image after halving. This completes the final case, and the injectivity lemma finishes the proof. ◻
]

#proof[
  The odd assertion is Lemma 27. For even $m$, the functional hypothesis gives (32) by Lemma 25. If $m$ is not a power of two, Lemma 29 contradicts (25). If $m$ is a power of two, the last assertion of Lemma 25 gives $n = k = 1$. ◻
]

== 6 The last nonzero suspension and the sphere <sec:conclusion>

Let $alpha in pi_d^S$, $d > 0$, have nonzero mod-2 Hurewicz image. Represent it by $f_0 : S^d arrow.r Q_0 S^0$, and write

$ f_j : S^(d + j) arrow.r Q S^j \, #h(2em) z_j = h \( f_j \) = sigma_(*)^j h \( f_0 \) $

for the successive adjoints and their Hurewicz images. All the $z_j$ are primitive and $A$-annihilated. There is a largest $e gt.eq 0$ with $z_e eq.not 0$. Indeed, when $j > d$, the degree $d + j$ lies strictly between $j$ and $2 j$; the free infinite-loop homology description has no class in that interval.

#thm([Lemma 6.1.])[
  #emph[For some $m gt.eq 2$, 
#[#set math.equation(numbering: n => "(40)")
 $ z_e = w^2 \, #h(2em) \| w \| = m - 1 \, #h(2em) d + e = 2 m - 2 \, $ <eq:last-square>]

 where $w$ is primitive and $A$-annihilated, and $sigma_(*) w eq.not 0$. If $e gt.eq 1$, then $\| w \|$ is odd.]
] <lem:last-root>

#proof[
  Since $sigma_(*) z_e = 0$, Lemmas 11 and 12 give (40) with a primitive $A$-annihilated root. Its degree is positive, so $m gt.eq 2$.
  If $e = 0$ and $sigma_(*) w = 0$, the same lemmas make $w$ a square. Then $z_0$ is a fourth power, contradicting Proposition 16. Thus the root suspends nontrivially in this case.
  For $e gt.eq 1$, we instead use the preceding spherical class $z_(e - 1)$ to prove that $\| w \|$ is odd. First suppose that $e gt.eq 2$, so both levels have the direct weight decomposition of Lemma 9. Choose a nonzero weight $2^l$ component of $z_e$. Here $l gt.eq 1$, since the degree $d + e$ is greater than the bottom degree $e$. Its functional on $M_l \( e \)$ comes, after the grading shift, from the functional of $z_(e - 1)$ on $M_l \( e - 1 \)$. Vanishing of $z_(e + 1)$ says that it annihilates $d_0^(e + 1) D_l$, by (4). It must therefore pair nontrivially with some floor monomial
  $ d_0^e product_(j = 1)^(l - 1) d_j^(b_j) . $
  In $M_l \( e - 1 \)$ this monomial is above the floor. Since the lifted functional is $A$-annihilated, Lemma 22 gives
  $ e equiv l med \( mod med 2 \) \, #h(2em) b_j upright(" odd for every ") j gt.eq 1 . $
  The degree formula and (40) yield
  #[#set math.equation(numbering: n => "(41)")
   $ m - 1 = 2^(l - 1) e + sum_(j = 1)^(l - 1) \( 2^(l - 1) - 2^(j - 1) \) b_j . $ <eq:root-parity>]
  For $l gt.eq 2$, only the term with $j = 1$ is odd. For $l = 1$, the right side is $e$, which is odd by the congruence. Thus $m - 1$ is odd.
  If $e = 1$, (40) shows that $d$ is odd. Choose the leading weight $2^l$ of $z_0$. Lemma 10 says that it survives to $z_1$, with a functional lifted from the annihilated functional on $M_l \( 0 \)$. Since $z_2 = 0$, the same floor argument applies to this component of $z_1$, and again (41) proves that $m - 1$ is odd.
  An odd-degree class cannot be a square. Therefore the suspension-kernel and primitive-root lemmas imply $sigma_(*) w eq.not 0$ whenever $e gt.eq 1$. ◻
]

Set $n = e + 1$. The map

$ f_n : S^(2 m - 1) arrow.r T = Q S^n $

has zero Hurewicz image, and its previous adjoint has image $w^2$. The loop product under $Q S^(n - 1) tilde.eq Omega Q S^n$ agrees with the additive Pontryagin product. Thus Section 3 applies with $x = w$. The nonzero functional

#[#set math.equation(numbering: n => "(42)")
 $ lambda = chevron.l - \, sigma_(*) w chevron.r quad upright("on ") #scale(x: 120%, y: 120%)[\(] Q tilde(H)^(*) \( Q S^n \) #scale(x: 120%, y: 120%)[\)]^m $ <eq:last-functional>]

gives $"Sq"^m ⊗ v eq.not 0$ for every monomial $v$ on which it has value one.

We first deduce that $m$ is even. If $m$ were odd, then $m gt.eq 3$. Lemma 20 excludes a nonzero pairing on every $M_k \( n \)$ with $k gt.eq 1$. A bottom pairing requires $m = n$; on $M_0 \( n \) = Sigma^n bb(F)_2$, the balanced tensor product is the shift of $I \/ I^2$. But $"Sq"^m = "Sq"^1 "Sq"^(m - 1) in I^2$, contradicting Corollary 15. Since $lambda eq.not 0$, this rules out odd $m$.

#thm([Proposition 6.2.])[
  (The positive terminal stage).  #emph[If $e gt.eq 1$, then $alpha$ has nonzero mod-2 stable Hopf invariant and $d in { 1 \, 3 \, 7 }$.]
] <prop:hopf-case>

#proof[
  Suppose that $sigma_(*) w$ has a nonzero component of weight $2^k$ with $k gt.eq 1$. Its degree-$m$ functional on $M_k \( n \)$ is lifted from the $A$-annihilated functional of $w$ on $M_k \( e \)$. The nonzero tensor supplied by (42) therefore satisfies all the hypotheses of Lemma 20. That lemma forces $n = 1$, contrary to $n = e + 1 gt.eq 2$. Hence $lambda$ is nonzero on the bottom summand, giving
  $ m = n = e + 1 \, #h(2em) d = e . $
  Lemma 13 now says that the extension of the weight-one bottom class in $C_(f_n)$ has nonzero $"Sq"^n$, equal to the top relative class.
  Let $epsilon.alt : Sigma^oo Q S^n arrow.r Sigma^n S$ be the stable counit and define
  $ alpha_n = epsilon.alt compose Sigma^oo f_n : Sigma^(2 n - 1) S arrow.r Sigma^n S . $
  This is the stable adjoint representing $alpha$ in stem $d = n - 1$. The counit is the weight-one projection, by Proposition 4. The commutative square with identity on the attaching sphere induces a map
  $ Sigma^oo C_(f_n) arrow.r C_(alpha_n) $
  to the stable two-cell cofiber. Its pullback carries the bottom class to the weight-one bottom class and the top relative class to the top relative class. Both top relative classes inject in mod-2 cohomology. Naturality therefore makes $"Sq"^n$ nonzero in $C_(alpha_n)$. This is nonzero mod-2 stable Hopf detection of $alpha$.
  Adams’s Hopf invariant one theorem, in its stable two-cell form #cite(label("Adams1960")) Theorem 1.1.1(d), permits $n = 1 \, 2 \, 4 \, 8$. Since $d = n - 1 > 0$, we obtain $d = 1 \, 3 \, 7$. ◻
]

#thm([Proposition 6.3.])[
  (The terminal stage zero).  #emph[If $e = 0$, then for some $j gt.eq 1$, 
$ d = 2^(j + 1) - 2 \, $

 and $alpha$ has Kervaire invariant one.]
] <prop:kervaire-case>

#proof[
  #emph[Leading weight.] Here $n = 1$, and we have proved that $m$ is even. Thus $\| w \| = m - 1$ is odd. Choose the leading weight $2^k$ of $w$ in the level-zero expansion. It has $k gt.eq 1$, because $w$ has positive degree. By Lemma 10, this weight survives in $sigma_(*) w$, with functional lifted from an annihilated functional on $D_k = M_k \( 0 \)$. Combining Corollary 15 with Lemma 20 gives
  $ k = 1 \, #h(2em) m = 2^j quad upright("for some ") j gt.eq 1 . $
  Consequently $z_0 = w^2$ has leading weight four: its leading term is the square of the nonzero weight-two term, and Frobenius is injective in the associated free polynomial homology algebra. Also $d = 2 m - 2 = 2^(j + 1) - 2$.
  #emph[Adams filtration.] We bound the Adams filtration of the given element. Let $cal(I)$ be the augmentation ideal of $Sigma_(+)^oo Q S^0$. Kuhn’s lifting theorem #cite(label("Kuhn2018")) Theorems 1.2–1.3, applied to $X = S$ and the coefficient ring $H bb(F)_2$, says that an element of mod-2 Adams filtration at least $s_0$ has Hurewicz image lifted from $H bb(F)_2 and cal(I)^(2^(s_0))$, where $cal(I)^(2^(s_0))$ is the corresponding derived augmentation-ideal power of $Sigma_(+)^oo Q S^0$. Its hypotheses hold: both spectra are connective and $pi_0 S arrow.r pi_0 H bb(F)_2$ is onto. At the prime two the localization away from $\( p - 1 \) !$ in that theorem is vacuous. The theorem does not require $Q S^0$ to be connected.
  To use this with the leading weight, take the augmented algebra map
  $ Sigma_(+)^oo Q S^0 arrow.r bb(P)_(lt.eq 7) \( S { u } \) $
  from (8), and let $J$ denote the positive ideal in its target. Regard $J$ as a nonunital algebra in the full category of nonnegatively graded spectra, with ordinary Day convolution and with $J_r = 0$ for $r = 0$ and $r gt.eq 8$. Using the reduced commutative operad $upright("Com")$, whose arities are positive, its derived eighth power is the bar construction
  $ J^8 = B \( upright("Com")_(gt.eq 8) \, upright("Com") \, J \) \; $
  see #cite(label("Kuhn2018")) Definition 2.7 and #cite(label("KuhnPereira2017")) Definition 3.1 and Example 3.2. Compute this derived bar construction with a free resolution in strictly positive weights. Every simplicial summand then has at least eight inputs of weight at least one; no nullary operation can remove such an input. Its total weight is therefore at least eight. The canonical map $J^8 arrow.r J$ preserves weight and is zero, since $J$ has only weights one through seven. The direct-sum functor from the full graded category is strong symmetric monoidal and preserves realizations and homotopy orbits. It therefore carries the graded free resolution and bar construction to the corresponding ungraded derived construction, with the same zero canonical map. Extension of coefficients to $H bb(F)_2$ also preserves this construction #cite(label("KuhnPereira2017")) Theorem 3.4(d); in particular, the canonical map remains zero after smashing with $H bb(F)_2$.
  By naturality, the Hurewicz image of an element of Adams filtration at least three would vanish under every positive-weight projection below eight. The weight-four image just found is nonzero. Thus $alpha$ has Adams filtration at most two. This uses only a lower bound on possible weights; it does not identify Adams filtration with an exact weight.
  #emph[Kervaire detection.] Positive stable stems are finite by Serre’s finiteness theorem #cite(label("Serre1951")) Chapter V, §3, Proposition 3: choose an odd sphere dimension $N > d + 1$, so that $pi_(N + d) \( S^N \)$ is both stable and finite. Their odd-primary parts have zero mod-2 Hurewicz image and zero mod-2 detecting invariants, so we may discard them and use the convergent mod-2 Adams spectral sequence for the remaining two-primary group. More precisely, Adams’s convergence theorem identifies its successive filtration quotients with $E_oo$ and its filtration intersection with the prime-to-two torsion, which has been removed #cite(label("Adams1958")) Theorem 2.1(i),(v),(vi). Write $F^s pi_d^S$ for the subgroup of Adams filtration at least $s$ in this two-primary group. Filtration zero has no positive-stem sphere class. Filtration one has internal degrees $2^a$, hence stems $2^a - 1$; none is the positive even stem in question. In filtration two, the classical calculation #cite(label("Adams1960")) Theorem 2.5.1(1)–(2) gives basis elements $h_b h_a$, where $b gt.eq a gt.eq 0$ and $b eq.not a + 1$. The identity $2^a + 2^b = 2^(j + 1)$ forces $a = b = j$. Therefore
  $ "Ext"_A^(2 \, 2^(j + 1)) \( bb(F)_2 \, bb(F)_2 \) = bb(F)_2 { h_j^2 } \, $
  and the given element is detected by the surviving class $h_j^2$.
  Browder’s detection theorem identifies the framed Kervaire invariant of an individual stable sphere element with its detection by $h_j^2$. The original framed Arf identification and secondary pairing occur in #cite(label("Browder1969")) Theorem 3.2, Proposition 7.6 and Theorems 7.7–7.8; the precise elementwise statement is also recorded in #cite(label("BHHM2020")) Theorem 1.1. This statement includes the low framed cases $j = 1 \, 2 \, 3$. It applies to the particular $alpha$ above, whose nonzero class in $F^2 pi_d^S \/ F^3 pi_d^S$ is represented by the surviving $h_j^2$, and gives Kervaire invariant one.
  In particular the detector is unchanged by adding an element of $F^3 pi_d^S$. Such an element cannot be detected by a filtration-two class, so the same elementwise theorem gives it Kervaire invariant zero; additivity of the framed invariant gives the assertion. This use of Browder’s theorem concerns the invariant of each element, in addition to the existence of a permanent cycle. ◻
]

#proof[
  Every positive-degree stable class with nonzero Hurewicz image has a last nonzero suspension. Propositions 31 and 32 show that it has the stated nonzero Hopf or Kervaire invariant. These two degree cases are disjoint.
  In a Hopf degree, choose the corresponding class among $eta \, nu \, sigma$. In a Kervaire degree, choose any Kervaire-invariant-one representative $theta_j$; its existence in this case is already supplied by the class under discussion. Each detecting invariant is additive with values in $bb(F)_2$. For the stable Hopf invariant, attach two top cells to the same bottom sphere by representatives $alpha$ and $beta$. If $u$ is the bottom class and $a_alpha \, a_beta$ are the relative top classes, naturality on the two one-cell cofibers gives $"Sq"^(d + 1) u = H \( alpha \) a_alpha + H \( beta \) a_beta$. Pinching the attaching sphere induces a map from the cofiber of $alpha + beta$ to this two-attachment cofiber; it pulls both relative classes to the single top class. Naturality therefore gives $H \( alpha + beta \) = H \( alpha \) + H \( beta \)$. For the Kervaire invariant, disjoint union of framed manifolds takes their quadratic forms to orthogonal sums and adds their Arf invariants. Subtracting the chosen representative therefore gives an invariant-zero class. If this difference had nonzero Hurewicz image, the proved necessity would force its invariant to be one, a contradiction. Thus its Hurewicz image is zero.
  Every nonzero image is consequently the image of the chosen Hopf or Kervaire representative in that degree. These representative images themselves belong to the image, so they span it. No existence assertion for an additional $theta_j$ is used or obtained from this last step. This proves Curtis’s conjecture in all positive degrees. ◻
]

0pt


#bibliography("refs.bib", style: "ieee", title: [References])
