#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Brennan's conjecture and sharp inverse-square integral means]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $bb(D) = { z in bb(C) : \| z \| < 1 }$, and write $d A = d x thin d y$ for planar Lebesgue measure. A domain is a connected open subset of $bb(C)$; a univalent map is an injective holomorphic map. Brennan’s conjecture asks whether, for every conformal bijection $phi : W arrow.r bb(D)$ from a simply connected plane domain, the derivative satisfies

$ integral_W \| phi' \( z \) \|^s thin d A \( z \) < oo #h(2em) (4 / 3 < s < 4) . $

There is no regularity assumption on the boundary and no boundedness assumption on $W$. The problem measures how strongly a conformal map can compress area near an arbitrary boundary. The conjecture dates to Brennan’s 1978 work #cite(label("Brennan1978")); the domain and integral-means formulations are recorded in #cite(label("Bertilsson1999")) Chapter 3.

The inverse map $f = phi^(- 1) : bb(D) arrow.r W$ puts all source domains on the same footing. Conformal change of variables gives

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_W \| phi' \|^s thin d A = integral_(bb(D)) \| f' \|^(2 - s) thin d A . $ <eq:inverse-area>]

Thus the conjectured interval becomes $- 2 < t < 2 \/ 3$, with $t = 2 - s$. Positive powers detect large derivatives, whereas the difficult negative powers detect small derivatives. The inverse-square power $t = - 2$ is the limiting case relevant to the upper endpoint $s = 4$.

To state its radial form, let

$ cal(S) = { f : bb(D) arrow.r bb(C) upright(" univalent") : f \( 0 \) = 0 \, med f' \( 0 \) = 1 } $

be the normalized schlicht class. For $f in cal(S)$, $t in bb(R)$, and $0 < r < 1$, define

$ M_t \[ f' \] \( r \) = frac(1, 2 pi) integral_(- pi)^pi \| f' \( r e^(i theta) \) \|^t thin d theta \, $

and put

$ beta_f \( t \) & = limsup_(r arrow.t 1) frac(log M_t \[ f' \] \( r \), log \( 1 \/ \( 1 - r \) \)) \,\
B_(cal(S)) \( t \) & = sup_(f in cal(S)) beta_f \( t \) . $

Equivalently, $beta_f \( t \)$ is the infimum of the real $b$ for which $M_t \[ f' \] \( r \) = O \( \( 1 - r \)^(- b) \)$ as $r arrow.t 1$; the implicit constant may depend on $f$. In particular, the supremum defining $B_(cal(S))$ is taken after forming each map’s limiting exponent. We prove the following uniform estimate directly, and then derive the area assertion.

#thm([Theorem 1.1.])[
  (Brennan’s conjecture and inverse-square means).  #emph[For every $epsilon > 0$ there is $C_epsilon < oo$ such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ M_(- 2) \[ f' \] \( r \) lt.eq C_epsilon \( 1 - r \)^(- 1 - epsilon) #h(2em) (f in cal(S) \, med 1 / 2 lt.eq r < 1) . $ <eq:main-uniform>]

 Moreover, $B_(cal(S)) \( - 2 \) = 1$.]
  #emph[Let $W subset bb(C)$ be any simply connected domain whose boundary in the Riemann sphere contains at least two points. Every conformal bijection $phi : W arrow.r bb(D)$ satisfies 
$ integral_W \| phi' \( z \) \|^s thin d A \( z \) < oo #h(2em) (4 / 3 < s < 4) . $

 Equivalently, every univalent map $f : bb(D) arrow.r bb(C)$ satisfies 
$ integral_(bb(D)) \| f' \( w \) \|^t thin d A \( w \) < oo #h(2em) (- 2 < t < 2 / 3) . $

]
] <thm:main>

The domain correspondence, including the boundary condition, is justified in Section 7. That section also derives $B_(cal(S)) \( t \) = \| t \| - 1$ for every $t lt.eq - 2$; the corresponding uniform radial bounds retain an arbitrary positive loss. The radial exponent $1$ is compatible with divergence of the area integral at $t = - 2$. The other area endpoint also fails for the same classical example.

#thm([Corollary 1.2.])[
  (Sharpness of the open range).  #emph[The Koebe function $f \( z \) = z \/ \( 1 - z \)^2$ belongs to $cal(S)$ and satisfies 
$ integral_(bb(D)) \| f' \|^(- 2) thin d A = oo \, #h(2em) integral_(bb(D)) \| f' \|^(2 \/ 3) thin d A = oo . $

 Its inverse therefore fails area integrability at both $s = 4$ and $s = 4 \/ 3$.]
] <cor:sharp-endpoints>

=== 1.1 The problem and its development <the-problem-and-its-development>

Brennan’s 1978 work #cite(label("Brennan1978")) #cite(label("Brennan1978LOMI")) improved the previously known upper range beyond $s = 3$, as recorded in Bertilsson’s historical account #cite(label("Bertilsson1999")) Chapter 3, pp. 43–44. The standard formulation asks for the full interval $4 \/ 3 < s < 4$ on every simply connected plane domain admitting a conformal bijection to the disk. Neither boundedness nor boundary regularity is imposed. The classical slit-plane obstructions at both endpoints are verified in Section 7.

Subsequent progress connected the area question to finer estimates for derivative integral means. Pommerenke developed this approach in #cite(label("Pommerenke1985IntegralMeans")) #cite(label("Pommerenke1985IntegralMeansII")). Carleson and Makarov related negative integral means to the distribution of large harmonic measure and proved the linear spectral tail $B_(cal(S)) \( t \) = \| t \| - 1$ for all sufficiently negative $t$ #cite(label("CarlesonMakarov1994")) §1.4. The proposed threshold $t = - 2$ is the one associated with Brennan’s conjecture #cite(label("HedenmalmShimorin2005")). The statement for sufficiently negative parameters alone does not reach that endpoint.

Bertilsson studied coefficient estimates for negative powers of derivatives of univalent functions #cite(label("Bertilsson1998")). His thesis reports the area range $4 \/ 3 < s < 3.421$ #cite(label("Bertilsson1999")) and establishes equivalences between the spectral endpoint and uniform integral-means formulations #cite(label("Bertilsson1999")) Theorem 3.7, especially parts (a) and (f), pp. 44–45. Thus uniform estimates have an established place in the formulation of Brennan’s problem. In the present argument, the common constant in (1.2) arises directly from an operator on the entire compact normalized class.

Hedenmalm and Shimorin combined area inequalities with weighted Bergman space methods to improve general bounds for the integral-means spectrum. Their published table gives $B_(cal(S)) \( - 2 \) lt.eq 1.218$ #cite(label("HedenmalmShimorin2005")) Table 1, p. 385. Sola extended the Bergman-space computation #cite(label("Sola2006")), reporting the improved estimate $B_(cal(S)) \( - 2 \) lt.eq 1.206$ in his thesis #cite(label("Sola2007Thesis")) p. 6. These estimates illustrate the remaining gap between general analytic bounds and the conjectured exponent $1$.

Recent works treat the conjectured integrability range under additional hypotheses. Aleman and Kouroupis prove it for members of continuous semigroups of conformal disk self-maps and for Koenigs maps of nontrivial such semigroups #cite(label("AlemanKouroupis2025")) Theorem 1.1 and Proposition 2.2. Zheng treats simply connected polynomial basins at infinity for $P \( z \) = z^m + a_0$, $m gt.eq 3$, and for monic degree-$m$ polynomials whose coefficients of $z \, dots.h \, z^(m - 1)$ have modulus smaller than a degree-dependent threshold; these basins are considered in the sphere and contain infinity #cite(label("Zheng2026Basins")) Theorems 1.3–1.4. Jin computes the real integral-means spectra of normalized rational functions univalent in the disk, with inverse-square supremum $1$ over that class #cite(label("Jin2025IntegralMeans")) Theorem 6.20 and Corollaries 6.22–6.23. His work on Schwarzian multiplication operators recalls Shimorin’s sufficient multiplier-norm criterion for the inverse-square endpoint of an individual normalized univalent function #cite(label("Jin2026Multipliers")) Proposition 1.4(2). Theorem 1 concerns the full class of univalent disk maps.

=== 1.2 Analytic and geometric ingredients <analytic-and-geometric-ingredients>

Normalized changes of base point, distortion estimates, and compactness of the schlicht class are classical tools of geometric function theory #cite(label("Duren1983")) Chapters 1–2. A related probabilistic method for exterior integral means appears in the conformal snowflakes of Beliaev and Smirnov. Their positive integral operator gives lower bounds for an averaged exponent defined from expected derivative integral means. For each real $t$ and $epsilon > 0$, they construct a random snowflake whose averaged exponent exceeds $B \( t \) - epsilon$, where $B$ is their universal spectrum defined using exterior Riemann maps #cite(label("BeliaevSmirnov2010")) Lemma 3.4 and Theorem 4.1. Here the operator acts on all normalized half-plane maps, and hypothetical excess growth produces a weighted affine law. The operator is defined in Section 2; Section 3 constructs its eigenmeasure and proves the averaging identity.

The critical-point comparison is a planar index argument. Its boundary calculation uses Hopf’s secant proof of the tangent-turning theorem #cite(label("Hopf1935")) §2, pp. 53–55, while the regular-target step is an elementary plane case of Sard’s theorem #cite(label("Sard1942")) Theorem 4.1. We keep the index of a possible pole separate from those of the finite critical points. The pairing is defined by ranks in ordered lists; its measurability is proved through continuous local inverse branches, and its equivariance follows from the ordering itself.

The subsequent area comparison is related in form to equivariant mass transport, including the general framework for nonunimodular group actions developed by Gentner and Last #cite(label("GentnerLast2011")). We use a direct calculation with local changes of variables and explicit expanding boxes. The affine covariance, exceptional-target transfer, and boundary-cost estimates needed here are all proved within the paper.

An independent companion applies a related affine-law and critical-point comparison to prove a uniform inverse-first-power bound with exponent strictly below $1 \/ 4$ for normalized univalent disk maps, disproving Kraetzer’s bounded-spectrum prediction at $p = - 1$ #cite(label("OpenAIStrictInverseFirst2026")) Theorem 1.1. The proof here does not use that strict estimate; its Hölder interpolation from (1.2) gives exponent $1 \/ 2$ with an arbitrary positive loss at $t = - 1$.

=== 1.3 The obstacle and the proof strategy <the-obstacle-and-the-proof-strategy>

The classical distortion theorem bounds $\| f' \( z \) \|^(- 1)$ by a constant times $\( 1 - \| z \| \)^(- 1)$ for $f in cal(S)$. Squaring this estimate gives radial growth with exponent $2$, while the required exponent is $1$. The missing information concerns how often very small derivatives can occur around a circle. Our proof encodes hypothetical excess growth in a probability law on conformal maps. That law imposes an algebraic sign on an expected Jacobian; a geometric pairing of critical points imposes the opposite sign.

We work on the upper half-plane $bb(H) = { x + i y : y > 0 }$ with the compact class $cal(K)$ of univalent maps $F$ normalized by $F \( i \) = 0$ and $F' \( i \) = 1$. Write $Q_F = 1 \/ F'$. Changing the base point to $z = x + i y$ gives

$ T_z F \( w \) = frac(F \( x + y w \) - F \( x + i y \), y F' \( x + i y \)) . $

Each $T_z F$ again belongs to $cal(K)$. A positive operator averages the two changes of base point $z = plus.minus 1 \/ 2 + i \/ 2$, with weights $\| Q_F \( z \) \|^2$. Its iterates sample equally spaced points above a fixed interval at dyadic heights. If $rho$ denotes the exponential growth rate of their operator norms, Section 2 shows that $rho lt.eq 2$ implies the uniform disk estimate in Theorem 1.

Suppose instead that $rho > 2$, and put $beta = log_2 rho > 1$. Section 3 constructs a Borel probability law $P$ on $cal(K)$ with the following property: for every $x + i y in bb(H)$ and every nonnegative Borel function $Phi$ on $cal(K)$,

$ bb(E)_P #scale(x: 120%, y: 120%)[\[] \| Q_F \( x + i y \) \|^2 Phi \( T_(x + i y) F \) #scale(x: 120%, y: 120%)[\]] = y^(- beta) bb(E)_P Phi \( F \) . $

We first construct a positive eigenmeasure, then average horizontal translations and logarithmic scales. The resulting identity holds at every affine change of base point. Differentiating the constant-test identity determines the moments of the logarithmic derivative that will control the Jacobian.

For $xi in bb(C)$, consider the target potential

$ V_xi^F \( x + i y \) = frac(y^k, \| F \( x + i y \) - xi \|) \, #h(2em) k = frac(beta + 3, 4) > 1 . $

At the unique possible preimage of $xi$ we give it value $+ oo$. A critical-point count is useful only if points above a fixed positive level cannot escape to the real axis or to infinity. Section 4 proves precisely this compactness for almost every target and almost every sampled map. The main boundary estimate controls the total length of a horizontal line mapped into a compact target set.

The critical points of $V_xi^F$ solve

$ G_F \( z \) = xi \, #h(2em) G_F \( x + i y \) = F \( x + i y \) - frac(i y, k) F' \( x + i y \) . $

Section 5 shows that the sign of the normalized real Jacobian of $G_F$ distinguishes saddles from maxima when $xi$ is a regular value. For these targets, an index count on compact superlevel boundaries gives at least as many maxima as saddles above each positive level. Ordering the two lists by their values of $V_xi^F$ therefore pairs each saddle with a distinct maximum of at least the same value. We prove that this assignment is Borel and respects every affine change of source coordinates. These properties are essential when the pointwise pairing is integrated against $P$.

Section 6 performs that integration. Change of variables through $G_F$ converts a weighted source area into the target weight $\( V_xi^F \/ k \)^4$. The pairing increases this weight. Affine covariance then turns the expected source density into $d x thin d y \/ y$; expanding boxes have asymptotically negligible boundary enlargement. This proves that the expected normalized Jacobian is nonpositive, contradicting its strictly positive value from the logarithmic-derivative moments. A separate application of the same area formula handles the exceptional targets at the distinguished point $i$, whose target $G_F \( i \) = - i \/ k$ is fixed by normalization.

Finally, Section 7 obtains the negative area exponents $- 2 < t < 0$ by Hölder’s inequality and treats the positive exponents with classical growth estimates and a weighted area argument. It also proves the equivalence with the endpoint spectrum and the Koebe sharpness assertions. Thus the analytic law, the compactness of superlevels, and the measurable pairing each supply a distinct input to the same weighted area contradiction.

== 2 Univalent maps and a dyadic transfer operator <sec:preliminaries>

We first place normalized univalent maps of the upper half-plane in a compact space. Rescaling the source about a point then defines a positive operator weighted by the inverse square of the derivative. The main conclusion of this section is a uniform comparison between powers of that operator and disk integral means. Later sections will bound the operator’s growth rate.

=== 2.1 Classical estimates and the normalized compact class <classical-estimates-and-the-normalized-compact-class>

We use the classical coefficient, distortion, growth, and quarter-disk estimates in the following precise forms; see Duren #cite(label("Duren1983")) Chapter 2, especially §2.3. No boundary regularity or boundedness of the image is required.

#thm([Lemma 2.1.])[
  (Classical univalence estimates).  #emph[If $f \( z \) = z + a_2 z^2 + dots.h.c$ belongs to $cal(S)$, then $\| a_2 \| lt.eq 2$ and, for $\| z \| = r < 1$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ frac(1 - r, \( 1 + r \)^3) lt.eq \| f' \( z \) \| lt.eq frac(1 + r, \( 1 - r \)^3) \, #h(2em) r / 4 lt.eq \| f \( z \) \| lt.eq frac(r, \( 1 - r \)^2) . $ <prelim:disk-bounds>]

 Every univalent holomorphic map $g$ on an open disk $B \( z_0 \, R \)$ satisfies 
#[#set math.equation(numbering: n => "(2.2)")
 $ B #scale(x: 120%, y: 120%)[\(] g \( z_0 \) \, R \| g' \( z_0 \) \| \/ 4 #scale(x: 120%, y: 120%)[\)] subset g \( B \( z_0 \, R \) \) . $ <prelim:quarter>]

]
] <lem:classical-univalence>

