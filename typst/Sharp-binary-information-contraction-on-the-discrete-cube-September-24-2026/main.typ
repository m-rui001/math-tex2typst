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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp binary-information contraction \
on the discrete cube]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The contraction theorem and its mechanism <main:section>

A one-bit summary of independent fair bits can be chosen before those bits pass through independent binary
  symmetric channels. Which summary retains the most information about the noisy observation?
  Kumar and Courtade formulated the conjecture that a single input coordinate is optimal at every noise level and
  in every dimension #cite(label("KumarCourtade2013")) #cite(label("CourtadeKumar2014")).
  We prove a sharp comparison for arbitrary randomized binary summaries,
  together with a mean-dependent bound on their instantaneous information loss.

Let $Omega_n = { - 1 \, 1 }^n$ carry uniform measure. All information is measured with natural logarithms.
  For $r in \[ - 1 \, 1 \]$, define

$ L = log 2 \, wide H \( r \) = - frac(1 + r, 2) log frac(1 + r, 2) - frac(1 - r, 2) log frac(1 - r, 2) \, wide
  psi \( r \) = L - H \( r \) \, $

with $0 log 0 = 0$. Thus $H \( r \)$ is the entropy of a sign of mean $r$.
  For a soft binary channel $u : Omega_n arrow.r \[ - 1 \, 1 \]$, define

$ I \( u \) = H \( bb(E) u \) - bb(E) H \( u \) = bb(E) psi \( u \) - psi \( bb(E) u \) . $

Let $X$ be uniform on $Omega_n$. If an auxiliary sign $U$ has conditional mean $bb(E) \[ U divides X \] =
  u \( X \)$, then $I \( u \) = I \( U \; X \)$. For $- 1 lt.eq rho lt.eq 1$, let $Y_i = X_i Z_i$,
  where the signs $Z_i$ are independent of $\( X \, U \)$ and each other, with $bb(E) Z_i = rho$.
  The noise operator is $T_rho u \( y \) = bb(E) \[ u \( X \) divides Y = y \]$.
  Thus $bb(E) \[ U divides Y \] = T_rho u \( Y \)$ and $I \( T_rho u \) = I \( U \; Y \)$.

#thm([Theorem 1.1.])[
  (Sharp soft-channel contraction).  #emph[For every finite $n gt.eq 0$, every $u :
    Omega_n arrow.r \[ - 1 \, 1 \]$, and $- 1 lt.eq rho lt.eq 1$,
#[#set math.equation(numbering: n => "(1.1)")
 $ I \( T_rho u \) lt.eq psi #h(-0.16667em) (\| rho \| thin psi^(- 1) \( I \( u \) \)) . $ <main:interpolation>]

 The inverse is the nonnegative increasing branch on $\[ 0 \, L \]$.
   For $n gt.eq 1$, every soft coordinate $u \( x \) = a x_i$, $\| a \| lt.eq 1$, attains equality.]
] <main:soft>

The parameter $psi^(- 1) \( I \( u \) \)$ is the amplitude of a fair soft coordinate with the same information as
  $u$. The theorem says that this effective amplitude contracts at least as fast as a coordinate.
  Sharpness concerns all soft channels at a given initial information;
  it does not assert that every biased Boolean source attains the bound.

#thm([Corollary 1.2.])[
  (The Boolean bound with output bias).  #emph[For every finite $n gt.eq 0$, $rho in \[ - 1 \, 1 \]$, and $f :
    Omega_n arrow.r { - 1 \, 1 }$, put $m = bb(E) f$ and $r_m = psi^(- 1) \( H \( m \) \)$. Then
#[#set math.equation(numbering: n => "(1.2)")
 $ I \( f \( X \) \; Y \) lt.eq psi \( \| rho \| r_m \) lt.eq psi \( \| rho \| \) . $ <main:bound>]

 For $n gt.eq 1$, signed coordinate functions attain the bound at $m = 0$.
   If $0 < \| m \| < 1$ and $0 < \| rho \| lt.eq 1$, the refined upper curve is strictly below the universal curve
   $psi \( \| rho \| \)$.]
] <main:ck>

For noise crossover probability $epsilon in \[ 0 \, 1 \/ 2 \]$, one has $rho = 1 - 2 epsilon$.
  Writing $h_2 \( p \) = - p log_2 p - \( 1 - p \) log_2 \( 1 - p \)$, the universal bound in bits is

$ I_2 \( f \( X \) \; Y \) lt.eq frac(psi \( rho \), L) = 1 - h_2 \( epsilon \) . $

This is the Courtade–Kumar conjecture. The refinement uses the actual entropy of the Boolean output,
  while the input distribution remains uniform.

=== 1.1 Prior work and related results <prior-work-and-related-results>

Ordentlich, Shayevitz, and Weinstein #cite(label("OrdentlichShayevitzWeinstein2016")) obtained asymptotically
  sharp high-noise bounds for balanced Boolean functions. Samorodnitsky #cite(label("Samorodnitsky2016")) proved
  the conjecture for all Boolean functions in a dimension-independent high-noise range.
  Yu’s work on $Phi$-stability and local optimality #cite(label("Yu2023")) #cite(label("Yu2026")) enlarged the
  proved range for balanced functions; the latter gives $0 lt.eq rho lt.eq 0.914$ by a computer-assisted argument.
  Javanmard and Woodruff #cite(label("JavanmardWoodruff2026")) extended Courtade and Kumar’s coordinatewise sum
  bound #cite(label("CourtadeKumar2014")) Theorem 1 from balanced functions to arbitrary output bias and refined
  high-noise entropy estimates.

Several nearby formulations clarify the role of the full noisy vector.
  Pichler, Piantanida, and Matz #cite(label("PichlerPiantanidaMatz2018")) proved coordinate optimality when the
  observation is also reduced to one Boolean output. At fixed output mean,
  Li and Médard #cite(label("LiMedard2021")) identified lexicographic optimizers at sufficiently low noise and
  related high-noise optimizers to first-level Fourier weight, in dimension-dependent ranges.
  Barnes and Özgür #cite(label("BarnesOzgur2020")) proved the equivalence of the balanced conjecture and a
  symmetrized Li–Médard moment inequality. Kindler, O’Donnell,
  and Witmer #cite(label("KindlerODonnellWitmer2016")) proved fixed-mean Gaussian and spherical analogues.
  These fixed-mean questions are distinct from attainability of the refined upper curve in Corollary 2.

Chen, Gohari, and Nair #cite(label("ChenGohariNair2025")) developed the differential approach that we use:
  prove a local entropy-production inequality, lift it by induction on the cube dimension,
  and integrate along the noise semigroup. Their approach builds on the auxiliary receiver method of Gohari and
  Nair #cite(label("GohariNair2022")). The August 2026 revision of Chen–Gohari–Nair disproves one proposed
  auxiliary inequality #cite(label("ChenGohariNair2025")) Appendix B;
  the local comparisons below are proved directly. Their symmetric optimizer is a predecessor of our
  arbitrary-mean joining problem, as explained in Section 3.

Recent preprints announce proofs of the Courtade–Kumar conjecture by several routes.
  Chen, Gohari, Javanmard, Lin, Mirrokni, Nair, and Woodruff #cite(label("ChenEtAl2026CK")) use a
  computer-assisted Bellman inequality; Ky and Tran #cite(label("KyTran2026CK")) develop entropy-production and
  spectral estimates with computer-assisted verification; Mahdavifar and
  Beirami #cite(label("MahdavifarBeirami2026CK")) use entropy flow, Fourier analysis, and bounds for pivotal sets;
  and Kramer and Saglam #cite(label("KramerSaglam2026")) prove a finite-noise bound that retains the Boolean
  output bias. The overlap with the first work extends beyond the Boolean conjecture:
  its Lemma 9.2 applies to arbitrary binary channels, and retaining the initial information when integrating its
  production bound gives Theorem 1 and Corollary 2. Our proof solves the joining problem with a common entropy
  budget and uses two capacities and common-output thinning.
  It also proves the additional mean-dependent production estimate in Theorem 3;
  we compare the two production profiles in Section 8.1.

=== 1.2 From information loss to a local joining inequality <from-information-loss-to-a-local-joining-inequality>

For an interior soft field $g : Omega_n arrow.r \( - 1 \, 1 \)$, put

#[#set math.equation(numbering: n => "(1.3)")
 $ m = bb(E) g \, wide e = bb(E) H \( g \) \, wide I \( g \) = H \( m \) - e \, wide D \( g \) =
   bb(E) \[ V \( g \) N g \] \, $ <main:functionals>]

where $V \( r \) = "atanh" r$ and

$ N = 1 / 2 sum_(i = 1)^n \( upright("Id") - upright("flip")_i \) \, wide P_t = T_(e^(- t)) = e^(- t N) . $

Here $upright("flip")_i$ flips coordinate $i$. Mean conservation and finite-dimensional differentiation give

#[#set math.equation(numbering: n => "(1.4)")
 $ frac(d, d t) I \( P_t g \) = - D \( P_t g \) . $ <main:flow-identity>]

The production of a soft coordinate $g \( x \) = r x_i$ is $r V \( r \)$.
  We therefore define its rate by $F \( psi \( r \) \) = r V \( r \)$ for $0 lt.eq
  r < 1$ and seek the inequality $D \( g \) gt.eq F \( I \( g \) \)$.
  Once this is proved, $r_t = psi^(- 1) \( I \( P_t g \) \)$ satisfies $r'_t lt.eq -
  r_t$ whenever $I \( P_t g \) > 0$. Integrating gives Theorem 1;
  Section 8 treats zero information and boundary-valued inputs.

The local-to-global program is due to Chen–Gohari–Nair #cite(label("ChenGohariNair2025")) Definition 1 and
  Theorem 2. To see the required local comparison, split the cube along one coordinate into fields $g_(+) \,
  g_(-)$ on $Omega_(n - 1)$. Their productions satisfy the exact identity

#[#set math.equation(numbering: n => "(1.5)")
 $ D \( g \) = frac(D \( g_(+) \) + D \( g_(-) \), 2) + bb(E) c \( g_(+) \, g_(-) \) \, wide c \( a \, b \) =
   frac(a - b, 4) { V \( a \) - V \( b \) } \, $ <main:energy-split>]

where the last expectation is over the remaining coordinates.
  Write $m_plus.minus = bb(E) g_plus.minus$ and $I_plus.minus = I \( g_plus.minus \)$.
  For a profile with $Phi_m \( 0 \) = 0$, the required induction step is that the joining edges pay its increase:

$ bb(E) c \( g_(+) \, g_(-) \) gt.eq Phi_m \( I \( g \) \) -
  frac(Phi_(m_(+)) \( I_(+) \) + Phi_(m_(-)) \( I_(-) \), 2) . $

The information-only choice $Phi_m \( I \) = F \( I \)$ does not satisfy the corresponding local comparison for
  every coupled pair law #cite(label("ChenGohariNair2025")) Remark 5.
  The proof must retain the mean as well as the information.

=== 1.3 Two profiles and the geometry of the joining cost <two-profiles-and-the-geometry-of-the-joining-cost>

The linear estimate $D \( g \) gt.eq 2 I \( g \)$ follows from the classical cube logarithmic Sobolev inequality
  and its entropy-dissipation consequence, within the hypercontractive framework of Bonami, Gross,
  and Beckner #cite(label("Bonami1970")) #cite(label("Gross1975")) #cite(label("Beckner1975"));
  see also Bobkov–Tetali #cite(label("BobkovTetali2006")) Example 3.7 for the modified logarithmic Sobolev
  formulation. Mrs. Gerber’s lemma #cite(label("WynerZiv1973")) contains the same scalar one-bit entropy curve,
  but its direct vector form has dimension-normalized arguments.
  The nonlinear surplus above $2 I$ is the part that needs a new local comparison.

Since $F' \( 0 \) = 2$, define

$ S \( I \) = F \( I \) - 2 I quad \( 0 lt.eq I < L \) \, wide S \( I \) = 0 quad \( I < 0 \) . $

For $\| m \| < 1$ and $0 lt.eq I < H \( m \)$, set

#[#set math.equation(numbering: n => "(1.6)")
 $ cal(B)_m \( I \) = 2 I + \( 1 - m^2 \) S #h(-0.16667em) (L - frac(H \( m \) - I, 1 - m^2)) . $ <main:profile>]

The factor $1 - m^2$ is useful because the average of the two child variance factors at means $m plus.minus
  delta$ is $1 - m^2 - delta^2$. Convexity therefore pools their surplus terms in the same form.
  Section 5 explains the two-capacity allocation behind this profile and proves its local joining inequality.
  The same two capacities occur in the Boolean finite-noise bound of Kramer and
  Saglam #cite(label("KramerSaglam2026")); that section gives the comparison.

