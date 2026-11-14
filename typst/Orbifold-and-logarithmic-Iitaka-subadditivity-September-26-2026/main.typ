#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Orbifold-and-logarithmic-Iitaka-subadditivity-September-26-2026]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <intro:section>

The Kodaira dimension measures the growth of pluricanonical forms.
  For a surjective morphism $f : X arrow.r Y$ of smooth projective complex varieties with connected fibers,
  Iitaka’s subadditivity problem asks whether

$ kappa \( X \) gt.eq kappa \( F \) + kappa \( Y \) \, $

where $F$ is a general fiber. The logarithmic version permits poles along reduced boundary divisors and therefore
  applies to open varieties. We prove a common generalization in which rational boundary coefficients and multiple
  fibers both contribute to the inequality.

Iitaka’s divisor-dimension and logarithmic theories provide the language for this question
  #cite(label("IitakaOriginal")) #cite(label("IitakaLog"));
  an explicit logarithmic subadditivity conjecture appears in #cite(label("IitakaClassification")) §3.
  The lower bound requires global pluricanonical forms that retain the growth of both the fibers and the base.
  Direct-image positivity established central cases: Kawamata treated curve bases and fibers admitting good
  minimal models, Viehweg developed weak positivity and addition over a base of general type,
  and Kollár proved addition for general-type fibers #cite(label("KawamataCurves"))
  #cite(label("KawamataKodaira")) #cite(label("ViehwegAdditivity")) #cite(label("Kollar87")).
  Weak positivity controls symmetric powers after small positive ample twists;
  a general-type base provides enough canonical positivity to absorb them.

Other advances exploit dimension or the geometry of the base:
  Birkar treated total dimension at most six, Cao–Păun and Hacon–Popa–Schnell treated abelian or
  maximal-Albanese-dimension bases, and Cao treated projective klt pairs over surfaces
  #cite(label("BirkarIitakaSix")) #cite(label("CaoPaunAbelian")) #cite(label("HaconPopaSchnellAbelian"))
  #cite(label("CaoSurfaces")). Thus the established cases draw positivity from different parts of the fibration,
  rather than imposing one uniform condition on it.

For logarithmic pairs, Kovács–Patakfalvi proved the projective log-general-type-fiber case
  #cite(label("KovacsPatakfalvi")) Theorem 9.6, while Hashizume proved reduced-SNC subadditivity for fibers with
  abundant log canonical divisor #cite(label("Hashizume")) Theorem 1.2.
  Maehara had established logarithmic addition over a base of log general type;
  Fujino gives a proof through twisted weak positivity #cite(label("FujinoWeakPositivity")) Theorem 1.9.
  Campana proved addition over an orbifold base of general type,
  and Wang proved klt Kähler subadditivity over complex tori,
  including an inf-multiplicity refinement #cite(label("CampanaOrbifolds")) Theorem 6.3
  #cite(label("WangKahlerIitaka")) Main Theorem A and Theorem E.
  The present argument uses general-type addition only after a relative Iitaka reduction;
  the original fiber need not be of general type or admit a good minimal model.

Earlier preprints also state general ordinary inequalities.
  Tsuji states ordinary subadditivity following a direct-image generation theorem
  #cite(label("TsujiDirectImages")) Theorems 1.9 and 1.13; his Remark 1.14 distinguishes an unproved variation
  refinement. Maehara states an ordinary determinant inequality involving variation
  #cite(label("MaeharaIitaka")) §7, Theorem 8. This later preprint claim is distinct from his logarithmic
  general-type-base theorem above. Neither preprint statement is a proof input here.

=== 1.1 The orbifold base and the main theorem <the-orbifold-base-and-the-main-theorem>

Multiple fibers carry information that the ordinary base omits.
  Campana’s orbifold base records it through inf multiplicities,
  and his birational invariant gives the corresponding form of Iitaka’s conjecture #cite(label("Campana2004"))
  #cite(label("CampanaOrbifolds")). We specify that invariant before stating the theorem.

A fibration is a proper surjective holomorphic map with connected fibers.
  A rational SNC boundary on a smooth manifold is a finite sum $Delta = sum_i delta_i Delta_i$,
  with $delta_i in upright(bold(Q)) ∩ \[ 0 \, 1 \]$ and simple normal crossing support.
  Write $Delta_E$ for the coefficient of a source prime $E$. Set

$ m_Delta \( E \) = frac(1, 1 - Delta_E) \, wide 1 / 0 = oo \, $

where $Delta_E = 0$ off the boundary. If the base of $f : \( X \, Delta \) arrow.r Y$ is smooth, define

#[#set math.equation(numbering: n => "(1.1)")
 $ m \( f \, Delta \; D \) = min_(E mapsto D) { "ord"_E \( f^(*) D \) m_Delta \( E \)
   #scale(x: 120%, y: 120%)[}] \, wide B \( f \, Delta \) = sum_D (1 - frac(1, m \( f \, Delta \; D \))) D .
   $ <setup:inf-boundary>]

Here $D$ ranges over base prime divisors, $E$ over source primes dominating $D$, and $1 \/ oo = 0$.
  The minimum is nonempty and only finitely many coefficients of $B \( f \, Delta \)$ are nonzero.
  There is no divisibility condition on these multiplicities.

For smooth sources and bases, an elementary change of model is a commutative diagram of fibrations

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$\( X' \, Delta' \)$])
  content((2.256, 0), [$\( X \, Delta \)$])
  content((0, -1.239), [$Y'$])
  content((2.256, -1.239), [$Y$])
  line((0.732, 0), (1.656, 0), mark: (end: ">"))
  content((1.194, 0.2266), [#text(size: 0.73em)[$u$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.3705, -0.6193), [#text(size: 0.73em)[$f'$]])
  line((2.256, -0.2725), (2.256, -0.9661), mark: (end: ">"))
  content((2.578, -0.6193), [#text(size: 0.73em)[$f$]])
  line((0.402, -1.239), (1.92, -1.239), mark: (end: ">"))
  content((1.161, -1.465), [#text(size: 0.73em)[$v$]])
})

where $u \, v$ are proper bimeromorphic holomorphic maps, $u_(*) Delta' = Delta$,
  and both boundaries are rational SNC boundaries in $\[ 0 \, 1 \]$.
  We require, for every prime $D$ on $X$ and prime $E$ on $X'$ with $t = "ord"_E \( u^(*) D \) > 0$,

#[#set math.equation(numbering: n => "(1.2)")
 $ t thin m_(Delta') \( E \) gt.eq m_Delta \( D \) . $ <setup:orbifold-morphism>]

We permit $oo gt.eq oo$ and impose no condition for $t = 0$.
  Write $f' tilde.op f$ for the equivalence relation generated by these diagrams,
  allowing arrows in either direction. Define

#[#set math.equation(numbering: n => "(1.3)")
 $ kappa \( f divides Delta \) = inf_(f' : \( X' \, Delta' \) arrow.r Y' tilde.op f) kappa
   #scale(x: 120%, y: 120%)[\(] Y' \, K_(Y') + B \( f' \, Delta' \) #scale(x: 120%, y: 120%)[\)] .
   $ <setup:invariant-base>]

For a normal singular base $Y$, resolve $Y$, resolve the main component of the fiber product with $X$,
  and give the resulting smooth source the strict transform of $Delta$ plus the reduced exceptional divisor over
  $X$. After resolving this boundary, apply the preceding definition.
  It is independent of the chosen resolution #cite(label("CampanaOrbifolds")) Definitions 2.1, 2.3, 3.2, 4.7,
  and 4.10; Remark 4.13 and Corollary 4.14.

For a rational line bundle $L$, $kappa \( Z \, L \)$ is the maximal image dimension of its complete linear systems
  in sufficiently divisible positive degrees, and is $- oo$ if all these systems are empty.
  A point has Kodaira dimension zero, and $\( - oo \) + a = - oo$, including $a = - oo$.
  Fujiki class $cal(C)$ consists of compact complex spaces bimeromorphic to compact Kähler spaces.

#thm([Theorem 1.1.])[
  (Orbifold subadditivity).  #emph[Let $X$ be a smooth compact connected complex manifold in Fujiki class
    $cal(C)$, let $Delta$ be a rational SNC boundary, and let $f : X arrow.r
    Y$ be a surjective holomorphic map with connected fibers onto a normal compact irreducible complex space.
    For a very general smooth fiber $F$, put $Delta_F = Delta \|_F$. Then
#[#set math.equation(numbering: n => "(1.4)")
 $ kappa \( X \, K_X + Delta \) gt.eq kappa \( F \, K_F + Delta_F \) +
   kappa \( f divides Delta \) . $ <main:inequality>]

]
] <main:orbifold>

This is a positive resolution of Campana’s orbifold Iitaka conjecture in its rational SNC,
  Fujiki-class-$cal(C)$ formulation, including coefficient one #cite(label("CampanaOrbifolds")) Conjecture 6.1 and
  Remark 6.2. Here a very general fiber is chosen outside a countable union of proper closed analytic subsets,
  including the critical values and the exceptional images of boundary strata.

For reduced SNC divisors $D_X \, D_Y$ satisfying $"Supp" \( f^(*) D_Y \) subset.eq "Supp" \( D_X \)$,
  the invariant base term is at least $kappa \( Y \, K_Y + D_Y \)$. Theorem 1 therefore gives

$ kappa \( X \, K_X + D_X \) gt.eq kappa \( F \, K_F + D_X \|_F \) + kappa \( Y \, K_Y + D_Y \) $

for fibrations between smooth compact class-$cal(C)$ manifolds.
  For a smooth quasi-projective variety $U$, its logarithmic Kodaira dimension is $macron(kappa) \( U \) =
  kappa \( X \, K_X + D_X \)$ on a smooth projective compactification with reduced SNC boundary $D_X = X \\ U$.
  Compatible compactifications give logarithmic subadditivity for dominant morphisms of smooth quasi-projective
  complex varieties with geometrically connected general fiber. Empty boundaries give ordinary subadditivity.
  The projective ordinary and logarithmic statements also hold over algebraically closed fields of characteristic
  zero, using geometric generic fibers.

=== 1.2 The reduction and the two positivity inputs <the-reduction-and-the-two-positivity-inputs>

The proof first replaces the original fiber by a general-type object without losing its complete pluricanonical
  systems. Assume the two terms on the right of Theorem 1 are nonnegative, and put $k =
  kappa \( F \, K_F + Delta_F \)$. A relative Iitaka map gives, after the model changes of Section 2,

$ X arrow.r^g W arrow.r^h Y \, wide dim W_y = k \, wide kappa \( G \, K_G + Delta_G \) = 0 $

for a very general $g$-fiber $G$.

The canonical-bundle-formula strategy separates the contribution of singular fibers from a moduli contribution on
  $W$. Fujino–Mori developed a higher-dimensional logarithmic formula,
  and Ambro organized its discriminant and moduli parts birationally #cite(label("FujinoMori"))
  #cite(label("AmbroBoundary")) #cite(label("AmbroModuli")).
  Our use of this strategy requires an exact comparison on the fixed original source.
  Section 2 obtains it from the orders of relative pluriforms.
  A sufficiently divisible pluricanonical system on $G$ is one-dimensional.
  Taking a root of its generator on a cyclic cover gives a differential form,
  and the line it spans belongs to the cohomology of that cover.
  Tensor descent and extension across the boundary produce a rational line bundle $M$ on $W$.
  The orders of the same form determine a boundary $T$ such that

$ B \( g \, Delta \) lt.eq T lt.eq 1 \, wide H^0 #scale(x: 120%, y: 120%)[\(] X \,
  m \( K_X + Delta \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^0 #scale(x: 120%, y: 120%)[\(] W \,
  m \( K_W + T + M \) #scale(x: 120%, y: 120%)[\)] $

in sufficiently divisible degrees. The comparison also holds relatively over $Y$.
  Thus $K_W + T + M$ is big on the $k$-dimensional fibers of $h$.

Two inputs turn this fiberwise bigness into the required global lower bound. The first concerns the line $M$:
  the period map, which records how the Hodge structures of the covers vary, supplies a second fibration $p :
  W arrow.r S$, with $S$ smooth projective, and a nef rational line bundle $P$ such that

$ M = p^(*) P \, wide K_S + a P med upright("is big") $

for some positive rational $a$. The maps $h$ and $p$ have different jobs, as Figure 1 shows.
  The second input is log-general-type addition: a log canonical divisor that is big on the fibers of $h$ has
  Kodaira dimension at least their dimension plus the orbifold contribution of $Y$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X$])
  content((2.057, 0), [$W$])
  content((4.115, 0), [$Y$])
  content((2.057, -1.585), [$S$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$g$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  content((3.086, 0.2266), [#text(size: 0.73em)[$h$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((1.735, -0.7927), [#text(size: 0.73em)[$p$]])
})],
  caption: [Figure 1: The relative Iitaka reduction factors the original fibration through $W$. The map $h$ retains the original base and has $k$-dimensional general fibers. The independent map $p$ expresses $M$ as the pullback of a nef line $P$ on a projective base where $K_S + a P$ is big. No map between $Y$ and $S$ is asserted. ],
) <fig:iitaka-period>

Section 3 states both inputs precisely and proves the intervening addition principle. Write $D_W = K_W + T$.
  For a fixed rational $c < 1$ close to one, general-type addition gives sufficiently many ratios of sections of
  $D_W + c M + eta p^(*) A$, where $A$ is ample on $S$ and $eta > 0$ is rational.
  Weak positivity then supplies one fixed section of $D_W + a M -
  lambda p^(*) A$ for suitable $a > 1$ and $lambda > 0$. A positive rational combination cancels the ample terms
  and gives coefficient one on $M$. Multiplication by powers of that fixed section preserves the ratios of the
  first system. This is an exact section argument; it requires neither abundance of $P$ nor a limiting assertion
  for Kodaira dimensions.

The full proofs of the inputs follow this calculation. Section 4 proves adjoint positivity of the Hodge line.
  It combines the curvature and boundary theory of Griffiths, Schmid,
  and Cattani–Kaplan–Schmid with a projective period quotient #cite(label("GriffithsPeriodsIII"))
  #cite(label("Schmid")) #cite(label("CKS")). The construction retains suitable rational adjoint factors of the
  ambient integral variation, associated with its monodromy,
  from which a positive power of the chosen line can be recovered.
  Their full periods give the quotient, using Villadsen’s class-$cal(C)$ compactification theorem and the
  period-quotient approach of Bakker–Brunebarbe–Tsimerman and Sommese;
  curvature and a volume argument establish its projectivity #cite(label("BakkerBrunebarbeTsimerman"))
  #cite(label("SommesePeriodMapping")) #cite(label("VilladsenHodgeKahler")).

On this quotient $S$, the retained full period map is generically immersive,
  but the map remembering only the chosen line may have smaller rank.
  Curvature identifies the latter rank with the numerical dimension $nu \( P \)$,
  measured by its nonzero intersection powers. Let $D$ be the reduced boundary where the retained variation has
  nonidentity local monodromy. Brunebarbe–Cadorel gives $K_S + D$ big #cite(label("BrunebarbeCadorel")).
  Using André’s monodromy normality and Bakker–Tsimerman’s Ax–Schanuel theorem to analyze fibers of the line map,
  the boundary argument proves $nu \( P \|_(D_i) \) < nu \( P \)$ for every component $D_i$ of $D$,
  including finite nonidentity monodromy #cite(label("AndreMonodromy")) #cite(label("BakkerTsimermanAxSchanuel")).
  The boundary loss in the asymptotic section count consequently has lower degree in the coefficient of $P$ than
  the available sections on $S$. Lemma 24 turns this comparison into bigness of $K_S + a P$.

Section 5 proves log-general-type addition in class $cal(C)$.
  Kovács–Patakfalvi’s stable-family positivity applies to projective families.
  We construct such an auxiliary family and descend its relative sections to the original class-$cal(C)$ base.
  Fujino’s weak positivity supplies the other direct-image input used in Section 3
  #cite(label("KovacsPatakfalvi")) #cite(label("FujinoWeakPositivity")).
  Section 6 then returns once to the original fibration, applies the addition principle to $\( W \, T \, M \)$,
  and derives the ordinary, logarithmic, characteristic-zero, and core consequences.
  The core and the relevant specialness of Kodaira-zero fibers are Campana’s constructions and results
  #cite(label("Campana2004")) #cite(label("CampanaOrbifolds")).

=== 1.3 The reduced-boundary refinement <the-reduced-boundary-refinement>

For a rational boundary, the root form above spans one character subspace of the cyclic cover’s highest Hodge
  space; the whole highest space can be larger. For projective reduced-boundary pairs of logarithmic Kodaira
  dimension zero, Section 7 proves more: the minimal root cover has a one-dimensional entire logarithmic top-form
  space. Mixed-Hodge extension and semipositivity in the forms of Fujino–Fujisawa control the coefficient-one
  boundary #cite(label("FujinoFujisawa")) #cite(label("FujinoFujisawaVMHS")).
  We identify the resulting line with the moduli divisor in the projective subpair setting of
  Bakker–Filipazzi–Mauri–Tsimerman #cite(label("BFMT")) Theorem 6.28.
  This identification does not use their separate semiampleness theorem,
  whose hypotheses include effectiveness over the generic point #cite(label("BFMT")) Theorem 1.5.
  Section 7 also gives the exact divisorial normalization. Appendix 8 collects complementary projective
  calculations by valuations and toroidal models, together with the comparison on higher models.

The logarithmic lower bound, adjoint positivity, and this reduced-boundary refinement supply the stated inputs to
  the whole-fiber-variation companion #cite(label("IitakaVariationCompanion")).
  The reverse-inequality companion #cite(label("IitakaAdditivityCompanion")) uses the lower bound only for
  additivity; its upper theorem has additional smoothness hypotheses on all boundary strata.
  Neither companion is used in the proof of Theorem 1. The separate article on projective Hodge lines
  #cite(label("IitakaProjectiveCompanion")) gives a complete ordinary proof through rationally polarized integral
  variations, together with the distinct integral and analytic boundary arguments.

== 2 The relative Iitaka reduction and its Hodge line <setup:section>

The first task is to replace the fibers by their Iitaka images while retaining every sufficiently divisible
  pluricanonical system. We first fix the birational models on which divisorial order tests suffice.
  The root form of a Kodaira-zero fiber will then provide a Hodge line and an exact comparison of sections on the
  intermediate base.

We use additive notation for rational line bundles; equality of them means equality in $"Pic" ⊗ upright(bold(Q))$.
  A rational line is effective if a positive integral multiple has a nonzero section.
  All degree assertions below are made after clearing denominators.
  For a fibration $g : \( Z \, Gamma \) arrow.r T$ and a very general smooth fiber $F$, adjunction gives

#[#set math.equation(numbering: n => "(2.1)")
 $ \( K_Z + Gamma \) \|_F = K_F + Gamma \|_F . $ <setup:fiber-adjunction>]

=== 2.1 The fixed smooth models <the-fixed-smooth-models>

A smooth-base fibration $g : \( Z \, Gamma \) arrow.r T$ is #emph[neat] if there is a proper bimeromorphic
  orbifold morphism $w : \( Z \, Gamma \) arrow.r \( Z_0 \, Gamma_0 \)$ to a smooth pair, with $w_(*) Gamma =
  Gamma_0$, such that every prime divisor sent by $g$ into codimension at least two is also sent by $w$ into
  codimension at least two. Campana’s construction gives suitable neat models, model independence, and the formula

#[#set math.equation(numbering: n => "(2.2)")
 $ kappa \( g divides Gamma \) = kappa #scale(x: 120%, y: 120%)[\(] T \, K_T +
   B \( g \, Gamma \) #scale(x: 120%, y: 120%)[\)] quad upright("on a neat model") $ <setup:neat-formula>]

#cite(label("CampanaOrbifolds")) Definition 3.8, Proposition 3.10, Corollary 4.11, and Remark 6.2.
  For the proof we only need the defining inequality, valid on every allowed smooth model:

#[#set math.equation(numbering: n => "(2.3)")
 $ kappa #scale(x: 120%, y: 120%)[\(] T \, K_T + B \( g \, Gamma \) #scale(x: 120%, y: 120%)[\)] med gt.eq med
   kappa \( g divides Gamma \) . $ <setup:base-comparison>]

=== 2.2 Reduced exceptional boundaries <reduced-exceptional-boundaries>

#thm([Lemma 2.1.])[
  (Logarithmic modifications).  #emph[Let $p : Z' arrow.r Z$ be a proper bimeromorphic holomorphic map between
    smooth compact manifolds. Suppose that $Gamma$ has simple normal crossing support and coefficients in
    $upright(bold(Q)) ∩ \[ 0 \, 1 \]$, and set
$ Gamma' = p_(*)^(- 1) Gamma + "Exc" \( p \)_(upright("red")) . $

 Assume, after further resolution if necessary, that this boundary has simple normal crossing support.
   There is an effective $p$-exceptional rational divisor $A$ such that
#[#set math.equation(numbering: n => "(2.4)")
 $ K_(Z') + Gamma' = p^(*) \( K_Z + Gamma \) + A . $ <setup:log-discrepancy>]

 For every sufficiently divisible positive integer $m$, the natural identification of meromorphic pluricanonical
   forms induces
#[#set math.equation(numbering: n => "(2.5)")
 $ p_(*) cal(O)_(Z') #scale(x: 120%, y: 120%)[\(] m \( K_(Z') + Gamma' \) #scale(x: 120%, y: 120%)[\)] =
   cal(O)_Z #scale(x: 120%, y: 120%)[\(] m \( K_Z + Gamma \) #scale(x: 120%, y: 120%)[\)] .
   $ <setup:section-invariance>]

 These identifications respect multiplication, so the divisible section rings and their Iitaka dimensions agree.
   Moreover, $p$ satisfies (1.2).]
] <setup:log-modification>

#proof[
  The difference in (2.4) is exceptional, since $p$ is an isomorphism at the generic point of every target prime.
    To compute its coefficient at an exceptional prime $E$, choose compatible local canonical forms.
    Near a general point of its center on $Z$, let $z_1 \, dots.h \,
    z_n$ be coordinates in which the boundary components containing that center are $z_i = 0$ for $1 lt.eq i lt.eq
    r$, with coefficients $gamma_i$. Put $t_i = "ord"_E \( p^(*) z_i \)$ and let $k_E$ be the order of the
    Jacobian of $p$ along $E$. The pullback of
  $ frac(d z_1, z_1) and dots.h.c and frac(d z_r, z_r) and d z_(r + 1) and dots.h.c and d z_n $
  has at most a simple pole along $E$. Indeed, at a general smooth point of $E$,
    each logarithmic factor has the form $t_i thin d u \/ u$ plus a holomorphic one-form,
    and a nonzero wedge product contains at most one factor $d u \/ u$. Consequently $k_E + 1 gt.eq sum_i t_i$.
    The coefficient in question is therefore
  $ k_E + 1 - sum_i gamma_i t_i med gt.eq med sum_i \( 1 - gamma_i \) t_i med gt.eq med 0 . $
  For an effective integral exceptional divisor $m A$, normality of $Z$ gives $p_(*) cal(O)_(Z') \( m A \) =
    cal(O)_Z$: a meromorphic function with poles only on $m A$ descends outside the codimension-two exceptional
    image and extends by Hartogs’ theorem. The projection formula proves (2.5), compatibly with products and ratios.
  Finally, an exceptional prime has infinite boundary multiplicity.
    A nonexceptional prime is a strict transform, with pullback order one and unchanged coefficient.
    These two cases prove (1.2). ◻
]

#thm([Corollary 2.2.])[
  (Descent across exceptional centers).  #emph[In the situation of 2,
    a meromorphic $m$-pluricanonical form on $Z'$ satisfying the boundary bounds of $m
    Gamma'$ at every nonexceptional prime descends to a section of $m \( K_Z + Gamma \)$ whenever $m Gamma$ and $m
    Gamma'$ are integral. The assertion also holds after tensoring by the pullback of a line bundle on $Z$.]
] <setup:exceptional-descent>

#proof[
  On the complement of the exceptional image the form is a holomorphic section of the prescribed line bundle on
    $Z$: divisorial regularity suffices on a smooth space. A local trivialization reduces extension across the
    remaining codimension-two analytic subset to Hartogs’ extension theorem.
    The tensor-twisted assertion has the same proof. ◻
]

#thm([Corollary 2.3.])[
  (Fibers, composition, and a fixed base).  #emph[Let $p : \( Z' \, Gamma' \)
    arrow.r \( Z \, Gamma \)$ be a modification with the boundary rule of 2. Then:]
  + #emph[If $p$ is a modification over a fixed base, it induces a logarithmic modification on a very general
    smooth fiber. The log Kodaira dimensions of the corresponding fibers agree.]
  + #emph[A finite composition of such modifications again has boundary equal to the strict transform of the
    initial boundary plus the reduced exceptional divisor of the composite.]
  + #emph[If $g : \( Z \, Gamma \) arrow.r T$ has smooth base and $g' = g compose p$, then
#[#set math.equation(numbering: n => "(2.6)")
 $ B \( g' \, Gamma' \) = B \( g \, Gamma \) . $ <setup:fixed-base-boundary>]

]
] <setup:modification-compatibility>

#proof[
  For (i), choose the parameter so that the relevant smoothness and dimension statements hold for the finitely
    many exceptional components and their images. A component dominating the base restricts to a reduced divisor,
    and its exceptional image restricts to codimension at least two.
    Components not dominating the base do not meet this fiber.
    The restricted map has the same boundary rule, so 2 applies on the fiber.
    For (ii), every prime exceptional for the composite is either newly exceptional or the transform of an earlier
    exceptional prime; in both cases its coefficient is one.
  For (iii), fix a prime $D subset T$. Every old prime dominating $D$ has a strict transform,
    with the same pullback order and boundary multiplicity. Every new prime in the minimum defining
    $m \( g' \, Gamma' \; D \)$ is exceptional for $p$, so its boundary multiplicity is infinite.
    Adding these entries leaves the old minimum unchanged, including when that minimum was already infinite. ◻
]

For choice independence in the singular-base definition, take a common resolution of two chosen diagrams.
  Their induced source boundaries coincide: old primes retain their coefficients and all primes exceptional over
  the initial $X$ have coefficient one. The comparison maps satisfy 2,
  so the smooth fibrations are equivalent and their total-space and very general fiber log Kodaira dimensions agree.

=== 2.3 Flattening relative to a fixed reference pair <flattening-relative-to-a-fixed-reference-pair>

To compare forms over generic points of base divisors, we need control of source divisors over higher codimension.
  Proper analytic flattening gives a base modification whose strict transform is flat
  #cite(label("HironakaFlattening")) #cite(label("FujikiDouady")).
  Here the strict transform is the closure of the original family over the isomorphism locus,
  with base torsion removed. Further base change preserves flatness.
  We use only the resulting equidimensionality before resolving this intermediate source.

#thm([Lemma 2.4.])[
  (Flattening and the exceptional reference).  #emph[Let $g_0 : \( Z_0 \, Gamma_0 \) arrow.r
    T_0$ be a fibration from a smooth compact pair with rational SNC boundary in $\[ 0 \, 1 \]$ to a smooth
    compact manifold. There are a smooth-base modification $q : T arrow.r T_0$, a smooth-source modification $p :
    Z arrow.r Z_0$, and a fibration $g : Z arrow.r T$ with $q compose g = g_0 compose p$ such that, for
$ Gamma = p_(*)^(- 1) Gamma_0 + "Exc" \( p \)_(upright("red")) \, $

 the boundary has simple normal crossing support and every prime divisor $E subset Z$ satisfying $"codim"_T
   g \( E \) gt.eq 2$ is $p$-exceptional. In particular every such prime has coefficient one in $Gamma$,
   and the resulting fibration is neat with reference pair $\( Z_0 \, Gamma_0 \)$.]
  #emph[One may resolve prescribed proper analytic bad loci on the base during this construction.
    After any finite sequence of further base modifications, one can choose dominating smooth source models for
    which the same exceptional assertion holds with respect to the original reference $Z_0$.]
] <setup:flattening>

#proof[
  Flatten first, before resolving the source. After resolving the new base by further base change,
    denote the equidimensional strict transform by $macron(g) : macron(Z) arrow.r T$,
    and its modification to $Z_0$ by $macron(p)$. Resolve $macron(Z)$ and all boundary data, and write
  $ Z arrow.r^r macron(Z) arrow.r^(macron(p)) Z_0 \, wide p = macron(p) compose r \, wide g = macron(g) compose r . $
  Let $N = dim Z_0$, $b = dim T$, and $d = N - b$. If a prime $E$ on $Z$ has image contained in an analytic subset
    $C subset T$ of codimension at least two, equidimensionality gives
  $ dim macron(g)^(- 1) \( C \) lt.eq dim C + d lt.eq N - 2 . $
  It follows that $r \( E \)$, and therefore also $p \( E \)$, has dimension at most $N - 2$.
    Thus $E$ is exceptional over $Z_0$. The boundary and orbifold-morphism assertions follow from 2.
    The new map has connected general fiber. Its Stein factorization has a finite bimeromorphic map to the normal
    base $T$, which is an isomorphism, so all its fibers are connected.
  For any further base modification $T' arrow.r T$, pull back the flat intermediate family and take a common
    resolution dominating the previous smooth source. The same dimension estimate proves exceptionality over
    $Z_0$. This includes principalizations of prescribed bad loci and their SNC resolutions on the base.
    Iterating proves the persistence assertion; 4(ii) identifies the stepwise boundary with that computed directly
    over $Z_0$. ◻
]

The resolution need not be flat: the conclusion we retain is exceptionality over $Z_0$, which permits 3.

All constructions remain available in Fujiki class $cal(C)$.
  A smooth compact member admits a compact Kähler modification #cite(label("DemaillyPaun2004")) Theorems 0.7
  and 3.4. Starting with one for $Z_0$, graph resolutions and principalizations by smooth-center blowups give a
  Kähler dominating source. Kählerness is preserved by these projective modifications,
  and proper meromorphic images remain in class $cal(C)$ #cite(label("FujikiDouady")) Lemmas 4.4 and 4.6(3).
  Thus the bases also admit Kähler models. The preceding dimension argument still refers to the original $Z_0$.

=== 2.4 Keeping the original base fixed <keeping-the-original-base-fixed>

