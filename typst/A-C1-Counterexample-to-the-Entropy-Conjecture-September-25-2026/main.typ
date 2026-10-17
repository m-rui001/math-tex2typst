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

#align(center)[#text(size: 16pt, weight: "bold")[A $C^1$ Counterexample to the Entropy Conjecture]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $M$ be a nonempty compact smooth manifold and let $f : M arrow.r M$ be continuous. For a compatible metric $d$, write

$ d_n \( x \, y \) = max_(0 lt.eq j < n) d \( f^j \( x \) \, f^j \( y \) \) \, $

and let $s_f \( n \, epsilon \)$ be the largest cardinality of a set whose distinct points satisfy $d_n \( x \, y \) > epsilon$. The topological entropy is

$ h_(upright("top")) \( f \) = lim_(epsilon arrow.b 0) limsup_(n arrow.r oo) 1 / n log s_f \( n \, epsilon \) . $

It is independent of $d$. Throughout, homology means singular homology with real coefficients. The induced map $f_(*)$ acts on the finite-dimensional space

$ H_(*) \( M \; bb(R) \) = xor.big_(k = 0)^(dim M) H_k \( M \; bb(R) \) \, $

and $rho \( f_(*) \)$ denotes its spectral radius.

Shub’s entropy conjecture relates orbit complexity to the growth visible in homology #cite(label("Shub1974")). Shub’s later account explicitly includes endomorphisms as well as diffeomorphisms and distinguishes the earlier Lipschitz counterexamples discussed by Pugh from the $C^1$ question #cite(label("Shub2007")) Section 2. In the general $C^1$ self-map formulation recorded by Saghin and Xia #cite(label("SaghinXia2010")) Conjecture 1, it asks whether

#[#set math.equation(numbering: n => "(1)")
 $ h_(upright("top")) \( f \) gt.eq log rho \( f_(*) \) $ <eq:conjecture>]

holds for every $C^1$ map of a compact smooth manifold without boundary. Several positive results mark the scope of this question. Manning’s inequality controls the action on $H_1 \( M \; bb(R) \)$ for every continuous map #cite(label("Manning1975")) #cite(label("Manning1976")). Misiurewicz and Przytycki’s $C^1$ lower bound concerns topological degree, hence top-dimensional homology #cite(label("MisiurewiczPrzytycki1977")) #cite(label("Manning1976")). Yomdin proved (1) for $C^oo$ maps by controlling homological growth through volume growth #cite(label("Yomdin1987")). Gromov explains the regularity estimates and their $C^oo$ consequence #cite(label("Gromov1987")) Sections 2.2–2.3. Among restricted $C^1$ classes, Saghin and Xia proved the bound for partially hyperbolic diffeomorphisms with one-dimensional center #cite(label("SaghinXia2010")) Theorem 1; Liao, Viana, and Yang established it for diffeomorphisms away from homoclinic tangencies #cite(label("LiaoVianaYang2013")) Theorem A. None of these statements covers the combination of finite regularity, noninvertibility, and intermediate-degree homology used below.

#thm([Theorem 1.1.])[
  #emph[There are a positive integer $q$ and a $C^1$ self-map $f$ of the compact smooth manifold 
$ M = \( bb(R) \/ 100 bb(Z) \) times \( S^2 \)^(q + 1) $

 such that $h_(upright("top")) \( f \) = 0$ and $f_(*) : H_2 \( M \; bb(R) \) arrow.r H_2 \( M \; bb(R) \)$ has eigenvalue $2$. In particular, 
$ h_(upright("top")) \( f \) = 0 < log 2 lt.eq log rho \( f_(*) \) . $

]
] <thm:main>

Thus the general $C^1$ self-map formulation of the entropy conjecture has a negative answer. The map in Theorem 1 is noninvertible, and its detected eigenvalue lies in $H_2$ while $dim M = 2 q + 3 gt.eq 5$. Thus it does not conflict with the first-homology or top-dimensional positive results.

===== 1.1 Construction and proof strategy. <construction-and-proof-strategy.>

Write $Sigma = bb(C) union { oo }$ for the Riemann sphere. One sphere coordinate, denoted by $z$, usually evolves by $z mapsto z^2$. A circle coordinate serves as a clock. Near one clock reading, its advance may become arbitrarily slow. The remaining sphere coordinates $v_1 \, dots.h \, v_q$ store complex signals and will be called registers.

Within a complete clock passage, preparation inserts small signals for possible later readouts. A signal scheduled after $m$ steps contains an angular power of order $2^m$ and a coefficient of order $L^(- m)$, where $L > 2$ is sufficiently large. The small coefficient offsets the angular first-derivative cost of high winding; the intervening gains restore its size at readout. A separate norm estimate keeps each register in its linear region until it is read, justifying this amplification. Each readout term points along the current square or vanishes. The preparation and readout plateaus ensure that the main coordinate has modulus greater than one before the passage ends.

The infinite sum over possible waiting times is the principal construction step. Its first derivatives converge uniformly because $L$ exceeds both the angular growth rate and a uniform derivative bound for the prediction map. Each register is read at most once per passage and is reset before the next preparation interval. These features allow the gain and phase calculations to be proved in that order, without assuming that a saturated register evolves linearly. The infinite prediction series is essential to the argument: a finite truncation need not supply the compulsory contribution after an arbitrarily long delay.

Every forward orbit then approaches one of two compact invariant sets: a fixed clock reading with $z = 0$, or the circle with $z = oo$ and all registers zero. Both restrictions have zero entropy. We give a direct separated-set proof that pointwise approach to their union suffices to localize entropy, without a uniform entrance time. Finally, projection to the main sphere intertwines the homology action with that of $z mapsto z^2$ on homology. This is a homological intertwining, not a dynamical semiconjugacy.

Section 2 defines the map and proves its regularity. Section 3 establishes the orbit classification. Section 4 gives the entropy argument, including the localization lemma in an abstract form. Section 5 completes the homological calculation.

== 2 The construction <sec:construction>

We construct a map with a circular clock, a main sphere coordinate, and finitely many auxiliary sphere coordinates, called registers. The main coordinate usually squares. Early in each clock period, the map inserts small signals into the registers; later in that period, it adds the amplified signals to the main coordinate. The inserted signals predict the phase of a future square. Their coefficients decrease with the predicted delay, which makes the resulting infinite series continuously differentiable. This section specifies the map and proves its regularity; Section 3 analyzes its orbits.

Put $Sigma = bb(C) union { oo }$, with the smooth structure of the Riemann sphere, and let $t$ denote a coordinate on $bb(R) \/ 100 bb(Z)$. We also use $t$ for a real lift when specifying functions on one clock period. All occurrences of $z mapsto z^2$ on $Sigma$ include $oo mapsto oo$.

=== 2.1 The clock and its intervals <the-clock-and-its-intervals>

The clock moves by at most one at each iterate and can slow down only near $t = 50$. Choose a smooth $100$-periodic function $b : bb(R) arrow.r \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(2)")
 $ b \( t \) = 0 quad arrow.l.r.double quad t = 50 med \( mod med 100 \) \, #h(2em) b \( t \) = 1 quad upright("if ") \| t - 50 \| gt.eq 2 upright(" in ") \[ 0 \, 100 \] \,\
