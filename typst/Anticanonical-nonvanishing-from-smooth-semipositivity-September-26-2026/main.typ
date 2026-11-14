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

#align(center)[#text(size: 16pt, weight: "bold")[Anticanonical nonvanishing from smooth semipositivity]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

For a smooth projective complex variety $X$, the anticanonical line bundle is $- K_X = det T_X$.
  A smooth Hermitian metric on this line is semipositive when its Chern curvature is a nonnegative real
  $\( 1 \, 1 \)$-form. Such a metric makes the numerical class nef.
  The nonvanishing question asks whether $H^0 \( X \, - m K_X \) eq.not 0$ for some integer $m > 0$,
  or equivalently whether some positive multiple of $- K_X$ is linearly equivalent to an effective divisor.

We prove the following nonvanishing theorem.

#thm([Theorem 1.1.])[
  (Anticanonical nonvanishing).  #emph[Let $X$ be a smooth connected projective variety over $bb(C)$.
    If $- K_X$ admits a smooth Hermitian metric of semipositive curvature,
    then $H^0 \( X \, - m K_X \) eq.not 0$ for some integer $m > 0$.]
] <thm:headline>

This is the positive-multiple formulation associated with Yau’s anticanonical nonvanishing question
  #cite(label("Yau1994")) Problem 75, p. 395. The multiple matters even when the anticanonical bundle is not
  torsion. For a complex Enriques surface $E$, $K_E$ is nontrivial of order two and has no section
  #cite(label("Dolgachev2016")) Section 3. Write $p_E$ and $p_(bb(P)^1)$ for the two projections from $E times
  bb(P)^1$. Its anticanonical line is

$ p_E^(*) \( - K_E \) ⊗ p_(bb(P)^1)^(*) cal(O)_(bb(P)^1) \( 2 \) . $

The flat metric on the first factor and Fubini–Study metric on the second make it smoothly semipositive.
  The product formula for sections gives no first-power section, whereas the square has sections.
  Restriction to a $bb(P)^1$ fiber shows that this anticanonical line is not torsion.

=== 1.1 Geometry, monodromy, and earlier methods <geometry-monodromy-and-earlier-methods>

The structure theory explains both the strength of the metric assumption and the difficulty that remains.
  Yau’s prescribed-Ricci theorem #cite(label("Yau1978")) realizes the given smooth semipositive anticanonical
  curvature as the Ricci form of a Kähler metric. The structure results of Demailly–Peternell–Schneider
  #cite(label("DPS1996")) Structure Theorem, p. 218 and Campana–Demailly–Peternell #cite(label("CDP2015"))
  Theorem 1.4 describe the universal cover by its flat, compact Ricci-flat, and remaining compact factors.
  The remaining factor is projective and has no holomorphic forms of positive degree.
  After passage to a finite-index deck subgroup, the actions that remain on this factor lie in a compact torus.

This last action cannot be ignored. A section on the compact factor descends only if it is compatible with the
  deck transformations. The flat and Ricci-flat factors supply canonical frames;
  on the remaining factor we construct an anticanonical section fixed by the torus,
  for the natural action on that factor’s anticanonical bundle.
  Its product with those frames descends to a finite étale cover,
  and its finite étale norm then gives a section on $X$. This reasoning uses the action on the universal cover,
  not a global product decomposition of a finite cover.

In the broader nef setting, Lazić–Matsumura–Peternell–Tsakanikas–Xie proved numerical effectivity for projective
  log canonical threefold pairs with rational boundary and nef log-anticanonical divisor,
  under $bb(Q)$-factoriality or rational singularities #cite(label("LMPTX2023")) Theorem A.
  Numerical effectivity means that the divisor class is numerically equivalent to an effective rational divisor;
  the existence of a section requires rational #emph[linear] effectivity.
  For projective klt $bb(Q)$-pairs with nef log-anticanonical divisor,
  Müller proved actual nonvanishing in dimension three, and in arbitrary dimension when the log-anticanonical
  divisor of a general fiber of the maximal rationally connected quotient is semiample #cite(label("Muller2025"))
  Theorem A and Corollary B. His equivariant theorem constructs naturally invariant plurisections of a semiample
  log-anticanonical divisor for boundary-preserving actions of commutative linear algebraic groups on projective
  sub-log-canonical $bb(Q)$-pairs #cite(label("Muller2025")) Theorem C.
  It is a direct methodological predecessor for addressing residual monodromy.
  Here the finite-volume argument constructs the needed naturally invariant section from smooth semipositivity,
  without assuming that fiber semiampleness.

In dimension two, Chen–Filip–Sun–Tosatti–Zhang have classified compact Kähler surfaces with Hermitian-semipositive
  anticanonical bundle #cite(label("CFSTZ2026")) Theorem 1.3.
  Their classification gives complementary low-dimensional geometry;
  the present argument develops a section-producing mechanism in arbitrary dimension.#footnote[The authors report
  that ChatGPT 5.6 Sol suggested a preliminary version of their Lemma 5.2, which they reformulated and developed.
  This records their declared assistance, not an attribution of authorship.]

The ordinary part of the proof builds on two further developments.
  Generic positivity and foliation methods control cotangent tensors:
  the relevant inputs come from movable-cone duality #cite(label("BDPP2013")),
  movable slope theory #cite(label("GKP2016")), and Campana–Păun’s positive-slope algebraicity criterion
  #cite(label("CampanaPaun2019")) Theorem 1.1. The slope argument follows the foliation strategy used by Ou
  #cite(label("Ou2023")) Theorem 1.4 and by Lazić–Matsumura–Peternell–Tsakanikas–Xie #cite(label("LMPTX2023"))
  Theorem 4.1. Here the relative Bergman metric supplies ramification-corrected positivity when an effective
  boundary and a finite adjoint measure replace nef anticanonical data.
  Hard Lefschetz with multiplier ideals #cite(label("DPS2001")) Theorem 2.1.1 then produces twisted forms,
  whose determinants are the effective divisors used to select a smaller base.

The transfer in Section 5 uses the relative Bergman metric of Berndtsson–Păun #cite(label("BerndtssonPaun2008"))
  Theorem 0.1. The ordinary proof uses its singular-coefficient form.
  The equivariant proof instead uses Berndtsson’s smooth direct-image positivity #cite(label("Berndtsson2009"))
  Theorem 1.2: averaging is an orthogonal holomorphic projection onto the invariant line.
  These are distinct applications of positivity, and we state their hypotheses separately.

=== 1.2 A finite-volume theorem and the proof strategy <sec:overview>

The inductive statement involves two line bundles. We use additive notation:
  $J + L$ means $J ⊗ L$, and $m L$ means $L^(⊗ m)$. For an effective integral divisor $D$,
  write $s_D$ for the canonical section of $cal(O)_Z \( D \)$.
  If $J = - K_Z + D$, this section is a $J$-valued holomorphic top form.
  A metric $h_J$ therefore pairs $s_D$ with its conjugate to give a measure, denoted $\| s_D \|_(h_J)^2$.

A singular metric has local squared frame norm $e^(- phi.alt)$.
  It is semipositive when $phi.alt$ is plurisubharmonic; locally bounded weights means bounds on both sides.

#thm([Theorem 1.2.])[
  (Finite volume and sections with prescribed poles).  #emph[Let $Z$ be a smooth connected projective complex
    variety of dimension $d$ with $H^0 \( Z \, Omega_Z^q \) = 0$ for every $1 lt.eq q lt.eq d$.
    Let $D gt.eq 0$ be an integral divisor. Suppose that $J = - K_Z +
    D$ has a semipositive singular Hermitian metric $h_J$ satisfying
$ integral_Z \| s_D \|_(h_J)^2 < oo . $

 If a line bundle $L$ on $Z$ has a semipositive singular Hermitian metric with locally bounded weights,
   then there exist integers $a > 0$ and $b gt.eq 0$ such that
$ H^0 \( Z \, a L + b D \) eq.not 0 . $

]
] <thm:finite-volume>

This generality is needed because a fibration need not transfer the line whose section is sought to the
  anticanonical bundle of its base. Its fiber integrals instead produce a new target line on the base and a
  separate corrected anticanonical line carrying the volume metric.
  The volume metric $h_J$ may be unbounded, provided the indicated measure is integrable.
  The metric on $L$ has the separate boundedness assumption.
  The conclusion says that a positive power of $L$ has a rational section with poles only on $D$;
  the pole order $b$ is not uniform. Rationally connected varieties satisfy the no-forms hypothesis,
  but the theorem also applies more generally. For example,
  an Enriques surface has no positive-degree holomorphic forms and a torsion canonical bundle,
  although it is not rationally connected.

Theorem 2 is proved by induction on dimension. We first describe how its components fit together.
  Assume that its conclusion fails. Then $L + D$ is pseudoeffective but not big.
  A supporting movable curve class $alpha eq.not 0$ satisfies $L dot.op alpha = D dot.op alpha = 0$.
  Finite adjoint volume bounds the slopes of cotangent tensors against $alpha$;
  in particular their determinant lines have nonpositive degree. This is the content of Section 4.

The absence of holomorphic forms gives $chi \( cal(O)_Z \) = 1$. Riemann–Roch and hard Lefschetz then produce sections

$ s_i in H^0 \( Z \, M + m_i L \) \, wide m_i arrow.r oo \, $

where $M$ is one fixed cotangent determinant with $M dot.op alpha lt.eq 0$.
  Consider all nonempty complete systems $\| u L + v M + w D \|$ with nonnegative integral coefficients.
  None can define a generically finite map: that would make its divisor big,
  contradicting its nonpositive pairing with $alpha$. Choose a system with maximal image dimension and take the
  relative algebraic closure of its image field in $bb(C) \( Z \)$.
  This gives a rational fibration onto a strictly smaller smooth projective base $S$.
  Products of sections force every ratio in the indicated systems to be a function on $S$.

This control of section ratios has two consequences. First,
  ratios among the $s_i$ give a rational section $rho$ of some $k L$, $k > 0$,
  with no poles on divisors dominating $S$. Second, on a smooth resolution $Y$ with maps $pi : Y arrow.r
  Z$ and $f : Y arrow.r S$, put $K_(Y \/ S) = K_Y - f^(*) K_S$.
  The relative adjoint spaces for $K_(Y \/ S) + pi^(*) \( J + j k L \)$ have dimension one for every $j gt.eq 0$.
  They are generated over the base field by the pulled-back form $s_D$ with its birational Jacobian,
  divided by a base canonical frame and multiplied by $rho^j$.
  We prove transfer first under these explicit hypotheses; Section 6 then constructs its inputs and closes the
  induction, including the extension and common denominator arguments.

Section 5 explains why these algebraic facts are the right ones.
  On a normal equidimensional model, minima of vertical divisor orders turn $rho$ into a regular section $e$ after
  subtracting a base line $A$. On a smooth resolution, integrate its powers against the pulled-back adjoint
  measure. The zeroth integral gives a metric on $- K_S + D_S$ with finite adjoint volume.
  Normalized high moments give a locally bounded semipositive metric on $A$.
  Normalization leaves $e$ nonzero on some component above every base divisor.
  When integrating $e^j$, the boundary estimate therefore has a fixed order, rather than one growing with $j$;
  dividing its logarithm by $j$ removes that boundary contribution.
  The correction $D_S$ is supported on base primes for which every component upstairs is exceptional over $Z$ or
  lies above $D$. Thus the induction hypothesis on $S$ yields a section that lifts with no forbidden pole on $Z$.

To obtain the torus-invariant section needed by the geometric reduction,
  Section 7 first proves the smooth invariant transfer statement, Proposition 12,
  and then applies it to a rational orbit space. Fundamental vector fields give the relative section,
  and a dense orbit gives invariant adjoint rank one in every degree.
  Smooth direct-image positivity applies to the invariant line because compact averaging is an orthogonal
  holomorphic projection. The ordinary theorem on the quotient base then produces a naturally invariant
  anticanonical section. The cover and norm results of Section 2 finish the proof of Theorem 1.