#thm([Corollary 2.5.])[
  (Simultaneous model control).  #emph[Suppose a smooth pair $\( X_1 \, Delta_1 \)$ has a fibration $f_1 :
    X_1 arrow.r Y$ to a fixed smooth base, and every prime divisor contracted by $f_1$ into codimension at least
    two has coefficient one in $Delta_1$. Put $C = B \( f_1 \, Delta_1 \)$.
    Let a factorization through another smooth compact space be given,
    after an allowed source modification if necessary, by
$ X_1 arrow.r^(g_1) W_1 arrow.r^(h_1) Y . $

 Apply 5 to $g_1$ and make any finite number of subsequent modifications of $W_1$,
   always taking dominating smooth source models with reduced added exceptional boundaries.
   The resulting diagram $X arrow.r^g W arrow.r^h Y$, with source boundary $Delta$,
   can be chosen to have all the following properties:]
  + #emph[Every prime contracted by $g$ into codimension at least two is exceptional over the chosen smooth
    reference source for $g_1$.]
  + #emph[Every prime contracted by $f = h compose g$ into codimension at least two in $Y$ has coefficient one in
    $Delta$.]
  + #emph[$B \( f \, Delta \) = C$. In particular, for each prime $D subset Y$ and each prime $E subset
    X$ dominating $D$,
#[#set math.equation(numbering: n => "(2.7)")
 $ "ord"_E \( f^(*) D \) thin m_Delta \( E \) gt.eq m_C \( D \) . $ <setup:retained-multiplicity>]

]
  + #emph[The log Kodaira dimensions of the total source and of its very general fibers over $Y$ are unchanged by
    these source modifications.]
  #emph[The hypothesis on contracted divisors follows from 5,
    applied to the original map to its resolved base before fixing $Y$.]
] <setup:simultaneous>

#proof[
  Assertion (i) is 5. For (ii), a source prime is either newly exceptional, with coefficient one,
    or the strict transform of an old prime with unchanged image in $Y$. The hypothesis handles the latter case.
    Assertions (iii) and (iv) are 4; (2.7) is the defining minimum for $C$.
    Flattening the original map supplies the initial coefficient-one condition by making its contracted primes
    exceptional. ◻
]

In applications we include the critical values and images of boundary strata among the base bad loci,
  so that $C$ has SNC support. We then fix $Y$ and use 6 for changes of intermediate bases.

=== 2.5 The relative Iitaka map <the-relative-iitaka-map>

#thm([Lemma 2.6.])[
  (Relative Iitaka construction).  #emph[Let $f : \( X \, Delta \) arrow.r
    Y$ be a fibration between smooth compact manifolds in Fujiki class $cal(C)$,
    with $Delta$ a rational SNC boundary in $\[ 0 \, 1 \]$. Suppose that
$ k = kappa \( F \, K_F + Delta_F \) gt.eq 0 $

 on very general smooth fibers. After modifications of the source,
   adding the reduced exceptional divisor to the strict transform of the boundary, there is a factorization
$ X arrow.r^g W arrow.r^h Y $

 with smooth compact intermediate space in class $cal(C)$, both maps proper with connected fibers, and
$ dim W_y = k \, wide kappa \( G \, K_G + Delta_G \) = 0 $

 for very general fibers of $h$ and $g$, respectively. The factorization restricts to the log Iitaka fibration on
   very general $f$-fibers. These properties persist on higher models obtained by the same rule for the source
   boundary.]
] <application:relative-iitaka>

#proof[
  Consider all degrees clearing the denominators of $Delta$. Their relative adjoint direct images are coherent.
    First shrink to the dense analytic open where the map and boundary strata are smooth.
    There the family and its adjoint line bundles are flat over the base;
    generic constancy of the fiber section dimension permits cohomology and base change
    #cite(label("GrauertDirectImages")) §7, nos. 4–6, Sätze 3–5,
    with its corrigendum #cite(label("GrauertDirectImagesCorr")).
    Together with the evaluation ranks this gives a dense analytic open for each degree;
    outside the resulting countable collection of exceptional sets, the maximum image dimension is $k$,
    attained in one fixed degree.
  Choose a sufficiently divisible degree giving the stabilized maps,
    resolve the relative meromorphic map to the projective bundle of its direct image,
    and take Stein factorization onto the image. The Iitaka fibration theorem for line bundles on compact complex
    spaces identifies the resulting map on very general fibers #cite(label("UenoClassification")) Chapter II, §5;
    Chapter III, §7. No finite generation is required. The image has relative dimension $k$;
    its Stein factor is in class $cal(C)$, being a proper image of a space in that class.
    Resolve it and the resulting source map. Connectedness of the fibers of $h$ follows from that of $f$,
    since their images under $g$ are precisely the fibers of $h$.
  The assertion that the restriction has Kodaira dimension zero concerns the original line bundle.
    Its standard proof applies here: coherent direct images on the projective Iitaka image acquire sections after
    an ample twist. If the restriction had positive Iitaka dimension,
    multiplying those sections by powers of the defining system would enlarge the Iitaka image.
    A nonzero defining section restricts nontrivially to a very general Iitaka fiber,
    so the restriction has dimension exactly zero.
  Apply this to the resolved log adjoint on a very general $f$-fiber.
    Its divisible section ring is unchanged by 2, and adjunction identifies the restriction with $K_G + Delta_G$.
    Further source modifications preserve the same section ring,
    hence the relative Iitaka factorization and its asserted fiber dimensions. ◻
]

=== 2.6 The exact comparison for Kodaira-zero fibers <rankone:section>

For fibers of logarithmic Kodaira dimension zero, the relative pluricanonical forms determine a single Hodge line
  on the base. We construct that line, compute its boundary orders,
  and use them to identify the adjoint section spaces. Coefficient-one boundary components introduce mixed Hodge
  structures, but the line itself lies in one pure weight grade.

A pure variation of Hodge structures carries a local system and a varying Hodge filtration.
  The #emph[highest step] of a summand is its highest nonzero filtration piece.
  The #emph[parabolic extension] of such a line is obtained by local power substitutions making boundary monodromy
  unipotent, extension of the unipotent Hodge filtration, and descent with the resulting rational weights.
  We will compute those weights using the actual relative pluricanonical form.

#thm([Proposition 2.7.])[
  (The rank-one comparison).  #emph[Let $g : \( X \, Delta \) arrow.r
    W$ be a fibration with connected fibers from a smooth compact Kähler manifold to a smooth compact manifold in
    class $cal(C)$. Suppose that $Delta$ is an SNC boundary with rational coefficients in $\[ 0 \, 1 \]$ and that
    $kappa \( G \, K_G + Delta_G \) = 0$ on a very general smooth fiber $G$.
    After the modifications of Lemma 2.1, Lemma 2.4, fix a smooth compact reference pair $\( X_0 \, Delta_0 \)$
    and a modification
$ pi : X arrow.r X_0 \, wide Delta = pi_(*)^(- 1) Delta_0 + "Exc" \( pi \)_(upright("red")) \, $

 such that every prime divisor mapped by $g$ into codimension at least two is $pi$-exceptional.
   Then there are a rational line bundle $M$ and a rational divisor $T$ on $W$ with the following properties.]
  + #emph[A positive integral multiple of $M$ is the parabolic highest Hodge line of a complex direct summand of a
    pure, real-polarizable variation with an integral lattice on a dense open subset of $W$.
    Its parabolic extension is the line to which the adjoint-positivity theorem, 14, will apply.]
  + #emph[The divisor $T$ is supported on an SNC divisor and satisfies
#[#set math.equation(numbering: n => "(2.8)")
 $ B \( g \, Delta \) lt.eq T lt.eq 1 . $ <rankone:boundary>]

 In particular, $T$ is effective. If every prime over a prime $D$ of $W$ has $Delta$-coefficient one, then $T_D = 1$.]
  + #emph[In sufficiently divisible degrees $q$, multiplication by the relative generating forms gives linear
    isomorphisms
#[#set math.equation(numbering: n => "(2.9)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] W \, q \( K_W + T + M \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^0
   #scale(x: 120%, y: 120%)[\(] X \, q \( K_X + Delta \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^0
   #scale(x: 120%, y: 120%)[\(] X_0 \, q \( K_(X_0) + Delta_0 \) #scale(x: 120%, y: 120%)[\)] . $ <rankone:sections>]

 In a common divisible grading they preserve products and ratios of sections,
   and hence the dimensions of the images of their linear systems.]
  + #emph[The same comparison holds relatively. If $h : W arrow.r Y$ and $f_0 : X_0 arrow.r
    Y$ are holomorphic maps with $f_0 pi = h g$, then
#[#set math.equation(numbering: n => "(2.10)")
 $ h_(*) cal(O)_W #scale(x: 120%, y: 120%)[\(] q \( K_W + T + M \) #scale(x: 120%, y: 120%)[\)]
   tilde.eq \( f_0 \)_(*) cal(O)_(X_0) #scale(x: 120%, y: 120%)[\(] q \( K_(X_0) + Delta_0 \)
   #scale(x: 120%, y: 120%)[\)] $ <rankone:relative-sections>]

 for sufficiently divisible $q$. The comparison of ratios also applies to systems over $Y$ and to their
   restrictions wherever generic base change holds. The relative identity remains valid after tensoring by a line
   bundle on $Y$, or a rational line bundle in degrees clearing its denominator.]
] <rankone:comparison>

The Hodge construction and its divisorial calculation are independent of the reference pair.
  The condition on $pi$ is used in the final section comparison, to descend forms across exceptional centers.

==== 2.6.1 The root form and its eigenspace <the-root-form-and-its-eigenspace>

The cyclic-root construction and its distinguished eigensheaf occur in #cite(label("FujinoMori")) Remark 2.6,
  #cite(label("AmbroBoundary")) Lemma 5.2, and #cite(label("FujinoGongyo")) Remark 3.9.
  Here the order calculations also include coefficient-one boundary and keep the character line distinct from the
  entire top Hodge space.

Choose a positive integer $m$ clearing the boundary denominators such that the generic rank of

$ g_(*) cal(O)_X #scale(x: 120%, y: 120%)[\(] m \( K_(X \/ W) + Delta \) #scale(x: 120%, y: 120%)[\)] $

is one. The same holds in every positive multiple of this degree:
  powers of a nonzero section exist, whereas two independent sections would contradict Kodaira dimension zero.
  Its reflexive hull $cal(E)_m$ is a line bundle since $W$ is smooth.
  A local frame $s$ of $cal(E)_m$ determines a meromorphic relative $m$-canonical form on $X$ over the
  corresponding base open set. Two such frames differ by an invertible base function.
  The direct image records $m$-pluriforms. Positivity will come from the Hodge extension of their rational root;
  comparing the two extension orders will supply $T$.

Resolve the horizontal zeros, poles, and boundary, then choose a dense open set $W^compose$ on which $g$ is
  smooth, the resulting divisors are relatively SNC, and all their strata are smooth over the base.
  By 2, new exceptional components have coefficient one, and the logarithmic Kodaira dimension of the general
  fiber stays zero. On each base chart take the normalized cyclic cover of $m$-th roots of $s$ as a relative
  pluriform and resolve it functorially. Write $tau$ for its tautological relative top form and $d = dim X - dim W$.

At a horizontal prime of boundary coefficient $delta$, let $l$ be the order of $s$ divided by $m$.
  The inequality $l gt.eq - delta gt.eq - 1$ shows that $tau$ has at most logarithmic poles.
  Indeed, at a covering prime of ramification index $j$, its order is

#[#set math.equation(numbering: n => "(2.11)")
 $ j \( 1 + l \) - 1 . $ <rankone:root-order>]

This number is integral. If $l > - 1$ it is nonnegative; if $l = - 1$ it equals $- 1$.
  On the resolved cover let $H$ be the reduced inverse image of the horizontal primes with $l = - 1$.
  It includes the exceptional components above those primes that are needed in the log resolution.
  Logarithmic pullback preserves the bound, and no additional horizontal poles occur.
  We use the cohomology of the complement of $H$.

#thm([Lemma 2.8.])[
  #emph[The tautological form spans the root-character part of $F^d
    H^d \( tilde(G) \\ H \, upright(bold(C)) \)$ on a general fiber of the cyclic cover.
    In particular, that part has dimension one.]
] <rankone:eigenspace>

#proof[
  For a compact Kähler SNC pair, logarithmic Hodge–de Rham degeneration identifies this top Hodge space with its
    global logarithmic top forms; it is also the smooth-fiber case of #cite(label("FujinoFujisawaVMHS"))
    Theorem 1.1, by duality. Let $eta$ be another form of the tautological character.
    Then $eta \/ tau$ is deck-invariant and descends to a meromorphic function $v$ on $G$.
  Consider a prime where the logarithmic section $s$ has no zero. There $l = - delta$.
    For $l > - 1$, the integer in (2.11) lies between $0$ and $j - 1$.
    A pole of $v$ downstairs would lower the covering order by at least $j$, which is impossible.
    For $l = - 1$, the logarithmic pole allowance is already exhausted, so the same conclusion holds.
    Thus the poles of $v$ can occur only on the positive zero divisor of $s$ as a section of
    $m \( K_G + Delta_G \)$. A sufficiently high power $s^N$ absorbs those poles.
    Both $s^N$ and $v s^N$ are then sections of $N m \( K_G + Delta_G \)$.
    The assumption $kappa = 0$ forces them to be dependent, and hence forces $v$ to be constant.
  The argument also applies to a disconnected cover: we retain the whole cover with its $mu_m$-action,
    whose invariant meromorphic functions descend to $G$. ◻
]

The ranks of the Hodge and weight graded bundles are locally constant on $W^compose$.
  The conclusion of 9, proved on a very general fiber, therefore holds throughout this smooth log locus.
  Notice that neither the argument nor (2.11) requires a boundary coefficient to have the form $1 -
  1 \/ a$ with $a$ an integer.

==== 2.6.2 Pure weights and descent of the local systems <pure-weights-and-descent-of-the-local-systems>

We next place a power of the local Hodge line in a global pure variation.
  This requires compatible polarizations and descent, because the cyclic covers need not form a global family.

First make the local normalized-cover constructions on charts of the compact base $W$,
  using the meromorphic forms supplied by the frames of $cal(E)_m$.
  They extend across the missing base divisor as finite covers;
  subsequent resolutions can be projective and functorial in the analytic category
  #cite(label("BierstoneMilmanFunctorial")) Theorem 1.1. The resulting maps to the Kähler source are projective,
  since the finite covers are projective. Thus their total spaces are Kähler over relatively compact source
  neighborhoods #cite(label("FujikiDouady")) Definition 4.1 and Lemma 4.4.
  Properness allows such a neighborhood to contain the inverse image of a sufficiently small disk transverse to a
  base divisor. The divisor of the tensor is unchanged under multiplication by a base unit.
  Thus the constructions on overlaps are identified after taking a local root of that unit,
  and the resolutions and their exceptional divisor classes are identified as well.

Fix a Kähler class $xi$ on $X$. On each resolved-cover chart $q_i : Z_i arrow.r X \|_(U_i)$,
  choose the relatively ample line bundle $A_i$ as follows.
  Functoriality matches the blowup center ideals and their tautological line bundles under the root-change
  identifications. Insert identity stages where a center is empty;
  the corresponding tautological bundle is trivial there. A sufficiently weighted tensor product gives compatible
  $A_i$, equivariant under deck transformations, by descent of the centers, blowups, and tautological bundles.
  The classes

$ theta_i = N q_i^(*) xi + c_1 \( A_i \) $

are Kähler on the smooth compact fibers for $N$ sufficiently large;
  their restrictions to the compact boundary strata are Kähler too.
  At the intermediate finite covering stage one uses the pullback Kähler #emph[class];
  the literal pulled-back form can degenerate at ramification.
  The relatively ample class supplies positivity along the projective resolution. One may choose a single $N$:
  carry out the construction over charts $U_i^(+)$ containing the closures of finitely many relatively compact
  charts $U_i$ covering $W$. Properness makes the inverse images of these closures compact,
  so each admits a bound $N_i$ in this class construction. Taking $N gt.eq max_i N_i$ works on all charts,
  since increasing $N$ adds the semipositive class $q_i^(*) xi$.
  This is why the construction was extended over the compact base before shrinking to $W^compose$.
  For the invariant Kähler-class construction on an equivariant resolved cyclic cover,
  see also #cite(label("ChenLimits")) Lemma 8.1.

The classes $theta_i$ come from total-space cohomology, so their restrictions to the smooth fibers and strata are
  flat for the Gauss–Manin connection. They agree under the overlap identifications.
  Lefschetz decomposition and cup product consequently give compatible flat real polarizations on the
  compact-stratum cohomology systems. The weight spectral sequence, with its Tate twists,
  gives the pure weight grades of the open-fiber cohomology as subquotients of these systems.
  They are real-polarizable: a real Hodge subvariation of a polarized pure variation is nondegenerate for the
  polarization, and a quotient can be identified with an orthogonal complement.
  These operations are compatible with the overlap maps. The integral structures come from cohomology modulo
  torsion and the saturated intersections with the rational weight filtration.
  We do not assert that the real polarizations are rational.

There is a unique weight $w$ for which

$ F^d "Gr"_w^W H^d \( tilde(G) \\ H \, upright(bold(C)) \)_chi eq.not 0 . $

Here $chi$ is the tautological character. Uniqueness follows from the rank-one assertion and strictness of the
  weight filtration. Let $V_i$ be the pure integral variation given by this weight grade on the $i$th chart;
  the chosen line is $F^d \( V_i \)_chi$.

#thm([Lemma 2.9.])[
  #emph[A positive tensor power of these local Hodge lines is the highest Hodge line of a complex direct summand
    of a global real-polarizable integral pure variation on $W^compose$.]
] <rankone:descent>

#proof[
  Refine an overlap so that a root of its transition unit can be chosen.
    It gives an isomorphism between the cyclic-cover families,
    and therefore an isomorphism of their integral cohomology systems.
    Another choice differs by a deck transformation. On a triple overlap the cocycle defect is also a deck
    transformation. All these maps commute with the distinguished $mu_m$-action.
  Put
  $ bb(U)_i = #scale(x: 120%, y: 120%)[\(] \( V_(i \, upright(bold(Z))) \/ upright("torsion") \)^(⊗ m)
    #scale(x: 120%, y: 120%)[\)]^(mu_m) \, $
  using the diagonal deck action. The ambiguity and the cocycle defect act trivially on $bb(U)_i$.
    Hence the $bb(U)_i$ descend to an integral local system $bb(U)$;
    saturation only changes the lattice by an isogeny. The compatible real polarizations,
    tensorized and restricted to invariants, polarize this pure variation.
  Over $upright(bold(C))$ the character projector $e_chi$ is a flat Hodge endomorphism on each chart.
    The projector $e_chi^(⊗ m)$ restricts to the invariant tensor space, because $chi^m = 1$.
    It commutes with all transition maps and therefore defines a global complex direct summand with local fibers
    $\( \( V_i \)_chi \)^(⊗ m)$. Its highest step is $\( F^d \( V_i \)_chi \)^(⊗ m)$, a line.
    In local rooted notation this line is generated by $tau^(⊗ m)$, which is identified meromorphically with $s$.
    Thus no global root of $cal(E)_m$ and no global family of cyclic covers is needed. ◻
]

==== 2.6.3 The two extension orders <the-two-extension-orders>

Let $M$ denote one $m$th of the parabolic extension of the line just constructed.
  We use $s^(1 \/ m)$ for its local rational frame; the notation becomes literal after the powers and finite
  boundary covers above. We now compare this parabolic extension with the pole bounds of the original pluriform.

Fix a prime divisor $D$ on $W$ and use a local ordinary base volume $omega$ that does not vanish at its generic
  point. Work on a source model on which the divisor of the generator, the boundary,
  and the inverse image of $D$ have SNC support over that generic point,
  using strict transforms plus reduced exceptional boundary as before.
  All primes of this prepared source dominating $D$, including the exceptional primes introduced by its
  resolution, enter the following order tests. Put

$ l_E = 1 / m "ord"_E \( s and g^(*) omega^m \) \, wide a_E = "ord"_E \( g^(*) D \) \, wide delta_E = Delta_E \, $

and

$ alpha_D = min_(g \( E \) = D) frac(l_E + delta_E, a_E) \, wide beta_D = "ord"_D^M \( s^(1 \/ m) \) . $

The notation $s and g^(*) omega^m$ means the relative-times-base identification in the $m$th tensor power of the
  canonical bundle. For $q$ divisible by $m$ and clearing the rational data,
  and a meromorphic base function $phi$, the total pluriform $phi thin omega^q s^(q \/ m)$ has boundary-adjusted order

$ a_E "ord"_D \( phi \) + q \( l_E + delta_E \) $

at $E$. It therefore satisfies the source boundary bounds at all these primes if and only if

#[#set math.equation(numbering: n => "(2.12)")
 $ "ord"_D \( phi \) + q alpha_D gt.eq 0 . $ <rankone:base-bound>]

The Hodge frame contributes $q beta_D$ to the order on the base, so the candidate boundary correction is $T_D =
  alpha_D - beta_D$. Computing $beta_D$ will reduce the required bounds on $T_D$ to a comparison of two minima.
  We first justify computing that Hodge order by logarithmic orders on a semistable cover,
  without changing the chosen pure Hodge line. Global consistency of $T$ and descent across the untested source
  primes will follow afterward.

==== 2.6.4 The extension across a transverse disk <the-extension-across-a-transverse-disk>

We use the analytic canonical-extension theorem #cite(label("FujinoFujisawaVMHS")) Theorem 1.1.
  It applies to a proper surjective morphism of an analytic SNC pair $\( Z \, H \)$ to a smooth base,
  with $H$ reduced, every stratum Kähler and dominant, and all strata smooth off a normal crossing discriminant.
  It supplies a graded-polarizable real variation on compact-support cohomology,
  locally free double Hodge/weight grades on the extension,
  and the dual direct-image description by $omega_(Z \/ B) \( H \)$.
  Admissibility is established in #cite(label("FujinoFujisawaVMHS")) Remark 4.8.
  These conclusions apply to proper Kähler families; projectivity is not required.

Take a transverse disk at a general point of a base divisor.
  Resolve the cyclic-cover pair together with the central fiber,
  leaving its smooth logarithmic locus over the punctured disk unchanged.
  Near a central point the resulting map has the form

$ t = epsilon x_1^(a_1) dots.h.c x_r^(a_r) \, wide H subset { x_(r + 1) dots.h.c x_l = 0 } \, $

where $epsilon$ is a unit and $H$ is the horizontal boundary.
  Absorbing it into a vertical coordinate gives a strict toroidal morphism.
  Compactness of the central fiber and properness allow us to shrink the disk until finitely many such charts
  cover its inverse image. The associated cone complex is therefore finite.
  Apply the combinatorial semistable subdivision theorem #cite(label("AdiprasitoLiuTemkinSemistable"))
  Theorem 2.7. Its base is one ray, so the base lattice alteration is realized by $t = u^N$.
  Normalize this base change, keeping all components, and realize the projective source subdivision analytically
  #cite(label("EnokizonoHashizumeSemistable")) Lemmas 2.14–2.15, 2.18, and 2.31(4).
  Zero-image faces, which record the horizontal boundary, are allowed in the combinatorial theorem.

The semistable local form is

$ u = y_1 dots.h.c y_q \, wide H subset { y_(q + 1) dots.h.c y_k = 0 } \; $

see #cite(label("EnokizonoHashizumeSemistable")) Lemma 2.21(4).
  Here $H$ includes every horizontal exceptional component in the transformed boundary.
  The total space is smooth, the central fiber is reduced, and its union with $H$ is SNC.
  On every horizontal intersection stratum the displayed monomial is nonconstant;
  properness makes its image the whole disk. The composite to the initial Kähler total space is projective,
  so the new total space and its smooth strata are Kähler after shrinking the disk #cite(label("FujikiDouady"))
  Lemma 4.4.

These toroidal modifications preserve the open pair on the punctured fibers.
  Its cohomology is therefore the pullback of the original open-fiber cohomology,
  including the full direct sum if the cover splits. Transport the original $mu_m$-action through this
  identification. The deck projector then acts on the variation and, by functoriality, on its canonical extension;
  no action on a selected component or on the chosen semistable model is needed.
  We apply the extension theorem componentwise and take the direct sum. We use this semistable pair itself:
  an arbitrary further resolution need not preserve reducedness.

For application of the cited theorem, $H$ consists of the horizontal logarithmic boundary.
  The central fiber is not included in $H$: it appears in the relative logarithmic complex,
  with $d t \/ t$ in the base quotient. Write $f : Z arrow.r B$ for this degeneration over the disk, and $Z_0 =
  f^(- 1) \( 0 \)$ for its central fiber. The top relative logarithmic sheaf is

#[#set math.equation(numbering: n => "(2.13)")
 $ omega_(Z \/ B) #scale(x: 120%, y: 120%)[\(] H + \( Z_0 \)_(upright("red")) -
   f^(*) \[ 0 \] #scale(x: 120%, y: 120%)[\)] . $ <rankone:log-volume>]

On the semistable model the central fiber is reduced, so this is $omega_(Z \/ B) \( H \)$.
  For a smooth open fiber of dimension $d$, Poincaré duality identifies

$ H_c^d \( Z_t \\ H_t \)^(*) tilde.eq H^d \( Z_t \\ H_t \) \( d \) . $

Accordingly the dual degree-zero Hodge quotient in #cite(label("FujinoFujisawaVMHS")) Theorem 1.1(iv) is precisely
  the top $F^d$ step of ordinary $H^d$. The upper and lower canonical extensions coincide after unipotentization.
  This proves that the canonical extension of the top step is the direct image of (2.13).
  The Kähler form of the one-parameter limiting theorem is also explained in #cite(label("FujinoFujisawaVMHS"))
  Remarks 2.16, 4.4, and 4.8.

#thm([Lemma 2.10.])[
  #emph[The projection of the rank-one top eigenspace to its nonzero pure weight grade is an isomorphism on
    canonical extensions after unipotentization. Consequently it is an isomorphism of parabolic rational lines
    before that base change.]
] <rankone:extension>

#proof[
  Let $overline(cal(V))_chi$ be the extended mixed eigensystem over the disk.
    The finite deck projector acts on the canonical extension and its filtrations. By the cited extension theorem, each
  $ "Gr"_F^p "Gr"_j^W overline(cal(V))_chi $
  is locally free and has its rank on the punctured disk. The filtrations on the weight quotients are induced
    filtrations. Thus the exact sequences
  $ 0 arrow.r F^d W_(j - 1) overline(cal(V))_chi arrow.r F^d W_j overline(cal(V))_chi arrow.r
    F^d "Gr"_j^W overline(cal(V))_chi arrow.r 0 $
  have locally free quotients. There is no step above $F^d$, also on the extension,
    by these constant-rank assertions. Exactly one of the displayed quotients has rank one, namely that for $j =
    w$; all the others have rank zero. Induction on the weight filtration therefore gives
  $ F^d W_(w - 1) overline(cal(V))_chi = 0 \, wide F^d W_w overline(cal(V))_chi = F^d overline(cal(V))_chi \, $
  and identifies the latter line with $F^d "Gr"_w^W overline(cal(V))_chi$ across the origin,
    without an additional zero or pole. Descent gives the parabolic assertion. ◻
]

==== 2.6.5 The divisorial order of the Hodge line <the-divisorial-order-of-the-hodge-line>

With the notation and prepared source above, we claim that the parabolic order of the frame $s^(1 \/ m)$ in $M$ is

#[#set math.equation(numbering: n => "(2.14)")
 $ beta_D = "ord"_D^M \( s^(1 \/ m) \) = min_(g \( E \) = D) frac(l_E + 1 - a_E, a_E) . $ <rankone:order>]

Equivalently, $beta_D$ is the largest rational number $b$ such that $t^(- b)
  s^(1 \/ m)$ extends at $D = \( t = 0 \)$ in the parabolic sense.

It suffices to work over a transverse disk, suppressing the other base coordinates.
  Write $tau = s^(1 \/ m)$ and $Omega = tau and g^(*) d t$.
  The multivalued total form $Omega \/ t$ has order $l_E - a_E$ at $E$.
  A logarithmic extension allows order $- 1$, so twisting by $t^(- b)$ imposes

#[#set math.equation(numbering: n => "(2.15)")
 $ l_E + 1 - a_E - a_E b gt.eq 0 . $ <rankone:inequality>]

To verify this directly against the canonical extension, take a finite base change $t =
  u^N$ and a semistable model of the root cover. At a central prime over the strict transform of $E$,
  let $e$ be the total ramification index of the composite map to $X$, including the cyclic-cover ramification.
  Reducedness gives $e a_E = "ord"_(E') \( t \) = N "ord"_(E') \( u \) = N$, where $E'$ is this new prime.
  Orders of a total volume form shifted by one multiply by $e$.
  Dividing its pullback by $d t \/ d u = N u^(N - 1)$ therefore gives

$ "ord" \( tau and d u \) = e \( l_E + 1 \) - N = e \( l_E + 1 - a_E \) . $

The base twist subtracts $N b = e a_E b$. Regularity in (2.13) is exactly (2.15).
  By 11, testing the logarithmic top form tests the chosen pure Hodge line as well.
  The form being tested is the pullback of the original tautological form on the full cover.
  The identification of open-fiber cohomology above and the direct-image description of its canonical extension
  identify it with that same Hodge section. Keeping all normalized components ensures that a prime above every
  original $E$ is present; the proper toroidal modifications retain its strict transform.

To prove sufficiency, continue to write $X$ for the smooth source over the transverse disk and put $n = d + 1$.
  In SNC coordinates write

$ Omega = h product_i x_i^(l_i) thin d x_1 and dots.h.c and d x_n \, wide t = h' product_i x_i^(a_i) \, $

where $h \, h'$ are units and $a_i = 0$ for horizontal components. Put $c_i = l_i + 1 - \( 1 + b \) a_i$.
  The vertical inequalities (2.15) and the horizontal logarithmic bounds give $c_i gt.eq 0$.
  For any additional divisorial valuation $v$, write $A_X \( v \)$ for its log discrepancy over this smooth model,
  that is, one plus the order of the Jacobian. Logarithmic pullback of the SNC coordinate divisor gives
  $A_X \( v \) gt.eq sum_i v \( x_i \)$, exactly as in 2. Thus the shifted order of $t^(- \( 1 + b \)) Omega$ is

$ A_X \( v \) + sum_i #scale(x: 120%, y: 120%)[\(] l_i - \( 1 + b \) a_i #scale(x: 120%, y: 120%)[\)] v \( x_i \)
  med gt.eq med sum_i c_i v \( x_i \) med gt.eq med 0 . $

