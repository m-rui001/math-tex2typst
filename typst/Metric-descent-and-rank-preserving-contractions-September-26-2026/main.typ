#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Metric descent and rank-preserving contractions]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <g:introduction>

Anticanonical nonvanishing asks when positivity of $- K_X$ produces a nonzero section of $-
  m K_X$ for some integer $m > 0$. We study metric descent and dimension reduction for this problem,
  including sections with prescribed poles and sections fixed by a torus.

Throughout the paper varieties are over $bb(C)$. We write line bundles additively.
  On a smooth variety $X$, the anticanonical bundle is $- K_X = det T_X$,
  with its natural linearization whenever a group acts. A singular Hermitian metric is semipositive if its local
  squared frame norm is $e^(- phi)$ for a plurisubharmonic weight $phi$.
  A metric with locally bounded weights satisfies two-sided local bounds on $phi$.
  Such a condition is stronger than pseudoeffectivity and is preserved by the normalized maximum construction below.

Two section theorems are applications of the constructions developed here.
  Let $X$ be smooth projective with no positive-degree holomorphic forms,
  and let $D$ be an effective integral divisor. View its canonical section $s_D$ as a $\( - K_X + D \)$-valued top
  form. If a semipositive metric $h$ on $- K_X + D$ makes the measure $\| s_D \|_h^2$ finite,
  then for every line bundle $L$ with locally bounded semipositive weights,
  Theorem 23 gives integers $a > 0$ and $c gt.eq 0$ such that

$ H^0 \( X \, a L + c D \) eq.not 0 . $

If $- K_X$ is smoothly semipositive and an algebraic torus $T$ acts on $X$,
  Theorem 25 gives $H^0 \( X \, - m K_X \)^T eq.not 0$ for some $m > 0$, for the natural action.
  These conclusions are also established in the companion #cite(label("HFiniteVolume")) Theorems 1.2 and 8.1,
  which uses invariant sections and finite-cover descent to obtain anticanonical nonvanishing without the no-forms
  hypothesis #cite(label("HFiniteVolume")) Theorem 1.1. Here the emphasis is on reusable transfer statements,
  rank-preserving contractions, and alternative constructions by orbit integrals and finite-flat norms.

A section constructed on the base of a rational fibration need not return to the original variety.
  Multiplying its pullback by a rational relative section can leave poles over degenerate fibers,
  and a second contraction can destroy the one-dimensional space that made an integral metric positive.
  We study these two obstructions together: the boundary corrections must disappear under birational pushdown,
  and the contraction must preserve both a generic section and its adjoint section ranks.

=== 1.1 From a volume on the total space to a metric on the base <from-a-volume-on-the-total-space-to-a-metric-on-the-base>

Let $X$ be smooth projective and suppose $L = - K_X$ has a smooth semipositive metric.
  The metric determines a smooth positive volume form on $X$. Resolve a rational fibration to obtain

$ X arrow.l^(med pi med) Z arrow.r^(med g med) Y \, wide E = K_(Z \/ X) \, $

with $X \, Z \, Y$ smooth projective. The adjoint identity is

$ K_(Z \/ Y) + pi^(*) \( - K_X \) = E + g^(*) \( - K_Y \) . $

Over a smooth fiber, the Jacobian section $s_E$ is an adjoint section after a base canonical frame has been
  chosen. If it spans the generic adjoint space, integration along the fibers turns the pushforward volume into
  the squared norm of a line. Relative direct-image positivity then supplies the curvature inequality on the
  smooth locus. The question is what happens at its boundary.

The first metric result, Theorem 1, answers this question on a normal equidimensional toroidal intermediate model
  $W arrow.r Y$ dominating $X$. For a base prime $Q$, let $e_D$ be its pullback multiplicity at a prime $D$ of $W$
  above $Q$, and let $a_D$ be the Jacobian order over $X$. The correction is the explicit rational divisor

$ A_0 = sum_Q max {0 \, min_(D mapsto Q) (frac(1 + a_D, e_D) - 1)} Q . $

Its pullback to $W$ is exceptional over $X$. The resulting metric on $- K_Y +
  A_0$ has locally integrable squared frame norms without inserting a vanishing section.
  If, away from the Jacobian divisor, the coefficient curvature dominates a positive pulled-back base form on one
  patch, then this metric is smooth and strictly positive on a nonempty ordinary open set.
  The proof checks every divisorial valuation, including those centered in intersections of the boundary.
  This construction is proved before any section-existence argument.
  The companion #cite(label("EControlledBoundary")) Sections 5.3 and 11.2 uses precisely this unweighted
  integrability, strictness, and exceptional support for its fixed-error effectivity argument and its Fano-type
  model of an auxiliary base.

The distinction between a normal intermediate model and its smooth resolution is useful.
  Equidimensionality controls which divisors can carry poles. Smoothness permits fiber integration.
  A smooth resolution need not be equidimensional, but its additional divisors over subsets of base codimension at
  least two are exceptional over the original variety. Keeping both models makes the final support statement exact.

=== 1.2 A contraction that keeps its generic section <a-contraction-that-keeps-its-generic-section>

The second main result is Theorem 7. Let $X$ have no positive-degree holomorphic forms, let $-
  K_X$ be smoothly semipositive, and let a torus $T$ act on $X$.
  Consider an invariant rational fibration to a trivially acted-on base $Y$ whose function field is relatively
  algebraically closed in $bb(C) \( X \)$. Assume that a positive anticanonical multiple has a nonzero invariant
  section on the generic fiber, and put $eta = "Spec" bb(C) \( Y \)$. Suppose that the invariant generic adjoint spaces

$ H^0 #scale(x: 120%, y: 120%)[\(] Z_eta \, \( K_(Z \/ X) + m pi^(*) \( - K_X \) \) \|_(Z_eta)
  #scale(x: 120%, y: 120%)[\)]^T $

have dimension one for every positive multiple of a fixed integer.
  Then either a positive anticanonical multiple has a global invariant section,
  or the fibration factors rationally through a strictly lower-dimensional base satisfying the same two conditions.

The two assumptions have different roles. The generic section supplies the line whose high moments yield a bounded
  base metric. Multiplication by its powers also compares degree zero with the positive-degree adjoint spaces and
  forces rank one at zero; this supplies the zeroth density as well as the high moments.
  The rank condition makes ratios of sections into base functions.
  After contraction, the proof must recover that statement for the larger generic fiber,
  as well as producing its section.

Here is the mechanism. Vertical minima normalize the section to a regular map from a base line.
  A toroidal density calculation produces both a bounded metric on that line and a nef anti-log-canonical class
  with a signed boundary. The negative boundary is supported on those base primes where section poles can be
  absorbed upstairs. If a suitable small boundary correction is effective, its section lifts to $X$.
  Otherwise a movable class annihilates the relevant divisors.
  Twisted differential forms give an unbounded sequence of effective divisors of degree zero.
  Their ratios define a smaller field. Affine relations among their horizontal multiplicities give the new generic
  section, and the controlled base poles restore all the adjoint ranks. This last step is what permits iteration.

=== 1.3 Methods, predecessors, and other metric hypotheses <methods-predecessors-and-other-metric-hypotheses>

The distinction between numerical and linear effectivity is important in positioning these results.
  Lazić–Matsumura–Peternell–Tsakanikas–Xie prove numerical effectivity of nef anti-log-canonical divisors for
  projective log canonical threefold pairs under $bb(Q)$-factoriality or rational singularities
  #cite(label("LMPTX2023")) Theorem A. A numerical equivalence with an effective divisor need not supply a section
  of a multiple of the given line. Müller proves actual nonvanishing for projective klt threefold pairs with nef
  anti-log-canonical divisor, and in arbitrary dimension when that divisor is semiample on a general
  maximal-rationally-connected fiber #cite(label("Muller2025")) Theorem A and Corollary B.
  His equivariant theorem gives invariant plurisections for commutative linear algebraic groups on projective
  sub-log-canonical pairs with semiample anti-log-canonical divisor #cite(label("Muller2025")) Theorem C.
  Our invariant conclusion instead uses smooth semipositivity on a smooth variety without positive-degree forms
  and treats algebraic tori. It does not assert the same generality of pairs or groups.
  Müller’s moment-polytope argument also precedes the toric initial-section construction in Section 8
  #cite(label("Muller2025")) Proposition 3.13 and Corollary 3.14.

The birational preparations use flattening by Raynaud–Gruson #cite(label("RaynaudGruson1971")),
  the toroidalization of Abramovich–Denef–Karu #cite(label("ADK2013")),
  and the cone subdivisions and weak semistable reduction of Abramovich–Karu #cite(label("AK2000")).
  Birational toroidal preparation and reduced fibers after alteration are different constructions here.
  We use the former for valuation and support estimates; the latter gives a separate norm construction in Section 12.

The curvature mechanism builds on Berndtsson’s smooth direct-image positivity #cite(label("Berndtsson2009"))
  Theorem 1.2 and the relative Bergman theorem of Berndtsson–Păun #cite(label("BerndtssonPaun2008")) Theorem 0.1.
  The singular direct-image formulation is due to Păun–Takayama #cite(label("PT2018")) Theorem 3.3.5;
  the actual-multiplier-ideal formulation is also presented in #cite(label("HPS")) Theorem 21.1.
  In the ordinary singular case we verify integrability of the generating adjoint section,
  including the actual multiplier ideal. In the invariant case smooth coefficients allow compact averaging to give
  an orthogonal holomorphic quotient. This explains why the singular and invariant forms of the transfer statement
  have separate hypotheses. The normalized high-moment limit then produces a bounded metric,
  while the zeroth moment retains a finite-volume donor metric on a different line bundle.

Movable-class slopes connect those metrics to dimension reduction.
  We use divisor–curve duality #cite(label("BDPP2013")), movable slope theory #cite(label("GKP2016")),
  and the algebraicity criterion of Campana–Păun #cite(label("CampanaPaun2019")).
  The foliation argument follows the strategy used by Ou for generic nefness #cite(label("Ou2023"));
  the boundary and integrability conditions required here are retained in each local version.
  Proposition 16 proves the general finite-volume cotangent estimate by approximating a rational boundary while
  preserving its strict discrepancy inequalities. For integral boundaries,
  the companion #cite(label("HFiniteVolume")) Theorem “Finite-volume cotangent bound” gives a different proof
  through ramification estimates and relative Bergman metrics.
  Hard Lefschetz with multiplier ideals #cite(label("DPS2001")) Theorem 0.1 supplies twisted forms.
  Their determinant extraction follows Lazić–Peternell #cite(label("LP2018")) Lemma 4.1,
  as adapted in #cite(label("LMPTX2023")) Lemma 5.1. The horizontal divisor comparison is a relative version of
  the three-index argument in #cite(label("LP2018")) Theorem 3.1, Step 3:
  ratios in the smaller base field give equality of horizontal parts instead of the absolute divisor equality
  furnished there by Iitaka dimension zero. The subsequent control of vertical poles and restoration of adjoint
  rank are separate steps.

Several useful variants require different input data. An integrable metric after multiplication by a boundary
  section need not have integrable frame norms. A signed sub-klt divisor is also different from an effective klt
  boundary. We therefore distinguish weighted, unweighted, and signed-boundary transfer statements.
  The large-moment construction uses only eventual adjoint ranks in its curvature step.
  Together with its regular distinguished section those ranks imply rank one also in the earlier degrees,
  but the construction does not use zeroth-moment curvature.
  Each variant is carried through its support and rank verification before it meets a common contraction or induction.

Two further constructions illuminate the metric step. On a dense torus orbit,
  logarithmic coordinates turn the volume density into an integral of a log-concave function.
  This is the setting of complex Prékopa positivity and Kiselman’s minimum principle #cite(label("Kiselman1978"))
  #cite(label("Berndtsson1998")) #cite(label("Berndtsson2006")).
  The Brascamp–Lieb variance calculation #cite(label("BrascampLieb1976")) #cite(label("KolesnikovMilman2017"))
  proves that the negative logarithms of its integral and its supremum are plurisubharmonic in the base variables;
  Section 7 gives the complete argument and its invariant-section application.
  On a reduced flat alteration, a generic section instead determines a line nonzero on every fiber.
  Its finite-flat determinant norm returns that line to a birational model of the original base.
  The norm multiplies the section exponent by its degree and preserves the required polar support.

=== 1.4 Reading the proofs <reading-the-proofs>

Section 2 proves the exceptional unweighted metric construction.
  Section 3 gives two-metric transfer and its rank-one metric hypotheses;
  Section 4 then proves the rank-preserving contraction. Section 5 establishes the weighted, unweighted,
  and signed-boundary variants.

For the ordinary allowed-pole theorem, the direct route is from the two-metric transfer in Section 3,
  through the weighted cotangent estimate, to the induction in Section 6.
  For invariant sections, Section 7 applies that theorem using either rank-one quotient integrals or explicit
  logarithmic orbit integration. These proofs do not require the rank-preserving contraction theorem.
  Sections 8 and 9 then identify the ratio fields, extract their generic sections, and vary the base construction.
  The boundary applications in Section 10 and multiplicative systems in Section 11 give other contractions with
  their own rank hypotheses. Section 12 replaces the metric-transfer step by an alteration and a finite-flat norm,
  then proves the rationally connected cases of the ordinary and invariant conclusions over the original base field.

== 2 An integrable anticanonical metric on a toroidal base <g:sec-toroidal-volume>

A smooth metric on the anticanonical bundle of a smooth variety determines a smooth positive volume form.
  Integrating that form along a fibration produces a density on the base.
  The question here is whether this density is the squared norm of a positively curved anticanonical metric,
  and whether its singularities can be corrected without changing divisors on the original variety.
  Adjoint rank one answers the first question. The comparison between ramification and Jacobian orders answers the
  second.

We use additive notation for line bundles. If a local frame has squared norm $e^(- phi)$,
  its curvature is $i partial macron(partial) phi$. For a rational line bundle,
  choose a positive Cartier multiple and a nonvanishing local holomorphic frame of that multiple,
  and divide its weight by the chosen integer. Integrability below means $e^(- phi) in
  L_(upright("loc"))^1$ for these root weights. Changing the holomorphic frame multiplies the squared norm by a
  locally bounded positive factor with locally bounded inverse, and therefore does not change this condition.

A toroidal embedding is a normal variety with an open subset locally modeled on a toric variety and its dense
  torus. Its boundary is the complement of that open subset.
  We use strict toroidal embeddings, whose irreducible boundary components are normal,
  and morphisms locally modeled by toric morphisms. The full reduced boundary will let us control discrepancies
  even when the source variety is singular.

#thm([Theorem 2.1.])[
  (Toroidal volume metric).  #emph[Let $X$ and $Y$ be smooth connected projective complex varieties, with $n =
    dim X$ and $d = dim Y > 0$, and let $L = - K_X$ carry a smooth Hermitian metric $h$ of semipositive curvature
    $alpha$. Suppose
$ p : W arrow.r X \, wide f : W arrow.r Y $

 are projective morphisms, where $W$ is normal and integral, $p$ is birational, and $f$ is surjective,
   equidimensional, and toroidal for strict toroidal embeddings.
   Choose a smooth projective resolution $rho : Z arrow.r W$, and put $pi = p rho$, $g = f rho$, and $E_Z =
   K_(Z \/ X)$. Assume
#[#set math.equation(numbering: n => "(2.1)")
 $ "rk" g_(*) cal(O)_Z \( E_Z \) = 1 . $ <g:volume-rank-zero>]

 For each prime divisor $Q subset Y$ and each prime $E subset W$ dominating $Q$, set
$ a_E = "ord"_E K_(W \/ X) \, wide e_E = "ord"_E f^(*) Q \, $

 where the Jacobian divisor $K_(W \/ X) = K_W - p^(*) K_X$ is defined in codimension one. Define
#[#set math.equation(numbering: n => "(2.2)")
 $ a_Q = max {0 \, min_(f \( E \) = Q) (frac(1 + a_E, e_E) - 1)} \, wide A_0 = sum_Q a_Q Q . $ <g:volume-correction>]

 Then $A_0$ is an effective rational divisor with finite support, and $f^(*) A_0$ is $p$-exceptional.
   The rational line bundle $- K_Y + A_0$ has a singular Hermitian metric of semipositive curvature whose squared
   frame norms are locally integrable without a divisor weight.
   This metric is smooth on a nonempty Zariski open subset of $Y$.]
  #emph[Moreover, let $U subset Y$ be a nonempty Zariski open set where $g$ is smooth and formation of the adjoint
    direct image $g_(*) \( K_(Z \/ Y) + pi^(*) L \)$ commutes with base change.
    If there are a nonempty ordinary open patch $cal(V) subset g^(- 1) \( U \) \\ "Supp" E_Z$,
    a Kähler form $omega_Y$, and a constant $c > 0$ such that
#[#set math.equation(numbering: n => "(2.3)")
 $ pi^(*) alpha gt.eq c thin g^(*) omega_Y wide upright("on ") cal(V) \, $ <g:volume-horizontal-patch>]

 then the constructed metric is strictly positively curved on a nonempty ordinary open subset of $Y$.]
] <g:toroidal-volume>

The rank in (2.1) is the full generic adjoint rank at exponent zero.
  It identifies the entire direct image with a line on a suitable open set.
  In particular, the theorem does not obtain positivity by restricting a direct-image metric to an arbitrary
  subline. Likewise, (2.3) is a hypothesis on one patch; its conclusion is strict curvature on an ordinary open,
  not a global Kähler lower bound.

The theorem assumes a toroidal equidimensional model rather than constructing one.
  Birational weak toroidalization and projective subdivisions provide such models in the applications;
  these are the constructions of Abramovich–Denef–Karu and Abramovich–Karu #cite(label("ADK2013"))
  #cite(label("AK2000")). No cover making the fibers reduced is part of the theorem.
  We retain the multiplicities $e_E$ in the correction.

=== 2.1 The correction and its discrepancies <the-correction-and-its-discrepancies>

We first isolate the algebraic reason that the correction is disposable on $X$ and integrable on every higher
  model. The transverse map $y_1 = u_1^(e_E)$ sends a density of order $\| u_1 \|^(2 a_E)$ to one of order $\|
  y_1 \|^(2 \( a_E - e_E + 1 \) \/ e_E)$. This explains the coefficient in (2.2).
  After the correction, on a normal-crossing resolution $Z' arrow.r W$, with composite $g' : Z' arrow.r Y$,
  the upstairs density will have factors $\| z_j \|^(2 gamma_j)$ with $gamma_j =
  "coeff"_({ z_j = 0 }) \( K_(Z' \/ X) - \( g' \)^(*) A_0 \)$.
  Such factors are integrable exactly when $gamma_j > - 1$.
  New exceptional divisors can be centered in boundary intersections,
  so checking only the primes already on $W$ is insufficient.
  The following lemma controls all the new exponents by comparing with the full toroidal boundary.
  The canonical divisors in this discussion are chosen compatibly with a rational top form on $X$;
  all Jacobian differences are consequently unambiguous.

For a rational Weil divisor $Theta$ with $K_W + Theta$ rationally Cartier,
  its crepant pullback to a smooth model $tau : W' arrow.r W$ is defined by $K_(W') + Theta_(W') =
  tau^(*) \( K_W + Theta \)$. The pair is #emph[sub-klt] if every coefficient of $Theta_(W')$ is less than one on
  every such model; negative coefficients are allowed. Equivalently,
  every divisorial log discrepancy $A_(W \, Theta) \( "ord"_F \) = 1 - "coeff"_F Theta_(W')$ is positive.
  Replacing “positive” by “nonnegative” defines sub-log-canonicity, or log canonicity when the boundary is effective.

#thm([Lemma 2.2.])[
  #emph[Let $X \, Y$ be smooth connected projective varieties with $dim Y > 0$, let $W$ be normal and integral,
    and let $p : W arrow.r X$ be projective birational and $f : W arrow.r Y$ projective, surjective,
    equidimensional, and toroidal for strict toroidal embeddings. Define $A_0$ by (2.2), and put
$ Theta = - K_(W \/ X) + f^(*) A_0 . $

 Then $Theta lt.eq 0$, the pair $\( W \, Theta \)$ is sub-klt, and $f^(*) A_0$ is $p$-exceptional.
   In particular, for every smooth model $tau : Z' arrow.r W$,
#[#set math.equation(numbering: n => "(2.4)")
 $ "coeff"_F #scale(x: 120%, y: 120%)[\(] K_(Z' \/ X) - \( f tau \)^(*) A_0 #scale(x: 120%, y: 120%)[\)] > -
   1 $ <g:volume-all-valuations>]

 at every prime $F subset Z'$.]
] <g:volume-subklt>

This assertion uses only the morphisms and their divisor orders.
  Neither a metric nor an adjoint-rank assumption is needed;
  this will allow us to use the same discrepancy estimate with invariant direct images later.

#proof[
  At a general point of a prime of $W$, the variety is smooth and the Jacobian of the morphism to $X$ is
    holomorphic. Hence $a_E gt.eq 0$. At a prime that is not exceptional over $X$,
    the morphism is an isomorphism at its general point, so $a_E = 0$.
  Every vertical prime of $W$ dominates a prime of $Y$. Indeed,
    an equidimensional map of relative dimension $dim W - dim
    Y$ cannot map a divisor into a set of codimension at least two:
    its dimension would then be at most $dim W - 2$. If $a_Q > 0$, the minimum in (2.2) is positive,
    so every prime over $Q$ has $a_E > 0$ and is $p$-exceptional. This proves the asserted support of $f^(*) A_0$.
    It also proves finite support, since there are only finitely many $p$-exceptional prime divisors.
    Rationality follows from the integer orders in (2.2).
  If $E$ dominates $Q$ with $a_Q > 0$, its coefficient in $Theta$ satisfies
  $ - a_E + e_E a_Q lt.eq 1 - e_E lt.eq 0 . $
  At a prime above a $Q$ with $a_Q = 0$, and at any horizontal prime, the coefficient is $- a_E lt.eq 0$.
    Thus $Theta lt.eq 0$.
  Let $D_W$ be the full reduced toroidal boundary. The toroidal pair $\( W \, D_W \)$ is log canonical, $K_W +
    D_W$ is rationally Cartier, and $W \\ D_W$ is smooth. These assertions can be checked on a regular subdivision
    of each toric chart: the logarithmic top form gives $K_(tilde(W)) + D_(tilde(W)) = tau^(*) \( K_W + D_W \)$,
    and the reduced boundary upstairs has simple normal crossings. We also have
  $ K_W + Theta = p^(*) K_X + f^(*) A_0 . $
  Consequently $B = D_W - Theta$ is an effective rational Cartier divisor whose support contains $D_W$.
    For any divisorial valuation $v$ over $W$, the log discrepancies satisfy
  #[#set math.equation(numbering: n => "(2.5)")
   $ A_(W \, Theta) \( v \) = A_(W \, D_W) \( v \) + v \( B \) . $ <g:volume-discrepancy-comparison>]
  The full toroidal boundary gives nonnegative log discrepancies;
    the effective rational Cartier difference adds a strictly positive term precisely where that discrepancy could
    vanish. Both terms on the right are nonnegative. If the first is zero, the center of $v$ lies in $D_W$,
    since the complement is smooth with zero boundary. Its center is then contained in the support of the
    effective rational Cartier divisor $B$, so $v \( B \) > 0$.
    If the first term is positive there is nothing more to check.
    This proves $A_(W \, Theta) \( v \) > 0$ for every divisorial valuation, which is the sub-klt assertion.
    This argument does not require the support of $K_(W \/ X)$ to lie in the toroidal boundary.
  Finally the crepant pullback of $Theta$ to $Z'$ is
  $ Theta_(Z') = \( f tau \)^(*) A_0 - K_(Z' \/ X) . $
  Its coefficients are less than one by the sub-klt assertion, giving (2.4). ◻
]

=== 2.2 Positivity of the integrated density <positivity-of-the-integrated-density>

We next explain why the volume density gives a semipositive metric,
  and why the patch in (2.3) gives strict curvature. The analytic input is the smooth direct-image theorem of
  Berndtsson #cite(label("Berndtsson2009")) Theorem 1.2. We use its primitive-representative curvature formula
  before the additional product and fiberwise-positivity assumptions considered later in that paper.

For clarity, consider a proper smooth Kähler family $f : cal(Z) arrow.r bb(D)$ over a disc with coordinate $t$,
  relative dimension $r > 0$, and a smooth semipositive coefficient line $\( cal(L) \, h_(cal(L)) \)$.
  Assume formation of $cal(E) = f_(*) \( K_(cal(Z) \/ bb(D)) + cal(L) \)$ commutes with base change.
  Choose a holomorphic section $u$ of $cal(E)$ that is Chern-normal at $0$.
  Berndtsson’s representative construction #cite(label("Berndtsson2009")) Proposition 4.2 gives an absolute
  $cal(L)$-valued $\( r \, 0 \)$-form $hat(u)$ representing $u$, with

$ macron(partial) hat(u) = d t and eta \, wide partial^(h_(cal(L))) hat(u) = d t and mu \, wide mu \|_(cal(Z)_0) =
  0 \, wide \( omega and eta \) \|_(cal(Z)_0) = 0 . $

Here $omega$ is a Kähler form on the total space. Differentiating the fiber integral with this representative gives

#[#set math.equation(numbering: n => "(2.6)")
 $ - i partial macron(partial) parallel u parallel^2 \|_0 med gt.eq med
   f_(*) #h(-0.16667em) (i^(r^2) hat(u) and overline(hat(u)) h_(cal(L)) and i Theta_(cal(L) \, h_(cal(L)))) \|_0 .
   $ <g:volume-curvature-bound>]

The omitted term is the nonnegative squared norm of the primitive $\( r - 1 \, 1 \)$-form $eta$;
  this is #cite(label("Berndtsson2009")) formula (4.8). The displayed integrand is nonnegative because an
  $\( r \, 0 \)$-form in dimension $r + 1$ is decomposable.
  If the coefficient curvature dominates $c thin f^(*) \( i thin d t and d macron(t) \)$ on a patch where
  $u \( 0 \)$ is nonzero, the right side is strictly positive:
  its integral on that patch is bounded below by the positive integral of the squared relative form times $c thin
  i thin d t and d macron(t)$. Applying this argument on discs in every base tangent direction proves horizontal
  strictness. When $r = 0$ and the full direct image has rank one, the smooth map has one-point fibers,
  and its line metric is the coefficient metric itself.

We now apply this calculation to the theorem. Write $Omega_h$ for the smooth positive volume form on $X$
  determined by $h$. In a coordinate frame $partial \/ partial x_1 and dots.h.c and partial \/ partial x_n$ of $-
  K_X$, it has density equal to that frame’s squared norm. Its pullback to $Z$ contains the squared Jacobian
  factor and vanishes along $E_Z$ to twice its order.

Choose a nonempty Zariski open $U$ over which $g$ is smooth and base change holds.
  After shrinking $U$, the canonical section $s_(E_Z)$ induces an isomorphism

#[#set math.equation(numbering: n => "(2.7)")
 $ g_(*) \( K_(Z \/ Y) + pi^(*) L \) \|_U = g_(*) cal(O)_Z \( E_Z \) \|_U ⊗ \( - K_Y \) \|_U
   tilde.eq \( - K_Y \) \|_U . $ <g:volume-adjoint-identification>]

Indeed, the first direct image on the right is generically a line by (2.1),
  and $s_(E_Z)$ is a nonzero generic section of that line. Local freeness, base change,
  and its nonvanishing as a frame hold on a smaller open set.
  When (2.3) is assumed, the chosen ordinary patch still meets its inverse image. We also remove $"Supp" A_0$ from $U$.

In coordinates $y = \( y_1 \, dots.h \, y_d \)$ on $U$, let $d
  V_y$ denote the Euclidean volume with the same normalization used for top forms, and write

#[#set math.equation(numbering: n => "(2.8)")
 $ g_(*) pi^(*) Omega_h = H \( y \) thin d V_y . $ <g:volume-density>]

By (2.7), $H$ is exactly the squared $L^2$ norm of the corresponding frame of $- K_Y$.
  It is smooth and positive on $U$, and $- log H$ is plurisubharmonic by smooth direct-image positivity.
  If (2.3) holds, the section corresponding to that frame is nonzero wherever the Jacobian section is nonzero.
  Therefore (2.6), applied with coefficient $cal(L) = pi^(*) L$, and (2.3) make $-
  log H$ strictly plurisubharmonic at an image point of the patch.
  Smoothness then gives strict positivity on an ordinary neighborhood of that point.

=== 2.3 Extension and unweighted integrability <extension-and-unweighted-integrability>

The remaining task is to cross the omitted base locus. Extension of a plurisubharmonic weight requires an upper
  bound; integrability requires an upper bound on its exponential with the opposite sign.
  The ramification calculation provides the first, while the discrepancy calculation provides the second.

On a coordinate neighborhood in $Y$, choose local equations $t_Q$ for the finitely many components of $A_0$.
  On its intersection with $U$ define

#[#set math.equation(numbering: n => "(2.9)")
 $ Phi = - log H + sum_Q a_Q log \| t_Q \|^2 . $ <g:volume-weight>]

These are the weights of a metric on $- K_Y + A_0$: its squared frame norm is $H product_Q \| t_Q \|^(- 2 a_Q)$.
  The assertion follows either by the frame transition rule or after clearing the denominators of $A_0$.
  On $U$ the added terms are pluriharmonic, so the metric has the curvature already established.

Let $Q$ be a prime component of $Y \\ U$. Choose a prime $E$ over $Q$ attaining the minimum in (2.2).
  At general points of $E$ and $Q$, both are smooth and $E arrow.r Q$ is a submersion.
  Choose the resolution to be an isomorphism there. After absorbing a nonvanishing unit into a local coordinate,
  the map has the form

$ \( u_1 \, dots.h \, u_n \) mapsto \( u_1^(e_E) \, u_2 \, dots.h \, u_d \) \, wide Q = { y_1 = 0 } . $

On a smaller coordinate polydisc the density of $pi^(*) Omega_h$ is bounded below by a positive constant times $\|
  u_1 \|^(2 a_E)$. Integrate over one fixed polydisc in the remaining fiber coordinates.
  The change of variables $y_1 = u_1^(e_E)$, whose real Jacobian is $e_E^2 \| u_1 \|^(2 \( e_E - 1 \))$, yields

#[#set math.equation(numbering: n => "(2.10)")
 $ H \( y \) gt.eq c_Q thin \| y_1 \|^(2 b_Q) \, wide b_Q =
   min_(f \( E \) = Q) (frac(1 + a_E, e_E) - 1) . $ <g:volume-density-lower-bound>]

All other local factors in (2.9) are bounded above and below near the chosen general point.
  Since $b_Q - a_Q = b_Q - max { 0 \, b_Q } lt.eq 0$, the lower bound in (2.10) makes $Phi$ bounded above there.
  The removable-singularity theorem for plurisubharmonic functions extends it across a general open subset of each
  omitted divisor.

The remaining omitted analytic set has codimension at least two in the smooth base.
  The usual Hartogs argument supplies the upper bound needed there as well.
  In a small polydisc, choose one coordinate direction with circle boundary disjoint from that set.
  For transverse parameters outside its projection the entire disc misses the set,
  so the submean inequality bounds $Phi$ by its bound on the circle.
  The exceptional parameter set has measure zero; applying the submean inequality on a small ball about any
  remaining point where $Phi$ is defined gives the same bound there.
  Taking the upper semicontinuous extension proves removability.
  The extensions agree in overlapping frames by uniqueness, and define a semipositive metric on $- K_Y + A_0$.

To prove integrability, use the projection formula on the smooth locus,
  rather than pulling back the already integrated density:

#[#set math.equation(numbering: n => "(2.11)")
 $ e^(- Phi) thin d V_y = g_(*) (product_Q \| t_Q compose g \|^(- 2 a_Q) thin pi^(*) Omega_h) .
   $ <g:volume-projection-formula>]

Take a further resolution $Z' arrow.r W$ on which the Jacobian divisor and the pullback of $A_0$ have simple
  normal crossings, and denote its maps by $pi' : Z' arrow.r X$ and $g' : Z' arrow.r Y$.
  On a normal-crossing coordinate chart the upstairs measure on the right of (2.11) is a positive bounded smooth
  factor times

$ product_(j = 1)^s \| z_j \|^(2 gamma_j) thin d V_z \, wide gamma_j =
  "coeff"_({ z_j = 0 }) #scale(x: 120%, y: 120%)[\(] K_(Z' \/ X) - \( g' \)^(*) A_0
  #scale(x: 120%, y: 120%)[\)] > - 1 \, $

where the strict inequalities are Lemma 2. Each one-variable integral $integral_0^epsilon r^(2 gamma_j + 1) thin d
  r$ is finite, so this measure is locally integrable on $Z'$.
  Properness makes its pushforward locally finite on $Y$. Formula (2.11) then proves $e^(- Phi) in
  L^1$ off the omitted analytic set, with finite integral on every relatively compact coordinate neighborhood.
  The extension changes the weight only on a set of Lebesgue measure zero and therefore has the same
  integrability. This proves Theorem 1.

#thm([Corollary 2.3.])[
  #emph[For the correction in Theorem 1, $kappa \( Y \, A_0 \) = 0$.
    More precisely, for every positive integer $m$ for which $m A_0$ is integral,
$ H^0 \( Y \, cal(O)_Y \( m A_0 \) \) = bb(C) thin s_(m A_0) . $

]
] <g:correction-iitaka-zero>

