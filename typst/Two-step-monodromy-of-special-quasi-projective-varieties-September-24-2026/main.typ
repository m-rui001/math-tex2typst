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

#align(center)[#text(size: 16pt, weight: "bold")[Two-step monodromy of special \
quasi-projective varieties]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Campana’s theory of special varieties relates the absence of fibrations of general type to restrictions on
  topology and monodromy #cite(label("Campana2004")) #cite(label("Campana2011")).
  Throughout the monodromy statements, #emph[special] means special in the open-variety convention of
  #cite(label("CDY2025")) Definition 2.1: after any proper birational modification,
  every dominant algebraic fibration with connected general fibre onto a positive-dimensional normal
  quasi-projective base has orbifold-base Kodaira dimension smaller than the dimension of that base.
  The orbifold-base Kodaira dimension is computed birationally,
  using infimum multiplicities on smooth compactifications; a removed divisor has multiplicity infinity.
  Section 4 spells out these conventions and the upper-model condition on orbifold pairs that we verify for our
  surface example. That pair condition implies the open-variety condition used here.
  For a smooth curve $C = macron(C) \\ B$, specialness is equivalent to

$ deg \( K_(macron(C)) + B \) = 2 g \( macron(C) \) - 2 + \# B lt.eq 0 . $

Thus elliptic curves are special, whereas a projective line with at least three punctures is not.

In the compact setting, Campana’s abelianity conjecture asks for a virtually abelian ordinary fundamental group
  #cite(label("Campana2004")) Conjecture 7.1, p. 595. Campana–Claudon proved this for special compact Kähler
  threefolds #cite(label("CampanaClaudon2014")) Theorem 1.3;
  the companion #cite(label("OpenAICompactAbelianity2026")) Theorem 1.1 proves it in arbitrary complex dimension.
  The open setting admits nonabelian nilpotent groups. Our first result concerns complex linear images of ordinary
  fundamental groups in this setting.

For a group $G$, put $gamma_1 G = G$ and $gamma_(r + 1) G = \[ G \, gamma_r G \]$.
  It has #emph[nilpotency class at most two] if $gamma_3 G = 1$, equivalently if every commutator is central.
  A property holds #emph[virtually] if it holds in a subgroup of finite index.

#thm([Theorem 1.1.])[
  (Two-step linear monodromy).  #emph[Let $V$ be a connected smooth special complex quasi-projective variety.
    For every positive integer $d$ and every representation $rho : pi_1 \( V \) arrow.r
    "GL"_d \( upright(bold(C)) \)$, the image $rho \( pi_1 \( V \) \)$ has a subgroup of finite index and
    nilpotency class at most two.]
] <thm:linear>

Cadorel–Deng–Yamanoi established virtual nilpotence of these linear images:
  the identity component of their Zariski closure is a direct product of a unipotent group and a torus
  #cite(label("CDY2025")) Theorem A/4.1. Cao–Deng–Hacon–Păun subsequently announced the sharp class-two conclusion
  of Theorem 1 #cite(label("CDHP2026")) Theorem A, equivalently Theorem 6.2.
  Priority for that conclusion belongs to their work. We give a different proof from the independent CDY inputs
  and a structural theorem about unipotent completion.

The bound is optimal. Cadorel–Deng–Yamanoi construct a smooth special quasi-projective surface with a linear,
  two-step nilpotent fundamental group that is not virtually abelian #cite(label("CDY2025")) Example 4.25 and
  Remarks 4.28–4.29. It is the complement of the zero section in a degree-one line bundle on an elliptic curve;
  its group is a Heisenberg central extension. Its ruled compactification with the zero and infinity sections as
  reduced boundary has $K + D = 0$ #cite(label("CDY2025")) Lemma 5.10,
  and is special also in the orbifold-pair convention by #cite(label("Campana2011")) arXiv version, Theorem 6.7.

=== 1.1 The structural completion theorem <the-structural-completion-theorem>

A #emph[semiabelian variety] is a connected algebraic group fitting into an exact sequence

$ 1 arrow.r upright(bold(G))_m^r arrow.r A arrow.r B arrow.r 1 \, $

where $B$ is an abelian variety. For a connected smooth quasi-projective variety $V$ with a chosen base point,
  the algebraic #emph[quasi-Albanese map] $a_V : V arrow.r "Alb" \( V \)$ is the universal based algebraic
  morphism to a semiabelian variety. This is the open analogue of the Albanese map.
  We use the construction and universal property recalled by Fujino #cite(label("Fujino2024")) Definition 2.18 and
  Theorem 3.16; universality concerns algebraic morphisms, not arbitrary holomorphic maps.

The #emph[rational unipotent completion] of a group $Gamma$ is the universal pro-unipotent algebraic group
  receiving a homomorphism from $Gamma$. Here pro-unipotent means an inverse limit of unipotent algebraic groups,
  and universality means that every homomorphism from $Gamma$ to a finite-dimensional unipotent algebraic group
  over $upright(bold(Q))$ factors uniquely through the completion.
  For the finitely generated groups considered here and each integer $c gt.eq 1$,
  its #emph[canonical $c$-step quotient] is the universal unipotent quotient of nilpotency class at most $c$:
  every homomorphism to a unipotent algebraic group of class at most $c$ factors uniquely through it.
  Section 2 gives its Lie-algebra construction.

#thm([Theorem 1.2.])[
  (Completion under quasi-Albanese exactness).  #emph[Let $V$ be a connected smooth complex quasi-projective
    variety and let $a : V arrow.r A = "Alb" \( V \)$ be its algebraic quasi-Albanese map.
    Suppose $a$ is dominant, choose a smooth connected general fibre $F$ and a point $v in F$,
    and assume that the sequence of ordinary fundamental groups
#[#set math.equation(numbering: n => "(1.1)")
 $ pi_1 \( F \, v \) arrow.r Gamma := pi_1 \( V \, v \) arrow.r^(a_(*)) Lambda :=
   pi_1 \( A \, a \( v \) \) arrow.r 1 $ <eq:exact>]

 is exact. Then every canonical rational unipotent quotient of $Gamma$ has nilpotency class at most two.
   The full rational unipotent completion is a finite-dimensional unipotent algebraic group of class at most two.
   Every finite-dimensional complex unipotent representation of $Gamma$ also has image of class at most two.]
] <thm:completion>

Exactness in (1.1) identifies the image of the fibre group with the whole kernel of $a_(*)$;
  the first arrow need not be injective. The theorem assumes neither specialness of $V$ or $F$ nor initial
  nilpotence of the discrete group $Gamma$. Its geometric hypotheses are useful because the quasi-Albanese map
  identifies first homology, and the algebraic fibre inclusion gives a morphism of pointed mixed Hodge structures.
  These two facts connect the actual fibre image to the commutator of each canonical unipotent quotient.

The proof uses Deligne’s mixed Hodge theory for smooth open varieties #cite(label("Deligne1971")),
  Morgan’s foundational work on nilpotent homotopy data #cite(label("Morgan1978")) #cite(label("Morgan1986")),
  and Hain’s canonical pointed construction #cite(label("Hain1987")).
  At each finite stage, let $frak(g)$ be the canonical nilpotent Lie algebra and $frak(k)$ the image of the fibre
  Lie algebra. Exactness and the quasi-Albanese first-homology isomorphism imply
  $frak(k) = \[ frak(g) \, frak(g) \]$. The abelianization of $frak(k)$ is a quotient of
  $H_1 \( F \, upright(bold(Q)) \)$, with weights $- 1$ and $- 2$,
  while its position in a commutator forces weights at most $- 2$. It is therefore pure of weight $- 2$.
  The conjugation bracket has source of weights at most $- 3$, so it vanishes in this abelianization.
  This yields $gamma_3 frak(g) subset.eq gamma_4 frak(g)$, and nilpotence forces both terms to vanish.
  We first prove the bound on canonical quotients carrying mixed Hodge structures,
  then pass to arbitrary unipotent representations by universality.

To deduce Theorem 1, we apply this structural result after a finite étale cover.
  Such covers preserve specialness, and the quasi-Albanese dominance and ordinary exactness results of
  Cadorel–Deng–Yamanoi apply to the cover itself #cite(label("CDY2025")) Theorem 3.1,
  Lemma 4.4 and Proposition 4.13. The resulting unipotent image has class at most two,
  and the torus factor in the Zariski closure is abelian. This also explains why no specialness assertion about
  the general fibre is needed.

There are several predecessors for the relation between Albanese maps and nilpotent quotients.
  In the compact Kähler case, Campana proved that surjectivity of the Albanese map makes every torsion-free
  nilpotent quotient abelian #cite(label("Campana1995")) Corollary 3.1.
  His argument uses a homological criterion of Stallings. Aguilar Aguilar–Campana obtained the same abelianity
  conclusion for smooth quasi-projective varieties whose quasi-Albanese map is proper and surjective
  #cite(label("AguilarAguilarCampana2025")) arXiv version, Corollary 2(2).
  Theorem 2 permits a nonproper map; the weight-$- 2$ contribution from the fibre boundary accounts for its
  class-two conclusion. When $H_1 \( F \, upright(bold(Q)) \)$ is pure of weight $- 1$,
  the proof instead gives an abelian completion (Remark 4).