These inequalities persist under finite covers, since shifted orders multiply by ramification indices.
  Further exceptional primes therefore impose no stronger condition.
  Horizontally, shifted orders are strictly positive outside the designated log boundary;
  on the root cover these are positive integers, so there are no poles there.
  Conversely, covering primes above strict transforms detect every inequality in (2.15).
  Taking their minimum proves (2.14).

#prodef([Remark 2.11.])[
  The use of all primes on the resolved model in (2.14) matters even for a simple logarithmic family.
    On $upright(bold(P))_x^1$ over a disk, remove the horizontal divisor $x^2 = t$ and use $tau =
    d x \/ \( x^2 - t \)$. After $t = u^2$ and $x = u z$, one has $tau = u^(- 1) d z \/ \( z^2 - 1 \)$,
    so the parabolic order is $- 1 \/ 2$. Resolving the tangency of the horizontal divisor with $t =
    0$ introduces a prime with $a_E = 2$ and $l_E = 0$, which gives exactly $- 1 \/ 2$ in (2.14).
    The original central prime alone would not detect it.
] <rankone:collision>

==== 2.6.6 The boundary and the comparison of sections <the-boundary-and-the-comparison-of-sections>

Define

#[#set math.equation(numbering: n => "(2.16)")
 $ T_D = alpha_D - beta_D . $ <rankone:alpha-T>]

Changing $s$ to $v s$, for a meromorphic base function $v$, adds $a_E "ord"_D \( v \) \/ m$ to $l_E$.
  Hence it adds $"ord"_D \( v \) \/ m$ to both $alpha_D$ and $beta_D$ and leaves $T_D$ unchanged.
  This also checks the transformation rule for the rational Hodge frame in (2.14).
  Passing to a higher divisible generating degree has the same effect:
  on the generic fiber its generator is a base multiple of a power of $s$.
  Thus the construction is independent of these choices.

For the boundary inequality, write

$ x_E = frac(l_E + delta_E, a_E) \, wide c_E = 1 - frac(1 - delta_E, a_E) . $

Then $0 lt.eq c_E lt.eq 1$, and

$ T_D = min_E x_E - min_E \( x_E - c_E \) . $

For any finite collections of real numbers $x_E \, c_E$, this difference lies between $min_E c_E$ and $max_E c_E$.
  Moreover the inf-multiplicity convention gives

$ min_E c_E = 1 - max_(g \( E \) = D) frac(1 - delta_E, a_E) = B \( g \, Delta \)_D . $

This proves (2.8). If all $delta_E = 1$, all $c_E = 1$, so $T_D = 1$.

Choose the discriminant to include the vertical boundary and all loci where the smooth log construction fails.
  Off it the family and the generator line are smooth log-relative data, and there is no vertical boundary.
  There $alpha_D = beta_D$; in a nonvanishing generator frame both are zero.
  Thus $T$ has finite support in the chosen discriminant, which may be resolved to be SNC.
  On subsequent modifications one pulls back the variation and its parabolic line and recomputes $alpha_D$ and
  (2.16); the order computation is unchanged on the resulting models.

#proof[
  #emph[Completion of the proof of 8.] Take $q$ divisible by $m$ and by the denominators of all rational data.
    In a local base frame, a meromorphic section of $q \( K_W + T + M \)$ is represented by
  $ phi thin omega^q s^(q \/ m) . $
  The order of the frame in $T + M$ is $q \( T_D + beta_D \) = q alpha_D$.
    Consequently this section is regular at $D$ exactly when (2.12) holds.
    The source-side order test already proved identifies this with the boundary bounds at every source prime
    dominating $D$. Along horizontal primes the required bound is automatic because $s^(q \/ m)$ is a logarithmic
    pluricanonical section on the general fiber. We have proved the exact section comparison in codimension one on
    the base, and at all source primes except those contracted by $g$ into codimension at least two.
  Conversely, a section of $q \( K_X + Delta \)$ restricts on a general $g$-fiber to a multiple of $s^(q \/ m)$.
    Their ratio is a meromorphic function constant on the connected general fibers,
    and therefore descends meromorphically to $W$. The same divisorial inequalities make it a section of
    $q \( K_W + T + M \)$ outside codimension two; smoothness of $W$ extends it uniquely across that set.
    This proves the converse comparison in all divisible degrees under consideration.
  For the forward direction, a section on $W$ gives a meromorphic adjoint form on $X$ whose only possible
    remaining poles lie on $g$-contracted prime divisors. By hypothesis these divisors are $pi$-exceptional.
    Push the form to $X_0$. At every prime of $X_0$ its transform was among the tested primes of $X$,
    so the pushed form satisfies the $Delta_0$ pole bound in codimension one.
    Since $X_0$ is smooth and the adjoint multiple is a line bundle, it extends across codimension two.
    Finally 2 pulls it back to a section of $q \( K_X + Delta \)$, proving (2.9).
  If the diagram is over $Y$, apply this argument over an arbitrary open subset $U subset Y$.
    Its inverse image in $X$ is $pi^(- 1) \( f_0^(- 1) U \) = g^(- 1) \( h^(- 1) U \)$,
    and $pi$ is still proper over the smooth open space $f_0^(- 1) U$.
    The exceptional images still have codimension at least two.
    The construction and the extension of sections commute with restriction to $U$, giving (2.10).
    Relative canonical versions, when the auxiliary base is smooth, follow by the projection formula.
    All comparisons multiply by the same relative generator, with its powers in the common divisible grading,
    so they preserve products and ratios of sections. The projection formula also gives the identity after any
    pulled-back base twist, in degrees clearing the denominator for a rational twist. This completes 8. ◻
]

=== 2.7 Retaining the original base multiplicities <retaining-the-original-base-multiplicities>

#thm([Lemma 2.12.])[
  (Composition of inf-multiplicity bounds).  #emph[Suppose that $X arrow.r^g W arrow.r^h
    Y$ is a diagram of surjective maps between smooth spaces, and $Delta \, T \,
    C$ are rational boundaries on these spaces. If
$ T gt.eq B \( g \, Delta \) \, wide C lt.eq B \( h compose g \, Delta \) \, $

 then $B \( h \, T \) gt.eq C$. If, in addition, every prime divisor of $X$ mapped into codimension at least two
   in $Y$ has coefficient one in $Delta$, and $T lt.eq 1$, then every prime divisor of $W$ mapped into codimension
   at least two in $Y$ has coefficient one in $T$.]
] <application:composition>

This is the inf-multiplicity composition comparison of #cite(label("CampanaOrbifolds")) Proposition 3.13(1);
  we include its order calculation to track coefficient-one exceptional divisors.

#proof[
  Let $D subset Y$ and $V subset W$ be prime divisors with $h \( V \) = D$. Write $b_V = "ord"_V \( h^(*) D \)$.
    If $E subset X$ is a prime divisor dominating $V$, put $a_E = "ord"_E \( g^(*) V \)$.
    At their generic points orders multiply, so
  $ "ord"_E \( \( h compose g \)^(*) D \) = b_V a_E . $
  The hypothesis on $C$ implies $b_V a_E m_Delta \( E \) gt.eq m_C \( D \)$ for every such $E$.
    Taking the minimum over them and then using the hypothesis on $T$ gives
  $ b_V m_T \( V \) med gt.eq med b_V m \( g \, Delta \; V \) med gt.eq med m_C \( D \) . $
  Taking the minimum over $V$ proves the first assertion. All these inequalities are valid with the prescribed
    convention for infinity.
  For the second assertion, let $V$ be mapped into codimension at least two in $Y$.
    Every prime $E$ dominating it has $Delta_E = 1$, so $m \( g \, Delta \; V \) = oo$.
    It follows that $B \( g \, Delta \)_V = 1$, and hence $T_V = 1$. ◻
]

== 3 The adjoint-addition principle <addition:section>

The section comparison reduces subadditivity to a statement about $K_W + T + M$.
  We prove that statement here from the two positivity inputs specified below.
  Its two maps have different purposes: $h$ is the fibration whose fiber dimension is to be added,
  whereas $p$ expresses the nef term as a pullback from a projective base.

The first input is the precise adjoint-positivity theorem for the line produced by the construction.
  We use the highest-step and parabolic-extension conventions of Section 2.6.

#thm([Theorem 3.1.])[
  (Adjoint-positivity input).  #emph[Let $B$ be a smooth compact connected manifold in class $cal(C)$ and
    $B^compose subset B$ a dense Zariski open set with SNC complement.
    Let $bb(V)$ be a pure real-polarizable variation of Hodge structures on $B^compose$ with an integral ambient
    lattice. Suppose a complex direct summand of $bb(V)_(upright(bold(C)))$ has a rank-one highest nonzero Hodge
    step, with parabolic rational extension $L$. There are a modification $tau : B' arrow.r B$,
    a surjective morphism $p : B' arrow.r S$ with connected fibers to a smooth projective variety,
    and a nef rational line bundle $P$ on $S$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ tau^(*) L = p^(*) P \, wide K_S + a P upright(" is big for some ") a in upright(bold(Q))_(> 0) .
   $ <period:conclusion>]

 Positive rational rescaling of $L$ is allowed, and the line identity persists under further modifications.
   If $S$ is a point, $tau^(*) L$ is rationally trivial.]
] <period:adjoint>

The full proof is in Section 4. The lattice belongs to the ambient variation:
  the complex summand need not itself be defined over $upright(bold(Q))$,
  and the real polarization need not be rational.

The second input supplies addition when the fiber already has a big log canonical divisor.
  It will be proved in Section 5.

#thm([Proposition 3.2.])[
  #emph[Let $h : V arrow.r Y$ be a surjective holomorphic map with connected fibers between smooth compact complex
    manifolds in Fujiki class $cal(C)$. Let $T$ and $C$ be effective rational divisors with simple normal crossing
    support and coefficients in $\[ 0 \, 1 \]$ on $V$ and $Y$, respectively. Suppose that]
  + #emph[$K_F + T_F$ is big for a very general smooth fiber $F$ of $h$;]
  + #emph[$C lt.eq B \( h \, T \)$;]
  + #emph[$T_E = 1$ for every prime divisor $E$ of $V$ whose image in $Y$ has codimension at least two.]
  #emph[Then
#[#set math.equation(numbering: n => "(3.2)")
 $ kappa \( V \, K_V + T \) med gt.eq med dim F + kappa \( Y \, K_Y + C \) . $ <generaltype:inequality>]

 As usual, the assertion is automatic if the last term is $- oo$.]
] <generaltype:addition>

General-type addition will give sections after a positive ample twist from $S$.
  To remove that twist, we will need one fixed section with a negative ample twist.
  The next lemma produces it from a big base divisor, once nonvanishing on the general $p$-fiber is known.
  It uses weak positivity with exceptional poles and descent to a fixed smooth reference,
  following the method of #cite(label("CampanaOrbifolds")) Remark 6.5(3) and Proposition 6.6.
  We include the descent step explicitly.

#thm([Lemma 3.3.])[
  (Effectivity after a big base twist).  #emph[Let $p : \( W \, T \) arrow.r S$ be surjective,
    with $W$ smooth compact in class $cal(C)$, $S$ smooth projective, and $T$ a rational SNC boundary.
    Suppose one fixed divisible relative log pluricanonical system is nonzero on very general fibers.
    For every big rational line bundle $H$ on $S$, the rational line bundle $K_(W \/ S) + T +
    p^(*) H$ has a nonzero section in some positive degree.]
] <application:weak-effectivity>

#proof[
  Choose a Kähler source modification, flatten over a smooth projective modification $pi : S' arrow.r S$,
    and resolve the flat main transform. Write $mu : W' arrow.r W$ and $p' : W' arrow.r
    S'$ for the resulting maps. Give $W'$ the strict transform of $T$ plus the reduced $mu$-exceptional divisor,
    denoted $T'$. Then
  #[#set math.equation(numbering: n => "(3.3)")
   $ K_(W') + T' = mu^(*) \( K_W + T \) + E \, wide E gt.eq 0 med
     upright("and ") mu upright("-exceptional") . $ <application:source-discrepancy>]
  Every source prime over a subset of codimension at least two in $S'$ is exceptional over the fixed $W$:
    before resolving the source, flatness bounds that inverse image by codimension at least two.
    Put $R = K_(S' \/ S) gt.eq 0$ and $H' = pi^(*) H + R$. The exact identity
  #[#set math.equation(numbering: n => "(3.4)")
   $ K_(W' \/ S') + T' + p' ""^(*) H' = mu^(*) \( K_(W \/ S) + T + p^(*) H \) + E $ <application:twist-cancellation>]
  will allow descent.
  Choose a divisible $m > 0$ such that $cal(E) = p'_(*) cal(O)_(W') \( m \( K_(W' \/ S') + T' \) \)$ has positive
    rank. Generic base change and the hypothesis provide such an $m$.
    Fujino’s weak positivity theorem applies to this log canonical pair and its projective base
    #cite(label("FujinoWeakPositivity")) Theorem 1.1. Choose an ample Cartier divisor $A_0$ and an integer
    $alpha > 0$ such that $H' - A_0 \/ \( m alpha \)$ is big. For some integer $beta > 0$,
  $ \( "Sym"^(alpha beta) cal(E) \)^(* *) ⊗ cal(O)_(S') \( beta A_0 \) $
  is generated by global sections at the generic point.
  On the locally free locus of $cal(E)$, multiplication of relative sections gives an evaluation map to
  $ cal(O)_(W') #scale(x: 120%, y: 120%)[\(] m alpha beta \( K_(W' \/ S') + T' \) +
    beta p' ""^(*) A_0 #scale(x: 120%, y: 120%)[\)] . $
  It is nonzero generically, because a nonzero relative section has nonzero powers.
    Generic generation supplies a global section whose image is nonzero.
    The complement of the locally free locus has codimension at least two.
    Multiply a sufficiently divisible power of the evaluated section by a section of a sufficiently divisible
    multiple of $m alpha beta thin p' ""^(*) \( H' - A_0 \/ \( m alpha \) \)$. The latter exists by bigness.
    This produces a nonzero section of a multiple of the left side of (3.4),
    except possibly at source primes above that codimension-two set.
  Locally, a meromorphic frame of $cal(E)$ expresses the evaluated section as a meromorphic combination of
    products of relative sections. Thus the resulting form is meromorphic,
    and its only possible divisorial poles lie above that omitted codimension-two set.
    Those primes, and $E$, are exceptional over $W$. At every prime of the original smooth $W$,
    the resulting meromorphic form therefore has the required order for a multiple of $K_(W \/ S) + T + p^(*) H$.
    Divisorial regularity and extension across codimension two give a global section on $W$.
    If $S$ is a point, the same conclusion is the assumed nonvanishing. ◻
]

#thm([Proposition 3.4.])[
  (Adjoint addition).  #emph[Let $h : W arrow.r Y$ be a fibration between smooth compact manifolds in class
    $cal(C)$. Let $T \, C$ be rational SNC boundaries with $C lt.eq B \( h \, T \)$,
    and suppose every prime of $W$ whose image has codimension at least two in $Y$ has coefficient one in $T$.
    Let $p : W arrow.r S$ be a surjective morphism with connected fibers to a smooth projective variety.
    Suppose $P$ is a nef rational line bundle on $S$, $M = p^(*) P$, and $K_S +
    a_0 P$ is big for some rational $a_0 > 0$. If $K_W + T + M$ is big on very general $h$-fibers, then
$ kappa \( W \, K_W + T + M \) gt.eq dim \( W \/ Y \) + kappa \( Y \, K_Y + C \) . $

]
] <addition:principle>

#proof[
  The assertion is automatic if the last term is $- oo$. Assume it is nonnegative, put $D = K_W + T$,
    and write $k = dim \( W \/ Y \)$. We may first replace $W$ by a Kähler modification,
    adding the reduced exceptional divisor to its strict boundary.
    The log section spaces, also after tensoring by the pullback of $M$, are unchanged.
    Fiberwise bigness and the inf-multiplicity boundary are preserved;
    newly exceptional primes have coefficient one. Thus all hypotheses remain valid.
  If $S$ is a point, $M$ is rationally trivial and 15 proves the proposition.
    Suppose $dim S > 0$, and choose an ample Cartier divisor $A$ on $S$.
    A very general $h$-fiber is Kähler and carries the big rational line $\( D + M \) \|_(W_y)$,
    so it is projective. Openness of its big cone gives a rational $c$ with $0 < c <
    1$ for which $\( D + c M \) \|_(W_y)$ is still big. This choice works on very general fibers:
    choose the first fiber outside the countably many cohomology and evaluation-rank exceptional loci for rational
    $c$ and divisible degrees. The one full-rank system just found then has the same rank generically.
    For zero-dimensional fibers this argument is unnecessary.
  For every positive rational $eta$, $c P + eta A$ is ample.
    Choose a sufficiently divisible large $N$ and a general member of the basepoint-free system $\| N
    p^(*) \( c P + eta A \) \|$. Dividing by $N$ gives an effective rational divisor $Q_eta$ such that
  $ Q_eta tilde.op_(upright(bold(Q))) c M + eta p^(*) A \, wide T + Q_eta med upright("is an SNC boundary") . $
  Bertini is applied simultaneously to the finitely many strata of $T$;
    the member contains no old boundary component, and increasing $N$ bounds its new coefficients by one.
    Existing coefficient-one components remain unchanged, and increasing the source boundary can only increase
    $B \( h \, T \)$. Thus all boundary hypotheses of 15 hold for $T + Q_eta$.
    Its fiber adjoint is big by the choice of $c$ and nefness of the added ample pullback. Consequently
  #[#set math.equation(numbering: n => "(3.5)")
   $ kappa \( W \, D + c M + eta p^(*) A \) gt.eq k + kappa \( Y \, K_Y + C \)
     wide \( eta in upright(bold(Q))_(> 0) \) . $ <application:perturbed-bound>]
  The systems in (3.5) already have the required image dimension.
    It remains to remove their ample term without losing these ratios of sections.
    In particular one such divisor has a nonzero section in a fixed positive degree.
    Restriction of that section to a very general $p$-fiber is nonzero;
    both pulled-back twists become trivial there. Hence
  #[#set math.equation(numbering: n => "(3.6)")
   $ kappa \( W_s \, \( K_W + T \) \|_(W_s) \) gt.eq 0 quad upright("for very general ") s in S .
     $ <application:p-fiber-nonvanishing>]
  One fixed relative log pluricanonical direct image for $p : \( W \, T \) arrow.r S$ therefore has positive rank.
  Choose rational $a > max { 1 \, a_0 }$. Since $P$ is nef, $K_S + a P$ is big.
    For sufficiently small rational $lambda > 0$, $H = K_S + a P - lambda A$ is still big.
    Lemma 16 now gives a nonzero section of a positive multiple of
  #[#set math.equation(numbering: n => "(3.7)")
   $ E_(-) = D + a M - lambda p^(*) A = K_(W \/ S) + T + p^(*) H . $ <application:negative-twist>]
  Put
  $ theta = frac(1 - c, a - c) \, wide eta = frac(\( 1 - c \) lambda, a - 1) \, wide E_(+) = D + c M + eta p^(*) A . $
  Then $0 < theta < 1$, $eta > 0$, and direct calculation gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ D + M = \( 1 - theta \) E_(+) + theta E_(-) . $ <addition:cancel>]
  Fix a nonzero section $e$ of $r E_(-)$ for one denominator-clearing $r > 0$.
    For sufficiently divisible $n$, multiplication by $e^(n theta \/ r)$ maps
  $ H^0 \( W \, n \( 1 - theta \) E_(+) \) arrow.r.hook H^0 \( W \, n \( D + M \) \) . $
  The exponent is an integer, and the source degrees range through a Veronese subsequence.
    On the complement of the zero divisor of $e$, every ratio of two sections is unchanged.
    These systems therefore have the same image dimensions before and after multiplication.
    Equation (3.5) for the displayed value of $eta$ proves the asserted lower bound. ◻
]

== 4 Adjoint positivity of an extreme Hodge line <period:section>

The relative canonical bundle calculation gives a line in the highest nonzero Hodge filtration step of one complex
  summand. Its curvature is semipositive, but this alone does not compare it with a canonical bundle.
  We construct a projective quotient on which the line descends and prove that adding a positive multiple of it
  makes the canonical class big.

Here an #emph[extreme Hodge line] means the rank-one highest nonzero filtration step of a complex Hodge direct
  summand. An integral structure is a lattice in the ambient real local system.
  The chosen summand need not be rational, and the ambient real polarization need not be rational either.

The #emph[parabolic extension] is obtained by local power substitutions that make boundary monodromy unipotent,
  followed by Schmid extension and descent with rational weights.
  The monodromy theorem gives rational weights in the integral case.
  When the local monodromy has a finite part, these weights are essential.
  We first resolve any compactification whose boundary is not simple normal crossing.
  Unipotent extension commutes with pullback, so the same is true of the parabolic rational line after the power
  substitutions; see #cite(label("Schmid")) #cite(label("CKS")) and #cite(label("BFMT")) Lemma 5.6.
  We use version 2 of #cite(label("BFMT")) throughout.

We prove the adjoint-positivity theorem stated as 14. The line in that statement is allowed to be a complex
  character line inside an integral ambient variation.

There are two maps in the proof. In a flat trivialization the #emph[line map] records only the chosen highest
  line; the #emph[period map] records all Hodge filtration steps. Their ranks can differ.
  Curvature identifies the numerical dimension of the line with the rank of the first map.
  We use the full periods of suitable rational adjoint factors to construct the projective quotient.
  On that quotient, logarithmic general type gives a big canonical class with boundary.
  The remaining argument proves that the line loses numerical rank on each marked boundary component,
  so a section count removes the boundary after adding a multiple of the line.

=== 4.1 Curvature, numerical dimension, and the boundary <curvature-numerical-dimension-and-the-boundary>

We first relate the curvature on the open set to intersection numbers on the compactification.
  For a nef rational line bundle $A$ on a compact Kähler $n$-fold, we use

$ nu \( A \) = max { k : c_1 \( A \)^k dot.op \[ omega \]^(n - k) > 0 } \, $

where $omega$ is any Kähler form. On a projective manifold this is the usual numerical dimension.

#thm([Lemma 4.1.])[
  (Curvature and numerical dimension).  #emph[Let $T$ be a smooth compact Kähler manifold,
    let $E subset T$ be a simple normal crossing divisor, and let $A$ be the parabolic extension of the rank-one
    highest step of a polarizable pure complex variation on $T \\ E$ with quasi-unipotent local monodromy.
    Then $A$ is nef. Its numerical dimension equals the generic rank of the map that remembers this line in a flat
    trivialization.]
  #emph[The corresponding assertion for the Griffiths line,
    the tensor product of the determinants of the Hodge filtration steps, uses the full period map.
    In particular, its rational extension is big if the full period map is generically immersive.]
] <period:numerics>

The curvature-and-volume argument is closely related to the proofs of #cite(label("BakkerBrunebarbeTsimerman"))
  Lemmas 6.15 and 6.17; here we need all mixed intersection numbers, since the chosen line need not be big.

#proof[
  We may check the assertions after a finite cover and resolution on which local monodromy is unipotent.
    This does not require an integral lattice. Indeed, $pi_1 \( T \\ E \)$ is finitely generated.
    Put the entries of finitely many monodromy generators and their inverses in a finitely generated
    $upright(bold(Z))$-algebra $R subset upright(bold(C))$. Adjoin the finite group of roots of unity generated by
    the eigenvalues of the finitely many boundary monodromies, and invert every difference $zeta -
    1$ for a nonidentity element of this group. Reduction at a maximal ideal with finite residue field gives a
    finite-index normal congruence subgroup. Every element of a local boundary monodromy group that lies in this
    subgroup is unipotent: its eigenvalues belong to that finite group and reduce to one,
    so the inverted differences force them to equal one. This also applies to products of commuting boundary
    monodromies at crossings. The corresponding finite cover extends over the compactification,
    and a Kähler resolution gives the desired unipotent model;
    see #cite(label("VilladsenHodgeKahler")) Lemma 2.21. These covers preserve nefness, numerical dimension,
    and bigness of the rational line. Let $h$ be its Hodge metric and $Theta$ its curvature on $T \\ E$,
    normalized to represent $c_1 \( A \)$. Griffiths’ curvature formula gives $Theta gt.eq 0$;
    its rank is the rank of the line map, since its value on a tangent vector is the squared norm of the second
    fundamental form of the highest step. The same formula for the Griffiths line detects the differential of the
    full period map.
  The Hodge norm estimates in extending frames give, in boundary coordinates $t_1 \, dots.h \, t_k$,
    weights whose absolute values are bounded by
  #[#set math.equation(numbering: n => "(4.1)")
   $ C (1 + sum_(j = 1)^k log \( - log \| t_j \| \)) . $ <period:loglog>]
  The semipositive metric therefore extends as a positive current in $c_1 \( A \)$ with zero Lelong numbers.
    Regularization of positive currents then gives nefness; see #cite(label("DemaillyRegularization"))
    Corollary 6.4. This extends the nefness argument of #cite(label("BFMT")) Lemma 2.16(1) from a proper log
    smooth algebraic space to the present compact Kähler setting.
  To identify numerical dimension, we must also show that no intersection mass is lost at $E$.
    Write $alpha = c_1 \( A \)$ and fix $epsilon > 0$. Since $alpha$ is nef, $alpha +
    epsilon \[ omega \]$ has a smooth Kähler representative $theta_epsilon$. Write
  $ Theta + epsilon omega = theta_epsilon + d d^c u \, wide d d^c = frac(sqrt(- 1), 2 pi) partial macron(partial) . $
  The global potential $u$ satisfies the local bounds (4.1). Put $n = dim T$.
    If $E$ is empty, the potential is smooth and there is no lost mass.
    Otherwise write $E = E_1 + dots.h.c + E_N$ and choose smooth divisor metrics, with defining sections $s_j$,
    such that
  $ u_j = - log \| s_j \|^2 \, wide d d^c \( - u_j \) = \[ E_j \] - eta_j \, $
  where the $eta_j$ are smooth curvature forms. Choose $c > 0$ with $c eta_j lt.eq theta_epsilon$ for all $j$,
    and rescale the metrics so that $c u_j gt.eq 1$. Then $phi.alt_j = -
    c u_j$ is $theta_epsilon$-plurisubharmonic and $phi.alt_j lt.eq - 1$.
    For any fixed $0 < b < 1$, the attenuation theorem #cite(label("GuedjZeriahiEnergy")) Example 2.14 gives
  $ psi_j = - \( - phi.alt_j \)^b = - c^b u_j^b $
  with full Monge–Ampère mass in the Kähler class $\[ theta_epsilon \]$.
    The full-mass class is convex and contains the zero potential #cite(label("GuedjZeriahiEnergy"))
    Proposition 1.6. Thus, for $0 < delta lt.eq c^b \/ N$, the potential
  #[#set math.equation(numbering: n => "(4.2)")
   $ v = - delta sum_(j = 1)^N u_j^b = sum_(j = 1)^N delta / c^b psi_j + (1 - frac(N delta, c^b)) 0 $ <period:barrier>]
  is $theta_epsilon$-plurisubharmonic and has full mass. A positive power grows faster than a logarithm,
    so (4.1) implies $v - C lt.eq u$ globally for some constant $C$.
    Full mass is preserved on passing to less singular potentials #cite(label("BEGZ")) Propositions 2.11(i)
    and 2.14(i). Hence $u$ has full mass. The non-pluripolar measure gives no mass to the analytic set $E$ and
    agrees with the smooth wedge product on its complement. Consequently
  $ integral_(T \\ E) \( Theta + epsilon omega \)^n = \( alpha + epsilon \[ omega \] \)^n . $
  Expand both sides as polynomials in $epsilon$. Their coefficients are finite,
    since all summands on the left are nonnegative. Equality for all $epsilon > 0$ gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ integral_(T \\ E) Theta^k and omega^(n - k) = alpha^k dot.op \[ omega \]^(n - k)
     wide \( 0 lt.eq k lt.eq n \) . $ <period:masses>]
  If the generic curvature rank is $r$, the left side is positive for $k lt.eq r$ and zero for $k > r$.
    This proves the numerical assertion. For an immersive Griffiths line the top integral is positive,
    and the volume criterion for a positive current on a compact Kähler manifold gives bigness;
    see #cite(label("BoucksomVolume")). ◻
]

#thm([Lemma 4.2.])[
  (Restriction to a boundary component).  #emph[In the unipotent case of 18,
    let $E_i$ be a smooth boundary component and $N_i$ its monodromy logarithm.
    On the open stratum of $E_i$, the limiting highest line occurs in a unique weight grade of the limiting mixed
    variation. The restriction $A \|_(E_i)$ is the Schmid extension, across the remaining boundary of $E_i$,
    of that graded Hodge line. Its numerical dimension is therefore the generic rank of the graded line map.]
] <period:boundary>

#proof[
  The extended filtration and $W \( N_i \)$ give the limiting mixed variation along the open stratum.
    Since the highest step has rank one, exactly one weight grade contains it.
    Changes of the normal parameter act by $exp \( c N_i \)$ and act trivially on the associated graded.
    At a further crossing the relative monodromy filtration identifies the extension of this graded variation with
    the graded of the original extending filtration. Thus the identification holds on the entire component.
    For log smooth algebraic spaces it is stated in #cite(label("BFMT")) §2.5.3 and Lemma 2.16(3);
    its local proof uses the multivariable nilpotent orbit theorem #cite(label("CKS")) and applies here as well.
    The filtrations and strictness also restrict to a complex summand. Apply 18 on $E_i$. ◻
]

=== 4.2 Rational adjoint periods and descent of the line <rational-adjoint-periods-and-descent-of-the-line>

The period-quotient construction requires discrete monodromy.
  A projection to one complex factor need not retain it. We therefore construct a rationally polarized adjoint
  variation from the ambient integral local system and keep whole rational factors.
  A tensor construction then recovers a positive power of the original line, including its scalar monodromy.