#proof[
  The coefficient and derivative bounds are the classical estimates just cited. The classical lower growth bound $r \/ \( 1 + r \)^2$ implies the weaker bound $r \/ 4$ recorded here. A univalent holomorphic map has nonzero derivative, so for the last assertion the map
  $ zeta mapsto frac(g \( z_0 + R zeta \) - g \( z_0 \), R g' \( z_0 \)) $
  belongs to $cal(S)$. Applying the Koebe quarter theorem to this normalized map gives (2.2). ◻
]

Write

$ bb(H) = { x + i y : x in bb(R) \, med y > 0 } \, #h(2em) m \( z \) = frac(z - i, z + i) \, $

and let

$ cal(K) = { F : bb(H) arrow.r bb(C) upright(" univalent") : F \( i \) = 0 \, med F' \( i \) = 1 } . $

We give $cal(K)$ the topology of locally uniform convergence. Since $m' \( i \) = 1 \/ \( 2 i \)$, its correspondence with the disk class is exactly

#[#set math.equation(numbering: n => "(2.3)")
 $ F \( z \) = 2 i f \( m \( z \) \) \, #h(2em) f \( zeta \) = frac(F \( m^(- 1) \( zeta \) \), 2 i) . $ <prelim:normalization>]

For $F in cal(K)$, define the holomorphic function

$ Q_F \( z \) = frac(1, F' \( z \)) . $

#thm([Lemma 2.2.])[
  (Compactness and uniform local bounds).  #emph[The space $cal(K)$ is compact and metrizable. For every integer $j gt.eq 0$, the evaluations $\( F \, z \) mapsto F^(\( j \)) \( z \)$ and $\( F \, z \) mapsto Q_F^(\( j \)) \( z \)$ are jointly continuous on $cal(K) times bb(H)$ and bounded on $cal(K) times E$ for every compact $E subset bb(H)$. For every $C_0 gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ \| Q_F \( x + i y \) \| lt.eq frac(\( C_0^2 + 4 \)^2, y) quad #scale(x: 120%, y: 120%)[\(] F in cal(K) \, med \| x \| lt.eq C_0 \, med 0 < y lt.eq 1 #scale(x: 120%, y: 120%)[\)] . $ <prelim:strip-bound>]

 In particular the bound is $64 \/ y$ when $\| x \| lt.eq 2$. Also, 
#[#set math.equation(numbering: n => "(2.5)")
 $ \| F \( z \) \| gt.eq 1 / 16 quad upright("if ") F in cal(K) upright(" and ") \| m \( z \) \| gt.eq 1 / 2 . $ <prelim:zero-separation>]

]
] <lem:compact-class>

#proof[
  The upper growth bound and (2.3) give local uniform boundedness. Montel’s theorem therefore gives a locally uniformly convergent subsequence from every sequence in $cal(K)$; see #cite(label("Duren1983")) Sections 1.1 and 1.3 for this normal-family argument and the univalent-limit form of Hurwitz’s theorem. Cauchy’s formula preserves the derivative normalization, so a limit $F$ has $F' \( i \) = 1$ and is nonconstant. For any fixed $z_0 in bb(H)$, apply Hurwitz’s theorem to $F_n \( z \) - F_n \( z_0 \)$ on the connected domain $bb(H) \\ { z_0 }$. The limit is not identically zero and has no zero there. Thus $F$ is injective and belongs to $cal(K)$. The compact-open topology is metrizable using a countable compact exhaustion of $bb(H)$, so this sequential compactness proves compactness.
  Cauchy’s formula gives locally uniform convergence of all derivatives. The limiting derivative is nonzero, so reciprocals also converge locally uniformly, as do their derivatives. These observations give the asserted joint continuity. Compactness of $cal(K) times E$ then gives the uniform bounds.
  For the explicit estimate, put $D = \| x + i \( y + 1 \) \|^2$ and $r = \| m \( x + i y \) \|$. Then
  $ 1 - r^2 = frac(4 y, D) \, #h(2em) \| Q_F \( x + i y \) \| = frac(D, 4 \| f' \( m \( x + i y \) \) \|) . $
  The lower derivative bound in (2.1) gives
  $ \| Q_F \( x + i y \) \| lt.eq frac(D \( 1 + r \)^3, 4 \( 1 - r \)) = frac(D^2 \( 1 + r \)^4, 16 y) lt.eq D^2 / y . $
  When $\| x \| lt.eq C_0$ and $y lt.eq 1$, this proves (2.4).
  Finally $\| m \( z \) \| < 1 \/ 7$ on $B \( i \, 1 \/ 4 \)$, while (2.2) gives $B \( 0 \, 1 \/ 16 \) subset F \( B \( i \, 1 \/ 4 \) \)$. Injectivity prevents any point outside $B \( i \, 1 \/ 4 \)$ from having an image of modulus less than $1 \/ 16$. This proves (2.5). ◻
]

=== 2.2 Affine rescaling and dyadic growth <affine-rescaling-and-dyadic-growth>

Identify $z = x + i y in bb(H)$ with the affine map $w mapsto x + y w$. Composition of these source maps is the product

#[#set math.equation(numbering: n => "(2.6)")
 $ z dot.op w = x + y w \, #h(2em) z^(\#) = frac(- x + i, y) \, $ <prelim:affine-product>]

with identity $i$ and inverse $z^(\#)$. For $F in cal(K)$ define

#[#set math.equation(numbering: n => "(2.7)")
 $ T_z F \( w \) = frac(F \( z dot.op w \) - F \( z \), y F' \( z \)) . $ <prelim:rerooting>]

It belongs to $cal(K)$. On the space $C \( cal(K) \)$ of continuous complex-valued functions, equipped with its supremum norm, define

#[#set math.equation(numbering: n => "(2.8)")
 $ A_z Phi \( F \) = \| Q_F \( z \) \|^2 Phi \( T_z F \) \, #h(2em) L = 1 / 2 #scale(x: 120%, y: 120%)[\(] A_(- 1 \/ 2 + i \/ 2) + A_(1 \/ 2 + i \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <prelim:operators>]

An operator is called positive here if it takes nonnegative real-valued functions to nonnegative functions. The operators in (2.8) are positive. Their weights measure how the inverse derivative changes when the source is rescaled.

#thm([Lemma 2.3.])[
  (Affine identities and transfer growth).  #emph[For $z \, w in bb(H)$ and $F in cal(K)$, 
#[#set math.equation(numbering: n => "(2.9)")
 $ Q_(T_z F) \( w \) = frac(Q_F \( z dot.op w \), Q_F \( z \)) \, #h(2em) T_w \( T_z F \) = T_(z dot.op w) F \, #h(2em) A_z A_w = A_(z dot.op w) . $ <prelim:composition>]

 Each $A_z$ is bounded on $C \( cal(K) \)$, and for fixed $Phi in C \( cal(K) \)$ the map $z mapsto A_z Phi$ is continuous in the supremum norm. For $n gt.eq 0$, put $v_n = 2^(- n)$ and $u_(n \, j) = - 1 + \( 2 j + 1 \) v_n$, $0 lt.eq j < 2^n$. Then 
#[#set math.equation(numbering: n => "(2.10)")
 $ L^n = v_n sum_(j = 0)^(2^n - 1) A_(u_(n \, j) + i v_n) \, #h(2em) parallel L^n parallel = max_(F in cal(K)) L^n upright(bold(1)) \( F \) . $ <prelim:dyadic-grid>]

 The limit 
#[#set math.equation(numbering: n => "(2.11)")
 $ rho = lim_(n arrow.r oo) parallel L^n parallel^(1 \/ n) = inf_(n gt.eq 1) parallel L^n parallel^(1 \/ n) $ <prelim:rho>]

 exists and satisfies $1 lt.eq rho lt.eq 4$. If $lambda > rho$, there is $C_lambda < oo$ such that $parallel L^n parallel lt.eq C_lambda lambda^n$ for all $n gt.eq 0$.]
] <lem:transfer-growth>

#proof[
  Differentiating (2.7) proves the first identity in (2.9). Applying the normalization twice proves the second. In the operator product the weights telescope:
  $ \| Q_F \( z \) \|^2 \| Q_(T_z F) \( w \) \|^2 = \| Q_F \( z dot.op w \) \|^2 . $
  This gives the third identity, with its displayed order of multiplication. Joint continuity of $\( z \, F \) mapsto T_z F$ follows from locally uniform convergence on affine images of compact source sets and the nonzero normalizing denominator. Together with Lemma 4, this proves boundedness of $A_z$. For fixed $Phi$, joint continuity on $cal(K)$ times a compact neighborhood of $z$ gives the asserted supremum-norm continuity.
  A word of length $n$ in the affine maps $- 1 \/ 2 + i \/ 2$ and $1 \/ 2 + i \/ 2$ has height $2^(- n)$ and real part $sum_(l = 1)^n sigma_l 2^(- l)$, where $sigma_l in { - 1 \, 1 }$. Writing $sigma_l = 2 epsilon.alt_l - 1$ and $j = sum_(l = 1)^n epsilon.alt_l 2^(n - l)$ gives real part $- 1 + \( 2 j + 1 \) 2^(- n)$. Each $j$ occurs once and each word has coefficient $2^(- n)$. Expansion of $L^n$ proves the grid formula; at $n = 0$ it reduces to $A_i = I$.
  For the positive sums defining $L^n$,
  $ \| L^n Phi \| lt.eq L^n \| Phi \| lt.eq parallel Phi parallel_oo L^n upright(bold(1)) . $
  Testing with $Phi = upright(bold(1))$ proves the norm identity. At the map $F \( z \) = z - i$ every summand in $L^n upright(bold(1)) \( F \)$ equals one, so $parallel L^n parallel gt.eq 1$. Since $\| u_(n \, j) \| lt.eq 1$, (2.4) gives
  $ parallel L^n parallel lt.eq 625 thin 4^n . $
  The logarithms of these positive norms are subadditive. More explicitly, for fixed $N gt.eq 1$ write $n = q N + r$, $0 lt.eq r < N$, and use $parallel L^n parallel lt.eq parallel L^N parallel^q parallel L^r parallel$. Taking the upper limit of the $n$th roots and then the infimum over $N$ proves (2.11); the displayed lower and upper bounds give $1 lt.eq rho lt.eq 4$. If $lambda > rho$, the root limit bounds $parallel L^n parallel$ by $lambda^n$ for all sufficiently large $n$. Increasing a constant to cover the finitely many remaining $n$ proves the last claim. ◻
]

=== 2.3 From dyadic samples to disk integral means <from-dyadic-samples-to-disk-integral-means>

The next proposition explains why an upper bound on $rho$ controls an entire circle. The comparison uses the same compact family in every cell, so all its constants are independent of the chosen univalent map.

#thm([Proposition 2.4.])[
  (Uniform disk comparison).  #emph[If $rho lt.eq 2$, then for every $epsilon > 0$ there is $C_epsilon < oo$ such that 
#[#set math.equation(numbering: n => "(2.12)")
 $ M_(- 2) \[ f' \] \( r \) lt.eq C_epsilon \( 1 - r \)^(- 1 - epsilon) quad #scale(x: 120%, y: 120%)[\(] f in cal(S) \, med 1 \/ 2 lt.eq r < 1 #scale(x: 120%, y: 120%)[\)] . $ <prelim:uniform-disk>]

 The constant depends only on $epsilon$.]
] <prop:disk-transfer>

