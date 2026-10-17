#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Stable self-similar blowup for a supercritical defocusing Schrödinger equation on the torus]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Consider the defocusing nonlinear Schrödinger equation

$ i partial_t u + Delta u = \| u \|^(p - 1) u #h(2em) upright("on ") bb(T)^d = \( bb(R) \/ 2 pi bb(Z) \)^d \, quad "(1.1)" $ <eq:nls>

where $p gt.eq 3$ is odd. Its scaling-critical Sobolev exponent is $s_(upright("cr")) = d \/ 2 - 2 \/ \( p - 1 \)$. In the energy-supercritical range $s_(upright("cr")) > 1$, the positive conserved energy does not control the regularity required for classical continuation. This leaves open the possibility that singularities persist even for very regular data. For odd $p$, the Sobolev algebra property and a Duhamel fixed point give local well-posedness in $H^k \( bb(T)^d \)$ for $k > d \/ 2$. Foundational Euclidean Cauchy theories include #cite(label("GinibreVelo1979")) #cite(label("CazenaveWeissler1990")). Boundedness of the critical Sobolev norm implies global scattering in several whole-space supercritical regimes #cite(label("KillipVisan2010")). Neither fact supplies an a priori critical-norm bound from the conserved energy. Bourgain surveyed global existence, blowup, and long-time dynamics #cite(label("Bourgain2000")). Our result gives a robust deterministic singularity in one such equation.

#thm([Theorem 1.1.])[
  (An open set of blowup data).  #emph[There exist an odd integer $p gt.eq 3$, a finite integer $k > 8$, and a nonempty open set $cal(U) subset H^k \( bb(T)^12 \; bb(C) \)$ with the following property. For every $u_0 in cal(U)$, the unique local solution of (1.1) extends to 
$ u in C \( \[ 0 \, T \) \; H^k \) ∩ C^1 \( \[ 0 \, T \) \; H^(k - 2) \) $

 for some finite $T > 0$, but has no continuous $H^k$ extension through $T$. More precisely, there are $x_(*) in bb(T)^12$ and $c_0 > 0$ such that 
$ lim_(t arrow.t T) \( T - t \)^(1 \/ \( p - 1 \)) \| u \( t \, x_(*) \) \| = c_0 . $

 The power can be chosen sufficiently large, and $k$ is then fixed after that choice.]
] <thm:blowup>

The prescribed-Gaussian question is motivated by the energy-supercritical branch of Deng–Nahmod–Yue’s Open problem 3 #cite(label("DengNahmodYue2020")) Section 9.2.3, p. 98. The eventual-$alpha$, $H^m$ quantifiers below are the formulation considered here, not a verbatim restatement of that problem. We next state the probabilistic consequence with its quantifiers. Let $g_n$, $n in bb(Z)^d$, be independent standard complex Gaussian variables, and let $chevron.l n chevron.r = \( 1 + \| n \|^2 \)^(1 \/ 2)$.

#thm([Corollary 1.2.])[
  (Failure of universal Gaussian global existence).  #emph[For the fixed power $p$ and index $k$ in Theorem 1, and for every $alpha > k + 6$, the initial datum 
$ u_0^omega \( x \) = sum_(n in bb(Z)^12) g_n \( omega \) chevron.l n chevron.r^(- alpha) e^(i n dot.op x) quad "(1.2)" $ <eq:gaussian>

 belongs to $H^k$ almost surely and has positive probability of finite-time blowup. In particular, the following assertion is false: for every energy-supercritical pair $\( d \, p \)$ there is a finite $alpha_0 \( d \, p \)$ such that, for every $alpha > alpha_0 \( d \, p \)$ and every 
$ d \/ 2 + 2 < m < alpha - d \/ 2 \, $

 the local $H^m$ solution with the Gaussian datum extends almost surely to $C \( bb(R) \; H^m \( bb(T)^d \) \)$.]
] <cor:gaussian>

The probability in this corollary may depend on $alpha$. We do not claim probability-one blowup or a lower probability bound uniform in $alpha$. A single fixed pair $\( d \, p \)$ is enough to refute the universal assertion, and an explicit numerical value of the permissible power is not needed.

===== 1.1 Context. <context.>

An earlier counterexample for a specially designed vector-valued, forced defocusing Schrödinger system showed that conservation and scaling alone cannot settle scalar global regularity #cite(label("Tao2018")) Theorem 1.2. For the unforced scalar energy-supercritical equation, Merle, Raphaël, Rodnianski, and Szeftel #cite(label("MRRS2022")) Theorem 1.1 obtain radial whole-space type-II blowup on a finite-codimension family for the pairs $\( 5 \, 9 \) \, \( 6 \, 5 \) \, \( 8 \, 3 \) \, \( 9 \, 3 \)$, subject to a stated profile nondegeneracy condition. Cao-Labora, Gómez-Serrano, Shi, and Staffilani #cite(label("CLGSS2024")) Theorem 1.1 construct periodic nonradial blowup for the cubic equation in dimension eight, again on a finite-codimension family. Those constructions use hydrodynamic profiles with spatial scale $\( T - t \)^(1 \/ r)$, where $r > 2$. More recently, Buck, Carballeira, Gómez-Serrano, and Shi #cite(label("BuckEtAl2026")) Theorem 1.1 and Section 4.3 construct asymptotically self-similar scalar defocusing blowup at the Schrödinger scale from smooth radial, compactly supported data on $bb(R)^d$ for $\( d \, p \) = \( 3 \, 27 \) \, \( 4 \, 9 \) \, \( 5 \, 7 \)$. Their computer-assisted profile matching and nonlinear stability yield a finite-codimension family; their theorem does not assert a physical Sobolev-open blowup set.

Here the spatial scale is $\( T - t \)^(1 \/ 2)$, the amplitude is $\( T - t \)^(- 1 \/ \( p - 1 \))$, and there is a logarithmic phase rotation. This is the meaning of self-similar, or type-I, blowup in this paper. The open neighborhood in Theorem 1 is essential for Corollary 2: full support of a Gaussian measure charges every nonempty open set, whereas a finite-codimension existence theorem alone does not give this conclusion. We prove the profile, spectral stability, periodic localization, and openness needed here directly; the cited blowup constructions provide historical and methodological context, not inputs to those proofs.

Physical-data openness has precedents for the focusing equation. Merle, Raphaël, and Szeftel #cite(label("MRS2010")) Theorem 1.2 construct an $H^1$-open set of self-similar blowup data for slightly mass-supercritical, energy-subcritical powers in dimensions one through five. Under a mode-stability hypothesis, Li #cite(label("Li2023")) Theorems 1.4–1.5 obtains asymptotic stability and $H^1$-open blowup sets by matching symmetry parameters to a stable graph. Here the spectral classification and parameter matching are proved for the defocusing profile and the periodic evolution.

The probabilistic conclusion differs from global-flow results for particular invariant ensembles in periodic and supercritical NLS #cite(label("Bourgain1994")) #cite(label("Sy2021")) #cite(label("GueyeEtAl2025")). The Gaussian law in Corollary 2 has full support in the stated $H^k$ space; its positive-probability blowup event follows from the deterministic physical-data openness, not from stochastic forcing or a random-data construction of singular solutions.

===== 1.2 Structure and methods. <structure-and-methods.>

Write $a = 1 \/ \( p - 1 \)$. As $a arrow.r 0$, a radial profile develops a flat core with positive limiting pressure and a free exterior. This limit turns the spectral matching problem into a pair of explicitly defined confluent hypergeometric solutions. A Laguerre recurrence gives analytic tail bounds, including at a removable singular parameter. Exact integer and rational certificates then count all low-angular roots and produce a nonzero profile-matching degree; a complex-path multiplier treats all remaining angular degrees. Section 2 establishes these free facts, and Appendix 7 gives the finite arithmetic recipes and their reproducible certificate. Matched asymptotics for focusing NLS profiles appear in #cite(label("BMR2021")); rigorous computer-assisted focusing profile constructions appear in #cite(label("DahneFigueras2026")) #cite(label("DonningerSchorkhuber2026")), with exact fraction arithmetic in the latter. Buck and coauthors #cite(label("BuckEtAl2026")) use validated interval arithmetic for the defocusing profile in different dimensions. The present large-power limit and finite certificates are proved here for the profile and full angular spectrum required by our theorem.

Section 3 constructs genuine finite-power profiles and the uniform bounds needed for the spectrum. Section 4 shows that the only modes in the relevant half-plane are the phase, twelve translations, and blowup time. Two points are central: a uniform outgoing estimate excludes modes escaping to large temporal or angular frequency, and compact convergence of a constrained pressure problem preserves algebraic multiplicity in the bounded spectral region. For slightly mass-supercritical focusing NLS, Li identifies the low-energy symmetry spectrum #cite(label("Li2025Low")) Theorem 1.1, excludes other unstable eigenvalues, and deduces asymptotic stability with an $H^1$-open blowup set in dimensions one through ten #cite(label("Li2025High")) Theorems 1.2–1.3. Our outgoing and multiplicity arguments treat the defocusing large-power profile in dimension twelve.

The remaining analysis separates a local compact error from global dissipation. Section 5 uses this estimate to transfer decay from the whole-space evolution to expanding tori, retaining the norm that might escape in a merely local limit. Finally, Section 6 constructs a graph of decaying perturbations and varies the physical blowup parameters. A degree argument turns that graph into an open set of physical data. The Gaussian support argument then proves Corollary 2.

===== 1.3 Notation and choices of parameters. <notation-and-choices-of-parameters.>

Throughout the construction $d = 12$, $a > 0$ is small, and $D = y dot.op nabla$. The integer $p = 1 + 1 \/ a$ is restricted to odd values when polynomial smoothness is used. After choosing an admissible profile and fixing $a$, we choose a sufficiently large finite integer $k$. Later choices of a time-step length, a torus scale, and a data neighborhood are made in that order. Implicit constants can depend on previously fixed parameters. When a limit as $a arrow.r 0$ is used, the required uniformities are stated explicitly. Complex-valued evolution spaces are regarded as real spaces for the linearization, and are complexified only for spectral analysis.

== 2 Free exterior matching <sec:free>

The profile construction and the spectral count both use a free radial equation in dimension twelve. We study it first as an independent matching problem. For a real parameter $b$, a spectral parameter $lambda in bb(C)$, an angular degree $ell in { 0 \, 1 \, 2 \, dots.h }$, and a channel index $h = plus.minus 1$, the equation is

$ v''_h + (11 / r + frac(h i r, 2)) v'_h + (b + h i lambda - frac(ell \( ell + 10 \), r^2)) v_h = 0 . quad "(2.1)" $ <free:radial-equation>

Here $ell \( ell + 10 \)$ is the eigenvalue of the negative spherical Laplacian on degree-$ell$ harmonics on $bb(S)^11$. The substitution $v_h = r^ell H \( q \, 6 + ell \, x \)$, with $q = lambda + ell \/ 2 - h i b$ and $x = - h i r^2 \/ 4$, gives the confluent hypergeometric equation. Its slow solution is

$ r^ell H \( lambda + ell \/ 2 - h i b \, 6 + ell \, - h i r^2 \/ 4 \) \, $

where Lemma 4 defines $H$ by its integral and its nonoscillatory asymptotic expansion. Primes on $v_h$ denote radial derivatives; primes on $H$ denote derivatives in its last argument. We need two kinds of boundary data from this solution. At $lambda = ell = 0$ in channel $h = 1$, the quotient $j = - H' \/ H$ vanishes exactly when the radial derivative vanishes; this matches the exterior to a constant core. For general $lambda \, ell$, the two value-and-derivative columns in Proposition 3 define the matching determinant whose zeros we count.

Section 3 derives the similarity equation and constructs the finite-power profiles. In those variables $b$ is the logarithmic phase frequency and a spectral mode has time factor $e^(lambda s)$, where $s$ is logarithmic similarity time. Lemma 30 will identify the determinant studied here with the limiting constrained spectral problem. The calculations in this section concern its free exterior, where the power parameter is $a = 0$ and the pressure is zero.

All terminating decimals in this section denote exact rational numbers. Set

$ b_(*) = .33477606871236 \, #h(2em) Z_(*) = 2.70506819293654 \, #h(2em) delta = 10^(- 8) \,\
cal(D) = { \( b \, Z \) in bb(R)^2 : \( b - b_(*) \)^2 + \( Z - Z_(*) \)^2 lt.eq delta^2 } . quad "(2.2)" $ <free:disk>

The radius of the limiting core is $R = 2 sqrt(Z)$. We prove the following statement, including its finite arithmetic ingredients. The definition of $H$ follows immediately below. The degree on $cal(D)$ means Brouwer degree on its interior.

#thm([Proposition 2.1.])[
  (Free matching).  #emph[For every $\( b \, Z \) in cal(D)$, the following conclusions hold.]
  + #emph[The quotient 
$ j \( b \, Z \) = - frac(H' \( - i b \, 6 \, - i Z \), H \( - i b \, 6 \, - i Z \)) $

 is well defined and satisfies $\| j \( b \, Z \) \| < 3 dot.op 10^(- 9)$. It is nonzero on $partial cal(D)$, and, identifying $bb(C)$ with $bb(R)^2$ in the order real part, imaginary part, 
$ deg \( j \, cal(D) \, 0 \) = - 1 . $

]
  + #emph[For every real $z gt.eq Z$, $H \( - i b \, 6 \, - i z \) eq.not 0$ and 
$ "Re" j \( b \, z \) < .043 . quad "(2.3)" $ <free:exterior-bounds>

 For $z gt.eq 3$ one also has $"Im" j \( b \, z \) > 0$.]
  + #emph[For $ell in { 0 \, 1 \, 2 \, dots.h }$ and $h in { 1 \, - 1 }$ define 
$ q_h = lambda + ell \/ 2 - h i b \, #h(2em) J_h \( lambda \) = vec(H \( q_h \, 6 + ell \, - h i Z \), - H' \( q_h \, 6 + ell \, - h i Z \)) . quad "(2.4)" $ <free:jet>

 The columns $J_h$ are holomorphic and nonzero on a neighborhood of $"Re" lambda gt.eq - 1 \/ 32$. The determinant $Delta_ell \( lambda \; b \, Z \) = det \( J_(+) \( lambda \) \, J_(-) \( lambda \) \)$ has no zero on $"Re" lambda = - 1 \/ 32$. In the closed half-plane $"Re" lambda gt.eq - 1 \/ 32$ its numbers of zeros, counted with holomorphic multiplicity, are 
$ ell & 0 & 1 & ell gt.eq 2\
\# { Delta_ell = 0 } & 2 & 1 & 0 . $

]
  #emph[The locations of the symmetry zeros are identified later at parameters where $j \( b \, Z \) = 0$; the count in this proposition holds on the entire disk.]
] <free:main>

=== 2.1 The slow solution and the Laguerre cone <the-slow-solution-and-the-laguerre-cone>

The function $H \( q \, m \, x \)$ below is Tricomi’s confluent hypergeometric function $U \( q \, m \, x \)$; see #cite(label("DLMF")) Equations 13.4.4 and 13.3.22. We prove the regularized representation and the uniform symbol bounds needed on the imaginary rays.

#thm([Lemma 2.2.])[
  (Regularized slow solution).  #emph[For $"Re" q > - 1$, $"Re" x gt.eq 0$, $x eq.not 0$, define, with principal powers, 
$ H \( q \, m \, x \) = x^(- q) {1 + frac(1, Gamma \( q \)) integral_0^oo e^(- u) u^(q - 1) [\( 1 + u \/ x \)^(m - 1 - q) - 1] thin d u} . quad "(2.5)" $ <free:H-definition>

 Here $m$ may in particular be any positive integer used below. This definition is holomorphic in $q$, including $q = 0$, and in $x$ on the interior of the indicated region, with holomorphic continuation across each nonzero point of its imaginary boundary. Primes on $H$ denote derivatives in its last argument. It satisfies 
$ x H'' + \( m - x \) H' - q H = 0 \, #h(2em) H' \( q \, m \, x \) = - q H \( q + 1 \, m + 1 \, x \) \, #h(2em) H \( 0 \, m \, x \) = 1 . quad "(2.6)" $ <free:H-equation>

 For every $N gt.eq 1$ it has the expansion 
$ H \( q \, m \, x \) = x^(- q) {sum_(j = 0)^(N - 1) frac(\( - 1 \)^j \( q \)_j \( 1 + q - m \)_j, j ! x^j) + O \( \| x \|^(- N) \)} . quad "(2.7)" $ <free:H-expansion>

 Here $\( q \)_0 = 1$ and $\( q \)_j = product_(n = 0)^(j - 1) \( q + n \)$ for $j gt.eq 1$. The expansion is uniform for $"Re" x gt.eq 0$, $\| x \| gt.eq 1$, and compact parameter sets. The same remainder estimate holds after any fixed number of $x partial_x$ derivatives of the bracket. The symbol expansion specifies the slow solution, without an oscillatory component on the imaginary rays.]
] <free:slow>

#proof[
  The bracket in the integrand of (2.5) is $O \( u \)$ at zero, locally uniformly in the parameters; at infinity it and its parameter derivatives grow at most polynomially, with additional powers of $log u$. Thus the regularized integral is locally holomorphic for $"Re" q > - 1$. The reciprocal gamma function vanishes at zero, which proves the last assertion in (2.6).
  For $"Re" q > 0$ the expression in braces can be combined into the usual integral. On $x > 0$, substitution $u = x v$ gives
  $ H \( q \, m \, x \) = frac(1, Gamma \( q \)) integral_0^oo e^(- x v) v^(q - 1) \( 1 + v \)^(m - 1 - q) thin d v . $
  Differentiation and integration by parts prove both the equation and the derivative identity; holomorphic continuation proves them on the stated domain. The branches in the regularized integral are regular on a neighborhood of each nonzero imaginary $x$, so the boundary values used in the matching problem are genuine holomorphic values.
  To obtain (2.7), split the integral at $u = \| x \| \/ 2$. Taylor’s formula applies uniformly to $\( 1 + u \/ x \)^(m - 1 - q)$ on the first piece. Its $j$th coefficient integrates to $\( - 1 \)^j \( q \)_j \( 1 + q - m \)_j \/ j !$. On the second piece the exponential weight bounds the integral by any prescribed inverse power of $\| x \|$; the same argument applies after symbol differentiation. This proves the full assertion about remainders. For completeness, the other local solution at infinity obtained by reduction of order has the form $e^x x^(q - m)$ times an inverse-power expansion. On either imaginary ray its repeated symbol derivatives acquire arbitrarily high powers of $\| x \|$. It therefore cannot be added to (2.7) while preserving all its symbol estimates. This also explains the slow normalization on the rays. ◻
]

Fix $h \, ell \, b \, Z$ and write

$ M = ell + 5 \, quad s = h i Z \, quad q = lambda + ell \/ 2 - h i b \, quad G \( t \) = H \( q \, M + 1 \, t - s \) quad \( t gt.eq 0 \) . $

All parameter analyticity statements below concern $lambda$; estimates are locally uniform in the other displayed parameters.

#thm([Lemma 2.3.])[
  (Laguerre recurrence).  #emph[Let $L_n \( t \) = e^t partial_t^n \( e^(- t) t^n \) \/ n !$ be the Laguerre polynomials, orthonormal for $e^(- t) thin d t$ on $\[ 0 \, oo \)$. Write 
$ G = sum_(n gt.eq 0) g_n L_n \, #h(2em) B_n = sum_(k gt.eq n) g_k \, #h(2em) C_n = sum_(k gt.eq n) \( k - n \) g_k . $

 These series and their parameter derivatives converge rapidly. With $t_n = q + n$ and $d_n = t_n - M$, one has 
$ & \( B_0 \, C_0 \) = \( G \( 0 \) \, - G' \( 0 \) \) \,\
 & t_n g_n = - M B_(n + 1) - s C_n \, #h(2em) d_n B_(n + 1) = t_n B_n + s C_n \, #h(2em) C_(n + 1) = C_n - B_(n + 1) . quad "(2.8)" $ <free:initial-tail>

 The real quadratic form 
$ p_n = M / 2 \| B_n \|^2 + "Re" \( s overline(B_n) C_n \) quad "(2.9)" $ <free:cone-form>

 satisfies the exact identity 
$ p_(n + 1) - p_n = \( "Re" lambda + n - 5 \/ 2 \) \| g_n \|^2 . quad "(2.10)" $ <free:cone-increment>

]
] <free:laguerre>

#proof[
  Integration by parts gives orthonormality and $\[ t partial_t^2 + \( 1 - t \) partial_t \] L_n = - n L_n$. Polynomials are complete: a function orthogonal to all powers has a Laplace transform whose derivatives vanish at an interior point of its domain of holomorphy, hence its Laplace transform, and then the function, vanishes. The function $G$ and all its derivatives are smooth at zero and of polynomial growth at infinity by Lemma 4. Repeated integration by parts with this Laguerre operator shows that $g_n$, and the Laguerre coefficients of each derivative of $G$, decrease faster than every inverse power of $n$. The boundary terms vanish because the coefficient of the derivative at zero is $t$, and the weight at infinity is exponential. These arguments are uniform on compact parameter sets, also after holomorphic differentiation.
  The generating function gives, initially for $0 lt.eq x < 1$,
  $ sum_(n gt.eq 0) g_n x^n = integral_0^oo e^(- u) G \( \( 1 - x \) u \) thin d u . $
  Taking its value and first derivative as $x arrow.t 1$ proves (2.8). Since $L'_k = - sum_(n < k) L_n$, the coefficients of $G'$ are $- B_(n + 1)$, whereas those of $G'' - G'$ are $C_n$. Rewriting the differential equation as
  $ \[ t partial_t^2 + \( 1 - t \) partial_t \] G + M G' - s \( G'' - G' \) - q G = 0 $
  proves the first recurrence. The other two follow from $g_n = B_n - B_(n + 1)$ and the definition of $C_n$.
  Finally insert $B_(n + 1) = B_n - g_n$ and $C_(n + 1) = C_n - B_(n + 1)$ into (2.9). Since $s$ is purely imaginary, the cross term $"Re" \( s \| B_(n + 1) \|^2 \)$ vanishes. Use $t_n g_n = - M B_(n + 1) - s C_n$ to simplify the remaining terms. The coefficient of $\| g_n \|^2$ becomes $"Re" t_n - M \/ 2 = "Re" lambda + n - 5 \/ 2$, which is (2.10). ◻
]

#thm([Lemma 2.4.])[
  (Strict normalized cone).  #emph[Suppose $"Re" lambda gt.eq - 1 \/ 32$ and $K gt.eq 3$. For $n gt.eq K$ the normalized coefficients $hat(g)_n = g_n \/ \( q \)_K$, and their sums $hat(B)_K = B_K \/ \( q \)_K$, $hat(C)_K = C_K \/ \( q \)_K$, extend holomorphically across $q = 0$. They satisfy 
$ M / 2 \| hat(B)_K \|^2 + "Re" \( s overline(hat(B)_K) hat(C)_K \) = - sum_(n gt.eq K) \( "Re" lambda + n - 5 \/ 2 \) \| hat(g)_n \|^2 < 0 . quad "(2.11)" $ <free:strict-cone>

 Consequently $hat(C)_K eq.not 0$, and 
$ R_h = hat(B)_K \/ hat(C)_K quad upright("is holomorphic") \, #h(2em) \| R_h + s \/ M \| < Z \/ M . quad "(2.12)" $ <free:tail-disk>

]
] <free:cone>

#proof[
  The only zero of $\( q \)_K$ in the specified half-plane is $q = 0$, and it is simple. It can occur only for $ell = 0$. At this point $G = 1$, so every $g_n$ with $n gt.eq 1$ vanishes. Holomorphic division therefore removes the apparent singularity for $n gt.eq K$. Local Cauchy estimates preserve the rapid decay established above, justifying division of the sums and continuation of their identities.
  The normalized tail cannot vanish identically in its sequence index. Indeed repeated use of (2.6) gives
  $ frac(partial_t^K G, \( q \)_K) = \( - 1 \)^K H \( q + K \, M + 1 + K \, t - s \) . quad "(2.13)" $ <free:normalized-derivative>
  The right side is nonzero by its leading asymptotic coefficient, also at $q = 0$. If all normalized coefficients with $n gt.eq K$ vanished, the function $\[ G - sum_(n < K) g_n L_n \] \/ \( q \)_K$, with its removable value at zero, would vanish. Its $K$th derivative would be zero, contradicting (2.13).
  Sum (2.10) from $K$ to infinity and divide by $\| \( q \)_K \|^2$, taking the removable value when necessary. Rapid decay makes the limiting form zero. Each weight in the resulting sum is positive because $K gt.eq 3$ and $"Re" lambda gt.eq - 1 \/ 32$. The preceding nontriviality gives strictness in (2.11). If $hat(C)_K$ were zero the left side would be nonnegative. Dividing by its nonzero squared modulus and completing the square proves (2.12). ◻
]

#thm([Lemma 2.5.])[
  (Analytic matching columns).  #emph[Define 
$ F_n = mat(delim: "(", d_n - s, - s; t_n, t_n) \, #h(2em) P_K = F_0 F_1 dots.h.c F_(K - 1) . quad "(2.14)" $ <free:backward>

 Then, including parameters where an individual $t_n$ or $d_n$ vanishes, 
$ P_K vec(R_h, 1) = 1 / hat(C)_K vec(H \( q \, M + 1 \, - s \), - H' \( q \, M + 1 \, - s \)) . quad "(2.15)" $ <free:column-identity>

 The scalar on the right is holomorphic and nonzero. The column is nonzero.]
] <free:columns>

#proof[
  The recurrences imply the division-free identity $F_n \( B_(n + 1) \, C_(n + 1) \)^t = t_n \( B_n \, C_n \)^t$. Multiplying gives $P_K \( B_K \, C_K \)^t = \( q \)_K \( B_0 \, C_0 \)^t$. Divide by $\( q \)_K$ and use Lemma 6; analytic continuation gives the identity at the removable point. A simultaneous zero of $H$ and $H'$ at $x = - s eq.not 0$ would, by uniqueness for its second order equation, make $H$ identically zero, contrary to (2.7). ◻
]

=== 2.2 Exclusion of high angular degrees <exclusion-of-high-angular-degrees>

#thm([Lemma 2.6.])[
  #emph[For $\( b \, Z \) in cal(D)$, $ell gt.eq 4$, and $"Re" lambda gt.eq - 1 \/ 32$, one has $Delta_ell \( lambda \; b \, Z \) eq.not 0$.]
] <free:high-angular>

