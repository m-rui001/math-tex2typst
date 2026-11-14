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

#align(center)[#text(size: 16pt, weight: "bold")[Finite-ordinary-minimal-model-programs-on-compact-Kahler-fourfolds-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A minimal model program replaces a pair by successive birational models on which its adjoint becomes more
  positive. For compact Kähler klt fourfold pairs with effective rational boundary in the global Weil
  $bb(Q)$-factorial category, we prove that every maximal ordinary negative-ray program terminates,
  starting on the given pair without an initial modification.
  Its endpoint has nef adjoint when the initial adjoint is pseudo-effective;
  otherwise it carries a projective Mori fibre space. Auxiliary generalized pairs enter the proof,
  while every step of the resulting program is ordinary.

=== 1.1 Category and main theorem <category-and-main-theorem>

All varieties are reduced irreducible second-countable complex analytic spaces.
  A Kähler form on a normal space has smooth strictly plurisubharmonic local potentials in local embeddings.
  Projectivity of a morphism means the existence of a relatively ample holomorphic line bundle.

#prodef([Definition 1.1.])[
  A normal compact space $X$ is #emph[globally Weil $bb(Q)$-factorial] if every prime Weil divisor defined on the
    whole of $X$ is $bb(Q)$-Cartier and some positive reflexive power of its canonical sheaf $omega_X$ is a line
    bundle. It is #emph[globally strongly $bb(Q)$-factorial] if every coherent rank-one reflexive sheaf $cal(F)$
    on $X$ has an invertible positive reflexive power $cal(F)^(\[ m \]) = \( cal(F)^(⊗ m) \)^(* *)$.
] <def:global-factoriality>

The Weil convention is that of #cite(label("DHY2023")) Definition 2.1;
  the strong convention is used in #cite(label("HX2026")) Section 2.
  The strong condition implies the Weil condition. Neither definition imposes $bb(Q)$-factoriality on every
  analytic local ring. The distinction matters even for projective varieties; an example is given in Appendix 14.

We write $K_X$ additively for the canonical sheaf. When a canonical Weil divisor is given,
  we keep that representative and transport it through the program.
  We will also prove the intrinsic variant in which only the canonical rational line bundle is specified.
  In that variant, identities of adjoints mean isomorphisms of holomorphic line bundles after a common positive
  multiple. Relative canonical divisors are defined using compatible local canonical generators.
  In particular, a numerical identity alone never specifies such a divisor.

For an effective rational boundary $Delta$, put $D = K_X + Delta$. We use #emph[log discrepancies] throughout:

$ a \( E \; X \, Delta \) = 1 + "coeff"_E #scale(x: 120%, y: 120%)[\(] K_W -
  p^(*) \( K_X + Delta \) #scale(x: 120%, y: 120%)[\)] $

on a smooth model $p : W arrow.r X$ carrying $E$. A pair is klt when all these numbers are positive.
  It is terminal when it is klt and they are greater than one for every exceptional divisor over $X$.
  The same convention will apply to the auxiliary real and generalized pairs.

Let $H_(upright("BC"))^(1 \, 1) \( X \)$ denote real Bott–Chern cohomology of closed $\( 1 \, 1 \)$-forms with
  local potentials, and let $overline(upright("NA")) \( X \)$ be the closed cone of positive currents of
  bidimension $\( 1 \, 1 \)$ modulo their pairings with these classes.
  A class is #emph[nef] if it belongs to the closure of the Kähler cone,
  and #emph[pseudo-effective] if it contains a closed positive $\( 1 \, 1 \)$-current with local potentials.
  These terms for a rational line bundle refer to its first Chern class.
  A class is #emph[big] if it contains a Kähler current, meaning a closed current that dominates a positive
  multiple of a Kähler form. For a projective contraction $f : X arrow.r Z$,
  write $rho \( X \/ Z \)$ for the dimension of the space of global real line-bundle classes modulo zero degree on
  every contracted curve, and put

$ rho_(upright("BC")) \( X \/ Z \) = dim_(bb(R)) #scale(x: 120%, y: 120%)[\(]
  H_(upright("BC"))^(1 \, 1) \( X \) \/ f^(*) H_(upright("BC"))^(1 \, 1) \( Z \) #scale(x: 120%, y: 120%)[\)] . $

An #emph[ordinary $D$-negative step] is a projective divisorial contraction,
  or the flip of a projective small contraction, of a $D$-negative extremal ray of
  $overline(upright("NA")) \( X \)$. The contraction has connected fibres and a normal compact Kähler target;
  its relative rank is one and $- D$ is relatively ample. For a flip the transformed adjoint is ample over the
  same target. The boundary is pushed forward in a divisorial step and strictly transformed in a flip.
  A #emph[Mori fibre space] has the same contraction properties and a base of strictly smaller dimension.

#thm([Theorem 1.2.])[
  (Termination of ordinary programs).  #emph[Let $X$ be a normal globally Weil $bb(Q)$-factorial compact Kähler
    fourfold, with a canonical Weil divisor $K_X$, and let $Delta gt.eq
    0$ be a rational divisor such that $\( X \, Delta \)$ is klt.
    Then every maximal ordinary negative-ray program starting on $\( X \, Delta \)$ terminates.
    Its birational steps form a finite sequence
$ \( X \, Delta \) = \( X_0 \, Delta_0 \) arrow.r.dashed dots.h.c arrow.r.dashed \( X_n \, Delta_n \) . $

 Every $X_i$ is normal, compact Kähler and globally Weil $bb(Q)$-factorial; every $\( X_i \, Delta_i \)$ is klt,
   and $D_i = K_(X_i) + Delta_i$ is $bb(Q)$-Cartier. The canonical divisors are the transforms of the specified
   datum. The following alternatives hold.]
  + #emph[If $D = K_X + Delta$ is pseudo-effective, then $D_n$ is nef.
    The composite $phi.alt : X arrow.r.dashed X_n$ extracts no prime divisor, and
$ a \( E \; X \, Delta \) lt.eq a \( E \; X_n \, Delta_n \) $

 for every prime divisor over the two models, with strict inequality for every prime on $X$ contracted by $phi.alt$.]
  + #emph[If $D$ is not pseudo-effective, there is a projective surjective morphism $g : X_n arrow.r
    S$ with connected fibres, where $S$ is normal compact Kähler, $dim S < 4$, $rho \( X_n \/ S \) = 1$, and $-
    D_n$ is $g$-ample.]
  #emph[For each negative contraction, including $g$, the relative Bott–Chern dimension is one.
    If $X$ is globally strongly $bb(Q)$-factorial, so is every $X_i$.]
  #emph[The same conclusions hold in the intrinsic formulation with the canonical rational line bundle in place of
    a chosen canonical Weil divisor. In either formulation the first model is exactly $X$.]
] <thm:finite>

The endpoint conclusion in the pseudo-effective case is nefness; no abundance assertion is made.

=== 1.2 Prior work and proof ingredients <prior-work-and-proof-ingredients>

Höring–Peternell established minimal models for non-uniruled compact Kähler threefolds #cite(label("HP2016")).
  For fourfolds, Das–Hacon–Păun proved the compact klt result when the adjoint is $bb(Q)$-linearly equivalent to
  an effective divisor #cite(label("DHP2024")). Fujino’s analytic relative MMP supplies ordinary cone,
  base-point-free, and flip theorems for projective morphisms #cite(label("Fujino2022")).
  The generalized cone theorem of Hacon–Xie supplies the analytic negative rays and their finite form when the
  boundary plus nef part is big #cite(label("HX2026")) Theorem 1.3.

For the supporting contractions needed here, Section 6 proves a bounded-dimensional base-point-free statement.
  Its induction uses ordinary rational programs in dimensions at most three,
  all with global line-bundle polarizations. A divisorial negative-part comparison then supplies descent from a
  selected lower-dimensional good model. The ordinary rational adjoint detects each fourfold negative ray and
  gives a global algebra for its flip.

The companion theorem on generalized log canonical flips
  #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026"))
  Theorem 1.1 proves termination for the resulting existing rational flip sequences.
  Compact analytic cycle classes bound the number of divisorial steps.
  The companion uses the independent low-place, relative-program, extraction,
  and special-termination results proved below; the supporting contraction argument does not use the
  finite-program theorem itself.

Two ingredients have uses beyond this deduction. First, actual line bundles that are numerically trivial over the
  relevant birational contractions descend without taking an additional power.
  Second, ordinary terminal fourfold flips terminate with effective #emph[real] boundary in our compact Kähler
  setting. The proof adapts the discrepancy and homology methods of Kawamata–Matsuda–Matsuki and Fujino,
  including the corrected treatment of low-discrepancy places #cite(label("KMM1987")) #cite(label("Fujino2004"))
  #cite(label("Fujino2005Addendum")).

=== 1.3 Proof outline <proof-outline>

Sections 2–4 establish the common analytic, birational and termination tools.
  The proof of Theorem 2 then has three stages.

+ The cone theorem gives a supporting nef class for each ordinary negative ray.
  Once its contraction is constructed, the ordinary rational adjoint provides one global relative polarization and
  one global flip algebra.
+ A dimension induction proves the supporting contraction statement through dimension four.
  Its lower-dimensional ordinary programs are projective from their first step,
  and a negative-part comparison gives descent without lifting a generalized program from the lower-dimensional base.
+ The companion flip-termination theorem excludes an infinite flip tail,
  while compact cycle counts bound the divisorial steps. Section 7 identifies the endpoint from pseudo-effectivity
  and gives the required discrepancy inequalities.

All auxiliary constructions are separate from the ordinary sequence, which begins on $X$ itself.

The rational relative constructions in Section 9 feed threefold termination and the dimension induction for
  special termination. These results support both the contraction induction and the companion flip-termination
  theorem. Their nef data are actual rational line bundles on higher models, denoted by $upright(bold(M))$,
  distinct from the possibly transcendental nef classes used in the contraction argument.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.29cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Analytic contractions and exact bundle descent#linebreak()Compact cycle counts and ordinary terminal fourfold termination]]])])
  content((0, -2.064), [#box(width: 5.894cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Rational relative programs#linebreak()Threefold and special termination]]])], anchor: "north-west")
  content((0, -2.045), [#box(width: 5.894cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Supporting contractions#linebreak()Bounded-dimensional induction]]])], anchor: "north-east")
  content((2.947, -4.61), [#box(width: 5.894cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Companion flip termination#linebreak()Compact cycle counts]]])])
  content((-2.947, -4.552), [#box(width: 5.894cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Global line-bundle detectors#linebreak()Ordinary projective steps]]])])
  content((2.947, -6.556), [#box(width: 12.29cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#69839e"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f8f9fa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Every maximal ordinary negative-ray program terminates#linebreak()Theorem~1.2]]])], anchor: "north-west")
  line((2.947, -0.5819), (2.947, -2.064), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((-2.947, -0.5819), (-2.947, -2.045), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((0, -2.626), (0, -2.626), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((2.947, -3.228), (2.947, -4.028), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((-2.947, -3.17), (-2.947, -3.97), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((2.947, -5.192), (2.947, -6.556), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
  line((-2.947, -5.134), (-2.947, -6.556), stroke: (paint: rgb("#466687"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#466687"))))
})],
  caption: [Figure 1: Dependencies in the proof of Theorem 2. The relative and lower-dimensional results support the contraction induction and the companion flip-termination theorem. ],
) <fig:dependencies>

== 2 Classes, currents, and exceptional divisors <sec:analytic>

The scaling argument transports one Kähler form from the original space through several birational models.
  Its trace need not be smooth, or even have local potentials without further argument.
  We establish the precise trace relation, its positivity, and the comparison rules used below.
  Equalities between Bott–Chern classes will be distinguished from equalities between divisors or currents.

=== 2.1 Pullback of classes <pullback-of-classes>

We use the following cohomological descent theorem. A space is in #emph[Fujiki’s class $cal(C)$] if it is
  bimeromorphic to a compact Kähler manifold.

#thm([Lemma 2.1.])[
  (Pullback and descent).  #emph[Let $f : T arrow.r Z$ be a proper surjective morphism with connected fibres
    between normal compact analytic spaces with rational singularities.
    Suppose that $T$ is in class $cal(C)$ and that either the general fibre is rationally connected or $R^j f_(*)
    cal(O)_T = 0$ for every $j > 0$. Then
$ f^(*) : H_(upright("BC"))^(1 \, 1) \( Z \) arrow.r H_(upright("BC"))^(1 \, 1) \( T \) $

 is injective, and its image consists exactly of the classes having degree zero on every $f$-vertical curve.
   If $T$ and $Z$ are Kähler, a class on $Z$ is nef if and only if its pullback is nef.]
] <lem:pullback-image>

#proof[
  The pullback assertion is #cite(label("HX2026")) Lemma 2.39; nef descent is #cite(label("DHP2024")) Lemma 2.38.
    In particular, the first assertion applies to any proper bimeromorphic morphism between compact spaces with
    rational singularities whose source is in class $cal(C)$: its general fibre is a point.
    For a projective klt log Fano contraction, relative vanishing supplies the higher-direct-image hypothesis once
    rationality of the base has been established. ◻
]

=== 2.2 Positive currents on a normal model <positive-currents-on-a-normal-model>

An $f$-exceptional real divisor is a finite real linear combination of prime divisors whose images have
  codimension at least two. We next give the descent statement needed when an exceptional correction has either
  sign. Pseudo-effectivity requires a positive current with local plurisubharmonic potentials;
  we do not assume that an arbitrary positive current on a singular space has them.

#thm([Lemma 2.2.])[
  (Exceptional descent).  #emph[Let $p : U arrow.r T$ be a resolution of a normal compact Kähler space,
    with $U$ compact Kähler. Let $alpha in H_(upright("BC"))^(1 \, 1) \( T \)$ and let $E$ be a $p$-exceptional
    real divisor. If $p^(*) alpha + \[ E \]$ is pseudo-effective, then $alpha$ is pseudo-effective.
    No sign condition on $E$ is needed. Pseudo-effective classes pull back to resolutions,
    and nef classes on $T$ are pseudo-effective.]
] <lem:positive-descent>

#proof[
  Choose a smooth representative $theta$ of $alpha$ with local smooth potentials.
    On the smooth compact Kähler space $U$, a positive representative of the given class has the form
  #[#set math.equation(numbering: n => "(2.1)")
   $ S = p^(*) theta + \[ E \] + upright(d) upright(d)^c v $ <eq:positive-upstairs>]
  for a global distribution $v$. Remove from $T$ its singular locus and the image of the exceptional locus,
    obtaining a smooth open set $T^compose$ whose complement has codimension at least two.
    The map $p$ is an isomorphism there. Equation (2.1) gives a global $theta$-plurisubharmonic function
    $v^compose$ on $T^compose$. We do not assert that $v$ is quasi-plurisubharmonic along $E$.
  On a coordinate neighbourhood where $theta = upright(d) upright(d)^c rho$, extend $rho +
    v^compose$ first across the removed codimension-two subset of the regular locus,
    and then across the singular locus. The first extension is the plurisubharmonic Hartogs theorem;
    the second is its normal-space version of Grauert–Remmert, recalled in #cite(label("CMM2017")) Section 2.1,
    pp. 927–928. These extensions are unique. On overlaps their differences are the original smooth pluriharmonic
    differences of the functions $rho$. Subtracting $rho$ therefore gives a global potential $v_T$, and
  $ theta + upright(d) upright(d)^c v_T gt.eq 0 $
  is a current with local plurisubharmonic potentials representing exactly $alpha$.
    This proves descent, including for signed $E$.
  For pullback, compose local plurisubharmonic potentials with the resolution.
    They cannot become identically $- oo$ on a nonempty open subset,
    since a resolution is an isomorphism on a dense open set.
    Thus they define the pulled-back positive current; see #cite(label("CMM2017")) Section 2.1, p. 928.
  Finally, if $alpha$ is nef, then $p^(*) alpha$ is nef on $U$.
    For a Kähler form $omega_U$, choose positive representatives of $p^(*) alpha + epsilon \[ omega_U \]$.
    Their masses are bounded as $epsilon arrow.b 0$, so a weak limit is a positive current in $p^(*) alpha$.
    On the smooth Kähler manifold $U$ it has local plurisubharmonic potentials.
    The first part, with $E = 0$, descends this current to the required class on $T$. ◻
]

=== 2.3 Generalized pairs and negativity <generalized-pairs-and-negativity>

We recall the generalized-pair language in the form needed here #cite(label("DHY2023")) Section 2.1 and
  Definition 2.7. A closed #emph[b-$\( 1 \, 1 \)$ current] is a compatible collection of closed
  $\( 1 \, 1 \)$-currents on proper birational models: pushforward along a morphism between models recovers the
  current on the lower model. It #emph[descends] to a model $U$ if its trace there and all higher traces have
  local potentials, and the classes of the higher traces are pullbacks of its class on $U$.
  It is #emph[b-nef] if that class is nef on some such model.
  We also use the relative version for real combinations of line-bundle data on a carrier projective over a
  specified base. Here nefness means nonnegative degree on curves contracted to that base.
  The structure equation and discrepancy definition below are unchanged.

A generalized pair on $T$ consists of a boundary $B gt.eq 0$, a b-nef datum $upright(bold(M))$,
  and a log resolution $nu : U arrow.r T$ on which the datum descends,
  together with an actual real divisor $B_U$ such that $nu_(*) B_U = B$ and

#[#set math.equation(numbering: n => "(2.2)")
 $ \[ K_U + B_U \] + \[ upright(bold(M))_U \] = nu^(*) L \, wide
   L in H_(upright("BC"))^(1 \, 1) \( T \) . $ <eq:generalized-structure>]

The support of $B_U$ may be taken to have simple normal crossings.
  Negativity makes this structure boundary unique; passing to higher resolutions gives the other structure
  boundaries. The generalized log discrepancy of a prime $P$ on such a resolution is

$ a \( P \, T \, B + upright(bold(M)) \) = 1 - "coeff"_P B_U . $

The pair is generalized klt, or #emph[gklt], if all these discrepancies are positive,
  and generalized log canonical, or #emph[glc], if they are all nonnegative.
  The #emph[gklt locus] is the open subset where all discrepancies of primes centred there are positive;
  its complement is the generalized non-klt locus. We use the word #emph[terminal] for an ordinary or generalized
  klt pair whose discrepancies at all exceptional primes are strictly greater than one.
  Negative coefficients are permitted in $B_U$, although the boundary $B$ on the model is effective.
  Generalized klt spaces have rational singularities #cite(label("DHY2023")) Theorem 2.19.

The negativity lemma concerns actual divisors, not arbitrary Bott–Chern classes.
  We record also the strict form needed for fourfold termination.

#thm([Lemma 2.3.])[
  (Negativity and strict comparison).  #emph[]
  + #emph[Let $f : T arrow.r Z$ be a proper bimeromorphic morphism of normal complex spaces and let $E$ be a real
    Cartier divisor such that $- E$ is $f$-nef. Then $E gt.eq 0$ if and only if $f_(*) E gt.eq 0$.
    Consequently an $f$-exceptional, $f$-numerically trivial real Cartier divisor is zero.]
  + #emph[If, in addition, $f$ has connected projective fibres and $E gt.eq 0$ is $f$-anti-nef,
    then every fibre is either contained in $"Supp" E$ or disjoint from $"Supp" E$.]
  + #emph[Consider a nontrivial small birational diagram
$ T arrow.r^(med f med) Z arrow.l^(med f^(+) med) T^(+) $

 of normal compact spaces, with projective contractions on both sides.
   Let $B gt.eq 0$ be a real boundary, let $B^(+)$ be its strict transform, and suppose the ordinary adjoints $D =
   K_T + B$ and $D^(+) = K_(T^(+)) + B^(+)$ are real Cartier, with $-
   D$ relatively ample on the left and $D^(+)$ relatively ample on the right.
   The two exceptional loci have the same image $A subset Z$.
   On a common resolution $p : V arrow.r T$, $q : V arrow.r T^(+)$,
#[#set math.equation(numbering: n => "(2.3)")
 $ p^(*) D - q^(*) D^(+) = F \, wide F gt.eq 0 \, $ <eq:ordinary-flip-comparison>]

 where $F$ is an actual divisor exceptional over both models. For every prime divisor $P$ over these spaces,
$ a \( P \, T^(+) \, B^(+) \) gt.eq a \( P \, T \, B \) \, $

 and the inequality is strict if the centre of $P$ on either side is contained in that side’s exceptional locus.]
  + #emph[For the diagram in (iii), if $dim T = 4$, then $dim A lt.eq 1$ and
$ dim "Exc" \( f \) + dim "Exc" \( f^(+) \) gt.eq 3 . $

]
  + #emph[The discrepancy conclusions in (iii) also hold for generalized pairs with the same fixed b-nef datum and
    transformed boundaries in a projective small diagram, provided the source log class has negative degree on
    every curve contracted on that side, and the target log class has positive degree on every curve contracted on
    the other side. They hold likewise for a projective divisorial contraction $f : T arrow.r
    T'$ when the target boundary is the pushforward, the b-datum is unchanged,
    and the source log class has negative degree on every $f$-vertical curve.
    In this divisorial case strictness holds at every prime whose source centre lies in $"Exc" \( f \)$.
    This part also applies when the fixed b-datum is nef only over a specified base.]
] <lem:negativity>

#proof[
  Part (i) is the analytic negativity lemma #cite(label("HX2026")) Lemma 2.5;
    apply it to both signs for the last assertion. For (ii), points of a connected projective fibre can be joined
    by a chain of irreducible curves. If the fibre met both $"Supp" E$ and its complement,
    some curve in such a chain would meet the support without being contained in it.
    Its intersection with the effective real Cartier divisor would be strictly positive,
    contrary to $f$-anti-nefness. The assertion for a real Cartier divisor follows locally from positive
    combinations of effective rational Cartier divisors, as explained below.
  For (iii), let $G$ be the normalization of the graph in $T times_Z T^(+)$, with projections $p_G \,
    q_G$ and map $h : G arrow.r Z$. Compatible canonical data give the actual real Cartier divisor
  $ F_G = p_G^(*) D - q_G^(*) D^(+) . $
  This difference is defined locally by compatible meromorphic canonical generators and therefore glues,
    even when the canonical sheaves were specified as $bb(Q)$-line bundles.
    Smallness makes it exceptional over both sides. It is effective by (i), applied over $T$:
    on a $p_G$-vertical curve the degree of $- F_G$ is the degree of $q_G^(*) D^(+)$, which is nonnegative.
  For every $h$-vertical curve $C$ one has
  #[#set math.equation(numbering: n => "(2.4)")
   $ F_G dot.op C < 0 . $ <eq:graph-strict-degree>]
  Indeed, normalization is finite onto the graph, so the two projections cannot both contract $C$.
    The nonzero degrees contributed by $p_G^(*) D$ and $- q_G^(*) D^(+)$ are both negative.
    An effective real Cartier divisor has nonnegative degree on a curve outside its support.
    For completeness, this fact and its strict pullback analogue hold even if its individual prime components are
    not $bb(Q)$-Cartier: locally express it in the real span of finitely many Cartier divisors.
    Vanishing of coefficients outside its support and nonnegativity of the remaining coefficients are rational
    linear conditions. The resulting rational polyhedral cone expresses it as a positive real combination of
    effective $bb(Q)$-Cartier divisors. The usual effective Cartier assertions apply to each term;
    summing the nonnegative local intersection numbers gives the asserted global degree inequality.
    In particular, the pullback has positive coefficient at every prime whose centre is contained in the support.
  The morphism $p_G$ has connected fibres because $T$ is normal; hence $h = f p_G$ has connected fibres.
    Its fibres are projective because $G$ is finite over the graph in the fibre product.
    Each point of a positive-dimensional fibre lies on a curve in that fibre.
    Equation (2.4) therefore places the entire fibre in $"Supp" F_G$.
    To identify the relevant fibres, suppose $f$ is an isomorphism over an open subset of $Z$.
    There the log divisor on $T^(+)$ is pulled back from $Z$, by smallness and agreement in codimension one.
    Relative ampleness excludes an $f^(+)$-vertical curve there; projectivity,
    connectedness and normality then make $f^(+)$ an isomorphism there as well.
    Interchanging the sides proves that their exceptional images coincide. Thus $h^(- 1) \( A \) subset "Supp" F_G$.
  Pull $F_G$ back to a resolution on which $P$ appears. Its coefficient at $P$ is exactly
    $a \( P \, T^(+) \, B^(+) \) - a \( P \, T \, B \)$, with our log-discrepancy convention.
    Effectivity gives monotonicity, and the support assertion gives the claimed strictness. This proves (iii).
  For (iv), a small exceptional locus in a fourfold has dimension at most two and has positive-dimensional fibres,
    so its image has dimension at most one. Moreover $F_G eq.not 0$ by (2.4).
    A component of its support has dimension three and maps finitely into $"Exc" \( f \) times_Z
    "Exc" \( f^(+) \)$. The dimension of this product is at most the sum of the dimensions of its two factors.
    This proves (iv).
  For (v), choose a common smooth resolution $p : V arrow.r T$, $q : V arrow.r
    T'$ carrying the fixed b-datum and projective over the common contraction base.
    Such a resolution is obtained by taking projective modifications of the graph that resolve the maps to a
    carrier of the datum. Subtract the actual structure boundaries to obtain a real Cartier divisor $F =
    B_(T \, V) - B_(T' \, V)$. Its coefficients are the differences of generalized log discrepancies,
    and cancellation of the fixed b-part gives
  $ \[ F \] = p^(*) L_T - q^(*) L_(T') . $
  Let $h : V arrow.r Z$ be the morphism to the common contraction base; in the divisorial case $Z = T'$ and $q =
    h$. It is projective by this choice and has connected fibres because it is bimeromorphic onto the normal space
    $Z$. The boundary-pushforward condition makes $F$ exceptional over $Z$.
    The relative signs of the log classes give $F dot.op C lt.eq 0$ on every $h$-vertical curve,
    with strict inequality whenever $p \( C \)$ or, in the small case, $q \( C \)$ is a curve.
    Thus (i) gives $F gt.eq 0$.
  If $y$ lies in an exceptional image, a vertical curve downstairs can be lifted to a curve on $V$ dominating it:
    use a component of its projective inverse image and cut by relatively ample hyperplanes.
    Such a curve has negative $F$-degree and hence lies in $"Supp" F$.
    Part (ii) now puts the entire fibre $h^(- 1) \( y \)$ in the support.
    Pullback to a higher resolution has positive coefficient at every prime centred in this support.
    This proves all the strict discrepancy inequalities, including for a centre on the flipped side.
    No trace current on the normalized graph is assumed to be Cartier;
    the actual divisor is constructed from the structure boundaries on the smooth resolution. ◻
]

=== 2.4 A fixed nef b-part and its traces <a-fixed-nef-b-part-and-its-traces>

For the finite-program proof, fix a Kähler form $h$ on the original space $X$, and set $H = \[ h \]$.
  It defines a positive b-current $upright(bold(H))$: for a marked birational model $T$,
  choose a common resolution $p : V arrow.r T$, $q : V arrow.r X$ and put

#[#set math.equation(numbering: n => "(2.5)")
 $ upright(bold(H))_T = p_(*) q^(*) h . $ <eq:actual-H-trace>]

Compatibility on higher resolutions makes this independent of the choice of resolution #cite(label("DHY2023"))
  Claim 2.5. Throughout the proof this is one fixed current datum;
  we do not replace it by arbitrary cohomologous currents. The class of the trace, when it exists,
  will be denoted by $H_T$.

#thm([Lemma 2.4.])[
  (The exceptional trace relation).  #emph[Let $T$ be a normal compact Kähler space with rational singularities,
    marked birationally to $X$. Suppose that on a common smooth Kähler resolution $p : V arrow.r T$, $q :
    V arrow.r X$ there are a class $H_T in H_(upright("BC"))^(1 \, 1) \( T \)$ and an actual $p$-exceptional real
    divisor $J_T$ satisfying
#[#set math.equation(numbering: n => "(2.6)")
 $ p^(*) H_T = q^(*) H + \[ J_T \] . $ <eq:class-trace>]

 Then $J_T gt.eq 0$. The class $H_T$ and the divisor $J_T$ are unique,
   and the correction on a higher resolution is the pullback of $J_T$.]
  #emph[For an effective boundary $B_T$ with real Cartier ordinary adjoint,
    the generalized structure boundary for the nef datum $t upright(bold(H))$ is
#[#set math.equation(numbering: n => "(2.7)")
 $ B_(T \, V) \( t \) = p^(*) \( K_T + B_T \) - K_V + t J_T \, wide t gt.eq 0 . $ <eq:trace-boundary>]

 In particular, decreasing $t$ increases every generalized log discrepancy.
   If the generalized pair is gklt, its ordinary pair is klt; if all its exceptional log discrepancies exceed one,
   the ordinary pair is terminal.]
  #emph[Conversely, suppose $t > 0$ and a generalized pair with boundary $B_T$ and this fixed datum $t
    upright(bold(H))$ is given by (2.2), with log class $L$ and real Cartier ordinary adjoint. Then (2.6) holds with
$ H_T = frac(L - \[ K_T + B_T \], t) . $

]
] <lem:class-trace>

#proof[
  On every $p$-vertical curve, $- J_T$ has the same degree as the nef class $q^(*) H$.
    Lemma 5(i) gives $J_T gt.eq 0$. Subtract two possible relations.
    The difference of the correction divisors is $p$-exceptional and numerically trivial over $T$, hence zero.
    Pullback injectivity from Lemma 3 then gives uniqueness of the class as well.
  Pulling back (2.6) to a higher resolution gives the claimed correction there by uniqueness.
    Conversely, if the relation is initially known on a higher resolution $r : V' arrow.r V$,
    push its correction down to $V$. The difference between the upstairs correction and the pullback of this
    pushforward is $r$-exceptional and numerically trivial over $V$, so is zero.
    Injectivity of $r^(*)$ gives the relation on $V$.
  Equation (2.7) follows by adding $K_V$ and the fixed nef class $t q^(*) H$ to its two sides. Its coefficients give
  $ a \( P \, T \, B_T + t upright(bold(H)) \) = a \( P \, T \, B_T \) - t "coeff"_P J_T $
  on every sufficiently high resolution. This proves the discrepancy assertions.
  For the converse, let $B_V$ be the given actual generalized structure boundary and put $B_V^(upright("ord")) =
    p^(*) \( K_T + B_T \) - K_V$. Both push forward to $B_T$, so
  $ J_T = frac(B_V - B_V^(upright("ord")), t) $
  is an actual $p$-exceptional divisor. Subtract the ordinary log class from (2.2) to obtain (2.6).
    This constructs the divisor before applying negativity; it does not infer a divisor from an arbitrary class
    difference. ◻
]

The converse is particularly useful for an extraction carrying a pulled-back generalized log class.
  It shows that the divided difference defining its trace is the same class whenever the marked model is the same,
  even if its boundary was obtained at a different scaling parameter.

#thm([Corollary 2.5.])[
  (Positivity of the trace).  #emph[Under the hypotheses of Lemma 6,
    the actual trace $upright(bold(H))_T$ has local plurisubharmonic potentials and represents $H_T$.
    The class $H_T$ is big.]
] <cor:big-trace>

#proof[
  The positive current $q^(*) h + \[ J_T \]$ represents $p^(*) H_T$.
    The proof of Lemma 4 constructs a positive current $S_T$ in $H_T$ with local potentials.
    On the big open where $p$ is an isomorphism and the correction is absent, it agrees with $p_(*) q^(*) h$.
    Their difference is a closed current of order zero supported in codimension at least two.
    Such a current vanishes: after a local embedding it has bidimension $\( dim T - 1 \, dim T - 1 \)$,
    whereas its support has smaller dimension #cite(label("DemaillyCADG2012")) Chapter III, Corollary 2.11.
    Thus $S_T$ is precisely the actual trace in (2.5). This step is needed because a trace of a positive b-current
    need not have local potentials a priori #cite(label("DHY2023")) Remark 2.6(ii).
  The class $q^(*) H$ is nef and has positive top self-intersection:
    $q^(*) h$ is semipositive and is positive on the dense open where $q$ is an isomorphism.
    By #cite(label("DemaillyPaun2004")) Theorem 0.5, it contains a Kähler current $R gt.eq
    delta omega_V$ for some $delta > 0$ and some Kähler form $omega_V$.
    Fix a Kähler form $omega_T$ and choose $C > 0$ with $p^(*) omega_T lt.eq C omega_V$. For $0 < epsilon < delta \/ C$,
  $ R + \[ J_T \] - epsilon p^(*) omega_T gt.eq 0 . $
  Its class is $p^(*) \( H_T - epsilon \[ omega_T \] \)$. Lemma 4 shows that $H_T -
    epsilon \[ omega_T \]$ is pseudo-effective. Hence $H_T$ contains a Kähler current, as required. ◻
]

=== 2.5 Comparison with the same nef datum <comparison-with-the-same-nef-datum>

The preceding results supply the positivity needed for scaling.
  We finish with the comparison that later excludes divisorial steps in the limiting program and identifies the
  two nef pullbacks in the final contradiction.

#thm([Lemma 2.6.])[
  (Small-model comparison).  #emph[Let $\( T \, B_T + upright(bold(M)) \)$ and
    $\( T' \, B_(T') + upright(bold(M)) \)$ be generalized pairs with the same b-nef datum,
    whose log classes are $L_T$ and $L_(T')$. Suppose the marked birational map $T arrow.r.dashed
    T'$ extracts no divisors and $B_(T')$ is the pushforward of $B_T$.
    On a common sufficiently high resolution $p : V arrow.r T$, $q : V arrow.r T'$, put
$ F = B_(T \, V) - B_(T' \, V) . $

 Then $F$ is an actual divisor exceptional over $T'$, and
#[#set math.equation(numbering: n => "(2.8)")
 $ p^(*) L_T - q^(*) L_(T') = \[ F \] \, wide "coeff"_P F = a \( P \, T' \, B_(T') + upright(bold(M)) \) -
   a \( P \, T \, B_T + upright(bold(M)) \) . $ <eq:small-comparison>]

 If the map is small, $F$ is exceptional over both models.
   In this case nefness of $L_(T')$ implies $F gt.eq 0$, and nefness of both log classes implies $F = 0$.
   These conclusions also hold relatively over a common base.
   In particular equal pullback classes imply equality of the structure boundaries.]
] <lem:small-comparison>

#proof[
  Subtract the two structure equations on $V$. The trace of the fixed b-datum cancels, giving (2.8).
    At a prime dominating a divisor on $T'$, the corresponding boundary coefficient on $T$ is unchanged,
    so its coefficient in $F$ is zero. This proves exceptionality over $T'$.
    Smallness gives the same assertion over $T$.
  If $L_(T')$ is nef, then $- F$ is $p$-nef, because its degree on a $p$-vertical curve is the degree of $q^(*)
    L_(T')$. Negativity gives $F gt.eq 0$. If $L_T$ is also nef, then $F$ is $q$-nef,
    so applying negativity with the opposite sign gives $F lt.eq 0$.
    The same proof uses only relative nefness when the models lie over a common base.
    For equal pullback classes, the already constructed exceptional divisor is relatively numerically trivial,
    and is zero by Lemma 5(i). ◻
]

All equalities of pulled-back log classes in this lemma are cohomological.
  Equality of actual currents was used only in the separate trace-identification argument.
  These distinctions allow the ordinary steps and the generalized auxiliary constructions to share one fixed nef datum.

== 3 Ordinary steps on the given space <sec:absolute>

We construct the contraction and flip of every negative analytic ray in arbitrary dimension.
  The input is an ordinary rational klt pair in the #emph[global Weil-divisor] category.
  Generalized pairs enter only through the cone and base-point-free theorems; the steps themselves are ordinary.
  The main point is to preserve actual line bundles, including their fixed Cartier indices,
  rather than only numerical classes.

=== 3.1 Integral descent <integral-descent>

Bundles are written additively in numerical expressions. For example,
  $L - \( K_T + C \)$ denotes the rational line bundle obtained from $L$ and the rational adjoint.
  All degrees in the following lemma are degrees on compact curves contracted by the indicated morphism.

#thm([Lemma 3.1.])[
  (Integral descent).  #emph[Let $f : T arrow.r Z$ be a projective bimeromorphic contraction of normal complex
    spaces, and let $L$ be a line bundle numerically trivial over $Z$.
    Suppose that every point of $Z$ has a neighbourhood $U$ on which there is an ordinary rational klt pair
    $\( f^(- 1) U \, C_U \)$ with rational adjoint and
$ L - \( K_(f^(- 1) U) + C_U \) quad f upright("-nef over ") U . $

 Then $f_(*) L$ is a line bundle and the evaluation map is an isomorphism
#[#set math.equation(numbering: n => "(3.1)")
 $ f^(*) f_(*) L tilde.eq L . $ <eq:integral-descent>]

 In particular the conclusion applies if the local ordinary adjoints are relatively antiample.
   It also applies to a global ordinary rational klt pair $\( T \, C \)$ whenever $L - \( K_T + C \)$ is $f$-nef.
   Clearing one denominator therefore descends a rational line bundle as an actual rational line bundle.]
] <lem:descent>

#proof[
  Fix $z in Z$ and shrink to a connected Stein neighbourhood $U$ on which the stated pair is defined.
    A line bundle $M$ on $f^(- 1) U$ has a Cartier-divisor representative there:
    the coherent direct image $f_(*) M$ has rank one over the nonempty open where $f$ is an isomorphism,
    so Cartan’s Theorem A supplies a nonzero section. Its pullback is a section of $M$ that is not identically
    zero, and its zero divisor is Cartier. This argument takes place over $U$, not on the whole compact space.
  Every rational line bundle $N$ on $f^(- 1) U$ is also relatively big.
    Indeed, choose $q > 0$ with $q N$ a line bundle and an $f$-ample line bundle $A$.
    The same direct-image argument gives a nonzero section of $q N - A$, hence
  $ N tilde.op_(bb(Q)) q^(- 1) A + q^(- 1) E wide \( E gt.eq 0 \) . $
  This is relative bigness in the analytic sense #cite(label("Fujino2022")) Definition 2.46.
    Apply it to $N = L - \( K_T + C_U \)$. The klt base-point-free theorem gives, after shrinking around $z$,
    relative generation of $L^k$ for #emph[every] sufficiently large integer $k$ #cite(label("Fujino2022"))
    Theorem 6.2 and Remark 6.3.
  Choose finitely many such generating sections near the compact fibre $F = f^(- 1) \( z \)$.
    The morphism they define on the projective reduced fibre $F_(upright("red"))$ is constant on each irreducible
    component: a positive-dimensional image would yield a curve with positive degree against the pullback of the
    hyperplane bundle, contrary to the numerical triviality of $L^k$.
    Such a curve is obtained by successive general hyperplane sections of a component.
    Connectedness of $F$ makes the images of all its components the same point.
    A linear combination of the generating sections is consequently nonzero at every point of $F_(upright("red"))$.
  This section is a generator of $L^k$ in the local ring at every point of $F$:
    its residue is nonzero, and hence its representing function is a unit. This also treats a nonreduced fibre.
    Properness allows us to shrink $U$ away from the image of the section’s zero set.
    Thus $L^k$ is trivial on $f^(- 1) U$. Apply the argument to consecutive integers $k$ and $k + 1$,
    and use one common neighbourhood. Their quotient trivializes $L$ itself.
    Since $f_(*) cal(O)_T = cal(O)_Z$, on this neighbourhood $f_(*) L tilde.eq cal(O)_U$,
    and evaluation is an isomorphism. These local conclusions give (3.1) globally.
    No additional tensor power enters the integral conclusion. ◻
]

The nef variant is important even when the adjoint has degree zero over $f$.
  For example, if $P = K_T + C$ is a rational klt adjoint, $ell P$ is Cartier,
  and $P$ is numerically trivial over $f$, apply Lemma 9 to $L = ell P$.
  Its difference from the adjoint is $\( ell - 1 \) P$, so the #emph[same] index $ell$ descends.

=== 3.2 Supporting classes and projectivity <supporting-classes-and-projectivity>

A class is #emph[modified big] if it is the birational pushforward of a big class #cite(label("HX2026"))
  Definition 2.8. In particular, a big class is modified big.

We use the generalized cone theorem #cite(label("HX2026")) Theorem 1.3.
  For a compact Kähler gklt pair with a descending nef part $beta$,
  the cone $overline(upright("NA")) \( T \)$ is the sum of its adjoint-nonnegative part and rays of rational
  curves. Only finitely many rays are needed when the boundary plus $beta$ is big.
  The supporting contractions needed in dimensions at most four are proved in Proposition 41.
  Their projectivity will be obtained from the ordinary rational adjoint.

#thm([Lemma 3.2.])[
  (Supports with a Kähler margin).  #emph[Let $\( T \, B \)$ be an ordinary rational klt pair on a normal compact
    Kähler space. Assume that $B$ is $bb(Q)$-Cartier and that $D = K_T + B$ is a rational line bundle.
    If $D$ is not nef, $overline(upright("NA")) \( T \)$ has a $D$-negative extremal ray.
    Every such ray $R$ is generated by a rational curve and has a nonempty relatively open set $cal(U)_R subset
    R^perp$ of classes satisfying
#[#set math.equation(numbering: n => "(3.2)")
 $ alpha upright(" is nef") \, wide overline(upright("NA")) \( T \) ∩ alpha^perp = R \, wide alpha -
   c_1 \( D \) upright(" is Kähler") . $ <eq:absolute-support>]

]
] <lem:absolute-support>

#proof[
  Fix a Kähler class $omega$ and write $d = c_1 \( D \)$. Cone duality applies because klt singularities are
    rational. The slice
  $ S = { v in overline(upright("NA")) \( T \) : omega dot.op v = 1 } $
  is compact. Indeed, fix smooth representatives of a basis of $H_(upright("BC"))^(1 \, 1) \( T \)$.
    Each is bounded above and below by a multiple of a Kähler form, so all its pairings on $S$ are bounded;
    the slice is closed. If $D$ is not nef, the minimum of $d$ on $S$ is negative.
    An extreme point of its minimum face gives a negative extremal ray.
  Fix any such ray and let $r in S$ be its normalized point.
    Choose $epsilon > 0$ with $\( d + epsilon omega \) dot.op r < 0$.
    The descending nef part $epsilon omega$ changes no discrepancy, and $B +
    epsilon omega$ is big since $B$ is effective and $bb(Q)$-Cartier. The finite form of the cone theorem gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ overline(upright("NA")) \( T \) = overline(upright("NA")) \( T \)_(d + epsilon omega gt.eq 0) +
     sum_(j = 1)^N bb(R)_(gt.eq 0) \[ C_j \] \, $ <eq:absolute-finite-cone>]
  where the $C_j$ are rational curves. Normalize their classes in $S$ and discard repetitions.
    By extremality, $r$ is one of these points, say $r_1$. Let $K$ be the convex hull of the others and of $S ∩ {
    d + epsilon omega gt.eq 0 }$. This is compact and excludes $r$; otherwise extremality of $r$ would fail.
  If $K$ is nonempty, strict separation gives a linear functional $h$ with $h \( r \) = 0$ and $h > 0$ on $K$,
    after subtracting a multiple of $omega$. Regard it as a Bott–Chern class by duality.
    For all sufficiently small $delta > 0$, $h - delta d$ is strictly positive on $K$ and at $r$.
    Since $S = "conv" \( { r } union K \)$, it is strictly positive on $S$, hence Kähler.
    Thus $alpha = h \/ delta$ has the required properties. Its positive minimum on $K$ persists under small
    perturbations in $R^perp$; openness of the Kähler cone also preserves $alpha - d$.
    These perturbations give $cal(U)_R$. If $K$ is empty, then $S = { r }$ and $- d$ is Kähler;
    a small neighbourhood of $0$ in $R^perp$ has the required properties. This includes the case $R^perp = { 0 }$. ◻
]

#thm([Lemma 3.3.])[
  (Relative positivity).  #emph[Let $f : T arrow.r Z$ be a proper morphism of compact complex spaces,
    with $T$ and $Z$ Kähler. Suppose that $L$ is a rational line bundle and
$ c_1 \( L \) = kappa - f^(*) gamma \, $

 where $kappa$ is Kähler on $T$ and $gamma$ is a smooth real Bott–Chern class on $Z$.
   Then $L$ is $f$-ample and $f$ is projective. Conversely, a normal space projective over a compact Kähler space
   is compact Kähler if it has a global relatively ample line bundle.]
] <lem:relative-positivity>

#proof[
  Clear the denominator of $L$. Its Bott–Chern identity permits a smooth Hermitian metric whose curvature is the
    indicated difference of forms. On every fibre its curvature is positive.
    Positivity of a line bundle on a compact complex space implies ampleness,
    and for a proper analytic map ampleness on every fibre is equivalent to relative ampleness
    #cite(label("FujinoVanishing2026")) Corollary 1.12 and Definition 3.1–Remark 3.2.
    This criterion does not presuppose projectivity and applies to nonreduced fibres as well.
    Existence of the relatively ample line bundle makes $f$ projective.
  For the converse, local relative embeddings give metrics on a relatively ample bundle with positive curvature in
    fibre directions. Glue their weights by a partition of unity on the base.
    The resulting metric retains that positivity. Add a sufficiently large multiple of a base Kähler form to its
    curvature. The sum is strictly positive; compactness allows one multiple to work everywhere. ◻
]

=== 3.3 The ordinary contraction and flip <the-ordinary-contraction-and-flip>

We can now perform each step and preserve the category. The next proposition records both the numerical ranks of
  the negative contraction and the actual canonical algebra of a flip.
  The latter description will also be used in the conditional arbitrary-termination argument.

#thm([Proposition 3.4.])[
  (Ordinary negative steps).  #emph[Let $\( T \, B \)$ be an ordinary rational klt pair on a normal compact Kähler
    space of dimension at most four, globally $bb(Q)$-factorial in the Weil-divisor sense,
    with canonical sheaf a rational line bundle. Put $D = K_T + B$.
    Every $D$-negative extremal ray $R subset overline(upright("NA")) \( T \)$ has a projective contraction $f :
    T arrow.r Z$ with connected fibres and normal compact Kähler target, such that
#[#set math.equation(numbering: n => "(3.4)")
 $ f^(*) H_(upright("BC"))^(1 \, 1) \( Z \) = R^perp \, wide rho \( T \/ Z \) = 1 \, wide -
   D upright(" is ") f upright("-ample") . $ <eq:ordinary-negative-bc>]

 Here $rho$ is the rank of global line-bundle degrees on contracted curves.
   The target has rational singularities and $R^j f_(*) cal(O)_T = 0$ for $j > 0$.
   If $dim Z < dim T$, this is a Mori fibre space. Otherwise $f$ is bimeromorphic,
   and precisely one of the following occurs.]
  + #emph[The exceptional locus is one prime divisor $E$. Put $T' = Z$, $B' = f_(*) B$ and $D' = K_(T') + B'$. Then
#[#set math.equation(numbering: n => "(3.5)")
 $ D = f^(*) D' + e E wide \( e > 0 \) . $ <eq:ordinary-divisorial-difference>]

]
  + #emph[The contraction is small. For an adjoint Cartier index $r > 0$, the intrinsic algebra
#[#set math.equation(numbering: n => "(3.6)")
 $ cal(R)_r = xor.big_(m gt.eq 0) f_(*) cal(O)_T \( m r D \) $ <eq:ordinary-flip-algebra>]

 is locally finitely generated, and $T' = "Proj"_Z cal(R)_r$ is the ordinary flip.
   It has a small projective morphism $f^(+) : T' arrow.r Z$ with connected fibres.
   Put $B' = phi.alt_(*) B$ and $D' = K_(T') + B'$, where $phi.alt :
   T arrow.r.dashed T'$ is the induced small map. For a sufficiently divisible choice of $r$ there is an actual
   isomorphism
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(O)_("Proj"_Z cal(R)_r) \( 1 \) tilde.eq cal(O)_(T') \( r D' \) . $ <eq:ordinary-tautological>]

 In particular $D'$ is a rational line bundle and is $f^(+)$-ample.
   Passing to a sufficiently divisible Veronese leaves $T'$ unchanged.]
  #emph[In both birational cases, $T'$ is compact Kähler and globally Weil-divisor $bb(Q)$-factorial,
    its canonical sheaf is a rational line bundle, and $\( T' \, B' \)$ is klt.
    Strong global $bb(Q)$-factoriality is preserved when imposed on $T$.
    A supplied global canonical Weil divisor is transported to a canonical Weil divisor on $T'$.
    No prime divisor is extracted. All log discrepancies weakly increase;
    the increase is strict for every original prime contracted by the step, and, for a flip,
    for every place centred in either exceptional locus.]
] <prop:ordinary-step>

#proof[
  Choose $alpha in cal(U)_R$ from Lemma 10 and put $kappa = alpha - c_1 \( D \)$.
    Proposition 41 gives $f : T arrow.r Z$ and $gamma$ Kähler with $alpha = f^(*) gamma$.
    Thus $c_1 \( - D \) = kappa - f^(*) gamma$, and Lemma 11 proves projectivity and relative ampleness.
    This establishes projectivity without strong factoriality. For every curve $C subset T$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ f \( C \) upright(" is a point") quad arrow.l.r.double quad alpha dot.op C = 0 quad
     arrow.l.r.double quad \[ C \] in R . $ <eq:ordinary-contracted-curves>]
  The rational curve generating $R$ is contracted, so $f$ is nontrivial.
  Relative vanishing gives $R^j f_(*) cal(O)_T = 0$ for $j > 0$ #cite(label("Fujino2022")) Theorem 5.2;
    the log Fano base has rational singularities #cite(label("DHP2024")) Lemma 8.8.
    Lemma 3 now identifies $f^(*) H_(upright("BC"))^(1 \, 1) \( Z \)$ with the classes of degree zero on all
    vertical curves, which is exactly $R^perp$. The global line-bundle rank is also one,
    since all those curves are proportional and the rational line bundle $D$ detects their ray. This proves (3.4).
    The lower-dimensional case has all the stated Mori fibre-space properties.
    In equal dimension, connectedness gives generic degree one, so $f$ is bimeromorphic.
  #emph[Divisorial contractions.] Suppose $E$ is an exceptional prime. It is $bb(Q)$-Cartier.
    If $E dot.op R gt.eq 0$, it would be $f$-nef, contradicting negativity for a nonzero effective exceptional
    divisor. Thus $E dot.op R < 0$. Every vertical curve lies in $E$,
    since an effective $bb(Q)$-Cartier divisor has nonnegative degree on a curve outside its support.
    Every positive-dimensional projective fibre is covered by curves.
    A zero-dimensional local component of a connected fibre would be isolated,
    and the birational form of Zariski’s main theorem would make $f$ an isomorphism there.
    Consequently $"Exc" \( f \) = E$.
  For a prime Weil divisor $A_Z$ on $Z$, let $A_T$ be its strict transform.
    Choose $t in bb(Q)$ so $\( A_T + t E \) dot.op R = 0$. The coefficient is rational by taking the ratio of the
    two rational degrees on one integral curve. A Cartier multiple of $A_T + t E$ descends by Lemma 9:
    its difference from $D$ is relatively ample. The descended line bundle agrees with the corresponding reflexive
    power of $cal(O)_Z \( A_Z \)$ off $f \( E \)$, a subset of codimension at least two.
    Reflexivity identifies them everywhere. Hence every global prime on $Z$ is $bb(Q)$-Cartier.
  If a global canonical Weil divisor is given, push it forward.
    It agrees with the canonical sheaf on the big open where $f$ is an isomorphism,
    so reflexivity shows that it remains a canonical Weil representative.
    Alternatively, start with an invertible reflexive power of $omega_T$,
    adjust it by a rational multiple of $E$ to degree zero, and descend after clearing denominators.
    On the same big open the result is a reflexive power of $omega_Z$; hence that power is invertible everywhere.
    This proves the canonical assertion without assuming a global meromorphic canonical section.
  Now $D'$ is a rational line bundle and its canonical identification away from $E$ gives (3.5).
    Intersection with $R$ gives $e > 0$. If $b_E$ is the coefficient of $E$ in $B$, then
  $ a \( E \; Z \, B' \) = 1 - b_E + e > 1 - b_E = a \( E \; T \, B \) > 0 . $
  Pullback of the effective divisor $e E$ gives weak increase for all other log discrepancies.
    Thus the target pair is klt.
  #emph[The small canonical model.] Suppose $f$ is small. Finite generation of the ordinary relative log canonical
    ring #cite(label("Fujino2022")) Theorem 1.18 gives local finite generation of (3.6).
    When canonical data are written as sheaves, this application can be made over each Stein open in $Z$:
    nonzero sections of rank-one proper direct images provide the meromorphic representatives there.
    Changing representatives induces compatible graded isomorphisms of the intrinsic algebra.
  The ordinary analytic flip theorem #cite(label("Fujino2022")) Theorem 1.14 constructs precisely its relative
    canonical model. It has no local factoriality hypothesis.
    Its proof glues the unique local log canonical models, giving a normal small projective $f^(+) : T' arrow.r
    Z$ globally. The fibres are connected because $Z$ is normal.
    A finite cover of the compact base permits one common sufficiently divisible Veronese generated in degree one.
    Replace $r$ by that multiple. The resulting tautological bundle is relatively ample and agrees with
    $cal(O)_T \( r D \)$ on the common big open. Its reflexive extension is $cal(O)_(T') \( r D' \)$,
    proving (3.7) as an actual bundle isomorphism. This also proves that $D'$ is a rational line bundle.
    The relative Proj is invariant under this Veronese operation. By Lemma 11, $T'$ is compact Kähler.
  For a global prime $A'$ on $T'$, transform it to $A$ on $T$ and choose $t in bb(Q)$ so $\( A + t D \) dot.op R =
    0$. Descend a Cartier multiple by Lemma 9. On $T'$ its pullback agrees on the common big open with the same
    multiple of $A' + t D'$. Reflexivity extends the identification; since $D'$ is already a rational line bundle,
    $A'$ is $bb(Q)$-Cartier. This proves global Weil-divisor factoriality.
    A given canonical Weil divisor is transported on that common open and then reflexively.
    In the sheaf formulation, repeat the descent argument with an invertible power of $omega_T$ adjusted by $t D$;
    undoing the twist by $t D'$ proves the rational-line-bundle property of $omega_(T')$.
  On a common smooth resolution $p : V arrow.r T$, $q : V arrow.r T'$, Lemma 5 gives the actual discrepancy divisor
  #[#set math.equation(numbering: n => "(3.9)")
   $ p^(*) D = q^(*) D' + F \, wide F gt.eq 0 \, $ <eq:ordinary-small-difference>]
  exceptional over both sides, with the asserted strictness over the flipping and flipped loci.
    This also proves klt preservation.
  #emph[Optional strong factoriality.] In the divisorial case,
    take any coherent rank-one reflexive sheaf $cal(F)$ on $Z$.
    Its reflexive pullback to $T$ is coherent of rank one. Strong factoriality supplies an invertible reflexive
    power. Adjust it by a rational multiple of $E$, descend as above, and compare off $f \( E \)$.
    A reflexive power of $cal(F)$ is therefore a line bundle.
  In the small case start with such a sheaf $cal(F)'$ on $T'$. On a common smooth resolution put
  $ cal(M) = \( q^(*) cal(F)' \/ upright("torsion") \)^(* *) \, wide cal(F) = \( p_(*) cal(M) \)^(* *) . $
  Here $cal(M)$ is a line bundle and $cal(F)$ is coherent reflexive of rank one;
    both give the required transform on the common big open. An invertible power of $cal(F)$,
    adjusted by a rational multiple of $D$, descends. Pull back the descended bundle and undo the twist by $D'$.
    After clearing denominators, reflexivity identifies the resulting line bundle with a reflexive power of
    $cal(F)'$. Thus the strong condition is preserved. Only sheaves defined on the whole compact spaces have been
    used. ◻
]

=== 3.4 Transport of Bott–Chern classes <transport-of-bottchern-classes>

For later scaling we need to transport one fixed nef datum.
  The following construction uses the rank of the negative contraction only.
  It makes no assertion that all Bott–Chern classes on a flipped space come from the preceding space.

#thm([Lemma 3.5.])[
  (Class transport).  #emph[For a birational step of Proposition 12, let $f' : T' arrow.r
    Z$ mean $f^(+)$ in the small case and $upright("id")_Z$ in the divisorial case.
    Every $theta in H_(upright("BC"))^(1 \, 1) \( T \)$ has a unique expression $theta = f^(*) eta +
    s thin c_1 \( D \)$, with $eta in H_(upright("BC"))^(1 \, 1) \( Z \)$ and $s in bb(R)$. Define
#[#set math.equation(numbering: n => "(3.10)")
 $ theta' = \( f' \)^(*) eta + s thin c_1 \( D' \) . $ <eq:class-transport>]

 On a common resolution, $p^(*) theta - q^(*) theta'$ is the class of an actual divisor exceptional over $T'$.
   This rule sends the class of a global Weil divisor to that of its transform or pushforward.
   Moreover, it propagates the fixed-nef-part trace relation of Lemma 6,
   with an actual effective exceptional correction on the new model.
   The same conclusions hold for the ordinary real-boundary steps of Proposition 25.]
] <lem:class-transport>

#proof[
  Since $D dot.op R eq.not 0$, subtracting a unique multiple of $c_1 \( D \)$ makes $theta$ vanish on $R$.
    Equation (3.4) and pullback injectivity give the unique $eta$.
    On a common resolution over $Z$ the two pullbacks of $eta$ agree. Therefore
  $ p^(*) theta - q^(*) theta' = s thin \[ p^(*) D - q^(*) D' \] . $
  The expression in brackets is the actual exceptional discrepancy divisor already constructed in the proof of the
    proposition.
  If $theta = c_1 \( A \)$ for a global Weil divisor $A$, the difference $p^(*) A -
    q^(*) A'$ is likewise exceptional over $T'$, where $A'$ is its transform or pushforward.
    Subtracting the two identities represents $q^(*) \( theta' - c_1 \( A' \) \)$ by a $q$-exceptional divisor.
    That divisor is numerically trivial over $q$, so negativity in both signs makes it zero.
    Pullback injectivity gives $theta' = c_1 \( A' \)$.
  Finally suppose the old trace $H_T$ of a fixed nef class on an earlier model has, on a common high resolution,
    the relation
  $ p^(*) H_T = p_0^(*) H + \[ J_T \] . $
  If $H_T = f^(*) eta + s thin c_1 \( D \)$, the new correction is the actual divisor
  $ J_(T') = J_T - s \( p^(*) D - q^(*) D' \) \, wide q^(*) H_(T') = p_0^(*) H + \[ J_(T') \] . $
  Every old exceptional divisor remains exceptional over $T'$: neither kind of step extracts divisors.
    The resulting correction $J_(T')$ is therefore an actual $q$-exceptional divisor.
    Its negative is $q$-nef because $p_0^(*) H$ is nef. Negativity gives $J_(T') gt.eq 0$,
    and uniqueness and compatibility are those of Lemma 6.
  For the stated real-boundary extension, Proposition 25 supplies the ordinary step and its negative-side
    Bott–Chern rank. The difference $p^(*) D - q^(*) D'$ is an actual exceptional real discrepancy divisor,
    as shown in Section 6.2. The decomposition, transport formula,
    and correction argument above therefore apply unchanged. ◻
]

#prodef([Remark 3.6.])[
  Proposition 12 starts on the given pair and can be reapplied after every finite prefix of ordinary steps.
    It allows every negative ray. Its construction is independent of any termination claim,
    and makes no assertion about the positive-side quotient
    $H_(upright("BC"))^(1 \, 1) \( T' \) \/ \( f^(+) \)^(*) H_(upright("BC"))^(1 \, 1) \( Z \)$ or about equality
    of the full Bott–Chern ranks across a flip.
] <rem:ordinary-continuation>

== 4 Termination for ordinary terminal fourfold pairs <sec:counts>

We prove termination of ordinary flips for compact Kähler fourfold pairs with effective real boundary and log
  discrepancy $a \( E \) > 1$ for every exceptional place. Two finite counts replace projectivity of the ambient
  fourfold: analytic cycle classes control contractions, and low-discrepancy places control flipped surfaces.
  The bases of successive projective contractions may vary.
  We first establish these counts, including their generalized-pair form needed for extraction later in the proof.

=== 4.1 Loss of analytic cycle classes <loss-of-analytic-cycle-classes>

For a compact complex analytic space $V$ and an integer $k gt.eq 0$, put

$ cal(C)_k \( V \) & := "span"_(bb(R)) { \[ S \] in H_(2 k) \( V \, bb(R) \) :
  S subset V upright(" irreducible compact analytic") \, med dim S = k } \,\
c_k \( V \) & := dim_(bb(R)) cal(C)_k \( V \) . $

Fundamental classes here use the complex orientation on the regular loci.
  Compact analytic spaces admit finite triangulations compatible with any specified finite collection of closed
  analytic subsets, with simplicial dimension at most twice the complex dimension. Thus $c_k \( V \)$ is finite.
  We recall the abstract-space reduction to make the topology used here explicit.
  Teissier’s compatible Whitney stratification #cite(label("Teissier1982")) Chapter III,
  Propositions 1.5 and 2.2.2 has finitely many strata on a compact space.
  Choose finitely many analytic charts $z_j : U_j arrow.r.hook
  bb(C)^(N_j)$ and nonnegative smooth cutoffs $rho_j$ compactly supported in these charts whose positivity sets
  cover the space. Extend $rho_j$ and $rho_j z_j$ by zero. The map

$ x mapsto #scale(x: 120%, y: 120%)[\(] rho_j \( x \) \, rho_j \( x \) z_j \( x \) #scale(x: 120%, y: 120%)[\)]_j $

is a topological embedding into a Euclidean space. Near a point where $rho_j > 0$,
  its components extend smoothly to the ambient chart and the $j$-th block has the smooth left inverse
  $\( t \, w \) mapsto w \/ t$. It is therefore locally an ambient smooth embedding,
  which preserves the Whitney conditions. Mather’s control data #cite(label("Mather1970")) Section 7,
  Proposition 7.1, and Section 8 and Goresky’s triangulation theorem #cite(label("Goresky1978")) Section 5 now
  give a compatible triangulation, smooth on each stratum. Compactness makes it finite,
  and smoothness on strata gives the dimension bound. Borel–Moore localization below is then the relative
  simplicial-chain sequence for a closed analytic subset and its complement.

If $V$ is Kähler and $S$ is such a subspace, then

#[#set math.equation(numbering: n => "(4.1)")
 $ chevron.l \[ omega \]^k \, \[ S \] chevron.r = integral_(S_(upright("reg"))) omega^k > 0 $ <eq:positive-cycle>]

for a Kähler form $omega$ on $V$. Thus $\[ S \] eq.not 0$, including when $V$ or $S$ is singular.

#thm([Lemma 4.1.])[
  (Cycle loss).  #emph[Let $X arrow.r.dashed Y$ be a bimeromorphic transformation of compact Kähler spaces,
    represented by a proper bimeromorphic diagram. Suppose it identifies
$ U = X \\ A tilde.eq Y \\ B \, $

 where $A$ and $B$ are closed analytic subspaces and $dim B < k$. Then there is a surjection
$ cal(C)_k \( X \) arrow.r cal(C)_k \( Y \) . $

 If $A$ contains an irreducible compact analytic $k$-dimensional subspace, then $c_k \( X \) > c_k \( Y \)$.]
  #emph[Consequently, in a sequence of bimeromorphic transformations of $n$-dimensional compact Kähler spaces
    which extract no prime divisors, only finitely many transformations contract a prime divisor.
    A small transformation preserves $c_(n - 1)$.]
] <lem:cycle-loss>

#proof[
  The Borel–Moore localization sequence for $B subset Y$ contains
  $ H_(2 k) \( B \, bb(R) \) arrow.r H_(2 k) \( Y \, bb(R) \) arrow.r^(med j_Y^(*) med)
    H_(2 k)^(upright("BM")) \( U \, bb(R) \) arrow.r H_(2 k - 1) \( B \, bb(R) \) . $
  The outside groups vanish: the real dimension of $B$ is at most $2 k - 2$. Thus $j_Y^(*)$ is an isomorphism.
    Compose restriction from $X$ with its inverse to obtain a linear map
  $ H_(2 k) \( X \, bb(R) \) arrow.r^(med j_X^(*) med) H_(2 k)^(upright("BM")) \( U \, bb(R) \)
    arrow.r^(med \( j_Y^(*) \)^(- 1) med) H_(2 k) \( Y \, bb(R) \) . $
  For an irreducible $k$-cycle $S subset X$ not contained in $A$,
    its restriction is the fundamental class of $S ∩ U$. Closing its image in $Y$ gives its strict transform:
    analyticity follows by taking the proper image of the corresponding strict transform in the given diagram.
    The displayed map therefore sends $\[ S \]$ to this transformed cycle class.
    It sends $\[ S \]$ to zero when $S subset A$.
  Conversely, no $k$-dimensional subspace of $Y$ is contained in $B$.
    Its strict transform in $X$ consequently maps to its fundamental class.
    This proves the asserted surjection of cycle spans. If $S subset A$ has dimension $k$, its nonzero class,
    by (4.1), is in the kernel. This proves the strict inequality.
  For a transformation extracting no prime divisor, choose the common isomorphic open so that the complement in
    the target has codimension at least two. Every contracted source prime lies in the source complement.
    Apply the result with $k = n - 1$ at every step. The nonnegative integer $c_(n - 1)$ cannot decrease
    infinitely often. For a small transformation both complements have codimension at least two,
    so applying the result in both directions gives equality. ◻
]

This argument does not assert surjectivity on full homology,
  and does not compare the Bott–Chern spaces of the two models.

=== 4.2 Low places on compact log smooth data <low-places-on-compact-log-smooth-data>

We use generalized discrepancies in the sense of Section 2.
  A place is called exceptional over $X$ when its center on $X$ has codimension at least two.

#thm([Lemma 4.2.])[
  (Low places and their projective realization).  #emph[Let $\( X \, B + upright(bold(M)) \)$ be a generalized
    pair on a compact normal complex space, with effective real boundary of finite support and nef
    b-$\( 1 \, 1 \)$ data descending to a model projective over $X$.
    Fix a projective log resolution $p : W arrow.r X$ carrying those data.]
  + #emph[If the pair is generalized klt, there is $epsilon.alt >
    0$ such that every prime divisor over $X$ has log discrepancy at least $epsilon.alt$,
    and only finitely many exceptional places have
$ a \( E \; X \, B + upright(bold(M)) \) < 1 + epsilon.alt . $

]
  + #emph[If the pair is generalized terminal and $b = max \( { 0 } union { "coeff"_D B } \)$,
    there are only finitely many exceptional places with
$ a \( E \; X \, B + upright(bold(M)) \) < 2 - b . $

]
  + #emph[If the pair is generalized lc and $U subset X$ is its generalized klt locus,
    there is $epsilon.alt > 0$ for which the assertion in (i) holds for places whose centers meet $U$.]
  #emph[In each assertion the finite set of exceptional places can be represented simultaneously by prime divisors
    on a smooth model projective over $X$. In particular, any prescribed finite set of exceptional places with
    $a \( E \; X \, B + upright(bold(M)) \) lt.eq 1$ for a generalized klt pair has such a realization.
    This conclusion does not use an extraction or termination theorem.]
] <lem:low-places>

#proof[
  Let $L in H_(upright("BC"))^(1 \, 1) \( X \)$ be the generalized log class and let
    $M_W = \[ upright(bold(M))_W \]$ be the nef trace class on $W$. Write the crepant formula as
  #[#set math.equation(numbering: n => "(4.2)")
   $ \[ K_W + Delta \] + M_W = p^(*) L . $ <eq:carrier-boundary-count>]
  This is the crepant boundary identity defining generalized discrepancies;
    it is an equality of Bott–Chern classes when the nef data are transcendental.
    The boundary $Delta$ is an actual real divisor with simple normal crossing support.
    Since the nef data descend to $W$, every further generalized discrepancy is the ordinary discrepancy for
    $\( W \, Delta \)$. The coefficients of $Delta$ need not be nonnegative.
    We may enlarge its listed simple normal crossing divisor by components of coefficient zero.
    Here a closed stratum means an irreducible component of an intersection of listed components; it is smooth,
    and is the closure of its open stratum.
  We give the local estimate and the realization argument explicitly;
    they are the log smooth calculations underlying #cite(label("KM1998")) Proposition 2.36 and
    #cite(label("CT2023")) Proposition 2.8. Write $Delta = sum_j d_j D_j$ and put $w_j = 1 - d_j$.
    Suppose first that every $w_j$ is positive, and set
  $ delta = min #scale(x: 120%, y: 120%)[\(] { 1 } union { w_j }_j #scale(x: 120%, y: 120%)[\)] > 0 . $
  Let $E$ be exceptional over a smooth model with this log smooth boundary.
    At a general point of its center $C$, let $c = "codim" C$, and choose local parameters $x_1 \, dots.h \,
    x_c$ for $C$ so that the boundary components containing $C$ are $x_1 = 0 \, dots.h \, x_r = 0$.
    For $v = "ord"_E$, the Jacobian calculation gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ a \( E \; W \, Delta \) gt.eq sum_(j = 1)^r \( 1 - d_j \) v \( x_j \) +
     sum_(j = r + 1)^c v \( x_j \) . $ <eq:coordinate-discrepancy-count>]
  Indeed, on a smooth model containing $E$, with local parameter $t$ for $E$, write $x_j =
    t^(v \( x_j \)) u_j$ at its general point. In a top exterior differential at most one factor can use the term
    involving $d t$ that lowers the order by one. Thus the relative Jacobian has order at least $sum_(j = 1)^c
    v \( x_j \) - 1$. Adding one and subtracting the boundary orders proves (4.3).
    The remaining coordinates along $C$ are holomorphic and contribute no negative orders.
  In particular every discrepancy is at least $delta$: for a divisor already on the smooth model it is its listed
    weight, or one if it is not listed; for an exceptional divisor use (4.3).
    If $C$ is not a stratum of the listed simple normal crossing divisor, then $c > r$.
    When $r > 0$, the right hand side is at least $delta + 1$; when $r = 0$, it is at least $c gt.eq 2 gt.eq
    delta + 1$. Hence
  #[#set math.equation(numbering: n => "(4.4)")
   $ C upright(" not a stratum") quad arrow.r.double quad a \( E \; W \, Delta \) gt.eq 1 +
     delta . $ <eq:nonstratum-cutoff>]
  Now fix a place $E$ with discrepancy strictly below $1 + delta$.
    If it is not already a divisor on $W$, its center is a stratum by (4.4). Blow up that closed stratum.
    The center is smooth, the blowup is projective, and the new listed boundary is again simple normal crossing.
    If the center is the intersection of the components indexed by $J$, then the new exceptional component has weight
  #[#set math.equation(numbering: n => "(4.5)")
   $ w_(upright("new")) = sum_(j in J) w_j . $ <eq:stratum-weight-sum>]
  Thus all weights remain at least $delta$, so the same argument applies on the next model.
    It excludes a non-stratum center at every stage until $E$ becomes a divisor.
  This process is finite. While $E$ is exceptional, a blowup of its smooth center of codimension $c gt.eq
    2$ changes its ordinary empty-boundary discrepancy by
  $ a \( E \; W_(upright("new")) \, 0 \) = a \( E \; W_(upright("old")) \, 0 \) - \( c - 1 \) v \( cal(I)_C \) . $
  The subtracted quantity is a positive integer, whereas an ordinary log discrepancy over a smooth space is a
    positive integer. Consequently only finitely many such blowups are possible.
    Thus $E$ is obtained by successive stratum blowups, which is the meaning of a #emph[toroidal place] here.
    This also realizes it on a projective model without first assuming that the original model on which $E$ was
    given was projective over $X$.
  For completeness, there are only finitely many such toroidal places.
    A toroidal prime over a fixed irreducible stratum is determined by a primitive nonzero vector
    $\( m_j \)_(j in J)$ of nonnegative integers in the normal boundary directions. Its discrepancy is
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(j in J) m_j w_j . $ <eq:monomial-discrepancy-count>]
  These statements follow also directly from the successive stratum blowups:
    a blowup inserts the sum of the relevant coordinate rays, and the discrepancy transforms by (4.5).
    The vector determines the monomial order and is unchanged when a boundary equation is multiplied by a unit.
    There are finitely many irreducible strata on the compact model.
    Since each $w_j gt.eq delta$, an upper bound $T$ on (4.6) bounds every $m_j$ by $T \/ delta$.
    This leaves finitely many vectors and hence finitely many places.
    Add the finitely many prime divisors already on $W$ which are exceptional over $X$.
  For a generalized klt pair, all weights in (4.2) are positive.
    The preceding argument with $epsilon.alt = delta$ proves (i) and its projective realization assertion.
    In particular $a lt.eq 1$ lies strictly below $1 + delta$.
  No rationality of the weights was used: their fixed positive minimum bounds the nonnegative integer vectors.
    Thus the conclusion applies to real boundaries and real nef data.
  For a generalized terminal pair, the coefficient of every $p$-exceptional component in $Delta$ is negative,
    since its log discrepancy is greater than one. The other coefficients are the original boundary coefficients
    and are at most $b < 1$. All the weights on $W$ are therefore at least $1 - b$.
    Repeat the argument with $delta = 1 - b$ and $T = 2 - b$ to prove (ii).
    Subsequent stratum blowups preserve this lower bound by (4.5).
  For (iii), the weights on $W$ are nonnegative. Set
  $ delta = min #scale(x: 120%, y: 120%)[\(] { 1 } union { w_j : w_j > 0 } #scale(x: 120%, y: 120%)[\)] > 0 . $
  The coefficient-one components have image in $X \\ U$. Thus,
    at the general center on $W$ of a place whose center on $X$ meets $U$, no zero-weight component occurs.
    Work there over $U$. The same estimates and stratum blowups use only positive weights,
    so give the uniform lower bound and the strict cutoff $1 + delta$.
    The strata in question are restrictions of the finitely many global strata,
    and the blowups can be performed along their smooth closed closures on the compact model.
    Meeting a zero-weight component elsewhere does not change a weight computed at the general point of the
    center. This proves finiteness and projective realization also in this case.
  Finally, to represent the entire finite set at once, take the dominating component of the fiber product of the
    finitely many projective realizations over $W$, normalize, and resolve projectively.
    The strict transforms of the designated prime divisors remain divisors on this common model.
    Its composite map to $X$ is projective. ◻
]

#prodef([Remark 4.3.])[
  The strict inequalities in Lemma 16 are necessary. For example, in $upright(bold(P))^n$, $n gt.eq 3$,
    let $H$ be a hyperplane with coefficient $b in \[ 0 \, 1 \)$.
    Blowing up any codimension-two linear subspace contained in $H$ gives log discrepancy $2 -
    b$ for $\( upright(bold(P))^n \, b H \)$. There are infinitely many such places,
    although this pair is terminal. With empty boundary their discrepancy is two.
    Below we count places strictly below a threshold and use a step at which a place reaches that threshold to
    obtain a strict decrease.
] <rem:strict-low-cutoff>

=== 4.3 Surface centres of low-discrepancy places <surface-centres-of-low-discrepancy-places>

The terminal termination argument must allow many places of discrepancy below two above a moving boundary surface.
  The next lemma identifies exactly the infinite families that will be harmless.
  Excluding only the first blowup above each surface would be incorrect;
  the correction in #cite(label("Fujino2005Addendum")) Proposition 3.1 and Lemma 3.2 is essential.

#thm([Lemma 4.4.])[
  #emph[Let $\( T \, Phi \)$ be an ordinary klt pair on a normal complex fourfold, with effective real boundary,
    $K_T$ a $bb(Q)$-line bundle, and $a \( E \; T \, Phi \) > 1$ for every exceptional prime divisor $E$ over $T$.
    Then $T$ is smooth in codimension two.]
] <lem:terminal-codim-two>

#proof[
  Dropping the effective boundary shows that $T$ has terminal singularities.
    Suppose its singular locus has a codimension-two component.
    Near a general smooth point of this component choose a holomorphic projection to $bb(C)^2$ submersive along
    it. Take a general fibre transverse both to the regular locus and, on a fixed log resolution,
    to the exceptional divisor and its strata. These transversality conditions hold after shrinking and choosing a
    general value. The resulting surface is a complete intersection in the Cohen–Macaulay space $T$,
    since klt singularities are rational, and is regular outside isolated points. It is therefore normal.
  Adjunction of a local Cartier pluricanonical power, first on the regular locus and then by reflexivity,
    restricts the relative canonical equality to the surface resolution.
    All its exceptional discrepancy coefficients are positive. A normal surface germ with this property is smooth.
    Indeed, negative definiteness of the exceptional intersection matrix shows that a positive exceptional
    discrepancy divisor has negative intersection with some exceptional curve.
    That curve has negative canonical degree; adjunction makes it a smooth rational $\( - 1 \)$-curve.
    Contract it smoothly and repeat. The remaining discrepancy coefficients stay positive by pushforward.
    Eventually no exceptional curve remains, and the proper bimeromorphic map to the normal surface is an isomorphism.
  On the other hand, a slice of a singular fourfold point by two equations has embedding dimension at least the
    ambient embedding dimension minus two, and hence greater than two.
    The chosen surface is singular there, a contradiction. ◻
]

#thm([Lemma 4.5.])[
  #emph[Let $\( T \, Phi \)$ be an ordinary klt pair on a compact normal complex fourfold, where $Phi gt.eq
    0$ is real and $a \( E \; T \, Phi \) > 1$ for every exceptional prime divisor $E$ over $T$.
    Apart from finitely many exceptional places, every exceptional place with $a \( E \; T \, Phi \) <
    2$ has centre a surface $S subset T$ with the following properties:
    $T$ and the reduced support of $Phi$ are generically smooth along $S$,
    exactly one positive boundary component contains $S$, and, if its coefficient is $b$, then
$ a \( E \; T \, Phi \) gt.eq 2 - b . $

 All places above such a surface are allowed in this conclusion, not just the exceptional divisor of its first blowup.]
] <lem:terminal-low-centres>

#proof[
  Choose a log resolution on which the positive strict boundary components are smooth and mutually disjoint.
    Starting with simple normal crossing support, blow up intersections of the positive components to separate
    them. Every exceptional crepant coefficient is negative by terminality.
    Thus the only positive components on this resolution are those disjoint strict transforms,
    with their original coefficients.
  Consider a place not already on the resolution. At its general centre, apply (4.3),
    dropping negative boundary coefficients. A centre of codimension at least three has log discrepancy at least
    $3 - b > 2$, if it lies in a positive component of coefficient $b$, and at least three otherwise.
    A codimension-two centre outside the positive support has log discrepancy at least two.
    Thus a place with $a < 2$ has codimension-two centre in one positive component,
    and its log discrepancy is at least $2 - b$.
  If this centre lies in the exceptional locus, it is an irreducible component of the intersection of that
    positive component and an exceptional divisor. There are finitely many such centres on the compact resolution.
    We check that each supports only finitely many places with $a < 2$.
    It suffices to retain only the smooth component of coefficient $b$,
    since deleting the negative coefficients lowers discrepancies. Blow up the fixed centre at its general point.
    Unless the given place has appeared, the same estimate forces its next centre to be the intersection of the
    positive strict transform and the new exceptional divisor.
    This intersection is unique over the general point of the original centre.
    The successive exceptional log discrepancies are
  $ 1 + k \( 1 - b \) \, wide k = 1 \, 2 \, dots.h . $
  At each further stage the negative coefficient of the newest exceptional divisor adds $k \( 1 - b \)$ to the
    lower bound $2 - b$. Hence only $k < 1 \/ \( 1 - b \)$ can occur before the cutoff two is reached.
    This proves finiteness over every fixed exceptional centre.
    These generic blowups are realized globally by blowing up the closures of the centres.
  Add the finitely many exceptional primes on the chosen resolution.
    All other centres under consideration lie outside its exceptional locus at their general points,
    where the resolution is an isomorphism. Their images are precisely the surfaces described in the statement. ◻
]

We now have the two counts needed for termination. A flipped surface will give a place whose discrepancy strictly
  increases into a fixed finite set. Once such surfaces disappear,
  a compact surface-class rank will decrease at every remaining step.

=== 4.4 Real terminal pairs <real-terminal-pairs>

#thm([Proposition 4.6.])[
  #emph[Let $\( T_0 \, Phi_0 \)$ be an ordinary klt pair on a normal globally $bb(Q)$-factorial compact Kähler
    fourfold, with $K_(T_0)$ a $bb(Q)$-line bundle and effective real boundary.
    Suppose $a \( E \; T_0 \, Phi_0 \) > 1$ for every exceptional prime divisor $E$ over $T_0$.
    Every sequence of ordinary $\( K_(T_i) + Phi_i \)$-flips starting at this pair terminates,
    provided all models are normal globally $bb(Q)$-factorial compact Kähler fourfolds,
    each $K_(T_i)$ is a $bb(Q)$-line bundle, and each flip is given by projective small contractions
$ T_i arrow.r^(med f_i med) Z_i arrow.l^(med f_i^(+) med) T_(i + 1) $

 with $- \( K_(T_i) + Phi_i \)$ relatively ample for $f_i$ and $K_(T_(i + 1)) +
   Phi_(i + 1)$ relatively ample for $f_i^(+)$. Here $Phi_(i + 1)$ is the strict transform of $Phi_i$.
   No pseudo-effectivity or bigness assumption is required.]
] <prop:terminal-real-four>

#proof[
  By Lemma 5, discrepancies do not decrease, and they increase strictly for a place centred in either exceptional
    locus. Since the maps are small, the exceptional places are the same on all models.
    Thus every pair remains terminal in the stated sense, and its ambient fourfold is smooth in codimension two by
    Lemma 18.
  Write the distinct positive coefficients of the boundary in decreasing order.
    We successively remove, by discarding finitely many initial steps,
    every flipping and flipped surface contained in a component of each coefficient.
    After the positive coefficients we treat the value zero, at which stage every flipped surface is considered.
  #emph[Eliminating flipped surfaces.] Fix the current coefficient $b$,
    and suppose that no flipping or flipped surface is contained in a component of coefficient greater than $b$.
    For $b = 0$ assume that all positive coefficients have already been treated.
    If $S$ is a flipped surface contained in a coefficient-$b$ component, or any flipped surface when $b = 0$,
    blow it up at its general point. The exceptional prime $E$ has new log discrepancy
  #[#set math.equation(numbering: n => "(4.7)")
   $ a \( E \; T_(i + 1) \, Phi_(i + 1) \) = 2 - sum_(l = 1)^s b_l "mult"_S Phi_(l \, i + 1) \, wide
     1 < a \( E \; T_(i + 1) \, Phi_(i + 1) \) lt.eq 2 - b \, $ <eq:surface-witness-values>]
  where $Phi_(l \, i + 1)$ are the positive prime boundary components and $b_l$ their fixed coefficients.
    The blowup place is defined globally by blowing up the closed surface and resolving;
    its generic point suffices for this computation.
  The values in (4.7) belong to a finite set, even for irrational coefficients. Indeed, terminality gives
  $ sum_l b_l "mult"_S Phi_(l \, i + 1) < 1 \, wide 0 lt.eq "mult"_S Phi_(l \, i + 1) < 1 \/ b_l . $
  Each multiplicity is an integer, and there are finitely many positive components.
    We use no discreteness assertion for all discrepancies.
  Strictness in Lemma 5 gives $a \( E \; T_i \, Phi_i \) < 2 - b$.
    Its discrepancy on the first model of the current tail is therefore also strictly below $2 - b$.
    By Lemma 19, outside a finite set such a place would initially have a surface centre in one boundary component
    of coefficient $c$, with discrepancy at least $2 - c$. Necessarily $c > b$.
    That centre persists as a surface in this component at every later step:
    at each step the map is an isomorphism at its general point,
    since otherwise the centre itself would be a flipping surface in a higher-coefficient component.
    It cannot become a flipped surface either, by the same higher-coefficient exclusion.
    Thus it cannot be the place just constructed. All these witness places belong to a fixed finite set.
  Each member of that finite set is used only finitely often.
    Between uses its discrepancy does not decrease, and at each use it strictly increases to one of the finitely
    many values (4.7). Consequently only finitely many steps have a flipped surface of the current kind.
    Pass beyond them.
  #emph[Eliminating flipping surfaces inside the boundary.] Suppose $b > 0$.
    Fix a coefficient-$b$ component and normalize its transforms on the two sides of a flip.
    Denote the normalizations by $D_i^nu \, D_(i + 1)^nu$, and normalize their common image in $Z_i$ to obtain
    $B_i$. The induced maps to $B_i$ are proper and bimeromorphic.
    They are isomorphisms away from the inverse image of the common exceptional image in $Z_i$,
    whose dimension is at most one by Lemma 5. Finite normalization preserves this bound.
    On $D_(i + 1)^nu$ its inverse image also has dimension at most one,
    because no flipped surface is contained in the boundary component.
  Every compact surface in $B_i$ has a strict transform on $D_i^nu$, so pushforward gives a surjection
  $ cal(C)_2 \( D_i^nu \) arrow.r cal(C)_2 \( B_i \) . $
  On the other side, Borel–Moore localization along the exceptional subset of dimension at most one makes
    restriction in degree four injective. Compatibility with proper pushforward and the common isomorphic open
    therefore gives an injection
  $ cal(C)_2 \( D_(i + 1)^nu \) arrow.r.hook cal(C)_2 \( B_i \) . $
  These are assertions about surface spans; no surjectivity on the full fourth homology of the negative side is needed.
  If a flipping surface lies in this boundary component, a surface above it on $D_i^nu$ maps to a set of dimension
    at most one in $B_i$. Its class is nonzero: its image in $T_i$ is a surface,
    and the square of a Kähler class on $T_i$ has strictly positive integral over it.
    One may compute this integral on a resolution of the surface.
    The finite normalization has positive generic degree on this surface, so the same nonvanishing holds upstairs.
    Its class is a nonzero kernel vector in the displayed surjection. Hence
  $ c_2 \( D_i^nu \) gt.eq c_2 \( D_(i + 1)^nu \) \, $
  with strict inequality whenever the component contains a flipping surface.
    Summing over the finitely many coefficient-$b$ components shows that only finitely many such steps occur.
    This completes the induction at $b$.
  #emph[The remaining flips.] After the positive coefficients have been treated,
    perform the flipped-surface argument with $b = 0$. No flipped surface remains.
    For every remaining flip, Lemma 5 gives
  $ dim "Exc" \( f_i \) + dim "Exc" \( f_i^(+) \) gt.eq 3 . $
  Smallness bounds both dimensions by two, so $"Exc" \( f_i \)$ contains a surface and $dim "Exc" \( f_i^(+) \)
    lt.eq 1$. Apply Lemma 15 with $k = 2$ to the common isomorphic open.
    It gives $c_2 \( T_i \) > c_2 \( T_(i + 1) \)$ at every remaining step,
    impossible for an infinite sequence of nonnegative integers. ◻
]

The algebraic discrepancy and cycle-count strategy originates in #cite(label("KMM1987")) Theorem 5-1-15 and
  Lemmas 5-1-16–5-1-17 and #cite(label("Fujino2004")) #cite(label("Fujino2005Addendum")).
  The proof above supplies the real-boundary argument and uses compact analytic cycle classes with Kähler
  positivity. It applies those geometric tools one step at a time, without a common projective base.

#thm([Corollary 4.7.])[
  #emph[Let $X_0$ be a normal globally strongly $bb(Q)$-factorial compact Kähler fourfold with terminal
    singularities. Every sequence starting at $X_0$ of ordinary empty-boundary negative divisorial contractions
    and flips, with the projectivity and compact Kähler conclusions of Proposition 12, terminates.
    No pseudo-effectivity hypothesis is required for this assertion about birational sequences.]
] <prop:terminal-four>

#proof[
  For flips, terminality persists by Lemma 5. For a divisorial contraction, (3.5) gives $K_(X_i) =
    f^(*) K_(X_(i + 1)) + e E$ with $e > 0$. The lost prime has target log discrepancy $1 + e > 1$;
    every other exceptional place has target discrepancy at least its source discrepancy,
    which was greater than one. Thus terminality persists throughout the sequence.
    Lemma 15 with $k = 3$ bounds the number of divisorial steps.
    Any infinite sequence would therefore have a tail consisting only of flips,
    contrary to Proposition 20 with zero boundary. ◻
]

== 5 The ordinary scaling construction <sec:scaling>

We record the ordinary scaling construction used in the lower-dimensional induction of Section 6.
  The construction starts on the given pair and uses only ordinary negative steps,
  with a fixed Kähler class as the scaling direction.

Fix a smooth Kähler form $h$ on $X$, with class $H$, large enough that $K_X + Delta + H$ is nef.
  Throughout this section $upright(bold(H))$ denotes the fixed b-nef datum obtained by pulling back this very
  form. On subsequent models its trace class is denoted by $H_T$, as in Lemma 6.
  We do not replace the fixed datum by arbitrary cohomologous current representatives.

=== 5.1 Constructing the scaling program <constructing-the-scaling-program>

#thm([Proposition 5.1.])[
  #emph[Let $\( X \, Delta \)$ satisfy the hypotheses of Theorem 2.
    There is an ordinary negative-ray program, finite or infinite,
$ \( X \, Delta \) = \( X_0 \, Delta_0 \) arrow.r.dashed \( X_1 \, Delta_1 \) arrow.r.dashed dots.h.c \, $

 in the same global Weil-divisor $bb(Q)$-factorial compact Kähler category.
   It stops when the ordinary adjoint is nef or a negative ray has a Mori fibre contraction. Put
$ D_i = K_(X_i) + Delta_i \, wide L_i \( t \) = D_i + t H_i \, wide H_i = H_(X_i) \, wide lambda_(- 1) = 1 . $

 At every stage before stopping there is a parameter $0 < lambda_i lt.eq
   lambda_(i - 1)$ and a contracted extremal ray $R_i$ such that
$ D_i dot.op R_i < 0 \, wide L_i \( lambda_i \) dot.op R_i = 0 \, wide L_i \( lambda_i \) upright(" is nef") . $

 The generalized pairs $\( X_i \, Delta_i + t upright(bold(H)) \)$ are gklt for $0 lt.eq t lt.eq lambda_(i - 1)$.
   A birational step is crepant for the data at $t = lambda_i$,
   and discrepancies do not decrease across that step for any $0 lt.eq t lt.eq lambda_i$.]
] <prop:scaling-construction>

#proof[
  On $X_0$, the nef datum descends, so its addition changes no discrepancies.
    Thus all the initial generalized pairs are gklt. Suppose the assertions have been established through $X_i$.
    If $D_i$ is nef, stop. Otherwise define
  $ lambda_i = min { t in \[ 0 \, lambda_(i - 1) \] : L_i \( t \) upright(" is nef") } . $
  The set is nonempty by induction and is closed and convex. Its minimum is positive because $D_i$ is not nef.
  We first find a ray at this threshold. Choose $t_k arrow.t lambda_i$ with $lambda_i \/ 2 < t_k < lambda_i$.
    The generalized cone theorem gives an extremal ray negative for $L_i \( t_k \)$.
    Since $L_i \( lambda_i \)$ is nef, that ray is also negative for $L_i \( lambda_i \/ 2 \)$.
    The trace $H_i$ is big by Corollary 7. Hence $Delta_i + \( lambda_i \/ 2 \) H_i$ is big,
    and the cone theorem gives only finitely many negative rays for this latter generalized pair
    #cite(label("HX2026")) Theorem 1.3. One ray $R_i$ therefore occurs for infinitely many $k$.
    On this fixed ray, continuity gives $L_i \( lambda_i \) dot.op R_i = 0$.
    Moreover $H_i dot.op R_i > 0$, so $D_i dot.op R_i < 0$.
  Apply Proposition 12 to this ordinary negative ray, and denote its contraction by $f_i : X_i arrow.r Z_i$.
    A fibre contraction gives the stopping alternative. Otherwise make the ordinary divisorial step or flip.
    Lemma 13 transports the trace $H_i$ to $H_(i + 1)$ while preserving its relation to the fixed b-datum.
    By Lemma 3, the class $L_i \( lambda_i \)$ descends to $Z_i$.
    Its descended class is nef, and its pullback on the new model is $L_(i + 1) \( lambda_i \)$.
    Thus the two threshold classes have equal pullbacks on a common resolution.
    Their difference is represented by the actual exceptional discrepancy divisor,
    which vanishes by negativity as in Lemma 8. The step is consequently generalized crepant at the threshold.
  For completeness, this also proves the induction on singularities.
    On a common resolution, the log discrepancy at each prime $E$ is affine in $t$.
    Its difference across the step is zero at $t = lambda_i$ and is the ordinary discrepancy increase at zero.
    Consequently
  #[#set math.equation(numbering: n => "(5.1)")
   $ & a \( E \, X_(i + 1) \, Delta_(i + 1) + t upright(bold(H)) \) - a \( E \, X_i \, Delta_i + t upright(bold(H)) \)\
 & wide = (1 - t / lambda_i) #scale(x: 120%, y: 120%)[\(] a \( E \, X_(i + 1) \, Delta_(i + 1) \) -
   a \( E \, X_i \, Delta_i \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 $ <eq:scaling-interpolation>]
  for $0 lt.eq t lt.eq lambda_i$. The generalized pairs on this interval remain gklt,
    and the new upper-threshold class is nef. The ordinary steps preserve all the stated properties of the
    original category by Proposition 12. ◻
]

== 6 Supporting contractions and finite ordinary programs <sec:perturbation>

The generalized pairs in this section have an effective real boundary and a fixed nef Bott–Chern class on a smooth
  carrier projective over the initial space. Their structure boundaries on higher models define generalized log
  discrepancies; generalized klt means that these discrepancies are positive.
  Equalities of $\( 1 \, 1 \)$-classes mean Bott–Chern equality.
  Equalities of line bundles are actual isomorphisms after clearing the stated denominators.

The proof uses Theorem 1.1 of
  #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026"))
  only for existing rational flip sequences. That theorem uses the low-place, relative-program, extraction,
  and special-termination results proved in Lemma 16 and Sections 9–11.
  Those results precede this use logically and do not depend on Theorem 2.
  In particular, the lower-dimensional termination theorem used below is Theorem 63,
  proved from the projective relative constructions in Section 9.
  When the ordinary-step construction is used in lower dimensions,
  it is applied only after the corresponding assertion $sans(B)_d$ has been established in the induction.

=== 6.1 Projectivity when a rational line bundle detects the ray <projectivity-when-a-rational-line-bundle-detects-the-ray>

We use the cone duality and finite-dimensional real Bott–Chern spaces of Section 2.
  A rational line bundle means an element of $"Pic" \( T \) ⊗ bb(Q)$.
  Relative ampleness always means a single global line bundle, after clearing a denominator.

#thm([Lemma 6.1.])[
  #emph[Let $f : T arrow.r Z$ be a proper contraction between normal compact Kähler spaces.
    Suppose $gamma$ is Kähler on $Z$ and
$ alpha = f^(*) gamma \, wide overline(upright("NA")) \( T \) ∩ alpha^perp = R $

 is a nonzero ray. If a global rational line bundle $D$ has $D dot.op R < 0$, then $-
   D$ is relatively ample and $f$ is projective.]
] <repair:lem:polarization>

#proof[
  Fix a Kähler class $omega$ on $T$ and normalize $overline(upright("NA")) \( T \)$ by $omega dot.op z = 1$.
    The resulting slice $S$ is compact. Its unique point on $R$ has negative $D$-degree, so $d =
    c_1 \( D \)$ is negative on a neighborhood of that point in $S$.
    On the complementary compact set, $alpha$ has a strictly positive minimum, while $d$ is bounded.
    For all sufficiently small $s > 0$, the class $alpha - s d$ is therefore strictly positive on $S$ and is
    Kähler by cone duality.
  Choose an integer $m > 0$ making $m D$ integral. Then
  $ c_1 \( - m D \) + f^(*) \( \( m \/ s \) gamma \) = \( m \/ s \) \( alpha - s d \) $
  is Kähler. On a neighborhood in the base with a potential for $gamma$,
    absorb that potential in a smooth metric on the same global line bundle $- m D$.
    Its curvature is positive on the fibres. The analytic positive-line-bundle criterion and the fibrewise
    relative-ampleness criterion make $- m D$ relatively ample.
    The line bundle was global throughout, so no gluing of unrelated local polarizations is required. ◻
]

If, as in Proposition 12, $alpha - c_1 \( D \)$ is already Kähler,
  one can apply this metric argument directly with $s = 1$.
  This proves projectivity after the contraction exists; it does not construct that contraction.

==== 6.1.1 Constructing a generalized flip from one global line bundle <constructing-a-generalized-flip-from-one-global-line-bundle>

The next argument supplies a global flip algebra whenever a projective negative contraction has an actual line
  bundle detecting its ray. It will allow the lower-dimensional reductions to use ordinary rational flips.

#thm([Proposition 6.2.])[
  (A global algebra for a detected flip).  #emph[Let $\( T \, B + upright(bold(M)) \)$ be a gklt pair on a normal
    compact Kähler space which is globally strongly $bb(Q)$-factorial,
    and let $A in H_(upright("BC"))^(1 \, 1) \( T \)$ be its adjoint class.
    Let $f : T arrow.r Z$ be a projective small contraction onto a normal compact Kähler space.
    Suppose that the classes of all $f$-vertical curves lie on one ray $R subset overline(upright("NA")) \( T \)$,
    that $A dot.op R < 0$, and that a global line bundle $L$ satisfies $L dot.op R < 0$.]
  #emph[Then $xor.big_(m gt.eq 0) f_(*) L^m$ is locally finitely generated.
    The relative Proj of a sufficiently divisible Veronese is a projective small contraction $f^(+) :
    T^(+) arrow.r Z$, where $T^(+)$ is compact Kähler and globally strongly $bb(Q)$-factorial.
    The reflexive transform $L^(+)$ is a rational line bundle,
    with a positive power equal to the relatively ample tautological bundle.
    The transformed boundary and the same b-nef datum define a gklt pair on $T^(+)$,
    with relatively Kähler adjoint $A^(+)$. This is the generalized flip,
    with the usual strict discrepancy increase at centres in either exceptional locus.]
  #emph[Moreover, if $t = \( A dot.op C \) \/ \( L dot.op C \) > 0$ for an $f$-vertical curve $C$,
    then there is a unique $eta in H_(upright("BC"))^(1 \, 1) \( Z \)$ such that
$ A = t thin c_1 \( L \) + f^(*) eta \, wide A^(+) = t thin c_1 \( L^(+) \) + \( f^(+) \)^(*) eta . $

 Every class on $T$ has the corresponding forward transport with an actual exceptional-divisor correction.
   No assertion of surjectivity on Bott–Chern groups is required.]
] <repair:prop:detector-flip>

#proof[
  Since $f$ has a global relatively ample bundle and all its vertical curves lie on $R$,
    numerical invariance of ampleness on the projective fibres shows that $- L$ is $f$-ample.
  #emph[A local rational ordinary adjoint.] Fix $z in Z$ and a relatively compact Stein neighbourhood $U$.
    Take a projective log resolution $p : V arrow.r T_U$ carrying $upright(bold(M))$, and put $rho = f p$.
    Write its actual structure boundary as $B_V$, so
  $ \[ K_V + B_V \] + \[ upright(bold(M))_V \] = p^(*) A . $
  Every coefficient of $B_V$ is less than one. Canonical divisors and a Cartier representative $D_L$ of $L$ can be
    chosen over $U$: the relevant proper direct images have rank one on the birational isomorphism locus,
    and Cartan’s Theorem A supplies sections nonzero there. Choose compatible canonical representatives and set
  $ N = t p^(*) D_L - K_V - B_V . $
  For every $rho$-vertical curve, its degree equals that of $upright(bold(M))_V$. Thus $N$ is $rho$-nef.
  It is also $rho$-big. Indeed, write $N$ as a positive convex combination of finitely many rational Cartier
    divisors $N_j$ in its finite Cartier span. If $P$ is $rho$-ample and $q_j N_j$ is integral,
    Cartan’s Theorem A applied to the rank-one sheaf $rho_(*) \( q_j N_j - P \)$ gives $q_j N_j tilde.op P +
    E_j$ with $E_j gt.eq 0$. Hence $N tilde.op_(bb(R)) H + E$ with $H$ relatively ample and $E gt.eq 0$.
    Choose $epsilon.alt > 0$ small enough that $\( V \, B_V + epsilon.alt E \)$ is sub-klt.
    The divisor $\( 1 - epsilon.alt \) N + epsilon.alt H$ is relatively ample.
    Express it as a positive combination of rational ample divisors and take general members of sufficiently high
    multiples. Relative Bertini #cite(label("DHP2024")) Theorem 2.20, applied on a log resolution of $B_V + E$,
    gives an effective $Theta tilde.op_(bb(R)) N$ such that $\( V \, B_V + Theta \)$ is sub-klt.
    The high multiples make the added coefficients arbitrarily small.
    All choices are made near the compact fibre; shrink $U$ once to retain them.
  Put $Delta = p_(*) \( B_V + Theta \) gt.eq 0$. Pushing down the finite principal-divisor expression and pulling
    it back again give
  $ K_(T_U) + Delta tilde.op_(bb(R)) t D_L \, wide p^(*) \( K_(T_U) + Delta \) = K_V + B_V + Theta . $
  Thus $\( T_U \, Delta \)$ is klt. Any finitely many base line bundles in a relative linear equivalence can first
    be trivialized by shrinking $U$. Record the resulting equality as
  #[#set math.equation(numbering: n => "(6.1)")
   $ K_(T_U) + sum_i d_i D_i = t D_L + sum_j b_j "div" \( g_j \) \, wide d_i > 0 \,
     $ <repair:eq:detector-rationalization>]
  using the positive support of $Delta$. After a further relatively compact shrinking,
    the displayed divisors have finitely many prime components:
    their locally finite supports meet a compact inverse image.
    Equality of coefficients in (6.1) is a finite rational affine system in $\( d_i \, t \, b_j \)$.
    The klt condition is open within this system, as seen on one log resolution;
    the pullbacks of its adjoints vary linearly by the displayed identity.
    A nearby rational solution therefore gives a rational effective klt boundary $Delta_q$ and $t_q in bb(Q)_(> 0)$ with
  #[#set math.equation(numbering: n => "(6.2)")
   $ K_(T_U) + Delta_q tilde.op_(bb(Q)) t_q D_L . $ <repair:eq:detector-local-adjoint>]
  The individual local primes $D_i$ need not be $bb(Q)$-Cartier:
    the identity ensures that the total adjoint is $bb(Q)$-Cartier.
  #emph[One global flip algebra.] The adjoint in (6.2) is $f_U$-antiample.
    Its ordinary flip and local finite generation follow from #cite(label("Fujino2022")) Theorems 1.14 and 1.18.
    Clearing the displayed linear equivalence identifies a Veronese of its canonical algebra with a Veronese of
    $cal(R) := xor.big_(m gt.eq 0) f_(*) L^m$ over $U$. Hence $cal(R)$ is locally finitely generated by
    #cite(label("Fujino2022")) Lemma 2.26. The graded pieces are coherent,
    and the section algebra over a connected open set is an integral domain,
    as is seen using a meromorphic generator of $L$. Compactness supplies one sufficiently divisible Veronese
    $cal(R)^(\( r \))$ generated in degree one. Its relative Proj $T^(+)$ restricts to the ordinary flip over
    every such $U$. It is therefore normal and small over $Z$,
    and has the global relatively ample bundle $cal(O)_(T^(+)) \( 1 \)$.
    On the common big open this bundle is $L^r$. Reflexivity gives
  $ \( L^(+) \)^(\[ r \]) tilde.eq cal(O)_(T^(+)) \( 1 \) . $
  This proves that $L^(+)$ is a rational line bundle before any assertion of factoriality.
    Relative positivity over the compact Kähler base makes $T^(+)$ compact Kähler.
  For any global rank-one reflexive sheaf $cal(F)^(+)$ on $T^(+)$,
    take its coherent reflexive transform $cal(F)$ on $T$ using a common resolution.
    Some $M = cal(F)^(\[ m \])$ is a line bundle. Choose $c in bb(Q)$ so that $\( M + c L \) dot.op C = 0$,
    and clear its denominator to obtain an integral bundle $J = n \( M + c L \)$ numerically trivial over $f$.
    The local rational klt pairs (6.2) satisfy $J - \( K_(T_U) + Delta_q \)$ relatively nef.
    Integral descent (Lemma 9) yields one global line bundle $J_Z$ with $J = f^(*) J_Z$.
    On $T^(+)$, pull back $J_Z$, undo the rational twist $n c L^(+)$, and compare on the common big open.
    After clearing the already established index of $L^(+)$, reflexivity gives an invertible positive reflexive
    power of $cal(F)^(+)$. This proves global strong factoriality.
  #emph[The original generalized pair.] The local log-Fano pairs above give $R^i f_(*) cal(O)_T =
    0$ for $i > 0$ by relative vanishing. They make $T$ locally klt, hence rational.
    Leray for a projective resolution then shows that $Z$ is rational.
    By #cite(label("DHP2024")) Lemma 8.7, $f^(*) H_(upright("BC"))^(1 \, 1) \( Z \) =
    R^perp$ and pullback is injective. Thus $A = t c_1 \( L \) + f^(*) eta$ for a unique $eta$.
    Define $A^(+) = t c_1 \( L^(+) \) + \( f^(+) \)^(*) eta$; it is relatively Kähler.
  To construct its actual discrepancy divisor, let $cal(I)$ be the ideal defined by
  $ "im" \( f^(*) f_(*) L^r arrow.r L^r \) = cal(I) ⊗ L^r . $
  Principalize $cal(I)$ on a common resolution $p : W arrow.r T$, $q : W arrow.r
    T^(+)$ carrying $upright(bold(M))$. If $cal(I) cal(O)_W = cal(O)_W \( - F_L \)$,
    the tautological quotient gives the actual bundle identity
  $ q^(*) cal(O)_(T^(+)) \( 1 \) = p^(*) L^r ⊗ cal(O)_W \( - F_L \) . $
  Hence $E_L = F_L \/ r$ is effective and exceptional over both sides, and $\[ E_L \] = p^(*) c_1 \( L \) -
    q^(*) c_1 \( L^(+) \)$. If $B_W$ is the original structure boundary, put $B_W^(+) = B_W - t E_L$. Then
  $ \[ K_W + B_W^(+) \] + \[ upright(bold(M))_W \] = q^(*) A^(+) . $
  Its pushforward is $B^(+)$, and its discrepancies do not decrease.
    The local ordinary comparison in (6.2) has discrepancy divisor $t_q E_L$,
    so its strictness proves the stated strictness for $t E_L$ as well. Thus the original pair remains gklt.
  Finally, write any $theta in H_(upright("BC"))^(1 \, 1) \( T \)$ uniquely as $theta = f^(*) eta_theta +
    s c_1 \( L \)$ and set $theta^(+) = \( f^(+) \)^(*) eta_theta + s c_1 \( L^(+) \)$.
    Its correction is the actual divisor $s E_L$. For a global divisor class this is its strict transform:
    the difference between the two candidate corrections is exceptional and numerically trivial over $T^(+)$,
    hence zero by negativity. ◻
]

=== 6.2 Ordinary real boundaries and forward transport <repair:sec:real>

Its rational-step input is the proof of Proposition 12, with its supporting contraction supplied by Proposition 41
  below and its projectivity supplied by Lemma 23.

#thm([Proposition 6.3.])[
  #emph[Let $T$ be normal compact Kähler and globally Weil $bb(Q)$-factorial,
    with canonical sheaf a rational line bundle. Let $B gt.eq 0$ be a real boundary with $\( T \, B \)$ klt.
    Assume the rational ordinary-step result of Proposition 12 for $T$ and its subsequent models.
    Then every $\( K_T + B \)$-negative extremal analytic ray has an ordinary step with projective contractions,
    compact Kähler models, and the expected opposite relative ample signs.
    Global Weil factoriality is preserved; global strong factoriality is preserved when imposed initially.]
] <repair:prop:real>

#proof[
  Put $D = K_T + B$ and fix a $D$-negative extremal ray $R$.
    On the finite positive support of $B$, effectiveness, the klt condition and negativity on $R$ persist under
    small coefficient changes. Klt openness is checked on one log resolution of this support.
    Choose nearby effective rational klt boundaries $B_0 \, dots.h \, B_m$ and positive real numbers $u_j$ with
  $ B = sum_j u_j B_j \, wide sum_j u_j = 1 \, wide D_j dot.op R < 0 \, quad D_j = K_T + B_j . $
  For $B = 0$ take just $B_0 = 0$. Every $D_j$ is a global rational line bundle.
    The rational-step theorem for $\( T \, B_0 \)$ provides a projective contraction $f : T arrow.r Z$,
    a compact Kähler base, and
  $ f^(*) H_(upright("BC"))^(1 \, 1) \( Z \) = R^perp \, wide rho \( T \/ Z \) = 1 \, wide -
    D_0 upright(" relatively ample") . $
  Let $C$ be a rational curve spanning $R$, and set $a_j = \( D_j dot.op C \) \/ \( D_0 dot.op C \) in
    bb(Q)_(> 0)$. On every projective fibre, $- D_j$ is numerically equivalent to the positive multiple $-
    a_j D_0$. Numerical invariance of ampleness on that fibre, followed by the relative-ampleness criterion,
    makes $- D_j$ relatively ample. The positive combination $- D$ is relatively ample as a real line bundle.
    This also handles a fibre-type contraction.
  Suppose henceforth that $f$ is birational. A Cartier multiple $M_j =
    n_j \( D_j - a_j D_0 \)$ is numerically trivial over $Z$ and $M_j - D_0$ is relatively nef.
    Integral descent, Lemma 9, applied to the rational klt pair $\( T \, B_0 \)$ gives a rational line bundle
    $A_j$ on $Z$ with the actual identity
  #[#set math.equation(numbering: n => "(6.3)")
   $ D_j = a_j D_0 + f^(*) A_j . $ <repair:eq:descent>]
  Here and below an identity of rational line bundles means an isomorphism after a common integral multiple.
    The descent lemma is used only for birational $f$.
  For a small $f$, let $f^(+) : T^(+) arrow.r Z$ be its rational $D_0$-flip.
    The rational theorem supplies a global relatively ample adjoint $D_0^(+)$ and preserves the stated
    factoriality and canonical-sheaf conditions. The other transformed adjoints $D_j^(+)$ are therefore rational
    line bundles. Transform (6.3) on the common big open and extend by reflexivity to obtain
  $ D_j^(+) = a_j D_0^(+) + \( f^(+) \)^(*) A_j . $
  All $D_j^(+)$ are relatively ample, as is $D^(+) = sum_j u_j D_j^(+)$.
    Thus this same small map is the required ordinary real-boundary flip.
    The real ordinary discrepancy comparison proves that $\( T^(+) \, B^(+) \)$ is klt and gives the strict
    increases at exceptional centres.
  For a divisorial contraction, write $D_0 = f^(*) D'_0 + e_0 E$ with $e_0 > 0$.
    Transforming (6.3) on the target and summing yields
  $ D - f^(*) D' = (sum_j u_j a_j) e_0 E . $
  This coefficient is positive. The same discrepancy comparison proves the required assertions.
    The ambient category was already preserved by the rational step in both cases. ◻
]

==== 6.2.1 Forward transport only <forward-transport-only>

For a birational step of Proposition 25, write $f' : T' arrow.r Z$ for the positive contraction,
  or the identity in the divisorial case. Negative-side rank one gives, uniquely,

$ theta = f^(*) eta + s thin c_1 \( D \) \, wide theta' = \( f' \)^(*) eta + s thin c_1 \( D' \) . $

On a common resolution $p : V arrow.r T$, $q : V arrow.r T'$,

$ p^(*) theta - q^(*) theta' = s \[ p^(*) D - q^(*) D' \] . $

The expression in brackets is the actual exceptional discrepancy divisor.
  This proves the forward transport used in Lemma 13. If $p^(*) H_T =
  p_0^(*) H + \[ J_T \]$ is the fixed-nef-datum relation, then

$ J_(T') = J_T - s \( p^(*) D - q^(*) D' \) \, wide q^(*) H_(T') = p_0^(*) H + \[ J_(T') \] . $

No divisor is extracted, so $J_(T')$ is $q$-exceptional. Its negative is $q$-nef because $p_0^(*) H$ is nef;
  negativity gives $J_(T') gt.eq 0$. There is no assertion of a surjection onto all of
  $H_(upright("BC"))^(1 \, 1) \( T' \)$ or of positive-side relative rank one.

=== 6.3 Ingredients for the contraction theorem <repair:subsec:bounded-bpf-induction>

We isolate the part of the transcendental base-point-free argument that is needed here.
  The induction below uses ordinary rational termination only in dimensions at most three.
  In particular, it does not use a finiteness theorem for generalized minimal models.

For an integer $d gt.eq 0$, consider the following statements, each in dimensions at most $d$.

*$sans(B)_d$.* If $\( X \, B + upright(bold(M)) \)$ is a compact Kähler gklt pair, $B +
  upright(bold(M))_X$ is modified big, and $alpha = \[ K_X + B + upright(bold(M))_X \]$ is nef,
  then there is a Moishezon contraction $h : X arrow.r Y$ onto a compact Kähler space and a Kähler class $omega_Y$
  such that $alpha = h^(*) omega_Y$.
*$sans(C)_d$.* Let $\( X \, B + upright(bold(M)) \)$ be a compact Kähler generalized pair, with $B +
  upright(bold(M))_X$ modified big and $alpha = \[ K_X + B + upright(bold(M))_X \]$ nef and NQC.
  If the restriction of $alpha$ to the closed subspace defined by $cal(J) \( X \, B + upright(bold(M)) \)$ has a
  Moishezon contraction, then $alpha$ has a Moishezon contraction.
  Write $sans(C)_(d \, upright("big"))$ for this assertion with the additional assumption that $alpha$ is big.
*$sans(G)_d$.* If $\( X \, B + upright(bold(M)) \)$ is a globally strongly $bb(Q)$-factorial compact Kähler gklt
  pair, $B + upright(bold(M))_X$ is modified big, and its adjoint class $A$ is pseudo-effective,
  then it has a good minimal model. One may obtain this model from a smooth modification by finitely many ordinary
  rational klt steps. The induced map from $X$ extracts no divisor and is $A$-nonpositive.

Here “NQC” has the cohomological meaning of #cite(label("HX2026")) Definition 2.43:
  the class is a positive real combination of rational classes in $H^2$ that are nonnegative on curves.
  All uses below require only this weak version. A Moishezon contraction has the meaning of #cite(label("HX2026"))
  Definition 2.32; in particular its fibres are connected by chains of compact curves.

We first record a polarization fact for actual line bundles.
  It is the only promotion from a Moishezon map to a projective map used in the non-klt gluing construction.

#thm([Lemma 6.4.])[
  (Polarization by an actual real line bundle).  #emph[Let $f : T arrow.r Z$ be a proper Moishezon map,
    where $T$ is a compact Kähler space. Suppose that $L in "Pic" \( T \) ⊗ bb(R)$ and a Kähler class $omega$ satisfy
$ L dot.op C = omega dot.op C quad upright("for every compact curve ") C upright(" contracted by ") f upright(".") $

 Then $L$ is relatively ample and $f$ is projective.]
] <repair:lem:actual-line-polarization>

#proof[
  Let $V$ be an irreducible positive-dimensional subspace of a reduced fibre. It is Moishezon.
    Normalize $V$ and take a smooth projective modification $pi : tilde(V) arrow.r V^(upright(n))$,
    chosen so that an effective exceptional divisor $E$ has $- E$ relatively ample.
    The pullback of the Kähler class from $V$ to its normalization is Kähler.
    Consequently $pi^(*) omega - delta \[ E \]$ is Kähler for sufficiently small $delta > 0$.
    On the projective manifold $tilde(V)$ the actual real line bundle $pi^(*) L -
    delta E$ has the same curve degrees as that Kähler class, and is therefore ample.
    For example, subtract a sufficiently small positive multiple of a fixed ample class from the Kähler class;
    the corresponding real line bundle is nef by the projective numerical criterion.
    Also $pi^(*) L$ is nef, and the decomposition
  $ pi^(*) L = \( pi^(*) L - delta E \) + delta E $
  shows that it is big. Thus
  $ L^(dim V) dot.op V = \( pi^(*) L \)^(dim V) > 0 . $
  The real Nakai–Moishezon criterion for proper algebraic spaces #cite(label("FujinoMiyamoto2020")) Theorem 1.6,
    applied to the algebraizations of the Moishezon fibres, proves that $L$ is ample on every reduced fibre.
    The criterion is insensitive to nilpotents and reducible components.
    Fibrewise ampleness is open for a proper analytic map; in the finite-dimensional span of the finitely many
    line bundles occurring in $L$, compactness therefore gives a neighbourhood of $L$ whose rational points are
    relatively ample. This proves relative ampleness of $L$ and supplies a global relatively ample rational line
    bundle. Clearing its denominator proves projectivity. ◻
]

#prodef([Remark 6.5.])[
  The proof uses only positivity of the top self-intersections of $L$.
    Equality of curve degrees with $omega$ does not assert equality of their higher intersection numbers or of
    their Bott–Chern classes.
]

==== 6.3.1 Relative algebraicity over the fixed smooth base <repair:sec:fixed-smooth-base-algebraicity>

#thm([Lemma 6.6.])[
  (A rational Hodge correction over a smooth base).  #emph[Let $f : T arrow.r
    S$ be an already projective surjective morphism of normal compact Kähler spaces.
    Assume that $S$ is smooth, $T$ has strongly $bb(Q)$-factorial klt singularities, and,
    for a projective resolution $r : W arrow.r T$, the morphism $g = f compose r$ satisfies
$ g^(*) : H^0 \( S \, Omega_S^2 \) arrow.r^(med tilde.eq med) H^0 \( W \, Omega_W^2 \) . $

 Then every $alpha in H_(upright("BC"))^(1 \, 1) \( T \)$ can be written
$ alpha = c_1 \( L \) + f^(*) gamma \, $

 where $L in "Pic" \( T \) ⊗_(bb(Z)) bb(R)$ is a finite real combination of global line bundles and $gamma in
   H^(1 \, 1) \( S \, bb(R) \)$.]
] <repair:lem:fixed-smooth-base-algebraicity>

#proof[
  The composition $g$ is projective, since all the spaces are compact.
    Choose a $g$-ample line bundle on $W$, with integral Chern class $H$. Set $d = dim W - dim S$ and
  $ c = g_(*) \( H^d \) > 0 . $
  Thus $c$ is the positive degree of $H^d$ on a general fibre.
    The cohomological pushforward here is the usual pushforward between the smooth compact manifolds $W$ and $S$,
    defined over $bb(Q)$ and of Hodge bidegree $\( - d \, - d \)$.
  Define a rational linear operator on degree-two cohomology by
  $ Pi \( eta \) = eta - g^(*) #h(-0.16667em) (frac(g_(*) \( eta smile H^d \), c)) . $
  Every class of type $\( 2 \, 0 \)$ on $W$ is pulled back from $S$, and the same holds for type $\( 0 \, 2 \)$.
    The projection formula therefore shows that $Pi$ kills both types. It preserves type $\( 1 \, 1 \)$. Consequently
  $ Pi \( H^2 \( W \, bb(Q) \) \) subset H^2 \( W \, bb(Q) \) ∩ H^(1 \, 1) \( W \) . $
  By the Lefschetz $\( 1 \, 1 \)$ theorem the image consists of rational Chern classes of global line bundles.
    Applying $Pi$ to $r^(*) alpha$ gives
  $ r^(*) alpha = c_1 \( L_W \) + g^(*) gamma \, wide L_W in "Pic" \( W \) ⊗ bb(R) \, wide gamma =
    frac(g_(*) \( r^(*) alpha smile H^d \), c) in H^(1 \, 1) \( S \, bb(R) \) . $
  For example, express $r^(*) alpha$ in a rational basis of $H^2 \( W \, bb(Q) \)$ and apply $Pi$ to each basis
    vector. This gives the required finite real combination $L_W$.
  Write $L_W = sum_j a_j L_j$ with actual line bundles $L_j$ on $W$. For each $j$, let
  $ cal(F)_j = \( r_(*) L_j \)^(* *) . $
  It is a rank-one reflexive coherent sheaf. Strong $bb(Q)$-factoriality gives an integer $m_j >
    0$ for which $M_j = cal(F)_j^(\[ m_j \])$ is a line bundle on $T$.
    The canonical identification over the isomorphism locus of $r$ gives
  $ L_j^(⊗ m_j) tilde.eq r^(*) M_j ⊗ cal(O)_W \( E_j \) $
  for an integral $r$-exceptional divisor $E_j$. One may obtain this comparison directly from the evaluation map
    for $r_(*) L_j$: the two coherent rank-one sheaves agree away from the exceptional locus,
    so their invertible transforms differ by an exceptional divisor.
    No global meromorphic frame of $L_j$ or of the canonical sheaf is required.
  Set $L = sum_j \( a_j \/ m_j \) M_j$ and $E = sum_j \( a_j \/ m_j \) E_j$. The preceding identities yield
  $ r^(*) \( alpha - c_1 \( L \) - f^(*) gamma \) = \[ E \] . $
  The divisor $E$ is $r$-exceptional and is numerically trivial on every $r$-contracted curve.
    The exceptional negativity lemma applied in both signs gives $E = 0$.
    Injectivity of pullback by a resolution, or pushforward of the equality of currents, now gives $alpha =
    c_1 \( L \) + f^(*) gamma$. ◻
]

===== 6.3.1.1 What this proves about the relative curve spaces. <what-this-proves-about-the-relative-curve-spaces.>

On real combinations of curves contracted by $f$, numerical equivalence tested by global line bundles is exactly
  numerical equivalence tested by all Bott–Chern classes. Indeed,
  the displayed decomposition makes every Bott–Chern pairing on such curves a pairing with $c_1 \( L \)$,
  while the pullback term pairs to zero. The converse implication is immediate.
  The resulting finite-dimensional isomorphism identifies the closures of the cones generated by the contracted
  curves, and therefore their extremal rays. This statement does not assert that every class on an arbitrary
  birational model transfers backwards, or that every numerically trivial class descends under an arbitrary morphism.

===== 6.3.1.2 Persistence during the initial relative program. <persistence-during-the-initial-relative-program.>

Suppose a finite prefix of a projective relative MMP over this fixed smooth $S$ has produced $T_i arrow.r S$.
  Its morphism to $S$ is projective by the projective relative MMP construction,
  and its strong $bb(Q)$-factorial klt property is preserved.
  Take a common resolution of $T_i$ and the initial $T$ over $S$.
  Holomorphic two-forms on smooth compact Kähler manifolds are invariant under modifications.
  The isomorphism of holomorphic two-forms in the lemma therefore holds for every projective resolution of $T_i$.
  The lemma applies anew on each $T_i$; no projectivity-descent theorem is being used to establish this persistence.

===== 6.3.1.3 Application to the smooth MRC base. <application-to-the-smooth-mrc-base.>

For a smooth holomorphic model $W arrow.r S$ of the MRC fibration,
  the pullback of holomorphic two-forms is an isomorphism, since the general fibres are rationally connected.
  Projectivity of this smooth model is the smooth-base, holomorphic-two-form part of the projectivity criterion.
  Its rational Hodge correction proof is independent of the singular projectivity-descent assertion.
  Once that projective model has been chosen, the lemma above gives the relative real line bundles needed for the
  initial MMP over $S$.

===== 6.3.1.4 Local divisor representatives. <local-divisor-representatives.>

The global objects furnished by the lemma are real combinations of line bundles.
  Over each sufficiently small Stein open subset of $S$ they have actual meromorphic divisor representatives:
  after twisting a line bundle by a sufficiently high power of a relatively ample line bundle,
  relative generation and Cartan’s theorem A provide nonzero sections;
  taking the quotient of two such sections gives a meromorphic section of the original line bundle.
  Hence the ordinary projective theorems can be used on the finite Stein cover with the intrinsic global line
  bundles and their section algebras. A global effective divisor representative is not an additional hypothesis.

===== 6.3.1.5 NQC transport is a separate one-way assertion. <repair:par:one-way-nqc>

The rational Hodge correction above is not a substitute for descent along a contracted ray.
  For a nef class $alpha$ whose contraction is $alpha$-trivial,
  use its already established Bott–Chern descent $alpha = pi^(*) alpha_Z$.
  If $V_(bb(Q)) subset H^2 \( T \, bb(Q) \)$ is the minimal rational subspace containing $alpha$, then

$ V_(bb(Q)) subset pi^(*) H^2 \( Z \, bb(Q) \) \, $

because the right-hand side is a rational subspace containing $alpha$. Choose the NQC summands in $V_(bb(Q))$:
  intersect the rational polyhedral cone generated by any initial NQC summands with $V_(bb(Q)) ⊗ bb(R)$,
  and express $alpha$ using rational generators of this intersection.
  Those generators remain nonnegative on curves. These rational NQC summands therefore descend and can be pulled
  forward to the flipped model. For nonnegativity, lift a curve on the new model to a curve on a common projective
  resolution that maps onto it with some positive degree. Equality of the pulled-back classes shows that its
  pairing is nonnegative; dividing by this positive degree preserves the sign.
  This proves weak NQC on the new model. It does not preserve a specified denominator,
  and no degree-one lift is asserted. Below, the initial relative program preserves its denominators by integral
  line-bundle descent, whereas the lower-dimensional absolute program chooses a new bound on each model.
  Neither argument requires surjectivity of the forward Bott–Chern map or equality of the two models’ Bott–Chern
  dimensions.

==== 6.3.2 Fixed relative degree denominators by integral descent <repair:subsec:relative-nqc-integral>

The initial program over the fixed smooth MRC base has a stronger property than is needed for arbitrary birational
  maps: its rational cohomology classes can be represented by rational line bundles modulo that base.
  Integral descent of those line bundles preserves their degree denominators.
  This avoids any assertion that a curve has a degree-one lift through a resolution.

#thm([Lemma 6.7.])[
  (Integral descent at a projective log-Fano contraction).  #emph[Let $h : T arrow.r
    Y$ be a projective bimeromorphic contraction of normal complex spaces.
    Suppose that each point of $Y$ has a neighbourhood $U$ on which an effective real boundary $Theta_U$ gives an
    ordinary klt pair $\( h^(- 1) U \, Theta_U \)$ and $- \( K_(h^(- 1) U) + Theta_U \)$ is $h$-ample.
    If $L$ is an actual line bundle with $L dot.op C = 0$ for every $h$-contracted curve,
    then $h_(*) L$ is a line bundle and the natural evaluation map is an isomorphism
$ h^(*) h_(*) L tilde.eq L . $

 In particular no additional tensor power is needed.]
] <repair:lem:relative-nqc-integral-descent>

#proof[
  Fix $y in Y$ and shrink to a Stein neighbourhood on which the boundary is defined.
    A Cartier-divisor representative of $L$ exists there: $h_(*)
    L$ is coherent and has rank one on the bimeromorphic isomorphism locus,
    so Cartan’s theorem A supplies a section nonzero on that locus.
    Its pullback is a nonzero meromorphic frame of $L$ and gives the required Cartier divisor.
  The line bundle $L$ is $h$-nef. Numerical invariance of ampleness on the projective fibres gives
  $ L - \( K_T + Theta_U \) quad h upright("-ample") . $
  The analytic base-point-free theorem #cite(label("Fujino2022")) Theorem 6.2 applies to this Cartier divisor and
    the real klt boundary. It states that $L^m$ is relatively generated for #emph[every] sufficiently large
    integer $m$ near the compact fibre $h^(- 1) \( y \)$, rather than only for divisible $m$.
  Choose finitely many generating sections. The resulting map from the reduced projective fibre to projective
    space is constant on each irreducible component, since a positive-dimensional image would give a curve of
    positive $L^m$-degree. The fibre is connected, so these constant values agree.
    A suitable linear combination of the sections therefore has no zero on the reduced fibre.
    In the local ring at a point of the possibly nonreduced fibre it is a unit,
    so it is a generator there as well. Properness allows the base neighbourhood to be shrunk so that this section
    trivializes $L^m$ throughout its inverse image.
  Apply this to two consecutive sufficiently large integers $m \, m + 1$.
    Taking the quotient of the two trivializations trivializes $L$.
    Since $h_(*) cal(O)_T = cal(O)_Y$, it follows locally that $h_(*) L tilde.eq
    cal(O)_Y$ and evaluation is an isomorphism. These are intrinsic assertions and hence glue over $Y$.
    This also explains why possible torsion in a fibre Picard group introduces no new index.
    The conclusion is recorded directly for extremal contractions in #cite(label("Fujino2022"))
    Theorem 7.2(2)(iii); its proof allows real boundaries. The argument above gives the intrinsic global form
    needed here and does not require the contraction to have relative Picard rank one in every local analytic
    neighbourhood. ◻
]

#thm([Proposition 6.8.])[
  (A uniform relative NQC bound).  #emph[Let $f_0 : U arrow.r
    Z$ be an already projective surjective morphism with connected fibres between smooth compact Kähler manifolds,
    and suppose that
$ f_0^(*) : H^0 \( Z \, Omega_Z^2 \) arrow.r H^0 \( U \, Omega_U^2 \) $

 is an isomorphism. Let $alpha_0$ be a nef class with an expression
$ alpha_0 = sum_(j = 1)^k r_j eta_(j \, 0) \, wide r_j > 0 \, quad eta_(j \, 0) in H^2 \( U \, bb(Q) \) \, $

 where $eta_(j \, 0)$ has nonnegative degree on every curve vertical over $Z$.
   Let $D_0 = K_U + Delta_U + upright(bold(M))_U$ be a generalized klt adjoint.
   Consider its projective relative program for $D_0 + a alpha_0$,
   under the projective local ordinary reduction described in the proof of Proposition 39.]
  #emph[If $alpha_0 = 0$, triviality is immediate. Otherwise there are positive integers $m_j$,
    chosen once on $U$, and a number
$ delta = min_j r_j / m_j > 0 $

 such that, for $a delta > 2 dim U$, the entire relative program is $alpha_0$-trivial.
   The same number $a$ works at every step.]
] <repair:prop:relative-nqc-uniform>

#proof[
  #emph[Rational classes modulo the fixed base.] Choose an $f_0$-ample line bundle with integral Chern class $H$,
    and put $e = dim U - dim Z$ and $c = f_(0 *) \( H^e \) > 0$. The rational operator
  $ Pi \( eta \) = eta - f_0^(*) #h(-0.16667em) (frac(f_(0 *) \( eta smile H^e \), c)) $
  preserves type $\( 1 \, 1 \)$ and kills types $\( 2 \, 0 \)$ and $\( 0 \, 2 \)$.
    Indeed these latter classes are pulled back from $Z$, and the projection formula applies.
    Thus $Pi \( H^2 \( U \, bb(Q) \) \) subset H^(1 \, 1) \( U \) ∩ H^2 \( U \, bb(Q) \)$.
    By the Lefschetz $\( 1 \, 1 \)$ theorem, choose an actual line bundle $L_(j \, 0)$ and an integer $m_j > 0$ with
  $ eta_(j \, 0) = 1 / m_j c_1 \( L_(j \, 0) \) + f_0^(*) gamma_j \, wide gamma_j in H^2 \( Z \, bb(Q) \) . $
  The original summands $eta_(j \, 0)$ need not have type $\( 1 \, 1 \)$. Their base components account for this.
    Their weighted sum gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ alpha_0 = sum_j r_j / m_j c_1 \( L_(j \, 0) \) + f_0^(*) Gamma \, wide Gamma =
     sum_j r_j gamma_j in H^(1 \, 1) \( Z \, bb(R) \) . $ <repair:eq:relative-nqc-line-expression>]
  The final assertion follows because $f_0^(*)$ is an injective Hodge map and the other terms have type
    $\( 1 \, 1 \)$. The identity is therefore also one of Bott–Chern classes.
    Each $L_(j \, 0)$ has nonnegative integral degree on every $Z$-vertical curve.
  #emph[Induction across an actual contraction.] Suppose at a finite stage $f_i : U_i arrow.r
    Z$ we have actual line bundles $L_(j \, i)$, nef over $Z$, and
  $ alpha_i = sum_j r_j / m_j c_1 \( L_(j \, i) \) + f_i^(*) Gamma . $
  Assume also that $alpha_i$ is nef and that the transformed $D_i$ is generalized klt.
    These assertions hold initially. Let $R$ be a $\( D_i + a alpha_i \)$-negative extremal ray over $Z$.
    It is $D_i$-negative because $alpha_i$ is nef. The projective relative cone theorem supplies a rational
    generator $C$ with
  $ 0 < - D_i dot.op C lt.eq 2 dim U . $
  All $L_(j \, i) dot.op C$ are nonnegative integers. If $alpha_i dot.op C > 0$, one of them is at least one,
    and hence $alpha_i dot.op C gt.eq delta$. Therefore
  $ \( D_i + a alpha_i \) dot.op C gt.eq - 2 dim U + a delta > 0 \, $
  a contradiction. We have $alpha_i dot.op C = 0$ and $L_(j \, i) dot.op C = 0$ for every $j$.
    Every curve contracted by the projective extremal contraction $h_i : U_i arrow.r
    Y_i$ has class on $R$ when tested by global line bundles, so the same vanishing holds for all of them.
  On each fixed Stein chart of $Z$, choose the effective real ordinary representative of the initial relatively
    ample nef datum once, before running the program. Its actual real linear equivalence to the fixed real
    line-bundle representative persists under pushforward. The Bott–Chern comparison with the generalized adjoint
    modulo the fixed base class persists separately by exceptional negativity, as detailed below.
    Thus every $h_i$ is, locally on $Y_i$, a contraction with an ordinary real klt log-Fano boundary.
    This verifies exactly the hypothesis of Lemma 29. Consequently
  $ M_(j \, i) := \( h_i \)_(*) L_(j \, i) med upright("is a line bundle") \, wide h_i^(*) M_(j \, i) = L_(j \, i) . $
  For a divisorial contraction set $L_(j \, i + 1) = M_(j \, i)$.
    For a flip $h_i^(+) : U_(i + 1) arrow.r Y_i$, set $L_(j \, i + 1) = \( h_i^(+) \)^(*) M_(j \, i)$.
    These are actual line bundles with the #emph[same] integers $m_j$. The descended Bott–Chern class
  $ alpha_(Y_i) = sum_j r_j / m_j c_1 \( M_(j \, i) \) + f_(Y_i)^(*) Gamma $
  satisfies $h_i^(*) alpha_(Y_i) = alpha_i$. It is nef by descent of nefness through the projective surjection
    $h_i$; its pullback to the next model is $alpha_(i + 1)$. This proves that the step is crepant for $alpha_i$.
    Hence it is also a $D_i$-negative step, and the original generalized pair remains gklt.
  Finally each $M_(j \, i)$ is nef over $Z$. For a $Z$-vertical curve $B subset Y_i$,
    projectivity supplies a curve $B' subset U_i$ mapping onto it with some positive degree $d_B$. Then
  $ d_B \( M_(j \, i) dot.op B \) = L_(j \, i) dot.op B' gt.eq 0 . $
  No assertion $d_B = 1$ is required. Pullback preserves this relative nefness,
    so the induction applies on $U_(i + 1)$. Its curve degrees are again integers because the transported objects
    are line bundles, not because any curves were lifted with degree one.
    This proves the fixed bound through the whole program. ◻
]

#prodef([Remark 6.9.])[
  (Scope of the degree grid).  The transported rational classes
  $ eta_(j \, i) = 1 / m_j c_1 \( L_(j \, i) \) + f_i^(*) gamma_j $
  have degrees in $m_j^(- 1) bb(Z)_(gt.eq 0)$ on curves vertical over the fixed smooth base $Z$.
    This relative assertion is exactly what the initial projective program requires.
    It does not assert nonnegativity of these individual classes on all curves of every birational model,
    and uses neither rational connectedness of resolution fibres nor Graber–Harris–Starr.
]

==== 6.3.3 Adaptive bounds for the lower-dimensional program <adaptive-bounds-for-the-lower-dimensional-program>

#thm([Lemma 6.10.])[
  (Adaptive NQC bounds).  #emph[Let $1 lt.eq d lt.eq 3$, and assume $sans(B)_d$ and ordinary rational klt
    termination in dimension at most $d$. Let $X_0$ be a globally strongly $bb(Q)$-factorial compact Kähler klt
    space of dimension $d$, and let $alpha_0$ be a nef, weakly NQC Bott–Chern class which is not big. Assume that
$ Q_0 := alpha_0 - c_1 \( K_(X_0) \) $

 is big. Then there is a finite sequence of ordinary $K$-negative divisorial contractions and flips,
   all $alpha_0$-trivial, ending in an ordinary Mori fibre space $f : X_m arrow.r Z$.
   The class $alpha_m$ descends to a nef weakly NQC class on $Z$.]
] <repair:lem:adaptive-nqc-program>

#proof[
  We first explain the one-way NQC transport that will be used.
    Let $f_i : X_i arrow.r Z_i$ be a projective ordinary $K_(X_i)$-negative ray contraction,
    and suppose that $alpha_i$ vanishes on its ray. The ordinary contraction theorem gives
  $ alpha_i = f_i^(*) beta_i . $
  This is Bott–Chern descent on the already projective log Fano contraction, by Lemma 3;
    the target has rational singularities and the required higher direct images vanish.
    We will also use injectivity of $f_i^(*) : H^2 \( Z_i \, bb(Q) \) arrow.r H^2 \( X_i \, bb(Q) \)$.
    For clarity, it follows from relative vanishing and the usual pluriharmonic-function sequence.
    Indeed, $\( f_i \)_(*) cal(O)_(X_i) = cal(O)_(Z_i)$, $R^1 \( f_i \)_(*) cal(O)_(X_i) = 0$,
    and $\( f_i \)_(*) cal(H)_(X_i) = cal(H)_(Z_i)$ imply $R^1 \( f_i \)_(*) bb(R) = 0$;
    the Leray sequence gives injectivity on $H^2 \( - \, bb(R) \)$, and hence on rational cohomology.
  Choose a weak NQC expression
  $ alpha_i = sum_(j = 1)^(r_i) a_(i j) xi_(i j) \, wide a_(i j) > 0 \, wide xi_(i j) in H^2 \( X_i \, bb(Q) \) \,
    wide xi_(i j) dot.op C gt.eq 0 $
  for every compact curve $C subset X_i$, with the $xi_(i j)$ in the minimal rational subspace containing
    $alpha_i$. Since the image of $f_i^(*)$ on rational cohomology is a rational subspace and its realification
    contains $alpha_i$, that minimal subspace lies in the image. Thus
  $ xi_(i j) = f_i^(*) eta_(i j) \, wide eta_(i j) in H^2 \( Z_i \, bb(Q) \) \, wide beta_i =
    sum_j a_(i j) eta_(i j) . $
  The last equality follows from injectivity. In the birational case, write $g_i : X_(i + 1) arrow.r
    Z_i$ for the positive-side map, using the identity map for a divisorial contraction, and set
  $ alpha_(i + 1) = g_i^(*) beta_i \, wide xi_(i j)^(+) = g_i^(*) eta_(i j) . $
  On a common projective resolution $p : W arrow.r X_i$, $q : W arrow.r X_(i + 1)$, we have $p^(*) xi_(i j) =
    q^(*) xi_(i j)^(+)$. For a curve $C^(+) subset X_(i + 1)$,
    projectivity of $q$ supplies a curve $tilde(C) subset W$ mapping onto it with some degree $e > 0$. Consequently
  $ e thin xi_(i j)^(+) dot.op C^(+) = xi_(i j) dot.op p_(*) tilde(C) gt.eq 0 . $
  Thus $alpha_(i + 1)$ is weakly NQC. This uses a positive-degree multisection, not a degree-one lift.
    Its rational components may acquire different integral denominators on $X_(i + 1)$.
    Nefness follows from equality of the pullbacks and descent of nef Bott–Chern classes under a proper surjective
    morphism. In the fibre-type case, lifting curves from $Z_i$ through the projective morphism $f_i$ proves weak
    NQC for $beta_i$; its nefness again follows by descent from $f_i^(*) beta_i = alpha_i$.
  We now choose each step separately. At a current model $X_i$, take any weak NQC expression as above,
    and choose integers $l_(i j) > 0$ such that $l_(i j) xi_(i j)$ is integral. Choose
  #[#set math.equation(numbering: n => "(6.5)")
   $ t_i > 2 d max_j l_(i j) / a_(i j) . $ <repair:eq:adaptive-nqc-bound>]
  If $alpha_i = 0$, take any $t_i > 0$ and omit the bound. As long as $Q_i := alpha_i -
    c_1 \( K_(X_i) \)$ is big and $alpha_i$ is not big, the class $c_1 \( K_(X_i) \) +
    t_i alpha_i$ cannot be pseudoeffective. Otherwise
  $ \( t_i + 1 \) alpha_i = \( c_1 \( K_(X_i) \) + t_i alpha_i \) + Q_i $
  would be big. The nef datum $t_i alpha_i$ descends to $X_i$,
    so adding it to the ordinary klt pair $\( X_i \, 0 \)$ changes no discrepancy.
    In particular this generalized klt adjoint is not nef, so the analytic cone theorem provides a negative
    analytic extremal ray $R_i$. Nefness of $alpha_i$ makes $R_i$ an ordinary $K_(X_i)$-negative ray.
    Choose its ordinary length-bounded rational curve $C_i$, so that
  $ 0 < - K_(X_i) dot.op C_i lt.eq 2 d . $
  If $alpha_i dot.op C_i > 0$, some $xi_(i j) dot.op C_i$ is positive and hence is at least $1 \/ l_(i j)$. Then
  $ \( K_(X_i) + t_i alpha_i \) dot.op C_i gt.eq - 2 d + t_i a_(i j) \/ l_(i j) > 0 \, $
  a contradiction. Therefore $alpha_i dot.op R_i = 0$.
  Apply the ordinary rational step theorem to $\( X_i \, 0 \)$ and $R_i$.
    Its supporting nef class has the form $c_1 \( K_(X_i) \) + kappa_i$ with $kappa_i$ Kähler.
    Hence $sans(B)_d$ supplies its contraction, and the ordinary relative-positivity and flip arguments give the
    projective contraction and its ordinary flip when needed.
    All spaces remain compact Kähler, globally strongly $bb(Q)$-factorial, and klt. The preceding NQC transport applies.
  It remains to check the positivity hypotheses at the next stage. For a birational step, on a common resolution write
  $ p^(*) K_(X_i) = q^(*) K_(X_(i + 1)) + F_i \, wide F_i gt.eq 0 \, wide p^(*) alpha_i = q^(*) alpha_(i + 1) . $
  Here $F_i$ is the actual ordinary discrepancy divisor. Thus
  $ q^(*) Q_(i + 1) = p^(*) Q_i + \[ F_i \] $
  is big, so $Q_(i + 1)$ is big. Equality of the $alpha$-pullbacks also preserves non-bigness.
    We can therefore recompute the NQC denominators and choose a fresh $t_(i + 1)$ by (6.5).
    In the non-klt application, $Q_i = B_i + upright(bold(M))_(X_i)$;
    the equality of the $alpha$-pullbacks preserves the original generalized adjoint and its b-datum.
  If this procedure never reached a fibre-type contraction,
    it would give an infinite sequence of ordinary rational klt $K$-negative birational steps.
    Divisorial steps are finite by the strict decrease of the span of analytic divisor classes,
    while small steps preserve that span, as in the cycle-rank argument of Lemma 15.
    The remaining infinite flip tail would contradict ordinary rational termination (Theorem 63).
    Hence it reaches an ordinary Mori fibre space after finitely many steps.
    The final $alpha$-class descends to a nef weakly NQC class on its base by the fibre-type argument above.
    No uniform bound for the $l_(i j)$, and no application of a section theorem for rationally connected fibres,
    is required. ◻
]

==== 6.3.4 Selected lower-dimensional good models <selected-lower-dimensional-good-models>

#thm([Lemma 6.11.])[
  (A selected good model in dimension at most three).  #emph[Fix $1 lt.eq d lt.eq 3$.
    Assume the generalized analytic cone theorem in dimension $d$, the semiampleness assertion $B_d$,
    and termination of ordinary rational klt programs of dimension at most three.
    Here $B_d$ means that a nef generalized klt adjoint with modified-big boundary-plus-nef part is the pullback
    of a Kähler class under a Moishezon contraction to a normal compact Kähler space.
    Its conclusion does not include projectivity of that contraction.
    For ordinary rational termination one may use Theorem 63, with zero nef b-divisor.]
  #emph[Let $\( X \, B + upright(bold(M)) \)$ be a generalized klt pair on a normal compact Kähler space of
    dimension $d$. Suppose that
$ A = K_X + B + upright(bold(M))_X $

 is pseudoeffective and that $B + upright(bold(M))_X$ is modified big.
   Then it has a good minimal model $phi.alt : X arrow.r.dashed X^(upright(m))$,
   where $X^(upright(m))$ is compact Kähler and globally strongly $bb(Q)$-factorial. The map extracts no divisor.
   It can be selected so that every class in $H_(upright("BC"))^(1 \, 1) \( X \)$ has a forward trace on
   $X^(upright(m))$. No finiteness theorem for nearby generalized pairs is needed.]
] <repair:lem:lower-dimensional-good-model>

#proof[
  We first record precisely the elementary positivity input used in passing to a smooth model.
    The modified-bigness resolution lemma #cite(label("HLX2026")) Lemma 2.5 gives a projective smooth carrier
    $pi : Y arrow.r X$ and an effective $pi$-exceptional divisor $P$ such that, on writing
  $ K_Y + B_Y + M_Y = pi^(*) A \, $
  the class $B_Y^(+) + M_Y + epsilon P$ is big for every $epsilon > 0$.
    Here $M_Y$ is nef and $B_Y = B_Y^(+) - B_Y^(-)$, with disjoint effective positive and negative parts.
    We can replace $P$ by an effective divisor whose support contains every $pi$-exceptional prime.
    This positivity lemma follows directly from the definition of modified bigness,
    the support theorem for a modification, and the convexity of the big cone;
    it uses no contraction or termination theorem. All the modifications here can be chosen projective.
  For clarity, if $X$ is globally strongly $bb(Q)$-factorial,
    that input also has the following direct verification. The class $C = B + upright(bold(M))_X = A -
    K_X$ is a big Bott–Chern class. Put $Q = B_Y^(+) + M_Y$, which is pseudoeffective. The difference
  $ J = pi^(*) C - Q = \( K_Y - pi^(*) K_X \) - B_Y^(-) $
  is an actual $pi$-exceptional real divisor class. Given a positive divisor $P$ supported on all exceptional
    primes, choose $s > 0$ small enough that $epsilon P - s J gt.eq 0$. Then
  $ Q + epsilon P = \( 1 - s \) Q + s pi^(*) C + \( epsilon P - s J \) $
  is big. This uses only that pullback preserves bigness and that adding a pseudoeffective class to a big class
    preserves bigness.
  We choose $pi$ to resolve the supports just used. Choose $epsilon > 0$ small enough that $Delta = B_Y^(+) +
    epsilon P$ has all coefficients below one. Its support is simple normal crossing, so $\( Y \, Delta \)$ is klt and
  #[#set math.equation(numbering: n => "(6.6)")
   $ K_Y + Delta + M_Y = pi^(*) A + F_Y \, wide F_Y = B_Y^(-) + epsilon P gt.eq
     0 . $ <repair:eq:good-model-first-error>]
  The support of $F_Y$ contains every $pi$-exceptional prime, and $Delta + M_Y$ is big.
  #emph[Smooth reduction with a Kähler nef part.] Regularize a Kähler current in $Delta +
    M_Y$ and resolve its analytic singularities. This gives a projective modification $q : U arrow.r Y$,
    with $U$ smooth and compact Kähler, and
  $ q^(*) \( Delta + M_Y \) = omega + \[ G \] \, wide G gt.eq 0 \, $
  where $omega$ is a Kähler class. To obtain a Kähler class rather than a semipositive pullback,
    subtract a sufficiently small effective exceptional class from the smooth part and add it to $G$.
    This is the usual Kähler-current proof of the analytic Kodaira decomposition.
    We resolve the supports involved at the same time. Write $K_U = q^(*) K_Y + K_(U \/ Y)$;
    the divisor $K_(U \/ Y)$ is effective and $q$-exceptional. For sufficiently small $delta > 0$, set
  $ beta = \( 1 - delta \) q^(*) M_Y + delta omega \, wide Gamma_delta = \( 1 - delta \) q^(*) Delta + delta G -
    K_(U \/ Y) . $
  The class $beta$ is Kähler. At $delta = 0$ the second expression is the crepant boundary of the klt pair
    $\( Y \, Delta \)$. Since its support is fixed and finite,
    for small $delta$ all coefficients of $Gamma_delta$ remain below one.
    Its negative components are $q$-exceptional. If $P_q$ is supported positively on every $q$-exceptional prime,
    choose $eta > 0$ small enough that
  $ Gamma = Gamma_delta^(+) + eta P_q $
  still has all coefficients below one. Its support is simple normal crossing, so $\( U \, Gamma \)$ is klt.
    Put $mu = pi q$. We obtain
  #[#set math.equation(numbering: n => "(6.7)")
   $ tilde(A) := K_U + Gamma + beta = mu^(*) A + E_mu \, wide E_mu = q^(*) F_Y + Gamma_delta^(-) + eta P_q gt.eq
     0 . $ <repair:eq:good-model-smooth-error>]
  The support of $E_mu$ contains every $mu$-exceptional prime. In particular $tilde(A)$ is pseudoeffective.
  Choose a rational effective boundary $B_0$ sufficiently close to $Gamma$, on the same positive support, and put
  $ H = beta + \[ Gamma - B_0 \] \, wide D = K_U + B_0 . $
  Openness of the Kähler cone makes $H$ Kähler, and $\( U \, B_0 \)$ remains klt.
    Fix a Kähler form representing $H$ and use its pullbacks as one fixed nef b-datum. Thus
  #[#set math.equation(numbering: n => "(6.8)")
   $ tilde(A) = D + H \, $ <repair:eq:good-model-rationalization>]
  where $D$ is an ordinary rational klt adjoint. This auxiliary nef b-datum need not equal the original
    $upright(bold(M))$.
  #emph[Scaling only above one.] Choose $T > 1$ such that $D + T H$ is nef.
    Run the ordinary $D$-program with scaling of this fixed $H$, stopping as soon as the forward trace of $D +
    H$ is nef. Write its traces as $D_i \, H_i$ and its successive thresholds as $lambda_i$, with $lambda_(- 1) =
    T$. The construction of Proposition 22 applies in dimension $d$:
    at a positive threshold it uses the generalized cone theorem,
    finiteness of the negative rays for the big boundary-plus-nef part,
    and the ordinary rational step proposition. The latter uses precisely $B_d$ together with the integral descent
    and relative-positivity arguments of Section 3.
  More explicitly, if $D_i + H_i$ is not nef, convexity of the nef cone gives $lambda_i > 1$,
    and there is an analytic extremal ray $R_i$ such that
  $ D_i dot.op R_i < 0 \, wide \( D_i + lambda_i H_i \) dot.op R_i = 0 \, wide H_i dot.op R_i > 0 . $
  For the existence of a ray at the threshold, take parameters $t < lambda_i$ increasing to $lambda_i$.
    On a ray negative for $D_i + t H_i$, nefness of the preceding upper-threshold class implies $H_i dot.op R >
    0$. Thus, once $t > lambda_i \/ 2$, that ray is also negative for $D_i + \( lambda_i \/ 2 \) H_i$.
    The latter has only finitely many negative rays. Its boundary-plus-nef trace is big,
    and the pair is generalized klt by the interpolation argument below.
    Every step performed is therefore negative for $D_i + H_i$.
  Each birational step is an ordinary rational klt step contracting a single analytic ray.
    It is projective on both sides, stays in the compact Kähler globally strongly $bb(Q)$-factorial category,
    and has the forward class transport of Section 6.2. If $F_i gt.eq
    0$ is its ordinary discrepancy divisor on a common resolution,
    crepancy at the scaling threshold gives the discrepancy divisor
  #[#set math.equation(numbering: n => "(6.9)")
   $ \( 1 - 1 \/ lambda_i \) F_i gt.eq 0 $ <repair:eq:good-model-scaling-discrepancy>]
  for $D_i + H_i$. More generally the divisor at parameter $0 lt.eq t lt.eq
    lambda_i$ is $\( 1 - t \/ lambda_i \) F_i$. This proves the required generalized klt induction and makes the
    next upper-threshold class nef. It also shows that $q_i^(*) H_(i + 1) = p_i^(*) H_i +
    F_i \/ lambda_i$ on the common resolution; in particular the forward traces $H_i$ stay big.
  A Mori fibre step cannot occur while $lambda_i > 1$. Indeed the pseudoeffective class $D_i +
    H_i$ would be negative on every curve in a positive-dimensional fibre.
    Restrict a positive current in this class to a general projective fibre,
    and then to a smooth resolution of that fibre. Such a restriction is defined for a general fibre by the
    local-potential definition and Fubini’s theorem. Its intersection with a power of an ample class is
    nonnegative, whereas a general complete-intersection curve has class in $R_i$ and gives a negative
    intersection. This is a contradiction. Pseudoeffectivity throughout the program follows either by pushing
    forward positive currents, or from the effective exceptional comparison and Lemma 4.
  The program cannot have infinitely many birational steps,
    by ordinary rational termination in dimension at most three.
    If $D_i$ becomes nef or a threshold reaches $\[ 0 \, 1 \]$,
    the convex interval between it and the preceding nef upper-threshold class contains $D_i + H_i$.
    Consequently the stopping rule produces a model $X^(upright(m))$ with
  $ A_(upright(m)) = D_(upright(m)) + H_(upright(m)) quad upright("nef") . $
  Every step actually performed had $lambda_i > 1$.
  #emph[Removing all the divisors introduced by the resolution.] Take a common projective resolution with maps
    $r : W arrow.r U$, $v : W arrow.r X^(upright(m))$ and $s = mu r : W arrow.r X$.
    The comparisons (6.9) accumulate to a Bott–Chern comparison with an actual effective divisor
  $ r^(*) tilde(A) = v^(*) A_(upright(m)) + \[ E \] \, wide E gt.eq 0 \, quad
    E upright(" is ") v upright("-exceptional") . $
  Its coefficient is positive on the strict transform of every prime on $U$ contracted by the program. Set
  $ G_0 = r^(*) E_mu - E . $
  By (6.7), $\[ G_0 \] = v^(*) A_(upright(m)) - s^(*) A$. Hence $G_0$ is $s$-nef and $s_(*) G_0 = - s_(*) E lt.eq
    0$. The negativity lemma, applied to $- G_0$, gives $G_0 lt.eq 0$. Thus
  #[#set math.equation(numbering: n => "(6.10)")
   $ s^(*) A = v^(*) A_(upright(m)) + \[ E - r^(*) E_mu \] \, wide E - r^(*) E_mu gt.eq
     0 . $ <repair:eq:good-model-original-comparison>]
  Since $E$ is $v$-exceptional and $E_mu$ has positive coefficient on every $mu$-exceptional prime,
    every such prime was contracted. The induced map $phi.alt :
    X arrow.r.dashed X^(upright(m))$ therefore extracts no divisor.
    The error in (6.10) is $v$-exceptional and has positive coefficient on each $phi.alt$-exceptional prime of
    $X$: the subtracted term has coefficient zero on those primes.
  We now return to the original nef b-datum $upright(bold(M))$. Keep it on the same common carrier $W$.
    The generalized boundary defining the original pair on $W$ is changed by subtracting the actual effective
    divisor $E - r^(*) E_mu$ in (6.10). It pushes forward to $phi.alt_(*)
    B$ because $phi.alt$ extracts no divisor. It defines $K_(X^(upright(m))) + phi.alt_(*) B +
    upright(bold(M))_(X^(upright(m))) = A_(upright(m))$, and its coefficients are below one because the original
    pair is gklt. Thus $X^(upright(m))$ is a minimal model of the original generalized pair,
    with its original b-datum. No assertion that the original boundary remains effective or generalized klt on the
    intermediate auxiliary models is required.
  Finally the auxiliary generalized pair $\( X^(upright(m)) \, B_(0 \, upright(m)) + overline(H) \)$ is gklt,
    and its boundary-plus-nef trace is big. Apply $B_d$ to this pair to see that $A_(upright(m))$ is semiample,
    so the model is good. For any original class $theta in H_(upright("BC"))^(1 \, 1) \( X \)$,
    start with $mu^(*) theta$ and use the forward transport across each ordinary analytic-ray step.
    This defines a class $theta_(upright(m))$ on $X^(upright(m))$ and an actual exceptional-divisor comparison on
    $W$. In particular (6.10) identifies the forward trace of $A$ with $A_(upright(m))$.
    Only this forward transport is asserted; no surjectivity from all Bott–Chern classes on the final model is used. ◻
]

=== 6.4 Negative parts and lower-dimensional good models <repair:sec:negative-part-replacement>

All equalities between $\( 1 \, 1 \)$-classes in this section are equalities in Bott–Chern cohomology.
  Equalities between divisors are stated separately. The spaces are normal compact Kähler spaces with rational
  singularities; resolutions and the morphisms called projective carry actual relatively ample line bundles.
  We write $N_sigma \( xi \)$ for the divisorial negative part of a pseudoeffective class.
  On a singular space it is defined by pushing forward the negative part on a resolution.

We use the following properties of the negative part:

+ A nef class has zero negative part. If $xi = P + \[ F \]$, with $P$ nef and $F gt.eq
  0$ an effective real Cartier divisor, then $N_sigma \( xi \) lt.eq F$.
+ If $r : W arrow.r T$ is a modification, $xi$ is pseudoeffective, and $E gt.eq 0$ is $r$-exceptional, then
  $ N_sigma \( r^(*) xi + \[ E \] \) = N_sigma \( r^(*) xi \) + E \, wide r_(*) N_sigma \( r^(*) xi \) =
    N_sigma \( xi \) . $
+ Minimal multiplicities are subadditive and homogeneous.
  In particular, adding a nef class can only decrease them. For a Kähler class $omega$,
  $ nu \( xi \, Q \) = lim_(epsilon arrow.b 0) nu \( xi + epsilon omega \, Q \) . $
  On a big class the minimal multiplicity is the infimum of the generic Lelong numbers of its closed positive currents.

These are the usual properties of the divisorial Zariski decomposition #cite(label("Boucksom2004")) §3.
  For the exceptional-divisor identity and its extension to normal spaces,
  only #cite(label("DHY2023")) Appendix A, Lemmas A.3, A.5 and A.7 are needed.
  No assertion about transporting arbitrary Bott–Chern classes across a small bimeromorphic map is used here.

==== 6.4.1 The initial relative program <the-initial-relative-program>

#thm([Lemma 6.12.])[
  (The absolute negative part after a relative program).  #emph[Let $mu : U arrow.r X$ be a projective resolution,
    let $alpha$ be nef on $X$, let $c > 0$, and let $F_U gt.eq 0$ be $mu$-exceptional. Put
$ D_U = c mu^(*) alpha + \[ F_U \] . $

 Suppose that $phi.alt : U arrow.r.dashed V$ is a finite $D_U$-negative program,
   possibly relative to another base, and denote its transformed class and divisor by $D_V$ and $F_V =
   phi.alt_(*) F_U$. Then
$ N_sigma \( D_V \) = F_V . $

]
] <repair:lem:negative-part-relative-program>

#proof[
  Take a common projective resolution $p : W arrow.r U$, $q : W arrow.r V$.
    The negativity comparison for the finite program is
  $ p^(*) D_U = q^(*) D_V + \[ E \] \, wide E gt.eq 0 \, quad E upright(" is ") q upright("-exceptional") . $
  This comparison is valid for a relative negative program:
    its proof uses the negativity of the contracted rays and the positive adjoint on each flipped side,
    not absolute nefness of the final adjoint. Since $p^(*) F_U$ is effective and exceptional over $X$,
    the exceptional identity and nefness of $\( mu p \)^(*) alpha$ give
  $ N_sigma \( p^(*) D_U \) = p^(*) F_U = N_sigma \( q^(*) D_V \) + E . $
  Pushing forward by $q$ proves the assertion. In particular, the negative part in this statement is absolute,
    even when the program that produced $V$ was relative. ◻
]

==== 6.4.2 Descent of the effective vertical divisor <descent-of-the-effective-vertical-divisor>

#thm([Lemma 6.13.])[
  (Vertical numerical triviality).  #emph[Let $g : V arrow.r
    S$ be a projective surjective morphism with connected fibres.
    Assume that $S$ is globally Weil $bb(Q)$-factorial. Let $F gt.eq
    0$ be an effective real Cartier divisor on $V$, vertical over $S$, such that
$ F dot.op C = 0 quad upright("for every curve ") C upright(" contracted by ") g . $

 Then there is an effective real Cartier divisor $F_S$ on $S$ such that, as actual divisors,
$ F = g^(*) F_S . $

]
] <repair:lem:negative-part-vertical-descent>

#proof[
  For a prime divisor $P subset S$, write $m_Q$ for the multiplicity of $Q$ in $g^(*) P$,
    where $Q$ ranges over the prime divisors dominating $P$. These multiplicities may be computed over the smooth
    generic locus of $P$, where $P$ is Cartier. Put
  $ b_P = min_(g \( Q \) = P) frac("coeff"_Q F, m_Q) \, wide F_S = sum_P b_P P . $
  Only finitely many $b_P$ are nonzero, since any such $P$ is the image of a component of $F$.
    Thus $F_S$ is a genuine effective Weil real divisor. Global Weil $bb(Q)$-factoriality makes this finite
    divisor real Cartier.
  We first check equality over codimension one in $S$. Work near a general point of $P$ and restrict to a
    transverse disk. Resolving the source, and cutting by general relative ample hypersurfaces if the relative
    dimension exceeds one, reduces to a projective surface over that disk with connected fibres.
    These operations can be performed over a relatively compact Stein neighbourhood;
    they do not require global sections on $S$. The intersection matrix of the components of the special fibre is
    negative semidefinite, with kernel generated by the full fibre with its multiplicities.
    The restriction of $F$ has zero intersection with every fibre component.
    Its coefficients are therefore proportional to those multiplicities.
    Equivalently, all the ratios in the definition of $b_P$ are equal.
    When $g$ is birational this assertion over the generic point of $P$ is immediate.
  Consequently
  $ G = F - g^(*) F_S $
  is a signed real Cartier divisor supported over a subset of codimension at least two in $S$.
    Moreover, $G$ is numerically trivial over $S$. We check that such a signed exceptional divisor is zero.
    The assertion is local on $S$. Over a relatively compact Stein neighbourhood, take $d = dim V -
    dim S$ general relative ample hypersurfaces and resolve their intersection.
    They give a projective generically finite morphism $H arrow.r S$.
    The cuts may be chosen to meet any prescribed component of $G$ in a nonzero divisorial trace.
    After normalization and Stein factorization, $H arrow.r S$ factors as a projective birational morphism $H
    arrow.r S'$ followed by a finite morphism $S' arrow.r S$.
    The restricted divisor $G \|_H$ is exceptional for $H arrow.r S'$ and numerically trivial over $S'$.
    Applying the ordinary exceptional negativity lemma to both $G \|_H$ and $- G \|_H$ gives $G \|_H = 0$.
    The choice of the cuts therefore excludes every nonzero component of $G$. Hence $G = 0$.
  The surface argument above is also the usual proof of the degenerate-divisor negativity statement:
    after subtracting the minimum multiple of the full fibre,
    an effective residual fibre divisor omits a component and cannot be numerically trivial.
    Notice that projectivity of $g$ was a hypothesis; it was not deduced from factoriality. ◻
]

==== 6.4.3 The negative part on the lower-dimensional base <the-negative-part-on-the-lower-dimensional-base>

#thm([Lemma 6.14.])[
  (Detecting the negative part by pullback currents).  #emph[Let $g : V arrow.r S$ be a surjective morphism.
    Suppose that $alpha_S$ is nef, $F_S gt.eq 0$ is real Cartier, $c > 0$, and
$ D_S = c alpha_S + \[ F_S \] \, wide D_V = g^(*) D_S \, wide N_sigma \( D_V \) = g^(*) F_S . $

 Then $N_sigma \( D_S \) = F_S$.]
] <repair:lem:negative-part-base>

#proof[
  Nefness gives $N_sigma \( D_S \) lt.eq F_S$. Fix a prime divisor $P subset S$ and a prime divisor $Q subset
    V$ dominating it. Write $m = "mult"_Q \( g^(*) P \) > 0$ and $b = "coeff"_P F_S$.
    At their generic smooth points, pullback of positive currents satisfies
  $ nu \( g^(*) T \, Q \) = m nu \( T \, P \) . $
  Indeed, the divisorial term $nu \( T \, P \) \[ P \]$ pulls back with multiplicity $m$,
    and the residual current has zero generic Lelong number there.
  Choose Kähler forms $omega_S \, omega_V$ and a constant $C > 0$ for which $C omega_V - g^(*) omega_S$ is Kähler.
    For $epsilon > 0$, let $T_epsilon$ be any positive current in the big class $D_S + epsilon \[ omega_S \]$.
    Minimality of the multiplicity and monotonicity under adding a nef class give
  $ m nu \( T_epsilon \, P \) & = nu \( g^(*) T_epsilon \, Q \)\
 & gt.eq nu \( D_V + epsilon g^(*) \[ omega_S \] \, Q \)\
 & gt.eq nu \( D_V + C epsilon \[ omega_V \] \, Q \) . $
  Taking the infimum over $T_epsilon$, and then letting $epsilon arrow.b 0$, gives
  $ m nu \( D_S \, P \) gt.eq nu \( D_V \, Q \) = "coeff"_Q \( g^(*) F_S \) = m b . $
  This proves the reverse inequality for every $P$. All multiplicities are unchanged by resolving away from the
    generic points in question, so the same argument applies to the normal spaces under consideration.
  The $epsilon$ perturbation is necessary: at a pseudoeffective boundary class,
    the infimum over its exact positive currents need not equal its minimal multiplicity.
    The argument uses that equality only for the big perturbed classes. ◻
]

#thm([Lemma 6.15.])[
  (Pullback when the positive part is nef).  #emph[Suppose
$ xi = P + \[ F \] \, wide P upright(" nef") \, quad F gt.eq 0 upright(" real Cartier") \, wide N_sigma \( xi \) = F . $

 For every projective resolution $p : W arrow.r S$,
$ N_sigma \( p^(*) xi \) = p^(*) F . $

]
] <repair:lem:negative-part-nef-pullback>

#proof[
  Write $N' = N_sigma \( p^(*) xi \)$. Since $p^(*) P$ is nef, $N' lt.eq p^(*) F$.
    Birational invariance gives $p_(*) N' = F$, so $E = p^(*) F - N' gt.eq 0$ is $p$-exceptional.
    The positive part of $p^(*) xi$ is
  $ p^(*) P + \[ E \] \, $
  and is modified nef. If $E eq.not 0$, exceptional negativity in its covering-curve form provides a component of
    $E$ covered by curves $C_t$ contracted by $p$, with $E dot.op C_t < 0$ #cite(label("DHY2023")) Appendix A,
    Lemma A.3. A modified nef class has nonnegative intersection with a general member of a family of curves
    covering a prime divisor: use regularization to choose currents with analytic singularities,
    arbitrarily small negative part, and zero generic divisorial Lelong number;
    then restrict to a general member and let the negative bound tend to zero. But here
  $ \( p^(*) P + E \) dot.op C_t = E dot.op C_t < 0 \, $
  a contradiction. Thus $E = 0$. ◻
]

#thm([Proposition 6.16.])[
  (Any lower-dimensional good model suffices).  #emph[Suppose the initial relative program has the data in
    Lemma 34. Assume in addition that $F_V$ is a real Cartier divisor,
    that $alpha_V$ is nef and agrees with $mu^(*) alpha$ on a common resolution,
    and that there is an already projective connected-fibre morphism $g : V arrow.r S$ with
$ alpha_V = g^(*) alpha_S \, wide D_V = g^(*) D_S . $

 Suppose there is a projective small modification $s : S^(upright(q)) arrow.r
   S$ such that $S^(upright(q))$ is globally Weil $bb(Q)$-factorial; the identity is allowed.
   Assume that the lower-dimensional adjoint $s^(*) D_S$ has a good model:
   there are a normal compact Kähler space $S_m$, a common projective resolution $p : W arrow.r S^(upright(q))$,
   $q : W arrow.r S_m$, and a nef semiample class $D_m$ such that
$ p^(*) s^(*) D_S = q^(*) D_m + \[ E \] \, wide E gt.eq 0 \, quad E upright(" is ") q upright("-exceptional") . $

 Then $alpha$ is semiample on $X$. If the contraction defining semiampleness of $D_m$ is Moishezon,
   the resulting contraction of $alpha$ is Moishezon as well.
   In particular, it is unnecessary to lift a program on $S$ to $V$,
   or to require that a chosen program producing $S_m$ preserve $alpha_S$ at every intermediate step.]
] <repair:prop:negative-part-good-model>

#proof[
  Nefness descends under the surjective morphism $g$, so $alpha_S$ is nef.
    The class of $F_V$ is pulled back from $S$, so $F_V$ is numerically trivial over $S$.
    It is therefore vertical: an effective horizontal component would restrict to a nonzero effective divisor on a
    general projective fibre, with positive intersection against a suitable power of an ample class,
    contradicting numerical triviality. For a birational $g$, verticality is automatic by dimension.
    First take a projective resolution $pi : tilde(V) arrow.r
    V$ of the main component of $V times_S S^(upright(q))$. The induced map $tilde(g) : tilde(V) arrow.r
    S^(upright(q))$ is projective and has connected fibres. Pull back $alpha_V \, D_V \, F_V$ along $pi$,
    and pull back $alpha_S \, D_S$ along $s$. All displayed class identities are preserved,
    and $pi^(*) F_V$ remains an effective vertical divisor. Lemma 34 gives $N_sigma \( D_V \) =
    F_V$ before this modification. Because $D_V = c alpha_V + \[ F_V \]$ with $alpha_V$ nef, Lemma 37 then gives
  $ N_sigma \( pi^(*) D_V \) = pi^(*) F_V . $
  We may therefore replace $\( V \, S \, g \)$ by $\( tilde(V) \, S^(upright(q)) \, tilde(g) \)$ and suppress the
    new superscripts in the rest of the proof. The good-model comparison now reads $p^(*) D_S =
    q^(*) D_m + \[ E \]$. No assertion that the crepant subboundary on $tilde(V)$ is effective is needed:
    this space is used only for classes, currents and the effective divisor $pi^(*) F_V$.
    The lower-dimensional generalized pair is the crepant pullback to the small model $S^(upright(q))$.
  The class identity $\[ F_V \] = g^(*) \( D_S - c alpha_S \)$ shows that $F_V$ is numerically trivial over $S$.
    Lemma 35 gives an actual effective real Cartier divisor $F_S$ with $F_V = g^(*) F_S$. Injectivity of pullback yields
  $ D_S = c alpha_S + \[ F_S \] . $
  The established identity $N_sigma \( D_V \) = F_V$ and Lemma 36 therefore give $N_sigma \( D_S \) = F_S$,
    and Lemma 37 gives
  $ N_sigma \( p^(*) D_S \) = p^(*) F_S . $
  On the other hand $q^(*) D_m$ is nef, so the exceptional-divisor identity applied to the good-model comparison gives
  $ N_sigma \( p^(*) D_S \) = E . $
  Thus $E = p^(*) F_S$ as actual divisors. Subtracting them from the comparison proves the exact class equality
  $ q^(*) D_m = c thin p^(*) alpha_S . $
  This proves the needed preservation of $alpha_S$ from the final good model,
    without an assumption about its intermediate models.
  Choose a contraction $h : S_m arrow.r T$ to a normal compact Kähler space and a Kähler class $kappa$ on $T$ with
    $D_m = h^(*) kappa$. Taking a resolution of the main component of $V times_S W$,
    and then a common projective resolution with $U$, produces a projective modification $r : R arrow.r
    X$ and a holomorphic map $ell : R arrow.r T$ satisfying
  $ r^(*) alpha = 1 / c ell^(*) kappa . $
  For every curve $C$ in a fibre of $r$ this equality implies $ell \( C \)$ is a point,
    since a Kähler class has positive degree on every nonconstant image curve.
    The fibres of the projective modification $r$ are connected projective complex spaces,
    hence are connected by chains of curves. Therefore $ell$ is constant on each fibre of $r$.
    The factorization theorem for a proper map onto a normal space gives a holomorphic map $f : X arrow.r
    T$ with $ell = f compose r$. Pushing forward the class equality by $r$ gives
  $ alpha = f^(*) \( kappa \/ c \) . $
  The maps from the main fibre-product component to $S_m$ have connected general fibres;
    their Stein factorizations are finite birational over the normal space $S_m$,
    hence have connected fibres everywhere. Together with the connected fibres of $h$, this shows that $ell$,
    and therefore $f$, has connected fibres. This is the required semiampleness of $alpha$.
  Finally, $R arrow.r S_m$ is projective: it is obtained from the projective map $g$ by base change,
    followed by projective resolutions and the projective map $q$.
    If $h$ is Moishezon, choose a projective surjection $H arrow.r S_m$ such that $H arrow.r T$ is projective.
    A component of $R times_(S_m) H$ dominating $R$ is projective and surjective over $X$,
    and its map to $T$ is projective. This is a Moishezon witness for $f$. ◻
]

=== 6.5 Closing the contraction induction <closing-the-contraction-induction>

#thm([Proposition 6.17.])[
  (The restricted induction).  #emph[Let $sans(T)_d$ denote termination of ordinary rational klt programs in
    dimension at most $d$. The following implications hold:
$ sans(C)_(d - 1) & arrow.r.double sans(C)_(d \, upright("big")) \,\
sans(C)_(d \, upright("big")) + sans(B)_(d - 1) + sans(G)_(d - 1) & arrow.r.double sans(B)_d
  wide \( 2 lt.eq d lt.eq 4 \) \,\
sans(B)_d + sans(T)_d & arrow.r.double sans(G)_d wide \( d lt.eq 3 \) \,\
sans(B)_d + sans(C)_(d - 1) + sans(T)_d & arrow.r.double sans(C)_d wide \( d lt.eq 3 \) . $

 Consequently $sans(B)_4$ holds. No assertion $sans(G)_4$ or $sans(C)_4$ is required.]
] <repair:prop:restricted-bpf-induction>

#proof[
  We specify the inputs from #cite(label("HX2026")) #cite(label("HLX2026")) and the arguments used below.
    The inputs are the cone theorem, projective relative vanishing and minimal-model theory,
    projective small factorializations and dlt modifications, the projective canonical bundle formula,
    and the nef-and-big Kähler criterion. None is used to promote an arbitrary map from a globally strongly
    $bb(Q)$-factorial space to a projective map.
  #emph[The big non-klt contraction.] Apply the construction of #cite(label("HX2026")) Section 3.
    On its smooth modification $nu : U arrow.r X$ it writes
  $ nu^(*) alpha = \[ D_U \] + eta_U \, wide D_U gt.eq 0 \, quad eta_U upright(" Kähler") . $
  The induction over the jumping coefficients of the multiplier ideal reduces the new reduced stratum to dimension
    at most $d - 1$. The given contraction on the old non-klt subspace and $sans(C)_(d - 1)$ provide the Moishezon
    maps of those strata. Every map that is promoted to a projective map in that construction contracts exactly
    the curves on which $nu^(*) alpha$ vanishes. On each such curve the actual real line bundle $-
    D_U$ has degree $eta_U dot.op C$. On a further projective common resolution $q : U'' arrow.r U$,
    choose an effective exceptional divisor $E$ with $- E$ relatively ample and choose $epsilon >
    0$ sufficiently small. Use the decomposition
  $ q^(*) nu^(*) alpha = \[ D'' \] + eta'' \, wide D'' = q^(*) D_U + epsilon E \, wide eta'' = q^(*) eta_U -
    epsilon \[ E \] . $
  Here $eta''$ is Kähler, and the actual real line bundle $-
    D''$ has degree $eta'' dot.op C$ on every contracted curve.
    Restrict this decomposition to the smooth reduced components in the gluing construction.
    Lemma 26 then supplies precisely the relative ampleness needed in place of #cite(label("HX2026")) Lemma 2.42,
    including the common-resolution step in its Claim 3.5. The uncorrected pullback $q^(*)
    eta_U$ is not being treated as a Kähler class.
  The exact sequences of multiplier ideals, relative vanishing, finite pushouts,
    and extension from sufficiently thickened $"Supp" D_U$ in that proof then apply unchanged.
    They give the birational Moishezon contraction in $sans(C)_(d \, upright("big"))$.
    In particular the gluing step uses neither generalized termination nor a projectivity criterion for an
    undetected ray.
  #emph[Preparation for both cases of $sans(B)_d$.] The modified-big perturbation #cite(label("HX2026"))
    Lemma 2.23 supplies a nef datum that dominates a Kähler class on its carrier.
    Subtracting a sufficiently small multiple of the pullback of a Kähler class $omega_X$ still leaves a nef datum
    on that carrier. Thus $alpha$ is a gklt adjoint plus $epsilon omega_X$,
    and the cone argument of #cite(label("HX2026")) Lemma 2.45 makes $alpha$ NQC.
    This preparation applies whether or not $alpha$ is big.
  #emph[The nef-and-big case of $sans(B)_d$.] For a gklt pair the multiplier ideal is the unit ideal,
    so the preceding big non-klt assertion now applies and gives a birational contraction $h : X arrow.r Y$.
    On a projective resolution $p : W arrow.r X$ chosen projective over $Y$,
    relative Kawamata–Viehweg vanishing for the effective exceptional divisor $-
    floor.l B_W floor.r$ gives $R^i h_(*) cal(O)_X = 0$ for $i > 0$. Thus $Y$ has rational singularities.
    Proper birational Bott–Chern descent #cite(label("DHP2024")) Lemma 8.7 gives $alpha = h^(*) gamma$.
    The descended adjoint is gklt, nef and big, and has no trivial curve.
    The criterion #cite(label("HLX2026")) Theorem 4.3 makes $gamma$ Kähler.
  For completeness, the projectivity input in that criterion is restricted to a map $S arrow.r
    Z'$ between smooth compact Kähler manifolds with rationally connected general fibre:
    $S$ is the chosen smooth divisor on a resolution and $Z'$ is the resolution of the null-locus component.
    The smooth-source, smooth-base argument in #cite(label("ClaudonHoring2024")) Theorem 3.1, Step 1 applies.
    Its subsequent relative program starts with this projective map.
    Thus no general singular-source projectivity assertion is needed for this application of the criterion.
  #emph[The non-big case of $sans(B)_d$.] Use a projective small factorialization and the modified-big
    perturbation of the pair. The non-pseudo-effectivity of $K_X$ gives an MRC fibration by
    #cite(label("Ou2025")). Choose a smooth Kähler MRC base $Z$ and a smooth modification $mu : U arrow.r
    X$ such that $U arrow.r Z$ is projective. Only the smooth case of #cite(label("ClaudonHoring2024"))
    Theorem 3.1, Step 1 is needed: pullback identifies the holomorphic two-forms since the general fibre is
    rationally connected. The same rational Hodge correction identifies any $\( 1 \, 1 \)$-class on $U$,
    modulo a class pulled back from $Z$, with an actual real line bundle.
  Write, as in #cite(label("HX2026")) Theorem 4.1, Claim 4.1,
  $ D_U \( a \) = K_U + Delta_U + upright(bold(M))_U + a alpha_U = \( a + 1 \) alpha_U + F_U \, quad alpha_U =
    mu^(*) alpha \, quad Delta_U \, F_U gt.eq 0 \, $
  where $Delta_U$ is klt and $F_U$ is $mu$-exceptional. The modified-big replacement is chosen,
    as in the cited Claim 4.1, so that the nef datum $upright(bold(M))_U$ on this smooth carrier is Kähler.
    If a further projective resolution is needed, subtract a sufficiently small effective exceptional divisor from
    its nef part and add that divisor to the subboundary; this preserves the adjoint and the klt inequalities.
    Choose $a_0$ using the uniform bound of Proposition 30. It makes the relative $D_U \( a_0 \)$-program
    $alpha_U$-trivial and preserves that choice through every step.
    This is a #emph[projective] relative program from its first step:
    the nef data are represented by real line bundles modulo $Z$.
    Lemma 28 applies on every intermediate model over this fixed smooth base.
    More precisely, put $r : U arrow.r Z$ and choose one actual global real line bundle $L$ with
  $ upright(bold(M))_U + a_0 alpha_U = c_1 \( L \) + r^(*) gamma . $
  The bundle $L$ is relatively ample, because $upright(bold(M))_U$ is Kähler and $alpha_U$ is nef.
    On each of a fixed finite collection of relatively compact Stein charts of $Z$,
    choose an effective real divisor $Theta$ representing $L$, with $\( U \, Delta_U + Theta \)$ klt.
    The representatives can retain a positive relatively ample part in their boundaries.
    Here the equality $K_U + Delta_U + Theta tilde.op_(bb(R)) K_U + Delta_U +
    L$ is an actual real linear equivalence of line bundles; the equality with $D_U \( a_0 \)$ modulo $r^(*)
    gamma$ is separately an equality of Bott–Chern classes.
  For the ample-model comparison below, make the following additional choices before running the program.
    Take the fixed finite cover in the form $W_ell subset.double Y_ell subset Z$,
    where $Y_ell$ is a Stein coordinate chart and $W_ell$ is a closed coordinate polydisc,
    with the interiors of the $W_ell$ covering $Z$. Each $W_ell$ is a semianalytic Stein compact,
    so it satisfies condition (P4) of #cite(label("Fujino2022"));
    thus condition (P) holds for the restriction of every normal projective model over $Z$ to $Y_ell$.
  Write
  $ alpha_i = c_1 \( N_i \) + f_i^(*) Gamma $
  for the real line bundles $N_i$ transported in Proposition 30; put $N_i = 0$ if $alpha_U = 0$.
    These bundles are nef over $Z$ and pull back from each contraction target, on both sides of a flip.
    Set $a_j = a_0 + j$ for $j = 1 \, 2$. The real line bundles $L + j N_U$ are relatively ample.
    On each initial chart choose, once and for all,
  $ Theta_j gt.eq 0 \, wide Theta_j tilde.op_(bb(R)) L + j N_U \,
    wide \( U \, Xi_(j \, U) := Delta_U + Theta_j \) med upright("klt") . $
  Such representatives are obtained from general sufficiently divisible relative sections;
    their boundaries are relatively big because $L + j N_U$ is relatively ample and $Delta_U gt.eq 0$.
    With $Xi_(0 \, U) := Delta_U + Theta$, these are actual real linear equivalences
  $ K_U + Xi_(j \, U) tilde.op_(bb(R)) K_U + Xi_(0 \, U) + j N_U $
  on each chart, separately from the Bott–Chern comparison with the fixed base classes.
  Let $Xi_(j \, i)$ denote their birational transforms. Pushforward of these linear equivalences and the actual
    descent of $N_i$ give
  $ K_(U_i) + Xi_(j \, i) tilde.op_(bb(R)) K_(U_i) + Xi_(0 \, i) + j N_i $
  at every step. Thus the contracted adjoints have the same degrees on the negative side,
    and the flipped adjoints have the same degrees on the positive side.
    Every step of the chosen program is therefore also a $\( K_(U_i) + Xi_(j \, i) \)$-negative step.
    Ordinary discrepancy negativity preserves klt for these fixed pairs.
    Their boundaries remain effective, and relative bigness is preserved by these birational pushforwards,
    as in the proof of #cite(label("Fujino2022")) Lemma 11.16.
  Fix these ordinary pairs on the initial charts. Their actual linear equivalences push forward throughout the
    program. On a common resolution at each step, exceptional negativity preserves the Bott–Chern comparison with
    $D_U \( a_0 \)$ modulo the fixed base class. Thus every subsequent contraction or flip is a step for these
    fixed ordinary pairs. The projective ordinary theorems #cite(label("Fujino2022"))
    #cite(label("FujinoCompact2026")) apply. In particular, the finiteness of weak log canonical models in
    #cite(label("Fujino2022")) Theorem E does not require local $bb(Q)$-factoriality of each intermediate model.
    Applied on the finite chart cover, its chamber argument gives termination of the global projective program
    with scaling. Each small step is constructed by its global rational detector algebra as above;
    uniqueness of the relatively ample model identifies the local ordinary flips on overlaps.
    This supplies a good minimal model $U arrow.r.dashed V$ over $Z$.
    Here one uses the projective case of #cite(label("HX2026")) Proposition 2.30, not its general part (3).
  Here is an explicit ample-model comparison that gives the required descent of $alpha_V$.
    Both $D_V \( a_0 \)$ and $alpha_V$ are nef over $Z$. For $j = 1 \, 2$, the ordinary adjoint $K_V +
    Xi_(j \, V)$ is $bb(R)$-Cartier and represents
  $ D_V \( a_j \) - f_V^(*) \( gamma + j Gamma \) = D_V \( a_0 \) + j alpha_V - f_V^(*) \( gamma + j Gamma \) . $
  It is consequently nef over every $W_ell$. The pair $\( V \, Xi_(j \, V) \)$ is klt and its effective boundary
    is relatively big. Apply #cite(label("Fujino2022")) Lemma 11.15 with $A = Xi_(j \, V)$ and $B = 0$.
    Its condition on non-klt centres is vacuous. After shrinking around $W_ell$, it gives
  $ Xi_(j \, V) tilde.op_(bb(R)) A_j + B_j \, wide A_j gt.eq 0 med upright("relatively ample") \, quad B_j gt.eq
    0 \, wide \( V \, A_j + B_j \) med upright("klt") . $
  In particular this pair is log canonical, supplies the klt boundary required in #cite(label("Fujino2022"))
    Theorem 8.3, and its adjoint is $bb(R)$-Cartier and nef over $W_ell$.
    That theorem makes $K_V + Xi_(j \, V)$ semiample on a neighbourhood of $W_ell$.
    The pushed-forward actual linear equivalences identify these local adjoints with restrictions of the same
    global real line-bundle data. Their ample models therefore agree on overlaps by uniqueness and glue as above.
    Hence $D_V \( a_1 \)$ and $D_V \( a_2 \)$ have projective relative ample-model contractions over $Z$.
    Their zero curves are exactly the common zero curves of $D_V \( a_0 \)$ and $alpha_V$.
    Their projective ample-model contractions therefore have the same fibres:
    these fibres are connected by curves, and each contraction is constant on the fibres of the other.
    Identify the two normal targets, writing the common contraction as $g : V arrow.r S$.
    If $D_V \( a_j \) = g^(*) lambda_j$, with $lambda_j$ relatively Kähler over $Z$, subtraction gives
  $ alpha_V = g^(*) \( lambda_2 - lambda_1 \) = g^(*) alpha_S . $
  This is an equality of Bott–Chern classes, not merely of curve degrees.
    Since the initial program is $alpha_U$-trivial, it is also $D_U \( a_1 \)$-negative.
    From now on put $a = a_1$ and suppress the argument in $D_U \( a \)$ and $D_V \( a \)$.
  The maps $V arrow.r Z$ and $S arrow.r Z$ are projective. Moreover $g$ is projective:
    a relatively ample bundle for $V arrow.r Z$ restricts to an ample bundle on every fibre of $g$,
    and hence is $g$-ample. The argument of #cite(label("HX2026")) Theorem 4.1, Claim 4.2,
    using projective relative semipositivity, gives $dim S < d$.
    The projective canonical bundle formula #cite(label("HX2026")) Theorem 2.53 provides
  $ D_S = K_S + B_S + upright(bold(N))_S + a alpha_S \, wide D_V = g^(*) D_S \, $
  with a gklt pair on $S$ and modified-big nef data. The class $alpha_S$ is nef by descent of nefness through the
    surjective projective map $g$. Thus adding $a overline(alpha_S)$ to the nef datum preserves the gklt condition
    and modified bigness: on a common carrier this addition is a nef pullback and preserves the existing big class.
  Take a projective small factorialization $s : S^(upright(q)) arrow.r
    S$ and resolve the main component of $V times_S S^(upright(q))$.
    The resulting maps $pi : tilde(V) arrow.r V$ and $tilde(g) : tilde(V) arrow.r S^(upright(q))$ are projective,
    and $tilde(V)$ is compact Kähler. Pull back $D_V$, $alpha_V$ and $F_V$ to $tilde(V)$,
    and $D_S$ and $alpha_S$ to $S^(upright(q))$. The pair on $S^(upright(q))$ is gklt and its boundary-plus-nef
    class remains modified big. Lemma 34 first gives $N_sigma \( D_V \) = F_V$.
    Lemma 37 then gives $N_sigma \( pi^(*) D_V \) = pi^(*) F_V$.
    The new total space is used only as a carrier for this equality and for pullbacks of positive currents;
    no effective boundary on it is needed. Rename these spaces $V$ and $S$.
    No extra relative program from Claim 4.4 of the cited proof is needed.
  The vertical-divisor descent and negative-part lemmas above now give actual effective divisors $F_S \, F_V$ with
  $ F_V = g^(*) F_S \, wide D_S = \( a + 1 \) alpha_S + \[ F_S \] \, wide N_sigma \( D_S \) = F_S . $
  Apply $sans(G)_(d - 1)$ to the generalized pair with adjoint $D_S$.
    On a common resolution $p : W arrow.r S$, $q : W arrow.r S_m$ of the resulting good model, write
  $ p^(*) D_S = q^(*) D_m + \[ E \] \, wide E gt.eq 0 upright(" exceptional over ") S_m . $
  The negative-part comparison proved above gives $E = p^(*) F_S$, and hence
  $ q^(*) D_m = \( a + 1 \) p^(*) alpha_S . $
  Since $D_m$ is semiample, $alpha_S$ is semiample after descent through $p$.
    Pulling back by $g$ and using the $alpha$-trivial initial program gives semiampleness of $alpha$ on $X$.
    The target is compact Kähler, and the resulting map is Moishezon,
    as follows by taking common projective modifications of the maps just constructed.
    This proves the required descent without lifting a lower-dimensional program to $V$.
  #emph[Selected good models in dimensions at most three.] Lemma 33 gives $sans(G)_d$ from $sans(B)_d$ and
    ordinary rational termination. Its smooth input has the form
  $ mu^(*) A + \[ E_mu \] = K_U + B_q + H \, wide B_q upright(" rational klt") \, quad H upright(" Kähler") \, $
  where $E_mu$ is effective with all $mu$-exceptional divisors in its support.
    The ordinary $\( K_U + B_q \)$-program with scaling of $H$ is stopped at the first threshold at most one.
    Every performed step is negative for the displayed adjoint.
    Termination is the ordinary specialization of Theorem 63, with zero nef b-divisor.
    Its proof uses the projective relative and discrepancy arguments of Section 10,
    not $sans(B)_d$ or $sans(G)_d$. The final nef adjoint is semiample by $sans(B)_d$.
    Negativity removes the added exceptional divisors and gives the claimed model of $X$.
    All forward transforms used here are those of the detected ordinary steps;
    no inverse identification of Bott–Chern groups is needed.
  #emph[The non-big non-klt contraction in dimensions at most three.] Take the projective dlt modification used in
    #cite(label("HX2026")) Section 6; its source is globally strongly $bb(Q)$-factorial and its underlying space
    is klt. On this source
  $ Q = alpha - c_1 \( K_X \) = B + upright(bold(M))_X $
  is a Bott–Chern class. Its modified bigness therefore implies bigness,
    as in #cite(label("HX2026")) Definition 2.8. Apply Lemma 32.
    It gives a finite ordinary $K$-negative program, crepant for $alpha$,
    ending in an $alpha$-trivial Mori fibre space $f : X' arrow.r Z$.
    Each step exists by $sans(B)_d$ and is projective by its canonical rational line-bundle detector.
    The auxiliary number $t_i$ is chosen anew at each model; no uniform denominator claim is used.
  All remaining steps of #cite(label("HX2026")) Section 6 concern this already projective map:
    relative vanishing transports the non-klt closed subspace; $alpha$ descends to a nef NQC class on $Z$;
    if the non-klt subspace dominates $Z$, its contraction descends by the equality $cal(O)_Z =
    f_(*) cal(O)_("Nklt")$; otherwise the projective canonical bundle formula and the multiplier-ideal calculation
    identify its image with the non-klt subspace on the base. The assertion $sans(C)_(d - 1)$ then applies to $Z$.
    This proves $sans(C)_d$ without invoking a generalized termination theorem.
  #emph[Order of the induction.] The assertions in dimensions zero and one are immediate from the degree of a
    class on a compact curve (and the ordinary curve minimal model program). For $d = 2 \, 3$, prove successively
  $ sans(C)_(d \, upright("big")) \, quad sans(B)_d \, quad sans(G)_d \, quad sans(C)_d . $
  At $d = 4$ prove only $sans(C)_(4 \, upright("big"))$ and $sans(B)_4$.
    The ordinary rational termination invoked at the intermediate stages has dimension at most three.
    This closes the induction without using #cite(label("HX2026")) Theorems 1.5 or 5.15. ◻
]

=== 6.6 Termination of ordinary programs <repair:sec:reduction>

#thm([Corollary 6.18.])[
  #emph[Using Theorem 1.1 of
    #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026")),
    every existing sequence of ordinary rational klt flips in the global Weil $bb(Q)$-factorial compact Kähler
    fourfold category terminates, provided both sides of every small diagram are projective and the ordinary
    adjoints have the specified opposite ample signs. In this first formulation,
    compatible actual canonical divisor representatives are fixed on the models.
    The contraction bases are required to be normal compact Kähler, and the morphisms to have connected fibres.]
] <repair:cor:existing>

#proof[
  Take the fixed nef b-divisor in
    #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026"))
    to be zero, represented on any projective log resolution of the initial space. Its class is nef.
    Klt implies log canonical; the boundary is rational and is transported by strict transform.
    All the remaining conditions in that theorem are exactly the hypotheses just stated.
    No pseudo-effectivity or scaling parameter is needed. ◻
]

==== 6.6.1 The intrinsic canonical-sheaf formulation <the-intrinsic-canonical-sheaf-formulation>

The printed theorem in
  #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026"))
  specifies actual canonical divisors. For zero nef part, its proof also has the following intrinsic formulation;
  this observation is necessary to preserve the intrinsic formulation of Theorem 2.

For each finite comparison diagram, choose a sufficiently divisible integer $m$ clearing the boundary denominators
  and the adjoint indices on its models, and put

$ cal(D)_(T \, m) = #scale(x: 120%, y: 120%)[\(] omega_T^(\[ m \]) ⊗ cal(O)_T \( m B \)
  #scale(x: 120%, y: 120%)[\)]^(* *) . $

It is an invertible sheaf. On a common resolution of two models,
  the canonical identification on their common smooth open defines a distinguished meromorphic section of

$ p^(*) cal(D)_(T \, m) ⊗ \( q^(*) cal(D)_(T' \, m) \)^(- 1) . $

The relative canonical Jacobians and the boundary equations give its finite meromorphic orders along exceptional
  divisors. Its divisor divided by $m$ is the actual discrepancy-change divisor.
  It is independent of the chosen divisible index and is compatible with further pullback.
  No global meromorphic section of $omega_T$ has been chosen.
  The integer $m$ may change from one finite diagram to another;
  no uniform bound on the canonical indices of an infinite sequence is asserted.

In the zero-nef-part proof, negativity and the support comparisons use precisely these exceptional divisors.
  The local adjoint algebras are intrinsically the direct sums of the sheaves $f_(*) cal(D)_(T \, m)$,
  and the adjunction comparisons are comparisons of dualizing sheaves.
  The relative canonical divisor occurring in the companion’s branch argument is already defined in this manner.
  Its local small factorialization uses the corresponding crepant identity of reflexive canonical sheaves,
  and its globalization uses the intrinsic relative canonical divisor.
  The Hodge, parameter-space and monodromy steps use constant sheaves and ordinary line bundles;
  they do not require a global canonical form.

The fixed denominator in the corrected difficulty clears the finitely many initial boundary coefficients and the
  fixed extracted-label coefficients,
  exactly as in
  #cite(label("OAI:Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026")).
  It is separate from the diagram-dependent adjoint indices above.
  In the smooth-centre positive-surface witness calculation with zero nef part, the formula $a^(+) = 2 -
  "ord"_E \( B \)$ needs only the initial boundary denominators.
  Neither that calculation nor the corrected difficulty requires a uniform canonical Cartier index along the
  sequence. Replacing the canonical representatives by these canonical local comparisons therefore leaves that
  proof unchanged and proves the intrinsic version of Corollary 40.

==== 6.6.2 The supporting contraction statement <the-supporting-contraction-statement>

#thm([Proposition 6.19.])[
  (Supporting contractions).  #emph[Let $\( T \, B \)$ be an ordinary rational klt pair on a normal globally Weil
    $bb(Q)$-factorial compact Kähler space of dimension $1 lt.eq d lt.eq 4$,
    with canonical sheaf a rational line bundle. Put $D = K_T + B$.
    For every $D$-negative extremal ray $R$ and every supporting class with the Kähler margin
$ alpha upright(" nef") \, wide overline(upright("NA")) \( T \) ∩ alpha^perp = R \, wide alpha -
  c_1 \( D \) upright(" Kähler") \, $

 there is a proper surjective morphism $f : T arrow.r Z$ with connected fibres onto a normal compact Kähler space
   and a Kähler class $gamma$ on $Z$ such that $alpha = f^(*) gamma$.
   Moreover $f$ is projective and $- D$ is $f$-ample.]
] <repair:prop:supporting-contraction>

#proof[
  Write $kappa = alpha - c_1 \( D \)$ and regard its pullbacks as a nef b-class.
    The generalized pair $\( T \, B + overline(kappa) \)$ is gklt:
    the nef datum descends on $T$, so its discrepancies are exactly those of $\( T \, B \)$.
    Its boundary-plus-nef class $\[ B \] + kappa$ is big. The assertion $sans(B)_d$, proved in Proposition 39,
    gives $f$ and $gamma$. This assertion applies to gklt spaces without a strong factoriality hypothesis,
    as explained in that induction by a projective small factorialization followed by descent.
    Lemma 23, with detector $D$, makes $- D$ relatively ample.
    The equality of the null cone with $R$ is exactly the required contraction property. ◻
]

Lemma 10 constructs the supporting classes by the ordinary cone theorem.
  The proposition above supplies the required contraction. It can be applied after every finite prefix of the
  ordinary program.

#thm([Theorem 6.20.])[
  (Finite ordinary programs).  #emph[Let $\( X \, B \)$ be a rational klt pair on a normal globally Weil
    $bb(Q)$-factorial compact Kähler fourfold. The canonical datum may be a specified canonical Weil divisor or
    the intrinsic canonical rational line bundle. Then every maximal ordinary negative-ray program starts on $X$
    and terminates. All models remain normal, compact Kähler, globally Weil $bb(Q)$-factorial and klt;
    global strong $bb(Q)$-factoriality is preserved when imposed initially.
    Every negative contraction is projective, with relative line-bundle rank and relative Bott–Chern dimension one.]
  #emph[If $K_X + B$ is pseudo-effective, the endpoint has nef adjoint.
    The composite extracts no divisor, discrepancies do not decrease,
    and strictly increase for every prime on $X$ that is contracted.
    If $K_X + B$ is not pseudo-effective, the endpoint has a projective Mori fibre contraction to a normal compact
    Kähler space of smaller dimension, with connected fibres and relatively antiample adjoint.
    In particular, these conclusions imply Theorem 2.]
] <repair:thm:reduction>

#proof[
  Start on the given pair. If its adjoint is not nef, choose a negative extremal ray.
    Proposition 41 supplies its contraction; Lemma 23 supplies the global relative polarization from the ordinary
    rational adjoint. The remaining proof of Proposition 12 gives the rational flip when the contraction is small,
    and preserves klt singularities, the global factoriality category,
    canonical data and the negative-side numerical ranks. These steps use the projective analytic ordinary flip
    theorem #cite(label("Fujino2022")) and actual line-bundle descent.
    In the globally Weil case this is the argument of Proposition 12:
    the rational adjoint itself gives the global flip algebra,
    and the transform of each global prime is made rationally Cartier by adjusting it by a rational multiple of
    that adjoint and applying integral descent. The same argument applied to global rank-one reflexive sheaves
    preserves the strong category. Relative vanishing and cohomological descent give the one-dimensional
    negative-side quotient. The argument can be repeated after each finite prefix.
  Let $c_3 \( T \)$ be the dimension of the span in $H_6 \( T \, bb(R) \)$ of compact analytic three-dimensional
    cycle classes. It is finite. A small transformation preserves it,
    while a divisorial contraction strictly decreases it: an exceptional divisor has nonzero class detected by the
    cube of a Kähler form, and its image has dimension at most two.
    The Borel–Moore localization argument is Lemma 15. There are therefore only finitely many divisorial steps in
    a run. An infinite run would have an infinite flip tail, contrary to Corollary 40,
    or its intrinsic formulation above. Thus the run is finite.
  A maximal run ends with a nef adjoint or a Mori fibre contraction,
    since each negative ray otherwise admits continuation. Across each birational step the comparison on a common
    resolution has the form
  $ p^(*) \( K_T + B \) = q^(*) \( K_(T') + B' \) + E \, wide E gt.eq 0 $
  with $E$ exceptional over $T'$. Positive-current pullback and exceptional descent preserve pseudo-effectivity.
    A relatively antiample adjoint on a Mori fibre space is not pseudo-effective:
    restrict a putative positive current to a fibre curve through a point where a local potential is finite,
    and its nonnegative degree contradicts relative antiampleness. A nef adjoint is pseudo-effective.
    These observations distinguish the two endpoint cases exactly as in Section 7.
    Finally, the effective discrepancy comparisons add along the finite run,
    with strict increase at each contracted original divisor.
    They give the stated minimal-model discrepancy inequalities. ◻
]

== 7 The two endpoints <sec:endpoints>

The ordinary program is finite by Theorem 42. We now identify its endpoint from the pseudo-effectivity of the
  original adjoint. Only ordinary birational comparisons are needed for this last step.

#thm([Lemma 7.1.])[
  #emph[Let $\( T \, B \) arrow.r.dashed \( T' \, B' \)$ be an ordinary negative divisorial contraction or flip
    between normal compact Kähler klt pairs, with rational boundaries and rational line-bundle adjoints.
    Then $K_T + B$ is pseudo-effective if and only if $K_(T') + B'$ is pseudo-effective.]
] <lem:pe-step>

#proof[
  Set $D = K_T + B$ and $D' = K_(T') + B'$. The ordinary comparison in Proposition 12 and Lemma 5 gives,
    on a common smooth compact Kähler resolution $p : V arrow.r T$, $q : V arrow.r T'$,
  $ p^(*) D = q^(*) D' + F \, wide F gt.eq 0 \, $
  where $F$ is an actual divisor exceptional over $T'$. If $D'$ is pseudo-effective,
    its pullback plus $\[ F \]$ is pseudo-effective; descent along $p$ shows that $D$ is pseudo-effective.
    Conversely, if $D$ is pseudo-effective, exceptional descent along $q$ applied to $q^(*)
    D' + \[ F \]$ proves that $D'$ is pseudo-effective. Both uses of pullback and descent are justified by Lemma 4. ◻
]

#thm([Lemma 7.2.])[
  #emph[Let $g : Y arrow.r S$ be a projective surjective morphism of normal compact Kähler varieties with $dim S <
    dim Y$. If a rational line bundle $D$ satisfies $- D$ $g$-ample, then $D$ is not pseudo-effective.]
] <lem:mori-not-pe>

#proof[
  Suppose that $c_1 \( D \)$ contains a closed positive current $T$ with local plurisubharmonic potentials.
    Choose a point $y$ where such a potential is finite and which lies on a positive-dimensional component of a
    fibre of $g$. This is possible on the dense open locus of fibres of the expected dimension:
    the pole set of a plurisubharmonic potential contains no open subset.
    That fibre component is projective, so hyperplane sections through $y$ give an integral curve $C$ through $y$
    contained in the fibre. Let $nu : C^nu arrow.r Y$ denote its normalization followed by inclusion.
  Local potentials pull back under $nu$ to subharmonic functions or to the constant $- oo$.
    Finiteness at a preimage of $y$ excludes the latter alternative on the connected curve.
    Thus they define a positive current $nu^(*) T$ in the class $nu^(*) c_1 \( D \)$, and
  $ D dot.op C = integral_(C^nu) nu^(*) T gt.eq 0 . $
  This contradicts $D dot.op C < 0$, which follows from relative ampleness. The choice of $y$ is essential:
    no restriction of $T$ to a curve contained in its pole set has been used. ◻
]

#proof[
  Choose a maximal ordinary negative-ray program on the given pair $\( X \, Delta \)$.
    Proposition 12 supplies each step, and Theorem 42 proves that the program stops after finitely many such
    steps. Write its endpoint as $\( Y \, Gamma \)$. All intermediate varieties are normal compact Kähler
    fourfolds, all boundaries are the rational transforms of $Delta$,
    and all pairs remain ordinary klt and globally Weil-divisor $bb(Q)$-factorial with the stipulated canonical
    datum. The optional strong global property is preserved by the same Proposition.
    The auxiliary constructions in Section 6 do not change this program, which starts on $X$ itself.
  The stopping rule gives either a nef adjoint $K_Y + Gamma$ or a Mori contraction $g : Y arrow.r S$.
    In the latter case Proposition 12 supplies a normal compact Kähler base,
    a projective surjective morphism with connected fibres, $dim S < 4$,
    relative numerical rank $rho \( Y \/ S \) = 1$, and relative ampleness of $- \( K_Y + Gamma \)$.
    These are precisely the required Mori fibre space conditions,
    with relative rank computed from global Cartier classes. The same Proposition gives relative Bott–Chern
    dimension one for every negative contraction, including $g$.
  By Lemma 43, the adjoint at every stage has the same pseudo-effectivity status as $K_X + Delta$.
    If the latter is pseudo-effective, Lemma 44 excludes the Mori alternative, so the endpoint is nef.
    If it is not pseudo-effective, the endpoint cannot be nef, since nef classes are pseudo-effective by Lemma 4;
    hence the endpoint has the asserted Mori fibre structure.
  For completeness, the nef endpoint has the discrepancy properties of a log minimal model.
    No step extracts a divisor. On a common resolution of the finite sequence, with maps $p : V arrow.r
    X$ and $q : V arrow.r Y$, the ordinary effective comparison divisors add to
  $ p^(*) \( K_X + Delta \) = q^(*) \( K_Y + Gamma \) + F \, wide F gt.eq 0 \, $
  with $F$ exceptional over $Y$. Consequently, for every prime divisor $E$ over these models,
  $ a \( E \, Y \, Gamma \) gt.eq a \( E \, X \, Delta \) . $
  If a prime divisor on $X$ is contracted, its discrepancy increases strictly at the divisorial step that
    contracts its transform and never decreases thereafter. Thus the displayed inequality is strict for every such
    prime. Here $a$ denotes the log discrepancy, as throughout the paper.
  If the initial adjoint is nef, the construction takes no steps; conversely,
    a zero-step nef outcome requires the initial adjoint to be nef.
    In the non-pseudo-effective case a zero-step program is also allowed when the first selected contraction
    already gives a Mori fibre structure on $X$. This completes both endpoint assertions. ◻
]

== 8 Effective resolutions and fiberwise nonvanishing <sec:resolution-fibers>

Fujiki class $cal(C)$ consists of compact complex spaces bimeromorphic to compact Kähler manifolds.
  For a rational adjoint, $kappa$ denotes its Kodaira dimension,
  defined by sections of divisible positive multiples and equal to $- oo$ when all such section spaces vanish.
  A fibration is a surjective holomorphic map with connected fibres.

We first make the boundary effective on a resolution while preserving the divisible adjoint section spaces.
  We then establish fiberwise nonvanishing with one common divisible degree.

#thm([Lemma 8.1.])[
  #emph[Let $\( X \, B \)$ be a rational klt pair with $D = K_X + B$ rational Cartier, and let $p : Z arrow.r
    X$ be a projective log resolution. There is an effective rational SNC divisor $Gamma$ with coefficients
    strictly less than one such that
#[#set math.equation(numbering: n => "(8.1)")
 $ K_Z + Gamma tilde.op_(bb(Q)) p^(*) D + E \, wide E gt.eq 0 quad upright("and") quad
   E upright(" is ") p upright("-exceptional") . $ <eq:supply-log-resolution>]

 These are actual rational line bundles with their birational identification.
   If $D$ is analytically pseudo-effective, then so is $K_Z + Gamma$.
   For every sufficiently divisible positive integer $m$,
#[#set math.equation(numbering: n => "(8.2)")
 $ p_(*) cal(O)_Z #scale(x: 120%, y: 120%)[\(] m \( K_Z + Gamma \) #scale(x: 120%, y: 120%)[\)] tilde.eq
   cal(O)_X \( m D \) . $ <eq:supply-section-descent>]

]
] <lem:supply-log-resolution>

#proof[
  Define the crepant subboundary $Gamma_0$ by $K_Z + Gamma_0 = p^(*) D$,
    using the canonical identification over the locus where $p$ is an isomorphism.
    Local canonical generators and their Jacobians define this equality without choosing a global canonical
    divisor. Klt singularities give $"coeff"_P Gamma_0 < 1$ for every prime divisor $P$ on $Z$.
    The nonexceptional coefficients are those of $B$ and are nonnegative. Set
  $ Gamma = sum_P max { "coeff"_P Gamma_0 \, 0 } P \, wide E = Gamma - Gamma_0 . $
  Both supports lie in the SNC divisor of the log resolution. This proves (8.1).
    A positive singular metric on a Cartier multiple of $D$ pulls back under the dominant map $p$;
    multiplying by the divisor metric of the effective correction proves pseudo-effectivity upstairs.
  Take $m$ clearing the Cartier indices and all coefficients in (8.1).
    The image of $"Supp" E$ has codimension at least two in the normal space $X$, and $p_(*) cal(O)_Z \( m E \) =
    cal(O)_X$. Indeed, a local section of $cal(O)_Z \( m E \)$ is a meromorphic function with poles allowed only
    along $E$. It gives a holomorphic function off that codimension-two image, which extends by normality;
    its pullback agrees with the original section on a dense open set. The reverse inclusion is immediate.
    The actual line-bundle identity
  $ cal(O)_Z #scale(x: 120%, y: 120%)[\(] m \( K_Z + Gamma \) #scale(x: 120%, y: 120%)[\)] tilde.eq p^(*)
    cal(O)_X \( m D \) ⊗ cal(O)_Z \( m E \) $
  and the projection formula give (8.2). ◻
]

The next lemma separates two quantifiers in restricting a positive metric.
  Such a metric initially restricts on almost every smooth fiber.
  Projective nonvanishing in dimension at most three and proper holomorphic cohomology then supply a single
  nonzero adjoint multiple on every fiber of the indicated smooth locus.

#thm([Lemma 8.2.])[
  #emph[Let $g : Z arrow.r T$ be a surjective holomorphic map with connected fibers between smooth compact
    connected Kähler manifolds. Let $Gamma$ be an effective rational SNC divisor with coefficients strictly less
    than one. Suppose that $K_Z + Gamma$ is analytically pseudo-effective and that the very general smooth fiber
    is projective of dimension at most three. Then
$ kappa \( F \, K_F + Gamma \|_F \) gt.eq 0 $

 for a very general smooth fiber $F$. Moreover, one positive divisible degree gives a nonzero section on every
   fiber over the smooth base locus where the boundary strata restrict smoothly.]
] <lem:supply-fibers>

#proof[
  #emph[Restriction of the metric.] Remove the critical values of $g$ and the proper images on which a boundary
    stratum fails to restrict smoothly. The remaining nonempty open set $T^compose subset T$ is connected.
    On it the fibers are smooth, $Gamma \|_(F_t)$ is an effective SNC boundary with coefficients less than one,
    and adjunction is an identity of actual rational line bundles:
  #[#set math.equation(numbering: n => "(8.3)")
   $ \( K_Z + Gamma \) \|_(F_t) = K_(F_t) + Gamma \|_(F_t) . $ <eq:supply-fiber-adjunction>]
  Here the constant one-dimensional factor coming from $K_T \|_t$ is immaterial to the line-bundle isomorphism on $F_t$.
  Choose $r > 0$ so that $L = cal(O)_Z \( r \( K_Z + Gamma \) \)$ is a line bundle.
    Give $L$ a singular Hermitian metric of nonnegative curvature. Its local weights are plurisubharmonic.
    In product coordinates for the submersion over $T^compose$,
    their local integrability and Fubini’s theorem show that the weights restrict to plurisubharmonic functions,
    rather than identically $- oo$, on almost every fiber. A countable cover gives this assertion simultaneously
    for the local weights; their transition identities are preserved under restriction.
    Thus $L \|_(F_t)$ is analytically pseudo-effective for almost every $t in T^compose$.
  #emph[Projective nonvanishing on the fibers.] For almost every such parameter the fiber is also projective:
    the exceptions to the very-general projectivity assumption have measure zero.
    On a smooth projective manifold the analytic pseudo-effective cone restricted to divisor classes is the
    closure of the effective divisor cone, by #cite(label("BDPP2013")) Proposition 1.2.
    Hence the projective klt pair $\( F_t \, Gamma \|_(F_t) \)$ has pseudo-effective adjoint.
    The projective log MMP in dimensions at most three produces a nef model.
    For example, in dimension three the ordinary cone and flip theorems,
    together with #cite(label("CT2023")) Theorem 1.2 with zero nef part, give termination;
    pseudo-effectivity excludes a Mori fiber space. The projective log abundance theorem
    #cite(label("KMMAbundance1994")) Theorem 1.1, with the correction #cite(label("MatsukiCorrection2003")) §6.1,
    gives a nonzero section of a multiple of the nef adjoint.
    Dimensions one and two use the classical log abundance theorem.
    The effective pullback comparison on a common resolution pulls this section back to a section of a multiple of
    the original adjoint. It descends to $F_t$ by the projection formula for the modification. Consequently
  #[#set math.equation(numbering: n => "(8.4)")
   $ H^0 \( F_t \, L^(⊗ m_t) \|_(F_t) \) eq.not 0 quad upright("for some ") m_t > 0 $ <eq:supply-ae-nonvanishing>]
  for almost every $t in T^compose$. If the fiber is a point this assertion holds directly.
  #emph[A common positive degree.] To obtain the required quantifier, put
  $ A_m = { t in T^compose : h^0 \( F_t \, L^(⊗ m) \|_(F_t) \) gt.eq 1 #scale(x: 120%, y: 120%)[}] \, wide m =
    1 \, 2 \, dots.h . $
  These are closed analytic jumping loci: the restricted family is proper and smooth,
    and $L^(⊗ m)$ is locally free and flat over its base, so proper holomorphic cohomology and base change apply
    #cite(label("Douady1974")) §8, Theorem 3, p. 62. By (8.4),
    their countable union contains almost every point of $T^compose$.
    If every $A_m$ were proper, that union would have measure zero.
    Therefore some $A_m$ equals $T^compose$, since this base is connected. This proves both assertions.
    In particular, almost-everywhere restriction of a metric has not been identified with the very-general
    assertion by definition. ◻
]

== 9 Relative programs for rational nef line data <sec:relative>

Rational line bundles on projective modifications provide the relative constructions used in the contraction
  induction and the companion flip-termination theorem. We establish ordinary representatives over Stein
  neighborhoods, elementary relative steps, a finite auxiliary program, and extraction of prescribed divisors.
  All these constructions take place over a fixed compact base.
  Their numerical spaces use degrees of global line bundles,
  rather than the full Bott–Chern space of the ordinary contractions above.

The nef data in this section are rational line bundles, distinct from the possibly transcendental nef classes used
  in the supporting-contraction proof.

=== 9.1 Rational bundles and generalized pairs <rational-bundles-and-generalized-pairs>

#prodef([Convention 9.1.])[
  A rational line bundle is an element of $"Pic" \( T \) ⊗_(bb(Z)) bb(Q)$.
    An equality of rational line bundles means an isomorphism of holomorphic line bundles after a positive common
    multiple. A rank-one reflexive sheaf is rationally invertible if one of its positive reflexive powers is
    invertible. We use additive notation for these objects, their tensor products, and their reflexive transforms.
    In particular, $K_T$ denotes the reflexive canonical sheaf, without a choice of a global meromorphic canonical form.
  For a projective morphism $T arrow.r V$, the words relatively nef and relatively ample,
    applied to rational line bundles, refer respectively to degrees on curves in the fibers and ampleness of a
    positive integral power. Real combinations of rational line bundles have the corresponding numerical meanings.
    Absolute nefness of a bundle on a compact Kähler space implies relative nefness in this sense.
] <conv:rational-bundles>

#prodef([Definition 9.2.])[
  Rational generalized b-line data on a normal compact space $T$ consist of an effective rational divisor $B$,
    a projective modification $p : W arrow.r T$, and a rational line bundle $M_W$ on $W$.
    The bundle is pulled back on every higher model; this b-object is denoted by $upright(bold(M))$.
    We require $M_W$ to be nef, or to be nef over a specified base in a relative argument.
    Its trace on $T$ is obtained by taking a proper direct image of a cleared power and then its double dual.
    The adjoint
  $ D_T = K_T + B + M_T $
  is required to be rationally invertible. We may increase $W$ to a smooth projective log resolution carrying the
    data. On such a model the boundary $B_W$ is determined by the crepant formula
  #[#set math.equation(numbering: n => "(9.1)")
   $ K_W + B_W + M_W = p^(*) D_T . $ <eq:generalized-crepant>]
  The equality uses the natural meromorphic identifications over the isomorphism locus.
    Log discrepancy is $a \( E \; T \, B + upright(bold(M)) \) = 1 - "coeff"_E B_W$,
    evaluated on a model carrying $E$. Generalized klt and generalized lc, abbreviated gklt and glc,
    mean that all these discrepancies are positive and nonnegative, respectively.
    A generalized terminal pair is gklt and has $a \( E \; T \, B + upright(bold(M)) \) >
    1$ for every exceptional prime divisor over $T$.
  A generalized dlt pair, abbreviated gdlt, is a glc pair for which there is a Zariski open set $T^compose subset
    T$ such that $\( T^compose \, B \|_(T^compose) \)$ is simple normal crossing, the b-data descend there,
    and $T^compose$ contains the general point of every zero-discrepancy center.
    We choose the carrier and subsequent log resolutions to be isomorphisms on this open set.
    Thus the centers in $T^compose$ are strata of the coefficient-one boundary.
] <def:generalized-data>

We also allow real combinations of a fixed finite set of rational data for local cone arguments and real scaling.
  The extraction and termination statements below use rational data.

#thm([Lemma 9.3.])[
  (Traces and exceptional comparisons).  #emph[Let $p : W arrow.r
    T$ be a projective modification of normal compact spaces.]
  + #emph[For a line bundle $L$ on $W$, $\( p_(*) L \)^(* *)$ is coherent and rank one.
    If its appropriate reflexive power is invertible, the natural comparison between that power pulled back to $W$
    and the corresponding power of $L$ is an exceptional Cartier divisor.
    This assertion uses actual bundles and is compatible with further pullback.]
  + #emph[Rank-one reflexive sheaves can be transported coherently across a bimeromorphic map by pullback,
    proper direct image, and double dual on a common projective resolution.
    Their transforms agree on the common codimension-one open set and are independent of the chosen resolution
    when the map is small. If $L = L' + G$ is an identity of rational bundles on the carrier with $G$ a rational
    divisor, their reflexive traces satisfy $L_T = L'_T + p_(*) G$.
    The trace of $K_W$, or of its pullback to a higher model, is $K_T$.]
  + #emph[If $T$ is globally strongly $bb(Q)$-factorial and $upright(bold(M))$ is nef over a base over which $p$
    is projective, then
#[#set math.equation(numbering: n => "(9.2)")
 $ F_M := p^(*) M_T - M_W gt.eq 0 $ <eq:nef-trace-defect>]

 is exceptional. Consequently, forgetting the nef part of a gklt, respectively gdlt,
   pair on $T$ gives an ordinary klt, respectively dlt, pair.
   A gdlt pair becomes gklt after replacing $B$ by $B - epsilon.alt floor.l B floor.r$,
   for every sufficiently small $epsilon.alt > 0$.]
] <lem:trace>

#proof[
  Proper direct image preserves coherence. On the isomorphism locus its rank is one,
    and double dual gives a rank-one reflexive sheaf on the normal target.
    Locally on $T$, choose meromorphic generators of this coherent sheaf and of a cleared invertible power.
    Pulling back their comparison gives a meromorphic comparison with the bundle upstairs.
    One can see that the comparison is meromorphic, rather than merely defined on a punctured open set,
    by using a local finite presentation of $p_(*) L$: its generators evaluate to holomorphic sections of $L$,
    and their ratios supply local denominators. The comparisons agree on overlaps because they agree on the
    isomorphism locus. Their divisor is exceptional. This also proves compatibility with powers and pullback.
    A global meromorphic frame was not used.
  For a common resolution $W$ with maps to the two spaces, first pull back the sheaf, remove torsion,
    and take its double dual; after an additional projective principalization it is a line bundle.
    Proper direct image to the other space followed by double dual is coherent.
    On a common codimension-one open set it is the required transform.
    Normality gives uniqueness of a reflexive extension across codimension at least two,
    proving the assertion for small maps. The additive trace identity is checked at every codimension-one point of
    $T$, where the modification is an isomorphism, and then extended reflexively.
    The same observation applies to canonical sheaves and their pullbacks.
    It requires compatible local canonical forms only.
  Global strong $bb(Q)$-factoriality makes $M_T$ rationally invertible, so the first assertion defines $F_M$.
    Its negative is $p$-nef and has zero pushforward. Lemma 5 gives $F_M gt.eq 0$.
    The ordinary crepant boundary is $B_W - F_M$: (9.1) gives explicitly
  $ p^(*) \( K_T + B \) - K_W = B_W + M_W - p^(*) M_T = B_W - F_M . $
  Thus ordinary log discrepancies are at least the generalized ones.
    Every ordinary zero center is a generalized zero center and is therefore generically in the specified simple
    normal crossing open set. This proves the klt and dlt assertions.
  The effective divisor $floor.l B floor.r$ is rational Cartier on $T$.
    Decreasing it subtracts the effective divisor $epsilon.alt p^(*) floor.l B floor.r$ from the crepant boundary.
    A former positive discrepancy stays positive. Every former zero-discrepancy place has center in the floor,
    since its center is generically a coefficient-one stratum,
    and hence has strictly positive order on the pullback of the floor. Its new discrepancy is positive as well.
    The boundary on $T$ remains effective for $0 < epsilon.alt < 1$. ◻
]

=== 9.2 Ordinary representatives over Stein neighborhoods <ordinary-representatives-over-stein-neighborhoods>

We use the following local analytic inputs with their stated domains.
  A Stein compact has property (P) if its intersections with analytic sets defined near the compact have finitely
  many connected components. For a projective morphism over a Stein compact satisfying property (P),
  the ordinary klt cone theorem has finitely many rays in each region truncated by a relatively ample divisor
  #cite(label("Fujino2022")) Theorem 7.2. The base point free theorem generates every sufficiently large integral
  power of a nef line bundle $L$ when $a L - \( K + Delta \)$ is relatively ample #cite(label("Fujino2022"))
  Theorems 6.2 and 6.5. Ordinary klt flips exist for small projective morphisms of normal analytic spaces without
  a $bb(Q)$-factoriality assumption #cite(label("Fujino2022")) Theorem 1.14.
  Finally, on a smooth source the multigraded adjoint ring with simultaneous SNC subunit rational boundaries and a
  common relatively ample rational part is locally finitely generated #cite(label("DHP2024")) Theorem 3.1.
  We explain the passages from these local statements to our data and compact base.

#thm([Lemma 9.4.])[
  (Local ordinary representatives).  #emph[Let $pi : T arrow.r V$ be projective and bimeromorphic,
    let $\( T \, B + upright(bold(M)) \)$ be gklt rational data,
    and suppose the carrier is projective over $T$ and $M_W$ is nef over $V$.
    Let $H$ be a $pi$-ample rational line bundle. Near any sufficiently small Stein compact in $V$ there are an
    effective ordinary klt boundary $Delta$, an effective rational divisor $H_0 tilde.op_(bb(Q)) H$,
    and $eta > 0$ such that
#[#set math.equation(numbering: n => "(9.3)")
 $ K_T + Delta tilde.op_(bb(Q)) D_T \, wide Delta gt.eq eta H_0 . $ <eq:ordinary-replacement>]

 These are actual rational line-bundle equivalences on that neighborhood.
   For $0 lt.eq delta lt.eq eta \/ 2$, $Delta - delta H_0$ is effective klt and represents $D_T - delta H$.
   For finitely many rational adjoints of this type on a common initial space,
   the representatives can have a common positive ample part. Their convex combinations have the same properties.
   The local cone conclusions also hold for gklt real combinations of finitely many rational data.]
] <lem:ordinary-representative>

#proof[
  Write $p : W arrow.r T$ for a smooth carrier, with $p$ projective, and put $rho = pi p$.
    Work on a Stein neighborhood $U$ of the prescribed compact. Choose a $rho$-ample rational line bundle $A$.
    For an integer $m$ clearing denominators, the sheaf
  $ rho_(*) cal(O)_W #scale(x: 120%, y: 120%)[\(] m \( M_W - A \) #scale(x: 120%, y: 120%)[\)] $
  is coherent and has rank one over the bimeromorphic isomorphism locus. It is nonzero.
    Cartan’s Theorem A gives a nonzero section over $U$, whose pullback defines an effective divisor.
    Hence, after division by $m$,
  #[#set math.equation(numbering: n => "(9.4)")
   $ M_W tilde.op_(bb(Q)) A + E \, wide E gt.eq 0 . $ <eq:relative-kodaira-section>]
  This proves relative bigness directly, including when $M_W = 0$. The divisor $E$ need not be exceptional.
    The equivalence comes from a section of the specified bundle, and introduces no unspecified numerical or base twist.
  Keep $W$ and the $rho$-ample bundle $A$ fixed. Choose an auxiliary log resolution of the finite fixed supports
    only to test the singularities. On that auxiliary resolution there are finitely many crepant coefficients over
    the compact preimage, all strictly below one. Hence a sufficiently small rational $epsilon.alt >
    0$ makes $\( W \, B_W + epsilon.alt E \)$ sub-klt. The rational bundle
  $ A_epsilon.alt = \( 1 - epsilon.alt \) M_W + epsilon.alt A $
  is $rho$-ample. Choose a rational $eta > 0$ such that $A_epsilon.alt - eta p^(*) H$ is still $rho$-ample.
    On a smaller neighborhood, sufficiently large powers of these relatively ample bundles are relatively
    generated. Cartan’s Theorem A supplies finitely many sections generating over the compact preimage;
    shrink once more so that they generate throughout. Divided general members give
  $ H_0 gt.eq 0 \, quad H_0 tilde.op_(bb(Q)) H \, wide G gt.eq 0 \, quad G tilde.op_(bb(Q)) A_epsilon.alt -
    eta p^(*) H . $
  Choose the members on $T$ and $W$, respectively, with large denominators,
    and test generality on the auxiliary log resolution. Their pulled-back systems remain free;
    we do not claim that a pulled-back ample bundle stays ample. Analytic Bertini gives
  $ C_W = B_W + epsilon.alt E + G + eta p^(*) H_0 $
  sub-klt. Here generation is used for the ample systems only;
    the nonzero section producing $E$ was not claimed to generate its bundle.
    The analytic generation and Bertini statements used in this step are #cite(label("DHP2024")) Theorems 2.12 and 2.20.
  Push down to obtain
  $ Delta = B + epsilon.alt p_(*) E + p_(*) G + eta H_0 gt.eq eta H_0 . $
  Only exceptional coefficients of $B_W$ could be negative, so $Delta$ is effective.
    The actual upstairs identity is $K_W + C_W tilde.op_(bb(Q)) p^(*) D_T$.
    Choose an integer clearing this identity, push forward the resulting line-bundle isomorphism,
    and take double duals. Agreement in codimension one gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ cal(O)_T #scale(x: 120%, y: 120%)[\(] m \( K_T + Delta \) #scale(x: 120%, y: 120%)[\)] tilde.eq
     cal(O)_T \( m D_T \) . $ <eq:replacement-cartier>]
  In particular, the new ordinary adjoint is rational Cartier.
    We have not inferred Cartierness of newly chosen local divisors from global strong $bb(Q)$-factoriality. The divisor
  $ K_W + C_W - p^(*) \( K_T + Delta \) $
  is exceptional and $p$-numerically trivial by the same line-bundle identity.
    Lemma 5 in both signs makes it zero. Thus $C_W$ is the ordinary crepant boundary,
    and $\( T \, Delta \)$ is klt. Subtracting $delta H_0$ gives the asserted representation of $D_T -
    delta H$ and leaves the common ample part $\( eta \/ 2 \) H_0$.
  For finitely many vertices, use one carrier and one $H_0$, choose their effective divisors in (9.4),
    and resolve all fixed supports together. Take a common sufficiently small $epsilon.alt$ and then a common
    $eta$. Choose the finitely many free members generally. On the resulting common resolution all the crepant
    coefficients are uniformly below one. Convex combinations are therefore klt and keep the same ample part.
    The parameter space can be the simplex of vertex weights;
    no affine independence of the original vertices is required.
  For real data, first express the bundle in a finite real span of rational bundles on the carrier.
    Every signed rational generator has an effective representative over the Stein neighborhood by the same Cartan
    argument. Thus a real nef bundle also has an expression $M_W tilde.op_(bb(R)) A +
    E$ with $A$ relatively ample and $E gt.eq 0$ in a fixed finite divisor span.
    The preceding small-$epsilon.alt$ construction applies. A real relatively ample bundle can be written as a
    positive combination of finitely many nearby rational relatively ample bundles;
    divided general members of those bundles give the required real boundary.
    The ordinary real klt cone theorem is consequently applicable.
    Only the rational construction is used for line-bundle descent and for the finite adjoint rings. ◻
]

Lemma 50 also supplies the hypothesis needed to apply integral descent to a relatively antiample generalized klt
  adjoint. Indeed its ordinary representative is klt and has the same relative line-bundle class.
  If an integral line bundle $L$ has zero degree on every contracted curve,
  then $a L - \( K_T + Delta \)$ is relatively ample. Lemma 9 therefore gives the actual identity $L =
  f^(*) f_(*) L$; the consecutive-power argument in its proof introduces no extra integral multiple.
  Clearing one denominator gives the corresponding assertion for rational line bundles.
  The representatives may differ on the Stein neighborhoods:
  the descended bundle and its evaluation map are intrinsic and glue.

=== 9.3 Global relative degrees and elementary steps <global-relative-degrees-and-elementary-steps>

For a projective morphism $pi : T arrow.r V$ of compact spaces,
  let $N_(upright("gl"))^1 \( T \/ V \)_(bb(Q))$ be the space of global rational line bundles modulo equality of
  degrees on all curves contracted by $pi$. Put $N_(upright("gl"))^1 \( T \/ V \) =
  N_(upright("gl"))^1 \( T \/ V \)_(bb(Q)) ⊗ bb(R)$, and let $N_(1 \, upright("gl")) \( T \/ V \)$ be the dual
  space generated by relative curve functionals. These spaces are finite-dimensional:
  pull back to a compact resolution and use the first Chern class in its finite dimensional cohomology. Write

$ overline(upright("NE"))_(upright("gl")) \( T \/ V \) subset N_(1 \, upright("gl")) \( T \/ V \) $

for the closed cone generated by these functionals. A relatively ample global line bundle gives a compact
  normalized slice of this cone.

Here are details about the compactness and the local cone statements which will be used.
  Choose a finite cover of $V$ by interiors of Stein compacts $W_nu$ in Stein open sets $U_nu$.
  We choose them semianalytic in coordinate charts, so they satisfy property (P).
  On each chart the ordinary relative numerical cone has a compact slice normalized by the restriction of a fixed
  global relatively ample bundle $H$. Restricting global bundles defines a linear projection from the local curve
  space to $N_(1 \, upright("gl")) \( T \/ V \)$. The image of that slice is compact and still lies in $H = 1$.
  The convex hull of these finitely many compact images is compact and is precisely the global normalized slice.
  Indeed every relative curve lies over one of the compacts,
  and passage to closure commutes with this finite compact convex hull.

Apply Lemma 50 on the charts to a gklt adjoint $J$. The local cone theorem and projection show that,
  for each $c > 0$, only finitely many generating curve rays are needed in the global region $\( J + c H \) < 0$.
  The remaining summand is in $\( J + c H \) gt.eq 0$. If $J$ is nef,
  apply the same argument to the ordinary representative of $J - delta H$,
  with a further ample perturbation $\( delta \/ 2 \) H$. In the slice $H =
  1$ this gives a finite set of curve rays near $J = 0$ and a remainder on which $J gt.eq delta \/ 2$.
  In particular the face $J = 0$ is generated by finitely many curves.
  It also gives the following useful openness statement: if a linear perturbation is positive on that zero face,
  it is positive on the whole slice for all sufficiently small positive parameters.
  This follows by checking the finite rays and using the uniform $delta \/ 2$ margin on the remainder.

For a rational gklt adjoint, every negative global extremal ray has a rational supporting line bundle.
  To see this, use the finite decomposition in a truncated negative neighborhood of that ray.
  The normalized point of an extremal ray is outside the compact convex hull of the other generators and the
  remaining nonnegative part. Separation gives a nef functional vanishing only on that ray,
  with a strict margin on the other part. These functionals contain an open subset of its perpendicular
  hyperplane. The ray is generated by a curve, so the hyperplane is rational; choose a rational functional there.
  It is a rational line-bundle class by the definition of $N_(upright("gl"))^1$.
  Subtracting a sufficiently small positive multiple of the adjoint is strictly positive on the normalized slice.
  After rescaling the support, its difference from the adjoint is relatively ample.
  Strict positivity here implies ampleness on each projective fiber by Kleiman’s criterion,
  and relative ampleness follows over a neighborhood of each fiber.
  This reasoning involves line bundle degrees on projective fibers only.

#thm([Lemma 9.5.])[
  (Sheaves and signs across a step).  #emph[Let $T$ be globally strongly $bb(Q)$-factorial.
    Suppose a projective bimeromorphic contraction $f : T arrow.r
    Z$ has all its contracted curves in one nonzero ray for global rational line-bundle degrees.
    Let $J$ be a rational line bundle with $- J$ $f$-ample, admitting the local klt representatives required in
    Lemma 9.]
  + #emph[If $f$ is divisorial, its exceptional locus is a single prime $E$, with $E dot.op R < 0$,
    and $Z$ is globally strongly $bb(Q)$-factorial. Every adjoint pushed down to $Z$ is rational Cartier.]
  + #emph[If $f$ is small and its $J$-positive small projective model $f^(+) : T^(+) arrow.r Z$ exists,
    then $T^(+)$ is globally strongly $bb(Q)$-factorial. Every global rational line bundle $L$ on $T$ has a
    rationally invertible transform $L^(+)$, and
#[#set math.equation(numbering: n => "(9.6)")
 $ L = f^(*) A + c J quad arrow.r.double quad L^(+) = \( f^(+) \)^(*) A + c J^(+) $ <eq:step-line-adjustment>]

 for an actual rational line bundle $A$ on $Z$, where $c = \( L dot.op R \) \/ \( J dot.op R \) in bb(Q)$.
   In particular, a negative, zero, or positive degree for $L$ becomes respectively relative ampleness,
   relative triviality, or relative antiampleness for $L^(+)$.]
] <lem:sheaf-step>

#proof[
  For an exceptional prime $E$, global strong $bb(Q)$-factoriality makes $E$ rational Cartier.
    If it were $f$-nef, Lemma 5(i) applied to $- E$ would give $- E gt.eq 0$. Thus $E dot.op R < 0$.
    Every contracted curve must lie in $E$, since an effective rational Cartier divisor has nonnegative
    intersection with a curve not contained in its support. Every point of a nontrivial projective fiber lies on a
    curve in that fiber. Hence the entire exceptional locus is $E$, and no second exceptional prime exists.
  For a global rank-one reflexive sheaf $cal(F)$ on $Z$, form its reflexive pullback to $T$.
    A positive power is a line bundle. Subtract a rational multiple of $E$ so that its degree is zero on $R$ and
    apply Lemma 9. The descended rational bundle agrees with $cal(F)$ to that power on the complement of a
    codimension-two set in $Z$. Reflexivity extends the identity.
    This proves the global strong condition and, in particular, applies to the pushed-forward canonical, boundary,
    and nef-trace sheaves.
  In the small case, $L - c J$ has zero degree and descends by Lemma 9.
    The right-hand side of (9.6) is a rational line bundle on $T^(+)$ and agrees with the transform of $L$ on the
    common open set. It is therefore the reflexive transform.
    The sign conclusions follow from relative ampleness of $J^(+)$ and the sign of $c$.
  Conversely, transport an arbitrary global rank-one reflexive sheaf $cal(G)$ on $T^(+)$ to $T$ as in Lemma 49.
    A reflexive power of its transform is invertible on $T$. The preceding argument makes its transform a rational
    line bundle on $T^(+)$. It agrees with the corresponding reflexive power of $cal(G)$ on the common
    codimension-one open set, and hence everywhere. This is global strong $bb(Q)$-factoriality on $T^(+)$;
    no assertion about arbitrary open subsets is involved. ◻
]

#prodef([Definition 9.6.])[
  An elementary relative step is a projective divisorial contraction or a small projective negative-to-positive
    adjoint surgery over a normal compact Kähler base, with globally strongly $bb(Q)$-factorial source and output.
    All contracted curves on the negative side span one nonzero ray when paired with global rational line bundles.
    The boundary is pushed forward or strictly transformed, and the same b-data are used on common higher models.
    The small positive model is the relative Proj of the actual adjoint algebra.
    No condition on its relative Bott–Chern dimension is included.
] <def:relative-elementary>

#thm([Proposition 9.7.])[
  (Relative continuation).  #emph[Let $pi : T arrow.r V$ be a projective bimeromorphic morphism of normal compact
    Kähler spaces. Assume $T$ is globally strongly $bb(Q)$-factorial and $\( T \, B + upright(bold(M)) \)$ is
    rational gdlt, with projective carrier and nef data over $V$.
    If its adjoint is not curve-nef over $V$, there is an elementary negative step over $V$.
    Its target is projective over $V$, compact Kähler, globally strongly $bb(Q)$-factorial,
    and gdlt with the transformed data. The construction is available after every finite prefix whose final
    adjoint is not curve-nef over $V$. For gklt data one may choose any negative extremal ray in the global degree
    cone.]
] <prop:relative-steps>

#proof[
  First assume gklt. The global cone construction above gives a negative ray and a nef rational supporting line
    bundle $L$ which vanishes precisely on that ray and for which a multiple minus the adjoint is relatively
    ample. Apply the ordinary base point free theorem on the finite Stein cover, using Lemma 50.
    It generates a common positive power of $L$ relative to $V$.
    The relative section morphism and its Stein factorization give $f : T arrow.r
    Z$ with connected fibers and normal target, contracting exactly the curves on the selected ray.
    The target is projective over $V$: it is finite over the image in the projectivization of the coherent sheaf
    of relative sections. Since $T arrow.r V$ is bimeromorphic,
    $Z$ has the same dimension and $f$ is bimeromorphic. The negative adjoint is relatively ample,
    because on every $f$-fiber its class is a positive multiple of a relatively ample class in the one-dimensional
    global degree space.
  If $f$ is divisorial, apply Lemma 51. If it is small, apply Lemma 50 locally over $Z$,
    followed by the ordinary analytic klt flip theorem #cite(label("Fujino2022")) Theorem 1.14.
    Equivalently, the actual relative adjoint algebra is locally finitely generated by #cite(label("DHP2024"))
    Corollary 3.7; the flip theorem also supplies its normality and smallness.
    The local models glue by the intrinsic algebra. Compactness permits a common Veronese generated in degree one.
    On the common codimension-one open set its tautological bundle is the stated adjoint power.
    Both sheaves are reflexive on the normal positive side, so this identity extends globally.
    Thus the positive adjoint is rational Cartier and relatively ample as an actual bundle.
    Lemma 51 gives global strong $bb(Q)$-factoriality.
  All spaces constructed are projective over a compact Kähler space.
    A relatively ample line bundle has a metric with positive curvature in the fiber directions;
    adding a sufficiently large pullback of a Kähler form on the base gives a Kähler form.
    Thus the spaces are compact Kähler. The common carrier remains projective over the models:
    take the main component of the graph over $Z$ and resolve it. The pulled-back nef data are still nef over $V$.
  For gdlt data, replace $B$ by $B - epsilon.alt floor.l B floor.r$ with small rational $epsilon.alt > 0$.
    By Lemma 49 this is gklt; denote its adjoint by $D_epsilon.alt$.
    Normalize by a relatively ample bundle $H$, and choose a relative curve class $z$ with $H dot.op z =
    1$ and $D dot.op z = - a < 0$. Choose $epsilon.alt$ so that $\| \( D_epsilon.alt - D \) dot.op u \| < a \/
    4$ on the whole compact normalized slice. Choose an extreme point $u_0$ of the face where $D$ attains its
    minimum on this slice. It is an extreme point of the entire slice, so it spans a global extremal ray $R$.
    Since $D dot.op u_0 lt.eq D dot.op z = - a$, the uniform perturbation bound gives $D_epsilon.alt dot.op
    u_0 < - 3 a \/ 4$. Thus $R$ is negative for both adjoints.
    The gklt construction contracts this global extremal ray for the perturbed pair.
    The original adjoint has the same negative sign on the ray.
    In the small case Lemma 51 identifies its positive transform with a positive multiple of the perturbed
    positive adjoint modulo a base pullback. In the divisorial case that lemma makes its pushdown rational
    Cartier. These are therefore steps for the original data.
  Finally Lemma 5 proves the discrepancy comparisons. For gklt, positivity is preserved.
    For gdlt, a new zero-discrepancy center cannot have its general point in an exceptional locus, by strictness.
    Its corresponding old zero center is generically in the unchanged good open set.
    The transformed boundary is SNC and the b-data descend there. This gives a gdlt good open set on the output.
    The same hypotheses hold for the next relative morphism to $V$,
    so the construction continues whenever relative nefness fails. ◻
]

=== 9.4 Finiteness on a compact relative base <finiteness-on-a-compact-relative-base>

The next proposition constructs some finite relative program.
  It will be used to replace a single step of an arbitrary sequence by a finite program on a higher model.
  It does not assert termination of every relative program.
  We first prove the finite-model statement needed for this construction.

#thm([Lemma 9.8.])[
  (Local finiteness of marked ample models).  #emph[Let $T arrow.r
    V$ be projective and bimeromorphic and let $D_0 \, dots.h \,
    D_s$ be rational gklt adjoints on $T$ with a common projective carrier and nef data over $V$.
    On a smaller neighborhood of a prescribed Stein compact, the rational adjoints in the simplex of their convex
    combinations have only finitely many marked relative ample models.
    Here a marking is the bimeromorphic map from $T$, and an ample model is required to have an effective
    exceptional pullback difference. No local $bb(Q)$-factoriality of $T$ is assumed.]
] <lem:marked-models>

#proof[
  Lemma 50 supplies ordinary klt representatives with a common positive relatively ample part.
    Choose a common projective log resolution $a : S arrow.r T$ by successive blowups and principalizations with
    centers exceptional over $T$, resolving all fixed supports.
    This choice can be made with an effective exceptional divisor $F$ such that $- F$ is $a$-ample:
    for each blowup take its effective tautological exceptional divisor,
    and inductively add it to a sufficiently large positive multiple of the pullback of the divisor for the
    preceding composite. Relative ampleness under composition proves the assertion;
    further such blowups preserve it. For the identity resolution take $F = 0$.
    This is the blowup-resolution construction used in #cite(label("DHP2024")) Theorem 2.13, Remark 2.14,
    and the proof of Corollary 3.7. For each vertex choose every exceptional coefficient strictly between the
    maximum of zero and its crepant coefficient and one. We obtain
  $ K_S + Gamma_j = a^(*) D_j + E_j \, wide E_j gt.eq 0 upright(" exceptional") \, quad 0 lt.eq Gamma_j < 1 . $
  All supports, including that of $F$, are SNC. The ample part downstairs permits a common relatively ample part
    upstairs. More explicitly, scale the chosen $F$ by a small positive rational number so that $a^(*) H -
    F$ is ample over $V$, where $H$ is the fixed ample part downstairs.
    For a sufficiently small $tau > 0$ put $A = tau \( a^(*) H - F \)$.
    The finitely many exceptional coefficients of the $Gamma_j$ have positive margins from both zero and one.
    Then $Gamma_j - A$ is effective with coefficients below one; their supports, including that of $F$, are SNC.
    One can either use this relatively ample rational divisor $A$ directly or replace it by a divided general
    member and make the corresponding simultaneous linear-equivalence changes in the boundaries.
  The multigraded ring of the $K_S + Gamma_j$ is locally finitely generated by #cite(label("DHP2024"))
    Theorem 3.1. For nonnegative integers $n_j$, the correction $sum n_j
    E_j$ is effective and exceptional over $T$. Normality gives $a_(*) cal(O)_S \( sum n_j E_j \) = cal(O)_T$.
    The projection formula therefore identifies every multigraded piece with the corresponding piece for the
    $D_j$, compatibly with multiplication. Passing to one common Veronese removes all rounding.
    Thus their actual multigraded ring is locally finitely generated as well.
  For completeness, finite generation gives the required finiteness as follows.
    On a sufficiently small neighborhood choose homogeneous generators with multidegrees $d_1 \, dots.h \,
    d_N in bb(N)^(s + 1)$. For a rational weight $w$ in the simplex,
    a point of the relative spectrum is semistable for the diagonal ring of weight $w$ precisely when $w$ is in
    the cone generated by those $d_i$ whose generators are nonzero at the point.
    To verify this equivalence, clear the rational coefficients of such a cone expression and form the
    corresponding monomial; conversely a nonvanishing homogeneous section contains a nonvanishing monomial of that
    weight. There are only finitely many subsets of the generators and hence finitely many resulting open sets.
    The diagonal Proj is the quotient of its open set, obtained by the degree-zero localizations of these
    monomials. Uniqueness of this quotient shows that weights with the same open set give the same ample model.
    All identifications commute with the map from $T$, which is determined on the bimeromorphic isomorphism locus.
    A finite cover of the Stein compact makes the number of possibilities finite there.
    This is also the marked finite-model conclusion of #cite(label("Fujino2022")) Theorem E,
    now with the ordinary representatives and the smooth reduction justified. ◻
]

#thm([Proposition 9.9.])[
  (A finite relative gklt run).  #emph[In the setting of Proposition 53, assume the pair is gklt.
    There is a finite sequence of elementary steps over $V$ whose final adjoint is curve-nef over $V$.]
] <prop:relative-finite>

#proof[
  Let $D = K_T + B + M_T$. We may suppose $D$ is not already relatively nef.
  #emph[A scaling class valid on every later model.] Choose global rational line bundles $L_1 \, dots.h \,
    L_r$ whose degrees form a basis of $N_(upright("gl"))^1 \( T \/ V \)_(bb(Q))$,
    and write the class of $D$ as $d in bb(Q)^r$.
  These bundles continue to span the degree space after every finite sequence of elementary steps.
    Indeed every line bundle on a later model can be transported to a rational line bundle on the preceding one by
    Lemma 49 and global strong $bb(Q)$-factoriality. For a divisorial contraction its pullback is also such a
    bundle; exceptional-divisor adjustments are available on the source.
    Moreover a bundle numerically trivial over $V$ remains so after a step.
    It first descends across that contraction by Lemma 9. Any curve on the new side over $V$ has a projective lift
    to a common model and then a curve upstairs mapping onto it with positive degree.
    Intersecting the pullbacks of the descended bundle proves its zero degree.
    Thus every later relative curve determines a rational functional $v in bb(Q)^r$,
    nonzero because the later space has a relatively ample line bundle.
  Choose a real vector $h in bb(R)^r$ defining a real linear combination $H$ of the chosen rational line bundles,
    with $H$ and $D + H$ relatively ample. We choose it outside the following countable family of proper rational
    hyperplanes:
  #[#set math.equation(numbering: n => "(9.7)")
   $ v \( h \) & = 0 &  & \( 0 eq.not v in bb(Q)^r \) \,\
v \( d \) w \( h \) - w \( d \) v \( h \) & =
  0 &  & vec(v \, w in bb(Q)^r upright(" independent") \,, \( v \( d \) \, w \( d \) \) eq.not \( 0 \, 0 \)) .
  $ <eq:scaling-generic1>]
  The ample conditions define a nonempty open set, and a countable union of proper hyperplanes cannot exhaust it.
    The rational functionals here range over all possibilities, so this single choice works at every later model;
    no enumeration of the models is required.
  #emph[The scaling steps and their strictly decreasing thresholds.] On a current model,
    let $D_i$ be the reflexive transform of $D$, and let $H_i$ be the same real linear combination of the
    reflexive transforms of the rational line bundles defining $H$;
    across a divisorial step these transforms are the corresponding pushforwards.
    Regard $H$ also as nef b-data over $V$, carried on the initial space.
    Its pullback to a common carrier is relatively nef, so for every $t gt.eq
    0$ the initial generalized pair with adjoint $D + t H$ is gklt.
    At each preceding step of threshold $t_j$, its adjoint has negative degree for $0 lt.eq
    t < t_j$ and zero degree for $t = t_j$. Lemma 5 consequently shows that the transformed pair is gklt
    throughout the parameter interval below the preceding threshold.
  Start with the relatively ample class $D + H$. On a current model take the lower endpoint $t_i$ of the nef
    segment extending downward from the preceding parameter. If $t_i = 0$,
    then $D_i$ is nef and the process stops. Otherwise $J_i = D_i + t_i H_i$ is nef and not ample.
    The local cone argument preceding Lemma 51, applied to this real gklt adjoint,
    shows that its zero face is generated by finitely many curves.
    A generating curve cannot have $D_i$-degree zero, because then its $H_i$-degree would be zero,
    contrary to (9.7). Two independent such rays would violate (9.7).
    Hence the face is one ray in the global degree space. Its $D_i$-degree is negative:
    if it were positive, lowering $t$ would be positive on this face,
    and the uniform cone margin would give nefness below $t_i$, a contradiction.
  Apply Proposition 53 to this $D_i$-negative ray. The threshold class descends.
    Here descent for a real class requires no real-bundle base point free theorem:
    the perpendicular hyperplane of the rational ray is rational,
    so express the threshold class as a real combination of rational line-bundle classes of degree zero and
    descend each by Lemma 9. The threshold comparison is crepant and its transform is nef.
  The thresholds strictly decrease. In a small step, the zero face on the positive side is again generated by
    curves by the real gklt local cone argument. Equations (9.7)– (9.7) allow at most one ray.
    Flipped curves supply that ray and have positive $D$-degree.
    Lowering the parameter is therefore positive on it, and the uniform margin makes the class ample for a
    nonempty interval below the old threshold. In a divisorial step there are no zero curves at the old threshold:
    lifting one to the old space would make it lie on the contracted zero ray while still mapping onto a curve.
    The same margin again gives an ample interval. At every stage,
    the open interval between successive thresholds consists of relatively ample classes:
    an interior zero curve would have zero degree for two parameters, hence zero $H_i$-degree, contrary to (9.7).
  #emph[Finitely many marked ample models.] It remains to exclude infinitely many such intervals.
    Choose finitely many rational relatively ample bundles $H^(\( 1 \)) \, dots.h \, H^(\( s \))$ near $H$,
    with $H$ in the interior of their convex hull and with $D + H^(\( j \))$ relatively ample.
    Consider the fixed rational simplex of weights with vertices
  #[#set math.equation(numbering: n => "(9.8)")
   $ D \, med D + H^(\( 1 \)) \, dots.h \, D + H^(\( s \)) . $ <eq:scaling-polytope>]
  At an interior parameter of any one of the alleged infinitely many ample intervals,
    all preceding intersections for that parameter are strictly negative and final ampleness is open.
    Choose a nearby rational point of (9.8) retaining these finitely many strict conditions.
    The current model is its marked ample model: on a common resolution its pullback difference from the initial
    adjoint is effective and exceptional over the current model by composition of the preceding comparisons.
    The corresponding relative section algebras agree, since pushing an effective exceptional correction to a
    normal target gives the structure sheaf.
  Each vertex in (9.8) has nef b-data on the initial model and is gklt.
    Apply Lemma 54 on each member of a finite Stein compact cover of $V$.
    It gives finitely many local marked ample models, hence finitely many possible tuples of such local models.
    Two global models giving the same tuple are uniquely isomorphic over the interiors of these compacts:
    the identification is fixed on the common bimeromorphic open set and extends by the marked local isomorphism.
    The identifications agree on overlaps by normality, so they glue.
    Thus only finitely many global marked ample models occur.
  A marked model cannot recur across a nontrivial intervening step.
    For a fixed marking $T arrow.r.dashed Y$, choose a common resolution.
    The pullback difference for $D + t H$ is affine in $t$. Its coefficient inequalities of effectivity are
    convex, and the relatively ample cone of $Y$ is convex. The parameters for which $Y$ is its marked ample model
    therefore form an interval. If it occurred in two separated ample intervals of the run,
    it would also be the ample model at every intermediate ample parameter.
    Uniqueness of the relative Proj would identify each intermediate model with the same marking.
    But adjacent models across a nontrivial elementary step have different markings,
    as their adjoint has opposite relative signs. This is impossible.
    Finitely many marked models therefore imply finitely many steps. ◻
]

#prodef([Remark 9.10.])[
  The proof concerns some finite relative run over a bimeromorphic compact base.
    The finite-cover argument for ordinary pairs is also explicit in #cite(label("FujinoCompact2026"))
    Theorems 2.1 and 2.4. We have given the additional generalized-data, global-sheaf, and marked-model arguments,
    because an ordinary theorem assuming $bb(Q)$-factoriality near a Stein compact does not by itself prove the
    statement above.
]

=== 9.5 Extraction of prescribed low places <extraction-of-prescribed-low-places>

#thm([Proposition 9.11.])[
  (Exact extraction).  #emph[Let $\( T \, B + upright(bold(M)) \)$ be a rational gklt pair on a globally strongly
    $bb(Q)$-factorial compact Kähler space, with projective nef carrier.
    For any specified finite set $cal(E)$ of exceptional prime divisors over $T$ with
    $a \( E \; T \, B + upright(bold(M)) \) lt.eq 1$, there is a projective modification $h : U arrow.r T$ such that:]
  + #emph[$U$ is compact Kähler and globally strongly $bb(Q)$-factorial;]
  + #emph[the $h$-exceptional prime divisors are exactly $cal(E)$;]
  + #emph[the crepant generalized pair on $U$ is gklt with effective boundary.]
] <prop:extraction>

#proof[
  The projective realization statement in Lemma 16 places the finitely many designated divisors on a projective
    log resolution carrying the nef data. Its proof uses only log-smooth discrepancy calculations and stratum
    blowups, independently of extraction. Write this resolution as $p : W arrow.r T$.
    Keep every designated coefficient at its crepant value $1 - a \( E \)$, which lies in $\[ 0 \, 1 \)$.
    Keep the nonexceptional coefficients as well. For every other exceptional prime choose a coefficient in
    $\[ 0 \, 1 \)$ strictly greater than its crepant coefficient.
    Since the pair is gklt, there are only finitely many such choices and they are possible.
    With this effective SNC boundary $Gamma$ we have
  $ K_W + Gamma + M_W = p^(*) D_T + G \, wide G gt.eq 0 \, $
  where the support of $G$ is exactly the set of undesired exceptional primes. The new pair is gklt.
  Apply Proposition 55 over $T$. At every stage the adjoint is the pullback of $D_T$ plus the effective transform
    of $G$, and the latter remains exceptional over $T$. A divisorial negative step cannot contract a prime
    outside its support: a general covering contracted curve in that prime avoids containment in the support and
    has nonnegative intersection with the effective rational Cartier divisor $G$,
    whereas its adjoint degree is negative. Small steps contract no prime divisor.
    Hence every designated prime survives, and no nonexceptional prime of the resolution is lost.
  At the relative nef endpoint $h : U arrow.r T$, the remaining effective exceptional correction $G_U$ is $h$-nef.
    Negativity gives $G_U lt.eq 0$, hence $G_U = 0$. Every undesired prime has therefore been contracted.
    The equality is now crepant, and the retained boundary is effective.
    The global strong condition, Kählerness, and gklt property follow at each step from Proposition 53.
    The exceptional primes are exactly the specified ones, as claimed. ◻
]

== 10 Arbitrary termination in dimension three <sec:threefold>

We establish the lower-dimensional termination needed for special termination.
  Throughout this section we use the rational generalized pairs and elementary steps of Section 9.
  The spaces are compact Kähler and globally strongly $bb(Q)$-factorial,
  and the elementary steps have the negative-side one-ray condition for degrees of global rational line bundles.
  All higher nef data are fixed as a rational b-line bundle. The projective bases of the steps may change.
  No pseudo-effectivity assumption is made in this section. We first treat generalized terminal pairs.
  We then bound Cartier indices under uniform discrepancy bounds and use that bound to lift a general sequence to
  generalized terminal models. This follows the threefold strategy of #cite(label("CT2023")) Section 3;
  the surface, index, and lifting arguments below establish its analytic form with varying bases.

=== 10.1 Generalized terminal pairs <generalized-terminal-pairs>

#thm([Proposition 10.1.])[
  #emph[Let $\( X_0 \, B_0 + upright(bold(M)) \)$ be a rational generalized terminal pair on a normal globally
    strongly $bb(Q)$-factorial compact Kähler threefold, with fixed rational b-line data as in Definition 48.
    Every sequence of small elementary steps in the sense of Section 9 starting from this pair terminates.
    The contraction bases may vary. Here generalized terminal means generalized klt with all exceptional log
    discrepancies greater than one.]
] <prop:terminal-three>

#proof[
  Write the sequence as
  $ \( X_i \, B_i + upright(bold(M)) \) arrow.r.dashed \( X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) \, wide
    X_i arrow.r^(f_i) Z_i arrow.l^(f_i^(+)) X_(i + 1) . $
  The boundary is transformed strictly, so its coefficients belong to one finite set.
    Smallness and Lemma 5 preserve generalized terminality. Forgetting the effective boundary and the effective
    nef defect increases discrepancies, so each $X_i$ is an ordinary terminal threefold.
    In particular its singularities are isolated, and the general point of every flipped curve is smooth.
  Choose an integer $p > 0$ for which $p upright(bold(M))$ is represented by an integral line bundle on a carrier,
    and an integer $N$ divisible by $p$ and by the denominators of the boundary coefficients.
    These integers continue to work on higher carriers throughout any finite part of the sequence.
    If $C$ is a flipped curve on $X_(i + 1)$, the exceptional valuation $E_C$ of its generic blowup has log discrepancy
  #[#set math.equation(numbering: n => "(10.1)")
   $ a \( E_C \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) = 2 - sum_j m_j b_j - q / p \, wide m_j \,
     q in bb(Z)_(gt.eq 0) . $ <eq:curve-discrepancy-three>]
  Indeed, the ordinary blowup contribution is two, the $m_j$ are the generic multiplicities of the boundary
    components, and the remaining term is the coefficient of the nef defect.
    At this smooth generic point the integral trace of $p upright(bold(M))$ is Cartier.
    The defect therefore has coefficients in $p^(- 1) bb(Z)$ and is effective by Lemma 49.
    This proves (10.1), including its signs.
  Let $b$ be the largest boundary coefficient, with $b = 0$ when the boundary is empty.
    For $b > 0$ test the flipped curves contained in a coefficient-$b$ component; for $b =
    0$ test every flipped curve. The value in (10.1) belongs to the fixed finite set
  $ cal(A)_b = N^(- 1) bb(Z) ∩ \( 0 \, 2 - b \] . $
  For each $t in cal(A)_b$, set
  $ d_t \( i \) = \# { E upright(" exceptional over ") X_i : a \( E \; X_i \, B_i + upright(bold(M)) \) < t } . $
  Lemma 16 makes these numbers finite, since the terminal cutoff is the strict inequality $a < 2 - b$.
    Small transformations identify the sets of exceptional valuations,
    and discrepancy monotonicity makes every $d_t \( i \)$ nonincreasing.
    For the valuation of a tested curve, Lemma 5 gives
  $ a \( E_C \; X_i \, B_i + upright(bold(M)) \) < a \( E_C \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) = t . $
  Thus $d_t$ drops at that step. The nonnegative integer $sum_(t in cal(A)_b)
    d_t \( i \)$ can drop only finitely often. If $b = 0$, every nontrivial small step has a flipped curve,
    so the proof is complete.
  Suppose $b > 0$. On a tail, no flipped curve is contained in any of the coefficient-$b$ components.
    Fix such a component $D_i$, and let $D_i^nu$ denote its normalization.
    The two images of $D_i$ and $D_(i + 1)$ in $Z_i$ agree, because the ambient transformation is an isomorphism
    in codimension one. Denote the normalization of this common image by $V_i$.
    There are projective birational morphisms
  $ D_i^nu arrow.r V_i arrow.l D_(i + 1)^nu . $
  The morphism on the right contracts no curve and is therefore finite:
    every positive-dimensional projective fiber contains a curve.
    A finite birational morphism to a normal space is an isomorphism.
    Hence there is a projective birational morphism $D_i^nu arrow.r D_(i + 1)^nu$.
    It contracts exactly the curves whose images in $X_i$ are flipping curves contained in $D_i$.
    By Lemma 15, with $k = 1$, each such contraction strictly decreases the dimension of the span of curve classes
    of the compact normalized surface. There are finitely many coefficient-$b$ components,
    so only finitely many further steps have a flipping curve contained in one of them.
  On the resulting tail put $D_i^max = sum_(b_j = b) D_(i \, j)$ and replace $B_i$ by $B_i - b D_i^max$.
    Every contracted curve $C$ has $D_i^max dot.op C gt.eq 0$,
    because it is not contained in this effective $bb(Q)$-Cartier divisor. Thus the new adjoint
  $ A'_i = K_(X_i) + B_i - b D_i^max + M_(X_i) $
  is negative on the old ray. To check its positive transform, write $A_i = K_(X_i) + B_i +
    M_(X_i)$ and choose the rational number $c = \( A'_i dot.op C \) \/ \( A_i dot.op C \) > 0$.
    The global one-ray condition and Lemma 9 give an actual identity of rational line bundles
  $ A'_i = c A_i + f_i^(*) L_i \, wide L_i in "Pic" \( Z_i \) ⊗ bb(Q) . $
  Its strict transform is $A'_(i + 1) = c A_(i + 1) + \( f_i^(+) \)^(*) L_i$, which is $f_i^(+)$-ample.
    Consequently the same tail is a sequence of elementary steps for the new generalized pair.
    Decreasing the effective boundary preserves generalized terminality.
    Induction on the number of distinct positive boundary coefficients proves the proposition. ◻
]

=== 10.2 Uniform indices for the terminal lift <uniform-indices-for-the-terminal-lift>

To lift a generalized klt sequence to generalized terminal models,
  we will need the discrepancies of the finitely many exceptional places with log discrepancy at most one to
  stabilize. A uniform Cartier index will put those discrepancies in a fixed rational grid.
  We first establish the local index statement and the surface estimate used to obtain that uniform bound.

#thm([Lemma 10.2.])[
  #emph[Let $\( T \, x \)$ be a complex analytic terminal threefold germ of canonical Cartier index $r$.
    If $D$ is an integral Weil divisor germ that is $bb(Q)$-Cartier, then $r D$ is Cartier.
    If $r > 1$, there is an exceptional valuation centered at $x$ with ordinary log discrepancy $1 + 1 \/ r$.]
] <lem:terminal-local-index>

#proof[
  For the first assertion, use the analytic index-one cover $pi : \( T^sharp \, x^sharp \) arrow.r \( T \, x \)$,
    a cyclic cover of degree $r$ that is étale away from the distinguished point.
    The terminal threefold classification makes $T^sharp$ smooth or an isolated cDV hypersurface germ;
    see #cite(label("Mori1985")). A sufficiently small punctured representative $U^sharp$ is simply connected,
    by the connectivity theorem for links of isolated hypersurfaces #cite(label("Milnor1968")) Theorems 2.10
    and 5.2. For a convergent analytic defining equation, finite determinacy gives an analytically equivalent
    sufficiently high Taylor polynomial #cite(label("DeJongEtAl1998")) Theorem 6.2, p. 24,
    so the same connectivity statement applies; the smooth case has the same property.
    For every $m > 0$, the analytic Kummer sequence implies that the $m$-torsion of $"Pic" \( U^sharp \)$ is an
    image of $H^1 \( U^sharp \, bold(mu)_m \) = 0$. The local divisor class group injects into this Picard group:
    a rank-one reflexive sheaf trivial on the punctured normal germ is trivial on the germ by reflexive extension.
    It follows that the local class group of $T^sharp$ is torsion-free.
  Since $D$ is $bb(Q)$-Cartier, the integral divisor $pi^(*) D$ has torsion class and is therefore principal,
    say $pi^(*) D = "div" \( u \)$ for a meromorphic germ $u$. The meromorphic norm gives
  $ "div" "Norm"_pi \( u \) = pi_(*) "div" \( u \) = pi_(*) pi^(*) D = r D . $
  Thus $r D$ is Cartier; compare the index divisibility statement in #cite(label("Kawamata1988")) Lemma 5.1.
    The argument above proves the analytic assertion for divisor germs already known to be $bb(Q)$-Cartier.
  The second assertion is the terminal small-discrepancy theorem #cite(label("KawamataAppendix1992")) Appendix,
    pp. 193–195. Its proof uses the analytic quotient classification and gives ordinary discrepancy $1 \/ r$,
    or log discrepancy $1 + 1 \/ r$ in our convention. ◻
]

When the germ lies on a compact terminal space, the last valuation can be seen on a global resolution.
  In fact, its ordinary crepant boundary has only negative exceptional coefficients.
  A valuation still exceptional over that smooth resolution has ordinary log discrepancy at least two.
  Thus a local valuation of discrepancy $1 + 1 \/ r < 2$ is already represented by an exceptional component of the
  restricted global resolution. Since its center on $T$ is the isolated point $x$,
  that component gives a global exceptional prime. This observation permits the use of Lemma 59 with global
  discrepancy bounds.

#thm([Lemma 10.3.])[
  #emph[Let $h : U arrow.r T$ be a projective bimeromorphic morphism of normal compact complex threefolds.
    Suppose that $U$ is klt and that $P$ is an exceptional prime divisor with $K_U + P$ rational Cartier.
    Given finitely many effective $bb(Q)$-Cartier divisors $D_j$ on $U$, none having $P$ as a component,
    there is a curve $C subset P$ contracted by $h$, contained in none of the $D_j$, such that
$ \( K_U + P \) dot.op C gt.eq - 3 . $

]
] <lem:exceptional-surface-curve>

#proof[
  Let $nu : P^nu arrow.r P$ be the normalization and let $mu : S arrow.r P^nu$ be its minimal resolution.
    Divisorial adjunction gives
  #[#set math.equation(numbering: n => "(10.2)")
   $ nu^(*) \( \( K_U + P \) \|_P \) = K_(P^nu) + Delta_(P^nu) \, wide Delta_(P^nu) gt.eq 0 \,
     $ <eq:arbitrary-prime-different>]
  as an identity of rational adjoint bundles. Neither normality of $P$ nor log canonicity of $\( U \, P \)$ is
    needed for effectivity of the different in this formula. This is the ordinary different of a reduced prime,
    computed at codimension-two points of $U$; the construction and effectivity are given in
    #cite(label("FujinoFundamental2010")) Section 14.1(i)–(iii), pp. 40–41,
    and analytic adjunction is included in #cite(label("FujinoInversion2023")) Theorem 1.1 and the following
    setup, p. 1. Here is the local analytic effectivity argument.
    On a transverse klt surface $T$, take a small smooth quotient $q : V arrow.r
    T$ and write $P_T$ for the reduced boundary curve and $C = \( q^(- 1) P_T \)_(upright("red"))$.
    The quotient is unramified at the general points of these curves, so $q^(*) \( K_T + P_T \) = K_V + C$.
    Let $rho : C^nu arrow.r P_T^nu$ be the induced map of normalizations.
    Residue adjunction for the reduced plane curve $C$ has an effective conductor divisor $A$,
    and the canonical ramification formula for $rho$ has an effective divisor $R$.
    Compatibility of residues with pullback gives
  $ rho^(*) "Diff"_(P_T^nu) \( 0 \) = A + R . $
  At a branch of ramification degree $e$, its coefficient downstairs is $\( c + e - 1 \) \/ e gt.eq 0$,
    where $c$ is the conductor coefficient. This proves the analytic effectivity in (10.2) without an lc
    hypothesis on $\( U \, P \)$ or normality of $P$.
  The sum on the right of (10.2) is rational Cartier; its individual canonical term need not be.
    If that term is used separately, take its numerical pullback in the sense of Mumford,
    determined by intersection zero with all exceptional curves.
    The negative definite exceptional intersection matrix makes this pullback linear and makes the pullback of an
    effective divisor effective. In particular the calculation does not presume $bb(Q)$-factoriality of $P^nu$.
  For completeness, the effective correction can also be checked directly on $S$.
    For every irreducible $mu$-exceptional curve $E$, adjunction on the smooth surface gives
  $ K_S dot.op E = 2 p_a \( E \) - 2 - E^2 gt.eq 0 . $
  Indeed, an exceptional smooth rational $\( - 1 \)$-curve is excluded by minimality over $P^nu$;
    every other exceptional curve satisfies the displayed inequality.
    The pullback of the adjoint in (10.2) therefore has the form
  #[#set math.equation(numbering: n => "(10.3)")
   $ \( nu mu \)^(*) \( \( K_U + P \) \|_P \) = K_S + Delta_S \, wide Delta_S gt.eq
     0 . $ <eq:surface-effective-correction>]
  To obtain the sign, the residue comparison defines $Delta_S$ as a rational divisor with pushforward
    $Delta_(P^nu) gt.eq 0$. Since $K_S$ is $mu$-nef, the divisor $- Delta_S$ is $mu$-nef.
    Apply Lemma 5(i) to $E = Delta_S$ to obtain $Delta_S gt.eq 0$.
    This is equivalently the numerical-pullback calculation above, and proves (10.3) as an actual bundle comparison.
  The image $h \( P \)$ has dimension zero or one. In the latter case,
    general smooth fiber components of $S arrow.r h \( P \)$ are moving curves $F$ with $K_S dot.op F =
    2 g \( F \) - 2 gt.eq - 2$. One may use the Stein factorization to describe these fibers over a smooth compact
    curve. Choose a general fiber component not contained in $"Supp" Delta_S$, the conductor,
    or the pullbacks of the $D_j$.
  If $h \( P \)$ is a point, $P$ is a projective fiber subspace, and $S$ is a smooth projective surface.
    Take a surface minimal model $rho : S arrow.r S_0$. If $K_(S_0)$ is nef, use general ample curves on $S_0$.
    Otherwise the classification of smooth projective surfaces gives ruling fibers with canonical degree $- 2$,
    or lines on $bb(P)^2$ with canonical degree $- 3$. Their general strict transforms $F$ satisfy $K_S dot.op F
    gt.eq - 3$, because $K_S - rho^(*) K_(S_0)$ is effective.
    In all cases the curves cover $S$, so $F$ may be chosen not contained in the finitely many excluded divisors.
    This is the surface argument also used in #cite(label("CT2023")) Lemma 3.3.
  The curve $F$ maps birationally to a curve $C subset P$: it is not contained in the exceptional or conductor
    locus. By the projection formula and (10.3),
  $ \( K_U + P \) dot.op C = \( K_S + Delta_S \) dot.op F gt.eq K_S dot.op F gt.eq - 3 . $
  Its choice also ensures $C subset.not "Supp" D_j$ for every $j$. ◻
]

The surface estimate bounds the denominator introduced by extracting one exceptional place of log discrepancy at
  most one. We now turn it into a bound for every global rank-one reflexive sheaf.

#thm([Lemma 10.4.])[
  #emph[For every integer $n gt.eq 0$ and $epsilon > 0$, there is an integer $I \( n \, epsilon \) >
    0$ with the following property. Let $\( T \, B + upright(bold(M)) \)$ be a rational generalized klt compact
    Kähler threefold pair, with $T$ globally strongly $bb(Q)$-factorial. Suppose that]
  + #emph[every log discrepancy is at least $epsilon$;]
  + #emph[at most $n$ exceptional valuations have log discrepancy at most one;]
  + #emph[every exceptional log discrepancy greater than one is at least $1 + epsilon$.]
  #emph[Then $cal(F)^(\[ I \( n \, epsilon \) \])$ is invertible for every global coherent rank-one reflexive
    sheaf $cal(F)$ on $T$.]
] <lem:index-bound>

#proof[
  We induct on the number of exceptional places with log discrepancy at most one.
    The terminal case is controlled by local canonical indices.
    For the induction step, extract one place, bound its intersection degree using the preceding surface estimate,
    and descend an integral line bundle.
  Replace $epsilon$ by $min { epsilon \, 1 }$, so assume $0 < epsilon lt.eq 1$.
    We construct integers divisible by those from the preceding induction stage.
    When $n = 0$, the pair is generalized terminal. The underlying space is ordinary terminal and
  $ a \( E \; T \, 0 \) gt.eq a \( E \; T \, B + upright(bold(M)) \) gt.eq 1 + epsilon $
  for every exceptional valuation. By Lemma 59 and the observation following that lemma,
    every canonical point index $r > 1$ satisfies $r lt.eq 1 \/ epsilon$.
    Each local representative of $cal(F)$ is $bb(Q)$-Cartier by the global strong condition,
    and its Cartier index divides $r$. Thus one may take
  $ I \( 0 \, epsilon \) = "lcm" { 1 \, dots.h \, floor.l 1 \/ epsilon floor.r } . $
  Local invertibility of this reflexive power at every point is precisely global invertibility;
    no trivialization on all of $T$ is asserted.
  Suppose $n > 0$ and put $I' = I \( n - 1 \, epsilon \)$. If there is no exceptional valuation of discrepancy at
    most one, the preceding case applies. Otherwise choose one such place,
    of discrepancy $a in \[ epsilon \, 1 \]$, and apply Proposition 57 to obtain a projective extraction $h :
    U arrow.r T$ with that single exceptional prime $P$. Write its effective crepant boundary as
  $ B_U = B_U^(upright("str")) + \( 1 - a \) P . $
  Crepancy preserves all discrepancies and lowers the number of exceptional low places by one.
    The induction hypotheses therefore hold on $U$, so $I'$ clears the index of every global rank-one reflexive
    sheaf on $U$.
  First, $- P$ is $h$-ample. If $H$ is an $h$-ample line bundle,
    its reflexive pushforward is rational Cartier on $T$. Lemma 49 gives
  $ H = h^(*) H_T + c P $
  as a rational bundle comparison. The divisor $c P$ is $h$-ample and $h$-exceptional,
    hence is nonpositive by negativity. Since $h$ has a positive-dimensional fiber, $c eq.not 0$, and therefore $c < 0$.
  The same trace comparison for the nef data gives
  $ M_U = h^(*) M_T - s P \, wide s gt.eq 0 . $
  Apply Lemma 60 with the components of $B_U^(upright("str"))$ as the excluded divisors.
    For its contracted curve $C subset P$, the other boundary has nonnegative degree and $M_U dot.op C = -
    s P dot.op C gt.eq 0$. Crepancy yields
  $ - 3 lt.eq \( K_U + P + B_U^(upright("str")) + M_U \) dot.op C = a P dot.op C < 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(10.4)")
   $ 0 < - P dot.op C lt.eq 3 / epsilon . $ <eq:exceptional-degree-bound>]
  Now let $cal(F)$ be any global rank-one reflexive sheaf on $T$,
    and let $cal(F)_U$ be its reflexive strict transform. In additive rational-bundle notation, Lemma 49 gives
  #[#set math.equation(numbering: n => "(10.5)")
   $ h^(*) cal(F) = cal(F)_U + q P \, wide q in bb(Q) . $ <eq:sheaf-extraction-comparison>]
  This comparison is defined by local meromorphic frames agreeing off the exceptional locus,
    and requires no global meromorphic section of $cal(F)$. The sheaves $cal(F)_U^(\[ I' \])$ and
    $cal(O)_U \( I' P \)$ are line bundles. Intersecting (10.5) with $C$ gives
  $ q = frac(I' cal(F)_U dot.op C, - I' P dot.op C) \, wide k := - I' P dot.op C in bb(Z) \, quad 1 lt.eq k lt.eq
    frac(3 I', epsilon) . $
  The numerator is an integer. Define
  #[#set math.equation(numbering: n => "(10.6)")
   $ I \( n \, epsilon \) = I' "lcm" { 1 \, dots.h \, ceil.l 3 I' \/ epsilon ceil.r } . $ <eq:index-recurrence>]
  Then $I := I \( n \, epsilon \)$ is divisible by $I'$ and $I q in I' bb(Z)$.
    Thus $I cal(F)_U + \( I q \) P$ represents an integral line bundle $L$ on $U$,
    with its prescribed comparison to $h^(*) cal(F)^(\[ I \])$ off the exceptional locus.
    Equation (10.5) shows that $L$ has degree zero on every $h$-contracted curve.
  Increase the coefficient $1 - a$ of $P$ by a sufficiently small positive rational number $delta$.
    On a fixed log resolution carrying the data, the inequalities defining generalized klt remain strict for all
    sufficiently small $delta$, so the new pair is effective and generalized klt. Its adjoint is
  $ h^(*) \( K_T + B + M_T \) + delta P \, $
  which is $h$-antiample. Lemma 9 now descends $L$ #emph[integrally].
    More explicitly, local ordinary klt replacement and the analytic base-point-free theorem generate $L^m$ for
    every sufficiently large integer $m$; descend two consecutive powers and take their quotient.
    No further index is introduced. The descended line bundle agrees with $cal(F)^(\[ I \])$ away from
    $h \( P \)$, a set of codimension at least two in $T$. Reflexive extension identifies them on $T$.
    This proves the induction, including the case $a = 1$. ◻
]

=== 10.3 Nef endpoints and terminal lifting <nef-endpoints-and-terminal-lifting>

The uniform index bound will make the low discrepancies constant on a tail of any small sequence.
  After extracting those places, we must compare each lifted relative program with the prescribed positive model
  downstairs. The next Lemma provides both the discrepancy comparison during the run and the crepant morphism at
  its nef endpoint. It will also be used for strata and threshold lifts.

#thm([Lemma 10.5.])[
  #emph[Let $Y_0 \, Y \, T_(+)$ be normal compact spaces projective and bimeromorphic over a normal space $S$,
    and let $W$ be a common smooth modification projective over each of the three spaces, with maps $p_0 :
    W arrow.r Y_0$, $p : W arrow.r Y$, and $q : W arrow.r T_(+)$.
    Let $A_0 \, A \, A_(+)$ be rational line bundles on the respective spaces.
    Suppose their prescribed meromorphic comparisons give
#[#set math.equation(numbering: n => "(10.7)")
 $ P_0 = P + G = P_(+) + F \, wide P_0 = p_0^(*) A_0 \, quad P = p^(*) A \, quad P_(+) = q^(*) A_(+) \,
   $ <eq:two-target-comparison>]

 where $G$ is effective and $p$-exceptional, and $F$ is effective and $q$-exceptional.
   If $A_(+)$ is nef over $S$, then $F - G gt.eq 0$. If also $A$ is nef over $S$, then $P = P_(+)$.
   If, in addition, $A_(+)$ is ample over $S$, the induced bimeromorphic map $Y arrow.r.dashed
   T_(+)$ is a projective morphism $g$, and $A = g^(*) A_(+)$ as rational line bundles with the given comparison.]
] <lem:nef-end-comparison>

#proof[
  Set $E = P - P_(+) = F - G$. Over $Y$, the divisor $- E = P_(+) - P$ is nef, while
  $ p_(*) \( - E \) = - p_(*) F lt.eq 0 \, $
  since $G$ is $p$-exceptional. Lemma 5 gives $- E lt.eq 0$, proving the first assertion.
    If $A$ is nef over $S$, then $E$ is nef over $T_(+)$ and
  $ q_(*) E = - q_(*) G lt.eq 0 \, $
  since $F$ is $q$-exceptional. Negativity gives $E lt.eq 0$, and hence $E = 0$.
    The two exceptional supports need not coincide.
  Assume $A_(+)$ is relatively ample. A fiber of $p$ maps by $q$ into a projective fiber of $T_(+) arrow.r S$.
    Equality $p^(*) A = q^(*) A_(+)$ gives degree zero on every curve in that fiber.
    A nonconstant image would be detected by a curve of positive degree against $A_(+)$,
    so $q$ is constant on each connected fiber of $p$. Proper factorization through the normal space $Y$ gives
    $q = g compose p$. The map $g$ is projective because $Y arrow.r S$ is projective and $T_(+) arrow.r
    S$ is separated. Finally, pullback by $p$ is injective on rational line bundles, by $p_(*) cal(O)_W =
    cal(O)_Y$ and the projection formula; therefore $A = g^(*) A_(+)$.
    This proves the actual bundle identity, not merely numerical equality.
    Compare #cite(label("LMT2022")) Lemma 2.12 for the algebraic form of this comparison. ◻
]

#thm([Theorem 10.6.])[
  #emph[Let $\( X_0 \, B_0 + upright(bold(M)) \)$ be a rational generalized klt pair of dimension at most three on
    a normal globally strongly $bb(Q)$-factorial compact Kähler space,
    with fixed rational b-line data as in Definition 48. Every sequence of elementary birational steps in the
    sense of Section 9 starting from this pair terminates. The compact Kähler contraction bases may vary.]
] <thm:gklt-three>

#proof[
  In dimension at most two there are no nontrivial small birational contractions, and Lemma 15 gives the result.
    In dimension three that lemma first removes a finite divisorial prefix. Relabel the remaining small sequence as
  $ \( X_i \, B_i + upright(bold(M)) \) arrow.r.dashed \( X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) \, wide
    i gt.eq 1 . $
  All boundaries are now strict transforms of $B_1$.
  By Lemma 16, there is $epsilon_0 > 0$ such that the initial set of exceptional valuations with discrepancy below
    $1 + epsilon_0$ is finite. Since discrepancies increase and small maps preserve exceptionality, the sets
  $ cal(L)_i = { E upright(" exceptional over ") X_i : a \( E \; X_i \, B_i + upright(bold(M)) \) lt.eq 1 } $
  form a decreasing sequence of finite sets. After discarding a finite prefix, they equal one set $cal(L) =
    { E_1 \, dots.h \, E_n }$. At the first model of this tail,
    the finitely many exceptional values in $\( 1 \, 1 + epsilon_0 \)$ have a positive minimum distance from one;
    use $epsilon_0$ itself if there are no such values. Choose $epsilon > 0$ no larger than this distance,
    than $epsilon_0$, than one, and than the positive lower bound for all discrepancies of the initial gklt pair
    furnished by Lemma 16. Monotonicity and the stabilization of $cal(L)$ show that, on every model of this tail,
    all discrepancies are at least $epsilon$, and every exceptional discrepancy greater than one is at least $1 +
    epsilon$.
  Apply Lemma 61 with these fixed $n$ and $epsilon$. Let $r$ clear the coefficients of $B_1$ and let $p$ clear the
    higher nef datum. For example
  $ J = I \( n \, epsilon \) "lcm" \( r \, p \) $
  makes each $J \( K_(X_i) + B_i + M_(X_i) \)$ an integral line bundle,
    and makes $J upright(bold(M))$ integral on every higher carrier.
    Comparing the actual adjoint bundles on a smooth carrier shows that every discrepancy belongs to $J^(- 1)
    bb(Z)$: the canonical bundle there is integral and the coefficients of the corresponding integral divisor
    difference are integers. The same argument applies after any further resolution. Thus each nondecreasing sequence
  $ a \( E_ell \; X_i \, B_i + upright(bold(M)) \) in J^(- 1) bb(Z) ∩ \[ epsilon \, 1 \] $
  is eventually constant. After another finite prefix, all these values are constant simultaneously.
  Use Proposition 57 to extract exactly $E_1 \, dots.h \, E_n$ over the first model of this final tail:
  $ h_1 : \( Y_1 \, Delta_1 + upright(bold(M)) \) arrow.r \( X_1 \, B_1 + upright(bold(M)) \) . $
  The boundary is effective and crepant. Every valuation exceptional over $Y_1$ is exceptional over $X_1$ and is
    not in $cal(L)$, so its discrepancy is greater than one. Hence this is a globally strongly $bb(Q)$-factorial
    generalized terminal model. If $n = 0$, take $h_1 = upright("id")$.
  Consider the first remaining flip over $Z_1$. Starting from $Y_1$,
    use Proposition 53 to take relative steps over $Z_1$ while the adjoint is not nef.
    We show that no divisorial contraction can occur in this run. At any finite stage $Y_j$, a common smooth model gives
  $ P_0 = P_j + G_j = P_(+) + F \, $
  where $P_0$ is pulled back from $Y_1$, $P_j$ from the current lifted adjoint, and $P_(+)$ from $K_(X_2) + B_2 +
    M_(X_2)$. These are the prescribed adjoint comparisons. The accumulated error $G_j$ is effective and
    exceptional over $Y_j$; the error $F$ of the original flip is effective and exceptional over $X_2$.
    The positive adjoint is ample over $Z_1$. The first assertion of Lemma 62,
    which does not require nefness on $Y_j$, gives $G_j lt.eq F$.
  If a divisor were lost, its strict transform from $Y_1$ would have a positive coefficient in $G_j$,
    by the strict discrepancy comparison at its contraction. But every divisor on $Y_1$ is either the transform of
    a divisor on $X_1$, or one of the $E_ell$. In the first case its coefficient in $F$ is zero because the
    original map is small. In the second case that coefficient is
  $ a \( E_ell \; X_2 \, B_2 + upright(bold(M)) \) - a \( E_ell \; X_1 \, B_1 + upright(bold(M)) \) = 0 $
  by stabilization. Both cases contradict $G_j lt.eq F$. Thus the entire lifted run is small.
    It stays generalized terminal, and Proposition 58 forces it to reach a nef endpoint after finitely many steps.
  At that endpoint, Lemma 62 gives equality of the two adjoint pullbacks and a projective crepant morphism
  $ h_2 : \( Y_2 \, Delta_2 + upright(bold(M)) \) arrow.r \( X_2 \, B_2 + upright(bold(M)) \) . $
  Here $Y_2$ denotes the endpoint, rather than the first intermediate model of the finite run.
    Since the lifted transformations were small, the exceptional primes of $h_2$ are exactly the same $E_ell$,
    with the same boundary coefficients. We may therefore repeat this construction over each successive base $Z_i$.
  Each nontrivial flip below forces at least one step above.
    Indeed, take a negative curve $C subset X_i$ over $Z_i$. Projectivity of $h_i$ supplies a curve $Gamma subset
    Y_i$ mapping onto $C$ with positive degree. The crepant identity gives
  $ \( K_(Y_i) + Delta_i + M_(Y_i) \) dot.op Gamma = deg \( Gamma \/ C \) \( K_(X_i) + B_i + M_(X_i) \) dot.op C < 0 . $
  Thus the starting lifted adjoint is not nef over $Z_i$. An infinite original sequence would consequently
    concatenate to an infinite sequence of small generalized terminal elementary steps,
    with fixed rational boundary coefficients and the same rational nef b-line data.
    All spaces remain compact Kähler and globally strongly $bb(Q)$-factorial.
    The bases may change, exactly as allowed in Proposition 58, which gives the contradiction. ◻
]

== 11 Adjunction and special termination <sec:special>

We use the generalized pairs and elementary steps of Section 9.
  In particular, an elementary step is projective over its own normal compact Kähler contraction base,
  is negative for the adjoint on the negative side, and has a relatively ample transformed adjoint on the positive
  side. The models on which elementary programs are run are globally strongly $bb(Q)$-factorial.
  The bases in a sequence need not be the same. All boundaries and higher line-bundle data in this section are
  rational. The higher data are nef and are carried by projective modifications.

Our goal is special termination: eventually both exceptional loci avoid every generalized log canonical center.
  Restriction to a center reduces its proof to termination in a smaller dimension.
  The center need not satisfy the global strong factoriality condition,
  so we also construct a crepant gdlt modification before running the smaller program.

These assertions are proved in a fixed order. Special termination in dimension $d$ uses gdlt modifications and
  gdlt termination only in dimensions less than $d$. It then gives gdlt modifications in dimension $d$.
  For $d lt.eq 3$, removing the floor and applying Theorem 63 gives gdlt termination in dimension $d$.
  The induction ends with special termination and crepant gdlt modifications in dimension four;
  it uses full gdlt termination only through dimension three.
  We first establish adjunction and discrepancy comparison on the normalized centers.

=== 11.1 Adjunction on normalized strata <adjunction-on-normalized-strata>

We write $"Nklt" \( V \, A + upright(bold(M)) \)$ for the union of the generalized log canonical centers of a glc
  pair. A stratum below means the closure of a coefficient-one stratum on the good snc open set in the definition
  of gdlt. Its normalization is always taken before adjunction is iterated.

#thm([Lemma 11.1.])[
  (Adjunction with a fixed higher denominator).  #emph[Let $\( V \, A + upright(bold(M)) \)$ be a rational gdlt
    pair on a globally strongly $bb(Q)$-factorial normal compact Kähler space.
    Suppose that $p M_W$ is a holomorphic line bundle on a projective carrier $W arrow.r V$,
    for an integer $p > 0$. If $T$ is the normalization of a generalized log canonical center,
    then iterated divisorial adjunction along a coefficient-one chain gives a rational gdlt pair
    $\( T \, A_T + upright(bold(M))^T \)$ with effective boundary and an identity of rational holomorphic adjoint
    bundles
#[#set math.equation(numbering: n => "(11.1)")
 $ K_T + A_T + M_T^T = nu^(*) \( K_V + A + M_V \) \, $ <eq:stratum-adjunction>]

 where $nu : T arrow.r V$ is the natural map. The b-line $upright(bold(M))^T$ is represented by restricting
   $upright(bold(M))$ to the strict stratum on a higher model; its denominator divides $p$.
   Its generalized log canonical centers map to generalized log canonical centers of $V$ properly contained in
   $nu \( T \)$.]
  #emph[More precisely, for a nonnegative coefficient set $I subset \[ 0 \, 1 \]$ define
#[#set math.equation(numbering: n => "(11.2)")
 $ cal(D)_p \( I \) = {1 - 1 / r + frac(sum_(j = 1)^ell k_j d_j + k \/ p, r) med mid(bar.v) med
   r in bb(N)_(> 0) \, med ell \, k \, k_j in bb(Z)_(gt.eq 0) \,\
d_j in I \, med sum_(j = 1)^ell k_j d_j + k \/ p lt.eq 1} . $ <eq:adjunction-coefficients>]

 If the coefficients of $A$ belong to $I$, those after $c$ successive adjunctions belong to
   $cal(D)_p^(compose c) \( I \)$, where the superscript denotes the $c$-fold iterate.
   If $I$ satisfies the descending chain condition (DCC), so does every one of these sets.
   No global strong $bb(Q)$-factoriality, or uniform Cartier index for $A_T$, is asserted for $T$.]
] <lem:stratum-adjunction>

#proof[
  Choose a projective log resolution $h : W arrow.r V$ carrying the nef data which is an isomorphism at the
    general points of the good strata under consideration. We may replace $W$ further whenever necessary,
    preserving these general points. Since $V$ is globally strongly $bb(Q)$-factorial,
    the trace $M_V$ is a rational line bundle. Lemma 49 and Lemma 5 give
  #[#set math.equation(numbering: n => "(11.3)")
   $ H = h^(*) M_V - M_W gt.eq 0 \, wide H upright(" is ") h upright("-exceptional") . $ <eq:adjunction-nef-defect>]
  Use compatible local canonical representatives to write
  $ K_W + A_W + M_W = h^(*) \( K_V + A + M_V \) \, wide K_W + A_W^(upright(o)) = h^(*) \( K_V + A \) . $
  These are actual rational sheaf comparisons, and $A_W = A_W^(upright(o)) + H$.
  We first justify the ordinary companion in this construction.
    The inequality above says that ordinary log discrepancies of $\( V \, A \)$ are at least the generalized log
    discrepancies. In particular $\( V \, A \)$ is lc. An ordinary zero-discrepancy place is also a generalized
    zero-discrepancy place. Its center therefore meets the good open set.
    Conversely, every generalized center meets that set, where $H = 0$, the data descend,
    and the log formula is the ordinary snc formula. Such a center is an ordinary coefficient-one stratum.
    Thus $\( V \, A \)$ is ordinary dlt and its lc centers are exactly the generalized ones.
    This argument also explains why forgetting the nef part does not introduce an additional zero center outside
    the good open set; compare the algebraic formulation in #cite(label("CT2023")) Remark 2.6(1).
  Let $S subset V$ be a prime component of $floor.l A floor.r$ and let $S_W$ be its strict transform.
    It is smooth after the chosen resolution. The coefficient of $S_W$ is one in both formulas.
    The residue isomorphism restricts them to $S_W$ as
  $ \( K_W + A_W + M_W \) \|_(S_W) & = K_(S_W) + \( A_W - S_W \) \|_(S_W) + M_W \|_(S_W) \,\
\( K_W + A_W^(upright(o)) \) \|_(S_W) & = K_(S_W) + \( A_W^(upright(o)) - S_W \) \|_(S_W) . $
  The normal space $S_W$ maps to the normalization $S^nu$. Push forward the indicated boundaries and the nef trace
    to $S^nu$. Over its smooth large open set, the residue identification is the adjunction identification of the
    canonical sheaf. It therefore defines, by reflexive extension,
    the rational adjoint bundle on $S^nu$ as the pullback of the ambient adjoint.
    This construction gives an actual line-bundle isomorphism after a common positive multiple.
    The prescribed residue identification, and not equality of first Chern classes, specifies the comparison.
  The restricted log boundary on $S_W$ is snc with coefficients at most one.
    Thus the resulting generalized pair is sub-lc before effectivity is checked.
    Every zero stratum of that restricted log formula is an intersection of $S_W$ with coefficient-one components
    of the ambient log formula. Its image is an ambient generalized center and hence meets the good open set.
    Over that set the restriction is snc and its nef data descend.
    The same reasoning applies to the ordinary companion. In particular, after effectivity is established,
    both restricted pairs have the appropriate dlt good-open property. Their zero centers agree:
    on a common carrier their log boundaries differ by the effective restriction of $H$,
    while every generalized zero center meets the open set where that restriction vanishes.
  Here is the local effectivity and coefficient calculation,
    with the issue of nonfactorial intermediate strata made explicit.
    Suppose at some stage of the chain that $U$ is the normal space already obtained,
    $C$ is its effective generalized boundary, and $S subset floor.l C floor.r$ is the next prime.
    Carry along the ordinary dlt companion just constructed. Its floor has the same strata.
    Both adjoints are rational Cartier, although the individual trace $M_U$ need not be rational Cartier on $U$.
    Fix a prime divisor on $S^nu$ whose coefficient is to be computed,
    and work at an analytically general point of its image, a codimension-two locus of $U$.
  Take a general transverse surface slice there. This operation can be performed by fixing general values of local
    parameters along that locus on a simultaneous embedded resolution.
    We choose the parameters transverse to the finitely many resolution strata dominating the locus.
    At a general point in question the normal ambient space is Cohen–Macaulay:
    a normal space is $S_2$, and its non-Cohen–Macaulay locus has codimension at least three.
    The sliced surface is $S_2$ and regular in codimension one, hence normal.
    The transverse restrictions of the resolution formulas are crepant surface formulas,
    by complete-intersection adjunction. One can check this first away from the distinguished point and then
    extend the isomorphism of the rational Cartier adjoints. In particular,
    the ordinary surface pair is dlt along the coefficient-one branch.
    The boundary multiplicities computed on the slice are the multiplicities at the original general point.
  We use the following local surface fact. An ordinary dlt surface germ along a coefficient-one branch is either
    snc for the reduced boundary, or is a plt germ with a smooth pair chart modulo a small cyclic group of some
    order $r$. The branch in the chart is a coordinate curve.
    The different of that branch alone is $1 - 1 \/ r$, and the local Cartier index of any integral divisorial
    sheaf divides $r$. This is the log surface classification of #cite(label("KM1998")) Theorem 4.15(1),(3),
    pp. 119–120, and Proposition 4.18. Its use here is in the analytic-germ category:
    the numerical plt resolution criterion gives a Hirzebruch–Jung string with the strict boundary meeting an end;
    the corresponding normal analytic surface germ is the cyclic quotient.
    It is a classification of the surface germ, and does not assert local factoriality of the higher-dimensional
    space $U$. In the snc case set $r = 1$.
  Write the additional effective boundary on the slice as a sum with coefficients $d_j$.
    Pulling to the cyclic chart and restricting to its smooth coordinate branch gives nonnegative integral
    intersection multiplicities $k_j$. Its contribution to the different is $sum_j k_j d_j \/ r$.
    For the generalized part, restrict a common higher model and the line bundle representing $p
    upright(bold(M))$ to the higher surface. Define its trace on the sliced surface by this proper pushforward;
    the restricted higher log formula fixes the identification on the punctured surface.
    This avoids interchanging an arbitrary reflexive hull with specialization.
    The cyclic quotient fact makes $r p$ times this trace Cartier.
    Consequently its pullback minus the higher nef bundle is an exceptional divisor with denominator dividing $r
    p$. It is effective by Lemma 5, because the higher bundle is nef on every curve of the projective surface
    resolution. It does not contain the strict coefficient-one branch,
    and its restriction to that branch has coefficient $k \/ \( r p \)$ for some $k in bb(Z)_(gt.eq 0)$.
    The resulting coefficient is therefore
  #[#set math.equation(numbering: n => "(11.4)")
   $ 1 - 1 / r + frac(sum_j k_j d_j + k \/ p, r) . $ <eq:surface-generalized-different>]
  This proves effectivity of the generalized different. Omitting the nef correction proves effectivity of the
    ordinary different carried along in the construction. The coefficient is at most one by the sub-lc log formula
    already established. The local analytic adjunction and nef-defect calculation also appears explicitly in the
    proof of #cite(label("HXACC2023")) Lemma 3.1, pp. 5–6; the local gdlt modification in that proof is not used
    here as a global modification theorem.
  We can now repeat the construction. On a resolution the chosen chain is a chain of snc strata,
    and its successive restrictions have the two log formulas just considered.
    A zero stratum of any restricted formula is a zero stratum of the preceding one;
    its image is therefore an ambient center meeting the original good open set.
    This proves the center and gdlt assertions at every stage.
    Closures and normalizations introduce no finite cover of the chosen center:
    each selected component is generically isomorphic over it, so its normalization is its unique normalization.
    The restricted higher model is projective over that normalization and is compact Kähler.
    The higher line bundle remains nef, and its denominator still divides $p$,
    under restriction and subsequent pullback. This proves (11.1) and the asserted description of the b-data.
    A fixed chain on a common higher model also shows that these b-data are compatible under any birational
    comparison which preserves the general points of the chain.
  It remains to prove the DCC assertion rather than infer a bound on all Cartier indices.
    If $I$ is DCC, its positive elements, when present, have a positive minimum.
    The same is true after adjoining $1 \/ p$. A sum of such elements bounded by one consequently has a bounded
    number of nonzero summands. Finite sums of a nonnegative DCC set satisfy DCC:
    from any sequence of tuples of a fixed length one can successively choose a subsequence on which each
    coordinate is nondecreasing. Thus the numerator sums in (11.2) satisfy DCC.
    For bounded $r$, their images in that formula satisfy DCC.
    In a strictly decreasing sequence of displayed coefficients with first term $c_0 < 1$, the inequality
  $ 1 - 1 / r lt.eq c lt.eq c_0 quad arrow.r.double quad r lt.eq frac(1, 1 - c_0) $
  bounds $r$. A sequence starting at one reduces to this case after its first strict decrease.
    Therefore $cal(D)_p \( I \)$ is DCC, and induction proves the same for each finite iterate. ◻
]

=== 11.2 Comparison on a stratum <comparison-on-a-stratum>

Adjunction supplies an effective generalized boundary with coefficients in a fixed DCC set.
  To use those coefficients along a sequence, we need monotonicity of the restricted discrepancies.
  Strictness must also detect an ambient exceptional intersection of arbitrary codimension on the stratum.

#thm([Lemma 11.2.])[
  (Restricted discrepancy comparison).  #emph[Suppose that
$ \( V \, A + upright(bold(M)) \) arrow.r.dashed \( V^(+) \, A^(+) + upright(bold(M)) \) $

 is a small elementary gdlt step over $Z$. Let $T$ be a normalized generalized log canonical center whose general
   point and coefficient-one chain are unchanged by the step,
   and let $T^(+)$ denote the corresponding normalization on the positive side.
   Put $D_T = K_T + A_T + M_T^T$ and $D_(T^(+)) = K_(T^(+)) + A_(T^(+)) + M_(T^(+))^T$.
   Both strata map projectively and bimeromorphically to the normalization $S$ of their common image in $Z$.
   The adjoints are respectively antiample and ample over $S$.]
  #emph[On a common smooth higher model, with projective maps $p$ and $q$ to $T$ and $T^(+)$, respectively,
#[#set math.equation(numbering: n => "(11.5)")
 $ p^(*) D_T - q^(*) D_(T^(+)) = F_T gt.eq 0 . $ <eq:restricted-positive-difference>]

 For every prime divisor $E$ on a proper bimeromorphic analytic model of the stratum,
   the generalized discrepancies do not decrease. They increase strictly if its center on either stratum is
   contained in the corresponding ambient exceptional locus.]
] <lem:stratum-comparison>

#proof[
  The restricted morphisms factor through $S$ by normality.
    They are projective, since restriction and this finite factorization preserve relative ampleness;
    they are bimeromorphic because the ambient step is an isomorphism at the general point of the stratum.
    Restriction of the relatively ample adjoint, and then pullback by the normalization, gives the asserted signs.
  Take a common projective log resolution of the ambient step,
    carrying its common nef data and preserving the general points of the chosen snc chain.
    If $a \, b$ are its projections, Lemma 5 gives the actual divisor comparison
  $ F = a^(*) \( K_V + A + M_V \) - b^(*) \( K_(V^(+)) + A^(+) + M_(V^(+)) \) gt.eq 0 . $
  This difference is anti-nef over $Z$. Its support contains the full fibers over the non-isomorphism locus in
    $Z$: opposite relative ampleness makes the difference nontrivial over each such point,
    and the fiber-support assertion of Lemma 5 applies. The strict transform of the chosen stratum is not
    contained in $"Supp" F$, since its general point lies in the common isomorphism open set.
  Restrict the two log formulas along the common snc chain.
    At each restriction the residue canonical bundles are the same,
    and the common higher nef bundles are the same. They cancel.
    Each restricted difference is effective, because the next strict stratum is not contained in its support.
    At the last stage this gives (11.5) as an equality with its prescribed meromorphic identification.
    The coefficient of $E$ in this difference is the increase of its generalized log discrepancy.
  For strictness, first make $E$ divisorial on a smooth higher stratum.
    This can be achieved by projective blowups of its successive centers;
    perform the same blowups in the ambient resolution and resolve further, preserving the generic chain.
    If the center of $E$ is in the ambient exceptional locus,
    its entire inverse image in the common ambient model lies in $"Supp" F$, by the full-fiber assertion.
    Therefore the center on the higher stratum lies in the support of the restricted effective Cartier divisor.
    Its defining local equation has positive order at $E$. This proves strictness on either side.
    In particular, the argument detects an intersection in arbitrary codimension on the original stratum;
    it does not require that intersection already to be a divisor there.
    The algebraic counterparts are #cite(label("LMT2022")) Lemma 2.8 and #cite(label("Moraga2020"))
    Proposition 3.2; the argument above uses the analytic projective negativity statement directly. ◻
]

=== 11.3 The triangular induction <the-triangular-induction>

We state the three assertions together to make their dependency order explicit.
  The first stops steps near the generalized log canonical centers; the second constructs crepant models;
  the third supplies the lower-dimensional termination used in the next induction stage.

#thm([Theorem 11.3.])[
  (Special termination).  #emph[Let $d lt.eq 4$, and let
$ \( V_0 \, A_0 + upright(bold(M)) \) arrow.r.dashed \( V_1 \, A_1 + upright(bold(M)) \) arrow.r.dashed dots.h.c $

 be a sequence of elementary steps for a rational gdlt pair on globally strongly $bb(Q)$-factorial normal compact
   Kähler spaces of dimension $d$, with fixed higher nef b-line data.
   There exists $i_0$ such that, for every $i gt.eq i_0$, the exceptional loci on both sides of the step are
   disjoint from all generalized log canonical centers on those sides.
   No common contraction base for the sequence is assumed.]
] <thm:special>

#thm([Proposition 11.4.])[
  (Crepant gdlt modification).  #emph[Let $\( V \, A + upright(bold(M)) \)$ be a rational glc pair of dimension at
    most four on a normal compact Kähler space. Its higher nef line data are carried by a projective modification,
    and $K_V + A + M_V$ is a rational holomorphic line bundle.
    There is a projective bimeromorphic morphism $h : Y arrow.r
    V$ such that $Y$ is normal compact Kähler and globally strongly $bb(Q)$-factorial,
    $\( Y \, A_Y + upright(bold(M)) \)$ is gdlt with $A_Y gt.eq 0$, and
$ K_Y + A_Y + M_Y = h^(*) \( K_V + A + M_V \) . $

 Every $h$-exceptional prime has coefficient one in $A_Y$,
   or equivalently has generalized log discrepancy zero over $\( V \, A + upright(bold(M)) \)$.
   Global strong $bb(Q)$-factoriality is not assumed for $V$.]
] <prop:gdlt-mod>

#thm([Theorem 11.5.])[
  (Gdlt termination in dimensions at most three).  #emph[Every sequence as in Theorem 66 in dimension at most
    three is finite. The assertion concerns arbitrary choices of the permitted elementary steps,
    and does not assume pseudo-effectivity of the adjoint.]
] <thm:gdlt-three>

#proof[
  #emph[Joint proof of Theorem 66, Proposition 67, and Theorem 68.] For each $d$ in increasing order we prove
    special termination, then the modification assertion, and, if $d lt.eq 3$, gdlt termination.
    In dimension zero these statements are immediate. Fix $d > 0$,
    assume all the appropriate assertions in smaller dimensions, and first prove special termination in dimension $d$.
  #emph[Stabilizing centers.] There are only finitely many divisorial steps, by Lemma 15;
    hence we may discard a finite prefix and consider only small steps. Generalized discrepancies do not decrease.
    A zero-discrepancy place on the positive side was consequently a zero-discrepancy place before the step,
    and strictness in Lemma 5 excludes its center from either exceptional locus.
    Thus every new center is the transform of an old center with unchanged general point.
    If the exceptional locus contains the general point of an old center, that center disappears.
    There are finitely many centers on the initial model, so after another finite prefix their list is unchanged
    and all steps are isomorphisms at their general points.
  For each center choose a chain of coefficient-one strata at its general point.
    Transform this choice along the sequence. Lemma 64 gives the corresponding normalized strata $T_i$ and their
    adjoints $D_(T_i)$. The b-line data on these strata are the same under their birational identifications,
    with one fixed higher denominator. The ambient boundary coefficients belong to a fixed finite set.
    The coefficients after adjunction therefore belong to one fixed DCC set, depending only on that set,
    the denominator, and the length of the chosen chain.
  We now induct on the dimension $e$ of a surviving center to show eventual disjointness.
    A point center is already disjoint after the stabilization just made.
    For a center of positive dimension $e$, its proper zero substrata have smaller dimension and there are
    finitely many of them. Discarding a further finite prefix,
    we may assume that both exceptional loci avoid every such substratum at every remaining step.
    In particular, the induced maps on $T_i$ are isomorphisms in neighborhoods of their non-gklt loci.
  #emph[Finitely many extractions on the stratum.] Identify divisorial places over the $T_i$ through common proper
    bimeromorphic analytic models. If a prime divisor $E$ is extracted by $T_i arrow.r.dashed T_(i + 1)$,
    then $E$ is a divisor on $T_(i + 1)$ and its center there is contained in the ambient exceptional locus.
    Otherwise the ambient isomorphism near its general point would provide its strict transform as a divisor on
    $T_i$. Lemma 65 gives
  $ a \( E \; T_i \, A_(T_i) + upright(bold(M))^T \) <
    a \( E \; T_(i + 1) \, A_(T_(i + 1)) + upright(bold(M))^T \) lt.eq 1 \, $
  where the last inequality uses effectivity of the boundary.
    By monotonicity its discrepancy on $T_0$ is less than one.
    Its center on $T_0$ cannot be contained in $"Nklt" \( T_0 \, A_(T_0) + upright(bold(M))^T \)$:
    the maps are isomorphisms near that locus and its transforms,
    so a valuation centered there cannot acquire a divisorial center through the transformations under consideration.
  There are only finitely many such valuations by the off-non-gklt assertion of Lemma 16.
    In addition to its exceptional valuations, include the finitely many divisors already on $T_0$ having
    discrepancy less than one; these are components of its positive boundary.
    For any one of this finite set, the coefficients on the models where it is extracted form a strictly
    decreasing sequence: discrepancy never decreases, and each new extraction gives a strict increase.
    Those coefficients are in the fixed DCC set. Thus each valuation is extracted only finitely often.
    Altogether there are finitely many extractions.
  #emph[Removing divisorial changes and stabilizing coefficients.] After these extractions,
    the induced bimeromorphic maps extract no divisors. Lemma 15,
    applied to the span of prime $\( e - 1 \)$-cycles of the compact Kähler strata,
    shows that only finitely many further maps contract a divisor.
    In dimension one a proper bimeromorphic map between normal curves is already an isomorphism.
    We may therefore assume that every induced map is an isomorphism in codimension one.
  With primes matched on this tail, their boundary coefficients do not increase, by Lemma 65.
    No component with coefficient zero can acquire a positive coefficient.
    Only the finite boundary support at the start of the tail needs to be considered,
    and DCC stabilizes each coefficient. Consequently
  $ \( T_i arrow.r.dashed T_(i + 1) \)_(*) A_(T_i) = A_(T_(i + 1)) . $
  Let $S_i$ be the normalization of their common image in the contraction base.
    Neither $T_i arrow.r S_i$ nor $T_(i + 1) arrow.r S_i$ contracts a prime divisor.
    Indeed such a prime is matched in codimension one on the other stratum,
    but its center is in the corresponding ambient exceptional locus.
    Strict discrepancy increase would contradict coefficient stabilization.
  We have thus obtained small diagrams over the varying $S_i$, with antiample and ample adjoints, respectively,
    and strict-transform boundary and b-data. The effective difference of Lemma 65 is now exceptional over both
    stratum models: its coefficient at a divisor on either model is zero by the matched data.
    If one of the induced birational maps is an isomorphism, the matched boundary and b-line identify its adjoints
    as actual rational bundles with their canonical meromorphic comparison.
    The restricted difference is then zero on a common model.
    The strictness assertion shows that this step has no ambient exceptional intersection with the stratum.
    Thus only nontrivial small stratum surgeries remain to be excluded.
  #emph[Lifting the small surgeries in dimension $e < d$.] The induction hypothesis in dimension $e$ gives a
    projective crepant gdlt modification $h_0 : Y_0 arrow.r T_0$ with globally strongly $bb(Q)$-factorial source.
    Over $S_0$ run the relative elementary steps of Proposition 53 for its crepant adjoint.
    By gdlt termination in dimension $e$, this run is finite and ends at a model $Y_1$ whose adjoint is nef over $S_0$.
  On a common smooth model of the initial lift, its endpoint, and $T_1$, write the actual comparisons as
  $ P_0 = P_1 + G = P_(+) + F . $
  Here $P_0$ pulls back the initial crepant adjoint, $P_1$ pulls back the adjoint of $Y_1$,
    and $P_(+)$ pulls back $D_(T_1)$. The relative steps give $G gt.eq 0$ exceptional over $Y_1$.
    The restricted comparison just established, pulled through the initial crepant modification, gives $F gt.eq
    0$ exceptional over $T_1$. Lemma 62 applies: $P_1$ is nef over $S_0$ and $D_(T_1)$ is ample there.
    It gives $P_1 = P_(+)$ and a projective crepant morphism $h_1 : Y_1 arrow.r T_1$.
  This endpoint is again a gdlt modification of the required type.
    The elementary steps preserve gdlt and effectivity. They extract no prime divisor,
    and the stratum map below is small. Any prime on $Y_1$ exceptional over $T_1$ was therefore exceptional on
    $Y_0$ over $T_0$. If it survives, its coefficient is still one, since boundaries are pushed forward.
    Crepancy identifies that coefficient with its zero-discrepancy extraction over $T_1$.
  Repeat over $S_1 \, S_2 \, dots.h$. Each nontrivial stratum surgery forces at least one lifted elementary step.
    Indeed its negative morphism has a contracted curve $C$ with $D_(T_i) dot.op C < 0$.
    Projectivity gives a curve on the lift dominating $C$ with positive degree,
    on which the pulled-back adjoint is negative. The lifted model is therefore not already nef over $S_i$.
    Infinitely many nontrivial stratum surgeries would give an infinite concatenation of elementary gdlt steps in
    dimension $e$. This contradicts the lower-dimensional gdlt termination hypothesis,
    which allows varying compact contraction bases. There are only finitely many such surgeries.
    The preceding isomorphism case now proves disjointness for the chosen center.
  This completes the induction on $e$. Taking the maximum of the finitely many resulting indices gives special
    termination in dimension $d$, on both sides of every remaining step. This proves Theorem 66 in that dimension.
  #emph[Constructing the modification in dimension $d$.] Now let $\( V \, A + upright(bold(M)) \)$ be an arbitrary
    rational glc pair as in Proposition 67 in dimension $d$. Take a projective log resolution $h : W arrow.r
    V$ with $W$ smooth, carrying the higher nef bundle. Let
  $ Gamma = h_(*)^(- 1) A + sum_(E subset "Exc" \( h \)) E . $
  The pair $\( W \, Gamma + upright(bold(M)) \)$ is gdlt: its boundary is snc and its data descend to $W$.
    Its adjoint has the actual comparison
  #[#set math.equation(numbering: n => "(11.6)")
   $ K_W + Gamma + M_W = h^(*) \( K_V + A + M_V \) + Q \, wide Q =
     sum_(E subset "Exc" \( h \)) a \( E \; V \, A + upright(bold(M)) \) E gt.eq 0 . $ <eq:gdlt-modification-excess>]
  The support of $Q$ is contained in $floor.l Gamma floor.r$.
    Run relative elementary steps over $V$ using Proposition 53.
    On every model the pushforward of (11.6) remains the identity of its adjoint with the pulled-back original
    adjoint plus the effective exceptional transform of $Q$. Every surviving component of that transform is a
    floor component.
  If this run were infinite, special termination in dimension $d$, just proved,
    would make its tail disjoint from the floor. A contracted curve on such a tail lies outside the support of $Q$
    and has nonnegative degree against this effective rational Cartier divisor.
    Its degree against the pulled-back original adjoint is zero.
    This contradicts negativity of the elementary step. Thus the run is finite;
    continuation ensures it ends at relative nefness. On the endpoint $Y$,
    the remaining transform $Q_Y$ is nef over $V$ and exceptional, so Lemma 5 gives $Q_Y lt.eq 0$.
    It is also effective, hence zero. The comparison is crepant.
    The resulting model is projective over $V$, compact Kähler, globally strongly $bb(Q)$-factorial, and gdlt,
    by the relative construction. Any prime exceptional over $V$ is the transform of an exceptional prime on $W$,
    and has coefficient one in the pushed boundary. This proves Proposition 67 in dimension $d$.
  #emph[Gdlt termination in dimension $d lt.eq 3$.] Finally suppose $d lt.eq
    3$ and consider any infinite elementary gdlt sequence in this dimension.
    Discard its finite divisorial prefix and apply special termination.
    On the resulting tail all exceptional loci avoid $floor.l A_i floor.r$.
    Replace its boundary by $A_i - floor.l A_i floor.r$ on each model, retaining the same b-line.
    The resulting pairs are effective and gklt. To check the latter,
    discrepancies cannot decrease on removing an effective rational Cartier floor.
    Each old zero-discrepancy place has center in the floor, and the order of its pullback is positive,
    so its discrepancy becomes positive. Equivalently this is the snc calculation on a fixed carrier and the gdlt
    good-open condition.
  The floor has degree zero on every contracted curve on both sides,
    because it is disjoint from the exceptional loci. Thus all steps of this tail are still negative and positive,
    respectively, for the new adjoints. Their boundaries are strict transforms, their nef data are unchanged,
    and their one-ray condition for global line-bundle degrees is unchanged.
    They are consequently elementary gklt steps in the category of Theorem 63.
    That theorem excludes an infinite tail. This proves Theorem 68 in dimension $d$ and completes the triangular
    induction through dimension four. ◻
]

#prodef([Remark 11.6.])[
  The proof constructs auxiliary strong-$bb(Q)$-factorial models only after adjunction,
    or over the space to which a gdlt modification is requested.
    It never assumes that a normalized stratum is locally $bb(Q)$-factorial.
    Its uses of curve-nefness occur over individual projective bimeromorphic morphisms;
    the termination assertion concerns the entire sequence of compact models with varying bases.
    No analytic special-termination theorem is deduced solely by citing its projective counterpart.
]

== 12 Termination for elementary sequences with a nef b-line summand <sec:threshold>

We prove termination for the elementary sequences of Section 9 when the adjoint has an effective rational summand
  and a nef rational b-line summand. Special termination allows us to delete the coefficient-one boundary from a
  tail of any purported infinite sequence. Repeating this operation will give strictly increasing generalized log
  canonical thresholds, contrary to ACC. All programs and line-bundle comparisons take place on the full compact
  spaces. The algebraic floor-deletion argument of #cite(label("CT2023")) Lemma 2.20 and Theorem 4.1 provides a
  useful comparison; the relative lifts needed here will follow from the analytic results already proved.

#thm([Theorem 12.1.])[
  #emph[Let $\( X \, B \)$ be a rational klt pair on a globally strongly $bb(Q)$-factorial compact Kähler
    fourfold. Suppose there are an effective rational divisor $N$ on $X$ and rational nef b-line data
    $upright(bold(M))$, carried by a projective modification of $X$, such that
#[#set math.equation(numbering: n => "(12.1)")
 $ K_X + B tilde.op_(bb(Q)) N + M_X $ <eq:threshold-expression>]

 as actual rational line bundles. Then every birational elementary $\( K_X + B \)$-sequence in the category of
   Section 9 is finite. In particular, this holds for every sequence constructed by Proposition 12,
   independently of its ray choices.]
] <thm:expression-termination>

The nefness in this statement is nefness of the higher rational line bundle.
  No global meromorphic frame for that bundle, or uniform Cartier index for its traces on the successive spaces,
  is assumed.

=== 12.1 Thresholds and their lifts <thresholds-and-their-lifts>

The first lemma identifies the threshold on a fixed resolution.
  The negative curve ensures that the testing boundary on that resolution is nonzero, which makes the threshold finite.

#thm([Lemma 12.2.])[
  #emph[Let $V$ be a globally strongly $bb(Q)$-factorial compact Kähler space, let $B \, N gt.eq
    0$ be rational divisors, and let $upright(bold(M))$ be rational nef b-line data on a projective higher model. Set
$ T = N + M_V \, wide A \( t \) = K_V + B + t N + t M_V . $

 Suppose $\( V \, B + a N + a upright(bold(M)) \)$ is generalized klt for some rational $a gt.eq 0$,
   and $T dot.op C < 0$ for a compact curve $C subset V$. Then
$ s = sup { t gt.eq 0 : \( V \, B + t N + t upright(bold(M)) \) upright(" is generalized lc") } $

 is a finite rational number strictly greater than $a$. The pair is generalized lc at $s$ and generalized klt at
   every $0 lt.eq t < s$.]
] <lem:rational-threshold>

#proof[
  Choose a projective log resolution $p : W arrow.r V$ carrying $upright(bold(M))$ and resolving all the divisor
    comparisons below. Write
  $ K_W + C_W = p^(*) \( K_V + B \) \, wide H = p^(*) \( N + M_V \) - M_W . $
  These are the comparisons of actual rational sheaves from Lemma 49.
    Strong $bb(Q)$-factoriality makes $N$ and $M_V$ rational Cartier, and
  #[#set math.equation(numbering: n => "(12.2)")
   $ H = p^(*) N + \( p^(*) M_V - M_W \) gt.eq 0 $ <eq:threshold-defect>]
  by Lemma 5. After increasing $W$, the support of $C_W + H$ is simple normal crossing.
    The crepant higher boundary at parameter $t$ is $C_W + t H$.
  The divisor $H$ is nonzero. Otherwise $p^(*) T = M_W$ is nef.
    Since $p$ is projective, there is a compact curve $tilde(C) subset W$ mapping onto $C$ with positive degree:
    take a component dominating $C$ in $p^(- 1) \( C \)$ and intersect it with sufficiently many general relative
    hyperplanes. The projection formula would give
  $ 0 lt.eq M_W dot.op tilde(C) = deg \( tilde(C) \/ C \) thin T dot.op C < 0 . $
  Here only degrees on curves are used; no absolute curve criterion for analytic nefness is needed.
  For the finitely many prime components $E$ with $h_E = "coeff"_E H > 0$, put $c_E = "coeff"_E C_W$.
    The log-smooth discrepancy criterion gives
  #[#set math.equation(numbering: n => "(12.3)")
   $ s = min_(h_E > 0) frac(1 - c_E, h_E) . $ <eq:rational-threshold-formula>]
  Indeed all coefficients of $C_W + a H$ are strictly below one, and components with $h_E =
    0$ impose no new bound. Formula (12.3) proves finiteness, rationality, attainment, and $s > a$,
    as well as the claimed singularities at and below $s$. ◻
]

At the threshold we need a generalized dlt model to use special termination.
  The next lemma lifts each step of an infinite sequence to a finite, nonempty string on such models.
  It uses the existence of a finite relative generalized klt run from Proposition 55;
  all comparisons concern one flip base at a time.

#thm([Lemma 12.3.])[
  #emph[Consider an infinite sequence of small elementary transformations
$ X_i arrow.r.dashed X_(i + 1) \, wide X_i arrow.r^(f_i) Z_i arrow.l^(f_i^(+)) X_(i + 1) \, $

 between globally strongly $bb(Q)$-factorial compact Kähler spaces of dimension at most four.
   Let $B_i \, N_i gt.eq 0$ be strict transforms of rational divisors,
   let $upright(bold(M))$ be fixed rational nef b-line data, and put
$ T_i = N_i + M_(X_i) \, wide A_i \( t \) = K_(X_i) + B_i + t T_i . $

 Suppose that for rational numbers $0 lt.eq a < s$:]
  + #emph[$\( X_i \, B_i + a N_i + a upright(bold(M)) \)$ is generalized klt and
    $\( X_i \, B_i + s N_i + s upright(bold(M)) \)$ is generalized lc for every $i$;]
  + #emph[$T_i$ and $A_i \( t \)$ have negative degree on the contracted ray and their transforms are relatively
    ample on the positive side, for every rational $t gt.eq a$.]
  #emph[Then the sequence lifts to a concatenation of nonempty finite strings of elementary generalized dlt steps
    at parameter $s$. At the ends of the strings there are projective crepant morphisms
$ h_i : \( Y_i \, Delta_i + s upright(bold(M)) \) arrow.r \( X_i \, B_i + s N_i + s upright(bold(M)) \) $

 with effective generalized dlt boundary, extracting only divisors of coefficient one.]
] <lem:threshold-lift>

#proof[
  Take $h_1$ by Proposition 67. Suppose the current $h_i$ has been constructed.
    We choose a nearby klt parameter, run a finite relative program,
    and identify its endpoint with a crepant model of $X_(i + 1)$.
  #emph[Choosing a nearby klt parameter.] For $t in \[ a \, s \]$, define its crepant boundary by
  $ K_(Y_i) + Delta_i \( t \) + t M_(Y_i) = h_i^(*) A_i \( t \) . $
  This boundary depends affinely on $t$. Its nonexceptional coefficients are $b + t n$ with $b \, n gt.eq 0$.
    Its exceptional coefficients equal one at $s$. There are only finitely many exceptional primes,
    so for a rational $t_i < s$ sufficiently close to $s$, with $t_i gt.eq a$,
    the boundary $Delta_i \( t_i \)$ is effective. In particular,
    a nonexceptional coefficient zero at the positive parameter $s$ has $b = n = 0$ and stays zero.
    The pair downstairs is generalized klt for $a lt.eq t < s$:
    its discrepancies are affine combinations of the positive discrepancies at $a$ and the nonnegative ones at
    $s$. Thus the crepant pair at $t_i$ upstairs is effective and generalized klt.
  Choose a curve in the ray of $f_i$. By the one-ray condition on global rational line-bundle degrees,
    there is a positive rational number $q_i$ such that $A_i \( t_i \) -
    q_i A_i \( s \)$ has zero degree on all $f_i$-contracted curves.
    Apply Lemma 9, using the generalized klt antiample adjoint at $t_i$,
    to obtain a rational line bundle $L_i$ on $Z_i$ with
  #[#set math.equation(numbering: n => "(12.4)")
   $ A_i \( t_i \) tilde.op_(bb(Q)) q_i A_i \( s \) + f_i^(*) L_i . $ <eq:threshold-proportionality>]
  After pullback by $h_i$, this is an actual identity modulo a rational bundle from $Z_i$,
    not merely an equality of numerical classes.
  #emph[Running the finite relative program.] The composite $Y_i arrow.r Z_i$ is projective and bimeromorphic.
    Apply Proposition 55 to the effective generalized klt pair at $t_i$ to obtain some finite relative elementary
    run ending nef over $Z_i$. Transforming (12.4) through each step shows that the same run is negative,
    and positive after each flip, for the full adjoint at $s$.
    It is therefore a generalized dlt run at $s$, by Proposition 53, and its endpoint is nef for this adjoint as well.
  #emph[Identifying the endpoint.] To check the endpoint, on a common resolution write
  #[#set math.equation(numbering: n => "(12.5)")
   $ P_0 = P_j + G_j = P_(+) + F . $ <eq:threshold-comparison>]
  Here $P_0$ is the pullback of $h_i^(*) A_i \( s \)$, $P_j$ is the pullback of the lifted endpoint adjoint,
    and $P_(+)$ is the pullback of $A_(i + 1) \( s \)$. Negativity for the lifted run gives $G_j gt.eq 0$,
    exceptional over its endpoint, and negativity for the original small step gives $F gt.eq 0$,
    exceptional over $X_(i + 1)$. Both endpoint adjoints are nef over $Z_i$,
    and $A_(i + 1) \( s \)$ is ample there. Lemma 62 applies.
    Explicitly, if $p$ and $q$ denote the maps to these two targets, then $P_j - P_(+) = F -
    G_j$ is $q$-nef with pushforward $- q_(*) G_j lt.eq 0$; its negative is $p$-nef with pushforward $-
    p_(*) F lt.eq 0$. The two negativity inequalities give $P_j = P_(+)$.
    Relative ampleness and projective connected fibers then give the crepant projective morphism from the lifted
    endpoint to $X_(i + 1)$.
  Every prime exceptional for this morphism is the transform of an $h_i$-exceptional prime:
    the original step is small and the lifted run extracts none.
    If it survives, its coefficient one is preserved by the boundary pushforward rule.
    This proves the required assertion for $h_(i + 1)$. The string is nonempty,
    since $h_i^(*) A_i \( s \)$ has negative degree on a curve lifting an $f_i$-contracted curve and so is not nef
    over $Z_i$. Induction proves the lemma. The choice of $t_i$ is made separately at each finite stage. ◻
]

=== 12.2 Deleting the floor and raising the threshold <deleting-the-floor-and-raising-the-threshold>

#proof[
  From an infinite sequence we will construct successively larger thresholds with fixed coefficient data.
    At each repetition, special termination will let us remove the floor while retaining an infinite sequence with
    the required signs.
  #emph[Step 1: the infinite tail and its first threshold.] Suppose there is an infinite sequence.
    By Lemma 15, it has only finitely many divisorial steps. Truncate after the last of them and relabel the
    resulting sequence by $X_1 arrow.r.dashed X_2 arrow.r.dashed dots.h.c$.
    Taking actual reflexive traces transports (12.1) through this finite prefix.
    The effective divisor remains effective and rational, and a projective common higher model carries the
    pullback of the original nef line bundle. Thus the relabelled input still has the required expression.
  We will repeat the following construction. Its input is an infinite small elementary sequence with rational families
  #[#set math.equation(numbering: n => "(12.6)")
   $ \( X_i \, B_i + t N_i + t upright(bold(M)) \) \, wide A_i \( t \) = K_(X_i) + B_i + t N_i + t M_(X_i) \, quad
     T_i = N_i + M_(X_i) \, $ <eq:threshold-family>]
  and a rational $a gt.eq 0$ such that the pairs at $a$ are generalized klt,
    and both $T_i$ and $A_i \( t \)$ have the negative-to-positive signs of each step for all rational $t gt.eq
    a$. The divisors $B_i \, N_i$ are effective strict transforms. Initially $a = 0$, the nef part at zero is zero, and
  $ T_i tilde.op_(bb(Q)) K_(X_i) + B_i \, wide A_i \( t \) tilde.op_(bb(Q)) \( 1 + t \) \( K_(X_i) + B_i \) \, $
  so these conditions hold.
  Let $s$ be the threshold of the first pair in (12.6). Lemma 71 applies to a contracted curve and gives $s in
    bb(Q)$, $a < s < oo$. Since $A_i \( s \)$ is negative on the input side and ample on the positive side at each
    step, discrepancy monotonicity shows that every pair in the sequence at $s$ is generalized lc.
    Lemma 72 gives an infinite concatenation of generalized dlt elementary steps at $s$,
    with compatible crepant endpoint morphisms to the $X_i$.
  #emph[Step 2: deleting the floor after special termination.] Apply Lemma 15 and Theorem 66 to this
    concatenation. It has a tail consisting of small steps whose exceptional loci, on both sides,
    avoid the support of the coefficient-one boundary. Every lifted string is finite and nonempty,
    so an endpoint occurs beyond any prescribed finite prefix.
    Start the tail at such an endpoint $h : Y arrow.r X_i$ and relabel.
    Write the union of the supports of $B_i \, N_i$ as $union.big P$, with coefficients $b_P \, n_P gt.eq 0$.
    If $hat(P)$ denotes the strict transform on $Y$, the crepant boundary at $s$ is
  $ Delta \( s \) = sum_P \( b_P + s n_P \) hat(P) + sum_(E upright(" exceptional for ") h) E . $
  Set
  #[#set math.equation(numbering: n => "(12.7)")
   $ tilde(B) = sum_(b_P + s n_P < 1) b_P hat(P) \, wide tilde(N) =
     sum_(b_P + s n_P < 1) n_P hat(P) . $ <eq:retained-threshold-coefficients>]
  Then
  $ tilde(B) + s tilde(N) = Delta \( s \) - floor.l Delta \( s \) floor.r . $
  Deleting the floor of a generalized dlt pair gives a generalized klt pair with the same nef data.
    Indeed every place of discrepancy zero has center in that floor,
    whose rational Cartier pullback has positive order at the place;
    all other discrepancies were already positive. Consequently
    $\( Y \, tilde(B) + s tilde(N) + s upright(bold(M)) \)$ is generalized klt. Both divisors in (12.7) are effective.
  #emph[Step 3: retaining the signs and increasing the threshold.] Let their strict transforms define the new
    family on every model of the lifted tail. Its signs require checking for the testing direction,
    as well as for its adjoint. Do this over each original flip base $Z_i$.
    At the initial endpoint of its lifted string, the trace comparison gives
  #[#set math.equation(numbering: n => "(12.8)")
   $ h_i^(*) T_i = tilde(N)_i + M_(Y_i) + F_i \, wide "Supp" F_i subset.eq "Supp" floor.l Delta_i \( s \)
     floor.r . $ <eq:floor-supported-test>]
  To see the support assertion, the difference between pullback and strict transform of $N_i$,
    and the difference between pullback and b-line trace of $M_(X_i)$, are $h_i$-exceptional.
    Every such prime has coefficient one in $Delta_i \( s \)$.
    The remaining difference consists of the discarded $n_P hat(P)$, also supported in the floor.
    This is a comparison of actual rational sheaves; a sign for $F_i$ is unnecessary.
  On $X_i$, both $A_i \( s \)$ and $T_i$ have negative degree on the contracted ray,
    and their ratio is a positive rational number $c_i$. Lemma 9,
    applied using any nearby generalized klt parameter below $s$, gives a rational line bundle $Q_i$ on $Z_i$ such that
  #[#set math.equation(numbering: n => "(12.9)")
   $ h_i^(*) A_i \( s \) tilde.op_(bb(Q)) c_i \( tilde(N)_i + M_(Y_i) + F_i \) + \( f_i h_i \)^(*) Q_i .
     $ <eq:floor-test-proportionality>]
  Transform this identity through the finite lifted string.
    The tail is small, so all its boundary divisors, traces, and $F_i$ transform strictly.
    The support of the transform of $F_i$ remains in the transformed floor.
    All contracted and flipped curves are disjoint from that floor.
    Equation (12.9) therefore shows that $tilde(T) = tilde(N) +
    M_(upright("trace"))$ has negative degree on every contracted ray and positive relatively ample transform on
    the other side. For the ampleness assertion, the same identity,
    with the floor bundles trivial near the exceptional fibers,
    identifies its restriction there with a positive rational multiple of the full ample adjoint;
    fiberwise ampleness is the relative ampleness criterion.
  Likewise subtracting the floor changes neither sign of the adjoint at $s$.
    On each side, for every rational $u gt.eq s$, the new adjoint is
  $ tilde(A) \( u \) = tilde(A) \( s \) + \( u - s \) tilde(T) \, $
  so it has the same negative-to-positive signs. At later endpoints the retained coefficients still obey (12.7):
    the downstairs maps are small, and an exceptional divisor of an endpoint morphism cannot become the transform
    of a downstairs prime. All boundaries upstairs are pushforwards, hence strict transforms on this tail.
    Thus the families constructed over consecutive bases agree.
  We have obtained another infinite small elementary sequence satisfying the same conditions, now with $a = s$.
    The generalized klt condition at $s$ holds throughout the tail by discrepancy monotonicity.
    It also implies the generalized klt condition at parameter zero, by (12.2).
    Lemma 71 shows that its next threshold is finite, rational, and strictly larger than $s$.
    The construction can therefore be repeated indefinitely if the original sequence was infinite. It produces
  #[#set math.equation(numbering: n => "(12.10)")
   $ 0 < s_1 < s_2 < s_3 < dots.h.c . $ <eq:increasing-thresholds>]
  #emph[Step 4: the fixed data for analytic ACC.] Let $I$ be the finite set consisting of zero and the
    coefficients of the first $B$, and let $J$ consist of zero, the coefficients of the first $N$, and $1 \/ p$,
    where $p > 0$ makes $p M_(W_0)$ integral on the original nef carrier $W_0$.
    At every repetition, the new boundary and testing coefficients are obtained solely by omissions from the
    previous ones, as in (12.7). Newly extracted coefficient-one primes are removed before the next threshold
    input. The boundary coefficients therefore stay in $I$, the testing-boundary coefficients stay in $J$,
    and the nef part at parameter zero remains zero. On every required higher model the testing nef data are $1 /
    p$ times the pullback of the same integral nef line bundle. The denominator $p$ is fixed.
    Common projective models are needed only for finitely many maps at a time and do not change $p$.
  We verify explicitly that each $s_j$ belongs to the analytic generalized threshold set with these data.
    Choose a general point of a computing center on its compact input,
    and a relatively compact Stein neighborhood $U$ of that point.
    Restrict a projective log resolution carrying the data to $U$, and denote it by $g : W arrow.r U$.
    The computing place still meets this restriction. Hence the local threshold equals $s_j$:
    the pair is lc at $s_j$, whereas the same place has negative discrepancy for every larger parameter.
  Let $cal(L)$ represent the integral line bundle $p M_W$. The coherent sheaf $g_(*)
    cal(L)$ has rank one on the isomorphism locus of $g$. Cartan’s Theorem A supplies a section nonzero at a point
    of that locus, and thus a nonzero section of $cal(L)$ on $W$.
    Its divisor $P'$ is Cartier and represents $cal(L)$. In particular $P'$ is $g$-nef and $M_W$ is represented by
    $1 / p P'$. The induced meromorphic identification gives precisely the original trace and pullback defect.
    Compatible local canonical representatives may be chosen in the same way from the coherent canonical sheaf.
    Neither choice changes the boundary or testing-boundary coefficients, the discrepancies,
    or the factor $1 \/ p$. The testing boundary is rational Cartier because its components are restrictions of
    global rational Cartier divisors on the strongly $bb(Q)$-factorial input.
  The analytic generalized threshold theorem #cite(label("HXACC2023")) Theorem 1.1 and Theorem 3.3;
    see also Definition 2.3 and Remark 2.5 consequently applies in dimension four with the fixed DCC sets $I \,
    J$. Its nef summands are actual relatively nef Cartier divisors with the fixed weight $1 \/ p$;
    it requires no common bound for Cartier indices of their downstairs traces.
    It prohibits the strictly increasing sequence (12.10). This contradiction proves the theorem. ◻
]

== 13 Nef b-line decompositions <sec:supply>

#thm([Proposition 13.1.])[
  #emph[Let $\( X \, B \)$ be a globally strongly $bb(Q)$-factorial compact Kähler fourfold pair,
    with $B$ effective and rational, $\( X \, B \)$ klt, and $D = K_X +
    B$ rational Cartier and analytically pseudo-effective. Suppose there is a projective log resolution $p :
    W arrow.r X$, with $W$ smooth and compact Kähler, such that $W$ is non-uniruled or Moishezon.
    Then there exist a smooth compact Kähler manifold $U$, a projective modification $r : U arrow.r X$,
    an analytically nef rational holomorphic line bundle $M_U$,
    and an effective rational divisor $N$ on $X$ such that, for the rational b-line bundle $upright(bold(M))$
    determined by $M_U$,
#[#set math.equation(numbering: n => "(13.1)")
 $ D tilde.op_(bb(Q)) N + M_X . $ <eq:supply-expression>]

 The equivalence is an identity of actual rational reflexive sheaves.]
] <prop:expression>

#proof[
  Choose a projective log resolution $p : W arrow.r X$ as in the statement.
    We first describe how to transfer a nef adjoint on a minimal model reached by a finite program from $W$ to a
    rational b-line summand over $X$.
  Suppose that a finite program on $W$ ends at a model $Y$,
    and that $H_W$ and $H_Y$ are its initial and final actual rational adjoints.
    Both morphisms defining each step are projective. The main components of the successive fiber products of
    their graphs, followed by normalization and resolution, therefore give a diagram
  $ & U & \
a arrow.bl &  & arrow.br q\
W &  & Y $
  whose two arrows are projective modifications. The construction uses only the finitely many steps of this
    program: projectivity follows successively by base change and composition.
    In particular $r = p a$ is projective over the original $X$, and $U$ is compact Kähler.
  The stepwise comparisons in Lemma 5, pulled back to this common model, give
  #[#set math.equation(numbering: n => "(13.2)")
   $ a^(*) H_W tilde.op_(bb(Q)) q^(*) H_Y + G \, wide G gt.eq 0 . $ <eq:supply-common-comparison>]
  Set $M_U = q^(*) H_Y$. When $H_Y$ is nef, so is $M_U$: pull back metrics with arbitrarily small negative
    curvature and compare the pulled-back fixed form with a Kähler form on $U$.
    In the projective case $U$ is itself projective, and the pullback of a nef rational bundle is analytically nef
    by the projective metric characterization. For a common multiple $m$,
    the trace of $M_U$ is represented by the rank-one reflexive sheaf
  $ #scale(x: 120%, y: 120%)[\(] r_(*) cal(O)_U \( m M_U \) #scale(x: 120%, y: 120%)[\)]^(* *) . $
  Coherence follows from properness, and global strong $bb(Q)$-factoriality on $X$ makes a further reflexive power
    invertible. By Lemma 49, tracing (13.2) gives
  #[#set math.equation(numbering: n => "(13.3)")
   $ "Tr"_r \( a^(*) H_W \) tilde.op_(bb(Q)) M_X + r_(*) G . $ <eq:supply-trace-comparison>]
  Indeed this is the usual tensor identity at each codimension-one point of $X$, where $r$ is an isomorphism,
    and both sides extend reflexively. It retains the actual identifications of the line bundles.
    In particular, no global meromorphic frame of either canonical bundle or of $M_U$ is chosen.
  #emph[Non-uniruled resolution.] By #cite(label("Ou2025")) Theorem 1.1, $K_W$ is analytically pseudo-effective.
    Starting with the smooth empty-boundary pair $\( W \, 0 \)$,
    apply Lemma 10 and Proposition 12 whenever the current canonical bundle is not nef.
    Lemma 43 preserves its pseudo-effectivity, and Lemma 44 excludes a fiber-type contraction at every stage.
    Terminality persists by Lemma 5. Corollary 21 rules out an infinite sequence.
    Continuation from every non-nef model thus gives a finite program ending at a terminal compact Kähler $Y$ with
    analytically nef actual rational canonical bundle $K_Y$.
  Apply (13.2) with $H_W = K_W$ and $H_Y = K_Y$. The reflexive trace of $a^(*) K_W$ on $X$ is $K_X$:
    over the common codimension-one open set the canonical sheaves are canonically identified,
    and normality determines their reflexive extensions. Equation (13.3) therefore yields
  $ K_X + B tilde.op_(bb(Q)) M_X + \( r_(*) G + B \) . $
  Take $N = r_(*) G + B$. This argument uses the trace of $K_W$;
    it does not require the discrepancies comparing $K_W$ with $p^(*) D$ to be nonnegative.
    The terminal fourfold result used here was established independently of Theorem 70.
  #emph[Uniruled Moishezon resolution.] The smooth Kähler manifold $W$ is then projective.
    By Lemma 45, choose an effective rational SNC klt boundary $Gamma$ satisfying
  #[#set math.equation(numbering: n => "(13.4)")
   $ H_W := K_W + Gamma tilde.op_(bb(Q)) p^(*) D + E_0 \, wide E_0 gt.eq 0 quad
     upright("and ") E_0 upright(" is ") p upright("-exceptional") . $ <eq:supply-projective-start>]
  This adjoint is analytically pseudo-effective, hence numerically pseudo-effective in the projective sense by
    #cite(label("BDPP2013")) Proposition 1.2.
  Run the ordinary projective klt MMP on $\( W \, Gamma \)$.
    Divisorial steps are finite, and every remaining flip sequence terminates by #cite(label("CT2023"))
    Theorem 1.1, applied to a pseudo-effective NQC lc fourfold with zero nef part.
    These are projective varieties over a point, as required by that theorem’s conventions.
    Pseudo-effectivity persists by Lemma 43, so Lemma 44 excludes a fiber-type negative contraction.
    The resulting model $Y$ has nef rational adjoint $H_Y = K_Y + Gamma_Y$.
  Form (13.2) for this finite program. Since $E_0$ is exceptional over $X$,
    the reflexive trace of $a^(*) H_W$ in (13.4) is $D$. Thus (13.3) gives
  $ D tilde.op_(bb(Q)) M_X + r_(*) G . $
  Take $N = r_(*) G$. The projective fourfold theorem has supplied a nef adjoint; fourfold abundance is not used. ◻
]

== 14 Why analytic local factoriality is different <sec:local-convention>

Global Weil-divisor $bb(Q)$-factoriality does not require every analytic local ring to be $bb(Q)$-factorial.
  The distinction already occurs for projective threefolds with one ordinary double point;
  see #cite(label("Reid")) Definition 5.1, Remark (b). The following product example explains why the stronger
  local requirement cannot be inserted into Theorem 2.

#thm([Proposition 14.1.])[
  #emph[There is a smooth projective fourfold $X$ with pseudo-effective,
    non-nef canonical divisor for which no ordinary $K_X$-negative program can reach a nef model while keeping
    every model analytically locally $bb(Q)$-factorial. Its unique possible first negative birational contraction
    is divisorial. Its target is nevertheless globally factorial and admits a nef canonical divisor.]
] <prop:local-convention>

#proof[
  #emph[Construction.] Let $b : B arrow.r bb(P)^4$ be the blowup of a point, let $H =
    b^(*) cal(O)_(bb(P)^4) \( 1 \)$, and let $F$ be the exceptional divisor.
    The graph of projection from that point embeds $B$ in $bb(P)^4 times bb(P)^3$,
    and the restriction of $cal(O) \( 1 \, 1 \)$ is $2 H - F$. Thus $2 H - F$ is very ample.
    Since $H$ is globally generated,
  $ 6 H - 2 F = 2 \( 2 H - F \) + 2 H $
  is very ample as well. Take a general smooth member $U in \| 6 H - 2 F \|$.
    Its image $U_0 subset bb(P)^4$ is smooth away from the blown-up point.
    The quadratic jets of the defining sextics at that point are arbitrary,
    so a general member has a nondegenerate quadratic initial term.
    The holomorphic Morse lemma identifies its unique singularity with
  $ x y - z w = 0 . $
  The restriction $pi : U arrow.r U_0$ resolves this node, with exceptional quadric
  $ E = F \|_U tilde.eq bb(P)^1 times bb(P)^1 \, wide cal(O)_U \( E \) \|_E = cal(O)_E \( - 1 \, - 1 \) . $
  Adjunction gives
  #[#set math.equation(numbering: n => "(14.1)")
   $ K_U = H \|_U + E \, $ <eq:local-example-canonical>]
  since $K_B = - 5 H + 3 F$.
  Weak Lefschetz for the smooth ample threefold $U subset B$ gives
  $ H^1 \( U \, bb(Z) \) = 0 \, wide H^2 \( U \, bb(Z) \) = bb(Z) \[ H \|_U \] xor bb(Z) \[ E \] . $
  This is the blowup calculation underlying the classical example in #cite(label("Reid")) Definition 5.1,
    Remark (b). Let $C$ be a smooth elliptic curve and set $X = U times C$.
    Its canonical divisor is the pullback of (14.1), so is effective.
    If $ell$ is either ruling in $E times { c }$, then $K_X dot.op ell = - 1$; in particular $K_X$ is not nef.
  #emph[All negative contractions have the same target.] Put $D = E times C$ and let $h = { e } times
    C$ be a horizontal curve. A curve not contained in $D$ has nonnegative degree against both the effective
    divisor $D$ and the nef hyperplane pullback. Thus every $K_X$-negative curve lies in $D$.
    The two rulings of $E$ have the same class in $H_2 \( U \, bb(R) \)$:
    both have degrees $0 \, - 1$ against the displayed basis of $H^2 \( U \, bb(R) \)$.
    Künneth and $H^1 \( U \, bb(R) \) = 0$ now show that every integral curve $gamma subset D$ has class
  #[#set math.equation(numbering: n => "(14.2)")
   $ \[ gamma \] = a \[ ell \] + b \[ h \] \, wide a \, b gt.eq 0 . $ <eq:local-example-curve>]
  Here $a$ is the sum of the projection degrees to the two factors of $E = bb(P)^1 times bb(P)^1$,
    and $b$ is the projection degree to $C$. Moreover $K_X dot.op gamma = - a$, so negativity means $a > 0$.
  Let $f : X arrow.r Z$ be any nontrivial projective birational contraction with connected fibres,
    normal compact Kähler target, and $- K_X$ relatively ample.
    Choose a Kähler class $omega_Z$ and set $alpha = f^(*) omega_Z$.
    For a curve, vanishing of its degree against $alpha$ is equivalent to being contracted by $f$.
    In particular $alpha dot.op ell gt.eq 0$ and $alpha dot.op h > 0$:
    the horizontal curve cannot be contracted because $K_X dot.op h = 0$.
    A contracted curve $gamma$ has the form (14.2) with $a > 0$, and
  $ 0 = alpha dot.op gamma = a \( alpha dot.op ell \) + b \( alpha dot.op h \) . $
  It follows that $b = 0$ and $alpha dot.op ell = 0$. Thus all rulings in every $E times { c }$ are contracted,
    and $f$ is not small.
  Set $q = pi times upright("id")_C : X arrow.r U_0 times C$.
    Its nontrivial fibres are the quadrics $E times { c }$, which are connected by their rulings,
    so $f$ is constant on every $q$-fibre. Conversely, every curve in an $f$-fibre has the form (14.2) with $b =
    0$, and is contracted by $q$. A connected projective fibre is connected by chains of curves,
    so $q$ is constant on every $f$-fibre. The two targets are isomorphic:
    the reduced image of $\( q \, f \)$ in their product projects properly,
    bijectively and bimeromorphically to each normal target, hence finitely and isomorphically.
    Therefore $q$ is the only possible first negative birational contraction.
    It is divisorial, and its relative numerical rank is one because both quadric rulings have the same nonzero
    numerical class.
  #emph[Failure of analytic local $bb(Q)$-factoriality.] Near the singular locus of $U_0 times C$,
    consider the prime analytic divisor
  $ P = { x = z = 0 } times upright("(a disk)") med subset med { x y - z w = 0 } times upright("(a disk)") . $
  On the blowup of the singular axis, its strict transform meets each exceptional quadric in a ruling line.
    If $n P$ were Cartier near an axis point for some integer $n > 0$,
    its pullback would have the form $n tilde(P) + k E_(upright("exc"))$.
    The associated line bundle restricts trivially to the quadric over that point,
    because it is pulled back from a line bundle at a point. On the other hand its restriction is
  $ cal(O)_(bb(P)^1 times bb(P)^1) \( n - k \, - k \) \, $
  up to interchanging the factors. Triviality forces $k = 0$ and $n = 0$, a contradiction.
    The target is not analytically locally $bb(Q)$-factorial.
    Since $K_X$ is not nef and there is no small negative contraction,
    there is no permissible first step under that local convention.
  #emph[Compatibility with the global convention.] The same example has a valid one-step global program.
    Indeed, $- E$ is $pi$-ample, so $- K_X$ is $q$-ample, and adjunction on $U_0$ gives
  $ cal(O)_(U_0 times C) \( K_(U_0 times C) \) tilde.eq "pr"_1^(*) cal(O)_(U_0) \( 1 \) \, $
  which is nef. On the blowup of the node the exceptional divisor has log discrepancy two;
    its smooth product with $C$ is a log resolution with the same log discrepancy.
    Hence the target is terminal, in particular klt.
  It remains to check that the local divisor $P$ is not a global factoriality obstruction.
    The displayed integral cohomology of $U$ and Hodge decomposition give $H^1 \( U \, cal(O)_U \) =
    H^2 \( U \, cal(O)_U \) = 0$ and $"Pic" \( U \) = bb(Z) \[ H \|_U \] xor bb(Z) \[ E \]$.
    The exponential sequence and Künneth therefore give
  $ "Pic" \( X \) = bb(Z) \[ H \] xor bb(Z) \[ D \] xor "pr"_C^(*) "Pic" \( C \) . $
  Strict transform and divisor pushforward identify
  $ "Cl" \( U_0 times C \) = "Pic" \( X \) \/ bb(Z) \[ D \] . $
  Every surviving class descends to a Cartier class, either from the hyperplane bundle on $U_0$ or from a line
    bundle on $C$. Chow’s theorem makes every global analytic Weil divisor on this projective target algebraic,
    so every such divisor is Cartier. GAGA identifies its global coherent rank-one reflexive sheaves with
    algebraic divisorial sheaves, which are therefore invertible as well.
    The plane $P$ is defined only on an analytic neighbourhood;
    it need not extend to a divisor on the whole compact space. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
