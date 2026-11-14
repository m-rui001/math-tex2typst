#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Global classical solutions of the three-dimensional \
relativistic Vlasov--Maxwell system]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The relativistic Vlasov–Maxwell system describes a collisionless plasma whose particles move under their
  self-consistent electromagnetic field. For momentum $v in bb(R)^3$, write

$ q \( v \) = sqrt(1 + \| v \|^2) \, wide u \( v \) = frac(v, q \( v \)) . $

The particle density is $f = f \( t \, x \, v \) gt.eq 0$; the electric and magnetic fields are $E =
  E \( t \, x \)$ and $B = B \( t \, x \)$. We use the one-species normalization

#[#set math.equation(numbering: n => "(1.1)")
 $ partial_t f + u \( v \) dot.op nabla_x f + \( E + u \( v \) times B \) dot.op nabla_v f & = 0 \,\
partial_t E - nabla_x times B & = - j_f \, & partial_t B + nabla_x times E & = 0 \,\
nabla_x dot.op E & = rho_f \, & nabla_x dot.op B & = 0 \, $ <eq:rvm>]

where

$ rho_f \( t \, x \) = integral_(bb(R)^3) f \( t \, x \, v \) thin d v \, wide j_f \( t \, x \) =
  integral_(bb(R)^3) u \( v \) f \( t \, x \, v \) thin d v . $

There is no background charge.

A #emph[smooth admissible datum] is a triple $\( f_0 \, E_0 \, B_0 \)$ satisfying

#[#set math.equation(numbering: n => "(1.2)")
 $ f_0 in C_c^oo \( bb(R)_x^3 times bb(R)_v^3 \) \, wide f_0 gt.eq 0 \,\
E_0 \, B_0 in C_b^oo \( bb(R)^3 \; bb(R)^3 \) ∩ L^2 \( bb(R)^3 \; bb(R)^3 \) \,\
nabla_x dot.op E_0 = rho_(f_0) \, wide nabla_x dot.op B_0 = 0 . $ <eq:data>]

Here $C_b^oo$ means that every spatial derivative is bounded.
  A #emph[classical solution] on $\[ 0 \, T \)$ is a $C^1$ triple solving (1.1) pointwise, with $E \,
  B in C \( \[ 0 \, T \) \; L_x^2 \)$, such that the support of $f$ in $\( x \, v \)$ is contained in a compact
  set on every compact time subinterval.

#thm([Theorem 1.1.])[
  #emph[Every smooth admissible datum (1.2) generates a unique global classical solution of (1.1).
    For every finite $T$, this solution satisfies
$ f in C^oo \( \[ 0 \, T \] times bb(R)_x^3 times bb(R)_v^3 \) \, wide E \,
  B in C^oo \( \[ 0 \, T \] times bb(R)_x^3 \; bb(R)^3 \) \, $

 and $f$ has compact phase-space support on $\[ 0 \, T \]$. The two divergence constraints hold for all time.]
] <thm:global>

Theorem 1 resolves the large-data global classical regularity problem for this one-species model in three spatial
  and three momentum dimensions. The data have no size or symmetry restriction.
  The field assumptions allow a nonzero total charge and its Coulomb tail;
  they do not require square-integrability of all field derivatives.
  The momentum support bound is on each finite time interval and may grow with that interval.

=== 1.1 Historical context <historical-context>

The distinction between weak existence and classical regularity has shaped the Cauchy problem for Vlasov–Maxwell.
  Wollman established local existence and uniqueness for classical solutions #cite(label("Wollman1984")).
  DiPerna and Lions developed global weak existence for large data #cite(label("DiPernaLions1989"));
  a direct formulation for the relativistic one-species system is given by Rein #cite(label("Rein2004Weak")).
  These weak existence results do not furnish the regularity and uniqueness asserted in Theorem 1.

For classical solutions, Glassey and Strauss identified bounded momentum support as a continuation
  condition #cite(label("GlasseyStrauss1986")) and proved global existence for initially dilute
  plasmas #cite(label("GlasseyStrauss1987")). Global classical existence was also established by Glassey and
  Schaeffer in dimensional reductions: one and one-half dimensions, two and one-half dimensions,
  and the planar problem #cite(label("GlasseySchaeffer1990OneHalf")) #cite(label("GlasseySchaeffer1997TwoHalf"))
  #cite(label("GlasseySchaeffer1998PlanarI")) #cite(label("GlasseySchaeffer1998PlanarII")).
  For the spherically symmetric electrostatic reduction, Glassey and Schaeffer proved global classical existence
  for the repulsive relativistic Vlasov–Poisson system #cite(label("GlasseySchaeffer1985Symmetric")).
  Rein proved persistence of global existence under small perturbations of suitably decaying global reference
  solutions, including nearly symmetric configurations #cite(label("Rein1990Generic")).
  These results use restrictions on size, dimension, or the reference configuration.

The continuation theory also led to new methods. Klainerman and Staffilani gave a Fourier-based proof of the
  bounded-momentum criterion #cite(label("KlainermanStaffilani2002")), while Bouchut,
  Golse and Pallard gave a physical-space proof using a division lemma for wave
  kernels #cite(label("BouchutGolsePallard2003")). Luk and Strain showed that it suffices to control the momentum
  support after projection onto a fixed two-dimensional plane #cite(label("LukStrain2014Continuation"))
  Theorem 1.2. Moment and spatial-density conditions for continuation were developed by
  Pallard #cite(label("Pallard2005")) #cite(label("Pallard2015Refined")),
  Sospedra–Alfonso and Illner #cite(label("SospedraAlfonsoIllner2010")),
  and Luk and Strain #cite(label("LukStrain2016Moments")). We use the Glassey–Strauss criterion as stated in Luk
  and Strain #cite(label("LukStrain2014Continuation")) Theorem 1.1;
  Section 10.5 verifies its hypotheses for the normalization and initial field class considered here.

Small-data theory also developed beyond compact momentum support.
  Schaeffer allowed a rapidly decaying momentum tail, retaining compact spatial support and a suitable smallness
  condition #cite(label("Schaeffer2004")). Using a vector-field method with modified commutators,
  Bigorgne obtained global existence and sharp asymptotic estimates under weighted smallness
  assumptions #cite(label("Bigorgne2020")). His result permits nonzero charge and noncompact particle data.
  Wang proved a small-data result without compact support using vector-field and Fourier
  methods #cite(label("Wang2022SmallData")). Wei and Yang allow arbitrarily large Maxwell fields with suitable
  spatial decay while requiring a sufficiently small weighted particle density #cite(label("WeiYang2021")).
  Bigorgne subsequently proved global existence and modified scattering with a small distribution function and a
  large Maxwell field #cite(label("Bigorgne2025SmallDistribution")).
  These theorems preserve a particle-smallness hypothesis. By prescribing asymptotic data and choosing a
  sufficiently late starting time, Bigorgne also constructs particular global solutions with large particle and
  field norms #cite(label("Bigorgne2023ScatteringMap")). This construction does not prescribe arbitrary Cauchy data.

Wang’s July 2026 two-paper treatment establishes global existence for large cylindrically symmetric
  data #cite(label("Wang2026I")) #cite(label("Wang2026II")).
  The first paper develops an iterative smoothing construction and the second supplies pointwise estimates.
  Their Theorem 1.1 assumes $H^s$ fields, $s gt.eq 6$, a weighted $H^s$ particle density,
  and covariance of the data under rotations about a fixed axis.
  It allows localized noncompact particle data and has no smallness requirement.
  The theorem here instead concerns arbitrary compatible compactly supported particle data, without symmetry,
  and fields in the class (1.2). Thus the two data classes should not be identified.

The formulas used below have several classical antecedents.
  The retarded-field representation goes back to Glassey and Strauss #cite(label("GlasseyStrauss1986")).
  Luk and Strain organize its most singular terms using electromagnetic components controlled by energy flux
  through light cones #cite(label("LukStrain2014Continuation")) Proposition 2.2 and Section 3;
  Pallard also uses the orthogonality of the acceleration kernel to the cone’s spatial
  normal #cite(label("Pallard2015Refined")) Lemma 2.1 and Section 2.3.
  The change from retarded phase points to initial particle labels appears in
  Lazarovici #cite(label("Lazarovici2016")) Lemma 9.2. The moving-characteristic cone change of variables is used
  by Pallard #cite(label("Pallard2005")); its proof is also given by Luk and Strain
  #cite(label("LukStrain2014Continuation")) Proposition 5.2. We derive the required formulas in the normalization (1.1).

=== 1.2 Proof strategy <proof-strategy>

The central estimate concerns the #emph[signed] change of a particle’s momentum.
  Along a characteristic $\( X \( t \) \, V_X \( t \) \)$, with $X' = u \( V_X \)$ and $V'_X = E \( t \, X \) +
  u \( V_X \) times B \( t \, X \)$, it is the impulse

$ V_X \( t_2 \) - V_X \( t_1 \) = integral_(t_1)^(t_2) #scale(x: 120%, y: 120%)[\(] E \( t \, X \( t \) \) +
  u \( V_X \( t \) \) times B \( t \, X \( t \) \) #scale(x: 120%, y: 120%)[\)] thin d t . $

We take the norm after integration. Section 2 states the estimate precisely and shows that it places a lower bound
  on the time needed to double the largest particle momentum.
  These lower bounds have a divergent sum, which rules out unbounded momentum support in finite time and allows
  the continuation criterion to apply.

To estimate the impulse, we follow source particles to their intersections with the backward light cone of the
  particle receiving the force. We divide the source contribution into ranges of momentum, distance,
  and angles between the source velocity, receiver velocity, and light ray.
  Energy flux through the cone and bounds on the time that source particles spend in these ranges give the direct
  force estimates of Sections 4 and 5. At receiver energy comparable to $w$,
  the absolute-force bound has an extra factor $sqrt(w)$ compared with the signed estimate we need.
  The loss occurs when the source velocity is much closer to the light-ray direction than the receiver velocity is.

In this narrow angular region, we integrate the retarded force along a source trajectory before taking absolute
  values. The identity in Section 6 combines the part without source acceleration with the part containing it.
  The former cancels a term generated by differentiating the cone geometry.
  The force is thereby written as a total derivative plus less singular bulk terms,
  one of which contains the receiver’s acceleration. Expressing that acceleration through $V'_X$ turns this into
  an error proportional to the receiver force. The proof must control its coefficient as well as the other
  integration-by-parts errors.

We use the signed identity twice, under an assumed bound on all signed momentum increments.
  First, after projection perpendicular to a particle’s momentum,
  it bounds the number of direction changes of a prescribed angular size.
  This step uses only the preliminary occupation and direct force estimates.
  When both source and receiver momenta are large, direction control gives a stronger occupation bound at
  intermediate relative angles: between changes of direction,
  relative motion makes a monotone crossing of the region contributing to a fixed range.
  Section 7 proves the direction bound before using it to improve occupation.

For the second use, Section 8 selects only those ranges whose direct force estimates exceed a summable threshold.
  The other ranges already satisfy the required bound. On the selected ranges,
  the coefficient multiplying the receiver force is at most a constant times $w^(- 1 \/ 2)$ after summation.
  This exactly compensates for the $sqrt(w)$ loss in the available absolute-force bound.
  The occupation improvement need only hold in the stated angular window:
  the selection inequalities force any possible obstruction to this coefficient bound into that window,
  where improved occupation rules it out. This yields an impulse estimate with a time weight that vanishes at the
  interval endpoints. Section 9 restores the short endpoint intervals using the assumed signed bound,
  obtains a strict improvement, and closes the bootstrap by continuity.

=== 1.3 Organization <organization>

Section 2 states the signed estimate and deduces Theorem 1 from it and a continuation result.
  Sections 3–5 derive the retarded force, occupation estimates and direct bounds.
  Section 6 proves the signed cancellation; Section 7 bounds direction changes and improves occupation.
  Section 8 estimates the selected signed force, and Section 9 closes the bootstrap.
  Section 10 proves local existence, uniqueness, smooth persistence and the field modification needed to apply the
  bounded-momentum continuation theorem to (1.2).

== 2 The signed momentum estimate and its consequence <sec:setup>

Our analytic goal is an estimate on momentum increments along characteristics.
  We state it first and explain why its logarithmic time scale excludes finite-time breakdown.
  Its proof occupies the central sections of the paper.

Fix a finite horizon $T_0 > 0$ and a compact interval $\[ 0 \, t_(*) \] subset \[ 0 \, T_max \)$,
  with $t_(*) lt.eq T_0$, of a classical solution. A characteristic with initial label
  $z = \( y_(upright("in")) \, v_(upright("in")) \)$ solves

$ Y' \( s \, z \) = u \( V \( s \, z \) \) \, wide V' \( s \, z \) = E \( s \, Y \( s \, z \) \) +
  u \( V \( s \, z \) \) times B \( s \, Y \( s \, z \) \) . $

It is #emph[supported] if $z in "supp" f_0$. A distinguished supported characteristic,
  along which we estimate the force, is written $\( X \( t \) \, V_X \( t \) \)$ and called the #emph[receiver].
  We write

$ a \( t \) = u \( V_X \( t \) \) \, quad q_X \( t \) = q \( V_X \( t \) \) \, quad K \( t \) = V'_X \( t \) . $

The signed increment is the vector impulse

$ V_X \( t_2 \) - V_X \( t_1 \) = integral_(t_1)^(t_2) K \( t \) thin d t . $

Source characteristics continue to use the letters $Y \, V \, u$.

For nonempty $"supp" f_0$, choose a dyadic number $P$ such that

#[#set math.equation(numbering: n => "(2.1)")
 $ P gt.eq 1024 max_(0 lt.eq t lt.eq t_(*)\
z in "supp" f_0) q \( V \( t \, z \) \) \, wide L = log \( 2 + P \) \, wide S \( w \) = frac(P^2 L, w) . $ <eq:P-range>]

A dyadic number is a power of two. Receiver scales are $w = 2^k$, $k gt.eq 0$.
  In every nonempty range $w \/ 8 lt.eq q_X lt.eq 8 w$ one has $w lt.eq P$.

#thm([Proposition 2.1.])[
  (Signed momentum increments).  #emph[For each smooth admissible datum and finite $T_0$,
    there are constants $M \, A gt.eq 1$ and $P_0$ with the following property.
    On every compact classical solution interval $\[ 0 \, t_(*) \]$ as above, for every dyadic $P gt.eq
    P_0$ satisfying (2.1), every supported receiver, every $w = 2^k$, $k gt.eq 0$,
    and every interval $\[ t_1 \, t_2 \] subset \[ 0 \, t_(*) \]$ on which $w \/ 8 lt.eq q_X \( t \) lt.eq
    8 w$ throughout, one has
#[#set math.equation(numbering: n => "(2.2)")
 $ \| V_X \( t_2 \) - V_X \( t_1 \) \| lt.eq M P sqrt(t_2 - t_1) + A \( t_2 - t_1 \) S \( w \) . $ <eq:bootstrap>]

 The constants are independent of $t_(*)$ and $P$.]
] <prop:increment>

#thm([Proposition 2.2.])[
  (Local theory and continuation).  #emph[Every smooth admissible datum has a unique maximal classical solution.
    It is smooth on each compact subinterval of its lifespan. If its maximal time $T_max$ is finite and
$ sup { thin \| v \| : 0 lt.eq t < T_max \, med \( x \, v \) in "supp" f \( t \) thin } < oo \, $

 then the solution has a classical extension beyond $T_max$.]
] <prop:continuation>

The proof is given in the final section. It combines the Glassey–Strauss bounded-momentum criterion in the $H^5$
  formulation quoted by Luk and Strain #cite(label("LukStrain2014Continuation")) Theorem 1.1 and Footnote 1,
  arXiv version with a finite-horizon modification of the initial fields.
  The modification retains the initial Coulomb field and cuts off vector potentials for the divergence-free
  remainders. The removed part evolves as a vacuum Maxwell field that vanishes throughout the particle region for
  the chosen horizon. This supplies Sobolev field data for the continuation theorem while preserving the original
  particle dynamics.

#proof[
  If $f_0 = 0$, the vacuum Maxwell solution is global and smooth, as shown in the final section.
    Suppose $"supp" f_0 eq.not diameter$ and, toward a contradiction, $T_max < oo$.
    Proposition 3 then forces unbounded momentum support. Set $T_0 = T_max$ and
  $ Q \( t \) = max_(z in "supp" f_0) q \( V \( t \, z \) \) . $
  Continuity of the characteristic flow and compactness of the label set make $Q$ continuous.
    For all sufficiently large integers $n$, let $t_n < T_max$ be the first time when $Q \( t_n \) = 2^n$.
    Choose a label attaining this value. Along that label let $s_n$ be its last time before $t_n$ at energy
    $2^(n - 1)$. Such a time exists because the initial energy is smaller; moreover $s_n gt.eq t_(n - 1)$.
    On $\[ s_n \, t_n \]$ the energy lies in $\[ 2^(n - 1) \, 2^n \]$.
  Apply Proposition 2 on the prefix $\[ 0 \, t_n \]$ with $P = 1024 dot.op 2^n$ and $w = 2^n$.
    Since $q$ is $1$-Lipschitz, writing $Delta_n = t_n - s_n$ gives
  $ 2^(n - 1) lt.eq \| V \( t_n \) - V \( s_n \) \| lt.eq 1024 M thin 2^n sqrt(Delta_n) +
    1024^2 A thin 2^n Delta_n log \( 2 + 1024 dot.op 2^n \) . $
  At least one term on the right is at least $2^(n - 2)$. Consequently
  $ t_n - t_(n - 1) gt.eq Delta_n gt.eq frac(c, log \( 2 + 1024 dot.op 2^n \)) $
  for a fixed $c > 0$. The sum of these lower bounds diverges, contradicting $t_n < T_max$. Thus $T_max = oo$.
    Uniqueness, smoothness and propagation of the constraints follow from Proposition 3 and its proof. ◻
]

To prove Proposition 2, we assume (2.2) for all such receivers, scales and intervals in $\[ 0 \, tau \]$,
  where $tau lt.eq t_(*)$, and derive a uniform strict improvement.
  Until that improvement is proved, (2.2) is a bootstrap assumption.
  In the estimates, $C$ and the constants implicit in $lt.tilde$ or $asymp$ may depend on the datum, $T_0$,
  and fixed decomposition parameters, but not on $t_(*) \, P \, M \, A$.
  Additional dependence is indicated explicitly. Lower thresholds on $P$ may depend on $M \, A$.
  The final choices are made in the order: a time-ramp fraction, then $M$, then $A$, then the threshold on $P$.

For nonnegative estimates we allow integration over any measurable subset of receiver times in an interval $J
  subset \[ 0 \, tau \]$ of length at most $I$, provided those times satisfy $w \/ 8 lt.eq q_X lt.eq 8 w$ and

#[#set math.equation(numbering: n => "(2.3)")
 $ 0 < I lt.eq \( w \/ P \)^2 . $ <eq:short-I>]

The number $I$ is an upper bound on length in these estimates.
  For the final signed estimate the interval has length exactly $I$ and the receiver stays in the indicated range
  throughout. This distinction permits summation over disjoint time pieces without introducing a new constant for
  each piece.

Figure 1 records the conditional dependencies. We now prove Proposition 2.
  Energy and timelike geometry give preliminary bounds on absolute force.
  Those bounds lose a factor at large receiver momentum; the subsequent signed cancellation removes this loss.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Assumed increment bound#linebreak()up to time $tau$]]])])
  content((7, 0), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Signed cancellation#linebreak()along source labels]]])])
  content((0, -1.5), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Baseline occupation#linebreak()and direct estimates]]])])
  content((0, -3), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Bound on changes#linebreak()of particle direction]]])])
  content((0, -4.5), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Improved occupation#linebreak()in the angular window]]])])
  content((7, -4.5), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Selected-bin estimate#linebreak()for the signed force]]])])
  content((7, -6), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Strict improvement#linebreak()of the assumed bound]]])])
  content((0, -6), [#box(width: 4.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Continuity argument#linebreak()establishes the bound]]])])
  line((0, -0.425), (0, -1.075), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((0, -1.925), (0, -2.575), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((4.524, -0.425), (2.476, -3), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  content((3.623, -1.558), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[first use]]])], anchor: "south")
  line((7, -0.425), (7, -4.075), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  content((7, -2.34), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[second use]]])], anchor: "west")
  line((0, -3.425), (0, -4.075), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((2.476, -4.5), (4.524, -4.5), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((7, -4.925), (7, -5.575), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((4.524, -6), (2.476, -6), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
})],
  caption: [Figure 1: Main dependencies in the conditional proof of the signed momentum estimate. The dashed box is a bootstrap assumption. The first use of signed cancellation controls particle direction from this assumption and the baseline estimates; improved occupation is obtained afterward. The second use yields a strict improvement, and a continuity argument establishes the initially assumed bound. ],
) <fig:dependencies>

== 3 Energy and the retarded force <ret:section>

The estimates below use the conserved energy and two different changes of variables on a backward light cone.
  We first derive the force kernels without derivatives of the density.
  This representation belongs to the Glassey–Strauss approach #cite(label("GlasseyStrauss1986"));
  the organization by cone-controlled field components also appears in #cite(label("LukStrain2014Continuation"))
  Proposition 2.2 and Section 3. We give the source-label calculation explicitly, including its initial boundary term.

Throughout this section, fix a classical solution on a compact interval $\[ 0 \, t_(*) \]$, with $t_(*) lt.eq
  T_0 < oo$, in the class specified in the main theorem. All limiting operations are justified on this fixed
  compact interval. Constants in the final bounds depend only on the initial data and $T_0$;
  constants used solely to remove a cutoff may also depend on the compact-interval momentum support.
  Retain the characteristic notation fixed in Section 2.

#thm([Lemma 3.1.])[
  (Transport and cone energy).  #emph[The characteristic flow preserves phase volume and transports $f_0$.
    In particular $0 lt.eq f lt.eq parallel f_0 parallel_oo$. Define
$ cal(U) = frac(\| E \|^2 + \| B \|^2, 2) + integral q f thin d v \, wide cal(S) = E times B +
  integral q u f thin d v \, wide cal(H)_0 = integral_(bb(R)^3) cal(U) \( 0 \, x \) thin d x . $

 Then
#[#set math.equation(numbering: n => "(3.1)")
 $ integral_(bb(R)^3) cal(U) \( s \, x \) thin d x = cal(H)_0 wide \( 0 lt.eq s lt.eq t_(*) \) . $ <eq:energy>]

 For every vertex $\( t \, x \)$ in this interval, put $r = t - s$, $y = x - r n$, $n in S^2$, and
$ d = 1 - n dot.op u \( v \) \, wide G = \| E \( s \, y \) + n times
  B \( s \, y \) \| + \| n dot.op B \( s \, y \) \| . $

 Then
#[#set math.equation(numbering: n => "(3.2)")
 $ integral_0^t integral_(S^2) r^2 (G^2 + integral q d f \( s \, x - r n \, v \) thin d v) d n thin d s lt.eq
   4 cal(H)_0 . $ <eq:cone-energy>]

]
] <ret:energy>