To prove the local joining inequality for $cal(B)$, regard $\( g_(+) \( X' \) \, g_(-) \( X' \) \)$ as a coupled
  pair of random variables, where $X'$ is uniform on the remaining cube.
  We minimize the joining cost over all coupled pair laws with the same child means and average conditional
  entropy, extending $c$ by zero at the equal corners and by $+ oo$ at every other boundary pair.
  The exact optimizer has one interior pair $\( a_c \, b_c \)$ and possibly the two equal-output corners
  $\( 1 \, 1 \)$ and $\( - 1 \, - 1 \)$. Section 3 proves this description by assigning a nonnegative price to
  entropy. Section 4 proves the one-bit inequality that pays the interior pair.
  Adding either common output reduces the payment required by $cal(B)$ at least in proportion to the retained
  mass. Composing these two operations pays the full optimizer.
  Throughout this minimization, the original face entropies remain in the child profiles;
  only their average enters the cost problem.

At mean zero, $cal(B)_0 = F$, but at other means neither profile can be discarded.
  We prove local joining for their maximum,

#[#set math.equation(numbering: n => "(1.7)")
 $ hat(cal(B))_m \( I \) = max { cal(B)_m \( I \) \, F \( I \) } . $ <main:hybrid-profile>]

Two comparisons make this possible. First,

#[#set math.equation(numbering: n => "(1.8)")
 $ I gt.eq L \/ 2 quad arrow.r.double quad cal(B)_m \( I \) gt.eq F \( I \) . $ <main:threshold>]

Thus only parents below half information can require the $F$ branch.
  At such a parent, convexity at the original child states reduces the unpaid amount to $F \( I \) - F \( j \)$,
  where $j = \( I_(+) + I_(-) \) \/ 2$.

For the second comparison, reflect the output signs if necessary so that the parent mean is nonnegative.
  An optimizer with one corner then combines a core of nonnegative center with $\( 1 \, 1 \)$.
  Section 6 shows that this addition reduces the increment at least in proportion to the retained mass,
  and so the one-bit inequality pays the mixture. When both corners occur, the core is reflected,
  $\( r \, - r \)$. Holding the core and its mass fixed preserves the separation of the child means,
  their average conditional entropy, and the joining cost. We increase the common mean until one corner
  disappears, as in Figure 1. Below half information the required increment increases during this motion.
  The one-corner endpoint therefore pays the original state as well.

Section 7 combines these comparisons and performs dimension induction to prove the following strengthening of the
  scalar rate inequality.

#thm([Theorem 1.3.])[
  (Sharp soft production).  #emph[For every finite $n gt.eq 0$ and every $g : { - 1 \,
    1 }^n arrow.r \( - 1 \, 1 \)$, with $m = bb(E) g$,
#[#set math.equation(numbering: n => "(1.9)")
 $ D \( g \) gt.eq hat(cal(B))_m \( I \( g \) \) = max { cal(B)_m \( I \( g \) \) \, F \( I \( g \) \) } gt.eq
   F \( I \( g \) \) . $ <upgrade:production-bound>]

]
] <upgrade:production>

The scalar facts needed by the local comparisons are proved in Section 2.
  Section 8 integrates the production bound and compares its mean-dependent part with the profile of Chen et
  al. #cite(label("ChenEtAl2026CK")).

== 2 The scalar rate and its curvature <scalar:section>

A soft coordinate fixes the rate used throughout the proof.
  We need its convexity, two bounds on its entropy-scaled curvature, and one comparison of logarithmic slopes.
  These facts follow from a positive hyperbolic integral and two elementary moment comparisons.

All logarithms are natural. For a sign with mean $r in \[ - 1 \, 1 \]$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ L = log 2 \, wide psi \( r \) = frac(\( 1 + r \) log \( 1 + r \) + \( 1 - r \) log \( 1 - r \), 2) \, wide
   H \( r \) = L - psi \( r \) \, $ <scalar:entropy-definitions>]

with $0 log 0 = 0$. Thus $H$ is binary entropy and $psi$ is its gap from the entropy of a fair sign.
  Write $V \( r \) = "atanh" r$ for $- 1 < r < 1$. Then

#[#set math.equation(numbering: n => "(2.2)")
 $ psi' \( r \) = V \( r \) \, wide psi'' \( r \) = frac(1, 1 - r^2) \, wide H' \( r \) = -
   V \( r \) . $ <scalar:entropy-derivatives>]

The restriction of $psi$ to $\[ 0 \, 1 \)$ increases bijectively onto $\[ 0 \, L \)$.
  Define the production rate and its surplus over the linear rate by

#[#set math.equation(numbering: n => "(2.3)")
 $ F \( psi \( r \) \) = r V \( r \) wide \( 0 lt.eq r < 1 \) \, $ <scalar:profile-definitions>]

#[#set math.equation(numbering: n => "(2.4)")
 $ S \( I \) = cases(delim: "{", F \( I \) - 2 I \, & 0 lt.eq I < L \,, 0 \, & I < 0 .) $ <scalar:surplus-definition>]

#thm([Lemma 2.1.])[
  (Elementary entropy bounds).  #emph[For $\| r \| lt.eq 1$,
#[#set math.equation(numbering: n => "(2.5)")
 $ r^2 / 2 lt.eq psi \( r \) lt.eq L r^2 \, wide H \( r \) gt.eq L \( 1 - r^2 \) . $ <scalar:entropy-quadratic-bounds>]

 The quotient $psi \( r \) \/ r^2$ is strictly increasing for $0 < r < 1$. Moreover,
#[#set math.equation(numbering: n => "(2.6)")
 $ 2 / 3 < L < 25 / 36 < 7 / 10 \, wide 1 / 2 < M := frac(4 L^2, 3) < 2 / 3 . $ <scalar:logarithm-constants>]

]
] <scalar:entropy-bounds>

#proof[
  Integrating the geometric series for $psi''$ twice gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ psi \( r \) = sum_(n gt.eq 1) frac(r^(2 n), 2 n \( 2 n - 1 \)) . $ <scalar:entropy-series>]
  The first term gives the lower bound. The coefficients are positive and sum to $psi \( 1 \) = L$,
    so $r^(2 n) lt.eq r^2$ gives the upper bound. The same series proves the quotient’s strict increase.
    Subtracting from $L$ gives the bound for $H$. Finally, $L = 2 "atanh" \( 1 \/ 3 \)$ implies
  $ 2 / 3 < L = 2 / 3 + 2 sum_(n gt.eq 1) frac(3^(- \( 2 n + 1 \)), 2 n + 1) < 2 / 3 + 2 /
    3 sum_(n gt.eq 1) 3^(- \( 2 n + 1 \)) = 25 / 36 . $
  Hence $16 \/ 27 < M < 625 \/ 972 < 2 \/ 3$, as required. ◻
]

#thm([Lemma 2.2.])[
  (Convexity of the rate and surplus).  #emph[The function $F$ is smooth on $\[ 0 \, L \)$,
    with right derivatives at zero, and
#[#set math.equation(numbering: n => "(2.8)")
 $ F \( 0 \) = 0 \, wide F' \( 0 \) = 2 \, wide F'' \( 0 \) = 4 / 3 \, wide F'' \( I \) gt.eq 4 / 3 \, wide
   F''' \( I \) gt.eq 0 . $ <scalar:production-convexity>]

 The zero-extended surplus $S$ is nonnegative, nondecreasing, convex, and $C^1$ on $\( - oo \, L \)$,
   with $S \( 0 \) = S' \( 0 \) = 0$. It is not $C^2$ at zero.]
] <scalar:profile-convexity>

#proof[
  Put $r = tanh v$ and $I = psi \( r \)$. Direct differentiation gives
  $ I = v tanh v - log cosh v \, wide frac(d I, d v) = v "sech"^2 v \, wide F' \( I \) = 1 +
    frac(sinh \( 2 v \), 2 v) . $
  For $v > 0$, another differentiation yields
  #[#set math.equation(numbering: n => "(2.9)")
   $ F'' \( psi \( r \) \) & = frac(\( 1 + r^2 \) V \( r \) - r, \( 1 - r^2 \)^2 V \( r \)^3)\
 & = cosh^2 v thin A \( v \) \, wide A \( v \) := 2 integral_0^1 \( 1 - s^2 \) cosh \( 2 v s \) thin d s .
   $ <scalar:production-second-derivative>]
  Indeed,
    integration by parts evaluates the integral as $\[ 2 v cosh \( 2 v \) - sinh \( 2 v \) \] \/ \( 2 v^3 \)$.
    The integral gives $A \( v \) gt.eq A \( 0 \) = 4 \/ 3$ and $A' \( v \) > 0$ for $v > 0$.
    Thus $F'' gt.eq 4 \/ 3$ and $F''' > 0$ for $I > 0$. Both $A \( v \)$ and $I$ are analytic in $v^2$, and $I =
    v^2 \/ 2 + O \( v^4 \)$, so the inverse function theorem gives smooth extension to $I = 0$.
    Continuity gives $F''' \( 0 \) gt.eq 0$. The identities $S \( 0 \) = S' \( 0 \) = 0$ and $S'' =
    F'' > 0$ for $I > 0$ prove the assertions about its zero extension.
    Its second derivative jumps from $0$ to $4 \/ 3$ at zero. ◻
]

#thm([Lemma 2.3.])[
  (Growth of the curvature).  #emph[The function $I mapsto e^(- 2 I)
    F'' \( I \)$ is strictly increasing on $\[ 0 \, L \)$. For $I > 0$ it satisfies
$ frac(F''' \( I \), F'' \( I \)) > 2 . $

]
] <scalar:curvature-growth>

#proof[
  Using (2.9), for $v > 0$,
  $ frac(d, d I) log F'' \( I \) = frac(sinh \( 2 v \), v) + frac(cosh^2 v, v) frac(A' \( v \), A \( v \)) > 2 . $
  Here $A' \( v \) gt.eq 0$ and $sinh \( 2 v \) > 2 v$. Continuity at zero extends the asserted strict increase to
    $\[ 0 \, L \)$. ◻
]

#thm([Lemma 2.4.])[
  (Scaled entropy curvature).  #emph[For $0 < h lt.eq L$, put
#[#set math.equation(numbering: n => "(2.10)")
 $ P \( h \) = h^2 F'' \( L - h \) . $ <scalar:scaled-curvature-definition>]

 Then
#[#set math.equation(numbering: n => "(2.11)")
 $ 1 / 2 lt.eq P \( h \) lt.eq M = frac(4 L^2, 3) \, wide P \( L \) = M . $ <scalar:scaled-curvature-range>]

]
] <scalar:scaled-curvature>

#proof[
  Write $h = H \( r \)$, $t = r^2$, and $x = V \( r \) \/ r$, with $x = 1$ at $r = 0$. Elementary integration gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ x = integral_0^1 frac(d u, 1 - t u^2) \, wide frac(H \( r \), 1 - t) =
     integral_0^1 frac(d u, \( 1 + u \) \( 1 - t u^2 \)) . $ <scalar:entropy-moment-integrals>]
  For the second identity, use the partial fraction identity
  $ frac(1, \( 1 + u \) \( 1 - t u^2 \)) = frac(1, 1 - t) (frac(1, 1 + u) + frac(t \( u - 1 \), 1 - t u^2)) $
  and $H \( r \) = L - 1 / 2 log \( 1 - r^2 \) - r V \( r \)$.
    Let $mu_t$ have density $\[ x \( 1 - t u^2 \) \]^(- 1)$ on $\[ 0 \, 1 \]$, and set
  $ b_t = bb(E)_(mu_t) frac(1, 1 + u) \, wide n_t = bb(E)_(mu_t) u^2 . $
  Then $b_t = H \( r \) \/ \[ \( 1 - t \) x \]$ and $n_t = \( V \( r \) - r \) \/ \( r^2 V \( r \) \)$,
    with continuous values at zero. Substitution into (2.9) gives
  $ P \( H \( r \) \) = b_t^2 \( 1 + n_t \) . $
  Jensen’s inequality and Cauchy–Schwarz imply
  $ b_t gt.eq frac(1, 1 + bb(E)_(mu_t) u) gt.eq frac(1, 1 + sqrt(n_t)) \, wide P \( H \( r \) \) gt.eq
    frac(1 + n_t, \( 1 + sqrt(n_t) \)^2) gt.eq 1 / 2 . $
  For the upper bound, a density proportional to $w \( u \) \/ \( 1 - t u^2 \)$, with $w$ independent of $t$, satisfies
  #[#set math.equation(numbering: n => "(2.13)")
   $ frac(d, d t) bb(E)_t f \( u \) = "Cov"_t (f \( u \) \, frac(u^2, 1 - t u^2)) .
     $ <scalar:covariance-differentiation>]
  Oppositely monotone functions have nonpositive covariance, since for independent copies $U \, U'$,
  $ 2 "Cov" \( f \( U \) \, g \( U \) \) = bb(E) \[ \( f \( U \) - f \( U' \) \) \( g \( U \) - g \( U' \) \) \] . $
  Applying this with $w = 1$ shows $1 \/ 2 lt.eq b_t lt.eq b_0 = L$.
    The same identity shows that $n_t$ increases, so we must control its growth together with the decrease of
    $b_t$. Compare $b_t - 1 \/ 2$ with $1 - n_t$ by reweighting $mu_t$ by $1 - u^2$ to obtain $nu_t$. The identity
  $ beta_t := frac(b_t - 1 \/ 2, 1 - n_t) = 1 / 2 bb(E)_(nu_t) \( 1 + u \)^(- 2) \, wide d nu_t \( u \) med
    prop med frac(1 - u^2, 1 - t u^2) thin d u $
  and (2.13) now give $0 < beta_t lt.eq beta_0 = 3 / 2 \( L - 1 / 2 \)$. Consequently
  $ 1 + n_t lt.eq 2 - frac(b_t - 1 \/ 2, beta_0) \, $
  and hence
  $ P \( H \( r \) \) lt.eq f \( b_t \) \, wide f \( b \) = b^2 [2 - frac(b - 1 \/ 2, beta_0)] . $
  For $1 \/ 2 lt.eq b lt.eq L$,
  $ f' \( b \) = b / beta_0 \( 4 beta_0 + 1 - 3 b \) gt.eq b / beta_0 \( 3 L - 2 \) > 0 . $
  Thus $P \( H \( r \) \) lt.eq f \( L \) = 4 L^2 \/ 3$. At $r = 0$, the uniform law has $b_0 = L$ and $n_0 =
    1 \/ 3$, which also gives $P \( L \) = 4 L^2 \/ 3$. ◻
]

