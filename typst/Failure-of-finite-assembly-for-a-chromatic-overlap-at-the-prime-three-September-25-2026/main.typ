#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Failure of finite assembly for a chromatic overlap \
at the prime three]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Chromatic fracture reconstructs a spectrum from its local pieces and the maps relating adjacent heights.
  For the sphere, one of the objects that carries this gluing information is the overlap

$ L_(n - 1) L_(K \( n \)) S . $

Here $S = S_p^and$ is the derived $p$-complete sphere, $L_i$ denotes localization with respect to Johnson–Wilson
  theory $E \( i \)$, $L_0$ is rationalization, and $L_(K \( n \))$ denotes Morava $K \( n \)$-localization.
  Classical chromatic splitting asks for a precise description of this overlap by lower local spheres
  #cite(label("Hovey93")) #cite(label("BB19")). We study the less restrictive question of whether those spheres
  can produce the overlap by any finite construction.

For objects $X_1 \, dots.h \, X_r$ in the category of $E \( n - 1 \)$-local $S$-modules, let $"Thick" { X_1 \,
  dots.h \, X_r }$ be the smallest full subcategory containing them and closed under equivalences, finite sums,
  integer suspensions and desuspensions, homotopy cofibers, and retracts #cite(label("HS99")) Definitions 1.2,
  1.3(c), and 1.5(c). Every map is $S$-linear. This is the #emph[ordinary] thick subcategory:
  tensoring with an arbitrary module, taking an infinite coproduct,
  or taking an unrestricted homotopy limit is not an additional closure operation.
  The finite-assembly question asks whether

#[#set math.equation(numbering: n => "(1.1)")
 $ L_(n - 1) L_(K \( n \)) S in "Thick" { L_0 S \, L_1 S \, dots.h \, L_(n - 1) S } $ <eq:finite-assembly-question>]

for every prime $p$ and every $n gt.eq 1$. The number of cofibers and their attaching maps may depend on $p$ and
  $n$. In particular, this question allows nonsplit extensions and Moore corrections:
  a cofiber of multiplication by a power of $p$ is one of the permitted constructions.

#thm([Theorem 1.1.])[
  #emph[At $p = n = 3$, with $S = S_3^and$,
$ L_2 L_(K \( 3 \)) S in.not "Thick" { L_0 S \, L_1 S \, L_2 S } $

 in the category of $E \( 2 \)$-local $S$-modules.]
] <thm:main>

This disproves the ordinary finite-assembly statement (1.1). Its scope is the specified prime and height.
  The obstruction does not depend on a proposed list of summands or on a bound for the number of allowed cofibers.

=== 1.1 Splittings, finite constructions, and the prime three <splittings-finite-constructions-and-the-prime-three>

The historical splitting assertions contain more data than ordinary thick membership.
  In Hovey’s account of Hopkins’ conjecture, the proposed exterior classes, factorizations,
  and summands are distinguished from the splitting of the canonical cofiber sequence #cite(label("Hovey93"))
  Conjecture 4.2. The detection result there is conditional on chromatic splitting #cite(label("Hovey93"))
  Theorem 4.3. For the sphere, the weak splitting question asks only whether the canonical unit

$ L_(n - 1) S arrow.r L_(n - 1) L_(K \( n \)) S $

has a retraction; the finite-input formulation is stated in #cite(label("BGH2022"), form: "prose")
  Conjecture 1.1.11. Ordinary thick membership records no distinguished map at all.
  A prescribed strong decomposition with its unit would give both a finite construction and a weak splitting,
  but a finite construction may have nonsplit attachments and need not split that unit.

At height two, the positive odd-prime results developed from Shimomura–Yabe’s calculation for $p gt.eq
  5$ #cite(label("ShimomuraYabe95")) Theorem 2.4, revisited and corrected by
  #cite(label("Behrens12"), form: "prose") Theorem 7.7 and Remark 7.8.
  At the prime three, Goerss–Henn–Mahowald established the prescribed height-two splitting #cite(label("GHM14"))
  Theorem 5.11. Thus prime three admits a height-two splitting,
  while Theorem 1 obstructs even finite assembly at the next height.
  The prime-two case explains why failure of a prescribed list need not obstruct finite assembly.
  Beaudry disproved the original strong wedge formula at $n = p = 2$ #cite(label("Beaudry2017")) Theorem 1.4.
  Beaudry–Goerss–Henn then described the additional Moore-spectrum terms while retaining the canonical unit
  retraction #cite(label("BGH2022")) Theorem 1.1.6. Those extra terms are allowed by the ordinary thick closure
  above. Thus the known failure of a prescribed wedge is not by itself an obstruction to finite assembly.
  Conversely, Theorem 1 addresses the finite-construction question,
  not the separate assertion that a particular canonical unit fails to retract.
  The revised strong summand patterns and their known low-height cases are discussed in
  #cite(label("BB19"), form: "prose") Section 6.1.

The companion article #emph[Filtered chromatic splitting at generic primes] constructs an actual filtration by
  lower local spheres for $n gt.eq 1$ and $p > n + 1$ #cite(label("CompanionFiltered")) Theorem 1.1.
  Its prime range excludes the example studied here. The companion rational obstruction at height three concerns a
  prescribed strong wedge for $p gt.eq 5$ #cite(label("CompanionRational")) Corollary 1.2;
  such an obstruction is compatible with a finite construction by nonsplit cofibers.
  Neither companion result supplies a step in the prime-three proof below.

The connected-marking method has earlier coheight-one precedents.
  Torii’s Laurent-field coefficient tower builds on Gross’s monodromy calculation and carries commuting stabilizer
  actions from the two heights #cite(label("Gross79")) Theorem 3.5(1a) #cite(label("Torii03")) Theorems 2.7 and
  2.9 and Corollary 2.8. Torii later constructed a localized Adams spectral sequence and detected the
  degree-minus-one reduced-norm class in actual iterated localization #cite(label("Torii11")) Theorems 4.7 and
  8.1. The present obstruction requires further comparisons that retain the exceptional norm character through
  ordinary finite-stage coefficients and the full lower-height deformation.

The geometric starting point is the coheight-one work of #cite(label("BMR26"), form: "prose").
  For odd $p$ and $h gt.eq 2$, their theorem has an exceptional branch when $p - 1$ divides $h -
  1$ #cite(label("BMR26")) Theorem A. The calculation of the completed orientation line assumes $k supset.eq
  bb(F)_(p^(h \( h - 1 \)))$. At $p = h = 3$, with our choice $k supset.eq bb(F)_(3^6)$,
  the tame determinant invariants retain a second cohomology line with a nontrivial lower-height norm character
  #cite(label("BMR26")) Theorem D, Theorems 3.6.10 and 5.2.10, and Lemma 5.2.5.
  Their completed proxy does not by itself identify the ordinary overlap used here; in particular,
  an invertible cofiber for the proxy does not decide whether its attachment splits #cite(label("BMR26"))
  Theorem A and Remark 5.2.12. The shifted orientation line has a representation-theoretic antecedent in Heyer’s
  derived Steinberg coinvariant calculation #cite(label("Heyer23")) Corollary 5.3.4 #cite(label("HeyerGeo24"))
  Lemma 4.1.6 and Corollary 4.3.10, used geometrically in #cite(label("BMR26"), form: "prose") Sections 3.5–3.6.
  Section 6 computes the required distribution orientation with the coefficient topology used here.
  The proof below must carry the character from finite marking coefficients to ordinary homotopy and retain the
  whole height-two deformation along the way. These are the two places where a closed-fiber geometric calculation
  alone is insufficient.

=== 1.2 A detector that is stable under finite construction <a-detector-that-is-stable-under-finite-construction>

The final obstruction can be stated before its coefficient calculation.
  Choose a finite field $k$ containing $bb(F)_(3^6)$, enlarged by a finite extension when needed to fix the
  constant identifications, and let $E_2 = E_2 \( k \)$ be height-two Morava $E$-theory.
  Its degree-zero ring is $W \( k \) \[ \[ x \] \]$; the variable $x$ is the height-two deformation parameter.
  Write $omega = pi_2 E_2$ for the periodicity line and

$ Q_x = k \( \( x \) \) \, wide overline(omega) = \( omega \/ 3 \) ⊗_(k \[ \[ x \] \]) Q_x . $

An unramified quadratic field $F \/ bb(Q)_3$ lies in the height-two endomorphism algebra.
  Its unit group $G_F = cal(O)_F^times$ acts on $Q_x$ and on $overline(omega)$. The action is semilinear:
  it acts on scalars as well as on vectors.

For a spectrum $X$, apply the exact test

$ cal(T) \( X \) = L_(K \( 2 \)) \( E_2 and X \) \/ 3 \, wide cal(V)_d \( X \) =
  pi_d cal(T) \( X \) ⊗_(k \[ \[ x \] \]) Q_x . $

The smash product here is the ordinary smash product of spectra.
  After $K \( 2 \)$-localization the three proposed generators become $0 \, 0 \, L_(K \( 2 \)) S$,
  and the test of the last one has one periodicity line in each even degree.
  Exactness now gives a stringent necessary condition: if $X$ comes from the local unit by the permitted finite
  operations, then every $cal(V)_d \( X \)$ is finite-dimensional and every simple constituent is a power of
  $overline(omega)$. Proposition 3 proves this by placing those representations in a Serre subcategory.
  Finite dimensionality is a consequence on the thick closure, not an assumption about the overlap.

The coefficient calculation produces a different line,

#[#set math.equation(numbering: n => "(1.2)")
 $ Q_x \( delta \) \, wide delta \( g \) = overline(N_(F \/ bb(Q)_3) \( g \)) in bb(F)_3^times \, quad
   g in G_F . $ <eq:intro-norm-line>]

The notation means that $Q_x$ has its usual semilinear action and a chosen basis is multiplied by the constant
  $delta \( g \)$. The character is nontrivial, since the residue norm $bb(F)_9^times arrow.r
  bb(F)_3^times$ is surjective. What matters is not merely this residue character but its action over the field
  $Q_x$. The full group $G_F$, including its principal units, has infinite image on $Q_x$ and fixed field $k$.
  Together with the first Hasse invariant, this full action excludes the norm line from every periodicity power;
  Lemma 50 gives the argument.

=== 1.3 From finite markings to actual homotopy <from-finite-markings-to-actual-homotopy>

The coefficient calculation and its passage to homotopy solve different problems.
  The first produces the norm line in ordinary continuous cohomology.
  The second retains that line through the entire height-two deformation and the filtration of actual homotopy.
  We describe the interfaces between these arguments before constructing their coefficients.

===== 1.3.1 Integral markings. <integral-markings.>

On the height-two stratum of the height-three deformation,
  the algebraic $p$-divisible group has a connected part of height two and an étale quotient of height one.
  Its finite torsion kernels are formed before passing to the stratum, so both parts are retained.
  Over the one-parameter field $K = k \( \( t \) \)$, let $L^U$ be the finite étale algebra of connected markings
  modulo an open subgroup $U$ of the height-two stabilizer $J$. Put

$ L = "colim"_(U subset J) L^U \, wide R = L^(upright("perf")) . $

The groups $P$ and $J$ are the unextended height-three and height-two stabilizers, respectively; both fix $k$.
  The group $P$ transports the deformation, commuting with the marking action of $J$.
  Section 4 constructs a determinant-normalized integral marking of the étale quotient.
  The normalization determines the norm action on the coefficients.
  Relative section-sheaf full faithfulness #cite(label("ALB25")) Corollary 3.11 makes this a construction of
  families of markings, including their frame changes.

===== 1.3.2 Ordinary cohomology. <ordinary-cohomology.>

The geometry first computes cohomology with the completed perfection of each finite stage $L^U$.
  Returning to ordinary coefficients is a separate argument:
  a cochain with values in $L$ or $R$ must have its image in one complete finite marking or root stage.
  The central step in Section 7 proves finite cohomology at such stages.
  It uses an invariant differential to normalize Cartier’s operator,
  whose residue adjoint is Frobenius #cite(label("Cartier58")) Chapter II,
  Section 6 #cite(label("Serre58Topology")) Proposition 9. This finiteness controls primitives of small cocycles
  and allows passage from root stages to completed perfections, including continuous profinite families.
  A distribution operator then removes the roots after tame sign averaging.
  Descent along the remaining norm quotient gives Theorem 41:
  the ordinary $P$-cohomology of $L$ has four lines, in degrees $0 \, 1 \, 3 \, 4$.
  The upper two carry the character $delta$ on $G_F subset J$.

===== 1.3.3 Finite descent in spectra. <finite-descent-in-spectra.>

To place this calculation in homotopy, first extend constants by a finite étale $S$-algebra $S_k$,
  whose underlying $S$-module is a finite sum of copies of $S$, and put $Z_k = L_(K \( 3 \)) S_k$.
  Morava descent expresses $Z_k$ as the totalization of a cosimplicial spectrum.
  Descendability #cite(label("Mathew16")) bounds the composites in its error tower;
  exactness of $cal(T)$ preserves this bound. Thus the tested descent spectral sequence has a finite filtration on
  its actual abutment $pi_(*) cal(T) \( Z_k \)$, as proved in Proposition 44.
  On mod-$3$ homotopy, a diagonal summand aligns the constants from $S_k$ and $E_2$.
  Descendability uses a thick tensor ideal; the finite-assembly detector uses the ordinary thick closure of Section 2.

===== 1.3.4 The whole height-two deformation. <the-whole-height-two-deformation.>

The homotopy cochain terms of that spectral sequence must still be compared with the ordinary coefficient
  calculation. Section 8 starts with ordinary, unlocalized cooperations and expresses the completed terms as
  inverse limits of their quotients by $x^m$. Over the perfect ring $R$,
  the marked connected–étale extension splits. Square-zero deformation torsors and the universal Kodaira–Spencer
  isomorphism #cite(label("Lau10")) Section 5, especially Theorem 5.1 and the paragraph following Equation (5.2)
  lift this splitting through every ring $R \[ x \] \/ \( x^m \)$.
  Theorem 48 recovers the formal-law isomorphism from the full torsion system and uses it to evaluate ordinary
  cooperations. Finite Taylor expansion keeps each evaluation in one finite coefficient stage.
  The resulting compatible cochain maps retain the realized $J$-action through every jet and hence on completed
  homotopy.

===== 1.3.5 The surviving constituent. <the-surviving-constituent.>

After inverting $x$, the four rows are periodicity lines in degrees $0 \,
  1$ and their norm twists in degrees $3 \, 4$. The only possible higher differentials go from a lower line to an
  upper line. The full-unit inequivalence in Lemma 50 makes them zero.
  Together with the finite abutment filtration, this computes the generic diagonal test in every degree
  (Proposition 51): it has dimension two, with one periodicity constituent and one norm-twisted constituent.
  In particular, the term of bidegree $\( s \, t \) = \( 3 \, 0 \)$ gives $Q_x \( delta \)$ in total degree $- 3$.
  Since $S_k$ is finite free over $S$, finite assembly of the original overlap would impose the constituent
  condition on $cal(V)_(- 3) \( Z_k \)$ as well. The norm line violates that condition.

Figure 1 separates the two coefficient comparisons from the descent and representation-theoretic inputs that let
  their output survive in actual homotopy.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Integral marking#linebreak()towers#linebreak()Section~4]]])])
  content((-3, -1.65), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Completed#linebreak()cohomology#linebreak()Theorem~6.10]]])])
  content((3, -1.65), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Split deformation#linebreak()Lemma~9.1]]])])
  content((-3, -3.3), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Ordinary cochains#linebreak()Theorem~7.13]]])])
  content((3, -3.3), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Comparison at all jets#linebreak()Theorem~9.2]]])])
  content((0, -5.1), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Four generic rows#linebreak()Equation~\(10.5\)]]])])
  content((-4.7, -5.9), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite abutment#linebreak()filtration#linebreak()Proposition~8.3]]])])
  content((4.7, -5.9), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Full-unit#linebreak()character exclusion#linebreak()Lemma~10.1]]])])
  content((0, -7.1), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Actual generic#linebreak()homotopy#linebreak()Proposition~10.2]]])])
  content((-4.7, -8.9), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite-assembly#linebreak()detector#linebreak()Proposition~2.2]]])])
  content((0, -8.9), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#2c5d82"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Failure of#linebreak()finite assembly#linebreak()Theorem~1.1]]])])
  line((-0.9091, -0.5), (-2.091, -1.15), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((0.9091, -0.5), (2.091, -1.15), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((-3, -2.15), (-3, -2.8), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((3, -2.15), (3, -2.8), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((-1.074, -3.3), (1.074, -3.3), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((2.167, -3.8), (0.8333, -4.6), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((0, -5.6), (0, -6.6), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((-2.774, -6.392), (-1.926, -6.608), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((2.774, -6.392), (1.926, -6.608), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((0, -7.6), (0, -8.4), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
  line((-2.774, -8.9), (-1.926, -8.9), stroke: (paint: rgb("#2c5d82"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#2c5d82"))))
})],
  caption: [Figure 1: The coefficient comparisons and their passage to homotopy. The full-unit action rules out differentials between the four generic rows; the finite abutment filtration places their constituents in actual homotopy. The finite-assembly detector then excludes the norm constituent. Arrows indicate inputs to the next displayed stage. ],
) <fig:proof-chain>

Section 2 proves the finite-construction test, and Sections 3–4 prepare the stage coefficients and markings.
  Section 5 supplies the finite analytic resolution needed in Sections 6–7.
  Section 8 proves convergence and identifies the ordinary cooperations,
  which Section 9 compares through every jet. Section 10 completes the argument.

== 2 The finite-assembly detector <sec:detector>

We first isolate the representation-theoretic condition imposed by a finite construction from the
  $K \( 2 \)$-local unit. This condition will later be tested on the abutment of the descent spectral sequence.

Throughout the proof, $p = 3$. Fix the finite field $k$ chosen in the introduction.
  Let $Gamma_i$ be the one-dimensional Honda formal group of height $i$,
  in a coordinate with $p$-series $T^(p^i)$, and put

$ D_i = "End" \( Gamma_i \) \[ 1 \/ p \] \, wide P_i = "Aut" \( Gamma_i \) = cal(O)_(D_i)^times \, wide J = P_2 . $

The Honda endomorphism-order description gives the displayed unit group #cite(label("BGHS22")) Example 2.15.
  These are the unextended stabilizer groups, so their actions fix $k$.
  Choose the unramified quadratic subfield $F subset D_2$, and set

$ G_F = cal(O)_F^times \, quad cal(O)_x = k \[ \[ x \] \] \, quad Q_x = k \( \( x \) \) \, quad
  upright(bold(1))_2 = L_(K \( 2 \)) S . $

The symbol $G_F$ denotes this unit group, not an absolute Galois group. Its action on $cal(O)_x$ extends to $Q_x$.

Let $E_2 = E_2 \( k \)$, with $pi_0 E_2 = W \( k \) \[ \[ x \] \]$.
  The marked-lift stabilizer action on its coefficients is described in #cite(label("DH95"), form: "prose")
  Theorem 1.1 and Equation (1.4), and its Morava $E$-theory realization is supplied by
  #cite(label("GH04"), form: "prose") Corollaries 7.6–7.7. We use the cotangent convention for its degree-two
  periodicity line, dual to the degree-minus-two tangent convention in those sources:

$ omega = pi_2 E_2 \, wide Omega = omega \/ p \, wide overline(omega) = Omega ⊗_(cal(O)_x) Q_x . $

Thus $pi_(2 j) E_2 = omega^(⊗ j)$ and odd homotopy vanishes.
  A negative tensor power of a line means the corresponding power of its dual.
  All these lines have their semilinear $J$-action. Unless a relative product is explicitly indicated,
  $and$ denotes the ordinary smash product of spectra.

#thm([Lemma 2.1.])[
  (Reduction modulo $p$).  #emph[Multiplication by $p$ is null as an $E_2$-module map on $E_2 \/ p$.
    For every spectrum $X$, it therefore annihilates the homotopy groups of $L_(K \( 2 \)) \( E_2 and X \) \/ p$.
    Those groups are naturally $cal(O)_x$-modules.]
] <lem:mod-p-nullity>

#proof[
  Regularity of $p$ and evenness of $E_2$ give $pi_1 \( E_2 \/ p \) = 0$.
    Apply $\[ - \, E_2 \/ p \]_(E_2)$ to the cofiber sequence for multiplication by $p$ on $E_2$.
    Restriction along $E_2 arrow.r E_2 \/ p$ gives an injection
  $ \[ E_2 \/ p \, E_2 \/ p \]_(E_2) arrow.r.hook pi_0 \( E_2 \/ p \) . $
  The class $p "id"$ maps to zero and is therefore zero. Tensoring this null map with $X$ and applying exact
    localization proves the assertion. A chosen $J$-equivariant nullhomotopy is not needed:
    the conclusion is the nullity of the module map and the induced action on homotopy. ◻
]

For a spectrum $X$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(T) \( X \) = L_(K \( 2 \)) \( E_2 and X \) \/ p \, wide cal(V)_d \( X \) =
   pi_d cal(T) \( X \) ⊗_(cal(O)_x) Q_x . $ <eq:generic-test>]

The action comes from $E_2$, so every map of underlying spectra induces an equivariant map on this test.
  The action of $G_F$ is semilinear: $g \( a v \) = g \( a \) g \( v \)$ for $a in Q_x$ and $v in
  cal(V)_d \( X \)$. For a character $chi : G_F arrow.r k^times$,
  let $Q_x \( chi \)$ denote the semilinear line with a basis $e_chi$ satisfying $g \( e_chi \) = chi \( g \) e_chi$.

We use these representations algebraically. A subrepresentation is a $G_F$-stable $Q_x$-linear subspace;
  no additional continuity condition is imposed on that subspace.
  Every finite-dimensional semilinear representation has finite length,
  because a strict chain of subspaces has strictly increasing dimensions.
  Its simple constituents are therefore well defined up to isomorphism and multiplicity.

#thm([Proposition 2.2.])[
  (Constituents forced by finite assembly).  #emph[Suppose that $L_(K \( 2 \))
    X$ belongs to the ordinary thick subcategory generated by $upright(bold(1))_2$ in $K \( 2 \)$-local spectra.
    Then, for every $d in bb(Z)$, the representation $cal(V)_d \( X \)$ is finite-dimensional over $Q_x$,
    and each simple constituent is isomorphic to $overline(omega)^(⊗ b)$ for some $b in bb(Z)$.]
] <prop:constituent-test>

#proof[
  Let $cal(A)$ be the full subcategory of finite-dimensional semilinear $G_F$-representations over $Q_x$ whose
    simple constituents have the indicated form. It is a Serre subcategory:
    subobjects and quotients retain their constituents, and the constituents of an extension are those of its two
    ends. It is also closed under finite sums and retracts.
  The functor $cal(T)$ is exact. Localization of modules from $cal(O)_x$ to $Q_x$ is exact and respects the
    semilinear action. An exact triangle $X_1 arrow.r X_2 arrow.r X_3$ consequently gives an exact sequence
  $ cal(V)_d \( X_1 \) arrow.r cal(V)_d \( X_2 \) arrow.r cal(V)_d \( X_3 \) arrow.r
    cal(V)_(d - 1) \( X_1 \) arrow.r cal(V)_(d - 1) \( X_2 \) . $
  If the terms arising from $X_1$ and $X_2$ lie in $cal(A)$ in every degree,
    then $cal(V)_d \( X_3 \)$ is an extension of a subobject of $cal(V)_(d - 1) \( X_1 \)$ by a quotient of
    $cal(V)_d \( X_2 \)$, and hence also lies in $cal(A)$. Rotation gives the same assertion for any choice of two
    terms. The condition is therefore closed under finite sums, shifts, cofibers, and retracts.
  For the local unit, $cal(T) \( upright(bold(1))_2 \) tilde.eq E_2 \/ p$.
    Indeed, $S arrow.r upright(bold(1))_2$ is a $K \( 2 \)$-equivalence,
    tensoring with $E_2$ preserves $K \( 2 \)$-equivalences, and $E_2$ is $K \( 2 \)$-local. Even periodicity gives
  $ cal(V)_(2 j) \( upright(bold(1))_2 \) = overline(omega)^(⊗ j) \, wide
    cal(V)_(2 j + 1) \( upright(bold(1))_2 \) = 0 . $
  The same observation shows that $cal(T) \( X \) tilde.eq cal(T) \( L_(K \( 2 \)) X \)$ for every $X$.
    The condition therefore holds on every object of the ordinary thick subcategory generated by
    $upright(bold(1))_2$, and hence on $X$ as stated. ◻
]

The Proposition proves finite dimensionality as well as the restriction on constituents.
  It uses neither closure under tensoring with arbitrary modules nor an identification of dualizable objects with
  objects in the ordinary thick subcategory. To contradict it,
  the rest of the argument will exhibit one actual simple subquotient that is not a periodicity power.

== 3 Markings, coefficients, and conventions <sec:setup>

The detector in Section 2 gives a condition that any finite construction must satisfy.
  We now prepare the coefficient calculation that will violate it.
  The prime remains $p = 3$, and $k$ is the finite field chosen there,
  containing $bb(F)_(p^6)$ and enlarged finitely when needed to fix the constant identifications.
  Recall the Honda groups $Gamma_i$, their division algebras $D_i$, and their stabilizers $P_i =
  cal(O)_(D_i)^times$. The Honda forms can be chosen over $bb(F)_p$,
  and their endomorphisms are defined over $bb(F)_(p^i)$. Thus $k$ contains both endomorphism fields needed in
  heights two and three. Set

#[#set math.equation(numbering: n => "(3.1)")
 $ P = P_3 \, wide H = ker \( "Nrd" : P arrow.r bb(Z)_p^times \) \, wide J = P_2 . $ <eq:stabilizers>]

The actions below are the unextended stabilizer actions: they fix $k$.
  When Galois descent is involved, it will be handled explicitly rather than included silently in $P$ or $J$.

Choose the unramified quadratic subfield $F subset D_2$. The character used in the obstruction is

#[#set math.equation(numbering: n => "(3.2)")
 $ delta : cal(O)_F^times arrow.r bb(F)_3^times \, wide delta \( g \) =
   overline(N_(F \/ bb(Q)_3) \( g \)) . $ <eq:norm-character>]

It is nontrivial because the residue-field norm $bb(F)_9^times arrow.r bb(F)_3^times$ is surjective.
  Its inverse and its unramified Galois conjugate are equal to it.

We also use

$ H' = "Nrd"^(- 1) \( mu_2 \) \, wide H' \/ H = mu_2 \, wide P \/ H' tilde.equiv 1 + 3 bb(Z)_3 tilde.equiv bb(Z)_3 . $

Here the reduced norm on maximal-order units is surjective.
  For these particular algebras, one may see this on the units of an unramified maximal subfield:
  the residue norm is surjective, and the norm on principal units is surjective by the trace and the $3$-adic
  logarithm. No group section of the full reduced norm is needed.

=== 3.1 The one-parameter stratum <the-one-parameter-stratum>

We first fix the coordinate normalization behind the Hasse coefficients.
  Lubin–Tate construct a universal deformation from a normalized representative of the special fibre
  #cite(label("LT66")) Proposition 1.1, p. 50, and Theorem 3.1.
  On the stratum where the preceding parameters vanish, their parameter $tau_r$, with $q = p^r$, occurs as

$ Phi \( X \, Y \) equiv X + Y + tau_r C_q \( X \, Y \) med \( mod med upright("total degree ") q + 1 \) \, wide
  C_q \( X \, Y \) = frac(\( X + Y \)^q - X^q - Y^q, p) . $

The expression defining $C_q$ is the integral polynomial used in #cite(label("Lazard55"), form: "prose")
  equations (2.4)–(2.5), p. 256. Iterating the group law $p$ times and reducing in characteristic $p$ gives

$ \[ p \]_Phi \( T \) & equiv tau_r sum_(j = 1)^(p - 1) C_q \( j T \, T \)\
 & = tau_r frac(p^q - p, p) T^q equiv - tau_r T^q med \( mod med T^(q + 1) \) . $

Thus the raw successive Hasse coefficient in that normalized representative is $- tau_r$.

The Honda coordinate was already fixed in Section 2. Choose the special-fibre coordinate isomorphism from the
  normalized representative to that Honda law and transport the universal family along it.
  Write $lambda_h in k^times$ for its linear coefficient in height $h$.
  The normalization preceding Lubin–Tate Proposition 1.1 uses an isomorphism over the original residue field.
  Since the height-two Honda law is defined over $bb(F)_9$, we perform that construction already there,
  so $lambda_2 in bb(F)_9^times$. This transport makes the special fibre literally the chosen Honda law,
  so its $p$-series is still $T^(p^h)$. Under a coordinate change $T' = c T + O \( T^2 \)$,
  the first nonzero coefficient at $T^(p^r)$ becomes $c^(1 - p^r)$ times the old coefficient.
  We therefore name the height-three parameters

$ a = - lambda_3^(1 - p) tau_1 \, wide t = - lambda_3^(1 - p^2) tau_2 \, $

and name the height-two parameter $x = - lambda_2^(1 - p) tau_1$. These are unit rescalings of regular parameters.
  In the transported families the first raw Hasse coefficient is exactly $a$,
  the next one modulo $a$ is exactly $t$, and the first height-two coefficient is exactly $x$.
  These are chosen coordinate normalizations, rather than identities independent of a coordinate.
  In the Lubin–Tate representative itself they read $a = - tau_1$, $t = - tau_2$, and $x = - tau_1$.

We choose the mixed-characteristic height-two parameter compatibly.
  Lift the chosen height-two coordinate isomorphism coefficientwise to $W \( bb(F)_9 \)$;
  its linear coefficient remains a unit. Transport the mixed-characteristic Lubin–Tate family along this lift.
  The resulting family over $W \( bb(F)_9 \) \[ \[ tau_1 \] \]$ has a regular parameter lifting this $x$:
  multiply $tau_1$ by a lift of the nonzero constant $- lambda_2^(1 - p)$.
  We denote the lift by $x$ as well and use the scalar-extended family over $W \( k \) \[ \[ x \] \]$ for
  $E_2 \( k \)$. Functorial Morava $E$-theory realization #cite(label("GH04")) Section 7 and Corollary 7.7
  supplies the map from $E_2 \( bb(F)_9 \)$ to $E_2 \( k \)$;
  its coefficient map sends the chosen regular parameter $x$ to $x$.
  This convention will be used in the completion comparison in Section 8.

Let

$ A = k \[ \[ a \, t \] \] $

be the universal equal-characteristic deformation ring of $Gamma_3$ in this normalization #cite(label("LT66"))
  Theorem 3.1. Let $cal(G)$ denote the associated algebraic $p$-divisible group over $A$.

We specify the order of construction, since it matters after $t$ is inverted.
  The formal multiplication-by-$p^r$ series over $A$ is distinguished of degree $p^(3 r)$.
  Weierstrass preparation gives its finite flat kernel over $A$;
  the formal group law supplies its group structure. These kernels, with their compatible inclusions,
  form $cal(G)$. This is the finite-torsion construction over a complete local base in
  #cite(label("Tate67"), form: "prose") Section 2.2, Proposition 1.
  This equivalence also transfers universality to the algebraic family.
  Let $B$ be a complete Noetherian local $k$-algebra with residue field $k$,
  and let $H \/ B$ be a marked deformation of $Gamma_3 \[ p^oo \]$. For $Q_r = cal(O) \( H \[ p^r \] \)$, the algebra

$ Q_r \/ frak(m)_B Q_r tilde.equiv k \[ T \] \/ \( T^(p^(3 r)) \) $

is local. Since $Q_r$ is finite over $B$, every maximal ideal lies over $frak(m)_B$,
  so $Q_r$ is local and $H$ is connected in Tate’s sense. The inverse equivalence gives a formal group of
  dimension one, as on the closed fibre; a coordinate lifting the marking makes it a Lubin–Tate deformation.
  Full faithfulness identifies its marked isomorphisms #cite(label("Tate67")) Section 2.2, Proposition 1,
  and Section 2.3. The prepared finite kernels commute with local base change.
  Hence Lubin–Tate universality transfers to the above algebraic $cal(G) \/ A$,
  supplying the universality used by the later Kodaira–Spencer argument #cite(label("LT66")) Theorem 3.1 and
  paragraph 3.2. We then pull this finite torsion system back along

$ A arrow.r K = k \( \( t \) \) \, wide a mapsto 0 . $

On this stratum the $p$-series factors through the $p^2$-power Frobenius,
  and the remaining homomorphism has invertible linear coefficient $t$.
  Thus $cal(G)_K$ has a connected part of height two and an étale quotient of height one.
  Forming only the formal completion at the identity after this base change would discard the latter quotient.

The ring-theoretic differential statement needed later is elementary in these coordinates.

#thm([Lemma 3.1.])[
  #emph[The ordinary module $Omega_(A \/ k)^1$ is free on $d a \,
    d t$ and agrees with the module of continuous differentials.
    The element $t$ is a $p$-basis of $K$, remains a $p$-basis at each finite separable field extension of $K$,
    and gives $Omega_(L \/ k)^1 = L thin d t$ for the marking algebra defined below.]
] <lem:finite-p-basis>

#proof[
  Since $k$ is perfect, every $f in A$ has a unique expansion
  $ f = sum_(0 lt.eq i \, j < p) a^i t^j f_(i j)^(thin p) \, wide f_(i j) in A . $
  Ordinary derivations therefore have the usual partial-derivative formula and are determined freely by the values
    of $a \, t$. The continuous partial derivatives show that these values are independent.
    This proves the assertion for $A$. The corresponding one-variable expansion proves the assertion for $K$.
    A $p$-basis is preserved by a separable algebraic extension:
    Frobenius base change along a separable extension is an isomorphism,
    so the basis of $K$ over $K^p$ remains a basis after that base change.
    The differential statement follows by the same argument. For a finite étale algebra it holds on each field
    factor, and it passes to the filtered union defining $L$. ◻
]

The universal deformation theory of $p$-divisible groups gives a functorial Kodaira–Spencer isomorphism over $A$
  #cite(label("Lau10")) Section 5; the version over arbitrary square-zero target rings is recalled where it is
  used in Proposition 33 and Theorem 48. Lemma 4 explains why the ordinary algebraic differentials in that theorem
  are available after specializing to the Laurent field $K$.

=== 3.2 The connected marking tower <the-connected-marking-tower>

The connected-marking tower is the coheight-one construction studied by Gross and Torii #cite(label("Gross79"))
  Theorem 3.5(1a) #cite(label("Torii03")) Section 2.3 and Theorem 2.9.
  In Torii’s Laurent-field setting the lower-height stabilizer acts simply transitively on markings and commutes
  with the higher-height action. We use the ind-étale torsor form, allowing products of fields at finite stages,
  and prove the integral étale marking and finite-level descent needed below.

Let $L$ be the algebra classifying isomorphisms between the connected formal law of $cal(G)_K$ and the constant
  Honda formal group $Gamma_2$. Its coefficient construction and separability are proved in Section 4.
  The marking space is a pro-étale torsor under the pro-constant group $J$. We write

#[#set math.equation(numbering: n => "(3.3)")
 $ L = "colim"_(U subset J) L^U \, $ <eq:marking-algebra>]

where $U$ runs through open subgroups and $L^U$ is the finite étale $K$-algebra of markings modulo $U$.
  The superscript is compatible with the $J$-action on the tower. The finite stages need not be fields.

The height-three stabilizer $P$ acts on the universal deformation and preserves its height strata
  #cite(label("LT66")) Proposition 3.3 and paragraph 3.4. It also transports a connected marking.
  Changes of the connected marking give the commuting $J$-action.
  Thus $P$ preserves each $L^U$, while $J$ carries stages to the corresponding conjugate stages.
  The actions on finite jets and their étale lifts are continuous.
  Normalize the valuation of $K$ by $v \( t \) = 1$, extend it to each field factor of $L^U$,
  and give a product of factors its product topology. The $P$-action preserves these valuations,
  since its action on the height-two stratum takes $t$ to a unit multiple of $t$.

For a finite stage $B = L^U$, put

$ B_e = B^(1 \/ p^e) \, wide B^(upright("perf")) = union.big_(e gt.eq 0) B_e \, wide B^flat =
  hat(B^(upright("perf"))) . $

Roots are taken inside the perfection and all valuations are extended from $B$. Each $B_e$ is complete.
  The symbol $B^flat$ in this paper means the #emph[completed perfection of this finite stage];
  it does not denote the completion of the entire marking tower. The other perfection used throughout the proof is

$ R = L^(upright("perf")) = "colim"_(U \, e) \( L^U \)^(1 \/ p^e) . $

These conventions are applied factorwise to products of fields.

=== 3.3 Continuous cochains at finite stages <continuous-cochains-at-finite-stages>

We use inhomogeneous continuous group cochains. If a compact group $Q$ acts continuously on a complete coefficient
  module $M$, then $C_(upright("cts"))^s \( Q \, M \) = "Map"_(upright("cts")) \( Q^s \, M \)$,
  with the usual bar differential. An extra compact profinite parameter space $T$ means

$ C_(upright("cts"))^s \( Q \, M \; T \) = "Map"_(upright("cts")) \( T times Q^s \, M \) \; $

the differential leaves $T$ fixed. The parameter space need not be metrizable.

#prodef([Definition 3.2.])[
  (Stage cochains).  For $Q = P \, H \, H'$, or a closed subgroup of one of these groups,
    cochains with the incomplete coefficients $L$ and $R$ mean
  #[#set math.equation(numbering: n => "(3.4)")
   $ C_(upright("cts"))^s \( Q \, L \; T \) & := "colim"_U "Map"_(upright("cts")) \( T times Q^s \, L^U \) \,\
C_(upright("cts"))^s \( Q \, R \; T \) & := "colim"_(U \, e)
  "Map"_(upright("cts")) \( T times Q^s \, \( L^U \)^(1 \/ p^e) \) . $ <eq:stage-cochains>]
  We also use the completed-stage complex
  #[#set math.equation(numbering: n => "(3.5)")
   $ "colim"_U C_(upright("cts"))^bullet \( Q \, \( L^U \)^flat \; T \) . $ <eq:completed-stage-cochains>]
  All filtered colimits in these definitions are taken degreewise. Omitting $T$ means that $T$ is a point.
] <def:stage-cochains>

Thus each element of one of the complexes in Definition 5 has its values in a single complete finite marking or
  root stage. We do not identify this convention with all continuous maps into an incompletely topologized union.
  The algebraic inclusion $L arrow.r R$, and the inclusions of finite root stages into their completed
  perfections, give natural maps between these complexes. They retain the $P$- and $J$-actions on the full
  directed systems. A proof may restrict to cofinally many stages containing specified finite data;
  the maps themselves are defined before that restriction.

The use of parameters is part of each comparison theorem below.
  It supplies the iterated cochains for quotient descent and the continuous function coefficients of Morava
  cooperations. On a discrete target, compactness makes continuous functions locally constant with finite image.
  On a complete valuation target it instead gives uniform approximation on finite clopen partitions;
  the distinction will be used in Section 7.

=== 3.4 Geometric notation <geometric-notation>

For a perfectoid base in characteristic $p$, let $V_i$ denote the basic vector bundle of rank $i$ and degree one
  on the relative Fargues–Fontaine curve. The notation

$ N = H^1 \( V_2^or \) \, wide N^(*) = N \\ { 0 } $

means the associated cohomology sheaf and its complement of the zero section on the relevant $v$-site.
  Relative section-sheaf statements, rather than just statements about individual geometric fibers,
  will be used in Section 4. Over an algebraically closed perfectoid field $C^flat$,
  a choice of untilt $C$ gives the concrete presentation of $N^(*)$ used for the analytic calculation.
  Base Frobenius is defined before this choice.

The height-two Morava theory and its periodicity line used by the homotopy test were fixed in Section 2.
  The height-three theory will enter after the ordinary coefficient calculation is complete.

== 4 The marking towers and their determinant normalization <sec:towers>

The calculation uses two kinds of marking on the height-two stratum of a height-three deformation.
  A connected marking identifies its formal group with a Honda group.
  An #emph[integral] étale marking chooses a generator of the Tate module of its étale quotient.
  The distinction matters: the first has structure group $J = cal(O)_(D_2)^times$,
  whereas the automorphism group of the corresponding vector bundle is $D_2^times$.
  Theorem 13 gives the quotient comparison; Lemmas 15 and 16 retain its normalized integral marking and identify
  the lift algebras. In this section write $G = cal(G)$ for the algebraic $p$-divisible group fixed in Section 3.

Put

$ d = p^2 \, wide q = p^3 \, wide A_2 = A \/ \( a \) = k \[ \[ t \] \] . $

We use Honda coordinates in which $\[ p \]_(Gamma_i) \( T \) = T^(p^i)$.
  For an affinoid perfectoid $k$-algebra $\( C \, C^(+) \)$, let

$ cal(H)_i \( C \, C^(+) \) = C^(compose compose) \, $

with addition given by $Gamma_i$. Since $C$ is perfect and $\[ p \]$ is the $p^i$-power map,
  $cal(H)_i$ is a sheaf of $bb(Q)_p$-vector spaces. All complements of zero in this section mean nonzero on every
  geometric fiber. The arguments below concern the characteristic-$p$ perfectoid site over $k$.

=== 4.1 Finite torsion algebras <finite-torsion-algebras>

We first retain the entire $p$-divisible group $G$, including the part that becomes étale after $t$ is inverted.
  Its finite kernels are formed over $A$ by Weierstrass preparation and then base changed.
  Thus, on $A_2$, the algebra of $G \[ p^l \]$ is the prepared finite algebra of $\[ p^l \] \( T \)$;
  it has rank $p^(3 l)$. Formal completion at the identity is not taken after passage to $K$.

#thm([Lemma 4.1.])[
  (Primitive torsion coordinates).  #emph[For $l gt.eq 1$, let $cal(B)_l$ be the reduced closure, over $A_2$,
    of the points of $G \[ p^l \]_K$ whose images generate the étale quotient.
    Write $s_l$ for its point coordinate and set $s_j = \[ p^(l - j) \] \( s_l \)$ for $1 lt.eq j lt.eq l$. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ cal(B)_l = k \[ \[ s_l \] \] \, wide cal(C)_l := k \[ \[ t \] \] \[ s_l^(d^l) \] =
   k \[ \[ s_l^(d^l) \] \] . $ <eq:primitive-rings>]

 The algebra $cal(C)_l \[ 1 \/ t \]$ is the finite étale algebra of generators of $G_K^(upright("et")) \[ p^l \]$.
   Over it, the algebra of #emph[all] lifts of the universal generator is $cal(B)_l \[ 1 \/ t \]$,
   finite free of rank $d^l$. The transition maps are finite and injective, and
#[#set math.equation(numbering: n => "(4.2)")
 $ s_j in k \[ \[ s_l^(d^(l - j)) \] \] wide \( l gt.eq j \) . $ <eq:primitive-transitions>]

]
] <lem:primitive-coordinates>