t + b \( t \) lt.eq 50 #h(2em) \( 0 lt.eq t lt.eq 50 \) . $ <eq:clock-barrier>]

These requirements are compatible. Indeed, let $eta : bb(R) arrow.r \[ 0 \, 1 \]$ be smooth, equal to one on $\[ - 1 \, 1 \]$, and supported in $\( - 2 \, 2 \)$. On $\[ 0 \, 100 \]$ take

$ b \( t \) = eta \( t - 50 \) frac(\( t - 50 \)^2, 4) + 1 - eta \( t - 50 \) \, $

and extend periodically. For $x = 50 - t in \[ 0 \, 1 \]$ the value is $x^2 \/ 4 lt.eq x$; for $x in \[ 1 \, 2 \]$ both $x^2 \/ 4$ and $1$ are at most $x$; and for $x gt.eq 2$ the value is $1 lt.eq x$. This proves the last condition in (2). The other conditions follow directly from the formula, which is constant near both endpoints of the period.

Choose a smooth $e : Sigma arrow.r \[ 0 \, 1 \]$ that is zero on ${ \| z \| lt.eq 1 \/ 2 }$ and one on ${ \| z \| gt.eq 3 \/ 4 } union { oo }$, and set

#[#set math.equation(numbering: n => "(3)")
 $ h \( t \, z \) = b \( t \) + \( 1 - b \( t \) \) e \( z \) . $ <eq:clock-increment>]

A radial cutoff in the affine chart, constant near zero and infinity, gives such an $e$. Thus $0 lt.eq h lt.eq 1$, $h gt.eq b$, and $h = 1$ whenever $b = 1$ or $e = 1$. In particular, the increment is exactly one throughout the preparation and readout intervals specified next.

Choose smooth functions with values in $\[ 0 \, 1 \]$ as follows:

+ $alpha : bb(R) arrow.r \[ 0 \, 1 \]$ is supported in $\( 8 \, 12 \)$ and equals one on $\[ 9 \, 11 \]$.
+ For a finite integer $q gt.eq 1$, the functions $beta_ell : bb(R) arrow.r \[ 0 \, 1 \]$, $1 lt.eq ell lt.eq q$, have supports contained in intervals $J_ell subset \( 74 \, 80 \)$ of length less than one, and satisfy
  #[#set math.equation(numbering: n => "(4)")
   $ forall t in \[ 76 \, 77 \] quad exists ell in { 1 \, dots.h \, q } quad beta_ell \( t \) = 1 . $ <eq:readout-cover>]
+ $chi : Sigma arrow.r \[ 0 \, 1 \]$ is supported away from zero and infinity and equals one on ${ 1 \/ 2 lt.eq \| z \| lt.eq 1 }$.

For the second choice, cover $\[ 76 \, 77 \]$ by finitely many smaller intervals whose closures lie in intervals $J_ell$ as above, and choose $beta_ell$ equal to one on those closures. The first and third choices are ordinary smooth cutoffs. We write

$ macron(beta)_ell \( t \) = sum_(k in bb(Z)) beta_ell \( t - 100 k \) $

for the $100$-periodization. The translated supports are disjoint, so $0 lt.eq macron(beta)_ell lt.eq 1$. The functions $beta_ell$ themselves, as opposed to $macron(beta)_ell$, will be used for the predictions within a single lifted period. Figure 1 summarizes the order of these clock intervals and the reset interval specified below.

=== 2.2 Prediction inputs and the update rule <prediction-inputs-and-the-update-rule>

To predict a later clock reading, temporarily omit the additions to the main coordinate and define the smooth map

#[#set math.equation(numbering: n => "(5)")
 $ G : bb(R) times Sigma arrow.r bb(R) times Sigma \, #h(2em) G \( t \, z \) = \( t + h \( t \, z \) \, z^2 \) \, #h(2em) T_m = "pr"_1 compose G^m quad \( m gt.eq 1 \) . $ <eq:prediction-map>]

Fix a product Riemannian metric $d t^2 + g_Sigma$ on $bb(R) times Sigma$. The map $G$ commutes with translation by $100$ in the first coordinate. Compactness of $\[ 0 \, 100 \] times Sigma$ therefore supplies a constant $B gt.eq 1$ with $parallel D G parallel lt.eq B$ everywhere. Fix

#[#set math.equation(numbering: n => "(6)")
 $ L > max { B \, 2 } . $ <eq:gain-choice>]

The two inequalities in (6) will control the derivatives of the clock prediction and of the angular power, respectively.

Each register must admit multiplication by $L$ near zero while remaining a sphere coordinate globally. Choose a smooth function $p : \[ 0 \, oo \) arrow.r \[ 0 \, 3 \]$ with

$ p \( r \) = r quad \( 0 lt.eq r lt.eq 1 \) \, #h(2em) p upright(" nondecreasing on ") \[ 0 \, 3 L \] \, #h(2em) p \( r \) = 0 quad upright("for all sufficiently large ") r . $

For existence, integrate from $0$ to $r$ a smooth $\[ 0 \, 1 \]$-valued function that equals one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$. Its integral is nondecreasing, agrees with $r$ up to $1$, and is constant with value at most $2$ beyond $2$. Multiplication by a smooth cutoff equal to one on $\[ 0 \, 3 L \]$ and zero for sufficiently large radii gives the required $p$. Define

#[#set math.equation(numbering: n => "(7)")
 $ S : Sigma arrow.r bb(C) \, #h(2em) S \( v \) = p \( \| v \| \) frac(v, \| v \|) quad \( 0 < \| v \| < oo \) \, #h(2em) S \( 0 \) = S \( oo \) = 0 . $ <eq:register-saturation>]

This map is smooth: it is the identity near zero and identically zero near infinity. Moreover, $\| S \( v \) \| lt.eq 3$ everywhere and $S \( v \) = v$ on the closed unit disk. Choose a smooth $100$-periodic function $a : bb(R) arrow.r \[ 0 \, L \]$ such that

#[#set math.equation(numbering: n => "(8)")
 $ a \( t \) = 0 quad \( t in \[ 2 \, 5 \] \) \, #h(2em) a \( t \) = L quad \( t in \[ 7 \, 90 \] \) . $ <eq:register-gain>]

For example, multiply $L$ by a smooth cutoff supported in $\( 6 \, 96 \)$ and equal to one on $\[ 7 \, 90 \]$, then extend periodically.

For $0 lt.eq t < 100$ and $1 lt.eq ell lt.eq q$, define

#[#set math.equation(numbering: n => "(9)")
 $ U_ell \( t \, z \) = frac(alpha \( t \), 10) sum_(m = 1)^oo L^(1 - m) beta_ell \( T_m \( t \, z \) \) thin chi \( z \) (frac(z, \| z \|))^(2^(m + 1)) . $ <eq:input>]

The product containing $chi$ is defined to be zero at $z = 0 \, oo$. Extend $U_ell$ itself periodically in $t$. The series and its first derivatives are proved to converge below. Notice that the factor in the series is the function $beta_ell$ on the real line, not its periodization: only predicted readings in $J_ell subset \( 74 \, 80 \)$ contribute. The index $m$ counts iterates of $G$, not displacement of the clock.

Set

$ M = \( bb(R) \/ 100 bb(Z) \) times Sigma times Sigma^q \, $