The proofs below establish the model preparation, slope bound,
  and rank and transfer arguments using the cited geometric and analytic results.
  Section 3 introduces the two birational models and the metric conventions used throughout.

== 2 Finite covers and residual monodromy <sec:cover>

A smooth semipositive anticanonical metric determines much of the geometry of the universal cover.
  The remaining issue for sections is the action of the deck group.
  We record the geometric reduction with that action retained,
  so that an invariant section on the final compact factor can later be descended to a finite cover of the
  original variety. The geometric inputs are the Ricci-semipositive structure theorem of
  Demailly–Peternell–Schneider #cite(label("DPS1996")) Structure Theorem and §3 and the rational-connectedness
  refinement of Campana–Demailly–Peternell #cite(label("CDP2015")) Theorem 1.4.

#thm([Theorem 2.1.])[
  (Finite cover with compact torus monodromy).  #emph[Let $X$ be a smooth connected projective complex variety
    whose anticanonical bundle has a smooth Hermitian metric of semipositive Chern curvature.
    There are a connected finite étale cover $nu : S arrow.r X$, an integer $a gt.eq 0$,
    and smooth connected projective varieties $F$ and $Z$ with the following properties.]
  + #emph[For a suitable Kähler metric on $X$, the common universal cover of $X$ and $S$ has a holomorphic
    isometric decomposition
#[#set math.equation(numbering: n => "(2.1)")
 $ tilde(X) = bb(C)^a times F times Z . $ <eq:cover-product>]

 The compact factors are simply connected. The induced metric on $F$ is Ricci-flat,
   and $K_F$ has a nowhere-zero parallel holomorphic section.
   The anticanonical bundle of $Z$ is smoothly semipositive, and
#[#set math.equation(numbering: n => "(2.2)")
 $ H^0 \( Z \, Omega_Z^p \) = 0 quad \( p > 0 \) \, wide H^q \( Z \, cal(O)_Z \) =
   0 quad \( q > 0 \) . $ <eq:cover-noforms>]

 The variety $Z$ is rationally connected when it has positive dimension.]
  + #emph[There are a full lattice $Lambda subset bb(C)^a$ and a homomorphism $rho : Lambda arrow.r
    "Aut" \( Z \)$ for which
#[#set math.equation(numbering: n => "(2.3)")
 $ S = \( bb(C)^a times F times Z \) \/ Lambda \, wide lambda
   dot.op \( z \, f \, v \) = \( z + lambda \, f \, rho \( lambda \) v \) . $ <eq:cover-action>]

 The closure $T$ of $rho \( Lambda \)$ in the holomorphic isometry group of $Z$ is a compact connected real torus.
   The trivial torus is allowed.]
  + #emph[The action of $T$ extends to an algebraic action of a complex algebraic torus $G$ on $Z$,
    with $T$ Zariski dense in $G$. On $K_Z^(- 1) = det T_Z$ the action is the natural one induced by the
    differential. For every $m gt.eq 0$, its representation on sections satisfies
#[#set math.equation(numbering: n => "(2.4)")
 $ H^0 \( Z \, K_Z^(- m) \)^T = H^0 \( Z \, K_Z^(- m) \)^G . $ <eq:cover-invariants>]

]
  + #emph[The canonical bundles of $bb(C)^a$ and $F$ have nowhere-zero holomorphic frames $eta_0$ and $eta_F$
    invariant under $Lambda$. For every integer $m gt.eq 0$, the product projections $"pr"_0$, $"pr"_F$,
    and $"pr"_Z$ give the natural, $Lambda$-equivariant identification
#[#set math.equation(numbering: n => "(2.5)")
 $ K_(tilde(X))^(- m) = "pr"_0^(*) K_(bb(C)^a)^(- m) ⊗ "pr"_F^(*) K_F^(- m) ⊗ "pr"_Z^(*) K_Z^(- m) \,
   $ <eq:cover-canonical>]

 in which the first two factors have the invariant frame $eta_0^(- m) ⊗ eta_F^(- m)$.]
  #emph[Any of the factors may be a point. A point contributes the canonical frame $1$; if $a = 0$,
    the lattice is the zero group.]
] <thm:structure>

The quotient in (2.3) describes a locally trivial bundle over $bb(C)^a \/ Lambda$.
  Its monodromy $rho$ can have infinite image, so the finite cover $S$ need not be a product.
  This is the reason for retaining the natural torus action on the anticanonical bundle.

#proof[
  We first obtain the product and its cohomological properties.
    We then choose a finite-index deck subgroup and identify its compact action with an algebraic torus action.
  #emph[The metric splitting and the compact factors.] The curvature form of the given metric on $K_X^(- 1)$ is a
    smooth semipositive representative of its first Chern class, with the usual normalizing factor.
    Yau’s prescribed-Ricci theorem therefore gives a Kähler metric on $X$ whose Ricci form is that curvature form
    #cite(label("Yau1978")); this application is also stated explicitly in #cite(label("DPS1996")) p. 218.
    In particular its Ricci tensor is nonnegative. The structure theorem of #cite(label("DPS1996")) gives a
    holomorphic isometric decomposition
  $ tilde(X) = bb(C)^a times product_i M_i \, $
  where each $M_i$ is compact and simply connected and the nonflat factors are irreducible in the real de Rham
    decomposition. The compactness of these factors is the Cheeger–Gromoll input in the structure theorem;
    the holomorphic decomposition comes from the parallel complex structure.
    Group the Ricci-flat factors into $F$ and the remaining factors into $Z$.
  Here is the Bochner argument for the part of this decomposition used below.
    On a compact Kähler manifold with nonnegative Ricci tensor, a holomorphic $p$-form $u$ is parallel.
    Moreover, if $lambda_1 \, dots.h \, lambda_n gt.eq 0$ are the Ricci eigenvalues in a unitary frame and $u =
    sum_(\| J \| = p) u_J thin d z_J$, the integrated Bochner formula forces the pointwise vanishing of
  $ sum_(\| J \| = p) (sum_(j in J) lambda_j) \| u_J \|^2 . $
  These are the Bochner consequences used in #cite(label("DPS1996")) §2;
    equivalently see the formula in #cite(label("CDP2015")) (1.6).
    In particular, contraction of $u$ with a positive Ricci eigendirection is zero.
    If $u eq.not 0$ on an irreducible factor, its contraction kernel
  $ { v in T^(1 \, 0) M_i : iota_v u = 0 } $
  is a proper parallel complex subbundle. At any point where the Ricci tensor is nonzero,
    that kernel is also nonzero. Its underlying real subbundle contradicts irreducibility.
    Thus every non-Ricci-flat factor has no nonzero holomorphic form of positive degree.
    The decomposition of exterior forms on a product and Kähler Hodge symmetry give (2.2).
    Rational connectedness of these factors, including the irreducible compact Hermitian-symmetric case,
    is the additional conclusion of #cite(label("CDP2015")) Theorem 1.4(a) and §4;
    it is not inferred merely from the vanishing of forms.
  The canonical Chern connection of the Ricci-flat factor $F$ is flat.
    Since $F$ is simply connected, parallel transport gives a nowhere-zero parallel holomorphic frame $eta_F$ of
    $K_F$. The metric induced on $K_Z^(- 1)$ has semipositive curvature,
    since the Ricci tensor of the product restricts to that of $Z$.
  Projectivity of each compact factor follows directly from that of $X$.
    Fix points in the other factors and compose its slice in $tilde(X)$ with the covering map to $X$.
    This holomorphic map has injective differential. Pulling back a positive Hermitian metric on an ample line
    bundle of $X$ therefore gives a positive line bundle on the compact factor.
    Kodaira’s embedding theorem makes that factor projective #cite(label("Kodaira1954")).
    The argument requires the slice map to be immersive, not injective.
  #emph[Choosing the deck subgroup.] Let $Gamma = pi_1 \( X \)$ act on $tilde(X)$ by deck transformations.
    These are holomorphic isometries. Uniqueness of the de Rham decomposition implies that,
    after a finite-index passage removing permutations of its factors, every deck transformation is a product map.
    Put $M = F times Z$. Projection of this deck subgroup to the Euclidean isometry group is discrete and has
    finite kernel. Indeed, for a fixed bound on the displacement of $0 in bb(C)^a$,
    a sufficiently large closed Euclidean ball $B$ satisfies
  $ gamma \( B times M \) ∩ \( B times M \) eq.not diameter $
  for every deck transformation within that bound. Since $B times M$ is compact,
    proper discontinuity allows only finitely many such transformations. This proves both assertions.
    The Euclidean image is cocompact, by compactness of the quotient of the full product.
    Bieberbach’s theorem supplies a finite-index translation lattice in this image,
    as in #cite(label("DPS1996")) §3(ii).
  For completeness, the finite kernel does not obstruct choosing an actual lattice subgroup of the deck group.
    Above the translation lattice we have an extension
  $ 1 arrow.r N arrow.r Gamma_1 arrow.r Lambda_1 arrow.r 0 $
  with $N$ finite. Pass to the centralizer of $N$ in $Gamma_1$;
    this has finite index because $"Aut" \( N \)$ is finite. Its kernel $N'$ is central,
    and its image $Lambda'$ is a sublattice of finite index in $Lambda_1$.
    Choose lifts $g_1 \, dots.h \, g_(2 a)$ of a lattice basis $lambda_1 \, dots.h \, lambda_(2 a)$ of $Lambda'$.
    Their commutators belong to $N'$. If $e > 0$ is divisible by the orders of all elements of $N'$, then
  $ \[ g_i^e \, g_j^e \] = \[ g_i \, g_j \]^(e^2) = 1 . $
  The commuting elements $g_i^e$ generate a free abelian subgroup:
    a relation among them projects to a relation among the independent vectors $e lambda_i$.
    Its image is $e Lambda'$, so this subgroup has finite index in the original deck group.
    In case $a = 0$, the deck group is finite and we instead take its trivial subgroup.
  We next eliminate the action on $F$. The holomorphic isometry group of a compact simply connected Ricci-flat
    manifold is finite. To see this, its Lie algebra consists of Killing fields.
    The integrated Bochner identity makes each such field parallel.
    Its dual one-form is closed and, by simple connectedness, exact.
    An exact parallel one-form on a compact manifold is zero:
    a primitive attains a maximum, where its differential vanishes.
    Thus the compact isometry group has zero-dimensional Lie algebra and is finite.
    Passing to the kernel of the action on $F$ preserves a finite-index lattice subgroup.
  The remaining action on $Z$ has commuting image in its compact holomorphic isometry group.
    Its closure is a compact abelian Lie group. Its identity component is a torus and its component group is
    finite. Pass once more to the preimage of that identity component.
    The new image is dense in the identity component, since the latter is open in the old closure.
    Denote this connected closure by $T$, the deck lattice by $Lambda$, and its action on $Z$ by $rho$.
    This proves (2.3).
  The corresponding quotient $S$ is a connected finite unramified holomorphic cover of $X$.
    The pulled-back positive line bundle makes $S$ projective,
    and the covering is a finite étale morphism of projective varieties.
    We have now accounted for every part of the deck action. In particular $eta_F$ is invariant because the action
    on $F$ is trivial, while $eta_0 = d z_1 and dots.h.c and d z_a$ is invariant under translations.
    The determinant of the product tangent decomposition gives (2.5), with its natural equivariance.
  #emph[The algebraic torus.] It remains to put the compact action on $Z$ in the algebraic category.
    The point case is immediate, so suppose $dim Z > 0$ and choose a very ample line bundle $A$ on $Z$.
    By (2.2), the exponential sequence makes
  $ c_1 : "Pic" \( Z \) arrow.r H^2 \( Z \, bb(Z) \) $
  injective. Every element of the connected group $T$ is isotopic to the identity and hence acts trivially on
    integral cohomology. Consequently $t^(*) A tilde.eq A$ for every $t in T$.
    The complete linear system of $A$ therefore defines a canonical projective representation
  $ T arrow.r "PGL" #scale(x: 120%, y: 120%)[\(] H^0 \( Z \, A \)^(*) #scale(x: 120%, y: 120%)[\)] $
  preserving the embedded variety $Z$. Choices of isomorphisms $t^(*) A tilde.eq
    A$ change the associated linear maps only by scalars, so this projective representation is well-defined.
    It is continuous: choose a projective frame from the nondegenerate irreducible embedded variety;
    a projective transformation is determined continuously by the images of that frame.
    Such a frame exists by first choosing a projective basis and then a point outside its finitely many coordinate
    hyperplanes.
  Write $r = dim H^0 \( Z \, A \)$. To diagonalize the compact projective action,
    take its compact preimage under the finite covering $"SL"_r \( bb(C) \) arrow.r "PGL"_r \( bb(C) \)$.
    The identity component of this preimage is abelian and surjects onto $T$:
    its Lie algebra maps isomorphically to the abelian Lie algebra of $T$,
    and its image is an open and closed subgroup of $T$. Averaging a Hermitian form makes this connected preimage
    unitary; its commuting matrices can then be diagonalized simultaneously.
    Thus, after conjugation, $T$ lies in a diagonal algebraic torus in $"PGL"_r \( bb(C) \)$.
  Let $G$ be its Zariski closure there. It is connected, since a connected $T$ cannot meet distinct components of
    an algebraic group without being disconnected. A connected algebraic subgroup of a diagonal torus is an
    algebraic torus. The projective stabilizer of $Z$ is Zariski closed,
    so $G$ preserves $Z$ and acts algebraically. Differentiation gives the natural algebraic linearization on
    $K_Z^(- 1)$. The induced finite-dimensional representation on $H^0 \( Z \, K_Z^(- m) \)$ is algebraic.
    The stabilizer of any section is Zariski closed, and Zariski density of $T$ proves (2.4).
    All the constructions respect point factors and the stated canonical-frame conventions. ◻
]