Rogov obtained another completion theorem through higher Albanese manifolds #cite(label("RogovHigher2026"))
  Theorem B, equivalently Theorem 7.9 and Corollary 7.10. For a normal quasi-projective variety and a level $s
  gt.eq 3$, he assumes either dominance of its $s$th higher Albanese map or a definable biholomorphism between
  that higher Albanese manifold and the definable analytification of a quasi-projective variety.
  He proves stabilization at level two. Theorem 2 instead starts from ordinary fundamental-group exactness for the
  classical quasi-Albanese map. Ordinary dominance alone is not substituted for either set of hypotheses.

=== 1.2 A special surface with nonspecial quasi-Albanese fibre <a-special-surface-with-nonspecial-quasi-albanese-fibre>

Campana asked whether general Albanese fibres of compact special varieties are special #cite(label("Campana2004"))
  Question 5.4, p. 577. Campana–Claudon answered this for smooth projective varieties
  #cite(label("CampanaClaudon2016")) Theorem 2.4. The following open surfaces show that the analogous assertion
  fails with reduced boundary. The construction retains exceptional affine lines after deleting the strict
  transforms of horizontal elliptic curves.

#thm([Theorem 1.3.])[
  #emph[Let $E$ be a complex elliptic curve, let $q_1 \, dots.h \,
    q_n$ be distinct points of $upright(bold(P))^1$, where $n gt.eq 3$, and choose points $e_1 \, dots.h \,
    e_n$ of $E$. Let
$ b : Y = "Bl"_({ \( e_i \, q_i \) }_(i = 1)^n) \( E times upright(bold(P))^1 \) arrow.r E times upright(bold(P))^1 . $

 Write $D_i$ for the strict transform of $E times { q_i }$ and put $D = sum_i D_i$ and $X = Y \\ D$. Then:]
  + #emph[$\( Y \, D \)$ is a smooth projective special pair in the convention of #cite(label("CDHP2026"))
    Definitions 2.1–2.9, including every upper model in that definition.]
  + #emph[The morphism $a = \( "pr"_E compose b \) \|_X : X arrow.r E$ is the algebraic quasi-Albanese map,
    after choosing origins. Every fibre is connected, and its general fibre is $F tilde.eq upright(bold(P))^1 \\ {
    q_1 \, dots.h \, q_n }$.]
  + #emph[The induced map $a_(*) : pi_1 \( X \) arrow.r pi_1 \( E \)$ is an isomorphism.
    Thus $pi_1 \( X \) tilde.eq upright(bold(Z))^2$, and the homomorphism $pi_1 \( F \) arrow.r
    pi_1 \( X \)$ is trivial.]
] <thm:example>

The general fibre has logarithmic canonical degree $n - 2 > 0$, and so is not special.
  This contradicts the fibre-specialness assertion of #cite(label("CDHP2026")) Theorem E,
  equivalently Theorem 7.15 in the fixed version arXiv:2603.14539v2.
  The fibre’s ordinary group is free of rank $n - 1$, but its image in the total group is trivial.
  Thus the example identifies the difference between the fibre and the image controlled by Theorem 2;
  the total group $pi_1 \( X \) = upright(bold(Z))^2$ satisfies the monodromy bound.

The geometric mechanism also explains the relevant orbifold calculation.
  Above each $q_i$, the complete fibre has one deleted component and one retained component,
  both of multiplicity one. The retained component makes the direct orbifold multiplicity equal to one.
  Contracting it before calculating the base forgets its contribution.
  Campana’s composition rule records precisely the exceptional-divisor hypotheses needed for equality of these two
  bases #cite(label("Campana2011")) arXiv version, Proposition 3.13.
  Section 7 identifies the resulting failure in #cite(label("CDHP2026")) Claim 7.17,
  where flatness over the Iitaka base is used as flatness over a different, contracted intermediate space.

A related construction of Cadorel–Deng–Yamanoi also retains an exceptional curve after deleting a boundary strict
  transform #cite(label("CDY2025")) Example 4.34. Here the product $E times
  upright(bold(P))^1$ produces a positive-dimensional nonspecial quasi-Albanese fibre.
  Complete elliptic slices and orbifold Riemann–Hurwitz verify specialness on every required upper model.
  A complete section and the absence of nonconstant units establish the quasi-Albanese universal property.
  Local discs through the retained exceptional curves kill every puncture loop and give the ordinary fundamental group.

Section 2 proves Theorem 2, and Section 3 derives Theorem 1 and its logarithmic-Kodaira-zero consequence.
  Section 4 sets out the orbifold conventions and surface geometry.
  Sections 5 and 6 prove Theorem 3; Section 7 explains the composition calculation.
  Section 8 records the remaining ordinary-group question. The representation results do not assume that the
  ordinary group embeds in its completion, and no such embedding is supplied by the argument.

== 2 Exactness and unipotent completion <sec:mhs>

We prove Theorem 2. Ordinary fundamental-group exactness identifies the fibre image with the commutator at each
  finite unipotent stage; the mixed Hodge structures then force this image to be central.
  The proof keeps these finite stages canonical so that every map to which a weight argument is applied is a
  mixed-Hodge morphism.

=== 2.1 The canonical quotients and their weights <the-canonical-quotients-and-their-weights>

Fix a connected smooth complex quasi-projective variety $V$ and a base point $v in V$.
  Put $Gamma = pi_1 \( V \, v \)$ and write $frak(m)_V$ for the complete pronilpotent Lie algebra of its rational
  unipotent completion. In characteristic zero the exponential and logarithm identify a unipotent algebraic group
  with its nilpotent Lie algebra, using the Baker–Campbell–Hausdorff multiplication.
  For $c gt.eq 1$, define the #emph[canonical $c$-step quotient] by

#[#set math.equation(numbering: n => "(2.1)")
 $ frak(g)_c = frak(m)_V \/ overline(gamma_(c + 1) frak(m)_V) \, wide U_c = exp \( frak(g)_c \) \,
   $ <eq:canonical-quotient>]

where $gamma_1 frak(m)_V = frak(m)_V$, $gamma_(r + 1) frak(m)_V = \[ frak(m)_V \, gamma_r frak(m)_V \]$,
  and closure is taken in the inverse-limit topology. The group $Gamma$ is finitely generated,
  so each $frak(g)_c$ is finite-dimensional. The canonical image of $Gamma$ is Zariski dense in $U_c$, and

#[#set math.equation(numbering: n => "(2.2)")
 $ frak(g)_c \/ \[ frak(g)_c \, frak(g)_c \] tilde.eq H_1 \( V \, upright(bold(Q)) \) . $ <eq:hurewicz>]

These constructions and their universal properties can be obtained from the completed group algebra
  #cite(label("Hain1987")) §2.5, Theorem 2.5.3 and Proposition 2.5.5.

We recall exactly the mixed-Hodge information used below.
  A rational mixed Hodge structure is a finite-dimensional rational vector space with an increasing weight
  filtration $W$ and a decreasing Hodge filtration on its complexification,
  such that each weight-graded piece is a pure Hodge structure.
  We say it has #emph[weights at most $r$] if $W_r$ is the entire space,
  and is #emph[pure of weight $r$] if also $W_(r - 1) = 0$. Morphisms preserve the filtrations and are strict:
  their images receive the same filtration as subobjects of the target and as quotients of the source.
  The category is abelian #cite(label("Deligne1971")) Theorem 2.3.5 and §2.3.8. Tensor weights add.

For smooth quasi-projective $V$, first cohomology has weights $1 \, 2$,
  so $H_1 \( V \, upright(bold(Q)) \)$ has weights $- 1 \, - 2$ #cite(label("Deligne1971")) Corollary 3.2.15(ii).
  The canonical Lie quotients $frak(g)_c$ carry mixed Hodge structures for which brackets and the Hurewicz map
  (2.2) are morphisms. Moreover a pointed algebraic map induces a morphism of these structures.
  We use Hain’s pointed construction #cite(label("Hain1987")) Theorem 6.3.1, p. 321 for this functoriality.
  It equips the completed Lie algebra with a pro-mixed Hodge structure compatible with its bracket.
  The closed lower-central ideals are topologically generated by iterated bracket images and are therefore
  pro-mixed-Hodge subobjects. The finite-dimensional quotients (2.1) inherit ordinary mixed Hodge structures;
  their transition maps and the maps induced by pointed algebraic morphisms are morphisms of these structures.
  Morgan’s foundational construction #cite(label("Morgan1978")) is part of the history of the method,
  but its original functoriality assertion was corrected in #cite(label("Morgan1986"));
  the stronger pointed statement needed here is supplied by Hain.

