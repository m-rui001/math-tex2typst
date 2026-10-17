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

#align(center)[#text(size: 16pt, weight: "bold")[Symplectic Balls in Symmetric Polar Products]]
#align(center)[OpenAI]
#align(center)[September 22, 2026]

== 1 Introduction <sec:introduction>

Let $K subset bb(R)^n$ be an origin-symmetric convex body: a compact convex set with nonempty interior and $K = - K$. Its polar is

$ K^compose = { p in bb(R)^n : chevron.l q \, p chevron.r lt.eq 1 upright(" for every ") q in K } . $

We place $K$ in the position coordinates and $K^compose$ in the conjugate momentum coordinates of $\( bb(R)_q^n times bb(R)_p^n \, omega_0 \)$, where

$ omega_0 = sum_(j = 1)^n d q_j and d p_j \, #h(2em) U_K = "int" K times "int" K^compose . $

For $c > 0$, write

$ B^(2 n) \( c \) = { \( q \, p \) : pi \( \| q \|^2 + \| p \|^2 \) < c } . $

The Gromov width $c_G \( U \)$ of an open set $U subset bb(R)^(2 n)$ is the supremum of the capacities $c$ for which there is a smooth embedding $e : B^(2 n) \( c \) arrow.r U$ satisfying $e^(*) omega_0 = omega_0$.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 2$ and every origin-symmetric convex body $K subset bb(R)^n$, 
$ c_G \( U_K \) = 4 . $

 More precisely, for every $0 < c < 4$ there is a smooth symplectic embedding $B^(2 n) \( c \) arrow.r.hook U_K$.]
] <thm:main>

The theorem imposes no smoothness, strict convexity, unconditional symmetry, or product structure on $K$. It concerns every capacity strictly below $4$; no embedding at the supremum is needed. Symplectic embeddings preserve volume, and $"vol"_(2 n) \( B^(2 n) \( c \) \) = c^n \/ n !$. Consequently Theorem 1 gives

$ "vol"_n \( K \) "vol"_n \( K^compose \) gt.eq frac(4^n, n !) . $

Thus the theorem resolves the symmetric Mahler conjecture positively; the complete deduction, including the one-dimensional case, appears in Corollary 8. We make no claim here about the classification of equality cases.

For $n gt.eq 3$, the width theorem also transports finite ball packings satisfying strict volume and pairwise-capacity inequalities into $U_K$; see Corollary 10.

=== Background and prior constructions <background-and-prior-constructions>

The symmetric volume-product problem goes back to Mahler’s work on transference in the geometry of numbers #cite(label("Mahler1939")). Earlier sharp volume inequalities cover the plane #cite(label("BoroczkyMakaiMeyerReisner2013")) Theorem 13, unconditional bodies (those invariant under coordinate sign changes) #cite(label("Reisner1987")) Sections 1–2, and dimension three #cite(label("IriyehShibata")). Bourgain and Milman’s asymptotic reverse Santaló inequality gives a lower bound $a^n \/ n !$ for some $a > 0$ independent of dimension #cite(label("BourgainMilman")); the sharp target is $4^n \/ n !$. The companion paper #cite(label("SymmetricCompanion2026")) discusses the wider convex-geometric history and the equality problem. Our focus is the stronger geometric assertion that the polar product contains large symplectic balls.

Gromov’s nonsqueezing theorem established that ball embeddings detect symplectic restrictions beyond volume preservation #cite(label("Gromov1985")). Viterbo later proposed a sharp volume–capacity inequality for convex domains #cite(label("Viterbo2000")). Artstein-Avidan, Karasev, and Ostrover connected this proposed inequality to the symmetric Mahler conjecture and proved

$ c_(upright("HZ")) \( K times K^compose \) = 4 $

for every origin-symmetric convex body #cite(label("AAKO2014")) Theorems 1.6–1.7 and Section 4. Here $c_(upright("HZ"))$ is the Hofer–Zehnder capacity, normalized to have value $pi R^2$ on a ball of radius $R$ #cite(label("HoferZehnder1994")). This computation implies the upper bound for Gromov width. We use the supporting-cylinder argument of #cite(label("AAKO2014")) Remark 4.2 and nonsqueezing to prove that bound directly. The matching lower bound requires actual ball embeddings; it does not follow from the Hofer–Zehnder capacity computation.

Earlier constructions establish this lower bound for particular families. Karasev proves it for $ell_p$ unit balls, $1 < p < oo$, #cite(label("Karasev2021")) Proposition 3.1, using coordinatewise area-preserving constructions related to those of Latschev, McDuff, and Schlenk #cite(label("LatschevMcDuffSchlenk2013")). Ramos and Sepe identify the interior of the cube–crosspolytope product with the open ball of capacity $4$ #cite(label("RamosSepe2019")) Theorem 7. Vicente obtains capacity equalities for functional-dual products defined by Young functions and lower bounds for ordinary polar products #cite(label("Vicente2025")) Theorems 1.3 and 1.5. Functional duality and ordinary polarity give different partners, so these results require separate hypotheses. Theorem 1 answers positively the unrestricted symmetric-polar-product width question formulated in #cite(label("VicenteQuestion2026")).

The unrestricted Viterbo volume–capacity conjecture was disproved by Haim-Kislev and Ostrover #cite(label("HKO2025")). Their four-dimensional counterexample uses a regular pentagon and a rotated partner #cite(label("HKO2025")) Theorem 1.3 and Proposition 1.4; the pentagon is not centrally symmetric. The theorem here concerns the particular Lagrangian product of a symmetric body and its polar, and makes no assertion for arbitrary convex domains in phase space.

The planar coordinate is Gross’s uniform-distribution map in the conformal Skorokhod construction, rotated in source and target #cite(label("Gross2019")) Section 3.2. The same lens and high powers of its inverse coordinate appear in the complete companion paper #cite(label("SymmetricCompanion2026")) Section 3 and proof of Lemma 5.1. Every lens estimate needed here, including the estimate uniform up to the tips, is proved locally. Neither the volume-product theorem nor the equality classification of the companion is used in the proof.

The holomorphic-zero argument belongs to the broader use of logarithmic poles to measure local positivity, as in Demailly #cite(label("Demailly1992")) Section 6. Its replacement of a potential near the origin by a regularized maximum has a close analogue in Witt Nyström #cite(label("WittNystrom2018")) Proposition 3.3. Those results concern projective Kähler geometry; here the replacement is proved directly for the specified form on a noncompact sublevel domain. Moser’s deformation method #cite(label("Moser1965")) Section 4, with compact support verified below, then transfers the ball to the original form. The radial coordinate change is a special case of the Kähler symplectic-coordinate formula of Loi and Zuddas #cite(label("LoiZuddas2008")) proof of Theorem 1.1, equation (23); its pullback is also verified directly.

=== The construction <the-construction>

The lower bound comes from comparing two scales. For a fixed body $K$ given by finitely many symmetric strips and a large integer $k$, a holomorphic construction produces balls of every capacity below $pi k$ in a suitable symplectic domain. We realize that domain in $"int" K times S_k "int" K^compose$, where the momentum scale satisfies $S_k = \( 1 + o \( 1 \) \) pi k \/ 4$ as $k arrow.r oo$. Dividing momentum by $S_k$ and compensating with a dilation of the source ball gives each prescribed capacity below $4$ once $k$ is sufficiently large. Two independent analytic ingredients supply these scales.

The first turns holomorphic vanishing into a ball (Theorem 2). Let $f = \( f_1 \, dots.h \, f_m \)$ be holomorphic on an open set $Omega subset bb(C)^n$ containing $0$, have the unique common zero $0$, and satisfy $\| f \( z \) \| = O \( \| z \|^k \)$ there. The domain ${ \| f \|^2 < 1 }$, equipped with a symplectic form constructed from the potential $\| z \|^2 + \| f \( z \) \|^2$, contains balls of every capacity strictly below $pi k$, provided the closed sublevels of $\| f \|^2$ below $1$ are compact in $Omega$. The order of vanishing controls the slope of a logarithmic potential near zero. Replacing its singularity by a smooth radial potential exposes a ball, and a compactly supported Moser deformation transports that ball to the original form. Compact sublevels ensure the deformation is supported away from the boundary; no regularity of the level hypersurfaces is required.