#proof[
  The phase vector field has zero divergence: $u$ is independent of $x$, $E$ is independent of $v$,
    and $nabla_v dot.op \( u times B \) = B dot.op \( nabla_v times nabla_v q \) = 0$.
    Liouville’s formula gives volume preservation, and the Vlasov equation gives $f \( s \, Y \, V \) =
    f_0 \( z \)$. The flow exists backwards from every finite phase point on this compact time interval.
    Indeed, its spatial path stays in a bounded ball because $\| u \| < 1$;
    the fields are bounded on the resulting compact spacetime set, so its momentum cannot escape in finite time.
  Multiplication of Vlasov by $q$ and integration in $v$, followed by Maxwell’s energy identity, give
  $ partial_s cal(U) + nabla_x dot.op cal(S) = 0 \, wide \| cal(S) \| lt.eq cal(U) . $
  There is no momentum boundary term because $f$ has compact phase-space support on the interval.
    Integrate against spatial cutoffs equal to one on a ball of radius $R$, with gradient bounded by $C \/ R$.
    The error tends to zero: the fields are bounded in $C \( \[ 0 \, t_(*) \] \; L^2 \)$ and the particle energy
    has compact support and is continuous in time. Passing to the limit proves conservation.
  The outward spatial normal of the ball $\| y - x \| < t - s$ is $- n$.
    Its energy derivative is therefore minus the boundary integral of $cal(U) - n dot.op cal(S)$.
    At the cone tip the ball energy tends to zero by local continuity. Hence the exact cone identity is
  $ integral_0^t integral_(S^2) r^2 \( cal(U) - n dot.op cal(S) \) \( s \, x - r n \) thin d n thin d s =
    integral_(\| y - x \| < t) cal(U) \( 0 \, y \) thin d y . $
  Its particle part is $integral q d f thin d v$, and its field part is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \| E + n times B \|^2 + \| n dot.op B \|^2 #scale(x: 120%, y: 120%)[\)] . $
  Since $\( a + b \)^2 lt.eq 2 \( a^2 + b^2 \)$, the last identity implies (3.2). ◻
]

=== 3.1 The retarded source labels <the-retarded-source-labels>

For fixed $t \, x$, set $r = \| x - y \|$, $s = t - r$, and $n = \( x - y \) \/ r$ when $r > 0$.
  The zero-data wave potentials are

#[#set math.equation(numbering: n => "(3.3)")
 $ \( Phi \, cal(A) \) \( t \, x \) = frac(1, 4 pi) integral_(\| x - y \| < t) integral_(bb(R)^3)
   frac(f \( t - \| x - y \| \, y \, v \), \| x - y \|) \( 1 \, u \( v \) \) thin d v thin d y . $ <ret:potentials>]

The following change to source labels also appears in #cite(label("Lazarovici2016")) Section 9, Lemma 9.2.
  We give the calculation for the present flow.

#thm([Lemma 3.2.])[
  (Retarded phase change).  #emph[Away from the cone tip, the map sending $\( y \, v \)$ at time $s = t - \| x -
    y \|$ to its initial label is one-to-one, with Jacobian
#[#set math.equation(numbering: n => "(3.4)")
 $ d z = d thin d y thin d v \, wide d = 1 - n dot.op u \( v \) > 0 . $ <ret:phase-jacobian>]

 Its image consists, up to the null set of tip labels, of
$ cal(L)_(t \, x) = { z : \| x - Y \( 0 \, z \) \| < t } . $

 For such a label, the retarded time solves
#[#set math.equation(numbering: n => "(3.5)")
 $ s + \| x - Y \( s \, z \) \| = t . $ <ret:time-equation>]

 Consequently (3.3) equals
#[#set math.equation(numbering: n => "(3.6)")
 $ \( Phi \, cal(A) \) \( t \, x \) = frac(1, 4 pi) integral_(cal(L)_(t \, x)) f_0 \( z \)
   frac(\( 1 \, u \( V \( s \, z \) \) \), r d) thin d z . $ <ret:label-potentials>]

]
] <ret:phase-change>

#proof[
  Let $Z_s$ be the fixed-time inverse phase flow. Its determinant is one by Lemma 4, and $partial_s Z_s = -
    D Z_s thin \( u \, V' \)$. Since $nabla_y s = n$, the derivative of $Z_(t - \| x - y \|) \( y \, v \)$ is the
    fixed-time derivative multiplied by
  $ upright("Id") - \( u \, V' \) ⊗ \( n \, 0 \) . $
  The determinant of this rank-one perturbation is $1 - n dot.op u = d$.
  Along a fixed label, the function on the left of (3.5) is strictly increasing.
    More explicitly, on any compact part of that characteristic,
    its increment between $s_1 < s_2$ is at least $\( 1 - sup \| u \| \) \( s_2 - s_1 \) > 0$.
    It starts below $t$ exactly for labels in $cal(L)_(t \, x)$ and at $s = t$ is at least $t$.
    Thus it has exactly one root. The root is a tip only if $Y \( t \, z \) = x$.
    This set has phase Lebesgue measure zero, by the volume-preserving fixed-time flow and Fubini’s theorem.
    This proves injectivity and the image assertion. Transport of $f$ and (3.4) now give (3.6). ◻
]

=== 3.2 The exact electric and magnetic kernels <the-exact-electric-and-magnetic-kernels>

Along a source characteristic write

#[#set math.equation(numbering: n => "(3.7)")
 $ b = u' = frac(upright("Id") - u ⊗ u, q) \( E + u times B \) \, $ <ret:source-acceleration>]

where these fields, $u$, and $q$ are evaluated at its retarded point.

#thm([Proposition 3.3.])[
  (Retarded field representation).  #emph[Let $E^(upright("fr")) \,
    B^(upright("fr"))$ be the homogeneous wave solutions with data
$ \( E^(upright("fr")) \, partial_t E^(upright("fr")) \) \|_(t = 0) = \( E_0 \, nabla times B_0 \) \,
  wide \( B^(upright("fr")) \, partial_t B^(upright("fr")) \) \|_(t = 0) = \( B_0 \, - nabla times E_0 \) . $

 For $t > 0$, define initial boundary terms by
#[#set math.equation(numbering: n => "(3.8)")
 $ \( E^(upright("bd")) \, B^(upright("bd")) \) \( t \, x \) =
   frac(1, 4 pi t) integral_(\| x - y_0 \| = t) integral_(bb(R)^3) frac(f_0 \( y_0 \, v_0 \), d_0)
   #scale(x: 120%, y: 120%)[\(] n_0 - u_0 \, med n_0 times \( n_0 - u_0 \) #scale(x: 120%, y: 120%)[\)] thin d v_0
   thin d S_(y_0) \,\
n_0 = \( x - y_0 \) \/ t \, wide u_0 = u \( v_0 \) \, wide d_0 = 1 - n_0 dot.op u_0 . $ <ret:initial-boundary>]

 Set these terms to zero at $t = 0$. Then
#[#set math.equation(numbering: n => "(3.9)")
 $ E \( t \, x \) & = E^(upright("fr")) \( t \, x \) + E^(upright("bd")) \( t \, x \) +
   frac(1, 4 pi) integral_(cal(L)_(t \, x)) f_0 \( z \) thin cal(K) thin d z \,\
B \( t \, x \) & = B^(upright("fr")) \( t \, x \) + B^(upright("bd")) \( t \, x \) +
  frac(1, 4 pi) integral_(cal(L)_(t \, x)) f_0 \( z \) thin \( n times cal(K) \) thin d z \, $ <ret:fields>]

 where
#[#set math.equation(numbering: n => "(3.10)")
 $ cal(K) = frac(n - u, r^2 q^2 d^3) + frac(\( n - u \) \( n dot.op b \) - d b, r d^3) . $ <ret:kernel>]

 All these integrals are well defined at the stated classical regularity. Moreover,
#[#set math.equation(numbering: n => "(3.11)")
 $
   sup_(0 lt.eq t lt.eq T_0 \, med x in bb(R)^3) \( \| E^(upright("fr")) \| + \| B^(upright("fr")) \| + \|
   E^(upright("bd")) \| + \| B^(upright("bd")) \| \) lt.eq C_(T_0 \, f_0 \, E_0 \, B_0) . $ <ret:data-bound>]

]
] <ret:representation>

#proof[
  #emph[Wave representation.] Kirchhoff’s formula gives $square.stroked \( Phi \, cal(A) \) = \( rho_f \, j_f \)$
    with zero data, where $square.stroked = partial_t^2 - Delta$. Maxwell’s equations give, distributionally,
  $ square.stroked E = - nabla rho_f - partial_t j_f \, wide square.stroked B = nabla times j_f . $
  Thus the fields are $\( - nabla Phi - partial_t cal(A) \, nabla times cal(A) \)$ plus the stated homogeneous
    waves. Here it is important that the electric potential contribution has initial time derivative $- j_f \( 0 \)$.
  We justify this assertion with only $C^1$ sources. In the variables $y = x - r n$,
    the potentials integrate a $C^1$ source against $r thin d r thin d n$.
    Their first derivatives are continuous, and locally uniformly in $x$,
  $ partial_t cal(A) \( t \, x \) = t j_f \( 0 \, x \) + O \( t^2 \) \, wide nabla Phi \( t \, x \) \, med
    nabla cal(A) \( t \, x \) = O \( t^2 \) . $
  These formulas give the required zero initial values and initial difference quotients of the potential fields.
    For completeness, uniqueness of the resulting continuous distributional wave remainder can be reduced to
    classical uniqueness: convolve spatially with a compact smooth mollifier.
    The wave equation then supplies a continuous second time derivative, including at zero;
    the initial difference quotients identify its zero initial velocity.
    Local wave energy gives zero, and removal of the mollifier gives the assertion. No second derivative of $f$ is used.
  #emph[Interior kernels.] To differentiate (3.6), hold the initial label fixed. Implicit differentiation of (3.5) gives
  $ s_t = 1 \/ d \, wide nabla_x s = - n \/ d . $
  Write $ell = \( r d \)^(- 1)$. With $s$ held fixed,
  $ nabla_x ell = - frac(n - u, r^2 d^2) . $
  With $x$ fixed,
  $ r_s = - n dot.op u \, wide n_s = - frac(u - n \( n dot.op u \), r) \, wide ell_s =
    frac(q^(- 2) - d, r^2 d^2) + frac(n dot.op b, r d^2) . $
  Therefore the interior electric kernel is
  $ - nabla_x^(upright("total")) ell - partial_t \( u ell \) = frac(n - u, r^2 d^2) + frac(n - u, d) ell_s -
    frac(b, r d^2) \, $
  which simplifies to (3.10). In the magnetic curl the corresponding expression is its cross product with $n$: indeed
  $ nabla_x^(upright("total")) times \( u ell \) = (- frac(n - u, r^2 d^2) - n / d ell_s) times u -
    frac(n times b, r d^2) = n times cal(K) . $
  #emph[Boundary terms and the cone tip.] The label domain has indicator
    $upright(bold(1))_({ t > \| x - y_0 \| })$. Its time derivative is $delta \( t - \| x - y_0 \| \)$ and its
    spatial gradient is $- n_0 delta \( t - \| x - y_0 \| \)$.
    The resulting electric factor is $\( n_0 - u_0 \) \/ \( t d_0 \)$ and the magnetic one is its cross product
    with $n_0$. Integration over the initial sphere gives (3.8).
    The initial velocities are bounded on $"supp" f_0$, so $d_0$ has a fixed positive lower bound.
    Sphere area and compact initial velocity support consequently give $\| E^(upright("bd")) \| + \|
    B^(upright("bd")) \| lt.eq C_(f_0) t$, uniformly in $x$.
  The differentiations at the cone tip can be justified by inserting a smooth cutoff that vanishes for $r <
    gamma$ and equals one for $r > 2 gamma$. On the supported labels of the fixed compact time interval,
    $d$ is bounded below and $u \, b$ are bounded. Derivatives of this cutoff are at most $C \/ gamma$.
    By (3.4), the omitted potential and cutoff errors are bounded by integrals of $C f \/ r$ over $r < 2 gamma$,
    multiplied by at most $C \/ gamma$ for the latter. They are $O \( gamma^2 \)$ and $O \( gamma \)$,
    respectively. The omitted kernel integrals are $O \( gamma \)$ because their worst radial singularity after
    this change of variables is $r^(- 2)$. These bounds are locally uniform for $t > 0$.
    The already established initial traces handle $t = 0$. Thus no term supported at the cone tip remains.
  Finally, Kirchhoff’s formula for a homogeneous wave $W$ with data $\( W_0 \, W_1 \)$ bounds it by
  $ parallel W \( t \) parallel_oo lt.eq parallel W_0 parallel_oo + t parallel nabla W_0 parallel_oo +
    t parallel W_1 parallel_oo . $
  The assumed bounded initial derivatives give (3.11). The homogeneous waves here need not together be a vacuum
    Maxwell solution; the representation requires only their displayed wave data. ◻
]

=== 3.3 Receiver geometry and pointwise force bounds <receiver-geometry-and-pointwise-force-bounds>

Let $\( X \( t \) \, V_X \( t \) \)$ be a supported receiver characteristic and write

$ a = u \( V_X \) \, wide q_X = q \( V_X \) \, wide K = V'_X \,\
D = 1 - n dot.op a \, wide e = 1 - a dot.op u \, wide Q = D upright("Id") + n ⊗ a . $

Since $h + a times \( n times h \) = Q h$, Proposition 6 and (3.4) give

#[#set math.equation(numbering: n => "(3.12)")
 $ K = K^(upright("data")) + frac(1, 4 pi) integral_(\| X \( t \) - y \| < t)
   integral_(bb(R)^3) \( T_(upright("ker")) + S_(upright("ker")) \) thin d v thin d y \, $ <ret:force>]

where $\| K^(upright("data")) \| lt.eq C_(T_0 \, f_0 \, E_0 \, B_0)$ and

#[#set math.equation(numbering: n => "(3.13)")
 $ T_(upright("ker")) = frac(f Q \( n - u \), r^2 q^2 d^2) \, wide S_(upright("ker")) =
   frac(f Q #scale(x: 120%, y: 120%)[\(] \( n - u \) \( n dot.op b \) - d b #scale(x: 120%, y: 120%)[\)], r d^2) .
   $ <ret:force-kernels>]

The density and source quantities in these integrals are evaluated at $\( t - r \, y \, v \)$, not at the receiver.