At finite stages, all lower-central ideals, images, kernels,
  and abelianizations below are therefore ordinary subobjects or quotients in the abelian category of mixed Hodge
  structures. Arbitrary unipotent representation quotients need not themselves carry the required Hodge structure.
  We prove the bound on the canonical quotients first and only then pass to arbitrary representations by universality.

We now assume all the hypotheses of Theorem 2, with $a : V arrow.r A$ dominant,
  $F$ a smooth connected general fibre, and the base point $v$ chosen in $F$.
  We use the ordinary exact sequence (1.1); properness and specialness of the fibre play no role.

=== 2.2 The fibre image is the commutator at every unipotent stage <the-fibre-image-is-the-commutator-at-every-unipotent-stage>

Let

$ N = "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( F \, v \) arrow.r Gamma #scale(x: 120%, y: 120%)[\)] . $

By (1.1), $N$ is normal and equals $ker a_(*)$. The fundamental group of a semiabelian variety is free abelian.
  The quasi-Albanese map induces an isomorphism

#[#set math.equation(numbering: n => "(2.3)")
 $ H_1 \( V \, upright(bold(Z)) \) \/ "Tor" H_1 \( V \, upright(bold(Z)) \) arrow.r^tilde.op
   H_1 \( A \, upright(bold(Z)) \) \, $ <eq:alb-integral-h1>]

as in #cite(label("Fujino2024")) Lemmas 3.11–3.12, arXiv v2 PDF, pp. 20–21.
  The first of those lemmas states integral surjectivity with torsion kernel;
  the proof of the second gives the rational mixed-Hodge identification. Thus

#[#set math.equation(numbering: n => "(2.4)")
 $ \[ Gamma \, Gamma \] subset.eq N \, wide N \/ \[ Gamma \, Gamma \] tilde.eq "Tor"
   H_1 \( V \, upright(bold(Z)) \) . $ <eq:almost-derived>]

In particular the latter quotient is finite. We do not assert equality of the two discrete subgroups when this
  torsion is nonzero.

Fix $c$. Let $K_c$ be the Zariski closure of the image of $N$ in $U_c$, and let $frak(k)_c = "Lie" K_c$.
  The pointed fibre inclusion induces a map of canonical $c$-step Lie quotients

$ frak(g)_c \( F \) arrow.r frak(g)_c \( V \) . $

Its image is $frak(k)_c$: images of morphisms of unipotent algebraic groups are closed,
  and the fibre group is dense in its own completion. This also equips $frak(k)_c$ with its image mixed Hodge structure.

We claim

#[#set math.equation(numbering: n => "(2.5)")
 $ K_c = \[ U_c \, U_c \] \, wide frak(k)_c = \[ frak(g)_c \, frak(g)_c \] . $ <eq:k-derived>]

Indeed, every element of $N$ has a positive power in $\[ Gamma \, Gamma \]$ by (2.4).
  The abelianization $U_c \/ \[ U_c \, U_c \]$ is an additive vector group, which has no nonidentity torsion.
  Hence the image of $N$ in it is zero and $K_c subset.eq \[ U_c \, U_c \]$.
  Conversely, normality of $N$ and density of $Gamma$ imply normality of $K_c$ in $U_c$.
  The dense image of $Gamma$ in $U_c \/ K_c$ is abelian, because $\[ Gamma \, Gamma \] subset.eq N$.
  The commutator morphism of the algebraic quotient vanishes on this dense subset of its product,
  and so the quotient is abelian. This gives the opposite inclusion and proves (2.5).
  In particular, no left-exactness assertion about unipotent completion has been used.

=== 2.3 Two weight bounds force centrality <two-weight-bounds-force-centrality>

We continue with the fixed finite-dimensional nilpotent Lie algebra $frak(g)_c$.
  Its lower-central graded pieces are generated by iterated brackets of its abelianization.
  More precisely, the $r$-fold iterated bracket induces a surjective mixed-Hodge morphism

$ H_1 \( V \, upright(bold(Q)) \)^(⊗ r) arrow.r gamma_r frak(g)_c \/ gamma_(r + 1) frak(g)_c . $

The target therefore has weights at most $- r$. Starting with $gamma_(c + 1) frak(g)_c =
  0$ and taking successive extensions down the lower-central filtration shows that $gamma_r
  frak(g)_c$ itself has weights at most $- r$. In particular,

#[#set math.equation(numbering: n => "(2.6)")
 $ W_(- 1) frak(g)_c = frak(g)_c \, wide frak(k)_c = \[ frak(g)_c \, frak(g)_c \] subset.eq W_(- 2) frak(g)_c .
   $ <eq:negative-weights>]

Consider its fibre-image abelianization

$ B_c = frak(k)_c \/ \[ frak(k)_c \, frak(k)_c \] . $

The surjection $frak(g)_c \( F \) arrow.r frak(k)_c$ induces a surjective mixed-Hodge map

#[#set math.equation(numbering: n => "(2.7)")
 $ H_1 \( F \, upright(bold(Q)) \) arrow.r B_c . $ <eq:fibre-h1-onto>]

The group $H_1 \( F \, upright(bold(Q)) \)$ has only weights $- 1 \, - 2$,
  because the chosen fibre is smooth and quasi-projective. Strictness of (2.7) gives $W_(- 3) B_c = 0$.
  On the other hand, strictness for the image $frak(k)_c subset.eq frak(g)_c$ and (2.6) give $W_(- 2) B_c = B_c$.
  Therefore

#[#set math.equation(numbering: n => "(2.8)")
 $ B_c upright(" is pure of weight ") - 2 . $ <eq:pure-minus-two>]

This is the point where geometry of the fibre enters: its first homology forbids weights below $- 2$,
  even though it maps into a commutator ideal.

Because $frak(k)_c$ is an ideal, the bracket followed by its abelianization is a mixed-Hodge morphism

$ frak(g)_c ⊗ frak(k)_c arrow.r B_c . $

The source has weights at most $- 3$, and the target has $W_(- 3) = 0$ by (2.8). The morphism must vanish. Thus

#[#set math.equation(numbering: n => "(2.9)")
 $ \[ frak(g)_c \, frak(k)_c \] subset.eq \[ frak(k)_c \, frak(k)_c \] . $ <eq:action-zero>]

Substituting (2.5) and using the Jacobi lower-central estimate yields

$ gamma_3 frak(g)_c subset.eq \[ gamma_2 frak(g)_c \, gamma_2 frak(g)_c \] subset.eq gamma_4 frak(g)_c subset.eq
  gamma_3 frak(g)_c . $

Hence $gamma_3 frak(g)_c = gamma_4 frak(g)_c$. Repeated bracketing with $frak(g)_c$ makes all subsequent
  lower-central terms equal. Since $frak(g)_c$ is nilpotent, they must be zero. We have proved

#[#set math.equation(numbering: n => "(2.10)")
 $ gamma_3 frak(g)_c = 0 wide upright("for every ") c gt.eq 1 . $ <eq:all-c-zero>]

The complete Lie algebra $frak(m)_V$ is the separated inverse limit of these canonical quotients.
  Every element of $gamma_3 frak(m)_V$ has zero image in every $frak(g)_c$ by (2.10);
  separatedness therefore gives $gamma_3 frak(m)_V = 0$. Its closure is zero as well.
  By the definition (2.1), the map $frak(m)_V arrow.r frak(g)_2$ is consequently an isomorphism.
  Thus the canonical tower actually stabilizes at $c = 2$, and the completion is finite-dimensional.
  Its abelianization is $H_1 \( V \, upright(bold(Q)) \)$ and its commutator is a quotient of $and.big^2
  H_1 \( V \, upright(bold(Q)) \)$. The Baker–Campbell–Hausdorff correspondence gives the same class bound for the
  unipotent algebraic group.

It remains to pass to complex unipotent representations. For the finitely generated group $Gamma$,
  unipotent completion commutes with extension of the characteristic-zero ground field
  #cite(label("Hain2015")) §4. More explicitly, the completion over $upright(bold(C))$ is the scalar extension of
  the rational completion and has the universal property for homomorphisms into complex unipotent groups.
  After extension from $upright(bold(Q))$ to $upright(bold(C))$,
  this universal property therefore bounds every complex unipotent representation image.
  This completes the proof of Theorem 2.

#prodef([Remark 2.1.])[
  If $H_1 \( F \, upright(bold(Q)) \)$ is pure of weight $- 1$, in particular if $F$ is proper,
    the same proof gives $B_c = 0$. A nilpotent Lie algebra with zero abelianization is zero, so $frak(k)_c =
    0$ and the completion is abelian. This reflects the difference between complete fibres and fibres whose first
    homology has a boundary contribution of weight $- 2$. For smooth quasi-projective varieties whose
    quasi-Albanese map is proper and surjective, Aguilar Aguilar–Campana proved that every torsion-free nilpotent
    quotient is abelian #cite(label("AguilarAguilarCampana2025")) arXiv version, Corollary 2(2).
] <rem:proper-fibre>