#proof[
  Suppose the determinant vanished. Since the two columns are nonzero, multiply their functions by nonzero constants to arrange $H_(+) \( - i Z \) = H_(-) \( i Z \)$ and $H'_(+) \( - i Z \) = H'_(-) \( i Z \)$. Here $H_h \( x \)$ denotes the resulting multiple of $H \( lambda + ell \/ 2 - h i b \, M + 1 \, x \)$ and $M = ell + 5 gt.eq 9$. The substitution $U_h = e^(- x \/ 2) x^(M \/ 2) H_h$ gives
  $ - \( x partial_x U_h \)_x + (x / 4 + frac(M^2, 4 x)) U_h = \( 3 - lambda + h i b \) U_h . quad "(2.16)" $ <free:gauged>
  Integrate this equation along the conjugate paths
  $ x_h \( eta \) = u - h i v \, quad x_h \( 0 \) = - h i Z \, quad g_h = x'_h = e^(- h i theta.alt) \,\
theta.alt = min \( 2 eta \, theta.alt_0 \) \, quad cos theta.alt_0 = 99 / 101 \, quad sin theta.alt_0 = 20 / 101 . $
  Write $eta_0 = theta.alt_0 \/ 2$ and
  $ x_h \/ g_h^2 = L + h i N \, #h(2em) L = u cos \( 2 theta.alt \) + v sin \( 2 theta.alt \) \, quad N = u sin \( 2 theta.alt \) - v cos \( 2 theta.alt \) . $
  In particular $L > 0$ for $eta > 0$ and
  $ L' = cos theta.alt - 2 theta.alt' N \, #h(2em) N' = sin theta.alt + 2 theta.alt' L . $
  The real part of $x$ tends to $+ oo$ linearly, so the exponential factor in $U_h$ justifies every boundary limit and integration below.
  For a bounded real function $alpha$, smooth on each side of $eta_0$, put $B_c = alpha L + theta.alt' N \/ 2$. Pair (2.16) with $overline(U)_h thin d eta$ and take real parts. The kinetic expression after integration by parts is
  $ L \| U'_h \|^2 + "Re" #scale(x: 120%, y: 120%)[\(] h i theta.alt' \( L + h i N \) overline(U)_h U'_h #scale(x: 120%, y: 120%)[\)] . $
  Completing the square writes this as $L \| U'_h + \( alpha - h i theta.alt' \/ 2 \) U_h \|^2 - B_c \( \| U_h \|^2 \)' - L \( alpha^2 + theta.alt' ""^2 \/ 4 \) \| U_h \|^2$. The real lower endpoint terms before this completion sum to $sum_h \( M \/ 2 \) \| U_h \( 0 \) \|^2$. To see the cancellation, expand $x overline(U)_h partial_x U_h$ using $U_h = e^(- x \/ 2) x^(M \/ 2) H_h$: the terms containing $x overline(H)_h H'_h$ cancel between the two matched jets, and the real contribution from the gauge is $M \/ 2$. Since $B_c \( 0 \) = - Z$, integration of the displayed derivative, separately on the two path pieces, now yields
  $ 0 = sum_(h = plus.minus 1) { & \( M \/ 2 - Z \) \| U_h \( 0 \) \|^2 + \[ B_c \( eta_0 + \) - B_c \( eta_0 - \) \] \| U_h \( eta_0 \) \|^2\
 & + integral_0^oo [L \| U'_h + \( alpha - h i theta.alt' \/ 2 \) U_h \|^2 + V_c \| U_h \|^2] thin d eta } \, quad "(2.17)" $ <free:multiplier-identity>
  where, with $sigma = "Re" lambda$,
  $ V_c = sigma - 3 + u / 4 + frac(M^2 u, 4 \( u^2 + v^2 \)) + frac(theta.alt' sin theta.alt, 2) + 3 / 4 L theta.alt' ""^2 + \( alpha L \)' - L alpha^2 . quad "(2.18)" $ <free:multiplier-potential>
  There is no missing corner term: it is precisely the jump displayed in (2.17).
  On the arc take $alpha = .3$. Here $u = sin theta.alt \/ 2$, $v = Z + \( 1 - cos theta.alt \) \/ 2$, and
  $ u lt.eq .1 \, #h(2em) 2.70 < v < 2.72 \, #h(2em) N lt.eq .04 - 2.70 dot.op .92 = - 2.444 \, #h(2em) L' > 10.7 . $
  It follows directly from (2.18), dropping its nonnegative $u$ terms and sine term, that $V_c > - 3 - 1 \/ 32 + .3 \( 10.7 \) + \( 3 - .09 \) L > 0$. At the join $1.13 < L \( eta_0 \) < 1.19$. On the straight piece, with $t = eta - eta_0$, choose
  $ alpha L = - 1.5 + frac(5 t, 1 + 1.5 t) . $
  The jump is $- 1.5 - .3 L \( eta_0 \) - N \( eta_0 \) > 0$. The geometry of the ray gives
  $ u_0 = .099 + .98 t lt.eq u lt.eq .100 + .981 t \, #h(2em) v lt.eq 2.72 + .20 t \, #h(2em) L gt.eq L_0 = 1.13 + .98 t . $
  Set $d_0 = \( .100 + .981 t \)^2 + \( 2.72 + .20 t \)^2$ and $q_0 = 1 + 1.5 t$. Since $M^2 gt.eq 81$, $V_c L_0 d_0 q_0^2$ is bounded below by
  $ P \( t \) =  & \( - 3 - 1 \/ 32 + u_0 \/ 4 \) L_0 d_0 q_0^2 + 81 / 4 u_0 L_0 q_0^2 + 5 L_0 d_0 - \( - 1.5 + 2.75 t \)^2 d_0\
> & 2 + t \( 33 - 72.2 t + 44.8 t^2 \) + t^4 \( 17.9 - 4.61 t + .54 t^2 \) > 0 . quad "(2.19)" $ <free:high-polynomial>
  The first strict comparison is coefficientwise exact arithmetic; the last two quadratic discriminants are $- 17519 \/ 25$ and $- 174119 \/ 10000$. Appendix 7.4 provides the full polynomial recipe and verifier. Thus all terms of (2.17) are nonnegative, the bulk potential is strictly positive, and $M \/ 2 > Z$. It follows that $U_h = 0$, a contradiction. ◻
]

=== 2.3 Boundary homotopy and the low angular counts <boundary-homotopy-and-the-low-angular-counts>

We use $K = 8$ for $0 lt.eq ell lt.eq 3$. For $0 lt.eq rho lt.eq 1$ replace the tail ratio in (2.15) by $rho R_h$. The closure of the disk in (2.12) is convex and contains zero, so every terminal pair $\( rho R_h \, 1 \)$ satisfies $p_K lt.eq 0$. The resulting columns are holomorphic functions of $lambda$, continuous in $rho$. We must exclude determinant zeros on a common counting contour.

#thm([Lemma 2.7.])[
  (Counting boundary).  #emph[There is a rectangle with left edge $"Re" lambda = - 1 \/ 32$ and other edges sufficiently far to the right and above and below, uniformly for $\( b \, Z \) in cal(D)$ and $0 lt.eq rho lt.eq 1$, on whose boundary the homotoped determinant is nonzero. The same exclusions hold on every larger such rectangle.]
] <free:boundary>

#proof[
  Choose the edges so that $t_n \, d_n eq.not 0$ for $n < 8$ on them. If the columns became dependent at such a point, their nonzero common initial jet $\( B_0 \, C_0 \)$ would have two forward images satisfying $p_(8 \, h) lt.eq 0$. Indeed the backward matrices are invertible there and their inverses are exactly the forward recurrences, up to nonzero scalar factors. For the same initial jet in both channels,
  $ p_(8 \, +) + p_(8 \, -) = M \| B_0 \|^2 + sum_(h = plus.minus 1) sum_(n = 0)^7 \( sigma + n - 5 \/ 2 \) \| g_(n \, h) \|^2 . quad "(2.20)" $ <free:summed-increment>
  For $sigma > 5 \/ 2$ all increment weights are positive. If $B_0 eq.not 0$ the first term is positive; if $B_0 = 0$ and $C_0 eq.not 0$, then $g_(0 \, h) = - s_h C_0 \/ d_(0 \, h) eq.not 0$. This excludes the right edge, which can be taken beyond every possible zero of its divisors.
  For the horizontal edges let $v = "Im" lambda$, $C_0 = v c$, and normalize $\| B_0 \|^2 + \| c \|^2 = 1$. Uniformly for $sigma$ in a bounded interval and $n < 8$,
  $ g_(0 \, h) = - \( M B_0 + s_h C_0 \) \/ d_(0 \, h) = - h Z c + o \( 1 \) \, #h(2em) g_(n + 1 \, h) = frac(t_(n \, h) g_(n \, h) + s_h B_(n + 1 \, h), d_(n + 1 \, h)) = g_(n \, h) + o \( 1 \) . $
  Consequently (2.20) equals
  $ M \| B_0 \|^2 + 2 \( 8 sigma + 8 \) Z^2 \| c \|^2 + o \( 1 \) > 0 $
  for large $\| v \|$, since $8 sigma + 8 gt.eq 31 \/ 4$. This proves the two horizontal exclusions uniformly.
  For the left edge set $s = i Z$ and form the forward matrix without its divisors:
  $ T = T_(K - 1) dots.h.c T_0 \, #h(2em) T_n = mat(delim: "(", t_n, s; - t_n, d_n - s) \, #h(2em) K = 8 . quad "(2.21)" $ <free:forward-matrix>
  Thus the actual forward jet is $T \( B_0 \, C_0 \)^t \/ product_(n < K) d_n$. Define
  $ sans(H) \( v \) = T^(*) mat(delim: "(", M, s; - s, 0) T \, #h(2em) sans(S) \( v \) = sans(H) \( v \) + overline(sans(H) \( - v \)) . quad "(2.22)" $ <free:boundary-form>
  The second summand is the form for $h = - 1$. Each summand evaluates to $2 \| product d_(n \, h) \|^2 p_(K \, h)$ on the common initial pair. We shall prove $sans(S) \( v \) > 0$ for every real $v$, excluding the two simultaneous nonpositive values.
  First, its determinant is a real even polynomial of degree at most $4 K - 2 = 30$ for every real $\( b \, Z \)$ in the parameter box. Hermitian symmetry gives real diagonal entries, and the reflection in (2.22) makes the diagonal entries even and the off-diagonal entry satisfy $C \( - v \) = overline(C \( v \))$. To check the degree bound structurally, hold the initial jet fixed and let $\| v \| arrow.r oo$. The forward recurrences give $g_(n \, h) = O \( \( \| B_0 \| + \| C_0 \| \) \/ \| v \| \)$ for $n < K$. Also $\| product d_(n \, h) \|^2 = \| v \|^(2 K) \( 1 + O \( 1 \/ \| v \| \) \)$. Using (2.10), each form divided by $\| v \|^(2 K)$ has its initial cone form as leading term and an $O \( v^(- 2) \)$ increment. The opposite initial cross terms cancel in their sum. Thus the first diagonal, off-diagonal, and second diagonal entries of $sans(S) \/ \| v \|^(2 K)$ have respective orders $O \( 1 \)$, $O \( v^(- 1) \)$, $O \( v^(- 2) \)$. This proves the degree bound, independently of any cancellation at a central parameter value. Its first diagonal is positive for sufficiently large $\| v \|$.
  The exact coefficient calculation in Appendix 7.2 proves $det sans(S) \( v \) > 0$ for all real $v$ and all parameters in $cal(D)$. A continuous Hermitian matrix with strictly positive determinant cannot change its signature. Its positive first diagonal at large $\| v \|$ therefore implies $sans(S) \( v \) > 0$ on the whole line. This completes the left-edge exclusion and the proof. ◻
]

#thm([Lemma 2.8.])[
  (Winding count).  #emph[For $0 lt.eq ell lt.eq 3$ the zero counts in Proposition 3 are $2 \, 1 \, 0 \, 0$, respectively.]
] <free:winding>

#proof[
  Lemma 9 and the argument principle preserve total zero multiplicity throughout $rho : 1 arrow.r 0$. At $rho = 1$, Lemma 7 identifies this count with the true matching determinant by nonzero holomorphic scalar factors. Individual homotoped columns may vanish at interior singular factors of $P_K$; these are zeros of a holomorphic determinant and do not affect the boundary argument. No assertion of interior nonvanishing is needed.
  We may also move $\( b \, Z \)$ to $\( B \/ H_0 \, S \/ H_0 \)$, where $H_0 = 10^8$, $B = 33477607$, $S = 270506819$. This point lies in $cal(D)$, and the preceding exclusions hold on the connecting segment. At zero tail ratio, put $lambda = - 1 \/ 32 + X$ and let $\( tilde(x) \, tilde(y) \)^t = P_K \( 0 \, 1 \)^t$ in channel $h = 1$. The real polynomial
  $ P_ell \( X \) = "Im"_(upright("coeff")) \( tilde(x) \( X \) overline(tilde(y)) \( X \) \) $
  is a nonzero constant multiple of the determinant; the bar here conjugates coefficients. Induction in the backward recurrence shows that its degree is $15 = 2 K - 1$, with unscaled leading coefficient $- K Z$: $tilde(y)$ has leading term $X^K$ and $tilde(x)$ has leading term $- K i Z X^(K - 1)$. Write
  $ P_ell \( i v \) = cal(R)_ell \( v^2 \) + i v cal(I)_ell \( v^2 \) . quad "(2.23)" $ <free:axis-polynomials>
  Both real polynomials have degree at most seven.
  The rational signs in Appendix 7.3 give the following root counts; all roots in the table are simple:
  $ & upright("positive roots") &  & upright("negative roots") & \
ell & cal(R)_ell & cal(I)_ell & cal(R)_ell & cal(I)_ell\
0 & 5 & 6 & 2 & 1\
1 & 6 & 6 & 1 & 1\
2 \, 3 & 7 & 7 & 0 & 0 $
  Here is why signs alone suffice. Successive positive separators have alternating one-coordinate sign changes, following the quadrant cycle $+ + \, - + \, - - \, + -$. They therefore give the listed distinct positive roots, interlaced between the two polynomials. For $ell = 0 \, 1$ the additional values at $- 1 \/ 4 \, - 4$ supply the listed negative roots. These distinct roots exhaust each degree bound of seven. Hence there are no further roots, none repeated, and no unrecorded axis crossings.
  The curve $P_ell \( i v \)$ for $v > 0$ crosses each successive axis in the positive rotational direction and finishes in the first quadrant. Let $n = 5 \, 6 \, 7$ be the positive root count of $cal(R)_ell$. Starting with the real value at zero and using the final odd-degree asymptotic, the continuous argument change on $\[ 0 \, oo \)$ is $\( n + 1 \/ 2 \) pi$. This also follows by counting the consecutive quadrants from the initial signs $- +$, $+ +$, $- -$ in the three rows. Conjugation doubles that change on the full oriented imaginary axis. A single factor $i v - z$ contributes $+ pi$ if $"Re" z < 0$ and $- pi$ if $"Re" z > 0$. Thus
  $ N_(upright("left")) - N_(upright("right")) = 2 n + 1 \, #h(2em) N_(upright("left")) + N_(upright("right")) = 15 \, $
  and $N_(upright("right")) = \( 15 - \( 2 n + 1 \) \) \/ 2 = 2 \, 1 \, 0$. The counting boundary has no zeros, so these are also the counts in the closed half-plane. The count transfers back by the homotopies. ◻
]

=== 2.4 Profile degree and nonvanishing of the exterior <profile-degree-and-nonvanishing-of-the-exterior>

#thm([Lemma 2.9.])[
  (Profile matching degree).  #emph[The first conclusion of Proposition 3 holds. More precisely there is an invertible real-linear map $cal(L) : bb(R)^2 arrow.r bb(C)$ with negative determinant and minimum stretch greater than $.048$ such that 
$ \| j \( b \, Z \) - cal(L) \( b - b_(*) \, Z - Z_(*) \) \| < 2.5 dot.op 10^(- 11) #h(2em) \( \( b \, Z \) in cal(D) \) . quad "(2.24)" $ <free:profile-linearization>

 In particular $\| j \| > 4.55 dot.op 10^(- 10)$ on $partial cal(D)$.]
] <free:profile-degree>

#proof[
  Use $h = 1$, $ell = lambda = 0$, $K = 34$ in (2.14), dividing its $n$th factor by $n + 1$, and call the resulting product $L \( b \, Z \)$. Set
  $ U_0 = L \( b_(*) \, Z_(*) \) \, quad X_0 = partial_b L \( b_(*) \, Z_(*) \) \, quad Y_0 = partial_Z L \( b_(*) \, Z_(*) \) \, quad m_0 = \( U_0 \)_01 . $
  All matrix indices here are zero-based. The exact rational enclosures of Appendix 7.5 give
  $ 9 < \| m_0 \| < 10 \, #h(2em) \( U_0 \)_00 \/ m_0 in \( 2.835 \, 2.837 \) + i \( 1.426 \, 1.428 \) \,\
\| \( U_0 \)_11 \/ m_0 \| < 10^(- 12) \, #h(2em) \( X_0 \)_11 \/ m_0 in \( - .0811 \, - .0810 \) + i \( .1361 \, .1363 \) \,\
\( Y_0 \)_11 \/ m_0 in \( - .0001 \, .0001 \) + i \( .1237 \, .1240 \) \,\
max_(i \, j) \| \( X_0 \)_(i j) \/ m_0 \| \, max_(i \, j) \| \( Y_0 \)_(i j) \/ m_0 \| < 20 \,\
max_(i \, j) \| L_(i j) - \( U_0 \)_(i j) - \( b - b_(*) \) \( X_0 \)_(i j) - \( Z - Z_(*) \) \( Y_0 \)_(i j) \| < 50000 \| m_0 \| delta^2 \,\
\| det L \| < 6.2 dot.op 10^(- 12) \| m_0 \|^2 . quad "(2.25)" $ <free:profile-enclosures>
  The same certificate, propagating these estimates by rational inequalities, gives
  $ \| L_01 - i Z L_00 \/ 5 \| - Z \| L_00 \| \/ 5 > .6 \| m_0 \| \, #h(2em) \| L_01 \/ m_0 - 1 \| < 5 dot.op 10^(- 7) . quad "(2.26)" $ <free:denominator-gap>
  Since the tail ratio lies in the disk with center $- i Z \/ 5$ and radius $Z \/ 5$, the first component $L_00 R_(+) + L_01$ cannot vanish. Lemma 7 proves the desired nonvanishing of $H$ before we take its logarithmic derivative.
  The second-to-first component ratio is $j \( b \, Z \)$. Subtracting its value at zero tail gives the exact identity
  $ j - L_11 / L_01 = - frac(R_(+) det L, L_01 \( L_00 R_(+) + L_01 \)) . $
  Using $\| R_(+) \| lt.eq 2 Z \/ 5$ and (2.26) bounds its modulus by
  $ frac(\( 2 Z \/ 5 \) \| det L \|, .6 \| m_0 \| thin \| L_01 \|) . $
  Define
  $ cal(L) \( eta \, zeta \) = eta frac(\( X_0 \)_11, m_0) + zeta frac(\( Y_0 \)_11, m_0) . $
  Appendix 7.5 gives the exact propagation of the displayed bounds to (2.24), the minimum stretch bound, and $\| cal(L) \( eta \, zeta \) \| lt.eq .283 delta$ on the disk. Its determinant is negative already from the two enclosing rectangles. The boundary size of the linear map exceeds $.048 delta = 4.8 dot.op 10^(- 10)$; subtracting the error proves the stated boundary margin. Straight homotopy to $cal(L)$ avoids zero on the boundary, so its degree is $- 1$. Finally $.283 delta + 2.5 dot.op 10^(- 11) < 3 dot.op 10^(- 9)$ proves the disk bound. ◻
]

#thm([Lemma 2.10.])[
  (Exterior inequalities).  #emph[For $\( b \, Z \) in cal(D)$, $H \( - i b \, 6 \, - i z \)$ is nonzero for all $z gt.eq Z$, and the inequalities in (2.3) and $"Im" j \( b \, z \) > 0$ for $z gt.eq 3$ hold. In radial variables, for any nonzero constant multiple $Q \( r \)$ of $H \( - i b \, 6 \, - i r^2 \/ 4 \)$, 
$ A' / A = - r / 2 "Im" j \( b \, r^2 \/ 4 \) \, #h(2em) w / r = 1 / 2 + "Re" j \( b \, r^2 \/ 4 \) \, quad A = \| Q \| \, quad w = r \/ 2 + 2 partial_r arg Q . quad "(2.27)" $ <free:radial-quotients>

]
] <free:exterior>

#proof[
  Use the forward matrix (2.21) at $lambda = ell = 0$, $s = i z$, $K = 5$, and let
  $ sans(H) = T^(*) mat(delim: "(", 5, i z; - i z, 0) T = mat(delim: "(", A_0, overline(c); c, d_0) . $
  The exact coefficient checks in Appendix 7.6 prove
  $ & d_0 > 0 \, #h(2em) .043 d_0 + "Re" c - 1130 z > 0 &  & \( z gt.eq 2.704 \) \,\
 & - "Im" c - 1130 z > 0 &  & \( z gt.eq 3 \) \,\
 & \| det T \| = product_(n = 0)^4 \| t_n d_n \| < 1130 . quad "(2.28)" $ <free:exterior-forms>
  Every $b$ in the disk is positive, so all forward divisors are nonzero. The exact jet has nonpositive terminal cone form, hence $J^(*) sans(H) J lt.eq 0$. If its first component were zero, positivity of $d_0$ would force its second component to be zero, contradicting Lemma 7. Thus $j$ is well defined. Moreover
  $ det sans(H) = - z^2 \| det T \|^2 \, #h(2em) lr(|j + c / d_0|) lt.eq frac(z \| det T \|, d_0) . $
  Taking the largest possible real part and smallest possible imaginary part in this disk, and using (2.28), proves the assertions. All $Z$ in (2.2) exceed $2.704$. Finally $Q' \/ Q = \( i r \/ 2 \) j$ gives (2.27). ◻
]

Proposition 3 now follows from Lemmas 8, 10, 11, and 12.

== 3 Smooth profiles with a pressurized core <sec:profiles>

We work in dimension $12$. The small parameter is $a > 0$; later we fix $a = \( p - 1 \)^(- 1)$ with $p$ an odd integer. In this section $a$ may take every sufficiently small positive real value. The profiles never vanish, so the nonlinearity is smooth along them even without the restriction on $p$. We use the parameter disk from Proposition 3; all terminating decimals below denote exact rational numbers. Thus

$ cal(D) = { \( b \, Z \) : \| \( b \, Z \) - \( b_(*) \, Z_(*) \) \| lt.eq 10^(- 8) } \, #h(2em) b_(*) = .33477606871236 \, quad Z_(*) = 2.70506819293654 . $

Put

$ epsilon = 10^(- 4) \, #h(2em) r_b = 2 sqrt(Z_(*)) + epsilon \, #h(2em) R \( Z \) = 2 sqrt(Z) \, #h(2em) r_0 = r_b - 6 epsilon . quad "(3.1)" $ <profile:radii>

The radius $r_b$ is fixed throughout the construction.

=== 3.1 Similarity variables and the amplitude equations <similarity-variables-and-the-amplitude-equations>

For $tau = T - t$, $s = log \( T \/ tau \)$ and $y = \( x - x_(*) \) \/ sqrt(tau)$, write

$ u \( t \, x \) = e^(i theta) tau^(- a) \( tau \/ T \)^(i b) U \( s \, y \) . $

Since $partial_t s = tau^(- 1)$ and $partial_t y = y \/ \( 2 tau \)$, substitution into the defocusing equation gives

$ i partial_s U + Delta U + i (frac(y dot.op nabla, 2) + a) U + b U = \| U \|^(1 \/ a) U . quad "(3.2)" $ <profile:similarity>

We seek a nonvanishing radial stationary solution $Q = A e^(i phi.alt)$, with $A > 0$ and $phi.alt \( 0 \) = 0$. Throughout this section a prime denotes a radial derivative, except when explicitly attached to the last argument of $H$. Set

$ P = A^(1 \/ a) \, quad mu = A^2 \, quad c_(*) = 6 - 2 a \, quad w = r / 2 + 2 phi.alt' \, quad D = r partial_r . quad "(3.3)" $ <profile:notation>

The same letter $w$ denotes the vector field $w \( r \) y \/ r$, extended smoothly at zero, and $W = w dot.op nabla$. The imaginary part of the stationary equation is

$ 2 A' / A phi.alt' + phi.alt'' + 11 / r phi.alt' + r / 2 A' / A + a = 0 . $

It follows that

$ w \( r \) & = c_(*) r^(- 11) A \( r \)^(- 2) integral_0^r A \( t \)^2 t^11 thin d t \,\
- Delta A + A^(1 + 1 \/ a) & = V A \, #h(2em) V = b + r^2 / 16 - w^2 / 4 \,\
w' & = c_(*) - frac(11 w, r) - 2 w A' / A . quad "(3.4)" $ <profile:amplitude>

Here the integration constant in the first line is zero by regularity at the origin. The real part gives the second line because $phi.alt' ""^2 + r phi.alt' \/ 2 = w^2 \/ 4 - r^2 \/ 16$. In particular,

$ "div" \( mu w \) = c_(*) mu . quad "(3.5)" $ <profile:divergence>

Conversely, positive amplitudes satisfying the first two equations in (3.4), with $A' \( 0 \) = 0$, give a stationary solution by integrating $phi.alt' = \( w - r \/ 2 \) \/ 2$.

Here is the complete profile statement used subsequently. A constant with a subscript $j$ may depend on that fixed derivative order. Uniform statements as $a arrow.b 0$ refer to all profiles selected by the construction, without requiring a continuous selection of their matching parameters.

#thm([Proposition 3.1.])[
  (Profiles and uniform estimates).  #emph[There is $a_0 > 0$ such that, for every $0 < a < a_0$, there are $\( b_a \, Z_a \) in cal(D)$ and a smooth nonvanishing radial stationary solution $Q_a = A_a e^(i phi.alt_a)$ of (3.2), normalized by $Q_a \( 0 \) > 0$. They have the following properties.]
  + #emph[The identities (3.4)–(3.5) hold, $0 < P_a lt.eq 1$, and there are constants $c \, C > 0$, independent of small $a$, such that 
$ C^(- 1) chevron.l r chevron.r^(- 4 a) lt.eq mu_a \( r \) lt.eq C chevron.l r chevron.r^(- 4 a) \, #h(2em) nabla w_a gt.eq c I . quad "(3.6)" $ <profile:coercive-bounds>

]
  + #emph[If $a_n arrow.b 0$ and $\( b_(a_n) \, Z_(a_n) \) arrow.r \( b \, Z \)$, then $j \( b \, Z \) = 0$, where $j$ is the free matching function of Proposition 3. With $R = 2 sqrt(Z)$, the profiles converge in $C^1$ on every compact ball to 
$ Q_0 \( r \) = cases(delim: "{", 1 \, & 0 lt.eq r lt.eq R \,, frac(H \( - i b \, 6 \, - i r^2 \/ 4 \), H \( - i b \, 6 \, - i Z \)) \, & r gt.eq R .) quad "(3.7)" $ <profile:limit>

 The exterior amplitude is strictly decreasing and has a positive limit at infinity. The convergence is $C^oo$ on compact subsets of ${ r > R }$. On every fixed ball, 
$ P_(a_n) med harpoon.rt^(*) med b upright(bold(1))_({ r < R }) quad upright("in ") L^oo \, quad "(3.8)" $ <profile:pressure-limit>

 and $mu_(a_n) \, w_(a_n)$ converge in $C^1$. In particular $P_(a_n) \/ a_n arrow.r 0$ locally uniformly on ${ r > R }$.]
  + #emph[On the fixed exterior $r gt.eq r_b$, 
$ Q_a \( r \) = r^(nu_a) f_a \( r \) \, #h(2em) nu_a = - 2 a + 2 i b_a \, #h(2em) 0 < kappa lt.eq \| f_a \( r \) \| lt.eq rho < 1 \, quad "(3.9)" $ <profile:tail>

 with $kappa \, rho$ independent of $a$. There are coefficients $m_(a \, j)$, with $\| m_(a \, 0) \| gt.eq kappa$, such that for every pair of fixed nonnegative integers $N \, J$, 
$ lr(|D^j (f_a \( r \) - sum_(q = 0)^N m_(a \, q) r^(- 2 q))|) lt.eq C_(N \, J) r^(- 2 N - 2) \, #h(2em) 0 lt.eq j lt.eq J \, quad r gt.eq r_b . quad "(3.10)" $ <profile:symbol-expansion>

 The constants are uniform as $a arrow.b 0$. In particular, 
$ \| D^j \( P_a \/ a \) \| lt.eq eta_j \( a \) r^(- 2) \, #h(2em) \| D^j e^(2 i phi.alt_a) \| lt.eq C_j \, #h(2em) eta_j \( a \) arrow.r 0 quad "(3.11)" $ <profile:exterior-pressure>

 for each fixed $j$. On the inner ball, 
$ W_a \( P_a \/ a \) lt.eq C a \( P_a \/ a \) \, #h(2em) r lt.eq r_b \, quad "(3.12)" $ <profile:pressure-transport>

 whereas $\| W_a \( P_a \/ a \) \| lt.eq eta \( a \) r^(- 2)$ for $r gt.eq r_b$, with $eta \( a \) arrow.r 0$. Consequently the positive part of $W_a \( P_a \/ a \)$ is bounded uniformly on the whole space.]
  + #emph[For each fixed $a$, every Cartesian derivative obeys 
$ \| partial^beta Q_a \( y \) \| lt.eq C_(a \, beta) chevron.l y chevron.r^(- 2 a - \| beta \|) \, #h(2em) lr(|partial^beta #scale(x: 120%, y: 120%)[\(] \( P_a \/ a \) e^(2 i phi.alt_a) #scale(x: 120%, y: 120%)[\)]|) + \| partial^beta \( P_a \/ a \) \| lt.eq C_(a \, beta) chevron.l y chevron.r^(- 2 - \| beta \|) . quad "(3.13)" $ <profile:fixed-power-symbols>

 The time-symmetry combination has the improved exterior order 
$ lr(|D^j (\( a - i b_a + D \/ 2 \) Q_a)|) lt.eq C_j r^(- 2 a - 2) \, #h(2em) r gt.eq r_b . quad "(3.14)" $ <profile:time-symbol>

]
] <profile:existence>

We prove the proposition in stages. The inner problem is solved on the whole parameter disk, as is the slow exterior problem. Only their final matching uses a choice of $\( b_a \, Z_a \)$.

=== 3.2 The inner boundary value problem <the-inner-boundary-value-problem>

