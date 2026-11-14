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

#align(center)[#text(size: 16pt, weight: "bold")[Counterexamples to weak chromatic splitting: \
sphere kernels and descent exponents]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 The canonical weak splitting map <sec:introduction>

Fix a prime $p$ and work in ordinary $p$-local spectra, with sphere $S = S_(\( p \))^0$.
  Let $K \( a \)$ denote Morava $K$-theory of height $a$, put $K \( 0 \) = H bb(Q)$, and write

$ L_r = L_(K \( 0 \) or dots.h.c or K \( r \)) \, wide X = S_p^and = "holim"_(j gt.eq 1) S \/ p^j . $

Thus $L_r$ is Johnson–Wilson $E \( r \)$-localization. For a spectrum $Z$, let $eta_Z^(\( n \)) : Z arrow.r
  L_(K \( n \)) Z$ be the localization unit. We study

#[#set math.equation(numbering: n => "(1)")
 $ i_(n \, X) = L_(n - 1) \( eta_X^(\( n \)) \) : L_(n - 1) X arrow.r L_(n - 1) L_(K \( n \)) X . $ <eq:weak-unit>]

The weak chromatic splitting conjecture predicts a homotopy retraction of this map whenever $X$ is the derived
  $p$-completion of a finite spectrum. A retraction is a map of spectra $r$ with $r i_(n \, X) tilde.eq
  upright("id")$; it need not be natural in the finite input.
  We disprove this universal assertion with finite input the sphere.

For an odd prime, let

$ beta_1 in pi_(d_p) S \, wide d_p = 2 p \( p - 1 \) - 2 \, wide k_p = \( p - 1 \)^2 \, wide z_p = beta_1^(k_p) \, $

where $beta_1$ is the classical first beta element.

#thm([Theorem 1.1.])[
  (A named kernel at height $p$).  #emph[For every prime $p gt.eq 5$,
    the image of $z_p$ in $pi_(d_p k_p) L_(p - 1) X$ is nonzero and is killed by $pi_(d_p k_p) \( i_(p \, X) \)$.
    Consequently $i_(p \, X)$ has no homotopy retraction.]
] <thm:height-p-kernel>

#thm([Theorem 1.2.])[
  (The same kernel at height $p + 1$).  #emph[For every prime $p gt.eq 7$,
    the image of the same $z_p$ in $pi_(d_p k_p) L_p X$ is nonzero and is killed by
    $pi_(d_p k_p) \( i_(p + 1 \, X) \)$. Consequently $i_(p + 1 \, X)$ has no homotopy retraction.]
] <thm:height-plus-one-kernel>

#thm([Corollary 1.3.])[
  (The prime-five class).  #emph[At $p = 5$, the image of $beta_1^16$ in $pi_608 L_4
    X$ is nonzero and belongs to the kernel of $pi_608 \( i_(5 \, X) \)$.]
] <thm:five>

The proof detects $z_p$ under a height-$\( p - 1 \)$ unit and kills it under both upper units.
  The lower detection follows from the Hopkins–Miller calculation recorded by Heard #cite(label("heard2015"))
  proof of Theorem 5.6 and Lemma 5.8: the actual unit detects the named $beta_1$,
  and its $k_p$th power remains nonzero in the ordinary homotopy fixed point spectral sequence.
  At the upper height $a$, we construct a separated multiplicative filtration with the unit image of $beta_1$ in
  filtration at least two and $F^(a^2 + 2) = 0$. The required inequalities are

$ 2 k_p - \( p^2 + 1 \) = p^2 - 4 p + 1 > 0 quad \( p gt.eq 5 \) \, $

$ 2 k_p - \( \( p + 1 \)^2 + 1 \) = p \( p - 6 \) > 0 quad \( p gt.eq 7 \) . $

Completion and naturality then place the nonzero lower image in the kernel of the exact map (1).
  For example, at $p = 7$ the class $beta_1^36$ has degree $82 dot.op 36 =
  2952$ and gives kernels at both heights seven and eight.

===== 1.1 Notation. <par:common-notation>

Let $E_a$ be Morava $E$-theory of the height-$a$ Honda formal group over $bb(F)_(p^a)$, and put $B_a =
  L_(K \( a \)) S$. Unless a localized tensor is explicitly displayed,
  smash products and function spectra are ordinary. All homotopy groups are those of the underlying spectra.

=== 1.1 An independent descent-exponent obstruction <an-independent-descent-exponent-obstruction>

The height-$p$ nonretraction also follows from incompatible finite descent lengths.
  Put $t = p - 1$, and let the finite pure-stabilizer subgroup $H = C_p times.r C_(\( p - 1 \)^2)$ act on $E_t$.
  In $cal(D)_H = "Fun" \( B H \, upright("Sp")_(\( p \)) \)$, with pointwise ordinary smash, put $A_H =
  F \( H_(+) \, S \)$ with its translation action and $J_H = "fib" \( S arrow.r A_H \)$.
  Define $exp_H \( V \)$ as the least $b gt.eq 1$ such that $J_H^(and b) and V arrow.r V$ is null,
  and as infinity if no such $b$ exists. Set

$ T \( V \) = L_(K \( t \)) \( E_t and V \) \, $

with $H$ acting on the first factor.

#thm([Theorem 1.4.])[
  (Incompatible descent exponents).  #emph[For every prime $p gt.eq 5$, with $m = p^2 + 2$,
$ exp_H \( E_(p - 1) \) > m \, wide exp_H #scale(x: 120%, y: 120%)[\(] T \( B_p \) #scale(x: 120%, y: 120%)[\)]
  lt.eq m . $

 A homotopy retraction of $i_(p \, X)$ would make $E_(p - 1)$ an $H$-equivariant retract of $T \( B_p \)$.
   Hence $i_(p \, X)$ has no homotopy retraction, independently of Theorem 1.]
] <thm:exponents>

For the lower bound, a class survives to one specified finite page of the ordinary homotopy fixed point spectral
  sequence. No permanent cycle or sphere representative is needed.
  For the upper bound, Devinatz–Hopkins’ nilpotence theorem supplies a finite exponent before any homotopy test is
  chosen #cite(label("dh2004")) Appendix A, Proposition A.3.
  The numerical cochain bound then makes the relevant map zero after every finite ordinary test.
  A Brown–Comenetz argument proves that the map itself is null,
  and a coherent trace construction transports the resulting finite filtration to height $p - 1$.
  The finite-stage formalism used here belongs to the nilpotence and descent theory of Mathew and
  Mathew–Naumann–Noel #cite(label("mathew2016")) #cite(label("mnn2017")) #cite(label("mnn2019")).

=== 1.2 Relation to earlier splitting results <relation-to-earlier-splitting-results>

Hopkins’ chromatic splitting conjecture, recorded by Hovey #cite(label("hovey1995")) Conjecture 4.2,
  especially part (v), predicts a specific decomposition of chromatic overlap as well as the weak unit retraction.
  These predictions differ already at $n = p = 2$. Beaudry disproves the proposed strong summand formula
  #cite(label("beaudry2017")) Theorem 1.0.4; Beaudry–Goerss–Henn give a revised decomposition with Moore terms
  that retains the canonical unit as a retract #cite(label("bgh2022")) Theorem 1.1.6.
  Their Conjectures 1.1.10–1.1.11 distinguish the strong and completed-finite-input weak formulations,
  and their introduction records the weak form at all primes through height two.
  The theorem numbers refer to the versioned texts identified in the bibliography.
  Outside finite inputs, Minami reports Devinatz’s counterexample for a $B P$ analogue allowing completed $B
  P$ #cite(label("minami2003")) Introduction and Remark 1.1.
  The present counterexamples use the completion of the finite sphere.

Long beta powers in the sphere were known earlier. Lee–Ravenel prove $beta_1^(p^2 - p - 1) eq.not 0$ for $p gt.eq
  7$ and report $beta_1^17 eq.not 0$, $beta_1^18 = 0$ at five #cite(label("lee-ravenel1994")) opening theorem and
  introduction. Ravenel’s first-beta detection calculation relates the cobar class to stabilizer cohomology
  #cite(label("ravenel1978")) Theorem 4 and its proof in Section 2.
  The additional requirement here is detection after a specified lower localization and vanishing of that same
  named sphere product under the upper unit.

===== 1.2.1 Organization. <organization.>

Sections 2–5 prove the named kernel results. Their upper bound uses dimension at height $p +
  1$ and a semilinear trace-one contraction at height $p$, retaining the possible inverse-limit degree in both
  cases. Sections 6–11 give the independent exponent proof.
  Appendix 12 proves the ordinary filtered-product lemma used by the lower detector and by the finite-page argument.

== 2 Completion and the canonical map <sec:completion>

The lower detectors are local spectra, whereas the weak splitting problem uses a completed finite input.
  The following argument connects these settings without interchanging smash products and inverse limits.

#thm([Lemma 2.1.])[
  #emph[The completion map $c : S arrow.r X = S_p^and$ is a $K \( a \)$-equivalence for every integer $a gt.eq 1$.
    If $1 lt.eq t lt.eq r$ and $Y$ is $K \( t \)$-local, every map $S arrow.r Y$ factors through $S arrow.r
    X arrow.r L_r X$.]
] <lem:completion>

#proof[
  Take the inverse limit of the cofiber sequences $S arrow.r^(p^j) S arrow.r S \/ p^j$,
    with multiplication by $p$ on the left spheres and identity on the middle spheres. The fiber of $c$ is
  $ C tilde.eq "holim" \( dots.h.c arrow.r^p S arrow.r^p S \) tilde.eq F \( S \[ 1 \/ p \] \, S \) . $
  Multiplication by $p$ is an equivalence on this function spectrum,
    because it is an equivalence on its first argument. It remains an equivalence after ordinary smash with
    $K \( a \)$. But $pi_(*) \( K \( a \) and C \)$ is a module over $K \( a \)_(*)$ and is annihilated by $p$.
    Thus it is zero, proving the first claim.
  A map to a $K \( t \)$-local target consequently extends across $c$.
    The target is also $L_r$-local when $t lt.eq r$, since an $L_r$-acyclic spectrum is $K \( t \)$-acyclic.
    The extension therefore factors through $L_r X$. ◻
]

#thm([Proposition 2.2.])[
  (An actual sphere kernel).  #emph[Let $n gt.eq 2$, let $1 lt.eq t lt.eq n - 1$, and let $z in pi_q S$.
    Suppose a map $S arrow.r Y$ to a $K \( t \)$-local spectrum carries $z$ to a nonzero element,
    and the unit $S arrow.r L_(K \( n \)) S$ carries $z$ to zero.
    Then the image $macron(z) in pi_q L_(n - 1) X$ is nonzero and $pi_q \( i_(n \, X) \) \( macron(z) \) = 0$.]
] <prop:kernel-criterion>

#proof[
  Lemma 5 factors the detecting map through $L_(n - 1) X$, so $macron(z)$ is nonzero.
    Write $eta$ for $K \( n \)$-localization and $lambda$ for $L_(n - 1)$-localization. The relevant two squares are
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$S$])
  content((2.589, 0), [$X$])
  content((0, -0.744), [$L_(K \( n \)) S$])
  content((2.589, -0.744), [$L_(K \( n \)) X$])
  line((0.336, 0), (2.253, 0), mark: (end: ">"))
  content((1.294, 0.2266), [#text(size: 0.73em)[$c$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.3705, -0.372), [#text(size: 0.73em)[$eta_S$]])
  line((2.589, -0.2725), (2.589, -0.4715), mark: (end: ">"))
  content((2.959, -0.372), [#text(size: 0.73em)[$eta_X$]])
  line((0.732, -0.744), (1.857, -0.744), mark: (end: ">"))
  content((1.294, -0.5173), [#text(size: 0.73em)[$L_(K \( n \)) c$]])
})
  Both commute by naturality of localization units. Equivalently,
  $ eta_X c tilde.eq L_(K \( n \)) \( c \) eta_S \, wide i_(n \, X) lambda_X tilde.eq lambda_(L_(K \( n \)) X) eta_X . $
  The first sends $z$ to zero, and the second then gives the asserted kernel of the exact map (1).
    A retraction would induce a left inverse on this homotopy group and is therefore impossible. ◻
]

== 3 The named sphere product at the lower height <sec:lower-sphere-product>

The classical first beta element supplies the lower detector at every odd prime.
  The fixed-point calculation identifies its image under an actual unit,
  and the ordinary multiplicative filtration then detects its long power.
  This gives one named sphere product for both upper heights.

Fix an odd prime $p$ and put

$ h = p - 1 \, wide d = 2 p \( p - 1 \) - 2 \, wide z_p = beta_1^(\( p - 1 \)^2) \, wide beta_1 in pi_d S . $

#thm([Theorem 3.1.])[
  (The lower sphere product).  #emph[The image of $z_p$ is nonzero in each of
$ pi_(d \( p - 1 \)^2) L_(K \( p - 1 \)) S \, wide pi_(d \( p - 1 \)^2) L_(K \( p - 1 \)) X \, wide
  pi_(d \( p - 1 \)^2) L_r X quad \( r gt.eq p - 1 \) . $

 All three images are induced by the sphere unit and, for the completed input, by the completion map $S arrow.r X$.]
] <thm:lower-sphere-product>

=== 3.1 The actual unit in the ordinary detector <the-actual-unit-in-the-ordinary-detector>

Let $E_h$ be Morava $E$-theory over $bb(F)_(p^h)$. Write $bb(S)_h$ for the pure stabilizer and $bb(G)_h =
  bb(S)_h times.r "Gal" \( bb(F)_(p^h) \/ bb(F)_p \)$ for the extended stabilizer.
  Choose the finite subgroup $G subset bb(G)_h$ whose intersection with the pure stabilizer is $C_p times.r
  C_(h^2)$ and whose Galois projection is onto, as in #cite(label("heard2015")) Section 2. Put

$ Y = E_h^(h G) \, wide eta : S arrow.r Y . $

Here $Y$ is the ordinary homotopy fixed point spectrum and $eta$ is its unit as a commutative ring spectrum.
  Devinatz–Hopkins identify the ordinary finite-group fixed-point spectral sequence with the local Adams spectral
  sequence and give strong convergence #cite(label("dh2004")) Theorems 2(ii) and 3.
  Its decreasing homotopy filtration $F^s pi_(*) Y$ is therefore separated, with

$ F^s pi_q Y \/ F^(s + 1) pi_q Y tilde.equiv E_oo^(s \, q + s) . $

The Hopkins–Miller calculation gives the positive-filtration part of its $E_2$ page as the corresponding part of

$ bb(F)_p \[ alpha \, beta \, Delta^(plus.minus 1) \] \/ \( alpha^2 \) \, wide \| alpha \| = \( 1 \, 2 h \) \,
  quad \| beta \| = \( 2 \, 2 p h \) \, quad \| Delta \| = \( 0 \, 2 p h^2 \) \; $

see #cite(label("heard2015")) Proposition 5.5 and #cite(label("hms2017")) Proposition 2.7.
  We need two further assertions of that calculation. First,
  Heard identifies $beta$ with the image of the named stable $beta_1$ under $eta$ #cite(label("heard2015")) proof
  of Theorem 5.6. Allowing for the choice of cohomology generator, this says

#[#set math.equation(numbering: n => "(2)")
 $ eta_(*) \( beta_1 \) in F^2 pi_d Y \, wide \[ eta_(*) \( beta_1 \) \] = c beta in E_oo^(2 \, 2 p h) \, wide
   c in bb(F)_p^times . $ <eq:lower-unit-detection>]