#prodef([Remark 2.2.])[
  The zero cases cause no exception. If $A$ is a point, then $H_1 \( V \, upright(bold(Q)) \) =
    0$ and all the canonical nilpotent Lie quotients vanish. If $F$ is a point,
    exactness identifies $Gamma$ with the free abelian group $Lambda$.
    Neither conclusion requires division by a positive Betti number.
]

== 3 From completion to complex linear monodromy <sec:linear>

We prove Theorem 1 by applying Theorem 2 on a finite étale cover.
  The inputs from Cadorel–Deng–Yamanoi concern the total space of the quasi-Albanese map;
  they do not require specialness of its general fibre.

We use the following three results of #cite(label("CDY2025")).

+ By Theorem A, equivalently Theorem 4.1, if $V$ is smooth special quasi-projective and $rho :
  pi_1 \( V \) arrow.r "GL"_d \( upright(bold(C)) \)$ is a representation,
  the identity component of the Zariski closure of its image is a direct product $U times T$,
  with $U$ unipotent and $T$ a torus.
+ By Lemma 4.4 and Proposition 4.13, the algebraic quasi-Albanese map of a smooth special quasi-projective variety
  is dominant, has connected general fibre, and has the ordinary exact sequence (1.1).
  The general fibre can be chosen smooth by generic smoothness.
  Proposition 4.13 applies to algebraic fibre spaces to semiabelian varieties whose total source is special (or
  h-special); an algebraic fibre space here means a dominant morphism with connected general fibre.
  No properness or global surjectivity is required.
+ Connected finite étale covers preserve specialness #cite(label("CDY2025")) Theorem 3.1,
  which attributes this property to #cite(label("Campana2011")) Proposition 10.11.

The specialness assumption of these results is the open-variety condition in #cite(label("CDY2025")) Definition
  2.1. The upper-model pair condition used in Theorem 3 implies this condition;
  we explain the comparison after Definition 7.

#proof[
  Let $L$ be the Zariski closure of $rho \( pi_1 \( V \) \)$ and let $L^0$ be its identity component.
    The subgroup $Gamma_0 = rho^(- 1) \( L^0 \)$ has finite index in $pi_1 \( V \)$.
    By the algebraic form of the Riemann existence theorem #cite(label("SGA1")) Exposé XII, Théorème 5.1,
    p. 251 it corresponds to a connected finite étale cover $V_0 arrow.r V$.
    By the first input, $L^0 tilde.eq U times T$. Project the restricted representation of $pi_1 \( V_0 \)$ to $U$.
  The third input makes $V_0$ special. Apply the second input to the quasi-Albanese map of $V_0$ itself:
    it is dominant, its general fibre is smooth and connected,
    and its ordinary fundamental-group sequence is exact. All the hypotheses of Theorem 2 therefore hold for
    $V_0$. The projected unipotent image has class at most two, while the projection to $T$ is abelian.
    Every triple commutator of $rho \( Gamma_0 \)$ is consequently trivial in both factors of $U times T$,
    and is itself trivial. Since $rho \( Gamma_0 \)$ has finite index in $rho \( pi_1 \( V \) \)$,
    this proves the theorem. ◻
]

Reapplying exactness on $V_0$ is essential: unipotent completion need not be unchanged on passing to a
  finite-index subgroup. This proof uses neither fibre-specialness nor a mixed Hodge structure on an arbitrary
  linear representation quotient. The mixed Hodge argument was carried out entirely on the canonical quotients in
  Section 2.

Applied to $V$ itself, the second CDY input also gives the completion conclusions of Theorem 2 for every smooth
  special quasi-projective variety. We record the resulting specialization to logarithmic Kodaira dimension zero.
  Its linear-image assertion is a specialization of the theorem of Cao–Deng–Hacon–Păun #cite(label("CDHP2026"))
  Theorem A.

#thm([Corollary 3.1.])[
  (Log-Kodaira-zero monodromy).  #emph[Let $V$ be a connected smooth complex quasi-projective variety with
    logarithmic Kodaira dimension $macron(kappa) \( V \) = 0$, and put $Gamma = pi_1 \( V \)$.
    For every positive integer $d$ and every representation $rho : Gamma arrow.r "GL"_d \( upright(bold(C)) \)$,
    the image $rho \( Gamma \)$ has a subgroup of finite index and nilpotency class at most two.
    The full rational unipotent completion of $Gamma$ is a finite-dimensional unipotent algebraic group of class
    at most two. Every finite-dimensional complex unipotent representation of $Gamma$ also has image of class at
    most two.]
] <cor:log-kodaira-zero>

#proof[
  Choose a smooth projective compactification $Y$ of $V$ with reduced simple normal crossing boundary $D =
    Y \\ V$. Then $macron(kappa) \( V \) = kappa \( Y \, K_Y + D \) = 0$.
    Campana’s theorem #cite(label("Campana2011")) arXiv version,
    Theorem 6.7 and Corollary 4.11 applies to smooth projective pairs with reduced simple normal crossing boundary
    and gives specialness of $\( Y \, D \)$. By the comparison after Definition 7,
    $V$ is therefore special in the open-variety convention of Cadorel–Deng–Yamanoi.
  Theorem 1 gives the linear-image assertion. Applied to $V$ itself,
    the second CDY input above gives a dominant quasi-Albanese map with smooth connected general fibre and the
    full ordinary exact sequence (1.1). Theorem 2 therefore gives the assertions about the full rational
    completion and complex unipotent images. ◻
]

The finite-index subgroup in Corollary 6 may depend on the representation.
  The corollary does not assert virtual two-step nilpotence of the ordinary discrete group $pi_1 \( V \)$ itself;
  the faithfulness issue remains as explained in Section 8.

== 4 The surface and its orbifold multiplicities <sec:definitions>

The construction in Theorem 3 gives two projections: $a : X arrow.r E$ will be the quasi-Albanese map, while $j :
  Y arrow.r upright(bold(P))^1$ is the logarithmic Iitaka fibration. We first describe their fibres.
  We then set out the orbifold conventions needed to prove specialness on every allowed upper model.
  All varieties and morphisms below are algebraic over $upright(bold(C))$.

=== 4.1 The surface and its two projections <the-surface-and-its-two-projections>

We use the notation of Theorem 3 and put

$ S = E times upright(bold(P))^1 \, wide H_i = E times { q_i } \, wide A_i = b^(- 1) \( e_i \, q_i \) . $

Write

$ macron(a) = "pr"_E compose b : Y arrow.r E \, wide a = macron(a) \|_X \, wide j =
  "pr"_(upright(bold(P))^1) compose b : Y arrow.r upright(bold(P))^1 . $

The points $e_i$ are permitted to coincide. The distinctness of the $q_i$ ensures that all blowup centres are
  distinct and that the curves $D_i$ are pairwise disjoint. We have

#[#set math.equation(numbering: n => "(4.1)")
 $ A_i tilde.eq upright(bold(P))^1 \, wide D_i dot.op A_j = delta_(i j) \, wide A_i^compose :=
   A_i ∩ X tilde.eq upright(bold(A))^1 . $ <eq:intersection>]

Only the single intersection point with $D_i$ is removed from $A_i$.
  These retained affine lines will account both for the orbifold multiplicities and for the disappearance of
  puncture loops in $X$.

===== 4.1.1 Fibres over the elliptic curve. <fibres-over-the-elliptic-curve.>

For $e in E$, put $I \( e \) = { i : e_i = e }$ and let $B_e$ be the strict transform of ${ e } times
  upright(bold(P))^1$. The scheme fibre of $macron(a)$ is

$ B_e + sum_(i in I \( e \)) A_i \, $

with all multiplicities one. Its components in the open surface are

$ B_e ∩ X tilde.eq upright(bold(P))^1 \\ { q_j : j in.not I \( e \) } \, wide
  A_i^compose tilde.eq upright(bold(A))^1 quad \( i in I \( e \) \) . $

Each $A_i^compose$ meets $B_e ∩ X$ once transversely, and the exceptional components are mutually disjoint.
  The point of attachment represents the vertical tangent direction at the original centre;
  the omitted point represents the horizontal tangent direction and is different.
  Thus every fibre of $a$ is connected. For general $e$, the set $I \( e \)$ is empty and

#[#set math.equation(numbering: n => "(4.2)")
 $ a^(- 1) \( e \) tilde.eq upright(bold(P))^1 \\ { q_1 \, dots.h \, q_n } . $ <eq:general-a-fibre>]

===== 4.1.2 Elliptic fibres and the logarithmic canonical divisor. <elliptic-fibres-and-the-logarithmic-canonical-divisor.>

For $t in.not { q_i }$, the fibre of $j$ is an unchanged complete elliptic curve contained in $X$.
  At $q_i$ its scheme fibre is

