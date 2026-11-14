#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A smooth three-torus diffeomorphism with simple Lebesgue spectrum]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $bb(T) = bb(R) \/ bb(Z)$, let $mu$ be normalized Lebesgue measure on $bb(T)^3$, and put $"e" \( t \) =
  exp \( 2 pi i t \)$. For an invertible measure-preserving transformation $T$, we use the convention $U_T g =
  g compose T$. The closed subspace of complex square-integrable functions of integral zero is denoted by
  $L_0^2 \( bb(T)^3 \, mu \)$.

On a probability space the constants form an invariant subspace,
  so the probability-preserving form of Banach’s simple Lebesgue-spectrum problem asks for an invertible
  transformation whose Koopman operator on the #emph[entire] orthogonal complement of the constants is unitarily
  equivalent to multiplication by $w$ on $L^2 \( S^1 \, m \)$, where $m$ is normalized Haar measure.
  Equivalently, that restriction has a bilateral orthonormal orbit which is complete.
  We realize this spectral model with the standard smooth volume on a compact manifold.

#thm([Theorem 1.1.])[
  #emph[There exist a $C^oo$ volume-preserving diffeomorphism $T : bb(T)^3 arrow.r
    bb(T)^3$ and a real function $f in L_0^2 \( bb(T)^3 \, mu \)$ such that
$ { f compose T^n : n in bb(Z) } $

 is an orthonormal basis of $L_0^2 \( bb(T)^3 \, mu \)$. Consequently $T$ is ergodic,
   and $U_T$ on this space is unitarily equivalent to multiplication by the coordinate $w$ on $L^2 \( S^1 \, m \)$.]
] <thm:main>

The invariant measure in Theorem 1 is the standard smooth volume itself.
  The generator $f$ is only required to belong to $L^2$. In particular,
  the assertion concerns the whole mean-zero space, including both its spectral type and its multiplicity.
  Section 6 derives mixing, zero entropy, and vanishing Lyapunov exponents.
  Mixing of every order uses, in addition, the separate multiple-mixing theorem of #cite(label("MultipleMixing2026")).

The formulation above is distinct from the historical real-line question recorded by Ulam and attributed to Banach
  #cite(label("Ulam1960")) §6, p. 76. Rokhlin asked for ergodic automorphisms with simple,
  or at least finite-multiplicity, Lebesgue spectrum #cite(label("Rokhlin1949")) §4, no. 7, p. 107.
  Helson and Parry constructed cocycles over aperiodic probability-preserving transformations whose associated
  unitary operators have Lebesgue spectrum #cite(label("HelsonParry1978")) p. 196, Theorem (a).
  Mathew and Nadkarni constructed a probability-preserving transformation with a Lebesgue #emph[component] of
  multiplicity two #cite(label("MathewNadkarni1984")). Guenais connected the Morse-cocycle question with flat
  polynomials and constructed a countable abelian group action with simple spectrum of mixed discrete and Haar
  type #cite(label("Guenais1999")). These results distinguish a Lebesgue component, or a related group action,
  from one bilateral Lebesgue orbit spanning the whole centered space.

Simple spectrum in smooth dynamics was already achieved by Fayad,
  who constructed $C^oo$ volume-preserving torus diffeomorphisms with simple spectrum #cite(label("Fayad2001"));
  that result did not assert Lebesgue spectral type. In another setting,
  an infinite-measure conservative transformation with simple Lebesgue spectrum is presented in
  #cite(label("ElAbdalaoui2023")) Theorem 2.2; the probability-space conclusion does not follow from it.
  Theorem 1 gives that conclusion for the full mean-zero space of a smooth probability-preserving map.

Related existence results in continuous time have different spectral consequences.
  Prikhod’ko constructs a finite-measure flow with simple Lebesgue spectrum #cite(label("Prikhodko2020"))
  Theorem 3. In the smooth category, Fayad, Forni and Kanigowski obtain a real analytic conservative flow on
  $bb(T)^2$ with one singularity and countably infinite Lebesgue multiplicity #cite(label("FFK2021")) Theorem 1;
  Abdedou, Fayad and Kessi obtain real analytic reparametrizations of minimal translation flows on $bb(T)^5$ with
  the same multiplicity #cite(label("AFK2023")) Theorem 1.1.
  Taking a nonzero time map of a simple Lebesgue flow yields countably infinite multiplicity:
  its spectral model is multiplication by $"e" \( t xi \)$ on $L^2 \( bb(R) \, thin upright(d) xi \)$,
  and the substitution $xi = \( x + k \) \/ \| t \|$, with $x in \[ 0 \, 1 \)$ and $k in bb(Z)$,
  gives one Lebesgue copy for each $k$. Thus these continuous-time results do not supply Theorem 1.

Successive smooth changes of coordinates have a substantial history in smooth dynamics,
  including the approximation-by-conjugacy constructions of Anosov and Katok #cite(label("AnosovKatok1970")).
  We use explicit volume-preserving passages between integrable twists rather than an external conjugacy theorem.
  Their quantitative spectral-density transport, and the finite Fourier signals built on it, are proved below.

=== The construction <the-construction>

The approximating maps are integrable twists. In a volume-preserving coordinate system on the torus, they have the form

$ S \( theta \, u \, a \) = \( theta + phi.alt \( u \) \, u \, a \) \, $

where $phi.alt$ is a smooth real circle function that is strictly increasing on an arc whose complement can be
  made arbitrarily short. A finite angular Fourier expansion supported on that arc has an explicit absolutely
  continuous spectral measure. We refer to its individual harmonics as #emph[packets], and keep a finite label,
  or #emph[color], on disjoint groups of packets. The colors carry the coefficients of an observable that we want
  to approximate by translates of a single vector.

There are three steps. A slow passage in the coordinate $u$ replaces the twist by an arbitrarily close twist whose
  angular coordinate is the old $u$. Stationary phase locates the new angular indices and determines the spectral
  density at a much finer scale. The spare coordinate $a$ supplies a small adjustable variation in the speed (the
  #emph[jitter]). A large integer added to the lift of $phi.alt$ separates the angular indices of different
  packets without changing the old map. This separation is what allows later perturbations to distinguish colors
  even when their temporal spectra overlap.

Next, a positive Fourier construction and a finite prime sieve produce a small sinusoidal bias in each color
  density. Its coefficient depends on the normalized angular index.
  A neutral passage between successive biased passages makes residue classes carry equal shares of each color.
  The bias strength can be chosen before the angular scale grows;
  the passage parameter is then free to enforce any required smooth or spectral accuracy.

Finally, many small biases are grouped into blocks. If color $r$ has spectral density $p_r$ and target coefficient
  $b_r$, the center at a temporal frequency $z$ is the density-weighted mean

$ p \( z \) = sum_r p_r \( z \) \, wide beta \( z \) = frac(sum_r b_r p_r \( z \), p \( z \))
  quad \( p \( z \) > 0 \) . $

Centering each block at a smooth approximation to this current mean makes the loss in $integral
  sqrt(p)$ quadratic in the block’s strength budget, while the same block provides an estimator of the color
  label. Repetition makes prediction arbitrarily accurate with arbitrarily little loss in $integral sqrt(p)$.
  This separation of the two estimates is the central finite construction.
  When the vector’s norm is close to one, keeping $integral
  sqrt(p)$ close to one makes whitening a small change in physical $L^2$,
  while restoring the spectral density exactly to one. A diagonal limit preserves the orthonormal orbit and makes
  its span contain every member of a dense family of observables.

=== Order of the proof <order-of-the-proof>

Section 2 proves the analytic passage rules, including the comparison of jitter laws along a rapidly oscillating
  phase. Section 3 constructs the positive laws that transmit the small biases.
  Section 4 proves the finite prediction result, and Section 5 prepares arbitrary observables and takes the smooth
  limit. Section 6 derives the dynamical consequences. Every passage acts on finite data.
  Its integer parameter is chosen last, after the current coordinate chart, cutoffs, jitter,
  and all desired error bounds have been fixed. No uniform bound on the number of packets or on the derivatives of
  successive coordinate charts is assumed.

== 2 Smooth passages and spectral densities <sec:passages>

A volume-preserving coordinate system, also called a chart below,
  means a smooth volume-preserving identification of the physical torus with $bb(T)^3$.
  All coordinate systems in the construction preserve normalized volume. An intermediate transformation has the form

#[#set math.equation(numbering: n => "(2.1)")
 $ S \( theta \, u \, a \) = \( theta + phi.alt \( u \) \, u \, a \) \, wide \( theta \, u \, a \) in bb(T)^3 \,
   $ <eq:twist>]

where $phi.alt in C^oo \( bb(T) \; bb(R) \)$ has $phi.alt' > 0$ on an open arc $I$. We call $I$ a good arc.
  Derivatives on an arc are understood in an increasing real lift of that arc.

A packet is a function $A \( u \, a \) "e" \( m theta \)$,
  where $m in bb(Z) \\ { 0 }$ and $A$ is smooth with compact support in $I times bb(T)$.
  A finite packet list is disjoint if, for any two entries with the same $m$,
  their coefficient supports are disjoint. Entries with different $m$ need no support restriction.
  Packets may be grouped into colors; we write $F_r$ for the sum of color $r$. Disjointness implies

#[#set math.equation(numbering: n => "(2.2)")
 $ chevron.l U_S^n F_r \, U_S^k F_l chevron.r = 0 quad \( r eq.not l \, med n \, k in bb(Z) \) .
   $ <eq:packet-orthogonality>]

Indeed $U_S^n \( A "e" \( m theta \) \) = "e" \( n m phi.alt \( u \) \) A "e" \( m theta \)$,
  and either angular orthogonality or disjoint coefficient supports applies. The spectral measure of one packet is

#[#set math.equation(numbering: n => "(2.3)")
 $ \( m phi.alt med mod med 1 \)_(*) #scale(x: 120%, y: 120%)[\(] \| A \( u \, a \) \|^2 thin upright(d) u thin
   upright(d) a #scale(x: 120%, y: 120%)[\)] . $ <eq:packet-spectral-measure>]

It has a smooth density because its coefficient support is compactly inside the good arc.
  We use the inner product linear in its first variable, so a vector of density $p$ has $chevron.l U_S^n F \,
  F chevron.r = integral_(bb(T)) "e" \( n z \) p \( z \) thin upright(d) z$.
  A measurable spectral multiplier $v \( z \)$ acts on its coefficient by multiplication by
  $v \( m phi.alt \( u \) med mod med 1 \)$, whenever the result belongs to $L^2$.
  These statements follow directly from the displayed formula for $U_S^n$,
  first for trigonometric polynomials and then by $L^2$ approximation.
  The pushforward formula, absolute continuity, and multiplier rule also apply to nonsmooth coefficients in $L^2$
  supported in the good arc; their densities need not be smooth.

For later comparisons, if two vectors have spectral densities $p_F \, p_G$ for the same transformation, then

#[#set math.equation(numbering: n => "(2.4)")
 $ parallel p_F - p_G parallel_1 lt.eq \( parallel F parallel_2 + parallel G parallel_2 \) parallel F -
   G parallel_2 . $ <eq:density-norm-bound>]

To see this, test their spectral measures against an arbitrary function of absolute value at most one and use the
  contraction property of its spectral multiplier. The total variation norm here and below is the $L^1$ norm of
  densities, without a factor $1 \/ 2$.

#thm([Lemma 2.1.])[
  (Passage).  #emph[Fix (2.1), its physical volume-preserving coordinate chart, and a finite disjoint packet list.
    Choose a positive integer $c$ so large that the compact ranges $m \( c + phi.alt \( bb(T) \) \)$,
    for the distinct old indices $m$, are pairwise disjoint and avoid zero. Set $V = c + phi.alt$.
    Fix $J in C^oo \( bb(T) \; bb(R) \)$ with $J' > 0$ on an open arc $I'$ and fix $0 lt.eq psi lt.eq
    1$ in $C_c^oo \( I' \)$. For integers $N arrow.r oo$, choose $Delta_N$ so that
#[#set math.equation(numbering: n => "(2.5)")
 $ \| Delta_N \| lt.eq N^(- 1) \, wide k_N := N (integral_(bb(T)) V \( u \) thin upright(d) u + Delta_N) in
   bb(Z) \, wide H'_N = N \( V + Delta_N \) . $ <eq:passage-rounding>]

 Put $sigma_N \( a \) = N^(- 1) + N^(- 2) J \( a \)$. Then
#[#set math.equation(numbering: n => "(2.6)")
 $ T_N \( theta \, u \, a \) = #scale(x: 120%, y: 120%)[\(] theta + H_N \( u + sigma_N \( a \) \) - H_N \( u \) \,
   thin u + sigma_N \( a \) \, thin a #scale(x: 120%, y: 120%)[\)] $ <eq:passage-map>]

 is a volume-preserving smooth torus diffeomorphism, and both $T_N$ and $T_N^(- 1)$ converge smoothly to $S$ and
   $S^(- 1)$, also in the fixed physical coordinates. In the new coordinates
#[#set math.equation(numbering: n => "(2.7)")
 $ \( theta' \, u' \, a' \) = C_N \( theta \, u \, a \) = \( u \, a \, theta - H_N \( u \) \) \, $ <eq:passage-chart>]

 it is the twist of speed $sigma_N$ and good arc $I'$.]
  #emph[Here are its packet and density properties. For an old packet indexed by $alpha$,
    with index $m_alpha$ and amplitude $A_alpha$, define
#[#set math.equation(numbering: n => "(2.8)")
 $ E_alpha = { \( m_alpha V \( u \) \, a \) : \( u \, a \) in "supp" A_alpha } . $ <eq:stationary-image>]

 One may choose pairwise disjoint, arbitrarily small fixed neighborhoods of these compact sets,
   and smooth cutoffs $chi_alpha \( s \, a \)$ supported in those neighborhoods and equal to one near $E_alpha$.
   Retain the finitely many new packets
#[#set math.equation(numbering: n => "(2.9)")
 $ G_(alpha \, j) \( theta' \, u' \, a' \) & = "e" \( j theta' \) "e" \( m_alpha a' \) psi \( u' \)
   chi_alpha \( j \/ N \, u' \) C_(alpha \, j) \( u' \) \,\
C_(alpha \, j) \( a \) & = integral_(bb(T)) A_alpha \( u \, a \) "e" \( m_alpha H_N \( u \) - j u \) thin
  upright(d) u . $ <eq:retained-packets>]

 All their angular indices are nonzero for sufficiently large $N$. For each $alpha$,
