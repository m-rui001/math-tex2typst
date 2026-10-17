#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 12pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 12.55pt)
#show heading.where(level: 1): set text(size: 14.18pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[A-conditional-abelianity-theorem-for-special-fourfold-pairs-with-a-half-weight-divisor-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Statement and context <statement-and-context>

Campana’s theory of special varieties, developed in #cite(label("Campana2004")), describes the part of birational geometry with no positive-dimensional general-type orbifold base. The orbifold formulation records the multiplicities of fibres and divisors. The orbifold Abelianity Conjecture predicts virtual abelianity for the fundamental group of a smooth integral special geometric orbifold whose coarse space is bimeromorphic to a compact Kähler manifold; see #cite(label("CampanaOrbifolds")) Conjecture 12.10(1) and its projective formulation in #cite(label("CampanaSurvey")) Conjecture 11.2. Here, as there, virtually abelian means containing an abelian subgroup of finite index.

We give a conditional resolution of the case consisting of a smooth projective fourfold and one smooth divisor of multiplicity two. The argument uses the manifold abelianity theorem in every dimension and constructs a special manifold whose fundamental group surjects onto the orbifold group.

We first fix the differential definition of specialness used throughout. Let $X$ be a connected smooth projective complex variety and $D$ a smooth reduced divisor. Its order-two root orbifold is denoted by

$ pi : cal(X) = root(2, \( X \, D \)) arrow.r X . $

Near $D = { z_1 = 0 }$ it is presented by

#[#set math.equation(numbering: n => "(1.1)")
 $ z_1 = w_1^2 \, #h(2em) z_i = w_i med \( i > 1 \) \, #h(2em) w_1 mapsto - w_1 . $ <eq:root-chart>]

Bundles, forms and their maps on $cal(X)$ mean equivariant holomorphic objects in these smooth charts, with the compatible identifications on overlaps. Write $cal(D)$ for the reduced root divisor. Its divisor line has the canonical relation

#[#set math.equation(numbering: n => "(1.2)")
 $ T := cal(O)_(cal(X)) \( cal(D) \) \, #h(2em) T^(⊗ 2) = pi^(*) cal(O)_X \( D \) . $ <eq:root-line>]

The stabilizer acts by sign on $T$ along $cal(D)$. This line exists on $cal(X)$ even when $cal(O)_X \( D \)$ has no square root on $X$.

For an ordinary or orbifold line bundle $L$, its Iitaka dimension $kappa \( L \)$ is $- oo$ if every positive power has no nonzero section, and otherwise is the largest dimension of the images of its complete positive-power section maps. On an orbifold these are the global equivariant sections.

#prodef([Definition 1.1.])[
  A smooth compact complex manifold or a smooth root orbifold $V$ is #emph[special] if there is no integer $1 lt.eq p lt.eq dim V$ and no holomorphic line bundle $L$ admitting a nonzero sheaf map
  $ L arrow.r Omega_V^p \, #h(2em) kappa \( L \) = p . $
] <def:special>

This is the finite-integral root form of the Bogomolov-sheaf criterion in #cite(label("CampanaOrbifolds")) Theorem 8.9. We retain Definition 1 throughout the proof. Remark 6 gives the local comparison with orbifold symmetric differentials.

#thm([Assumption 1.2.])[
  (Manifold abelianity).  #emph[Every connected smooth compact Kähler manifold which is special in the sense of Definition 1 has virtually abelian entire discrete topological fundamental group, in every complex dimension.]
] <ass:manifold>

This is Theorem 1.1 of the companion paper #cite(label("Supplied")). No orbifold extension of that theorem is assumed. The following theorem, including the appendix proof, uses no other result of that paper.

#thm([Theorem 1.3.])[
  #emph[Assume Assumption 2. Let $X$ be a connected smooth projective complex fourfold and let $D subset X$ be a nonempty smooth connected reduced divisor. If $root(2, \( X \, D \))$ is special, then 
#[#set math.equation(numbering: n => "(1.3)")
 $ G = pi_1 \( X \\ D \, x \) #scale(x: 120%, y: 120%)[\/] chevron.l #h(-0.16667em) chevron.l gamma^2 chevron.r #h(-0.16667em) chevron.r $ <eq:target-group>]

 contains an abelian subgroup of finite index. Here $gamma$ is a positively oriented meridian about $D$, transported to $x in X \\ D$.]
] <thm:main>

The assertion concerns the entire discrete group in (1.3), not just its abelianization, finite quotients or linear images. No uniform index is claimed, and torsion is allowed. We impose no residual-finiteness or linearity assumption on $G$, no positivity condition on $K_X + 1 / 2 D$, and no finite manifold-cover hypothesis.

The main construction is independent of specialness. It produces a smooth projective eightfold $Y$ over $cal(X)$ with general fibre a product of four genus-one curves. It also supplies a submersive lift at some point over the general point of #emph[every] base divisor. These points detect all poles in the descent of differential tensors. A direct argument then proves that specialness of $cal(X)$ forces specialness of $Y$, while even pullback multiplicities give an epimorphism $pi_1 \( Y \) arrow.r.twohead G$. These two conclusions permit the application of Assumption 2.

Proposition 8 isolates this passage in arbitrary base dimension for an order-two smooth boundary. Its hypotheses concern general fibres and divisorial submersions, so it does not require a globally smooth family. In the fourfold construction, four independent genus-one factors eliminate stabilizers over the three-dimensional divisor. Appendix 5 gives an alternative construction using auxiliary branched covers, affine elliptic actions and a quotient resolution. Both constructions avoid a finite uniformization requirement.

The alternative proof #emph[Conditional orbifold abelianity by inertia and quotient minimality] retains the longer descent method and states its additional inputs from the companion paper. It is not needed for the proof of Theorem 3 below.