#[#set math.equation(numbering: n => "(4.3)")
 $ j^(*) \( q_i \) = D_i + A_i \, $ <eq:j-fibre>]

both components having multiplicity one. In particular, all fibres of $j$ are connected and $j_(*) cal(O)_Y =
  cal(O)_(upright(bold(P))^1)$.

The canonical divisor and the strict-transform formula give

#[#set math.equation(numbering: n => "(4.4)")
 $ K_Y & = b^(*) K_S + sum_i A_i \, & D & = b^(*) #scale(x: 180%, y: 180%)[\(] sum_i H_i
   #scale(x: 180%, y: 180%)[\)] - sum_i A_i \,\
K_Y + D & tilde.op j^(*) cal(O)_(upright(bold(P))^1) \( n - 2 \) . $ <eq:log-canonical>]

Projection formula therefore gives

$ H^0 #scale(x: 120%, y: 120%)[\(] Y \, m \( K_Y + D \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^0
  #scale(x: 120%, y: 120%)[\(] upright(bold(P))^1 \, cal(O)_(upright(bold(P))^1) \( m \( n - 2 \) \)
  #scale(x: 120%, y: 120%)[\)] wide \( m gt.eq 1 \) . $

Thus $kappa \( Y \, K_Y + D \) = 1$, and $j$ is the Iitaka fibration:
  the logarithmic pluricanonical sections determine $j$ up to an embedding of its base.
  The complete elliptic fibres of $j$ will constrain every possible curve fibration when we prove specialness.

=== 4.2 The infimum convention <the-infimum-convention>

A smooth orbifold pair is a smooth variety $Y$ together with a simple normal crossing $upright(bold(Q))$-divisor

$ D = sum_P (1 - frac(1, m_P \( D \))) P \, wide m_P \( D \) in upright(bold(Z))_(gt.eq 1) union { oo } . $

Only finitely many coefficients are nonzero. We use $1 \/ oo = 0$;
  thus a component of a reduced boundary has multiplicity $oo$,
  whereas a prime divisor outside its support has multiplicity $1$.

Here a #emph[fibration] is a surjective morphism with connected fibres.
  Let $f : Y arrow.r Z$ be such a morphism, with $Y$ smooth projective and $Z$ smooth.
  For a prime divisor $Q subset Z$ and a prime divisor $P subset Y$ dominating $Q$,
  write $r \( f \, P \)$ for the coefficient of $P$ in $f^(*) Q$. The orbifold base divisor is

#[#set math.equation(numbering: n => "(4.5)")
 $ Delta \( f \, D \) = sum_Q (1 - frac(1, m_f \( Q \))) Q \, wide m_f \( Q \) =
   inf_(f \( P \) = Q) r \( f \, P \) m_P \( D \) . $ <eq:infimum>]

This is the infimum convention of #cite(label("CDHP2026")) Definition 2.1;
  it is not a greatest-common-divisor convention. A divisor $P$ with $"codim"_Z f \( P \) gt.eq
  2$ is #emph[$f$-exceptional] and does not occur in the infimum for the immediate base.
  It may occur for a later composition.

For the surface above, (4.3) gives

#[#set math.equation(numbering: n => "(4.6)")
 $ m_j \( q_i \) = min { 1 dot.op oo \, 1 dot.op 1 } = 1 \, wide Delta \( j \, D \) = 0 . $ <eq:j-base-zero>]

The unchanged fibres give multiplicity one at every other point.
  Thus $\( Y \, D \)$ has logarithmic Kodaira dimension one,
  but the orbifold base of $j$ is $\( upright(bold(P))^1 \, 0 \)$.
  The retained component $A_i$ is what makes its multiplicity at $q_i$ equal to one.

=== 4.3 Upper models and specialness <upper-models-and-specialness>

A dominant morphism of smooth orbifold pairs $u : \( Y' \, D' \)
  arrow.r \( Y \, D \)$ is an #emph[orbifold morphism] if, for every prime divisor $P subset
  Y$ and every component $P'$ of $u^(*) P$, its coefficient $r$ in that pullback satisfies

$ r thin m_(P') \( D' \) gt.eq m_P \( D \) . $

It is an #emph[elementary birational orbifold morphism] if, in addition, it is birational and $u_(*) D' = D$.
  In particular, when $D$ is reduced, every component of $u^(- 1) D$ must lie in the coefficient-one part of $D'$.
  An equality of pushed-forward boundaries alone is weaker.