#[#set math.equation(numbering: n => "(2.10)")
 $ ∥sum_j G_(alpha \, j) compose C_N - psi \( a \) A_alpha \( u \, a \) "e" \( m_alpha theta \)∥_2 =
   o \( 1 \) . $ <eq:transport-norm>]

 They are disjoint as packets, and their moduli are independent of the new spare coordinate $a'$.
   Every constant attached to an old packet is preserved by this linear transport and these cutoffs.]
  #emph[For a single old packet write, with zero extension outside its branch,
#[#set math.equation(numbering: n => "(2.11)")
 $ W \( s \, a \) = frac(\| A \( u \, a \) \|^2, \| m phi.alt' \( u \) \|) \, wide s =
   m V \( u \) . $ <eq:W-definition>]

 Let $K \( s \, y \)$ be the density of the pushforward of $W \( s \, a \) psi \( a \)^2 thin upright(d)
   a$ under $a mapsto s J \( a \)$. It is continuous and compactly supported in $\( s \, y \)$,
   with its $s$ support away from zero. For any fixed positive integer $P$ and residue $h med \( mod med P \)$,
   the unfolded temporal density of the retained packets with $j equiv
   h med \( mod med P \)$ differs in $L^1 \( bb(R) \)$ by $o \( 1 \)$ from
#[#set math.equation(numbering: n => "(2.12)")
 $ Q_(N \, h) \( t \) = sum_(k in bb(Z)) K \( t \, N t - h - k P \) . $ <eq:fine-density-unfolded>]

 Consequently their density on $bb(T)$ differs in $L^1 \( bb(T) \)$ by $o \( 1 \)$ from $sum_(l in bb(Z))
   Q_(N \, h) \( z + l \)$. The assertions hold after summing over any of the finitely many colors.
   All $o \( 1 \)$ terms refer to the old data, $c \, J \, psi \, P$,
   and support neighborhoods fixed before $N$ tends to infinity.
   In particular, $N$ may be required to exceed any prescribed bound.]
] <lem:passage>

#proof[
  #emph[Geometry and smooth convergence.] Choose $k_N$ by rounding $N integral
    V$ to an integer and integrate (2.5). Then $H_N \( u + 1 \) - H_N \( u \) = k_N$,
    so the map $u mapsto H_N \( u \) med mod med 1$ is globally defined.
    The map $C_N$ is a smooth torus diffeomorphism of Jacobian one,
    with inverse $\( theta' \, u' \, a' \) mapsto \( a' + H_N \( theta' \) \, theta' \, u' \)$.
    Direct substitution gives
  $ C_N T_N C_N^(- 1) \( theta' \, u' \, a' \) = \( theta' + sigma_N \( u' \) \, u' \, a' \) . $
  This proves the global assertions, except convergence. The integral identity
  $ H_N \( u + sigma_N \( a \) \) - H_N \( u \) = N integral_0^(sigma_N \( a \)) \( V \( u + t \) + Delta_N \)
    thin upright(d) t = V \( u \) + O_(C^k) \( N^(- 1) \) $
  holds for each fixed $k$, with constants depending on the fixed $c \, J$ and $phi.alt$.
    Since $c$ is an integer, addition of $V$ and of $phi.alt$ agree on $bb(T)$. The inverse of (2.6) is
  $ \( theta \, u \, a \)
    mapsto \( theta - H_N \( u \) + H_N \( u - sigma_N \( a \) \) \, u - sigma_N \( a \) \, a \) \, $
  and the same estimate proves inverse convergence. Composing with a fixed physical chart and its inverse
    preserves convergence in every fixed smooth norm. No bound uniform over future coordinate charts is being asserted.
  #emph[Fourier coefficients.] Work on a compact subarc of $I$ containing all old coefficient supports in its
    interior. For $s = j \/ N$ the phase in (2.9), divided by $N$, has critical equation
  #[#set math.equation(numbering: n => "(2.13)")
   $ m \( V \( u \) + Delta_N \) = s $ <eq:critical-equation>]
  and second derivative $m phi.alt' \( u \)$. It has at most one critical point on this arc.
    With $u_(*) = u_(*) \( s - m Delta_N \)$ on that branch, set
  $ L_(m \, j) \( a \) = frac(A \( u_(*) \, a \), sqrt(N \| m phi.alt' \( u_(*) \) \|)) "e"
    (m H_N \( u_(*) \) - j u_(*) + frac("sgn" \( m \), 8)) \, $
  and set this to zero wherever the amplitude at the critical point is zero or there is no point on the branch.
    Uniformly for $j \/ N$ in any fixed compact interval and $a in bb(T)$,
  #[#set math.equation(numbering: n => "(2.14)")
   $ C_(m \, j) \( a \) - L_(m \, j) \( a \) = o \( N^(- 1 \/ 2) \) . $ <eq:stationary-uniform>]
  For general stationary-phase background see #cite(label("Hormander2003"));
    we give the compact-support one-dimensional argument needed here. Enlarge the support arc twice inside $I$.
    Critical points near the original support then range over a fixed compact interval on which the absolute
    second derivative is bounded below. A smooth change of variable, depending smoothly on the critical point,
    reduces the divided phase to its critical value plus $"sgn" \( m \) y^2 \/ 2$;
    its Jacobian at zero is $\| m phi.alt' \( u_(*) \) \|^(- 1 \/ 2)$.
    After putting $v = sqrt(N) y$, the integral on $\| v \| lt.eq
    D$ converges uniformly to the constant amplitude times the quadratic exponential integral there.
    The remaining local tails are $O \( N^(- 1 \/ 2) \/ D \)$, uniformly in the parameters,
    by integrating against $"e" \( "sgn" \( m \) v^2 \/ 2 \)$:
    the rescaled amplitudes have uniformly bounded suprema and total variation.
    The part away from the critical point is $O \( N^(- 1) \)$ by integration by parts. Finally
  $ lim_(D arrow.r oo) integral_(- D)^D "e" \( plus.minus v^2 \/ 2 \) thin upright(d) v =
    exp \( plus.minus i pi \/ 4 \) \; $
  this follows by inserting a Gaussian factor, evaluating the Gaussian integral,
    and removing the factor using the same tail bound. Taking first $N arrow.r oo$, then $D arrow.r oo$,
    proves (2.14). When the potential critical point is outside the enlarged support interval,
    the integral is uniformly nonstationary. This also covers zero amplitudes and the ends of the branch.
  There are $O \( N \)$ indices in a fixed bounded $j \/ N$ range.
    Outside a sufficiently large such range, repeated integration by parts gives,
    for any fixed positive integer $q$, $\| C_(m \, j) \( a \) \| lt.eq
    C_q \| j \|^(- q)$ uniformly in $a$ and $N$. Indeed the phase derivative has size comparable to $\| j \|$,
    and its higher derivatives are $O \( N \)$ with $N = O \( \| j \| \)$ there. Thus (2.14) implies
  $ sum_j integral_(bb(T)) \| C_(m \, j) - L_(m \, j) \|^2 thin upright(d) a = o \( 1 \) . $
  The $L^2$ norm of the leading array is bounded by a Riemann sum.
    Cauchy–Schwarz therefore gives the useful mass estimate
  #[#set math.equation(numbering: n => "(2.15)")
   $ sum_j integral_(bb(T)) lr(|\| C_(m \, j) \( a \) \|^2 - 1 / N W \( j \/ N - m Delta_N \, a \)|) thin
     upright(d) a = o \( 1 \) . $ <eq:summed-stationary-mass>]
  #emph[Cutoffs and transport.] The map $\( u \, a \) mapsto \( m V \( u \) \, a \)$ is injective on $I times
    bb(T)$. It takes disjoint compact supports with the same $m$ to disjoint compact sets.
    Our choice of $c$ separates the images for different $m$. The stated cutoffs $chi_alpha$ therefore exist.
    For large $N$ they equal one on the support of the corresponding leading array,
    since its $s$ coordinate is shifted by only $m_alpha Delta_N$.
    Because each cutoff is one on the shifted leading-array support,
    the deleted exact coefficient mass is bounded by the summed squared $C_(m \, j) - L_(m \, j)$ error,
    which tends to zero by the preceding estimate and Parseval’s identity.
    The same argument is valid after multiplication by $psi$,
    proving (2.10) and (2.15) for the retained arrays with the factor $psi^2$ on the right.
    The cutoffs make separation exact, not merely asymptotic.
    Different old $m$ never contribute to the same retained $j$,
    and at a shared $j$ the remaining supports in $u' = a$ are disjoint.
    The factor $"e" \( m a' \)$ in (2.9) proves the asserted independence of the new spare-coordinate modulus,
    also after combining packets at one index. Linearity proves the statement about attached constants.
  #emph[Fine temporal density.] We first remove rounding before any fine-scale sampling.
    Smoothness and compact support of the fixed $W$ give
  #[#set math.equation(numbering: n => "(2.16)")
   $ 1 / N sum_j integral_(bb(T)) \| W \( j \/ N - m Delta_N \, a \) - W \( j \/ N \, a \) \| thin upright(d) a =
     o \( 1 \) . $ <eq:rounding-mass-removal>]
  For example, a uniform bound on $partial_s W$ and $O \( N \)$ nonzero summands give an $O \( \| m \| \/ N \)$
    bound. The same holds with $psi^2$ and for any residue subset.
    Pushforward contracts total variation, so (2.15) and (2.16) allow us to replace the retained squared
    coefficient measures by $N^(- 1) W \( j \/ N \, a \) psi \( a \)^2 thin upright(d) a$,
    at total error $o \( 1 \)$, before pushing to temporal frequency.
    In particular, the actual lattice $j \/ N$ is never translated by $m Delta_N$.
  On the retained arc, the change of variable $y = s J \( a \)$ gives
  #[#set math.equation(numbering: n => "(2.17)")
   $ K \( s \, y \) = frac(W \( s \, a \) psi \( a \)^2, \| s \| J' \( a \)) \, wide a =
     J \|_(I')^(- 1) \( y \/ s \) \, $ <eq:K-jacobian>]
  with zero extension. The compact support of $psi$ inside $I'$ makes this extension continuous (in fact smooth
    away from $s = 0$). The real temporal frequency of a new angular index $j$ is
  #[#set math.equation(numbering: n => "(2.18)")
   $ t = j sigma_N \( a \) = j \/ N + \( j \/ N \) J \( a \) \/ N . $ <eq:output-frequency>]
  The density of the pushforward of $N^(- 1) W \( j \/ N \, a \) psi \( a \)^2 thin upright(d)
    a$ under this map is exactly $K \( j \/ N \, N t - j \)$.
    The factor $N$ in the density change of variable cancels the coefficient mass $N^(- 1)$.
  Choose $Y$ so that $K \( s \, y \) = 0$ for $\| y \| > Y$.
    For fixed $t$, at most $2 Y + 2$ integers contribute to either $sum_j K \( j \/ N \, N t - j \)$ or $sum_j
    K \( t \, N t - j \)$; on every contributing term $\| j \/ N - t \| lt.eq Y \/ N$.
    Uniform continuity of $K$, and a fixed bounded interval containing the $t$ supports for large $N$,
    prove that replacing $j \/ N$ by $t$ costs $o \( 1 \)$ in $L^1 \( bb(R) \)$.
    The same proof works after restriction to $j equiv h med \( mod med P \)$. This is (2.12).
    Folding modulo one contracts the $L^1$ norm and finishes the proof. ◻
]

It is useful to emphasize the normalization in (2.12). The periodization $sum_k
  K \( t \, y - k P \)$ is a density relative to length on the circle of length $P$, so its mean value is

#[#set math.equation(numbering: n => "(2.19)")
 $ 1 / P integral_(bb(T)) W \( t \, a \) psi \( a \)^2 thin upright(d) a . $ <eq:residue-mean>]

For $P = 1$, folding $t = z + l$ leaves the fast phase $N z$ unchanged, since $N$ is an integer.
  For general $P$, the folded expression has phase $N \( z + l \) - h$ modulo $P$;
  no divisibility condition on $N$ is imposed.

#thm([Lemma 2.2.])[
  (Fast-variable averaging).  #emph[Let $P > 0$, and let $G \( t \, y \)$ be continuous,
    compactly supported in $t$, and $P$-periodic in $y$. Then, uniformly in real offsets $beta_N$,
#[#set math.equation(numbering: n => "(2.20)")
 $ integral_(bb(R)) G \( t \, N t + beta_N \) thin upright(d) t arrow.r 1 /
   P integral_(bb(R)) integral_0^P G \( t \, y \) thin upright(d) y thin upright(d) t . $ <eq:fast-average>]

 In particular, suppose $w gt.eq 0$ is continuous and compactly supported in a compact set $K subset bb(R) \\ {
   0 }$. For continuous integrable densities $rho \, tilde(rho)$ define
$ cal(P)_(s \, P) rho \( y \) = sum_(k in bb(Z)) \| s \|^(- 1) rho \( \( y + k P \) \/ s \) . $

 Assume these periodizations are jointly continuous for $s in K$. Then
#[#set math.equation(numbering: n => "(2.21)")
 $ & lim_(N arrow.r oo) integral_(bb(R)) w \( s \) \| cal(P)_(s \, P) rho \( N s + beta_N \) -
   cal(P)_(s \, P) tilde(rho) \( N s + beta_N \) \| thin upright(d) s\
 & #h(12mm)  = 1 / P integral_(bb(R)) w \( s \) integral_0^P \| cal(P)_(s \, P) rho \( y \) -
   cal(P)_(s \, P) tilde(rho) \( y \) \| thin upright(d) y thin upright(d) s lt.eq
   frac(parallel w parallel_1, P) parallel rho - tilde(rho) parallel_1 . $ <eq:law-diagonal-comparison>]

 Joint continuity is automatic, for example, if the densities are continuous with bounds $C \/ \( 1 + y^2 \)$,
   or are continuous and compactly supported. Neither density need have mass one.]
] <lem:fast-average>