#proof[
  Define the closure as the image of the finite $A_2$-algebra of $p^l$-torsion in the reduced generic algebra of
    the indicated primitive locus. It is finite and reduced, every component dominates $"Spec" A_2$,
    and its closed fiber is supported at $s_l = 0$. It is therefore a complete local ring with residue field $k$,
    dimension one, and maximal ideal $\( t \, s_l \)$. The element $s_1$ is nonzero on every generic component.
  The series $\[ p \] \( T \)$ factors through $T^d$, and its reduction at $t = 0$ is $T^q$.
    Its coefficient of $T^d$ is $t$. Dividing $\[ p \] \( s_1 \) = 0$ by $s_1^d$ in the reduced generic algebra gives
  $ t thin u \( s_1^d \, t \) + s_1^(q - d) = 0 \, wide u \( 0 \, t \) = 1 . $
  Here $u$ is a unit power series. This identity holds in the closure by generic density.
    It also holds in the complete finite subalgebra $cal(C)_l$:
    the series for $\[ p^(l - 1) \]$ factors through $T^(d^(l - 1))$,
    so $s_1^d$ is a series in $t$ and $s_l^(d^l)$ with zero constant term in the latter variable.
    Since $q - d gt.eq d$, the identity puts $t$ in the ideal $\( s_l^(d^l) \)$ of $cal(C)_l$.
    Its maximal ideal is consequently generated by $s_l^(d^l)$.
    Its dimension is one because it is integral over $A_2$. The surjection $k \[ \[ W \] \] arrow.r.twohead
    cal(C)_l$, $W mapsto s_l^(d^l)$, is an isomorphism: a nonzero ideal in $k \[ \[ W \] \]$ would lower
    dimension. The same argument, now with generator $s_l$, proves the first identity in (4.1).
    These are identifications of the inclusion $cal(C)_l subset cal(B)_l$, not just abstract regularity assertions.
  Write $\[ p^l \] \( T \) = g_l \( T^(d^l) \)$ and prepare $g_l$.
    The linear coefficient of $g_l$ is a unit multiple of $t^(1 + d + dots.h.c + d^(l - 1))$.
    The invariant-differential identity for this Frobenius-divided homomorphism shows that its derivative,
    in its prepared kernel algebra, is that coefficient times a unit.
    After inverting $t$ the prepared algebra is therefore étale, of rank $p^l$.
    Its kernel before dividing by Frobenius has connected rank $d^l$.
    The primitive images are distinguished exactly by $s_l^(d^l)$,
    so their generator algebra is $cal(C)_l \[ 1 \/ t \]$.
  The scheme of lifts of this generator is finite locally free of rank $d^l$.
    Its coordinate algebra surjects onto $cal(B)_l \[ 1 \/ t \]$ by the same point coordinate.
    But (4.1) makes the latter free of rank $d^l$ over $cal(C)_l \[ 1 \/ t \]$, with basis $1 \, s_l \, dots.h \,
    s_l^(d^l - 1)$. The surjection is an isomorphism. In particular,
    reduction in the definition of the closure has not removed any infinitesimal part of the lift scheme on the
    exact-height locus.
  Every primitive étale generator at level $j$ lifts at level $l$ after a geometric extension.
    The generic transition is consequently surjective on spectra and injective on the reduced coordinate algebras;
    generic density gives injectivity on the closures. The transition is finite because $cal(B)_l$ is finite over
    $A_2$. Finally, $\[ p^(l - j) \] \( T \)$ factors through $T^(d^(l - j))$.
    Substituting the expression for $t$ in $k \[ \[ s_l^(d^l) \] \]$ proves (4.2). ◻
]

The connected marking algebra $L$ has a different construction.
  Height classification gives an isomorphism of the formal law of $G_K$ with $Gamma_2$ over an algebraic closure
  #cite(label("Lazard55")) Theorem IV. In fact its coefficients are separable over $K$.
  Write the isomorphism as $f \( T \) = sum_(n gt.eq 1) b_n T^n$ and compare $f \( \[ p \] \( T \) \) =
  f \( T \)^d$. At degree $n d$ this gives

$ b_n^d - t^n b_n = Q_n \( b_1 \, dots.h \, b_(n - 1) \) \, $

where $Q_n$ has coefficients in $K$. This polynomial in $b_n$ has derivative $- t^n eq.not 0$.
  The first equation is $b_1^(d - 1) = t$ with $b_1 eq.not 0$.
  Induction puts every coefficient in a finite separable extension,
  so the entire isomorphism is defined over a separable closure. Its inverse has the same property.
  These successive finite separable coefficient equations, with the formal-law identities imposed,
  construct the isomorphism torsor by finite étale jet algebras.
  Its automorphisms are the constant Honda group $J$. Thus

$ L = "colim"_(U subset J) L^U $

is an ind-étale $J$-torsor over $K$, with $U$ ranging over open subgroups.
  This also gives the exact-height marking description recalled in Section 3;
  see the coheight-one marking algebra in #cite(label("BMR26")) Section 2.7.
  Finite products of fields are allowed at each stage. The action of $P$ transports the deformation and its
  connected marking, and the action of $J$ changes that marking.
  They commute, fix $k$, and preserve the valuation normalized by $v \( t \) = 1$.
  In particular every $L^U$ is $P$-stable. All actions on finite coefficient data are continuous for the valuation
  topology.

=== 4.2 The normalized coordinate limit <the-normalized-coordinate-limit>

The following explicit comparison will also ensure that the frame identification is integral.
  Let $G_t$ be a specialization of the formal law on $A_2$ to an affinoid perfectoid $k$-algebra
  $\( C \, C^(+) \)$, with $t in C^(compose compose)$. Write $P_t \( T \) = \[ p \]_(G_t) \( T \)$.

#thm([Lemma 4.2.])[
  (Universal-cover coordinates).  #emph[There is a natural additive isomorphism
$ Phi_t : cal(H)_3 \( C \, C^(+) \) arrow.r^(med tilde.op med) "proj lim"_(\[ p \]) G_t \( C^(compose compose) \) . $

 Its coordinates and inverse are
#[#set math.equation(numbering: n => "(4.3)")
 $ Phi_t \( z \)_j = lim_(r arrow.r oo) P_t^(compose r) #scale(x: 120%, y: 120%)[\(] z^(1 \/ q^(j + r))
   #scale(x: 120%, y: 120%)[\)] \, wide Phi_t^(- 1) \( \( b_j \) \) = lim_(j arrow.r oo) b_j^(q^j) . $ <eq:cover-limit>]

 The isomorphism is $bb(Q)_p$-linear and is compatible with coefficient maps and changes of deformation frame.
   On an algebraically closed perfectoid field, the zeroth projection is surjective and its kernel is the integral
   Tate module of $G_t^(upright("et"))$.]
] <lem:cover-coordinates>

#proof[
  Use the spectral norm and choose $lambda < 1$ bounding $\| t \|$.
    The coefficients of $P_t \( T \) - T^q$ and of $G_t - Gamma_3$ have norm at most $lambda$.
    Integral power series are $1$-Lipschitz on the open unit ball, and factorization through $T^d$ gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| P_t^(compose r) \( v \) - P_t^(compose r) \( w \) \| lt.eq \| v - w \|^(d^r) . $ <eq:cover-contraction>]
  Successive approximations in the first formula in (4.3) differ by at most $lambda^(d^r)$.
    They therefore converge; their limits are topologically nilpotent and satisfy
  $ \| Phi_t \( z \)_j - z^(1 \/ q^j) \| lt.eq lambda \, wide P_t \( Phi_t \( z \)_(j + 1) \) = Phi_t \( z \)_j . $
  For a compatible sequence $\( b_j \)$, consecutive normalized coordinates differ by at most $lambda^(q^j)$.
    Hence its displayed inverse exists and satisfies
  $ \| z - b_j^(q^j) \| lt.eq lambda^(q^j) . $
  After taking the relevant root this error is at most $lambda$; applying (4.4) makes it tend to zero.
    This proves one inverse identity. Raising the first displayed estimate to $q^j$ proves the other.
    No common upper bound strictly less than one for all the individual $\| b_j \|$ is required.
  The coefficients of $Gamma_3$ are fixed by $q$-power Frobenius.
    The discrepancy between the specialized addition law and the Honda addition law is bounded by $lambda$;
    after normalization, or after $r$ applications of $P_t$, it tends to zero by the same estimates.
    Thus the formulas respect addition. A change of deformation frame differs from its Honda reduction by
    topologically small coefficients. Its Honda reduction commutes with $q$-power Frobenius,
    since its coefficients lie in $bb(F)_(p^3)$. The identical estimate proves frame equivariance.
    The maps commute with integral multiplication and with inverse multiplication by $p$, so are $bb(Q)_p$-linear.
    Continuity, including continuous scalar families, follows from uniform convergence on smaller balls.
  Over an algebraically closed field, preparation applied to $P_t \( T \) -
    w$ gives a monic polynomial whose roots are small whenever $w$ is small.
    Choosing roots successively proves surjectivity of the zeroth projection.
    Its kernel consists of compatible $p^j$-torsion points. Connected finite groups have only the identity as a
    point over a perfect field, so this kernel is precisely the Tate module of the étale quotient. ◻
]

Let $X$ be the completed perfection of the punctured formal $t$-disc, equivalently $"Spa" \( K^flat \)$.
  Let $cal(T)_(upright("et")) arrow.r X$ be the tower of integral étale Tate generators.
  By Lemma 6, it is the perfected inverse tower of the primitive-coordinate spaces on $t eq.not 0$.

#thm([Proposition 4.3.])[
  (Comparison of the entire generator tower).  #emph[There is a natural $P times bb(Z)_p^times$-equivariant isomorphism
#[#set math.equation(numbering: n => "(4.5)")
 $ cal(T)_(upright("et")) tilde.eq cal(H)_3 \\ { 0 } \, wide \( s_l \) mapsto z =
   lim_l s_l^(q^l) . $ <eq:generator-ball>]

 It identifies completed function algebras, with their spectral norms, on an exhaustion by smaller closed balls.
   The assertion commutes with base change and remains valid after adjoining any compact profinite parameter space.]
] <prop:generator-ball>

#proof[
  Retain the reduced closures from Lemma 6, including their point at $t = 0$.
    After perfection, a point of the étale quotient has a unique lift through the connected factor.
    The resulting inverse tower is thus the tower of the rings $cal(B)_l$.
  We check its complete algebras after extension to an algebraically closed perfectoid field $C$ of characteristic
    $p$. Fix $0 < rho < 1$ in its value group and put $y_l = s_l^(q^l)$.
    At level $l$ take the closed disc $\| y_l \| lt.eq rho$. At a point of this disc, write $lambda = \| t \|$.
    The proof of Lemma 6 at level one, and finite telescoping of normalized coordinates, give
  $ lambda lt.eq \| s_1 \|^d \, wide \| s_1 \| lt.eq max \( rho^(1 \/ q) \, lambda \) . $
  If $lambda > rho^(1 \/ q)$ these inequalities would imply $0 < lambda lt.eq lambda^d < lambda$. Consequently
  #[#set math.equation(numbering: n => "(4.6)")
   $ lambda lt.eq rho^(d \/ q) \, wide \| y_(l + 1) - y_l \| lt.eq lambda^(q^l) lt.eq
     rho^(d q^(l - 1)) < rho . $ <eq:generator-radius>]
  The finite transition maps preserve these discs. Conversely,
    every geometric point of a level-$l$ disc has a lift by finite surjectivity,
    and the strict inequality in (4.6) forces its lifts to remain in the next disc.
    Pullback is therefore isometric for the spectral norm, also after completed perfection.
  In the completion of the direct limit of these perfected Gauss algebras, $y_l$ converges to $z$.
    Send the coordinate of the perfected radius-$rho$ disc to $z$. The resulting homomorphism is isometric:
    for a polynomial in finitely many fractional powers, evaluation at $y_l$ has exactly its Gauss norm,
    since $s_l$ is a free disc coordinate and $q^l$ is a power of $p$.
    These evaluations converge to evaluation at $z$. For a nonzero polynomial,
    their difference is eventually smaller than its fixed norm, so the limiting norm is the same.
    Completion preserves this isometry.
  The image is dense. For $l gt.eq j$, write $s_j = F_(j \, l) \( s_l^(d^(l - j)) \)$ as in (4.2),
    with $F_(j \, l) in k \[ \[ T \] \]$. Replacing $s_l$ by $z^(1 \/ q^l)$ changes this expression by at most
  $ lambda^(d^(l - j)) lt.eq rho^(\( d \/ q \) d^(l - j)) \, $
  which tends to zero with $l$. The substituted series converges on the $z$-disc.
    The same approximation after taking roots proves that every $s_j$ and each of its $p$-power roots belongs to
    the closed image. These generate the completed limit algebra. The isometry is therefore onto.
  Here is the relative descent explicitly. Let $E = accent(k \( \( u \) \)^(upright("perf")), ̂)$,
    with $u$ an auxiliary variable, and choose $C = hat(overline(E))$.
    For an affinoid perfectoid test $S = "Spa" \( A \, A^(+) \)$,
    a pseudouniformizer $pi in A^(+)$ and its unique compatible roots give a continuous map $E arrow.r A$,
    $u mapsto pi$. The field extension $"Spa" \( C \, C^compose \) arrow.r
    "Spa" \( E \, E^compose \)$ is a $v$-cover, so its base change
  $ S_C = S times_("Spa" \( E \, E^compose \)) "Spa" \( C \, C^compose \) arrow.r S $
  is a $v$-cover. The calculation over $C$ established an isomorphism of complete algebras,
    hence of perfectoid spaces, on every smaller disc. It therefore applies to all $C$-tests, including $S_C$,
    rather than only to geometric points. The coordinate map is defined over $k$;
    its inverse over this cover is unique and agrees on the Čech overlap, so it descends to $S$.
    This uses base change of an established isomorphism, not preservation of a spectral isometry by an arbitrary
    completed tensor product. Smaller discs exhaust the comparison:
    on a quasicompact test $t$ is uniformly small, and the first torsion coordinate and (4.6) bound all normalized
    coordinates uniformly away from radius one.
  It remains to identify the puncture. If $z = 0$ on a geometric fiber, Lemma 7 gives $\| s_l \| lt.eq
    lambda$ for all $l$. For fixed $j$,
  $ \| s_j \| = \| P_t^(compose \( l - j \)) \( s_l \) \| lt.eq lambda^(d^(l - j)) arrow.r 0 . $
  Thus all $s_j$ vanish, and the primitive-coordinate equation forces $t = 0$.
    Conversely, at $t = 0$ the reduced torsion coordinates vanish.
    Removing these corresponding zero loci gives (4.5). Equivariance is the frame and scalar equivariance of
    Lemma 7. Every estimate used a uniform spectral norm; taking the supremum over a compact profinite parameter
    preserves each estimate and each density argument. ◻
]

=== 4.3 Relative bundles and integral frames <relative-bundles-and-integral-frames>

We spell out the vector-bundle results used in the comparison.
  For a perfectoid test $S$, write $X_S$ for its relative Fargues–Fontaine curve.
  Relative cohomology means the associated sheaf on the $v$-site;
  it does not posit a morphism of schemes $X_S arrow.r S$. The bundles $V_i$ are the Honda forms of rank $i$ and
  degree one.

#thm([Lemma 4.4.])[
  (Relative section facts).  #emph[There are natural isomorphisms of additive sheaves
$ cal(H)_i tilde.eq cal(H)^0 \( V_i \) \, wide cal(H)^0 \( cal(O) \) = underline(bb(Q)_p) . $

 The automorphism sheaf of $V_i$ is the locally profinite group $D_i^times$.
   A family fiberwise isomorphic to $V_i$ is locally of that form on the perfectoid site.
   Trivial bundles and these positive basic bundles have no higher relative cohomology sheaves.
   For such bundles, $underline(bb(Q)_p)$-linear maps between the section sheaves are exactly the maps of bundles,
   relatively and compatibly with base change.]
] <lem:relative-section-facts>

#proof[
  The Lubin–Tate universal-cover description of sections of $cal(O) \( 1 \)$ is #cite(label("FS21"))
    Proposition II.2.2. Applying it with the unramified coefficient field of degree $i$ and pushing forward gives
    $cal(O) \( 1 \/ i \) = V_i$ and the Honda height-$i$ cover.
    The positive-section calculation, including the perfected-ball description,
    is also #cite(label("FS21")) Proposition II.2.5. The classification on geometric curves and the relative
    pure-family theorem give the stated local forms and automorphisms;
    see #cite(label("FS21")) Theorems II.2.14 and II.2.19. Equivalently,
    the basic stratum is the classifying stack of the corresponding division-algebra group #cite(label("FS21"))
    Theorem III.4.5. The Honda forms are defined over our $k$:
    commuting with $\[ p \] \( T \) = T^(p^i)$ puts every coefficient of a geometric Honda endomorphism in
    $bb(F)_(p^i) subset k$.
  For precision about maps, let $tau$ denote the morphism of sites used for relative curve cohomology.
    Anschütz–Le Bras prove that
  $ R tau_(*) : "Perf" \( X_S \) arrow.r D \( S_v \, underline(bb(Q)_p) \) $
  is fully faithful for every small $v$-stack $S$ #cite(label("ALB25")) Corollary 3.11.
    The same section calculation gives $R tau_(*) cal(O) = underline(bb(Q)_p)$ and $R tau_(*) V_i =
    tau_(*) V_i \[ 0 \]$; the latter uses positivity. Taking degree-zero morphisms in this fully faithful functor
    proves the last assertion. These statements are relative on $S$,
    so they apply over the finite-field base site and to forms obtained by descent.
    In particular, the assertion about $cal(O)$ is vanishing of its higher #emph[relative sheaves],
    not an assertion of vanishing on every unrefined test object. ◻
]

#thm([Lemma 4.5.])[
  (The two stable-bundle tests).  #emph[A section of $V_3$ nonzero on every geometric fiber gives a subbundle
    $cal(O) arrow.r.hook V_3$ with quotient locally isomorphic to $V_2$. Conversely, an extension
#[#set math.equation(numbering: n => "(4.7)")
 $ 0 arrow.r cal(O) arrow.r E arrow.r V_2 arrow.r 0 $ <eq:basic-extension>]

 has middle bundle fiberwise $V_3$ if and only if its extension class is nonzero on every geometric fiber.
   Moreover, $cal(H)^0 \( V_2^or \) = 0$.]
] <lem:stable-bundle-tests>

#proof[
  Work first on a geometric curve. The saturation of the image of a nonzero section $cal(O) arrow.r
    V_3$ is a line bundle of nonnegative integral degree. Stability of $V_3$ bounds that degree by $1 \/ 3$,
    so it is zero. The section has no zeros, since a nonzero effective divisor has positive degree.
    Its quotient has rank two and degree one. A quotient of that quotient of nonpositive slope would also be a
    quotient of $V_3$, contrary to semistability. Its slopes are therefore positive.
    The classification of vector bundles, and integrality of the degree of each stable summand,
    force the quotient to be $V_2$.
  An extension (4.7) has no negative-slope quotient, since neither end has a nonzero map to a negative-slope
    bundle. If it has a slope-zero quotient, that quotient receives a nonzero map from the kernel $cal(O)$,
    because $"Hom" \( V_2 \, cal(O) \) = 0$. The quotient is a sum of copies of $cal(O)$;
    compose with a linear functional nonzero on that kernel image and rescale.
    This gives a retraction onto the kernel, so the extension splits.
    A nonsplit extension thus has only positive slopes. A positive bundle of rank three and degree one can have
    only the stable type $V_3$. The converse is immediate from stability.
    The asserted vanishing is the negative-slope section vanishing.
  These arguments use the degree and slope classification on a geometric Fargues–Fontaine curve
    #cite(label("FS21")) Proposition II.2.10 and Theorem II.2.14.
    Fiberwise surjectivity is the relative subbundle condition;
    the local forms in Lemma 9 and descent give the corresponding relative statements. ◻
]

Let

$ tilde(X) = "proj lim"_U "Spa" \( \( L^U \)^flat \) $

be the perfected completed connected-marking tower. This notation does not replace the finite-stage coefficient
  convention of Definition 5 by cochains on a completion of the whole tower.

#thm([Proposition 4.6.])[
  (Integral frame comparison).  #emph[There exists a determinant identification $iota :
    det V_3 arrow.r^tilde.op det V_2$ over $k$ for which the following conclusions hold.
    Fix such an identification for the sequel. There is an isomorphism
#[#set math.equation(numbering: n => "(4.8)")
 $ tilde(X) tilde.eq "Surj" \( V_3 \, V_2 \) . $ <eq:connected-surjections>]

 A surjection has a unique kernel frame for which its determinant identification is $iota$.
   Under (4.8), this is an integral étale Tate generator for the corresponding deformation.
   The source-frame group $P$ acts by reduced norm on this normalization,
   and a target-frame change in $J$ has its corresponding constant determinant adjustment.]
] <prop:integral-frames>

#proof[
  We construct the quotient frame, normalize its determinant,
    and then recover the markings from an arbitrary surjection.
    The reconstruction will show that every surjection arises from an integral connected marking.
  #emph[Constructing the quotient frame.] Over $cal(T)_(upright("et"))$,
    Proposition 8 identifies the chosen Tate generator with a nonzero section $cal(O) arrow.r V_3$.
    After adding a connected marking, there is also a quotient frame.
    To construct it, orient the formal marking as an isomorphism from the specialized formal law to $Gamma_2$.
    Its coefficients are bounded by one on perfectoid tests. Indeed,
    its leading coefficient has norm $\| t \|^(1 \/ \( d - 1 \)) < 1$,
    and the same coefficient comparison gives $b_n^d - t^n b_n =
    Q_n \( b_1 \, dots.h \, b_(n - 1) \)$ with integral coefficients.
    If all earlier coefficients have norm at most one, a root with $\| b_n \| >
    1$ would make the monic term strictly larger than every other term. Induction gives the assertion.
  Consequently the formal marking can be evaluated on all small points.
    Compose it with the zeroth projection in Lemma 7. This gives an additive map $cal(H)_3 arrow.r cal(H)_2$.
    It is $bb(Q)_p$-linear because multiplication by $p$ is invertible on the Honda target.
    It kills the Tate generator and hence its $bb(Q)_p$-span.
    By Lemma 9 it comes from a unique bundle map $V_3 arrow.r V_2$. On a geometric fiber this map is nonzero:
    near the origin the formal marking has nonzero linear coefficient, and the zeroth projection is surjective.
  Lemma 10 identifies the quotient by the Tate section with $V_2$ locally.
    The induced nonzero endomorphism of this quotient is invertible,
    since its endomorphism algebra is the division algebra $D_2$.
    The resulting quotient frame is therefore an isomorphism, also relatively.
    Uniqueness in relative full faithfulness makes the construction equivariant and compatible with all base changes.
  #emph[Normalizing the determinant.] An initial determinant identification $iota_0$ exists over $k$.
    In the cyclic Honda isocrystal the determinant Frobenius differs from the rank-one degree-one isocrystal by
    the cyclic permutation sign $\( - 1 \)^(i - 1)$. The possible minus sign is removed over $bb(F)_(p^2)$ by a
    Teichmüller unit $u$ with $u^p = - u$. Our field contains $bb(F)_(p^6)$,
    so the required identifications are defined over $k$. Automorphisms act on these determinant lines by their
    reduced norms.
  Connected markings form a $J$-torsor over $cal(T)_(upright("et"))$ and change the quotient frames through
    precisely $J$. On this torsor define the determinant isomorphism and its discrepancy by
  $ Delta \( e \, f \) \( e and v_2 and v_3 \) & = f \( v_2 \) and f \( v_3 \) \,\
r \( e \, f \) & = Delta \( e \, f \) iota_0^(- 1) in underline(bb(Q)_p^times) . $
  Changing the marking by $j in J$ multiplies $r$ by $"Nrd" \( j \) in bb(Z)_p^times$.
    Consequently $nu = v_p \( r \)$ descends through this torsor to a locally constant function
    $cal(T)_(upright("et")) arrow.r underline(bb(Z))$. After extension to the field $C$ used in Proposition 8,
    the space $cal(T)_(upright("et") \, C)$ is a punctured perfected open disc.
    Nested connected closed annuli exhaust it, and perfection preserves their topology;
    thus $nu_C$ is a single integer $m$. The covers $S_C arrow.r
    S$ constructed there also show that $"Spa" \( C \, C^compose \) arrow.r "Spd" \( k \)$ is $v$-surjective.
    Hence $cal(T)_(upright("et") \, C) arrow.r cal(T)_(upright("et"))$ is a $v$-cover and $nu =
    m$ descends globally. Set $iota = p^m iota_0$. The new discrepancy is $p^(- m) r$ and is everywhere a unit.
  Each pair of connected and étale markings therefore gives an exact sequence
  $ 0 arrow.r cal(O) arrow.r V_3 arrow.r V_2 arrow.r 0 $
  whose determinant identification is a unit multiple of $iota$.
    For a fixed connected marking, multiply its étale generator by this unit to obtain determinant equality.
    There is exactly one such generator; uniqueness glues it over $tilde(X)$.
    We have thus constructed a map from $tilde(X)$ to $"Surj" \( V_3 \, V_2 \)$,
    with a determinant-normalized integral kernel frame.
  #emph[Recovering the markings.] To prove that this map is an isomorphism,
    start with an arbitrary surjection $f : V_3 arrow.r.twohead V_2$.
    Determinant equality supplies its kernel generator $e_f$.
    Proposition 8 reconstructs from $e_f$ a deformation and a primitive integral Tate generator.
    Choose a connected marking locally and let $f_0$ be the quotient frame it constructs.
    Write $f = b f_0$ with $b in D_2^times$. Put $r_0 = Delta \( e_f \, f_0 \) iota^(- 1)$,
    which is a unit by the normalization above. Since $Delta \( e_f \, f \) = iota$, we have $1 =
    "Nrd" \( b \) r_0$. Thus $v_p \( "Nrd" b \) = 0$, so $b in J$ and the required change of marking is integral.
    It is unique because the marking torsor and the integral quotient-frame torsor have the same group $J$.
    Indeed, replacing the local marking by $j$ replaces $f_0$ by $j f_0$ and $b$ by $b j^(- 1)$,
    so the adjusted markings agree and glue. The resulting connected marking maps back to $f$.
    Conversely, starting with a connected marking, Proposition 8 recovers its deformation from the normalized
    integral generator, and the $J$-torsor uniqueness recovers its marking.
    These constructions commute with base change, so they prove the relative isomorphism (4.8).
    In particular, the normalized kernel frame of every surjection is the integral Tate generator of its
    reconstructed deformation.
  A $p$-power rescaling of $e_f$ can change the reconstructed deformation;
    the coordinate comparison still returns a primitive basis for that deformation.
    No primitivity claim about the old deformation is needed.
  #emph[The frame actions.] The actions can be recorded without an implicit choice of a section of the norm map.
    In the frame convention
  $ \( g \, j \) dot.op f = j f g^(- 1) \, wide \( g \, j \) in P times J \, $
  the normalized kernel frame satisfies
  #[#set math.equation(numbering: n => "(4.9)")
   $ e_(j f g^(- 1)) = "Nrd" \( j \) "Nrd" \( g \)^(- 1) thin g e_f . $ <eq:normalized-frame-action>]
  This is the determinant identity for the exact sequence. Reversing all frame conventions inverts the displayed
    norm characters. In either convention $H$ fixes the normalized étale frame under transport,
    and the $P$ and $J$ adjustments are continuous constant units. ◻
]