Let $F \( r \; b \, R' \)$ solve

$ F'' + (11 / r + frac(i r, 2)) F' + b F = 0 \, #h(2em) F \( R' \) = 1 \, quad F' \( R' \) = 0 \, quad "(3.15)" $ <profile:free-initial>

and set

$ F_(upright("in")) \( r \; b \, Z \) = F \( r \; b \, R \( Z \) \) \, #h(2em) h_b \( b \, Z \) = \| F_(upright("in")) \( r_b \; b \, Z \) \| . $

The subscript on $h_b$ indicates the fixed boundary radius, not dependence on $b$ alone.

#thm([Lemma 3.2.])[
  (The boundary modulus).  #emph[Uniformly on $cal(D)$, 
$ 1 - .2 epsilon^2 < h_b < 1 - .15 epsilon^2 . quad "(3.16)" $ <profile:boundary-gap>

 For fixed $b$ in the projection of $cal(D)$, the function $R' mapsto \| F \( r_b \; b \, R' \) \|$ is strictly increasing on $\[ r_0 \, r_b \)$.]
] <profile:boundary-modulus>

#proof[
  On these intervals the coefficient $11 \/ r + i r \/ 2$ has modulus less than $6$, and $.334 < b < .335$. Put $u = r - R'$, so $0 lt.eq u lt.eq 6 epsilon$. Integrating the two first-order equations in (3.15) gives, by a bootstrap starting at $u = 0$,
  $ \| F' \| lt.eq .35 u \, #h(2em) \| F - 1 \| lt.eq .175 u^2 \, #h(2em) \| F'' + b \| < .003 . $
  For completeness, assuming the first bound up to a first failure gives $\| F - 1 \| lt.eq .175 u^2$ and $\| F'' + b \| lt.eq 6 \( .35 \) u + .335 \( .175 \) u^2 < .0013$; integration then gives $\| F' \| < .337 u < .35 u$, excluding that failure. The displayed weaker $.003$ bound follows as well. Thus
  $ F \( r_b \) = 1 - b / 2 \( r_b - R' \)^2 + E \, #h(2em) \| E \| lt.eq .0015 \( r_b - R' \)^2 . $
  Since $\| R \( Z \) - 2 sqrt(Z_(*)) \| < 10^(- 8)$, taking $R' = R \( Z \)$ proves (3.16), including the negligible quadratic error when passing from the complex value to its modulus.
  Differentiate the initial-value problem with respect to $R'$. The derivative $G = partial_(R') F$ satisfies the same linear equation and has data $G \( R' \) = 0$, $G' \( R' \) = b$. Integration, or the same bootstrap, gives $\| G \( r_b \) \/ \( r_b - R' \) - b \| < .003$. As $F \( r_b \) = 1 + O \( \( r_b - R' \)^2 \)$,
  $ partial_(R') \| F \( r_b \) \| = frac("Re" \( overline(F \( r_b \)) G \( r_b \) \), \| F \( r_b \) \|) > 0 . $
  ◻
]

#thm([Lemma 3.3.])[
  (The inner amplitude).  #emph[For all sufficiently small $a > 0$ and all $\( b \, Z \) in cal(D)$, the system (3.4) has a positive radial solution on $\[ 0 \, r_b \]$ with $A' \( 0 \) = 0$ and $A \( r_b \) = h_b$. Within the bounds 
$ h_b lt.eq A lt.eq .5^a \, quad "(3.17)" $ <profile:inner-bounds>

 it is unique. It depends continuously on $\( b \, Z \)$, and obeys 
$ A \( r \) gt.eq .2^a - .02 \( r - r_0 \)_(+)^2 . quad "(3.18)" $ <profile:bulk-barrier>

 The amplitudes are bounded uniformly in $C^(1 \, 1) \[ 0 \, r_b \]$.]
] <profile:inner>

#proof[
  First take $a$ small enough that $h_b^(1 \/ a) lt.eq .3$ uniformly on the disk; this also ensures $h_b < .5^a$. For a continuous radial input $A$ satisfying (3.17), define $w \, V$ by the first and second lines of (3.4). The useful nonsingular formula is
  $ frac(w \( r \), r) = c_(*) A \( r \)^(- 2) integral_0^1 A \( r s \)^2 s^11 thin d s . quad "(3.19)" $ <profile:w-ratio>
  Since $h_b > .999$, $r_b^2 < 11$, and $a$ is small, it implies
  $ .3 lt.eq V lt.eq .5 \, #h(2em) parallel V \[ A_1 \] - V \[ A_2 \] parallel_oo lt.eq 10 parallel A_1 - A_2 parallel_oo . quad "(3.20)" $ <profile:V-bounds>
  Indeed $c_(*) h_b^2 \/ 12 lt.eq w \/ r lt.eq c_(*) \/ \( 12 h_b^2 \)$; inserting these bounds into $V = b + r^2 \( 1 \/ 16 - \( w \/ r \)^2 \/ 4 \)$ gives the first assertion for small $a$. The Lipschitz constant of $A mapsto w \/ r$ is at most $c_(*) \( 2 h_b^(- 3) + 2 h_b^(- 2) \) \/ 12 < 2.01$; multiplying by $r_b^2 \( sup w \/ r \) \/ 2$ gives a constant less than $10$ for $V$.
  For this prescribed $V$, solve the scalar Dirichlet problem
  $ - Delta H + H^(1 + 1 \/ a) = V H \, #h(2em) H \( r_b \) = h_b \, quad H' \( 0 \) = 0 . quad "(3.21)" $ <profile:scalar-dirichlet>
  The constants $h_b$ and $.5^a$ are respectively a lower and an upper solution. One can obtain $H$ by monotone iteration: choose $L > 0$ so that $t mapsto \( L + V \( r \) \) t - t^(1 + 1 \/ a)$ is increasing on $\[ h_b \, .5^a \]$, and at each step invert $- Delta + L$ with the given boundary value. This inverse is positive by the minimum principle. Its existence, if needed directly in the radial class, follows by minimizing the strictly convex functional $integral \( \| nabla u \|^2 + L \| u \|^2 - 2 f u \) \/ 2$ for zero boundary data; the radial equation then reads $\( r^11 u' \)' = r^11 \( L u - f \)$ and gives the classical solution. Iteration from $h_b$ is increasing and stays below $.5^a$. For fixed $a$ its right sides are uniformly bounded; radial integration gives compactness in $C^1$, and its limit solves (3.21).
  We record a comparison argument that also applies below. The radial Dirichlet inverse of $- Delta$ is
  $ \( K f \) \( r \) = integral_r^(r_b) t^(- 11) integral_0^t s^11 f \( s \) thin d s thin d t \, #h(2em) parallel K parallel_(oo arrow.r oo) = r_b^2 \/ 24 < 11 \/ 24 . $
  Thus the positive geometric series defines $T = \( - Delta - .5 \)^(- 1) = sum_(n gt.eq 0) \( .5 K \)^n K$ with zero boundary values. Also $psi = 1 + K \( 1 + .5 psi \)$ has a positive solution and satisfies $\( - Delta - .5 \) psi = 1$, $psi \( r_b \) = 1$. For every $q gt.eq 0$ and $V lt.eq .5$,
  $ \( - Delta - V + q \) psi gt.eq 1 . $
  If a function with nonnegative boundary values violated the comparison principle for $- Delta - V + q$, its ratio to $psi$ would have a negative interior minimum, where the product rule gives a strictly negative value for that operator. This is a contradiction. Taking $q$ to be the divided difference of $t^(1 + 1 \/ a)$ proves uniqueness in (3.21) and comparison with lower solutions.
  The function $B \( r \) = .2^a - .02 \( r - r_0 \)_(+)^2$ is such a lower solution. For small $a$ it is positive, $B \( r_b \) < h_b$ by (3.16), $B^(1 \/ a) lt.eq .2$, and
  $ - Delta B lt.eq .04 + .44 frac(6 epsilon, r_0) < .05 lt.eq \( .3 - .2 \) B . $
  At $r_0$ the first derivative is continuous, so no interface measure occurs in this inequality. Comparison proves (3.18) for every output $H$.
  Let $H_1 \, H_2$ be outputs for two inputs. Their difference solves
  $ \( - Delta - V_1 + q \) \( H_1 - H_2 \) = \( V_1 - V_2 \) H_2 \, quad q = integral_0^1 \( 1 + 1 \/ a \) \( t H_1 + \( 1 - t \) H_2 \)^(1 \/ a) thin d t . $
  The barrier implies $q gt.eq .2 \/ a$ on $r lt.eq r_0$, whereas $q gt.eq 0$ everywhere. A positive supersolution for unit forcing is
  $ S = 10 a + 2 T upright(bold(1))_({ r > r_0 }) . quad "(3.22)" $ <profile:small-inverse>
  On the inner ball, the constant term contributes at least $2 - 5 a$ and the second term contributes a nonnegative quantity. On the shell, the second term contributes at least $2$, while the constant term is bounded below by $- 5 a$. Thus the comparison principle applies, including at the shell interface. To bound $S$, radial integration gives
  $ parallel K upright(bold(1))_({ r > r_0 }) parallel_oo lt.eq integral_(r_0)^(r_b) \( t - r_0 \) thin d t = \( 6 epsilon \)^2 \/ 2 \, #h(2em) parallel T upright(bold(1))_({ r > r_0 }) parallel_oo lt.eq \( 6 epsilon \)^2 . $
  Here the second inequality uses $\( 1 - .5 parallel K parallel \)^(- 1) < 2$. Consequently the input-output map satisfies
  $ parallel H_1 - H_2 parallel_oo lt.eq 10 #scale(x: 120%, y: 120%)[\(] 10 a + 2 \( 6 epsilon \)^2 #scale(x: 120%, y: 120%)[\)] parallel A_1 - A_2 parallel_oo . $
  Our already fixed shell width makes the second contribution less than $1 \/ 4$; taking $a$ small makes the whole factor less than $1 \/ 2$. The closed interval (3.17) in the radial continuous functions is complete, so successive iteration gives its unique fixed point. This proves the coupled inner problem.
  Finally $0 < P lt.eq .5$ and (3.20) give
  $ A' \( r \) = r^(- 11) integral_0^r t^11 \( P \( t \) - V \( t \) \) A \( t \) thin d t \, #h(2em) \| A' \| lt.eq C r \, quad \| A'' \| lt.eq C . $
  These are the asserted uniform bounds. For fixed $a$, convergent parameter sequences have $C^1$ convergent subsequences; the equation and uniqueness identify their limits. This proves continuous dependence, including when the boundary value $h_b$ varies. ◻
]

#thm([Lemma 3.4.])[
  (Identification of the core).  #emph[For the inner solutions of Lemma 15, suppose $a_n arrow.b 0$ and $\( b_n \, Z_n \) arrow.r \( b \, Z \) in cal(D)$. Then their complex reconstructions converge in $C^1 \[ 0 \, r_b \]$ to the function equal to $1$ on $\[ 0 \, R \( Z \) \]$ and to $F_(upright("in"))$ on $\[ R \( Z \) \, r_b \]$. Their pressures converge weak star to $b upright(bold(1))_({ r < R \( Z \) })$. These convergence assertions are uniform over the compact parameter disk in the sequential sense just stated.]
] <profile:core-limit>

#proof[
  The preceding bounds give $C^1$ compactness of the amplitudes. Every limit $A_0$ is at most $1$ and, by (3.18), equals $1$ on $\[ 0 \, r_0 \]$. Formula (3.19) and the last equation in (3.4) give $C^1$ convergence of $w$, including at zero. On every compact interval where $A_0 < 1$, the pressure tends uniformly to zero. There the limit satisfies $Delta A_0 = - V_0 A_0$, with $V_0 gt.eq .3$.
  Each component of ${ A_0 < 1 }$ has a left endpoint $R'$ where $A_0 \( R' \) = 1$, $A'_0 \( R' \) = 0$. On this component $\( r^11 A'_0 \)' = - r^11 V_0 A_0 < 0$, so $A'_0 < 0$ and the component cannot have a right endpoint below $r_b$. As $A_0 \( r_b \) = h_b < 1$, there is exactly one such component, $\( R' \, r_b \]$, and $R' in \[ r_0 \, r_b \)$. On the plateau (3.19) gives $w_0 = r \/ 2$ and hence $phi.alt_0 = 0$. Reconstruction gives the free complex equation with data $1 \, 0$ at $R'$. Its boundary modulus is $h_b$, so Lemma 14 forces $R' = R \( Z \)$.
  The pressures are bounded by $.5$. Any weak-star limit $P_0$ satisfies in distributions
  $ P_0 A_0 = V_0 A_0 + Delta A_0 . $
  There is no surface measure at $R$ because $A_0$ and $A'_0$ are continuous. On the plateau the right side is $b$, and on its exterior it is zero. Since $A_0$ is positive, this identifies $P_0$ uniquely. The preceding identification applies to every subsequence; compactness therefore proves all convergence assertions. Reconstruction by $phi.alt' = \( w - r \/ 2 \) \/ 2$ gives the asserted $C^1$ convergence of the complex profiles as well. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.2, 2.6), fill: rgb("#f9f4f0"))
  line((0, 0), (5.9, 0), stroke: (paint: rgb("#404040")), mark: (end: ">"))
  content((5.9, 0), [$r$], anchor: "west")
  line((0, 0), (0, 2.8), stroke: (paint: rgb("#404040")), mark: (end: ">"))
  content((0, 2.8), [$A_0(r)$], anchor: "south")
  line((2.2, 0), (2.2, 2.55), stroke: (paint: rgb("#8c8c8c")))
  line((0, 2.1), (2.2, 2.1), stroke: (paint: rgb("#305b78")))
  bezier((2.2, 2.1), (3.85, 1.02), (2.85, 2.1), (3.15, 1.3), stroke: (paint: rgb("#305b78")))
  bezier((3.85, 1.02), (5.65, 0.66), (4.4, 0.8), (5, 0.7), stroke: (paint: rgb("#305b78")))
  line((0, 2.1), (-0.08, 2.1))
  content((-0.08, 2.1), [$1$], anchor: "east")
  line((2.2, 0), (2.2, -0.09))
  content((2.2, -0.09), [$R$], anchor: "north")
  content((0, 0), [$0$], anchor: "north-east")
  content((1.1, 1.15), [constant core])
  content((4.3, 2.25), [free exterior#linebreak()strictly decreasing])
  content((2.85, -0.65), [\(a\) Limiting amplitude])
  rect((7.4, 0), (9.6, 2.6), fill: rgb("#f9f4f0"))
  line((7.4, 0), (13.3, 0), stroke: (paint: rgb("#404040")), mark: (end: ">"))
  content((13.3, 0), [$r$], anchor: "west")
  line((7.4, 0), (7.4, 2.8), stroke: (paint: rgb("#404040")), mark: (end: ">"))
  content((7.4, 2.8), [$P_0(r)$], anchor: "south")
  line((9.6, 0), (9.6, 2.55), stroke: (paint: rgb("#8c8c8c")))
  line((7.4, 2.1), (9.6, 2.1), stroke: (paint: rgb("#a35c2b")))
  line((9.6, 0), (13.05, 0), stroke: (paint: rgb("#a35c2b")))
  circle((9.6, 2.1), radius: 0.045, fill: rgb("#ffffff"), stroke: (paint: rgb("#a35c2b")))
  circle((9.6, 0), radius: 0.045, fill: rgb("#ffffff"), stroke: (paint: rgb("#a35c2b")))
  line((7.4, 2.1), (7.32, 2.1))
  content((7.32, 2.1), [$b$], anchor: "east")
  line((9.6, 0), (9.6, -0.09))
  content((9.6, -0.09), [$R$], anchor: "north")
  content((7.4, 0), [$0$], anchor: "north-east")
  content((8.5, 1.15), [pressure $b$])
  content((11.55, 1.15), [zero pressure])
  content((10.25, -0.65), [\(b\) Limiting pressure])
})],
  caption: [Figure 1: Schematic of the singular profile limit as $a arrow.r 0$. The amplitude $A_0$ equals $1$ for $r lt.eq R$ and decreases strictly on the free exterior; its limiting tail is nonzero. The pressure converges weakly to $P_0 = b upright(bold(1))_({ r < R })$; its value at the jump is immaterial. Compact support of this limiting pressure does not assert compact support of the profiles $Q$. The spectral interface conditions for amplitude and phase perturbations are derived in Lemma 30. Heights and radial distances are schematic. ],
) <fig:core-limit>

The pressure limit in Figure 1 is compatible with $A_a arrow.r 1$ in the core: the power $1 \/ a$ retains the order-$a$ variation of the amplitude. Weak-star convergence, rather than differentiation of this limiting step function, is the fact needed in the constrained mode problem.

For each $\( b \, Z \) in cal(D)$, the inner solution now has prescribed boundary modulus $h_b$ and a determined complex logarithmic derivative at $r_b$. We next construct a slow exterior solution with the same boundary modulus. A constant phase rotation can then match the boundary values; equality of the logarithmic derivatives supplies the two remaining real matching conditions. Lemma 18 will impose these conditions by varying $\( b \, Z \)$.

=== 3.3 A uniform slow solution on the exterior <a-uniform-slow-solution-on-the-exterior>

Write

$ G_b \( r \) = H \( - i b \, 6 \, - i r^2 \/ 4 \) \, #h(2em) j \( b \, z \) = - frac(partial_x H \( - i b \, 6 \, - i z \), H \( - i b \, 6 \, - i z \)) . $

Proposition 3 says that $G_b$ never vanishes for $r gt.eq R \( Z \)$. For its amplitude and phase,

$ A' / A = - r / 2 "Im" j \( b \, r^2 \/ 4 \) \, #h(2em) w / r = 1 / 2 + "Re" j \( b \, r^2 \/ 4 \) < .543 . quad "(3.23)" $ <profile:free-j>

At $R$, $w \/ r > 0$ because $\| j \( b \, Z \) \| lt.eq 3 dot.op 10^(- 9)$. The divergence equation with $c_(*) = 6$ shows that $w$ stays positive. For $R lt.eq r lt.eq 2 sqrt(3)$, it follows that

$ V = b + r^2 \/ 16 - w^2 \/ 4 > .18 . $

Normalize temporarily by $\| G_b \( R \) \| = 1$. Its initial amplitude derivative has magnitude at most $\( R \/ 2 \) 3 dot.op 10^(- 9)$, and the equation $\( r^11 A' \)' = - r^11 V A$ makes $A' \( r_b \) < 0$: on $\[ R \, r_b \]$ the amplitude stays, for example, between $1 \/ 2$ and $2$, while integrating the negative right side decreases $r^11 A'$ by more than its initial magnitude. It continues to decrease up to $2 sqrt(3)$. Beyond that radius the strict inequality $"Im" j > 0$ proves $A' < 0$ directly. Thus $\| G_b \|$ is strictly decreasing on $\[ r_b \, oo \)$, uniformly over the disk in the sense of strict negativity on each compact interval. If $j \( b \, Z \) = 0$, the same argument gives strict decrease throughout $\( R \, oo \)$.

For reference define the normalized free exterior

$ Q_0^(upright("out")) \( r \; b \, Z \) = h_b \( b \, Z \) frac(G_b \( r \), G_b \( r_b \)) . quad "(3.24)" $ <profile:normalized-free>

It has positive real value $h_b$ at $r_b$. The free symbol expansion shows that $r^(- 2 i b) Q_0^(upright("out"))$ tends to a nonzero number $m_0 \( b \, Z \)$. By the preceding monotonicity its modulus is at most $h_b < 1$ everywhere. Nonvanishing, the nonzero limit, and compactness of the parameter disk therefore give uniform lower and upper bounds strictly between $0$ and $1$ for its modulus.

#thm([Lemma 3.5.])[
  (Slow exterior construction).  #emph[For all sufficiently small $a > 0$ and $\( b \, Z \) in cal(D)$, there is a nonvanishing exterior stationary solution $Q_a^(upright("out"))$ with $Q_a^(upright("out")) \( r_b \) = h_b$. It depends continuously on $\( a \, b \, Z \)$, down to the limit (3.24), with convergence in every fixed derivative on compact exterior intervals. Its factor $f = r^(2 a - 2 i b) Q_a^(upright("out"))$ satisfies the bounds and expansions in (3.9)–(3.10), uniformly over the entire parameter disk.]
] <profile:exterior>

#proof[
  Writing $nu = - 2 a + 2 i b$ and $Q = r^nu f$ transforms the equation into
  $ \( D + nu \) \( D + nu + 10 \) f + frac(i r^2, 2) D f = N_a \( f \) \, #h(2em) N_a \( f \) = \| f \|^(1 \/ a) f . quad "(3.25)" $ <profile:f-equation>
  Set $N_0 = 0$. Choose a small fixed neighborhood of the compact family $\( m_0 \( b \, Z \) \, b \)$ such that the corresponding free functions $f$ stay in an annulus
  $ 0 < 2 kappa lt.eq \| f \| lt.eq rho_0 < 1 \, #h(2em) r gt.eq r_b . quad "(3.26)" $ <profile:annulus>
  This is possible because at $a = 0$ the equation is complex linear in the coefficient $m = lim f$. Enlarge the annulus slightly, still keeping its upper radius below $1$. On this enlarged annulus every fixed real derivative of $N_a$ tends uniformly to zero as $a arrow.b 0$: its norm is bounded by $C_j a^(- j) rho_1^(1 \/ a)$ for some $rho_1 < 1$ (adjusting $C_j$ and the power of $a$ does not affect this conclusion). Thus all fixed differentiability orders needed below are uniformly controlled.
  For prescribed $m \, b$, construct a formal expansion $f_N = sum_(q = 0)^N m_q r^(- 2 q)$ with $m_0 = m$. Substituting in (3.25) determines $m_(q + 1)$ from the coefficient of $r^(- 2 q)$: its coefficient in $\( i r^2 \/ 2 \) D f_N$ is $- i \( q + 1 \) m_(q + 1)$. All the other terms at that order involve only $m_0 \, dots.h \, m_q$ and derivatives of $N_a$ at $m$. This proves existence and uniqueness of the coefficients, boundedness at every fixed order, continuous dependence down to $a = 0$, and the same bounds after a fixed number of derivatives in the real and imaginary parts of $m$ and in $b$. The residual of $f_N$ is $O \( r^(- 2 N) \)$, with its fixed symbol and parameter derivatives.
  Here is a convergent construction behind this expansion. Put $t = log r$ and $Y = \( e \, D e \)$ for $e = f - f_N$. The error equation has the form
  $ partial_t Y = mat(delim: "(", 0, 0; 0, - i e^(2 t) \/ 2) Y + cal(B) Y + cal(N) \( t \, Y \) + cal(R)_N \( t \) \, quad "(3.27)" $ <profile:tail-system>
  where the constant matrix $cal(B)$ has bounded norm, $cal(N) \( t \, 0 \) = 0$, its Lipschitz constant on the annulus is bounded uniformly in $a \, m \, b$, and $\| cal(R)_N \( t \) \| lt.eq C_N e^(- 2 N t)$. The propagator $Phi \( t \, s \)$ of the displayed diagonal part is unitary. The backward integral equation is
  $ Y \( t \) = - integral_t^oo Phi \( t \, s \) #scale(x: 120%, y: 120%)[\(] cal(B) Y \( s \) + cal(N) \( s \, Y \( s \) \) + cal(R)_N \( s \) #scale(x: 120%, y: 120%)[\)] thin d s . quad "(3.28)" $ <profile:tail-contraction>
  On $t gt.eq t_(*)$ use the norm $parallel Y parallel_N = sup e^(2 N t) \| Y \( t \) \|$. If $C$ bounds the combined Lipschitz constant of the two terms involving $Y$, their integral has norm at most $C \/ \( 2 N \)$. Choose one integer $N_(*)$ with this ratio below $1 \/ 2$, and then choose $t_(*)$ large enough that the corresponding ball around $f_(N_(*))$ remains in the enlarged annulus. The residual term has norm at most $C_(N_(*)) \/ \( 2 N_(*) \)$, so iteration in a ball of twice this radius converges geometrically to a solution. No decay estimate for an oscillatory propagator has been used; unitarity and the weight make the integral absolutely convergent.
  The same construction works at any larger truncation order. Two solutions so obtained differ by $O \( r^(- 2 N_(*)) \)$ in both entries after subtracting their common expansion through order $N_(*)$. Their difference solves (3.28) without the residual, on a common sufficiently long tail. The contraction estimate forces it to vanish there, and uniqueness for the finite-interval ODE makes the solutions identical. This proves an expansion to every order for the single solution already constructed. Symbol derivatives cause no loss in this conclusion. Indeed (3.27) bounds the next derivative of an error by at most $C r^2$ times its two entries and the residual; differentiating it $J$ times loses at most $2 J$ powers of $r$. Constructing at an order greater than $N + J + 2$ first therefore gives the remainder estimate of (3.10) through the prescribed order $J$. This also explains why the constants need only be uniform at each fixed order.
  Differentiating the integral equation with respect to $m$ or $b$ gives the same contraction for its derivative, with a bounded inhomogeneous term. Difference quotients converge to that solution, proving real $C^1$ dependence; repeated differentiation works at every fixed order. Continuity at $a = 0$ follows directly from the uniform contraction and convergence of its coefficients. Continue the solution from the fixed large radius back to $r_b$. On this finite interval the right side of the first-order form of (3.25) and all its fixed derivatives are bounded and converge on the enlarged annulus. The integral equation on finitely many short intervals, followed by Gronwall’s inequality for differences, keeps the solution close to its free counterpart and proves existence and parameter convergence down to $r_b$. This also proves convergence of all fixed radial derivatives and the first parameter derivatives there. In view of (3.26), the final functions satisfy $kappa lt.eq \| f \| lt.eq rho < 1$ for fixed $kappa \, rho$, uniformly in small $a$ and the chosen parameter neighborhood.
  It remains to choose $m$ so that $Q \( r_b \) = h_b$. At $a = 0$ the map $m mapsto Q \( r_b \)$ is complex multiplication by a nonzero factor. Its real two-dimensional inverse is uniformly bounded over the compact parameter disk. The just proved $C^1$ convergence implies that, on a fixed small neighborhood of each $m_0$, the equation for $m$ is a contraction after multiplying by that limiting inverse. Its residual at $m_0$ tends to zero uniformly, so it has a unique root near $m_0$. These roots agree on overlapping neighborhoods and depend continuously on $\( a \, b \, Z \)$. This imposes the required boundary value. All tail bounds extend from the initially fixed large radius to $r_b$ by the compact interval bounds, completing the proof. ◻
]

=== 3.4 Matching, pressure transport, and deformation <matching-pressure-transport-and-deformation>

#thm([Lemma 3.6.])[
  (Matching by degree).  #emph[For every sufficiently small $a > 0$ there is $\( b_a \, Z_a \) in cal(D)$ at which the inner and outer profiles have the same logarithmic derivative at $r_b$. After a constant phase rotation of the outer profile they form a smooth nonvanishing stationary profile. Every parameter limit as $a arrow.b 0$ is a zero of $j$ in $cal(D)$.]
] <profile:matching>

#proof[
  Let $Q_a^(upright("in"))$ be reconstructed with phase zero at the origin, and define the continuous complex-valued matching map
  $ M_a \( b \, Z \) = frac(\( Q_a^(upright("in")) \)' \( r_b \), Q_a^(upright("in")) \( r_b \)) - frac(\( Q_a^(upright("out")) \)' \( r_b \), Q_a^(upright("out")) \( r_b \)) . $
  Lemmas 16 and 17 give uniform convergence on $cal(D)$ to $M_0 = F'_(upright("in")) \( r_b \) \/ F_(upright("in")) \( r_b \) - G'_b \( r_b \) \/ G_b \( r_b \)$. Both denominators are nonzero.
  The Wronskian $cal(W) = F_(upright("in")) G'_b - F'_(upright("in")) G_b$ satisfies $cal(W)' = - \( 11 \/ r + i r \/ 2 \) cal(W)$. At $R = 2 sqrt(Z)$, $G'_b \( R \) = \( i R \/ 2 \) j \( b \, Z \) G_b \( R \)$, and hence
  $ M_0 \( b \, Z \) = K \( b \, Z \) j \( b \, Z \) \, #h(2em) K = - frac(i R, 2) (R / r_b)^11 e^(- i \( r_b^2 - R^2 \) \/ 4) frac(G_b \( R \), F_(upright("in")) \( r_b \) G_b \( r_b \)) . quad "(3.29)" $ <profile:wronskian-match>
  The factor $K$ is continuous and never zero on the entire disk. Contracting its parameter argument to the disk center gives a homotopy through nonzero factors to a constant. Complex multiplication by that constant preserves orientation. Proposition 3 therefore gives
  $ deg \( M_0 \, cal(D)^compose \, 0 \) = deg \( j \, cal(D)^compose \, 0 \) eq.not 0 . $
  In particular $M_0$ is separated from zero on the boundary. Uniform convergence preserves the boundary homotopy and the degree for every sufficiently small $a$, so $M_a$ has a zero.
  At such a zero the values have equal modulus $h_b$. Rotate the outer profile to match the value of the inner one; equality of logarithmic derivatives then matches the first derivatives as well. The ODE gives smoothness across $r_b$, since the profile is nonzero. To verify smoothness through the origin without a regular-singular shortcut, write $q \( x \) = Q \( sqrt(x) \)$ for $x gt.eq 0$. Integrating the complex radial equation gives
  $ q' \( x \) = 1 / 4 integral_0^1 t^5 e^(- i x \( 1 - t \) \/ 4) #scale(x: 120%, y: 120%)[\(] \| q \( x t \) \|^(1 \/ a) - b - i a #scale(x: 120%, y: 120%)[\)] q \( x t \) thin d t . $
  The right side is continuous at $x = 0$. It first proves $q in C^1$ and then, by successive differentiation, $q in C^oo$ because $q$ is bounded away from zero on this compact interval. Thus $Q \( y \) = q \( \| y \|^2 \)$ is smooth at the origin. The normalization at zero was already imposed. Finally, a convergent sequence of matching parameters satisfies $M_0 \( b \, Z \) = 0$, so (3.29) gives $j \( b \, Z \) = 0$. At such a root the free initial-value solution equals $G_b \/ G_b \( R \)$, proving (3.7). ◻
]