#proof[
  A section divided by $s_(m A_0)$ is a rational function $q$ on $Y$ with poles bounded by $m A_0$.
    The rational function $f^(*) q$ on $W$ has only $p$-exceptional poles.
    Viewed in $bb(C) \( W \) = bb(C) \( X \)$, it consequently has no pole along any prime of the smooth variety
    $X$. Normality extends it regularly across the remaining subset of codimension at least two.
    It is constant because $X$ is connected and projective. Dominance of $f$ makes $q$ constant as well.
    The canonical section exists since $A_0 gt.eq 0$, giving the asserted one-dimensional space and Iitaka dimension. ◻
]

== 3 Two metrics and controlled pole support <g:analytic>

The section problem involves two line bundles with different metric requirements.
  The first supplies a finite volume measure and controls cotangent tensors.
  The second is the bundle in which we seek a section; its bounded metric is preserved when the problem is
  transferred to a lower-dimensional variety.

All varieties in this section are smooth connected projective varieties over $bb(C)$,
  unless a normal intermediate model is specified. We use additive notation for line bundles.
  A semipositive singular Hermitian metric has local squared norm $e^(- phi.alt)$,
  where $phi.alt$ is plurisubharmonic and not identically $- oo$.
  Bounded weights are locally bounded from both sides. Let $D gt.eq 0$ be an integral divisor and put $A = - K_V +
  D$. Its canonical section $s_D$ is an $A$-valued top form. For a metric $h_A$ on $A$, the notation

$ mu = \| s_D \|_(h_A)^2 $

denotes the associated positive measure. The finite-volume condition $integral_V mu <
  oo$ is a separate assumption; it does not follow from semipositivity of $h_A$.
  This measure has positive finite density almost everywhere and gives no mass to proper algebraic subsets.

=== 3.1 Models and adjoint measures <g:models>

For a dominant rational map with connected general fibres we use a normal projective intermediate model
  $macron(V)$ and a smooth resolution $W$ fitting into

$ W arrow.r macron(V) \, wide macron(p) : macron(V) arrow.r V \, quad macron(f) : macron(V) arrow.r Y \, wide p :
  W arrow.r V \, quad f : W arrow.r Y . $

Here $Y$ is smooth projective, $macron(p)$ is birational, and $macron(f)$ is surjective and equidimensional.
  Such models follow by applying flattening to the graph, resolving the modified base,
  taking its dominating transform, and normalizing #cite(label("RaynaudGruson1971")).
  The dimension bound from the flat model persists under base change for the dominating transform and under finite
  normalization. Every vertical prime of $macron(V)$ therefore maps onto a prime divisor of $Y$.
  A prime of $W$ mapping into a subset of $Y$ of codimension at least two is exceptional over $macron(V)$ and
  hence over $V$. The smooth resolution itself need not be equidimensional.

Write

$ J = K_(W \/ V) gt.eq 0 \, wide S = J + p^(*) D . $

The section $s_S = s_J p^(*) s_D$ is a section of $K_W + p^(*) A$.
  Its squared norm is the birational pullback of $mu$, including the squared Jacobian.
  Change of variables off the exceptional locus gives a finite measure on $W$.
  This statement concerns densities almost everywhere and does not require a pointwise definition of a singular
  metric on its polar set.

=== 3.2 Transferring the two metrics <transferring-the-two-metrics>

The next statement separates normalization of divisor orders from the analytic input which gives curvature.
  This permits both a rank-one adjoint argument and a direct calculation along torus orbits.

#thm([Lemma 3.1.])[
  (Transfer with controlled pole support).  #emph[ Let $V$ be smooth connected projective, let $D gt.eq
    0$ be integral, and suppose $A = - K_V + D$ has a semipositive singular metric $h_A$ with $integral_V \|
    s_D \|_(h_A)^2 < oo$. Let $L$ have a semipositive metric $h_L$ with bounded weights.
    Use the model diagram above with $0 < dim Y lt.eq dim V$.
    Suppose a nonzero rational section $rho$ of $k L$, $k > 0$, has no horizontal poles on $macron(V)$.
    On a dense base open set put
$ g_0 \( y \) thin d lambda_y = f_(*) p^(*) mu \, wide S_rho \( y \) = "ess sup"_(W_y) \| p^(*) rho \|_(h_L^k)^2 . $

 Assume $- log g_0$ in coordinate frames and $- log S_rho$ have psh representatives on this open set.
   Then, after clearing a positive integer denominator, there are a line bundle $B$ with bounded semipositive
   weights, an effective integral divisor $D_Y$, and a regular nonzero map
$ f^(*) B arrow.r b k thin p^(*) L $

 for some $b > 0$. The line bundle $- K_Y + D_Y$ has a semipositive metric whose distinguished adjoint measure has
   finite mass. Every nonzero section of $a B + c D_Y$, where $a > 0$ and $c gt.eq 0$ are integers,
   produces a nonzero rational section of $a b k L$ with poles only on $D$.
   If the data and $rho$ are invariant for a torus acting trivially on $Y$, then the produced section is invariant.]
] <g:transfer>

#proof[
  We first normalize the section, obtaining both the regular map and its bounded base metric.
    We then correct the pushforward measure along base primes whose poles disappear on return to $V$ or remain
    within $D$.
  For a prime $T$ of $Y$ set
  $ d_T = min_(Q mapsto T) frac("ord"_Q \( macron(p)^(*) rho \), "ord"_Q \( macron(f)^(*) T \)) \, wide B_0 =
    sum_T d_T T . $
  The orders in this expression are taken on $macron(V)$. Only finitely many $d_T$ are nonzero.
    Equidimensionality and the absence of horizontal poles give
  $ "div"_(macron(V)) \( rho \) - macron(f)^(*) B_0 gt.eq 0 . $
  This is an effective $bb(Q)$-Cartier divisor. Choose $b > 0$ clearing the coefficients of $B_0$ and set $B =
    b B_0$. Normality extends the normalized section in codimension one to a regular morphism $macron(f)^(*) B
    arrow.r b k macron(p)^(*) L$, and pullback gives the displayed map.
    Over each prime $T$ a component realizing the minimum is absent from its vanishing divisor.
  For a local meromorphic equation $l$ of $B$, define the weight
  $ - b log S_rho + log \| l \|^2 . $
  It is psh on the initial open set. Its negative exponential is the fibre supremum of the squared norm of the
    regular normalized section $\( p^(*) rho \)^b \/ f^(*) l$.
    Properness and bounded weights of $h_L$ bound this norm above locally over every base point,
    giving a lower bound for the weight even near the omitted locus.
    At a general point of each omitted base prime $T$ choose a minimizing component.
    The normalized section is nonzero there. At general points of this component and $T$,
    the transverse map has coordinates $y_1 = z_1^e$, $y_i = z_i$ for $2 lt.eq i lt.eq dim Y$.
    Thus every nearby fibre meets a patch where the normalized section norm is bounded below.
    The fibre measure has positive density almost everywhere on such a patch,
    so the essential supremum has a fixed positive lower bound.
    This gives an upper bound for the weight near a general point of that prime.
    Psh removable singularities extend the weight there and then across the remaining analytic set of codimension
    at least two. The lower bound persists, while the extended psh weight is locally bounded above.
    These weights glue and give the bounded metric on $B$.
  The bounded metric is now constructed. For the finite-volume metric,
    call a base prime $T$ invisible if every component of $macron(f)^(*)
    T$ is exceptional over $V$ or maps into $D$. There are finitely many such primes,
    since they are images of the finitely many exceptional or boundary primes.
    Choose a component above $T$ on $macron(V)$ and denote its strict transform on $W$ by $Q$.
    At its general point write
  $ e = "ord"_Q \( f^(*) T \) \, wide a = "ord"_Q \( J + p^(*) D \) . $
  The local psh coefficient weight of $h_A$ is bounded above,
    so its negative exponential is bounded below by a positive constant.
    The Jacobian and boundary section therefore bound the pulled-back measure below by a positive constant times
    $\| z_1 \|^(2 a)$ times coordinate volume. Integrating over a fixed disc in the free variables and using
    $y_1 = z_1^e$ gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ g_0 \( y \) gt.eq C \| y_1 \|^(2 \( a - e + 1 \) \/ e) $ <rb:density-lower>]
  almost everywhere near the general base point. If $T$ is visible, choose a component with $a = 0$; then $-
    log g_0$ is bounded above there. For the invisible primes choose sufficiently large integral coefficients of
    $D_Y$. Equation (3.1) makes
  $ - log g_0 + log \| s_(D_Y) \|^2 $
  locally bounded above at their general points. It extends psh in codimension one and then across codimension
    two, defining a metric on $- K_Y + D_Y$. Pairing it with $s_(D_Y)$ cancels the added factor.
    Its adjoint measure is $g_0 d lambda_y = f_(*) p^(*) mu$ almost everywhere and is therefore finite.
  A section of $a B + c D_Y$ is a rational section of $a B$ with poles only on $D_Y$.
    Pull it back and compose with the $a$-th power of the normalized map.
    On $macron(V)$ all possible new poles lie above invisible primes.
    They are thus exceptional over $V$ or map into $D$. The normal intermediate model excludes nonexceptional
    divisors over base subsets of codimension at least two. Birational pushdown therefore leaves poles only on
    $D$, and a sufficiently large multiple of $D$ clears them. The rational section remains nonzero.
    The normalization uses only base factors, so it preserves invariance when present. ◻
]

#thm([Lemma 3.2.])[
  (Rank-one sufficient condition).  #emph[ In the setting of Lemma 3.1, suppose on the generic fibre of $f$ that
$ h^0 #scale(x: 120%, y: 120%)[\(] W_eta \, \( J + p^(*) D + m k p^(*) L \) \|_(W_eta)
  #scale(x: 120%, y: 120%)[\)] = 1 wide \( m gt.eq 0 \) . $

 Then the two psh assumptions in that lemma hold. There is also an invariant version:
   take $D = 0$, smooth input metrics invariant under a compact form of an acting torus, and an invariant $rho$;
   it suffices that the invariant dimensions in the display equal one.]
] <g:moments>

#proof[
  On a base open set where $rho$ is regular, define
  $ g_m \( y \) thin d lambda_y = f_(*) #scale(x: 120%, y: 120%)[\(] \| p^(*) rho \|_(h_L^k)^(2 m) p^(*) mu
    #scale(x: 120%, y: 120%)[\)] . $
  These are finite positive densities almost everywhere, since the section norms are bounded on compact preimages
    and $p^(*) mu$ has finite mass. Give $p^(*) \( A + m k L \)$ the coefficient metric $h_m =
    p^(*) \( h_A h_L^(m k) \)$, and consider the integrable direct image
  $ cal(F)_m = f_(*) #scale(x: 120%, y: 120%)[\(] cal(O)_W \( K_(W \/ Y) + p^(*) \( A + m k L \) \) ⊗
    cal(I) \( h_m \) #scale(x: 120%, y: 120%)[\)] . $
  For a local canonical frame $eta_Y$ on the base, the section
  $ u_m = frac(s_(J + p^(*) D) \( p^(*) rho \)^m, f^(*) eta_Y) $
  is locally integrable on the total space and therefore belongs to $cal(F)_m$.
    It is nonzero and generates the ordinary direct image generically by the rank-one hypothesis.
    Consequently $cal(F)_m$ also has rank one. On a dense open set where $u_m$ is its frame,
    the squared direct-image norm is $g_m$.
  Singular direct-image positivity gives $- log g_m$ a psh representative there.
    We use the formulation with the actual multiplier ideal in #cite(label("HPS")) Theorem 21.1,
    based on #cite(label("PT2018")) Theorem 3.3.5. Equivalently, in the relative Bergman description,
    the weight is the logarithm of the generator’s squared holomorphic coefficient minus $log
    g_m$ pulled back from the base #cite(label("BerndtssonPaun2008")) Theorem 0.1.
    In the invariant case, use smooth direct-image positivity #cite(label("Berndtsson2009")) Theorem 1.2.
    Averaging over the compact torus gives a holomorphic projection onto the invariant line.
    Distinct weight spaces are orthogonal, so its subspace metric equals the quotient metric and is semipositive.
  There is a fixed dense open set where $f$ is a submersion and each fibre has a patch avoiding the zeros of
    $s_(J + p^(*) D)$ and $rho$. Integrating over such a patch gives $g_m gt.eq C c^m$ locally, with $C \, c > 0$.
    Hence the psh representatives of $- m^(- 1) log g_m$ have uniform local upper bounds,
    independent of possible extra base-change exceptions for individual $m$;
    psh extension fills those exceptions on the fixed open set.
    Finite fibre measure and its positive density almost everywhere imply
  $ - 1 / m log g_m \( y \) arrow.r - log "ess sup"_(W_y) \| p^(*) rho \|_(h_L^k)^2 $
  almost everywhere. The limit is finite there by the bounded metric and the regularity of $rho$.
    Local compactness for psh functions now gives the required representative.
    Indeed, a subsequence tending locally uniformly to $- oo$ would contradict this finite limit.
    Every $L_(upright("loc"))^1$-convergent subsequence has a further subsequence converging almost everywhere,
    so its psh limit agrees almost everywhere with the displayed power-mean limit.
    The direct-image argument at $m = 0$ supplies $- log g_0$. ◻
]

=== 3.3 Divisors from twisted forms <divisors-from-twisted-forms>

#thm([Lemma 3.3.])[
  #emph[ Let $L$ have bounded semipositive weights on a smooth projective $n$-fold $V$ with
    $H^0 \( V \, Omega_V^j \) = 0$ for $j > 0$. There are a line bundle $M$ mapping nontrivially into a tensor
    power of $Omega_V^1$ and effective integral divisors
$ N_i tilde.op M + m_i L \, wide m_i arrow.r + oo . $

 The integers $m_i$ can be chosen strictly increasing and divisible by any prescribed positive integer.]
] <g:determinant>

#proof[
  Replacing $L$ at the outset by a prescribed positive multiple gives the divisibility assertion;
    it is therefore enough to prove the statement without that prescription.
    Hodge symmetry gives $chi \( cal(O)_V \) = 1$, so Serre duality gives $chi \( K_V \) = \( - 1 \)^n$.
    Riemann–Roch makes $chi \( K_V + m L \)$ a polynomial in $m$ with nonzero constant term.
    It is nonzero for all sufficiently large integers. A fixed cohomological degree $q$ therefore has
    $H^q \( V \, K_V + m L \) eq.not 0$ for unbounded $m > 0$. The metric on $m L$ has trivial multiplier ideal.
    Hard Lefschetz with pseudoeffective coefficients #cite(label("DPS2001")) Theorem 0.1 gives nonzero sections of
    $Omega_V^(n - q) ⊗ m L$ at these exponents.
  Take the saturated subsheaf $cal(E) subset Omega_V^(n - q)$ defined by the span of their untwisted generic
    images. Its determinant $M = \( and.big^("rank" cal(E)) cal(E) \)^(* *)$ is a line bundle and maps to a
    cotangent tensor power. This map is first defined outside codimension two and extends because the ambient
    tensor bundle is locally free. Every nonzero vector from the family can be completed to a generic basis using
    vectors of the same family. Wedging that basis gives a nonzero section of $M$ twisted by the sum of its
    positive exponents. These sums are unbounded because one basis vector can have an arbitrarily large exponent.
    Saturation ensures that the maps factor through $cal(E)$,
    and extension across codimension two gives global determinant sections.
    Their zero divisors are the required $N_i$, after taking a strictly increasing subsequence.
    This is the determinant method of #cite(label("LP2018")) Lemma 4.1,
    used for anticanonical nonvanishing in #cite(label("LMPTX2023")) Lemma 5.1. ◻
]

== 4 Contracting the base while preserving adjoint rank <g:cf:contraction>

A relative section is useful only if it survives the next change of base.
  The theorem below makes that requirement explicit. The section records existence on a complete generic fiber;
  the one-dimensional adjoint space controls the ratios that arise when a larger fiber is formed by contraction.
  The proof constructs two different metrics on the base. The first is bounded and controls the relative section.
  The second comes from the pushforward volume and controls cotangent tensors.
  Their common numerical zero directions determine the contraction.

#thm([Theorem 4.1.])[
  (Rank-preserving contraction).  #emph[Let $X$ be a smooth connected projective complex variety with
    $H^0 \( X \, Omega_X^q \) = 0$ for $q > 0$, and suppose that $L = -
    K_X$ has a smooth semipositive Hermitian metric. Let an algebraic torus $T$ act on $X$,
    with its natural action on $L$. Let $f : X arrow.r.dashed
    Z$ be a dominant $T$-invariant rational map to a smooth connected projective variety,
    where $bb(C) \( Z \)$ is relatively algebraically closed in $bb(C) \( X \)$.
    On a smooth projective resolution $pi : Y arrow.r X$, $f_Y : Y arrow.r Z$, put $L_Y = pi^(*) L$, $E_Y =
    K_(Y \/ X)$, and $eta = "Spec" bb(C) \( Z \)$. Suppose that:]
  + #emph[$H^0 \( Y_eta \, p L_Y \|_(Y_eta) \)^T eq.not 0$ for some integer $p > 0$;]
  + #emph[there is an integer $a > 0$ such that
$ dim_(bb(C) \( Z \)) H^0 \( Y_eta \, \( E_Y + m L_Y \) \|_(Y_eta) \)^T = 1 quad
  upright("for every positive multiple ") m upright(" of ") a . $

]
  #emph[Then either $H^0 \( X \, r L \)^T eq.not 0$ for some $r > 0$, or there is a dominant rational map $h :
    Z arrow.r.dashed W$ to a smooth connected projective variety with $dim W < dim Z$ such that $h compose
    f$ satisfies the same two conditions, possibly with different positive integers.
    The field $bb(C) \( W \)$ is relatively algebraically closed in $bb(C) \( X \)$.]
] <g:cf:contraction-theorem>

We prove the theorem in four steps. Vertical orders normalize the given section and identify the base primes at
  which poles disappear on $X$. Fiber integration then supplies the bounded metric and a nef signed
  log-anticanonical class. A supporting movable class produces effective divisors in unbounded twists.
  Finally, interpolation of their horizontal orders gives the new section,
  and the same field of section ratios restores adjoint rank one.

=== 4.1 The two generic-fiber conditions <g:cf:generic-conditions>

Average the weights of the given metric over a maximal compact subgroup of $T$.
  The resulting smooth semipositive metric $h$ is invariant under that compact subgroup.
  Via the identity section of $K_X + L$, it defines a smooth positive volume form $d mu_X$.

Fix the rational map and resolution in Theorem 7, writing $f : Y arrow.r Z$ for the resolved map.
  We call its two hypotheses the #emph[section condition] and the #emph[rank condition].
  The action on the base and its bundles is trivial; $E_Y = K_(Y \/ X)$ has its natural invariant Jacobian section.

Both conditions are unchanged by resolving further or by replacing the base birationally.
  Indeed, if $nu : Y' arrow.r Y$ is a further smooth modification, then

$ E_(Y') = nu^(*) E_Y + K_(Y' \/ Y) \, wide nu_(*) cal(O)_(Y') \( K_(Y' \/ Y) \) = cal(O)_Y . $

The comparison of the adjoint spaces uses multiplication by the relative Jacobian section.
  The same comparison on a common resolution defines the invariant rational sections even on a model on which the
  torus action is not regular. The degree-zero rank is a consequence of both hypotheses:
  multiplication by a suitable power of the section in the first condition gives an injection into a
  positive-degree invariant space of dimension one (choose a common multiple of its degree and the integer in the
  rank condition), while the Jacobian section gives a nonzero element at degree zero.

If $dim Z = 0$, the section condition gives a global section on $Y$, and then on $X$.
  We may therefore assume $d = dim Z > 0$. Every smooth base encountered below has no positive-degree holomorphic
  forms: pullback under a dominant map is injective, and holomorphic forms are invariant under smooth projective
  birational modification. Consequently

#[#set math.equation(numbering: n => "(4.1)")
 $ chi \( Z \, cal(O)_Z \) = 1 . $ <g:cf:euler>]

Our task is to obtain a global invariant section or construct another map satisfying both conditions with a
  smaller base.

=== 4.2 Equidimensional preparation and the exceptional pole divisor <g:cf:preparation>

Apply weak toroidalization to a resolution of the rational map,
  prescribing the complement of an isomorphism open over $X$ as part of the source boundary
  #cite(label("ADK2013")) Theorem 1.1. Then apply the equidimensional modification by projective subdivisions
  #cite(label("AK2000")) Proposition 4.4, arXiv:alg-geom/9707012v1. After renaming the base, we have

$ pi_0 : Y_0 arrow.r X \, wide f_0 : Y_0 arrow.r Z \, $

where $Y_0$ is normal and toroidal, $Z$ is smooth projective, $pi_0$ is projective birational,
  and $f_0$ is projective, surjective, equidimensional, and toroidal.
  The reduced source boundary $Sigma$ contains every $pi_0$-exceptional divisor.
  The base boundary has simple normal crossings. This step is birational:
  it does not assert that the source is smooth or that the fibers are reduced.
  We may subsequently use smooth toroidal resolutions by subdivisions #cite(label("KKMSD"));
  these remain toroidal over $Z$ but need not remain equidimensional.

Let $s$ be a rational section supplied by the section condition. On $Y_0$, its horizontal divisor is effective. Write

#[#set math.equation(numbering: n => "(4.2)")
 $ 1 / p "div" \( s \) = H + f_0^(*) V \, $ <g:cf:normalization>]

where the coefficient of $V$ at a prime $P subset Z$ is the minimum of

$ frac("coeff"_D \( "div" \( s \) \/ p \), "mult"_D \( f_0^(*) P \))
  quad \( D upright(" a component of ") f_0^(*) P \) . $

Equidimensionality ensures that every vertical prime maps onto a prime of $Z$.
  Thus $V$ is a rational divisor and $H$ is effective and $bb(Q)$-Cartier. Choose $r > 0$ sufficiently divisible.
  There is an invariant rational section

$ sigma in H^0 #scale(x: 120%, y: 120%)[\(] Y_0 \, r pi_0^(*) L -
  f_0^(*) \( r V \) #scale(x: 120%, y: 120%)[\)] \, wide "div" \( sigma \) = r H . $

Its pullback to every dominating smooth model is regular.
  We take $r$ also divisible by the integer in the rank condition.
  For every prime of the base there is at least one component above it with coefficient zero in $H$.

Let $G$ be the reduced sum of the primes $P subset Z$ for which every component of $f_0^(*)
  P$ having coefficient zero in $H$ is exceptional over $X$.
  This is a finite sum, since each such prime is the image of an exceptional divisor of $pi_0$.
  Every nonexceptional component above $G$ has strictly positive coefficient in $H$.
  Hence, for every sufficiently small rational $delta > 0$,

#[#set math.equation(numbering: n => "(4.3)")
 $ \( H - delta f_0^(*) G \)^(-) upright(" is exceptional over ") X . $ <g:cf:exceptional-negative>]

If $V + delta G$ is rationally effective for such a $delta$,
  multiply its section by a suitable power of $sigma$ and divide by the corresponding canonical section of $delta
  G$. Equation (4.3) shows that the resulting invariant rational section of a positive multiple of $L$ has no pole
  along any prime of $X$. Smoothness of $X$ then extends it globally.
  Thus it suffices either to prove this effectivity or to contract the base.

=== 4.3 The bounded metric and the pushforward density <g:cf:metrics>

Write

#[#set math.equation(numbering: n => "(4.4)")
 $ rho \( z \) = frac(f_(*) \( pi^(*) d mu_X \), d lambda \( z \)) $ <g:cf:rho>]

on the smooth locus, using any smooth resolution of the prepared toroidal model.
  The next estimate uses only the smoothness and positivity of $d mu_X$;
  its curvature and the adjoint ranks enter afterwards, when the density is made into a metric.

Write the base boundary as $sum_i P_i$. For a component $D$ above $P_i$, let

$ b_(i D) = "mult"_D \( f_0^(*) P_i \) \, wide e_D = "coeff"_D \( K_(Y_0) - pi_0^(*) K_X \) \, $

where canonical divisors are chosen compatibly using a rational top form on $X$.
  At the regular generic point of $D$, $e_D$ is its Jacobian order; it is nonnegative,
  and zero when $D$ is nonexceptional. Define

#[#set math.equation(numbering: n => "(4.5)")
 $ c_i = min_(D mapsto P_i) frac(1 + e_D, b_(i D)) > 0 \, wide B = sum_i \( 1 - c_i \) P_i = B^(+) -
   B^(-) . $ <g:cf:thresholds>]

If $c_i > 1$, every component above $P_i$ is exceptional, so $P_i$ is a component of $G$.
  Thus $B^(-)$ is supported on the primes all of whose components are exceptional over $X$,
  and in particular on $G$. The coefficients of $B^(+)$ are strictly less than one.

#thm([Lemma 4.2.])[
  (Toroidal density bounds).  #emph[For the prepared toroidal diagram and smooth positive volume above,
    near an arbitrary base point, with $y_i = 0$ the local boundary branches, for every $eta > 0$,
#[#set math.equation(numbering: n => "(4.6)")
 $ rho \( y \) lt.eq C_eta product_i \| y_i \|^(- 2 \( 1 - c_i + eta \)) $ <g:cf:upper-density>]

 on the general smooth locus. Near a general point of $P_i$,
#[#set math.equation(numbering: n => "(4.7)")
 $ rho \( y \) gt.eq C \| y_i \|^(- 2 \( 1 - c_i \)) \, wide C > 0 . $ <g:cf:lower-density>]

 At a general point of a prime outside the base boundary, $rho$ also has a positive constant lower bound.]
] <g:cf:density-bounds>

#proof[
  The divisor
  #[#set math.equation(numbering: n => "(4.8)")
   $ K_(Y_0) + Sigma - pi_0^(*) K_X - sum_i c_i f_0^(*) P_i $ <g:cf:effective-log-jacobian>]
  is effective and $bb(Q)$-Cartier. Indeed, no prime contributes to the pullbacks of two distinct $P_i$,
    by equidimensionality. At a component above $P_i$, its coefficient is $1 + e_D - c_i b_(i D) gt.eq 0$.
    At the other boundary components it is $1 + e_D$, and away from the boundary it is $e_D$.
    The divisor $K_(Y_0) + Sigma$ is Cartier and pulls back log crepantly under toroidal subdivisions:
    the local top logarithmic form of a toric model trivializes it and pulls back to the top logarithmic form on
    the subdivision. Consequently, on a smooth toroidal resolution, if $x_j =
    0$ are the local source boundary branches, then
  #[#set math.equation(numbering: n => "(4.9)")
   $ a_j := 1 + e_j > 0 \, wide a_j gt.eq sum_i c_i b_(i j) \, $ <g:cf:orders>]
  where $e_j$ is the Jacobian order over $X$ and $b_(i j)$ is the order of $y_i$ along $x_j = 0$.
    These inequalities include every new ray on every toroidal subdivision,
    in particular the exceptional rays over intersections of boundary components.
    They follow from pullback of an effective log-Cartier divisor,
    so this is more than an estimate at the original boundary primes.
  For use in analytic integration we make explicit why formal toroidal charts can be replaced by analytic monomial
    charts. In a formal chart write
  #[#set math.equation(numbering: n => "(4.10)")
   $ f^(*) y_i = product_j x_j^(A_(i j)) \, wide x_j = X_j U_j \, quad y_i = Y_i V_i . $ <g:cf:formal-units>]
  In (4.10), the indices include all source and target toric coordinates, including unit coordinates;
    thus $A$ is a $d times dim X$ integer matrix. Here $X_j$ and $Y_i$ are analytic boundary equations,
    or the constant $1$ for unit coordinates; $U_j \, V_i$ are formal units.
    The coordinates minus their residues are regular parameters.
    Dominance implies that $A$ has full row rank, since the logarithmic monomial map has generic rank equal to the
    target dimension. Factoring the analytic boundary equations gives analytic units $R_i$ with
  $ f^(*) Y_i = #scale(x: 180%, y: 180%)[\(] product_j X_j^(A_(i j)) #scale(x: 180%, y: 180%)[\)] R_i . $
  Choose analytic units $V'_i$ having the same first jets as $V_i$. We seek analytic units $U'_j$ satisfying
  #[#set math.equation(numbering: n => "(4.11)")
   $ product_j \( U'_j \)^(A_(i j)) = R_i f^(*) V'_i . $ <g:cf:unit-equations>]
  Use the constants of the formal solution, divide by them, and take logarithms near $1$.
    The resulting equations are linear equations with matrix $A$ and holomorphic right hand sides.
    A linear right inverse gives a holomorphic solution. Its first jet differs from the prescribed formal first
    jet by a vector in $ker A$; a kernel-valued affine correction removes that difference without changing the
    equations. Exponentiating gives the desired $U'_j$. Thus $X_j U'_j$ and $Y_i
    V'_i$ have the original first jets and remain coordinate systems,
    while the monomial identities hold exactly analytically. Negative exponents can occur only on unit coordinates
    and cause no difficulty.
  We can now estimate by coarea in logarithmic coordinates.
    Cut arguments into bounded sectors and work on relatively compact pieces of these charts,
    away from the boundary itself. Relative to Lebesgue measure in the logarithmic variables,
    the pullback of $d mu_X$ is bounded above by a constant times
  $ product_j \| x_j \|^(2 a_j) $
  over the vanishing coordinates; all unit moduli are bounded above and away from zero.
    The factor $\| x_j \|^2$ in this formula is the Jacobian of the logarithmic change of variables.
    The analogous change on the base introduces $product_i \| y_i \|^2$,
    up to bounded positive factors from its unit coordinates.
    The logarithmic map is the fixed full-rank complex linear map $A$, up to boundedly many argument translates.
    Its pushforward density is therefore an integral over affine real planes with fixed coarea factors.
  In the following products, $i$ ranges only over vanishing target coordinates and $j$ only over vanishing source
    coordinates; $b_(i j)$ is the corresponding boundary-order block of $A$.
    To estimate $rho product_i \| y_i \|^(2 \( 1 - c_i + eta \))$,
    divide the logarithmic pushforward density by $product_i \| y_i \|^(2 \( c_i - eta \))$.
    On an affine fiber, this factor is constant and can be brought into the integrand.
    The resulting exponent on a vanishing source coordinate is
  #[#set math.equation(numbering: n => "(4.12)")
   $ 2 #scale(x: 180%, y: 180%)[\(] a_j - sum_i \( c_i - eta \) b_(i j) #scale(x: 180%, y: 180%)[\)] > 0 .
     $ <g:cf:residual-exponents>]
  If some $b_(i j) > 0$, strict positivity follows from (4.9) and $eta > 0$; otherwise it follows from $a_j > 0$.
    The integrand thus decays exponentially as the real logarithms of vanishing coordinates tend to $- oo$.
    Their upper bounds, and the bounds on all remaining logarithmic coordinates,
    allow us to dominate it by $C exp \( - epsilon parallel u parallel \)$ on the whole chart piece in real
    logarithmic variables. Integrals of this bound over affine planes of a fixed direction are uniformly bounded
    independently of the translation. For example, write such a plane as $v +
    ker A$ with $v$ orthogonal to $ker A$ and use $parallel v + w parallel gt.eq parallel w parallel$.
    Properness supplies finitely many chart pieces over a sufficiently small base neighborhood.
    The coordinate equations of each boundary prime differ only by bounded units on overlaps.
    Summing the bounds proves (4.6) almost everywhere, and hence on the general locus where the density is continuous.
  For (4.7), take a general point of a component which realizes the minimum in (4.5). At that point take coordinates
  #[#set math.equation(numbering: n => "(4.13)")
   $ y_1 = x_1^(b_(i D)) \, wide y_j = x_j quad \( 2 lt.eq j lt.eq d \) . $ <g:cf:power-chart>]
  The pulled-back volume is comparable there to $\| x_1 \|^(2 e_D)$ times ordinary coordinate volume.
    The change $y_1 = x_1^(b_(i D))$, followed by integration over a fixed patch in the remaining fiber variables,
    contributes
  $ \| y_1 \|^(2 \( \( 1 + e_D \) \/ b_(i D) - 1 \)) = \| y_1 \|^(- 2 \( 1 - c_i \)) . $
  This is a lower bound for the full pushforward density.
  At a general point of an excluded prime outside the base boundary,
    the density also has a positive constant lower bound. In fact there is a nonexceptional component over that
    prime. An exceptional component would lie in the source boundary,
    whereas a boundary component meeting the inverse image of the base toroidal open cannot be vertical there:
    all target coordinates are units, so the full-rank monomial matrix uses only source unit coordinates and the
    map restricted to the component is dominant. At a nonexceptional component the Jacobian order is zero.
    If $b$ is its pullback multiplicity over the base prime, the same power-coordinate calculation gives a lower
    bound, since its exponent is $2 \( 1 \/ b - 1 \) lt.eq 0$. ◻
]

#thm([Lemma 4.3.])[
  #emph[In the preceding setup, $V$ has a semipositive metric with locally bounded weights.
    For the effective rational divisors $B^(+)$ and $B^(-)$ defined in (4.5),
    there is a nef rational divisor $M$ such that
#[#set math.equation(numbering: n => "(4.14)")
 $ K_Z + B^(+) + M tilde.op_(bb(Q)) B^(-) . $ <g:cf:log-relation>]

 The support of $B^(+)$ has simple normal crossings and all its coefficients are less than one.
   The divisor $B^(-)$ is supported on those primes of $Z$ all of whose components on $Y_0$ are exceptional over
   $X$; in particular it is supported on $G$.]
] <g:cf:metric-conclusions>