#proof[
  Partition the $t$ axis into intervals of length $P \/ N$ on each of which $N t + beta_N$ traverses one period.
    On each interval replace the slow argument $t$ of $G$ by an endpoint.
    Uniform continuity on the fixed compact support bounds the integrated error by a constant times its modulus of
    continuity at $P \/ N$, with an additional $O \( N^(- 1) \)$ boundary error.
    The resulting averages are Riemann sums for the right side of (2.20).
    This proves the first assertion, uniformly in the offset.
    Apply it to the continuous absolute difference in (2.21).
    The integral over one period of that difference is bounded by
  $ sum_k integral_0^P \| s \|^(- 1) \| rho \( \( y + k P \) \/ s \) -
    tilde(rho) \( \( y + k P \) \/ s \) \| thin upright(d) y = parallel rho - tilde(rho) parallel_1 . $
  Finally, on a compact set of nonzero $s$, quadratic tail bounds give a uniform summable bound
    $C' \/ \( 1 + k^2 \)$ on the periodizing summands, for $0 lt.eq y lt.eq P$.
    Uniform convergence proves joint continuity. Compactly supported densities are handled in the same way with
    only finitely many nonzero summands on that compact set. ◻
]

In the special case $\| A \( u \, a \) \|$ is independent of $a$, (2.11) has the form $W \( s \, a \) =
  w \( s \)$. If $tilde(rho) thin upright(d) y = J_(*) \( psi^2 thin upright(d) a \)$, then $K \( s \, y \) =
  w \( s \) \| s \|^(- 1) tilde(rho) \( y \/ s \)$. Thus replacing the realized jitter law by a regular target law
  $rho$ in the fine-density prescription costs, after taking $N$ sufficiently large,
  at most $parallel w parallel_1 parallel rho - tilde(rho) parallel_1 + o \( 1 \)$ for the full density.
  One sums this estimate over the fixed packet list and folds modulo one.
  This is an averaged estimate along the fast variable, not a pointwise estimate of periodized densities from
  total variation. It is applied only after (2.16), so the family being averaged is fixed.

#thm([Lemma 2.3.])[
  (Realization of jitter laws).  #emph[For any strictly positive smooth probability density $rho$ on $bb(R)$ and
    any $epsilon > 0$, there are a smooth real circle function $J$,
    an open arc $I'$ with $\| bb(T) \\ I' \| < epsilon$ and $J' > 0$ on $I'$, and $0 lt.eq psi lt.eq
    1$ in $C_c^oo \( I' \)$, such that
$ J_(*) \( psi^2 thin upright(d) a \) = tilde(rho) \( y \) thin upright(d) y \, wide
  tilde(rho) in C_c^oo \( bb(R) \) \, wide parallel rho - tilde(rho) parallel_1 < epsilon . $

 Here the cutoff law is a subprobability measure; no renormalization is made.
   Also $integral_(bb(T)) \( 1 - psi^2 \) thin upright(d) a < epsilon$.]
] <lem:law-approx>

#proof[
  Let $F \( y \) = integral_(- oo)^y rho \( v \) thin upright(d) v$.
    Strict positivity makes $F$ a smooth diffeomorphism from $bb(R)$ to $\( 0 \, 1 \)$.
    Choose $0 < delta < min \( 1 \/ 8 \, epsilon \/ 4 \)$ and a smooth function $xi$ compactly supported in
    $\( delta \/ 2 \, 1 - delta \/ 2 \)$ and equal to one on $\[ delta \, 1 - delta \]$.
    In the circle coordinate $0 < a < 1$, set $J \( a \) = xi \( a \)
    F^(- 1) \( a \)$ and extend it by zero near the identified endpoints.
    It is a smooth bounded circle function, and on $I' = \( delta \, 1 - delta \)$ it has derivative $1 \/
    rho \( F^(- 1) \( a \) \) > 0$. Choose $psi in C_c^oo \( I' \)$ with $0 lt.eq psi lt.eq 1$ and $psi =
    1$ on $\[ 2 delta \, 1 - 2 delta \]$. Change of variables gives
  $ tilde(rho) \( y \) = rho \( y \) psi \( F \( y \) \)^2 lt.eq rho \( y \) \, wide parallel rho -
    tilde(rho) parallel_1 = 1 - integral_(bb(T)) psi^2 thin upright(d) a lt.eq 4 delta < epsilon . $
  Its support is compact because that of $psi$ is compactly inside $\( 0 \, 1 \)$. All the claims follow. ◻
]

#thm([Lemma 2.4.])[
  (Weighted neutral refresh).  #emph[Given a twist, its fixed physical chart,
    a finite disjoint smooth packet list with color densities $p_r$, a positive integer $P$,
    and a positive tolerance, one can perform a passage with the following simultaneous properties.
    Its physical map and inverse lie in any prescribed smooth neighborhood of the old ones.
    Its new good-arc complement is arbitrarily small. Every color vector is transported within the prescribed
    $L^2$ tolerance, retaining constant tags and disjointness.
    The new packet moduli are independent of the new spare coordinate.
    The output densities $p'_r$ and the densities $p'_(r \, h)$ contributed by output indices $j equiv
    h med \( mod med P \)$ satisfy
#[#set math.equation(numbering: n => "(2.22)")
 $ parallel p'_r - p_r parallel_1 < epsilon \, wide parallel p'_(r \, h) -
   p_r \/ P parallel_1 < epsilon quad \( 0 lt.eq h < P \) \, $ <eq:neutral-densities>]

 where $epsilon > 0$ may be prescribed arbitrarily. The integer $c$ may first be required to exceed any fixed
   bound, and the retained supports may use any sufficiently small fixed enlargements of (2.8).
   If colors were disjoint in their old angular indices alone, their output angular index sets are still disjoint.
   The final passage integer $N$ may exceed any prescribed bound.]
] <lem:neutral>

#proof[
  Fix the old finite data and choose $c$ as in Lemma 2, also satisfying its prescribed lower bound.
    Identify all but a small interval of the $a$ circle with an interval in $bb(R)$.
    Choose an open arc $I'$ whose complement is as small as requested, and $0 lt.eq psi lt.eq
    1$ compactly supported there and equal to one except on a set of sufficiently small length.
    The boundedness of the finitely many old amplitudes allows us to make both their $L^2$ cutoff errors and the
    removed squared masses arbitrarily small. Fix this cutoff before proceeding.
  For a positive parameter $L$, take a smooth periodic function $J_L$ equal to $L a + beta$ on $I'$,
    extending it smoothly across the complementary interval. Such an extension exists by taking a smooth cutoff
    equal to one on the closure of $I'$ in a slightly larger real coordinate interval.
    In particular $J'_L = L$ on $I'$. Put $f_s \( a \) = W \( s \, a \) psi \( a \)^2$,
    extended by zero in this real coordinate. The periodization of its pushforward by $s J_L$ is
  #[#set math.equation(numbering: n => "(2.23)")
   $ sum_(k in bb(Z)) frac(1, \| s \| L) f_s (frac(\( y + k P \) \/ s - beta, L)) . $ <eq:neutral-riemann-sum>]
  This is $1 \/ P$ times a Riemann sum for $integral f_s \( a \) thin upright(d) a$,
    of mesh $P \/ \( \| s \| L \)$, with an arbitrary lattice offset and possibly reversed orientation.
    The error is bounded by
  #[#set math.equation(numbering: n => "(2.24)")
   $ frac(parallel partial_a f_s parallel_(L^1 \( bb(R) \)), \| s \| L) . $ <eq:neutral-riemann-error>]
  Indeed compare each lattice value times the mesh with the integral on its cell,
    using the fundamental theorem of calculus and summing the absolute derivative.
    Since $s$ ranges over a fixed compact set away from zero, this bound tends to zero uniformly in $s$ and $y$.
    It remains valid for arbitrary fixed dependence of the original amplitude on $a$.
  Choose $L$ large enough for these uniform errors to be as small as needed for the finite packet list.
    Now $J_L$ and all its norms are fixed. Choose the support cutoffs in Lemma 2,
    and then take $N$ sufficiently large. Its fine-density rule, together with (2.23),
    approximates each unfolded residue density by $P^(- 1) integral W \( s \, a \) psi \( a \)^2 thin upright(d)
    a$ in $L^1$. Folding modulo one gives $p_r \/ P$, up to the small cutoff loss;
    the integer $m c$ in $m V$ has no effect on this folding.
    The estimate is uniform in the periodic phase, so the folding offsets $N l$ cause no difficulty.
    Summing the residue estimates gives the total density estimate,
    upon initially making each error smaller by the fixed factor $P$ if necessary.
    Norm transport, exact support properties, and smooth proximity follow from the same passage lemma.
    All constraints on $N$ are lower bounds imposed after the physical chart, the amplitudes, $c$, the cutoff,
    $L$, and the support neighborhoods have been fixed. ◻
]

#prodef([Remark 2.5.])[
  A common passage can handle finitely many packet lists, requiring disjointness only within each list.
    Choose $c$ using the union of their old indices, choose the neutral cutoff and slope to meet all their
    finitely many mass and density bounds, and choose $N$ above all the resulting lower bounds.
    Support cutoffs are chosen separately for each list, disjoint within that list.
    The norm and density conclusions then hold for every list; no orthogonality between different lists is asserted.
] <rem:finite-family-passages>

All these operations preserve real data. Include together the packets $\( m \, A \)$ and
  $\( - m \, overline(A) \)$, attach conjugate tags, and choose $chi_(- m) \( s \, a \) = chi_m \( - s \, a \)$.
  The exact coefficients obey $C_(- m \, - j) = overline(C_(m \, j))$, and all other cutoffs are real.
  Thus conjugate packets and conjugate colors can be retained at every passage.

== 3 Small Fourier signals <sec:signals>

The purpose of this section is to modulate a packet’s spectral density according to its angular index.
  The size of the modulation will depend on a fixed band of #emph[normalized] indices,
  but not on the scale of those indices. The integer added to the old speed is allowed to depend on the actual,
  finite set of indices.

Fix numbers $0 < b < D_0$ and a function

#[#set math.equation(numbering: n => "(3.1)")
 $ d in C_c^oo \( bb(R) \\ { 0 } \; bb(C) \) \, wide d \( - x \) = overline(d \( x \)) . $ <eq:signal-d>]

A scale is a positive real number $B$, and the normalized index of a packet at angular index $m$ is $x = m \/ B$.

#thm([Lemma 3.1.])[
  (Transmission of an index signal).  #emph[For the fixed data $b \, D_0 \, d$ there are an integer $P gt.eq
    2$ and a number $gamma_0 > 0$ with the following property.
    Any fixed $0 < gamma lt.eq gamma_0$ can be used, independently of $B$.]
  #emph[Let $S$ be an intermediate map, and let
$ F_r = sum_(m in cal(M)_r) A_(r \, m) \( u \, a \) "e" \( m theta \) $

 be finite smooth packet data in its good arc. Suppose that the finite sets $cal(M)_r subset bb(Z) \\ {
   0 }$ are mutually disjoint, $\| A_(r \, m) \( u \, a \) \|$ is independent of $a$,
   and $b lt.eq \| m \| \/ B lt.eq D_0$. Write $p_(r \, m)$ for the spectral density of the indicated packet.
   Given any $epsilon \, delta_x \, delta_z > 0$ and prescribed positive bounds for the physical $L^2$ transport
   errors, a passage produces finite output packet sums $F_(r \, m)^(+)$,
   approximating the corresponding input packets in physical $L^2$, whose spectral densities satisfy
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(r \, m) ∥p_(r \, m)^(+) -
   p_(r \, m) \( z \)
   [1 + 2 gamma upright(bold(1))_(gcd \( m \, P \) = 1) "Re" { d \( m \/ B \) "e" \( - N z \) }]∥_(L^1 \(
   bb(T) \)) < epsilon . $ <eq:signal-conclusion>]

 The new scale is $B^(+) = N c B$, and the new speed is $sigma_N$ from Lemma 2.
   For every point $\( u' \, a' \)$ in the coefficient support of a retained output packet of index $j$ descending
   from $\( r \, m \)$, there is $\( u \, a \) in "supp" A_(r \, m)$ such that
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|j / B^(+) - m / B|) < delta_x \, wide "dist"_(bb(T)) #scale(x: 120%, y: 120%)[\(] j sigma_N \( u' \) \,
   m phi.alt \( u \) #scale(x: 120%, y: 120%)[\)] < delta_z . $ <eq:signal-support-closeness>]

 Its modulus is independent of the new spare coordinate. Distinct old angular indices have disjoint output
   angular-index supports. Conjugate symmetry is preserved when present.]
  #emph[The passage and its inverse can lie in any prescribed smooth neighborhood of $S$ and $S^(- 1)$ in physical
    coordinates, and the new good arc can have arbitrarily small complement.
    The choices can be made in the order $c$, a bounded smooth jitter and cutoffs, and finally the integer $N$.
    After the preceding choices, every sufficiently large integer $N$ works.
    In particular an arbitrary lower bound on $N$ can be imposed.]
] <lem:signal>