=== 2.1 The norm of a section <the-norm-of-a-section>

Once a section has been constructed on the finite cover, the following elementary norm returns it to the original
  variety. Its exponent is the degree of the cover; no uniform degree is needed in the application.

#thm([Lemma 2.2.])[
  (Finite étale norm).  #emph[Let $nu : S arrow.r X$ be a finite étale morphism of degree $d >
    0$ between smooth connected projective complex varieties, and let $A$ be a line bundle on $X$.
    Every nonzero section $s in H^0 \( S \, nu^(*) A \)$ has a nonzero norm
$ "Nm"_nu \( s \) in H^0 \( X \, A^(⊗ d) \) . $

 In particular, a nonzero section of $K_S^(- m)$, for $m > 0$, gives a nonzero section of $K_X^(- m d)$.]
] <lem:etale-norm>

#proof[
  Take an analytic open set $U subset X$ on which $A$ has a frame $e$ and the cover splits into $d$ sheets.
    On these sheets write $s = f_i nu^(*) e$ for holomorphic functions $f_1 \, dots.h \, f_d$. Define the local norm by
  $ (product_(i = 1)^d f_i) e^(⊗ d) . $
  This expression is unchanged by a permutation of the sheets.
    If the frame is replaced by $e' = u e$, the functions become $f'_i = f_i \/ u$;
    their product changes by $u^(- d)$ and the new tensor frame changes by $u^d$.
    The expressions therefore glue to a holomorphic section of $A^(⊗ d)$.
  Since $S$ is smooth and connected it is integral. The zero set of the nonzero section $s$ is thus proper and has
    dimension less than $dim S$ (or is empty). Its image under the finite map is a proper closed subset of $X$.
    Away from that image every sheetwise factor is nonzero, so the norm is nonzero.
    Projectivity identifies this holomorphic section with an algebraic section.
    Finally, $K_S = nu^(*) K_X$ because $nu$ is étale; applying the result with $A =
    K_X^(- m)$ proves the last assertion. In dimension zero the same construction is the product of nonzero constants. ◻
]

== 3 Measures and models for rational fibrations <sec:models>

The induction will transfer two metrics along a rational map.
  Divisor orders are best controlled on a normal equidimensional model; integration requires a smooth model.
  We first record how to retain both models at once. We also specify the analytic conventions behind the
  finite-volume hypothesis.

=== 3.1 Adjoint measures and extension of weights <adjoint-measures-and-extension-of-weights>

In a holomorphic frame $v$ of a line bundle $J$, a semipositive singular metric has squared frame norm $\|
  v \|_h^2 = e^(- phi.alt)$ with $phi.alt$ plurisubharmonic (psh) and not identically $- oo$.
  In particular $phi.alt$ is locally bounded above and $\| v \|_h^2$ has a positive local lower bound.
  A metric with locally bounded weights has bounds on both sides.
  Pullbacks and products of the metrics used below preserve semipositivity.

For $J = - K_Z + D$, write the $J$-valued top form $s_D$ in coordinates as

$ s_D = g \( z \) thin d z_1 and dots.h.c and d z_d ⊗ v . $

Its squared norm is the measure

#[#set math.equation(numbering: n => "(3.1)")
 $ \| s_D \|_h^2 = \| g \( z \) \|^2 e^(- phi.alt \( z \)) d lambda_z \, $ <eq:adjoint-measure>]

with one fixed dimensional normalization of Lebesgue measure.
  The expression is independent of coordinates and frame. Its total mass need not be finite merely because the
  curvature is semipositive. For a birational morphism $pi : Y arrow.r Z$ between smooth varieties,
  the pulled-back form includes the Jacobian:

$ pi^(*) s_D in H^0 \( Y \, K_Y + pi^(*) J \) \, wide "div" \( pi^(*) s_D \) = K_(Y \/ Z) + pi^(*) D . $

Here $K_(Y \/ Z) = K_Y - pi^(*) K_Z$ is the effective exceptional Jacobian divisor.
  Change of variables preserves the total mass in (3.1). All assertions about singular metrics and fiber integrals
  will be made as assertions about measures or almost everywhere defined functions,
  followed by their psh representatives.

We use two removable-singularity facts. A psh function on the complement of an analytic set extends if it is
  locally bounded above. Across an analytic set of codimension at least two in a smooth space,
  this upper bound is automatic. To see the latter locally,
  project a small polydisc in a generic complex direction. Boundaries of suitable parallel discs lie in a compact
  set outside the analytic subset; almost all such discs miss that subset.
  The maximum principle gives an upper bound on those discs,
  and the submean inequality gives the same bound at every point of the complement.
  Extension by upper limits is then psh. These statements apply in line-bundle frames,
  and a uniform lower bound survives extension by upper limits.

=== 3.2 A normal model and a smooth resolution <a-normal-model-and-a-smooth-resolution>

#thm([Lemma 3.1.])[
  (Prepared model).  #emph[Let $Z$ be smooth connected projective and $S_0$ an integral complex variety.
    Let $Z arrow.r.dashed S_0$ be a dominant rational map with connected general fiber.
    There is a smooth projective birational model $S$ of $S_0$ and a diagram
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Y$])
  content((2.057, 0), [$macron(Y)$])
  content((4.115, 0), [$Z$])
  content((2.057, -1.585), [$S$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$r$]])
  line((0.2108, -0.1625), (1.847, -1.423), mark: (end: ">"))
  content((0.818, -1.066), [#text(size: 0.73em)[$f$]])
  bezier((0.336, 0), (3.779, 0), (1.581, 0.503), (2.534, 0.503), mark: (end: ">"))
  content((2.057, 0.6039), [#text(size: 0.73em)[$pi$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  content((3.086, 0.2266), [#text(size: 0.73em)[$macron(pi)$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((2.38, -0.7927), [#text(size: 0.73em)[$macron(f)$]])
})

 in which $macron(Y)$ is normal projective, $Y$ is smooth projective,
   $r$ and $macron(pi)$ are birational morphisms, and $macron(f)$ is surjective and equidimensional.
   The construction may start above a prescribed birational model of $Z$.
   If an algebraic torus acts on $Z$ and the rational map is invariant,
   the diagram can be chosen equivariant with trivial action on $S$.]
  #emph[Every prime divisor on $macron(Y)$ either dominates $S$ or maps onto a prime divisor of $S$.
    At a general point of the strict transform in $Y$ of a prime $Q subset macron(Y)$ above a base prime $T$,
    there are coordinates in which
#[#set math.equation(numbering: n => "(3.2)")
 $ f \( t \, x_2 \, dots.h \, x_d \) = \( t^e \, x_2 \, dots.h \, x_s \) \, wide e =
   "ord"_Q \( macron(f)^(*) T \) > 0 \, $ <eq:power-map>]

 where $s = dim S$ and $d = dim Z$.]
] <lem:prepared-model>

#proof[
  First replace $S_0$ birationally by a projective model of its function field and compose the rational map with
    that replacement. This preserves the generic fiber and any trivial base action.
    Resolve the graph of the resulting rational map, starting above the prescribed model if one has been given.
    Flatten the resulting projective morphism by a modification of its base,
    using the strict transform #cite(label("RaynaudGruson1971")).
    Resolve the modified base and take the main component of the base change,
    namely the closure of the component over the common dense open.
    Before taking that component, the flat family has all fibers of the generic dimension $d - s$;
    base change preserves this. A closed component has fiber dimension at most $d - s$.
    Normalize the main component to obtain $macron(Y)$. Normalization is finite, so this upper bound persists.
    The dimension inequality for a dominant map gives the reverse bound for every irreducible fiber component.
    Thus $macron(f)$ is equidimensional. Resolve $macron(Y)$ to obtain $Y$; no equidimensionality is asserted for $f$.
  For an invariant rational map, use its invariant graph. The strict transform and main component are invariant,
    the action lifts uniquely through normalization, and characteristic-zero equivariant resolution supplies the
    smooth source. All base modifications have trivial torus action, so the resulting maps are equivariant.
  If a prime $Q$ has image of codimension at least two in $S$,
    its generic fiber over its image has dimension at least $\( d - 1 \) - \( s - 2 \) = d - s + 1$,
    contradicting equidimensionality. Hence the only vertical divisors lie above base divisors.
    At general points of $Q$ and $T$, both divisors are smooth, $Y arrow.r macron(Y)$ is an isomorphism,
    and the induced map $Q arrow.r T$ is a submersion. A local equation of $T$ pulls back to $t^e$ times a unit.
    Take a holomorphic $e$th root of that unit and absorb it into $t$;
    choose the remaining base coordinates among coordinates on $Q$. This gives (3.2).
    Generic smoothness and constructibility ensure that these neighborhoods occur over a dense open of $T$,
    while avoiding any specified proper closed subset of $Q$. ◻
]

A divisor dominating the base is called #emph[horizontal]; the others are #emph[vertical].
  The distinction in Lemma 5 will be used twice. Saturating pulled-back base differentials removes the factor
  $t^(e - 1)$ in (3.2); this is the ramification correction in the slope proof.
  Later, the same coordinates estimate the fiber integrals at base divisors.
  Exceptional divisors created on the smooth resolution can map into higher codimension.
  They cause no loss of divisor control because normalization is performed first on $macron(Y)$,
  and the final psh extensions are carried out on the smooth base $S$.

== 4 Cotangent tensors and the permitted boundary <sec:h:slope>

The induction below produces effective divisors of the form $M + m L$,
  where $M$ is a line bundle mapping nontrivially into a cotangent tensor power.
  We must control the contribution of $M$ using the same boundary that is allowed in the eventual section.
  The finite adjoint volume gives precisely this control. The first step is analytic:
  a relative Bergman metric remains positive after removing the vanishing of the differential along multiple
  fibres. The second step applies this observation to the positive part of the tangent sheaf’s slope filtration.

Throughout this section, $Z$ is a smooth connected projective complex variety, $D gt.eq 0$ is an integral divisor, and

$ J = - K_Z + D . $

We assume that $J$ has a singular Hermitian metric $h_J$ of semipositive curvature and that

#[#set math.equation(numbering: n => "(4.1)")
 $ integral_Z \| s_D \|_(h_J)^2 < oo . $ <eq:h:slope:volume>]