The brackets denote the class modulo $F^3$. The Ext-to-group-cohomology comparison and permanence are also
  recorded in the discussion after #cite(label("hms2017")) Proposition 2.7.
  Second, in positive even filtration Heard’s ordinary $E_oo$ calculation is

#[#set math.equation(numbering: n => "(3)")
 $ E_oo^(upright("even") \, *) tilde.equiv
   bb(F)_p \[ Delta^(plus.minus p) \] \[ beta \] \/ \( beta^(h^2 + 1) \) \, wide
   upright("in positive filtration") \, $ <eq:lower-even-infinity>]

by #cite(label("heard2015")) Lemma 5.8. In particular $beta^(h^2)$ is nonzero.
  These inputs hold for every odd prime; the named detection is not restricted to $p = 5$.
  They concern the extended group $G$ and $bb(F)_p$ coefficients.
  The pure subgroup and its larger coefficient field will be used separately in the exponent argument.

#thm([Lemma 3.2.])[
  (The ordinary filtered product).  #emph[Let a finite group $Q$ act coherently on a commutative ring spectrum
    $R$. The ordinary homotopy fixed point spectral sequence has
$ E_2^(s \, t) = H^s \( Q \; pi_t R \) $

 and has the cup product on $E_2$ and the derivation rule for its differentials.
   Whenever this spectral sequence converges to $pi_(*) R^(h Q)$ with a separated homotopy filtration whose
   successive quotients are $E_oo$, its product on $E_oo$ is the associated-graded product for that actual
   homotopy filtration.]
] <lem:lower-bar-product>

The proof is given in Appendix 12.

#thm([Proposition 3.3.])[
  (The actual product in the detector).  #emph[The unit $eta : S arrow.r Y$ carries $z_p =
    beta_1^(h^2)$ to a nonzero class in $pi_(d h^2) Y$.]
] <prop:lower-power>

#proof[
  Apply Lemma 8 to the ordinary spectral sequence just described.
    The class of $eta_(*) \( beta_1 \)^(h^2)$ in $F^(2 h^2) pi_(d h^2) Y \/ F^(2 h^2 + 1) pi_(d h^2) Y$ is
  $ c^(h^2) beta^(h^2) eq.not 0 $
  by (2) and (3). Hence the homotopy class itself is nonzero.
    Since $eta$ is a ring map, this power is exactly $eta_(*) \( beta_1^(h^2) \)$,
    the image of the specified sphere product. ◻
]

#proof[
  The spectrum $Y$ is $K \( h \)$-local, since $E_h$ is local and local objects are closed under homotopy limits.
    Its unit therefore factors through $L_(K \( h \)) S$, where the image of $z_p$ must be nonzero by
    Proposition 9. Lemma 5 makes $L_(K \( h \)) \( S arrow.r X \)$ an equivalence;
    naturality carries that nonzero image to $L_(K \( h \)) X$.
    For every $r gt.eq h$, the same lemma factors the detecting unit through $S arrow.r X arrow.r L_r X arrow.r
    Y$. Its nonzero value on $z_p$ proves the remaining assertion. ◻
]

At $p = 5$ this is the named class $beta_1^16$ in degree $38 dot.op 16 = 608$.
  Section 5 kills its image at height five as part of the uniform upper argument.

== 4 Semilinear descent and an adic bound <sec:adic>

At height $a = p$ for $p gt.eq 5$, and at height $a = p + 1$ for $p gt.eq 7$,
  the upper arguments need continuous cohomology to vanish above degree $a^2 + 1$,
  for both sphere coefficients and finite-test coefficients.
  We first bound the cohomology of finite adic quotients and then pass to their countable inverse limit.
  At height $p$ the Galois quotient has order $p$, and its semilinear action on Witt coefficients supplies the
  required descent. At height $p + 1$ the full extended group has finite $p$-cohomological dimension.

Put $k_a = bb(F)_(p^a)$ and write

$ \( E_a \)_(*) = O_a \[ u^(plus.minus 1) \] \, quad O_a = W \( k_a \) \[ \[ u_1 \, dots.h \, u_(a - 1) \] \] \,
  quad frak(m)_a = \( p \, u_1 \, dots.h \, u_(a - 1) \) \, quad \| u \| = - 2 \, $

and $bb(G)_a = bb(S)_a times.r "Gal" \( k_a \/ bb(F)_p \)$. Here $bb(S)_a$ is the pure stabilizer over $k_a$.

Exactness of Galois invariants for $p$-complete twisted Witt modules is proved in
  #cite(label("goerss-hopkins2020")) Lemma 1.14. The explicit contraction below applies to arbitrary semilinear modules.

#thm([Lemma 4.1.])[
  (Trace-one contraction).  #emph[Let a finite group $Q$ act on a commutative ring $W$.
    Suppose $w in W$ satisfies $sum_(g in Q) g \( w \) = 1$. For any semilinear $W$-module $P$,
    one has $H^i \( Q \, P \) = 0$ for $i > 0$, with no finiteness or flatness hypothesis on $P$.
    In particular this holds for $W = W \( bb(F)_(p^a) \)$ and $Q = "Gal" \( bb(F)_(p^a) \/ bb(F)_p \)$,
    without a prime-to-$p$ hypothesis on $a$.]
] <lem:semilinear>

#proof[
  Use homogeneous group cochains: a degree-$q$ cochain is an equivariant function $f : Q^(q + 1) arrow.r P$,
    with differential the alternating deletion of coordinates. For $q gt.eq 1$ define
  $ \( h f \) \( g_0 \, dots.h \, g_(q - 1) \) = sum_(gamma in Q) gamma \( w \)
    f \( gamma \, g_0 \, dots.h \, g_(q - 1) \) . $
  For $g in Q$, replacing $gamma$ by $g gamma$ proves that $h f$ is equivariant:
    semilinearity converts $\( g gamma \) \( w \) thin g f$ into $g \( gamma \( w \) f \)$.
    In $h d + d h$, the terms deleting one of the displayed $g_i$ cancel in pairs.
    The term deleting the inserted coordinate is $sum_gamma gamma \( w \) f = f$.
    Thus $h d + d h = upright("id")$ in positive degrees, proving acyclicity for arbitrary $P$.
  For the Witt-ring case, the finite-field trace is onto. Lift a residue trace-one element to $w_0 in W$.
    Its Witt trace lies in $bb(Z)_p$ and is congruent to one modulo $p$, hence is a unit.
    Dividing $w_0$ by this invariant unit supplies $w$. We have not divided by $\| Q \|$. ◻
]

#thm([Lemma 4.2.])[
  (Finite quotients and the extra adic degree).  #emph[Let $G = S_0 times.r Q$ be profinite with $Q$ finite,
    and let $D gt.eq 0$ be an integer such that $"cd"_p \( S_0 \) lt.eq D$ for discrete $p$-primary modules.
    Let ${ M_j }_j$ be a countable tower of finite discrete $p$-primary $G$-modules with surjective transitions,
    and give $M = "proj lim"_j M_j$ the inverse-limit topology.
    Suppose each $M_j$ is a $W$-module, $S_0$ acts $W$-linearly, $Q$ acts semilinearly,
    and $W$ admits the trace-one element of Lemma 10. Then
$ H_("cts")^s \( G \, M_j \) = 0 quad \( s > D \) \, wide H_("cts")^s \( G \, M \) = 0 quad \( s > D + 1 \) . $

 The second conclusion also holds if the first displayed finite-quotient vanishing is supplied directly,
   without a semidirect-product hypothesis.]
] <lem:adic>

#proof[
  The pure-subgroup cochain complex is $W$-linear and has semilinear $Q$-action,
    including the conjugation action on its arguments: for an inhomogeneous $b$-cochain,
  $ \( gamma f \) \( s_1 \, dots.h \, s_b \) = gamma #scale(x: 120%, y: 120%)[\(]
    f \( gamma^(- 1) s_1 gamma \, dots.h \, gamma^(- 1) s_b gamma \) #scale(x: 120%, y: 120%)[\)] . $
  The pure differential is $W$-linear and commutes with this action.
    Its cohomology is therefore semilinear, whether or not that cohomology has separately been shown finite.
    The continuous Hochschild–Serre sequence at the discrete coefficient level is
  $ H^i #scale(x: 120%, y: 120%)[\(] Q \, H_("cts")^b \( S_0 \, M_j \) #scale(x: 120%, y: 120%)[\)] arrow.r.double
    H_("cts")^(i + b) \( G \, M_j \) . $
  Lemma 10 kills its positive $Q$-columns, giving
  $ H_("cts")^s \( G \, M_j \) = H_("cts")^s \( S_0 \, M_j \)^Q . $
  This proves the first bound. Continuous cochains into $M$ are compatible cochains into its finite quotients.
    Their transition maps are degreewise surjective: a continuous cochain has a finite value set,
    and any choice of lifts of those values gives a continuous cochain into the next finite quotient.
    No equivariant section is needed for inhomogeneous cochains. The countable inverse-limit sequence is therefore
  #[#set math.equation(numbering: n => "(4)")
   $ 0 arrow.r "proj lim"_j zws^1 H_("cts")^(s - 1) \( G \, M_j \) arrow.r H_("cts")^s \( G \, M \) arrow.r
     "proj lim"_j H_("cts")^s \( G \, M_j \) arrow.r 0 . $ <eq:adic-milnor>]
  Both outer terms vanish for $s > D + 1$. At the remaining boundary degree, the same sequence gives
  $ H_("cts")^(D + 1) \( G \, M \) tilde.equiv "proj lim"_j zws^1 H_("cts")^D \( G \, M_j \) . $
  Thus the bound retains the possible extra inverse-limit degree. ◻
]

#thm([Proposition 4.3.])[
  (The two upper heights).  #emph[Let $V_0$ be a finite ordinary $p$-local spectrum, let $D V_0 =
    F \( V_0 \, S \)$, and give $M = pi_q \( E_a and D V_0 \)$ its $frak(m)_a$-adic topology and Morava action. Then
$ H_("cts")^s \( bb(G)_a \, M \) = 0 wide \( s > a^2 + 1 \) $

 in each of the following cases: $a = p$ with $p gt.eq 5$, and $a = p + 1$ with $p gt.eq 7$.]
] <prop:cohomology>