with coordinates $\( t \, z \, v_1 \, dots.h \, v_q \)$. Define $f : M arrow.r M$ by the simultaneous update

#[#set math.equation(numbering: n => "(10)")
 $ t' & = t + h \( t \, z \) med \( mod med 100 \) \,\
z' & = z^2 + 20 sum_(ell = 1)^q macron(beta)_ell \( t \) S \( v_ell \) \,\
v'_ell & = a \( t \) S \( v_ell \) + U_ell \( t \, z \) \, #h(2em) 1 lt.eq ell lt.eq q . $ <eq:map>]

We set $z' = oo$ when $z = oo$; every register output is in the affine complex chart. All right-hand sides use the old state. In particular, the values $t in \[ 2 \, 5 \]$ reset every register to zero, because both $a \( t \)$ and $U_ell \( t \, z \)$ vanish there.

Here is the timing behind (9). Write $z_i$ for the main coordinate at iteration $i$. A signal evaluated at time $i$ enters its register at time $i + 1$. If it is to be used in the main update at time $i + m$, it receives $m - 1$ intervening gains. Provided $a = L$ during those updates and the register remains in the unit disk, the initial factor $L^(1 - m)$ is exactly canceled by those gains. If the main coordinate follows squaring, its squared phase at time $i + m$ is $\( z_i \/ \| z_i \| \)^(2^(m + 1))$ when $z_i eq.not 0 \, oo$, the phase in (9). Also, $h = 1$ throughout $\[ 70 \, 82 \]$, which contains all the readout supports, independently of the main coordinate. These are conditional explanations of the formula. Agreement of the actual and predicted clocks, and the required bound keeping a register in the unit disk until its readout, are proved in Section 3 before the formula is used to analyze the main coordinate.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.082cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Reset#linebreak()$t in [2,5]$#linebreak()$v'_ ell =0$]]])])
  content((3.432, 0), [#box(width: 3.082cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Preparation#linebreak()$t in (8,12)$#linebreak()add $U_ ell (t,z)$]]])])
  content((6.864, 0), [#box(width: 3.082cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff5eb"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Possible delay#linebreak()$t in (48,52)$#linebreak()speed set by $z$]]])])
  content((10.3, 0), [#box(width: 3.082cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Readout#linebreak()$t in (74,80)$#linebreak()add aligned terms to $z^2$]]])])
  line((1.541, 0), (1.891, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.973, 0), (5.323, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((8.406, 0), (8.756, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((1.891, -1.075), (11.84, -1.075), stroke: (paint: rgb("#262626"), thickness: 0.4pt, miter-limit: 10), mark: (start: "|", end: "|"))
  content((6.864, -1.075), [#text(size: 9pt)[$a(t)=L$ throughout preparation, delay and readout]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Clock intervals during a complete passage, shown schematically and not to scale. Values refer to the clock before each update. All registers reset before preparation. Each channel is read at most once; for a channel that is read, its preparation signals give a bounded contribution at that readout. ],
) <fig:clock>

=== 2.3 Continuous differentiability <continuous-differentiability>

#thm([Proposition 2.1.])[
  #emph[For the choices above, with $q$ finite and $L > max { B \, 2 }$, the series (9) defines $C^1$ maps $U_ell : \( bb(R) \/ 100 bb(Z) \) times Sigma arrow.r bb(C)$. Consequently, (10) defines a $C^1$ self-map of the nonempty compact smooth manifold $M$.]
] <prop:regularity>

#proof[
  We first estimate the input series in the fixed product Riemannian metric, then pass to source coordinates. The chain rule and $parallel D G parallel lt.eq B$ give
  #[#set math.equation(numbering: n => "(11)")
   $ parallel D \( G^m \) parallel lt.eq B^m \, #h(2em) parallel D T_m parallel lt.eq B^m . $ <eq:prediction-derivative>]
  The second bound uses the real projection $"pr"_1$, whose derivative has norm one everywhere. In particular, it requires no choice of output chart for $G^m$.
  For an integer $k gt.eq 1$, let
  $ Phi_k \( z \) = chi \( z \) \( z \/ \| z \| \)^k quad \( z in bb(C) \\ { 0 } \) \, #h(2em) Phi_k \( 0 \) = Phi_k \( oo \) = 0 . $
  These are smooth complex-valued functions. The support of $chi$ lies in a fixed compact annulus, on which the angular map $z mapsto z \/ \| z \|$ and its first derivative are bounded. The product and chain rules therefore give a constant $C_chi$, independent of $k$, such that
  #[#set math.equation(numbering: n => "(12)")
   $ parallel Phi_k parallel_oo lt.eq 1 \, #h(2em) parallel D Phi_k parallel_oo lt.eq C_chi \( 1 + k \) . $ <eq:angular-derivative>]
  The extensions vanish on fixed neighborhoods of both poles.
  Write the $m$th summand, including its prefactor, as
  $ F_(ell \, m) \( t \, z \) = L^(1 - m) / 10 alpha \( t \) beta_ell \( T_m \( t \, z \) \) Phi_(2^(m + 1)) \( z \) . $
  Its differential is
  $ D F_(ell \, m) = L^(1 - m) / 10 #scale(x: 120%, y: 120%)[\(] & alpha' \( t \) beta_ell \( T_m \) Phi_(2^(m + 1)) thin d t\
 & + alpha \( t \) beta'_ell \( T_m \) Phi_(2^(m + 1)) thin D T_m\
 & + alpha \( t \) beta_ell \( T_m \) D Phi_(2^(m + 1)) #scale(x: 120%, y: 120%)[\)] . $
  Since there are finitely many $beta_ell$, their first derivatives have a common bound. Equations (11) and (12) yield a constant $C$, independent of $ell$ and $m$, with
  #[#set math.equation(numbering: n => "(13)")
   $ parallel F_(ell \, m) parallel_oo + parallel D F_(ell \, m) parallel_oo lt.eq C L^(1 - m) #scale(x: 120%, y: 120%)[\(] 1 + B^m + 2^(m + 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:input-derivative-bound>]
  The prediction and angular derivatives occur in separate product-rule terms; their bounds are added. Each of the three resulting geometric series converges by (6).
  For completeness, cover $\[ 0 \, 100 \] times Sigma$ by finitely many relatively compact source coordinate neighborhoods $V_j$ whose closures lie in larger coordinate charts $W_j subset bb(R) times Sigma$. If $kappa_j$ is the chart on $W_j$, the norm of $D kappa_j^(- 1)$ on $kappa_j \( overline(V_j) \)$ is bounded by a constant $C_j$ independent of $m$. Thus the coordinate derivatives of $F_(ell \, m) compose kappa_j^(- 1)$ satisfy (13) with the additional fixed factor $C_j$. The series of functions and of all their first coordinate derivatives consequently converge uniformly on every such neighborhood. The usual differentiation theorem for series now applies: on a smaller coordinate ball, integrate the first derivatives of the partial sums along line segments and pass to the uniform limit. This identifies the derivative of the limit with the continuous limit of the derivatives. Hence each $U_ell$ is $C^1$ on the fundamental strip.
  This proof also covers data with arbitrarily late predicted visits. At a datum for which $beta_ell \( T_m \) = 0$ for every $m$, each summand and its first derivative vanish: a differentiable nonnegative function has derivative zero at any zero. Uniform convergence of the derivative tails ensures continuity even when nearby nonzero summands have indices tending to infinity. No regularity of a selected hitting time is needed.
  Because $alpha$ vanishes near $0$ and $100$, the input and all its first derivatives vanish on neighborhoods of the periodic seams. The periodic extension is therefore $C^1$. Because $chi$ vanishes near zero and infinity, the same holds in fixed neighborhoods of the two poles, so the angular expression introduces no coordinate singularity. We also have the uniform bound
  #[#set math.equation(numbering: n => "(14)")
   $ \| U_ell \( t \, z \) \| lt.eq 1 / 10 sum_(m = 1)^oo L^(1 - m) = frac(L, 10 \( L - 1 \)) . $ <eq:input-size>]
  The clock component of (10) is smooth and well-defined modulo $100$. Each register component is $C^1$ and takes its values in the fixed disk of radius $3 L + L \/ \( 10 \( L - 1 \) \)$ in the affine chart. This includes all source values $v_ell = oo$, since $S$ is smooth and zero near infinity.
  It remains to check the main component at $z = oo$. Set
  $ C_0 \( t \, v_1 \, dots.h \, v_q \) = 20 sum_(ell = 1)^q macron(beta)_ell \( t \) S \( v_ell \) \, #h(2em) \| C_0 \| lt.eq 60 q . $
  This is a smooth function of all its variables. In the source inverse coordinate $w = 1 \/ z$ and the corresponding inverse coordinate for the output, the main component is
  #[#set math.equation(numbering: n => "(15)")
   $ w' = frac(w^2, 1 + C_0 w^2) . $ <eq:infinity-chart>]
  For $\| w \| < \[ 2 \( 60 q + 1 \) \]^(- 1 \/ 2)$ the denominator has modulus greater than $1 \/ 2$, uniformly in $t$ and the registers. Formula (15) therefore extends smoothly to $w = 0$, with value zero. At all finite $z$, including $z = 0$, the main component is already smooth in the affine chart. These checks establish the asserted global $C^1$ regularity of $f$. ◻
]

== 3 Attraction of every orbit <sec:orbits>

The registers in Section 2 have two tasks: they erase all previous data before each preparation interval, and they supply additions with the same phase as the main square at each subsequent readout. We now prove that these additions force every orbit whose lifted clock is unbounded to escape to infinity. A bounded clock instead forces the main coordinate to zero.

Write $upright(bold(v)) = \( v_1 \, dots.h \, v_q \)$ and define the compact sets

#[#set math.equation(numbering: n => "(16)")
 $ Z_0 & = { \( 50 med mod med 100 \, 0 \, upright(bold(v)) \) : upright(bold(v)) in Sigma^q } \,\
Z_oo & = { \( t \, oo \, 0 \, dots.h \, 0 \) : t in bb(R) \/ 100 bb(Z) } . $ <eq:attracting-sets>]

Both are forward invariant under (10). On $Z_0$ one has $h \( 50 \, 0 \) = 0$, all readout coefficients and inputs vanish, and the registers update by $v_ell mapsto L S \( v_ell \)$. On $Z_oo$ the main coordinate stays at infinity, the clock advances by one, and the zero registers remain zero.

We keep the original time indices throughout the proof. Thus, for an arbitrary orbit, write

$ f^n \( x \) = \( t_n med mod med 100 \, z_n \, v_(n \, 1) \, dots.h \, v_(n \, q) \) \, #h(2em) t_(n + 1) = t_n + h \( t_n \, z_n \) \, $

where $t_0 in bb(R)$ is any lift of the initial clock. In particular,

#[#set math.equation(numbering: n => "(17)")
 $ 0 lt.eq t_(n + 1) - t_n lt.eq 1 . $ <eq:clock-increments>]

#thm([Proposition 3.1.])[
  #emph[For the map $f : M arrow.r M$ constructed in Section 2, every $x in M$ satisfies 
$ "dist" #scale(x: 120%, y: 120%)[\(] f^n \( x \) \, Z_0 union Z_oo #scale(x: 120%, y: 120%)[\)] arrow.r 0 #h(2em) \( n arrow.r oo \) $

 in every compatible metric on $M$. More precisely, if the lifted clock of the orbit is bounded above, then the clock converges to $50$ modulo $100$ and $z_n arrow.r 0$. If that lift is unbounded above, then $z_n arrow.r oo$ in $Sigma$ and all registers are identically zero from some time onward.]
] <prop:attraction>

=== 3.1 Bounded clocks and complete passages <bounded-clocks-and-complete-passages>

#thm([Lemma 3.2.])[
  #emph[If $\( t_n \)$ is bounded above, then $t_n arrow.r 50 + 100 k$ for some integer $k$ and $z_n arrow.r 0$. No condition on the initial register values is required.]
] <lem:bounded-clock>

#proof[
  Monotonicity gives a finite limit $t_(*)$, and hence $h \( t_n \, z_n \) = t_(n + 1) - t_n arrow.r 0$. Since $0 lt.eq b \( t_n \) lt.eq h \( t_n \, z_n \)$, continuity and the zero set of $b$ imply $t_(*) = 50 + 100 k$. For all sufficiently large $n$ the clock therefore avoids every readout support, so $z_(n + 1) = z_n^2$. Moreover, $\| z_n \| gt.eq 3 \/ 4$, including $z_n = oo$, would give $e \( z_n \) = 1$ and $h \( t_n \, z_n \) = 1$. Thus eventually $z_n$ is finite with $\| z_n \| < 3 \/ 4$. Starting at such a time $N$ after all readouts have ceased,
  $ \| z_(N + r) \| = \| z_N \|^(2^r) arrow.r 0 . $
  The registers may have arbitrary behavior; all their values are included in the definition of $Z_0$. ◻
]

For the rest of the passage analysis, assume $t_n arrow.r + oo$ and $z_0$ is finite. Every $z_n$ is then finite, because the added terms in (10) are finite. Choose an integer $k$ with $100 k > t_0$ and set

$ N_k = min { n gt.eq 0 : t_n gt.eq 100 k } \, #h(2em) N_(k + 1) = min { n gt.eq 0 : t_n gt.eq 100 \( k + 1 \) } . $

These indices exist. By (17), $0 lt.eq t_(N_k) - 100 k < 1$. We call the indices $N_k lt.eq n < N_(k + 1)$ a #emph[complete passage] and, for this fixed passage, write

$ s_n = t_n - 100 k \, #h(2em) I = { n : N_k lt.eq n < N_(k + 1) \, med alpha \( s_n \) > 0 } . $

The symbol $s_n$ is a translated clock reading, not a new time index. Within the passage $0 lt.eq s_n < 100$, and the periodic coefficients of (10) can be evaluated at $s_n$. In particular, $macron(beta)_ell \( t_n \) = beta_ell \( s_n \)$ there. Every later period is also a complete passage because the lift is already assumed unbounded.

#thm([Lemma 3.3.])[
  #emph[In every complete passage as above, all registers are reset to zero before the first index in $I$. The set $I$ is nonempty, has at most five elements, and contains an index $i$ with $alpha \( s_i \) = 1$. For every $i in I$, 
#[#set math.equation(numbering: n => "(18)")
 $ \| z_i \| > 1 / 2 . $ <eq:preparation-radius>]

 There also exists an index $j$ in this passage with $s_j in \[ 76 \, 77 \]$ and $beta_ell \( s_j \) = 1$ for at least one $ell$.]
] <lem:passage-preparation>