#thm([Lemma 4.3.])[
  (Rational adjoint reduction).  #emph[In the setting of 14,
    let $G$ be the identity component of the rational Zariski closure of monodromy. Then $G$ is semisimple.
    Its adjoint local system is a rationally polarized integral variation of weight zero.]
  #emph[There is a monodromy-invariant collection of rational simple adjoint factors,
    each containing a complex factor acting nontrivially on the highest-line orbit, with the following properties.
    The resulting adjoint variation $bb(A)$ has discrete integral monodromy.
    After a positive power and up to a constant one-dimensional complex Hodge shift,
    the original line is the highest line of a complex subvariation of a tensor construction on $bb(A)$.
    On a finite cover preserving the factors, that line splits into the tensor product of the highest lines
    belonging to the individual complex factors. All these highest steps have rank one.]
] <period:adjoint-reduction>

#proof[
  Semisimplicity and the theorem of the fixed part hold for polarizable real and complex variations on a Zariski
    open subset of a compact Kähler manifold. We may use a Kähler modification of $B$ to apply them;
    see #cite(label("PopaSchnellKahler")) Lemma 2.3 and its proof and #cite(label("BakkerMatsushita")) Theorem 3
    and Remark 4. Thus the algebraic monodromy group is reductive.
    Pass temporarily to a finite cover on which it is connected.
    The irreducible complex constituents of the local system carry polarizable complex variations.
    They can be defined over a number field: the representation is rational and its algebraic monodromy is
    reductive. The determinant of each constituent is unitary, as are all its algebraic conjugates,
    which are again constituents of the rational representation.
    Its monodromy values are algebraic units by the integral lattice.
    Kronecker’s theorem makes these values roots of unity in a fixed number field,
    hence makes the determinant character finite. It is consequently trivial on $G$.
    This is Deligne’s finite-determinant argument; its classical algebraic formulation is
    #cite(label("DeligneHodgeII")) Corollary 4.2.8(iii)(b). The connected center of $G$ acts by scalar characters
    on the irreducible constituents; their determinants detect these characters.
    Since the original representation is faithful, this connected center is trivial. Therefore $G$ is semisimple.
  We next equip the monodromy Lie algebra with a rational polarization.
    In every tensor construction, the subspace of $G$-invariant tensors is the fixed part and has a constant Hodge
    structure. In a flat trivialization the Hodge circles $h_x$ and $h_(x_0)$ therefore induce exactly the same
    linear operator on each such subspace at each parameter $z in S^1$.
    Reductivity identifies $G$ with the pointwise stabilizer of all its invariant tensors.
    The circles preserve these subspaces, so normalize $G$, and the equality of their actions gives
  $ h_x \( z \) h_(x_0) \( z \)^(- 1) in G \( upright(bold(R)) \) . $
  Here is a direct local conjugacy argument. Along a smooth path in the base, write $a_t = "Ad" compose h_t :
    S^1 arrow.r G^(upright("ad")) \( upright(bold(R)) \)$ and $u_t \( z \) = \( partial_t a_t \( z \) \)
    a_t \( z \)^(- 1)$. Differentiating the homomorphism identity gives
  $ u_t \( z z' \) = u_t \( z \) + "Ad" \( a_t \( z \) \) u_t \( z' \) . $
  Normalized Haar averaging, with $X_t = integral_(S^1) u_t \( z' \) thin d z'$, yields $u_t \( z \) = X_t -
    "Ad" \( a_t \( z \) \) X_t$. The solution of $g'_t g_t^(- 1) = X_t$, $g_0 = 1$, therefore gives $a_t =
    g_t a_0 g_t^(- 1)$. Lift this path through the central isogeny $G \( upright(bold(R)) \)^(+) arrow.r
    G^(upright("ad")) \( upright(bold(R)) \)^(+)$. The ratio of $h_t$ and $g_t h_0
    g_t^(- 1)$ lies in $G \( upright(bold(R)) \)$ by the invariant-tensor equality,
    and centralizes $G$ by the equality of their adjoint actions.
    It lies in the finite center of $G$; continuity in the circle parameter makes it the identity.
    Thus $h_t = g_t h_0 g_t^(- 1)$, proving that the lifted period map lies in a single
    $G \( upright(bold(R)) \)^(+)$-orbit.
  It follows that $frak(g)_(upright(bold(Q))) = "Lie" \( G \)$ is a Hodge sub-local system of
    $"End" \( bb(V)_(upright(bold(Q))) \)$, with its weight-zero grading.
    The Weil involution $theta$ preserves $frak(g)_(upright(bold(R)))$ and is the restriction of the Cartan
    involution of the real polarization isometry group. To check the restriction, use the positive Hodge metric:
    on its Lie algebra $theta \( X \) = - X^(*)$. If $frak(g)_(upright(bold(R))) =
    frak(k) xor frak(p)$ is its eigenspace decomposition, then $frak(k) xor i
    frak(p)$ is a compact real form of $frak(g)_(upright(bold(C)))$, represented by skew-Hermitian endomorphisms.
    Thus $- B_(frak(g)) \( X \, theta X \)$ is positive definite,
    proving that $theta$ is Cartan on $frak(g)_(upright(bold(R)))$.
    The appropriately signed Killing form therefore polarizes this weight-zero variation. The form is rational. Moreover
  $ frak(g)_(upright(bold(Q))) ∩ "End" \( bb(V)_(upright(bold(Z))) \) $
  is a monodromy-invariant lattice. This gives the rationally polarized integral adjoint variation.
  Let $ell$ be the highest line at a reference point of the chosen complex summand.
    The non-lowering parabolic of the Hodge grading preserves $ell$, so a Borel subgroup preserves it. Its closed orbit
  $ J = G_(upright(bold(C))) ell $
  is a flag variety, a product of flag varieties for the complex simple factors.
    The span $W$ of this orbit is irreducible. Indeed, in a semisimple decomposition of the representation,
    the nonzero components of a Borel-eigenline all have the same highest weight;
    their span is a single diagonal copy of that irreducible representation.
    The line is its unique highest Hodge step. Indeed, at every point the Hodge circle normalizes $G$ and
    preserves the highest line there; it consequently preserves the span of its $G_(upright(bold(C)))$-orbit.
    Thus $W$ is a Hodge subvariation. The lifted line map takes values in $J$,
    and the original line is the pullback of the tautological line there, equivariantly for monodromy.
  Call a complex simple factor #emph[visible] if it acts nontrivially on $J$.
    Retain every rational simple adjoint factor containing a visible factor.
    This collection is invariant under the possibly disconnected monodromy group.
    On its Lie algebra we obtain the variation $bb(A)$; its monodromy is contained in the automorphisms of a
    lattice and is discrete. Notice that an entire rational factor is kept.
    Projection to only one real factor would not ensure discreteness.
  We now recover the line from this adjoint system. Choose a positive integer $N$ for which the highest weight $N
    lambda$ of $W$ belongs to the root lattice. The Cartan component $W_N subset
    W^(⊗ N)$ is generated by the orbit of $ell^(⊗ N)$. It factors through the connected adjoint group,
    and its highest Hodge line is $ell^(⊗ N)$. The same orbit-span argument just used shows that $W_N$ is a Hodge
    subvariation.
  We must also account for disconnected monodromy before applying tensor generation.
    Deck transformations take the lifted line to another point of the same connected orbit,
    so they preserve $W$ and its Cartan components. The kernel of the action on the retained adjoint factors
    centralizes the $G$-action on $W$, and hence acts scalarly by irreducibility.
    Its connected part is semisimple and has no nontrivial scalar character. Its component group is finite.
    Increasing $N$ therefore kills the entire kernel action on $W_N$.
    Consequently $W_N$ is a representation of the full projected algebraic monodromy group,
    not just of its identity component. This step rules out a discarded nontorsion scalar local system.
  The adjoint representation of that projected group is faithful and self-dual.
    By tensor generation and complete reducibility, $W_N$ embeds as a flat direct summand in a tensor construction
    $bb(T) \( bb(A) \)_(upright(bold(C)))$; see #cite(label("MilneAlgebraicGroups")) Theorem 4.14.
    To make the embedding compatible with Hodge structures, apply the theorem of the fixed part to
  $ H^0 #scale(x: 120%, y: 120%)[\(] B^compose \, cal(H) o m \( W_N \, bb(T) \( bb(A) \)_(upright(bold(C))) \)
    #scale(x: 120%, y: 120%)[\)] . $
  This nonzero space of flat maps has a constant complex Hodge structure.
    A nonzero Hodge-homogeneous component of any nonzero flat map is still flat.
    Its kernel is $G$-invariant, so the map is injective because $W_N$ is irreducible.
    A constant one-dimensional complex Hodge shift makes it a morphism of variations;
    that shift changes neither the underlying holomorphic line nor its boundary extension.
    This is the constituent and fixed-part argument of #cite(label("BakkerMatsushita")) Theorem 3.
  The complex summand carries a flat Hermitian polarization.
    In a real tensor variation of weight $w$ polarized by $Q$,
    it is induced by $i^w Q_(upright(bold(C))) \( v \, macron(u) \)$, up to the conventional overall sign.
    Its restriction to a Hodge subvariation is nondegenerate because it is definite with the prescribed sign on
    each Hodge component. There is no need for the real bilinear form itself to restrict nondegenerately to the
    chosen complex summand: it may pair that summand with its conjugate.
  Finally, on a factor-preserving finite cover an irreducible representation is a tensor product over the simple
    factors. The dimension of its highest step is the product of the corresponding dimensions.
    Since that dimension is one, each factor has a unique rank-one highest step.
    This gives the asserted factor lines. Their extensions are nef and functorial by Lemma 4.1, Lemma 4.2. ◻
]

#thm([Lemma 4.4.])[
  (Generic stabilizers of adjoint periods).  #emph[Let $G$ be a connected semisimple adjoint group over
    $upright(bold(Q))$, and let $bb(A)_(upright(bold(Q)))$ be a rationally polarized integral variation whose
    fiber is $frak(g)_(upright(bold(Q))) = "Lie" \( G \)$ and whose connected algebraic monodromy is $G$,
    acting by its adjoint representation. No nonidentity rational Lie algebra automorphism of
    $frak(g)_(upright(bold(Q)))$ fixes all generic lifted periods of $bb(A)$.
    The automorphism need not belong to the monodromy group.]
] <period:stabilizer>

#proof[
  Suppose $gamma$ fixes those periods. By equivariance, every monodromy conjugate of $gamma$ is everywhere of
    Hodge type $\( 0 \, 0 \)$ in the endomorphism variation. Their rational span is therefore a rational
    subvariation of type $\( 0 \, 0 \)$. Its induced polarization is positive definite.
    Intersection with the endomorphism lattice is a full monodromy-invariant lattice:
    clear one denominator of $gamma$; integral monodromy conjugation preserves that denominator.
    A positive definite integral monodromy group is finite. Consequently the connected group $G$ fixes $gamma$,
    so $gamma$ centralizes every inner automorphism of $frak(g)$.
    The centralizer of the inner group in $"Aut" \( frak(g) \)$ is trivial:
    on each simple ideal commutation with all adjoint operators makes an endomorphism scalar,
    and compatibility with the Lie bracket makes this scalar one;
    permutations of distinct ideals do not commute with their separate inner actions. Thus $gamma = 1$. ◻
]

=== 4.3 A projective quotient for the retained periods <a-projective-quotient-for-the-retained-periods>

We now quotient by connected fibers of the retained full period map.
  The preceding reduction supplies both discrete integral monodromy and a tensor description of a power of the
  line. The first property allows us to compactify the quotient;
  the second will descend the line with its exact parabolic extension.
  No bigness assertion about $K_S + a P$ is used in this construction.

#thm([Proposition 4.5.])[
  (The projective period quotient).  #emph[In 14, after modifications there is a map $p : B' arrow.r
    S$ with connected fibers to a smooth projective variety and a nef rational line $P$ with $tau^(*) L =
    p^(*) P$. On a dense open subset $S^compose$, the retained adjoint variation of 20 descends,
    has the same connected algebraic monodromy, and has a generically immersive period map.
    The line $P$ is its parabolically extended highest-weight line, up to the positive scaling already described.
    If the retained collection is empty, $L$ is rationally trivial and $S$ may be a point.]
] <period:quotient>

The construction uses the compact-period-quotient approach of #cite(label("BakkerBrunebarbeTsimerman"))
  Theorems 7.6–7.7, whose compactification input goes back to #cite(label("SommesePeriodMapping")) Proposition III
  and Remark III-C. We use the precise class-$cal(C)$ formulation of #cite(label("VilladsenHodgeKahler"))
  Theorem 2.19 below.

#proof[
  Choose a compact Kähler modification of the class-$cal(C)$ source.
    Then pass to a finite level at which the projected monodromy is neat and preserves the factors.
    Finite covers of the open locus extend to finite ramified covers of compactifications and then to Kähler
    resolutions; see #cite(label("VilladsenHodgeKahler")) Lemma 2.21.
    Resolve the boundary to simple normal crossings. Extend the period map over all finite-local-monodromy strata.
    At neat level their monodromy is trivial and the nilpotent orbit theorem gives this extension.
  The extended period map on this locus is proper; see #cite(label("GriffithsPeriodsIII")) Proposition 9.11 and
    the proof of Theorem 9.6. Indeed, if a sequence tending to the boundary has period images in a compact subset
    of the quotient, translate period lifts into a compact set.
    The punctured-disk Schwarz estimate makes the displacement of each vanishing-coordinate monodromy tend to
    zero. The discrete group acts properly, since its isotropy in the real period domain is compact.
    The local monodromies must therefore be trivial at neat level, so such a sequence cannot escape the extended locus.
  Take the Stein factorization of this proper map. Its first map has compact connected fibers and its base is
    finite over the period image. It extends after modifications to a map of compact class-$cal(C)$ spaces with
    Kähler resolutions by #cite(label("VilladsenHodgeKahler")) Theorem 2.19 (version 1).
    That theorem applies to proper connected-fiber maps from Zariski open subsets of compact class-$cal(C)$
    spaces. In terms of cycles, one first flattens the proper map,
    sends its irreducible general fibers to a component of the Douady space of the compact source,
    and takes the closure of that family. The component is compact and in class $cal(C)$.
    Near a general fiber the map to the cycle space is an open embedding,
    since an irreducible compact cycle of the same dimension in a sufficiently small neighborhood maps to a
    compact analytic subset of a small Stein neighborhood in the base, hence to a point,
    and must be the whole irreducible fiber. The incidence map is consequently a modification of the source.
    This produces the required compact quotient and also shows its uniqueness as the quotient by the connected
    general period fibers.
  On a dense open subset of this quotient the period and its integral variation descend.
    At neat level a constant period has trivial stabilizer; local slices to the connected-fiber map give the
    descent data. After shrinking to a proper smooth fibration, the map on fundamental groups is surjective,
    so the descended variation has the same connected algebraic monodromy.
    Its period differential is generically injective by construction.
    On a Kähler compactification its Griffiths line is big by 18; equivalently,
    one can apply #cite(label("BrunebarbeCadorel")) Corollary 1.3.
    The quotient therefore has a smooth projective model. This is also the argument in
    #cite(label("VilladsenHodgeKahler")) proof of Corollary 2.22.
  The finite deck group acts on the connected-period-fiber quotient. Take its finite quotient and resolve.
    This again has a smooth projective model. A general fiber before this finite quotient is the union of
    connected level fibers indexed by one deck-group orbit. The group acts transitively on these fibers,
    so the quotient is the continuous image of any one of them and is connected.
    Thus the induced map from the original source has connected general fibers,
    hence connected fibers after its Stein factorization. The latter does not change its function field.
    All maps can be resolved using modifications of the original source and of this projective model.
  There is an actual adjoint variation on a dense Zariski open subset of the quotient before changing level.
    Write $Gamma'$ for the normal level subgroup of $Gamma$. The induced action of $Gamma \/
    Gamma'$ on the level quotient is faithful. Indeed, if $delta in Gamma$ acts trivially there,
    discreteness shows locally that its action on lifted periods agrees with a fixed $eta in Gamma'$.
    Then $eta^(- 1) delta$ fixes a period germ, hence the whole generic lifted period image by analytic
    continuation. By 21 it is the identity, so $delta in Gamma'$.
    Resolve the finite group action equivariantly and remove its proper algebraic fixed loci and the branch locus.
    On the resulting dense Zariski open subset the level quotient is free and unramified.
    Its equivariant integral adjoint local system and Hodge filtration descend there.
    In particular, this descent uses an open subset, not merely very general points.
  The highest-weight construction in 20 gives a line on that open subset whose pullback is a fixed positive power
    of $L$. Take its parabolic extension on a log smooth projective compactification $S$ and divide by that power
    to obtain $P$. Nefness follows from 18. Pullback of the unipotent extensions, followed by rational descent,
    gives $tau^(*) L = p^(*) P$ on the compact models, including the boundary.
    Equivalently, this can be checked at level and then descended by the norm:
    a line whose finite pullback is trivial is torsion in the rational Picard group.
    The identity therefore includes the boundary and persists under further modifications.
  If no factor is retained, the orbit is a point and the only possible scalar monodromy is the finite scalar group
    treated in 20. Its parabolic line is rationally trivial, as asserted. ◻
]

=== 4.4 Loss of numerical rank on the marked boundary <loss-of-numerical-rank-on-the-marked-boundary>

Fix the projective quotient of 22 and a log smooth compactification $\( S \, E \)$ of its descended variation.
  Let $D lt.eq E$ be the reduced sum of components with nonidentity local monodromy on the retained adjoint
  system, including finite monodromy. Logarithmic general type will give bigness of $K_S + D$.
  The next lemma is what permits us to remove $D$.

#thm([Lemma 4.6.])[
  (Strict loss of rank at the marked boundary).  #emph[For every component $D_i$ of $D$,
#[#set math.equation(numbering: n => "(4.4)")
 $ nu \( P \|_(D_i) \) < nu \( P \) . $ <period:strictdrop>]

]
] <period:rankloss>

#proof[
  Write $n = dim S$ and $r = nu \( P \)$, the generic rank of the line map $j$ by 18.
    The full retained period map has rank $n$; the argument does not require $r = n$.
    Work first on a finite Galois cover of the open locus with connected algebraic monodromy and no factor
    permutations. Its connected adjoint group is denoted by $G$.
  #emph[The Ax–Schanuel decomposition.] Choose a Hodge-generic point,
    also general for the ranks of the factor period maps and their joint differentials.
    There are only finitely many rational normal-factor decompositions of $G$,
    so these requirements can be imposed simultaneously. Let $T$ be a local fiber germ of $j$ there,
    and $Z$ its irreducible Zariski closure in the source of the variation. Thus $dim T = n - r$.
    Move within the germ to a smooth point of $Z$ and use a smooth open subset of a resolution when applying Hodge
    theory.
  The restricted variation on $Z$ has the same generic Mumford–Tate group as the ambient variation,
    since $Z$ contains the chosen Hodge-generic point. The monodromy normality theorem therefore makes its
    connected monodromy $H$ normal in $G$; see #cite(label("AndreMonodromy")) §5, Theorem 1. In adjoint notation write
  $ G = H times Q . $
  The $Q$-period is constant on the lifted $Z$, by the fixed-part theorem after killing finite monodromy.
    The varying monodromy domain on $Z$ is therefore the domain for $H$.
    Write $J_H$ for its line-orbit projection and $d_H = dim J_H$.
    In local flat coordinates write $j = \( j_H \, j_Q \)$, with targets $J_H$ and $J_Q$,
    the products of line orbits for the two groups. We will show that the $H$-line map has full rank $d_H$ on $Z$,
    whereas the $Q$-line map and the full $Q$-period map have equal generic rank on the ambient base.
  For the first assertion, put $m = dim Z$ and $d = dim caron(cal(D))_H$,
    where $caron(cal(D))_H$ is the compact dual of the connected-monodromy period domain.
    The projection $caron(cal(D))_H arrow.r J_H$ is a surjective morphism of homogeneous projective flag
    varieties. All its fibers have dimension $d - d_H$. Let $V subset Z times
    caron(cal(D))_H$ be the algebraic locus where the projected line equals its value on $T$.
    It follows that $dim V = m + d - d_H$. The period graph has dimension $m$ in an ambient variety of dimension
    $m + d$, so its expected intersection dimension with $V$ is $m - d_H$.
  By #cite(label("BakkerTsimermanAxSchanuel")) Theorem 1.1,
    an intersection component of larger dimension projects into a proper algebraic weak Mumford–Tate subvariety of
    $Z$. This is impossible for the component containing the lifted period graph over $T$,
    since $T$ is Zariski dense in $Z$. Conversely, a map to $J_H$ has fibers of dimension at least $m - d_H$.
    At the chosen smooth point the restricted fiber is exactly $T$,
    because the ambient local fiber is $T subset Z$. Equality follows, proving the claim.
    The cited theorem applies to the rationally polarized integral adjoint variation on a smooth algebraic base
    and uses precisely its connected-monodromy domain.
  Let $q$ denote the full $Q$-period map and set $s_Q = "rank" \( d q \)$.
    Choose the smooth point $x in T ∩ Z_(upright("reg"))$ inside the ambient constant-rank neighborhood fixed
    above. Since $T$ is Zariski dense in $Z$, such a point exists.
    The constant-rank theorem gives $ker \( d j_x \) = T_x T subset T_x Z$, and hence
  $ "rank" \( d j_x \|_(T_x Z) \) = dim Z - dim T = d_H . $
  The $Q$-period is constant on $Z$, so $T_x Z subset.eq ker \( d q_x \)$. Thus, at this same point,
  $ ker \( d j \) subset.eq ker \( d q \) \, wide d j_H \( ker \( d q_x \) \) = T_(j_H \( x \)) J_H . $
  The first inclusion uses $T_x T subset T_x Z$; the second is the just-established rank calculation on $T_x Z$.
    The differential $d j_Q$ factors through $d q$. If $d j_Q \( v \) = 0$,
    choose $w in ker \( d q \)$ with $d j_H \( w \) = d j_H \( v \)$.
    Then $v - w in ker \( d j \)$, and therefore $d q \( v \) = 0$. We conclude
  #[#set math.equation(numbering: n => "(4.5)")
   $ "rank" \( d j_Q \) = s_Q \, wide r = d_H + s_Q . $ <period:rankdecomposition>]
  These are generic identities by our choice of the point.
  The factor-line construction, after a common positive rescaling and a further finite cover, now gives nef lines with
  #[#set math.equation(numbering: n => "(4.6)")
   $ pi^(*) P = P_H + P_Q \, wide nu \( P_H \) = d_H \, wide P_Q = q^(*) B_Q . $ <period:linedecomposition>]
  Here $q : tilde(S) arrow.r S_Q$ is a resolved projective quotient for the full $Q$-period, constructed by 22,
    and $dim S_Q = s_Q$. The highest-line rank on $S_Q$ is $s_Q$ by (4.5).
    Only the quotient construction, not adjoint positivity, has been used to construct $S_Q$.
  #emph[Reduction for a boundary component.] For a fixed marked $D_i$,
    use a common finite Galois cover that preserves the factors and makes boundary monodromy unipotent.
    Resolve it and the map $q$ equivariantly, and let $E_i$ be the strict transform of a component above $D_i$
    that is generically finite over $D_i$. The inertia group at its generic point fixes $E_i$ pointwise.
    Further rescaling does not change any numerical dimension. Nefness gives
  $ nu \( P_H \|_(E_i) \) lt.eq d_H . $
  For example, every intersection involving $E_i$ is bounded by the corresponding intersection with a sufficiently
    ample effective divisor; the vanishing of higher powers of $P_H$ then gives this inequality.
    If $E_i$ does not dominate $S_Q$,
  $ nu \( P_Q \|_(E_i) \) lt.eq s_Q - 1 \, $
  and the binomial expansion for the two nef lines in (4.6) proves the strict drop.
    We may therefore suppose $E_i$ dominates $S_Q$. At its generic point the $Q$-variation is pulled back from the
    interior of $S_Q$, so its local unipotent logarithm vanishes.
  #emph[Infinite local monodromy.] If the original local monodromy is infinite,
    its logarithm at unipotent level is a nonzero rational element $N in frak(h)$.
    Every nonzero rational element of a rational simple factor has nonzero projection to every conjugate complex
    factor. Each retained rational factor has a visible complex factor. Hence $N$ acts nontrivially on $J_H$.
  Let $w$ be the pure weight of the representation supplying $P_H$, and let $F^a =
    upright(bold(C)) v$ be its limiting highest line at a general point of $E_i$.
    This line has a unique weight contribution, say of weight $w + k$. It is primitive and $k gt.eq 0$:
    a nonprimitive contribution, or a contribution below the middle weight,
    would come by monodromy Lefschetz from a nonzero filtration piece above $F^a$. Moreover
  #[#set math.equation(numbering: n => "(4.7)")
   $ N^(k + 1) v = 0 \, wide N^k v eq.not 0 . $ <period:nilpotenttop>]
  To see that this statement holds for the actual vector rather than only its weight-graded image,
    use the Deligne splitting of the limiting mixed Hodge structure.
    The one-dimensional highest step occupies a single summand,
    and $N$ has degree $\( - 1 \, - 1 \)$ for this functorial splitting.
    Primitive vanishing on the graded piece therefore gives the first equality in (4.7);
    the Lefschetz isomorphism gives the second. For a complex summand the same argument is made in its
    conjugate-paired real variation and restricted to the summand.
  In nilpotent-orbit coordinates $\[ v \] in J_H$. Since this orbit is closed in projective space and invariant
    under $exp \( t N \)$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ \[ N^k v \] = lim_(t arrow.r oo) exp \( t N \) \[ v \] in J_H ∩ bb(P) \( ker N \) . $ <period:fixedlocus>]
  This fixed locus is a proper closed subset of the irreducible variety $J_H$,
    because $N$ acts nontrivially on it. Its dimension is less than $d_H$.
    Restrict to a simply connected open part of the boundary stratum on which $k$ is constant.
    In a flat trivialization, both $N$ and $W \( N \)$ are constant.
    Project $N^k v$ to $"Gr"_(w - k)^(W \( N \))$ and apply the inverse of the fixed Lefschetz isomorphism
  $ N^k : "Gr"_(w + k)^(W \( N \)) arrow.r "Gr"_(w - k)^(W \( N \)) . $
  This recovers the weight-graded limiting highest line. Every actual vector $N^k v$ lies in $W \( N \)_(w - k)$,
    and its image in that graded piece is nonzero. Thus the graded line map factors through the rational map on
  $ J_H ∩ bb(P) \( ker N \) ∩ bb(P) \( W \( N \)_(w - k) \) $
  induced by this fixed linear quotient and inverse. This locus is contained in the proper fixed locus in (4.8),
    and the rational map is defined at every point under consideration. Its rank is less than $d_H$. By 19,
  $ nu \( P_H \|_(E_i) \) < d_H . $
  Together with $nu \( P_Q \|_(E_i) \) lt.eq s_Q$ this proves the required inequality in the infinite-monodromy case.
  #emph[Finite nonidentity local monodromy.] Let $gamma$ be the original finite local monodromy.
    The disconnected-monodromy argument in 20 shows that $gamma$ preserves the orbit span $W$.
    It therefore acts on the highest-line orbit $J$, permuting its nontrivial simple-factor flag varieties.
    Equivariance preserves the kernel of $G_(upright(bold(C))) arrow.r "Aut" \( J \)$,
    which is the product of the invisible simple factors. Thus visible and invisible factors cannot be exchanged.
    At unipotent level its logarithm is zero, so the variation extends with pure limiting flags.
    The inertia generator fixes the generic boundary point; equivariance therefore makes these flags fixed by
    $gamma$. Suppose that the boundary line retained rank $r = d_H + s_Q$.
    Since $E_i$ dominates $S_Q$, its full $Q$-period and its $Q$-line map both have rank $s_Q$.
    Along a generic fiber of this $Q$-period, the $H$-line map must consequently have rank $d_H$.
    Its coordinates fill an open subset of $J_H$ while the full $Q$-flags remain fixed.
  The fixed-point condition for $gamma$ rules out permutations involving any visible $H$-factor,
    including a permutation with a factor whose coordinate is held fixed.
    On each visible $H$-factor of the highest-line orbit it forces the identity action.
    The action of a simple adjoint group on a nontrivial flag variety is faithful;
    equivariance then makes the induced automorphism of that simple group the identity as well.
    Rationality forces the same conclusion on all conjugate factors.
    Thus $gamma$ acts identically on $H$ and preserves $Q$.
  Its $Q$-action fixes every generic $Q$-period, by the domination of $S_Q$ and analytic continuation from the
    resulting open set of lifted periods. Apply 21 to the descended $Q$-variation. This action is the identity.
    Hence $gamma$ is the identity on the whole retained adjoint system, contradicting the marking.
  In both cases nef binomial expansion and (4.5) give $nu \( pi^(*) P \|_(E_i) \) < r$.
    Numerical dimension of a nef line is unchanged by a generically finite pullback, so this is (4.4).
    If $r = 0$, the local line fiber is the whole source germ, so its Zariski closure is the whole source and $H =
    G$, $Q = 1$. The Ax–Schanuel calculation gives $d_H = 0$.
    Every retained rational factor contains a factor acting nontrivially on the line orbit;
    hence there can be no retained factor. Generic immersivity of the full retained period map then forces $S$ to
    be a point, with no marked component. ◻
]

=== 4.5 Removing a boundary by counting sections <removing-a-boundary-by-counting-sections>

The period argument must pass from a big logarithmic canonical divisor to a big adjoint divisor without its
  boundary. The following lemma isolates the last step: sections lost on the boundary grow more slowly in the nef
  direction than sections on the whole space. For a nef rational divisor $J$ on a smooth projective $n$-fold, set

$ nu \( J \) = max { q in { 0 \, dots.h \, n } : J^q dot.op H^(n - q) > 0 } \, $

where $H$ is ample. This is independent of $H$ and equals zero on a point.
  The proof below fixes the nef coefficient before taking the asymptotic section limit.

#thm([Lemma 4.7.])[
  #emph[Let $Z$ be a smooth projective variety, $J$ a nef rational divisor, $A$ a rational divisor, and $D =
    sum_(i = 1)^s d_i E_i$ an effective rational divisor with smooth prime components. Suppose $A + D$ is big and
$ nu \( J \|_(E_i) \) < r := nu \( J \) quad upright("for every component of ") D . $

 Then $A + t J$ is big for every sufficiently large rational $t$.]
] <period:subtract>