#proof[
  We first match the data with the smooth invariant version of Lemmas 5 and 4.
    Their original variety is $X$, their allowed-pole divisor is zero, and both input bundles are $A = L = -
    K_X$ with the compact-invariant smooth metric $h$. The finite measure is $d mu_X$.
    Take exponent $r$ and the rational section $tilde(s)$ of $r L$ whose pullback has divisor $r H +
    f_0^(*) \( r V \)$. It is the power of the original generic section used to construct $sigma$.
    It is invariant and has no horizontal poles. On an equivariant resolution the invariant adjoint ranks equal
    one for every multiple of $r$, including zero by the argument above.
    All hypotheses of Lemma 5 are therefore satisfied.
  The zeroth density is $rho$ from (4.4); hence $- log rho$ is psh on the smooth base-change locus.
    The normalized base divisor in Lemma 4 is $r V$, by the full-component minimum in (4.2).
    Its bounded metric, divided by $r$, gives the asserted metric on $V$.
    More concretely, for a local frame $v$ of $r V$, it is determined by
  $ \| v \|^2 = (max_(f_0^(- 1) \( z \)) \| sigma f_0^(*) v \|_(\( pi_0^(*) h \)^r)^(2 \/ r))^r . $
  The essential supremum in the transfer lemma is this maximum:
    on a smooth connected general fiber the smooth measure has full support.
    The invariance step is the orthogonal quotient in the smooth Berndtsson theorem, as proved in Lemma 5;
    no singular invariant-subbundle positivity is invoked.
  We now use Lemma 8 to construct the signed log-anticanonical metric. Put $M = - K_Z - B$.
    On the general open its local metric weight is
  #[#set math.equation(numbering: n => "(4.15)")
   $ phi_M = - log rho - sum_i \( 1 - c_i \) log \| y_i \|^2 . $ <g:cf:corrected-weight>]
  This has the transition law of $M$: a frame of $- K_Z$ is multiplied by the boundary factor $product_i
    y_i^(1 - c_i)$, after clearing denominators. It is plurisubharmonic away from the boundary.
    The lower density bounds give the upper bound needed for extension across a dense open of every excluded
    divisor. Hartogs extension treats the remaining codimension-two set. The upper density estimate implies
  #[#set math.equation(numbering: n => "(4.16)")
   $ phi_M gt.eq eta sum_i log \| y_i \|^2 - O_eta \( 1 \) wide
     upright("for every ") eta > 0 . $ <g:cf:arbitrarily-small-poles>]
  In particular this metric has zero Lelong numbers: the lower estimate holds with arbitrarily small logarithmic
    coefficients. For every fixed divisible $k > 0$, choose $eta < 1 \/ k$.
    Normal-crossing integrability shows that $cal(I) \( k phi_M \) = cal(O)_Z$.
    This assertion is about every such power, not just the first multiplier ideal.
  Choose a very ample divisor $A$ on $Z$. Nadel vanishing #cite(label("Nadel")),
    applied after adding the smooth positive metric on $\( d + 1 - i \) A$, gives
  $ H^i #scale(x: 120%, y: 120%)[\(] Z \, K_Z + k M + \( d + 1 - i \) A #scale(x: 120%, y: 120%)[\)] =
    0 wide \( 1 lt.eq i lt.eq d \) . $
  Castelnuovo–Mumford regularity makes $K_Z + k M + \( d + 1 \) A$ globally generated.
    Its class divided by $k$ is nef, and the limit as $k$ tends to infinity proves that $M$ is nef.
    The identical argument for the bounded metric on $V$, whose every power has trivial multiplier ideal,
    also shows that $V$ is nef. Equation (4.14) follows from the definition of $M$. ◻
]

=== 4.4 Cotangent tensors on a supporting movable class <g:cf:slopes>

If $V + G$ is big, then for $0 < delta lt.eq 1$,

$ V + delta G = delta \( V + G \) + \( 1 - delta \) V $

is big, because $V$ is pseudoeffective. Choosing a sufficiently small rational $delta$ and using (4.3) finishes
  the proof. We may therefore assume that $V + G$ is not big.
  Duality between the pseudoeffective divisor cone and the closed movable curve cone #cite(label("BDPP2013"))
  gives a nonzero movable curve class $beta$ with

$ \( V + G \) dot.op beta = 0 . $

Since $V$ and $G$ are pseudoeffective and $B^(-)$ is supported on $G$, we obtain

#[#set math.equation(numbering: n => "(4.17)")
 $ V dot.op beta = G dot.op beta = B^(-) dot.op beta = 0 . $ <g:cf:null-degrees>]

#thm([Lemma 4.4.])[
  #emph[Every line subsheaf $N subset.eq \( Omega_Z^1 \)^(⊗ s)$, for $s gt.eq 0$,
    satisfies $c_1 \( N \) dot.op beta lt.eq 0$.]
] <g:cf:cotangent-slope>

#proof[
  For $s = 0$, the inclusion into $cal(O)_Z$ gives the assertion directly.
    Let $s > 0$ and let $t > 0$ be rational. Since $M$ is nef, $M + t A$ is ample.
    Choose a sufficiently divisible very ample multiple and a general member;
    divide that member by the multiple and add it to $B^(+)$ to obtain a rational simple normal crossings boundary
    $Delta_t$, all of whose coefficients lie in $\[ 0 \, 1 \)$. Then
  $ K_Z + Delta_t tilde.op_(bb(Q)) B^(-) + t A $
  is pseudoeffective.
  Apply the orbifold cotangent theorem #cite(label("CampanaPaun2019")) Theorem 1.3 and Section 5 to this smooth
    projective log-canonical pair. On a finite adapted cover $tau : tilde(Z) arrow.r Z$,
    the adapted orbifold cotangent bundle $cal(E)_t$ has determinant class $tau^(*) \( K_Z + Delta_t \)$.
    Every torsion-free quotient of each $cal(E)_t^(⊗ s)$ has nonnegative degree against $tau^(*) beta$.
    This holds for classes on the boundary of the movable cone as well.
  There is an inclusion $tau^(*) Omega_Z^1 subset.eq cal(E)_t$.
    In codimension one, at a branch $z = w^b$ corresponding to boundary coefficient $gamma$,
    the orbifold generator is $w^(- b gamma) d z$; hence the ordinary generator $d
    z$ belongs to the adapted bundle. Additional branch divisors have $gamma = 0$.
    Let $cal(N)$ be the saturation of the pulled-back line $tau^(*) N$ in $cal(E)_t^(⊗ s)$.
    Saturation adds an effective divisorial class, so
  $ deg \( tau \) thin c_1 \( N \) dot.op beta lt.eq c_1 \( cal(N) \) dot.op tau^(*) beta . $
  The quotient by $cal(N)$ is torsion-free. Its determinant has nonnegative degree,
    and the tensor determinant identity for a bundle of rank $d$ is
  $ c_1 \( cal(E)_t^(⊗ s) \) = s d^(s - 1) c_1 \( cal(E)_t \) . $
  If the quotient has rank zero, it is zero and the same inequality holds with determinant degree zero.
    Dividing by the cover degree and using (4.17) gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ c_1 \( N \) dot.op beta lt.eq s d^(s - 1) \( K_Z + Delta_t \) dot.op beta =
     s d^(s - 1) t A dot.op beta . $ <g:cf:tensor-bound>]
  Letting $t$ decrease to zero proves the assertion. ◻
]

#thm([Lemma 4.5.])[
  #emph[There are a fixed line bundle $N$ and effective divisors $D_j$ such that
#[#set math.equation(numbering: n => "(4.19)")
 $ D_j tilde.op m_j V + N \, wide m_j arrow.r + oo \, wide D_j dot.op beta = 0 \, $ <g:cf:divisor-sequence>]

 where the positive integers $m_j$ may be chosen strictly increasing and sufficiently divisible.]
] <g:cf:effective-sequence>

#proof[
  Choose $b > 0$ with $b V$ Cartier. Lemma 9 gives $b V$ bounded semipositive weights,
    and the base has no positive-degree forms by the argument preceding (4.1).
    Apply Lemma 6 to $b V$, prescribing any further divisibility required for the construction.
    It gives a cotangent line $N$ and effective divisors $D_j tilde.op N + n_j \( b V \)$ with $n_j arrow.r oo$.
    Set $m_j = b n_j$. Lemma 10 gives $N dot.op beta lt.eq 0$, while $V dot.op beta = 0$.
    Effectivity gives the opposite inequality for $D_j dot.op beta$, so every degree is zero. ◻
]

=== 4.5 Maximal zero-degree systems and horizontal interpolation <g:cf:zero-systems>

Choose a linear system of divisor class $D$ with $D dot.op beta =
  0$ whose rational map has maximal possible image dimension among all such systems.
  The constant map is permitted. This maximal dimension is smaller than $d$:
  a generically finite system makes its divisor big, whereas a nonzero supporting functional cannot vanish on a
  big class. Resolve this rational map and take its Stein factorization,
  followed by a smooth projective resolution of the Stein base. We obtain

$ h : hat(Z) arrow.r Z \, wide hat(g) : hat(Z) arrow.r W \, wide dim W < d \, $

where the general fibers of $hat(g)$ are connected.

#thm([Lemma 4.6.])[
  #emph[Every ratio of two nonzero sections in any one linear system whose divisor class has degree zero against
    $beta$ belongs to $bb(C) \( W \) subset.eq bb(C) \( Z \)$.]
] <g:cf:maximal-field>

#proof[
  Multiply the sections of that system by those defining the chosen maximal system.
    Their products form a system of degree zero, and its map is the product of the two maps followed by the Segre
    embedding. By maximality it has the same image dimension as the chosen map.
    The added section ratios are therefore algebraic over the field of that image.
    The Stein factorization identifies $bb(C) \( W \)$ with the relative algebraic closure of the image field in
    $bb(C) \( Z \)$. This proves the assertion. ◻
]

The interpolation below is a relative form of the divisor argument in #cite(label("LP2018")) proof of Theorem 3.1,
  Step 3. There, zero Iitaka dimension makes linearly equivalent effective divisors equal.
  Here the maximal-field property gives equality of their horizontal parts.
  The subsequent rank-restoration argument still has to control their vertical poles.

#thm([Lemma 4.7.])[
  #emph[The rational divisor $h^(*) V$ is rationally effective on the complete generic fiber of $hat(g)$.]
] <g:cf:horizontal-slope>

#proof[
  Use the sequence in (4.19). For $j < k < l$, linear equivalence gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ \( m_l - m_j \) D_k tilde.op \( m_l - m_k \) D_j + \( m_k - m_j \) D_l . $ <g:cf:interpolation>]
  Both sides are effective divisors in the same zero-degree system.
    By Lemma 12, their ratio is a rational function from $W$. Its pullback has no horizontal divisor over $W$.
    Thus (4.20), after pullback by $h$, is an equality of actual horizontal divisors.
  Fix the first two indices. For every horizontal prime $Q$ on $hat(Z)$,
    the coefficients of $h^(*) D_j$ have the form $a_Q + m_j b_Q$.
    The preceding identity proves this simultaneously for every index.
    Since all $D_j$ are effective and $m_j arrow.r oo$, every $b_Q$ is nonnegative.
    These slopes have finite support: they are the coefficients of the horizontal part of
  $ frac(h^(*) \( D_2 - D_1 \), m_2 - m_1) tilde.op_(bb(Q)) h^(*) V . $
  This representative of $h^(*) V$ has effective horizontal part.
    Its vertical components disappear on the generic fiber, yielding the stated linear effectivity there.
    The argument uses actual divisors and rational functions, rather than only numerical equivalence. ◻
]

=== 4.6 Preserving the section and rank conditions <g:cf:rank-preservation>

Compose $X arrow.r.dashed Z$ with $Z arrow.r.dashed W$. The composition is invariant and has connected general
  fibers: the inclusions of function fields remain relatively algebraically closed.
  Choose a smooth projective resolution $pi' : Y' arrow.r X$ dominating $Y_0$ and the map to $hat(Z)$, and write

$ f' : Y' arrow.r hat(Z) \, wide u = hat(g) compose f' . $

Multiplication of the pullback of $sigma$ by the generic section of $h^(*)
  V$ from Lemma 13 gives an invariant section of a positive multiple of $L_(Y')$ on the generic fiber of $u$.
  Thus the section condition is preserved.

To prove the rank condition, fix a sufficiently divisible $m >
  0$ and take any two nonzero invariant sections of $E_(Y') + m L_(Y')$ over the generic fiber of $u$.
  They can be extended simultaneously to global sections of

#[#set math.equation(numbering: n => "(4.21)")
 $ E_(Y') + m L_(Y') + k u^(*) A_W $ <g:cf:spreading-twist>]

for a sufficiently large integer $k$, where $A_W$ is very ample.
  For completeness, every pole divisor has image in a proper closed subset of $W$.
  A high multiple of a very ample bundle has a section in any prescribed power of the ideal of this finite union
  of images. Pullback then vanishes to at least the required orders on all the finitely many pole divisors.
  The same section clears the poles of both rational sections.
  This also handles images of codimension greater than one.
  It is a base section, so it preserves invariance and does not change their ratio.

Divide the two sections of (4.21) by the Jacobian section and $sigma^(m \/ r)$.
  The old rank condition says that the results come from rational sections on $hat(Z)$ of

$ m h^(*) V + k hat(g)^(*) A_W . $

Push their divisors down to $Z$. A pole outside $G$ is impossible:
  for a prime $P subset.eq.not G$, choose a component above $P$ on $Y_0$ with coefficient zero in $H$ and
  nonexceptional over $X$. Its strict transform on $Y'$ has coefficient zero in both the pulled-back $H$ and the
  Jacobian divisor $E_(Y')$. Since $h$ is an isomorphism at the generic point of $P$,
  a pole downstairs would remain a pole on this component, contradicting regularity of the original global section.

After bounding the poles of both sections along $G$ by a common integer $ell$,
  their ratio is a ratio of sections in the single linear system

#[#set math.equation(numbering: n => "(4.22)")
 $ m V + k h_(*) hat(g)^(*) A_W + ell G . $ <g:cf:rank-system>]

We verify that its degree against $beta$ is zero. Only the middle term needs proof. If $W$ is a point it is zero.
  Otherwise, let $A_I$ be the pullback to $W$ of the hyperplane class of the image of the defining maximal system.
  The map from $W$ to that image is generically finite, so $A_I$ is big.
  On a sufficiently high resolution of the system,

$ h^(*) D tilde.op hat(g)^(*) A_I + F \, wide F gt.eq 0 . $

Some sufficiently large multiple of $A_I$ minus $A_W$ is rationally effective, by bigness.
  Pulling back and pushing forward shows that a positive multiple of $D$ minus $h_(*) hat(g)^(*)
  A_W$ is rationally effective. The latter divisor is itself effective after choosing an effective representative
  of $A_W$. Since $D dot.op beta = 0$ and movable classes are nonnegative on effective divisors, both inequalities force

$ \( h_(*) hat(g)^(*) A_W \) dot.op beta = 0 . $

Together with (4.17), this proves the asserted zero degree of (4.22).

Lemma 12 now puts the ratio of the two original sections in $bb(C) \( W \)$.
  Thus the new invariant generic adjoint space has dimension at most one for every positive multiple of a common
  integer. The new section condition and the Jacobian supply a nonzero element in every sufficiently divisible
  degree, giving dimension exactly one. Both conditions have therefore been preserved while the base dimension has
  strictly decreased.

This proves Theorem 7. The construction is conditional on the two generic-fiber hypotheses,
  and their preservation is part of its conclusion. In particular the argument can be iterated without introducing
  a strict-curvature assumption on the base.

== 5 Boundary corrections and integrable metrics <g:bt>

Integration along a fibration can lose regularity along its discriminant.
  The correction needed to extend the resulting metric also determines which sections can be returned to the
  original variety. We keep these two roles together. Three outputs will be useful:
  a metric integrable after multiplication by a boundary section; an unweighted integrable metric;
  and a nef anti-log-canonical class for a signed boundary.
  Their slope consequences are proved under the hypotheses actually available.

A metric weight is normalized by $\| e \|^2 = exp \( - psi \)$ in a holomorphic frame.
  Integrability at exponent one therefore means integrability of $exp \( - psi \)$.
  For a rational line bundle we clear denominators and divide the resulting weight by the denominator.
  A signed rational divisor $B$ on a smooth variety defines a #emph[sub-klt pair] if every coefficient of its
  crepant boundary on a log resolution is less than one. Negative coefficients are allowed;
  a sub-klt divisor need not be an effective klt boundary.

=== 5.1 Approximation without a strict curvature hypothesis <g:bt:approximation>

The approximation below uses a fixed ample auxiliary line to produce sections.
  The metric being approximated is only semipositive. We give both the ideal-theoretic construction and the
  Gaussian construction, since the latter directly preserves the weighted integral.

#thm([Lemma 5.1.])[
  (Weighted sub-klt approximation).  #emph[Let $Y$ be smooth projective, of dimension $d > 0$,
    let $J$ be a rational line bundle with a semipositive metric of weights $psi$, and let $P gt.eq
    0$ be a rational divisor. Suppose that, in local divisor frames,
$ \| s_P \|^2 e^(- psi) in L_(upright("loc"))^1 . $

 There is a fixed ample Cartier divisor $A$ such that, for every sufficiently large divisible integer $m$,
   there is an effective rational divisor $Delta_m tilde.op_(bb(Q)) J +
   A \/ m$ for which $\( Y \, Delta_m - P \)$ is sub-klt. When $P = 0$, the pair $\( Y \, Delta_m \)$ is klt.]
] <g:bt:weighted-approximation>

#proof[
  Choose a very ample $H$ and an ample $A$ such that $A - K_Y - i H$ is ample for $1 lt.eq i lt.eq d$.
    Nadel vanishing and Castelnuovo–Mumford regularity give global generation of
  $ cal(O)_Y \( m J + A \) ⊗ cal(I) \( m psi \) . $
  Indeed its twist by $- i H$ is an adjoint sheaf with coefficient metric of strictly positive curvature,
    supplied by $A - K_Y - i H$, and multiplier ideal $cal(I) \( m psi \)$.
    The ideal is coherent and nonzero; local point extension where $psi$ is finite gives a nonzero integrable germ
    #cite(label("Nadel")) #cite(label("OhsawaTakegoshi")) #cite(label("raDemailly")).
  Let $u : Y' arrow.r Y$ resolve this ideal and $P$, and write $cal(I) \( m psi \) cal(O)_(Y') =
    cal(O)_(Y') \( - F_m \)$. For a prime $E$ on $Y'$ put
  $ b_E = "ord"_E F_m \, wide p_E = "ord"_E u^(*) P \, wide a_E = "ord"_E K_(Y' \/ Y) . $
  We claim that
  #[#set math.equation(numbering: n => "(5.1)")
   $ b_E \/ m - p_E < 1 + a_E . $ <g:bt:strict-approximation>]
  The local point-extension estimate for $m psi$ supplies holomorphic functions $v_x$ with $\| v_x \( x \) \|^2 =
    e^(m psi \( x \))$ and uniformly bounded $L^2 \( e^(- m psi) \)$ norm on fixed nested coordinate balls.
    The local upper bound for $psi$ bounds their ordinary norms, hence their suprema on a smaller ball.
    Each $v_x$ belongs to $cal(I) \( m psi \)$. At a general point of $E = \( z_1 = 0 \)$,
    Cauchy estimates after division by $z_1^(b_E)$ give
  $ e^(m psi compose u) lt.eq C_m \| z_1 \|^(2 b_E) . $
  The change-of-variables formula bounds the pulled-back integrable density below by a positive constant times $\|
    z_1 \|^(2 \( p_E + a_E - b_E \/ m \))$. Its transverse integral is finite only if (5.1) holds.
  Global generation identifies the fixed divisor of the pulled-back system with $F_m$.
    Choose a general member of the free residual system and divide the corresponding divisor downstairs by $m$.
    The crepant boundary of $Delta_m - P$ has coefficient $b_E \/ m - p_E - a_E < 1$ on each fixed component,
    and coefficient $1 \/ m < 1$ on new moving components. Bertini,
    applied also to the strata of the resolved divisor, makes their union simple normal crossings.
    Decreasing coefficients from the positive part preserves positive log discrepancies,
    proving sub-klt on every higher model.
  There is a second way to choose the member. The global Bergman lower estimate for the same sufficiently ample
    $A$ gives local expressions $s_(i \, m)$ of an orthonormal basis with
  $ sum_i \| s_(i \, m) \|^2 gt.eq C_m e^(m psi) . $
  This globalization by a fixed ample twist is the point-extension construction in #cite(label("Demailly1993"))
    Section 9, proof of Proposition 9.1. One obtains the estimate by extending from a point, cutting off,
    and solving $macron(partial)$ globally with a logarithmic pole of order $d$ at that point.
    The fixed positivity of $A - K_Y$ pays the uniformly bounded negative curvature of the cutoff pole;
    integrability forces the correction to vanish at the point.
    Singular weights are handled by decreasing regularization and weak limits in the $L^2$ estimate
    #cite(label("raDemailly")) Corollary 13.9, Remark 13.10, and Theorem 14.2.
    For independent standard complex Gaussians $c_i$ and $m > 1$,
  $ bb(E) lr(|sum_i c_i s_(i \, m)|)^(- 2 \/ m) = C'_m (sum_i \| s_(i \, m) \|^2)^(- 1 \/ m) \, $
  where $C'_m < oo$ because $bb(E) \| c_1 \|^(- 2 \/ m) < oo$.
    Multiplication by $\| s_P \|^2$ and Fubini show that almost every such member has the weighted integrability
    required for (5.1). ◻
]

The approximation retains the negative part $- P$. Its immediate use is a cotangent estimate.
  We first isolate the common slope argument.

#thm([Lemma 5.2.])[
  (From foliation determinants to tensor bounds).  #emph[Let $Y$ be smooth projective and $P gt.eq 0$ rational.
    Suppose that $- K_Y + P$ is pseudoeffective and that $K_(cal(F)) - K_Y +
    P$ is pseudoeffective for every algebraically integrable saturated foliation $cal(F) subset
    T_Y$ of positive rank and corank. Then $h P - c_1 \( M \)$ is pseudoeffective for every line subsheaf $M
    subset.eq \( Omega_Y^1 \)^(⊗ h)$, $h gt.eq 0$.]
] <g:bt:slope-principle>

#proof[
  The assertion on a point is immediate. For positive dimension, fix a nonzero movable class $alpha$ and put $t =
    alpha dot.op P gt.eq 0$. The total degree of $T_Y$ is at least $- t$.
    If its minimum Harder–Narasimhan slope were less than $- t$,
    its positive-slope part $cal(F)$ would be nonzero and proper:
    the last negative graded piece already has degree less than $- t$, whereas the whole sheaf does not.
    The quotient by the positive part has only nonpositive slopes and degree less than $- t$. In particular
  $ mu_(alpha \, min) \( cal(F) \) > 0 \, wide 2 mu_(alpha \, min) \( cal(F) \) >
    mu_(alpha \, max) \( T_Y \/ cal(F) \) . $
  The bracket map vanishes by the slope inequality, and the Campana–Păun algebraicity theorem makes $cal(F)$
    algebraically integrable #cite(label("Ou2023")) Proposition 2.2.
    But $c_1 \( T_Y \/ cal(F) \) = K_(cal(F)) - K_Y$ has degree less than $- t$, contradicting the hypothesis.
    Thus $mu_(alpha \, min) \( T_Y \) gt.eq - t$. Duality and the tensor-product rule for movable slopes give
    $c_1 \( M \) dot.op alpha lt.eq h t$ #cite(label("GKP2016")) #cite(label("CampanaPaun2019")).
    Movable-cone duality proves the assertion #cite(label("BDPP2013")).
    For $h = 0$, the inclusion in $cal(O)_Y$ proves it directly. ◻
]

#thm([Proposition 5.3.])[
  (Finite-volume cotangent estimate).  #emph[ Let $Y$ be smooth projective and $P gt.eq 0$ rational.
    If $J = - K_Y + P$ has a semipositive metric with $\| s_P \|^2 e^(- psi)$ locally integrable, then $h P -
    c_1 \( M \)$ is pseudoeffective for every line subsheaf $M subset.eq \( Omega_Y^1 \)^(⊗ h)$.
    If $dim Y > 0$ and $alpha eq.not 0$ is movable, then $mu_(alpha \, min) \( T_Y \) gt.eq - P dot.op alpha$.
    In particular, $P dot.op alpha = 0$ gives $mu_(alpha \, min) \( T_Y \) gt.eq
    0$ and $c_1 \( M \) dot.op alpha lt.eq 0$.]
] <g:bt:weighted-slope>

#proof[
  The assertion on a point is immediate. Suppose $dim Y > 0$.
    Lemma 14 gives effective $Delta_m tilde.op_(bb(Q)) - K_Y + P + A \/ m$ with $\( Y \, Delta_m - P \)$ sub-klt.
    Resolve a first-integral map for an algebraic foliation $cal(F)$ together with that pair, by $u : Y' arrow.r
    Y$. Write its crepant boundary as $B_m^(+) - B_m^(-)$, with disjoint effective parts. Then
  $ K_(Y') + B_m^(+) tilde.op_(bb(Q)) u^(*) A \/ m + B_m^(-) \, wide 0 lt.eq u_(*) B_m^(-) lt.eq P . $
  The positive boundary is klt. A general fibre of the resolved first-integral map meets the isomorphism locus of
    $u$; hence $u^(*) A$ restricts to a big divisor there. A divisible positive multiple of $K_(Y') +
    B_m^(+)$ consequently has a nonzero section on that fibre.
    Druel’s relative pseudoeffectivity theorem, in the form recalled by Ou,
    applies to the effective boundary and its log canonical general fibre #cite(label("Druel2017"))
    Proposition 4.1, #cite(label("Ou2023")) Proposition 3.1. It yields pseudoeffectivity of $K_(cal(F)') +
    B_m^(+)$. Push down, add $P - u_(*) B_m^(-) gt.eq 0$, and let $m$ tend to infinity.
    This gives $K_(cal(F)) - K_Y + P$ pseudoeffective. The metric already gives $- K_Y + P$ pseudoeffective,
    so Lemma 15 applies. This is the signed finite-volume adaptation of Ou’s tangent-slope argument;
    its relative positivity input is due to Druel. ◻
]

=== 5.2 An unweighted integral and an annihilating movable class <g:bt:unweighted>

When the integral contains no boundary factor, orbifold cotangent semipositivity gives a different estimate.
  Its hypothesis concerns $K_Y + J$, which need not be supported on an allowed-pole divisor.

#thm([Proposition 5.4.])[
  (Unweighted movable-slope estimate).  #emph[Let $Y$ be smooth projective of dimension $d > 0$,
    and let $J$ have a semipositive metric with $e^(- psi) in L_(upright("loc"))^1$.
    Suppose $K_Y + J$ is pseudoeffective. For every movable class $alpha$ and every line subsheaf $M
    subset.eq \( Omega_Y^1 \)^(⊗ h)$, $h > 0$,
#[#set math.equation(numbering: n => "(5.2)")
 $ c_1 \( M \) dot.op alpha lt.eq h d^(h - 1) \( K_Y + J \) dot.op alpha . $ <g:bt:orbifold-bound>]

 Thus $alpha dot.op \( K_Y + J \) = 0$ gives $c_1 \( M \) dot.op alpha lt.eq 0$.
   For $h = 0$ the latter inequality holds without the annihilation premise.]
] <g:bt:unweighted-slope>

#proof[
  Use Lemma 14 with $P = 0$ to obtain klt $Delta_m tilde.op_(bb(Q)) J + A \/ m$.
    On a log resolution $u : Y' arrow.r Y$ truncate the negative coefficients of the crepant boundary.
    This gives an effective simple normal crossing boundary $Delta'_m$, with coefficients less than one, and
  $ K_(Y') + Delta'_m = u^(*) \( K_Y + Delta_m \) + E_m \, wide E_m gt.eq 0 quad u upright("-exceptional") . $
  The left side is pseudoeffective. The numerical pullback $alpha'$, defined by $alpha' dot.op D =
    alpha dot.op u_(*) D$, is movable and annihilates exceptional divisors.
  On an adapted finite cover $v : hat(Y) arrow.r Y'$, the orbifold cotangent sheaf $cal(E)$ contains $v^(*)
    Omega_(Y')^1$ and satisfies $c_1 \( cal(E) \) = v^(*) \( K_(Y') + Delta'_m \)$.
    In a boundary chart its generators are pullbacks of $d x \/ x^delta$,
    where $delta$ is the boundary coefficient and the cover clears its denominator.
    Campana–Păun tensor-quotient semipositivity gives nonnegative $v^(*)
    alpha'$-degree to torsion-free quotients of $cal(E)^(⊗ h)$ #cite(label("CampanaPaun2019")) Theorem 1.3.
    The line $v^(*) u^(*) M$ injects through ordinary cotangent pullback.
    Saturating increases its determinant by an effective divisor.
    The quotient has nonnegative degree; if its rank is zero,
    the same inequality follows directly from the effective saturation divisor.
    Since $c_1 \( cal(E)^(⊗ h) \) = h d^(h - 1) c_1 \( cal(E) \)$, cancellation of the finite covering degree gives
  $ c_1 \( M \) dot.op alpha lt.eq h d^(h - 1) \( K_Y + J + A \/ m \) dot.op alpha . $
  Let $m$ increase to obtain (5.2). ◻
]

For $J = - K_Y + Theta$ with $Theta gt.eq 0$, cone duality gives $h d^(h - 1) Theta -
  c_1 \( M \)$ pseudoeffective. For $J = - K_Y + k N + R$, the proposition instead applies to a movable class
  annihilating $N$ and $R$. Both situations occur below.

=== 5.3 Weighted transfer with arbitrary exceptional poles <g:bt:exceptional>

Let $X$ be smooth projective, let $L = - K_X$ carry a smooth semipositive metric,
  and let a torus $T$ act with the natural linearization. Average the metric over a compact real form.
  For a $T$-invariant rational map to a smooth projective $Y$, let

$ X arrow.l^pi Z arrow.r^g Y $

be a smooth equivariant resolution, with geometrically integral generic fibre $F$ over $K = bb(C) \( Y \)$.
  We distinguish the following strong rank condition: there is a nonzero invariant section $s$ of $a pi^(*)
  L \|_F$, $a > 0$, and

#[#set math.equation(numbering: n => "(5.3)")
 $ dim_K H^0 #scale(x: 120%, y: 120%)[\(] F \, \( b pi^(*) L + D \) \|_F #scale(x: 120%, y: 120%)[\)]^T lt.eq
   1 $ <g:bt:all-exceptional-rank>]

for every integer $b gt.eq 0$ and every effective invariant $pi$-exceptional integral divisor $D$.
  This condition persists on higher equivariant resolutions:
  push down sections and test regularity at codimension one.
  Exceptional divisors for an additional resolution remain exceptional on the generic fibre.

Flattening by modification, followed by finite normalization, provides a normal projective model $p : W arrow.r
  X$, $f : W arrow.r Y$ with no prime divisor mapping into codimension at least two in $Y$
  #cite(label("RaynaudGruson1971")). Here and below the base function field is unchanged.
  Regard $s$ as a rational section on $W$. For every base prime $Q$, set

$ e_E = "ord"_E f^(*) Q \, wide n_Q = min_(E mapsto Q) frac("ord"_E s, e_E) \, wide N = sum_Q n_Q Q . $

The sums have finite support. Let $B$ be the reduced sum of $Q$ for which every component above $Q$ is exceptional
  over $X$. Away from $B$ define $n'_Q$ by the same minimum restricted to nonexceptional components;
  on $B$ put $n'_Q = n_Q$. Set $R = sum_Q \( n'_Q - n_Q \) Q gt.eq 0$.
  Taking a power of $s$, make $N \, R$ integral. Then

#[#set math.equation(numbering: n => "(5.4)")
 $ D_s = "div"_W \( s \) - f^(*) N gt.eq 0 \, wide f^(*) cal(O)_Y \( N \) arrow.r a p^(*) L quad
   upright("is regular") . $ <g:bt:normalization>]

Normality and the divisorial image property justify regularity.

#thm([Lemma 5.5.])[
  (Extension of the normalized maximum).  #emph[In the normalization (5.4),
    suppose the negative logarithms of the adjoint moments are psh for all sufficiently large exponents on a
    smooth connected-fibre open set. Then the maximum norm gives a semipositive metric with locally bounded
    weights on $N$.]
] <g:bt:bounded-maximum>

#proof[
  In a local frame of $N$, write $sigma$ for the regular normalized section.
    On the smooth open set, the moments have limit
  $ - m^(- 1) log integral_(Z_y) \| sigma \|^(2 m) frac(pi^(*) d mu, g^(*) d lambda_Y) arrow.r -
    log max_(Z_y) \| sigma \|^2 . $
  The fibre measure is finite and has dense positive locus.
    After normalization to total mass one, its power means increase to the maximum.
    Proper smoothness makes that maximum continuous. Integration over a fixed patch on which both factors are
    nonzero gives local upper bounds for the rescaled psh weights. The limit is therefore psh.
    No positivity of the zeroth moment is needed.
  Regularity of $sigma$ on the proper model gives a local lower bound for the limiting weight up to the boundary.
    Above each base prime a component attaining the vertical minimum has $sigma eq.not 0$ at its general point.
    In transverse coordinates the map is $y_1 = x_1^(e_E)$, with the other base coordinates free.
    A neighbourhood there meets every nearby fibre and bounds its maximum away from zero.
    This gives the upper bound needed for psh extension at general points of every omitted divisor.
    Psh extension across the remaining codimension-two set then applies;
    local upper boundedness there follows from transverse discs with boundary off the removed set.
    The lower bound persists. The extended weights are locally bounded and obey the frame transformation rule for $N$. ◻
]