Put $N = cal(H)^1 \( V_2^or \)$, the relative sheaf of extensions of $V_2$ by $cal(O)$, with both ends framed.

#thm([Lemma 4.7.])[
  (Finite marking stages of the perfected tower).  #emph[For each open $U subset J$, the map
$ tilde(X) arrow.r "Spa" \( B^flat \) \, wide B = L^U \, $

 is a pro-étale $U$-torsor. It is natural in $U$, in coefficient base change, and in the commuting $P$-action.
   The space $tilde(X)$ is represented by the completed perfection of the whole algebraic marking tower,
   equipped with its uniform valuation norm; this representation is used here only to discuss its geometry.]
] <lem:perfected-marking-torsor>

#proof[
  For $V lt.closed U$ open, $L^V \/ L^U$ is a finite étale $U \/ V$-torsor.
    Perfection commutes with finite étale base change. After completion it remains the finite étale torsor
  $ "Spa" \( \( L^V \)^flat \) arrow.r "Spa" \( B^flat \) . $
  One may check the completed algebra explicitly in a finite field basis:
    completion of its scalar extension from $B^(upright("perf"))$ is $\( L^V \)^flat$,
    since finite-dimensional valued spaces are complete and their norms are equivalent to the coordinate norms.
    This works componentwise for field products and preserves the torsor identities.
  The completed direct limit of these perfected finite-stage algebras is uniform, perfect, and Tate,
    with the common pseudouniformizer $t$. It is therefore perfectoid.
    Its associated space is their affinoid inverse limit. The finite-level torsor identities pass to this limit
    and identify its relation with $underline(U) times tilde(X)$.
    Surjectivity can be checked on a geometric point of $"Spa" \( B^flat \)$:
    choose compatible lifts through the surjective finite étale covers, using compactness of their finite fibers,
    and extend the resulting bounded map to the completion. This also proves the covering assertion.
    Every construction commutes with restrictions and the transported $P$-action. ◻
]

#thm([Theorem 4.8.])[
  (The determinant-one two-tower comparison).  #emph[For each open $U subset J$ and $B =
    L^U$ there is a natural equivalence of $v$-stacks over $k$
#[#set math.equation(numbering: n => "(4.10)")
 $ \[ "Spa" \( B^flat \) \/ H \] tilde.eq \[ N^(*) \/ U \] . $ <eq:two-towers>]

 It is obtained from the commuting torsor presentations
$ tilde(X) \/ U tilde.eq "Spa" \( B^flat \) \, wide tilde(X) \/ H tilde.eq N^(*) . $

 The residual group $P \/ H = bb(Z)_p^times$ acts on $N^(*)$ by kernel scalars through reduced norm,
   up to the common inverse convention. The $J$-action changes the quotient frame and makes the kernel determinant
   adjustment in (4.9). All these identifications commute with base change and products with profinite parameter
   spaces.]
] <thm:two-towers>

#proof[
  By Proposition 11, $tilde(X)$ is the space of surjections $V_3 arrow.r
    V_2$ with their uniquely normalized kernel frames. Quotienting the middle frame by $H$ allows the middle
    bundle to vary while preserving its determinant frame. Lemma 10 identifies precisely the resulting objects
    with the nowhere-split extensions of $V_2$ by $cal(O)$, namely $N^(*)$.
    There is no automorphism group left over an extension with its two ends fixed, since $cal(H)^0 \( V_2^or \) = 0$.
  To see that this is a torsor presentation relatively, first choose a local basic frame of the middle bundle.
    Its determinant frame can be corrected to the prescribed one:
    reduced norm $D_3^times arrow.r bb(Q)_p^times$ is surjective.
    The compatible frames form a torsor under its norm-one subgroup, which is exactly $H$,
    because norm one has valuation zero. On units, surjectivity of $P arrow.r
    bb(Z)_p^times$ already follows from the norm of the maximal unramified cubic subfield.
    Local basic triviality then gives the asserted $H$-torsor on the site.
  Combine it with the $U$-torsor in Lemma 12. The actions commute,
    so the two iterated quotient presentations give (4.10). Tracking determinants gives the claimed actions.
    For example, in the frame convention of (4.9), the residual $g in
    P$ acts on extension classes by the scalar $"Nrd" \( g \)$;
    a target change $j$ acts by pullback along $j^(- 1)$ together with kernel scalar $"Nrd" \( j \)^(- 1)$.
    This states the actual action and does not choose a group-theoretic splitting of reduced norm.
    Naturality and the parameter assertion follow from the natural torsor maps and the uniform coordinate comparison. ◻
]

=== 4.4 Descent of the integral marking <descent-of-the-integral-marking>

The normalized generator has so far been constructed on a completed perfected tower.
  We next descend each of its finite étale levels to the algebraic marking algebra $L$.
  The following elementary lemma is the completion statement needed for this purpose.

#thm([Lemma 4.9.])[
  (Finite étale sections descend).  #emph[Let $L = "colim"_i
    B_i$ be an injective union of finite étale $K$-algebras, with their maximum valuation norms, and let $C =
    hat(L^(upright("perf")))$. For every finite étale $L$-algebra $E$, the map
$ "Hom"_(L upright("-alg")) \( E \, L \) arrow.r "Hom"_(L upright("-alg")) \( E \, C \) $

 is bijective. Each section on the right is defined at a finite separable stage.
   The assertion allows unbounded numbers of field factors among the $B_i$.]
] <lem:finite-etale-descent>

#proof[
  Each $B_i^(1 \/ p^r)$ is a finite product of complete valued fields. First let $e in C$ be an idempotent.
    Approximate it by $b in B_i^(1 \/ p^r)$ with $lr(bar.v.double b - e bar.v.double) < 1$.
    Then $lr(bar.v.double b^2 - b bar.v.double) < 1$ and $2 b - 1$ is a unit with inverse of norm at most one.
    Hensel’s lemma in that complete finite product gives an idempotent $e_i$ at distance less than one from $e$.
    Two such idempotents are equal: both $e \( 1 - e_i \)$ and $e_i \( 1 - e \)$ are idempotents of norm less than
    one, hence zero. Purely inseparable extensions create no idempotents, so $e = e_i$ belongs to $B_i$.
    Finitely many idempotents descend to a common stage.
  The algebra $E$ descends to a finite étale algebra over some $B_i$.
    After a finite idempotent partition it has a monogenic étale presentation;
    each component field of $B_i$ is infinite, so the primitive-element argument applies also to its finite étale
    products. Descend the idempotents selected by the proposed section.
    It remains to descend finitely many simple roots.
  Let $f \( z \) = 0$ with $f in B_i \[ T \]$ and $f' \( z \)$ invertible in $C$.
    Approximate $z$ and $f' \( z \)^(- 1)$ simultaneously by $b \, c$ in a single $B_j^(1 \/ p^r)$, so closely that
  $ lr(bar.v.double 1 - c f' \( b \) bar.v.double) < 1 . $
  The geometric series in this complete algebra makes $f' \( b \)$ invertible with inverse norm at most
    $lr(bar.v.double c bar.v.double)$. Let $M gt.eq 1$ bound the quadratic Taylor remainder of $f$ on the unit
    ball about $b$, and put $C_0 = max \( 1 \, lr(bar.v.double c bar.v.double) \)$.
    The approximations may also be chosen so that
  $ lr(bar.v.double f \( b \) bar.v.double) C_0^2 M < 1 . $
  Newton iteration remains in $B_j^(1 \/ p^r)$, has uniformly bounded inverse derivatives,
    and converges there to a root $z_j$. Choose the initial approximation inside a simple-root uniqueness ball
    about $z$; the divided difference is a unit on that ball, so $z_j = z$.
    Componentwise, this root is separable over $B_j$ but belongs to its purely inseparable extension,
    and hence was already in $B_j$. All the finitely many roots use a common stage.
    This proves surjectivity, and injectivity follows from $L arrow.r.hook C$. ◻
]

#thm([Lemma 4.10.])[
  (The normalized algebraic étale marking).  #emph[The étale quotient of $G_L$ has a compatible integral Tate
    generator defined over $L$, obtained by determinant normalization. It is fixed by $H$.
    Transport by $P$ changes it by the constant reduced-norm unit, up to the common inverse convention;
    transport by $J$ has the constant determinant adjustment determined by (4.9).
    Each finite torsion level of this marking is defined at a finite separable marking stage.]
] <lem:etale-marking>

#proof[
  The integral Tate frame constructed in Proposition 11 gives, at each level $l$,
    a section of the finite étale generator algebra of $G_L^(upright("et")) \[ p^l \]$ after passage to
    $hat(L^(upright("perf")))$. Lemma 14 descends this section to some finite separable marking stage.
    The descended sections are compatible: their transition identities hold in the completion and hence in $L$ by
    injectivity. The same argument descends the action identities, including the $H$-invariance.
    The finite stage can depend on $l$; no single finite stage containing the entire Tate generator is required. ◻
]

#thm([Lemma 4.11.])[
  (The generator-lift torsors).  #emph[The scheme of lifts in $G_L \[ p^l \]$ of the normalized étale generator
    has coordinate algebra
#[#set math.equation(numbering: n => "(4.11)")
 $ R_l = L^(1 \/ p^(2 l)) = L^(1 \/ d^l) subset R = L^(upright("perf")) . $ <eq:lift-rings>]

 It is a torsor under the marked group $Gamma_2 \[ p^l \]_L$.
   The transition maps give the indicated inclusions inside $R$.
   The action of $H$ commutes with translation by this constant group.
   The other frame actions conjugate translations by continuous constant Honda automorphisms and scalar norm
   units. All coactions and their finite-level action identities are defined and continuous after passage to a
   sufficiently large finite separable stage.]
] <lem:lift-torsors>

#proof[
  The fiber over the marked étale generator is a torsor for the connected kernel.
    The connected marking identifies that kernel with $Gamma_2 \[ p^l \]$.
    By Lemma 6, its algebra before base change along the chosen generator is
  $ k \[ \[ s_l \] \] \[ 1 \/ t \] quad upright("over") quad k \[ \[ s_l^(d^l) \] \] \[ 1 \/ t \] \, $
  and this is the full lift algebra of rank $d^l$. The generator marking of Lemma 15 gives its base change to $L$.
  Every finite separable extension of $K$ has one-element $p$-basis $t$,
    and the same is true of their ind-étale union. A finite purely inseparable extension of degree $d^l$ in its
    perfection is therefore $L^(1 \/ d^l)$. The displayed lift algebra retains that degree after the separable
    base change: componentwise, $s_l^(d^l)$ is a $p$-basis of its Laurent-series field and remains a $p$-basis
    after any separable extension. This proves (4.11), also for products by a common finite-stage argument.
    Purely inseparable embeddings are unique, so compatibility of the marked generators identifies the transition
    maps with the inclusions inside $R$.
  The group $H$ fixes both the connected frame and the normalized étale generator.
    Its transported action on each lift torsor therefore commutes with translations in the named Honda group.
    For the remaining actions, transport followed by restoration of the normalized étale generator rescales by its
    constant norm unit; changing the connected frame also applies the named Honda automorphism.
    These are continuous constant group automorphisms and satisfy the action identities because the markings do.
    At a fixed level all these statements involve finite torsion algebras and finitely many coefficients.
    Those coefficients lie in a finite separable stage, and the resulting maps between complete finite-dimensional
    valued spaces are continuous. Enlarging that stage handles any specified finite list of levels and identities.
  For later use, the order-two action has a direct sign check.
    The central elements $tau = - 1 in P$ and $j = - 1 in J$ both act on surjections by $f mapsto - f$.
    Since $V_2$ has rank two, $Delta \( e \, - f \) = Delta \( e \, f \)$, so the normalized generator $e$,
    its reconstructed deformation, and its étale frame are unchanged.
    The connected marking $phi.alt$ is replaced by $- phi.alt$.
    A translation labeled by $c in Gamma_2 \[ p^l \]$ uses $phi.alt^(- 1) \( c \)$;
    after this change it uses $phi.alt^(- 1) \( - c \)$. Thus $tau$, whose reduced norm is $- 1$,
    conjugates the named translation group by $\[ - 1 \]$. Its action on the one-dimensional tangent of the
    Cartier dual is $- 1$, as required in Lemma 32. ◻
]

=== 4.5 The negative period space <the-negative-period-space>

The final geometric description will be used to compute cohomology.
  It requires a geometric untilt only after the space and its frame actions have been defined over $k$.

#thm([Lemma 4.12.])[
  (An untilt presentation of the negative space).  #emph[Let $C^flat$ be an algebraically closed perfectoid field
    of characteristic $p$ containing $k$, choose an algebraically closed untilt $C \/ bb(C)_p$,
    and let $F \/ bb(Q)_p$ be unramified quadratic. After choosing its embedding at the untilt divisor there are
    isomorphisms
#[#set math.equation(numbering: n => "(4.12)")
 $ N_(C^flat) tilde.eq \( bb(G)_(a \, C) \)^diamond.stroked.small \/ underline(F) \,
   wide \( N^(*) \)_(C^flat)
   tilde.eq \[ \( bb(A)_C^1 \\ underline(F) \)^diamond.stroked.small \/ underline(F) \] . $ <eq:negative-presentation>]

 Here $bb(A)_C^1$ is the analytic affine line. In the second expression the $F$-support is removed fiberwise
   before taking the translation quotient. The action of $F^times$ through the quotient frame is multiplication in
   this presentation, up to inversion and the choice of unramified embedding.
   The additional kernel determinant adjustment from Theorem 13 is a scalar in $bb(Z)_p^times$.]
] <lem:negative-presentation>

#proof[
  On the Fargues–Fontaine curve with coefficient field $F$,
    the chosen untilt divisor gives #cite(label("FS21")) Proposition II.2.3
  $ 0 arrow.r cal(O)_F \( - 1 \) arrow.r cal(O)_F arrow.r i_(*) C arrow.r 0 . $
  The degree-zero section sheaf of $cal(O)_F$ is $underline(F)$, its higher relative cohomology sheaves vanish,
    and the negative line has no sections. The cohomology sequence therefore identifies
  $ cal(H)^1 \( cal(O)_F \( - 1 \) \) tilde.eq \( bb(G)_(a \, C) \)^diamond.stroked.small \/ underline(F) . $
  Finite pushforward along the unramified coefficient extension takes $cal(O)_F \( - 1 \)$ to $V_2^or$,
    giving the first isomorphism. The preimage of the zero extension class is exactly the sheaf $underline(F)$.
    Its complement consists precisely of classes nonzero on every geometric fiber,
    proving the second isomorphism as an open subquotient.
  The sequence is equivariant for multiplication by $F^times$.
    The embedding and frame conventions may conjugate or invert this action.
    The independent determinant normalization of the kernel contributes exactly the scalar described in
    Theorem 13. For later use, a scalar $u in bb(Z)_p^times$ has norm $u^2$ in $F \/ bb(Q)_p$,
    which is trivial modulo $3$; thus this adjustment does not change the nontrivial residue-norm character on
    $cal(O)_F^times$. ◻
]

The two-tower comparison and its normalized scalar action now supply the geometric input for the completed
  calculation. Before using them, we establish the finite analytic resolution that controls continuous cochains.

== 5 Finite resolutions for the analytic groups <sec:finite-resolutions>

The completed coefficient calculation uses continuous cohomology with noncompact valuation coefficients.
  We first give the finite resolution that computes those cochains and bounds their cohomological degrees.
  This tool depends only on the analytic groups and coefficient topology.
  A linearly topologized $bb(F)_p$-space is understood to be separated;
  an action has #emph[invariant neighborhoods] when invariant open linear subspaces form a neighborhood basis of zero.

#thm([Lemma 5.1.])[
  (Finite analytic resolutions).  #emph[Let $G$ be a compact $p$-adic analytic group with no element of order $p$,
    and put $d = dim G$. The trivial module $bb(F)_p$ admits a length-$d$ resolution $Q_bullet$ by finitely
    generated projective $bb(F)_p \[ \[ G \] \]$-modules, with their compact topologies.
    If $M$ is a complete linearly topologized $bb(F)_p$-representation with invariant neighborhoods, then
$ "Hom"_(bb(F)_p \[ \[ G \] \] \, upright("cts")) \( Q_bullet \, M \) tilde.eq C_(upright("cts"))^bullet \( G \, M \) $

 by continuous chain-homotopy equivalences. Each term on the left is a continuous direct summand of a finite power
   of $M$.]
  #emph[For $G = H$ the dimension is eight, and the reversed group-ring dual of $Q_bullet$ resolves the trivial
    right $bb(F)_p \[ \[ H \] \]$-module. In particular, continuous $H$-cohomology of these coefficients vanishes
    above degree eight, and finite coefficient modules have finite cohomology.]
] <lem:finite-resolution>

#proof[
  We specify the two structural inputs. A completed group algebra over $bb(Z)_p$, or over its residue field,
    is Noetherian; it has finite global dimension when the compact analytic group has no element of order $p$
    #cite(label("AW06")) Section 3.3, Proposition (d),(e). Also
  #[#set math.equation(numbering: n => "(5.1)")
   $ H_(upright("cts"))^a \( G \, bb(Z)_p \[ \[ G \] \] \) =
     cases(delim: "{", cal(D)_G \, & a = d \,, 0 \, & a eq.not d \,) $ <eq:analytic-dualizing-cohomology>]
  where $cal(D)_G$ is free of rank one over $bb(Z)_p$, with the right action given by the top exterior power of
    the dual adjoint representation #cite(label("BGHS22")) Proposition 4.16, Remark 4.23, and Proposition 4.40.
  Set $tilde(Lambda) = bb(Z)_p \[ \[ G \] \]$ and $Lambda = bb(F)_p \[ \[ G \] \]$.
    Noetherianity and finite global dimension give a finite resolution of $bb(Z)_p$ by finitely generated
    projective $tilde(Lambda)$-modules. Give every term its topology as a summand of a finite power of
    $tilde(Lambda)$. The differentials are continuous and their images are compact, hence closed.
    All syzygies are $p$-torsion-free, so reduction modulo $p$ remains exact and gives a finite projective
    $Lambda$-resolution of $bb(F)_p$.
  Here the integral projective resolution computes (5.1) as continuous cohomology.
    Indeed, a completed free $bb(Z)_p$-module on a profinite set is compact and $p$-torsion-free.
    Its Pontryagin dual is a divisible discrete $p$-primary group, and hence injective.
    It is therefore projective in compact $bb(Z)_p$-modules. Induction to $tilde(Lambda)$ shows that the completed
    bar terms are projective in compact $tilde(Lambda)$-modules.
    The usual projective comparison maps and homotopies can consequently be chosen continuous.
    Dualizing the finite integral resolution and then reducing modulo $p$ gives cohomology $cal(D)_G \/
    p$ in degree $d$ alone: both the integral terms and the unique integral cohomology module are
    $p$-torsion-free. Finite projectivity identifies this reduction with the group-ring dual of the reduced
    resolution. If its last degree is $n > d$, the last differential of that dual surjects onto a projective
    module. Split this surjection and dualize back to remove a contractible pair.
    Repetition gives a resolution of length $d$.
  We explain why the same compact resolution works for the possibly noncompact target $M$.
    For a profinite space $Z$, there is a natural identification
  #[#set math.equation(numbering: n => "(5.2)")
   $ C_(upright("cts")) \( Z \, M \) = "Hom"_(bb(F)_p \, upright("cts")) \( bb(F)_p \[ \[ Z \] \] \, M \) .
     $ <eq:completed-free-continuous-functions>]
  Modulo each open linear subspace of $M$, a continuous function has finite image and factors through a finite
    clopen partition of $Z$. Its linear extension therefore exists in that quotient.
    The extensions are compatible, and completeness gives the required map into $M$. This also proves uniqueness.
    With invariant neighborhoods the $G$-action extends continuously to $Lambda$.
  The completed $bb(F)_p$-bar terms are projective in compact $Lambda$-modules.
    To lift a map from their profinite generators across a compact-module surjection,
    first choose a continuous linear section of the underlying compact $bb(F)_p$-spaces.
    Such a section exists by dualizing and splitting an injection of discrete vector spaces.
    Extend the lifted generator map $Lambda$-linearly using (5.2).
    Thus the completed bar resolution and $Q_bullet$ are continuously chain-homotopy equivalent.
    Apply continuous $Lambda$-linear Hom into $M$. Continuity of the resulting maps and homotopies for the uniform
    cochain topologies is checked modulo invariant open subspaces of $M$.
    Finally, finite projectivity makes each Hom term a continuous summand of $M^r$ for some finite $r$.
  For $H$, an element of order three would embed $bb(Q)_3 \( zeta_3 \)$ in the division algebra $D_3$.
    The degree of a commutative subfield divides the degree three of this central division algebra,
    whereas $\[ bb(Q)_3 \( zeta_3 \) : bb(Q)_3 \] = 2$. Thus $H$ has no element of order three.
    Its Lie algebra is the kernel of reduced trace on $D_3$, so it has dimension eight.
    Over a splitting field, conjugation on $D_3$ becomes conjugation on $M_3$ and has determinant one. The decomposition
  $ D_3 = bb(Q)_p dot.op 1 xor ker \( "Trd" \) $
  is valid over $bb(Q)_p$, including at $p = 3$, and the first summand has trivial action.
    The adjoint determinant on $"Lie" \( H \)$ is therefore one.
    Consequently $cal(D)_H$ is the trivial line, which proves the assertion about the reversed dual.
    The remaining statements follow by applying the finite resolution. ◻
]

For the torsion-free uniform open subgroups of $J$, the same lemma applies with dimension four.
  For $H$, it supplies the dimension-eight resolution and duality orientation needed later in the finite-stage
  argument. We now turn to the completed geometric coefficients.

== 6 The completed cohomology calculation <sec:analytic>

The goal is the completed coefficient calculation in Theorem 28.
  We first compute the geometric cohomology and its actions,
  then descend Frobenius at each finite marking stage and take the marking colimit.
  Throughout this section, $C$ is an algebraically closed complete perfectoid extension of $bb(C)_p$,
  with a chosen embedding $k arrow.r.hook C^flat$. On diamonds over $C^flat$ we write $cal(O)^flat$ for the
  characteristic-$p$ structure sheaf. Thus, on the diamond of a perfectoid space in characteristic $p$,
  this is its usual structure sheaf; on an untilted analytic space it is the structure sheaf on its
  characteristic-$p$ perfectoid site.

Let $T$ be an arbitrary compact profinite set. Products with $T$ always mean products with its associated locally
  profinite v-sheaf. For a complete topological coefficient group $M$, put

$ C_(upright("cts"))^r \( G \, M \; T \) = "Map"_(upright("cts")) \( T times G^r \, M \) . $

When $G$ is compact and $M$ is a Banach space, this mapping space has the supremum norm.
  For a Fréchet space it has the supremum seminorms of a countable family of Banach seminorms.
  Products indexed by a discrete set have their product topology;
  they carry no boundedness condition across that discrete set.
  These conventions will be preserved throughout the calculations.

=== 6.1 Two facts about continuous families and countable limits <two-facts-about-continuous-families-and-countable-limits>

We first record the approximation argument used in the analytic exhaustions.

#thm([Lemma 6.1.])[
  #emph[Let
$ M_0 arrow.l^(f_0) M_1 arrow.l^(f_1) M_2 arrow.l^() dots.h.c $

 be a countable inverse system of complete nonarchimedean normed abelian groups.
   Suppose every $f_n$ is a contraction with dense image. Then the map
#[#set math.equation(numbering: n => "(6.1)")
 $ product_(n gt.eq 0) M_n arrow.r product_(n gt.eq 0) M_n \,
   wide \( x_n \) mapsto \( x_n - f_n \( x_(n + 1) \) \) $ <eq:analytic-roos>]

 is surjective. The same assertion holds after replacing every $M_n$ by $"Map"_(upright("cts")) \( T \, M_n \)$.
   Consequently these systems have no positive derived inverse limits.]
] <lem:analytic-roos>

#proof[
  Fix a right-hand side $\( y_n \)$ and positive real numbers $epsilon_n arrow.r 0$.
    Suppose that a finite tuple $x_0 \, dots.h \, x_n$ solves the first $n$ equations.
    By density choose $x_(n + 1)$ such that
  $ d_n = y_n + f_n \( x_(n + 1) \) - x_n \, wide parallel d_n parallel < epsilon_n . $
  Replace $x_n$ by $x_n + d_n$, and replace each earlier $x_i$ by
  $ x_i + f_i f_(i + 1) dots.h.c f_(n - 1) \( d_n \) . $
  The enlarged tuple now solves the first $n + 1$ equations.
    Each previously chosen coordinate has changed by at most $epsilon_n$.
    Starting with any $x_0$, this procedure produces a Cauchy sequence in every fixed coordinate.
    Completeness gives a solution of all equations.
  For the parameter assertion, the mapping spaces are complete and the induced maps are contractions.
    They have dense image: a continuous map from $T$ to $M_n$ is uniformly approximated by a map constant on a
    finite clopen partition, and its finitely many values can be approximated in the image of $M_(n + 1)$.
    Apply the preceding argument to these mapping spaces. Finally,
    the two-term Roos complex (6.1) computes the derived inverse limit of a countable system. ◻
]

The $c_0$-condition on a weighted coefficient family means that, for every $epsilon > 0$,
  only finitely many weighted coefficient norms are at least $epsilon$.
  We use two other elementary consequences of compactness. First,
  a continuous map from $T$ to a weighted $c_0$-space has uniformly small tails.
  Indeed, its compact image admits a finite cover by small balls,
  and the finitely many centers have uniformly small tails.
  Conversely, continuous coordinate functions with uniformly small tails define a continuous map into that
  $c_0$-space. Applying this observation to each seminorm gives its Fréchet version.
  Second, if $V$ is discrete, every continuous map $T arrow.r V$ has finite image.
  In particular, continuous $V$-valued functions lift through every surjection of discrete groups,
  by choosing lifts on a finite clopen partition.

For use with Kummer covers, continuous cohomology of $bb(Z)_p$ on a complete, separated,
  linearly topologized $bb(F)_p$-module $M$ with invariant neighborhoods is computed by

#[#set math.equation(numbering: n => "(6.2)")
 $ \[ thin M arrow.r^(gamma - 1) M thin \] \, $ <eq:analytic-cyclic>]

in degrees $0 \, 1$, where $gamma$ is a topological generator. Here one applies continuous $"Hom"$ to

$ 0 arrow.r bb(F)_p \[ \[ bb(Z)_p \] \] arrow.r^(gamma - 1) bb(F)_p \[ \[ bb(Z)_p \] \] arrow.r bb(F)_p arrow.r 0 . $

This finite resolution compares continuously with the completed bar resolution.
  To check the assertion for the possibly noncompact target $M$, reduce modulo an invariant open subspace:
  a continuous map from a profinite set then has finite image and extends linearly to the free compact
  $bb(F)_p$-module on that set. Taking the inverse limit over the open subspaces recovers $M$ by completeness.
  The same argument applies to $"Map"_(upright("cts")) \( T \, M \)$,
  or directly to bar cochains with parameter $T$. The finite analytic resolutions used below have the same
  comparison property; see Lemma 18 in Section 5.

=== 6.2 Kummer annuli and the affine line <kummer-annuli-and-the-affine-line>

Choose a compatible system of $p$-power roots of unity in $C$.
  It determines $epsilon.alt in C^flat$ and a generator $gamma$ of the Kummer group $bb(Z)_p \( 1 \)$.
  Put $theta = \| epsilon.alt - 1 \|$, so $0 < theta < 1$. Let $0 < r lt.eq b$ belong to the value group of $C$,
  and let $A \[ r \, b \]$ be the untilted closed annulus with coordinate $z$.
  We use the perfectoid coordinate-root construction and tilting equivalence of #cite(label("Scholze12"))
  Propositions 5.20 and 6.17. After adjoining all $p$-power roots of $z$,
  the perfectoid Kummer cover has tilted function algebra

#[#set math.equation(numbering: n => "(6.3)")
 $ cal(A) \[ r \, b \] = {sum_(u in bb(Z) \[ 1 \/ p \]) c_u z^u :
   #scale(x: 120%, y: 120%)[\(] \| c_u \| max \( r^u \, b^u \) #scale(x: 120%, y: 120%)[\)]_u upright(" is ")
   c_0} . $ <eq:analytic-annulus-algebra>]

The fractional monomials in this formula are coordinates on the tilted cover.
  The action is $gamma \( z^u \) = epsilon.alt^u z^u$. With parameter $T$,
  replace $c_u in C^flat$ by $c_u in R_T := "Map"_(upright("cts")) \( T \, C^flat \)$,
  using the supremum norm and the uniform $c_0$-condition.

The cover and all its Čech levels are affinoid perfectoid.
  Their higher structure-sheaf cohomology vanishes by #cite(label("ScholzeDiamonds17")) Proposition 8.8.
  Kummer descent and (6.2) therefore identify the cohomology of the annulus, including parameter $T$,
  with the cohomology of

#[#set math.equation(numbering: n => "(6.4)")
 $ \[ thin cal(A) \[ r \, b \] \( T \) arrow.r^(gamma - 1) cal(A) \[ r \, b \] \( T \) thin \] .
   $ <eq:analytic-annulus-complex>]

#thm([Lemma 6.2.])[
  #emph[The degree-zero cohomology of (6.4) is $R_T$. Suppose $r lt.eq r' lt.eq b' lt.eq b$ and
#[#set math.equation(numbering: n => "(6.5)")
 $ r' gt.eq r \/ theta \, wide b' lt.eq b theta . $ <eq:analytic-radius-gap>]

 After restriction to $A \[ r' \, b' \]$, every degree-one class represented by a Laurent series with zero
   constant coefficient vanishes. Division by $epsilon.alt^u - 1$, for $u eq.not 0$,
   has operator norm at most one between the indicated weighted coefficient spaces.
   The remaining degree-one class is the Kummer class of $z$, with coefficients in $R_T$.]
] <lem:annulus-restriction>

#proof[
  For $u eq.not 0$, write $u = p^v a$, where $a$ is an integer prime to $p$. Then
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| epsilon.alt^u - 1 \| = theta^(p^v) \, wide p^v lt.eq \| u \|_(bb(R)) . $ <eq:analytic-epsilon>]
  In particular, multiplication by $epsilon.alt^u - 1$ has zero kernel.
    The invariants are therefore exactly the coefficient at $u = 0$.
  For $u > 0$, the ratio of the target outer weight to the source outer weight, after division, is bounded by
  $ \( b' \/ b \)^u theta^(- p^v) lt.eq theta^(u - p^v) lt.eq 1 . $
  For $u < 0$, the same calculation using the inner weights gives
  $ \( r' \/ r \)^u theta^(- p^v) lt.eq theta^(\| u \| - p^v) lt.eq 1 . $
  These inequalities prove both convergence and the asserted norm bound,
    even for exponents with arbitrarily large $p$-power denominators.
    They preserve uniform $c_0$-tails with parameter $T$. The constant summand of the two-term complex has zero
    differential. Its degree-one generator is the reduction modulo $p$ of the Kummer torsor of the coordinate,
    mapped into $cal(O)^flat$. ◻
]

The last assertion concerns the image of restriction; a fixed closed annulus may have additional nonconstant
  degree-one classes. This distinction will matter in the support calculation.

#thm([Lemma 6.3.])[
  #emph[For every compact profinite $T$,
#[#set math.equation(numbering: n => "(6.7)")
 $ H_v^i #scale(x: 120%, y: 120%)[\(] T times \( bb(A)_C^1 \)^diamond.stroked.small \,
   cal(O)^flat #scale(x: 120%, y: 120%)[\)] = cases(delim: "{", R_T \, & i = 0 \,, 0 \, & i > 0 .)
   $ <eq:analytic-affine-line>]

 The identification in degree zero is induced by constants.]
] <lem:affine-line-flat>

#proof[
  First consider a closed disc $D$. Pullback to its perfectoid power-map cover is injective on sections,
    by the sheaf property. The pullback of a section is invariant under the root-of-unity automorphisms.
    On the punctured disc, the fractional monomial description and (6.6) force all nonconstant coefficients to
    vanish. The same is then true on the whole perfectoid disc.
    Thus $H^0 \( D^diamond.stroked.small \, cal(O)^flat \)$ consists of constants.
    With parameter $T$, these constants are precisely $R_T$. This argument uses the power-map cover only for
    sections; it does not treat the branched cover of a disc as a Kummer torsor.
  Fix a disc $D = { \| z \| lt.eq R }$. Choose $e in C$ with
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| e \| > R \, wide R \/ \| e \| < \| p \|^(p \/ \( p - 1 \)) . $ <eq:analytic-distant-center>]
  There are nested annuli about $e$, both containing $D$, whose radii satisfy (6.5).
    They are contained in some larger disc $D'$ about zero. Restriction from $D'$ to $D$ factors through these two
    annuli. Since an annulus has cohomology only in degrees $0 \, 1$,
    the factorization kills degrees greater than one. In degree one,
    Lemma 20 leaves only multiples of the Kummer class of $z - e$.
  That remaining class vanishes on $D$. Indeed, choose a $p$-th root of $- e$ in $C$.
    The binomial series for $\( 1 - z \/ e \)^(1 \/ p)$ converges under (6.8):
    its $n$-th coefficient has $p$-adic valuation $- n - v_p \( n ! \)$,
    so its radius of convergence is $\| p \|^(p \/ \( p - 1 \))$.
    It supplies a first $p$-th root of $z - e$ on $D$. This trivializes the mod-$p$ Kummer torsor,
    hence also its image in $cal(O)^flat$-cohomology. The root and the annular radius choices are independent of $T$.
  Now exhaust $bb(A)_C^1$ by a countable increasing sequence of closed discs.
    Derived global sections on the union are the derived inverse limit of those on the discs.
    In degree zero the restriction system is the constant system $R_T$.
    In every positive degree it is pro-zero by the preceding factorization.
    The derived inverse limit of a countable system has dimension at most one, so its spectral sequence gives (6.7). ◻
]