== 3 A joining cost with one entropy budget <canonical:section>

The energy decomposition (1.5) leaves the cost of joining the two faces of a coordinate split.
  We minimize this cost at fixed child means and average conditional entropy.
  Allowing arbitrary coupled pair laws is a valid relaxation because only a lower bound on the actual joining cost
  is needed; no independence of the faces is assumed. The symmetric fixed-entropy problem of Chen–Gohari–Nair
  #cite(label("ChenGohariNair2025")) Theorem 4 and Section IV-C has an optimizer supported on a reflected interior
  pair and the two equal-output corners. Chen et al. #cite(label("ChenEtAl2026CK")) Section 3.1,
  Theorem 3.10 characterize related three-point optimizers when both means and both entropy moments are
  prescribed, under explicit contact and mass conditions. Here we prescribe the two means but constrain only the
  average entropy. Pricing this common entropy budget gives the optimizer throughout the domain,
  including the transition from two corners to one.

For interior $x \, y$, use the joining cost

#[#set math.equation(numbering: n => "(3.1)")
 $ c \( x \, y \) = frac(x - y, 4) thin \[ V \( x \) - V \( y \) \] . $ <canonical:cost>]

It is symmetric and nonnegative. Extend it by zero at the equal corners $\( 1 \, 1 \) \, \( - 1 \, - 1 \)$ and by
  $+ oo$ at every other boundary pair. This is a lower semicontinuous, jointly convex function. Indeed,

$ c \( x \, y \) = 1 / 8 { J \( 1 + x \, 1 + y \) + J \( 1 - x \, 1 - y \) } \, wide
  J \( s \, t \) = \( s - t \) log \( s \/ t \) \, $

and $J$ is the sum of two relative-entropy perspectives.

Fix $- 1 < b < a < 1$, and write

$ m = frac(a + b, 2) \, wide delta = frac(a - b, 2) \, wide e_max = frac(H \( a \) + H \( b \), 2) . $

Jensen’s inequality makes $e_max$ the largest possible average entropy; the deterministic pair attains it.
  We call this boundary the capacity state of the joining problem. For $0 < e lt.eq e_max$, define

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(K) \( m \, delta \, e \) = inf {bb(E) c \( A \, B \) : bb(E) A = a \, med bb(E) B = b \, med
   frac(bb(E) H \( A \) + bb(E) H \( B \), 2) lt.eq e} . $ <canonical:budget>]

The infimum is over joint laws on $\[ - 1 \, 1 \]^2$. Only the average entropy is constrained.

=== 3.1 Constructing and certifying the priced core <constructing-and-certifying-the-priced-core>

We first construct candidate laws of the form

#[#set math.equation(numbering: n => "(3.3)")
 $ lambda delta_(\( x \, y \)) + pi_(+) delta_(\( 1 \, 1 \)) + pi_(-) delta_(\( - 1 \, - 1 \)) \, wide -
   1 < y < x < 1 . $ <canonical:law>]

The prescribed mean difference forces $lambda \( x - y \) = 2 delta$;
  the mean sum and total mass then determine the two corner masses.
  We will minimize a priced objective within this family, and then prove optimality against all coupled laws by an
  affine lower bound.

For an ordered interior pair $x > y$, set

$ z = log frac(1 + x, 1 + y) \, quad w = log frac(1 - y, 1 - x) \, quad u = \( e^z - 1 \)^(- 1) \, quad
  v = \( e^w - 1 \)^(- 1) \, quad n = 1 + u + v . $

Then

#[#set math.equation(numbering: n => "(3.4)")
 $ x = frac(1 + u - v, n) \, wide y = frac(u - v - 1, n) \, wide x - y = 2 / n \, wide
   frac(c \( x \, y \), x - y) = frac(z + w, 8) . $ <canonical:coordinates>]

In these coordinates, the masses required by the two means are

#[#set math.equation(numbering: n => "(3.5)")
 $ lambda = delta n \, wide pi_(+) = frac(1 + b - 2 delta u, 2) \, wide pi_(-) =
   frac(1 - a - 2 delta v, 2) . $ <canonical:masses>]

They sum to one, and the corner masses are nonnegative exactly when

#[#set math.equation(numbering: n => "(3.6)")
 $ z gt.eq z_0 := log frac(1 + a, 1 + b) \, wide w gt.eq w_0 := log frac(1 - b, 1 - a) . $ <canonical:floors>]

For a price $p gt.eq 0$, define

$ cal(H) \( z \, w \) = frac(H \( x \) + H \( y \), x - y) \, wide F_p \( z \, w \) = frac(z + w, 8) +
  p cal(H) \( z \, w \) . $

The corners contribute neither cost nor entropy. Hence the priced objective of the candidate law (3.3) is

#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E) { c \( A \, B \) + p \[ H \( A \) + H \( B \) \] } = 2 delta F_p \( z \, w \) . $ <canonical:candidate-value>]

This explains the normalization by $x - y$: the prescribed mean difference absorbs the core mass.
  The remaining task is to minimize $F_p$ subject to (3.6) and certify that its value also bounds every other pair law.

The normalized entropy has the positive series

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(H) \( z \, w \) & = frac(q \( z \) + q \( w \), 2) +
   sum_(i \, j gt.eq 1) frac(e^(- i z - j w), max \( i \, j \)) \,\
q \( t \) & = frac(t, e^t - 1) - log \( 1 - e^(- t) \) . $ <canonical:entropy-series>]

Here is a direct verification. The normalized entropy of $x$ is
  $\[ n log n - \( u + 1 \) log \( u + 1 \) - v log v \] \/ 2$, and that of $y$ is its transpose.
  Put $xi = e^(- z)$ and $zeta = e^(- w)$. After subtracting $\[ q \( z \) + q \( w \) \] \/ 2$, the sum becomes

$ n log \( 1 - xi zeta \) - v log \( 1 - xi \) - u log \( 1 - zeta \) . $

The coefficient of $xi^i zeta^j$ is $1 \/ i + 1 \/ j - 1 \/ min \( i \, j \) = 1 \/ max \( i \, j \)$,
  which proves (3.8). The series and its derivatives converge uniformly on compact subsets of the positive quadrant.

The function $cal(H)$ is symmetric and strictly convex. In fact, with $v_t = \( e^t - 1 \)^(- 1)$,

$ q'' \( t \) = v_t \( v_t + 1 \) { t \( 2 v_t + 1 \) - 1 } > 0 \, $

because $t \( 2 v_t + 1 \) = t coth \( t \/ 2 \) > 2$. Each term in the double series is convex;
  its exponential direction vectors span the plane.

#thm([Lemma 3.1.])[
  (The priced core).  #emph[For every $p gt.eq 0$, the minimum of
$ bb(E) { c \( A \, B \) + p \[ H \( A \) + H \( B \) \] } \, wide bb(E) A = a \, quad bb(E) B = b \, $

 has a unique optimizer. It is one ordered interior pair $\( x \, y \)$ and possible equal corners, as in (3.3).
   Its core is given by the unique minimizer of $F_p$ subject to (3.6), using (3.4); its masses are (3.5).
   At $p = 0$, the optimizer is the deterministic pair $\( a \, b \)$.]
] <canonical:priced>

#proof[
  For $p > 0$, strict convexity and the linear term give a unique minimizer on the floored quadrant.
    At $p = 0$, the unique minimum is $\( z_0 \, w_0 \)$. We now turn this constrained minimum into an affine
    lower bound in the pair values, valid for every coupled law. At the selected point put
  $ gamma_(+) = frac(\( F_p \)_z, 2 u \( u + 1 \)) \, wide gamma_(-) = frac(\( F_p \)_w, 2 v \( v + 1 \)) . $
  Both are nonnegative; a derivative vanishes unless its floor is active. The function
  $ cal(Q) \( z \, w \) = F_p \( z \, w \) + gamma_(+) \( 1 + 2 u \) + gamma_(-) \( 1 + 2 v \) $
  has zero gradient at the selected point and is strictly convex on the whole positive quadrant.
    At $p = 0$, both added coefficients are positive, and $u'' = u \( u + 1 \) \( 2 u + 1 \) > 0$,
    with the same identity for $v$, so strict convexity still holds.
    Let $kappa > 0$ be its minimum; positivity follows from the positive linear term in $F_p$ and the nonnegative
    remaining terms. Multiplying $cal(Q) gt.eq kappa$ by $x - y$ gives the global support
  #[#set math.equation(numbering: n => "(3.9)")
   $ c \( x \, y \) + p \[ H \( x \) + H \( y \) \] - kappa \( x - y \) + gamma_(+) \( 2 + x + y \) +
     gamma_(-) \( 2 - x - y \) gt.eq 0 . $ <canonical:support>]
  For $x > y$ this is the convex minimum just proved. For $x < y$, every term is nonnegative and $-
    kappa \( x - y \) > 0$. On the interior diagonal, the entropy term is positive if $p > 0$; if $p = 0$,
    both corner coefficients are positive. At the equal corners,
    equality is allowed exactly when the corresponding $gamma$ vanishes. All other boundary pairs have infinite cost.
  The candidate masses in (3.5) have means $a \, b$, and complementarity gives $gamma_plus.minus pi_plus.minus =
    0$. Thus (3.3) is supported at equality points of (3.9). Averaging the support proves optimality.
    Its only possible interior contact is the unique convex minimizer; the mean difference fixes its mass,
    and the mean sum fixes the two corners. This proves uniqueness. ◻
]

#thm([Proposition 3.2.])[
  (Exact entropy coverage).  #emph[For every $0 < e lt.eq e_max$,
    a law of the form (3.3) attains (3.2) and has average entropy exactly $e$.]
] <canonical:coverage>

#proof[
  Let $e \( p \)$ be the average entropy of the unique priced optimizer. It is continuous for $p gt.eq 0$:
    on each bounded price interval the minimizers lie in a common compact subset of the floored quadrant,
    since $F_p gt.eq \( z + w \) \/ 8$; uniqueness then gives continuity. Also $e \( 0 \) = e_max$.
  There are finite-cost laws with the prescribed means and arbitrarily small entropy.
    Choose a reflected core $\( r \, - r \)$ with $r$ sufficiently close to one, mass $delta \/ r$,
    and the two equal-corner masses needed to match $m$. They are nonnegative because $delta < 1 - \| m \|$.
    Its entropy $\( delta \/ r \) H \( r \)$ tends to zero. If such a comparison law has cost $C_epsilon$ and
    entropy at most $epsilon$, priced optimality and nonnegativity of cost imply
  $ 2 p thin e \( p \) lt.eq C_epsilon + 2 p epsilon . $
  Hence $e \( p \) arrow.r 0$ as $p arrow.r oo$. Continuity supplies a price with $e \( p \) = e$.
  For any competing law whose average entropy $tilde(e)$ is at most $e$, the global priced support gives
  $ bb(E) c \( A \, B \) + 2 p tilde(e) gt.eq bb(E) c \( A_p \, B_p \) + 2 p e . $
  Since $p gt.eq 0$, its cost is at least that of the priced optimizer.
    This proves the proposition without a signed entropy multiplier or an abstract optimizer replacement. ◻
]

=== 3.2 The two canonical geometries <the-two-canonical-geometries>

By reflection assume $m gt.eq 0$, so $z_0 lt.eq w_0$. Symmetry and uniqueness imply $z lt.eq
  w$ at the priced minimizer: otherwise swapping the coordinates is feasible and has the same value.
  The case $p = 0$ is already deterministic, so assume $p > 0$ in the following strict-convexity argument.
  If $w > w_0$ and $z < w$, then $\( F_p \)_w = 0$ while strict convexity and symmetry give
  $\( F_p \)_z < \( F_p \)_w$, contradicting constrained optimality. Thus either $z = w$ or $w = w_0$.

In the first case, the core is $\( r \, - r \)$, with

#[#set math.equation(numbering: n => "(3.10)")
 $ k = delta / r \, wide e = k H \( r \) \, wide cal(K) = delta V \( r \) \, wide 0 lt.eq m lt.eq 1 -
   k . $ <canonical:reflected>]

At fixed $delta \, e$, the radius $r$ and the cost do not depend on $m$.
  Uniqueness of $r$ follows because $H \( r \) \/ r$ strictly decreases.