#proof[
  The pure stabilizer is the maximal-order unit group in the central division algebra over $bb(Q)_p$ of dimension
    $a^2$, so it is compact $p$-adic analytic of that dimension #cite(label("morava1985")) Sections 2.1–2.2.
    It has no element $g$ of order $p$ in either stated range.
    Indeed, $\( g - 1 \) Phi_p \( g \) = 0$ in a division algebra and $g eq.not 1$ imply $Phi_p \( g \) = 0$.
    The polynomial $Phi_p \( X + 1 \)$ is Eisenstein, so $g$ generates the degree-$\( p - 1 \)$ subfield
    $bb(Q)_p \( zeta_p \)$. The division algebra would then be a vector space over this subfield, forcing $p -
    1 divides a^2$. For $a = p$ this forces $p - 1 divides 1$; for $a = p + 1$ it forces $p - 1 divides 4$.
    These are impossible in the stated ranges. The Lazard–Serre theorem therefore gives $"cd"_p \( bb(S)_a \) =
    a^2$ for discrete $p$-primary coefficients #cite(label("serre1965")) Section 1, Corollary (1).
  For each $q$, the coefficient module $M$ is finitely generated over the complete Noetherian ring $O_a$,
    by the finite construction of $D V_0$. It is complete and separated; its quotients $M_j =
    M \/ frak(m)_a^j M$ are finite discrete $p$-primary modules with surjective transitions.
    This uses no flatness of $M$ and allows torsion and both parities. The maximal ideal is invariant.
    For $V_0 = S$, continuity of the action on these quotients is part of the Morava action used by
    Devinatz–Hopkins #cite(label("dh2004")) Theorem 1(ii) and Remark 1.3.
    For every finite $V_0$, the actual action and its continuity are also obtained by the ordinary cooperation
    construction of Proposition 23 below.
  The pure stabilizer fixes $W \( k_a \)$. It fixes the residue field and thus the unique Hensel lifts of the
    roots of $X^(p^a) - X$, which are the Teichmüller representatives;
    continuity then fixes their convergent Witt expansions. Hence its action on $M_j$ is Witt-linear, while $Q =
    "Gal" \( k_a \/ bb(F)_p \)$ acts semilinearly by the Witt lift.
    At $a = p$, Lemma 11 with $D = p^2$ gives the bound. The full group has the split Galois subgroup of order
    $p$; this conclusion is specific to the stated coefficients.
    The cohomological-dimension theorem was applied only to $bb(S)_p$.
  At $a = p + 1$ with $p gt.eq 7$, the Galois quotient has order $p + 1$, prime to $p$.
    An order-$p$ element of $bb(G)_a$ would therefore lie in $bb(S)_a$, where we have just excluded it.
    The full group is a finite extension of the compact $p$-adic analytic pure group and has the same dimension
    $a^2$. The same dimension theorem now applies to the full group itself and gives
    $H_("cts")^s \( bb(G)_a \, M_j \) = 0$ for $s > a^2$. Apply only the inverse-limit part of Lemma 11 to this
    finite-quotient bound. In both cases the finite quotients vanish for $s > a^2$,
    and (4) gives the asserted bound $s > a^2 + 1$ for $M$. ◻
]

For the sphere-kernel argument, take $V_0 = S$, so that $M = \( E_a \)_q$.
  The exponent argument uses the same bound for every finite $V_0$,
  including modules with torsion and both parities. In both applications the topology is the full maximal-ideal
  topology, as in the continuous-cochain convention of Devinatz–Hopkins #cite(label("dh2004")) Remark 1.3.

#prodef([Remark 4.4.])[
  (A sharper line for sphere coefficients).  For the sphere homotopy fixed point spectral sequence,
    Bobkova and collaborators state an $E_2$ vanishing line at $s = n^2 + 1$ when $p -
    1 divides.not n$ #cite(label("bobkova2025")) Equation (2) and Remark 1.2.
    At $p = n = 5$ this gives $H_("cts")^s \( bb(G)_5 \; \( E_5 \)_q \) = 0$ for $s > 25$.
    That statement concerns the ordinary sphere coefficients $\( E_n \)_q$.
    It does not assert the same line for every finite-test module $pi_q \( E_n and D V_0 \)$ or identify an actual
    image filtration. Proposition 12 supplies the common conservative bound used in this paper.
] <rem:sphere-sharp>

== 5 Upper annihilation and the canonical kernels <sec:kernels>

At each upper height, torsion and parity place the unit image of $beta_1$ in Adams filtration two.
  The cohomological bound of Section 4 makes the sufficiently high filtration zero.
  To apply this to the same power detected at the lower height,
  we identify the Adams filtration with images of tensor powers of the unit fiber.
  This also proves its multiplicativity directly.

=== 5.1 Relative Adams stages <wimg:local-tower>

We first isolate the finite-stage comparison. In a stable symmetric monoidal $oo$-category with exact tensor,
  let $E$ be a unital algebra. Call an object $E$-injective if it is a retract of $E ⊗ Z$ for some $Z$.
  A relative $E$-Adams resolution of $V$ consists of triangles

$ T_(s + 1) arrow.r T_s arrow.r^(q_s) Q_s \, wide T_0 = V \, $

where each $Q_s$ is $E$-injective and $E ⊗ q_s$ is split monic.
  All stages map to $V$ by their composites down the tower.
  This is the relative convention of #cite(label("dh2004")) Appendix A.

#thm([Lemma 5.1.])[
  (Equality of relative Adams-stage images).  #emph[Two such resolutions of $V$ have the same stage-$s$ image in
    $\[ W \, V \]$ for every object $W$ and every $s gt.eq 0$.]
] <lem:adams-stage-images>

#proof[
  Suppose a map $f_s : T_s arrow.r T'_s$ over $V$ has been constructed, and put $g_s = q'_s f_s$. Choose a retract
  $ Q'_s arrow.r^(iota_s) E ⊗ Z_s arrow.r^(rho_s) Q'_s \, wide rho_s iota_s = 1 \, $
  and a splitting $sigma_s : E ⊗ Q_s arrow.r E ⊗ T_s$ with $sigma_s \( 1_E ⊗ q_s \) = 1$. The composite
  #[#set math.equation(numbering: n => "(5)")
   $ overline(g)_s : quad Q_s & arrow.r^(eta_(Q_s)) E ⊗ Q_s arrow.r^(sigma_s) E ⊗ T_s\
 & arrow.r^(1_E ⊗ \( iota_s g_s \)) E ⊗ E ⊗ Z_s arrow.r^(mu ⊗ 1) E ⊗ Z_s arrow.r^(rho_s) Q'_s $ <wimg:extension>]
  extends $g_s$ along $q_s$. Indeed, unit naturality gives $eta_(Q_s) q_s = \( 1_E ⊗ q_s \) eta_(T_s)$.
    The splitting removes $1_E ⊗ q_s$, and a second use of unit naturality followed by the module unit law gives
  $ overline(g)_s q_s = rho_s \( mu ⊗ 1 \) \( 1_E ⊗ \( iota_s g_s \) \) eta_(T_s) = rho_s iota_s g_s = g_s . $
  Complete this square to a map of fiber triangles to obtain $f_(s + 1) : T_(s + 1) arrow.r T'_(s + 1)$.
    Starting with $f_0 = upright("id")_V$ gives maps over $V$ at every finite stage,
    and hence one inclusion between the stage-$s$ images in $\[ W \, V \]$.
    Repeating the construction in the other direction proves equality.
    The comparison begins at stage zero on $V$, so the indices agree.
    Only these finite-stage maps are used; no equivalence of towers is asserted. ◻
]

=== 5.2 The separated upper filtration <the-separated-upper-filtration>

For a positive height $a$, work in the local category $cal(C)_a = upright("Sp")_(K \( a \))$, with

$ B_a = L_(K \( a \)) S \, wide U ⊗_a V = L_(K \( a \)) \( U and V \) \, wide I_a = "fib" \( B_a arrow.r E_a \) \,
  wide epsilon.alt_a : I_a arrow.r B_a . $

The tensor unit is $B_a$. These local tensors will be used to describe homotopy classes of the underlying ordinary
  spectra.

#thm([Lemma 5.2.])[
  (The actual Adams filtration).  #emph[The strongly convergent descent spectral sequence
#[#set math.equation(numbering: n => "(6)")
 $ E_2^(s \, q) = H_("cts")^s \( bb(G)_a \; \( E_a \)_q \) arrow.r.double pi_(q - s) B_a $ <wimg:morava-page>]

 has the separated homotopy filtration
#[#set math.equation(numbering: n => "(7)")
 $ F^s pi_(*) B_a = "im" #scale(x: 120%, y: 120%)[\(] pi_(*) I_a^(⊗_a s) arrow.r^(\( epsilon.alt_a^(⊗_a s) \)_(*))
   pi_(*) B_a #scale(x: 120%, y: 120%)[\)] \, wide I_a^(⊗_a 0) = B_a . $ <wimg:actual-filtration>]

 Its successive quotients are $E_oo^(s \, *)$ with the usual total degree, and $F^r F^s subset.eq F^(r + s)$.]
] <wimg:descent>

#proof[
  Devinatz–Hopkins give (6) with strong convergence and identify it with the local $E_a$-Adams spectral sequence
    #cite(label("dh2004")) Theorem 1(iii)–(iv); the full extended group is open in itself.
    The coefficient topology is the full maximal-ideal-adic topology of #cite(label("dh2004")) Remark 1.3.
    Their ideal $\( p \, v_1 \, dots.h \, v_(a - 1) \)$ agrees degreewise with
    $frak(m)_a = \( p \, u_1 \, dots.h \, u_(a - 1) \)$, since $v_i = u_i u^(1 - p^i)$ and $u$ is invertible.
  The tensor powers $T_s = I_a^(⊗_a s)$ form resolution triangles
  #[#set math.equation(numbering: n => "(8)")
   $ T_(s + 1) arrow.r T_s arrow.r^(q_s) E_a ⊗_a T_s . $ <wimg:power-triangles>]
  Their right terms are $E_a$-injective, and multiplication on $E_a$ retracts $E_a ⊗_a q_s$.
    Thus they form a relative Adams resolution in the convention just used.
    By Lemma 14, their stage-$s$ images agree with those in the Devinatz–Hopkins resolution at the same index.
    This proves (7). In particular $T_0 = B_a$ and $T_1 = I_a$ give the full group and the kernel of $pi_(*) B_a
    arrow.r pi_(*) E_a$, respectively. Strong convergence supplies separation and the stated associated-graded
    quotients for these actual image groups.
  A map from a suspended sphere to a local object is equivalently a map from the suspended local unit.
    Tensoring two lifts through $I_a^(⊗_a r)$ and $I_a^(⊗_a s)$ therefore gives a lift of their product through
    $I_a^(⊗_a \( r + s \))$. This proves multiplicativity. Monoidal localization carries the sphere unit and its
    products to the local unit, so these are also the products of the actual sphere images.
    Smashing localization is not needed. ◻
]

#thm([Proposition 5.3.])[
  (The zero upper tail).  #emph[Let $a = p$ with $p gt.eq 5$, or $a = p + 1$ with $p gt.eq 7$. Then
#[#set math.equation(numbering: n => "(9)")
 $ F^s pi_(*) B_a = 0 wide \( s gt.eq a^2 + 2 \) . $ <wimg:zero-tail>]

]
] <wimg:upper-filtration>

#proof[
  Proposition 12, with the finite test $V_0 = S$, gives
  #[#set math.equation(numbering: n => "(10)")
   $ H_("cts")^s \( bb(G)_a \; \( E_a \)_q \) = 0 wide \( s > a^2 + 1 \, med q in bb(Z) \) . $ <wimg:coefficient-line>]
  At height $p$ this uses the pure stabilizer dimension and the semilinear Witt trace-one contraction for the
    order-$p$ Galois quotient. At height $p + 1$ the full extended group has no $p$-torsion,
    so its dimension gives the finite-quotient bound. Both cases retain the possible adic inverse-limit
    contribution in degree $a^2 + 1$.
  By Lemma 15, the successive quotients of the actual filtration from $a^2 + 2$ onward are zero.
    That tail is consequently constant, and separatedness makes its common value zero. This proves (9).
    It is a statement about homotopy images; the exponent argument will require a separate proof of map nullity. ◻
]

=== 5.3 Annihilating the detected sphere product <wimg:kernel-assembly>

Put $d = 2 p \( p - 1 \) - 2$ and $k = \( p - 1 \)^2$.

#thm([Proposition 5.4.])[
  (Upper vanishing of the same power).  #emph[For every $x in pi_d S$,
    the unit image of $x^k$ is zero in $pi_(d k) B_p$ when $p gt.eq 5$.
    When $p gt.eq 7$, the image of the same product is also zero in $pi_(d k) B_(p + 1)$.]
] <wimg:upper-power>

#proof[
  Let $a$ be either upper height in its stated range, and let $x_a in pi_d B_a$ be the unit image of $x$.
    Positive stable sphere stems are torsion: suspend into an odd-dimensional sphere in the stable range and apply
    Serre’s finiteness theorem #cite(label("serre1951")) Chapter V, Section 3, Proposition 3.
    Since $\( E_a \)_d$ is torsion-free, $x_a$ maps to zero in $pi_d E_a$ and belongs to $F^1 pi_d B_a$.
  Since $d$ is even and $E_a$ has only even homotopy,
  $ F^1 pi_d B_a \/ F^2 pi_d B_a tilde.equiv E_oo^(1 \, d + 1) = 0 . $
  Thus $x_a in F^2$, and multiplicativity in Lemma 15 gives $x_a^k in F^(2 k) pi_(d k) B_a$.
    The numerical margins above the last possible filtration are
  $ 2 \( p - 1 \)^2 - \( p^2 + 1 \) & = p^2 - 4 p + 1 > 0 &  & \( p gt.eq 5 \) \,\
2 \( p - 1 \)^2 - #scale(x: 120%, y: 120%)[\(] \( p + 1 \)^2 + 1 #scale(x: 120%, y: 120%)[\)] & =
  p \( p - 6 \) > 0 &  & \( p gt.eq 7 \) . $
  Therefore $2 k gt.eq a^2 + 2$, and (9) gives $x_a^k = 0$.
    This is the unit image of the original sphere product $x^k$, by the product identification in Lemma 15. ◻
]

#proof[
  Use the single named product $z_p = beta_1^(\( p - 1 \)^2)$.
    Proposition 9 detects it under the actual unit to the $K \( p - 1 \)$-local spectrum $Y = E_(p - 1)^(h G)$.
    Proposition 17, applied to $x = beta_1$, kills that same product in $B_p$ for $p gt.eq
    5$ and in $B_(p + 1)$ for $p gt.eq 7$.
  Apply Proposition 6 with $t = p - 1$ and $n = p$ or $n = p + 1$, respectively.
    The result is a nonzero image of $z_p$ in $pi_(d k) L_(n - 1)
    X$ killed by the actual canonical map $i_(n \, X)$. Its two naturality squares identify that map after
    completion. A retraction would induce a left inverse on this homotopy group, which is impossible.
  For $p = 5$ the product is $beta_1^16$ in degree $608$, and its upper image lies in $F^32 pi_608 B_5$,
    while the zero tail starts at $F^27$. Taking $n = 5$ gives the named prime-five statement as well. ◻
]