=== 6.3 Support on the locally profinite field <support-on-the-locally-profinite-field>

We next calculate the fiber of restriction from the affine line to the complement of $underline(F)$,
  where $F \/ bb(Q)_p$ is unramified quadratic. All complements in this subsection are taken on geometric fibers.

For a center $c in C$ and radius $r > 0$, write

$ E \( c \, r \) = { \| z - c \| gt.eq r } subset bb(A)_C^1 . $

It is the increasing union of closed annuli with inner radius $r$ and outer radius tending to infinity.
  The tilted algebras of their Kummer covers have dense restriction maps:
  fractional Laurent polynomials are dense on every annulus and belong to every larger annulus algebra.
  Lemma 19, in each bar degree, therefore shows that the cohomology of $T times
  E \( c \, r \)^diamond.stroked.small$ is computed by

#[#set math.equation(numbering: n => "(6.9)")
 $ \[ thin cal(M) \( c \, r \; T \) arrow.r^(gamma - 1) cal(M) \( c \, r \; T \) thin \] \,
   $ <eq:analytic-exterior-complex>]

where $cal(M) \( c \, r \; T \)$ is the Fréchet space of fractional Laurent series converging on all these annuli,
  with the uniform parameter convention. Set

$ Q \( c \, r \; T \) = "coker" #scale(x: 120%, y: 120%)[\(] gamma - 1 : cal(M) \( c \, r \; T \) arrow.r
  cal(M) \( c \, r \; T \) #scale(x: 120%, y: 120%)[\)] . $

This is an ordinary algebraic cokernel; no assertion that the image is closed is needed.

#thm([Lemma 6.4.])[
  #emph[The support complex
$ "fib"
  (R Gamma_v \( T times bb(A)_C^(1 \, diamond.stroked.small) \, cal(O)^flat \) arrow.r R Gamma_v \( T times E \(
  c \, r \)^diamond.stroked.small \, cal(O)^flat \)) $

 has cohomology only in degree $2$, where it is $Q \( c \, r \; T \)$.
   Constant-coefficient extraction induces a surjection
#[#set math.equation(numbering: n => "(6.10)")
 $ "res"_(c \, r) : Q \( c \, r \; T \) arrow.r R_T . $ <eq:analytic-residue>]

 Its kernel maps to zero under restriction $Q \( c \, r \; T \) arrow.r Q \( c \, r' \; T \)$ whenever $r' gt.eq
   r \/ theta$. Residues are preserved by enlarging a disc, by changing its center inside the enlarged disc,
   and by scalar coordinate changes.]
] <lem:single-hole-residue>

#proof[
  The invariants in (6.9) are $R_T$. They agree with the affine-line constants.
    The support triangle and Lemma 21 therefore identify the sole support group with $Q \( c \, r \; T \)$ in
    degree $2$. The coefficient of $\( z - c \)^0$ vanishes on the image of $gamma - 1$; extraction is onto,
    with a lift of $1$ given by the Kummer class of $z - c$.
  If $f in cal(M) \( c \, r \; T \)$ has constant coefficient zero, form
  #[#set math.equation(numbering: n => "(6.11)")
   $ h = sum_(u eq.not 0) frac(f_u, epsilon.alt^u - 1) \( z - c \)^u . $ <eq:analytic-exterior-primitive>]
  For any target outer radius $b gt.eq r'$, the negative exponents are controlled by the inner-radius gap $r'
    gt.eq r \/ theta$; the positive exponents are controlled by using the source outer radius $b \/ theta$.
    The calculation in Lemma 20 gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ parallel h parallel_(\[ r' \, b \]) lt.eq parallel f parallel_(\[ r \, b \/ theta \]) .
     $ <eq:analytic-exterior-bound>]
  The source is available for every $b$, so $h$ converges on the whole enlarged exterior,
    with continuous parameter $T$. It satisfies $\( gamma - 1 \) h = f$ there.
    This proves the uniform vanishing of the residue kernel.
  For completeness, the independence of the center is an assertion about residues,
    and can be checked after making a further enlargement. If the centers are $c \, c'$, then sufficiently far out
  $ frac(z - c', z - c) = 1 + frac(c - c', z - c) $
  has a first $p$-th root by the binomial estimate used in (6.8). The two mod-$p$ Kummer classes then coincide.
    Enlargement preserves the constant-coefficient residue, and its kernels are killed by (6.12);
    hence the residue identifications agree already before the further enlargement.
    Multiplying a coordinate by a constant also preserves its Kummer class,
    since a constant has a $p$-th root in $C$. The normal Kummer generator is thus preserved by translations and
    by multiplication by $F^times$. ◻
]

Choose a radius $b_0$ in the value group with $1 < b_0 < p$.
  For $n gt.eq 0$, choose centers $c_(n \, alpha) in F$ for the cosets $alpha in F \/ p^n cal(O)_F$, and put

$ r_n = \| p \|^n b_0 . $

The discs of radius $r_n$ about these centers are disjoint:
  distinct centers have distance at least $\| p \|^(n - 1) > r_n$.
  Let $E_n$ be their common exterior, including the annular boundaries.
  The exteriors are increasing with $n$, independently of choices of representatives, and

#[#set math.equation(numbering: n => "(6.13)")
 $ \( bb(A)_C^1 \\ underline(F) \)^diamond.stroked.small =
   union.big_(n gt.eq 0) E_n^diamond.stroked.small . $ <eq:analytic-tube-exhaustion>]

Here equality is also valid on affinoid perfectoid tests.
  Write the untilt of such a test as $S^sharp = "Spa" \( A \, A^(+) \)$, and write $z in A$ for its coordinate.
  Give the uniform Banach $C$-algebra $A$ its spectral norm.
  We use the Berkovich spectrum $cal(M) \( A \)$ of bounded multiplicative seminorms extending the norm of $C$,
  with its seminorm topology. It is compact Hausdorff: its defining relations cut out a closed subset of
  $product_(f in A) \[ 0 \, parallel f parallel \]$. Choose $M > max { parallel z parallel \, 1 }$ and put $K =
  { a in F : \| a \| lt.eq M }$, a compact subset of $F$. Points outside $K$ cannot minimize the distance from
  $z$. For $m in cal(M) \( A \)$, set

$ d \( m \) = min_(a in K) \| z - a \|_m . $

The ultrametric inequality gives, uniformly in $m$,

$ \| \| z - a \|_m - \| z - b \|_m #scale(x: 120%, y: 120%)[\|] lt.eq \| a - b \| . $

A finite $epsilon$-net of $K$ therefore gives a continuous finite minimum which approximates $d$ uniformly within
  $epsilon$. Thus $d$ is continuous, without any metrizability assumption on $cal(M) \( A \)$.
  If $d \( m \) = 0$, then $z = a$ in the completed residue field at $m$ for some $a in K$.
  Passing to a completed algebraic closure produces a geometric perfectoid fiber whose coordinate lies in $F$,
  contrary to fiberwise avoidance. Compactness now gives $delta = min_m d \( m \) > 0$.
  Choose $n$ with $r_n < delta$ strictly. Every adic point has a rank-one coarsening in $cal(M) \( A \)$.
  The inequalities $\| z - c_(n \, alpha) \| > r_n$ hold at that coarsening and hence at the original valuation:
  an inequality $lt.eq$ cannot become $>$ on passing to a quotient of its ordered value group.
  Thus the entire test, including its higher-rank points, factors through $E_n$.
  Conversely, compatible membership in the shrinking tubes produces compatible,
  locally constant cosets modulo $p^n cal(O)_F$. Their limit is a continuous $F$-section,
  and the tube radii tending to zero identify it with the given coordinate.
  This proves (6.13) with the stated fiberwise meaning.

#prodef([Definition 6.5.])[
  For a complete characteristic-$p$ coefficient group $R_0$, define the locally finite distribution module on $F$ by
  #[#set math.equation(numbering: n => "(6.14)")
   $ cal(D)_(upright("lf")) \( F \, R_0 \) = "proj lim"_n product_(alpha in F \/ p^n cal(O)_F) R_0 \,
     $ <eq:analytic-distributions>]
  where the transition sums over the finitely many children of each coset.
    Equivalently, take the product over $F \/ cal(O)_F$ of the distribution modules on those compact open cosets.
    Every finite-partition module and every product in (6.14) carries its product topology.
] <def:locally-finite-distributions>

#thm([Proposition 6.6.])[
  #emph[For every compact profinite $T$, the complex
$ "fib"
  (R Gamma_v \( T times bb(A)_C^(1 \, diamond.stroked.small) \, cal(O)^flat \) arrow.r R Gamma_v \( T times \(
  bb(A)_C^1 \\ underline(F) \)^diamond.stroked.small \, cal(O)^flat \)) $

 has cohomology only in degree $2$, where it is naturally $cal(D)_(upright("lf")) \( F \, R_T \)$.
   This identification is equivariant for translations and scalar multiplication by $F^times$,
   with its natural action on distributions.]
] <prop:field-support>

#proof[
  Choose $b_(+)$ in the value group with $b_0 < b_(+) < p$.
    At tube level $n$, use the larger closed discs of radius $r_n^(+) = \| p \|^n
    b_(+)$ about all the $c_(n \, alpha)$. These discs and $E_n$ form an open cover of the affine line in the adic
    topology; the closed discs and annular boundaries here are rational open subspaces.
    The strict gap $r_n < r_n^(+)$ includes all boundary points.
    In each bounded region only finitely many discs occur. Denote these pairwise disjoint larger discs by
    $D_alpha$, and put $V_n = product.co_alpha D_alpha$. For this paragraph abbreviate $R
    Gamma_v \( T times Y^diamond.stroked.small \, cal(O)^flat \)$ by $R Gamma \( Y \)$.
    The two-open cover $bb(A)_C^1 = E_n union V_n$ gives
  $ R Gamma \( bb(A)_C^1 \) tilde.eq "fib"
    (R Gamma \( E_n \) xor product_alpha R Gamma \( D_alpha \) arrow.r product_alpha R Gamma \( D_alpha ∩ E_n \)) . $
  Taking the fiber of restriction to $R Gamma \( E_n \)$ yields
  $ product_alpha "fib" (R Gamma \( D_alpha \) arrow.r R Gamma \( D_alpha ∩ E_n \)) . $
  Here products are ordinary products of complexes of $bb(F)_p$-vector spaces and are exact.
    For a single hole, the two-open cover by $D_alpha$ and its full exterior identifies the corresponding factor
    with the support complex of Lemma 22. Thus the sole cohomology group at this stage is
  #[#set math.equation(numbering: n => "(6.15)")
   $ Q_n \( T \) = product_(alpha in F \/ p^n cal(O)_F) Q \( c_(n \, alpha) \, r_n \; T \) quad
     upright("in degree ") 2 . $ <eq:analytic-level-support>]
  This argument uses an actual open cover and ordinary sheaf cohomology;
    in particular the product at infinity has no imposed uniform norm bound.
  The inclusions $E_n subset E_(n + 1)$ induce an inverse system on the support complexes.
    A parent receives the sum of the support maps from its finitely many children.
    By Lemma 22, the residue of this map is literally the sum of their residues.
    We obtain short exact sequences of inverse systems
  #[#set math.equation(numbering: n => "(6.16)")
   $ 0 arrow.r K_n \( T \) arrow.r Q_n \( T \) arrow.r D_n \( T \) :=
     product_(alpha in F \/ p^n cal(O)_F) R_T arrow.r 0 . $ <eq:analytic-residue-system>]
  It is not necessary to choose Kummer lifts commuting with refinement:
    their residues, rather than their lifts, are canonical.
  Choose once and for all an integer $s gt.eq 1$ such that $p^s gt.eq theta^(- 1)$.
    A level-$n + s$ child has radius $r_(n + s)$, and its parent’s radius is $r_n = p^s r_(n + s)$.
    The child center lies strictly inside the parent disc. The parent exterior is therefore the same exterior when
    recentered at that child. In the child-centered Kummer complex for this same parent exterior,
    a residue-kernel representative has a primitive given by (6.12).
    It is therefore an actual boundary in the ordinary algebraic cokernel.
    Its vanishing is intrinsic to the parent exterior and does not require the parent’s original centered Kummer
    cover to agree with the child’s. Consequently the following map is zero:
  $ K_(n + s) \( T \) arrow.r K_n \( T \) . $
  This same $s$ works for all $n$, all centers, all parents in the product, and all $T$.
    Thus the kernel system is uniformly pro-zero.
  The transition $D_(n + 1) \( T \) arrow.r D_n \( T \)$ is split surjective:
    choose one child of each parent, put the parent coefficient in that child, and put zero in its other children.
    This defines a continuous section for the product topologies.
    Hence its derived inverse limit is its ordinary inverse limit $cal(D)_(upright("lf")) \( F \, R_T \)$,
    whereas the derived inverse limit of $K_n \( T \)$ is zero.
    Formula (6.13), the support triangles, and exactness of limits in the derived category now prove the
    assertion. The one-hole annular exhaustions involved in this argument have no additional derived-limit
    contribution by Lemma 19 and (6.9).
  Translations and scalar multiplication send tube systems to cofinal tube systems.
    Their action on the residue targets is the one proved in Lemma 22;
    consequently the limit action is the natural action on distributions. ◻
]

=== 6.4 The translation quotient and its orientation <the-translation-quotient-and-its-orientation>

The shifted term has a derived Steinberg antecedent. Heyer’s published calculation treats
  $upright("GL")_2 \( bb(Q)_p \)$ with algebraically closed characteristic-$p$ coefficients
  #cite(label("Heyer23")) Corollary 5.3.4; his later geometrical lemma treats finite extensions of $bb(Q)_p$
  #cite(label("HeyerGeo24")) Lemma 4.1.6 and Corollary 4.3.10.
  The comparison of smooth and solid coefficients in the coheight-one setting is made in
  #cite(label("BMR26"), form: "prose") Sections 3.5–3.6. We give the rank-two continuous group-cohomology
  calculation directly, retaining the topologies in Definition 23 and the action on the orientation line.

#thm([Lemma 6.7.])[
  #emph[Let $R_0 = C^flat$ or $R_T$, with trivial additive $F$-action. Then
#[#set math.equation(numbering: n => "(6.17)")
 $ H_(upright("cts"))^i \( F \, R_0 \) = cases(delim: "{", R_0 \, & i = 0 \,, 0 \, & i > 0 \,)
   $ <eq:analytic-constant-translations>]

 and
#[#set math.equation(numbering: n => "(6.18)")
 $ H_(upright("cts"))^i \( F \, cal(D)_(upright("lf")) \( F \, R_0 \) \) =
   cases(delim: "{", R_0 \, & i = 2 \,, 0 \, & i eq.not 2 .) $ <eq:analytic-distribution-translations>]

 In (6.18), multiplication by $u in cal(O)_F^times$ acts by $N_(F \/ bb(Q)_p) \( u \)^(- 1) med mod med p$,
   under the convention of pushforward on distributions and conjugation on cochains.]
] <lem:translation-cohomology>

#proof[
  Write $F = union.big_(m gt.eq 0) p^(- m) cal(O)_F$. Each lattice is isomorphic to $bb(Z)_p^2$.
    The completed group-ring resolution in two coordinates computes its continuous cohomology with trivial
    $R_0$-coefficients as $and.big^(*) \( R_0^2 \)$. Restriction from one lattice to its $p$-multiple is zero in
    every positive degree: on degree one it is multiplication by $p = 0$,
    and the higher-degree maps are its exterior powers.
  At the level of bar cochains, restriction between these compact open lattices is surjective,
    by extending a continuous function by zero on the clopen complement.
    Consequently continuous cochains on $F$ are their derived inverse limit, including parameter $T$.
    The degree-zero cohomology system is constant and the positive systems are pro-zero. This proves (6.17).
  Set $Lambda = cal(O)_F$, considered additively. By the product over $Lambda$-cosets,
    $cal(D)_(upright("lf")) \( F \, R_0 \)$ is the continuous coinduction from $Lambda$ of
    $cal(D) \( Lambda \, R_0 \)$. The quotient $F \/ Lambda$ is discrete;
    any set of representatives is therefore a continuous section.
    The usual bar comparison for Shapiro’s lemma, and its simplicial contraction,
    are continuous with this section and the product topology. It reduces (6.18) to $Lambda$-cohomology.
  Choose a $bb(Z)_p$-basis of $Lambda$. At finite quotient level the group-ring coordinate maps $gamma_i -
    1$ identify its distribution module with
  $ R_0 \[ X_1 \, X_2 \] \/ \( X_1^(p^n) \, X_2^(p^n) \) . $
  The transition is the quotient map, because it sums coefficients over fibers of the finite group quotient.
    Inverse limit gives
  $ cal(D) \( Lambda \, R_0 \) = R_0 \[ \[ X_1 \, X_2 \] \] $
  with the product topology on its coefficients. This is the formal power-series module,
    without restrictions on its coefficient sequence.
  The two-coordinate completed resolution now gives the cohomological Koszul complex
  #[#set math.equation(numbering: n => "(6.19)")
   $ 0 arrow.r M arrow.r^(\( X_1 \, X_2 \)) M^2 arrow.r^(\( - X_2 \, X_1 \)) M arrow.r 0 \, wide M =
     R_0 \[ \[ X_1 \, X_2 \] \] . $ <eq:analytic-koszul>]
  Multiplication by $X_1$ is injective, and multiplication by $X_2$ is injective after reduction modulo $X_1$.
    Thus the only cohomology is $M \/ \( X_1 \, X_2 \) = R_0$ in degree $2$.
    Coefficient deletion, insertion, and shifts give continuous maps in this argument,
    so it also proves the statement with $R_T$ and with further compact profinite parameters.
  Finally, a lattice automorphism with matrix $A in "GL"_2 \( bb(Z)_p \)$ induces on the linear terms of the
    completed group coordinates the matrix $A med mod med p$.
    Its action on the top exterior generator of the resolution is $det A med mod med p$.
    Applying $"Hom"$, with the contravariant cochain convention,
    gives the inverse determinant on the augmentation quotient.
    For multiplication by $u$, this determinant is $N_(F \/ bb(Q)_p) \( u \)$.
    The construction is independent of the chosen lattice basis and agrees under Shapiro’s comparison. ◻
]

#thm([Proposition 6.8.])[
  #emph[For every compact profinite $T$, the geometric period domain has cohomology
#[#set math.equation(numbering: n => "(6.20)")
 $ H_v^i \( T times \( N^(*) \)_(C^flat) \, cal(O)^flat \) =
   cases(delim: "{", R_T \, & i = 0 \,, R_T ⊗_(C^flat) ell_C \, & i = 3 \,, 0 \, & i eq.not 0 \, 3 \,)
   $ <eq:analytic-geometric-rows>]

 where $ell_C$ is a one-dimensional $C^flat$-space. All identifications are natural under continuous maps of $T$
   and the frame-group actions. On $ell_C$, $cal(O)_F^times subset J$ acts through the nontrivial character
$ delta \( u \) = N_(F \/ bb(Q)_p) \( u \) med mod med 3 . $

 The kernel-scalar action of $bb(Z)_p^times$ is trivial. The line spaces in (6.20) have their usual topology,
   as expressed by the continuous-parameter formula.]
] <prop:geometric-cohomology>

#proof[
  By Lemma 17,
  $ \( N^(*) \)_(C^flat)
    tilde.eq \[ thin \( bb(A)_C^1 \\ underline(F) \)^diamond.stroked.small \/ underline(F) thin \] . $
  The Čech spectral sequence of the translation quotient may be computed by continuous $F$-cochains.
    Indeed, in each bar degree its locally profinite parameter $F^r$ is a disjoint union of compact open pieces.
    The preceding analytic calculations apply on every such piece, and ordinary products give their global cochains.
  Apply continuous $F$-cohomology to the support triangle of Proposition 24.
    Lemma 21 and (6.17) put the affine-line term in degree zero, equal to $R_T$.
    The support term is in degree $2$ before group cohomology, and (6.18) puts it in degree $4$ afterward.
    The support triangle therefore puts the additional class of the complement quotient in degree $3$.
    This proves the degrees and dimensions in (6.20).
  Scalar multiplication preserves the normal Kummer residue.
    The extra action is consequently the rank-two lattice orientation of Lemma 25.
    At $p = 3$ its inverse equals itself, giving $delta$. The residue norm $bb(F)_9^times arrow.r
    bb(F)_3^times$ is surjective, so this character is nontrivial.
    A scalar $a in bb(Z)_p^times$, regarded as an element of $F^times$, has norm $a^2$, which is $1 med mod med
    3$. Thus the determinant adjustments of the kernel frame in Lemma 17 act trivially on the line.
    Inversion of frame conventions and the other unramified embedding give the same order-two character.
  All coefficient contractions and all lattice calculations were made with $R_T$,
    with their supremum and product topologies. Evaluation on $T$ therefore identifies the results with continuous
    functions to the displayed lines. No equivariant splitting of the complex between its two cohomology degrees
    is asserted or needed. ◻
]

=== 6.5 Frobenius on actual fixed-stage complexes <frobenius-on-actual-fixed-stage-complexes>

The geometric calculation has produced two $C^flat$-lines with their frame actions.
  We now descend their coefficients to $k$, while also identifying the arithmetic $H$-cochains of each finite
  marking stage $B = L^U$. Keeping $B$ fixed is essential: the quotient by $U$ can contribute additional
  cohomology, whose finiteness is needed in Section 7. The marking colimit will be taken only after that
  finite-stage calculation.

Put $q = \| k \|$. Base Frobenius on $C^flat$ gives a map $Phi$ on spaces and complexes defined over $k$.
  It is defined before choosing the untilt presentation in Lemma 17. In particular the chosen untilt need not be fixed.

For a finite marking stage $B = L^U$, set $X_B = "Spa" \( B^flat \)$, and let

$ cal(A)_B = H_v^0 \( X_B times_k "Spa" \( C^flat \) \, cal(O)^flat \) . $

Geometric base change here uses the v-sheaf associated with the finite-field base.
  Each field factor of $B$ is a complete equal-characteristic local field with finite residue field,
  hence has the form $k' \( \( s \) \)$. After splitting its finite constants,
  its geometric base change is the perfected punctured open unit disc.
  This identification can be checked directly on a characteristic-$p$ perfectoid test algebra over $C^flat$:
  a continuous map from $accent(k \( \( s \) \)^(upright("perf")), ̂)$ is specified by the image of $s$,
  an invertible topologically nilpotent element, together with its unique $p$-power roots.
  Conversely such an element evaluates every completed fractional Laurent series, by convergence of its tails.
  These are precisely the points of the perfected punctured open disc.
  Thus $cal(A)_B$ is a finite product of fractional Laurent Fréchet algebras on $0 < \| s \| < 1$,
  with constants in $C^flat$. Affinoid perfectoid acyclicity and Lemma 19 show that this geometric space,
  also after multiplication by a compact profinite set, has no higher structure-sheaf cohomology.

#thm([Lemma 6.9.])[
  #emph[Let $B$ be a finite product of finite separable extensions of $k \( \( t \) \)$.
    For every compact profinite $Q$ there is an exact sequence
#[#set math.equation(numbering: n => "(6.21)")
 $ 0 arrow.r "Map"_(upright("cts")) \( Q \, B^flat \) arrow.r
   "Map"_(upright("cts")) \( Q \, cal(A)_B \) arrow.r^(Phi - 1) "Map"_(upright("cts")) \( Q \, cal(A)_B \) arrow.r
   0 . $ <eq:analytic-frobenius-exact>]

 It is natural in $B \, Q$ and continuous actions over $k$.
   In particular, for a compact group $G$ acting continuously on $B$, over $k$ and preserving its valuations,
   the natural map identifies actual cochain complexes by
#[#set math.equation(numbering: n => "(6.22)")
 $ C_(upright("cts"))^bullet \( G \, B^flat \; T \) tilde.eq "fib"
   (Phi - 1 : C_(upright("cts"))^bullet \( G \, cal(A)_B \; T \) arrow.r C_(upright("cts"))^bullet \( G \,
   cal(A)_B \; T \)) . $ <eq:analytic-frobenius-cochains>]

]
] <lem:frobenius-descent>

#proof[
  Begin with $B = k \( \( s \) \)$. Elements of $cal(A)_B$ are fractional Laurent series
    $sum_(u in bb(Z) \[ 1 \/ p \]) c_u s^u$ converging on every smaller closed annulus in $0 < \| s \| < 1$.
    Frobenius sends $c_u$ to $c_u^q$ and leaves $s$ fixed. Its fixed coefficients belong to $k$.
    The annular $c_0$-condition for finite-field coefficients says exactly that the support is bounded below and
    has only finitely many exponents below any fixed real bound.
    These are the series in $accent(k \( \( s \) \)^(upright("perf")), ̂) = B^flat$.
    Moreover, the topology induced by the annular seminorms is its valuation topology:
    for nonzero finite-field coefficients the norm of a series is determined by its least exponent.
    This identifies the kernel in (6.21), including its topology.
  We prove surjectivity with the parameter $Q$ present. A continuous $Q$-family has continuous coefficient
    functions $c_u : Q arrow.r C^flat$ and uniformly small weighted tails in each annulus seminorm.
    For each $c in C^flat$, there is $b in C^flat$ satisfying
  #[#set math.equation(numbering: n => "(6.23)")
   $ b^q - b = c . $ <eq:analytic-artin-schreier>]
  If $\| c \| < 1$, the unique solution with $\| b \| < 1$ is
  $ b = - sum_(j gt.eq 0) c^(q^j) \, wide \| b \| = \| c \| . $
  If $\| c \| > 1$, every solution has $\| b \| = \| c \|^(1 \/ q)$; if $\| c \| = 1$,
    a solution has norm at most one. In every case we can choose
  #[#set math.equation(numbering: n => "(6.24)")
   $ \| b \| lt.eq \| c \| . $ <eq:analytic-root-bound>]
  The polynomial in (6.23) has derivative $- 1$. Near each value $c_0$,
    a chosen root therefore extends to a continuous local branch, obtained by adding the small solution for $c -
    c_0$. For a continuous coefficient $c_u : Q arrow.r C^flat$,
    compactness of $Q$ and a finite clopen refinement give a continuous choice $b_u$ with (6.24).
    The partitions may depend on $u$. The uniform bound preserves the weighted $c_0$-tails in every annulus
    seminorm. More explicitly, fix one such seminorm, write its monomial weight as $w \( u \)$,
    and fix $q_0 in Q$ and $epsilon > 0$. Outside a finite set of exponents $I$,
    we have $sup_(q in Q) \| b_u \( q \) \| w \( u \) < epsilon$.
    The same bound holds for $\| b_u \( q \) - b_u \( q_0 \) \| w \( u \)$ by ultrametricity.
    For the finitely many $u in I$, intersect the continuity neighborhoods of the coefficient functions.
    This proves continuity in the chosen annular seminorm; applying it to each seminorm proves continuity into
    $cal(A)_B$. Thus the assembled series is a continuous solution of (6.21),
    although the partitions chosen for its different coefficients need not agree.
  For $B = k' \( \( s \) \)$, put $f = \[ k' : k \]$. Geometric base change has one factor for each $k$-embedding
    of $k'$ into $C^flat$. Index these factors modulo $f$, so that $Phi \( x \)_i = F \( x_(i - 1) \)$,
    where $F$ raises each Laurent coefficient to its $q$-th power. To solve $Phi \( x \) - x = y$, first solve
  $ \( F^f - 1 \) x_0 = y_0 + sum_(j = 1)^(f - 1) F^(f - j) y_j \, $
  using the preceding argument with $q$ replaced by $q^f$, and then put $x_i = F \( x_(i - 1) \) -
    y_i$ for $1 lt.eq i < f$. These operations preserve the Fréchet algebra and all continuous parameter families, since
  $ parallel F^j a parallel_(\[ r \, b \]) = parallel a parallel_(\[ r^(1 \/ q^j) \, b^(1 \/ q^j) \])^(q^j) . $
  All transformed radii remain inside the open unit interval.
    In the kernel, $F^f x_0 = x_0$ and $x_i = F^i x_0$, which recovers the original finite constant field.
    Every nonzero finite-field coefficient has norm one, so the annular norms on this kernel depend only on the
    least exponent and induce exactly the valuation topology of $B^flat$.
    Finite cycles and finite products preserve this identification.
    The resulting kernel inclusion is intrinsic to $B$, and is independent of the uniformizer and of the chosen
    decomposition of the constants.
  The auxiliary root choices prove surjectivity; they are not claimed to be equivariant.
    The kernel inclusion and $Phi - 1$ themselves are canonical and natural.
  Finally apply (6.21) with $Q = T times G^r$ in every bar degree.
    The maps commute with the bar faces, since the action is over $k$ and commutes with base Frobenius.
    Termwise exactness gives (6.22). ◻
]

Let

#[#set math.equation(numbering: n => "(6.25)")
 $ K_C \( T \) = R Gamma_v \( T times \( N^(*) \)_(C^flat) \, cal(O)^flat \) \, wide K_k \( T \) =
   "fib" \( Phi - 1 : K_C \( T \) arrow.r K_C \( T \) \) . $ <eq:analytic-arithmetic-complex>]

On a one-dimensional geometric cohomology line, $Phi$ is a bijective $q$-semilinear map.
  Writing it as $a e mapsto c a^q e$, one obtains a nonzero fixed basis by solving $c a^(q - 1) = 1$.
  In that basis, its difference with the identity is (6.23).
  The proof with continuous parameters in Lemma 27 applies to these lines.
  Proposition 26 and the long exact sequence of the fiber consequently give

#[#set math.equation(numbering: n => "(6.26)")
 $ H^i K_k \( T \) =
   cases(delim: "{", "Map"_(upright("cts")) \( T \, k \) \, & i = 0 \,, "Map"_(upright("cts")) \( T \, ell \) \, &
   i = 3 \,, 0 \, & i eq.not 0 \, 3 \,) $ <eq:analytic-arithmetic-rows>]

where $ell$ is a one-dimensional $k$-space. The first identification is induced by constants.
  The character of $cal(O)_F^times$ on $ell$ is $delta$, and the kernel-scalar action is trivial.

The frame-group action on $ell$ is continuous for the discrete topology on $k$.
  Indeed, apply (6.26) to the universal compact profinite family of frame changes.
  The resulting functions take values continuously in the finite fixed line.
  In particular this is a finite smooth $J$-module.

=== 6.6 Finite marking stages and their colimit <finite-marking-stages-and-their-colimit>

The arithmetic complex $K_k \( T \)$ has the two discrete cohomology lines in (6.26).
  At a fixed stage $B = L^U$, Theorem 13 identifies the required $H$-quotient with $\[ N^(*) \/ U \]$.
  For sufficiently small $U$, we first prove finiteness and identify the cohomology with continuous profinite
  parameters. Shrinking $U$ then removes its positive-degree cohomology and leaves the two lines in the marking colimit.

#thm([Theorem 6.10.])[
  #emph[For a cofinal family of sufficiently small open normal subgroups $U subset J$, put $B = L^U$.
    Then $H_(upright("cts"))^a \( H \, B^flat \)$ is finite for every $a$, and it is zero for $a > 7$.
    For every compact profinite $T$, evaluation induces the natural identification
#[#set math.equation(numbering: n => "(6.27)")
 $ H^a C_(upright("cts"))^bullet \( H \, B^flat \; T \) = "Map"_(upright("cts")) #scale(x: 120%, y: 120%)[\(] T \,
   H_(upright("cts"))^a \( H \, B^flat \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:analytic-finite-stage-parameters>]

 where the finite group on the right is discrete. Moreover,
#[#set math.equation(numbering: n => "(6.28)")
 $ \( B^flat \)^H = k \, wide L^H = k \, $ <eq:analytic-invariant-field>]

 and
#[#set math.equation(numbering: n => "(6.29)")
 $ "colim"_U H^a C_(upright("cts"))^bullet \( H \, \( L^U \)^flat \; T \) =
   cases(delim: "{", "Map"_(upright("cts")) \( T \, k \) \, & a = 0 \,, "Map"_(upright("cts")) \( T \, ell \) \, &
   a = 3 \,, 0 \, & a eq.not 0 \, 3 .) $ <eq:analytic-completed-colimit>]

 The colimit identifications respect restrictions, conjugations and the $J$-action.
   The residual $P \/ H = bb(Z)_p^times$-action on both lines is trivial;
   on the upper line $cal(O)_F^times subset J$ acts by $delta$. The statements are natural in $T$.]
] <thm:completed-calculation>