#thm([Proposition 5.6.])[
  (Weighted exceptional correction).  #emph[Under (5.3), $N$ has a semipositive metric with locally bounded
    weights. For some integer $c gt.eq 0$, $- K_Y + c B$ has a semipositive metric satisfying $\| s_B \|^(2 c)
    e^(- psi) in L_(upright("loc"))^1$. A nonzero section of any positive divisible multiple of $j \( N + R \) +
    l B$, with $j > 0$ and $l gt.eq 0$, gives a nonzero invariant section of a positive multiple of $L$ on $X$.]
] <g:bt:weighted-transfer>

#proof[
  If $Y$ is a point, all the base divisors vanish and their metrics are positive constants.
    The section $s$ is then regular on $Z$ and pushes down to the required section on $X$.
    Assume henceforth that $dim Y > 0$.
  For every $m gt.eq 0$, (5.3) applied to $D = K_(Z \/ X)$ gives invariant rank one for
    $g_(*) \( K_(Z \/ Y) + \( m a + 1 \) pi^(*) L \)$. Its generator is the product of $s^m$,
    the invariant Jacobian section, and a local inverse canonical frame of $Y$.
    In a local frame of $N$, let $sigma$ be the normalized section from (5.4). The generator has squared norm
  $ I_m \( y \) = integral_(Z_y) \| sigma \|^(2 m) thin frac(pi^(*) d mu, g^(*) d lambda_Y) \, $
  where $d mu$ is the smooth volume defined by the metric of $L$. Lemma 5 applies:
    Berndtsson positivity is used on the smooth base-change locus and the invariant line is a holomorphic
    orthogonal summand. Lemma 18 then gives the bounded metric of $N$.
  For the second metric use $rho = I_0$. Its negative logarithm is psh on the smooth locus,
    and $rho thin d lambda_Y = g_(*) \( pi^(*) d mu \)$ has finite mass.
    At a general point of a prime $E mapsto Q$, choose transverse coordinates with $y_1 =
    x_1^(e_E)$ and the other base coordinates free. If $a_E = "ord"_E K_(Z \/ X)$, integration on a small patch gives
  $ rho \( y \) gt.eq C \| y_1 \|^(2 \( \( 1 + a_E \) \/ e_E - 1 \)) . $
  Outside $B$ choose a nonexceptional component, so $a_E = 0$.
    On the finitely many components of $B$ choose $c$ large enough that
  $ psi = - log rho + c log \| s_B \|^2 $
  is locally bounded above at their general points. The same bound is already available at every other omitted
    divisor. Psh extension across these divisors, then across the remaining set of codimension at least two,
    gives the metric on $- K_Y + c B$. Its weighted integral is exactly the original finite pushforward mass.
  Finally, represent a section of a positive divisible multiple of $j \( N + R \) +
    l B$ by a rational function $v$ on $Y$. After incorporating that multiple in $j \, l$, its divisor satisfies
  $ "div" \( v \) + j \( N + R \) + l B gt.eq 0 . $
  Return the rational section $s^j f^(*) v$. At a nonexceptional component $E$ above $Q subset.not B$,
    its order is at least $j \( h_E - e_E n'_Q \) gt.eq 0$, where $h_E = "ord"_E s$.
    There are no nonexceptional components above $B$, and equidimensionality excludes vertical primes over
    higher-codimension sets. Horizontal orders are nonnegative by the generic regularity of $s$.
    Thus every pole is exceptional over $X$ and disappears on pushdown. All factors are invariant. ◻
]

=== 5.4 Unweighted toroidal transfer <g:bt:toroidal>

The preceding correction uses only a divisorially equidimensional model.
  A toroidal model gives a finer rational correction and an unweighted integral.
  The rank hypothesis in the next proposition includes zero.

#thm([Proposition 5.7.])[
  (Integrable toroidal correction).  #emph[Use the smooth metric and action above.
    Let $p : W arrow.r X$ be birational with $W$ normal, and let $f : W arrow.r Y$ be projective,
    equidimensional and toroidal for strict toroidal embeddings, with $Y$ smooth.
    Include the exceptional locus of $p$ in the source boundary.
    Suppose that an invariant rational section $s$ of $a L$, $a > 0$,
    is regular on the generic fibre and that on a smooth equivariant resolved diagram
#[#set math.equation(numbering: n => "(5.5)")
 $ dim_K H^0 #scale(x: 120%, y: 120%)[\(] F \, \( K_(Z \/ X) + m a pi^(*) L \) \|_F
   #scale(x: 120%, y: 120%)[\)]^T = 1 wide \( m gt.eq 0 \) . $ <g:bt:zeroth-rank>]

 Normalize $s$ by vertical minima as in (5.4). For a boundary prime $Q$ put
$ A_E = 1 + "ord"_E K_(W \/ X) \, wide c_Q = min_(E mapsto Q) A_E / e_E \, wide Theta = sum_Q max { c_Q - 1 \, 0 } Q . $

 Then $N$ has a semipositive metric with locally bounded weights, and $- K_Y +
   Theta$ has a semipositive metric with locally integrable squared frame norms.
   The pullback $f^(*) Theta$ is exceptional over $X$.]
] <g:bt:toroidal-transfer>

#proof[
  For a point base, $N = Theta = 0$ and both metrics are positive constants. We may therefore assume $dim Y > 0$.
  Lemma 5 supplies the psh moment weights, and Lemma 18 gives the metric of $N$.
    The zeroth moment is the pushed-forward smooth volume density $rho$.
    It can be computed on a toroidal resolution of $W$, even when that model is not equivariant:
    change of variables identifies its density with the one on an equivariant resolution.
    Put $theta_Q = max { c_Q - 1 \, 0 }$ and use
  $ psi = - log rho + sum_Q theta_Q log \| s_Q \|^2 . $
  At a minimizing component the transverse calculation in the preceding proof gives $rho gt.eq
    C \| s_Q \|^(2 \( c_Q - 1 \))$. This is the local upper bound needed to extend $psi$ at general divisor
    points. Off the boundary the morphism is smooth and gives a positive lower bound.
    Extend over the remaining codimension-two set by psh removability.
  The correction $Theta$ is the divisor $A_0$ in Lemma 2. To compare the two definitions,
    it remains only to check primes outside the base boundary.
    A vertical prime above such a prime cannot belong to the source boundary of a toroidal morphism.
    Since that boundary contains the exceptional locus, the prime is nonexceptional over $X$;
    the morphism is smooth at its general point. Its Jacobian order is zero and its pullback multiplicity is one,
    so the corresponding coefficient of $A_0$ is zero.
  The rank-free discrepancy lemma now gives both the exceptional support of $f^(*) Theta$ and,
    on every smooth model $Z' arrow.r W$ with maps $pi' : Z' arrow.r X$ and $g' : Z' arrow.r Y$,
  $ "coeff"_F \( K_(Z' \/ X) - \( g' \)^(*) Theta \) > - 1 wide upright("for every prime ") F subset Z' . $
  On a simultaneous normal-crossing resolution, these are precisely the exponents of the corrected source measure
    in the projection formula
  $ e^(- psi) thin d lambda_Y = g'_(*) (product_Q \| s_Q compose g' \|^(- 2 theta_Q) \( pi' \)^(*) d mu) . $
  They make that measure locally integrable. Proper pushforward proves the required unweighted integrability on
    $Y$, including at boundary intersections. Curvature here came from the invariant zeroth moment;
    the discrepancy argument used no adjoint-rank assumption. ◻
]

No horizontal strict-curvature patch was assumed here. The output is the integrability used in Proposition 17.
  The separate toroidal-volume theorem includes the additional patch needed by its effectivity applications.

=== 5.5 The large-moment construction for eventual rank one <g:bt:eventual>

We now construct the donor metric from a positive moment.
  The hypothesis will initially specify adjoint rank only at sufficiently large degrees.
  Let $F_X = bb(C) \( X \)$, let $K subset.eq F_X^T$ be finitely generated and relatively algebraically closed in
  $F_X$, and let $s$ be a nonzero invariant rational section of $d L$, $d > 0$.
  For a prime divisorial valuation $E$ over $X$, write $a_E = "ord"_E K_(X' \/ X)$ on a smooth model carrying $E$.
  Assume

#[#set math.equation(numbering: n => "(5.6)")
 $ "ord"_E s gt.eq 0 quad upright("whenever ") "ord"_E \|_(K^(*)) = 0 \, $ <g:bt:horizontal-regular>]

and, for every sufficiently large integer $m$,

#[#set math.equation(numbering: n => "(5.7)")
 $ {t in "Rat" \( m d L \)^T : "ord"_E t + a_E gt.eq 0\
upright("for all ") E upright(" trivial on ") K} = K s^m . $ <g:bt:eventual-rank>]

Here $"Rat" \( m d L \)$ is the one-dimensional $F_X$-space of rational sections,
  with zero included in the displayed set. Both conditions concern all divisorial valuations.
  On one smooth resolution of the map to a model of $K$, they can be tested at horizontal primes:
  the divisor inequalities pull to further resolutions because the new relative canonical divisor is effective.

Together these two conditions imply rank one at every nonnegative multiple of $d$, including zero.
  Indeed, if $t$ has degree $j d$, with $j gt.eq 0$ an integer, and satisfies the displayed adjoint inequalities,
  choose $m gt.eq j$ in the eventual range. Horizontal regularity of $s$ makes $t
  s^(m - j)$ satisfy the same inequalities at degree $m d$.
  Equation (5.7) gives $t s^(m - j) in K s^m$, hence $t in K s^j$;
  the reverse inclusion follows from regularity of $s$ and $a_E gt.eq 0$.
  The distinction of the following construction is its metric:
  it uses one positive moment and retains the corresponding multiple of the normalized section line.

Choose a model $p : W arrow.r X$, $f : W arrow.r Y$ with $Y$ smooth projective,
  $W$ normal and $bb(Q)$-Gorenstein klt, and every vertical prime mapping onto a base prime.
  Such a model is obtained by toroidalization and subdivision.
  Refine target cones by source-cone images; on the induced source subdivision each ray maps to a ray or to zero.
  The reduced boundary of the initial smooth toroidal source defines a positive slicing function on its cone
  complex, linear on each cone and positive away from the origin.
  Its pullback remains positive on the induced subdivision, including on horizontal rays.
  Abramovich–Rojas #cite(label("AbramovichRojas1998")) Corollary 0.11 then gives a coherent simplicial subdivision
  without new rays. Since the target cones are smooth, every new source cone still maps to a target face;
  equidimensionality is preserved. The resulting toroidal source has quotient singularities, hence is klt.
  These are birational modifications, with no field extension #cite(label("ADK2013")) #cite(label("AK2000"))
  #cite(label("KKMSD")).

For each base prime $Q$, put

$ h_E = "ord"_E s \, wide e_E = "ord"_E f^(*) Q \, wide n_Q = min_(E mapsto Q) h_E \/ e_E \, wide N = sum_Q n_Q Q \, $

and $D = "div"_W \( s \) - f^(*) N gt.eq 0$. Define

$ r_Q = min_(E mapsto Q\
D_E = 0) a_E \/ e_E \, wide R = sum_Q r_Q Q gt.eq 0 . $

The minimum is over a nonempty finite set. Only finitely many coefficients of $N \, R$ are nonzero.

#thm([Proposition 5.8.])[
  (An integrable large moment).  #emph[There is an integer $k$ in the range of (5.7) such that
$ Xi = K_(W \/ X) + k D - f^(*) R gt.eq 0 . $

 The rational line $N$ has a semipositive metric with locally bounded weights, and $J = - K_Y + k N +
   R$ has a semipositive metric with $cal(I) \( psi \) = cal(O)_Y$.
   A nonzero section of a positive divisible multiple of $N +
   R \/ k$ returns to a nonzero invariant section of a positive multiple of $L$ on $X$.]
] <g:bt:large-moment>

#proof[
  At a component with $D_E = 0$, the definition of $r_Q$ gives $a_E - e_E r_Q gt.eq 0$.
    At the finitely many other relevant components, increase $k$ to absorb $e_E r_Q$ by $k D_E$.
    At horizontal components there is no subtraction. This proves $Xi gt.eq 0$,
    and over every $Q$ some component has $Xi_E = 0$.
  On a smooth equivariant model over $Y$ define
  $ I_m thin d lambda_Y = g_(*) #scale(x: 120%, y: 120%)[\(] \| pi^(*) s \|^(2 m) pi^(*) d mu
    #scale(x: 120%, y: 120%)[\)] . $
  For all sufficiently large $m$, (5.7) identifies the invariant adjoint line generated by the Jacobian times
    $s^m$. Smooth direct-image positivity and orthogonal compact averaging imply that $-
    log I_m$ is psh on a common smooth open. The densities are smooth there,
    so the base-change locus for an individual $m$ can be removed by continuity. High moments give
  $ I_m^(1 \/ m) arrow.r beta \( y \) = max_(Z_y) \| pi^(*) s \|^2 . $
  For this limit one may divide by $I_0$ as a positive density on the smooth open;
    no curvature assertion about $I_0$ is used. The weights of the required lines are
  #[#set math.equation(numbering: n => "(5.8)")
   $ phi_N & = - log beta + sum_Q n_Q log \| s_Q \|^2 \,\
psi & = - log I_k + sum_Q \( k n_Q + r_Q \) log \| s_Q \|^2 . $ <g:bt:large-weights>]
  The first extends with locally bounded weights by regularity of the normalized section and a minimizing
    component above every divisor, by Lemma 18.
  For the second, choose a component above $Q$ with $Xi_E = 0$.
    In coordinates $y_1 = x_1^(e_E)$ at its general point, the corrected source density has exponent
  $ a_E + k h_E - e_E \( k n_Q + r_Q \) = 0 . $
  Its pushforward is bounded below by $C \| y_1 \|^(- 2 \( 1 - 1 \/ e_E \))$.
    Thus $psi$ is bounded above at general points of every omitted divisor and extends psh there,
    then across codimension two. On a log resolution $v : hat(W) arrow.r
    W$ the exponents in the corrected source density are the coefficients of
  $ K_(hat(W) \/ X) + k v^(*) D - v^(*) f^(*) R = K_(hat(W) \/ W) + v^(*) Xi . $
  They are all greater than $- 1$, since $W$ is klt and $Xi$ is effective and $bb(Q)$-Cartier.
    Normal crossing integration and properness give $e^(- psi) in L_(upright("loc"))^1$ on the entire base.
  Finally $D - f^(*) R \/ k$ is nonnegative at each component nonexceptional over $X$, since $a_E =
    0$ there and $Xi gt.eq 0$. Pulling back a section of $N +
    R \/ k$ and multiplying by a power of $s$ leaves only exceptional poles, removed on pushdown. ◻
]

The resulting donor line is $J = - K_Y + k N + R$. Its $k
  N$ term records the positive moment used to construct it.
  Although the hypotheses also imply rank one at zero, this proof obtains integrability from $I_k$;
  it does not produce the same metric on $- K_Y + R$.

=== 5.6 Signed anti-log-canonical classes <g:bt:signed>

The third slope input starts from a nef class rather than a weighted integral.
  It will be applied to the signed discriminant produced by the toroidal density calculation.
  Its negative part measures exactly the possible loss in the cotangent estimate.

#thm([Proposition 5.9.])[
  (Signed-boundary cotangent estimate).  #emph[Let $Y$ be smooth projective and let $B$ be a rational divisor with
    simple normal crossing support and coefficients less than one.
    Write $B = B^(+) - B^(-)$ in disjoint positive and negative parts, and suppose that $- \( K_Y + B \)$ is nef. Then
$ h B^(-) - c_1 \( M \) quad upright("is pseudoeffective") $

 for every line subsheaf $M subset.eq \( Omega_Y^1 \)^(⊗ h)$, $h gt.eq 0$.
   If $dim Y > 0$ and $alpha eq.not 0$ is a movable class with $alpha dot.op B^(-) = 0$,
   this gives $mu_(alpha \, min) \( T_Y \) gt.eq 0$ and $c_1 \( M \) dot.op alpha lt.eq 0$.]
] <g:bt:signed-slope>

#proof[
  The class $- K_Y + B^(-) = - \( K_Y + B \) + B^(+)$ is pseudoeffective.
    For an algebraically integrable foliation $cal(F)$ of positive rank and corank,
    resolve its rational first-integral map together with $B$ by $u : Y' arrow.r Y$, and write
  $ K_(Y') + C = u^(*) \( K_Y + B \) \, wide C = C^(+) - C^(-) . $
  Every coefficient of $C$ is less than one: the positive part of the original simple normal crossing boundary is
    klt, and decreasing its coefficients can only increase discrepancies.
    In particular $\( Y' \, C^(+) \)$ is klt. For an ample Cartier $H$ on $Y'$ and rational $delta > 0$,
    choose a general effective rational divisor
  $ A_delta tilde.op_(bb(Q)) - u^(*) \( K_Y + B \) + delta H $
  such that $\( Y' \, C^(+) + A_delta \)$ is klt. The class is ample,
    so a sufficiently divisible multiple supplies such a member by Bertini,
    also on a general fibre of the resolved map. We have
  $ K_(Y') + C^(+) + A_delta tilde.op_(bb(Q)) C^(-) + delta H . $
  It is big on that fibre and hence has a nonzero section after taking a positive divisible multiple.
    Apply Druel’s relative pseudoeffectivity theorem #cite(label("Druel2017")) Proposition 4.1,
    in the form of #cite(label("Ou2023")) Proposition 3.1, to conclude that $K_(cal(F)') + C^(+) +
    A_delta$ is pseudoeffective. Its pushforward is numerically
  $ K_(cal(F)) - K_Y + B^(-) + delta u_(*) H . $
  Letting $delta$ decrease to zero proves $K_(cal(F)) - K_Y + B^(-)$ pseudoeffective.
    Lemma 15 now proves the assertion for every movable class, and therefore in the pseudoeffective cone. ◻
]

The distinction between the three slope inputs is now explicit.
  Proposition 16 retains the integral of a specified boundary section.
  Proposition 17 uses an unweighted integral and the class $K_Y + J$.
  Proposition 22 uses nefness of an anti-log-canonical class with a signed boundary.
  Each supplies the cotangent inequality needed for the corresponding contraction;
  none asserts a global strict-curvature lower bound.

== 6 Choosing a smaller base <g:reductions>

We now prove allowed-pole nonvanishing using the two metrics of Section 3 and the weighted cotangent estimate of
  Proposition 16. The first two proofs apply when there are no positive-degree holomorphic forms;
  the third gives a different choice of base in the rationally connected case.
  All three start from effective divisors with a fixed cotangent twist and must produce both a horizontal section
  and every required adjoint rank.

=== 6.1 The common section conclusion <rb:reductions>

#thm([Theorem 6.1.])[
  (Allowed-pole nonvanishing).  #emph[ Let $V$ be a smooth connected projective variety over $bb(C)$ with
    $H^0 \( V \, Omega_V^j \) = 0$ for every $j > 0$. Let $D gt.eq 0$ be integral and suppose $- K_V +
    D$ carries a semipositive singular metric whose measure $\| s_D \|^2$ has finite mass.
    If a line bundle $L$ carries a semipositive metric with bounded weights, then
$ H^0 \( V \, a L + c D \) eq.not 0 $

 for some integers $a > 0$ and $c gt.eq 0$. The same statement holds for a rational line bundle $L$,
   with $a$ clearing its denominator.]
] <g:allowed>

In the three proofs below, whenever a dominant rational map from $V$ with connected general fibers is selected,
  use the model diagram of Section 3.1, with smooth projective base $Y$.
  Thus $macron(p) : macron(V) arrow.r V$ is birational, $macron(f) : macron(V) arrow.r
  Y$ is surjective and equidimensional with $macron(V)$ normal, and a smooth resolution $W arrow.r
  macron(V)$ has composite maps $p : W arrow.r V$ and $f : W arrow.r Y$. We write $J = K_(W \/ V)$.

=== 6.2 Maximal systems dominated by the target and boundary <rb:dominated>

#proof[
  #emph[First proof of Theorem 6.1.] Clear the denominator of $L$. We induct on $dim V$; a point is immediate.
    Call a nonempty linear system in a line bundle $P$ admissible if
  $ a L + c D - P quad upright("is pseudoeffective") $
  for some integers $a > 0 \, c gt.eq 0$. The constant system is admissible,
    and products of admissible systems are admissible. Choose one whose image dimension is maximal.
    If it is generically finite, then $P$ is big. Consequently $a L + c D$ is big,
    which supplies a section after a positive multiple. Otherwise,
    resolve its map and take the relative algebraic closure of its image field to obtain $f : W arrow.r
    Y$ with connected general fibres and $dim Y < dim V$.
  Every ratio of sections in every admissible system belongs to $bb(C) \( Y \)$.
    Indeed adjoining such ratios cannot increase image dimension, since products of the systems remain admissible.
    The ratios are therefore algebraic over the chosen image field and belong to its relative algebraic closure.
    This argument also covers subsystems and pencils.
  Lemma 3.3 gives $N_i tilde.op M + m_i L$, while Proposition 5.3 gives $- M +
    k D$ pseudoeffective for some $k gt.eq 0$. Systems in all positive combinations of the $N_i$ are therefore
    admissible. For $i < j < l$ the two effective divisors
  $ \( m_l - m_j \) N_i + \( m_j - m_i \) N_l \, wide \( m_l - m_i \) N_j $
  are linearly equivalent, so the rational function relating them lies in $bb(C) \( Y \)$.
    After pullback, their horizontal parts are equal. It follows that the horizontal multiplicity at every prime
    is affine in $m_i$. Fixing $i < j$ and letting $l$ tend to infinity shows that its slope is nonnegative.
    Thus $N_j - N_i$ defines a rational section $rho$ of $\( m_j - m_i \) L$ with no horizontal poles on $W$,
    and hence on $macron(V)$. If $Y$ is a point, it has no poles and already proves the theorem.
  For a positive-dimensional base we verify the rank-one condition.
    Let $P$ denote the original maximal system and let $A_0$ be the pullback to $Y$ of its image hyperplane class.
    It is big and $p^(*) P - f^(*) A_0$ has an effective representative.
    Given a sufficiently ample base divisor $H$, a positive multiple of $A_0$ dominates $H$ up to an effective
    divisor. Therefore $p_(*) f^(*) H$ is dominated in the pseudoeffective order by a positive multiple of $L$
    plus a nonnegative multiple of $D$.
  If $J + p^(*) D + m p^(*) L$ has two independent sections on a generic fibre,
    spread them out and clear their vertical poles using $f^(*) H$ with $H$ sufficiently ample.
    Their pushdowns are sections of $D + m L + p_(*) f^(*) H$;
    the exceptional Jacobian $J$ contributes zero under pushdown.
    This system is admissible, but its ratio is nonconstant on the generic fibre,
    contrary to the maximality property. Hence its generic dimension is at most one for every $m gt.eq 0$.
    For the multiples of the exponent just constructed, $s_(J + p^(*) D)
    rho^l$ supplies a nonzero generic section, including $l = 0$. Lemmas 3.2 and Lemma 3.1 apply.
  The base has no positive-degree holomorphic forms: pullback by the dominant map is injective,
    and forms on the smooth birational model identify with forms on $V$.
    The descended data thus satisfy exactly the hypotheses of the theorem in lower dimension.
    Induction gives a section with poles on $D_Y$, and Lemma 3.1 carries it to a section with poles only on $D$.
    An integral multiple of $D$ clears those finitely many poles. ◻
]

=== 6.3 A supporting class and maximal combinations <rb:zero-degree>

Here is a different choice of the dimension-reducing map.
  It uses only effective combinations of the determinant divisors and the permitted boundary,
  instead of all pseudoeffectively dominated systems.

#proof[
  #emph[Second proof of Theorem 6.1.] Again induct on dimension and clear denominators.
    If $L + D$ is big, a positive multiple has a section. Otherwise $L +
    D$ lies on the boundary of the pseudoeffective cone. Cone duality gives a nonzero movable class $alpha$ such that
  $ L dot.op alpha = D dot.op alpha = 0 . $
  The zero-degree part of Proposition 5.3 and the determinant construction give $N_i tilde.op M +
    m_i L$ with $M dot.op alpha lt.eq 0$. Effectivity forces $N_i dot.op alpha = M dot.op alpha = 0$.
    No nonnegative integral combination of $D \, N_1 \, N_2 \, dots.h$ is big.
  Choose such a combination $G$ of maximal Iitaka dimension $d < dim V$.
    Take a multiple realizing dimension $d$, resolve its map, and take the connected-fibre base $Y$.
    Every ratio from the linear system of any allowed combination lies in $bb(C) \( Y \)$,
    since adding systems and multiplying sections cannot increase $d$. If $H$ is any base divisor, then
  #[#set math.equation(numbering: n => "(6.1)")
   $ a p^(*) G - f^(*) H tilde.op E_H gt.eq 0 $ <rb:ample-domination>]
  for some sufficiently large $a$: the resolved system contains the pullback of the image hyperplane class,
    whose transform on $Y$ is big.
  We need the following stronger form of the ratio assertion.
    A rational function whose horizontal poles on $W$ are bounded by $p^(*) G' + E$,
    where $G'$ is an allowed combination and $E$ is effective and $p$-exceptional, belongs to $bb(C) \( Y \)$.
    Its remaining poles are vertical. Choose an effective sufficiently ample $H$ whose pullback bounds them;
    a base divisor can contain the images of all these finitely many poles,
    including images of codimension at least two, to the necessary orders.
    By (6.1), the function is a ratio of sections of $p^(*) \( G' + a G \) + E$.
    Normality gives $p_(*) cal(O)_W \( E \) = cal(O)_V$, so the exceptional term adds no sections.
    The original ratio assertion proves the claim.
  The three-index relations among the $N_i$ now imply affine horizontal multiplicities exactly as in the first
    proof. Let $rho$ have divisor $N_j - N_i$ and exponent $k = m_j - m_i > 0$.
    It has no horizontal poles, and its horizontal zeros are bounded by $p^(*) N_j$.
    On a generic fibre $s_(J + p^(*) D) rho^l$ is a nonzero section of $J + p^(*) D + l k p^(*) L$.
    The ratio of any other section to this one has horizontal poles bounded by
  $ J + p^(*) D + l p^(*) N_j . $
  The stronger ratio assertion makes that ratio a base function.
    Thus the generic section space is one-dimensional for every $l gt.eq 0$. If $d = 0$, $rho$ is already regular.
    Otherwise Lemmas 3.2 and Lemma 3.1 give the two required metrics and the controlled boundary on the smaller
    base. Absence of holomorphic forms descends, so dimension induction completes the proof. ◻
]

=== 6.4 Maximal fibre spaces on a rationally connected variety <rb:max-fibration>

For rationally connected varieties one can choose a maximal fibre space by two numerical and generic-section
  properties. We give this construction because its rank-one conclusion follows by enlarging a field,
  rather than by fixing one class of systems in advance.

#thm([Proposition 6.2.])[
  #emph[The conclusion of Theorem 6.1 on a rationally connected $V$ follows by dimension induction through
    rationally connected bases, using fibre spaces that satisfy the following two conditions:
    for an ample divisor $H$ on the base,
$ a L + c D - p_(*) f^(*) H med upright("is pseudoeffective for some ") a > 0 \, c gt.eq 0 \, $

 and a positive multiple of $p^(*) L$ has a nonzero section on the generic fibre without additional $D$-poles.]
] <rb:rc-method>

#proof[
  Suppose no positive multiple of $L$ has a section with poles only on $D$.
    In particular no $a L + c D$ with $a > 0 \, c gt.eq 0$ is big.
    Rational connectedness gives absence of holomorphic forms, so take the determinant divisors $N_i tilde.op M +
    m_i L$ and the inequality $- M + k D$ pseudoeffective. Let $K$ be the relative algebraic closure in
    $bb(C) \( V \)$ of the field generated by functions with divisors
  $ \( m_l - m_j \) N_i + \( m_j - m_i \) N_l - \( m_l - m_i \) N_j \, wide i < j < l . $
  These functions exist because the displayed divisor class is zero.
    A finite selection gives the same transcendence degree, and the relative algebraic closure is a finite
    extension of a finitely generated subfield. Thus $K$ defines a smooth projective base after resolution.
  Each of those functions is represented by a pencil whose total bundle has class $u L + v M$, with $u \, v > 0$.
    Finitely many such pencils give a generically finite map from the base to their combined image;
    the sum of the pulled-back hyperplane classes is therefore big on the base.
    The resolved pencils are bounded above by their total bundles.
    Pushing down and using $- M + k D$ pseudoeffective proves the first condition of the proposition.
    A large multiple of the big base class dominates any chosen ample divisor,
    so the same condition holds with an ample divisor.
  On the generic fibre all the displayed principal divisors vanish.
    The effective restrictions of the $N_i$ therefore have affine multiplicities in $m_i$.
    Their slope is nonnegative by the unbounded sequence, so $N_j - N_i$ supplies the second condition.
    A point base would already give a regular section, contrary to our supposition.
    A base of full dimension would make the pushdown of an ample base class big, hence would make some $a L +
    c D$ big, also impossible. We have found a base of dimension strictly between zero and $dim V$.
  Choose, among fibre spaces with these two properties, one with maximal base dimension.
    The properties survive higher models. For the first, pullback of an ample class to a birational base model is
    big and a large multiple dominates every fixed divisor; pulling and pushing preserve effectivity.
    The second is the regularity of a fixed rational section over the generic fibre, which survives resolution.
  Let $rho$ be the supplied generic section of $k p^(*) L$.
    If $J + p^(*) D + m k p^(*) L$ had two independent generic sections,
    their ratio would be transcendental over the relatively algebraically closed base field.
    Adjoining it and taking relative algebraic closure enlarges the base dimension.
    Clear the two sections’ vertical poles by a base twist $f^(*) H'$. Their ratio pencil has class
  $ J + p^(*) D + m k p^(*) L + f^(*) H' . $
  Add an ample system from the old base. The product map supplies a big class on the enlarged base.
    On pushdown $J$ vanishes, and the first property for the old map bounds the remaining class by a multiple of
    $L$ plus a multiple of $D$. Thus the first property holds for the enlarged map.
    Restricting $rho$ to its new generic fibre gives the second property and stays nonzero at the generic point.
    This contradicts maximality.
  The spaces in Lemma 3.2 consequently have dimension at most one and have a nonzero element $s_(J + p^(*) D)
    rho^m$, also at $m = 0$. Transfer gives the required data on the smaller base,
    which is rationally connected because it is a smooth projective model of a rational image of $V$.
    Induction gives its permitted section and transfer gives one on $V$, the required contradiction. ◻
]

== 7 Logarithmic orbit integrals and invariant sections <g:orbits>

The invariant problem uses the natural action on $- K_V = det T_V$.
  Twisting this action by a character changes the invariant subspace and is not part of the statement.
  Both proofs below construct the two weights required by Lemma 4:
  a pushforward-volume weight and a fiber-supremum weight. The first obtains their plurisubharmonicity from
  invariant adjoint rank one; the second obtains it by logarithmic orbit integration.
  The second calculation is independent of invariant direct-image curvature,
  while its final section construction still uses the allowed-pole induction already proved.

#thm([Theorem 7.1.])[
  #emph[Let $V$ be a smooth connected projective variety over $bb(C)$ with $H^0 \( V \, Omega_V^j \) =
    0$ for all $j > 0$. Suppose $- K_V$ has a smooth Hermitian metric of semipositive curvature.
    For any algebraic torus $T$ acting on $V$, there is an integer $m > 0$ such that
$ H^0 \( V \, - m K_V \)^T eq.not 0 $

 for the natural anticanonical action.]
] <rb:invariant>

=== 7.1 The rank-one quotient construction <the-rank-one-quotient-construction>

#proof[
  Average local weights, with their line-bundle transition rule,
    over the compact form of $T$ using the natural linearization.
    This gives a smooth semipositive metric invariant under that compact group.
    If the action is trivial, Theorem 6.1 applies with $D = 0$ and $A = L = - K_V$.
    Otherwise take the rational quotient with field $bb(C) \( V \)^T$ #cite(label("Rosenlicht1956"))
    #cite(label("BellGhiocaReichstein2017")), and its connected-fibre smooth projective model $Y$.
    The invariant field is relatively algebraically closed in $bb(C) \( V \)$:
    an element algebraic over it has a finite orbit, and the connected torus acts trivially on that orbit.
    General fibres contain a dense orbit.
  Choose the model diagram equivariantly, by modifying the trivially acted-on base,
    normalizing the dominating graph, and taking an equivariant resolution.
    Write $p : W arrow.r V$ and $f : W arrow.r Y$ for the smooth resolution maps, $J = K_(W \/ V)$,
    and $macron(V)$ for the normal equidimensional intermediate model of Section 3.1.
    Let $r$ be the orbit dimension. A wedge of $r$ independent infinitesimal action fields is an invariant regular
    relative anticanonical section on the generic fibre; commutativity of $T$ gives invariance.
    A rational frame of $- K_Y$ and the canonical Jacobian section $s_J$ put it in
  $ p^(*) \( - K_V \) = - K_(W \/ Y) + f^(*) \( - K_Y \) + J . $
  It has no horizontal poles. Regard this section of $p^(*) \( - K_V \)$ birationally as a rational section $rho$
    on $V$. The Jacobian section is invariant for the induced canonical actions.
    The ratio of any two invariant sections of $J + m p^(*) \( - K_V \)$ is a rational invariant function,
    hence belongs to the base field. The sections $s_J \( p^(*) rho \)^m$ supply the nonzero element at every $m
    gt.eq 0$, including $m = 0$. Thus the invariant rank-one condition holds.
  If $Y$ is a point, the full wedge of infinitesimal fields on $V$ already gives a global invariant anticanonical
    section. Otherwise the invariant case of Lemma 3.2 and Lemma 3.1 gives a bounded semipositive base bundle and
    a finite-volume donor metric. The base has no holomorphic forms by dominant pullback,
    and Theorem 6.1 gives a section with permitted base poles.
    Its transferred section is invariant, and its only permitted poles on $V$ lie in $D = 0$. It is therefore regular. ◻
]

