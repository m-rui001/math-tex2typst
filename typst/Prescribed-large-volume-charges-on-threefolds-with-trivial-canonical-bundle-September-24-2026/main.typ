#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Prescribed large-volume charges on threefolds with trivial canonical bundle]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A central charge assigns a complex number to each object of a derived category.
  A stability condition organizes the objects by its argument and requires every object to have a finite
  filtration by semistable factors. Bridgeland introduced this structure and its deformation theory
  #cite(label("Bridgeland2007")). On a projective threefold,
  the expected large-volume charges are exponential expressions in the Chern character.
  The prescribed-charge problem asks whether these particular expressions admit a compatible heart,
  finite semistable filtrations, and a support bound controlling the numerical classes of all semistable objects.

We construct stability conditions with the exact ordinary and square-root-Todd large-volume charges on every
  smooth projective complex threefold with trivial canonical bundle.
  One volume threshold works on an open set of real twists and real ample directions.
  The support property holds on the full numerical Grothendieck group,
  and the ordinary charge has the standard double-tilt heart.
  An independent argument proves strong tilt inequalities on every smooth projective complex threefold:
  a fixed rational correction works at every volume, and the correction vanishes beyond a threshold independent of
  the object and of the twist along a fixed polarization.

All varieties are over $bb(C)$, and all Chern characters and intersection products are numerical.
  Write $N^1 \( X \)_(bb(R))$ for the space of numerical real divisor classes, $"Amp" \( X \)$ for its ample cone,
  and $N_1 \( X \)_(bb(Q))$ for the space of numerical rational curve classes.
  A threefold is smooth, connected and projective. The assertions for a disjoint union follow by applying the
  results to its finitely many connected components and taking the largest constants.
  Write $D^(upright(b)) \( X \) = D^(upright(b)) "Coh" \( X \)$ and $"ch"^B \( E \) =
  e^(- B) "ch" \( E \)$ for a real numerical divisor class $B$.

=== 1.1 Prescribed charges and the full numerical group <prescribed-charges-and-the-full-numerical-group>

The Euler pairing is $chi \( E \, F \) = sum_j \( - 1 \)^j dim "Ext"^j \( E \, F \)$, and we use

$ K_(upright("num")) \( X \) = K_0 \( X \) \/ { v : chi \( v \, w \) = 0 upright(" for every ") w in K_0 \( X \) } . $

A numerical stability condition consists of a charge homomorphism $Z : K_(upright("num")) \( X \) arrow.r
  bb(C)$ and a locally finite slicing $cal(P)$ of $D^(upright(b)) \( X \)$.
  A slicing gives the semistable objects of each real phase, with $Z \( E \) = m \( E \) e^(i pi phi.alt)$,
  $m \( E \) > 0$, on $cal(P) \( phi.alt \)$, the shift and Hom-vanishing rules,
  and finite Harder–Narasimhan filtrations. Local finiteness requires the categories of sufficiently short phase
  intervals to have finite length. We require the support property of Kontsevich–Soibelman
  #cite(label("KontsevichSoibelman2008")) Sections 1.2 and 2.1 on the full real space
  $K_(upright("num")) \( X \)_(bb(R))$: for a norm there is $C > 0$ such that $parallel \[ E \] parallel lt.eq
  C \| Z \( E \) \|$ for every semistable $E$. Its heart is $cal(P) \( 0 \, 1 \]$.
  We call a stability condition geometric if all point sheaves $cal(O)_x$ are stable of phase $1$.

We specify the tilt conventions needed to state the heart in our theorem.
  For a real ample class $H$, a real divisor class $B$, and a coherent sheaf of positive rank put

$ mu_(H \, B) \( F \) = frac(H^2 "ch"_1^B \( F \), H^3 "ch"_0 \( F \)) \, $

and give a nonzero torsion sheaf slope $+ oo$. The slope Harder–Narasimhan filtration has semistable factors of
  strictly decreasing slopes; write $mu^(+)$ and $mu^(-)$ for its largest and smallest slopes.
  The slope torsion pair and its tilt are

$ cal(T)_(H \, B) = { F : mu_(H \, B)^(-) \( F \) > 0 } \, wide cal(F)_(H \, B) = { F :
  mu_(H \, B)^(+) \( F \) lt.eq 0 } \, wide cal(B)_(H \, B) = chevron.l cal(F)_(H \, B) \[ 1 \] \,
  cal(T)_(H \, B) chevron.r \, $

with the zero sheaf in both subcategories. Here a heart is the abelian category specified by a bounded
  $t$-structure, $\[ 1 \]$ is the cohomological shift, and brackets denote extension closure.
  Thus an object of $cal(B)_(H \, B)$ has ordinary cohomology only in degrees $- 1 \, 0$,
  in the indicated two subcategories.

For real $B$, real ample $H$ and $t > 0$, the ordinary physical charge is

#[#set math.equation(numbering: n => "(1.1)")
 $ Z_(B \, t H) \( E \) = - "ch"_3^B \( E \) + t^2 / 2 H^2 "ch"_1^B \( E \) +
   i (t H "ch"_2^B \( E \) - t^3 / 6 H^3 "ch"_0 \( E \)) . $ <eq:intro-physical>]

The first tilt is unchanged if the polarization $H$ is replaced by $t H$. On this first tilt, use the second slope

$ nu_(B \, t H) \( E \) = frac(t H "ch"_2^B \( E \) - t^3 H^3 "ch"_0 \( E \) \/ 6, t^2 H^2 "ch"_1^B \( E \)) . $

Its denominator-zero value is $+ oo$. An object is semistable for this slope if every nonzero proper subobject in
  $cal(B)_(H \, B)$ has slope at most that of the quotient; stability uses a strict inequality.
  The Harder–Narasimhan property holds for these real ample parameters #cite(label("BMS2016")) Section 2.
  Let $cal(T)'_(B \, t H)$ have strictly positive smallest Harder–Narasimhan slope,
  and $cal(F)'_(B \, t H)$ have nonpositive largest slope. The standard double-tilt heart is

$ cal(A)_(B \, t H) = chevron.l cal(F)'_(B \, t H) \[ 1 \] \, cal(T)'_(B \, t H) chevron.r . $

These definitions use the same strict-positive/nonpositive boundary at both tilts.

#thm([Theorem 1.1.])[
  (Exact large-volume charges on a real sector).  #emph[Let $X$ be a smooth projective complex threefold with $K_X
    tilde.eq cal(O)_X$. For any $B_(*) in N^1 \( X \)_(bb(R))$ and $H_(*) in
    "Amp" \( X \)$ there are open neighborhoods $V$ of $B_(*)$ and $W$ of $H_(*)$ and one $T > 0$ such that,
    for all $B in V$, $H in W$ and $t gt.eq T$, the following hold.]
  + #emph[$\( Z_(B \, t H) \, cal(A)_(B \, t H) \)$ is a geometric numerical stability condition with support on
    $K_(upright("num")) \( X \)_(bb(R))$.]
  + #emph[There is a geometric numerical stability condition, with support on the same full numerical space,
    whose charge is exactly
$ Z_(B \, t H)^(upright("LV")) \( E \) = - integral_X e^(- B - i t H) "ch" \( E \) sqrt("td" \( X \)) \, wide
  sqrt("td" \( X \)) = 1 + frac(c_2 \( X \), 24) . $

 Its heart is the one constructed in Section 2.]
] <thm:geometric-sector>

Only triviality of $K_X$ is assumed; the additional vanishings $H^1 \( X \, cal(O)_X \) =
  H^2 \( X \, cal(O)_X \) = 0$ in the strict Calabi–Yau convention are unnecessary.
  The quantifiers give one threshold for both charges throughout the same real sector.
  The two hearts are specified separately: the ordinary charge uses the double tilt defined above,
  while the Todd-corrected charge uses the heart constructed in Section 2.

The ordinary and square-root-Todd charges have large-volume antecedents in Bayer’s polynomial stability conditions
  #cite(label("BayerPolynomial2009")) Theorem 3.2.2 and Section 4.
  Polynomial stability orders phases asymptotically as the volume tends to infinity.
  Our theorem constructs a numerical Bridgeland stability condition at each finite volume in the stated sector.
  The passage to finite volume must also control the charge kernel:
  on a threefold of Picard rank greater than one, the full numerical group contains classes invisible to the four
  intersection degrees along a single polarization.

=== 1.2 Independent uniform tilt inequalities <independent-uniform-tilt-inequalities>

The numerical problem concerns the third Chern character,
  which is absent from the classical Bogomolov–Gieseker inequality.
  Bayer–Macrì–Toda introduced the double-tilt construction and proposed a third-character inequality that would
  make it a source of stability conditions #cite(label("BMT2014")).
  Bayer–Macrì–Stellari established that inequality for abelian threefolds and Calabi–Yau threefolds of abelian
  type, and developed the discriminants, deformation and wall framework used below #cite(label("BMS2016")).
  For this part fix an ample integral divisor $H$ and a rational numerical divisor $B_0$.

For $a > 0$, $b in bb(R)$ and $B = B_0 + b H$, the tilt slope is

#[#set math.equation(numbering: n => "(1.2)")
 $ nu_(a \, b) \( E \) = frac(H "ch"_2^B \( E \) - 1 / 2 a^2 H^3 "ch"_0 \( E \), H^2 "ch"_1^B \( E \)) \,
   $ <eq:intro-tilt>]

with value $+ oo$ when the denominator is zero. We use the same subobject–quotient comparison for tilt stability.
  At finite slope, semistability is equivalently the comparison with the slope of the object itself.
  The treatment of zero-dimensional quotients and the finite factor filtrations needed below is given in Section 4.

#thm([Theorem 1.2.])[
  (Uniform strong inequality).  #emph[Let $X$ be a smooth projective complex threefold,
    $H$ an ample integral divisor, and $B_0 in N^1 \( X \)_(bb(Q))$.
    There are constants $k in bb(Q)_(gt.eq 0)$ and $R_(*) > 0$, depending only on $\( X \, H \, B_0 \)$,
    such that every finite-slope $nu_(a \, b)$-semistable $E in
    cal(B)_(H \, B_0 + b H)$ with $nu_(a \, b) \( E \) = 0$ satisfies
#[#set math.equation(numbering: n => "(1.3)")
 $ "ch"_3^(B_0 + b H) \( E \) lt.eq (a^2 / 6 + k) H^2 "ch"_1^(B_0 + b H) \( E \)
   wide \( a > 0 \, med b in bb(R) \) . $ <eq:intro-corrected>]

 For the same fixed data, the stronger bound
#[#set math.equation(numbering: n => "(1.4)")
 $ "ch"_3^(B_0 + b H) \( E \) lt.eq a^2 / 6 H^2 "ch"_1^(B_0 + b H) \( E \) $ <eq:intro-tail>]

 holds whenever $a > R_(*)$, for every $b in bb(R)$.]
] <thm:uniform-inequality>

There is no canonical-bundle hypothesis in this theorem. Both constants are independent of the rank and Chern
  character of $E$. The curve class $Gamma = k H^2 in N_1 \( X \)_(bb(Q))$ gives the correction $Gamma dot.op
  "ch"_1^(B_0 + b H) \( E \)$ and satisfies $Gamma dot.op H gt.eq 0$.

Bernardara–Macrì–Schmidt–Zhao proved a corrected inequality of this kind for Fano threefolds polarized by a
  divisor proportional to $- K_X$, and asked for such a curve-class correction on every polarized threefold
  #cite(label("BMSZ2017")) Theorem 1.1 and Question 2.4. Martinez–Schmidt stated the version allowing a fixed
  rational transverse twist #cite(label("MartinezSchmidt2019")) Question 2.6.
  Theorem 2 answers these corrected-inequality questions affirmatively and also gives a volume threshold beyond
  which the correction can be removed.

The uncorrected inequality at every parameter is false. Schmidt’s blow-up example #cite(label("Schmidt2017"))
  Theorem 3.1 and the contracted-divisor and Weierstrass examples of Martinez–Schmidt
  #cite(label("MartinezSchmidt2019")) Theorem 1.1 give explicit violations.
  Section 8 computes their bounded volume ranges and proves a uniform bound for semistable sheaves of arbitrary
  rank on the reduced exceptional surface. These comparisons retain both parts of Theorem 2:
  the corrected all-volume statement and the uncorrected tail.

The physical volume and the tilt variable satisfy $t = sqrt(3) a$.
  Consequently the strong bound (1.4) has coefficient $t^2 \/ 18$,
  whereas positivity of the ordinary charge (1.1) on zero-slope objects supplies the weaker coefficient $t^2 \/
  2$. The proof of the strong inequality is independent of the construction of the charges and their full
  numerical support.

The uncorrected tail also gives an all-slope quadratic formulation. For $v = \( v_0 \, v_1 \, v_2 \, v_3 \)$ define

#[#set math.equation(numbering: n => "(1.5)")
 $ Q_(alpha \, beta) \( v \) = alpha \( v_1^2 - 2 v_0 v_2 \) + beta \( 3 v_0 v_3 - v_1 v_2 \) + 2 v_2^2 -
   3 v_1 v_3 . $ <eq:intro-quadratic>]

#thm([Corollary 1.3.])[
  (A parabolic region with trivial correction).  #emph[For every polarized smooth projective threefold
    $\( X \, H \)$ there is $R_(*) > 0$ such that, if
$ alpha > f \( beta \) := frac(beta^2 + R_(*)^2, 2) \, $

 then $Q_(alpha \, beta) \( v_H \( E \) \) gt.eq 0$ for every nonzero semistable object in $cal(B)_(H \, beta H)$
   for the slope
$ frac(v_2 - beta v_1 + \( beta^2 - alpha \) v_0, v_1 - beta v_0) \, wide
  v_H \( E \) = \( H^3 "ch"_0 \( E \) \, H^2 "ch"_1 \( E \) \, H "ch"_2 \( E \) \, "ch"_3 \( E \) \) \, $

 again interpreted as $+ oo$ at zero denominator.]
] <cor:quadratic-tail>

The function $f$ is continuous. This is the generalized quadratic formulation with trivial correction:
  $v_H$ uses the ordinary, unmodified Chern character. The slope in the corollary is exactly (1.2) with $a =
  sqrt(2 alpha - beta^2)$ and $b = beta$; Section 7 proves the all-slope implication, including zero denominator.

=== 1.3 Previous constructions <previous-constructions>

General existence of stability conditions on projective varieties is supplied by Li’s
  construction #cite(label("Li2026")) and the framework of
  Li–Liu–Liu–Macrì–Perry–Stellari–Zhao #cite(label("LiEtAl2026")).
  Cheng establishes full numerical support and general nonemptiness in #cite(label("Cheng2026")).
  Thus nonemptiness alone is already known in the setting of Theorem 1.
  Our construction uses the product, restriction and deformation methods of these works to prescribe the two
  charges and the real sector. The product-embedding route to full numerical support in Section 2 adapts the
  construction of Giovenzana–Robotis–Rota–Zuliani #cite(label("GiovenzanaRobotisRotaZuliani2026")),
  distinct from the quantitative product inputs cited there.

There is also a preceding large-volume construction with a different character.
  Cheng–Feyzbakhsh identify a large-volume double-tilt heart for the character $"td" \( N_(X \/ bb(P)^n) \)^(- 1)
  "ch"$, where $N_(X \/ bb(P)^n)$ is the normal bundle of their projective embedding
  #cite(label("ChengFeyzbakhsh2026")) Section 3. A reparameterization expresses that heart as an ordinary double
  tilt while leaving a curve-class correction in its charge.
  The real-parameter extension discussed in their Section 3.3 follows from #cite(label("LiEtAl2026")) Theorem 4.1,
  Proposition 4.5 and Theorem 6.2. Combining the mass–Hom estimate #cite(label("LiEtAl2026")) Theorem 7.5 with
  Cheng’s full-support criterion #cite(label("Cheng2026")) Theorem 2.1 gives full numerical support for this
  fixed-polarization real family, pointwise in its parameters.
  Theorem 1 prescribes the ordinary and square-root-Todd charges on an open set of real twists and ample
  directions with one volume threshold. Its heart comparison adapts the surface-section method of Cheng–Feyzbakhsh
  to the ordinary character and positive weighted sections.

Restriction to lower-dimensional varieties has also led to strong tilt inequalities.
  Feyzbakhsh–Koseki–Liu–Rekuski derive a corrected tilt inequality from an improved sheaf Bogomolov–Gieseker
  bound, and obtain that bound on families of Calabi–Yau threefolds from Brill–Noether estimates on curves inside
  surface sections #cite(label("FeyzbakhshEtAl2025")) Theorems 1.1, 1.3 and 1.4.
  Our numerical argument likewise uses successive restrictions,
  but its input is a rank-uniform cohomology estimate on surfaces.
  A Frobenius limit then gives the inequality at one fixed positive volume on an arbitrary smooth projective
  threefold. The wall argument builds on the discriminant-descent method of #cite(label("BMSZ2017")) Lemma 2.7;
  the fixed-volume defect estimate is what makes its resulting threshold uniform in the twist and the object.

=== 1.4 Two independent proof strategies <two-independent-proof-strategies>

We prove the prescribed-charge theorem first, in Sections 2–3,
  and then establish the strong inequalities in Sections 4–7. Figure 1 shows the two arguments.
  Their distinction is mathematical: controlling four Chern-character degrees along one polarization does not
  itself control the full numerical group or provide a common threshold when the ample direction varies.

For the charge construction, choose very ample line bundles whose positive span contains the ample directions
  under consideration. They give an embedding $i : X arrow.r.hook Y$ into a product of projective spaces.
  In dimension three, products of divisor classes span all numerical Chern-character classes;
  choosing the line bundles to span $N^1 \( X \)_(bb(R))$ therefore makes $i_(*)$ injective on the numerical
  Grothendieck group. Ambient support will then control every numerical class on $X$.

The ambient construction must also permit a deformation which is uniform at large volume.
  Liu’s product-with-a-curve construction #cite(label("LiuProduct2021")),
  the positive-genus product theory of #cite(label("ProductsCurves2025")),
  the support induction of #cite(label("LiEtAl2026")), and Cheng’s two-block
  construction #cite(label("Cheng2026")) supply its starting framework.
  We prove a weighted support estimate for finitely many projective blocks after rescaling each Chern-character
  coordinate by its power of the volume. In these coordinates the support constant is independent of volume,
  and every fixed positive-degree correction to the exponential charge tends to zero as the volume grows.
  This permits the ambient deformation throughout an open set of twists and ample directions.
  A fixed polynomial correction cancels the Todd factors in Grothendieck–Riemann–Roch,
  so restriction gives exactly the chosen character on $X$.

This construction already gives full numerical support and stable point sheaves.
  For the ordinary charge, compatible restrictions to smooth surfaces identify its heart.
  The induced surface hearts control the outer cohomology sheaves;
  positive weights combine their slope bounds for a real ample direction.
  A separate argument at the real axis fixes the zero-slope boundary of the second tilt.
  The Todd-charge construction uses the geometric heart obtained by restriction.

The independent numerical proof is concentrated at one fixed volume $A$.
  For a slope-zero object $E$ at this volume, put $d = H^2 "ch"_1^B \( E \) \/ H^3$ and $r = "ch"_0 \( E \)$.
  The tilt discriminant inequality gives $d gt.eq A \| r \|$. We prove

$ frac("ch"_3^B \( E \), H^3) - frac(A^2 d, 6) lt.eq C \( d - A \| r \| \) $