In the second case, $pi_(-) = 0$. With core mass $k$,

#[#set math.equation(numbering: n => "(3.11)")
 $ 1 - m lt.eq k lt.eq 1 \, wide x = 1 - frac(1 - a, k) \, quad y = 1 - frac(1 - b, k) \,\
e = k / 2 \[ H \( x \) + H \( y \) \] \, wide cal(K) = k thin c \( x \, y \) . $ <canonical:onecorner>]

Indeed $z lt.eq w$ means the core center is nonnegative, and

$ frac(x + y, 2) = 1 - frac(1 - m, k) gt.eq 0 . $

The two geometries meet at $k = 1 - m$, where the reflected core has only a positive common corner.
  Thus their entropy threshold is

#[#set math.equation(numbering: n => "(3.12)")
 $ e_0 \( m \, delta \) = \( 1 - m \) H #h(-0.16667em) (frac(delta, 1 - m)) . $ <canonical:transition>]

To check the direction of the threshold, differentiate the one-corner entropy in (3.11) at fixed $a \, b$:

$ frac(d, d k) k / 2 \[ H \( x \) + H \( y \) \] = 1 / 2 [log frac(2, 1 + x) + log frac(2, 1 + y)] > 0 . $

The reflected entropy $k H \( delta \/ k \)$ also strictly increases in $k$, since its derivative is $H \( r \) +
  r V \( r \) > 0$. Consequently the reflected geometry has $e lt.eq e_0$,
  and the one-corner geometry has $e gt.eq e_0$. This is a support threshold for the exact cost optimizer,
  separate from the analytic threshold (1.8) for the production profile.
  At capacity $k = 1$ and the law is deterministic. If $delta = 0$, taking $A =
  B$ with mean $m$ and arbitrarily small entropy gives $cal(K) = 0$; that case requires no canonical classification.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.15, 0), (3.15, 0), (0, 2.94), close: true, fill: rgb("#f5f5ff"), stroke: none)
  line((-3.15, 0), (3.15, 0), (0, 2.94), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((-3.15, 0), [$pi_-=1$#linebreak()$(-1,-1)$], anchor: "north-east", padding: 0.1176cm)
  content((3.15, 0), [$pi_+=1$#linebreak()$(1,1)$], anchor: "north-west", padding: 0.1176cm)
  content((0, 2.94), [$k=1$#linebreak()$(r,-r)$], anchor: "south", padding: 0.1176cm)
  line((-1.89, 1.176), (1.89, 1.176), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-0.6825, 1.407), (0.735, 1.407), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0, 1.407), [$m$ increases], anchor: "south", padding: 0.1176cm)
  circle((0.3675, 1.176), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((0.3675, 1.176), [fixed $k$], anchor: "north", padding: 0.1176cm)
  circle((1.89, 1.176), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((2.468, 1.176), [$m=1-k$#linebreak()$pi_-=0$], anchor: "west", padding: 0.1176cm)
  content((-2.016, 1.176), [$m=-(1-k)$], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: Mixture weights for a fixed reflected core $\( r \, - r \)$. The horizontal segment keeps its mass $k$ fixed, so the separation $delta = k r$, entropy $e = k H \( r \)$, and joining cost $delta V \( r \)$ stay fixed. Moving right increases the mean $m = pi_(+) - pi_(-)$ until the negative common output disappears. Theorem 20 compares the low-information demand with this endpoint. The triangle is schematic; its points represent probability weights, not channel values. ],
) <fig:reflected-core>

Figure 1 displays the motion within the reflected geometry.
  The path preserves the optimizer’s cost and its average entropy;
  the original law’s individual entropies are retained separately when applying the local production inequalities.

== 4 The deterministic capacity comparison <capacity:section>

The scalar profile is calibrated at balanced one-bit channels.
  At a biased one-bit channel, the two output labels have unequal posterior correlations.
  Their separation provides the extra reserve needed by the variance-weighted profile.
  The inequality below also follows by differentiating at correlation one the pointwise one-bit comparison in the
  proof of Kramer–Saglam #cite(label("KramerSaglam2026")) Lemma 2.4.
  We give a direct proof using size-biased posterior information.

#thm([Lemma 4.1.])[
  (A variance-refined one-bit inequality).  #emph[Let $g \( X \) = m + delta X$,
    where $X$ is a uniform sign and $\| m \| + \| delta \| < 1$. Write $alpha = 1 - m^2$ and
$ J = frac(psi \( m + delta \) + psi \( m - delta \), 2) - psi \( m \) \, wide D = delta / 2 { V \( m + delta \) -
  V \( m - delta \) } . $

 Then $J < alpha L$ and
#[#set math.equation(numbering: n => "(4.1)")
 $ D gt.eq alpha F \( J \/ alpha \) . $ <capacity:refined>]

]
] <capacity:onebit>

#proof[
  Reflection and relabeling allow $m gt.eq 0$, $delta gt.eq 0$.
    The case $delta = 0$ is immediate, so assume $delta > 0$. Set
  $ w_plus.minus = frac(1 plus.minus m, 2) \, wide r_plus.minus = frac(delta, 1 plus.minus m) \, wide
    i_plus.minus = psi \( r_plus.minus \) . $
  The two posterior representations of the one-bit channel give
  #[#set math.equation(numbering: n => "(4.2)")
   $ J = w_(+) i_(+) + w_(-) i_(-) \, wide D = w_(+) F \( i_(+) \) + w_(-) F \( i_(-) \) . $ <capacity:posterior>]
  For the first identity, introduce a sign $U$ with conditional mean $g \( X \)$.
    Its probabilities are $w_plus.minus$, and the conditional means of $X$ given $U =
    plus.minus 1$ are $r_(+)$ and $- r_(-)$. Evaluating $I \( U \; X \)$ in either order gives the identity.
    For the second, use $w_plus.minus r_plus.minus = delta \/ 2$ and
  $ V \( m + delta \) - V \( m - delta \) = V \( r_(+) \) + V \( r_(-) \) . $
  To extract the variance refinement from these identities, use the secant slope $phi \( s \) = F \( s \) \/ s$,
    with $phi \( 0 \) = 2$. It is increasing by convexity of $F$ and $F \( 0 \) = 0$. It is also convex:
    the scalar fact $F''' gt.eq 0$ gives, for $s > 0$,
  $ phi'' \( s \) = frac(s^2 F'' \( s \) - 2 s F' \( s \) + 2 F \( s \), s^3) = 1 /
    s^3 integral_0^s t^2 F''' \( t \) thin d t gt.eq 0 . $
  Since $delta > 0$, both $i_plus.minus$ and $J$ are positive.
    The size-biased weights $w_plus.minus i_plus.minus \/ J$ therefore sum to one. Their mean information is
  $ s_(*) := frac(w_(+) i_(+)^2 + w_(-) i_(-)^2, J) \, wide 0 < s_(*) lt.eq max { i_(+) \, i_(-) } < L . $
  Jensen’s inequality now gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ D / J = frac(w_(+) i_(+), J) phi \( i_(+) \) + frac(w_(-) i_(-), J) phi \( i_(-) \) gt.eq
     phi \( s_(*) \) . $ <capacity:size-biased>]
  It remains to show $s_(*) gt.eq J \/ alpha$. This will also establish $J \/ alpha <
    L$ before we evaluate the rate there.
  The positive series for $psi$ shows that $psi \( r \) \/ r^2$ increases. Consequently
  $ q := i_(+) / i_(-) lt.eq q_0 := (frac(1 - m, 1 + m))^2 . $
  For $0 lt.eq q lt.eq 1$, the ratio
  $ R \( q \) = frac(w_(+) q^2 + w_(-), \( w_(+) q + w_(-) \)^2) $
  decreases, since
  $ R' \( q \) = frac(2 w_(+) w_(-) \( q - 1 \), \( w_(+) q + w_(-) \)^3) lt.eq 0 . $
  Direct substitution at $q_0$ therefore gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(w_(+) i_(+)^2 + w_(-) i_(-)^2, J^2) gt.eq frac(1 + 3 m^2, 1 - m^2) gt.eq 1 /
     alpha . $ <capacity:secondmoment>]
  Thus $J \/ alpha lt.eq s_(*) < L$. Combining (4.3) with monotonicity of $phi$ yields
  $ D / J gt.eq phi \( s_(*) \) gt.eq phi \( J \/ alpha \) . $
  This proves both assertions. ◻
]

The ordinary one-bit bound follows at once:

$ c \( m + delta \, m - delta \) gt.eq alpha F \( J \/ alpha \) gt.eq F \( J \) . $

The last inequality is convexity with $F \( 0 \) = 0$ and $0 < alpha lt.eq 1$.
  We retain the variance-refined form because it pays the deterministic base of the reserve profile,
  while its ordinary consequence pays the information increment at a core.

== 5 A reserve that survives adding either common output <reserve:section>

The linear rate $2 I$ leaves a remainder that has a simple behavior under mixing.
  Write $S = F - 2 I$, as in (2.4), and put

#[#set math.equation(numbering: n => "(5.1)")
 $ R \( v \, e \) = v S #h(-0.16667em) (L - e / v) \, wide v \, e > 0 \, $ <reserve:perspective>]

using the zero extension of $S$ at negative arguments. The profile (1.6) is

$ cal(B)_m \( I \) = 2 I + R \( 1 - m^2 \, H \( m \) - I \) . $

Its construction can be read as an allocation of information between two capacities.
  Set $alpha = 1 - m^2$ and $c_m = H \( m \) - alpha L gt.eq 0$. Then

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(B)_m \( I \) = inf_(u + v = I\
0 lt.eq u lt.eq c_m\
0 lt.eq v < alpha L) { 2 u + alpha F \( v \/ alpha \) } \, wide 0 lt.eq I < H \( m \) . $ <reserve:allocation>]

Indeed, $F' gt.eq 2$ makes the optimum $u = min { I \, c_m }$.
  The capacity $c_m$ is paid at the linear rate, while the remaining capacity $alpha
  L$ uses the exact coordinate rate. This is an identity for the profile,
  not a decomposition of an actual channel. The finite-noise bound of Kramer and Saglam
  #cite(label("KramerSaglam2026")) Theorem 1.1 reads, in the present normalization,

$ I \( T_rho f \) lt.eq rho^2 c_m + alpha psi \( rho \) wide \( 0 lt.eq rho lt.eq 1 \) $

for a Boolean field $f$ on the uniform cube with $bb(E) f = m$.
  It uses the same coefficients $alpha$ and $c_m$; here they define the local production profile $cal(B)_m$.

To determine the payment required by a join, consider a physical state

$ \| m \| + delta < 1 \, quad delta gt.eq 0 \, quad 0 < e lt.eq macron(h) :=
  frac(H \( m + delta \) + H \( m - delta \), 2) \, $

and write

$ alpha = 1 - m^2 \, quad beta = alpha - delta^2 \, wide J = H \( m \) - macron(h) \, quad j = macron(h) - e . $

Set $a = m + delta$ and $b = m - delta$. Let $e_a \, e_b > 0$ satisfy $e_a lt.eq H \( a \)$, $e_b lt.eq
  H \( b \)$, and $\( e_a + e_b \) \/ 2 = e$, and put $I_a = H \( a \) - e_a$, $I_b = H \( b \) - e_b$.
  Their average information is $j$, and their average variance capacity is $\[ \( 1 - a^2 \) + \( 1 - b^2 \) \] \/
  2 = beta$. Since $R$ is a convex perspective, the child profiles satisfy

#[#set math.equation(numbering: n => "(5.3)")
 $ frac(cal(B)_a \( I_a \) + cal(B)_b \( I_b \), 2) gt.eq 2 j + R \( beta \, e \) . $ <reserve:pooling>]

The parent information is $I = H \( m \) - e = J + j$. Subtracting the pooled bound from $cal(B)_m \( I \) =
  2 \( J + j \) + R \( alpha \, e \)$ gives the required payment

#[#set math.equation(numbering: n => "(5.4)")
 $ W \( m \, delta \, e \) = 2 J + R \( alpha \, e \) - R \( beta \, e \) . $ <reserve:payment>]

Thus

$ cal(B)_m \( I \) - frac(cal(B)_a \( I_a \) + cal(B)_b \( I_b \), 2) lt.eq W \( m \, delta \, e \) . $

It is enough to prove $W lt.eq cal(K)$. The deterministic capacity comparison pays the interior core;
  the next two lemmas show that this payment survives adding either common output.

=== 5.1 A logarithmic bound for the corner geometry <a-logarithmic-bound-for-the-corner-geometry>

#thm([Lemma 5.1.])[
  #emph[For $- 1 < m < 1$ and $0 lt.eq delta < 1 - \| m \|$, put
$ A = 1 - m \, wide kappa = 1 / 2 log frac(1, 1 - delta^2 \/ \( 1 + m \)^2) . $

 Then
#[#set math.equation(numbering: n => "(5.5)")
 $ A^2 log alpha / beta lt.eq 3 kappa . $ <reserve:log-geometry>]

]
] <reserve:geometry>