=== 7.2 A direct integral argument on logarithmic orbits <a-direct-integral-argument-on-logarithmic-orbits>

We next establish the two psh functions needed for transfer by an integral calculation,
  independently of the invariant direct-image curvature argument.
  The calculation uses the variance estimate of Brascamp–Lieb #cite(label("BrascampLieb1976"));
  we include the needed proof on a convex ball to make the limiting procedure explicit.
  The integral calculation is a complex Prékopa argument, related to Berndtsson’s formulations
  #cite(label("Berndtsson1998")) #cite(label("Berndtsson2006"));
  the supremum assertion is the corresponding minimum principle of Kiselman #cite(label("Kiselman1978")).
  The tube-domain formulation in #cite(label("DengWangZhangZhou2018")) Theorem 1.1 gives a direct comparison for
  that second assertion. We prove both statements here because the almost-everywhere finite integrals and the
  exhaustion limits are precisely the data used by the transfer construction.

#thm([Lemma 7.2.])[
  (Integral and supremum weights).  #emph[ Let $r gt.eq 0$ be an integer, let $U$ be a complex manifold,
    and let $Phi \( z \, x \)$ be a smooth function on $U times
    bb(R)^r$ such that $Phi \( z \, "Re" w \)$ is plurisubharmonic on $U times bb(C)^r$. Suppose
$ 0 < integral_(bb(R)^r) e^(- Phi \( z \, x \)) thin d x < oo $

 for almost every $z$. Then the almost-everywhere functions
$ - log integral_(bb(R)^r) e^(- Phi \( z \, x \)) thin d x \, wide - log sup_(x in bb(R)^r) e^(- Phi \( z \, x \)) $

 have psh representatives, whenever the second expression is taken on the locus where its supremum is finite and
   positive. Under the stated integrability assumption that supremum is finite and positive for almost every $z$.]
] <g:prekopa>

#proof[
  For $r = 0$, give $bb(R)^0$ its unit mass. Both expressions equal $Phi \( z \)$, so the assertion is immediate.
    Assume $r > 0$. Plurisubharmonicity implies convexity of $x mapsto Phi \( z \, x \)$.
    An integrable positive smooth log-concave function on $bb(R)^r$ is bounded.
    To see this, choose a fixed ball on which its value is at least $c > 0$.
    If values $a_j$ at points $x_j$ tended to infinity, log-concavity on the midpoint ball between $x_j$ and that
    fixed ball would give a lower bound $\( c a_j \)^(1 \/ 2)$ on a ball of a fixed positive volume.
    Its integral would tend to infinity, a contradiction. This proves the last assertion.
  Fix a bounded real ball $D$ and first replace $Phi$ by $Phi + epsilon.alt \| x \|^2$,
    so the Hessian in $x$ is positive definite. Until $epsilon.alt$ is sent to zero,
    write $Phi$ for this regularized weight. Restrict the base variable to a complex disc.
    Let $bb(E)$ denote expectation for the probability density proportional to $e^(- Phi)$ on $D$.
    Differentiating under the integral gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ frac(partial^2, partial z partial macron(z)) (- log integral_D e^(- Phi) thin d x) =
     bb(E) Phi_(z macron(z)) - bb(E) \| Phi_z - bb(E) Phi_z \|^2 . $ <rb:variance>]
  For a smooth real weight $b$ whose Hessian $b_(x x)$ is positive definite on $macron(D)$, put
  $ bb(E)_b F = frac(integral_D F e^(- b) d x, integral_D e^(- b) d x) . $
  The Brascamp–Lieb bound is
  #[#set math.equation(numbering: n => "(7.2)")
   $ bb(E)_b \| v - bb(E)_b v \|^2 lt.eq bb(E)_b #scale(x: 120%, y: 120%)[\(]
     b_(x x)^(- 1) \( nabla v \, nabla macron(v) \) #scale(x: 120%, y: 120%)[\)] . $ <rb:bl>]
  Here it is enough to prove it for smooth real mean-zero $v$ and then add the estimates for real and imaginary
    parts. The bounded-domain form and its Neumann identity are also proved in
    #cite(label("KolesnikovMilman2017")) Theorems 1.1 and 1.2(1), and Section 3.3.
    The preceding addition of $epsilon.alt \| x \|^2$ provides the stated positive definiteness;
    the limit $epsilon.alt arrow.b 0$ is taken afterwards.
  Solve the weighted Neumann problem
  $ \( - Delta + nabla b dot.op nabla \) u = v \, wide partial_(upright(bold(n))) u = 0 . $
  The mean-zero condition is precisely its solvability condition on the ball.
    Weighted integration by parts and the differentiated equation give
  $ integral_D v^2 e^(- b) = integral_D \| nabla^2 u \|^2 e^(- b) +
    integral_D b_(x x) \( nabla u \, nabla u \) e^(- b) + integral_(partial D)
    upright("II") \( nabla u \, nabla u \) e^(- b) . $
  The boundary second fundamental form $upright("II")$ is nonnegative because $D$ is convex,
    and $nabla u$ is tangential there. Also $integral_D v^2 e^(- b) =
    integral_D nabla v dot.op nabla u thin e^(- b)$. Cauchy–Schwarz for the quadratic form $b_(x x)$ bounds the
    latter integral by
  $ (integral_D b_(x x)^(- 1) \( nabla v \, nabla v \) e^(- b))^(1 \/ 2)
    (integral_D b_(x x) \( nabla u \, nabla u \) e^(- b))^(1 \/ 2) . $
  Combining the two identities gives (7.2), including the case of zero variance by continuity.
  Apply (7.2) with $b \( x \) = Phi \( z \, x \)$ and $v = Phi_z$.
    The complex Hessian of $Phi \( z \, "Re" w \)$ is positive semidefinite. Its Schur complement gives
  $ Phi_(z macron(z)) gt.eq Phi_(z x) \( Phi_(x x) \)^(- 1) Phi_(x macron(z)) . $
  The factors $1 \/ 2$ in complex vertical derivatives cancel against the factor $1 \/ 4$ in the vertical Hessian.
    Equations (7.1) and (7.2) prove plurisubharmonicity of $- log integral_D e^(- Phi) d x$.
    Decreasing $epsilon.alt$ to zero preserves this conclusion.
    Exhausting $bb(R)^r$ by balls gives a decreasing sequence of psh functions;
    its almost-everywhere finite limit is the first required representative.
  For the supremum, use the high-power integral argument of #cite(label("Berndtsson2006")) p. 1635,
    following Theorem 1.2: take the probability-normalized Lebesgue measure on $D$ and replace $Phi$ by $l Phi$,
    with integers $l gt.eq 1$. The functions
  $ - 1 / l log (frac(1, \| D \|) integral_D e^(- l Phi) d x) $
  are psh and decrease with $l$, by monotonicity of $L^l$ norms. Their finite limit is $- log sup_D e^(- Phi)$.
    Increasing the balls again gives a decreasing psh limit, finite almost everywhere by the first paragraph.
    This is the second representative. ◻
]

#proof[
  #emph[Orbit-integral proof of Theorem 25.] If the torus acts trivially, apply Theorem 23 with $D = 0$ and $A =
    L = - K_V$. Assume the action is nontrivial. Give $L = - K_V$ the same compact-torus-invariant smooth
    semipositive metric and let $mu$ be its smooth positive volume.
    Use the maps $p : W arrow.r V$, $f : W arrow.r Y$ and intermediate model $macron(V)$ recalled in the first
    proof. Divide out the ineffective kernel of the torus action.
    The effective torus has trivial generic stabilizer. Indeed a subgroup fixing the generic point would act
    trivially on the function field and hence on $V$; subgroups of a split torus are determined by their character
    lattices, so the geometric generic stabilizer is such a fixed subgroup.
    The generic orbit over the rational quotient field is consequently a torsor under a split torus.
    Hilbert’s Theorem 90 trivializes it. Spreading out gives a dense orbit family $T times
    Y^0$ over a nonempty base open set. These quotient and triviality statements use
    #cite(label("Rosenlicht1956")) #cite(label("BellGhiocaReichstein2017")) for the quotient and
    #cite(label("MilneAlgebraicGroups2017")) Corollary 3.47 and Proposition 3.50 for split-torus torsor triviality.
  On this product take logarithmic coordinates $t_j = e^(x_j + i theta_j)$ on $T$,
    with $x in bb(R)^r$ and $theta in \( bb(R) \/ 2 pi bb(Z) \)^r$.
    Wedge the logarithmic action fields with a base coordinate anticanonical frame to obtain a frame $sigma$ of
    $L$ along the product. Its weight
  $ Phi \( y \, x \) = - log \| sigma \|^2 $
  is smooth and psh in $\( y \, x + i theta \)$, and is independent of $theta$ by compact invariance. In one coordinate,
  $ i / 2 frac(d t_j, t_j) and frac(d macron(t)_j, macron(t)_j) = d x_j and d theta_j . $
  The top form dual to the logarithmic anticanonical frame therefore identifies the volume with a fixed positive
    constant times $e^(- Phi) thin d x thin d theta thin d lambda_y$.
    Angular integration contributes a positive constant independent of $y$.
    The complement of the orbit family is algebraic and has measure zero.
    Consequently the pushforward density of $mu$ is
  $ g_0 \( y \) = C integral_(bb(R)^r) e^(- Phi \( y \, x \)) d x $
  almost everywhere. It is finite almost everywhere by Fubini.
  Choose a nonzero rational base anticanonical frame. It differs from the coordinate frame by a base factor and
    gives an invariant rational section $rho$ of $L$. For almost every general fibre,
    the supremum of $\| rho \|^2$ on its dense orbit is finite by Lemma 7.2.
    It follows that $rho$ has no horizontal pole on the normal intermediate model $macron(V)$:
    a pole along a horizontal prime would make its norm unbounded near that prime on a general compactified fibre,
    and the dense orbit approaches its general points. The smooth metric is comparable to a positive smooth frame
    there, so such unboundedness cannot be hidden in the norm.
    Normality therefore makes the section regular on the complete generic fiber of $macron(V) arrow.r Y$,
    and its pullback to $W$ remains regular.
  The supremum on the dense orbit equals the essential supremum for transfer,
    since the rational section is now regular on the generic fibre and the metric is continuous.
    Lemma 7.2 proves both $- log g_0$ and $- log S_rho$ psh on the quotient open set;
    nonzero base frame factors contribute only pluriharmonic terms.
    If the quotient is a point, the same no-horizontal-pole argument already says that $rho$ is a regular
    invariant section. Assume now $dim Y > 0$. Apply Lemma 4 with $D = 0$, $A = L = - K_V$, $k = 1$,
    and this rational section $rho$. The preceding calculation supplies its two psh weights.
    Vertical normalization, properness, and the bounded input metric give the local upper bound for the normalized
    section norm; a component attaining the vertical minimum gives the complementary lower bound.
    Thus the transfer produces a bounded metric on its line $B$ and a finite-volume metric on the different line
    $- K_Y + D_Y$. Theorem 23 applies on $Y$, which inherits the absence of positive-degree holomorphic forms by
    dominant pullback. The output has the explicit form $\( psi compose f \) \( p^(*) rho \)^m$ on $W$ for a
    rational base function $psi$. Its birational pushdown to $V$ is therefore invariant.
    Since the initial boundary was $D = 0$, the support conclusion of transfer removes all divisorial poles on
    $V$. This completes the orbit-integral proof. ◻
]

=== 7.3 The rationally connected variant <rb:rc-invariant>

If $V$ is rationally connected, the first proof also closes using only Proposition 24 as its nonvanishing input.
  Here is the exact substitution. For the trivial action, apply that proposition with $A = L = - K_V$ and $D = 0$.
  For a positive-dimensional orbit, construct $rho$ and the invariant rank-one spaces exactly as above,
  retaining $m = 0$. The rational quotient base $Y$ is rationally connected,
  since it is a smooth projective model of a dominant rational image of $V$.
  The two metric lemmas give $B$ with bounded semipositive weights and $A_Y = - K_Y +
  P$ with finite distinguished volume, where $P$ is the allowed-prime divisor.
  Thus Proposition 24 applies on $Y$ with target $B$ and boundary $P$.
  Its section transfers to an invariant section on $V$, and the support assertion gives no pole because the
  original boundary is zero. The point quotient is handled by the full wedge of action fields,
  as in the first proof. Consequently the maximal-fibre-space argument supplies invariant anticanonical
  nonvanishing on every rationally connected smooth projective $V$ with a smooth semipositive anticanonical metric.

== 8 Section-ratio fields and horizontal regularity <g:cf:fields>

The contraction in Theorem 7 uses a maximal linear system. There is an intrinsic description of its base field:
  it consists of the rational functions whose zeros and poles have degree zero against the supporting movable
  class. This identification lets us compare two ways of producing the new generic section.
  Affine interpolation uses the precise relation between three twists.
  A second argument uses finite horizontal support and the ordering of nonnegative integer vectors.
  We first separate the regularity and uniqueness conditions that both arguments must preserve.

=== 8.1 Regularity on the original variety and on a resolution <g:cf:conditions>

Let $X$ be smooth connected projective, let an algebraic torus $T$ act on $X$,
  and let $L$ be a $T$-linearized line bundle. Fix a relatively algebraically closed subfield $bb(C) subset.eq K
  subset.eq bb(C) \( X \)^T$. A divisorial valuation is #emph[horizontal over $K$] when it is zero on $K^(*)$;
  on a proper model mapping to a projective model of $K$, this means that its center dominates the base.
  All orders of sections on higher models refer to pullbacks of their line bundles.

Suppose $s$ is an invariant rational section of $a L$, where $a > 0$,
  whose pullback is regular on the complete generic fiber of a resolution of the map defined by $K$.
  This is a condition on every horizontal divisorial valuation, including exceptional ones.
  It is unchanged by further resolution, because a regular section pulls back regularly;
  the converse follows by pushforward and normality. The uniqueness condition below, in contrast,
  tests the other rational sections only at prime divisors of $X$ itself.

#thm([Lemma 8.1.])[
  (Two equivalent uniqueness conditions).  #emph[With these data, the following statements are equivalent.]
  + #emph[For every integer $j gt.eq 0$ and every nonzero invariant rational section $u$ of $j a
    L$ with no poles at the $K$-horizontal primes of $X$, one has $u \/ s^j in K$.]
  + #emph[For every integer $b gt.eq 0$, the ratio of any two nonzero invariant rational sections of $b
    L$ having no poles at the $K$-horizontal primes of $X$ belongs to $K$.]
  #emph[Both statements include degree zero.]
] <g:cf:uniqueness>

#proof[
  The second assertion implies the first by comparing $u$ with $s^j$;
    the regularity hypothesis on $s$ guarantees that this comparison is permitted.
    Conversely, let $u_1 \, u_2$ have degree $b$. The first assertion applied to $u_i^a$ gives $u_i^a \/ s^b in
    K$. Hence $\( u_1 \/ u_2 \)^a in K$, and relative algebraic closedness puts $u_1 \/ u_2$ in $K$.
    This argument also applies when $b = 0$. ◻
]

These equivalent formulations do not identify regularity at original primes with regularity at all upstairs
  primes. The latter is the stronger regularity requirement on the chosen section $s$.
  In particular, a uniqueness assertion that tests only sections already regular at every upstairs horizontal
  prime is not, without another argument, the uniqueness assertion in Lemma 27.

For $L = - K_X$, these data imply the adjoint rank hypotheses of Theorem 7.
  Indeed, on a smooth resolution $pi : Z arrow.r X$, $g : Z arrow.r Y$, put $R = K_(Z \/ X)$.
  Dividing an invariant section of $R + j a pi^(*) L$ over the generic point of $Y$ by the Jacobian section gives
  a rational section of $j a L$ without poles at horizontal primes of $X$:
  their strict transforms have coefficient zero in $R$. Lemma 27 makes it a $K$-multiple of $s^j$.
  Conversely $s^j s_R$ is present. Thus the invariant rank is one for every $j gt.eq 0$.
  This implication uses the original-prime test; adjoint rank alone does not license replacing it by a test on
  arbitrary rational sections with exceptional poles.

=== 8.2 The null-prime field is the maximal-system field <the-null-prime-field-is-the-maximal-system-field>

#thm([Lemma 8.2.])[
  #emph[Let $Y$ be a smooth connected projective variety of dimension $d > 0$ and let $alpha eq.not
    0$ be a movable numerical curve class. Call a prime divisor $P$ #emph[null] if $alpha dot.op P = 0$, and set
$ K_alpha = { 0 } union { u in bb(C) \( Y \)^(*) : "Supp" \( "div" u \) upright(" consists of null primes") } . $

 Then $K_alpha$ is relatively algebraically closed in $bb(C) \( Y \)$ and has transcendence degree less than $d$.
   It is the field of the Stein base of any linear system of degree zero against $alpha$ having maximal image
   dimension among all such systems. Every prime of $Y$ vertical over $K_alpha$ is null.
   If $"Pic" \( Y \)$ is finitely generated, only finitely many null primes are horizontal over $K_alpha$.]
] <g:cf:null-field>

#proof[
  Products and inverses preserve the support condition. The poles of a nonzero sum remain on null primes.
    Since a principal divisor has degree zero, its effective zero divisor then has degree zero as well;
    movability makes each of its components null. Thus $K_alpha$ is a field.
  Equivalently, every valuation at a non-null prime is trivial on $K_alpha$.
    Such a valuation remains trivial on an element algebraic over that field.
    An element of positive valuation cannot satisfy a polynomial with nonzero constant term over the field,
    since that term would uniquely have minimal valuation. Applying the same argument to the inverse excludes
    negative valuation. This proves relative algebraic closedness.
  If $u_1 \, dots.h \, u_d in K_alpha$ were algebraically independent,
    the sum $P$ of their polar divisors would be null. The monomials of total degree at most $m$ in the $u_i$ are
    linearly independent sections of $m P$, so $P$ would be big.
    A nonzero functional nonnegative on the pseudoeffective cone is strictly positive on its interior.
    Thus $alpha dot.op P > 0$, a contradiction.
  Every ratio in a zero-degree system belongs to $K_alpha$,
    since the zero divisors of its sections are effective of degree zero.
    Conversely, if $u in K_alpha^(*)$ and $P = \( "div" u \)^(-)$,
    then $1$ and $u$ are sections of $P$ and $alpha dot.op P = 0$.
    Choose a maximal-image zero-degree system and write $K_0$ for the field of its Stein base.
    The product-system argument of Lemma 12 puts all zero-degree section ratios in $K_0$,
    hence $K_alpha subset.eq K_0$. The generating ratios of the chosen system lie in $K_alpha$;
    its relative algebraic closedness gives the reverse inclusion.
    This proves the claimed equality, rather than just a comparison of dimensions.
  A non-null prime is horizontal over $K_alpha$ by definition.
    Finally, if there were infinitely many horizontal null primes,
    finite generation of $"Pic" \( Y \)$ would give a nonzero integral relation among finitely many of their
    classes (multiply to remove torsion). The resulting nonzero divisor would be principal.
    Its defining function would lie in $K_alpha$ but have nonzero order at one of these horizontal primes,
    which is impossible. ◻
]

The hypotheses for finiteness hold on every smooth base dominated by the variety in Theorem 7:
  pullback and birational invariance give $H^0 \( Y \, Omega_Y^1 \) = 0$, hence $"Pic"^0 \( Y \) = 0$.
  Such subfields are finitely generated: choose a finite transcendence basis;
  the relative algebraic closure of its rational function field inside the finitely generated field
  $bb(C) \( Y \)$ is finite. Consequently the field has a smooth projective model.
  The same argument will apply to the fields constructed below.

=== 8.3 Minima on all components and on original components <g:cf:minima>

We now retain the fixed-section data of Section 8.1, with $L = -
  K_X$ smoothly semipositive and $H^0 \( X \, Omega_X^q \) = 0$ for $q > 0$.
  Assume also either of the equivalent uniqueness conditions in Lemma 27.
  Let $Y$ be a smooth projective model of $K$. Prepare a normal graph

$ X arrow.l^p W arrow.r^f Y $

whose fibers have dimension at most $dim X - dim Y$. This preparation can be made without toroidalization.
  On the flat locus of an initial graph, the fibers define a map to the projective Hilbert scheme of $X$.
  Resolve that map on the base and pull back the universal family.
  Its fixed Hilbert polynomial bounds the dimension of every fiber.
  The main graph transform lies in this family, and its normalization is finite over the transform.
  This gives the asserted bound. The graph and its normalization are equivariant;
  take an equivariant smooth resolution $rho : Z arrow.r W$ afterwards #cite(label("RaynaudGruson1971")),
  and write $pi = p rho$ and $g_Z = f rho$ for its composite maps to $X$ and $Y$.
  In particular every vertical prime of $W$ dominates a prime of $Y$.

For a prime $P subset Y$, let $Q$ range over the components above it on $W$, and put $e_Q = "ord"_Q f^(*) P$. Define

$ d_P = min_(Q mapsto P) frac("ord"_Q \( s \), e_Q) \, wide d_P^(*) = min_(Q mapsto P\
Q upright(" nonexceptional over ") X) frac("ord"_Q \( s \), e_Q) . $

A prime $P$ is #emph[omitted] if all components above it are exceptional over $X$; set $d_P^(*) =
  d_P$ in this case. There are finitely many omitted primes. The divisors

$ D = sum_P d_P P \, wide D^(*) = sum_P d_P^(*) P $

have finite support, $D^(*) gt.eq D$, and

$ "div"_W \( s \) - f^(*) D gt.eq 0 . $

The last divisor is rational Cartier, so it pulls back effectively to $Z$.
  The first minimum controls the metric because some component has zero normalized section order.
  The second controls sections on $X$ because a pole on an exceptional divisor disappears on pushdown.

#thm([Lemma 8.3.])[
  #emph[The rational divisor $D$ has a semipositive metric with locally bounded weights.
    There is an effective integral divisor $P_0$, supported on the omitted primes,
    and a psh metric weight $phi.alt$ on $- K_Y + P_0$ such that $\| s_(P_0) \|^2 e^(- phi.alt)$ is locally integrable.]
] <g:cf:finite-volume-base>

#proof[
  If $Y$ is a point, then $D = 0$; take $P_0 = 0$ and positive Hermitian norms on the two trivial lines.
    Their weights are bounded and their adjoint measure is finite. We may therefore assume $dim Y > 0$.
    Apply Lemmas 5 and 4 with original variety $X$, allowed-pole divisor zero, $A = L = - K_X$,
    and both metrics equal to the compact-averaged smooth metric on $L$. The section is $s$ of degree $a$.
    It has no horizontal poles on the normal equidimensional graph.
    The rank computation following Lemma 27 verifies the smooth invariant adjoint rank condition for every $j
    gt.eq 0$. Thus the two required psh functions are supplied by Lemma 5.
  The full-component normalization in Lemma 4 is exactly $D$;
    a denominator-clearing multiple of $D$ receives its bounded metric, which scales back to the rational divisor.
    Since the allowed-pole divisor on $X$ is zero, the invisible primes in that lemma are precisely our omitted
    primes. Its correction is therefore an effective integral $P_0$ with the asserted support.
    The distinguished measure on $- K_Y + P_0$ equals the pushforward of the smooth anticanonical volume almost
    everywhere, so its local integral is finite, including at boundary intersections.
    This proves both assertions on the flattened graph, without requiring toroidalization. ◻
]

=== 8.4 A supporting class and finite horizontal support <a-supporting-class-and-finite-horizontal-support>

#thm([Lemma 8.4.])[
  #emph[Assume the data of Section 8.3 and suppose no positive power of $L$ has a nonzero invariant global
    section. Then there is a nonzero movable class $alpha$ on $Y$ satisfying
$ alpha dot.op D = alpha dot.op D^(*) = 0 \, wide alpha dot.op Gamma = 0 quad
  upright("for every omitted prime ") Gamma . $

 In particular, $d_Gamma^(*) = d_Gamma$ whenever $alpha dot.op Gamma > 0$.]
] <g:cf:supporting-class>

#proof[
  The bounded psh metric makes $D$ pseudoeffective. Alternatively,
    apply Nadel vanishing and regularity to its divisible multiples:
    local boundedness makes their multiplier ideals trivial, and $m D +
    A$ is effective for fixed sufficiently positive $A$.
  The divisor $D^(*)$ cannot be rationally linearly equivalent to an effective rational divisor modulo the span of
    omitted primes. Otherwise, after clearing denominators, there would be $N > 0$ and $g in K^(*)$ with
  $ N d_Gamma^(*) + "ord"_Gamma \( g \) gt.eq 0 quad upright("at every nonomitted prime") . $
  Then $s^N g$ would have no pole along any prime divisor on $X$.
    For horizontal divisors this follows from the generic regularity of $s$.
    For a vertical divisor, its nonexceptional strict transform on $W$ dominates a nonomitted prime of $Y$,
    and the displayed inequality and the minimum defining $d_Gamma^(*)$ give the result.
    Thus $s^N g$ would be a nonzero invariant global section.
  Let $cal(S) subset N^1 \( Y \)_(bb(R))$ be the span of omitted primes,
    and project the cone of effective divisor classes to $N^1 \( Y \)_(bb(R)) \/ cal(S)$.
    Denote this convex cone by $C$. Its closure has nonempty interior,
    since the ample cone already has nonempty interior before projection.
    The image of $\[ D^(*) \]$ belongs to $overline(C)$, by pseudoeffectivity of $D$ and effectivity of $D^(*) -
    D$. It cannot lie in its interior. Indeed, the interior of a convex cone agrees with that of its closure and
    is contained in the cone itself. Membership of this rational point in $C$ would express it as a finite
    nonnegative real combination of rational effective classes.
    The corresponding finite rational linear system then has a nonnegative rational solution.
    Since numerical and rational linear equivalence agree on $Y$,
    that would give the rational effectivity just excluded.
  A supporting functional at this boundary point is nonzero, nonnegative on $C$,
    and zero on the image of $\[ D^(*) \]$. Pull it back to $N^1 \( Y \)_(bb(R))$.
    It is nonnegative on effective classes and annihilates $cal(S)$; by cone duality #cite(label("BDPP2013")),
    it is a nonzero movable class $alpha$. Pseudoeffectivity of $D$ and effectivity of $D^(*) - D$ give $0 lt.eq
    alpha dot.op D lt.eq alpha dot.op D^(*) = 0$. The effective difference therefore has zero degree;
    each of its components has zero degree. This proves the final assertion as well. ◻
]

For clarity, the numerical-to-linear step in this proof uses $"Pic"^0 \( Y \) = 0$:
  the kernel of the map from the Néron–Severi group to numerical divisor classes is torsion,
  so rational numerical relations among the indicated divisors are rational linear relations.
  The movable class just constructed annihilates $P_0$ in Lemma 29.
  Apply Proposition 16 with that effective correction, its integrable distinguished section,
  and $alpha dot.op P_0 = 0$. Every cotangent line has nonpositive $alpha$-degree.
  Lemma 6, applied to a Cartier multiple of $D$, gives a fixed cotangent determinant and effective integral divisors

#[#set math.equation(numbering: n => "(8.1)")
 $ N_m tilde.op M + m D \, wide m arrow.r oo \, wide alpha dot.op N_m = 0 \, $ <g:cf:null-divisors>]

for one fixed line bundle $M$. All indices clear the denominators of $D$.

The field $K_alpha$ from Lemma 28 is the same smaller field that maximal zero-degree systems give.
  We now use a different section-extraction argument on that field, keeping its separate input:
  finitely many horizontal null primes. This is the relative counterpart of the finite-support comparison in
  #cite(label("LP2018")) Lemma 2.1; the uniqueness verification after extraction is an additional step here.

#thm([Proposition 8.5.])[
  (Finite-support extraction).  #emph[Under the data of Section 8.3,
    assume no positive multiple of $L$ has an invariant global section.
    There are a positive integer $a'$ and an invariant rational section $s'$ of $a'
    L$ satisfying both the generic regularity condition and either uniqueness condition of Lemma 27 over
    $K_alpha$. Moreover $"trdeg" K_alpha < "trdeg" K$.]
] <g:cf:dickson>

#proof[
  Choose one higher equivariant resolution $hat(Z) arrow.r Z$ on which the rational map for $K_alpha$ is also a
    morphism. Pull back the divisors $N_m$. Their parts horizontal for $K_alpha$ have support in a fixed finite
    set of prime divisors on $hat(Z)$. Indeed, a horizontal component mapping onto a prime of $Y$ must lie over
    one of the finitely many horizontal null primes in Lemma 28.
    There are only finitely many components over those primes.
    A prime whose image in $Y$ has codimension at least two must be exceptional over $W$,
    by the fibre dimension bound, and there are only finitely many such divisors on this fixed resolution.
  List the horizontal multiplicities of the pulled-back $N_m$ as vectors in $bb(Z)_(gt.eq 0)^r$,
    using this fixed finite support. Order the indices $m$ increasingly.
    Dickson’s lemma, in its sequence form (see #cite(label("AichingerAichinger2018")) Theorem 1.1(1) and
    Lemma 3.2), gives $m_2 > m_1$ such that the earlier vector is componentwise at most the later one.
    For completeness, the needed sequence form follows by induction on $r$:
    a sequence of nonnegative integers either has an infinitely repeated value or has a strictly increasing
    subsequence; apply this successively to each coordinate. This also covers empty horizontal support.
    Hence $N_(m_2) - N_(m_1)$, pulled back to $hat(Z)$, is effective on every $K_alpha$-horizontal divisor.
  Put $b = m_2 - m_1 > 0$. From (8.1), choose $g_0 in K^(*)$ satisfying
  $ N_(m_2) - N_(m_1) = b D + "div"_Y \( g_0 \) . $
  Set
  #[#set math.equation(numbering: n => "(8.2)")
   $ a' = b a \, wide s' = s^b g_0 . $ <g:cf:new-section>]
  The section $s'$ is invariant. On $hat(Z)$, its divisor is the pullback of $b \( "div"_Z \( s \) - g_Z^(*) D \)$
    plus the pullback of $N_(m_2) - N_(m_1)$. It is therefore nonnegative along all $K_alpha$-horizontal divisors.
    The finitely many remaining poles lie over proper closed subsets of the new base, so a dense open avoids them.
    This proves generic regularity of the new section.
  It remains to verify the ratio requirement, which is essential for another iteration.
    Let $k gt.eq 0$, and let $t$ be an invariant nonzero rational section of $k a'
    L$ without poles along prime divisors on $X$ horizontal for $K_alpha$.
    Since $K_alpha subset.eq K$, every $K$-horizontal valuation is $K_alpha$-horizontal.
    The old fixed-section uniqueness condition therefore gives
  $ g = t / s^(k b) in K . $
  Let $Gamma$ be a non-null prime of $Y$. It is nonomitted, and $d_Gamma^(*) = d_Gamma$ by Lemma 30.
    Each nonexceptional component $Q$ over it on $W$ is horizontal for $K_alpha$:
    its restriction to $K_alpha$ is $e_Q "ord"_Gamma = 0$. Its valuation is the valuation of a prime divisor on
    $X$. Consequently
  $ e_Q "ord"_Gamma \( g \) + k b "ord"_Q \( s \) = "ord"_Q \( t \) gt.eq 0 . $
  Taking the minimum over these nonexceptional components proves
  #[#set math.equation(numbering: n => "(8.3)")
   $ "ord"_Gamma \( g \) + k b thin d_Gamma gt.eq 0 . $ <g:cf:ratio-inequality>]
  The rational divisor $"div"_Y \( g \) + k b D$ has total $alpha$-degree zero.
    Its coefficients at every non-null prime are nonnegative by (8.3), and the remaining primes have degree zero.
    Each of those nonnegative coefficients must therefore be zero.
    Moreover, $"div"_Y \( g_0 \) + b D = N_(m_2) - N_(m_1)$ is supported on null primes.
    Subtracting $k$ times this identity shows that
  $ frac(t, \( s' \)^k) = g / g_0^k in K_alpha . $
  This includes $k = 0$, so fixed-section uniqueness is preserved in its full stated range.
  Strict transcendence-degree decrease follows from Lemma 28.
    The regularity just proved holds on the complete generic fiber and hence survives further modification.
    This completes the new data, including the original-prime uniqueness test. ◻
]

For the same supporting movable class, affine interpolation in Lemma 13 and Proposition 31 therefore reach the
  same field by different arguments. The first proves that the horizontal multiplicities are affine functions of
  the twist. The second only needs finite horizontal support and chooses a comparable pair of multiplicity
  vectors. Neither method replaces the subsequent uniqueness verification.

=== 8.5 A toric construction of the initial section <a-toric-construction-of-the-initial-section>

The rational torus quotient can also be initialized using the geometry of its complete generic fiber.
  This gives a second construction of existence; its essential input is toric generation and a weight argument,
  rather than the wedge of fundamental vector fields.

#thm([Lemma 8.6.])[
  #emph[Let an algebraic torus $T$ act on a smooth connected projective variety $X$, and suppose that $L = -
    K_X$ is nef. On an equivariant smooth projective resolution $pi : Z arrow.r X$, $g : Z arrow.r
    Y$ of the rational quotient $bb(C) \( Y \) = bb(C) \( X \)^T$,
    some positive power of $pi^(*) L$ has a nonzero invariant section on the complete generic fiber,
    for its natural linearization.]
] <g:cf:toric-initial-section>