== 6 Finite descent and exponent bounds <sec:towers>

The exponent argument uses two consequences of a finite descent bound.
  First, such a bound forces a horizontal vanishing line on a specified page of the descent spectral sequence.
  Second, an $E_2$ vanishing line, together with some finite descent bound,
  forces a specified fiber map to have zero image after every chosen exact test.
  We prove these statements directly from finite tensor cubes, keeping tested images distinct from null maps.

=== 6.1 Finite tensor cubes <par:tower-setup>

Let $cal(C)$ be a stable symmetric monoidal $oo$-category whose tensor is exact in each variable.
  Let $A$ be an associative unital algebra, with unit $upright(bold(1))$, and put $J =
  "fib" \( upright(bold(1)) arrow.r A \)$ and $epsilon.alt : J arrow.r upright(bold(1))$.
  For $V in cal(C)$ form the augmented Amitsur object

$ V arrow.r C_A^bullet \( V \) \, wide C_A^q \( V \) = A^(⊗ \( q + 1 \)) ⊗ V . $

Cofaces insert the unit and codegeneracies multiply adjacent $A$-factors.
  The partial totalization $"Tot"_s$ is the limit over the full simplex category on $\[ 0 \] \,
  dots.h \, \[ s \]$, including codegeneracies. The cubical comparison is standard descent machinery
  #cite(label("mnn2017")) Proposition 2.14, pp. 1007–1008; its proof fixes the finite-stage indexing and
  functoriality used here.

#thm([Lemma 6.1.])[
  (Full finite tensor cube).  #emph[For $s gt.eq 0$ there is a natural equivalence of arrows over
    $upright("id")_V$ in $cal(C)_(\/ V)$:
$ & ("fib" #scale(x: 120%, y: 120%)[\(] V arrow.r "Tot"_s C_A^bullet \( V \) #scale(x: 120%, y: 120%)[\)] arrow.r V)\
 & wide tilde.eq (J^(⊗ \( s + 1 \)) ⊗ V arrow.r^(epsilon.alt^(⊗ \( s + 1 \)) ⊗ upright("id")_V) V) . $

 The transition on the fibers from stage $s + 1$ to stage $s$ applies $epsilon.alt$ to the final $J$-factor.
   Any exact functor $Phi : cal(C) arrow.r upright("Sp")$ preserves this finite fiber sequence.]
] <lem:cube>

#proof[
  Let $cal(P)_(eq.not diameter) \( \[ s \] \)$ be the poset of nonempty subsets of ${ 0 \, dots.h \, s }$. The functor
  $ theta_s : cal(P)_(eq.not diameter) \( \[ s \] \) arrow.r Delta_(lt.eq s) \, wide S mapsto \[ \| S \| - 1 \] $
  uses the order-preserving injection induced by each inclusion of subsets.
    At $\[ l \]$, with $l lt.eq s$, the comma category $theta_s \/ \[ l \]$ consists of nonempty subsets equipped
    with a weakly increasing map to $\[ l \]$. It is the poset of nonempty faces of the simplicial complex
    $P \( s \, l \)$ whose simplices are lists
  $ \( i_0 \, j_0 \) \, dots.h \, \( i_b \, j_b \) \, quad 0 lt.eq i_0 < dots.h.c < i_b lt.eq s \, quad 0 lt.eq
    j_0 lt.eq dots.h.c lt.eq j_b lt.eq l . $
  This complex is contractible. The base case $P \( 0 \, 0 \)$ is a point.
    Every simplex either omits the first-coordinate value $s$ or contains exactly one vertex $\( s \, j \)$.
    Begin inductively with the cone of vertex $\( s \, l \)$ on $P \( s - 1 \, l \)$.
    This cone is contractible even when $l = s$, when its base is not covered by induction.
    For each $j < l$, attach the cone of vertex $\( s \, j \)$ along its base $P \( s - 1 \, j \)$.
    This is its exact intersection with the previous complex and is contractible by induction, since $j lt.eq s -
    1$. The intersections are simplicial subcomplexes, so each attachment preserves contractibility.
    The functor is therefore homotopy initial.
  The partial totalization is consequently the limit of the punctured $\( s + 1 \)$-cube obtained by tensoring
    copies of $upright(bold(1)) arrow.r A$ and then tensoring with $V$. Its omitted vertex is $V$.
    Taking successive fibers and using exactness of tensor gives $J^(⊗ \( s + 1 \)) ⊗ V$,
    with its canonical arrow to $V$. Removing the last direction of the cube gives the stated transition.
    This is a genuinely finite cubical limit, so any exact $Phi$ preserves it.
    Finiteness of the list of objects in $Delta_(lt.eq s)$ alone would not justify that assertion. ◻
]

Fix an exact functor $Phi : cal(C) arrow.r upright("Sp")$.
  Put $V' = Phi V$, $U_l = Phi \( J^(⊗ l) ⊗ V \)$, and $P_s = "Tot"_s \( Phi C_A^bullet \( V \) \)$ for $s gt.eq
  0$; set $P_s = 0$ for $s < 0$. Thus $U_0 = V'$ and

#[#set math.equation(numbering: n => "(11)")
 $ U_(s + 1) arrow.r V' arrow.r P_s $ <eq:finite-fiber>]

is a compatible family of fiber sequences. Define its augmentation filtration by

#[#set math.equation(numbering: n => "(12)")
 $ F^s pi_d V' = ker \( pi_d V' arrow.r pi_d P_(s - 1) \) = "im" \( pi_d U_s arrow.r pi_d V' \) \, wide s gt.eq
   0 . $ <eq:augmentation-filtration>]

These groups are defined from finite stages. The argument below will use them without identifying $V'$ with an
  infinite totalization. Our spectral sequence convention is

$ E_2^(s \, q) = H^s pi_q \( Phi C_A^bullet \( V \) \) \, wide d_r : \( s \, q \) mapsto \( s + r \, q + r - 1 \) . $

The full tower has normalized cosimplicial cochains on $E_1$, giving the displayed $E_2$ page.

=== 6.2 Exponents and exact finite-page bounds <sec:exponent-pages>

For $b gt.eq 1$ say that $V$ has $A$-exponent at most $b$ if the actual map

$ e_b \( V \) = epsilon.alt^(⊗ b) ⊗ upright("id")_V : J^(⊗ b) ⊗ V arrow.r V $

is null. This is stronger than vanishing on homotopy groups after a test.

#thm([Lemma 6.2.])[
  (Exponent calculus).  #emph[An $A$-module has exponent at most one.
    Bounds are preserved by retracts and by tensoring with arbitrary objects.
    For a cofiber sequence $U arrow.r V arrow.r W$, bounds $b$ and $c$ on $U$ and $W$ give bound $b + c$ on $V$.
    If $e_m \( V \)$ is null, $V$ is a retract of an object with $m$ successive layers $A ⊗ J^(⊗ i) ⊗ V$, $0 lt.eq
    i < m$.]
] <lem:exponent-calculus>

#proof[
  The unit map of a module splits by its action, making its fiber map null.
    Naturality gives retract invariance, and tensoring a null map gives tensor invariance.
    In the cofiber sequence, the composite $J^(⊗ c) ⊗ V arrow.r V arrow.r W$ is null, so choose a lift $ell :
    J^(⊗ c) ⊗ V arrow.r U$. After precomposition by $b$ more $epsilon.alt$ factors,
    naturality identifies the resulting map into $U$ with $e_b \( U \) \( 1 ⊗ ell \)$, which is null.
    Its composite to $V$ is $e_(b + c) \( V \)$. Finally the consecutive maps $J^(⊗ \( i + 1 \)) ⊗ V arrow.r
    J^(⊗ i) ⊗ V$ have the stated cofibers. Their composites to $V$ filter $"cofib" \( e_m \( V \) \)$ by these $m$
    layers. Nullity of $e_m \( V \)$ makes $V$ a retract of that cofiber. ◻
]

These bounds describe the thick tensor ideal generated by $A$; compare #cite(label("mathew2016")) Definition 3.18.
  We now fix the page convention for the quantitative use of nilpotence #cite(label("mnn2017")) #cite(label("mnn2019")).

#thm([Proposition 6.3.])[
  (Pages and tested images).  #emph[For any exact $Phi : cal(C) arrow.r upright("Sp")$ and integer $b gt.eq 1$:]
  + #emph[If $V$ has $A$-exponent at most $b$, then $E_(b + 1)^(s \, q) = 0$ for all $s gt.eq b$ and $q$.]
  + #emph[If $V$ has some finite $A$-exponent and $E_2^(s \, q) = 0$ for all $s gt.eq b$ and $q$,
    then $pi_d Phi \( e_b \( V \) \) = 0$ for every $d$.]
  #emph[The second assertion is zero tested image, not nullity of a map.]
] <prop:pages>

#proof[
  In coordinates $\( s \, d \)$ with $d = q - s$, the derived couple has
  $ D_r^(s \, d) = "im" \( pi_d P_(s + r - 1) arrow.r pi_d P_s \) $
  and maps
  $ i : D_r^(s \, d) arrow.r D_r^(s - 1 \, d) \, wide j : D_r^(s \, d) arrow.r E_r^(s + r \, d - 1) \, wide k :
    E_r^(s \, d) arrow.r D_r^(s \, d) . $
  Here the second $E$-index denotes total degree; no convergence claim is used.
    Let $c$ be an actual exponent bound. Every length-$c$ transition in the fiber tower $U_l$ is null,
    being $Phi$ applied to a tensor multiple of $e_c \( V \)$. For $s gt.eq 0$ the boundary square from (11) is
  $ pi_d P_(s + c) & arrow.r & pi_(d - 1) U_(s + c + 1)\
arrow.b &  & arrow.b thin 0\
pi_d P_s & arrow.r & pi_(d - 1) U_(s + 1) . $
  The image from $P_(s + c)$ has zero boundary and lifts to $pi_d V'$;
    conversely an augmentation class comes from $P_(s + c)$. Hence
  #[#set math.equation(numbering: n => "(13)")
   $ D_(c + 1)^(s \, d) = "im" \( pi_d V' arrow.r pi_d P_s \) . $ <eq:stable-derived-image>]
  Both sides are zero for negative $s$. These image groups have surjective transition $i$.
    The augmentation into $P_s$ is injective on homotopy for $s gt.eq c - 1$,
    since its kernel is the image of a map factoring through $e_c \( V \)$.
    Thus $i$ is an isomorphism for $s gt.eq c$. Exactness of the derived couple gives $j = 0$ and, for $s gt.eq
    0$, identifies
  $ E_(c + 1)^(s \, d) tilde.equiv ker \( D_(c + 1)^(s \, d) arrow.r D_(c + 1)^(s - 1 \, d) \) tilde.equiv F^s
    pi_d V' \/ F^(s + 1) pi_d V' . $
  In particular this is zero for $s gt.eq c$. Taking $c = b$ proves (i). For (ii) retain any $c$.
    The $E_2$ line makes these same quotients zero for $s gt.eq b$.
    Since $F^c = 0$, descending from $c$, or monotonicity when $c < b$, gives $F^b = 0$.
    Equation (12) is exactly the asserted zero image. This argument uses only finite cubes and never assumes that
    $Phi$ preserves an infinite limit. ◻
]

== 7 A finite-page lower exponent bound <sec:exponent-proof>

Fix a prime $p gt.eq 5$ and put $t = p - 1$, $h = p$, and $m = p^2 + 2$.
  The lower exponent inequality in Theorem 4 will follow from a class in filtration greater than $m$ on page
  $E_(m + 1)$. Proposition 20(i) excludes such a class whenever the exponent is at most $m$.
  This argument uses the pure stabilizer subgroup and its residue field,
  which we specify independently of the extended group used for the sphere kernel.

#thm([Theorem 7.1.])[
  (Pure-stabilizer cohomology).  #emph[For every odd prime $p$, put $t = p -
    1$ and let $E_t$ be Morava $E$-theory for the height-$t$ Honda formal group over $k_t = bb(F)_(p^t)$,
    with its coherent stabilizer action. The pure stabilizer $bb(S)_t$ contains a finite subgroup $H tilde.equiv
    C_p times.r C_(t^2)$ for which
#[#set math.equation(numbering: n => "(14)")
 $ hat(H)^(*) \( H \; \( E_t \)_(*) \) =
   k_t \[ alpha \, beta^(plus.minus 1) \, Delta^(plus.minus 1) \] \/ \( alpha^2 \) \,\
\| alpha \| = \( 1 \, 2 t \) \, wide \| beta \| = \( 2 \, 2 p t \) \,
  wide \| Delta \| = \( 0 \, 2 p t^2 \) . $ <eq:lower-algebra>]

 The ordinary-to-Tate comparison is multiplicative and identifies $H^s \( H \; \( E_t \)_q \)$ with the displayed
   Tate group for every $s > 0$ and $q$.]
] <thm:lower-hm>

The coherent action specializes to the prescribed Honda stabilizer action #cite(label("dh2004")) Theorem 1(ii) and
  Remark 2.4. This is the subgroup denoted $F$ in #cite(label("bbs2020")) Equation (1.2) and Theorem 4.5,
  where the height is called $n$. The positive-filtration comparison is #cite(label("bbs2020")) Remark 2.2;
  the pure-group calculation before taking Galois invariants also appears in #cite(label("heard2015")) proof of
  Proposition 5.5. We use the cohomology and its bidegrees here.
  No differential from the Tate spectral sequence is needed for the argument below.