#proof[
  #emph[The fixed-stage comparison.] At a fixed stage $B = L^U$, Theorem 13 gives
  #[#set math.equation(numbering: n => "(6.30)")
   $ \[ X_B \/ H \] tilde.eq \[ N^(*) \/ U \] . $ <eq:analytic-fixed-stage-quotient>]
  It is an identity of quotient v-stacks with their actual restriction and frame-change maps.
    After geometric base change, take derived global sections, including the product with $T$,
    and then the fiber of $Phi - 1$. On the left, Lemma 27 in every $H$-bar degree gives exactly
    $C_(upright("cts"))^bullet \( H \, B^flat \; T \)$. On the right, fibers commute with totalization,
    giving the $U$-bar totalization of the complexes $K_k \( T times U^r \)$. Thus there is a natural comparison
  #[#set math.equation(numbering: n => "(6.31)")
   $ C_(upright("cts"))^bullet \( H \, B^flat \; T \) tilde.eq "Tot" #scale(x: 120%, y: 120%)[\(] \[ r \] mapsto
     K_k \( T times U^r \) #scale(x: 120%, y: 120%)[\)] . $ <eq:analytic-stage-comparison>]
  Every operation here is at the fixed stage $B$. The comparison uses the pro-étale torsor in Theorem 13;
    it involves no interchange between continuous cochains and completion of the entire marking union.
  #emph[Finiteness and profinite families.] Choose $U$ small enough to be torsion-free uniform and to fix the
    finite lines in (6.26). Such $U$ form a cofinal family; they may be chosen normal in $J$.
    Their Lie dimension is $4$. Continuous cohomology with finite characteristic-$p$ coefficients is finite and
    vanishes above degree $4$, by the finite analytic resolution; see Lemma 18.
    The hypercohomology spectral sequence of (6.31) has only the rows
  #[#set math.equation(numbering: n => "(6.32)")
   $ E_2^(r \, 0) = H_(upright("cts"))^r \( U \, k \) \, wide E_2^(r \, 3) =
     H_(upright("cts"))^r \( U \, ell \) \, $ <eq:analytic-stage-spectral-sequence>]
  and $0 lt.eq r lt.eq 4$. It is first-quadrant with a finite possible range.
    Therefore the abutment is finite and vanishes above degree $7$.
    No splitting between the two rows is needed for this conclusion.
  We verify the family assertion in this spectral sequence.
    For finite discrete coefficients $V$, a continuous function $T times U^r arrow.r
    V$ factors through a finite clopen partition of $T$: cover the compact product by finitely many clopen
    rectangles on which the function is constant, and refine the partition of $T$.
    Thus cycles and boundaries in these row complexes may be computed on finitely many $T$-pieces.
    The same applies to primitives, and gives
  $ H_(upright("cts"))^r #h(-0.16667em) (U \, "Map"_(upright("cts")) \( T \, V \)) =
    "Map"_(upright("cts")) (T \, H_(upright("cts"))^r \( U \, V \)) $
  in the indicated parameter convention. Together with (6.26), this gives $E_2^(r \, j) \( T \) =
    "Map"_(upright("cts")) \( T \, E_2^(r \, j) \( * \) \)$. All these groups at a point are finite.
    At every subsequent page, naturality under point evaluations makes the differential pointwise equal to the
    differential at a point: evaluation in its target is injective by the preceding-page identification.
    Continuous functions on $T$ are exact on finite discrete groups, by lifting on a finite clopen partition.
    Taking kernels and cokernels therefore proves the same identification on the next page.
    The fixed finite rectangle of possible bidegrees gives a uniform limiting page and its natural finite abutment
    filtration. Here is also a direct verification for the abutment extensions.
    Suppose a functorial extension has outer terms $"Map"_(upright("cts")) \( T \, A \)$ and
    $"Map"_(upright("cts")) \( T \, B \)$, with $A \, B$ finite,
    and its middle functor commutes with finite clopen decompositions of $T$.
    On a partition where the image in $B$ is constant, lift that constant using an element of the middle group at
    a point. Subtracting its constant pullback leaves a continuous $A$-valued function.
    Evaluation in the middle group is therefore locally constant.
    The same construction realizes every locally constant function into the middle group at a point,
    and evaluation is injective by the two outer terms. All the filtration functors here commute with finite
    clopen decompositions, since the original complexes do. Induction through the finite filtration gives (6.27).
    This argument establishes the finite-stage parameter assertion before any use of strictness in the uncompleted
    calculation.
  #emph[Invariants and the marking colimit.] In total degree zero, the sole term of (6.32) is $H^0 \( U \, k \) =
    k$. It is induced by the constant unit. Hence $\( B^flat \)^H = k$.
    The inclusions $B arrow.r.hook B^flat$ are injective and $H$-equivariant, so $B^H = k$ as well.
    Every element of $L$ lies in some stage and then in a sufficiently large stage in the chosen cofinal family.
    This proves $L^H = k$ without any decompletion argument.
  It remains to pass to the marking colimit. For a finite smooth coefficient module $V$,
    every positive-degree continuous cohomology class of an open subgroup becomes zero after restriction to a
    sufficiently small open subgroup. One may use normalized inhomogeneous cochains:
    a continuous cocycle is zero at the identity tuple and has discrete values,
    hence is zero on the power of a sufficiently small open subgroup. Degree-zero invariants have colimit $V$.
    The spectral sequences (6.32) are uniformly bounded, and filtered colimits of abelian groups are exact.
    Their colimit therefore leaves only $k$ in degree zero and $ell$ in degree three, proving (6.29) for a point.
  For general $T$, use (6.27). Continuous maps to a discrete group have finite image,
    so $"Map"_(upright("cts")) \( T \, - \)$ commutes with a filtered colimit of discrete groups:
    finitely many values and finitely many equalities are realized at one common stage. This gives (6.29) with all $T$.
  Finally, (6.30) and (6.31) are natural for all frame changes.
    Their colimit action is therefore the action on the two lines in (6.26).
    By Proposition 26, the residual determinant acts through scalar multiplication by a $bb(Z)_p^times$-unit on
    the negative space, with trivial action on both lines at $p = 3$.
    The $J$-action restricts on $cal(O)_F^times$ to $delta$ on $ell$, as claimed. ◻
]

The output of this section concerns the completed perfections of individual finite marking stages.
  The next section compares their cochain colimit with the root-stage cochains specified in Definition 5.

== 7 From completed perfections to ordinary cochains <sec:decompletion>

The geometric calculation concerns the completed perfections $B^flat$ of finite marking stages $B = L^U$,
  whereas ordinary cooperations contain $L$. Theorem 39 first compares the root-stage union $R =
  L^(upright("perf"))$ with the completed-stage cochains. Theorem 41 then uses a distribution operator and the
  order-two norm quotient to compare $L$ with $R$ on $P$-cochains and compute the four ordinary cohomology lines.
  The central input is finite-stage finiteness, proved in Proposition 38.

Throughout this section cohomology of $L$ and $R$ uses Definition 5:
  a cochain with a profinite parameter takes its values in one complete finite marking and root stage.
  Write $C_(upright("cts")) \( T \, M \)$ for continuous functions with the uniform topology when $T$ is compact.
  For complete coefficients,

$ C_(upright("cts")) #scale(x: 120%, y: 120%)[\(] T \, C_(upright("cts"))^r \( G \, M \)
  #scale(x: 120%, y: 120%)[\)] = C_(upright("cts")) \( T times G^r \, M \) . $

For stage unions, the corresponding expression means the colimit of these fixed-stage spaces.

=== 7.1 Compact duality and the coefficient topology <compact-duality-and-the-coefficient-topology>

The finite resolution of Section 5 now supplies compact duality.
  We then establish the strictness and parameter-lifting facts needed to return from completed coefficients to
  ordinary cochains.

#thm([Lemma 7.1.])[
  (Compact–discrete duality).  #emph[Let $M$ be a compact continuous $bb(F)_p$-representation of $H$ and give
$ M^or = "Hom"_(bb(F)_p \, upright("cts")) \( M \, bb(F)_p \) $

 the discrete topology and the contragredient action. Continuous $H$-cohomology of $M$ is compact Hausdorff in its
   ordinary cochain quotient topology, and there are natural isomorphisms
#[#set math.equation(numbering: n => "(7.1)")
 $ H_(upright("cts"))^a \( H \, M \)^or tilde.equiv H_(upright("cts"))^(8 - a) \( H \, M^or \) .
   $ <eq:compact-cohomology-duality>]

 The transposed coefficient map induces the dual cohomology map.
   The reversed assertion holds for a discrete module and its compact dual.]
] <lem:compact-duality>

#proof[
  Use the finite resolution in Lemma 18. Its Hom complex on $M$ has compact terms and closed boundaries,
    so its cohomology is compact Hausdorff. The continuous comparisons with bar cochains identify the resulting
    topology with the bar-cochain quotient topology. This does not assert compactness of the bar-cochain spaces.
  Continuous $bb(F)_p$-duality is exact on compact vector spaces:
    a functional on a closed subspace extends after passing to a suitable finite-dimensional quotient.
    If $Q$ is finite projective over $Lambda = bb(F)_p \[ \[ H \] \]$, put $Q^(*) =
    "Hom"_Lambda \( Q \, Lambda \)$ and turn this right module into a left module using the involution $h mapsto
    h^(- 1)$. Finite-projective evaluation gives
  $ "Hom"_(Lambda \, upright("cts")) \( Q \, M \)^or tilde.equiv
    "Hom"_(Lambda \, upright("cts")) \( Q^(*) \, M^or \) . $
  For a finite free module this is coordinatewise evaluation; taking projective summands proves the general case.
    The identification is compatible with precomposition and coefficient maps.
    Apply it to each term, reverse degrees about eight, and use the reversed dual resolution in Lemma 18.
    Exactness of compact duality proves (7.1) and its naturality. Dualizing again proves the discrete assertion. ◻
]

#thm([Lemma 7.2.])[
  (Strictness).  #emph[Let $A^bullet$ be a complex of complete, separable, metrizable,
    linearly topologized $bb(F)_p$-spaces with continuous linear differentials.
    If $H^a \( A^bullet \)$ is finite, the boundary subgroup is open and closed in the cycle group,
    and the differential onto that boundary subgroup is open.
    Thus, for every neighborhood $V$ of zero in $A^(a - 1)$, sufficiently small $a$-cocycles have primitives in $V$.]
] <lem:strictness>

#proof[
  Put $E = A^(a - 1)$, $Z = ker d^a$, and $f = d^(a - 1) : E arrow.r Z$.
    The closed subspace $Z$ is complete and metrizable. Choose decreasing bases of open linear subspaces $E =
    E_0 supset E_1 supset dots.h.c$ in $E$ and $W_0 supset W_1 supset dots.h.c$ in $Z$.
    Separability makes $E \/ E_n$ countable. Since $Z \/ f \( E \)$ is finite,
    $Z \/ f \( E_n \)$ is countable as well. Set
  $ H_n = overline(f \( E_n \)) subset Z . $
  Countably many cosets of this closed subgroup cover $Z$. Baire’s theorem gives $H_n$ nonempty interior, so it is open.
  We show that $f \( E_n \) = H_n$ for every $n$. Given $z in H_n$, put $r_n = z$.
    If $r_j in H_j$, density of $f \( E_j \)$ in $H_j$ and openness of $H_(j + 1) ∩ W_(j + 1)$ allow a choice $e_j
    in E_j$ with
  $ r_(j + 1) = r_j - f \( e_j \) in H_(j + 1) ∩ W_(j + 1) . $
  Indeed the translated neighborhood of $r_j$ lies in $H_j$ and meets the dense image.
    The series $sum_(j gt.eq n) e_j$ is Cauchy because its tails lie in the decreasing open subspaces $E_j$.
    Completeness gives its sum $e in E_n$, since $E_n$ is closed.
    The residuals tend to zero, so continuity gives $f \( e \) = z$. Thus every $f \( E_n \) = H_n$ is open.
    Taking $n = 0$ proves that the boundary subgroup is open and closed in $Z$;
    the other values of $n$ prove that the differential onto it is open.
    Choosing $E_n$ inside a prescribed neighborhood gives the last assertion. ◻
]

#thm([Lemma 7.3.])[
  (Continuous profinite parameters).  #emph[Let $T$ be an arbitrary compact profinite space.]
  + #emph[A continuous map from $T$ to $F$ lifts across an open continuous surjection $E arrow.r.twohead
    F$ of complete metrizable linearly topologized groups.]
  + #emph[If a complex $A^bullet$ of complete, separable, metrizable,
    linearly topologized $bb(F)_p$-spaces with continuous linear differentials has finite cohomology, then naturally
#[#set math.equation(numbering: n => "(7.2)")
 $ H^a C_(upright("cts")) \( T \, A^bullet \) tilde.equiv C_(upright("cts")) \( T \, H^a \( A^bullet \) \) \,
   $ <eq:finite-cohomology-parameters>]

 where the group on the right is discrete.]
  + #emph[For a filtered diagram of such complexes, this identity commutes with the cochain colimit,
    with the colimit of cohomology groups given the discrete topology.]
] <lem:profinite-parameters>

#proof[
  Choose a decreasing basis of open subgroups $E_n$ of $E$ tending to zero,
    small enough that their images also tend to zero in $F$. Openness makes each $q \( E_n \)$ open.
    Approximate the given function on a finite clopen partition of $T$ by finitely many values and lift those
    values to $E$, leaving an error in $q \( E_1 \)$. Refine the partition and approximate that error by values
    with lifts in $E_1$, leaving an error in $q \( E_2 \)$. Continue.
    The corrections form a uniformly Cauchy sequence because all later corrections lie in $E_n$;
    completeness produces a continuous lift. No metrizability of $T$ is used.
  For the second assertion, a continuous family of cycles has a continuous image in the finite,
    discrete cohomology group by Lemma 30. A family mapping to zero lifts through the open differential onto
    boundaries by the first assertion. Conversely, choose a cycle representative for each of the finitely many
    values of a family of cohomology classes. This proves (7.2).
    Finally, a continuous map from $T$ to a discrete filtered colimit has finite image.
    Its finitely many values, and every equality needed between them, occur at one stage. Hence
  $ "colim"_i C_(upright("cts")) \( T \, V_i \) tilde.equiv C_(upright("cts")) \( T \, "colim"_i V_i \) $
  for discrete vector spaces $V_i$, even when their transition maps are not injective.
    Exactness of filtered colimits proves the last claim. ◻
]

We will repeatedly use two elementary consequences of the coefficient convention.
  A short exact coefficient sequence induces a short exact sequence of continuous cochain complexes whenever its
  surjection has a continuous section as a map of spaces; additivity and equivariance of the section are
  unnecessary. For a stage union, it suffices that every target stage lift continuously into one larger source
  stage and that the kernel have the induced topology. Quotients by open valuation lattices are discrete and admit
  such sections.

Also, if $G$ is compact and second countable and $D$ is countable discrete,
  every $C_(upright("cts"))^r \( G \, D \)$ is countable. Indeed $G^r$ has only countably many clopen sets,
  and a cochain is described by a finite clopen partition and finitely many values.
  This observation will be used only with $T$ a point.

The finite marking stages are products of local fields with finite residue fields.
  They, their finite root stages, and their completed perfections are Polish.
  For the latter assertion, choose a countable dense subset at each root stage;
  their union is dense in the completed perfection. Cochain spaces on the compact metrizable spaces $H^r$ are
  Polish for the uniform topology: completeness is uniform completeness,
  and locally constant functions on countably many finite clopen partitions supply separability.
  The valuation balls are invariant. The same assertions hold for closed order lattices.
  Thus all applications below of Lemmas 18 and 30 have the stated hypotheses.
  For arbitrary $T$, we instead use Lemma 31; we do not assert that its parameterized cochain spaces are Polish or
  countable.

=== 7.2 Distributions and the invariant differential <distributions-and-the-invariant-differential>

The normalized generator-lift torsors of Lemma 16 are torsors under $Gamma_2 \[ p^l \]$, with coordinate algebras

$ R_l = L^(1 \/ p^(2 l)) \, wide R = "colim"_l R_l . $

Their translation action commutes with $H$. Changes of connected marking act on translations by continuous
  constant automorphisms.

#thm([Lemma 7.4.])[
  (The distribution operator).  #emph[After the fixed finite enlargement of $k$,
    the inverse-limit distribution algebra of the translation tower is $k \[ \[ D \] \]$.
    A parameter $D$ can be chosen with the following properties.]
  + #emph[Its action on $R$ is $L$-linear and locally nilpotent, commutes with $H$, and satisfies
#[#set math.equation(numbering: n => "(7.3)")
 $ ker \( D^(p^i) : R arrow.r R \) = L^(1 \/ p^i) quad \( i gt.eq 0 \) \, wide D :
   R arrow.r.twohead R . $ <eq:distribution-kernels>]

]
  + #emph[The order-two norm quotient acts on $D$ by its nontrivial character.
    The action of $J$ on $k \[ \[ D \] \]$ is continuous on finite jets.]
  + #emph[If $i$ is positive, even, and divisible by $\[ k : bb(F)_p \]$, and $q = p^i$, then
#[#set math.equation(numbering: n => "(7.4)")
 $ D \( f^q \) = \( D^q f \)^q \, wide D^q \( a f \) = a D^q f quad \( a in L^(1 \/ q) \) .
   $ <eq:distribution-frobenius>]

]
  + #emph[Each operator on a fixed root stage is continuous after passage to a finite larger marking stage.
    Every finite target stage has a continuous additive lift under $D$ at some finite larger marking and root
    stage. Thus the sequence with kernel $L$ and operator $D$ is exact on the prescribed cochains,
    also with profinite parameters.]
] <lem:distribution-operator>

#proof[
  The Cartier dual of the height-two, dimension-one Honda group is again connected of height two and dimension
    one; see #cite(label("Tate67")) Section 2.2, Proposition 1, and Section 2.3,
    Proposition 3 and the Frobenius–Verschiebung calculation below.
    A coordinate on that dual identifies the finite distribution algebra with $k \[ D \] \/ \( D^(p^(2 l)) \)$;
    the transition maps are restriction to the dual torsion kernels. Their inverse limit is $k \[ \[ D \] \]$.
  After faithfully flat trivialization of a finite torsor, its function module is the dual regular module of the
    truncated polynomial ring. The pairing that extracts the coefficient of $D^(p^(2 l) - 1)$ from a product
    identifies that dual module with a single regular nilpotent block.
    Consequently $ker D^e$ on $R_l$ has rank $e$ over $L$ for $1 lt.eq e lt.eq p^(2 l)$.
    These ranks descend under faithful flatness. For $q = p^i$, the formal-group coproduct satisfies
  $ Delta \( D^q \) in \( D^q ⊗ 1 \, 1 ⊗ D^q \) . $
  Hence $ker D^q$ is a subalgebra. On a field factor it is an intermediate field of purely inseparable degree $q$.
  The element $t$ is a $p$-basis of $K$ and remains a $p$-basis under separable extension.
    An intermediate field of degree $p^i$ in a one-generator purely inseparable extension is contained in
    $L^(1 \/ p^i)$: every element has purely inseparable degree at most $p^i$. Equality follows from the degrees.
    This proves the kernel formula on field factors, and hence on $L$.
    To justify the last passage without requiring a chosen global field factor,
    note that $L$ is an ind-étale algebra over a field and is absolutely flat.
    The finite free module identities in question can be checked at its residue fields,
    which are separable algebraic extensions of $K$. In a larger nilpotent block,
    the old kernel is contained in the image of $D$. This proves surjectivity on the union and nonvanishing of the
    top operator on every finite kernel.
  By Lemma 15, a norm unit rescales the chosen étale generator by that unit or its inverse.
    It therefore conjugates the translation group by the corresponding scalar.
    Lemma 16 checks directly that the central order-two unit acts by $\[ - 1 \]$ on the named translations.
    On the tangent of the Cartier dual it therefore has character $- 1$.
    If $D_0$ is any parameter and $tau$ denotes that order-two action,
    replace it by $\( D_0 - tau \( D_0 \) \) \/ 2$. Its linear coefficient is unchanged,
    so it is a parameter and satisfies $tau \( D \) = - D$. Continuity of the marking action gives continuity on
    every finite jet of this parameter algebra.
  For the Frobenius identities, use the Honda model over $bb(F)_p$.
    Its Frobenius $Phi$ satisfies $Phi^2 = \[ p \]$. Since $V Phi = \[ p \] =
    Phi^2$ on the divisible group and $Phi$ is faithfully flat, cancellation gives $V = Phi$.
    Cartier duality exchanges these operators. For the indicated even $i$,
    their $i$th iterates are $\[ p^(i \/ 2) \]$. If $A_l = cal(O) \( Gamma_2 \[ p^l \] \)$ and $chevron.l b \,
    xi chevron.r = xi \( b \)$ is its pairing with distributions, Cartier-dual naturality gives, because $q$ fixes $k$,
  $ chevron.l b^q \, D chevron.r = chevron.l b \, \( V^i \)^(*) D chevron.r = chevron.l b \, D^q chevron.r . $
  For the last equality, an $bb(F)_p$-coordinate $z$ on the dual has $\( V^i \)^(*) z = z^q$; writing $D =
    sum c_n z^n$ over $k$ gives $\( V^i \)^(*) D = D^q$. If a torsor coaction is $rho \( f \) = sum_j f_j ⊗ b_j$,
    it follows that
  $ D \( f^q \) = sum_j f_j^q chevron.l b_j^q \, D chevron.r =
    (sum_j f_j chevron.l b_j \, D^q chevron.r)^q = \( D^q f \)^q . $
  The coefficients $f_j$ retain their $q$th powers; no splitting of the torsor is used.
    Apply this identity to $a f$ with $a^q in L$ and use $L$-linearity of $D$ to obtain the second identity in (7.4).
  On a fixed root level only finitely many powers of $D$ act.
    Their matrices in the fractional-power basis of the $p$-basis have finitely many coefficients in $L$,
    hence are defined at one finite separable stage. They are continuous maps between finite-dimensional spaces
    over complete local fields. For a finite target stage, choose a $D$-preimage of each member of a finite basis
    over that stage’s separable coefficient algebra. Put these finitely many preimages in one larger stage and
    extend linearly. This is a continuous additive section. At a finite root stage the intersection with $ker D =
    L$ is its separable stage, with the induced topology, by separability versus pure inseparability.
    The coefficient exactness criterion above proves the final assertion, including parameters. ◻
]

#thm([Proposition 7.5.])[
  (An invariant differential).  #emph[There is an $H$-invariant basis $eta in Omega_(L \/ k)^1$ defined,
    together with its inverse frame, at one finite separable marking stage.]
] <prop:invariant-differential>

#proof[
  By Lemma 4, ordinary differentials of $A$ are freely generated by $d a \,
    d t$ and agree with continuous differentials. The Kodaira–Spencer homomorphism for the universal $p$-divisible
    group is the functorial isomorphism
  #[#set math.equation(numbering: n => "(7.5)")
   $ "Hom"_A \( "Lie" cal(G) \, omega_(cal(G)^or) \) arrow.r^(med tilde.op med) Omega_(A \/ k)^1 .
     $ <eq:KS-decompletion>]
  For a $p$-divisible group $G$ over any ring $B$ on which $p$ is nilpotent,
    isomorphism classes of lifts across $B = B' \/ I$ with $I^2 =
    0$ form a torsor under $"Hom"_B \( omega_(G^or) \, I ⊗_B "Lie" G \)$.
    The associated functorial Kodaira–Spencer map $"Hom"_B \( "Lie" G \, omega_(G^or) \) arrow.r
    Omega_(B \/ bb(Z))^1$ controls changes of a lifting ring map #cite(label("Lau10")) Theorem 5.1 and
    Equation (5.1), p. 226. The isomorphism in (7.5) uses the separate universal-deformation case
    #cite(label("Lau10")) paragraph following Equation (5.2), p. 227:
    $A = k \[ \[ a \, t \] \]$ is a complete local Noetherian $k$-algebra with residue field $k$,
    the deformation is universal, and $k$ is perfect. In this case Lau identifies completed relative differentials
    with ordinary absolute differentials. Since every absolute derivation kills the perfect field $k$,
    the latter are $Omega_(A \/ k)^1$, in agreement with the finite $p$-basis calculation above.
    Universality makes the closed-point map bijective; both modules are free of rank two,
    so the map is an isomorphism over $A$.
  Over $L$ the two markings give
  $ 0 arrow.r Gamma_(2 \, L) arrow.r cal(G)_L arrow.r \( bb(Q)_p \/ bb(Z)_p \)_L arrow.r 0 . $
  Thus $"Lie" cal(G)_L = "Lie" Gamma_(2 \, L)$ has an $H$-fixed frame.
    Dualizing gives the exact sequence of invariant-form modules
  #[#set math.equation(numbering: n => "(7.6)")
   $ 0 arrow.r omega_(Gamma_2^or \, L) arrow.r omega_(cal(G)^or \, L) arrow.r omega_(mu_(p^oo) \, L) arrow.r
     0 . $ <eq:dual-hodge-marked-sequence>]
  Both end lines have $H$-fixed frames. Exactness may be checked after the faithfully flat extension to perfect
    coefficients, where the marked connected–étale extension splits, and then descended.
    The determinant of the middle module is therefore equivariantly trivial even when the extension over $L$ is
    nonsplit. Taking determinants in (7.5) shows that $det \( Omega_(A \/ k)^1 ⊗_A L \)$ has an $H$-fixed basis.
  The conormal line of $a = 0$ also has an $H$-fixed frame on this marking cover.
    Explicitly, comparison of the coefficient of $T^p$ under a coordinate change with leading coefficient $c$
    gives $a' = c^(1 - p) a$ in the corresponding coordinate convention.
    Thus $a \( d T \)^(p - 1)$ is the first Hasse section, and its conormal has the inverse periodicity twist.
    The connected marking frames $d T$ and trivializes that twist.
    More explicitly, if the fixed cotangent frame is $e = u thin d T$, then $T' = c T + dots.h.c$ gives $u' =
    u \/ c$ and $a' = c^(1 - p) a$. Hence $\[ a' \] \( u' \)^(1 - p) = \[ a \]
    u^(1 - p)$ is an invariant conormal frame. Since $L \/ K$ is ind-étale, the conormal sequence is
  $ 0 arrow.r L thin d a arrow.r Omega_(A \/ k)^1 ⊗_A L arrow.r Omega_(L \/ k)^1 arrow.r 0 . $
  Taking the determinant quotient produces the desired $H$-fixed basis $eta$.
    This construction uses differentials over $A$ and $L$, not differentials of a perfection.
    Writing $eta = f thin d t$, both $f$ and $f^(- 1)$ belong to a common finite marking stage;
    enlarging that stage if necessary makes $eta$ a basis on every field factor. ◻
]

Theorem 28 gives, before decompletion,

#[#set math.equation(numbering: n => "(7.7)")
 $ L^H = k . $ <eq:L-H-invariants>]

Write $upright("Fr") \( f \) = f^p$ for coefficient Frobenius and $cal(O)_B$ for the product of the valuation
  rings of the field factors of a finite marking stage $B$.
  Let $"Car"$ be intrinsic Cartier on differentials #cite(label("Cartier58")) Chapter II, Section 6, and set

#[#set math.equation(numbering: n => "(7.8)")
 $ C_0 \( f \) = frac("Car" \( f eta \), eta) . $ <eq:normalized-Cartier>]

It is $bb(F)_p$-linear, satisfies $C_0 \( a^p f \) = a C_0 \( f \)$ for $a \, f in L$, and commutes with $H$.

#thm([Lemma 7.6.])[
  (Cartier traces and residue duality).  #emph[For every $i gt.eq 1$, with $q = p^i$,
    there is $c_i in k^times$ such that
#[#set math.equation(numbering: n => "(7.9)")
 $ D^(q - 1) \( f^(1 \/ q) \) = c_i C_0^i \( f \) wide \( f in L \) . $ <eq:Cartier-distribution-trace>]

 In particular, $C_0 \( f^p \) = 0$. If $B = L^U$ contains $eta$ as a basis, then
#[#set math.equation(numbering: n => "(7.10)")
 $ 0 arrow.r B arrow.r^(upright("Fr")) B arrow.r^(d \/ eta) B arrow.r^(C_0) B arrow.r 0 $ <eq:Cartier-exact-sequence>]

 is exact and its two short exact factors have continuous additive sections onto their images.]
  #emph[Write $B = product_j kappa_j \( \( s_j \) \)$ and $eta = h_j \( s_j \) thin d s_j \/ s_j$ on its factors. Define
$ M = { f : "ord"_(s_j) \( f_j h_j \) > 0 upright(" for all ") j } \, wide M^0 = { f :
  "ord"_(s_j) \( f_j h_j \) gt.eq 0 upright(" for all ") j } . $

 These are compact open $H$- and $C_0$-stable lattices, and $M^0 \/ M$ is finite. For the pairing
#[#set math.equation(numbering: n => "(7.11)")
 $ chevron.l f \, g chevron.r_B = sum_j "Tr"_(kappa_j \/ bb(F)_p) "Res"_(s_j) \( f_j g_j eta \) $ <eq:residue-pairing>]

 there are topological $H$-equivariant identifications
#[#set math.equation(numbering: n => "(7.12)")
 $ M^or = B \/ cal(O)_B \, wide \( B \/ M \)^or = cal(O)_B \, wide chevron.l C_0 f \, g chevron.r_B =
   chevron.l f \, g^p chevron.r_B . $ <eq:residue-lattice-duals>]

]
] <lem:Cartier-traces>

#proof[
  The functional $I_i \( f \) = D^(q - 1) \( f^(1 \/ q) \)$ takes values in $L$ by (7.3);
    it is nonzero on every field factor by the nilpotent-block calculation.
    It satisfies $I_i \( a^q f \) = a I_i \( f \)$ and is $H$-equivariant.
    The same semilinearity and equivariance hold for $C_0^i$. The Cartier pairing gives an isomorphism
  #[#set math.equation(numbering: n => "(7.13)")
   $ upright("Fr")_(*)^i L arrow.r "Hom"_L \( upright("Fr")_(*)^i L \, L \) \, wide
     b mapsto #scale(x: 120%, y: 120%)[\[] f mapsto C_0^i \( b f \) #scale(x: 120%, y: 120%)[\]] .
     $ <eq:Cartier-perfect-pairing>]
  Here $upright("Fr")_(*)^i L$ has the scalar action $a dot.op f = a^q f$.
    Both modules are free of rank $q$ in the common $p$-basis. On a field factor the pairing is nondegenerate:
    for $b eq.not 0$, choose $z$ with $C_0^i \( z \) eq.not 0$ and evaluate at $b^(- 1) z$.
    This proves (7.13), also for finite products and the ind-étale union.
    Thus a unique multiplier $b_i$ satisfies $I_i \( f \) = C_0^i \( b_i f \)$.
    It is a unit by nonvanishing on each factor. Equivariance and uniqueness give $b_i in L^H = k$ by (7.7).
    Taking $c_i = b_i^(1 \/ q)$ proves (7.9).
  This argument works for $i = 1$ without the even-iterate restriction in (7.4).
    Since $D$ kills $L$, it gives $c_1 C_0 \( f^p \) = D^(p - 1) f = 0$.
    In particular $C_0 upright("Fr") = 0$ is a consequence of the invariant torsor and differential;
    it was not assumed for an arbitrary choice of $eta$.
  On a Laurent field the Cartier formula is
  $ "Car" (sum_n a_n s^n frac(d s, s)) = sum_n a_(p n)^(1 \/ p) s^n frac(d s, s) . $
  It proves continuity and surjectivity. Its kernel consists of differentials whose logarithmic coefficients at
    indices divisible by $p$ vanish; a continuous additive primitive is $sum_(p divides.not n) \( a_n \/ n \)
    s^n$. The kernel of $d$ is $B^p$, and its root map is continuous.
    A continuous section of Cartier sends $sum a_n s^n d s \/ s$ to $sum a_n^p s^(p n) d s \/ s$.
    Multiplication or division by $eta$ gives the sections and exactness in (7.10).
  The logarithmic order of a differential is independent of the local uniformizer,
    since $d s' \/ s'$ is a unit multiple of $d s \/ s$. Invariance of $eta$ therefore makes $M$ and $M^0$
    invariant under $H$, including permutations of the field factors.
    The Cartier formula preserves positive and nonnegative logarithmic order.
    Furthermore $M^0 \/ M tilde.equiv product_j kappa_j$ as additive groups.
  Residue is invariant under coordinate change, and the sum of traces is invariant under residue-field
    automorphisms and permutations. Thus (7.11) is $H$-invariant.
    A continuous functional on $M$ uses finitely many Laurent coefficients;
    it is represented by an element of $B \/ cal(O)_B$. Conversely every negative principal part is detected by
    pairing against a suitable positive logarithmic coefficient. This proves the first dual identification.
    An arbitrary functional on the discrete space $B \/ M$ is a sequence of coefficient functionals,
    represented by a power series in $cal(O)_B$, which proves the second.
    The classical residue adjointness includes a Frobenius twist #cite(label("Serre58Topology")) Section 10,
    Proposition 9. Here the local normalization gives
  $ "Res" #scale(x: 120%, y: 120%)[\(] g "Car" \( f eta \) #scale(x: 120%, y: 120%)[\)] =
    "Res" #scale(x: 120%, y: 120%)[\(] "Car" \( g^p f eta \) #scale(x: 120%, y: 120%)[\)] . $
  Taking the finite-field trace removes the $p$th-root operation on the residue and proves the last identity in
    (7.12). ◻
]

#thm([Lemma 7.7.])[
  (Good finite stages).  #emph[There is a cofinal collection of open normal uniform subgroups $U subset
    J$ for which $B = L^U$ has all the following properties:]
  + #emph[$eta$ is a basis over $B$ and $H_(upright("cts"))^a \( H \, B^flat \)$ is finite for every $a$;]
  + #emph[there is $theta_0 in B^(1 \/ p)$ with $D theta_0 = 1$;]
  + #emph[for every $sigma in U$,
#[#set math.equation(numbering: n => "(7.14)")
 $ sigma \( D \) - D in D^(p + 2) k \[ \[ D \] \] . $ <eq:good-stage-jets>]

]
  #emph[For these stages $D$ restricts to a continuous $H$-equivariant map $B^(1 \/ p) arrow.r B^(1 \/ p)$.]
] <lem:good-stages>

#proof[
  In a regular nilpotent block, a preimage $theta_0$ of $1$ is killed by $D^2$ and hence by $D^p$.
    The kernel formula puts it in $L^(1 \/ p)$. Its $p$th power and the finite coefficients of $eta$ and its
    inverse belong to one finite separable stage. The action on finite distribution jets is continuous,
    so the kernel of its action modulo $D^(p + 2)$ is open. Intersect these finite-data stabilizers,
    take an open normal core, and pass to a still smaller uniform subgroup in the cofinal collection of
    Theorem 28. This gives all three conditions, cofinally.
  If $b in B^(1 \/ p)$, then $D^p b = 0$. For $sigma in U$, (7.14) gives $sigma \( D b \) = D b$;
    moreover $D b$ is still killed by $D^p$. Uniqueness of purely inseparable roots identifies
    $\( L^(1 \/ p) \)^U = B^(1 \/ p)$, so $D$ preserves this stage.
    Continuity follows from Lemma 32 and the induced valuation topology. ◻
]

=== 7.3 Finiteness at a separable stage <finiteness-at-a-separable-stage>

For any of our valued algebras $E$, write $E^(+ +) = { f : v \( f \) > 0 }$,
  where positivity is required on every field factor, and write $cal(O)_E$ for the elements of nonnegative
  valuation. These are the ordinary valuation lattices. The lattice $M$ in Lemma 34, by contrast,
  measures the logarithmic order of $f eta$.

The completed calculation first gives finite cohomology for $B^flat \/ cal(O)_(B^flat)$.
  Residue duality will turn this into a finite stable Cartier image on the compact cohomology of $M$.
  We record that completed-coefficient input and a compact-operator lemma before using them to prove finiteness at $B$.

#thm([Lemma 7.8.])[
  (Completed positive coefficients).  #emph[At every good stage $B$,
    the complex $C_(upright("cts"))^bullet \( H \, \( B^flat \)^(+ +) \)$ is acyclic.
    Moreover, $H^a \( H \, cal(O)_(B^flat) \)$ and $H^a \( H \, B^flat \/ cal(O)_(B^flat) \)$ are finite for every $a$.]
] <lem:completed-positive>