#proof[
  #emph[A positive law.] We first construct a positive law without using $B$.
    We use the positive-exponent Fourier convention
  $ hat(q) \( v \) = integral_(bb(R)) q \( R \) "e" \( v R \) thin thin upright(d) R . $
  Choose $0 < alpha < b \/ 2$, put $a_0 = \( 2 alpha \)^(- 1)$, and define
  #[#set math.equation(numbering: n => "(3.4)")
   $ s_alpha \( R \) = alpha (frac(sin \( pi alpha R \), pi alpha R))^2 \, wide q_0 \( R \) =
     frac(1, 2 a_0) integral_(- a_0)^(a_0) s_alpha \( R - t \) thin thin upright(d) t \, $ <eq:signal-baseline>]
  with the removable value at the origin understood. Fourier inversion for an interval, followed by convolution, gives
  $ hat(s_alpha) \( v \) = \( 1 - \| v \| \/ alpha \)_(+) . $
  Consequently $q_0$ is a smooth probability density with Fourier support in $\[ - alpha \, alpha \]$.
    It is strictly positive: the interval of translations in (3.4) cannot be contained in the discrete zero set of
    $s_alpha$.
  Here a quantitative lower tail is useful. Since the averaging interval has length $1 \/ alpha$,
    it contains exactly one period of $sin^2 \( pi alpha \( R - t \) \)$ as a function of $t$.
    For $\| R \| gt.eq 2 a_0 + 1$ this gives
  $ frac(1, 2 pi^2 alpha \( \| R \| + a_0 \)^2) lt.eq q_0 \( R \) lt.eq frac(1, pi^2 alpha \( \| R \| - a_0 \)^2) . $
  Positivity and continuity on the remaining compact interval therefore give constants $c_0 \, C_0 > 0$ such that
  #[#set math.equation(numbering: n => "(3.5)")
   $ frac(c_0, 1 + R^2) lt.eq q_0 \( R \) lt.eq frac(C_0, 1 + R^2) wide \( R in bb(R) \) .
     $ <eq:signal-quadratic-tails>]
  Choose $D > b$ such that $"supp" d subset \[ - D \, D \]$, and then an integer $L > max \( 2 \, D \/ b \)$.
    Let $P$ be the product of all primes at most $L$. The strict inequality in this choice will allow a small
    dilation of the Fourier arguments. Define
  $ g \( R \) = integral_(bb(R)) d \( v \) "e" \( - v R \) thin thin upright(d) v \, wide C_P \( h \) =
    sum_(k in \( bb(Z) \/ P bb(Z) \)^times) "e" \( - k h \/ P \) quad \( 0 lt.eq h < P \) . $
  The function $g$ is Schwartz by repeated integration by parts.
    The symmetry in (3.1) makes it real, and $integral g = d \( 0 \) = 0$.
    The number $C_P \( h \)$ is real because the set of units is invariant under negation. Set
  #[#set math.equation(numbering: n => "(3.6)")
   $ Q_h \( R \) = 1 / P #scale(x: 120%, y: 120%)[\[] q_0 \( R \) +
     gamma C_P \( h \) g \( R \) #scale(x: 120%, y: 120%)[\]] . $ <eq:signal-joint-law>]
  For $G = sup_R \( 1 + R^2 \) \| g \( R \) \|$ and $C_(*) = max_h \| C_P \( h \) \|$,
    choose $gamma_0 > 0$ so small that
  $ gamma_0 C_(*) G lt.eq c_0 \/ 2 \, wide 2 gamma_0 parallel d parallel_oo lt.eq 1 \/ 2 \; $
  a zero factor imposes no restriction. Then, for every permitted $gamma$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(q_0 \( R \), 2 P) lt.eq Q_h \( R \) lt.eq frac(3 q_0 \( R \), 2 P) \, wide
     integral_(bb(R)) Q_h \( R \) thin thin upright(d) R = 1 / P . $ <eq:signal-positive-law>]
  Thus $Q_h \( R \) thin thin upright(d) R$ defines a probability law on $bb(R) times { 0 \, dots.h \, P - 1 }$.
    Finite Fourier inversion gives, for every $v in bb(R)$ and $k in bb(Z)$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_(h = 0)^(P - 1) integral_(bb(R)) Q_h \( R \) "e" \( v R + k h \/ P \) thin thin upright(d) R =
     hat(q)_0 \( v \) upright(bold(1))_(k equiv 0 med \( P \)) +
     gamma d \( v \) upright(bold(1))_(gcd \( k \, P \) = 1) . $ <eq:signal-joint-fourier>]
  Indeed the sum over $h$ pairs $C_P \( h \)$ with the character at $k$,
    leaving precisely the indicator that $k$ is a unit. All choices up to this point are independent of $B$,
    the map, and its finite packet list.
  #emph[Moments and the finite sieve.] For fixed $B$ and an integer $c > 0$, consider the random variable
  #[#set math.equation(numbering: n => "(3.9)")
   $ J_(*) = \( R \/ B + h \/ P \) \/ c $ <eq:signal-ideal-jitter>]
  under this law. Its density is
  $ rho_(B \, c) \( y \) = c B sum_(h = 0)^(P - 1) Q_h #scale(x: 120%, y: 120%)[\(] B \( c y - h \/ P \)
    #scale(x: 120%, y: 120%)[\)] . $
  It is a strictly positive smooth probability density. The bounds (3.7) imply quadratic upper and lower tails,
    with constants now allowed to depend on $B \, c$.
  We calculate the periodized density of $s J_(*)$. Write $x = m \/ B$ and $s = m c t$.
    For its positive integer Fourier moments, the exact formula is
  #[#set math.equation(numbering: n => "(3.10)")
   $ M_ell \( t \) = 1 / P sum_(h = 0)^(P - 1) "e" \( ell m t h \/ P \) #scale(x: 120%, y: 120%)[\[]
     hat(q)_0 \( ell x t \) + gamma C_P \( h \) d \( ell x t \) #scale(x: 120%, y: 120%)[\]] \, wide ell gt.eq
     1 . $ <eq:signal-exact-moment>]
  At $t = 1$, (3.8) applies. Its baseline term vanishes since $\| ell x \| gt.eq b > alpha$.
    If $ell gt.eq 2$ and $d \( ell x \) eq.not 0$, then $ell lt.eq D \/ b < L$.
    Some prime divisor of $ell$ therefore divides $P$, so $gcd \( ell m \, P \) > 1$. It follows that
  #[#set math.equation(numbering: n => "(3.11)")
   $ M_1 \( 1 \) = gamma d \( x \) upright(bold(1))_(gcd \( m \, P \) = 1) \, wide M_ell \( 1 \) =
     0 quad \( ell gt.eq 2 \) . $ <eq:signal-ideal-moments>]
  For finite $c$ the discrete phases in (3.10) need not be residue characters.
    We estimate their errors before using the sieve. Choose $tau in \( 1 \/ 2 \, 1 \)$ so that $D \/ \( tau b \) <
    L$, and take $c$ large enough that
  $ t_N \( u \) = 1 + frac(phi.alt \( u \) + Delta_N, c) gt.eq tau \, wide \| Delta_N \| lt.eq 1 \/ N \, $
  on the old supports, uniformly for $N gt.eq 1$. The baseline term in (3.10) then vanishes for #emph[every] $ell
    gt.eq 1$, since $\| ell x t_N \| gt.eq tau b > alpha$. The perturbation also vanishes identically when $ell >
    D \/ \( tau b \)$. Hence nonintegral discrete phases cannot introduce an unbounded collection of harmonics.
    For the fixed remaining finite set, put $C_1 = P^(- 1) sum_h \| C_P \( h \) \|$.
    The elementary bound $\| "e" \( v \) - "e" \( w \) \| lt.eq 2 pi \| v - w \|$ gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ \| M_ell \( t \) - M_ell \( 1 \) \| lt.eq gamma C_1 ell #scale(x: 120%, y: 120%)[\[] D_0 parallel d'
     parallel_oo + 2 pi \| m \| parallel d parallel_oo #scale(x: 120%, y: 120%)[\]] \| t -
     1 \| . $ <eq:signal-finite-c>]
  We may thus make the sum of all moment errors arbitrarily small by choosing $c$ after the actual finite set of
    old indices. In particular $c$ is allowed to grow with $max \| m \|$; $gamma$ does not need to decrease.
    The same choice can make the ranges $m \( c + phi.alt \( bb(T) \) \)$ for distinct old indices disjoint and
    bounded away from zero.
  To pass from moments to densities, let
  $ cal(P)_s rho \( y \) = sum_(k in bb(Z)) frac(1, \| s \|) rho \( \( y + k \) \/ s \) \, wide y in bb(T) . $
  Once $c$ has been chosen, all the relevant $s$ ranges are fixed compact sets away from zero.
    No bound on these sets uniform over future passages is needed.
    For $s$ in a fixed compact subset of $bb(R) \\ { 0 }$, the quadratic upper tail of $rho_(B \, c)$ makes this a
    jointly continuous function of $\( s \, y \)$, with uniformly summable tails.
    Its Fourier coefficients in the positive-exponent convention are the moments just computed.
    The compact bandwidth shows that its Fourier series is a finite sum on the relevant branches.
    Fourier uniqueness and (3.11)–(3.12) therefore give, uniformly on those branches and in $y$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ cal(P)_s rho_(B \, c) \( y \) = 1 + 2 gamma upright(bold(1))_(gcd \( m \, P \) = 1) "Re" { d \( m \/ B \)
     "e" \( - y \) } + o_(c arrow.r oo) \( 1 \) . $ <eq:signal-periodic-density>]
  The error here is for the fixed old list and scale $B$. The negative exponent follows directly from our
    convention: $integral cal(P)_s rho \( y \) "e" \( ell y \) thin thin upright(d) y = M_ell$.
  #emph[Realization and support.] We now realize this law by a passage.
    Lemma 4 provides a bounded smooth circle function $J$, strictly increasing on a good arc,
    and a smooth cutoff $psi$ compactly supported in that arc, such that the subprobability law
  $ tilde(rho) = J_(*) \( psi \( a \)^2 thin thin upright(d) a \) $
  is arbitrarily close to $rho_(B \, c)$ in total variation. Its missing mass is included in this error.
    The good arc has as small a complement as requested. Since $\| A_(r \, m) \|$ is independent of $a$,
    its stationary weight is a function of $s$ alone:
  $ w_(r \, m) \( s \) = frac(\| A_(r \, m) \( u \, a \) \|^2, \| m phi.alt' \( u \) \|) \, wide
    m \( c + phi.alt \( u \) \) = s \, $
  extended by zero. For such a nonnegative compactly supported weight,
    Lemma 3 and contraction of total variation under pushforward and periodization give
  #[#set math.equation(numbering: n => "(3.14)")
   $ & lim_(N arrow.r oo) integral_(bb(R)) w_(r \, m) \( s \) \| cal(P)_s tilde(rho) \( N s \) -
     cal(P)_s rho_(B \, c) \( N s \) \| thin thin upright(d) s\
 & wide = integral_(bb(R)) w_(r \, m) \( s \) integral_(bb(T)) \| cal(P)_s tilde(rho) \( y \) -
   cal(P)_s rho_(B \, c) \( y \) \| thin thin upright(d) y thin thin upright(d) s\
 & wide lt.eq parallel w_(r \, m) parallel_1 parallel tilde(rho) -
   rho_(B \, c) parallel_(L^1 \( bb(R) \)) . $ <eq:signal-law-comparison>]
  Here densities of subprobabilities are used in the $L^1$ norm.
    The realized law has a continuous compactly supported density;
    the ideal law has the uniform tail bound established above.
    These facts supply the continuity and domination required for fast averaging.
    The independence of the weight from $a$ is essential in this step.
  Lemma 2 identifies the output density, up to an arbitrarily small $L^1$ error,
    as the folding to $bb(T)$ of $w_(r \, m) \( s \) cal(P)_s tilde(rho) \( N s \)$.
    In using that lemma the rounding correction is removed at the coefficient-mass level:
    its replacement of $w_(r \, m) \( s \)$ by $w_(r \, m) \( s - m Delta_N \)$ costs $o \( 1 \)$ in the summed
    masses. It does not translate the fast argument $N s$. Alternatively, (3.12) also holds uniformly with $t =
    t_N$. Since $c m$ and $N$ are integers,
  $ p_(r \, m) \( z \) = sum_(k in bb(Z)) w_(r \, m) \( z + k \) \, wide "e" \( - N \( z + k \) \) = "e" \( - N z \) . $
  Now (3.13), (3.14), and the passage density formula prove (3.2).
    Choose $c$ first to make its error sufficiently small, then the law approximation, and then $N$.
    The finite packet list allows all errors to be summed.
  For completeness we give the simultaneous support estimates, which will also apply to neutral passages.
    Put $M = max_(r \, m) \| m \|$, with $M = 0$ for an empty packet list.
    By the support cutoff in Lemma 2, at each retained point of an output packet at index $j$ there is a point $u$
    in its old support for which
  #[#set math.equation(numbering: n => "(3.15)")
   $ j \/ N = m \( c + phi.alt \( u \) + Delta_N \) + eta \, wide \| eta \| lt.eq eta_0 \,
     $ <eq:signal-retained-support>]
  where the image enlargement $eta_0$ can be as small as desired.
    If $x' = j \/ \( N c B \)$ and $z' = j \/ N + \( j \/ N \) J \( a \) \/ N$ is the new temporal frequency, then
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| x' - m \/ B \| & lt.eq frac(D_0 \( parallel phi.alt parallel_oo + 1 \), c) + frac(eta_0, c B) \,\
"dist"_(bb(T)) \( z' \, m phi.alt \( u \) \) & lt.eq M / N + eta_0 +
  frac(\[ M \( c + parallel phi.alt parallel_oo + 1 \) + eta_0 \] parallel J parallel_oo, N) .
  $ <eq:signal-index-drift>]
  Choose $c$ for the first bound and index separation, then $eta_0$ and the bounded $J$,
    and finally $N$ for the second bound. A large bound on $J$ only increases the eventual requirement on $N$.
    These choices also give physical smooth closeness of the passage and its inverse and the required $L^2$
    approximations, by Lemma 2.
  Every new coefficient descending from old index $m$ has the form $"e" \( m a_(upright("new")) \)$ times a scalar
    function of the new speed coordinate. Because different old indices have disjoint retained new index ranges,
    their spare-coordinate phases are never added at one new index.
    Thus the resulting packet moduli are independent of the new spare coordinate.
    All cutoffs can be chosen in conjugate pairs, so conjugation is retained as well. ◻
]

We next remove the coprimality restriction by placing a neutral passage before transmission.
  The output residue classes of the neutral passage, rather than the input residue classes,
  are the ones tested in the transmission.

#thm([Lemma 3.2.])[
  (Refresh and transmission).  #emph[Fix $b \, D_0 \, d \, P \, gamma$ as in Lemma 7, and put
#[#set math.equation(numbering: n => "(3.17)")
 $ lambda = gamma frac(\| \( bb(Z) \/ P bb(Z) \)^times \|, P) > 0 . $ <eq:signal-lambda>]

 Suppose finite colored packet data have mutually disjoint angular-index sets and moduli independent of the spare
   coordinate. Suppose their normalized indices lie in a fixed compact subset of ${ x : b < \| x \| < D_0 }$.
   Let $p_r$ be the color densities, and let $d_r : bb(T) arrow.r
   bb(C)$ be continuous functions such that on the support of every input packet of color $r$,
#[#set math.equation(numbering: n => "(3.18)")
 $ \| d \( m \/ B \) - d_r \( m phi.alt \( u \) med mod med 1 \) \| lt.eq omega . $ <eq:signal-color-match>]

 Then a neutral passage followed by a transmission gives output colors with