Work in $cal(D)_H = "Fun" \( B H \, upright("Sp")_(\( p \)) \)$ with pointwise ordinary smash, and put $A_H =
  F \( H_(+) \, S \)$ with its translation action. For the exact functor $\( - \)^(h H)$,
  the $A_H$-Amitsur spectral sequence is the ordinary homotopy fixed point spectral sequence:
  its terms are functions on the free $H$-sets $H^(q + 1)$,
  and taking fixed points gives homogeneous group cochains.
  Lemma 8 supplies its cup product and derivation rule without requiring convergence.
  We will apply the finite-page exponent criterion to this tower.

#thm([Proposition 7.2.])[
  #emph[The $H$-exponent of $E_t$ is greater than $m$.]
] <prop:lower-exponent>

#proof[
  We have $m < 2 t^2 + 1$, since the difference is $p^2 - 4 p + 1 > 0$.
    Choose a positive $N$ divisible by $p$ with $2 N > m$. We show that $beta^N eq.not
    0$ on $E_(m + 1)$ in bidegree $\( 2 N \, 2 p t N \)$. For $2 lt.eq r lt.eq
    m$ all possible source and target filtrations are positive, so (14) applies.
    Even $r$ gives odd internal degree and a zero group. For odd $r$, internal-degree divisibility forces $r =
    2 t a + 1$ with $1 lt.eq a < t$.
  An outgoing target must be $alpha beta^(N + t a) Delta^l$.
    Equality of internal degrees gives $a - 1 = p t \( a + l \)$, which forces $a = 1$.
    An incoming source must be $alpha beta^(N - t a - 1) Delta^l$, whose internal-degree equation is $a - t =
    p t \( a - l \)$, impossible for $1 lt.eq a < t$. Thus only the outgoing differential $d_(2 t + 1)$ remains.
    The same degree argument shows that $beta$ exists up to that page;
    its only possible incoming differential has length two and odd internal source degree.
    The derivation rule on that page gives
  $ d_(2 t + 1) \( beta^N \) = N beta^(N - 1) d_(2 t + 1) \( beta \) = 0 \, $
  because $beta$ has even total degree, $p$ divides $N$, and the target is $p$-torsion.
    With all incoming differentials and all other outgoing possibilities excluded through page $m$,
    this class is nonzero on $E_(m + 1)$. Its filtration is $2 N > m$,
    contradicting Proposition 20(i) if the exponent were at most $m$. ◻
]

At $p = 5$, where $m = 27$, one may take $N = 15$: the class has filtration $30$ on $E_28$ and obstructs exponent
  $27$. The proof needs only this finite-page survival; it does not use a sphere representative or the abutment of
  the ordinary spectral sequence.

== 8 Ordinary cooperations and finite tests <sec:cooperations>

The upper exponent bound requires the cohomological line of Section 4 after every finite ordinary test.
  We therefore identify the tested Amitsur coefficient complex, including its actual coface and codegeneracy maps.
  Fix a positive height $a$, and write

$ E = E_a \, wide k_a = bb(F)_(p^a) \, wide O = O_a = W \( k_a \) \[ \[ u_1 \, dots.h \, u_(a - 1) \] \] \,\
O_(*) = \( E_a \)_(*) = O \[ u^(plus.minus 1) \] \, quad \| u \| = - 2 \, wide frak(m) =
  frak(m)_a = \( p \, u_1 \, dots.h \, u_(a - 1) \) . $

Use the coherent action of $bb(G)_a = bb(S)_a times.r "Gal" \( k_a \/ bb(F)_p \)$ by commutative ring
  automorphisms, whose special-fiber action is the prescribed Honda stabilizer action #cite(label("gh2004"))
  Section 7, Proposition 7.3, Equation (7.3), and Corollaries 7.6–7.7.
  The local category $cal(C)_a = upright("Sp")_(K \( a \))$ has unit $B_a = L_(K \( a \)) S$ and tensor $U ⊗_a V =
  L_(K \( a \)) \( U and V \)$. All unadorned smash products and function spectra below are ordinary.

#thm([Proposition 8.1.])[
  (The finite-test coefficient complex).  #emph[For $r gt.eq 0$, let
$ Z_r = L_(K \( a \)) \( E^(and \( r + 1 \)) \) . $

 For every finite ordinary $p$-local spectrum $W$, there are natural graded isomorphisms
#[#set math.equation(numbering: n => "(15)")
 $ pi_(*) \( Z_r and W \) tilde.equiv C_("cts") \( bb(G)_a^r \, pi_(*) \( E and W \) \) . $ <wup:tested-functions>]

 The first $E$-factor acts by constant coefficients. The two-factor evaluation is multiplication after $1 and g$.
   In the cumulative coordinates $1 \, g_1 \, g_1 g_2 \, dots.h \, g_1 dots.h.c g_r$ on the factors,
   these isomorphisms identify every coface and codegeneracy of the unit Amitsur object with the continuous
   inhomogeneous group-cochain operator.]
  #emph[Consequently, apply the exact ordinary functor $F \( V_0 \, - \)$,
    for a finite ordinary $p$-local spectrum $V_0$, to the full unit Amitsur tower for $E_a$ in $cal(C)_a$.
    In the page convention of Proposition 20, its second page is
#[#set math.equation(numbering: n => "(16)")
 $ E_2^(s \, q) = H_("cts")^s #scale(x: 120%, y: 120%)[\(] bb(G)_a \,
   pi_q \( E_a and D V_0 \) #scale(x: 120%, y: 120%)[\)] \, wide D V_0 = F \( V_0 \, S \) . $ <wup:cochain-page>]

 Here $H_("cts")^s$ means the cohomology of continuous cochains with the adic topology on the indicated
   coefficient module.]
] <wup:cochains>

We prove the comparison by first forming ordinary cooperations, then completing their flat coefficient modules,
  and finally applying the finite test. The next three lemmas justify these steps.
  Mixed cooperations and their completion will also be used in Section 10.
  The exact-homology input originates in Landweber’s work #cite(label("landweber1976"));
  we use the precise cooperation formulations cited below, with $B P$ the $p$-local Brown–Peterson spectrum.

#thm([Lemma 8.2.])[
  (Ordinary mixed cooperations).  #emph[For positive heights $a \, b$, the ordinary smash product has even homotopy
$ pi_(*) \( E_a and E_b \) tilde.equiv \( E_a \)_(*) ⊗_(B P_(*)) B P_(*) B P ⊗_(B P_(*)) \( E_b \)_(*) . $

 It is flat over $\( E_a \)_(*)$ through the first factor.]
] <wup:mixed-flat>

#proof[
  Apply the ordinary Landweber cooperation calculation to the $p$-typical flat Hopf algebroid
    $\( B P_(*) \, B P_(*) B P \)$. This gives the displayed $B P_(*)$ formula.
    It is the $p$-typical form of the $M U_(*)$ formulas displayed in #cite(label("rezk1998")) Section 15,
    Proposition 15.1 and Corollary 15.4 and #cite(label("hovey2004")) Lemma 4.4;
    Morava $E$-theory over $B P$ is included in #cite(label("hs-comodules2003")) Example 0.1(d).
    The two tensor products use the two different unit maps into $B P_(*) B P$.
    For a Landweber-exact $B P_(*)$-algebra $C$, the module $B P_(*) B P ⊗_(B P_(*)) C$ is flat over the other $B
    P_(*)$-action. Indeed, tensoring with it factors as the exact cofree-comodule functor followed by the exact
    Landweber functor on comodules. This is also the opposite-unit criterion of #cite(label("hs-comodules2003"))
    Lemma 2.2, with conjugation exchanging the units when necessary.
    Base change along $B P_(*) arrow.r \( E_a \)_(*)$ proves the asserted flatness.
    The displayed coefficient and cooperation rings are even graded, which proves evenness.
    In particular this argument does not require $\( E_b \)_(*)$ to be flat over $B P_(*)$. ◻
]

The ring $O$ is complete, Noetherian, regular, and local, with finite residue field.
  If $W$ is a finite ordinary $p$-local spectrum, then

$ M_(*) = pi_(*) \( E and W \) $

is finitely generated over $O_(*)$. This follows by finite cofiber constructions and retracts from the assertion
  for the sphere. Periodicity identifies graded module questions with the two parities over $O$.
  Regularity therefore supplies a finite resolution #cite(label("stacks")) Tag 00O7 of $M_(*)$ by finite graded
  free $O_(*)$-modules. Neither parity of $M_(*)$ is required to vanish.

#thm([Lemma 8.3.])[
  (Base change and continuous functions).  #emph[Let $D_0$ be an ordinary right $E$-module for which $pi_(*)
    D_0 ⊗_(O_(*)) \( - \)$ is exact on finitely generated graded $O_(*)$-modules. The natural comparison
#[#set math.equation(numbering: n => "(17)")
 $ pi_(*) D_0 ⊗_(O_(*)) pi_(*) \( E and W \) arrow.r pi_(*) \( D_0 and W \) $ <wup:relative-base-change>]

 is an isomorphism for every ordinary $p$-local spectrum $W$.]
  #emph[For every profinite set $T$, the functor $C_("cts") \( T \, - \)$ is exact on finitely generated
    $O$-modules with their $frak(m)$-adic topologies. For every finitely generated graded $O_(*)$-module $M_(*)$,
    the natural map is an isomorphism
#[#set math.equation(numbering: n => "(18)")
 $ C_("cts") \( T \, O_(*) \) ⊗_(O_(*)) M_(*) arrow.r^(med tilde.equiv med) C_("cts") \( T \, M_(*) \) .
   $ <wup:function-tensor>]

 The functions and the displayed graded isomorphism are understood degreewise.]
] <wup:base-change>

#proof[
  First suppose $W$ finite. The equality
  $ D_0 and W tilde.eq D_0 and_E \( E and W \) $
  is an equality of ordinary derived constructions. The comparison is the balanced homotopy cross product for this
    relative smash, so it is natural in both variables before choosing any resolution.
    Realize a finite graded free surjection onto $pi_(*) \( E and W \)$ by an $E$-module map from a finite wedge
    of suspensions of $E$. Surjectivity makes the homotopy of its fiber the first syzygy.
    Repeat along a finite free resolution. At the last stage,
    lifts of a free basis give an equivalence from a finite free $E$-module,
    since they give an isomorphism on all homotopy groups. Relative smash with $D_0$ is exact.
    Induction back through these fiber sequences, using the assumed tensor exactness on each finitely generated
    syzygy, proves (17) for finite $W$.
  Every ordinary $p$-local spectrum is a filtered homotopy colimit of finite ordinary $p$-local spectra.
    Both sides of (17) preserve those colimits: ordinary smash and homotopy groups do so,
    as does tensoring a module with $pi_(*) D_0$. Naturality extends the comparison to arbitrary $W$.
  For the assertion about functions, let $M arrow.r N$ be a surjection of finitely generated $O$-modules.
    For every $j gt.eq 1$ the map
  $ M \/ frak(m)^(j + 1) M arrow.r \( M \/ frak(m)^j M \) times_(N \/ frak(m)^j N) \( N \/ frak(m)^(j + 1) N \) $
  is surjective. To see this, lift the first component to $M$;
    its error against the second component lies in $frak(m)^j N$, and this error lifts from $frak(m)^j M$.
    Each quotient is a finite set. Given a continuous map $T arrow.r N$,
    first lift its reduction modulo $frak(m)$, and then use these surjections to lift successively while
    preserving the previous choice. A lift on each finite value set is continuous.
    The compatible system defines a continuous lift to $M$, since finitely generated modules are complete.
    Kernels carry their subspace topologies: the relevant modules are compact Hausdorff,
    and the induced continuous bijection from a kernel to its image is a homeomorphism.
    It follows that $C_("cts") \( T \, - \)$ is exact on these modules.
    Apply this exact functor to a finite presentation of $M$,
    and compare with tensoring the same presentation by $C_("cts") \( T \, O \)$.
    The comparison is an isomorphism on the finite free terms and hence on $M$.
    Applying this argument in each parity proves (18). In particular
    $C_("cts") \( T \, O_(*) \) ⊗_(O_(*)) \( - \)$ has precisely the tensor exactness used in the first assertion. ◻
]

#thm([Lemma 8.4.])[
  (Flat completion and reduction).  #emph[Let $N$ be an ordinary $E$-module with flat graded homotopy $U_(*) =
    pi_(*) N$. Its actual $K \( a \)$-localization map induces
$ U_(*) arrow.r pi_(*) L_(K \( a \)) N tilde.equiv hat(U_(*)) := "proj lim"_j U_(*) \/ frak(m)^j U_(*) . $

 For a flat $O$-module $U$ and every $j gt.eq 1$,
$ hat(U) \/ frak(m)^j hat(U) tilde.equiv U \/ frak(m)^j U . $

 Both assertions apply degreewise to the periodic graded modules above.]
] <wup:completion-reduction>