with $C$ independent of $E$ and $b$. The error $e = d - A \| r \|$ can vanish even at large rank,
  so the estimates must remain proportional to this error without an additional rank term.
  Truncating the ordinary slope filtrations separates sheaf factors in a narrow slope interval from a residual
  complex whose rank and first two intersection degrees are bounded by $e$.
  Langer’s restriction inequality controls the resulting slope variance #cite(label("Langer2004"))
  #cite(label("Langer2004Addendum")). Hermitian–Einstein theory and the Bochner
  identity #cite(label("Donaldson1985")) #cite(label("UhlenbeckYau1986")) #cite(label("DemaillyCADG")),
  together with a matrix spectral estimate of Cwikel–Lieb–Rozenblum type #cite(label("Frank2014")),
  control the residual cohomology in terms of $e$. For each fixed object,
  we reduce finitely many sheaves and maps to positive characteristic.
  Frobenius pullback and Riemann–Roch turn the cohomology bounds into the displayed inequality on $X$;
  the errors depending on the chosen object vanish in the limit.
  Transport along zero-slope branches, with strict discriminant descent at walls,
  gives the corrected global bound and the uncorrected tail.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weighted ambient stability#linebreak()and support]]])])
  content((0, -1.7), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Exact charge deformation#linebreak()and restriction to $X$]]])])
  content((0, -3.4), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Full numerical support#linebreak()and stable points for both charges]]])])
  content((0, -5.1), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Ordinary charge: surface comparison#linebreak()and the double-tilt heart]]])])
  content((6.253, 0), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Rank-uniform restriction#linebreak()and cohomology]]])])
  content((0, 1.066), [#text(size: 9pt)[Prescribed charges: $K_X tilde.eq cal(O)_X$]])
  content((6.253, 1.066), [#text(size: 9pt)[Inequalities: arbitrary threefold]])
  content((6.253, -1.7), [#box(width: 4.753cm, height: 1cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Fixed-volume defect bound]]])])
  content((6.253, -3.4), [#box(width: 4.753cm, height: 1cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Wall transport]]])])
  content((6.253, -5.1), [#box(width: 4.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Corrected all-volume inequality#linebreak()and uncorrected tail]]])])
  line((0, -0.5), (0, -1.2), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -2.2), (0, -2.9), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -3.9), (0, -4.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.253, -0.5), (6.253, -1.2), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.253, -2.2), (6.253, -2.9), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.253, -3.9), (6.253, -4.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The independent categorical and numerical arguments. Full support is obtained in Section 2, before the ordinary-heart comparison in Section 3. The numerical argument begins with the tilt tools of Section 4 and proves the inequalities in Sections 5–7. The relation $t = sqrt(3) a$ compares volume conventions. ],
) <fig:proof>

For the numerical argument, Section 4 supplies the circle and duality tools,
  Sections 5 and 6 establish the fixed-volume bound, and Section 7 proves Theorem 2 and Corollary 3.
  Section 8 compares the inequalities with counterexamples and bounds arbitrary-rank sheaves on reduced
  exceptional surfaces.

== 2 Prescribed charges on the full numerical lattice <sec:ambient>

We begin the proof of Theorem 1 by constructing both prescribed charges with full numerical support.
  This argument is independent of the strong tilt inequalities.
  Throughout the section, $X$ is a smooth projective complex threefold with $K_X tilde.eq cal(O)_X$.

The construction takes place first on a product of projective spaces.
  We choose an embedding that retains every numerical class of $X$,
  prove a support estimate adapted to increasing volume on the product,
  and use that estimate to deform its charge. A fixed polynomial correction then makes Grothendieck–Riemann–Roch
  restrict the deformed charge to the chosen charge on $X$.
  The same construction on smooth surface sections will later identify the ordinary heart.
  We use numerical Grothendieck groups in the Euler-pairing sense:

$ K_(upright("num")) \( X \) = K_0 \( X \) \/ { v : chi \( v \, u \) = 0 upright(" for every ") u in K_0 \( X \) } . $

The left and right radicals coincide by Serre duality, so either side of the Euler pairing may be used in the
  adjunction argument below. All real vector spaces associated with these groups are finite-dimensional.
  We use Bridgeland’s stability conditions and locally finite slicings #cite(label("Bridgeland2007")).
  A stability condition has #emph[full numerical support] if, for a norm on $K_(upright("num")) \( X \)_(bb(R))$,
  there is a constant $C$ such that $parallel \[ E \] parallel lt.eq
  C \| Z \( E \) \|$ for every semistable object $E$. The constant may depend on the stability condition.
  This is equivalent to the quadratic-form definition #cite(label("BayerDeformation2019")) Definition 1.1:
  one may take $C^2 \| Z \( v \) \|^2 - parallel v parallel^2$, which is negative definite on $ker Z$.

=== 2.1 An embedding which retains every numerical class <an-embedding-which-retains-every-numerical-class>

The product-projective embedding and full-support construction here adapt the approach of
  Giovenzana–Robotis–Rota–Zuliani #cite(label("GiovenzanaRobotisRotaZuliani2026")).
  The numerical injectivity argument is given below; the quantitative product inputs and the prescribed-charge,
  real-sector refinements are treated separately in the subsequent subsections.

#thm([Lemma 2.1.])[
  #emph[Let $X$ be a smooth projective threefold. Rational Chern characters identify its numerical Grothendieck
    group with
#[#set math.equation(numbering: n => "(2.1)")
 $ K_(upright("num")) \( X \)_(bb(Q)) tilde.eq bb(Q) xor N^1 \( X \)_(bb(Q)) xor N_1 \( X \)_(bb(Q)) xor bb(Q) .
   $ <eq:full-numerical-lattice>]

 Products of numerical divisor classes span this space. Given a real ample class $H_(*)$,
   there are very ample line bundles $L_1 \, dots.h \, L_q$ whose classes form a basis of $N^1 \( X \)_(bb(R))$
   and positive numbers $s_1 \, dots.h \, s_q$ with $H_(*) = sum_h s_h L_h$. For the product embedding
#[#set math.equation(numbering: n => "(2.2)")
 $ i : X arrow.r.hook Y = product_(h = 1)^q bb(P)^(d_h) \, wide d_h = h^0 \( X \, L_h \) - 1 \,
   $ <eq:product-embedding>]

 the pushforward $i_(*) : K_(upright("num")) \( X \)_(bb(R)) arrow.r K_(upright("num")) \( Y \)_(bb(R))$ is injective.]
] <lem:full-numerical-embedding>

#proof[
  The rational Chern character identifies the Grothendieck group with the rational Chow group
    #cite(label("StacksProject")) Tags 0FDI, 0FEW, 0FB2 and 0FB5.
    In Riemann–Roch the Euler pairing is the intersection pairing after applying the invertible operations of
    dualizing a class and multiplying it by $"td" \( X \)$. Its radical therefore gives precisely the numerical
    quotient of the Chow group. In dimensions zero and three this quotient is $bb(Q)$;
    in the other two dimensions it is the divisor–curve pairing in (2.1).
  For a rational ample class $A$, the Hodge index theorem makes $\( D \, D' \) mapsto A D
    D'$ nondegenerate on $N^1 \( X \)_(bb(Q))$; see #cite(label("GrebRossToma2016")) Theorem 6.4 and Corollary 6.5
    for its real-ample formulation. The divisor–curve pairing is nondegenerate by numerical equivalence,
    so multiplication by $A$ is an isomorphism $N^1 \( X \)_(bb(Q)) arrow.r N_1 \( X \)_(bb(Q))$.
    Divisors, their products with $A$, and $A^3$ consequently span every summand of (2.1).
  Choose an affine slice transverse to the ray of $H_(*)$ and a rational simplex in its ample cone whose interior
    contains that ray. Its $q = rho \( X \)$ vertices are linearly independent.
    Taking sufficiently large integral multiples makes them very ample without changing their positive cone.
    This also explains the rank-one case, where a single very ample class suffices.
  Pushforward is defined on numerical groups by adjunction with perfect complexes.
    If $i_(*) v = 0$ numerically, the projection formula gives
  $ chi \( i^(*) W \, v \) = chi \( W \, i_(*) v \) = 0 wide \( W in K_0 \( Y \) \) . $
  Chern characters of line bundles on $Y$ span its polynomial Chow ring, and their restrictions span (2.1).
    Nondegeneracy of the Euler pairing gives $v = 0$. The spanning argument here uses dimension three;
    it makes no analogous claim in arbitrary dimension. ◻
]

=== 2.2 Scaled support on elliptic products <scaled-support-on-elliptic-products>

The next estimate is the quantitative reason that the ambient charge can be corrected uniformly at large volume.
  Its coordinates rescale a codimension-$j$ character by the expected power $R^(n - j)$.
  In these coordinates a fixed positive-codimension correction of the exponential charge will tend to zero as $R
  arrow.r oo$. A support bound independent of $R$ then turns this coordinate estimate into a bound on every
  semistable object.

We first establish the support bound on an elliptic product.
  The product construction and the uniqueness needed to compare its different orders of induction are external
  inputs. The estimate below makes their volume scaling explicit.

#thm([Lemma 2.2.])[
  (Scaled support on an elliptic product).  #emph[Let $C$ be an elliptic curve, let $n gt.eq 1$,
    and fix positive rational numbers $rho_1 \, dots.h \, rho_n$.
    For rational $R gt.eq 1$, put $w_r = R rho_r$ and let $H_r$ be the point-divisor class from the $r$th factor
    of $C^n$. The product stability condition with charge
$ Z_(upright(bold(w))) \( u \) = - integral_(C^n) e^(- i sum_r w_r H_r) "ch" \( u \) $

 has support on the coordinate lattice
$ x_I \( u \) = H_I "ch"_(n - \| I \|) \( u \) \, wide H_I = product_(r in I) H_r \, wide I subset { 1 \,
  dots.h \, n } . $

 More precisely, set $y_I = \( product_(r in I) w_r \) x_I$. In these coordinates,
$ Z_(upright(bold(w))) \( u \) = hat(Z)_n \( y \( u \) \) \, wide hat(Z)_n \( y \) = - sum_I \( - i \)^(\| I \|) y_I . $

 For a fixed Euclidean norm there is $C_n > 0$, independent of $R$, such that
$ parallel y \( u \) parallel lt.eq C_n \| Z_(upright(bold(w))) \( u \) \|
  wide \( u upright(" the class of a semistable object") \) . $

 The constants can be chosen uniformly when the positive ratios $rho_r$ vary in a compact set.
   Point sheaves are stable of phase $1$.]
] <lem:elliptic-scaled-support>

#proof[
  We use the product-with-a-curve construction of #cite(label("LiuProduct2021")) Lemma 5.7 and Remark 5.8,
    the positive-genus product construction of #cite(label("ProductsCurves2025")) Theorem 4.5,
    and the support induction of #cite(label("LiEtAl2026")) Lemma 6.6.
    For $n = 1$, the usual slope stability on $C$ has charge $- x_diameter +
    i w_1 x_({ 1 })$ and the assertion is immediate.
  Suppose that the scaled support bound has been proved in dimension $n - 1$.
    Omitting factor $r$ splits the coordinates into $x' \, x''$, where $x'$ consists of those containing $r$,
    with that index removed. The product construction has charge
  $ Z_(n - 1) \( x'' \) - i w_r Z_(n - 1) \( x' \) . $
  It initially gives support with respect to its own quotient lattice.
    Every choice of omitted factor gives the same exponential charge and the same phase $1$ for point sheaves.
    The uniqueness theorem #cite(label("ProductsCurves2025")) Theorem 3.11 therefore identifies the slicings:
    that theorem permits the two support lattices to differ. We may consequently test all the product support
    forms on the same semistable objects, before proving support on the full coordinate lattice.
  Write $M_(hat(r))$ for scaling the remaining coordinates by their products of weights. The scaled coordinates split as
  $ y' = w_r M_(hat(r)) x' \, wide y'' = M_(hat(r)) x'' . $
  The lower-dimensional charge in scaled coordinates is a fixed linear map $hat(Z)$.
    Increase its support constant $C_(n - 1)$ if needed and choose the support form
  #[#set math.equation(numbering: n => "(2.3)")
   $ q_(n - 1) \( v \) = C_(n - 1)^2 \| hat(Z) \( v \) \|^2 - parallel v parallel^2 . $ <eq:elliptic-support-form>]
  It is nonnegative on lower-dimensional semistable classes. Crucially,
  $ q_(n - 1) \( v \) lt.eq C_(n - 1)^2 \| hat(Z) \( v \) \|^2 quad upright("for every ") v \, $
  not merely for semistable classes. This is the norm form used in the product support estimate.
  For clarity, that estimate has the following coefficient condition.
    Write $Z_(n - 1) \( x' \) = alpha + i beta$ and $Z_(n - 1) \( x'' \) = gamma + i delta$.
    With equal positive product parameters $s = t = w_r$, the form
  $ beta gamma - alpha delta + eta_r q_(n - 1) \( M_(hat(r)) x' \) $
  is nonnegative on product-semistable classes when $0 lt.eq eta_r lt.eq
    w_r \/ C_(n - 1)^2$ #cite(label("LiuProduct2021")) Lemma 5.7;
    this is the substitution in #cite(label("LiEtAl2026")) Lemma 6.6.
    Choose $0 < lambda_r < C_(n - 1)^(- 2)$, independently of $R$, and put $eta_r = lambda_r w_r$. If
  $ hat(Z) \( y' \) = hat(alpha) + i hat(beta) \, wide hat(Z) \( y'' \) = hat(gamma) + i hat(delta) \, $
  then multiplication of the product form by $w_r$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ q_r \( y \) = hat(beta) hat(gamma) - hat(alpha) hat(delta) +
     lambda_r q_(n - 1) \( y' \) . $ <eq:weighted-product-form>]
  All powers of $R$ have disappeared. This form is nonnegative on the common semistable objects just constructed.
  The total charge in these coordinates is $\( hat(gamma) + hat(beta) \) + i \( hat(delta) - hat(alpha) \)$.
    On its kernel,
  $ q_r \( y \) = - \| hat(Z) \( y' \) \|^2 + lambda_r q_(n - 1) \( y' \) = \( lambda_r C_(n - 1)^2 - 1 \) \|
    hat(Z) \( y' \) \|^2 - lambda_r parallel y' parallel^2 . $
  It is nonpositive there, and vanishes only when $y' = 0$;
    the kernel condition then also gives $hat(Z) \( y'' \) = 0$. Sum (2.4) over all omitted factors.
    If the sum vanishes on the total charge kernel, then $y' = 0$ for every factor.
    This kills every coordinate with $I eq.not diameter$, and the charge kills the remaining top-degree
    coordinate. The summed form is thus negative definite on the charge kernel and nonnegative on semistables.
    Compactness on the unit sphere of its nonnegative cone gives $parallel y \( u \) parallel lt.eq
    C_n \| Z_(upright(bold(w))) \( u \) \|$ for every semistable class $u$.
    The forms and all choices were made in the scaled coordinates.
    In particular they are independent of $R$ and can be kept uniform on compact sets of positive ratios.
    This completes the support induction. The geometricity assertion is part of the positive-genus product
    construction; see also #cite(label("LiEtAl2026")) Theorem 4.1(1). ◻
]

=== 2.3 Transfer to projective blocks <transfer-to-projective-blocks>

For a slicing $cal(R)$, denote the largest and smallest Harder–Narasimhan phases of a nonzero object by
  $phi.alt_(cal(R))^(+)$ and $phi.alt_(cal(R))^(-)$. We use the distance

$ d \( cal(R) \, cal(R)' \) = sup_(E eq.not 0) max { \| phi.alt_(cal(R))^(+) \( E \) -
  phi.alt_(cal(R)')^(+) \( E \) \| \, \| phi.alt_(cal(R))^(-) \( E \) - phi.alt_(cal(R)')^(-) \( E \) \| } . $

For a line bundle $L$ and an integer $k$, we say that $cal(R)$ has the #emph[Bayer property] for $\( L \, k \)$ if
  $F ⊗ L \[ k \]$ has all phases at least $phi.alt$ whenever $F in cal(R) \( phi.alt \)$.
  We will use both a support bound and a small phase change under each fixed line-bundle twist.
  They are inherited from an elliptic product through finite quotients.

#thm([Proposition 2.3.])[
  #emph[Let $Y = product_(h = 1)^q bb(P)^(d_h)$, put $xi_h = c_1 \( cal(O)_h \( 1 \) \)$, and fix $s_h > 0$.
    There is a continuous family of numerical stability conditions $\( U_R \, cal(R)_R \)$ for $R gt.eq 1$ with
$ U_R \( u \) = - integral_Y e^(- i R sum_h s_h xi_h) "ch" \( u \) . $

 All point sheaves are stable of phase $1$. Write $"ch" \( u \) =
   sum_(upright(bold(j))) u_(upright(bold(j))) xi^(upright(bold(j)))$, where $0 lt.eq j_h lt.eq d_h$, and set
#[#set math.equation(numbering: n => "(2.5)")
 $ \( M_R u \)_(upright(bold(j))) = u_(upright(bold(j))) product_h \( R s_h \)^(d_h - j_h) .
   $ <eq:ambient-scaled-coordinates>]

 For a fixed Euclidean norm there is $D > 0$, independent of $R$, such that
#[#set math.equation(numbering: n => "(2.6)")
 $ parallel M_R u parallel lt.eq
   D \| U_R \( u \) \| wide \( u upright(" the class of an ") cal(R)_R upright("-semistable object") \) .
   $ <eq:ambient-support>]

 For every $upright(bold(e)) in bb(Z)^q$,
#[#set math.equation(numbering: n => "(2.7)")
 $ d \( cal(R)_R \, cal(R)_R ⊗ cal(O)_Y \( upright(bold(e)) \) \) lt.eq
   sum_h frac(d_h \| e_h \|, pi R s_h) . $ <eq:ambient-twist-distance>]

]
] <prop:weighted-ambient>

#proof[
  Cheng proves the two-block construction and phase estimate in #cite(label("Cheng2026")) Proposition 4.3 and
    Remark 4.4. We apply the same quotient construction block by block,
    using Lemma 5 to control all coordinates uniformly in the volume.
  First take $R$ and the positive weights $s_h$ rational. Put $n =
    sum_h d_h$ and give each of the $d_h$ elliptic factors in block $h$ the weight $w_r = 2 R s_h$.
    The lemma supplies the starting stability condition and its scaled support bound.
    Only the coordinate lattice of the elliptic power is used here;
    full numerical support will follow on $Y$ from the explicit pullback calculation below.
  First apply #cite(label("LiEtAl2026")) Proposition 5.1 to the stability condition just constructed on the
    coordinate lattice. It supplies the descent by $\( bb(Z) \/ 2 \)^n$ to $\( bb(P)^1 \)^n$ and the Bayer
    property with $k = 0$ for every effective line bundle $cal(O) \( a_1 \, dots.h \, a_n \)$, with all $a_r gt.eq
    0$. We then take the symmetric quotients one block at a time.
  Here is the filtration used at a symmetric step. For $Q = \( bb(P)^1 \)^d arrow.r bb(P)^d$,
    there is a finite filtration of $cal(O)_(Q times_(bb(P)^d) Q)$ whose successive quotients are
  $ p_2^(*) cal(L)_j^(- 1) ⊗ cal(O)_(Gamma \( g_j \)) \, wide g_j in S_d \, wide cal(L)_j =
    cal(O) \( a_(j 1) \, dots.h \, a_(j d) \) \, quad a_(j r) gt.eq 0 \, $
  where $p_2$ is the second projection and $Gamma \( g_j \)$ is the graph of the permutation $g_j$
    #cite(label("LiEtAl2026")) Definition 3.19 and Example 3.20(3).
    At a block stage the map is $f : Q times M arrow.r bb(P)^d times M$,
    where $M$ is the product of the other blocks, and its fiber square is $\( Q times_(bb(P)^d) Q \) times M$.
    Flat pullback to this product preserves the filtration and its exact sequences.
    Its graph automorphisms are $g_j times "id"_M$, and its line bundles remain pulled back from $Q$.
  The finite-flat descent criterion #cite(label("LiEtAl2026")) Proposition 3.21 therefore requires precisely
    invariance under these permutations and the Bayer properties with $k = 0$ for these effective line bundles.
    Indeed, for a phase-$phi.alt$ object $F$, the factors of $f^(*) f_(*) F$ are $cal(L)_j^(- 1) ⊗ g_(j *) F$;
    the two properties put their largest phases at most $phi.alt$.
    On the elliptic product, signs and permutations within each equal-weight block preserve the charge and point
    phases, so the uniqueness theorem used above gives their invariance.
    Block permutations normalize the full sign group; their invariance descends through the completed involution
    quotient. For subsequent block quotients, the required properties pass to the remaining blocks as follows
    #cite(label("LiEtAl2026")) Lemma 3.9 and Remark 3.14(3). At each quotient $f : V arrow.r V'$,
    pullback computes extremal phases for the induced slicing $cal(S)' = f_(\#) cal(S)$.
    If a line bundle $L$ comes from an unquotiented block, then
  $ phi.alt_(cal(S)')^(-) \( F ⊗ L \[ k \] \) = phi.alt_(cal(S))^(-) \( f^(*) F ⊗ f^(*) L \[ k \] \) . $
  The Bayer property for $f^(*) L$ therefore descends to $L$.
    An automorphism of another block commutes with $f$, so its invariance descends by the same pullback
    description. Thus every remaining quotient has the required Bayer properties and invariance,
    for any finite number of blocks.
  For completeness, let $g$ be the resulting map from the elliptic power to $Y$. Pullback satisfies
  $ g^(*) xi_h^(j_h) = 2^(j_h) j_h ! sum_(\| J_h \| = j_h) H_(J_h) \, wide deg g = 2^n product_h d_h ! . $
  If $\| I ∩ upright("block ") h \| = d_h - j_h$, then the scaled $I$-coordinate of $g^(*) u$ is
  #[#set math.equation(numbering: n => "(2.8)")
   $ #scale(x: 180%, y: 180%)[\(] product_(r in I) w_r #scale(x: 180%, y: 180%)[\)] H_I
     "ch"_(n - \| I \|) \( g^(*) u \) = 2^n #scale(x: 180%, y: 180%)[\(] product_h j_h !
     #scale(x: 180%, y: 180%)[\)] \( M_R u \)_(upright(bold(j))) . $ <eq:block-coordinate-comparison>]
  The fixed multiplicities are $product_h binom(d_h, j_h)$.
    Pullback is thus injective on the complete Chern-character lattice of $Y$,
    with norm comparison constants independent of $R$. Semistability pulls back,
    and $Z_(upright(bold(w))) \( g^(*) u \) = deg \( g \) U_R \( u \)$. This proves (2.6).
  For the phase estimate, vary the real tensor parameter on each elliptic factor successively.
    The one-factor argument in the proof of #cite(label("ChengFeyzbakhsh2026")) Theorem 2.4,
    used in #cite(label("Cheng2026")) Remark 4.4, gives its absolute variation divided by $pi w_r$.
    A twist $e_h xi_h$ pulls back with coefficient $2 e_h$ on the $d_h$ factors in block $h$;
    its factor $2$ cancels the factor $2$ in $w_r$. Adding the variations gives (2.7).
    Finally the deformation and multiplication-isogeny argument in the proof of #cite(label("Cheng2026"))
    Proposition 4.3 extends the rational-weight construction continuously to positive real weights.
    It applies factor by factor: the scaled support forms just constructed remain fixed on compact positive weight
    sets, the exponential charges vary continuously, and uniqueness on overlapping deformation neighborhoods
    identifies the lifts. The closed support inequalities and the phase bounds persist.
    This also extends $R$ to all real $R gt.eq 1$. Point stability in this extension follows separately from
    #cite(label("LiEtAl2026")) Theorem 4.1(1) on the elliptic power and preservation of geometricity under finite
    pushforward #cite(label("LiEtAl2026")) Remark 3.11. Concretely, for the finite faithfully flat quotient $g$,
    the sheaf $g^(*) cal(O)_y$ has a finite filtration by point sheaves, all stable of phase $1$.
    A phase-one subobject and quotient of $cal(O)_y$ pull back to objects whose Jordan–Hölder factors are among
    these points, so both pullbacks are coherent finite-length sheaves.
    Faithful flatness descends this cohomological concentration.
    The original subobject and quotient are therefore sheaves,
    and simplicity of $cal(O)_y$ rules out a proper nonzero subobject.
    Continuity and the charge value $- 1$ normalize the point phase to $1$. ◻
]

=== 2.4 Geometric slicings and the restriction criterion <geometric-slicings-and-the-restriction-criterion>

We now prepare the restriction step. The first consequence of point stability below gives the cohomological bounds
  needed for a truncated resolution. The second will keep points stable during deformation in all ambient charges.
  Both will also be used to identify the induced heart. Write $cal(R) \( I \)$ for the extension-closed category
  generated by semistable objects with phases in an interval $I$.

#thm([Lemma 2.4.])[
  (Cohomological bounds from points).  #emph[Let $V$ be a smooth projective variety of dimension $n gt.eq 2$,
    and let $cal(R)$ be a locally finite slicing in which every point sheaf is stable of phase $1$. Then
#[#set math.equation(numbering: n => "(2.9)")
 $ cal(R) \( 0 \, 1 \] & subset D^(\[ - n + 1 \, 0 \]) \( V \) \, & "Coh" \( V \) & subset cal(R) \( 1 - n \, 1 \] \,\
D^(lt.eq - n) \( V \) & subset cal(R) \( > 0 \) \, & cal(R) \( > 0 \) & subset D^(lt.eq 0) \( V \) .
  $ <eq:geometric-range>]

 The sheaf $cal(H)^(- n + 1) \( E \)$ is torsion-free for $E in cal(R) \( 0 \, 1 \]$.
   Moreover, $cal(H)^0 \( E \)$ is zero-dimensional for $E in cal(R) \( 1 \)$.]
] <lem:geometric-range>

#proof[
  This is the point-object argument of #cite(label("BridgelandK3")) Lemma 10.1;
    we include it to specify the dimension and boundary statements being used.
    Let $E$ be stable with phase $0 < phi.alt lt.eq 1$ and not a point of phase $1$.
    Phase vanishing gives $"Hom" \( E \, cal(O)_x \[ j \] \) = 0$ for $j < 0$.
    For $j gt.eq n$, Serre duality identifies this space with $"Hom" \( cal(O)_x \, E \[ n - j \] \)^(*)$,
    which is zero by phases. At $j = n \, phi.alt = 1$, use nonisomorphism of the two stable objects.
    The canonical bundle causes no change, since its restriction to a point is trivial.
    A minimal free complex at each closed point consequently has nonzero terms only in degrees
    $\[ - n + 1 \, 0 \]$. Its bottom cohomology is a subsheaf of a locally free sheaf and hence is torsion-free.
    At phase $1$ we also have $"Hom" \( E \, cal(O)_x \) = 0$ for every $x$, so $cal(H)^0 \( E \) = 0$.
    Point sheaves themselves satisfy the stated cohomological bounds.
    Finite Jordan–Hölder filtrations and extensions give these assertions for the whole heart;
    in phase $1$ its zeroth cohomology is an extension of sheaves supported at finitely many points.
  A coherent sheaf cannot receive a nonzero morphism from an object whose phase is greater than $1$,
    by the cohomological bound just proved and a shift. It cannot map nontrivially to an object of phase at most
    $1 - n$: such an object is in $D^(gt.eq 1)$, including the endpoint by the phase-one observation.
    Applied to its extreme Harder–Narasimhan factors, these vanishings prove $"Coh" \( V \) subset
    cal(R) \( 1 - n \, 1 \]$. Shifting this inclusion and the heart bound proves (2.9). ◻
]

#thm([Lemma 2.5.])[
  (Stability from an open set of charges).  #emph[Let a stability condition have support on a finite-rank lattice
    $Lambda$. Suppose that an object $E$ has primitive class in $Lambda$ and remains semistable throughout a
    neighborhood which is open in all central charges $"Hom" \( Lambda \, bb(C) \)$. Then $E$ is stable.]
] <lem:primitive-point>

#proof[
  If $E$ is strictly semistable, take a first stable subobject $G$ in a finite Jordan–Hölder filtration.
    Its class cannot be real proportional to $\[ E \]$. Indeed their aligned charges would make $\[ G \] =
    c \[ E \]$ with $0 < c < 1$, whereas primitivity makes an integral class on this line an integral multiple of
    $\[ E \]$. Choose a phase-window heart of length one centered at their common phase.
    The triangle $G arrow.r E arrow.r E \/ G$ remains a short exact sequence in this heart for small deformations:
    all three objects stay strictly inside its phase window. An independent small perturbation of the two charge
    values makes the phase of $G$ greater than that of $E$. This contradicts the assumed semistability of $E$ in
    the entire neighborhood. ◻
]

Here is the precise restriction input. Let $f : V arrow.r Y$ be a finite map.
  For the truncated cofiltrations used below, the data consist of a finite tower in $D^(upright(b)) \( Y \)$

$ E_0 = f_(*) cal(O)_V arrow.r E_1 arrow.r dots.h.c arrow.r E_N $

and distinguished triangles

$ P_j arrow.r E_j arrow.r E_(j + 1) arrow.r P_j \[ 1 \] \, wide 0 lt.eq j < N . $

Each $P_j$ is a finite direct sum of specified line bundles with specified shifts $L_i \[ k_i \]$,
  and the remainder satisfies $E_N in D^(lt.eq - N) \( Y \)$.
  Thus the successive cones of the tower are $P_j \[ 1 \]$; equivalently,
  $f_(*) cal(O)_V$ is built by extensions from the $P_j$ and the remainder.
  For a truncated resolution, $P_j$ is its $j$th sheaf term shifted by $\[ j \]$ and $E_N$ is the last kernel
  shifted by $\[ N \]$. The finite-map restriction criterion #cite(label("LiEtAl2026")) Proposition 3.24,
  extending #cite(label("Polishchuk2007")) Corollary 2.2.2, applies to $f$ with this cofiltration. It requires

#[#set math.equation(numbering: n => "(2.10)")
 $ upright("the Bayer properties for every ") \( L_i \, k_i \) \,\
D^(lt.eq n_1) \( Y \) subset cal(R) \( > 0 \) subset D^(lt.eq n_2) \( Y \) \, wide N gt.eq n_2 - n_1 +
  1 . $ <eq:restriction-hypotheses>]

An untruncated cofiltration has no last numerical requirement. All tensor products in this criterion are derived.
  The conclusion is a slicing

#[#set math.equation(numbering: n => "(2.11)")
 $ f^sharp cal(R) \( phi.alt \) = { F in D^(upright(b)) \( V \) : f_(*) F in cal(R) \( phi.alt \) } \,
   $ <eq:induced-slicing>]

with charge $U compose f_(*)$ and support on the ambient lattice through $f_(*)$.
  In particular it provides the required Harder–Narasimhan filtrations.
  No surjectivity assumption is imposed on $f$. Smoothness makes the bounded finite-Tor-dimension formulation
  applicable here. We shall verify the cofiltration and every bound in (2.10) before using the criterion.

=== 2.5 Correcting the charge before restriction <correcting-the-charge-before-restriction>

Fix real classes $B_(*) \, H_(*)$ with $H_(*)$ ample, and choose the embedding in Lemma 4.
  We write $L_h$ also for its first Chern class, so $i^(*) xi_h = L_h$ and $H_(*) = sum_h s_h L_h$ with $s_h > 0$.
  Consider separately the factors

#[#set math.equation(numbering: n => "(2.12)")
 $ Theta = 1 wide upright("and") wide Theta = sqrt("td" \( X \)) = 1 +
   frac(c_2 \( X \), 24) . $ <eq:two-character-factors>]

The assumption on the canonical bundle gives $"td" \( X \) = 1 +
  c_2 \( X \) \/ 12$ in the degrees relevant on $X$. By Lemma 4,
  choose a degree-two polynomial $delta$ in the $xi_h$ with $i^(*) delta = c_2 \( X \)$ numerically.
  A suitable polynomial on $Y$ with constant term one is

$ gamma =
  cases(delim: "{", "td" \( Y \) \( 1 - delta \/ 12 \) \, & Theta = 1 \,, "td" \( Y \) \( 1 - delta \/ 24 \) \, &
  Theta = sqrt("td" \( X \)) .) $

Products are taken in the finite-dimensional numerical Chow ring. Thus

#[#set math.equation(numbering: n => "(2.13)")
 $ i^(*) #scale(x: 120%, y: 120%)[\(] gamma \/ "td" \( Y \) #scale(x: 120%, y: 120%)[\)] "td" \( X \) =
   Theta . $ <eq:gamma-lift>]

In particular the two choices remove different Todd contributions.

Write $B = sum_h b_h L_h$ and $H = sum_h ell_h L_h$. Deform the ambient charge to

#[#set math.equation(numbering: n => "(2.14)")
 $ U_t^(B \, H) \( u \) = - integral_Y e^(- sum_h b_h xi_h - i t sum_h ell_h xi_h) "ch" \( u \) gamma .
   $ <eq:deformed-ambient-charge>]

Grothendieck–Riemann–Roch and (2.13) give the exact identity