#thm([Lemma 3.7.])[
  (The pressure derivative and positive deformation).  #emph[The matched profiles satisfy (3.6) and (3.11)–(3.12).]
] <profile:pressure>

#proof[
  First consider the inner amplitude. On every component of ${ P < .2 }$,
  $ \( r^11 A' \)' = r^11 \( P - V \) A < 0 . $
  At a positive left endpoint $A' lt.eq 0$, since the amplitude is entering the sublevel set $A < .2^a$; at the origin $A' = 0$. Thus $A' < 0$ at every positive radius in this sublevel set. If $M = max_(\[ 0 \, r_b \]) \( A' \)_(+)$ is positive, it is attained at a point $r_m in \( 0 \, r_b \)$: the derivative is zero at the origin and strictly negative at $r_b$ for small $a$ by Lemma 16. At this point $P gt.eq .2$, $A'' = 0$, and $A''' lt.eq 0$.
  Let $q = w \( r_m \) \/ r_m$. The bounds $A lt.eq .5^a$, $A \( r_m \) gt.eq .2^a$ and (3.19) give
  $ .49 < q lt.eq q_(+) := c_(*) / 12 \( 2.5 \)^(2 a) = 1 / 2 + O \( a \) . $
  The fixed lower bound follows from $h_b > .999$ and small $a$; it need not approach $1 \/ 2$ at any prescribed rate. Differentiating $V$ and using (3.4) gives the exact identity
  $ V' = r (1 / 8 - c_(*) / 2 w / r + 11 / 2 (w / r)^2) + w^2 A' / A . $
  The polynomial $q mapsto 1 \/ 8 - c_(*) q \/ 2 + 11 q^2 \/ 2$ is increasing for $q gt.eq .49$ and small $a$, and its value at $q_(+)$ is $O \( a \)$, since its value at $\( a \, q \) = \( 0 \, 1 \/ 2 \)$ is zero. Thus at $r_m$,
  $ V' lt.eq C a + w^2 M \/ A . $
  Differentiate the amplitude equation. At this maximum,
  $ \( - Delta A \)' = - A''' - 11 / r A'' + 11 / r^2 A' gt.eq 0 \, $
  so
  $ .2 / a M lt.eq V M + V' A lt.eq C M + C a . $
  It follows that $M lt.eq C a^2$. Since $w gt.eq 0$ and $w \/ A$ is bounded on the inner ball,
  $ W \( P \/ a \) = frac(w P A', a^2 A) lt.eq C P = C a \( P \/ a \) \, $
  which proves (3.12).
  In the exterior, (3.9) gives $P \/ a = r^(- 2) \| f \|^(1 \/ a) \/ a$. Repeated Euler differentiation and $kappa lt.eq \| f \| lt.eq rho < 1$ bound every fixed derivative by $C_j a^(- N_j) rho^(1 \/ a) r^(- 2)$ for some finite integer $N_j$. This tends to zero uniformly after multiplication by $r^2$. Also $e^(2 i phi.alt) = r^(4 i b) f \/ overline(f)$, so all its fixed Euler derivatives are uniformly bounded. As $w \/ r$ is uniformly bounded in the exterior, these facts give (3.11) and the exterior bound on $W \( P \/ a \)$. Together with $P lt.eq .5$ in the interior they give the uniform upper bound on its positive part. By taking $a$ smaller if necessary, the exterior formula also gives $P lt.eq 1$ everywhere. The same bounds for $f$, and (3.17), prove the two-sided comparison for $mu$ in (3.6).
  It remains to prove positive deformation. The two eigenvalues of the derivative of a radial field are $w'$ and $w \/ r$. For every limiting matched profile they equal $1 \/ 2$ in the core. On the exterior, $A'_0 < 0$, $w_0 > 0$, and $w_0 \/ r < .543$, so
  $ w'_0 = 6 - 11 w_0 \/ r - 2 w_0 A'_0 \/ A_0 gt.eq 6 - 11 \( .543 \) = .027 . $
  Integrating from zero also gives $w_0 \/ r gt.eq .027$. The compact $C^1$ convergence of $A$ and formula (3.19), followed by the last equation of (3.4), give convergence of both eigenvalues on every fixed compact interval, including zero. For the remaining tail, the uniform expansion of Lemma 17 gives
  $ w / r = 1 / 2 + frac(4 b, r^2) + O \( r^(- 4) \) \, #h(2em) w' = 1 / 2 - frac(4 b, r^2) + O \( r^(- 4) \) \, $
  uniformly in small $a$. Choose a large fixed radius to make these tail bounds positive, and only then take $a$ small enough for the compact convergence. A subsequence contradiction, using compactness of the parameter disk, makes this choice uniform for all matched profiles. For example $c = .01$ is admissible after reducing $a_0$. This proves (3.6). ◻
]

#proof[
  #emph[Completion of Proposition 13.] The inner construction, exterior construction and degree argument give existence for every $0 < a < a_0$ after finitely many reductions of $a_0$. The order of choices is fixed: the disk and $epsilon$ first, then the core comparison estimates, the exterior annulus and a single large truncation order and starting radius, and finally sufficiently small $a$. Any later fixed derivative order is obtained by taking a higher auxiliary truncation of the same exterior solution; it does not require changing that solution or the already fixed geometric parameters.
  The limiting statements on the inner ball are Lemma 16, and on $\[ r_b \, oo \)$ follow from Lemma 17 and matching. On a compact subset of $\( R \, r_b \)$, the limiting amplitude is strictly below $1$; uniform $C^1$ convergence therefore places the profiles in a fixed annulus bounded away from both $0$ and $1$. All derivatives of $z mapsto \| z \|^(1 \/ a) z$ tend to zero there. The complex radial ODE, successively differentiated, then proves $C^oo$ convergence and $P \/ a arrow.r 0$ on that compact set. The weak-star pressure assertion on any larger fixed ball follows by joining the inner assertion to this exterior convergence. The $C^1$ convergence of $mu \, w$ has already been proved from their amplitude formulas.
  Finally, radial Euler estimates imply Cartesian symbol estimates away from zero: an ordinary derivative of order $j$ is a linear combination of $r^(- j)$ times Euler derivatives with bounded smooth angular coefficients. The fixed-$a$ smoothness on a compact ball supplies the remaining bounds in (3.13); their constants are not asserted to be uniform as $a arrow.b 0$. As $a - i b + nu \/ 2 = 0$,
  $ \( a - i b + D \/ 2 \) Q = 1 / 2 r^nu D f \, $
  and (3.10) gives (3.14). All parts of the proposition follow. ◻
]

== 4 The outgoing spectrum <sec:spectrum>

Throughout this section, $Q = A e^(i phi.alt)$ is one of the profiles of Proposition 13, and

$ P = A^(1 \/ a) \, quad mu = A^2 \, quad c_(*) = 6 - 2 a \, quad w = \( r \/ 2 + 2 phi.alt' \) partial_r \, quad W = w dot.op nabla \, quad D = r partial_r . $

The same letter $w$ denotes the radial component of the vector field when it appears in a one-dimensional formula. Complexification is always complexification of a real linear equation. Thus its two circular components $v_(+) \, v_(-)$ are independent; the original real space is the subspace $v_(-) = overline(v_(+))$.

#thm([Theorem 4.1.])[
  (Classification of regular modes).  #emph[For all sufficiently small admissible $a > 0$, the only regular outgoing modes with $"Re" lambda gt.eq - 1 \/ 32$ are the phase, translation, and time modes. Their first circular components and eigenvalues are 
$ i Q quad \( lambda = 0 \) \, #h(2em) partial_j Q quad \( lambda = 1 \/ 2 \, 1 lt.eq j lt.eq 12 \) \, #h(2em) \( a - i b + D \/ 2 \) Q quad \( lambda = 1 \) . $

 The second component of each listed real symmetry generator is the conjugate of the displayed component. Their complex spans are the corresponding complexified eigenspaces. In each fixed spherical harmonic, each eigenvalue that occurs is algebraically simple; degrees $ell gt.eq 2$ have no such eigenvalue.]
  #emph[Here “outgoing” means that, in each component, for every fixed integer $j gt.eq 0$, 
$ D^j v_h = O \( r^(- 2 \( a + "Re" lambda \)) \) #h(2em) \( r arrow.r oo \) . quad "(4.1)" $ <spec:slow-condition>

 The same classification holds for regular solutions for which $partial_r^k v_h in L^2 \( r^11 thin d r \)$ for some integer $k gt.eq 7$. There is no regular generalized mode above any of these eigenvectors with this top-derivative integrability. Algebraic simplicity for outgoing modes means simplicity of the analytic regular/outgoing boundary problem, including its differentiated outgoing condition.]
] <spectrum:classification>

We prove the theorem in several steps. All statements about $a arrow.r 0$ allow a convergent subsequence of the profile parameters $\( b \, Z \)$. Uniform conclusions for all small $a$ will follow by contradiction and subsequence extraction, so a continuous choice of matched profiles is not needed.

=== 4.1 Linearization and the boundary condition at infinity <linearization-and-the-boundary-condition-at-infinity>

Let a real spherical harmonic of degree $ell$ have unit $L^2$ norm on $bb(S)^11$. Its eigenvalue for $- Delta_(bb(S)^11)$ is $ell \( ell + 10 \)$. The mode equation in this harmonic is

$ v''_h + (11 / r + frac(h i r, 2)) v'_h + [b + h i \( a + lambda \) - frac(ell \( ell + 10 \), r^2)] v_h = P v_h + frac(P, 2 a) \( v_h + e^(2 h i phi.alt) v_(- h) \) \, #h(2em) h = plus.minus 1 . quad "(4.2)" $ <spec:circular>

Set

$ v_h = A e^(h i phi.alt) \( f + h i g \) \, #h(2em) X = \( f \, g \)^t \, #h(2em) J = mat(delim: "(", 0, 1; - 1, 0) . $

We include the angular harmonic in $f \, g$ when using spatial notation. The coordinates $f \, g$ are independent complex variables in the spectral problem and are real on the original real space. Cancellation of the stationary profile terms gives

$ cal(H) X + J \( lambda + W \) X = 0 \, #h(2em) L = - mu^(- 1) nabla dot.op \( mu nabla \) \, #h(2em) cal(H) = mat(delim: "(", L + P \/ a, 0; 0, L) . quad "(4.3)" $ <spec:real-system>

Indeed the terms remaining after division by $A e^(h i phi.alt)$ in (4.2) are $- L + h i W$ and the additional pressure $\( P \/ a \) f$. The evolutionary generator in these variables is therefore $cal(G) = J cal(H) - W$. We use repeatedly

$ "div" \( mu w \) = c_(*) mu \, #h(2em) W^(*) = - W - c_(*) quad "(4.4)" $ <spec:divergence>

in the weighted volume inner product, with the appropriate boundary term on a ball.

#thm([Lemma 4.2.])[
  (Block reduction at infinity).  #emph[Suppose that 
$ D Y = \( r^2 Lambda \( r \) + B \( r \) \) Y $

 on a half-line, where $Lambda$ is diagonal, its selected blocks have uniformly separated spectra, and $Lambda \, B$ and their fixed Euler derivatives are bounded. For every fixed $m$ there is an invertible change $I + O_m \( r^(- 2) \)$, with the same symbol bounds, after which the off-block remainder is $O_m \( r^(- m) \)$. The bounded part in each diagonal block changes by $O_m \( r^(- 2) \)$. The changes preserve holomorphic dependence on any parameters on which the original system depends holomorphically.]
] <spec:block-reduction>

#proof[
  Suppose an off-block entry is $b_(j k) = O \( r^(- q) \)$. A change with entry $- r^(- 2) b_(j k) \/ \( Lambda_j - Lambda_k \)$ cancels it by commutation with $r^2 Lambda$. Differentiating this change or multiplying it by the bounded part gives $O \( r^(- q - 2) \)$; its products with the other changes have the same or better order. The denominator and all its fixed Euler derivatives are uniformly bounded by the spectral gap. Perform this operation simultaneously on every off-block entry, and iterate a finite number of times. The product of the changes is invertible for sufficiently large $r$ by its $I + O_m \( r^(- 2) \)$ bound. Differentiating the construction proves the symbol estimates. All operations are algebraic operations and differentiation with nonzero denominators, proving the last assertion. ◻
]

#thm([Lemma 4.3.])[
  (Slow bases and exclusion of fast modes).  #emph[For bounded $lambda \, ell$ and small $a$, the exterior solution space of (4.2) has a two-dimensional outgoing subspace, locally holomorphic in $lambda$. Its bases and parameter derivatives converge locally on $r gt.eq r_b$ to free outgoing bases as $a arrow.r 0$. Every homogeneous solution satisfying the top-derivative condition in Theorem 20 belongs to this subspace.]
] <spec:slow-basis>

#proof[
  Use $\( v_h \, v'_h \/ r \)$ for each channel. The coefficient of $r^2$ in its $D$ equation is
  $ mat(delim: "(", 0, 1; 0, - h i \/ 2) . $
  Diagonalize by the eigenvectors with first component one, group the two zero eigenvalues, and apply Lemma 21. Writing
  $ nu_h = - 2 \( a + lambda \) + 2 h i b \, $
  the slow block is $"diag" \( nu_h \) + O \( r^(- 2) \)$, and the fast entries are $- h i r^2 \/ 2 - 12 - nu_h + O \( r^(- 2) \)$. For example, before diagonalization the bounded contribution to the second row is $- 12 \( v'_h \/ r \) - \( b + h i \( a + lambda \) \) v_h$; this verifies both constant exponents.
  Factor out $r^(nu_h)$ in a slow coordinate and $e^(- h i r^2 \/ 4) r^(- 12 - nu_h)$ in a fast coordinate. The diagonal errors are integrable in $d r \/ r$. The off-block errors are also integrable if $m > \| 12 + 2 "Re" nu_h \|$ with a fixed positive margin on the parameter neighborhood. The factored equation is thus an integrable perturbation of a constant vector. On a sufficiently late half-line, its integral from infinity is a contraction on bounded vectors; prescribing its four limits gives four independent solutions. Continuation gives a basis on the entire exterior. This construction is holomorphic on a slightly smaller parameter neighborhood because the integrable majorants are uniform there.
  Setting both fast limits to zero gives exactly the outgoing subspace. In fact the fast coordinates forced by slow coordinates are $O \( r^("Re" nu_h - m) \)$ before factoring, by the backward integral. Taking $m$ larger before each fixed number of differentiations gives (4.1). Increasing the reduction order does not change the limiting normalization: the additional transformations have arbitrarily high order relative to the prescribed normalization, and uniqueness of the backward integral applies on a common tail. Uniform exterior symbol bounds for the profiles and their convergence give convergence of these integral equations by dominated convergence; ordinary ODE continuation then proves the asserted local convergence. At $a = 0$ the slow columns are, up to their nonzero normalizations,
  $ r^ell H \( lambda + ell \/ 2 - h i b \, 6 + ell \, - h i r^2 \/ 4 \) quad "(4.5)" $ <spec:free-bases>
  in their separate channels, by Lemma 4.
  If the fast limit $d_h$ in channel $h$ is nonzero, reconstruction and $k$ radial differentiations give the leading fast term
  $ partial_r^k v_h = \( - h i \/ 2 \)^k e^(- h i r^2 \/ 4) r^(k - 12 - nu_h) \( d_h + o \( 1 \) \) + O \( r^("Re" nu_h - k) \) . quad "(4.6)" $ <spec:fast-derivative>
  The other channel’s fast contribution is smaller by $r^(- 2)$; this follows from the off-block reconstruction. The same formula follows directly by successively applying $D$ to the reduced fast equation, whose leading multiplier is $- h i r^2 \/ 2$. For $"Re" lambda gt.eq - 1 \/ 32$ and $k gt.eq 7$, $2 k > 12 + 2 "Re" nu_h$. Consequently the first term in (4.6) dominates the slow term and its square is not integrable against $r^11 thin d r$. Thus every fast limit vanishes. For any particular finite $lambda \, ell$, the argument applies in a bounded neighborhood of those parameters; it does not require a uniform bound on the parameters of the mode being tested. ◻
]

#thm([Lemma 4.4.])[
  (Upper bound for the real part).  #emph[For all sufficiently small $a$, there is no nonzero regular outgoing mode with $"Re" lambda gt.eq 4$.]
] <spec:real-bound>

#proof[
  Put $V_a = P \/ a$ and $sigma = "Re" lambda$. Test (4.3) against $\( lambda + W \) X$, and take real parts. The $J$ term has zero real part. Integration by parts, using (4.4), gives
  $ 0 = integral {\( sigma - c_(*) \/ 2 \) \( \| nabla X \|^2 + V_a \| f \|^2 \) + nabla X^(*) \( nabla w \) nabla X - 1 / 2 W \( V_a \) \| f \|^2} mu thin d y . quad "(4.7)" $ <spec:upper-energy>
  Here the matrix $nabla w$ acts on spatial indices and the expression is summed over the two components. Boundary terms vanish: after division by $A$, the slow bound is $X = O \( r^(- 2 sigma) \)$, with its symbol derivatives, and $sigma gt.eq 4$ gives all needed integrability.
  For completeness, the weighted Hardy inequality used here is uniform for small $a$:
  $ integral r^(- 2) \| f \|^2 mu thin d y lt.eq C integral \| nabla f \|^2 mu thin d y . quad "(4.8)" $ <spec:hardy>
  Indeed, for $rho = chevron.l r chevron.r^(- 4 a)$, $"div" \( rho y \/ r^2 \) gt.eq \( 10 - 4 a \) rho \/ r^2$. Integration against $\| f \|^2$ and Cauchy–Schwarz prove the inequality with $rho$; comparability of $rho$ and $mu$ proves (4.8). Cutoffs justify the calculation by density. Proposition 13 gives $nabla w gt.eq c I$ and $W \( V_a \) lt.eq C a V_a$ on the inner ball, while its exterior positive part is $o \( 1 \) r^(- 2)$. Since $sigma - c_(*) \/ 2 gt.eq 1$, these two negative contributions in (4.7) are absorbed, respectively, by the pressure and gradient terms. A nonzero $X$ is impossible. ◻
]

=== 4.2 An outgoing estimate for unbounded parameters <an-outgoing-estimate-for-unbounded-parameters>

We next exclude loss of modes to large angular or imaginary spectral parameters. The main step is to express the outgoing condition as a relation between a mode and its radial derivative on one fixed exterior shell. Once this relation is available, interior energy and flux identities will exclude a regular mode. Consider a sequence with $a arrow.r 0$, $- 1 \/ 32 lt.eq sigma lt.eq 4$, and $ell + \| "Im" lambda \| arrow.r oo$. Complex conjugation of (4.3) allows us to assume $omega = "Im" lambda gt.eq 0$. After extraction, one of the following holds:

$ upright("I: ") ell / sqrt(1 + omega) arrow.r oo \; #h(2em) upright("II: ") omega arrow.r oo \, quad ell / sqrt(omega) upright(" is bounded") . quad "(4.9)" $ <spec:cases>

Set

$ q_h & = r^(11 \/ 2) e^(h i r^2 \/ 8) v_h \, #h(2em) L_ell = \( ell + 5 \)^2 - 1 / 4 \, #h(2em) n_(*) = max \( 1 + ell \, sqrt(omega) \) \,\
F_h & = r^2 \/ 16 + b - h omega - L_ell \/ r^2 \, #h(2em) S = max \( 1 + ell \, omega \) \, #h(2em) E = 16 sqrt(S) . quad "(4.10)" $ <spec:high-definitions>

The symbol $q_h$ here denotes an unknown function, not the first argument of $H$. Direct substitution gives

$ q''_h + \( F_h + h i gamma \) q_h = sum_j V_(h j) \( r \) q_j \, #h(2em) gamma = sigma + a - 3 \, #h(2em) \| V_(h j) \( r \) \| lt.eq C r^(- 2) quad \( r gt.eq r_b \) . quad "(4.11)" $ <spec:schrodinger-radial>

The bound, uniform in the sequence, follows from the exterior pressure estimates; oscillations in $V_(h j)$ cause no difficulty below.

Choose a fixed $B_0 > r_b$, and put $B_1 = B_0 + 1$. In Case II take $B_0$ large enough that $L_ell \/ B_0^2 < omega \/ 2$ eventually. On this shell $F_h < 0$ for both channels in Case I; in Case II $F_(+) < 0 < F_(-)$. In either case $\| F_h \| asymp n_(*)^2$, uniformly on the shell.

#thm([Lemma 4.5.])[
  (Outgoing data at the remote endpoint).  #emph[Every outgoing solution along this sequence satisfies 
$ q'_h \( E \) - h i sqrt(F_h \( E \)) q_h \( E \) = O \( E^(- 1) \) \| q \( E \) \| . quad "(4.12)" $ <spec:remote-robin>

 The constant is uniform after discarding finitely many sequence terms.]
] <spec:remote-data>

#proof[
  For $r gt.eq E$ use $\( v_h \, v'_h \/ r \)$ again. Diagonalize the leading matrix
  $ mat(delim: "(", 0, 1; h omega \/ r^2 + ell \( ell + 10 \) \/ r^4, - h i \/ 2) . $
  Its eigenvalues are
  $ h i (- 1 / 4 plus.minus sqrt(1 / 16 - h omega \/ r^2 - ell \( ell + 10 \) \/ r^4)) . $
  The square root stays uniformly positive on $r gt.eq E$. Eigenvectors with first entry one give a uniformly invertible symbol change. Group the two plus signs as the outgoing block; take the two minus signs as separate blocks. These blocks have uniformly positive gaps. The bounded remainder has norm at most a fixed $C_0$, with uniform fixed symbol derivatives. The leading diagonal is purely imaginary.
  The order of choices is important. First choose $C > C_0 + 2$, enlarged if necessary to bound the Hermitian parts of the initial full and block systems. Next choose one fixed integer $m > 2 C + 4$. Apply Lemma 21 to this order. Finally pass far enough along the sequence that its finitely many $O_m \( r^(- 2) \)$ corrections have norm at most one on $r gt.eq E$. Both the full reduced evolution and each block evolution then have propagator bound
  $ parallel Phi \( r \, t \) parallel lt.eq (frac(max \( r \, t \), min \( r \, t \)))^C . quad "(4.13)" $ <spec:power-propagator>
  This is Gronwall in $log r$ after using skewness of the leading diagonal. No separation inside the outgoing block is required.
  For each individual outgoing solution, all reduced coordinates have symbol bounds $O \( r^rho \)$, where $rho = - 2 \( a + sigma \) < 1$; their constants may depend on that solution and its parameters. In an incoming equation the $r^2$ leading coefficient is invertible. Solving for that coordinate and differentiating gives a gain of two powers of $r$; iteration gives the same gain for each fixed symbol derivative, up to the $O_m \( r^(- m) \)$ forcing from the outgoing block. Thus the incoming coordinate is $o \( r^(- C - 1) \)$, with $m$ as chosen. This qualitative bound is used only to remove its terminal value in variation of constants at infinity.
  After that terminal value has vanished, the quantitative estimate uses only (4.13). If $Y$ denotes all reduced coordinates, its incoming part at $E$ is at most
  $ C_m \| Y \( E \) \| integral_E^oo \( r \/ E \)^(2 C) r^(- m) frac(d r, r) = frac(C_m E^(- m), m - 2 C) \| Y \( E \) \| . $
  Undoing the changes gives
  $ frac(v'_h \( E \), E) = h i (- 1 / 4 + sqrt(1 / 16 - h omega \/ E^2 - ell \( ell + 10 \) \/ E^4)) v_h \( E \) + O \( E^(- 2) \) \| v \( E \) \| . $
  The full coordinate size is bounded by $C \| v \( E \) \|$, since the incoming coordinates are small and the first entry of each outgoing eigenvector is one. Multiplication by the scalar defining $q_h$ proves (4.12); the $11 \/ \( 2 E \)$ term and the difference between $L_ell$ and $ell \( ell + 10 \)$ are within its error. ◻
]

#thm([Lemma 4.6.])[
  (Scalar transfer and a turning point).  #emph[Fix one channel and write $F = F_h$. For $R in \[ B_0 \, B_1 \]$, let $U$ solve 
$ U'' + \( F + h i gamma \) U = 0 \, #h(2em) U \( E \) = F \( E \)^(- 1 \/ 4) \, quad U' \( E \) = h i sqrt(F \( E \)) U \( E \) . $

 If $F$ has a zero $r_0 in \[ R \, E \]$, define 
$ A_0 & = r_0^2 \/ 16 \, #h(2em) H_0 = L_ell \/ r_0^2 \, #h(2em) k_0^2 = A_0 + H_0 \,\
d_0 & = \( r_0 \/ \( 2 k_0^2 \) \)^(1 \/ 3) \, #h(2em) K \( r \) = \( \| F \( r \) \| + d_0^(- 2) \)^(1 \/ 2) \,\
H_f \( r \) & = integral_(min \( r \, r_0 \))^(r_0) sqrt(- F \( t \)) thin d t . quad "(4.14)" $ <spec:turn-scales>

 If there is no zero, put $K = sqrt(F)$ and $H_f = 0$. For $N_r \( u \) = K \( r \)^(1 \/ 2) \| u \( r \) \| + K \( r \)^(- 1 \/ 2) \| u' \( r \) \|$, after taking a subsequence common to the two channels, there are $c \, C > 0$ such that 
$ N_r \( u \) & lt.eq C e^(\| H_f \( r \) - H_f \( t \) \|) N_t \( u \) \,\
\| U \( R \) \| & gt.eq c K \( R \)^(- 1 \/ 2) e^(H_f \( R \)) \,\
U' \( R \) \/ U \( R \) & = cal(B)_h \( R \) + o \( n_(*) \) \, quad "(4.15)" $ <spec:scalar-transfer>

 where 
$ cal(B)_h \( R \) = cases(delim: "{", - sqrt(- F_h \( R \)) \, & F_h \( R \) < 0 \,, h i sqrt(F_h \( R \)) \, & F_h \( R \) > 0 .) $

 The first estimate holds for every scalar homogeneous solution and all $r \, t in \[ R \, E \]$. All left endpoint statements are uniform for $R in \[ B_0 \, B_1 \]$.]
] <spec:scalar-turn>