The second ingredient controls the momentum scale (Proposition 4). A conformal map $F$ takes the unit disk $bb(D) = { w in bb(C) : \| w \| < 1 }$ to a bounded domain $D$ with tips at $plus.minus i$ and centered horizontal slices at every height $- 1 < t < 1$. Write $g = F^(- 1)$. The horizontal primitives of the densities $\| \( g^k \)' \|^2$, taken from the imaginary axis, have absolute value at most $\( pi k \/ 4 \) \| g \|^(2 k) + o \( k \)$, uniformly on all of $D$. Uniformity near the tips is essential: the slice height may approach $1$ or $- 1$ as $k$ increases. Section 3 proves this estimate locally, including the moving-endpoint bound needed at those tips.

To combine the ingredients, write $K = { x : \| chevron.l b_j \, x chevron.r \| lt.eq 1 \, med 1 lt.eq j lt.eq m }$, where the real vectors $b_j$ span $bb(R)^n$. Extend these pairings complex-linearly and set $f_j \( z \) = g \( chevron.l b_j \, z chevron.r \)^k$ on the domain where every $chevron.l b_j \, z chevron.r$ lies in $D$. These functions have the required unique common zero and compact sublevels. The phase-space realization sends the imaginary part of $z$ to position and uses the horizontal primitives for momentum. Their monotonicity makes the map globally injective, and their uniform estimate bounds the momentum in the polar body. Section 4 carries out this construction. Finally, approximation in the polar body extends the lower bound to arbitrary $K$. A supporting-cylinder argument and nonsqueezing give the matching upper bound.

=== Organization <organization>

Section 2 proves the holomorphic ball principle. Section 3 constructs the planar coordinate and proves the uniform slice estimate. Section 4 treats finite strip bodies, and Section 5 passes to all convex bodies, proves the matching upper bound, and derives the volume-product and packing consequences. Balls and symplectic domains are open unless explicitly stated otherwise.

== 2 Balls from holomorphic vanishing <sec:ball>

The aim of this section is to turn the order of a holomorphic zero into the capacity of an embedded ball. We first fix the differential-form normalization, then smooth a logarithmic singularity and transport the resulting radial ball by Moser’s deformation method.

Identify $bb(C)^n$ with $bb(R)^(2 n)$ by writing $z = u + i x$. For a smooth real function $phi.alt$, use the convention

$ d^c phi.alt \( X \) = - 1 / 4 thin d phi.alt \( i X \) \, #h(2em) d d^c phi.alt = d \( d^c phi.alt \) . $

In particular, the standard primitive and symplectic form are

#[#set math.equation(numbering: n => "(2.1)")
 $ lambda_0 = d^c \| z \|^2 = 1 / 2 sum_(j = 1)^n \( u_j thin d x_j - x_j thin d u_j \) \, #h(2em) omega_0 = d d^c \| z \|^2 = sum_(j = 1)^n d u_j and d x_j . $ <eq:ball-normalization>]

For every real tangent vector $X$, one has

$ d d^c phi.alt \( X \, i X \) = 1 / 4 Delta_zeta phi.alt \( z + zeta X \)\|_(zeta = 0) \, #h(2em) zeta in bb(C) . $

Thus a smooth function $phi.alt$ is plurisubharmonic precisely when these quantities are nonnegative. In that case $d d^c \( \| z \|^2 + phi.alt \)$ is symplectic: it is closed and its value on $\( X \, i X \)$ is at least $\| X \|^2$.

We will also use that a smooth convex, coordinatewise nondecreasing function of plurisubharmonic functions is plurisubharmonic. Indeed, on each complex line the ordinary chain rule gives

$ Delta Gamma \( h_1 \, dots.h \, h_N \) = sum_(j = 1)^N Gamma_j Delta h_j + sum_(i \, j = 1)^N Gamma_(i j) chevron.l nabla h_i \, nabla h_j chevron.r gt.eq 0 . $

The first sum is nonnegative by monotonicity, and the second is nonnegative because the Hessian of $Gamma$ is positive semidefinite.

#thm([Theorem 2.1.])[
  (A ball from a holomorphic zero).  #emph[Let $n \, m gt.eq 1$, let $Omega subset bb(C)^n$ be an open set containing $0$, and let $f = \( f_1 \, dots.h \, f_m \) : Omega arrow.r bb(C)^m$ be holomorphic. Suppose that, for some integer $k gt.eq 1$,]
  + #emph[$f^(- 1) \( 0 \) = { 0 }$ and $\| f \( z \) \| = O \( \| z \|^k \)$ as $z arrow.r 0$;]
  + #emph[for every $0 < s < 1$, the set ${ z in Omega : \| f \( z \) \|^2 lt.eq s }$ is a compact subset of $Omega$.]
  #emph[Set 
$ tau = \| f \|^2 \, #h(2em) V = { z in Omega : tau \( z \) < 1 } \, #h(2em) omega = d d^c \( \| z \|^2 + tau \) . $

 For every $0 < c < pi k$, there is a smooth symplectic embedding 
$ #scale(x: 120%, y: 120%)[\(] B^(2 n) \( c \) \, omega_0 #scale(x: 120%, y: 120%)[\)] arrow.r \( V \, omega \) . $

]
] <thm:holomorphic-ball>

#proof[
  #emph[Step 1: a logarithmic potential with the required slope.] For a holomorphic tuple, differentiation along a complex line gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ d d^c tau \( X \, i X \) & = \| d f \( X \) \|^2 \,\