#proof[
  If $r = 0$, the condition forces $D = 0$, so $A$ is already big; adding a nef divisor preserves bigness.
    This also covers dimension zero with the usual convention. Assume $r > 0$ and put $n = dim Z$.
    Choose an ample rational divisor $H_1$ with $A + D - H_1$ rationally effective.
    For fixed rational $t gt.eq 0$ and sufficiently divisible $m$,
  $ h^0 \( Z \, m \( A + D + t J \) \) gt.eq h^0 \( Z \, m \( H_1 + t J \) \) . $
  Since $H_1 + t J$ is ample, asymptotic Riemann–Roch makes the leading coefficient on the right
    $\( H_1 + t J \)^n \/ n !$. As a polynomial in $t$, this intersection has degree $r$ and positive leading
    coefficient.
  Remove $m D$ one component at a time by divisor exact sequences.
    Every lost quotient is a line bundle on an $E_i$ of the form
  $ cal(O)_(E_i) (m \( A + D + t J \) - sum_h k_h E_h) \, wide 0 lt.eq k_h lt.eq m d_h . $
  Choose an ample integral divisor $B_0$ so large that a fixed denominator-clearing multiple of $B_0 - A -
    D$ is globally generated. For each $h$, choose an ample integral divisor $B_h$ such that both $B_h$ and $B_h +
    E_h$ are globally generated. Put $H_2 = B_0 + sum_h d_h B_h$.
    The difference between $m \( H_2 + t J \)$ and the displayed quotient divisor is
  $ m \( B_0 - A - D \) + sum_h #scale(x: 120%, y: 120%)[\(] \( m d_h - k_h \) B_h +
    k_h \( B_h + E_h \) #scale(x: 120%, y: 120%)[\)] . $
  It is globally generated in these divisible degrees. A section not vanishing identically on $E_i$ gives an
    injection into $cal(O)_(E_i) \( m \( H_2 + t J \) \|_(E_i) \)$.
    There are exactly $m d_i$ quotient terms on $E_i$. Hence
  $ h^0 \( Z \, m \( A + t J \) \) gt.eq h^0 \( Z \, m \( H_1 + t J \) \) -
    m sum_i d_i h^0 \( E_i \, m \( H_2 + t J \) \|_(E_i) \) . $
  For each fixed $t$, divide by $m^n \/ n !$ and let $m$ tend to infinity through the specified multiples.
    All the comparison divisors are ample, so the resulting lower bound is
  $ \( H_1 + t J \)^n - n sum_i d_i \( H_2 + t J \)^(n - 1) dot.op E_i . $
  Each restriction polynomial has degree at most $nu \( J \|_(E_i) \) lt.eq r - 1$,
    because the restricted divisor is nef. The positive degree-$r$ term of the first polynomial therefore
    dominates the loss for every sufficiently large $t$. The section growth of $A +
    t J$ is then positive in dimension $n$, which is exactly bigness. ◻
]

Taking $A = K_Z$ and $D$ reduced gives the required removal of the period boundary once its restriction ranks have
  been established. The weights also allow simultaneous removal of other effective divisors satisfying the same
  rank inequality, for example a divisorial ramification term on a generically finite cover.

#proof[
  Apply 22. If its target is a point there is nothing further to prove. Otherwise mark the divisor $D$ as above.
    The adjoint variation extends across every unmarked boundary component,
    including their intersections away from $D$, because its local monodromies there are trivial.
    Its period differential is generically injective. Consequently #cite(label("BrunebarbeCadorel")) Theorem 1.1 gives
  $ K_S + D upright(" big") . $
  If an initial choice omitted codimension-two loci, apply the theorem on a log resolution and push the sections
    down; the resulting logarithmic canonical divisor pushes forward to $K_S + D$.
    By 23, each marked component has strictly smaller numerical rank.
    Apply 24 with $A = K_S$ and the marked reduced divisor $D$. It gives $K_S + a P$ big.
    Together with the rational line identity in 22, this proves (3.1).
    Since $P$ is nef, the same bigness holds for every larger rational coefficient $a$. ◻
]

== 5 Addition with a log-general-type fiber <generaltype:section>

We prove subadditivity when the fiber is of log general type. The base may be nonprojective:
  the projective positivity theorem will be applied to a stable family over the image of its classifying map.

We prove 15.

The proof constructs finitely many relative pluricanonical forms whose ratios give a generically finite map on a
  general fiber. Their poles must be controlled at every vertical divisor,
  including divisors whose image on the original base has codimension at least two.
  Multiplying these forms by base pluricanonical sections then retains both the fiber coordinates and the base
  Iitaka coordinates.

We first construct a projective stable family over the image of a classifying map.
  Positivity is applied to that family. Its sections are pulled back, descended through a finite cover,
  and tested at vertical valuations. All degrees below clear the denominators of the relevant divisors.

=== 5.1 Comparison with a stable family <comparison-with-a-stable-family>

We use the stable-family convention of #cite(label("KovacsPatakfalvi")) Notation 3.7, Remark 3.8,
  and Definitions 3.9 and 3.11. A stable pair has semi-log-canonical singularities and an ample rational log
  canonical divisor. A stable family over a normal base is flat,
  proper and surjective with connected stable fibers; its boundary support avoids the generic points and the
  codimension-one singular points of every fiber. Its relative log canonical divisor is rational Cartier and
  relatively ample, so the family is projective. Boundaries are pulled back by divisorial restriction,
  and Cartier multiples of the relative log canonical divisor commute with base change between normal bases.
  Semi-log-canonicity allows nonnormal fibers and tests log canonicity on the normalization with the conductor
  boundary. The general fibers in our application are additionally Kawamata log terminal (klt):
  they are normal and all their log discrepancies are positive.
  This extra condition will be checked before applying positivity.
  A stable family has #emph[maximal variation] when its classifying map to the moduli space of stable pairs is
  generically finite onto its image.

Fiberwise finite generation gives an embedding degree separately on each fiber.
  The next lemma selects one degree on an analytic base. As throughout,
  #emph[very general] excludes a countable union of proper closed analytic subsets.

#thm([Lemma 5.1.])[
  #emph[Let $Y$ be an irreducible compact complex space. For each positive integer $j$, suppose that $q_j :
    Q_j arrow.r Y$ is a proper surjective map from an irreducible compact complex space and that,
    over a dense analytic open $U_j subset Y$, its fibers are irreducible of a fixed dimension $r_j$. Let
$ phi.alt_j : Q_j arrow.r.dashed Z_j $

 be a meromorphic map with irreducible projective image $Z_j$.
   Suppose that a dense open part of $q_j^(- 1) \( U_j \)$, called the genuine frame locus,
   meets every fiber densely and that $phi.alt_j$ is holomorphic there.
   Let $G_j subset Z_j$ be a countable union of algebraically constructible subsets.]
  #emph[Let $Lambda_j subset U_j$ be sets whose union contains a very general subset of $Y$,
    such that for $y in Lambda_j$ all genuine frames above $y$ map into $G_j$.
    Then some $Lambda_j$ is not contained in a countable union of proper closed analytic subsets of $Y$,
    and for that index one of the constructible subsets making up $G_j$ is dense in $Z_j$.
    In particular $G_j$ contains a nonempty algebraic open subset of $Z_j$.]
] <generaltype:selection>

#proof[
  Some $Lambda_j$ is not contained in a countable union of proper closed analytic subsets;
    otherwise their union would be so contained. Resolve the graph of $phi.alt_j$ and shrink $U_j$, if necessary.
    This discards only a proper analytic subset of $Y$ and preserves the stated properties of the general fibers.
    Write $G_j = union.big_i G_(j i)$. If no $G_(j i)$ is dense, the inverse images
  $ E_(j i) = phi.alt_j^(- 1) \( overline(G_(j i)) \) $
  are proper closed analytic subsets of the resolved $Q_j$.
    For $y in Lambda_j$, the genuine frame fiber is covered by these subsets.
    Baire’s theorem implies that one $E_(j i)$ contains a relatively open part of the fiber.
    Irreducibility then implies that $E_(j i)$ contains the whole compact fiber.
  The locus
  $ A_(j i) = { y in U_j : dim \( E_(j i) ∩ q_j^(- 1) \( y \) \) gt.eq r_j } $
  is analytic, by the fiber-dimension theorem for proper maps. It is proper:
    otherwise $E_(j i)$ would contain the general fibers and hence all of $Q_j$.
    The same theorem before restriction to $U_j$ shows that $A_(j i)$, together with $Y \\ U_j$,
    is contained in a proper closed analytic subset of $Y$. This would place $Lambda_j$ in countably many proper
    closed analytic subsets, a contradiction. Finally, a dense constructible subset of an irreducible algebraic
    variety contains a nonempty open subset. ◻
]

#thm([Lemma 5.2.])[
  (Analytic comparison with a stable family).  #emph[Let $h : V arrow.r
    Y$ be a surjective holomorphic map with connected fibers,
    where $V$ is a smooth compact Kähler manifold and $Y$ is a smooth compact manifold in class $cal(C)$.
    Let $A$ be an effective rational SNC divisor on $V$, horizontal over $Y$,
    with coefficients strictly less than one. Suppose $K_F + A_F$ is big on very general fibers $F$ of positive
    dimension. There are]
  + #emph[a proper generically finite map $tau : Y' arrow.r Y$, with $Y'$ smooth, compact, and in class $cal(C)$;]
  + #emph[a surjective holomorphic map $rho : Y' arrow.r R$, with $R$ smooth and projective;]
  + #emph[a projective stable family $pi : \( cal(V) \, cal(A) \) arrow.r R$ of maximal variation,
    with klt general fiber;]
  #emph[such that the main component of $V times_Y Y'$ is bimeromorphic over $Y'$ to $cal(V) times_R Y'$.
    Over a dense analytic open, this meromorphic comparison is the fiberwise log canonical model map for $K_F +
    A_F$, with the horizontal pushforward of $A$ as boundary. The space $R$ may be a point.]
] <generaltype:stable-comparison>

#proof[
  The construction has three outputs. Relative pluricanonical images produce algebraic parameter data even though
    the base is analytic. A classifying map then supplies a projective stable family after a finite base cover.
    Finally, an isomorphism cover matches that family with the relative image;
    fiberwise canonical models determine the horizontal discrepancy signs.
  #emph[Relative images and frames.] Set $cal(L) = cal(O)_V \( K_(V \/ Y) + A \)$,
    understood as a rational line bundle. For the factorial multiples $m$ clearing its denominator, the sheaves
  $ cal(E)_m = h_(*) cal(L)^(⊗ m) $
  are coherent. First restrict to a dense analytic open where $h$ and the horizontal boundary strata are smooth,
    so the proper family and its line bundles are flat over the base.
    Generic constancy of the fiber section dimension and cohomology and base change then identify the fibers of
    $cal(E)_m$ with the complete systems, separately for each $m$; see #cite(label("GrauertDirectImages")) §7,
    nos. 4–6, Sätze 3–5 and its corrigendum #cite(label("GrauertDirectImagesCorr")).
    After a modification of $Y$, the strict transform of $cal(E)_m$, modulo torsion, is locally free.
    The evaluation map gives a relative meromorphic map into its projective bundle.
    Resolve this map and take its proper analytic image $cal(Z)_m$.
    We also take the proper images of the horizontal boundary components and retain their divisorial cycle parts.
    Analytic flattening makes these embedded image and cycle data flat on a dense analytic open,
    with fixed Hilbert and cycle polynomials. These uses of coherent direct images and analytic flattening are
    independent of any minimal-model theorem; see #cite(label("HironakaFlattening")).
  Write $s_m = "rank" cal(E)_m$ on this open; indices with $s_m = 0$ are omitted.
    Its projective frame bundle has a natural compactification
  $ overline(Q)_m = bb(P) #h(-0.16667em) ("Hom" \( cal(O)_Y^(thin s_m) \, cal(E)_m \)) . $
  Here $Y$ denotes the modification chosen for this degree;
    its map to the original base remains proper and bimeromorphic.
    The locus of invertible matrices modulo scalars is a principal $"PGL" \( s_m \)$-bundle.
    A genuine frame embeds the corresponding fiber of $cal(Z)_m$ in a fixed $bb(P)^(s_m - 1)$.
    There is therefore a holomorphic Hilbert–Chow parameter map on the genuine frame locus.
    The Hilbert spaces here are the algebraic Hilbert schemes of projective space, viewed analytically;
    equivalently one may use their Douady realization #cite(label("Douady")).
  To extend this map meromorphically, use the existing compact relative image and the projective linear action in
    local trivializations. The graph of that action extends over the projective matrix space:
    inversion is given by the adjugate matrix. Apply this construction to the proper family $cal(Z)_m$ and its
    marked cycles, take proper analytic images, and flatten by strict transform.
    One obtains a proper flat family of embedded subspaces over a modification of $overline(Q)_m$.
    Its Hilbert–Chow map is holomorphic. The local graph constructions agree on the genuine frames and hence glue.
    Thus the original parameter map is meromorphic. After resolving it,
    its image is compact analytic in a fixed projective Hilbert–Chow space, and is consequently algebraic.
    Denote the irreducible image by $Z_m$. This construction uses a frame bundle,
    not a meromorphic trivialization of $cal(E)_m$.
  #emph[The good parameter locus.] In $Z_m$, call an embedded pair $\( Z \, D \)$ good if it is klt and stable,
    has the prescribed boundary weights, has a complete nondegenerate embedding, and satisfies
  #[#set math.equation(numbering: n => "(5.1)")
   $ cal(O)_Z \( 1 \) tilde.eq cal(O)_Z #scale(x: 120%, y: 120%)[\(] m \( K_Z + D \)
     #scale(x: 120%, y: 120%)[\)] . $ <generaltype:embedded-adjoint>]
  One may also impose the generic Hilbert and marking data.
    This is a countable union of algebraically constructible loci. Here is the parameter-space justification.
    Stratify the universal embedded families by their Hilbert polynomials, Cartier indices, and base-change loci.
    On each such stratum, (5.1) can be imposed by parameterizing the map
  $ omega_Z^(\[ m \]) arrow.r cal(O)_Z \( 1 \) $
  with its prescribed divisor. These parameter spaces are of finite type.
    The stable-pair and klt conditions are constructible there,
    and their images are constructible by Chevalley’s theorem.
    This is the embedded construction used for stable log-variety moduli in #cite(label("KovacsPatakfalvi"))
    Section 6.A, especially Propositions 6.8 and 6.11 and Lemma 6.12.
    In particular no assertion about analytic minimal models is hidden in the good locus.
  Every very general fiber is projective: bigness makes it Moishezon, and it is Kähler.
    We use Moishezon’s projectivity criterion, which is also the smooth case of
    #cite(label("NamikawaProjectivity")) Theorem 6. The projective klt finite-generation theorem
    #cite(label("BCHM")) Theorem 1.1 and its consequences therefore gives its log canonical model.
    Every sufficiently large divisible pluricanonical degree embeds that model and satisfies (5.1).
    Exclude at once the countably many generic base-change loci, relative-rank loci,
    and generic-degree loci for the maps constructed above. Let $Lambda_m$ consist of the remaining parameters for
    which the degree-$m$ map actually constructs the fiber’s log canonical model.
    Their union contains a very general subset of $Y$, and all genuine frames over a point of $Lambda_m$ give good
    data. Apply 25. We obtain one fixed $m$ for which $Lambda_m$ is not contained in a countable union of proper
    analytic subsets and good data hold on an algebraic open of $Z_m$.
  For this degree the relative image map is generically birational.
    Indeed its generic finite degree agrees with its fiberwise degree outside the generic-degree exceptional set
    already excluded. Choose a point of $Lambda_m$ there; that degree is one. Retain $Lambda_m$:
    its actual canonical models will determine the horizontal discrepancy signs at the end of the construction.
  #emph[The invariant classifying map.] Fix the dimension, the volume read from (5.1),
    and a finite coefficient set containing the coefficients of $A$ and closed under sums at most one.
    The good algebraic parameter locus has a classifying map to the projective coarse space $M$ of stable pairs
    with these data. If an additional parameterization of the map in (5.1) was used, its moduli graph descends:
    the embedded pair determines a unique isomorphism class, so the closure of that graph is generically a
    singleton over the good parameter locus. Restricting a dense algebraic open therefore gives the same rational
    classifying map on $Z_m$. It is invariant under change of projective frame.
  Compose with the meromorphic frame parameter map. The resulting map $overline(Q)_m arrow.r.dashed
    M$ is constant on general frame fibers. Its graph has a proper analytic image in $Y times M$.
    This image is generically a singleton over $Y$, so its projection to $Y$ is bimeromorphic.
    It is the graph of a meromorphic map
  $ mu : Y arrow.r.dashed M . $
  Let $M_0$ be the closure of its image; it is projective.
  #emph[A stable parameter cover and the matching cover.] Stable moduli supplies a finite parameter cover $S
    arrow.r M$ from a normal scheme carrying a stable family #cite(label("KovacsPatakfalvi")) Corollary 6.19.
    The coarse space $M$ is projective #cite(label("KovacsPatakfalvi")) Corollary 7.3,
    so its finite cover $S$ is projective as well. The moduli construction for the specified coefficient set is
    given in #cite(label("KovacsPatakfalvi")) Definition 6.2, Proposition 6.4, and Proposition 6.14.
    Resolve $mu$, and normalize a component of the pullback of $S arrow.r M$ dominating $Y$.
    Let $R_0$ be its image in $S$. The restricted stable family over $R_0$ has maximal variation,
    because $R_0 arrow.r M_0$ is finite.
  At this point the projective family exists over $R_0$. Equality of coarse moduli points identifies its general
    fibers with those of the original analytic image, but does not identify the families.
    We construct a further generically finite cover carrying such an identification.
  On a dense analytic open of the comparison base, embed the original flat image by the complete system of
    $cal(O)_(cal(Z)_m) \( k \)$, and the pulled-back stable family by its $k m$-adjoint system,
    for a common sufficiently large and divisible $k$. The two sheaves of sections are coherent direct images of
    compact families; generic cohomology and base change make them locally free after shrinking.
    On a common compact modification of the base, make their torsion-free strict transforms locally free,
    resolve the evaluation maps, and flatten the embedded image families and their weighted boundary cycles.
    This gives holomorphic relative Hilbert–Chow data. The modification concerns the base itself,
    not a space of choices of frames.
  On every general good fiber, (5.1) identifies the two polarizations.
    Thus the projective linear maps identifying the two embedded varieties and their weighted boundary cycles form
    a nonempty Isom set. This set is finite, since stable pairs have finite automorphism groups
    #cite(label("KovacsPatakfalvi")) Propositions 6.5 and 6.8;
    completeness and nondegeneracy of the embeddings exclude additional ambient stabilizers.
    At this stage we use only the embedded analytic image and its polarization.
    Its $upright(bold(Q))$-Gorenstein family structure will be transported from the stable family by the identification.
  To compactify these Isom sets, work in local trivializations of the two section bundles.
    In the product of their projective parameter spaces with the projective matrix space,
    take the algebraic closure of the incidence relation for invertible matrices identifying the embedded
    varieties and weighted boundary cycles, after clearing the fixed coefficient denominators.
    Pull back this closure by the two Hilbert–Chow maps. Equivariance under changes of both frames glues the local
    incidence spaces into a proper analytic space in the projective bundle of homomorphisms between the section
    bundles; no meromorphic trivialization is used. Retain its compact irreducible components that dominate the
    base and meet the invertible locus, and normalize them. The invertible locus has the finite Isom fibers just
    described, so the resulting cover is proper and generically finite.
    Its tautological isomorphism identifies the generic families,
    including the stable family’s $upright(bold(Q))$-Gorenstein structure;
    its graph therefore extends meromorphically over the compact base.
  Finally resolve $R_0$ projectively and resolve the graph of the map from the comparison cover to it.
    Denote the resulting spaces by $R$ and $Y'$. Stable families and their divisible relative adjoint line bundles
    commute with base change, with boundary understood by divisorial restriction #cite(label("KovacsPatakfalvi"))
    Remark 3.8. Thus the pullback family over $R$ remains stable; it has klt general fibers and maximal variation.
    All covers and modifications used above stay in class $cal(C)$.
  On a common resolution we can now compare the source adjoint divisor with the pullback of the stable relative
    adjoint divisor, which is rational Cartier. There are only finitely many horizontal prime coefficients in
    their difference. On fibers above $Lambda_m$, away from the finitely many generic comparison exceptions,
    they are the log canonical model discrepancy coefficients.
    They are therefore nonnegative and supported on divisors exceptional over the stable model.
    The same statements hold horizontally in the family. Remove the images of the remaining vertical discrepancy
    divisors. On the resulting dense analytic open this is the log canonical model comparison,
    with its divisorial pushforward boundary. This proves the asserted meromorphic comparison without relative
    analytic finite generation. If $M_0$ is a point, the construction uses the fixed stable pair and $R$ is a point. ◻
]

=== 5.2 Relative forms and vertical valuations <relative-forms-and-vertical-valuations>

For a meromorphic section $sigma$ of $cal(O)_V \( b K_(V \/ Y) \)$,
  its horizontal pole bound $b A$ means that $"ord"_E \( sigma \) gt.eq - b A_E$ at every horizontal prime,
  using a local nonvanishing base volume to interpret relative forms.
  At a vertical prime over a divisor $D subset Y$, write $omega_D$ for a local nonvanishing logarithmic top form
  on the base with a simple pole along $D$, and no other pole at its generic point.
  We say that $sigma$ has the relative logarithmic bound at this prime if

#[#set math.equation(numbering: n => "(5.2)")
 $ "ord"_E #scale(x: 120%, y: 120%)[\(] sigma and h^(*) omega_D^(thin b) #scale(x: 120%, y: 120%)[\)] gt.eq -
   b . $ <generaltype:relative-log-bound>]

The notation $and$ denotes the relative-times-base identification of the corresponding pluricanonical line bundles.

#thm([Lemma 5.3.])[
  #emph[In the situation of 26, pull back a holomorphic section of a divisible multiple of $K_(cal(V) \/ R) +
    cal(A)$, and compare it with relative pluriforms on the main component of $V times_Y Y'$.
    It satisfies the horizontal bound given by the pullback of $A$.
    Moreover, on a common resolution it satisfies (5.2) at every prime lying over a divisor of any smooth
    modification of the comparison base.]
] <generaltype:stable-orders>

#proof[
  On general fibers, pullback from the log canonical model lies in the original log pluricanonical system.
    The effective canonical-model discrepancy on a common resolution therefore proves the horizontal bound.
  For the vertical assertion, first fix a smooth modification of the comparison base and a prime divisor on it.
    The stable family and its divisible relative adjoint line bundles commute with this base change.
    Work transversely to a general point of that divisor. The resulting one-parameter family is still stable.
    This order of operations is what permits the same bound at divisors exposed only on a higher base model.
    Its total pair with the reduced central fiber added is log canonical.
    More explicitly, choose the disk with klt fibers away from its origin. Its total space is normal:
    flatness over the smooth disk and the $S_2$ property of the fibers give $S_2$.
    A codimension-one point on the central fiber is a generic point of one of its reduced components.
    Its local ring is one-dimensional, and its quotient by the disk parameter is a field;
    its maximal ideal is consequently generated by that parameter, so this local ring is regular.
    Away from the central fiber the total space is normal, because its fibers are klt.
    Serre’s criterion now gives normality. Compatibility of the relative adjoint divisor with the stable fiber
    identifies the adjunction different on the normalization of the central fiber with its stable boundary and
    conductor. The resulting pair is log canonical because the central fiber is stable;
    see #cite(label("PatakfalviFibered")) Lemma 2.10 and Corollary 2.11 for this normalization-and-conductor
    identity. The analytic Cartier-divisor inversion theorem #cite(label("FujinoAnalyticAdjunction")) Theorem 1.1
    consequently applies. The argument also applies after any finite ramified disk change.
  Let $t$ be the disk parameter and let $xi$ denote the pulled-back relative section in degree $b$.
    Then $xi and \( d t \/ t \)^b$ is a section of the total log canonical multiple with the central fiber added.
    On a log resolution the log canonical discrepancy bound says that this form has pole order at most $b$ at
    every vertical prime. A further common resolution with the original family preserves this bound.
    This is (5.2). Smooth transverse parameters do not change any of these orders. ◻
]

#thm([Lemma 5.4.])[
  #emph[Under the hypotheses of 26, there is a positive integer $b_0$ and a finite-dimensional space
$ cal(S) subset H_(upright("mer"))^0 #scale(x: 120%, y: 120%)[\(] V \,
  cal(O)_V \( b_0 K_(V \/ Y) \) #scale(x: 120%, y: 120%)[\)] $

 whose associated meromorphic map has rank $dim F$ on general $h$-fibers, with the following properties:]
  + #emph[every member has horizontal pole bound $b_0 A$;]
  + #emph[every member satisfies the relative logarithmic bound at primes over base divisors;]
  + #emph[the same bound may be tested after any modification of the base, at a divisor exposed on that modification.]
  #emph[The same assertions hold for the systems of products of members of $cal(S)$.]
] <generaltype:relative-system>

#proof[
  Use 26. If $dim R > 0$, the stable-family bigness theorem #cite(label("KovacsPatakfalvi")) Theorem 8.1 and
    Corollary 8.3 applies: the base is normal projective, the family is stable and has maximal variation,
    and its general fiber is klt. Thus $K_(cal(V) \/ R) + cal(A)$ is big.
    Choose finitely many sections of one sufficiently divisible multiple whose map is generically finite.
    Its image has dimension $dim F + dim R$, and its restriction to a general $pi$-fiber has rank $dim F$.
    If $R$ is a point, choose such sections of the ample log canonical divisor of the fixed stable pair instead.
    Pullback and the meromorphic comparison preserve these image dimensions and give the pole bounds of 27.
  Replace the comparison cover by a Galois cover and resolve the diagrams equivariantly.
    To do this analytically, first take its Stein factorization over $Y$;
    its finite factor has the same cover over a dense open set.
    Over the finite étale locus, the Galois closure is a component of a sufficiently large fiber product of this
    finite factor. Take the corresponding compact component, normalize,
    and then resolve the graph of its map to the comparison cover.
    Equivariant resolution gives the required diagram; write $G$ for its finite group.
    This construction uses finite analytic maps and does not require the meromorphic function field of $Y$ to have
    transcendence degree $dim Y$.
  Let $cal(B)$ be the graded $upright(bold(C))$-algebra generated by the chosen finite set of relative sections
    and all its $G$-conjugates. Every homogeneous element has the required horizontal and vertical linear pole
    bounds: products add the orders and sums cannot decrease the lower bounds.
    The algebra is integral and finite over $cal(B)^G$. Indeed each homogeneous generator satisfies its orbit
    polynomial with invariant coefficients, and invariants of a finite group acting on a finitely generated
    algebra are finitely generated. The corresponding map $"Proj" cal(B) arrow.r "Proj" cal(B)^G$ is finite.
    Before taking invariants, the system contains the sections pulled back from $cal(V)$,
    whose restriction to a general source fiber has image dimension $dim F$.
    A finite map preserves the dimension of the image of that fiber,
    even though $G$ may permute the fibers above one point of $Y$.
    Choose a Veronese degree for $cal(B)^G$ generated by finitely many elements of that single degree.
    Their ratios therefore still have rank $dim F$ on general fibers. Denote their pluricanonical degree by $b_0$.
    The same finite quotient also preserves the total image dimension, which is at least $dim F + dim R$.
  Use the natural identification of relative canonical bundles on the common smooth locus for every base change or
    modification. On the dense étale locus, invariant relative tensors therefore descend to $V$.
    They extend meromorphically across the remaining locus by finite analytic descent.
    The horizontal bounds descend because the comparison cover is generically étale along each horizontal divisor.
  For completeness, the vertical order calculation is exact. Let $E'$ lie over $E$, with ramification index $e$.
    For a degree-$b_0$ top pluriform $alpha$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ "ord"_(E') \( alpha_(upright("pullback")) \) + b_0 = e #scale(x: 120%, y: 120%)[\(] "ord"_E \( alpha \) +
     b_0 #scale(x: 120%, y: 120%)[\)] . $ <generaltype:ramified-order>]
  A logarithmic top form on the base pulls back to a nonvanishing logarithmic top form at a prime dominating its
    divisor. Apply (5.3) to the relative form wedged with this base logarithmic form.
    The bound upstairs is therefore equivalent to (5.2) downstairs.
    For (iii), pull the chosen Galois comparison cover and its original sections to a common refinement over the
    modified base. Lemma 27 applies to these same pullbacks at primes above the newly exposed base divisor;
    its bounds pass to their conjugates, products, and invariant combinations.
    The ramification calculation therefore gives the bound for the pullback of each fixed descended member of
    $cal(S)$. Products add the order inequalities, and taking a full product system is a Veronese operation on its
    image, so products preserve the relative rank as well. ◻
]

#thm([Lemma 5.5.])[
  #emph[Let $h : V arrow.r Y$ be a proper surjective holomorphic map of irreducible compact complex spaces,
    with $Y$ smooth. If a prime divisor $E$ of a smooth $V$ does not dominate $Y$,
    there is a modification of the base and a dominating main-component model on which the strict transform of $E$
    maps onto a prime divisor of the modified base.]
] <generaltype:expose-valuation>

#proof[
  Apply analytic flattening to $h$, by strict transform, and resolve the modified base.
    Pullback preserves the flatness of the intermediate family,
    whose fibers have the generic relative dimension $d$. This intermediate source is proper and bimeromorphic
    over $V$. On a resolution dominating it, the strict transform of $E$ remains a divisor,
    because a proper modification of the smooth $V$ is an isomorphism at the generic point of $E$.
    Its image in the flat intermediate source has dimension $dim V - 1$: it still dominates $E$.
    The fiber-dimension bound consequently gives an image on the new base of dimension at least $dim V - 1 - d =
    dim Y - 1$. That image is proper, since its projection to $Y$ is contained in $h \( E \)$,
    and properness makes it a closed analytic set. It is therefore a prime divisor.
    Further source resolutions retain the same generic image and do not change the valuation of $E$. ◻
]

=== 5.3 Proof of the addition proposition <proof-of-the-addition-proposition>