#proof[
  Fix $f in cal(S)$ and $1 \/ 2 lt.eq r < 1$. Put $delta = 1 - r$ and choose $n gt.eq 1$ with $v = 2^(- n) lt.eq delta < 2 v$. On the fixed angular interval $I = \[ 3 pi \/ 4 \, 5 pi \/ 4 \]$, write
  $ m^(- 1) \( r e^(i theta) \) = x \( theta \) + i y \( theta \) \, #h(2em) D \( theta \) = 1 - 2 r cos theta + r^2 . $
  The inverse formula gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ x \( theta \) = frac(- 2 r sin theta, D \( theta \)) \, #h(2em) y \( theta \) = frac(1 - r^2, D \( theta \)) . $ <prelim:arc-coordinates>]
  On $I$ we have $cos theta lt.eq 0$ and hence $D gt.eq 1 + r^2 gt.eq 2 r$; therefore $\| x \| lt.eq \| sin theta \| < 1$. Also
  $ delta / 2 lt.eq y lt.eq 2 delta \, #h(2em) frac(d x, d theta) = frac(4 r^2 - 2 r \( 1 + r^2 \) cos theta, D \( theta \)^2) gt.eq 1 / 16 . $
  The height bounds use $D lt.eq \( 1 + r \)^2$, $D gt.eq 1$, and $1 + r lt.eq 2$. For the derivative bound use $4 r^2 gt.eq 1$ and $D^2 lt.eq 16$.
  The cells $\[ u_(n \, j) - v \, u_(n \, j) + v \]$ cover $\[ - 1 \, 1 \]$ with disjoint interiors. If $x \( theta \)$ belongs to cell $j$, then
  $ w = frac(x \( theta \) - u_(n \, j), v) + i frac(y \( theta \), v) in E := { u + i eta : \| u \| lt.eq 1 \, med 1 \/ 2 lt.eq eta lt.eq 4 } . $
  Let $B_E = max_(G in cal(K) \, thin w in E) \| Q_G \( w \) \|$, which is finite by Lemma 4. The first identity in (2.9) gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ \| Q_F \( x \( theta \) + i y \( theta \) \) \| lt.eq B_E \| Q_F \( u_(n \, j) + i v \) \| \, #h(2em) F = 2 i f compose m . $ <prelim:cell-comparison>]
  Thus the comparison covers every point of the varying-height arc in each cell.
  The exact derivative conversion in (2.3) is
  $ \| f' \( m \( z \) \) \|^(- 2) = lr(|frac(m' \( z \), m' \( i \))|)^2 \| Q_F \( z \) \|^2 = frac(16, \| z + i \|^4) \| Q_F \( z \) \|^2 lt.eq 16 \| Q_F \( z \) \|^2 . $
  Since $x \( theta \)$ is increasing and $d theta lt.eq 16 thin d x$, (2.14) and the cell lengths $2 v$ give
  $ integral_I \| f' \( r e^(i theta) \) \|^(- 2) thin d theta & lt.eq 256 B_E^2 sum_j \| Q_F \( u_(n \, j) + i v \) \|^2 \| \[ u_(n \, j) - v \, u_(n \, j) + v \] ∩ x \( I \) #scale(x: 120%, y: 120%)[\|]\
 & lt.eq 512 B_E^2 v sum_j \| Q_F \( u_(n \, j) + i v \) \|^2 = 512 B_E^2 L^n upright(bold(1)) \( F \) . $
  Here the bars around the intersection denote interval length.
  For $alpha in { 1 \, i \, - 1 \, - i }$, the map $f_alpha \( z \) = alpha^(- 1) f \( alpha z \)$ belongs to $cal(S)$ and has derivative $f' \( alpha z \)$. The four rotated copies of $I$ cover the full circle, with overlap only at endpoints. Applying the preceding estimate to these four maps therefore proves
  $ M_(- 2) \[ f' \] \( r \) lt.eq C parallel L^n parallel $
  with an absolute constant $C$. If $rho lt.eq 2$, apply Lemma 5 with $lambda = 2^(1 + epsilon)$. It gives
  $ M_(- 2) \[ f' \] \( r \) lt.eq C C_lambda v^(- 1 - epsilon) lt.eq C C_lambda 2^(1 + epsilon) \( 1 - r \)^(- 1 - epsilon) . $
  The operator $L$ and the compact set $E$ were fixed before $f$ and $r$ were chosen, so this constant depends only on $epsilon$. ◻
]

We have reduced the uniform disk estimate to $rho lt.eq 2$. The next sections assume $rho > 2$ and derive a contradiction from the probability law generated by the same positive operator.

== 3 A probability law from transfer growth <sec:weighted-law>

The disk estimate in Proposition 6 reduces our task to proving that $rho lt.eq 2$. We now suppose that $rho > 2$ and construct a probability measure on the normalized family $cal(K)$. Its covariance under affine changes of coordinates will turn geometric quantities into expectations at the single point $i$.

We use the operators $A_z$ and $L$ from the preceding section. Measures act on their left: if $mu$ is a finite measure, then $\( mu A_z \) \( Phi \) = mu \( A_z Phi \)$ for $Phi in C \( cal(K) \)$. Every positive bounded functional on $C \( cal(K) \)$ is identified with its finite Borel measure by the Riesz representation theorem #cite(label("Folland1999")) Theorem 7.2.

#thm([Lemma 3.1.])[
  (Weighted affine covariance).  #emph[Suppose that $rho > 2$, and put $beta = log_2 rho > 1$. There is a Borel probability measure $P$ on $cal(K)$ such that, for every $z = x + i y in bb(H)$ and every nonnegative Borel function $Phi : cal(K) arrow.r \[ 0 \, oo \]$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) #h(-0.16667em) [\| Q_F \( z \) \|^2 Phi \( T_z F \)] = y^(- beta) bb(E) Phi \( F \) \, $ <eq:weighted-covariance>]

 where $bb(E)$ denotes expectation with respect to $P$.]
] <lem:weighted-law>

#proof[
  We first obtain a probability eigenmeasure for $L$. The dyadic formula for $L^n$ will then give one horizontal period. Averaging over that period and over one logarithmic scale interval produces (3.1).
  ===== 3.1 The eigenmeasure. <the-eigenmeasure.>
  For $tau > rho$, the root limit defining $rho$ implies that
  $ R_tau = sum_(n = 0)^oo tau^(- n) L^n $
  converges in operator norm. Set
  $ g_tau = R_tau upright(bold(1)) \, #h(2em) M_tau = max_(F in cal(K)) g_tau \( F \) . $
  Positivity gives $1 lt.eq g_tau lt.eq M_tau$, and the maximum is attained because $g_tau$ is continuous and $cal(K)$ is compact. We claim that
  #[#set math.equation(numbering: n => "(3.2)")
   $ M_tau arrow.r oo #h(2em) \( tau arrow.b rho \) . $ <eq:resolvent-divergence>]
  Indeed,
  $ L g_tau = tau \( g_tau - upright(bold(1)) \) lt.eq tau \( 1 - M_tau^(- 1) \) g_tau . $
  Iteration, using positivity and $upright(bold(1)) lt.eq g_tau$, gives
  $ L^n upright(bold(1)) lt.eq #scale(x: 120%, y: 120%)[\[] tau \( 1 - M_tau^(- 1) \) #scale(x: 120%, y: 120%)[\]]^n g_tau . $
  Since $parallel L^n parallel = parallel L^n upright(bold(1)) parallel_oo$ by Lemma 5, it follows that
  $ parallel L^n parallel lt.eq M_tau #scale(x: 120%, y: 120%)[\[] tau \( 1 - M_tau^(- 1) \) #scale(x: 120%, y: 120%)[\]]^n . $
  If $M_(tau_j) lt.eq M < oo$ along a sequence $tau_j arrow.b rho$, taking the $n$th-root limit for each fixed $j$ would give
  $ rho lt.eq tau_j \( 1 - M_(tau_j)^(- 1) \) lt.eq tau_j \( 1 - M^(- 1) \) . $
  Letting $j arrow.r oo$ contradicts $rho > 0$, proving (3.2).
  Choose a maximizer $F_tau$ and define
  $ mu_tau = frac(delta_(F_tau) R_tau, M_tau) . $
  This is a positive functional of mass one, hence a Borel probability measure. The norm-convergent series gives $R_tau L = tau \( R_tau - I \)$, where $I$ is the identity operator, so
  $ mu_tau L = tau mu_tau - tau / M_tau delta_(F_tau) . $
  Choose a sequence $tau arrow.b rho$. Since $cal(K)$ is compact metric, $C \( cal(K) \)$ has a countable uniformly dense subset. Diagonal selection gives a subsequence along which the integrals of those functions converge. The bound $parallel mu_tau parallel = 1$ extends convergence to every function in $C \( cal(K) \)$. The limiting functional is positive and has mass one, hence is a probability measure $mu$ by Riesz representation. For each $Phi in C \( cal(K) \)$, the function $L Phi$ is continuous, and the final term above has absolute value at most $tau parallel Phi parallel_oo \/ M_tau$. Consequently
  #[#set math.equation(numbering: n => "(3.3)")
   $ mu L = rho mu . $ <eq:transfer-eigenmeasure>]
  ===== 3.2 A horizontal period. <a-horizontal-period.>
  For $v = 2^(- n)$ and $u_j = - 1 + \( 2 j + 1 \) v$, the formula from Lemma 5 reads
  $ L^n = v sum_(j = 0)^(2^n - 1) A_(u_j + i v) . $
  Right composition with $A_(2 + i)$ replaces $u_j$ by $u_j + 2 v$. Thus (3.3) gives the exact cancellation
  #[#set math.equation(numbering: n => "(3.4)")
   $ mu A_(2 + i) - mu = rho^(- n) v mu #scale(x: 120%, y: 120%)[\(] A_(1 + v + i v) - A_(- 1 + v + i v) #scale(x: 120%, y: 120%)[\)] . $ <eq:horizontal-endpoints>]
  Both remaining abscissae have absolute value at most $2$. The bound $\| Q_F \( u + i v \) \| lt.eq C \/ v$ from Lemma 4 therefore implies
  $ parallel mu A_(2 + i) - mu parallel lt.eq C rho^(- n) v thin v^(- 2) = C \( 2 \/ rho \)^n arrow.r 0 . $
  The left side is independent of $n$, so $mu A_(2 + i) = mu$. Composition with $A_(- 2 + i)$ gives the negative period as well.
  ===== 3.3 Horizontal and scale averages. <horizontal-and-scale-averages.>
  Define, by integration on continuous test functions,
  $ macron(mu) = 1 / 2 integral_0^2 mu A_(x + i) thin d x . $
  For each continuous test, the integrand is continuous in $x$, by joint continuity of the normalized transformations and their weights. Compactness of the parameter interval makes this a finite positive functional, and its mass is strictly positive because the weights $\| Q_F \( x + i \) \|^2$ are positive. The period just proved shows that
  #[#set math.equation(numbering: n => "(3.5)")
   $ accent(mu A, ‾)_(t + i) = macron(mu) #h(2em) \( t in bb(R) \) . $ <eq:horizontal-average>]
  We next compute the change under a factor of two in height. Using (3.3) before expanding $L$, we obtain
  $ rho macron(mu) & = 1 / 2 integral_0^2 mu L A_(x + i) thin d x\
 & = 1 / 4 integral_0^2 mu #scale(x: 120%, y: 120%)[\(] A_(- 1 \/ 2 + x \/ 2 + i \/ 2) + A_(1 \/ 2 + x \/ 2 + i \/ 2) #scale(x: 120%, y: 120%)[\)] thin d x\
 & = 1 / 2 integral_(- 1 \/ 2)^(3 \/ 2) mu A_(s + i \/ 2) thin d s . $
  Here the substitutions $s = plus.minus 1 \/ 2 + x \/ 2$ give two adjacent intervals. The last integrand has period two, since
  $ mu A_(s + 2 + i \/ 2) = mu A_(2 + i) A_(s + i \/ 2) = mu A_(s + i \/ 2) . $
  Moving its integration interval to $\[ 0 \, 2 \]$ yields
  #[#set math.equation(numbering: n => "(3.6)")
   $ rho macron(mu) = accent(mu A, ‾)_(i \/ 2) . $ <eq:half-scale-average>]
  In particular
  $ accent(mu A, ‾)_(2 i v) = rho^(- 1) accent(mu A, ‾)_(i v) \, #h(2em) v > 0 . $
  Since $2^beta = rho$, the functional
  $ H \( v \) = v^beta accent(mu A, ‾)_(i v) $
  satisfies $H \( 2 v \) = H \( v \)$. Moreover, each $accent(mu A, ‾)_(i v)$ remains horizontally invariant: the affine product gives
  $ A_(i v) A_(t + i) = A_(v t + i) A_(i v) \, $
  and (3.5) applies to the first operator on the right.
  We have obtained all horizontal translations and a dyadic scaling relation. To obtain every positive scale, set
  $ nu = integral_1^2 H \( v \) thin frac(d v, v) . $
  As before, this is a finite positive functional of strictly positive mass. For every $y > 0$, substitution $u = v y$ gives
  $ nu A_(i y) & = y^(- beta) integral_y^(2 y) H \( u \) thin frac(d u, u) = y^(- beta) nu . $
  The last equality follows because $t mapsto H \( e^t \)$ has period $log 2$; the integral over one full period is independent of its starting point. Horizontal invariance also persists under this average. Normalize to the probability $P = nu \/ nu \( upright(bold(1)) \)$. Since $A_(x + i y) = A_(x + i) A_(i y)$, we conclude that
  $ P A_(x + i y) = y^(- beta) P $
  on continuous tests.
  ===== 3.4 Borel tests. <borel-tests.>
  For each fixed $z = x + i y$, the expression
  $ E mapsto integral_(cal(K)) \| Q_F \( z \) \|^2 upright(bold(1))_E \( T_z F \) thin d P \( F \) $
  defines a finite Borel measure on $cal(K)$. Indeed, its weight and transformation are continuous in $F$, and the weight is bounded on $cal(K)$. The identity on continuous functions identifies this measure with $y^(- beta) P$. Equality on nonnegative simple functions, followed by monotone convergence, proves (3.1) in its stated generality. ◻
]

The covariance identity also applies to integrable signed tests, by their positive and negative parts. When a nonnegative test depends in a jointly Borel way on an additional parameter, we may apply the identity for each fixed parameter and then integrate by Tonelli’s theorem. These uses require only the equality of weighted measures just proved.

#thm([Lemma 3.2.])[
  (Moments of the logarithmic derivative).  #emph[Assume $rho > 2$, and let $P$ and $beta$ be as in Lemma 7. For $z = x + i y in bb(H)$, define 
#[#set math.equation(numbering: n => "(3.7)")
 $ q_F \( z \) = i y frac(Q'_F \( z \), Q_F \( z \)) = - i y frac(F'' \( z \), F' \( z \)) = a_F \( z \) + i b_F \( z \) \, $ <eq:logarithmic-derivative-variable>]

 where $a_F \, b_F$ are real. The variables $q_F \( i \)$ are bounded on $cal(K)$, and 
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E) a_F \( i \) = - beta / 2 \, #h(2em) bb(E) b_F \( i \) = 0 \, #h(2em) bb(E) \| q_F \( i \) \|^2 = frac(beta \( beta + 1 \), 4) . $ <eq:law-moments>]

 They also satisfy 