A fibration $f : \( Y \, D \) arrow.r Z$ is #emph[neat] if there is a commutative birational diagram

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$\( Y \, D \)$])
  content((2.717, 0), [$Z$])
  content((0, -1.239), [$\( Y_0 \, D_0 \)$])
  content((2.717, -1.239), [$Z_0$])
  line((0.6, 0), (2.381, 0), mark: (end: ">"))
  content((1.491, 0.2266), [#text(size: 0.73em)[$f$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.3223, -0.6193), [#text(size: 0.73em)[$w$]])
  line((2.717, -0.2725), (2.717, -0.9661), mark: (end: ">"))
  content((3.04, -0.6193), [#text(size: 0.73em)[$v$]])
  line((0.864, -1.239), (2.249, -1.239), mark: (end: ">"))
  content((1.557, -1.465), [#text(size: 0.73em)[$f_0$]])
})

with smooth spaces, $w$ an elementary birational orbifold morphism,
  and every $f$-exceptional divisor also $w$-exceptional. The definition is the one in #cite(label("CDHP2026"))
  Definition 2.3. A fibration is #emph[high] if its morphism to the base equipped with the induced divisor
  $Delta \( f \, D \)$ is an orbifold morphism. Birational equivalence of fibrations is generated by diagrams in
  which the source modification is an elementary birational orbifold morphism and the base modification is
  birational. The #emph[canonical dimension] of a fibration is the infimum of the Kodaira dimensions of its
  orbifold bases over these models. Here the Kodaira dimension of a $upright(bold(Q))$-divisor is the exponent
  measuring growth of its plurisections, with value $- oo$ if all positive plurisection spaces vanish.
  For a neat fibration,

#[#set math.equation(numbering: n => "(4.7)")
 $ kappa \( f \, D \) = kappa #scale(x: 120%, y: 120%)[\(] Z \, K_Z +
   Delta \( f \, D \) #scale(x: 120%, y: 120%)[\)] $ <eq:neat-kappa>]

by #cite(label("CDHP2026")) Lemma 2.7, attributed there to #cite(label("Campana2011")) Corollaire 5.11(3).

#prodef([Definition 4.1.])[
  A smooth projective orbifold pair $\( Y \, D \)$ is special if for every elementary birational orbifold morphism
    $u : \( Y' \, D' \) arrow.r \( Y \, D \)$ with $\( Y' \, D' \)$ smooth projective and every neat fibration
    $g : \( Y' \, D' \) arrow.r Z$ with $dim Z > 0$,
  $ kappa #scale(x: 120%, y: 120%)[\(] Z \, K_Z + Delta \( g \, D' \) #scale(x: 120%, y: 120%)[\)] < dim Z . $
  A smooth open variety $X = Y \\ D$ with reduced boundary is logarithmically special when its smooth projective
    compactification pair is special in this sense.
] <def:special>

For a smooth projective curve $C$, a divisor $K_C + Delta$ is of general type precisely when its degree is
  positive. In dimension two we will also use the elementary fact that a birational fibration is equivalent to the
  identity fibration on its source. Consequently its canonical dimension is no larger than the logarithmic Kodaira
  dimension of that source. Equation (4.7) then makes this useful for Definition 7.

===== 4.3.1 Comparison with the open-variety convention. <comparison-with-the-open-variety-convention.>

The condition above implies specialness in the sense of #cite(label("CDY2025")) Definition 2.1,
  which is the convention used by the external inputs in Section 3.
  To see the needed implication, start with an open fibration and proper birational modification allowed there.
  Compactify the modification over $\( Y \, D \)$, resolve the graph of the fibration,
  and choose a neat upper model as in #cite(label("CDHP2026")) Proposition 2.8.
  On this model, let $D_(upright("open"))$ be the reduced inverse image of the original boundary and let
  $D_(upright("high"))$ be the boundary of the upper orbifold pair.
  The orbifold-morphism condition over the reduced divisor $D$ forces $D_(upright("open")) lt.eq
  D_(upright("high"))$. On the same resolved morphism $g$, formula (4.5) gives

$ Delta \( g \, D_(upright("open")) \) lt.eq Delta \( g \, D_(upright("high")) \) . $

Consequently the Kodaira dimension of the former orbifold base is no larger than that of the latter,
  which is smaller than the dimension of the base by Definition 7.
  The infimum over models in the open-variety definition is at most this value.
  This proves the implication used here; no identification of the two classes of models is needed.

== 5 Specialness on every upper model <sec:specialness>

We prove part (i) of Theorem 3 by excluding every positive-dimensional general-type orbifold base on every allowed
  upper model. For surface bases we use the growth of logarithmic pluricanonical sections.
  For curve bases we use the complete elliptic fibres of $j$ and its retained multiplicity-one components.

Let

$ u : \( Y' \, D' \) arrow.r \( Y \, D \) $

be any elementary birational orbifold morphism, with $\( Y' \, D' \)$ smooth projective,
  and let $g : \( Y' \, D' \) arrow.r Z$ be any positive-dimensional neat fibration.
  Every component of $D'$ is either the strict transform of one of the $D_i$ or a $u$-exceptional curve,
  because $u_(*) D' = D$. The images of the exceptional curves form a finite subset of $Y$.
  There are two possibilities for the dimension of $Z$.

=== 5.1 A two-dimensional base <a-two-dimensional-base>

Suppose $dim Z = 2$. A general connected zero-dimensional fibre is a point, so $g$ is birational.
  Compare $g$ with the identity fibration on $\( Y' \, D' \)$,
  using the identity on the source and $g$ on the base. By the definition of canonical dimension,

#[#set math.equation(numbering: n => "(5.1)")
 $ kappa \( g \, D' \) lt.eq kappa \( Y' \, K_(Y') + D' \) . $ <eq:birational-kappa>]

We claim that the right side is at most one. Choose a positive integer $m$ divisible enough that $m
  D'$ is integral. Off the finite set of exceptional images,
  $u$ is an isomorphism and its pushed-forward boundary is $D$.
  A section of $m \( K_(Y') + D' \)$ therefore restricts to a section of $m \( K_Y + D \)$ away from that finite
  set. A section of a line bundle on a smooth surface extends across a subset of codimension two:
  after trivializing the line bundle, this is extension of regular functions on a normal variety. We obtain an injection

#[#set math.equation(numbering: n => "(5.2)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] Y' \, m \( K_(Y') + D' \) #scale(x: 120%, y: 120%)[\)] arrow.r.hook H^0
   #scale(x: 120%, y: 120%)[\(] Y \, m \( K_Y + D \) #scale(x: 120%, y: 120%)[\)] . $ <eq:section-injection>]

The target grows linearly with $m$ by (4.4). This proves the claim. Neatness, (4.7), and (5.1) now show

$ kappa #scale(x: 120%, y: 120%)[\(] Z \, K_Z + Delta \( g \, D' \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 < 2 . $

Notice that this uses a one-sided bound on sections; it does not assume birational invariance for arbitrary
  changes of the boundary.

=== 5.2 A curve base <a-curve-base>

Suppose $Z = C$ is a smooth projective curve, and set $Delta = Delta \( g \, D' \)$. Assume for contradiction that

#[#set math.equation(numbering: n => "(5.3)")
 $ deg \( K_C + Delta \) > 0 . $ <eq:positive-base>]

Choose $t in upright(bold(P))^1$ away from the $q_i$ and from the images, under $j$,
  of the finitely many exceptional images of $u$. The fibre

$ C_t = \( j compose u \)^(- 1) \( t \) $

is then an unchanged smooth complete elliptic curve, disjoint from both $D'$ and the exceptional locus of $u$.

Suppose $h = g \|_(C_t) : C_t arrow.r C$ is nonconstant. It is finite and surjective.
  For a point $c in C$, write $m_c$ for its orbifold multiplicity.
  Any component $P$ of $g^(*) c$ meeting $C_t$ lies outside $"Supp" D'$, so $m_P \( D' \) = 1$. Formula (4.5) implies

$ r \( g \, P \) gt.eq m_c . $

For $x in C_t$ above $c$, the ramification index $e_x$ of $h$ is the intersection multiplicity of $C_t$ with
  $g^(*) c$ at $x$. It is the sum of the positive intersection orders multiplied by the corresponding
  $r \( g \, P \)$, so $e_x gt.eq m_c$. If $m_c = oo$, this is impossible,
  since surjectivity supplies a point $x$ above $c$. Thus the existence of $h$ first rules out all infinite base
  multiplicities. For finite $m_c$,

$ e_x - 1 gt.eq e_x (1 - 1 / m_c) . $

Summing this inequality over the fibres above $"Supp" Delta$ and using Riemann–Hurwitz gives

$ 0 = deg K_(C_t) & = deg \( h \) deg K_C + sum_(x in C_t) \( e_x - 1 \)\
 & gt.eq deg \( h \) deg \( K_C + Delta \) > 0 \, $

a contradiction. This argument only needs the inequality of multiplicities,
  so it applies to the infimum convention rather than requiring divisibility of ramification indices.

It follows that $g$ is constant on all sufficiently general fibres of $j compose u$. Those fibres are connected.
  Descent on function fields gives a rational map $r : upright(bold(P))^1 arrow.r.dashed C$ with

$ g = r compose j compose u . $

A rational map between smooth projective curves extends everywhere.
  If $deg r > 1$, a general fibre of $g$ is the disjoint union of the fibres of $j compose
  u$ over the distinct preimages of a general point of $C$;
  this contradicts connectedness of the general fibre of $g$.
  Therefore $deg r = 1$, and $C tilde.eq upright(bold(P))^1$. Up to this isomorphism, $g = j compose u$.

It remains to compute the boundary of this possible curve base on the arbitrary model $Y'$.
  Let $A'_i$ be the strict transform of $A_i$. Its coefficient in $D'$ is zero, since $u_(*) D' =
  D$ and $A_i$ does not occur in $D$. At its generic point $u$ is an isomorphism.
  Thus $A'_i$ occurs with multiplicity one in $\( j compose u \)^(*) q_i$, and

$ m_(j compose u) \( q_i \) = 1 . $

For every $t in.not { q_i }$ the strict transform of the original elliptic fibre similarly has boundary
  coefficient zero and ordinary multiplicity one. Additional exceptional components cannot increase an infimum
  already equal to one. Consequently

$ Delta \( j compose u \, D' \) = 0 . $

The degree in (5.3) is therefore $deg K_(upright(bold(P))^1) = - 2$, the final contradiction.
  Both possible base dimensions have been excluded, proving specialness on every upper model in Definition 7.

#prodef([Remark 5.1.])[
  This proof is compatible with adding boundary components on further exceptional curves allowed by the
    definition. It never adds the strict transforms of the original $A_i$ to the boundary:
    their coefficients must remain zero because their images are divisors absent from $D$.
    This is why the universal quantifier over upper models does not remove the example.
]

== 6 The quasi-Albanese and the ordinary fundamental group <sec:albanese>

The fibre description in Section 4 shows that $a : X arrow.r E$ has connected fibres.
  We now identify $a$ by its quasi-Albanese universal property and compute the ordinary fundamental group of $X$.
  Neither argument uses specialness.

Choose $q_(*) in.not { q_i }$. The unchanged complete curve $E times { q_(*) }$ gives a section

#[#set math.equation(numbering: n => "(6.1)")
 $ s : E arrow.r X \, wide a compose s = "id"_E . $ <eq:section>]

=== 6.1 Units and the universal property <units-and-the-universal-property>

#thm([Lemma 6.1.])[
  #emph[Every invertible regular function on $X$ is constant.]
] <lem:units>

#proof[
  For $v in Gamma \( X \, cal(O)_X \)^(*)$, its rational extension to $Y$ has divisor supported on the boundary,
    say $"div"_Y \( v \) = sum_i b_i D_i$. Intersect with $A_j$ and use (4.1):
  $ 0 = "div"_Y \( v \) dot.op A_j = b_j . $
  Thus the rational function has no poles anywhere on the normal projective variety $Y$.
    It is regular and hence constant. ◻
]

Let $G$ be any semiabelian variety and let $f : X arrow.r G$ be an algebraic morphism. Write

$ 1 arrow.r T arrow.r G arrow.r^rho B arrow.r 1 \, wide T tilde.eq upright(bold(G))_m^r \, $

with $B$ abelian. For $e$ outside the finite set ${ e_i }$,
  the fibre $a^(- 1) \( e \)$ is the punctured line $upright(bold(P))^1 \\ { q_i }$.
  The restriction of $rho compose f$ to this fibre extends to $upright(bold(P))^1$ because $B$ is proper.
  Every morphism $upright(bold(P))^1 arrow.r B$ is constant:
  invariant one-forms span the cotangent space of $B$ everywhere,
  and their pullbacks to $upright(bold(P))^1$ vanish. Its differential is zero,
  which implies constancy in characteristic zero.

Comparing with the point supplied by the section $s$ gives

$ rho compose f = \( rho compose f compose s \) compose a $

on a dense open subset of $X$ and hence everywhere. The morphism

$ h \( x \) = f \( x \) - f \( s \( a \( x \) \) \) $

therefore has image in $T$. Each coordinate of $h : X arrow.r upright(bold(G))_m^r$ is a unit,
  so Lemma 9 makes $h$ constant. It vanishes on $s \( E \)$, and hence vanishes identically.
  We have proved the unique factorization