Figure 2 shows the source and receiver geometry.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((3.264, 4.992), [#text(size: 9pt)[\(a\) Spacetime: schematic $1+1$ slice]])
  line((0.528, 0.864), (3.408, 3.744), (6.288, 0.864), close: true, fill: rgb("#f5f5ff"), stroke: none)
  line((0.528, 0.864), (3.408, 3.744), (6.288, 0.864), stroke: (paint: rgb("#9e9e9e"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.144, 0.384), (0.144, 4.56), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0.144, 4.56), [#text(size: 9pt)[time]], anchor: "south", padding: 0.1176cm)
  line((0.144, 0.384), (6.432, 0.384), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6.432, 0.384), [#text(size: 9pt)[space]], anchor: "west", padding: 0.1176cm)
  line((0.144, 1.968), (1.632, 1.968), stroke: (paint: rgb("#b8b8b8"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((0.144, 3.744), (3.408, 3.744), stroke: (paint: rgb("#b8b8b8"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0.144, 1.968), [#text(size: 9pt)[$s$]], anchor: "east", padding: 0.1176cm)
  content((0.144, 3.744), [#text(size: 9pt)[$t$]], anchor: "east", padding: 0.1176cm)
  bezier((1.152, 0.432), (1.632, 1.968), (1.248, 1.056), (1.464, 1.632), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  bezier((1.632, 1.968), (2.256, 4.32), (1.92, 2.544), (2.035, 3.456), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  bezier((2.688, 0.432), (3.034, 2.832), (2.746, 1.392), (2.784, 2.112), stroke: (paint: rgb("#8c4600"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((3.034, 2.832), (3.408, 3.744), (3.183, 3.264), (3.384, 3.648), stroke: (paint: rgb("#8c4600"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((3.408, 3.744), (3.571, 4.32), (3.463, 3.965), (3.504, 4.128), stroke: (paint: rgb("#8c4600"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.083, 4.243), [#text(size: 9pt)[source $Y$]], anchor: "east", padding: 0.1176cm)
  content((3.706, 4.243), [#text(size: 9pt)[receiver $X$]], anchor: "west", padding: 0.1176cm)
  line((1.632, 1.968), (3.408, 3.744), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: ">"))
  circle((1.632, 1.968), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  circle((3.408, 3.744), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((1.536, 2.141), [#text(size: 9pt)[$(s,Y(s))$]], anchor: "south-east", padding: 0cm)
  content((3.552, 3.715), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(t,X(t))$]]])], anchor: "west")
  content((4.656, 1.363), [#text(fill: rgb("#666666"))[#text(size: 9pt)[backward#linebreak()light cone]]])
  content((2.477, 3.053), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[light ray]]])], angle: 45deg)
  content((10.42, 4.992), [#text(size: 9pt)[\(b\) Spatial geometry]])
  content((10.42, 4.493), [#text(fill: rgb("#595959"))[#text(size: 9pt)[Positions at times $s$ and $t$]]])
  line((7.968, 2.304), (12.14, 2.304), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: ">"))
  content((10.06, 2.445), [#text(size: 9pt)[$n$]], anchor: "south", padding: 0.1176cm)
  line((7.968, 2.304), (8.928, 3.571), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: ">"))
  content((8.928, 3.677), [#text(size: 9pt)[$u(V(s))$]], anchor: "south", padding: 0.1176cm)
  line((12.14, 2.304), (12.83, 3.571), stroke: (paint: rgb("#8c4600"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: ">"))
  content((12.83, 3.677), [#text(size: 9pt)[$a(t)$]], anchor: "south", padding: 0.1176cm)
  circle((7.968, 2.304), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  circle((12.14, 2.304), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((7.968, 2.128), [#text(size: 9pt)[$Y(s)$]], anchor: "north", padding: 0.1176cm)
  content((12.14, 2.128), [#text(size: 9pt)[$X(t)$]], anchor: "north", padding: 0.1176cm)
  line((7.968, 1.392), (12.14, 1.392), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: ("|", "<"), end: (">", "|")))
  content((10.06, 1.392), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r$]]])])
  content((10.27, 0.6336), [#text(size: 9pt)[$ r=t-s, n= frac(X(t)-Y(s), r)$]])
})],
  caption: [Figure 2: Retarded geometry along a receiver characteristic. The source event $\( s \, Y \( s \) \)$ lies on the backward light cone of $\( t \, X \( t \) \)$, with $r = t - s = \| X \( t \) - Y \( s \) \| > 0$. The spatial unit vector $n$ points from $Y \( s \)$ to $X \( t \)$. Panel (b) shows the source velocity $u \( V \( s \) \) = Y' \( s \)$ and the receiver velocity $a \( t \) = X' \( t \)$ at these respective events. The curves and vector directions are schematic. ],
) <fig:retarded-geometry>

#thm([Lemma 3.4.])[
  (Pointwise force bounds).  #emph[Let $theta \, phi.alt > 0$ satisfy $theta^2 asymp d$ and $phi.alt^2 asymp D$,
    with fixed comparison constants. The transport kernel splits into two terms,
    according to the normal and tangential parts of $n - u$, bounded by
#[#set math.equation(numbering: n => "(3.14)")
 $ T_r = frac(C f, r^2 q^2 theta^2) \, wide T_perp = frac(C f phi.alt, r^2 q^2 theta^3) . $ <ret:transport-bounds>]

 With $G$ as in Lemma 4, the source acceleration satisfies
#[#set math.equation(numbering: n => "(3.15)")
 $ \| b \| lt.eq C / q \( G + theta^2 \| B \| \) \, wide \| n dot.op b \| lt.eq
   frac(C theta, q) \( G + theta^2 \| B \| \) \, wide \| q' \| lt.eq
   C \( G + theta \| B \| \) . $ <ret:acceleration-bounds>]

 Consequently
#[#set math.equation(numbering: n => "(3.16)")
 $ \| S_(upright("ker")) \| lt.eq S_g + S_b \, wide S_g = frac(C f phi.alt, r q theta^2) G \, wide S_b =
   frac(C f phi.alt, r q) \| B \| . $ <ret:source-bounds>]

 If $V_X eq.not 0$ and $P_X$ is orthogonal projection onto $V_X^perp$, then $\| P_X S_(upright("ker")) \| lt.eq
   C phi.alt \( S_g + S_b \)$.]
] <ret:direct-bounds>

#proof[
  The exact identities
  $ 2 d = \| n - u \|^2 + q^(- 2) \, wide 2 D = \| n - a \|^2 + q_X^(- 2) $
  give $\| n - u \| lt.eq C theta$ and $\| n - a \| lt.eq C phi.alt$. Also $Q n = n$, whereas for $h perp n$,
  $ \| Q h \| lt.eq D \| h \| + \| a dot.op h \| lt.eq C phi.alt \| h \| . $
  The normal component of $n - u$ is $d n$ and its tangential component has norm at most $C theta$. This proves (3.14).
  Put $u = \( 1 - d \) n + u_perp$ and $H = E + n times B$. The force at the source is
  $ F_(upright("src")) = E + u times B = H + \( - d n + u_perp \) times B . $
  Its tangential and normal components satisfy
  $ \| \( F_(upright("src")) \)_perp \| lt.eq C \( G + theta^2 \| B \| \) \,
    wide \| n dot.op F_(upright("src")) \| lt.eq C \( G + theta \| B \| \) . $
  Indeed the tangential part of $u_perp times B$ involves only $n dot.op B$,
    while its normal part is bounded by $C theta \| B \|$. For $L_u = upright("Id") - u ⊗ u$ we have
  $ \| L_u n \| lt.eq C theta \, wide \| n dot.op L_u n \| = 2 d - d^2 lt.eq C theta^2 \,
    wide \| n dot.op L_u h \| lt.eq C theta \| h \| quad \( h perp n \) . $
  Combining these component bounds with $b = q^(- 1) L_u F_(upright("src"))$ proves the first two inequalities in
    (3.15). The last follows from $q' = u dot.op E = u dot.op H - u dot.op \( n times B \)$.
  The numerator $N = \( n - u \) \( n dot.op b \) - d b$ is tangent to $n$, since $n dot.op N =
    d \( n dot.op b \) - d \( n dot.op b \) = 0$. This cone tangency is also used in
    #cite(label("Pallard2015Refined")) Lemma 2.1. The preceding estimates give
  $ \| N \| lt.eq frac(C theta^2, q) \( G + theta^2 \| B \| \) . $
  The tangential bound for $Q$ now proves (3.16). Finally $P_X a = 0$,
    so $\| P_X n \| = \| P_X \( n - a \) \| lt.eq C phi.alt$. For $h perp n$,
  $ \| P_X Q h \| lt.eq D \| h \| + \| P_X n \| thin \| a dot.op h \| lt.eq C phi.alt^2 \| h \| . $
  Applying this to $N$ gives the additional projected factor. ◻
]

#thm([Lemma 3.5.])[
  (Source time along a receiver).  #emph[Along a retarded source label satisfying $t = s + \| X \( t \) -
    Y \( s \, z \) \|$ away from collisions,
#[#set math.equation(numbering: n => "(3.17)")
 $ frac(d t, d s) = d / D \, wide d s thin f_0 \( z \) thin d z =
   D thin d t thin f \( t - r \, y \, v \) thin d y thin d v . $ <ret:receiver-jacobians>]

 For $f_0 \( z \) d z$-almost every label there is no same-time collision $Y \( t \, z \) =
   X \( t \)$ anywhere in the compact time interval. Such a label has one continuously differentiable retarded
   branch after its initial-cone entry, when that entry occurs,
   and $r$ is bounded below on each closed part of this branch in the compact interval.]
] <ret:receiver-time>

#proof[
  Differentiate $t - s - \| X \( t \) - Y \( s \, z \) \| = 0$ to obtain $D thin d t = d thin d s$.
    Both factors are positive. Combining this with (3.4) gives the measure identity in (3.17).
  To exclude same-time collisions, let $R_v$ bound the supported momenta on $\[ 0 \, t_(*) \]$.
    Use a time grid of mesh at most $zeta$ with $O \( 1 + t_(*) \/ zeta \)$ points.
    If a collision occurs, at a nearest grid time the two positions are at distance at most $2 zeta$,
    since both spatial speeds are at most one. At each grid time the mass of labels satisfying this distance bound
    is at most $C parallel f_0 parallel_oo R_v^3 zeta^3$, by phase-volume preservation.
    The union has mass $O \( zeta^2 \)$ and tends to zero.
  For the remaining labels, strict timelikeness gives uniqueness and continuous differentiability of the retarded
    root. The entry time is unique because $t - \| X \( t \) - Y \( 0 \, z \) \|$ is strictly increasing.
    At entry $r = t > 0$, since an entry at zero would be an excluded initial collision.
    On any closed part of the branch, continuity and the absence of collisions give a positive minimum of $r$.
    This assertion is labelwise; no uniform lower bound over all labels is used. ◻
]

== 4 Occupation of retarded bins <occ:section>

We estimate how much particle mass a receiver can meet in a prescribed momentum, angle, and distance range.
  Two changes of variables give crude bounds. The signed increment assumption then limits how long a source can
  remain close to the receiver. A time-averaged energy budget will make the result summable over the small angular
  sector.

The residence-time and relative-velocity viewpoint is inspired by Pfaffelmoser’s Vlasov–Poisson argument
  #cite(label("Pfaffelmoser1992")). This is methodological inspiration,
  not a theorem input for the Vlasov–Maxwell system: the retarded geometry and source-acceleration terms require
  the estimates proved here.

Throughout this section assume (2.2) up to a time $tau lt.eq t_(*)$.
  Fix a supported receiver $X$, a dyad $w$, and a closed interval $J subset \[ 0 \, tau \]$ of length at most $I$, where

#[#set math.equation(numbering: n => "(4.1)")
 $ 0 < I lt.eq \( w \/ P \)^2 . $ <occ:interval>]

We integrate over any measurable subset of ${ t in J : w \/ 8 lt.eq q_X \( t \) lt.eq 8 w }$.
  The receiver need not remain in this momentum range at other times of $J$.
  All constants below may depend on the fixed horizon, initial energy, $parallel f_0 parallel_oo$,
  and the fixed partition parameters, but not on $M \, A \, P$, $tau \, J$, or the measurable subset.
  In particular, they are uniform over supported receivers. We use the already established bounds

$ 0 lt.eq f lt.eq parallel f_0 parallel_oo \, wide sup_(0 lt.eq s lt.eq tau) integral_(bb(R)^3 times bb(R)^3)
  q \( v \) f \( s \, y \, v \) thin d y thin d v lt.eq C . $

=== 4.1 The momentum and angular ranges <the-momentum-and-angular-ranges>

Let $H_0 = max \( 1 \, T_0 \)$. At a source point on the receiver’s backward cone write

$ r = t - s > 0 \, wide y = X \( t \) - r n \, wide n in S^2 \, $

and retain the notation

$ u = v \/ q \( v \) \, quad a = a \( t \) \, quad d = 1 - n dot.op u \, quad D = 1 - n dot.op a \, quad e = 1 -
  a dot.op u . $

Choose smooth nonnegative dyadic partitions for $r \/ H_0 \, sqrt(d \/ 2) \, sqrt(D \/ 2) \, sqrt(e \/ 2)$,
  with representatives $h \, theta \, phi.alt \, sigma in { 1 \, 2^(- 1) \, 2^(- 2) \, dots.h }$.
  Each factor is supported where its argument lies between one half and twice its representative.
  The partitions sum to one, including near the upper endpoint $1$, have bounded overlap,
  and have uniformly bounded derivatives with respect to the logarithm of each variable.
  For example, normalized dilates of a fixed bump supported in $\( 1 \/ 2 \, 2 \)$ and positive on
  $\[ 3 \/ 4 \, 3 \/ 2 \]$ give such partitions. Use the analogous partition of $q gt.eq
  1$ with representatives $p_0 = 1 \, 2 \, 4 \, dots.h$, but write $p = 64 p_0$. On its support,

$ p \/ 128 lt.eq q lt.eq p \/ 32 \, wide 64 lt.eq p lt.eq P . $

The last inequality follows from the assumed bound on all supported momenta.
  We use closed support ranges for upper estimates; this preserves bounded overlap.

These are angular scales with the inverse-momentum deficits included, not literal geometric angles. The exact identities

#[#set math.equation(numbering: n => "(4.2)")
 $ 2 d & = \| n - u \|^2 + q^(- 2) \,\
2 D & = \| n - a \|^2 + q_X^(- 2) \,\
2 e & = \| a - u \|^2 + q^(- 2) + q_X^(- 2) $ <occ:angle-identities>]

imply, on a nonempty bin,

#[#set math.equation(numbering: n => "(4.3)")
 $ theta gt.eq 1 \/ p \, wide phi.alt gt.eq c \/ w \, wide sigma gt.eq c \/ m \, wide m =
   min \( p \, w \) . $ <occ:angle-ranges>]

All angles have at most $C log \( 2 + P \)$ nonempty dyadic ranges.
  For the relations between them, apply the triangle and reverse triangle inequalities to

$ \( u - n \, q^(- 1) \, 0 \) \, wide \( n - a \, 0 \, q_X^(- 1) \) in bb(R)^5 . $

Their norms are $sqrt(2 d) \, sqrt(2 D)$, and the norm of their sum is $sqrt(2 e)$.
  Consequently $sigma lt.eq C \( theta + phi.alt \)$, and $sigma$ is comparable to the larger of $theta \,
  phi.alt$ when those two angles are sufficiently separated.

Fix a sufficiently small numerical $kappa > 0$. The #emph[small sector] consists of representatives $theta < kappa
  phi.alt$; here $sigma asymp phi.alt$, and we omit the $sigma$ partition entirely.
  All small-sector estimates below remain valid on the enlarged range $theta lt.eq 16 kappa phi.alt$.
  The #emph[remaining sector] has $theta gt.eq kappa phi.alt$ and retains the $sigma$ partition.
  In particular it includes $theta gt.double phi.alt$. For the two sectors define

#[#set math.equation(numbering: n => "(4.4)")
 $ & nu & k_1 & omega\
upright("small") & theta & 1 & phi.alt\
upright("remaining") & min \( theta \, sigma \) & 1 + phi.alt \/ sigma & sigma . $ <occ:sector-parameters>]

The parameter $omega$ will be the velocity tolerance in the occupation argument.

Let $N \( t \, s \, n \)$ be the integral of $f \( s \, X \( t \) - r n \, v \)$ over the momentum restrictions of
  one bin, set to zero when the remaining restrictions fail. Then

#[#set math.equation(numbering: n => "(4.5)")
 $ N lt.eq C p^3 nu^2 . $ <occ:density>]

Indeed the momentum shell has volume at most $C p^3$. If $theta$ is small,
  (4.2) restricts its velocity direction to a spherical cap of radius $C theta$ about $n$.
  If $sigma$ is small, both velocity magnitudes are close to one and their directions differ by at most $C sigma$,
  giving a cap about the receiver direction. Use whichever cap is smaller.
  When the controlling parameter is bounded below, the shell bound alone proves the same estimate with a larger
  constant. The same argument shows that the allowed $n$ have spherical area at most $C phi.alt^2$.

=== 4.2 Two changes of variables <two-changes-of-variables>

Define the occupation measure of the bin by

#[#set math.equation(numbering: n => "(4.6)")
 $ sans(M) = integral d t thin d s thin d n med r^2 D N \( t \, s \, n \) \, $ <occ:measure>]

where $t$ ranges over the specified receiver times and $0 lt.eq s < t$.
  The constants below absorb $H_0$ in the comparison $r asymp h$.
  The factor $D$ makes this cone integral equal to particle mass integrated over source-time hits,
  as the following changes of variables show.

#thm([Lemma 4.1.])[
  (Crude occupation bounds).  #emph[For every bin and every allowed set of receiver times,
#[#set math.equation(numbering: n => "(4.7)")
 $ sans(M) & lt.eq C frac(max \( I \, h \), p) \,\
sans(M) & lt.eq C I phi.alt^2 / theta^2 . $ <occ:energy>]

]
] <occ:crude-lemma>

#proof[
  The characteristic change of variables below is used in Pallard’s work #cite(label("Pallard2005")) Lemma 2.1;
    see also Luk–Strain #cite(label("LukStrain2014Continuation")) Proof of Proposition 5.2. Fix $s$. The map
  $ \( t \, n \) mapsto y = X \( t \) - \( t - s \) n \, wide t > s \, $
  is injective. Indeed, for fixed $y$, the function $t - s - \| X \( t \) - y \|$ is strictly increasing:
    wherever differentiable its derivative is at least $1 - \| a \( t \) \| > 0$.
    Its absolute Jacobian is $r^2 D$. This follows by taking two tangent vectors to the sphere and the time
    derivative $a - n$, whose normal component is $- D$. Hence (4.6) is the integral of $f \( s \, y \, v \) thin
    d s thin d y thin d v$ over the corresponding hits. The possible source times lie in an interval of length at
    most $C \( I + h \)$. On the momentum bin $q gt.eq c p$, so the particle energy bound proves (4.7).
  Passing at each fixed $s$ to the initial phase labels $z$,
    whose measure is preserved by the characteristic flow, gives equivalently
  #[#set math.equation(numbering: n => "(4.8)")
   $ sans(M) = integral f_0 \( z \) thin d z integral_(upright("hits of ") z) d s . $ <occ:label-measure>]
  By Lemma 8, labels having a same-time collision have zero $f_0 \( z \) thin d z$ measure.
    Every remaining label has a single increasing $C^1$ retarded branch, and
  #[#set math.equation(numbering: n => "(4.9)")
   $ frac(d t, d s) = d / D \, wide frac(d s, d t) = D / d . $ <occ:retarded-derivative>]
  The branch begins when it enters the initial cone, if such an entry occurs.
    Since its hit receiver times form a subset of $J$, their total length is at most $I$.
    On the bin, $D \/ d lt.eq C phi.alt^2 \/ theta^2$. Thus the hit duration of each label is at most $C I
    phi.alt^2 \/ theta^2$. Integrating in (4.8) and using the conserved finite particle mass proves (4.7). ◻
]

===== 4.2.1 The three changes of variables. <the-three-changes-of-variables.>

The preceding formulas use different fixed variables. For later reference, their Jacobians are collected here:

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Fixed
], table.cell(rowspan: 1, colspan: 1)[Change of variables
], table.cell(rowspan: 1, colspan: 1)[Jacobian
]),
  table.cell(rowspan: 1, colspan: 1)[$\( t \, x \)$
], table.cell(rowspan: 1, colspan: 1)[Retarded $\( y \, v \)$ to the initial label $z$
], table.cell(rowspan: 1, colspan: 1)[$d z = d thin d y thin d v$
],
  table.cell(rowspan: 1, colspan: 1)[$s$
], table.cell(rowspan: 1, colspan: 1)[$\( t \, n \) mapsto X \( t \) - \( t - s \) n$
], table.cell(rowspan: 1, colspan: 1)[$d y = r^2 D thin d t thin d n$
],
  table.cell(rowspan: 1, colspan: 1)[Label $z$
], table.cell(rowspan: 1, colspan: 1)[$t = s + \| X \( t \) - Y \( s \, z \) \|$
], table.cell(rowspan: 1, colspan: 1)[$d t \/ d s = d \/ D$
],
)
]

In particular the combined measure identity is $d s thin f_0 \( z \) d z = D thin d t thin f thin d y thin d v$.

=== 4.3 Stability on a short cell <stability-on-a-short-cell>

Fix large constants $C_0 \, C_1$, chosen below, and set

#[#set math.equation(numbering: n => "(4.10)")
 $ lambda = [C_1 P / m (M / omega + sqrt(frac(A L, omega)))]^(- 2) . $ <occ:lambda>]

Call a bin #emph[actual] if $omega > C_0 \/ m$, and #emph[deficit] otherwise.
  In an actual bin (4.2) implies $\| u \( s \) - a \( t \) \| gt.eq c omega$ at each hit:
  the two inverse-momentum terms are smaller than a fixed small multiple of $omega^2$ once $C_0$ is large.
  In the small sector use additionally $theta lt.eq 16 kappa phi.alt$. In a deficit bin,

#[#set math.equation(numbering: n => "(4.11)")
 $ lambda lt.eq frac(C_0^2, C_1^2 P^2) . $ <occ:deficit-lambda>]

We record explicitly the stability supplied by the bootstrap.
  Given a fixed constant $C_(*)$ and a hit, all source times within $C_(*) lambda$ of its source time,
  and all receiver times within $C_(*) lambda$ of its receiver time, clipped to $\[ 0 \, tau \]$, satisfy

#[#set math.equation(numbering: n => "(4.12)")
 $ \| Delta V \| lt.eq epsilon_0 m omega \, wide \| Delta u \| lt.eq epsilon_0 omega \, wide
   q asymp q_(upright("hit")) . $ <occ:stability>]

Here $epsilon_0 > 0$ can be prescribed by choosing $C_1$ sufficiently large in terms of $C_(*)$ and the fixed
  comparisons, independently of $M \, A$. To prove this, choose a dyad $w'$ nearest $q_(upright("hit"))$ and stop
  at the first exit from $\[ q_(upright("hit")) \/ 2 \, 2 q_(upright("hit")) \]$.
  Before exit the bootstrap applies with $w' asymp q_(upright("hit")) gt.eq c m$.
  Its two terms on an interval of length at most $C_(*) lambda$ are bounded by

$ M P sqrt(C_(*) lambda) lt.eq sqrt(C_(*)) / C_1 m omega \, wide C A C_(*) lambda frac(P^2 L, m) lt.eq
  frac(C C_(*), C_1^2) m omega . $

For sufficiently large $C_1$, this excludes the first exit, because $q$ is 1-Lipschitz and $omega lt.eq 1$.
  The same stopping argument runs backwards from the hit. The segment between the two momentum vectors has $q
  gt.eq c q_(upright("hit"))$; integrating $parallel D_v u parallel lt.eq
  1 \/ q$ on that segment then proves the velocity estimate. This proves (4.12).
  We now fix $C_(*)$ large enough to cover the cell and retarded-time separations used below,
  and then fix $C_1$ accordingly.

#thm([Lemma 4.2.])[
  (Occupation on stable cells).  #emph[In every actual bin,
#[#set math.equation(numbering: n => "(4.13)")
 $ sans(M) lt.eq C frac(h k_1, p) max \( 1 \, I \/ lambda \, h \/ lambda \) . $ <occ:actual>]

]
] <occ:cell-lemma>

#proof[
  Suppose first $h lt.eq lambda$, and partition $\[ 0 \, tau \]$ into intervals of length $lambda$,
    with the last interval clipped if necessary. For upper bounds we may enlarge the receiver times to all
    eligible times in $J$ and use closed bin ranges. The labels with some hit in a closed cell form a measurable
    set: it is the projection of a compact subset of the product of the compact initial support, the cell, $J$,
    and $S^2$; the fixed bin has $r gt.eq c h > 0$.
  For any label with a hit $\( s_0 \, t_0 \)$ in the cell, use that hit as a reference.
    At every same-time point $s$ of the cell, both $u \( s \, z \)$ and $a \( s \)$ are within a small multiple of
    $omega$ of their respective reference velocities: the time separations are at most $lambda + C_(T_0) h lt.eq
    C_(*) lambda$. The actual velocity difference therefore has projection at least $c
    omega$ in one fixed direction throughout the cell. This direction may depend on the label and its reference
    hit. At any hit in the cell,
  $ Y \( s \, z \) - X \( s \) = integral_s^t \( a \( t' \) - n \) thin d t' \, wide \| Y \( s \, z \) -
    X \( s \) \| lt.eq C h \( phi.alt + omega \) \, $
  using $\| a \( t \) - n \| lt.eq C phi.alt$ and receiver stability between $s$ and $t$.
    The projected same-time separation is strictly monotone with derivative of magnitude at least $c omega$.
    Its values at hits lie in an interval of length $C h \( phi.alt + omega \)$,
    so their total $s$-duration is at most $C h \( 1 + phi.alt \/ omega \) lt.eq C h k_1$.
    This holds even if the hit set is disconnected.
  All labels that hit the cell have $q asymp p$ at any one common time in the cell, by stability.
    Conservation of phase volume and the energy bound give their total label mass at most $C \/ p$.
    The source-time range of all hits has length at most $C \( I + h \)$,
    so at most $C max \( 1 \, I \/ lambda \, h \/ lambda \)$ cells can occur. Formula (4.8) proves (4.13).
    If $h > lambda$, instead use (4.7): its right-hand side is bounded by that of (4.13), since $k_1 gt.eq
    1$ and $h max \( I \, h \) \/ lambda gt.eq max \( I \, h \)$. ◻
]

=== 4.4 One energy budget for all distance and source-angle bins <one-energy-budget-for-all-distance-and-source-angle-bins>

Choose a fixed enlargement

$ J^(*) = { s in \[ 0 \, tau \] : "dist" \( s \, J \) lt.eq C_(T_0) I } \, $

with its constant large enough for every source cell considered below when $h lt.eq lambda lt.eq I$.
  In particular $\| J^(*) \| lt.eq C I$. For fixed $s \, y$,
  let $t_(upright("ret")) \( s \, y \) in \( s \, tau \]$ be the unique solution of $t - s = \| X \( t \) - y \|$,
  if it exists; omit its tip $y = X \( s \)$. This definition deliberately imposes no restriction that
  $t_(upright("ret"))$ belong to $J$ or to the eligible receiver subset.

The first indicator below is used to average the mass of hit labels over a stable cell,
  using the velocity separation that persists there. The second records the receiver angle at a retarded hit and
  is used when the spatial change of variables estimates hits directly.
  For each $p \, phi.alt$ define these indicators with fixed sufficiently enlarged comparison constants:

$ H_(p phi.alt)^(\( 1 \)) \( s \, y \, v \) & = upright(bold(1)) { q \( v \) asymp p \, \| u \( v \) -
  a \( s \) \| asymp phi.alt } \,\
H_(p phi.alt)^(\( 2 \)) \( s \, y \, v \) & = upright(bold(1)) {q \( v \) asymp p \,
  t_(upright("ret")) upright(" exists") \, sqrt(frac(1 - n_(upright("ret")) dot.op a \( t_(upright("ret")) \), 2))
  asymp phi.alt} \,\
n_(upright("ret")) & = frac(X \( t_(upright("ret")) \) - y, t_(upright("ret")) - s) . $

The second indicator is zero when its retarded time does not exist.
  The strictly monotone implicit equation makes its non-tip solution continuous when the root lies in
  $\( s \, tau \)$ and continuously extendible to a root at $tau$.
  The existence condition is a closed inequality at $tau$, after excluding the tip;
  thus the indicators are measurable. Set

#[#set math.equation(numbering: n => "(4.14)")
 $ cal(E)_(p phi.alt) = 1 / I integral_(J^(*)) integral_(bb(R)^3 times bb(R)^3) q f #scale(x: 120%, y: 120%)[\(]
   H_(p phi.alt)^(\( 1 \)) + H_(p phi.alt)^(\( 2 \)) #scale(x: 120%, y: 120%)[\)] thin d y thin d v thin d s .
   $ <occ:energy-budget>]

These numbers depend on the receiver, $J \, I \, p \, phi.alt$, but not on $theta \,
  h$ or on the eligible measurable subset. Their comparison constants, and hence the bound

#[#set math.equation(numbering: n => "(4.15)")
 $ sum_(p \, phi.alt) cal(E)_(p phi.alt) lt.eq C \, $ <occ:energy-budget-sum>]

are independent of $M \, A$. Indeed at each $\( s \, y \, v \)$ only a bounded number of $p$ and $phi.alt$ dyads
  can occur in either family. For the second family there is just one retarded time.
  Summing the indicators and using the energy bound and $\| J^(*) \| lt.eq C I$ proves (4.15).

#thm([Proposition 4.3.])[
  (Baseline occupation with a joint energy budget).  #emph[Suppose $h lt.eq I$,
    excluding only deficit bins with $h lt.eq lambda$. Then
#[#set math.equation(numbering: n => "(4.16)")
 $ sans(M) lt.eq C frac(h k_1, p) (1 + I / lambda cal(E)) \, wide cal(E) =
   cases(delim: "{", cal(E)_(p phi.alt) \, & upright("small sector") \,, 1 \, & upright("remaining sector") .)
   $ <occ:refined>]

 Consequently, with $R = 1 + sqrt(I \/ lambda) sqrt(cal(E))$,
#[#set math.equation(numbering: n => "(4.17)")
 $ sans(M) lt.eq C frac(h k_1, p) R^2 $ <occ:R-bound>]

 for all $h$, except deficit bins with $h lt.eq min \( I \, lambda \)$.]
] <occ:refined-proposition>

#proof[
  In the remaining sector, (4.13) proves the claim for actual bins; if $h > lambda$, (4.7) gives $sans(M) lt.eq
    C I \/ p lt.eq C h \( I \/ lambda \) \/ p$. This also treats the allowed deficit bins.
  Consider the small sector. When $h lt.eq lambda lt.eq I$ and the bin is actual,
    denote the set of hit labels in a cell $C$ by $Z_C$. At every time $s in C$ all these labels have both $q
    asymp p$ and $\| u - a \( s \) \| asymp phi.alt$, by the same stability argument as in Lemma 10.
    For a full cell, averaging its mass over its whole length therefore gives
  $ integral_(Z_C) f_0 \( z \) thin d z lt.eq frac(C, p lambda) integral_C integral q f H_(p phi.alt)^(\( 1 \))
    thin d y thin d v thin d s . $
  All such cells lie in $J^(*)$ and their interiors are disjoint.
    The at most two cells clipped by the endpoints of $\[ 0 \, tau \]$ have mass at most $C \/
    p$ by the common-time argument, without averaging. Each label has hit duration at most $C h$ in its cell.
    Summing (4.8) proves $sans(M) lt.eq C h p^(- 1) \( 1 + \( I \/ lambda \) cal(E)_(p phi.alt) \)$.
    If $lambda > I$, the source-time range has length at most $C I$ and meets only a bounded number of cells.
    Their crude mass and duration bounds already give $sans(M) lt.eq C h \/ p$; no averaging outside $J^(*)$ is used.
  Finally suppose $lambda < h lt.eq I$, whether actual or deficit.
    In the space map of Lemma 9, each hit belongs to $H_(p phi.alt)^(\( 2 \))$ and its source time belongs to
    $J^(*)$. Hence
  $ sans(M) lt.eq C / p integral_(J^(*)) integral q f H_(p phi.alt)^(\( 2 \)) thin d y thin d v thin d s lt.eq
    frac(C I, p) cal(E)_(p phi.alt) . $
  Since $h \/ lambda > 1$, this is bounded by the right-hand side of (4.16).
    The estimate $1 + \( I \/ lambda \) cal(E) lt.eq R^2$ proves (4.17) when $h lt.eq I$.
    For $h > I$, (4.7) gives $sans(M) lt.eq C h \/ p$, and $k_1 R^2 gt.eq 1$ completes the proof.
    The budget (4.14) can be defined for every bin, regardless of whether $h lt.eq I$;
    its use in this last case requires only nonnegativity. ◻
]

== 5 Direct bounds for the retarded force <sec:direct>

We first estimate the retarded force by absolute values. These estimates control every term except the
  narrow-angle part of $S_g$ at the scale needed for the signed bootstrap.
  They also give an absolute bound for the full force, with an additional factor $sqrt(w)$.

Retain the decomposition and occupation estimates of the preceding section.
  Let $J subset \[ 0 \, tau \]$ have length at most $I$, where

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 < I lt.eq \( w \/ P \)^2 \, $ <dir:time-range>]

and let $cal(T) subset J$ be any measurable set of times at which $w \/ 8 lt.eq q_X lt.eq 8 w$.
  Every integral below is restricted to $t in cal(T)$. Estimates for a nonnegative integrand remain valid if it is
  multiplied by any measurable weight between zero and one.

#thm([Proposition 5.1.])[
  (Integrated force bounds).  #emph[Assume the bootstrap (2.2).
    The bounded data term, $T_r$, $T_perp$, $S_b$, and the remaining-sector part of $S_g$ have combined integral at most
#[#set math.equation(numbering: n => "(5.2)")
 $ C #scale(x: 120%, y: 120%)[\[] P sqrt(I) + \( M + sqrt(A) \) I S \( w \) #scale(x: 120%, y: 120%)[\]] .
   $ <dir:baseline>]

 The integral of the full force satisfies