#[#set math.equation(numbering: n => "(3.9)")
 $ q_(T_z F) \( w \) = q_F \( z dot.op w \) \, #h(2em) z \, w in bb(H) . $ <eq:q-affine-covariance>]

]
] <lem:law-moments>

#proof[
  Taking $Phi = upright(bold(1))$ in (3.1) gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E) \| Q_F \( x + i y \) \|^2 = y^(- beta) . $ <eq:inverse-derivative-mean>]
  On a compact neighborhood of any interior point, the functions $Q_F \, Q'_F \, Q''_F$ are uniformly bounded over $cal(K)$, by Lemma 4. These bounds control the first two real derivatives of $\| Q_F \|^2$, and hence justify differentiation under expectation in (3.10).
  Holomorphicity and (3.7) give the pointwise identities
  $ partial_y \| Q_F \|^2 = frac(2 a_F, y) \| Q_F \|^2 \, #h(2em) partial_x \| Q_F \|^2 = frac(2 b_F, y) \| Q_F \|^2 \, #h(2em) Delta \| Q_F \|^2 = 4 \| Q'_F \|^2 . $
  At $i$ we have $Q_F \( i \) = 1$, so the $y$ derivative, the $x$ derivative, and the Euclidean Laplacian of (3.10) give, respectively,
  $ 2 bb(E) a_F \( i \) = - beta \, #h(2em) 2 bb(E) b_F \( i \) = 0 \, #h(2em) 4 bb(E) \| q_F \( i \) \|^2 = beta \( beta + 1 \) . $
  This proves (3.8). Boundedness of $q_F \( i \)$ follows from the same compact-family bounds and $Q_F \( i \) = 1$.
  Finally, differentiating $Q_(T_z F) \( w \) = Q_F \( z dot.op w \) \/ Q_F \( z \)$ with respect to $w$ introduces the factor $y = "Im" z$. Since $"Im" \( z dot.op w \) = y "Im" w$, formula (3.9) follows directly from the definition of $q$. ◻
]

The law has now supplied affine covariance and explicit moments. We next use it to control the behavior of typical maps near the boundary and at infinity; the moments will enter the later geometric comparison.

== 4 Escape estimates and compact superlevels <sec:escape>

The geometric argument will compare critical points above a fixed positive level. We first show that such points cannot escape to the boundary or to infinity for almost every target value. The main step near the real axis is a bound on the total length of a horizontal line that maps into a compact target set.

Throughout this section assume $rho > 2$, let $beta = log_2 rho > 1$, and let $P$ be the probability from Lemma 7. Thus, for $z = x + i y in bb(H)$ and every nonnegative Borel function $Phi$ on $cal(K)$,

#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) #h(-0.16667em) [\| Q_F \( z \) \|^2 Phi \( T_z F \)] = y^(- beta) bb(E) Phi \( F \) . $ <escape:covariance>]

Set

#[#set math.equation(numbering: n => "(4.2)")
 $ k = frac(beta + 3, 4) > 1 \, #h(2em) V_xi^F \( x + i y \) = frac(y^k, \| F \( x + i y \) - xi \|) quad \( F in cal(K) \, med xi in bb(C) \) \, $ <escape:potential>]

with value $+ oo$ at the unique possible point where $F \( z \) = xi$.

#thm([Proposition 4.1.])[
  (Compact positive superlevels).  #emph[For $P$-almost every $F in cal(K)$, for planar area-almost every $xi in bb(C)$, the set 
$ { z in bb(H) : V_xi^F \( z \) gt.eq delta } $

 is compact in $bb(H)$ for every $delta > 0$.]
] <prop:proper-superlevels>

We first obtain a weighted area integral from (4.1). Its tail gives escape at positive heights. An integration by parts then controls horizontal preimage length, which will bound the area of exceptional targets near the real axis.

=== 4.1 A weighted area integral <a-weighted-area-integral>

Recall $m \( z \) = \( z - i \) \/ \( z + i \)$ and the affine inverse $z^(\#) = \( - x + i \) \/ y$ of $z = x + i y$. Define

#[#set math.equation(numbering: n => "(4.3)")
 $ S_0 = { z in bb(H) : \| m \( z \) \| gt.eq 1 / 2 } \, #h(2em) I \( F \) = integral_(S_0) y^(beta + 1) \| F \( x + i y \) \|^(- 4) thin d A \( x + i y \) . $ <escape:weighted-integral>]

The complement of $S_0$ has compact closure in $bb(H)$ and contains the unique zero $i$ of every $F in cal(K)$.

#thm([Lemma 4.2.])[
  (Weighted inverse area).  #emph[The function $I : cal(K) arrow.r \[ 0 \, oo \]$ is Borel and satisfies $bb(E) I \( F \) lt.eq 256 pi$. In particular, $I \( F \) < oo$ almost surely.]
] <lem:weighted-inverse-area>

#proof[
  For $z eq.not i$, normalization gives
  $ \( T_z F \) \( z^(\#) \) = - frac(F \( z \) Q_F \( z \), y) . $
  Apply (4.1) with $Phi \( H \) = \| H \( z^(\#) \) \|^(- 4)$. Both evaluations avoid the unique zero, and we obtain
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) #h(-0.16667em) [\| F' \( z \) \|^2 \| F \( z \) \|^(- 4)] = y^(- beta - 4) bb(E) \| F \( z^(\#) \) \|^(- 4) . $ <escape:inverse-identity>]
  The transformation $\( x \, y \) mapsto \( u \, Y \) = \( - x \/ y \, 1 \/ y \)$ is an involution, with
  $ det frac(partial \( u \, Y \), partial \( x \, y \)) = det mat(delim: "(", - 1 \/ y, x \/ y^2; 0, - 1 \/ y^2) = y^(- 3) . $
  Consequently $d x thin d y = Y^(- 3) d u thin d Y$. Moreover,
  $ \| m \( z^(\#) \) \|^2 = frac(x^2 + \( y - 1 \)^2, x^2 + \( y + 1 \)^2) = \| m \( z \) \|^2 \, $
  so the involution preserves $S_0$.
  Lemma 4 gives $\| F \| gt.eq 1 \/ 16$ on $S_0$. Injectivity and conformal change of variables therefore imply
  #[#set math.equation(numbering: n => "(4.5)")
   $ integral_(S_0) \| F' \( z \) \|^2 \| F \( z \) \|^(- 4) thin d A \( z \) = integral_(F \( S_0 \)) \| w \|^(- 4) thin d A \( w \) lt.eq integral_(\| w \| gt.eq 1 \/ 16) \| w \|^(- 4) thin d A \( w \) = 256 pi . $ <escape:deterministic-area>]
  All the integrands are nonnegative and jointly Borel, by continuity of interior evaluations. Integrating (4.4), using Tonelli and the involution, gives
  $ bb(E) integral_(S_0) \| F' \|^2 \| F \|^(- 4) thin d A & = integral_(S_0) y^(- beta - 4) bb(E) \| F \( z^(\#) \) \|^(- 4) thin d x thin d y\
 & = integral_(S_0) Y^(beta + 1) bb(E) \| F \( u + i Y \) \|^(- 4) thin d u thin d Y = bb(E) I \( F \) . $
  The same joint measurability makes $I$ Borel. The conclusion follows from (4.5). ◻
]

=== 4.2 Escape and horizontal preimage length <escape-and-horizontal-preimage-length>

#thm([Lemma 4.3.])[
  (Escape and trace bounds).  #emph[Let $F in cal(K)$ satisfy $I \( F \) < oo$. Then 
#[#set math.equation(numbering: n => "(4.6)")
 $ frac(y^k, \| F \( x + i y \) \|) arrow.r 0 #h(2em) upright("as ") \| x \| + y arrow.r oo . $ <escape:tail>]

 For every compact $K subset bb(C)$ and $epsilon.alt > 0$, $F^(- 1) \( K \) ∩ { Im z gt.eq epsilon.alt }$ is compact in $bb(H)$, and 
$ H_(F \, K) := sup { Im z : F \( z \) in K } < oo \, $

 where the supremum of an empty set is assigned zero. Moreover, there is $C_(F \, K) < oo$ such that 
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_(bb(R)) upright(bold(1))_K \( F \( x + i epsilon.alt \) \) thin d x lt.eq C_(F \, K) #h(2em) \( epsilon.alt > 0 \) . $ <escape:trace>]

]
] <lem:escape-trace>

#proof[
  Write $R \( z \) = \| x \| + y$. If $z' = x' + i y' in B \( z \, y \/ 2 \)$, then
  $ y \/ 2 < y' < 3 y \/ 2 \, #h(2em) R \( z \) lt.eq \| x' \| + 3 y' lt.eq 3 R \( z' \) . $
  Thus these disks lie in ${ R \( z' \) gt.eq R \( z \) \/ 3 }$ and eventually in $S_0$. On them $1 \/ F$ is holomorphic. Submean for $\| 1 \/ F \|^4$, followed by comparison of $y$ with $y'$, gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ y^(beta + 3) \| F \( z \) \|^(- 4) lt.eq C_beta #h(-0.16667em) integral_(S_0 ∩ { R \( z' \) gt.eq R \( z \) \/ 3 }) \( Im z' \)^(beta + 1) \| F \( z' \) \|^(- 4) thin d A \( z' \) arrow.r 0 . $ <escape:uniform-tail>]
  The convergence follows from the tail of the single integrable function in (4.3), and is uniform in $z$ as $R \( z \) arrow.r oo$. Since $4 k = beta + 3$, this proves (4.6).
  At heights $y gt.eq epsilon.alt > 0$, (4.6) also gives $\| F \( z \) \| arrow.r oo$ as $R \( z \) arrow.r oo$. Hence the preimage of a compact $K$, restricted to these heights, is bounded. It is closed in the plane, because a limit stays at height at least $epsilon.alt$ and $F$ is continuous there. It is therefore compact in $bb(H)$. Taking $epsilon.alt = 1$ and then including the points below height one proves the bound on $H_(F \, K)$.
  To prove (4.7), choose a nonnegative $psi in C_c^oo \( bb(C) \)$ with $psi gt.eq 1$ on $K$, and fix $epsilon.alt > 0$. The function $g = psi compose F$ has compact support when restricted to $y gt.eq epsilon.alt \/ 2$, by the compactness just proved. Thus
  $ h \( y \) = integral_(bb(R)) g \( x \, y \) thin d x $
  is smooth for $y gt.eq epsilon.alt$, differentiation passes under the integral, and $h \, h'$ vanish at sufficiently large height. The horizontal second derivative of $g$ integrates to zero. Therefore
  $ integral_(y > epsilon.alt) \( y - epsilon.alt \) Delta g \( x \, y \) thin d x thin d y & = integral_epsilon.alt^oo \( y - epsilon.alt \) h'' \( y \) thin d y\
 & = \[ \( y - epsilon.alt \) h' \( y \) \]_epsilon.alt^oo - \[ h \( y \) \]_epsilon.alt^oo = h \( epsilon.alt \) . $
  Write $Omega = F \( bb(H) \)$ and $Y \( w \) = Im F^(- 1) \( w \)$ for $w in Omega$. Since $Delta \( psi compose F \) = \| F' \|^2 \( Delta psi \) compose F$, conformal change of variables gives
  $ h \( epsilon.alt \) = integral_(Omega ∩ { Y > epsilon.alt }) \( Y \( w \) - epsilon.alt \) Delta psi \( w \) thin d A \( w \) . $
  Taking the absolute value of this signed integral yields
  $ integral_(bb(R)) upright(bold(1))_K \( F \( x + i epsilon.alt \) \) thin d x lt.eq h \( epsilon.alt \) lt.eq H_(F \, "supp" psi) parallel Delta psi parallel_(L^1 \( bb(C) \)) . $
  This finite bound is independent of $epsilon.alt$, as required. ◻
]

All conclusions of Lemma 11 hold on the single full-measure set ${ I \( F \) < oo }$, simultaneously for every compact target set. In particular, no exceptional set depending on the height is needed. We now use the trace bound to control targets approached at small height.

=== 4.3 Targets near the real axis <targets-near-the-real-axis>

#proof[
  Fix $F$ with $I \( F \) < oo$, and put $Omega = F \( bb(H) \)$. For each fixed $xi in bb(C)$ and $epsilon.alt > 0$, Lemma 11 implies
  #[#set math.equation(numbering: n => "(4.9)")
   $ V_xi^F \( x + i y \) arrow.r 0 quad upright("as ") \| x \| + y arrow.r oo \, quad y gt.eq epsilon.alt . $ <escape:target-tail>]
  Indeed $\| F \| arrow.r oo$ in this region, so eventually $\| F - xi \| gt.eq \| F \| \/ 2$.
  For small heights first consider omitted targets. Fix $R \, delta > 0$ and a dyadic $h lt.eq 1$. Partition $bb(R)$ into the half-open cells $I_j = \[ j h \, \( j + 1 \) h \)$, $j in bb(Z)$. Call a cell a witness cell if there exist $x in I_j$, $h lt.eq y lt.eq 2 h$, and $xi in.not Omega$ with $\| xi \| lt.eq R$ such that $V_xi^F \( x + i y \) gt.eq delta$. At any such witness $z = x + i y$,
  $ \| F \( z \) - xi \| lt.eq \( 2 h \)^k \/ delta . $
  The disk $B \( z \, y \)$ lies in $bb(H)$, and its image omits $xi$. Lemma 3 therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ y \| F' \( z \) \| lt.eq 4 \| F \( z \) - xi \| lt.eq 4 \( 2 h \)^k \/ delta . $ <escape:witness-derivative>]
  For every $x' in I_j$, the relative point
  $ \( x' - x \) \/ y + i h \/ y in \[ - 1 \, 1 \] + i \[ 1 \/ 2 \, 1 \] $
  belongs to a fixed compact subset of $bb(H)$. The values of $T_z F in cal(K)$ there are bounded by a common constant $M$, by Lemma 4. The definition of $T_z F$ and (4.10) imply
  #[#set math.equation(numbering: n => "(4.11)")
   $ \| F \( x' + i h \) - xi \| lt.eq \( 1 + 4 M \) \( 2 h \)^k \/ delta = : C_delta h^k . $ <escape:witness-cell>]
  In particular, each witness cell at height $h$ maps entirely into the fixed target disk $K_(R \, delta) = { \| w \| lt.eq R + C_delta }$. By (4.7), the disjoint cells, each of length $h$, have number at most $C_(F \, R \, delta) \/ h$. This count permits all the omitted targets with $\| xi \| lt.eq R$ at once. For every witness cell place a closed target disk of radius $C_delta h^k$ at the image of its midpoint at height $h$. Estimate (4.11), applied to any witness in that cell, shows that these disks cover every target witnessed at scale $h$. Their union $E_h$ has area at most
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| E_h \| lt.eq C_(F \, R \, delta) h^(2 k - 1) . $ <escape:target-cover>]
  The sum over dyadic $h arrow.r 0$ is finite. Hence $limsup_(n arrow.r oo) E_(2^(- n))$ has area zero: its area is bounded by each tail of that convergent sum.
  Take the countable union of these null sets for positive integer $R$ and $delta = 1 \/ n$, $n gt.eq 1$. Every omitted target outside the union satisfies
  #[#set math.equation(numbering: n => "(4.13)")
   $ sup_(x in bb(R)) V_xi^F \( x + i y \) arrow.r 0 #h(2em) \( y arrow.b 0 \) . $ <escape:small-height>]
  Indeed each positive threshold eventually has no witness in any smaller dyadic slab, and these slabs cover all sufficiently small heights. This argument only uses finite disk covers for the fixed map $F$.
  For an interior target $xi in Omega$, choose $a > 0$ so that $overline(B) \( xi \, a \) subset Omega$. Its image under the continuous inverse $F^(- 1)$ is compact in $bb(H)$, and has positive minimum height. Below that height, $\| F \( z \) - xi \| gt.eq a$, so $V_xi^F \( z \) lt.eq y^k \/ a$. Thus (4.13) holds for every interior target as well.
  For each target retained above and each $delta > 0$, (4.13) first excludes all sufficiently small heights from ${ V_xi^F gt.eq delta }$. Equation (4.9) then excludes all sufficiently large $\| x \| + y$. Finally
  $ { V_xi^F gt.eq delta } = { z in bb(H) : \| F \( z \) - xi \| lt.eq \( Im z \)^k \/ delta } $
  is closed, includes the possible pole, and lies in a bounded box with positive minimum height. It is compact in $bb(H)$. The assertion follows from Lemma 10. ◻
]

#thm([Lemma 4.4.])[
  (Measurability of compact superlevels).  #emph[The set of pairs $\( F \, xi \) in cal(K) times bb(C)$ for which every closed positive superlevel of $V_xi^F$ is compact in $bb(H)$ is Borel.]
] <lem:superlevel-borel>

#proof[
  Use the compact exhaustion $C_m = { x + i y : \| x \| lt.eq m \, med 1 \/ m lt.eq y lt.eq m }$, $m gt.eq 1$. The stated property is equivalent to
  $ upright("for every ") n gt.eq 1 upright(" there is ") m gt.eq 1 upright(" such that ") { V_xi^F > 1 \/ n } subset C_m . $
  Necessity follows by containing the closed $1 \/ n$-superlevel in a box. For sufficiency, given $delta > 0$ choose $1 \/ n < delta$; the corresponding box contains the closed $delta$-superlevel. For fixed $n \, m$, the containment is equivalent to
  $ \| F \( q \) - xi \| gt.eq n \( Im q \)^k quad upright("for every ") q in \( bb(Q) + i bb(Q) \) ∩ \( bb(H) \\ C_m \) . $
  Any violation occurs in a nonempty open subset of the open complement of $C_m$ and is therefore detected at a rational point. Each displayed inequality is closed in the parameters by continuity of evaluation. The countable tests prove the claim. ◻
]