#[#set math.equation(numbering: n => "(6.2)")
 $ f = \( f compose s \) compose a . $ <eq:universal-factorization>]

Uniqueness follows by composing with $s$.

For the based universal property, choose the base point $s \( 0 \)$ and suppose $f \( s \( 0 \) \) = 0$.
  Then $g = f compose s : E arrow.r G$ is a group homomorphism.
  Indeed, its projection to $B$ is a homomorphism by the rigidity theorem for abelian varieties. Its group-law defect

$ E times E arrow.r G \, wide \( e \, e' \) mapsto g \( e + e' \) - g \( e \) - g \( e' \) $

therefore takes values in the affine group $T$. A morphism from a connected projective variety to an affine torus
  is constant, and the defect is zero at $\( 0 \, 0 \)$. This proves the claim. Together with (6.2), it establishes

$ "Alb" \( X \) = E \, wide a_X = a . $

The general fibre in (4.2) has logarithmic canonical degree $n - 2 > 0$.
  Its identity fibration is of general type, so it is not special.
  Together with connectedness of all fibres, this proves part (ii) of Theorem 3.

#prodef([Remark 6.2.])[
  (Logarithmic one-forms).  The same intersection matrix gives a cohomological check.
    The logarithmic residue sequence is
  $ 0 arrow.r Omega_Y^1 arrow.r Omega_Y^1 \( log D \) arrow.r xor.big_i cal(O)_(D_i) arrow.r 0 . $
  The connecting map sends a constant residue vector $\( c_i \)$ to the corresponding linear combination of
    divisor classes. The classes $\[ D_i \]$ are independent, since pairing with $\[ A_j \]$ gives $c_j$. Consequently
  $ H^0 \( Y \, Omega_Y^1 \( log D \) \) = H^0 \( Y \, Omega_Y^1 \) = macron(a)^(*) H^0 \( E \, Omega_E^1 \) . $
  The boundary creates no additional logarithmic one-form. The universal property above also rules out an isogeny
    ambiguity without needing to deduce the whole quasi-Albanese from this dimension count.
] <rem:log-forms>

=== 6.2 The meridians die inside the given open surface <the-meridians-die-inside-the-given-open-surface>

Remove the retained exceptional curves temporarily and write

$ U = X \\ union.big_i A_i^compose . $

The blowup is an isomorphism away from its centres, and their containing horizontal fibres have already been
  deleted. Thus

#[#set math.equation(numbering: n => "(6.3)")
 $ U tilde.eq E times \( upright(bold(P))^1 \\ Q \) \, wide Q = { q_1 \, dots.h \, q_n } . $ <eq:product-open>]

Let $m_i$ denote positively oriented puncture loops in $upright(bold(P))^1 \\ Q$,
  with paths to a common base point. They generate its fundamental group with the single relation $m_1 dots.h.c
  m_n = 1$.

Each $A_i^compose$ is a closed smooth complex divisor in $X$.
  The inclusion $U arrow.r.hook X$ induces a surjection on fundamental groups,
  whose kernel is normally generated by meridians around these divisors.
  For completeness, loops can be perturbed off a real codimension-two submanifold.
  A null-homotopy can be made transverse to it, relative to the boundary of its parameter disc.
  It then meets the divisors in finitely many points. Removing small discs about those points expresses the
  boundary loop as a product of conjugates of meridians. This argument uses compactness of the parameter disc,
  not compactness of the divisors.

The meridians can be identified explicitly. Near $\( e_i \, q_i \)$ choose local coordinates $\( x \, t \)$ on $S$
  so the deleted horizontal curve is $t = 0$. The blowup chart

#[#set math.equation(numbering: n => "(6.4)")
 $ b \( u \, t \) = \( u t \, t \) $ <eq:blowup-chart>]

contains the whole retained affine line $A_i^compose = { t = 0 }$, with coordinate $u$.
  The strict transform of the deleted horizontal curve does not meet this chart. At $u = 0$ the loop

$ t = epsilon e^(2 pi i theta) \, wide 0 lt.eq theta lt.eq 1 \, $

is a meridian of $A_i^compose$. Under (6.3), it has fixed elliptic coordinate $e_i$ and winds once about $q_i$.
  It represents a conjugate of $m_i$. Moreover, it bounds the actual disc ${ u = 0 \, med \| t \| lt.eq
  epsilon }$ inside $X$, whose centre lies on $A_i^compose$.

It follows that

$ pi_1 \( X \) & tilde.eq frac(pi_1 \( E \) times pi_1 \( upright(bold(P))^1 \\ Q \), chevron.l #h(-0.16667em)
  chevron.l m_1 \, dots.h \, m_n chevron.r #h(-0.16667em) chevron.r)\
 & tilde.eq pi_1 \( E \) tilde.eq upright(bold(Z))^2 . $

Under the product identification (6.3), $a$ is the projection to $E$,
  so $a_(*)$ is precisely the displayed isomorphism. The section (6.1) also shows directly that the elliptic
  generators survive. For a general fibre, all generators of its free fundamental group are puncture loops,
  so its image in $pi_1 \( X \)$ is trivial. This proves part (iii) and completes Theorem 3.
  Every relation used here is realized by a homotopy in $X$;
  no additional orbifold relation has been imposed on its ordinary group.

== 7 Orbifold bases before and after contraction <sec:composition>

We locate the error in #cite(label("CDHP2026")) Claim 7.17 by instantiating its models on the surface just
  constructed. This also explains why neither an isogeny of the elliptic base nor a further allowed source
  modification repairs the fibre-specialness statement.

For a composition of fibrations in the preceding orbifold setting,

$ \( Y \, D \) arrow.r^c macron(X) arrow.r^(macron(j)) J \, $

one must distinguish the two divisors

#[#set math.equation(numbering: n => "(7.1)")
 $ Delta \( macron(j) compose c \, D \) quad upright("and") quad Delta #scale(x: 120%, y: 120%)[\(] macron(j) \,
   Delta \( c \, D \) #scale(x: 120%, y: 120%)[\)] . $ <eq:two-bases>]

An exceptional divisor for $c$ is omitted when constructing $Delta \( c \, D \)$.
  If it dominates a divisor of $J$, however, it participates in the direct infimum for $macron(j) compose c$.
  Thus equality in (7.1) needs a hypothesis controlling precisely those divisors.
  This issue is already present in Campana’s composition rule:
  the direct base divisor is at most the iterated one, and equality holds when $c : \( Y \, D \)
  arrow.r \( macron(X) \, Delta \( c \, D \) \)$ is an orbifold morphism #cite(label("Campana2011")) arXiv
  version, Proposition 3.13. The retained exceptional divisors in our example make the inequality strict.

In our example, take $c = b : Y arrow.r S$, $J = upright(bold(P))^1$ and $macron(j) = "pr"_(upright(bold(P))^1) :
  S arrow.r upright(bold(P))^1$. The only divisor of $Y$ dominating $H_i subset S$ is $D_i$,
  with multiplicity one and boundary multiplicity infinity. Therefore

#[#set math.equation(numbering: n => "(7.2)")
 $ Delta \( b \, D \) = sum_i H_i \, wide Delta #scale(x: 180%, y: 180%)[\(] macron(j) \,
   sum_i H_i #scale(x: 180%, y: 180%)[\)] = sum_i q_i . $ <eq:iterated-base>]

By contrast, (4.6) gives

#[#set math.equation(numbering: n => "(7.3)")
 $ Delta \( macron(j) compose b \, D \) = 0 . $ <eq:direct-base>]