d d^c log tau \( X \, i X \) & = frac(\| f \|^2 \| d f \( X \) \|^2 - lr(|sum_(j = 1)^m overline(f_j) thin d f_j \( X \)|)^2, \| f \|^4) quad upright("on ") Omega \\ { 0 } . $ <eq:ball-log-levi>]
  The second expression is nonnegative by Cauchy–Schwarz. Hence $tau$ and, away from its zero, $log tau$ are plurisubharmonic.
  Fix $0 < a < k$; we will embed the ball of capacity $pi a$. Choose
  $ a / k < b < 1 \, #h(2em) a < mu < b k . $
  Choose numbers $log b < t_(-) < t_(+) < 0$ and a smooth nondecreasing cutoff $beta : bb(R) arrow.r \[ 0 \, 1 \]$ which is $0$ for $t lt.eq t_(-)$ and $1$ for $t gt.eq t_(+)$. Define $chi$ on $\( - oo \, 0 \)$ by
  $ chi' \( t \) = b + beta \( t \) \( e^t - b \) \, $
  choosing its additive constant so that $chi \( t \) = e^t$ for $t gt.eq t_(+)$. This is possible since $chi' = e^t$ there. Moreover, $chi' > 0$ and
  $ chi'' \( t \) = beta' \( t \) \( e^t - b \) + beta \( t \) e^t gt.eq 0 \, $
  because the transition occurs where $e^t > b$. For $t lt.eq t_(-)$, the function $chi$ is affine with slope $b$.
  It follows that
  $ H = chi \( log tau \) $
  is smooth and plurisubharmonic on $V \\ { 0 }$ and satisfies $H = tau$ wherever $tau gt.eq s_0 := e^(t_(+))$. The vanishing assumption gives $tau \( z \) lt.eq C_0 \| z \|^(2 k)$ near zero. Since $chi$ is eventually affine, there is a constant $C_1$ such that
  #[#set math.equation(numbering: n => "(2.3)")
   $ H \( z \) lt.eq b k log \| z \|^2 + C_1 quad upright("for all sufficiently small ") z eq.not 0 . $ <eq:ball-singularity>]
  #emph[Step 2: smooth the singularity without changing the form near the boundary.] The strict inequality $mu < b k$ lets a smooth radial logarithm dominate $H$ close to zero while remaining below it on an outer sphere. Write $B_r = { z in bb(C)^n : \| z \| < r }$, and choose $r_2 > 0$ with $overline(B)_(r_2) subset V$. For $0 < delta lt.eq 1$, consider
  $ P_delta \( z \) = mu log \( \| z \|^2 + delta \) - M . $
  For each fixed $r > 0$, the radial calculation in Step 4 identifies $\( B_r \, d d^c \( \| z \|^2 + P_delta \) \)$ with a standard ball whose squared radius is $r^2 + mu r^2 \/ \( r^2 + delta \)$. Since $mu > a$, this exceeds $a$ for all sufficiently small $delta$. We will therefore arrange that the modified potential agrees with $P_delta$ on a ball whose radius is fixed before $delta$ is chosen.
  The functions $P_delta$ are plurisubharmonic by Equation (2.2), applied to the nowhere-zero holomorphic tuple $\( sqrt(delta) \, z_1 \, dots.h \, z_n \)$. Choose $M$ so that
  $ M > mu log \( r_2^2 + 1 \) - min_(\| z \| = r_2) H \( z \) + 2 . $
  The minimum is finite because $f$ has no zero on this sphere. Then $P_delta < H - 2$ on $\| z \| = r_2$ for every $0 < delta lt.eq 1$. On the other hand, Equation (2.3) gives
  $ P_delta \( z \) - H \( z \) gt.eq \( mu - b k \) log \| z \|^2 - M - C_1 . $
  As $z arrow.r 0$, this lower bound tends to $+ oo$, uniformly in $delta$. We may therefore fix $0 < r_1 < r_2$, independently of $delta$, such that
  #[#set math.equation(numbering: n => "(2.4)")
   $ P_delta > H + 2 quad upright("on ") 0 < \| z \| lt.eq r_1 quad upright("for every ") 0 < delta lt.eq 1 . $ <eq:ball-inner-domination>]
  Fix from now on one positive $delta$ satisfying
  #[#set math.equation(numbering: n => "(2.5)")
   $ 0 < delta < min {1 \, med r_1^2 (mu / a - 1)} . $ <eq:ball-delta-choice>]
  The upper bound is positive because $mu > a$.
  We next replace the singularity of $H$ by $P_delta$ using a regularized maximum, the standard gluing device in Richberg’s smoothing method; see #cite(label("HarveyLawsonPlis2020")) Section 2. A related replacement of Kähler potentials appears in #cite(label("WittNystrom2018")) Proposition 3.3 in a projective setting. We give the elementary two-function construction explicitly. Let $theta.alt in C_c^oo \( \( - 1 \, 1 \) \)$ be nonnegative and even, with $integral_(bb(R)) theta.alt = 1$, and set
  $ rho \( s \) = integral_(bb(R)) \| s - t \| theta.alt \( t \) thin d t \, #h(2em) "rmax" \( h \, p \) = frac(h + p + rho \( h - p \), 2) . $
  The function $rho$ is smooth and convex, with $\| rho' \| lt.eq 1$, and equals $\| s \|$ for $\| s \| gt.eq 1$. Thus $"rmax"$ is smooth, convex, nondecreasing in both arguments, and equals $max \( h \, p \)$ when $\| h - p \| gt.eq 1$. Define $tilde(H)$ to be $"rmax" \( H \, P_delta \)$ on $B_(r_2) \\ { 0 }$, to be $H$ outside $B_(r_2)$, and to take the value $P_delta \( 0 \)$ at zero. The outer comparison gives equality with $H$ in a neighborhood of $partial B_(r_2)$, and Equation (2.4) gives equality with $P_delta$ on $B_(r_1)$. Consequently $tilde(H)$ is smooth and plurisubharmonic on all of $V$.
  The difference $tilde(H) - tau$ has compact support in $V$. Indeed, set $s_2 = max_(overline(B)_(r_2)) tau < 1$, choose $max \( s_0 \, s_2 \) < sigma < 1$, and put
  #[#set math.equation(numbering: n => "(2.6)")
   $ C = { z in Omega : tau \( z \) lt.eq sigma } . $ <eq:ball-support>]
  This is a compact subset of $V$ by hypothesis. Outside $C$ a point lies outside $overline(B)_(r_2)$ and has $H = tau$, so that $tilde(H) - tau$ vanishes there.
  #emph[Step 3: transport the smoothed form.] We now use Moser’s deformation argument #cite(label("Moser1965")) Section 4. The support estimate above supplies a complete flow even though $V$ need not be compact. Consider the symplectic forms
  $ omega_s = d d^c #scale(x: 120%, y: 120%)[\(] \| z \|^2 + \( 1 - s \) tau + s tilde(H) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq s lt.eq 1 \, $
  and write $tilde(omega) = omega_1$. Each form is symplectic because the two non-Euclidean potentials are plurisubharmonic. Define the smooth time-dependent vector field $Y_s$ by
  $ iota_(Y_s) omega_s = - gamma \, #h(2em) gamma = d^c \( tilde(H) - tau \) . $
  Both $gamma$ and every $Y_s$ are supported in the fixed compact set $C$. Extending $Y_s$ by zero outside $V$ gives a smooth vector field on $bb(C)^n$, with its coefficients and first derivatives bounded uniformly for $s in \[ 0 \, 1 \]$. The ordinary differential equation for this field has a flow $phi_s$ throughout this time interval. The ambient flow fixes $bb(C)^n \\ V$ pointwise and hence restricts to diffeomorphisms of $V$. This argument applies even if $V$ is disconnected and places no regularity assumption on its boundary.
  Since $d omega_s = 0$, differentiation of pullbacks gives
  $ frac(d, d s) phi_s^(*) omega_s = phi_s^(*) #scale(x: 120%, y: 120%)[\(] d gamma + d iota_(Y_s) omega_s #scale(x: 120%, y: 120%)[\)] = 0 . $
  Therefore
  #[#set math.equation(numbering: n => "(2.7)")
   $ phi_1^(*) tilde(omega) = omega \, #h(2em) phi_1^(- 1) : \( V \, tilde(omega) \) arrow.r \( V \, omega \) upright(" is symplectic") . $ <eq:ball-moser>]
  #emph[Step 4: read off the ball in the radial model.] The deformation has reduced the problem to an explicit radial form. On $B_(r_1)$ the new potential, up to the additive constant $- M$, is $Psi \( \| z \|^2 \)$, where
  $ Psi \( t \) = t + mu log \( t + delta \) . $
  Define the radial map
  $ R \( z \) = sqrt(Psi' \( \| z \|^2 \)) thin z = sqrt(1 + frac(mu, \| z \|^2 + delta)) thin z . $
  This is the radial case of the symplectic-coordinate construction in #cite(label("LoiZuddas2008")) proof of Theorem 1.1, Equation (23). In the pullback of $lambda_0$ from Equation (2.1), the terms differentiating the radial factor cancel. Hence
  $ R^(*) lambda_0 = Psi' \( \| z \|^2 \) lambda_0 = d^c Psi \( \| z \|^2 \) \, #h(2em) R^(*) omega_0 = tilde(omega) \|_(B_(r_1)) . $
  The squared radial coordinate is strictly increasing, because
  $ frac(d, d t) #scale(x: 120%, y: 120%)[\(] t Psi' \( t \) #scale(x: 120%, y: 120%)[\)] = frac(d, d t) (t + frac(mu t, t + delta)) = 1 + frac(mu delta, \( t + delta \)^2) > 0 . $
  At zero the map is smooth and has derivative $D R \( 0 \) = sqrt(1 + mu \/ delta) thin I$, so its inverse is smooth there as well. Thus $R$ is a diffeomorphism from $B_(r_1)$ onto the standard ball $B^(2 n) \( pi Q_delta \)$, where
  $ Q_delta = r_1^2 + frac(mu r_1^2, r_1^2 + delta) > a $
  by Equation (2.5). If $iota : B_(r_1) arrow.r.hook V$ denotes inclusion, the map
  $ phi_1^(- 1) compose iota compose R^(- 1) \|_(B^(2 n) \( pi a \)) : B^(2 n) \( pi a \) arrow.r V $
  is a smooth embedding, and its pullback of $omega$ is $omega_0$ by Equation (2.7) and the radial pullback identity. Since $a$ was arbitrary in $\( 0 \, k \)$, the theorem follows. ◻
]

== 3 A planar coordinate and a uniform slice estimate <sec:planar>

We use Gross’s conformal map $psi$ for the uniform distribution #cite(label("Gross2019")) Section 3.2, with the rotation $F \( w \) = i psi \( i w \)$. There is no scaling. The same lens appears in #cite(label("SymmetricCompanion2026")) Section 3; its half-width $lambda \( t \)$ is the function $V \( t \)$ used here. We establish its needed properties directly and then prove a uniform slice estimate that controls the momentum coordinates in the polar product.

#thm([Lemma 3.1.])[
  #emph[The holomorphic function 