#[#set math.equation(numbering: n => "(5.3)")
 $ integral_(cal(T)) \| K \( t \) \| thin d t lt.eq C sqrt(w) #scale(x: 120%, y: 120%)[\[] P
   sqrt(I) + \( M + sqrt(A) \) I S \( w \) #scale(x: 120%, y: 120%)[\]] . $ <dir:absolute>]

 The constant $C$ is independent of $P \, w \, I \, M \, A$.]
] <dir:direct>

We prove the proposition in several steps. All dyadic sums below have fixed overlap constants.
  The normalization of the radius by $max \( 1 \, T_0 \)$ is absorbed into $C$, so that $r asymp h$.

=== 5.1 Field budgets and a single bin <field-budgets-and-a-single-bin>

We require field budgets shared by all the momentum and source-scale bins.
  Write $chi_phi.alt \( t \, s \, n \)$ for the indicator of a fixed enlarged support of the receiver-angle bin.
  The overlap of these supports is bounded independently of all parameters. Define

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(G)_phi.alt = 1 / I integral_(cal(T)) d t integral_0^t d s integral_(bb(S)^2) d n thin r^2
   chi_phi.alt \( t \, s \, n \) G \( s \, X \( t \) - r n \, n \)^2 . $ <dir:G-budget>]

The cone-energy estimate (3.2) gives $sum_phi.alt cal(G)_phi.alt lt.eq C$.
  In particular this budget does not depend on $p \, theta \, sigma \, h$.

For the magnetic field, let $J^(*)$ be the common enlargement of $J$ from the preceding section,
  chosen to contain all source times when $h lt.eq I$; thus $\| J^(*) \| lt.eq C I$.
  At a point $\( s \, y \)$ with a retarded receiver time $t_(upright("ret")) \( s \, y \) in \( s \, tau \]$, put

$ n_(upright("ret")) \( s \, y \) =
  frac(X \( t_(upright("ret")) \( s \, y \) \) - y, t_(upright("ret")) \( s \, y \) - s) . $

Set the indicator in the following definition to zero when the retarded time does not exist:

#[#set math.equation(numbering: n => "(5.5)")
 $ cal(F)_phi.alt = 1 / I integral_(J^(*)) d s integral_(bb(R)^3) d y thin \| B \( s \, y \) \|^2 chi_phi.alt
   #scale(x: 120%, y: 120%)[\(] t_(upright("ret")) \( s \, y \) \, s \,
   n_(upright("ret")) \( s \, y \) #scale(x: 120%, y: 120%)[\)] . $ <dir:F-budget>]

The retarded time is unique and is a measurable function on its domain.
  Bounded overlap and conserved spatial energy (3.1) imply $sum_phi.alt cal(F)_phi.alt lt.eq C$.
  Again the budget is independent of $p \, theta \, sigma \, h$.
  The Jacobian $r^2 D$ of the map $\( t \, n \) mapsto X \( t \) - \( t - s \) n$,
  together with $D asymp phi.alt^2$, gives

#[#set math.equation(numbering: n => "(5.6)")
 $ integral_(upright("bin")) r^2 phi.alt^2 \| B \|^2 thin d t thin d s thin d n lt.eq C \( I + h \) cal(F) \, wide
   cal(F) = cases(delim: "{", cal(F)_phi.alt \, & h lt.eq I \,, 1 \, & h > I .) $ <dir:magnetic-budget>]

For $h > I$ the source times lie in an interval of length $O \( I + h \)$,
  so conserved spatial energy proves the second case directly.
  The budgets in (5.4)–(5.5) may always be enlarged by fixed factors when supports are enlarged.

For a fixed bin, let $N = integral_(upright("bin")) f thin d v$ and denote its hit measure by $sans(M)$.
  By (4.5), the angular cap bound, and the definition of $sans(M)$,

#[#set math.equation(numbering: n => "(5.7)")
 $ N & lt.eq C p^3 nu^2 \, wide integral_(upright("bin")) d t thin d s thin d n lt.eq C I h phi.alt^2 \,\
integral N thin d t thin d s thin d n & lt.eq frac(C sans(M), h^2 phi.alt^2) \,\
integral N^2 thin d t thin d s thin d n & lt.eq
  C min (I h phi.alt^2 p^6 nu^4 \, frac(p^3 nu^2 sans(M), h^2 phi.alt^2)) . $ <dir:density-integrals>]

Here and below $N$ vanishes outside the indicated time and spatial restrictions.
  In the small sector $nu = theta$ and the $sigma$ partition is omitted.

The force majorants on this bin are, up to fixed constants,

$ T_r = frac(f, r^2 p^2 theta^2) \, wide T_perp = frac(f phi.alt, r^2 p^2 theta^3) \, wide S_g =
  frac(f phi.alt G, r p theta^2) \, wide S_b = frac(f phi.alt \| B \|, r p) . $

Using $d y = r^2 d s thin d n$ yields the following bounds for their integrals. Both columns apply on every bin:
  the near bound uses the pointwise density estimate, while the far bound also uses the occupation measure.
  Their names indicate which estimate is useful at smaller or larger radii.

#[#set math.equation(numbering: n => "(5.8)")
 $ & upright("near bound") & upright("far bound")\
T_r & I h p \( nu \/ theta \)^2 phi.alt^2 & -\
T_perp & I h p theta^(- 3) nu^2 phi.alt^3 & sans(M) \/ \( h^2 phi.alt p^2 theta^3 \)\
S_g & I sqrt(h) thin p^2 \( nu \/ theta \)^2 phi.alt^2 sqrt(cal(G)_phi.alt) & sqrt(I) sqrt(p sans(M)) thin
  nu \( theta^2 h \)^(- 1) sqrt(cal(G)_phi.alt)\
S_b & sqrt(I \( I + h \)) sqrt(h) thin p^2 nu^2 phi.alt sqrt(cal(F)) & sqrt(I + h) sqrt(p sans(M)) thin
  nu \( phi.alt h \)^(- 1) sqrt(cal(F)) . $ <dir:near-far>]

The first two rows follow from (5.7). For $S_g$, apply Cauchy–Schwarz to $r G N$:
  the first squared factor is bounded by $I cal(G)_phi.alt$ and the second by either bound for $integral
  N^2$ in (5.7). The prefactor is $phi.alt \/ \( p theta^2 \)$.
  For $S_b$, use $r phi.alt \| B \|$ as the first factor, apply (5.6), and use the prefactor $1 \/ p$.
  This proves every entry of the table.

=== 5.2 Summing the radius <summing-the-radius>

Recall the occupation factor

$ R = 1 + sqrt(I \/ lambda) sqrt(cal(E)) \, wide cal(E) =
  cases(delim: "{", 1 \, & theta gt.eq kappa phi.alt \,, cal(E)_(p phi.alt) \, & theta < kappa phi.alt \,) wide
  sum_(p \, phi.alt) cal(E)_(p phi.alt) lt.eq C . $

It is independent of $h$, and also of $theta$ in the small sector. The refined occupation estimate (4.16) gives

#[#set math.equation(numbering: n => "(5.9)")
 $ sans(M) lt.eq C h k_1 R^2 \/ p $ <dir:occupation>]

when $h lt.eq I$, except in deficit bins with $h lt.eq lambda$.
  For $h > I$ the same inequality follows from (4.7), since $R \, k_1 gt.eq 1$.

For positive $a \, b \, alpha \, beta$, the elementary dyadic estimate

#[#set math.equation(numbering: n => "(5.10)")
 $ sum_(h in 2^(bb(Z))) min \( a h^alpha \, b h^(- beta) \) lt.eq
   C_(alpha \, beta) a^(beta \/ \( alpha + beta \)) b^(alpha \/ \( alpha + beta \)) $ <dir:balance>]

follows by splitting at $h = \( b \/ a \)^(1 \/ \( alpha + beta \))$ and summing geometric series on both sides.
  It remains an upper bound when the allowed radii form only a subset of the dyadic scales.
  Substituting (5.9) into (5.8) and applying (5.10) gives

#[#set math.equation(numbering: n => "(5.11)")
 $ T_perp : & quad C sqrt(I) thin R p^(- 1) theta^(- 3) nu phi.alt sqrt(k_1) \,\
S_g : & quad C I^(3 \/ 4) R^(1 \/ 2) p phi.alt nu^(3 \/ 2) theta^(- 2) k_1^(1 \/ 4) sqrt(cal(G)_phi.alt) \,\
S_b med \( h lt.eq I \) : & quad C I^(3 \/ 4) R^(1 \/ 2) p nu^(3 \/ 2) k_1^(1 \/ 4) sqrt(cal(F)_phi.alt) .
  $ <dir:balanced>]

The first line balances $h$ with $h^(- 1)$; the other two balance $h^(1 \/ 2)$ with $h^(- 1 \/ 2)$.
  The exceptional deficit radii are excluded from these balances and are treated below.

For $S_b$ with $h > I$, use instead the time-change bound (4.7), namely $sans(M) lt.eq C I phi.alt^2 \/ theta^2$.
  The corresponding minimum in (5.8) is

$ C sqrt(I) min (h p^2 nu^2 phi.alt \, h^(- 1 \/ 2) sqrt(p) thin nu \/ theta) . $

Its radius sum is at most

#[#set math.equation(numbering: n => "(5.12)")
 $ C sqrt(I) thin p nu^(4 \/ 3) theta^(- 2 \/ 3) phi.alt^(1 \/ 3) . $ <dir:large-radius>]

If one of $theta \, phi.alt$ is much larger than the other, $sigma$ has bounded multiplicity or is absent,
  and the angular factor is at most $theta^(2 \/ 3) phi.alt^(1 \/ 3)$.
  If $theta asymp phi.alt$, it is at most $C theta \( sigma \/ theta \)^(4 \/ 3)$, with $sigma lt.tilde theta$.
  The angular sums are geometric in both cases. Summing $p$ proves that all large-radius $S_b$ terms cost at most
  $C P sqrt(I)$.

In an exceptional deficit bin, $h lt.eq min \( I \, lambda \)$ and $lambda lt.eq C P^(- 2)$ by (4.10).
  Summing the near bounds over these radii gives, per remaining bin,

#[#set math.equation(numbering: n => "(5.13)")
 $ S_g + S_b & lt.eq C I frac(p^2, P m^2) \,\
T_perp & lt.eq
  cases(delim: "{", C I p \/ P^2 \, & theta gt.eq kappa phi.alt \,, C I p^2 \/ P^2 \, & theta < kappa phi.alt .)
  $ <dir:deficit>]

Indeed, in the remaining sector $phi.alt lt.tilde theta$ and $nu lt.tilde m^(- 1)$,
  whereas in the small sector $nu = theta$, $phi.alt lt.tilde m^(- 1)$, and $theta^(- 1) lt.eq p$.
  The individual field budgets are bounded by their total budgets. There are at most $C L^4$ remaining bins. Since

$ frac(p^2, P m^2) lt.eq 1 / P + P / w^2 \, wide p^2 / P^2 lt.eq 1 \, $

the ratio of their total cost to $I S \( w \)$ is at most

$ C L^3 (w / P^3 + frac(1, P w) + w / P^2) lt.eq frac(C L^3, P) . $

Thus these terms are absorbed uniformly into $C I S \( w \)$.

The radius sum for $T_r$ is also immediate from its near bound.
  When $theta asymp phi.alt$, summing $\( nu \/ theta \)^2$ over $sigma$ is a geometric sum;
  otherwise $sigma$ has bounded multiplicity or is omitted.
  Summing $h$, the $O \( L \)$ values of $theta$, then $phi.alt^2$ and $p$, gives

#[#set math.equation(numbering: n => "(5.14)")
 $ integral T_r lt.eq C I P L lt.eq C I S \( w \) . $ <dir:radial-transport>]

=== 5.3 Angular and momentum sums <angular-and-momentum-sums>

The radius sums are complete, including the deficit exception and the magnetic terms with $h > I$.
  It remains to sum the angular and momentum factors in (5.11).
  We keep the small-sector $S_g$ contribution separate because it yields the absolute-force bound with its
  additional factor $sqrt(w)$. The following elementary momentum sums will be used repeatedly:

#[#set math.equation(numbering: n => "(5.15)")
 $ sum_p p & lt.eq C P \, & sum_p p / m & lt.eq C \( L + P \/ w \) \, & sum_p sqrt(p) / m & lt.eq
   C \( 1 + sqrt(P) \/ w \) \,\
sum_p p sqrt(P \/ m) & lt.eq C P sqrt(P \/ w) \, &  & sum_p p^(3 \/ 2) sqrt(P \/ m) & lt.eq
  C P^2 \/ sqrt(w) . $ <dir:momentum-sums>]

To verify them, split at $p = w$. For $p lt.eq w$ one has $m = p$; for $p > w$ one has $m = w$.
  Each resulting positive-power sum is geometric, while a constant summand costs at most $C L$.

Write $omega = sigma$ in the remaining sector and $omega = phi.alt$ in the small sector.
  The definition of $lambda$ gives the exact parameter dependence

#[#set math.equation(numbering: n => "(5.16)")
 $ R - 1 & lt.eq C sqrt(I) P / m (M / omega + sqrt(A L) / sqrt(omega)) sqrt(cal(E)) \,\
R^(1 \/ 2) & lt.eq
  C [1 + I^(1 \/ 4) sqrt(P \/ m) (sqrt(M) / sqrt(omega) + frac(\( A L \)^(1 \/ 4), omega^(1 \/ 4)))] .
  $ <dir:R-expansion>]

For the second line we used $cal(E) lt.eq C$; the first line retains the joint small-sector budget when it is needed.

===== 5.3.1 The small-sector transport term. <the-small-sector-transport-term.>

Here $nu = theta$ and $k_1 asymp 1$. Summing the first line of (5.11) over $theta gt.eq 1 \/ p$ gives

#[#set math.equation(numbering: n => "(5.17)")
 $ C sqrt(I) thin R p phi.alt . $ <dir:small-budget>]

The term with $R$ replaced by one sums to $C P sqrt(I)$. The $M$ term in (5.16) costs

$ C I M P sum_(p \, phi.alt) p / m sqrt(cal(E)_(p phi.alt)) lt.eq C I M P #scale(x: 120%, y: 120%)[\(] L +
  sqrt(L) thin P \/ w #scale(x: 120%, y: 120%)[\)] . $

Indeed, Cauchy–Schwarz and the joint budget reduce the sum to the square root of
  $sum_(p \, phi.alt) \( p \/ m \)^2$, which is at most $C \[ L^2 + L \( P \/ w \)^2 \]$ before taking the square
  root. For the $sqrt(A L)$ term the weight has an additional factor $sqrt(phi.alt)$;
  its squared sum is at most $C \[ L + \( P \/ w \)^2 \]$. That contribution is therefore at most

$ C I sqrt(A L) thin P \( sqrt(L) + P \/ w \) = C I sqrt(A) thin P \( L + sqrt(L) thin P \/ w \) . $

Since $1 lt.eq w lt.eq P$ and $L gt.eq 1$, both parameter terms are bounded by $C \( M + sqrt(A) \) I S \( w \)$.

===== 5.3.2 The remaining-sector transport term. <the-remaining-sector-transport-term.>

Split into $theta > 16 phi.alt$, where $sigma asymp theta$, and $theta asymp phi.alt$,
  where $sigma lt.tilde theta$. Fixed comparison constants may depend on $kappa$.
  The angular factors in the plain term of the first line of (5.11) are respectively

$ p^(- 1) theta^(- 2) phi.alt \, wide p^(- 1) theta^(- 1) \( sigma \/ theta \)^(1 \/ 2) . $

Their sums are bounded uniformly for each $p$: sum $phi.alt lt.tilde theta$ in the first expression,
  and $sigma lt.tilde theta$ in the second, then use $theta gt.eq 1 \/ p$.
  Thus the plain contribution is at most $C L sqrt(I) lt.eq C P sqrt(I)$.

After extracting $C I M P \( p \/ m \)$, the $M$ terms have angular factors

$ \( p theta \)^(- 2) phi.alt / theta \, wide \( p theta \)^(- 2) \( theta \/ sigma \)^(1 \/ 2) . $

The second $sigma$ sum is at most $C sqrt(m theta) lt.eq C sqrt(p theta)$ because $sigma gt.tilde 1 \/ m$;
  hence both remaining angular sums are bounded. After extracting $C I sqrt(A L) thin P sqrt(p) \/ m$,
  the corresponding factors are

$ \( p theta \)^(- 3 \/ 2) phi.alt / theta \, wide \( p theta \)^(- 3 \/ 2) . $

The number of allowed $sigma$ values in the second case is at most $C \[ 1 + log_(+) \( m theta \) \] lt.eq
  C sqrt(p theta)$ on a nonempty bin, so these angular sums are bounded as well.
  Here $log_(+) s = max \( 0 \, log s \)$. By (5.15), the two parameter contributions are at most

$ C I M P \( L + P \/ w \) \, wide C I sqrt(A L) thin P \( 1 + sqrt(P) \/ w \) . $

Both are bounded by $C \( M + sqrt(A) \) I S \( w \)$.

===== 5.3.3 The remaining-sector good-field term. <the-remaining-sector-good-field-term.>

Apart from $C I^(3 \/ 4) p R^(1 \/ 2) sqrt(cal(G)_phi.alt)$, the angular factors for $S_g$ in the same two cases are

$ sqrt(theta) thin phi.alt / theta \, wide sqrt(theta) \( sigma \/ theta \)^(5 \/ 4) . $

At fixed $phi.alt$ their $theta \, sigma$ sums are at most $C sqrt(phi.alt)$.
  Consequently the plain term is at most $C I^(3 \/ 4) P lt.eq C P sqrt(I)$,
  by Cauchy–Schwarz with $sum_phi.alt cal(G)_phi.alt lt.eq C$ and $sum_phi.alt phi.alt lt.eq C$.
  Dividing the displayed factors by $sqrt(sigma)$ leaves, up to constants,

$ phi.alt \/ theta \, wide \( sigma \/ theta \)^(3 \/ 4) \, $

whose sums at fixed $phi.alt$ are bounded. Division by $sigma^(1 \/ 4)$ gives no larger bound, since $sigma lt.eq
  1$. There are at most $C L$ receiver-angle bins, so $sum_phi.alt sqrt(cal(G)_phi.alt) lt.eq C sqrt(L)$.
  The parameter terms in (5.16) therefore cost at most

#[#set math.equation(numbering: n => "(5.18)")
 $ C I #scale(x: 120%, y: 120%)[\(] sqrt(M) + \( A L \)^(1 \/ 4) #scale(x: 120%, y: 120%)[\)] P sqrt(P \/ w)
   sqrt(L) lt.eq C \( M + sqrt(A) \) I S \( w \) . $ <dir:field-parameters>]

The last inequality follows from $w lt.eq P$, $L gt.eq 1$, and $M \, A gt.eq 1$.

===== 5.3.4 The magnetic remainder for $h lt.eq I$. <the-magnetic-remainder-for-hle-i.>

For $S_b$ the base angular factors in the two remaining-sector subcases and in the small sector are respectively

$ theta^(3 \/ 2) \, wide theta^(3 \/ 2) \( sigma \/ theta \)^(5 \/ 4) \, wide theta^(3 \/ 2) . $

Their sums at fixed $phi.alt$ are bounded. This remains true after division by $sqrt(sigma)$ in the
  remaining-sector subcases, giving $theta$ and $theta \( sigma \/ theta \)^(3 \/ 4)$,
  or by $sqrt(phi.alt)$ in the small sector, where the $theta$ sum is at most $C phi.alt$.
  The quarter-power divisions give no larger bound. Using $sum_phi.alt sqrt(cal(F)_phi.alt) lt.eq
  C sqrt(L)$ thus gives the parameter estimate (5.18) again. The plain term is at most $C I^(3 \/ 4) P sqrt(L)$.
  Uniformly in $I$,

#[#set math.equation(numbering: n => "(5.19)")
 $ I^(3 \/ 4) sqrt(L) lt.eq sqrt(I) + I L \, $ <dir:plain-magnetic>]

as follows from $x lt.eq 1 + x^2$ with $x = I^(1 \/ 4) sqrt(L)$.
  Since $P L lt.eq S \( w \)$, this completes the bound for $S_b$.

===== 5.3.5 The small-sector good-field term. <the-small-sector-good-field-term.>

This term is needed only for the absolute estimate (5.3).
  Its base angular factor is $phi.alt \/ sqrt(theta)$, whose $theta$ sum is at most $C sqrt(p) thin phi.alt$.
  The plain contribution is therefore bounded by $C I^(3 \/ 4) P^(3 \/ 2)$. The time restriction (5.1) gives

$ I^(3 \/ 4) P^(3 \/ 2) lt.eq sqrt(w) thin P sqrt(I) . $

For the two parameter terms the $phi.alt$ factors after this sum are $phi.alt^(1 \/ 2)$ and $phi.alt^(3 \/ 4)$.
  Their sums against $sqrt(cal(G)_phi.alt)$ are bounded by Cauchy–Schwarz and geometric summation.
  The last momentum sum in (5.15) gives a total of at most

$ C I #scale(x: 120%, y: 120%)[\(] sqrt(M) + \( A L \)^(1 \/ 4) #scale(x: 120%, y: 120%)[\)] P^2 \/ sqrt(w) lt.eq
  C sqrt(w) \( M + sqrt(A) \) I S \( w \) . $

The exceptional bins were already included in (5.13).

Combining these bounds with (5.12), (5.13), and (5.14) proves (5.2).
  The data force contributes at most $C I$, which is bounded by $C P sqrt(I)$ since $I lt.eq 1$.
  Finally the force representation is bounded by these nonnegative majorants;
  adding the small-sector $S_g$ estimate and using $w gt.eq 1$ proves (5.3). This proves Proposition 12.

== 6 Signed cancellation along the source trajectories <can:section>

The direct force estimates lose an angular factor when the source velocity is much closer to the cone direction
  than the receiver velocity is. In this region we integrate along the source trajectory before taking absolute
  values. The transport part of the force must be included:
  it cancels a term produced by differentiating the cone geometry.

Keep a supported receiver $X \( t \)$, with velocity $a = X'$, energy $q_X$ and momentum derivative $K = V'_X$.
  A source label has position $Y \( s \)$, velocity $u = Y'$ and energy $q$. Along its retarded branch, set

$ t = s + r \, quad r n = X \( t \) - Y \( s \) \, quad d = 1 - n dot.op u \, quad D = 1 - n dot.op a \, quad e =
  1 - a dot.op u \, wide \| n \| = 1 . $

A prime denotes differentiation in $s$ along this branch,
  and $a_t$ denotes the receiver derivative in its own time. By Lemma 8, the retarded measure identities are

#[#set math.equation(numbering: n => "(6.1)")
 $ frac(d t, d s) = d / D \, wide d s thin f_0 \( z \) thin d z =
   D thin d t thin f \( s \, y \, v \) thin d y thin d v . $ <can:measure>]

In particular $d \, D > 0$. Differentiating the retarded relation gives

#[#set math.equation(numbering: n => "(6.2)")
 $ r' = d / D - 1 \, wide r n' = N_0 := d / D \( a - n \) + n - u \, wide n dot.op N_0 = 0 . $ <can:geometry>]

Define the matrices and vectors

#[#set math.equation(numbering: n => "(6.3)")
 $ Q = D upright("Id") + n ⊗ a \, wide H = Q \/ D \, wide g = frac(u - n, d) \, wide k_0 = u - e /
   D n . $ <can:definitions>]

Thus $H g = k_0 \/ d$.

=== 6.1 The exact identity <the-exact-identity>

After the change to $d s thin f_0 \( z \) d z$, the two interior force terms in (3.13) together have kernel

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(K) = - H / r thin partial_s^(\( u \)) g - frac(H g, r^2 q^2 d) . $ <can:input-kernel>]

Here $partial_s^(\( u \))$ differentiates through $u$ alone. The second term is the transport kernel.
  As in the force representation, we suppress the common constant $1 \/ \( 4 pi \)$ throughout this section.

