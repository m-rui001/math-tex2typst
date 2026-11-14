#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Subcritical Hénon--Lane--Emden Conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Hénon–Lane–Emden system is

#[#set math.equation(numbering: n => "(1.1)")
 $ - Delta u = \| x \|^A v^p \, wide - Delta v = \| x \|^B u^q wide upright("in ") bb(R)^n \\ { 0 } . $ <eq:system>]

Its subcritical nonexistence conjecture asks whether the weighted hyperbola alone rules out positive solutions,
  without symmetry or conditions at infinity. The unweighted case $A = B = 0$ is the classical Lane–Emden system.

The scalar subcritical Liouville theorem of Gidas and Spruck is a starting point for this
  question #cite(label("GidasSpruck1981")). For systems, Mitidieri developed a Rellich identity and early
  nonexistence regions #cite(label("Mitidieri1993")) #cite(label("Mitidieri1996")).
  Serrin and Zou proved the unweighted three-dimensional assertion under a growth condition; Poláčik, Quittner,
  and Souplet removed that condition, and Souplet settled dimension four #cite(label("SerrinZou1996"))
  #cite(label("PolacikQuittnerSouplet2007")) #cite(label("Souplet2009")).
  Li, Li, and Wei obtained a further unweighted nonexistence region for $p \, q gt.eq
  1$ in every dimension $n gt.eq 5$ #cite(label("LiLiWei2025")) Theorem 1.1.
  Liouville theorems also serve as inputs to rescaling arguments for a priori bounds and singularity
  estimates #cite(label("GidasSpruckBounds1981")) #cite(label("PolacikQuittnerSouplet2007")).

For the weighted system, Bidaut-Véron and Giacomini identified the critical hyperbola in the regular radial theory
  under admissible weights #cite(label("BidautVeronGiacomini2010")).
  Phan formulated the unrestricted weighted question for $A \, B > - 2$ as Conjecture C and established bounded,
  low-dimensional, and conditional cases #cite(label("Phan")).
  Fazly and Ghoussoub obtained bounded and stability-based results for nonnegative
  weights #cite(label("FazlyGhoussoub2014")); Li and Zhang subsequently proved the weighted conjecture in
  dimension three without a boundedness assumption #cite(label("LiZhang2019")).
  Results in restricted exponent ranges extend to dimensions four and five #cite(label("Li2022")).
  More recently, Huang and Zou stated the all-real-weight, origin-continuous assertion as Conjecture B and proved
  cases with stability, decay, or energy hypotheses #cite(label("HuangZou")).
  Xu and Luo obtained a higher-order weighted theorem over the full exponent range for radial solutions subject to
  regularity and growth conditions #cite(label("XuLuo2026")).
  The full nonradial question in higher dimensions is the subject of this paper.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 2$ be an integer, let $p \, q > 0$, and let $A \, B in bb(R)$. Suppose that
#[#set math.equation(numbering: n => "(1.2)")
 $ frac(n + A, p + 1) + frac(n + B, q + 1) > n - 2 . $ <eq:subcritical>]

 There are no functions
$ u \, v in C^2 \( bb(R)^n \\ { 0 } \) ∩ C \( bb(R)^n \) \, wide u \( x \) > 0 \, quad
  v \( x \) > 0 quad \( x in bb(R)^n \) \, $

 satisfying Equation (1.1) at every $x eq.not 0$.]
] <thm:main>

#thm([Corollary 1.2.])[
  (Unweighted Lane–Emden conjecture).  #emph[For every integer $n gt.eq 3$ and $p \, q > 0$ satisfying
$ frac(1, p + 1) + frac(1, q + 1) > frac(n - 2, n) \, $

 there is no strictly positive $C^2 \( bb(R)^n \)$ solution of
$ - Delta u = v^p \, wide - Delta v = u^q wide upright("in ") bb(R)^n . $

]
] <cor:lane-emden>

In particular, positivity at the origin is part of the hypothesis, but differentiability there is not.
  No radial symmetry, boundedness, integrability, finite energy, stability,
  or growth or decay condition at infinity is required.

Theorem 1 resolves Huang and Zou’s Conjecture B positively and yields Corollary 2 by setting $A = B = 0$.
  For $n gt.eq 3$ and $A \, B > - 2$, its nonexistence conclusion joins the radial existence theorem of
  Bidaut-Véron and Giacomini #cite(label("BidautVeronGiacomini2010")) Theorem 1.4(i) to prove Phan’s Conjecture C
  in full, including existence on the critical hyperbola. Corollary 13 records this derived classification.
  The weak regularity at the origin is genuine: positivity and continuity,
  rather than a prescribed order of vanishing or smoothness there, are all that is assumed.

The weighted assertion cannot be inferred merely by applying the unweighted assertion at the same exponents.
  For instance, $n = 5$, $p = q = 4$, $A = B = 3$ satisfies Equation (1.2), whereas $1 \/ \( p + 1 \) +
  1 \/ \( q + 1 \) = 2 \/ 5 < 3 \/ 5$. Likewise, the unweighted input in Phan’s transfer argument must remain
  within its actual scope; weighted subcriticality does not imply that input #cite(label("Phan")).

===== 1.1 The weighted argument. <the-weighted-argument.>

Rellich–Pohozaev identities and spherical estimates have long been central to system Liouville
  proofs #cite(label("Mitidieri1993")) #cite(label("Souplet2009")) #cite(label("Phan")).
  Chen and Li used Newtonian integral representations with moving planes under integrability
  hypotheses #cite(label("ChenLi2009")); Cheng and Huang later formulated an energy-estimate criterion for the
  unweighted conjecture #cite(label("ChengHuang2019")). The passage from a uniform local weighted-energy bound to
  nonexistence by origin-centered dilation also appears in Li #cite(label("Li2022")) Section 2.
  Here a localized potential-kernel virial identity and an energy-relative interval-pressure estimate supply that
  bound throughout the subcritical range.

There are two difficulties in passing from unweighted source layers to Equation (1.1).
  Translations do not preserve the equation, and an endpoint of a layer ${ \| x \|^B u \( x \)^q >
  t }$ has value $\( t \/ \| x \|^B \)^(1 \/ q)$, not the constant $t^(1 \/ q)$. We address both directly.

First, origin-centered dilations give uniform source masses and truncated-potential bounds on a fixed ball.
  A compactly supported virial identity then retains the exact spatial-weight coefficients.
  Second, the interval comparison is applied with directions in a small cap around the radial direction and with
  weights constant on each retained interval. Retained intervals are short enough that their endpoint weight
  variation is small. The discarded intervals are controlled by polar integration of source masses and a high/low
  layer decomposition.

All errors are arbitrarily small relative to a fixed localized energy, up to a universal additive constant.
  No bound on that energy is assumed in obtaining the error estimates.
  The weighted subcritical gap then supplies such a bound, and dilation gives a contradiction.
  This combination of spatially varying directional cutoffs, intervalwise infima,
  and energy-relative layer errors is the part of the method that may be useful for other weighted potential
  systems. The elementary interval comparison itself is reproved below.

===== 1.2 Organization. <organization.>

Section 2 treats the origin, the low-exponent cases, and the potential estimates.
  Section 3 proves the localized virial identity and compares the two localized interaction marginals.
  Section 4 gives the geometric interval inequality. Section 5 proves its weighted pressure consequence,
  including the needed layer-error bounds. Section 6 completes the proof by scaling and derives the
  existence–nonexistence classification from the radial theorem.

== 2 Reductions and Newton potentials <sec:preliminaries>

We begin with consequences of positivity that do not require the subcritical inequality.
  Throughout this section, a solution means a pair

$ u \, v in C^2 \( bb(R)^n \\ { 0 } \) ∩ C \( bb(R)^n \) \, wide u \, v > 0 quad upright("on ") bb(R)^n \, $

where $n gt.eq 2$, $p \, q > 0$, and $A \, B in bb(R)$, satisfying

$ - Delta u = \| x \|^A v^p \, wide - Delta v = \| x \|^B u^q quad upright("on ") bb(R)^n \\ { 0 } . $

We write $B_R \( z \) = { x : \| x - z \| < R }$ and $B_R = B_R \( 0 \)$.

#thm([Lemma 2.1.])[
  (Origin reductions).  #emph[The existence of a solution implies $n gt.eq 3$ and $A \, B > - 2$.]
] <lem:reductions>

#proof[
  For a function $h$ continuous on each sphere about the origin, write
  $ overline(h) \( r \) = frac(1, \| bb(S)^(n - 1) \|) integral_(bb(S)^(n - 1)) h \( r theta \) thin thin
    upright(d) theta . $
  Integration of the equations on annuli gives, for $r > 0$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ #scale(x: 120%, y: 120%)[\(] r^(n - 1) overline(u)' \( r \) #scale(x: 120%, y: 120%)[\)]' & = -
     r^(n - 1 + A) overline(v^p) \( r \) \,\