#[#set math.equation(numbering: n => "(3.1)")
 $ F \( w \) = 8 / pi^2 sum_(ell = 0)^oo frac(\( - 1 \)^ell w^(2 ell + 1), \( 2 ell + 1 \)^2) \, #h(2em) w in bb(D) \, $ <eq:planar-F>]

 is a biholomorphism from $bb(D)$ onto a bounded domain $D$. It is odd, commutes with conjugation, and satisfies $F \( 0 \) = 0$. The imaginary coordinates of $D$ range over $\( - 1 \, 1 \)$, and for each $t in \( - 1 \, 1 \)$ there is a finite $V \( t \) > 0$ such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ { v in bb(R) : v + i t in D } = \( - V \( t \) \, V \( t \) \) . $ <eq:horizontal-slices>]

 Write $F \( i r \) = i T \( r \)$ for $0 lt.eq r < 1$. The function $T$ increases strictly from $0$ to $1$, with 
#[#set math.equation(numbering: n => "(3.3)")
 $ T' \( r \) = 8 / pi^2 frac("arctanh" r, r) quad \( 0 < r < 1 \) \, #h(2em) lim_(r arrow.t 1) T' \( r \) = + oo . $ <eq:planar-T>]

 For fixed $t in \( - 1 \, 1 \)$, put $r_0 = T^(- 1) \( \| t \| \)$. The positive horizontal slice is parametrized by 
$ w \( r \, t \) = r e^(i theta \( r \, t \)) \, #h(2em) F \( w \( r \, t \) \) = v \( r \, t \) + i t \, #h(2em) r_0 < r < 1 \, $

 where $- pi \/ 2 < theta \( r \, t \) < pi \/ 2$ and $v \( r \, t \)$ increases strictly from $0$ to $V \( t \)$.]
] <lem:planar-map>

#proof[
  #emph[The map and its angular derivative.] The series in Equation (3.1) is absolutely summable on the closed disk. Hence $F$ is bounded, odd, and commutes with conjugation. Termwise differentiation in the open disk gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ w F' \( w \) = 8 / pi^2 arctan w \, #h(2em) arctan w = frac(1, 2 i) log frac(1 + i w, 1 - i w) . $ <eq:planar-arctan>]
  Here the logarithm is the branch on the right half-plane that is real on the positive real axis. Indeed,
  $ Re frac(1 + i w, 1 - i w) = frac(1 - \| w \|^2, \| 1 - i w \|^2) > 0 #h(2em) \( w in bb(D) \) . $
  This also shows that $arctan w = 0$ only at $w = 0$. Thus $F'$ has no zeros away from the origin, and the series gives $F' \( 0 \) = 8 \/ pi^2 eq.not 0$.
  For $w = r e^(i theta)$, define
  #[#set math.equation(numbering: n => "(3.5)")
   $ A \( r \, theta \) = Re #scale(x: 120%, y: 120%)[\(] w F' \( w \) #scale(x: 120%, y: 120%)[\)] = 4 / pi^2 arctan frac(2 r cos theta, 1 - r^2) . $ <eq:planar-A>]
  To obtain the last identity, the imaginary part of the fraction in Equation (3.4), divided by its real part, is $2 r cos theta \/ \( 1 - r^2 \)$, and its argument lies in $\( - pi \/ 2 \, pi \/ 2 \)$. On the right semicircle, $0 < A \( r \, theta \) < 2 \/ pi$. The identities
  #[#set math.equation(numbering: n => "(3.6)")
   $ partial_r F \( r e^(i theta) \) = frac(w F' \( w \), r) \, #h(2em) partial_theta F \( r e^(i theta) \) = i w F' \( w \) $ <eq:planar-polar-derivatives>]
  therefore show that $Re F \( w \) > 0$ in the right half-disk: its radial derivative is positive, and its value tends to zero at the origin. They also show that $Im F \( r e^(i theta) \)$ increases strictly with $theta$ on each right semicircle.
  Oddness and conjugation symmetry give $F \( i r \) = i T \( r \)$ with real $T$. Differentiating Equation (3.4) on the imaginary axis gives Equation (3.3). In particular, $T$ is strictly increasing, $T \( 0 \) = 0$, and $T' \( r \)$ diverges as $r arrow.t 1$. Since $F \( r \)$ is real, Equation (3.6) also gives
  $ T \( r \) = integral_0^(pi \/ 2) A \( r \, theta \) thin d theta . $
  The integrand is bounded by $2 \/ pi$ and tends to $2 \/ pi$ at every $theta in \[ 0 \, pi \/ 2 \)$ as $r arrow.t 1$. Dominated convergence therefore gives $T \( r \) arrow.r 1$.
  #emph[Horizontal slices and global invertibility.] Fix $\| t \| < 1$ and let $T \( r_0 \) = \| t \|$. For every $r in \( r_0 \, 1 \)$, the strictly increasing imaginary coordinate on the right semicircle ranges from $- T \( r \)$ to $T \( r \)$. There is consequently exactly one angle $theta \( r \, t \)$ there with imaginary coordinate $t$. It depends smoothly on $r$, since its angular derivative is $A > 0$. Writing $w F' \( w \) = A + i B$, implicit differentiation at fixed $t$ gives
  $ partial_r theta = - frac(B, r A) \, #h(2em) partial_r v = A / r - B thin partial_r theta = frac(A^2 + B^2, r A) . $
  Thus
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(partial v, partial r) \( r \, t \) = frac(\| w F' \( w \) \|^2, r A \( r \, theta \( r \, t \) \)) > 0 . $ <eq:horizontal-radius-derivative>]
  As $r arrow.b r_0 > 0$, the angle tends to the appropriate imaginary-axis endpoint of the semicircle, so $v \( r \, t \) arrow.r 0$. If $r_0 = 0$, the same limit follows from $F \( 0 \) = 0$. Boundedness of $F$ now shows that $v \( r \, t \)$ maps $\( r_0 \, 1 \)$ continuously and strictly increasingly onto an interval $\( 0 \, V \( t \) \)$, where $0 < V \( t \) < oo$.
  This parametrization proves injectivity on each positive horizontal slice. The reflection identity $F \( - overline(w) \) = - overline(F \( w \))$ gives the negative slices, and the strict monotonicity of $T$ gives injectivity on the imaginary axis. The right half-disk, imaginary axis, and left half-disk have images with positive, zero, and negative real parts, respectively. Hence $F$ is globally injective. Every point of its image has imaginary coordinate in $\( - 1 \, 1 \)$, and every such coordinate occurs on the imaginary axis. This proves Equation (3.2). Since $F' eq.not 0$, the local holomorphic inverses combine into a holomorphic inverse $g : D arrow.r bb(D)$. ◻
]

Figure 1 illustrates the radial parametrization of a horizontal slice. Along the right half of the highlighted disk curve, $Im F \( w \) = t$ stays fixed while $\| w \|$ increases, and its image moves to the right along the horizontal slice. Equation (3.7) therefore allows us to rewrite horizontal integrals using the disk radius $r$, as we do below.

#figure(
  [#image("fig/lens-slices.pdf.png", width: 100%)],
  caption: [Figure 1: A fixed horizontal slice and its preimage, illustrated for $t > 0$. Along the right half of the highlighted preimage curve in the left panel, $r$ increases from $r_0 = T^(- 1) \( t \)$ to $1$, while $v \( r \, t \)$ increases from $0$ to $V \( t \)$. The dashed circle and its image pass through the corresponding marked points. Open markers indicate boundary limits. ],
) <fig:lens-slices>

For an integer $k gt.eq 2$, define the signed slice integral

#[#set math.equation(numbering: n => "(3.8)")
 $ J_k \( v \, t \) = k^2 integral_0^v \| g \( h + i t \) \|^(2 k - 2) \| g' \( h + i t \) \|^2 thin d h \, #h(2em) v + i t in D . $ <eq:slice-primitive>]

The segment of integration lies in $D$ by Lemma 3.

#thm([Proposition 3.2.])[
  #emph[Each $J_k$ is smooth on $D$, is odd in $v$, and satisfies 