===== 1.1 Conventions. <conventions.>

All varieties are over $upright(bold(C))$. Projective spaces of vector bundles parametrize lines. A general fibre is taken over a sufficiently small nonempty Zariski open. Fundamental-group maps use compatible base points and paths; subgroup images are understood up to conjugacy. We use the standard complex-projective comparison between algebraic and analytic bundles, sections, and finite coherent algebras #cite(label("GAGA")).

== 2 Differential lines and section ratios <differential-lines-and-section-ratios>

We record the elementary differential facts needed to transfer specialness. They apply on ordinary smooth projective manifolds; their root-chart use will be justified explicitly.

#thm([Lemma 2.1.])[
  (Closed-form argument).  #emph[Let $V$ be a connected smooth projective manifold and let $i : L arrow.r Omega_V^p$ be a nonzero line-bundle map, where $1 lt.eq p lt.eq dim V$. If $s_0 \, dots.h \, s_r$ are sections of the same positive power $L^(⊗ m)$, with $s_0 eq.not 0$, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ d \( s_a \/ s_0 \) and i \( L \) = 0 $ <eq:wedge-ratio>]

 at the generic point. In particular, $kappa \( L \) lt.eq p$. If $kappa \( L \) = p$, there are such sections $s_0 \, dots.h \, s_p$ for which the image line of $i$ is generically spanned by 
#[#set math.equation(numbering: n => "(2.2)")
 $ d \( s_1 \/ s_0 \) and dots.h.c and d \( s_p \/ s_0 \) eq.not 0 . $ <eq:wedge-description>]

]
] <lem:ratios>

#proof[
  Adjoin simultaneous $m$th roots of the finitely many sections in copies of the total space of $L$. The equations $t_a^m = s_a$ are monic and define a finite space over $V$. Choose a reduced irreducible component dominating $V$ and take a smooth projective resolution $q : V' arrow.r V$ of that component #cite(label("Hironaka")). The tautological roots are holomorphic sections of $q^(*) L$. Their differential images
  $ alpha_a in H^0 \( V' \, Omega_(V')^p \) $
  are holomorphic, and $alpha_0$ is generically nonzero because $q$ is generically finite in characteristic zero.
  Holomorphic forms on a compact Kähler manifold are closed #cite(label("Demailly")). On the open set where $t_0 eq.not 0$, we have $alpha_a = \( t_a \/ t_0 \) alpha_0$, so
  $ d \( t_a \/ t_0 \) and alpha_0 = 0 . $
  Taking the $m$th power of the ratio gives (2.1) upstairs; generic injectivity of differential pullback gives it downstairs.
  If $r$ independent covectors each wedge to zero with a nonzero $p$-form, expansion in a basis containing those covectors shows that every nonzero term of the form contains all $r$ of them. Hence $r lt.eq p$. In characteristic zero the image dimension of a section map is the generic rank of its ratio differentials, proving the bound. If that dimension is $p$, choose $p$ algebraically independent ratios from one section map. The same exterior-algebra argument gives (2.2). ◻
]

#thm([Lemma 2.2.])[
  (Saturated meromorphic directions).  #emph[Let $E$ be a holomorphic vector bundle on a smooth complex manifold. The intersection with $E$ of a rank-one meromorphic subspace of its meromorphic sections is an invertible sheaf $K$ with a nonzero map $K arrow.r E$. Moreover, a meromorphic tensor in the corresponding line inside $E^(⊗ m)$ is holomorphic if and only if it is a holomorphic section of $K^(⊗ m)$. Both assertions hold equivariantly in smooth root charts.]
] <lem:saturation>

#proof[
  In a local frame clear the denominators of a meromorphic generator and divide out all common irreducible factors of its entries. Smooth local rings are factorial, so the resulting vector $v$ has holomorphic entries with no common height-one factor. If $a v$ is holomorphic for a meromorphic scalar $a$, a pole of $a$ at a prime divisor would force that prime to divide every entry of $v$. Thus $a$ has no divisorial pole and is holomorphic. This proves that the saturated module is freely generated by $v$.
  At every prime divisor some entry of $v$ is a unit at its generic point. The corresponding entry of $v^(⊗ m)$ has the same property. The identical pole test proves the tensor-power assertion. Holomorphic extension across codimension two gives the statements on the whole chart. The construction is intrinsic to the meromorphic direction and hence respects equivariance and changes of chart. The form-valued generator is allowed to vanish in codimension two; the assertion is about an invertible sheaf with a nonzero map, not about a subbundle everywhere. ◻
]

#prodef([Remark 2.3.])[
  (Comparison of differential conventions).  Under $z = w^m$, a coefficient $z^(- a)$ in a tensor containing $t$ occurrences of $d z$ pulls back with order
  $ t \( m - 1 \) - m a . $
  Thus the allowed pole is $a lt.eq floor.l t \( 1 - 1 \/ m \) floor.r$, the usual orbifold symmetric-differential rule. For a fixed generic differential line, saturation of its powers has exactly the invariant sections of the corresponding saturated root line. The primitive-generator argument in Lemma 5 verifies this assertion in codimension one and extends it across codimension two. This compares the section lattices; our specialness argument uses the line-bundle convention of Definition 1 directly.
] <rem:conventions>

#thm([Lemma 2.4.])[
  (Rational descent).  #emph[Let $g : Y arrow.r X$ be a dominant morphism of connected smooth projective varieties with connected general fibre. A rational function on $Y$ which is constant on general fibres, wherever defined, is the pullback of a rational function on $X$.]
] <lem:rational-descent>