#proof[
  Let $r$ be the first index in the passage with $s_r gt.eq 2$. The preceding reading is below $2$, so $2 lt.eq s_r < 3$. At time $r$ one has $a \( s_r \) = 0$ and $alpha \( s_r \) = 0$, whence $U_ell \( s_r \, z_r \) = 0$ and
  $ v_(r + 1 \, ell) = 0 #h(2em) \( 1 lt.eq ell lt.eq q \) . $
  This conclusion holds even if any earlier register was at infinity. Until preparation starts, the inputs remain zero, and $S \( 0 \) = 0$ keeps all registers zero.
  On $\( 8 \, 12 \)$ the clock speed is exactly one. Its readings in that interval therefore belong to a single translate of the integers, which gives $\| I \| lt.eq 5$. The first reading at least $9$ belongs to $\[ 9 \, 10 \)$ by (17); there $alpha = 1$. Similarly, the first reading at least $76$ belongs to $\[ 76 \, 77 \)$, where the plateau-covering property of the $beta_ell$ supplies a coefficient equal to one. All these crossings occur in the passage because $s_n$ eventually reaches $100$.
  Suppose now that $i in I$ and $\| z_i \| lt.eq 1 \/ 2$. As long as $s_n in \[ 8 \, 50 \]$ and $\| z_n \| lt.eq 1 \/ 2$, there is no readout, $e \( z_n \) = 0$, and
  $ z_(n + 1) = z_n^2 \, #h(2em) s_(n + 1) = s_n + b \( s_n \) lt.eq 50 . $
  The clock cannot decrease, and $\| z_(n + 1) \| lt.eq 1 \/ 4 lt.eq 1 \/ 2$. These two conditions thus persist by induction from time $i$, keeping $s_n lt.eq 50$ forever. This contradicts the assumed complete passage. This also excludes the endpoint $\| z_i \| = 1 \/ 2$ and proves (18). ◻
]