#scale(x: 120%, y: 120%)[\(] r^(n - 1) overline(v)' \( r \) #scale(x: 120%, y: 120%)[\)]' & = -
  r^(n - 1 + B) overline(u^q) \( r \) . $ <eq:spherical-flux>]
  In particular, each flux on the left is strictly decreasing. Its extended limit as $r arrow.b 0$ exists.
    If that limit were nonzero or infinite, the flux would have a fixed sign and absolute value bounded below by a
    positive constant for all sufficiently small $r$. Since $integral_0^1 r^(1 - n) thin thin upright(d) r = oo$,
    integration would contradict boundedness of the corresponding spherical mean at zero.
    Thus both limits are zero, and both fluxes are strictly negative for every $r > 0$.
  If $n = 2$, then $r overline(u)' \( r \) lt.eq overline(u)' \( 1 \) < 0$ for $r gt.eq 1$.
    Consequently $overline(u) \( r \) lt.eq overline(u) \( 1 \) + overline(u)' \( 1 \) log r$,
    contradicting positivity for large $r$.
  Continuity and $v \( 0 \) > 0$ give $v^p gt.eq c > 0$ near zero.
    Integrating the first equation in (2.1) over $\[ r \/ 2 \, r \]$ and using the negative flux at $r \/ 2$, we obtain
  $ - overline(u)' \( r \) gt.eq c r^(1 - n) integral_(r \/ 2)^r s^(n - 1 + A) thin thin upright(d) s =
    c_A r^(1 + A) \, wide c_A > 0 . $
  The equality remains valid when $n + A = 0$, with the corresponding constant containing $log 2$.
    If $A lt.eq - 2$, integrating this inequality towards zero contradicts continuity of $u$ there.
    Interchanging the two equations proves $B > - 2$. ◻
]

Henceforth assume $n gt.eq 3$ and $A \, B > - 2$. Define, off zero,

#[#set math.equation(numbering: n => "(2.2)")
 $ f \( x \) = \| x \|^B u \( x \)^q \, wide g \( x \) = \| x \|^A v \( x \)^p \,\
K \( x \) = c_n \| x \|^(2 - n) \, wide c_n = frac(1, \( n - 2 \) \| bb(S)^(n - 1) \|) . $ <eq:sources-kernel>]

We set $f \( 0 \) = g \( 0 \) = 0$, which has no effect on any integral.
  All unspecified integrals below are Lebesgue integrals. A constant called #emph[universal] may depend on $n \,
  p \, q \, A \, B$ and on explicitly indicated auxiliary parameters, but not on the particular solution.
  In contrast, constants denoted by $C_(u \, v)$ are allowed to depend on the solution.

#thm([Lemma 2.2.])[
  (Distributional extension and potentials).  #emph[For every solution with $n gt.eq 3$ and $A \, B > - 2$,
    the sources $f \, g$ belong to $L_(upright("loc"))^1 \( bb(R)^n \)$ and
$ - Delta u = g \, wide - Delta v = f quad upright("in distributions on ") bb(R)^n . $

 The Newton potentials are finite everywhere and satisfy
#[#set math.equation(numbering: n => "(2.3)")
 $ K * g lt.eq u \, wide K * f lt.eq v quad upright("on ") bb(R)^n . $ <eq:potential-lower>]

 There are constants $c_u \, c_v gt.eq 0$ such that
#[#set math.equation(numbering: n => "(2.4)")
 $ u = c_u + K * g \, wide v = c_v + K * f $ <eq:potential-constants>]

 almost everywhere on $bb(R)^n$ and pointwise on $bb(R)^n \\ { 0 }$.
   On the latter set the potentials are continuously differentiable, and
#[#set math.equation(numbering: n => "(2.5)")
 $ nabla u \( x \) & = integral_(bb(R)^n) nabla K \( x - y \) g \( y \) thin thin upright(d) y \,\
nabla v \( x \) & = integral_(bb(R)^n) nabla K \( x - y \) f \( y \) thin thin upright(d) y \,\
nabla K \( z \) & = - \( n - 2 \) frac(z, \| z \|^2) K \( z \) . $ <eq:potential-gradients>]

 Both gradient integrals converge absolutely at every $x eq.not 0$.]
] <lem:potential>

#proof[
  Local boundedness of $u \, v$ gives $g \( x \) lt.eq C_(u \, v) \| x \|^A$ and $f \( x \) lt.eq
    C_(u \, v) \| x \|^B$ near zero. Since $n + A \, n + B > 0$, both sources are locally integrable.
    Let $phi in C_c^oo \( bb(R)^n \)$ and choose $xi in C_c^oo \( bb(R)^n \)$ equal to one near zero.
    Test the equation for $u$ away from zero against $phi \( x \) \( 1 - xi \( x \/ rho \) \)$.
    After expanding its Laplacian, the terms involving first and second derivatives of $xi \( x \/ rho \)$ have
    absolute values bounded respectively by $C_(u \, v \, phi \, xi) rho^(n - 1)$ and $C_(u \, v \, phi \, xi)
    rho^(n - 2)$. They tend to zero. The remaining terms pass to the limit by local integrability,
    proving the first distributional equation. The second follows in the same way.
  Let $zeta_rho$ be a nonnegative, compactly supported smooth approximate identity, and put $u_rho =
    u * zeta_rho$ and $g_rho = g * zeta_rho$. Then $u_rho > 0$ and $- Delta u_rho = g_rho gt.eq
    0$ on all of $bb(R)^n$. Two integrations of the spherical flux formula, now about an arbitrary point $x$, give
  $ u_rho \( x \) - frac(1, \| bb(S)^(n - 1) \|) integral_(bb(S)^(n - 1)) u_rho \( x + R theta \) thin thin
    upright(d) theta = c_n integral_(\| x - y \| < R) #scale(x: 120%, y: 120%)[\(] \| x - y \|^(2 - n) -
    R^(2 - n) #scale(x: 120%, y: 120%)[\)] g_rho \( y \) thin thin upright(d) y . $
  The spherical average is positive. Monotone convergence as $R arrow.r oo$ therefore yields $K * g_rho lt.eq
    u_rho$. As $rho arrow.b 0$, $u_rho \( x \) arrow.r u \( x \)$ for every $x$, while $g_rho arrow.r
    g$ almost everywhere. Fatou’s Lemma proves $K * g \( x \) lt.eq u \( x \)$ at every point.
    The same argument proves $K * f lt.eq v$.
  The normalization of $K$ gives $- Delta K = delta_0$ in distributions:
    $K$ is harmonic off zero, $- integral_(partial B_r) partial_r K = 1$, and $integral_(partial B_r) K =
    O \( r \)$, so integration by parts outside $B_r$ and passage to $r = 0$ gives the assertion.
    To apply this to $K * g$, note that for every compactly supported smooth $phi$,
  $ integral_(bb(R)^n) g \( y \) integral_(bb(R)^n) K \( x - y \) \| Delta phi \( x \) \| thin thin upright(d) x
    thin thin upright(d) y = integral_(bb(R)^n) \( K * g \) \( x \) \| Delta phi \( x \) \| thin thin upright(d) x
    lt.eq integral_(bb(R)^n) u \( x \) \| Delta phi \( x \) \| thin thin upright(d) x < oo . $
  Fubini’s Theorem thus gives $- Delta \( K * g \) = g$. The difference $h = u -
    K * g$ is a nonnegative locally integrable harmonic distribution.
    Every $h * zeta_rho$ is a nonnegative entire harmonic function. Such a function $H$ is constant:
    for $b = \| x - z \|$, the mean-value property and $B_R \( x \) subset B_(R + b) \( z \)$ imply
  $ H \( x \) lt.eq (frac(R + b, R))^n H \( z \) . $
  Letting $R arrow.r oo$ and then interchanging $x \, z$ proves equality.
    Passing back to distributions shows that $h$ itself is a nonnegative constant.
    The argument for $v - K * f$ is identical.
  Fix $x_0 eq.not 0$. The sources are locally $C^1$ near $x_0$, because $u \,
    v$ are strictly positive there and $p \, q > 0$. Split $g$ by a smooth cutoff supported near $x_0$ and equal
    to one on a smaller neighborhood. For the compactly supported part,
    local integrability of $K$ and $nabla K$ gives a continuously differentiable convolution with the asserted
    derivative. For the other part, $\| x - y \|$ stays bounded away from zero as $x$ varies in a sufficiently
    small neighborhood of $x_0$. There both $K \( x - y \)$ and $\| nabla
    K \( x - y \) \|$ are bounded by a fixed multiple of $K \( x_0 - y \)$.
    The latter is integrable against $g$ by (2.3). Dominated convergence proves continuity and differentiation of
    this part as well. The almost-everywhere identity in (2.4) is therefore pointwise off zero, and (2.5) follows.
    The proof for $f$ is the same. ◻
]

For $x \, y in B_R$, the kernel satisfies $K \( x - y \) gt.eq c R^(2 - n)$.
  Thus Lemma 4 gives the centered lower bounds

#[#set math.equation(numbering: n => "(2.6)")
 $ u \( x \) gt.eq c R^(2 - n) integral_(B_R) g \, wide v \( x \) gt.eq
   c R^(2 - n) integral_(B_R) f wide \( x in B_R \) \, $ <eq:ball-lower>]

where $c > 0$ depends only on $n$.

#thm([Lemma 2.3.])[
  (Exclusion of small products).  #emph[A solution with $n gt.eq 3$ and $A \, B > - 2$ necessarily has $p q > 1$.]
] <lem:low-exponents>

#proof[
  Set $m_u \( R \) = inf_(B_R) u$ and $m_v \( R \) = inf_(B_R) v$.
    Both are positive by positivity and continuity on $overline(B_R)$. Integrating the weights in (2.6) yields
  $ m_u \( R \) gt.eq c R^(2 + A) m_v \( R \)^p \, wide m_v \( R \) gt.eq c R^(2 + B) m_u \( R \)^q . $
  Combining them and dividing by $m_u \( R \)^(p q) > 0$ gives
  $ m_u \( R \)^(1 - p q) gt.eq c R^(2 + A + p \( 2 + B \)) . $
  The exponent on the right is positive. If $p q < 1$, the left side is at most $u \( 0 \)^(1 - p q)$,
    and if $p q = 1$, it is one. Either case contradicts the inequality as $R arrow.r oo$. ◻
]