#proof[
  Let $Z subset X times upright(bold(P))^1$ be the closure of the joint image of $g$ and the function, on its regular locus. The actual image is constructible and dense in $Z$, so it contains a dense open of $Z$. Its fibres over general points of $X$ have at most one point. The fibre-dimension theorem therefore makes $Z arrow.r X$ generically finite. After shrinking $X$, its generic degree is realized by distinct points, since the characteristic is zero, and all those points belong to the actual-image open. The degree is consequently one. Hence $upright(bold(C)) \( Z \) = upright(bold(C)) \( X \)$, giving the descent. Connectedness of the general fibre ensures that the constant is a single value on that fibre. ◻
]

== 3 A manifold criterion for specialness and fundamental groups <a-manifold-criterion-for-specialness-and-fundamental-groups>

Here $X$ may have any positive dimension $n$, and $D$ is still a nonempty smooth connected reduced divisor. Write $cal(X) = root(2, \( X \, D \))$.

If a map $g : Y arrow.r X$ from a smooth manifold satisfies $g^(*) D = 2 E$, then the divisor line $cal(O)_Y \( E \)$ and its canonical section, with their squared identification with $g^(*) \( cal(O)_X \( D \) \, s_D \)$, define a map

$ f : Y arrow.r cal(X) \, #h(2em) pi f = g . $

Equivalently, a local defining equation of $D$ pulls back to a square after choosing a local square root of a unit. Choices differ by sign and give precisely the root-chart transition rule. Orbifold bundles and differential maps therefore pull back to ordinary ones on $Y$.

#thm([Proposition 3.1.])[
  (Transfer criterion).  #emph[Let $g : Y arrow.r X$ be a surjective morphism with $Y$ connected smooth projective. Assume:]
  + #emph[ $g^(*) D = 2 E$ for an effective integral divisor $E$ on $Y$;]
  + #emph[ over a nonempty Zariski open $B subset X \\ D$, the map $g$ is smooth with connected fibres $F$, and $Omega_F^1$ is trivial;]
  + #emph[ above a general point of each prime divisor $P eq.not D$ of $X$, there is a point at which $g$ is a submersion;]
  + #emph[ above a general point of $D$, there is a point at which a local lift to the root chart is a submersion.]
  #emph[If $cal(X)$ is special, then $Y$ is special. There is also a surjection 
#[#set math.equation(numbering: n => "(3.1)")
 $ pi_1 \( Y \) arrow.r.twohead pi_1 \( X \\ D \) \/ chevron.l #h(-0.16667em) chevron.l gamma^2 chevron.r #h(-0.16667em) chevron.r . $ <eq:group-surjection>]

 Consequently Assumption 2 implies virtual abelianity of the group on the right.]
] <prop:transfer>

#proof[
  #emph[Specialness.] The map to the root orbifold described above will be denoted by $f$. Suppose that $i : L arrow.r Omega_Y^p$ contradicts specialness of $Y$. We first descend the plurisection ratios, then the associated differential tensors, and finally test their poles over base divisors. Choose sections $s_0 \, dots.h \, s_p$ of $L^(⊗ m)$ as in Lemma 4, and put $u_a = s_a \/ s_0$.
  For a smooth general fibre $F$ over $B$, the exact cotangent sequence
  $ 0 arrow.r cal(O)_F^(xor n) arrow.r Omega_Y^1 \|_F arrow.r Omega_F^1 arrow.r 0 $
  gives a filtration of $Omega_Y^p \|_F$ by subbundles with trivial graded pieces. Choose $F$ for which both $i \|_F$ and $s_0 \|_F$ are nonzero. The first nonzero projection of $i \|_F$ to a graded piece, followed by a suitable coordinate projection, gives a nonzero section $t$ of $L^(- 1) \|_F$. Then
  $ t^m s_0 \|_F in H^0 \( F \, cal(O)_F \) $
  is nonzero. It is a nonzero constant because $F$ is compact and connected. In particular $t$ and $s_0 \|_F$ have no zeros, and every $u_a$ is constant on $F$. Lemma 7 gives
  $ u_a = g^(*) v_a \, #h(2em) v_a in upright(bold(C)) \( X \) . $
  Their independent differentials imply $p lt.eq n$ and
  $ sigma = d v_1 and dots.h.c and d v_p eq.not 0 . $
  By Lemma 4, the generic image of $L$ is the line of $g^(*) sigma$.
  We next descend the plurisections through their images as differential tensors. Write
  #[#set math.equation(numbering: n => "(3.2)")
   $ i^(⊗ m) \( s_a \) = h_a \( g^(*) sigma \)^(⊗ m) \, #h(2em) h_a in upright(bold(C)) \( Y \) . $ <eq:tensor-coefficients>]
  Shrink the smooth base open so that $sigma$ is holomorphic and nowhere zero. Because $g$ is a submersion there, $g^(*) sigma$ is nowhere zero at every point of the full inverse image. Equation (3.2) makes each $h_a$ holomorphic there: locally one divides by a nonvanishing coefficient of the reference tensor. Compact connected fibres force $h_a$ to be constant on each such fibre. Therefore
  $ h_a = g^(*) b_a quad \( b_a in upright(bold(C)) \( X \) \) \, #h(2em) b_a \/ b_0 = v_a . $
  Let $tau = pi^(*) sigma$ be the meromorphic form on the smooth root charts. Lemma 5 gives an orbifold line bundle $K arrow.r Omega_(cal(X))^p$ with generic direction $tau$. We claim that every tensor
  #[#set math.equation(numbering: n => "(3.3)")
   $ \( pi^(*) b_a \) tau^(⊗ m) $ <eq:descended-tensors>]
  is holomorphic. Its differential pullback to $Y$ is holomorphic by (3.2). At the general point of any ordinary base prime, condition Proposition 3.1 supplies a local section of a submersive lift. At $D$, condition Proposition 3.1 does the same in the root chart. Pulling back along such a local section proves that (3.3) has no pole at that divisorial point. Any polar chart divisor belongs to the invariant global polar locus of this rational tensor. Its finite image is a base divisor, so equivariance and the preceding tests exclude every polar component. Extension across codimension two proves the claim everywhere.
  By Lemma 5, the tensors in (3.3) are sections of $K^(⊗ m)$. Their ratios are the independent $v_a$, so $kappa \( K \) gt.eq p$. Conversely, $f^(*) K arrow.r Omega_Y^p$ is a nonzero line map: on the dense ordinary open it is the differential pullback by a dominant map. Pullback preserves independence of section ratios, and Lemma 4 gives
  $ kappa \( K \) lt.eq kappa \( f^(*) K \) lt.eq p . $
  Thus $K$ contradicts specialness of $cal(X)$. This proves specialness of $Y$. ◻
]