#proof[
  We may suppose $kappa \( Y \, K_Y + C \) gt.eq 0$. Choose a Kähler modification $nu : tilde(V) arrow.r V$,
    resolve the boundary, and put
  $ tilde(T) = nu_(*)^(- 1) T + "Exc" \( nu \)_(upright("red")) . $
  By Lemma 2.1, Corollary 2.3, pullback and descent identify the divisible log pluricanonical rings on the total
    spaces and on their very general fibers. In particular, fiberwise bigness is preserved,
    and $B \( h compose nu \, tilde(T) \) = B \( h \, T \)$. Every prime over base codimension at least two still
    has coefficient one: it is either a strict transform of such a prime or is newly exceptional.
    Write $\( V \, T \)$ for this Kähler model; its sections descend to the original pair.
  If $dim F = 0$, the map is bimeromorphic. Pull back sections of $K_Y + C$.
    At a prime dominating a base divisor the multiplicity is one and the condition $C lt.eq
    B \( h \, T \)$ gives the required pole bound. At an exceptional prime the log canonical discrepancy bound for
    $\( Y \, C \)$, together with $T_E = 1$, gives the same conclusion.
    Thus pullback preserves all the base systems and proves the assertion.
    If $Y$ is a point, the assertion is simply the assumed bigness.
    We may therefore assume both dimensions are positive.
  Write $T^(upright(h))$ for the horizontal part of $T$. Choose a rational $epsilon.alt > 0$ sufficiently small and set
  $ A = \( 1 - epsilon.alt \) T^(upright(h)) . $
  Its coefficients are strictly less than one. To make $K_F + A_F$ big uniformly on very general fibers,
    consider $epsilon.alt = 1 \/ j$ and all denominator-clearing degrees.
    Choose a fiber outside their countably many generic base-change and relative-rank exceptional sets.
    Openness of the big cone on that projective fiber gives one choice of $epsilon.alt$ and one degree with full
    image dimension. The generic-rank choice makes the same degree have full rank on general fibers.
    Notice that no vertical coefficient has been lowered, and $C$ has not been changed.
  Apply 28 to $A$, and write $sigma$ for a member of its system in degree $b$, including any product degree. Let
  $ eta in H^0 #scale(x: 120%, y: 120%)[\(] Y \, cal(O)_Y \( b \( K_Y + C \) \) #scale(x: 120%, y: 120%)[\)] . $
  The relative-times-base product $sigma and h^(*) eta$ is a meromorphic section of $cal(O)_V \( b K_V \)$.
    We check that its poles are bounded by $b T$ at every prime.
  There is nothing further to check at horizontal primes, since $A lt.eq T^(upright(h))$.
    Suppose next that $E$ maps onto a prime divisor $D subset Y$, and put
  $ a_E = "ord"_E \( h^(*) D \) . $
  Relative to a local nonvanishing logarithmic base volume $omega_D$,
    the section $eta$ vanishes to order at least $b \( 1 - C_D \)$. The relative logarithmic bound gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ "ord"_E \( sigma and h^(*) eta \) gt.eq - b + b thin a_E \( 1 - C_D \) . $ <generaltype:orbifold-order>]
  The inf-multiplicity convention is precisely
  $ B \( h \, T \)_D = 1 - max_(E mapsto D) frac(1 - T_E, a_E) . $
  Consequently $C_D lt.eq B \( h \, T \)_D$ implies
  $ a_E \( 1 - C_D \) gt.eq 1 - T_E \, $
  and (5.4) is at least $- b T_E$. This uses no integrality condition on the boundary multiplicities.
  Finally, suppose $"codim"_Y h \( E \) gt.eq 2$. Expose a base divisor $D'$ below the strict transform of $E$ by
    29, and resolve the diagrams. The pullback of $eta$ has at most a logarithmic pole along $D'$:
    this is the divisorial discrepancy inequality for the log canonical smooth pair $\( Y \, C \)$.
    Property (iii) of 28 therefore gives order at least $- b$ at the strict transform of $E$.
    The order is unchanged, since source modifications are isomorphisms at the generic point of $E$.
    The assumption $T_E = 1$ supplies exactly this allowance. We have proved, at all prime divisors, that
  #[#set math.equation(numbering: n => "(5.5)")
   $ sigma and h^(*) eta in H^0 #scale(x: 120%, y: 120%)[\(] V \,
     cal(O)_V \( b \( K_V + T \) \) #scale(x: 120%, y: 120%)[\)] . $ <generaltype:product-sections>]
  On a smooth space these divisorial bounds imply holomorphic extension of the corresponding log pluricanonical section.
  Choose a degree in which the complete base system has image dimension $kappa \( Y \, K_Y + C \)$,
    and pass to a common multiple with $b_0$ in 28. The product system of relative sections still has image
    dimension $d = dim F$ on a general fiber. The corresponding product of the chosen base system has image
    dimension $kappa \( Y \, K_Y + C \)$, since a Veronese embedding preserves its image.
    In this common degree write the nonzero relative generators as $sigma_i$ and the base generators as $eta_j$.
    The total system in (5.5) contains all $sigma_i and h^(*) eta_j$.
    On the open set where $sigma_0$ and $eta_0$ are nonzero, ratios in this system include
  $ sigma_i / sigma_0 \, wide h^(*) #h(-0.16667em) (eta_j / eta_0) . $
  Its image therefore maps onto the base Iitaka image, and over a general point of that image it contains the
    $d$-dimensional image of a general $h$-fiber. The dimension-of-fibers inequality gives image dimension at
    least $d + kappa \( Y \, K_Y + C \)$. This proves (3.2) on the Kähler model.
    The initial log pluricanonical descent then proves it on the given smooth source. ◻
]

== 6 Return to the original fibration and consequences <application:section>

The previous sections supply the two positivity statements and the exact section comparison.
  We now apply them to the original fibration, keeping its base fixed while changing the intermediate Iitaka space.

#proof[
  If either summand on the right is $- oo$, the asserted inequality is automatic.
    Suppose henceforth that both are nonnegative, and put
  $ k = kappa \( F \, K_F + Delta_F \) \, wide b = kappa \( f divides Delta \) . $
  #emph[Fixing the base.] Use Section 2 and 5 to resolve the diagram, take Kähler models,
    and flatten before resolving the source. Use strict transforms plus reduced exceptional divisors at every
    source modification. Resolve the discriminant and boundary-stratum images on the base,
    then fix this smooth Kähler base $Y$. The source and very general fiber log section rings are unchanged,
    and every source prime mapped into codimension at least two in $Y$ has coefficient one. Put
  $ C = B \( f \, Delta \) $
  on this model. It has SNC support, and the definition of the invariant gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ kappa \( Y \, K_Y + C \) gt.eq b . $ <application:invariant-bound>]
  6 preserves $C = B \( f \, Delta \)$ and the coefficient-one condition through all further changes over $Y$.
  #emph[The relative Iitaka map and its Hodge line.] Apply 7, obtaining
  $ X arrow.r^g W arrow.r^h Y \, wide dim W_y = k \, wide kappa \( G \, K_G + Delta_G \) = 0 . $
  Make $W$ Kähler, resolve the diagram, and fix the current smooth source pair $\( X_0 \, Delta_0 \)$ as
    reference. Flatten over $W$ and resolve the generator and boundary data as required by 8.
    Thus every prime mapped by $g$ into codimension at least two is exceptional over $X_0$,
    and on a dense smooth log open the relative systems have rank one in all sufficiently divisible degrees.
  Apply Proposition 2.7, Theorem 3.1. Their further modifications remain over $Y$;
    6 preserves the exceptional reference, while the variation and its parabolic line pull back from the common
    open. The relative Iitaka property persists by 7. On the resulting common model we obtain a rational line $M$,
    a rational SNC boundary $T$ in $\[ 0 \, 1 \]$, and a surjective map to a smooth projective variety:
  #[#set math.equation(numbering: n => "(6.2)")
   $ p : W arrow.r S \, wide M = p^(*) P \, wide P upright(" nef") \, wide K_S +
     a_0 P upright(" big for some ") a_0 > 0 \, $ <application:period-data>]
  such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ B \( g \, Delta \) lt.eq T lt.eq 1 . $ <application:rankone-boundary>]
  Compute $T$ by the rank-one order formula on this final model.
    Parabolic pullback and 8 identify the divisible systems of $K_W + T + M$ with those on $\( X_0 \, Delta_0 \)$,
    also relatively over $Y$, preserving all ratios.
  #emph[Relative bigness and the base boundary.] Set $D_W = K_W + T$.
    The systems defining the relative Iitaka image have image dimension $k$ on very general $f$-fibers.
    Push these systems into $D_W + M$ using 8. Their ratios are unchanged,
    so the resulting systems have image dimension $k$ on very general $h$-fibers, whose dimension is $k$. Consequently
  #[#set math.equation(numbering: n => "(6.4)")
   $ \( D_W + M \) \|_(W_y) upright(" is big for very general ") y . $ <application:relative-big>]
  Here the systems are obtained by generic base change over an open patch of $Y$ and extend on the smooth $W_y$ by
    the relative section comparison. Adjunction identifies the restricted adjoint bundles.
  By 13,
  #[#set math.equation(numbering: n => "(6.5)")
   $ B \( h \, T \) gt.eq C . $ <application:composed-boundary>]
  The same lemma gives coefficient one in $T$ for every prime of $W$ mapped into codimension at least two in $Y$.
    Thus both boundary hypotheses of 15 hold.
  The hypotheses of 17 have now all been verified. Its conclusion is
  #[#set math.equation(numbering: n => "(6.6)")
   $ kappa \( W \, K_W + T + M \) gt.eq k + kappa \( Y \, K_Y + C \) . $ <application:final-intermediate-bound>]
  The proof of that proposition uses a single nonzero section to cancel the ample perturbation and preserves the
    ratios defining this bound.
  Finally, 8 lifts these systems by the relative generators, preserving their ratios and image dimensions.
    Untested $g$-contracted primes are exceptional over $\( X_0 \, Delta_0 \)$,
    so the forms descend and extend there. By 2, they then descend to the original source.
    Combining (6.1) and (6.6) proves
  $ kappa \( X \, K_X + Delta \) gt.eq kappa \( F \, K_F + Delta_F \) + kappa \( f divides Delta \) . $
  Bigness on a point means Iitaka dimension zero, and a zero-dimensional connected fiber has trivial relative
    line. If $Y$ is a point the inequality is an identity; if the relative Iitaka fiber is a point its Hodge line
    is trivial. Together with the point-period-base case above and the initial $- oo$ convention,
    these observations cover all dimensions and values of the two summands. ◻
]

=== 6.1 The logarithmic and ordinary inequalities <spec:section>

We first compare the invariant orbifold base with a prescribed logarithmic base.
  This makes the two classical specializations of Theorem 1 immediate,
  while retaining control of the base under modification.

#thm([Lemma 6.1.])[
  (Comparison with a logarithmic base).  #emph[Let $f : \( X \, Delta \) arrow.r
    Y$ be a fibration of smooth compact complex manifolds, where $Delta$ has rational coefficients in
    $\[ 0 \, 1 \]$ and simple normal crossing support. Let $D_Y$ be a reduced simple normal crossing divisor on
    $Y$. Suppose that every prime component of $f^(*) D_Y$ has coefficient one in $Delta$. Then
$ kappa \( f divides Delta \) gt.eq kappa \( Y \, K_Y + D_Y \) . $

]
] <spec:base-comparison>

#proof[
  Choose a neat model as in Lemma 5, with $p : X' arrow.r X$, $q : Y' arrow.r Y$, $f' : X' arrow.r Y'$,
    and $Delta' = p_(*)^(- 1) Delta + "Exc" \( p \)_(upright("red"))$.
    We may arrange that $E_Y = \( q^(- 1) "Supp" D_Y \)_(upright("red"))$ has simple normal crossings.
    Every prime of $X'$ dominating a component of $E_Y$ has coefficient one in $Delta'$:
    an exceptional prime has coefficient one by definition, and a nonexceptional prime is the strict transform of
    a component of $f^(*) D_Y$. Thus its weighted multiplicity is infinite, and the inf-multiplicity rule gives
  $ B \( f' \, Delta' \) gt.eq E_Y . $
  Pullback by $q$ takes logarithmic top forms with poles along $D_Y$ to logarithmic top forms with poles along
    $E_Y$. In local coordinates this follows by pulling back each factor $d z_i \/ z_i$;
    the same assertion holds for all tensor powers. Consequently,
    pullback embeds every plurilogarithmic system on $\( Y \, D_Y \)$ into the corresponding system of $K_(Y') +
    B \( f' \, Delta' \)$, preserving all ratios of sections. The neat-model identity (2.2) now proves the claim. ◻
]

#thm([Corollary 6.2.])[
  (Logarithmic subadditivity).  #emph[Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between
    smooth connected projective complex varieties. Let $D_X \, D_Y$ be reduced simple normal crossing divisors,
    with the zero divisor allowed, such that
$ "Supp" \( f^(*) D_Y \) subset.eq "Supp" \( D_X \) . $

 For a very general fiber $F$, put $D_F = D_X \|_F$. Then
#[#set math.equation(numbering: n => "(6.7)")
 $ kappa \( X \, K_X + D_X \) gt.eq kappa \( F \, K_F + D_F \) + kappa \( Y \, K_Y + D_Y \) . $ <spec:log-inequality>]

 The same statement holds for compact manifolds in Fujiki class $cal(C)$ and holomorphic fibrations between them.]
] <spec:logarithmic>

#proof[
  Theorem 1 applies to $\( X \, D_X \)$, and Lemma 30 bounds its base term from below.
    If either term on the right of (6.7) is $- oo$, the assertion follows from our convention for that value. ◻
]

In the projective setting, this is the usual compactification form of the logarithmic Iitaka conjecture.
  Indeed, for a smooth quasi-projective variety $U$ with a smooth projective compactification $X$ and reduced
  simple normal crossing boundary $D_X = X \\ U$, its logarithmic Kodaira dimension is $overline(kappa) \( U \) =
  kappa \( X \, K_X + D_X \)$ #cite(label("IitakaLog")). A dominant morphism $U arrow.r
  V$ between smooth connected quasi-projective varieties, with geometrically connected general fiber,
  admits compatible such compactifications: compactify the graph and resolve the graph and boundaries.
  The Stein factor of the resulting morphism $X arrow.r Y$ is finite birational over the normal variety $Y$,
  hence equals $Y$. Thus $f$ has connected fibers, and $"Supp" \( f^(*) D_Y \) subset.eq "Supp" \( D_X \)$.
  For very general $v in V$, $\( X_v \, D_X \|_(X_v) \)$ compactifies $U_v$.
  Thus Corollary 31 gives $overline(kappa) \( U \) gt.eq overline(kappa) \( U_v \) + overline(kappa) \( V \)$.

Ordinary subadditivity also enters the Albanese reduction of #cite(label("OpenAILogAbundance2026")).
  That work combines it with separate nonvanishing and good-model arguments to prove log abundance in
  characteristic zero.

#thm([Corollary 6.3.])[
  (Ordinary subadditivity in characteristic zero).  #emph[Let $k$ be an algebraically closed field of
    characteristic zero, and let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth
    connected projective $k$-varieties. If $F$ is its geometric generic fiber, then
#[#set math.equation(numbering: n => "(6.8)")
 $ kappa \( X \) gt.eq kappa \( F \) + kappa \( Y \) . $ <spec:ordinary-inequality>]

 More generally, the logarithmic inequality of Corollary 31, with the same boundary hypotheses, holds over $k$,
   with the geometric generic fiber in place of a very general complex fiber.]
] <spec:ordinary>

#proof[
  Over $bb(C)$, the ordinary assertion follows by taking $D_X = D_Y = 0$ in Corollary 31.
    In a projective family over $bb(C)$, the Iitaka dimension of the geometric generic fiber equals that of a very
    general fiber. To see this, apply cohomology and base change in each positive divisible pluricanonical degree.
    After shrinking the base separately in each degree, the corresponding relative rational map also has constant
    fiberwise image dimension. Excluding the resulting countable union of proper closed subsets identifies all
    these image dimensions with those of the generic fiber.
  For the field extension, let $K subset.eq K'$ be fields and let $V$ be a smooth projective geometrically
    integral $K$-variety with a rational divisor $D$. For every $m$ for which $m D$ is integral, flat base change gives
  $ H^0 \( V \, cal(O)_V \( m D \) \) ⊗_K K' tilde.eq H^0 \( V_(K') \, cal(O)_(V_(K')) \( m D_(K') \) \) . $
  The complete linear system on the right is the scalar extension of the one on the left,
    so nonvanishing and image dimension are unchanged. Hence Iitaka dimension is invariant under extension of the
    ground field. Applying this observation to the generic fiber over the function field of the base proves the
    corresponding invariance for geometric generic fibers.
  Descend $f$, its projective embeddings, and its boundary divisors to a finitely generated subfield $K subset
    k$ over $bb(Q)$. The descended varieties are smooth and geometrically integral;
    the boundary conditions descend as well. The equality $f_(*) cal(O)_X =
    cal(O)_Y$ descends by proper flat base change and faithful flatness,
    and therefore also holds after an embedding $K arrow.r.hook bb(C)$.
    Apply the complex logarithmic inequality to this base change.
    The preceding invariance identifies its three Iitaka dimensions with those over $k$, proving both assertions. ◻
]

=== 6.2 Kodaira dimension along the core <spec:core>

A smooth compact orbifold pair $\( X \, Delta \)$ in class $cal(C)$ is #emph[special] if it has no meromorphic
  fibration onto a positive-dimensional base of orbifold general type;
  here general type means that the invariant base dimension equals the dimension of the base.
  Campana constructed its #emph[core]

$ c_(\( X \, Delta \)) : \( X \, Delta \) arrow.r.dashed C \( X \, Delta \) \, $

whose very general orbifold fiber is special and whose orbifold base is of general type,
  unless it is a point #cite(label("CampanaOrbifolds")) Theorem 9.1.
  In particular, the core has a point base exactly when $\( X \, Delta \)$ is special.
  Fiber properties of the core and the tower below refer to Campana’s stable orbifold fibers:
  they are computed on the suitable equivalent holomorphic representatives furnished by these constructions
  #cite(label("CampanaOrbifolds")) Definition 2.49 and §7.1.
  A neat representative $g : \( Z \, Gamma \) arrow.r T$ in the sense of Section 2 is #emph[strictly neat] if its
  inf-multiplicity boundary on the smooth base is SNC. It is #emph[high] if $g$ is an orbifold morphism to this
  base: for every base prime $D$ and source prime $E$ with $a_E = "ord"_E \( g^(*) D \) > 0$,
  including primes contracted by $g$,

$ a_E m_Gamma \( E \) gt.eq m_(B \( g \, Gamma \)) \( D \) . $

These are the model conditions of #cite(label("CampanaOrbifolds")) Definition 3.8 and Proposition 3.10.
  The high condition is not automatic: the inf-multiplicity base tests divisors dominating base primes,
  whereas an orbifold morphism must also control primes contracted into higher codimension
  #cite(label("CampanaOrbifolds")) Remark 3.3(2). For the core and its tower we choose compatible strictly neat
  and high representatives supplied by Campana’s constructions #cite(label("CampanaOrbifolds")) Proposition 3.15
  and Corollary 4.14. The section comparisons of Section 2 do not assert that arbitrary model changes preserve
  every stable-fiber property.

#thm([Corollary 6.4.])[
  (Kodaira dimension along the core).  #emph[Let $\( X \, Delta \)$ be a smooth compact orbifold pair in Fujiki
    class $cal(C)$, with rational simple normal crossing boundary coefficients in $\[ 0 \, 1 \]$.
    Let $C = C \( X \, Delta \)$ be its core base and $\( G \, Delta_G \)$ a very general orbifold fiber. Then
#[#set math.equation(numbering: n => "(6.9)")
 $ kappa \( X \, K_X + Delta \) = kappa \( G \, K_G + Delta_G \) + dim C . $ <spec:core-equality>]

 If $kappa \( X \, K_X + Delta \) gt.eq 0$, then
$ 0 lt.eq dim C lt.eq kappa \( X \, K_X + Delta \) \, $

 and equality in the second inequality holds precisely when $kappa \( G \, K_G + Delta_G \) = 0$.
   In particular, $kappa \( X \, K_X + Delta \) = 0$ implies that $\( X \, Delta \)$ is special.]
] <spec:core-dimension>

#proof[
  Resolve the core map, using the boundary convention of Lemma 2.
    The total and fiber Iitaka dimensions are preserved. Theorem 1 gives the lower bound in (6.9),
    since the invariant base dimension is $dim C$.
  For completeness, the reverse bound is the elementary upper addition inequality.
    For each divisible $m$, let $phi.alt_m$ be the meromorphic map defined by $\| m \( K_X + Delta \) \|$,
    when this system is nonempty. The map $\( c \, phi.alt_m \)$ has image dimension at most $dim C +
    kappa \( G \, K_G + Delta_G \)$: on a very general $c$-fiber its second component is given by a subspace of
    $H^0 \( G \, m \( K_G + Delta_G \) \)$. Since projection from this image onto the image of $phi.alt_m$ is
    surjective, the same upper bound holds for $dim phi.alt_m \( X \)$.
    Taking the maximum over $m$ proves the desired inequality.
    If the fiber Iitaka dimension is $- oo$, restriction to a very general fiber shows that no global
    pluricanonical section can be nonzero, so both sides of (6.9) are $- oo$.
  Finally, if the total Iitaka dimension is nonnegative, a nonzero section restricts nontrivially to a very
    general core fiber. Its Iitaka dimension is therefore nonnegative.
    The dimension bound and its equality case follow from (6.9).
    When the total dimension is zero, the core base is a point, which is equivalent to specialness. ◻
]

These statements recover, for the core, Campana’s general-type-base addition theorem and its consequences
  #cite(label("CampanaOrbifolds")) Theorems 6.3, 6.7, and 6.8.
  The existence of the core and the implication from Kodaira dimension zero to specialness are established results
  of his theory.

=== 6.3 The core tower <spec:core-tower-section>

For a smooth orbifold pair $\( Z \, Theta \)$, the notation $kappa_(+) \( Z \, Theta \) = -
  oo$ means that every meromorphic fibration onto a positive-dimensional base has invariant orbifold Kodaira
  dimension $- oo$; the condition is vacuous for a point. Equivalently,
  one may test all dominant meromorphic maps: in Stein factorization,
  the finite orbifold canonical-divisor inequality shows that passing to the connected-fiber factor cannot
  decrease the invariant base dimension. Indeed, over a divisor with multiplicity $m_D$,
  a prime with ramification index $e$ and orbifold multiplicity $m_E$ satisfies $m_D lt.eq e m_E$;
  the canonical-divisor difference has coefficient $e \/ m_D - 1 \/ m_E gt.eq 0$.
  The #emph[$kappa$-rational quotient] is a meromorphic fibration $r : \( Z \, Theta \) arrow.r.dashed
  R$ with $kappa \( r divides Theta \) gt.eq 0$ whose very general stable orbifold fiber has $kappa_(+) = -
  oo$ #cite(label("CampanaOrbifolds")) Definition 5.23 and Corollary 6.14.
  Its #emph[stable orbifold base] is the inf-multiplicity base on the compatible representatives just described
  #cite(label("CampanaOrbifolds")) Proposition 3.15, Corollary 4.14, and §7.1.

#thm([Corollary 6.5.])[
  (Campana’s decomposition of the core).  #emph[Let $\( X \, Delta \)$ be as in Corollary 33, and set $n = dim X$.
    Starting from $\( X \, Delta \)$, successively take the $kappa$-rational quotient $r$ and the Moishezon–Iitaka
    fibration $M$ of its stable orbifold base. At each iteration choose such compatible representatives and equip
    the new base with the stable inf-multiplicity orbifold structure of the composite.
    The composite after at most $n$ iterations is the core, up to bimeromorphic equivalence of fibrations:
$ c_(\( X \, Delta \)) = \( M compose r \)^n . $

 The positive-dimensional very general stable orbifold fibers of the $r$-steps have $kappa_(+) = - oo$,
   and those of the $M$-steps have Kodaira dimension zero. In particular,
   for a special pair this tower ends at a point.]
] <spec:core-tower>

#proof[
  Theorem 1 establishes the hypothesis of Campana’s Corollary 6.14, which supplies the $kappa$-rational quotient.
    Its scope is exactly that used here: smooth compact class-$cal(C)$ pairs with rational coefficients in
    $\[ 0 \, 1 \]$ #cite(label("CampanaOrbifolds")) Conjecture 6.1 and Remark 6.2.
    Its stable base has nonnegative Kodaira dimension, so $M$ is defined and has very general orbifold fiber of
    Kodaira dimension zero. The new smooth base remains in class $cal(C)$,
    with rational boundary coefficients in $\[ 0 \, 1 \]$. Thus the construction can be repeated.
  Campana’s Lemma 10.1 states that each composite $M compose
    r$ has special general orbifold fiber and decreases dimension unless its source pair is of general type.
    His Theorems 10.2–10.3 identify the resulting stabilized composite with the core.
    Their sole conjectural input is the existence of the $kappa$-rational quotient, now supplied above.
    Strict dimension decrease allows at most $n$ nontrivial iterations; identity steps give the displayed formula.
    A point is fixed throughout. These are precisely the decomposition and fiber assertions of
    #cite(label("CampanaOrbifolds")) Lemma 10.1, Theorems 10.2–10.3, and Corollary 10.4. ◻
]

== 7 Minimal root covers for reduced boundaries <cyc:section>

For a smooth projective pair of logarithmic Kodaira dimension zero with reduced SNC boundary,
  the minimal cyclic cover has a one-dimensional space of logarithmic pluriforms in every positive degree.
  This strengthens the character-line statement of Proposition 8.
  We prove the refinement together with its exact Hodge and divisorial normalization.
  It gives a pure integral realization of the entire highest line and fixes the normalization used in further
  relative-Iitaka constructions. The normalization lemmas below compare the minimum over actual fiber components
  with the threshold over all divisorial valuations. They show that a zero coefficient of the normalized base
  boundary yields a multiplicity-one component, and that later permitted modifications preserve the complete
  section spaces. These are the additional normalization statements used by the variation companion.

#thm([Lemma 7.1.])[
  (The cyclic cover of a logarithmic Kodaira-zero pair).  #emph[Let $\( J \, D \)$ be a smooth geometrically
    integral projective pair over a field $K$ of characteristic zero.
    Assume that $D$ is reduced and has simple normal crossings and that
    $kappa \( J_(overline(K)) \, K_(J_(overline(K))) + D_(overline(K)) \) = 0$.
    Choose the least positive integer $p$ for which $H^0 \( J \, p \( K_J + D \) \) eq.not 0$,
    a nonzero section $omega$ in that space, and put
$ E = "div" \( omega \) + p D \, wide Delta = D - 1 / p E . $

 Write $omega = b eta^(⊗ p)$ in a rational canonical frame, and let $tau : N arrow.r
   J$ be the normalization in $K \( J \) \[ t \] \/ \( t^p - b \)$.
   Let $rho : tilde(N) arrow.r N$ be a log resolution, and set
$ P = "Supp" \( Delta^(= 1) \) \, wide D_(tilde(N)) = #scale(x: 120%, y: 120%)[\(] \( tau compose rho \)^(- 1) P
  #scale(x: 120%, y: 120%)[\)]_(upright("red")) . $

 Then $N$ is geometrically integral, the rational top form $Omega =
   t tau^(*) eta$ extends logarithmically to $\( tilde(N) \, D_(tilde(N)) \)$, and
$ H^0 #scale(x: 120%, y: 120%)[\(] tilde(N) \, m \( K_(tilde(N)) + D_(tilde(N)) \) #scale(x: 120%, y: 120%)[\)] =
  K thin Omega^m wide \( m gt.eq 1 \) . $

]
] <lem:reduced-cyclic-top>

#proof[
  Every nonzero plurilogarithmic section space on $J$ is one-dimensional:
    two independent sections of one degree would define a nonconstant rational map.
    Consequently $kappa \( E \) = 0$, and every effective integral divisor supported on $E$ also has exactly one
    section, since it is bounded above by a multiple of $E$. These assertions and the minimal index $p$ are
    unchanged by field extension, by flat base change for global sections.
  Over $overline(K) \( J \)$, reducibility of $T^p - b$ would make $b$ an $ell$th power for some prime $ell
    divides p$. The corresponding root of $omega$ would be a nonzero logarithmic pluriform of degree $p \/ ell$,
    since its logarithmic zero divisor is $E \/ ell$. This contradicts minimality. Thus $N$ is geometrically integral.
  At a prime $Q$ of $N$ above a prime $R$ of $J$, write
  $ a = "coeff"_R E \, wide d = "coeff"_R D in { 0 \, 1 } \, wide e = "ord"_Q \( tau^(*) R \) . $
  The ramification formula for top differentials gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ "ord"_Q Omega = frac(e a, p) - e d + e - 1 . $ <eq:cyclic-root-order>]
  If $a = 0$, the cover is unramified at $R$, and this order is $- d$.
    If $a > 0$, then $q = e a \/ p$ is a positive integer: the integrality follows from $t^p =
    b$ and $d in upright(bold(Z))$. The order is $q - 1 gt.eq 0$ when $d = 1$, and $q + e - 1 gt.eq 0$ when $d =
    0$. Thus the divisorial poles are exactly the reduced inverse image $D_N = \( tau^(- 1) P \)_(upright("red"))$.
  We also check extension across the exceptional divisors of $rho$.
    The subpair $\( J \, Delta \)$ is sub-log-canonical and is sub-klt outside $P$.
    Indeed, its positive part is an SNC boundary bounded by $D$,
    with all coefficients strictly below one outside $P$; subtracting an effective divisor cannot worsen
    discrepancies. Define the crepant finite pullback by $K_N + Delta_N = tau^(*) \( K_J + Delta \)$.
    With the compatible canonical trivialization, $Delta_N = - "div" \( Omega \)$.
    For a prime divisor $V$ over $N$, let its restricted valuation on $K \( J \)$ be $e_V v$.
    The same ramification formula gives
  $ 1 + "ord"_V Omega = e_V A_(J \, Delta) \( v \) \, $
  where $A$ denotes log discrepancy. The right-hand side is nonnegative,
    and is positive if the center lies outside $P$. Since the left-hand side is integral,
    $Omega$ has at most a simple pole above $P$ and is regular elsewhere.
    This proves the asserted logarithmic extension.
  Finally let $H_N = "div"_N \( Omega \) + D_N$. Equation (7.1) gives the sharper bound
  $ 0 lt.eq H_N lt.eq tau^(*) E . $
  For completeness, when $a > 0$ and $d = 1$ its coefficient is $q - 1 lt.eq e a$; when $d = 0$, it is $q + e -
    1 lt.eq q + p - 1 lt.eq p q = e a$, because $e lt.eq p$ and $q gt.eq 1$. At $a = 0$ its coefficient is zero.
    Writing a logarithmic $m$-canonical form as $u Omega^m$ and testing its orders at the primes of the finite
    normalization gives
  $ "div"_N \( u \) + m H_N gt.eq 0 \, wide u in H^0 \( N \, cal(O)_N \( m tau^(*) E \) \) . $
  Finite pullback preserves Iitaka dimension, so $kappa \( N \, tau^(*) E \) = kappa \( J \, E \) = 0$.
    Since $tau^(*) E$ is effective and $N$ is geometrically integral, the last space is $K$.
    Conversely $Omega^m$ is a logarithmic pluriform for every $m gt.eq 1$, proving the equality. ◻
]