#thm([Lemma 6.1.])[
  (Signed force identity).  #emph[At every non-tip point of a retarded branch,
#[#set math.equation(numbering: n => "(6.5)")
 $ cal(K) = - (frac(k_0, r d))' + frac(e, r^2 D^2) (frac(n, q_X^2 D) - a) +
   frac(n \( a_t dot.op k_0 \), r D^2) . $ <can:label-identity>]

 Consequently the two nondifferentiated terms, in $d t thin d y thin d v$ measure, are
#[#set math.equation(numbering: n => "(6.6)")
 $ cal(R) = frac(f e, r^2 D) (frac(n, q_X^2 D) - a) \, wide cal(A) = frac(f n \( a_t dot.op k_0 \), r D) . $ <can:bulk>]

]
] <can:identity>

#proof[
  The product rule first rewrites the source-acceleration term as
  $ - H / r partial_s^(\( u \)) g = - \( H g \/ r \)' + \( H \/ r \)' g + \( H \/ r \) partial_s^(\( n \)) g . $
  For a variation $A$ of $a$, with $u \, n$ fixed,
  $ partial_a k_0 \[ A \] = n / D \( A dot.op k_0 \) . $
  Since $a' = a_t d \/ D$, its contribution is the last term of (6.5).
    The terms from $r \, n$, including the transport term, are
  $ 1 / r (k_0 / d)'_n - frac(k_0 r', r^2 d) - frac(k_0, r^2 q^2 d^2) . $
  Multiplying by $r^2 d^2$ gives
  $ r d \( k_0 \)'_n + k_0 \( N_0 dot.op u - d r' - q^(- 2) \) . $
  Directly from (6.2) and $\| u \|^2 = 1 - q^(- 2)$,
  $ N_0 dot.op u - d r' - q^(- 2) = - frac(e d, D) \, wide r d \( k_0 \)'_n = -
    frac(e d, D) (N_0 + frac(n \( N_0 dot.op a \), D)) . $
  Finally, $\| a \|^2 = 1 - q_X^(- 2)$ gives
  $ N_0 + frac(n \( N_0 dot.op a \), D) + k_0 = d / D (a - frac(n, q_X^2 D)) . $
  These identities prove the middle term in (6.5), with its stated sign.
    Multiplication by the factor $f D$ in (6.1) gives (6.6). ◻
]

The two residual densities $cal(R)$ and $cal(A)$ contain neither the source acceleration $b$ nor inverse powers of
  the source deficit $d$. The geometric residual $cal(R)$ will be estimated directly.
  The receiver term $cal(A)$ contains $a_t$, so its coefficient must be small enough to use an absolute bound on
  the receiver force. The primitive $k_0 \/ \( r d \)$ retains the source singularity:
  after integration by parts it creates boundary and cutoff-derivative terms. We now keep track of those terms.

=== 6.2 Smooth cutoffs and the small angular sector <smooth-cutoffs-and-the-small-angular-sector>

Use the dyadic representatives $p \, theta \, phi.alt \, h$ for, respectively,

$ q \, wide sqrt(d \/ 2) \, wide sqrt(D \/ 2) \, wide r \/ max \( 1 \, T_0 \) . $

The fixed factor in the convention for $p$ is retained. Thus $q asymp p$, $q_X asymp w$, $d asymp theta^2$,
  $D asymp phi.alt^2$ and $r asymp h$, with constants depending on $T_0$ where necessary.
  The small-sector representatives satisfy $theta < kappa phi.alt$.
  All estimates below remain valid on the wider overlap range $theta lt.eq 16 kappa phi.alt$,
  after choosing the fixed $kappa > 0$ sufficiently small.

Use the smooth partitions chosen in Section 4, whose factors have uniformly bounded derivatives in the logarithm
  of each variable. For an index $j = \( p \, theta \, phi.alt \, h \)$,
  let $beta_j$ be the product of its four factors. These products satisfy

#[#set math.equation(numbering: n => "(6.7)")
 $ beta_j gt.eq 0 \, wide sum_j beta_j = 1 . $ <can:partition>]

The sum is locally finite for $r > 0$, with uniformly bounded overlap.
  Derivative bounds are taken on the closed support indicators;
  no estimate of a derivative by the bump itself is assumed.

#thm([Lemma 6.2.])[
  (Derivatives of a selected sum).  #emph[Let $cal(S)$ be any fixed set of representative indices,
    all in the small sector, and put $chi = sum_(j in cal(S)) beta_j$.
    Selection may depend on the interval and fixed parameters, but not on the variables being differentiated.
    For differentiation through source variables $\( q \, u \)$ alone,
    or through geometric variables $\( r \, n \)$ alone,
#[#set math.equation(numbering: n => "(6.8)")
 $ partial chi = - sum_(j in.not cal(S)) partial beta_j . $ <can:partition-cancel>]

 This derivative vanishes unless selected and unselected supports meet.
   On their intersection, representatives in each coordinate differ by at most a factor of four.
   In particular all relevant supports remain in the wider small-sector range above.]
] <can:cutoff-cancellation>

#proof[
  Differentiate the locally finite identity (6.7) before restricting to a retarded trajectory.
    This proves (6.8) separately for each indicated partial derivative.
    A smooth nonnegative function and its first derivatives vanish at every point where the function vanishes.
    Thus if either family has no positive summand, the corresponding derivative sum is zero.
    Meeting supports constrain each representative to within a factor of two of the same variable,
    proving the factor-four comparison. The ratio $theta \/ phi.alt$ therefore changes by at most a factor of sixteen. ◻
]

The cancellation applies to the cutoff derivative only after its common physical multiplier has been factored out.
  It does not compare derivatives of two different kernels.
  An additional $sigma$-partition may subsequently be inserted into a nonnegative remaining-sector bound at the
  structural edge; it is not differentiated in (6.8).

=== 6.3 Bounds for each derivative <bounds-for-each-derivative>

The Lorentz acceleration satisfies

$ a_t = \( upright("Id") - a ⊗ a \) K \/ q_X . $

The source estimates needed here, with $G = \| E + n times B \| + \| n dot.op B \|$ at the source point, are

#[#set math.equation(numbering: n => "(6.9)")
 $ \| u' \| lt.tilde p^(- 1) \( G + theta^2 \| B \| \) \, quad \| n dot.op u' \| lt.tilde p^(- 1)
   theta \( G + theta^2 \| B \| \) \, quad \| q' \| lt.tilde G + theta \| B \| . $ <can:source-input>]

These are (3.15) with $q asymp p$. For nonzero $V_X$, let $P_X$ denote orthogonal projection perpendicular to
  $V_X$. In the small sector,

#[#set math.equation(numbering: n => "(6.10)")
 $ \| e - D \| lt.tilde phi.alt theta \, quad \| k_0 \| lt.tilde theta \/ phi.alt \,
   quad \| P_X k_0 \| lt.tilde theta \, quad \| P_X n \| lt.tilde phi.alt . $ <can:vector-bounds>]

Indeed $e - D = a dot.op \( n - u \)$; splitting $a = n + \( a - n \)$ proves the first bound,
  and then $k_0 = \( u - n \) + n \( 1 - e \/ D \)$ proves the next two. Also $P_X a = 0$. Since $q_X^(- 2) lt.tilde D$,

#[#set math.equation(numbering: n => "(6.11)")
 $ \| cal(R) \| lt.tilde f \/ r^2 \, quad \| P_X cal(R) \| lt.tilde f phi.alt \/ r^2 \,
   quad \| cal(A) \| lt.tilde frac(f theta \| K \|, w r phi.alt^2) \,
   quad \| P_X cal(A) \| lt.tilde frac(f theta \| K \|, w r phi.alt) . $ <can:bulk-bounds>]

For the last two bounds, $\| a_t \| lt.tilde \| K \| \/ w$ and $\| n dot.op a_t \| lt.tilde phi.alt \| K \| \/ w$.
  Insert the decomposition of $k_0$ in (6.10) to obtain $\| a_t dot.op k_0 \| lt.tilde theta \| K \| \/ w$.

After integration by parts, a cutoff derivative in source time has common multiplier $f D k_0 \/ \( r d \)$ in $d
  t thin d y thin d v$ measure. Its size is at most $C f phi.alt \/ \( r theta \)$,
  with an additional factor $phi.alt$ after projection. The separate logarithmic rates and resulting bounds are as
  follows.

===== 6.3.1 Source derivatives. <source-derivatives.>

From (6.9),

$ frac(\| q' \|, q) + frac(\| d'_u \|, d) lt.tilde 1 / p (G / theta + theta \| B \|) . $

Thus their error kernels are bounded by

#[#set math.equation(numbering: n => "(6.12)")
 $ C (frac(f phi.alt, r p theta^2) G + frac(f phi.alt, r p) \| B \|) . $ <can:source-cutoff-bound>]

They coincide with the direct source-force majorants. By Lemma 14 they may be assigned to overlapping unselected
  support indicators.

===== 6.3.2 Geometric derivatives. <geometric-derivatives.>

Equation (6.2) gives $\| r' \| lt.tilde 1$ and $\| n' \| lt.tilde theta \/ r$. Since $n' perp n$,

$ frac(\| d'_n \|, d) lt.tilde r^(- 1) \, wide frac(\| D'_n \|, D) lt.tilde frac(theta, r phi.alt) lt.tilde r^(- 1) . $

Together with the logarithmic rate of $r$, these give

#[#set math.equation(numbering: n => "(6.13)")
 $ C frac(f phi.alt, r^2 theta) . $ <can:spatial-cutoff-bound>]

These errors can also be assigned to unselected neighbors by Lemma 14.

===== 6.3.3 Receiver derivatives. <receiver-derivatives.>

Only $D$ in the cutoff depends directly on $a$. Its source-time rate is

$ frac(\| D'_a \|, D) = frac(\| n dot.op a_t \|, D) d / D lt.tilde frac(theta^2 \| K \|, w phi.alt^3) . $

Multiplication by $f D k_0 \/ \( r d \)$ gives

#[#set math.equation(numbering: n => "(6.14)")
 $ C frac(f theta \| K \|, w r phi.alt^2) . $ <can:receiver-cutoff-bound>]

This is estimated on selected supports directly. Every bound (6.12)–(6.14) gains a factor $phi.alt$ after
  projection by $P_X$.

===== 6.3.4 Time weights and a varying projection. <time-weights-and-a-varying-projection.>

If $psi \( t \)$ is a Lipschitz weight, its derivative contributes

#[#set math.equation(numbering: n => "(6.15)")
 $ psi_t chi thin frac(f k_0, r) \, wide lr(|frac(f k_0, r)|) lt.tilde frac(f theta, r phi.alt) .
   $ <can:time-weight-bound>]

For $\| V_X \| asymp w$, put $Pi = w P_X \/ \| V_X \|$. Its norm is bounded and $parallel Pi_t parallel
  lt.tilde \| K \| \/ w$, by differentiation of the unit direction $V_X \/ \| V_X \|$ and of $\| V_X \|^(- 1)$.
  Consequently

#[#set math.equation(numbering: n => "(6.16)")
 $ lr(|frac(f Pi_t k_0, r)|) lt.tilde frac(f theta \| K \|, w r phi.alt) . $ <can:projector-derivative>]

This has the size of the projected receiver term. The estimate uses $\| k_0 \| lt.tilde theta \/ phi.alt$,
  so it retains the longitudinal part of $k_0$.

=== 6.4 Integration by parts and the initial cone <integration-by-parts-and-the-initial-cone>

Write $cal(K)_t = f D cal(K)$ for the interior force density in $d t thin d y thin d v$ measure;
  the subscript identifies the measure and does not denote a derivative.

#thm([Proposition 6.3.])[
  (Weighted signed formula).  #emph[Let $J = \[ t_1 \, t_2 \]$ lie in a compact classical time interval.
    Let $0 lt.eq psi lt.eq 1$ be Lipschitz on $J$, vanish at its endpoints, and be extended by zero outside $J$.
    Let $chi$ be a selected sum as in Lemma 14. One may integrate (6.5) labelwise against $psi
    chi$ and a bounded $C^1$ matrix $Pi \( t \)$, including $Pi = upright("Id")$. More precisely,
#[#set math.equation(numbering: n => "(6.17)")
 $ integral_J #h(-0.16667em) integral psi chi Pi cal(K)_t thin d y thin d v thin d t =  & cal(B)_0 +
   integral_J #h(-0.16667em) integral #scale(x: 240%, y: 240%)[\[] psi chi Pi \( cal(R) + cal(A) \) +
   psi_t chi Pi frac(f k_0, r)\
 & #h(25mm)  + psi chi Pi_t frac(f k_0, r) + psi Pi frac(f D k_0, r d) chi'_s #scale(x: 240%, y: 240%)[\]] thin d
   y thin d v thin d t \, $ <can:weighted-terms>]

 where the spatial integral has $r = \| X \( t \) - y \| < t$, all source quantities are evaluated at $s = t - r$,
   and $cal(B)_0$ is the initial-cone boundary term. If $parallel Pi parallel lt.tilde 1$,
   that boundary term is bounded in norm by
#[#set math.equation(numbering: n => "(6.18)")
 $ C integral_J \| psi \( t_0 \) \| thin d t_0 . $ <can:initial-boundary-bound>]

 The constant in (6.18) depends only on the datum and fixed time horizon.
   For $Pi = upright("Id")$, and for $Pi = w P_X \/ \| V_X \|$ when $\| V_X \| asymp w$,
   the derivative kernels satisfy the bounds above, uniformly in the fixed selected index set.
   For a general $Pi$, its derivative term retains the explicit bound $C f theta parallel Pi_t
   parallel \/ \( r phi.alt \)$.]
] <can:weighted-formula>

#proof[
  The null set of labels with a same-time collision with the receiver can be discarded by Lemma 8.
    For any remaining label, continuity on the compact time interval gives $min_t \| Y \( t \) -
    X \( t \) \| > 0$. At a retarded point,
  $ \| Y \( t \) - X \( t \) \| lt.eq \| Y \( t \) - Y \( s \) \| + r lt.eq 2 r \, $
  so $r$ is bounded below on that label’s branch. The branch is $C^1$ and increasing.
    Its entry at source time $s = 0$, when present, has receiver time $t_0$ determined by $t_0 = \| X \( t_0 \) -
    Y \( 0 \) \|$. All other integration endpoints occur where $psi = 0$.
    Products with Lipschitz $psi$ are absolutely continuous along the branch.
    Integrating the total derivative in (6.5) is therefore legitimate for each such label.
    The factors $psi_s = psi_t d \/ D$ and $Pi_s = Pi_t d \/ D$, followed by (6.1), give exactly (6.17).
  The sign at $s = 0$ is positive. Its integrand relative to initial labels is
  $ f_0 \( z \) psi \( t_0 \) chi Pi \( t_0 \) frac(k_0, t_0 d \( 0 \)) . $
  For fixed initial velocity, parameterize the initial position by $y_(upright("in")) = X \( t_0 \) - t_0 n$.
    This map is one-to-one on the initial cone and has absolute Jacobian $t_0^2 D$.
    The initial momentum support bounds $d \( 0 \)$ below, and
  $ D k_0 = D u - n e $
  is bounded in norm. Since $chi lt.eq 1$, boundedness and compact velocity support of $f_0$, and $t_0 lt.eq T_0$,
    give (6.18). The same proof allows disjoint time weights to be summed, using their sum at the initial boundary.
  Finally these operations also hold after integrating the labels and summing the dyadic products.
    On a fixed compact classical interval, $d \, D$ have positive lower bounds on the relevant supported
    trajectories, and source and receiver accelerations are bounded.
    After conversion to $d t thin d y thin d v$, all differentiated kernels have an integrable majorant
    $C_(upright("comp")) f \( r^(- 2) + r^(- 1) \)$, using bounded partition overlap.
    Indeed $d y = r^2 d r thin d n$ and the momentum support is bounded.
    The constant here may depend on compact classical bounds and on the fixed weight;
    it is used only to justify the identity, not in the uniform estimates.
    For a completely truncated argument, insert a radial cutoff vanishing for $r <
    gamma$ and equal to one for $r > 2 gamma$. Its new derivative term is bounded by $C_(upright("comp"))
    f \/ \( gamma r \)$ on $r asymp gamma$, whose integral is $O_(upright("comp")) \( gamma \)$.
    All remaining terms converge by domination. Local finiteness for $r >
    0$ and the same majorants justify the infinite sum of distance bins and its differentiated version.
    Thus no cone-tip boundary remains. ◻
]

=== 6.5 Coefficients used in the later selections <coefficients-used-in-the-later-selections>

We record a coefficient bound used in both selections, so that their receiver-derivative costs can be read without
  repeating the geometry. At a fixed receiver time, the coefficient on $\|
  K \|$ in the receiver term of (6.11) or in (6.14), integrated over one small bin, obeys

#[#set math.equation(numbering: n => "(6.19)")
 $ C / w min (h^2 \( p theta \)^3 \, frac(1, p theta h phi.alt^2)) . $ <can:receiver-coefficient>]

For the first bound use the density estimate $integral_(upright("bin")) f thin d v lt.tilde p^3 theta^2$,
  the $n$-cap area $O \( phi.alt^2 \)$, and $d y = r^2 d s thin d n$.
  For the second, divide the kernel $f theta \/ \( w r phi.alt^2 \)$ by the particle cone-flux density $q d
  f$ and use the cone budget. Projection adds $phi.alt$ to the first bound; the $Pi_t$ term has the same projected size.

The direction estimate in Section 7 will use the first, projected coefficient with its own selection of indices;
  that argument also accounts for the varying projector. The final signed-increment estimate in Section 8 will use
  the two-sided minimum in (6.19). Both applications keep their selected index sets fixed while differentiating
  the cutoffs.

== 7 Direction changes and improved occupation <ang:section>

We now improve the occupation estimate when both particles have high energy and their relative angle is
  intermediate. The additional information is a bound on the number of direction changes of a prescribed angular
  size. Its proof uses the signed bootstrap and the baseline estimates already established;
  it does not use the improved occupation estimate proved at the end of this section.

We retain the notation of the preceding sections. In particular, $L = log \( 2 + P \)$, $S \( w \) = P^2 L \/ w$,
  and $m = min \( p \, w \)$. All constants below may depend on the datum, the fixed time horizon,
  and the fixed decomposition parameters. A constant written $C \( M \, A \)$ may also depend on the two bootstrap
  parameters. The lower threshold for $P$ may depend on $M \, A$. Fix a bootstrap endpoint $tau$:
  throughout this section the bootstrap is assumed only on $\[ 0 \, tau \]$,
  and all time intervals are clipped to this range.

=== 7.1 A bound on changes of direction <a-bound-on-changes-of-direction>

#thm([Lemma 7.1.])[
  (Direction changes).  #emph[Assume the signed increment bootstrap (2.2) on $\[ 0 \, tau \]$.
    Let $w$ be a dyad with $w gt.eq P^(3 \/ 5)$, and let $J subset \[ 0 \, tau \]$ be a closed interval of length
    at most $\( w \/ P \)^2$ on which a supported characteristic satisfies $w \/ 8 lt.eq q_X lt.eq 8 w$. Suppose
$ w^(- 3 \/ 5) lt.eq delta lt.eq w^(- 1 \/ 10) . $

 Starting at the left endpoint of $J$, stop whenever the direction $xi =
   V_X \/ \| V_X \|$ first has chordal distance $delta$ from its direction at the preceding stopping time.
   Include the last, possibly incomplete, interval. For sufficiently large $P$, the number of intervals is at most
#[#set math.equation(numbering: n => "(7.1)")
 $ C \( M \, A \) L^6 \/ delta . $ <ang:count>]

]
] <ang:direction>

#proof[
  Put $I = \( w \/ P \)^2$. Throughout $J$, $\| V_X \| asymp w$, so normalization of nonzero vectors gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ \| xi \( t \) - xi \( s \) \| lt.eq C w^(- 1) \| V_X \( t \) - V_X \( s \) \| . $ <ang:normalization>]
  Define
  $ ell = min {(frac(w delta, M P))^2 \, frac(w delta, A S \( w \))} . $
  The bootstrap and (7.2) bound the direction change on an interval of length $c ell$ by $C \( sqrt(c) + c \)
    delta$. Choosing $c > 0$ sufficiently small proves that each complete first-exit interval has length at least
    $c ell$. In particular their number, denoted by $N_c$, is finite.
  On each complete interval choose an endpoint-zero Lipschitz function $0 lt.eq psi lt.eq
    1$ with monotone ramps of length $c' ell$ and value one between the ramps.
    Choose $c'$ sufficiently small that the ramps are disjoint.
    On a ramp, integrate the removed weight against $xi_t$ after subtracting the direction at its outer endpoint.
    The derivative of the removed weight has $L^1$ norm one, so the removed signed integral is bounded by
    $C \( sqrt(c') + c' \) delta$. Here the bootstrap bounds endpoint-relative increments;
    no bound on absolute direction variation is used. After reducing the fixed constant $c'$ once more,
    each complete interval satisfies
  #[#set math.equation(numbering: n => "(7.3)")
   $ lr(|integral psi thin w xi_t thin d t|) gt.eq 1 / 2 w delta \, wide integral \| psi_t \| thin d t =
     2 . $ <ang:weighted-exit>]
  Let $P_X = upright("Id") - xi ⊗ xi$ and $Pi = w P_X \/ \| V_X \|$, so $w xi_t = Pi K$.
    Apply Proposition 15 with this multiplier and with the fixed selection
  #[#set math.equation(numbering: n => "(7.4)")
   $ theta < kappa phi.alt \, wide p theta sqrt(h) lt.eq 1 . $ <ang:selection>]
  The same representative index set is used on every interval.
    The weights have disjoint interiors and sum to at most one.
    Thus, after taking norms, all bulk errors can be bounded over their union with the single upper length $I$.
    Only derivatives of the weights will produce a factor $N_c$.
  First consider the receiver and time-weight derivatives. Their bounds explain the radial threshold in (7.4).
    The signed primitive contains $k_0 = u - n e \/ D$, with
  $ \| k_0 \| lt.eq C theta \/ phi.alt \, wide \| P_X k_0 \| lt.eq C theta . $
  The projected receiver-acceleration and receiver-cutoff kernels have size at most
  $ C f theta \| K \| \/ \( w r phi.alt \) . $
  The moving projector has precisely the same size: writing $rho = \| V_X \|$ gives
  $ Pi_t = - w / rho^2 [\( xi dot.op K \) P_X + \( P_X K \) ⊗ xi + xi ⊗ \( P_X K \)] \, wide \| Pi_t k_0 \| lt.eq
    frac(C theta \| K \|, w phi.alt) . $
  The representative $w$ is fixed here; no dyad indicator is differentiated.
  At fixed receiver time, integrating these kernels over a bin uses the radial factor $C h^2$,
    the velocity density bound $C p^3 theta^2$, and an angular cap of area $C phi.alt^2$.
    Their coefficient on $\| K \|$ is therefore
  #[#set math.equation(numbering: n => "(7.5)")
   $ frac(C h^2 \( p theta \)^3 phi.alt, w) lt.eq frac(C sqrt(h) thin phi.alt, w) quad
     upright("on selected indices") . $ <ang:receiver-coefficient>]
  The sums in $h \, phi.alt$ are geometric. The remaining $p \, theta$ count is $O \( L^2 \)$,
    so the total coefficient is $C L^2 \/ w$. The baseline absolute-force bound on our interval is
  $ integral_J \| K \| thin d t lt.eq C sqrt(w) { P sqrt(I) + \( M + sqrt(A) \) I S \( w \) } lt.eq
    C \( M \, A \) w^(3 \/ 2) L . $
  Thus all receiver and projector derivative terms contribute at most $C \( M \, A \) w^(1 \/ 2) L^3$.
    They do not contribute a factor $N_c$.
  For a weight derivative, the kernel is $f Pi k_0 \/ r$, and its fixed-time coefficient is instead
  #[#set math.equation(numbering: n => "(7.6)")
   $ C h^2 \( p theta \)^3 phi.alt^2 lt.eq C sqrt(h) thin phi.alt^2 . $ <ang:weight-coefficient>]
  Its sum is $C L^2$. Equation (7.3) consequently gives a total weight-derivative cost $C L^2 N_c$.
    Initial-cone boundary terms are bounded by $C integral sum psi thin d t lt.eq C I$ and create no further cell count.
  We now estimate the remaining terms. On the complementary small-sector bins,
    $p theta sqrt(h) > 1$ will make the projected good-field far bound summable.
    Outside the small-scale deficit exception, the baseline occupation estimates give
  #[#set math.equation(numbering: n => "(7.7)")
   $ sans(M) lt.eq C h R^2 \/ p \, wide R = 1 + sqrt(I \/ lambda) . $ <ang:baseline-R>]
  For $h > I$ this follows instead from the elementary energy bound $sans(M) lt.eq C h \/ p$.
    We use the unrefined $R$ in (7.7); in particular no enhanced occupation estimate enters this proof.
    The definition of $lambda$ in the small sector yields
  #[#set math.equation(numbering: n => "(7.8)")
   $ sqrt(I) thin R p phi.alt & lt.eq frac(w p phi.alt, P) + C frac(w^2 p, P m) (M + sqrt(A L phi.alt)) lt.eq
     C \( M \, A \) w sqrt(L) \, $ <ang:R-bound>]
  where $w p lt.eq m P$ was used in the last inequality.
  The baseline direct force bound contributes at most $C \( M \, A \) w L$.
    For the small-sector good-field term, perpendicular projection supplies an additional factor $phi.alt$.
    Its far bound outside (7.4) is therefore
  $ C sqrt(I) thin R frac(phi.alt, theta sqrt(h)) lt.eq frac(C \( M \, A \) w sqrt(L), p theta sqrt(h)) . $
  When the second condition in (7.4) fails, the denominator is greater than one and $h > P^(- 2)$.
    Hence only $O \( L \)$ radial dyads occur. There are also $O \( L \)$ momentum dyads and $O \( L \)$ dyads for
    each angle. Summing gives at most $C \( M \, A \) w L^5$.
  The small deficit exception is entirely within (7.4) after increasing the fixed constant $C_1$ in the definition
    of $lambda$. Indeed, when $h lt.eq lambda$ and $phi.alt lt.eq C_0 \/ m$,
  $ p theta sqrt(h) lt.eq p theta sqrt(lambda) lt.eq C kappa \( p \/ P \) m phi.alt^2 \/ C_1 lt.eq
    C kappa C_0^2 \/ \( C_1 m \) lt.eq 1 . $
  Source cutoff derivatives are assigned to overlapping unselected bins by Lemma 14.
    At the structural edge $theta asymp kappa phi.alt$, use the direct bounds for the remaining sector.
    Fixed-factor neighboring indices change only constants in these estimates.
  By (6.13), the projected spatial cutoff kernel is bounded by $C f phi.alt^2 \/ \( r^2 theta \)$.
    Its baseline near/far balance, followed by the geometric sum in $h$, is
  $ C sqrt(I) thin R p phi.alt^2 $
  per remaining indices. By (7.8), the sum over $p \, theta \, phi.alt$ is at most $C \( M \, A \) w L^4$.
    The projected central residual is $C f phi.alt \/ r^2$, which is smaller in this sector.
    For the exceptional deficit scales, use their near bounds directly.
    Summing $h lt.eq lambda lt.eq C \/ P^2$ and then $theta lt.eq C phi.alt$ gives
  $ C I P^(- 2) p^3 phi.alt^5 lt.eq C I p^3 \/ \( P^2 m^5 \) . $
  These terms fit the same bulk bound after summing the remaining dyads.
    This separate near estimate avoids using (7.7) on its exceptional set.
  Summing (7.3) now yields the conservative bound
  $ 1 / 2 N_c w delta lt.eq C \( M \, A \) w L^6 + C L^2 N_c . $
  Since $w delta gt.eq w^(2 \/ 5) gt.eq P^(6 \/ 25)$, the last term is absorbed for sufficiently large $P$.
    Division by $w delta$ and addition of the last incomplete interval prove (7.1). ◻
]