#[#set math.equation(numbering: n => "(3.9)")
 $ partial_v J_k \( v \, t \) = k^2 \| g \( v + i t \) \|^(2 k - 2) \| g' \( v + i t \) \|^2 gt.eq 0 . $ <eq:slice-derivative>]

 There is a sequence $epsilon.alt_k gt.eq 0$, depending only on $F$, with $epsilon.alt_k arrow.r 0$ such that, simultaneously for every $v + i t in D$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ frac(\| J_k \( v \, t \) \|, k) lt.eq pi / 4 \| g \( v + i t \) \|^(2 k) + epsilon.alt_k . $ <eq:uniform-slice>]

]
] <prop:uniform-slice>

#proof[
  #emph[Step 1: express the slice integral in the disk radius.] For any fixed $v + i t in D$, the horizontal segment from $i t$ to $v + i t$ is a compact subset of the open set $D$; the same is true for all sufficiently nearby endpoints and heights. The formula
  $ J_k \( v \, t \) = k^2 v integral_0^1 \| g \( a v + i t \) \|^(2 k - 2) \| g' \( a v + i t \) \|^2 thin d a $
  then proves smoothness by differentiation under the integral. The integrand is smooth even at the zero of $g$, since $\| g \|^(2 k - 2) = \( \| g \|^2 \)^(k - 1)$ and $k$ is an integer. Equation (3.9) follows from the fundamental theorem of calculus. The symmetry $g \( - overline(zeta) \) = - overline(g \( zeta \))$ makes the density in Equation (3.8) even in its real coordinate. Thus $J_k \( - v \, t \) = - J_k \( v \, t \)$, and it suffices to estimate $v > 0$.
  Fix such a point and put
  $ R = \| g \( v + i t \) \| \, #h(2em) r_0 = T^(- 1) \( \| t \| \) . $
  Along its positive horizontal slice, the radius increases from $r_0$ to $R$. Since $g' \( F \( w \) \) = 1 \/ F' \( w \)$, Equation (3.7) gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ frac(J_k \( v \, t \), k) = k integral_(r_0)^R frac(r^(2 k - 1), A \( r \, theta \( r \, t \) \)) thin d r . $ <eq:slice-radial-integral>]
  Indeed, $\| g' \|^2 thin d v = \( r \/ A \) thin d r$. At the lower endpoint this is understood as an improper integral: perform the change of variables first on a segment beginning at a positive real coordinate, and then let that coordinate decrease to zero. The original integrand is smooth on the full compact segment, so its integral is finite; the nonnegative transformed integrals converge to the same value. This argument also covers $t = 0$, when $r_0 = 0$.
  The leading constant comes from splitting $1 \/ A$ into $pi \/ 2$ and the nonnegative excess $1 \/ A - pi \/ 2$, since $0 < A < 2 \/ pi$. The constant part in Equation (3.11) contributes $pi / 4 \( R^(2 k) - r_0^(2 k) \)$. It therefore suffices to bound the remaining weighted integral uniformly over all heights and endpoints by a quantity tending to zero as $k arrow.r oo$.
  #emph[Step 2: estimate the loss near the two tips.] We next control the possible small denominator near the ends of the right semicircle. Suppose $1 \/ 2 lt.eq r < 1$ and set
  $ s = pi / 2 - \| theta \| in \( 0 \, pi \/ 2 \] \, #h(2em) X = frac(2 r sin s, 1 - r^2) . $
  For every $X > 0$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ frac(1, arctan X) - 2 / pi lt.eq 2 / X . $ <eq:reciprocal-arctan>]
  For $X lt.eq 1$, this follows from $arctan X gt.eq X \/ 2$; for $X gt.eq 1$, use $pi \/ 2 - arctan X = arctan \( 1 \/ X \) lt.eq 1 \/ X$ and $arctan X gt.eq pi \/ 4$. Combining Equation (3.12) with $sin s gt.eq 2 s \/ pi$ and $\( 1 + r \) \/ \( 2 r \) lt.eq 3 \/ 2$, we obtain
  #[#set math.equation(numbering: n => "(3.13)")
   $ frac(1, A \( r \, theta \)) lt.eq pi / 2 + frac(3 pi^3, 8) frac(1 - r, s) . $ <eq:A-angular-bound>]
  On the other hand, the vertical gap to the semicircle endpoint is
  #[#set math.equation(numbering: n => "(3.14)")
   $ Delta \( r \, theta \) & := T \( r \) - \| Im F \( r e^(i theta) \) \| = integral_0^s 4 / pi^2 arctan frac(2 r sin xi, 1 - r^2) thin d xi\
 & lt.eq frac(4 r, pi^2 \( 1 - r^2 \)) s^2 lt.eq 2 / pi^2 frac(s^2, 1 - r) . $ <eq:vertical-gap>]
  Here we used $arctan y lt.eq y$ and $sin xi lt.eq xi$. The last inequality supplies the lower bound $s gt.eq \( pi \/ sqrt(2) \) sqrt(Delta \( r \, theta \) \( 1 - r \))$. Consequently, with the absolute constant $C_0 = 3 sqrt(2) pi^2 \/ 8$, Equation (3.13) implies
  #[#set math.equation(numbering: n => "(3.15)")
   $ frac(1, A \( r \, theta \( r \, t \) \)) lt.eq pi / 2 + C_0 sqrt(frac(1 - r, T \( r \) - \| t \|)) #h(2em) \( r gt.eq 1 \/ 2 \, med r > r_0 \) . $ <eq:A-slice-bound>]
  #emph[Step 3: separate a compact part from the tip region.] Fix a radius $r_(*) in \( 1 \/ 2 \, 1 \)$. The part of the original horizontal integral for which $\| g \| lt.eq r_(*)$ is uniformly bounded, after division by $k$, by
  #[#set math.equation(numbering: n => "(3.16)")
   $ C_(*) k r_(*)^(2 k - 2) \, #h(2em) C_(*) := "diam" \( D \) max_(\| w \| lt.eq r_(*)) \| F' \( w \) \|^(- 2) < oo . $ <eq:slice-inner-bound>]
  To see this, the radius is strictly increasing along the positive slice, so the relevant portion is exactly its initial segment ending at radius $min \( R \, r_(*) \)$, when $r_0 lt.eq r_(*)$, and is empty otherwise. Every point of this segment lies in $F \( { \| w \| lt.eq r_(*) } \)$, and its horizontal length is at most $"diam" \( D \)$. This includes the case $R lt.eq r_(*)$, when it is the whole integral.
  If an outer portion remains, put
  $ r_a = max \( r_0 \, r_(*) \) \, #h(2em) L_(*) := inf_(r_(*) lt.eq r < 1) T' \( r \) > 0 . $
  Since $T \( r_a \) gt.eq T \( r_0 \) = \| t \|$, for $r > r_a$ we have
  #[#set math.equation(numbering: n => "(3.17)")
   $ T \( r \) - \| t \| gt.eq T \( r \) - T \( r_a \) gt.eq L_(*) \( r - r_a \) . $ <eq:gap-tail-bound>]
  Equations (3.11) and (3.15) therefore bound the outer contribution by
  #[#set math.equation(numbering: n => "(3.18)")
   $ pi / 4 #scale(x: 120%, y: 120%)[\(] R^(2 k) - r_a^(2 k) #scale(x: 120%, y: 120%)[\)] + C_0 / sqrt(L_(*)) thin k integral_(r_a)^1 r^(2 k - 1) sqrt(frac(1 - r, r - r_a)) thin d r . $ <eq:slice-outer-bound>]
  The extension of the error integral from $R$ to $1$ uses its nonnegativity and removes any dependence on the distance $R - r_a$.
  The last integral has an absolute bound, including when its lower endpoint depends on $k$. Write
  $ I \( k \, r_a \) = k integral_(r_a)^1 r^(2 k - 1) sqrt(frac(1 - r, r - r_a)) thin d r \, #h(2em) H = k \( 1 - r_a \) . $
  The substitution $y = k \( 1 - r \)$ gives
  $ I \( k \, r_a \) & = integral_0^H \( 1 - y \/ k \)^(2 k - 1) sqrt(frac(y, H - y)) thin d y\
 & lt.eq integral_0^H e^(- y) sqrt(frac(y, H - y)) thin d y \, $
  since $log r lt.eq - \( 1 - r \)$ and $2 k - 1 gt.eq k$. On $\[ 0 \, H \/ 2 \]$ the square-root factor is at most one. On $\[ H \/ 2 \, H \]$, bound the exponential by $e^(- H \/ 2)$ and use
  $ integral_0^H sqrt(frac(y, H - y)) thin d y = frac(pi H, 2) . $
  It follows that
  #[#set math.equation(numbering: n => "(3.19)")
   $ I \( k \, r_a \) lt.eq 1 + frac(pi H, 2) e^(- H \/ 2) lt.eq 1 + pi / e . $ <eq:uniform-endpoint-integral>]
  The same integral without its exponential factor also gives $I \( k \, r_a \) lt.eq pi H \/ 2$. These estimates hold for every $H > 0$, covering both $H arrow.b 0$ and $H arrow.r oo$.
  Combining Equations (3.16), (3.18), and (3.19), and using symmetry when $v < 0$, we have, for every $v + i t in D$,
  #[#set math.equation(numbering: n => "(3.20)")
   $ frac(\| J_k \( v \, t \) \|, k) - pi / 4 \| g \( v + i t \) \|^(2 k) lt.eq C_(*) k r_(*)^(2 k - 2) + frac(C_0 \( 1 + pi \/ e \), sqrt(L_(*))) . $ <eq:slice-uniform-error-bound>]
  When there is no outer portion, the first term alone bounds the excess, so the same displayed inequality remains valid. It is also valid at $v = 0$.
  #emph[Step 4: make the error uniform.] The cutoff radius will be chosen before the power $k$, so the estimates above allow the slice height and both radial endpoints to move with $k$. Define explicitly
  #[#set math.equation(numbering: n => "(3.21)")
   $ epsilon.alt_k = max {0 \, med sup_(v + i t in D) (frac(\| J_k \( v \, t \) \|, k) - pi / 4 \| g \( v + i t \) \|^(2 k))} . $ <eq:slice-error-sequence>]
  Equation (3.20) makes this supremum finite for each $k$. For fixed $r_(*)$, its first error term tends to zero as $k arrow.r oo$. Moreover, Equation (3.3) gives
  $ L_(*) gt.eq 8 / pi^2 "arctanh" r_(*) arrow.r oo #h(2em) upright("as ") r_(*) arrow.t 1 . $
  Given $epsilon > 0$, first choose $r_(*)$ so that the second term in Equation (3.20) is less than $epsilon \/ 2$. For this fixed $r_(*)$, choose $N$ such that $C_(*) k r_(*)^(2 k - 2) < epsilon \/ 2$ for every $k gt.eq N$. The resulting bound $epsilon.alt_k < epsilon$ holds simultaneously on all of $D$. In particular it allows the height $t$, the initial radius $r_0$, and the final radius $R$ all to vary with $k$, with no separation from either endpoint. This proves $epsilon.alt_k arrow.r 0$ and Equation (3.10). ◻
]