== 5 Critical points and an equivariant pairing <sec:critical-pairing>

For targets with the compact superlevels obtained in the preceding section, we can compare the critical points of $V_xi^F$. We will assign every saddle to a distinct maximum whose value is at least as large. The assignment must depend measurably on $F$ and respect affine changes of the source, because the next section will average this comparison using the weighted law.

=== 5.1 The critical map and good targets <the-critical-map-and-good-targets>

Throughout this section, $P$ is the law of Lemma 7, $beta > 1$, and $k = \( beta + 3 \) \/ 4 > 1$. Recall that $Q_F = 1 \/ F'$ and $q_F \( x + i y \) = i y Q'_F \( x + i y \) \/ Q_F \( x + i y \) = a_F + i b_F$. Define the smooth real map $G_F : bb(H) arrow.r bb(C)$ by

#[#set math.equation(numbering: n => "(5.1)")
 $ G_F \( z \) = F \( z \) - frac(i y, k) F' \( z \) \, #h(2em) z = x + i y . $ <eq:critical-map>]

The normalization gives $G_F \( i \) = - i \/ k$ for every $F in cal(K)$. We define its normalized signed Jacobian by

#[#set math.equation(numbering: n => "(5.2)")
 $ J_F \( z \) = frac(det D G_F \( z \), \| F' \( z \) \|^2) . $ <eq:normalized-jacobian>]

Here $D G_F$ is the derivative as a map between two real planes. The sign of $J_F$ will distinguish saddles from maxima.

#thm([Lemma 5.1.])[
  (Jacobian and its expectation).  #emph[For every $F in cal(K)$ and $z in bb(H)$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ k^2 J_F \( z \) = k \( k - 1 \) + \( 2 k - 1 \) a_F \( z \) + \| q_F \( z \) \|^2 . $ <eq:jacobian-formula>]

 The function $F mapsto J_F \( i \)$ is bounded and continuous on $cal(K)$, and 
#[#set math.equation(numbering: n => "(5.4)")
 $ k^2 bb(E) J_F \( i \) = k \( k - 1 \) > 0 . $ <eq:positive-jacobian-mean>]

]
] <lem:jacobian-moments>

#proof[
  Since $F'' \/ F' = i q_F \/ y$, the two real derivative columns are
  $ \( G_F \)_x = F' / k \( k + q_F \) \, #h(2em) \( G_F \)_y = frac(i F', k) \( k - 1 + q_F \) . $
  For complex vectors $u \, v$, their real determinant is $"Im" \( overline(u) v \)$. Applying this identity to the displayed columns gives (5.3). Local derivative continuity and compactness of $cal(K)$ give the asserted continuity and boundedness at $i$. Lemma 8 gives
  $ bb(E) a_F \( i \) = - beta / 2 \, #h(2em) bb(E) \| q_F \( i \) \|^2 = frac(beta \( beta + 1 \), 4) . $
  Because $2 k - 1 = \( beta + 1 \) \/ 2$, the last two terms in the expectation of (5.3) cancel. This proves (5.4). ◻
]

#thm([Lemma 5.2.])[
  (Critical points and their signs).  #emph[Fix $F in cal(K)$ and $xi in bb(C)$. Away from the unique possible pole of $V_xi^F$, put $ell = log V_xi^F$. Then 
#[#set math.equation(numbering: n => "(5.5)")
 $ Delta ell = - k / y^2 \, $ <eq:negative-laplacian>]

 and its critical points are exactly the solutions of $G_F \( z \) = xi$. At such a point, 
#[#set math.equation(numbering: n => "(5.6)")
 $ V_xi^F \( z \) & = k y^(k - 1) \| Q_F \( z \) \| \,\
"Hess" ell \( z \) & = k / y^2 mat(delim: "(", - \( k + a_F \( z \) \), b_F \( z \); b_F \( z \), k - 1 + a_F \( z \)) \,\
det "Hess" ell \( z \) & = - k^4 / y^4 J_F \( z \) . $ <eq:critical-height>]

 Consequently a solution with $J_F \( z \) > 0$ is a nondegenerate saddle, and one with $J_F \( z \) < 0$ is a nondegenerate maximum.]
] <lem:critical-signs>

#proof[
  Write $r = F' \/ \( F - xi \)$. Since $log \| F - xi \|$ is harmonic off the pole,
  $ ell_x = - "Re" r \, #h(2em) ell_y = k / y + "Im" r \, $
  and (5.5) follows. Thus the critical equation is $r = - i k \/ y$, or $F - xi = i y F' \/ k$, which is precisely $G_F \( z \) = xi$ and gives (5.6). A pole cannot solve this equation because $y > 0$ and $F' eq.not 0$.
  At a critical point the holomorphic derivative of $r$ is
  $ r' = F'' / F' r - r^2 = frac(k \( k + q_F \), y^2) . $
  Differentiating the two real gradient entries now gives (5.6), whose determinant is (5.6) by (5.3). Its trace is $- k \/ y^2 < 0$. A negative determinant therefore gives a saddle; a positive determinant gives two negative eigenvalues and hence a strict maximum. At a critical point, $"Hess" V_xi^F = V_xi^F "Hess" ell$, so these classifications apply to $V_xi^F$ as well. ◻
]

#prodef([Definition 5.3.])[
  A pair $\( F \, xi \) in cal(K) times bb(C)$ is #emph[good] if every closed positive superlevel of $V_xi^F$ is compact in $bb(H)$, and $xi$ is a regular value of $G_F$. Thus every solution $G_F \( z \) = xi$ must satisfy $J_F \( z \) eq.not 0$; a target with no such solution is regular. Write $cal(G)$ for the set of good pairs.
] <def:good-pair>

#thm([Lemma 5.4.])[
  (Good pairs and affine changes of source).  #emph[The set $cal(G)$ is Borel. For $P$-almost every $F$, its section ${ xi : \( F \, xi \) in cal(G) }$ has full planar area measure.]
  #emph[For every $F in cal(K)$, $xi in bb(C)$, $t = x_0 + i y_0 in bb(H)$, and $w in bb(H)$, set $tilde(xi) = \( xi - F \( t \) \) \/ \( y_0 F' \( t \) \)$. Then 
#[#set math.equation(numbering: n => "(5.7)")
 $ G_(T_t F) \( w \) & = frac(G_F \( t dot.op w \) - F \( t \), y_0 F' \( t \)) \,\
q_(T_t F) \( w \) & = q_F \( t dot.op w \) \, #h(2em) J_(T_t F) \( w \) = J_F \( t dot.op w \) \,\
V_(tilde(xi))^(T_t F) \( w \) & = y_0^(1 - k) \| F' \( t \) \| V_xi^F \( t dot.op w \) . $ <eq:critical-map-covariance>]

 In particular, $\( F \, xi \) in cal(G)$ if and only if $\( T_t F \, tilde(xi) \) in cal(G)$.]
] <lem:good-pairs>

#proof[
  The compact-superlevel condition is Borel by Lemma 12. For completeness, regularity can be tested on the compact source boxes $C_m = { \| x \| lt.eq m \, med 1 \/ m lt.eq y lt.eq m }$: failure means that for some $m$ there is $w in C_m$ with
  $ G_F \( w \) = xi \, #h(2em) J_F \( w \) = 0 . $
  The set defined by these equalities is closed in $cal(K) times bb(C) times C_m$; its projection onto $cal(K) times bb(C)$ is closed because $C_m$ is compact. A countable union gives a Borel exceptional set.
  For each fixed $F$, the critical values of $G_F$ have area zero. This is the plane case of Sard’s theorem #cite(label("Sard1942")) Theorem 4.1; we give the short covering argument for the smooth maps at hand. Fix a compact source box and a slightly larger compact box in $bb(H)$. For small $h > 0$, cover the first box by $O \( h^(- 2) \)$ squares of side $h$. If a square meets the critical set, choose a critical point there. Taylor expansion at that point, using the bounded second derivative on the larger box, puts the image of the square in an $O \( h^2 \)$-neighborhood of a line segment of length $O \( h \)$: the linear part has rank at most one. This neighborhood has area $O \( h^3 \)$. The image of all critical points in the first box consequently has outer area $O \( h \)$, and therefore area zero. Exhausting $bb(H)$ by boxes proves the claim. Combine it with Proposition 9 to obtain the asserted full-area sections for almost every $F$.
  The derivative identity $\( T_t F \)' \( w \) = F' \( t dot.op w \) \/ F' \( t \)$ gives (5.7) by substitution and gives the $q$ identity in (5.7). Formula (5.3) then gives the $J$ identity. The definition of $V$ gives (5.7). Its multiplying factor is positive and independent of $w$. The source affine map is a homeomorphism of $bb(H)$, while the target change is a nonsingular similarity. They preserve the two conditions defining $cal(G)$ in both directions. ◻
]

=== 5.2 The superlevel count <the-superlevel-count>

We next prove the counting statement needed for the pairing. The pole is kept separate from the finite maxima: its contribution to the count is an index of the gradient, rather than a critical point of the smooth function $ell$.

#thm([Lemma 5.5.])[
  (Counting critical points above a level).  #emph[Fix a good pair $\( F \, xi \)$. There are only finitely many critical points of $V_xi^F$ with value at least $h$, for every $h > 0$. For every such $h$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ \# { upright("maxima with ") V_xi^F gt.eq h } med gt.eq med \# { upright("saddles with ") V_xi^F gt.eq h } . $ <eq:cumulative-critical-count>]

 The possible pole is excluded from the maximum count.]
] <lem:critical-count>