#proof[
  The derivative $F' = r \/ 8 + 2 L_ell \/ r^3$ is positive, so there is at most one zero. In the turning cases its defining equation gives
  $ F \( r \) = A_0 \( \( r \/ r_0 \)^2 - 1 \) + H_0 \( 1 - \( r_0 \/ r \)^2 \) \, #h(2em) A_0 - H_0 = h omega - b . quad "(4.16)" $ <spec:turn-potential>
  It follows that $k_0^2 asymp S$, $r_0 arrow.r oo$, $r_0 < E \/ 2$, and $d_0 arrow.r 0$. For the $h = - 1$ turn in Case I, for example, $r_0^2 asymp ell^2 \/ \( omega + ell \)$, which tends to infinity precisely because $ell \/ sqrt(1 + omega) arrow.r oo$. The other turn has $r_0^2 asymp omega + ell$. In the no-turn case, necessarily the negative channel in Case II, $F asymp S$ throughout $\[ R \, E \]$.
  Fix a large number $M$ and remove the interval $\| r - r_0 \| < M d_0$. On either remaining interval choose $"Re" p > 0$ with $p^2 = "sign" \( F \) \( F + h i gamma \)$. Use the two approximate solutions
  $ p^(- 1 \/ 2) exp \( plus.minus #h(-1em) integral p \) quad \( F < 0 \) \, #h(2em) p^(- 1 \/ 2) exp \( plus.minus i #h(-1em) integral p \) quad \( F > 0 \) . $
  All integrals in this paragraph are over the outer intervals. Direct differentiation of (4.16) gives
  $ integral \| F \|^(- 1 \/ 2) thin d r & lt.eq C \,\
sup frac(\| F' \|, \| F \|^(3 \/ 2)) + integral (frac(\| F'' \|, \| F \|^(3 \/ 2)) + frac(\| F' \|^2, \| F \|^(5 \/ 2))) d r & lt.eq C M^(- 3 \/ 2) + o \( 1 \) . quad "(4.17)" $ <spec:phase-error>
  Here and below the constants multiplying $M^(- 3 \/ 2)$ do not depend on $M$. To verify the estimates, on $\[ r_0 \/ 2 \, 2 r_0 \]$ use $\| F \| asymp k_0^2 \| r - r_0 \| \/ r_0$, $\| F' \| lt.eq C k_0^2 \/ r_0$, $\| F'' \| lt.eq C k_0^2 \/ r_0^2$ and $d_0^3 = r_0 \/ \( 2 k_0^2 \)$. Integrating the powers $\| r - r_0 \|^(- 3 \/ 2)$ and $\| r - r_0 \|^(- 5 \/ 2)$ from $M d_0$ gives the stated error. Off this interval $\| F \| gt.tilde k_0^2$, with relative derivative bounds $C \/ r \, C \/ r^2$, and $E lt.tilde k_0$; splitting at $r_0 \/ 2$ and $2 r_0$ gives a vanishing error and the bounded integral in (4.17). For no turn the same computations use $F asymp S$ and give $o \( 1 \)$ in (4.17) on all of $\[ R \, E \]$.
  Here is a transfer justification retaining the error that will be needed below. Each approximate solution has residual potential
  $ frac(\( p^(- 1 \/ 2) \)'', p^(- 1 \/ 2)) = 3 / 4 \( p' \/ p \)^2 - 1 / 2 p'' \/ p . $
  The approximate pair has constant nonzero Wronskian. Its transfer matrix in the $N$ norms is at most $C exp \( \| H_f \( r \) - H_f \( t \) \| \)$: $K asymp \| p \|$, and $integral \| p - sqrt(\| F \|) \| thin d r lt.eq C$ by (4.17). Variation of constants for the residual followed by Gronwall bounds the difference between exact and approximate transfer by
  $ \( C M^(- 3 \/ 2) + o \( 1 \) \) e^(\| H_f \( r \) - H_f \( t \) \|) . quad "(4.18)" $ <spec:transfer-error>
  Indeed the residual divided by $K$ has integral bounded by (4.17); when $r \, s \, t$ occur in order, monotonicity of $H_f$ gives $\| H_f \( r \) - H_f \( s \) \| + \| H_f \( s \) - H_f \( t \) \| = \| H_f \( r \) - H_f \( t \) \|$. This removes the exponential factor from the integral inequality. With no turn the error coefficient is $o \( 1 \)$.
  At $E$, the prescribed data select the outgoing approximate branch up to an error tending to zero. On the positive outer interval, (4.17) bounds its normalized amplitude above and below, because the absolute imaginary action is bounded. Consequently
  $ c lt.eq F^(1 \/ 4) \| U \| lt.eq C \, #h(2em) frac(U', sqrt(F) thin U) = h i + O \( M^(- 3 \/ 2) \) + o \( 1 \) . quad "(4.19)" $ <spec:positive-branch>
  This proves all claims in the no-turn case.
  In a turning case set $xi = \( r - r_0 \) \/ d_0$ and $Y \( xi \) = d_0^(- 1 \/ 2) U \( r_0 + d_0 xi \)$. Since $F' \( r_0 \) d_0^3 = 1$ and $gamma d_0^2 arrow.r 0$, its equation converges on every fixed $xi$ interval to
  $ Y''_oo + xi Y_oo = 0 . quad "(4.20)" $ <spec:airy-equation>
  The corresponding transfer on $\[ - M \, M \]$ is bounded in the scaled data norm, with a bound depending only on fixed $M$. Figure 2 records these three regions.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0.6, 0), (5, 2.1), fill: rgb("#f7f0ec"))
  rect((5, 0), (9, 2.1), fill: rgb("#f0f0f0"))
  rect((9, 0), (13.4, 2.1), fill: rgb("#f1f4f6"))
  line((5, 0), (5, 2.1), stroke: (paint: rgb("#8c8c8c")))
  line((9, 0), (9, 2.1), stroke: (paint: rgb("#8c8c8c")))
  line((7, 0), (7, 1.3), stroke: (paint: rgb("#8c8c8c")))
  content((2.8, 1.7), [Forbidden region#linebreak()$F<0$])
  content((7, 1.7), [Airy window#linebreak()$|r-r_0| lt.eq M d_0$])
  content((11.2, 1.7), [Oscillatory region#linebreak()$F>0$])
  line((1.1, 0.65), (4.5, 0.65), stroke: (paint: rgb("#a35c2b")), mark: (start: "<"))
  content((2.8, 0.65), [growing branch to the left], anchor: "south")
  content((7, 0.65), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#f0f0f0"), [$xi =(r-r_0)/d_0$#linebreak()$Y_ infinity ''+ xi Y_ infinity =0$])])
  line((9.6, 0.65), (12.95, 0.65), stroke: (paint: rgb("#305b78")), mark: (end: ">"))
  content((11.25, 0.65), [outgoing branch], anchor: "south")
  line((0.25, 0), (14, 0), stroke: (paint: rgb("#404040")), mark: (end: ">"))
  content((14, 0), [$r$], anchor: "west")
  line((0.6, 0.08), (0.6, -0.09))
  line((5, 0.08), (5, -0.09))
  line((7, 0.08), (7, -0.09))
  line((9, 0.08), (9, -0.09))
  line((13.4, 0.08), (13.4, -0.09))
  content((0.6, -0.1), [$R$], anchor: "north")
  content((5, -0.1), [$r_0-"Md"_0$], anchor: "north")
  content((7, -0.1), [$r_0$], anchor: "north")
  content((9, -0.1), [$r_0+"Md"_0$], anchor: "north")
  content((13.4, -0.1), [$E$], anchor: "north")
  content((7, -1.05), [Normalized Airy limit: $ "Im" ( Y_ infinity Y_ infinity ' ) != 0$])
  content((7, -1.6), [$"nonzero" "flux" \ arrow.r.double.long \ "nonzero" "growing" "component" "on" "the" "forbidden" "side"$])
})],
    caption: [Figure 2: Schematic of a channel with one turning point in the high-parameter estimate, with $R in \[ B_0 \, B_1 \]$ as in Lemma 25. The scalar solution is selected at $E$ by $U \( E \) = F \( E \)^(- 1 \/ 4)$ and $U' \( E \) = h i sqrt(F \( E \)) thin U \( E \)$. For a fixed large $M$, pass to a subsequence and take the high-parameter limit in the window using $Y = d_0^(- 1 \/ 2) U$ and $xi = \( r - r_0 \) \/ d_0$. The resulting Airy solution has constant nonzero flux, so it contains a branch growing towards $R$. Only after this fixed-window limit is $M$ allowed to tend to infinity to obtain the normalized logarithmic derivative $U' \( R \) \/ \( sqrt(- F \( R \)) thin U \( R \) \) arrow.r - 1$. Distances are not to scale, and the arrows indicate branch selection, not a graph of $U$ or a sign assertion for its complex values. ],
  ) <fig:turning>
  Choose one fixed $M_0$ so large that the error in (4.19) is below its lower amplitude margin. At $xi = M_0$, the scaled Cauchy data are bounded and their flux
  $ "Im" \( overline(Y) Y' \) = "Im" \( overline(U) U' \) $
  has sign $h$ and magnitude bounded below. A subsequence of these data converges, and continuous dependence of the scaled ODE gives one solution $Y_oo$ on every fixed interval. Its flux is nonzero and constant, since (4.20) has real coefficients.
  We spell out why this gives the required #emph[relative] margin on the forbidden side. With $t = - xi$, the real equation is $y'' - t y = 0$. On a sufficiently late half-line it has a positive growing solution comparable to $t^(- 1 \/ 4) exp \( 2 t^(3 \/ 2) \/ 3 \)$. To construct one, prescribe the growing approximate data at a fixed large $T$ and use the residual transfer estimate with $p = sqrt(t)$: the total error relative to the growing scale is at most $C T^(- 3 \/ 2)$. The exact solution and its derivative are positive when $T$ is large. Its logarithmic slope $z = y' \/ \( sqrt(t) thin y \)$ satisfies
  $ z' = sqrt(t) \( 1 - z^2 \) - frac(z, 2 t) . $
  This equation implies $z arrow.r 1$: for every fixed $epsilon.alt > 0$, its derivative points into $\[ 1 - epsilon.alt \, 1 + epsilon.alt \]$ at both endpoints for sufficiently large $t$, and outside that interval it points inwards with magnitude bounded below by a positive multiple of $sqrt(t)$. A decaying independent solution is obtained by multiplying the growing one by $integral_t^oo y \( s \)^(- 2) thin d s$. The growing comparison bound makes that integral finite and shows that this second solution and its derivative are negligible relative to the first. These real solutions have nonzero Wronskian. A complex multiple of the decaying solution alone has zero flux. Thus the coefficient of the growing solution in $Y_oo$ is nonzero.
  As $M arrow.r oo$ its growing contribution dominates its decaying one, and
  $ frac(Y'_oo \( - M \), sqrt(M) thin Y_oo \( - M \)) arrow.r - 1 . $
  In the approximate basis referenced at $r_(-) = r_0 - M d_0$, the coefficient of growth to the left therefore has magnitude at least a fixed positive fraction of $N_(r_(-)) \( U \)$, for every sufficiently large fixed $M$ and subsequently late sequence indices. That fraction can be chosen independently of $M$: the normalized basis vectors have comparable size one at their reference point, and the displayed slope is separated from the decaying slope $+ 1$. For each such fixed $M$, $N_(r_(-)) \( U \)$ is also bounded below by a positive constant.
  Transfer to $R$ now gives a growing term of size at least $c N_(r_(-)) \( U \) e^(H_f \( R \) - H_f \( r_(-) \))$; the decaying term is negligible since the action difference tends to infinity. The transfer error (4.18), relative to this growing term, is still $C M^(- 3 \/ 2) + o \( 1 \)$ with $C$ independent of $M$, precisely because of the relative coefficient margin. For the value lower bound, choose one sufficiently large fixed $M$ and retain it; then $H_f \( r_(-) \) = O_M \( 1 \)$ and (4.15) follows with a positive constant. For the slope take an arbitrary sufficiently large fixed $M$, obtain error $C M^(- 3 \/ 2) + o \( 1 \)$, and then let $M arrow.r oo$. This proves (4.15). The transfer estimate follows from the two outer estimates and the scaled central transfer, using one fixed $M$. Both channels can use a common extracted subsequence. Finally, all estimates allow a moving $R$ in the fixed shell, where $\| F_h \( R \) \| asymp n_(*)^2$. If uniformity there failed, the same argument at a sequence of offending endpoints would contradict the estimates. ◻
]

#thm([Lemma 4.7.])[
  (Coupled outgoing data on a fixed shell).  #emph[After subselection, every outgoing solution along an escaping parameter sequence satisfies, uniformly on $B_0 lt.eq R lt.eq B_1$, 
$ q'_h \( R \) = cal(B)_h \( R \) q_h \( R \) + o \( n_(*) \) \| q \( R \) \| . quad "(4.21)" $ <spec:shell-robin>

 The error is an operator bound on the two-dimensional outgoing space.]
] <spec:boundary-estimate>

#proof[
  For each scalar channel let $D_h \( R \) = 0$, $D'_h \( R \) = K_h \( R \)^(1 \/ 2)$. Lemma 25 gives
  $ N_r \( D_h \) lt.eq C e^(H_h \( R \) - H_h \( r \)) \, quad N_r \( U_h \) lt.eq C e^(H_h \( r \)) \, quad \| cal(W) \( D_h \, U_h \) \| gt.eq c e^(H_h \( R \)) \, $
  where $H_h = H_f$ in that channel. The Green kernel with left Dirichlet data and the right Robin condition of $U_h$ is the product of $D_h$ on the left and $U_h$ on the right, divided by the Wronskian. It obeys the following two different action bounds:
  $ N_r \( G_h \( r \, t \) \) lt.eq C K_h \( t \)^(- 1 \/ 2) cases(delim: "{", e^(H_h \( t \) - H_h \( r \)) \, & r < t \,, e^(H_h \( r \) - H_h \( t \)) \, & r > t .) quad "(4.22)" $ <spec:green-actions>
  Each exponential is at most one, by monotonicity within its own channel. There is no comparison of $H_(+)$ and $H_(-)$. A right Robin derivative error $beta_h$, with zero left data, similarly gives $N_r lt.eq C K_h \( E \)^(- 1 \/ 2) \| beta_h \|$; this follows either from the same Wronskian or by using $D_h$ for the correction.
  Let $kappa = min_(h \, r in \[ R \, E \]) K_h \( r \)$. Then $kappa arrow.r oo$: at a turn it is $d_0^(- 1)$, and in the no-turn case it is comparable to $sqrt(S)$. Put $cal(N) \( q \) = max_h sup_r N_r \( q_h \)$. The matrix forcing in (4.11) has Green norm at most
  $ C max_(h \, j) integral_R^E frac(t^(- 2) thin d t, sqrt(K_h \( t \) K_j \( t \))) lt.eq frac(C, R kappa) = o \( 1 \) . quad "(4.23)" $ <spec:coupling-norm>
  Also $K_h \( E \) asymp E$ for both channels, so the right error (4.12) has norm at most $C E^(- 2) cal(N) \( q \)$. The diagonal outgoing extension $q_h \( R \) U_h \( r \) \/ U_h \( R \)$ has norm at most $C n_(*)^(1 \/ 2) \| q \( R \) \|$, since $K_h \( R \) asymp n_(*)$ and $H_h \( r \) lt.eq H_h \( R \)$. Variation of constants and absorption of (4.23) and the Robin error give
  $ cal(N) \( q \) lt.eq C n_(*)^(1 \/ 2) \| q \( R \) \| \, #h(2em) cal(N) (q - (q_h \( R \) U_h \/ U_h \( R \))_h) = o \( 1 \) n_(*)^(1 \/ 2) \| q \( R \) \| . $
  Taking the derivative at $R$ costs $K_h \( R \)^(1 \/ 2) asymp n_(*)^(1 \/ 2)$. Together with (4.15), this is (4.21). Every estimate used is homogeneous in the left data and uniform over the shell. ◻
]

#thm([Lemma 4.8.])[
  (Exclusion of escaping parameters).  #emph[There is no sequence of nonzero regular outgoing modes with $a arrow.r 0$, $- 1 \/ 32 lt.eq "Re" lambda lt.eq 4$, and $ell + \| "Im" lambda \| arrow.r oo$.]
] <spec:high-exclusion>

#proof[
  Use (4.9) and Lemma 26. All volume pairings in this proof have weight $mu$, and $\[ dot.op \]$ denotes its surface integral at the current sphere, including the factor $r^11$. On a fixed ball $mu$ is uniformly bounded above and below, and the coefficients of $W$ and $L + Delta$ are uniformly bounded.
  In Case I pair (4.3) with $X$ on the ball $r < B_1$ and take real parts. The second-order term is
  $ integral \( \| nabla X \|^2 + \( P \/ a \) \| f \|^2 \) mu - "Re" \[ X^(*) X' \] . $
  The boundary term has nonpositive real part, by (4.21) and both negative signs of $F_h$. More precisely its real part is $1 / 2 "Re" sum_h overline(q)_h q'_h + O \( \| q \|^2 \)$, so its leading value is $- c n_(*) \| q \|^2$ and absorbs its errors. The absolute value of the remaining real terms is at most $C parallel X parallel_2 parallel nabla X parallel_2 + C \( 1 + omega \) parallel X parallel_2^2$. The angular barrier
  $ parallel nabla X parallel_2^2 gt.eq ell \( ell + 10 \) B_1^(- 2) parallel X parallel_2^2 $
  and $omega = o \( ell^2 \)$ absorb these terms into an arbitrarily small fraction of the gradient term. Nonnegative pressure then gives a contradiction.
  In Case II normalize
  $ integral_(r < B_1) \( \| X \|^2 + \| nabla X \|^2 \) mu = 1 . quad "(4.24)" $ <spec:case-II-normalization>
  Write the shell error in (4.21) as $epsilon n_(*) \| q \|$, with $epsilon arrow.r 0$. Its leading diagonal has modulus at least $c n_(*)$, so $n_(*) \| q \| lt.eq C \| q' \|$ on the shell. There is a point in its first half at which both $\| q' \|$ and $n_(*) \| q \|$ are bounded, by the shell integral bound furnished by (4.24). For the channel $h = - 1$, the energy $\| q'_(-) \|^2 + F_(-) \| q_(-) \|^2$ propagates this bound to $B_1$. Indeed $\| F'_(-) \| \/ F_(-) lt.eq C$, $F_(-) asymp n_(*)^2$ on the shell, and the forcing in its equation has bounded integral, since it is at most $C \| q \|$ there. Differentiating the square root of this energy and applying Gronwall proves
  $ \| q'_(-) \| + n_(*) \| q_(-) \| lt.eq C $
  from that point to $B_1$. The positive channel then obeys, in the upper-derivative sense,
  $ frac(d, d r) \| q_(+) \| lt.eq - \( sqrt(- F_(+)) - epsilon n_(*) \) \| q_(+) \| + C epsilon . $
  The distance from the chosen point to $B_1$ is at least $1 \/ 2$. Integrating this inequality with $sqrt(- F_(+)) gt.eq c n_(*)$ gives
  $ n_(*) q_(+) \( B_1 \) arrow.r 0 \, #h(2em) q'_(+) \( B_1 \) arrow.r 0 . quad "(4.25)" $ <spec:plus-vanishing>
  We next remove the other boundary channel by a flux identity. The imaginary part of the pairing of (4.3) with $X$ is
  $ "Im" \[ X^(*) X' \] = frac(w \( B_1 \), 2) "Im" \[ X^(*) J X \] + \( sigma - c_(*) \/ 2 \) integral "Im" \( X^(*) J X \) mu . quad "(4.26)" $ <spec:flux>
  To check the first-order term, integration by parts and (4.4) give
  $ 2 "Im" integral X^(*) J W X thin mu = w \( B_1 \) "Im" \[ X^(*) J X \] - c_(*) integral "Im" \( X^(*) J X \) mu . $
  Also the pressure-free equation $L g = \( lambda + W \) f$, tested against $g$, gives
  $ lr(|integral overline(g) f thin mu|) lt.eq C \/ omega . quad "(4.27)" $ <spec:cross-small>
  Its integrated gradient term, $W$ term, and boundary term are bounded by the normalization and the boundary bounds already obtained. The change to circular coordinates gives the exact cancellation
  $ "Im" \[ X^(*) X' \] - frac(w \( B_1 \), 2) "Im" \[ X^(*) J X \] = 1 / 2 sum_h "Im" \( overline(q)_h q'_h \) \( B_1 \) . $
  Multiplying (4.26) by $n_(*) asymp sqrt(omega)$, and using (4.27), makes its right volume term tend to zero. The positive channel contributes $o \( 1 \)$ by (4.25). The outgoing relation for the other channel gives $"Im" \( overline(q)_(-) q'_(-) \) = - sqrt(F_(-)) \| q_(-) \|^2 + o \( n_(*) \) \| q_(-) \| \| q \|$. Its sign and $F_(-) asymp n_(*)^2$ imply
  $ n_(*) \| q \( B_1 \) \| + \| q' \( B_1 \) \| arrow.r 0 . quad "(4.28)" $ <spec:all-boundary-small>
  Rellich compactness on the ball, including the full angular fields, gives a strongly $L^2$ convergent subsequence of $f$. The equation $L g - W f = lambda f$ has uniformly bounded left side in $H^(- 1)$ by the normalization. Division by $lambda$, whose modulus tends to infinity, shows that the limit is zero. Thus
  $ f arrow.r 0 quad upright("strongly in ") L^2 \( r < B_1 \) . quad "(4.29)" $ <spec:f-small>
  Finally put $S_d = W + c_(*) \/ 2$ and test (4.3) against $S_d X$. The real part of the second-order and pressure terms is
  $ & integral (nabla X^(*) \( nabla w \) nabla X - 1 / 2 W \( P \/ a \) \| f \|^2) mu\
 & thin + frac(w \( B_1 \), 2) \[ \| nabla X \|^2 + \( P \/ a \) \| f \|^2 \] - "Re" \[ \( S_d X \)^(*) X' \] . $
  All boundary terms vanish by (4.28); the tangential derivatives cost $ell lt.eq n_(*)$, and $P \/ a$ is bounded on this exterior sphere. The $J S_d X$ pairing has zero real part. For $I = integral \( S_d X \)^(*) J X thin mu$, (4.29) and one integration by parts in the term containing $W f$ give $I arrow.r 0$. Further,
  $ 2 "Im" I = w \( B_1 \) "Im" \[ X^(*) J X \] . $
  Hence $omega "Im" I arrow.r 0$, since $omega = O \( n_(*)^2 \)$ and the boundary values are $o \( n_(*)^(- 1) \)$. The remaining pairing $\( lambda - c_(*) \/ 2 \) I$ therefore has real part tending to zero. We conclude that the displayed bulk integral tends to zero. The profile estimates $nabla w gt.eq c I$ and $W \( P \/ a \) lt.eq C$, together with (4.29), force $parallel nabla X parallel_2 arrow.r 0$. The vanishing boundary trace and Poincaré’s inequality then force $parallel X parallel_2 arrow.r 0$, contradicting (4.24). ◻
]

=== 4.3 The constrained compact limit <the-constrained-compact-limit>

The preceding estimates keep every possible mode in a bounded set of angular and spectral parameters as $a arrow.r 0$. We now fix an angular degree and analyze that bounded region. The pressure coefficient $P_a \/ a$ becomes singular in the core; its limiting effect is the constraint $f = 0$ there. We first prove convergence of the inverses with this constraint, then use an analytic compact pencil to transfer both the limiting roots and their algebraic multiplicities to positive $a$.

#thm([Lemma 4.9.])[
  (Convergence of the constrained inverses).  #emph[Fix $ell$ and a convergent profile subsequence. Let $R = 2 sqrt(Z)$ be its limiting core radius, and fix a sufficiently large outer radius $B_2 > r_b$. Let $E$ be the Hilbert space of $H^1$ pairs in this harmonic on the ball $r < B_2$, and let 
$ cal(Z) = L^2 \( r < B_2 \; bb(C)^2 \) xor bb(C)^2 \, #h(2em) j_E X = \( X \, X \( B_2 \) \) . $

 The map $j_E : E arrow.r cal(Z)$ is compact. Define $T_a : E' arrow.r E$ by the coercive form 
$ frak(b)_a \( X \, Theta \) = integral (nabla Theta^(*) nabla X + Theta^(*) X + \( P \/ a \) overline(Theta_f) f) mu . quad "(4.30)" $ <spec:base-form>

 The dual $E'$ consists of conjugate-linear functionals on test vectors. Let 
$ E_0 = { \( f \, g \) in E : f = 0 upright(" a.e. on ") r < R } \, $

 and let $T_0 : E' arrow.r E_0$ be the inverse of the limiting form, with no pressure term and tests restricted to $E_0$. Then 
$ parallel j_E T_a - j_E T_0 parallel_(E' arrow.r cal(Z)) arrow.r 0 . quad "(4.31)" $ <spec:inverse-norm>

]
] <spec:inverse-limit>

#proof[
  Rellich compactness gives the volume part of $j_E$; in a fixed harmonic the trace has only two scalar entries and is bounded, hence compact. Uniform upper and lower bounds on $mu$ give uniform coercivity of (4.30). Inverses exist by the Hilbert-space coercive form argument, also on the closed subspace $E_0$.
  We prove a stronger sequential statement. Let $F_a harpoon.rt F$ be any bounded weakly convergent sequence in $E'$, and put $X_a = T_a F_a$. Coercivity gives a bounded sequence in $E$ and
  $ integral P_a \| f_a \|^2 thin d y lt.eq C a . $
  After extraction, $X_a harpoon.rt X$ in $E$ and $j_E X_a arrow.r j_E X$ strongly. Uniform boundedness of $P_a$ permits replacing $\| f_a \|^2$ by $\| f \|^2$ in the last integral, with error $o \( 1 \)$. Its weak-star limit $b upright(bold(1))_(r < R)$ therefore gives $b integral_(r < R) \| f \|^2 = 0$. This proves $X in E_0$ without any pointwise lower bound on pressure near its moving transition.
  Test first with $Theta in E_0$ whose first component is supported a fixed positive distance outside $r = R$. On that support the limiting amplitude is strictly below one, so $P_a \/ a arrow.r 0$ uniformly. The other coefficients converge uniformly on the ball. Weak convergence in $E$, and weak convergence of the inputs against this fixed test, therefore give the limiting inverse equation. Such tests are dense in $E_0$. Indeed the first component has zero outer trace at $R$; cutting it off across $\[ R + epsilon.alt \, R + 2 epsilon.alt \]$ costs, in addition to its shrinking collar norm, at most
  $ C epsilon.alt^(- 2) integral_R^(R + 2 epsilon.alt) \| Theta_f \|^2 thin d r lt.eq C integral_R^(R + 2 epsilon.alt) \| partial_r Theta_f \|^2 thin d r arrow.r 0 . $
  The radial weight is comparable to a positive constant on this collar. The second component needs no cutoff. Density and uniqueness identify $X = T_0 F$. Every subsequence has the same possible strong limit after $j_E$, proving $j_E T_a F_a arrow.r j_E T_0 F$ for weakly varying inputs.
  If (4.31) failed, choose unit witnessing inputs and extract a weakly convergent subsequence in the Hilbert dual. The sequential assertion just proved and compactness of $j_E T_0$ would make both images converge strongly to $j_E T_0 F$, a contradiction. This proves exactly the stated norm convergence; no operator-norm convergence into the full $H^1$ space is asserted. ◻
]

#thm([Lemma 4.10.])[
  (The analytic compact pencil).  #emph[Near each bounded candidate $lambda$, choose $B_2$ sufficiently large. The regular outgoing mode equation is equivalent to 
$ \( I - cal(C)_a \( lambda \) \) z = 0 quad upright("on ") cal(Z) \, #h(2em) cal(C)_a \( lambda \) = j_E T_a K_a \( lambda \) . quad "(4.32)" $ <spec:compact-equation>

 These are compact holomorphic families, and $cal(C)_a arrow.r cal(C)_0$ locally uniformly in operator norm.]
] <spec:compact-pencil>

#proof[
  Lemma 22 and its large-radius normalization show that the values of a slow basis at $B_2$ form an invertible matrix, uniformly in a small neighborhood of the candidate parameter and for sufficiently small $a$. Thus the outgoing condition is
  $ X' \( B_2 \) = cal(M)_a \( lambda \) X \( B_2 \) \, $
  with holomorphic matrices converging locally uniformly to $cal(M)_0$. Define $K_a$ on volume values and boundary entries by its pairing with $Theta in E$:
  $ chevron.l K_a \( lambda \) j_E X \, Theta chevron.r =  & integral {Theta^(*) \( I + \( c_(*) - lambda \) J \) X + \( W Theta \)^(*) J X} mu\
 & + \[ Theta^(*) \( cal(M)_a \( lambda \) - w \( B_2 \) J \) X \] . quad "(4.33)" $ <spec:K-form>
  The boundary bracket is at $B_2$. This is the weak equation obtained by integrating $- Theta^(*) J W X$ by parts. It uses only the two types of data in $j_E X$. Its coefficients converge uniformly, and hence $K_a : cal(Z) arrow.r E'$ converges locally uniformly in operator norm. Lemma 28 proves the asserted convergence of $cal(C)_a$, and compactness follows by factoring through $E$. For a kernel vector $z$ its lift is $X = T_a K_a z$, with $j_E X = z$. For positive $a$, smooth elliptic regularity gives a regular solution through the origin; its Robin condition extends it uniquely into the slow space. Conversely any regular outgoing mode satisfies the weak equation. These two maps are inverse on the kernels. ◻
]