Here $s_D$, considered as a section of $K_Z + J$, is a $J$-valued top form,
  and the norm denotes its associated positive density. A local weight $phi.alt$ for $h_J$ satisfies $\|
  e \|_(h_J)^2 = e^(- phi.alt)$ in a holomorphic frame $e$.
  It is plurisubharmonic, so the frame norm has a strictly positive lower bound on each relatively compact chart.
  No upper bound for that norm is assumed.

=== 4.1 Removing the ramification from the Bergman metric <removing-the-ramification-from-the-bergman-metric>

A saturated foliation $cal(F) subset T_Z$ is a coherent subsheaf with torsion-free quotient,
  closed under the Lie bracket. Write

$ Q = T_Z \/ cal(F) \, wide P = det Q^(*) = \( and.big^("rank" Q) Q^(*) \)^(* *) . $

Since $Z$ is smooth, $P$ is a line bundle. If the foliation is induced by a rational fibration,
  then $P$ agrees generically with the pullback of the base canonical bundle.
  They can differ along a multiple fibre; that difference is the point of the following lemma.

#thm([Lemma 4.1.])[
  #emph[Under the assumptions above, let $cal(F) subset T_Z$ be an algebraically integrable saturated foliation
    with $0 < "rank" cal(F) < dim Z$. Then the line bundle
$ D - P = D + det Q $

 admits a singular Hermitian metric of semipositive curvature.
   In particular, $c_1 \( Q \) + \[ D \]$ is pseudoeffective.]
] <h:slope:foliation>

#proof[
  Set $n = dim Z$ and $b = "rank" Q$. Resolve the rational fibration using Lemma 5. Thus there are morphisms
  $ r : Y arrow.r macron(Y) \, wide macron(pi) : macron(Y) arrow.r Z \, wide macron(f) : macron(Y) arrow.r S \,
    wide pi = macron(pi) compose r \, quad f = macron(f) compose r \, $
  where $Y \, S$ are smooth projective, $macron(Y)$ is normal, $macron(pi)$ and $r$ are birational,
    and $macron(f)$ is equidimensional with connected general fibres. Their dimension is $n - b$.
    The foliation is the saturated relative tangent sheaf at the generic point.
  Pull back $s_D$ as a top form with coefficients, and denote the result by
  $ eta in H^0 \( Y \, K_Y + pi^(*) J \) . $
  Its divisor is $K_(Y \/ Z) + pi^(*) D$; the relative canonical divisor is the effective birational Jacobian.
    Change of variables off the exceptional locus shows that the density of $eta$ for $pi^(*)
    h_J$ has finite total mass. This assertion concerns almost-everywhere densities,
    so no pointwise product on the metric’s polar set is needed.
  Over a coordinate chart in the base, let $d s$ be a nonvanishing frame of $K_S$.
    On a smooth fibre $Y_s$, the restriction of $eta \/ f^(*) d s$ is a section of $K_(Y_s) + pi^(*) J \|_(Y_s)$.
    It is nonzero on general fibres, and Fubini’s theorem gives finite squared norm on almost every such fibre.
    Berndtsson–Păun’s relative Bergman kernel theorem therefore supplies a semipositive metric on
  $ K_(Y \/ S) + pi^(*) J $
  #cite(label("BerndtssonPaun2008")) Theorem 0.1. Over the smooth-fibre locus,
    in a holomorphic frame its weight $psi$ is the logarithm of the supremum of the squared absolute coefficients
    of fibre sections having squared norm at most one. Only sections integrable for the restricted twisting metric
    enter that supremum.
  We now compare this metric with the line bundle in the statement.
    Remove from $Z$ a closed subset of codimension at least two so that $pi$ is an isomorphism over the remaining
    open set and the sheaves $cal(F) \, Q$ are locally free there.
    At the generic point of every divisor of this open set the conormal inclusion is
  $ f^(*) Omega_S^1 arrow.r Q^(*) . $
  For a horizontal divisor it has full rank without a divisorial zero:
    the restriction of $f$ to that divisor is generically submersive in characteristic zero.
    Every other divisor under consideration maps onto a base divisor.
    Indeed its strict transform on $macron(Y)$ is a prime divisor,
    and equidimensionality excludes a base image of codimension at least two.
  Fix such a vertical divisor $E$. At its general points there are coordinates on $Y$ and $S$ in which
  #[#set math.equation(numbering: n => "(4.2)")
   $ s_1 = z_1^e \, wide s_i = z_i quad \( 2 lt.eq i lt.eq b \) \, wide e =
     "ord"_E \( f^(*) { s_1 = 0 } \) . $ <eq:h:slope:power-map>]
  To obtain these coordinates, take a point where the reduced map $E arrow.r { s_1 = 0 }$ is submersive,
    write $f^(*) s_1 = z_1^e u$ with $u$ a unit, and absorb a local $e$-th root of $u$ into $z_1$.
    Complete the other pulled-back base coordinates to a coordinate system.
    In this chart the saturated conormal bundle is spanned by $d z_1 \, dots.h \, d z_b$.
    The determinant of its displayed inclusion is $e z_1^(e - 1)$. Consequently its vanishing order is exactly $e - 1$.
  This same integer occurs in the Bergman metric. Choose a frame $v$ of $pi^(*) J$ and use
  $ xi = \( d z_1 and dots.h.c and d z_n \) ⊗ \( f^(*) d s \)^(- 1) ⊗ v $
  as the frame of $K_(Y \/ S) + pi^(*) J$. If $a xi$ is a fibre section, then,
    up to a constant of absolute value one from the order of wedge factors,
    its coefficient as an actual fibre top form is
  $ frac(a, e z_1^(e - 1)) . $
  This distinction between relative and fibre coefficients is also the one used in the definition of the relative
    Bergman kernel #cite(label("BerndtssonPaun2008")) Section 1.
  Choose two concentric coordinate polydiscs whose closures lie in this chart.
    For each fixed $\( z_1 \, dots.h \, z_b \)$ with $z_1 eq.not 0$,
    the larger polydisc in the free variables $z_(b + 1) \, dots.h \, z_n$ lies in the same smooth nearby fibre.
    Its radius can be fixed independently of the base point. The twisting frame norm has a uniform positive lower
    bound there. The holomorphic submean inequality on that polydisc, for points in the smaller one, therefore gives
  $ parallel a xi parallel_(L^2 \( Y_s \))^2 med gt.eq med c thin \| z_1 \|^(- 2 \( e - 1 \))
    integral_(upright("free polydisc")) \| a \|^2 thin d lambda med gt.eq med
    c' \| a \( z \) \|^2 \| z_1 \|^(- 2 \( e - 1 \)) \, $
  where $c \, c' > 0$ do not depend on the fibre section or the nearby base point.
    For squared norm at most one, this implies
  #[#set math.equation(numbering: n => "(4.3)")
   $ psi lt.eq \( e - 1 \) log \| z_1 \|^2 + C . $ <eq:h:slope:bergman-order>]
  The estimate holds on the smooth-fibre locus; any exceptional almost-everywhere qualifications disappear for the
    psh representative by the submean inequality.
  On the submersion locus where $pi$ is an isomorphism we have $K_(Y \/ S) + pi^(*) J = D - f^(*) K_S$.
    The determinant computation above says that a frame of $D -
    P$ maps to $z_1^(e - 1)$ times a nonvanishing multiple of a frame of $D - f^(*) K_S$.
    The induced metric on $D - P$ thus has weight
  $ psi - \( e - 1 \) log \| z_1 \|^2 $
  up to a pluriharmonic frame term. This weight is psh off $E$ and is locally bounded above by (4.3);
    hence it extends psh across $E$. At a horizontal divisor there is no ramification correction,
    and the original Bergman metric already extends. The coordinate argument applies over a dense open subset of
    each divisor. The remaining excluded subset has codimension at least two in the smooth variety $Z$,
    across which psh weights extend uniquely. The extensions respect changes of frame and therefore define a
    semipositive metric on the global line bundle $D - P$. ◻
]

=== 4.2 The slope bound and the face used by induction <the-slope-bound-and-the-face-used-by-induction>

A movable class is an element of the closed movable cone $"Mov"_1 \( Z \) subset N_1 \( Z \)_(bb(R))$.
  On a smooth projective variety this cone is dual to the pseudoeffective divisor cone #cite(label("BDPP2013")).
  For a torsion-free coherent sheaf $E$ of positive rank and a nonzero movable class $alpha$, write

$ mu_alpha \( E \) = frac(c_1 \( E \) dot.op alpha, "rank" E) \, wide mu_(min \, alpha) \( E \) \, quad
  mu_(max \, alpha) \( E \) $

for its slope and extremal Harder–Narasimhan slopes. Equivalently,
  the minimum is the infimum of slopes of its nonzero torsion-free quotients,
  and the maximum is the supremum of slopes of its nonzero subsheaves.
  We use the Harder–Narasimhan filtration and tensor slope formula for movable classes,
  including real boundary classes #cite(label("GKP2016")) Corollary 2.27 and Theorem 4.2.

#thm([Theorem 4.2.])[
  (Finite-volume cotangent bound).  #emph[ Let $Z$ be smooth connected projective over $bb(C)$, let $D gt.eq
    0$ be an integral divisor, and suppose that $J = - K_Z + D$ has a semipositive singular Hermitian metric $h_J$
    with $integral_Z \| s_D \|_(h_J)^2 < oo$. If $dim Z > 0$, then every nonzero real movable class $alpha$ satisfies
#[#set math.equation(numbering: n => "(4.4)")
 $ mu_(min \, alpha) \( T_Z \) gt.eq - D dot.op alpha . $ <eq:h:slope:min>]

 For every integer $k gt.eq 0$ and every line bundle $M$ with a nonzero morphism $M
   arrow.r \( Omega_Z^1 \)^(⊗ k)$, the line bundle
#[#set math.equation(numbering: n => "(4.5)")
 $ - M + k D $ <eq:h:slope:line>]

 is pseudoeffective. More generally, if $E$ is a torsion-free subsheaf of rank $r > 0$ in $\( Omega_Z^1 \)^(⊗ k)$,
   then $- det E + k r D$ is pseudoeffective.]
] <h:slope:cotangent>

#proof[
  Assume first that $dim Z > 0$, fix $alpha$, and set $delta = D dot.op alpha gt.eq 0$. Semipositivity of $J$ gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ c_1 \( T_Z \) dot.op alpha gt.eq - delta . $ <eq:h:slope:total>]
  Let $lambda_1 > dots.h.c > lambda_t$ be the slopes of the Harder–Narasimhan quotients of $T_Z$,
    with positive ranks $r_1 \, dots.h \, r_t$. Suppose, for a contradiction, that $lambda_t < - delta$.
    The total degree of the pieces with nonpositive slopes then satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_(lambda_i lt.eq 0) r_i lambda_i lt.eq r_t lambda_t < - delta . $ <eq:h:slope:negative-degree>]
  By (4.6), some piece has positive slope. Consequently the positive part $cal(F)$ of the filtration is nonzero
    and proper. It is saturated, and
  $ mu_(min \, alpha) \( cal(F) \) > 0 \, wide mu_(max \, alpha) \( T_Z \/ cal(F) \) lt.eq 0 . $
  The bracket modulo $cal(F)$ is an $cal(O)_Z$-linear morphism $and.big^2 cal(F) arrow.r T_Z \/ cal(F)$.
    Since the target is torsion-free, it factors through $A = \( and.big^2 cal(F) \) \/ upright("torsion")$.
    When $"rank" cal(F) > 1$, the tensor slope formula, duality,
    and the quotient inequality give $mu_(min \, alpha) \( A \) gt.eq 2 mu_(min \, alpha) \( cal(F) \) > 0$.
    The maximum slope of the target is nonpositive, so this morphism vanishes.
    If $"rank" cal(F) = 1$, then $A = 0$. Thus $cal(F)$ is a foliation.
    Campana–Păun’s algebraicity criterion now shows that it is algebraically integrable
    #cite(label("CampanaPaun2019")) Theorem 1.1.
  Lemma 6 gives $c_1 \( T_Z \/ cal(F) \) dot.op alpha gt.eq - delta$.
    Its left side is exactly the sum in (4.7), a contradiction. This proves (4.4).
    In particular the argument covers the cases in which the positive part would be zero or the whole tangent
    sheaf: the assumed failure of the inequality has already excluded both cases.
  By duality and tensor-product compatibility,
  $ mu_(max \, alpha) \( \( Omega_Z^1 \)^(⊗ k) \) = - k mu_(min \, alpha) \( T_Z \) lt.eq k D dot.op alpha $
  for $k > 0$. A nonzero map from $M$ is injective, because its target is torsion-free.
    Thus $\( k D - M \) dot.op alpha gt.eq 0$ for every movable $alpha$, and divisor–curve duality proves (4.5).
    For the sheaf $E$, the same inequality applied to its slope gives $c_1 \( E \) dot.op alpha lt.eq
    k r D dot.op alpha$, which proves the determinant assertion.
    Determinants are taken reflexively; removing codimension-two singular loci does not change their first Chern
    classes.
  If $k = 0$, the target is $cal(O)_Z$. A nonzero map from $M$ provides a nonzero section of $- M$,
    and a positive-rank subsheaf of $cal(O)_Z$ has rank one with effective negative determinant.
    These arguments also cover dimension zero. In that dimension there is no nonzero cotangent tensor for $k > 0$,
    and no minimum slope of a zero tangent sheaf is invoked. ◻
]