#proof[
  The case $delta = 0$ is immediate. Otherwise set
  $ h = frac(1 - m, 1 + m) > 0 \, wide t = frac(delta^2, \( 1 + m \)^2) < min { 1 \, h^2 } \, wide f \( t \) = -
    log \( 1 - t \) . $
  The ratio $f \( t \/ h \) \/ f \( t \)$ decreases in $t$ when $h gt.eq 1$ and increases when $h lt.eq 1$.
    Indeed, the ratio of the corresponding positive integrands is $\( 1 - t \) \/ \( h - t \)$,
    whose derivative has sign $1 - h$; the same monotonicity passes to their integral ratio.
  If $h gt.eq 1$, the ratio is at most its limit $1 \/ h$ at zero.
    Thus $A^2 f \( t \/ h \) \/ f \( t \) lt.eq A^2 \/ h = 1 - m^2 lt.eq 1$.
    If $0 < h < 1$, it suffices to bound the ratio at $t = h^2$. The function
  $ G \( h \) = \( 2 - h \) f \( h \) - \( 2 + h \) log \( 1 + h \) $
  has $G \( 0 \) = 0$ and
  $ G' \( h \) = 2 [frac(h, 1 - h^2) - V \( h \)] > 0 . $
  The last sign follows by bounding the integral defining $V \( h \)$ by its endpoint integrand. Consequently
  $ frac(f \( h^2 \), f \( h \)) = 1 - frac(log \( 1 + h \), f \( h \)) gt.eq frac(2 h, 2 + h) \, $
  and
  $ A^2 frac(f \( h \), f \( h^2 \)) lt.eq frac(2 h \( 2 + h \), \( 1 + h \)^2) = 2 - frac(2, \( 1 + h \)^2) lt.eq
    3 / 2 . $
  Since $f \( t \) = 2 kappa$ and $f \( t \/ h \) = log \( alpha \/ beta \)$, both cases give (5.5). ◻
]

=== 5.2 The common-output contraction <the-common-output-contraction>

#thm([Lemma 5.2.])[
  (Adding either common output).  #emph[For every physical state $\( m \, delta \, e \)$ and $0 < tau lt.eq 1$,
#[#set math.equation(numbering: n => "(5.6)")
 $ W \( 1 - tau + tau m \, tau delta \, tau e \) lt.eq tau W \( m \, delta \, e \) . $ <reserve:plus-corner>]

 The same inequality holds with parent mean $- 1 + tau + tau m$, corresponding to the negative common output.
   There is no sign restriction on the original mean.]
] <reserve:corner>

#proof[
  The positive-corner ray scales $A = 1 - m$, $delta$, and $e$ by the same factor.
    Hold $delta \/ A$ and $e \/ A$ fixed, and put $eta = 1 + delta^2 \/ A^2$. Entropy differentiation gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ A frac(d J, d A) - J = kappa . $ <reserve:entropy-euler>]
  To check this identity, use $H \( m \) - \( 1 - m \) V \( m \) = log \[ 2 \/ \( 1 + m \) \]$;
    the average of the two child logarithms is the parent logarithm plus $kappa$.
  For $h > 0$, define the entropy intercept
  $ gamma \( h \) = S \( L - h \) + h S' \( L - h \) =
    cases(delim: "{", integral_h^L frac(P \( u \), u) thin d u \, & 0 < h < L \,, 0 \, & h gt.eq L \,) wide
    P \( u \) = u^2 F'' \( L - u \) . $
  By the scalar curvature bound, $P lt.eq M = 4 L^2 \/ 3$ and $2 > 3 M$. Thus $gamma gt.eq 0$, and
  #[#set math.equation(numbering: n => "(5.8)")
   $ 0 lt.eq gamma \( e \/ alpha \) - gamma \( e \/ beta \) lt.eq M log alpha / beta . $ <reserve:intercept-bound>]
  If an argument crosses the clipping point, the integral is simply truncated at $L$.
  Since $alpha = A \( 2 - A \)$ and $beta = A \( 2 - eta A \)$, differentiation of the perspectives in (5.4) gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ A frac(d W, d A) - W = 2 kappa + A^2 { eta gamma \( e \/ beta \) - gamma \( e \/ alpha \) } . $ <reserve:euler>]
  For example, with $e = A z$, one has $R \( alpha \, e \) \/ A = \( 2 - A \) S \( L - z \/ \( 2 - A \) \)$,
    whose derivative is $- gamma \( e \/ alpha \)$. The second perspective gives the factor $eta$.
    The clipped remainder is $C^1$, because $S \( 0 \) = S' \( 0 \) = 0$,
    so these identities hold across the seam; no second derivative of the zero extension is needed.
  Now $eta gt.eq 1$, (5.8), and Lemma 11 give the whole comparison:
  #[#set math.equation(numbering: n => "(5.10)")
   $ A frac(d W, d A) - W gt.eq 2 kappa - M A^2 log alpha / beta gt.eq \( 2 - 3 M \) kappa gt.eq
     0 . $ <reserve:corner-margin>]
  Therefore $W \/ A$ is nondecreasing. Comparing $A$ and $tau A$ proves (5.6).
    The intermediate states remain physical by entropy concavity, and all child means stay interior for $tau > 0$.
    Finally $W$ is even in $m$, so reflection proves the negative-corner statement.
    For $delta = 0$, every displayed payment and margin is zero. ◻
]

=== 5.3 From one core to the local inequality <from-one-core-to-the-local-inequality>

#thm([Theorem 5.3.])[
  (Local joining for the linear reserve).  #emph[Let $\( A \, B \)$ have any joint law on $\[ - 1 \, 1 \]^2$ with
    $e_a = bb(E) H \( A \) > 0$ and $e_b = bb(E) H \( B \) > 0$. Put
$ a = bb(E) A \, quad b = bb(E) B \, quad m = frac(a + b, 2) \, quad e = frac(e_a + e_b, 2) \, $

 and $I = H \( m \) - e$, $I_a = H \( a \) - e_a$, $I_b = H \( b \) - e_b$. Then
#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) c \( A \, B \) gt.eq cal(B)_m \( I \) - frac(cal(B)_a \( I_a \) + cal(B)_b \( I_b \), 2) .
   $ <reserve:local-bound>]

]
] <reserve:joining>

#proof[
  An infinite cost is immediate. Otherwise positive child entropies give interior means.
    Swap the children if necessary so that $delta = \( a - b \) \/ 2 gt.eq 0$;
    entropy concavity makes $\( m \, delta \, e \)$ physical.
  First pay the deterministic capacity state. For an interior pair $x \, y$, let $m_0 = \( x + y \) \/ 2$,
    $delta_0 = \| x - y \| \/ 2$, $e_0 = \[ H \( x \) + H \( y \) \] \/ 2$, and $J_0 = H \( m_0 \) - e_0$.
    Write $alpha_0 = 1 - m_0^2$, $beta_0 = alpha_0 - delta_0^2$. The entropy lower bound gives $e_0 gt.eq beta_0 L$ and
  $ \[ L - e_0 \/ alpha_0 \]_(+) lt.eq J_0 \/ alpha_0 < L . $
  The last strict inequality and the variance-refined one-bit bound are Lemma 10. Hence
  #[#set math.equation(numbering: n => "(5.12)")
   $ W \( m_0 \, delta_0 \, e_0 \) & = 2 J_0 + alpha_0 S \( L - e_0 \/ alpha_0 \)\
 & lt.eq 2 J_0 + alpha_0 S \( J_0 \/ alpha_0 \) = alpha_0 F \( J_0 \/ alpha_0 \) lt.eq
   c \( x \, y \) . $ <reserve:capacity>]
  For $delta > 0$, Proposition 9 supplies an exact optimizer with interior core $\( x \, y \)$ of mass $k >
    0$ and equal-corner masses $pi_(+) \, pi_(-)$, where $k + pi_(+) + pi_(-) = 1$.
    Its cost is $k c \( x \, y \)$. Starting from the core, add the positive corner with retention factor
    $k \/ \( k + pi_(+) \)$, then the negative corner with retention factor $k + pi_(+)$.
    These two operations produce exactly the canonical law. Lemma 12 and (5.12) give
  #[#set math.equation(numbering: n => "(5.13)")
   $ W \( m \, delta \, e \) lt.eq \( k + pi_(+) \) frac(k, k + pi_(+)) W \( m_0 \, delta_0 \, e_0 \) lt.eq
     k c \( x \, y \) = cal(K) \( m \, delta \, e \) . $ <reserve:canonical-payment>]
  Both retention factors are positive; a missing corner gives a factor one.
    No orientation or separate case for the core is required. For $delta = 0$, $W = cal(K) = 0$ directly.
  Finally the actual pair law has cost at least $cal(K) \( m \, delta \, e \)$.
    Combining (5.13) with the original-child pooling bound (5.3) gives
  $ bb(E) c \( A \, B \) + frac(cal(B)_a \( I_a \) + cal(B)_b \( I_b \), 2) gt.eq 2 \( J + j \) +
    R \( alpha \, e \) = cal(B)_m \( I \) . $
  All child profiles use their original individual entropies;
    only the joining cost was minimized with their common average budget. ◻
]

The pooling step has a useful exact interpretation. If $e < beta L$,
  its minimum over the entropy split is attained at $e_a \/ \( 1 - a^2 \) = e_b \/ \( 1 - b^2 \) = e \/ beta$;
  these entropies are physical because $H \( a \) gt.eq \( 1 - a^2 \) L$, and similarly for $b$.
  If $e gt.eq beta L$, allocate both child entropies in the intervals $\[ \( 1 - a^2 \) L \, H \( a \) \]$ and
  $\[ \( 1 - b^2 \) L \, H \( b \) \]$ with the prescribed average. Both remainders vanish.
  Thus the perspective in (5.3) is the exact common-budget value of the child reserve,
  rather than an additional approximation.

== 6 Paying the information increment by thinning <thinning:section>

The canonical optimizer with one positive common corner has a useful feature:
  its cost is linear in the mass of its interior core. We will show that the information-rate increment is at most
  the core’s increment multiplied by that mass. At full mass the increment is paid by the one-bit posterior
  comparison. This will settle the whole high-entropy branch of the canonical cost problem.

The scalar inputs already proved here are

#[#set math.equation(numbering: n => "(6.1)")
 $ F \( 0 \) = 0 \, wide F' \( I \) gt.eq 2 \, wide 0 < F'' \( I \) lt.eq frac(M, \( L - I \)^2) \, wide M =
   frac(4 L^2, 3) \, wide 2 > 3 M . $ <thinning:scalar-inputs>]

Indeed, the slope follows from Lemma 5, the curvature bound from Lemma 7, and the strict margin from Lemma 4.
  The proof isolates the roles of these two bounds: the slope supplies a positive term,
  while the curvature controls the possible loss over an entropy interval.

=== 6.1 The common-output path <the-common-output-path>

Fix an interior ordered pair $a_c > b_c$ with nonnegative center, and write

$ x_c = frac(a_c + b_c, 2) gt.eq 0 \, wide d_c = frac(a_c - b_c, 2) > 0 \, wide h_c =
  frac(H \( a_c \) + H \( b_c \), 2) \, wide J_c = H \( x_c \) - h_c . $

For $0 < lambda lt.eq 1$, put mass $lambda$ on this core and mass $1 - lambda$ on $\( 1 \, 1 \)$.
  The second atom is a common output: its coordinates agree, and it contributes neither entropy nor cost.
  The mixture has means $x + d$ and $x - d$, where

#[#set math.equation(numbering: n => "(6.2)")
 $ x = 1 - lambda \( 1 - x_c \) \, wide d = lambda d_c \, wide e = lambda h_c . $ <thinning:path>]

For this path define

#[#set math.equation(numbering: n => "(6.3)")
 $ macron(h) = frac(H \( x + d \) + H \( x - d \), 2) \, wide nu = macron(h) - e \, wide J = H \( x \) -
   macron(h) \, wide I = nu + J = H \( x \) - e . $ <thinning:information>]

The average child information is $nu$, and $J$ is the entropy gained by averaging the two child means.
  Since $0 < d_c < 1 - x_c lt.eq 1$, the mixture has $x gt.eq 0$ and $0 < d < 1 - x$.
  Entropy concavity gives $nu gt.eq 0$; strict concavity gives $J > 0$; and $e > 0$ gives $I < L$.
  Thus every rate argument lies in $\[ 0 \, L \)$.

These quantities have a channel interpretation. Let $X$ be a fair sign and let $B in { 0 \,
  1 }$ be an independent flag with $Pr \( B = 1 \) = lambda$. Given $X \, B$, draw a sign $U$ with conditional mean

$ bb(E) \[ U divides X \, B \] = \( 1 - B \) + B \( x_c + d_c X \) . $

Thus $B = 0$ selects the common output and $B = 1$ selects the core.
  The three relevant entropies are $H \( U \) = H \( x \)$, $H \( U divides X \) = macron(h)$,
  and $H \( U divides X \, B \) = e$. The chain rule therefore reads

#[#set math.equation(numbering: n => "(6.4)")
 $ I = I \( U \; X \, B \) \, wide nu = I \( U \; B divides X \) \, wide J = I \( U \; X \) \, wide I = nu +
   J . $ <thinning:flag-information>]

In particular, $nu$ is the information about the flag after the input has been revealed.