#[#set math.equation(numbering: n => "(2.15)")
 $ U_t^(B \, H) \( i_(*) E \) = - integral_X e^(- B - i t H) "ch" \( E \) Theta . $ <eq:exact-restricted-charge>]

Numerical equality in (2.13) suffices because only intersection degrees occur.
  For $Theta = 1$ this is exactly $Z_(B \, t H)$; for the other choice it is exactly $Z_(B \, t H)^(upright("LV"))$.

#thm([Lemma 2.6.])[
  #emph[For every $0 < epsilon.alt < 1 \/ 8$, there are open neighborhoods $V in.rev B_(*)$ and $W in.rev
    H_(*)$ in the real divisor and ample spaces, and $T gt.eq 1$, such that for all $B in V$, $H in W$,
    and $t gt.eq T$, the charge (2.14) lifts to a stability condition with slicing at distance less than
    $epsilon.alt$ from $cal(R)_t$. The construction is available in an open neighborhood of that charge in the
    full space $"Hom" \( K_(upright("num")) \( Y \) \, bb(C) \)$.]
] <lem:uniform-ambient-deformation>

#proof[
  Take $V$ bounded in the $b_h$ coordinates, and restrict $W$ by $\| ell_h \/ s_h - 1 \| < eta$.
    In the scaled coordinates (2.5), expansion of the two exponentials gives
  #[#set math.equation(numbering: n => "(2.16)")
   $ parallel \( U_t^(B \, H) - U_t \) compose M_t^(- 1) #scale(x: 120%, y: 120%)[parallel] lt.eq C_1 eta +
     C_2 t^(- 1) . $ <eq:uniform-deformation-estimate>]
  To see the uniformity, the coefficient of $u_(upright(bold(j)))$ in the uncorrected exponential has degree
    $n - \| upright(bold(j)) \|$ in $t$. Varying the positive coefficients $s_h$ to $ell_h$ changes its ratio to
    the weight of $M_t$ by $O \( eta \)$. A codimension-$d > 0$ term of $e^(- sum b_h xi_h) gamma -
    1$ lowers that degree by $d$ and hence contributes $O \( t^(- d) \)$.
    There are finitely many monomials, and their coefficients are bounded on the chosen neighborhoods.
    This proves (2.16) independently of the object.
  Combine it with (2.6). Choose $eta$ first and then $T$ so that
  $ D \( C_1 eta + C_2 \/ T \) < sin \( pi epsilon.alt \) . $
  To check the support hypothesis of the deformation theorem explicitly, put
  $ Q_t \( u \) = D^2 \| U_t \( u \) \|^2 - parallel M_t u parallel^2 . $
  It is nonnegative on the original semistable classes. If $U' \( u \) =
    0$ and $parallel \( U' - U_t \) M_t^(- 1) parallel lt.eq delta < 1 \/ D$, then
  $ Q_t \( u \) lt.eq \( D^2 delta^2 - 1 \) parallel M_t u parallel^2 < 0 wide \( u eq.not 0 \) . $
  Thus $Q_t$ is negative definite on every charge kernel along the straight deformation,
    and throughout the indicated open charge region. The support-property deformation theorem
    #cite(label("BayerDeformation2019")) Theorem 1.2 lifts the straight path while preserving $Q_t$.
    On its nonnegative cone, $parallel M_t u parallel lt.eq D \| U_t \( u \) \|$,
    so the relative charge change is less than $sin \( pi epsilon.alt \)$.
    The quantitative phase estimate #cite(label("BayerDeformation2019")) Lemma 2.9 then makes the slicing distance
    less than $epsilon.alt$ as long as it is less than $1 \/ 4$.
    It is zero at the start; continuity along the path and $epsilon.alt < 1 \/
    8$ prevent a first exit from that $1 \/ 4$ neighborhood. This proves the asserted strict distance bound.
    The charge bound is strict, so for each fixed $t$ it also holds on an open neighborhood in #emph[all] ambient
    numerical charges. This is the space on which we deform, before applying restriction. ◻
]

#thm([Proposition 2.7.])[
  #emph[For either factor in (2.12), the choices in Lemma 9 can be made so that every $B in V \, H in W \, t gt.eq
    T$ gives a locally finite geometric stability condition on $X$, with charge (2.15) and full numerical support.
    Every point sheaf is stable of phase $1$. For $Theta = 1$,
    the construction also gives compatible geometric slicings on every smooth section $S_h in \| L_h \|$,
    with Harder–Narasimhan phases computed by pushforward to $Y$.]
] <prop:geometric-prescribed-charges>

#proof[
  Set $A = cal(O)_Y \( 1 \, dots.h \, 1 \)$. Choose a locally free resolution $P^bullet arrow.r
    i_(*) cal(O)_X$ with $P^0 = cal(O)_Y$ and with each $P^(- k)$ a finite sum of line bundles $A^(- b)$ for $k
    gt.eq 1$. Such a resolution is obtained by repeatedly generating the successive coherent kernels after
    sufficiently positive twists. Fix $N > dim Y + 1$ and truncate after the terms in degrees $0 \,
    dots.h \, - \( N - 1 \)$. The remaining kernel is shifted by $\[ N \]$,
    so the cofiltration remainder lies in $D^(lt.eq - N) \( Y \)$.
  For a defining ambient linear form of a smooth section $S_h$,
    first form the cone of the untruncated map $P^bullet \( - xi_h \) arrow.r P^bullet$.
    It resolves $\( i compose j_h \)_(*) cal(O)_(S_h)$, and its term in degree $- k$ is
  $ P^(- k) xor P^(1 - k) \( - xi_h \) \, wide P^1 = 0 . $
  Truncate each cone resolution after its terms in degrees $0 \, dots.h \, - \( N - 1 \)$.
    Its remaining kernel is again shifted by $\[ N \]$, so its cofiltration remainder also lies in
    $D^(lt.eq - N) \( Y \)$. The line bundles in all these terms are independent of the chosen smooth section.
    Include all their summands, in particular the mixed twists $A^(- b) ⊗ cal(O)_Y \( - xi_h \)$,
    together with $A$ and $cal(O)_Y \( xi_h \)$, in one finite list.
    This list is fixed before the parameters $B \, H \, t$ and the sections are chosen.
  Let $cal(R)$ be a lift from Lemma 9. Tensoring is an isometry for slicing distance, so (2.7) gives,
    after increasing the single threshold $T$,
  #[#set math.equation(numbering: n => "(2.17)")
   $ d \( cal(R) \, cal(R) ⊗ L \) < 1 $ <eq:deformed-twist-distance>]
  for every line bundle $L$ in the finite list, uniformly in the claimed sector.
    The triangle inequality bounds the left side by $2 epsilon.alt + O \( t^(- 1) \)$.
    The same strict inequalities hold in a full open neighborhood of each lifted charge.
  In particular tensoring by $A^(- 1) \[ 1 \]$ has the Bayer property.
    #cite(label("LiEtAl2026")) Proposition 3.27 makes every point sheaf on $Y$ semistable throughout that open
    neighborhood. Its numerical class is primitive, because $chi \( cal(O)_Y \, cal(O)_y \) = 1$.
    Lemma 8 upgrades semistability to stability. At the charge (2.14) its value is $- 1$,
    and closeness to $cal(R)_t$ fixes its phase to be $1$.
  We can now apply Lemma 7 on $Y$. It supplies (2.10) with $n_1 = - dim Y$ and $n_2 = 0$.
    Each resolution term $L \[ k \]$, $k gt.eq 1$, has the Bayer property:
    (2.17) says that tensoring by $L$ lowers no extremal phase by as much as one,
    and the shift $\[ k \]$ restores the required lower bound. The initial $cal(O)_Y$ term is the identity.
    The chosen $N$ exceeds the truncation bound. Thus the finite-map criterion applies to the closed immersion $i$
    and, when needed, to every $i compose j_h$. It supplies slicings with the indicated charges and
    Harder–Narasimhan filtrations. Definition (2.11) and uniqueness of those filtrations show that pushforward
    computes their extremal phases.
  Pushforward is exact for these hearts and detects zero objects.
    A proper destabilizing subobject of a point would therefore give one for the stable point on $Y$.
    The induced points are stable of phase $1$. If $E$ is semistable on $X$,
    the ambient support inequality and the injectivity in Lemma 4 give
  $ parallel \[ E \] parallel lt.eq C parallel i_(*) \[ E \] parallel lt.eq C' \| U_t^(B \, H) \( i_(*) E \) \| . $
  This is support on the full Euler numerical group of $X$.
    For each auxiliary surface the ambient lattice through pushforward suffices;
    no injectivity assertion for its full numerical group is needed.
    Finally the support bound on a finite-rank lattice gives local finiteness:
    in a sufficiently short phase interval, the projection of a nonzero semistable charge onto its middle ray has
    a fixed positive lower bound. Additivity of this projection bounds the length of any chain of strict
    subobjects or quotients of a fixed object in that interval.
    The induced slicings are thus locally finite, as asserted. ◻
]

Apply the construction to both choices of $Theta$, intersect the two neighborhoods $V$ and $W$,
  and take the larger of their thresholds. The same real sector and one threshold therefore work for both charges.
  The proposition completes the prescribed Todd-charge assertion of Theorem 1.
  It also supplies the exact ordinary charge and full numerical support.
  Identifying its heart requires the additional argument in the next section.
  Only $K_X tilde.eq cal(O)_X$ has been used; no vanishing of $H^1 \( X \, cal(O)_X \)$ or
  $H^2 \( X \, cal(O)_X \)$ is required.

== 3 The ordinary double tilt throughout the real sector <sec:heart>

For the factor $Theta = 1$, we now identify the heart furnished by Proposition 10.
  The method of comparing hearts through smooth surface sections follows Cheng–Feyzbakhsh
  #cite(label("ChengFeyzbakhsh2026")) Section 3. Here the charge has already been corrected to the ordinary Chern
  character, and positive weighted sections allow the polarization to be real.
  The argument below proves the phase boundaries directly.

Fix $B in V \, H in W \, t gt.eq T$ from the preceding construction.
  Let $cal(P)$ be the induced slicing on $X$, with charge $Z_(B \, t H)$, and put $cal(C) = cal(P) \( 0 \, 1 \]$.
  As before, $H = sum_h ell_h L_h$ with every $ell_h > 0$. All restrictions of complexes in this section are
  derived restrictions.

=== 3.1 The geometric heart on a surface <the-geometric-heart-on-a-surface>

#thm([Lemma 3.1.])[
  #emph[Let $S$ be a smooth projective surface and $\( Z \, cal(R) \)$ a locally finite geometric stability
    condition, normalized so that point sheaves have phase $1$. Suppose
$ Im Z \( G \) = omega #scale(x: 120%, y: 120%)[\(] c_1 \( G \) - beta "rk" \( G \) #scale(x: 120%, y: 120%)[\)] \, $

 where $omega$ is a real ample divisor class and $beta$ a real divisor class. Then
$ cal(R) \( 0 \, 1 \] = chevron.l cal(F)_(omega \, beta) \[ 1 \] \, cal(T)_(omega \, beta) chevron.r \, $

 where $cal(T)_(omega \, beta)$ has strictly positive slope factors (including torsion) and
   $cal(F)_(omega \, beta)$ has nonpositive slope factors.]
] <lem:surface-geometric-heart>

#proof[
  Lemma 7 gives $cal(R) \( 0 \, 1 \] subset D^(\[ - 1 \, 0 \]) \( S \)$ and $"Coh" \( S \) subset
    cal(R) \( - 1 \, 1 \]$. The comparison of these two bounded $t$-structures makes $cal(R) \( 0 \, 1 \]$ a tilt
    of $"Coh" \( S \)$, with torsion pair
  $ cal(T)_0 = "Coh" \( S \) ∩ cal(R) \( 0 \, 1 \] \, wide cal(F)_0 = "Coh" \( S \) ∩ cal(R) \( - 1 \, 0 \] . $
  For instance their torsion sequence is obtained by truncating a sheaf at phase $0$;
    the cohomological range ensures that both pieces are sheaves.
  If $G in cal(T)_0$, every quotient sheaf also belongs to $cal(T)_0$ and has nonnegative imaginary charge.
    A nonzero positive-rank quotient cannot have imaginary charge zero:
    it would lie in $cal(R) \( 1 \)$, whereas Lemma 7 makes its zeroth cohomology zero-dimensional.
    Thus all positive-rank quotients of $G$ have strictly positive slope.
    Applying this to its last slope Harder–Narasimhan quotient proves $cal(T)_0 subset cal(T)_(omega \, beta)$.
    If $F in cal(F)_0$, then $F \[ 1 \] in cal(R) \( 0 \, 1 \]$, so $F$ is torsion-free by the same lemma.
    Every subsheaf remains in $cal(F)_0$ and has nonpositive imaginary charge.
    Its maximal-slope factor therefore has slope at most zero, giving $cal(F)_0 subset cal(F)_(omega \, beta)$.
  These inclusions identify the torsion pairs. Indeed the torsion sequence for either pair,
    applied to an object in the corresponding part of the other,
    leaves a quotient or subobject in the intersection of its two orthogonal parts, hence zero.
    This proof includes slope zero; it does not use a generic-parameter argument. ◻
]

Take a smooth section $j_h : S_h arrow.r.hook X$ in $\| L_h \|$ and its compatible slicing $cal(P)_h$.
  Grothendieck–Riemann–Roch for this divisor embedding, whose normal line bundle is $L_h \|_(S_h)$, gives

#[#set math.equation(numbering: n => "(3.1)")
 $ Z_h \( G \) = - integral_(S_h) e^(- B \|_(S_h) - i t H \|_(S_h)) "ch" \( G \)
   frac(1 - e^(- L_h \|_(S_h)), L_h \|_(S_h)) . $ <eq:surface-induced-charge>]

Since $\( 1 - e^(- L) \) \/ L = 1 - L \/ 2 + L^2 \/ 6$ on a surface, its imaginary part is

#[#set math.equation(numbering: n => "(3.2)")
 $ Im Z_h \( G \) = t H \|_(S_h) #scale(x: 120%, y: 120%)[\(] c_1 \( G \) - \( B \|_(S_h) + L_h \|_(S_h) \/ 2 \)
   "rk" \( G \) #scale(x: 120%, y: 120%)[\)] . $ <eq:surface-imaginary-charge>]

Lemma 11 identifies

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(P)_h \( 0 \, 1 \] = chevron.l cal(F)_h \[ 1 \] \, cal(T)_h chevron.r \, $ <eq:section-surface-heart>]

where the surface slope uses $H \|_(S_h)$ and twist $B \|_(S_h) + L_h \|_(S_h) \/ 2$.
  Only the imaginary part of the induced charge is needed for this identification;
  its real part need not be the ordinary surface charge.

=== 3.2 Weighted sections give strict slope bounds <weighted-sections-give-strict-slope-bounds>

The section-phase comparison of #cite(label("ChengFeyzbakhsh2026")) Lemma 3.1 applies using the line-twist
  estimate (2.17). The two section triangles give, for every nonzero restricted object,

#[#set math.equation(numbering: n => "(3.4)")
 $ phi.alt_(cal(P)_h)^(-) \( E \|_(S_h) \) & gt.eq phi.alt_(cal(P))^(-) \( E \) \,\
phi.alt_(cal(P)_h)^(+) \( E \( L_h \) \|_(S_h) \) & lt.eq phi.alt_(cal(P))^(+) \( E \) + 1 . $ <eq:section-lower-phase>]

To verify the first inequality, push the triangle $E \( - L_h \) arrow.r E arrow.r
  j_(h \, *) \( E \|_(S_h) \)$ to $Y$. Its last term is an extension of $E$ and $E \( - L_h \) \[ 1 \]$,
  and the latter has smallest phase at least that of $E$ by the strict twist-distance bound.
  For the second, $j_(h \, *) \( E \( L_h \) \|_(S_h) \)$ is an extension of $E \( L_h \)$ and $E \[ 1 \]$,
  both of largest phase at most $phi.alt_(cal(P))^(+) \( E \) + 1$.
  Pushforward computes the induced phases, proving the assertions.

For a positive-rank sheaf, use the unnormalized slope

$ m_(H \, B) \( F \) = frac(H^2 \( c_1 \( F \) - B "rk" F \), "rk" F) \; $

its signs agree with the normalized slopes defining $cal(B)_(H \, B)$.
  Superscripts $+$ and $-$ denote the largest and smallest Harder–Narasimhan slopes,
  with torsion assigned slope $+ oo$. The next estimate adapts the argument of #cite(label("ChengFeyzbakhsh2026"))
  Proposition 3.3 by combining the sections with positive real weights. Put

#[#set math.equation(numbering: n => "(3.5)")
 $ c = 1 / 2 sum_h ell_h H L_h^2 > 0 . $ <eq:weighted-slope-gap>]

#thm([Lemma 3.2.])[
  #emph[Every $E in cal(C)$ has cohomology in degrees $\[ - 2 \, 0 \]$,
    its sheaf $cal(H)^(- 2) \( E \)$ is torsion-free, and
#[#set math.equation(numbering: n => "(3.6)")
 $ m_(H \, B)^(+) \( cal(H)^(- 2) \( E \) \) lt.eq - c \, wide
   m_(H \, B)^(-) \( cal(H)^0 \( E \) \) > c . $ <eq:heart-sign-bounds>]

 A bound for a zero sheaf is vacuous.]
] <lem:heart-cohomology-slopes>

#proof[
  The range and torsion-freeness follow from Lemma 7. Write $F = cal(H)^(- 2) \( E \)$ and $G = cal(H)^0 \( E \)$.
    For each $h$, choose a general smooth $S_h$ which is a nonzerodivisor on the finitely many cohomology sheaves
    and the subobjects and quotients used below. Those sheaves and sequences then restrict without Tor.
    Such choices are available inside the complete very ample linear system.
  By (3.4), $E \( L_h \) \|_(S_h)$ has largest phase at most $2$.
    The surface tilt (3.3), applied to its lowest ordinary cohomology, implies $F \( L_h \) \|_(S_h) in cal(F)_h$.
    Similarly (3.4) places $E \|_(S_h)$ in $cal(P)_h \( > 0 \)$,
    and the highest ordinary cohomology of the surface tilt gives $G \|_(S_h) in cal(T)_h$.
    These conclusions can also be read directly from the aisles:
    $cal(P)_h \( lt.eq 2 \)$ has its degree $- 2$ cohomology in $cal(F)_h$,
    while $cal(P)_h \( > 0 \)$ has its degree $0$ cohomology in $cal(T)_h$.
  If $F eq.not 0$, restrict its maximal-slope subsheaf $F' subset F$.
    The class $cal(F)_h$ is closed under subsheaves, so the shifted twist in the definition of the surface slope gives
  $ frac(H L_h \( c_1 \( F' \) - B "rk" F' \), "rk" F') lt.eq - 1 / 2 H L_h^2 . $
  If $G$ has a positive-rank last slope quotient $G''$, quotient-closure of $cal(T)_h$ gives
  $ frac(H L_h \( c_1 \( G'' \) - B "rk" G'' \), "rk" G'') > 1 / 2 H L_h^2 . $
  For a torsion sheaf $G$ its minimum slope is $+ oo$ instead.
    Multiply the displayed inequalities by the positive $ell_h$ and sum.
    Since $sum_h ell_h L_h = H$, they are exactly (3.6). Positivity of the weights is what permits this argument
    for a real ample $H$. ◻
]

=== 3.3 Comparison with the first tilt <comparison-with-the-first-tilt>

Write $cal(B) = cal(B)_(H \, B)$ for the ordinary first tilt.
  The slope bounds just obtained place it between two adjacent translates of the constructed heart.

#thm([Lemma 3.3.])[
  #emph[We have
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(B) subset cal(P) \( - 1 \, 1 \] . $ <eq:first-tilt-phase-range>]

 Consequently
$ cal(T)_0 = cal(B) ∩ cal(P) \( 0 \, 1 \] \, wide cal(F)_0 = cal(B) ∩ cal(P) \( - 1 \, 0 \] $

 is a torsion pair in $cal(B)$, and $cal(C) = chevron.l cal(F)_0 \[ 1 \] \, cal(T)_0 chevron.r$.]
] <lem:first-tilt-phase-range>

#proof[
  Let $D in cal(T)_(H \, B)$ be a sheaf with $m_(H \, B)^(-) \( D \) > 0$.
    Lemma 7 places all its phases in $\( - 2 \, 1 \]$. If a last Harder–Narasimhan factor $G$ had phase in
    $\( - 2 \, - 1 \]$, then $G \[ 2 \] in cal(P) \( 0 \, 1 \]$.
    It follows that $G in D^(\[ 0 \, 2 \])$ and $m_(H \, B)^(+) \( cal(H)^0 \( G \) \) lt.eq - c$.
    The canonical nonzero map $D arrow.r G$ is tested on its degree-zero cohomology:
  $ "Hom" \( D \, G \) = "Hom" \( D \, cal(H)^0 \( G \) \) = 0 . $
  Here the equality follows from $G in D^(gt.eq 0)$ and standard truncation;
    the vanishing is the slope comparison, including the case of torsion $D$ since the target is torsion-free.
    This contradiction excludes that phase interval and gives $D in cal(P) \( - 1 \, 1 \]$.
  Now let $J in cal(F)_(H \, B)$, so $J$ is torsion-free with $m_(H \, B)^(+) \( J \) lt.eq 0$.
    The coherent-sheaf range gives $J \[ 1 \] in cal(P) \( - 1 \, 2 \]$.
    If a first Harder–Narasimhan factor $G$ had phase in $\( 1 \, 2 \]$,
    then $G \[ - 1 \] in cal(P) \( 0 \, 1 \]$, $G in D^(\[ - 3 \, - 1 \])$,
    and $m_(H \, B)^(-) \( cal(H)^(- 1) \( G \) \) > c$. The canonical nonzero map $G arrow.r
    J \[ 1 \]$ is tested on its top cohomology:
  $ "Hom" \( G \, J \[ 1 \] \) = "Hom" \( cal(H)^(- 1) \( G \) \, J \) = 0 \, $
  again by truncation and slope. Thus $J \[ 1 \] in cal(P) \( - 1 \, 1 \]$. Extensions prove (3.7).
  The final assertion is the comparison theorem for two bounded hearts one of which lies in two adjacent degrees
    of the other. Explicitly, truncate an object of $cal(B)$ at phase $0$ in $cal(P)$.
    The inclusion (3.7) and its corresponding inclusions of aisles make both truncations objects of $cal(B)$;
    they give its torsion sequence with the two stated intersections.
    Tilting that sequence recovers $cal(P) \( 0 \, 1 \]$. ◻
]

=== 3.4 The real-axis boundary and the second tilt <the-real-axis-boundary-and-the-second-tilt>

The constructed heart is now a tilt of $cal(B)$. It remains to identify the torsion pair,
  including the distinction between positive and zero second slope.
  The following observation, following the boundary argument of #cite(label("ChengFeyzbakhsh2026")) Lemma 3.6,
  controls precisely those objects.

#thm([Lemma 3.4.])[
  #emph[An object of $cal(B) ∩ cal(P) \( 1 \)$ is a zero-dimensional sheaf.]
] <lem:phase-one-first-tilt>

#proof[
  Let $E$ belong to the stated intersection. Its ordinary cohomology is $J =
    cal(H)^(- 1) \( E \) in cal(F)_(H \, B)$ and $U = cal(H)^0 \( E \) in cal(T)_(H \, B)$.
    Lemma 7 makes $U$ zero-dimensional. Choose the smooth sections $S_h$ to avoid its finite support and to
    restrict $J$ without Tor. If $J eq.not 0$, it is torsion-free of positive rank, and $E \|_(S_h) =
    J \|_(S_h) \[ 1 \]$. Inequality (3.4) gives $phi.alt_(cal(P)_h)^(-) \( J \|_(S_h) \) gt.eq 0$.
    Its phases as a coherent sheaf are also at most $1$, by Lemma 7.
    Hence $Im Z_h \( J \|_(S_h) \) gt.eq 0$ and (3.2) gives
  $ frac(H L_h \( c_1 \( J \) - B "rk" J \), "rk" J) gt.eq 1 / 2 H L_h^2 quad upright("for each ") h . $
  The positive weighted sum says $m_(H \, B) \( J \) gt.eq c > 0$, contrary to $m_(H \, B)^(+) \( J \) lt.eq 0$.
    Therefore $J = 0$ and $E = U$. ◻
]

We use the physical second slope from the introduction, writing $nu_(B \, t H)^(upright("phys")) =
  nu_(B \, t H)$ to distinguish it from $nu_(a \, b)$:

#[#set math.equation(numbering: n => "(3.8)")
 $ nu_(B \, t H)^(upright("phys")) \( E \) =
   frac(t H "ch"_2^B \( E \) - t^3 H^3 "ch"_0 \( E \) \/ 6, t^2 H^2 "ch"_1^B \( E \)) \, $ <eq:physical-second-slope>]

with value $+ oo$ at a zero denominator. The tilt Harder–Narasimhan property for each fixed real ample class $t
  H$ and real $B$ is the input of #cite(label("BMS2016")) Section 2;
  here no continuity as the ample direction varies is required.
  Its Harder–Narasimhan filtration defines the torsion pair $\( cal(T)' \, cal(F)' \)$ in $cal(B)$ with strictly
  positive slopes in $cal(T)'$ and nonpositive slopes in $cal(F)'$.
  Multiplication by a positive constant does not affect this pair.
  The claimed double tilt is $cal(A)_(B \, t H) = chevron.l cal(F)' \[ 1 \] \, cal(T)' chevron.r$.

#thm([Lemma 3.5.])[
  #emph[For $E in cal(B)$ the denominator in (3.8) is nonnegative.
    If it vanishes, then $Im Z_(B \, t H) \( E \) gt.eq 0$, with equality only for a zero-dimensional sheaf.]
] <lem:physical-zero-denominator>