The coefficient of $D$ in this theorem is sharp even for curves.
  Indeed, on a smooth projective curve of genus at least two,
  take a nonzero holomorphic one-form $omega$ and put $D = "div" \( omega \)$.
  Then $J = - K_Z + D$ is trivial and its flat metric satisfies (4.1).
  Taking $M = k K_Z$ gives equality in the cotangent bound;
  replacing $k D$ by $c D$ with $c < k$ gives negative degree and therefore cannot give a pseudoeffective class.

#thm([Corollary 4.3.])[
  (A supporting class for the induction).  #emph[Under the hypotheses of Theorem 4.2,
    assume $dim Z > 0$ and let $L$ be a pseudoeffective line bundle for which $L + D$ is not big.
    There exists a nonzero real movable class $alpha$ with
$ L dot.op alpha = D dot.op alpha = 0 . $

 For this class $mu_(min \, alpha) \( T_Z \) gt.eq 0$. Suppose moreover that $M
   arrow.r \( Omega_Z^1 \)^(⊗ k)$ is nonzero and that effective divisors $N_i tilde.op M + m_i L$ are given. Then
$ M dot.op alpha = N_i dot.op alpha = 0 quad upright("for every ") i . $

 Every finite nonnegative linear combination of $D \, N_1 \, N_2 \,
   dots.h$ has zero intersection with $alpha$ and is not big.]
] <h:slope:face>

#proof[
  The class of $L + D$ is on the boundary of the closed pseudoeffective cone, whose interior is the big cone.
    A supporting hyperplane and cone duality give a nonzero real movable class $alpha$ annihilating it.
    Both $L$ and $D$ pair nonnegatively with $alpha$, so they pair with it individually to zero.
    Theorem 7 gives the tangent inequality and $M dot.op alpha lt.eq 0$.
    Effectivity of each $N_i$ gives the reverse inequality through $N_i dot.op alpha = M dot.op alpha$.
    Finally an interior point of a full-dimensional closed convex cone pairs strictly positively with every
    nonzero member of its dual cone; hence no indicated combination is big. ◻
]

The supporting class in this corollary can lie on the boundary of the movable cone and need not be rational or
  represented by a single moving curve. Its role is numerical:
  it rules out a generically finite linear system made from the displayed effective divisors and thereby forces
  the dimension drop in the subsequent argument.

== 5 Transferring a finite measure and a bounded metric <sec:transfer>

The next proposition isolates the induction step. It does not assume the existence of a section on the base:
  it constructs base data to which a lower-dimensional nonvanishing theorem can be applied.
  We retain two models of the total space because they do different jobs.
  On a normal equidimensional model every vertical prime maps onto a base prime,
  so divisor orders can be normalized there. A smooth resolution carries canonical forms and fiber integrals,
  but need not remain equidimensional. Such diagrams arise from flattening a resolved rational map
  #cite(label("RaynaudGruson1971")).

A prime is called #emph[horizontal] if it dominates the base, and #emph[vertical] otherwise.
  For a morphism $f : Y arrow.r S$ of smooth varieties we write $K_(Y \/ S) = K_Y - f^(*) K_S$.
  Its restriction to a smooth fiber is the canonical line of that fiber.

#thm([Proposition 5.1.])[
  (Two-metric transfer).  #emph[Let $X \, S \, Y$ be smooth connected projective varieties over $bb(C)$,
    and let $macron(Y)$ be a normal projective variety. Suppose $r : Y arrow.r macron(Y)$ and $macron(pi) :
    macron(Y) arrow.r X$ are projective birational morphisms, and $macron(f) : macron(Y) arrow.r
    S$ is a surjective equidimensional morphism with connected general fiber.
    Put $pi = accent(pi r, ‾)$ and $f = macron(f) r$, as in Figure 1.]
  #emph[Let $D$ be an effective integral divisor on $X$, and let $J = - K_X +
    D$ have a semipositive singular metric $h_J$ with
$ integral_X \| s_D \|_(h_J)^2 < oo . $

 Let $L$ be a line bundle on $X$ with a semipositive metric $h_L$ of locally bounded weights.
   Suppose that for an integer $k > 0$ there is a nonzero rational section $rho$ of $k macron(pi)^(*)
   L$ with no horizontal poles, and that
#[#set math.equation(numbering: n => "(5.1)")
 $ dim_(bb(C) \( S \)) H^0 #h(-0.16667em) (Y_eta \, (K_(Y \/ S) + pi^(*) \( J + j k L \)) \|_(Y_eta)) =
   1 wide \( j = 0 \, 1 \, 2 \, dots.h \) . $ <eq:rank>]

 Here $eta$ is the generic point of $S$ and $Y_eta = Y times_S "Spec" bb(C) \( S \)$.]
  #emph[After replacing $k \, rho$ by $d k \, rho^d$ for some integer $d > 0$, there are a line bundle $A$ on $S$,
    an effective integral divisor $D_S$, and a nonzero regular section
$ e in H^0 \( macron(Y) \, k macron(pi)^(*) L - macron(f)^(*) A \) $

 with these properties:]
  + #emph[$A$ has a semipositive metric with locally bounded weights.]
  + #emph[$- K_S + D_S$ has a semipositive singular metric $h_S$ with $integral_S \| s_(D_S) \|_(h_S)^2 < oo$.]
  + #emph[$D_S$ is supported on base primes $T$ for which every prime component of $macron(f)^(*)
    T$ is $macron(pi)$-exceptional or lies in $"Supp" \( macron(pi)^(*) D \)$.]
  + #emph[If $a > 0 \, b gt.eq 0$ are integers and $H^0 \( S \, a A + b D_S \) eq.not 0$,
    then $H^0 \( X \, a k L + c D \) eq.not 0$ for some integer $c gt.eq 0$.]
  #emph[In these conclusions $k$ denotes the enlarged integer.]
] <prop:transfer>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Y$])
  content((2.057, 0), [$macron(Y)$])
  content((4.115, 0), [$X$])
  content((2.057, -1.585), [$S$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$r$]])
  line((0.2108, -0.1625), (1.847, -1.423), mark: (end: ">"))
  content((0.818, -1.066), [#text(size: 0.73em)[$f$]])
  bezier((0.336, 0), (3.779, 0), (1.581, 0.503), (2.534, 0.503), mark: (end: ">"))
  content((2.057, 0.6039), [#text(size: 0.73em)[$pi$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  content((3.086, 0.2266), [#text(size: 0.73em)[$macron(pi)$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((2.38, -0.7927), [#text(size: 0.73em)[$macron(f)$]])
})],
  caption: [Figure 1: The model diagram in Proposition 9. The normal space $macron(Y)$ is equidimensional over $S$; the smooth space $Y$ is used for integration. Both upper maps are birational. The diagram does not assert that $f$ is equidimensional. ],
) <fig:models>