=== 3.2 Prediction and linearity up to a register’s readout <prediction-and-linearity-up-to-a-registers-readout>

Fix one complete passage. The next two lemmas identify the value of a register at its readout. The prediction uses the uncontrolled map $G$, whose main coordinate need not agree with the actual main coordinate after a readout. Only their clock coordinates must continue to agree.

#thm([Lemma 3.4.])[
  #emph[For a given $ell$, at most one index $j$ in the passage satisfies $beta_ell \( s_j \) > 0$. If such $j$ exists, then, for every $i in I$ and every integer $m gt.eq 1$, 
#[#set math.equation(numbering: n => "(19)")
 $ beta_ell #scale(x: 120%, y: 120%)[\(] T_m \( s_i \, z_i \) #scale(x: 120%, y: 120%)[\)] = cases(delim: "{", beta_ell \( s_j \) \, & m = j - i \,, 0 \, & m eq.not j - i .) $ <eq:prediction-single-hit>]

 Here $beta_ell$ is the function on $bb(R)$ used in (9), not its periodization.]
] <lem:clock-prediction>

#proof[
  Fix $i in I$, and let $r_70$ and $r_82$ be the first indices after $i$ with $s_(r_70) gt.eq 70$ and $s_(r_82) gt.eq 82$, respectively. Before $r_70$ all readout coefficients vanish. The actual pair $\( s_n \, z_n \)$ therefore follows $G$ exactly from time $i$ through time $r_70$. At the latter time $s_(r_70) in \[ 70 \, 71 \)$. Throughout $\[ 70 \, 82 \]$ one has $b = 1$, so both the actual and predicted clock increments are one, independently of their respective main coordinates. Starting with the equal clocks at time $r_70$, induction gives
  #[#set math.equation(numbering: n => "(20)")
   $ T_(n - i) \( s_i \, z_i \) = s_n #h(2em) \( i < n lt.eq r_82 \) \, $ <eq:clock-prediction-agreement>]
  including after any main-coordinate additions. The predicted clock is nondecreasing at all later times. Once it reaches $82$, it cannot return to any support of the nonperiodic $beta_ell$, all of which lie in $\( 74 \, 80 \)$.
  The support of a fixed $beta_ell$ lies in an interval of length less than one. If $beta_ell \( s_j \) > 0$, the next clock reading is $s_j + 1$, strictly beyond that support interval. Monotonicity then rules out any later positive value of this $beta_ell$; the same argument rules out two positive values in either order. Equation (20) identifies every possible predicted hit with an actual hit in this passage, and later predicted hits are impossible. This proves (19). ◻
]

#thm([Lemma 3.5.])[
  #emph[Let $j$ be an index in the fixed complete passage and let $ell$ satisfy $beta_ell \( s_j \) > 0$. Then $\| v_(j \, ell) \| lt.eq 1 \/ 2$, $S \( v_(j \, ell) \) = v_(j \, ell)$, and 
#[#set math.equation(numbering: n => "(21)")
 $ v_(j \, ell) = frac(beta_ell \( s_j \), 10) sum_(i in I) alpha \( s_i \) chi \( z_i \) (frac(z_i, \| z_i \|))^(2^(j - i + 1)) . $ <eq:register-at-readout>]

 This conclusion does not assume any alignment of the summands’ phases.]
] <lem:register-linearity>

#proof[
  Put $i_0 = min I$ and, for each $i in I$, define
  $ c_i = frac(beta_ell \( s_j \), 10) alpha \( s_i \) chi \( z_i \) (frac(z_i, \| z_i \|))^(2^(j - i + 1)) . $
  The phases are defined by (18). Lemma 6 and (9) give the exact input
  #[#set math.equation(numbering: n => "(22)")
   $ U_ell \( s_i \, z_i \) = L^(1 + i - j) c_i #h(2em) \( i in I \) . $ <eq:input-target-time>]
  The input at time $i$ first enters $v_(i + 1 \, ell)$; it receives $j - i - 1$ subsequent factors of $L$ before $v_(j \, ell)$ is read. Thus its coefficient would be $L^(1 + i - j) L^(j - i - 1) = 1$ if the register remained in the region where $S$ is the identity. We verify that region condition directly.
  For every integer $u$ with $i_0 lt.eq u lt.eq j$, define the candidate value
  $ w_u = L^(u - j) sum_(i in I\
i < u) c_i . $
  The triangle inequality and $\| I \| lt.eq 5$ give
  #[#set math.equation(numbering: n => "(23)")
   $ \| w_u \| lt.eq frac(\| I \|, 10) L^(u - j) lt.eq 1 / 2 . $ <eq:register-partial-sum-bound>]
  By Lemma 5, $v_(i_0 \, ell) = 0 = w_(i_0)$. For $i_0 lt.eq u < j$ the clock lies between the preparation and readout intervals, so $a \( s_u \) = L$. The input is zero unless $u in I$, and otherwise it is $L^(1 + u - j) c_u$ by (22). Consequently
  $ w_(u + 1) = L w_u + U_ell \( s_u \, z_u \) . $
  If $v_(u \, ell) = w_u$, the bound (23) implies $S \( v_(u \, ell) \) = w_u$, so the actual register update gives $v_(u + 1 \, ell) = w_(u + 1)$. Induction proves $v_(u \, ell) = w_u$ all the way through $u = j$. Every preparation index precedes $j$, hence $w_j = sum_(i in I) c_i$, which proves (21) and the stated bounds.
  This induction concerns only the particular register whose readout is at $j$. Another register can already have been read and can subsequently leave the unit disk. By Lemma 6, its readout coefficient is zero for the rest of this passage. Registers do not enter one another’s updates, so such later nonlinear behavior has no effect on the induction just proved. ◻
]