#proof[
  Write $partial$ for the cochain differential and $upright("Fr")$ for coefficient Frobenius.
    A continuous positive-valued cochain on the compact space $H^r$ has valuations bounded below by some
    $epsilon.alt > 0$. Its iterates under $upright("Fr")$ therefore tend uniformly to zero.
    In positive degree, apply Lemma 30 to $C_(upright("cts"))^bullet \( H \, B^flat \)$,
    whose cohomology is finite by Theorem 28. A sufficiently large Frobenius iterate of a positive cocycle has a
    primitive with positive values. Frobenius is a homeomorphism of $B^flat$ and of its positive lattice;
    its inverse carries that primitive back to a positive primitive of the original cocycle.
    In degree zero the finite invariant group is discrete in the cycle topology.
    A sufficiently large Frobenius iterate of a positive invariant is therefore zero,
    and injectivity of Frobenius makes the invariant zero.
  The residue algebra $cal(O)_(B^flat) \/ \( B^flat \)^(+ +)$ is a finite product of finite fields.
    Its cohomology is finite by Lemma 18. The valuation quotients have continuous sections,
    so the long exact sequences for the positive, integral, and full coefficients prove both finiteness assertions. ◻
]

We isolate the compact algebra used in the countability argument.

#thm([Lemma 7.9.])[
  (A compact operator).  #emph[Let $N$ be a compact Hausdorff $bb(F)_p$-vector space, let $C : N arrow.r
    N$ be continuous and $bb(F)_p$-linear, and suppose that
$ I = ⋂_(n gt.eq 0) C^n N quad upright("and") quad N \/ C N $

 are finite. Then $ker C$ is finite, and every subgroup of $N$ whose elements have finite forward $C$-orbits is
   finite. If $f : N arrow.r X$ is a homomorphism with finite kernel, then
#[#set math.equation(numbering: n => "(7.15)")
 $ ⋂_(n gt.eq 0) f \( C^n N \) = f \( I \) . $ <eq:stable-image-finite-fiber>]

 No topology on $X$ is required in this last assertion.]
] <lem:compact-operator>

#proof[
  Compactness of the nested sets of preimages of an element of $I$ gives $C I = I$.
    On $Q = N \/ I$, the compact images $C^n Q$ have intersection zero.
    They eventually lie in any specified neighborhood of zero:
    otherwise their intersections with the closed complement of that neighborhood would have the finite
    intersection property. Thus $C$ is uniformly topologically nilpotent on $Q$. The formula
  $ (sum_(n gt.eq 0) a_n z^n) x = sum_(n gt.eq 0) a_n C^n x $
  defines a continuous $bb(F)_p \[ \[ z \] \]$-module structure on $Q$, with $z = C$.
    The series converges uniformly, and this also proves continuity.
  Choose lifts $x_1 \, dots.h \, x_r$ of a basis of the finite space $Q \/ C Q$.
    Successively express a vector modulo $C Q$, then its remainder modulo $C^2 Q$, and so on.
    The remainder tends uniformly to zero, so every vector is an $bb(F)_p \[ \[ z \] \]$-linear combination of the
    $x_j$. Hence $Q$ is a finitely generated module over the discrete valuation ring $bb(F)_p \[ \[ z \] \]$.
    Its structure theorem makes its $z$-power torsion finite.
    In particular $ker \( C : Q arrow.r Q \)$ is finite, and the finite kernel of $N arrow.r
    Q$ then makes $ker \( C : N arrow.r N \)$ finite.
  If an element has finite forward orbit, its image in $Q$ tends to zero through a finite set and is eventually
    zero. Such images belong to the finite $z$-power torsion of $Q$.
    The fibers of $N arrow.r Q$ are finite, proving the orbit assertion.
  For the last claim, fix $x$ in the left side of (7.15). The sets $f^(- 1) \( x \) ∩ C^n
    N$ are nonempty nested compact sets: each is a closed subset of the finite fiber $f^(- 1) \( x \)$.
    Their intersection is nonempty and lies in $I$. The reverse inclusion is immediate. ◻
]

#thm([Proposition 7.10.])[
  (Finite-stage finiteness).  #emph[For every good $B$, every finite root stage $B^(1 \/ p^e)$,
    and every $H$-stable valuation-order lattice in such a stage, continuous $H$-cohomology is finite in every degree.]
] <prop:finite-stage-finiteness>

#proof[
  We first prove countability at the separable stage $B$. The finite cohomological range lets us argue at a
    largest degree where countability could fail. At that degree,
    Cartier will force Frobenius to have countable image; an explicit distribution lift will show that its kernel
    is countable as well. Once countability is known in every degree, compact duality will give finiteness.
  Fix a good stage $B$ and set
  #[#set math.equation(numbering: n => "(7.16)")
   $ N_a = H^a \( H \, M \) \, wide X_a = H^a \( H \, B \) \, wide f_a : N_a arrow.r X_a . $ <eq:finite-stage-notation>]
  The spaces $N_a$ are compact Hausdorff by Lemma 29; no separatedness is yet asserted for $X_a$.
    Cartier acts on both and commutes with $f_a$. Since $B \/ M$ is countable discrete,
    its cochain groups are countable. The long exact sequence therefore gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ ker f_a med upright("and") med "coker" f_a med upright("are countable") . $ <eq:countable-defects>]
  #emph[Step 1: the compact Cartier model.] For every degree $a$, put
  $ I_a = ⋂_(n gt.eq 0) C_0^n N_a . $
  We claim that $I_a$ is finite. The completed calculation supplies finite cohomology of the discrete
    principal-part quotient.
  Compact duality and the residue pairing identify
  $ N_a^or = H^(8 - a) \( H \, B \/ cal(O)_B \) \, $
  and transpose $C_0$ to Frobenius. There is an identification of discrete $H$-modules
  #[#set math.equation(numbering: n => "(7.18)")
   $ "colim"_(upright("Fr")) B \/ cal(O)_B = B^(upright("perf")) \/ cal(O)_(B^(upright("perf"))) =
     B^flat \/ cal(O)_(B^flat) . $ <eq:principal-parts-perfection>]
  At the $e$th copy of the left side the first map sends $f$ to $f^(1 \/ p^e)$;
    its compatibility is precisely the Frobenius transition. The second equality follows by density:
    every completed element differs from an element of the root-stage union by an integral element,
    and integrality on that union is the induced valuation condition.
  Continuous cochains into discrete modules commute with filtered colimits, since they have finite image.
    Consequently $"colim"_(upright("Fr")) N_a^or$ is finite by Lemma 36.
    Dualizing makes $"proj lim"_(C_0) N_a$ finite. Its projection onto its zeroth coordinate is exactly $I_a$.
    To see surjectivity onto $I_a$, the finite strings of compatible predecessors of any element of $I_a$ form
    nonempty compact sets; compactness supplies an infinite compatible string. Thus $I_a$ is finite.
  #emph[Step 2: Cartier at a largest uncountable degree.] Suppose that some $X_a$ is uncountable and choose the
    largest such $a$; such an $a$ exists because cohomology vanishes above eight.
    Split (7.10) into the two short exact sequences with intermediate module $V = "im" \( d \/ eta \)$.
    They are exact on cochains. The first sequence shows that $H^(a + 1) \( H \, V \)$ is countable,
    since it lies between quotients or subgroups of the countable groups $X_(a + 1)$ and $X_(a + 2)$.
    The second sequence embeds $X_a \/ C_0 X_a$ in $H^(a + 1) \( H \, V \)$, so this quotient is countable.
  Put $W = ker f_a$, $A_a = "im" f_a$, and $E_a = "coker" f_a$.
    The exact sequences for $C_0$ on $0 arrow.r W arrow.r N_a arrow.r A_a arrow.r 0$ and $0 arrow.r A_a arrow.r
    X_a arrow.r E_a arrow.r 0$ show that $N_a \/ C_0 N_a$ is countable:
    its successive possible contributions are $W \/ C_0 W$, $E_a \[ C_0 \]$, and $X_a \/ C_0 X_a$,
    all countable by (7.17) and the countability of $X_a \/ C_0 X_a$ just proved.
    This quotient is compact Hausdorff. A countable compact Hausdorff group is finite by Baire’s theorem:
    if no singleton were open, its countable cover by singletons would be meagre.
    Lemma 37 now applies to $N_a$, since Step 1 made its stable Cartier image $I_a$ finite.
  Every element of $W$ has finite forward Cartier orbit. In degree zero $W = 0$.
    In positive degree represent it by the connecting image of a cocycle with values in $B \/ M$.
    That cochain has finite image. In the logarithmic Laurent expansion of any of its finitely many values,
    only finitely many negative indices occur. Repeated Cartier eventually removes all of them,
    leaving values in the finite module $M^0 \/ M$. The resulting cohomology classes belong to the image of the
    finite group $H^(a - 1) \( H \, M^0 \/ M \)$. Cartier preserves this image.
    Hence the forward orbit is finite, and Lemma 37 makes $W$ finite.
  The same lemma gives a finite kernel of $C_0$ on $N_a$. The kernel on $A_a$ is then finite,
    by the exact sequence with the now finite group $W \/ C_0 W$.
    The kernel on $X_a$ maps into the countable group $E_a \[ C_0 \]$, so it is countable.
    Finally, the finite kernel of $f_a$ allows us to apply (7.15), giving
  #[#set math.equation(numbering: n => "(7.19)")
   $ ⋂_(n gt.eq 0) f_a \( C_0^n N_a \) = f_a \( I_a \) \, $ <eq:finite-stable-X-image>]
  a finite group. This will control the Frobenius-boundary presentations in the next step.
  #emph[Step 3: the Frobenius kernel at that degree.] We now prove that
    $ker \( upright("Fr") : X_a arrow.r X_a \)$ is countable.
    A Frobenius boundary has a presentation in $B^(1 \/ p)$; applying $D$ turns it into a cocycle.
    Its principal part has only countably many possibilities.
    The remaining positive-valued presentations will all map into the fixed finite group in (7.19).
  In degree zero the kernel is zero by injectivity of coefficient Frobenius.
    For $a > 0$, consider the additive presentation group
  $ cal(P)_a = { b in C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ p) \) :
    partial b in C_(upright("cts"))^a \( H \, B \) } . $
  The map $b mapsto \[ partial b \]$ takes values in the Frobenius kernel, since $\( partial b \)^p =
    partial \( b^p \)$ and $b^p$ is $B$-valued. It surjects onto that kernel:
    if $upright("Fr") \( alpha \) = partial c$ for a $B$-valued cocycle $alpha$, take $b = c^(1 \/ p)$.
    For any presentation put $w = D b$. The good-stage property puts $w$ in
    $C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ p) \)$, and $partial w = 0$ because $D$ kills $B$ and commutes with $H$.
  The quotient $B^(1 \/ p) \/ \( B^(1 \/ p) \)^(+ +)$ is countable discrete. Thus the map
  $ cal(P)_a arrow.r C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ p) \/ \( B^(1 \/ p) \)^(+ +) \) \, wide b mapsto D b $
  has countable image. Its kernel $cal(P)_a^(+)$, consisting of presentations with positive $w$,
    has countable index. It suffices to show that $cal(P)_a^(+)$ has finite image in $X_a$.
  Fix $b in cal(P)_a^(+)$. If $w = 0$, then $b$ is $B$-valued by (7.3), and $\[ partial b \] = 0$.
    Otherwise compactness gives a uniform lower bound $v \( w \) gt.eq
    epsilon.alt > 0$ on all field factors and cochain values.
    Let $i$ be positive, even, and divisible by $\[ k : bb(F)_p \]$, and put $q = p^i$.
    With the good-stage element $theta_0$ define
  #[#set math.equation(numbering: n => "(7.20)")
   $ b' = theta_0^(1 \/ q) w in C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ \( p q \)) \) .
     $ <eq:Frobenius-presentation-lift>]
  Since $w in L^(1 \/ q)$, the Frobenius identities give $D^q b' = w$.
    Therefore $partial b'$ is killed by $D^q$, so it belongs to $L^(1 \/ q)$.
    It is also fixed by $U$, hence is $B^(1 \/ q)$-valued.
  Similarly $e = D^(q - 1) b' - b$ is killed by $D$. It is fixed by $U$ as well. Indeed (7.14) gives
  $ sigma \( D \) = D \( 1 + h \) \, quad h in D^(p + 1) k \[ \[ D \] \] \, wide sigma \( D^(q - 1) \) -
    D^(q - 1) in D^(q + p) k \[ \[ D \] \] . $
  The last ideal kills $b'$, since $D^(q + p) b' = D^p w = 0$. Thus $e$ is $B$-valued.
    Every operation here is continuous at a finite marking and root stage by Lemma 32;
    once its values have been shown to lie in $B$ or $B^(1 \/ q)$,
    the induced topology makes it a continuous cochain there. The auxiliary larger stage may depend on $i$.
  Set $alpha_i = \( partial b' \)^q$, a $B$-valued cocycle.
    The equation $partial e = D^(q - 1) partial b' - partial b$ and Lemma 34 give
  #[#set math.equation(numbering: n => "(7.21)")
   $ \[ partial b \] = c_i C_0^i \[ alpha_i \] quad upright("in ") X_a . $ <eq:Frobenius-kernel-Cartier>]
  Normalize valuations by their restriction to $K$ and take their minimum over the factors.
    The $H$-action preserves these valuations, so the cochain differential does not lower the minimum.
    Formula (7.20) yields
  $ v \( alpha_i \) gt.eq q epsilon.alt + v \( theta_0 \) . $
  For every sufficiently large admissible $i$ this exceeds the fixed bounds defining $M$,
    and $alpha_i$ is $M$-valued. Since $c_i in k^times$, $c_i C_0^i \( alpha_i \) = C_0^i \( c_i^q alpha_i \)$,
    with $c_i^q alpha_i$ still in $M$. It follows that $\[ partial b \] in
    f_a \( C_0^i N_a \)$ for a cofinal sequence of $i$. These images are nested,
    so (7.19) puts every such class in the fixed finite group $f_a \( I_a \)$.
    This proves that the positive presentation subgroup has finite image.
    Its countable index therefore makes the Frobenius kernel countable, as required.
  #emph[Step 4: from countability to finiteness.] At the degree chosen in Step 2, $C_0 upright("Fr") =
    0$ puts the Frobenius image inside the countable group $ker \( C_0 : X_a arrow.r X_a \)$.
    Step 3 makes its kernel countable. Thus $X_a$ is countable, contrary to its choice.
    Every $X_a$ is therefore countable.
  For every degree $a$, (7.17) now makes $N_a$ countable. It is compact Hausdorff, hence finite.
    Any $H$-stable valuation-order lattice is commensurable with $M$,
    with finite quotients after intersecting the two lattices.
    Long exact sequences and finite-coefficient cohomology therefore give finite cohomology for every such
    lattice, including $cal(O)_B$. The second residue duality in (7.12), followed by Lemma 29,
    makes $H^a \( H \, B \/ M \)$ finite. The long exact sequence for $0 arrow.r M arrow.r B arrow.r
    B \/ M arrow.r 0$ now makes each $X_a$ finite.
  Finally $p^e$th power is an additive $H$-equivariant homeomorphism $B^(1 \/ p^e) arrow.r B$.
    It takes valuation-order lattices to valuation-order lattices and transports all the asserted finiteness
    statements. ◻
]

=== 7.4 The natural decompletion map <the-natural-decompletion-map>

#thm([Theorem 7.11.])[
  (Decompletion, with profinite parameters).  #emph[For every compact profinite space $T$,
    the natural coefficient inclusions induce a quasi-isomorphism
#[#set math.equation(numbering: n => "(7.22)")
 $ C_(upright("cts"))^bullet \( H \, R \; T \) = "colim"_(U \, e)
   C_(upright("cts"))^bullet \( H \, \( L^U \)^(1 \/ p^e) \; T \) arrow.r
   "colim"_U C_(upright("cts"))^bullet \( H \, \( L^U \)^flat \; T \) . $ <eq:natural-decompletion>]

 It is natural in $T$, in marking-stage inclusions, and for the $P$- and $J$-actions. In particular,
#[#set math.equation(numbering: n => "(7.23)")
 $ H^a C_(upright("cts"))^bullet \( H \, R \; T \) =
   cases(delim: "{", C_(upright("cts")) \( T \, k \) \, & a = 0 \,, C_(upright("cts")) \( T \, ell \) \, & a =
   3 \,, 0 \, & a eq.not 0 \, 3 .) $ <eq:perfect-H-cohomology>]

 The two lines are discrete. The residual $P \/ H$-action on them is trivial, $J$ acts trivially on $k$,
   and $cal(O)_F^times subset J$ acts on $ell$ by $delta$.]
] <thm:decompletion>

#proof[
  First fix a good stage $B$ and take $T$ to be a point. Proposition 38 gives finite cohomology of $B^(+ +)$.
    A positive cocycle tends uniformly to zero under successive Frobenius powers.
    By Lemma 30, its sufficiently large iterates are boundaries in the positive complex.
    Thus Frobenius acts nilpotently on each finite group $H^a \( H \, B^(+ +) \)$.
    The same conclusion in degree zero follows from discreteness of the finite invariant group and injectivity of
    Frobenius. Transporting root-stage inclusions by their power homeomorphisms identifies their action on
    cohomology with Frobenius. It follows that
  #[#set math.equation(numbering: n => "(7.24)")
   $ "colim"_e C_(upright("cts"))^bullet \( H \, \( B^(1 \/ p^e) \)^(+ +) \) quad
     upright("is acyclic") . $ <eq:positive-root-acyclicity>]
  The completed positive complex is acyclic by Lemma 36.
  Density gives an isomorphism of discrete $H$-modules
  #[#set math.equation(numbering: n => "(7.25)")
   $ B^(upright("perf")) \/ \( B^(upright("perf")) \)^(+ +) arrow.r^(med tilde.op med)
     B^flat \/ \( B^flat \)^(+ +) . $ <eq:positive-quotient-comparison>]
  Surjectivity follows by approximating a completed element with error of strictly positive valuation;
    injectivity is the induced valuation condition. A continuous map from a compact space into either quotient has
    finite image. Its finitely many values lift to one root stage on the left and to the completed algebra on the
    right. Hence the coefficient sequences with positive kernels are exact on the prescribed cochains.
    The acyclicity of their kernels and (7.25) prove the fixed-$B$ comparison.
  Now allow arbitrary compact profinite $T$. All finite-root positive complexes have finite cohomology,
    so Lemma 31 upgrades (7.24) to the corresponding parameterized assertion.
    The same lemma upgrades completed positive acyclicity. The finite-image lifting argument for (7.25) applies to
    $T times H^r$ without any countability assumption on $T$. It proves the fixed-$B$ comparison with these parameters.
  Taking the filtered colimit over the cofinal family of good stages proves (7.22).
    The comparison itself is the coefficient inclusion on the full diagram of marking and root stages.
    The differential $eta$, the parameter $D$, and the good subfamily were used only to prove it is a
    quasi-isomorphism. Consequently its naturality for the full $P$- and $J$-actions is unaffected by these
    choices or by conjugating to another cofinal family. Finally apply Theorem 28 to obtain (7.23) and all the
    stated actions. ◻
]

To pass from $H$ to the norm quotients, we spell out the continuous extension argument.
  This also specifies why the parameterized comparison is the needed one.

#thm([Lemma 7.12.])[
  (Continuous extension descent).  #emph[Let $1 arrow.r N arrow.r G arrow.r Q arrow.r
    1$ be an extension of compact profinite groups whose quotient map has a continuous section as a map of spaces.
    Let $M$ be a complete continuous coefficient module with invariant neighborhoods,
    or a filtered union of complete $G$-stable stages with the convention of Definition 5.]
  #emph[If continuous $N$-cohomology satisfies
$ H^t C_(upright("cts"))^bullet \( N \, M \; T \) = C_(upright("cts")) \( T \, V_t \) $

 for all compact profinite $T$, naturally in $T$ and for the quotient action, with $V_t$ discrete,
   there is the natural first-quadrant spectral sequence
#[#set math.equation(numbering: n => "(7.26)")
 $ H_(upright("cts"))^s \( Q \, V_t \) arrow.r.double H^(s + t) C_(upright("cts"))^bullet \( G \, M \) .
   $ <eq:continuous-HS>]

 The same construction includes an additional profinite parameter.
   More generally, a coefficient map inducing quasi-isomorphisms on $N$-cochains with all such parameters induces
   a quasi-isomorphism on $G$-cochains.]
] <lem:continuous-extension>

#proof[
  We give a bar-resolution construction that works on each fixed coefficient stage. Put
  $ I^j \( M \) = C_(upright("cts")) \( G^(j + 1) \, M \) \, wide \( g f \) \( g_0 \, dots.h \, g_j \) =
    g thin f \( g^(- 1) g_0 \, dots.h \, g^(- 1) g_j \) \, $
  with the alternating omission differential. A section $s : Q arrow.r G$, chosen with $s \( 1 \) = 1$,
    gives an $N$-equivariant continuous retraction $r \( g \) = g thin s \( overline(g) \)^(- 1)$ from $G$ to $N$.
    Restriction to $N^(j + 1)$ and pullback along $r$ compare $I^bullet \( M \)^N$ with homogeneous $N$-cochains.
    They are mutually inverse up to a continuous cochain homotopy:
    the usual prism inserts, one vertex at a time, the vertices $r \( g_i \)$ in place of $g_i$.
    In degree $j$ this is the finite alternating sum obtained by evaluating at
  $ \( g_0 \, dots.h \, g_i \, r \( g_i \) \, dots.h \, r \( g_(j - 1) \) \) \, wide 0 lt.eq i < j . $
  Cancellation of adjacent omissions gives the homotopy identity.
    It preserves a fixed coefficient stage and commutes with a profinite parameter.
    Thus $I^bullet \( M \)^N$ computes the required $N$-cochains.
  Each $I^j \( M \)^N$ is coinduced as a $Q$-module. Explicitly, the function
  $ F \( overline(g)_0 \; r_1 \, dots.h \, r_j \) = g_0^(- 1) f \( g_0 \, g_0 r_1 \, dots.h \, g_0 r_j \) $
  identifies it with $C_(upright("cts")) \( Q \, C_(upright("cts")) \( G^j \, M \) \)$.
    The expression is independent of the lift $g_0$ by $N$-invariance;
    $Q$ acts by left translation on its first variable. Continuity in both directions follows from the chosen
    section. The positive $Q$-cohomology of this module vanishes:
    in the homogeneous bar complex, evaluation after inserting the identity in the free $Q$-coordinate is a
    continuous contracting homotopy. The degree-zero invariants are $I^j \( M \)^G$.
  Consider the first-quadrant double complex
  $ C_(upright("cts"))^s \( Q \, I^t \( M \)^N \) . $
  Taking horizontal cohomology first therefore identifies its total cohomology with that of $I^bullet \( M \)^G$,
    namely continuous $G$-cohomology. Taking vertical cohomology first uses the stipulated family property,
    with parameter $Q^s$, and gives $C_(upright("cts"))^s \( Q \, V_t \)$. This proves (7.26).
    In each total degree there are only finitely many bidegrees, so the standard filtration converges.
  All comparisons, prism sums, and contractions use continuous evaluation, group operations,
    and finite sums at one coefficient stage. For a stage union, perform them before taking the filtered colimit;
    this preserves their identities and exactness. Replace every parameter $Q^s$ by $T times
    Q^s$ to obtain the parameterized assertion. A map that is a quasi-isomorphism for all these $N$-parameters is
    an isomorphism on the vertical cohomology pages, hence on total cohomology. This proves the final assertion. ◻
]

=== 7.5 Removing the roots and computing the norm quotient <removing-the-roots-and-computing-the-norm-quotient>

Put

$ H' = "Nrd"^(- 1) \( mu_2 \) subset P \, wide chi : H' arrow.r.twohead mu_2 arrow.r.hook k^times . $

The scalar $- 1 in P$ has norm $- 1$, and is central, so $H' = H times mu_2$.
  Also $P \/ H' = 1 + 3 bb(Z)_3 tilde.equiv bb(Z)_3$. The norm quotients used below have continuous sections.
  For an explicit section on the principal units, choose an unramified cubic subfield $E subset D_3$ and $u in
  cal(O)_E$ with $"Tr"_(E \/ bb(Q)_p) \( u \) = 1$. Such a $u$ exists because the trace of the unramified
  residue-field extension is surjective. Then

$ z mapsto exp \( u log z \) \, wide z in 1 + 3 bb(Z)_3 \, $

is a continuous homomorphism into $cal(O)_E^times$ whose reduced norm is $z$.
  Together with the central order-two scalar it supplies the sections; thus Lemma 40 applies.

#thm([Theorem 7.13.])[
  (The ordinary coefficient calculation).  #emph[The natural inclusion $L arrow.r.hook R$ induces,
    for every compact profinite $T$, a quasi-isomorphism
#[#set math.equation(numbering: n => "(7.27)")
 $ C_(upright("cts"))^bullet \( P \, L \; T \) arrow.r^(med tilde.op med)
   C_(upright("cts"))^bullet \( P \, R \; T \) . $ <eq:ordinary-perfect-P-comparison>]

 It is $J$-equivariant and natural in $T$. With discrete cohomology groups, evaluation gives
#[#set math.equation(numbering: n => "(7.28)")
 $ H^a C_(upright("cts"))^bullet \( P \, L \; T \) =
   cases(delim: "{", C_(upright("cts")) \( T \, k \) \, & a = 0 \, 1 \,, C_(upright("cts")) \( T \, ell \) \, &
   a = 3 \, 4 \,, 0 \, & upright("otherwise") .) $ <eq:ordinary-four-rows>]

 Here the identifications in degrees one and four use the same nonzero element of
   $"Hom"_(upright("cts")) \( 1 + 3 bb(Z)_3 \, bb(F)_p \)$. The $J$-action is trivial in degrees zero and one.
   On each upper line, its restriction to $cal(O)_F^times$ is the nontrivial norm character $delta$.]
] <thm:coefficient-calculation>

#proof[
  The transformation law of the distribution parameter gives the $H'$-equivariant coefficient sequence
  #[#set math.equation(numbering: n => "(7.29)")
   $ 0 arrow.r L arrow.r R arrow.r^D R \( chi \) arrow.r 0 . $ <eq:distribution-sign-sequence>]
  Here $R \( chi \)$ means that $h in H'$ acts as $chi \( h \)$ times its action on $R$.
    The kernel, surjectivity, and continuous lifts at finite larger stages,
    including arbitrary profinite parameters, were proved in Lemma 32.
    Thus (7.29) is exact on our $H'$-cochain complexes.
  By Theorem 39, the two nonzero $H$-cohomology groups of $R$ have trivial $mu_2$-action.
    After twisting by $chi$ they have the nontrivial order-two action.
    Averaging over $mu_2$ is exact because $2$ is invertible in $k$.
    Applying Lemma 40 to $H' = H times mu_2$, with all profinite parameters,
    shows that $C_(upright("cts"))^bullet \( H' \, R \( chi \) \; T \)$ is acyclic.
    The long exact sequence of (7.29) therefore makes
  $ C_(upright("cts"))^bullet \( H' \, L \; T \) arrow.r C_(upright("cts"))^bullet \( H' \, R \; T \) $
  a quasi-isomorphism for every $T$. Its map is the natural inclusion,
    so it retains the commuting $P$- and $J$-actions although the auxiliary operator $D$ need not do so.
    Apply the comparison assertion of Lemma 40 to $H' subset P$ to obtain (7.27).
  It remains to calculate the cohomology of $R$. Exact averaging gives $H^t
    C_(upright("cts"))^bullet \( H' \, R \) = k$ for $t = 0$, $ell$ for $t = 3$, and zero otherwise.
    The quotient $Q = P \/ H' tilde.equiv bb(Z)_3$ acts trivially on both lines by Theorem 39.
    The two-term completed-group-ring resolution
  $ 0 arrow.r bb(F)_p \[ \[ Q \] \] arrow.r^(gamma - 1) bb(F)_p \[ \[ Q \] \] arrow.r bb(F)_p arrow.r 0 $
  for a topological generator $gamma$ computes $H^s \( Q \, V \) = V$ in degrees $s = 0 \,
    1$ and zero otherwise when $Q$ acts trivially on $V$. The spectral sequence (7.26) thus has exactly the four
    terms in (7.28); no differential is possible, and each total degree contains one term.
    The same resolution and the parameterized version of Lemma 40 give the formula for arbitrary $T$.
  Finally $J$ commutes with $P$ and hence acts trivially on the quotient $Q$ and its degree-one cohomology line.
    The low-degree coefficient line consists of constants. The upper coefficient line has the action specified in
    Theorem 39. This proves all assertions about the $J$-action. ◻
]

== 8 Morava descent and the actual height-two test <sec:homotopy>

The ordinary coefficient theorem computes four cohomology lines.
  We now place that calculation inside a spectral sequence of actual spectra.
  The goal of this section is to prove convergence after the height-two test and identify its completed terms as
  inverse limits of ordinary cooperation quotients. Section 9 will compare those quotients through every power of
  the height-two parameter.

Let $E_i = E_i \( k \)$ be Morava $E$-theory for the chosen $Gamma_i$, for $i = 2 \,
  3$ #cite(label("DH04")) #cite(label("HS99")). Recall the exact test $cal(T)$ of Equation (2.1) and the cotangent
  periodicity line $Omega = omega \/ p$ over $cal(O)_x = k \[ \[ x \] \]$.
  Its tensor powers include inverse powers. Unless a relative tensor product is displayed explicitly,
  $and$ denotes the ordinary smash product of spectra.

=== 8.1 Spherical constants and unextended descent <spherical-constants-and-unextended-descent>

#thm([Lemma 8.1.])[
  (Spherical constants).  #emph[There is a finite étale $S$-algebra $S_k$ with $pi_0 S_k = W \( k \)$.
    If $d = \[ k : bb(F)_p \]$, then
#[#set math.equation(numbering: n => "(8.1)")
 $ pi_(*) S_k = pi_(*) S ⊗_(bb(Z)_p) W \( k \) \, wide S_k tilde.eq S^(xor d) quad
   upright("as ") S upright("-modules") . $ <eq:spherical-constants>]

 The coefficient inclusions give canonical maps $S_k arrow.r E_i \( k \)$,
   and stabilizer automorphisms fixing $k$ are $S_k$-linear. Set
#[#set math.equation(numbering: n => "(8.2)")
 $ Z_k = L_(K \( 3 \)) S_k \, wide Y = L_(K \( 2 \)) \( E_2 and Z_k \) . $ <eq:test-spectra>]

 The algebra $E_3 \( k \)$ is descendable over $Z_k$ in the $K \( 3 \)$-local category. For its Amitsur object
#[#set math.equation(numbering: n => "(8.3)")
 $ C^s = underbrace(E_3 ⊗_(Z_k)^(K \( 3 \)) dots.h.c ⊗_(Z_k)^(K \( 3 \)) E_3, s + 1 upright(" factors")) \,
   $ <eq:morava-amitsur>]

 completed Morava cooperations identify
#[#set math.equation(numbering: n => "(8.4)")
 $ pi_(*) C^s = "Map"_(upright("cts")) \( P^s \, E_(3 *) \) \, $ <eq:unextended-cooperations>]

 with the adic coefficient topology and the usual evaluation and stabilizer-action faces.]
] <lem:spherical-constants>

#proof[
  #emph[Finite constants and the selected Morava factor.] The classification of étale algebras over a ring
    spectrum #cite(label("Mathew16")) Definition 2.31 and Theorem 2.32 lifts $W \( k \) \/
    bb(Z)_p$ and gives the first identity in (8.1). Represent a $bb(Z)_p$-basis of $W \( k \)$ by elements of
    $pi_0 S_k$. The resulting map $S^(xor d) arrow.r S_k$ is an isomorphism on every homotopy group,
    proving the second assertion. The étale mapping property stated immediately after Theorem 2.32 in
    #cite(label("Mathew16"), form: "prose") lifts the coefficient inclusion into $pi_0
    E_i \( k \)$ uniquely and supplies its compatibility with automorphisms.
    In particular, $Z_k tilde.eq \( L_(K \( 3 \)) S \)^(xor d)$ as an underlying spectrum.
  Here is the constant-field argument for descent. Put $k_0 = bb(F)_(p^3)$, $E^(\( 0 \)) = E_3 \( k_0 \)$,
    and $T = L_(K \( 3 \)) S$. The algebra $E^(\( 0 \))$ is descendable over $T$ #cite(label("Mathew16"))
    Theorem 4.18 and Proposition 10.10. The images of $S$ and of the sphere in this category agree,
    since completion of the sphere is a mod-$p$ equivalence. Base change preserves descendability
    #cite(label("Mathew16")) Corollary 3.21; hence
  $ tilde(E) = Z_k ⊗_T^(K \( 3 \)) E^(\( 0 \)) $
  is descendable over $Z_k$. Finite étale scalar extension and
  $ W \( k_0 \) ⊗_(bb(Z)_p) W \( k \) = product_(alpha : k_0 arrow.r.hook k) W \( k \) $
  give a product decomposition
  $ tilde(E) tilde.eq product_(alpha : k_0 arrow.r.hook k) E_alpha \, wide E_alpha tilde.eq E_3 \( k \) . $
  Each factor realizes the universal deformation after the indicated residue-field extension.
    Frobenius in the extended stabilizer of $E^(\( 0 \))$ induces a $Z_k$-linear automorphism of $tilde(E)$ that
    cycles its three factors. Consequently $tilde(E)$ and any selected $E_alpha$ generate the same thick tensor
    ideal of $Z_k$-modules: one direction uses the product projections,
    and the other uses the equivalences of the three factors.
    This proves descendability of the selected $E_3 \( k \)$.
    In particular, no averaging over a group of order three is involved.
  #emph[The unextended cooperation maps.] The factor selection also determines the group and the maps in (8.4).
    Write $G = P times.r "Gal" \( k_0 \/ bb(F)_p \)$. The completed Morava cooperation theorem
    #cite(label("DH04")) Proposition 2.2 and Equations (2.3) and (2.5),
    followed by the finite scalar extension above, gives
  $ pi_(*) #scale(x: 120%, y: 120%)[\(] tilde(E)^(⊗_(Z_k)^(K \( 3 \)) \( s + 1 \)) #scale(x: 120%, y: 120%)[\)] =
    "Map"_(upright("cts")) \( G^s \, tilde(E)_(*) \) . $
  Finite free scalar extension commutes with these continuous-function modules.
    We spell out the conversion from the cited inverse-action coordinates. Write $mu$ for iterated multiplication.
    In the coordinates $h_1 \, dots.h \, h_s$ of #cite(label("DH04"), form: "prose") Equation (2.5), evaluation is
  $ mu compose \( h_1^(- 1) ⊗ dots.h.c ⊗ h_s^(- 1) ⊗ 1 \) \, $
  where $1$ denotes the identity action. For $a_r = g_1 dots.h.c g_r$ and $a_0 = 1$, put $h_i =
    a_(i - 1)^(- 1) a_s = g_i dots.h.c g_s$ and postcompose by $a_s$.
    Multiplicativity of the action gives the identity of evaluation composites
  #[#set math.equation(numbering: n => "(8.5)")
   $ a_s compose mu compose \( h_1^(- 1) ⊗ dots.h.c ⊗ h_s^(- 1) ⊗ 1 \) =
     mu compose \( 1 ⊗ a_1 ⊗ dots.h.c ⊗ a_s \) . $ <eq:amitsur-coordinate-conversion>]
  This is a continuous invertible coordinate change, with $g_i = h_i h_(i + 1)^(- 1)$ and $h_(s + 1) = 1$;
    it moves the coefficient action from the last factor to the first. A pure tensor is therefore sent to
  $ \( g_1 \, dots.h \, g_s \) mapsto b_0 thin g_1 \( b_1 \) thin \( g_1 g_2 \) \( b_2 \)
    dots.h.c \( g_1 dots.h.c g_s \) \( b_s \) . $
  The same identity of evaluation composites checks the bar operations.
    For a cochain $f$, unit insertion in the first slot gives $g_1 f \( g_2 \, dots.h \, g_(s + 1) \)$;
    an interior insertion gives $f \( g_1 \, dots.h \, g_i g_(i + 1) \, dots.h \, g_(s + 1) \)$;
    and insertion in the last slot gives $f \( g_1 \, dots.h \, g_s \)$.
    Multiplication of neighboring slots gives insertion of the identity among the group variables.
    These are the actual cofaces and codegeneracies after the coordinate change.
    Selecting the same factor idempotent in all $s + 1$ slots first selects that value factor and then requires
    every cumulative product $g_1 dots.h.c g_r$ to preserve it.
    The stabilizer of the factor is $P$; these conditions are equivalent to $g_r in P$ for every $r$.
    This yields (8.4). The selection commutes with multiplication, units, and evaluation,
    so the resulting faces are the actual bar faces, not merely maps with the same groups of coefficients. ◻
]