#proof[
  #emph[Fundamental groups and conclusion.] Set $Y^compose = Y \\ g^(- 1) \( D \)$ and $X^compose = X \\ D$. For a smooth manifold and a divisor, the inclusion of the complement surjects on fundamental groups, with kernel normally generated by meridians of the irreducible divisor components. Indeed, perturb loops off the divisor and perturb null-homotopy discs transversely to its smooth strata, avoiding the strata of complex codimension at least two. Puncturing a disc at its transverse intersections gives the normal generators. This applies even if the reduced support of $g^(*) D$ is singular.
  Consider $pi_1 \( Y^compose \) arrow.r pi_1 \( X^compose \) arrow.r G$. At the general point of a component of $g^(*) D$, its meridian maps to a conjugate of $gamma^(2 e)$, where $2 e$ is that component’s multiplicity. The winding calculation uses a smooth local equation for $D$ and remains valid when the component maps into a smaller subset of $D$. Positive meridians of $D$ are conjugate because $D$ is smooth and connected. Thus all the meridians killed on filling $Y^compose$ die in $G$, and the map factors through $pi_1 \( Y \)$.
  Over $B$ the map is proper and smooth, hence a differentiable fibre bundle #cite(label("Ehresmann")). Connectedness of its fibres gives $pi_1 \( g^(- 1) B \) arrow.r.twohead pi_1 \( B \)$. General position gives $pi_1 \( B \) arrow.r.twohead pi_1 \( X^compose \)$. The map just factored is therefore surjective, proving (3.1). Finally, $Y$ is a connected smooth projective special manifold. Assumption 2 applies, and the image of a finite-index abelian subgroup of $pi_1 \( Y \)$ is finite-index abelian in $G$. ◻
]

== 4 Four genus-one factors over the root orbifold <sec:quadrics>

We construct the manifold in Proposition 8. No specialness assumption is used in the construction itself.

#thm([Proposition 4.1.])[
  #emph[Let $X$ be a connected smooth projective fourfold and $D$ a nonempty smooth connected reduced divisor. There is a connected smooth projective eightfold $Y$ with a map to $root(2, \( X \, D \))$ whose coarse map $g : Y arrow.r X$ satisfies all the hypotheses of Proposition 8. Its smooth general fibre is a product of four genus-one curves.]
] <prop:eightfold>

The parameter choice has two roles. Four independent factors eliminate stabilizers over the three-dimensional divisor, while a separate rank estimate supplies a submersive point over the general point of every base divisor. Both are needed in Proposition 8; generic smoothness alone would not justify the descent of all differential tensors.

Choose a line bundle $M$ such that $M$ and $M \( - D \)$ are globally generated. This is possible by taking a sufficiently high power of an ample line bundle. On $cal(X)$, with $T$ as in (1.2), put

$ V = cal(O)_(cal(X))^(xor 2) xor T^(xor 2) \, #h(2em) cal(P) = underbrace(upright(bold(P))_(cal(X)) \( V \) times_(cal(X)) dots.h.c times_(cal(X)) upright(bold(P))_(cal(X)) \( V \), 4 upright(" factors")) . $

All four factors are over the #emph[same] root orbifold. In a root chart there is one diagonal sign action on their product.

In factor $j$, use vector coordinates $z_(j 1) \, dots.h \, z_(j 4)$ and choose two diagonal quadratic equations

#[#set math.equation(numbering: n => "(4.1)")
 $ q_(j nu) = sum_(i = 1)^4 a_(j nu i) z_(j i)^2 = 0 \, #h(2em) j = 1 \, dots.h \, 4 \, quad nu = 1 \, 2 \, $ <eq:quadrics>]

where, independently for all $j \, nu \, i$,

$ a_(j nu i) in cases(delim: "{", H^0 \( X \, M \) \, & i = 1 \, 2 \,, H^0 \( X \, M \( - D \) \) \, & i = 3 \, 4 .) $

The squares of the last two coordinates take values in $T^2 = pi^(*) cal(O)_X \( D \)$, so each equation is a section of the appropriate $cal(O) \( 2 \) ⊗ pi^(*) M$. Let $sans(A)$ denote the affine space of all these coefficients, and let $cal(S)_a subset cal(P)$ be the simultaneous zero locus for $a in sans(A)$.

In compatible frames at $x in X$, write the two rows in factor $j$ as a $2 times 4$ matrix $C_j \( x \)$. The ranks of its specified column submatrices are independent of the choice of frames. Evaluation onto the four matrices is surjective at every $x$, by global generation and independence of the coefficient choices. This includes $x in D$: a coefficient in $M \( - D \)$ is evaluated in the fibre of that line, and is paired with a square in $cal(O)_X \( D \)$. Its numerical value is not required to vanish on $D$.