#proof[
  Put $ell = log V_xi^F$ away from the pole. The solutions of $G_F \( z \) = xi$ are isolated by regularity, and form a closed subset of $bb(H)$; isolation follows from the real inverse-function theorem #cite(label("Lee2013")) Theorem C.34. Those with $V_xi^F gt.eq h$ lie in a compact set and are therefore finite. This includes the possibility of a pole in that compact set without allowing accumulation there: if $F \( z_0 \) = xi$, then $G_F \( z_0 \) - xi = - i "Im" \( z_0 \) F' \( z_0 \) \/ k eq.not 0$.
  Choose $lambda > 0$ which is not a critical value of $V_xi^F$ and put
  $ U_lambda = { z in bb(H) : V_xi^F \( z \) > lambda } \, $
  including the pole if it exists. This is open, with compact closure in $bb(H)$. Its boundary is exactly the level ${ V_xi^F = lambda }$: the pole is an interior point of $U_lambda$, and at every level point the nonzero gradient gives values on both sides of $lambda$. The level is a compact smooth one-manifold without boundary. Its components are open in that manifold, and thus there are finitely many. Each component is a smooth regular simple closed curve. One way to see the last assertion is to flow a unit tangent field, obtained by rotating $nabla ell \/ \| nabla ell \|$ along the level. The flow is complete by compactness. Its orbits are open in each connected component, so a component is a single orbit. If this orbit were not periodic, its parametrization would be an injective surjective local homeomorphism from $bb(R)$ to that compact component, which is impossible. The return times form a closed subgroup with a gap around zero by local injectivity; its least positive element gives a regular simple closed parametrization.
  Consider the bounded Jordan interior $D$ of one level curve $gamma$. The Jordan curve theorem is used here in its plane separation form #cite(label("Munkres2014")) Theorem 63.4. The closure of $D$ lies in $bb(H)$: points below the positive minimum height of $gamma$ connect to infinity without crossing it and hence lie in the unbounded complementary component. In fact
  #[#set math.equation(numbering: n => "(5.9)")
   $ V_xi^F > lambda quad upright("throughout ") D . $ <eq:jordan-interior-superlevel>]
  If a point inside had smaller value, $ell$ would attain a minimum below its boundary value $log lambda$ at an interior point. A neighborhood of any pole can be excluded when taking this minimum, since $ell$ tends to $+ oo$ there. Such a minimum contradicts $Delta ell = - k \/ y^2 < 0$. Once smaller values are excluded, equality at an interior point is likewise a local minimum and is impossible.
  The interiors of the level curves are disjoint and are exactly the components of $U_lambda$. Indeed, nested curves are excluded by (5.9). Conversely, a nonempty component of $U_lambda$ has a boundary point because its closure is compact. This point is on the level: a boundary point cannot belong to a component of the open set $U_lambda$. Near it, regularity and (5.9) identify the superlevel side with the interior side of its level curve. The component therefore meets and contains that connected Jordan interior, and cannot leave it without crossing the curve. This proves the assertion, including that no component has a hole.
  The superlevel components are therefore bounded Jordan domains with smooth boundaries. It remains to turn this topological information into a count of their critical points, keeping the possible pole visible in the index sum. On the positive orientation of each boundary curve, $nabla ell$ is an inward normal and has winding number $+ 1$. We recall the elementary tangent-turning argument of Hopf #cite(label("Hopf1935")) §2, pp. 53–55 to fix this sign. Parametrize a regular simple closed curve periodically by $gamma : \[ 0 \, 1 \] arrow.r bb(R)^2$, positively oriented and starting at a leftmost point. Its initial tangent points down. The unit secant
  $ frac(gamma \( t \) - gamma \( s \), \| gamma \( t \) - gamma \( s \) \|) \, #h(2em) 0 lt.eq s < t lt.eq 1 \, quad \( s \, t \) eq.not \( 0 \, 1 \) \, $
  extends continuously to the closed triangle: on the diagonal its value is the unit tangent, and at $\( 0 \, 1 \)$ it is the negative initial tangent. The latter extension follows by the endpoint expansion
  $ gamma \( t \) - gamma \( s \) = - #scale(x: 120%, y: 120%)[\(] \( 1 - t \) + s #scale(x: 120%, y: 120%)[\)] gamma' \( 0 \) + o #scale(x: 120%, y: 120%)[\(] \( 1 - t \) + s #scale(x: 120%, y: 120%)[\)] . $
  The extended secant has a continuous angle lift $A \( s \, t \)$ on the triangle. For example, uniform continuity permits one common number of subdivisions of every segment from $\( 0 \, 0 \)$ to $\( s \, t \)$ so that successive unit-vector ratios have a unique small continuous argument; adding those arguments constructs the lift. Along $\( 0 \, t \)$, secants lie in the closed right semicircle, from the downward tangent to its upward negative. Thus $A \( 0 \, 1 \) - A \( 0 \, 0 \) = pi$. The secant along $\( t \, 1 \)$ is the negative of that along $\( 0 \, t \)$, including their extensions, so continuity gives $A \( t \, 1 \) - A \( 0 \, t \) = pi$ throughout. Therefore $A \( 1 \, 1 \) - A \( 0 \, 0 \) = 2 pi$. This is the turn of the tangent along the diagonal; rotation to the inward normal preserves its winding number.
  Inside one component of $U_lambda$, remove small disjoint disks about its finitely many critical points and its pole, if present. On the remaining compact smooth domain, $X = nabla ell$ is nonzero and its angle form
  $ frac(X_1 thin d X_2 - X_2 thin d X_1, X_1^2 + X_2^2) $
  is closed. Stokes’ theorem #cite(label("Lee2013")) Theorem 16.11 shows that the winding on the outer boundary equals the sum of the windings on the positively oriented small circles. At a nondegenerate critical point, the gradient on a sufficiently small circle is homotopic through nonzero vectors to its invertible linear part. Its index is consequently the sign of $det "Hess" ell$, namely $+ 1$ at a maximum and $- 1$ at a saddle.
  If $z_0$ is the pole, the simple zero of $F - xi$ gives
  $ ell \( z \) = - log \| z - z_0 \| + upright("a smooth function") \, #h(2em) nabla ell \( z \) = - frac(z - z_0, \| z - z_0 \|^2) + O \( 1 \) \, $
  where vectors are identified with complex numbers in the second formula. The negative radial leading field has winding number $+ 1$. Thus the pole also contributes $+ 1$, although it is not a finite critical point.
  Let $C_lambda$ be the number of components of $U_lambda$, and let $B in { 0 \, 1 }$ be the number of poles. Summing the index identity gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ C_lambda = \# { upright("maxima with ") V_xi^F > lambda } - \# { upright("saddles with ") V_xi^F > lambda } + B . $ <eq:level-index-count>]
  If $B = 1$, its pole belongs to $U_lambda$, so $C_lambda gt.eq B$. The same inequality is automatic when $B = 0$. Hence maxima are at least as numerous as saddles above every regular positive level. An empty superlevel gives the same identity with all counts zero.
  Finally, for a given $h > 0$, finiteness of the critical points of value at least $h \/ 2$ permits a regular $lambda in \( h \/ 2 \, h \)$ with no critical value in $\[ lambda \, h \)$. The counts above $lambda$ are exactly those at or above $h$, including all ties. This proves (5.8). ◻
]

=== 5.3 Equal-rank pairing <equal-rank-pairing>

The cumulative count supplies the partner of each saddle. We now give one choice which is intrinsic to the source coordinates and prove that it has the measurability needed for integration.

#thm([Proposition 5.6.])[
  (Measurable equivariant pairing).  #emph[Let 
$ cal(D) = { \( F \, z \) in cal(K) times bb(H) : J_F \( z \) > 0 \, med \( F \, G_F \( z \) \) in cal(G) } . $

 There is a Borel map $R : cal(D) arrow.r bb(H)$, written $R_F \( z \) = R \( F \, z \)$, such that, for every $\( F \, z \) in cal(D)$, with $z' = R_F \( z \)$ and $xi = G_F \( z \)$, 
#[#set math.equation(numbering: n => "(5.11)")
 $ G_F \( z' \) = xi \, #h(2em) J_F \( z' \) < 0 \, #h(2em) V_xi^F \( z' \) gt.eq V_xi^F \( z \) . $ <eq:pairing-guarantees>]

 For each fixed $F$, the map $R_F$ is injective on its domain. It is affine equivariant: if $t in bb(H)$ and $\( F \, t dot.op w \) in cal(D)$, then 
#[#set math.equation(numbering: n => "(5.12)")
 $ \( T_t F \, w \) in cal(D) \, #h(2em) R_(T_t F) \( w \) = t^(\#) dot.op R_F \( t dot.op w \) . $ <eq:pairing-covariance>]

]
] <prop:critical-pairing>