The two answers differ at every $q_i$: the direct multiplicity is $min \( oo \, 1 \) = 1$,
  whereas the iterated multiplicity is $oo$. Figure 1 records which component is lost at the intermediate step.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2), [#text(size: 9pt)[$Y$]])
  line((-1.7, 1), (1.7, 1), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((-1, 1), [#text(size: 9pt)[$D_i$ deleted]], anchor: "south", padding: 0.1176cm)
  line((0, -0.5), (0, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 1), radius: 0.08114, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.12, 0.15), [#text(size: 9pt)[$A_i^ compose tilde.eq "AA"^1$#linebreak()retained]], anchor: "west", padding: 0.1176cm)
  line((2.15, 1), (4.25, 1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.2, 1), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  content((3.2, -0.05), [#text(size: 9pt)[$A_i arrow.r.bar p_i$#linebreak()codimension two]])
  content((6.3, 2), [#text(size: 9pt)[$S=E times bold(P)^1$]])
  line((4.7, 1), (7.9, 1), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((6.3, 1), radius: 0.0635, fill: black, stroke: none)
  content((7.2, 1), [#text(size: 9pt)[$H_i$]], anchor: "south", padding: 0.1176cm)
  content((6.3, 1), [#text(size: 9pt)[$p_i=(e_i,q_i)$]], anchor: "north", padding: 0.1176cm)
  line((0.3, -0.75), (3.1, -2.32), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((1.7, -1.676), [#text(size: 9pt)[$j$]], anchor: "north", padding: 0.1176cm)
  line((6, -0.75), (3.1, -2.32), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.55, -1.676), [#text(size: 9pt)[$macron(j)$]], anchor: "north", padding: 0.1176cm)
  line((2, -2.35), (4.2, -2.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((3.1, -2.35), radius: 0.0635, fill: black, stroke: none)
  content((3.1, -2.35), [#text(size: 9pt)[$q_i in J= bold(P)^1$]], anchor: "north", padding: 0.1176cm)
})

$ & upright("multiplicity at ") q_i & upright("boundary coefficient")\
upright("direct base") & min { oo \, 1 } = 1 & 0\
upright("iterated base") & oo & 1 $

],
  caption: [Figure 1: Incidence schematic showing the two routes to the same point $q_i$. The horizontal arrow is the blowdown of complete surfaces: the retained $A_i^compose$ maps to a point on $H_i$. The hollow point $A_i ∩ D_i$ is removed from $X$. The divisor $A_i$ is omitted from the intermediate orbifold base because $b \( A_i \)$ has codimension two in $S$, but contributes multiplicity one to the direct base over $q_i$. ],
) <fig:retained-exceptional>

=== 7.1 The models occurring before Claim 7.17 <the-models-occurring-before-claim-7.17>

We next check that this discrepancy occurs on the models used in the cited claim.
  The #emph[relative core] used there has special general fibres,
  and its base pair has general-type general fibres over $E$.
  In our case it can be represented by the identity of $Y$:
  the identity has point fibres, while the general fibres of $\( Y \, D \) arrow.r
  E$ are the log-general-type punctured projective lines. The identity is a neat and high model in the terminology
  of #cite(label("CDHP2026")) Definitions 2.3 and Theorem 2.10.
  The log-canonical calculation (4.4) gives the Kodaira dimension one required in the subsequent reduction.
  General Iitaka fibres are complete elliptic curves mapping isomorphically to $E$.

An isogeny $E' arrow.r E$ pulls the construction back to the blowup of $E' times
  upright(bold(P))^1$ at all preimages of the centres. It is finite étale on the entire pair.
  The boundary is the pullback of $D$, the exceptional curves still have coefficient zero,
  and the log-canonical divisor is still pulled back from $cal(O)_(upright(bold(P))^1) \( n - 2 \)$.
  Thus the minimizing-isogeny step in #cite(label("CDHP2026")) Equation (7.15.2) leaves the relative-core
  canonical dimension equal to one and retains the exceptional divisors.

For the birational contraction in #cite(label("CDHP2026")) Proposition 7.6, we can take $b : Y arrow.r S$.
  Indeed, the fixed semiabelian subvariety in that construction is the image in $E$ of a general Iitaka fibre,
  hence $E$ itself. The quotient is a point, and the resulting contracted family is $upright(bold(P))^1 times
  E tilde.eq S$. This product is smooth over all of $J$, so the open set $J^0$ used for the smooth contracted
  family can be taken to be $J$; its complement $partial J$ is empty.
  On the contracted space $S$, the boundary $sum_i H_i$ has the general-type orbifold base shown in (7.2).
  This is consistent with #cite(label("CDHP2026")) Claim 7.7;
  the difficulty is transferring that conclusion back to $\( Y \, D \)$.

The proof next makes a birational change $J' arrow.r J$ so that the main component of $Y times_J
  J'$ is flat #emph[over $J'$]. Here $j : Y arrow.r upright(bold(P))^1$ is already flat.
  One way to see this is that at each point of the smooth curve base its local ring is a discrete valuation ring,
  and the local rings of the dominant smooth integral source are torsion-free modules over it.
  Torsion-free modules over a discrete valuation ring are flat.
  A smooth birational model of the complete curve $J = upright(bold(P))^1$ is isomorphic to $J$.
  The choices in the proof can therefore be instantiated with

$ J' = J \, wide macron(X)' = macron(X) times_J J' = S \, wide tilde(X) = S \, wide tilde(Y) = Y . $

Here $nu : tilde(Y) arrow.r Y$ is the source modification and $mu : tilde(X) arrow.r
  macron(X)'$ is the resolution of the intermediate target.
  Both are identities, and the maps to that target and to $J'$ are

$ nu = "id"_Y \, quad mu = "id"_S \, quad tilde(c) = b \, quad tilde(j) = macron(j) . $

The boundary in #cite(label("CDHP2026")) Equation (7.16.7) is then exactly $D$,
  because there are no $nu$-exceptional divisors to add.

=== 7.2 The change of flatness target <the-change-of-flatness-target>

Claim 7.17 asserts equality of the two divisors in (7.1) on the resulting models.
  Its proof treats every $tilde(c)$-exceptional divisor as having infinite boundary multiplicity.
  To justify this, it uses flatness of

$ \( Y times_J J' \)_(upright("main")) arrow.r macron(X)' $

although the preceding construction arranged flatness over $J'$. These are different morphisms.
  In the displayed instance the former map is the blowdown $b : Y arrow.r S$.
  Its fibres are points away from the centres and curves over the centres, so it is not flat.
  The divisors $A_i$ are exceptional for $tilde(c) = b$ but are not exceptional for $nu = "id"_Y$;
  they have boundary multiplicity $1$, not $oo$. Omitting them from the direct infimum is precisely what turns
  (7.3) into the incorrect answer (7.2).

This is a numerical failure of the asserted equality, as well as a failure of the stated justification.
  Adding the $A_i$ to the boundary would turn the blowdown into an orbifold morphism, but it would replace $X$ by

$ E times \( upright(bold(P))^1 \\ Q \) \, $

which is not special and has group $upright(bold(Z))^2 times F_(n - 1)$,
  where $F_(n - 1)$ is the free group of rank $n - 1$. Alternatively,
  making the intermediate target remember the blowups retains the reducible fibres $D_i +
  A_i$ and restores the zero orbifold base; the general-type base computed on the contracted model is then lost.
  Neither modification establishes the original assertion for the original open variety.

The counterexample and this calculation concern the fixed version #cite(label("CDHP2026")).
  Its Theorem A is a separate assertion about linear representation images.
  Our proof of that conclusion in Section 3 uses independent inputs and does not use the fibre-specialness assertion.

== 8 The ordinary fundamental-group question <sec:ordinary>

The monodromy theorem concerns every complex linear image, but does not by itself determine the ordinary group.
  The remaining assertion can be stated without representation-theoretic terminology.

#prodef([Question 8.1.])[
  For every connected smooth special complex quasi-projective variety $V$,
    does $pi_1 \( V \)$ have a finite-index subgroup $H$ satisfying $\[ H \, \[ H \, H \] \] = 1$?
] <q:full>

This is #cite(label("CDHP2026")) Conjecture 2.12. The group is the ordinary topological fundamental group;
  boundary meridians have not been quotiented out. The surfaces in Theorem 3 satisfy the proposed conclusion and
  hence do not give counterexamples to it.

The precise obstruction to an inference from Theorem 2 is faithfulness.
  Put $Gamma = pi_1 \( V \)$ and write $Gamma^(upright("un"))$ for its rational unipotent completion.
  The canonical homomorphism $Gamma arrow.r Gamma^(upright("un")) \( upright(bold(Q)) \)$ can have a kernel.
  The theorem sends $gamma_3 Gamma$ to the identity without identifying its elements in $Gamma$.
  For example, a finitely generated group with finite abelianization has trivial rational unipotent completion,
  since a nonzero nilpotent Lie algebra has nonzero abelianization.
  This shows that a nontrivial group can be entirely invisible to rational unipotent completion.
  The specialness hypotheses used here supply no injectivity statement for the completion map.

A known group-theoretic reduction shows what an additional geometric input could accomplish.
  If the full group $pi_1 \( V \)$ were virtually solvable,
  Rogov’s theorem would make it virtually nilpotent #cite(label("Rogov2025")) Theorem C, Corollary 6.6.
  A finitely generated virtually nilpotent group has a torsion-free nilpotent subgroup $H$ of finite index,
  and $H$ admits a faithful rational unipotent representation by Mal’cev’s theorem #cite(label("Segal1983"))
  Chapters 1 and 5; Chapter 6, p. 100. The finite étale cover corresponding to $H$ is again special.
  The CDY quasi-Albanese inputs from Section 3 therefore apply to that cover,
  and Theorem 2 gives $\[ H \, \[ H \, H \] \] = 1$. Virtual solvability of the full ordinary group is not
  established by the representation bounds.

Theorem 3 also prevents an induction that requires the general quasi-Albanese fibre itself to be special.
  Its fundamental group is nonabelian free, while its image in the total group is zero.
  Controlling that actual image is a different geometric problem.
  The completion theorem addresses its image in every canonical unipotent quotient;
  control of the kernel invisible to these quotients remains necessary for Question 11.

#bibliography("refs.bib", style: "ieee", title: [References])