We may consequently assume $n gt.eq 3$, $A \, B > - 2$, and $p q > 1$. Introduce

#[#set math.equation(numbering: n => "(2.7)")
 $ alpha = frac(2 + A + p \( 2 + B \), p q - 1) \, wide beta = frac(2 + B + q \( 2 + A \), p q - 1) \,\
a = frac(1, q + 1) \, wide b = frac(1, p + 1) . $ <eq:parameters>]

Both $alpha$ and $beta$ are positive, and

$ p beta = alpha + 2 + A \, wide q alpha = beta + 2 + B . $

For every $R > 0$, the pair

#[#set math.equation(numbering: n => "(2.8)")
 $ u_R \( x \) & = R^alpha u \( R x \) \, wide v_R \( x \) = R^beta v \( R x \) \,\
f_R \( x \) & = \| x \|^B u_R \( x \)^q = R^(beta + 2) f \( R x \) \,\
g_R \( x \) & = \| x \|^A v_R \( x \)^p = R^(alpha + 2) g \( R x \) $ <eq:scaling>]

again solves the same system, with the same parameters and regularity.
  These are dilations about the origin, where the weights are centered.

#thm([Proposition 2.4.])[
  (Universal centered estimates).  #emph[Fix $n gt.eq 3$, $p \, q > 0$, $A \, B > - 2$, and $p q > 1$.
    There is a universal constant $C$ such that every solution satisfies, for all $R > 0$,
#[#set math.equation(numbering: n => "(2.9)")
 $ integral_(B_R) f lt.eq C R^(n - 2 - beta) \, wide integral_(B_R) g lt.eq C R^(n - 2 - alpha) . $ <eq:source-bounds>]

 The constants in (2.4) vanish, so that
#[#set math.equation(numbering: n => "(2.10)")
 $ u = K * g \, wide v = K * f quad upright("on ") bb(R)^n \\ { 0 } . $ <eq:potentials>]

 Moreover,
#[#set math.equation(numbering: n => "(2.11)")
 $ & integral_(B_4) \( f + g + u + v \) lt.eq C \,\
 & integral_(\| x - y \| gt.eq ell) K \( x - y \) \( f \( y \) + g \( y \) \) thin thin upright(d) y lt.eq
   C ell^(2 - n) wide \( x in B_2 \, med 0 < ell lt.eq 1 \) . $ <eq:uniform>]

]
] <prop:uniform>

#proof[
  Write $M_f = integral_(B_1) f$ and $M_g = integral_(B_1) g$.
    The lower bounds (2.6), followed by integration of $\| x \|^B$ and $\| x \|^A$ on $B_1$, give
  $ M_f gt.eq c_f M_g^q \, wide M_g gt.eq c_g M_f^p \, $
  where $c_f \, c_g > 0$ are universal. In particular, $M_f gt.eq c_f c_g^q M_f^(p q)$,
    and $M_f > 0$ and $p q > 1$ give a universal upper bound for $M_f$. The interchanged argument bounds $M_g$.
    Apply these bounds to the scaled pair (2.8); changing variables proves (2.9).
    The argument uses only positive powers, and requires neither $p gt.eq 1$ nor $q gt.eq 1$.
  If $c_u > 0$ in (2.4), then $u gt.eq c_u$ almost everywhere and
  $ integral_(B_R) f gt.eq c_u^q integral_(B_R) \| x \|^B thin thin upright(d) x =
    c_u^q frac(\| bb(S)^(n - 1) \|, n + B) R^(n + B) . $
  This contradicts (2.9) as $R arrow.r oo$, since $n + B - \( n - 2 - beta \) = B + 2 + beta = q alpha > 0$.
    Likewise $c_v = 0$, proving (2.10).
  For $x in B_4$ and $j gt.eq 3$, the annulus $2^j lt.eq \| y \| < 2^(j + 1)$ has $\| x - y \| gt.eq 2^(j - 1)$.
    Its contribution to the $f$ potential is at most
  $ C 2^(j \( 2 - n \)) integral_(B_(2^(j + 1))) f lt.eq C 2^(- j beta) \, $
  and its contribution to the $g$ potential is at most $C 2^(- j alpha)$.
    The two series converge because $alpha \, beta > 0$. Thus the potentials of the sources restricted to
    $bb(R)^n \\ B_8$ are uniformly bounded on $B_4$. On the other hand,
  $ sup_(y in B_8) integral_(B_4) K \( x - y \) thin thin upright(d) x lt.eq
    integral_(B_12) K \( z \) thin thin upright(d) z < oo . $
  Tonelli’s Theorem, the source bounds on $B_8$, and (2.10) now bound $integral_(B_4) \( u + v \)$.
    The source part of the first estimate in (2.11) follows directly from (2.9).
  Finally, on $\| x - y \| gt.eq ell$ the kernel is at most $c_n ell^(2 - n)$.
    This bounds the contribution from $y in B_8$ by $C ell^(2 - n)$.
    The contribution from $y in.not B_8$ has already been bounded by $C$; since $0 < ell lt.eq 1$ and $n gt.eq 3$,
    this proves the second estimate in (2.11). ◻
]

The bounds (2.9) are centered at the origin. For example,
  when a later argument uses a ball $B_ell \( x \) subset B_4$,
  its source mass is bounded by the mass of $B_4$ in (2.11).
  No translation of the weighted equation or source estimate is needed. Also, local energy is finite for each solution:

$ f u = \| x \|^B u^(q + 1) \, wide g v = \| x \|^A v^(p + 1) quad
  upright("belong to ") L_(upright("loc"))^1 \( bb(R)^n \) . $

This statement follows from local boundedness and $A \, B > - 2$; it is not yet a bound uniform over solutions.
  We assume no finiteness of either energy integral on all of $bb(R)^n$.

To connect the centered dilation with the subcritical hypothesis, define

#[#set math.equation(numbering: n => "(2.12)")
 $ gamma & := a \( n + B \) + b \( n + A \) - \( n - 2 \)\
 & = \( 1 - a - b \) \( alpha + beta + 2 - n \) \,\
1 - a - b & = frac(p q - 1, \( p + 1 \) \( q + 1 \)) > 0 . $ <eq:gap>]

Indeed, the numerator of $alpha + beta$ is $\( q + 1 \) \( 2 + A \) + \( p + 1 \) \( 2 + B \)$,
  and substitution gives the identity. The strict inequality in Theorem 1 is precisely $gamma > 0$,
  and hence implies $alpha + beta + 2 - n > 0$. Finally, changing variables in (2.8) gives the local energy identity

#[#set math.equation(numbering: n => "(2.13)")
 $ integral_(B_1) \( f_R u_R + g_R v_R \) = R^(alpha + beta + 2 - n) integral_(B_R) \( f u + g v \) .
   $ <eq:energy-scaling>]

We shall obtain a universal upper bound for the left side, valid for every scaled solution.
  Positivity of the exponent in (2.13) will then yield the final contradiction.

== 3 A localized virial identity <sec:localization>

System Rellich–Pohozaev identities have a long history #cite(label("Mitidieri1993")) #cite(label("Souplet2009"));
  Phan gave a weighted version #cite(label("Phan")). We use a potential-kernel form that retains the spatial
  weights in a compactly supported interaction identity.

We retain the parameters and exact potentials of the preceding section. Define the nonnegative interaction measure by

#[#set math.equation(numbering: n => "(3.1)")
 $ thin upright(d) pi \( x \, y \) = f \( x \) g \( y \) K \( x - y \) thin upright(d) x thin upright(d) y \,\
pi \( thin upright(d) x \, bb(R)^n \) = f \( x \) u \( x \) thin upright(d) x \, quad
  pi \( bb(R)^n \, thin upright(d) y \) = g \( y \) v \( y \) thin upright(d) y . $ <eq:interaction>]

The marginal identities follow from Tonelli’s Theorem and (2.10). This measure is locally finite:
  on each compact set the sources are integrable and the potentials are bounded.
  Its total mass is not assumed finite. Values of the density or of the quotients below on the diagonal may be set
  to zero. For a unit vector $e in bb(S)^(n - 1)$, put

$ D_e \( x \, y \) = frac(\( \( x - y \) dot.op e \)^2, \| x - y \|^2) \, wide omega_x = frac(x, \| x \|) \, wide
  D \( x \, y \) = D_(omega_x) \( x \, y \) . $

Choose any unit vector as $omega_0$; this convention does not affect any integral.

The cutoff will vanish to a sufficiently high order at its outer boundary. Writing $t_(+) = max { t \, 0 }$, fix

#[#set math.equation(numbering: n => "(3.2)")
 $ d \( x \) = min { 1 \, \( 2 - \| x \| \)_(+) } \, wide m = n + 3 \, wide k = n \( m + 1 \) \, wide N = k + n + 2 \,\
eta \( x \) = #scale(x: 120%, y: 120%)[\[] #scale(x: 120%, y: 120%)[\(] 1 - \( \| x \| - 1 \)_(+)^3
  #scale(x: 120%, y: 120%)[\)]_(+) #scale(x: 120%, y: 120%)[\]]^N \, wide w \( x \) = -
  x dot.op nabla eta \( x \) \, wide X \( x \) = x eta \( x \) . $ <eq:cutoff>]