#[#set math.equation(numbering: n => "(3.19)")
 $ sum_r ∥p_r^(+) - p_r \( z \) #scale(x: 120%, y: 120%)[\[] 1 +
   2 lambda "Re" { d_r \( z \) "e" \( - N z \) } #scale(x: 120%, y: 120%)[\]]∥_1 lt.eq
   2 gamma omega sum_r parallel p_r parallel_1 + epsilon \, $ <eq:signal-refreshed>]

 where $epsilon > 0$ is arbitrary and $N$ is the second passage integer.
   The physical map and inverse, the physical packet vectors,
   and the normalized-index and temporal-frequency displacements can all be controlled with arbitrary prescribed
   positive error bounds. Output packet moduli remain independent of the spare coordinate,
   and colors remain disjoint in angular indices. The final $N$ can exceed any prescribed bound.
   Conjugate-symmetric data can be treated conjugate-symmetrically.]
  #emph[If different colors start in separated compact normalized-index sets,
    any fixed sufficiently small enlargements of those sets can contain their outputs.
    The same conclusion holds through any fixed finite number of such pairs,
    with positive margins around the band $b < \| x \| < D_0$.
    If the input supports satisfy $"dist"_(bb(T)) \( m \/ B \, m phi.alt \( u \) \) lt.eq kappa$,
    the output supports satisfy the same inequality with $kappa$ increased by an arbitrarily small amount.]
] <lem:refresh-transmit>

#proof[
  Use Lemma 5 with residue modulus $P$. Denote the refreshed scale by $tilde(B)$,
    its packet densities by $tilde(p)_(r \, m)$, and its color-residue densities by
  $ tilde(p)_(r \, h) = sum_(m equiv h med \( P \)) tilde(p)_(r \, m) . $
  That lemma makes
  #[#set math.equation(numbering: n => "(3.20)")
   $ E_r = sum_(h = 0)^(P - 1) parallel tilde(p)_(r \, h) - p_r \/ P parallel_1 $ <eq:signal-residue-error>]
  arbitrarily small. It also retains disjoint output angular-index sets and gives moduli independent of the new
    spare coordinate. To control its support, first choose its $c$ as large as necessary for (3.16);
    next choose its cutoff and broad linear jitter for the residue equalization;
    finally choose its passage integer for (3.16). Thus equalizing residues does not prevent either displacement
    from being arbitrarily small.
  For a continuous function $f$ on its relevant compact domain,
    denote its modulus of continuity by $nu_f \( t \) = sup_("dist" \( v \, w \) lt.eq t) \| f \( v \) -
    f \( w \) \|$. If the refresh changes normalized indices by at most $delta_x$ and temporal frequencies by at
    most $delta_z$, its retained color supports satisfy
  #[#set math.equation(numbering: n => "(3.21)")
   $ \| d \( m \/ tilde(B) \) - d_r \( z \) \| lt.eq rho_r := omega + nu_d \( delta_x \) +
     nu_(d_r) \( delta_z \) . $ <eq:signal-refreshed-match>]
  This follows pointwise by linking an output support point to an old one and using (3.18).
    In particular the extra terms tend to zero. The compact margin in the normalized band lets us apply Lemma 7
    with the same $P \, gamma$ after this refresh, although its actual indices and scale may be very large.
  By that lemma the transmission density, with an arbitrarily small summed error $T_r$ for color $r$, is
  $ tilde(p)_r \( z \) + 2 gamma "Re" {"e" \( - N z \) sum_(gcd \( m \, P \) = 1) d \( m \/ tilde(B) \)
    tilde(p)_(r \, m) \( z \)} . $
  Replacing the coefficient in this sum by $d_r \( z \)$ costs at most $2 gamma rho_r parallel tilde(p)_r
    parallel_1$ in $L^1$. Also,
  $ parallel tilde(p)_r - p_r parallel_1 lt.eq E_r \, wide ∥sum_(h in \( bb(Z) \/ P bb(Z) \)^times)
    tilde(p)_(r \, h) - frac(\| \( bb(Z) \/ P bb(Z) \)^times \|, P) p_r∥_1 lt.eq E_r . $
  Consequently the color’s total error against the target in (3.19) is bounded by
  #[#set math.equation(numbering: n => "(3.22)")
   $ T_r + \( 1 + 2 gamma parallel d_r parallel_oo \) E_r + 2 gamma rho_r \( parallel p_r parallel_1 + E_r \) .
     $ <eq:signal-refresh-error>]
  Choose the refresh errors, displacements, and transmission errors small enough and sum this bound over the
    finite list. This proves (3.19), including the exact value of $lambda$.
    Only residue balancing after summing over a color was needed, because (3.21) holds pointwise before the sum.
  The remaining assertions follow from the two passage lemmas and (3.16)–(3.16).
    Specifically, the triangle inequality gives
  $ "dist"_(bb(T)) \( x' \, z' \) lt.eq "dist"_(bb(T)) \( x \, z \) + \| x' - x \| + "dist"_(bb(T)) \( z' \, z \) . $
  Positive separation distances and the fixed finite number of passages allow displacement budgets smaller than
    all band margins and color gaps. Constants such as $lambda$ are fixed before these error budgets are imposed.
    The required $c$ and passage integers may then be chosen afresh after each actual finite packet list is known. ◻
]

== 4 Finite blocks and prediction <sec:blocks>

The signal from Lemma 8 can be arbitrarily weak. We use many such signals,
  holding one centering function fixed throughout each block.
  For a block with $n lambda^2$ comparable to $delta$, the square-root integral loses $O \( delta^2 \)$,
  while the estimator has mean-square error $O \( 1 \/ delta \)$.
  Averaging the estimators from $K$ blocks gives mean-square error $O \( \( K delta \)^(- 1) \)$ with total loss
  $O \( K delta^2 \)$. Thus $K delta$ can grow while $K delta^2$ tends to zero.

#thm([Proposition 4.1.])[
  (Prediction of a tagged packet sum).  #emph[Let $S$ be an intermediate map,
    expressed in a fixed physical volume-preserving coordinate chart. Let
$ F_r = sum_(m in cal(M)_r) A_(r \, m) \( u \, a \) "e" \( m theta \) \, wide F = sum_r F_r \, $

 be a finite list of colors of smooth packets supported compactly in the good arc.
   Suppose that the finite sets $cal(M)_r subset bb(Z) \\ { 0 }$ are pairwise disjoint,
   that $\| A_(r \, m) \( u \, a \) \|$ is independent of $a$,
   and that the list is invariant under complex conjugation: $F_(r^(*)) = overline(F_r)$.
   In particular, $F$ is real. Let $p_r$ be the corresponding spectral densities, put $p = sum_r p_r$, and suppose that
$ integral_(bb(T)) p \( z \) thin thin upright(d) z lt.eq 3 / 2 . $

 Assign constants $b_r in bb(C)$ satisfying $b_(r^(*)) = overline(b_r)$.]
  #emph[Given $epsilon \, tau \, kappa > 0$ and any neighborhood of the physical map and its inverse in the smooth
    topology, there are a finite sequence of passages, a final intermediate map $S'$, final packets $F'_r$,
    and a smooth function $Psi : bb(T) arrow.r bb(C)$, such that
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_r parallel F'_r - F_r parallel_2 & < epsilon \,\
integral_(bb(T)) sqrt(p' \( z \)) thin thin upright(d) z & gt.eq
  integral_(bb(T)) sqrt(p \( z \)) thin thin upright(d) z - tau \, wide p' = sum_r p'_r \,\
∥sum_r b_r F'_r - Psi \( U_(S') \) sum_r F'_r∥_2 & < epsilon . $ <eq:prediction-transport>]

 Here the differences in (4.1) are measured in the original physical $L^2$ space.
   All the physical maps and their inverses can be kept in the prescribed neighborhood.
   The final good arc $I'$ satisfies $\| bb(T) \\ I' \| < kappa$.
   The output colors again have disjoint nonzero angular-index sets, moduli independent of the spare coordinate,
   and conjugation symmetry. The multiplier can be chosen with $Psi \( - z \) = overline(Psi \( z \))$.]
] <prop:prediction>

We first record the precise averaging assertion needed in the proof.
  In the following lemma, a Laurent polynomial in $w_1 \, dots.h \,
  w_n$ means a finite linear combination of the monomials $w^nu = product_i w_i^(nu_i)$, with $nu in bb(Z)^n$.

#thm([Lemma 4.2.])[
  (Finite phase tests).  #emph[Fix finitely many expressions
$ P_j \( z \, w \) = sum_(nu in cal(E)_j) c_(j \, nu) \( z \) w^nu \, wide c_(j \, nu) in L^1 \( bb(T) \) \, $

 where each $cal(E)_j$ is finite. For every $eta > 0$, successively large positive integers $L_1 \, dots.h \,
   L_n$ can be chosen so that, simultaneously for all $j$,
#[#set math.equation(numbering: n => "(4.2)")
 $
   lr(|integral_(bb(T)) P_j #scale(x: 120%, y: 120%)[\(] z \, "e" \( L_1 z \) \, dots.h \, "e" \( L_n z \)
   #scale(x: 120%, y: 120%)[\)] thin thin upright(d) z - integral_(bb(T)) integral_(bb(T)^n) P_j
   #scale(x: 120%, y: 120%)[\(] z \, "e" \( y_1 \) \, dots.h \, "e" \( y_n \) #scale(x: 120%, y: 120%)[\)] thin
   thin upright(d) y thin thin upright(d) z|) < eta . $ <eq:phase-tests>]

 At each selection, $L_i$ may additionally be required to exceed any finite lower bound determined by the
   preceding choices and the then-current construction data.]
] <lem:phase-tests>

#proof[
  Let $D$ bound the absolute values of all the exponents in all the $cal(E)_j$.
    The integral of a nonconstant monomial on the product torus is zero.
    On the one-dimensional diagonal its contribution is a Fourier coefficient of $c_(j \, nu)$ at $-
    sum_i nu_i L_i$. The Fourier coefficients of an $L^1$ function tend to zero:
    this follows by approximation in $L^1$ by trigonometric polynomials,
    whose sufficiently high Fourier coefficients vanish. Since the coefficient list is finite,
    choose $R$ so that the sum of the bounds for all these nonconstant contributions is less than $eta$ whenever
    their frequencies have absolute value greater than $R$. Choose successively
  $ L_j > R + D sum_(i < j) L_i \, $
  as well as the additional finite lower bounds. If $j$ is the last nonzero position of $nu$, then
  $ lr(|sum_i nu_i L_i|) gt.eq L_j - D sum_(i < j) L_i > R . $
  This proves the assertion. No independence assertion about the distribution of the entire diagonal is made or
    needed. ◻
]