#proof[
  The invariant field is relatively algebraically closed in $bb(C) \( X \)$:
    an element algebraic over it has a finite orbit, and the divisible abelian group $T \( bb(C) \)$ has no
    nontrivial finite quotient. Rosenlicht’s quotient theorem gives a dense orbit on the smooth connected general
    fiber $F$ of $g$ #cite(label("Rosenlicht1956")). The stabilizer of that orbit fixes its closure,
    so $F$ is toric for an effective quotient of $T$. The nef bundle $pi^(*)
    L \|_F$ has a basepoint-free positive multiple by the toric basepoint-freeness theorem #cite(label("CLS2011"))
    Theorem 6.3.12.
  For any one-parameter subgroup $lambda$, the Białynicki-Birula decomposition of $X$ has an open attracting
    stratum as $t arrow.r 0$, whose fixed component has nonnegative tangent weights,
    and an open attracting stratum as $t arrow.r oo$, whose tangent weights are nonpositive
    #cite(label("BB1973")). Choose $F$ very general so that its image meets both strata for every $lambda$;
    there are only countably many integral cocharacters. The corresponding orbit limits on the proper $F$ give
    fixed points with the two weak signs for the fiber weights of $pi^(*) L$, since $L =
    det T_X$ has its natural action. Evaluation of a basepoint-free multiple at either point is equivariant and
    surjective. Thus its section space has weights of both weak signs for every $lambda$.
  It follows that zero is in the convex hull of the torus characters in this section space:
    otherwise a strict separating functional could be chosen rational and then integral.
    Choose a rational convex combination with sum zero and clear denominators.
    The product of the corresponding nonzero eigensections is a nonzero invariant section of a positive power;
    nonzeroness uses integrality of $F$. This is the invariant-sections construction used in the toric setting of
    #cite(label("Muller2025")) Section 3.
  For each positive integer $m$, cohomology and base change and torus weight splitting identify the invariant
    section space of $m pi^(*) L$ on fibers over a dense open with a vector bundle of its generic rank.
    Choose the very general fiber also in all these countably many opens.
    The invariant section just found therefore implies a nonzero invariant generic rank for its particular
    exponent. This yields the required section over $bb(C) \( Y \)$.
    The empty-dimensional fiber and the trivial torus are included in the argument. ◻
]

#prodef([Remark 8.7.])[
  The same weight argument can be made directly on the geometric generic fiber.
    Its generic point avoids the complements of the two attracting strata for every chosen one-parameter subgroup,
    and properness supplies the orbit limits. Toric generation and separation of the character polytope again
    produce a weight-zero product. Invariants for a split torus commute with field extension,
    so this section descends from the algebraic closure of $bb(C) \( Y \)$.
    This gives a geometric-generic form of the preceding construction, without choosing a very general closed fiber.
]

== 9 Evaluation metrics and fields with controlled poles <g:field-variants>

The previous section extracted a generic section from divisors of zero movable degree.
  We now vary the choice of the smaller base. Evaluation in an adjoint direct image supplies a transverse slope
  estimate. We apply it to systems generated by four fixed divisor classes,
  checking that their maximality still restores uniqueness after contraction.
  A separate construction then uses a field of functions with controlled poles to encode the divisors that may be
  absorbed on the original variety.

=== 9.1 Evaluation metrics and cotangent slopes <g:cf:evaluation-subsection>

There is a second way to obtain the slope inequality needed for contraction.
  It uses evaluation in an adjoint direct image over a #emph[further] rational quotient of the base.
  This gives a metric on the determinant of its transverse tangent sheaf,
  with a correction supported only on the omitted base primes.

#thm([Proposition 9.1.])[
  #emph[Let $X \, Y$ be smooth connected projective varieties, let $L = - K_X$ have a smooth semipositive metric,
    and let an algebraic torus $T$ act on $X$. Suppose that $f :
    X arrow.r.dashed Y$ is dominant and invariant and that every invariant rational function on $X$ having no
    poles at the $f$-horizontal prime divisors of $X$ belongs to $bb(C) \( Y \)$. Choose a normal projective graph model
$ X arrow.l^p W arrow.r^phi Y $

 on which every vertical prime maps onto a prime divisor of $Y$.
   Let $N$ be the reduced sum of the primes of $Y$ above which all prime divisors of $W$ are exceptional over $X$.]
  #emph[For every dominant rational map $g : Y arrow.r.dashed U$ to a smooth projective variety,
    let $cal(F) subset T_Y$ be the saturated sheaf tangent to its general fibers.
    There is an integer $c gt.eq 0$ such that
$ det \( T_Y \/ cal(F) \) + c N quad upright("is pseudoeffective") . $

 Consequently, if $alpha eq.not 0$ is a movable curve class on $Y$ with $alpha dot.op N = 0$,
   then every line subsheaf $A subset \( Omega_Y^1 \)^(⊗ j)$, $j gt.eq 0$,
   satisfies $alpha dot.op c_1 \( A \) lt.eq 0$.]
] <g:cf:evaluation-slope>

The uniqueness assumption in this statement is precisely the degree-zero instance of Lemma 27.
  In particular, the evaluation argument does not require a nef anticanonical class on $Y$.

#proof[
  Average the metric on $L$ over the compact form of $T$, so that it is invariant.
    When $U$ is a point the determinant assertion is immediate.
    Otherwise replace $U$ birationally, without changing $cal(F)$,
    so that every $g$-vertical prime $P subset Y$ maps onto a prime $Q subset U$.
    To arrange this, flatten the dominating graph and resolve the base #cite(label("RaynaudGruson1971")).
    Each $g$-vertical prime of $Y$ has a strict transform on the resulting equidimensional source.
    Properness defines the rational lift from $Y$ at its generic point,
    so the resulting map sends that prime onto a base prime. Put $e_P = "ord"_P \( g^(*) Q \)$.
    At the general point of $P$, the map has coordinates
  $ \( x \, y_2 \, dots.h \, y_(dim Y) \) mapsto \( x^(e_P) \, y_2 \, dots.h \, y_(dim U) \) . $
  The determinant of the differential, after quotienting by its saturated kernel, therefore has order $e_P - 1$.
    Along a horizontal prime it has order zero. Thus, in codimension one and hence as line bundles on $Y$,
  #[#set math.equation(numbering: n => "(9.1)")
   $ det \( T_Y \/ cal(F) \) = - g^(*) K_U - R_g \, wide R_g =
     sum_(P upright(" vertical")) \( e_P - 1 \) P . $ <g:cf:evaluation-determinant>]
  The pullback here is defined on the domain of the rational map and extended across its codimension-two
    complement. The sum is finite, since its coefficients are the divisorial orders of one determinant map.
  Take a smooth projective equivariant resolution dominating $W$ and resolving both rational maps, with morphisms
  $ pi : Z arrow.r X \, wide q : Z arrow.r Y \, wide r : Z arrow.r U . $
  Write $e_pi$ for the invariant Jacobian section of $K_Z + pi^(*) L$. On a dense open of $U$, the sheaf
  $ cal(E) = #scale(x: 120%, y: 120%)[\(] r_(*) \( K_(Z \/ U) + pi^(*) L \) #scale(x: 120%, y: 120%)[\)]^T $
  is locally free, commutes with base change, and has its adjoint $L^2$ metric.
    Berndtsson’s theorem gives Griffiths semipositivity #cite(label("Berndtsson2009")).
    The same is true of the invariant summand: the weight-zero projection is holomorphic and orthogonal,
    because the compact torus preserves the coefficient metric and the fiber integral.
    Its metric is therefore the quotient metric. This argument concerns a smooth coefficient metric on the
    smooth-family open.
  Choose a rational frame for $cal(E)$ and a rational frame $eta$ of $K_U$. Its sections on $Z$ have the form
  #[#set math.equation(numbering: n => "(9.2)")
   $ \( q^(*) phi.alt_i \) e_pi \/ \( r^(*) eta \) \, wide phi.alt_i in bb(C) \( Y \) .
     $ <g:cf:evaluation-coefficients>]
  Indeed, dividing first by the Jacobian and the inverse base frame gives invariant rational functions on $X$.
    These have no poles at the primes dominating $Y$: such primes also dominate $U$,
    and the Jacobian is a unit at their strict transforms. The assumed degree-zero uniqueness places the functions
    in $bb(C) \( Y \)$.
  After shrinking dense opens, evaluation of the coefficients in (9.2) defines a holomorphic functional on $g^(*)
    cal(E)$. For $v in cal(E)_(g \( y \))$, denote its coefficient at $y$ by $phi.alt_v \( y \)$.
    In the frame $g^(*) eta^(- 1)$, set
  #[#set math.equation(numbering: n => "(9.3)")
   $ psi \( y \) = log sup_(parallel v parallel_(g \( y \)) = 1) \| phi.alt_v \( y \) \|^2 . $ <g:cf:evaluation-weight>]
  This is psh, being the log squared norm of a holomorphic section of the dual of a Griffiths-semipositive bundle.
    Replacing $eta$ by $a eta$ adds $log \| g^(*) a \|^2$ to $psi$,
    exactly the transformation law for a weight on $- g^(*) K_U$.
    The section $e_pi \/ \( r^(*) eta \)$ has coefficient $1$, so this weight is not identically $- oo$.
  It remains to account for ramification and for the Jacobian zeros above the boundary.
    Fix a prime $P subset Y$, choose a prime $D subset Z$ mapping onto it, and put
  $ l = "ord"_D \( q^(*) P \) \, wide d_pi = "ord"_D \( e_pi \) . $
  If $P subset.not N$, choose $D$ nonexceptional over $X$, so that $d_pi = 0$.
    Suppose first that $P$ maps onto a prime of $U$. With $j = l e_P$,
    suitable coordinates around a general point of $D$ express $r$ as
  $ \( tau \, z_2 \, dots.h \, z_n \) mapsto \( tau^j \, z_2 \, dots.h \, z_h \) \, wide h = dim U \, quad
    D = \( tau = 0 \) . $
  Take $eta$ regular and nonvanishing on this base patch. If a fiber section $v$ has coefficient $a_v$ in a
    regular frame of $K_(Z \/ U) + pi^(*) L$, its adjoint fiber norm contains the density
  $ frac(\| a_v \|^2, \| j tau^(j - 1) \|^2) \| d z_(h + 1) dots.h.c d z_n \|^2 $
  up to positive bounded factors with bounded inverse. The denominator comes from dividing the total coordinate
    top form by the pulled-back base form. For $parallel v parallel = 1$,
    holomorphic submean on a smaller fiber polydisc gives $\| a_v \| lt.eq C \| tau \|^(j - 1)$.
    When the fiber dimension is zero, its point contribution to the norm gives the same bound.
    Dividing by the Jacobian coefficient, which is $tau^(d_pi)$ times a unit, yields
  #[#set math.equation(numbering: n => "(9.4)")
   $ \| phi.alt_v \( q \( z \) \) \| lt.eq C' \| tau \( z \) \|^(j - 1 - d_pi) . $ <g:cf:evaluation-boundary>]
  If $P$ dominates $U$, then $r$ is submersive at a general point of $D$.
    Submean gives instead $\| phi.alt_v \( q \( z \) \) \| lt.eq C' \| tau \( z \) \|^(- d_pi)$.
    In both cases the constants are uniform for unit-norm sections.
  Let $x$ define $P$ near a general point. On the chosen patch, $q^(*) x$ is a unit times $tau^l$.
    Generic submersivity along $D arrow.r P$, together with this transverse power,
    shows that the patch maps onto a neighborhood of that point of $P$.
    We can therefore apply the preceding estimates over each nearby $y$,
    with $\| tau \|$ comparable to $\| x \( y \) \|^(1 \/ l)$. They give
  #[#set math.equation(numbering: n => "(9.5)")
   $ psi lt.eq O \( 1 \) +
     cases(delim: "{", frac(l e_P - 1 - d_pi, l) log \| x \|^2 \, & P upright(" vertical over ") U \,, - d_pi / l
     log \| x \|^2 \, & P upright(" horizontal over ") U .) $ <g:cf:evaluation-exponents>]
  For $P subset.not N$, subtracting the weight of $R_g$ leaves a locally bounded-above function:
    in the vertical case the remaining coefficient is $1 - 1 \/ l gt.eq 0$, and in the horizontal case it is zero.
    At a component of $N$, adding $c log \| x \|^2$ makes the remaining coefficient nonnegative once
  $ c gt.eq \( 1 + d_pi \) \/ l - 1 quad upright("in the vertical case") \, wide c gt.eq d_pi \/ l quad
    upright("in the horizontal case") . $
  There are finitely many omitted primes, so one nonnegative integer $c$ works for all of them.
    The adjusted weights are psh off the divisors, since the logarithms there are pluriharmonic.
    Their upper bounds extend them across the general points of every boundary divisor.
    The remaining exceptional sets have codimension at least two;
    psh removability extends the weights there as well. The frame changes identify the resulting metric as one on
    $- g^(*) K_U - R_g + c N$. This proves pseudoeffectivity and hence
  #[#set math.equation(numbering: n => "(9.6)")
   $ alpha dot.op c_1 \( T_Y \/ cal(F) \) gt.eq 0 wide \( alpha upright(" movable") \, med alpha dot.op N = 0 \) .
     $ <g:cf:evaluation-quotient-degree>]
  We finish with the movable-slope argument of Ou, using the tensor slope theorem of Greb–Kebekus–Peternell and
    the algebraicity criterion of Campana–Păun #cite(label("GKP2016")) #cite(label("CampanaPaun2019"))
    #cite(label("Ou2023")) #cite(label("LMPTX2023")). Suppose that a line in $\( Omega_Y^1 \)^(⊗ j)$ has positive
    $alpha$-degree. For $j = 0$ this is impossible, since a line subsheaf of $cal(O)_Y$ has an effective negative.
    For $j > 0$, tensor slopes and duality imply $mu_(alpha \, min) \( T_Y \) < 0$.
    Applying (9.6) to the identity of $Y$ gives $alpha dot.op c_1 \( T_Y \) gt.eq 0$.
    Thus the positive-slope part $cal(F)_(+)$ of its Harder–Narasimhan filtration is nonzero and proper.
    Its minimal slope is positive, whereas $T_Y \/ cal(F)_(+)$ has nonpositive maximal slope and strictly negative
    degree.
  The bracket map $cal(F)_(+) ⊗ cal(F)_(+) arrow.r T_Y \/ cal(F)_(+)$ vanishes by the slope gap,
    so $cal(F)_(+)$ is a foliation. The positive-minimal-slope criterion makes it algebraically integrable.
    Its rational quotient contradicts (9.6). These uses of slope theory also apply to a boundary movable class.
    Equivalently, perturb toward a rational interior movable class:
    the strict positive minimal slope and the bracket slope gap persist.
    The tensor inequality at the original class follows by taking limits from the interior, using
  $ mu_(alpha + epsilon.alt beta \, min) \( cal(G) \) gt.eq mu_(alpha \, min) \( cal(G) \) +
    epsilon.alt mu_(beta \, min) \( cal(G) \) $
  and the corresponding upper bound for maximal slopes. This proves the cotangent assertion. ◻
]

=== 9.2 Restricting the contraction to a four-generator semigroup <restricting-the-contraction-to-a-four-generator-semigroup>

The evaluation slope of Proposition 34 can be used with a smaller collection of linear systems than all
  null-degree systems. We record the precise collection because maximality within it still has to control the
  poles appearing in the uniqueness test.

#thm([Proposition 9.2.])[
  #emph[Keep the fixed-section data of Section 8.3 and assume $H^0 \( Y \, Omega_Y^q \) = 0$ for $q > 0$.
    After taking a power of $s$, let $D \, D^(*)$ be integral, put $G = D^(*) - D gt.eq 0$,
    and let $N$ be the reduced omitted-prime divisor. Suppose $D$ has a bounded semipositive metric and that every
    cotangent line has nonpositive degree against every movable class annihilating $N$.
    If there is no invariant global section of a positive multiple of $L$,
    a smaller base preserving an invariant generic section of a positive multiple of $L$ and the original-prime
    uniqueness condition is obtained from one of the systems
$ \| m D + i M + k G + l N \| \, wide m \, i \, k \, l in bb(Z)_(gt.eq 0) \, $

 where $M$ is a single cotangent determinant line and $H^0 \( Y \, M + m_j D \) eq.not 0$ for unbounded positive $m_j$.]
] <g:cf:finite-semigroup>

#proof[
  The divisor $D + G + N = D^(*) + N$ cannot be big. A section of a positive multiple,
    represented by $gamma in bb(C) \( Y \)^(*)$, would satisfy $"ord"_P gamma + j d_P^(*) gt.eq
    0$ at every nonomitted prime. The minimum defining $d_P^(*)$ then makes $s^j
    gamma$ regular at every vertical prime of $X$; its horizontal regularity is already known.
    This would be an invariant global section. Since $D$ is pseudoeffective and $G \, N$ are effective,
    cone duality supplies $alpha eq.not 0$ movable with
  $ alpha dot.op D = alpha dot.op G = alpha dot.op N = 0 . $
  The assumed cotangent estimate and the determinant proof in Lemma 11 produce $M$ and effective $C_j tilde.op M +
    m_j D$; effectivity forces $alpha dot.op M = 0$. Thus every displayed system has degree zero,
    and none gives a generically finite map on $Y$.
  Choose one nonempty displayed system $\| Lambda \|$ of maximal image dimension,
    and let $Y'$ be a smooth model of its Stein field. Products remain in the displayed collection.
    Exactly the product-map argument in Lemma 12 therefore shows that ratios in any one of these systems lie in
    $bb(C) \( Y' \)$. Moreover $dim Y' < dim Y$. The interpolation of Lemma 13 uses only products of the sections
    of $M + m_j D$, so it applies within this collection. For $m_1 > m_0$,
    the ratio of those sections gives a rational section of $\( m_1 - m_0 \)
    D$ regular on the complete generic fiber over $Y'$. Write $delta = m_1 -
    m_0$ and let $u$ be the normalized section of $a L - f^(*) D$.
    If $xi$ is the generic section of $delta D$ just obtained,
    then $u^delta f^(*) xi$ is the new invariant generic section of $a delta L$.
  We check all-degree original-prime uniqueness directly. Let $w_1 \,
    w_2$ be invariant rational sections of $b L$, $b gt.eq 0$, regular at the primes of $X$ horizontal over $Y'$.
    Old uniqueness gives
  $ w_i^a = s^b f^(*) gamma_i \, wide gamma_i in bb(C) \( Y \)^(*) . $
  At a nonomitted prime $P$ of $Y$ horizontal over $Y'$, every nonexceptional component above it is horizontal
    over $Y'$ too. Testing regularity there and taking the nonexceptional minimum gives
  $ "ord"_P gamma_i + b \( d_P + "coeff"_P G \) gt.eq 0 . $
  Hence, for one sufficiently large $l$, the $gamma_i$ are rational sections of $b D + b G +
    l N$ with poles only at primes vertical over $Y'$.
  These finitely many poles can be cleared by the same section of some $n Lambda$; if there are no poles, use $n =
    0$ and the constant section. Resolve $\| Lambda \|$. Each such prime maps into a proper closed subset of its
    image: a valuation trivial on the image field is trivial on its algebraic closure,
    so verticality persists for the image field. Choose a projective hypersurface containing those images but not
    the whole system image. Substituting the defining sections of $Lambda$ gives a nonzero section vanishing at
    each pole prime; its sufficiently high power gives the required orders.
    The fixed divisor of the resolved system only adds vanishing.
    Multiplication by this common section places both $gamma_i$ in one system of the displayed semigroup.
    Maximality puts their ratio in $bb(C) \( Y' \)$. Thus $\( w_1 \/ w_2 \)^a in bb(C) \( Y' \)$,
    and relative algebraic closedness inside $bb(C) \( X \)$ gives $w_1 \/ w_2 in bb(C) \( Y' \)$.
    Lemma 27 now restores fixed-section uniqueness, including degree zero. This proves the proposition. ◻
]

For the geometric data constructed from a rational quotient, the bounded metric is supplied by Lemma 29,
  while Proposition 34 supplies exactly the cotangent hypothesis.
  This verifies a complete contraction using the evaluation metric,
  independently of the signed-volume slope argument. The four-generator semigroup need not generate the whole
  null-prime field; its own maximality and pole-clearing property are what the proof uses.

=== 9.3 A parameter field allowing poles at omitted primes <g:cf:parameter-subsection>

The next construction uses the signed-boundary slope inequality of Proposition 22.
  Its field is built directly from rational functions with prescribed orders away from the omitted primes.
  Allowing those poles is useful because no divisor of the original variety lies above an omitted prime.
  The effective divisors used for horizontal interpolation, however, remain effective on the whole base.

Use fixed-section data $\( f : X arrow.r.dashed Y \, k \, s \)$ satisfying the regularity and uniqueness
  conditions of Section 8.1, and a normal equidimensional model $X arrow.l^p W arrow.r^phi Y$.
  For a prime $Gamma subset Y$, and primes $A subset W$ mapping onto it, write

$ e_A = "ord"_A \( phi^(*) Gamma \) \, wide l_A = "ord"_A \( p^(*) s \) \, wide b_Gamma =
  min_(A arrow.r Gamma) l_A / e_A . $

Let $C_1 \, dots.h \, C_v$ be the omitted primes, above which every such $A$ is exceptional over $X$.
  Off this finite list put

$ b_Gamma^sharp = min_(A arrow.r Gamma\
A upright(" nonexceptional over ") X) l_A / e_A \, $

and give $b_Gamma^sharp$ the value zero on the omitted primes. Denote the resulting divisors by $B \, B^sharp$.
  Replace $s$ by a power, and scale $k \, B \, B^sharp$, so that both divisors are integral. We have

#[#set math.equation(numbering: n => "(9.7)")
 $ D_s := "div" \( p^(*) s \) - phi^(*) B gt.eq 0 \, wide b_Gamma^sharp gt.eq
   b_Gamma quad \( Gamma eq.not C_i \) . $ <g:cf:parameter-model>]

Moreover, for $l > 0$ integral,

#[#set math.equation(numbering: n => "(9.8)")
 $ "ord"_Gamma v + l b_Gamma^sharp gt.eq 0 quad \( Gamma eq.not C_i \) quad arrow.r.double quad
   s^l f^(*) v in H^0 \( X \, k l L \)^T \\ { 0 } $ <g:cf:parameter-lift>]

for $v in bb(C) \( Y \)^(*)$. Indeed the inequalities test every vertical prime of $X$ through its nonexceptional
  transform on $W$; the original horizontal primes have nonnegative orders by the fixed-section condition.
  Normality of $X$ then gives regularity.

For the geometric application, assume again that $L = - K_X$ is smoothly semipositive and
  $H^0 \( X \, Omega_X^q \) = 0$ for $q > 0$. Pullback of forms gives the same vanishing on $Y$,
  hence $chi \( cal(O)_Y \) = 1$. Prepare this graph toroidally as in Section 4.2;
  then define the minima on that prepared graph as above. The bounded metric and signed nef anticanonical class in
  Lemma 9, the determinant construction in Lemma 6, and Proposition 22 give an integral divisor $R$ and an
  unbounded set $cal(M) subset bb(Z)_(> 0)$ with

#[#set math.equation(numbering: n => "(9.9)")
 $ \[ R \] in overline("Psef" \( Y \) + sum_(i = 1)^v bb(R) \[ C_i \]) \, wide N_m = m B - R +
   "div" \( q_m \) gt.eq 0 quad \( m in cal(M) \) . $ <g:cf:parameter-effective>]

Here $q_m in bb(C) \( Y \)^(*)$, and the effectivity of $N_m$ includes the omitted primes.
  To make the sign of $R$ explicit, Lemma 6 gives a line $M$ in a cotangent tensor power of order $h$ and
  effective divisors

$ N_m tilde.op m B + M \, wide R = - M . $

The signed boundary $B_(upright("sgn"))$ furnished by Lemma 9 has negative part supported on the $C_i$.
  Proposition 22 gives

$ \[ R \] + h \[ B_(upright("sgn"))^(-) \] in "Psef" \( Y \) \, $

so $\[ R \]$ lies in $"Psef" \( Y \) + sum_i bb(R) \[ C_i \]$,
  and in particular in its closure as required in (9.9). The following argument depends only on the explicit data
  (9.7)– (9.9) and fixed-section uniqueness.

#thm([Proposition 9.3.])[
  #emph[Assume fixed-section data $\( f : X arrow.r.dashed Y \, k \, s \)$ as in Section 8.1.
    Let $B \, B^sharp$ be the integral vertical-minimum divisors of the preceding normal equidimensional graph,
    and let $C_i$ be its omitted primes. Assume that an integral divisor $R$ and an unbounded sequence of
    effective divisors satisfy (9.9). Then either a positive multiple of $L$ has a nonzero invariant section on
    $X$, or there is a dominant rational map $Y arrow.r.dashed Y'$, with $dim Y' < dim Y$,
    such that its composite with $f$ admits fixed-section data satisfying the regularity and uniqueness conditions
    of Section 8.1. Its base field is relatively algebraically closed in $bb(C) \( X \)$.]
] <g:cf:parameter-contraction>

#proof[
  Fix $a in cal(M)$. For $t in bb(Q)$, $t gt.eq a$, and $h in bb(Z)_(> 0)$,
    define a vector space of rational functions by
  #[#set math.equation(numbering: n => "(9.10)")
   $ V_(t \, h) = { 0 } union {v in bb(C) \( Y \)^(*) : "div" \( v \) + h \( t B^sharp - R \) gt.eq
     0 upright(" away from the ") C_i} . $ <g:cf:parameter-spaces>]
  Rational coefficients cause no ambiguity: this is an inequality of rational divisors.
    These spaces need not be finite-dimensional. Their multiplication law is
  #[#set math.equation(numbering: n => "(9.11)")
   $ V_(t_1 \, h_1) V_(t_2 \, h_2) subset V_(\( h_1 t_1 + h_2 t_2 \) \/ \( h_1 + h_2 \) \, thin h_1 + h_2) .
     $ <g:cf:parameter-product>]
  By (9.9) and $B^sharp gt.eq B$ away from the omitted primes, $q_m in V_(m \, 1)$.
    Every rational $t gt.eq a$ is a rational convex combination of $a$ and some $m in cal(M)$ with $m gt.eq t$.
    Products of powers of $q_a \, q_m$ therefore show that $V_(t \, h) eq.not 0$ for some $h > 0$.
  At a fixed $t$, let $F_t$ be the set of ratios $v \/ w$ with $v \, w in V_(t \, h)$, $w eq.not 0$,
    allowing all positive $h$. It is a field: multiplication and cross-multiplication for addition use (9.11),
    and inverses interchange numerator and denominator. Its relative algebraic closure in $bb(C) \( Y \)$ is
    independent of $t > a$. To see this, take $a < t_1 < t_2$ and a ratio at $t_1$.
    Pad equal powers of its numerator and denominator with a common power of $q_m$, where $m > t_2$.
    Choose the powers so that their weighted-average parameter is $t_2$.
    A positive power of the original ratio then belongs to $F_(t_2)$.
    Conversely, pad a ratio at $t_2$ with $q_a$ to reach $t_1$.
    Clearing the rational weights makes all the powers integral.
    Each field is therefore contained in the relative algebraic closure of the other.
  Write $K$ for the common relatively closed field, and choose a smooth projective model $Y'$ with
    $bb(C) \( Y' \) = K$. This field is finitely generated: choose a transcendence basis of $K \/ bb(C)$;
    the algebraic closure of the resulting rational function field inside the finitely generated field
    $bb(C) \( Y \)$ is finite over it. Since $bb(C) \( Y \)$ is relatively algebraically closed in
    $bb(C) \( X \)$, the same is true of $K$. We now distinguish whether this field has lost dimension.
  #emph[The full-dimensional case.] Suppose $"trdeg"_(bb(C)) K = d = dim Y$.
    At one fixed rational $t > a$, finitely many ratios in $F_t$ are algebraically independent of cardinality $d$.
    Use common products and powers to place their numerator and denominator sections in one degree.
    A sufficiently large rational divisor $C$ supported on the $C_i$ compensates their finitely many omitted-prime
    poles. After clearing denominators, these sections belong to a multiple of $t B^sharp - R +
    C$ and give a rational map with $d$-dimensional image. Hence
  #[#set math.equation(numbering: n => "(9.12)")
   $ t B^sharp - R + C quad upright("is big") . $ <g:cf:parameter-big>]
  The closure in the first condition of (9.9) is sufficient to remove $R$ from this assertion.
    Choose pseudoeffective classes $P_j$ and real divisors $E_j$ supported on the $C_i$ such that $P_j + \[ E_j \]
    arrow.r \[ R \]$. Then
  $ \[ t B^sharp + C - E_j \] - P_j arrow.r \[ t B^sharp - R + C \] . $
  The classes on the left are big for large $j$, by openness of the big cone.
    Adding $P_j$ preserves bigness, so $t B^sharp + C - E_j$ is big.
    Rational approximation of the coefficients on the finite support yields a rational divisor $C'$,
    supported on that same list, with $t B^sharp + C'$ big. Consequently,
    for some positive integer $h$ clearing all denominators and some $v in bb(C) \( Y \)^(*)$,
  $ "div" \( v \) + h \( t B^sharp + C' \) gt.eq 0 . $
  Away from the omitted primes this is precisely the hypothesis of (9.8), with the positive integer $l = h t$.
    It produces the asserted global invariant section.
  #emph[The smaller-base case.] Suppose now that $dim Y' < d$.
    Choose $b in cal(M)$ with $b > a$, write $delta = b - a$, and set
  #[#set math.equation(numbering: n => "(9.13)")
   $ f' : X arrow.r.dashed Y' \, wide k' = k delta \, wide s' = s^delta f^(*) \( q_b \/ q_a \) \,
     $ <g:cf:parameter-new-section>]
  where $f'$ is the composite rational map. Both the map and section are invariant.
    We verify separately that the section is regular over the generic point and that it restores uniqueness.
  For every $m in cal(M)$ with $m > b$, the numerator and denominator in
  #[#set math.equation(numbering: n => "(9.14)")
   $ frac(q_m^delta q_a^(m - b), q_b^(m - a)) $ <g:cf:parameter-interpolation>]
  belong to $V_(b \, m - a)$, since $delta m + \( m - b \) a = b \( m - a \)$. Their ratio therefore lies in $K$.
    On a common smooth resolution mapping to $W \, Y \, Y'$, let $n_m$ be the coefficient of the pullback of $N_m$
    at a prime horizontal over $Y'$. Its valuation is trivial on $K$, so (9.14) implies
  $ delta \( n_m - n_a \) = \( m - a \) \( n_b - n_a \) . $
  Every $n_m gt.eq 0$, and the indices $m$ are unbounded. It follows that $n_b - n_a gt.eq 0$.
    The divisor of the pullback of $s'$ is
  $ delta D_s + phi^(*) \( N_b - N_a \) \, $
  with pullbacks to the common resolution understood. Its horizontal coefficients are nonnegative by (9.7) and the
    preceding inequality. Thus $s'$ has no poles over the generic point of $Y'$,
    including at exceptional horizontal primes.
  To prove uniqueness, take $r gt.eq 0$ and a nonzero invariant rational section $tau$ of $r k'
    L$ having no poles on the prime divisors of $X$ horizontal over $Y'$.
    These include the primes horizontal over $Y$. The old fixed-section condition writes
  $ tau = s^(delta r) f^(*) u \, wide \( s' \)^r = s^(delta r) f^(*) u_s \, wide u_s = \( q_b \/ q_a \)^r \, $
  with $u \, u_s in bb(C) \( Y \)^(*)$. At every non-omitted prime $Gamma$ whose valuation is trivial on $K$,
    the nonexceptional primes above it are horizontal over $Y'$. Regularity of both sections there gives
  #[#set math.equation(numbering: n => "(9.15)")
   $ "ord"_Gamma \( u \) + delta r b_Gamma^sharp gt.eq 0 \, wide "ord"_Gamma \( u_s \) +
     delta r b_Gamma^sharp gt.eq 0 . $ <g:cf:parameter-horizontal-tests>]
  Only finitely many non-omitted primes fail either inequality. Every such prime has valuation nontrivial on $K$.
  We can compensate all these deficits with a common element of one $V_(b \, h)$.
    For a non-omitted prime $Gamma$, define the excess of $v in V_(b \, h) \\ { 0 }$ by
  $ epsilon.alt_Gamma \( v \) = "ord"_Gamma \( v \) + h \( b b_Gamma^sharp - "coeff"_Gamma R \) gt.eq 0 . $
  If $"ord"_Gamma$ is nontrivial on $K$, it is nontrivial on $F_b$:
    a valuation trivial on a field remains trivial on an algebraic extension.
    Some ratio $v_1 \/ v_2$, with $v_1 \, v_2 in V_(b \, h_Gamma)$, therefore has nonzero order.
    The two nonnegative excesses are different, so at least one is strictly positive. Choose that element.
    Products of sufficiently large powers of these chosen elements, one for each deficit prime,
    give $v in V_(b \, h) \\ { 0 }$ whose excess compensates every deficit of both $u$ and $u_s$.
    At all other non-omitted primes, the excesses remain nonnegative.
    If there are no deficits, any nonzero element of $V_(b \, h)$ suffices. Thus
  $ u v \, med u_s v in V_(thin b + delta r \/ h \, thin h) . $
  The parameter is still greater than $a$, also when $r = 0$. It follows that
  $ tau \/ \( s' \)^r = u \/ u_s in F_(b + delta r \/ h) subset K . $
  This is the required fixed-section uniqueness for the smaller base.
  These verifications also retain the adjoint rank conditions:
    on a smooth resolution, multiplying powers of $s'$ by the Jacobian gives a nonzero invariant adjoint section
    in every nonnegative multiple of $k'$. Dividing any other such section by the Jacobian gives a rational
    section regular at the original horizontal primes; the uniqueness just proved makes it a multiple over $K$ of
    that generator. Thus the contraction returns precisely the section and rank data needed for the next step,
    including degree zero. ◻
]