#thm([Theorem 6.1.])[
  (Common-output payment).  #emph[For the core and mass in (6.2),
#[#set math.equation(numbering: n => "(6.5)")
 $ F \( nu + J \) - F \( nu \) lt.eq lambda F \( J_c \) . $ <thinning:value>]

]
] <thinning:payment>

We prove this by showing that $\[ F \( nu + J \) - F \( nu \) \] \/ lambda$ increases with $lambda$.
  This normalization matches the mixture’s cost $lambda c \( a_c \, b_c \)$.
  We first compute its derivative and identify the entropy-interval estimate that makes it nonnegative.

=== 6.2 The normalized derivative <the-normalized-derivative>

For the state (6.2), set

#[#set math.equation(numbering: n => "(6.6)")
 $ p = 1 + x \, wide sigma = 1 - x \, wide b = log \( 1 + x \) \,\
q = e + psi \( x \) = L - I \, wide s = e + L - macron(h) = L - nu \,\
kappa = - 1 / 2 log (1 - d^2 / p^2) > 0 . $ <thinning:window-data>]

In particular $s - q = J$ and $0 < q < s lt.eq L$. Write

$ Delta \( lambda \) = F \( I \) - F \( nu \) \, wide A = log frac(2, 1 + x) = L - b . $

For $h_(upright("bin")) \( t \) = H \( 1 - 2 t \)$, the entropy identity is

$ t h'_(upright("bin")) \( t \) - h_(upright("bin")) \( t \) = log \( 1 - t \) . $

Apply it first to $I = h_(upright("bin")) \( lambda \( 1 - x_c \) \/ 2 \) - lambda h_c$,
  then to the two child expressions with initial probabilities $\( 1 - a_c \) \/ 2$ and $\( 1 - b_c \) \/ 2$,
  and average. The result is

#[#set math.equation(numbering: n => "(6.7)")
 $ lambda I' = I - A \, wide lambda nu' = nu - A - kappa . $ <thinning:path-derivatives>]

For the second identity, the two logarithms have average

$ 1 / 2 log frac(\( 1 + x \)^2 - d^2, 4) = - A - kappa . $

Substitution gives the exact Euler derivative

#[#set math.equation(numbering: n => "(6.8)")
 $ lambda Delta' - Delta = integral_nu^I \( u - A \) F'' \( u \) thin d u +
   F' \( nu \) kappa . $ <thinning:normalized-derivative>]

Indeed, at the chosen value of $lambda$, the derivative in $u$ of $\( u - A \) F' \( u \) -
  F \( u \)$ is $\( u - A \) F'' \( u \)$. The value of $A$ is held fixed only during this auxiliary integration;
  both path derivatives have already been included.

The last term in (6.8) is at least $2 kappa$. Convexity makes the integrand nonnegative where $u gt.eq A$.
  On the remaining part, the curvature bound $F'' \( u \) lt.eq M \/ \( L - u \)^2$ and the substitution $h = L -
  u$ give

#[#set math.equation(numbering: n => "(6.9)")
 $ lambda Delta' - Delta gt.eq 2 kappa - M integral_q^s frac(\( h - b \)_(+), h^2) thin d h .
   $ <thinning:derivative-loss>]

Thus it suffices to prove that this integral is at most $3 kappa$:
  the strict margin $2 > 3 M$ will then make $\( Delta \/ lambda \)'$ nonnegative.
  The cutoff $b$ marks exactly the part of the entropy interval where the curvature term can be negative.
  We will first prove an interval estimate for this kernel, then check its hypotheses using the entropy of the core.

The positive term also has a channel interpretation. For the channel in (6.4),
  the posterior of the fair input at the positive output is

$ Pr \( X = z divides U = 1 \) = 1 / 2 (1 + frac(z d, p)) \, wide z in { - 1 \, 1 } . $

Consequently

$ kappa = 1 / 2 sum_(z = plus.minus 1) log frac(1 \/ 2, Pr \( X = z divides U = 1 \)) =
  D_(upright("KL")) #h(-0.16667em) ("Unif" { - 1 \, 1 } thin mid(parallel) thin cal(L) \( X divides U = 1 \)) . $

This is the relative entropy from the prior to the positive-output posterior, with the flag marginalized.
  It is an auxiliary path quantity, distinct from the canonical cost $cal(K)$.

=== 6.3 An estimate for entropy intervals <an-estimate-for-entropy-intervals>

#thm([Lemma 6.2.])[
  (An interval estimate with a logarithmic cutoff).  #emph[Let $0 lt.eq x < 1$, and put
$ p = 1 + x \, wide sigma = 1 - x \, wide gamma = sigma / p \, wide beta = frac(log \( 1 + x \), L) . $

 Suppose
$ 0 lt.eq z < gamma \, wide sigma - p z lt.eq u lt.eq 1 - z . $

 For $beta > 0$, define $k_beta \( v \) = \( v - beta \)_(+) \/ v^2$ for $v > 0$ and $k_beta \( 0 \) = 0$.
   For $beta = 0$, set $k_0 \( v \) = 1 \/ v$ for $v > 0$. Then
#[#set math.equation(numbering: n => "(6.10)")
 $ integral_u^(u + z) k_beta \( v \) thin d v lt.eq - 3 / 2 log \( 1 - gamma z \) . $ <thinning:interval-bound>]

 If $x > 0$, the endpoint $z = gamma$ is also allowed. At $z = 0$, both sides are zero.]
] <thinning:interval>

#proof[
  We first bound the cutoff by a rational function:
  #[#set math.equation(numbering: n => "(6.11)")
   $ beta gt.eq b_(*) := frac(4 x, 3 + x) \, wide 1 - beta lt.eq frac(3 sigma, 3 + x) lt.eq 3 /
     2 gamma . $ <thinning:cutoff-bound>]
  For $0 < x lt.eq 1$, let $R \( x \) = \( 3 + x \) log \( 1 + x \) \/ x$. Direct differentiation gives
  $ x^2 R' \( x \) = N \( x \) := frac(x \( 3 + x \), 1 + x) - 3 log \( 1 + x \) \, wide N' \( x \) = -
    frac(x \( 1 - x \), \( 1 + x \)^2) lt.eq 0 . $
  Since $N \( 0 \) = 0$, $R$ decreases and $R \( x \) gt.eq R \( 1 \) = 4 L$.
    This proves the first inequality, including $x = 0$ by continuity.
    The other two follow from $1 - b_(*) = 3 sigma \/ \( 3 + x \)$ and $x lt.eq 1$.
  Consider an admissible interval $\[ u \, u + z \]$ with $z < gamma$. The constraints imply
  $ a := frac(2 - u, 1 + z) in \[ 1 \, p \] . $
  Keep this $a$ and the cutoff $beta$ fixed, and consider the affine family of intervals
  #[#set math.equation(numbering: n => "(6.12)")
   $ u_a \( s \) = 2 - a \( 1 + s \) \, wide v_a \( s \) = u_a \( s \) + s \, wide 0 lt.eq s lt.eq
     z . $ <thinning:affine-intervals>]
  Because $1 lt.eq a lt.eq p$, these intervals satisfy
  $ 0 < sigma - p s lt.eq u_a \( s \) lt.eq v_a \( s \) lt.eq 1 . $
  The initial interval has length zero; the final one is $\[ u \, u + z \]$. The Leibniz rule gives
  $ frac(d, d s) integral_(u_a \( s \))^(v_a \( s \)) k_beta \( v \) thin d v = D_a \( s \) :=
    a k_beta \( u_a \( s \) \) - \( a - 1 \) k_beta \( v_a \( s \) \) . $
  We claim that
  #[#set math.equation(numbering: n => "(6.13)")
   $ D_a \( s \) lt.eq frac(3 gamma, 2 \( 1 - gamma s \)) . $ <thinning:interval-derivative>]
  For this estimate, abbreviate $u = u_a \( s \)$ and $v = v_a \( s \)$.
    Above the cutoff, $k'_beta \( v \) = \( 2 beta - v \) \/ v^3$;
    thus $k_beta$ first increases and then decreases, with the decreasing case $beta = 0$ included.
    Its minimum on $\[ u \, 1 \]$ is at an endpoint. Consequently
  $ k_beta \( v \) gt.eq min { k_beta \( u \) \, 1 - beta } . $
  If $k_beta \( u \) lt.eq 1 - beta$, this gives $D_a lt.eq k_beta \( u \) lt.eq 1 - beta$,
    and (6.13) follows from (6.11).
  Otherwise set $A_(*) = k_beta \( u \) - \( 1 - beta \) > 0$. Then $u > beta$, and
  $ D_a lt.eq a A_(*) + \( 1 - beta \) \, wide Y := frac(1 - gamma s, gamma) = 2 / sigma - frac(2 - u, a) > 0 . $
  To bound their product, hold $u \, beta \, x$ fixed and vary $a$ in the algebraic expression
  $ Theta \( a \) = { a A_(*) + \( 1 - beta \) } {2 / sigma - frac(2 - u, a)} . $
  It increases with $a$, since
  $ Theta' \( a \) = frac(2 A_(*), sigma) + frac(\( 2 - u \) \( 1 - beta \), a^2) > 0 . $
  The actual value has $a lt.eq p$, so
  #[#set math.equation(numbering: n => "(6.14)")
   $ Y D_a lt.eq Theta \( p \) = { p k_beta \( u \) - x \( 1 - beta \) } frac(4 x + sigma u, sigma p) .
     $ <thinning:transport-bound>]
  This last expression decreases with $beta$: its positive factor is independent of $beta$,
    and the first factor has derivative $- p \/ u^2 + x < 0$.
    Since $u > beta gt.eq b_(*)$, replacing $beta$ by $b_(*)$ keeps $u$ above the cutoff and gives an upper bound.
    The hard-case condition also gives
  $ u^2 { k_beta \( u \) - \( 1 - beta \) } = \( 1 - u \) { \( 1 - beta \) u - beta } > 0 . $
  Thus $u < 1$ and $u > beta \/ \( 1 - beta \) gt.eq b_(*) \/ \( 1 - b_(*) \)$.
    Putting $t = b_(*) \/ u$ now yields $0 lt.eq t < 1 \/ \( 1 + u \)$.
    Using $x = 3 b_(*) \/ \( 4 - b_(*) \)$, substitution and a common denominator give
  $ 3 / 2 - Theta \( p \)\|_(beta = b_(*)) = frac(cal(P) \( t \, u \), 2 \( 1 - t u \) \( 2 + t u \)) \, $
  where the numerator satisfies
  #[#set math.equation(numbering: n => "(6.15)")
   $ cal(P) \( t \, u \) :=  & 3 \( 2 - t u - t^2 u^2 \)\
 & - { 2 \( 2 + t u \) \( 1 - t \) - 3 t u^2 \( 1 - t u \) } { 1 + t \( 3 - u \) } gt.eq 0 \, wide 0 lt.eq u lt.eq
   1 \, quad 0 lt.eq t lt.eq frac(1, 1 + u) . $ <thinning:polynomial>]
  To prove this polynomial inequality, put
  $ C_2 = 12 - 8 u + 8 u^2 - 6 u^3 \, wide C_1 = 3 u^2 - u - 8 \, wide C_3 = u \( 3 - u \) \( 2 - 3 u^2 \) . $
  Expansion gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ cal(P) = 2 + C_1 t + C_2 t^2 + C_3 t^3 . $ <thinning:polynomial-decomposition>]
  Since
  $ C_3 + u \( 1 + u \) = u \( 1 - u \) \( 7 + 6 u - 3 u^2 \) gt.eq 0 \, wide t \( 1 + u \) lt.eq 1 \, $
  we have $C_3 t gt.eq - u$: this is immediate for $C_3 gt.eq 0$, while for $C_3 < 0$ it follows from $C_3 gt.eq -
    u \( 1 + u \)$ and $t lt.eq 1 \/ \( 1 + u \)$. Hence $cal(P) gt.eq 2 + C_1 t + \( C_2 - u \) t^2$.
    The exact identity
  $ 8 \( C_2 - u \) - C_1^2 = 4 + \( 1 - u \) { 2 \( 5 u - 3 \)^2 + u^2 \( 1 + 9 u \) + 10 } gt.eq 4 $
  therefore gives
  $ 8 cal(P) gt.eq \( 4 + C_1 t \)^2 + 4 t^2 > 0 . $
  This proves (6.15), including $t = 0$. The denominator in the preceding gap is positive because $t u =
    b_(*) < 1$. Thus $Y D_a lt.eq 3 \/ 2$, which is (6.13). Integrating from $0$ to $z$ proves (6.10).
  For $x = 0$, admissibility forces $a = 1$ and the family is $\[ 1 - s \, 1 \]$,
    whose lower endpoint is positive for $s < 1$. The integrand $k_0 \( v \) =
    1 \/ v$ therefore causes no endpoint problem. For $x > 0$,
    the cutoff is positive and $k_beta$ is continuous at zero with the stated extension.
    Also $gamma < 1$, so continuity along the same family extends the bound to $z = gamma$.
    The zero-length case is immediate. ◻
]

=== 6.4 The entropy interval of the channel <the-entropy-interval-of-the-channel>