#thm([Lemma 4.11.])[
  (Interface conditions and the limiting determinant).  #emph[The limiting kernel in (4.32) consists of free slow exterior modes satisfying 
$ f \( R \) = 0 \, #h(2em) g \( R + \) = g \( R - \) \, #h(2em) g' \( R + \) = g' \( R - \) \, #h(2em) g \( r \) = c r^ell quad \( r < R \) . quad "(4.34)" $ <spec:matching>

 It is nonzero exactly when the two-column determinant of Proposition 3 vanishes.]
] <spec:interface>

#proof[
  The form domain gives $f = 0$ in the core and continuity of both traces at $R$. Testing the second equation without a constraint on its test component gives $L g = \( lambda + W \) f$ across the interface. Its right side is locally $L^2$ and has no surface delta, since $f$ is $H^1$. Radial integration therefore makes $mu r^11 g'$ continuous. Positivity and continuity of $mu$ give continuity of $g'$. Inside the core $mu = 1$ and $f = 0$, so regularity and harmonicity give $g = c r^ell$. Piecewise ODE regularity supplies the one-sided derivatives involved. The first equation may contain a constraint reaction at $R$; the form domain does not impose any condition on $f' \( R + \)$. In particular we do not impose the generally false condition $f' \( R + \) = 0$.
  Since $Q \( R \) = 1$ and $Q' \( R \) = 0$, the exterior circular conditions are
  $ v_(+) + v_(-) = 0 \, #h(2em) \( partial_r - ell \/ R \) \( v_(+) - v_(-) \) = 0 . $
  Using (4.5), the derivative of the argument $- h i r^2 \/ 4$ is $- h i r \/ 2$. Consequently these two equations, after nonzero row and column scalings and a sign change in one unknown coefficient, have columns
  $ binom(H \( lambda + ell \/ 2 - h i b \, 6 + ell \, - h i Z \), - H' \( lambda + ell \/ 2 - h i b \, 6 + ell \, - h i Z \)) \, #h(2em) h = plus.minus 1 . quad "(4.35)" $ <spec:free-determinant>
  This is exactly the determinant of Proposition 3. The columns are nonzero by Lemma 7. ◻
]

#thm([Lemma 4.12.])[
  (Symmetry roots and first-order chains).  #emph[At the limiting disk root $j \( b \, Z \) = 0$, the only roots of (4.35) in $"Re" lambda gt.eq - 1 \/ 32$ are $0 \, 1$ for $ell = 0$ and $1 \/ 2$ for $ell = 1$, each simple. The compact pencil $I - cal(C)_0$ has a one-dimensional kernel at each such root and no first-order analytic chain.]
] <spec:simplicity>

#proof[
  For every positive $a$ the first circular components $i Q$, $partial_j Q$, and $\( a - i b + D \/ 2 \) Q$ solve the linearized equation at $0 \, 1 \/ 2 \, 1$, respectively, by differentiating phase, center, and blow-up time. These identities can also be checked without referring to a family of solutions. The first-component generator is
  $ cal(A) v = i Delta v - D v \/ 2 - a v + i b v - i D_Q \( \| Q \|^(1 \/ a) Q \) v . $
  Phase covariance gives $cal(A) \( i Q \) = 0$; differentiating the stationary equation gives $cal(A) \( partial_j Q \) = partial_j Q \/ 2$. Commuting $D$ with $Delta$ and using homogeneity gives $cal(A) \( D Q \/ 2 \) = i Delta Q$ and $cal(A) \( a Q \) = - i \| Q \|^(1 \/ a) Q$, whose sum equals $\( a - i b + D \/ 2 \) Q$ by the stationary equation. The term $- i b Q$ is a phase multiple and contributes zero.
  At $a = 0$ the same exterior identities hold with the power term deleted. The limiting phase, time, and translation fields satisfy (4.34). For the time mode its first circular component at $R$ is $- i b$, while its derivative is $- R b \/ 2$, which is real; for a translation it has value zero and derivative $- b$ times the appropriate first harmonic. These facts follow from the exterior profile equation $Q'' \( R \) = - b$. The phase mode is immediate. They are slow by the free expansions; in the time mode the leading tail exponent cancels. They are nonzero: $b > 0$, and the exterior profile is nonconstant. Proposition 3 gives exactly two, one, and zero roots with multiplicity in degrees $0 \, 1 \,$ and $ell gt.eq 2$. Thus the displayed distinct roots exhaust the counts and are simple.
  Suppose the compact pencil has a first-order chain, that is, $z_0 eq.not 0$ and
  $ \( I - cal(C)_0 \( lambda_0 \) \) z_0 = 0 \, #h(2em) \( I - cal(C)_0 \( lambda_0 \) \) z_1 - cal(C)'_0 \( lambda_0 \) z_0 = 0 . $
  Lift it by $T_0 K_0$, including the derivative term in the lift of $z_1$. Both first components vanish in the core. Differentiating the second equation shows that both $g$ components are harmonic there, since its new forcing is the leading $f$, which vanishes in the core. Both obey the interface trace and derivative requirements. At $B_2$ the correction satisfies the differentiated Robin condition
  $ X'_1 = cal(M)_0 \( lambda_0 \) X_1 + cal(M)'_0 \( lambda_0 \) X_0 . $
  The analytic slow basis extends these data to a first-order exterior solution. Therefore its two coefficients satisfy $D_0 c_0 = 0$ and $D_0 c_1 + D'_0 c_0 = 0$, where $D_0 \( lambda \)$ is the matrix in (4.35). A simple determinant zero has rank one and nonzero derivative pairing between a null vector and a conull vector. Applying that conull vector to the second equation is a contradiction. Kernel dimension one follows from the same matrix and the unique harmonic continuation into the core. ◻
]

#proof[
  First work in a fixed harmonic and a compact spectral neighborhood. The compact pencil is Fredholm of index zero. At a limiting simple root split its domain into the kernel and a closed complement, and its range into the image and a one-dimensional complement. The complement block is invertible, so elimination reduces the local kernel problem to a scalar holomorphic function. Its derivative is nonzero: vanishing would produce exactly the first-order chain excluded by Lemma 31. Locally uniform norm convergence in Lemma 29 gives locally uniform convergence of this scalar function and its derivative, by Cauchy’s formula. The argument principle on a small circle therefore gives one zero counted with multiplicity for small $a$. The exact symmetry mode places that zero at $0 \, 1 \/ 2 \,$ or $1$, so it remains simple. Away from the limiting roots invertibility persists by a Neumann series.
  If the classification failed for arbitrarily small $a$, select offending modes with $a arrow.r 0$. Lemma 23 bounds their real parts, and Lemma 27 bounds their angular and imaginary parameters. Extract a fixed harmonic, a convergent spectral parameter, and convergent profile parameters. The preceding compact-pencil argument gives a contradiction. This also gives the assertion uniformly over all the profiles in Proposition 13. Lemma 22 then proves the homogeneous top-derivative assertion.
  Finally suppose a regular vector $v_1$ with the top-derivative condition satisfies $\( cal(A) - lambda_0 \) v_1 = v_0$, where $v_0$ is one of the surviving modes. Choose an analytic exterior slow family $v \( lambda \)$ with $v \( lambda_0 \) = v_0$. Differentiating its mode equation gives $\( cal(A) - lambda_0 \) partial_lambda v = v_0$ on the exterior. Its differentiated slow tail has bounds
  $ \| partial_r^k partial_lambda v \| lt.eq C r^(- 2 \( a + "Re" lambda_0 \) - k) \( 1 + log r \) . $
  For example, Cauchy’s formula on parameter circles of radius $\( 1 + log r \)^(- 1)$ gives these bounds from the locally uniform analytic slow construction. This tail is square integrable in order $k gt.eq 7$ at the three nonnegative eigenvalues. Subtracting it from $v_1$ leaves a homogeneous exterior solution with the same top-derivative condition, so Lemma 22 makes that difference outgoing. The original $v_1$ consequently satisfies the differentiated Robin condition and produces a forbidden first-order chain of the finite-$a$ compact pencil. This proves the claimed algebraic simplicity and completes the proof. ◻
]

== 5 Linear decay and transfer to expanding tori <sec:linear>

Fix one sufficiently small admissible $a > 0$ and a profile $Q = A e^(i phi.alt)$ from Proposition 13 for which Theorem 20 holds. All constants in this section may depend on this fixed profile and on $a$. No uniformity as $a arrow.b 0$ is needed here. Put $P = \| Q \|^(1 \/ a)$ and write the real-linear potential as

$ cal(V) v = P (1 + frac(1, 2 a)) v + frac(P, 2 a) e^(2 i phi.alt) overline(v) \, #h(2em) cal(A) = i Delta - 1 / 2 y dot.op nabla - a + i b - i cal(V) . quad "(5.1)" $ <lin:potential>

The profile estimates give, for every nonnegative integer $j$,

$ \| nabla^j Q \( y \) \| lt.eq C_j chevron.l y chevron.r^(- 2 a - j) \, #h(2em) \| nabla^j cal(V) \( y \) \| lt.eq C_j chevron.l y chevron.r^(- 2 - j) . quad "(5.2)" $ <lin:symbol-hypotheses>

The second inequality applies to each of the two coefficients in (5.1). We take $0 < a < 1$. The argument below uses the all-order estimates only up to a finite order, after that order has been chosen.

=== 5.1 Spaces, products, and localization <spaces-products-and-localization>

Set $s_0 = 6 - a$. For an integer $k > 8$ to be fixed below, let $Y$ be the real Hilbert space obtained by completing complex-valued Schwartz functions in

$ parallel v parallel_Y^2 = parallel v parallel_(dot(H)^(s_0) \( bb(R)^12 \))^2 + parallel v parallel_(dot(H)^k \( bb(R)^12 \))^2 . quad "(5.3)" $ <lin:Y>

Homogeneous Fourier multipliers have their usual Plancherel normalization. In particular, no global $L^2$ norm is included in (5.3). The choice $6 - 2 a < s_0 = 6 - a < 6$ serves two purposes: the lower inequality admits the profile tail of order $r^(- 2 a)$, while the upper inequality makes the inverse Fourier weight integrable at low frequency. Under the free similarity evolution this norm component will have squared-norm rate $6 - s_0 - 2 a = - a < 0$. The high order $k$ supplies the local regularity and the remaining dissipation.

For $L gt.eq 1$ put $bb(T)_L^12 = bb(R)^12 \/ \( 2 pi L bb(Z) \)^12$. If $v \( y \) = sum_(n in bb(Z)^12) v_n e^(i n dot.op y \/ L)$, define

$ parallel v parallel_(Y_L)^2 = \( 2 pi L \)^12 sum_n [\( L^(- 2) + \| n \/ L \|^2 \)^(s_0) + \| n \/ L \|^(2 k)] \| v_n \|^2 . quad "(5.4)" $ <lin:YL>

Thus $Y_L$ is $H^k \( bb(T)_L^12 \)$ with a scale-dependent norm. The regularization in its first summand is essential: a constant of value $z$ has norm $\( 2 pi \)^6 L^a \| z \|$. Throughout this section $nabla^k$ is the #emph[ordered] derivative tensor: its components are $partial_(j_1) dots.h.c partial_(j_k)$ for all ordered $k$-tuples. Consequently $parallel nabla^k v parallel_2^2 = parallel v parallel_(dot(H)^k)^2$ exactly.

#thm([Lemma 5.1.])[
  (Uniform spatial estimates).  #emph[The embeddings $Y arrow.r.hook C_0 \( bb(R)^12 \)$ and $Y_L arrow.r.hook L^oo \( bb(T)_L^12 \)$ are bounded, uniformly for $L gt.eq 1$. Both spaces are algebras, with a uniform algebra constant for $Y_L$. For a ball or annulus of radius $R gt.eq 1$, contained in one torus cell when appropriate and with $R lt.eq C_0 L$, one has 
$ parallel nabla^j v parallel_(L^2 \( upright("ball or annulus") \)) lt.eq C R^(max \( s_0 - j \, 0 \)) parallel v parallel \, #h(2em) 0 lt.eq j lt.eq k . quad "(5.5)" $ <lin:local-derivatives>

 Here and below an undecorated norm denotes the applicable $Y$ or $Y_L$ norm, and constants may depend on the fixed geometric constant $C_0$.]
  #emph[If $F$ satisfies $\| nabla^j F \| lt.eq C_j chevron.l y chevron.r^(- beta - j)$, then a smooth dyadic piece supported where $\| y \| asymp R$ satisfies 
$ parallel psi_R F parallel lt.eq C #scale(x: 120%, y: 120%)[\(] R^(6 - beta - s_0) + R^(6 - beta - k) #scale(x: 120%, y: 120%)[\)] \, quad "(5.6)" $ <lin:symbol-norm>

 also on the tori for $R lt.eq C_0 L$. In particular $Q in Y$, and for every fixed $chi in C_c^oo \( B_1 \)$ the cutoff profiles $chi \( y \/ L \) Q \( y \)$ have uniformly bounded $Y_L$ norms.]
] <lin:spatial>

#proof[
  For the continuous Fourier transform, Cauchy–Schwarz uses
  $ integral_(\| xi \| lt.eq 1) \| xi \|^(- 2 s_0) thin d xi < oo \, #h(2em) integral_(\| xi \| gt.eq 1) \| xi \|^(- 2 k) thin d xi < oo . $
  Thus $parallel hat(v) parallel_1 lt.eq C parallel v parallel_Y$. This identifies the completion in (5.3) with functions vanishing at infinity, rather than with distributions modulo polynomials. In the periodic case the corresponding inverse-weight sum, after division by $\( 2 pi L \)^12$, is uniformly bounded. Indeed its portion $\| n \| lt.eq L$ is bounded by
  $ C L^(- 12 + 2 s_0) sum_(\| n \| lt.eq L) chevron.l n chevron.r^(- 2 s_0) lt.eq C \, $
  and the portion $\| n \| > L$ is bounded using $k > 6$. The convolution inequality $\| xi + zeta \|^s lt.eq C_s \( \| xi \|^s + \| zeta \|^s \)$, and its version for $\( L^(- 2) + \| xi \|^2 \)^(s \/ 2)$, now prove the algebra estimates by Young’s inequality. The volume factors in (5.4) cancel against the Fourier $ell^1$ estimate just proved.
  For $j < s_0$, split at frequency $R^(- 1)$. The low-frequency part has $j$th derivative bounded pointwise by $C R^(- a - j) parallel v parallel$. This follows by the same inverse-weight integral or sum; it includes the periodic zero mode. Multiplication by the square root of the volume of the ball gives $C R^(s_0 - j) parallel v parallel$. On higher frequencies, Plancherel gives that same bound because $\| xi \|^j lt.eq R^(s_0 - j) \| xi \|^(s_0)$ there. For $s_0 lt.eq j lt.eq k$, the global derivative norm is bounded by the two defining Sobolev norms. This proves (5.5).
  For a localized symbol, the integer derivative norms of order $m$ are $O \( R^(6 - beta - m) \)$, with the same bounds for derivatives falling on $psi_R$. Fourier interpolation gives the fractional order in (5.6). The additional periodic term is bounded by
  $ L^(- s_0) parallel psi_R F parallel_2 lt.eq C \( R \/ L \)^(s_0) R^(6 - beta - s_0) \, $
  since the first norm in (5.4) is uniformly equivalent to $parallel dot.op parallel_(dot(H)^(s_0)) + L^(- s_0) parallel dot.op parallel_2$. For $beta = 2 a$ the first exponent in (5.6) is $- a$; both exponents are negative. Summing dyadic pieces proves the last assertions, and also convergence of smooth compactly supported approximations to $Q$ in $Y$. ◻
]

Fix a real $chi in C_c^oo \( B_1 \)$ with $0 lt.eq chi lt.eq 1$ and $chi = 1$ on $B_(1 \/ 2)$. Define

$ J_L v \( y \) = chi \( y \/ L \) v \( y \) \, quad "(5.7)" $ <lin:localization>

using the central-cell representative on its support and extending by zero to $bb(R)^12$. There is a constant $C_J$, independent of $L gt.eq 1$, such that

$ parallel J_L v parallel_Y lt.eq C_J parallel v parallel_(Y_L) . quad "(5.8)" $ <lin:J-bound>

Here is a direct verification, useful because a fractional derivative does not localize pointwise. Up to fixed Fourier normalization constants,

$ accent(J_L v, ̂) \( xi \) = L^12 sum_n v_n hat(chi) \( L xi - n \) . $

For $s = s_0 \, k$, set $zeta = L xi$ and use $\| zeta \|^s lt.eq C_s chevron.l n chevron.r^s chevron.l zeta - n chevron.r^s$. The mixed discrete-to-continuous convolution map with kernel $chevron.l zeta chevron.r^s \| hat(chi) \( zeta \) \|$ is bounded from $ell^2$ to $L^2$: Cauchy–Schwarz uses the uniformly bounded sum of its translates, followed by integration of the kernel. It follows that

$ parallel J_L v parallel_(dot(H)^s)^2 lt.eq C L^(12 - 2 s) sum_n chevron.l n chevron.r^(2 s) \| v_n \|^2 . $

For $s = k$ the extra term $L^(- 2 k) parallel v parallel_2^2$ is controlled by the regularized low-order norm since $L^(- k) lt.eq L^(- s_0)$. This proves (5.8).

=== 5.2 Evolution and dissipation with a local observation <evolution-and-dissipation-with-a-local-observation>

The free operator $cal(A)_0 = cal(A) + i cal(V)$ has the group

$ S_0 \( s \) v \( y \) = e^(\( - a + i b \) s) [e^(i \( 1 - e^(- s) \) Delta) v] \( e^(- s \/ 2) y \) \, #h(2em) s in bb(R) . quad "(5.9)" $ <lin:free-flow>

Fourier approximation proves strong continuity on $Y$. The potential is bounded on $Y$: since $p = 1 + 1 \/ a$ is an odd integer, its coefficients are polynomials in $Q \, overline(Q)$, and Lemma 32 applies. The integral equation

$ S \( s \) v = S_0 \( s \) v - i integral_0^s S_0 \( s - t \) cal(V) S \( t \) v thin d t quad "(5.10)" $ <lin:mild>

therefore constructs a strongly continuous real-linear group on $Y$. Successive approximation on short intervals proves existence, and Gronwall’s inequality proves uniqueness and boundedness on every compact time interval.

For the torus evolution, put $L_s = L e^(s \/ 2)$ and

$ Q_s \( y \) = chi \( y \/ L_s \) Q \( y \) \, #h(2em) cal(V)_s = D #scale(x: 120%, y: 120%)[\(] \| U \|^(1 \/ a) U #scale(x: 120%, y: 120%)[\)] \|_(U = Q_s) . quad "(5.11)" $ <lin:torus-coefficients>

Both are defined cellwise and periodically. In particular $cal(V)_s = chi \( y \/ L_s \)^(p - 1) cal(V)$ on the central cell. The equation is

$ \( partial_s + 1 / 2 y dot.op nabla \) v = i Delta v - a v + i b v - i cal(V)_s v . quad "(5.12)" $ <lin:torus-evolution>

It is interpreted on the expanding torus: the left side differentiates at fixed $y \/ L_s$. Formula (5.9) and a nonautonomous version of (5.10) apply. The uniform product bounds give a unique propagator with bounds depending on a fixed slab length, but independent of the starting scale $L gt.eq 1$.

Let $B$ bound the pointwise real operator norms of $cal(V)$ and all $cal(V)_s$. It is finite and independent of $k$; one may take $B = \( 1 + 1 \/ a \) parallel P parallel_oo$. We now choose and fix an integer

$ k > max { 8 \, thin 6 - 2 a + 2 B + 1 } . quad "(5.13)" $ <lin:k-choice>

Subsequent constants may depend on this $k$.

#thm([Lemma 5.2.])[
  (Compact errors).  #emph[For every $epsilon > 0$ there are $R_epsilon \, C_epsilon < oo$ such that 
$ parallel cal(V)_(*) v parallel_(s_0 \, *) + parallel nabla^k \( cal(V)_(*) v \) - cal(V)_(*) nabla^k v parallel_2 lt.eq epsilon parallel v parallel + C_epsilon parallel v parallel_(L^2 \( B_(R_epsilon) \)) . quad "(5.14)" $ <lin:compact-bound>

 Here $*$ denotes either the whole-space potential and homogeneous low-order norm, or a torus potential at its current scale and the regularized low-order norm in (5.4). The constants are uniform for all sufficiently large current torus scales. The potential acts componentwise on the ordered tensor in the second term.]
] <lin:compact-error>

#proof[
  All coefficient derivatives have the bounds in (5.2), uniformly for the cutoff potentials. On an annulus of radius $R$, a lower Leibniz term with $j < k$ derivatives on $v$ has norm at most
  $ C_k R^(- 2 - k + j + max \( s_0 - j \, 0 \)) parallel v parallel . quad "(5.15)" $ <lin:top-tail>
  Every exponent is negative: it is $- 2 - k + s_0$ for $j < s_0$ and at most $- 3$ otherwise. Dyadic summation therefore makes these tail terms arbitrarily small.
  For the fractional part, use a smooth dyadic partition and apply #emph[global] Fourier interpolation to the actual localized product $z_R = psi_R cal(V)_(*) v$. Leibniz’ rule, including derivatives of $psi_R$, gives
  $ parallel nabla^5 z_R parallel_2 lt.eq C R^(- 2 + s_0 - 5) parallel v parallel = C R^(- 1 - a) parallel v parallel \, #h(2em) parallel nabla^6 z_R parallel_2 lt.eq C R^(- 2) parallel v parallel . $
  In the second estimate, terms with at most five derivatives on $v$ are actually $O \( R^(- 2 - a) \)$; the sixth derivative term is $O \( R^(- 2) \)$. Since $s_0 = 5 a + 6 \( 1 - a \)$, interpolation yields the explicit bound
  $ parallel z_R parallel_(dot(H)^(s_0)) lt.eq parallel nabla^5 z_R parallel_2^a parallel nabla^6 z_R parallel_2^(1 - a) lt.eq C R^(- 2 + a - a^2) parallel v parallel . quad "(5.16)" $ <lin:fractional-tail>
  The identical proof uses Fourier sums on a torus. Its remaining regularized term is bounded separately by
  $ L_s^(- s_0) parallel z_R parallel_2 lt.eq C R^(- 2) \( R \/ L_s \)^(s_0) parallel v parallel lt.eq C R^(- 2) parallel v parallel \, quad "(5.17)" $ <lin:zero-mode-tail>
  with a harmless geometric constant when $R lt.eq C_0 L_s$. Both exponents are summable over dyadic annuli; indeed $- 2 + a - a^2 lt.eq - 7 \/ 4$ for $0 < a < 1$. Summation uses the Sobolev triangle inequality, not a locality assertion for fractional derivatives.
  It remains to estimate a fixed interior region. Its low-order product is controlled by a local $H^6$ norm, and the lower top-order Leibniz terms by a local $H^(k - 1)$ norm. Choose a slightly larger fixed ball and a cutoff equal to one on the region. The usual interpolation inequality on these two balls gives, for each $m < k$,
  $ parallel v parallel_(H^m \( B_R \)) lt.eq delta parallel v parallel_(H^k \( B_(2 R) \)) + C_(R \, m \, delta) parallel v parallel_(L^2 \( B_(2 R) \)) . $
  For completeness, this follows from compactness of the embedding $H^k \( B_(2 R) \) arrow.r H^m \( B_R \)$: a failure after normalizing the left side would give a bounded sequence whose $L^2$ norm tends to zero but whose $H^m$ norm does not. Local extension and Fourier truncation give this compactness. By (5.5), the $H^k$ norm on the fixed larger ball is bounded by $C_R parallel v parallel$. Choose the tail radius first and $delta$ next. This proves (5.14), including the interior contribution of the regularized torus term. ◻
]

#thm([Proposition 5.3.])[
  (Energy observation inequality).  #emph[There are $c > 0$, $C < oo$, and $R_0 < oo$ such that every whole-space linear solution, and every torus linear solution with sufficiently large starting scale, satisfies 
$ frac(d, d s) parallel v \( s \) parallel^2 lt.eq - c parallel v \( s \) parallel^2 + C parallel v \( s \) parallel_(L^2 \( B_(R_0) \))^2 . quad "(5.18)" $ <lin:energy-observation>

 The derivative can equivalently be understood through the integrated inequality. The constants are independent of the torus scale and of the slab length. In particular, for $t gt.eq 0$, 
$ parallel v \( t \) parallel^2 lt.eq e^(- c t) parallel v \( 0 \) parallel^2 + C integral_0^t e^(- c \( t - s \)) parallel v \( s \) parallel_(L^2 \( B_(R_0) \))^2 thin d s . quad "(5.19)" $ <lin:integrated-observation>

]
] <lin:observation>

#proof[
  The two squared free norm rates, on both kinds of space, are
  $ 6 - s_0 - 2 a = - a \, #h(2em) 6 - k - 2 a . quad "(5.20)" $ <lin:free-rates>
  For the first periodic norm this also uses $L_s^(- 2) = e^(- s) L^(- 2)$; thus the zero mode has exactly the same first rate. At order $k$, the leading potential term contributes at most $2 B parallel nabla^k v parallel_2^2$. This constant does not grow with $k$, because the same pointwise operator acts on each ordered derivative component. All combinatorial constants occur only in the lower terms covered by Lemma 33. The entire fractional potential term is also covered there. Consequently, writing $N_0 \, N_k$ for the two norm components, one obtains
  $ frac(d, d s) \( N_0^2 + N_k^2 \) lt.eq - a N_0^2 - \( k + 2 a - 6 - 2 B \) N_k^2 + C parallel v parallel #scale(x: 120%, y: 120%)[\(] epsilon parallel v parallel + C_epsilon parallel v parallel_(L^2 \( B_(R_epsilon) \)) #scale(x: 120%, y: 120%)[\)] . $
  Choose $epsilon$ after the fixed $k$, and apply Young’s inequality. Condition (5.13) leaves a positive $c$.
  This computation does not demand two additional derivatives of the initial datum. On a short step pull the mild solution back by its free propagator. Strong continuity and the bounded potential give first variation $- i cal(V)_(*) v$ in the relevant space, while the two free squared norms acquire exactly the exponential factors in (5.20). Taking the norm variation gives the displayed inequality for arbitrary mild solutions. Equivalently one can first use smooth data, integrate the inequality, and pass to general data by the uniform mild-solution bounds. This proves (5.19) as well. ◻
]

=== 5.3 Actual decay on the whole-space stable subspace <actual-decay-on-the-whole-space-stable-subspace>

Let $E : bb(R)^14 arrow.r Y$ have columns

$ i Q \, quad partial_1 Q \, dots.h \, partial_12 Q \, quad \( a - i b + 1 / 2 y dot.op nabla \) Q \, #h(2em) Lambda = "diag" \( 0 \, 1 / 2 \, dots.h \, 1 / 2 \, 1 \) . quad "(5.21)" $ <lin:E>

These columns are independent symmetry vectors, as established in Theorem 20.

The passage from dissipation modulo a compact term to stable semigroup decay also appears in #cite(label("BuckEtAl2026")) Section 4.2. Here the full mode classification identifies the complementary spectral space with the fourteen symmetry directions above.

#thm([Theorem 5.4.])[
  (Stable whole-space evolution).  #emph[There is a bounded real-linear map $pi : Y arrow.r bb(R)^14$ such that 
$ pi E = I \, #h(2em) S \( s \) E = E e^(s Lambda) \, #h(2em) pi S \( s \) = e^(s Lambda) pi quad \( s in bb(R) \) . quad "(5.22)" $ <lin:spectral-coordinates>

 For some $C_S < oo$ and $eta > 0$, 
$ parallel S \( s \) v parallel_Y lt.eq C_S e^(- eta s) parallel v parallel_Y \, #h(2em) s gt.eq 0 \, quad pi v = 0 . quad "(5.23)" $ <lin:stable-decay>

 Thus $E pi$ is the symmetry spectral projection. Constants depend on the fixed profile, $a$, and $k$.]
] <linear:decay>