#proof[
  Let $J = cal(H)^(- 1) \( E \)$ and $U = cal(H)^0 \( E \)$.
    The first torsion pair makes each contribution to $H^2 "ch"_1^B \( E \) = H^2 "ch"_1^B \( U \) -
    H^2 "ch"_1^B \( J \)$ nonnegative. If the sum is zero, $J$, when nonzero, is slope-semistable of slope zero,
    and $U$ has dimension at most one. Indeed positive-rank quotients in the positive torsion part have strictly
    positive degree, and a nonzero effective divisorial cycle has positive intersection with $H^2$.
    For real $H$, the Kähler Bogomolov–Gieseker inequality follows from #cite(label("LiZhangZhang2017"))
    Theorem 1.1, Equation (1.6), applied with zero Higgs field to the reflexive hull $J^(* *)$ when $J eq.not 0$.
    This hull is semistable for the same $H$: intersecting a subsheaf of $J^(* *)$ with $J$ preserves its rank and
    first Chern class. The quotient $Q = J^(* *) \/ J$ has codimension at least two, and, writing $r = "rk" J$,
    additivity gives
  $ c_1 \( J \)^2 - 2 r "ch"_2 \( J \) = c_1 \( J^(* *) \)^2 - 2 r "ch"_2 \( J^(* *) \) + 2 r "ch"_2 \( Q \) \, $
  where $"ch"_2 \( Q \)$ is an effective curve cycle, so the inequality descends to $J$.
    The same argument on a surface uses an effective zero-cycle correction;
    neither application changes the real polarization. Classical Bogomolov–Gieseker and the real-ample Hodge index
    theorem #cite(label("GrebRossToma2016")) Theorem 6.4, applied to $H^2 "ch"_1^B \( J \) = 0$,
    give $H "ch"_2^B \( J \) lt.eq 0$. The curve cycle of $U$ is effective. Consequently
  $ Im Z_(B \, t H) \( E \) = t H "ch"_2^B \( U \) - t H "ch"_2^B \( J \) + frac(t^3 H^3, 6) "rk" J gt.eq 0 . $
  If $J eq.not 0$, the last term is strictly positive. If $J = 0$ and $U$ has a nonzero one-dimensional part,
    its curve degree is strictly positive. Thus equality is possible exactly when $E = U$ is zero-dimensional. ◻
]

#thm([Proposition 3.6.])[
  #emph[For the factor $Theta = 1$ throughout the real sector of Proposition 10,
$ cal(P) \( 0 \, 1 \] = cal(A)_(B \, t H) . $

]
] <prop:exact-double-tilt-heart>

#proof[
  Compare $\( cal(T)' \, cal(F)' \)$ with the torsion pair $\( cal(T)_0 \, cal(F)_0 \)$ of Lemma 13.
    For $D in cal(T)'$, take its latter torsion sequence $0 arrow.r D_1 arrow.r D arrow.r D_2 arrow.r 0$.
    A nonzero $D_2 in cal(F)_0$ has $Im Z \( D_2 \) lt.eq 0$. Its denominator cannot vanish:
    Lemma 15 would make it zero-dimensional, whereas zero-dimensional sheaves are in $cal(P) \( 1 \)$ and
    $cal(F)_0 subset cal(P) \( - 1 \, 0 \]$. Thus $D_2$ has positive denominator and
    $nu_(B \, t H)^(upright("phys")) \( D_2 \) lt.eq 0$, contradicting the strictly positive slopes of every
    nonzero quotient of $D$. Hence $cal(T)' subset cal(T)_0$.
  For $D in cal(F)'$, consider $D_1$ in the same torsion sequence.
    A nonzero subobject of $D$ has second slope at most zero,
    so $D_1$ has positive denominator and $Im Z \( D_1 \) lt.eq 0$.
    But $D_1 in cal(T)_0 subset cal(P) \( 0 \, 1 \]$ makes its imaginary charge nonnegative.
    It must therefore vanish, and $D_1 in cal(P) \( 1 \)$. Lemma 14 makes it zero-dimensional,
    whose second slope is $+ oo$, a contradiction. Thus $cal(F)' subset cal(F)_0$.
    The two inclusions identify the torsion pairs, and their tilts coincide. ◻
]

Proposition 16, together with Proposition 10, proves the ordinary charge assertion of Theorem 1,
  including its exact heart, full numerical support, local finiteness, stable points,
  and one threshold for an open real sector. The equality of hearts was proved only for $Theta = 1$.
  The Todd-charge construction retains its geometric heart from the preceding section.

Finally, the coefficient in the strong inequality should be kept distinct from the weaker sign consequence of this
  construction. If $E eq.not 0$ is first-tilt semistable of finite physical slope zero,
  then $E \[ 1 \] in cal(A)_(B \, t H)$ and its nonzero real charge is negative. Thus

$ "ch"_3^B \( E \) < t^2 / 2 H^2 "ch"_1^B \( E \) . $

With $t = sqrt(3) a$, the strong inequality has coefficient $t^2 \/ 18$ instead.
  The categorical argument supplies the real-sector and full-support conclusions;
  the sharper coefficient will be proved independently in Sections 6 and 7 by the fixed-volume estimate and wall
  transport.

== 4 Tilt stability and numerical transport <sec:tilt>

We now begin the independent proof of Theorem 2, which applies to arbitrary smooth projective threefolds along a
  fixed integral ample direction. The inequality will first be proved at one volume,
  then transported to all positive volumes. This section supplies the tilt conventions and deformation facts
  needed for that transport. Objects with zero reduced charge must be retained:
  they affect both finite factor filtrations and duality at real parameters.

=== 4.1 Characters, slopes, and the first tilt <characters-slopes-and-the-first-tilt>

Throughout this section, $X$ is a smooth projective complex threefold, $H$ is an integral ample divisor class,
  and $h = H^3$. All intersections and Chern characters are numerical.
  For a real divisor class $T$, set $"ch"^T \( E \) = e^(- T) "ch" \( E \)$ and use the normalized coordinates

#[#set math.equation(numbering: n => "(4.1)")
 $ r \( E \) = "ch"_0 \( E \) \, wide c_T \( E \) = "ch"_1^T \( E \) \,\
d_T \( E \) = frac(H^2 c_T \( E \), h) \, wide w_T \( E \) = frac(H "ch"_2^T \( E \), h) \, wide z_T \( E \) =
  frac("ch"_3^T \( E \), h) . $ <eq:normalized-characters>]

The subscript $0$ is reserved for the untwisted character.
  Fix $B_0 in N^1 \( X \)_(bb(Q))$ and put $B = B_0 + b H$ for $b in bb(R)$.
  We abbreviate the twist $B_0 + b H$ by a symbolic subscript $b$; when evaluating at $b = 0$,
  we write the subscript $B_0$ explicitly. The exponential formula gives

#[#set math.equation(numbering: n => "(4.2)")
 $ d_b & = d_(B_0) - b r \, & w_b & = w_(B_0) - b d_(B_0) + 1 / 2 b^2 r \,\
z_b & = z_(B_0) - b w_(B_0) + 1 / 2 b^2 d_(B_0) - 1 / 6 b^3 r . $ <eq:twist-two>]

For a positive-rank coherent sheaf define $mu_(H \, B) = d_B \/ r$, and give every nonzero torsion sheaf slope $+
  oo$. Let $mu^(+)$ and $mu^(-)$ be the largest and smallest slopes in the slope Harder–Narasimhan filtration.
  The torsion pair and its tilt are

#[#set math.equation(numbering: n => "(4.3)")
 $ cal(T)_(H \, B) = { U : mu_(H \, B)^(-) \( U \) > 0 } \, wide cal(F)_(H \, B) = { V :
   mu_(H \, B)^(+) \( V \) lt.eq 0 } \,\
cal(B)_(H \, B) = chevron.l cal(F)_(H \, B) \[ 1 \] \, cal(T)_(H \, B) chevron.r \, $ <eq:first-tilt>]

where the zero sheaf belongs to both parts. This is the heart of a bounded $t$-structure. For $a > 0$ put

#[#set math.equation(numbering: n => "(4.4)")
 $ n_(a \, b) = w_b - 1 / 2 a^2 r \, wide nu_(a \, b) \( E \) =
   cases(delim: "{", n_(a \, b) \( E \) \/ d_b \( E \) \, & d_b \( E \) > 0 \,, + oo \, & d_b \( E \) = 0 .)
   $ <eq:tilt-numerator>]

For a general real twist $B$, the same formula defines $nu_(a \, B)$ using $d_B \, w_B$ and $n = w_B -
  a^2 r \/ 2$; the notation $nu_(a \, b)$ specifies the line $B = B_0 + b H$.
  An object is tilt-stable, respectively tilt-semistable, if every proper nonzero subobject $F subset
  E$ in $cal(B)_(H \, B)$ satisfies $nu \( F \) < nu \( E \/ F \)$, respectively $nu \( F \) lt.eq
  nu \( E \/ F \)$. This is the convention of #cite(label("BMS2016")) Definition 2.3.
  The physical parameter $omega = sqrt(3) a H$ used in #cite(label("BMT2014")) #cite(label("BMS2016")) multiplies
  our finite slope by $1 \/ \( sqrt(3) a \)$, so defines the same stable and semistable objects.

Here are two harmless reductions for the inequality. Write $q =
  H^2 B_0 \/ h$ and replace $\( B_0 \, b \)$ by $\( B_0 - q H \, b + q \)$; the twist $B$ is unchanged,
  and the new rational $B_0$ satisfies $H^2 B_0 = 0$. If $H' = s H$ is very ample, use $a' = a \/ s$ and $b' =
  b \/ s$. The hearts agree and $nu'_(a' \, b') = nu_(a \, b) \/ s$.
  An estimate with correction $k' \( H' \)^2$ becomes an estimate with correction $s^2 k' H^2$,
  and a threshold $a' > R'$ becomes $a > s R'$. We may therefore assume $H$ very ample and $H^2 B_0 =
  0$ while proving the estimates. Constants used with duality are chosen for both $B_0$ and $- B_0$.

=== 4.2 Discriminants and finite-slope filtrations <discriminants-and-finite-slope-filtrations>

The Hodge index theorem gives a useful norm on $N^1 \( X \)_(bb(R))$. Define

#[#set math.equation(numbering: n => "(4.5)")
 $ chevron.l C \, D chevron.r = frac(H C D, h) \, wide C_perp = C - chevron.l H \, C chevron.r H \, wide
   parallel C parallel^2 = chevron.l H \, C chevron.r^2 - chevron.l C_perp \, C_perp chevron.r . $ <eq:divisor-norm>]

The pairing is negative definite on $H^perp$, so this is a positive definite norm.
  For a positive-rank torsion-free sheaf $G$ put

#[#set math.equation(numbering: n => "(4.6)")
 $ mu \( G \) = frac(d_0 \( G \), r \( G \)) \, wide xi_G = ⟨frac(c_0 \( G \), r \( G \)) \,
   frac(c_0 \( G \), r \( G \))⟩ - frac(2 w_0 \( G \), r \( G \)) \,\
delta_G^T = (frac(d_T \( G \), r \( G \)))^2 - frac(2 w_T \( G \), r \( G \)) . $ <eq:sheaf-discriminants>]

Classical Bogomolov–Gieseker gives $xi_G gt.eq 0$ for slope-semistable $G$.
  Twist invariance of the full discriminant and the orthogonal decomposition in (4.5) give

#[#set math.equation(numbering: n => "(4.7)")
 $ delta_G^T = xi_G - ⟨(frac(c_0 \( G \), r \( G \)) - T)_perp \, (frac(c_0 \( G \), r \( G \)) - T)_perp⟩ gt.eq
   xi_G . $ <eq:xi-delta>]

Slope filtrations of torsion-free sheaves may be refined to slope-stable torsion-free factors:
  take saturated equal-slope subsheaves inside a semistable factor and induct on rank.

For arbitrary derived objects the projected discriminant is

#[#set math.equation(numbering: n => "(4.8)")
 $ Delta \( E \) = d_b \( E \)^2 - 2 r \( E \) w_b \( E \) = d_(B_0) \( E \)^2 -
   2 r \( E \) w_(B_0) \( E \) . $ <eq:projected-discriminant>]

Its independence of $b$ follows from (4.2). We use the following established tilt-stability input for a
  #emph[fixed] integral ample class $H$. There are Harder–Narasimhan filtrations for all $a > 0$ and real $B$;
  tilt-stability is open in $\( a \, B \)$; the extremal phases of a fixed derived object vary continuously;
  and every tilt-semistable object satisfies

#[#set math.equation(numbering: n => "(4.9)")
 $ Delta gt.eq 0 \, wide chevron.l c_B \, c_B chevron.r - 2 r w_B + C_H d_B^2 gt.eq 0 $ <eq:tilt-discriminants>]

for a constant $C_H gt.eq 0$ depending only on $X \, H$. These are #cite(label("BMS2016")) Theorem 3.5 and
  Propositions B.2 and B.5, with volume factors absorbed into $C_H$.
  The continuous reduced charge is $d_B + i \( w_B - a^2 r \/ 2 \)$,
  with heart phase interval $\( - 1 \/ 2 \, 1 \/ 2 \]$ and phase $1 \/ 2$ assigned to its zero-charge objects.
  No assertion about varying the direction of $H$ is used here;
  #cite(label("BMS2016")) Remark B.6(b) expressly distinguishes that question.

#thm([Lemma 4.1.])[
  #emph[An object $E in cal(B)_(H \, B)$ has $d_B \( E \) gt.eq 0$. Write $n = w_B - a^2 r \/ 2$.
    If $d_B \( E \) = 0$, then $n \( E \) gt.eq 0$, with equality exactly when $E$ is a zero-dimensional sheaf,
    including the zero object. For a finite-slope object $E$,
    semistability is equivalent to the condition that every proper nonzero subobject has positive denominator and
    slope at most $nu \( E \)$. Every finite-slope quotient of a finite-slope semistable object has slope at least
    $nu \( E \)$.]
] <lem:tilt-zero-denominator>

#proof[
  Write $V = cal(H)^(- 1) \( E \)$ and $U = cal(H)^0 \( E \)$ for ordinary cohomology.
    The defining torsion pair gives $d_B \( V \) lt.eq 0$ and $d_B \( U \) gt.eq 0$, whence $d_B \( E \) =
    d_B \( U \) - d_B \( V \) gt.eq 0$. If it is zero, a nonzero $V$ is torsion-free and slope-semistable of slope
    zero, whereas $U$ has dimension at most one. Bogomolov–Gieseker and Hodge index give $w_B \( V \) lt.eq 0$;
    effectiveness of the curve cycle gives $w_B \( U \) gt.eq 0$. Thus
  $ n \( E \) = w_B \( U \) - w_B \( V \) + 1 / 2 a^2 r \( V \) gt.eq 0 . $
  Equality forces $V = 0$ and the curve cycle of $U$ to vanish, so $U$ is zero-dimensional. The converse is immediate.
  In a short exact sequence $0 arrow.r F arrow.r E arrow.r G arrow.r 0$ with $d \( E \) > 0$,
    a subobject with $d \( F \) = 0$ has slope $+ oo$ while $d \( G \) > 0$. It is forbidden by semistability.
    If both denominators are positive, additivity makes $nu \( E \)$ their weighted average,
    proving the desired equivalences. If $d \( G \) = 0$, then $n \( G \) gt.eq 0$, so $nu \( F \) lt.eq
    nu \( E \)$ and comparison with $nu \( G \) = + oo$ is automatic. ◻
]

Strict comparison with the quotient is significant: a zero-dimensional quotient does not destroy stability in our
  convention, although it gives equality between the slopes of the subobject and the object.
  An object stable for the stricter subobject–object convention is semistable in ours,
  and is therefore covered by all the inequalities below.

#thm([Lemma 4.2.])[
  #emph[For fixed $a > 0$ there is a constant $C_a$, depending only on $a \, X \, H$,
    such that every tilt-semistable object, at any real twist $B$, satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ \| r \| + \| w_B \| + parallel c_B parallel lt.eq C_a \( d_B + \| n \| \) \, wide n = w_B -
   a^2 r \/ 2 . $ <eq:tilt-support-bound>]

 The constants can be bounded uniformly when $a$ ranges in a compact subinterval of $\( 0 \, oo \)$.]
] <lem:tilt-support-bound>

#proof[
  The first inequality of (4.9) gives $a^2 r^2 + 2 r n lt.eq d^2$, and hence $\| r \| lt.eq 2 \| n \| \/ a^2 +
    d \/ a$. The equality $w = n + a^2 r \/ 2$ bounds $\| w \|$. Finally the second inequality gives
  $ parallel c_B parallel^2 = 2 d^2 - chevron.l c_B \, c_B chevron.r lt.eq \( 2 + C_H \) d^2 - 2 r w \, $
  which proves the norm bound. These expressions also prove uniformity on compact $a$-intervals. ◻
]

This estimate controls rank, the full first character, and one degree of the second character.
  It is not a support statement on the full numerical Grothendieck group.
  Its immediate use is to make a finite-slope factorization terminate even when $b$ is irrational.

#thm([Lemma 4.3.])[
  #emph[Every nonzero finite-slope tilt-semistable object has a finite filtration in $cal(B)_(H \, B)$ whose
    factors are tilt-stable of the same finite slope. Extensions of finite-slope semistable objects of the same
    slope are semistable of that slope.]
] <lem:finite-tilt-factors>

#proof[
  Let $nu \( E \) = u in bb(R)$. If $E$ is not stable, there is a proper nonzero subobject $F$ with $nu \( F \) =
    nu \( E \/ F \) = u$ and positive denominators. The object $F$ is semistable by Lemma 17.
    To obtain a splitting into two semistable objects, we may have to absorb a zero-dimensional subobject of the
    quotient back into $F$. Put $G = E \/ F$ and take its Harder–Narasimhan filtration.
    Its last factor is a quotient of $E$, so, if its slope is finite, that slope is at least $u$.
    The other finite slopes are no smaller. There must be a finite factor since $d \( G \) > 0$.
    Additivity of $n - u d$, together with the nonnegativity of $n$ on infinite-slope factors,
    now forces all finite slopes to equal $u$ and all infinite-slope factors to have $d = n = 0$.
    Thus $G$ is either semistable or has a zero-dimensional initial subobject $T$ followed by a semistable
    quotient of slope $u$. Replace $F$ by the preimage of $T$.
    It is still a proper equal-slope subobject of $E$, hence semistable, and its quotient is now semistable as well.
  Repeated splitting cannot produce arbitrarily many nonzero factors.
    For a semistable factor of slope $u$, Lemma 18 gives $\| r \| lt.eq C_a \( 1 + \| u \| \) d$.
    If $r eq.not 0$, integrality of rank therefore bounds $d$ below by $1 \/ \( C_a \( 1 + \| u \| \) \)$.
    If $r = 0$, then $d = H^2 "ch"_1 \/ h$ is positive and belongs to $h^(- 1) bb(Z)$, so $d gt.eq 1 \/ h$.
    Each factor has denominator at least the smaller of these two positive constants,
    and their denominators sum to $d \( E \)$. A finite number of splits consequently gives stable factors.
  For the extension assertion, intersect a subobject with the first term and take its image in the last term.
    A nonzero intersection or image has positive denominator and slope at most $u$ by semistability.
    Their sum has the same properties, proving the subobject criterion. ◻
]

=== 4.3 Semistability on the numerical semicircle <semistability-on-the-numerical-semicircle>

The next observation brings a nonzero finite slope to slope zero.
  It also supplies the side points used in the fixed-apex argument.
  It extends the calculation of #cite(label("BMS2016")) Lemma 4.3 to a fixed transverse twist $B_0$.

#thm([Lemma 4.4.])[
  #emph[Suppose $E$ is tilt-semistable of finite slope $u$ at $\( a \, b \)$.
    Put $c = b + u$ and $R = sqrt(a^2 + u^2)$. Then $E$ is tilt-semistable at every point
#[#set math.equation(numbering: n => "(4.11)")
 $ b' = c + x \, wide a' = sqrt(R^2 - x^2) \, wide - R < x < R \, $ <eq:tilt-semicircle>]

 and its slope there is $- x$. In particular it is semistable of slope zero at $\( R \, c \)$.]
] <lem:tilt-semicircle>

#proof[
  Since $w_b = u d_b + a^2 r \/ 2$, the twist formulas give $w_c = R^2 r \/ 2$ and $d_c = d_b - u r$.
    Thus $Delta = d_c^2 - R^2 r^2 gt.eq 0$. If $r eq.not 0$, the negative alternative $d_c lt.eq -
    R \| r \|$ would give $d_b = d_c + u r lt.eq - \( R - \| u \| \) \| r \| < 0$.
    It follows that $d_c gt.eq R \| r \|$; for $r = 0$ we have $d_c = d_b > 0$. On the whole open arc, therefore,
  $ d_(b') = d_c - x r > 0 \, wide n_(a' \, b') = - x \( d_c - x r \) . $
  Consider the set of points on the arc where $E$ is semistable in the corresponding heart.
    It contains the original point. It is closed within the arc:
    the formal charge has positive real part, and continuity of the largest and smallest phases makes both
    converge to its finite phase. In particular, this argument also ensures membership in the limiting heart.
    It is open within the arc as well. At a semistable point take the finite stable filtration from Lemma 19.
    Every factor has the same slope there and thus the same $c \, R$ in (4.11).
    Openness of stability keeps all these finitely many factors stable in nearby hearts,
    with their common slope $- x$. Their fixed triangles are short exact sequences in those hearts,
    and their extensions are semistable by the preceding lemma. Connectedness of the arc proves the assertion. ◻
]

=== 4.4 Duality, including the point defect <duality-including-the-point-defect>

To treat negative rank we use the shifted derived dual $bb(D) \( E \) = R cal(H) o m \( E \, cal(O)_X \) \[ 1 \]$.

#thm([Lemma 4.5.])[
  #emph[Let $a > 0$, let $B$ be real, and let $E in cal(B)_(H \, B)$ be tilt-semistable of finite slope $u$.
    There are a zero-dimensional sheaf $T_0$ and a distinguished triangle
#[#set math.equation(numbering: n => "(4.12)")
 $ tilde(E) arrow.r bb(D) \( E \) arrow.r T_0 \[ - 1 \] arrow.r tilde(E) \[ 1 \] \, $ <eq:tilt-dual-triangle>]

 where $tilde(E) in cal(B)_(H \, - B)$ is tilt-semistable of slope $- u$.
   At twists $B$ and $- B$ respectively their coordinates are related by
#[#set math.equation(numbering: n => "(4.13)")
 $ \( r \, d \, w \, z \) \( tilde(E) \) = #scale(x: 120%, y: 120%)[\(] - r \( E \) \, d_B \( E \) \, -
   w_B \( E \) \, z_B \( E \) + "length" \( T_0 \) \/ h #scale(x: 120%, y: 120%)[\)] . $ <eq:tilt-dual-characters>]

 Moreover $tilde(E) = tau^(lt.eq 0) bb(D) \( E \)$ for the ordinary cohomological truncation.]
] <lem:tilt-duality>

#proof[
  For rational $omega = sqrt(3) a H$ and rational $B$, #cite(label("BMT2014")) Proposition 5.1.3(b) gives the
    triangle and semistability directly: its hypothesis is finite maximal tilt slope,
    which holds for a finite-slope semistable object. In that triangle $tilde(E)$ has ordinary cohomology in
    degrees $- 1 \, 0$, whereas $T_0 \[ - 1 \]$ is in degree $1$.
    Hence $tilde(E)$ is the stated ordinary truncation; it depends only on $E$.
  First suppose $E$ is stable at real parameters. By openness it is stable at a sequence of nearby parameters with
    rational $omega \, B$. The rational triangles all have the same truncation $tau^(lt.eq 0)
    bb(D) \( E \)$ and the same sheaf $cal(H)^1 \( bb(D) \( E \) \)$.
    Their mirror finite phases converge to the phase of slope $- u$, with the denominator still positive.
    Continuity of extremal phases therefore gives semistability of this fixed truncation in $cal(B)_(H \, - B)$.
  For a semistable $E$, use Lemma 19 and induct on its number of stable factors.
    For an extension $0 arrow.r E_1 arrow.r E arrow.r E_2 arrow.r 0$, duality reverses the triangle.
    We must show that its degree-zero cohomology in the mirror tilt heart is semistable and that its degree-one
    cohomology is zero-dimensional. The cohomology sequence is
  $ 0 arrow.r tilde(E)_2 arrow.r cal(H)_(cal(B)_(H \, - B))^0 \( bb(D) \( E \) \) arrow.r tilde(E)_1 arrow.r
    T_(0 \, 2) arrow.r cal(H)_(cal(B)_(H \, - B))^1 \( bb(D) \( E \) \) arrow.r T_(0 \, 1) arrow.r 0 \, $
  and all other tilt cohomology vanishes. Subobjects and quotients of a zero-dimensional sheaf in this heart are
    zero-dimensional: additivity first forces both denominators to vanish,
    then both nonnegative numerators to vanish, and Lemma 17 applies.
    Consequently the kernel of $tilde(E)_1 arrow.r T_(0 \, 2)$ has the same positive denominator and the same
    slope as $tilde(E)_1$; it is semistable by the subobject criterion.
    The degree-zero term is an extension of it by $tilde(E)_2$, and is semistable of slope $- u$.
    The degree-one term is zero-dimensional. This proves (4.12), including its truncation description,
    for the extension.
  Finally the shifted dual has characters $\( - r \, c_B \, - "ch"_2^B \, "ch"_3^B \)$ at twist $- B$.
    The term $T_0 \[ - 1 \]$ has third character $- "length" \( T_0 \)$,
    so taking characters of the triangle gives (4.13). ◻
]

== 5 Restriction and cohomology bounds <sec:analysis>

The estimates in this section convert numerical control of slope factors into control of sections and first
  cohomology. The constants depend on the polarized variety and on specified twist ranges,
  but not on the ranks of the sheaves. This distinction is essential:
  the first-cohomology estimate will be proportional to a discriminant error,
  which can vanish even when the rank is large.

Throughout this section, $H$ is very ample and $h = H^3$. On a smooth surface $S in \| H \|$, we use

$ d_T \( G \) = frac(H \|_S thin "ch"_1^T \( G \), h) \, wide w_T \( G \) = frac("ch"_2^T \( G \), h) \, wide
  mu_T \( G \) = frac(d_T \( G \), "rk" G) . $

For divisor classes on $S$, put $chevron.l C \, D chevron.r = C D \/ h$ and use the norm

$ parallel C parallel^2 = chevron.l H \, C chevron.r^2 - chevron.l C_perp \, C_perp chevron.r \, wide C_perp = C -
  chevron.l H \, C chevron.r H . $