=== 3.3 Phase alignment and escape <phase-alignment-and-escape>

The register values have now been established without any radial or phase assumption beyond (18). Their phases can therefore be used to prove the main-coordinate growth.

#thm([Lemma 3.6.])[
  #emph[In a complete passage with finite main coordinate, let $i_0 = min I$. For every $i_0 lt.eq n < N_(k + 1)$, $z_n eq.not 0$ and 
#[#set math.equation(numbering: n => "(24)")
 $ \| z_(n + 1) \| gt.eq \| z_n \|^2 \, #h(2em) frac(z_(n + 1), \| z_(n + 1) \|) = (frac(z_n, \| z_n \|))^2 . $ <eq:square-lower-bound>]

 Moreover, some index $N$ with $i_0 lt.eq N < N_(k + 1)$ satisfies $\| z_N \| > 1$.]
] <lem:passage-escape>

#proof[
  Set $theta = z_(i_0) \/ \| z_(i_0) \|$. Before the first readout, the main coordinate squares exactly, so it stays nonzero and its phase at time $n$ is $theta^(2^(n - i_0))$. In particular this holds at every preparation index $i in I$, since all preparation precedes all readouts.
  Proceed chronologically through the readout indices. Suppose the phase at time $j$ is $theta^(2^(j - i_0))$ and $z_j eq.not 0$. For every $i in I$ the phase appearing in (21) is
  $ (frac(z_i, \| z_i \|))^(2^(j - i + 1)) = (theta^(2^(i - i_0)))^(2^(j - i + 1)) = theta^(2^(j - i_0 + 1)) \, $
  which is the phase of $z_j^2$. Lemma 7 applies separately to each $ell$ with $beta_ell \( s_j \) > 0$. The other channels have zero coefficient in the main update. Thus that update is exactly
  #[#set math.equation(numbering: n => "(25)")
   $ z_(j + 1) = (\| z_j \|^2 + 2 sum_(ell = 1)^q beta_ell \( s_j \)^2 sum_(i in I) alpha \( s_i \) chi \( z_i \)) theta^(2^(j - i_0 + 1)) . $ <eq:aligned-main-update>]
  One factor of $beta_ell \( s_j \)$ comes from the input and the other from the readout in (10); both are essential to this coefficient. Every added coefficient is nonnegative, and the baseline $\| z_j \|^2$ is strictly positive. This proves nonvanishing, phase doubling, and the square lower bound at this readout, even if all its inputs vanish. Between readouts there is exact squaring. Induction therefore proves (24) through the end of the passage, including simultaneous readouts of several channels and successive readouts of different channels.
  If some preparation value already has $\| z_i \| > 1$, take $N = i$. Otherwise $1 \/ 2 < \| z_i \| lt.eq 1$ for every $i in I$. Choose $i_(*)$ with $alpha \( s_(i_(*)) \) = 1$, supplied by Lemma 5. The prescribed cutoff satisfies $chi \( z_(i_(*)) \) = 1$, including when $\| z_(i_(*)) \| = 1$. The same lemma supplies a readout $j_(*)$ and a channel $ell_(*)$ with $s_(j_(*)) in \[ 76 \, 77 \]$ and $beta_(ell_(*)) \( s_(j_(*)) \) = 1$. In (25), the single pair $\( ell_(*) \, i_(*) \)$ therefore adds $2$ to the radius, and all other terms have the same phase. Hence
  $ \| z_(j_(*) + 1) \| gt.eq \| z_(j_(*)) \|^2 + 2 > 2 . $
  Taking $N = j_(*) + 1$ proves the claim; this index is still in the passage because $s_(j_(*) + 1) lt.eq 78 < 100$. ◻
]

#proof[
  If the lift is bounded, Lemma 4 proves the asserted coordinate limits. In a product metric the distance to $Z_0$ consequently tends to zero, irrespective of the registers.
  If $z_0 = oo$, it remains at infinity, all inputs vanish, and the clock advances by one at every step. A translate of the integer lattice meets the reset interval $\[ 2 \, 5 \]$ modulo $100$. At such a step $a = 0$, so every register becomes zero, regardless of its initial value, and stays zero. The orbit then lies in $Z_oo$.
  It remains to consider an unbounded lift with finite $z_0$. Choose any complete passage and an index $N$ with $\| z_N \| > 1$ given by Lemma 8. Its square lower bound continues through the rest of that passage. We spell out why it also holds at every later time. After the current readout region $\( 74 \, 80 \)$, all readout multipliers vanish until the next period’s region $\( 174 \, 180 \)$ in the same translated coordinate. In particular, the main variable squares exactly across the period boundary and throughout the next reset and preparation intervals. An old register, however large, cannot alter $z$ there. It is erased by the next reset before any new preparation input is entered.
  Every later period is a complete passage by the unbounded-lift assumption. Lemma 8 therefore applies afresh from its first preparation index through its end. The intervening indices, before that first preparation, have no readout and give exact squaring. These intervals cover every time after $N$, and hence
  #[#set math.equation(numbering: n => "(26)")
   $ \| z_(N + r) \| gt.eq \| z_N \|^(2^r) #h(2em) \( r gt.eq 0 \) . $ <eq:escape-growth>]
  This argument does not require $chi$ to vanish immediately after the radius exceeds one. New inputs in later periods still have nonnegative weights $alpha chi$, satisfy the register bound, and give the aligned additions in (25). Thus they preserve (26) even while $chi$ remains nonzero.
  It follows that $z_n arrow.r oo$ in $Sigma$. Since $chi$ vanishes in a neighborhood of infinity, there is a time after which $chi \( z_n \) = 0$ at every step. All inputs $U_ell \( t_n \, z_n \)$ are then zero. A later reset, which exists because the clock lift is unbounded, makes every register zero; the recurrence and $S \( 0 \) = 0$ keep them zero forever. The distance to $Z_oo$ therefore tends to zero.
  We have proved the assertion in a product metric. All compatible metrics on the compact space $M$ are uniformly equivalent, so the same convergence in distance holds for any such metric. The conclusion is pointwise in the initial state; no uniform entry time is asserted. ◻
]

== 4 Vanishing entropy <sec:entropy>

Proposition 3 gives pointwise attraction to $Z_0 union Z_oo$. We first prove that such attraction transfers zero entropy from a compact invariant set to the whole space. The argument uses a uniform bound on the proportion of orbit blocks outside a neighborhood of that set; it requires no uniform eventual-entry time.

The variational principle also yields this conclusion #cite(label("Misiurewicz1976")) Section 3: invariance and bounded convergence force every invariant probability measure to be supported on the attracting set. The direct proof below makes the exceptional-block estimate explicit.