#proof[
  Fix a good pair $\( F \, xi \)$. Order its saddles by decreasing value of $V_xi^F$, breaking ties by increasing lexicographic order of $\( x \, y \)$. Order its maxima separately by the same rule. Every point has finitely many predecessors, since all predecessors have value at least its own positive value. Give it the zero-based rank equal to the number of its predecessors. Distinct points have distinct ranks: if one precedes another, its predecessors and the point itself precede the latter. Moreover, if rank $j$ occurs, the finite ordered set of its predecessors has ranks $0 \, dots.h \, j - 1$. Thus there are no missing ranks below an attained one, whether the entire fiber is finite or infinite.
  Suppose a saddle has rank $j$ and value $v$. There are at least $j + 1$ saddles of value at least $v$. Lemma 17 gives at least $j + 1$ maxima of value at least $v$. These maxima form an initial segment of the maximum order, so the maximum of rank $j$ exists and has value at least $v$. Assign the saddle to this maximum. This is injective within the fiber, and gives (5.11) by Lemma 14. Distinct fibers cannot share a point, so the assignment is injective for fixed $F$ across its entire domain.
  Figure 1 illustrates the two ordered lists.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-1.155, 0), (-1.155, 3.096), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.155, 3.096), [#text(size: 9pt)[$V^F_ xi$]], anchor: "south", padding: 0.1176cm)
  content((0, 3.312), [#text(size: 9pt)[saddles]])
  content((4.2, 3.312), [#text(size: 9pt)[maxima]])
  line((0.0945, 2.52), (4.095, 2.88), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  circle((0, 2.52), radius: 0.07056, fill: black, stroke: none)
  content((0, 2.52), [#text(size: 9pt)[$s_0$]], anchor: "east", padding: 0.1176cm)
  circle((4.2, 2.88), radius: 0.07056, fill: black, stroke: none)
  content((4.2, 2.88), [#text(size: 9pt)[$m_0$]], anchor: "west", padding: 0.1176cm)
  line((0.0945, 1.944), (4.095, 2.232), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  circle((0, 1.944), radius: 0.07056, fill: black, stroke: none)
  content((0, 1.944), [#text(size: 9pt)[$s_1$]], anchor: "east", padding: 0.1176cm)
  circle((4.2, 2.232), radius: 0.07056, fill: black, stroke: none)
  content((4.2, 2.232), [#text(size: 9pt)[$m_1$]], anchor: "west", padding: 0.1176cm)
  line((0.0945, 0.432), (4.095, 1.008), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  circle((0, 0.432), radius: 0.07056, fill: black, stroke: none)
  content((0, 0.432), [#text(size: 9pt)[$s_2$]], anchor: "east", padding: 0.1176cm)
  circle((4.2, 1.008), radius: 0.07056, fill: black, stroke: none)
  content((4.2, 1.008), [#text(size: 9pt)[$m_2$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The first three ranks in a schematic good target fiber. Vertical position records $V_xi^F$; the two columns are ordered separately by decreasing value, with lexicographic tie-breaking. Equal ranks are paired, and each arrow ends at least as high as it starts. The pole is absent from both lists, and additional maxima may remain unassigned. Arrows describe the rank assignment, not curves in the source plane. ],
  ) <fig:rank-pairing>
  We give the Borel construction explicitly. Countable Borel enumeration is the subject of the Lusin–Novikov theorem; see #cite(label("Moschovakis2009")) 4F.6 and 4F.17. Here nonsingularity supplies continuous local branches, and the rank definition will also supply affine equivariance. Consider the nonsingular solution graph
  $ Gamma = { \( F \, xi \, w \) in cal(K) times bb(C) times bb(H) : G_F \( w \) = xi \, med J_F \( w \) eq.not 0 } . $
  It can be covered by countably many continuous branches over open parameter sets in $cal(K) times bb(C)$. To prove this without differentiating in the parameter $F$, fix $\( F_0 \, xi_0 \, w_0 \) in Gamma$ and the invertible real matrix $D = D G_(F_0) \( w_0 \)$. Joint continuity of derivatives on source compacts gives a closed ball $overline(B) \( w_0 \, r \) subset bb(H)$ and an open parameter neighborhood $U$ such that
  $ parallel I - D^(- 1) D G_F \( w \) parallel lt.eq 1 / 2 quad \( w in overline(B) \( w_0 \, r \) \) \, #h(2em) \| D^(- 1) \( G_F \( w_0 \) - xi \) \| < r / 2 $
  for every $\( F \, xi \) in U$. The map
  $ w mapsto w - D^(- 1) \( G_F \( w \) - xi \) $
  is a contraction of the closed ball into its interior. Its unique fixed point exists by the contraction principle #cite(label("Lee2013")) Lemma C.35. This point solves $G_F \( w \) = xi$, is nonsingular, and depends continuously on $\( F \, xi \)$. Continuity follows, for instance, by taking any convergent parameter sequence and using compactness of the ball and uniqueness to identify every subsequential limit of its fixed points.
  Consequently $Gamma ∩ \( U times B \( w_0 \, r \) \)$ is the graph of one continuous branch over $U$, and is an open neighborhood in $Gamma$. The space $Gamma$ is second countable, being a subspace of $cal(K) times bb(C) times bb(H)$. A countable collection of these branch neighborhoods therefore covers it. Enumerate the resulting continuous partial branches as $b_j : U_j arrow.r bb(H)$, $j gt.eq 1$. Activate branch $j$ at a parameter if the parameter is in $U_j$ and its value differs from every earlier branch defined there. These activation sets are Borel: there are finitely many earlier indices for a given $j$, and equality of two continuous branches is closed relative to their open overlap. Each nonsingular root occurs in exactly one active branch.
  On a branch, its critical value can be evaluated without division by $F \( w \) - xi$, using the positive continuous function
  $ H \( F \, w \) = k \( "Im" w \)^(k - 1) \| Q_F \( w \) \| . $
  At every root this equals $V_xi^F \( w \)$ by (5.6). The signs of $J_F$, comparisons of $H$, equalities of values, and lexicographic comparisons of coordinates are Borel. The rank of an active branch among branches of its sign is thus the countable sum of the Borel indicators of its active predecessors. This is an extended-integer-valued Borel function, and is finite on good fibers. Requiring a positive-sign and a negative-sign active branch to have the same finite rank gives a countable Borel test for the assigned pair.
  The set $cal(D)$ is Borel by Lemma 16 and continuity of $\( F \, z \) mapsto \( F \, G_F \( z \) \)$. At this target, require additionally that the positive-sign branch equal $z$. Exactly one active negative-sign branch passes the equal-rank test, by the existence and uniqueness proved above. Selecting its value defines a Borel map on $cal(D)$: the preimage of an open source set is the countable union of the Borel tests just described with the selected branch constrained to that set.
  Finally, under the affine source change $w mapsto t dot.op w$, the critical fibers and signs correspond by (5.7)–(5.7). All critical heights in a fiber are multiplied by the same positive constant in (5.7). The positive real source scale preserves lexicographic order, including ties of the first coordinate. Hence the two orders, their ranks, and the equal-rank assignment correspond exactly, giving (5.12). The enumeration was used only to prove measurability and does not enter the geometric definition of the assignment. ◻
]

The ordering used in (5.11) also handles coincident critical values. At each critical point, (5.6) and $4 \( k - 1 \) = beta - 1$ give

#[#set math.equation(numbering: n => "(5.13)")
 $ y^(beta - 1) \| Q_F \( z \) \|^4 = (frac(V_xi^F \( z \), k))^4 . $ <eq:critical-transport-weight>]

Thus the pairing increases the weight on the left of (5.13). The next section uses this pointwise comparison to contradict the positive expectation in (5.4).

== 6 Transport between saddles and maxima <sec:transport>

We now show that the weighted law obtained from $rho > 2$ is impossible. The pairing of Proposition 18 compares masses after changing variables by $G_F$. Averaging that comparison over large boxes will give $bb(E) J_F \( i \) lt.eq 0$, contradicting Lemma 13.

Throughout this section, suppose $rho > 2$, let $beta = log_2 rho$ and $k = \( beta + 3 \) \/ 4$, and use the probability $P$ from Lemma 7. Write

$ J_(F \, +) = max \( J_F \, 0 \) \, #h(2em) J_(F \, -) = max \( - J_F \, 0 \) \, #h(2em) omega_F \( x + i y \) = y^(beta - 1) \| Q_F \( x + i y \) \|^2 . $

Recall that $cal(G) subset cal(K) times bb(C)$ is the Borel set of good pairs and that $R_F \( z \)$ is the assigned maximum whenever $J_F \( z \) > 0$ and $\( F \, G_F \( z \) \) in cal(G)$.

=== 6.1 Change of variables and exceptional targets <change-of-variables-and-exceptional-targets>

For fixed $F$, the open set ${ J_F > 0 }$ has a countable cover by open sets on which $G_F$ is a diffeomorphism onto an open set. Disjointifying this cover gives Borel pieces $E_j$ on each of which $G_F$ is injective. Their images are Borel: each restriction is contained in a diffeomorphism chart, whose inverse is continuous. Ordinary absolute-Jacobian change of variables on these pieces, followed by Tonelli’s theorem #cite(label("Folland1999")) Theorems 2.37 and 2.47, therefore gives change of variables with a sum over preimages. The same construction applies on ${ J_F < 0 }$. In particular, for every nonnegative Borel function $h$ on $bb(H)$,

#[#set math.equation(numbering: n => "(6.1)")
 $ integral_(bb(H)) omega_F \( z \) J_(F \, plus.minus) \( z \) h \( z \) thin d A \( z \) = integral_(bb(C)) sum_(G_F \( z \) = xi\
plus.minus J_F \( z \) > 0) y^(beta - 1) \| Q_F \( z \) \|^4 h \( z \) thin d A \( xi \) . $ <eq:transport-area>]

Indeed, $\| det D G_F \| = \| F' \|^2 \| J_F \|$, so division by the absolute Jacobian supplies the second factor $\| Q_F \|^2$. All sums and integrals in (6.1) are nonnegative; no global injectivity of $G_F$ or finite total number of preimages is required.

The root target is $G_F \( i \) = - i \/ k$ for every $F$. Since the exceptional target set can depend on $F$, the almost-everywhere target assertion in Lemma 16 must still be transferred to this root.

#thm([Lemma 6.1.])[
  (Exceptional targets at the root).  #emph[Suppose $rho > 2$, let $P$ be the weighted law of Lemma 7, and set $k = \( log_2 rho + 3 \) \/ 4$. Then 
#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E) #h(-0.16667em) [J_(F \, +) \( i \) thin upright(bold(1))_({ \( F \, - i \/ k \) in.not cal(G) })] = 0 . $ <eq:root-exception>]

]
] <lem:root-exception>

#proof[
  For $P$-almost every $F$, the complement of ${ xi : \( F \, xi \) in cal(G) }$ has planar area zero by Lemma 16. Apply (6.1) on the positive sign with
  $ h \( z \) = upright(bold(1))_(B_0) \( z \) upright(bold(1))_({ \( F \, G_F \( z \) \) in.not cal(G) }) \, #h(2em) B_0 = { x + i y : \| x \| lt.eq 1 \, med 1 lt.eq y lt.eq 2 } . $
  Its target integral is supported on that null set, so
  #[#set math.equation(numbering: n => "(6.3)")
   $ integral_(B_0) omega_F \( z \) J_(F \, +) \( z \) upright(bold(1))_({ \( F \, G_F \( z \) \) in.not cal(G) }) thin d A \( z \) = 0 $ <eq:exception-box>]
  for almost every $F$.
  Define the nonnegative Borel function
  $ Phi \( F \) = J_(F \, +) \( i \) upright(bold(1))_({ \( F \, - i \/ k \) in.not cal(G) }) . $
  The normalized Jacobian and goodness are affine-equivariant, so
  $ Phi \( T_z F \) = J_(F \, +) \( z \) upright(bold(1))_({ \( F \, G_F \( z \) \) in.not cal(G) }) . $
  The weighted covariance identity consequently gives
  $ bb(E) \[ omega_F \( z \) Phi \( T_z F \) \] = y^(beta - 1) y^(- beta) bb(E) Phi = y^(- 1) bb(E) Phi . $
  Taking expectations in (6.3) and using Tonelli yields $0 = 2 log 2 thin bb(E) Phi$, which proves the claim. ◻
]

=== 6.2 Box comparison and exhaustion <box-comparison-and-exhaustion>

For each positive integer $N$, let $D_N$ be the Borel set of pairs $\( F \, z \)$ for which $J_F \( z \) > 0$, $\( F \, G_F \( z \) \) in cal(G)$, and the assigned point $z' = R_F \( z \) = x' + i y'$ satisfies

#[#set math.equation(numbering: n => "(6.4)")
 $ 1 / N lt.eq y' / y lt.eq N \, #h(2em) \| x' - x \| lt.eq N y \, #h(2em) z = x + i y . $ <eq:transport-displacement>]

The Borel property follows from that of the pairing map. Its equivariance gives

#[#set math.equation(numbering: n => "(6.5)")
 $ upright(bold(1))_(D_N) \( F \, z \) = upright(bold(1))_(D_N) \( T_z F \, i \) . $ <eq:transport-equivariance>]

The sets $D_N$ increase with $N$. Every good-target saddle belongs to some $D_N$, since its assigned point has finite coordinates and strictly positive height.

Fix $R > 0$ and $Y > 1$, and put

$ B_(R \, Y) & = { x + i y : \| x \| lt.eq R \, med 1 lt.eq y lt.eq Y } \,\
B'_(R \, Y \, N) & = { x + i y : \| x \| lt.eq R + N Y \, med 1 \/ N lt.eq y lt.eq N Y } . $

If $z in B_(R \, Y)$ and $\( F \, z \) in D_N$, then $R_F \( z \) in B'_(R \, Y \, N)$ by (6.4). At a preimage $G_F \( z \) = xi$, the critical-point identity gives

#[#set math.equation(numbering: n => "(6.6)")
 $ y^(beta - 1) \| Q_F \( z \) \|^4 = (frac(V_xi^F \( z \), k))^4 \, #h(2em) 4 \( k - 1 \) = beta - 1 . $ <eq:transport-target-weight>]

The pairing is injective on each target fiber, and its assigned maximum has at least the saddle’s $V$-value. Applying (6.1) to both signs and comparing the target sums with (6.6) therefore proves

#[#set math.equation(numbering: n => "(6.7)")
 $ integral_(B_(R \, Y)) omega_F J_(F \, +) upright(bold(1))_(D_N) thin d A lt.eq integral_(B'_(R \, Y \, N)) omega_F J_(F \, -) thin d A . $ <eq:transport-box>]

This inequality holds for every $F$; the left side selects only fibers on which the pairing is defined. Both source integrands are jointly Borel and nonnegative in $\( F \, z \)$, so Tonelli’s theorem applies when we average this fixed-$F$ inequality.

#thm([Proposition 6.2.])[
  (Transfer bound).  #emph[The dyadic transfer operator satisfies $rho lt.eq 2$.]
] <prop:transfer-bound>

#proof[
  Continue under the contrary assumption $rho > 2$. By weighted covariance and (6.5),
  $ bb(E) \[ omega_F \( z \) J_(F \, +) \( z \) upright(bold(1))_(D_N) \( F \, z \) \] = y^(- 1) bb(E) \[ J_(F \, +) \( i \) upright(bold(1))_(D_N) \( F \, i \) \] . $
  Likewise $bb(E) \[ omega_F \( z \) J_(F \, -) \( z \) \] = y^(- 1) bb(E) J_(F \, -) \( i \)$. Thus expectation in (6.7) yields
  #[#set math.equation(numbering: n => "(6.8)")
   $ 2 R log Y thin bb(E) \[ J_(F \, +) \( i \) upright(bold(1))_(D_N) \( F \, i \) \] lt.eq  & 2 \( R + N Y \) log \( N^2 Y \) thin bb(E) J_(F \, -) \( i \) . $ <eq:transport-expected-box>]
  The root quantities are integrable: $q_F \( i \)$ is uniformly bounded on the compact normalized class, and $J_F \( i \)$ is a fixed quadratic expression in this jet.
  Hold $N$ fixed, set $R = Y^2$, and let $Y arrow.r oo$. The ratio of the right box factor to the left one is
  $ (1 + N / Y) (1 + frac(2 log N, log Y)) arrow.r 1 . $
  Dividing (6.8) by $2 R log Y$ gives
  $ bb(E) \[ J_(F \, +) \( i \) upright(bold(1))_(D_N) \( F \, i \) \] lt.eq bb(E) J_(F \, -) \( i \) . $
  Now let integer $N arrow.r oo$. Monotone convergence exhausts the good-target saddles, and Lemma 19 accounts for the remaining positive-J weight. Hence
  $ bb(E) J_(F \, +) \( i \) lt.eq bb(E) J_(F \, -) \( i \) \, #h(2em) bb(E) J_F \( i \) lt.eq 0 . $
  For the same $J_F$ and the same law $P$, Lemma 13 gives
  $ k^2 bb(E) J_F \( i \) = k \( k - 1 \) - \( 2 k - 1 \) beta / 2 + frac(beta \( beta + 1 \), 4) = k \( k - 1 \) > 0 \, $
  since $2 k - 1 = \( beta + 1 \) \/ 2$ and $k > 1$. This contradiction proves $rho lt.eq 2$. ◻
]

== 7 Integral means and the full integrability range <sec:integrability>

Proposition 20 and the disk comparison now give the inverse-square estimate. We first identify its sharp integral-means exponent, then obtain the negative area exponents by Hölder’s inequality. The positive exponents follow from a separate weighted area estimate for univalent maps.

=== 7.1 The inverse-square endpoint and negative powers <the-inverse-square-endpoint-and-negative-powers>

#proof[
  Proposition 20 gives $rho lt.eq 2$. Proposition 6 therefore implies that, for every $epsilon.alt > 0$, there is $C_epsilon.alt < oo$, independent of $f in cal(S)$, such that
  #[#set math.equation(numbering: n => "(7.1)")
   $ M_(- 2) \[ f' \] \( r \) lt.eq C_epsilon.alt \( 1 - r \)^(- 1 - epsilon.alt) \, #h(2em) 1 / 2 lt.eq r < 1 . $ <eq:final-inverse-means>]
  In particular $beta_f \( - 2 \) lt.eq 1$ for every $f in cal(S)$.
  For the reverse inequality consider the Koebe map
  $ f_(upright(K)) \( z \) = frac(z, \( 1 - z \)^2) \, #h(2em) f'_(upright(K)) \( z \) = frac(1 + z, \( 1 - z \)^3) . $
  It belongs to $cal(S)$: equality of its values at $z \, u in bb(D)$ gives $\( z - u \) \( 1 - z u \) = 0$, hence $z = u$. Write $delta = 1 - r$ and take $r$ sufficiently close to $1$. On the arc $z = r e^(i \( pi + theta \))$ with $\| theta \| lt.eq delta$,
  $ \| 1 + z \| lt.eq delta + r \| theta \| lt.eq 2 delta \, #h(2em) \| 1 - z \| gt.eq 1 . $
  Consequently
  $ M_(- 2) \[ f'_(upright(K)) \] \( r \) gt.eq frac(1, 2 pi) integral_(- delta)^delta frac(d theta, 4 delta^2) = frac(1, 4 pi delta) . $
  No exponent smaller than $1$ can bound these means near the boundary. Hence $beta_(f_(upright(K))) \( - 2 \) gt.eq 1$, and $B_(cal(S)) \( - 2 \) = 1$. ◻
]

#thm([Corollary 7.1.])[
  (The full negative linear tail).  #emph[For every real $t lt.eq - 2$ and every $epsilon.alt > 0$, there is $C_(t \, epsilon.alt) < oo$ such that 
#[#set math.equation(numbering: n => "(7.2)")
 $ M_t \[ f' \] \( r \) lt.eq C_(t \, epsilon.alt) \( 1 - r \)^(- \( \| t \| - 1 \) - epsilon.alt) #h(2em) (f in cal(S) \, med 1 / 2 lt.eq r < 1) . $ <eq:negative-linear-tail>]

 Consequently, 
$ B_(cal(S)) \( t \) = \| t \| - 1 #h(2em) \( t lt.eq - 2 \) . $

]
] <cor:negative-linear-tail>

#proof[
  Put $a = \| t \| - 2 gt.eq 0$. The distortion lower bound (2.1) and (7.1) give
  $ M_t \[ f' \] \( r \) & lt.eq (frac(\( 1 + r \)^3, 1 - r))^a M_(- 2) \[ f' \] \( r \)\
 & lt.eq 8^a C_epsilon.alt \( 1 - r \)^(- \( a + 1 \) - epsilon.alt) . $
  Since $a + 1 = \| t \| - 1$, this proves (7.2) with $C_(t \, epsilon.alt) = 8^(\| t \| - 2) C_epsilon.alt$. At $t = - 2$ it is exactly (7.1). For each fixed $f$ and $t$, letting $epsilon.alt arrow.b 0$ in the definition of $beta_f \( t \)$ gives $beta_f \( t \) lt.eq \| t \| - 1$; taking the supremum over $f$ gives the same upper bound for $B_(cal(S)) \( t \)$.
  For the Koebe map and the arc used above, $\| f'_(upright(K)) \( z \) \| lt.eq 2 delta$. Thus, for $delta = 1 - r$ sufficiently small,
  $ M_t \[ f'_(upright(K)) \] \( r \) gt.eq frac(1, 2 pi) integral_(- delta)^delta \( 2 delta \)^(- \| t \|) thin d theta = 2^(- \| t \|) / pi delta^(1 - \| t \|) . $
  Hence $beta_(f_(upright(K))) \( t \) gt.eq \| t \| - 1$, proving the equality. ◻
]

For $- 2 < t < 0$, put $q = - t \/ 2 in \( 0 \, 1 \)$. Hölder’s inequality on the probability circle gives

#[#set math.equation(numbering: n => "(7.3)")
 $ M_t \[ f' \] \( r \) = frac(1, 2 pi) integral_(- pi)^pi #scale(x: 120%, y: 120%)[\(] \| f' \( r e^(i theta) \) \|^(- 2) #scale(x: 120%, y: 120%)[\)]^q thin d theta lt.eq M_(- 2) \[ f' \] \( r \)^q . $ <eq:negative-holder>]

Choose $0 < epsilon.alt < 1 \/ q - 1$. The exponent $q \( 1 + epsilon.alt \)$ in (7.1) is then less than $1$, so

#[#set math.equation(numbering: n => "(7.4)")
 $ integral_(bb(D)) \| f' \|^t thin d A = 2 pi integral_0^1 r M_t \[ f' \] \( r \) thin d r < oo #h(2em) \( f in cal(S) \, med - 2 < t < 0 \) . $ <eq:negative-area>]

There is no singularity on a compact subdisk because $f'$ never vanishes. The case $t = 0$ gives the area $pi$.

=== 7.2 Positive powers <positive-powers>

We use the classical bounds of Lemma 3 to establish two elementary integrability statements for $f$ itself.

#thm([Lemma 7.2.])[
  (Function means and area powers).  #emph[For every $0 < p < 1 \/ 2$ there is $C_p < oo$ such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ frac(1, 2 pi) integral_(- pi)^pi \| f \( r e^(i theta) \) \|^p thin d theta lt.eq C_p #h(2em) \( f in cal(S) \, med 0 < r < 1 \) . $ <eq:function-means>]

 Moreover, for every $0 lt.eq a < 1$ and every $f in cal(S)$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ integral_(bb(D)) \( 1 + \| f \( z \) \| \)^a thin d A \( z \) < oo . $ <eq:function-area>]

]
] <lem:function-powers>

#proof[
  Away from the simple zero of $f$ at $0$,
  $ Delta \| f \|^p = p^2 \| f \|^(p - 2) \| f' \|^2 . $
  The right side is locally integrable also at $0$, where it is $O \( \| z \|^(p - 2) \)$. Green’s radial mean identity gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ frac(1, 2 pi) integral_(- pi)^pi \| f \( r e^(i theta) \) \|^p thin d theta = frac(p^2, 2 pi) integral_(\| z \| < r) \| f \( z \) \|^(p - 2) \| f' \( z \) \|^2 log frac(r, \| z \|) thin d A \( z \) . $ <eq:function-green>]
  To justify it at the zero, apply Green’s theorem on an annulus #cite(label("Lee2013")) Theorem 16.17 with inner radius $delta$. The circular mean at that radius is $O \( delta^p \)$ and its derivative is $O \( delta^(p - 1) \)$, because $f \( z \) = z + O \( z^2 \)$. The inner terms are consequently $O \( delta^p \( 1 + \| log delta \| \) \)$ and vanish as $delta arrow.b 0$.
  Bound the logarithm in (7.7) by $log \( 1 \/ \| z \| \)$. On $\| z \| lt.eq 1 \/ 2$, the classical bounds give $\| f \( z \) \| gt.eq c \| z \|$ and $\| f' \( z \) \| lt.eq C$, uniformly in $cal(S)$. Since $p - 2 < 0$, this part is bounded by a constant times
  $ integral_0^(1 \/ 2) u^(p - 1) log \( 1 \/ u \) thin d u < oo . $
  On $\| z \| > 1 \/ 2$, the growth bound $\| f \( z \) \| lt.eq \| z \| \/ \( 1 - \| z \| \)^2$ implies
  $ log frac(1, \| z \|) lt.eq C \( 1 - \| z \| \) lt.eq C min { 1 \, \| f \( z \) \|^(- 1 \/ 2) } . $
  The conformal change of variables $w = f \( z \)$ therefore bounds the remaining integral by a constant times
  $ integral_(bb(C)) \| w \|^(p - 2) min { 1 \, \| w \|^(- 1 \/ 2) } thin d A \( w \) = 2 pi (integral_0^1 u^(p - 1) thin d u + integral_1^oo u^(p - 3 \/ 2) thin d u) < oo . $
  This proves (7.5).
  For (7.6), the case $a = 0$ is immediate. For $0 < a < 1$, choose
  $ max { 0 \, a - 1 / 2 } < p < 1 / 2 . $
  If $a lt.eq p$, the power-mean inequality and (7.5) bound the means of $\| f \|^a$. If $a > p$, the growth bound gives instead
  $ frac(1, 2 pi) integral_(- pi)^pi \| f \( r e^(i theta) \) \|^a thin d theta lt.eq (max_(\| z \| = r) \| f \( z \) \|)^(a - p) C_p lt.eq C_p \( 1 - r \)^(- 2 \( a - p \)) . $
  Thus the means of $\( 1 + \| f \| \)^a$ are bounded by $C \( 1 - r \)^(- 2 \( a - p \)_(+))$, where $\( b \)_(+) = max { b \, 0 }$. Since $2 \( a - p \)_(+) < 1$, radial integration proves the claim. ◻
]

#thm([Lemma 7.3.])[
  (Positive derivative powers).  #emph[For every $f in cal(S)$ and $0 < t < 2 \/ 3$, 
$ integral_(bb(D)) \| f' \( z \) \|^t thin d A \( z \) < oo . $

]
] <lem:positive-derivative-powers>

#proof[
  Choose $0 < eta < 2 \/ t - 3$ and set
  $ a = frac(\( 2 + eta \) t, 2 - t) in \( 0 \, 1 \) \, #h(2em) u_eta \( z \) = \| f' \( z \) \|^2 \( 1 + \| f \( z \) \| \)^(- 2 - eta) . $
  Injective conformal area change gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ integral_(bb(D)) u_eta thin d A = integral_(f \( bb(D) \)) \( 1 + \| w \| \)^(- 2 - eta) thin d A \( w \) lt.eq frac(2 pi, eta \( 1 + eta \)) . $ <eq:weighted-derivative-area>]
  Here the last constant is the polar integral over $bb(C)$. The exact factorization
  $ \| f' \|^t = u_eta^(t \/ 2) #scale(x: 120%, y: 120%)[\(] \( 1 + \| f \| \)^a #scale(x: 120%, y: 120%)[\)]^(\( 2 - t \) \/ 2) $
  and Hölder’s inequality with exponents $2 \/ t$ and $2 \/ \( 2 - t \)$ now yield
  $ integral_(bb(D)) \| f' \|^t thin d A lt.eq (integral_(bb(D)) u_eta thin d A)^(t \/ 2) (integral_(bb(D)) \( 1 + \| f \| \)^a thin d A)^(\( 2 - t \) \/ 2) < oo $
  by Lemma 22. ◻
]

=== 7.3 Domains, equivalence, and endpoint sharpness <domains-equivalence-and-endpoint-sharpness>

#proof[
  Equations (7.4) and Lemma 23, together with $t = 0$, prove the disk integral for $f in cal(S)$ throughout $- 2 < t < 2 \/ 3$. For an arbitrary univalent $f : bb(D) arrow.r bb(C)$,
  $ g \( z \) = frac(f \( z \) - f \( 0 \), f' \( 0 \)) in cal(S) \, #h(2em) integral_(bb(D)) \| f' \|^t thin d A = \| f' \( 0 \) \|^t integral_(bb(D)) \| g' \|^t thin d A . $
  The multiplier is finite and positive for every real $t$.
  If $phi : W arrow.r bb(D)$ is a conformal bijection and $f = phi^(- 1)$, the identities $phi' \( f \( w \) \) = 1 \/ f' \( w \)$ and $thin d A \( f \( w \) \) = \| f' \( w \) \|^2 thin d A \( w \)$ give
  #[#set math.equation(numbering: n => "(7.9)")
   $ integral_W \| phi' \( z \) \|^s thin d A \( z \) = integral_(bb(D)) \| f' \( w \) \|^(2 - s) thin d A \( w \) . $ <eq:domain-change>]
  This change of variables is valid for nonnegative integrands, whether or not the integrals are finite. Since $4 \/ 3 < s < 4$ is equivalent to $- 2 < 2 - s < 2 \/ 3$, the desired domain integral is finite. ◻
]