#proof[
  We first normalize $rho$ so that a divided section is regular and nonzero on at least one component over each
    base prime. We then use its adjoint integrals twice: the zeroth integral gives the volume metric,
    and the high moments give the bounded metric. The support of the first correction will make the final lifting
    possible.
  If $S$ is a point, every prime of $macron(Y)$ is horizontal.
    Thus $rho$ is regular by normality and descends as a nonzero section of $k L$ on the smooth variety $X$.
    Take $A$ trivial and $D_S = 0$; the metric assertions on a point and the lifting assertion follow.
    We assume $dim S > 0$ below.
  #emph[Divisorial normalization.] For a prime divisor $T subset S$, define
  #[#set math.equation(numbering: n => "(5.2)")
   $ c_T = min_(macron(f) \( Q \) = T) frac("ord"_Q \( rho \), "ord"_Q \( macron(f)^(*) T \)) \, $ <eq:minima>]
  where $Q$ ranges over the prime divisors of $macron(Y)$ mapping onto $T$.
    These are finitely many components for each $T$, and the denominators are positive integers.
    Only finitely many $c_T$ are nonzero. Replace $rho$ by a power and $k$ by the corresponding multiple to make
    every $c_T$ integral, and set $A = cal(O)_S \( sum_T c_T T \)$. The rank condition (5.1) persists:
    the new adjoint twists form a subsequence of the old ones and still include $j = 0$.
  Divide $rho$ by the pullback of the tautological rational section of $A$,
    obtaining a rational section $e$ of $k macron(pi)^(*) L - macron(f)^(*) A$.
    Its order is nonnegative at horizontal primes by hypothesis and at vertical primes by (5.2).
    Equidimensionality ensures that every vertical prime maps onto a base prime.
    Thus these are all prime divisors of $macron(Y)$, and normality makes $e$ regular.
    For each base prime $T$, a component attaining the minimum in (5.2) has order zero in $e$.
    We also write $e$ for its pullback to $Y$.
  #emph[The fiber integrals and their curvature.] Pullback of the $J$-valued top form includes the Jacobian:
  $ eta_Y = pi^(*) s_D in H^0 \( Y \, K_Y + pi^(*) J \) \, wide mu_Y = \| eta_Y \|_(pi^(*) h_J)^2 . $
  Change of variables gives finite total mass for $mu_Y$. In particular this assertion concerns measures and does
    not require a pointwise value for a singular metric on its polar set.
  On a coordinate chart $U subset S$, take a canonical frame $d s$ of $K_S$ and a frame $v$ of $A$.
    The section $e_v = e f^(*) v$ belongs to $k pi^(*) L$ over $f^(- 1) \( U \)$. For $j = 0 \, 1 \, 2 \, dots.h$, set
  #[#set math.equation(numbering: n => "(5.3)")
   $ u_j = \( eta_Y \/ f^(*) d s \) e_v^j \, wide V_j \( s \) =
     integral_(Y_s) \| u_j \|_(pi^(*) \( h_J h_L^(j k) \))^2 \, wide Phi_j = - log V_j . $ <eq:moments>]
  The section $u_j$ belongs to $K_(Y \/ S) + pi^(*) \( J + j k L \)$.
    On a smooth fiber it is a top form with coefficients in the indicated twisting line;
    (5.3) pairs that form with its conjugate to give a positive density.
    Properness, regularity of $e_v$, and boundedness of $h_L$’s weights bound $\|
    e_v \|^2$ on inverse images of relatively compact base charts.
    Since $V_0$ is the density of the finite measure $f_(*) mu_Y$,
    all $V_j$ are finite and positive almost everywhere on a suitable smooth-fibration open.
  For clarity, changes of frames have the following effect:
  #[#set math.equation(numbering: n => "(5.4)")
   $ v mapsto g v \, quad d s mapsto h thin d s quad arrow.r.double quad Phi_j mapsto Phi_j - j log \| g \|^2 +
     log \| h \|^2 . $ <eq:frames>]
  This will give weights on two different lines: $- K_S$ at $j = 0$,
    and $A$ after division by $j$ and passage to the limit.
  The relative Bergman theorem #cite(label("BerndtssonPaun2008")) Theorem 0.1 applies to the semipositive twisting
    metric $pi^(*) \( h_J h_L^(j k) \)$: (5.3) supplies a nonzero square-integrable adjoint section on almost
    every smooth fiber. The theorem produces a semipositive relative Bergman metric.
    On a dense base open where base change holds and (5.1) has dimension one,
    $u_j$ generates the adjoint section space. For almost every such fiber $V_j < oo$,
    so its one-dimensional holomorphic adjoint space is also its full space of square-integrable sections:
    every section is a scalar multiple of $u_j$. Consequently the Bergman weight, in a holomorphic frame upstairs, is
  $ Phi_j compose f + log \| hat(u)_j \|^2 $
  almost everywhere, where $hat(u)_j$ is the coefficient of $u_j$.
    Off the zero locus of that coefficient, its logarithm is pluriharmonic,
    so subtracting it leaves a psh function upstairs. In a local product chart,
    Fubini’s theorem gives almost all constant slices on which the displayed identity holds almost everywhere.
    Restriction to any of these slices gives a psh representative of $Phi_j$ on the base.
    For fixed base frames, these representatives agree almost everywhere on overlaps, hence everywhere,
    and therefore patch.
  The base-change open can depend on $j$, so we now put all these weights on one fixed open $S^compose$.
    Choose $S^compose$ such that $f$ is smooth there and every fiber has a point where both $eta_Y$ and $e$ are
    nonzero. A psh weight is locally bounded above; therefore its squared frame norm has a positive local lower
    bound, even when the metric is singular. On a small product chart around such a point,
    this lower bound for $h_J$, together with the bounds for $h_L$, gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ V_j \( s \) gt.eq C_1 C_2^j \, wide Phi_j \( s \) lt.eq C + j C' \, $ <eq:common-open>]
  locally on $S^compose$, with positive $C_1 \, C_2$ independent of $j$.
    Removable singularities extend each psh representative across its additional exceptional base loci inside
    $S^compose$. The union of the exceptional measure-zero sets for the countably many $j$ still has measure zero;
    hence all moment comparisons can be used simultaneously. Almost-everywhere upper bounds also hold for the psh
    representatives by the submean inequality.
  We have now obtained all the moment weights on a fixed open set.
    To continue the induction, both kinds of weight must extend to the boundary.
    Their estimates use different components of a singular fiber.
  #emph[The zeroth moment: finite volume with supported correction.] Call a base prime $T$ #emph[bad] if every
    component of $macron(f)^(*) T$ is $macron(pi)$-exceptional or lies in $"Supp" \( macron(pi)^(*) D \)$.
    Only finitely many primes are bad: each is the image of a member of the finite list of exceptional and
    boundary divisors on $macron(Y)$.
  Take a prime $T$ in the complement of $S^compose$, and a component $Q$ above it on $macron(Y)$.
    At general points of its strict transform in $Y$, there are coordinates
  $ s_1 = t^ell \, wide s_i = x_i quad \( 2 lt.eq i lt.eq dim S \) \, wide ell = "ord"_Q \( macron(f)^(*) T \) > 0 . $
  Indeed, the map on the divisors is generically smooth, and a root of a nonvanishing unit absorbs the unit in the
    first coordinate. Write the coefficient of $eta_Y$ as $t^q$ times a unit at such a point, with $q gt.eq 0$.
    Division by $d s$ contributes $t^(- \( ell - 1 \))$, so the relative top-form coefficient has magnitude
    comparable to $\| t \|^(q - ell + 1)$. The metric lower bound and integration over a fixed patch in the free
    fiber coordinates give
  #[#set math.equation(numbering: n => "(5.6)")
   $ V_0 \( s \) gt.eq C \| s_1 \|^(2 \( q - ell + 1 \) \/ ell) $ <eq:zero-bound>]
  almost everywhere near a general point of $T$.
  If $T$ is not bad, choose $Q$ nonexceptional over $X$ and outside $"Supp" \( macron(pi)^(*) D \)$.
    Then the birational Jacobian and $s_D$ are generically nonzero on $Q$, so $q = 0$.
    Thus $- log V_0$ is locally bounded above there. At the bad primes choose sufficiently large nonnegative
    integral coefficients for $D_S$. Equation (5.6) makes the weights
  #[#set math.equation(numbering: n => "(5.7)")
   $ Phi_0 + log \| hat(s)_(D_S) \|^2 $ <eq:base-volume-weight>]
  locally bounded above at general points of every boundary prime.
    Here the hat denotes the coefficient in a local frame of $cal(O)_S \( D_S \)$.
    These weights are psh off the boundary, extend across its general divisorial points,
    and then extend across the remaining analytic set of codimension at least two.
    The frame rule (5.4) gives a metric on $- K_S + D_S$.
  Pairing (5.7) with $s_(D_S)$ cancels the added factor. The resulting adjoint measure equals $f_(*)
    mu_Y$ almost everywhere, so has finite total mass. We have obtained the volume metric and the required support
    of its correction.
  #emph[High moments: bounded weights on $A$.] For $l = 1 \, 2 \, dots.h$, put on $S^compose$
  #[#set math.equation(numbering: n => "(5.8)")
   $ Psi = lim_(l arrow.r oo) (sup_(j gt.eq l) Phi_j / j)^(*) \, $ <eq:envelope>]
  where the star denotes upper-semicontinuous regularization in fixed local frames.
    Equation (5.5) gives uniform local upper bounds. The regularized suprema are therefore psh and decrease.
  Their limit does not collapse to $- oo$. On any relatively compact base chart $U$,
    including charts meeting the boundary, properness and bounded weights of $h_L$ give a single constant $C_U > 0$ with
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| e_v \|_(pi^(*) h_L^k)^2 lt.eq C_U \, wide V_j lt.eq C_U^j V_0 . $ <eq:uniform-lower>]
  The first bound holds on the whole inverse image of $U$: take a finite cover of its compact closure by
    line-bundle frames. For almost every $s in U ∩ S^compose$, $V_0 \( s \)$ is finite and positive.
    Dividing (5.9) by $j$ after taking negative logarithms gives $Psi gt.eq - log C_U$. Thus $Psi$ is psh.
    Its frame transformation is exact, although that of each normalized moment has a vanishing error.
    On a relatively compact overlap, (5.4) changes $Phi_j \/ j$ by $- log \| g \|^2 + \( log \| h \|^2 \) \/ j$.
    The last term has absolute value at most $C \/ l$ for every $j gt.eq l$.
    The two tail suprema, and then their upper-semicontinuous regularizations,
    therefore differ from one another plus $- log \| g \|^2$ by at most $C \/ l$.
    Taking the decreasing limit gives precisely $Psi mapsto Psi - log \| g \|^2$, the weight rule for $A$.
  To extend $Psi$, now choose a component $Q$ attaining the minimum in (5.2).
    This need not be the component used for the zeroth moment.
    Its defining property is that $e$ is nonzero generically on $Q$.
    The local norm of $e_v$ is therefore bounded below on a suitable patch.
    The same power-map calculation as in (5.6), with the factor $e_v^j$, gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ V_j \( s \) gt.eq C_1 C_2^j \| s_1 \|^(2 b_T) $ <eq:high-bound>]
  for a nonnegative integer $b_T$ independent of $j$. For example,
    increasing a nonnegative integer above $\( q - ell + 1 \) \/
    ell$ suffices after shrinking the coordinate chart. The absence of zeros of $e$ on the chosen component is
    what prevents an additional exponent proportional to $j$.
  Shrink the chart so that $\| s_1 \| < 1$, and decrease $C_1$ if needed so that $C_1 lt.eq 1$. Put
  $ B \( s \) = - log C_1 - 2 b_T log \| s_1 \| gt.eq 0 . $
  For $j gt.eq l$, the negative logarithm of (5.10) gives
  $ frac(Phi_j \( s \), j) lt.eq - log C_2 + frac(B \( s \), j) lt.eq - log C_2 + frac(B \( s \), l) . $
  The right side is continuous off $T$, so it also bounds the upper-semicontinuous regularization of the tail
    supremum there. Letting $l arrow.r oo$ in (5.8) gives $Psi lt.eq - log C_2$ throughout the punctured chart.
    Hence $Psi$ is locally bounded above near general points of each boundary prime,
    and extends psh across them and then across codimension two.
    The lower bound in (5.9) was uniform on the whole base chart, so the extension retains it.
    The extended psh weight is locally bounded above as well.
    Thus the metric on $A$ has locally bounded weights on both sides.
  #emph[Lifting the section.] We have the two metrics needed on the base.
    It remains to verify that the divisor used for finite volume creates only permitted poles on $X$.
    Regard a nonzero section of $a A + b D_S$ as a rational section of $a A$ with poles only on $D_S$.
    Pull it to the normal equidimensional model $macron(Y)$ and multiply by $e^a$.
    The resulting nonzero rational section of $a k macron(pi)^(*) L$ has poles only above bad primes.
    By their definition every such prime divisor of $macron(Y)$ is exceptional over $X$ or lies above $D$.
  At every prime of $X$ outside $D$, the strict transform in $macron(Y)$ therefore has no pole.
    The rational section downstairs extends there; exceptional divisors give no additional obstruction on the
    smooth, hence normal, variety $X$. Its remaining finitely many pole orders are cleared by multiplication by
    $s_D^c$ for a sufficiently large integer $c gt.eq 0$. This gives a nonzero section of $a k L + c D$, as required. ◻
]

== 6 Choosing the smaller base and completing the induction <sec:induction>

We now prove Theorem 2. The transfer proposition requires a rational section without horizontal poles and adjoint
  rank one in every nonnegative degree. The task of this section is to obtain both conditions from failure of
  nonvanishing. A maximal linear system will give a strictly smaller base;
  the same maximality will control all ratios on its generic fiber.

=== 6.1 One fixed determinant with unbounded twists <one-fixed-determinant-with-unbounded-twists>

We first explain the passage from cohomology to a single line bundle.
  The determinant construction is a standard way to extract effective divisors from twisted differentials;
  compare the determinant method of Lazić–Peternell #cite(label("LP2018")) Lemma 4.1.
  We include the argument because its uniformity in arbitrarily far tails is needed here,
  including when the numerical class of $L$ is zero.

#thm([Lemma 6.1.])[
  #emph[Let $Z$ be smooth connected projective of dimension $d > 0$, with $H^0 \( Z \, Omega_Z^q \) =
    0$ for $1 lt.eq q lt.eq d$. Let $L$ have a semipositive metric with locally bounded weights,
    and let $alpha$ be a nonzero movable class satisfying $mu_(min \, alpha) \( T_Z \) gt.eq 0$.
    There are a line bundle $M$ with $M dot.op alpha lt.eq 0$, strictly increasing positive integers $m_i arrow.r
    oo$, and nonzero sections
$ s_i in H^0 \( Z \, M + m_i L \) . $

 The line $M$ is the determinant of a saturated subsheaf of $Omega_Z^p$ for some $0 lt.eq p lt.eq d$.]
] <lem:determinant>