Here and below $H$ also denotes its restriction. The definitions of $xi_G$ and $delta_G^T$ consequently have the
  same formulas as on $X$. In particular, for a positive-rank sheaf they give the identity

#[#set math.equation(numbering: n => "(5.1)")
 $ mu_T \( G \)^2 + delta_G^T = ∥frac(c_1 \( G \), "rk" G) - T∥^2 + xi_G . $ <eq:surface-norm-discriminant>]

On a smooth curve $C_m in \| m H \|_S$, normalize the slope as $mu \( G \) = deg \( G \) \/ \( m h "rk" G \)$.
  This makes the slope of an unmodified restriction equal to the slope before restriction.

The first-cohomology estimate will concern stable surface sheaves whose normalized first character is close to a
  negative scalar class. For the fixed rational twist $B_0$, write

$ T = B_0 \|_S + \( b - A \) H \, wide \| b \| lt.eq 1 . $

For sufficiently large $A$, our target is to bound first cohomology at fixed twists by sums of

$ r \( G \) (∥frac(c_1 \( G \), r \( G \)) - T∥^2 + xi_G) . $

This quantity can vanish even when the total rank is large.
  The negative scalar part of $T$ will give positive central curvature on the dual bundle;
  its trace-free curvature will then control the remaining harmonic forms.
  A separate estimate for sections uses the rank of a subsheaf’s evaluation map.
  We first choose surfaces and curves with uniform geometry,
  so that both estimates have constants independent of the sheaves and their ranks.

=== 5.1 Restriction and the choice of smooth sections <restriction-and-the-choice-of-smooth-sections>

#thm([Lemma 5.1.])[
  (Restriction variance).  #emph[Let $G$ be a slope-semistable torsion-free sheaf of rank $r > 0$ on $X$.
    For a very general smooth $S in \| H \|$, restrict $G$ and refine its slope Harder–Narasimhan filtration into
    slope-stable torsion-free factors $G_i$, with ranks $r_i$ and normalized slopes $mu_i$. Then
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_i r_i #scale(x: 120%, y: 120%)[\(] mu_i - mu \( G \) #scale(x: 120%, y: 120%)[\)]^2 lt.eq
   r xi_G . $ <eq:restriction-variance>]

 The same assertion holds for a slope-semistable torsion-free sheaf on $S$,
   restricted to a very general smooth $C_m in \| m H \|_S$, for every positive integer $m$.]
  #emph[More generally, restrict a finite filtration with semistable torsion-free factors and refine each
    restricted factor separately. From $X$ to $S$, for any fixed divisor twist $T$ on $X$, restricted to $S$,
    the increases in $sum_i r_i mu_T \( G_i \)^2$ and in $sum_i r_i
    delta_(G_i)^T$ are equal and lie between zero and the original sum $sum_G r \( G \) xi_G$.
    From $S$ to $C_m$, the same upper bound holds for the increase of the second slope moment,
    using any fixed divisor twist on $S$ and its restriction to $C_m$.
    The concatenated filtration need not be the Harder–Narasimhan filtration of the whole restriction.]
] <lem:restriction-variance>

#proof[
  Write
  $ "Disc" \( G \) = 2 r c_2 \( G \) - \( r - 1 \) c_1 \( G \)^2 = c_1 \( G \)^2 - 2 r "ch"_2 \( G \) . $
  The characteristic-zero semistable case of Langer’s restriction inequality #cite(label("Langer2004"))
    Theorem 3.1 has zero extremal-slope term. On $X$ it gives, for raw restricted slopes $s_i = h mu_i$,
  $ sum_(i < j) r_i r_j \( s_i - s_j \)^2 lt.eq h H "Disc" \( G \) = h^2 r^2 xi_G . $
  Since $sum r_i mu_i = r mu \( G \)$, the left side is $h^2 r sum_i r_i \( mu_i - mu \( G \) \)^2$.
    Division gives (5.2). If the restriction is semistable, its left side is zero,
    and the inequality follows directly from $xi_G gt.eq 0$. Refinement at a fixed slope leaves the sum unchanged.
    For a surface restriction, apply the same theorem with its very ample divisor $m H$.
    The raw slopes are $s_i = m h mu_i$ and the right side is $m^2 h "Disc" \( G \) = m^2 h^2 r^2 xi_G$;
    the factors $m^2 h^2 r$ cancel in the same way.
  We use the corrected very-general formulation of the theorem #cite(label("Langer2004Addendum")) p. 1211.
    In the ample polarizations used here, that addendum also permits general divisors:
    the stated difficulty concerns the remaining nef polarizations when they are not ample.
  For each original factor, the weighted mean of its restricted slopes is unchanged.
    Subtracting a fixed scalar $mu \( T \)$ from these slopes therefore does not change their variance.
    The elementary identity
  $ sum_i r_i \( mu_i - mu \( T \) \)^2 = r \( mu \( G \) - mu \( T \) \)^2 + sum_i r_i \( mu_i - mu \( G \) \)^2 $
  proves the second-moment assertion. From $X$ to $S$, restriction preserves the total $w_T$;
    hence $sum r_i delta_(G_i)^T = sum r_i mu_T \( G_i \)^2 - 2 w_T \( G \)$ changes by exactly the same amount.
    Sum these identities over the original factors. Their restricted and refined filtrations are exact for a
    suitable choice of the divisor, as justified next. ◻
]

#thm([Lemma 5.2.])[
  (Uniform smooth sections).  #emph[There is an integer $m > 0$, depending only on $X \, H$,
    such that every smooth $S in \| H \|$ satisfies
#[#set math.equation(numbering: n => "(5.3)")
 $ h^0 \( S \, cal(O)_S \( m H \) \) = chi \( cal(O)_S \( m H \) \) \, wide mu \( K_S \) - m lt.eq - 1 \,
   $ <eq:surface-fixed-m>]

 and $H^0 \( X \, cal(O)_X \( m H \) \) arrow.r H^0 \( S \, cal(O)_S \( m H \) \)$ is surjective.
   One can choose relatively compact analytic neighborhoods of a smooth transverse pair of divisors in $\| H \|
   times \| m H \|$ such that the resulting surfaces and curves, equipped with the induced Fubini–Study metrics,
   have uniform smooth local geometry.]
  #emph[Within these neighborhoods one may impose, for each application,
    the very-general restriction conditions of Lemma 22 and exactness of any specified finite collection of
    restricted sequences. Restrictions of a specified finite collection of torsion-free sheaves may also be
    required to remain torsion-free. For a specified bounded complex,
    one may require its derived restriction to have ordinary cohomology equal to the restrictions of its ordinary
    cohomology sheaves.]
] <lem:uniform-sections>

#proof[
  Choose $m$ so large that $\( m - 1 \) H - K_X$ is ample, $H^1 \( X \, cal(O)_X \( \( m - 1 \) H \) \) = 0$,
    and $m gt.eq mu \( K_S \) + 1$. The last slope is independent of $S$,
    by adjunction $K_S = \( K_X + H \) \|_S$. Kodaira vanishing on $S$ #cite(label("DemaillyCADG")) Chapter VII,
    Theorem 3.3 gives the first equality in (5.3), and the restriction sequence on $X$ gives surjectivity on sections.
  Bertini’s theorem supplies a smooth pair meeting transversely.
    Shrink an analytic neighborhood of that pair so that its closure is compact and all intersections remain
    smooth. The universal surfaces and curves over this closure are smooth proper families.
    Local trivializations on a finite cover give uniform bounds for the metrics, their derivatives,
    coordinate comparisons, and the partitions of unity used below.
    Surjectivity on sections allows the curve on each chosen surface to vary in an analytic open subset of its
    complete linear system.
  For a fixed coherent sheaf, a general defining section avoids all its associated points,
    and is thus a nonzerodivisor. Applying this to the quotients in a finite collection of exact sequences
    preserves their exactness under restriction. To ensure torsion-freeness,
    embed a torsion-free sheaf into a vector bundle and require the defining section to be a nonzerodivisor on its
    cokernel. Restriction then embeds the restricted sheaf into the restricted bundle.
    Such an embedding exists because a sufficiently positive twist of the dual is globally generated and the
    original sheaf injects into its double dual. Repeating the argument on the surface gives the curve assertion.
    Applied to the ordinary cohomology sheaves of a bounded complex,
    the nonzerodivisor condition kills the first Tor terms in the restriction spectral sequence,
    giving the asserted cohomology identification.
  These are finitely many nonempty Zariski-open conditions at each stage.
    A very-general condition removes at most countably many proper algebraic closed subsets.
    Each such subset has empty analytic interior, so the Baire theorem ensures a choice in every one of our
    nonempty analytic neighborhoods. The geometric constants were fixed before this choice and do not depend on
    the sheaves being restricted. ◻
]

=== 5.2 Sections of subsheaves <sections-of-subsheaves>

We first bound sections using a scalar heat estimate. The rank of a subsheaf enters only through the rank of its
  evaluation map; the ambient bundle may have arbitrarily large rank.

#thm([Lemma 5.3.])[
  (Uniform heat estimates).  #emph[Let $Y$ range over the compact families of curves or surfaces in Lemma 23,
    with real dimension $n$. Write $Delta_(upright("sc"))$ for the nonnegative scalar Laplacian.
    Its heat kernel satisfies
$ 0 lt.eq k_s \( x \, y \) lt.eq C s^(- n \/ 2) wide \( 0 < s lt.eq 1 \) . $

 For any Hermitian vector bundle with metric connection $nabla$, put $L = nabla^(*) nabla + 1$.
   The kernel $K_s \( x \, y \)$ of $e^(- s L)$ satisfies
#[#set math.equation(numbering: n => "(5.4)")
 $ parallel K_s \( x \, y \) parallel_(upright("op")) lt.eq C s^(- n \/ 2) wide \( s > 0 \) \, $ <eq:connection-heat>]

 with a constant independent of the bundle, its rank, and its connection.]
] <lem:uniform-heat>

#proof[
  The uniform charts and partitions of unity give the Nash inequality
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel f parallel_2^(2 + 4 \/ n) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel d f parallel_2^2 +
     parallel f parallel_2^2 #scale(x: 120%, y: 120%)[\)] parallel f parallel_1^(4 \/ n) . $ <eq:nash-uniform>]
  For completeness, in a Euclidean chart split the Fourier integral at frequency $R$:
    its low-frequency part is bounded by $C R^n parallel f parallel_1^2$,
    and its high-frequency part by $R^(- 2) parallel d f parallel_2^2$.
    Optimize in $R$, and use a fixed finite partition of unity.
    Derivatives of the partition produce the additional $parallel f parallel_2^2$ term.
    All comparison constants are uniform over the chosen families.
  Set $L_(upright("sc")) = Delta_(upright("sc")) + 1$ and $f_s = e^(- s L_(upright("sc"))) f$.
    The scalar semigroup is positivity preserving and contracts $L^1$.
    For $y \( s \) = parallel f_s parallel_2^2$, (5.5) and $y' = - 2 chevron.l L_(upright("sc")) f_s \,
    f_s chevron.r$ imply
  $ y' lt.eq - c parallel f parallel_1^(- 4 \/ n) y^(1 + 2 \/ n) . $
  Integration gives $parallel e^(- s L_(upright("sc"))) parallel_(1 arrow.r 2) lt.eq C s^(- n \/ 4)$.
    Selfadjointness and composition give $parallel e^(- s L_(upright("sc"))) parallel_(1 arrow.r oo) lt.eq
    C s^(- n \/ 2)$ for every $s > 0$. Multiplication by $e^s$ gives the stated estimate for $k_s$ when $s lt.eq 1$.
  For a section-valued heat solution, Kato’s inequality and the maximum principle give
  $ \| e^(- s L) v \| \( x \) lt.eq \( e^(- s L_(upright("sc"))) \| v \| \) \( x \) . $
  One obtains the differential inequality by differentiating $\( \| v \|^2 + epsilon^2 \)^(1 \/ 2)$ and then
    letting $epsilon arrow.b 0$; compatibility of the connection with the metric is the only bundle input.
    Approximate a vector-valued point mass at $y$ in this inequality.
    This bounds the operator norm of $K_s \( x \, y \)$ by the scalar kernel of $e^(- s L_(upright("sc")))$,
    and proves (5.4). ◻
]

#thm([Lemma 5.4.])[
  (Sections of a subsheaf).  #emph[Let $Y$ be one of the curves or surfaces in Lemma 23,
    let $G$ be a slope-stable torsion-free sheaf on $Y$, and let $J subset G$ have rank $q$. Then
#[#set math.equation(numbering: n => "(5.6)")
 $ h^0 \( Y \, J \) lt.eq C q #scale(x: 120%, y: 120%)[\(] 1 +
   mu \( G \)_(+) #scale(x: 120%, y: 120%)[\)]^(dim Y) \, wide x_(+) = max { x \, 0 } \, $ <eq:subsheaf-sections>]

 where $C$ depends only on the chosen geometric families. The same bound applies to subsheaves of a stable dual
   bundle tensored with a line bundle, using the slope of that twisted bundle.]
] <lem:subsheaf-sections>

#proof[
  On a curve $G$ is locally free. On a surface its reflexive hull $W = G^(* *)$ is locally free and slope-stable:
    intersecting a subsheaf of $W$ with $G$ preserves rank and first Chern class,
    since $W \/ G$ is zero-dimensional. The Hermitian–Einstein theorem #cite(label("Donaldson1985"))
    #cite(label("UhlenbeckYau1986")) therefore gives a metric on $W$ for which $i Lambda
    F_W$ is the scalar determined by $mu \( G \)$. Its proportionality constant is fixed by the dimension and our
    volume normalization.
  For a holomorphic section $s$ of $W$, the Bochner identity gives
  $ Delta_(upright("sc")) \| s \|^2 lt.eq C mu \( G \)_(+) \| s \|^2 . $
  Scalar heat comparison consequently yields $\| s \( x \) \|^2 lt.eq
    e^(C u mu \( G \)_(+)) \( e^(- u Delta_(upright("sc"))) \| s \|^2 \) \( x \)$.
    Take $u = \( 1 + mu \( G \)_(+) \)^(- 1)$ and apply Lemma 24.
    The evaluation operator, with the $L^2$ norm on $H^0 \( Y \, W \)$, satisfies
  #[#set math.equation(numbering: n => "(5.7)")
   $ parallel "ev"_x parallel_(upright("op"))^2 lt.eq C #scale(x: 120%, y: 120%)[\(] 1 +
     mu \( G \)_(+) #scale(x: 120%, y: 120%)[\)]^(dim Y) . $ <eq:evaluation-operator>]
  Give $H^0 \( Y \, J \) subset H^0 \( Y \, W \)$ the induced $L^2$ norm and choose an orthonormal basis $s_1 \,
    dots.h \, s_N$. Outside a proper analytic subset, their evaluations lie in a subspace of dimension at most $q$. Thus
  $ sum_(j = 1)^N \| s_j \( x \) \|^2 = parallel "ev"_x \|_(H^0 \( J \)) parallel_(upright("HS"))^2 lt.eq
    q parallel "ev"_x parallel_(upright("op"))^2 . $
  Integration proves (5.6); the volumes are uniformly bounded. The case $q = 0$ means $J = 0$.
    Dualization and tensoring with a line preserve slope stability, so the same proof gives the last assertion. ◻
]

=== 5.3 A matrix spectral estimate on surfaces <a-matrix-spectral-estimate-on-surfaces>

To control first cohomology, a bound proportional to rank would not suffice.
  We instead count harmonic forms using the square of the Hilbert–Schmidt norm of the trace-free curvature.
  The following spectral estimate is a four-dimensional, bundle-valued Cwikel–Lieb–Rozenblum estimate;
  compare #cite(label("Frank2014")) Theorem 3.2 and Lemma 3.4.
  We give the heat-semigroup proof, retaining the matrix trace to keep its constants independent of rank.

#thm([Lemma 5.5.])[
  (Spectral dimension bound).  #emph[Let $S$ be one of the surfaces in Lemma 23.
    Let $cal(V)$ be a Hermitian vector bundle with metric connection, $L = nabla^(*) nabla + 1$,
    and let $P$ be a bounded measurable nonnegative selfadjoint endomorphism of $cal(V)$.
    If a finite-dimensional subspace $U$ of the form domain of $L$ satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ chevron.l L u \, u chevron.r lt.eq chevron.l P u \, u chevron.r wide \( u in U \) \, $ <eq:spectral-form-hypothesis>]

 then
#[#set math.equation(numbering: n => "(5.9)")
 $ dim U lt.eq C integral_S "tr" \( P^2 \) . $ <eq:matrix-spectral-bound>]

 The constant is independent of $cal(V)$, its rank, $nabla$, and $P$.]
] <lem:matrix-spectral>

#proof[
  The compact positive operator $L^(- 1 \/ 2) P L^(- 1 \/ 2)$ has at least $dim
    U$ eigenvalues greater than or equal to $1$: apply min–max to the subspace $L^(1 \/ 2) U$ and (5.8).
    Its nonzero eigenvalues, with multiplicity, are those of $P^(1 \/ 2) L^(- 1) P^(1 \/ 2)$.
    Define an operator with an additional time variable by
  $ \( cal(B) v \) \( s \) = e^(- s L \/ 2) P^(1 \/ 2) v \, wide cal(B) : L^2 \( S \, cal(V) \) arrow.r
    L^2 \( \( 0 \, oo \) times S \, cal(V) \) . $
  Integration of the heat semigroup gives $cal(B)^(*) cal(B) = P^(1 \/ 2) L^(- 1) P^(1 \/ 2)$.
  Fix $0 < eta < 1$ and split $cal(B) = cal(B)_lt.eq + cal(B)_(>)$ by inserting the fiberwise spectral projections
    $upright(bold(1))_(s P lt.eq eta)$ and $upright(bold(1))_(s P > eta)$ immediately after $P^(1 \/ 2)$.
    Heat contraction gives
  $ parallel cal(B)_lt.eq v parallel^2 lt.eq integral_0^oo chevron.l P upright(bold(1))_(s P lt.eq eta) v \,
    v chevron.r thin d s lt.eq eta parallel v parallel^2 . $
  Indeed, each positive eigenvalue $p$ contributes $integral_0^(eta \/ p) p thin d s = eta$,
    and a zero eigenvalue contributes zero.
  Let $K_s$ be the kernel of $e^(- s L)$. The semigroup identity and Lemma 24, in real dimension four, imply
  $ parallel cal(B)_(>) parallel_(upright("HS"))^2 & = integral_0^oo integral_S "tr" #scale(x: 120%, y: 120%)[\(]
    P upright(bold(1))_(s P > eta) K_s \( x \, x \) #scale(x: 120%, y: 120%)[\)] thin d x thin d s\
 & lt.eq C integral_S integral_0^oo s^(- 2) "tr" #scale(x: 120%, y: 120%)[\(] P upright(bold(1))_(s P > eta)
   #scale(x: 120%, y: 120%)[\)] thin d s thin d x\
 & = C eta^(- 1) integral_S "tr" \( P^2 \) . $
  The last identity follows eigenvalue by eigenvalue from $integral_(eta \/ p)^oo s^(- 2) p thin d s =
    p^2 \/ eta$. All integrands are nonnegative, so Tonelli’s theorem applies.
  On the spectral subspace where $cal(B)^(*) cal(B) gt.eq 1$,
    the triangle inequality gives $parallel cal(B)_(>) v parallel gt.eq \( 1 - sqrt(eta) \) parallel v parallel$.
    Apply this to an orthonormal basis of that subspace and sum. Taking $eta = 1 \/ 4$ proves (5.9). ◻
]

In the application below, $P$ will be built from trace-free curvature.
  The matrix trace in (5.9) will therefore bound the dimension of harmonic forms by curvature energy,
  with no additional term proportional to the bundle rank.

=== 5.4 First cohomology near a negative scalar class <first-cohomology-near-a-negative-scalar-class>

Fix the rational class $B_0$ from the threefold, and restrict it to the chosen surfaces.
  The next proposition concerns sheaves whose normalized first Chern classes are close to $B_0 + \( b - A \) H$.
  A sufficiently negative scalar part makes the central curvature component of the dual bundle positive;
  the trace-free curvature measures the failure of the resulting vanishing theorem.

#thm([Proposition 5.6.])[
  (Surface first cohomology).  #emph[Fix a real number $M$.
    There is a number $A_0$, depending only on $X \, H \, B_0 \, M$ and the chosen smooth neighborhoods,
    with the following property. For $A gt.eq A_0$ and a finite set $I subset { t in bb(Z) : t lt.eq M }$,
    there is a constant $C$ such that, for every chosen surface $S$, every $b in \[ - 1 \, 1 \]$,
    every finite collection of slope-stable torsion-free sheaves $G_i$ on $S$, and every $t in I$,
#[#set math.equation(numbering: n => "(5.10)")
 $ sum_i h^1 \( S \, G_i \( t H \) \) lt.eq C sum_i r_i (∥frac(c_1 \( G_i \), r_i) - T∥^2 + xi_(G_i)) \, wide T =
   B_0 \|_S + \( b - A \) H . $ <eq:negative-surface-cohomology>]

 The constant is independent of the collection and its ranks.
   The same upper bound holds for $h^1 \( S \, G \( t H \) \)$ if the $G_i$ are the factors of a filtration of
   $G$. In particular, a bound $C_0 e$ for the sum on the right gives a bound $C C_0 e$ for the first cohomology.]
] <prop:negative-surface-cohomology>

The order of constants matters in the next section. The threshold $A_0$ uses only the upper twist bound $M$.
  Once $A$ and the finite set $I$ are fixed, the cohomology constant $C$ may depend on both;
  it remains independent of the sheaves, their ranks, and $b$.

#proof[
  We prove the bound for one factor $G$, writing $r = "rk" G$, $C_1^(upright("num")) = c_1 \( G \) \/ r$,
    and $rho = parallel C_1^(upright("num")) - T parallel$. We separate $rho gt.eq 1$,
    where the numerical error already controls rank, from $rho < 1$, where the curvature argument is needed.
  Suppose first that $rho gt.eq 1$. The class $T$ is uniformly bounded once $A$ is fixed, so $1 +
    parallel C_1^(upright("num")) parallel^2 lt.eq C_A rho^2$.
    Lemma 25, applied to $G \( t H \)$, gives $h^0 \( G \( t H \) \) lt.eq
    C r \( 1 + parallel C_1^(upright("num")) parallel^2 + t^2 \)$. Put $W = G^(* *)$.
    Serre duality identifies $H^2 \( G \( t H \) \)^(*)$ with $"Hom" \( G \, K_S \( - t H \) \) =
    H^0 \( W^(*) ⊗ K_S \( - t H \) \)$; the equality follows by extending across the finite support of $W \/ G$.
    The dual version of Lemma 25 gives the same bound for $h^2$.
  Surface Riemann–Roch reads
  $ chi \( G \( t H \) \) = r chi \( cal(O)_S \) + frac(h r, 2)
    (chevron.l C_1^(upright("num")) + t H \, C_1^(upright("num")) + t H chevron.r - xi_G) - r /
    2 \( C_1^(upright("num")) + t H \) K_S . $
  The Hodge norm controls both the intersection form and pairing with $K_S$.
    Consequently $\| chi \( G \( t H \) \) \| lt.eq
    C r \( 1 + parallel C_1^(upright("num")) parallel^2 + t^2 + xi_G \)$.
    Since $I$ is finite, $h^1 = h^0 + h^2 - chi$ is at most $C r \( rho^2 + xi_G \)$, as required.
  Now assume $rho < 1$. The hull sequence $0 arrow.r G arrow.r W arrow.r Q arrow.r 0$ has $Q$ zero-dimensional and
  #[#set math.equation(numbering: n => "(5.11)")
   $ xi_G - xi_W = frac(2 "length" Q, h r) \, wide "length" Q lt.eq frac(h r xi_G, 2) . $ <eq:hull-length>]
  Here $W$ is stable, as in the proof of Lemma 25, and $xi_W gt.eq
    0$ by the classical Bogomolov–Gieseker inequality. The long exact cohomology sequence gives
    $h^1 \( G \( t H \) \) lt.eq h^1 \( W \( t H \) \) + "length" Q$.
    It remains to bound $h^1 \( W \( t H \) \)$ by $C r xi_W$.
  Equip $W$ with its Hermitian–Einstein metric. Write its Chern curvature as
  $ F_W = F_0 + frac("tr" F_W, r) "id"_W \, wide theta.alt = frac(i, 2 pi r) "tr" F_W . $
  The real $\( 1 \, 1 \)$-form $theta.alt$ is closed and has constant contraction, hence is harmonic.
    It represents $C_1^(upright("num"))$. The Hodge star formula on primitive $\( 1 \, 1 \)$-forms identifies its
    $L^2$ norm with a fixed multiple of the divisor norm. Uniform elliptic estimates on our compact smooth
    families therefore give a uniform bound for the supremum norm of a harmonic representative in terms of this
    divisor norm. In particular, since $rho < 1$ and $\| b \| lt.eq 1$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ - theta.alt - t omega_S gt.eq \( A - M - C_1 \) omega_S wide \( t lt.eq M \) . $ <eq:central-curvature-positive>]
  The fixed constant $C_1$ bounds the harmonic representatives of $B_0 \|_S + b H$ and the unit ball of errors.
    Here $omega_S$ is the induced Kähler form, and the line bundle $cal(O)_S \( H \)$ has curvature $2 pi
    omega_S$. Choose $A_0$ so that the right side is strictly positive with a fixed lower bound.
    This choice uses only the upper endpoint $M$, not the lower endpoint of $I$.
  The trace-free curvature $F_0$ is primitive. Chern–Weil and the primitive Hodge star formula give
  #[#set math.equation(numbering: n => "(5.13)")
   $ integral_S \| F_0 \|_(upright("HS"))^2 lt.eq C frac("Disc" \( W \), r) = C h r xi_W . $ <eq:tracefree-energy>]
  Indeed $"Disc" \( W \) = - r integral_S "tr" \( \( i F_0 \/ 2 pi \) and \( i F_0 \/ 2 pi \) \)$,
    and the last integrand is the negative squared norm because $F_0$ is primitive.
    The fixed conversion constant depends on the curvature convention, not on $r$.
  By Serre duality and the Dolbeault theorem, $h^1 \( W \( t H \) \)$ is the dimension of the space $U$ of
    harmonic $\( 2 \, 1 \)$-forms with values in $W^(*) \( - t H \)$.
    On this bundle the Bochner–Kodaira–Nakano identity #cite(label("DemaillyCADG")) Chapter VII, Corollary 1.3 is
  #[#set math.equation(numbering: n => "(5.14)")
   $ Delta'' = Delta' + \[ i F \, Lambda \] . $ <eq:nakano-identity>]
  For the central curvature, (5.12) makes the commutator on $\( 2 \, 1 \)$-forms at least $lambda
    I$ for a fixed $lambda > 0$. To see the sign directly, diagonalize the central $\( 1 \, 1 \)$-form in a
    unitary frame. On top holomorphic degree, its commutator is the sum of the positive eigenvalues whose
    antiholomorphic indices occur; there is one such index here.
    Denote the remaining selfadjoint curvature endomorphism by $K_0$.
    Wedge and contraction act on fixed-dimensional form spaces, so
  #[#set math.equation(numbering: n => "(5.15)")
   $ \| K_0 \|_(upright("HS")) lt.eq C \| F_0 \|_(upright("HS")) . $ <eq:curvature-endomorphisms>]
  We explain explicitly how to retain an elliptic operator in (5.14).
    Let $nabla$ be the total metric connection on $\( 2 \, 1 \)$-forms with these bundle coefficients.
    For a pure-type form the terms in $partial u + accent(partial u, ‾)$ have different types,
    as do their adjoints. Hence the quadratic form of the connection de Rham Laplacian is the sum of the forms of
    $Delta'$ and $Delta''$. On $U$, the latter vanishes, so the de Rham form equals the $Delta'$ form.
    The Weitzenböck formula, restricted to this type, consequently gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ chevron.l Delta' u \, u chevron.r gt.eq parallel nabla u parallel_2^2 - C_2 parallel u parallel_2^2 +
     chevron.l R_0 u \, u chevron.r wide \( u in U \) \, $ <eq:weitzenbock-on-harmonics>]
  where $R_0$ is selfadjoint and $\| R_0 \|_(upright("HS")) lt.eq C \| F_0 \|_(upright("HS"))$.
    The bounded term contains the tangent curvature and the central bundle curvature;
    its bound $C_2$ is uniform for fixed $A \, I$. The formula follows by anticommuting wedge and contraction in
    $d_nabla$ and $d_nabla^(*)$: the second-order part is $nabla^(*) nabla$,
    and the remaining terms contract the tangent and bundle curvature.
    Only the fixed form dimension enters the contraction constants.
  Choose $0 < epsilon lt.eq min { 1 \, lambda \/ \( C_2 + 1 \) }$.
    On $U$, retain $epsilon Delta'$ in (5.14), discard the nonnegative remainder, and use (5.16). This gives
  $ epsilon parallel nabla u parallel_2^2 + \( lambda - epsilon C_2 \) parallel u parallel_2^2 lt.eq
    chevron.l \( \| K_0 \| + epsilon \| R_0 \| \) u \, u chevron.r . $
  Our choice ensures $lambda - epsilon C_2 gt.eq epsilon$. Thus, with spectral absolute values of selfadjoint matrices,
  $ L = nabla^(*) nabla + 1 \, wide P = epsilon^(- 1) \| K_0 \| + \| R_0 \| \, wide chevron.l L u \,
    u chevron.r lt.eq chevron.l P u \, u chevron.r quad \( u in U \) . $
  Moreover,
  #[#set math.equation(numbering: n => "(5.17)")
   $ "tr" \( P^2 \) lt.eq 2 epsilon^(- 2) \| K_0 \|_(upright("HS"))^2 + 2 \| R_0 \|_(upright("HS"))^2 lt.eq
     C \| F_0 \|_(upright("HS"))^2 . $ <eq:potential-trace>]
  This uses the Hilbert–Schmidt norm of the matrices, without replacing them by their operator norms times the identity.
  Lemma 26, followed by (5.13), now proves $h^1 \( W \( t H \) \) = dim U lt.eq C r xi_W$.
    Together with (5.11), this gives the required bound for the factors with $rho < 1$ as well.
    Sum over the factors. For an extension $0 arrow.r G' arrow.r G arrow.r G'' arrow.r 0$,
    the cohomology sequence gives $h^1 \( G \( t H \) \) lt.eq h^1 \( G' \( t H \) \) + h^1 \( G'' \( t H \) \)$;
    induction proves the final filtration assertion. ◻
]