#proof[
  The first assertion is the localization theorem for ordinary Morava $E$-modules:
    $K \( a \)$-localization is derived $frak(m)$-completion, and flat homotopy has no higher derived completion.
    The natural localization map induces the ordinary completion map #cite(label("rezk2009")) Propositions 3.4,
    3.6 and Corollary 3.8.
  Here is the algebraic reduction argument, including its needed inverse-limit step.
    Choose a resolution $P_bullet arrow.r N_0$ of a finitely generated $O$-module $N_0$ by finite free modules.
    The tower $P_bullet ⊗_O U \/ frak(m)^l U$ is degreewise surjective. By flatness of $U$, its first homology is
  $ "Tor"_1^O \( N_0 \, O \/ frak(m)^l \) ⊗_O U . $
  This homology tower is pro-zero. Indeed, for a finite first presentation $0 arrow.r K arrow.r P_0 arrow.r
    N_0 arrow.r 0$, the corresponding Tor group is $\( K ∩ frak(m)^l P_0 \) \/ frak(m)^l K$.
    Artin–Rees #cite(label("stacks")) Tag 00IN gives a $d$ such that $K ∩ frak(m)^l P_0 subset.eq frak(m)^(l - d)
    K$ for $l gt.eq d$. For any fixed $j$, a transition from $l gt.eq j + d$ to $j$ is therefore zero.
    Tensoring these zero transitions with $U$ preserves this conclusion.
  The homology exact sequence for the countable inverse limit of this degreewise-surjective tower now gives
  $ N_0 ⊗_O hat(U) tilde.equiv "proj lim"_l \( N_0 ⊗_O U \/ frak(m)^l U \) \; $
  the possible $"proj lim"^1$ of the first homology is zero because that tower is pro-zero.
    Finite freeness of the $P_i$ identifies their tensor with $hat(U)$ with their inverse-limit tensor.
    Take $N_0 = O \/ frak(m)^j$; for $l gt.eq j$ the modules on the right are $U \/ frak(m)^j U$.
    This proves the reduction formula. ◻
]

#proof[
  The completed cooperation theorem gives
  #[#set math.equation(numbering: n => "(19)")
   $ pi_(*) L_(K \( a \)) \( E and E \) tilde.equiv C_("cts") \( bb(G)_a \, O_(*) \) . $ <wup:completed-cooperation>]
  At $g$, the map is $mu \( 1 and g \)$; the first factor acts by constant scalars.
    This is the evaluation map of #cite(label("hovey2004")) Section 1 and Theorems 4.11 and 6.8.
    The equivalent convention in #cite(label("dh2004")) Proposition 2.2, Equation (2.3),
    and Equations (2.5)–(2.7) uses $mu \( g^(- 1) and 1 \)$; exchanging the factors and inverting the group
    coordinate gives the convention above. The coefficient topology is the adic one #cite(label("dh2004")) Remark 1.3.
  Put $P_(*) = pi_(*) \( E and E \)$, regarded as an $O_(*)$-module through the first factor.
    Lemma 24 makes $P_(*)$ flat. The actual localization map, the reduction in Lemma 26,
    and (18) applied to $O_(*) \/ frak(m)^j O_(*)$ give
  #[#set math.equation(numbering: n => "(20)")
   $ P_(*) \/ frak(m)^j P_(*) tilde.equiv C_("cts") \( bb(G)_a \, O_(*) \/ frak(m)^j O_(*) \) .
     $ <wup:ordinary-reductions>]
  This isomorphism is induced by the actual ordinary evaluation $E and E arrow.r^(1 and g) E and
    E arrow.r^mu E$ followed by reduction. It is not just an abstract isomorphism of the two reduction modules.
  To form higher powers, use a common first factor in the ordinary relative smash products
  $ \( E_0 and E_1 \) and_(E_0) dots.h.c and_(E_0) \( E_0 and E_r \) tilde.eq E_0 and E_1 and dots.h.c and E_r . $
  Each $E_i$ denotes the same spectrum $E$; the subscripts mark positions.
    Iterating (17), including its extension to arbitrary ordinary $W$,
    identifies the homotopy of this ordinary smash with $P_(*)^(⊗_(O_(*)) r)$.
    The comparison inserts each pair into the first and one other position and multiplies at the common position.
    These modules are flat, since $P_(*)$ is flat.
  In each degree the coefficient ring $O_(*) \/ frak(m)^j O_(*)$ is finite.
    Continuous functions to it are unions of function modules on finite quotient sets of $bb(G)_a$.
    Tensors of the function modules on finite sets are the function modules on their products,
    and every continuous function on $bb(G)_a^r$ to a finite set factors through finite quotients in the
    coordinates. It follows from (20) that the reductions of $P_(*)^(⊗_(O_(*)) r)$ are
    $C_("cts") \( bb(G)_a^r \, O_(*) \/ frak(m)^j O_(*) \)$. Apply Lemma 26 only now,
    to this ordinary $\( r + 1 \)$-fold smash. The result is
  #[#set math.equation(numbering: n => "(21)")
   $ pi_(*) Z_r tilde.equiv C_("cts") \( bb(G)_a^r \, O_(*) \) . $ <wup:power-functions>]
  For $r = 0$ this is the locality of $E$.
  The maps in (21) remain the evaluations on the non-first factors followed by multiplication.
    In fact each ordinary evaluation extends through localization because its target $E$ is local.
    On homotopy its first-factor $O_(*)$-linearity makes it adically continuous.
    Lemma 26 makes the ordinary image dense, and the reductions above show that the extension agrees with the
    displayed continuous function. Thus the construction preserves the evaluation maps as well as the coefficient
    modules.
  For finite $W$, the ordinary $E$-module $Z_r$ satisfies the exactness assumption in Lemma 25, by (21) and (18).
    Those comparisons give (15). This step allows any finitely generated $pi_(*) \( E and W \)$,
    including torsion and both parities; no flatness of that module has been used.
  The terms of the local unit Amitsur object are exactly $Z_r$.
    For finite $V_0$, ordinary duality identifies $F \( V_0 \, Z_r \) tilde.eq Z_r and D V_0$,
    so the previous formula computes each cosimplicial homotopy group.
    Relabel the independent evaluations by their cumulative coordinates
  $ 1 \, quad g_1 \, quad g_1 g_2 \, quad dots.h \, quad g_1 dots.h.c g_r . $
  The cochain identities below can be checked on ordinary evaluations before localization.
    For finite $W$, their target $E and W$ is $K \( a \)$-local,
    since finite dualizable smash preserves local objects. They therefore extend through localization and remain
    identities on the tested coefficients. Insertion of the first unit acts on the coefficient;
    an interior unit combines two consecutive coordinates, and insertion of the last unit drops the last
    coordinate. Explicitly, for a degree-$r$ cochain $c$,
  $ \( delta^0 c \) \( g_1 \, dots.h \, g_(r + 1) \) & = g_1 c \( g_2 \, dots.h \, g_(r + 1) \) \,\
\( delta^i c \) \( g_1 \, dots.h \, g_(r + 1) \) & =
  c \( g_1 \, dots.h \, g_i g_(i + 1) \, dots.h \, g_(r + 1) \) &  & \( 1 lt.eq i lt.eq r \) \,\
\( delta^(r + 1) c \) \( g_1 \, dots.h \, g_(r + 1) \) & = c \( g_1 \, dots.h \, g_r \) . $
  Multiplication of adjacent factors gives each codegeneracy,
    which inserts the identity in the corresponding coordinate.
    These are all the inhomogeneous cochain operators, including the degeneracies of the full cosimplicial object.
    The first unit insertion also displays the orbit function of every coefficient.
    Those functions are continuous, and reduction gives continuous actions on the finite invariant quotients by
    powers of $frak(m)_a$. The $E_2$-page of the tower of finite partial totalizations is cosimplicial cohomology
    of these homotopy groups, which is (16). ◻
]

== 9 From finite tests to an actual null map <sec:upper-nullity>

We now bound the exponent of the upper local unit by proving nullity of a specified tensor-power map.

#thm([Proposition 9.1.])[
  (The upper null map and its finite layers).  #emph[Let $p gt.eq 5$ be prime and put $h = p$.
    In $cal(C)_h$, let $I_h = "fib" \( B_h arrow.r E_h \)$. The actual map
$ e_m \( B_h \) : I_h^(⊗_h m) arrow.r B_h \, wide m = h^2 + 2 = p^2 + 2 \, $

 is null. Thus $exp_(E_h) \( B_h \) lt.eq m$, and $B_h$ is a retract of an object with $m$ successive layers
$ E_h ⊗_h I_h^(⊗_h i) \, wide 0 lt.eq i < m . $

]
] <wup:upper-null>

The coefficient line will make this map zero after every finite ordinary precomposition,
  once some finite exponent is known. The following property of its target then turns that tested vanishing into
  nullity. Its relation to the Brown–Comenetz phantom criterion is #cite(label("christensen-strickland1998"))
  Proposition 4.11.

#thm([Lemma 9.2.])[
  (Ordinary phantoms into a local sphere).  #emph[Let $a gt.eq 1$.
    An ordinary map $f : U arrow.r B_a$ of $p$-local spectra is null if its precomposition with every map from a
    finite ordinary $p$-local spectrum to $U$ is null.]
] <wup:phantom>

#proof[
  Let $M_a S = "fib" \( L_a S arrow.r L_(a - 1) S \)$, and let $I_(upright("BC"))$ be the ordinary Brown–Comenetz
    dualizing spectrum for the injective group $bb(Q) \/ bb(Z)_(\( p \))$.
    Gross–Hopkins duality, announced in #cite(label("gross-hopkins1994")) Theorem 6 and proved in the form used
    here in #cite(label("hs1999")) Theorem 10.2(b),(e), says that
  $ D_a = F \( M_a S \, I_(upright("BC")) \) $
  is $K \( a \)$-local and invertible for $⊗_a$. The identification with this monochromatic object uses
    #cite(label("hs1999")) Theorem 6.19.
  For a local target $Z$, the ordinary spectrum $F \( R \, Z \)$ is local.
    A map into it from a $K \( a \)$-acyclic spectrum $V$ corresponds to a map $V and R arrow.r Z$, and $V and
    R$ is still acyclic. Hence ordinary function spectra compute the local internal Hom,
    as in #cite(label("hs1999")) Theorem 7.1. Invertibility of $D_a$, followed by ordinary closed adjunction,
    gives equivalences of ordinary spectra
  $ B_a tilde.eq F \( D_a \, D_a \) tilde.eq F \( D_a and M_a S \, I_(upright("BC")) \) . $
  The displayed smash is ordinary. Put $C = D_a and M_a S$. Brown–Comenetz representability now gives, naturally in $U$,
  $ \[ U \, B_a \] tilde.equiv "Hom"_(bb(Z)) #scale(x: 120%, y: 120%)[\(] pi_0 \( U and C \) \,
    bb(Q) \/ bb(Z)_(\( p \)) #scale(x: 120%, y: 120%)[\)] . $
  Write $U$ as a filtered homotopy colimit of finite ordinary $p$-local spectra $U_i$.
    Ordinary smash with $C$ and ordinary homotopy groups preserve this colimit, so
  $ pi_0 \( U and C \) = "inj lim"_i pi_0 \( U_i and C \) . $
  The functional corresponding to $f$ vanishes on every term by the assumed finite precompositions.
    It therefore vanishes on the colimit, and $f = 0$. This argument tests by ordinary finite spectra and uses no
    interchange of $K \( a \)$-localization with this filtered colimit. ◻
]

#proof[
  First obtain some finite exponent for the actual local unit, independently of any finite test.
    Devinatz–Hopkins prove that every $K \( h \)$-local spectrum belongs to the thick tensor ideal generated by
    $E_h$ in $cal(C)_h$ #cite(label("dh2004")) Appendix A, Proposition A.3.
    This is the local nilpotence consequence of Hopkins–Ravenel;
    its descendability form is #cite(label("mathew2016")) Proposition 10.10.
    The objects of finite $E_h$-exponent form a thick tensor ideal containing $E_h$:
    modules have exponent at most one, tensoring preserves a bound,
    and cofiber sequences and retracts preserve finite bounds by Lemma 19.
    It follows that $B_h$ has some finite exponent $c$. This is one bound on an actual map before any test is
    chosen; the nilpotence theorem supplies no numerical value needed here.
  Apply the full local-unit Amitsur construction in $cal(C)_h$ to $B_h$,
    and then the exact ordinary functor $F \( V_0 \, - \)$ for a finite ordinary $V_0$.
    Proposition 23 identifies its second page with
  $ H_("cts")^s #scale(x: 120%, y: 120%)[\(] bb(G)_h \, pi_q \( E_h and D V_0 \) #scale(x: 120%, y: 120%)[\)] . $
  Proposition 12 makes this page zero for $s gt.eq h^2 + 2 = m$.
    The tested-image assertion of Proposition 20(ii) applies using the already known finite exponent $c$.
    It concerns the full finite partial totalizations and their finite fiber cubes, and gives
  $ \[ V_0 \, I_h^(⊗_h m) \] arrow.r \[ V_0 \, B_h \] quad upright("zero for every finite ordinary ") V_0 . $
  Thus the actual arrow $e_m \( B_h \)$, regarded in ordinary spectra,
    vanishes after every finite ordinary precomposition. Lemma 28 makes it null as an ordinary map and hence null
    in the full subcategory $cal(C)_h$.
  For clarity, all layers needed next occur at finite stages. Set $I_h^(⊗_h 0) = B_h$, and for $0 lt.eq j lt.eq m$ put
  $ F_j = "cofib" #scale(x: 120%, y: 120%)[\(] I_h^(⊗_h m) arrow.r
    I_h^(⊗_h \( m - j \)) #scale(x: 120%, y: 120%)[\)] . $
  The consecutive maps form a finite filtration $0 = F_0 arrow.r F_1 arrow.r dots.h.c arrow.r F_m$.
    The cofiber of $I_h^(⊗_h \( i + 1 \)) arrow.r I_h^(⊗_h i)$ is $E_h ⊗_h I_h^(⊗_h i)$.
    The cofiber comparison for consecutive composites therefore identifies
  $ "cofib" \( F_j arrow.r F_(j + 1) \) tilde.eq E_h ⊗_h I_h^(⊗_h \( m - j - 1 \)) quad \( 0 lt.eq j < m \) . $
  Finally $F_m = "cofib" \( e_m \( B_h \) \)$. A nullhomotopy of $e_m \( B_h \)$ makes $B_h$ a retract of this
    cofiber. This proves both assertions. ◻
]