For completeness, the disk and domain formulations have exactly the same scope. A univalent disk image is simply connected and cannot equal $bb(C)$, since its inverse would be a bounded entire nonconstant function. If its boundary in the sphere had at most one point, it would be a nonempty clopen subset of the connected sphere with that possible point removed. It would therefore be the whole sphere or a punctured sphere, which is incompatible with being a proper plane domain. Thus it satisfies the stated boundary-size condition, and (7.9) applies to its inverse. Conversely, each conformal bijection in the domain formulation has a univalent inverse on $bb(D)$.

For a plane domain $U$ and $1 lt.eq r lt.eq oo$, write $L_r^1 \( U \)$ for the homogeneous Sobolev space of locally integrable, weakly differentiable real-valued functions with seminorm $parallel nabla u parallel_(L^r \( U \)) < oo$, using the essential supremum when $r = oo$.

#thm([Corollary 7.4.])[
  (Homogeneous Sobolev pullback).  #emph[Let $Omega subset bb(C)$ be a simply connected domain whose boundary in the Riemann sphere has at least two points, and let $phi : Omega arrow.r bb(D)$ be a conformal bijection. For $2 < p < oo$ and $4 \/ 3 < s < 4$, put $q = p s \/ \( p + s - 2 \)$. Then pullback $phi^(*) u = u compose phi$ is bounded from $L_p^1 \( bb(D) \)$ to $L_q^1 \( Omega \)$. It is also bounded from $L_oo^1 \( bb(D) \)$ to $L_s^1 \( Omega \)$ for every $4 \/ 3 < s < 4$. The finite bounds on gradient seminorms may depend on the map and the exponents.]
] <cor:sobolev-pullback>

#proof[
  This is the known Sobolev formulation of Brennan’s conjecture due to Gol’dshtein and Ukhlov #cite(label("GoldshteinUkhlov2013")) Equivalence Theorem and its following Remark 2. Indeed, $1 < q < p$ and $\( p - 2 \) q \/ \( p - q \) = s$, so Theorem 1 supplies the derivative integrability required by their equivalence. The cited remark gives the case $p = oo$, with $q = s$. ◻
]

The area assertion also implies the individual endpoint integral-means bound. Indeed, fix $f in cal(S)$ and $0 < eta < 2$. The function $\| f' \|^(- 2 + eta)$ is subharmonic, since $f'$ is nonvanishing; hence its circular means $M_(- 2 + eta) \[ f' \] \( r \)$ are nondecreasing. If its disk area integral is finite, then, for $r gt.eq 1 \/ 2$,

$ integral_(bb(D)) \| f' \|^(- 2 + eta) thin d A gt.eq 2 pi M_(- 2 + eta) \[ f' \] \( r \) integral_r^1 u thin d u \, $

so $M_(- 2 + eta) \[ f' \] \( r \) lt.eq C_(f \, eta) \( 1 - r \)^(- 1)$. The distortion lower bound gives $\| f' \( r e^(i theta) \) \|^(- eta) lt.eq C_eta \( 1 - r \)^(- eta)$. Multiplying these bounds yields

$ M_(- 2) \[ f' \] \( r \) lt.eq C'_(f \, eta) \( 1 - r \)^(- 1 - eta) . $

Letting $eta arrow.b 0$ in the definition of the exponent gives $beta_f \( - 2 \) lt.eq 1$. In the other direction, this individual exponent bound gives an estimate with every positive exponent loss, and (7.3) gives all negative interior area exponents. The positive exponents were proved independently above. Together with the Koebe lower bound, this establishes the stated equivalence with $B_(cal(S)) \( - 2 \) = 1$. In our proof, the uniform constant in (7.1) comes directly from the transfer-operator argument.

#proof[
  Use the same Koebe map $f_(upright(K))$. For sufficiently small $\| w \|$,
  $ \| f'_(upright(K)) \( - 1 + w \) \| = frac(\| w \|, \| 2 - w \|^3) asymp \| w \| \, #h(2em) \| f'_(upright(K)) \( 1 - w \) \| = frac(\| 2 - w \|, \| w \|^3) asymp \| w \|^(- 3) . $
  The fixed sector
  $ 0 < \| w \| < 1 / 2 \, #h(2em) \| arg w \| < pi / 3 $
  lies inside $bb(D)$ under either substitution $z = - 1 + w$ or $z = 1 - w$: in both cases $\| z \|^2 = 1 - 2 Re w + \| w \|^2 < 1$. The area integral at $t = - 2$ near $- 1$ and the one at $t = 2 \/ 3$ near $1$ therefore each dominate a positive multiple of
  $ integral_0^(1 \/ 2) u^(- 2) u thin d u = oo . $
  More generally these sectors diverge for $t lt.eq - 2$ and $t gt.eq 2 \/ 3$, respectively. The image of $f_(upright(K))$ meets the domain hypotheses just verified, so its inverse, by (7.9), also gives divergence at $s = 4$ and $s = 4 \/ 3$. Thus both open endpoints are sharp. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