#thm([Lemma 4.1.])[
  (Entropy localization).  #emph[Let $F : X arrow.r X$ be a continuous map of a nonempty compact metric space $\( X \, d \)$, and let $Z subset.eq X$ be a nonempty compact set with $F \( Z \) subset.eq Z$. Suppose that 
$ h_(upright("top")) \( F \|_Z \) = 0 quad upright("and") quad d \( F^n x \, Z \) arrow.r 0 quad upright("for every ") x in X . $

 Then $h_(upright("top")) \( F \) = 0$.]
] <lemma:localization>

#proof[
  Write $s_X \( n \, epsilon \)$ and $s_Z \( n \, epsilon \)$ for the separated-set cardinalities of $F$ and $F \|_Z$, respectively. Fix $epsilon > 0$ and an integer $m gt.eq 1$, and define
  $ d_m \( x \, y \) = max_(0 lt.eq j < m) d \( F^j x \, F^j y \) . $
  This metric induces the original topology of $X$. Choose a largest $\( m \, epsilon \/ 4 \)$-separated subset of $Z$, of cardinality $P = P \( m \) = s_Z \( m \, epsilon \/ 4 \)$. Its open $d_m$-balls of radius $epsilon \/ 2$, taken in $X$, have union $V$ containing $Z$: otherwise a point of $Z$ at $d_m$-distance greater than $epsilon \/ 4$ from every center could be added to the separated set. Also choose $Q = Q \( m \)$ open $d_m$-balls of radius $epsilon \/ 2$ covering $X$.
  We claim that for every $0 < tau < 1$ there is an integer $J gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(27)")
   $ \# { 0 lt.eq i < r : F^(m i) x in.not V } lt.eq tau r + J #h(2em) \( x in X \, med r gt.eq 1 \) . $ <eq:sparse-entropy-blocks>]
  Indeed, since $Z$ is compact and $V$ is an open neighborhood of $Z$, the attraction hypothesis implies that $F^(m i) x in V$ for all sufficiently large $i$, with the threshold allowed to depend on $x$. Consequently, for each $x$ there is an integer $k_x gt.eq 1$ for which
  $ \# { 0 lt.eq i < k_x : F^(m i) x in.not V } < tau k_x . $
  Let $I_x = { 0 lt.eq i < k_x : F^(m i) x in V }$. The open neighborhood
  $ O_x = ⋂_(i in I_x) \( F^(m i) \)^(- 1) \( V \) $
  of $x$ preserves all these visits: every $y in O_x$ has fewer than $tau k_x$ indices outside $V$ among its first $k_x$ samples. Choose a finite cover $O_(x_1) \, dots.h \, O_(x_a)$ of $X$, and put $J = max_(1 lt.eq b lt.eq a) k_(x_b)$.
  Starting at $x$, choose a member of this cover containing the current point and follow the corresponding number $k_(x_b)$ of iterates of $F^m$. Restart the same procedure at the next point, concatenating these segments for as long as the selected segment fits within the first $r$ samples. The final remainder has length $ell < J$. The completed segments contribute at most $tau \( r - ell \)$ samples outside $V$, and the remainder contributes at most $ell$. This proves (27), including when no segment fits. In particular, this compactness argument bounds a proportion of exceptional samples without bounding their last occurrence.
  Now encode the first $r$ blocks of length $m$ of an orbit. Record the subset of indices $i$ for which $F^(m i) x in.not V$. At every other index choose one of the $P$ balls covering $V$ that contains $F^(m i) x$; at an exceptional index choose one of the $Q$ balls covering $X$. Choose the first available ball in a fixed ordering of each cover. By (27), the number of possible descriptions is at most
  #[#set math.equation(numbering: n => "(28)")
   $ 2^r P^r Q^(tau r + J) . $ <eq:entropy-description-count>]
  Here $2^r$ bounds the number of subsets, and $P \, Q gt.eq 1$ allow the displayed overcount even if $tau r + J gt.eq r$. Two points with the same description lie in the same radius-$epsilon \/ 2$ ball at each block, so their distance is less than $epsilon$ at every time $0 \, dots.h \, m r - 1$. Thus an $\( m r \, epsilon \)$-separated set has at most the cardinality in (28).
  For arbitrary $n$, use $r = ceil.l n \/ m ceil.r$ and $s_X \( n \, epsilon \) lt.eq s_X \( m r \, epsilon \)$. Taking the orbit-length limit with $m$ and $tau$ fixed gives
  $ limsup_(n arrow.r oo) 1 / n log s_X \( n \, epsilon \) lt.eq frac(log 2 + log P \( m \) + tau log Q \( m \), m) . $
  First let $tau arrow.b 0$ with $m$ fixed. Next let $m arrow.r oo$. The hypothesis $h_(upright("top")) \( F \|_Z \) = 0$ implies
  $ limsup_(m arrow.r oo) 1 / m log P \( m \) = 0 \, $
  because every fixed-scale entropy rate is nonnegative and bounded above by the topological entropy. The right-hand side therefore tends to zero. This holds for every $epsilon > 0$, proving the lemma. ◻
]

It remains to compute the entropy on the invariant sets from Section 3. The register map has a possibly nonmonotone radial cutoff far from the origin, but its first image lies in a disk where the radius map is nondecreasing. The following lemma includes the initial step on the whole sphere.

#thm([Lemma 4.2.])[
  (Entropy of the register dynamics).  #emph[Let $Sigma = bb(C) union { oo }$ be the sphere, let $A > 0$, and write $D_A = { v in bb(C) : \| v \| lt.eq A }$. Suppose that a continuous map $T : Sigma arrow.r D_A$ satisfies 
$ T \( r e^(i theta) \) = R \( r \) e^(i theta) #h(2em) \( 0 lt.eq r lt.eq A \) \, $

 where $R : \[ 0 \, A \] arrow.r \[ 0 \, A \]$ is continuous and nondecreasing, with $R \( 0 \) = 0$. Then the coordinatewise map $T^(times q) : Sigma^q arrow.r Sigma^q$ has zero topological entropy for every integer $q gt.eq 1$.]
] <lemma:register-entropy>