== 10 Field-valued points and coherent trace <sec:coherent-trace>

Continue with $p gt.eq 5$, $t = p - 1$, $h = p$, and the pure subgroup $H$ of Theorem 21.
  To transport the finite upper layers, we need exponent one for modules over the mixed algebra

$ D = E_t and E_h \, wide D' = L_(K \( t \)) D . $

Here $H$ acts on the first factor. Section 11 will make each transformed layer a $D'$-module in $cal(D)_H$.
  The $K \( t \)$-acyclic spectra form a smash ideal. Monoidal localization of $D$ into $cal(C)_t$,
  followed by the lax monoidal inclusion into ordinary spectra, therefore gives $D' =
  L_(K \( t \)) D$ a commutative algebra structure in $cal(D)_H$.
  Its localization map is equivariant and is a map of these commutative algebras.

#thm([Proposition 10.1.])[
  (The completed mixed trace).  #emph[The mixed $H$-algebra $D'$ has an underlying degree-zero class whose
    $H$-trace is a unit. Every $D'$-module in $cal(D)_H$ therefore has $H$-exponent at most one.]
] <wup:completed-trace>

A trace unit gives the required coherent retraction by induction and coinduction. We first prove that implication.
  We then construct the trace unit from the two formal-group isomorphisms supplied by the factors of $D$:
  the fixed $E_h$ factor forces $H$ to act freely on field-valued points of

$ R = pi_0 D \/ frak(m)_t pi_0 D . $

The ideal is $H$-stable. The mixed cooperation calculation of Lemma 24 makes $D$ even periodic,
  with an orientation and periodic unit from $E_t$.

#thm([Lemma 10.2.])[
  (Coherent trace splitting).  #emph[Let $D'$ be a commutative algebra in $cal(D)_H$.
    Suppose an underlying class $z in pi_0 D'$ has unit trace
$ v = sum_(g in H) g \( z \) in \( pi_0 D' \)^times . $

 Then every $D'$-module $U$ in $cal(D)_H$ has $exp_H \( U \) lt.eq 1$.]
] <wup:trace-split>

#proof[
  Since $H$ is finite, the underlying object $A_H and U$ is $F \( H_(+) \, U \)$, with diagonal action.
    Untwisting the value at $g$ by the action of $g^(- 1)$ on $U$ identifies it with the coinduction of the
    underlying spectrum:
  $ theta : A_H and U arrow.r^(med tilde.eq med) "Coind"_1^H \( "Res"_1^H U \) . $
  Indeed, on functions the diagonal action is $\( h f \) \( g \) = h f \( h^(- 1) g \)$,
    and $\( theta f \) \( g \) = g^(- 1) f \( g \)$ turns it into translation
    $\( h theta f \) \( g \) = \( theta f \) \( h^(- 1) g \)$.
    For finite $H$, the finite coproduct-product equivalence in spectra identifies induction with coinduction.
    Induction adjunction takes the underlying multiplication map $mu_z : U arrow.r U$ to a map with coherent $H$-action
  $ r_z : A_H and U arrow.r U . $
  Let $j : U arrow.r A_H and U$ be the unit map. Under $theta$, its component at $g$ is $g^(- 1) : U arrow.r U$.
    The induction map has component $g mu_z$ at $g$, so the underlying composite is
  $ r_z j = sum_(g in H) g mu_z g^(- 1) = mu_(sum_g g \( z \)) = mu_v . $
  The middle equality uses the compatibility of the $D'$-module structure with the $H$-action.
    Since $v$ is a unit, this is an equivalence of underlying spectra.
    Equivalences of $H$-diagrams are detected on underlying objects, so $r_z j$ is an equivalence in $cal(D)_H$.
    Hence $\( r_z j \)^(- 1) r_z$ retracts $j$ there. Its fiber map is null, which is exponent at most one.
    The class $z$ was only an underlying class; no homotopy-fixed lift of it is needed. ◻
]

#thm([Lemma 10.3.])[
  (Freeness on field-valued points).  #emph[For every unital ring map $x : R arrow.r Omega$ to a field,
    the equality $x compose g = x$ for $g in H$ implies $g = 1$.]
] <wup:field-points>

#proof[
  We first recall explicitly the naturality of the formal group used here.
    For a complex-oriented even periodic commutative ring spectrum $B$,
    an orientation and a periodic unit give a coordinate in degree zero.
    The finite projective-space calculation and its surjective restriction tower give
  $ B^0 \( bb(C P)^oo \) = \( pi_0 B \) \[ \[ z_B \] \] . $
  Products of projective spaces give the corresponding group law.
    A unital ring-spectrum map $f : B arrow.r C$ carries an orientation to an orientation and a periodic unit to a
    unit. Its coordinate therefore has an invertible linear coefficient in the chosen coordinate of $C$.
    The inverse of this coordinate substitution gives an isomorphism from the base change of the formal group of
    $B$ to the formal group of $C$. The product calculation gives compatibility with group laws,
    and this construction respects composites of ring-spectrum maps.
    All later base changes are base changes of these algebraic formal groups along maps of coefficient rings.
  Let $rho : pi_0 D arrow.r Omega$ be the composite through $x$.
    Write $iota_t : E_t arrow.r D$ and $iota_h : E_h arrow.r D$ for the two factor maps, and let $rho_t \,
    rho_h$ be their coefficient composites with $rho$. The map $rho_t$ factors through
  $ O_t \/ frak(m)_t = k_t arrow.r Omega . $
  The last map is injective, since it is a unital map from a field.
    After base change along $rho_t \, rho_h \, rho$, the factor maps give formal-group isomorphisms
  $ phi.alt_t : cal(F)_(t \, Omega) arrow.r^(med tilde.equiv med) cal(F)_(D \, Omega) \, wide phi.alt_h :
    cal(F)_(h \, Omega) arrow.r^(med tilde.equiv med) cal(F)_(D \, Omega) . $
  Let $g_D$ denote the action of $g$ on $D$. The equality $x compose g = x$ implies $rho compose pi_0 \( g_D \) =
    rho$, so naturality makes $g_D$ an automorphism $u_g$ of the single formal group $cal(F)_(D \, Omega)$.
    Since $g_D iota_h = iota_h$, naturality with the second factor gives $u_g phi.alt_h = phi.alt_h$.
    Thus $u_g$ is the identity. But $g_D iota_t = iota_t g$; naturality with the first factor gives
  $ u_g phi.alt_t = phi.alt_t thin g_Omega \, $
  where $g_Omega$ is the specialization of the prescribed stabilizer automorphism.
    Consequently $g_Omega$ is the identity.
  On the special fiber the pure stabilizer element $g$ is its specified automorphism of the Honda formal group
    over $k_t$. This is the special-fiber content of Lubin–Tate deformation #cite(label("lubin-tate1966"))
    Proposition 3.3 and paragraph 3.4, with its coherent realization as above.
    If $g eq.not 1$, some coefficient of the power series $g \( X \) - X$ is nonzero in $k_t$.
    It remains nonzero under the injective map $k_t arrow.r Omega$, contrary to $g_Omega = 1$. Therefore $g = 1$.
  This proof used only the coefficient map to $Omega$ for algebraic base change;
    it did not require a ring-spectrum map to a spectrum with coefficient field $Omega$.
    The assertion concerns equality of actual field-valued maps;
    invariance of their kernels alone would not give the conclusion needed next. ◻
]

#thm([Lemma 10.4.])[
  (Algebraic trace one).  #emph[Let a finite group $H$ act on a commutative ring $R$.
    Suppose that for every unital field-valued map $x : R arrow.r Omega$, $x compose g = x$ implies $g = 1$. Then
$ 1 in "im" #scale(x: 120%, y: 120%)[\(] "Tr" : R arrow.r R^H #scale(x: 120%, y: 120%)[\)] \, wide "Tr" \( r \) =
  sum_(g in H) g \( r \) . $

]
] <wup:algebraic-trace>

#proof[
  The trace image is an ideal of $R^H$, since trace is additive and $a "Tr" \( r \) =
    "Tr" \( a r \)$ for $a in R^H$. Suppose this ideal is proper,
    and choose a maximal ideal $frak(q)$ containing it. For every $r in R$,
    the monic orbit polynomial $product_(g in H) \( X - g \( r \) \)$ has coefficients in $R^H$.
    Thus $R$ is integral over $R^H$. Lying over gives a prime $frak(p)$ of $R$ above $frak(q)$.
    The quotient and inclusion into its fraction field give a unital map $x : R arrow.r Omega =
    "Frac" \( R \/ frak(p) \)$ killing $frak(q)$.
  The multiplicative unital maps $chi_g : R arrow.r Omega$, $chi_g \( r \) = x \( g \( r \) \)$,
    are pairwise distinct by the hypothesis. Such distinct maps are linearly independent as functions.
    To prove this, suppose $sum_(i = 1)^v a_i chi_i = 0$ is a nonzero relation with the least possible number of
    nonzero coefficients. One term is impossible by evaluation at $1$.
    If $v > 1$, choose an element $b in R$ distinguishing $chi_1$ from $chi_v$.
    Subtract $chi_v \( b \)$ times the relation at $r$ from the relation at $b r$. The result is
  $ sum_(i < v) a_i #scale(x: 120%, y: 120%)[\(] chi_i \( b \) -
    chi_v \( b \) #scale(x: 120%, y: 120%)[\)] chi_i \( r \) = 0 . $
  Its coefficient at $i = 1$ is nonzero in the field, giving a shorter nonzero relation, a contradiction.
  In particular the function $sum_(g in H) chi_g$ is not zero:
    each of its coefficients is $1$ in the field, even if the characteristic divides $\| H \|$.
    On the other hand it equals $x compose "Tr"$, which is zero since $x$ kills the trace ideal.
    This contradiction proves the claim. If $R$ is the zero ring, the conclusion holds directly with $1 = 0$. ◻
]

#proof[
  Lemmas 31 and 32 give $macron(z) in R$ with $"Tr" \( macron(z) \) = 1$.
    Lift it to $z_0 in pi_0 D$, and put $v = sum_g g \( z_0 \)$. Then
  $ v - 1 in frak(m)_t pi_0 D . $
  The mixed module $pi_(*) D$ is flat over $\( E_t \)_(*)$ by Lemma 24.
    Lemma 26 therefore identifies the homotopy of its actual localization $D arrow.r
    D'$ with the ordinary $frak(m)_t$-adic completion of $pi_(*) D$.
  At the finite adic stage $pi_0 D \/ frak(m)_t^j pi_0 D$, the element
  $ w_j = sum_(k = 0)^(j - 1) \( 1 - v \)^k $
  satisfies $v w_j = 1 - \( 1 - v \)^j = 1$. These inverses are compatible under reduction.
    Here $j$ is a finite truncation level; the quotient rings themselves are not required to be finite sets.
    The comparison with completion is induced by the actual ring map $D arrow.r D'$.
    Multiplication by the image of $v$ is $O_t$-linear and adically continuous and agrees with multiplication by
    $v$ on the dense ordinary image. It hence agrees with the levelwise multiplication on the completion.
    The compatible $w_j$ give an inverse to the image of $v$ in $pi_0 D'$.
  Localization is equivariant, so that image of $v$ is the $H$-trace of the image of $z_0$. Lemma 30 now applies.
    If the completed ring is zero, its unit is zero and every unital module is contractible,
    giving the same conclusion. ◻
]

== 11 Transport of the finite layers and the canonical unit <sec:exponent-transport>

The upper null map supplies a retract built from $m$ local $E_h$-module layers.
  We now transport those individual layers by the exact functor on ordinary $p$-local spectra

$ T : upright("Sp")_(\( p \)) arrow.r cal(D)_H \, wide T \( V \) = L_(K \( t \)) \( E_t and V \) \, $

with $H$ acting through the coherent action on $E_t$. Applying $T$ to a local layer means applying it to the
  underlying ordinary spectrum of that object of $cal(C)_h$.
  The mixed trace will make each resulting layer have $H$-exponent at most one.

#thm([Proposition 11.1.])[
  (The cross-height upper exponent).  #emph[Let $p gt.eq 5$ be prime, with $t = p - 1$ and $h = p$. One has
$ exp_H #scale(x: 120%, y: 120%)[\(] T \( B_h \) #scale(x: 120%, y: 120%)[\)] lt.eq m = p^2 + 2 . $

]
] <wup:transfer>

#proof[
  The inclusion $cal(C)_h arrow.r upright("Sp")_(\( p \))$ is exact and lax symmetric monoidal.
    Since $E_h$ is local, the localization unit identifies the included local algebra $E_h$ with its given
    ordinary algebra. Each local layer $E_h ⊗_h I_h^(⊗_h i)$ in Proposition 27 consequently has an ordinary
    $E_h$-module structure. Ordinary smash with $E_t$ makes it a $D = E_t and E_h$-module with compatible $H$-action.
  The $K \( t \)$-acyclic spectra form a smash ideal. Thus the localization into $cal(C)_t$ is symmetric monoidal
    for its localized tensor, and the inclusion back into ordinary spectra is lax symmetric monoidal.
    Applying localization to the algebra and this module gives, after that inclusion,
    a $D'$-module structure on the transformed layer in $cal(D)_H$.
    Proposition 29 gives every such layer $H$-exponent at most one.
  The functor $T$ preserves cofiber sequences and retracts.
    Apply it to the finite filtration and retraction of Proposition 27,
    and add the $m$ layer bounds using Lemma 19. This yields the stated bound.
    The construction used ordinary module structures on the individual layers;
    it required no preservation by $T$ of the $cal(C)_h$ tensor product. ◻
]