#proof[
  Hodge symmetry gives $H^q \( Z \, cal(O)_Z \) = 0$ for $q > 0$, and hence $chi \( cal(O)_Z \) = 1$.
    Riemann–Roch makes $chi \( K_Z + m L \)$ a polynomial in the integer $m$, whose constant term is
  $ chi \( K_Z \) = \( - 1 \)^d chi \( cal(O)_Z \) = \( - 1 \)^d $
  by Serre duality. It is therefore nonzero for all but finitely many positive integers.
    Some fixed $q$ has $H^q \( Z \, K_Z + m L \) eq.not 0$ for unbounded positive $m$.
  For each such $m$, the metric $h_L^m$ has trivial multiplier ideal:
    its weight is locally bounded, so every holomorphic germ is locally square integrable.
    Hard Lefschetz with multiplier ideals #cite(label("DPS2001")) Theorem 2.1.1 gives a surjection
  $ H^0 \( Z \, Omega_Z^(d - q) ⊗ m L \) arrow.r H^q \( Z \, K_Z + m L \) $
  by wedging with the $q$th power of a Kähler form. Choose nonzero maps $- m L arrow.r U$, where $U =
    Omega_Z^(d - q)$, for an increasing sequence of these exponents.
  At the generic point of $Z$, take the subspace of $U_(bb(C) \( Z \))$ spanned by all chosen images after a given
    cutoff. These subspaces form a decreasing chain in a finite-dimensional vector space.
    Their dimensions eventually stabilize, so the subspaces themselves stabilize to a nonzero subspace $W$.
    Let $cal(G) subset U$ be its saturated extension. It is coherent:
    saturate the images of finitely many maps spanning $W$. Every map in a sufficiently far tail factors through
    $cal(G)$, because $U \/ cal(G)$ is torsion-free and the composite vanishes generically.
  Put $r = "rank" cal(G)$ and $M = \( and.big^r cal(G) \)^(* *)$. This is a line bundle on smooth $Z$.
    For every cutoff, choose $r$ generically independent maps from the tail.
    Their exterior product is a nonzero section of $M + m L$, where $m$ is the sum of their exponents.
    As the cutoff tends to infinity, so does $m$. The maps and their determinant extend across codimension two
    into the line $M$. Selecting an increasing subsequence gives the sections in the statement.
  For $d - q > 0$, antisymmetrization embeds $U$ in $\( Omega_Z^1 \)^(⊗ \( d - q \))$.
    The tensor slope formula and the assumed tangent inequality give $mu_(max \, alpha) \( U \) lt.eq 0$,
    and therefore $M dot.op alpha lt.eq 0$. If $d - q = 0$, then $U =
    cal(O)_Z$ and its nonzero saturated subsheaf is $cal(O)_Z$ itself; thus $M =
    cal(O)_Z$ and the same conclusion holds. ◻
]

=== 6.2 A maximal system controls every section ratio <a-maximal-system-controls-every-section-ratio>

The next lemma is algebraic. It isolates the dimension drop and the rank calculation from the analytic transfer.
  The nonpositive degrees are used only to prevent the base from having the full dimension.

#thm([Lemma 6.2.])[
  (Maximal base and adjoint rank).  #emph[Let $Z$ be smooth connected projective of positive dimension $d$.
    Let $L \, M$ be line bundles and $D gt.eq 0$ an integral divisor.
    Suppose there is a nonzero movable class $alpha$ with
$ L dot.op alpha = D dot.op alpha = 0 \, wide M dot.op alpha lt.eq 0 \, $

 and nonzero sections $s_i in H^0 \( Z \, M + m_i L \)$ for strictly increasing positive integers $m_i arrow.r
   oo$. There is a smooth projective base $S$ with $dim S < d$,
   together with the prepared diagram of Lemma 5 and an integer $k > 0$, for which:]
  + #emph[a nonzero rational section $rho$ of $k macron(pi)^(*) L$ has no horizontal poles on $macron(Y)$;]
  + #emph[putting $J = - K_Z + D$, one has for every integer $j gt.eq 0$
#[#set math.equation(numbering: n => "(6.1)")
 $ dim_(bb(C) \( S \)) H^0 #h(-0.16667em) (Y_eta \, (K_(Y \/ S) + pi^(*) \( J + j k L \)) \|_(Y_eta)) =
   1 . $ <eq:induction-ranks>]

]
  #emph[If $S$ is a point, assertion (i) already gives a nonzero section of $k L$ on $Z$.]
] <lem:maximal-base>

#proof[
  Consider the nonempty complete linear systems of
  #[#set math.equation(numbering: n => "(6.2)")
   $ B = u L + v M + w D \, wide u \, v \, w in bb(Z)_(gt.eq 0) . $ <eq:systems>]
  Their degrees against $alpha$ are nonpositive. A divisor whose complete system defines a generically finite map
    is big. But a big class is an interior point of the pseudoeffective cone,
    and so pairs strictly positively with every nonzero member of the dual cone.
    Thus every system in (6.2) has image dimension less than $d$.
  Choose $B_0$ in this collection with maximal image dimension $s$,
    and let $V$ be the closed image of its rational map. This maximum exists because the possible dimensions are
    integers between $0$ and $d - 1$. Let $K$ be the relative algebraic closure of $bb(C) \( V \)$ in
    $bb(C) \( Z \)$; it is a finite extension of $bb(C) \( V \)$,
    since $bb(C) \( Z \)$ is a finitely generated field extension.
    Take a smooth projective model $S$ of $K$, with a morphism to $V$ after resolution.
    Its dimension is $s < d$, and the rational map $Z arrow.r.dashed S$ has connected general fiber.
  Every ratio of two nonzero sections in any one system (6.2) belongs to $K$.
    Indeed, combine that system with $\| B_0 \|$ by taking products of sections.
    The resulting linear subsystem of $\| B + B_0 \|$ gives the joint rational map.
    If its section ratio were transcendental over $bb(C) \( V \)$,
    the joint image would have dimension at least $s + 1$, contrary to the choice of $B_0$.
    The ratio is therefore algebraic over $bb(C) \( V \)$ and lies in its relative algebraic closure.
    We will use this #emph[section-ratio property] both for interpolation and for rank one.
  Resolve $\| B_0 \|$ before applying Lemma 5. The resulting smooth model carries an effective divisor $R_0$ and a
    line bundle $H_0$ on $S$ such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ pi^(*) B_0 = f^(*) H_0 + R_0 . $ <eq:fixed-moving>]
  Here $H_0$ is the pullback of $cal(O)_V \( 1 \)$. If $s > 0$ it is big, since $S arrow.r
    V$ is generically finite. All additional modifications preserve the displayed effective decomposition by pullback.
  Set $k = m_2 - m_1 > 0$ and take $rho = macron(pi)^(*) \( s_2 \/ s_1 \)$.
    For $i > 2$, the numerator and denominator in
  #[#set math.equation(numbering: n => "(6.4)")
   $ frac(s_i^k s_1^(m_i - m_2), s_2^(m_i - m_1)) $ <eq:interpolation>]
  are sections of the same line bundle of the form (6.2): both have $M$ coefficient $m_i -
    m_1$ and $L$ coefficient $m_2 \( m_i - m_1 \)$. Thus (6.4) is a nonzero element of $K$.
    It has order zero at every horizontal prime $Q$ of $macron(Y)$, so
  #[#set math.equation(numbering: n => "(6.5)")
   $ k #scale(x: 120%, y: 120%)[\(] "ord"_Q \( macron(pi)^(*) s_i \) -
     "ord"_Q \( macron(pi)^(*) s_1 \) #scale(x: 120%, y: 120%)[\)] = \( m_i - m_1 \) "ord"_Q \( rho \) .
     $ <eq:horizontal-interpolation>]
  The left side is bounded below independently of $i$, since each $macron(pi)^(*) s_i$ is regular.
    As $m_i arrow.r oo$, the right side could have this lower bound only if $"ord"_Q \( rho \) gt.eq 0$.
    This proves (i). If $S$ is a point, every prime is horizontal; normality makes $rho$ regular,
    and birational pushdown gives the claimed section on $Z$.
    In this case the rank assertion also follows from the section-ratio property.
    Indeed, the adjoint space in (6.1) identifies with $H^0 \( Z \, D + j k L \)$:
    the Jacobian divisor is effective and exceptional, so a rational section allowed to have poles only there
    extends downstairs across codimension two on smooth $Z$. The section $s_D rho^j$ is nonzero,
    and any two sections of $D + j k L$ have ratio in $K = bb(C)$ by (6.2).
    Hence this space has dimension one for every $j gt.eq 0$, including $j = 0$.
  Assume $s > 0$. We now verify (6.1) in every nonnegative degree. The identity
  #[#set math.equation(numbering: n => "(6.6)")
   $ K_(Y \/ S) + pi^(*) \( J + j k L \) = K_(Y \/ Z) + pi^(*) \( D + j k L \) -
     f^(*) K_S $ <eq:adjoint-identification>]
  shows which exceptional divisor is involved. Over the generic point of $S$,
    a base canonical frame is immaterial. The Jacobian section, $s_D$,
    and $rho^j$ give a nonzero section of the right side. To justify regularity,
    (i) implies that $rho$ is regular on $macron(Y)$ over a dense base open:
    remove the images of its finitely many vertical polar divisors. Its pullback to $Y$ is then regular there.
    Thus the adjoint space has dimension at least one, also for $j = 0$.
  Take any two nonzero sections of that generic-fiber space.
    Choose a rational frame of $K_S$ and regard them, by (6.6), as rational sections of $K_(Y \/ Z) +
    pi^(*) \( D + j k L \)$ with no horizontal poles. Their finitely many vertical polar divisors can be cleared
    by one effective Cartier divisor $C$ on $S$: enclose their images, including any of codimension at least two,
    in a Cartier divisor and increase its multiplicities so that $f^(*) C$ dominates both polar divisors.
    Since $H_0$ is big, there are an integer $a > 0$ and a nonzero section of $a H_0 - C$.
    Multiplication by this section and by $s_C$ makes both rational sections regular after the common base twist
    $a f^(*) H_0$.
  Now multiply both by the canonical section of $a R_0$. Formula (6.3) produces two regular sections of
  $ K_(Y \/ Z) + pi^(*) \( D + j k L + a B_0 \) $
  with the same ratio as the original pair. They descend to sections of $D + j k L + a B_0$ on $Z$.
    In detail, $K_(Y \/ Z)$ is effective and exceptional, and $pi_(*) cal(O)_Y \( K_(Y \/ Z) \) = cal(O)_Z$:
    a rational function with poles only on exceptional divisors is regular away from a codimension-two subset of
    smooth $Z$ and hence regular everywhere. Apply this fact after trivializing the line bundle on $Z$.
    The descended line belongs to (6.2); the section-ratio property therefore places their ratio in $K =
    bb(C) \( S \)$. Any two nonzero vectors in the generic-fiber section space are thus proportional over its
    ground field. This proves dimension one for all $j gt.eq 0$, without discarding the zeroth degree. ◻
]

The same maximal system supplied both inputs for transfer.
  The interpolation identity removed horizontal poles, while the big line $H_0$ on the chosen base let us clear
  arbitrary vertical poles in the rank calculation. No equidimensionality of the smooth resolution was used:
  poles over higher-codimension base sets were cleared before pushing down the exceptional Jacobian.

=== 6.3 Induction on dimension <induction-on-dimension>

#proof[
  We induct on $d = dim Z$. In dimension zero $Z$ is a point, every line bundle is trivial,
    and the conclusion holds with $a = 1 \, b = 0$. Assume $d > 0$ and suppose that no $a L + b D$,
    with integers $a > 0$ and $b gt.eq 0$, has a section.
  The bundle $L$ is pseudoeffective because it has a semipositive metric.
    The class of $L + D$ is therefore pseudoeffective. It is not big:
    otherwise some positive multiple of $L + D$ would have a nonzero section.
    Corollary 8 gives a nonzero movable class $alpha$ with $L dot.op alpha = D dot.op alpha =
    0$ and $mu_(min \, alpha) \( T_Z \) gt.eq 0$. Apply Lemma 10 to obtain the fixed line $M$ and unbounded
    sections. Then apply Lemma 11.
  If its base is a point, the resulting section contradicts our assumption.
    Otherwise Proposition 9, applied to that prepared diagram and the two original metrics,
    supplies a line $A$ and an effective integral divisor $D_S$ on the smaller smooth projective base $S$.
    The line $A$ has a semipositive metric with locally bounded weights, while $- K_S +
    D_S$ has a semipositive metric with finite distinguished adjoint volume.
  The no-forms condition also passes to $S$. A holomorphic form on $S$ pulls back along the dominant rational map
    on its domain of definition. Properness of $S$ extends the map at the generic point of every divisor of $Z$,
    so that domain can be taken to have codimension-two complement.
    The pulled-back form extends across that complement because $Omega_Z^q$ is locally free.
    Dominance in characteristic zero makes pullback injective. Hence $H^0 \( S \, Omega_S^q \) = 0$ for every $q > 0$.
  Since $dim S < d$, induction produces integers $a > 0 \, b gt.eq 0$ and a nonzero section of $a A + b D_S$.
    The lifting conclusion of Proposition 9 gives a nonzero section of $a k L + c D$ on $Z$ for some $c gt.eq 0$.
    Its exponent of $L$ is positive, so this contradicts the assumption and completes the induction. ◻
]