=== 7.2 Occupation at intermediate angles <occupation-at-intermediate-angles>

The baseline cell argument keeps each velocity within a small multiple of $phi.alt$ of its value at a reference
  hit, so its cell length $lambda$ shrinks with that tolerance.
  We now use cells whose length is chosen to keep only the energies comparable to $p$ and $w$.
  Within each such cell, Lemma 16 partitions the source and receiver motions into intervals of nearly fixed
  direction. Their common refinement permits the same monotone-crossing argument as before;
  the number of direction intervals controls the total hit duration.

#thm([Lemma 7.2.])[
  (Direction-based occupation at intermediate angles).  #emph[Assume the signed increment bootstrap on
    $\[ 0 \, tau \]$. Let a small-sector bin satisfy
#[#set math.equation(numbering: n => "(7.9)")
 $ p \, w gt.eq P^(7 \/ 10) \, wide j^(- 49 \/ 100) lt.eq phi.alt lt.eq
   j^(- 4 \/ 25) quad \( j = p \, w \) . $ <ang:window>]

 Let the eligible receiver times lie in a closed interval $J subset \[ 0 \, tau \]$ of length at most $I
   lt.eq \( w \/ P \)^2$, with receiver energy in $\[ w \/ 8 \, 8 w \]$ at those times.
   Set $I_m^0 = \( m \/ P \)^2$ and $beta = 29 \/ 25$. Then, for $P gt.eq P_(*) \( M \, A \)$, the hit measure satisfies
#[#set math.equation(numbering: n => "(7.10)")
 $ sans(M) lt.eq C h / p phi.alt^(- beta) max (1 \, I / I_m^0 \, h / I_m^0) . $ <ang:improved-occupation>]

 The constant $C$ is independent of $M \, A$.]
] <ang:improved-hit>

#proof[
  The window (7.9) implies
  #[#set math.equation(numbering: n => "(7.11)")
   $ m phi.alt gt.eq m^(51 \/ 100) \, wide m^(- 2) \/ phi.alt lt.eq m^(- 151 \/ 100) \, wide phi.alt lt.eq
     P^(- 14 \/ 125) . $ <ang:margins>]
  Thus the bins are actual for large $P$, and speed-magnitude deficits are small compared to $phi.alt$.
  Choose a sufficiently large fixed constant $C_2$ and put
  $ Q_0 = C_2 \( M^2 + A L \) \, wide lambda_0 = I_m^0 \/ Q_0 . $
  For $h > lambda_0$, the elementary energy estimate already suffices.
    Indeed, for sufficiently large $P$, (7.11) implies $phi.alt^(- beta) gt.eq Q_0$,
    and hence $h phi.alt^(- beta) gt.eq I_m^0$. Consequently
  $ h phi.alt^(- beta) max \( 1 \, I \/ I_m^0 \, h \/ I_m^0 \) gt.eq max \( I \, h \) \, $
  which proves (7.10) in this case.
  Suppose now that $h lt.eq lambda_0$. For upper bounds we may enlarge to all eligible receiver times in $J$ and
    use closed bin support ranges. Partition source time into intervals of length $lambda_0$,
    clipped to $\[ 0 \, tau \]$. All hit source times lie in an interval of length at most $C \( I + h \)$,
    so at most $C \( 1 + \( I + h \) \/ lambda_0 \)$ original intervals can contribute. Fix one such interval $F$.
    Extend it to the right by $C_T h$, where $C_T$ bounds $r \/ h$, and clip this extension to $\[ 0 \, tau \]$.
  If $F$ has a hit, the receiver energy is comparable to $w$ throughout the extended interval.
    For every label hitting $F$, its source energy is comparable to $p$ throughout $F$.
    To see this, apply the bootstrap up to the first exit from a fixed enlarged range around a reference hit
    energy. On a time interval of length $C_T lambda_0$, the two bootstrap terms are at most $C m \/
    sqrt(C_2)$ and $C m \/ C_2$. Increasing $C_2$ excludes the first exit.
    The argument works in both time directions and is unaffected by clipping.
  For each use of Lemma 16, choose a dyad $j'$ nearest the relevant reference-hit energy.
    It is comparable to $w$ for the receiver and to $p$ for a source.
    The entire interval stays within $\[ j' \/ 8 \, 8 j' \]$.
    Increasing $C_2$ also ensures that its length is at most $\( j' \/ P \)^2$.
    For large $P$, $j' gt.eq P^(3 \/ 5)$. Choose a small fixed $c_2 > 0$ and use $delta = c_2 phi.alt$.
    Uniformly for $j' asymp j$,
  $ frac(delta, j' ""^(- 3 \/ 5)) gt.eq c j^(11 \/ 100) arrow.r oo \, wide frac(delta, j' ""^(- 1 \/ 10)) lt.eq
    C j^(- 3 \/ 50) arrow.r 0 . $
  Therefore all the hypotheses of Lemma 16 hold.
  Choose one common receiver direction partition on the extended interval.
    Its number of cells is at most $C \( M \, A \) L^6 \/ phi.alt$.
    For each hit label, independently choose its source direction partition on $F$,
    with the same bound on the number of cells. We shall prove that the hit duration for each such label is at most
  #[#set math.equation(numbering: n => "(7.12)")
   $ C \( M \, A \) h L^6 \/ phi.alt . $ <ang:label-duration>]
  Call a hit bad if a boundary $b$ of the receiver direction partition lies in $\[ s \, t \]$,
    and call all other hits good. Since $0 < t - s lt.eq C_T h$,
    the source time of a bad hit belongs to $\[ b - C_T h \, b \]$.
    The total duration of bad hits is thus bounded by $C \( M \, A \) h L^6 \/ phi.alt$.
    This bound uses only the time difference $t - s$; it is independent of the retarded derivative $d t \/ d s$.
  At a remaining hit, $s \, t$ lie in one receiver direction cell.
    Throughout $\[ s \, t \]$ its direction varies by at most $2 c_2 phi.alt$,
    and its speed differs from one by $O \( w^(- 2) \)$. The bin condition $\| a \( t \) - n \| lt.eq
    C phi.alt$ and (7.11) therefore give
  #[#set math.equation(numbering: n => "(7.13)")
   $ \| Y \( s \) - X \( s \) \| = lr(|integral_s^t \( a \( zeta \) - n \) thin d zeta|) lt.eq
     C h phi.alt . $ <ang:small-separation>]
  On $F$, refine the source and receiver direction partitions together.
    The number of resulting intervals is bounded by the sum of the two numbers of cells plus one.
    In one such interval containing a good hit, choose that hit as reference.
    Actual small-angle geometry gives $\| u \( s \) - a \( t \) \| gt.eq c phi.alt$.
    Replacing $a \( t \)$ by $a \( s \)$ changes this vector by at most $C c_2 phi.alt + C m^(- 2)$.
    At any other time in the combined interval, the change of relative velocity has the same bound,
    since each direction varies by at most $2 c_2 phi.alt$ and both speed deficits are $O \( m^(- 2) \)$.
    Choose $c_2$ small and then $P$ large. There is a fixed unit vector $e_F$ for this label and combined interval
    such that
  $ e_F dot.op \( u \( s \) - a \( s \) \) gt.eq c phi.alt $
  throughout it. Thus $e_F dot.op \( Y - X \)$ is strictly increasing with derivative at least $c phi.alt$.
    At good hits it lies in an interval of length at most $C h phi.alt$, by (7.13).
    Their total duration in this combined interval is consequently at most $C h$.
    This remains true when the good-hit set has several components.
    Summing the combined intervals and adding the bad-hit bound proves (7.12).
  The set of labels hitting $F$ has mass at most $C \/ p$: at any one time of $F$,
    all of these labels have energy at least $c p$, by the preceding stability argument,
    and total particle energy is bounded. The closed support convention makes the set of hit labels a compact
    projection before the null collision labels are discarded, as in the baseline occupation argument.
    The hit set is measurable, and the preceding reasoning bounds each of its source-time sections.
    The label-dependent reference hits and direction partitions serve only to prove this numerical bound;
    no measurability of those choices is required.
  Multiplying the mass bound by (7.12) and then counting the original intervals yields
  #[#set math.equation(numbering: n => "(7.14)")
   $ sans(M) & lt.eq C \( M \, A \) h / p phi.alt^(- 1) L^6 (1 + frac(I + h, lambda_0))\
 & lt.eq C \( M \, A \) h / p phi.alt^(- 1) L^7 max (1 \, I / I_m^0 \, h / I_m^0) . $ <ang:before-absorption>]
  Clipped intervals and final direction remainders satisfy all the same estimates.
    Finally, since $beta - 1 = 4 \/ 25$, (7.11) gives
  $ phi.alt^(- \( beta - 1 \)) gt.eq P^(56 \/ 3125) . $
  This positive power absorbs the factor $C \( M \, A \) L^7$ for $P gt.eq P_(*) \( M \, A \)$.
    Equation (7.14) becomes (7.10), with a constant independent of the bootstrap parameters. ◻
]

The gain in Lemma 17 comes from controlling how often relative motion can change its direction.
  Within each combined direction interval, a hit is confined to a short monotone crossing.
  Only after this estimate has been proved will it be used in the final selection of bins for the signed momentum bound.

== 8 Selecting the signed part of the force <sel:section>

Fix a supported receiver and an interval $J = \[ t_1 \, t_2 \]$ of length $I > 0$ on which $w \/ 8 lt.eq q_X lt.eq
  8 w$. Throughout this section we assume (2.2) and

#[#set math.equation(numbering: n => "(8.1)")
 $ I lt.eq \( w \/ P \)^2 . $ <sel:short>]

Write $L = log \( 2 + P \)$ and $S \( w \) = P^2 L \/ w$. The estimates proved above give

#[#set math.equation(numbering: n => "(8.2)")
 $ cal(B) \( I \, w \) = P sqrt(I) + \( M + sqrt(A) \) I S \( w \) $ <sel:baseline>]

as a bound, up to a fixed factor, for the direct transport and magnetic-remainder terms and the remaining-sector
  good-field term. They also give

#[#set math.equation(numbering: n => "(8.3)")
 $ integral_J \| K \( t \) \| thin d t lt.eq C sqrt(w) thin cal(B) \( I \, w \) . $ <sel:absolute>]

The extra factor $sqrt(w)$ in this absolute estimate will be canceled by the small coefficient of the receiver
  terms after signed integration by parts.

Only the narrow-angle contribution controlled by $S_g$ remains outside the baseline bound.
  We estimate bins directly when a near or far bound for $S_g$ is already below a summable threshold.
  On the other bins we apply the signed identity to the original force kernels, including the transport term.
  The main task is to show that these selected bins have a sufficiently small coefficient on the receiver acceleration.

We use the small-sector representatives $p \, theta \, phi.alt \, h$, with $theta < kappa phi.alt$, $theta gt.eq
  1 \/ p$, $p lt.eq P$, and $phi.alt \, h lt.eq 1$. All constants below may depend on the fixed decomposition and on

#[#set math.equation(numbering: n => "(8.4)")
 $ epsilon.alt = 10^(- 5) \, wide beta = 1.16 \, $ <sel:epsilon>]

but are independent of $M \, A \, P \, I \, w$. A sufficiently large lower threshold for $P$ may depend on $M \, A$.

=== 8.1 The selection and its summable weight <the-selection-and-its-summable-weight>

Put $m = min \( p \, w \)$ and recall the small-sector stability length

#[#set math.equation(numbering: n => "(8.5)")
 $ lambda^(- 1 \/ 2) = C_1 P / m (M / phi.alt + sqrt(frac(A L, phi.alt))) . $ <sel:lambda>]

Put $I_m^0 = \( m \/ P \)^2$. The three occupation bounds available for selection come from energy,
  stable source-time cells, and the direction estimate, respectively.
  Define $sans(M)_(*)$ to be the minimum of the applicable entries in the following table.
  The displayed entries contain no implicit constants.

#[#set math.equation(numbering: n => "(8.6)")
 $ upright("entry") & upright("condition for inclusion")\
max \( I \, h \) \/ p & upright("always")\
\( h \/ p \) max \( 1 \, I \/ lambda \, h \/ lambda \) & phi.alt > C_0 \/ m\
\( h \/ p \) phi.alt^(- beta) max \( 1 \, I \/ I_m^0 \, h \/ I_m^0 \) & p \, w gt.eq P^.7 \, quad j^(- .49) lt.eq
  phi.alt lt.eq j^(- .16) med \( j = p \, w \) \, $ <sel:pure>]

The occupation estimates give $sans(M) lt.eq C sans(M)_(*)$ in every small bin.
  The distinction between this inequality and the exact entries of (8.6) is useful:
  the selection below is an exact inequality between representative quantities.

We assign a summable weight to each bin:

#[#set math.equation(numbering: n => "(8.7)")
 $ W = \( P theta \)^(- epsilon.alt) phi.alt^epsilon.alt h^epsilon.alt . $ <sel:weight>]

The same weight has two roles. The good-field contribution of an unselected bin will be at most $C P sqrt(I) thin
  W$ by direct estimation. For a selected bin, we will prove that the coefficient of $\|
  K \|$ in the receiver terms is at most $C w^(- 1 \/ 2) W$.
  Summing the latter coefficients will cancel the factor $sqrt(w)$ in (8.3).
  The remaining task will then be to control the central residual and the cutoff and time-weight derivatives in
  the signed formula.

A small bin is #emph[selected] if

#[#set math.equation(numbering: n => "(8.8)")
 $ min {I sqrt(h) thin p^2 phi.alt^2 \, frac(sqrt(I) sqrt(p sans(M)_(*)), theta h)} > P sqrt(I) thin W .
   $ <sel:selection>]

This is a fixed set of indices during $J$. In particular,
  taking a partial derivative of a cutoff does not differentiate the selection.

#thm([Lemma 8.1.])[
  #emph[The sum of $W$ over all small-sector indices is bounded by a constant depending only on $epsilon.alt$ and
    the fixed decomposition. The unselected small-sector good-field terms have total integral at most $C P sqrt(I)$.]
] <sel:weight-sum>

#proof[
  The $theta$ sum satisfies
  $ sum_(theta gt.eq 1 \/ p) \( P theta \)^(- epsilon.alt) lt.eq C_epsilon.alt \( p \/ P \)^epsilon.alt . $
  The remaining sums in $p lt.eq P$, $phi.alt lt.eq 1$, and $h lt.eq 1$ are geometric.
    The small sector has no additional $sigma$ partition. For an unselected bin,
    the near and far good-field estimates, together with $sans(M) lt.eq C sans(M)_(*)$,
    bound its integral by $C P sqrt(I) thin W$. Summing proves the second assertion. ◻
]

=== 8.2 The receiver coefficient on selected bins <the-receiver-coefficient-on-selected-bins>

We first verify the coefficient bound promised by the selection.
  The source-time identity produces both the receiver-acceleration term $cal(A)$ and a derivative of the
  receiver-angle cutoff. By (6.11) and (6.14), both have majorant $C f theta \| K \| \/ \( w r phi.alt^2 \)$.
  At a fixed receiver time, the density bound $integral_(upright("bin")) f thin d v lt.eq
  C p^3 theta^2$ and the angular cap give a coefficient at most $C w^(- 1) h^2 \( p theta \)^3$ on $\| K \|$.
  Alternatively, the particle cone-flux bound gives $C \/ \( w p theta h phi.alt^2 \)$.
  Thus the coefficient, as recorded in (6.19), is at most a fixed multiple of

#[#set math.equation(numbering: n => "(8.9)")
 $ U = w^(- 1) min {h^2 \( p theta \)^3 \, \( p theta h phi.alt^2 \)^(- 1)} . $ <sel:U>]

#thm([Lemma 8.2.])[
  (Receiver coefficient on selected bins).  #emph[For fixed $M \, A$,
    there is a threshold $P_(*) \( M \, A \)$ such that every selected index with $P gt.eq
    P_(*) \( M \, A \)$ satisfies the exact representative inequality
#[#set math.equation(numbering: n => "(8.10)")
 $ U lt.eq w^(- 1 \/ 2) W . $ <sel:safe>]

]
] <sel:exponents>

#proof[
  We argue by contradiction: a selected bin violating (8.10) will first be forced into the actual regime,
    then into the improved-occupation window, where its exponent inequalities are incompatible.
  #strong[Step 1: an unsafe selected bin has actual velocity separation.] Write the representatives as exact
    powers of $P$:
  #[#set math.equation(numbering: n => "(8.11)")
   $ p = P^(1 - alpha) \, wide w = P^z \, wide c = 1 - z \,\
p theta = P^b \, wide phi.alt = P^(- y) \, wide h = P^(- H) \, wide Delta =
  epsilon.alt \( alpha + b + y + H \) . $ <sel:powers>]
  All terminating decimals below denote exact rational numbers.
    Here $alpha \, z \, c \, b \, y \, H$ are nonnegative and $z + c = 1$. The weight is $W = P^(- Delta)$.
    Near selection and (8.1) give
  #[#set math.equation(numbering: n => "(8.12)")
   $ 2 alpha + H \/ 2 + 2 y < z + Delta . $ <sel:near-exponent>]
  Far selection with the first pure bound in (8.6) gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ cases(delim: "{", b < H \/ 2 - alpha + Delta \, & H lt.eq 2 c \,, b < H - c - alpha + Delta \, & H > 2 c .)
     $ <sel:far-energy>]
  Indeed, when $H lt.eq 2 c$ one has $h gt.eq I$, whereas otherwise $max \( I \, h \) lt.eq P^(- 2 c)$.
    In either case $b lt.eq H - alpha + Delta$. Putting $d_(*) = alpha + b + y + H$, we obtain
  $ d_(*) lt.eq 2 H + y + Delta < 4 z + 5 Delta . $
  It follows that
  #[#set math.equation(numbering: n => "(8.14)")
   $ z > 0 \, wide Delta < 4 / 99995 z < .001 z . $ <sel:delta-small>]
  Only the pure energy bound has been used so far.
  Suppose (8.10) fails. Both terms of the minimum in (8.9) must exceed $w^(- 1 \/ 2) W$, so
  #[#set math.equation(numbering: n => "(8.15)")
   $ b > frac(2 H, 3) + z / 6 - Delta / 3 \, wide b < H + 2 y - z / 2 + Delta . $ <sel:unsafe>]
  If $H lt.eq 2 c$, the first inequalities of (8.13) and (8.15) force $H + z + 6 alpha < 8 Delta < .008 z$,
    which is impossible. Hence $H > 2 c$, and the other far bound gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ H > z / 2 + 3 \( alpha + c \) - 4 Delta > .496 z + 3 \( alpha + c \) . $ <sel:H-lower>]
  Combining this with (8.12),
  #[#set math.equation(numbering: n => "(8.17)")
   $ 3.5 alpha + 1.5 c + 2 y < .753 z \, wide z > 500 / 751 > .66 \, wide y < .377 z -
     1.75 alpha - .75 c . $ <sel:actual-margin>]
  In particular,
  $ z - y > .623 z + 1.75 alpha + .75 c gt.eq .623 \, $
  and
  $ 1 - alpha - y > .623 z + .75 alpha + 1.75 c gt.eq .623 . $
  Thus $m phi.alt > P^.3$, and the bin is actual for sufficiently large $P$.
    This conclusion precedes any absorption of constants into powers of $P$.
  #strong[Step 2: stable-cell occupation forces that bin into the improved window.] Put $rho =
    max \( alpha \, c \)$, so $P \/ m = P^rho$. Equation (8.5) and $phi.alt lt.eq 1$ give
  $ lambda^(- 1 \/ 2) lt.eq C_1 \( M + sqrt(A L) \) P^(rho + y) lt.eq P^(rho + y + .001 z) $
  once $P gt.eq P_(*) \( M \, A \)$. The last threshold is uniform over the indices because $z > .66$.
    Since $I \, h lt.eq P^(- 2 c)$ and $rho gt.eq c$, the actual pure bound gives
  $ sqrt(p sans(M)_(*)) lt.eq P^(- H \/ 2 + rho - c + y + .001 z) . $
  Far selection therefore implies
  #[#set math.equation(numbering: n => "(8.18)")
   $ b < H \/ 2 - min \( alpha \, c \) + y + .002 z . $ <sel:far-actual>]
  Comparing (8.18) with the first inequality in (8.15), then using (8.12), yields
  #[#set math.equation(numbering: n => "(8.19)")
   $ 2 y > H \/ 3 + .328 z + 2 min \( alpha \, c \) \, wide H < .8076 z < .81 z . $ <sel:middle>]
  Together with (8.16), this gives
  #[#set math.equation(numbering: n => "(8.20)")
   $ alpha + c < .105 z \, wide z > 200 / 221 > .90 \, wide 1 - alpha > .895 . $ <sel:high-momenta>]
  The two inequalities in (8.15) also imply
  $ y > z / 3 - H / 6 - frac(2 Delta, 3) > .19 z . $
  We now check both ends of the improved-occupation window for both momenta.
    The last inequality gives $y > .171 > .16 max \( z \, 1 - alpha \)$.
    For the opposite end put $Y = .377 z - 1.75 alpha - .75 c$; by (8.17), $y < Y$, and
  $ .49 z - Y & = .113 z + 1.75 alpha + .75 c > 0 \,\