#thm([Corollary 11.2.])[
  (The exponent contradiction for the canonical unit).  #emph[Let $p gt.eq 5$ be prime, put $t = p - 1$ and $h =
    p$, and let $X = S_p^and$ be the derived $p$-completed sphere. The canonical map
$ i_(h \, X) = L_t \( eta_X^(\( h \)) \) : L_t X arrow.r L_t L_(K \( h \)) X $

 has no homotopy retraction in ordinary spectra.]
] <wup:contradiction>

#proof[
  The functor $T$ inverts $K \( t \)$-equivalences: the cofiber of such a map is $K \( t \)$-acyclic,
    and remains so after ordinary smash with $E_t$. Every $L_t$-localization unit is a $K \( t \)$-equivalence.
    Lemma 5 says that the actual completion $c : S arrow.r X$ is a $K \( a \)$-equivalence for each positive $a$,
    in particular for $a = t \, h$. Write $lambda_Z : Z arrow.r L_t Z$ for the lower localization unit.
    Consider the square of actual localization and completion maps
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$S$])
  content((2.721, 0), [$B_h$])
  content((0, -0.744), [$L_t X$])
  content((2.721, -0.744), [$L_t L_(K \( h \)) X .$])
  line((0.336, 0), (2.253, 0), mark: (end: ">"))
  content((1.294, 0.2266), [#text(size: 0.73em)[$eta_S^(\( h \))$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.4668, -0.372), [#text(size: 0.73em)[$lambda_X thin c$]])
  line((2.721, -0.2725), (2.721, -0.4715), mark: (end: ">"))
  content((3.862, -0.372), [#text(size: 0.73em)[$lambda_(L_(K \( h \)) X) thin L_(K \( h \)) \( c \)$]])
  line((0.534, -0.744), (1.659, -0.744), mark: (end: ">"))
  content((1.097, -0.5173), [#text(size: 0.73em)[$i_(h \, X)$]])
})
  It commutes by naturality of the two localization units. Both vertical arrows become equivalences under $T$:
    for the left one use the $K \( t \)$-equivalences just stated,
    and for the right one use that $L_(K \( h \)) \( c \)$ is an equivalence followed by a
    $K \( t \)$-equivalence. Moreover $T \( S \) tilde.eq E_t$, with coherent $H$-action,
    since $E_t$ is $K \( t \)$-local.
  A homotopy retraction of $i_(h \, X)$ would therefore, after applying $T$ and these identifications,
    exhibit $E_t$ as a retract of $T \( B_h \)$ in $cal(D)_H$.
    Proposition 33 and preservation of exponent bounds under retracts would give $exp_H \( E_t \) lt.eq m$.
    The finite-page lower result Proposition 22 gives the strict inequality $exp_H \( E_t \) > m$, a contradiction. ◻
]

#proof[
  Proposition 22 gives the strict lower bound and Proposition 33 gives the upper bound, both for $m = p^2 +
    2$ in the single category $cal(D)_H$. The preceding corollary proves that a retraction of the canonical map
    would turn the lower object into an $H$-equivariant retract of the upper object and contradict those bounds.
    This proves every assertion of the theorem. The lower bound uses finite-page survival only;
    the upper bound uses the actual null map and its finite layers. ◻
]

== 12 Ordinary products in homotopy fixed points <sec:ordinary-products>

We prove Lemma 8 by constructing relative products on the ordinary bar tower.
  The construction supplies cup products and differential derivations independently of convergence;
  separated convergence identifies the final product with the product on actual homotopy groups.

#proof[
  Use the homogeneous free bar construction $E Q_bullet$, with $E Q_q = Q^(q + 1)$,
    and let $E Q^(\( s \))$ be its $s$-skeleton. The full totalization tower of the group-action resolution is
  $ V_s = F_Q \( \( E Q^(\( s \)) \)_(+) \, R \) \, wide "holim"_s V_s = F_Q \( E Q_(+) \, R \) = R^(h Q) . $
  Here $F_Q$ denotes the derived spectrum of equivariant maps.
    The skeletal filtration gives the usual homogeneous cochains and hence the displayed $E_2$ page.
  For the prismatic geometry below, compare Basterra–Mandell #cite(label("basterra-mandell2013")) proof of
    Theorem 7.1, pp. 23–26. Their bar diagonal for a (partial) non-unital $E_1$ algebra over a base ring spectrum
    $H$ uses the same half-cut regions and inverse barycentric coordinates.
    Here we construct the equivariant relative maps for $E Q$ and identify the resulting $E_oo$ product with the
    associated-graded product on actual homotopy groups under the lemma’s stated filtration hypothesis.
    For barycentric coordinates $t = \( t_0 \, dots.h \, t_q \) in Delta^q$, set $c_(- 1) = 0$ and $c_i = t_0 +
    dots.h.c + t_i$. Define two barycentric vectors by
  #[#set math.equation(numbering: n => "(22)")
   $ ell_i \( t \) & = 2 #scale(x: 120%, y: 120%)[\(] min \( c_i \, 1 / 2 \) -
     min \( c_(i - 1) \, 1 / 2 \) #scale(x: 120%, y: 120%)[\)] \,\
rho_i \( t \) & = 2 #scale(x: 120%, y: 120%)[\(] max \( c_i \, 1 / 2 \) -
  max \( c_(i - 1) \, 1 / 2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:lower-half-cut>]
  They are nonnegative and each has sum one. Equivalently, their $i$th coordinates are twice the lengths of the
    intersections of $\[ c_(i - 1) \, c_i \]$ with $\[ 0 \, 1 / 2 \]$ and $\[ 1 / 2 \, 1 \]$.
    The formulas are continuous, including when a cumulative sum equals $1 / 2$.
  For an order-preserving map $theta : \[ q \] arrow.r \[ q' \]$, let $\( theta_(*) t \)_j =
    sum_(theta \( i \) = j) t_i$. Each interval belonging to $theta_(*)
    t$ is the union of the consecutive intervals belonging to the corresponding fiber of $theta$;
    an empty fiber gives an interval of length zero. Additivity of intersection lengths gives
  $ ell \( theta_(*) t \) = theta_(*) ell \( t \) \, wide rho \( theta_(*) t \) = theta_(*) rho \( t \) . $
  The realization relation is $\[ theta^(*) sigma \, t \] = \[ sigma \, theta_(*) t \]$ for $sigma in E Q_(q')$.
    Thus for every bar simplex $sigma in E Q_q$ the formula
  $ delta \[ sigma \, t \] = \( \[ sigma \, ell \( t \) \] \, \[ sigma \, rho \( t \) \] \) $
  is compatible with all faces and degeneracies and defines a continuous map $delta : E Q arrow.r E Q times E Q$.
    It is $Q$-equivariant because the action changes $sigma$ and leaves the barycentric coordinates fixed. Moreover
  $ \[ sigma \, t \] mapsto
    #scale(x: 120%, y: 120%)[\(] \[ sigma \, \( 1 - tau \) t + tau ell \( t \) \] \, \[ sigma \, \( 1 - tau \) t +
    tau rho \( t \) \] #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq tau lt.eq 1 \, $
  is compatible with the same identifications and is equivariant.
    It is a homotopy from the ordinary diagonal to $delta$.
  Choose $k$ with $c_(k - 1) lt.eq 1 / 2 lt.eq c_k$. The support of $ell \( t \)$ is contained in the front face
    $\[ 0 \, dots.h \, k \]$, and the support of $rho \( t \)$ is contained in the back face
    $\[ k \, dots.h \, q \]$. These faces have dimensions $k$ and $q - k$.
    Degenerate faces can only lower those dimensions. Consequently
  $ delta \( E Q^(\( s \)) \) subset union.big_(i + j lt.eq s) E Q^(\( i \)) times E Q^(\( j \)) . $
  This also identifies the cellular chain map. On the region $c_(k - 1) lt.eq 1 / 2 lt.eq c_k$,
    the map $t mapsto \( ell \( t \) \, rho \( t \) \)$ is a homeomorphism onto $Delta^k times Delta^(q - k)$,
    with inverse
  $ t_i = ell_i \/ 2 med \( i < k \) \, wide t_k = \( ell_k + rho_k \) \/ 2 \, wide t_i = rho_i \/ 2 med \( i > k \) . $
  In the oriented coordinates $t_1 \, dots.h \, t_q$ on the source and $ell_1 \, dots.h \, ell_k \, rho_(k + 1) \,
    dots.h \, rho_q$ on the product, its Jacobian determinant is $2^q > 0$. The regions meet on their boundaries.
    The image of the cellular fundamental chain is therefore
  $ \[ sigma \] mapsto
    sum_(k = 0)^q \[ sigma \|_(\[ 0 \, dots.h \, k \]) \] ⊗ \[ sigma \|_(\[ k \, dots.h \, q \]) \] \, $
  with degenerate terms omitted in normalized chains. This is the Alexander–Whitney diagonal,
    now obtained from the explicit map.
  Write $E Q \/ E Q^(\( s \))$ for the based cofiber of $\( E Q^(\( s \)) \)_(+) arrow.r E Q_(+)$,
    and set $E Q^(\( - 1 \)) = diameter$. The skeletal inclusions are $Q$-CW cofibrations,
    so these quotients represent their homotopy cofibers. For $a \, b gt.eq 0$,
    the skeletal containment above makes the composite of $delta$ with the quotient to
    $\( E Q \/ E Q^(\( a - 1 \)) \) and \( E Q \/ E Q^(\( b - 1 \)) \)$ constant on $E Q^(\( a + b - 1 \))$:
    if $i + j < a + b$, then $i < a$ or $j < b$. We get a $Q$-equivariant relative map
  $ E Q \/ E Q^(\( a + b - 1 \)) arrow.r \( E Q \/ E Q^(\( a - 1 \)) \) and \( E Q \/ E Q^(\( b - 1 \)) \) . $
  Multiplication on $R$ and precomposition give
  $ F_Q \( E Q \/ E Q^(\( a - 1 \)) \, R \) and F_Q \( E Q \/ E Q^(\( b - 1 \)) \, R \) arrow.r
    F_Q \( E Q \/ E Q^(\( a + b - 1 \)) \, R \) . $
  These maps are compatible as $a$ and $b$ vary, since they are induced by the same $delta$ and the nested
    skeletal quotients.
  For completeness, the associativity needed for powers also holds within this relative filtration.
    Partition $\[ 0 \, 1 \]$ into any $m$ successive intervals of positive lengths.
    For the $j$th output vector, divide the lengths of its intersections with $\[ c_(i - 1) \, c_i \]$ by the
    length of the $j$th interval. The preceding naturality and equivariance proof applies verbatim.
    If $k_j$ is an index whose coordinate interval contains the $j$th cut,
    the supports lie in the successive faces $\[ 0 \, dots.h \, k_1 \]$, $\[ k_1 \, dots.h \, k_2 \]$, …,
    $\[ k_(m - 1) \, dots.h \, q \]$. Their dimensions sum to $q$; boundary cases can only reduce the sum.
    Thus the same construction gives $m$-fold relative maps. Composing cut maps is exactly refinement of the
    partition. The positive interval lengths form a convex simplex,
    so the partitions for two parenthesizations are joined by varying those lengths.
    This gives a homotopy through maps with the same relative skeletal property.
    Thus the relative products are associative up to filtered homotopy, as required for their iterated products.
  Put $I_s = F_Q \( E Q \/ E Q^(\( s - 1 \)) \, R \)$ for $s gt.eq 0$.
    The quotient cofiber sequence for two successive skeleta gives
  $ "cofib" \( I_(s + 1) arrow.r I_s \) tilde.eq F_Q \( E Q^(\( s \)) \/ E Q^(\( s - 1 \)) \, R \) tilde.eq
    "fib" \( V_s arrow.r V_(s - 1) \) . $
  The fiber sequences $I_s arrow.r R^(h Q) arrow.r V_(s - 1)$ form a diagram with the identity on $R^(h Q)$ and
    the tower transition on the right. The stable fiber diagram identifies the connecting maps of the displayed
    cofiber sequences with those of the $V_s$ tower, with the usual rotation signs.
    Thus the paired relative spectral sequence is the ordinary tower spectral sequence with the same filtration
    index. The relative products pair these sequences and their exact couples.
    On cellular cochains the displayed chain formula is the ordinary cup product;
    in inhomogeneous coordinates its value is
  $ \( v smile w \) \( g_1 \, dots.h \, g_(a + b) \) = v \( g_1 \, dots.h \, g_a \) thin \( g_1 dots.h.c g_a \)
    w \( g_(a + 1) \, dots.h \, g_(a + b) \) \, $
  with the usual graded signs. The cellular boundary formula for a product,
    together with the internal Koszul sign, gives the derivation rule in the paired exact couples and hence on
    every spectral-sequence page. This $E_2$ product is the ordinary cup product used by the ordinary-to-Tate
    comparison in Section 7. Since each subsequent product is induced on homology,
    the products agree on every later page as well.
  The fiber sequence for $I_a$ identifies its image in $pi_(*)
    R^(h Q)$ with $ker \( pi_(*) R^(h Q) arrow.r pi_(*) V_(a - 1) \)$.
    After forgetting the relative conditions, the product just constructed is homotopic to the actual product on
    $F_Q \( E Q_(+) \, R \)$ by the equivariant homotopy from $delta$ to the diagonal.
    Thus these relative products multiply the actual filtration groups.
    Passing to successive relative quotients is exactly the product in the paired spectral sequence.
    When the stated convergence identifies those quotients with $E_oo$,
    this is the associated-graded homotopy product as stated. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