#proof[
  We first obtain a statement about the bounded time-one operator $T = S \( 1 \)$, rather than deducing decay from a generator spectral gap. If $v_j harpoon.rt 0$ in $Y$ and $parallel v_j parallel lt.eq 1$, then for every fixed $s$ the functions $S \( s \) v_j$ converge strongly to zero in $L^2 \( B_(R_0) \)$. Indeed they converge weakly in $Y$, and the restriction from $Y$ to that $L^2$ space is compact by (5.5) and local Sobolev compactness. Slab bounds and dominated convergence in (5.19) give
  $ limsup_j parallel T v_j parallel lt.eq e^(- c \/ 2) . quad "(5.24)" $ <lin:essential-contraction>
  The same conclusion holds on the complexification, by adding the two real energy inequalities.
  Let $F_N$ be increasing finite-dimensional orthogonal projections converging strongly to the identity. Formula (5.24) implies $limsup_N parallel T \( I - F_N \) parallel lt.eq e^(- c \/ 2)$: otherwise unit vectors in the complements of $F_N$ would give a weakly null counterexample. For some $N$ we therefore have
  $ T = B_0 + K_0 \, #h(2em) parallel B_0 parallel = q < 1 \, #h(2em) "rank" K_0 < oo . $
  Outside $\| z \| lt.eq q$, invert $z - B_0$ and write $K_0 = U V$ through a finite-dimensional space. The resolvent of $T$ is determined by the finite matrix $I - V \( z - B_0 \)^(- 1) U$. Its determinant is analytic and tends to one as $\| z \| arrow.r oo$. Thus the spectrum there consists of isolated eigenvalues with finite-dimensional generalized eigenspaces; there are only finitely many outside any larger disk. This also proves the usual spectral decomposition in this region by the finite-matrix resolvent formula.
  Choose $r$ with
  $ max { q \, e^(- 1 \/ 32) } < r < 1 $
  and with $\| z \| = r$ disjoint from the spectrum. Every spectral subspace of $T$ outside this circle is preserved by $S \( s \)$, because $S \( s \)$ commutes with the time-one resolvent and its contour integrals. The restricted continuous group on a finite-dimensional space is a matrix exponential. Each of its generator eigenvalues $lambda$ satisfies $"Re" lambda = log \| z \| > log r > - 1 \/ 32$ for the corresponding time-one eigenvalue $z$.
  Its generator equations are the distributional equations for (5.1), as follows by differentiating (5.10) against compactly supported smooth tests. Local elliptic regularity gives smoothness of eigenvectors and chain vectors. Projection onto any spherical harmonic gives regular radial solutions of the mode equation in Theorem 20. The unweighted radial $k$th derivative is in $L^2 \( r^11 d r \)$: along each ray $partial_r^k$ is a contraction of the ordered tensor $nabla^k$, and angular projection is bounded on $L^2$ of each sphere. Smoothness of the projection at the origin follows by projecting the Taylor polynomials, using the harmonic decomposition of homogeneous polynomials. The top-derivative criterion in Theorem 20 excludes the fast exterior branches, including in a generalized eigenvector after subtraction of the differentiated slow basis. That theorem therefore leaves precisely the symmetry vectors (5.21) and excludes all nontrivial Jordan chains. Completeness of spherical harmonics gives the statement for the original vectors; a nontrivial chain would have a nonzero harmonic projection of its leading vector and hence would contradict the same classification.
  Conversely all columns of $E$ lie in $Y$ by (5.6); the time column even has symbol order $- 2 a - 2$, since its leading slow power cancels. They are generator domain vectors with the asserted eigenvalues. To check the domain claim directly, multiply a column by a smooth cutoff at radius $R$. Both the discarded symbol tail and the commutator
  $ i \[ Delta \, chi \( y \/ R \) \] E - 1 / 2 \( y dot.op nabla chi \( y \/ R \) \) E $
  tend to zero in $Y$ by the same dyadic estimates. The smooth compactly supported approximations thus converge in the generator graph norm. It follows that the entire spectral subspace outside $\| z \| = r$ is $"ran" E$, with the action in (5.22). Complex conjugation in the complexification preserves its projection, so this projection is the complexification of a bounded real projection $E pi$.
  On its complement, the spectrum of $T$ lies in $\| z \| lt.eq r$. Choose $r < r_1 < 1$. The contour formula for powers on $\| z \| = r_1$ gives
  $ parallel T^n \|_(ker pi) parallel lt.eq r_1^(n + 1) max_(\| z \| = r_1) parallel \( z - T \|_(ker pi) \)^(- 1) parallel . $
  Bounded propagation for the remaining time in $\[ 0 \, 1 \]$ proves (5.23), with $eta = - log r_1 > 0$ and an enlarged $C_S$. This derivation supplies actual semigroup decay, not only a description of the generator spectrum. ◻
]

=== 5.4 A transfer proposition for expanding tori <a-transfer-proposition-for-expanding-tori>

Define the cellwise cutoff symmetry map $E_L = chi \( y \/ L \) E$. The bounds already proved imply

$ sup_(L gt.eq 1) parallel E_L parallel < oo \, #h(2em) J_L E_L arrow.r E quad upright("in ") cal(L) \( bb(R)^14 \, Y \) . quad "(5.25)" $ <lin:EL-convergence>

Indeed $J_L E_L = chi \( y \/ L \)^2 E$, and its omitted dyadic tail tends to zero. For all sufficiently large $L$ put

$ C_L = pi J_L E_L \, #h(2em) pi_L = C_L^(- 1) pi J_L \, #h(2em) P_L = E_L pi_L . quad "(5.26)" $ <lin:piL>

Then $C_L arrow.r I$, $pi_L E_L = I$, and $P_L$ is a projection. The operator norms of $E_L \, pi_L \, P_L$, and $I - P_L$ are uniformly bounded. Let $cal(F)_L^(\( M \)) : Y_L arrow.r Y_(L e^(M \/ 2))$ denote evolution by (5.12) from time zero to time $M$.

#thm([Proposition 5.5.])[
  (Uniform expanding-torus transfer).  #emph[For each fixed $M > 0$ the step maps $cal(F)_L^(\( M \))$ are uniformly bounded for all sufficiently large $L$. Writing $L' = L e^(M \/ 2)$, 
$ lim_(L arrow.r oo) parallel pi_(L') cal(F)_L^(\( M \)) - e^(M Lambda) pi_L parallel_(cal(L) \( Y_L \, bb(R)^14 \)) = 0 . quad "(5.27)" $ <lin:coordinate-defect>

 There exists $M_0 < oo$ such that for every fixed $M gt.eq M_0$ there is $L_0 \( M \) < oo$ for which 
$ parallel \( I - P_(L') \) cal(F)_L^(\( M \)) \|_(ker pi_L) parallel_(cal(L) \( Y_L \, Y_(L') \)) lt.eq 1 / 8 \, #h(2em) L gt.eq L_0 \( M \) . quad "(5.28)" $ <lin:torus-stable-contraction>

 Moreover $parallel \( I - P_(L') \) cal(F)_L^(\( M \)) E_L parallel lt.eq C_M$. Any prescribed positive bound on the coordinate defect can be imposed by enlarging $L_0 \( M \)$ after $M$ has been fixed. These bounds persist after restarting a step at any larger scale.]
  #emph[After identifying torus spaces by dilation, the maps above and the step propagator are continuous when the scale and the input vary continuously. This last assertion is strong continuity for varying inputs, and does not assert operator-norm continuity of Schrödinger time evolution.]
] <linear:torus>

#proof[
  We give the compactness and uniqueness argument in detail. Fix $M$ and a sequence $L_j arrow.r oo$ with initial data $v_j \( 0 \)$ bounded in $Y_(L_j)$. Write $L_(j \, s) = L_j e^(s \/ 2)$. Uniform slab bounds and (5.5) give boundedness in local $H^k$, uniformly for $0 lt.eq s lt.eq M$. On each fixed ball the equation also bounds $partial_s v_j$ in $H^(k - 2)$; the drift coefficient is bounded on that ball. Local compactness, interpolation, and Arzelà–Ascoli therefore give a subsequence converging in $C \( \[ 0 \, M \] \; L^2 \( B_R \) \)$ for every fixed $R$, to a function $v$. One may obtain the stronger convergence in local $H^(k - 1)$, but it is unnecessary here.
  The localized functions $J_(L_(j \, s)) v_j \( s \)$ are bounded in $Y$ by (5.8). At each $s$, every weakly convergent subsequence has the same distributional limit $v \( s \)$, since $chi \( y \/ L_(j \, s) \) = 1$ on each fixed ball for all large $j$. Thus
  $ J_(L_(j \, s)) v_j \( s \) harpoon.rt v \( s \) quad upright("in ") Y quad \( 0 lt.eq s lt.eq M \) \, #h(2em) parallel v \( 0 \) parallel_Y lt.eq C_J liminf_j parallel v_j \( 0 \) parallel_(Y_(L_j)) . quad "(5.29)" $ <lin:weak-local-limit>
  The limit is weakly continuous in $Y$: boundedness and its local continuity identify the weak limit along every converging time sequence. As $Y$ is separable, it is strongly measurable and bounded on this slab. The torus coefficients agree with the whole-space coefficients on each fixed ball eventually, so local passage in the equation gives $partial_s v = cal(A) v$ in distributions.
  This distributional solution is the whole-space mild solution. To see this without a propagation assertion, test against Schwartz functions transported by the free adjoint. Formula (5.9) preserves Schwartz functions, uniformly on compact time intervals. The global $L^oo$ bound supplied by $Y$, and the at-most-linear growth of the drift, justify removal of spatial cutoffs in these tests. Integration in time gives
  $ S_0 \( - s \) v \( s \) = v \( 0 \) - i integral_0^s S_0 \( - t \) cal(V) v \( t \) thin d t $
  as tempered distributions. The integral is a Bochner integral in $Y$ by boundedness of $cal(V)$ and strong measurability. The distributional identity is therefore an identity in $Y$ and is equivalent to (5.10). Uniqueness gives
  $ v \( s \) = S \( s \) v \( 0 \) . quad "(5.30)" $ <lin:limit-identification>
  Finite dimensionality, (5.29), and $C_L arrow.r I$ now imply convergence of the initial and final coordinates to $pi v \( 0 \)$ and $pi S \( M \) v \( 0 \)$, respectively. Their difference in (5.27) tends to zero by (5.22). This proves convergence in operator norm: failure would furnish a sequence of unit initial vectors witnessing a fixed positive lower bound, to which exactly the preceding subsequence argument applies.
  For the contraction, take such a sequence with $parallel v_j \( 0 \) parallel_(Y_(L_j)) = 1$ and $pi_(L_j) v_j \( 0 \) = 0$. The limit satisfies $pi v \( 0 \) = 0$, so (5.23) gives
  $ parallel v \( s \) parallel_Y lt.eq C_S C_J e^(- eta s) . $
  The constants in this estimate are independent of the fixed slab length $M$. Apply the integrated observation inequality (5.19) #emph[before] passing to a local limit. The full initial norm is still one in its first term. Local uniform convergence passes only the observation integral to the limit, giving
  $ limsup_j parallel cal(F)_(L_j)^(\( M \)) v_j \( 0 \) parallel_(Y_(L_j e^(M \/ 2)))^2 lt.eq D \( M \) := e^(- c M) + C_1 integral_0^M e^(- c \( M - s \)) e^(- 2 eta s) thin d s . quad "(5.31)" $ <lin:escaped-norm>
  Here $C_1$ uses only the fixed observation embedding, $C_J$, $C_S$, and the energy constant; it does not contain the slab bound $C_M$. Any norm that escaped to spatial infinity remains charged in the first term $e^(- c M)$. In particular a zero local limit causes no loss in this estimate.
  The quantity $D \( M \)$ tends to zero as $M arrow.r oo$; when $c = 2 eta$ its integral is $M e^(- c M)$, and otherwise it is $\( e^(- 2 eta M) - e^(- c M) \) \/ \( c - 2 eta \)$. Let $C_P$ uniformly bound $parallel I - P_L parallel$ for sufficiently large $L$. Choose $M_0$ so that $C_P sqrt(D \( M \)) < 1 \/ 16$ for every $M gt.eq M_0$. For each such fixed $M$, a failure of (5.28) along arbitrarily large $L$ would supply unit stable vectors contradicting (5.31). This proves the required order of choices: first $M$, then $L$. The stated bound on the map from $E_L$ follows from the uniform step and projection bounds. Restarting a step uses the same formulas with its current scale as the initial scale.
  Finally identify $v in Y_L$ with $v \( L x \)$ on $bb(T)^12$. On a compact range of positive $L$, these norms are equivalent to $H^k$, continuously in $L$. The free step on this fixed torus has Fourier phases $exp \( - i \| n \|^2 L^(- 2) \( 1 - e^(- s) \) \)$ and scalar factor $e^(\( - a + i b \) s)$. Dominated convergence of the weighted Fourier sum proves strong continuity for continuously varying inputs. The cutoff coefficients are smooth and continuous in $L$ on each finite slab; successive approximation in the integral equation transfers this continuity to the full propagator. Dilation is strongly continuous on $Y$, which gives the same assertion for $J_L \, E_L$ and then for $pi_L \, P_L$ by (5.26). This completes the proof. ◻
]

== 6 Nonlinear stability, open sets, and Gaussian data <sec:nonlinear>

We first construct a decaying graph for fixed similarity parameters. By varying phase, center, and blowup time, we then show that every datum in a small physical $H^k$ neighborhood admits parameters placing its transformed perturbation on that graph. The graph construction is a discrete Lyapunov–Perron argument, related to #cite(label("BuckEtAl2026")) Proposition 4.8. Selecting symmetry parameters by a finite-dimensional topological argument has a focusing antecedent in #cite(label("Li2023")) Section 6.3; here the graph also depends on the expanding-torus scale.

Fix one sufficiently small admissible $a = 1 \/ \( p - 1 \)$, with $p$ odd, and one profile $Q$ given by Proposition 13. Fix the integer $k > 8$ and the spaces, cutoff, and spectral coordinates from Section 5. Every constant in this section may depend on this fixed profile and on $k$. In particular, no estimate uniform in $p$ is needed. We use the Euclidean norm on the fourteen spectral coordinates.

=== 6.1 Uniform nonlinear step maps <uniform-nonlinear-step-maps>

Let $L_s = L e^(s \/ 2)$ and, on the central cell of the expanding torus, set

$ Q_s \( y \) = chi \( y \/ L_s \) Q \( y \) . $

Extend this function periodically. The operator $partial_s + y dot.op nabla \/ 2$ differentiates at fixed $y \/ L_s$, so the transport derivative of the cutoff is zero. Write $cal(N) \( z \) = \| z \|^(p - 1) z$. The defect of $Q_s$ in the similarity equation is

$ cal(R)_s = 2 nabla chi \( y \/ L_s \) dot.op nabla Q + Delta chi \( y \/ L_s \) Q + #scale(x: 120%, y: 120%)[\(] chi \( y \/ L_s \) - chi \( y \/ L_s \)^p #scale(x: 120%, y: 120%)[\)] cal(N) \( Q \) \, quad "(6.1)" $ <nl:residual-formula>

where the derivatives act on the displayed functions of $y$. Every term is supported in an annulus of radius comparable to $L_s$. The profile symbol estimates imply, for every fixed integer $j gt.eq 0$,

$ \| nabla^j cal(R)_s \| lt.eq C_j L_s^(- 2 - 2 a - j) \, #h(2em) parallel cal(R)_s parallel_(Y_(L_s)) lt.eq C L_s^(- 2 - a) . $

Indeed the low Sobolev order $6 - a$ contributes the factor $L_s^(6 - \( 6 - a \)) = L_s^a$, and the high order contributes a smaller power. The regularized zero-frequency part has the same bound. On another cell write $z = y - 2 pi L_s n$. Then $\( partial_s + y dot.op nabla \/ 2 \) z = z \/ 2$, so this computation is compatible with the periodic lift.

Because $p$ is odd, $cal(N)$ is a polynomial in $z$ and $overline(z)$. The uniform algebra bounds from Section 5 and the uniform bound for $Q_s$ therefore give, with

$ cal(E)_s \( v \) = cal(N) \( Q_s + v \) - cal(N) \( Q_s \) - D cal(N) \( Q_s \) v \, $

the estimates

$ parallel cal(E)_s \( v \) parallel lt.eq C parallel v parallel^2 \, #h(2em) parallel cal(E)_s \( v \) - cal(E)_s \( tilde(v) \) parallel lt.eq C \( parallel v parallel + parallel tilde(v) parallel \) parallel v - tilde(v) parallel quad "(6.2)" $ <nl:quadratic>

on a fixed small ball. All norms in this display are at the current scale.

Choose the step length $M$ in Proposition 36 sufficiently large that also

$ 2 e^(- \( 2 + a \) M \/ 2) < 1 . quad "(6.3)" $ <nl:step-condition>

For a step beginning at scale $L$, put $L' = L e^(M \/ 2)$ and denote its linear evolution by $cal(F)_L$.

#thm([Lemma 6.1.])[
  (Nonlinear step estimate).  #emph[There are $delta > 0$, $L_0 < oo$ and $C_M < oo$ such that, for $L gt.eq L_0$, the perturbation equation $U = Q_s + v$ has a unique solution through the step whenever $parallel v \( 0 \) parallel_(Y_L) lt.eq delta$. Its endpoint is 
$ v \( M \) = cal(F)_L v \( 0 \) + h_L \( v \( 0 \) \) \, $

 where 
$ parallel h_L \( 0 \) parallel & lt.eq C_M L^(- 2 - a) \,\
"Lip"_(parallel v parallel lt.eq d) h_L & lt.eq C_M \( d + L^(- 2 - a) \) #h(2em) \( 0 < d lt.eq delta \) . quad "(6.4)" $ <nl:step-zero>

 During the step, 
$ sup_(0 lt.eq s lt.eq M) parallel v \( s \) parallel_(Y_(L_s)) lt.eq C_M #scale(x: 120%, y: 120%)[\(] parallel v \( 0 \) parallel_(Y_L) + L^(- 2 - a) #scale(x: 120%, y: 120%)[\)] . $

]
] <nl:step>

#proof[
  Identify the expanding spaces by dilation and use the free Fourier propagator from Section 5. On a fixed slab its norm is bounded uniformly in the starting scale, as are the linearized multiplication operators. On sufficiently short substeps, the integral equation is a contraction on a small slab-norm ball by (6.2); the forcing is bounded by (6.1). The short-substep length can be chosen independently of $L$. Iteration and Gronwall’s inequality give the displayed slab bound for sufficiently small $delta$ and large $L_0$.
  At zero initial perturbation the same integral equation gives $O_M \( L^(- 2 - a) \)$, proving (6.4). Differences of two solutions are at most $C_M$ times their initial difference. Subtract the linearized solution from this difference. Its remaining source is $cal(E)_s \( v \) - cal(E)_s \( tilde(v) \)$; use (6.2) and the slab bound. Integration over the fixed slab gives (6.4). These arguments also prove uniqueness. ◻
]

=== 6.2 A graph of decaying perturbations <a-graph-of-decaying-perturbations>

Set $L_n = L e^(n M \/ 2)$ and abbreviate $E_(L_n) \, pi_(L_n) \, P_(L_n)$ by $E_n \, pi_n \, P_n$. The normalized coordinates satisfy $pi_n E_n = I$. Let $D_(*) = e^(M Lambda)$, where $Lambda$ has entries $0$, twelve copies of $1 \/ 2$, and $1$. Thus $parallel D_(*)^(- 1) parallel lt.eq 1$. Split

$ v_n = w_n + E_n u_n \, #h(2em) w_n in ker pi_n \, quad u_n in bb(R)^14 . $

Proposition 36 and Lemma 37 give the recursions

$ w_(n + 1) & = A_n w_n + B_n u_n + \( I - P_(n + 1) \) h_(L_n) \( v_n \) \,\
u_(n + 1) & = D_(*) u_n + e_n \( v_n \) + pi_(n + 1) h_(L_n) \( v_n \) \, quad "(6.5)" $ <nl:forward>

where

$ parallel A_n parallel lt.eq 1 / 8 \, #h(2em) parallel B_n parallel lt.eq C_M \, #h(2em) sup_(n gt.eq 0) parallel e_n parallel arrow.r 0 quad upright("as ") L arrow.r oo . $

Here $e_n = pi_(n + 1) cal(F)_(L_n) - D_(*) pi_n$. All coordinate maps and projections are uniformly bounded.

#thm([Proposition 6.2.])[
  (Continuous stable graph).  #emph[For all sufficiently large $L$ there is a continuous map $G_L$, defined on a fixed small ball in $ker pi_L$, such that the initial perturbation 
$ v_0 = w_0 + E_L G_L \( w_0 \) $

 generates a solution on every similarity-time slab and 
$ parallel v \( s \) parallel_(Y_(L_s)) arrow.r 0 quad \( s arrow.r oo \) . $

 Uniformly in $L$, 
$ \| G_L \( w_0 \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] parallel w_0 parallel + L^(- 2 - a) #scale(x: 120%, y: 120%)[\)] . quad "(6.6)" $ <nl:graph-size>

 The coordinate $G_L \( w_0 \)$ is jointly continuous in $L$ and $w_0$ after identifying periodic functions by dilation.]
] <nl:graph>

#proof[
  For a constant $K gt.eq 1$ to be fixed, use the sequence norm
  $ parallel \( w \, u \) parallel_(cal(X)) = sup_(n gt.eq 0) 2^n #scale(x: 120%, y: 120%)[\(] parallel w_n parallel + K \| u_n \| #scale(x: 120%, y: 120%)[\)] . $
  Define a map by the right side of (6.5) for $w_(n + 1)$, resetting its zeroth coordinate to the prescribed $w_0$, and by
  $ u_n = - sum_(j = n)^oo D_(*)^(n - j - 1) #scale(x: 120%, y: 120%)[\(] e_j \( v_j \) + pi_(j + 1) h_(L_j) \( v_j \) #scale(x: 120%, y: 120%)[\)] quad "(6.7)" $ <nl:backward>
  for the coordinate sequence. The geometric weights make this sum convergent even in the phase coordinate, where $D_(*)$ equals one.
  For differences of sequences, the linear terms in the forward map cost at most $2 \( 1 \/ 8 + C_M \/ K \)$ in the sequence norm. Choose $K$ so that this is less than $1 \/ 2$. The weighted sum in (6.7) costs at most $2 K$ times the weighted supremum of the forcing difference. By (6.4), the remaining Lipschitz costs tend to zero as the sequence ball is made small and then $L$ is made large. The same is true of $e_j$, uniformly in $j$. Consequently the complete map has a contraction constant strictly below one, uniformly for all sufficiently large $L$.
  At the zero sequence the residual forcing is $O_M \( L_n^(- 2 - a) \)$. Condition (6.3) bounds its weighted sequence norm by $C_M L^(- 2 - a)$. Thus a fixed small ball is invariant if $w_0$ is small, and the contraction theorem yields a unique sequence in that ball. Its norm is at most $C \( parallel w_0 parallel + L^(- 2 - a) \)$. The fixed point satisfies (6.5), since consecutive backward sums telescope. Define $G_L \( w_0 \) = u_0$. This proves (6.6) and the decay at step endpoints. Lemma 37 gives the decay between endpoints.
  We spell out the continuity assertion because the free Schrödinger flow is not continuous in operator norm as its time varies. At every fixed index, and after dilation to a fixed torus, the free Fourier formula is strongly continuous in the starting scale and in the input. The polynomial integral equation preserves this continuity on each finite slab. Cutoffs and coordinate maps are likewise strongly continuous: prove this first for smooth functions, then use density and their locally uniform bounds. The finite matrix normalizing $pi_L$ stays invertible and varies continuously.
  Start the sequence contraction at zero. Each iterate is continuous at every fixed coordinate: in (6.7), the summands are continuous and the geometric tail is uniform. The iterates converge uniformly in the sequence norm on the allowed parameter set. Their zeroth coordinate is therefore continuous. This proves the assertion without differentiating the graph or taking an operator-norm limit of Schrödinger propagators. ◻
]

=== 6.3 Physical parameters fill an open neighborhood <physical-parameters-fill-an-open-neighborhood>

For a small $T_0 > 0$, define the smooth periodic reference datum by

$ u_(upright("ref")) \( x \) = T_0^(- a) chi \( x \) Q \( x \/ sqrt(T_0) \) quad "(6.8)" $ <nl:reference>

in the central cell. Its support is contained strictly inside that cell. For physical data $u_(upright("in"))$ near this datum, vary

$ T = T_0 e^beta \, #h(2em) x_(*) = sqrt(T_0) thin zeta \, #h(2em) theta in bb(R) \, #h(2em) d' = \( theta \, zeta \, beta \) in bb(R)^14 . $

Put $L = T^(- 1 \/ 2)$. The required starting perturbation is