Thus $eta in C_c^2 \( bb(R)^n \)$ equals one on $B_1$, and $w gt.eq 0$ vanishes unless $1 < \| x \| < 2$.
  The cubic term makes the first two derivatives match at radius one,
  and the power $N$ makes them vanish at radius two. On the intervening annulus, with $s = \| x \| - 1$, $1 -
  s^3 = d \( x \) \( 1 + s + s^2 \)$. Differentiation therefore gives

#[#set math.equation(numbering: n => "(3.3)")
 $ d^N lt.eq eta lt.eq C d^N \, wide \| nabla eta \| + w lt.eq C d^(N - 1) \,\
\| nabla^2 eta \| + \| nabla w \| + \| nabla^2 X \| lt.eq C d^(N - 2) \, wide d w lt.eq C eta . $ <eq:cutoff-bounds>]

Set

$ E_f = integral_(bb(R)^n) eta f u thin upright(d) x \, wide E_g = integral_(bb(R)^n) eta g v thin upright(d) x \,
  wide E = E_f + E_g \,\
W_f = integral_(bb(R)^n) w f u thin upright(d) x \, wide W_g = integral_(bb(R)^n) w g v thin upright(d) x . $

All these quantities are finite for each solution: $u \, v$ are bounded on $overline(B)_2$,
  and $\| x \|^A \, \| x \|^B$ are integrable there because $A \, B > - 2$ and $n gt.eq 3$.
  This asserts finiteness only; a bound independent of the solution remains to be proved.

#thm([Lemma 3.1.])[
  (Localized virial identity).  #emph[The following identity holds, with an absolutely convergent integral:
#[#set math.equation(numbering: n => "(3.4)")
 $ a \( n + B \) E_f + b \( n + A \) E_g - a W_f - b W_g & = \( n - 2 \) integral_(bb(R)^(2 n)) Phi \( x \, y \)
   thin upright(d) pi \( x \, y \) \,\
Phi \( x \, y \) & = frac(\( X \( x \) - X \( y \) \) dot.op \( x - y \), \| x - y \|^2) . $ <eq:virial>]

]
]

#proof[
  We first justify absolute convergence of the separate kernel-gradient integrals, before combining them.
    For $r = \| x \|$ sufficiently small, local boundedness of $v$ gives $g \( y \) lt.eq
    C_(u \, v) r^A$ when $\| x - y \| lt.eq r \/ 2$. Hence
  $ \| X \( x \) \| integral_(\| x - y \| lt.eq r \/ 2) \| x - y \|^(1 - n) g \( y \) thin upright(d) y lt.eq
    C_(u \, v) r thin r^A integral_0^(r \/ 2) thin upright(d) s lt.eq C_(u \, v) r^(2 + A) . $
  On the complementary region, $\| X \( x \) \| lt.eq r lt.eq 2 \| x - y \|$,
    so the same expression with that region in place of the ball is at most $C \( K * g \) \( x \) = C u \( x \)$.
    Both bounds remain bounded as $x arrow.r 0$. On compact subsets away from zero,
    the nearby source is bounded and $\| nabla K \|$ is locally integrable;
    the remaining part is bounded by a constant times the finite potential.
    Since $X$ is supported in $overline(B)_2$ and $f$ is locally integrable, this proves
  $ integral_(bb(R)^n) f \( x \) \| X \( x \) \| integral_(bb(R)^n) \| nabla K \( x - y \) \| g \( y \) thin
    upright(d) y thin upright(d) x < oo . $
  Interchanging $\( f \, u \, B \)$ and $\( g \, v \, A \)$ proves the other assertion.
    In particular, $f X dot.op nabla u$ and $g X dot.op nabla v$ are absolutely integrable.
  Since $a = 1 \/ \( q + 1 \)$, integration by parts outside $B_rho$, with $0 < rho < 1$, gives
  $ - integral_(\| x \| > rho) f X dot.op nabla u thin upright(d) x =  & a integral_(\| x \| > rho) \| x \|^B
    u^(q + 1) #scale(x: 120%, y: 120%)[\(] \( n + B \) eta - w #scale(x: 120%, y: 120%)[\)] thin upright(d) x\
 & + a rho^(B + 1) integral_(partial B_rho) u^(q + 1) thin upright(d) S . $
  Here $"div" \( \| x \|^B X \) = \| x \|^B \( \( n + B \) eta - w \)$,
    and the boundary term has the displayed positive sign because the outward normal of the punctured domain on
    $partial B_rho$ is $- omega_x$. Its magnitude is $O_(u \, v) \( rho^(n + B) \)$, which tends to zero.
    The corresponding term for $g X dot.op nabla v$ is positive and $O_(u \, v) \( rho^(n + A) \)$,
    and also tends to zero. There is no outer boundary term because $X$ is compactly supported. Consequently,
  $ - integral f X dot.op nabla u thin upright(d) x - integral g X dot.op nabla v thin upright(d) x =
    a \( n + B \) E_f + b \( n + A \) E_g - a W_f - b W_g . $
  Finally substitute the differentiated potential identities and $nabla K \( z \) = - \( n - 2 \) z
    K \( z \) \/ \| z \|^2$. Absolute convergence permits Fubini’s Theorem and interchanging the variables in the
    second integral; their sum is exactly the right side of (3.4). ◻
]

#thm([Lemma 3.2.])[
  (Localization).  #emph[For every $epsilon > 0$, there is a constant $C_epsilon$, independent of the solution,
    such that
#[#set math.equation(numbering: n => "(3.5)")
 $ \| E_f - E_g \| + integral_(bb(R)^(2 n)) \| Phi \( x \, y \) - eta \( x \) +
   w \( x \) D \( x \, y \) \| thin upright(d) pi \( x \, y \) lt.eq epsilon E + C_epsilon . $ <eq:localization>]

]
] <lem:localization>

#proof[
  Fix $0 < delta < 1 \/ 4$, and write $ell \( z \) = delta d \( z \)^m$ whenever $d \( z \) > 0$.
    Call a pair $\( x \, y \)$ close if $\| x - y \| lt.eq ell \( z \)$ for at least one endpoint $z in { x \,
    y }$ with $d \( z \) > 0$, and far otherwise. Since $d$ is 1-Lipschitz,
    for a close pair every point $xi$ of the segment $\[ x \, y \]$ satisfies
  $ \( 1 - delta \) d \( z \) lt.eq d \( xi \) lt.eq \( 1 + delta \) d \( z \) . $
  In particular, the entire segment is inside $B_2$. The derivative matrix of $X$ is
  $ nabla X \( x \) = eta \( x \) "Id" - w \( x \) omega_x ⊗ omega_x \, $
  with its second term zero on $B_1$. Taylor’s formula and (3.3) give, on close pairs with $x eq.not y$,
  $ \| Phi - eta \( x \) + w \( x \) D \| & lt.eq C delta d \( z \)^(N - 2 + m) = C delta d \( z \)^(N + n + 1) \,\
\| eta \( x \) - eta \( y \) \| & lt.eq C delta d \( z \)^(N - 1 + m) = C delta d \( z \)^(N + n + 2) . $
  Both are at most $C delta d \( z \)^N$. Since $d \( z \)^N lt.eq eta \( z \) lt.eq eta \( x \) + eta \( y \)$,
    the marginal identities in (3.1) bound the integral of their sum over close pairs by $C delta E$.
  For a far pair, every endpoint $z$ in $B_2$ satisfies $\| x - y \| > ell \( z \)$.
    Using $\| Phi \| lt.eq \( \| X \( x \) \| + \| X \( y \) \| \) \/ \| x - y \|$ and $0 lt.eq D lt.eq 1$, we obtain
  $ \| Phi - eta \( x \) + w \( x \) D \| + \| eta \( x \) - eta \( y \) \| lt.eq C sum_(z in { x \, y }\
d \( z \) > 0) (d \( z \)^(N - 1) + frac(d \( z \)^N, ell \( z \))) . $
  Pairs with both endpoints outside $B_2$ contribute zero. For the terms associated with $x$,
    the tail estimate in Proposition 6, (2.11), bounds the integral by
  $ & C integral_(B_2) f \( x \) (d \( x \)^(N - 1) + frac(d \( x \)^N, ell \( x \))) ell \( x \)^(2 - n) thin
    upright(d) x\
 & quad lt.eq C integral_(B_2) f \( x \) (delta^(2 - n) d \( x \)^(4 n + 7) + delta^(1 - n) d \( x \)^(3 n + 5))
   thin upright(d) x lt.eq C_delta . $
  Indeed the two exponents are
  $ N - 1 - m \( n - 2 \) = 4 n + 7 > 0 \, wide N - m \( n - 1 \) = 3 n + 5 > 0 \, $
  and $integral_(B_2) f lt.eq C$ by (2.11). The terms associated with $y$ satisfy the same bound with $g$.
    All these constants are independent of the solution.
  Finally, both cutoff marginals are finite, so
  $ \| E_f - E_g \| = lr(|integral_(bb(R)^(2 n)) \( eta \( x \) - eta \( y \) \) thin upright(d) pi \( x \, y \)|)
    lt.eq integral_(bb(R)^(2 n)) \| eta \( x \) - eta \( y \) \| thin upright(d) pi \( x \, y \) . $
  The preceding estimates bound the left side of (3.5) by $C delta E + C_delta$.
    Choosing $delta$ sufficiently small proves the result. ◻
]

To obtain a uniform bound for $E$, it remains to prove that, for every $epsilon > 0$,

$ a W_f + b W_g - \( n - 2 \) integral w \( x \) D \( x \, y \) thin upright(d) pi \( x \, y \) lt.eq epsilon E +
  C_epsilon . $