#proof[
  Zero colors may be omitted. If all colors vanish, a neutral passage with zero output packets and $Psi =
    0$ proves the assertion, including the requested new good arc. Hence assume that a nonzero color is present.
    Dividing all tags by $max \( 1 \, max_r \| b_r \| \)$ and reducing the requested prediction tolerance reduces
    the proof to $\| b_r \| lt.eq 1$. The transport and square-root tolerances remain independently adjustable.
    We work under this normalization until the end.
  ===== 4.1 The data fixed at the beginning of a block. <the-data-fixed-at-the-beginning-of-a-block.>
  For the moment suppose that the current packet mass is at most $2$.
    Write its actual densities as $p_r$, put $p = sum_r p_r$, and on ${ p > 0 }$ set
  $ t_r = p_r / p \, wide beta = sum_r t_r b_r . $
  Set $beta = 0$ on ${ p = 0 }$. Then $\| beta \| lt.eq 1$ and $beta \( - z \) = overline(beta \( z \))$.
    Fix $0 < delta lt.eq 1 \/ 100$. There is a smooth circle function $q$ such that
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| q \| lt.eq 2 \, wide q \( - z \) = overline(q \( z \)) \, wide integral_(bb(T)) sqrt(p) thin \| beta -
     q \|^2 thin thin upright(d) z < delta . $ <eq:block-centering>]
  Indeed, convolve $beta$ with an even nonnegative smooth approximate identity.
    The convolutions have absolute value at most $1$, have the required symmetry,
    and converge almost everywhere to $beta$. Since $sqrt(p) in L^1$, dominated convergence gives (4.3).
    In particular this choice does not require any uniform bound on derivatives of $q$.
  Let $A$ be any fixed bounded function on the temporal circle.
    In the iteration, $A$ will be the sum of the estimators from $k$ already completed blocks.
    Both $q$ and $A$ are fixed before any frequencies for the present block are chosen.
    The densities $p_r$ in every model below are these actual #emph[pre-block] densities.
  ===== 4.2 Anchoring, with the number of passages fixed first. <anchoring-with-the-number-of-passages-fixed-first.>
  Choose an integer $c_0$ large enough that the full compact ranges $m \( c_0 + phi.alt \( bb(T) \) \)$ for
    distinct old indices are separated and avoid zero, as required by Lemma 2.
    In particular this separates the compact packet images
  $ m \( c_0 + phi.alt \( u \) \) \, wide u in "proj"_u "supp" A_(r \, m) \, $
  for all distinct old indices $m$. Let $K_r$ be the union of the images belonging to color $r$.
    The $K_r$ are disjoint compact sets and $K_(r^(*)) = - K_r$.
    Choose slightly larger compact neighborhoods of them, still disjoint and off zero,
    and then disjoint open neighborhoods with compact closures.
    We will retain enough room between these two families of neighborhoods for all the support movements in the
    block. There is a smooth compactly supported function on $bb(R) \\ { 0 }$ such that
  #[#set math.equation(numbering: n => "(4.4)")
   $ d \( - x \) = overline(d \( x \)) \, wide d \( x \) = b_r - q \( x med mod med 1 \) quad
     upright("on a neighborhood of the enlarged ") K_r . $ <eq:block-band-function>]
  For example, use disjoint smooth cutoffs equal to one near these sets, chosen compatibly with reflection,
    and multiply the $r$th cutoff by $b_r - q \( x med mod med 1 \)$.
    Fix $0 < b_0 < D_0$ such that all the retained neighborhoods lie strictly inside ${ b_0 < \| x \| < D_0 }$.
  Apply Lemma 7 to this fixed $d$ and these band bounds. It gives a modulus $P$ and an arbitrarily small positive
    strength $gamma$, independently of the future angular scale. Put
  $ lambda = gamma frac(\| \( bb(Z) \/ P bb(Z) \)^times \|, P) . $
  Take $gamma$ so small that $6 lambda < 1$ and $lambda^2 lt.eq delta \/ 2$, and choose an integer $n gt.eq 1$ with
  #[#set math.equation(numbering: n => "(4.5)")
   $ delta / 2 lt.eq n lambda^2 lt.eq delta . $ <eq:block-budget>]
  One may take $n = floor.l delta \/ lambda^2 floor.r$. At this point $q \, c_0 \, K_r \, d \, P \, gamma \,
    lambda \, n$ are all fixed. In particular they have been chosen #emph[before] the integer of the anchor
    passage. The error targets used below depend only on these data, the already fixed $A \, k$,
    and the requested tolerance $nu$. They can therefore be fixed now, before executing the anchor.
  Now make a neutral passage with the already fixed $c_0$, choosing its jitter and its integer $N_0$ for the
    required accuracy. Use $B = N_0$ as the output angular scale.
    Lemmas 2 and 5 give color densities as close to $p_r$ in $L^1$ as desired.
    On their retained supports the normalized indices $x = j \/
    N_0$ lie in arbitrarily small enlargements of $K_r$. If $J_0$ is the bounded jitter chosen for this passage,
    their actual temporal frequencies satisfy
  $ z = x + x J_0 \( a \) \/ N_0 med \( mod med 1 \) . $
  Thus $"dist"_(bb(T)) \( x med mod med 1 \, z \)$ can be made arbitrarily small after $J_0$ is fixed,
    by increasing $N_0$.
  We follow this anchor by $n$ refresh–transmit pairs from Lemma 8.
    At every passage the scale changes by $B' = N c B$. The support estimates (3.16)–(3.16),
    which apply to neutral as well as transmitting passages, control normalized-index and temporal-frequency
    movement separately. Choose $c$ and sufficiently small support enlargements to meet the movement budgets;
    in particular, the enlargement is smaller than the temporal tolerance because its contribution there is not
    divided by $N$. Fix the bounded jitter $J$ next, and choose $N$ last for the remaining terms.
    Thus an arbitrarily broad neutral jitter remains compatible with temporal tracking.
  There are only $2 n + 1$ passages in this block. Apportion small enough movement budgets among them so that all
    normalized indices remain in the neighborhoods on which (4.4) holds,
    and so that $"dist"_(bb(T)) \( x med mod med 1 \, z \)$ remains below any prescribed positive tolerance.
    Uniform continuity of the fixed $q$ then makes
  #[#set math.equation(numbering: n => "(4.6)")
   $ \| d \( x \) - \( b_r - q \( z \) \) \| $ <eq:block-substitution>]
  uniformly as small as needed on every retained support of color $r$.
    The positive gaps preserve disjoint angular-index supports.
    Each passage preserves the independent-of-spare-coordinate modulus property and conjugation symmetry.
  ===== 4.3 The product model and its approximation. <the-product-model-and-its-approximation.>
  Put $a_r \( z \) = b_r - q \( z \)$, so $\| a_r \| lt.eq 3$.
    Denote the integer of the $i$th transmission by $L_i$. The model after $i$ transmissions is
  #[#set math.equation(numbering: n => "(4.7)")
   $ h_r^(\( i \)) \( z \) = p_r \( z \) product_(j = 1)^i f_(r \, j) \( z \) \, wide f_(r \, j) \( z \) = 1 +
     2 lambda "Re" { a_r \( z \) "e" \( - L_j z \) } . $ <eq:block-model>]
  All factors are positive, and $f_(r \, j) lt.eq M = 1 + 6 lambda < 2$.
    Let $g_r^(\( i \))$ be the actual densities after these pairs, with $g_r^(\( 0 \))$ the anchor densities.
    The refresh–transmit lemma, including the substitution (4.6), allows
  $ sum_r parallel g_r^(\( i \)) - g_r^(\( i - 1 \)) f_(r \, i) parallel_1 < eta_i \, wide
    sum_r parallel g_r^(\( 0 \)) - p_r parallel_1 < eta_0 . $
  Indeed the substitution costs at most $2 gamma omega sum_r integral
    g_r^(\( i - 1 \))$ if its uniform error is $omega$; the remaining error is freely adjustable.
    We may first choose the movement tolerance small enough for all the finitely many $eta_i$,
    and then implement each pair on its actual finite input. Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ E_i := sum_r parallel g_r^(\( i \)) - h_r^(\( i \)) parallel_1 lt.eq M E_(i - 1) + eta_i \, wide E_n lt.eq
     M^n eta_0 + sum_(i = 1)^n M^(n - i) eta_i . $ <eq:block-error-propagation>]
  For any prescribed $e_0 > 0$, it suffices to choose every $eta_i <
    e_0 \/ \( \( n + 1 \) M^n \)$ to obtain $E_n < e_0$. All quantities in this accuracy requirement were fixed
    before the anchor. Even if $lambda$ is extremely small and $n$ and $M^n$ are extremely large,
    they are finite known numbers.
  The frequencies $L_i$ remain free to exceed arbitrary successive lower bounds.
    In particular, Lemma 10 can be applied to any finite list of Laurent polynomials whose coefficient functions
    depend only on the pre-block data
  #[#set math.equation(numbering: n => "(4.9)")
   $ p_r \, med t_r \, med q \, med A \, med b_r \, med n \, med lambda . $ <eq:block-fixed-data>]
  The actual packets depend on previous choices, but appear only in (4.8), not in this fixed coefficient list.
    At the $i$th pair, first choose its refresh and all its transmission data preceding the passage integer;
    then choose $L_i$ large enough for both the physical construction and the phase-test lower bound.
    Thus the averaging and the construction impose compatible lower bounds on the same integer.
  ===== 4.4 The square-root integral. <the-square-root-integral.>
  Introduce independent Haar phases $Z_1 \, dots.h \, Z_n$ solely for computing the product-torus averages in
    Lemma 10. At each fixed $z$ put
  $ H_r = product_(i = 1)^n \[ 1 + lambda \( a_r overline(Z_i) + overline(a_r) Z_i \) \] \, wide R = sum_r t_r H_r . $
  The following pointwise calculations are on ${ p > 0 }$; all their integrands are multiplied by $p_r$ or
    $sqrt(p)$ and are extended by zero on its complement. We have
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) H_r = 1 \, wide bb(E) \( H_r H_s \) = \( 1 + 2 lambda^2 "Re" \( a_r overline(a_s) \) \)^n \, wide
     bb(E) R = 1 . $ <eq:block-second-moment-identity>]
  For real $y$ and integer $n gt.eq 1$, the binomial expansion gives
  $ \| \( 1 + y \)^n - 1 - n y \| lt.eq sum_(j = 2)^n frac(\( n \| y \| \)^j, j !) lt.eq
    frac(\( n \| y \| \)^2, 2) exp \( n \| y \| \) . $
  Apply this with $y = 2 lambda^2 "Re" \( a_r overline(a_s) \)$; then $n \| y \| lt.eq 18 delta$.
    Since $sum_r t_r = 1$, the sum of the linear terms in (4.10) is $2 n lambda^2 \| sum_r t_r a_r \|^2$. Therefore
  #[#set math.equation(numbering: n => "(4.11)")
   $ bb(E) \( R - 1 \)^2 lt.eq 2 delta \| beta - q \|^2 + 162 e^(18 delta) delta^2 . $ <eq:block-second-moment-bound>]
  This bound is uniform in the number of colors and in all the later geometric parameters.
  For every $x gt.eq 0$,
  #[#set math.equation(numbering: n => "(4.12)")
   $ sqrt(x) gt.eq 1 + frac(x - 1, 2) - \( x - 1 \)^2 . $ <eq:block-square-root-bound>]
  In fact, on setting $t = sqrt(x)$, the difference between the two sides equals
    $\( t - 1 \)^2 \( t^2 + 2 t + 1 \/ 2 \)$. Multiplying (4.12) by $sqrt(p)$,
    taking the independent-phase expectation, and using (4.3) and (4.11) shows that the averaged polynomial lower
    bound is at least
  $ integral_(bb(T)) sqrt(p) thin thin upright(d) z - 2 delta^2 -
    162 e^(18 delta) delta^2 integral_(bb(T)) sqrt(p) thin thin upright(d) z gt.eq
    integral_(bb(T)) sqrt(p) thin thin upright(d) z - 300 delta^2 . $
  Here $integral sqrt(p) lt.eq sqrt(2)$ and $delta lt.eq 1 \/ 100$ were used.
  The expression
  $ sqrt(p) thin \[ 1 + \( R - 1 \) \/ 2 - \( R - 1 \)^2 \] $
  is a Laurent polynomial in the phases with fixed integrable coefficients.
    Lemma 10 therefore transfers this lower bound, up to any prescribed error, to the diagonal phases $Z_i =
    "e" \( L_i z \)$. On that diagonal $p R = sum_r h_r^(\( n \))$.
    There is no need to apply the lemma to $sqrt(R)$ itself. Finally, for nonnegative densities $g \,
    h$ on the unit circle,
  #[#set math.equation(numbering: n => "(4.13)")
   $ lr(|integral_(bb(T)) sqrt(g) - integral_(bb(T)) sqrt(h)|) lt.eq (integral_(bb(T)) \| g - h \|)^(1 \/ 2) \,
     $ <eq:block-density-hellinger-error>]
  by $\( sqrt(g) - sqrt(h) \)^2 lt.eq \| g - h \|$ and Cauchy–Schwarz.
    Thus the actual output density $p^(upright("out")) = sum_r g_r^(\( n \))$ satisfies,
    for any chosen $nu > 0$ and sufficiently accurate construction,
  #[#set math.equation(numbering: n => "(4.14)")
   $ integral_(bb(T)) sqrt(p^(upright("out"))) thin thin upright(d) z gt.eq
     integral_(bb(T)) sqrt(p) thin thin upright(d) z - 300 delta^2 - nu . $ <eq:block-hellinger-step>]
  ===== 4.5 Prediction and a previous estimator. <prediction-and-a-previous-estimator.>
  With the same formal phases, put
  $ D = q + frac(1, n lambda) sum_(i = 1)^n Z_i . $
  For a fixed color $r$ and fixed $z$, $H_r$ is a positive probability density on the product phase torus,
    and under this density the phases remain independent. Direct integration of one factor gives
  $ bb(E)_(H_r) Z_i = lambda a_r \, wide bb(E)_(H_r) \| Z_i - lambda a_r \|^2 = 1 - lambda^2 \| a_r \|^2 . $
  Consequently
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(E)_(H_r) D = b_r \, wide bb(E)_(H_r) \| D - b_r \|^2 = frac(1 - lambda^2 \| a_r \|^2, n lambda^2) lt.eq
     2 / delta . $ <eq:block-estimator-moments>]
  For the arbitrary fixed bounded previous estimator $A$, this means that the cross term against $A -
    k b_r$ vanishes #emph[at each $z$]:
  $ bb(E)_(H_r) \| A + D - \( k + 1 \) b_r \|^2 = \| A - k b_r \|^2 + bb(E)_(H_r) \| D - b_r \|^2 . $
  After multiplying by $p_r$, summing, and integrating, the increase in this mean square is at most $4 \/ delta$.
  The expression
  $ sum_r p_r H_r \| A + q + \( n lambda \)^(- 1) sum_i Z_i - \( k + 1 \) b_r \|^2 $
  is another finite Laurent polynomial with the fixed integrable coefficients in (4.9).
    Apply Lemma 10 to it simultaneously with the preceding square-root lower-bound test. Write
  #[#set math.equation(numbering: n => "(4.16)")
   $ D \( z \) = q \( z \) + frac(1, n lambda) sum_(i = 1)^n "e" \( L_i z \) $ <eq:block-diagonal-estimator>]
  for the resulting actual multiplier. Its norm is bounded by $2 + 1 \/ lambda$,
    independently of the choices of $L_i$. In passing from model to actual color densities,
    the error in the prediction integral is at most $W E_n$, where
  #[#set math.equation(numbering: n => "(4.17)")
   $ W = \( parallel A parallel_oo + 2 + 1 \/ lambda + k + 1 \)^2 . $ <eq:block-estimator-error-weight>]
  This finite number is known before choosing the anchor accuracy or any transmission frequencies. For example, choose
  $ e_0 < min { \( nu \/ 4 \)^2 \, nu \/ \( 4 W \) } \, $
  and make the two phase-test errors less than $nu \/ 2$. Together with (4.8) this proves
  #[#set math.equation(numbering: n => "(4.18)")
   $ sum_r integral_(bb(T)) p_r^(upright("out")) \| A + D - \( k + 1 \) b_r \|^2 thin thin upright(d) z lt.eq
     sum_r integral_(bb(T)) p_r \| A - k b_r \|^2 thin thin upright(d) z + 4 / delta + nu \,
     $ <eq:block-prediction-step>]
  simultaneously with (4.14). The same $e_0$ and support accuracies can be imposed before the anchor.
    Thus a small strength entails a more demanding finite accuracy requirement, without a circular parameter choice.
  ===== 4.6 Iteration of blocks. <iteration-of-blocks.>
  All color vectors can be transported with an arbitrarily small sum of physical norm errors at every passage.
    Reserve a total such budget smaller than
  $ min { epsilon \, sqrt(2) - sqrt(3 \/ 2) } . $
  Since the sum of the color errors bounds the error of their sum,
    all intermediate packet sums then have squared norm less than $2$.
    This supplies the mass bound used above at every step, with room to spare.
    Smooth map and inverse errors can likewise be apportioned among the finitely many blocks and,
    after $n$ is chosen in a block, among its $2 n + 1$ passages.
    Choosing a basic neighborhood specified by finitely many smooth norms inside the requested neighborhood makes
    this allocation explicit. Every passage may also make the new excluded arc arbitrarily small;
    apply this in particular at the last passage.
  Set $nu lt.eq delta^2$ in each block. Start with $A_0 = 0$, and let $A_(k + 1) = A_k +
    D_(k + 1)$ after block $k + 1$. At the beginning of each new block choose a #emph[new] $q$ from that block’s
    actual input densities. That $q$ is then held fixed throughout its block.
    The band function, sieve modulus, strength, and length may all change from block to block.
    The estimates depend only on $\| b_r \| lt.eq 1$, $\| q \| lt.eq 2$, the mass bound $2$, and (4.5);
    they require no uniform lower bound for the strengths and no uniform derivative bound for the successive
    centering functions.
  After $K$ blocks, telescoping (4.14) and (4.18) gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ integral_(bb(T)) sqrt(p^(\( K \))) thin thin upright(d) z & gt.eq
     integral_(bb(T)) sqrt(p^(\( 0 \))) thin thin upright(d) z - 400 K delta^2 \,\