$ v_0 \( d' \; u_(upright("in")) \) = e^(- i theta) T^a u_(upright("in")) \( x_(*) + sqrt(T) thin y \) - chi \( y \/ L \) Q \( y \) . quad "(6.9)" $ <nl:starting-perturbation>

#thm([Lemma 6.3.])[
  (Parameter expansion).  #emph[For $\| d' \| lt.eq rho$ with $rho$ fixed and small, uniformly as $T_0 arrow.r 0$, 
$ v_0 \( d' \; u_(upright("ref")) \) = E_L C d' + r \( d' \) \, #h(2em) C d' = \( - theta + b beta \, zeta \, beta \) \, quad "(6.10)" $ <nl:leading-expansion>

 and 
$ parallel r \( d' \) parallel_(Y_L) lt.eq C #scale(x: 120%, y: 120%)[\(] \| d' \|^2 + sqrt(T_0) \| d' \| #scale(x: 120%, y: 120%)[\)] . $

 For fixed $T_0$, replacing $u_(upright("ref"))$ by $u_(upright("in"))$ adds at most $C \( T_0 \) parallel u_(upright("in")) - u_(upright("ref")) parallel_(H^k)$, uniformly on the parameter ball. All these maps are continuous.]
] <nl:parameter-expansion>

#proof[
  Substitution of (6.8) into (6.9) gives
  $ e^(- i theta) e^(a beta) chi \( sqrt(T_0) zeta + sqrt(T) thin y \) Q \( zeta + e^(beta \/ 2) y \) - chi \( sqrt(T) thin y \) Q \( y \) . $
  Taylor expansion of the smooth reference profile yields
  $ chi \( y \/ L \) #scale(x: 120%, y: 120%)[\(] - i theta Q + zeta dot.op nabla Q + beta \( a + y dot.op nabla \/ 2 \) Q #scale(x: 120%, y: 120%)[\)] . $
  The profile symbol bounds and their dyadic norm estimates apply to its first two parameter derivatives: translations preserve the tail bounds, and the dilation derivative $y dot.op nabla$ preserves their order. Hence the Taylor remainder is $O_(Y_L) \( \| d' \|^2 \)$ uniformly in $L$. The translated cutoff differs by $O \( sqrt(T_0) \| zeta \| \)$, with the same scaled derivative estimates on its annulus; multiplication by the profile gives the additional stated error. For small parameters the supports remain strictly inside one physical cell.
  The spectral time vector is $\( a - i b + y dot.op nabla \/ 2 \) Q$. The missing $i b Q$ contributes $b beta$ to the phase coordinate, proving (6.10). On the compact parameter ball with $T_0$ fixed, translation and rescaling from physical $H^k$ to $Y_L$ have uniformly bounded norms. They are strongly continuous, which proves the remaining assertions. Only the smooth reference has been differentiated; no extra derivative is required of nearby $H^k$ data. ◻
]

#proof[
  Choose $a$ and $k$ as above. We seek a zero of the continuous map
  $ Phi \( d' \) = pi_L v_0 \( d' \; u_(upright("in")) \) - G_L #scale(x: 120%, y: 120%)[\(] \( I - P_L \) v_0 \( d' \; u_(upright("in")) \) #scale(x: 120%, y: 120%)[\)] . quad "(6.11)" $ <nl:degree-map>
  The matrix $C$ in Lemma 39 is invertible. At every current scale, $pi_L E_L = I$ and $\( I - P_L \) E_L = 0$ exactly. Consequently the stable argument of $G_L$ contains only the error in that lemma; varying $L$ introduces no leading stable component. By (6.6), on $\| d' \| lt.eq rho$ we have
  $ \| Phi \( d' \) - C d' \| lt.eq C_1 #scale(x: 120%, y: 120%)[\(] rho^2 + sqrt(T_0) rho + epsilon_(upright("data")) + T_0^(1 + a \/ 2) #scale(x: 120%, y: 120%)[\)] \, quad "(6.12)" $ <nl:degree-error>
  where $epsilon_(upright("data")) = C \( T_0 \) parallel u_(upright("in")) - u_(upright("ref")) parallel_(H^k)$.
  Let $c_C > 0$ be the smallest singular value of $C$. First choose $rho$ small enough for the quadratic term in (6.12) to be less than $c_C rho \/ 4$ and for the graph domain requirements to hold. Next choose $T_0$ sufficiently small that all scales are in the range of Proposition 38, and the two $T_0$ terms together are less than $c_C rho \/ 4$. Finally choose a positive physical $H^k$ radius so that the data term is less than $c_C rho \/ 4$. The graph is then defined throughout the closed parameter ball, and on its boundary
  $ \| Phi \( d' \) - C d' \| < c_C rho lt.eq \| C d' \| . $
  The straight-line homotopy to $C$ has no boundary zero. Brouwer degree therefore gives a zero of (6.11) for every datum in this open $H^k$ ball.
  At such a zero the initial perturbation lies on the graph. The resulting similarity solution exists for all $s gt.eq 0$ and its perturbation tends uniformly to zero, by Proposition 38 and the uniform $Y_(L_s) arrow.r L^oo$ embedding. Undoing the similarity variables gives the physical solution on $0 lt.eq t < T$:
  $ u \( t \, x \) = e^(i theta) \( T - t \)^(- a) (frac(T - t, T))^(i b) #scale(x: 120%, y: 120%)[\(] Q_s \( y \) + v \( s \, y \) #scale(x: 120%, y: 120%)[\)] \, quad y = frac(x - x_(*), sqrt(T - t)) \, quad s = log frac(T, T - t) . $
  On each finite similarity slab, the norms are equivalent after dilation to the physical $H^k$ norm. The integral equation and polynomial algebra therefore give $u in C \( \[ 0 \, T \) \; H^k \) ∩ C^1 \( \[ 0 \, T \) \; H^(k - 2) \)$. The usual local uniqueness follows directly from the physical Schrödinger integral equation and its $H^k$ difference estimate. At the center, $Q_s \( 0 \) = Q \( 0 \) eq.not 0$, and hence
  $ \( T - t \)^a \| u \( t \, x_(*) \) \| arrow.r \| Q \( 0 \) \| > 0 . $
  Since $H^k \( bb(T)^12 \)$ embeds continuously into $C^0$, the solution cannot extend continuously in $H^k$ through $T$. This proves the theorem. ◻
]

===== 6.3.1 Higher-dimensional deterministic examples. <higher-dimensional-deterministic-examples.>

For the fixed odd power $p$ in Theorem 1, smooth finite-time blowup data also exist on every standard product torus $bb(T)^d$ with $d gt.eq 12$. To see this, choose the smooth reference datum (6.8) at the center of the blowup ball just constructed. Its solution $u$ remains smooth before its blowup time $T$. Indeed, for each integer $m gt.eq k$, the Fourier convolution estimate gives

$ parallel \| v \|^(p - 1) v parallel_(H^m \( bb(T)^12 \)) lt.eq C_(m \, p \, k) parallel v parallel_(H^k \( bb(T)^12 \))^(p - 1) parallel v parallel_(H^m \( bb(T)^12 \)) . $

The frequency weight of order $m$ is bounded by a sum of weights on single factors, and the remaining factors are controlled by $parallel hat(v) parallel_(ell^1) lt.tilde parallel v parallel_(H^k)$ since $k > 6$. On every $\[ 0 \, tau \] subset \[ 0 \, T \)$, the $H^k$ norm of $u$ is bounded. Duhamel’s formula and Gronwall therefore bound each higher Sobolev norm; local $H^m$ existence, continuation, and $H^k$ uniqueness identify these solutions with $u$ throughout $\[ 0 \, tau \]$. The equation then supplies all time derivatives. This persistence argument takes place entirely in dimension twelve.

Now set $U \( t \, x \, y \) = u \( t \, x \)$ on $bb(T)^12 times bb(T)^(d - 12)$. The extra Laplacian derivatives vanish, so $U$ is a smooth solution of (1.1). The polynomial nonlinearity is Lipschitz on bounded sets, so the $L^2$ difference estimate and Gronwall give uniqueness among smooth solutions on compact time intervals. For every $y$, the center limit from Theorem 1 becomes $\( T - t \)^(1 \/ \( p - 1 \)) \| U \( t \, x_(*) \, y \) \| arrow.r c_0 > 0$. Thus the same time and pointwise blowup rate persist along the product fiber. No higher-dimensional stability or Gaussian-probability conclusion is asserted.

=== 6.4 The Gaussian counterexample <the-gaussian-counterexample>

#proof[
  Fix the pair $p \, k$ supplied by Theorem 1 and take $alpha > k + 6$. Independence and the finite Gaussian second moment give
  $ bb(E) parallel u_0^omega parallel_(H^k)^2 = c_g sum_(n in bb(Z)^12) chevron.l n chevron.r^(2 k - 2 alpha) < oo \, $
  up to the fixed Fourier normalization. Thus the series converges as an $H^k$-valued Gaussian random variable. Its finite Fourier segment has a strictly positive density on the whole finite-dimensional complex coefficient space.
  For completeness, let $B_(H^k) \( f \, epsilon \)$ be any nonempty ball. Choose a finite Fourier projection $P_N$ such that $parallel \( I - P_N \) f parallel_(H^k) < epsilon \/ 4$ and
  $ bb(E) parallel \( I - P_N \) u_0^omega parallel_(H^k)^2 < epsilon^2 \/ 32 . $
  Markov’s inequality gives positive probability that the random tail has norm less than $epsilon \/ 4$ after increasing $N$ further if necessary. Independently, the finite segment belongs to the ball of radius $epsilon \/ 2$ about $P_N f$ with positive probability. The intersection lies in $B_(H^k) \( f \, epsilon \)$, so the law has full support in $H^k$.
  Apply this to the open blowup neighborhood in Theorem 1. It has positive probability for every $alpha > k + 6$. Since $8 < k < alpha - 6$, the exponent $m = k$ lies in the interval in the universal assertion of Corollary 2. The local solution fails its required global continuation with positive probability. The fixed pair also satisfies $s_(upright("cr")) = 6 - 2 \/ \( p - 1 \) > 1$. Hence no finite threshold for this pair, and therefore no universal assertion of the stated form, is possible. ◻
]

== 7 Exact finite arithmetic <cert:arithmetic>

This appendix specifies the finite calculations used in Proposition 3. They involve integers and rational numbers only. The accompanying file #raw("verification/")#raw("certificates/")#raw("exact_verifier.py") implements the recipes below using the Python standard library; its deterministic output is #raw("verification/")#raw("certificates/")#raw("RESULTS.json"). In particular, neither special-function evaluation nor a floating-point root finder is used to decide any inequality. The mathematical identities that permit coefficient truncation are proved in Lemma 9 and below.

Reproduction commands and the exact input and artifact bindings are in #raw("README.md") and #raw("verification/")#raw("certificates/")#raw("README.md"), supplied with the manuscript. The verifier checks the finite comparisons below. Their connection to the profile degree and spectral count is established by the analytic arguments of Section 2.

=== 7.1 Coefficient enclosures <coefficient-enclosures>

For a complex polynomial $X$, write $\| X \|_1$ for the polynomial whose $j$th coefficient is $\| "Re" X_j \| + \| "Im" X_j \|$. An enclosure $\[ X \; e \]$, with nonnegative real coefficients $e_j$, means that the actual $j$th coefficient differs from $X_j$ by a complex number of $ell^1$ norm at most $e_j$. Addition adds the errors; negation, conjugation, and reflection of the variable preserve their absolute bounds. Polynomial multiplication uses convolution and the rule

$ \[ X \; e \] \[ Y \; f \] = \[ X Y \; med e \( \| Y \|_1 + f \) + \| X \|_1 f \] . quad "(7.1)" $ <cert:product-rule>

This follows by expanding $\( X + epsilon \) \( Y + zeta \) - X Y$ and using $\| z w \|_1 lt.eq \| z \|_1 \| w \|_1$ coefficientwise before convolution. The program stores a coefficient as the triple $\( "Re" X_j \, "Im" X_j \, e_j \)$.

For the boundary and exterior tests set

$ H_0 = 10^8 \, #h(2em) B = 33477607 \, #h(2em) S = 270506819 \, #h(2em) \| H_0 b - B \| < 2 \, quad \| H_0 Z - S \| < 2 . quad "(7.2)" $ <cert:integer-box>

The disk (2.2) lies strictly inside this box: substitution of its rational center shows $\| H_0 b_(*) - B \| + H_0 delta < 2$ and $\| H_0 Z_(*) - S \| + H_0 delta < 2$. Repeated occurrences of an uncertain coefficient may be bounded independently in (7.1); this enlarges the enclosure. The polynomial identities used to discard coefficients concern the coherent family with the same actual $b \, Z$ in every occurrence, and do not rely on independent error variables satisfying those identities.

=== 7.2 The left boundary forms <cert:boundary>

Take $K = 8$ and $0 lt.eq ell lt.eq 3$. Every quantity in the following recursion is a polynomial in the real variable $v$. Use the central values

$ t_n = H_0 \( ell \/ 2 + n - 1 \/ 32 \) + i \( H_0 v - B \) \, quad M = H_0 \( ell + 5 \) \, quad s = i S \, quad d_n = t_n - M . $

Give the constant coefficient of $t_n \, d_n \, s$ error $2$, and every other input coefficient error zero. Starting from row vectors $x = \( 1 \, 0 \)$, $y = \( 0 \, 1 \)$, do, for $n = 0 \, dots.h \, 7$,

$ x_(upright("new")) = t_n x + s y \, #h(2em) y_(upright("new")) = d_n y - x_(upright("new")) \, #h(2em) \( x \, y \) arrow.l \( x_(upright("new")) \, y_(upright("new")) \) . quad "(7.3)" $ <cert:forward-recipe>

Define the sesquilinear expression

$ h \( a \, b' \, c \, d \) = M overline(a) c + s \( overline(a) d - overline(b') c \) \,\
A = h \( x_0 \, y_0 \, x_0 \, y_0 \) \, quad D = h \( x_1 \, y_1 \, x_1 \, y_1 \) \, quad C = h \( x_0 \, y_0 \, x_1 \, y_1 \) . $

For any polynomial let $f^(\#) \( v \) = overline(f \( - v \))$, entrywise on coefficients. Replace each of $A \, D \, C$ by its sum with its sharp, and form $A D - C overline(C)$. Relative to (2.22), this simply scales each forward matrix by $H_0$ and the cone matrix by $H_0$, so the determinant is multiplied by the positive constant $H_0^(4 K + 2)$.

Lemma 9 proves that the actual determinant is real, even, and of degree at most 30 throughout the parameter box. Retain its even real coefficient enclosures and write it as $D_ell \( w \) = sum_(j = 0)^15 D_j w^j$, where $w = v^2$. There is no inference from small computed high coefficients here: their vanishing follows from the structural proof. The program also checks the central vanishings as a consistency check.

For each of

$ \( U \, V \, J \) = \( 0 \, 1 \, 1 \) \, quad \( 1 \, 10 \, 1 \) \, quad \( 10 \, 1 \, 0 \) \, quad "(7.4)" $ <cert:substitutions>

compute the coefficient enclosures of

$ \( 1 + J w \)^15 D_ell (frac(U + V w, 1 + J w)) = sum_(j = 0)^15 D_j \( U + V w \)^j \( 1 + J w \)^(15 - j) . quad "(7.5)" $ <cert:transformed-polynomial>

For example, a multiplication-only implementation starts $Q = 0$, $E = 1$ and, for $j = 15 \, dots.h \, 0$, replaces $Q arrow.l Q \( U + V w \) + E D_j$, $E arrow.l E \( 1 + J w \)$. If $\[ X \; e \]$ is the resulting enclosure, the minima over coefficients $0 lt.eq j lt.eq 15$ of $floor.l "Re" X_j \/ \( 1 + e_j \) floor.r$ are

$ ell & \( 0 \, 1 \, 1 \) & \( 1 \, 10 \, 1 \) & \( 10 \, 1 \, 0 \)\
0 & 63 & 60 & 94\
1 & 21 & 178 & 199\
2 & 4 & 13 & 323\
3 & 1115 & 173 & 298 . quad "(7.6)" $ <cert:boundary-table>

Every entry is positive, hence every actual coefficient in (7.5) is strictly positive. The three maps $\( U + V w \) \/ \( 1 + J w \)$ for $w gt.eq 0$ cover $\[ 0 \, 1 \)$, $\[ 1 \, 10 \)$, and $\[ 10 \, oo \)$, respectively. The clearing factors are positive. Thus $D_ell \( v^2 \) > 0$ for every real $v$. This is precisely the determinant inequality used to make the boundary form positive definite in Lemma 9.

=== 7.3 Rational separators and winding <cert:winding>

The count uses no interval errors once the zero-tail parameters have been moved to $\( B \/ H_0 \, S \/ H_0 \)$. Start $x = 0$, $y = 1$ as polynomials in $X$. For $n = 7 \, dots.h \, 0$ set

$ t = H_0 \( X - 1 \/ 32 + ell \/ 2 + n \) - i B \, #h(2em) \( x \, y \) arrow.l #scale(x: 120%, y: 120%)[\(] \( t - H_0 \( ell + 5 \) - i S \) x - i S y \, med t \( x + y \) #scale(x: 120%, y: 120%)[\)] \, $

using the old pair on the right. If $p_j$ denotes

$ p_j = "Im" sum_(k = 0)^j x_k overline(y_(j - k)) \, quad "(7.7)" $ <cert:p-coefficients>

then $P_ell \( X \) = sum p_j X^j$ is the polynomial of Lemma 10, up to a positive common scaling. Its degree is 15 and $p_15 = - 8 S H_0^15$; $p_16 = 0$. The two axis polynomials are therefore

$ cal(R)_ell \( w \) = sum_(j = 0)^7 \( - 1 \)^j p_(2 j) w^j \, #h(2em) cal(I)_ell \( w \) = sum_(j = 0)^7 \( - 1 \)^j p_(2 j + 1) w^j . $

Evaluate both at $w = \( q \/ 100 \)^2$, taking endpoints $q = 0 \, 7500$ and the following intermediate lists:

$ ell & q\
0 & 45 \, 90 \, 145 \, 220 \, 315 \, 450 \, 635 \, 920 \, 1780 \, 3100\
1 & 30 \, 68 \, 116 \, 173 \, 250 \, 350 \, 485 \, 680 \, 1005 \, 1880 \, 3210\
2 & 51 \, 78 \, 94 \, 121 \, 165 \, 218 \, 278 \, 369 \, 490 \, 720 \, 1080 \, 1930 \, 3340\
3 & 57 \, 95 \, 122 \, 157 \, 205 \, 265 \, 333 \, 431 \, 559 \, 784 \, 1148 \, 2020 \, 3521 $

In the order including endpoints, the signs follow the repeating cycle $+ + \, - + \, - - \, + -$, starting at $- +$ in row zero, $+ +$ in row one, and $- -$ in rows two and three. At the two negative arguments $w = - \( q \/ 100 \)^2$, $q = 50 \, 200$, rows zero and one have signs $+ + \, - -$, in that order.

Here is an integer-only recipe for every sign, including a relative margin against cancellation in the sum. For coordinate $c = 0 \, 1$ and argument $w = epsilon \( q \/ 100 \)^2$, $epsilon in { 1 \, - 1 }$, set

$ d_j = p_(2 j + c) 100^(14 - 2 j) \( - epsilon q^2 \)^j \, #h(2em) j = 0 \, dots.h \, 7 . $

The sign of $sum d_j$ is the required sign. For its specified sign $e in { 1 \, - 1 }$, the minimum, over all tests in that row, of

$ ⌊frac(10^4 e sum d_j, sum \| d_j \|)⌋ $

is respectively

$ 583 \, #h(2em) 432 \, #h(2em) 80 \, #h(2em) 68 . quad "(7.8)" $ <cert:separator-margins>

These strictly positive integer margins verify all stated signs. The sign changes give $5 \, 6 \, 7 \, 7$ positive root brackets for $cal(R)_ell$ and $6 \, 6 \, 7 \, 7$ for $cal(I)_ell$. After the stated negative brackets are included, both have seven distinct brackets. The degree bounds then prove simplicity and exhaustion. Lemma 10 gives the argument change and its orientation, converting this finite sign table into the matching counts $2 \, 1 \, 0 \, 0$.

=== 7.4 The high angular multiplier <cert:high-angular>

The path constants in Lemma 8 are bounded using only the rational endpoint values $cos theta.alt_0 = 99 \/ 101$ and $sin theta.alt_0 = 20 \/ 101$, and monotonicity of sine and cosine on the initial arc. For example,

$ sin \( 2 theta.alt_0 \) < .4 \, quad cos \( 2 theta.alt_0 \) > .92 \, quad cos theta.alt_0 > .98 \, quad N lt.eq .04 - 2.70 dot.op .92 = - 2.444 . $

Thus $L' > .98 - 4 \( - 2.444 \) > 10.7$. The lower bound on the arc potential after dropping its nonnegative terms is

$ - 3 - 1 \/ 32 + .3 \( 10.7 \) = 143 \/ 800 > 0 . $

At the join, substitute $u = 10 \/ 101$, $v = Z + 1 \/ 101$ in the formulas for $L \, N$. The disk bounds give $1.13 < L < 1.19$, so the jump lower bound is

$ - 1.5 - .3 \( 1.19 \) + 2.444 = 587 \/ 1000 > 0 . $

On the ray, $u$ and $L$ have slope $99 \/ 101 in \( .98 \, .981 \)$ and $v$ has slope $20 \/ 101 < .20$; these prove every affine bound used in (2.19). Also $M \/ 2 - Z gt.eq 9 \/ 2 - Z_(*) - delta > 0$.

For transparency, let $P \( t \)$ be exactly the rational polynomial in (2.19) and put

$ Q \( t \) = 2 + t \( 33 - 72.2 t + 44.8 t^2 \) + t^4 \( 17.9 - 4.61 t + .54 t^2 \) . $

The seven coefficients of $P - Q$, in ascending order, are

$ & 142518401 / 500000000 \, quad 325932989 / 1000000000 \, quad 15777215591 / 200000000000 \, quad 8728703679 / 200000000000 \,\
 & 34209914771 / 800000000000 \, quad 16113799 / 3125000000 \, quad 60018849 / 40000000000 . quad "(7.9)" $ <cert:high-difference>

They are strictly positive. The two quadratic terms in $Q$ have positive leading coefficient and discriminants

$ \( 72.2 \)^2 - 4 \( 33 \) \( 44.8 \) = - 17519 \/ 25 \, #h(2em) \( 4.61 \)^2 - 4 \( 17.9 \) \( .54 \) = - 174119 \/ 10000 . $

Thus $P > Q > 0$ for $t gt.eq 0$. The denominator $L_0 d_0 \( 1 + 1.5 t \)^2$ is positive there. These comparisons supply exactly the potential positivity needed in the multiplier identity.

=== 7.5 The profile product and degree margin <cert:profile>

This calculation uses exact complex rational scalars and ordinary $2 times 2$ matrix multiplication. For an exact complex matrix $F$, $\| F \|_1$ means entrywise complex $ell^1$ norm. Initialize $U = I$, $X = Y = E = 0$. For $n = 33 \, dots.h \, 0$ set

$ t = n - i b_(*) \, quad F = mat(delim: "(", t - 5 - i Z_(*), - i Z_(*); t, t) \,\
G = - i mat(delim: "(", 1, 0; 1, 1) \, quad H_1 = - i mat(delim: "(", 1, 1; 0, 0) \, quad N = \| G \|_1 + \| H_1 \|_1 \, $

and replace the four matrices simultaneously by

$ frac(1, n + 1) (F U \, quad G U + F X \, quad H_1 U + F Y \, quad \( \| F \|_1 + delta N \) E + N \( \| X \|_1 + \| Y \|_1 \)) . quad "(7.10)" $ <cert:profile-recipe>

Then $U = U_0$, $X = X_0$, $Y = Y_0$ in Lemma 11, while the nonnegative real matrix $delta^2 E$ bounds the entrywise complex $ell^1$ error of the linear approximation. Indeed multiplying a current error by the perturbed factor costs $\( \| F \|_1 + delta N \) E$; the product of the two linear perturbations costs $N \( \| X \|_1 + \| Y \|_1 \)$ after division by $delta^2$. This proves the majorant recurrence, including all higher order terms.

With $m_0 = U_01$, the comparisons in (2.25) are checked by ordinary rational division, or by squaring positive modulus bounds. For example $9 < \| m_0 \| < 10$ means $81 < \| m_0 \|^2 < 100$. The determinant of a backward factor is $t \( t - 5 \)$, independent of $Z$, so a rational upper bound for $\| det L \|^2$ throughout the disk is

$ frac(product_(n = 0)^33 \( n^2 + \( b_(*) + delta \)^2 \) \( \( n - 5 \)^2 + \( b_(*) + delta \)^2 \), \( 34 ! \)^4) . quad "(7.11)" $ <cert:profile-determinant>

Comparison with $\( 6.2 dot.op 10^(- 12) \)^2 \| m_0 \|^4$ proves the last inequality of (2.25).

Here are all the additional comparisons and the formulas propagating them to the analytic quotient. Put

$ x = X_11 \/ m_0 \, #h(2em) y = Y_11 \/ m_0 \, #h(2em) u = U_00 \/ m_0 \, #h(2em) kappa = \( .048 \)^2 . $

The exact rational calculations give

$ \| x \|^2 > kappa \, #h(2em) \( \| x \|^2 - kappa \) \( \| y \|^2 - kappa \) > \( "Re" \( overline(x) y \) \)^2 \,\
\| 1 - i Z_(*) u \/ 5 \| > 2.34 \, #h(2em) \| u \| < 3.18 \, #h(2em) \| x \| < .159 \, #h(2em) \| y \| < .124 . quad "(7.12)" $ <cert:profile-extra>

The first line is Sylvester’s criterion for the Gram matrix of the real-linear map $\( eta \, zeta \) mapsto eta x + zeta y$, minus $kappa I$, to be positive definite. It proves minimum stretch greater than $.048$. The rectangles in (2.25) also show $"Re" x "Im" y - "Im" x "Re" y < 0$.

To make the error propagation fully reproducible, define the positive rationals

$ chi & = 40 delta + 50000 delta^2 \,\
v_1 & = \( 1 + \( Z_(*) + delta \) \/ 5 \) chi + 3.18 delta \/ 5 \,\
v_2 & = \( Z_(*) + delta \) chi \/ 5 + 3.18 delta \/ 5 \,\
gamma & = 2.34 - 3.18 Z_(*) \/ 5 - v_1 - v_2 . $

The entrywise change of $L \/ m_0$ from $U \/ m_0$ is less than $chi$. The quantities $v_1$ and $v_2$ bound the change in the two terms of the denominator gap, respectively. Exact comparison gives

$ gamma > .6 \, #h(2em) chi < 5 dot.op 10^(- 7) \, $

which proves (2.26). In particular all divisions used in the quotient estimate have already been justified. Set

$ e_(upright("jet")) & = frac(10^(- 12) + 50000 delta^2 + \( .283 delta \) chi, 1 - chi) \,\
e_(upright("tail")) & = frac(\( 2 \( Z_(*) + delta \) \/ 5 \) \( 6.2 dot.op 10^(- 12) \), .6 \( 1 - chi \)) . quad "(7.13)" $ <cert:ratio-errors>

The first bounds the distance of $L_11 \/ L_01$ from the linear map: its numerator accounts for $U_11$, the quadratic remainder, and the change of denominator. The second is the determinant estimate for the tail-ratio correction in Lemma 11. The remaining comparisons are

$ e_(upright("jet")) + e_(upright("tail")) < 2.5 dot.op 10^(- 11) \, #h(2em) .283 delta + 2.5 dot.op 10^(- 11) < 3 dot.op 10^(- 9) \, #h(2em) .048 delta > 2.5 dot.op 10^(- 11) . quad "(7.14)" $ <cert:degree-comparisons>

Together with (7.2), these are the complete finite comparisons behind the disk estimate and nonzero degree. The actual boundary margin is greater than $4.8 dot.op 10^(- 10) - 2.5 dot.op 10^(- 11) = 4.55 dot.op 10^(- 10)$. The verifier emits every comparison separately and also emits the rational values of $e_(upright("jet")) + e_(upright("tail"))$ and $gamma$.

=== 7.6 Exterior positivity and its degree cancellations <cert:exterior>

Here $M = 5$, $t_n = n - i b$, $d_n = t_n - 5$, $s = i z$ and $K = 5$ in the unscaled forward recurrence. We first justify the degree bounds used in the arithmetic. Write $T^(\( n \))$ for the product of its first $n$ factors. For $n gt.eq 1$ its column zero has degree at most $n - 1$ in $z$, and column one has degree at most $n$. Their leading terms are

$ T_(dot.op 0)^(\( n \)) = - b a_n z^(n - 1) binom(1, - 1) + O \( z^(n - 2) \) \, #h(2em) T_(dot.op 1)^(\( n \)) = a_n z^n binom(1, - 1) + O \( z^(n - 1) \) \, quad a_n = i \( - i \)^(n - 1) . quad "(7.15)" $ <cert:exterior-leading>

For $n = 1$ the first column is exactly $- i b \( 1 \, - 1 \)^t$, so the remainder in that first assertion is zero. Induction follows by retaining the $z$ part $mat(delim: "(", 0, i; 0, - i)$ of the next factor; its action on $\( 1 \, - 1 \)^t$ is multiplication by $- i$.

Let $x \, y$ be the rows after $n$ factors and $y^(upright("old"))$ the second row after $n - 1$. The recurrence gives $y = d_(n - 1) y^(upright("old")) - x$. Thus

$ overline(x_i) y_j - overline(y_i) x_j = d_(n - 1) overline(x_i) y_j^(upright("old")) - overline(d_(n - 1)) overline(y_i^(upright("old"))) x_j . quad "(7.16)" $ <cert:last-row-cancellation>

In the Hermitian form $M overline(x_i) x_j + i z \( overline(x_i) y_j - overline(y_i) x_j \)$, this proves degree at most $2 n$ in its last diagonal entry $d$, and at most $2 n - 1$ in its entry $c$ with indices $\( 1 \, 0 \)$. For the additional cancellation take $n gt.eq 2$, as is the case for $K = 5$. By (7.15), the leading coefficient of $overline(x_1) x_0$ is real, namely $- b$. The coefficient of $z^(2 n - 2)$ on the right of (7.16) for $\( i \, j \) = \( 1 \, 0 \)$ is $2 i b "Re" d_(n - 1)$, which is purely imaginary. Multiplication by $i z$ makes its highest coefficient real as well. Consequently $"Im" c$ has degree at most $2 n - 2$. At $n = 5$ the bounds are therefore

$ deg d lt.eq 10 \, #h(2em) deg c lt.eq 9 \, #h(2em) deg "Im" c lt.eq 8 . quad "(7.17)" $ <cert:exterior-degrees>

These are identities for every real $b$, and translating $z$ preserves them. In particular, discarded error bounds above these degrees do not represent actual uncertainty in a nonzero coefficient.

For the finite tests put $z = z_1 + v$, $v gt.eq 0$, with $z_1 = 2.704$ or $3$, and repeat (7.3) five times with

$ M = 5 H_0 \, #h(2em) t_n = H_0 n - i B \, #h(2em) d_n = t_n - M \, #h(2em) s = i H_0 \( z_1 + v \) . $

Only the constant coefficients of $t_n \, d_n$ have error $2$; $s$ is exact. Form $d = h \( x_1 \, y_1 \, x_1 \, y_1 \)$ and $c = h \( x_1 \, y_1 \, x_0 \, y_0 \)$ by the same recipe as above. These are $H_0^11$ times the unscaled entries. The three tests, including their truncation degrees and interval-ratio minima, are

$ z_1 & upright("polynomial") & upright("degree") & min floor.l "Re" X_j \/ \( 1 + e_j \) floor.r\
2.704 & "Re" d & 10 & 288247\
2.704 & 43 "Re" d + 1000 \( "Re" c - 1130 H_0^11 \( z_1 + v \) \) & 10 & 17080\
3 & - "Im" c - 1130 H_0^11 \( z_1 + v \) & 8 & 31628 quad "(7.18)" $ <cert:exterior-table>

Every actual coefficient is positive, so these polynomials are strictly positive for $v gt.eq 0$. Dividing the second by $1000 H_0^11$ gives $.043 d + "Re" c - 1130 z > 0$ in unscaled notation; the other two give the remaining form inequalities. Finally $0 < b < .335$ throughout the disk, and the exact comparison

$ product_(n = 0)^4 \( n^2 + .335^2 \) \( \( n - 5 \)^2 + .335^2 \) < 1130^2 quad "(7.19)" $ <cert:exterior-determinant>

implies $\| det T \| < 1130$. This completes the finite verification of (2.28) and all numerical assertions used in Section 2.


#bibliography("refs.bib", style: "ieee", title: [References])