We now return to the quantities in (6.6). To apply the interval estimate to $\[ q \, s \]$,
  we need a lower bound on its position and an upper bound on its length $J$.
  Both follow from the entropy of the oriented core.

#thm([Lemma 6.3.])[
  (The entropy interval on a thinning path).  #emph[Every state on (6.2) satisfies
#[#set math.equation(numbering: n => "(6.17)")
 $ integral_q^s frac(\( h - b \)_(+), h^2) thin d h lt.eq 3 kappa . $ <thinning:window-bound>]

]
] <thinning:window>

#proof[
  The nonnegative center of the core supplies the essential lower entropy bound.
    Write $h_(upright("bin")) \( t \) = H \( 1 - 2 t \)$, let $sigma_c = 1 - x_c lt.eq 1$, and put
  $ t = frac(1 - d_c \/ sigma_c, 2) in \( 0 \, 1 \/ 2 \) . $
  The two negative-output probabilities at the core are $sigma_c t$ and $sigma_c \( 1 - t \)$.
    Concavity and $h_(upright("bin")) \( 0 \) = 0$ imply
  $ h_(upright("bin")) \( sigma_c t \) gt.eq sigma_c h_(upright("bin")) \( t \) \, wide
    h_(upright("bin")) \( sigma_c \( 1 - t \) \) gt.eq sigma_c h_(upright("bin")) \( 1 - t \) =
    sigma_c h_(upright("bin")) \( t \) . $
  Averaging and multiplying by $lambda$, with $sigma = lambda sigma_c$ and $d \/ sigma = d_c \/ sigma_c$, gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ e gt.eq sigma H \( d \/ sigma \) . $ <thinning:entropy-floor>]
  This is a consequence of the oriented common-output path;
    it is not an assertion about every pair law with the same means.
    The bound $H \( r \) gt.eq L \( 1 - r^2 \)$ in Lemma 4 now yields
  #[#set math.equation(numbering: n => "(6.19)")
   $ q gt.eq e gt.eq L (sigma - d^2 / sigma) . $ <thinning:quadratic-floor>]
  Expanding the binary entropies in $J$ gives the posterior identity
  $ J = p / 2 psi \( d \/ p \) + sigma / 2 psi \( d \/ sigma \) . $
  Using $psi \( r \) lt.eq L r^2$ on both terms, we obtain
  $ J lt.eq frac(L d^2, sigma p) = : L z \, wide 0 < z < sigma / p . $
  The upper bound on $z$ follows from $d < sigma$. Together with (6.19), these estimates say
  $ q gt.eq L \( sigma - p z \) \, wide q + J = s lt.eq L \, wide L \( sigma - p z \) + L z =
    L \( sigma - x z \) lt.eq L . $
  We may therefore enlarge $\[ q \, s \]$ to an interval of length $L z$ inside $\[ L \( sigma - p z \) \, L \]$.
    More explicitly, choose its lower endpoint as $q_(*) := min { q \, L - L z }$.
    Both candidates are at least $L \( sigma - p z \)$, and $q_(*) lt.eq q$; its upper endpoint is either $q +
    L z gt.eq s$ or $L gt.eq s$. The integrand is nonnegative, so this enlargement can only increase the integral.
  Rescale $h = L v$. With $beta = b \/ L$ the integrand becomes $k_beta \( v \) thin d v$,
    with no additional factor of $L$. The lower endpoint $q_(*) \/
    L$ and length $z$ satisfy Lemma 15 for this $x$ and $gamma = sigma \/ p$. Hence
  $ integral_q^s frac(\( h - b \)_(+), h^2) thin d h lt.eq - 3 / 2 log \( 1 - gamma z \) = - 3 /
    2 log (1 - d^2 / p^2) = 3 kappa . $
  This includes $x = 0$, which on the path can occur only at $lambda = 1$, $x_c = 0$. ◻
]

#proof[
  Combine the derivative reduction (6.9) with Lemma 16:
  $ lambda Delta' - Delta & gt.eq 2 kappa - M integral_q^s frac(\( h - b \)_(+), h^2) thin d h\
 & gt.eq \( 2 - 3 M \) kappa gt.eq 0 . $
  Thus $\( Delta \/ lambda \)' = \( lambda Delta' - Delta \) \/ lambda^2 gt.eq 0$.
    At $lambda = 1$, the flag is deterministic, so $nu = 0$, $I = J_c$, and $Delta = F \( J_c \)$.
    Comparing with this endpoint proves (6.5). No limit as $lambda$ tends to zero is needed. ◻
]

=== 6.5 The canonical high-entropy value <the-canonical-high-entropy-value>

#thm([Theorem 6.4.])[
  (The canonical high-entropy value comparison).  #emph[Let $x gt.eq 0$, $d > 0$, and $x + d < 1$. Define
$ macron(h) \( x \, d \) = frac(H \( x + d \) + H \( x - d \), 2) \, wide
  e_0 \( x \, d \) = \( 1 - x \) H #h(-0.16667em) (frac(d, 1 - x)) . $

 For every $e_0 \( x \, d \) lt.eq e lt.eq macron(h) \( x \, d \)$,
#[#set math.equation(numbering: n => "(6.20)")
 $ cal(K) \( x \, d \, e \) gt.eq J_0 \( x \, d \, e \) := F \( H \( x \) - e \) -
   F \( macron(h) \( x \, d \) - e \) . $ <thinning:high-value-bound>]

]
] <thinning:high-value>

#proof[
  The canonical classification at (3.12) represents every state in this closed high-entropy branch by (6.2),
    with a nonnegative core center and $cal(K) \( x \, d \, e \) = lambda c \( a_c \, b_c \)$.
    Put $alpha_c = 1 - x_c^2$. Lemma 10 and convexity of $F$, with $F \( 0 \) = 0$, give
  $ c \( a_c \, b_c \) gt.eq alpha_c F \( J_c \/ alpha_c \) gt.eq F \( J_c \) . $
  Theorem 14 therefore implies
  $ J_0 \( x \, d \, e \) = F \( nu + J \) - F \( nu \) lt.eq lambda F \( J_c \) lt.eq lambda c \( a_c \, b_c \) =
    cal(K) \( x \, d \, e \) . $
  ◻
]

The canonical optimizer is used here only to evaluate a lower bound on joining cost.
  For an original pair law with means $x plus.minus d$ and individual entropies $e_a \, e_b$,
  the value of $e$ in (6.20) is their actual average. The original child information values remain
  $H \( x + d \) - e_a$ and $H \( x - d \) - e_b$; their average is $macron(h) \( x \, d \) - e$.
  Convexity of $F$ therefore gives the common floor at those original child states:

$ frac(F \( H \( x + d \) - e_a \) + F \( H \( x - d \) - e_b \), 2) gt.eq F \( macron(h) \( x \, d \) - e \) . $

No individual entropy moment of the canonical law is substituted for either original child entropy.

== 7 From the linear reserve to the sharp rate <upgrade:section>

The local reserve inequality does not by itself give the sharp rate $F \( I \)$ at every state.
  We now join their maximum

$ hat(cal(B))_m \( I \) = max { cal(B)_m \( I \) \, F \( I \) } . $

Closure under a maximum is a useful feature of the local-production framework #cite(label("ChenGohariNair2025"))
  Lemma 3, but $F$ alone does not satisfy a joining inequality for every law.
  We therefore prove the needed comparison in the part of the domain where the reserve is insufficient.
  Two comparisons organize the proof. Above half information, the reserve already dominates $F$.
  Below half information, the demand from $F$ increases with the common mean of the child states.
  Thus every reflected core can be paid at its one-corner wall by the same thinning theorem used for a one-corner
  optimizer.

=== 7.1 The reserve above half information <the-reserve-above-half-information>

#thm([Lemma 7.1.])[
  (The high-information reserve).  #emph[For $\| m \| < 1$ and $L \/ 2 lt.eq I < H \( m \)$,
#[#set math.equation(numbering: n => "(7.1)")
 $ cal(B)_m \( I \) gt.eq F \( I \) . $ <upgrade:high-information-bound>]

 The inequality is strict if $m eq.not 0$. Consequently a state with $F \( I \) > cal(B)_m \( I \)$ must have $I <
   L \/ 2$.]
] <upgrade:high-information>

#proof[
  Recall $S \( I \) = F \( I \) - 2 I$ on $\[ 0 \, L \)$ and put
  $ k_0 = L - 1 / 2 \, wide Xi \( I \) = \( I - k_0 \) S' \( I \) - S \( I \) . $
  Since $S \( 0 \) = S' \( 0 \) = 0$ and $S'' = F''$ on this interval,
  #[#set math.equation(numbering: n => "(7.2)")
   $ Xi \( I \) = integral_0^I \( s - k_0 \) F'' \( s \) thin d s . $ <upgrade:centered-curvature>]
  Lemma 6 says that $w \( s \) = e^(- 2 s) F'' \( s \)$ strictly increases.
    Also $0 < k_0 < L \/ 2$, and the binary identity $e^L = 2$ gives the exact balance
  #[#set math.equation(numbering: n => "(7.3)")
   $ integral_0^(L \/ 2) \( s - k_0 \) e^(2 s) thin d s = [1 / 2 e^(2 s) \( s - L \)]_0^(L \/ 2) =
     0 . $ <upgrade:exponential-balance>]
  On the part of the integral below $k_0$, the factor $s - k_0$ is negative and $w \( s \) lt.eq w \( k_0 \)$.
    Above $k_0$, one has $s - k_0 > 0$ and $w \( s \) gt.eq w \( k_0 \)$.
    Replacing $w \( s \)$ by $w \( k_0 \)$ therefore gives a lower bound on both parts,
    strictly so on intervals of positive length. Equations (7.2)– (7.3) imply
  $ Xi \( L \/ 2 \) = integral_0^(L \/ 2) \( s - k_0 \) e^(2 s) w \( s \) thin d s > 0 . $
  Since $Xi' \( I \) = \( I - k_0 \) F'' \( I \) > 0$ for $I gt.eq L \/ 2$,
    we have $Xi \( I \) > 0$ throughout that range.
  For the mean-dependent comparison, set
  $ alpha = 1 - m^2 \, wide c_m = H \( m \) - alpha L = L m^2 - psi \( m \) . $
  The elementary entropy bounds give $0 lt.eq c_m lt.eq m^2 k_0$. Hence, for $I gt.eq L \/ 2$, the argument
  $ s = L - frac(H \( m \) - I, alpha) = frac(I - c_m, alpha) $
  is positive; it is less than $L$ because $I < H \( m \)$. No clipping occurs in this comparison.
    The tangent inequality for the convex function $S$, and $S' gt.eq 0$, now yield
  $ cal(B)_m \( I \) - F \( I \) & = alpha S \( s \) - S \( I \)\
 & gt.eq alpha \[ S \( I \) + \( s - I \) S' \( I \) \] - S \( I \)\
 & = m^2 \[ I S' \( I \) - S \( I \) \] - c_m S' \( I \)\
 & gt.eq m^2 \[ \( I - k_0 \) S' \( I \) - S \( I \) \] = m^2 Xi \( I \) gt.eq 0 . $
  The inequality is strict at a nonzero mean. At mean zero, $alpha = 1$, $c_m = 0$,
    and the two profiles agree identically. ◻
]

=== 7.2 A direct comparison with the one-corner wall <a-direct-comparison-with-the-one-corner-wall>

#thm([Lemma 7.2.])[
  (The demand below half information).  #emph[Let $m \, d > 0$, $m + d < 1$, and
$ 0 < e lt.eq macron(h) \( m \, d \) := frac(H \( m + d \) + H \( m - d \), 2) . $

 Put $I = H \( m \) - e$, $j = macron(h) \( m \, d \) - e$, and $J = I - j$.
   If $I lt.eq L \/ 2$, then at fixed $d \, e$,
#[#set math.equation(numbering: n => "(7.4)")
 $ partial_m { F \( I \) - F \( j \) } > 0 . $ <wall:positive-derivative>]

 At $j = 0$, the derivative is interpreted from the physical side.]
] <wall:monotonicity>