The next two sections establish this comparison from source-layer intervals.
  In Section 6, it will combine with the marginal estimate above and the positive subcritical gap $gamma$ to give
  the energy bound.

== 4 An interval-pair inequality <sec:intervals>

We first isolate the geometric comparison used in the pressure estimate.
  It is a statement about two parallel lines and does not involve the equations.
  The self-contained midpoint argument below gives the comparison;
  its nonnegative formulation also permits unbounded intervals of weight zero.

Fix a unit vector $e$ and distinct $z \, z' in e^perp$. Write

$ x = z + s e \, wide y = z' + s' e \, wide lambda = \| z - z' \| > 0 \, wide h = s - s' . $

The restricted Newton kernel and its directional factor are

$ cal(K) \( s \, s' \) = frac(\( lambda^2 + h^2 \)^(\( 2 - n \) \/ 2), \( n - 2 \) \| bb(S)^(n - 1) \|) \, wide
  cal(D) \( s \, s' \) = frac(h^2, lambda^2 + h^2) . $

For a bounded interval $I = \( s_(-) \, s_(+) \)$, let

$ overline(cal(K))_I \( s' \) = frac(cal(K) \( s_(-) \, s' \) + cal(K) \( s_(+) \, s' \), 2) . $

For a bounded interval $J = \( s'_(-) \, s'_(+) \)$, define $overline(cal(K))_J \( s \)$ by averaging in the
  second variable. When $I$ and $J$ are bounded, write $m_I \, m_J$ for their midpoints and $d_0 = m_I -
  m_J$ for their midpoint separation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.3, 1.65), (7, 1.65), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b3b3b3"))))
  line((-0.3, 0), (7, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b3b3b3"))))
  line((2.4, 1.65), (6.2, 1.65), stroke: (thickness: 1.6pt, miter-limit: 10))
  line((0.8, 0), (3.8, 0), stroke: (thickness: 1.6pt, miter-limit: 10))
  line((2.4, 1.55), (2.4, 1.75), (6.2, 1.55), (6.2, 1.75), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.8, -0.1), (0.8, 0.1), (3.8, -0.1), (3.8, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.2, 1.78), [#text(size: 9pt)[$I$]], anchor: "south", padding: 0.1176cm)
  content((3.8, 0.13), [#text(size: 9pt)[$J$]], anchor: "south", padding: 0.1176cm)
  content((7, 1.65), [#text(size: 9pt)[$e$]], anchor: "west", padding: 0.1176cm)
  content((7, 0), [#text(size: 9pt)[$e$]], anchor: "west", padding: 0.1176cm)
  line((0.15, 0.08), (0.15, 1.57), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((0.15, 0.825), [#text(size: 9pt)[$lambda$]], anchor: "east", padding: 0.1176cm)
  line((1.6, 0), (1.6, -0.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.3, 1.65), (5.3, -0.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.6, -0.65), (5.3, -0.65), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((3.45, -0.65), [#text(size: 9pt)[$h=s-s'$]], anchor: "north", padding: 0.1176cm)
  line((1.6, 0), (5.3, 1.65), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((5.3, 1.65), radius: 0.07056, fill: black, stroke: none)
  circle((1.6, 0), radius: 0.07056, fill: black, stroke: none)
  content((5.3, 1.65), [#text(size: 9pt)[$x$]], anchor: "south-west", padding: 0.1176cm)
  content((1.6, 0), [#text(size: 9pt)[$y$]], anchor: "north-east", padding: 0.1176cm)
  line((2.3, 0), (2.3, 2.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((4.3, 1.65), (4.3, 2.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((2.3, 2.5), (4.3, 2.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((3.3, 2.5), [#text(size: 9pt)[$d_0=m_I-m_J$]], anchor: "south", padding: 0.1176cm)
  circle((4.3, 1.65), radius: 0.07056, fill: rgb("#ffffff"), stroke: none)
  circle((4.3, 1.65), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.3, 0), radius: 0.07056, fill: rgb("#ffffff"), stroke: none)
  circle((2.3, 0), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.3, 1.57), [#text(size: 9pt)[$m_I$]], anchor: "north-east", padding: 0.1176cm)
  content((2.3, -0.04), [#text(size: 9pt)[$m_J$]], anchor: "north-west", padding: 0.1176cm)
})],
  caption: [Figure 1: The transverse separation is $lambda$, whereas the kernel depends on the longitudinal difference $h$. The distribution of $h$ over $I times J$ is symmetric about the midpoint separation $d_0$, which need not be zero. ],
) <fig:interval-geometry>

#thm([Lemma 4.1.])[
  (Weighted interval comparison).  #emph[Let $n gt.eq 3$, $lambda > 0$, and let $I \,
    J subset bb(R)$ be nonempty open intervals, possibly unbounded.
    Let $c_I \, c_J gt.eq 0$, with $I$ bounded whenever $c_I > 0$ and $J$ bounded whenever $c_J > 0$. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ integral_(I times J) \( c_I + c_J \) cal(K) thin thin upright(d) s thin thin upright(d) s' lt.eq
   integral_(I times J) #scale(x: 180%, y: 180%)[\[] & c_I overline(cal(K))_I + c_J overline(cal(K))_J\
 & + #scale(x: 120%, y: 120%)[\(] \( n - 2 \) min \( c_I \, c_J \) cal(D) + \| c_I -
   c_J \| #scale(x: 120%, y: 120%)[\)] cal(K) #scale(x: 180%, y: 180%)[\]] thin thin upright(d) s thin thin
   upright(d) s' . $ <eq:interval-pair>]

 Every term is nonnegative and the inequality is understood for extended integrals.
   An endpoint term with coefficient zero is defined to be zero, without evaluating the endpoint average.]
] <lem:interval-pair>

#proof[
  If at most one coefficient is positive, then $\| c_I - c_J \| = c_I + c_J$,
    so the inequality holds pointwise before integration. Suppose now that both coefficients are positive.
    Both intervals are bounded and $lambda > 0$, so all integrals in the following calculation are finite.
  Integration by parts in the first variable gives
  $ integral_I \( cal(K) - overline(cal(K))_I \) thin thin upright(d) s = -
    integral_I \( s - m_I \) partial_s cal(K) thin thin upright(d) s . $
  The corresponding identity in the second variable, together with
  $ partial_s cal(K) = - \( n - 2 \) frac(h, lambda^2 + h^2) cal(K) \, wide
    partial_(s') cal(K) = \( n - 2 \) frac(h, lambda^2 + h^2) cal(K) \, $
  yields
  #[#set math.equation(numbering: n => "(4.2)")
   $ integral_(I times J) \( 2 cal(K) - overline(cal(K))_I - overline(cal(K))_J \) thin thin upright(d) s thin
     thin upright(d) s' = \( n - 2 \) integral_(I times J) frac(h^2 - d_0 h, lambda^2 + h^2) cal(K) thin thin
     upright(d) s thin thin upright(d) s' . $ <eq:midpoint-identity>]
  The sign of the midpoint term follows directly from interval overlap.
    If $L = \| I \|$ and $M = \| J \|$, the pushforward of $thin upright(d) s thin thin upright(d)
    s'$ under $\( s \, s' \) mapsto h = s - s'$ has density
  $ rho \( h \) = F \( \| h - d_0 \| \) \, wide F \( r \) = max {0 \, min {L \, M \, frac(L + M, 2) -
    r}} quad \( r gt.eq 0 \) . $
  Indeed, $rho \( h \) = \| I ∩ \( J + h \) \|$, the overlap length of two intervals whose centers are separated
    by $\| h - d_0 \|$. The function $F$ is nonincreasing. If $d_0 gt.eq 0$ and $h > 0$, then $\| h -
    d_0 \| lt.eq \| h + d_0 \|$, hence $rho \( h \) gt.eq rho \( - h \)$; for $d_0 lt.eq
    0$ the inequality is reversed. Pairing positive and negative $h$ against the odd function $h
    cal(K) \( h \) \/ \( lambda^2 + h^2 \)$ therefore proves
  $ d_0 integral_(I times J) frac(h, lambda^2 + h^2) cal(K) thin thin upright(d) s thin thin upright(d) s' gt.eq 0 . $
  Consequently the left side of (4.2) is at most $\( n - 2 \) integral_(I times J) cal(D) cal(K)$.
  Multiply this last estimate by $c = min \( c_I \, c_J \)$.
    Each individual endpoint defect is bounded above by $integral_(I times J) cal(K)$,
    because its subtracted endpoint average is nonnegative. The remaining coefficients are $c_I - c$ and $c_J -
    c$, whose sum is $\| c_I - c_J \|$. Adding these estimates and moving the finite endpoint terms to the right
    proves (4.1). ◻
]

The nonnegative formulation is essential when $n = 3$: even for $lambda > 0$,
  an integral of $cal(K)$ over an unbounded partner interval can diverge.
  Lemma 9 makes no subtraction on such an interval.

== 5 Pressure from weighted source layers <sec:pressure>

We retain the sources, potentials, interaction measure, and cutoffs defined above.
  In particular, $n gt.eq 3$, $A \, B > - 2$, $p \, q > 0$, and $p q > 1$.
  All constants in this section are uniform over admissible solution pairs.
  A subscript records permitted dependence on the auxiliary parameters;
  constants are always independent of the direction $e$.

#thm([Proposition 5.1.])[
  (Localized pressure).  #emph[Let $\( u \, v \)$ be a positive solution pair as in Theorem 1, with $n gt.eq 3$,
    $A \, B > - 2$, and $p q > 1$. For every $epsilon > 0$ there is a constant $C_epsilon$,
    depending only on the equation parameters and $epsilon$, such that
#[#set math.equation(numbering: n => "(5.1)")
 $ a W_f + b W_g lt.eq \( n - 2 \) integral_(bb(R)^n times bb(R)^n) w \( x \) D \( x \, y \) thin thin upright(d)
   pi \( x \, y \) + epsilon E + C_epsilon . $ <eq:pressure>]

]
] <prop:pressure>

The proof must accommodate the spatial factors at source-layer endpoints.
  We localize to short intervals, where those factors vary by at most $C delta d \( x \)$,
  and use caps of angular radius proportional to $d \( x \)$.
  The factor $d$ converts both errors into multiples of $E$, by $d w lt.eq C eta$ from (3.3).

=== 5.1 Angular localization <angular-localization>

Write $bb(E)_e$ and $bb(P)_e$ for expectation and probability under normalized surface measure on $bb(S)^(n - 1)$.
  Fix $0 < kappa < 1$ and $0 < delta < 1 \/ 4$, and put

$ ell \( x \) = delta d \( x \)^m wide \( d \( x \) > 0 \) . $

Choose a fixed nonnegative smooth function $psi$ on $\[ 0 \, oo \)$, equal to one near zero,
  supported in $\[ 0 \, 1 \]$, and bounded by one. For $0 < l lt.eq 1$ and any $theta in bb(S)^(n - 1)$, set

$ Z \( l \) = bb(E)_e psi \( \| e - theta \| \/ l \) . $

Rotational invariance makes this independent of $theta$. Chordal polar coordinates give

$ Z \( l \) = frac(\| bb(S)^(n - 2) \|, \| bb(S)^(n - 1) \|) l^(n - 1) integral_0^1 psi \( t \)
  t^(n - 2) \( 1 - l^2 t^2 \/ 4 \)^(\( n - 3 \) \/ 2) thin thin upright(d) t $

and therefore $c l^(n - 1) lt.eq Z \( l \) lt.eq C l^(n - 1)$ and $\| Z' \( l \) \| lt.eq C l^(n - 2)$.

Define the cap weight by

#[#set math.equation(numbering: n => "(5.2)")
 $ h_e \( x \) = w \( x \) frac(psi \( \| e - omega_x \| \/ \( kappa d \( x \) \) \), Z \( kappa d \( x \) \))
   quad \( 1 < \| x \| < 2 \) \, wide h_e \( x \) = 0 quad upright("otherwise") . $ <eq:cap-weight>]

Its exact normalization is $bb(E)_e h_e \( x \) = w \( x \)$. Differentiation, using (3.3), gives

#[#set math.equation(numbering: n => "(5.3)")
 $ 0 lt.eq h_e \( x \) lt.eq C_kappa d \( x \)^(N - n) \, wide \| nabla h_e \( x \) \| lt.eq
   C_kappa d \( x \)^(N - n - 1) quad \( 1 < \| x \| < 2 \) . $ <eq:cap-bounds>]

To check the second estimate, derivatives of the cap profile cost at most $C_kappa \/ d$,
  and differentiation of $Z \( kappa d \)^(- 1)$ costs the same relative factor.
  The profile is constant near its center, so the norm $\| e -
  omega_x \|$ causes no differentiability problem there. The weight extends continuously by zero across both
  boundary spheres: $w$ vanishes quadratically at $\| x \| = 1$, and $N - n > 1$ at $\| x \| = 2$.

As in Lemma 8, call a pair close if $\| x - y \| lt.eq ell \( z \)$ for at least one endpoint $z in { x \,
  y }$ with $d \( z \) > 0$. On its segment, $d$ is comparable to $d \( z \)$ because $d$ is $1$-Lipschitz and
  $ell \( z \) lt.eq delta d \( z \)$. Integrating the derivative bound across the pieces of this segment proves

#[#set math.equation(numbering: n => "(5.4)")
 $ \| h_e \( x \) - h_e \( y \) \| lt.eq C_kappa delta d \( z \)^(N - n - 1 + m) lt.eq
   C_kappa delta d \( z \)^N \, $ <eq:cap-oscillation>]

where $N - n - 1 + m = N + 2$. The interaction marginals bound the integral over close pairs by $C_kappa delta E$.
  On the complementary pairs, (5.3) and the tail bound (2.11) give, for example, the bound

$ C_kappa integral_(B_2) f \( x \) d \( x \)^(N - n) ell \( x \)^(2 - n) thin thin upright(d) x lt.eq
  C_(kappa \, delta) \, $

since $N - n - m \( n - 2 \) = 3 n + 8 > 0$; the other endpoint is identical with $g$ in place of $f$. We have proved

#[#set math.equation(numbering: n => "(5.5)")
 $ integral \| h_e \( x \) - h_e \( y \) \| thin thin upright(d) pi \( x \, y \) lt.eq C_kappa delta E +
   C_(kappa \, delta) . $ <eq:cap-mismatch>]

Moreover, on the support of $h_e \( x \)$,

$ \| D_e \( x \, y \) - D \( x \, y \) \| lt.eq 2 \| e - omega_x \| lt.eq 2 kappa d \( x \) . $

Averaging and using $d w lt.eq C eta$ gives

#[#set math.equation(numbering: n => "(5.6)")
 $ bb(E)_e integral h_e \( x \) D_e \( x \, y \) thin thin upright(d) pi \( x \, y \) lt.eq
   integral w \( x \) D \( x \, y \) thin thin upright(d) pi \( x \, y \) + C kappa E . $ <eq:cap-pressure>]

Here the constant $C$ is independent of $kappa \, delta$.

=== 5.2 Measurable intervals and their loss <measurable-intervals-and-their-loss>

For $0 < t < f \( x \)$, let $I$ be the connected component containing $x$ of the source layer ${ f >
  t }$ on the line $x + bb(R) e$. Assign it the weight

#[#set math.equation(numbering: n => "(5.7)")
 $ chi_I =
   cases(delim: "{", inf_I h_e \, & I upright(" bounded and ") \| I \| lt.eq 2 delta inf_I d \,, 0 \, &
   upright("otherwise") .) $ <eq:component-weight>]

Set $chi_f \( e \, x \, t \) = chi_I$. Define $chi_g \( e \, y \, t' \) =
  chi_J$ in the same way from ${ g > t' }$. In particular, $0 lt.eq chi_f \( e \, x \, t \) lt.eq
  h_e \( x \)$ and $0 lt.eq chi_g \( e \, y \, t' \) lt.eq h_e \( y \)$.

All these functions, as well as finite endpoints, are jointly measurable.
  Indeed, with the convention $f \( 0 \) = 0$, the set ${ \( x \, t \) : x eq.not 0 \, med
  0 < t < f \( x \) }$ is open. The forward exit distance of its line component exceeds $r gt.eq
  0$ exactly when the compact segment ${ x + s e : 0 lt.eq s lt.eq r }$ is contained in the layer.
  This is an open condition in $\( e \, x \, t \)$; the backward exit distance is treated in the same way.
  Their sum, including the value $+ oo$, is the measurable component length.
  The infima in (5.7) can be taken over rational offsets between these two exits,
  since $d$ and $h_e$ are continuous. This proves the assertion, including measurability in $e$,
  without a choice of coordinates on the varying spaces $e^perp$.

For each direction define the nonnegative losses

$ L_f \( e \) & = integral_(bb(R)^n) u \( x \) integral_0^(f \( x \)) \( h_e \( x \) - chi_f \( e \, x \, t \) \)
  thin thin upright(d) t thin thin upright(d) x \,\
L_g \( e \) & = integral_(bb(R)^n) v \( y \) integral_0^(g \( y \)) \( h_e \( y \) - chi_g \( e \, y \, t' \) \)
  thin thin upright(d) t' thin thin upright(d) y . $

They are finite for each fixed solution and direction, since $h_e$ is bounded and supported on the compact annulus
  $1 lt.eq \| x \| lt.eq 2$. This finiteness does not assert a uniform bound on those marginals.

#thm([Lemma 5.2.])[
  (Averaged layer loss).  #emph[For the cap weights (5.2) and component weights (5.7),
    under the hypotheses of Proposition 10, every $P gt.eq 1$ satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ bb(E)_e #scale(x: 120%, y: 120%)[\(] L_f \( e \) + L_g \( e \) #scale(x: 120%, y: 120%)[\)] lt.eq
   #scale(x: 120%, y: 120%)[\(] C_kappa delta + C_(kappa \, delta) P^(- 1) #scale(x: 120%, y: 120%)[\)] E +
   C P . $ <eq:layer-loss>]

 The constants in the relative coefficient are independent of $P$,
   and the last constant is independent of $kappa \, delta \, P$.]
] <lem:layer-loss>

#proof[
  We prove the assertion for $f \, u$; the same argument applies to $g \, v$. Only $1 < \| x \| < 2$ contributes.
    Fix such an $x$ and write $d = d \( x \)$ and $ell = delta d^m$.
    If the component $I$ at level $t$ has $\| I \| lt.eq ell$, then
  $ inf_I d gt.eq d - ell gt.eq \( 1 - delta \) d \, wide \| I \| lt.eq delta d lt.eq 2 delta inf_I d . $
  It therefore passes the length condition in (5.7). Estimate (5.4) shows that its entire loss of weight is at
    most $C_kappa delta d^N$.
  If $\| I \| > ell$, at least one of its two portions from $x$ contains a segment of length $ell \/ 2$.
    Let $F$ be the set of directions whose forward segment of that length lies in ${ f > t }$.
    Polar integration centered at $x$ gives
  $ integral_(B_(ell \/ 2) \( x \)) f gt.eq frac(\| bb(S)^(n - 1) \|, n) thin t \( ell \/ 2 \)^n bb(P)_e \( F \) . $
  The long-interval event is contained in $F union \( - F \)$.
    Antipodal symmetry, followed by the source bound in (2.11), yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(P)_e { \| I \| > ell } lt.eq frac(C, t ell^n) integral_(B_ell \( x \)) f lt.eq
     frac(C, t ell^n) . $ <eq:long-interval>]
  Here $B_ell \( x \) subset B_4$; only its containment in a fixed centered ball is used.
  For $t gt.eq P d^(- k)$, the expected loss on long intervals is bounded using the supremum of $h_e \( x \)$
    times the probability in (5.9). No independence is needed. The result is
  $ C_kappa d^(N - n) thin C delta^(- n) P^(- 1) d^(k - m n) = C_(kappa \, delta) P^(- 1) d^N \, $
  because $k = n \( m + 1 \)$. Integrating the short- and long-interval estimates over these high levels,
    and then against $u \( x \) thin thin upright(d) x$, gives at most $#scale(x: 120%, y: 120%)[\(] C_kappa
    delta + C_(kappa \, delta) P^(- 1) #scale(x: 120%, y: 120%)[\)] E_f$.
  For the remaining levels use the exact cap normalization:
  $ integral_0^(min { f \( x \) \, P d^(- k) }) bb(E)_e \( h_e \( x \) - chi_f \( e \, x \, t \) \) thin thin
    upright(d) t lt.eq P d^(- k) w \( x \) lt.eq C P d^(N - 1 - k) lt.eq C P . $
  The last exponent equals $n + 1$. Integration against $u$ is bounded by $C P$ by (2.11).
    Repeating the proof for $g \, v$ proves (5.8). ◻
]

=== 5.3 Weighted endpoints and nonnegative integration <weighted-endpoints-and-nonnegative-integration>

Suppose $chi_I > 0$ for an $f$-layer at level $t$. Then $I$ is bounded and $h_e gt.eq chi_I > 0$ on it.
  Continuity gives the same inequality at its two endpoints $x_(-) \, x_(+)$,
  so they lie in the annulus $1 < \| x \| < 2$. Continuity of $f$ there and maximality of the component imply

$ f \( x_(-) \) = f \( x_(+) \) = t \, wide u \( x_plus.minus \) = t^(1 \/ q) \| x_plus.minus \|^(- B \/ q) . $

For any $x in I$, (5.7) gives $\| x_plus.minus - x \| lt.eq 2 delta d \( x \)$.
  The positive radial function $\| x \|^(- B \/ q)$ has a bounded relative Lipschitz constant on $1 lt.eq \| x \|
  lt.eq 2$. Thus, with $overline(u)_I = \( u \( x_(-) \) + u \( x_(+) \) \) \/ 2$, we have

#[#set math.equation(numbering: n => "(5.10)")
 $ lr(|overline(u)_I - \( t \/ \| x \|^B \)^(1 \/ q)|) lt.eq C delta d \( x \) \( t \/ \| x \|^B \)^(1 \/ q) lt.eq
   C delta d \( x \) u \( x \) . $ <eq:weighted-endpoints>]

The same statement holds for a positive-weight $g$-component $J$,
  with endpoint average $overline(v)_J$ and ideal value $\( t' \/ \| y \|^A \)^(1 \/ p)$.
  When a component weight is zero, every product involving its endpoint average is defined as zero without
  selecting or evaluating endpoints.

Fix a direction $e$ and levels $t \, t' > 0$. On two distinct parallel lines $x = z + s e$ and $y = z' + s' e$,
  apply Lemma 9 to each pair of layer components $I \, J$ with $c_I = chi_I$ and $c_J = chi_J$.
  Since $min \( chi_I \, chi_J \) lt.eq h_e \( x \)$, it gives

#[#set math.equation(numbering: n => "(5.11)")
 $ integral_(I times J) \( chi_I + chi_J \) cal(K) lt.eq integral_(I times J) #scale(x: 180%, y: 180%)[\[] & chi_I
   overline(cal(K))_I + chi_J overline(cal(K))_J\
 & + #scale(x: 120%, y: 120%)[\(] \( n - 2 \) h_e \( x \) D_e \( x \, y \) + \| chi_I -
   chi_J \| #scale(x: 120%, y: 120%)[\)] cal(K) #scale(x: 180%, y: 180%)[\]] \, $ <eq:layer-pair>]

where the measures are $thin upright(d) s thin thin upright(d) s'$.
  At this stage all terms are nonnegative extended integrals.

Each open line layer has at most countably many components.
  Sum (5.11) over the two sets of components, and integrate in $z \, z' in e^perp$ and $t \, t' > 0$.
  The summed functions are the jointly measurable functions described above; hence Tonelli’s Theorem applies.
  The coincident-line set $z = z'$ is null and may be omitted.
  By the potential identities (2.10), the two terms on the left become

$ U_f \( e \) & = integral integral_0^(f \( x \)) chi_f \( e \, x \, t \) u \( x \) thin thin upright(d) t thin
  thin upright(d) x \,\
U_g \( e \) & = integral integral_0^(g \( y \)) chi_g \( e \, y \, t' \) v \( y \) thin thin upright(d) t' thin
  thin upright(d) y . $

Similarly, the endpoint terms become

$ V_f \( e \) & = integral integral_0^(f \( x \)) chi_f \( e \, x \, t \) overline(u)_I thin thin upright(d) t
  thin thin upright(d) x \,\
V_g \( e \) & = integral integral_0^(g \( y \)) chi_g \( e \, y \, t' \) overline(v)_J thin thin upright(d) t'
  thin thin upright(d) y . $

For example, integrating $overline(cal(K))_I$ over all $\( y \, t' \)$ layers recovers the average of $K *
  g$ at $x_(-) \, x_(+)$. For each selected endpoint the omitted $y$-points comprise one affine line,
  which is Lebesgue null in $bb(R)^n$, so the recovered potential is exactly $overline(u)_I$.

We now verify finiteness before any subtraction. Set

$ H_f \( e \) = integral h_e \( x \) f \( x \) u \( x \) thin thin upright(d) x \, wide H_g \( e \) =
  integral h_e \( y \) g \( y \) v \( y \) thin thin upright(d) y . $

Both are finite for every fixed solution and direction because the cap weights are bounded and supported on a
  compact annulus. We have $U_f lt.eq H_f$, $U_g lt.eq H_g$, while (5.10) gives $V_f lt.eq C H_f$ and $V_g lt.eq
  C H_g$. The integrated pressure term is at most $\( n - 2 \) H_f$. Finally,

$ \| chi_f \( e \, x \, t \) - chi_g \( e \, y \, t' \) \| lt.eq h_e \( x \) + h_e \( y \) \, $

so its integrated contribution is at most $H_f + H_g$, again by Tonelli and the two potential marginals.
  All the integrated terms are therefore finite, even when $n = 3$.
  In particular, we have never subtracted the possibly infinite integrals over an unbounded line component.

It is now legitimate to subtract $V_f + V_g$. The sharper mismatch bound

$ \| chi_f \( e \, x \, t \) - chi_g \( e \, y \, t' \) \| lt.eq  & \| h_e \( x \) - h_e \( y \) \|\
 & + \( h_e \( x \) - chi_f \( e \, x \, t \) \) + \( h_e \( y \) - chi_g \( e \, y \, t' \) \) $

shows that the resulting finite quantity

$ S_e =  & integral integral_0^(f \( x \)) chi_f \( e \, x \, t \) \( u \( x \) - overline(u)_I \) thin thin
  upright(d) t thin thin upright(d) x\
 & + integral integral_0^(g \( y \)) chi_g \( e \, y \, t' \) \( v \( y \) - overline(v)_J \) thin thin upright(d)
   t' thin thin upright(d) y $

satisfies

#[#set math.equation(numbering: n => "(5.12)")
 $ S_e lt.eq \( n - 2 \) integral h_e \( x \) D_e \( x \, y \) thin thin upright(d) pi \( x \, y \) +
   integral \| h_e \( x \) - h_e \( y \) \| thin thin upright(d) pi \( x \, y \) + L_f \( e \) +
   L_g \( e \) . $ <eq:integrated-pressure>]

The quantity $S_e$ need not be nonnegative; only the preceding unsubtracted expressions were treated with
  Tonelli’s Theorem.

=== 5.4 Recovery of the cutoff pressure <recovery-of-the-cutoff-pressure>

The exact weighted layer identity is

#[#set math.equation(numbering: n => "(5.13)")
 $ integral_0^(f \( x \)) [u \( x \) - \( t \/ \| x \|^B \)^(1 \/ q)] thin thin upright(d) t =
   frac(f \( x \) u \( x \), q + 1) = a f \( x \) u \( x \) wide \( x eq.not 0 \) . $ <eq:weighted-layer-identity>]

Indeed, the integral of $\( t \/ \| x \|^B \)^(1 \/ q)$ equals $q f \( x \) u \( x \) \/ \( q + 1 \)$.
  The analogous identity for $g$ has coefficient $b = 1 \/ \( p + 1 \)$.
  To compare (5.13) with $S_e$, set $tau = \( t \/ \| x \|^B \)^(1 \/ q)$. Since $0 lt.eq tau lt.eq u \( x \)$,

$ & h_e \( x \) \( u \( x \) - tau \) - chi_f \( e \, x \, t \) \( u \( x \) - overline(u)_I \)\
 & quad = \( h_e \( x \) - chi_f \( e \, x \, t \) \) \( u \( x \) - tau \) +
   chi_f \( e \, x \, t \) \( overline(u)_I - tau \)\
 & quad lt.eq \( h_e \( x \) - chi_f \( e \, x \, t \) \) u \( x \) + C delta d \( x \) h_e \( x \) u \( x \) \, $

by (5.10); the zero-weight case has the same bound under the convention already stated.
  Integrating and treating the $g$-layer in the same way gives

#[#set math.equation(numbering: n => "(5.14)")
 $ a H_f \( e \) + b H_g \( e \) lt.eq  & S_e + L_f \( e \) + L_g \( e \)\
 & + C delta integral d \( x \) h_e \( x \) f \( x \) u \( x \) thin thin upright(d) x\
 & + C delta integral d \( y \) h_e \( y \) g \( y \) v \( y \) thin thin upright(d) y . $ <eq:pressure-recovery>]

#proof[
  Combine (5.12) and (5.14), and average over $e$. This incurs two copies of $L_f + L_g$.
    The identities $bb(E)_e h_e = w$ and $d w lt.eq C eta$, together with (5.5), (5.6), and Lemma 11, give
  $ a W_f + b W_g lt.eq  & \( n - 2 \) integral w \( x \) D \( x \, y \) thin thin upright(d) pi \( x \, y \)\
 & + #scale(x: 120%, y: 120%)[\(] C kappa + C_kappa delta +
   C_(kappa \, delta) P^(- 1) #scale(x: 120%, y: 120%)[\)] E + C_(kappa \, delta \, P) . $
  The constant multiplying $kappa$ is independent of all three auxiliary parameters;
    the one multiplying $delta$ is independent of $delta \, P$;
    and the one multiplying $P^(- 1)$ is independent of $P$. First choose $kappa$ sufficiently small,
    next $delta$ sufficiently small, and finally $P$ sufficiently large,
    so that the relative coefficient is at most $epsilon$. The remaining additive constant is finite and uniform
    over the solution pair. This proves (5.1). ◻
]

== 6 The energy bound and the scaling contradiction <sec:conclusion>

We now close the argument. Throughout this section the reductions of Section 2 have been made, so $n gt.eq 3$,
  $A \, B > - 2$, $p q > 1$, and the gap $gamma$ in Equation (2.12) is positive.

#thm([Proposition 6.1.])[
  (Uniform local energy bound).  #emph[For the fixed equation parameters there is a constant $C$,
    independent of the solution pair, such that
#[#set math.equation(numbering: n => "(6.1)")
 $ integral_(B_1) #scale(x: 120%, y: 120%)[\(] \| x \|^B u^(q + 1) + \| x \|^A v^(p + 1)
   #scale(x: 120%, y: 120%)[\)] thin upright(d) x lt.eq E lt.eq C . $ <eq:energy-bound>]

]
] <prop:energy>

#proof[
  Write
  $ T = integral w \( x \) D \( x \, y \) thin upright(d) pi \( x \, y \) \, wide Q =
    integral #scale(x: 120%, y: 120%)[\(] Phi \( x \, y \) - eta \( x \) +
    w \( x \) D \( x \, y \) #scale(x: 120%, y: 120%)[\)] thin upright(d) pi \( x \, y \) . $
  Lemma 8 gives, for every $epsilon > 0$,
  #[#set math.equation(numbering: n => "(6.2)")
   $ \| Q \| + \| E_f - E_g \| lt.eq epsilon E + C_epsilon . $ <eq:closing-errors>]
  The virial identity, Equation (3.4), is therefore exactly
  #[#set math.equation(numbering: n => "(6.3)")
   $ c_1 E_f + c_2 E_g = a W_f + b W_g - \( n - 2 \) T + \( n - 2 \) Q \,\
c_1 = a \( n + B \) - \( n - 2 \) \, quad c_2 = b \( n + A \) . $ <eq:closing-identity>]
  Proposition 10 bounds the first three terms on the right from above by $epsilon E + C_epsilon$. Consequently
  $ c_1 E_f + c_2 E_g lt.eq \( n - 1 \) epsilon E + C_epsilon . $
  Here and below the additive constant may change, but remains independent of the solution. Since $c_1 + c_2 = gamma$,
  $ c_1 E_f + c_2 E_g = gamma / 2 E + frac(c_1 - c_2, 2) \( E_f - E_g \) . $
  Using Equation (6.2), we obtain
  $ gamma / 2 E lt.eq (n - 1 + frac(\| c_1 - c_2 \|, 2)) epsilon E + C_epsilon . $
  Choose $epsilon$ so that the coefficient of $E$ on the right is at most $gamma \/ 4$.
    This proves the universal bound on $E$. The first inequality in Equation (6.1) follows from $eta =
    1$ on $B_1$ and the nonnegativity of the energy densities. ◻
]

#proof[
  The elementary reductions in Section 2 already exclude $n = 2$, weights at most $- 2$, and $p q lt.eq 1$.
    Suppose a solution exists in the remaining range. For every $R > 0$, the pair
  $ u_R \( x \) = R^alpha u \( R x \) \, wide v_R \( x \) = R^beta v \( R x \) $
  is an admissible solution with the same equation parameters.
    Proposition 12 applies to every such pair with the same constant. Both energy terms have the same dilation exponent:
  $ & integral_(B_1) #scale(x: 120%, y: 120%)[\(] \| x \|^B u_R \( x \)^(q + 1) + \| x \|^A v_R \( x \)^(p + 1)
    #scale(x: 120%, y: 120%)[\)] thin upright(d) x\
 & wide  = R^(alpha + beta + 2 - n) integral_(B_R) #scale(x: 120%, y: 120%)[\(] \| x \|^B u \( x \)^(q + 1) + \|
   x \|^A v \( x \)^(p + 1) #scale(x: 120%, y: 120%)[\)] thin upright(d) x . $
  For $R gt.eq 1$, the last integral is at least its fixed, strictly positive value on $B_1$.
    It is finite on every bounded ball. Equation (2.12) and $1 - a - b > 0$ give $alpha + beta + 2 - n > 0$,
    so the displayed expression tends to infinity as $R arrow.r oo$. This contradicts the uniform bound. ◻
]

#thm([Corollary 6.2.])[
  (Hénon–Lane–Emden classification; Phan’s Conjecture C).  #emph[Let $n gt.eq 3$ be an integer, let $p \, q > 0$,
    and let $A \, B > - 2$. There is no pair
$ u \, v in C^2 \( bb(R)^n \\ { 0 } \) ∩ C \( bb(R)^n \) \, wide u \( x \) > 0 \, quad
  v \( x \) > 0 quad \( x in bb(R)^n \) \, $

 satisfying Equation (1.1) at every $x eq.not 0$ if and only if
$ frac(n + A, p + 1) + frac(n + B, q + 1) > n - 2 . $

 When the reverse weak inequality holds, such a pair exists and can be chosen radial.]
] <cor:phan-classification>

#proof[
  The strict inequality gives nonexistence by Theorem 1. Suppose instead that
  $ frac(n + A, p + 1) + frac(n + B, q + 1) lt.eq n - 2 . $
  Since $n + A \, n + B > n - 2 > 0$,
  $ frac(1, p + 1) + frac(1, q + 1) < frac(1, n - 2) (frac(n + A, p + 1) + frac(n + B, q + 1)) lt.eq 1 . $
  Thus $p q > 1$, because $1 - 1 \/ \( p + 1 \) - 1 \/ \( q + 1 \) = \( p q - 1 \) \/ \( \( p + 1 \) \( q + 1 \) \)$.
  We now apply Proposition B of Phan #cite(label("Phan")), which states the radial ground-state theorem of
    Bidaut-Véron and Giacomini #cite(label("BidautVeronGiacomini2010")) Theorem 1.4(i) for the same equation and
    solution class, with $n gt.eq 3$, $A \, B > - 2$, and $p \, q > 0$.
    Its radial existence region is exactly the displayed reverse weak inequality,
    including equality on the critical hyperbola. In the original Hamiltonian notation, the substitution is $N =
    n$, $a = A$, $b = B$, $delta = p$, and $mu = q$, with both differential-operator exponents equal to $2$;
    the preceding calculation verifies the standing superlinearity condition $D = delta mu - 1 > 0$.
  The original ground states have positive radial profiles $U \, V$ on $\( 0 \, oo \)$,
    classical there and continuous at zero. This origin regularity gives the strict positivity at zero required
    here: the radial equation makes $r^(n - 1) U' \( r \)$ strictly decreasing.
    Its limit as $r arrow.b 0$ must be zero: a nonzero or infinite limit would contradict continuity of $U$ at
    zero after integration against $r^(1 - n)$. Hence $U' \( r \) < 0$, and $U \( 0 \) gt.eq
    U \( r \) > 0$ for every $r > 0$. The same argument applies to $V$.
    Thus $u \( x \) = U \( \| x \| \)$ and $v \( x \) = V \( \| x \| \)$ belong to the stated solution class and
    are strictly positive on all of $bb(R)^n$. Radial existence in this class rules out unrestricted nonexistence
    under the reverse weak inequality, completing the equivalence. ◻
]

This classification is a consequence of Theorem 1 joined to the cited radial existence theorem,
  rather than a new construction of ground states. The complementary existence assertion is restricted to $n gt.eq
  3$ and $A \, B > - 2$; the broader nonexistence statement of Theorem 1 is unchanged.

#bibliography("refs.bib", style: "ieee", title: [References])