== 10 Contractions with different boundary data <g:ba>

Theorem 7 keeps a generic section and its adjoint rank. The boundary constructions of Section 5 also accommodate
  three other useful forms of control: arbitrary exceptional twists, eventual discrepancy inequalities,
  and pole tests on the original variety. We verify these forms separately.
  This identifies the exact support condition that must survive each dimension decrease.

Throughout this section $X$ is smooth connected projective, $H^0 \( X \, Omega_X^q \) = 0$ for $q > 0$, and $L = -
  K_X$ has a smooth semipositive metric. A torus $T$ acts with its natural linearization on $L$.
  Every smooth projective rational image $Y$ has no positive-degree holomorphic forms, so $chi \( cal(O)_Y \) =
  1$ and $"Pic" \( Y \) ⊗ bb(Q)$ is finite dimensional. We use geometrically integral generic fibres throughout.

Two of the pole formulations below express the same uniqueness condition.
  Given the distinguished generic section, the bound for every exceptional twist in (5.3) is equivalent to
  original-prime uniqueness in Lemma 27. Indeed, finitely many invariant rational sections regular at the original
  horizontal primes acquire only exceptional horizontal poles on a fixed equivariant resolution.
  One common effective invariant exceptional divisor clears those poles.
  Conversely an exceptional twist changes no order at an original prime. The constructions below remain different:
  they use, respectively, a weighted metric and Iitaka rigidity, or a signed boundary and the null-prime field.

=== 10.1 Rigid Iitaka fibres and arbitrary exceptional twists <g:ba:iitaka>

The following elementary form of Iitaka rigidity is useful because the base may need further resolution after its
  Iitaka map is chosen.

#thm([Lemma 10.1.])[
  #emph[Let $Q gt.eq 0$ be an integral divisor on a smooth projective variety $Y$, and let $u : Y' arrow.r Y$,
    $h : Y' arrow.r Y_2$ resolve its Iitaka fibration, with connected generic fibre $S$.
    For every effective $u$-exceptional integral divisor $A$ and every positive integer $m$,
$ h^0 #scale(x: 120%, y: 120%)[\(] S \, m \( u^(*) Q + A \) \|_S #scale(x: 120%, y: 120%)[\)] = 1 . $

]
] <g:ba:rigidity>

#proof[
  Choose the Iitaka map from a multiple of $Q$ attaining the maximal image dimension and take its Stein
    factorization. A multiple of $u^(*) Q$ dominates the pullback of a big divisor on $Y_2$;
    after taking a higher multiple and replacing that divisor by an ample divisor plus an effective divisor,
    it dominates a pulled-back ample divisor. The generic fibre is geometrically integral.
    Adding an effective exceptional divisor changes no global space of sections, by normality,
    and hence no Iitaka dimension. If a multiple of $\( u^(*) Q + A \) \|_S$ had two independent sections,
    extend them rationally over $Y'$ and clear their vertical poles with a sufficiently high pulled-back ample
    twist. The preceding domination absorbs that twist into a multiple of $u^(*) Q + A$.
    Their ratio remains nonconstant on $S$. Combined with ratios defining the base,
    it increases the transcendence degree of a global section-ratio field beyond $kappa \( Q \)$, a contradiction.
    The canonical effective divisor supplies the nonzero section. ◻
]

#thm([Proposition 10.2.])[
  (Preserving arbitrary exceptional twists).  #emph[Let $pi : Z arrow.r X$, $g : Z arrow.r
    Y$ be a smooth equivariant resolution of a dominant $T$-invariant rational map to a smooth projective $Y$,
    with $dim Y > 0$ and geometrically integral generic fibre $F$ over $K = bb(C) \( Y \)$.
    Suppose that $H^0 \( F \, a pi^(*) L \|_F \)^T eq.not 0$ for some $a > 0$, and that
$ dim_K H^0 \( F \, \( b pi^(*) L + A \) \|_F \)^T lt.eq 1 $

 for every integer $b gt.eq 0$ and every effective invariant $pi$-exceptional integral divisor $A$.
   Then either a positive multiple of $L$ has a nonzero invariant section on $X$,
   or a dominant rational map $Y arrow.r.dashed Y_2$ to a smooth projective base of smaller dimension preserves
   both the generic section and this bound for every exceptional twist on a smooth equivariant resolution of the
   composite map.]
] <g:ba:exceptional-contraction>

#proof[
  Use the divisors $N \, R \, B$ of Proposition 19. If any $j \( N + R \) + l B$, $j > 0$, $l gt.eq 0$,
    is rationally effective, that proposition gives the section on $X$. Assume otherwise.
    The weighted cotangent bound gives $h c B - c_1 \( M \)$ pseudoeffective for a line $M$ in a cotangent tensor
    power of order $h$. Consequently
  $ M + j \( N + R \) + B quad upright("is not big") wide \( j > 0 \) \; $
  adding the pseudoeffective class $h c B - M$ to a big class would contradict the preceding noneffectivity.
  The bounded metric of $N$, hard Lefschetz and the nonzero constant term of $chi \( K_Y + m N \)$ give,
    by the determinant construction of Lemma 6, a fixed cotangent line $M$ and effective $D_j tilde.op M +
    j N$ for unbounded $j > 0$. Fix two indices $i < b$ and put $Q = D_b + b R + B$.
    This divisor is effective and not big. Resolve its Iitaka map by $u : Y' arrow.r Y$, $h : Y' arrow.r Y_2$.
    Then $dim Y_2 < dim Y$.
  Restrict pullbacks to the generic fibre $S$ of $h$. The interpolation equivalence (4.20),
    applied at the twist exponents $i < b < j$, gives two effective representatives of the class $\( j - i \)
    D_(b \, S)$. Add the same effective complement $\( j - i \) \( Q_S - D_(b \, S) \)$ to both.
    Lemma 37 makes the resulting representatives of $\( j - i \) Q_S$ equal, and cancellation gives
  $ \( j - i \) D_(b \, S) = \( b - i \) D_(j \, S) + \( j - b \) D_(i \, S) wide \( j > b \) . $
  In particular all the later $D_(j \, S)$ are supported in $D_(b \, S)$.
    Since $j$ is unbounded and $D_(j \, S) gt.eq 0$, the divisor
  $ V_S = frac(D_(b \, S) - D_(i \, S), b - i) $
  is effective and rationally equivalent to $N_S$. Its support lies in $D_(b \, S)$.
    For every effective $u$-exceptional $A$ and integers $n \, l gt.eq 0$ this also gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ h^0 #scale(x: 120%, y: 120%)[\(] S \, n \( N + R \)_S + l B_S + A \|_S #scale(x: 120%, y: 120%)[\)] lt.eq
     1 . $ <g:ba:exceptional-fibre-bound>]
  To see this, represent $N_S$ by $V_S$. The indicated effective representative is supported in
    $\( u^(*) Q + A \) \|_S$ and therefore dominated by a multiple of it.
    Two independent sections would remain independent after taking powers and multiplying by a fixed section,
    contrary to Lemma 37.
  On a common resolution over $Y'$, lift a denominator-clearing multiple of $V_S$ through $f^(*) N arrow.r
    a p^(*) L$. It gives the new invariant generic section. For the rank assertion,
    let $F_(upright("exc"))$ be any effective invariant divisor exceptional over $X$ on the common resolution.
    A section with this twist over the new generic fibre is, by the old rank condition,
    rationally $lambda s^n s_(F_(upright("exc")))$ with $lambda in bb(C) \( Y \)$,
    first for exponents divisible by $a$. At a prime of $S$ not exceptional over $Y$ and not in $B_S$,
    choose a nonexceptional component realizing the restricted minimum $n'_Q = \( N + R \)_Q$.
    The exceptional twist has coefficient zero there. Regularity gives
  $ "ord"_Q lambda gt.eq - n \( N + R \)_Q . $
  All remaining poles occur on $B_S$ or on exceptional divisors of $u$.
    For any proposed pair of sections, choose an effective $u$-exceptional divisor $A_Y$ on $Y'$ and $l gt.eq
    0$ so that $l B_S + A_Y \|_S$ absorbs them. Equation (10.1) then forces dependence.
    Other exponents follow by taking powers to clear divisibility;
    independent sections cannot become dependent under a power on a geometrically integral fibre. ◻
]

#thm([Proposition 10.3.])[
  (The unweighted rigid-fibre variant).  #emph[Let $pi : Z arrow.r X$, $g : Z arrow.r
    Y$ be a smooth equivariant resolution of a dominant $T$-invariant rational map to a smooth projective $Y$,
    with $dim Y > 0$ and geometrically integral generic fibre $F$ over $K = bb(C) \( Y \)$.
    Suppose there is a nonzero invariant section of $a pi^(*) L \|_F$, $a > 0$, and
$ dim_K H^0 \( F \, \( K_(Z \/ X) + m a pi^(*) L \) \|_F \)^T = 1 wide \( m gt.eq 0 \) . $

 Then either a positive multiple of $L$ has a nonzero invariant section on $X$,
   or a dominant rational map $Y arrow.r.dashed Y_2$ to a smooth projective base of smaller dimension preserves
   the generic section and these Jacobian-twisted ranks, with a possibly different positive integer $a$.]
] <g:ba:toroidal-contraction>

#proof[
  Take the prepared toroidal model of Proposition 20. Let $B$ now be the reduced sum of primes $Q$ for which no
    component attaining the minimum $n_Q$ is nonexceptional over $X$.
    For small rational $delta > 0$, the normalized divisor $D_s$ absorbs $delta f^(*)
    B$ at every nonexceptional prime. Thus effectivity of $N + delta B$ supplies a section on $X$.
    Otherwise this pseudoeffective divisor is not big, so a nonzero movable class $alpha$ annihilates both $N$ and
    $B$. The correction $Theta$ of Proposition 20 is supported on $B$.
    Proposition 17 gives $alpha dot.op M lt.eq 0$ for every cotangent line $M$.
  The determinant argument produces effective $D_j tilde.op M + j N + B$, $D_j gt.eq B$, for unbounded $j$;
    their degree against $alpha$ is zero. Resolve the Iitaka map of one $D_b$ after fixing an earlier index $i <
    b$. The same interpolation identity as above puts every later restricted divisor in the support of
    $D_(b \, S)$. Include the finitely many exceptional divisors of the chosen resolution in an auxiliary
    effective divisor $A$ and apply Lemma 37 to $u^(*) D_b + A$.
    Choose comparable indices $j_1 < j_2$ in the tail beyond $b$,
    using the ascending-pair property in a finite product of $bb(N)$. Put $v = j_2 - j_1 > 0$. Then
  $ C = \( D_(j_2) - D_(j_1) \) \|_S gt.eq 0 \, wide C tilde.op v N_S \, wide "Supp" C subset.eq "Supp" D_(b \, S) . $
  Let $zeta$ be the corresponding section of $v N_S$, and let $sigma$ denote the normalized regular section of $a
    pi^(*) L - g^(*) N$ on a common resolution. The section $sigma^v g^(*)
    zeta$ gives a new invariant generic section $s'$ of degree $a v L$.
  We verify the new ranks at exactly these multiples. Let $q gt.eq
    0$ and let $t$ be an invariant section of $K_(Z' \/ X) + q a v pi' ""^(*) L$ on the new generic fibre,
    where $Z'$ is a common smooth resolution. The old rank condition, applied over $K$,
    says that division by the Jacobian section and $sigma^(q v)$ leaves the pullback of a rational section $r$ of
    $q v N_S$. At a prime of $S$ outside $B_S$ and the $u$-exceptional locus,
    a nonexceptional minimizing component has both normalized section order and Jacobian order zero.
    Regularity of $t$ therefore makes $r$ regular at that prime.
  The rational function $r \/ zeta^q$ has poles only in $"Supp" \( u^(*) D_b + A \) \|_S$:
    the divisor $D_b$ contains $B$, the zeros of $zeta$ lie in $D_(b \, S)$,
    and $A$ contains every $u$-exceptional prime of the fixed resolution.
    Every multiple of this effective divisor is rigid by Lemma 37,
    so the function is constant over $bb(C) \( Y_2 \)$. Thus $t$ is a base multiple of the Jacobian times
    $\( s' \)^q$. This also treats $q = 0$, when $zeta^q = 1$.
    Those Jacobian products supply nonzero sections in every tested degree, proving rank exactly one.
    The argument permits extra resolutions without assuming that their exceptional centres lie in the original
    base locus. ◻
]

=== 10.2 Contraction using a large adjoint moment <g:ba:eventual>

#thm([Proposition 10.4.])[
  #emph[Suppose $K \, s \, d$ satisfy (5.6)–(5.7). If $"trdeg"_(bb(C)) K > 0$,
    either a positive multiple of $L$ has a nonzero invariant section,
    or these same two conditions hold for some $K' subset K$ with strictly smaller transcendence degree and a new
    invariant rational section of a positive multiple of $L$.]
] <g:ba:eventual-contraction>

#proof[
  Use Proposition 21 and put $N^(+) = N + R \/ k$. If $N^(+)$ is rationally effective, its section returns to $X$.
    Otherwise $N^(+)$ is pseudoeffective and not big. Choose a nonzero movable $alpha$ annihilating it.
    Since $N \, R$ are pseudoeffective,
  $ alpha dot.op N = alpha dot.op R = 0 . $
  The unweighted metric of $J = - K_Y + k N + R$ and Proposition 17 give the cotangent bound for $alpha$.
    The determinant construction supplies effective $D_j tilde.op M +
    m_j N$ with $m_j$ increasing and $alpha dot.op D_j = 0$.
  Let $K'$ be the field of functions with poles only on $alpha$-null primes.
    Lemma 28 gives finite generation, relative algebraic closure, and strict transcendence-degree decrease.
    On a resolution of the resulting map there are only finitely many possible horizontal components of the $D_j$:
    the null horizontal primes are finite because $"Pic" \( Y \) ⊗ bb(Q)$ is finite dimensional,
    and the resolution has only finitely many exceptional primes.
    The finite-support argument in the proof of Proposition 31 therefore gives $j > i$, $v = m_j -
    m_i > 0$ and $c in K^(*)$ with
  $ D_j - D_i = v N + "div" \( c \) $
  horizontally effective over $K'$. Set $s' = s^v c$. Its divisor upstairs is the sum of the pullback of this
    difference and $v D gt.eq 0$. Hence it is regular at every valuation trivial on $K'$, proving (5.6).
  For all sufficiently large $m$, a section $t$ satisfying the new discrepancy inequalities satisfies the old
    ones, so $t = s^(m v) u$ with $u in K$. If $Q$ has positive $alpha$-degree, $r_Q = 0$.
    A component attaining the two minima in the definition of $R$ consequently has $a_E = 0$ and $h_E = e_E n_Q$.
    Its valuation is trivial on $K'$, and the inequality for $t$ gives
  $ "ord"_Q u + m v n_Q gt.eq 0 . $
  The null support of $D_j - D_i$ gives $"ord"_Q c + v n_Q = 0$.
    Thus $u \/ c^m$ has no pole on any positive-degree prime and belongs to $K'$. We obtain $t in K' \( s' \)^m$.
    The opposite inclusion follows from the regularity of $s'$ and the nonnegative discrepancies over smooth $X$. ◻
]

=== 10.3 Original horizontal primes and the signed boundary <g:ba:signed>

The next variant tests poles only on primes of $X$ itself.
  It therefore permits arbitrary poles at exceptional valuations in the rank test,
  while the distinguished section remains regular on the complete generic fibre.

#thm([Proposition 10.5.])[
  #emph[Let $K = bb(C) \( Y \) subset.eq bb(C) \( X \)^T$ be relatively algebraically closed,
    and let $s$ be an invariant rational section of $a L$, $a > 0$, regular on a resolved generic fibre over $K$.
    Suppose that, for every $j gt.eq 0$,
#[#set math.equation(numbering: n => "(10.2)")
 $ u in bb(C) \( X \)^T \, quad s^j u upright(" has no poles on primes of ") X upright(" horizontal over ") K quad
   arrow.r.double quad u in K . $ <g:ba:original-rank>]

 Then either a positive multiple of $L$ has a nonzero invariant section,
   or a contraction to a smaller base preserves these two conditions.]
] <g:ba:original-primes>

#proof[
  On a prepared equidimensional toroidal model $p : W arrow.r X$, $f : W arrow.r Y$, normalize $s$ by vertical minima:
  $ D_s = "div" \( s \) - f^(*) N gt.eq 0 . $
  The hypothesis is the fixed-section uniqueness condition of Lemma 27.
    It gives invariant adjoint rank one in every nonnegative multiple of $a$:
    divide by the Jacobian and test the nonexceptional horizontal primes.
    Hence Lemma 9 supplies a bounded semipositive metric on $N$ and a signed boundary $B_(upright("sgn"))$ with
    simple normal crossing support and coefficients less than one, such that $- \( K_Y + B_(upright("sgn")) \)$ is nef.
  We compare the two choices of permissible base poles before choosing the contraction.
    Let $S_0$ be the reduced sum of omitted primes, above which every component is exceptional over $X$.
    Define $N'$ by taking the minimum only over nonexceptional components off $S_0$,
    and retaining the coefficient of $N$ on $S_0$. Put $G = N' - N gt.eq 0$.
    Let $B_min$ be the reduced sum of primes at which no minimizing component is nonexceptional. Then
  $ "Supp" B_min = "Supp" S_0 med union.sq med "Supp" G \, wide "Supp" B_(upright("sgn"))^(-) subset.eq "Supp" S_0 . $
  Indeed, away from the omitted primes, failure to attain the full minimum on a nonexceptional component is
    exactly the strict inequality $n'_Q > n_Q$.
  There are two effectivity tests. If $N' + S_0$ is rationally effective,
    its section returns to $X$ by the nonexceptional minimum.
    Alternatively, for sufficiently small rational $epsilon.alt > 0$, $D_s -
    epsilon.alt f^(*) B_min$ has no negative coefficient at any nonexceptional prime; effectivity of $N +
    epsilon.alt B_min$ therefore also returns a section. If neither test succeeds,
    the chosen pseudoeffective class is not big. Cone duality gives a nonzero movable class $alpha$.
    Either choice yields the same vanishing conditions:
  $ alpha dot.op N = alpha dot.op G = alpha dot.op S_0 = 0 \, quad upright("equivalently") quad alpha dot.op N =
    alpha dot.op B_min = 0 . $
  In particular $alpha dot.op B_(upright("sgn"))^(-) = 0$, so Proposition 22 supplies the cotangent bound.
    The determinant construction gives effective $D_j tilde.op M + j N$ at unbounded divisible indices,
    with $alpha dot.op D_j = 0$.
  Let $K'$ be the null-prime field of Lemma 28; it has smaller transcendence degree.
    On a common resolution, the affine interpolation of Lemma 13 gives $j > i$ and
  $ D_j - D_i = v N + "div" \( c \) \, wide v = j - i > 0 \, quad c in K^(*) \, $
  with effective horizontal part over $K'$. One may instead use the finite-support extraction of Proposition 31 to
    choose a comparable pair of horizontal multiplicity vectors. Both choices give the same required property.
    Since the divisor of $s' = s^v c$ is $v D_s + f^(*) \( D_j - D_i \)$,
    this section is regular on the new complete generic fibre, including at exceptional horizontal primes.
  For uniqueness, suppose that $t = \( s' \)^k g$ has no poles at original primes horizontal over $K'$,
    where $k gt.eq 0$ and $g in bb(C) \( X \)^T$. Since these include the $K$-horizontal primes,
    the old test applied to $t = s^(v k) c^k g$ gives $c^k g in K$ and hence $g in K$.
    If a base prime $Q$ has positive $alpha$-degree, then $Q$ is not omitted, $n'_Q = n_Q$,
    and its valuation is trivial on $K'$. Its nonexceptional components are therefore original primes horizontal
    over $K'$. Testing $t$ on all those components gives
  $ "ord"_Q g + k \( v n'_Q + "ord"_Q c \) gt.eq 0 . $
  The null support of $D_j - D_i$ gives $v n_Q + "ord"_Q c = 0$.
    Thus $g$ has no pole at any positive-degree prime. Its pole divisor is null,
    and the field criterion in Lemma 28 gives $g in K'$. This includes $k = 0$ and proves the required uniqueness.
  This proof uses the whole bad-minimum set through $G$ and $S_0$.
    Annihilating only $B_(upright("sgn"))^(-)$ would not provide the nonexceptional minimizing components needed
    in the last pole test. ◻
]

=== 10.4 A toric construction of the initial generic section <g:ba:toric-start>

The rational torus quotient also admits a geometric construction of its first invariant section,
  separate from wedging fundamental vector fields. This explains why a generated line on a generic orbit
  compactification suffices, without assuming semiampleness on $X$.

#thm([Proposition 10.6.])[
  #emph[For the rational quotient $K = bb(C) \( X \)^T$, a positive multiple of $L$ has a nonzero invariant
    section on the smooth resolved generic fibre. The data satisfy (10.2).]
] <g:ba:toric-section>

#proof[
  Smooth semipositivity implies nefness, so Lemma 32 supplies the invariant section.
    Ratios of invariant rational tensors of the same power of $L$ lie in $bb(C) \( X \)^T = K$, which proves (10.2). ◻
]

The preceding contractions preserve their stated data and strictly decrease a nonnegative base dimension.
  At a point base the generic section is global and pushes to $X$.
  They therefore give complete alternative reductions to an invariant section under their respective initial conditions.

== 11 Contraction by multiplicative cotangent systems <g:multiplicative>

The contraction in Section 4 chooses systems of zero degree for one supporting movable class.
  There is another useful choice: close all cotangent-twisted systems under multiplication.
  This avoids fixing that class, while retaining the same decisive verification of generic adjoint rank after
  contraction. We state the construction with its prepared data so that its difference from the zero-degree method
  is explicit.

#thm([Proposition 11.1.])[
  #emph[Let $X$ be smooth projective and rationally connected, let $L = - K_X$ be smoothly semipositive,
    and let an algebraic torus $T$ act with the natural linearization.
    Let $pi : Z arrow.r X$, $g : Z arrow.r Y$ resolve a dominant invariant rational map,
    with $Y$ smooth projective of positive dimension and $bb(C) \( Y \)$ relatively algebraically closed in
    $bb(C) \( X \)$. Write $E = K_(Z \/ X)$. Suppose a nonzero invariant rational section $s$ of $ell pi^(*) L$,
    $ell > 0$, and rational divisors $N$ on $Y$ and $D$ on $Z$ satisfy
$ ell^(- 1) "div"_Z \( s \) = g^(*) N + D \, wide D gt.eq 0 . $

 Assume that $N$ has a semipositive metric with locally bounded weights.
   Suppose there is a rational simple normal crossings divisor $Delta = Delta^(+) - Delta^(-)$ on $Y$,
   with every coefficient of $Delta^(+)$ less than one, such that $- K_Y - Delta$ is nef.
   Let $B$ be a reduced effective divisor on $Y$ such that]
  + #emph[$"Supp" Delta^(-) subset "Supp" B$;]
  + #emph[$pi_(*) \( D - t g^(*) B \) gt.eq 0$ for every sufficiently small rational $t > 0$;]
  + #emph[above every base prime outside $B$, some prime dominating it has coefficient zero in both $D$ and $E$.]
  #emph[Finally suppose the invariant generic spaces of $E + k pi^(*) L$ have rank one for $k =
    0$ and every positive multiple of one fixed integer. Then either $H^0 \( X \, r L \)^T eq.not 0$ for some $r >
    0$, or a rational map $Y arrow.r.dashed Y'$ with $dim Y' < dim
    Y$ gives a composite fibration retaining a nonzero invariant generic section in a positive multiple of $L$ and
    invariant adjoint rank one at zero and in every sufficiently divisible positive degree.]
] <g:multiplicative-contraction>

These prepared data are supplied by vertical minima and the toroidal logarithmic density calculation of Lemma 9;
  no strict-curvature patch is required. The signed slope statement needed in the proof is Proposition 22,
  proved for these signed boundaries. In particular the argument does not apply an effective-boundary positivity
  theorem directly to $Delta$.

#proof[
  Suppose first that $N + t B$ is big for some sufficiently small rational $t > 0$.
    Choose a nonzero section of a divisible multiple. Pull it back, use the corresponding power of $s$,
    and push its divisor to $X$. Condition (ii) leaves an effective divisor.
    All rational coefficients can be cleared by the power, so this is a regular nonzero invariant section of a
    positive multiple of $L$. We may therefore assume that $N + t B$ is not big for all small positive rational $t$.
  For every line bundle $M$ admitting a nonzero map $M arrow.r \( Omega_Y^1 \)^(⊗ p)$, Proposition 22 gives
  #[#set math.equation(numbering: n => "(11.1)")
   $ p Delta^(-) - M quad upright("pseudoeffective") . $ <g:multiplicative-cotangent>]
  The case $p = 0$ follows directly from $M arrow.r cal(O)_Y$.
    Choose an integer $b > 0$ clearing all divisor denominators, divisible by $ell$,
    and compatible with the generic-rank hypothesis. If $s_(b N)$ denotes the canonical rational section of $b N$,
    the normalized section
  $ sigma = frac(s^(b \/ ell), g^(*) s_(b N)) quad upright("of ") b pi^(*) L - g^(*) \( b N \) quad
    upright("has divisor ") b D gt.eq 0 . $
  It is regular and invariant. Consider the line bundles
  #[#set math.equation(numbering: n => "(11.2)")
   $ Q = k N + a B + M \, quad k in b bb(Z)_(gt.eq 0) \, quad a in bb(Z)_(gt.eq 0) \, quad
     M arrow.r \( Omega_Y^1 \)^(⊗ p) \, quad p gt.eq 0 \, $ <g:multiplicative-collection>]
  where the last map is nonzero. This collection is closed under tensor product:
    tensoring two nonzero line maps gives a nonzero map at the generic point and hence a nonzero global map into
    the corresponding tensor power.
  No member of (11.2) is big. Indeed, (11.1) would make $k N + a B + p Delta^(-)$ big if $Q$ were big.
    Choose $a' gt.eq a$ with $a' B - a B - p Delta^(-) gt.eq 0$. Then $k N + a' B$ would be big.
    For any prescribed small $t > 0$, choose $delta > 0$ so that $delta k < 1$ and $delta a' lt.eq t$.
    Since $N$ and $B$ are pseudoeffective,
  $ N + t B = delta \( k N + a' B \) + \( 1 - delta k \) N + \( t - delta a' \) B $
  would be big, contrary to the assumption.
  Choose a nonempty system in a member $Q_0$ of (11.2) whose image has maximal dimension.
    The constant system shows that such systems exist. Resolve its map and pass to the connected-fiber base to obtain
  $ eta : tilde(Y) arrow.r Y \, wide q : tilde(Y) arrow.r Y' . $
  We can choose $Y'$ normal projective; its smooth birational model may be used later.
    Its dimension is strictly smaller than $dim Y$, since $Q_0$ is not big.
    A suitable power of the chosen system supplies an ample line $A$ on the normal Stein base with $eta^(*) Q_0 -
    q^(*) A$ effective, after replacing $Q_0$ by that power. Every ratio from every system in (11.2) belongs to
    $bb(C) \( Y' \)$. Otherwise the product with the chosen system would increase the image dimension;
    relative algebraic closure removes the remaining algebraic extension.
  For the generic fiber $F$ of $q$ this implies
  #[#set math.equation(numbering: n => "(11.3)")
   $ h^0 \( F \, eta^(*) Q \|_F \) lt.eq 1 quad upright("for every ") Q upright(" in ") upright("(11.2)") .
     $ <g:multiplicative-rigidity>]
  To check the assertion for generic sections, spread two putative independent sections after a sufficiently ample
    base twist $q^(*) \( n A \)$. The effective difference $eta^(*) \( n Q_0 \) -
    q^(*) \( n A \)$ puts them in $eta^(*) \( Q + n Q_0 \)$. Their pushdowns are sections on the smooth $Y$,
    and their ratio contradicts the preceding field statement.
  Because $Y$ is a rational image of the rationally connected $X$, it has no positive-degree holomorphic forms.
    Apply Lemma 6 to $b N$. We obtain one cotangent line $M_0$ and effective divisors $D_i tilde.op M_0 +
    m_i N$ for an unbounded increasing sequence $m_i in b bb(Z)_(> 0)$.
    Their restrictions to $F$ are nonzero section divisors. By (11.3),
    the products realizing any three-index linear relation are proportional on $F$.
    Therefore each horizontal multiplicity is affine in $m_i$.
    All these multiplicities are nonnegative at unbounded exponents, so the slope is nonnegative.
    A difference $D_j - D_i$, $j > i$, consequently gives a nonzero section of $\( m_j - m_i \) eta^(*) N$ on $F$.
  Write $delta = m_j - m_i$, and choose $gamma in bb(C) \( Y \)^(*)$ with
  $ D_j - D_i = delta N + "div"_Y \( gamma \) . $
  The integer $delta$ is divisible by $b$ and hence by $ell$.
    Resolve the composite map from $X$ to $Y'$ by a smooth model $Z'$ dominating $Z$ and $tilde(Y)$; write $j :
    Z' arrow.r Y'$ and continue to write $g : Z' arrow.r Y$, $pi : Z' arrow.r X$, with $D$ pulled back from $Z$.
    The rational section
  $ tau = s^(delta \/ ell) g^(*) gamma quad upright("of ") delta pi^(*) L quad upright("satisfies") quad
    "div" \( tau \) = delta D + g^(*) \( D_j - D_i \) . $
  The first summand is effective, and the second is effective on the complete generic fiber over $Y'$,
    as just proved. Thus $tau$ is a nonzero invariant generic section.
    The composite generic fiber is geometrically connected, since both successive function-field inclusions are
    relatively algebraically closed in characteristic zero.
  It remains to restore the adjoint ranks on this larger fiber.
    Suppose two invariant sections of $K_(Z' \/ X) + k pi^(*) L$ are independent over $bb(C) \( Y' \)$,
    for a sufficiently divisible $k gt.eq 0$. Clear their poles over $Y'$ by $j^(*) \( n A \)$,
    and pull back the effective difference $eta^(*) \( n Q_0 \) - q^(*) \( n A \)$ to regard them as sections of
  $ K_(Z' \/ X) + k pi^(*) L + g^(*) \( n Q_0 \) . $
  Over $bb(C) \( Y \)$ the old rank is one. Divide the two sections by the Jacobian section and $sigma^(k \/ b)$,
    using the pullback of the normalized section defined above.
    The quotients descend to rational sections $v_1 \, v_2$ of $k N + n Q_0$ on $Y$.
    For a prime $P$ outside $B$, condition (iii) supplies a prime $R$ above it whose strict transform has order
    zero in both $D$ and $K_(Z' \/ X)$. If $e_R = "ord"_R g^(*) P$, regularity of the two sections upstairs gives
  $ 0 lt.eq "ord"_R \( s_(K_(Z' \/ X)) sigma^(k \/ b) g^(*) v_i \) = e_R "ord"_P \( v_i \) \, wide i = 1 \, 2 . $
  Thus neither $v_i$ has a pole outside $B$. A sufficiently large $a$ therefore makes both sections regular in $k
    N + n Q_0 + a B$, which again belongs to (11.2). Their ratio lies in $bb(C) \( Y' \)$, a contradiction.
  The new generic section, multiplied by the Jacobian section,
    supplies a nonzero adjoint section at every positive multiple of its exponent;
    the Jacobian supplies one at zero. Combining these lower bounds with the upper bound proves all required ranks
    after enlarging the fixed divisibility integer. Finally replace the normal Stein base $Y'$ by a smooth
    projective model and resolve the composite map. Its function field is unchanged,
    and generic sections and Jacobian-twisted ranks are unchanged by this birational replacement,
    as in Section 4.1. This completes the contraction. ◻
]

== 12 Reduced fibers and descent by a finite flat norm <g:reduced-flat>

The limiting fiber norm in Lemma 5 is defined first on an open subset of the base.
  To extend it as a bounded metric, we need a line whose rational section has the same growth at the boundary.
  This section constructs that line after an alteration with reduced fibers,
  then returns it to the original function field by a finite flat norm.
  The alteration is used to control a section on every fiber; the final base is birational to the original base.

We begin with an algebraic construction that explains the role of reduced fibers.
  All schemes in the next two lemmas are of finite type over $bb(C)$.
  A modification of an integral base means a proper birational morphism,
  and all families over a modified base are pulled back.

#thm([Lemma 12.1.])[
  (Extending a generic line of sections).  #emph[Let $g : W arrow.r
    T$ be a projective flat morphism with geometrically reduced fibers,
    where $T$ is a smooth integral projective variety. Let $P$ be a line bundle on $W$,
    and let $0 eq.not tau in H^0 \( W_eta \, P_eta \)$, where $eta = "Spec" bb(C) \( T \)$.
    After a smooth projective modification of $T$, there are a line bundle $J$, a rational section $eta_J$ of $J$,
    and a homomorphism
$ a : g^(*) J arrow.r P $

 such that $a \( g^(*) eta_J \) = tau$ generically and $a \|_(W_t) eq.not 0$ for every $t in T$.]
] <g:flat-section-line>

#proof[
  Choose a sufficiently high power $A$ of a relatively ample line bundle so that
  $ E_A = g_(*) A \, wide F_A = g_(*) \( A ⊗ P \) $
  are vector bundles, their formation commutes with arbitrary base change, and $g^(*) E_A arrow.r
    A$ is surjective. Relative Serre vanishing and flatness supply these assertions simultaneously.
    Multiplication by $tau$ defines a nonzero element of $"Hom" \( E_A \, F_A \)_eta$.
    Take the closure of the associated rational section of the projective bundle of lines in
    $"Hom" \( E_A \, F_A \)$, and resolve this closure. The resulting base modification carries a line subbundle
  $ J arrow.r.hook "Hom" \( E_A \, F_A \) . $
  In particular its map to each fiber of this Hom bundle is nonzero.
  The induced map $g^(*) J ⊗ g^(*) E_A arrow.r A ⊗ P$ factors through $g^(*) J ⊗ A$.
    Indeed, the kernel of $g^(*) E_A arrow.r A$ is locally free.
    Its composite with this map vanishes over the generic base point, where the map is multiplication by $tau$.
    It therefore vanishes everywhere: flatness over the integral base makes the generic part schematically dense,
    and the target is locally free. Dividing by $A$ gives $a : g^(*) J arrow.r P$.
    If its restriction to some fiber were zero, the corresponding map $\( E_A \)_t
    arrow.r \( F_A \)_t$ would be zero, contrary to the line subbundle construction.
    The prescribed generic equality defines $eta_J$. ◻
]

#thm([Lemma 12.2.])[
  (The fiber norm has a positive lower bound).  #emph[In the situation of Lemma 44,
    give $J$ and $P$ continuous positive Hermitian metrics. For $a : g^(*) J arrow.r P$, put
$ c \( t \) = sup_(w in W_t) \| a \( w \) \|^2 . $

 There are constants $0 < c_(-) lt.eq c_(+) < oo$ with $c_(-) lt.eq c \( t \) lt.eq c_(+)$ for all $t in T$.]
] <g:flat-supremum>