== 7 Invariant sections and anticanonical nonvanishing <sec:torus>

The ordinary theorem is now available on every no-forms base.
  We apply it to a rational torus quotient in order to obtain a section with the invariance required by Section 2.
  The quotient provides adjoint rank one for a geometric reason:
  a rational function constant on a dense orbit is a function on the base.
  Smoothness of the anticanonical metric provides positivity of that invariant line.
  We first establish the required smooth variant of transfer, then verify its hypotheses on the quotient.

=== 7.1 The smooth invariant transfer <sec:invariant-transfer>

On a torus quotient it is the space of invariant adjoint sections, rather than the full section space,
  that is one-dimensional. We need a different positivity input for that line,
  while the divisor normalization and boundary estimates remain those already proved.

#thm([Proposition 7.1.])[
  (Smooth invariant variant).  #emph[Use the varieties, maps, line bundles, and section of Proposition 9,
    with $D = 0$. Let a compact torus $T$ act holomorphically and continuously on $X \, macron(Y) \, Y$,
    with compatible holomorphic linearizations of the line bundles.
    Require $r \, macron(pi) \, macron(f)$ to be equivariant, with trivial action on $S$.
    Require $rho$ and the $J$-valued adjoint section $eta_Y = pi^(*) s_0$ to be invariant, and require $h_J \,
    h_L$ to be smooth, semipositive, and $T$-invariant.]
  #emph[Replace the ordinary rank hypothesis (5.1) by
$ dim_(bb(C) \( S \)) H^0 #h(-0.16667em) (Y_eta \, (K_(Y \/ S) + pi^(*) \( J + j k L \)) \|_(Y_eta))^T =
  1 wide \( j = 0 \, 1 \, 2 \, dots.h \) . $

 Then all the conclusions of Proposition 9 hold, and the section on $X$ produced by its lifting is $T$-invariant.]
] <prop:invariant-transfer>

#proof[
  The normalized line $A$ is given the trivial action. In (5.2) only base divisors are used,
    so dividing the invariant $rho$ by their rational section gives an invariant $e$.
    The sections $u_j$ in (5.3) are invariant as well.
  On a dense smooth-fibration open where the adjoint direct image is locally free and its formation commutes with
    base change, Berndtsson’s theorem #cite(label("Berndtsson2009")) Theorem 1.2 gives its smooth $L^2$ metric
    semipositive curvature. Its hypotheses hold because the total space $Y$ is projective, hence Kähler,
    and each twisting metric $pi^(*) \( h_J h_L^(j k) \)$ is smooth and semipositive.
  Average the holomorphic group action on this vector bundle over the compact torus.
    This gives a holomorphic projection onto its invariant subbundle, which has rank one by assumption.
    The fiber integral is invariant under the group, so the projection is orthogonal.
    The metric on the invariant line is therefore its quotient metric and is semipositive.
    Since $u_j$ is its nonzero local generator, $- log V_j$ has the required psh representative.
  This is the only positivity step that changes. The fixed-open estimate (5.5), the zeroth-moment extension (5.7),
    the high-moment envelope (5.8), and both bounds through codimension two now apply exactly as in the ordinary
    proof. They give the two asserted base metrics. Every base section is invariant because the base action is
    trivial. The rational lifting multiplies its pullback by $e^a$, so remains invariant.
    With $D = 0$, the support condition permits only exceptional poles,
    and the final extension on $X$ is an invariant holomorphic section. ◻
]

The distinction between the two propositions is substantive.
  The ordinary argument allows a singular volume metric because the whole adjoint space has rank one and the
  relative Bergman theorem applies. The invariant argument uses smooth coefficients to obtain a positive quotient
  metric on an orthogonal holomorphic summand.

=== 7.2 Natural invariant nonvanishing <natural-invariant-nonvanishing>

#thm([Theorem 7.2.])[
  (Natural invariant nonvanishing).  #emph[Let $Z$ be smooth connected projective over $bb(C)$,
    with $H^0 \( Z \, Omega_Z^q \) = 0$ for every $q > 0$. Suppose that $L = -
    K_Z$ has a smooth Hermitian metric of semipositive curvature.
    Let a compact connected real torus $T$ act continuously on $Z$ by holomorphic automorphisms,
    and give $L$ the natural linearization induced by the differential of the action. Then
$ H^0 \( Z \, m L \)^T eq.not 0 quad upright("for some integer ") m > 0 . $

]
] <thm:invariant>

#proof[
  If $Z$ is a point the natural action on its canonical line is trivial, so the constant section proves the claim.
    Otherwise replace $T$ by its image in $"Aut" \( Z \)$. The no-forms hypothesis and Hodge symmetry give
    $H^1 \( Z \, cal(O)_Z \) = 0$. The algebraic-torus argument in the proof of Theorem 3 applies to this action:
    connectedness preserves the first Chern class of a very ample line,
    the vanishing of $H^1 \( cal(O)_Z \)$ makes that line invariant up to isomorphism,
    and its projective representation embeds $T$ in a compact diagonal torus.
    Its Zariski closure $G$ is an algebraic torus acting on $Z$,
    and natural sections are $T$-invariant exactly when they are $G$-invariant.
  Average the given metric over $T$ by averaging local weights, using the natural linearization.
    Differences of metric weights are global functions, so these averages patch to a smooth invariant metric;
    its curvature remains semipositive. Take $J = L$ and $D = 0$.
    The canonical section $1$ of $K_Z + L = cal(O)_Z$ is invariant for the natural action,
    and its metric pairing is a smooth positive volume form of finite total mass on compact $Z$.
  If the general $G$-orbit has dimension zero, connectedness of $G$ makes its action trivial:
    the orbit map is constant on a dense open and hence on $Z$.
    Theorem 2, with $D = 0$ and $J = L$, then gives the required section.
    Suppose henceforth that the general orbit has dimension $r > 0$.
  Take the Rosenlicht rational quotient #cite(label("Rosenlicht1956")) #cite(label("BellGhiocaReichstein2017")).
    Its function field is $bb(C) \( Z \)^G$, and a dense invariant open has geometric fibers equal to orbits.
    Because $G$ is connected, its general orbit is geometrically integral;
    thus the invariant field is relatively algebraically closed in $bb(C) \( Z \)$ and the quotient has connected
    general fiber. Choose its prepared equivariant model
  $ Y arrow.r^(r_Y) macron(Y) arrow.r^(macron(pi)) Z \, wide f : Y arrow.r S \, quad macron(f) : macron(Y) arrow.r
    S \, $
  with trivial base action. The notation $r_Y$ for the resolution avoids confusion with the orbit dimension $r$.
    The generic fiber has dimension $r$ and a geometrically dense $G$-orbit.
    After shrinking a base open, $f$ is smooth there, its fibers have a dense orbit,
    and $pi$ agrees birationally with the original quotient construction.
  We construct the relative section required for invariant transfer.
    Choose $r$ elements of the Lie algebra of $G$ whose fundamental vector fields $v_1 \, dots.h \,
    v_r$ are generically independent. Such a choice is possible because the general orbit has dimension $r$.
    The vector fields are invariant, since $G$ is commutative, and tangent to the fibers of $f$.
    On the smooth-fibration open their wedge is a regular, generically nonzero section of $- K_(Y \/ S)$.
    Tensor it with the pullback of a rational frame of $- K_S$, regular after shrinking the base open.
    This gives an invariant anticanonical section on $Y$ over that open.
    The determinant of $d pi$ is the natural morphism
  $ - K_Y arrow.r pi^(*) \( - K_Z \) . $
  Its image is a nonzero invariant rational section of $pi^(*) L$, regular over the same open.
  This rational section also defines a section $rho$ of $macron(pi)^(*)
    L$ on $macron(Y)$ with no horizontal poles. Indeed, $r_Y$ is an isomorphism at the generic point of each prime
    divisor of normal $macron(Y)$. Every horizontal prime meets the base open on which the constructed section is
    regular. The birational identification of function fields therefore gives nonnegative order there.
  The generic-fiber adjoint spaces are finite-dimensional $bb(C) \( S \)$-vector spaces carrying algebraic
    representations of the split torus $G_(bb(C) \( S \))$. They decompose into character spaces.
    A character of $G$ is trivial on the Zariski-dense subgroup $T$ exactly when it is the zero character.
    Consequently their $T$-fixed and $G$-fixed subspaces agree, not merely those of sections on $Z$ itself.
  For each $j gt.eq 0$, on the generic fiber the section
  $ \( pi^(*) 1 \/ f^(*) d s \) rho^j $
  is a nonzero invariant section of $K_(Y \/ S) + pi^(*) \( \( j + 1 \) L \)$.
    The form $pi^(*) 1$ includes the effective birational Jacobian, and $rho$ has no horizontal pole,
    so this is regular. Any two nonzero invariant sections of this line have an invariant rational function as
    their ratio. The equivariant birational maps and the defining property of the quotient give
  $ bb(C) \( Y \)^G = bb(C) \( Z \)^G = bb(C) \( S \) \, $
  so this ratio belongs to $bb(C) \( S \)$. Their space has dimension one over $bb(C) \( S \)$, for every $j gt.eq
    0$ including $j = 0$.
  Proposition 12 now applies with $k = 1$, with powers subsequently taken there to clear the vertical minima.
    It supplies a line $A$ and effective divisor $D_S$ on $S$,
    with a bounded semipositive metric on $A$ and a finite-volume semipositive metric on $- K_S + D_S$.
    Holomorphic forms on $S$ pull back injectively to $Z$, as in the last part of Section 6;
    hence $S$ has no positive-degree holomorphic forms. Theorem 2 gives a nonzero section of $a A +
    b D_S$ with $a > 0 \, b gt.eq 0$. Invariant lifting produces a nonzero invariant section of a positive power
    of $L$ on $Z$. Since $D = 0$, every permitted pole upstairs is exceptional over $Z$ and disappears on its
    normal pushdown. When $S$ is a point the same conclusion is the point-base case of Proposition 12.
    This completes the proof. ◻
]

=== 7.3 Descent to the original variety <descent-to-the-original-variety>

#proof[
  Use Theorem 3 to choose the finite étale cover $nu : S arrow.r X$ and the universal product $tilde(X) =
    bb(C)^a times F times Z$ with its lattice deck action. The compact factor $Z$ satisfies the hypotheses of
    Theorem 13; let $s_Z eq.not 0$ be an invariant section of $K_Z^(- m)$ for some $m > 0$.
    If $Z$ is a point, take $m = 1$ and $s_Z = 1$.
  Using the product identification (2.5), form
  $ eta_0^(- m) ⊗ eta_F^(- m) ⊗ s_Z in H^0 \( tilde(X) \, K_(tilde(X))^(- m) \) \, $
  where pullbacks by the product projections are understood.
    The first two frames are invariant under the deck lattice and the last factor is invariant under the closure
    of its action. The product is therefore invariant and descends to a nonzero holomorphic section of
    $K_S^(- m)$. It is algebraic by projectivity. Finally Lemma 4 produces a nonzero section of
    $K_X^(- m deg nu)$. The exponent is positive, as required. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