#thm([Lemma 4.2.])[
  (Simultaneous parameter choice).  #emph[There is a choice $a in sans(A)$ with the following properties.]
  + #emph[ The zero locus $cal(S)_a$ is smooth in its root charts.]
  + #emph[ It has no nontrivial stabilizers.]
  + #emph[ There is a closed subset $Z subset X$ of codimension at least two such that every matrix obtained from any $C_j \( x \)$ by deleting one column has rank two for $x in.not Z$.]
  + #emph[ On a nonempty open $B subset X \\ D$, every $2 times 2$ minor of every $C_j \( x \)$ is nonzero.]
] <lem:parameters>

#proof[
  Take a finite algebraic trivializing cover of $X$ for the bundles involved, with smooth root charts
  $ W = { \( x \, w \) : w^2 = t \( x \) } arrow.r U \, $
  where $t$ is the local divisor equation. These charts are smooth since $D$ is smooth and reduced; away from $D$ they are #emph[étale]. Their products with the four projective spaces are smooth. At any point of such a product, each equation in (4.1) has nonzero evaluation as a linear functional on its own parameter block: at least one coordinate in that projective factor is nonzero. The eight evaluations are independent. Thus the universal incidence over the chart product is the kernel of a surjective vector-bundle map from the parameter bundle to the eight equation lines, and is smooth.
  Generic smoothness in characteristic zero makes its fibres over a dense parameter open smooth. Indeed, each component of the critical locus has image of dimension smaller than $dim sans(A)$, since a dominating component would have generically surjective differential on its smooth locus, contradicting criticality. Images of nondominating components may likewise be discarded. There are finitely many algebraic charts, so one common dense open of parameters proves Lemma 4.2.
  Only points over $D$ can have nontrivial stabilizer. There the involution on a factor sends
  $ \[ z_1 : z_2 : z_3 : z_4 \] mapsto \[ z_1 : z_2 : - z_3 : - z_4 \] . $
  Its fixed locus is the union of the two eigenspace lines. If a fixed point satisfies both equations, either the first pair of columns or the last pair of columns of $C_j \( x \)$ is dependent. Each of these determinant conditions is a proper hypersurface in matrix space. A fixed point in the fourfold product therefore requires one such condition in #emph[each] of the four independent matrices. At fixed $x in D$ its parameter codimension is four. The bad incidence over $D$ has dimension at most
  #[#set math.equation(numbering: n => "(4.2)")
   $ dim sans(A) + dim D - 4 = dim sans(A) - 1 . $ <eq:fixed-dimension>]
  General parameters avoid its image. This excludes stabilizers above every point of $D$, including degenerate fibres, and proves Lemma 4.2.
  For one specified three-column submatrix, rank at most one has codimension two in the space of $2 times 3$ matrices. Surjective evaluation implies that its incidence over $X$ has dimension at most $dim sans(A) + 2$. For a general parameter its bad base locus has dimension at most two, by the fibre-dimension theorem. The finitely many choices of factor and deleted column can be treated simultaneously. Their union is closed and gives Lemma 4.2.
  Finally choose a point $x_0 in X \\ D$. By evaluation surjectivity, all pair minors can be made nonzero at $x_0$; for example the columns $\( 1 \, lambda_i \)^(sans(t))$ with distinct $lambda_i$ have this property. This is a nonempty Zariski-open parameter condition and can be intersected with the preceding dense opens. Nonvanishing then holds on an open neighbourhood $B$ of $x_0$, proving Lemma 4.2. ◻
]

Fix such a parameter and write $cal(S) = cal(S)_a$. Freeness and smoothness mean that its chart quotients glue to an ordinary smooth complex space $S$ with a map $S arrow.r cal(X)$. In particular the quotient of each source chart is covered #emph[unramifiedly] by that chart; its map to the base root chart gives the local lifts on $S$.

#thm([Lemma 4.3.])[
  (Projectivity).  #emph[The space $S$ is projective.]
] <lem:projectivity>

#proof[
  Square the four coordinates in each factor. The identification $T^2 = pi^(*) cal(O)_X \( D \)$ gives a globally defined invariant map to the ordinary projective variety
  #[#set math.equation(numbering: n => "(4.3)")
   $ Q = underbrace(upright(bold(P))_X \( E_0 \) times_X dots.h.c times_X upright(bold(P))_X \( E_0 \), 4 upright(" factors")) \, #h(2em) E_0 = cal(O)_X^(xor 2) xor cal(O)_X \( D \)^(xor 2) . $ <eq:square-target>]
  Its map on a root chart is the finite root map $W arrow.r U$ together with the finite projective coordinate-square maps. Restriction to the closed zero locus remains finite. Passing to the finite-group quotient preserves finiteness: over an affine target this takes an invariant subalgebra of a finite algebra, which is again finite. These invariant algebras glue under the bundle transitions, since the coordinate-square construction is invariant and global. Hence $S arrow.r Q$ is a finite analytic map.
  For completeness, a finite analytic space over a complex projective variety algebraizes by projective GAGA #cite(label("GAGA")). Its finite coherent direct-image algebra, including multiplication and unit, algebraizes, and relative spectrum recovers the space after analytification. A finite algebraic morphism is projective #cite(label("Stacks")) Tag 01WG. Thus $S$ is projective and in particular compact. ◻
]

#thm([Lemma 4.4.])[
  (Fibres and submersions over base divisors).  #emph[The map $S arrow.r X$ is smooth over $B$ with connected fibres that are products of four genus-one curves. Above every root-chart point with image in $X \\ Z$, it has a point at which the lifted map to that chart is a submersion.]
] <lem:fibres-witnesses>