sum_r integral_(bb(T)) p_r^(\( K \)) \| A_K \/ K - b_r \|^2 thin thin upright(d) z & lt.eq
  frac(5, K delta) . $ <eq:block-total-hellinger>]
  For the second estimate the initial error is zero, and $4 \/ delta + delta^2 lt.eq 5 \/ delta$.
    Given the desired prediction tolerance $epsilon$, first choose $delta > 0$ sufficiently small and then put
  $ K = ⌈frac(10, epsilon^2 delta)⌉ . $
  We can require simultaneously $delta lt.eq 1 \/ 100$ and
  $ 400 (frac(10 delta, epsilon^2) + delta^2) < tau . $
  Then $K delta$ is large enough for (4.19), and $K delta^2$ is small enough for (4.19).
    These choices precede all blocks and do not depend on their future strengths or lengths.
  Set $Psi = A_K \/ K$. Disjoint angular-index supports make all different color cyclic subspaces orthogonal,
    so the spectral density formula gives exactly
  $ ∥sum_r b_r F_r^(\( K \)) - Psi \( U_(S^(\( K \))) \) sum_r F_r^(\( K \))∥_2^2 =
    sum_r integral_(bb(T)) p_r^(\( K \)) \| b_r - Psi \|^2 thin thin upright(d) z . $
  This proves the required norm estimate. Every $D$ in (4.16) is smooth and has conjugation symmetry,
    hence so does $Psi$. Restoring the original scale of the tags proves the proposition in its stated form. ◻
]

== 5 Preparation, whitening, and the smooth limit <sec:completion>

The finite prediction result encodes a target observable in a packet sum while retaining nearly flat total
  spectral density. We prepare arbitrary observables for that result,
  whiten the resulting vector to exactly flat density, and diagonalize the stages to obtain a smooth map whose one
  orbit is complete.

All vector comparisons in this section take place in the fixed physical space $L^2 \( bb(T)^3 \)$,
  even when intermediate coordinates change. A neighborhood of a diffeomorphism will mean a neighborhood of the
  pair consisting of the map and its inverse in the $C^oo$ topology. For a unitary $U$, write

$ cal(C) \( U \, f \) = overline("span" { U^n f : n in bb(Z) }) . $

We use the packet spectral calculus from Section 2: for a measurable function $alpha$ of the additive spectral
  variable $z$, the coefficient of $alpha \( U_S \) F$ at angular index $m$ is
  $alpha \( m phi.alt \( u \) med mod med 1 \) A_m \( u \, a \)$.
  The notation is used only when the resulting vector has finite $L^2$ norm.

#thm([Lemma 5.1.])[
  (A flat vector).  #emph[For every intermediate twist and every good arc $I$,
    there is a real centered vector $v$ of spectral density $1$,
    using two nonzero angular indices and coefficients supported in a compact subinterval of $I$.]
] <lem:flat-vector>

#proof[
  Choose a positive integer $m$ and $u_0 < u_1$ in $I$ such that $m \( phi.alt \( u_1 \) - phi.alt \( u_0 \) \) =
    1$. This is possible by first choosing a compact interval on which $phi.alt$ increases and then making $m$
    large. Put
  $ A \( u \) = upright(bold(1))_(\[ u_0 \, u_1 \]) \( u \) sqrt(frac(\| m phi.alt' \( u \) \|, 2)) \, wide
    v \( theta \, u \, a \) = A \( u \) "e" \( m theta \) + A \( u \) "e" \( - m theta \) . $
  The pushforward of $\| A \( u \) \|^2 thin upright(d) u thin thin upright(d) a$ by each of $plus.minus m
    phi.alt \( u \)$ modulo one is $1 / 2 thin upright(d) z$.
    The two angular modes are orthogonal, so the spectral density of $v$ is $1$. The vector is real and centered.
    Its endpoint discontinuities are harmless: no smoothness is required of the vector. ◻
]

We call a pair $\( S \, f \)$ admissible if $S$ is an intermediate twist in smooth volume-preserving coordinates,
  with good arc $I$, and $f$ is real, has spectral density $1$,
  and has finitely many nonzero angular modes with $L^2$ coefficients supported in a compact subset of $I times
  bb(T)$. In particular, $f$ is centered and has norm one.

#thm([Proposition 5.2.])[
  (One stage).  #emph[Let $\( S \, f \)$ be admissible, let $h$ be a real smooth function in physical coordinates
    with $integral h = 0$ and $parallel h parallel_oo lt.eq 1$, and let $eta \, rho \, tau > 0$.
    In every prescribed neighborhood of $S$ there is an admissible pair $\( S' \, f' \)$, with good arc $I'$,
    and a finite Laurent polynomial $P$ such that
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel f' - f parallel_2 < tau \, wide \| bb(T) \\ I' \| < rho \, wide parallel h -
   P \( U_(S') \) f' parallel_2 < \| bb(T) \\ I \|^(1 \/ 2) + eta . $ <eq:stage-conclusion>]

]
] <prop:stage>

#proof[
  We first prepare smooth packets for $f$ and $h$, then put constant tags on disjoint packets,
    and finally use Proposition 9. Every accuracy appearing below may be made arbitrarily small after the finite
    data on which it depends have been fixed.
  At a fixed map we use the density estimate (2.4), which also applies to the nonsmooth $L^2$ coefficients of an
    admissible vector. Across a passage, density preservation instead comes from Lemma 5.
  ===== 5.1 Converting the angular averages. <converting-the-angular-averages.>
  In the current coordinates write
  $ h = h_perp + g \( u \, a \) \, wide g_0 \( a \) = integral_(bb(T)) g \( u \, a \) thin upright(d) u \, wide
    r \( u \, a \) = g \( u \, a \) - g_0 \( a \) . $
  Here $h_perp$ has zero $theta$-average, $r$ has zero $u$-average for each $a$, and $integral g_0 = 0$.
    Fourier truncation and smoothing on the good arc give a real smooth packet sum $F$ arbitrarily close to $f$.
    By (2.4), its density is arbitrarily close to $1$ in $L^1$.
  Let $beta = \| bb(T) \\ I \|$. Fiberwise Parseval gives
  $ integral_(bb(T)) \| h_perp \( theta \, u \, a \) \|^2 thin upright(d) theta lt.eq
    integral_(bb(T)) \| h \( theta \, u \, a \) \|^2 thin upright(d) theta lt.eq 1 . $
  Thus cutting $h_perp$ off smoothly inside $I$, and then retaining finitely many of its nonzero angular modes,
    loses at most $sqrt(beta) + epsilon$ in norm, for arbitrary $epsilon > 0$.
    For example, the cutoff may be chosen with $integral_(bb(T)) \( 1 - chi \)^2 thin upright(d) u < beta +
    epsilon^2$. Denote the resulting packet sum by $H_perp$. The simultaneous-list version of Lemma 5,
    stated in Remark 6, transports the $F$ and $H_perp$ lists through a common passage even when their supports
    overlap. We require density preservation only for the $F$ list; no orthogonality between the two lists is asserted.
  The next passage turns variation in the old $u$ coordinate into nonzero angular modes;
    the passage after it does the same for the old $a$ coordinate.
    There are two remaining terms, and neither will be discarded.
    Before the first passage integer $N_1$ is chosen, fix a finite nonzero $u$-Fourier truncation $r_K$ of $r$.
    Choose the new good arc in the $a$ variable and its smooth cutoff $chi_1 \( a \)$ so that replacing $r_K$ by
    $chi_1 r_K$ costs arbitrarily little. These are fixed functions of the old slow variables.
    The cutoff can simultaneously lose arbitrarily little mass from the finitely many existing packets.
    Choose the broad neutral jitter and then $N_1$, as in Lemma 5. In the new coordinates
  $ \( u \, a \, b \) \, wide b = theta - H_1 \( u \) \, $
  the function $chi_1 \( a \) r_K \( u \, a \)$ is already a finite sum of nonzero angular modes supported in the
    new good arc. The former packets are transported with arbitrarily small norm error,
    and the density of the $F$ packets changes by arbitrarily little in $L^1$.
    Choose $N_1$ also so that every retained transported old index lies outside $\[ - K \, K \]$:
    its quotient by $N_1$ stays in a fixed compact set away from zero.
    This keeps the added modes of $r_K$ disjoint in angular index from the transported test packets.
    The function $g_0 \( a \)$ has been left entirely untouched.
  Now fix a finite nonzero $a$-Fourier truncation $\( g_0 \)_L$ of $g_0$.
    It has no constant term because $integral g_0 = 0$. Apply a second neutral passage to all existing packets.
    Its new coordinates are
  $ \( a \, b \, d \) \, wide d = u - H_2 \( a \) . $
  Choose its good arc and cutoff $chi_2 \( b \)$ before its final integer $N_2$.
    The term $chi_2 \( b \) \( g_0 \)_L \( a \)$ is now a smooth packet sum in nonzero angular modes.
    Its cutoff loses arbitrarily little norm and cannot introduce an angular constant.
    Choose $N_2$ also so that the transported indices lie outside $\[ - L \, L \]$,
    keeping the newly added modes disjoint from them. The existing packets are transported with arbitrarily small
    norm and density errors.
  Relabel the coordinates of the resulting twist as $\( theta \, u \, a \)$.
    For every $epsilon > 0$ the above choices therefore give real smooth packet sums $F \, H$ such that
  #[#set math.equation(numbering: n => "(5.2)")
   $ parallel F - f parallel_2 < epsilon \, wide parallel H - h parallel_2 < sqrt(beta) + epsilon \, wide
     parallel p_F - 1 parallel_1 < epsilon . $ <eq:prepared-pair>]
  The functions that needed new cutoffs were fixed before the relevant passage integer was chosen.
    In particular, this argument has not assumed uniform control of coefficients arising only after that choice.
  ===== 5.2 Constant ratios on rectangles. <constant-ratios-on-rectangles.>
  Enlarge the finite angular index list so that it contains the modes of both $F$ and $H$,
    and write their coefficients as $F_m \, H_m$. For almost every sufficiently small real $t$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral_({ F_m + t H_m = 0 }) \| H_m \|^2 thin upright(d) u thin thin upright(d) a = 0 quad
     upright("for every ") m . $ <eq:ratio-null-set>]
  To see this, at a point where $H_m eq.not 0$ at most one real $t$ solves $F_m + t H_m = 0$;
    Fubini applied to $\| H_m \|^2 thin upright(d) u thin thin upright(d) a thin thin upright(d)
    t$ proves the assertion. There are only finitely many indices.
    Replace $F$ by $F + t H$ with such a sufficiently small real $t$.
    Its norm and density changes are arbitrarily small by (2.4), and reality is preserved.
  Define $R_m = H_m \/ F_m$ where $F_m eq.not 0$, and zero otherwise.
    In view of (5.3), $H_m = R_m F_m$ almost everywhere. With $thin upright(d) nu_m = \| F_m \|^2 thin upright(d)
    u thin thin upright(d) a$, one has $integral \| R_m \|^2 thin upright(d) nu_m = parallel H_m parallel_2^2$.
    Truncating $R_m$ to a bounded function therefore changes $R_m F_m$ arbitrarily little in $L^2$.
    Finite rectangular step functions are dense in $L^2 \( nu_m \)$:
    continuous functions are dense for this finite measure, and uniform continuity approximates a continuous
    function by a fine rectangular grid. Grid boundaries have $nu_m$-measure zero,
    since $nu_m$ is absolutely continuous.
  Approximate each bounded ratio by such a step function, and replace the indicators of the finitely many grid
    rectangles by smooth interior cutoffs. Trim enough to obtain positive gaps between distinct retained
    rectangles, but lose arbitrarily little in both the $F$ norm and the tagged norm.
    This is possible after the finitely many step values are known.
    Where a ratio has been truncated, a zero step value is allowed;
    we do not need to remove the corresponding $F$ mass. Performing the construction at positive indices and
    reflecting it at negative indices gives packets $F_r$ and constants $b_r$ with conjugate symmetry, such that
  $ F^(upright("tag")) = sum_r F_r quad upright("approximates ") f \, wide H^(upright("tag")) = sum_r b_r F_r quad
    upright("approximates ") h $
  with the errors in (5.2), up to arbitrarily small additions.
    Different rectangles in $\( m \, u \, a \)$ are disjoint with gaps; each is its own color.
    The density of $F^(upright("tag"))$ remains arbitrarily close to $1$ in $L^1$. The number
  $ M = max #scale(x: 120%, y: 120%)[\(] 1 \, max_r \| b_r \| #scale(x: 120%, y: 120%)[\)] $
  is finite. All subsequent approximation errors for tagged vectors are chosen after $M$ is known.
  ===== 5.3 Separation by angular index alone. <separation-by-angular-index-alone.>
  Two further neutral passages supply exactly the hypotheses of Proposition 9. Here are the support details.
    Write the single old angular index of rectangle $r$ as $m_r$, and its compact coefficient support as $K_r$.
    Choose $c$ so that different $m_r$ have separated ranges, and form
  $ E_r = { \( m_r \( c + phi.alt \( u \) \) \, a \) : \( u \, a \) in K_r } . $
  The compact sets $E_r$ are pairwise disjoint: for a fixed $m_r$ the map $\( u \, a \)
    mapsto \( m_r \( c + phi.alt \( u \) \) \, a \)$ is injective, and different indices were separated by $c$.
    Choose smooth cutoffs $xi_r \( s \, a \)$ supported in disjoint neighborhoods of these sets and equal to one
    near them. On the first passage retain the exact coefficients
  #[#set math.equation(numbering: n => "(5.4)")
   $ C_(j \, r) \( a \) = chi \( a \) xi_r \( j \/ N \, a \) integral_(bb(T)) A_r \( u \, a \)
     "e" \( m_r H \( u \) - j u \) thin upright(d) u . $ <eq:first-separation>]
  Here $chi$ is the new good-arc cutoff; its loss was made small before choosing the broad neutral jitter and $N$.
    Lemma 2 shows that the support restrictions delete arbitrarily little norm as $N$ increases.
    There are finitely many retained $j$, all nonzero. In coordinates $\( u \, a \, b \)$ the resulting packets are
  $ C_(j \, r) \( a \) "e" \( j u \) "e" \( m_r b \) . $
  Their moduli are independent of the new spare coordinate $b$.
    Different old indices cannot share $j$; at a shared $j$, distinct colors have disjoint compact $a$ supports
    with positive gaps.
  Fix this finite output before making the second passage. Choose its $c_2$ to separate the ranges belonging to
    distinct $j$. For each fixed $j$, strict monotonicity of the current speed $sigma$ on its good arc makes the
    compact sets
  $ Q_(j \, r) = { j \( c_2 + sigma \( a \) \) : a in "supp" C_(j \, r) } $
  disjoint as $r$ varies. Thus all nonempty $Q_(j \, r)$ have disjoint open neighborhoods.
    Restrict the second-passage coefficient at new index $k$ by a smooth cutoff of $k \/
    N_2$ supported in its designated neighborhood and equal to one near $Q_(j \, r)$.
    Taking $N_2$ last makes the deleted norm arbitrarily small,
    while the retained finite $k$-index sets are #emph[exactly] disjoint for distinct pairs $\( j \, r \)$.
    An individual output term has the form
  $ B_(k \, j \, r) \( b \) "e" \( k a \) "e" \( j d \) \, wide d = u - H_2 \( a \) \, $
  so its modulus is independent of the final spare coordinate $d$.
    No interference can spoil this property, because different pairs have disjoint final index sets.
  Every integral and cutoff used here commutes with the constant tag $b_r$.
    Consequently, if the sum of the individual color transport errors is less than $epsilon \/ \( 1 + M \)$,
    both the untagged and the tagged physical errors are less than $epsilon$.
    Neutral density preservation and (2.4) keep the total density arbitrarily close to $1$.
    At this point the packet colors are disjoint in angular indices,
    their moduli are independent of the spare coordinate, and their mass can be required to be at most $3 \/ 2$.
  ===== 5.4 Prediction and whitening. <prediction-and-whitening.>
  Apply Proposition 9 to the tags $b_r \/ M$, with prediction tolerance divided by $M$.
    Its physical transport errors are likewise chosen with the factor $M$ included.
    Write $G$ for the final real packet sum, $p$ for its density,
    and $D \( U \) G$ for the resulting approximation to the tagged vector, with the factor $M$ restored.
    Here $U$ is the Koopman operator of the final intermediate map. We can ensure
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel G - f parallel_2 arrow.r 0 \, wide parallel h - D \( U \) G parallel_2 < sqrt(beta) + eta \/ 2 \,
     wide integral_(bb(T)) sqrt(p) thin thin upright(d) z arrow.r 1 $ <eq:prediction-ready>]
  as the preparation and prediction tolerances tend to zero. For the last assertion, if the input density is $p_0$, then
  $ lr(|integral sqrt(p_0) - 1|) lt.eq parallel sqrt(p_0) - 1 parallel_2 lt.eq parallel p_0 - 1 parallel_1^(1 \/ 2) \, $
  and Proposition 9 gives an arbitrarily small loss in $integral sqrt(p)$.
    Its upper limit is at most one by $integral sqrt(p) lt.eq parallel G parallel_2$ and $parallel G -
    f parallel_2 arrow.r 0$.
  Reality implies $p \( - z \) = p \( z \)$ almost everywhere.
    Set $E = { p = 0 }$, choose the flat real vector $v$ of Lemma 11 for this last map, and define
  #[#set math.equation(numbering: n => "(5.6)")
   $ f' = (upright(bold(1))_(E^c) / sqrt(p)) \( U \) G + upright(bold(1))_E \( U \) v . $ <eq:whitening>]
  The first term is well defined in $L^2$, with squared norm $\| E^c \|$.
    The terms have disjoint spectral supports and densities $upright(bold(1))_(E^c)$ and $upright(bold(1))_E$,
    respectively. Indeed, $upright(bold(1))_E \( U \) G = 0$, even if $v$ uses some of the same angular modes.
    The total density of $f'$ is exactly one. Both multipliers preserve reality, nonzero angular indices,
    and compact support in the good arc. Hence the resulting pair is admissible.
    Directly, including the contribution from $E$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ parallel f' - G parallel_2^2 = integral_(bb(T)) \( sqrt(p) - 1 \)^2 thin upright(d) z =
     parallel G parallel_2^2 + 1 - 2 integral_(bb(T)) sqrt(p) thin thin upright(d) z . $ <eq:whitening-distance>]
  This tends to zero by (5.5), and therefore $parallel f' -
    f parallel_2$ can be made less than the independently specified $tau$.
  Whitening also preserves the prediction. In the measurable spectral calculus,
  $ G = \( sqrt(p) \) \( U \) f' \, wide D \( U \) G = \( D sqrt(p) \) \( U \) f' . $
  Since $f'$ has density one and $D \( U \) G in L^2$, the function $D
    sqrt(p)$ belongs to $L^2 \( bb(T) \, thin upright(d) z \)$.
    Trigonometric polynomials are dense in this space, so $D \( U \)
    G$ belongs to $cal(C) \( U \, f' \)$ and is approximated by a finite Laurent polynomial in $U$ applied to
    $f'$. Choose that approximation with error less than $eta \/ 2$.
    This proves the last inequality in (5.1); it asserts an approximation to $h$,
    not exact membership of $h$ at this finite stage.
  Finally, each neutral passage and Proposition 9 allows an arbitrarily small physical perturbation of both map
    and inverse. There are finitely many such operations here,
    so they can all be kept in the prescribed neighborhood. The last new good arc may have complement less than
    $rho$. All choices of small physical errors are made after the finite tags, cutoffs,
    and coordinate changes that affect their bounds have been fixed.
    Thus neither large tags nor large derivatives of an earlier coordinate change obstruct the arbitrary closeness
    claimed in the proposition. ◻
]