#proof[
  We compare the rate slopes with the entropy slopes. First,
  #[#set math.equation(numbering: n => "(7.5)")
   $ frac(F'' \( u \), F' \( u \)) < 2 wide \( 0 lt.eq u lt.eq L \/ 2 \) . $ <wall:rate-slope>]
  Indeed, set $h = L - u gt.eq L \/ 2$. The lower bound $F'' \( u \) gt.eq
    1 \/ \[ 2 \( L - u \)^2 \]$ from Lemma 7 gives
  $ F' \( u \) gt.eq 2 + 1 / 2 (1 / h - 1 / L) . $
  Using the upper bound from the same lemma, we get
  $ 2 h^2 F' \( u \) gt.eq \( 4 - L^(- 1) \) h^2 + h gt.eq L^2 + L / 4 > 4 / 3 L^2 gt.eq h^2 F'' \( u \) . $
  The quadratic in $h$ increases for $h > 0$, and the strict comparison uses $L < 3 \/ 4$. This proves (7.5).
    Since $0 lt.eq j < I lt.eq L \/ 2$, integration gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ log frac(F' \( I \), F' \( j \)) < 2 \( I - j \) = 2 J . $ <wall:rate-ratio>]
  For the entropy slopes, write
  $ A = - partial_m macron(h) \( m \, d \) = frac(V \( m + d \) + V \( m - d \), 2) > 0 . $
  We claim the reverse comparison
  #[#set math.equation(numbering: n => "(7.7)")
   $ log frac(A, V \( m \)) gt.eq 2 J . $ <wall:entropy-ratio>]
  Hold $m > 0$ fixed and set $v_plus.minus = V \( m plus.minus d \)$.
    The function $G \( v \) = cosh^2 v - v^2$ is even and strictly increasing for $v > 0$, because $G' \( v \) =
    sinh \( 2 v \) - 2 v > 0$. Direct differentiation gives
  $ partial_d {log frac(A, V \( m \)) - 2 J} = frac(G \( v_(+) \) - G \( v_(-) \), v_(+) + v_(-)) > 0 . $
  Indeed, $A_d = \( cosh^2 v_(+) - cosh^2 v_(-) \) \/ 2$ and $2 J_d = v_(+) - v_(-)$.
    The numerator and denominator are positive since $m + d > \| m - d \|$, so $v_(+) > \| v_(-) \|$.
    At $d = 0$ the expression in braces is zero. Integration proves (7.7).
  Finally $I_m = - V \( m \)$ and $j_m = - A$. Therefore
  $ partial_m { F \( I \) - F \( j \) } = - F' \( I \) V \( m \) + F' \( j \) A > 0 $
  by (7.6)–(7.7). The regular right derivative $F' \( 0 \) = 2$ includes a capacity endpoint. ◻
]

=== 7.3 The local inequality and dimension induction <the-local-inequality-and-dimension-induction>

#thm([Theorem 7.3.])[
  (Joining the strengthened profile).  #emph[Let $\( A \, B \)$ have a joint law on $\[ - 1 \, 1 \]^2$ with $e_a =
    bb(E) H \( A \) > 0$ and $e_b = bb(E) H \( B \) > 0$. Put
$ a = bb(E) A \, quad b = bb(E) B \, quad m = frac(a + b, 2) \, quad e = frac(e_a + e_b, 2) \, quad I =
  H \( m \) - e \, $

 and $I_a = H \( a \) - e_a$, $I_b = H \( b \) - e_b$. Then
#[#set math.equation(numbering: n => "(7.8)")
 $ bb(E) c \( A \, B \) gt.eq hat(cal(B))_m \( I \) - frac(hat(cal(B))_a \( I_a \) + hat(cal(B))_b \( I_b \), 2) .
   $ <upgrade:local-inequality>]

]
] <upgrade:joining>

#proof[
  An infinite joining cost makes the assertion immediate. Otherwise positive child entropies give $\| a \| \, \|
    b \| < 1$, and entropy concavity makes all the profile arguments physical.
  If the parent maximum is attained by $cal(B)_m \( I \)$, apply the local reserve inequality of Theorem 13 and
    enlarge the two child terms to their $hat(cal(B))$ values. This includes every tie at the parent.
  It remains to suppose $F \( I \) > cal(B)_m \( I \)$. Put $d = \| a - b \| \/ 2$ and
  $ macron(h) \( m \, d \) = frac(H \( m + d \) + H \( m - d \), 2) \, wide j = macron(h) \( m \, d \) - e =
    frac(I_a + I_b, 2) . $
  Since $hat(cal(B)) gt.eq F$, convexity at the original child states gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ frac(hat(cal(B))_a \( I_a \) + hat(cal(B))_b \( I_b \), 2) gt.eq frac(F \( I_a \) + F \( I_b \), 2) gt.eq
     F \( j \) . $ <upgrade:original-child-pooling>]
  For $d = 0$, one has $I = j$ and nonnegativity of cost proves the claim. Otherwise reflect to $m > 0$:
    mean zero is impossible in this strict-parent case, because $cal(B)_0 = F$. Let
  $ J_0 \( x \, d \, e \) = F \( H \( x \) - e \) - F \( macron(h) \( x \, d \) - e \) . $
  The actual law is feasible in the common-budget cost problem, so it is enough to prove
  #[#set math.equation(numbering: n => "(7.10)")
   $ cal(K) \( m \, d \, e \) gt.eq J_0 \( m \, d \, e \) . $ <upgrade:pure-increment>]
  Use the exact optimizer from Proposition 9. In its one-positive-corner geometry,
    the entropy is at least the transition value (3.12); Theorem 17 therefore proves (7.10).
  In the reflected geometry (3.10), write
  $ d = k r \, wide e = k H \( r \) \, wide ell = 1 - k \, wide 0 < r < 1 \, quad 0 < k lt.eq 1 . $
  Then $0 < m lt.eq ell$, and the cost is $d V \( r \)$. Hold $d \, e \, k \,
    r$ fixed and increase the common mean from $m$ to $ell$. The law with mass $k$ at $\( r \, - r \)$ and masses
    $\( 1 - k + x \) \/ 2$, $\( 1 - k - x \) \/ 2$ at the equal corners makes every $x
    in \[ m \, ell \]$ physical at the same entropy and cost.
    Its means remain interior, since $ell + d = 1 - k \( 1 - r \) < 1$.
  Lemma 18 gives $H \( m \) - e < L \/ 2$. The function $H \( x \) - e$ decreases along this interval,
    so Lemma 19 applies throughout. Consequently
  $ J_0 \( m \, d \, e \) lt.eq J_0 \( ell \, d \, e \) . $
  At $x = ell$, the negative-corner mass is zero, and the state is at the one-corner transition. Theorem 17 gives
  $ J_0 \( ell \, d \, e \) lt.eq d V \( r \) = cal(K) \( m \, d \, e \) . $
  This proves (7.10). A zero-length interval requires only the last comparison.
    The case $k = 1$ would force $m = 0$ and is already covered by the reserve branch.
  Only the information bound is retained while the mean increases;
    no claim is made about which profile stays active there. The child terms in (7.9) always use the original
    entropies $e_a \, e_b$, not the entropies of a replacement optimizer.
    Together with that pooling inequality, the cost bound completes (7.8). ◻
]

#proof[
  Induct on dimension. At dimension zero, a constant field has $D = I = 0$ and $hat(cal(B))_m \( 0 \) = 0$.
    For a coordinate split $g_(+) \, g_(-)$, the exact energy decomposition is
  $ D \( g \) = frac(D \( g_(+) \) + D \( g_(-) \), 2) + bb(E) c \( g_(+) \, g_(-) \) . $
  Each within-face term has its face probability $1 \/ 2$; symmetry of the joining cost combines the two
    orientations of every joining edge into the last expectation.
    The induction hypothesis bounds the within-face productions,
    and Theorem 20 supplies the remaining difference on the joining edges.
    Their sum is the parent $hat(cal(B))$ value. Every face is interior-valued,
    so all child entropies are positive and all local uses are physical. ◻
]

== 8 Sharp entropy interpolation under noise <flow:section>

The sharp production bound has a direct dynamical meaning:
  a soft field loses information at least as fast as a noisy coordinate with the same information.
  The appropriate coordinate for this comparison is the inverse entropy deficit, rather than information itself.
  In that coordinate the comparison flow is simply exponential decay.

#proof[
  Write $g = u$ for the field in the theorem. First suppose $0 < rho < 1$, and write $rho = e^(- t)$ with $t > 0$.
    If $g$ is constant, both sides of (1.1) are zero. Otherwise every value of $g_s =
    T_(e^(- s)) g$ lies in $\( - 1 \, 1 \)$ for $s > 0$: the noise kernel gives strictly positive weight to every
    input, and a nonconstant $\[ - 1 \, 1 \]$-valued input cannot average to either endpoint.
    The mean stays fixed. By (1.4) and Theorem 3,
  #[#set math.equation(numbering: n => "(8.1)")
   $ frac(d, d s) I \( g_s \) = - D \( g_s \) lt.eq - F \( I \( g_s \) \) wide \( s > 0 \) . $ <flow:sharp-trajectory>]
  For a nonconstant input, $g_s$ is nonconstant at every finite time,
    because the Walsh characters $chi_A \( x \) = product_(i in A) x_i$, $A subset.eq { 1 \, dots.h \, n }$,
    form a basis and satisfy $T_(e^(- s)) chi_A = e^(- s \| A \|) chi_A$. All these eigenvalues are positive.
    Strict convexity of $psi$ therefore gives $0 < I \( g_s \) < L$.
    Set $r \( s \) = psi^(- 1) \( I \( g_s \) \) in \( 0 \, 1 \)$.
    The identity $F \( psi \( r \) \) = r V \( r \)$ and $psi' \( r \) = V \( r \)$ turn (8.1) into
  $ V \( r \( s \) \) r' \( s \) lt.eq - r \( s \) V \( r \( s \) \) \, wide r' \( s \) lt.eq - r \( s \) . $
  Thus, for $0 < epsilon < t$,
  $ r \( t \) lt.eq e^(- \( t - epsilon \)) r \( epsilon \) . $
  On a finite cube the noise operator and the continuous functional $I$ converge to their initial values as
    $epsilon arrow.b 0$. Continuity of $psi^(- 1)$, including at $L$, yields
  $ psi^(- 1) \( I \( T_(e^(- t)) g \) \) lt.eq e^(- t) psi^(- 1) \( I \( g \) \) . $
  Applying the increasing function $psi$ proves the claim for $0 < rho < 1$.
    This positive-time argument does not require the initial entropy production to be finite.
  At $rho = 0$, the field is constant; at $rho = 1$, the assertion is an identity.
    For negative correlation, $T_(- rho) g \( x \) = T_rho g \( - x \)$, and the change of variables $x mapsto -
    x$ preserves the uniform measure and information. This proves the full stated range.
  For $g \( x \) = a x_i$ with $\| a \| lt.eq 1$, the initial information is $psi \( \| a \| \)$ and the
    information after noise is $psi \( \| rho a \| \)$. Thus every soft coordinate attains equality. ◻
]

#proof[
  Since $f$ is Boolean, $H \( f \( x \) \) = 0$ at every input, so $I \( f \) = H \( m \)$.
    Also $I \( f \( X \) \; Y \) = I \( T_rho f \)$. The first inequality is therefore Theorem 1.
    The second follows from $r_m lt.eq 1$ and monotonicity of $psi$.
    If $0 < \| m \| < 1$, then $0 < H \( m \) < L$ and $0 < r_m < 1$,
    giving the stated strict comparison with the unbiased bound.
    For a signed coordinate $f$, $T_rho f = rho f$, so its information is exactly $psi \( \| rho \| \)$. ◻
]

=== 8.1 Comparison of mean-dependent production bounds <flow:comparison>

Theorem 3 gives more than the scalar rate needed for Theorem 1.
  For $0 < m < 1$ and $0 lt.eq I < H \( m \)$, put $h = H \( m \) - I$.
  The hybrid production profile of Chen et al. #cite(label("ChenEtAl2026CK")) Section 9 and Lemma 9.2,
  converted to natural logarithms and the generator $N$ used here, is

$ C_m \( I \) = max { F \( L - h \) - m V \( s \) \, F \( I \) } \, wide m H \( s \) = h s \, wide m lt.eq s < 1 . $

The equation for $s$ has a unique solution: $H \( s \) \/ s$ decreases strictly from $H \( m \) \/
  m$ to zero on $\[ m \, 1 \)$. In particular, the $F \( I \)$ branch yields Theorem 1 by the inverse-entropy
  integration above, with the initial information left unchanged.

The mean-dependent estimate in Theorem 3 has a different strength. At every fixed $m in \( 0 \, 1 \)$,

#[#set math.equation(numbering: n => "(8.2)")
 $ cal(B)_m \( H \( m \) - h \) tilde.op frac(1 - m^2, 2) log 1 / h \, wide
   C_m \( H \( m \) - h \) tilde.op frac(1 - m, 2) log 1 / h quad \( h arrow.b 0 \) . $ <flow:profile-asymptotics>]

Here is a direct verification. For $r = 1 - epsilon$,

$ H \( r \) = epsilon / 2 log frac(2 exp \( 1 \), epsilon) + O \( epsilon^2 \) \, wide V \( r \) = 1 / 2 log 2 /
  epsilon + O \( epsilon \) . $

Consequently $F \( L - h \) tilde.op 1 / 2 log \( 1 \/ h \)$.
  The equation $H \( s \) = h s \/ m$ gives $s arrow.r 1$ and $V \( s \) tilde.op 1 / 2 log \( 1 \/ h \)$.
  As $F \( H \( m \) - h \)$ remains bounded, these facts give the second equivalent in (8.2). The first follows from

$ cal(B)_m \( H \( m \) - h \) = 2 \( H \( m \) - h \) + \( 1 - m^2 \) S (L - frac(h, 1 - m^2)) $

and $S \( u \) = F \( u \) - 2 u$ for positive $u$. Thus the displayed profile $C_m$ does not dominate $cal(B)_m$:
  the ratio $cal(B)_m \( H \( m \) - h \) \/ C_m \( H \( m \) - h \)$ tends to $1 + m > 1$ as $h arrow.b 0$.
  This comparison concerns the two explicit production profiles.

#bibliography("refs.bib", style: "ieee", title: [References])