#proof[
  At $x in B$, consider one matrix $C = C_j \( x \)$. It has rank two. Coordinate squaring on $upright(bold(P))^3$ is finite and surjective; the common quadric zero set is its inverse image of $upright(bold(P)) \( ker C \) tilde.eq upright(bold(P))^1$. Thus it is nonempty and has dimension one. At a solution, put $b_i = z_i^2$. A nonzero vector $b in ker C$ cannot have support one or two, since every pair of columns is independent. The vertical derivative
  #[#set math.equation(numbering: n => "(4.4)")
   $ 2 C "diag" \( z_1 \, z_2 \, z_3 \, z_4 \) $ <eq:vertical-jacobian>]
  therefore has rank two. It annihilates the radial direction at a solution, so it still has rank two on the projective tangent space. This proves both smoothness of the curve and submersivity of the family over $B$.
  The curve is a smooth complete intersection of two quadrics in $upright(bold(P))^3$. Its Koszul resolution is
  $ 0 arrow.r cal(O)_(upright(bold(P))^3) \( - 4 \) arrow.r cal(O)_(upright(bold(P))^3) \( - 2 \)^(xor 2) arrow.r cal(O)_(upright(bold(P))^3) arrow.r cal(O)_C arrow.r 0 . $
  The intermediate cohomology vanishings for line bundles on $upright(bold(P))^3$ give $H^0 \( C \, cal(O)_C \) = upright(bold(C))$, hence connectedness #cite(label("Stacks")) Tag 01XS. Adjunction gives $K_C = cal(O)_C$. Thus $C$ is a genus-one curve and its cotangent line is trivial. Taking four factors proves the first assertion and triviality of the cotangent bundle of each product fibre.
  Now let $x in.not Z$, possibly on $D$. In each matrix $C_j \( x \)$, the three columns remaining after any deletion span $upright(bold(C))^2$. Its kernel is consequently contained in no coordinate hyperplane: one can prescribe a chosen coordinate to be one and solve for the other three. A vector space over $upright(bold(C))$ is not the union of finitely many proper linear subspaces, so its kernel contains a vector $b$ with all four coordinates nonzero. Choose square roots $z_i$ of its entries. Formula (4.4) then has rank two. Choosing such a point in each factor makes the full vertical derivative of the eight equations surjective. The implicit function theorem gives a submersion from their zero set to the base root chart at this tuple. The argument works for either chosen chart point over $x$ and in particular for $w = 0$. ◻
]

#proof[
  The smooth projective $S$ has disjoint connected components. Its fibres over $B$ are connected and nonempty, so there is exactly one component $Y$ dominating $X$. More explicitly, the proper image of a dominating component is all of $X$; two such components would disconnect the fibres over $B$. Every submersive point constructed in Lemma 12 lies on a dominating component, since its local image has full dimension. Therefore all these points lie on $Y$.
  The variety $Y$ is connected smooth projective, of dimension $4 + 4 = 8$. Its map $g : Y arrow.r X$ is surjective and has the asserted fibres over $B$. Its map to $cal(X)$ gives
  $ g^(*) D = 2 f^(*) cal(D) . $
  The pullback of the root-divisor section is generically nonzero, so $f^(*) cal(D)$ is an effective integral Cartier divisor. Thus every divisorial multiplicity over $D$ is even. Since $"codim"_X Z gt.eq 2$, every base prime divisor has general point outside $Z$. Lemma 12 supplies the ordinary or root-chart submersions there. All four conditions of Proposition 8 follow. ◻
]

#proof[
  Apply Proposition 9 to $\( X \, D \)$. Specialness of $cal(X)$ and Proposition 8 make the resulting eightfold $Y$ special and give $pi_1 \( Y \) arrow.r.twohead G$. Assumption 2, in dimension eight, makes $pi_1 \( Y \)$ virtually abelian. Its quotient $G$ is virtually abelian as claimed. ◻
]

== 5 An alternative construction using auxiliary double covers <app:branched>

We give an alternative construction of a manifold satisfying Proposition 8. Throughout this appendix, $X$ is a connected smooth projective complex fourfold, $D subset X$ is a nonempty smooth connected reduced divisor, and $cal(X)$ is its order-two root orbifold. An affine action on a product of elliptic curves makes the involution associated with $D$ act freely while retaining selected auxiliary fixed loci. Blowing up these loci produces a smooth quotient with the ordinary submersions needed along the auxiliary branch divisors.

#thm([Lemma 5.1.])[
  (An auxiliary branched cover).  #emph[There are distinct smooth prime divisors $B_1 \, dots.h \, B_5$, with $D + sum_i B_i$ simple normal crossing, and a connected smooth projective Galois cover 
$ pi : S arrow.r X \, #h(2em) A = \( bb(Z) \/ 2 bb(Z) \)^5 = chevron.l e_1 \, dots.h \, e_5 chevron.r \, $

 with the following local descriptions. Put $tau = e_1 + dots.h.c + e_5$ and $I \( x \) = { i : x in B_i }$.]
  + #emph[If $x in.not D$, a chart over $x$ takes independent square roots of the coordinates defining $B_i$, $i in I \( x \)$. Its stabilizer is generated by the corresponding $e_i$, each changing the sign of its own root coordinate.]
  + #emph[If $x in D$, choose coordinates $z_0 \, z_i$ defining $D \, B_i$ for $i in I \( x \)$. The charts over $x$ take independent roots 
$ w_0^2 = z_0 \, #h(2em) w_i^2 = z_i quad \( i in I \( x \) \) \, $

 and leave the remaining coordinates unchanged. Their stabilizer is $chevron.l tau \, e_i : i in I \( x \) chevron.r$; here $tau$ changes the sign of $w_0$ alone, and $e_i$ changes the sign of $w_i$ alone.]
  #emph[In particular, $pi^(*) D$ is twice a reduced divisor, and $S^(e_i)$ is precisely the reduced inverse image of $B_i$, a smooth divisor all of whose components dominate $B_i$.]
] <lem:branched-cover>