#thm([Corollary 7.2.])[
  (An integral pure realization of the moduli line).  #emph[Let $x : X arrow.r
    W$ be a projective fibration between smooth complex projective varieties,
    with geometrically integral generic fiber $J$. Let $D_X$ be a reduced SNC boundary whose restriction $D_J$
    satisfies the hypotheses of Lemma 35. Let $M_W$ be the rational Hodge divisor of the rank-one reduction,
    with its rational frame and parabolic orders as in Equation (2.14).
    On sufficiently high smooth models, there is a polarizable integral pure variation of Hodge structures on a
    dense smooth open $W^compose subset W$ whose top nonzero Hodge filtration piece is a line, and
$ M_W tilde.op_(upright(bold(Q))) upright("the rational canonical extension of that line") . $

 In the canonical-bundle-formula normalization, this is the moduli divisor of the auxiliary generic subpair
   $Delta_J = D_J - E_J \/ p$, which may have negative coefficients.]
] <cor:reduced-integral-moduli>

#proof[
  Let $s$ be the minimal-degree logarithmic generator on the generic fiber,
    and choose a rational relative canonical frame $eta$ on $X$.
    The rational function $s \/ eta^(⊗ p)$ defines one cyclic cover over a dense open of $W$,
    not merely a collection of local character covers. Spread its resolution and pole boundary over a smaller
    dense open $W^compose$ so that they form a smooth projective family of SNC pairs.
    Write $r = dim J$, and let $u : tilde(X)^compose \\ D_(tilde(X))^compose arrow.r
    W^compose$ be the complementary open family. Its geometric variation
  $ bb(V)_(upright(bold(Z))) = R^r u_(*) upright(bold(Z)) \/ upright("torsion") $
  is admissible and graded-polarizable. Logarithmic Hodge theory identifies
  $ F^(r + 1) bb(V) = 0 \, wide F^r bb(V)_(cal(O)) = tilde(x)_(*)
    omega_(tilde(X)^compose \/ W^compose) \( D_(tilde(X))^compose \) . $
  Lemma 35 makes this entire top piece a line. Strictness for the weight filtration therefore singles out one
    weight $w$ with
  $ F^r W_(w - 1) bb(V) = 0 \, wide F^r W_w bb(V) = F^r bb(V) \, wide F^r "Gr"_w^W bb(V) tilde.eq F^r bb(V) . $
  The rational variation $"Gr"_w^W bb(V)$ is polarizable. Intersecting its rational weight filtration with
    $bb(V)_(upright(bold(Z)))$ and removing torsion supplies an integral lattice; after rescaling,
    its rational polarization is integral. Thus this pure variation has precisely the required top line.
  After a finite cover making local monodromies unipotent, the canonical extensions have locally free double
    gradeds for the Hodge and weight filtrations. The displayed identification of top lines consequently extends
    across the boundary; see #cite(label("FujinoFujisawa")) Proposition 3.12.
    Descent gives the same identification for their rational canonical extensions.
  The global rational frame of this entire top line is $s^(1 \/ p)$.
    Equation (2.14) computes its parabolic order at every prime divisor $P$ as $beta_P$,
    the order of the same rational frame in $M_W$. Equality of these divisorial orders identifies the rational
    extensions. In particular, it identifies $M_W$ itself, with no additional factor of $p$.
    We check the rank condition for the canonical-bundle-formula comparison.
    On a log resolution $mu : J' arrow.r J$, let $R' = ceil.l A^(*) \( J \, Delta_J \)_(J') ceil.r$,
    where $A^(*)$ omits the log-discrepancy-zero components of the discrepancy divisor.
    The subpair is sub-log-canonical, so $R' gt.eq 0$. At the strict transform of each original prime its
    coefficient is zero if $0 lt.eq Delta_J lt.eq 1$, and is $ceil.l - Delta_J ceil.r$ otherwise.
    Thus $0 lt.eq mu_(*) R' lt.eq E_J$. Testing original primes gives $H^0 \( J' \, cal(O)_(J') \( R' \) \)
    subset.eq H^0 \( J \, cal(O)_J \( E_J \) \) = upright(bold(C)) \( W \)$, and constants give equality.
    This is the required rank-one condition. Extending the generic subpair by $-
    p^(- 1) "div"_(K_(X \/ W)) \( s \)$ makes its log canonical divisor rationally equivalent to $x^(*) K_W$.
    The generic sub-lc, relative triviality, and rank conditions of #cite(label("BFMT")) Definition 6.18 therefore
    hold. Adding a base pullback to normalize vertical orders changes the total base term and the discriminant
    equally, leaving the moduli divisor unchanged.
  The least positive index trivializing $K_J + Delta_J$ is $p$.
    Indeed, a smaller such index $q$ would produce a rational $q$-canonical form with logarithmic zero divisor $q
    E_J \/ p gt.eq 0$, contradicting the minimality of $p$. Thus the cyclic field extension in
    Construction-Definition 6.23 of #cite(label("BFMT")) is the one used above.
  For its boundary comparison, put $P_J = "Supp" \( Delta_J^(= 1) \)$ and first make a common crepant log
    resolution of the auxiliary subpair and its root cover. The coefficient-one support on the crepant model is
    contained in the total inverse image of $P_J$: outside $P_J$ the auxiliary subpair is sub-klt.
    Every additional component allowed by our pole boundary has positive log discrepancy,
    so the ramification discrepancy formula in Lemma 35 makes $Omega$ regular there.
    The top-form space for the BFMT pole boundary therefore injects into the top-form space for our boundary and
    contains $Omega$; both are the line generated by $Omega$.
    After spreading over a common smooth base open, inclusion of the open complements induces a morphism of their
    admissible geometric mixed variations. This morphism is strict for the Hodge and weight filtrations,
    including their limiting filtrations after a finite cover making boundary monodromy unipotent.
    It therefore identifies the top lines in the same pure weight grade.
    Functoriality of canonical extension gives the same identification across the boundary and hence for the
    parabolic rational lines. Theorem 6.28 of #cite(label("BFMT")) now identifies this Hodge divisor with the
    moduli divisor using one common positive multiple on both sides.
    This comparison permits negative coefficients in the generic subpair;
    it does not use the separate semiampleness theorem requiring generic effectiveness. ◻
]

#prodef([Remark 7.3.])[
  The hypothesis that $D$ is reduced is essential to Lemma 35.
    For five distinct points on $upright(bold(P))^1$, the rational boundary $D = 2 /
    5 \( P_1 + dots.h.c + P_5 \)$ satisfies $K_(upright(bold(P))^1) + D tilde.op_(upright(bold(Q))) 0$.
    Its index-five root cover has genus six and empty pole boundary.
    Thus its entire top-form space has dimension six. The refinement therefore applies to reduced boundaries;
    the character-line construction of Section 2.6 is used for general rational orbifold boundaries.
]

=== 7.1 The original relative orders <the-original-relative-orders>

#thm([Lemma 7.4.])[
  (Normalization of the rank-one boundary).  #emph[Let $x : X' arrow.r
    W$ be a projective fibration on smooth models, let $D'$ be an effective reduced SNC divisor,
    and suppose that its geometric generic fiber $\( J \, D_J \)$ has logarithmic Kodaira dimension zero.
    Fix a nonzero relative rational $p$-canonical form $s$ generating $H^0 \( J \, p \( K_J + D_J \) \)$.
    At a prime $P$ of $W$ set
$ a_E = "ord"_E \( x^(*) P \) \, wide r_E = p^(- 1) "ord"_E^(p K_(X' \/ W)) \( s \) \, wide d_E =
  "coeff"_E \( D' \) \, wide t_P = min_(E mapsto P) frac(r_E + d_E, a_E) . $

 Here the minimum is over actual components on the chosen source model.
   Choose that model so that the generator divisor, boundary and inverse image of $P$ have SNC support over the
   generic point of $P$; later source modifications carry strict boundary plus reduced exceptional boundary.
   The coefficients in the rank-one comparison satisfy
$ alpha_P = t_P \, wide beta_P = inf_(E mapsto P) frac(1 + r_E, a_E) - 1 \, wide T_P = 1 - c_P \, quad c_P :=
  inf_(E mapsto P) frac(1 + r_E, a_E) - t_P . $

 The infima allow divisorial valuations on higher smooth source models.
   Equivalently, $c_P$ is the log canonical threshold of $x^(*) P$ for the normalized auxiliary subpair
$ Delta^(upright("aux")) = - p^(- 1) "div"_(K_(X' \/ W)) \( s \) + x^(*) sum_Q t_Q Q . $

 If $T_P = 0$, an actual component attaining $t_P$ has $a_E = 1$, $d_E = 0$, and attains the threshold infimum as well.]
] <lem:rankone-normalization>

#proof[
  Choose a local frame $eta$ of $K_W$ that does not vanish at the generic point of $P$.
    The canonical line-bundle identification
  $ cal(O)_(X') \( p K_(X' \/ W) \) ⊗ x^(*) cal(O)_W \( p K_W \) tilde.eq cal(O)_(X') \( p K_(X') \) $
  identifies the order of $s$ with the order of $s and x^(*) eta^(⊗ p)$.
    Thus the quantity $l_E$ in the rank-one order formula is exactly $r_E$.
    This uses the actual relative canonical line bundle: the Jacobian contribution is already present in $r_E$,
    so no ramification term is added or subtracted here. Consequently its two order formulas give
  $ alpha_P = t_P \, wide beta_P = min_E frac(r_E + 1 - a_E, a_E) . $
  Put
  $ Delta_0 = - p^(- 1) "div"_(K_(X' \/ W)) \( s \) \, wide lambda_P = min_(E mapsto P) frac(1 + r_E, a_E) \, $
  where the minimum is over actual vertical components. The indicated SNC preparation and the generic logarithmic
    bound give $Delta_0$ SNC support and horizontal coefficients at most one.
    In $Delta_0 + lambda_P x^(*) P$, each vertical coefficient is $- r_E + lambda_P a_E lt.eq 1$.
    Thus this subpair is sub-log-canonical over the generic point of $P$,
    and every higher divisorial valuation satisfies
  $ 1 + r_E - lambda_P a_E gt.eq 0 . $
  An actual component attaining $lambda_P$ gives equality. Hence the infimum over all such valuations equals
    $lambda_P$, and $beta_P = lambda_P - 1$.
  For completeness, the first minimum also remains unchanged on higher source models.
    A coefficient realizing $t_P$ makes $t_P a_E - r_E$ no greater than the original boundary coefficient at every
    actual component over $P$. Equivalently, after clearing denominators,
    the normalized generating form satisfies every logarithmic order test over the generic point of $P$.
    Its pullback remains logarithmic with strict plus reduced exceptional boundary.
    No new valuation can lower the first minimum, while an old minimizing valuation persists.
  At any divisorial valuation above the generic point of $P$,
    the crepant coefficient of $Delta^(upright("aux"))$ is $- r_E + a_E t_P$. The threshold formula therefore gives
  $ "lct"_(eta_P) \( X' \, Delta^(upright("aux")) \; x^(*) P \) = inf_E frac(1 + r_E - a_E t_P, a_E) = c_P . $
  Since $T_P = alpha_P - beta_P$, we obtain $T_P = 1 - c_P$.
    Finally, if $T_P = 0$ and $E$ attains the first minimum, then
  $ 1 = c_P lt.eq frac(1 + r_E, a_E) - t_P = frac(1 - d_E, a_E) lt.eq 1 . $
  All terms are equal. Since $a_E$ is a positive integer and $d_E in { 0 \, 1 }$, this forces $a_E = 1$ and $d_E =
    0$, as claimed. ◻
]

#thm([Lemma 7.5.])[
  (Permitted models after normalization).  #emph[Suppose that $\( W \, T \)$ is smooth with effective SNC rational
    boundary and that the moduli divisor $M$ is a rational Cartier divisor on $W$.
    For a smooth modification $mu : W' arrow.r W$, put
$ T' = mu_(*)^(- 1) T + "Exc" \( mu \)_(upright("red")) \, wide M' = mu^(*) M \, $

 and assume the resulting boundary is SNC. Then pullback identifies the section spaces of every sufficiently
   divisible multiple of $K_W + T + M$ and $K_(W') + T' + M'$.
   At unchanged codimension-one points the normalization in Lemma 38 is preserved.
   Every new exceptional prime has coefficient one in $T'$.]
] <lem:normalized-models>

#proof[
  Log canonicity of $\( W \, T \)$ gives
  $ K_(W') + T' + M' = mu^(*) \( K_W + T + M \) + E \, $
  where $E$ is effective and $mu$-exceptional. For divisible $m$, normality gives
  $ mu_(*) cal(O)_(W') \( m E \) = cal(O)_W . $
  The projection formula therefore identifies the section spaces.
    The modification is an isomorphism at each old generic divisorial point,
    so the old local order calculations are unchanged. The final assertion is the definition of $T'$. ◻
]

Appendix 8 gives complementary projective proofs of the section comparisons and further calculations with the
  auxiliary subpair on higher models.

== 8 Supplementary projective calculations <p1logcbfalt:section>

The reduced-boundary construction of Section 7 admits complementary projective proofs and calculations.
  We first give divisorial proofs of the section comparisons and recover the fixed-source descent by extracting
  valuations on the base. The fixed logarithmic zero divisor then gives another discrepancy-sheaf test,
  and a toroidal calculation proves logarithmic extension of the root form.
  The final subsection tracks the auxiliary subpair when the minimum-rule divisor is recomputed on a higher base
  model. This last operation is distinct from the prescribed boundary modification of Lemma 39:
  its discriminant is recomputed, rather than defined as the strict boundary plus the reduced exceptional divisor.
  Throughout these calculations, modifications of the original source carry strict boundary plus reduced
  exceptional boundary.

=== 8.1 Divisorial sections and relative Iitaka systems <divisorial-sections-and-relative-iitaka-systems>

The following elementary comparisons fix the complete systems and the original models used in the normalization.
  All varieties in this subsection are projective over $upright(bold(C))$,
  all rational divisor degrees are sufficiently divisible, and the very general fibers are taken integral.
  The logarithmic modification identity, also with a pulled-back rational twist, is 2.

#thm([Lemma 8.1.])[
  (Divisorial section test).  #emph[Let $V$ be normal and $D$ an integral Weil divisor.
    A rational section belongs to $H^0 \( V \, D \)$ if and only if it satisfies the corresponding order
    inequality at every prime divisor of $V$. If $pi : V' arrow.r
    V$ is finite surjective with $V'$ normal and $D$ is Cartier,
    this test on $V'$ needs only primes lying over prime divisors of $V$. If $pi$ is Galois, then
$ H^0 \( V' \, pi^(*) D \)^("Gal" \( V' \/ V \)) = H^0 \( V \, D \) . $

]
] <p1logcbfalt:section-test>

#proof[
  The first assertion is the description of a rank-one reflexive sheaf as the intersection of its lattices at
    codimension-one points. For a finite morphism between normal varieties,
    a prime divisor upstairs lies over a prime divisor downstairs.
    The last assertion follows from $\( pi_(*) cal(O)_(V') \)^("Gal" \( V' \/ V \)) =
    cal(O)_V$ and the projection formula. ◻
]

#thm([Lemma 8.2.])[
  (Finite pullback).  #emph[If $pi : V' arrow.r V$ is a dominant generically finite morphism of normal projective
    varieties and $D$ is a rational Cartier divisor on $V$, then
$ kappa \( V' \, pi^(*) D \) = kappa \( V \, D \) . $

 If $kappa \( V \, D \) = 0$, every nonzero space $H^0 \( V \, m D \)$ has dimension one.]
] <p1logcbfalt:finite>

#proof[
  Stein factorization reduces the first assertion to a finite morphism,
    since a proper birational morphism onto a normal variety has direct image $cal(O)_V$.
    After replacing $D$ by a multiple, use the natural inclusion of graded section rings
  $ R \( V \, D \) med subset.eq med R \( V' \, pi^(*) D \) . $
  Each homogeneous section upstairs is integral over the ring downstairs.
    Indeed its monic characteristic polynomial in the finite function-field extension has coefficients which are
    rational sections of the appropriate multiples of $D$; they are regular in the required lattices at every
    prime divisor, and hence are global sections by Lemma 40.
    Thus the two nonzero graded rings have the same transcendence degree,
    which gives equality of Iitaka dimensions. If the ring downstairs has no positive-degree section,
    the same norm argument excludes one upstairs. Finally, two independent sections in one degree have a
    nonconstant ratio and define a positive-dimensional rational image. This proves the last assertion. ◻
]

#thm([Lemma 8.3.])[
  (Logarithmic pullback).  #emph[Let $rho : V arrow.r Y$ be a dominant generically finite morphism of smooth
    projective varieties. Let $D_Y$ be a reduced snc divisor,
    and let $B$ be a boundary on $V$ satisfying $B gt.eq \( rho^(*) D_Y \)_(upright("red"))$.
    Assume that the boundary supports on the chosen models are snc. Then pullback of rational pluricanonical forms gives
$ H^0 \( Y \, m \( K_Y + D_Y \) \) med arrow.r med H^0 \( V \, m \( K_V + B \) \) $

 injectively, for divisible $m$.]
] <p1logcbfalt:log-pullback>

#proof[
  A logarithmic differential on a smooth snc pair pulls back to a logarithmic differential along the reduced
    inverse image. In local coordinates this follows from $d \( rho^(*) z \) \/ rho^(*) z$,
    whose divisorial poles are simple. Taking top exterior powers and then tensor powers proves the order
    inequalities. Equivalently, at a prime of ramification index $e$ over a boundary component,
    the Jacobian contributes $e - 1$, and the coefficient-one boundary supplies the remaining one.
    At exceptional-image primes the same logarithmic differential calculation applies.
    Injectivity follows from dominance and separability. ◻
]

#thm([Lemma 8.4.])[
  (Relative Iitaka fibration).  #emph[Let $p : V arrow.r B$ be a dominant projective morphism,
    with $V$ smooth projective, and let $D$ be a rational divisor whose restriction to the geometric generic fiber
    has Iitaka dimension $k gt.eq 0$. After birational modifications there is a relative Iitaka fibration
$ V' arrow.r^q U arrow.r B $

 in which $q$ has geometrically connected generic fiber, such that
$ dim U - dim B = k \, wide kappa \( G \, D' \|_G \) = 0 $

 for a very general fiber $G$ of $q$. Here $D' = mu^(*) D$, where $mu : V' arrow.r V$ is the modification.
   When $D = K_V + B_V$, one may instead take the full log divisor from Lemma 2.]
  #emph[If $D' = K_(V') + B_(V')$ and the models are log smooth, then $D' \|_G tilde.op_(upright(bold(Q))) K_G + B_G$.]
] <p1logcbfalt:iitaka>

#proof[
  Apply the Iitaka fibration theorem over the function field of $B$ #cite(label("IitakaOriginal")) Section 6,
    Remark 1, take the relative algebraic closure of its section field in $upright(bold(C)) \( V \)$,
    and spread out. Resolve the resulting rational maps and take their Stein factorizations.
    The dimension of the relative section field is $k$; the restriction of the full divisor to the Iitaka fiber
    has Iitaka dimension zero by the Iitaka fibration theorem.
    For the logarithmic replacement, the proof of Lemma 2 gives the sheaf identity
  $ mu_(*) cal(O)_(V') #scale(x: 120%, y: 120%)[\(] m \( K_(V') + B_(V') \) #scale(x: 120%, y: 120%)[\)] =
    cal(O)_V #scale(x: 120%, y: 120%)[\(] m \( K_V + B_V \) #scale(x: 120%, y: 120%)[\)] $
  in every sufficiently divisible degree. Pushing to the original base identifies the relative section systems,
    even if there are no global sections. Apply the same full-divisor Iitaka theorem to the replacement divisor;
    its relative section field identifies its fibration with the one already constructed and gives the asserted
    Iitaka dimension zero on the fiber. Generic smoothness and adjunction give the last assertion.
    The dimensions at very general complex fibers agree with the geometric generic values:
    for each divisible degree use cohomology and base change,
    and remove the union of the exceptional closed sets over the countably many degrees. ◻
]

#thm([Lemma 8.5.])[
  (Easy addition).  #emph[Let $p : V arrow.r B$ be dominant and projective,
    with $V$ smooth projective and integral very general fiber $G$, and let $D$ be a rational divisor on $V$. Then
$ kappa \( V \, D \) lt.eq dim B + kappa \( G \, D \|_G \) . $

 If $D$ has a nonzero global section, its restriction to a general fiber is nonzero.]
] <p1logcbfalt:easy-addition>

#proof[
  A nonzero section cannot vanish identically on all fibers over a dense open subset.
    For each divisible $m$ with sections, let $phi.alt_m$ be its rational map.
    The image of $\( p \, phi.alt_m \)$ has dimension at most $dim B + kappa \( G \, D \|_G \)$,
    and dominates the image of $phi.alt_m$. Taking the maximum over $m$ proves the inequality.
    If the fiber term is $- oo$, the last assertion implies that the total term is $- oo$ as well. ◻
]

=== 8.2 Restricted valuations and the fixed original source <restricted-valuations-and-the-fixed-original-source>

Let $p : H arrow.r I$ be a dominant morphism of smooth projective varieties, and fix the model $H$.
  A divisorial valuation $v$ of $upright(bold(C)) \( H \)$ whose restriction to $upright(bold(C)) \( I \)$ is
  nontrivial restricts to a positive integral multiple of a divisorial valuation of $upright(bold(C)) \( I \)$.
  To see this, put $n = dim H$, $m = dim I$, and denote the restricted valuation by $w$.
  The value groups have rational rank one with finite-index inclusion.
  The relative residue-transcendence-degree inequality gives

$ "trdeg"_(kappa \( w \)) kappa \( v \) lt.eq n - m . $

As $"trdeg"_(upright(bold(C))) kappa \( v \) = n - 1$, this implies $"trdeg"_(upright(bold(C))) kappa \( w \)
  gt.eq m - 1$. The Abhyankar inequality gives the reverse inequality. Thus $w$ is divisorial.
  Finitely many such restrictions can be extracted on one smooth projective birational model of $I$.

Only finitely many prime divisors of the fixed $H$ have image of codimension at least two in $I$:
  they lie in the complement of a locus where $p$ is smooth and are components of its divisorial part.
  Extract their restrictions as above. Original horizontal primes remain horizontal,
  while original vertical primes then have divisorial centers on the prepared base.
  These centers remain divisorial on higher base models. Hence on any subsequent commuting birational diagram,
  a source prime whose base image still has codimension at least two is exceptional over the fixed $H$.

For the rank-one section comparison, fix the original smooth pair $\( X \, D_X \)$, and let $X' arrow.r
  X$ carry strict plus reduced exceptional boundary $D'$. Let $x : X' arrow.r
  W$ be the relative Iitaka fibration on smooth projective models;
  its geometric generic fiber $\( J \, D_J \)$ has logarithmic Kodaira dimension zero.
  Let $s$ be a nonzero relative rational $p$-canonical form generating the degree-$p$ generic section space.
  For a source prime $E$, put $d_E = "coeff"_E D'$, and for a base prime $P$ define