The combination of Lemma 22 and Proposition 27 is the point of the section.
  Restriction increases the relevant numerical sums by at most a discriminant contribution,
  while the cohomology bound uses those sums without adding a bare rank term.
  The fixed-apex argument can therefore apply these estimates even when its numerical error is zero.

== 6 A uniform estimate at one volume <sec:apex>

The preceding surface estimates control cohomology in terms of a discriminant,
  without a factor depending on the rank. We now use them to prove the following estimate at one fixed value of
  the volume parameter. The factor on its right measures the distance from the equality case of the first-tilt
  discriminant inequality.

#thm([Proposition 6.1.])[
  #emph[Let $X$ be a smooth projective complex threefold, let $H$ be very ample,
    and let $B_0$ be a rational divisor class with $H^2 B_0 = 0$.
    There are constants $A > 0$ and $C gt.eq 0$, depending only on $X \, H \, B_0$, such that,
    for every $b in bb(R)$ and every finite-slope $nu_(A \, b)$-semistable object $E in
    cal(B)_(H \, B_0 + b H)$ with $nu_(A \, b) \( E \) = 0$,
#[#set math.equation(numbering: n => "(6.1)")
 $ z_B \( E \) - A^2 / 6 d_B \( E \) lt.eq C #scale(x: 120%, y: 120%)[\(] d_B \( E \) -
   A \| r \( E \) \| #scale(x: 120%, y: 120%)[\)] \, wide B = B_0 + b H . $ <eq:apex-estimate>]

 The same constants can be chosen for $B_0$ and $- B_0$.]
] <prop:apex>

Here $h = H^3$ and $d_B \, w_B \, z_B$ are normalized by $h$ as in Section 4.
  In particular, $d_B gt.eq A \| r \|$ at slope zero. We first choose all the constants from the fixed geometry.
  For an individual $E$, we then separate a narrow range of sheaf slopes from a remainder whose cohomology is
  controlled by

$ e = d_B \( E \) - A \| r \( E \) \| . $

Reduction to characteristic $p$ and Riemann–Roch convert these cohomology estimates into (6.1).
  The remainder contributes at most $C p^3 e$. The narrow sheaf tail can have large rank even when $e = 0$;
  two restriction sequences will instead bound its sections by a cubic expression in its slopes,
  producing the coefficient $A^2 \/ 6$. Only errors that vanish after division by $p^3$ will be allowed to depend
  on $E$. We write $F \( t \) = F ⊗ cal(O)_X \( t H \)$, also for complexes, and write $h^i \( F \) =
  dim bb(H)^i \( X \, F \)$.

=== 6.1 Constants chosen before the object <constants-chosen-before-the-object>

Tensoring by $cal(O)_X \( k H \)$ identifies the parameters $b$ and $b +
  k$ and preserves all the $B$-twisted characters. It therefore suffices to treat $\| b \| lt.eq 1$.
  Choose a positive integer $q$ and a divisor $D$ representing $q B_0$.
  On a smooth reduction of $X$ in characteristic $p$, let $F$ denote absolute Frobenius and put

#[#set math.equation(numbering: n => "(6.2)")
 $ L_p = cal(O)_X #scale(x: 120%, y: 120%)[\(] - floor.l p \/ q ceil.r D -
   floor.l p b ceil.r H #scale(x: 120%, y: 120%)[\)] \, wide L'_p = K_X ⊗ L_p^(- 1) . $ <eq:rounding-lines>]

Either nearest integer can be chosen at a tie. Thus $c_1 \( L_p \) \/ p arrow.r - B$.
  We will estimate Frobenius sections through sections at two fixed twists on the original object.
  The following presentation supplies those twists; its consequence immediately below explains their roles.

#thm([Lemma 6.2.])[
  #emph[There are positive integers $j \, j_2$ and a constant $C_0$, determined by $X \, H \, D$,
    with the following property. After choosing and shrinking a model of this fixed geometry over a finitely
    generated integral subring of $bb(C)$, every smooth geometric fiber in characteristic $p$ and every $\| b \|
    lt.eq 1$ satisfy the following assertion, for either $L = L_p$ or $L = L'_p$:
$ G_(p \, L) = F_(*) \( K_X^(1 - p) ⊗ L^(- 1) \) $

 has a presentation
#[#set math.equation(numbering: n => "(6.3)")
 $ 0 arrow.r K_(p \, L) arrow.r cal(O)_X \( - j \)^(N_(p \, L)) arrow.r G_(p \, L) arrow.r 0 \, wide
   N_(p \, L) lt.eq C_0 p^3 \, $ <eq:frobenius-presentation>]

 where $K_(p \, L) \( j_2 \)$ is generated by its global sections.]
] <lem:frobenius-presentation>

#proof[
  For each line bundle in the fixed list $cal(O)_X \( plus.minus D \) \, cal(O)_X \( plus.minus H \) \,
    K_X^(plus.minus 1)$, choose three successive surjections from sums of negative powers of $cal(O)_X \( H \)$,
    with locally free kernels. They exist by global generation after twisting;
    a surjection onto a locally free sheaf has locally free kernel.
    Spread these finitely many sequences and a regularity bound for $cal(O)_X$ to a model,
    and shrink so that they remain exact on the fibers.
  There is consequently an integer $v_0$, independent of the fiber,
    such that tensoring by any one line bundle in the list increases by at most $v_0$ a threshold above which all
    higher cohomology vanishes. Indeed, tensor its three-step presentation by the original line bundle and use the
    cohomology sequences. The three dimension shifts end in cohomological degree greater than three.
    If the finitely many twists in the presentation are bounded by $v_0$,
    every intervening sum of lines has vanishing higher cohomology above the shifted threshold.
    Starting with the fixed bound for $cal(O)_X$ proves the claim by induction on the number of tensor factors.
  The line $K_X^(1 - p) ⊗ L^(- 1)$ is a product of at most $c_0 p + c_1$ members of this fixed list,
    uniformly for $\| b \| lt.eq 1$ and for both choices of $L$.
    It therefore has no higher cohomology after twisting by $s H$ whenever $s gt.eq c_2 p + c_3$.
    Projection formula gives
  $ H^i #scale(x: 120%, y: 120%)[\(] G_(p \, L) \( j - i \) #scale(x: 120%, y: 120%)[\)] =
    H^i #scale(x: 120%, y: 120%)[\(] K_X^(1 - p) ⊗ L^(- 1) \( p \( j - i \) \) #scale(x: 120%, y: 120%)[\)] =
    0 quad \( 1 lt.eq i lt.eq 3 \) $
  for a fixed sufficiently large $j$. Castelnuovo–Mumford regularity then gives the evaluation surjection in
    (6.3), using a basis of $H^0 \( G_(p \, L) \( j \) \)$, and gives surjectivity of multiplication of these
    sections at every higher twist.
  The cohomology sequence for its kernel gives a uniform regularity bound $j_2$.
    For degrees at least two use regularity of $G_(p \, L)$ and of $cal(O)_X \( - j \)$;
    in degree one use the just-proved multiplication surjectivity.
    Increasing $j_2$ makes the kernel generated at $j_2$. Finally,
    the higher cohomology of $K_X^(1 - p) ⊗ L^(- 1) \( p j \)$ vanishes, so
  $ N_(p \, L) = chi #scale(x: 120%, y: 120%)[\(] K_X^(1 - p) ⊗ L^(- 1) \( p j \) #scale(x: 120%, y: 120%)[\)] . $
  This Euler characteristic is constant under specialization for each of the indicated line bundles.
    On the complex fiber, Riemann–Roch is a polynomial of degree at most three in exponents bounded by a fixed
    multiple of $p$. This proves $N_(p \, L) lt.eq C_0 p^3$. All the choices preceded any choice of a tilt object. ◻
]

#thm([Corollary 6.3.])[
  (From fixed twists to Frobenius sections).  #emph[On a smooth geometric fiber in the preceding lemma,
    let $P_1$ be a perfect complex with ordinary cohomology in degrees $\[ - 1 \, 0 \]$. If
$ H^0 #scale(x: 120%, y: 120%)[\(] cal(H)^(- 1) \( P_1 \) \( j_2 \) #scale(x: 120%, y: 120%)[\)] = 0 \, $

 then, for either $L = L_p$ or $L = L'_p$,
#[#set math.equation(numbering: n => "(6.4)")
 $ h^0 \( F^(*) P_1 ⊗ L \) lt.eq C_0 p^3 h^0 \( P_1 \( j \) \) . $ <eq:frobenius-section-transfer>]

 The twists $j \, j_2$ and the constant $C_0$ are those chosen from the fixed geometry in Lemma 29.]
] <cor:frobenius-section-transfer>

#proof[
  Finite duality and projection formula give
  #[#set math.equation(numbering: n => "(6.5)")
   $ h^0 \( F^(*) P_1 ⊗ L \) = dim "Hom" \( G_(p \, L) \, P_1 \) . $ <eq:frobenius-hom-identity>]
  Indeed $F^(!) P_1 = F^(*) P_1 ⊗ K_X^(1 - p)$, so adjunction applied to $K_X^(1 - p) ⊗
    L^(- 1)$ proves the identity. The semilinearity of absolute Frobenius does not change these dimensions.
    Apply (6.3). The obstruction to injectivity of
  $ "Hom" \( G_(p \, L) \, P_1 \) arrow.r "Hom" \( cal(O)_X \( - j \)^(N_(p \, L)) \, P_1 \) $
  is the image of
  $ "Hom" \( K_(p \, L) \[ 1 \] \, P_1 \) = "Hom" \( K_(p \, L) \, cal(H)^(- 1) \( P_1 \) \) . $
  The equality uses the ordinary cohomological range of $P_1$.
    Generation of $K_(p \, L) \( j_2 \)$ and the assumed vanishing make this group zero.
    The Hom map is therefore injective, and its target has dimension $N_(p \, L) h^0 \( P_1 \( j \) \) lt.eq
    C_0 p^3 h^0 \( P_1 \( j \) \)$. ◻
]

Thus the characteristic-zero estimates we shall need are a section bound at $j$ and a vanishing for the negative
  cohomology sheaf at $j_2$. They will pass to the chosen fibers by semicontinuity.
  We now choose the remaining constants so that both estimates can be proved uniformly in the tilt object.

Fix $m$ and the compact smooth neighborhoods of surfaces and curves from Lemma 23. In particular,

#[#set math.equation(numbering: n => "(6.6)")
 $ h^0 \( cal(O)_S \( m \) \) = chi \( cal(O)_S \( m \) \) \, wide mu \( K_S \) - m lt.eq - 1 . $ <eq:apex-m-choice>]

Put $M = max \( j \, j_2 \)$, choose $c > M + 2$, and then choose $A$ so large that Proposition 27 applies for
  upper twist $M$ and both $B_0 \, - B_0$, and

#[#set math.equation(numbering: n => "(6.7)")
 $ A > c \, wide A > j_2 + 2 \, wide A gt.eq 1 \, wide A^2 - c^2 gt.eq delta_(upright("line")) := -
   H B_0^2 \/ h . $ <eq:apex-A-choice>]

The number $delta_(upright("line"))$ is nonnegative by the Hodge index theorem.
  We shall choose one further integer $m_0$ below, depending only on these constants, and put $t_0 = - m_0$.
  Thus $A$ does not depend on the negative endpoint $t_0$: the negative-surface estimate requires an upper bound
  on the twists for its positivity, and its constant may subsequently depend on the chosen finite range.

=== 6.2 The two decompositions at slope zero <the-two-decompositions-at-slope-zero>

Fix a finite-slope semistable $E$ at $\( A \, b \)$ with $\| b \| lt.eq 1$ and $nu_(A \, b) \( E \) = 0$.
  Suppress $B = B_0 + b H$ in numerical subscripts when there is no ambiguity. Write

$ V = cal(H)^(- 1) \( E \) \, wide U = cal(H)^0 \( E \) \, wide macron(U) = U \/ U_(upright("tor")) . $

The sheaf $V$ is torsion-free. All the ordinary slope factors of $V$ have slope at most $b - A$,
  and all those of $macron(U)$ have slope at least $b + A$.
  To prove the first assertion, the highest slope factor $V_1 \[ 1 \]$ is a subobject of $E$ in the first-tilt
  heart. Finite-slope semistability excludes a denominator-zero subobject and gives

$ w_B \( V_1 \) gt.eq A^2 r \( V_1 \) \/ 2 . $

Classical Bogomolov–Gieseker gives $2 w_B \( V_1 \) \/ r \( V_1 \) lt.eq \( mu \( V_1 \) - b \)^2$;
  the first torsion pair gives $mu \( V_1 \) lt.eq b$. Together they give $mu \( V_1 \) lt.eq b - A$.
  For the other assertion use the lowest slope factor of $macron(U)$, which is a quotient of $E$,
  and the same computation with $mu > b$.

Throughout this section, $O \( e \)$ denotes an absolute value bounded by a fixed constant times $e = d -
  A \| r \|$. Constants in this notation may depend on the choices above, but not on $E$, its rank, or $b$.
  Rank and character bounds for a complex do not mean bounds for the length of its zero-dimensional cohomology.

For nonnegative rank, we retain a quotient with slopes within one unit of $b +
  A$ and bound sections of the residual complex by $e$. For nonpositive rank,
  we retain a shifted subsheaf with slopes within one unit of $b - A$;
  its surface first cohomology will allow us to bound all sections of $E$ by $e$.
  This second bound will also be applied to the shifted dual of a nonnegative-rank object,
  controlling its degree-two cohomology.

Suppose first that $r \( E \) gt.eq 0$. On refined ordinary slope filtrations the equality $e = d - A r$ reads

#[#set math.equation(numbering: n => "(6.8)")
 $ e = sum_(macron(U)) r_i \( mu_i - b - A \) + d \( U_(upright("tor")) \) +
   sum_V r_i \( b - mu_i + A \) . $ <eq:positive-excess>]

Every term is nonnegative. Let $Q$ be the slope tail quotient of $macron(U)$ whose slopes lie in
  $\[ b + A \, b + A + 1 \]$, and let $P$ be the kernel of the epimorphism $E arrow.r Q$ in the tilt heart:

#[#set math.equation(numbering: n => "(6.9)")
 $ P arrow.r E arrow.r Q . $ <eq:positive-residual-triangle>]

Empty parts mean zero sheaves. The negative cohomology of $P$ is $V$,
  and its degree-zero cohomology is an extension of the slope prefix with slopes $> b + A +
  1$ by $U_(upright("tor"))$. The corresponding sheaf sequences, shifted where appropriate,
  are exact in the tilt heart because their torsion-free terms stay in the indicated halves of the torsion pair.

Equation (6.8) gives

#[#set math.equation(numbering: n => "(6.10)")
 $ d \( P \) \, med \| r \( P \) \| \, med r \( cal(H)^(- 1) \( P \) \) \, med r \( cal(H)^0 \( P \) \) =
   O \( e \) . $ <eq:residual-character-bound>]

For example, on the high prefix the positive number $mu_i - b -
  A > 1$ controls both $r_i$ and $r_i \( mu_i - b \)$; on $V$ the number $b - mu_i + A gt.eq 2 A$ does the same.
  The torsion degree is at most $e$. Quotient comparison and the classical discriminant inequality on the factors
  of $Q$ give

#[#set math.equation(numbering: n => "(6.11)")
 $ frac(A^2 r \( Q \), 2) lt.eq w_B \( Q \) lt.eq frac(A^2 r \( Q \), 2) + O \( e \) \, wide sum_Q r_i delta_i^B =
   O \( e \) . $ <eq:positive-tail-moments>]

Indeed, write $mu_i - b = A + s_i$, where $0 lt.eq s_i lt.eq 1$ and $sum r_i s_i lt.eq e$.
  Then $sum r_i \( mu_i - b \)^2 = A^2 r \( Q \) + O \( e \)$, and subtract $2 w_B \( Q \)$.
  Additivity with $w_B \( E \) = A^2 r \( E \) \/ 2$ now also gives $w_B \( P \) = O \( e \)$.

For $r \( E \) lt.eq 0$ use instead

#[#set math.equation(numbering: n => "(6.12)")
 $ e = sum_V r_i \( b - A - mu_i \) + sum_(macron(U)) r_i \( mu_i - b + A \) +
   d \( U_(upright("tor")) \) . $ <eq:negative-excess>]

Let $V_0$ be the slope prefix of $V$ with slopes in $\[ b - A - 1 \, b - A \]$ and form the exact triangle in the
  tilt heart

#[#set math.equation(numbering: n => "(6.13)")
 $ V_0 \[ 1 \] arrow.r E arrow.r P . $ <eq:negative-residual-triangle>]

The same estimates give (6.10) and $w_B \( P \) = O \( e \)$.
  More explicitly, subobject comparison applied to $V_0 \[ 1 \]$ gives

$ A^2 r \( V_0 \) \/ 2 lt.eq w_B \( V_0 \) lt.eq A^2 r \( V_0 \) \/ 2 + O \( e \) . $

Put $T = B - A H$. If $mu_i - b = - A - s_i$ with $0 lt.eq s_i lt.eq 1$, then $sum r_i s_i lt.eq e$ and

$ sum_(V_0) r_i mu_T^2 lt.eq e \, wide w_T \( V_0 \) = w_B \( V_0 \) + A d_B \( V_0 \) +
  A^2 r \( V_0 \) \/ 2 gt.eq - A e . $

Since $delta_i^T = mu_T^2 - 2 w_T \( G_i \) \/ r_i$, it follows that

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(V_0) r_i \( mu_T^2 + delta_i^T \) = O \( e \) . $ <eq:negative-tail-energy>]

After very general restriction to a surface in the fixed smooth neighborhood and refinement into stable factors,
  this bound remains valid by Lemma 22. For each such factor,

$ mu_T^2 + delta^T = parallel c_0 \/ r - T parallel^2 + xi . $

Consequently Proposition 27 implies, for every integer $t_0 < t lt.eq M$,

#[#set math.equation(numbering: n => "(6.15)")
 $ h^1 #scale(x: 120%, y: 120%)[\(] V_0 \|_S \( t \) #scale(x: 120%, y: 120%)[\)] = O \( e \) . $ <eq:negative-tail-h1>]

Both decompositions are available when $r \( E \) = 0$; we use the one specified by the argument in which it occurs.

=== 6.3 Line comparisons and images of sections <line-comparisons-and-images-of-sections>

We next control the sections of $P$ in (6.9), and those of $E$ in (6.13).
  Their restrictions can have more sections than are bounded by $e$.
  The argument will bound the image of a space of sections under restriction.

We need a comparison valid for all tilt quotients of a line bundle.
  At parameters $\( a \, b' \)$, let $ell in bb(Z)$, $L = cal(O)_X \( ell H \)$ and $u = ell - b' > 0$.
  A nonzero proper tilt quotient $I$ fits into $0 arrow.r K arrow.r L arrow.r I arrow.r 0$ in the heart,
  with $K$ a sheaf and

$ 0 arrow.r cal(H)^(- 1) \( I \) arrow.r K arrow.r L arrow.r cal(H)^0 \( I \) arrow.r 0 . $

The image in $L$ is nonzero: otherwise $K = cal(H)^(- 1) \( I \)$ belongs to both halves of the slope torsion pair
  and is zero, so the quotient is the whole line. The image therefore has rank one.
  It follows that $K$ is torsion-free, all its slopes lie in $\( b' \, ell \]$, and $r \( I \) = -
  r \( cal(H)^(- 1) \( I \) \)$. Classical Bogomolov–Gieseker on the slope factors gives $w_(B_0 + b' H) \( K \)
  lt.eq u d \( K \) \/ 2$. Since $r \( L \) = 1$, $d \( L \) = u$ and $2 w \( L \) = u^2 -
  delta_(upright("line"))$, subtraction gives

#[#set math.equation(numbering: n => "(6.16)")
 $ n \( I \) gt.eq frac(u d \( I \) - delta_(upright("line")) + a^2 r \( cal(H)^(- 1) \( I \) \), 2) .
   $ <eq:line-quotient-numerator>]

If $a^2 gt.eq delta_(upright("line"))$, every finite quotient slope is at least $u \/ 2$ when $r \( I \) < 0$,
  and at least $u \/ 2 - h delta_(upright("line")) \/ 2$ when $r \( I \) = 0$.
  For the latter assertion, $d \( I \) > 0$ lies in $h^(- 1) bb(Z)$, so $d \( I \) gt.eq 1 \/ h$.
  The whole line has slope

#[#set math.equation(numbering: n => "(6.17)")
 $ nu_(a \, b') \( L \) = u / 2 - frac(a^2 + delta_(upright("line")), 2 u) . $ <eq:line-whole-slope>]

Choose the positive integer $m_0$ so large that

$ m_0 - 1 > h delta_(upright("line")) \, wide \( m_0 - 1 \)^2 > A^2 + delta_(upright("line")) . $

At $\( A \, b \)$ all finite quotient slopes of $cal(O)_X \( m_0 H \)$ are then strictly positive.
  A nonzero map from this line to $E$ would have an image that is both such a quotient and a subobject of the
  slope-zero semistable $E$. A denominator-zero image is also excluded by finite-slope semistability.
  Thus, with $t_0 = - m_0$,

#[#set math.equation(numbering: n => "(6.18)")
 $ h^0 \( E \( t_0 \) \) = 0 \, wide h^0 \( P \( t_0 \) \) = 0 quad
   upright("in the positive-rank decomposition") . $ <eq:initial-section-vanishing>]

For the remaining estimates work at the side point

$ b_s = b - c \, wide a_s = sqrt(A^2 - c^2) \, wide B_s = B_0 + b_s H . $

Lemma 20 shows that $E$ is semistable there with slope $c$.
  Both triangles above remain short exact sequences in its tilt heart:
  the negative sheaf slopes are at most $b - A < b - c$, and the positive ones at least $b + A > b - c$.
  The numerical quantities $d \( P \) \, r \( P \) \, w \( P \)$ are still $O \( e \)$ after this bounded twist
  change. For any integer $t_0 lt.eq t lt.eq M$, the line $cal(O)_X \( - t H \)$ has $u = - t - b_s > 1$.
  Equations (6.16) and (6.17) provide a single lower bound $- C_1$ for all its finite tilt quotient slopes,
  uniformly in this finite range.

#thm([Lemma 6.4.])[
  #emph[Let $E in cal(B)_(H \, B_0 + b H)$ be finite-slope $nu_(A \, b)$-semistable with $nu_(A \, b) \( E \) =
    0$ and $\| b \| lt.eq 1$. Put $B = B_0 + b H$ and $e = d_B \( E \) - A \| r \( E \) \|$.
    Let $P$ be the residual term in (6.9) when $r \( E \) gt.eq 0$, or in (6.13) when $r \( E \) lt.eq 0$.
    Let $W subset "Hom" \( cal(O)_X \( - t H \) \, P \)$ be any finite-dimensional subspace, where $t_0 < t lt.eq
    M$ is an integer. There is a very general smooth $S in \| H \|$ in the fixed neighborhood,
    depending on this finite data, such that the image of
$ W arrow.r bb(H)^0 #scale(x: 120%, y: 120%)[\(] S \, P \|_S \( t \) #scale(x: 120%, y: 120%)[\)] $

 has dimension at most $C_2 e$. The constant is independent of $W$ and its dimension.]
] <lem:restriction-image>