#proof[
  Choose a line bundle $H$ such that $H^(⊗ 2) \( - D \)$ is very ample. Successive general members $B_i$ of this system are smooth and irreducible and can be chosen transverse to all the preceding strata, including those in $D$. Thus the asserted simple normal crossing condition follows from Bertini’s theorem. In particular, at a point of $D$ at most three of the $B_i$ pass through the point.
  Let $s_D$ and $s_i$ be the divisor sections for $D$ and $B_i$. Form the cover by adjoining roots
  $ y_i^2 = s_D s_i quad \( 1 lt.eq i lt.eq 5 \) \, $
  where $y_i$ takes values in $H$, and normalize. In a rational frame of $H$, the five right-hand sides have independent classes modulo squares in $bb(C) \( X \)^(*)$. Indeed, the order along $B_i$ of a product of these functions is odd exactly when its $i$th factor occurs an odd number of times. A product representing a square must therefore have every exponent even. The resulting field extension has degree $2^5$, with the independent sign changes as its Galois group. Its normalization $S$ is connected and finite over $X$, hence projective.
  We compute this normalization locally analytically. Units in the equations have holomorphic square roots after shrinking the neighborhood. Off $D$, the equations give independent roots of the passing $B_i$ coordinates; the other roots separate the local sheets. At $x in D$, the equations become
  $ y_i^2 = z_0 z_i quad \( i in I \( x \) \) \, #h(2em) y_j^2 = z_0 quad \( j in.not I \( x \) \) . $
  There is an index $j_0 in.not I \( x \)$. On a component set $w_0 = y_(j_0)$ and, in its meromorphic function field, set $w_i = y_i \/ w_0$ for $i in I \( x \)$. These functions satisfy the displayed independent root equations. The other $y_j$ equal $plus.minus w_0$, and their relative signs separate the components. The independent-root charts are finite and normal over the base chart and have exactly the prescribed generic sheets, so they are its normalization. They are smooth. The sign changes give the stabilizers and their actions stated in the lemma.
  For completeness, every element of the latter stabilizer with nonzero $tau$-coefficient has at least
  $ 5 - \| I \( x \) \| gt.eq 2 $
  nonzero coordinates in the basis $e_1 \, dots.h \, e_5$. Consequently $e_i$ belongs to a point stabilizer precisely over $B_i$. In the local charts its fixed locus is the root-coordinate hyperplane for $B_i$. This proves the assertion about $S^(e_i)$. Each of its components has dimension three, so its finite image in the irreducible divisor $B_i$ has dimension three and equals $B_i$. The equation $z_0 = w_0^2$ also proves the assertion about $pi^(*) D$. ◻
]

#thm([Lemma 5.2.])[
  (An action on a product of elliptic curves).  #emph[There is an action of $A$ on an abelian variety $F$ of dimension ten such that every element with at least two nonzero coordinates in the basis $e_i$ is fixed-point-free. Each $e_i$ has a nonempty smooth fixed locus of codimension four, and these five fixed loci are pairwise disjoint.]
] <lem:branched-action>

#proof[
  Fix an elliptic curve $E$ and a nonzero point $c in E \[ 2 \]$. Set
  $ F = product_(1 lt.eq i < j lt.eq 5) E_(i j) \, #h(2em) E_(i j) = E . $
  On the factor $E_(i j)$ let $e_i$ act by $v mapsto - v$, let $e_j$ act by $v mapsto c - v$, and let the other generators act trivially. The two displayed involutions commute because $2 c = 0$, and their product is translation by $c$. If an element has both $i$ and $j$ in its support, it therefore acts without fixed points on this factor and hence on $F$.
  For a single $e_i$, its four moving factors each carry an involution of the form $v mapsto a - v$. The equation $2 v = a$ has solutions and a finite reduced solution set. Thus $F^(e_i)$ is a nonempty disjoint union of translates of products of the six remaining elliptic factors. It is smooth of codimension four. Two different generators cannot fix the same point, since their product is fixed-point-free. ◻
]

#thm([Proposition 5.3.])[
  (A manifold model of dimension fourteen).  #emph[There is a connected smooth projective variety $Y$ of dimension fourteen and a surjective morphism $f : Y arrow.r X$ with the following properties.]
  + #emph[Over 
$ U = X \\ #scale(x: 120%, y: 120%)[\(] D union B_1 union dots.h.c union B_5 #scale(x: 120%, y: 120%)[\)] \, $

 the map is a holomorphically locally trivial proper bundle with connected fibre $F$, the abelian variety of Lemma 14.]
  + #emph[The divisor $f^(*) D$ is twice a reduced divisor. At every point over $D$, the map admits a local holomorphic lift to its root chart. At points over a general point of $D$, such a lift can be chosen submersive.]
  + #emph[Above a general point of every prime divisor of $X$ other than $D$, there is a point at which $f$ is a submersion to $X$.]
] <prop:branched-model>