$ t_P = min_(E mapsto P) frac(p^(- 1) "ord"_E^(p K_(X' \/ W)) \( s \) + d_E, "ord"_E \( x^(*) P \)) \, wide T_W =
  sum_P t_P P . $

Here $T_W$ is the entire minimum-rule base term, before its division into discriminant and moduli parts.
  In divisible degrees, division by $s^(m \/ p)$ gives

#[#set math.equation(numbering: n => "(8.1)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] X' \, m \( K_(X') + D' \) #scale(x: 120%, y: 120%)[\)] arrow.r.hook H^0
   #scale(x: 120%, y: 120%)[\(] W \, m \( K_W + T_W \) #scale(x: 120%, y: 120%)[\)] . $ <p1logcbfalt:source-descent>]

Indeed, on the geometric generic fiber the section is a constant multiple of $s^(m \/ p)$;
  connectedness identifies that coefficient with a rational $m$-canonical form $sigma$ on $W$.
  At a component $E$ dominating $P$, write $sigma$ in a nonvanishing local frame of $m K_W$, and put $a_E =
  "ord"_E \( x^(*) P \)$. Its logarithmic regularity upstairs is equivalent to

$ a_E "ord"_P \( sigma \) + \( m \/ p \) "ord"_E^(p K_(X' \/ W)) \( s \) + m d_E gt.eq 0 . $

The inequalities for all components above $P$ are exactly $"ord"_P \( sigma \) + m t_P gt.eq 0$.
  Horizontal primes impose no further condition because $s$ is an allowed generic logarithmic pluriform.
  The same argument works over the generic point of the original base $Y$.
  If the relative Iitaka dimension is $k$, then $dim \( W \/ Y \) = k$,
  so preservation of section ratios makes $K_W + T_W$ big over $Y$.

For the converse, extract on $W$ the restrictions of all source divisors with exceptional image that survive as
  divisors on the original $X$. Resolve the induced diagram and recompute the minimum rule.
  Every divisor of the original $X$ is now tested either by the generic horizontal condition or by a base prime.
  A section on the right of (8.1), multiplied by $s^(m \/ p)$,
  therefore satisfies the logarithmic order inequality at every original source prime.
  Any remaining untested pole lies on a divisor exceptional over $X$.
  The codimension-one criterion on the normal original source gives a section of $m \( K_X + D_X \)$;
  later models preserve this criterion. Conversely the logarithmic modification identity recovers its section on
  $X'$. The identifications respect powers and multiplication.
  Under these identifications, corresponding section ratios agree after pullback by $x : X' arrow.r W$.
  Their section fields and rational-map image dimensions therefore agree.

=== 8.3 The fixed zero divisor and the discrepancy-sheaf test <the-fixed-zero-divisor-and-the-discrepancy-sheaf-test>

In the notation of Lemma 35, the rational divisor $Z = E \/
  p$ is independent of the chosen nonzero logarithmic pluriform and its degree.
  Indeed, if $omega_m$ is a nonzero section in another degree $m$,
  the degree-$m p$ sections $omega_m^p$ and $omega^m$ are proportional,
  since that section space is one-dimensional. Consequently

$ p #scale(x: 120%, y: 120%)[\(] "div" \( omega_m \) + m D #scale(x: 120%, y: 120%)[\)] = m E . $

The least positive integer trivializing $K_J + D - Z$ is also $p$.
  Writing $omega = b eta^(⊗ p)$ in a rational canonical frame gives $p \( K_J + D - Z \) = - "div" \( b \)$.
  Conversely, a trivialization of $r \( K_J + D - Z \)$ gives a rational $r$-canonical form whose logarithmic zero
  divisor is $r Z gt.eq 0$, hence a nonzero logarithmic pluriform of degree $r$. Minimality gives $r gt.eq p$.

Here is a second way to check the generic discrepancy-sheaf rank condition in Corollary 36.
  Take a log resolution $J' arrow.r J$, let $D_(J')$ be the strict boundary plus the reduced exceptional divisor,
  and put

$ E_(J') = "div" \( omega \|_(J') \) + p D_(J') gt.eq 0 . $

The crepant transform of the auxiliary generic subboundary is $D_(J') - E_(J') \/ p$.
  Its coefficients are at most one. If $A^(*)$ is the discrepancy b-divisor with coefficient $-
  1$ replaced by zero, the rounded trace is effective, and a positive coefficient can occur only on $"Supp"
  E_(J')$. Coefficientwise,

$ 0 lt.eq ceil.l A^(*) ceil.r_(J') lt.eq ceil.l E_(J') \/ p ceil.r lt.eq E_(J') . $

The first inequality uses the omission of discrepancy $- 1$.
  Logarithmic birational invariance gives $kappa \( E_(J') \) = 0$.
  The associated space of rational functions therefore has dimension at most one and contains the constants.
  This proves rank one on every sufficiently high resolution,
  including when the auxiliary subboundary has negative coefficients.

=== 8.4 A toroidal proof of logarithmic extension <a-toroidal-proof-of-logarithmic-extension>

The extension part of Lemma 35 also has a direct coordinate proof on a toroidal resolution of the SNC cyclic-cover
  construction. First resolve the supports on $J$, retaining strict plus reduced exceptional logarithmic boundary.
  The minimal index and the fixed-zero assertions are unchanged. In a local SNC chart write

$ omega = epsilon product_i z_i^(a_i - p d_i) \( d z_1 and dots.h.c and d z_r \)^(⊗ p) \, wide a_i gt.eq 0 \, quad
  d_i in { 0 \, 1 } \, $

where $epsilon$ is a unit. Include all coordinates; outside $D + "Supp" E$ put $d_i = a_i = 0$.
  After a local unramified change the unit has a root and contributes no divisorial order.
  Let $v$ be a toroidal prime on the resolved root cover, and put $n_i = v \( z_i \) gt.eq 0$.
  The nonzero ray defining this prime has at least one positive $n_i$. Rewriting with logarithmic differentials gives

#[#set math.equation(numbering: n => "(8.2)")
 $ "ord"_v \( Omega \) = sum_i n_i (1 - d_i + a_i / p) - 1 . $ <p1logcbfalt:toroidal-root-order>]

The logarithmic volume form has order $- 1$ along a toroidal prime,
  and the change of torus lattice multiplies it by a nonzero constant.
  Every coefficient in the sum is nonnegative. It vanishes exactly when $d_i = 1$ and $a_i = 0$,
  namely along the coefficient-one pole boundary of the auxiliary subpair.

If $v$ is outside the inverse image of this pole boundary, then $n_i = 0$ for each such zero coefficient.
  Some remaining $n_i$ is positive, so the sum in (8.2) is strictly positive.
  The order of the rational top form $Omega$ is integral, so that positive sum is at least one, giving regularity.
  On the inverse pole boundary the nonnegative sum gives order at least $- 1$.
  Primes in the smooth unramified locus have the regularity already checked on the finite normalization.
  Thus $Omega$ extends as a top form with logarithmic poles allowed only along the inverse pole boundary.
  This provides the coordinate alternative to the discrepancy-scaling proof.

=== 8.5 The normalized discriminant on higher models <the-normalized-discriminant-on-higher-models>

Let $x : X' arrow.r W$ and $D'$ be the projective reduced-boundary data of Lemma 38.
  Write $s$ for its relative rational $p$-canonical generator, and set

$ t_P = min_(E mapsto P) frac(p^(- 1) "ord"_E^(p K_(X' \/ W)) \( s \) + d_E, "ord"_E \( x^(*) P \)) \, wide T_W =
  sum_P t_P P \, $

$ Delta_0 = - p^(- 1) "div"_(K_(X' \/ W)) \( s \) \, wide Delta = Delta_0 + x^(*) T_W . $

In this subsection $T_W$ denotes the entire minimum-rule base term,
  before its decomposition into discriminant and moduli parts;
  the boundary denoted $T$ in Section 2.6 is the discriminant part.
  We have $K_(X') + Delta tilde.op_(upright(bold(Q))) x^(*) \( K_W + T_W \)$.
  The auxiliary divisor is required to be sub-lc over the generic point of $W$.
  Its coefficients at source divisors with image of codimension at least two are not asserted to be at most one.

For a prime $P subset W$, let

$ c_P = "lct"_(eta_P) \( X' \, Delta \; x^(*) P \) \, wide b_P = 1 - c_P \, wide B_W = sum_P b_P P . $

Over the generic point of $P$ the minimum rule gives $Delta lt.eq D'$, including the horizontal divisors.
  Log canonicity therefore gives $c_P gt.eq 0$. A component $E$ attaining the minimum has coefficient exactly $d_E
  in { 0 \, 1 }$ in $Delta$, and hence

$ c_P lt.eq frac(1 - d_E, "ord"_E \( x^(*) P \)) lt.eq 1 . $

It follows that $0 lt.eq B_W lt.eq 1$. If $P$ lies in a required inverse boundary from a base $Y$,
  all components over $P$ have $d_E = 1$, so $c_P = 0$ and $b_P = 1$.

For the exact model comparison, let $beta : W_1 arrow.r W_0$ be a higher smooth base model and let $pi :
  X_1 arrow.r X_0$ resolve the induced diagram, with $x_i : X_i arrow.r W_i$.
  Choose compatible rational top forms for the canonical divisors. First form the crepant transform

$ K_(X_1) + Delta_(upright("crepant")) = pi^(*) \( K_(X_0) + Delta_(upright("old")) \) . $

Using the new logarithmic boundary and the same relative trivialization $s$,
  recompute the minimum-rule divisor $T_(W_1)$ and the normalized auxiliary divisor $Delta_(upright("new"))$.
  Comparison of their definitions gives

#[#set math.equation(numbering: n => "(8.3)")
 $ Q & = K_(W_1) + T_(W_1) - beta^(*) \( K_(W_0) + T_(W_0) \) \,\
Delta_(upright("new")) & = Delta_(upright("crepant")) + x_1^(*) Q . $ <p1logcbfalt:model-twist>]

Thus the twist includes the canonical discrepancy of the base.
  Adding $x^(*) Q$ lowers the threshold at $P$ by $"coeff"_P Q$,
  adding $Q$ both to the discriminant and to the total base term. It leaves the moduli part unchanged.
  Birational pullback of the lc-trivial fibration also preserves its moduli b-divisor;
  these compatibilities agree with the Hodge extension description in #cite(label("BFMT")) Remarks 6.22 and 6.25.

Resolve the finite supports on $W$ and resolve the induced source diagram.
  At an unchanged codimension-one point, logarithmic forms satisfying the old tests remain logarithmic on the
  source resolution, while the strict old minimizing components persist.
  Thus the minimum and discriminant trace there are unchanged.
  New support is contained in the base-exceptional divisor.
  Its union with the old strict support is SNC on the chosen resolution;
  recomputing and applying the preceding coefficient argument yields an effective SNC discriminant with the same
  coefficient-one inverse boundary and the same moduli b-divisor.

Finally, if $m = a p$ and $s_m = c s^a$ on the generic fiber, with $c in upright(bold(C)) \( W \)^(*)$,
  the minimum construction gives

$ T_W \( s_m \) = T_W \( s \) + m^(- 1) "div" \( c \) . $

The two occurrences of $"div" \( c \)$ cancel in the definition of the normalized auxiliary subpair.
  It is unchanged. The minimal-index cover is therefore compatible with all common divisible degrees used for
  section descent.

#heading(level: 1)[References]
#bibitem([1])[Karim Adiprasito, Gaku Liu and Michael Temkin.
  #emph[#link("https://arxiv.org/abs/1810.03131v2")[Semistable reduction in characteristic 0]]. Preprint, 2019.
  #link("https://arxiv.org/abs/1810.03131v2")[arXiv:1810.03131v2], 17 June 2019; 22-page full preprint.]
#bibitem([2])[Florin Ambro. #emph[#link("https://arxiv.org/abs/math/0210271v1")[Shokurov's boundary property]].
  Journal of Differential Geometry #strong[67] (2004), no.~2, 229--255.
  Theorem numbering is cited from arXiv:math/0210271v1.]
#bibitem([3])[Florin Ambro. #emph[#link("https://doi.org/10.1112/S0010437X04001071")[The moduli b-divisor of an
  lc-trivial fibration]]. Compositio Mathematica #strong[141] (2005), no.~2, 385--403.
  #link("https://doi.org/10.1112/S0010437X04001071")[doi:`10.1112/S0010437X04001071`].]
#bibitem([4])[Yves André. #emph[#link("https://www.numdam.org/item/CM_1992__82_1_1_0/")[Mumford--Tate groups of
  mixed Hodge structures and the theorem of the fixed part]]. Compositio Mathematica #strong[82] (1992), no.~1, 1--24.]
#bibitem([5])[Benjamin Bakker. #emph[#link("https://benjamin-bakker.github.io/matsushita.pdf")[A short proof of a
  conjecture of Matsushita]]. Advances in Mathematics #strong[482] (2025), 110554.
  #link("https://doi.org/10.1016/j.aim.2025.110554")[doi:`10.1016/j.aim.2025.110554`]. Part A.]
#bibitem([6])[Benjamin Bakker, Yohan Brunebarbe and Jacob Tsimerman.
  #emph[#link("https://arxiv.org/abs/1811.12230v3")[o-minimal GAGA and a conjecture of Griffiths]].
  Inventiones Mathematicae #strong[232] (2023), no.~1, 163--228.
  #link("https://doi.org/10.1007/s00222-022-01166-1")[doi:`10.1007/s00222-022-01166-1`].
  Theorem locators refer to arXiv:1811.12230v3, 23 October 2022.]
#bibitem([7])[Benjamin Bakker, Stefano Filipazzi, Mirko Mauri and Jacob Tsimerman.
  #emph[#link("https://arxiv.org/abs/2508.19215v2")[Baily--Borel compactifications of period images and the
  b-semiampleness conjecture]]. Preprint, 2025. #link("https://arxiv.org/abs/2508.19215v2")[arXiv:2508.19215v2],
  18 December 2025.]
#bibitem([8])[Benjamin Bakker and Jacob Tsimerman. #emph[#link("https://arxiv.org/abs/1712.05088v1")[The
  Ax--Schanuel conjecture for variations of Hodge structures]].
  Inventiones Mathematicae #strong[217] (2019), no.~1, 77--94.
  #link("https://doi.org/10.1007/s00222-019-00863-8")[doi:`10.1007/s00222-019-00863-8`].
  The cited locators refer to #link("https://arxiv.org/abs/1712.05088v1")[arXiv:1712.05088v1].]
#bibitem([9])[Edward Bierstone and Pierre D. Milman.
  #emph[#link("https://ems.press/journals/prims/articles/2154")[Functoriality in resolution of singularities]].
  Publications of the Research Institute for Mathematical Sciences #strong[44] (2008), no.~2, 609--639.
  #link("https://doi.org/10.2977/PRIMS/1210167338")[doi:`10.2977/PRIMS/1210167338`].]
#bibitem([10])[Caucher Birkar. #emph[#link("https://arxiv.org/abs/0806.4413")[The Iitaka conjecture $C_(n \, m)$
  in dimension six]]. Compositio Mathematica #strong[145] (2009), no.~6, 1442--1446.
  #link("https://doi.org/10.1112/S0010437X09004187")[doi:`10.1112/S0010437X09004187`].
  arXiv:0806.4413, first posted 27 June 2008.]
#bibitem([11])[Caucher Birkar, Paolo Cascini, Christopher D. Hacon and James McKernan.
  #emph[#link("https://arxiv.org/abs/math/0610203v2")[Existence of minimal models for varieties of log general
  type]]. Journal of the American Mathematical Society #strong[23] (2010), no.~2, 405--468.
  #link("https://doi.org/10.1090/S0894-0347-09-00649-3")[doi:`10.1090/S0894-0347-09-00649-3`].
  The cited locators refer to the 81-page #link("https://arxiv.org/abs/math/0610203v2")[arXiv:math/0610203v2].]
#bibitem([12])[Sébastien Boucksom. #emph[#link("https://arxiv.org/abs/math/0201031v1")[On the volume of a line
  bundle]]. International Journal of Mathematics #strong[13] (2002), no.~10, 1043--1063.
  #link("https://doi.org/10.1142/S0129167X02001575")[doi:`10.1142/S0129167X02001575`].
  Theorem locators refer to arXiv:math/0201031v1, 5 January 2002.]
#bibitem([13])[Sébastien Boucksom, Philippe Eyssidieux, Vincent Guedj and Ahmed Zeriahi.
  #emph[#link("https://www.math.univ-toulouse.fr/~guedj/fichierspdf/BEGZ10.pdf")[Monge--Ampère equations in big
  cohomology classes]]. Acta Mathematica #strong[205] (2010), 199--262.
  #link("https://doi.org/10.1007/s11511-010-0054-7")[doi:`10.1007/s11511-010-0054-7`].]
#bibitem([14])[Yohan Brunebarbe and Benoît Cadorel.
  #emph[#link("https://arxiv.org/abs/1707.01327v1")[Hyperbolicity of varieties supporting a variation of Hodge
  structure]]. International Mathematics Research Notices #strong[2020] (2020), no.~6, 1601--1609.
  #link("https://doi.org/10.1093/imrn/rny054")[doi:`10.1093/imrn/rny054`].
  The cited locators refer to #link("https://arxiv.org/abs/1707.01327v1")[arXiv:1707.01327v1].]
#bibitem([15])[Frédéric Campana. #emph[#link("https://www.numdam.org/item/10.5802/aif.2027/")[Orbifolds,
  special varieties and classification theory]]. Annales de l'Institut Fourier #strong[54] (2004), no.~3,
  499--630. #link("https://doi.org/10.5802/aif.2027")[doi:`10.5802/aif.2027`].]
#bibitem([16])[Frédéric Campana. #emph[#link("https://arxiv.org/abs/0705.0737v8")[Orbifoldes géométriques
  spéciales et classification biméromorphe des variétés kählériennes compactes]].
  Journal of the Institute of Mathematics of Jussieu #strong[10] (2011), no.~4, 809--934.
  #link("https://doi.org/10.1017/S1474748010000101")[doi:`10.1017/S1474748010000101`].
  The cited locators refer to #link("https://arxiv.org/abs/0705.0737v8")[arXiv:0705.0737v8].]
#bibitem([17])[Junyan Cao. #emph[#link("https://content.algebraicgeometry.nl/2018-6/2018-6-020.pdf")[Kodaira
  dimension of algebraic fiber spaces over surfaces]]. Algebraic Geometry #strong[5] (2018), no.~6, 728--741.
  #link("https://doi.org/10.14231/AG-2018-020")[doi:`10.14231/AG-2018-020`].]
#bibitem([18])[Junyan Cao and Mihai Păun. #emph[#link("https://arxiv.org/abs/1504.01095v3")[Kodaira dimension of
  algebraic fiber spaces over abelian varieties]]. Inventiones Mathematicae #strong[207] (2017), no.~1, 345--387.
  #link("https://doi.org/10.1007/s00222-016-0672-6")[doi:`10.1007/s00222-016-0672-6`].
  Theorem locators refer to arXiv:1504.01095v3, submitted 3 August 2016.]
#bibitem([19])[Eduardo Cattani, Aroldo Kaplan and Wilfried Schmid.
  #emph[#link("https://annals.math.princeton.edu/1986/123-3/p02")[Degeneration of Hodge structures]].
  Annals of Mathematics (2) #strong[123] (1986), no.~3, 457--535.
  #link("https://doi.org/10.2307/1971333")[doi:`10.2307/1971333`].]
#bibitem([20])[Qianyu Chen. #emph[#link("https://qymath.github.io/Steenbrink.pdf")[Limits of Hodge structures via
  holonomic $D$-modules]]. Preprint, 2021. arXiv:2103.03983;
  the cited Lemma 8.1 is in the #link("https://qymath.github.io/Steenbrink.pdf")[61-page author manuscript].]
#bibitem([21])[Pierre Deligne. #emph[Théorie de Hodge. II].
  Publications Mathématiques de l'IHÉS #strong[40] (1971), 5--57.
  #link("https://doi.org/10.1007/BF02684692")[doi:`10.1007/BF02684692`].]
#bibitem([22])[Jean-Pierre Demailly.
  #emph[#link("https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/regularization.pdf")[Regularization
  of closed positive currents and intersection theory]]. Journal of Algebraic Geometry #strong[1] (1992), no.~3,
  361--409.
  The cited locator refers to the
  #link("https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/regularization.pdf")[author manuscript].]
#bibitem([23])[Jean-Pierre Demailly and Mihai Păun.
  #emph[#link("https://annals.math.princeton.edu/2004/159-3/p05")[Numerical characterization of the Kähler cone of
  a compact Kähler manifold]]. Annals of Mathematics (2) #strong[159] (2004), no.~3, 1247--1274.
  #link("https://doi.org/10.4007/annals.2004.159.1247")[doi:`10.4007/annals.2004.159.1247`].]
#bibitem([24])[Adrien Douady. #emph[#link("https://www.numdam.org/item/AIF_1966__16_1_1_0/")[Le problème des
  modules pour les sous-espaces analytiques compacts d'un espace analytique donné]].
  Annales de l'Institut Fourier #strong[16] (1966), no.~1, 1--95.
  #link("https://doi.org/10.5802/aif.226")[doi:`10.5802/aif.226`].]
#bibitem([25])[Makoto Enokizono and Kenta Hashizume. #emph[#link("https://arxiv.org/abs/2404.05124v3")[Semistable
  reduction for complex analytic spaces]]. Transactions of the American Mathematical Society #strong[378] (2025),
  7667--7688. #link("https://doi.org/10.1090/tran/9365")[doi:`10.1090/tran/9365`].
  The cited locators refer to #link("https://arxiv.org/abs/2404.05124v3")[arXiv:2404.05124v3], 12 October 2024.]
#bibitem([26])[Akira Fujiki. #emph[#link("https://ems.press/content/serial-article-files/41937")[Closedness of the
  Douady spaces of compact Kähler spaces]]. Publications of the Research Institute for Mathematical Sciences
  #strong[14] (1978), no.~1, 1--52. #link("https://doi.org/10.2977/PRIMS/1195189279")[doi:`10.2977/PRIMS/1195189279`].]
#bibitem([27])[Osamu Fujino. #emph[#link("https://www.math.kyoto-u.ac.jp/~fujino/weak-posi11.pdf")[Notes on the
  weak positivity theorems]]. In #emph[Algebraic Varieties and Automorphism Groups].
  Advanced Studies in Pure Mathematics 75. Mathematical Society of Japan, 2017, pp.~73--118.
  #link("https://doi.org/10.2969/aspm/07510073")[doi:`10.2969/aspm/07510073`].
  The cited locators refer to #link("https://www.math.kyoto-u.ac.jp/~fujino/weak-posi11.pdf")[author version 0.54,
  30 June 2015].]
#bibitem([28])[Osamu Fujino.
  #emph[#link("https://www.math.kyoto-u.ac.jp/~fujino/on-inversion-of-adjunction-pja-final.pdf")[Log canonical
  inversion of adjunction]]. Proceedings of the Japan Academy, Series A,
  Mathematical Sciences #strong[100] (2024), no.~2, 7--11.
  #link("https://doi.org/10.3792/PJAA.100.002")[doi:`10.3792/PJAA.100.002`].]
#bibitem([29])[Osamu Fujino and Taro Fujisawa.
  #emph[#link("https://ems.press/content/serial-article-files/41240")[Variations of mixed Hodge structure and
  semipositivity theorems]]. Publications of the Research Institute for Mathematical Sciences #strong[50] (2014),
  no.~4, 589--661. #link("https://doi.org/10.4171/PRIMS/145")[doi:`10.4171/PRIMS/145`].]
#bibitem([30])[Osamu Fujino and Taro Fujisawa.
  #emph[#link("https://www.math.kyoto-u.ac.jp/~fujino/vmhs-applications8.pdf")[Variation of mixed Hodge structure
  and its applications]]. International Journal of Mathematics #strong[36] (2025), no.~9, 2550020.
  Published article: 43 pp.; theorem locators refer to the 36-page
  #link("https://www.math.kyoto-u.ac.jp/~fujino/vmhs-applications8.pdf")[author version 0.55, 11 March 2025].]
#bibitem([31])[Osamu Fujino and Yoshinori Gongyo.
  #emph[#link("https://www.numdam.org/item/10.5802/aif.2894.pdf")[On the moduli b-divisors of lc-trivial
  fibrations]]. Annales de l'Institut Fourier #strong[64] (2014), no.~4, 1721--1735.
  #link("https://doi.org/10.5802/aif.2894")[doi:`10.5802/aif.2894`].]
#bibitem([32])[Osamu Fujino and Shigefumi Mori.
  #emph[#link("https://www.math.kyoto-u.ac.jp/~fujino/Canonical.pdf")[A canonical bundle formula]].
  Journal of Differential Geometry #strong[56] (2000), no.~1, 167--188.]
#bibitem([33])[Hans Grauert. #emph[#link("https://www.numdam.org/item/PMIHES_1960__5__5_0/")[Ein Theorem der
  analytischen Garbentheorie und die Modulräume komplexer Strukturen]].
  Publications Mathématiques de l'IHÉS #strong[5] (1960), 5--64.
  #link("https://doi.org/10.1007/BF02684746")[doi:`10.1007/BF02684746`]. With corrigendum, Publ. Math.
  IHÉS 16 (1963), 35--36.]
#bibitem([34])[Hans Grauert. #emph[#link("https://www.numdam.org/articles/10.1007/BF02684291/")[Berichtigung:
  Ein Theorem der analytischen Garbentheorie und die Modulräume komplexer Strukturen]].
  Publications Mathématiques de l'IHÉS #strong[16] (1963), 35--36.
  #link("https://doi.org/10.1007/BF02684291")[doi:`10.1007/BF02684291`].]
#bibitem([35])[Phillip A. Griffiths. #emph[#link("https://www.numdam.org/item/PMIHES_1970__38__125_0/")[Periods of
  integrals on algebraic manifolds, III: Some global differential-geometric properties of the period mapping]].
  Publications Mathématiques de l'IHÉS #strong[38] (1970), 125--180.
  #link("https://doi.org/10.1007/BF02684654")[doi:`10.1007/BF02684654`].]
#bibitem([36])[Vincent Guedj and Ahmed Zeriahi. #emph[#link("https://arxiv.org/abs/math/0612630v2")[The weighted
  Monge--Ampère energy of quasiplurisubharmonic functions]].
  Journal of Functional Analysis #strong[250] (2007), no.~2, 442--482.
  #link("https://doi.org/10.1016/j.jfa.2007.04.018")[doi:`10.1016/j.jfa.2007.04.018`].
  The cited locators refer to #link("https://arxiv.org/abs/math/0612630v2")[arXiv:math/0612630v2].]
#bibitem([37])[Christopher D. Hacon, Mihnea Popa and Christian Schnell.
  #emph[#link("https://people.math.harvard.edu/~mpopa/papers/HPS.pdf")[Algebraic fiber spaces over abelian
  varieties: around a recent theorem by Cao and Păun]]. In #emph[Local and Global Methods in Algebraic Geometry].
  Contemporary Mathematics 712. American Mathematical Society, Providence, RI, 2018, pp.~143--195.
  #link("https://doi.org/10.1090/conm/712/14346")[doi:`10.1090/conm/712/14346`].
  Theorem locators refer to the author manuscript dated 9 May 2017.]
#bibitem([38])[Kenta Hashizume. #emph[#link("https://arxiv.org/abs/1902.10923v2")[Log Iitaka conjecture for
  abundant log canonical fibrations]]. Proceedings of the Japan Academy, Series A,
  Mathematical Sciences #strong[96] (2020), no.~10, 87--92.
  #link("https://doi.org/10.3792/pjaa.96.017")[doi:`10.3792/pjaa.96.017`].
  Theorem numbering is cited from arXiv:1902.10923v2.]
#bibitem([39])[Heisuke Hironaka. #emph[#link("https://doi.org/10.2307/2373721")[Flattening theorem in
  complex-analytic geometry]]. American Journal of Mathematics #strong[97] (1975), no.~2, 503--547.
  #link("https://doi.org/10.2307/2373721")[doi:`10.2307/2373721`].]
#bibitem([40])[Shigeru Iitaka.
  #emph[#link("https://www.jstage.jst.go.jp/article/jmath1948/23/2/23_2_356/_article")[On $D$-dimensions of
  algebraic varieties]]. Journal of the Mathematical Society of Japan #strong[23] (1971), no.~2, 356--373.
  #link("https://doi.org/10.2969/jmsj/02320356")[doi:`10.2969/jmsj/02320356`].]
#bibitem([41])[Shigeru Iitaka. #emph[#link("https://doi.org/10.1017/CBO9780511569197.014")[On logarithmic Kodaira
  dimension of algebraic varieties]]. In #emph[Complex Analysis and Algebraic Geometry:
  A Collection of Papers Dedicated to K. Kodaira]. Walter L. Baily, Jr. and Tetsuji Shioda (eds.).
  Iwanami Shoten and Cambridge University Press, 1977.
  #link("https://doi.org/10.1017/CBO9780511569197.014")[doi:`10.1017/CBO9780511569197.014`].]
#bibitem([42])[Shigeru Iitaka.
  #emph[#link("https://www.jstage.jst.go.jp/article/pjab1945/53/3/53_3_103/_pdf")[Classification of Algebraic
  Varieties]]. Proceedings of the Japan Academy #strong[53] (1977), no.~3, 103--105.
  #link("https://doi.org/10.3792/pja/1195517881")[doi:`10.3792/pja/1195517881`].]
#bibitem([43])[Yujiro Kawamata. #emph[#link("https://link.springer.com/article/10.1007/BF01404756")[Kodaira
  dimension of algebraic fiber spaces over curves]]. Inventiones Mathematicae #strong[66] (1982), no.~1, 57--71.
  #link("https://doi.org/10.1007/BF01404756")[doi:`10.1007/BF01404756`].]
#bibitem([44])[Yujiro Kawamata. #emph[#link("https://doi.org/10.1515/crll.1985.363.1")[Minimal models and the
  Kodaira dimension of algebraic fiber spaces]]. Journal für die reine und angewandte Mathematik #strong[363]
  (1985), 1--46. #link("https://doi.org/10.1515/crll.1985.363.1")[doi:`10.1515/crll.1985.363.1`].]
#bibitem([45])[János Kollár. #emph[#link("https://doi.org/10.2969/aspm/01010361")[Subadditivity of the Kodaira
  dimension: fibers of general type]]. In #emph[Algebraic Geometry, Sendai, 1985].
  Advanced Studies in Pure Mathematics 10. Kinokuniya and North-Holland, Tokyo and Amsterdam, 1987, pp.~361--398.
  #link("https://doi.org/10.2969/aspm/01010361")[doi:`10.2969/aspm/01010361`].]
#bibitem([46])[Sándor J. Kovács and Zsolt Patakfalvi.
  #emph[#link("https://sites.math.washington.edu/~kovacs/current/papers/Kovacs_Patakfalvi__Projectivity.pdf")[Projectivity
  of the moduli space of stable log-varieties and subadditivity of log-Kodaira dimension]].
  Journal of the American Mathematical Society #strong[30] (2017), no.~4, 959--1021.
  #link("https://doi.org/10.1090/jams/871")[doi:`10.1090/jams/871`].
  The cited locators refer to the
  #link("https://sites.math.washington.edu/~kovacs/current/papers/Kovacs_Patakfalvi__Projectivity.pdf")[62-page
  author manuscript].]
#bibitem([47])[Kazuhisa Maehara. #emph[#link("https://arxiv.org/abs/0910.0604v3")[Iitaka--Viehweg conjectures $C$
  and $C^(+ +)$]]. arXiv preprint, 2010. Version 3, 16 May 2010; first posted 4 October 2009.]
#bibitem([48])[James S. Milne. #emph[#link("https://www.jmilne.org/math/Books/iAG2022.pdf")[Algebraic Groups:
  The Theory of Group Schemes of Finite Type over a Field]]. Cambridge Studies in Advanced Mathematics 170.
  Cambridge University Press, 2017. #link("https://doi.org/10.1017/9781316711736")[doi:`10.1017/9781316711736`].
  Cited from the corrected 2022 reprint.]
#bibitem([49])[Yoshinori Namikawa. #emph[#link("https://arxiv.org/abs/math/0101019v6")[Projectivity criterion of
  Moishezon spaces and density of projective symplectic varieties]].
  International Journal of Mathematics #strong[13] (2002), no.~2, 125--135.
  Theorem locators refer to arXiv:math/0101019v6, 12 November 2001.]
#bibitem([50])[OpenAI. #emph[Logarithmic Kodaira dimension and whole-fiber variation].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Logarithmic-Kodaira-dimension-and-whole-fiber-variation-September-26-2026/paper.pdf")[OAI:Logarithmic-Kodaira-dimension-and-whole-fiber-variation-September-26-2026],
  2026.]
#bibitem([51])[OpenAI. #emph[Projective Hodge lines and ordinary Iitaka subadditivity].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Projective-Hodge-lines-and-ordinary-Iitaka-subadditivity-September-27-2026/paper.pdf")[OAI:Projective-Hodge-lines-and-ordinary-Iitaka-subadditivity-September-27-2026],
  2026.]
#bibitem([52])[OpenAI. #emph[The reverse logarithmic Kodaira inequality and additivity].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-reverse-logarithmic-Kodaira-inequality-and-additivity-September-26-2026/paper.pdf")[OAI:The-reverse-logarithmic-Kodaira-inequality-and-additivity-September-26-2026],
  2026.]
#bibitem([53])[OpenAI. #emph[Log abundance in characteristic zero].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Log-abundance-in-characteristic-zero-September-24-2026/paper.pdf")[OAI:Log-abundance-in-characteristic-zero-September-24-2026],
  2026.]
#bibitem([54])[Giuseppe Pareschi, Mihnea Popa and Christian Schnell.
  #emph[#link("https://msp.org/gt/2017/21-4/gt-v21-n4-p12-s.pdf")[Hodge modules on complex tori and generic
  vanishing for compact Kähler manifolds]]. Geometry & Topology #strong[21] (2017), 2419--2460.
  #link("https://doi.org/10.2140/gt.2017.21.2419")[doi:`10.2140/gt.2017.21.2419`].]
#bibitem([55])[Zsolt Patakfalvi. #emph[#link("https://arxiv.org/abs/1208.1787v4")[Fibered stable varieties]].
  Transactions of the American Mathematical Society #strong[368] (2016), no.~3, 1837--1869.
  #link("https://doi.org/10.1090/tran/6386")[doi:`10.1090/tran/6386`].]
#bibitem([56])[Wilfried Schmid. #emph[#link("https://doi.org/10.1007/BF01389674")[Variation of Hodge structure:
  The singularities of the period mapping]]. Inventiones Mathematicae #strong[22] (1973), no.~3--4, 211--319.
  #link("https://doi.org/10.1007/BF01389674")[doi:`10.1007/BF01389674`].]
#bibitem([57])[Andrew John Sommese. #emph[#link("https://www.numdam.org/item/ASNSP_1978_4_5_4_683_0/")[On the
  rationality of the period mapping]]. Annali della Scuola Normale Superiore di Pisa,
  Classe di Scienze (4) #strong[5] (1978), no.~4, 683--717.]
#bibitem([58])[Hajime Tsuji. #emph[#link("https://arxiv.org/abs/1012.0884v1")[Global generation of the direct
  images of relative pluricanonical systems]]. arXiv preprint, 2010. Version 1, 4 December 2010.]
#bibitem([59])[Kenji Ueno. #emph[#link("https://doi.org/10.1007/BFb0070570")[Classification Theory of Algebraic
  Varieties and Compact Complex Spaces]]. Lecture Notes in Mathematics 439. Springer, Berlin, 1975.
  #link("https://doi.org/10.1007/BFb0070570")[doi:`10.1007/BFb0070570`].]
#bibitem([60])[Eckart Viehweg. #emph[#link("https://esaga.uni-due.de/eckart.viehweg/ecpubl/")[Weak positivity and
  the additivity of the Kodaira dimension for certain fibre spaces]].
  In #emph[Algebraic Varieties and Analytic Varieties (Tokyo, 1981)]. Advanced Studies in Pure Mathematics 1.
  Kinokuniya and North-Holland, Tokyo and Amsterdam, 1983, pp.~329--353.
  #link("https://doi.org/10.2969/aspm/00110329")[doi:`10.2969/aspm/00110329`].]
#bibitem([61])[Mads Bach Villadsen. #emph[#link("https://arxiv.org/abs/2401.09544v1")[Hodge modules and Kähler
  morphisms]]. Preprint, 2024. #link("https://arxiv.org/abs/2401.09544v1")[arXiv:2401.09544v1], 17 January 2024.]
#bibitem([62])[Juanyong Wang. #emph[#link("https://afst.centre-mersenne.org/item/10.5802/afst.1690.pdf")[On the
  Iitaka Conjecture $C_(n \, m)$ for Kähler Fibre Spaces]]. Annales de la Faculté des Sciences de Toulouse.
  Mathématiques (6) #strong[30] (2021), no.~4, 813--897.
  #link("https://doi.org/10.5802/afst.1690")[doi:`10.5802/afst.1690`].]

#bibliography("refs.bib", style: "ieee", title: [References])