#proof[
  Choose a smooth periodic speed $phi.alt_0$ which agrees with an increasing affine function on a nonempty closed
    interval inside $\( 0 \, 1 \)$, and let $I_0$ be an open subinterval where $phi.alt'_0 > 0$.
    Start with the twist $S_0$ and its flat vector $f_0$ from Lemma 11.
    Choose a countable family of real smooth centered functions, bounded by one,
    whose real linear span is dense in real $L_0^2 \( bb(T)^3 \)$; the physical torus sines and cosines will do.
    List them as $\( h_n \)_(n gt.eq 1)$ so that each occurs infinitely often.
  We record the continuity needed to retain approximations.
    If volume-preserving maps $T_i$ and their inverses converge uniformly to $T$ and $T^(- 1)$,
    then for every fixed $k in bb(Z)$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ U_(T_i)^k g arrow.r U_T^k g quad upright("in ") L^2 quad \( g in L^2 \) . $ <eq:strong-koopman>]
  Uniform convergence of the corresponding fixed iterates follows by composition on the compact torus.
    For continuous $g$ this proves uniform convergence of the compositions; for general $g$,
    approximation by continuous functions and unitarity prove (5.8).
    Consequently, for every fixed Laurent polynomial $P$ the map
  $ \( T \, g \) mapsto P \( U_T \) g $
  is continuous into physical $L^2$ when maps and inverses have the $C^oo$ topology and vectors have the $L^2$
    topology. Explicitly, if $P \( w \) = sum_k c_k w^k$, its difference is bounded by
  $ sum_k \| c_k \| parallel g_i - g parallel_2 + sum_k \| c_k \| parallel U_(T_i)^k g - U_T^k g parallel_2 . $
  Inductively apply Proposition 12 with $h = h_n$ and $eta = 2^(- n)$, obtaining $\( S_n \, f_n \)$,
    a good arc $I_n$, and a finite Laurent polynomial $P_n$, such that
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| bb(T) \\ I_n \| < 4^(- n) \, wide parallel h_n - P_n \( U_(S_n) \) f_n parallel_2 < \|
     bb(T) \\ I_(n - 1) \|^(1 \/ 2) + 2^(- n) . $ <eq:stage-polynomial>]
  Use the arbitrary closeness in that proposition also to impose
  $ parallel f_n - f_(n - 1) parallel_2 < 2^(- n) \, wide d_k \( S_n \, S_(n - 1) \) +
    d_k \( S_n^(- 1) \, S_(n - 1)^(- 1) \) < 2^(- n) quad \( 0 lt.eq k lt.eq n \) \, $
  where $d_k$ are ambient $C^k$ sup-norm distances induced by a fixed smooth embedding of the torus.
    At the same time impose the finitely many open conditions
  #[#set math.equation(numbering: n => "(5.10)")
   $ parallel P_j \( U_(S_n) \) f_n - P_j \( U_(S_(n - 1)) \) f_(n - 1) parallel_2 < 2^(- n)
     wide \( 1 lt.eq j < n \) . $ <eq:retain-polynomial>]
  Their compatibility follows from the continuity just proved.
    No bound uniform in $j$ on the degrees or coefficients of $P_j$ is required.
  For each fixed $k$, the map and inverse sequences have summable tails in $C^k$.
    They therefore converge smoothly to maps $T$ and $R$. Uniform convergence, compactness, and $S_n S_n^(- 1) =
    S_n^(- 1) S_n = "id"$ give $T R = R T = "id"$, so $T$ is a smooth diffeomorphism with smooth inverse.
    For every continuous $g$,
  $ integral g compose T = lim_n integral g compose S_n = integral g \, $
  so normalized volume is invariant. The vectors $f_n$ converge in $L^2$ to a real centered vector $f$.
  Every completed stage has density exactly one. Combining (5.8) with $f_n arrow.r f$, for all $r \,
    s in bb(Z)$ we obtain
  #[#set math.equation(numbering: n => "(5.11)")
   $ chevron.l U_T^r f \, U_T^s f chevron.r = lim_n chevron.l U_(S_n)^r f_n \, U_(S_n)^s f_n chevron.r =
     delta_(r s) . $ <eq:limit-orthonormal>]
  The retained finite polynomials give, for every $j$,
  $ parallel h_j - P_j \( U_T \) f parallel_2 lt.eq \| bb(T) \\ I_(j - 1) \|^(1 \/ 2) + 2^(- j) +
    sum_(n > j) 2^(- n) = \| bb(T) \\ I_(j - 1) \|^(1 \/ 2) + 2^(1 - j) . $
  Along the infinitely many occurrences of any fixed test the right side tends to zero.
    Hence every test belongs to $cal(C) \( U_T \, f \)$. Their complex linear span is dense in complex
    $L_0^2 \( bb(T)^3 \)$, whereas every orbit vector is centered. Thus
  $ cal(C) \( U_T \, f \) = L_0^2 \( bb(T)^3 \) . $
  Together with (5.11), this says that the bilateral orbit of $f$ is an orthonormal basis of the entire centered
    space. With $w = "e" \( z \)$, the assignment $U_T^n f mapsto
    w^n$ extends to a unitary map onto $L^2 \( S^1 \, m \)$ intertwining $U_T$ with multiplication by $w$.
  Multiplication by $w$ has no nonzero invariant vector, since $\( w - 1 \) g \( w \) = 0$ forces $g =
    0$ almost everywhere. Consequently every $T$-invariant $L^2$ function is constant, which proves ergodicity.
    The manifold $bb(T)^3$ is compact, connected, smooth, and without boundary,
    and its normalized flat volume has strictly positive smooth density.
    These are all the properties required in Theorem 1. ◻
]

== 6 Dynamical consequences <sec:consequences>

The spectral model gives ordinary mixing directly. The passage to higher orders uses the separate multiple-mixing
  theorem; the entropy and Lyapunov conclusions do not depend on that additional input.

#thm([Corollary 6.1.])[
  #emph[For the diffeomorphism $T$ and normalized standard volume $mu$ of Theorem 1, every integer $k gt.eq
    2$ and every fixed choice of measurable sets $A_1 \, dots.h \, A_k subset.eq bb(T)^3$ satisfy
$ mu (⋂_(i = 1)^k T^(- t_i) A_i) arrow.r product_(i = 1)^k mu \( A_i \) $

 whenever $t_1 < dots.h.c < t_k$ are integers and $min_(1 lt.eq i < k) \( t_(i + 1) - t_i \) arrow.r oo$.
   Moreover, the Kolmogorov–Sinai entropy satisfies $h_mu \( T \) = 0$, and all three Lyapunov exponents of $T$,
   counted with multiplicity, vanish at $mu$-almost every point.]
] <cor:dynamical-profile>

#proof[
  Let $V : L_0^2 \( bb(T)^3 \, mu \) arrow.r L^2 \( S^1 \, m \)$ be the unitary spectral model in Theorem 1.
    For $a \, b in L_0^2 \( bb(T)^3 \, mu \)$,
  $ integral_(bb(T)^3) \( a compose T^n \) overline(b) thin upright(d) mu =
    integral_(S^1) w^n \( V a \) \( w \) overline(\( V b \) \( w \)) thin upright(d) m \( w \) arrow.r
    0 wide \( \| n \| arrow.r oo \) . $
  Indeed, $\( V a \) overline(V b) in L^1 \( m \)$ by Cauchy–Schwarz, so the limit is the Riemann–Lebesgue lemma.
    Taking centered indicators gives ordinary mixing. The map $T$ is an invertible probability-preserving
    transformation with measurable inverse, so the multiple-mixing theorem #cite(label("MultipleMixing2026"))
    Theorem 1.1 gives every order $k gt.eq 3$. Invariance shifts $t_1$ to zero and identifies its positive time
    gaps with $t_(i + 1) - t_i$; the case $k = 2$ is ordinary mixing.
  The full Koopman operator is the direct sum of the one-dimensional constants and the simple Lebesgue model on
    all of $L_0^2$, and hence has finite spectral multiplicity.
    Normalized torus volume is a Lebesgue probability space, and $T$ is a measure-preserving automorphism.
    Rokhlin’s finite-multiplicity entropy theorem #cite(label("Rokhlin1960")) §7,
    p. 13 therefore gives $h_mu \( T \) = 0$.
  The derivative and inverse derivative are bounded on the compact torus,
    so the invertible Oseledets integrability conditions hold.
    Write $lambda_1 \( x \) \, lambda_2 \( x \) \, lambda_3 \( x \)$ for the exponents repeated according to
    multiplicity at regular points. Pesin’s entropy formula, as stated and reproved by Mañé
    #cite(label("Mane1981")) p. 95, equation (2), applies to the $C^oo$ diffeomorphism and its absolutely
    continuous invariant probability $mu$. Thus
  $ 0 = h_mu \( T \) = integral_(bb(T)^3) sum_(i = 1)^3 max { lambda_i \( x \) \, 0 } thin upright(d) mu \( x \) . $
  The nonnegative integrand vanishes almost everywhere, so every exponent is nonpositive there.
    Preservation of standard volume gives $\| det D T_x \| = 1$, and at every Oseledets-regular point
  $ sum_(i = 1)^3 lambda_i \( x \) = lim_(n arrow.r oo) 1 / n log \| det D \( T^n \)_x \| = 0 . $
  The three nonpositive exponents must therefore all be zero at $mu$-almost every point. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