== 4 Realization in a polar product <sec:realization>

We now combine the ball construction with the uniform slice estimate. Writing $z = u + i x$, the imaginary coordinates $x$ will give the position in a convex body. The signed slice integrals will correct the standard momentum $- u$ to account for the holomorphic part of the symplectic form.

#thm([Proposition 4.1.])[
  #emph[Let $n gt.eq 2$ be an integer, let $b_1 \, dots.h \, b_m in bb(R)^n$ span $bb(R)^n$, and set 
$ K = { x in bb(R)^n : \| b_j dot.op x \| lt.eq 1 \, quad 1 lt.eq j lt.eq m } . $

 For every $0 < c < 4$ there is a smooth symplectic embedding 
$ B^(2 n) \( c \) arrow.r "int" \( K \) times "int" \( K^compose \) . $

]
] <prop:finite-strips>

#proof[
  #emph[Step 1: encode the strips by holomorphic functions.] The body $K$ and its finite list of defining vectors are fixed throughout the proof. Extend each real functional $b_j dot.op x$ complex-linearly to $ell_j \( z \) = b_j dot.op z$. Let $F : bb(D) arrow.r D$ and $g = F^(- 1)$ be the maps of Lemma 3, and define
  #[#set math.equation(numbering: n => "(4.1)")
   $ Omega = { z in bb(C)^n : ell_j \( z \) in D upright(" for every ") j } . $ <eq:strip-domain>]
  This is an open neighborhood of the origin. The spanning condition makes the linear map $z mapsto \( ell_1 \( z \) \, dots.h \, ell_m \( z \) \)$ injective, so there is a constant $C_b$ such that
  $ \| z \| lt.eq C_b max_j \| ell_j \( z \) \| . $
  Since $D$ is bounded, $Omega$ is bounded as well; neither set depends on the integer $k$ chosen below. The same linear bound makes $K$ compact, and a sufficiently small Euclidean ball lies in all its defining strips. In particular, $0 in "int" \( K \)$.
  For each integer $k gt.eq 2$, put
  $ f_j \( z \) = g \( ell_j \( z \) \)^k \, #h(2em) tau \( z \) = sum_(j = 1)^m \| f_j \( z \) \|^2 \, #h(2em) V = { z in Omega : tau \( z \) < 1 } \, #h(2em) omega = d d^c #scale(x: 120%, y: 120%)[\(] \| z \|^2 + tau #scale(x: 120%, y: 120%)[\)] . $
  The tuple $f = \( f_1 \, dots.h \, f_m \)$ is holomorphic on $Omega$. Since $g$ has its only zero at the origin, the common zero set of $f$ is
  $ { z in Omega : ell_j \( z \) = 0 upright(" for every ") j } = { 0 } . $
  Holomorphicity at the origin gives $\| f \( z \) \| = O \( \| z \|^k \)$. To verify the compactness hypothesis of Theorem 2, fix $0 < s < 1$. On ${ tau lt.eq s }$, for every $j$ we have
  $ ell_j \( z \) in F #scale(x: 120%, y: 120%)[\(] { w in bb(C) : \| w \| lt.eq s^(1 \/ \( 2 k \)) } #scale(x: 120%, y: 120%)[\)] \, $
  a compact subset of $D$. The linear bound above makes this sublevel bounded. Moreover, the limit of any convergent sequence in it still has all its images under the functionals $ell_j$ in that compact subset of $D$, hence belongs to $Omega$ and satisfies $tau lt.eq s$ by continuity. Thus the sublevel is compact in $Omega$. Theorem 2 now supplies symplectic embeddings into $\( V \, omega \)$ of every standard ball of capacity less than $pi k$.
  #emph[Step 2: realize the form by a globally injective map.] Write $z = u + i x$ and use the signed integrals $J_k$ of Proposition 4 to define
  #[#set math.equation(numbering: n => "(4.2)")
   $ Phi_k : V arrow.r bb(R)_q^n times bb(R)_p^n \, #h(2em) q = x \, #h(2em) p = - u - sum_(j = 1)^m J_k \( b_j dot.op u \, b_j dot.op x \) b_j . $ <eq:strip-phase-map>]
  The signed integrals $J_k$ are smooth on $D$ by Proposition 4, so $Phi_k$ is smooth.
  Set $v_j = b_j dot.op u$ and $t_j = b_j dot.op x$. Pulling back the target form gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ Phi_k^(*) omega_0 & = sum_(ell = 1)^n d x_ell and \( - d u_ell \) - sum_(j = 1)^m d t_j and d J_k \( v_j \, t_j \)\
 & = sum_(ell = 1)^n d u_ell and d x_ell + sum_(j = 1)^m partial_v J_k \( v_j \, t_j \) thin d v_j and d t_j\
 & = d d^c #scale(x: 120%, y: 120%)[\(] \| z \|^2 + tau #scale(x: 120%, y: 120%)[\)] = omega . $ <eq:strip-pullback>]
  Indeed, the terms containing $partial_t J_k$ vanish because $d t_j and d t_j = 0$, while
  $ partial_v J_k \( v \, t \) = k^2 \| g \( v + i t \) \|^(2 k - 2) \| g' \( v + i t \) \|^2 . $
  This is precisely the coefficient of $d d^c \| g \( v + i t \)^k \|^2$ in front of $d v and d t$, with the convention for $d^c$ fixed above.
  The map $Phi_k$ is globally injective. To see this, equality of its $q$ coordinates first fixes $x$. For two possible real coordinates $u_1 \, u_2$ at that $x$, write
  $ Delta u = u_2 - u_1 \, #h(2em) v_(j i) = b_j dot.op u_i \, #h(2em) t_j = b_j dot.op x \, $
  and denote the corresponding momenta by $p_1 \, p_2$. Both $v_(j 1)$ and $v_(j 2)$ belong to the same horizontal interval of $D$ at height $t_j$. Since $partial_v J_k gt.eq 0$ on this entire interval,
  $ \( p_2 - p_1 \) dot.op Delta u & = - \| Delta u \|^2 - sum_(j = 1)^m #scale(x: 120%, y: 120%)[\(] J_k \( v_(j 2) \, t_j \) - J_k \( v_(j 1) \, t_j \) #scale(x: 120%, y: 120%)[\)] \( v_(j 2) - v_(j 1) \)\
 & lt.eq - \| Delta u \|^2 . $
  Thus equal momenta force $u_1 = u_2$. This comparison applies to any two points of the fiber, even if that fiber of $V$ is disconnected. Equation (4.3) and nondegeneracy of $omega$ show that $Phi_k$ is a local diffeomorphism. It is therefore open, and its injectivity gives a smooth inverse onto its image. Consequently $Phi_k$ is a symplectic embedding.
  #emph[Step 3: control the momentum by the polar body.] We next bound its image. All imaginary parts of points of $D$ lie in $\( - 1 \, 1 \)$, so $\| b_j dot.op x \| < 1$ for every $j$. The finite system of strict inequalities implies $q = x in "int" \( K \)$. Introduce the support function
  $ h_K \( p \) = max_(y in K) chevron.l p \, y chevron.r . $
  It satisfies $h_K \( plus.minus b_j \) lt.eq 1$, and $"int" \( K^compose \) = { p : h_K \( p \) < 1 }$. Because $Omega$ is bounded, there is a finite constant $C_K$, independent of $k$, such that $h_K \( - u \) lt.eq C_K$ on $Omega$. Subadditivity and positive homogeneity of $h_K$, followed by Proposition 4, give
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(h_K \( p \), k) & lt.eq C_K / k + sum_(j = 1)^m frac(\| J_k \( v_j \, t_j \) \|, k)\
 & lt.eq C_K / k + pi / 4 sum_(j = 1)^m \| g \( ell_j \( z \) \) \|^(2 k) + m epsilon.alt_k = C_K / k + pi / 4 tau \( z \) + m epsilon.alt_k . $ <eq:strip-support>]
  Here $epsilon.alt_k gt.eq 0$ tends to zero, uniformly in the planar argument. The number $m$ and the constant $C_K$ are fixed before $k$ varies. It follows that, for any $eta > 0$ and all sufficiently large $k$,
  $ C_K / k + m epsilon.alt_k < frac(eta pi, 4) . $
  Since $tau < 1$ on $V$, Equation (4.4) then gives the strict inclusion
  #[#set math.equation(numbering: n => "(4.5)")
   $ Phi_k \( V \) subset "int" \( K \) times S "int" \( K^compose \) \, #h(2em) S = \( 1 + eta \) frac(pi k, 4) . $ <eq:strip-scaled-image>]
  #emph[Step 4: rescale the ball and the momentum together.] Finally, fix $0 < c < 4$. Choose $eta > 0$ with $\( 1 + eta \) c < 4$, and then fix an integer $k$ large enough for Equation (4.5). The resulting constant $S$ satisfies $S c < pi k$, so there is a symplectic embedding
  $ E : B^(2 n) \( S c \) arrow.r \( V \, omega \) . $
  Let $D_(sqrt(S)) \( z \) = sqrt(S) thin z$ and $L_S \( q \, p \) = \( q \, p \/ S \)$. The composition
  #[#set math.equation(numbering: n => "(4.6)")
   $ L_S compose Phi_k compose E compose D_(sqrt(S)) : B^(2 n) \( c \) arrow.r "int" \( K \) times "int" \( K^compose \) $ <eq:strip-rescaling>]
  is a smooth embedding. Since $D_(sqrt(S))$ maps $B^(2 n) \( c \)$ onto $B^(2 n) \( S c \)$ and
  $ D_(sqrt(S))^(*) omega_0 = S omega_0 \, #h(2em) L_S^(*) omega_0 = S^(- 1) omega_0 \, $
  its pullback of $omega_0$ is exactly $omega_0$. This proves the proposition. ◻
]