#proof[
  Properness gives the upper bound. On a reduced fiber, a nonzero section of a line bundle is nonzero at a point
    in its smooth locus. Choose such a point over $t$. Flatness and smoothness of the fiber at that point make $g$
    smooth there. After shrinking, a local analytic section of $g$, together with continuity of the metric,
    supplies a positive lower bound on a neighborhood of $t$.
    Finitely many such neighborhoods cover the compact base. Reducedness is used precisely here:
    a nonzero section supported only in the nilpotent structure of a fiber would not supply a point at which its
    norm is positive. ◻
]

#prodef([Remark 12.3.])[
  (Proper flat families).  The conclusion of Lemma 44 also holds when $g$ is proper and flat without being
    projective. To prove this variant, replace the Hom bundle construction by the complex computing proper flat
    cohomology. The complex $R g_(*) P$ is perfect and commutes with derived base change
    #cite(label("StacksProject")) Tag 0DJT. On the smooth projective base it has a global bounded vector bundle
    representative, by the resolution property #cite(label("StacksProject")) Tags 0F87 and 0F8F.
    It can be chosen in degrees $0 \, dots.h \, N$: the derived fiber cohomology has no negative degrees,
    so the negative part of a bounded representative is successively removed by locally split injections and their
    vector bundle cokernels. Write the resulting complex as
  $ K^0 arrow.r^(d^0) K^1 arrow.r dots.h.c . $
  The vector $tau$ is a nonzero element of $ker \( d_eta^0 \) subset K_eta^0$.
    Modify the base to extend its line to a subbundle $J subset K^0$.
    The composite $J arrow.r K^1$ vanishes generically and hence everywhere.
    Thus $J arrow.r ker d^0 = g_(*) P$ gives the required evaluation map.
    On each fiber, the subbundle gives a nonzero vector in $ker d_t^0 = H^0 \( W_t \, P_t \)$;
    there is no incoming differential in negative degree. This proves nonvanishing on every fiber.
    The projective construction suffices for the transfer below.
]

=== 12.1 The norm line on the original field <the-norm-line-on-the-original-field>

We now use these lemmas to construct the two base metrics and the map that will return sections to the source.
  The anticanonical metric and the bounded metric in the statement are separate data.

#thm([Proposition 12.4.])[
  (Reduced-flat transfer).  #emph[Let $X \, V \, Y$ be smooth integral projective varieties, let $pi : V arrow.r
    X$ be birational, and let $f : V arrow.r Y$ be surjective with connected fibers.
    Let $D$ be a reduced effective divisor on $X$, let $c gt.eq 0$ be an integer, and let $L$ be a line bundle.
    Suppose that $L$ has a semipositive metric $h_L$ with locally bounded weights and that $M = - K_X +
    c D$ has a semipositive singular metric $h_M$. In local coordinates and a compatible frame of $M$, write
$ d mu = \| d \|^(2 c) e^(- phi_M) thin d V_X \, $

 where $d$ is an equation of $D$, and assume $mu \( X \) < oo$. Put $E = K_(V \/ X)$.
   Assume that for some integer $a > 0$ there is a nonzero rational section $tau$ of $a pi^(*) L$,
   regular over a dense base open subset, and that
#[#set math.equation(numbering: n => "(12.1)")
 $ "rk" f_(*) cal(O)_V #scale(x: 120%, y: 120%)[\(] E + c pi^(*) D + p a pi^(*) L #scale(x: 120%, y: 120%)[\)] =
   1 wide upright("for every integer ") p gt.eq 0 . $ <g:flat-adjoint-ranks>]

 If $dim Y > 0$, there are a smooth projective modification $Y' arrow.r Y$, a line bundle $B$ on $Y'$,
   a reduced effective divisor $D'$, and integers $d_0 > 0$, $c' gt.eq 0$ with the following properties.
   The line $B$ has a semipositive metric with locally bounded weights.
   The line $- K_(Y') + c' D'$ has a semipositive metric inducing a finite measure.
   On a smooth resolution $pi' : V' arrow.r X$, $f' : V' arrow.r
   Y'$ of the main transform there is a nonzero regular homomorphism
#[#set math.equation(numbering: n => "(12.2)")
 $ \( f' \)^(*) B arrow.r d_0 a \( pi' \)^(*) L \, $ <g:flat-output-map>]

 and
#[#set math.equation(numbering: n => "(12.3)")
 $ "Supp" #scale(x: 120%, y: 120%)[\(] pi'_(*) \( f' \)^(*) D' #scale(x: 120%, y: 120%)[\)] subset.eq "Supp" D .
   $ <g:flat-pole-support>]

 Consequently, for every $m > 0$, a nonzero rational section of $m
   B$ with poles only on $D'$ gives a nonzero rational section of $m d_0 a L$ with poles only on $D$.]
  #emph[There is also a smooth invariant version. In that version $D = 0$, both metrics are smooth,
    an algebraic torus acts compatibly on $X \, V$ and the line bundles, its action on $Y$ is trivial,
    and $tau$ is invariant. A Zariski dense compact subgroup preserves the metrics.
    Replace the ranks in (12.1) by the ranks of the invariant parts, still for every $p gt.eq 0$.
    Then the transferred section on $X$ is invariant and regular.
    Anticanonical bundles in this version carry their natural linearizations.]
] <g:reduced-flat-transfer>

#proof[
  On a dense smooth base open, use coordinates $y$ and write $I_p \( y \)$ for the density of
  $ f_(*) #scale(x: 120%, y: 120%)[\(] \| tau \|_(\( pi^(*) h_L \)^a)^(2 p) thin pi^(*) mu
    #scale(x: 120%, y: 120%)[\)] . $
  The pullback measure includes the Jacobian of $pi$. The adjoint section is $s_E s_(c pi^(*) D) tau^p$;
    its fiberwise squared norm is $I_p$, after trivializing the canonical base factor.
    Lemma 5 applies to (12.1), including $p = 0$. It gives psh representatives of $- log I_0$ and
  #[#set math.equation(numbering: n => "(12.4)")
   $ u = - log S \, wide S \( y \) = "ess sup"_(V_y) \| tau \|_(\( pi^(*) h_L \)^a)^2 . $ <g:flat-limit-norm>]
  The essential supremum uses the fiber density of $pi^(*) mu$.
    For almost every smooth fiber that density is positive almost everywhere.
    Since $h_L$ has bounded weights, $S$ is comparable to the ordinary supremum computed with a fixed smooth
    reference metric. The comparison constants are uniform on the compact total space wherever the rational
    section is defined. Fix this smooth reference metric on $L$, and use its pullbacks on every model below.
    In the invariant case the same lemma uses the holomorphic orthogonal projection to the invariant direct
    summand for the smooth coefficient metric. Positivity of that quotient metric is the additional input required
    in this case.
  #emph[Constructing a line on an alteration.] Apply weak semistable reduction of Abramovich–Karu to $f$
    #cite(label("AK2000")) Theorem 0.3 and Definition 0.1, arXiv version 1.
    After a projective generically finite alteration $T arrow.r Y$ and modifications,
    it gives a projective family $g : W arrow.r T$ with geometrically reduced fibers, with $T$ smooth projective,
    and a morphism $W arrow.r V$ over $Y$. Its equidimensional toroidal source is Cohen–Macaulay,
    so it is flat over the smooth base. The source $W$ need not be smooth.
    We keep this flat family when making further base modifications;
    resolving its source would not preserve the flatness needed below.
    The generic fiber of $f$ is geometrically integral, because it is smooth and connected in characteristic zero,
    as required for this application of reduction. The two families fit into the diagram
  $ W & arrow.r & V\
g arrow.b &  & arrow.b f\
T & arrow.r & Y . $
  Let $P$ be the pullback to $W$ of $a pi^(*) L$. Lemma 44 gives $J$, $eta_J$, and $g^(*) J arrow.r
    P$ on a further modified base. The family remains flat with reduced fibers.
    On the generic base open the map $W arrow.r V$ is surjective on the fibers under consideration.
    Give $J$ a continuous positive reference metric and let $c \( t \)$ be the supremum norm of the map $g^(*) J
    arrow.r P$, measured in these reference metrics. Since this map sends $g^(*) eta_J$ to $tau$, we have
  $ sup_(W_t) \| tau \|_(upright("ref"))^2 = \| eta_J \( t \) \|_(upright("ref"))^2 c \( t \) \, wide c_(-) lt.eq
    c \( t \) lt.eq c_(+) $
  by Lemma 45. Surjectivity onto the original fiber identifies the left side with $sup_(V_y) \|
    tau \|_(upright("ref"))^2$. Comparison with the bounded metric $h_L$ therefore gives
  #[#set math.equation(numbering: n => "(12.5)")
   $ \| eta_J \( t \) \|^2 asymp S \( y \) \, wide t mapsto y \, $ <g:flat-upstairs-comparison>]
  for almost every parameter in that open. Here and below comparison means upper and lower positive constant
    bounds in local reference metrics, with constants that remain bounded toward the omitted locus.
    The fixed reference metrics are pulled back under all subsequent base changes,
    and the same bounds on $c \( t \)$ continue to hold. No rational connectedness of $T$ is asserted or needed.
  #emph[Returning to the original function field.] By flattening by modification,
    choose a smooth projective modification $Y' arrow.r Y$ on which both the main transform $V_0 arrow.r
    Y'$ of $V$ and the main transform $q : T' arrow.r Y'$ of $T$ are flat #cite(label("RaynaudGruson1971")).
    The second map is finite: it is projective, flat and has zero-dimensional fibers. Its degree
  $ d_0 = "rk" q_(*) cal(O)_(T') $
  is positive and constant. The first map is equidimensional of the original relative dimension.
    Subsequent smooth modifications of the base preserve these properties by flat base change.
    The main transforms map to $T$ and $V$, respectively, so $J$ and its rational section pull back to $T'$.
    The base $Y'$ still has the function field $bb(C) \( Y \)$. The resulting diagram is
  $ T' & arrow.r^(med q med) & Y' & arrow.l & V_0\
arrow.b &  & arrow.b &  & arrow.b\
T & arrow.r & Y & arrow.l & V . $
  Here both maps to $Y'$ are flat, and $q$ is finite. The line $J$ lives on $T'$; its norm will live on $Y'$.
  Define the actual norm line and its rational section by
  #[#set math.equation(numbering: n => "(12.6)")
   $ B = "Nm"_q \( J \) := det \( q_(*) J \) ⊗ det \( q_(*) cal(O)_(T') \)^(- 1) \, wide beta =
     "Nm"_q \( eta_J \) . $ <g:flat-norm-definition>]
  Both direct images in this formula are locally free of rank $d_0$.
    To describe the section, view multiplication by $eta_J$ as a rational map $q_(*) cal(O)_(T') arrow.r
    q_(*) J$ and take its determinant. Locally a line bundle can be trivialized near a finite inverse fiber;
    changing the frame by a unit changes its norm frame by the determinant of multiplication by that unit.
    This proves the compatibility of (12.6) with changes of frame and arbitrary base change.
    The construction uses finite local freeness, and does not require $T'$ to be smooth or $q$ to be unramified
    #cite(label("StacksProject")) Tags 0BUT, 0BCX and 0BD2.
  Over the generically unramified locus the norm is the product over the $d_0$ sheets.
    Applying (12.5) on those sheets gives
  #[#set math.equation(numbering: n => "(12.7)")
   $ \| beta \( y \) \|^2 asymp S \( y \)^(d_0) . $ <g:flat-norm-comparison>]
  These constants remain bounded at the branch locus. Indeed,
    choose a frame for $J$ near the finite inverse fiber. Its continuous reference norm is bounded above and away
    from zero there, and its norm is a nonvanishing frame of $B$.
    Products of the finitely many reference norms are therefore comparable to any fixed reference norm on $B$.
    This also explains why the exponent is multiplied by $d_0$.
  Define a metric on $B$, initially where $beta$ is a nonzero regular frame, by $\| beta \|^2 = S^(d_0)$.
    If $beta = b e$ in a local holomorphic frame $e$, its weight is
  $ psi = d_0 u + log \| b \|^2 . $
  It is psh on that open. Equation (12.7) bounds $psi$ above and below locally even toward the omitted locus.
    The bounds hold for the psh representatives, by subaveraging and upper semicontinuity.
    Removable singularities across analytic sets therefore extend $psi$ to a locally bounded psh weight on all of $Y'$.
  Resolve $V_0$ to $V'$, with maps $pi'$ and $f'$ as in the statement. The rule
  #[#set math.equation(numbering: n => "(12.8)")
   $ beta mapsto tau^(d_0) $ <g:flat-section-rule>]
  defines a rational homomorphism in (12.2) over the original field. It extends regularly.
    Indeed, write $beta = b e_B$ and $tau = t e_L^(⊗ a)$ in local holomorphic frames,
    with the fixed reference norms bounded above and below. The coefficient of this map is
    $t^(d_0) \/ \( b compose f' \)$. On almost every fiber in the good open,
    (12.7) and the definition of the essential supremum give
  $ lr(|frac(t^(d_0), b compose f')|)^2 lt.eq
    C frac(S \( f' \( thin dot.op thin \) \)^(d_0), \| beta compose f' \|_(upright("ref"))^2) lt.eq C' . $
  The bound first holds almost everywhere on these fibers and then everywhere on their good locus by continuity of
    the rational coefficient. A rational coefficient with a pole along a prime divisor would be unbounded on open
    subsets approaching its general point; those subsets meet these fibers.
    This excludes every divisorial pole, and normality extends the map across codimension two.
    In the invariant case the rule (12.8) is invariant as a rational identity on $X$.
    The auxiliary alterations and final resolution need not be equivariant.
  We have constructed the bounded base metric and its map back to $X$.
    On the new base, $S$ denotes the same generic fiber supremum,
    whereas $I_0$ now denotes the density of $\( f' \)_(*) \( pi' \)^(*) mu$ in the chosen coordinates on $Y'$.
    The latter transforms as a volume density, including the base Jacobian.
    Off the exceptional locus of the base modification, this changes $-
    log I_0$ by a pluriharmonic coordinate term and retains its plurisubharmonicity.
    It remains to extend the volume metric and ensure that all its correction primes disappear, or land in $D$,
    upon return to $X$.
  #emph[The correction divisor and every component of its pullback.] Among the boundary prime divisors of the good
    open in $Y'$, let $D'$ be the reduced sum of those primes $Q$ for which every prime of $V'$ dominating $Q$ is
    either $pi'$-exceptional or maps into $D$. This definition first addresses components that dominate base
    primes. It gives (12.3) for #emph[all] components of the total pullback because of the equidimensional model
    $V_0$. To see this, put $n = dim X$ and $r = n - dim Y'$.
    If a prime $R subset V'$ maps into a set $A subset Y'$ of codimension at least two, then
  $ dim \( V_0 times_(Y') A \) lt.eq dim A + r lt.eq n - 2 . $
  The image of $R$ in $V_0$, hence in $X$, has dimension at most $n - 2$, since $V_0 arrow.r X$ is a morphism.
    Thus $R$ is $pi'$-exceptional. Every other component of $\( f' \)^(*)
    D'$ dominates a component of $D'$ and is covered by its definition.
    This proves (12.3), including the divisors introduced by the last resolution.
  At a general point of a boundary prime $Q$, choose a component $R subset \( f' \)^(*) Q$ dominating it, and write
  $ k = "ord"_R \( f' \)^(*) Q > 0 \, wide b = "ord"_R #scale(x: 120%, y: 120%)[\(] K_(V' \/ X) +
    c \( pi' \)^(*) D #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  The psh weight of $h_M$ is locally bounded above. Hence the pullback measure is bounded below by a positive
    constant times $\| z_1 \|^(2 b)$ times coordinate volume near a general point of $R$.
    Coordinates can be chosen there with $t_1 = z_1^k$, where $Q = \( t_1 = 0 \)$,
    and with the other base coordinates among the remaining source coordinates.
    Integration in a fixed small fiber polydisc and change of variables give
  #[#set math.equation(numbering: n => "(12.9)")
   $ I_0 \( t \) gt.eq C \| t_1 \|^(2 \( \( b + 1 \) \/ k - 1 \)) $ <g:flat-volume-lower>]
  almost everywhere near a general point of $Q$. If $Q subset.not D'$,
    choose $R$ nonexceptional over $X$ and not mapping into $D$.
    Then $b = 0$; the exponent in (12.9) is nonpositive, so in particular $I_0$ has a positive constant lower
    bound there.
  There are only finitely many boundary primes. Choose an integer $c' gt.eq
    0$ at least as large as each positive exponent $\( b + 1 \) \/ k - 1$ needed for a component of $D'$.
    If $d'$ is an equation of $D'$, the psh function
  $ - log I_0 + c' log \| d' \|^2 $
  is locally bounded above at the generic points of all boundary primes.
    It extends across them, and then across the remaining analytic subset of codimension at least two by the
    Hartogs extension property for psh functions. These are the weights of a semipositive metric on $- K_(Y') +
    c' D'$. Dividing its metric by the divisor metric of $c' D'$ recovers the measure with density $I_0$.
    It has finite mass because it is the pushforward of the original finite measure.
  Finally take a nonzero rational section of $m B$ with poles on $D'$, pull it back,
    and apply the $m$-th power of (12.2). The only possible poles lie in $\( f' \)^(*) D'$.
    Equation (12.3) shows that its pushdown has poles only on $D$, and it is nonzero at the generic point.
    In the smooth invariant case this rational section is invariant by (12.8); since $D = 0$,
    normality makes it a global regular section on $X$. ◻
]

#prodef([Remark 12.5.])[
  (Valuations of the norm).  The finite norm itself creates no polar prime away from the images of polar primes
    upstairs. At a prime $Q subset Y'$, pass to the discrete valuation ring $cal(O)_(Y' \, Q)$ and normalize its
    finite generic extension. If $v_i$ are the extension valuations and $f_i$ their residue degrees,
    then for a nonzero rational function $z$,
  $ "ord"_Q "Nm" \( z \) = sum_i f_i v_i \( z \) . $
  This is the determinant of multiplication by $z$, computed by lengths of lattices after clearing denominators.
    Applied in local frames, it gives the same formula for a normed rational section.
    For the section returned to $X$, the stronger statement needed is (12.3):
    it also treats components lying over codimension-two sets in the base.
] <g:flat-norm-valuations>

#prodef([Remark 12.6.])[
  (What is descended).  The determinant construction in (12.6) descends a line on a possibly ramified,
    nonsmooth finite flat cover and changes $a$ to $d_0 a$. The finite-group quotient construction in
    #cite(label("CCohomologicalTransfer")) Subsection “Descending the alteration and its section” instead first
    kills stabilizer actions by a tensor power and then uses a function-field norm on a normal target.
    These are different model constructions. They are also distinct from the finite #emph[étale] section norm of a
    line already pulled back from the original variety. None of the three permits induction on the altered base
    $T$ here; the induction below takes place on $Y'$, whose function field remains $bb(C) \( Y \)$.
]

=== 12.2 An approximation proof of the slope input <an-approximation-proof-of-the-slope-input>

For the rationally connected application of the reduced-flat construction,
  the required slope inequality also has an approximation proof.
  Its distinctive step is to convert finite weighted volume into a klt boundary on a resolution.
  We give that step, rather than infer it from the existence of the descended metric.

#thm([Proposition 12.7.])[
  (Floor approximation for foliation determinants).  #emph[Let $X$ be smooth projective,
    let $D$ be a reduced effective divisor, and let $c gt.eq 0$ be an integer.
    Suppose that $M = - K_X + c D$ has a semipositive singular metric with finite induced measure $\| d \|^(2 c)
    e^(- phi) thin d V_X$. Every algebraically integrable saturated foliation $cal(F) subset
    T_X$ of positive rank and corank satisfies
#[#set math.equation(numbering: n => "(12.10)")
 $ K_(cal(F)) + M quad upright("is pseudoeffective") . $ <g:flat-foliation-psef>]

]
] <g:reduced-flat-slope>

#proof[
  Its leaves define a rational fibration. Fix a sufficiently ample line bundle $H$,
    independent of the integer $l gt.eq 2$. Nadel vanishing and Castelnuovo–Mumford regularity make
  $ cal(O)_X \( l M + H \) ⊗ cal(J) \( l phi \) $
  globally generated. The local Bergman approximation inequality gives, for its local base ideal generators $g_j$,
  #[#set math.equation(numbering: n => "(12.11)")
   $ e^(l phi) lt.eq C_l sum_j \| g_j \|^2 . $ <g:flat-approximation>]
  The fixed ample twist can be chosen by applying Nadel vanishing after subtracting $1 \, dots.h \,
    dim X$ times a fixed very ample line bundle. The local inequality follows from point extension in the weighted
    holomorphic $L^2$ space; generators of the multiplier ideal represent the singularities of that space.
    These are the usual Bergman approximation and global generation constructions of Demailly
    #cite(label("Demailly2015")) Theorems 0.3 and 1.2.
  Let $rho : U arrow.r X$ resolve the rational fibration and principalize this base ideal, with its divisor $R_l$,
    and let $E_U = K_(U \/ X)$. Take a simultaneous log resolution with $rho^(*) D$.
    Finite mass and (12.11) imply, along every prime on $U$,
  #[#set math.equation(numbering: n => "(12.12)")
   $ floor.l R_l \/ l floor.r lt.eq E_U + c rho^(*) D . $ <g:flat-floor-bound>]
  Indeed the comparison makes $\| s_(E_U + c rho^(*) D) \|^2 \| s_(R_l) \|^(- 2 \/ l)$ locally integrable.
    At a prime with respective orders $b$ and $r$, integrability says $b - r \/ l > - 1$;
    since $b$ is integral this is exactly $floor.l r \/ l floor.r lt.eq b$.
  Pull back the linear subsystem
  $ H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( l M + H \) ⊗ cal(J) \( l phi \) #scale(x: 120%, y: 120%)[\)]
    subset.eq H^0 \( X \, l M + H \) $
  to $U$, and remove its fixed divisor $R_l$. Let $G_l$ be a general member of the resulting basepoint-free
    system, and put
  $ Delta_l = R_l \/ l - floor.l R_l \/ l floor.r + G_l \/ l . $
  Bertini and the log resolution make $Delta_l$ an effective klt boundary,
    also klt on the general fiber of the resolved fibration. Moreover,
  #[#set math.equation(numbering: n => "(12.13)")
   $ K_U + Delta_l tilde.op_(bb(Q)) E_U + c rho^(*) D - floor.l R_l \/ l floor.r +
     rho^(*) H \/ l . $ <g:flat-adjoint-approximation>]
  By (12.12), a positive divisible multiple of the right side restricts to an effective divisor on the general
    fiber. One may take a general effective representative of $H$, which does not contain that fiber.
  The relative pseudoeffectivity theorem for an algebraically integrable foliation now gives $K_(cal(F)_U) +
    Delta_l$ pseudoeffective on $U$, where $cal(F)_U$ is the induced foliation #cite(label("Ou2023"))
    Proposition 3.1, arXiv version 4; its relative positivity input is due to Druel #cite(label("Druel2017"))
    Proposition 4.1. The hypotheses used are the effective boundary,
    log canonicity of its general-fiber restriction, and the general-fiber nonvanishing in (12.13).
    Push down to $X$, and add back the effective divisor $rho_(*) floor.l R_l \/ l floor.r$.
    Since foliation determinants agree away from the exceptional locus, this proves that $K_(cal(F)) + M +
    H \/ l$ is pseudoeffective. Its limit as $l arrow.r oo$ proves (12.10). ◻
]

Apply Lemma 15 with $P = c D$. For every nonzero movable class $alpha$ on a positive-dimensional $X$ with $D
  dot.op alpha = 0$, the preceding proposition gives $mu_(alpha \, min) \( T_X \) gt.eq 0$.
  Movable tensor semistability then gives nonpositive maximal slope for every cotangent tensor power and its
  exterior powers. Thus every coherent subsheaf of $\( Omega_X^1 \)^(⊗ k)$, or of $Omega_X^p$,
  has nonpositive $alpha$-degree. For degree zero this follows directly from the inclusion in $cal(O)_X$.
  The floor construction above is an alternative proof of the foliation input to the general weighted estimate,
  Proposition 16.

=== 12.3 An alternative proof of allowed-pole nonvanishing <g:rc-allowed-poles>

The reduced-flat transfer preserves the original base field.
  This is what permits rational connectedness to pass to the base on which we induct.
  The following proof records how the common field and determinant constructions meet every rank hypothesis of
  Proposition 47.

We prove the rationally connected case of Theorem 23 using reduced-flat transfer.
  First reduce its arbitrary effective integral boundary $D_0$ to a multiple of a reduced divisor.
  Put $D = "Supp" \( D_0 \)_(upright("red"))$, choose an integer $c gt.eq 0$ with $c D - D_0 gt.eq 0$,
  and tensor the metric on $- K_X + D_0$ with the canonical divisor metric of $c D - D_0$.
  The new metric on $- K_X + c D$ is semipositive, and its distinguished measure is unchanged:
  the squared divisor factor cancels the added metric factor.
  A rational section of $m L$, $m > 0$, with poles only on $D$ belongs to $H^0 \( X \, m L + r D_0 \)$ for some
  sufficiently large $r gt.eq 0$. The zero boundary is included by taking $D = 0$ and $c = 0$.

It therefore suffices to take $X$ smooth projective and rationally connected, $D$ reduced effective,
  and $L$ a line bundle that has a semipositive metric with locally bounded weights.
  Suppose $- K_X + c D$ has a semipositive metric with finite induced measure for an integer $c gt.eq 0$.
  We seek a nonzero section of $m L + r D$ with integers $m > 0$ and $r gt.eq 0$. A point is included.

#proof[
  Induct on $n = dim X$; the assertion for a point is immediate. Suppose the conclusion fails.
    The class $L + D$ is pseudoeffective and not big, so cone duality gives a nonzero movable class $alpha$ with
  $ L dot.op alpha = D dot.op alpha = 0 $
  #cite(label("BDPP2013")). Proposition 50 and the following slope argument apply.
    Rational connectedness gives $H^i \( X \, cal(O)_X \) = 0$ for $i > 0$,
    so $chi \( X \, K_X \) = \( - 1 \)^n eq.not 0$. Riemann–Roch makes $chi \( X \, K_X + m L \)$ a nonzero
    polynomial. Thus one cohomological degree occurs with nonzero cohomology for an unbounded sequence of positive
    $m$. Hard Lefschetz with multiplier ideals supplies twisted holomorphic forms for that sequence;
    the multiplier ideals are trivial because the metric weights on $m L$ are bounded #cite(label("DPS2001")).
  Apply the determinant construction of Lemma 6 to these forms.
    Its fixed determinant maps nontrivially to a cotangent tensor power,
    so its $alpha$-degree is nonpositive by the slope consequence of Proposition 50.
    We obtain a fixed line bundle $B_0$ and effective divisors
  #[#set math.equation(numbering: n => "(12.14)")
   $ N_j tilde.op j L + B_0 \, wide alpha dot.op N_j = 0 $ <g:flat-determinant-sequence>]
  for an unbounded set of positive integers $j$.
  Let $K_alpha subset bb(C) \( X \)$ be the field of functions whose polar divisors have $alpha$-degree zero.
    By Lemma 28, it is relatively algebraically closed, its transcendence degree is less than $n$,
    and it is represented by a rational fibration with connected generic fiber.
    Resolve it to $pi : V arrow.r X$, $f : V arrow.r Y$, with $Y$ smooth projective.
    For a general sufficiently ample divisor $H_Y$ on $Y$,
  #[#set math.equation(numbering: n => "(12.15)")
   $ alpha dot.op pi_(*) f^(*) H_Y = 0 . $ <g:flat-base-degree>]
  Indeed a general ratio from $\| H_Y \|$ belongs to $K_alpha$;
    the two general pulled-back divisors have no common component, so its pole divisor represents the indicated class.
  The affine interpolation of Lemma 13 applied to (12.14) produces an integer $a >
    0$ and a nonzero rational section $tau$ of $a pi^(*) L$ that is regular over a dense base open.
    Explicitly, the linear equivalence
  $ \( k - i \) N_j tilde.op \( k - j \) N_i + \( j - i \) N_k wide \( i < j < k \) $
  has its defining function in $K_alpha$. Consequently the coefficients of $pi^(*)
    N_j$ at every horizontal prime are affine in $j$; nonnegativity at unbounded $j$ makes each slope nonnegative.
    A difference of two such divisors has no negative horizontal part and gives $tau$.
    If $Y$ is a point, this already gives a global section of a positive multiple of $L$.
  Suppose therefore that $dim Y > 0$, and put $E = K_(V \/ X)$.
    For every integer $p gt.eq 0$, $s_E s_(c pi^(*) D) tau^p$ is a nonzero generic-fiber section of $E +
    c pi^(*) D + p a pi^(*) L$. Any finite set of other generic-fiber sections becomes global after a common
    sufficiently ample base twist. The pushdowns of their effective divisors have $alpha$-degree zero, by (12.15),
    $pi_(*) E = 0$, and $alpha L = alpha D = 0$. Ratios of two such sections therefore belong to $K_alpha$,
    proving (12.1) for every $p$, including zero. This argument establishes generic ranks and requires no
    simultaneous base-change assertion for infinitely many sheaves.
  Proposition 47 produces $Y' \, B \, D'$. The variety $Y'$ is rationally dominated by $X$,
    so it is rationally connected, and its dimension is smaller than $n$.
    Induction gives a section of $m B + r D'$ for some $m > 0$, $r gt.eq 0$.
    Transfer returns a nonzero rational section of $m d_0 a L$ with poles only on $D$, the required contradiction. ◻
]

=== 12.4 An alternative proof for the invariant quotient <g:flat-invariant-application>

We now prove the rationally connected case of Theorem 25 by the same reduced-flat method.
  Let $F$ be smooth projective and rationally connected, with $L = - K_F$ smoothly semipositive,
  and let an algebraic torus $T$ act with the natural anticanonical linearization.
  Average a smooth semipositive metric over a compact real form of $T$.
  We seek $H^0 \( F \, m L \)^T eq.not 0$ for some integer $m > 0$.

#proof[
  For the trivial action this is the argument of Section 12.3 with $D = 0$.
    Otherwise take a rational quotient and an equivariant resolution $pi : V arrow.r F$, $f : V arrow.r Y$.
    Its invariant field is $bb(C) \( Y \)$, and the generic fiber is an orbit closure.
    In particular it is connected. On the smooth quotient locus, choose $dim V -
    dim Y$ generically independent vector fields from the torus action and wedge them.
    Commutativity makes their wedge an invariant section of $- K_(V \/ Y)$.
    Tensor it with a rational anticanonical frame from $Y$, then multiply by the Jacobian section $s_E$,
    where $E = K_(V \/ F)$. This produces an invariant rational section $tau$ of $pi^(*) L$,
    regular over a dense base open.
  For every $p gt.eq 0$, the invariant generic-fiber adjoint space for $E + p pi^(*) L$ contains $s_E tau^p$.
    Two nonzero invariant sections have an invariant ratio, hence a ratio in $bb(C) \( Y \)$.
    Its invariant rank is exactly one, also at $p = 0$. Apply the smooth invariant part of Proposition 47,
    using the given smooth metric for both $L$ and $- K_F$. If $Y$ is a point,
    $tau$ is already a global invariant section. Otherwise the resulting original-field base $Y'$ is rationally
    connected; apply the argument of Section 12.3 there and transfer its section.
    The pole-support statement and $D = 0$ make the resulting invariant section regular on $F$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