#proof[
  Put $N = dim W$ and take the tilt image $I$ and kernel $K'$ of the evaluation map $cal(O)_X \( - t H \)^N
    arrow.r P$ at the side point. We first control the rank, first character,
    and $H$-degree of the second character of $I$ by $e$, independently of $N$.
    We then use the evaluation kernel, whose rank is close to $N$,
    to cancel all but $O \( e \)$ of the sections in the evaluation source.
    Ordinary cohomology gives a sheaf $K'$ and an exact sequence
  #[#set math.equation(numbering: n => "(6.19)")
   $ 0 arrow.r V_I arrow.r K' arrow.r cal(O)_X \( - t H \)^N arrow.r U_I arrow.r 0 \, wide V_I subset V_P \,
     $ <eq:section-evaluation-sheaves>]
  where $V_I = cal(H)^(- 1) \( I \)$, $U_I = cal(H)^0 \( I \)$ and $V_P = cal(H)^(- 1) \( P \)$.
    Since $I subset P$, $0 lt.eq d \( I \) lt.eq d \( P \) = O \( e \)$.
    The sheaf $U_I \( t \)$ is globally generated. Its first Chern class has nonnegative $H$-degree,
    including its divisorial torsion, and $H^2 B_0 = 0$; hence
  $ d \( U_I \) gt.eq u r \( U_I \) \, wide d \( V_I \) lt.eq 0 . $
  Thus $r \( U_I \) = O \( e \)$. The inclusion into $V_P$ gives $r \( V_I \) = O \( e \)$ as well.
  In the positive decomposition $I subset P subset E$, so $n \( I \) lt.eq c d \( I \)$.
    In the negative decomposition $P \/ I$ is a quotient of $E$ and satisfies $n \( P \/ I \) gt.eq
    c d \( P \/ I \)$, also when its denominator is zero. Additivity and the numerical bounds on $P$ therefore
    give $n \( I \) lt.eq O \( e \)$ in both cases.
  Every finite Harder–Narasimhan slope of $I$ is at least $- C_1$.
    Indeed, its last factor receives a nonzero map from one of the lines in the evaluation map.
    The tilt image of this map is a quotient of that line and a subobject of the last semistable factor;
    the line comparison forces the claimed lower bound. If the last factor has infinite slope there are no finite
    factors. Denominator-zero factors have nonnegative numerator. Writing $d_i \, n_i$ for the factors, we obtain
  $ sum_i \| n_i \| lt.eq n \( I \) + 2 C_1 d \( I \) = O \( e \) . $
  Lemma 18, applied at the fixed side volume and summed over the filtration, now gives
  $ parallel c_(B_s) \( I \) parallel + \| w_(B_s) \( I \) \| = O \( e \) . $
  The twist change to $I \( t \)$ is bounded. Its rank is $O \( e \)$ by (6.19), so
  #[#set math.equation(numbering: n => "(6.20)")
   $ parallel c_0 \( I \( t \) \) parallel + \| w_0 \( I \( t \) \) \| = O \( e \) . $ <eq:evaluation-image-numerics>]
  The sheaf $K' \( t \)$ is torsion-free and has rank $N + O \( e \)$.
    Before twisting it belongs to the positive part of the torsion pair,
    while (6.19) bounds its maximum slope by $- t$. Its slopes after twisting therefore lie in $\( - u \, 0 \]$.
    Its first and second characters are the negatives of those in (6.20).
    For its refined ordinary slope factors this proves
  #[#set math.equation(numbering: n => "(6.21)")
   $ sum_i r_i mu_i^2 + sum_i r_i delta_i^0 = O \( e \) . $ <eq:evaluation-kernel-moments>]
  In detail, the bounded nonpositive slope interval and the total degree $O \( e \)$ bound the first sum;
    subtracting the total $2 w_0$ bounds the second.
  The next step is to obtain almost as many sections of this kernel on a surface as the trivial evaluation source
    has. Its small first character and projected second character control the Riemann–Roch error;
    the same numerical bounds will control the cohomology lost from the negative term $V_I$.
  Choose a very general $S$ in the fixed neighborhood and a very general curve $C_m in \| m
    H \|_S$ in its fixed neighborhood. Impose also the finitely many open conditions that all the sheaf sequences
    and filtrations used here restrict exactly, with torsion-free restrictions where required.
    Such choices are possible by Lemma 23. Intersect the refined restriction filtrations of $K' \( t \)$ with
    $V_I \( t \)$. The successive intersections are subsheaves of the stable restriction factors and have total
    rank $O \( e \)$. By Lemma 22, the second slope moments on both $S$ and $C_m$ are $O \( e \)$.
    Applying Lemma 25 to the intersections, after the additional fixed twist $m$, yields
  #[#set math.equation(numbering: n => "(6.22)")
   $ h^0 #scale(x: 120%, y: 120%)[\(] V_I \|_S \( t + m \) #scale(x: 120%, y: 120%)[\)] +
     h^0 #scale(x: 120%, y: 120%)[\(] V_I \|_(C_m) \( t + m \) #scale(x: 120%, y: 120%)[\)] =
     O \( e \) . $ <eq:evaluation-negative-sections>]
  The reason this has no $N$ term is that each bound is a constant times the rank of the intersection plus its
    rank times $mu_(i \, +)^2$; its rank is at most $r_i$, and the second moments in (6.21) control the sum.
  We also have $h^2 \( K' \|_S \( t + m \) \) = O \( e \)$.
    A stable factor of $K' \( t \) \|_S$ with slope $mu_i > mu \( K_S \) -
    m$ has no homomorphism to $K_S \( - m \)$. For all the other factors, (6.6) gives $mu_i lt.eq - 1$,
    so their total rank, as well as their second slope moment, is $O \( e \)$.
    Serre duality and Lemma 25 applied to their dual hulls, twisted by $K_S \( - m \)$,
    bound their $h^2$ by $O \( e \)$. Surface Riemann–Roch and (6.20) give
  $ chi #scale(x: 120%, y: 120%)[\(] K' \|_S \( t + m \) #scale(x: 120%, y: 120%)[\)] =
    r \( K' \) chi \( cal(O)_S \( m \) \) + O \( e \) . $
  Indeed the error consists of $w_0 \( K' \( t \) \)$ and the intersection of $c_0 \( K' \( t \) \)$ with the
    fixed class $m H - K_S \/ 2$; here $K_S = \( K_X + H \) \|_S$. Consequently
  #[#set math.equation(numbering: n => "(6.23)")
   $ h^0 #scale(x: 120%, y: 120%)[\(] K' \|_S \( t + m \) #scale(x: 120%, y: 120%)[\)] gt.eq
     r \( K' \) h^0 \( cal(O)_S \( m \) \) - O \( e \) . $ <eq:kernel-many-sections>]
  Restrict the triangle $K' arrow.r cal(O)_X \( - t H \)^N arrow.r I$ and twist by $\( t + m \) H$.
    The kernel on $H^0$ from $K' \|_S \( t + m \)$ has dimension at most $h^(- 1) \( I \|_S \( t + m \) \) =
    h^0 \( V_I \|_S \( t + m \) \)$. Equations (6.22) and (6.23), with $r \( K' \) = N + O \( e \)$, therefore give
  $ & dim "im" #h(-0.16667em) (H^0 \( K' \|_S \( t + m \) \) arrow.r H^0 \( cal(O)_S \( m \) \)^N)\
 & #h(25mm)  gt.eq N h^0 \( cal(O)_S \( m \) \) - O \( e \) . $
  The source of the next map has dimension $N h^0 \( cal(O)_S \( m \) \)$.
    Subtracting the displayed lower bound shows that the image of
  $ H^0 \( cal(O)_S \( m \) \)^N arrow.r bb(H)^0 \( I \|_S \( t + m \) \) $
  has dimension $O \( e \)$. This is the cancellation which removes the unrestricted dimension $N$ from the estimate.
  It remains to remove the auxiliary twist $m$. Multiplication by the section defining $C_m$ gives a map from
    $bb(H)^0 \( I \|_S \( t \) \)$ to this latter group. Its kernel has dimension at most
    $h^(- 1) \( I \|_(C_m) \( t + m \) \)$, which is again $O \( e \)$ by (6.22).
    The image of $H^0 \( cal(O)_S \)^N$ in $bb(H)^0 \( I \|_S \( t \) \)$ consequently has dimension $O \( e \)$.
    Composing with $I arrow.r P$ proves the assertion for $W$.
    All equalities involving $h^(- 1)$ use derived restriction with nonzerodivisors on the ordinary cohomology
    sheaves; no exactness of a tilt-image operation under restriction was assumed. ◻
]

#thm([Corollary 6.5.])[
  #emph[Let $E in cal(B)_(H \, B_0 + b H)$ be finite-slope $nu_(A \, b)$-semistable with $nu_(A \, b) \( E \) =
    0$ and $\| b \| lt.eq 1$. Put $B = B_0 + b H$ and $e = d_B \( E \) - A \| r \( E \) \|$.
    For $r \( E \) gt.eq 0$, take $P$ from (6.9) and put $V_P = cal(H)^(- 1) \( P \)$.
    For $r \( E \) lt.eq 0$, use the decomposition (6.13) and put $V = cal(H)^(- 1) \( E \)$.
    There is a constant $C_3$, independent of $E \, b$, such that
#[#set math.equation(numbering: n => "(6.24)")
 $ h^0 \( P \( j \) \) & lt.eq C_3 e &  & upright("for the positive decomposition") \,\
h^0 \( E \( j \) \) & lt.eq C_3 e &  & upright("for the negative decomposition") . $ <eq:residual-sections>]

 Moreover
#[#set math.equation(numbering: n => "(6.25)")
 $ H^0 \( V_P \( j_2 \) \) & = 0 &  & upright("in the positive decomposition") \,\
H^0 \( V \( j_2 \) \) & = 0 &  & upright("in the negative decomposition") . $ <eq:negative-cohomology-vanishing>]

]
] <cor:residual-sections>

#proof[
  For the positive decomposition, apply Lemma 31 to all of $H^0 \( P \( t \) \)$ and the triangle $P \( t - 1 \)
    arrow.r P \( t \) arrow.r P \|_S \( t \)$. The increase in $h^0$ is at most the dimension of the restriction
    image, at most $C_2 e$. Telescope over the fixed set of integers $t_0 < t lt.eq j$, starting with (6.18).
  For the negative decomposition, apply the lemma to the image of $H^0 \( E \( t \) \)$ in $H^0 \( P \( t \) \)$.
    The kernel of
  $ bb(H)^0 \( E \|_S \( t \) \) arrow.r bb(H)^0 \( P \|_S \( t \) \) $
  has dimension at most $h^1 \( V_0 \|_S \( t \) \) = O \( e \)$ by (6.13) and (6.15).
    Thus the restriction image of $H^0 \( E \( t \) \)$ itself has dimension $O \( e \)$.
    Telescope the restriction triangle for $E$ from the same vanishing at $t_0$.
    Finally every slope of the negative cohomology sheaves in (6.25), after twisting by $j_2$, is at most $b - A +
    j_2 < 0$, by (6.7). They have no sections. ◻
]

=== 6.4 Fixed sheaves in positive characteristic <fixed-sheaves-in-positive-characteristic>

We have now obtained bounds involving only $e$ for the remainder and for an object of nonpositive rank.
  The positive tail $Q$ can have arbitrarily large rank even when $e$ is small.
  Its contribution will instead be bounded by a cubic expression in its narrow range of slopes.

Fix for the moment the individual object $E$. All sheaves, complexes, triangles,
  restriction maps and filtrations used for this $E$ can be spread to a finitely generated integral subring of
  $bb(C)$. Localize so that the varieties have smooth geometrically integral projective fibers,
  the finitely many coherent sheaves are flat, and the displayed sequences and cohomology sheaves commute with
  taking fibers. Finite perfect presentations on the smooth varieties justify the same assertion for the
  complexes. Upper semicontinuity preserves the finitely many bounds (6.24) and vanishings (6.25) after further
  localization. We do not require tilt semistability on the reductions.

We will require ordinary slope semistability for finitely many fixed sheaves on $X$, on chosen surfaces,
  and on chosen curves. For completeness, the needed spreading assertion and its Frobenius consequence are
  recorded next.

#thm([Lemma 6.6.])[
  #emph[Let $G$ be a slope-semistable torsion-free sheaf on a smooth projective complex variety $Y$ with a fixed
    very ample class. There is a model and a localization on which the geometric fibers of $G$ are torsion-free
    and slope-semistable. Finitely many such requirements may be imposed simultaneously.]
] <lem:fixed-sheaf-spreading>

#proof[
  Embed $G$ in $cal(O)_Y \( u \)^k$ by choosing generators for a twist of its dual and using the injection $G
    arrow.r G^(* *)$. Spread this injection and make its cokernel flat, so it remains an injection on the fibers.
    We describe a finite-type set containing every destabilizing saturated subsheaf on every geometric fiber.
  For a saturated subsheaf $J$ of rank $s$, $0 < s < r \( G \)$,
    its generic Plücker coordinates extend across codimension two to sections of
    $cal(O)_Y \( s u \) ⊗ \( det J \)^(- 1)$. If $J$ destabilizes,
    the degree of the zero divisor of a nonzero coordinate is bounded above by a number depending only on $u \,
    s$ and the degree of $G$. An effective divisor of degree at most $d_0$ is contained, with its multiplicities,
    in the zero divisor of a section of $cal(O)_Y \( v \)$ with $v lt.eq max \( 1 \, d_0 \)$.
    To see this, choose a finite linear projection to projective space of dimension $dim Y$.
    Each prime component has hypersurface image of degree at most its own degree.
    Pull back an equation for each such image and multiply with the required multiplicities.
    The projection is finite because its pullback of $cal(O) \( 1 \)$ is ample.
  Divide the Plücker tuple by one nonzero coordinate, then multiply by this section to clear its pole divisor.
    Normality extends the resulting tuple to global sections of $cal(O)_Y \( v \)$.
    The saturated subsheaf $J$ is the kernel, inside $G$, of wedging with this tuple,
    viewed as a map to a fixed sum of $cal(O)_Y \( u + v \)$:
    the kernels agree at the generic point and are saturated.
    The finitely many possible values of $s \, v$ give finite-type spaces of tuples after shrinking the base so
    that their section spaces commute with base change. On each parameter space,
    flatten the cokernel of the universal wedge map. The kernel then commutes with taking fibers,
    and its rank and degree are constructible, as read from its Hilbert polynomial.
    Hence the condition that some tuple gives a kernel of smaller positive rank and larger slope than $G$ is
    constructible on the base. Allowing tuples not satisfying the Plücker equations does not cause a problem:
    a kernel with those numerical properties is itself a destabilizing subsheaf.
  This constructible subset excludes the generic point. Otherwise a destabilizer over its algebraic closure would
    extend to one over $bb(C)$. A constructible subset of an integral noetherian scheme whose closure is the whole
    scheme contains a nonempty open set and hence the generic point.
    Its closure is therefore proper; removing that closure proves the assertion. ◻
]

#thm([Lemma 6.7.])[
  #emph[On a smooth projective geometric fiber in characteristic $p$,
    let $G$ be a slope-semistable torsion-free sheaf of rank $r$.
    For a constant $c_Y$ fixed by the chosen model of $Y$ and its polarization,
#[#set math.equation(numbering: n => "(6.26)")
 $ mu_max \( F^(*) G \) lt.eq p mu \( G \) + c_Y \( r - 1 \) . $ <eq:frobenius-slope-gap>]

]
] <lem:frobenius-slope-gap>

#proof[
  We use the Cartier-descent argument of #cite(label("Langer2022")) Theorem 4.1 and Proposition 4.2,
    keeping the chosen cotangent twist in the slope normalization.
    Generation of a fixed positive twist of the tangent bundle gives an embedding $Omega_Y^1 arrow.r.hook
    cal(O)_Y \( c_Y \)^k$ with locally free cokernel. It can be chosen on the model and retained on its fibers.
    Frobenius is finite flat because the fiber is smooth over a perfect field.
  Suppose two consecutive Harder–Narasimhan slopes of $F^(*) G$ differ by more than $c_Y$.
    For the truncation $J$ above that gap, the second fundamental map for the canonical connection is
  $ J arrow.r \( F^(*) G \/ J \) ⊗ Omega_Y^1 . $
  It is $cal(O)_Y$-linear. Its source has minimum slope larger than the maximum slope of its target,
    the latter bounded using the displayed embedding, so the map is zero. The connection thus preserves $J$.
    The canonical connection has zero $p$-curvature, as does its restriction to $J$.
    Cartier descent therefore descends this inclusion to a subsheaf of the Frobenius twist of $G$.
    Its slope is $mu \( J \) \/ p > mu \( G \)$, contradicting semistability.
    Here the Frobenius twist of the algebraically closed base field is an automorphism and does not change the
    slope assertion. Thus no adjacent gap is greater than $c_Y$.
    There are at most $r$ factors, so the maximum slope is at most the mean plus $c_Y \( r - 1 \)$, as claimed. ◻
]

The localizations above concern finitely many fixed sheaves, after $E$ has been chosen.
  The resulting base still has geometric closed fibers in unbounded prime characteristics:
  its constructible image in $"Spec" bb(Z)$ contains the generic point and hence a nonempty open set.
  Very-generality was used only to choose the original complex divisors; it is not asserted for their reductions.

=== 6.5 The tail and the Frobenius limit <the-tail-and-the-frobenius-limit>

Suppose $r \( E \) gt.eq 0$ and use (6.9). For every stable ordinary slope factor $G$ of $Q$,
  choose a very general smooth $S in \| H \|$ and a very general $C in \| H \|_S$,
  imposing all required exactness conditions. Refine $G \|_S$ into stable factors $G_i$ and their restrictions to
  $C$ into stable factors $G_(i j)$. These curves, which serve only in the present algebraic argument,
  need not belong to the neighborhoods used for the analytic estimates. Lemma 22 twice gives, with $mu = mu \( G \)$,

#[#set math.equation(numbering: n => "(6.27)")
 $ sum_(i \, j) r_(i j) \( mu_(i j) - mu \)^2 lt.eq 3 r \( G \) delta_G^B . $ <eq:twice-restricted-variance>]

Indeed the first variance is at most $r \( G \) delta_G^B$.
  The sum of $r_i delta_i^B$ on $S$ equals $r \( G \) delta_G^B$ plus that variance,
  so is at most $2 r \( G \) delta_G^B$; apply the restriction estimate once more and add the two variances.
  The weighted means are preserved at each step. Spread this finite data and apply Lemma 33 to $G \, G_i \, G_(i j)$.

Since $H^2 D = 0$, the normalized slope shift of $L_p$ on $X \, S \, C$ is $- p b + O \( 1 \)$,
  with a bounded rounding error. Frobenius commutes with these restrictions,
  and its flatness preserves their exact filtrations. In the following estimates an $O_G$ constant may depend on
  all the fixed data chosen for $G$, but not on $p$ or on the fiber.
  In particular the ranks in the Frobenius slope error are now fixed, so they may enter these constants.
  They must not enter the coefficients which survive division by $p^3$. Lemma 34 gives a vanishing twist

$ k_X = - p \( mu - b \) + O_G \( 1 \) \, wide H^0 \( F^(*) G ⊗ L_p \( k_X \) \) = 0 \, $

where the bounded integer adjustment is chosen to make the maximum slope negative.
  Telescope from $k_X$ to zero using the surface restriction sequence.
  At each integer $k$ in this interval, bound the surface sections by those of its factors $G_i$.
  For each such factor telescope on $S$ from its own vanishing twist $- p \( mu_i - b \) + O_G \( 1 \)$ up to $k$,
  if $k$ exceeds that twist.

On $C$, the $H$-degree is $h$. Taking successive jets at a point until the maximum ordinary degree slope is
  negative, and using (6.26), gives for every factor

#[#set math.equation(numbering: n => "(6.28)")
 $ h^0 \( F^(*) G_(i j) ⊗ L_p \( l \) \) lt.eq h r_(i j) #scale(x: 120%, y: 120%)[\(] p \( mu_(i j) - b \) +
   l #scale(x: 120%, y: 120%)[\)]_(+) + O_G \( 1 \) . $ <eq:curve-ramp-bound>]

The error includes the integer rounding and at most a bounded number of point jets, each of dimension $r_(i j)$;
  all ranks here are fixed before $p$ varies. Each surface telescope has only $O_G \( p \)$ terms in the range
  under consideration. Summing the ramp in (6.28), and enlarging the sum down to all its positive terms when
  necessary, gives

#[#set math.equation(numbering: n => "(6.29)")
 $ h^0 \( F^(*) G \|_S ⊗ L_p \( k \) \) & lt.eq frac(h p^2, 2) sum_(i \, j)
   r_(i j) \( mu_(i j) - b + k \/ p \)_(+)^2 + O_G \( p \)\
 & lt.eq frac(h p^2, 2) #scale(x: 120%, y: 120%)[\[] r \( G \) \( mu - b + k \/ p \)_(+)^2 +
   3 r \( G \) delta_G^B #scale(x: 120%, y: 120%)[\]] + O_G \( p \) . $ <eq:surface-square-bound>]

For the second inequality use $x_(+)^2 lt.eq y_(+)^2 + 2 y_(+) \( x - y \) + \( x - y \)^2$ and the vanishing of
  the weighted first displacement from the mean, followed by (6.27).
  The ramp sum differs from the corresponding half-square by $O_G \( p \)$, uniformly for the indices used above.

The outer telescope has length $p \( mu - b \) + O_G \( 1 \) lt.eq \( A + 1 \) p + O_G \( 1 \)$.
  Summing (6.29) and using the Riemann sum for the square on $\[ - \( mu - b \) \, 0 \]$ gives the following
  bound. Here and below, limits are taken along geometric fibers of the chosen model,
  after all the specified localizations, with characteristics $p$ tending to infinity:

#[#set math.equation(numbering: n => "(6.30)")
 $ limsup_(p arrow.r oo) p^(- 3) h^0 \( F^(*) G ⊗ L_p \) lt.eq frac(h r \( G \), 6) \( mu - b \)^3 +
   C_A h r \( G \) delta_G^B . $ <eq:tail-factor-frobenius>]

The summed $O_G \( p \)$ errors are $O_G \( p^2 \)$ and vanish in this limit.
  One may take a fixed multiple of $A + 1$ for $C_A$; it does not depend on the restriction sheaves or their
  ranks. Summing over the finite filtration of $Q$, using (6.11), gives

#[#set math.equation(numbering: n => "(6.31)")
 $ limsup_(p arrow.r oo) p^(- 3) h^0 \( F^(*) Q ⊗ L_p \) lt.eq frac(h A^2, 6) d_B \( Q \) +
   O \( e \) . $ <eq:tail-frobenius>]

To verify its leading term, write $mu - b = A + s$, $0 lt.eq s lt.eq 1$.
  Then $\( A + s \)^3 - A^2 \( A + s \) lt.eq C_A s$, and $sum r_i s_i lt.eq e$ by (6.8).

It remains to bound the residual contribution and the positive even cohomology group in degree two.
  Let $P_1$ be the positive residual $P$ or a nonpositive-rank object treated by the negative decomposition.
  It has ordinary cohomology in degrees $\[ - 1 \, 0 \]$, and (6.25) supplies the vanishing required in
  Corollary 30. That corollary and (6.24) give, for either rounding line $L$,

#[#set math.equation(numbering: n => "(6.32)")
 $ h^0 \( F^(*) P_1 ⊗ L \) lt.eq N_(p \, L) h^0 \( P_1 \( j \) \) lt.eq C_4 p^3 e . $ <eq:residual-frobenius>]

The characteristic-zero section bounds pass to these fibers by the finite semicontinuity conditions already imposed.

Apply Lemma 21 to $E$:

#[#set math.equation(numbering: n => "(6.33)")
 $ tilde(E) arrow.r R cal(H) o m \( E \, cal(O)_X \) \[ 1 \] arrow.r T_0 \[ - 1 \] \, $ <eq:apex-duality-triangle>]

where $T_0$ is zero-dimensional and $tilde(E)$ is finite-slope semistable of slope zero at $\( A \, - B \)$.
  Its rank is $- r \( E \)$, its denominator is $d \( E \)$, its excess is $e$, and $z_(- B) \( tilde(E) \) =
  z_B \( E \) + "length" \( T_0 \) \/ h$. Include this triangle and the negative decomposition for $tilde(E)$ in
  the fixed spreading data. Serre duality, flatness of $F$, and (6.33) give