#proof[
  Use the diagonal action of $A$ on $V = S times F$. By Lemma 14, a nontrivial point stabilizer can only be generated by a single $e_i$. The entire nonfree locus is the union of the pairwise disjoint smooth subvarieties
  $ Z_i = S^(e_i) times F^(e_i) #h(2em) \( 1 lt.eq i lt.eq 5 \) . $
  They have codimension five. They are invariant under $A$, since $A$ is abelian. At a point of $Z_i$ the stabilizer is exactly $chevron.l e_i chevron.r$. In local coordinates it fixes the tangent coordinates to $Z_i$ and negates all five normal coordinates: one from $S$, and four from the moving elliptic factors.
  Blow up their disjoint union and take the quotient:
  $ b : hat(V) = "Bl"_(union_i Z_i) \( V \) arrow.r V \, #h(2em) q : hat(V) arrow.r Y = hat(V) \/ A . $
  The action lifts to the blowup. We verify that $Y$ is smooth. If $\( v_0 \, dots.h \, v_4 \)$ are the normal coordinates just described, then in the blowup chart with distinguished coordinate $v_j$ we have coordinates
  $ t = v_j \, #h(2em) a_k = v_k \/ v_j quad \( k eq.not j \) \, $
  besides the tangent coordinates. The stabilizer acts by
  $ \( t \, \( a_k \) \, upright("tangent coordinates") \) mapsto \( - t \, \( a_k \) \, upright("tangent coordinates") \) . $
  Its quotient chart has smooth coordinates $t^2 \, \( a_k \)$ and the tangent coordinates. Every stabilizer on $hat(V)$ is contained in the stabilizer of its image in $V$; away from the exceptional divisors it is trivial. These charts therefore establish smoothness everywhere.
  The blowup is connected, smooth, and projective. Its finite-group quotient is projective: tensoring the translates of an ample line bundle gives an invariant linearized ample line bundle, whose invariant section ring constructs the projective quotient. The quotient is connected and has the same dimension as $V$, namely $4 + 10 = 14$. The morphism $pi compose "pr"_S compose b$ is invariant and descends to a surjective morphism $f : Y arrow.r X$.
  Over $U$, the map $S arrow.r X$ is an étale $A$-torsor and the blowup has no centre. Hence
  $ f^(- 1) \( U \) = \( S \|_U times F \) \/ A . $
  Analytically trivializing the finite étale torsor identifies this map locally with projection from a product with $F$. This proves the first assertion, including properness, smoothness, and connectedness of these fibres. Their cotangent bundles are trivial.
  We next check the divisor $D$ at all points, not only at generic points away from the auxiliary divisors. Let $x in D$ and use the coordinates of Lemma 13. A stabilizer at a point of $S times F$ over $x$ is either trivial or $chevron.l e_i chevron.r$ for some $i in I \( x \)$. Indeed an inertia element involving $tau$ has support of size at least two and has no fixed point on $F$. In particular, every possible product stabilizer fixes the function $w_0$, whose square is the pullback of $z_0$.
  The pullback of $w_0$ to a blowup chart is still holomorphic and is fixed by the stabilizer of every point in that chart. A neighborhood of the corresponding point of the finite quotient is the quotient of a sufficiently small neighborhood by this stabilizer. Thus $w_0$ descends there to a holomorphic function whose square is $f^(*) z_0$. Together with the unchanged base coordinates it gives a local holomorphic lift to the root chart of $D$. This argument includes points on exceptional divisors and all intersections with the auxiliary branch divisors.
  We can also determine the multiplicities exactly. Write $pi^(*) D = 2 R$ with $R$ reduced. No component of a centre $Z_i$ is contained in $R times F$, because every component of $S^(e_i)$ dominates $B_i eq.not D$. Hence blowing up introduces no exceptional component in the pullback of $R times F$, and
  $ \( f q \)^(*) D = 2 hat(R) \, $
  where $hat(R)$ is its reduced strict transform. At a general point of every component of $hat(R)$ the image in $D$ avoids all $B_i$. There the only nontrivial inertia of $S arrow.r X$ is generated by $tau$, which acts freely on $F$, so $q$ is unramified. Every prime component of $f^(*) D$ is dominated by a prime component of $hat(R)$, since $q$ is finite. The ramification index there is one, and the displayed equality proves that its coefficient in $f^(*) D$ is exactly two.
  Over a general point of $D$, all the auxiliary divisors are absent. There are no blowup centres and the diagonal action is free. Consequently the quotient is locally isomorphic to $S times F$, and projection to $\( w_0 \, z_2 \, z_3 \, z_4 \)$ is a submersive local lift to the root chart. This completes the second assertion.
  Finally fix $i$ and take a general point of $B_i$ outside $D$ and the other $B_j$. Choose a point of $S^(e_i)$ above it and a point of $F^(e_i)$. Near the resulting point of $Z_i$, let $w$ be the cover coordinate with $w^2 = z_i$, where $z_i$ defines $B_i$. The five normal coordinates to the centre are $w \, u_1 \, dots.h \, u_4$, with the $u_j$ coming from the moving elliptic factors. The other three base coordinates are tangent to the centre and remain unchanged.
  In the blowup chart distinguished by $w$, use
  $ w \, quad u_1 \/ w \, dots.h \, u_4 \/ w $
  as its normal-direction coordinates. Passing to the local quotient replaces $w$ by $xi = w^2$ and leaves the ratios and all tangent coordinates unchanged. The map to $X$ then has coordinates
  $ z_i = xi \, #h(2em) upright("the other three base coordinates unchanged") . $
  It is a submersion, including at $xi = 0$ on the exceptional divisor. This provides the required point above each general point of $B_i$. Every other prime divisor distinct from $D$ has its general point in $U$, where $f$ is smooth. The third assertion follows. ◻
]

If $cal(X)$ is special, Proposition 8 now shows that this $Y$ is special and gives an epimorphism

$ pi_1 \( Y \) arrow.r pi_1 \( X \\ D \) \/ chevron.l #h(-0.16667em) chevron.l gamma^2 chevron.r #h(-0.16667em) chevron.r . $

Assumption 2, applied to this special smooth projective fourteenfold, makes $pi_1 \( Y \)$ virtually abelian. Its finite-index abelian subgroup has finite-index abelian image under the displayed surjection. This gives a second proof of Theorem 3.


#bibliography("refs.bib", style: "ieee", title: [References])