== 5 Arbitrary convex bodies and consequences <sec:approximation>

The passage from finite strip bodies to arbitrary convex bodies uses an approximation in the polar. This keeps the momentum factor inside the desired polar and enlarges the position factor by an arbitrarily small amount.

#thm([Lemma 5.1.])[
  (Finite polar approximation).  #emph[Let $K subset bb(R)^n$ be an origin-symmetric convex body. For every $alpha > 0$, there are finitely many vectors $b_1 \, dots.h \, b_m in bb(R)^n$ spanning $bb(R)^n$ such that 
$ K' = { x in bb(R)^n : \| chevron.l b_j \, x chevron.r \| lt.eq 1 \, quad 1 lt.eq j lt.eq m } $

 satisfies 
#[#set math.equation(numbering: n => "(5.1)")
 $ K subset K' subset \( 1 + alpha \) K \, #h(2em) \( K' \)^compose subset K^compose . $ <eq:polar-approximation>]

]
] <lem:polar-approximation>

#proof[
  First, $0 in "int" K$. Indeed, if the Euclidean ball $B \( y \, r \)$ is contained in $K$, then so is $B \( - y \, r \)$, and their midpoints contain $B \( 0 \, r \)$. Since $K$ is also bounded, there are $r \, R > 0$ with $B \( 0 \, r \) subset K subset B \( 0 \, R \)$. The definition of the polar gives
  $ B \( 0 \, R^(- 1) \) subset K^compose subset overline(B \( 0 \, r^(- 1) \)) . $
  Thus $K^compose$ is a compact, origin-symmetric convex body with nonempty interior.
  We will use the bipolar identity $K^(compose compose) = K$. To recall its justification here, if $x in.not K$, separation gives a nonzero vector $v$ such that
  $ chevron.l v \, x chevron.r > h_K \( v \) \, #h(2em) h_K \( v \) = max_(y in K) chevron.l v \, y chevron.r > 0 . $
  The normalized vector $v \/ h_K \( v \)$ belongs to $K^compose$ and pairs with $x$ to a value greater than $1$, so $x in.not K^(compose compose)$. The reverse inclusion follows directly from the definition. The same argument applies to every convex body containing the origin in its interior.
  Put $lambda = 1 + alpha$ and
  $ rho = min_(\| v \| = 1) h_(K^compose) \( v \) > 0 . $
  Choose $d > 0$ with $d lt.eq alpha rho \/ \( 1 + alpha \)$, and choose a finite $d$-net ${ b_1 \, dots.h \, b_m }$ in the compact set $K^compose$, with all net points in $K^compose$. Let
  $ P = "conv" { plus.minus b_1 \, dots.h \, plus.minus b_m } . $
  Symmetry of $K^compose$ gives $P subset K^compose$. For every unit vector $v$, a maximizer of $chevron.l v \, p chevron.r$ over $p in K^compose$ lies within distance $d$ of a net point. Consequently
  $ h_P \( v \) gt.eq h_(K^compose) \( v \) - d gt.eq lambda^(- 1) h_(K^compose) \( v \) . $
  The characterization of inclusion by support functions, which follows from convex separation, now gives
  $ lambda^(- 1) K^compose subset P subset K^compose . $
  In particular, $P$ has interior, so its generating vectors span $bb(R)^n$. Taking polars and using the bipolar identity yields
  $ K subset P^compose subset lambda K \, #h(2em) \( P^compose \)^compose = P subset K^compose . $
  Finally, the definition of $P$ shows that $P^compose$ is exactly the finite strip body $K'$ in the statement. ◻
]