#[#set math.equation(numbering: n => "(6.34)")
 $ h^2 \( F^(*) E ⊗ L_p \) = h^0 \( F^(*) tilde(E) ⊗ L'_p \) lt.eq C_4 p^3 e . $ <eq:degree-two-frobenius>]

For clarity, Serre duality first identifies the dual of the degree-two group with degree zero of $F^(*) R cal(H) o
  m \( E \, cal(O)_X \) \[ 1 \] ⊗ L'_p$. The term $F^(*) T_0 \[ - 1 \] ⊗
  L'_p$ has zero hypercohomology in degrees $- 1$ and $0$, so it does not alter that group.

The complex $F^(*) E ⊗ L_p$ has hypercohomology in degrees $\[ - 1 \, 3 \]$.
  The only even degrees in this interval are zero and two, whence

$ chi \( F^(*) E ⊗ L_p \) lt.eq h^0 \( F^(*) E ⊗ L_p \) + h^2 \( F^(*) E ⊗ L_p \) . $

The degree-zero group is bounded above by the sum of the corresponding groups for $P$ and $Q$ in (6.9).
  Equations (6.31), (6.32) and (6.34) therefore imply

#[#set math.equation(numbering: n => "(6.35)")
 $ limsup_(p arrow.r oo) p^(- 3) chi \( F^(*) E ⊗ L_p \) lt.eq frac(h A^2, 6) d_B \( Q \) +
   C_5 e . $ <eq:euler-frobenius-bound>]

Riemann–Roch identifies the limit on the left:

#[#set math.equation(numbering: n => "(6.36)")
 $ lim_(p arrow.r oo) p^(- 3) chi \( F^(*) E ⊗ L_p \) = h z_B \( E \) . $ <eq:rr-frobenius-limit>]

Here is a way to compare varying characteristics without identifying their cohomology rings.
  On a smooth fiber, $"ch"_i \( F^(*) E \) = p^i "ch"_i \( E \)$ by the splitting principle.
  The same formula holds for the Adams class $psi^p \[ E \]$ in vector-bundle $K$-theory.
  Riemann–Roch thus identifies the Euler characteristic in (6.36) with that of $psi^p \[ E \] ⊗ L_p$.
  This class is defined by exterior-power operations on a fixed perfect presentation and commutes with
  specialization. Its Euler characteristic is constant from the model to the complex fiber.
  On that fiber, write $c_1 \( L_p \) = - p B + R_p$, where $R_p$ remains in a fixed bounded set of divisor
  classes. The degree-three leading term of

$ integral_X (sum_(i = 0)^3 p^i "ch"_i \( E \)) e^(- p B + R_p) "td" \( X \) $

is $p^3 "ch"_3^B \( E \)$; all other terms are $O_E \( p^2 \)$. This proves (6.36), without a condition on $K_X$.

Combining (6.35) and (6.36), and using $d_B \( Q \) lt.eq d_B \( E \)$, proves (6.1) for $r \( E \) gt.eq 0$.
  The surviving constants came only from the fixed regularity,
  surface estimates and the interval $\[ A \, A + 1 \]$; every constant depending on the individual spread sheaves
  occurred in an error of order at most $p^2$ and disappeared after division by $p^3$.
  This establishes the asserted order of quantifiers.

If $r \( E \) < 0$, apply the just-proved case to $tilde(E)$ in (6.33), which has positive rank.
  Its $d$ and $e$ agree with those of $E$, and its third character is at least $z_B \( E \)$.
  The estimate for $tilde(E)$ therefore implies the estimate for $E$.
  Our constants were chosen for both signs of $B_0$, so this use of the mirror parameters costs nothing.
  Finally undo the integral tensor normalization of $b$. This completes the proof of Proposition 28.

== 7 From one apex to uniform inequalities <sec:wall>

The fixed-apex estimate now supplies the global inequality. The mechanism is numerical:
  a differential inequality preserves a strict violation as the volume parameter moves toward the apex.
  If an object becomes strictly semistable, one continues with a violating stable factor.
  A discrete discriminant makes this process finite. Transport along a zero-slope hyperbola and induction on the
  discriminant appear in #cite(label("BMS2016")) Section 5 and, for a corrected inequality,
  #cite(label("BMSZ2017")) Lemma 2.7. Here the terminal estimate is at a fixed positive volume $A$.
  The comparison functions below turn that estimate into an all-volume correction and an uncorrected tail.

=== 7.1 A transport principle <a-transport-principle>

At slope zero define the defect and the nonnegative comparison quantity

#[#set math.equation(numbering: n => "(7.1)")
 $ D_a \( E \) = z_b \( E \) - frac(a^2 d_b \( E \), 6) \, wide S_a \( E \) = frac(Delta \( E \), d_b \( E \)) =
   d_b \( E \) - frac(a^2 r \( E \)^2, d_b \( E \)) . $ <eq:wall-defect>]

They are defined whenever $d_b \( E \) > 0$ and $w_b \( E \) = a^2 r \( E \) \/ 2$.
  In particular $0 lt.eq S_a lt.eq d_b$ for a semistable object.

#thm([Proposition 7.1.])[
  (Transport from a fixed apex).  #emph[Fix a smooth projective complex threefold $X$,
    an integral ample class $H$, and $B_0 in N^1 \( X \)_(bb(Q))$.
    Suppose that there are $A > 0$ and $C gt.eq 0$ such that every finite-slope tilt-semistable object of slope
    zero at $\( A \, b \)$, for every $b in bb(R)$, satisfies
#[#set math.equation(numbering: n => "(7.2)")
 $ D_A \( E \) lt.eq C S_A \( E \) . $ <eq:wall-apex-input>]

 Then, with
#[#set math.equation(numbering: n => "(7.3)")
 $ R_0 = A + frac(3 C, A) \, wide k_0 = max {C + A^2 / 6 \, frac(C R_0, A)} \, $ <eq:wall-constants>]

 every finite-slope tilt-semistable object of slope zero at $\( a \, b \)$ satisfies $D_a \( E \) lt.eq
   k_0 d_b \( E \)$ for all $a > 0 \, b in bb(R)$, and $D_a \( E \) lt.eq 0$ whenever $a > R_0$.]
] <prop:apex-transport>

#proof[
  We first compute along the slope-zero curve of a fixed class. Its positive-denominator branch is
  #[#set math.equation(numbering: n => "(7.4)")
   $ d \( a \) = sqrt(Delta + a^2 r^2) \, wide b \( a \) = frac(d_(B_0) - d \( a \), r) quad \( r eq.not 0 \) .
     $ <eq:zero-branch>]
  For rank zero, $d$ and $b$ remain constant. If the branch starts at a semistable object, then $Delta gt.eq 0$,
    and its denominator stays positive at every positive $a$.
    Indeed $d \( a \) gt.eq a \| r \|$ when $r eq.not 0$, whereas $d$ is a positive constant when $r = 0$.
    The identities $d z_b \/ d b = - w_b$ and $w_b = a^2 r \/ 2$ give
  #[#set math.equation(numbering: n => "(7.5)")
   $ D'_a = - a / 3 S_a \, wide S'_a = - frac(a r^2, d \( a \)^2) S_a . $ <eq:wall-derivatives>]
  For example, when $r eq.not 0$ one has $d' = a r^2 \/ d$, $b' = - a r \/ d$, and $z' = a^3 r^2 \/ \( 2 d \)$;
    these give both equalities directly. The rank-zero case follows from the definitions.
    For a differentiable nonnegative function $k$, therefore,
  #[#set math.equation(numbering: n => "(7.6)")
   $ \( D_a - k \( a \) S_a \)' = S_a (- a / 3 - k' \( a \) + k \( a \) frac(a r^2, d \( a \)^2)) .
     $ <eq:wall-comparison-derivative>]
  There are three comparisons. For the corrected bound below $A$, take $k \( a \) =
    C + \( A^2 - a^2 \) \/ 6$ and move upward toward $A$. The right side of (7.6) is $k \( a \) a r^2 S_a \/
    d \( a \)^2 gt.eq 0$, so a strict violation persists upward.
    To rule out positive defect at a starting value $R > R_0$, take $k \( a \) =
    a \( R - a \) \/ 3$ on $\[ A \, R \]$ and move downward. Since $a r^2 \/ d \( a \)^2 lt.eq 1 \/ a$,
  $ - a / 3 - k' \( a \) + k \( a \) frac(a r^2, d \( a \)^2) lt.eq - a / 3 - k' \( a \) + frac(k \( a \), a) = 0 . $
  A strict violation again persists in the direction of movement.
    Here $k \( R \) = 0$ and $k \( A \) = A \( R - A \) \/ 3 > C$.
    For the corrected bound in the remaining interval, on any interval $\[ A \, R \]$ use $k \( a \) =
    C a \/ A$ and move downward. The same upper bound for the last term gives a derivative at most $-
    a S_a \/ 3 lt.eq 0$, and $k \( A \) = C$.
  Each comparison preserves a strict violation while the class remains stable.
    We next show how to continue through a change of stability,
    with a strict decrease of a discrete discriminant at each replacement.
    For an equal-slope-zero filtration with stable factors $E_i$, all $d_i$ are positive and $w_i = a^2 r_i \/ 2$.
    Additivity and weighted Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(7.7)")
   $ D_a \( E \) = sum_i D_a \( E_i \) \, wide S_a \( E \) = sum_i d_i -
     a^2 frac(\( sum_i r_i \)^2, sum_i d_i) gt.eq sum_i S_a \( E_i \) . $ <eq:wall-additivity>]
  Thus a strict inequality $D_a \( E \) > k \( a \) S_a \( E \)$, with $k \( a \) gt.eq 0$,
    passes to at least one stable factor. Such a factorization is finite by Lemma 19.
  Start with a violating stable factor and follow its branch (7.4) toward $A$ as long as it remains stable.
    Stability is open. At an endpoint in the positive $a$-interval,
    continuity of extremal phases gives semistability, since the formal denominator remains positive.
    The strict violation persists at the endpoint: along the movement $D -
    k S$ is at least its initial positive value. If the endpoint is $A$, this contradicts (7.2).
    Otherwise the endpoint is nonstable, since stability there would extend the interval,
    and we split again and select a violating stable factor.
  At every such genuine wall, the discriminant of each factor is strictly smaller than that of its parent. Indeed,
  #[#set math.equation(numbering: n => "(7.8)")
   $ Delta \( E \) = sum_i Delta \( E_i \) + 2 sum_(i < j) \( d_i d_j - a^2 r_i r_j \) . $ <eq:wall-discriminant-split>]
  Every term is nonnegative because $d_i gt.eq a \| r_i \|$.
    If all cross terms vanished, all $r_i$ would be nonzero with the same sign and $d_i = a \| r_i \|$;
    hence all factors would have $Delta \( E_i \) = 0$ and proportional triples $\( r_i \, d_i \, w_i \)$.
    Twisting preserves this proportionality. Openness keeps the finitely many stable factors stable near the wall,
    so their fixed extension triangles make $E$ an extension of objects with equal finite slope immediately before
    the wall as well. The filtration has at least two factors, so this contradicts the preceding stability of $E$.
    Some cross term in (7.8) is therefore positive, and every factor has smaller discriminant.
  Because $B_0$ is rational, formula (4.8) puts all these discriminants in $N^(- 1)
    bb(Z)$ for one positive integer $N$ depending only on $X \, H \, B_0$.
    They are nonnegative on the semistable factors. Strict descent consequently permits only finitely many wall
    splits. This also excludes an accumulating sequence of walls with changing factors:
    every change consumes at least $1 \/ N$ of discriminant, and every final stable interval either reaches $A$ or
    has an interior semistable endpoint at which another such split is necessary.
    There is no denominator-zero endpoint inside the interval, by (7.4).
    The proposed violation must therefore reach $A$, giving a contradiction in each of the three comparisons.
  The first comparison proves $D_a lt.eq \( C + \( A^2 - a^2 \) \/ 6 \) S_a$ for $0 < a lt.eq A$.
    The second proves $D_a lt.eq 0$ for $a > R_0$. The third proves $D_a lt.eq \( C a \/ A \) S_a$ for $A lt.eq
    a lt.eq R_0$. Finally use $S_a lt.eq d_b$ and (7.3). ◻
]

=== 7.2 The corrected inequality and the uncorrected tail <the-corrected-inequality-and-the-uncorrected-tail>

#proof[
  First use the very-ample and transverse-twist reductions of Section 4.
    Proposition 28 supplies $A > 0$ and $C gt.eq 0$, chosen independently of $E$ and $b$, such that
  $ D_A \( E \) lt.eq C #scale(x: 120%, y: 120%)[\(] d_B \( E \) - A \| r \( E \) \| #scale(x: 120%, y: 120%)[\)] . $
  At slope zero put $e = d_B - A \| r \|$. Since $d_B gt.eq A \| r \|$,
  $ S_A = frac(\( d_B - A \| r \| \) \( d_B + A \| r \| \), d_B) \, wide e lt.eq S_A lt.eq 2 e . $
  The hypothesis of Proposition 35 follows. Multiplying its conclusion by $h$ gives
  $ "ch"_3^B \( E \) lt.eq a^2 / 6 H^2 "ch"_1^B \( E \) + k_0 H^2 "ch"_1^B \( E \) \, $
  and gives the same inequality without the correction for $a > R_0$.
    Undo the polarization rescaling as described in Section 4.
    This gives constants $k gt.eq 0$ and $R_(*) > 0$ for the original $X \, H \, B_0$, uniform in both $E$ and $b$.
  Enlarge $k$ to a rational nonnegative number. The curve class $Gamma =
    k H^2 in N_1 \( X \)_(bb(Q))$ then satisfies $Gamma dot.op H = k h gt.eq 0$,
    and the correction is exactly $Gamma dot.op "ch"_1^B \( E \)$.
    This proves the corrected statement with its required rational class,
    as well as the independent uncorrected large-volume threshold.
    No canonical-bundle hypothesis has entered either argument. ◻
]

=== 7.3 The quadratic inequality at every slope <the-quadratic-inequality-at-every-slope>

We finish by expressing the uncorrected tail in the alternative coordinates used for generalized
  Bogomolov–Gieseker inequalities. Here $B_0 = 0$ and

$
  v \( E \) = \( v_0 \, v_1 \, v_2 \, v_3 \) = \( H^3 "ch"_0 \( E \) \, H^2 "ch"_1 \( E \) \, H "ch"_2 \( E \) \,
  "ch"_3 \( E \) \) . $

For $alpha > beta^2 \/ 2$, the first tilt is $cal(B)_(H \, beta H)$ and its slope is

#[#set math.equation(numbering: n => "(7.9)")
 $ hat(nu)_(alpha \, beta) \( E \) =
   frac(v_2 \( E \) - beta v_1 \( E \) + \( beta^2 - alpha \) v_0 \( E \), v_1 \( E \) - beta v_0 \( E \)) \,
   $ <eq:alternative-slope>]

with value $+ oo$ at zero denominator. Define

#[#set math.equation(numbering: n => "(7.10)")
 $ Q_(alpha \, beta) \( v \) = alpha \( v_1^2 - 2 v_0 v_2 \) + beta \( 3 v_0 v_3 - v_1 v_2 \) + 2 v_2^2 -
   3 v_1 v_3 . $ <eq:quadratic-form>]

Thus no correction of any character is being incorporated into $v$.

#proof[
  Take the threshold of Theorem 2 with $B_0 = 0$. Set $b = beta$ and $a = sqrt(2 alpha - b^2)$.
    The numerator in (7.9) is $h \( w_b - a^2 r \/ 2 \)$ and its denominator is $h d_b$,
    so its slope is exactly $nu_(a \, b)$. Expanding (7.10) with (4.2)–(4.2) gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ frac(Q_(alpha \, b) \( v \( E \) \), h^2) = frac(a^2 Delta \( E \), 2) + 2 w_b \( E \)^2 -
     3 d_b \( E \) z_b \( E \) . $ <eq:quadratic-twisted>]
  If $d_b \( E \) = 0$, this is nonnegative by (4.9); it includes zero-dimensional objects.
  Otherwise put $u = nu_(a \, b) \( E \)$, $c = b + u$, and $R = sqrt(a^2 + u^2)$.
    Lemma 20 makes $E$ semistable of slope zero at $\( R \, c \)$, with $d_c > 0$. Using $w_b = u d_b + a^2 r \/ 2$,
  $ d_c = d_b - u r \, wide z_c = z_b - u w_b + 1 / 2 u^2 d_b - 1 / 6 u^3 r $
  in (7.11) gives the exact identity
  #[#set math.equation(numbering: n => "(7.12)")
   $ frac(Q_(alpha \, b) \( v \( E \) \), h^2) = - 3 d_b \( E \) (z_c \( E \) - frac(R^2 d_c \( E \), 6)) .
     $ <eq:quadratic-zero-slope-identity>]
  Since $alpha > f \( b \)$ implies $R gt.eq a > R_(*)$, the expression in parentheses is nonpositive by the
    uncorrected tail. This proves the claim. The passage uses the entire semistability arc and the inequality $R
    gt.eq a$; an all-parameter equivalence alone would not justify a conclusion on this truncated region. ◻
]

== 8 Comparison with the known counterexamples <sec:counterexamples>

The uncorrected strong inequality fails at small volume, even on Calabi–Yau threefolds.
  We record the parameters of two established counterexamples and then give a uniform estimate for sheaves on
  their exceptional surfaces. Throughout this section, the volume parameter is $a$ in the ordinary tilt slope
  $nu_(a \, b)$; the physical volume is $t = sqrt(3) a$.

=== 8.1 A line bundle and a contracted divisor <a-line-bundle-and-a-contracted-divisor>

Let $X = "Bl"_p bb(P)^3$, let $L$ be the pulled-back hyperplane class, and let $E$ be the exceptional divisor.
  Fix $H = 2 L - E$ and $B_0 = 0$. The intersection identities $L^3 = E^3 = 1$, $L E = 0$, and $H^3 = 7$ give

$ #scale(x: 120%, y: 120%)[\(] H^3 "ch"_0 \, H^2 "ch"_1 \, H "ch"_2 \,
  "ch"_3 #scale(x: 120%, y: 120%)[\)] \( cal(O)_X \( L \) \) = (7 \, 4 \, 1 \, 1 / 6) . $

For the conventional quadratic expression

$ cal(Q)_(a \, b) \( F \) = a^2 #scale(x: 120%, y: 120%)[\(] \( H^2 "ch"_1 \( F \) \)^2 -
  2 H^3 "ch"_0 \( F \) H "ch"_2 \( F \) #scale(x: 120%, y: 120%)[\)] + 4 \( H "ch"_2^(b H) \( F \) \)^2 -
  6 H^2 "ch"_1^(b H) \( F \) "ch"_3^(b H) \( F \) \, $

direct expansion yields

#[#set math.equation(numbering: n => "(8.1)")
 $ cal(Q)_(a \, b) \( cal(O)_X \( L \) \) = 2 (a^2 + (b - 1 / 4)^2 - 1 / 16) . $ <eq:schmidt-disk>]

Schmidt proves that actual tilt-stable points occur in the negative region of (8.1) #cite(label("Schmidt2017"))
  Theorem 3.1. All these violations have $a < 1 \/ 4$. On the positive-denominator zero-slope branch one has,
  more explicitly,

$ a^2 = b^2 - 8 / 7 b + 2 / 7 \, wide b < frac(4 - sqrt(2), 7) \, wide "ch"_3^(b H) \( cal(O)_X \( L \) \) - a^2 /
  6 H^2 "ch"_1^(b H) \( cal(O)_X \( L \) \) = frac(4 b - 1, 42) . $

These formulas use the same ordinary characters and normalization as the strong inequality.

For an integral effective divisor $D subset X$, still with $B_0 = 0$, the identity $"ch" \( cal(O)_D \) = 1 -
  e^(- D)$ shows that its unique zero-slope line and its defect there are

#[#set math.equation(numbering: n => "(8.2)")
 $ b_0 & = - frac(H D^2, 2 H^2 D) \,\
"ch"_3^(b_0 H) \( cal(O)_D \) - a^2 / 6 H^2 D & = D^3 / 6 - frac(\( H D^2 \)^2, 8 H^2 D) - a^2 /
  6 H^2 D . $ <eq:divisor-counterexample>]

The wall-radius argument in #cite(label("MartinezSchmidt2019")) Lemma 3.1 and its proof gives semistability on
  this line for $a gt.eq H^2 D \/ \( 2 H^3 \)$, and stability for the strict inequality in our
  subobject-versus-quotient convention. Indeed, every positive-rank wall has radius at most this bound,
  while a proper rank-zero subobject of $cal(O)_D$ is a subsheaf with quotient supported in dimension at most one,
  hence of infinite tilt slope.

Suppose now that $D$ contracts to a point, $- D$ is relatively ample, and $H = M L - D$,
  where $L$ is the pullback of an ample divisor and $M$ is sufficiently large. Put $s = D^3 > 0$.
  Since $L D = 0$, one has $H^2 D = s$ and $H D^2 = - s$. Formula (8.2) becomes

#[#set math.equation(numbering: n => "(8.3)")
 $ b_0 = 1 / 2 \, wide "ch"_3^(b_0 H) \( cal(O)_D \) - a^2 / 6 H^2 D = s (1 / 24 - a^2 / 6) . $ <eq:contracted-defect>]

Thus, when $H^3 > s$, the interval $s \/ \( 2 H^3 \) < a < 1 \/ 2$ consists of stable counterexamples.
  The polarization, including $M$, is fixed in this assertion.
  Tensoring by $cal(O)_X \( k H \)$ translates $b$ by $k$ and preserves the twisted characters and $a$;
  it gives counterexamples with unbounded $b$, but with the same bounded volume interval.

=== 8.2 A uniform estimate on the reduced exceptional surface <a-uniform-estimate-on-the-reduced-exceptional-surface>

The same upper bound on the violating volume applies to sheaves of arbitrary rank on a smooth reduced exceptional
  surface, whenever their pushforwards are tilt-semistable.
  The following statement also allows twists transverse to the polarization.

#thm([Lemma 8.1.])[
  #emph[Let $X$ be a smooth projective complex threefold, let $H$ be an ample integral divisor, and let $i :
    D arrow.r.hook X$ be a smooth integral divisor such that $H \|_D = - D \|_D$.
    Fix $B_0 in N^1 \( X \)_(bb(Q))$, and set $B = B_0 + b H$.
    If $F$ is a torsion-free sheaf of positive rank on $D$ and $i_(*) F$ is $nu_(a \, b)$-semistable of slope zero, then
#[#set math.equation(numbering: n => "(8.4)")
 $ frac("ch"_3^B \( i_(*) F \), H^2 "ch"_1^B \( i_(*) F \)) lt.eq 1 / 24 . $ <eq:exceptional-uniform>]

 Consequently these objects satisfy the corrected strong inequality with $Gamma = H^2 \/ 24$ for every $a > 0$,
   and the uncorrected strong inequality for every $a gt.eq 1 \/ 2$.
   Both constants are independent of $F$, its rank, and $b$.]
] <lem:exceptional-surface-bound>

#proof[
  Write $ell = H \|_D$, $s = ell^2 = D^3 > 0$, $rho = "rk" \( F \)$, and $C = B_0 \|_D$. Put
  $ u = "ch"_1^C \( F \) \, wide v = "ch"_2^C \( F \) \, wide mu = frac(ell u, rho s) \, wide delta = mu^2 -
    frac(2 v, rho s) . $
  Every exact sequence of sheaves on $D$ pushes forward to an exact sequence of torsion sheaves in the first-tilt
    heart. Their tilt slopes differ from their $C$-twisted normalized surface slopes by the common constant $1 \/
    2 - b$. Twisting shifts all surface slopes equally, so tilt semistability of $i_(*)
    F$ implies slope semistability of $F$ for $ell$. The classical surface Bogomolov–Gieseker inequality
    #cite(label("BMT2014")) Theorem 3.1.4 and the Hodge index theorem give
  $ u^2 - 2 rho v gt.eq 0 \, wide \( ell u \)^2 gt.eq s u^2 \, wide delta gt.eq 0 . $
  The first expression is unchanged by twisting the Chern character by $C$,
    so these conclusions hold for the specified $B_0$.
  The normal line bundle has first Chern class $- ell$, and hence $"td" \( N_(D \/ X) \)^(- 1) = 1 + ell \/ 2 +
    ell^2 \/ 6$. Grothendieck–Riemann–Roch now gives
  $ H^2 "ch"_1^B \( i_(*) F \) = rho s \, wide H "ch"_2^B \( i_(*) F \) = rho s \( mu + 1 \/ 2 - b \) . $
  Since the threefold rank of $i_(*) F$ is zero, its zero-slope condition is $b = mu + 1 \/ 2$.
    The degree-three term of the same formula yields
  $ frac("ch"_3^B \( i_(*) F \), rho s) = frac(v, rho s) + mu / 2 + 1 / 6 - b \( mu + 1 \/ 2 \) + b^2 / 2 = 1 /
    24 - delta / 2 lt.eq 1 / 24 . $
  This proves (8.4); the two strong bounds follow by subtracting $a^2 \/ 6$. ◻
]

For the Weierstrass examples of #cite(label("MartinezSchmidt2019")) Section 3.2 and Appendix A, let $p : X arrow.r
  S$ be a Weierstrass elliptic fibration from a smooth Calabi–Yau threefold to a del Pezzo surface,
  and let $Sigma$ be its section. Since $K_X tilde.eq cal(O)_X$, adjunction gives $Sigma \|_Sigma = K_S$.
  For the ample polarization $H = q Sigma - \( 1 + q \) p^(*) K_S$, with a positive integer $q$,
  one has $H \|_Sigma = - K_S$. Thus Lemma 36 applies in arbitrary rank and after every line-bundle twist on
  $Sigma$ whose pushforward is tilt-semistable. In particular,
  the known Calabi–Yau counterexample has the defect (8.3), with $s = K_S^2$,
  and its violating volume range is bounded by $a < 1 \/ 2$.

#prodef([Remark 8.2.])[
  Replacing $D$ by $n D$ in the character calculation does not produce a stable counterexample at arbitrarily
    large volume. Under the hypotheses of Lemma 36, the exact sequence
  $ 0 arrow.r cal(O)_D \( - \( n - 1 \) D \) arrow.r cal(O)_(n D) arrow.r cal(O)_(\( n - 1 \) D) arrow.r 0 $
  lies in every first-tilt heart. For $B_0 = 0$ and $b = n \/ 2$, its three slopes are $\( n - 1 \) \/ 2$, $0$,
    and $- 1 \/ 2$, respectively. Thus $cal(O)_(n D)$ is unstable for every $a > 0$ when $n > 1$.
    The uniform estimate above concerns sheaves on the reduced divisor; its proof uses surface semistability,
    rather than the character of an arbitrary multiple.
] <rem:nonreduced-multiple>

#bibliography("refs.bib", style: "ieee", title: [References])