.49 \( 1 - alpha \) - Y & = .113 z + 1.26 alpha + 1.24 c > 0 . $
  Therefore
  $ .16 max \( z \, 1 - alpha \) < y < .49 min \( z \, 1 - alpha \) . $
  Together with (8.20), these are exactly the conditions for including the improved entry of (8.6).
  #strong[Step 3: improved occupation contradicts an unsafe coefficient.] Since $I_m^0 = P^(- 2 rho)$, that entry gives
  $ sqrt(p sans(M)_(*)) lt.eq P^(- H \/ 2 + rho - c + beta y \/ 2) . $
  Far selection and (8.15) consequently give
  $ b < H \/ 2 - min \( alpha \, c \) + beta y \/ 2 + Delta \, wide beta y > H \/ 3 + .33 z + 2 min \( alpha \, c \) . $
  On the other hand, multiplying (8.12) by $beta \/ 2 = .58$ and using (8.14) yields
  $ beta y < .58 z - .29 H + .58 Delta < .582 z - .29 H . $
  Thus $H < \( 378 \/ 935 \) z < .41 z$, contradicting (8.16). This proves (8.10). ◻
]

=== 8.3 The spatial transition between selected and unselected bins <the-spatial-transition-between-selected-and-unselected-bins>

The selected receiver terms now have the coefficient needed to use (8.3).
  We next estimate the source, spatial, and time-weight derivatives, together with the central residual $cal(R)$,
  in the signed formula. The spatial transition requires particular care:
  its angular sum must retain the joint energy budget without introducing another logarithmic factor.

Equation (6.13) gives the spatial-cutoff majorant

#[#set math.equation(numbering: n => "(8.21)")
 $ C f / r^2 phi.alt / theta . $ <sel:spatial-kernel>]

By Lemma 14, the sum of the partial source or spatial derivatives of selected cutoff products is the negative of
  the corresponding sum over unselected products. It is supported where selected and unselected products overlap.
  Indeed, the full smooth partition sums to one, and a nonnegative smooth cutoff has zero derivative where it
  vanishes. Thus we estimate these errors on overlapping unselected supports.
  Neighboring representatives have ratios bounded by four.

For fixed $p \, phi.alt$, let

#[#set math.equation(numbering: n => "(8.22)")
 $ R = 1 + sqrt(I \/ lambda) sqrt(cal(E)_(p phi.alt)) \, wide sum_(p \, phi.alt) cal(E)_(p phi.alt) lt.eq C . $ <sel:R>]

Outside the deficit exception $phi.alt lt.eq C_0 \/ m$ and $h lt.eq min \( I \, lambda \)$,
  the near and far bounds for (8.21) are

#[#set math.equation(numbering: n => "(8.23)")
 $ C min {I h p^3 theta phi.alt^3 \, frac(R^2, p h theta phi.alt)} . $ <sel:spatial-near-far>]

For $h > I$ the pure energy bound $sans(M) lt.eq C h \/ p$ gives the second bound because $R gt.eq 1$.
  Hence $R$ is independent of both $theta$ and $h$ in every use of (8.23).

#thm([Lemma 8.3.])[
  #emph[The total spatial-cutoff error is at most $C cal(B) \( I \, w \)$.]
] <sel:spatial-sum>

#proof[
  First consider an unselected structural neighbor, with $theta gt.eq kappa phi.alt$,
    overlapping a selected support. Its ratio $theta \/ phi.alt$ lies within fixed factors of $kappa$,
    so for each $phi.alt$ there are only a bounded number of such $theta$.
    Balancing (8.23) in $h$ gives $C sqrt(I) thin R p phi.alt$,
    which fits the shared-budget calculation following (5.17):
    the sum of $C sqrt(I) thin R p phi.alt$ over $p \, phi.alt$ is at most $C cal(B) \( I \, w \)$.
  For another overlapping unselected bin, fix $p \, phi.alt \, theta$ and define $h_0 > 0$ by
  #[#set math.equation(numbering: n => "(8.24)")
   $ I sqrt(h_0) thin p^2 phi.alt^2 = P sqrt(I) \( P theta \)^(- epsilon.alt) phi.alt^epsilon.alt
     h_0^epsilon.alt . $ <sel:h0>]
  The ratio of the near quantity to its threshold is $\( h \/ h_0 \)^(1 \/ 2 - epsilon.alt)$.
    Overlap with a selected neighbor therefore implies $h gt.eq c h_0$, for a fixed $c > 0$.
    If the unselected bin fails the near inequality, it also has $h lt.eq h_0$.
    Only a bounded number of radial dyads occur in this case.
  Put
  #[#set math.equation(numbering: n => "(8.25)")
   $ n_0 = I h_0 p^3 theta phi.alt^3 \, wide f_(*) = frac(R^2, p h_0 theta phi.alt) \, wide
     D_0 = \( n_0 f_(*) \)^(1 \/ 2) = sqrt(I) thin R p phi.alt . $ <sel:n-f>]
  The near-failing transition bins cost at most $C min \( n_0 \, f_(*) \)$.
    If instead the bin fails the far inequality, then
  $ sans(M) lt.eq C sans(M)_(*) lt.eq C P^2 W^2 theta^2 h^2 \/ p . $
  Substitution into the far spatial bound gives, by (8.24), the additional estimate
  $ frac(C P^2 W^2 theta, p phi.alt) = C n_0 \( h \/ h_0 \)^(2 epsilon.alt) . $
  Together with (8.23), this bounds the sum over $h gt.eq c h_0$ by
  #[#set math.equation(numbering: n => "(8.26)")
   $ C
     cases(delim: "{", f_(*) \, & f_(*) lt.eq n_0 \,, n_0^(1 \/ \( 1 + 2 epsilon.alt \)) f_(*)^(2
     epsilon.alt \/ \( 1 + 2 epsilon.alt \)) \, & f_(*) > n_0 .) $ <sel:radial-crossing>]
  To see this, split the dyadic sum of $min \( n_0 t^(2 epsilon.alt) \, f_(*) \/ t \)$ at
    $t = \( f_(*) \/ n_0 \)^(1 \/ \( 1 + 2 epsilon.alt \))$, where $t = h \/ h_0$.
    Both resulting sums are geometric. The same bound includes the near-failing transition bins.
    No restriction on the size of $h_0$ is needed; enlarging the actual radial range to $t gt.eq
    c$ only increases this upper bound.
  Equation (8.24) gives
  $ h_0 prop theta^(- epsilon.alt \/ \( 1 \/ 2 - epsilon.alt \)) \, wide n_0 prop theta^gamma \, wide gamma =
    frac(1 - 4 epsilon.alt, 1 - 2 epsilon.alt) > 0 . $
  Since $D_0$ is independent of $theta$, writing $x = n_0 \/ D_0$ turns (8.26) into
  $ C D_0
    cases(delim: "{", x^(\( 1 - 2 epsilon.alt \) \/ \( 1 + 2 epsilon.alt \)) \, & x lt.eq 1 \,, x^(- 1) \, & x
    gt.eq 1 .) $
  Both $theta$ tails are geometric. Their sum is at most $C D_0$, with no additional logarithm.
    Summing $C sqrt(I) thin R p phi.alt$ over $p \, phi.alt$ as above gives $C cal(B) \( I \, w \)$.
  Finally, in the omitted deficit exception one has $lambda lt.eq C P^(- 2)$ and $phi.alt lt.eq C \/ m$.
    The near spatial bound, summed over $h$ and $theta$, is at most $C I p^3 phi.alt^4 \/ P^2$.
    The remaining momentum weights are bounded by $1 \/ \( P^2 p \)$ when $p lt.eq
    w$ and by $P \/ w^4$ when $p > w$. These fit $C I S \( w \)$,
    including the fixed logarithmic counts from the decomposition.
    This treats the exception without using the unavailable far occupation bound there. ◻
]

Source-cutoff derivatives have the direct good-field and magnetic-remainder majorants in (6.12).
  On overlapping unselected small bins, Lemma 18 applies to the good-field part;
  the magnetic-remainder part and structural neighbors are bounded by (8.2).
  The central term in (6.11) has majorant $C f \/ r^2$. Its near/far balance is $C sqrt(I) thin R p theta$,
  whose $theta$ sum is $C sqrt(I) thin R p phi.alt$. Its deficit exception is bounded by the same near estimate
  used at the end of Lemma 20.

=== 8.4 Time weights <time-weights>

Choose $0 < eta < 1 \/ 2$ and an endpoint-zero Lipschitz function $psi$ on $J$,
  equal to one away from monotone ramps of length $eta I$, with $0 lt.eq psi lt.eq 1$ and $\| psi_t \| lt.eq
  C \/ \( eta I \)$. Equation (6.15) gives the time-weight majorant $C_eta f theta \/ \( I r phi.alt \)$.

#thm([Lemma 8.4.])[
  #emph[The total time-weight derivative is at most $C_eta cal(B) \( I \, w \)$.]
] <sel:time-weight>

#proof[
  If $h lt.eq I$, the ratio of this majorant to $f \/ r^2$ is bounded by $C_eta h theta \/ \( I phi.alt \) lt.eq
    C_eta$. The preceding $f \/ r^2$ estimate therefore applies.
  If $h > I$, the near integral, divided by $P sqrt(I)$, is at most
  #[#set math.equation(numbering: n => "(8.27)")
   $ frac(C_eta h^2 p^3 theta^3 phi.alt, P sqrt(I)) & lt.eq C_eta h \( p \/ P \)^5
     phi.alt^3 \( P theta sqrt(h) \)^3 W^(- 1)\
 & lt.eq C_eta h \( p \/ P \)^5 phi.alt^3 W^(- 4) . $ <sel:long-weight>]
  The first inequality is the near-selection inequality. For the second,
    use far selection and the pure bound $sans(M)_(*) lt.eq h \/ p$ to obtain $P theta sqrt(h) < W^(- 1)$. Equivalently,
  $ \( P theta \)^(1 - epsilon.alt) < phi.alt^(- epsilon.alt) h^(- 1 \/ 2 - epsilon.alt) . $
  Summing the increasing factor $\( P theta \)^(4 epsilon.alt)$ in the last line of (8.27) leaves
  $ C_eta \( p \/ P \)^5 h^(1 - 6 epsilon.alt \/ \( 1 - epsilon.alt \))
    phi.alt^(3 - 4 epsilon.alt \/ \( 1 - epsilon.alt \)) . $
  Both exponents are positive. The sums in $h \, phi.alt \, p$ are geometric,
    so these terms cost at most $C_eta P sqrt(I)$. ◻
]

=== 8.5 The weighted signed estimate <the-weighted-signed-estimate>

#thm([Proposition 8.5.])[
  #emph[For the weight $psi$ above and $P gt.eq P_(*) \( M \, A \)$,
#[#set math.equation(numbering: n => "(8.28)")
 $ lr(|integral_J psi \( t \) K \( t \) thin d t|) lt.eq C_eta #scale(x: 120%, y: 120%)[\[] P
   sqrt(I) + \( M + sqrt(A) \) I S \( w \) #scale(x: 120%, y: 120%)[\]] . $ <sel:bulk>]

 The constant $C_eta$ is independent of $M \, A$.]
] <sel:bulk-impulse>

#proof[
  Let $chi = sum_(j in cal(S)) beta_j$ be the sum of the selected cutoffs,
    with the index set $cal(S)$ fixed throughout $J$. Split the interior force density as
  $ T_(upright("ker")) + S_(upright("ker")) =
    chi \( T_(upright("ker")) + S_(upright("ker")) \) + \( 1 - chi \) \( T_(upright("ker")) + S_(upright("ker")) \) . $
  Although the selection criterion uses the good-field majorant $S_g$,
    the selected term contains the transport kernel as required by Lemma 13.
    Apply Proposition 15 to that term with $Pi = upright("Id")$, and use the direct bounds on its complement.
    Lemmas 18, 20, and 21 bound the unselected good-field terms and all spatial and time-weight derivatives.
    The source derivatives, the central signed term, the unselected transport and magnetic-remainder terms,
    and structural neighbors were bounded above by $C_eta cal(B) \( I \, w \)$.
    By (6.18), the initial-cone boundary has a bounded-data cost $C I$, which fits $C P sqrt(I)$ by (8.1);
    the endpoint weights remove the other time boundaries.
  For the receiver terms, Lemmas 18 and 19 give, at every receiver time,
  $ sum_(upright("selected")) C U lt.eq C w^(- 1 \/ 2) . $
  Multiplying this coefficient by (8.3) bounds their total integral by $C cal(B) \( I \, w \)$.
    All sums used fixed geometric exponents; their constants are independent of $M \, A$.
    The only enlargement of the large-$P$ threshold occurred in Lemma 19. This proves (8.28). ◻
]

== 9 Closing the signed-increment bootstrap <sec:closure>

We now prove Proposition 2. The preceding estimates were conditional on the signed bound (2.2).
  Their constants permit a strict improvement, uniformly over the chosen compact solution interval.
  A continuity argument then removes that assumption.

Fix an interval $\[ t_1 \, t_2 \]$ of length $I$ on which $w \/ 8 lt.eq q_X lt.eq 8 w$.
  Write the full bootstrap bound as

$ cal(B)_w \( I \) = M P sqrt(I) + A I S \( w \) . $

If $cal(B)_w \( I \) gt.eq 32 w$, then

$ \| V_X \( t_2 \) - V_X \( t_1 \) \| lt.eq q_X \( t_2 \) + q_X \( t_1 \) lt.eq 16 w lt.eq 1 / 2 cal(B)_w \( I \) . $

Otherwise, once $M gt.eq 32$, we have $I lt.eq \( w \/ P \)^2$, as required in the estimates.
  The case $I = 0$ is immediate.

Let $0 < eta < 1 \/ 2$ and choose a Lipschitz function $psi$ on $\[ t_1 \, t_2 \]$ that vanishes at the endpoints,
  equals one off the two edge intervals of length $eta I$, and has linear monotone ramps on those intervals.
  The weighted impulse estimate (8.28) gives

#[#set math.equation(numbering: n => "(9.1)")
 $ lr(|integral_(t_1)^(t_2) psi \( t \) K \( t \) thin d t|) lt.eq
   C_eta #scale(x: 120%, y: 120%)[\[] P sqrt(I) + \( M + sqrt(A) \) I S \( w \) #scale(x: 120%, y: 120%)[\]] .
   $ <eq:closure-bulk>]

We restore each edge using the signed bootstrap, without estimating the absolute force there.
  On the left edge put $chi = 1 - psi$ and $F \( t \) = V_X \( t \) - V_X \( t_1 \)$.
  Since $F \( t_1 \) = 0$ and $chi$ vanishes at the other edge endpoint,

$ integral chi \( t \) K \( t \) thin d t = - integral chi' \( t \) F \( t \) thin d t . $

The monotonicity of the ramp gives $integral \| chi' \| = 1$;
  every such $F \( t \)$ has norm at most $cal(B)_w \( eta I \)$ by (2.2).
  The right edge has the same bound, anchoring at $t_2$. Hence

#[#set math.equation(numbering: n => "(9.2)")
 $ \| V_X \( t_2 \) - V_X \( t_1 \) \| lt.eq \( C_eta + 2 M sqrt(eta) \) P sqrt(I) +
   #scale(x: 120%, y: 120%)[\[] C_eta \( M + sqrt(A) \) + 2 A eta #scale(x: 120%, y: 120%)[\]] I S \( w \) .
   $ <eq:closure-improvement>]

Choose $eta$ so that $2 sqrt(eta) lt.eq 1 \/ 8$ and $2 eta lt.eq 1 \/ 8$. Fix $M gt.eq max \( 32 \, 8 C_eta \)$ and then

$ A gt.eq max \( 1 \, 16 C_eta M \, 256 C_eta^2 \) . $

The right side of (9.2) is at most $cal(B)_w \( I \) \/ 4$, and in particular at most $cal(B)_w \( I \) \/ 2$.
  Finally choose $P_0$ large enough for all preceding estimates with these fixed $M \, A$.
  These choices depend only on the datum and $T_0$, and not on $t_(*)$.
  Thus every bootstrap interval satisfies the uniform improvement

#[#set math.equation(numbering: n => "(9.3)")
 $ \| V_X \( t_2 \) - V_X \( t_1 \) \| lt.eq 1 / 2 cal(B)_w \( t_2 - t_1 \) . $ <eq:strict-improvement>]

For completeness, fix $P gt.eq P_0$ satisfying (2.1) on $\[ 0 \, t_(*) \]$.
  Let $cal(T)$ be the set of $tau in \[ 0 \, t_(*) \]$ for which (2.2) holds for all eligible receivers,
  scales and intervals contained in $\[ 0 \, tau \]$. It contains zero and is an initial interval. It is closed:
  truncate any nontrivial eligible interval at an increasing sequence of endpoints from below and use continuity
  of $V_X$. The range condition is preserved by truncation.

It is also relatively open to the right. On this fixed compact solution interval there is a finite bound $C_(*)$
  for $\| K \|$ on all supported characteristics. Consequently some $ell_0 >
  0$ ensures (2.2) for every interval of length at most $ell_0$, since $C_(*) I lt.eq M P sqrt(I)$ there.
  If $tau in cal(T)$, a longer eligible interval ending in $\[ tau \, tau + epsilon \]$ has a prefix ending at
  $tau$. The strict estimate (9.3) on that prefix is at most half the full interval’s bound.
  The suffix has impulse at most $C_(*) epsilon$, which is smaller than the remaining margin when $epsilon$ is
  sufficiently small, uniformly because the full bound is at least $M P sqrt(ell_0)$.
  An interval starting after $tau$ is short if $epsilon < ell_0$. This proves relative openness.
  Hence $cal(T) = \[ 0 \, t_(*) \]$ and Proposition 2 follows.

The compact-time force bound $C_(*)$ was used only to propagate the bootstrap for a fixed $P$.
  It does not enter $M \, A$ or $P_0$. This distinction preserves the uniformity needed in the momentum-doubling
  argument of Section 2.

== 10 Local theory and continuation for finite-energy fields <sec:continuation-proof>

We prove Proposition 3. The distinction between bounded smooth derivatives and square-integrable derivatives
  matters here: the initial fields in the theorem need not belong to $H^5$.
  We first give the local theory for Sobolev fields, then replace the fields outside a sufficiently large ball
  while preserving the divergence constraints. For any prescribed finite horizon,
  a vacuum field transfers solutions between the original and modified data on every interval of existence within
  that horizon.

Throughout this section, $F = \( E \, B \)$, $u \( v \) = v \/ \( 1 + \| v \|^2 \)^(1 \/ 2)$, and

$ rho_f = integral_(bb(R)^3) f thin d v \, wide j_f = integral_(bb(R)^3) u \( v \) f thin d v . $

The data are $0 lt.eq f_0 in C_c^oo \( bb(R)^6 \)$ and $E_0 \, B_0 in C_b^oo \( bb(R)^3 \) ∩ L^2 \( bb(R)^3 \)$,
  with every spatial derivative bounded and with $nabla dot.op E_0 = rho_(f_0)$, $nabla dot.op B_0 = 0$.
  Choose $R_0 \, R_v$ so that

$ "supp" f_0 subset { \( x \, v \) : \| x \| lt.eq R_0 \, med \| v \| lt.eq R_v } . $

As in Proposition 3, a classical solution is a $C^1$ pointwise solution whose fields are continuous into $L_x^2$
  and whose density has compact phase-space support on every compact time interval.

=== 10.1 Characteristics and the Maxwell evolution <characteristics-and-the-maxwell-evolution>

For any $C^1$ fields on a closed finite time interval, the characteristic system is

#[#set math.equation(numbering: n => "(10.1)")
 $ dot(X) = u \( V \) \, wide dot(V) = E \( t \, X \) + u \( V \) times B \( t \, X \) . $ <cont:characteristics>]

It has a unique solution through every phase point throughout that interval.
  Indeed, $\| dot(X) \| lt.eq 1$ confines $X$ to a compact spatial ball;
  the fields are bounded on the resulting compact spacetime cylinder, so $\| dot(V) \|$ is bounded there.
  The usual local ODE solution therefore cannot escape in finite time. Transport along these characteristics gives

#[#set math.equation(numbering: n => "(10.2)")
 $ f \( t \, X \( t \) \, V \( t \) \) = f_0 \( X \( 0 \) \, V \( 0 \) \) \, wide
   "supp"_x f \( t \) subset { \| x \| lt.eq R_0 + t } . $ <cont:spatial-support>]

On every closed finite slab the same argument gives a common momentum bound,
  provided the $C^1$ solution exists on that closed slab. It does not give a bound up to an excluded endpoint of
  existence. The phase-space vector field in (10.1) has zero divergence:
  $u = nabla_v \( 1 + \| v \|^2 \)^(1 \/ 2)$ and hence $nabla_v dot.op \( u times B \) = 0$.
  Consequently positivity and the $L^oo$ norm of $f$ are preserved.
  Integration of the transport equation gives $partial_t rho_f + nabla dot.op j_f = 0$, which,
  together with Maxwell’s equations, propagates both divergence constraints.

We shall use the homogeneous #emph[first-order Maxwell evolution] on $F = \( E \, B \)$.
  If $C_xi w = xi times w$, its Fourier generator is

$ A \( xi \) = mat(delim: "(", 0, i C_xi; - i C_xi, 0) \, wide A \( xi \)^(*) = - A \( xi \) . $

Thus $U \( t \)$, defined by the multiplier $exp \( t A \( xi \) \)$,
  is a strongly continuous unitary group on $L^2$ and on every $H^k$.
  No divergence constraint is needed for this assertion. The formula

#[#set math.equation(numbering: n => "(10.3)")
 $ F \( t \) = U \( t \) F \( 0 \) + integral_0^t U \( t - s \) \( - j_f \( s \) \, 0 \) thin d s
   $ <cont:maxwell-duhamel>]

therefore yields

$ parallel F \( t \) parallel_(H^k) lt.eq parallel F \( 0 \) parallel_(H^k) +
  integral_0^t parallel j_f \( s \) parallel_(H^k) thin d s . $

We also need finite propagation without any global integrability assumption.
  For a $C^1$ Maxwell field with current $j$, set $e = \( \| E \|^2 + \| B \|^2 \) \/ 2$. Direct differentiation gives

#[#set math.equation(numbering: n => "(10.4)")
 $ partial_t e + nabla dot.op \( E times B \) = - E dot.op j \, wide \| E times B \| lt.eq e . $ <cont:local-energy>]