=== 8.2 Convergence after the height-two test <convergence-after-the-height-two-test>

The test $cal(T) \( X \) = L_(K \( 2 \)) \( E_2 and X \) \/
  p$ takes values in $E_2$-modules equipped with the semilinear action induced by $J$ on $E_2$.
  Its exactness is the reason a finite nilpotence bound on the Amitsur error tower survives this change of height.

#thm([Lemma 8.2.])[
  (Partial totalizations as finite cubes).  #emph[Let $X^bullet$ be a cosimplicial object in a stable
    $oo$-category. For $r gt.eq 0$, let $cal(P)_0 \( \[ r \] \)$ be the poset of nonempty subsets of $\[ r \] =
    { 0 \, dots.h \, r }$. The functor
$ g_r : cal(P)_0 \( \[ r \] \) arrow.r Delta_(lt.eq r) \, wide S mapsto \[ \| S \| - 1 \] \, $

 sends an inclusion to the injection recording the positions of its ordered elements.
   Here $Delta_(lt.eq r)$ is the full subcategory on $\[ 0 \] \, dots.h \, \[ r \]$, including all codegeneracies.
   Restriction induces
#[#set math.equation(numbering: n => "(8.6)")
 $ "Tot"_r X^bullet = lim_(Delta_(lt.eq r)) X^bullet tilde.eq lim_(S in cal(P)_0 \( \[ r \] \)) X^(\| S \| - 1) .
   $ <eq:finite-totalization-cube>]

 These equivalences respect the totalization tower and the augmentation when $X^bullet$ is augmented.
   Every exact functor between stable $oo$-categories therefore preserves these partial totalizations as an
   augmented tower.]
] <lem:finite-totalizations>

#proof[
  The assertion about the indexing functor is the left-cofinality theorem of
    #cite(label("Sinha09"), form: "prose") Definitions 6.2–6.3 and Theorem 6.7.
    We include a proof that records the role of codegeneracies.
    For $0 lt.eq m lt.eq r$, the comma category $\( g_r arrow.b \[ m \] \)$ consists of nonempty subsets $S
    subset.eq \[ r \]$ with weakly increasing labelings $S arrow.r \[ m \]$; its arrows extend labelings.
    It is the nonempty face poset of the finite simplicial complex $K_(r \, m)$ with simplices
  $ { \( i_0 \, j_0 \) \, dots.h \, \( i_q \, j_q \) } \, wide i_0 < dots.h.c < i_q \, quad j_0 lt.eq
    dots.h.c lt.eq j_q . $
  This complex is flag. In a flag complex one may delete a vertex $v$ if a neighboring vertex $w$ is adjacent to
    every other neighbor of $v$: sending $v$ to $w$ and fixing the other vertices gives a simplicial retraction
    whose composite with the inclusion is contiguous to the identity.
  For $j = m \, m - 1 \, dots.h \, 1$, delete $\( i \, j \)$ for $i = 0 \, dots.h \, j - 1$ in that order,
    using $w = \( i + 1 \, j \)$. This vertex exists since $j lt.eq m lt.eq r$.
    The only neighbors of $\( i \, j \)$ possibly not adjacent to $w$ are $\( i + 1 \, k \)$ with $k > j$;
    they have already been deleted at the earlier value $k$. Next, for $j = 0 \, 1 \, dots.h \, m$,
    delete $\( i \, j \)$ for $i = r \, r - 1 \, dots.h \, j + 1$, using $w = \( i - 1 \, j \)$.
    The only possible exceptions are now $\( i - 1 \, k \)$ with $k < j$;
    they were deleted at the earlier value $k$. Each chosen $w$ is still present.
    The vertices left are $\( 0 \, 0 \) \, dots.h \, \( m \, m \)$, which span a simplex.
    Thus $K_(r \, m)$, and hence the nerve of $\( g_r arrow.b \[ m \] \)$, is contractible.
    The weak label inequalities here include noninjective simplex maps; this is the check for the full truncation.
  The opposite form of the $oo$-categorical cofinality criterion #cite(label("Lurie09")) Theorem 4.1.3.1 makes
    $g_r$ initial for limits. The dual of #cite(label("Lurie09")) Proposition 4.1.1.8 gives (8.6).
    The poset on its right has a finite nerve, since strict chains of its subsets have length at most $r$.
    For the inclusions of initial segments, the squares formed by $g_r$ and $g_(r + 1)$ commute strictly.
    The displayed equivalences, being restriction maps on cones,
    consequently commute coherently with the tower maps. Adding the empty subset,
    sent to $\[ - 1 \]$ in the augmented simplex category, shows the same compatibility with the augmentation.
    Finally, an exact functor preserves the finite limit on the right, naturally in these diagrams.
    Applying the comparison in source and target proves the last assertion. ◻
]

#thm([Proposition 8.3.])[
  (The tested descent spectral sequence).  #emph[The natural augmentation induces an equivalence
#[#set math.equation(numbering: n => "(8.7)")
 $ Y \/ p tilde.eq "Tot" cal(T) \( C^bullet \) . $ <eq:tested-totalization>]

 The corresponding spectral sequence
#[#set math.equation(numbering: n => "(8.8)")
 $ sans(E)_2^(s \, t) = H^s #scale(x: 120%, y: 120%)[\(] pi_t cal(T) \( C^bullet \) #scale(x: 120%, y: 120%)[\)]
   arrow.r.double pi_(t - s) \( Y \/ p \) $ <eq:tested-spectral-sequence>]

 is strongly convergent, with a horizontal vanishing line at a finite page and a finite filtration on its
   abutment. Its differentials are $k \[ \[ x \] \]$-linear and $J$-semilinear-equivariant.]
  #emph[There is a compatible diagonal summand, denoted by a subscript $Delta$,
    on every page and on the abutment filtration: it is the summand on which the two copies of $k$,
    from $E_2$ and $S_k$, agree. The same assertions hold on that summand.]
] <prop:descent-test>

#proof[
  #emph[The Amitsur error tower.] Let $T_r = "Tot"_r C^bullet$.
    In the stable category of $Z_k$-modules in $K \( 3 \)$-local spectra, form the external tensor cube
  $ Q_r \( S \) = ⨂_(i = 0)^r Z_i \( S \) \, wide Z_i \( S \) =
    cases(delim: "{", E_3 \, & i in S \,, Z_k \, & i in.not S \,) wide S subset.eq \[ r \] \, $
  where the tensors are the $K \( 3 \)$-local relative tensors over $Z_k$.
    An edge applies the unit $Z_k arrow.r E_3$ in its ordered slot.
    More generally, the Amitsur map for a weakly increasing simplex map multiplies the factors in each ordered
    fiber and inserts a unit for an empty fiber; its codegeneracies are the multiplication maps.
    The restriction along $g_r$ uses precisely the unit insertions.
    The associativity and unit equivalences therefore identify it with the punctured cube
    $Q_r \|_(cal(P)_0 \( \[ r \] \))$ as a coherent diagram, and the empty vertex is the actual augmentation
    $Z_k$. Lemma 43 gives
  $ T_r tilde.eq lim_(diameter eq.not S subset.eq \[ r \]) Q_r \( S \) $
  as an augmented tower. For $r = 0$ the limit is $E_3$; for $r = 1$ it is the homotopy pullback of $E_3 arrow.r
    E_3 ⊗_(Z_k)^(K \( 3 \)) E_3 arrow.l E_3$, with ordered maps $b mapsto b ⊗ 1$ and $b mapsto 1 ⊗ b$.
  Put $I = "fib" \( Z_k arrow.r E_3 \)$. Iterating fibers in the tensor cube,
    using exactness of the tensor in each factor, gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ "fib" \( Z_k arrow.r T_r \) tilde.eq I^(⊗ \( r + 1 \)) . $ <eq:amitsur-error-fiber>]
  Indeed, after separating the last coordinate, the total fibers of the two faces are $I^(⊗ r)$ and $E_3 ⊗
    I^(⊗ r)$; their fiber is $I^(⊗ \( r + 1 \))$. The case $r = 0$ is the definition of $I$.
    Naturality of this iterated-fiber construction identifies a tower transition with applying $I arrow.r
    Z_k$ in the last slot.
  Take the cofiber of the augmentation in the category of towers,
  $ Z_k arrow.r T_r arrow.r U_r . $
  Thus $U_r tilde.eq Sigma I^(⊗ \( r + 1 \))$ compatibly with transitions.
    Multiplication retracts $E_3 tilde.eq E_3 ⊗ Z_k arrow.r E_3 ⊗ E_3$.
    Applying that retraction to the defining fiber nullhomotopy shows that $E_3 ⊗ I arrow.r E_3$ is null.
    Therefore each transition $U_r arrow.r U_(r - 1)$ becomes null after tensoring with $E_3$.
    Descendability supplies a bound on the length of any composite of such maps #cite(label("Mathew16"))
    Proposition 3.27 and Corollary 4.4. Thus there is $N$ such that $U_(r + N) arrow.r U_r$ is null for every $r$.
  #emph[Passing the tower through the exact test.] This uniform bound is the descent input that will survive the
    change of height. The test need only preserve the finite limits defining the partial totalizations.
    Lemma 43 identifies $cal(T) \( T_r \)$ with $"Tot"_r cal(T) \( C^bullet \)$ as augmented towers:
    exactness moves $cal(T)$ through the finite punctured-cube limit.
    Here $cal(T)$ is applied to the already formed source cube; no monoidal property of the test is needed.
    Exactness then gives the cofiber tower
  $ cal(T) \( Z_k \) arrow.r "Tot"_r cal(T) \( C^bullet \) arrow.r cal(T) \( U_r \) \, $
  and every composite $cal(T) \( U_(r + N) \) arrow.r cal(T) \( U_r \)$ is still null.
    Increase $N$ to at least one if necessary, and write
  $ X = cal(T) \( Z_k \) \, wide V_s = "Tot"_s cal(T) \( C^bullet \) \, wide W_s = cal(T) \( U_s \) . $
  The inverse limit of $W_s$ is zero: applying mapping spectra gives pro-zero homotopy groups and zero $lim^1$.
    Taking the inverse limit of the displayed cofiber sequences gives $X tilde.eq lim_s V_s$ and proves (8.7).
    The tower ${ V_s }$ is strongly constant in the sense of #cite(label("Mathew16")) Definition 4.2,
    and #cite(label("Mathew16")) Proposition 4.3 supplies a horizontal vanishing line at a finite page.
  #emph[The filtration of actual homotopy.] We derive the abutment filtration and strong convergence directly from
    the same nilpotence bound. This will let us use a surviving term as a subquotient of the tested homotopy
    group. For any homotopy degree $q$ and $u gt.eq s + N$, the cofiber triangles give
  $ "im" \( pi_q V_u arrow.r pi_q V_s \) = "im" \( pi_q X arrow.r pi_q V_s \) = : M_s^q . $
  Indeed, the image of a class from $pi_q V_u$ in $pi_q W_s$ is zero,
    because it factors through the null transition $W_u arrow.r W_s$;
    exactness then puts its image in the image of $pi_q X$. Conversely,
    the augmentation to $V_s$ factors through every $V_u$. Hence each homotopy tower is Mittag–Leffler,
    and its $lim^1$ vanishes. The Milnor exact sequence therefore identifies $pi_q X$ with $lim_s pi_q V_s$.
  Extend $V_s = 0$ for $s < 0$ and give this actual homotopy group the filtration
  $ F^s pi_q X = ker \( pi_q X arrow.r pi_q V_(s - 1) \) wide \( s gt.eq 0 \) . $
  Here $F^0 pi_q X = pi_q X$. Exactness identifies $F^(s + 1) pi_q X$ with the image of the boundary $delta_s :
    pi_(q + 1) W_s arrow.r pi_q X$. Naturality gives $delta_N = delta_0 compose pi_(q + 1) \( W_N arrow.r W_0 \) =
    0$, so $F^(N + 1) pi_q X = 0$ for every $q$.
  Use total-degree grading $tilde(E)_r^(s \, q) = sans(E)_r^(s \, q + s)$ in the exact couple of the tower.
    Its first couple has
  $ D_1^(s \, q) = pi_q V_s \, wide tilde(E)_1^(s \, q) = pi_q "fib" \( V_s arrow.r V_(s - 1) \) . $
  The long exact fiber sequences give maps $i_1 : D_1^(s \, q) arrow.r D_1^(s - 1 \, q)$, $j_1 :
    D_1^(s \, q) arrow.r tilde(E)_1^(s + 1 \, q - 1)$, and $epsilon.alt_1 : tilde(E)_1^(s \, q) arrow.r
    D_1^(s \, q)$. Deriving the couple replaces $D$ by the image of $i$. Induction therefore gives
  $ D_r^(s \, q) = "im" \( pi_q V_(s + r - 1) arrow.r pi_q V_s \) \, $
  with maps
  $ i_r : D_r^(s \, q) arrow.r D_r^(s - 1 \, q) \, wide j_r : D_r^(s \, q) arrow.r tilde(E)_r^(s + r \, q - 1) \,
    wide epsilon.alt_r : tilde(E)_r^(s \, q) arrow.r D_r^(s \, q) \, $
  and differential $tilde(d)_r = j_r epsilon.alt_r$. In the original grading this has bidegree $\( r \, r - 1 \)$.
  Put $M_s^q = 0$ for $s < 0$. For $r gt.eq N + 1$, the stable-image equality says $D_r^(s \, q) =
    M_s^q$ for every $s$. The transitions $M_s^q arrow.r M_(s - 1)^q$ are surjective because both images come from
    $pi_q X$. Exactness of the derived couple now makes every $j_r$ zero and identifies
  $ tilde(E)_r^(s \, q) arrow.r_(epsilon.alt_r)^(med tilde.op med) ker \( M_s^q arrow.r M_(s - 1)^q \) . $
  Indeed, in the exact segment $D_r^(s - r \, q + 1) arrow.r tilde(E)_r^(s \, q) arrow.r D_r^(s \, q) arrow.r
    D_r^(s - 1 \, q)$, the first arrow is zero since the preceding $i_r$ is surjective.
    Thus the pages stabilize from $r = N + 1$. The augmentation maps $F^s pi_q
    X$ onto the displayed kernel with kernel $F^(s + 1) pi_q X$, so in the original grading
  $ sans(E)_oo^(s \, t) tilde.equiv F^s pi_(t - s) X \/ F^(s + 1) pi_(t - s) X wide \( s gt.eq 0 \) . $
  This is an exhaustive, separated, and complete finite filtration of the actual group $pi_(t - s) \( Y \/ p \)$:
    it starts at $F^0$ and ends at $F^(N + 1) = 0$. The stable page consequently vanishes for $s gt.eq N + 1$,
    and the Milnor term above is zero. This proves strong convergence with the asserted actual abutment
    filtration. The argument uses only exactness of $cal(T)$ through the finite cube,
    not preservation of arbitrary inverse limits.
  #emph[Coefficient actions and the diagonal summand.] The maps in the tested cosimplicial object are $E_2$-linear
    and compatible with the action of $J$. Lemma 2 makes their homotopy groups, and hence the spectral sequence,
    $k \[ \[ x \] \]$-linear. The second coefficient action comes from $S_k$ on $C^bullet$ and commutes with the
    first. After reduction modulo $p$ the two actions give an action of
  $ k ⊗_(bb(F)_p) k tilde.eq product_(sigma in "Gal" \( k \/ bb(F)_p \)) k . $
  Its idempotent for $sigma = "id"$ is fixed by $P$ and $J$.
    It commutes with the tower maps, all differentials, and the maps defining the abutment filtration.
    Taking its image proves the diagonal assertions. This construction only needs an idempotent on mod-$p$
    homotopy groups; it does not identify the two spherical scalar actions on an ordinary smash product before
    reduction. ◻
]

=== 8.3 Ordinary cooperations and their residue topology <ordinary-cooperations-and-their-residue-topology>

For $m gt.eq 1$, put $A_m = k \[ x \] \/ \( x^m \)$ and $omega_m = Omega ⊗_(k \[ \[ x \] \]) A_m$.
  All the quotients below are formed on the height-two coefficient side. Let

#[#set math.equation(numbering: n => "(8.10)")
 $ D_m^s = (pi_0 \( E_2 and C^s \) \/ \( p \, x^m \))_Delta . $ <eq:jet-cooperation-definition>]

The cofaces and degeneracies make $D_m^bullet$ a cosimplicial $A_m$-algebra;
  we use the same notation for its associated cochain complex.
  The action of $J$ on the algebraic quotient is well defined because it preserves $\( p \, x^m \)$.

#thm([Lemma 8.4.])[
  (Flat coefficients and the residue algebra).  #emph[The ordinary, unlocalized smash product has even homotopy and
#[#set math.equation(numbering: n => "(8.11)")
 $ pi_(*) \( E_2 and C^s \) = \( E_2 \)_(*) \( E_3 \) ⊗_(E_(3 *)) "Map"_(upright("cts")) \( P^s \, E_(3 *) \) .
   $ <eq:ordinary-kunneth>]

 This module is flat over $E_(2 *)$. In particular, $D_m^s$ is flat over $A_m$,
   and reduction by $\( p \, x^m \)$ creates no odd homotopy. There are natural identifications
#[#set math.equation(numbering: n => "(8.12)")
 $ D_1^s = "Map"_(upright("cts")) \( P^s \, K \) ⊗_K L = "colim"_U "Map"_(upright("cts")) \( P^s \, L^U \) \,
   $ <eq:residue-cochains>]

 compatible with the bar maps and the marking actions.]
] <lem:ordinary-cooperations>

#proof[
  #emph[Evenness and flatness before localization.] The Landweber exact cooperation formula expresses
    $\( E_2 \)_(*) \( E_3 \)$ as the two-sided base change of the formal-group isomorphism Hopf algebroid.
    It is even and flat over either coefficient ring. These are the usual ordinary Landweber cooperations;
    see #cite(label("HS99")) Theorem 2.7 and Propositions 2.12 and 2.16.
    For flatness over both coefficient rings, apply Proposition 2.16 with the two Morava spectra in each order and
    use smash symmetry. We justify this ordinary tensor calculation by a finite resolution.
    By #cite(label("HS99")) Proposition 2.12, $E_2$ is evenly generated; #cite(label("HS99")) Proposition 2.16,
    applied with ring spectrum $E_3$, then gives a graded projective resolution
  $ 0 arrow.r P_1 arrow.r P_0 arrow.r pi_(*) \( E_2 and E_3 \) arrow.r 0 . $
  The projectives may be taken in even degrees. Realize $P_0$ as a retract $Q_0$ of a wedge of even suspensions of
    $E_3$, and realize the surjection by an $E_3$-module map $Q_0 arrow.r E_2 and E_3$.
    Its fiber has homotopy $P_1$, so realizing that projective similarly identifies the fiber with a projective
    $E_3$-module $Q_1$. Thus $Q_1 arrow.r Q_0 arrow.r E_2 and E_3$ is a finite cofiber sequence.
    Tensor this sequence over $E_3$ with $C^s$. For each $Q_i$,
    its homotopy is the algebraic tensor product $P_i ⊗_(E_(3 *)) pi_(*) C^s$,
    since $Q_i$ is a retract of a wedge of suspensions of $E_3$.
    Flatness of $pi_(*) \( E_2 and E_3 \)$ over $E_(3 *)$ makes the map between these two tensor products
    injective. We also have
  $ E_2 and C^s tilde.eq \( E_2 and E_3 \) ⊗_(E_3) C^s . $
  The long exact homotopy sequence therefore gives (8.11) and evenness.
    This finite argument supplies the tensor calculation without a convergence assumption on an unbounded periodic
    Künneth spectral sequence.
  We also need flatness of the second factor in (8.11). The compact analytic space $P^s$ has a countable cofinal
    system of finite clopen partitions. The modules of functions constant on these partitions are finite free over
    $E_(3 \, 0)$. A refinement map is a split inclusion with free cokernel, so their union is free.
    Its maximal-ideal completion is $"Map"_(upright("cts")) \( P^s \, E_(3 \, 0) \)$:
    reduction modulo any power of the maximal ideal is a locally constant function,
    and compatible reductions recover a continuous function. Completion of a flat module over a Noetherian ring is
    flat. Thus this continuous-function module is flat over $E_(3 \, 0)$.
  To see flatness of the full tensor product over $E_(2 *)$,
    first tensor an exact sequence of $E_(2 *)$-modules with $\( E_2 \)_(*) \( E_3 \)$,
    and then tensor the resulting exact sequence of $E_(3 *)$-modules with the continuous-function module.
    Both operations are exact. It follows that $p \, x^m$ is a regular quotient calculation on (8.11).
    The same holds after taking the diagonal idempotent. Flatness over $A_m$ follows by base change.
  #emph[The residue algebra as a marking algebra.] Choose complex orientations.
    Quillen’s universality theorem identifies the complex-cobordism formal group with the universal formal group
    #cite(label("Quillen69")) Section 3, Theorem 2. We use its strict-isomorphism Hopf algebroid as in
    #cite(label("Powell12")) Section 3.1, with the inverse series when the direction of the isomorphism is
    reversed. The ordinary cooperation identity is
  $ \( E_2 \)_(*) E_3 = \( E_2 \)_(*) ⊗_(M U_(*)) M U_(*) M U ⊗_(M U_(*)) \( E_3 \)_(*) \, wide M U_(*) M U =
    M U_(*) \[ b_1 \, b_2 \, dots.h \] \, $
  with the two unit maps of the formal-group Hopf algebroid. Both tensor products are algebraic.
    This follows by applying Landweber exactness #cite(label("HS99")) Theorem 2.7 first to
    $\( E_2 \)_(*) \( E_3 \)$ and then, using symmetry, to $M U_(*) \( E_3 \) = \( E_3 \)_(*) \( M U \)$.
  Choose periodicity generators $u_i in pi_2 E_i$. If $b \( Z \) = Z +
    sum_(r gt.eq 1) b_r Z^(r + 1)$ is the strict graded isomorphism from the right formal law to the left,
    its degree-zero form is
  $ f \( X \) = u_2 b \( u_3^(- 1) X \) \, wide f' \( 0 \) = c = u_2 \/ u_3 . $
  Conversely, any degree-zero isomorphism with invertible derivative $c$ recovers $u_3 =
    u_2 \/ c$ and the strict isomorphism $u_2^(- 1) f \( u_3 Z \)$.
    The periodicity ratio therefore supplies exactly the arbitrary linear coefficient of a formal-law isomorphism.
  Reduce the left coefficients by $\( p \, x \)$ and select the diagonal copy of $k$.
    The left law is $Gamma_2$, with $\[ p \]_(Gamma_2) \( X \) = X^(p^2)$.
    For the right law $F_3$ over $A = k \[ \[ a \, t \] \]$, compare coefficients in
  $ f \( \[ p \]_(F_3) \( X \) \) = f \( X \)^(p^2) . $
  The coefficient of $X^p$ gives $c a = 0$, hence $a = 0$. The coefficient of $X^(p^2)$ then gives $c t =
    c^(p^2)$, so $t = c^(p^2 - 1)$ is invertible. The right coefficient ring is consequently
    $A \/ \( a \) \[ 1 \/ t \] = K$. The remaining coefficient relations classify exactly the isomorphisms from
    the connected formal law of $cal(G)_K$ to $Gamma_2$. By the construction of the connected-marking torsor,
    their algebra is $L = "colim"_U L^U$: each element uses finitely many marking coefficients and lies in one
    finite étale marking algebra. This is the algebraic union, with no additional completion.
  #emph[Continuous functions at a finite marking stage.] On the continuous-function factor,
    reduction modulo $\( p \, a \)$ gives the continuous functions into $k \[ \[ t \] \]$.
    Indeed coefficientwise lifts give surjectivity, and division of an element in the kernel by $p$ or $a$ is
    continuous with a bounded shift of adic order. After inverting $t$ the result is
    $"Map"_(upright("cts")) \( P^s \, K \)$: the compact image of a continuous $K$-valued function has bounded
    pole order, giving one common power of $t$ as denominator.
  Finally, every finite étale marking stage is a finite-dimensional $K$-algebra with its usual finite-dimensional
    topology. A choice of $K$-basis therefore identifies continuous functions into that stage with its tensor
    product with $"Map"_(upright("cts")) \( P^s \, K \)$. Passing to the algebraic union proves (8.12).
    Every cooperation element uses only finitely many marking coefficients,
    so this is a union of complete finite stages, with no completion of the infinite extension.
    Evaluation and transport of the height-three law are exactly the cooperation faces,
    giving the asserted compatibility. ◻
]

#thm([Lemma 8.5.])[
  (The completed terms).  #emph[The diagonal homotopy cochains of $cal(T) \( C^bullet \)$ are zero in odd internal
    degrees. In degree $2 j$ they are naturally
#[#set math.equation(numbering: n => "(8.13)")
 $ (lim_m D_m^bullet) ⊗_(k \[ \[ x \] \]) Omega^(⊗ j) . $ <eq:completed-homotopy-cochains>]

 The maps to the finite quotients on homotopy groups are the ordinary reduction maps.]
] <lem:completed-test-terms>

#proof[
  For $E_2$-modules, $K \( 2 \)$-localization is derived completion at $\( p \, x \)$:
    it is the inverse limit of the successive regular-ideal quotients #cite(label("Hovey04")) Proposition 2.2 and
    Theorem 2.3; compare #cite(label("HS99")) Proposition 7.10(e).
    Here is the comparison for the finite extension of constants.
    In Section 3 the height-two parameter was chosen already over $bb(F)_(p^2) = bb(F)_9$,
    and $E_2 \( k \)$ uses its scalar-extended universal deformation.
    The map $E_2 \( bb(F)_9 \) arrow.r E_2 \( k \)$ therefore sends the chosen regular system $\( p \, x \)$ to
    the same named system. Apply the standard-coefficient theorem to an $E_2 \( k \)$-module restricted along this
    map, using the regular ideals $\( p^r \, x^r \)$, whose intersection is zero.
    The underlying spectrum and its $K \( 2 \)$-localization do not change under restriction.
    Multiplication by $p^r$ and $x^r$ is the same map on that spectrum,
    so its derived quotients and their transition maps are also the same.
    This proves the same completion description for $E_2 \( k \)$-modules.
    Exactness first permits reduction modulo $p$ before localization.
    On this reduction $p$ acts null by Lemma 2; hence derived $\( p \, x \)$-completion is derived $x$-completion.
    Equivalently, tensoring the usual completion tower with the finite $E_2$-module $E_2 \/
    p$ commutes with its inverse limit, and the extra $p$-power tower has pro-zero error. Thus, for $M = E_2 and C^s$,
  $ L_(K \( 2 \)) M \/ p tilde.eq lim_m M \/ \( p \, x^m \) . $
  Lemma 45 computes every term on the right by the ordinary even quotient of (8.11).
    The homotopy transition maps are surjective, so the Milnor $lim^1$ term vanishes.
    Periodicity on the height-two factor then gives (8.13). Its line tensor commutes with the limit because it is
    finite free as an underlying $k \[ \[ x \] \]$-module. These constructions are natural in all bar maps. ◻
]

We have now identified the homotopy of each actual completed term and its reduction maps.
  The remaining comparison must respect those maps at every finite power of $x$; a calculation only at $x =
  0$ would leave the generic semilinear action undetermined.

== 9 The comparison through every deformation jet <sec:jets>

The preceding section supplied the actual completed homotopy terms and a finite abutment filtration.
  We now identify their coefficient cochains through every quotient $k \[ \[ x \] \] \/ \( x^m \)$.
  The first step lifts the marked split $p$-divisible group.
  The second recovers the formal law from its finite torsion, evaluates ordinary cooperations,
  and passes to the inverse limit with its actual semilinear action.

=== 9.1 Lifting the marked split deformation <lifting-the-marked-split-deformation>

The next lemma provides an actual coefficient map through every $x$-jet.
  We continue to use the algebraic $p$-divisible group $cal(G)$ over $A = k \[ \[ a \, t \] \]$,
  whose finite kernels were formed before passage to $K$. In the equivariance statement below,
  $P$ acts on the source ring $A$ by its height-three deformation action, whereas $J$ fixes $A$.
  The actions on the target include the marking and height-two deformation actions specified in the statement.

#thm([Lemma 9.1.])[
  (Lifting the split deformation).  #emph[There are compatible maps of $k$-algebras
#[#set math.equation(numbering: n => "(9.1)")
 $ phi_m : A arrow.r R \[ x \] \/ \( x^m \) \, wide m gt.eq 1 \, $ <eq:split-parameter-map>]

 reducing to $a mapsto 0$, $t mapsto t$ at $x = 0$, with the following property.
   The pulled-back $p$-divisible group is isomorphic, with its specified identification at $x = 0$,
   to the direct sum of the universal height-two equal-characteristic deformation modulo $x^m$ and the constant
   height-one étale group.]
  #emph[The maps and isomorphisms respect $P$, acting on $R$ and fixing $x$, and $J$,
    acting both on $R$ by marking changes and on $k \[ \[ x \] \]$ by the height-two deformation action.
    For fixed $m$, the parameter map is continuous into one complete finite root/marking stage with nilpotent
    variable $x$. Any finite set of coefficients of the formal-group isomorphism lies in such a stage after a
    further finite enlargement.]
] <lem:split-jet-lift>