#proof[
  Fix a compatible metric $d_Sigma$ on $Sigma$ and use its maximum product metric on $Sigma^q$. Fix $epsilon > 0$. Uniform continuity of the polar map
  $ \[ 0 \, A \] times bb(S)^1 arrow.r D_A \, #h(2em) \( r \, u \) mapsto r u \, $
  allows a partition of $\[ 0 \, A \]$ into $H$ sufficiently short ordered intervals and a partition of $bb(S)^1$ into $K$ sufficiently short arcs, such that two points have $d_Sigma$-distance less than $epsilon$ whenever their radii lie in the same interval and their angular coordinates lie in the same arc. Use half-open intervals and arcs, with endpoints assigned once, so that the labels are single-valued. Let $b : \[ 0 \, A \] arrow.r { 1 \, dots.h \, H }$ be the resulting nondecreasing radius label.
  For a radius $r in \[ 0 \, A \]$ and an integer $N gt.eq 1$, consider its label vector
  $ #scale(x: 120%, y: 120%)[\(] b \( r \) \, b \( R \( r \) \) \, dots.h \, b \( R^(N - 1) \( r \) \) #scale(x: 120%, y: 120%)[\)] . $
  Every coordinate of this vector is nondecreasing as a function of the initial radius $r$. Its distinct values therefore form a chain in the coordinatewise order on ${ 1 \, dots.h \, H }^N$. Along such a chain the sum of the coordinates strictly increases whenever the vector changes, and this sum lies between $N$ and $N H$. Hence there are at most
  #[#set math.equation(numbering: n => "(29)")
   $ 1 + N \( H - 1 \) $ <eq:radius-itinerary-count>]
  radius itineraries. This orders itineraries by their initial radii; no monotonicity in time is being asserted.
  Each point $v in D_A$ can be written $v = r u$ with $u in bb(S)^1$; choose $u = 1$ when $v = 0$. Its iterates have the representations $T^j v = R^j \( r \) u$ with that same $u$, including after a radius becomes zero. Thus one angular label, together with the radius itinerary, gives at most $K \[ 1 + N \( H - 1 \) \]$ descriptions of length-$N$ orbits in $D_A$. Points with the same description stay within $epsilon$ throughout those $N$ iterates.
  Finally cover the whole compact space $Sigma^q$ by $C$ sets of diameter less than $epsilon$, and assign each initial point one cover label. For $n gt.eq 2$, encode time zero by this label and encode each coordinate of its first image in $D_A^q$ for the remaining $N = n - 1$ times by the preceding construction. Points sharing a complete description stay within $epsilon$ in the maximum product metric for all $n$ times. Consequently
  #[#set math.equation(numbering: n => "(30)")
   $ s_(Sigma^q) \( n \, epsilon \) lt.eq C { K \[ 1 + \( n - 1 \) \( H - 1 \) \] #scale(x: 120%, y: 120%)[}]^q . $ <eq:register-separated-count>]
  The finite initial cover accounts for all preimages of the disk, including $oo$. The bound grows polynomially in $n$, so its exponential rate is zero at every $epsilon > 0$. ◻
]

#thm([Proposition 4.3.])[
  #emph[The map $f$ defined in (10) has $h_(upright("top")) \( f \) = 0$.]
] <prop:zero-entropy>

#proof[
  Recall the compact forward-invariant sets of Proposition 3:
  $ Z_0 & = { \( t \, z \, v_1 \, dots.h \, v_q \) : t = 50 med \( mod med 100 \) \, med z = 0 } \,\
Z_oo & = { \( t \, z \, v_1 \, dots.h \, v_q \) : z = oo \, med v_1 = dots.h.c = v_q = 0 } . $
  On $Z_0$, the clock and main coordinate are fixed and the registers evolve independently by $T \( v \) = L S \( v \)$. By the choice of $S$ in Section 2, $T \( Sigma \) subset.eq D_(3 L)$, and on that disk its radius map is
  $ R \( r \) = L p \( r \) \, #h(2em) 0 lt.eq r lt.eq 3 L . $
  This map is continuous, nondecreasing, fixes zero, and takes values in $\[ 0 \, 3 L \]$. Lemma 10 therefore gives $h_(upright("top")) \( f \|_(Z_0) \) = 0$.
  On $Z_oo$ the only evolving coordinate is the clock, which advances by $1$ modulo $100$. Thus $\( f \|_(Z_oo) \)^100$ is the identity. For $n gt.eq 100$ the orbit metric $d_n$ on this set equals $d_100$, so its separated-set cardinalities are bounded independently of $n$ at every fixed scale. In particular, $h_(upright("top")) \( f \|_(Z_oo) \) = 0$.
  For $Z = Z_0 union Z_oo$, splitting a separated set between these two invariant subsets gives
  $ s_Z \( n \, epsilon \) lt.eq s_(Z_0) \( n \, epsilon \) + s_(Z_oo) \( n \, epsilon \) . $
  Both terms have zero exponential rate, hence $h_(upright("top")) \( f \|_Z \) = 0$. Proposition 3 states that every orbit of $f$ approaches this exact set $Z$. Lemma 9 now proves $h_(upright("top")) \( f \) = 0$. ◻
]

== 5 The homological eigenvalue <sec:homology>

The main coordinate of $f$ is a bounded additive perturbation of squaring. Fading out that perturbation gives the homological information needed for Theorem 1.

#thm([Proposition 5.1.])[
  #emph[For the map $f$ in (10), the action $f_(*) : H_2 \( M \; bb(R) \) arrow.r H_2 \( M \; bb(R) \)$ has eigenvalue $2$.]
] <prop:homology>

#proof[
  Let $pi : M arrow.r Sigma$ be projection to $z$, and put $g \( z \) = z^2$, with $g \( oo \) = oo$. Define
  $ C \( t \, v \) = 20 sum_(ell = 1)^q macron(beta)_ell \( t \) S \( v_ell \) . $
  Since $\| S \| lt.eq 3$, we have $\| C \| lt.eq 60 q$. For $0 lt.eq s lt.eq 1$, set
  $ H_s \( t \, z \, v \) = z^2 + s C \( t \, v \) $
  when $z$ is finite, and $H_s \( t \, oo \, v \) = oo$. This is a continuous homotopy from $g pi$ to $pi f$. Indeed, in the inverse coordinate $w = 1 \/ z$ at infinity, the output has inverse coordinate
  $ frac(w^2, 1 + s C \( t \, v \) w^2) . $
  For all $s \, t \, v$, the denominator is nonzero on one fixed neighborhood of $w = 0$, since $\| s C \| lt.eq 60 q$. This verifies continuity jointly in every variable, including $s$.
  By homotopy invariance and functoriality of singular homology #cite(label("Hatcher2002")) Theorem 2.10,
  #[#set math.equation(numbering: n => "(31)")
   $ pi_(*) f_(*) = g_(*) pi_(*) quad upright("on ") H_2 \( M \; bb(R) \) . $ <eq:intertwining>]
  The oriented sphere has $H_2 \( Sigma \; bb(R) \) tilde.equiv bb(R)$, and the action of $g$ on this group is multiplication by its degree. The regular value $1$ has the two preimages $1$ and $- 1$. At either preimage the derivative is complex multiplication by $2 z$, with positive real determinant $\| 2 z \|^2 = 4$. Both local degrees are $+ 1$, so $deg g = 2$ #cite(label("Hatcher2002")) Proposition 2.30 and Lemma 2.49.
  The projection $pi$ has a section obtained by fixing the clock and all register coordinates. Therefore $pi_(*) : H_2 \( M \; bb(R) \) arrow.r H_2 \( Sigma \; bb(R) \)$ is surjective. Write $A = f_(*) \|_(H_2 \( M \; bb(R) \))$ and $P = pi_(*)$. Equation (31) gives $P \( A - 2 I \) = 0$, with $P eq.not 0$. If $A - 2 I$ were invertible, this equality would imply $P = 0$. Thus $2$ is an eigenvalue of $A$. ◻
]

#proof[
  Proposition 2 constructs a $C^1$ self-map of the stated compact smooth manifold. Proposition 11 gives $h_(upright("top")) \( f \) = 0$, and Proposition 12 supplies the eigenvalue $2$ on $H_2 \( M \; bb(R) \)$. This group is an invariant summand of $H_(*) \( M \; bb(R) \)$, so $rho \( f_(*) \) gt.eq 2$. Finally, $S$ vanishes on a neighborhood of infinity. Holding all other coordinates fixed and varying one register within that neighborhood leaves every output in (10) unchanged. Hence $f$ is noninvertible. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