Integrating over the shrinking balls $B \( x \, r + t - s \)$, $0 lt.eq s lt.eq t$,
  shows that a field with zero initial data and zero current in this backward cone vanishes on the final ball
  $B \( x \, r \)$: the boundary term is $- integral_(partial B) \( e + \( E times B \) dot.op nu \) lt.eq 0$.
  This local argument uses neither global $L^2$ bounds nor divergence constraints.

#thm([Lemma 10.1.])[
  (Exterior comparison).  #emph[Suppose that a $C^1$ solution exists on $\[ 0 \, S \]$,
    that $f_0$ is compactly supported as above, and that $F \( 0 \) in H^k \( bb(R)^3 \)$ for every integer $k$.
    Then the fields belong to $C \( \[ 0 \, S \] \; L^2 \)$ and have bounded first spatial derivatives on the
    entire slab. More precisely,
$ F \( t \, x \) = U \( t \) F \( 0 \) \( x \) wide upright("if ") \| x \| > R_0 + t . $

]
] <cont:exterior>

#proof[
  The characteristic argument gives compact phase-space support on the whole slab,
    so $j_f$ is $C^1$ and vanishes outside $\| x \| lt.eq R_0 + t$.
    The homogeneous field $F^(upright(h)) \( t \) = U \( t \)
    F \( 0 \)$ is smooth and has bounded spatial derivatives on $\[ 0 \, S \] times bb(R)^3$,
    by its uniform Sobolev bounds. The difference $W = F - F^(upright(h))$ has zero initial data and current
    $j_f$. If $\| x \| > R_0 + t$, choose $r > 0$ smaller than $\| x \| - R_0 - t$.
    Every point $\( s \, y \)$ of the backward cone from $B \( x \, r \)$ satisfies $\| y \| > R_0 + s$,
    so its current is zero. The local energy argument gives $W \( t \) = 0$ on $B \( x \, r \)$.
    Thus $W$ is supported in the fixed ball $\| x \| lt.eq R_0 + S$ on this slab.
    Its $C^1$ regularity on that compact cylinder gives $W in
    C \( \[ 0 \, S \] \; L^2 \)$ and uniform bounds on its first derivatives.
    Adding $F^(upright(h))$ proves the claims. Notice that $F^(upright(h))$ can have nonzero electric divergence;
    only the first-order Maxwell equations, not a component free-wave equation, were used for this comparison. ◻
]

=== 10.2 Classical uniqueness and local Sobolev solutions <cont:local>

Uniqueness holds in the full classical class stated above.
  To see this, let $\( f_i \, F_i \)$, $i = 1 \, 2$, have the same data,
  and work on an arbitrary compact common time interval. Choose $R$ containing both momentum supports,
  and put $g = f_1 - f_2$, $delta F = F_1 - F_2$. With the transport operator of the first solution,

$ \( partial_t + u dot.op nabla_x + \( E_1 + u times B_1 \) dot.op nabla_v \)
  g = - \( delta E + u times delta B \) dot.op nabla_v f_2 . $

The phase-space divergence is zero, $g$ is compactly supported, and

$ parallel j_(f_1) - j_(f_2) parallel_(L_x^2) lt.eq C_R parallel g parallel_(L_(x \, v)^2) . $

Since $nabla_v f_2$ is bounded on this slab, integration of the transport and Maxwell energies gives,
  with a slab-dependent finite constant $C$,

#[#set math.equation(numbering: n => "(10.5)")
 $ parallel g \( t \) parallel_2^2 + parallel delta F \( t \) parallel_2^2 lt.eq
   C integral_0^t #scale(x: 120%, y: 120%)[\(] parallel g \( s \) parallel_2^2 +
   parallel delta F \( s \) parallel_2^2 #scale(x: 120%, y: 120%)[\)] thin d s . $ <cont:uniqueness-energy>]

For completeness, the Maxwell integration is justified with cutoffs $chi \( x \/ N \)$, where $chi =
  1$ on the unit ball and $\| nabla chi \( x \/ N \) \| lt.eq C \/ N$.
  Its boundary error is at most $C N^(- 1) integral_0^S parallel delta F \( s \) parallel_2^2 thin d s$,
  which tends to zero because $delta F in C_t L_x^2$. No square-integrable field derivatives are required.
  Gronwall’s inequality in (10.5) proves uniqueness.

We next record the estimate needed both to construct smooth solutions and to preserve their regularity.
  For an integer $k gt.eq 6$, write

$ Y_k = parallel f parallel_(H^k \( bb(R)^6 \)) + parallel F parallel_(H^k \( bb(R)^3 \)) . $

For a smooth solution with momentum support in $\| v \| lt.eq R$,

#[#set math.equation(numbering: n => "(10.6)")
 $ Y_k \( t \) lt.eq Y_k \( 0 \) + C_(k \, R) integral_0^t #scale(x: 120%, y: 120%)[\(] 1 +
   parallel F \( s \) parallel_(W_x^(1 \, oo)) + parallel nabla_(x \, v) f \( s \) parallel_oo
   #scale(x: 120%, y: 120%)[\)] Y_k \( s \) thin d s . $ <cont:tame>]

The $H^k$ norm of $F$ is the Hilbert norm of the six-component vector $\( E \, B \)$;
  this is the norm preserved by $U \( t \)$. The coefficient in (10.6) involves no derivatives above first order.
  For smooth solutions in these Sobolev spaces, bounds on the momentum support and this coefficient give a bound
  on $Y_k$ by Gronwall’s inequality. The local construction below will use the $Y_6$ bound to obtain a common
  restart time.

To retain this dependence in the commutators, we use the integer Gagliardo–Nirenberg inequality on the whole space
  and include its proof; see also #cite(label("Nirenberg1959")) Lecture II for its classical context.
  For $d gt.eq 1$, an integer $s gt.eq 1$, a scalar or finite-dimensional vector-valued $g in H^s \( bb(R)^d \) ∩
  L^oo$, and an integer $0 < j < s$,

#[#set math.equation(numbering: n => "(10.7)")
 $ parallel D^j g parallel_(L^(2 s \/ j)) lt.eq C_(d \, s) parallel g parallel_oo^(1 - j \/ s) parallel D^s g
   parallel_2^(j \/ s) . $ <cont:integer-interpolation>]

Here $D^j g$ denotes the array of all ordered $j$th derivatives, with its Euclidean pointwise norm;
  this convention is equivalent to the usual multiindex convention up to constants depending on $d \, s$.
  For $g in C_c^oo$ put $p_j = 2 s \/ j$ and $A_j = parallel D^j g parallel_(p_j)$, with $A_0 =
  parallel g parallel_oo$. Integrating one derivative by parts in $integral \| D^j g \|^(p_j)$ gives

$ A_j^(p_j) lt.eq C_(d \, s) integral \| D^(j - 1) g \| thin \| D^(j + 1) g \| thin \| D^j g \|^(p_j - 2) lt.eq
  C_(d \, s) A_(j - 1) A_(j + 1) A_j^(p_j - 2) . $

The last step is Hölder’s inequality, since $1 \/ p_(j - 1) + 1 \/ p_(j + 1) + \( p_j - 2 \) \/ p_j = 1$,
  with $p_0 = oo$. Thus $A_j^2 lt.eq C_(d \, s) A_(j - 1) A_(j + 1)$.
  For a nonzero compactly supported $g$ all $A_j$ are positive.
  Choose $C gt.eq 1$ valid for these inequalities and define

$ b_j = log A_j - \( 1 - j \/ s \) log A_0 - \( j \/ s \) log A_s . $

Then $b_0 = b_s = 0$ and $2 b_j - b_(j - 1) - b_(j + 1) lt.eq log C$.
  The discrete maximum principle, applied after subtracting $1 / 2 \( log C \) j \( s - j \)$, gives $b_j lt.eq
  1 / 2 \( log C \) j \( s - j \)$, which proves (10.7); the zero function is immediate.
  To pass to $H^s ∩ L^oo$, first multiply by smooth compactly supported cutoffs bounded by one and then mollify
  with nonnegative unit-mass kernels. A diagonal sequence converges in $H^s$,
  has $L^oo$ norm at most $parallel g parallel_oo$, and has the relevant derivatives converging almost everywhere
  along a subsequence. Fatou’s lemma proves (10.7) in the stated class.

We give the commutator argument explicitly. If $s gt.eq 1$ is an integer, $\| alpha \| + \| beta \| = s$,
  and the functions are in $H^s ∩ L^oo$, then the Gagliardo–Nirenberg interpolation inequality and Hölder’s
  inequality give

#[#set math.equation(numbering: n => "(10.8)")
 $ parallel D^alpha g thin D^beta h parallel_2 lt.eq C_s #scale(x: 120%, y: 120%)[\(] parallel g parallel_oo
   parallel h parallel_(H^s) + parallel h parallel_oo parallel g parallel_(H^s) #scale(x: 120%, y: 120%)[\)] .
   $ <cont:tame-product>]

Indeed, put $j = \| alpha \|$. For $0 < j < s$ apply (10.7) to $g$ and the analogous bound with derivative order
  $s - j$ to $h$, then use weighted arithmetic–geometric mean. The cases $j = 0 \, s$ are direct.
  The same estimate for lower positive total derivative orders follows by using that order in place of $s$;
  total order zero is immediate.

Differentiate the Vlasov equation in $\( x \, v \)$ to order at most $k$ and pair with the corresponding
  derivative of $f$ in $L^2$. The leading transport term vanishes by phase-space divergence.
  Derivatives falling on $u$ are bounded and cost only $parallel f parallel_(H^k)$.
  For the force terms, choose a smooth momentum cutoff $zeta_R$ equal to one on a neighborhood of $\| v \| lt.eq
  R$, and set $a_R = zeta_R \( v \) \( E + u times B \)$. It is used only in the commutators;
  the leading transport operator is unchanged. We have

$ parallel a_R parallel_(H^k \( bb(R)^6 \)) lt.eq C_(k \, R) parallel F parallel_(H^k \( bb(R)^3 \)) \, wide
  parallel nabla a_R parallel_oo lt.eq C_R parallel F parallel_(W_x^(1 \, oo)) . $

Each commutator product is a derivative of $nabla a_R$ times a derivative of $nabla f$,
  with total derivative order at most $k - 1$. Equation (10.8) therefore bounds their sum by

$ C_(k \, R) #scale(x: 120%, y: 120%)[\(] parallel F parallel_(W_x^(1 \, oo)) parallel f parallel_(H^k) +
  parallel F parallel_(H^k) parallel nabla f parallel_oo #scale(x: 120%, y: 120%)[\)] . $

Finally, $parallel j_f parallel_(H_x^k) lt.eq C_R parallel f parallel_(H_(x \, v)^k)$ by Cauchy–Schwarz in $v$,
  and (10.3) completes (10.6). The estimates for unsquared norms follow from the squared energy estimates by
  regularizing a vanishing norm and taking the regularization parameter to zero.

Here are sufficient details of the local construction to make the restart time in this argument explicit.
  Suppose first that $F_0$ belongs to every $H^k$. Starting with the time-independent data,
  solve successively the linear transport equation for $f^(n + 1)$ with force $F^n$,
  and the linear Maxwell equations for $F^(n + 1)$ with current $j_(f^n)$;
  every iterate has the same initial data. Characteristics and (10.3) produce smooth iterates.
  Because $H^6 \( bb(R)^6 \)$ controls first derivatives in $L^oo$, the preceding estimates give,
  while all momentum supports lie in a fixed ball,

$ Y_6^(n + 1) \( t \) lt.eq Y_6 \( 0 \) + C_R integral_0^t #scale(x: 120%, y: 120%)[\(] \( 1 + Y_6^n \)
  Y_6^(n + 1) + Y_6^n #scale(x: 120%, y: 120%)[\)] thin d s . $

Choose $M > 2 \( Y_6 \( 0 \) + 1 \)$, and then choose $tau > 0$ small in terms of $M$ and $R_v$.
  Induction gives $Y_6^n lt.eq M$ on $\[ 0 \, tau \]$; shrinking $tau$ further makes the momentum increase at most
  one, since $\| dot(V) \| lt.eq \| E^n \| + \| B^n \| lt.eq C M$. This closes the support condition with $R = R_v + 1$.

The $L^2$ difference estimate for consecutive iterates has the form

$ D_(n + 1) \( t \) lt.eq C_(R \, M) integral_0^t D_n \( s \) thin d s \, wide D_n = parallel f^n -
  f^(n - 1) parallel_2 + parallel F^n - F^(n - 1) parallel_2 . $

The term involving $f^n$ uses its uniform first-derivative bound, exactly as in (10.5);
  the Maxwell estimate is linear. Taking $C_(R \, M) tau < 1 \/
  2$ makes the iterates Cauchy in $C \( \[ 0 \, tau \] \; L^2 \)$.
  For every higher $k$, the uniform $C^1$ bounds already obtained give

$ Y_k^(n + 1) \( t \) lt.eq Y_k \( 0 \) + C_(k \, R \, M) integral_0^t \( Y_k^(n + 1) \( s \) + Y_k^n \( s \) \)
  thin d s . $

The exponential $Y_k \( 0 \) e^(2 C_(k \, R \, M) t)$ is a common upper bound,
  by induction and the scalar comparison inequality. Interpolating the $L^2$ convergence with the uniform
  $H^(k + 1)$ bounds gives convergence in $C \( \[ 0 \, tau \] \; H^k \)$ for every $k$.
  The limit solves the equations; it preserves positivity, compact phase-space support, and the constraints.
  Sobolev embedding and the equations give smoothness in both space and time.
  Crucially, the common lifespan $tau$ depends only on $Y_6 \( 0 \)$ and the initial momentum radius,
  not on higher norms.

=== 10.3 Changing the fields outside the particle region <changing-the-fields-outside-the-particle-region>

We first construct the vacuum evolution needed for data whose bounded derivatives need not lie in $L^2$.

#thm([Lemma 10.2.])[
  (Smooth finite-energy vacuum fields).  #emph[Let $D_E \, D_B in C_b^oo \( bb(R)^3 \) ∩
    L^2 \( bb(R)^3 \)$ be divergence-free. There is a global smooth vacuum Maxwell solution on $\[ 0 \, oo \)$
    with these data, continuous into $L^2$, whose spatial derivatives of every order are bounded on each finite
    slab. If the data vanish on $B \( 0 \, L \)$, the solution vanishes wherever $\| x \| + t < L$.]
] <cont:vacuum>

#proof[
  For $M_t g \( x \) = \( 4 pi \)^(- 1) integral_(S^2) g \( x + t omega \) thin d omega$, define
  $ E^(upright(v)) \( t \) & = partial_t \( t M_t D_E \) + t M_t \( nabla times D_B \) \,\
B^(upright(v)) \( t \) & = partial_t \( t M_t D_B \) - t M_t \( nabla times D_E \) . $
  Kirchhoff’s formula gives smooth free-wave solutions with all the asserted finite-slab derivative bounds.
    Their Maxwell residuals $E_t^(upright(v)) - nabla times B^(upright(v))$ and $B_t^(upright(v)) + nabla times
    E^(upright(v))$ solve the wave equation with zero initial values.
    Their initial time derivatives are respectively $nabla \( nabla dot.op D_E \)$ and
    $nabla \( nabla dot.op D_B \)$, hence zero. Local wave uniqueness makes both residuals vanish.
    The divergences vanish as well. The spherical-mean formula proves the stated finite propagation.
  To justify strong $L^2$ continuity without assuming square-integrable derivatives,
    convolve the data with a smooth compactly supported approximate identity $eta_epsilon.alt$.
    The resulting divergence-free data belong to every $H^k$, converge in $L^2$,
    and converge uniformly with every fixed spatial derivative:
    the next bounded derivative makes each derivative uniformly continuous.
    Their Kirchhoff solutions converge with all fixed derivatives on finite slabs to the displayed solution.
    The same solutions are $U \( t \) \( eta_epsilon.alt * D_E \, eta_epsilon.alt * D_B \)$,
    whose $L^2$ convergence is uniform in $t$ by unitarity. The two limits agree locally,
    so the displayed solution is $U \( t \) \( D_E \, D_B \)$.
    It is therefore continuous into $L^2$ and preserves its $L^2$ norm. ◻
]

Fix a finite horizon $H > 0$. Set $rho_0 = rho_(f_0)$ and take its Coulomb field

#[#set math.equation(numbering: n => "(10.9)")
 $ E_(upright(C)) = - nabla \( - Delta \)^(- 1) rho_0 \, wide nabla dot.op E_(upright(C)) = rho_0 . $ <cont:coulomb>]

This field belongs to every $H^s$, $s gt.eq 0$. Indeed, its Fourier transform is $-
  i xi \| xi \|^(- 2) hat(rho)_0 \( xi \)$. Near zero its size is $O \( \| xi \|^(- 1) \)$,
  whose square is integrable in three dimensions, and at infinity $hat(rho)_0$ decays faster than any power.
  Sobolev embedding gives bounded smooth derivatives. This argument allows arbitrary total charge.

For a smooth divergence-free vector field $G$ on $bb(R)^3$, define

#[#set math.equation(numbering: n => "(10.10)")
 $ cal(A)_G \( x \) = (integral_0^1 t G \( t x \) thin d t) times x . $ <cont:potential>]

Then $nabla times cal(A)_G = G$. To verify this, put $V \( x \) = integral_0^1 t G \( t x \) thin d t$.
  We have $nabla dot.op V = 0$ and

$ nabla times \( V times x \) = 2 V + \( x dot.op nabla \) V =
  integral_0^1 frac(d, d t) #scale(x: 120%, y: 120%)[\(] t^2 G \( t x \) #scale(x: 120%, y: 120%)[\)] thin d t =
  G \( x \) . $

Choose $chi in C_c^oo \( bb(R)^3 \)$ equal to one on $B \( 0 \, L \)$, where $L = R_0 + 2 H + 1$, and set

#[#set math.equation(numbering: n => "(10.11)")
 $ overline(E)_0 & = E_(upright(C)) + nabla times #scale(x: 120%, y: 120%)[\(] chi cal(A)_(E_0 - E_(upright(C)))
   #scale(x: 120%, y: 120%)[\)] \,\
overline(B)_0 & = nabla times #scale(x: 120%, y: 120%)[\(] chi cal(A)_(B_0) #scale(x: 120%, y: 120%)[\)] .
  $ <cont:modified-data>]

These fields belong to every $H^k$, satisfy the original divergence constraints, and agree with $E_0 \,
  B_0$ on $B \( 0 \, L \)$. Their difference from the original fields is divergence-free,
  smooth with bounded derivatives, and in $L^2$. Let $D \( t \)$ be the vacuum solution of Lemma 24 with initial
  data $D \( 0 \) = \( E_0 - overline(E)_0 \, B_0 - overline(B)_0 \)$. Then

#[#set math.equation(numbering: n => "(10.12)")
 $ D \( t \, x \) = 0 quad upright("if") quad 0 lt.eq t lt.eq H \, quad \| x \| lt.eq R_0 + t \,
   $ <cont:vacuum-vanishing>]

because $\| x \| + t lt.eq R_0 + 2 H < L$. Consequently

#[#set math.equation(numbering: n => "(10.13)")
 $ \( f \, F \) arrow.l.r \( f \, F - D \) $ <cont:field-equivalence>]

is an equivalence, up to time $H$, between classical solutions with the original and modified initial fields.
  Maxwell’s equations and both constraints are preserved by subtracting a divergence-free vacuum solution.
  The transport equation is unchanged on the particle region by (10.12);
  outside that region $f$ and its momentum derivatives vanish.
  The equivalence preserves $C_t L^2$ and compact phase-space support.

The Sobolev construction above, applied to (10.11) with, for example, $H = 1$, and followed by addition of $D$,
  now proves local classical existence for the full initial field class.
  The uniqueness already proved permits these local solutions to be joined into a unique maximal classical solution.

=== 10.4 Smoothness through a classical interval <cont:persistence>

Suppose first that the initial fields belong to every $H^k$ and that a classical solution exists on
  $\[ 0 \, S \]$. Lemma 23 gives a uniform global $W_x^(1 \, oo)$ bound for its fields on this slab.
  Compact phase-space support and $C^1$ regularity give uniform bounds for the momentum radius and $nabla_(x \, v)
  f$. Wherever the solution is smooth, (10.6) therefore bounds every $Y_k$, in particular $Y_6$,
  by a constant depending only on this slab and the initial norm.

To continue smoothness, suppose a first loss could occur before or at $S$.
  Choose times increasing to that first time from below. The $Y_6$ bounds and momentum bounds just obtained give
  the same positive local lifespan for the Sobolev construction at all these times.
  Restarting sufficiently close to the alleged loss extends a smooth solution beyond it.
  Classical uniqueness identifies this solution with the given one on their common interval, a contradiction.
  This argument requires no prior existence of an $H^6$ limit at the endpoint.
  The higher estimates on the same lifespan give persistence of every Sobolev order,
  and the equations give all time derivatives.

For the original field class, fix any compact classical interval, choose a larger finite horizon in (10.11),
  and subtract the associated vacuum field. The modified solution has all-Sobolev initial fields,
  so the preceding argument applies. Adding back the smooth vacuum proves smoothness on the chosen slab for the
  original solution.

The solutions just constructed satisfy the hypotheses of Lemma 4, so their total energy is conserved.
  Here $C_t L^2$ was established independently; no square-integrable field derivatives are needed to apply that
  energy identity.

=== 10.5 The bounded-momentum criterion <cont:continuation>

The continuation input is the Glassey–Strauss criterion in #cite(label("LukStrain2014Continuation")) Theorem 1.1
  and Footnote 1, arXiv version. In its normalization, nonnegative compactly supported $H^5$ particle data and
  $H^5$ field data satisfying the constraints have the following property:
  a unique classical solution on $\[ 0 \, T \)$, $T < oo$, extends uniquely as a $C^1$ solution past $T$ if there
  is a bounded continuous function $kappa : \[ 0 \, T \) arrow.r \( 0 \, oo \)$ such that $f \( t \, x \, v \) =
  0$ whenever $\| v \| gt.eq kappa \( t \)$. The $H^5$ formulation in that statement does not require a separate
  momentum bound for approximation iterates. Its density and current are $4 pi integral f_(upright("LS")) thin d
  v$ and $4 pi integral u f_(upright("LS")) thin d v$, so it applies to the present normalization with

#[#set math.equation(numbering: n => "(10.14)")
 $ f_(upright("LS")) = f \/ \( 4 pi \) \, wide E_(upright("LS")) = E \, wide B_(upright("LS")) =
   B . $ <cont:normalization>]

Now let a classical solution for the original data exist on $\[ 0 \, T \)$, where $T < oo$,
  and suppose its momentum support is uniformly bounded there by $P_(*) < oo$. Perform (10.11) with $H = T + 1$.
  The modified solution $\( f \, F - D \)$ has all-Sobolev initial fields;
  its density is smooth and compactly supported initially, and the constraints and uniqueness have already been
  checked. After (10.14), all hypotheses of the cited theorem hold with the constant continuous choice $kappa =
  P_(*) + 1$. It gives a $C^1$ extension of the modified solution to $\[ 0 \, T + epsilon.alt \)$;
  shrink $epsilon.alt$ so that $epsilon.alt < 1$.

It remains to check that this extension is in the classical class used here.
  On any closed subinterval of $\[ 0 \, T + epsilon.alt \)$, its characteristics give compact phase-space support,
  as in (10.2). Lemma 23 supplies $C_t L^2$ for its fields, including continuity through $T$.
  Thus it is a classical solution in the stated class. Adding back $D$,
  which vanishes throughout its particle region up to $T + epsilon.alt < H$,
  gives a classical extension for the original data. Section 10.4 then proves its smoothness on every compact
  slab; that conclusion was not imported from the cited theorem.

Finally, if $f_0 = 0$, the constraints make both initial fields divergence-free.
  Lemma 24 directly gives the global solution with $f = 0$, and classical uniqueness applies to it.
  This proves the local existence, uniqueness, persistence,
  and bounded-momentum continuation assertions of Proposition 3.

#bibliography("refs.bib", style: "ieee", title: [References])