#proof[
  Fix $0 < c < 4$. Choose $alpha > 0$ such that $lambda c < 4$, where $lambda = 1 + alpha$, and choose one body $K'$ from Lemma 6. Proposition 5 gives a smooth symplectic embedding
  $ e : B^(2 n) \( lambda c \) arrow.r "int" K' times "int" #scale(x: 120%, y: 120%)[\(] \( K' \)^compose #scale(x: 120%, y: 120%)[\)] . $
  If one body is contained in another, every interior ball in the first is contained in the second. Thus Equation (5.1) implies
  $ "int" K' subset lambda "int" K \, #h(2em) "int" #scale(x: 120%, y: 120%)[\(] \( K' \)^compose #scale(x: 120%, y: 120%)[\)] subset "int" K^compose \, $
  even when their boundaries meet. Regard $e$ as an embedding into $lambda "int" K times "int" K^compose$. Define
  $ D_(sqrt(lambda)) \( z \) = sqrt(lambda) thin z \, #h(2em) Q_lambda \( q \, p \) = \( q \/ lambda \, p \) . $
  The composition
  #[#set math.equation(numbering: n => "(5.2)")
   $ Q_lambda compose e compose D_(sqrt(lambda)) : B^(2 n) \( c \) arrow.r U_K $ <eq:general-rescaling>]
  is a smooth embedding. Since
  $ D_(sqrt(lambda))^(*) omega_0 = lambda omega_0 \, #h(2em) Q_lambda^(*) omega_0 = lambda^(- 1) omega_0 \, $
  its pullback of $omega_0$ equals $omega_0$. This proves $c_G \( U_K \) gt.eq 4$.
  For the upper bound, we use the supporting-slab construction of Artstein-Avidan, Karasev, and Ostrover #cite(label("AAKO2014")) Remark 4.2. Choose $q_0 in K$ and $p_0 in K^compose$ with $chevron.l q_0 \, p_0 chevron.r = 1$. Such a pair is obtained by maximizing any nonzero linear functional on $K$ and normalizing its maximum to $1$. Complete $q_0$ to a basis of $bb(R)^n$ by vectors in $ker p_0$, and let $A$ be the matrix of this basis. The linear change
  $ Q = A^(- 1) q \, #h(2em) P = A^T p $
  is symplectic and has first coordinates $Q_1 = chevron.l p_0 \, q chevron.r$ and $P_1 = chevron.l q_0 \, p chevron.r$. Both functionals are nonzero, so symmetry, polarity, and the interior condition give $\| Q_1 \| < 1$ and $\| P_1 \| < 1$ on $U_K$. Thus this change embeds $U_K$ into $\( - 1 \, 1 \)^2 times bb(R)^(2 n - 2)$, with the square in its first conjugate coordinate pair.
  For completeness, this open square is area-preservingly diffeomorphic to the disk of area $4$. Put $R = 2 \/ sqrt(pi)$, $h \( X \) = sqrt(R^2 - X^2)$ for $- R < X < R$, and
  $ H \( X \) = - 1 + integral_(- R)^X h \( s \) thin d s . $
  Since $integral_(- R)^R h \( s \) thin d s = 2$ and $H' = h > 0$, $H$ is a smooth diffeomorphism from $\( - R \, R \)$ onto $\( - 1 \, 1 \)$. The map
  $ \( u \, v \) mapsto #scale(x: 120%, y: 120%)[\(] X = H^(- 1) \( u \) \, med Y = v thin h \( H^(- 1) \( u \) \) #scale(x: 120%, y: 120%)[\)] $
  has image $B^2 \( 4 \)$ and Jacobian $X' \( u \) h \( X \) = 1$. Applying it to the first conjugate pair gives a symplectic embedding $U_K arrow.r.hook B^2 \( 4 \) times bb(R)^(2 n - 2)$. Gromov’s nonsqueezing theorem #cite(label("Gromov1985")) therefore bounds the capacity of every ball in $U_K$ by $4$. Combined with the lower bound, this proves $c_G \( U_K \) = 4$. ◻
]

#prodef([Remark 5.2.])[
  (Order of choices).  For each prescribed $0 < c < 4$, first choose $alpha > 0$ so that $lambda c < 4$, where $lambda = 1 + alpha$. Then fix the finite body $K'$ and its $m$ defining constraints. Choose $eta > 0$ so that $\( 1 + eta \) lambda c < 4$, then choose $k$ large enough that
  $ C_(K') / k + m epsilon.alt_k < frac(eta pi, 4) . $
  This is possible because the constraint list is fixed before $k$ varies. Proposition 5, applied at capacity $lambda c$, and the final rescaling then give the required ball. Each prescribed capacity is obtained by one finite construction; no limit of embeddings is required.
] <rem:parameter-order>

#thm([Corollary 5.3.])[
  (Symmetric Mahler inequality).  #emph[For every integer $n gt.eq 1$ and every origin-symmetric convex body $K subset bb(R)^n$, 
$ "vol"_n \( K \) thin "vol"_n \( K^compose \) gt.eq frac(4^n, n !) . $

]
] <cor:mahler>

#proof[
  For $n = 1$, write $K = \[ - a \, a \]$ with $a > 0$. Then $K^compose = \[ - a^(- 1) \, a^(- 1) \]$, and the product of their lengths is $4$. Assume henceforth that $n gt.eq 2$.
  We first justify that taking interiors does not change the volumes in the statement. If a convex body $C subset bb(R)^n$ contains $B \( 0 \, r \)$, then convexity gives, for $0 < t < 1$,
  $ t C + B \( 0 \, \( 1 - t \) r \) subset C . $
  Hence $t C subset "int" C$, and
  $ t^n "vol"_n \( C \) lt.eq "vol"_n \( "int" C \) lt.eq "vol"_n \( C \) . $
  Letting $t arrow.t 1$ proves $"vol"_n \( "int" C \) = "vol"_n \( C \)$. Apply this to $K$ and $K^compose$, both of which contain a neighborhood of the origin. The product formula for Lebesgue measure then gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ "vol"_(2 n) \( U_K \) = "vol"_n \( K \) thin "vol"_n \( K^compose \) . $ <eq:polar-product-volume>]
  For every $0 < c < 4$, Theorem 1 supplies a smooth symplectic embedding $f : B^(2 n) \( c \) arrow.r U_K$. Taking the $n$th exterior power of $f^(*) omega_0 = omega_0$ shows that $det D f = 1$, so the change of variables formula gives
  $ frac(c^n, n !) = "vol"_(2 n) #scale(x: 120%, y: 120%)[\(] B^(2 n) \( c \) #scale(x: 120%, y: 120%)[\)] = "vol"_(2 n) #scale(x: 120%, y: 120%)[\(] f \( B^(2 n) \( c \) \) #scale(x: 120%, y: 120%)[\)] lt.eq "vol"_(2 n) \( U_K \) . $
  Here the first equality follows from the Euclidean ball volume $pi^n R^(2 n) \/ n !$ at radius $R = sqrt(c \/ pi)$. Combining this with Equation (5.3) and letting $c arrow.t 4$ proves the claimed inequality. ◻
]

#prodef([Remark 5.4.])[
  (Sharpness).  The cube $\[ - 1 \, 1 \]^n$ has volume $2^n$. Its polar is ${ p : sum_(j = 1)^n \| p_j \| lt.eq 1 }$, whose intersection with each coordinate orthant is a simplex of volume $1 \/ n !$. These $2^n$ simplices meet only along faces, so the polar has volume $2^n \/ n !$. Their volume product is therefore $4^n \/ n !$, showing that the constant in Corollary 8 is sharp.
]

#thm([Corollary 5.5.])[
  (A sufficient packing criterion).  #emph[Let $n gt.eq 3$ and $k gt.eq 1$ be integers, and let $K subset bb(R)^n$ be an origin-symmetric convex body. Suppose that $R_1 \, dots.h \, R_k > 0$ satisfy 
$ sum_(i = 1)^k R_i^n < 4^n \, #h(2em) R_i + R_j < 4 quad \( 1 lt.eq i < j lt.eq k \) . $

 Then there are symplectic embeddings of open neighborhoods of the closed balls $overline(B^(2 n) \( R_1 \)) \, dots.h \, overline(B^(2 n) \( R_k \))$ into $U_K$ with pairwise disjoint images. The pairwise condition is vacuous for $k = 1$.]
] <cor:polar-packings>

#proof[
  Strictness and finiteness permit a choice of $0 < c < 4$ such that $sum_i R_i^n < c^n$ and $R_i + R_j < c$ for every $i < j$. The ball-packing theorem #cite(label("OpenAIBallPackings2026")) Theorem 1.1 embeds these closed balls into $B^(2 n) \( c \)$, with embeddings defined on neighborhoods. Their compact images are pairwise disjoint and lie in the open target, so the neighborhoods can be shrunk to have pairwise disjoint images contained in $B^(2 n) \( c \)$. Composing with the embedding in Theorem 1 proves the assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