#proof[
  #emph[The split special fiber.] The two markings of Lemma 15 identify the connected part of $cal(G)_R$ with
    $Gamma_2$ and its étale quotient with $bb(Q)_p \/ bb(Z)_p$. Their extension splits canonically over $R$.
    This also follows directly from Lemma 16: the compatible inclusions $L^(1 \/ p^(2 l)) arrow.r
    R$ give the unique lifts of the marked étale generators over the perfect ring. Thus
  $ cal(G)_R tilde.eq Gamma_2 xor bb(Q)_p \/ bb(Z)_p . $
  Let $cal(H)_m$ be the universal height-two deformation over $A_m$, pulled back to $R \[ x \] \/ x^m$, and put
  $ cal(D)_m = cal(H)_m xor bb(Q)_p \/ bb(Z)_p . $
  The displayed splitting specifies the initial identification with $cal(G)_R$.
  #emph[Square-zero deformation theory.] The parameter map used here is nonlocal: it sends $t$ to a unit.
    We use square-zero deformation theory formulated for arbitrary base ring maps.
    This is Grothendieck’s lifting theory for Barsotti–Tate groups,
    as presented in #cite(label("Illusie85")) Theorem 4.4 and Corollary 4.7;
    the Hodge filtration formulation for locally liftable groups appears in #cite(label("Messing72")) Chapter V,
    Theorem (1.6). The precise square-zero interface used below is Lau’s formulation.
  We recall precisely the deformation-theoretic input. For a $p$-divisible group $G$ over a ring on which $p$ is
    nilpotent, isomorphism classes of lifts across a square-zero ideal $I$ form a torsor under
  $ "Hom" \( omega_(G^or) \, I ⊗ "Lie" G \) . $
  Changing a lifting ring map acts through the Kodaira–Spencer homomorphism #cite(label("Lau10")) Theorem 5.1 and
    Equation (5.1). For the universal deformation $cal(G) \/ A$, where $A =
    k \[ \[ a \, t \] \]$ is a complete local Noetherian $k$-algebra with residue field $k$ and $k$ is perfect,
    we use Lau’s separate universal-deformation statement #cite(label("Lau10")) paragraph following
    Equation (5.2), p. 227. As in Equation (7.5), its closed-point criterion and Lemma 4 give
  $ kappa_(cal(G)) : "Hom"_A \( "Lie" cal(G) \, omega_(cal(G)^or) \) arrow.r^(med tilde.op med)
    Omega_(A \/ bb(Z))^1 tilde.eq Omega_(A \/ k)^1 = A thin d a xor A thin d t . $
  At a square-zero jet stage, the ideal $I$ is an $A$-module through $phi_m$.
    Applying $"Hom"_A \( - \, I \)$ to this isomorphism over $A$ gives the isomorphism of torsor-action groups
    used in Lau’s Equation (5.1).
  #emph[Parameter lifts and their uniqueness.] We must first exhibit ring lifts for the nonlocal specialization.
    For nilpotent corrections, prescribe
  $ a mapsto alpha \, wide t mapsto t + beta \, wide alpha \, beta in x R \[ x \] \/ x^m . $
  For $f in A = k \[ \[ a \, t \] \]$, define its Hasse derivatives using independent formal variables $z \, w$ by
  $ f \( a + z \, t + w \) = sum_(r \, s gt.eq 0) \( partial_a^(\[ r \]) partial_t^(\[ s \]) f \) \( a \, t \)
    thin z^r w^s quad upright("in ") k \[ \[ a \, t \, z \, w \] \] = A \[ \[ z \, w \] \] . $
  These prescriptions extend uniquely to a ring map by the finite Hasse–Taylor expression
  #[#set math.equation(numbering: n => "(9.2)")
   $ f mapsto sum_(r \, s gt.eq 0\
r + s < m) \( partial_a^(\[ r \]) partial_t^(\[ s \]) f \) \( 0 \, t \) thin alpha^r beta^s . $ <eq:finite-taylor>]
  One may obtain the same formula without topology by expanding $A$ over $A^(p^e)$ in the finitely many monomials
    $a^r t^s$ with $0 lt.eq r \, s < p^e$, where $p^e gt.eq m$;
    the nilpotent corrections then disappear on $p^e$-th powers.
    This proves both well-definedness and uniqueness of the substitution.
    In particular, arbitrary lifts of the coefficients of $alpha$ and $beta$ from one jet to the next give a ring lift.
  Suppose the map and identification have been chosen modulo $x^m$.
    The kernel of $R \[ x \] \/ x^(m + 1) arrow.r R \[ x \] \/ x^m$ is square-zero.
    The ring lifts just constructed form a torsor under the corresponding derivations from $A$.
    The map from this torsor to the torsor of deformations is equivariant for the Kodaira–Spencer isomorphism.
    It is therefore a bijection. Exactly one parameter lift realizes $cal(D)_(m + 1)$ with the prescribed
    identification modulo $x^m$.
  There is also at most one isomorphism lifting the prescribed one.
    Here the needed rigidity has a short square-zero proof. If a homomorphism of $p$-divisible groups reduces to
    zero across a square-zero ideal in characteristic $p$, its values lie in the infinitesimal kernel at the
    identity. That kernel is an additive group of derivations into the square-zero ideal and is killed by $p$.
    Indeed, on any test algebra and at each finite torsion level,
    a point reducing to the identity has the form $epsilon + d$,
    where $epsilon$ is the identity point and $d$ is such a derivation; the group law adds these derivations.
    The homomorphism is consequently killed by $p$; since multiplication by $p$ on its source $p$-divisible group
    is an epimorphism for the flat topology, the homomorphism is zero.
    Applying this to the difference of two lifts proves uniqueness.
    Induction proves compatibility of all maps and isomorphisms in (9.1).
  #emph[Compatibility with the two stabilizer actions.] The unique lifts must respect both the action of $P$ on
    the deformation and the marking-change action of $J$. We check the special-fiber action and then use
    uniqueness at each square-zero step. On the perfect special fiber there are no cross homomorphisms between the
    marked connected and étale summands. A section of connected Honda torsion over the reduced ring $R$ is zero,
    and a map in the opposite direction vanishes by connectedness.
    The transported action is therefore block diagonal. By Lemma 15,
    $P$ preserves the connected frame and changes the étale frame by a constant norm unit.
    The action of $J$ changes the connected frame by a constant Honda automorphism and the étale frame by a
    constant unit. These actions extend to $cal(D)_m$: use the universal height-two deformation action on its
    connected factor and the same units on the constant factor.
  More explicitly, let $f : cal(G)_R^0 arrow.r Gamma_2$ be the connected marking and let $s_f :
    Gamma_2 xor bb(Q)_p \/ bb(Z)_p arrow.r cal(G)_R$ be the splitting supplied by $f$ and the uniquely lifted
    normalized generator $e_f$. In the convention of (4.9),
  $ f' = j f g^(- 1) \, wide s_(f') = g s_f #scale(x: 120%, y: 120%)[\(] j^(- 1)
    xor \[ "Nrd" \( j \) "Nrd" \( g \)^(- 1) \] #scale(x: 120%, y: 120%)[\)] . $
  The equality is checked on the connected marking and on the normalized étale generator,
    which determine both summands. This is the block action that we lift to $cal(D)_m$,
    using the universal height-two action and the same constant unit on the étale factor.
  Functoriality of the two lifting torsors, followed by uniqueness, makes (9.1) and its group isomorphism equivariant.
  #emph[Control at a finite coefficient stage.] Write $phi_m \( a \) = alpha$ and $phi_m \( t \) = t +
    beta$ for the selected map. For fixed $m$, the finitely many coefficients of $alpha$ and $beta$ belong to a
    common finite root/marking stage. The Hasse derivatives in (9.2) are elements of $k \[ \[ t \] \]$ and depend
    continuously on $f$ in its $\( a \, t \)$-adic topology. For fixed $m$ their orders in $t$ tend to infinity
    with the $\( a \, t \)$-adic order of $f$, up to a fixed finite shift.
    Formula (9.2) therefore gives continuity into that complete stage.
    Every individual coefficient of the formal-group isomorphism is an element of $R \[ x \] \/ x^m$.
    A finite set of them lies in a common larger stage. This last assertion is deliberately about finite sets of
    coefficients; no single finite stage for the whole marking is required. ◻
]

=== 9.2 Comparison of the homotopy cochains <comparison-of-the-homotopy-cochains>

#thm([Theorem 9.2.])[
  (The comparison through all jets).  #emph[For every $m gt.eq 1$ there is a natural, compatible,
    $J$-equivariant quasi-isomorphism of cochain complexes
#[#set math.equation(numbering: n => "(9.3)")
 $ D_m^bullet arrow.r C_(upright("cts"))^bullet \( P \, R \) \[ x \] \/ x^m \, $ <eq:finite-jet-map>]

 where the cochains on $R$ have the finite-stage convention of Definition 5.
   The action of $P$ on the target fixes $x$, and $J$ acts through its actions on $R$ and the height-two
   coefficients. Consequently, in each internal degree $2 j$,
   the diagonal homotopy cochains of the spectral sequence in Proposition 44 are naturally quasi-isomorphic to
#[#set math.equation(numbering: n => "(9.4)")
 $ (lim_m C_(upright("cts"))^bullet \( P \, R \) \[ x \] \/ x^m) ⊗_(k \[ \[ x \] \]) Omega^(⊗ j) .
   $ <eq:all-jet-comparison>]

 Odd internal degrees vanish. In particular,
#[#set math.equation(numbering: n => "(9.5)")
 $ sans(E)_(2 \, Delta)^(s \, 2 j) = H^s \( P \, R \) \[ \[ x \] \] ⊗_(k \[ \[ x \] \]) Omega^(⊗ j) .
   $ <eq:homotopy-second-page>]

 Here the coefficient groups are the actual representations of Theorem 41:
   they are $k$ in degrees $0 \, 1$, the one-dimensional line $ell$ in degrees $3 \, 4$, and zero otherwise.
   The action of $J$ on the first two lines is trivial, and $ell \|_(cal(O)_F^times) = k \( delta \)$.]
] <thm:jet-comparison>

#proof[
  #emph[Recovering the formal isomorphism.] Apply Lemma 47.
    We first show directly that its isomorphism of algebraic $p$-divisible groups supplies the formal-law
    isomorphism required by ordinary cooperations. Fix $m$, put $Lambda = R \[ x \] \/ x^m$,
    and write $I = \( x \)$. Let $cal(F)_3$ be the formal law over $A$.
    The preparation used to form the finite kernel over $A$ is
  $ \[ p^l \]_(cal(F)_3) \( T \) = U_l \( T \) W_l \( T \) \, wide U_l in A \[ \[ T \] \]^times \, $
  where $W_l$ is monic. Set
  $ cal(B)_l = Lambda \[ T \] \/ phi_m \( W_l \) \, wide f_l \( T \) =
    phi_m \( \[ p^l \]_(cal(F)_3) \( T \) \) in Lambda \[ \[ T \] \] . $
  Coefficientwise application of $phi_m$ preserves the displayed identity.
    Moreover $phi_m \( U_l \)$ is still a unit, because its constant coefficient is the image of an $A$-unit.
    Thus $\( f_l \) = \( phi_m \( W_l \) \)$ in $Lambda \[ \[ T \] \]$.
  Put $n_l = p^(2 l)$. Modulo $I$, the law has height two and
  $ overline(f)_l = T^(n_l) v_l \( T \) \, wide v_l \( 0 \) in R^times . $
  In $Q_l = Lambda \[ \[ T \] \] \/ \( f_l \)$ this gives $T^(n_l) in I Q_l$; hence $T^(m n_l) = 0$, since $I^m =
    0$. In the other direction, the invariant-differential formula in characteristic $p$ gives $\[ p \]' \( T \) =
    0$. The series $\[ p \] \( T \)$ therefore factors through $T^p$,
    and its $l$-fold composite belongs to $\( T^(p^l) \)$. Consequently
  #[#set math.equation(numbering: n => "(9.6)")
   $ \( T^(m p^(2 l)) \) subset.eq \( f_l \) subset.eq \( T^(p^l) \) . $ <eq:torsion-coordinate-bounds>]
  These nested ideals are cofinal with the powers of $\( T \)$.
  We also identify the finite algebraic factor explicitly. The reduced prepared polynomial has the factorization
  $ overline(phi_m \( W_l \)) = T^(n_l) h_l \( T \) \, wide h_l \( 0 \) in R^times . $
  Its factors are relatively prime, so the Chinese remainder theorem gives
  $ cal(B)_l \/ I cal(B)_l tilde.equiv R \[ T \] \/ T^(n_l) times R \[ T \] \/ h_l . $
  The identity idempotent lifts uniquely across the nilpotent ideal $I cal(B)_l$, giving
  $ cal(B)_l = cal(B)_l^0 times cal(B)_l^(upright("away")) . $
  On $cal(B)_l^0$, $T^(n_l) in I cal(B)_l^0$ and thus $T^(m n_l) = 0$.
    On $cal(B)_l^(upright("away"))$, $T$ is invertible modulo $I$ and hence invertible.
    The polynomial map $cal(B)_l arrow.r Q_l$ kills the away factor, because $T$ is nilpotent in $Q_l$.
    Conversely, evaluation at the nilpotent element $T in cal(B)_l^0$ defines a map $Q_l arrow.r cal(B)_l^0$.
    These two maps are inverse on coefficients and $T$; both algebras are generated by polynomials in $T$. Therefore
  $ Lambda \[ \[ T \] \] \/ \( f_l \) tilde.equiv cal(B)_l^0 . $
  The $T$-adic completion of $cal(B)_l$ stabilizes at this factor.
    In particular this identification uses no Noetherian hypothesis on $Lambda$.
  The factor $cal(B)_l^0$ is the relative identity component of the finite kernel.
    Its unique idempotent construction is natural under base change and frame isomorphisms.
    The isomorphism of $p$-divisible groups therefore restricts compatibly to these factors.
    By (9.6), their inverse limit recovers $Lambda \[ \[ T \] \]$.
    To recover the group law as well, put $N_l = m p^(2 l)$. The same bounds give
  $ \( T \, S \)^(2 N_l - 1) subset.eq \( f_l \( T \) \, f_l \( S \) \) subset.eq \( T \, S \)^(p^l) quad
    upright("in ") Lambda \[ \[ T \, S \] \] . $
  Thus every finite order in the two coordinates is seen at a sufficiently large common torsion level.
    The compatible homomorphism identities on the products of the finite kernels determine the identity on the
    full formal laws. We have obtained the required continuous formal-law isomorphism and its inverse,
    naturally under all the marking actions.
  #emph[Evaluating the cooperation complex.] This isomorphism evaluates the degree-zero cooperation algebra in
    $R \[ x \] \/ x^m$. To include the other factor in (8.11),
    apply $phi_m$ pointwise to its characteristic-$p$ height-three continuous functions.
    Formula (9.2) makes this a continuous evaluation into a complete finite root/marking stage.
    More explicitly, an element of the ordinary tensor product is a finite sum of cooperation elements times
    continuous coefficient functions. For this element and this $m$,
    choose a stage containing the parameter corrections and the finitely many formal-isomorphism coefficients
    occurring in those cooperation elements. All its evaluated functions then take values in that one stage.
    This proves the finite-stage requirement for (9.3); it does not demand one stage for all cooperation elements
    at once. The same argument retains arbitrary compact profinite parameters,
    using the same finite Taylor formula and supremum topology.
  #emph[Agreement with the realized stabilizer action.] To use this coefficient map in the homotopy test,
    we must identify its $J$-action with the action induced by the actual automorphisms of $E_2$.
    This requires the full marking isomorphism through every jet. We make that agreement explicit.
    Let $cal(F)_2$ be the chosen height-two law over $B_2 = W \( k \) \[ \[ x \] \]$.
    For $j in J$, write its marked-lift transport as
  $ rho_j : B_2 arrow.r B_2 \, wide h_j : rho_j^(*) cal(F)_2 arrow.r^tilde.op cal(F)_2 \, wide h_j med
    mod med \( p \, x \) = j . $
  The last equality retains the entire Honda series. These are the coefficient action and universal transport of
    #cite(label("DH95"), form: "prose") Section 1, Equation (1.4), pp. 673–674, in the chosen coordinate.
    Uniqueness identifies their reductions with the height-two action through every jet and gives the group law
    for the transports.
  The geometric marking action $mu_j \( f \) = j f$ induces the left coefficient action
    $sigma_j^R = \( mu_(j^(- 1)) \)^(*)$. Let $iota_m : B_2 arrow.r Lambda =
    R \[ x \] \/ x^m$ be the coefficient map and $sigma_j$ the diagonal action, so $sigma_j iota_m =
    iota_m rho_j$. Inverse pullback changes the displayed special-fibre splitting to
    $s_f \( j xor \[ "Nrd" \( j \)^(- 1) \] \)$. Replacing this connected block by $iota_m \( h_j \)$,
    with the same étale unit, restores the same marked deformation at each lifting step.
    The two uniqueness statements in Lemma 47 therefore give, for the recovered formal marking $Phi_m :
    phi_m^(*) cal(F)_3 arrow.r iota_m^(*) cal(F)_2$,
  $ sigma_j phi_m = phi_m \, wide sigma_j^(*) Phi_m = iota_m \( h_j^(- 1) \) compose Phi_m :
    phi_m^(*) cal(F)_3 arrow.r \( iota_m rho_j \)^(*) cal(F)_2 . $
  Here the superscript $sigma_j^(*)$ means coefficientwise base change.
  For the realized map $e_j : E_2 arrow.r E_2$, let $mu$ denote multiplication.
    The ordinary same-height cooperation point $pi_(*) \( mu \( 1 and e_j \) \)$ over $B_2$ has coefficient maps
    $1 \, rho_j$ and right-to-left formal isomorphism $h_j$ #cite(label("GH04")) Proposition 7.3, Equation (7.3),
    and Corollary 7.7. Thus its coordinate identity is $X_2 = h_j \( e_j \( X_2 \) \)$.
    Let $F_(E_3) \/ E_(3 \, 0)$ denote the chosen height-three law before reduction.
    A degree-zero point of the ordinary cross-height algebra over a commutative ring $Q$ is a triple
    $\( psi_2 \, psi_3 \, Phi \)$: $psi_2 : B_2 arrow.r Q$ and $psi_3 : E_(3 \, 0) arrow.r
    Q$ are its coefficient maps, and $Phi : psi_3^(*) F_(E_3) arrow.r^tilde.op psi_2^(*)
    cal(F)_2$ is its right-to-left formal isomorphism with invertible derivative, as in Lemma 45.
    The actual action of $e_j and 1$ is consequently
  $ \( psi_2 \, psi_3 \, Phi \) mapsto \( psi_2 rho_j \, psi_3 \, psi_2 \( h_j^(- 1) \) compose Phi \) . $
  After diagonal characteristic-$p$ reduction, this is the same formula as for $Phi_m$,
    on all isomorphism coefficients; equivalently $psi_2 \( h_j^(- 1) \) = \( psi_2 rho_j \) \( h_(j^(- 1)) \)$.
    For $d_j = h'_j \( 0 \)$, a compatible degree-two cotangent generator transforms by $d_j^(- 1)$,
    and the derivative $c = u_2 \/ u_3$ of the marking transforms by the same factor.
    This identifies the action on the actual line $Omega$: a compatible frame change with linear term $a$ replaces
    $d_j$ by $a d_j rho_j \( a \)^(- 1)$. The entire series $j$ is retained,
    so this includes every principal unit, even when its closed-fibre derivative is one.
    Naturality of the external product in (8.11) carries this calculation to every $C^s$,
    with $J$ fixing the height-three function factor. The bar faces are evaluation, multiplication,
    and transport by $P$. Equivariance and uniqueness in Lemma 47 show that evaluation commutes with the action
    face; the remaining faces and degeneracies commute by their formulas.
    The preceding calculation gives $J$-equivariance. We have therefore constructed actual maps of the homotopy
    cochain complexes in (9.3). Their construction in nonzero even internal degrees uses only the height-two
    periodicity line and hence gives its stated tensor power.
  #emph[Quasi-isomorphism at each finite jet.] At $m = 1$, Lemma 45 identifies this map with
  $ C_(upright("cts"))^bullet \( P \, L \) arrow.r C_(upright("cts"))^bullet \( P \, R \) . $
  It is the natural inclusion and is a quasi-isomorphism by Theorem 41. Filter (9.3) by powers of $x$.
    Flatness in Lemma 45 identifies each source associated-graded layer with $D_1^bullet$,
    and each target layer with $C_(upright("cts"))^bullet \( P \, R \)$.
    The induced map is the same residue inclusion, multiplied by the corresponding formal power of $x$.
    The finite filtration thus shows that (9.3) is a quasi-isomorphism for every $m$.
  #emph[Passing to the inverse limit.] Both inverse systems of cochain terms have surjective transition maps.
    Their strict inverse limits consequently compute their derived inverse limits,
    and the latter preserve the levelwise quasi-isomorphisms. Combining this with Lemma 46 proves (9.4).
    On the target the differential acts coefficientwise in $x$.
    Products of complexes of $k$-vector spaces are exact, or equivalently the finite-jet cohomology maps are
    surjective. Thus its cohomology is $H^s \( P \, R \) \[ \[ x \] \]$,
    giving (9.5) and its asserted coefficient lines.
  #emph[The action on completed homotopy.] We identify the action above with the action on actual completed
    homotopy. The original tested spectrum carries $J$, even if the cofibers by $x^m$ were chosen without
    equivariance. Fix a cosimplicial degree $s$, and put
  $ D_(upright("ord")) = #scale(x: 120%, y: 120%)[\(] pi_0 \( \( E_2 and C^s \) \/ p \)
    #scale(x: 120%, y: 120%)[\)]_Delta \, wide hat(D) = lim_m D_m^s . $
  By Lemma 45, $D_(upright("ord"))$ is flat over $k \[ \[ x \] \]$ and $D_m^s =
    D_(upright("ord")) \/ x^m D_(upright("ord"))$. Lemma 46 identifies $hat(D)$ with the actual degree-zero
    diagonal completed homotopy and its projections with reduction maps. For every $m gt.eq 1$,
  $ ker \( hat(D) arrow.r D_m^s \) = x^m hat(D) . $
  Indeed, the component modulo $x^(m + r)$ of an element in this kernel is $x^m$ times a unique component modulo
    $x^r$, because multiplication by $x$ is injective on $D_(upright("ord"))$.
    These components are compatible as $r$ varies, proving one inclusion; the reverse inclusion is immediate.
    The image of $D_(upright("ord"))$ is dense for the separated topology defined by these projection kernels.
    The natural map $\( E_2 and C^s \) \/ p arrow.r cal(T) \( C^s \)$ is $J$-equivariant,
    so the actual action agrees with the ordinary action on that image.
    For every $g in J$, semilinearity and $g \( x \) in x thin k \[ \[ x \] \]^times$ give $g \( x^m hat(D) \) =
    x^m hat(D)$. The kernel identity therefore makes the actual $g$-action continuous for this topology.
    The action obtained from the compatible $D_m^s$-actions is also continuous and agrees on the same dense image,
    so the two actions coincide. Tensoring with the actual finite free line $Omega^(⊗ j)$ gives the same
    conclusion in every even internal degree $2 j$. All diagonal projections commute with this action.
    We have used the new coefficient maps to identify the existing spectral sequence,
    without requiring a separate spectral realization of those maps. ◻
]

#prodef([Remark 9.3.])[
  Theorem 48 identifies the action before inverting $x$, through every quotient $k \[ \[ x \] \] \/ \( x^m \)$.
    In particular, after restriction to $cal(O)_F^times$ and the exact scalar extension to $k \( \( x \) \)$,
    the upper rows are the constant character $delta$ tensored with the actual periodicity line.
    This is the information needed in the following section; an identification only after setting $x =
    0$ would not provide it.
] <rem:why-all-jets>

== 10 The surviving norm-character obstruction <sec:obstruction>

Theorem 48 retains a line whose restriction to $G_F$ is the norm character in the upper two cohomological degrees.
  We now show that this line cannot be a periodicity power over the generic deformation field,
  and then use the actual finite abutment filtration to contradict Proposition 3.

=== 10.1 The norm line over $Q_x$ <the-norm-line-over-q_x>

Recall that $G_F = cal(O)_F^times$ is the full unit group of the unramified quadratic extension $F \/ bb(Q)_3$,
  acting semilinearly on $Q_x = k \( \( x \) \)$. Its residue norm is the surjective character

$ delta : G_F arrow.r bb(F)_9^times arrow.r^(thin N_(bb(F)_9 \/ bb(F)_3) thin) bb(F)_3^times subset k^times . $

In particular $delta$ is nontrivial and $delta^2 = 1$. The following lemma uses the whole group,
  including its principal units. Restricting only to the finite residue-field subgroup would not yield this conclusion.

#thm([Lemma 10.1.])[
  (A character not supplied by periodicity).  #emph[The fixed field $Q_x^(G_F)$ is $k$. Moreover,
$ Q_x \( delta \) tilde.eq.not overline(omega)^(⊗ b) wide upright("for every ") b in bb(Z) $

 as semilinear $G_F$-representations.]
] <lem:generic-character>

#proof[
  We first show that the action of $G_F$ on $Q_x$ has infinite image.
    Let $cal(F)$ be the characteristic-$p$ universal height-two formal group over $cal(O)_x$.
    If $g in G_F$ acts trivially on $cal(O)_x$, its marking-change isomorphism is an automorphism of $cal(F)$ over
    that ring. Over $Q_x$, the first Hasse coefficient is invertible, so $cal(F)$ has height one.
    After extending $Q_x$ to an algebraic closure, the height classification identifies it with the multiplicative
    formal group #cite(label("Lazard55")) Theorem IV.
  The automorphisms of the multiplicative formal group are precisely the intrinsic scalar automorphisms $\[ c \]$,
    $c in bb(Z)_p^times$. Indeed, restriction to its finite $p^r$-torsion group schemes identifies an automorphism
    with a compatible system in $lim_r \( bb(Z) \/ p^r \)^times = bb(Z)_p^times$:
    the character group of $mu_(p^r)$ is $bb(Z) \/ p^r$, and the ideals $\( T^(p^r) \)$ are cofinal in the
    formal-coordinate topology. Thus these restrictions determine one scalar automorphism of the entire formal group.
  Every $\[ c \]$ is already defined on $cal(F)$ over $cal(O)_x$.
    For example, integer approximations to $c$ modulo $p^r$ give compatible formal power series because the order
    of $\[ p^r \] \( T \)$ tends to infinity. The injection of $cal(O)_x$ into the algebraic closure of $Q_x$
    therefore shows, coefficient by coefficient, that the marking-change automorphism equals $\[ c \]$ over
    $cal(O)_x$. Specializing at $x = 0$ shows that $g$ is scalar on the Honda group,
    or that $g^(- 1)$ is scalar under the opposite action convention.
    Thus the kernel of the action on $Q_x$ is contained in the central subgroup $bb(Z)_p^times$.
    The quotient $cal(O)_F^times \/ bb(Z)_p^times$ is infinite:
    on principal units, the $3$-adic logarithm identifies the relevant ranks with those of $3 cal(O)_F$ and $3
    bb(Z)_p$, namely two and one. The action on $Q_x$ has infinite image.
  Every element of $G_F$ fixes $k$ and preserves the $x$-adic valuation. Suppose $f in Q_x^(G_F)$ is not in $k$.
    If its valuation is negative, replace it by $f^(- 1)$; if its valuation is zero, subtract its residue in $k$.
    We obtain a nonzero invariant $z$ with strictly positive valuation $d = v_x \( z \)$.
    The substitution $k \[ \[ Z \] \] arrow.r k \[ \[ x \] \]$, $Z mapsto z$,
    makes $k \[ \[ x \] \]$ finite free of rank $d$ over $k \[ \[ z \] \]$,
    by the one-variable Weierstrass theorem. Hence $Q_x \/ k \( \( z \) \)$ is a finite field extension.
    Continuity implies that every element fixing $z$ fixes $k \( \( z \) \)$,
    so the image of $G_F$ lies in the finite automorphism group of this extension.
    This contradicts its infinite image. Separability is not needed:
    the automorphism group of any finite field extension has cardinality at most its degree. We have proved
  #[#set math.equation(numbering: n => "(10.1)")
   $ Q_x^(G_F) = k . $ <eq:generic-fixed-field>]
  Next consider the first Hasse invariant. For an even-periodic theory the cotangent line of its formal group
    identifies with $pi_2$: restriction of the augmentation ideal to $bb(C P)^1$ identifies its quotient by its
    square with $tilde(E)_2^0 \( bb(C P)^1 \) = pi_2 E_2$. Thus $Omega =
    omega \/ p$ is the cotangent line of $cal(F)$. In a coordinate $T$,
    let $a_1$ be the coefficient of $T^p$ in $\[ p \]_(cal(F)) \( T \)$.
    Under $T' = c T + O \( T^2 \)$, that coefficient becomes $c^(1 - p) a_1$, while $d T' =
    c thin d T$ at the identity. Therefore
  $ h = a_1 \( d T \)^(⊗ \( p - 1 \)) $
  is an intrinsic, hence $G_F$-invariant, section of $Omega^(⊗ \( p - 1 \)) = Omega^(⊗ 2)$.
    The universal height-two parameter is its simple zero: the transported Lubin–Tate normalization in Section 3
    gives $a_1 = x$ in the chosen coordinate. In any integral frame $e$ of $Omega$, write
  #[#set math.equation(numbering: n => "(10.2)")
   $ h = h_e e^(⊗ 2) \, wide v_x \( h_e \) = 1 . $ <eq:hasse-valuation>]
  Thus $h$ is an invariant basis of $overline(omega)^(⊗ 2)$ over $Q_x$.
  Suppose now that $Q_x \( delta \) tilde.eq overline(omega)^(⊗ b)$.
    The image of the distinguished basis of $Q_x \( delta \)$ is a basis $v =
    f e^(⊗ b)$ with $f in Q_x^times$ and $g \( v \) = delta \( g \) v$. Since $delta^2 = 1$, the ratio
  $ v^(⊗ 2) / h^(⊗ b) = f^2 / h_e^b $
  is a nonzero invariant function. By (10.1), it lies in $k^times$. Taking valuations in (10.2) gives the exact equality
  #[#set math.equation(numbering: n => "(10.3)")
   $ 2 v_x \( f \) = b . $ <eq:character-parity>]
  Hence $b$ is even. But $h^(⊗ b \/ 2)$ is then an invariant basis of $overline(omega)^(⊗ b)$, so this line is trivial.
  Finally, $Q_x \( delta \)$ is not trivial. Otherwise there would be $u in Q_x^times$ with $g \( u \) =
    delta \( g \) u$ for every $g in G_F$; the inverse convention is the same because $delta^(- 1) = delta$.
    Then $u^2 in k^times$ by (10.1), so $u$ is algebraic over $k$.
    The finite field $k$ is relatively algebraically closed in $k \( \( x \) \)$.
    To see this, an element algebraic over $k$ satisfies $u^(\| k \|^r) = u$ for some $r > 0$.
    If nonzero it has valuation zero; subtract its residue and compare positive valuations in the same equation to
    see that the difference is zero. Thus $u in k^times$, contradicting the nontriviality of $delta$.
    This proves the lemma. ◻
]

The fixed-field part of the proof is what prevents a nonconstant function of $x$ from disguising the norm
  character as a periodicity twist. The remaining step is to ensure that the line cannot disappear before reaching
  homotopy.

=== 10.2 The actual homotopy filtration <the-actual-homotopy-filtration>

We first record the homotopy calculation independently of the finite-assembly question.
  Recall $Z_k = L_(K \( 3 \)) S_k$, and write $cal(V)_d^Delta \( Z_k \)$ for the diagonal constant-field summand
  of the test $cal(V)_d \( Z_k \)$ from (2.1). Its scalar field is $Q_x$, and we restrict its action to $G_F$.

#thm([Proposition 10.2.])[
  (The generic diagonal homotopy).  #emph[The diagonal spectral sequence of Proposition 44,
    after extension of scalars to $Q_x$, collapses at its second page.
    For every $r in bb(Z)$, its actual abutment filtration gives $G_F$-equivariant short exact sequences
#[#set math.equation(numbering: n => "(10.4)")
 $ 0 & arrow.r Q_x \( delta \) ⊗_(Q_x) overline(omega)^(⊗ \( r + 2 \)) arrow.r
   cal(V)_(2 r)^Delta \( Z_k \) arrow.r overline(omega)^(⊗ r) arrow.r 0 \,\
0 & arrow.r Q_x \( delta \) ⊗_(Q_x) overline(omega)^(⊗ \( r + 1 \)) arrow.r
  cal(V)_(2 r - 1)^Delta \( Z_k \) arrow.r overline(omega)^(⊗ r) arrow.r 0 . $ <eq:generic-even-filtration>]

 In particular, each diagonal summand $cal(V)_d^Delta \( Z_k \)$ has dimension two over $Q_x$,
   and $cal(V)_(- 3)^Delta \( Z_k \)$ contains a subrepresentation isomorphic to $Q_x \( delta \)$.]
] <prop:generic-homotopy>

#proof[
  Apply Proposition 44 to $Y \/ p = cal(T) \( Z_k \)$, take the diagonal constant-field summand,
    and localize homotopy groups from $cal(O)_x$ to $Q_x$. Restrict the actions to $G_F$.
    Theorem 48 gives the complete list of nonzero terms on the second page:
  #[#set math.equation(numbering: n => "(10.5)")
   $ upright("cohomological degree ") s & sans(E)_2^(s \, 2 j) \, quad j in bb(Z)\
0 \, 1 & overline(omega)^(⊗ j)\
3 \, 4 & Q_x \( delta \) ⊗_(Q_x) overline(omega)^(⊗ j) . $ <eq:obstruction-page>]
  All odd internal degrees vanish. Here $sans(E)_r$ denotes the diagonal, localized spectral sequence.
    Its differentials have bidegree
  $ d_r : sans(E)_r^(s \, t) arrow.r sans(E)_r^(s + r \, t + r - 1) . $
  An even $r$ changes internal parity, so its differential is zero.
    For odd $r gt.eq 3$, the four cohomological degrees in (10.5) leave only $r = 3$, from $s = 0$ to $s =
    3$ or from $s = 1$ to $s = 4$. Every such differential would have the form
  #[#set math.equation(numbering: n => "(10.6)")
   $ overline(omega)^(⊗ j) arrow.r^(med d_3 med) Q_x \( delta \) ⊗_(Q_x) overline(omega)^(⊗ \( j + 1 \)) .
     $ <eq:forbidden-differential>]
  It is a $Q_x$-linear, $G_F$-equivariant map. A nonzero map between these one-dimensional representations is an
    isomorphism; after tensoring with the inverse periodicity line,
    it would identify $Q_x \( delta \)$ with a periodicity power. Lemma 50 excludes that possibility.
    Both possible $d_3$ families therefore vanish, and no later differential is possible.
  The diagonal idempotent commutes with the actual finite filtration supplied by Proposition 44,
    and localization from $cal(O)_x$ to $Q_x$ is exact. Thus
  $ F^s cal(V)_d^Delta \( Z_k \) \/ F^(s + 1) cal(V)_d^Delta \( Z_k \) tilde.eq sans(E)_oo^(s \, d + s) . $
  For $d = 2 r$, the only nonzero quotients occur at $s = 0 \, 4$;
    they are $overline(omega)^(⊗ r)$ and $Q_x \( delta \) ⊗ overline(omega)^(⊗ \( r + 2 \))$, respectively.
    For $d = 2 r - 1$, they occur at $s = 1 \, 3$, with lines $overline(omega)^(⊗ r)$ and $Q_x \( delta \) ⊗
    overline(omega)^(⊗ \( r + 1 \))$. The filtration starts with the whole homotopy group and ends at zero,
    so the higher-filtration line is a subrepresentation and the lower one is its quotient.
    This proves the two exact sequences and the dimension assertion. Taking $r = - 1$ in (10.4) gives
  $ 0 arrow.r Q_x \( delta \) arrow.r cal(V)_(- 3)^Delta \( Z_k \) arrow.r overline(omega)^(⊗ \( - 1 \)) arrow.r 0 . $
  ◻
]

These sequences describe the two nonzero graded pieces and their order in actual homotopy;
  they do not assert an equivariant splitting. The norm line can now be compared directly with the finite-assembly
  detector.

#proof[
  Suppose, to the contrary, that
  $ L_2 L_(K \( 3 \)) S in "Thick" { L_0 S \, L_1 S \, L_2 S } $
  in the category specified in the Theorem. Forgetting to spectra and applying exact $K \( 2 \)$-localization
    sends $L_0 S$ and $L_1 S$ to zero, and sends $L_2 S$ to $upright(bold(1))_2$.
    Moreover, $L_(K \( 2 \)) L_2 L_(K \( 3 \)) S tilde.eq L_(K \( 2 \)) L_(K \( 3 \)) S$.
    These are the Bousfield-class relations in #cite(label("Ravenel84"), form: "prose") Theorem 2.1(d),(i),
    together with the smashing property of $E \( i \)$-localization #cite(label("HS99")) Theorem 5.1 and
    Proposition 5.3. Thus $L_(K \( 2 \)) L_(K \( 3 \)) S$ lies in the ordinary thick subcategory generated by
    $upright(bold(1))_2$.
  By (8.1), the underlying $S$-module $S_k$ is finite free.
    Consequently $Z_k = L_(K \( 3 \)) S_k$, as an underlying spectrum,
    is a finite direct sum of copies of $L_(K \( 3 \)) S$. The same thick-generation conclusion holds for
    $L_(K \( 2 \)) Z_k$. No Galois-equivariant choice of basis of $S_k$ is required:
    the detector action comes from its $E_2$ factor, so every underlying spectrum map induces an equivariant
    detector map. Proposition 3 implies that
  #[#set math.equation(numbering: n => "(10.7)")
   $ cal(V)_d \( Z_k \) upright(" has only constituents ") overline(omega)^(⊗ b) \, quad b in bb(Z) \, quad
     upright("for every ") d in bb(Z) . $ <eq:required-constituents>]
  But Proposition 51 supplies the simple subrepresentation $Q_x \( delta \)$ of the diagonal summand of
    $cal(V)_(- 3) \( Z_k \)$, hence a simple constituent of that whole test. Lemma 50 excludes it from (10.7).
    This contradiction proves the Theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
