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

#align(center)[#text(size: 16pt, weight: "bold")[Endpoint pointwise convergence for the Schrödinger equation \
in higher dimensions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The pointwise convergence problem for the free Schrödinger equation asks for the Sobolev regularity that
  guarantees convergence to the initial data almost everywhere.
  We establish the critical Sobolev case in every spatial dimension at least three.
  The representative of the evolution is specified by Gaussian regularization;
  its exceptional spatial set is independent of time.

For $n gt.eq 3$, put

$ s_n = frac(n, 2 \( n + 1 \)) . $

We use the Fourier transform $hat(f) \( xi \) = integral_(bb(R)^n) e^(- i x dot.op xi) f \( x \) thin thin
  upright(d) x$, extended from integrable functions to $L^2$, and the inhomogeneous norm

$ lr(bar.v.double f bar.v.double)_(H^s)^2 = \( 2 pi \)^(- n) integral_(bb(R)^n) \( 1 + \| xi \|^2 \)^s \|
  hat(f) \( xi \) \|^2 thin thin upright(d) xi . $

For $a > 0$, let

#[#set math.equation(numbering: n => "(1.1)")
 $ U_a f \( x \, t \) = \( 2 pi \)^(- n) integral_(bb(R)^n) e^(i x dot.op xi - i t \| xi \|^2 - a \| xi \|^2)
   hat(f) \( xi \) thin thin upright(d) xi . $ <m:eq-Gaussian>]

The integral is absolutely convergent for $f in L^2$, by Cauchy–Schwarz. At a Lebesgue point of $f$, write

$ f^(*) \( x \) = lim_(r arrow.b 0) frac(1, \| B \( x \, r \) \|) integral_(B \( x \, r \)) f \( y \) thin thin
  upright(d) y . $

#thm([Theorem 1.1.])[
  (Endpoint convergence).  #emph[For every fixed integer $n gt.eq
    3$ and every complex-valued $f in H^(s_n) \( bb(R)^n \)$,
    there is a full-measure set $E_f$ of Lebesgue points of $f$ and a function $v \( x \, t \)$, $x in E_f$,
    $0 lt.eq t < 1$, such that $v \( x \, dot.op \)$ is continuous, $v \( x \, 0 \) = f^(*) \( x \)$, and
#[#set math.equation(numbering: n => "(1.2)")
 $ lim_(a arrow.b 0) sup_(0 < t < 1) \| U_a f \( x \, t \) - v \( x \, t \) \| =
   0 wide \( x in E_f \) . $ <m:eq-uniform-Gaussian>]

 In particular the finite Gaussian limit
$ u_f \( x \, t \) = lim_(a arrow.b 0) U_a f \( x \, t \) $

 exists for every real $0 < t < 1$ on this one set, and $lim_(t arrow.b 0) u_f \( x \, t \) = f^(*) \( x \)$.]
] <m:main>

The Gaussian limit is taken first. No Fourier support, radiality, logarithmic strengthening of $H^(s_n)$,
  or additional regularity is assumed. The theorem concerns all real times approaching zero, not a chosen sequence.

=== 1.1 History and significance <history-and-significance>

Carleson proved the one-dimensional convergence theorem for $H^(1 \/ 4) \( bb(R) \)$,
  and Dahlberg and Kenig proved failure below that regularity #cite(label("Carleson1980"))
  #cite(label("DahlbergKenig1982")). The one-dimensional threshold therefore includes its endpoint.
  Sjölin and Vega independently obtained convergence for $s > 1 \/
  2$ in higher dimensions #cite(label("Sjolin1987")) #cite(label("Vega1988")).
  At $s > 1 \/ 2$, Sjögren and Sjölin also constructed representatives continuous on whole time lines outside one
  exceptional spatial set, using spatial or spacetime averages #cite(label("SjogrenSjolin1989")) Theorem 2.
  In the plane, restriction and bilinear advances by Bourgain, Moyua–Vargas–Vega,
  Tao–Vargas and Tao #cite(label("Bourgain1995")) #cite(label("MoyuaVargasVega1996"))
  #cite(label("TaoVargas2000")) #cite(label("Tao2003")) preceded Lee’s $s > 3 \/
  8$ theorem #cite(label("Lee2006")). In dimensions $n gt.eq 3$,
  Bourgain obtained the sufficient range $s > 1 \/ 2 - 1 \/ \( 4 n \)$ #cite(label("Bourgain2013")).

Bourgain’s later counterexample gives the necessary condition $s gt.eq
  n \/ \( 2 \( n + 1 \) \)$ in dimensions $n gt.eq 2$ #cite(label("Bourgain2016")) Proposition 1.
  That obstruction does not assert failure at equality. Du,
  Guth and Li proved convergence for $s > 1 \/ 3$ in dimension two #cite(label("DuGuthLi2017")) Theorems 1.1–1.2.
  Du, Guth, Li and Zhang then proved higher-dimensional convergence for $s > \( n + 1 \) \/ \( 2 \( n + 2 \) \)$
  and multilinear refined Strichartz estimates #cite(label("DuGuthLiZhang2018")) Theorems 1.1 and 4.2.
  Du and Zhang proved convergence for $s > n \/ \( 2 \( n + 1 \) \)$ in higher dimensions
  #cite(label("DuZhang2019")) Theorem 1.1. Recent work improves higher-dimensional maximal bounds in other $L^p$
  ranges #cite(label("DuLi2024")) Theorems 1.1–1.2; a Bessel-potential extension still assumes $s >
  n \/ \( 2 \( n + 1 \) \)$ at $p = 2$ #cite(label("PanSunTan2026")) Theorems 1.3–1.4.

1 resolves the critical Sobolev case of Carleson’s pointwise convergence problem in higher dimensions.
  The distinction between equality and a strict Sobolev inequality is decisive:
  an arbitrarily small uncompensated frequency loss does not prove the endpoint theorem.
  We use the planar companion, #emph[Endpoint convergence for the planar Schrödinger equation]
  #cite(label("PSE2026")) Sections 3 and 9, specifically its #emph[Limiting information calculus] and #emph[Block
  comparison and telescoping costs] lemmas and its time-tree mechanism.
  Its planar conclusion is not invoked as a higher-dimensional result.
  The dimension-dependent frame, projection and curvature arguments needed here are established below,
  with the hypotheses of the reusable lemmas stated at their points of use.

The analytic background includes positive-curvature decoupling #cite(label("BD2015")),
  multilinear refined Strichartz estimates #cite(label("DuGuthLiZhang2018")) Theorem 4.2,
  and the refined-packet line of Guth–Iosevich–Ou–Wang and Du–Iosevich–Ou–Wang–Zhang #cite(label("GIOW2020"))
  #cite(label("DIOWZ2021")). Singh and Singh Parmar identified a support-versus-counting collar mismatch in the
  normalized printed arbitrary-packet formulation and proved a buffered correction in ambient dimension two
  #cite(label("SinghSinghParmar2026")) Theorems 1.1–1.2 and Appendix A.
  6 establishes the needed buffered activity-count estimate in every ambient dimension used below,
  following that induction structure and using decoupling; neither the printed arbitrary-packet estimate nor the
  planar correction is imported as an all-dimensional input.
  Other inputs are multilinear Kakeya and restriction #cite(label("BCT2006")) #cite(label("Guth2010"))
  #cite(label("Tao2020")), discretized projections #cite(label("He2020")),
  and fractal Schrödinger estimates #cite(label("DuZhang2019")).
  The multilinear restriction estimate is used away from its endpoint,
  and decoupling losses are removed through strict induction gains;
  an endpoint estimate without such losses is not assumed.

=== 1.2 The new estimates and the proof <the-new-estimates-and-the-proof>

There are three principal steps.

===== 1.2.1 A transverse frame estimate. <a-transverse-frame-estimate.>

In $k$ spatial dimensions, 14 counts unit cubes where $k +
  1$ transverse packet fields are simultaneously large relative to their square envelopes,
  allowing a separate witness for each field. Its constants depend polynomially on inverse transversality and on
  the fixed geometric parameters. The estimate applies to compact packet profiles and is therefore stable under
  the later geometric reductions. Its proof combines weighted packet inequalities with a finite hierarchy of
  amplitudes and occupancies. A positive smoothing argument handles gaps that are subpower in the original scale,
  while a robust projection theorem forces the limiting amplitude-ratio profiles.
  The explicit restricted-path construction keeps the probability laws compatible with cancellations and
  direction-dependent deletions.

===== 1.2.2 A geometric induction in full dimension. <a-geometric-induction-in-full-dimension.>

The fractal estimates and the full-dimensional transverse saving first yield a sparse gain.
  An induction on packet scale and sparsity then reduces a large level set to a polynomial wall.
  Codimension-two angular narrowing alone does not exclude a curved ruled wall.
  We also prove a quadratic-sublevel narrow estimate and use it to detect the second fundamental form.
  Coefficient-uniform graph estimates and paths inside the small-Hessian set convert the relevant wall pieces into
  affine plates. Flattening along these plates makes 14 applicable in dimension $n - 1$.
  Two energy budgets, one per time bin and one global with density weights,
  ensure that summing the geometric pieces loses no growing factor.

===== 1.2.3 A common time tree. <a-common-time-tree.>

The induction produces a weak $L^p$ maximal bound for some $p > 2$ on time intervals of length $1 \/
  N$ at frequency $N$, with precisely the factor $N^(s_n)$.
  Write $S \( t \) f = e^(i t Delta) f$ for the $L^2$ evolution with multiplier $e^(- i t \| xi \|^2)$.
  Using one measurable time graph for all frequencies, the time-tree argument gives frequency square summation and
  the local bound

#[#set math.equation(numbering: n => "(1.3)")
 $ integral_Omega sup_(0 lt.eq t < 1) \| S \( t \) f \( x \) \| thin thin upright(d) x lt.tilde
   lr(bar.v.double f bar.v.double)_(H^(s_n)) \, $ <m:eq-roadmap-maximal>]

initially for compact Fourier support, uniformly on translated unit balls $Omega$.
  Uniform-in-time approximation then produces a common representative.
  Applying the Gaussian approximate identity to countably many error envelopes proves (1.2) without an uncountable
  intersection of exceptional sets. This also proves 1; the details appear in 8.3.

The packet estimates lead to the frame theorem, 14; separately,
  the full-dimensional fractal and transverse estimates, including 36, lead to the sparse estimate, 48.
  These two inputs meet in 51: the wall geometry and flattening developed there make the frame theorem applicable
  with $k = n - 1$. The final section proves the time-tree and Gaussian representative assertions.
  All constants may depend on the fixed dimension. Whenever a sufficiently large finite profile order is required,
  it is chosen once for the relevant array class; no induction increases that order.

== 2 Packet estimates and a near-Cauchy bound <p:section>

We first specify the packet class and the estimates that will be used through all subsequent decompositions.
  In particular, the auxiliary square weights in the estimates below need not be the squares of the packet
  amplitudes. Keeping this distinction is necessary when some branches of a decomposition have been removed.

=== 2.1 Conventions and external estimates <conventions-and-external-estimates>

We write $chevron.l z chevron.r = \( 1 + \| z \|^2 \)^(1 \/ 2)$. Fix an integer $k gt.eq 1$, and write

#[#set math.equation(numbering: n => "(2.1)")
 $ q_k = frac(2 \( k + 2 \), k) \, wide p_k = frac(2 \( k + 1 \), k) . $ <p:exponents>]

All frequency patches lie in a fixed bounded set in $bb(R)^k$.
  The phase is $x dot.op v - t \| v \|^2$, so its normal vector is $\( 2 v \, 1 \)$.
  Frequency sets $U_1 \, dots.h \, U_(k + 1)$ are $delta$-transverse if

#[#set math.equation(numbering: n => "(2.2)")
 $ \| det \( \( 2 v_1 \, 1 \) \, dots.h \, \( 2 v_(k + 1) \, 1 \) \) \| gt.eq
   delta quad \( v_j in U_j \) . $ <p:transversality>]

Changing the sign of time changes the sign of the paraboloid and changes none of the estimates.
  A positive definite quadratic form with fixed upper and lower eigenvalue bounds is handled by a fixed linear
  change of variables. No estimate for an indefinite quadratic form is being invoked.

#prodef([Convention 2.1.])[
  (Packets and counting).  A packet of scale $N gt.eq 1$ has a frequency label $v$ in a grid of mesh $N^(- 1)$ and
    a unit lattice cell $T$ in the coordinates
  #[#set math.equation(numbering: n => "(2.3)")
   $ X_(N \, v) \( x \, t \) = (frac(x - 2 v t, N) \, t / N^2) . $ <p:native>]
  The center of its physical cell is denoted by $z_T$, and $d_T \( z \)$ is the distance from $X_(N \, v) \( z \)$
    to its native cell. Thus $\| T \| = N^(k + 2)$. Choose fixed, sufficiently large exponents $P$ and $P' > P$,
    and put $w_T \( z \) = \( 1 + d_T \( z \) \)^(- P)$. A band-limited packet of amplitude $s_T$ is
  $ f_T \( x \, t \) = e^(i \( x dot.op v - t \| v \|^2 \)) F_T \( X_(N \, v) \( x \, t \) \) \,
    wide \| F_T \( X \) \| lt.eq s_T \( 1 + "dist" \( X \, T \) \)^(- P') \, $
  where the Fourier transform of $F_T$ is supported in a fixed box.
    Alternatively, a smooth packet has a native profile supported in a fixed enlargement of its associated cell
    $T$, with a fixed sufficiently large number of derivatives bounded by $s_T$.
    The Fourier box, the profile bounds, and the exponents are uniform throughout a packet family.
  The phase-space multiplicity is bounded as follows. On each slab of length $N^2$ containing packet centers,
    there are boundedly many packets per frequency slot and per spatial intercept cell of side $N$,
    after transporting their centers to the central time of that slab.
    The bound is relative to each slab; there is no restriction on the number of slabs.
    Frequencies may move within their slots and centers may be recentered.
    Moving all native centers by a fixed lattice displacement changes this multiplicity by at most a fixed
    polynomial in the displacement; such multiplicities can also be split into bounded-multiplicity layers.
    In particular,
  #[#set math.equation(numbering: n => "(2.4)")
   $ \# { T : d_T \( z \) lt.eq a } lt.eq C N^k \( 1 + a \)^(C_k) \, wide a gt.eq 1 . $ <p:count>]
  The energy parameter of the family is
  #[#set math.equation(numbering: n => "(2.5)")
   $ E = N^(k + 2) sum_T s_T^2 . $ <p:energy>]
  It is a parameter of the decomposition, not an assertion that the packets are orthogonal in spacetime.
  A unit-cube count means a count in a fixed lattice, allowing a bounded number of translates or bounded
    enlargements. There is one witness per counted cube; the square-envelope and field witnesses are specified
    explicitly when they need not coincide. Estimates are first proved for finite families and finite sets of test
    cubes. Absolutely convergent decompositions, or truncations with arbitrarily small error on those test cubes,
    then give the stated generality. Constants may depend on the fixed profile and multiplicity bounds,
    never on the size of the configuration.
] <p:conventions>

We record the exact forms of two external geometric inputs.
  They will also be used after the packet estimates have been proved.

#thm([Proposition 2.2.])[
  (Weighted endpoint multilinear Kakeya).  #emph[Let $d gt.eq 2$.
    For $j = 1 \, dots.h \, d$, let $cal(T)_j$ be a family of infinite cylinders of radius $h$ in $bb(R)^d$,
    with unit direction vectors $e \( T \)$. Suppose
$ \| det \( e \( T_1 \) \, dots.h \, e \( T_d \) \) \| gt.eq theta.alt > 0 quad \( T_j in cal(T)_j \) . $

 For nonnegative weights $c_j \( T \)$,
#[#set math.equation(numbering: n => "(2.6)")
 $ integral_(bb(R)^d) product_(j = 1)^d (sum_(T in cal(T)_j) c_j \( T \) upright(bold(1))_T)^(1 \/ \( d - 1 \))
   lt.eq C_d theta.alt^(- 1 \/ \( d - 1 \)) h^d product_(j = 1)^d
   (sum_(T in cal(T)_j) c_j \( T \))^(1 \/ \( d - 1 \)) . $ <p:kakeya-equation>]

 For lattice cubes of side $a lt.eq h$, the same right-hand side bounds $a^d$ times the corresponding sum of cube
   suprema, after a fixed dimensional enlargement of every cylinder.]
] <p:kakeya>

#proof[
  The unweighted unit-radius assertion with arbitrary transverse directions is
    #cite(label("Guth2010"), form: "prose") Theorem 2; the near-coordinate-axis multilinear formulation originates
    in #cite(label("BCT2006"), form: "prose"). Integral weights are obtained by repeating cylinders.
    Dividing by a common denominator gives rational weights, and monotone approximation gives arbitrary
    nonnegative weights. Dilation gives $h^d$. Every side-$a$ cube meeting a cylinder lies in its enlargement of
    radius $h + C_d a lt.tilde h$. Integration over each cube, of volume $a^d$, proves the lattice version,
    also with separate suprema for the factors. For paraboloid normals in a bounded patch,
    normalization to unit vectors changes the determinant by fixed factors,
    so (2.2) gives an inverse power of $delta$. ◻
]

For a set $A$, write $cal(N)_Delta \( A \)$ for its covering number by balls of radius $Delta$.
  This notation is interchangeable with the number of occupied $Delta$-cubes up to dimensional constants.

The projection input is He’s higher-rank extension of Bourgain’s discretized projection theorem
  #cite(label("BourgainProjection2010")) #cite(label("He2020")).
  Its conclusion is simultaneous for every sufficiently large subset,
  so the successful position set may depend on the direction.

#thm([Proposition 2.3.])[
  (Robust hyperplane projection input).  #emph[Fix $d gt.eq 2$, $0 < alpha < d$, and $rho > 0$.
    There are positive constants $eta_0 \, gamma$ and $Delta_0$ with the following consequence.
    If $0 < eta lt.eq eta_0$, $0 < Delta < Delta_0$, $A$ lies in a fixed unit ball,
$ Delta^(- alpha + eta) lt.eq cal(N)_Delta \( A \) lt.eq Delta^(- alpha - eta) \, wide
  cal(N)_Delta \( A ∩ B \( x \, r \) \) lt.eq Delta^(- eta) r^rho cal(N)_Delta \( A \)
  quad \( Delta lt.eq r lt.eq 1 \) \, $

 and $nu$ is a probability law on unit kernel directions satisfying
#[#set math.equation(numbering: n => "(2.7)")
 $ nu { v : \| v dot.op w \| < r } lt.eq Delta^(- eta) r^rho
   quad \( \| w \| = 1 \, med Delta lt.eq r lt.eq 1 \) \, $ <p:projection-angular>]

 then some direction in the support of $nu$ has
#[#set math.equation(numbering: n => "(2.8)")
 $ cal(N)_Delta \( pi_(v^perp) A' \) gt.eq Delta^(- \( d - 1 \) alpha \/ d - gamma) quad
   upright("for every ") A' subset A upright(" with ") cal(N)_Delta \( A' \) gt.eq
   Delta^eta cal(N)_Delta \( A \) . $ <p:projection-conclusion>]

 Fixed multiplicative constants and bounded affine normalizations in the hypotheses are allowed after reducing
   $eta_0 \, gamma$.]
] <p:projection>

#proof[
  This is #cite(label("He2020"), form: "prose") Theorem 1, with $m = d - 1$,
    after reducing its error parameter and, if necessary, replacing $rho$ by a smaller positive number.
    Here is the match to its Grassmannian hypothesis. The competing subspaces have dimension $d - m = 1$;
    if one is spanned by a unit vector $w$, its Schubert angle to the projection plane $v^perp$ is $\| v dot.op
    w \|$. Thus (2.7) is exactly the required nonconcentration near Schubert cycles.
    The theorem excludes a direction set of small $nu$-mass and is simultaneous for all sufficiently large subsets
    of $A$. Its size and nonconcentration errors can be made larger than those displayed above,
    leaving a fixed positive projection gain $gamma$. Shrinking this gain and the error tolerance absorbs the
    fixed comparison constants. Its theorem tolerance is chosen larger than $eta$:
    our lower size bound then implies its required lower bound,
    and our subset threshold is stronger than its subset threshold. No choice of a new size exponent is necessary. ◻
]

=== 2.2 Localization with fixed original regularity <localization-with-fixed-original-regularity>

#thm([Lemma 2.4.])[
  (Reproduction, tails, and unit suprema).  #emph[For the band-limited class in 2,
    the following operations are uniform in the size of the packet family.]
  + #emph[A polynomially decaying packet is an absolutely convergent sum of packets with the same fixed enlarged
    native Fourier support and arbitrarily rapid Schwartz decay about translated native centers.
    The coefficient at a translation $j in bb(Z)^(k + 1)$ is at most $C_A s_T \( 1 + \| j \| \)^(- P')$,
    where $A$ is the requested output decay order.]
  + #emph[All fixed native derivative orders satisfy the corresponding envelope bounds.
    If $F$ has Fourier support in a fixed bounded set and $r > 0$, then, for every sufficiently large fixed $L$,
#[#set math.equation(numbering: n => "(2.9)")
 $ sup_(\| u - z \| lt.eq C) \| F \( u \) \|^r lt.eq C_(r \, L) integral \|
   F \( y \) \|^r \( 1 + \| y - z \| \)^(- L) thin upright(d) y . $ <p:sup-convolution>]

]
  #emph[Consequently integral packet estimates below also hold with unit-cube suprema,
    or with separate unit suprema for factors of a product. Output Schwartz orders may be chosen after a small
    loss parameter; the original exponent $P'$ and original smooth-profile derivative order stay fixed.]
] <p:reproduction>

#proof[
  Choose a smooth partition $sum_j psi_j = 1$ on native space,
    where $psi_j$ is supported within fixed distance of $j$. Choose a compactly supported smooth Fourier
    multiplier equal to one on the original Fourier box, and let $K$ be its Schwartz inverse Fourier transform. Then
  $ F_T = sum_j K * \( psi_j F_T \) \, wide \| partial^beta K * \( psi_j F_T \) \( X \) \| lt.eq
    C_(A \, beta) s_T \( 1 + \| j \| \)^(- P') \( 1 + \| X - j \| \)^(- A) . $
  These inequalities follow by integrating the Schwartz bounds of $K$ over the fixed support of $psi_j$;
    the decay at $j$ comes from the original pointwise bound.
    They prove absolute convergence and every asserted output derivative bound.
    Convolution without the partition also proves fixed derivative bounds for the original packet.
  For completeness, the maximal inequality is valid also for $r < 1$.
    Let $M = sup_y \| F \( y \) \| \( 1 + \| y - z \| \)^(- a)$, choosing $a$ so large that $a r > L + k + 1$,
    and choose a point $y_0$ realizing at least $M \/ 2$. Reproduction and its derivative version give $\| nabla
    F \( y \) \| lt.eq C M \( 1 + \| y - z \| \)^a$. On a fixed sufficiently small ball about $y_0$,
    this and the choice of $y_0$ imply $\| F \( y \) \| gt.eq c M \( 1 + \| y_0 - z \| \)^a$.
    Integrating on that ball proves the weighted maximal estimate with weight $\( 1 + \| y - z \| \)^(- a r)$,
    and hence (2.9) after choosing $a r$ large enough. Truncation of the weighted supremum justifies the argument
    when its finiteness has not yet been established.
  Translating a native core by $j$ multiplies its weight comparisons and phase-space multiplicity by a fixed
    polynomial in $1 + \| j \|$. For example, $w_(T + j) \( z \) lt.eq C \( 1 + \| j \| \)^P w_T \( z \)$.
    The sum over $j$ therefore converges once $P'$ exceeds those fixed powers and $k + 1$.
    Crucially, $A$ occurs in the constant $C_A$, not in that required original power $P'$.
    For packet estimates use (2.9) and the polynomial comparison of envelopes at translated points.
    For products apply it separately to each factor and use Tonelli.
    The exponent in each convolution is fixed after the product exponents have been fixed. ◻
]

=== 2.3 Weighted decoupling <weighted-decoupling>

The refined estimate needed here counts where a packet can actually be active.
  In the arbitrary-packet formulations printed in #cite(label("GIOW2020"), form: "prose") Theorem 4.2 and
  #cite(label("DIOWZ2021"), form: "prose") Theorem 4.2, the packet may occupy $2
  T$ while the count is made on $T$. The collar counterexample of
  #cite(label("SinghSinghParmar2026"), form: "prose") Theorem 1.1 rules out that literal formulation in ambient
  dimension two. Their Appendix A gives a buffered proof in that dimension.
  We give the corresponding calculation in dimension $k + 1$,
  with a strict support-to-count margin and a common longitudinal slab.
  Its only analytic input is the positive-definite $ell^2$ decoupling theorem of #cite(label("BD2015"), form: "prose").

#thm([Lemma 2.5.])[
  (Buffered refined decoupling).  #emph[Put $d = k + 1$, $R gt.eq 2$, and $2 lt.eq p lt.eq q_k$.
    For every $epsilon > 0$ there is $theta.alt_0 = theta.alt_0 \( d \, p \, epsilon \) >
    0$ such that the following holds for $0 < theta.alt lt.eq theta.alt_0$ and $Lambda = R^theta.alt$,
    with a constant allowed to depend on $\( d \, p \, epsilon \, theta.alt \)$.
    Work in a fixed $O \( R \)$ test box and one common padded time slab $S$ of length $O \( R \)$.
    Every tube core meets a fixed $O \( R \)$ enlargement of the test box;
    in particular the family has polynomial cardinality. Fine frequency labels lie in a bounded patch of a
    translated, bounded-overlap lattice of mesh $R^(- 1 \/ 2)$;
    the allowed class of such lattices is closed under parabolic rescaling.
    A fixed $O_d \( 1 \)$ number of cap grids may be separated into colors.
    A labelled tube is the intersection with $S$ of
$ { \( x \, t \) : \| x - 2 v t - u \|_oo lt.eq Lambda R^(1 \/ 2) } . $

 For $c gt.eq 1$, $c T$ dilates the transverse width only, in the same common slab.
   Tubes of a fixed label have bounded overlap before clipping by a spatial box; equivalently,
   their intercepts are globally separated at scale $Lambda R^(1 \/ 2)$ up to fixed multiplicity.
   Fix $1 lt.eq a lt.eq 10$ and $a + 1 \/ 2 lt.eq b lt.eq 20$. Suppose the nonzero $F_T$ have comparable $L^p$ norms,
$ "supp" hat(F)_T subset { \( xi \, tau \) : \| xi - v \| lt.tilde R^(- 1 \/ 2) \,
  med \| tau + \| xi \|^2 \| lt.tilde Lambda \/ R } \, wide parallel F_T parallel_(L^p \( bb(R)^d \\ a T \)) lt.eq
  R^(- B) parallel F_T parallel_p \, $

 where $B$ is a sufficiently large fixed number. Let $U$ be a union of $R^(1 \/ 2)$-cubes in the interior of the
   box and slab, each meeting at most $M gt.eq 1$ of the #emph[counted] tubes $b T$. Then
#[#set math.equation(numbering: n => "(2.10)")
 $ ∥sum_T F_T∥_(L^p \( U \)) lt.eq C_(epsilon \, theta.alt \, d \, p) R^epsilon M^(1 \/ 2 - 1 \/ p)
   (sum_T parallel F_T parallel_p^p)^(1 \/ p) . $ <p:buffered-equation>]

 The same assertion holds for finitely many fixed cap-grid colors.
   The spatial boxes and tube strips may be translated; all overlap assumptions refer to the unclipped strips.]
] <p:buffered-refined>

#proof[
  We track the dimension-dependent bookkeeping in the induction of
    #cite(label("SinghSinghParmar2026"), form: "prose") Appendix A; no refined estimate is used as an input.
    Weighted local Bourgain–Demeter decoupling says that, for any fixed large $L$, $s gt.eq 1$, $2 lt.eq p lt.eq
    q_k$, and a cube $Q_s$ of side $s$,
  #[#set math.equation(numbering: n => "(2.11)")
   $ ∥sum_J H_J∥_(L^p \( Q_s \)) lt.eq D_(delta \, L \, d \, p) s^delta
     (sum_J parallel H_J parallel_(L^p \( w_(Q_s \, L) \))^2)^(1 \/ 2) \, wide w_(Q_s \, L) \( z \) =
     (1 + frac("dist" \( z \, Q_s \), s))^(- L) \, $ <p:bd-local>]
  for $s^(- 1 \/ 2)$ tangential caps with $O \( s^(- 1) \)$ normal thickness.
    The weighted version follows by summing the usual local decoupling estimate over translates of $Q_s$ with
    rapidly decreasing coefficients. Its constant is uniform under the fixed positive-definite affine
    normalizations used below.
  Let $frak(A)_d \( R \, Lambda \, a \, b \)$ be the least constant in (2.10) without $R^epsilon$,
    uniformly for the stated configurations but with the full domain $1 lt.eq a < b lt.eq 20$.
    The theorem starts with $b - a gt.eq 1 \/ 2$; smaller positive margins occur only inside the induction.
    Define it for every $Lambda gt.eq 1$ using the trivial estimate when $Lambda gt.tilde R^(1 \/ 4)$;
    it is not defined only on the curve $Lambda = R^theta.alt$,
    since $Lambda$ stays fixed when $R$ is square-rooted. For the one-step estimate assume $R^theta.alt lt.eq
    Lambda lt.double R^(1 \/ 4)$; this lower bound persists at each scale reached from the initial $Lambda =
    R^theta.alt$. Group fine labels into coarse $R^(- 1 \/ 4)$-cubes $J$,
    with fixed finite coloring at cap boundaries. Translate the midpoint of $S$ to $t = 0$,
    adjusting tube intercepts accordingly. If $v_0$ is the center of $J$, assign each fine tube to one parent box
  $ square.stroked_(J \, u) = { \( x \, t \) in S : \| x - 2 v_0 t - u \|_oo lt.eq C_d R^(3 \/ 4) } \, wide
    u in c_d R^(3 \/ 4) bb(Z)^k . $
  The entire supporting $a T$ lies in its assigned parent box.
    This uses $\| v - v_0 \| = O_d \( R^(- 1 \/ 4) \)$, the common $O \( R \)$ time slab,
    and $Lambda R^(1 \/ 2) lt.double R^(3 \/ 4)$. The boxes have bounded global overlap for each $J$,
    and packet families assigned to distinct boxes are disjoint. On a parent box, remove the carrier and set
  $ x' = R^(- 1 \/ 4) \( x - 2 v_0 t - u \) \, wide t' = R^(- 1 \/ 2) t \, wide v' = R^(1 \/ 4) \( v - v_0 \) \,
    wide R' = R^(1 \/ 2) . $
  Then $x - 2 v t - u_T = R^(1 \/ 4) \( x' - 2 v' t' - u'_T \)$ and $\| det Phi \| = R^(- \( k + 2 \) \/ 4)$.
    A fine cap and its $Lambda \/ R$ normal thickness become a cap of width $R'
    ""^(- 1 \/ 2)$ and thickness $Lambda \/ R'$; an $a T$ or $b
    T$ becomes the corresponding dilate at radius $R'$ with the same $Lambda$.
    The transformed fine labels form an allowed translated lattice.
    The Jacobian occurs on both sides of the desired estimate and cancels.
    A lower-scale $R' ""^(1 \/ 2)$-cube pulls back to a cell $C$ of transverse width $O_d \( R^(1 \/ 2) \)$ and
    longitudinal length $O \( R^(3 \/ 4) \)$.
  Apply (2.11) with $s = R^(1 \/ 2)$ on an original $R^(1 \/ 2)$-cube $Q$.
    Choose its neighborhood radius $h = Lambda^(1 \/ 4) R^(1 \/ 2)$ and take $L gt.eq C \( B + d \) \/ theta.alt$.
    Outside that neighborhood the decoupling weight is $O \( R^(- B - d - 10) \)$.
    The relative packet tails make boxes missing the neighborhood negligible too.
    There are at most $C_d Lambda^(d \/ 4)$ neighboring $R^(1 \/ 2)$-cubes $Q''$,
    only $O_d \( 1 \)$ parent boxes of a fixed $J$ meet the neighborhood,
    and each $Q''$ meets only $O_d \( 1 \)$ rescaling cells $C$ in such a box.
    Thus, writing $F_square.stroked = sum_(T mapsto square.stroked) F_T$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ parallel F parallel_(L^p \( Q \)) lt.eq C_d D R^(delta \/ 2)
     (sum_(\( square.stroked \, Q'' \, C \)) parallel F_square.stroked parallel_(L^p \( Q'' ∩ C \))^2)^(1 \/ 2) +
     R^(- B \/ 2) cal(R) \, $ <p:expanded-decoupling>]
  where $cal(R)$ denotes the right side of the defining refined inequality without its constant.
    Finite truncation and the polynomial number of packets and cubes in the local box justify the displayed
    negligible error after increasing $B$.
  Put $b' = b - C_d Lambda^(- 3 \/ 4)$. If $b' T$ meets a cell $C$ that meets a neighbor $Q''$ of $Q$,
    compare the point of intersection with the center of $Q$ in the adapted coordinates $y = x - 2 v_0 t - u$.
    The change in $y$ is $O_d \( Lambda^(1 \/ 4) R^(1 \/ 2) \)$;
    the change in $t$ is $O_d \( R^(3 \/ 4) + Lambda^(1 \/ 4) R^(1 \/ 2) \)$.
    Since $\| v - v_0 \| = O_d \( R^(- 1 \/ 4) \)$, the transverse residual for the fine tube changes by at most
    $C_d Lambda^(1 \/ 4) R^(1 \/ 2)$. Dividing by its width $Lambda R^(1 \/ 2)$ gives $C_d Lambda^(- 3 \/ 4)$.
    All strips use the same longitudinal slab, so this implies $b T$ meets $Q$; no individual tube endpoint is crossed.
  For completeness, here is the counting step. Pigeonhole the cube norms, parent packet counts $W_square.stroked$,
    lower-scale cell counts $m_(square.stroked \, b') \( C \) asymp M'$,
    and numbers $n \( Q \) asymp n$ of retained triples. The polynomial configuration size makes the cost
    $\( log R \)^(C_d)$. By (2.12) and $\( sum_(i = 1)^n a_i^2 \)^(p \/ 2) lt.eq n^(p \/ 2 - 1) sum_i a_i^p$,
    a retained class satisfies
  #[#set math.equation(numbering: n => "(2.13)")
   $ parallel F parallel_(L^p \( U \))^p lt.tilde \( log R \)^(C_d) \( D R^(delta \/ 2) \)^p n^(p \/ 2 - 1)
     Lambda^(d \/ 4) sum_square.stroked parallel F_square.stroked
     parallel_(L^p \( U_(square.stroked \, M') \))^p + upright("negligible") . $ <p:refined-recurrence-a>]
  A fixed triple is associated with at most $C_d Lambda^(d \/ 4)$ original test cubes.
    Rescaling and applying $frak(A)_d \( R' \, Lambda \, a \, b' \)$ gives,
    since the original packet norms are comparable and the assigned families are disjoint,
  $ sum_square.stroked parallel F_square.stroked parallel_(L^p \( U_(square.stroked \, M') \))^p lt.tilde
    frak(A)_d \( R' \, Lambda \, a \, b' \)^p (M' / W)^(p \/ 2 - 1) (sum_T parallel F_T parallel_p^2)^(p \/ 2) \,
    quad W = \# { T } . $
  For a fixed $Q$, one parent box contributes at most $C_d Lambda^(d \/ 4)$ triples.
    Choose one retained triple from each of at least $c_d n Lambda^(- d \/ 4)$ distinct boxes.
    Each contributes $asymp M'$ different fine packets whose $b T$ meets $Q$ by the preceding geometric transfer.
    Disjoint assignment to boxes therefore gives $n M' lt.tilde Lambda^(d \/ 4) M$.
    Substitution into (2.13), followed by a $p$th root, proves
  #[#set math.equation(numbering: n => "(2.14)")
   $ frak(A)_d \( R \, Lambda \, a \, b \) lt.tilde D \( log R \)^(C_d) R^(delta \/ 2) Lambda^(d \/ 8)
     frak(A)_d \( R^(1 \/ 2) \, Lambda \, a \, b - C_d Lambda^(- 3 \/ 4) \) + 1 . $ <p:refined-recurrence>]
  The two neighborhood counts give $Lambda^(d \/ \( 4 p \)) Lambda^(\( d \/ 4 \) \( 1 \/ 2 - 1 \/ p \)) =
    Lambda^(d \/ 8)$; there is no dimension-dependent power of $R$.
  Stop at the first $R_j = R^(2^(- j))$ with $Lambda gt.tilde R_j^(1 \/ 4)$.
    Bounded #emph[unclipped] overlap per label and $O_d \( R_j^(k \/ 2) \)$ labels give the direct estimate
    $frak(A)_d \( R_j \, Lambda \, a \, b_j \) lt.tilde R_j^(k \/ 4) lt.tilde Lambda^k$.
    There are $j = O \( log \( 1 \/ theta.alt \) \)$ steps. For $R$ sufficiently large,
    their total count-dilation drift $C_d j Lambda^(- 3 \/ 4)$ is less than $1 \/ 4$, so the initial margin $b -
    a gt.eq 1 \/ 2$ remains positive. Iterating (2.14) yields
  $ frak(A)_d \( R \, Lambda \, a \, b \) lt.tilde_(d \, p \, delta \, theta.alt) \( log R \)^(C_d j)
    R^(C_d delta) Lambda^(k + d j \/ 8) . $
  Choose $theta.alt$ first so that $theta.alt O_d \( log \( 1 \/ theta.alt \) \) < epsilon \/ 3$,
    then $delta$ so that the decoupling factors cost less than $R^(epsilon \/ 3)$,
    and absorb the logarithms into the remaining loss. The weight order $L$ and its fixed constant are chosen
    after $theta.alt$; no original packet decay order is being chosen as a function of $epsilon$. This proves (2.10). ◻
]

#thm([Proposition 2.6.])[
  (Arbitrary auxiliary weights).  #emph[Let $2 < p lt.eq q_k$, and let $f_T$ be band-limited packets of scale $N$.
    For $b_T gt.eq 0$, require $f_T = 0$ if $b_T = 0$, and set $B_b \( z \)^2 = sum_T b_T^2 w_T \( z \)$.
    Then, for every $epsilon > 0$,
#[#set math.equation(numbering: n => "(2.15)")
 $ integral B_b \( z \)^(2 - p) lr(|sum_T f_T \( z \)|)^p thin upright(d) z lt.eq
   C_epsilon N^epsilon N^(k + 2) sum_T s_T^p b_T^(2 - p) . $ <p:weighted-equation>]

 The integrand is defined as zero where both the field and $B_b$ vanish. The estimate admits unit suprema.
   If all frequency labels lie within $C \/ N$ of a $kappa$-dimensional affine plane, $1 lt.eq kappa lt.eq k$,
   the range extends to $2 < p lt.eq q_kappa$. In the zero-dimensional case there are only boundedly many
   frequency slots and the assertion holds for every fixed finite $p > 2$.]
] <p:weighted>

#proof[
  We derive the weighted conclusion from 6, applying that lemma to relative-tail atoms,
    not to the unsplit polynomial-tail $f_T$ with a single original-tube count.
    Fix $epsilon > 0$, put $R = N^2$, and choose $theta.alt > 0$ small enough, after the fixed packet exponents,
    to pay every power of $Lambda = R^theta.alt$ below. The original profile has fixed native Fourier support.
    Choose a reciprocal sampling lattice with fixed spacing $gamma$ in the $k$ native spatial variables and
    spacing $gamma \/ Lambda$ in native time. Smooth Fourier cutoffs equal to one on the original Fourier box and
    supported inside the reciprocal fundamental domains give, by Poisson summation, fixed Schwartz kernels $K_x \,
    K_t$ and the exact expansion
  #[#set math.equation(numbering: n => "(2.16)")
   $ F_T \( X \) = sum_(j in bb(Z)^k \, thin m in bb(Z)) c_(T \, j \, m) K_x \( X_x - u_(T \, x) - gamma j \) K_t
     #scale(x: 120%, y: 120%)[\(] Lambda \( X_t - u_(T \, t) \) - gamma m #scale(x: 120%, y: 120%)[\)] \,
     $ <p:anisotropic-sampling>]
  where $u_T$ is the native cell center and, with a fixed normalization,
  $ c_(T \, j \, m) = C_gamma F_T \( u_(T \, x) + gamma j \, u_(T \, t) + gamma m \/ Lambda \) \,
    wide \| c_(T \, j \, m) \| lt.eq C s_T \( 1 + \| j \| + \| m \| \/ Lambda \)^(- P') . $
  The temporal Fourier support of an atom is $O \( Lambda \)$ in native coordinates.
    In physical coordinates the Fourier map is
  $ xi = v + eta \/ N \, quad tau = - \| v \|^2 - 2 v dot.op eta \/ N + sigma \/ N^2 \, quad
    tau + \| xi \|^2 = \( sigma + \| eta \|^2 \) \/ N^2 . $
  Thus an atom has tangential cap width $O \( R^(- 1 \/ 2) \)$ and normal thickness $O \( Lambda \/ R \)$,
    exactly the range of 6. Its $L^p$ norm is comparable to $\| c_(T \, j \, m) \| N^(\( k + 2 \) \/ p)
    Lambda^(- 1 \/ p)$, with no lower bound on $\| c_(T \, j \, m) \|$ required.
    A fixed-kernel sampling in time would not give the required relative $R^(- B)$ tail outside an $R$-long tube;
    the $Lambda^(- 1)$ native-time compression in (2.16) does.
  Fix one sample index $\( j \, m \)$ and write $g_T$ for its atom.
    Let $d_(T \, j \, m)$ be native distance to its shifted center in the #emph[original] coordinates $X_(N \, v)$
    of (2.3), and set
  $ w_(T \, j \, m) = \( 1 + d_(T \, j \, m) \)^(- P) \, wide B_(b \, j \, m)^2 = sum_T b_T^2 w_(T \, j \, m) . $
  Partition spacetime into test boxes with time cores of length $R$ and bounded spatial overlap.
    For a core centered at $t_0$, retain atoms whose sample time centers lie in $\[ t_0 - 2 R \, t_0 + 2 R \]$,
    and use the #emph[common] support slab $S = \[ t_0 - 5 R \, t_0 + 5 R \]$ for all retained atoms.
    Test cubes lie in $\[ t_0 - R \/ 2 \, t_0 + R \/ 2 \]$. Thus retained centers have at least a $3
    R$ margin to $partial S$, while omitted centers have at least a fixed $R$ separation from the test cubes.
    The retained atom has $R^(- B)$ relative time tail outside $S$;
    the omitted atoms gain $C_A Lambda^(- A)$ on the core, with a summable further factor in their time-slab
    distance. Retain spatially only trajectories that can meet a fixed padded box;
    the other atoms have an arbitrarily small Schwartz spatial tail.
    The phase-space count (2.4) sums both discarded classes: with the full shifted envelope kept in the
    denominator, three-factor Hölder as below and annular counting give an arbitrary $Lambda^(- A_1)$ or
    $N^(- A_1)$ gain in their weighted $L^p$ norms, respectively.
    This charge is made before applying the local lemma. A retained atom is concentrated,
    relative to its own norm, on the common-slab strip of transverse radius $Lambda N$,
    with $C_A Lambda^(- A)$ tail outside a fixed support dilate $a T$, say $a = 2$.
    Count a larger dilate, say $b T$ with $b = 3$. Since $A$ may be chosen after $theta.alt$,
    this is $R^(- B)$ for the $B$ of 6. Each atom belongs to only $Lambda^(O_d \( 1 \))$ padded test boxes.
  The actual $v$ may move within its $N^(- 1)$ frequency slot.
    Relabel it by the slot center and use one of a fixed number of cap-grid colors.
    Over an $O \( R \)$ slab, the two trajectories differ by $O \( N \)$,
    which is $O \( Lambda^(- 1) \)$ of the inflated transverse radius; the fixed $a = 2$, $b =
    3$ collar absorbs this displacement. For this fixed sample index,
    the shifted phase-space multiplicity is bounded by a polynomial in $J = 1 + \| j \| + \| m \| \/ Lambda$.
    Color intercepts on the #emph[unclipped] strips into at most $C Lambda^(C_d)
    J^(C_d)$ families of bounded same-label overlap. There are only $O \( 1 \)$ relevant time slabs per test cube
    for each such family. In every local box there are polynomially many packets.
    Set $a_T = \| c_(T \, j \, m) \| b_T^(2 \/ p - 1)$ for $b_T > 0$ and $a_(*) = max_T a_T$ in that box.
    Discard only the classes with $a_T < N^(- C_0) a_(*)$, where $C_0$ is chosen after the polynomial local packet
    count. This is a cutoff in the #emph[weighted] amplitude, not in $\| c_(T \, j \, m) \|$.
    Indeed, writing $h_T = \| g_T \| \/ \| c_(T \, j \, m) \|$ and taking a Schwartz majorant $h_T lt.tilde
    w_(T \, j \, m)$, three-factor Hölder gives
  $ B_(b \, j \, m)^(2 \/ p - 1) sum_(a_T < N^(- C_0) a_(*)) \| g_T \| lt.tilde
    (sum_(a_T < N^(- C_0) a_(*)) a_T^p h_T)^(1 \/ p) (sum_T h_T)^(1 \/ 2) . $
  The last sum and the number of local packets are polynomially bounded;
    $integral h_T lt.tilde N^(k + 2) \/ Lambda$. Thus this discarded contribution is $N^(- C_0 + O_d \( 1 \))
    Lambda^(O_d \( 1 \)) J^(O_d \( 1 \))$ times $\( N^(k + 2) \/ Lambda \)^(1 \/ p) \( sum_T a_T^p \)^(1 \/ p)$.
    The retained $a_T$ occupy $O \( log N \)$ dyadic classes.
    Within each $b_T asymp alpha$ class, comparability of $a_T$ also makes the atom $L^p$ norms comparable,
    so 6 applies. No comparison between the multiplicity of shifted atom tubes and the multiplicity of the
    original tubes is used.
  To see the weighted reduction quantitatively, sort $N$-cubes by $B_(b \, j \, m) asymp beta$ and atoms by $b_T
    asymp alpha$, then by retained $a_T$. The slot-center relabeling above changes only the local counted strips;
    the shifted envelope here keeps $v$ and therefore compares globally with $B_b$.
    No absolute cutoff on $alpha$ or $beta$ is needed: the cube classes are disjoint,
    and for each $T$ the moderate relative range below contains only $O \( log N \)$ $beta$-classes.
    On a cube meeting a counted $b T$, its atom center is within $O \( Lambda \)$ in native space;
    hence the atom contributes at least $c alpha^2 Lambda^(- P)$ to $B_(b \, j \, m)^2$.
    The count $M_(j \, m)$ for that class obeys
  $ M_(j \, m) lt.tilde Lambda^P beta^2 \/ alpha^2 \, wide beta^(2 - p) M_(j \, m)^(p \/ 2 - 1) lt.tilde
    Lambda^(P \( p \/ 2 - 1 \)) alpha^(2 - p) . $
  Use 6 on the moderate ratios $N^(- C) lt.eq alpha \/ beta lt.eq
    C Lambda^(P \/ 2)$ and sum their $O \( log N \)$ relative ranges. For smaller ratios the identity
  #[#set math.equation(numbering: n => "(2.17)")
   $ B_(b \, j \, m)^(2 \/ p - 1) \| c_(T \, j \, m) \| = \| c_(T \, j \, m) \|
     b_T^(2 \/ p - 1) \( b_T \/ B_(b \, j \, m) \)^(1 - 2 \/ p) $ <p:small-ratio>]
  gives $N^(- C \( 1 - 2 \/ p \))$; choose $C$ to dominate the polynomial local packet count and use pointwise
    Hölder. For the complement of the counted activity strips, retain the #emph[anisotropic] atom envelope
  $
    h_(A \, Lambda) \( z \) = \( 1 + \| X_x - u_(T \, x) - gamma j \| \)^(- A) \( 1 + Lambda \| X_t - u_(T \, t) -
    gamma m \/ Lambda \| \)^(- A) . $
  It gains $Lambda^(- A_1)$ outside the strip in either transverse or temporal direction,
    while $integral h_(A \, Lambda)^p lt.tilde N^(k + 2) \/ Lambda$.
    By (2.4), annular counting, and pointwise Hölder, the off-activity $p$th power is bounded by $C_A N^(C_p)
    J^(C_p) Lambda^(- A_1) \( N^(k + 2) \/ Lambda \) sum_T \| c_(T \, j \, m) \|^p b_T^(2 - p)$.
    Choose $A$ after $theta.alt$ to absorb the polynomial factor.
    Keeping the temporal factor in $h_(A \, Lambda)$ is essential to retain $Lambda^(- 1)$ in this bound.
    The fixed-index conclusion, including local-box and color summation, is
  #[#set math.equation(numbering: n => "(2.18)")
   $ integral B_(b \, j \, m)^(2 - p) lr(|sum_T g_T|)^p lt.eq
     C_epsilon N^(epsilon \/ 2) Lambda^(C \( d \, p \, P \)) J^(C \( d \, p \, P \)) N^(k + 2) /
     Lambda sum_T \| c_(T \, j \, m) \|^p b_T^(2 - p) . $ <p:weighted-atom>]
  Here and below the exponents $C \( d \, p \, P \)$ are fixed before $theta.alt$.
  Native-distance comparison gives $B_(b \, j \, m) lt.eq C J^(P \/ 2) B_b$.
    Since $2 - p < 0$, $B_b^(2 - p) lt.eq C J^(P \( p - 2 \) \/ 2) B_(b \, j \, m)^(2 - p)$.
    Apply Minkowski in the original weighted $L^p$ norm and use (2.18) and the sampled coefficient bound.
    The $m$-sum of $Lambda^(- 1 \/ p) \( 1 + \| m \| \/ Lambda \)^(- P' + C)$ is $O \( Lambda^(1 - 1 \/ p) \)$;
    the $j$-sum converges if the original fixed $P'$ is chosen greater than $C \( d \, p \, P \) + k + 1$. Consequently
  $ ∥B_b^(2 \/ p - 1) sum_T f_T∥_p lt.eq C_epsilon N^(epsilon \/ \( 2 p \))
    Lambda^(C \( d \, p \, P \) + 1 - 1 \/ p) N^(\( k + 2 \) \/ p) (sum_T s_T^p b_T^(2 - p))^(1 \/ p) . $
  Choose $theta.alt$ sufficiently small that the displayed $Lambda$ power,
    all preceding color and logarithmic losses, and the deliberately smaller buffered loss fit below
    $N^(epsilon \/ p)$. Taking the $p$th power proves (2.15).
    The original $P'$ is chosen once, independently of $epsilon$;
    only the output Schwartz order and weighted decoupling order depend on the chosen $theta.alt$.
    Unit suprema follow from 5 and fixed-scale envelope comparability.
  Finally rotate an affine $kappa$-plane to the first $kappa$ coordinates and remove its constant and linear
    normal terms by modulation and shear. The normal frequencies then have size $O \( N^(- 1) \)$,
    and their quadratic contribution is $O \( N^(- 2) \)$. Put $m = k -
    kappa$ and write $x = \( u \, y \)$ in tangential and normal coordinates.
    For a packet $T$, let $\( y_T \, t_T \)$ be the normal position and time of its physical center and,
    on a fixed normal slice $y$, put $j_T \( y \) = floor.l \( y - y_T \) \/ N floor.r in bb(Z)^m$ coordinatewise.
    Write $d_(T \, kappa)$ and $w_(T \, kappa) = \( 1 + d_(T \, kappa) \)^(- P)$ for the projected tangential-time
    native cell. Since the normal frequency is $O \( N^(- 1) \)$,
    its native displacement at time $t$ is $\( y - y_T \) \/ N - 2 \( N v_T^perp \) \( t - t_T \) \/ N^2$.
    Consequently, uniformly in $t$,
  $ 1 + d_T asymp 1 + d_(T \, kappa) + \| j_T \( y \) \| \, wide
    w_T gt.tilde \( 1 + \| j_T \( y \) \| \)^(- P) w_(T \, kappa) . $
  Choose fixed $A \, P''$ with $A + P'' lt.eq P'$ and $P''$ sufficiently large for the $kappa$-dimensional
    estimate. On the slice $y$, the packet has projected amplitude at most $C
    s_T \( 1 + \| j_T \( y \) \| \)^(- A)$ and decay order $P''$. Its projected native Fourier box is fixed:
    substitution in the normal native variable shifts time frequency by $O \( N v_T^perp \) = O \( 1 \)$,
    while the normal quadratic carrier shifts it by $N^2 \| v_T^perp \|^2 = O \( 1 \)$.
  Group the sliced packets by $j_T \( y \) = j$, and write $V_j$ for their sum.
    For fixed $y \, j$ and each $N^2$ time slab, this condition restricts the normal intercept to $O \( 1 \)$
    cells for every projected frequency/intercept cell; there are also only $O \( 1 \)$ normal frequency slots.
    Hence each $j$-family has bounded projected phase-space multiplicity.
    Its tangential frequency slots are split into $O \( 1 \)$ colors and snapped to a $kappa$-dimensional
    $N^(- 1)$ grid. Use the dimension-$kappa$ estimate already obtained from the preceding full-dimensional
    argument (or induct on $k$). If $B_j^2 = sum_(j_T \( y \) = j) b_T^2 w_(T \, kappa)$,
    then $B_b^2 gt.tilde \( 1 + \| j \| \)^(- P) B_j^2$. As $2 - p < 0$,
    applying the $kappa$-dimensional estimate to that family gives
  $ integral_(u \, t) B_b^(2 - p) \| V_j \|^p lt.tilde
    N^(epsilon + kappa + 2) \( 1 + \| j \| \)^(- A p + P \( p - 2 \) \/ 2) sum_(j_T \( y \) = j) s_T^p b_T^(2 - p) . $
  For each $T \, j$, the set of $y$ with $j_T \( y \) = j$ has volume $N^m$.
    Integrating in $y$ supplies exactly $N^m$, and Minkowski sums the $j in bb(Z)^m$ contributions provided $A >
    m + P \( p - 2 \) \/ \( 2 p \)$. This is possible with the fixed sufficiently large original $P'$,
    and yields (2.15) in the range $2 < p lt.eq q_kappa$. If $kappa = 0$, put $phi.alt_T = \( 1 + d_T \)^(- P')$.
    The bounded number of slots and phase-space counting give $sum_T phi.alt_T lt.eq C$. Three-factor Hölder gives
  $ #scale(x: 180%, y: 180%)[\(] sum_T s_T phi.alt_T #scale(x: 180%, y: 180%)[\)]^p lt.eq
    #scale(x: 180%, y: 180%)[\(] sum_T s_T^p b_T^(2 - p) phi.alt_T #scale(x: 180%, y: 180%)[\)]
    #scale(x: 180%, y: 180%)[\(] sum_T b_T^2 phi.alt_T #scale(x: 180%, y: 180%)[\)]^(\( p - 2 \) \/ 2)
    #scale(x: 180%, y: 180%)[\(] sum_T phi.alt_T #scale(x: 180%, y: 180%)[\)]^(p \/ 2) . $
  Since $phi.alt_T lt.eq w_T$, multiplication by $B_b^(2 - p)$ and integration, using $integral phi.alt_T lt.eq
    C N^(k + 2)$, prove the assertion for every finite $p > 2$. ◻
]

=== 2.4 Local estimates without a scale loss <local-estimates-without-a-scale-loss>

#thm([Proposition 2.7.])[
  (Local linear estimate).  #emph[Let $V = sum_T f_T$ be either a band-limited or a smooth packet field of scale
    $N$, and let $B^2 = sum_T s_T^2 w_T$. For a ball $D$ of radius $N$ and any $z_0 in D$,
#[#set math.equation(numbering: n => "(2.19)")
 $ parallel V parallel_(L^(q_k) \( D \)) lt.eq C N^(k \/ 2) B \( z_0 \) . $ <p:local-linear-equation>]

 The same bound holds for the unit-supremum norm on $D$.]
] <p:local-linear>

#thm([Proposition 2.8.])[
  (Local multilinear estimate).  #emph[Let $V_j$ and $B_j$ be as in 8,
    with frequency labels in sets satisfying (2.2). For fixed $p > p_k$, a ball $D$ of radius $N$,
    and arbitrary points $z_j in D$,
#[#set math.equation(numbering: n => "(2.20)")
 $ ∥product_(j = 1)^(k + 1) \| V_j \|^(1 \/ \( k + 1 \))∥_(L^p \( D \)) lt.eq
   C_p delta^(- C_p) N^(k \/ 2) product_(j = 1)^(k + 1) B_j \( z_j \)^(1 \/ \( k + 1 \)) .
   $ <p:local-multilinear-equation>]

 Separate unit suprema may be taken for the $k + 1$ factors. In particular the constant has no $N^epsilon$ factor.]
] <p:local-multilinear>

#proof[
  Write $E g \( x \, t \) = integral e^(i \( x dot.op xi - t \| xi \|^2 \)) g \( xi \) thin upright(d) xi$.
    We reduce the packets on $D$ to exact extensions, keeping track of the norm.
    Translate the center of $D$ to $\( x_0 \, t_0 \)$. For a frequency label $v$,
    take an integral-normalized smooth bump $g_v$ of width $c \/ N$, centered at $v$,
    and multiply it by $e^(- i \( x_0 dot.op xi - t_0 \| xi \|^2 \))$.
    On a fixed enlargement of $D$ its extension is its carrier times
  $ H_v \( x \, t \) =
    integral phi \( eta \)
    e^(i \( c \/ N \) \( x - x_0 - 2 v \( t - t_0 \) \) dot.op eta - i \( c \/ N \)^2 \( t - t_0 \) \| eta \|^2)
    thin upright(d) eta . $
  For fixed sufficiently small $c$, this differs from $1$ by less than $1 \/ 2$.
    Both $H_v$ and $H_v^(- 1)$ have bounded derivatives in the variables $\( x - x_0 \, t - t_0 \) \/ N$.
    Also $parallel g_v parallel_2 lt.eq C N^(k \/ 2)$. In the multilinear case $c$ can be shrunk by a fixed power
    of $delta$ so that enlarged supports retain determinant at least $delta \/ 2$;
    all resulting constants are polynomial in $delta^(- 1)$.
  For a packet $T$ with label $v$, divide its demodulated profile by $H_v$ on this enlarged ball,
    multiply by a fixed cutoff, and expand in a Fourier series in $\( x - x_0 \, t - t_0 \) \/ N$.
    The resulting identity on $D$ has the form
  $ f_T \( z \) = sum_(m in bb(Z)^(k + 1)) c_(T \, m) e^(i ell_m dot.op \( z - z_0 \) \/ N) E g_v \( z \) \,
    wide \| c_(T \, m) \| lt.eq C_L s_T \( 1 + d_T \( z_0 \) \)^(- P'') \( 1 + \| m \| \)^(- L) \, $
  where $P'' > P \/ 2 + k + 1$ can be fixed below the available original decay margin.
    Only finitely many derivatives are needed for a chosen $L$.
    For each mode, combine the coefficients with the same frequency slot;
    Cauchy–Schwarz in the spatial and time labels and their summable native tails gives
  $ ∥sum_T c_(T \, m) g_(v \( T \))∥_2^2 lt.eq C_L N^k \( 1 + \| m \| \)^(- 2 L) sum_T s_T^2 w_T \( z_0 \) . $
  Here one first uses bounded overlap of the bump supports in distinct frequency slots;
    within a slot the native-center lattice has a summable weight.
    This explains why the square bound has no factor equal to the number of spatial labels.
  The exact paraboloid Strichartz inequality $parallel E g parallel_(q_k) lt.eq
    C parallel g parallel_2$ follows here directly from the dispersive kernel and the $T T^(*)$ argument.
    Indeed the Gaussian oscillatory integral gives $parallel e^(i t Delta) parallel_(1 arrow.r oo) lt.eq
    C \| t \|^(- k \/ 2)$, while Plancherel gives its $L^2$ norm equal to one.
    Interpolation at spatial exponent $q_k$ gives decay $\| t \|^(- k \( 1 \/ 2 - 1 \/ q_k \)) = \|
    t \|^(- 2 \/ q_k)$. The one-dimensional Hardy–Littlewood–Sobolev inequality in time consequently bounds $T
    T^(*) : L^(q'_k) \( bb(R)^(k + 1) \) arrow.r L^(q_k) \( bb(R)^(k + 1) \)$,
    and duality gives the stated extension estimate. Applying it to each mode gives (2.19),
    after summing the modes. For the multilinear assertion use #cite(label("Tao2020"), form: "prose") Theorem 1.7.
    In ambient dimension $d = k + 1$, its product exponent $2 a$, $a > 1 \/ \( d - 1 \)$,
    becomes geometric-mean exponent $p = 2 d a > p_k$. Its quantitative constant is polynomial in a parameter
    controlling domain size, finitely many graph derivatives,
    inverse determinant and inverse interior support distance.
    On bounded paraboloid patches these quantities are bounded by a fixed power of $delta^(- 1)$:
    enlarge each relevant domain by $c delta$, and, if necessary,
    subdivide into patches of polynomially small width in $delta$.
    The Hessian is constant, all required higher derivatives are bounded,
    and the bump supports lie a polynomial distance inside the domains.
    Thus the theorem applies globally with the displayed $C_p delta^(- C_p)$ and no scale loss.
    The external modulation belonging to a fixed Fourier mode has modulus one.
    Expand the product over modes using subadditivity of the $1 \/ \( k + 1 \)$ power,
    and then Minkowski when $p gt.eq 1$. Taking $L$ larger than the dimension times $k + 1$ makes this sum converge.
  Finally apply (2.9) separately to the exact extension factors.
    A spacetime translation of $E g$ is another extension with input multiplied by a unimodular phase,
    so it has the same input norm and frequency support. Tonelli and the global estimates bound each translated
    product. The convolution exponents can be chosen to sum all mode and translation weights.
    This proves the separate-supremum assertions and permits the independent choices of $z_j$. ◻
]

=== 2.5 Hierarchies, masks, and positive weights <hierarchies-masks-and-positive-weights>

#thm([Lemma 2.9.])[
  (Sampling preserves the envelope exponent).  #emph[Let $K' gt.eq K gt.eq 1$, let a $K'$-cap lie in a $K$-cap,
    and let $T'$ be a child cell of scale $K'$. If $cal(G)_K$ is the parent grid in that cap, then, for $P > k +
    2$ sufficiently large,
#[#set math.equation(numbering: n => "(2.21)")
 $ sum_(T in cal(G)_K) w_T \( z \) w_(T') \( z_T \) lt.eq C_P w_(T') \( z \) . $ <p:convolution-equation>]

 The same exponent $P$ occurs on both sides, independently of $K' \/ K$.
   If the sum is restricted to $d_T \( z \) > L$, $L gt.eq 2$, it is at most
#[#set math.equation(numbering: n => "(2.22)")
 $ C_P (L^(- \( P - k - 1 \)) + \( K \/ K' \)^(P - k - 2)) w_(T') \( z \) . $ <p:convolution-tail>]

 When $d_(T') \( z \)$ is bounded, the second term can be omitted.]
] <p:convolution>

#proof[
  Put $r = K \/ K'$. In parent coordinates the linear map to child coordinates has spatial coefficients
    $O \( r \)$ and time coefficient $r^2$, determinant $r^(k + 2)$;
    the possible velocity shear has bounded normalized coefficients because the child frequency lies in the parent
    cap. Let $a = 1 + d_(T') \( z \)$. Parent centers whose child distance is at least $a \/
    2$ contribute at most $C a^(- P) sum_T w_T \( z \) lt.eq C a^(- P)$.
    With $d_T \( z \) > L$, this sum has the additional lattice-tail factor $L^(- \( P - k - 1 \))$.
    For the other centers, necessarily $a gt.double 1$ and $d_T \( z \) gt.eq c a \/ r$. Their contribution is at most
  $ C \( a \/ r \)^(- P) sum_(T in cal(G)_K) w_(T') \( z_T \) lt.eq C a^(- P) r^P r^(- \( k + 2 \)) . $
  The last lattice sum is bounded by its integral at the child scale plus a fixed boundary term,
    with volume ratio $r^(- \( k + 2 \))$. This proves both conclusions and shows explicitly why no envelope power
    is lost in repeated convolutions. ◻
]

#thm([Proposition 2.10.])[
  (Weighted transport through a hierarchy).  #emph[Take nested frequency grids at scales $K < K'$,
    rounded within fixed factors. Assemble all child fields in each parent cap,
    and localize them on its parent physical grid. The localizers can be chosen band-limited,
    with summable Schwartz tails and bounded sums, so that the resulting parent packets have amplitudes $a_T$ and
    satisfy
#[#set math.equation(numbering: n => "(2.23)")
 $ b_T^2 gt.eq c sum_(T' upright(" in the parent cap")) b_(T')^2 w_(T') \( z_T \) $ <p:parent-weights>]

 whenever the parent weights are chosen to dominate the displayed sum. For $2 < p lt.eq q_k$,
#[#set math.equation(numbering: n => "(2.24)")
 $ sum_T K^(k + 2) a_T^p b_T^(2 - p) lt.eq C_epsilon \( K' \/ K \)^epsilon sum_(T') \( K' \)^(k + 2) a_(T')^p
   b_(T')^(2 - p) . $ <p:hierarchy-equation>]

 It remains valid after retaining any subset of parent cells, at every step of a finite hierarchy.
   After modifying a child field, use its fresh amplitudes in the same fixed parent masks.
   On subtrees lying in a codimension-one strip at their final frequency resolution one may use $p =
   q_(k - 1)$ at every transition; for $k = 1$ any fixed finite $p > 2$ is available.
   Products of the transition estimates give the complete finite-hierarchy estimate.]
  #emph[Fixed polynomial weights on macroscopic boxes, and any fixed additional edge decay, are allowed.
    Their orders are chosen once, before the finite grid is chosen.
    Constants may depend on the finite grid; the required original profile regularity and decay order do not grow
    with its depth.]
] <p:hierarchy>

#proof[
  A concrete band-limited partition is obtained by taking $chi = \| phi.alt \|^2$,
    where $hat(phi.alt)$ is smooth with sufficiently small support.
    Poisson summation makes $sum_(j in bb(Z)^(k + 1)) chi \( X - j \)$ a positive constant after normalization;
    alternatively a bounded lattice average gives the same identity.
    These nonnegative localizers have arbitrarily rapid tails, compact Fourier support, and bounded sums.
    If $U$ is the pre-cutoff field in a parent cap, choose
  #[#set math.equation(numbering: n => "(2.25)")
   $ a_T = C sup_z \| U \( z \) \| \( 1 + d_T \( z \) \)^(- C_0) \, $ <p:parent-amplitude>]
  where $C_0$ exceeds the required output decay order by a fixed margin.
    Multiplying by the localizer makes the resulting normalized packet satisfy any prescribed fixed decay order.
    Its native Fourier support stays in a fixed enlarged box.
  In parent coordinates the child packets have scale $K' \/ K$.
    Apply 7 there, and then its unit-supremum version to (2.25).
    The child square sum varies by at most a fixed polynomial over parent distance,
    since velocity differences are $O \( K^(- 1) \)$. The sufficiently large $C_0$ absorbs this variation,
    while (2.23), whose exponent $2 - p$ is negative, gives the required upper bound for the parent weighted norm.
    Changing coordinates supplies $K^(k + 2)$ and yields (2.24). Deleting parent outputs decreases its left side.
    For modified inputs the same proof uses the same localizers and recomputes (2.25);
    it never assumes that cancellation or an old amplitude survives deletion.
    The affine part of 7 gives the larger exponent on strip subtrees:
    a strip thin enough at the final precision is thin enough at each intervening child precision.
  We explain the two uniformity assertions needed in iteration.
    The new square background formed by sampling child squares satisfies
  $ sum_T w_T \( z \) sum_(T') b_(T')^2 w_(T') \( z_T \) lt.eq C sum_(T') b_(T')^2 w_(T') \( z \) $
  by 10; the outer exponent has not decreased. Additional decay on an edge only improves this bound.
    A large displacement along a finite path forces a large displacement on an edge after normalization to the
    largest relevant cell. Keeping a fixed reserve of decay on every edge therefore bounds paths with a large
    displacement by the full-background convolution times a negative power of that displacement.
    The choice of which edge is large costs at most the number of edges, rather than a new decay order at each edge.
  For a positive macro weight $Psi$, suppose both ratios of its values at an edge’s endpoints are bounded by
    $C \( 1 + d \)^J$, where $d = d_(T') \( z_T \)$ is the child distance.
    The constants and $J$ must be independent of the main scale;
    this holds for polynomial weights on macro boxes whose size dominates the affected cells.
    Conjugate the given denominators by
  $ tilde(b)_T = b_T Psi \( z_T \)^(- 1 \/ \( p - 2 \)) \, wide Q = P + frac(2 J, p - 2) . $
  Writing $w_(T')^(\( Q \)) = \( 1 + d_(T') \)^(- Q)$, one has
  $ sum_(T') tilde(b)_(T')^2 w_(T')^(\( Q \)) \( z_T \) & lt.eq
    C Psi \( z_T \)^(- 2 \/ \( p - 2 \)) sum_(T') b_(T')^2 w_(T')^(\( P \)) \( z_T \)\
 & lt.eq C tilde(b)_T^2 . $
  Apply the one-step proof with this stronger fixed child envelope exponent and its fixed supremum-decay reserve.
    Since $tilde(b)_T^(2 - p) = b_T^(2 - p) Psi \( z_T \)$, it proves the explicit estimate
  $ sum_T Psi \( z_T \) K^(k + 2) a_T^p b_T^(2 - p) lt.eq C_epsilon \( K' \/ K \)^epsilon sum_(T')
    Psi \( z_(T') \) \( K' \)^(k + 2) a_(T')^p b_(T')^(2 - p) . $
  The original denominators have been retained. The same value of $Q$ works at each edge;
    the reserve does not accumulate with depth. For a partition of macro space with summable polynomial weights,
    summing over macros costs their bounded total overlap. This gives the version for restricted subtrees and
    frozen masks, without using discontinuous physical cutoffs.
  Finally, for separated nested scales, inverse widths added by localization form a geometric series,
    including the bounded velocity shears. Thus the fixed Fourier enlargement can be chosen once.
    A block of comparable scales is treated as one transition; finitely many extra masks change constants.
    Repeated constants can grow with the fixed grid, but not with the main scale.
    In a later slow diagonal those constants may be absorbed only after the grid is fixed.
    Arbitrarily high Schwartz output decay is supplied by 5; it imposes no increasing regularity condition on the
    original packets. ◻
]

=== 2.6 A near-Cauchy estimate <a-near-cauchy-estimate>

The following estimate has no loss depending on $N$. Its threshold is measured against the pointwise Cauchy bound
  $\| V \| lt.eq C N^(k \/ 2) B$; the allowed loss depends instead on the distance $R$ below that bound.

#thm([Theorem 2.11.])[
  (Near-Cauchy large values).  #emph[Let $V = sum_T f_T$ be a band-limited field of scale $N$, and let $B^2 =
    sum_T s_T^2 w_T$. Suppose a finite set $Y$ of unit cubes has witnesses $z_Q in Q$ such that
$ B \( z_Q \) lt.eq 1 \, wide \| V \( z_Q \) \| gt.eq N^(k \/ 2) \/ R \, wide R gt.eq 1 . $

 Then, for every $epsilon > 0$,
#[#set math.equation(numbering: n => "(2.26)")
 $ \| Y \| lt.eq C_epsilon R^(q_k + epsilon) sum_T s_T^2 . $ <p:near-cauchy-equation>]

 The conclusion holds with unit suprema and fixed enlargements of the witness cubes.
   The Fourier enlargement and original decay orders can be fixed before $epsilon$ is chosen.]
] <p:near-cauchy>

We first provide a finite exponent from which the improvement can start.
  This also makes the exponent-infimum argument below noncircular.

#thm([Lemma 2.12.])[
  (A polynomial starting bound).  #emph[Under the hypotheses of 12, there is a fixed finite $M_k$ such that
#[#set math.equation(numbering: n => "(2.27)")
 $ \| Y \| lt.eq C \( 2 + R \)^(M_k) sum_T s_T^2 . $ <p:polynomial-start-equation>]

]
] <p:polynomial-start>

#proof[
  Write $S = sum_T s_T^2$. By 7 with $b_T = s_T$ and $p = q_k$,
  #[#set math.equation(numbering: n => "(2.28)")
   $ \| Y \| lt.eq C_epsilon N^epsilon R^(q_k) S . $ <p:rough-scale-bound>]
  At a witness, $B lt.eq 1$ and $2 - q_k < 0$; the unit-supremum version of the weighted estimate supplies the
    inequality for arbitrary witness positions. Consequently any range $N lt.eq \( 2 + R \)^D$, with $D$ fixed,
    already satisfies (2.27). We may assume $N$ exceeds a sufficiently large fixed power of $2 + R$.
  Discard the packets with $s_T > C R N^(- k \/ 2)$. Their total field at a witness has modulus at most
  $ sum_(s_T > C R N^(- k \/ 2)) s_T \( 1 + d_T \)^(- P') lt.eq \( C R N^(- k \/ 2) \)^(- 1) sum_T s_T^2 w_T lt.eq
    C^(- 1) N^(k \/ 2) \/ R . $
  Choose $C$ large, so the remaining field retains half the threshold.
    Its coefficients have maximum $s_0 = C R N^(- k \/ 2)$. Put $P_1 = \( C \( 2 + R \) \)^10$,
    partition the frequency patch into bins of side $P_1 \/ N$, and write the remaining field as $sum_b V_b$.
    There are $O \( \( N \/ P_1 \)^k \)$ bins. Cauchy–Schwarz therefore gives
  #[#set math.equation(numbering: n => "(2.29)")
   $ sum_b \| V_b \( z_Q \) \|^2 gt.eq c P_1^k \/ R^2 . $ <p:bin-lower>]
  In this square sum remove all ordered pairs of frequency labels whose separation is at most $C' \/ N$,
    where $C'$ is a sufficiently large fixed constant compared with the native Fourier box.
    The removed expression is pointwise bounded by $C B^2$: each frequency slot has only boundedly many such
    neighbors, and the sum over the spatial and temporal labels is bounded by Cauchy–Schwarz with the summable
    packet envelopes. It is therefore $O \( 1 \)$ at the witnesses.
    Let $G = sum_b G_b$ be the sum of the remaining products.
    Choosing the constant in $P_1$ large makes (2.29) imply $\| G \( z_Q \) \| gt.eq 1$.
  We verify the required spacetime almost orthogonality. If $v_b$ is the center of a bin,
    the Fourier support of $G_b$ is contained in
  #[#set math.equation(numbering: n => "(2.30)")
   $ c \/ N lt.eq \| zeta \| lt.eq C P_1 \/ N \, wide \| sigma + 2 v_b dot.op zeta \| lt.eq
     C P_1^2 \/ N^2 . $ <p:off-diagonal-support>]
  To see this, subtract the two cap Fourier coordinates used in the proof of 7.
    Removing the $C' \/ N$ pairs guarantees the lower bound on $\| zeta \|$.
    The deviation from the tangent plane at $v_b$ is the product of two $O \( P_1 \/ N \)$ quantities,
    together with the $O \( N^(- 2) \)$ normal errors. For a fixed $\( zeta \, sigma \)$,
    the bin centers lie in a slab of thickness $C P_1^2 \/ \( N^2 \| zeta \| \)$.
    Counting their grid of mesh $P_1 \/ N$ gives overlap at most $C N^(k - 1) P_1^(C_k)$. Plancherel yields
  $ parallel G parallel_2^2 lt.eq C N^(k - 1) P_1^(C_k) sum_b parallel G_b parallel_2^2 . $
  Within a bin, the effective pointwise packet multiplicity is $O \( P_1^k \)$.
    If $A_b = sum_(T in b) s_T \( 1 + d_T \)^(- P')$, then $\| G_b \| lt.eq A_b^2$, $A_b lt.eq C P_1^k s_0$,
    and $A_b^2 lt.eq C P_1^k sum_(T in b) s_T^2 \( 1 + d_T \)^(- P')$. Integrating these inequalities proves
  #[#set math.equation(numbering: n => "(2.31)")
   $ parallel G parallel_2^2 lt.eq C N^(k - 1) P_1^(C_k) \( R N^(- k \/ 2) \)^2 E =
     C P_1^(C_k) R^2 N^(k + 1) S . $ <p:polynomial-L2>]
  All Fourier frequencies of $G$ have size at most $C P_1 \/ N$ in the $k + 1$ spacetime variables.
    Cover spacetime by cubes of side $L = N \/ P_1^(C_2) gt.eq 1$, choosing $C_2$ fixed and sufficiently large.
    The rescaled version of (2.9), summed over this lattice, shows that the number of these cubes with $sup \|
    G \| gt.eq 1$ is at most
  $ C L^(- \( k + 1 \)) parallel G parallel_2^2 lt.eq \( 2 + R \)^(C_k) S . $
  Each such cube is contained in an $N$-ball. If it contains a witness,
    use that witness as the envelope reference in 8; its unit-supremum estimate bounds the number of high unit
    cubes in the ball by $C R^(q_k)$. Multiplying the last two bounds proves the lemma. ◻
]

#proof[
  Fix the frequency box, Fourier enlargement, phase-space bound and original regularity class once and for all.
    Call an exponent $p$ admissible if $\| Y \| lt.eq C_p R^p S$ for all configurations in this class.
    Fixed changes of multiplicity, amplitude normalization, or cell enlargement change constants and do not change
    the infimum of admissible exponents. By 13 this infimum $p_(*)$ is finite.
    We prove $p_(*) lt.eq q$, where $q = q_k$.
  Suppose instead that $p_(*) > q$. There are configurations and parameters $R arrow.r oo$ with
  #[#set math.equation(numbering: n => "(2.32)")
   $ \| Y \| gt.eq R^(p_(*) - o \( 1 \)) S . $ <p:extremal-sequence>]
  Indeed use a failing exponent $p_(*) - epsilon.alt_j$ and let $epsilon.alt_j arrow.b 0$,
    with $R$ large enough to absorb all constants for the finitely many estimates already chosen.
    Bounded $R$ cannot give such failure by 13. Equation (2.28), used with each fixed positive $epsilon$, now implies
  #[#set math.equation(numbering: n => "(2.33)")
   $ frac(log N, log R) arrow.r oo . $ <p:scale-separation>]
  All subsequent $R^(o \( 1 \))$ statements have this finite-parameter meaning:
    first fix positive exponent tolerances and finitely many tests; then take $R$ sufficiently large,
    and finally let the tolerances tend to zero. In particular an admissible exponent just above $p_(*)$,
    rather than the possibly inadmissible exponent $p_(*)$ itself, is used in every application below.
  ===== 2.6.1 Removing excessively occupied fine packets. <removing-excessively-occupied-fine-packets.>
  Fix $C_1$ large. Delete a fine packet if its $C R$ native enlargement contains more than $R^(C_1)$ witness
    points. Double counting with $B \( z_Q \) lt.eq 1$ gives
  $ sum_(T upright(" deleted")) s_T^2 lt.eq C R^(P - C_1) \| Y \| . $
  Apply any fixed admissible estimate of exponent $p > p_(*)$ to the deleted subfield,
    with threshold a small fixed multiple of $N^(k \/ 2) \/ R$;
    its square envelope is bounded by the original one. The number of points where this subfield reaches that
    threshold is at most $C R^(p + P - C_1) \| Y \|$. Choose $C_1 > p + P + 10$.
    Except on a vanishing fraction of $Y$, the remaining field still reaches a fixed multiple of the old
    threshold. Constants of this sort are absorbed by changing $R$ by a fixed factor.
    Every surviving fine packet now has occupancy at most $R^(C_1)$ in its $C R$ enlargement.
  ===== 2.6.2 Coarse assembly and saturation of a ratio class. <coarse-assembly-and-saturation-of-a-ratio-class.>
  Choose a fixed $A$ much larger than $C_1$ and all preceding fixed exponents, and put
  $ K = N \/ R^A \, wide L = N \/ K = R^A . $
  Round to nested grids within bounded factors. Equation (2.33) ensures $K arrow.r
    oo$ faster than every fixed power of $R$. Assemble the surviving fine fields into $K$-packets by 11.
    In the sampling definition of their backgrounds use one slightly larger, fixed fine weight exponent $P +
    sigma$, $sigma > 0$:
  #[#set math.equation(numbering: n => "(2.34)")
   $ b_T^2 = C sum_(T' upright(" in its cap")) s_(T')^2 \( 1 + d_(T') \( z_T \) \)^(- P - sigma) .
     $ <p:coarse-background>]
  The original decay margin permits this choice. Apply Proposition 2.6,
    Proposition 2.10 with this exponent for the fine estimate and with the original exponent $P$ for the outer
    parent envelope. By 10,
  #[#set math.equation(numbering: n => "(2.35)")
   $ sum_T b_T^2 w_T \( z \) lt.eq C B \( z \)^2 \, wide sum_T K^(k + 2) a_T^q b_T^(2 - q) lt.eq
     R^(o \( 1 \)) E . $ <p:coarse-budgets>]
  The ratio satisfies $a_T \/ b_T lt.eq C L^(k \/ 2)$ by pointwise Cauchy–Schwarz in the $L^k$ fine frequency
    slots and summability over their native centers. The global contribution of ratios less than $L^(k \/ 2)
    R^(- 2)$ is at most $C K^(k \/ 2) L^(k \/ 2) R^(- 2) B$, again by Cauchy–Schwarz,
    so is negligible at the witnesses. Only $O \( log R \)$ dyadic ratio classes remain.
    By the triangle inequality one class
  $ a_T asymp r b_T $
  retains threshold $N^(k \/ 2) \/ R^(1 + o \( 1 \))$ on at least $R^(- o \( 1 \)) \| Y \|$ points.
    Use this class henceforth. Its amplitude-square envelope is $O \( r^2 \)$,
    and (2.35) bounds its energy by $R^(o \( 1 \)) r^(2 - q) E$.
    After dividing its field by $C r$, its effective threshold parameter at scale $K$ is $R^(1 + o \( 1 \)) r
    L^(- k \/ 2)$. This parameter is bounded below by a fixed constant whenever the threshold is attained,
    by the pointwise Cauchy bound. Apply an admissible exponent tending to $p_(*)$.
    Since $r$ and $L$ are fixed powers of $R$, its small exponent error is absorbed in $R^(o \( 1 \))$, giving
  #[#set math.equation(numbering: n => "(2.36)")
   $ \| Y \| & lt.eq R^(o \( 1 \)) \( R r L^(- k \/ 2) \)^(p_(*)) E K^(- \( k + 2 \)) r^(- q)\
 & = R^(p_(*) + o \( 1 \)) S thin \( r L^(- k \/ 2) \)^(p_(*) - q) . $ <p:ratio-saturation>]
  Here $k q \/ 2 = k + 2$. Comparison with (2.32), and the upper bound $r lt.eq C L^(k \/ 2)$, force
  #[#set math.equation(numbering: n => "(2.37)")
   $ r = L^(k \/ 2) R^(o \( 1 \)) \, wide sum_(T upright(" selected")) b_T^2 lt.eq
     R^(o \( 1 \)) E K^(- \( k + 2 \)) r^(- q) lt.eq R^(o \( 1 \)) S . $ <p:saturated-ratio>]
  The same fixed packet class remains available at this coarser scale:
    the inherited Fourier enlargement shrinks by $L^(- 1)$ in parent coordinates,
    whereas the parent localizer adds a fixed amount. A sufficiently large initial enlargement is consequently
    preserved as $L arrow.r oo$. Its Schwartz profiles have the originally fixed required bounds after constant
    renormalization. This verifies the uniformity needed to use the same $p_(*)$.
  ===== 2.6.3 Localizing the selected square mass. <localizing-the-selected-square-mass.>
  We detail the restrictions used to draw a packet through a point.
    First discard globally all selected labels with $b_T > R^3 K^(- k \/ 2)$. Since the packet decay exceeds $P$,
  $ lr(|sum_(b_T > R^3 K^(- k \/ 2)) f_T \( z \)|) lt.eq C r K^(k \/ 2) R^(- 3) sum_T b_T^2 w_T \( z \) lt.eq
    C r K^(k \/ 2) R^(- 3) $
  at the witnesses. By (2.37) this is negligible relative to $N^(k \/ 2) \/ R$.
    This global estimate, made before restricting distances, avoids any unsupported estimate of field tails from a
    square bound alone.
  The remaining selected square envelope is at least $R^(- o \( 1 \))$ on $R^(- o \( 1 \)) \|
    Y \|$ retained points. To verify this, fix $eta > 0$ and consider points where that envelope squared is at
    most $R^(- eta)$. Normalize the field there by $r R^(- eta \/ 2)$ and apply an admissible near-Cauchy
    exponent. Compared with (2.36), the threshold parameter gains $R^(- eta \/ 2)$ and the coefficient-square sum
    costs $R^eta$. The count of these points is therefore at most
  $ R^(p_(*) + o \( 1 \)) S thin R^(- eta \( p_(*) \/ 2 - 1 \)) . $
  Since $p_(*) > q > 2$, this is negligible compared with (2.32).
    Letting $eta$ tend to zero along the finite-test diagonal proves the asserted lower bound.
  For any fixed small $eta > 0$, 10 gives, term by term in the original fine square sum,
  $ sum_(T : d_T \( z \) > R^eta) b_T^2 w_T \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(]
    R^(- eta \( P - k - 1 \)) + R^(- A \( P - k - 2 \)) #scale(x: 120%, y: 120%)[\)] B \( z \)^2 . $
  For fine distance $a gt.double 1$, the second term comes only from parent centers moving to within $a \/
    2$ of the fine core; they require parent distance $gt.tilde a N \/ K$ and cost $R^(- A \( P - k - 2 \))
    a^(- P)$. For bounded $a$ only the first term occurs. Thus,
    choosing the square-mass tolerance smaller than these fixed gains, we may restrict to $d_T \( z \) lt.eq
    R^(o \( 1 \))$ and retain square mass $R^(- o \( 1 \))$.
  We may also require each such selected $T$ to have a surviving fine packet of its cap within $R^(o \( 1 \))$
    fine native distance of $z$. Indeed, if all its fine packets have distance greater than $R^(c eta)$,
    then parent centers at distance at most $R^eta$ from $z$ still have those fine distances greater than $1 /
    2 R^(c eta)$, since the displacement in fine coordinates is $O \( L^(- 1) R^eta \)$.
    The extra fixed $sigma$ in (2.34) supplies $R^(- c eta sigma)$ when it is dropped back to exponent $P$.
    Sum against the parent weights and use 10. These unattached labels have negligible square mass.
    This is why one larger exponent was chosen in the sampling definition;
    no stronger square-envelope hypothesis at the original witnesses is needed.
  Let $I_0 \( z \, T \)$ denote the resulting incidence relation. With
  $ m_0 \( z \) = sum_T b_T^2 I_0 \( z \, T \) \, $
  we have, on the retained set still called $Y$,
  #[#set math.equation(numbering: n => "(2.38)")
   $ R^(- o \( 1 \)) lt.eq m_0 \( z \) lt.eq R^(o \( 1 \)) \, quad b_T lt.eq R^(3 + o \( 1 \)) K^(- k \/ 2) \,
     quad sum_T b_T^2 lt.eq R^(o \( 1 \)) S . $ <p:incidence-mass>]
  The upper bound follows by removing $w_T$ at distance $R^(o \( 1 \))$ in (2.35);
    the lower bound follows from the localized square mass. Draw $T$ at $z$ with probability $b_T^2
    I_0 \( z \, T \) \/ m_0 \( z \)$ and attach one of its nearby surviving fine packets.
    At a fixed $z$ there are only $R^(o \( 1 \))$ local parent cells in each angular $1 \/ K$ slot.
    Consequently its angular law $mu_z$ satisfies
  #[#set math.equation(numbering: n => "(2.39)")
   $ mu_z \( upright("one ") 1 \/ K upright(" slot") \) lt.eq R^(6 + o \( 1 \)) K^(- k) . $ <p:slot-upper>]
  ===== 2.6.4 Typical directions and resampling. <typical-directions-and-resampling.>
  Restrict the draw to directions $v$ satisfying
  #[#set math.equation(numbering: n => "(2.40)")
   $ mu_z \( B \( v \, s \) \) gt.eq R^(- 1 - o \( 1 \)) s^k wide \( K^(- 1) lt.eq s lt.eq 1 \) . $ <p:ball-lower>]
  This removes $O \( R^(- 1 + o \( 1 \)) \)$ probability, without a logarithm of the number of scales.
    Here is a finite covering proof. In a fixed finite collection of shifted dyadic grids,
    restrict attention to cells meeting the bounded frequency box,
    with side between $c \/ K$ and a fixed constant. Select the maximal cells in this finite collection for which
    $mu_z \( Q \) < c R^(- 1) \| Q \|$. Within each grid these cells are disjoint,
    so the sum of their masses is at most $C R^(- 1)$. A ball failing (2.40) contains a cell of comparable side
    through its center in one of these grids; that cell belongs to a maximal bad cell.
    The bounded number of grids and fixed comparison factors are absorbed by the indicated subpower tolerance.
    Renormalizing the restricted law costs a bounded factor. Let $I \( z \, T \)$ be the resulting incidence
    relation and $m \( z \) = sum_T b_T^2 I \( z \, T \)$; (2.38) remains true.
  Fix $z in Y$. For another point $y in Y$ write $tau = \| t_y - t_z \|$.
    If $tau gt.eq N$, the probability, under the restricted draw,
    that $y$ is in the same $R^(o \( 1 \))$-enlarged $K$-cell as $z$ is at most
  #[#set math.equation(numbering: n => "(2.41)")
   $ R^(6 + o \( 1 \)) \( K \/ tau \)^k . $ <p:coarse-hit>]
  Indeed its directions lie in a ball of radius $K R^(o \( 1 \)) \/ tau$; (2.39) counts the slots in that ball.
    A nonempty incidence also requires $tau lt.eq K^2 R^(o \( 1 \))$,
    so the lowest angular precision $1 \/ K$ costs only a further $R^(o \( 1 \))$ at the endpoint of this range.
  If this probability is nonzero, choose a typical direction $v$ that sees $y$.
    In the original draw, the ball of radius $c N \/ tau$ about $v$ has mass at least
  #[#set math.equation(numbering: n => "(2.42)")
   $ R^(- 1 - o \( 1 \)) \( N \/ tau \)^k $ <p:fine-hit>]
  by (2.40). The radius lies between $1 \/ K$ and a fixed constant:
    $tau gt.eq N$ gives the upper bound, and $tau lt.eq K^2 R^(o \( 1 \))$ together with $N \/ K =
    R^A$ gives the lower one. Every draw in that ball has an attached fine packet which sees both $z$ and $y$ in
    its $C R$ enlargement. To check this last statement, its intercept at $z$ differs by at most $N
    R^(o \( 1 \))$; the change of angular direction over time $tau$ costs at most $c N$;
    and the discrepancy between a parent label and a fine label is $O \( 1 \/ K \)$,
    costing at most $tau \/ K lt.eq K R^(o \( 1 \)) lt.double N$.
    The time separation is also much less than $N^2$, whereas $z$ was already at fine native distance
    $R^(o \( 1 \))$. All these errors are smaller than the available $C R$ enlargement.
  Let $P_f \( y \)$ be the probability that the attached fine packet in the original draw sees $y$ in that
    enlargement. Comparing (2.41) and (2.42) bounds the expected number of far points in the sampled coarse cell by
  #[#set math.equation(numbering: n => "(2.43)")
   $ sum_(tau gt.eq N) R^(7 + o \( 1 \)) \( K \/ N \)^k P_f \( y \) lt.eq
     R^(C_1 + 7 - A k + o \( 1 \)) . $ <p:far-occupancy>]
  The last inequality uses the fine occupancy cutoff: every attached fine packet sees at most $R^(C_1)$ points,
    so $sum_y P_f \( y \) lt.eq R^(C_1)$. This is a comparison with the original draw,
    not an independence assertion about a direction and a point.
  For $tau < N$, a point in the same enlarged coarse cell lies in a ball of radius $C N$ about $z$,
    since the velocities are bounded and $K R^(o \( 1 \)) lt.double N$.
    The local linear estimate at $z$, or a bounded cover by $N$-balls and envelope comparability,
    bounds the number of such high points by $C R^q$. Choose $A$ so large that $A k > C_1 + q + 10$.
    Combining the near and far parts, the expected occupancy of the sampled enlarged coarse cell,
    for every retained $z$, is at most
  #[#set math.equation(numbering: n => "(2.44)")
   $ R^(q + o \( 1 \)) . $ <p:occupancy-upper>]
  ===== 2.6.5 The contradictory lower occupancy. <the-contradictory-lower-occupancy.>
  Put $n_T = \# { z in Y : I \( z \, T \) = 1 }$. This is no larger than the geometric occupancy of the enlarged
    coarse cell. Average that occupancy first over the draw at $z$, then uniformly over $z in Y$.
    By (2.38) and Cauchy–Schwarz, the result is at least
  $ frac(R^(- o \( 1 \)), \| Y \|) sum_T b_T^2 n_T^2 & gt.eq
    frac(R^(- o \( 1 \)), \| Y \|) frac(\( sum_T b_T^2 n_T \)^2, sum_T b_T^2)\
 & gt.eq R^(- o \( 1 \)) frac(\| Y \|, S) gt.eq R^(p_(*) - o \( 1 \)) . $
  The middle inequality uses $sum_T b_T^2 n_T = sum_(z in Y) m \( z \) gt.eq R^(- o \( 1 \)) \| Y \|$.
    All selections retained a subpower fraction, so the last inequality still follows from (2.32).
    This contradicts (2.44) because $p_(*) > q$. Thus $p_(*) lt.eq q$, and every $q + epsilon$ is admissible,
    proving (2.26). The unit-supremum and fixed-enlargement versions used in the proof follow from 5 and bounded
    changes of the lattice. ◻
]

== 3 The transverse frame estimate <f:section>

Write

$ q = frac(2 \( k + 2 \), k) \, wide p_k = frac(2 \( k + 1 \), k) \, wide m = k + 1 . $

All packet coordinates, envelopes, and weighted packet sizes in this section are those of Section 2.
  In particular, an inverse frequency width $r$ corresponds to spatial width $r$, time length $r^2$,
  and spacetime volume $r^(k + 2)$. A packet mask means multiplication by a selected sum of the smooth packet
  cutoffs at its own scale. Such sums have bounded absolute value.
  A restriction of a mask is allowed to keep any subset of its terms.

#thm([Theorem 3.1.])[
  (Frame estimate).  #emph[Fix $k gt.eq 2$, $c > 0$, and fixed packet bounds $C_0$.
    There is a finite integer $P_0$ such that, for every fixed $P gt.eq P_0$,
    there are a finite integer $J_0$ and a constant $C$, depending only on $k \, c \, C_0 \,
    P$ and the packet conventions, with the following property.
    Let $h gt.eq 2$, let $V_1 \, dots.h \, V_m$ be scale-$h$ packet sums on one time interval of length at most
    $C_0 h^2$, and suppose their normalized compact profiles have derivatives through order $J_0$ bounded by
    $C_0$. Let $Xi_i$ be their assigned frequency-label sets, with the fixed cap enlargements included.
    Assume bounded phase-space counting and
$ \| det \( \( 2 xi_1 \, 1 \) \, dots.h \, \( 2 xi_m \, 1 \) \) \| gt.eq delta > 0 quad \( xi_i in Xi_i \) . $

 Use $P$ for the packet envelope exponent. Let $Y$ be a set of distinct unit cubes and,
   for every $Q in Y$ and $i$, let $z_(i \, Q) in Q$ satisfy
$ \| V_i \( z_(i \, Q) \) \| gt.eq A_i gt.eq h^c \, wide B_i \( z_(i \, Q) \)^2 =
  sum_T s_(i \, T)^2 w_T \( z_(i \, Q) \) lt.eq 1 . $

 The points $z_(i \, Q)$ need not agree for different $i$. Set
$ H_i = A_i^(2 \/ k) \, wide H_g = #scale(x: 180%, y: 180%)[\(] product_(i = 1)^m H_i
  #scale(x: 180%, y: 180%)[\)]^(1 \/ m) \, wide D_i = h^(k + 2) sum_T s_(i \, T)^2 . $

 Then
#[#set math.equation(numbering: n => "(3.1)")
 $ \| Y \| lt.eq C delta^(- C) H_g^(- 2) sum_(i = 1)^m D_i / A_i^2 . $ <f:mainbound>]

 Only the finite number $J_0$ of profile derivatives is required.]
] <f:frame>

Unit translations change the square envelopes by a fixed factor.
  Consequently we use the cube centers for counting and retain the individual witnesses when testing the fields.
  Every local norm estimate below uses a weighted supremum on the relevant cube;
  thus none of the arguments replaces separate witnesses by an unsupported common witness.

The proof is by contradiction. A failing configuration determines transition scales and an excess packet
  amplitude. We encode the amplitude ratios along a finite hierarchy by logarithmic profiles.
  Projection estimates force each profile to have only a zero slope or the full Cauchy slope,
  and an incidence argument locates the interval on which the full slope occurs.
  The resulting transition ratio is subpower, contradicting the original excess amplitude and its energy budget.
  Smoothing is needed only when that excess grows subpolynomially in the original packet scale.

=== 3.1 Exact packets and a normalized countersequence <exact-packets-and-a-normalized-countersequence>

#thm([Lemma 3.2.])[
  (Reduction to exact packets).  #emph[It suffices to prove Theorem 14 for translated exact paraboloid extensions,
    with smooth data supported in bounded native frequency boxes,
    multiplied by a common Schwartz function of $t \/ h^2$ which is positive on the test interval and has compact
    Fourier support. All required seminorms of these exact packets can be fixed in advance.]
] <f:exact>

#proof[
  Use a fixed enlargement of the test interval and a cutoff equal to one there.
    Fourier transform a compact native profile in its spatial variables and insert a smooth partition into unit
    frequency boxes centered at $a in bb(Z)^k$. In the $a$th box remove the quadratic evolution factor,
    and expand the remaining smooth function of native time in a Fourier series on the enlarged interval.
    This writes the profile as a sum, indexed by $\( a \, n \) in bb(Z)^(k + 1)$,
    of exact extensions times common time modulations. Integration by parts in the Fourier coefficient formulas
    shows that, for prescribed finite $J \, M$,
  $ parallel upright("data")_(a \, n) parallel_(C^J) lt.eq C_(J \, M) \( 1 + \| a \| + \| n \| \)^(- M) \, $
  provided finitely many original derivatives are bounded. The physical frequency center changes by $a \/ h$.
    All intercepts are specified at one common reference time.
    Recentring about the shifted trajectory on the test interval changes a polynomial envelope by at most a fixed
    polynomial in $1 + \| a \|$.
  For completeness, normalize each layer by $c_(a \, n) = \( 1 + \| a \| + \| n \| \)^(- M \/ 2)$ and allocate
    threshold fractions proportional to $\( 1 + \| a \| + \| n \| \)^(- M \/ 4)$.
    Their sum is finite when $M$ is large. If a sum has magnitude at least $A_i$,
    one of its normalized layers exceeds the corresponding allocated threshold divided by $c_(a \, n)$.
    Apply the exact packet estimate to the tuples of these layers. In its $i$th energy term the threshold dependence is
  $ D_i A_i^(- 2) product_(j = 1)^m A_j^(- 4 \/ \( k m \)) . $
  Every threshold has a strictly negative power; hence, after taking $M$ large, the resulting mode sums converge,
    including the polynomial envelope losses. Modes $\| a \| >
    h^(1 \/ 2)$ contribute less than any specified negative power of $h$ by weighted Cauchy and the same decay.
    For the remaining modes transversality is preserved when $delta gt.eq
    h^(- epsilon_0)$ and $epsilon_0 > 0$ is sufficiently small.
    If $delta < h^(- epsilon_0)$, the polynomial bound in $h$ from the elementary packet estimate is absorbed by
    $delta^(- C)$. This also disposes of the discarded tail.
  An exact packet outside its central time bin has only polynomial growth in native time in each of the finitely
    many spatial localization seminorms: differentiate the compactly supported frequency integral and integrate by
    parts. Multiplication by a common positive-on-the-slab Schwartz cutoff makes all relevant spacetime integrals
    finite. Choose its decay after those seminorms. The whole argument therefore uses a fixed finite derivative
    order. The initial native-time cutoff used for the Fourier expansion is distinct from the final
    compact-Fourier multiplier $chi_h \( t \) = chi \( \( t - t_0 \) \/ h^2 \)$.
    The latter is bounded above and below by positive fixed constants on the test slab.
    Multiplying the exact-layer sum by it therefore changes the witness thresholds and packet bounds by fixed
    factors, which suffices for the reduction. ◻
]

Suppose now that the exact-packet assertion fails. By choosing the successive counterexamples to violate every
  fixed constant and every fixed inverse power of $delta$, we obtain $h arrow.r oo$ with $delta =
  h^(- o \( 1 \))$. Absolute Cauchy gives $H_i lt.tilde h$. Proposition 7 gives

$ \| Y \| lt.eq h^(o \( 1 \)) D_i H_i^(- k - 2) . $

Comparing this for all $i$ with the failed estimate proves

#[#set math.equation(numbering: n => "(3.2)")
 $ H_i \/ H_g = h^(o \( 1 \)) \, wide \| Y \| H_i^(k + 2) \/ D_i = h^(o \( 1 \)) . $ <f:hbalance>]

Here and below a positive quantity equal to a base to the power $o \( 1 \)$ is bounded both above and below in
  that sense.

Write the original exact-packet field as $V_i = chi_h U_i$, where $U_i$ is its uncut exact extension,
  with any common temporal modulation removed. For the smooth inverse-width-$H_i$ cap projection $P_b$, put $U_b =
  P_b U_i$ and $V_b = chi_h U_b$. Thus $U_b$ always denotes the full original cap extension before any transition
  masks. Localize each actual cap field $V_b$ at inverse width $H_i$,
  and select one dyadic packet amplitude class in each field:

#[#set math.equation(numbering: n => "(3.3)")
 $ a_T asymp S_i H_i^(- k \/ 2) \, wide S_i gt.tilde 1 . $ <f:original-amplitudes>]

These are the #emph[original transition masks]. They will remain in every later hierarchy,
  even though the fields inside them change. The selected sum has high threshold
  $A_i \( 1 + \| log S_i \| \)^(- C)$ on a subset, again denoted $Y$, satisfying

#[#set math.equation(numbering: n => "(3.4)")
 $ \| Y \| gt.eq \( log \( 2 + S \) \)^(- C) H_g^(- 2) sum_i D_i H_i^(- k) \, wide S = max_i S_i \,
   $ <f:selected-counter>]

with an arbitrarily large additional constant and inverse power of $delta$ along the countersequence.
  This countable pigeonhole is legitimate: classes below a fixed small value of $S_i$ have a summably small
  absolute contribution, and the threshold fractions above are summable in the dyadic index.
  At a transition cell, local Cauchy gives $a_T lt.tilde \( h \/ H_i \)^(k \/ 2) b_T$,
  where $b_T$ is its full descendant square weight. The weighted square sum at witnesses is bounded.
  Consequently classes larger than a fixed polynomial in $h$ have a negligible root contribution, so that $log S =
  O \( log h \)$ for the selected tuple.

Spatial almost orthogonality, followed by the local weighted Bernstein bound, gives

#[#set math.equation(numbering: n => "(3.5)")
 $ H_i^(k + 2) sum_(T upright(" selected")) a_T^2 lt.tilde D_i . $ <f:original-energy>]

Bounded counting and (3.3) also give square background $O \( S_i \)$ for the selected packets without using the
  original $B_i$. 12, applied to these packets, yields

#[#set math.equation(numbering: n => "(3.6)")
 $ H_i \/ H_g + H_g \/ H_i + D_i \/ \( \| Y \| H_i^(k + 2) \) + \| Y \| H_i^(k + 2) \/ D_i lt.tilde S^C .
   $ <f:Sbalance>]

It follows that $S arrow.r oo$ and $delta = S^(- o \( 1 \))$.
  Indeed, bounded $S$, or a fixed positive value of $log_S delta^(- 1)$,
  would make this estimate contradict the choice of the countersequence in (3.4).

Pass to a subsequence in one of two cases. In the #emph[power case],
  $log S gt.tilde log h$ and the logarithmic base is $Lambda = h$.
  In the #emph[subpower case], $S = h^(o \( 1 \))$ and the base is $Lambda = S$.
  The next subsection is needed only in the latter case.

The transition cells chosen in (3.3) will stay fixed, even when we replace the fields localized by them.
  We retain their original amplitudes as data, writing

$ a_T^(upright("orig")) asymp S_i H_i^(- k \/ 2) . $

Later assemblies have their own actual amplitudes; these need not remain comparable to $a_T^(upright("orig"))$.
  The original energy bound (3.5), however, continues to charge every surviving transition cell.

Here is the count we seek. We will show that the high set requires at least

$ \| Y \| H_i^k Lambda^(- o \( 1 \)) $

distinct surviving transition cells in each field. Applied to a field with $S_i = S$,
  their original amplitudes would give

$ D_i gt.tilde \| Y \| H_i^(k + 2) S^2 Lambda^(- o \( 1 \)) . $

The scale balances will exclude this inequality in both cases.
  To obtain the count, we first build finite scale hierarchies through the fixed transition masks.
  Their selected amplitude ratios define logarithmic profiles.
  The projection and incidence arguments will force the ratio at the transition scale to be subpower and bound the
  number of visits to each cell. Cauchy–Schwarz gives many incident cells at each high point,
  and double counting yields the displayed global bound. In the subpower case,
  we first need a square background controlled in the base $S$;
  this is the purpose of the smoothing argument that follows.

=== 3.2 Smoothing and clipping on the subpower scale <smoothing-and-clipping-on-the-subpower-scale>

Fix a field and abbreviate $H = H_i$, $D = D_i$. First remove original transition packets visited by more than
  $S^(C_1)$ witnesses in a fixed large power enlargement. Their squared-amplitude sum is at most $\| Y \|
  S^(- C_1 + C_2)$: count visits, using the fixed amplitude class and bounded counting,
  and put the enlargement costs into $C_2$. 12, with square background $O \( S \)$,
  shows that their root contribution is negligible when $C_1$ is sufficiently large.
  Each remaining high point needs at least $H^k \/ S^C$ nearby cap slots, by absolute summation and (3.3).
  Packet tails outside the chosen enlargement are negligible by the fixed rapid cutoff decay.
  Counting these incidences in a ball gives

#[#set math.equation(numbering: n => "(3.7)")
 $ \# \( Y ∩ B_r \) lt.tilde S^C \( r \/ H \)^k \( 1 + r \/ H^2 \) \, wide r gt.eq H . $ <f:ballcount>]

For each of the $O \( H^k \)$ cap directions, at most $O \( \( r \/ H \)^k \( 1 + r \/ H^2 \) \)$ packet cells
  meet the ball, up to the fixed power enlargement. Their occupancy is at most $S^(C_1)$.
  Division by the $H^k \/ S^C$ incidences required at each point proves the formula.

#thm([Lemma 3.3.])[
  (Clipped smoothing).  #emph[Fix $C_3$ sufficiently large.
    There is a fixed $L$ such that, with $K_0 = H S^L lt.eq h$,
    each cap field $V_b$ admits a scale-$K_0$ packet representation with integrated square energy at most $C
    D$ and envelopes $e_b^2 = sum_(gamma in b) s_gamma^2 w_gamma^(upright("work"))$ satisfying
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_b min \( e_b^2 \( z \) \, M_c \) lt.eq S^(o \( 1 \)) \, wide M_c = H^(- k) S^(C_3) \, $ <f:clipped>]

 outside $o \( \| Y \| \)$ witnesses.
   The work weight $w_gamma^(upright("work")) = \( 1 + d_gamma \)^(- P_(upright("work")))$ has a fixed order
   $P_(upright("work")) > P$, chosen in the proof; all subsequent levels of this subpower tree use that order.
   The envelope and profile orders are finite and independent of any subsequent scale-grid length.
   If $K_0 > h$, the tree instead ends at the unchanged original scale-$h$ packets with their original order $P$;
   their square envelope is already bounded at the witnesses.]
] <f:smoothing>

#proof[
  #strong[The positive smoothing functional.] We give separately the positive smoothing estimate and its
    comparison with packet sizes. The original selections and deletions are left unchanged and applied externally,
    and $chi_h$ remains in every actual field. Only the auxiliary positive density below uses the uncut original
    cap field $U_b$. Fix a sufficiently large integer $J gt.eq 1$, independent of all later grids, and put
  $ rho = H^(k + 2) sum_(z in Y) delta_z \, wide F_b \( x \, t \) = w_h \( t \) \| U_b \( x \, t \) \|^2 \, wide
    w_h \( t \) = (1 + frac(\( t - t_0 \)^2, h^4))^(- J) . $
  Spatial unitarity and the original fine-packet Gram bound give
  #[#set math.equation(numbering: n => "(3.9)")
   $ sum_b integral F_b = c_J h^2 sum_b parallel U_b \( t_0 \) parallel_2^2 lt.tilde h^(k + 2) sum_T s_T^2 =
     D . $ <f:auxiliary-energy>]
  Here $c_J = integral_(bb(R)) \( 1 + s^2 \)^(- J) thin thin upright(d) s < oo$.
    Indeed the cap projections have bounded overlap, and integration by parts in the original normalized frequency
    data gives summable Gram rows for the fine packets, using finitely many prescribed localization seminorms.
    This charges the original data before every transition mask. No division by $chi_h$ is used.
    Choose an even $Q$ sufficiently large compared with the original envelope order $P$ and $k$,
    and put $j_K \( x \) = c_Q K^(- k) \( 1 + \| x \/ K \|^2 \)^(- Q \/ 2)$.
  Convolve in space with heat variance $K^2$ and with independent symmetric jumps having density $j_r$ and
    intensity $thin upright(d) r \/ r$ at scale $r lt.eq K$. The limiting small-jump distribution exists because
    $integral_0^K r^2 thin upright(d) r \/ r < oo$. Denote the resulting kernel by $J_K$. It has
  #[#set math.equation(numbering: n => "(3.10)")
   $ C^(- 1) j_K lt.eq J_K lt.eq C j_K \, quad \| nabla J_K \| lt.eq C K^(- 1) j_K \,
     quad \| hat(J)_K \( xi \) \| lt.eq e^(- c K^2 \| xi \|^2) . $ <f:kernel>]
  Here is a useful direct verification of the polynomial tails.
    For the lower bound request one jump in $\[ K \/ 2 \, K \]$ and all other displacement at most $C K$,
    an event of fixed positive probability by the second moment bound.
    The density of that jump is comparable to $j_K$ after such a displacement.
    For the upper bound group jumps into $\[ 2^(- j - 1) K \, 2^(- j) K \]$, with Poisson counts $m_j$.
    If their total plus the Gaussian has magnitude comparable to $\| x \| gt.double K$,
    either the Gaussian has such magnitude or one of the jumps in group $j$ has magnitude at least $c
    2^(- j \/ 2) \| x \| \/ \( 1 + m_j \)$. Conditioning on the other variables and summing candidates bounds its
    density by
  $ C \( 1 + m_j \)^(Q + 1) K^(- k) 2^(j k - j Q \/ 2) \( K \/ \| x \| \)^Q . $
  Poisson moments are bounded uniformly in $j$ and the series converges for $Q > 2 k$.
    The same argument after differentiation of a slightly broader Gaussian proves the gradient bound.
    The Fourier bound follows from the heat factor and the characteristic function of a probability measure.
  In the coordinates moving with $2 b$, write $partial_(t \, b) = partial_t + 2 b dot.op nabla_x$,
    and also convolve in time by a Gaussian of width
  $ T = T \( K \) = K H \/ P_K \, wide P_K = min \( H \, K \/ H \)^theta \, wide 0 < theta < 1 \/ 4 \, $
  for $H lt.eq K lt.eq h$, using any increasing continuation below $H$.
    Write $rho_(K \, b) \, F_(K \, b)$ for these convolutions.
    The spatial generator in logarithmic scale is, up to fixed heat conventions, $L_K = K^2 Delta_x + j_K * - I$.
  #strong[Generator bounds.] We claim that for some $c' > 0$
  #[#set math.equation(numbering: n => "(3.11)")
   $ H^(- k) sum_b parallel L_K rho_(K \, b) parallel_2^2 lt.tilde S^C parallel rho parallel_1
     min \( H \, K \/ H \)^(- c') . $ <f:rho-generator>]
  Indeed (3.7) and the Gaussian identity for Fourier ball mass give
  $ integral_(\| zeta \| lt.tilde 1 \/ r) \| hat(rho) \( zeta \) \|^2 thin upright(d) zeta lt.tilde S^C parallel
    rho parallel_1 \( 1 + H^2 \/ r \) \, wide r gt.eq H . $
  To see the normalization, the local mass is at most $S^C r^k \( H^2 + r \)$ and the smoothing volume is
    $r^(k + 1)$. For $r < H$ the same bound loses only a fixed polynomial in $H \/ r$.
    On $\| xi \| asymp 1 \/ r$ the squared spatial multiplier is bounded by
    $C_N \( K \/ r \)^2 \( 1 + K \/ r \)^(- N)$. For $r lt.eq T$, the time Gaussian restricts $\| tau +
    2 b dot.op xi \| lt.tilde T^(- 1)$, with rapidly decreasing dyadic tails.
    Of the $O \( H^k \)$ cap centers, a fraction at most $C \( r \/ T + H^(- 1) \)$ obeys this restriction;
    this is the elementary count of an $H^(- 1)$ grid in a slab.
    The corresponding spacetime Fourier ball has radius $O \( r^(- 1) \)$.
    For $r gt.eq T$ use radius $O \( T^(- 1) \)$ and the trivial cap fraction one. At $r = K$ the resulting factor is
  $ \( P_K \/ H \) \( 1 + H^2 \/ K \) lt.eq 2 min \( H \, K \/ H \)^(theta - 1) . $
  The dyadic sums for $r < K$, $K < r < T$, and $r gt.eq T$ converge, after choosing $N$ large;
    enlargements in the Gaussian tails cost only fixed powers.
    This proves (3.11), also with the heat and jump multipliers treated separately.
  The exact equation supplies a second estimate:
  #[#set math.equation(numbering: n => "(3.12)")
   $ \| partial_(t \, b) F_(K \, b) \| lt.tilde \( H K \)^(- 1) F_(K \, b) . $ <f:current>]
  After carrier removal $U_b$ has frequency support $O \( H^(- 1) \)$, and its exact equation gives
  $ partial_(t \, b) \| U_b \|^2 = - 2 nabla_x #h(-0.16667em) dot.op "Im" #scale(x: 120%, y: 120%)[\(]
    overline(U_b) \( nabla_x - i b \) U_b #scale(x: 120%, y: 120%)[\)] . $
  Move this divergence to $J_K$. The required weighted Bernstein bound is
  $ integral j_K \( x - y \) \| \( nabla_y - i b \) U_b \( y \, t \) \|^2 thin thin upright(d) y lt.tilde H^(- 2)
    integral j_K \( x - y \) \| U_b \( y \, t \) \|^2 thin thin upright(d) y . $
  To prove it, remove the carrier and reproduce with a smooth projection kernel $R_H =
    H^(- k) R \( dot.op \/ H \)$. Polynomial comparison of translates of $j_K$ and weighted Young’s inequality
    give operator norm at most
  $ integral \| nabla R_H \( u \) \| chevron.l u \/ K chevron.r^(Q \/ 2) thin thin upright(d) u lt.tilde H^(- 1)
    wide \( K gt.eq H \) . $
  Together with (3.10) and Cauchy–Schwarz this bounds the current by $C \( H K \)^(- 1) \( J_K *_x F_b \)$.
    The sole time-weight term satisfies $\| w'_h \| lt.eq C_J h^(- 2) w_h$, and $h^(- 2) lt.eq \( H K \)^(- 1)$.
    Positive comoving time convolution preserves the inequality.
    The argument requires only compact-frequency $L^2$ data for the summed $U_b$;
    smooth approximation in that fixed cap justifies the current identity and the limiting convolutions.
  #strong[Propagation of the clipped bound.] Put $phi.alt \( u \) = M_c \( 1 - e^(- u \/ M_c) \)$ and $I \( K \) =
    sum_b integral rho_(K \, b) phi.alt \( F_(K \, b) \)$. For any symmetric diffusion or jump generator $L$,
    concavity gives $phi.alt' \( F \) L F gt.eq L phi.alt \( F \)$.
    Thus differentiating $I$ gives a lower bound consisting of twice the generator pairing with $rho$.
    For the spatial part Cauchy–Schwarz, (3.11), and $phi.alt \( F \)^2 lt.eq M_c F$ yield
  $ \| upright("spatial error") \| lt.eq S^C parallel rho parallel_1 min \( H \, K \/ H \)^(- c' \/ 2) \, $
  where we used $D lt.eq S^C parallel rho parallel_1$ from (3.6).
    Notice the cancellation of the factors $H^(k \/ 2)$ and $M_c^(1 \/ 2)$.
    For the time part integrate by parts once. The Gaussian gives $parallel T partial_(t \, b) rho_(K \, b)
    parallel_1 lt.tilde parallel rho parallel_1$, while (3.12) and $u phi.alt' \( u \) lt.eq
    C M_c$ give cost $C M_c T \/ \( H K \)$ per cap. There are $O \( H^k \)$ caps,
    so the time error is at most $S^C parallel rho parallel_1 \/ P_K$.
    Both errors integrate from $K_0$ to $h$ to at most
  $ S^C parallel rho parallel_1 { S^(- c L) + H^(- c) log h } = o \( parallel rho parallel_1 \) $
  when $L$ is fixed sufficiently large. We used $H gt.eq h^(2 c \/ k)$ and $S = h^(o \( 1 \))$.
    Smooth regularization of $rho$ and piecewise smooth approximation at $K = H^2$ justify the differentiation;
    the positive convolution formulas allow passage to the limit.
  At $K = h$, drop clipping. Convolving twice averages $w_h \|
    U_b \|^2$ on spatial width $h$ and time width at most $H h$ along $2 b$.
    The original transition masks remain outside this estimate.
    For a witness $z = \( x_z \, t_z \)$, the Gram bound for the uncut original fine packets is
  #[#set math.equation(numbering: n => "(3.13)")
   $ sum_b integral j_h \( x - x_z - 2 b tau \) \| U_b \( x \, t_z + tau \) \|^2 thin thin upright(d) x lt.tilde
     chevron.l tau \/ \( H h \) chevron.r^(M_1) sum_T s_T^2 w_T \( z \) . $ <f:original-witness-Gram>]
  The relative displacement in width-$h$ units is $O \( \| tau \| \/ \( H h \) \)$,
    and elapsed native time is at most $C + \| tau \| \/ h^2 lt.eq C + \| tau \| \/ \( H h \)$.
    The prescribed finite localization seminorms of the individual original packets grow polynomially in this
    variable. Spatial almost orthogonality and summable Gram rows therefore prove (3.13),
    retaining the original exponent on $w_T$ by choosing the auxiliary kernel order $Q$ larger.
    Since $w_h lt.eq 1$ and $T \( h \) lt.eq H h$, the Gaussian moments give
  $ I \( h \) lt.tilde integral rho \( z \) sum_T s_T^2 w_T \( z \) lt.tilde parallel rho parallel_1 . $
  At $K_0$, kernel comparability in space and (3.12) in comoving time show that $F_(K_0 \, b)$ varies by bounded
    factors in its central smoothing box. Therefore the extra convolution against $rho$ dominates a constant
    multiple of $sum_(z in Y) H^(k + 2) sum_b min \( F_(K_0 \, b) \( z \) \, M_c \)$.
    We have proved that this last clipping sum has bounded mean on $Y$.
  #strong[Recovery of packet envelopes.] We now bound the actual square envelopes by the smoothed auxiliary
    density on the test interval. This also fixes the required finite orders.
    Partition the exact data of $U_b$ into smooth caps of width $K_0^(- 1)$.
    Form the actual packets by localizing $chi_h P_v U_b$ in their scale-$K_0$ moving coordinates,
    and retain the original $H$ masks externally. Since $K_0 lt.eq h$,
    fixed native derivatives of $chi_h$ are bounded and its temporal Fourier thickness is at most
    $O \( K_0^(- 2) \)$. Use weighted suprema as packet sizes.
    Local constancy, $\| chi_h \|^2 lt.eq C_J w_h$, and bounded overlap of the spatial projections give
  #[#set math.equation(numbering: n => "(3.14)")
   $ K_0^(k + 2) sum_(v \, lambda) s_(b \, v \, lambda)^2 lt.tilde sum_v integral \| chi_h P_v U_b \|^2 lt.tilde
     integral w_h \| U_b \|^2 . $ <f:actual-packet-energy>]
  Thus (3.9) supplies the total integrated budget $C D$ for this representation of the same actual cutoff field.
  Here is an explicit fixed-order comparison. Work in native scale $K_0 = 1$ for a cap,
    write its uncut carrier-removed solution as $q_v \( u \, s \)$, and take
  $ N = Q + k + 2 \, wide P_(upright("work")) = 3 N + 3 . $
  A smooth larger frequency projection has propagation kernel $\| L_sigma \( r \) \| lt.eq
    C_N chevron.l sigma chevron.r^N chevron.l chevron.r r^(- N)$. Consequently, for every fixed $s_(*)$,
  $ \| q_v \( u \, s \) \|^2 lt.eq C chevron.l s - s_(*) chevron.r^(2 N) integral chevron.l u -
    y chevron.r^(- N) \| q_v \( y \, s_(*) \) \|^2 thin upright(d) y . $
  The bounded multiplier $chi_h$ and its fixed native derivatives only change the constant when estimating the
    actual packet sizes from this uncut field. Choose the size-supremum exponent at least
    $max \( P'_(upright("work")) \, 2 N \)$ for some fixed $P'_(upright("work")) > P_(upright("work"))$.
    For the packet centered at $\( a \, m \) in bb(Z)^(k + 1)$ its size then obeys
  $ s_(v \, a \, m)^2 lt.eq C chevron.l m - s_(*) chevron.r^(2 N) integral chevron.l a -
    y chevron.r^(- N) \| q_v \( y \, s_(*) \) \|^2 thin upright(d) y . $
  Summing with the work packet weight of order $P_(upright("work"))$ first in $m$ leaves time decay
    $P_(upright("work")) - 2 N - 1 = N + 2$, and then summing in $a$ retains spatial decay at least $N$.
    Thus the packet envelope at $z$ is bounded by a spatial $j_(K_0)$-weighted energy at any time $\| t_(*) -
    z_t \| lt.eq T \( K_0 \)$. Here $T \( K_0 \) lt.eq K_0^2$ and the relative velocity displacement is
    $O \( T \/ H \) lt.eq C K_0$.
  For these cap energies use weighted Bessel:
  $ sum_v integral j_(K_0) \( x - x_0 \) \| P_v f \( x \) \|^2 thin upright(d) x lt.tilde integral
    j_(K_0) \( x - x_0 \) \| f \( x \) \|^2 thin upright(d) x . $
  One proof avoids a nonsummable bound for each projection.
    With an even polynomial weight, differentiate the cap symbols and use their bounded overlap and Plancherel to
    bound synthesis $\( g_v \) mapsto sum_v P_v^(*) g_v$ in positive polynomially weighted $L^2 \( ell^2 \)
    arrow.r L^2$. Duality gives the displayed negative-weight analysis estimate.
    A partition into boxes and summable convolution extends it to translates of $j_(K_0)$.
    Apply it to $U_b$ at the fixed time $t_(*)$. Average the preceding packet comparison over the central part of
    the time Gaussian. For $z$ on the test slab and $\| t_(*) - z_t \| lt.eq T \( K_0 \) lt.eq h^2$,
    the polynomial weight $w_h \( t_(*) \)$ is bounded below by a fixed constant.
    No lower bound for $chi_h$ outside the test slab is needed.
    Hence $e_b^2 \( z \) lt.tilde F_(K_0 \, b) \( z \)$ on the test interval.
    Markov’s inequality, with any slowly diverging subpower threshold, now proves (3.8).
  When $K_0 lt.eq h$, these reconstructed packets are the leaves of the subpower tree:
    no original scale-$h$ fine squares are inserted below them.
    Their rapid output decay can be fixed above $P'_(upright("work"))$,
    and the same work exponent is used in each later application of Proposition 2.6, Proposition 2.10,
    Theorem 2.11. The original order $P$ enters only the input square hypothesis and the original-packet Gram
    bound used at $K = h$; no comparison of a reconstructed fine array with the original square envelope is
    asserted. If $K_0 > h$, use the unchanged original scale-$h$ representation as the leaf, with order $P$.
    Its square envelope is bounded at the witnesses, so clipping is automatic.
    All orders are chosen before the finite scale grids and the finite original derivative order in 15;
    they depend on $k \, c$ and the original envelope order, not on hierarchy depth. ◻
]

Retain only original $H$ masks whose centers obey $e_b^2 lt.eq M_c$. The loss is negligible.
  Indeed, within a sufficiently small fixed power enlargement,
  a removed bin has $e_b^2 gt.tilde M_c \/ S$ at the witness, by polynomial weight comparison.
  Formula (3.8) therefore bounds the number of such bins by $H^k S^(1 - C_3 + o \( 1 \))$.
  Multiply this by the original amplitude $S H^(- k \/ 2)$ and choose $C_3$ large.
  Outside the enlargement, use the rapid cutoff tails and the same absolute amplitude bound.

At surviving transition masks use weights $b_T = e_b \( z_T \)$.
  For each bin $b$, sampling only the retained mask centers gives

$ sum_(T upright(" retained in ") b) e_b^2 \( z_T \) w_T \( z \) lt.tilde min { e_b^2 \( z \) \, M_c } . $

Convolution gives the bound by $C e_b^2 \( z \)$; the center restriction $e_b^2 \( z_T \) lt.eq
  M_c$ and the bounded sum of the mask weights give the bound by $C M_c$.
  At strict ancestors we may therefore use the square sum of $min \( e_b^2 \, M_c \)$ over descendant bins,
  with proportional clipping inside each bin. At finer scales, up to the chosen leaf $K_0$ or $h$,
  use its full descendant squares with the same envelope order.
  The displayed comparison verifies 11 at the crossing of the clipping threshold;
  ordinary convolution verifies the other transitions. Root and transition square sums are $S^(o \( 1 \))$.
  Sorting actual transition amplitudes by their ratios $r$ to $b_T$,
  Proposition 7 from the endpoint gives energy $S^(o \( 1 \)) r^(2 - q) D$;
  the square bound of this class is $S^(o \( 1 \)) r$. The ratios are polynomially bounded in $S$ by Cauchy,
  and negligible negative powers make no root contribution. 12, with its exponent slack sent to zero, therefore gives

#[#set math.equation(numbering: n => "(3.15)")
 $ \| Y \| lt.eq S^(o \( 1 \)) D_i H_i^(- k - 2) \, wide H_i \/ H_g = S^(o \( 1 \)) \,
   wide \| Y \| H_i^(k + 2) \/ D_i = S^(o \( 1 \)) . $ <f:subbalance>]

The reverse comparisons follow from (3.4). Rounding $H_i$ or the fine endpoint by fixed factors has no effect;
  if $H_i gt.tilde h$, use the original $h$ label grid.

=== 3.3 Finite scale trees and the limiting profiles <finite-scale-trees-and-the-limiting-profiles>

The logarithmic argument will always be realized on a fixed finite grid before limits are taken. In the power case use

$ kappa_i \( s \) = h^s \, quad 0 < s < e_i = 1 \, quad Lambda = h . $

In the subpower case use

$ kappa_i \( s \) = H_i S^s \, quad - oo < s < e_i \, quad e_i = min { L \, lim log_S \( h \/ H_i \) } \, quad
  Lambda = S . $

The actual fine endpoint and the original transition masks are included in every tree.
  A transition mask is a distinct linear layer even if its exponent coincides with the endpoint exponent.
  Physical lattices need not be nested. Frequency labels retain their assigned ancestors despite bounded overlaps
  of the enlarged supports.

We spell out the selection order because subsequent directional deletions change intermediate amplitudes.
  No assertion below assumes that a selected amplitude ratio survives such a deletion.

#thm([Lemma 3.4.])[
  (Finite-grid selection and discard).  #emph[On a fixed finite grid one can select ratios $r_(i \, s)$,
    retain a subpower fraction of the high cubes, and retain packet masks with the following properties. Put
#[#set math.equation(numbering: n => "(3.16)")
 $ M_(i \, s) = kappa_i \( s \)^(k + 2) \( r_(i \, s) \/ A_i \)^q . $ <f:occupancy-size>]

 At every selected scale the original selected amplitudes obey $a_T asymp r_(i \, s) b_T$, and
#[#set math.equation(numbering: n => "(3.17)")
 $ Q_(i \, s) & := sum_T \| T \| a_T^q b_T^(2 - q) = Lambda^(o \( 1 \)) D_i \,\
E_(i \, s) & := sum_T \| T \| a_T^2 = Lambda^(o \( 1 \)) D_i r_(i \, s)^(2 - q) \,\
sum_(T upright(" active")) b_T^2 & lt.eq Lambda^(o \( 1 \)) \| Y \| \/ M_(i \, s) . $ <f:Qsat>]

 An active cell has at most $Lambda^(o \( 1 \)) M_(i \, s)$ eligible witnesses in its prescribed subpower
   enlargement. All witnesses are eligible in the power case and at strict ancestors of transition bins.
   Within a subpower transition bin $b$, eligibility means $e_b^2 \( z \) lt.eq Lambda^(o \( 1 \)) M_c$.]
  #emph[More generally, a collection of actual outputs in fixed masks whose weighted $q$ budget is at most
    $Lambda^(- epsilon) D_i$, for fixed $epsilon > 0$, has negligible root contribution.
    The same assertion holds for error summands in any later restricted tree.]
] <f:selection>

#proof[
  Fix a small number $beta > 0$ which bounds the exponents of all norm losses, fixed-grid constants,
    logarithmic sums, and initial balance errors. Work far enough along the sequence that these losses are at most
    $Lambda^(C beta)$. Choose the distance cutoff exponent next,
    the eligibility and enlargement exponents after that, and the occupancy cutoff exponent last.
    Each is larger than the fixed comparability multiples of its predecessors.
    They will all tend to zero, in this order, along a slow diagonal.
  First prove the discard statement, without assuming selection or saturation.
    For an error $U$ with actual amplitudes and budget $Q_U$, Propositions 7 and 11 through its masks give,
    in the power case,
  #[#set math.equation(numbering: n => "(3.18)")
   $ \# { z in Y : \| U \( z \) \| > t A_i } lt.eq Lambda^(C beta) t^(- q) A_i^(- q) Q_U . $ <f:discard>]
  One can jump directly from a current layer to the root: no not-yet assembled intermediate masks are needed,
    and any transition restriction already fixed remains imposed. In the subpower case propagate to the gap edge.
    Sort the #emph[actual] output amplitudes there by their ratios to the propagated weights.
    Cauchy bounds the nonnegligible ratios by fixed powers of $S$,
    since only finitely many scales are involved and the clipped square is bounded at the transition.
    12 across the gap gives (3.18) with a further $S^(C eta)$,
    where $eta > 0$ is its arbitrarily small exponent slack. Choose $eta$ after the desired discard saving.
    Very small ratios have negligible contribution by absolute Cauchy,
    and larger ratios have summably small weighted budget. Thus $Q_U lt.eq
    Lambda^(- epsilon) D_i$ allows both a vanishing threshold fraction and a power-small exceptional set,
    by choosing $beta \, eta$ and the exponent in $t$ sufficiently small relative to $epsilon$.
    This proof uses actual error amplitudes throughout.
  Assemble from leaves toward the root, with the original transition masks fixed.
    At each stage Cauchy gives a polynomial upper bound for the amplitude-to-weight ratios.
    In the subpower case this includes the quotient $kappa_i \( s \)^(k \/ 2) \/ A_i$,
    which is a fixed power of $S$ at each fixed scale. Ratios below a sufficiently small inverse power are
    harmless by Cauchy and the discard estimate. There remain $O \( log Lambda \)$ dyadic classes.
    Select a class for the sum actually reaching the root before packetizing a smaller inverse width.
    A finite number of selections costs $Lambda^(o \( 1 \))$ in thresholds and high set size.
  Here is the occupancy deletion at this same stage. If $n_T$ counts eligible witnesses in the prescribed enlarged
    cell, local weight comparison and (3.8) give
  $ sum_T b_T^2 n_T lt.eq Lambda^(beta') \| Y \| \, $
  where $beta'$ accounts for the already chosen enlargement and eligibility.
    This also holds with full squares in the power case. For a candidate ratio class $r$ delete cells with $n_T >
    Lambda^gamma M_s$, choosing $gamma > beta' + C beta$. Their weighted charge is
  $ Q_(upright("bad")) lt.tilde r^q kappa_s^(k + 2) sum_(upright("bad")) b_T^2 lt.eq
    Lambda^(beta' - gamma) \| Y \| A_i^q lt.eq Lambda^(beta' - gamma + C beta) D_i . $
  Use (3.2) or (3.15) in the last inequality. The discard estimate therefore permits this pruning before the final
    selection at that layer. Similarly, a size supremum realized only at distance $Lambda^gamma$ from the packet
    center carries a negative power budget if its local amplitude is power-smaller:
    retain an extra fixed decay margin in the supremum and apply the same estimate.
  The upper bound for $Q_(i \, s)$ follows from the weighted norm estimate through the already assembled masks.
    The reverse follows by applying (3.18) to the entire selected field, which still has its root high set.
    Since $a_T asymp r_(i \, s) b_T$, the formulas for $E_(i \, s)$ and $sum b_T^2$ follow algebraically.
    Taking the diagonal of the specified slacks proves the displayed subpower assertions. ◻
]

#thm([Lemma 3.5.])[
  (Profiles).  #emph[After taking subsequences and finer finite rational grids there are nonnegative,
    nonincreasing, $k \/ 2$-Lipschitz functions $f_i$ such that
$ r_(i \, s) = Lambda^(f_i \( s \) + o \( 1 \)) \, wide f_i \( e_i \) = 0 . $

 In the power case $f_i \( 0 \) = lim log_h A_i$. In the subpower case
#[#set math.equation(numbering: n => "(3.19)")
 $ 0 lt.eq d_i \( s \) := f_i \( s \) + k s \/ 2 lt.eq k e_i \/ 2 wide \( s lt.eq 0 \) . $ <f:d-bounded>]

]
] <f:profiles>

#proof[
  For $s < s'$, weighted Cauchy between the two layers gives
  $ r_(i \, s) lt.eq Lambda^(o \( 1 \)) \( kappa_i \( s' \) \/ kappa_i \( s \) \)^(k \/ 2) r_(i \, s') . $
  Conversely, integrated spatial $L^2$ orthogonality gives $E_(i \, s) lt.eq C_(upright("grid")) E_(i \, s')$.
    To justify it with masks, first remove the outermost mask by its bounded sup norm;
    then separate its immediate children by their bounded Fourier overlap. Repeat in this order.
    One never commutes all outer masks past a final fine frequency decomposition.
    Polynomial spatial weights can be retained using translated band-limited cutoffs.
    Formula (3.17), and $q > 2$, now give $r_(i \, s) gt.eq Lambda^(- o \( 1 \)) r_(i \, s')$.
    At the fine endpoint the ratio is one by the choice of the input sizes.
  In the power case root witness sampling and local constancy give $\| Y \| A_i^2 lt.tilde Lambda^(o \( 1 \))
    E_(i \, s)$. Together with saturation and $\| Y \| = Lambda^(o \( 1 \)) D_i A_i^(- q)$ this gives $r_(i \, s)
    lt.eq Lambda^(o \( 1 \)) A_i$. The reverse endpoint comparison comes from root Cauchy, $A_i lt.eq
    Lambda^(o \( 1 \)) kappa_i \( s \)^(k \/ 2) r_(i \, s)$, as $s arrow.b 0$.
    The same root Cauchy in the subpower case gives $f_i \( s \) + k s \/ 2 gt.eq 0$.
    The fine endpoint and the Lipschitz bound give the other inequality in (3.19).
  On each finite grid the logarithms are uniformly bounded and have these two one-sided Lipschitz bounds up to
    vanishing errors. A diagonal subsequence on rational parameters gives the asserted continuous profiles.
    Every later test involves only a fixed finite grid: include its parameters first and take the subsequence far
    enough that its logarithms approximate the limiting values to the desired accuracy.
    Grid complexity can equivalently increase sufficiently slowly.
    No rate of convergence to a particular slope is assumed. ◻
]

Freeze the selected masks together with the ratios and budgets recorded in Lemma 17.
  These records will charge later deletions and supply the broad witnesses.
  The original transition amplitudes in (3.3) remain separate records for the final incidence count.
  After a deletion the fields receive fresh actual amplitudes and fresh propagated positive weights;
  neither set of recorded amplitudes is asserted to survive that deletion.

=== 3.4 Positive paths and the occupancy identities <positive-paths-and-the-occupancy-identities>

We next turn the selected packet hierarchy into a law on directions through a high point.
  Its purpose is to compare two quantities: the square mass available in a frequency cap,
  and the number of high points in a physical cell directed by a sampled leaf.
  The normalization of the law must be recomputed when directions are removed,
  although its occupancy scale $M_(i \, s)$ and its charging bounds come from the frozen selection.

Fix one field and one of its finite trees. Initially use the selected tree itself.
  Later we use the same construction after the particular angular omissions of Lemma 21.
  Those omissions keep the frozen masks and retain the root high threshold.
  Their fresh weighted norm bound is proved in that lemma using the packet estimates and the discard statement;
  the construction below uses that bound, not any assertion that the old amplitudes survive the omissions.

Expand the chosen positive square propagation through the retained cells, keeping their assigned cap ancestry.
  A surviving path $pi = \( T_0 \, dots.h \, T_ell \)$ ends at a terminal physical input $gamma = T_ell$.
  Denote its successive nonnegative propagation factors by $k_0 \( z \; pi \) \, dots.h \, k_ell \( z \; pi \)$.
  The first evaluates at the root point $z$; an ordinary parent-to-child factor is the native sampling weight
  $w_(T') \( z_T \)$ from (2.23), with its chosen fixed normalization and edge-decay reserve.
  Retain each factor’s dependence on the assigned cap ancestry and its evaluation point.
  With the input square $s_gamma^2$, the weight of the path is

$ s_gamma^2 product_(j = 0)^ell k_j \( z \; pi \) . $

Let $omega \( gamma \)$ denote its terminal direction label.
  Sum these weights over the surviving paths with $omega \( gamma \) = omega$ to define $J_z \( omega \)$, and put

$ W \( z \) = sum_omega J_z \( omega \) . $

In particular, terminal physical inputs with the same direction label are summed.
  Wherever $W \( z \) > 0$, the provisional direction law is $p_z \( omega \) = J_z \( omega \) \/ W \( z \)$.
  The proof removes distant paths and normalizes once more;
  all conclusions below concern that resulting near-path law.
  Later angular omissions likewise require fresh path sums and a fresh normalization.

The reference cap weights $b_tau^2 \( z \)$ retain the available descendant squares of the selected tree.
  In the power case these are full squares. In the subpower case strict transition ancestors use proportionally
  clipped bins, and finer levels use full descendant squares only in eligible transition bins.
  This retains the transition-center restriction and the eligibility condition in Lemma 17.
  Indeed, in the subpower case,

$ sum_(b upright(" eligible")) e_b^2 \( z \) lt.eq Lambda^(o \( 1 \)) sum_b min \( e_b^2 \( z \) \, M_c \) lt.eq
  Lambda^(o \( 1 \)) \, $

because eligibility gives $e_b^2 \( z \) lt.eq Lambda^(o \( 1 \)) M_c$.
  Thus these level-specific reference squares remain controlled even where full squares are used.
  They are distinct from the surviving path mass $J_z$. Their comparison with the law will hold at sampled labels,
  not uniformly at every label after omissions.

For finite-valued labels $A$ and $B$, $Pr \( A divides B \)$ denotes $p_(A divides B) \( a divides b \)$ evaluated
  at the sampled values $a = A$, $b = B$. Its logarithmic information in base $Lambda > 1$ is $-
  log_Lambda Pr \( A divides B \)$. In $Pr \( T_s \( Z \, Omega_i \) divides Omega_i \)$,
  conditioning on $Omega_i$ fixes the tilted lattice, and $T_s \( Z \, Omega_i \)$ is its sampled cell label.

#thm([Lemma 3.6.])[
  (Restricted path law).  #emph[For the selected tree, and for each of the directional restrictions constructed
    below, one can draw a uniform root point $Z$ from a subpower fraction of $Y$ and then a path to a fine
    direction $Omega_i$ in each field. The intermediate active cells lie within subpower normalized distance of
    $Z$. The fields’ paths may be drawn independently conditional on $Z$.]
  #emph[For the reference cap square weights just defined, at a typical sampled label
#[#set math.equation(numbering: n => "(3.20)")
 $ Pr \( tau divides Z \) = Lambda^(o \( 1 \)) b_tau^2 \( Z \) . $ <f:cap-law>]

 Let $T_s \( Z \, Omega_i \)$ be the cell containing $Z$ in the disjoint scale-$kappa_i \( s \)$ lattice tilted by
   $Omega_i$. At a typical draw,
#[#set math.equation(numbering: n => "(3.21)")
 $ frac(Pr \( T_s \( Z \, Omega_i \) divides Omega_i \), Pr \( Z divides Omega_i \)) =
   Lambda^(o \( 1 \)) M_(i \, s) . $ <f:occupancy-law>]

 Typical means outside probability tending to zero on each fixed finite test,
   with any prescribed positive exponent tolerance.]
] <f:paths>

#proof[
  We first show that the available high points have enough surviving path mass to normalize the law.
    The weighted norm estimate applied afresh to this restricted tree gives a budget at most $Lambda^(o \( 1 \))
    D_i$, with its actual modified amplitudes. At the root its integrand is
  $ \| V \( z \) \|^q W \( z \)^(1 - q \/ 2) . $
  The number of high points where $W lt.eq Lambda^(- alpha)$ is at most
    $Lambda^(o \( 1 \) - alpha \( q - 2 \) \/ 2) D_i A_i^(- q)$.
    Across the subpower gap the ratio-class argument in the proof of Lemma 17 adds only $S^(C eta)$;
    choose $eta$ smaller than $alpha \( q - 2 \) \/ \( 4 C \)$. Thus low path mass is exceptional.
    Full-background convolution and the transition eligibility test give $W lt.eq Lambda^(o \( 1 \))$.
  Use a fixed extra polynomial decay power on each path edge.
    A path with an intermediate center farther than $Lambda^alpha$ from $z$ has a comparably large normalized edge
    displacement, since the inverse widths increase toward the leaves and the nested-cap shears are bounded in the
    appropriate coordinates. Dropping the extra power on this edge still leaves a convolution bounded by the full
    background; hence such paths have mass $o \( W \( z \) \)$ after the fixed extra margin is chosen larger than
    the path-mass lower-bound exponent requires. This uses the same fixed margin on each edge,
    not an increasing endpoint weight exponent. Redefine $J_z$ and $W$ to count only the retained near paths,
    and normalize by this new $W$. Relabel the final retained root set as $Y$;
    its cardinality differs by only a subpower factor from the preceding set.
    Every retained path is eligible at its transition bin: its surviving transition-mask center has $e_b^2 lt.eq
    M_c$, and proximity to that center and polynomial weight comparison give $e_b^2 \( z \) lt.eq
    Lambda^(o \( 1 \)) M_c$. On the near paths, telescoping local weight comparisons and the subpower
    neighboring-cell multiplicities give
  $ p_z \( omega \) := J_z \( omega \) \/ W \( z \) lt.eq Lambda^(o \( 1 \)) a_omega \( z \) \, $
  where $a_omega$ is the corresponding available leaf square weight.
    If a final direction label sums many final input cells, only its last localization layer and intermediate
    active cells need be near $z$; the input coefficients are summed in $a_omega$.
  Summing this upper bound over descendants proves the upper half of (3.20).
    For its lower half, at any fixed root point the total probability of sampled labels satisfying
    $p_z \( tau \) < Lambda^(- epsilon) b_tau^2 \( z \)$ is at most $Lambda^(- epsilon) sum_tau b_tau^2 \( z \) =
    Lambda^(- epsilon + o \( 1 \))$. This is a statement at sampled labels, not a uniform lower bound for all labels.
  Here are both sides of (3.21). For a fixed leaf direction $omega$ and a tilted $s$ cell $C$, put
  $ mu \( omega \, C \) = \| Y \|^(- 1) sum_(z in Y ∩ C) p_z \( omega \) . $
  At the realized pair $\( z \, omega \)$ the ratio in question is exactly
  #[#set math.equation(numbering: n => "(3.22)")
   $ \| Y \| mu \( omega \, C \) \/ p_z \( omega \) . $ <f:fiberidentity>]
  For the upper bound, all contributing active $s$ cells lie in a subpower enlargement of $C$.
    The occupancy deletion counts at most $Lambda^(o \( 1 \)) M_(i \, s)$ eligible points there.
    The leaf background varies by a subpower factor within the tilted cell,
    and path domination and the typical leaf lower bound compare each summand to $p_z \( omega \)$.
    This proves the upper bound.
  For the lower bound, let $J_T^(upright("dom")) \( omega \)$ be the unnormalized sum of positive descendant-path
    weights from an active scale-$s$ mask $T$, evaluated at its center $z_T$ on the selected tree before angular
    deletions. Retain the transition-center restriction and proportional clipping,
    and sum all terminal physical cells with direction label $omega$.
    Later macro-dependent omissions give subcollections of this one majorant, without creating extra copies.
    Positive convolution gives $sum_omega J_T^(upright("dom")) \( omega \) lt.tilde C_(upright("grid")) b_T^2$.
    At the transition this uses both the full-square convolution bound and the bound by $C_(upright("grid"))
    M_c$ from retained centers; take their minimum. At finer cells use the full descendant weights.
  Let $cal(N)_s \( omega \, C \)$ consist of active masks in the assigned $s$-cap whose $Lambda^eta$ native
    enlargements meet the tilted $s$-cell $C$, and put
  $ a_(omega \, C) = sum_(T in cal(N)_s \( omega \, C \)) J_T^(upright("dom")) \( omega \) . $
  This reference charge is used only for domination; the actual law $p_z \( omega \) =
    J_z \( omega \) \/ W \( z \)$ is normalized using the fresh surviving mass of the restricted tree.
    The near-ancestor kernel sum and $W \( z \) gt.eq Lambda^(- o \( 1 \))$ give the following pointwise bound.
    For fixed $\( omega \, T \)$, only $Lambda^(o \( 1 \))$ cells $C$ occur,
    because the two scale-$s$ frames differ by a bounded normalized shear. Consequently
  $ p_z \( omega \) lt.eq Lambda^(o \( 1 \)) a_(omega \, C) \, wide sum_(omega \, C) a_(omega \, C) lt.eq
    Lambda^(o \( 1 \)) sum_(T upright(" active")) b_T^2 lt.eq Lambda^(o \( 1 \)) \| Y \| \/ M_(i \, s) . $
  At a strict transition ancestor, eligible contributions are comparable at the charging center up to the
    prescribed subpower factor; unique label ancestry charges each clipped bin only once.
    The total probability of fibers satisfying
  $ mu \( omega \, C \) < \| Y \|^(- 1) Lambda^(- epsilon) M_(i \, s) a_(omega \, C) $
  is at most $Lambda^(- epsilon + o \( 1 \))$. For every other sampled fiber, (3.22) proves the lower bound.
    Replacing boxes by balls or bounded-overlap coverings changes these sampled logarithms by $o \( 1 \)$:
    the total probability of a cell power-smaller than one of its boundedly many neighbors is power-small.
    The same argument handles subpower distortions. ◻
]

#thm([Lemma 3.7.])[
  (Conditioning directions).  #emph[Inside a fixed cap $tau_l$,
    let $C$ be a physical cell over which every descendant velocity has drift at most the endpoint width,
    and whose time range is at most the endpoint duration. Adding an independently redrawn descendant direction as
    conditioning changes the logarithmic information of position inside $C$ by $o \( 1 \)$ at a typical draw.
    The cell may depend on a different conditionally independent drawn direction.
    The conclusion also holds for subpartitions and subpower distortions.
    In the power case it holds for a direction from another field whenever its full weights have the same bounded
    drift on $C$.]
] <f:conditioning>

#proof[
  Use as reference direction law the endpoint square weights at the center of $C$, normalized within $tau_l$.
    Clip whole transition bins proportionally if $tau_l$ is a strict ancestor.
    The drift assumption makes these reference weights comparable throughout $C$.
    By (3.20) and path domination, the conditional density of the direction relative to this law is at most
    $Lambda^(o \( 1 \))$ at typical data. Its average conditional density is at least $Lambda^(- o \( 1 \))$ at a
    typical sampled direction: the exceptional mass is bounded by summing reference weights exactly as in the
    lower half of (3.20). Bayes’ identity now bounds the likelihood ratio for position by $Lambda^(o \( 1 \))$.
  For clarity, the remaining one-sided information comparison requires no independence assumption.
    If $p$ and $p'$ are the probabilities of a realized finite label before and after additional conditioning,
    then $bb(E) \[ p \/ p' \] lt.eq 1$. Markov’s inequality implies $p \/ p' lt.eq
    Lambda^epsilon$ outside probability $Lambda^(- epsilon)$.
    Apply this to each member of a finite chain of partitions.
    Combining it with the reference-law comparison proves equality of the relevant information increments to
    arbitrary logarithmic tolerance. ◻
]

=== 3.5 Angular pruning inside one profile block <angular-pruning-inside-one-profile-block>

#thm([Lemma 3.8.])[
  (Angular test and original broad witnesses).  #emph[Fix one field,
    a cap parameter $l$ away from the endpoints and the transition seam, and a finite mesh of $0 < v lt.eq
    u$ with $l + C u < e_i$. Suppose that
$ f_i \( l \) - f_i \( l + v \) gt.eq x v $

 on this mesh, for some $x > 0$. For a number $eta > 0$ depending only on $x \, k$,
   one may restrict the frozen tree so that, at typical $\( Z \, tau_l \)$,
   its new conditional direction law assigns mass at most $Lambda^(- eta v + o \( 1 \))$ to every affine
   hyperplane strip of width $Lambda^(- v)$ in the native frequency coordinates of $tau_l$.]
  #emph[At one arbitrarily small mesh precision $v_0 > 0$, the sampled active $l$ cells may also be required to
    have broad witnesses for their #emph[original pre-modification] fields.
    Namely, there are $k + 1$ $\( l + v_0 \)$ cap groups, transverse throughout their supports with determinant at
    least $Lambda^(- C_k v_0)$, each having magnitude at least $Lambda^(- C_k v_0) r_(i \, l)
    b_(tau_l) \( Z \)$ at a point within native distance $Lambda^(C_k v_0)$ of the cell.]
  #emph[The high root set loses only a vanishing fraction, and Lemmas 19 and 20 apply to the modified tree with
    the same recorded occupancy sizes. This construction is made for one fixed block at a time;
    no simultaneous assertion over all blocks is needed.]
] <f:angular>

#proof[
  Suppress the field index. In the native coordinates of $tau_l$, use macro boxes of side $Lambda^(3 u)$.
    The endpoint descendant weights, divided by the weight of $tau_l$, vary within bounded factors on these boxes:
    all affected cell widths and durations are at most $Lambda^(2 u + o \( 1 \))$,
    and the endpoint is separated by $C u$. If a transition ancestor occurs, clip each entire bin proportionally.
  For each mesh value $v$, greedily remove all $\( l + v \)$ caps intersecting an enlarged hyperplane neighborhood
    whose reference measure is at least $Lambda^(- 2 eta v)$.
    There are at most $O \( Lambda^(2 eta v) \)$ choices, and the residue has the desired upper bound before
    normalization. Carry out the omissions from coarser to finer mesh values,
    so earlier omissions only restrict subsequent masks.
  We verify that their contribution at level $l$ is cheap. Let $q' = 2 \( k + 1 \) \/ \( k - 1 \) > q$,
    the lower-dimensional exponent. The original selected budget at $l + v$ is bounded by
  $ Q_(q' \, l + v) lt.eq Lambda^(o \( 1 \)) r_(l + v)^(q' - q) D . $
  This follows from the recorded ratio class, before any modification.
    The plate-supported version of Proposition 7 at exponent $q'$ propagates each omitted hyperplane contribution
    through #emph[all] intervening masks. Plate support is inherited by each descendant in its own normalized
    coordinates. Summing the omitted planes costs at most $Lambda^(2 eta q' v)$.
    On the active $l$ masks, Hölder with measure $b_T^2 \| T \|$ and $sum b_T^2 \| T \| lt.eq
    Lambda^(o \( 1 \)) D r_l^(- q)$ gives
  $ Q_(q \, l) \( upright("error") \) & lt.eq #scale(x: 120%, y: 120%)[\(] Lambda^(2 eta q' v + o \( 1 \))
    r_(l + v)^(q' - q) D #scale(x: 120%, y: 120%)[\)]^(q \/ q') #scale(x: 120%, y: 120%)[\(] Lambda^(o \( 1 \)) D
    r_l^(- q) #scale(x: 120%, y: 120%)[\)]^(1 - q \/ q')\
 & lt.eq D Lambda^(2 eta q v + o \( 1 \)) \( r_(l + v) \/ r_l \)^(q \( q' - q \) \/ q') . $
  Choose $2 eta < x \( q' - q \) \/ \( 2 q' \)$. The profile assumption then makes this a negative fixed power
    budget, and Lemma 17 discards it at the root. Earlier restrictions are harmless:
    use actual modified amplitudes when propagating, and bill the initial restricted subfields to their original
    fine budgets.
  We include the localization justification for the fact that the direction subsets can vary by macro box.
    Assign each $l$ packet by its center to such a box and alter the field #emph[before] its Schwartz packet
    cutoff. No rough physical cutoff is inserted. At a single hierarchy step,
    packets centered away from a target macro box have an arbitrarily large fixed inverse polynomial box-distance
    gain, by their cutoff and supremum tails. The denominator weights may be left in the child coordinates,
    using 11; one need not compare them across an entire macro box.
    These gains form a summable convolution in macro offsets. An equivalent algebraic formulation is useful.
    For a summable polynomial macro weight $Psi$ and exponent $p > 2$, replace
  $ b_T quad upright("by") quad b_T Psi \( z_T \)^(- 1 \/ \( p - 2 \)) . $
  Then $a_T^p b_T^(2 - p)$ acquires exactly the factor $Psi \( z_T \)$.
    Polynomial comparability of $Psi$ requires only a fixed additional edge-decay margin,
    since all affected widths are below the macro scale. Use this for $p = q \, q'$ at each step;
    the same margin suffices at every depth. Summing the target-box estimates bills each initial packet with
    bounded total weight. This proves the stated norm charge for varying direction restrictions,
    and also proves the fresh restricted-weight norm bound used in Lemma 19.
  For broad witnesses, use separately macro boxes of side $Lambda^(3 v_0)$ #emph[before] modifying directions.
    In each box mark a group at level $l + v_0$ if its original contribution through the frozen intervening masks
    has supremum at least $Lambda^(- C_k v_0) r_l b_(tau_l)$ in a fixed enlargement.
    There are at most $Lambda^(k v_0 + o \( 1 \))$ groups, so for $C_k$ sufficiently large the unmarked sum cannot
    supply a high witness defining an active $l$ packet. The far-supremum deletion in Lemma 17 ensures such a
    witness occurs within the stated enlargement.
  The elementary maximal-simplex test gives a dichotomy for the marked centers:
    either $k + 1$ of them have successive affine widths at least a constant times $Lambda^(- v_0)$,
    or all marked centers lie in a constant enlargement of a hyperplane strip of that width.
    In the first case the determinant is at least a fixed power of $Lambda^(- v_0)$;
    enlarge the separation constants so it holds uniformly on the chosen supports.
    In the second case the same $q'$ calculation shows that the marked contribution is cheap at level $l$.
    Thus the nonbroad masks themselves have negligible weighted $q$ budget and may be deleted first.
  Finally reconstruct the positive path law for the modified fields, as in Lemma 19.
    Low total path mass is exceptional by its fresh norm bound.
    Its conditional law is dominated by the surviving reference descendant weights divided by
    $b_(tau_l)^2 \( Z \)$; the typical reverse cap comparison loses only a subpower.
    The heavy strip cutoff $Lambda^(- 2 eta v)$ therefore implies the claimed $Lambda^(- eta v + o \( 1 \))$
    angular bound. Occupancy upper bounds still refer to the same frozen masks,
    and the charging proof of (3.21) is unchanged. The broad witnesses used later are the recorded original
    subfields, whose selected amplitudes remain available for norm and square estimates. ◻
]

=== 3.6 Ball inflation and the two allowed slopes <ball-inflation-and-the-two-allowed-slopes>

#thm([Lemma 3.9.])[
  (Ball inflation in a cap).  #emph[Work inside a cap $tau_l$ of the preceding lemma, and suppose $f \( l + v \) -
    f \( l \) = - x v + O \( epsilon u \)$ on the required finite mesh in $\[ 0 \, 2 u \]$.
    Put $d_0 = 1 - 2 x \/ k$. For the isotropic cell $Q_v$ of radius $Lambda^v$ in this cap’s native coordinates,
    define the sampled effective occupancy
$ N_v = Pr \( Q_v \( Z \) divides tau_l \) \/ Pr \( Z divides tau_l \) . $

 For $u lt.eq v lt.eq 2 u$ on that mesh,
#[#set math.equation(numbering: n => "(3.23)")
 $ log_Lambda \( N_v \/ M_l \) lt.eq \( k + 1 \) d_0 v + O \( epsilon u \) . $ <f:inflation-occupancy>]

 The error can be made arbitrarily small by taking the broad precision $v_0 \/ u$ small, refining the finite mesh,
   and then taking the sequence limit. All spatial tests stay on one side of the transition seam.]
] <f:inflation>

#proof[
  Every point under the cap conditioning is near an active $l$ cell.
    Such a cell has at most $Lambda^(o \( 1 \)) M_l$ eligible points.
    Path domination, the typical reverse cap comparison, and background variation bound their relative conditional
    weights by subpowers. It therefore suffices to count active $l$ cells in an isotropic ball.
    They have the original broad witnesses from Lemma 21. Pigeonholing the separated tuple costs
    $Lambda^(O_k \( v_0 \))$, since there are only a fixed power of $Lambda^(v_0)$ possible labels.
  Write $kappa_s = Lambda^s$ in the $l$ coordinates and, for the $j$th broad group,
    let $cal(E)_(j \, s)$ be the local square sum of the original selected packet amplitudes with their native
    weights at relative scale $s$. The witness inequalities, including their allowed offsets,
    imply at every counted unit cell
  $ r_l b_(tau_l) \( Z \) lt.tilde Lambda^(O_k \( v_0 \) + o \( 1 \)) product_(j = 1)^(k + 1)
    cal(E)_(j \, v_0)^(1 \/ \( 2 \( k + 1 \) \)) . $
  Masks between $l$ and $l + v_0$ have bounded absolute sums, and the native weights absorb the witness offsets.
    The background $b_(tau_l)$ is comparable over the larger test ball.
  For $s < t lt.eq 2 s$, average the resulting product of squares with exponents $1 \/ k$ on a $kappa_t$ ball.
    Proposition 3 gives
  #[#set math.equation(numbering: n => "(3.24)")
   $ frac(1, \| B_(kappa_t) \|) integral_(B_(kappa_t)) product_(j = 1)^(k + 1) cal(E)_(j \, s)^(1 \/ k) lt.tilde
     Lambda^(O_k \( v_0 \)) product_(j = 1)^(k + 1)
     (frac(1, \| C B_(kappa_t) \|) integral_(C B_(kappa_t)) cal(E)_(j \, s))^(1 \/ k) . $ <f:one-inflation>]
  Indeed these are nonnegative sums essentially constant on tubes of width $kappa_s$ and duration $kappa_s^2 gt.eq
    kappa_t$. On the ball replace them by columns crossing the ball, where each envelope is comparable.
    Such a column costs a cross section of width $kappa_s$ times length at least $kappa_t$ in the enlarged-ball
    average. The quantitative determinant factor is $Lambda^(O_k \( v_0 \))$.
    Weighted offsets are summed with the fixed integrable envelope powers.
  We verify that each last average is bounded by the corresponding $cal(E)_(j \, t)$,
    even when intermediate mask levels are skipped. This verification prevents an aspect-ratio loss.
    Put $S_0 = kappa_s$ and $T_0 = kappa_t$. Reproduction in the native $s$ coordinates bounds the square of a
    weighted local supremum by a normalized weighted $L^2$ integral of the pre-cutoff field.
    After summing $s$ cells, the displacements from an averaged point have the form
  $ \( S_0 U + 2 v_s S_0^2 w \, S_0^2 w \) \, wide upright("density") med lt.eq C \( 1 + \| U \| + \| w \| \)^(- P) . $
  For each fixed displacement and time, integrate in space over width $T_0$,
    replacing the ball by a smooth polynomial weight. Remove the next mask by its bounded sup norm and separate
    its immediate child caps by spatial almost orthogonality;
    localization at width $T_0$ preserves bounded Fourier overlap. Iterate in the actual order of the masks.
    Translated band-limited cutoffs positive on boxes prove the same assertion for the polynomial weight.
    At the final layer, pointwise Cauchy bounds the fields by the $t$ packet envelopes.
  In the frame of a final $t$ cap, the normalized shift just displayed has sizes
  $ \( S_0 \/ T_0 \) \( U + O \( 1 \) w \) \, wide \( S_0 \/ T_0 \)^2 w \, $
  because its velocity differs from $v_s$ by $O \( S_0^(- 1) \)$.
    Convolution with this contracted shift density preserves the order $P$ of the final weight by the distance and
    volume comparison in 11. The auxiliary spatial ball weight has all the finitely many moments needed for this
    comparison. Thus no factor depending on $T_0 \/ S_0$ is lost.
    One can use the same fixed $P$ at each inflation step, with a fixed excess supremum margin.
  At the terminal scale, the recorded ratio class and weight convolution give
  $ cal(E)_(j \, v) lt.tilde Lambda^(o \( 1 \)) r_(l + v)^2 b_(tau_l)^2 \( Z \) . $
  Iterate (3.24) along a finite chain from $v_0$ to $v$, each step satisfying $s < t lt.eq 2 s$.
    There are $O \( 1 + log \( v \/ v_0 \) \)$ steps; covering larger balls by smaller balls at each step gives
    the cell-count bound
  $ Lambda^(\( k + 1 \) v + O_k \( v_0 log \( v \/ v_0 \) \) + o \( 1 \)) \( r_(l + v) \/ r_l \)^(p_k) . $
  Since $p_k x = \( k + 1 \) \( 1 - d_0 \)$, this proves (3.23).
    The finite mesh can include the whole inflation chain from the outset,
    and $v_0 \/ u$ can be as small as needed before taking logarithmic limits. ◻
]

#thm([Proposition 3.10.])[
  (Binary slope rigidity).  #emph[Every profile satisfies
#[#set math.equation(numbering: n => "(3.25)")
 $ f'_i \( s \) in { 0 \, - k \/ 2 } quad upright("for almost every ") s . $ <f:binary-eq>]

]
] <f:binary>

#proof[
  Suppose a differentiability point, away from the transition seam, has slope $- x$ with $0 < x < k \/ 2$.
    Choose a short rational block based at $l$ very near this point and a finite relative mesh so that
    $f \( l + v \) - f \( l \) = - x v + O \( epsilon u \)$ throughout $\[ 0 \, 2 u \]$.
    Differentiability allows errors arbitrarily small relative to every mesh spacing.
    Put $d_0 = 1 - 2 x \/ k in \( 0 \, 1 \)$ and apply the angular test with its fixed positive exponent,
    together with the broad-witness test at a much smaller $v_0$.
  Condition on $tau_l$ and $Q_(2 u)$. Rescale this parent isotropically to bounded size and write $Delta =
    Lambda^(- u)$. The information of the fine isotropic cell is
  $ log_Lambda \( N_(2 u) \/ N_u \) + o \( 1 \) . $
  Projecting parallel to a drawn direction gives information
  $ log_Lambda \( N_(2 u) \/ M_(l + u) \) + o \( 1 \) . $
  Its inverse-image cells, clipped to the parent, are comparable to $T_(l + u)$:
    transverse width is $Lambda^u$ and length is $Lambda^(2 u)$. Thus Lemma 19 gives the second formula.
    Adding independent directions costs $o \( 1 \)$ information by Lemma 20,
    because all directions in $tau_l$ drift by at most the endpoint width on this box.
  Draw $k + 1$ directions conditionally independently. The angular test shows, with probability tending to one,
    that their lifted vectors form a basis with inverse norm at most $Lambda^(O \( epsilon u \))$.
    Indeed expose them successively; proximity to the span of the previous ones is an affine hyperplane-strip
    event in the frequency coordinates, and use one mesh precision much smaller than $u$.
    In this basis each projection records all but one coordinate, up to the same precision loss.
    Order the coordinates once and use the chain rule for their information.
    The information of a coordinate conditioned on all its predecessors is no larger,
    up to the sampled $O \( epsilon u \)$ slack of Lemma 20, than its information when one predecessor has been
    omitted. Each coordinate is counted $k$ times in the $k + 1$ projections.
    This is the finite-partition Loomis–Whitney information inequality, and gives
  $ log_Lambda \( N_(2 u) \/ M_(l + u) \) gt.eq frac(k, k + 1) log_Lambda \( N_(2 u) \/ N_u \) - O \( epsilon u \) . $
  The sample form follows from Markov’s inequality for the finitely many conditional probability ratios,
    as in the proof of Lemma 20; no uniform pointwise entropy inequality is being asserted.
  Let $g \( v \) = log_Lambda \( N_v \/ M_l \)$. The ratio definition gives
  $ log_Lambda \( M_(l + u) \/ M_l \) = \( k + 2 \) u + q \( f \( l + u \) - f \( l \) \) = \( k + 2 \) d_0 u +
    O \( epsilon u \) . $
  The preceding inequality becomes
  $ g \( 2 u \) + k g \( u \) gt.eq \( k + 1 \) \( k + 2 \) d_0 u - O \( epsilon u \) . $
  Lemma 22 bounds $g \( u \)$ and $g \( 2 u \)$ above by $\( k + 1 \) d_0 u$ and $2 \( k + 1 \) d_0 u$,
    respectively. Their weighted sum is exactly the last right side.
    Hence both upper bounds are equalities up to $O \( epsilon u \)$.
  We now apply the robust discretized projection theorem in Proposition 4, with ambient dimension $k + 1$,
    projection dimension $k$, and $alpha = \( k + 1 \) d_0 in \( 0 \, k + 1 \)$.
    We give the set extraction because exceptional points can depend on direction.
    Choose a cap and parent box with conditional success probability close to one for all the finite comparisons.
    Within this fixed cap and parent box, the probabilities of typical $Delta$ cells,
    without conditioning on the drawn direction, lie between $Delta^(alpha + O \( epsilon \))$ and
    $Delta^(alpha - O \( epsilon \))$. Take their centers to form one set $cal(A)$. It is $Delta$ separated and
  $ Delta^(- alpha + O \( epsilon \)) lt.eq \| cal(A) \| lt.eq Delta^(- alpha - O \( epsilon \)) . $
  For coarser balls, the mesh instances of (3.23), divided by the saturated parent occupancy,
    give the probability upper bounds with exponent $alpha$. Passing from probability to number by the preceding
    individual-cell bounds gives precisely the nonconcentration inequalities for $cal(A)$,
    with $O \( epsilon \)$ exponent tolerance. Intermediate radii follow by nesting between consecutive mesh
    values, whose ratio is chosen sufficiently fine on the logarithmic scale.
  Restrict the joint position-direction law first to successful positions,
    then to directions for which conditional spatial and projected success have probability bounded below.
    Starting with success close to one makes both restrictions retain fixed positive mass.
    Mixing the conditional angular laws preserves their hyperplane nonconcentration,
    and these fixed-mass restrictions change it by only a constant.
    For every retained direction, its successful positions occupy at least $Delta^(O \( epsilon \)) \|
    cal(A) \|$ cells, because its conditional individual-cell probabilities have the same upper bound.
    The conditional projected information bound shows that these cells project to at most
  $ Delta^(- k d_0 - O \( epsilon \)) = Delta^(- k alpha \/ \( k + 1 \) - O \( epsilon \)) $
  projection cells. The direction law obeys the required Schubert nonconcentration:
    for lifted vectors $\( 2 xi \, 1 \)$, the relevant Schubert test is exactly an affine hyperplane-strip test on
    $xi$, up to fixed constants. The theorem supplies a fixed positive projection gain for every sufficiently
    large subset for some retained directions, contradicting this upper bound once $epsilon$ and the finite mesh
    tolerances are sufficiently small. All nonconcentration exponents were fixed using $x >
    0$ before $epsilon$ was sent to zero. This proves (3.25). ◻
]

=== 3.7 The location of the full-slope interval <the-location-of-the-full-slope-interval>

Call a differentiability parameter a #emph[full-slope point] if $f'_i = - k \/ 2$,
  and a zero-slope point if $f'_i = 0$. The logarithmic derivative of $M_(i \, s)$ is zero at the former and $k +
  2$ at the latter.

#thm([Lemma 3.11.])[
  (Midpoint closure).  #emph[For almost every pair $l < a$ of full-slope points in one field,
    $\( l + a \) \/ 2$ is a full-slope point. Consequently each field’s full-slope set is an interval modulo null
    sets. In the power case, if $a$ is a full-slope point in one field,
    then $a \/ 2$ is a full-slope point in every other field, for almost every such $a$.]
] <f:midpoint>

#proof[
  Use pairs for which all relevant parameters are differentiability points,
    avoiding the one possible transition seam. Fubini’s theorem permits this for almost every pair.
    Set $b = \( l + a \) \/ 2$ and choose $0 < eta lt.double sigma lt.double a - l$.
    By the angular test in a short block above $l$, two independently drawn paths inside $tau_l$ have velocity
    difference $Delta v$ satisfying
  $ kappa_i \( l \)^(- 1) Lambda^(- eta) lt.tilde \| Delta v \| lt.tilde kappa_i \( l \)^(- 1) $
  with probability tending to one. Work inside the second path’s parent tube at $b + sigma \/ 2$.
    Adding the first direction costs no logarithmic information by Lemma 20; the maximal relative drift there is
  $ kappa_i \( l \)^(- 1) kappa_i \( b + sigma \/ 2 \)^2 = kappa_i \( a + sigma \) \, $
  which is below the endpoint width when the block and $sigma$ are chosen in the interior.
    We used the exact scale identity $kappa_i \( b \)^2 = kappa_i \( l \) kappa_i \( a \)$.
  Suppose $b$ were a zero-slope point. The occupancy identity between its scales $b - sigma \/ 2$ and $b +
    sigma \/ 2$ gives information increment $\( k + 2 \) sigma + o \( sigma \)$.
    Spatial labels have at most $k sigma + o \( sigma \)$ information, so the time label has at least $2 sigma +
    o \( sigma \)$.
  On the other hand, a spatial intercept label for the first path at scale $a -
    sigma$ almost determines this time label. The spatial uncertainty in the second parent is
    $kappa_i \( b + sigma \/ 2 \) lt.double kappa_i \( a - sigma \)$.
    Once the first intercept is specified to width $kappa_i \( a - sigma \)$,
    the relative motion determines time to accuracy at most
  $ C frac(kappa_i \( a - sigma \), \| Delta v \|) lt.eq C kappa_i \( l \) kappa_i \( a - sigma \) Lambda^eta =
    C kappa_i \( b - sigma \/ 2 \)^2 Lambda^eta . $
  There are therefore at most $Lambda^(eta + o \( 1 \))$ possible smaller time labels.
    The whole second parent meets only boundedly many first parents at $a + sigma$,
    by the preceding drift identity and the smaller time extent.
    Since $a$ is full slope, the first-path information increment from $a + sigma$ to $a -
    sigma$ is $o \( sigma \)$. It remains an upper bound after conditioning on the second parent,
    and the extra first-parent label has negligible cost. The chain rule would bound the second time-label
    information by $eta + o \( sigma \)$, contradicting $2 sigma + o \( sigma \)$.
    First let the sequence tend to its limit at fixed rational approximations, then let $eta \/ sigma arrow.r
    0$ and $sigma arrow.b 0$.
  In the power case repeat the same geometry with the second path in another field and with $l = 0$.
    Root transversality gives $\| Delta v \| gt.eq Lambda^(- o \( 1 \))$,
    so the same time-recovery bound holds and the drift is $O \( h^(a + sigma) \)$.
    The conditioning rule applies to the other field’s full weights.
    Full slope at $a$ in the first field therefore forces full slope at $a \/ 2$ in the second field.
  We finish with the measure-theoretic assertion. Let $E$ be a measurable set satisfying the midpoint rule for
    almost every pair of its points. For two density points $x \,
    y$ choose equally short intervals centered there on which $E$ has relative measure greater than $9 \/ 10$.
    The convolution of their restricted indicators is strictly positive on a neighborhood of $x + y$:
    after a small translation the two high-density subsets still intersect in positive measure.
    Fubini and the midpoint rule imply that a neighborhood of $\( x + y \) \/ 2$ belongs to $E$ modulo a null set.
    Taking $x = y$ shows that the density points form an open set modulo null sets; taking arbitrary $x \,
    y$ shows its midpoint convexity. Repeated midpoints, followed by openness,
    fill the interval between any two such points. Thus $E$ is an interval modulo null sets. ◻
]

In the power case let $s_H = lim log_h H_i$, the same for every field by (3.2).
  It is positive, since $A_i gt.eq h^c$. The endpoint values of $f_i$ and the two allowed slopes show that its
  full-slope interval has length $s_H$. If the left endpoints of these intervals had positive minimum,
  the cross-field halving rule would give a smaller left endpoint, a contradiction.
  An interval beginning at zero then forces every other interval to begin at zero by that rule. Therefore

#[#set math.equation(numbering: n => "(3.26)")
 $ f_i \( s_H \) = 0 quad upright("for every ") i . $ <f:power-end>]

The analogous subpower conclusion needs control at the unbounded left endpoint.
  We give the incidence calculation explicitly.

#thm([Lemma 3.12.])[
  (Cross-field one-step inflation).  #emph[Let $K lt.eq R lt.eq
    K^2$ be two inverse widths in a fixed finite packet tree.
    At scale $K$, let $W_j$, $1 lt.eq j lt.eq m = k + 1$, be the original selected packet fields testing the root
    high set, with no outer smaller-inverse-width mask. Each $W_j$ is assembled from exactly its selected
    scale-$R$ descendants through the frozen bounded masks and scale-$K$ localizers;
    no omitted branch contributes to $W_j$. The witnesses below test these same masked fields $W_j$.
    Suppose their frequency labels, including fixed enlargements, are $delta$-transverse.
    Write $cal(E)_(j \, K) = sum_T a_(j \, T)^2 w_T$ for their local square envelopes and $cal(E)_(j \, R)$ for
    the envelopes of their descendants at scale $R$ in the same frozen tree.
    Let $Y$ be a set of distinct unit cubes with separate field witnesses at thresholds $A_j$.
    Suppose that, on every $K$-ball meeting $Y$,
$ K^(k \/ 2) cal(E)_(j \, K) \( z \)^(1 \/ 2) \/ A_j lt.eq U \, wide 1 lt.eq j lt.eq m \, $

 at one, hence every, point $z$ in that ball, where $U gt.eq 1$.
   Then for every fixed $epsilon > 0$ and every $R$-ball centered at a surviving root point $z$,
#[#set math.equation(numbering: n => "(3.27)")
 $ \# \( Y ∩ B_R \( z \) \) lt.tilde_(epsilon \, cal(G)) delta^(- C_epsilon) U^epsilon R^(k + 1) product_(j = 1)^m
   #scale(x: 120%, y: 120%)[\(] cal(E)_(j \, R) \( z \) \/ A_j^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ k) .
   $ <f:cross-field-inflation-bound>]

 The constant may depend on the fixed finite grid $cal(G)$, but not on the aspect ratio $R \/ K$.]
] <f:cross-field-inflation>

#proof[
  Cover $B_R \( z \)$ by boundedly overlapping $K$-balls $D$.
    On one meeting $Y$, the separate-unit-supremum form of 9, with $p = p_k + epsilon$,
    and comparability of packet envelopes on $D$ give
  $ \# \( Y ∩ D \) lt.tilde_epsilon delta^(- C_epsilon) K^(k p \/ 2) product_j #scale(x: 120%, y: 120%)[\(]
    cal(E)_(j \, K) \( z_D \) \/ A_j^2 #scale(x: 120%, y: 120%)[\)]^(p \/ \( 2 m \)) . $
  Since $k p_k \/ 2 = k + 1$ and $p_k \/ \( 2 m \) = 1 \/ k$, this is
  $ C_epsilon delta^(- C_epsilon) K^(k + 1) product_j #scale(x: 120%, y: 120%)[\(] cal(E)_(j \, K) \( z_D \) \/
    A_j^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ k)
    [K^(k \/ 2) product_j #scale(x: 120%, y: 120%)[\(] cal(E)_(j \, K) \( z_D \) \/ A_j^2
    #scale(x: 120%, y: 120%)[\)]^(1 \/ \( 2 m \))]^epsilon . $
  The bracket is at most $U$, up to a fixed factor. Summing over $D$ and replacing the sum by an integral uses
    only the fixed variation of each envelope on a $K$-ball.
  For these globally transverse groups, the local weighted cylinder consequence of 3 is
  $ frac(1, \| B_R \|) integral_(B_R) product_j cal(E)_(j \, K)^(1 \/ k) lt.tilde delta^(- C) product_j
    (frac(1, \| C B_R \|) integral_(C B_R) cal(E)_(j \, K))^(1 \/ k) . $
  To verify its normalization, expand the polynomial envelopes on $B_R$ into summably weighted translated columns
    of radius $K$. Their time length is at least $R$ because $R lt.eq K^2$.
    A column meeting the ball contributes a fraction comparable to $\( K \/ R \)^k$ of its coefficient to the
    average on a fixed enlargement. The radius-$K$ multilinear Kakeya estimate contributes $K^(k + 1)$; the $m =
    k + 1$ averages contribute $\( R \/ K \)^(k + 1)$, giving exactly $R^(k + 1)$.
    The fixed reserve in the packet envelope power sums the translated-column tails.
    This is the profile-free geometric calculation in (3.24), with the determinant factor now $delta^(- C)$.
  For each field separately, the weighted spatial $L^2$ calculation following (3.24) gives
  $ frac(1, \| C B_R \( z \) \|) integral_(C B_R \( z \)) cal(E)_(j \, K) lt.tilde_(cal(G)) cal(E)_(j \, R) \( z \) . $
  Indeed reproduce the coarse weighted suprema, remove each intervening bounded mask before separating its
    immediate child caps by spatial almost orthogonality, and then use the final $R$-packet envelope.
    In the final cap frame the normalized shift has sizes
    $\( \( K \/ R \) \( U_0 + O \( 1 \) w \) \, \( K \/ R \)^2 w \)$,
    so convolution preserves the same fixed polynomial weight,
    as in the calculation preceding (3.24) and following it. No power of $R \/ K$ is lost.
    Combining these estimates proves (3.27). ◻
]

#thm([Lemma 3.13.])[
  (Vanishing left limit).  #emph[In the subpower case,
#[#set math.equation(numbering: n => "(3.28)")
 $ lim_(s arrow.r - oo) d_i \( s \) = 0 quad upright("for every ") i . $ <f:left-limit-eq>]

 Consequently $f_i \( 0 \) = 0$, including when $e_i = 0$.]
] <f:left-limit>

#proof[
  Use the path law without an extra angular test, retaining each path’s attachment to an original surviving $H_i$
    mask. Fix a field, write $H = H_i$, $K = H S^s$, and let $mu_z$ be the original local direction law at a
    typical root point $z$. The clipped cap bound and path domination give the slot estimate
  #[#set math.equation(numbering: n => "(3.29)")
   $ mu_z \( B \( omega \, r \) \) lt.tilde S^(C + o \( 1 \)) r^k \, wide r gt.eq K^(- 1) . $ <f:slot>]
  Indeed a slot at inverse width $K$ contains at most its frequency volume times $H^k$,
    up to the appropriate bounded grid enlargement, transition bins,
    each with clipped weight at most $H^(- k) S^(C_3)$; path normalization loses only a subpower.
    The same bound summed over slots proves the displayed formula.
  There is also a lower bound at a typical sampled direction, simultaneously at all relevant radii:
  #[#set math.equation(numbering: n => "(3.30)")
   $ mu_z \( B \( omega \, r \) \) gt.tilde S^(- 1) r^k . $ <f:angular-typical-lower>]
  To prove this without a number-of-radii loss, remove maximal dyadic cubes on which the measure is less than $c
    S^(- 1)$ times volume. The maximal cubes are disjoint and lie in a bounded frequency region,
    so their total measure is $O \( S^(- 1) \)$. Use finitely many shifted dyadic grids to put a comparable cube
    containing $omega$ inside any ball in question. Every violating ball is thereby charged to one of the removed cubes.
  Let $y in Y$ and $tau = \| t_y - t_z \|$. The probability, under the typical-direction restriction,
    that $y$ belongs to the sampled enlarged $K$ tube is at most
  #[#set math.equation(numbering: n => "(3.31)")
   $ S^(C + o \( 1 \)) \( K \/ tau \)^k . $ <f:smalltube-hit>]
  Only $tau lt.tilde K^2 S^(o \( 1 \))$ matters. Hence the angular window $K \/
    tau$ is no smaller than the slot precision up to a subpower, and (3.29) proves the bound.
  If this event is nonempty, choose a typical direction $omega_0$ realizing it.
    Every original path with direction within $c min \( 1 \, H \/ tau \)$ of $omega_0$ has its attached enlarged
    $H$ mask containing $y$. Those masks are already near $z$, the extra transverse displacement is $O \( H \)$,
    and their enlarged duration contains the relevant time interval. Thus (3.30) gives
  $ Pr_(upright("original")) { y upright(" hits the attached enlarged ") H upright(" mask") } gt.tilde
    S^(- 1 - o \( 1 \)) min \( 1 \, H \/ tau \)^k . $
  For $tau gt.eq K S^(C_4)$, divide (3.31) by this last bound.
    For $tau lt.eq H$ use $K \/ tau lt.eq S^(- C_4)$; for $tau gt.eq H$ use $K \/ H = S^s$. This gives the ratio bound
  $ S^(C + 1 + o \( 1 \)) #scale(x: 120%, y: 120%)[\(] S^(- k C_4) + S^(k s) #scale(x: 120%, y: 120%)[\)] . $
  Sum this comparison #emph[once] over $y$. Every attached original mask has occupancy at most $S^(C_1)$ by the
    deletion preceding (3.7). Therefore
  $ bb(E) \[ upright("occupancy at time distance ") gt.eq K S^(C_4) \] lt.tilde
    S^(C + C_1 + 1 + o \( 1 \)) \( S^(- k C_4) + S^(k s) \) = o \( 1 \) $
  for sufficiently large fixed $C_4$ and $s < - 2 C_4$. There is no iteration over a number of intermediate scales.
  The occupancy identity (3.21), together with the typical leaf probability comparisons,
    turns its effective occupancy into an ordinary count up to $S^(o \( 1 \))$.
    With probability tending to one there are no far points, so a ball of radius $O \( K S^(C_4) \)$ contains at least
  #[#set math.equation(numbering: n => "(3.32)")
   $ M_(i \, s) S^(- o \( 1 \)) = S^(q d_i \( s \) - o \( 1 \)) $ <f:left-lower>]
  root points. The identity is exact on the logarithmic scale:
  $ M_(i \, s) = \( H_i S^s \)^(k + 2) \( S^(f_i \( s \)) \/ H_i^(k \/ 2) \)^q = S^(q d_i \( s \)) \, $
  because $k q \/ 2 = k + 2$.
  For the upper bound use a common ball scale at $s' = s + C_4 + 1 < 0$.
    The inverse widths in the fields differ by only subpowers, by (3.15).
    Choose a common first width below all field-specific first widths and a common terminal width above all
    field-specific terminal widths, each within an $S^(o \( 1 \))$ factor.
    Inserting these levels into the fixed grid preserves the tested field;
    the local polynomial-weight convolution and bounded-multiplicity comparison in 11 change its square-envelope
    bounds by at most $S^(o \( 1 \))$. Begin at the first gap-edge parameter $s_min lt.eq
    s$ of a fixed finite grid, where no earlier smaller-inverse-width masks intervene.
    Write $cal(E)_(j \, s) \( z \) = sum_T a_(j \, T)^2 w_T \( z \)$ for the local square envelope of the original
    selected outputs at that layer; this is distinct from the integrated energy $E_(j \, s)$ in (3.17).
    On every first-edge ball carrying witnesses, the selected ratio class and clipped square give
    $kappa \( s_min \)^(k \/ 2) cal(E)_(j \, s_min)^(1 \/ 2) \/ A_j lt.eq S^C$:
    the remaining exponent is $d_j \( s_min \) lt.eq k e_j \/ 2$. The transversality loss is $S^(o \( 1 \))$.
    We may apply 25 once from this first edge to $s'$, because for every fixed finite range
  $ frac(kappa \( s_min \)^2, kappa \( s' \)) = H_i S^(2 s_min - s') arrow.r oo . $
  Here $H_i$ grows faster than every fixed power of $S$. The single step keeps the determinant power and the
    $epsilon$ cost independent of grid length. At the root-centered terminal ball, $cal(E)_(j \, s') lt.eq
    S^(o \( 1 \)) r_(j \, s')^2$ by the clipped square bound. Substitution in (3.27) gives the count upper bound
  #[#set math.equation(numbering: n => "(3.33)")
   $ S^(o \( 1 \) + C epsilon) kappa \( s' \)^(k + 1) product_j \( cal(E)_(j \, s') \/ A_j^2 \)^(1 \/ k) & lt.eq
     S^(\( k + 1 \) s' + \( 2 \/ k \) sum_j f_j \( s' \) + o \( 1 \) + C epsilon)\
 & = S^(frac(p_k, k + 1) sum_j d_j \( s' \) + o \( 1 \) + C epsilon) . $ <f:left-upper>]
  The $H_j$ factors cancel since their ratios are subpowers.
    Take limits for this finite comparison and then send $epsilon$ to zero. Equations (3.32) and (3.33) yield
  $ q d_i \( s \) lt.eq frac(p_k, k + 1) sum_j d_j \( s + C_4 + 1 \) . $
  By (3.19), every $d_i$ is bounded, nonnegative, and nondecreasing. Let $L_i = lim_(s arrow.r - oo) d_i \( s \)$.
    Sending $s$ to $- oo$ and summing the preceding inequalities gives
  $ \( q - p_k \) sum_i L_i lt.eq 0 . $
  Since $q > p_k$ and $L_i gt.eq 0$, all the limits vanish.
  The full-slope interval must extend to the unbounded left endpoint:
    otherwise $f_i$ is constant sufficiently far to the left and $d_i \( s \) = f_i \( s \) +
    k s \/ 2$ becomes negative. On this interval $d'_i = 0$, so the just proved limit gives $d_i = 0$.
    After its right endpoint $f_i$ is constant, and its fine endpoint value makes that constant zero.
    Continuity at the right endpoint therefore places it at $s = 0$.
    If the full-slope interval fills the domain, the endpoint value instead gives $e_i = 0$.
    In either case $f_i \( 0 \) = 0$. ◻
]

The profiles forced by these arguments are shown in 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.65, 3.15), [#text(size: 9pt)[Power case: $Lambda =h$]])
  content((1.65, 2.72), [#text(size: 9pt)[$kappa_i(s)=h^s$]])
  line((-0.15, 0), (3.85, 0), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((3.85, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.15), (0, 2.45), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((0, 2.45), [#text(size: 9pt)[$f_i(s)$]], anchor: "south-east", padding: 0.1176cm)
  line((0, 2.1), (2.25, 0), (3.5, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  merge-path({line((0, 2.1), (2.25, 0)); line((2.25, 0), (3.5, 0))}, close: false, fill: rgb("#0000a6"), stroke: none)
  circle((0, 2.1), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((2.25, 0), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((3.5, 0), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  content((0, -0.06), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((2.25, -0.06), [#text(size: 9pt)[$s_H$]], anchor: "north", padding: 0.1176cm)
  content((3.5, -0.06), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((0.85, 1.38), [#text(size: 9pt)[slope $-k"/"2$]], anchor: "south-west", padding: 0.1176cm)
  content((1.65, -0.75), [#text(size: 9pt)[$f_i(s)= frac(k, 2) (s_H-s)_+$]])
  content((1.65, -1.35), [#text(size: 9pt)[$0 lt.eq s lt.eq 1, 0<s_H lt.eq 1$]])
  content((8.15, 3.15), [#text(size: 9pt)[Subpower case: $Lambda =S$]])
  content((8.15, 2.72), [#text(size: 9pt)[$kappa_i(s)=H_"iS"^s$]])
  line((5.55, 0), (10.2, 0), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((10.2, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  line((8.15, -0.15), (8.15, 2.45), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((8.35, 2.1), [#text(size: 9pt)[$f_i(s)$]], anchor: "west", padding: 0.1176cm)
  line((5.9, 2.1), (8.15, 0), (9.65, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (start: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  circle((8.15, 0), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((9.65, 0), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  line((8.15, 0), (9.65, 0), fill: rgb("#0000a6"), stroke: none)
  content((8.15, -0.06), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((9.65, -0.06), [#text(size: 9pt)[$e_i$]], anchor: "north", padding: 0.1176cm)
  content((6.85, 2.3), [#text(size: 9pt)[slope $-k"/"2$]])
  content((8.15, -0.75), [#text(size: 9pt)[$f_i(s)=(-"ks""/"2)_+$]])
  content((8.15, -1.35), [#text(size: 9pt)[$- infinity <s lt.eq e_i, e_i gt.eq 0$]])
})],
  caption: [Figure 1: The forced amplitude-ratio profiles $r_(i \, s) = Lambda^(f_i \( s \) + o \( 1 \))$. Their shapes follow from Lemma 3.5, Proposition 3.10, Lemma 3.11, (3.26), and 26. The panels show generic cases; the terminal flat segment may collapse at $s_H = 1$ or $e_i = 0$, respectively. The subpower domain continues to the left without a finite endpoint. The recomputed transition ratio is $Lambda^(o \( 1 \))$ in both cases, as used in the final incidence contradiction. ],
) <f:profiles-figure>

=== 3.8 The final incidence contradiction <the-final-incidence-contradiction>

We finish the proof of Theorem 14. In the power case (3.26) says that the recomputed transition ratio is
  $Lambda^(o \( 1 \))$; in the subpower case the same assertion follows from Lemma 26.
  The original transition masks have remained fixed throughout.

One final occupancy deletion makes the use of packet tails independent of any convergence rate for the profiles.
  Fix an arbitrarily small $eta > 0$ and enlarge transition cells by $Lambda^eta$ in their native coordinates.
  In the power case count all visits. In the subpower case count points with $e_b^2 \( z \) lt.eq
  C M_c Lambda^(C_0 eta)$, where $C_0$ is sufficiently large for polynomial weight comparison.
  This includes every neighbor of a surviving original mask.
  The incident squares sum to at most $Lambda^(C_2 eta + o \( 1 \)) \| Y \|$.
  Since the transition ratio is $Lambda^(o \( 1 \))$ and $H_i^(k + 2) A_i^(- q) = 1$,
  the weighted $q$ charge of cells with more than $Lambda^(C'_1 eta)$ visits is at most

$ Lambda^(\( C_2 - C'_1 \) eta + o \( 1 \)) D_i . $

Choose $C'_1 > C_2$ sufficiently large. Lemma 17 propagates this error to the root with a negative power saving.
  Do not reselect ratios after this deletion: all other transition fields remain the same.
  The fixed packet decay, with the square bound at surviving masks,
  makes tails outside the chosen radius negligible relative to the high threshold.
  Thus each remaining root point receives a substantial contribution from nearby transition masks,
  each visited at most $Lambda^(C'_1 eta)$ times.

The field threshold is $A_i Lambda^(- o \( 1 \)) = H_i^(k \/ 2) Lambda^(- o \( 1 \))$.
  At a root point the square sum of the transition backgrounds is $Lambda^(o \( 1 \))$,
  and each transition amplitude is at most its background times $Lambda^(o \( 1 \))$.
  Weighted Cauchy and bounded absolute sums of the ancestor cutoffs therefore require at least $H_i^k
  Lambda^(- o \( 1 \))$ nearby active masks. Letting the fixed $eta$ be arbitrarily small,
  double counting visits gives at least

$ \| Y \| H_i^k Lambda^(- o \( 1 \)) $

distinct original transition masks.

Choose a field with $S_i = S$. Each of these masks had original amplitude $a_T^(upright("orig")) gt.eq
  c S H_i^(- k \/ 2)$ in (3.3), and their original integrated square budget is bounded by (3.5). Hence

$ D_i gt.tilde H_i^(k + 2) #scale(x: 120%, y: 120%)[\(] \| Y \| H_i^k Lambda^(- o \( 1 \))
  #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] S^2 H_i^(- k) #scale(x: 120%, y: 120%)[\)] = \| Y \|
  H_i^(k + 2) S^2 Lambda^(- o \( 1 \)) . $

This contradicts (3.2) in the power case, because $S$ is a fixed positive power of $Lambda = h$,
  and contradicts (3.15) in the subpower case, because $S = Lambda$. The exact-packet estimate follows.
  Lemma 15 transfers it to compact profiles and fixes a finite derivative order after all the fixed weight margins
  have been chosen. The countersequence construction proves the uniform quantitative form $C
  delta^(- C)$ in (3.1), completing the proof.

== 4 Fractal norms, compact arrays, and norm transport <d:section>

From this point the spatial dimension is $n gt.eq 3$. This section supplies a weighted fractal estimate with an
  occupancy gain and a power saving for frequency supports near affine $\( n - 2 \)$-planes.
  In Section 5, these bounds will locate densely occupied boxes and then permit pruning of the incident tube
  families so that their direction laws do not concentrate near such planes. We use

#[#set math.equation(numbering: n => "(4.1)")
 $ beta = frac(2, n + 1) \, wide e = frac(n^2, n + 1) \, wide gamma_n =
   frac(2 n, \( n + 1 \) \( n + 2 \)) . $ <d:exponents>]

The exponent $beta$ is the measure homogeneity in the fractal square norm.
  Keeping that homogeneity explicit will distinguish a genuine sparsity gain from a change of normalization.

=== 4.1 Arrays and measures <arrays-and-measures>

#prodef([Definition 4.1.])[
  (Normalized compact arrays and admissible measures).  A compact array of scale $L gt.eq 1$ is a finite sum
  #[#set math.equation(numbering: n => "(4.2)")
   $ U \( x \, t \) = sum_alpha c_alpha L^(- n \/ 2) e^(i \( x dot.op omega_alpha - t \| omega_alpha \|^2 \))
     phi.alt_alpha #h(-0.16667em) (frac(x - y_alpha - 2 t omega_alpha, L) \, t / L^2) . $ <d:array>]
  The frequencies $omega_alpha$ belong to a fixed bounded box.
    The native profiles $phi.alt_alpha$ are supported in a fixed box and have uniform bounds for derivatives
    through a prescribed sufficiently large finite order. The number of labels
    $\( L omega_alpha \, y_alpha \/ L \)$ in every unit phase-space ball is bounded by a fixed constant.
    Its coefficient energy is $E \( U \) = sum_alpha \| c_alpha \|^2$.
    Subarrays retain their original profiles and labels.
  A nonnegative Borel measure $mu$ has $n$-dimensional growth with parameter $m$ if
  #[#set math.equation(numbering: n => "(4.3)")
   $ mu \( B \( z \, r \) \) lt.eq m r^n wide \( z in bb(R)^(n + 1) \, med r gt.eq 1 \) . $ <d:ball-growth>]
  At array scale $L$ its native time range is bounded by a fixed constant, so $"supp" mu subset { \| t \| lt.eq
    C L^2 }$ after a common time translation. Fix a sufficiently large $M$.
    The tube moment condition with sparsity parameter $D$ is
  #[#set math.equation(numbering: n => "(4.4)")
   $ integral (1 + frac(\| x - y_alpha - 2 omega_alpha t \|, L))^(- M) thin upright(d) mu \( x \, t \) lt.eq
     frac(m L^(n + 1), D) quad upright("for every included label ") alpha . $ <d:tube-moment>]
  We use half-open unit cubes for all measure sums, so their masses add without boundary ambiguity.
] <d:measure>

To compare these conventions with 2, set $k = n$ and $N = L$,
  and let $C_(upright("prof"))$ be a fixed common bound for the required native-profile derivatives.
  The choice $s_alpha = C_(upright("prof")) L^(- n \/ 2) \| c_alpha \|$ is admissible,
  so the packet energy parameter in (2.5) is $C_(upright("prof"))^2 L^2 E \( U \)$.
  This is a normalization of packet sizes, not a spacetime orthogonality assertion.
  The parameter $D$ in (4.4) measures sparsity.

At any fixed bounded native time, transporting the intercepts along their velocities preserves phase-space
  multiplicity: in the normalized label variables it is a linear shear with bounded operator norm and bounded
  inverse. In particular,

#[#set math.equation(numbering: n => "(4.5)")
 $ lr(bar.v.double U bar.v.double)_oo lt.eq C E \( U \)^(1 \/ 2) . $ <d:array-sup>]

Indeed only $O \( L^n \)$ frequency/intercept labels can meet a point in the fixed profile support;
  Cauchy–Schwarz cancels their square-root count against $L^(- n \/ 2)$.
  Condition (4.4) with $D = 1$ follows from (4.3), with fixed inflation of $m$.
  To see this, on the annulus of transverse radius $r = 2^a L$,
  the bounded-time tube is covered by $C \( 1 + L^2 \/ r \)$ balls of radius $C r$.
  Its mass is at most $C m \( r^n + L^2 r^(n - 1) \)$. Multiplication by $2^(- a M)$ and summation over $a gt.eq
  0$ give $C m L^(n + 1)$ when $M$ is sufficiently large.

For later use, if labels lie in a frequency cube of side $H^(- 1)$ centered at $v$, put

#[#set math.equation(numbering: n => "(4.6)")
 $ X_(H \, v) \( x \, t \) = (frac(x - 2 v t, H) \, t / H^2) . $ <d:parabolic-map>]

After removal of the common carrier, the field is $H^(- n \/ 2) U' \( X_(H \, v) \( x \, t \) \)$,
  where $U'$ has scale $L \/ H$, frequency $omega'_alpha = H \( omega_alpha - v \)$, intercept $y'_alpha =
  y_alpha \/ H$, the same $c_alpha$, and exactly the same native profile.
  Thus native regularity and normalized phase-space multiplicity are unchanged.

=== 4.2 The precise fractal input and its weighted form <the-precise-fractal-input-and-its-weighted-form>

Write

$ cal(E) g \( x \, t \) = \( 2 pi \)^(- n) integral e^(i x dot.op xi - i t \| xi \|^2) g \( xi \) thin upright(d)
  xi \, $

where $g in L^2$ is supported in a fixed bounded frequency box. Fixed changes of that box alter constants only.

#thm([Theorem 4.2.])[
  (Du–Zhang input in squared form).  #emph[Let $cal(Q)$ be a collection of distinct unit lattice cubes in a ball
    of radius $S gt.eq 1$. Suppose their counting function in every ball of radius $r gt.eq
    1$ is at most $Gamma r^n$, and their number in any ball of radius $sqrt(S)$ is at most $lambda_0$.
    Then for every $epsilon > 0$,
#[#set math.equation(numbering: n => "(4.7)")
 $ sum_(q in cal(Q)) sup_q \| cal(E) g \|^2 lt.eq C_epsilon S^epsilon Gamma^(4 \/ \( \( n + 1 \) \( n + 2 \) \))
   lambda_0^(gamma_n) S^(gamma_n) lr(bar.v.double g bar.v.double)_2^2 . $ <d:dz-sup>]

 All fixed enlargements and translations of the cube lattice are allowed, with fixed changes of the constant.]
] <d:dz-input>

#proof[
  The exact external input is #cite(label("DuZhang2019"), form: "prose") Theorem 1.6 with counting exponent $n$.
    On a union $X$ of unit cubes for which every occupied $sqrt(S)$ lattice parent has comparable occupancy
    $lambda$, it states
  $ lr(bar.v.double cal(E) g bar.v.double)_(L^2 \( X \)) lt.eq
    C_epsilon Gamma^(2 \/ \( \( n + 1 \) \( n + 2 \) \)) lambda^(n \/ \( \( n + 1 \) \( n + 2 \) \))
    S^(n \/ \( \( n + 1 \) \( n + 2 \) \) + epsilon) lr(bar.v.double g bar.v.double)_2 . $
  The original unit-ball frequency hypothesis is changed to our fixed box by a fixed parabolic dilation and
    bounded coverings. The same holds for balls with arbitrary centers by translating the extension,
    which only modulates its input. Squaring and renaming $epsilon$ gives the exponents in (4.7) for an integral
    over $X$. No comparable-field-norm assumption occurs in this theorem;
    that additional hypothesis belongs to Proposition 3.1 of the cited paper, which is not needed here.
  Choose a comparable ambient scale with a compatible square-root grid.
    Group whole square-root parents according to their dyadic occupancy.
    A parent is covered by boundedly many radius-$sqrt(S)$ balls, so its occupancy is at most $C lambda_0$.
    Each group inherits the counting bound. Sum the squared theorem over these groups;
    the resulting series $sum_(2^a lt.eq C lambda_0) 2^(a gamma_n)$ is bounded by $C lambda_0^(gamma_n)$.
    This removes the equal-occupancy hypothesis.
  Finally, $cal(E) g$ has spacetime Fourier support in a fixed compact paraboloid patch.
    Choose a Schwartz reproducing kernel equal to one on that patch in Fourier space.
    Cauchy–Schwarz and local boundedness of translates of this kernel imply, for every sufficiently large $A$,
  $ sup_q \| cal(E) g \|^2 lt.eq C_A integral_(bb(R)^(n + 1)) \( 1 + \| h \| \)^(- A) integral_q \| cal(E)
    g \( z + h \) \|^2 thin upright(d) z thin upright(d) h . $
  For each fixed $h$, the translated field is an exact extension of an input of the same norm and support.
    Apply the integral estimate on the unchanged cube collection, then integrate in $h$.
    This proves (4.7) without enlarging the ambient radius for distant translations. ◻
]

#thm([Proposition 4.3.])[
  (Weighted fractal norm and occupancy gain).  #emph[ Suppose $mu$ is supported in a ball of radius $C S$,
    satisfies (4.3), and, in addition,
#[#set math.equation(numbering: n => "(4.8)")
 $ mu \( B \( z \, sqrt(S) \) \) lt.eq d thin m S^(n \/ 2) \, wide S^(- A_0) lt.eq d lt.eq 1 . $ <d:sqrt-occupancy>]

 Then
#[#set math.equation(numbering: n => "(4.9)")
 $ sum_q mu \( q \)^beta sup_q \| cal(E) g \|^2 lt.eq C_(epsilon \, A_0) thin m^beta
   S^(n \/ \( n + 1 \) + epsilon) d^(gamma_n) lr(bar.v.double g bar.v.double)_2^2 . $ <d:weighted-fractal>]

 With $d = 1$ no extra assumption beyond growth is needed.
   The estimate is homogeneous in $mu$ and in the squared input norm.]
] <d:fractal>

#proof[
  Normalize $m = lr(bar.v.double g bar.v.double)_2 = 1$; zero cases are immediate.
    Sort unit cubes by $a < mu \( q \) lt.eq 2 a$, where $a$ runs over a fixed multiple of the nonpositive dyadic
    powers. Cubes meeting a radius-$r$ ball lie in a fixed enlargement,
    and their disjoint masses are at least $a$ times their number.
    Thus this class has counting parameter at most $C a^(- 1)$ and square-root occupancy at most $C d S^(n \/ 2)
    a^(- 1)$. Applying 28 and multiplying by $\( 2 a \)^beta$ gives
  $ sum_(a < mu \( q \) lt.eq 2 a) mu \( q \)^beta sup_q \| cal(E) g \|^2 & lt.eq
    C_epsilon S^epsilon
    a^beta \( a^(- 1) \)^(4 \/ \( \( n + 1 \) \( n + 2 \) \)) \( d S^(n \/ 2) a^(- 1) \)^(gamma_n) S^(gamma_n)\
 & = C_epsilon S^(n \/ \( n + 1 \) + epsilon) d^(gamma_n) . $
  The two cancellations are
  $ beta - frac(4, \( n + 1 \) \( n + 2 \)) - gamma_n = 0 \, wide \( 1 + n \/ 2 \) gamma_n = frac(n, n + 1) . $
  This exact cancellation leaves no positive power of $a$ to sum, so a small-mass truncation is necessary.
    Bounded frequency support gives $lr(bar.v.double cal(E) g bar.v.double)_oo lt.eq C$,
    and there are $O \( S^(n + 1) \)$ relevant unit cubes. Those with $mu \( q \) lt.eq
    S^(- A)$ contribute at most $C S^(n + 1 - A beta)$. Choose $A$ so large,
    in terms of $A_0$ and a prescribed error power, that this is bounded by $S^(- B) d^(gamma_n)$.
    There remain $O_A \( 1 + log S \)$ mass classes. Use half the requested loss in the preceding class estimate
    and absorb this count into the remaining $S^epsilon$. Restoring homogeneity proves (4.9). ◻
]

=== 4.3 Exact Fourier layers and spatial localization <exact-fourier-layers-and-spatial-localization>

The following reduction permits compact native profiles in estimates that tolerate an arbitrarily small power
  loss. Its common frequency shift is useful when the chosen subarray changes from one test to another.

#thm([Lemma 4.4.])[
  (Exact Fourier layers of compact profiles).  #emph[For every prescribed finite collection of derivative and
    native spatial decay orders, a sufficiently high finite profile regularity in (4.2) gives a representation
#[#set math.equation(numbering: n => "(4.10)")
 $ U \( x \, t \) = sum_(k in bb(Z)^n) integral_(bb(R)) rho \( k \, u \) e^(i u t \/ L^2) cal(E)
   g_(k \, u) \( x \, t \) thin upright(d) u \, $ <d:layer-representation>]

 where $rho \( k \, u \) lt.eq C_A \( 1 + \| k \| + \| u \| \)^(- A)$ for any prescribed $A$.
   For every subarray $cal(A)$,
#[#set math.equation(numbering: n => "(4.11)")
 $ lr(bar.v.double g_(k \, u)^(cal(A)) bar.v.double)_2^2 lt.eq
   C sum_(alpha in cal(A)) \| c_alpha \|^2 . $ <d:layer-subarray-energy>]

 Each label contributes an exact input supported within $O \( L^(- 1) \)$ of $omega_alpha + k \/ L$,
   with uniformly bounded native frequency seminorms. On a fixed native time range,
   its extension has all the prescribed spatial decay about the original trajectory after the factor $rho$ is
   extracted. The shift $k \/ L$ and the time modulation are common to the entire layer and every subarray.
   For any fixed $eta > 0$, the portion $\| k \| > L^eta$ can be made an arbitrarily negative power error in the
   array supremum, and hence in tests involving polynomially many cubes and polynomially bounded mass parameters.]
] <d:layers>

#proof[
  Fourier transform $phi.alt_alpha$ in its native variables, denoting the dual variables by $\( eta \, zeta \)$.
    Insert a smooth bounded-overlap partition $sum_k theta.alt_k \( eta \) =
    1$ into bounded boxes about $k in bb(Z)^n$, and change variables $u = zeta + \| eta \|^2$.
    For fixed $\( k \, u \)$ define the input, in $xi = omega_alpha + eta \/ L$ coordinates, by
  $ g_(alpha \, k \, u) \( omega_alpha + eta \/ L \) = C c_alpha L^(n \/ 2) e^(- i y_alpha dot.op eta \/ L)
    theta.alt_k \( eta \) hat(phi.alt)_alpha \( eta \, u - \| eta \|^2 \) . $
  Fourier inversion gives
  $ U = sum_k integral e^(i u t \/ L^2) cal(E) #scale(x: 180%, y: 180%)[\(] sum_alpha g_(alpha \, k \, u)
    #scale(x: 180%, y: 180%)[\)] thin upright(d) u . $
  Compact support and sufficiently many derivatives of $phi.alt_alpha$ give any prescribed polynomial decay in
    $\( eta \, zeta \)$, also after a fixed number of frequency derivatives.
    The change $zeta = u - \| eta \|^2$ costs only polynomial factors.
    Extract $rho \( k \, u \) = C_A \( 1 + \| k \| + \| u \| \)^(- A)$ with $C_A$ chosen to bound the needed
    seminorms, and put the remaining normalized sum into $g_(k \, u)$.
    Increasing the finite initial derivative order supplies these bounds simultaneously.
  The input norm estimate follows by a summable Gram-matrix bound.
    Two normalized input bumps can interact only if $\| L \( omega_alpha - omega_(alpha') \) \| lt.eq C$,
    since the shift $k$ is common. For these pairs, integration by parts in the native frequency variable gives
    any prescribed decay in $\| y_alpha - y_(alpha') \| \/ L$.
    The coefficient factors are $c_alpha overline(c_(alpha'))$ and all remaining seminorms are uniform.
    Phase-space counting therefore bounds the absolute row and column sums of the Gram matrix.
    Schur’s inequality proves (4.11), without requiring the subarray to be a Fourier projection.
  For spatial decay, the phase in native variables is $z dot.op eta - tau \| eta \|^2$.
    On bounded $tau$ and $eta$ near $k$, integration by parts gives rapid decay in $z$ away from the original
    trajectory, at the cost of a fixed polynomial in $k$. This was included in the orders used to extract $rho$;
    derivatives of the extension are handled at the same time.
    The common shift preserves all relative frequency labels and phase-space counts.
    Finally, Cauchy–Schwarz over labels and the prescribed rapid spatial decay bound every normalized layer by a
    fixed polynomial in $\( k \, u \)$ times $E \( U \)^(1 \/ 2)$.
    Increase $A$, sum over $\| k \| > L^eta$, and integrate in $u$ to obtain $C_B L^(- B)
    E \( U \)^(1 \/ 2)$ for any required $B$. All orders here are fixed before the varying scale $L$. ◻
]

#thm([Lemma 4.5.])[
  (Exact packet localization on a time slab).  #emph[Let $T gt.eq 1$ and let $g$ have bounded frequency support.
    On a time interval of length $O \( T \)$, an exact extension can be localized to spatial boxes of side $T$
    with summed input energies $C lr(bar.v.double g bar.v.double)_2^2$.
    The localization errors have arbitrarily high negative powers of $T$, with summable local squared budgets.
    No factor equal to the number of spatial boxes is needed.]
] <d:packet-expansion>

#proof[
  Set $R = sqrt(T)$ and absorb the initial time into the input by a unit-modulus multiplier.
    Partition frequency into $R^(- 1)$ caps and expand each rescaled cap density in a Fourier series on a fixed
    larger box. With smooth bumps equal to one on the cap supports, this gives exact packets
  $ c_(theta \, m) R^(- n \/ 2) e^(i \( x dot.op omega_theta - t \| omega_theta \|^2 \)) H_theta #h(-0.16667em)
    (frac(x - gamma R m - 2 t omega_theta, R) \, t / R^2) \, wide sum_(theta \, m) \| c_(theta \, m) \|^2 lt.eq
    C lr(bar.v.double g bar.v.double)_2^2 . $
  Here $H_theta$ is the extension of a fixed smooth native frequency bump.
    It and any fixed derivatives decay arbitrarily rapidly in the first variable for bounded second variable.
    Parseval proves the coefficient bound; differentiating the input density is unnecessary.
    The same cap-overlap and integration-by-parts Gram bound used in 30 bounds the squared norm of any retained
    exact input by its coefficient energy.
  For a spatial box $B$ of side $T$, retain packets whose trajectories on the time slab come within $C T$ of $B$.
    A bounded-velocity trajectory of duration $O \( T \)$ can be retained for only $O \( 1 \)$ such boxes.
    Therefore these retained energies sum to $C lr(bar.v.double g bar.v.double)_2^2$.
    For the omitted packets, the native distance from the box is at least $c sqrt(T)$.
    Extract an arbitrary negative power of $T$ from the rapid packet decay and keep a further weight in the
    distance from the trajectory to $B$, measured in units of $T$.
    Cauchy–Schwarz and phase-space counting bound the squared supremum of the omitted field on $B$ by
  $ C_A T^(- A) sum_(theta \, m) \| c_(theta \, m) \|^2
    (1 + frac("dist" \( B \, upright("trajectory")_(theta \, m) \), T))^(- n - 2) . $
  The right-hand budgets sum boundedly in $B$. This proves the asserted error control and also permits arbitrarily
    long spatial unions of such boxes. Translations modulate the exact inputs and preserve their norms,
    so the construction is uniform in the slab and box centers. ◻
]

#thm([Corollary 4.6.])[
  (Power-loss norm for compact arrays).  #emph[Let $U$ be a compact array of scale $L$,
    and let $mu$ satisfy (4.3) in a spacetime box of side $O \( L^2 \)$.
    For every $epsilon > 0$, with sufficiently many fixed profile derivatives,
#[#set math.equation(numbering: n => "(4.12)")
 $ sum_q mu \( q \)^beta sup_q \| U \|^2 lt.eq C_epsilon m^beta L^(2 n \/ \( n + 1 \) + epsilon) E \( U \) .
   $ <d:compact-fractal>]

]
] <d:power-loss>

#proof[
  Apply 30, discarding $\| k \| > L^eta$ with a sufficiently high negative power.
    For $0 < eta < 1$, every retained layer has support in a fixed bounded frequency box.
    Apply 29 with $S = L^2$ and $d = 1$ to each exact layer. Minkowski’s inequality for the weighted $ell^2$ norm
    of unit-cube suprema, followed by (4.11), gives the result because $sum_k integral rho \( k \, u \) thin
    upright(d) u < oo$. The common time modulation has absolute value one. The discarded error is negligible:
    each cube has mass at most $C m$, there are $O \( L^(2 \( n + 1 \)) \)$ relevant cubes,
    and its supremum has any required negative power of $L$. Rename the arbitrarily small scale loss after
    replacing $S$ by $L^2$. ◻
]

=== 4.4 Coarse decoupling and exact transport powers <coarse-decoupling-and-exact-transport-powers>

For dyadic $K gt.eq 2$, $0 < b < 1$, and $P = 2 \/ \( 1 - b \)$, define

#[#set math.equation(numbering: n => "(4.13)")
 $ cal(T)_b \( V \, nu \) = sum_(Q in cal(Q)_(K^2)) nu \( Q \)^b
   lr(bar.v.double V bar.v.double)_(L^P \( Q \))^2 \, $ <d:coarse-functional>]

where $cal(Q)_(K^2)$ is a fixed grid of half-open spacetime cubes of side $K^2$.

#thm([Lemma 4.7.])[
  (Decoupling inside a strip).  #emph[Group a field $V = sum_theta
    V_theta$ by frequency-label bins of side $K^(- 1)$. Suppose the field supports lie in fixed enlargements of
    these bins and within vertical Fourier distance $O \( K^(- 2) \)$ of the paraboloid.
    If the labels lie within $O \( K^(- 1) \)$ of an affine $j$-plane, $1 lt.eq j lt.eq n$, and $2 lt.eq P lt.eq
    q_j = 2 \( j + 2 \) \/ j$, then
#[#set math.equation(numbering: n => "(4.14)")
 $ lr(bar.v.double V bar.v.double)_(L^P \( Q \))^2 lt.eq C_(epsilon \, A) K^epsilon sum_theta
   sum_(a in bb(Z)^(n + 1)) chevron.l a chevron.r^(- A)
   lr(bar.v.double V_theta bar.v.double)_(L^P \( Q + K^2 a \))^2 . $ <d:local-strip-decoupling>]

 The constituent fields may be arbitrary prescribed subfields with these supports.
   Without the strip hypothesis the same estimate holds with the factor $C K^n$ in place of $C_epsilon K^epsilon$.]
] <d:strip-decoupling>

#proof[
  Rotate frequency into tangent and normal coordinates for the affine plane, remove its central normal carrier,
    and shear away the normal linear time phase. The remaining normal frequencies have size $O \( K^(- 1) \)$,
    so their quadratic contribution is $O \( K^(- 2) \)$. On each fixed normal physical slice,
    the tangential spacetime Fourier support is therefore within $O \( K^(- 2) \)$ of the positive $j$-dimensional
    paraboloid. Multiply first by a Schwartz cutoff bounded below on $Q$ with Fourier width $O \( K^(- 2) \)$.
    It preserves this support statement with fixed enlargement.
  Apply paraboloid decoupling #cite(label("BD2015")) in the range $P lt.eq q_j$.
    After this localization, use smooth tangential cap projections;
    their spatial convolution kernels have bounded $L^1$ norm.
    Only boundedly many original enlarged grid bins in the strip can meet a projected bin,
    since both the normal thickness and tangential cap size are $O \( K^(- 1) \)$.
    Bounded overlap and Minkowski in the normal physical variables give the squared-norm estimate with a Schwartz
    weight outside $Q$. Decomposing that weight into translates of $Q$ gives (4.14), with any fixed $A$.
    This proof uses only supports and not the way a subfield was selected.
    Without a strip, there are $O \( K^n \)$ bins, and Cauchy–Schwarz gives the stated alternative directly. ◻
]

#thm([Lemma 4.8.])[
  (Coarse norm transport).  #emph[Let $F = X_(K \, v)$ with bounded $v$, and suppose $V \( z \) =
    K^(- n \/ 2) e^(i phi \( z \)) V' \( F z \)$ with $\| e^(i phi) \| = 1$. For a fixed $a in bb(Z)^(n + 1)$,
#[#set math.equation(numbering: n => "(4.15)")
 $ sum_Q nu \( Q \)^b lr(bar.v.double V bar.v.double)_(L^P \( Q + K^2 a \))^2 lt.eq
   C K^(2 - \( n + 2 \) b) sum_(r \, s in cal(R)) cal(T)_b \( V' \, nu_(a \, r \, s) \) \, $ <d:transport-functional>]

 where $cal(R)$ is a fixed finite set, independent of $Q \, K \, a$, and
#[#set math.equation(numbering: n => "(4.16)")
 $ nu_(a \, r \, s) = \( tau_(F \( K^2 a \) + K^2 \( s - r \)) \)_(\#) F_(\#) nu \, wide tau_h \( z \) = z +
   h . $ <d:translated-measures>]

 Their translations have size at most $C K^2 \( 1 + \| a \| \)$.
   The same conclusion holds with any prescribed subset of parent cubes on the left.
   If $nu$ has growth parameter $m$, each child measure has parameter $C m K^(n + 1)$.
   Direct pushforward transports (4.4) from scale $L$ to $L \/ K$ with the same $D$.]
] <d:transport>

#proof[
  The Jacobian of $F$ is $K^(- \( n + 2 \))$. Thus, with $A_Q = F \( Q + K^2 a \)$,
  $ lr(bar.v.double V bar.v.double)_(L^P \( Q + K^2 a \))^2 & =
    K^(- n + 2 \( n + 2 \) \/ P) (integral_(A_Q) \| V' \|^P)^(2 \/ P)\
 & = K^(2 - \( n + 2 \) b) (integral_(A_Q) \| V' \|^P)^(1 - b) . $
  No density factor accompanies the mass: the measure is the direct pushforward.
    Let $nu_a = \( tau_(F \( K^2 a \)) \)_(\#) F_(\#) nu$. Then $nu_a \( A_Q \) = nu \( Q \)$,
    and the $A_Q$ are disjoint. Group them according to the child $K^2$ cube $C$ containing their centers.
    Each $A_Q$ has diameter $O \( K \)$, so all sets in a group are contained in $C^(*) =
    union.big_(r in cal(R)) \( C + K^2 r \)$ for a fixed finite $cal(R)$.
    Hölder with exponents $1 \/ b$ and $1 \/ \( 1 - b \)$ gives
  $ sum_(Q upright(" in the group")) nu \( Q \)^b (integral_(A_Q) \| V' \|^P)^(1 - b) lt.eq
    nu_a \( C^(*) \)^b lr(bar.v.double V' bar.v.double)_(L^P \( C^(*) \))^2 . $
  Subadditivity of the powers $b$ and $1 - b$ bounds this by
  $ sum_(r \, s in cal(R)) nu_a \( C + K^2 r \)^b lr(bar.v.double V' bar.v.double)_(L^P \( C + K^2 s \))^2 . $
  The two indices allow the mass and the field norm to occupy different neighbors.
    Reindex by $D = C + K^2 s$ to obtain precisely (4.16) and (4.15).
    None of the translations depends on which parent cube was selected.
  The inverse image of a radius-$r$ ball under $F$ has $n$ transverse widths $O \( K r \)$ and longitudinal length
    $O \( K^2 r \)$. It is covered by $O \( K \)$ balls of radius $C K r$.
    Hence its mass is at most $C m K^(n + 1) r^n$ for $r gt.eq 1$, and translations preserve this bound.
    For the tube moment, writing $L' = L \/ K$, $omega' = K \( omega - v \)$, and $y' = y \/ K$ gives the identity
  $ frac(x' - y' - 2 omega' t', L') = frac(x - y - 2 omega t, L) \, wide \( m K^(n + 1) \) \( L \/ K \)^(n + 1) =
    m L^(n + 1) . $
  This proves the direct-pushforward assertion. When the tube centers are kept fixed,
    translated measures preserve the moment up to a fixed factor only if their native displacements are bounded.
    Accordingly, applications requiring this moment truncate the Schwartz shifts while the child packet widths are
    much larger than the retained shifts. The freely chosen exponent $A$ in (4.14) makes the omitted tail smaller
    than any prescribed power once the global suprema and occupied cube counts are polynomially bounded.
    For exact-field applications using only ball growth, arbitrary translations are harmless. ◻
]

=== 4.5 A power gain from codimension two <a-power-gain-from-codimension-two>

#thm([Proposition 4.9.])[
  (Codimension-two strip saving).  #emph[Fix $0 < alpha < 1 \/ 8$.
    Suppose $g$ has bounded frequency support contained in an $O \( S^(- alpha) \)$ neighborhood of an affine
    $\( n - 2 \)$-plane, and $cal(Q)$ is a collection of unit cubes in a ball of radius $S$ with at most $m_0
    r^n$ cubes in every radius-$r$ ball, $r gt.eq 1$. Fix any $b$ with $beta < b < 2 \/ n$.
    There is $c_0 > 0$, depending only on the fixed dimensional choices and independent of $alpha$,
    such that for every $epsilon > 0$,
#[#set math.equation(numbering: n => "(4.17)")
 $ sum_(q in cal(Q)) sup_q \| cal(E) g \|^2 lt.eq C_(alpha \, epsilon) m_0^b
   S^(n \/ \( n + 1 \) - c_0 alpha + epsilon) lr(bar.v.double g bar.v.double)_2^2 . $ <d:strip-saving>]

 In particular, for $m_0 = S^(o \( 1 \))$ this is the saving $S^(n \/ \( n + 1 \) - c_0 alpha + o \( 1 \))$.
   Finite disjoint subinputs are allowed, with their squared norms summed on the right.]
] <d:strip>

#proof[
  Choose a sufficiently large integer $J$, fixed independently of $S$ and $alpha$, and dyadic $K$ so that $H =
    K^J asymp S^alpha$, with fixed rounding factors. Set $P = 2 \/ \( 1 - b \)$.
    Since $b < 2 \/ n$, one has $P < q_(n - 2) = 2 n \/ \( n - 2 \)$.
    Use the counting measure of the selected unit cubes, assigning unit mass to their centers.
    Local constancy and Hölder bound the initial sum of squared suprema by the coarse functional (4.13),
    with a fixed $K^C$ endpoint cost allowed. Explicitly, in each coarse cube the sum of the local unit norms is
    bounded by the number of selected unit cubes to the power $1 - 2 \/ P = b$,
    times the squared $L^P$ norm on a fixed enlargement. Schwartz reproduction supplies the required neighboring
    translates. Its measure parameter is $C m_0$.
  Iterate Lemma 4.7, Lemma 4.8 for $J$ levels. After $a$ rescalings the strip width is $O \( K^a \/ H \)$,
    which is at most $O \( K^(- 1) \)$ before the last step. Thus the codimension-two decoupling hypothesis
    persists. The product of transport factors is $H^(2 - \( n + 2 \) b)$,
    up to constants depending on the fixed $J$, while the final measure parameter is
  $ m' lt.eq C_J m_0 H^(n + 1) . $
  Smooth frequency decompositions have bounded overlap, so final child input squared norms sum to $C_J
    lr(bar.v.double g bar.v.double)_2^2$. The $J$ decoupling losses can be made $S^epsilon$ by starting with a
    sufficiently small loss. Schwartz shifts may be truncated at a polynomial radius with negligible error,
    using bounded-frequency suprema and polynomial cube counts.
    Their weight sums cost fixed constants at each of the fixed number of levels.
  The final time length is $T = S \/ H^2$, still a fixed positive power of $S$.
    The spatial region can have side $S \/ H$; to avoid paying for this aspect ratio,
    cover it by spatial boxes of side $T$ and use 31 on the child time slab.
    Retained exact inputs have squared norms summable to the child energy.
    Their omitted errors have arbitrarily high negative powers of $T$, with summable local budgets.
    Each resulting spacetime box has side $O \( T \)$.
  Here is the terminal coarse-functional estimate on one such box:
  #[#set math.equation(numbering: n => "(4.18)")
   $ cal(T)_b \( V' \, nu' \) lt.eq C_epsilon K^(C_(*)) T^(n \/ \( n + 1 \) + epsilon) \( m' \)^b
     lr(bar.v.double upright("child input") bar.v.double)_2^2 . $ <d:terminal-functional>]
  Its exponent $C_(*)$ is independent of $J$. Indeed, replace the field norm on each $K^2$ cube by its volume
    factor times a unit-cube witness for its supremum. Move the entire mass of that coarse cube to that witness.
    The resulting measure has ball parameter at most $C K^(2 n) m'$,
    and each moved mass is at most $C K^(2 n) m'$. Since $b gt.eq beta$,
    its $b$th power is at most $\( C K^(2 n) m' \)^(b - beta)$ times its $beta$th power.
    Apply 29 at scale $T$ to the moved masses. The volume factor, the moved growth parameter,
    and this last comparison produce only $K^(C_(*))$, proving (4.18).
    A bounded number of witness-grid choices and enlargements have the same cost.
    The inequality holds separately for every translated child measure,
    and translations are absorbed into modulations of the exact inputs.
    Consequently no count of spatial boxes or translation labels is introduced.
  Combining the three scale contributions, apart from $S^(n \/ \( n + 1 \) + epsilon)$ and the fixed endpoint
    factor $K^(C_(*))$, gives
  $ H^(2 - \( n + 2 \) b) thin H^(\( n + 1 \) b) thin H^(- 2 n \/ \( n + 1 \)) & = H^(2 - b - 2 n \/ \( n + 1 \))\
 & = H^(beta - b) . $
  Enlarge $C_(*)$ to include the initial endpoint cost, still independently of $J$.
    Choose $J$ so large that $C_(*) \/ J < \( b - beta \) \/ 2$.
    Then $K^(C_(*)) H^(beta - b) lt.eq H^(- \( b - beta \) \/ 2)$.
    Taking, for example, any $c_0 < \( b - beta \) \/ 2$ absorbs the fixed rounding and proves (4.17).
    Constants may depend on fixed $alpha \, J \, epsilon$, but the saving exponent $c_0$ does not depend on
    $alpha$. For disjoint subinputs the same construction is applied with their coefficient energies,
    whose sum is the original energy. ◻
]

== 5 A transverse saving in every fixed dimension <t:section>

Throughout this section the spatial dimension $n gt.eq 3$ is fixed, and

$ beta = frac(2, n + 1) \, wide e = frac(n^2, n + 1) . $

For a frequency $xi$ write $v \( xi \) = \( 2 xi \, 1 \)$;
  replacing these vectors by unit vectors changes determinants by bounded factors on a fixed bounded frequency
  region. We write $E f = cal(E) f$ for the exact extension operator of Section 4.
  The following statement concerns exact extension fields. Its use for smooth packet arrays will come after the
  exact Fourier-layer reduction in the next section.

#thm([Proposition 5.1.])[
  (Transverse saving).  #emph[Fix a bounded frequency region in $bb(R)^n$.
    There are $c > 0$ and $L_0 < oo$, depending only on this region and $n$,
    such that the following configuration is impossible for $L gt.eq L_0$.
    Let $cal(Q)$ be distinct unit lattice cubes in a ball of radius $L^2$ in $bb(R)^(n + 1)$, with
#[#set math.equation(numbering: n => "(5.1)")
 $ \# cal(Q) gt.eq L^(2 n - c) \, wide \# { q in cal(Q) : q ∩ B \( z \, r \) eq.not diameter } lt.eq
   L^c r^n quad \( r gt.eq 1 \) . $ <t:forbidden-counts>]

 Suppose $f_1 \, dots.h \, f_(n + 1)$ have $L^2$ norm at most one, frequency support in the fixed region, and
$ sup_q \| E f_i \| gt.eq L^(- e - c) quad \( q in cal(Q) \, med 1 lt.eq i lt.eq n + 1 \) . $

 It is impossible that every choice of one frequency from each support has direction determinant at least
   $L^(- c)$ in absolute value.]
] <t:transverse>

We prove the equivalent assertion that no countersequence exists with $c arrow.b 0$ and $L arrow.r oo$.
  In this section $o \( 1 \)$ refers to such a sequence, after subsequences when necessary.
  Estimates available with every fixed positive power loss may be diagonalized to have $L^(o \( 1 \))$ loss.
  The constants in each such estimate are fixed before diagonalization.
  The proof uses the limiting information calculus of #cite(label("PSE2026"), form: "prose") Section 3,
  “Limiting information calculus”. We state the usable facts below and prove the changes needed in dimension $n$.
  In particular, the planar transverse proposition in that source is not used as a higher-dimensional assertion.

=== 5.1 Uniform multilinear estimates and incident weights <uniform-multilinear-estimates-and-incident-weights>

We first specify the dependence on transversality. This prevents a subpower determinant loss from concealing an
  uncontrolled constant.

#thm([Lemma 5.2.])[
  (Multilinear estimates with polynomial dependence).  #emph[If $n +
    1$ bounded-frequency exact inputs are transverse with determinant at least $nu in \( 0 \, 1 \]$, then,
    for each $epsilon > 0$,
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(q subset B_S) product_(i = 1)^(n + 1) #scale(x: 120%, y: 120%)[\(] sup_q \| E f_i \|
   #scale(x: 120%, y: 120%)[\)]^(2 \/ n) lt.eq C_epsilon nu^(- M_epsilon) S^epsilon product_(i = 1)^(n + 1)
   lr(bar.v.double f_i bar.v.double)_2^(2 \/ n) . $ <t:multilinear-extension>]

 The same bound holds with the sum replaced by the integral of the product.
   For transverse families of tubes of width $delta$ in a fixed bounded region,
   with nonnegative weights $w_i \( T \)$, the corresponding Kakeya bound is
#[#set math.equation(numbering: n => "(5.3)")
 $ integral product_(i = 1)^(n + 1) (sum_T w_i \( T \) upright(bold(1))_T)^(1 \/ n) lt.eq
   C_epsilon nu^(- M_epsilon) delta^(n + 1 - epsilon) product_i (sum_T w_i \( T \))^(1 \/ n) . $ <t:kakeya>]

 Fixed enlargements are allowed. Subpower enlargements and $nu = S^(- o \( 1 \))$ give only subpower losses.]
] <t:multilinear>

#proof[
  Subdivide direction supports into neighborhoods of radius a sufficiently small fixed power of $nu$.
    There are $nu^(- O_n \( 1 \))$ choices of $\( n + 1 \)$ neighborhoods.
    For each choice, send representative directions to the coordinate axes.
    The map, its inverse, and its determinant have size bounded by fixed powers of $nu^(- 1)$.
    The near-coordinate-axes multilinear Kakeya theorem #cite(label("BCT2006")) Theorem 1.15 and Remark 1.10,
    or its strengthened form #cite(label("Guth2010")), gives (5.3) after summing the choices.
    Weights follow by repetition and approximation.
  Here is the finite induction giving the required uniform restriction constant.
    Let $A_B \( S \, nu \)$ be the best normalized integral constant for inputs in a fixed box of size $B$.
    Decompose each input into exact packets at radius $S$, and on each $sqrt(S)$-box retain the packets meeting
    its $S^theta sqrt(S)$ enlargement. Their input squared norms are bounded by incident coefficient energy,
    and the discarded fields are $O_N \( S^(- N) \)$ relative to their parent input norms.
    The enlarged supports remain $nu \/ 2$ transverse if $S^(- 1 \/ 2) lt.eq c_B nu$.
    After rescaling by $S$, the padded tubes have width $delta = S^(- 1 \/ 2 + theta)$.
    Apply (5.3) with loss $sigma$. Dividing its bound by the volume $S^(- \( n + 1 \) \/ 2)$ of a rescaled
    $sqrt(S)$-box gives
  $ A_B \( S \, nu \) lt.eq C nu^(- M_sigma) S^a A_(B + 1) \( C_B sqrt(S) \, nu \/ 2 \) + O_N \( S^(- N) \) \,
    wide a = \( n + 1 \) theta + sigma \/ 2 . $
  Increasing $N$ absorbs all errors into the same inequality for $1 + A_B$;
    when expanding products with exponent $2 \/ n lt.eq 1$, use subadditivity to bound terms containing a
    discarded factor. For a prescribed $epsilon$, choose a finite $J$ with $\( n + 1 \) 2^(- J) < epsilon \/ 2$,
    and then $theta \, sigma$ with $2 a < epsilon \/ 2$. Iterating $J$ times and using the terminal trivial bound
    $O \( S_J^(n + 1) \)$, where $S_J asymp S^(2^(- J))$, proves the integral estimate when $S
    gt.eq \( C \/ nu \)^(2^J)$. In the complementary range the trivial bound is absorbed by increasing
    $M_epsilon$. Thus the dependence on $nu^(- 1)$ is a fixed power.
  For the cube-supremum version the exponent $p = 2 \/ n$ can be below one, so we include the submean argument.
    If $F$ has Fourier support in the fixed compact region, choose a Schwartz reproducing kernel $psi$ and write
    $F = psi * F$. For $A > 0$ let $M_A F \( x \) = sup_y \| F \( x - y \) \| \( 1 + \| y \| \)^(- A)$,
    which is finite because these extensions are bounded. In the convolution insert $\| F \( w \) \| lt.eq \|
    F \( w \) \|^p M_A F \( x \)^(1 - p) \( 1 + \| x - w \| \)^(A \( 1 - p \))$.
    Peetre’s elementary inequality $\( 1 + \| x - w \| \) lt.eq \( 1 + \| x - z \| \) \( 1 + \| z - w \| \)$ then
    gives, uniformly in $z$,
  $ frac(\| F \( z \) \|, \( 1 + \| x - z \| \)^A) lt.eq C_A M_A F \( x \)^(1 - p)
    integral \( 1 + \| x - w \| \)^(- A p) \| F \( w \) \|^p thin upright(d) w \, $
  using the boundedness of $\( 1 + \| z - w \| \)^A \| psi \( z - w \) \|$.
    Taking the supremum and dividing by $M_A F \( x \)^(1 - p)$ proves the required Schwartz-average bound for
    $M_A F \( x \)^p$; the zero case is immediate. Choose $A p$ arbitrarily large.
    In particular this bounds $\( sup_q \| E f_i \| \)^(2 \/ n)$ by that average for each $x in q$.
    Integrate the product over $q$ and sum. For each independent list of shifts the translated fields are exact
    extensions with unchanged norms and supports. Apply the integral estimate and integrate the Schwartz weights.
    This proves (5.2). ◻
]

#thm([Lemma 5.3.])[
  (Pruned incident-tube model).  #emph[A countersequence to Proposition 36 yields a set $cal(P)$ of centers of
    distinct $L^(- 1)$-scale cubes in a bounded region, satisfying
#[#set math.equation(numbering: n => "(5.4)")
 $ \# cal(P) = L^(n + o \( 1 \)) \, wide \# \( cal(P) ∩ B \( z \, r \) \) lt.eq
   L^(n + o \( 1 \)) r^n quad \( L^(- 1) lt.eq r lt.eq 1 \) \, $ <t:point-counts>]

 and $n + 1$ transverse weighted tube families of width $L^(- 1 + o \( 1 \))$.
   Their weights satisfy $sum_T w_i \( T \) lt.tilde 1$. For every $x in
   cal(P)$ there is an incident subfamily of retained weight $w_i^(*) \( x \) =
   L^(- e + o \( 1 \))$ whose normalized law satisfies
#[#set math.equation(numbering: n => "(5.5)")
 $ bb(P) { xi \( T_i \) in N_(L^(- alpha)) \( H \) divides X = x } lt.eq L^(- c_1 alpha + o \( 1 \)) $ <t:strip-law>]

 for every affine $\( n - 2 \)$-plane $H subset bb(R)^n$ and every fixed rational $0 < alpha < 1 \/ 8$.
   Here $c_1 > 0$ is fixed independently of $alpha$, and the estimate is uniform in $x \, H$ for each fixed $alpha$.]
] <t:tubes>

#proof[
  Sort the original unit cubes by their occupancy in $L$-boxes.
    A dyadic class retains $L^(2 n - o \( 1 \))$ cubes, on which the squared supremum sum of each field is at
    least $L^(2 n - 2 e - o \( 1 \)) = L^(2 n \/ \( n + 1 \) - o \( 1 \))$.
    The refined fractal estimate, Proposition 4.3, at radius $L^2$ improves this upper bound by a fixed power if
    the $L$-box occupancy is at most $L^(n - delta)$ for any fixed $delta > 0$.
    The counting hypothesis supplies the upper bound $L^(n + o \( 1 \))$.
    Consequently the retained occupancies are $L^(n + o \( 1 \))$.
    Divide coordinates by $L^2$ and use the occupied box centers.
    Counting the original cubes in an enlarged ball, then dividing by the minimum occupancy, proves (5.4).
  Exact packet localization at radius $L^2$ gives coefficient weights with bounded total sum.
    On each retained physical $L$-box, keep trajectories in a padded enlargement.
    The padding exponent can tend sufficiently slowly to zero; rapid tails make the discarded field negligible.
    The retained exact input has squared norm at most $C w_i \( x \)$, where $w_i \( x \)$ is its incident weight.
    Apply Proposition 29 at radius $L$ to its $L^(n + o \( 1 \))$ selected unit cubes:
  $ L^(n - 2 e - o \( 1 \)) lt.eq L^(n \/ \( n + 1 \) + o \( 1 \)) w_i \( x \) \, wide w_i \( x \) gt.eq
    L^(- e - o \( 1 \)) . $
  The counting version of (5.3) gives $sum_x product_i w_i \( x \)^(1 \/ n) lt.eq L^(o \( 1 \))$.
    If some weight exceeds $L^(- e + delta)$, this and the other lower bounds allow only
    $L^(n - delta \/ n + o \( 1 \))$ such points. Diagonal deletion leaves $w_i \( x \) =
    L^(- e + o \( 1 \))$ uniformly.
  Let $c_0$ be the constant in the codimension-two strip gain, Proposition 35, and fix $0 < c_1 < c_0 \/ 2$.
    For a finite list of rational $alpha$, successively remove, at each $x \, i$,
    strips of width $L^(- alpha)$ carrying remaining weight greater than $L^(- c_1 alpha) w_i \( x \)$.
    At one scale there are at most $L^(c_1 alpha)$ removals. Assign a packet to its first removal,
    so the corresponding subarray energies sum to $O \( w_i \( x \) \)$.
    On the physical $L$-box the exact support enlargement is $O \( L^(- 1) \)$, smaller than the strip width.
    Proposition 35, followed by Cauchy over the removed strips, bounds their combined squared supremum sum by
  $ L^(n \/ \( n + 1 \) - \( c_0 - c_1 \) alpha + o \( 1 \)) w_i \( x \) . $
  This is negligible compared with the required local squared norm.
    The triangle inequality in that square-sum norm, followed by the unrestricted local fractal estimate,
    forces surviving weight $L^(- e + o \( 1 \))$. On termination every affine strip has remaining weight at most
    the deletion threshold. Normalizing by the surviving weight costs $L^(o \( 1 \))$.
    Diagonalize over finite rational lists to obtain (5.5). Constant or subpower enlargements of the strips are
    covered by applying the assertion at a slightly smaller rational exponent.
    The pruning is allowed to depend on $x$; it defines the conditional laws used next. ◻
]

=== 5.2 Information profiles and the cost of direction bins <information-profiles-and-the-cost-of-direction-bins>

Draw $X$ uniformly from $cal(P)$. Conditional on $X$, draw $T_i \,
  T'_i$ independently from the retained law of family $i$, for $1 lt.eq i lt.eq n + 1$.
  A tube label contains its central line and exact direction.
  Let $X_s$ be its position label in nested cube grids of side comparable to $L^(- s)$,
  for rational $s in \[ 0 \, 1 \]$, with the trivial partition at zero.
  For a discrete variable $Y$ and conditioning $V$, information at the sampled labels means

$ I_L \( Y divides V \) = - log_L bb(P) \( Y = Y \( omega \) divides V \) . $

All spatial, coordinate, and direction partitions below have at most $L^(C + o \( 1 \))$ labels.
  Exact tube labels may be more numerous; only their role as conditioning variables is used.

#thm([Lemma 5.4.])[
  (Limiting information calculus).  #emph[After passing to a subsequence,
    the countably many information variables at rational block and prefix scales have a common limiting joint law.
    Their conditional informations are uniformly integrable and bounded in the limit.
    The chain rule is exact, and conditioning lowers information almost surely in this law.
    If, on a specified event and given $\( Z \, V \)$, there are at most $L^(a + o \( 1 \))$ possible labels for
    $Y$, then the limiting information $I \( Y divides Z \, V \)$ is at most $a$ on that event.
    Event indicators can be included in the joint law; finite systems of limiting inequalities of positive
    probability pass to finite scale with fixed positive slack.]
] <t:information>

#proof[
  This is the dimension-free lemma with this name in #cite(label("PSE2026"), form: "prose") Section 3.
    The short argument also explains its pointwise scope. If a variable has at most $L^(C + o \( 1 \))$ labels,
    then $bb(P) { I_L \( Y divides V \) > C + a } lt.eq L^(- a + o \( 1 \))$, uniformly in conditioning;
    integrating this bound gives uniform integrability. Writing $p = bb(P) \( Y divides V \)$ and $q =
    bb(P) \( Y divides V \, W \)$ at the sampled labels, the conditional expectation of $p \/ q$ is at most one. Thus
  $ bb(P) { I_L \( Y divides V \) - I_L \( Y divides V \, W \) < - a } lt.eq L^(- a) . $
  This proves the limiting conditioning inequality, without asserting finite-scale pointwise monotonicity.
    The restricted determination rule follows by summing probabilities over the permitted small label set.
    Tightness and a diagonal subsequence give the joint law. Include all rational tests, their costs,
    and the restricted-event indicators; open-set implications with slack justify their passage to the limit. ◻
]

The information profiles are

$ F \( s \) = I \( X_s \) \, wide G_i \( s \) = I \( X_s divides T_i \) \, wide G'_i \( s \) =
  I \( X_s divides T'_i \) . $

Thus $F$ records the limiting exponent of the reciprocal probability of the sampled spatial cell,
  whereas $G_i$ records that exponent after one incident tube is specified.
  We shall compare these profiles in coordinates adapted to the tube directions;
  their endpoint values will force equality in that comparison.

These profiles extend to nondecreasing Lipschitz functions on $\[ 0 \, 1 \]$, with constants $n + 1$ and $1$,
  respectively, and vanish at zero. Indeed a tube intersects at most $L^(t + o \( 1 \))$ children inside a parent
  when the exponent increases by $t$. The determination rule gives the conditional Lipschitz constant;
  unrestricted grid counts give the other one. Moreover

#[#set math.equation(numbering: n => "(5.6)")
 $ F \( s \) gt.eq n s \, wide F \( 1 \) = n \, wide G_i \( 1 \) \, G'_i \( 1 \) gt.eq
   frac(n, n + 1) . $ <t:profile-endpoints>]

The first two assertions follow from (5.4). For the third, the retained weights give

$ bb(P) \( X = x \, T_i = T \) lt.eq L^(- n + e + o \( 1 \)) w_i \( T \) =
  L^(- n \/ \( n + 1 \) + o \( 1 \)) w_i \( T \) . $

The probability of sampling a tube with marginal probability smaller than $L^(- a)
  w_i \( T \)$ is at most $L^(- a) sum_T w_i \( T \) = O \( L^(- a) \)$.
  Outside this event the conditional point mass is at most $L^(- n \/ \( n + 1 \) + a + o \( 1 \))$.
  Let $a arrow.b 0$, also for the primed tubes.

To choose coordinates adapted to reference tubes, we reveal their coarse direction bins.
  Conditioning on these bins may lower the limiting information; the costs below measure this loss.
  Fix a rational block $\[ s \, s + b \]$, a rational $b_(*) gt.eq b$, and $C = X_s$.
  Let $D$ contain direction bins of precision $L^(- b_(*))$ for a fixed sublist of the $2 \( n + 1 \)$ tubes,
  including one reference tube per family. Normalize the parent to size one and use the basis given by
  deterministic representatives of the reference bins. Transversality bounds its norm and inverse by
  $L^(o \( 1 \))$. For a prefix $0 < t lt.eq b$, let $Z = \( Z_1 \, dots.h \, Z_(n + 1) \)$ be the coordinate grid
  labels at resolution $L^(- t)$. Adding bins to $D$ does not change this basis or these labels.

#thm([Lemma 5.5.])[
  (Block comparison, additivity, and coordinate subsets).  #emph[Put $J = F \( s + t \) - F \( s \)$ and $J_i =
    G_i \( s + t \) - G_i \( s \)$ for the selected references. The nonnegative costs
$ ell = I \( X_(s + t) divides C \) - I \( X_(s + t) divides C \, D \) \, quad ell_i =
  I \( X_(s + t) divides C \, T_i \) - I \( X_(s + t) divides C \, T_i \, D \) $

 satisfy
#[#set math.equation(numbering: n => "(5.7)")
 $ sum_i \( J_i - ell_i \) lt.eq sum_i I \( Z_i divides Z_(hat(i)) \, C \, D \) lt.eq I \( Z divides C \, D \) =
   J - ell . $ <t:block-comparison>]

 For disjoint blocks or prefixes with the same bin list and the same exact tube conditioning,
   the sum of expectations of each cost is $O_n \( b_(*) \)$. Almost surely, for every choice of references,
#[#set math.equation(numbering: n => "(5.8)")
 $ F = sum_(i = 1)^(n + 1) G_i \, wide G'_i = G_i \, wide G_i \( 1 \) = frac(n, n + 1) . $ <t:replacement>]

 For every coordinate subset $A subset { 1 \, dots.h \, n + 1 }$,
#[#set math.equation(numbering: n => "(5.9)")
 $ I \( \( Z_i \)_(i in A) divides C \, D \) = sum_(i in A) J_i + O_n (sum_i ell_i) . $ <t:subset-information>]

 No unused coordinates are included in the conditioning in this formula.]
] <t:additivity>

#proof[
  A reference tube determines its off-axis coordinates to $L^(o \( 1 \))$ choices:
    its relative width and its direction-bin error are both at most $L^(- t + o \( 1 \))$.
    Given $\( C \, D \)$, the block child label $X_(s + t)$ and the coordinate label $Z$ determine each other up
    to $L^(o \( 1 \))$ choices: the bin-defined change of basis has inverse norm $L^(o \( 1 \))$,
    and grid-boundary ambiguity has only subpower multiplicity. Thus
  $ J_i - ell_i = I \( Z_i divides C \, D \, T_i \) = I \( Z_i divides Z_(hat(i)) \, C \, D \, T_i \) lt.eq
    I \( Z_i divides Z_(hat(i)) \, C \, D \) . $
  In any ordering of the coordinates each chain-rule term conditions on a subset of $Z_(hat(i))$, proving (5.7).
  For a finite-valued label $D$, its Shannon entropy is $H \( D \) = bb(E) \[ - log p_D \( D \) \]$,
    with the natural logarithm. At finite scale the expected cost is the conditional mutual information of child
    and $D$ given the parent, divided by $log L$, with the same fixed exact tube additionally conditioned on if
    present. These mutual informations telescope along the spatial filtration.
    Filling gaps between disjoint blocks only adds nonnegative terms.
    The total is at most $H \( D \) \/ log L = O_n \( b_(*) \)$, since $D$ has $L^(O_n \( b_(*) \))$ labels.
    Uniform integrability passes this to the limiting law. This is exactly the hypothesis of the “Block comparison
    and telescoping costs” lemma in #cite(label("PSE2026"), form: "prose") Section 3;
    the number of reference directions only changes the dimensional constant.
  Partition a rational interval into blocks with $b = b_(*) arrow.b 0$.
    The expected positive excess of the summed $G_i$ increments over the $F$ increment is $O_n \( b \)$,
    so in the limit every interval has $sum_i Delta G_i lt.eq Delta F$. At $\[ 0 \, 1 \]$, (5.6) forces equality.
    Nonnegative additive deficits must therefore vanish on every subinterval.
    Repeat this argument for all finitely many reference replacements and subtract the identities. This proves (5.8).
  Finally choose any ordering that puts $A$ first. Each chain-rule term is at least $J_i - ell_i$,
    and their total surplus is $sum_i ell_i - ell lt.eq sum_i ell_i$ by additivity.
    Summing just the terms for $A$ proves (5.9). Equivalently,
    the lower bound for the complement subtracted from the total gives the upper bound for $A$.
    This is why a coordinate pair can be treated without fixing the other $n - 1$ coordinates. ◻
]

=== 5.3 Codimension two and a single common profile <codimension-two-and-a-single-common-profile>

The pruning in Lemma 38 was against affine $\( n - 2 \)$-planes, rather than just angular balls.
  The following linear algebra is the reason for that choice.

#thm([Lemma 5.6.])[
  (Restriction of two direction equations).  #emph[Let a basis of $bb(R)^(n + 1)$ consist of bounded vectors
    $v \( xi_i \)$ with inverse norm $L^(o \( 1 \))$. Normalize the $i$th coefficient of another bounded vector
    $v \( xi \)$ to one, assuming it and its inverse are $L^(o \( 1 \))$,
    and denote two of its other coefficient ratios by $a_j \, a_k$.
    A ball of radius $L^(- u)$ in these two ratios pulls back, on the bounded frequency region,
    into an $L^(- u + o \( 1 \))$-neighborhood of an affine $\( n - 2 \)$-plane.
    The same conclusion holds when both specified ratios are $L^(- u)$-small.]
] <t:rank>

#proof[
  Let $r_ell$ be the dual basis rows. Equations for ratios centered at $\( a_j \, a_k \)$ are the homogeneous
    equations $\( r_j - a_j r_i \) dot.op v = 0$ and $\( r_k - a_k r_i \) dot.op v = 0$.
    Their row map has smallest singular value $L^(- o \( 1 \))$:
    the coefficients of $r_j \, r_k$ in any linear combination are the coefficients of that combination itself,
    and the primal and dual basis norms are subpower. Choose the center at a realized ratio in the ball,
    enlarging its radius by a fixed factor. Both rows then vanish at a bounded vector $v_0 = \( 2 xi_0 \, 1 \)$.
    If a linear combination is $\( a \, b \)$, this implies $b = - 2 a dot.op xi_0$,
    so $lr(bar.v.double \( a \, b \) bar.v.double) lt.tilde lr(bar.v.double  bar.v.double) a$.
    Consequently the spatial restrictions of the two rows still have smallest singular value $L^(- o \( 1 \))$.
    Their time-one slice is an affine $\( n - 2 \)$-plane, and approximate equations give distance
    $L^(- u + o \( 1 \))$ from it. For two small ratios one can center the equations at zero;
    they vanish at the $i$th reference direction, giving the same argument.
    This verifies both rank and its quantitative conditioning after restriction to the time-one hyperplane. ◻
]

#thm([Lemma 5.7.])[
  (One common profile).  #emph[Almost surely all $n + 1$ conditional profiles coincide:
#[#set math.equation(numbering: n => "(5.10)")
 $ G_i = G'_i = G \, wide F = \( n + 1 \) G \, wide 0 lt.eq dot(G) lt.eq 1 \, quad G \( 1 \) = frac(n, n + 1) \,
   quad \( n + 1 \) G \( s \) gt.eq n s . $ <t:common-profile>]

]
] <t:common>

#proof[
  In the exact reference basis, normalize the $i$th coefficient of the direction of $T'_i$ to one.
    Replacement transversality and Cramer’s rule bound this normalization and all ratios by subpowers.
    Include in the joint limiting law the clipped inverse-size exponents
  $ r_j = lim min { 1 \, max { 0 \, - log_L \| a_j \| } } \, wide j eq.not i \, $
  with value one when a ratio vanishes. At most one of these $n$ exponents can be positive.
    Otherwise two coefficients are small at a fixed positive-power scale,
    placing $T'_i$ in a codimension-two frequency strip by Lemma 41.
    Conditional on $X$ and the exact references, the alternative still has its original law.
    Conditional independence and (5.5) make this event have probability tending to zero.
  On ${ r_j = 0 }$ compare profile increments using the $j$th coordinate.
    For fixed rational $0 < a < t \/ 2$, the finite event $r_(j \, L) < a \/ 2$ implies $\| a_j \| >
    L^(- a \/ 2)$. The approximate basis fixed only by the reference bins changes this to a lower bound $L^(- a)$
    for large $L$. Given $T'_i \, Z_j \, C \, D$, the child position then has at most
    $L^(O_n \( a \) + o \( 1 \))$ possibilities, since that coordinate parametrizes the tube with inverse slope at
    most $L^(a + o \( 1 \))$. This permitted set of child labels is determined by the displayed
    $\( T'_i \, Z_j \, C \, D \)$, uniformly over hidden exact reference directions.
    Apply restricted determination before taking limits, and then let $a arrow.b 0$. On ${ r_j = 0 }$ it gives
  $ G_i \( s + t \) - G_i \( s \) - ell'_i lt.eq I \( Z_j divides C \, D \) lt.eq G_j \( s + t \) - G_j \( s \) +
    O_n (sum_k ell_k) . $
  The comparison uses only the indicated bin-defined coordinates;
    exact reference directions have not been silently added to the conditioning.
  On dyadic exponent partitions with block size $b = b_(*)$, distribute each cost uniformly over its block.
    Its expected integral is $O_n \( b \)$. Dyadic summability makes all these cost densities tend to zero for
    almost every path and exponent. At simultaneous differentiability points, $dot(G)_i lt.eq
    dot(G)_j$ whenever $r_j = 0$. These ratio events belong to the entire sampled path,
    independently of the current block. All endpoint integrals equal $n \/ \( n + 1 \)$,
    so each such derivative inequality implies equality of the two profiles.
    Each profile thus agrees with at least $n - 1$ others. Every equivalence class has at least $n$ members,
    and two disjoint classes would need $2 n > n + 1$ members. There is a single class, proving (5.10). ◻
]

Use family one and two specified off-axis ratios $a_2 \, a_3$ of $T'_1$.
  Conditional on the exact $X$ and exact references, redraw $T'_1$ from its original law.
  Let $h_j \( u \)$ be the limiting negative base-$L$ logarithm of the mass of the radius-$L^(- u)$ ball centered
  at its sampled $a_j$. The functions are nonnegative and nondecreasing and satisfy

#[#set math.equation(numbering: n => "(5.11)")
 $ h_2 \( u \) + h_3 \( u \) gt.eq c_1 u wide \( 0 < u < 1 \/ 8 \, med u in bb(Q) \) . $ <t:angular-sum>]

Indeed the joint ball pulls back to a codimension-two strip by Lemma 41,
  and the original conditional law obeys (5.5). Joint grid information is at most the sum of marginal grid
  informations by the chain rule and limiting conditioning. Centered-ball and grid exponents agree:
  if $p_z$ is a sampled grid-cell mass and $q_z$ the sum over its boundedly many neighbors, then

$ sum_(z : q_z > L^a p_z) p_z lt.eq L^(- a) sum_z q_z lt.tilde L^(- a) . $

Apply this to joint and marginal grids, with a boundedly finer grid where necessary.
  This is the “Angular marginal information” argument of #cite(label("PSE2026"), form: "prose") Section 3;
  Lemma 41 supplies its new higher-dimensional hypothesis.

=== 5.4 A planar projection test with no frozen extra coordinates <a-planar-projection-test-with-no-frozen-extra-coordinates>

We record the precise external projection statement.

#thm([Lemma 5.8.])[
  (Robust planar projection).  #emph[Fix $0 < d < 1$ and $rho > 0$.
    There are $epsilon_(upright("pr")) \, eta_(upright("pr")) > 0$ such that, for sufficiently small $Delta$,
    the following holds. Let $A subset B \( 0 \, 1 \) subset bb(R)^2$,
    and write $cal(N)_Delta$ for covering number at radius $Delta$. Suppose
$ Delta^(- 2 d + eta_(upright("pr"))) lt.eq cal(N)_Delta \( A \) lt.eq Delta^(- 2 d - eta_(upright("pr"))) \, wide
  cal(N)_Delta \( A ∩ B \( z \, r \) \) lt.eq Delta^(- eta_(upright("pr"))) r^rho cal(N)_Delta \( A \) $

 for $Delta lt.eq r lt.eq 1$. If a probability $sigma$ on projection lines obeys $sigma \( B \( V \, r \) \) lt.eq
   Delta^(- eta_(upright("pr"))) r^rho$ on the same range, then some $V in "supp" sigma$ satisfies
$ cal(N)_Delta \( pi_V A' \) gt.eq Delta^(- d - epsilon_(upright("pr"))) quad
  upright("for every ") A' subset A upright(" with ") cal(N)_Delta \( A' \) gt.eq
  Delta^(eta_(upright("pr"))) cal(N)_Delta \( A \) . $

 The tolerance and gain may be decreased.]
] <t:projection>

#proof[
  This is #cite(label("He2020"), form: "prose") Theorem 1 with ambient dimension $2$, projection dimension $1$,
    and set exponent $2 d$. Its Grassmannian nonconcentration condition is angular-ball nonconcentration in this
    case. The theorem gives the conclusion for all large subsets simultaneously,
    outside a direction set of probability a positive power of $Delta$.
    Decrease the tolerance to obtain the stated version. ◻
]

#thm([Lemma 5.9.])[
  (Projection block test).  #emph[Fix $0 < d < 1$, $d_0 > 0$, and $kappa_0 > 0$.
    A sufficiently small $zeta > 0$, depending on these parameters and fixed $n$, has the following property.
    Fix rational $\[ s \, s + b \] subset \[ 0 \, 1 \]$, $b < 1 \/ 8$, $b_(*) gt.eq b$, and $j in { 2 \, 3 }$.
    Let $D_0$ be the reference direction bins at precision $L^(- b_(*))$,
    and $D_1$ additionally contain the bin of $T'_1$. The following cannot hold on an event of positive limiting
    probability:]
  + #emph[$\| G \( s + b \) - G \( s \) - d b \| lt.eq zeta b$, and $G \( s + u \) - G \( s \) gt.eq d_0 u - zeta b$;]
  + #emph[every cost for $D_0 \, D_1$, the reference tubes, and $T'_1$, at the endpoint and the tested prefixes,
    is at most $zeta b$;]
  + #emph[$h_j \( u \) gt.eq kappa_0 u - zeta b$.]
  #emph[The prefix tests need only use a fixed finite rational grid in $0 < u lt.eq b$ containing $b$,
    of mesh a sufficiently small fixed multiple of $zeta b$. All error constants and relative meshes are
    independent of $s \, b \, b_(*)$.]
] <t:block-test>

#proof[
  Set $K = L^b$, and use the same reference-bin basis for $D_0 \, D_1$.
    Let $Y_u = \( Z_1 \, Z_j \)$ at prefix $u$. Lemmas 40 and 42 give, with either bin conditioning,
  #[#set math.equation(numbering: n => "(5.12)")
   $ I \( Y_b divides C \, D_a \) = 2 d b + O_n \( zeta b \) \, wide I \( Y_u divides C \, D_a \) gt.eq 2 d_0 u -
     O_n \( zeta b \) \, quad a = 0 \, 1 . $ <t:pair-information>]
  Let $tilde(a)_j$ be the alternative ratio determined by $D_1$,
    and let $Pi$ be the interval label at resolution $K^(- 1)$ of $z_j - tilde(a)_j z_1$.
    Given $T'_1 \, C \, D_1$, it has $L^(o \( 1 \))$ possible values:
    the central line is part of the tube label, the slope error is $L^(- b_(*) + o \( 1 \))$,
    and the relative width is $L^(s - 1 + o \( 1 \)) lt.eq L^(- b + o \( 1 \))$.
    Moreover coordinate one parametrizes the full child position along this tube to subpower ambiguity. Thus
  $ I \( Y_b divides Pi \, C \, D_1 \) gt.eq I \( Y_b divides Pi \, C \, D_1 \, T'_1 \) =
    I \( X_(s + b) divides C \, D_1 \, T'_1 \) gt.eq d b - O_n \( zeta b \) . $
  Since $Pi$ is determined by $Y_b \, D_1$, the chain rule and (5.12) imply
  #[#set math.equation(numbering: n => "(5.13)")
   $ I \( Pi divides C \, D_1 \) lt.eq d b + O_n \( zeta b \) . $ <t:projection-information>]
  Every statement so far conditions on parent and direction bins, not on the unused coordinates.
  Pass the finite test to finite $L$ with slack. It succeeds with probability at least a fixed $p_(*) >
    0$ along a subsequence. Fix parent and reference-bin labels whose conditional success probability $p gt.eq
    p_(*)$, and write $mu$ for that conditional law. No lower bound on the probability of this individual fiber is
    needed. Absorb fixed slack into $alpha = C_n zeta + o \( 1 \)$.
    If $A_(upright("bin"))$ denotes the alternative bin, success implies the following bounds for the displayed
    labels whenever they have a successful realization:
  #[#set math.equation(numbering: n => "(5.14)")
   $ K^(- 2 d - alpha) lt.eq mu \( Y_b = y \) & lt.eq K^(- 2 d + alpha) \,\
K^(- 2 d - alpha) lt.eq mu \( Y_b = y divides A_(upright("bin")) = a \) & lt.eq K^(- 2 d + alpha) \,\
mu \( Y_u = y_u \) & lt.eq K^alpha L^(- 2 d_0 u) \,\
mu \( Pi = pi divides A_(upright("bin")) = a \) & gt.eq K^(- d - alpha) . $ <t:fiber-masses>]
  Let $A$ be the centers of all endpoint pair cells with a successful realization in this fixed fiber.
    The first line gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ p K^(2 d - alpha) lt.eq \| A \| lt.eq K^(2 d + alpha) . $ <t:common-planar-set>]
  The mass upper bound for a prefix divided by the endpoint mass lower bound counts the successful descendants in
    that prefix. A ball is covered by boundedly many cells at a comparable coarser tested prefix;
    the finite mesh costs $K^(O_n \( zeta \))$. Hence
  #[#set math.equation(numbering: n => "(5.16)")
   $ frac(cal(N)_(K^(- 1)) \( A ∩ B \( z \, r \) \), cal(N)_(K^(- 1)) \( A \)) lt.tilde p^(- 1)
     K^(O_n \( zeta \) + o \( 1 \)) r^(d_0) \, wide K^(- 1) lt.eq r lt.eq 1 . $ <t:planar-nonconcentration>]
  The direct exponent is $2 d_0$; weakening it allows all grid and short prefix errors to be absorbed.
  Retain alternative bins whose conditional success probability is at least $p \/ 2$.
    Their successful mass is at least $p \/ 2$. For each such bin,
    let $A_a subset A$ be its successful endpoint pair cells. The second and fourth lines of (5.14) give
  #[#set math.equation(numbering: n => "(5.17)")
   $ \| A_a \| gt.eq \( p \/ 2 \) K^(2 d - alpha) \, wide cal(N)_(K^(- 1)) \( pi_(tilde(a)_j \( a \)) A_a \) lt.eq
     K^(d + O_n \( zeta \) + o \( 1 \)) . $ <t:large-subsets>]
  Here initially $pi_a \( z_1 \, z_j \) = z_j - a z_1$; normalizing its projection vector can only decrease image
    distances.
  We now construct one nonconcentrating direction measure without paying an inverse probability for an individual
    alternative bin. Restrict actual samples to success and the retained bins,
    normalize by their mass (at least $p \/ 2$), and push them to the projection line spanned by
    $\( - tilde(a)_j \, 1 \)$. To bound a slope ball, first condition on the exact point and exact references.
    They determine the fixed parent and reference-bin fiber, and the alternative law is still the original one
    given the point. If the slope ball meets success, choose a successful alternative in it.
    Its centered-mass test (iii), at a fixed enlarged radius, bounds the original probability of the whole ball.
    Rounding to a coarser tested radius costs $K^(O_n \( zeta \) + o \( 1 \))$.
    Restriction only decreases this probability. Integrating over exact points and references,
    and finally normalizing the entire successful mass, gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ sigma \( B \( V \, r \) \) lt.tilde p^(- 1) K^(O_n \( zeta \) + o \( 1 \)) r^(kappa_0) \, wide K^(- 1) lt.eq
     r lt.eq 1 . $ <t:angular-probability>]
  Subpower slope bounds, condition numbers, and the sine-angle formula justify the passage from slopes to
    projective lines. The approximate ratios have error $K^(- 1) L^(o \( 1 \))$.
    Rescale the coordinate range of $A$, of size at most $L^(o \( 1 \))$, into a unit ball;
    covering numbers and all displayed bounds change by subpowers only.
  Choose $0 < rho < min { d_0 \, kappa_0 }$. Lemma 43 applies to (5.15), (5.16),
    and (5.18) when $zeta$ is sufficiently small. For every direction in $"supp" sigma$, however,
    (5.17) provides a sufficiently large subset of the same $A$ with projection smaller than the guaranteed gain.
    This is a contradiction. These are exactly the pair-cell, projection-cell, cost,
    and angular hypotheses of the “Projection block test” in #cite(label("PSE2026"), form: "prose") Section 3;
    the proof above verifies their dimensional transfer explicitly. ◻
]

=== 5.5 From the block test to a full-to-empty transition <from-the-block-test-to-a-full-to-empty-transition>

The remaining profile argument is one-dimensional in the scale parameter.
  We give its hypotheses and mechanism explicitly, so that the replacement of the endpoint fraction $2 \/
  3$ by $n \/ \( n + 1 \)$ is visible. The angular sum bound (5.11) does not select one marginal that is
  nonconcentrated at every radius. The following finite choice of comparable scales supplies the angular bounds
  needed by the block test.

#thm([Lemma 5.10.])[
  (Finite angular alternatives).  #emph[For fixed $d in \( 0 \, 1 \)$ and $d_0 > 0$,
    there is a fixed finite list of positive rational ratios, bounded away from zero, with this property.
    For every sufficiently small rational $b_0$, almost every path admits a length $b'$ from that list times
    $b_0$, and $j = 2$ or $3$, satisfying the angular hypothesis of Lemma 44, with spare slack,
    for all tested block lengths in $\[ b' \/ 4 \, b' \]$. Each alternative has a fixed positive angular slope,
    tolerance, and finite relative mesh, independent of $b_0$.]
] <t:angular-alternatives>

#proof[
  Use the block-test tolerance $zeta_2$ for angular slope $c_1 \/ 4$.
    Choose a positive rational $a lt.double c_1 zeta_2$, and then a sufficiently reduced tolerance $zeta_1$ for
    slope $a \/ 2$. Test $h_2 \( u \) gt.eq a u$ on a fine fixed relative grid from $c zeta_1 b_0$ to $b_0$.
    If every test passes, monotonicity fills gaps and nonnegativity handles smaller radii with the allowed
    additive error; choose $j = 2$, $b' = b_0$. Otherwise a tested $v$ obeys $h_2 \( v \) < a v$.
    By monotonicity and (5.11),
  $ h_3 \( u \) gt.eq c_1 u - h_2 \( u \) > c_1 u - a v gt.eq \( c_1 \/ 2 \) u
    quad \( 2 a v \/ c_1 lt.eq u lt.eq v \) . $
  Choose $j = 3$, $b' = v$. The choice $a lt.double c_1 zeta_2$ makes the omitted smaller radii harmless for every
    block length in $\[ v \/ 4 \, v \]$. Reducing cutoffs and meshes leaves spare slack.
    The finitely many $v \/ b_0$ are fixed and bounded away from zero.
    This proves the “Finite angular alternatives” lemma of #cite(label("PSE2026"), form: "prose") Section 3 from
    precisely its two monotone-marginal and positive-sum hypotheses. ◻
]

#thm([Lemma 5.11.])[
  (Binary derivative and finite alternation).  #emph[Almost surely $dot(G) in { 0 \, 1 }$ almost everywhere,
    and $E = { s : dot(G) \( s \) = 1 }$ agrees modulo null sets with a finite union of intervals.
    There is an interior full-to-empty transition. Consequently, for every fixed $eta > 0$,
    some rational block $\[ s \, s + b \]$ with $0 < b < 1 \/ 8$ satisfies, on an event of positive probability,
#[#set math.equation(numbering: n => "(5.19)")
 $ G \( s + b \) - G \( s \) = b \/ 2 + O \( eta b \) \, wide G \( s + b \/ 2 \) - G \( s \) = b \/ 2 +
   O \( eta b \) . $ <t:jump>]

]
] <t:alternation>

#proof[
  We use the arguments named “Binary derivative”, “Balanced subintervals inside a hill”,
    and “Finite alternation and a full-to-empty jump” in #cite(label("PSE2026"), form: "prose") Section 3.
    Their abstract hypotheses here are: $G$ is $1$-Lipschitz and nondecreasing; (5.11) holds;
    Lemma 44 holds with fixed positive tolerances for each $d \, d_0 \, kappa_0$;
    and costs on disjoint block lists total $O_n \( b_(*) \)$ in expectation. All have been proved.
    The following details show that neither the number of coordinates nor the planar endpoint value enters these
    arguments.
  If interior derivative values occur on a set of positive path-times-exponent measure,
    choose $d in \( 0 \, 1 \)$ and $0 < d_0 < d$ so that a small neighborhood of $d$ captures positive measure.
    At dyadic $b_0 arrow.b 0$, form a rational mesh of candidate blocks for every alternative in Lemma 45.
    Endpoints have spacing $q b_0$, with fixed rational $q$ below all relative tolerances;
    lengths range between fixed positive multiples of $b_0$. Include each finite prefix mesh and use direction
    precision $b_(*) = b_0$. Each family has bounded overlap, so can be colored into finitely many disjoint lists.
    If $cal(C)_I$ is the sum of all costs for candidate $I$, then
  #[#set math.equation(numbering: n => "(5.20)")
   $ sum_I bb(E) cal(C)_I lt.tilde_n b_0 . $ <t:mesh-cost>]
  For $R_(b_0) \( omega \, s \) = sum_(I in.rev s) cal(C)_I \( omega \) \/ b_0$,
    integration over $s$ gives $bb(E) integral R_(b_0) lt.tilde_n b_0$.
    Dyadic summability forces $R_(b_0) arrow.r 0$ almost everywhere.
    At differentiability points, all nearby increments and tested prefixes have their linear approximation with
    error $o \( b_0 \)$. The angular alternative and the vanishing costs then give a successful block test.
    The rational meshes and test parameters form a countable family.
    For each fixed test, Lemma 44 makes its all-success event null;
    the preceding positive-measure interior-derivative event would force one of those null events to have positive
    probability. A countable cover of interior derivative values proves that the derivative is binary.
  We also need a deterministic fact about this binary derivative.
    If $a < b$ are respectively density points of $E$ and $E^c$,
    then for every sufficiently small $r > 0$ there is $\[ x \, y \] subset \( a \, b \)$ with
  #[#set math.equation(numbering: n => "(5.21)")
   $ r lt.eq y - x lt.eq 2 r \, wide G \( y \) - G \( x \) = \( y - x \) \/ 2 \, wide G \( x + u \) -
     G \( x \) gt.eq u \/ 2 quad \( 0 lt.eq u lt.eq y - x \) . $ <t:balanced-hill>]
  To see this, set $H \( s \) = G \( s \) - s \/ 2$. The density assumptions give a closed hill strictly inside
    $\( a \, b \)$, with equal endpoint heights and larger interior values.
    Among levels admitting a closed subinterval of length at least $r$ with values above the level inside,
    choose the highest, by compactness. No component strictly above this level has length greater than $r$,
    since it would admit a higher such interval. The level set has no gap longer than $r$.
    Starting at the left endpoint, its first point at distance at least $r$ lies at distance between $r$ and $2
    r$, and gives (5.21). Finitely many disjoint ordered density pairs give disjoint balanced intervals at every
    sufficiently small common $r$.
  If a positive-probability set of paths had arbitrarily many disjoint ordered full/empty density pairs,
    apply the angular alternatives with $d = 1 \/ 2$, $d_0 = 1 \/ 4$.
    For a successful angular size $b' asymp b_0$, use (5.21) at a size yielding lengths in
    $\[ b' \/ 3 \, 2 b' \/ 3 \]$, and round endpoints to the fixed fine relative mesh.
    Any prescribed number of disjoint hills gives that many spatially and angularly successful candidates for all
    sufficiently small $b_0$. Each must fail a cost test, by Lemma 44;
    such a failure costs a fixed positive multiple of $b_0$. Equation (5.20) bounds the expected number of
    failures uniformly in $b_0$. Fatou’s lemma contradicts its tending to infinity on a positive-probability set.
    Thus almost every path has finitely many alternations among density points.
    Their ordered types, together with the Lebesgue density theorem,
    make $E$ a finite union of intervals modulo null sets.
  Finally (5.10) gives $\| E \| = n \/ \( n + 1 \) < 1$ and $\( n + 1 \) \| E ∩ \[ 0 \, s \] \| gt.eq n s$.
    The latter prevents an initial empty interval and the former forces a later empty interval.
    There is therefore an interior full-to-empty jump. Choose a small block with midpoint within $eta
    b$ of the jump, round its endpoints rationally, and keep its halves inside the adjacent full and empty
    intervals except for this error. The countable rational choices cover almost every path,
    so one has positive probability. This gives (5.19) with $b < 1 \/ 8$. ◻
]

=== 5.6 The growing-degree partitioning contradiction <the-growing-degree-partitioning-contradiction>

#thm([Lemma 5.12.])[
  (No full-to-empty block).  #emph[For sufficiently small fixed $eta > 0$,
    the positive-probability event in (5.19) is impossible.]
] <t:no-jump>

#proof[
  Fix the rational block and put $K = L^b$. Endpoint and midpoint increments for $F$ are both $\( n + 1 \) b \/
    2 + O_n \( eta b \)$; the conditional endpoint increment given $T = T_1$ is $b \/ 2 + O \( eta b \)$.
    Pass to finite scale with slack and fix a parent $C = X_s =
    c$ having conditional success probability at least a fixed $p_(*) > 0$. Write
  $ p_c \( z \) = bb(P) \( X_(s + b) = z divides C = c \) \, wide q_T \( z \) =
    bb(P) \( X_(s + b) = z divides T \, C = c \) . $
  Call $\( T \, z \)$ good when it has some successful realization.
    Let $cal(Z)$ be the good endpoint labels, represented by their centers in normalized parent coordinates.
    Since the bounds depend only on the displayed labels, goodness by existence preserves
  #[#set math.equation(numbering: n => "(5.22)")
   $ K^(- \( n + 1 \) \/ 2 - O_n \( eta \)) lt.eq p_c \( z \) lt.eq K^(- \( n + 1 \) \/ 2 + O_n \( eta \)) \, wide
     q_T \( z \) lt.eq K^(- 1 \/ 2 + O_n \( eta \)) quad upright("for good ") \( T \, z \) . $ <t:good-masses>]
  The midpoint mass upper bound divided by the endpoint mass lower bound gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ \| cal(Z) \| lt.eq K^(\( n + 1 \) \/ 2 + O_n \( eta \)) \,
     wide \# \( cal(Z) ∩ B \( z \, C K^(- 1 \/ 2) \) \) lt.eq K^(O_n \( eta \)) . $ <t:good-counts>]
  Good incidences have central-line error $delta = K^(- 1) L^(o \( 1 \))$ in this bounded parent.
  Choose small fixed $epsilon > 0$ and $P = K^(1 \/ 2 - epsilon)$.
    Polynomial partitioning in $bb(R)^(n + 1)$ gives a nonzero polynomial of degree $O_n \( P \)$ whose open
    complementary cells each contain at most
  #[#set math.equation(numbering: n => "(5.24)")
   $ O_n \( \| cal(Z) \| \/ P^(n + 1) \) = K^(\( n + 1 \) epsilon + O_n \( eta \)) $ <t:partition-occupancy>]
  points; points on the zero set are assigned to the wall. This is the finite-point polynomial partition theorem
    #cite(label("GuthKatz2015")) Theorem 4.1, whose polynomial ham-sandwich construction works in every fixed
    ambient dimension.
  Take a wall of thickness a sufficiently large constant times $delta$.
    At midpoint resolution $r = K^(- 1 \/ 2)$, Wongkew’s hypersurface neighborhood-volume bound
    #cite(label("Wongkew1993")) Main Theorem, in a fixed ball slightly larger than the parent,
    gives the number of boxes meeting this wall as
  #[#set math.equation(numbering: n => "(5.25)")
   $ O_n (sum_(a = 1)^(n + 1) P^a r^(a - \( n + 1 \))) = O_n \( P K^(n \/ 2) \) . $ <t:wall-count>]
  Indeed $delta = o \( r \)$, so thicken to $O \( r \)$, use the volume estimate, and divide by $r^(n + 1)$.
    The equality follows from $P r = K^(- epsilon)$. The formula includes singular zero sets and all degree
    powers; the degree is allowed to grow here. Equations (5.22) and (5.23) bound the discarded good mass by
  #[#set math.equation(numbering: n => "(5.26)")
   $ O_n \( P K^(n \/ 2) \) K^(O_n \( eta \)) K^(- \( n + 1 \) \/ 2 + O_n \( eta \)) =
     K^(- epsilon + O_n \( eta \)) = o \( 1 \) \, $ <t:wall-mass>]
  once $eta lt.double_n epsilon$.
  The wall contains the incidence error, so the nearby central-line point of each surviving endpoint belongs to
    the same open cell. A line not contained in the zero set crosses at most $O_n \( P \)$ cells;
    a line in it has no off-wall incidence. Draw $T$ with its original marginal given $C = c$, and then $z \,
    z'$ independently with law $q_T$. If $g \( T \)$ is the $q_T$ mass of good off-wall endpoints,
    then $bb(E) g \( T \) gt.eq p_(*) \/ 2$. Cauchy over the cells visited by $T$, followed by Jensen, gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ bb(P) { z \, z' upright(" good off-wall in the same cell") divides C = c } gt.tilde_n P^(- 1) =
     K^(- 1 \/ 2 + epsilon) . $ <t:pair-lower>]
  For $\| z - z' \| lt.tilde K^(- 1 \/ 2)$ there are at most $K^(O_n \( eta \))$ possible good second endpoints by
    (5.23); each costs $K^(- 1 \/ 2 + O_n \( eta \))$ under $q_T$.
    Near pairs therefore contribute at most $K^(- 1 \/ 2 + O_n \( eta \))$.
  For a farther pair, a line incident to both endpoints to error $delta$ has direction in one of two caps of
    radius $K^(- 1 \/ 2 + o \( 1 \))$, hence in caps of radius $K^(- 1 \/ 3)$ for large $L$.
    Under the double sampling, the $\( T \, z \)$ marginal is the original joint law. Thus
  #[#set math.equation(numbering: n => "(5.28)")
   $ bb(P) \( T in cal(A) divides z \, C = c \) = sum_(x : X_(s + b) \( x \) = z)
     bb(P) \( X = x divides z \, C = c \) bb(P) \( T in cal(A) divides X = x \) . $ <t:posterior-law>]
  An angular cap is contained, on bounded frequency sets, in a codimension-two strip of comparable width.
    Use (5.5) at exponent $b \/ 3 < 1 \/ 8$ in each term of this mixture.
    Its cap probability is at most $K^(- c_1 \/ 3 + o \( 1 \))$.
    For each first endpoint, the same-cell list has at most $K^(\( n + 1 \) epsilon + O_n \( eta \))$ second
    endpoints by (5.24); this list is fixed before drawing $T$.
    On a good second incidence, bound $q_T \( z' \)$ by (5.22),
    then apply the cap bound to the remaining indicator and sum the list. The far-pair contribution is at most
  $ K^(- 1 \/ 2 - c_1 \/ 3 + \( n + 1 \) epsilon + O_n \( eta \) + o \( 1 \)) . $
  No angular estimate conditional on the success event has been used.
    After division by (5.27), the near and far bounds are
  $ K^(- epsilon + O_n \( eta \)) \, wide K^(- c_1 \/ 3 + n epsilon + O_n \( eta \) + o \( 1 \)) . $
  Choose $epsilon lt.double_n c_1$, then $eta lt.double_n epsilon$. Both tend to zero, contradicting (5.27). ◻
]

#proof[
  A countersequence yields Lemma 38. Its information profiles coincide by Lemma 42;
    Lemma 46 supplies a full-to-empty block with any prescribed small fixed tolerance. Lemma 47 forbids it.
    Hence no countersequence exists, which supplies a fixed $c > 0$ and a large-scale threshold as asserted. ◻
]

== 6 Sparse packet arrays <s:section>

The transverse saving gives a strict improvement when each individual packet encounters little measure.
  The broad–narrow organization follows Bourgain–Guth #cite(label("BourgainGuth2011")) Section 2 and its fractal
  Schrödinger implementation in Du–Zhang #cite(label("DuZhang2019")) Section 3.
  Here the iteration must also preserve the packet moment condition under parabolic rescaling.
  Broad leaves gain from Proposition 36; at the stopping scale the packet moment condition improves the
  square-root-scale density in the refined fractal estimate.

#thm([Proposition 6.1.])[
  (Sparse estimate).  #emph[There is $c_s > 0$, depending only on the fixed dimension and packet boxes,
    with the following property. Fix $tau > 0$ and $L^tau lt.eq D lt.eq L$.
    Let $U$ be a full-dimensional compact-profile array of scale $L$, with coefficient energy $cal(E) =
    sum_alpha \| c_alpha \|^2$. Let $mu$ be a nonnegative measure on the fixed native time range, obeying
$ mu \( B \( z \, r \) \) lt.eq m r^n quad \( r gt.eq 1 \) \, wide
  integral (1 + frac(\| x - y_alpha - 2 t omega_alpha \|, L))^(- M) thin upright(d) mu \( x \, t \) lt.eq
  frac(m L^(n + 1), D) $

 for every nonzero packet label, as in Definition 27. For sufficiently many bounded profile derivatives,
#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(q upright(" unit")) mu \( q \)^beta sup_q \| U \|^2 lt.eq
   C_tau m^beta L^(2 n \/ \( n + 1 \)) D^(- c_s) cal(E) \, wide beta = frac(2, n + 1) . $ <s:estimate>]

 The same estimate holds for any fixed finite set of field derivatives if the original profiles have sufficiently
   many more derivatives. The exponent $c_s$ is independent of $tau$;
   the constant and the required finite differentiability may depend on $tau$.
   Restrictions to submeasures and fixed enlargements of the native time range are allowed.]
] <s:sparse>

=== 6.1 The local functional and exact layers <the-local-functional-and-exact-layers>

Choose a dyadic $K asymp L^v$, with $v > 0$ chosen at the end, and put

$ P = frac(2, 1 - beta) = frac(2 \( n + 1 \), n - 1) = q_(n - 1) \, wide cal(T)_beta \( V \, nu \) =
  sum_(Q upright(" a ") K^2 upright("-cube")) nu \( Q \)^beta lr(bar.v.double V bar.v.double)_(L^P \( Q \))^2 . $

This is the functional from Section 4; its square root is a seminorm.
  For a fixed finite set of multiindices $a$, unit-cube Sobolev followed by Hölder gives

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(q subset Q) mu \( q \)^beta sup_q \| U \|^2 & lt.tilde sum_a sum_(q subset Q) mu \( q \)^beta
   lr(bar.v.double partial^a U bar.v.double)_(L^P \( q \))^2\
 & lt.eq sum_a mu \( Q \)^beta lr(bar.v.double partial^a U bar.v.double)_(L^P \( Q \))^2 . $ <s:sobolev>]

Here $2 \/ P = 1 - beta$, and the grids may be chosen nested.
  The cube Sobolev inequality controls closures, so boundary suprema cause no problem.
  Differentiating a compact atom produces finitely many atoms with the same labels and comparable energy:
  carrier frequencies are bounded, and native derivatives carry only bounded powers of $L^(- 1)$.
  It suffices to estimate $cal(T)_beta$ for these arrays.

First restrict space to boxes of side $L^2$. On the stipulated time range a compact packet meets only boundedly
  many fixed enlargements of these boxes, because its velocity is bounded.
  The retained coefficient energies therefore sum with bounded overlap.

Apply Lemma 30 to each localized compact array. Its exact Fourier layers are indexed by $\( k \, u \) in bb(Z)^n
  times bb(R)$, with an integrable common weight $w \( k \, u \)$ and exterior phase $e^(i u t \/ L^2)$.
  After division by that weight, every subarray $A$ has exact input squared norm at most $C sum_(alpha in A) \|
  c_alpha \|^2$. Its frequency support is within $O \( L^(- 1) \)$ of $omega_alpha + k \/ L$,
  and on a fixed slightly enlarged native time range its packets have any prescribed finite spatial decay order
  about the original trajectories and bounded native frequency seminorms.
  These properties follow from the native Fourier identity $u =
  zeta + \| eta \|^2$ and the summable phase-space Gram rows; they apply to every subarray with the same constant.

Minkowski for $cal(T)_beta^(1 \/ 2)$ returns a bound for the original array after integrating the layer weights.
  The exterior phase has modulus one and is removed before the iteration.
  For the derivative version, differentiate compact atoms before taking layers;
  no derivative of this exterior phase enters the iteration. Choose a small fixed $gamma > 0$ later.
  Layers with $\| k \| > L^gamma$ have arbitrarily small negative-power contribution by choosing the weight decay
  last. Indeed, after normalizing $m = cal(E) = 1$ on one original spatial box, the relevant masses, cell counts,
  and field suprema are polynomial in $L$. The layer input bound and bounded frequency volume give the uniform
  supremum bound needed for this tail estimate. Henceforth one retained normalized layer is fixed.

=== 6.2 A fixed gain on broad cubes <a-fixed-gain-on-broad-cubes>

At packet scale $l$, group labels into $1 \/ K$-frequency bins and write $V = sum_theta V_theta$.
  Every subfield is exact and has support within $O \( l^(- 1) \)$ of its label bin plus the common shift $k \/
  l$. Our choices will guarantee $l gt.double K^2$ and $\| k \| \/ l = o \( 1 \)$. Call a bin active on $Q$ when

#[#set math.equation(numbering: n => "(6.3)")
 $ lr(bar.v.double V_theta bar.v.double)_(L^P \( Q \)) gt.eq
   K^(- A) lr(bar.v.double  bar.v.double) V_(L^P \( Q \)) \, $ <s:activity>]

where $A > n + 1$ is fixed sufficiently large. The $O \( K^n \)$ inactive bins have total norm at most $C
  K^(n - A) lr(bar.v.double  bar.v.double) V_(L^P \( Q \))$, which can be absorbed.

#thm([Lemma 6.2.])[
  (The geometric alternative).  #emph[For a fixed sufficiently large $C_0$,
    either all active centers lie within $C_0 \/ K$ of an affine hyperplane, or $n +
    1$ active bins have direction determinant at least $c K^(- n)$ throughout their exact supports.
    A common frequency shift does not affect this alternative.]
] <s:simplex>

#proof[
  Choose one center $xi_0$, and then greedily choose a center of largest distance from the affine span of the
    previous choices. If a maximum distance is at most $C_0 \/ K$,
    all centers lie in that neighborhood of the current affine span, hence of a hyperplane.
    Otherwise the $n$ Gram–Schmidt heights $d_1 gt.eq dots.h.c gt.eq d_n$ all exceed $C_0 \/ K$.
    In the resulting orthonormal basis, the column matrix of $xi_j -
    xi_0$ is upper triangular with diagonal $d_j$ and every entry in row $j$ bounded by $d_j$,
    by the greedy choice. Factoring out these row heights leaves a unit upper-triangular matrix with bounded
    entries and bounded inverse, with constants depending only on $n$.
    Thus the inverse original matrix has norm $O_n \( d_n^(- 1) \)$.
    Perturbing the vertices by $O \( K^(- 1) \)$ changes its determinant by a relative
    $O_n \( \( K d_n \)^(- 1) \)$, which is small for sufficiently large $C_0$.
    Its determinant is at least $product_j d_j gt.tilde K^(- n)$.
    The exact support enlargements are smaller than these bin perturbations.
    The determinant of the spacetime directions $\( 2 xi_j \, 1 \)$ is a fixed multiple of this simplex
    determinant. Common translation preserves it; unit normalization changes it only by bounded factors because
    the frequencies remain bounded. ◻
]

Call the first case narrow and the second broad.

#thm([Lemma 6.3.])[
  (Broad gain).  #emph[There exists $c_b > 0$, depending only on the fixed frequency box and $n$,
    such that if $K lt.eq l^(c_b)$, then in every box of side $O \( l^2 \)$,
#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(Q upright(" broad")) nu \( Q \)^beta lr(bar.v.double  bar.v.double) V_(L^P \( Q \))^2 lt.tilde m_0^beta
   l^(2 n \/ \( n + 1 \) - c_b) cal(E)_0 . $ <s:broad-bound>]

 Here $nu \( B \( z \, r \) \) lt.eq m_0 r^n$ for $r gt.eq 1$,
   and the input squared norms of the total field and every subfield are at most $C cal(E)_0$.
   The fixed $C$ may affect the implicit constant, but the gain is independent of packet differentiability and
   decay orders.]
] <s:broad>

#proof[
  If no positive $c_b$ works, normalize $m_0 = cal(E)_0 = 1$ and the fixed input norm bound to obtain a sequence
    with $l arrow.r oo$, $K = l^(o \( 1 \))$, and broad contribution at least
    $l^(2 n \/ \( n + 1 \) - o \( 1 \))$. Polynomially small mass and norm levels are negligible by the polynomial
    number of cubes and uniform exact-field supremum bound. Pigeonhole a common active transverse tuple and dyadic
    levels $nu \( Q \) asymp chi$, $lr(bar.v.double  bar.v.double) V_(L^P \( Q \)) asymp A_0$ on $N$ cubes.
    Tuple choices cost $K^(O_n \( 1 \))$ and level choices cost logarithms, all subpower here. We have
  #[#set math.equation(numbering: n => "(6.5)")
   $ chi^beta A_0^2 N gt.eq l^(2 n \/ \( n + 1 \) - o \( 1 \)) \, wide chi lt.eq l^(o \( 1 \)) \, wide
     chi N lt.tilde l^(2 n) . $ <s:broad-saturation>]
  Each chosen active field has supremum at least $K^(- A - \( n - 1 \)) A_0$ on some unit cube in $Q$,
    since $\| Q \|^(1 \/ P) = K^(n - 1)$. Pigeonholing the $n +
    1$ relative integer offsets of these witnesses costs $K^(O_n \( 1 \))$.
    Translate the fields separately by these fixed offsets so that their witnesses lie on a common unit cube
    associated to each retained $Q$. These cubes are distinct;
    translations modulate exact inputs and preserve supports and norms.
    Lemma 37 applies with determinant $K^(- n) = l^(- o \( 1 \))$, and gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ A_0^(2 \( n + 1 \) \/ n) N lt.eq l^(o \( 1 \)) . $ <s:product-count>]
  In particular the inverse-transversality constant is controlled; no unspecified dependence is used.
  For completeness, take limiting base-$l$ logarithms $\( x \, y \, z \)$ of $\( chi \, A_0 \, N \)$ along a
    subsequence. The retained levels give polynomial bounds, so these subsequences exist.
    Equations (6.5) and (6.6) imply
  $ x lt.eq 0 \, quad x + z lt.eq 2 n \, quad frac(2 \( n + 1 \), n) y + z lt.eq 0 \, quad beta x + 2 y + z gt.eq
    frac(2 n, n + 1) . $
  They force equality throughout
  $ frac(2 n, n + 1) lt.eq beta x + 2 y + z lt.eq frac(2 x + z, n + 1) lt.eq frac(2 n + x, n + 1) lt.eq
    frac(2 n, n + 1) . $
  Thus
  #[#set math.equation(numbering: n => "(6.7)")
   $ chi = l^(o \( 1 \)) \, wide N = l^(2 n + o \( 1 \)) \, wide A_0 = l^(- e + o \( 1 \)) . $ <s:saturated-sizes>]
  The attached witness cubes have $l^(o \( 1 \)) r^n$ counts for $r gt.eq 1$:
    their full disjoint $K^2$-cubes, each of mass at least $l^(- o \( 1 \))$, lie in a ball of radius $r +
    C K^2$ whenever their witnesses lie in a radius-$r$ ball.
    This gives at most $l^(o \( 1 \)) \( r + C K^2 \)^n lt.eq l^(o \( 1 \)) r^n$ witnesses.
    The translated fields and (6.7) now contradict Proposition 36.
    This proves a fixed positive gain; decrease it if necessary so the same $c_b$ occurs in both the hypothesis
    and conclusion of the lemma. ◻
]

=== 6.3 Narrow transport and the measure on each branch <narrow-transport-and-the-measure-on-each-branch>

On a narrow cube apply the codimension-one decoupling inequality in Lemma 33 to the full sum of active bins.
  Absorb the inactive sum using (6.3), and then extend the right side to all bins,
  with their complete child fields. With any prescribed large $N_1$, the squared-norm bound is

#[#set math.equation(numbering: n => "(6.8)")
 $ lr(bar.v.double  bar.v.double) V_(L^P \( Q \))^2 lt.tilde_epsilon K^epsilon sum_theta
   sum_(a in bb(Z)^(n + 1)) \( 1 + \| a \| \)^(- N_1)
   lr(bar.v.double V_theta bar.v.double)_(L^P \( Q + K^2 a \))^2 . $ <s:narrow-decoupling>]

The decoupling hypotheses hold because the active labels are in an $O \( K^(- 1) \)$ hyperplane strip,
  the exact support enlargement is $O \( l^(- 1) \) lt.double K^(- 1)$,
  and after removing the normal linear phase the normal quadratic contribution has vertical thickness
  $O \( K^(- 2) \)$. The exponent is exactly $P = q_(n - 1)$.
  Smooth cutoff localization and bounded overlap of projected tangential caps, as in Lemma 33,
  allow arbitrary prescribed active subfields, including overlapping enlarged supports.

For a child bin centered at $v_0$, use

#[#set math.equation(numbering: n => "(6.9)")
 $ Phi_(v_0) \( x \, t \) = (frac(x - 2 v_0 t, K) \, t / K^2) \, wide l' = l \/ K \, quad y'_alpha =
   y_alpha \/ K \, quad omega'_alpha = K \( omega_alpha - v_0 \) . $ <s:child-map>]

After removing the carrier, $V_theta = K^(- n \/ 2) V'_theta compose Phi_(v_0)$.
  Native variables, coefficient energies, and phase-space counting remain unchanged.
  For the direct pushforward $nu' = \( Phi_(v_0) \)_(\#) nu$,

#[#set math.equation(numbering: n => "(6.10)")
 $ nu' \( B \( z \, r \) \) lt.eq C K^(n + 1) m_0 r^n \, wide
   integral (1 + frac(\| x' - y'_alpha - 2 t' omega'_alpha \|, l'))^(- M) thin upright(d) nu' lt.eq
   frac(m_0 l^(n + 1), D) . $ <s:direct-measure>]

Indeed the inverse ball is covered by $O \( K \)$ balls of radius $O \( K r \)$.
  The normalized transverse distance in the moment integrand is unchanged pointwise,
  and $K^(n + 1) \( l' \)^(n + 1) = l^(n + 1)$.

Lemma 34 gives, for each fixed shift $a$, a finite sum of child functionals against translates of this direct
  pushforward, with total factor

#[#set math.equation(numbering: n => "(6.11)")
 $ C K^(2 - \( n + 2 \) beta) = C K^(- beta) . $ <s:transport-power>]

To see the exponent, the Jacobian is $K^(n + 2)$, the normalized field contributes $K^(- n)$ in squared norm,
  and $2 \/ P = 1 - beta$; the product is $K^(\( n + 2 \) \( 1 - beta \) - n)$.
  Group disjoint shifted parent images by the child $K^2$-cube containing the image of their centers.
  Hölder within the group bounds the sum by total pushed-forward mass to power $beta$ times the norm on a bounded
  enlargement. Subdividing the enlargement introduces only finitely many neighboring cube translates.
  There is no factor for the number of parent cubes in a group.

We keep each shift and each finite neighbor choice as a separate weighted branch of the iteration.
  The shift coefficients in (6.8) are summable, uniformly in their truncation;
  the finite neighbor choices cost a fixed constant. Thus the total weighted coefficient energy of the children is
  at most a fixed constant times the parent energy. The bins themselves partition the packet labels.
  This bookkeeping permits each branch to retain a measure with parameter $C K^(n + 1) m_0$,
  without aggregating all translated measures into one.

Truncate $\| a \| lt.eq L^eta$ for a sufficiently small fixed $eta > 0$.
  The omitted tail is negligible by choosing $N_1$ last: exact fields have polynomial global supremum bounds,
  and normalized relevant masses, cells, and depths are polynomially bounded.
  Each remaining child translate has displacement $d$ with $\| d \| lt.tilde K^2 L^eta$.
  Its effect on the child’s transverse displacement is $d_x - 2 omega'_alpha d_t$.
  The child label velocities are bounded, and we impose

#[#set math.equation(numbering: n => "(6.12)")
 $ K^2 L^eta lt.double l' $ <s:shift-smallness>]

at every existing child scale. The moment weight therefore changes by at most a fixed factor;
  the same fixed inflation of $m_1 = C K^(n + 1) m_0$ bounds both balls and moments.
  Time shifts are $o \( l' \)$, so a fixed slightly enlarged native time range is preserved through the bounded depth.

In particular, a depth-$j$ branch with $h = K^j$, $l = L \/ h$, has

#[#set math.equation(numbering: n => "(6.13)")
 $ m_j lt.eq C^j h^(n + 1) m \, $ <s:node-parameter>]

and the narrow prefactor, before the arbitrarily small decoupling losses, is $C^j h^(- beta)$.
  The main factors cancel exactly:

#[#set math.equation(numbering: n => "(6.14)")
 $ K^(2 - \( n + 2 \) beta) K^(\( n + 1 \) beta) K^(- 2 n \/ \( n + 1 \)) = 1 \, wide
   h^(- beta) m_j^beta l^(2 n \/ \( n + 1 \)) lt.eq C^j m^beta L^(2 n \/ \( n + 1 \)) . $ <s:cancellation>]

=== 6.4 Stopping and the terminal square-root-scale gain <stopping-and-the-terminal-square-root-scale-gain>

Stop just before a further division by $K$ would take the packet scale below $D^(1 \/ 2)$.
  Every existing scale has $l gt.eq D^(1 \/ 2)$, and terminal scales satisfy

#[#set math.equation(numbering: n => "(6.15)")
 $ D^(1 \/ 2) lt.eq l < K D^(1 \/ 2) . $ <s:terminal-scale>]

The depth $J = O \( v^(- 1) \)$ is fixed once $v$ is chosen.

At any node work spatial box by spatial box at side $O \( l^2 \)$.
  Retain the exact packet labels whose original label trajectories meet a fixed enlargement of the box.
  Their energies have bounded overlap over the boxes on the node time range, also for every child subarray.
  The exact layers have arbitrarily prescribed decay about these trajectories, uniformly after normalization.
  Discarded fields are therefore smaller than any chosen negative power of $L$,
  by phase-space counting and Cauchy, since $l gt.eq L^(tau \/ 2)$.
  Use the same retained labels for the total field and all its subfields.
  Ignore polynomially tiny total-field levels before the activity tests,
  and choose localization errors still smaller; this preserves the broad lower bounds.
  Equivalently apply the tests anew to the localized exact array.
  Its total and subfield input norms are bounded by retained coefficient energy through Lemma 30.
  These observations justify summing Lemma 50 over spatial boxes and summing energies over each depth of the tree.

At a terminal node, keep only $K^2$-cubes within transverse distance $l L^eta$ of at least one label trajectory;
  the others have negligible contribution by the same rapid decay. Restrict the node measure to these cubes.
  If a radius-$l$ ball meets this retained support, choose one nearby trajectory from a cube it meets.
  Since $K^2 lt.double l$ and velocities are bounded, every point of the ball is at normalized transverse distance
  $O \( L^eta \)$ from that one trajectory. Its moment bound gives

#[#set math.equation(numbering: n => "(6.16)")
 $ nu \( B \( z \, l \) \) lt.eq C L^(O \( M eta \)) frac(m_j l^(n + 1), D) . $ <s:terminal-mass>]

The assertion also holds for fixed ball enlargements. One trajectory is used for each ball;
  there is no summation over nearby packets.

Normalize the node energy to one and sort retained cubes by $nu \( Q \) asymp m_j chi$,
  where $chi lt.tilde K^(2 n)$. Polynomially tiny levels are negligible by the polynomial cell count and
  exact-input supremum bound, leaving only $O \( log L \)$ levels.
  In each $Q$ choose a unit witness $q_Q$ of largest field supremum. Since $\| Q \|^(2 \/ P) = K^(2 \( n - 1 \))$,

#[#set math.equation(numbering: n => "(6.17)")
 $ sum_(Q upright(" in the class")) nu \( Q \)^beta lr(bar.v.double  bar.v.double) V_(L^P \( Q \))^2 lt.tilde
   K^(2 \( n - 1 \)) \( m_j chi \)^beta sum_Q sup_(q_Q) \| V \|^2 . $ <s:terminal-witness>]

These witnesses need not carry measure. Their counts are controlled by their disjoint full cubes,
  each of mass comparable to $m_j chi$. For $r gt.eq 1$ the count is at most $C chi^(- 1) \( r + C K^2 \)^n
  lt.tilde K^(2 n) chi^(- 1) r^n$. At radius $l$, (6.16) gives the improved count $C L^(O \( M eta \)) chi^(- 1)
  l^(n + 1) \/ D$.

Apply Theorem 28 at $S asymp l^2$ with parameters

$ gamma_0 lt.tilde K^(2 n) chi^(- 1) \, wide lambda_0 lt.tilde L^(O \( M eta \)) chi^(- 1) l^(n + 1) \/ D . $

Writing

$ a_n = frac(4, \( n + 1 \) \( n + 2 \)) \, wide theta_n = frac(2 n, \( n + 1 \) \( n + 2 \)) \, $

its bound is $O_epsilon \( S^epsilon \) gamma_0^(a_n) lambda_0^(theta_n) S^(theta_n)$.
  The normalized weight cancels exactly because $beta - a_n - theta_n = 0$.
  Combining with (6.17) and restoring energy proves

#[#set math.equation(numbering: n => "(6.18)")
 $ cal(T)_beta \( V \, nu \) lt.tilde_epsilon K^(C_n) L^(O \( M eta \) + epsilon) m_j^beta
   l^(2 n \/ \( n + 1 \)) \( l \/ D \)^(theta_n) cal(E)_(upright("node")) \, $ <s:terminal-bound>]

where one may take $C_n = 2 \( n - 1 \) + 8 n \/ \( \( n + 1 \) \( n + 2 \) \)$,
  increasing it for fixed grid enlargements. Indeed the unsimplified $l$ power is $\( n + 3 \) theta_n =
  2 n \/ \( n + 1 \) + theta_n$. The logarithmic level count has been absorbed in the freely chosen small power
  loss. The input localization above handles spatial supports larger than one $l^2$-box.

=== 6.5 Order of parameters and summation of the iteration <order-of-parameters-and-summation-of-the-iteration>

#proof[
  It remains to make the positive gains dominate every loss uniformly in $D$.
    Bounded $L$ is absorbed in the constant, and $tau > 1$ has no unbounded admissible scales,
    so assume $0 < tau lt.eq 1$. Fix first
  #[#set math.equation(numbering: n => "(6.19)")
   $ a_(*) = min { c_b \/ 2 \, theta_n \/ 2 } \, wide c_s = a_(*) \/ 8 . $ <s:saving-choice>]
  A broad leaf gains $l^(- c_b) lt.eq D^(- c_b \/ 2)$, and a terminal leaf gains, by (6.15),
  $ \( l \/ D \)^(theta_n) lt.eq K^(theta_n) D^(- theta_n \/ 2) . $
  Thus every leaf gains $D^(- a_(*))$ before its small losses and the displayed terminal $K$ factors.
    In particular this preliminary gain is independent of $tau$.
  Choose $v > 0$ sufficiently small, with fixed strict margins, that
  #[#set math.equation(numbering: n => "(6.20)")
   $ v < frac(tau c_b, 4) \, wide 2 v < tau / 4 \, wide \( C_n + theta_n \) v < frac(tau a_(*), 16) .
     $ <s:parameter-inequalities>]
  These imply $K lt.eq l^(c_b)$ at all broad nodes, and permit the terminal $K$ factors to consume at most
    $D^(a_(*) \/ 8)$ after fixed rounding constants are absorbed. The depth $J = O \( v^(- 1) \)$ is now fixed.
    Choose the decoupling and refined-fractal losses so that their total product along a path is at most
    $D^(a_(*) \/ 8)$. Choose $eta > 0$ next, depending on $J \, M$ as well, so that all padding losses,
    including (6.16), cost at most $D^(a_(*) \/ 8)$, and
  $ 2 v + eta < tau \/ 2 . $
  This proves (6.12) at every existing child scale, because $l' gt.eq D^(1 \/ 2) gt.eq L^(tau \/ 2)$.
    Choose $gamma < tau \/ 8$, so that the retained layer shift satisfies $\| k \| \/ l =
    o \( 1 \)$ at every node. Finally choose the frequency-tail powers, spatial decay orders,
    and profile differentiability large enough to make all discarded errors negligible.
    Those last choices do not change $c_b$ or $c_s$.
  On a depth-$j$ branch, (6.14) makes the transported quantity $m_j^beta l^(2 n \/ \( n + 1 \))$ equal,
    up to $C^j$, to the root quantity after multiplication by the narrow prefactor.
    At a fixed depth, angular bins partition energies, separate shifts have a uniformly summable total weight,
    finite neighbor choices cost a fixed constant, and spatial localizations have bounded energy overlap.
    Thus the total weighted leaf energy at that depth is at most $C^j$ times the original energy.
    Summing over the bounded number of depths costs only a constant depending on $tau$.
    The allocations above leave more than the saving $D^(- c_s)$.
  For clarity, ignored errors are also uniform after the whole tree is summed.
    On each original spatial box normalize mass parameter and energy;
    there are polynomially many labels after localization, cells, shift choices after truncation,
    and branches at bounded depth. Their parameters are polynomially bounded.
    The tail orders were chosen last and therefore beat this entire fixed polynomial,
    relative to $m^beta L^(2 n \/ \( n + 1 \)) D^(- c_s) cal(E)$.
    Minkowski over the integrable exact-layer weights, the Sobolev reduction (6.2),
    and the initial spatial energy sum now give (6.1), also for the prescribed derivatives. ◻
]

== 7 A lossless weak estimate <sec:weak>

The power saving of 48 is available when the sparsity parameter is a positive power of the packet scale.
  We now reach every $D gt.eq 1$ by a second induction. Its geometric step places most of a hypothetical large
  level set near affine plates. The frame estimate can then be applied in one fewer spatial dimension.
  The additional unit density parameter in the next theorem makes the small-density part of this induction contract.

#thm([Theorem 7.1.])[
  (Weak estimate with density and sparsity).  #emph[Fix $n gt.eq 3$, and use the compact arrays,
    measure conditions and fixed time range of 27. There are constants
$ p > 2 \, wide sigma > 0 \, wide 0 < 2 a < 1 - beta \, wide beta = frac(2, n + 1) \, quad e = frac(n^2, n + 1) \, $

 depending only on the dimension and the fixed packet conventions, for which the following holds.
   Suppose that the array has coefficient energy $E$, that $1 lt.eq D lt.eq L$,
   and that the measure has ball and packet-moment parameter $m$ as in 27. Suppose also that
$ mu \( B \( z \, 1 \) \) lt.eq m chi \, wide 0 < chi lt.eq 1 \, $

 and that its support is in a box of side $O \( L^2 \)$ within the fixed time range. For every $g > 0$,
#[#set math.equation(numbering: n => "(7.1)")
 $ mu { z : \| U \( z \) \| gt.eq chi^a g L^(- e) } lt.eq C_(upright("ind")) m L^(2 n) g^(- p) D^(- sigma)
   E^(p \/ 2) . $ <w:eq-weak>]

 The constants are independent of $L \, D \, m \, chi \, g$ and the particular array.
   The assertion also holds for a subarray with its original native profiles.]
] <w:weak>

We prove the theorem with $E = 1$; multiplying all coefficients by $E^(1 \/ 2)$ gives the general statement.
  A zero energy or a zero measure parameter is harmless. Every recursive application will use original compact
  profiles, possibly after the unrotated cap rescaling already specified in 34.
  In particular, derivatives introduced in a nonrecursive localization will never become extra hypotheses at the
  next induction level.

The induction is on dyadic ranges of $L$. For a small exponent $kappa > 0$ to be chosen below,
  the inner parameter at a fixed range of $L$ is the number of doublings of $D$ needed to reach $L^kappa$.
  Thus an application at smaller $L$ is an outer induction step,
  while an application at the same $L$ and at least twice the value of $D$ is an inner step.
  Angular rescaling will use the outer hypothesis; removing subarrays with smaller packet moments will use the
  inner hypothesis. Spatial support constants remain fixed:
  partition a larger box into a bounded number of boxes of the stipulated size,
  keep the compact packets meeting each, and sum their $p \/ 2$-powers of energy. The energy overlap is bounded.
  The time-range constant is fixed to contain the packet supports.

=== 7.1 Order of choices and the easy ranges <w:choices>

Choose

#[#set math.equation(numbering: n => "(7.2)")
 $ beta < b < 2 / n \, wide 2 a = 1 - b + delta \, wide zeta = 1 - beta - 2 a = b - beta - delta > 0 \, $ <w:eq-ab>]

with $delta > 0$ small. We will use

$ X = B D \, wide R = K^J asymp X^u \, $

where $K$ is dyadic, $J$ is a fixed large integer, $u > 0$ is small, and $B$ is a fixed large constant.
  Dyadic rounding changes only constants depending on $J$. We list the order of choices because both inductions
  use strict gains.

+ Fix $b$, then small $delta$ and a range $2 < p lt.eq p_max$. Choose $J$ large enough for 52.
  That lemma gives a fixed gain $R^(- c_2)$, with $c_2 > 0$ uniform as an exponent in this range of $p$.
  Its numerical constants need not be uniform as $p arrow.b 2$.
+ Fix a small unit-density cutoff exponent $v_0 > 0$. The positive dimensional margin
  #[#set math.equation(numbering: n => "(7.3)")
   $ n - 1 / 2 - e = frac(n - 1, 2 \( n + 1 \)) > 0 $ <w:eq-threshold-margin>]
  allows the power cutoff in the eventual frame application to be fixed at this stage.
    For this fixed cutoff, fix the normalized profile bounds and the envelope and derivative orders for 14,
    including fixed reserves for its nonrecursive localization.
    The inverse-transversality, coarse-tuple and witness costs are then $R^(C_f)$,
    with $C_f$ independent of all geometric powers chosen below.
    Take $u$ so small that $u C_f < c_s \/ 4$, reducing it for any other fixed frame cost.
    Then choose $sigma > 0$ much smaller than $u c_2$ and $c_s$.
+ Choose the finite powers of $X$ required for the inner sparsity parameter, the wall tests,
  the plate count and width, the final ratio $L \/ h$, and the tiny-density cutoff.
  The exponent in the eventual polynomial bound on $g$ is also determined by these choices.
  Use $p_max$ in any upper estimate involving the still unfixed $p$.
+ Choose $kappa > 0$ small enough that, in the remaining range $D < L^kappa$,
  $L$ dominates every specified power of $X$ at large scales for fixed $B$.
  Also impose $kappa sigma lt.double v_0 zeta$. Choose $p - 2 > 0$ only afterwards,
  sufficiently small relative to $kappa$ and to the eventual level exponent.
  Then choose the small power losses and the finite derivative orders needed to make absolute errors negligible.
  Finally choose $B$, the base scale, and $C_(upright("ind"))$, in that order.

The sparse estimate may require more derivatives of the original profiles after the geometric powers have been
  chosen. This later regularity reserve does not change the fixed frame inputs in step (ii),
  and hence does not change $C_f$. Its multiplicative constants are absorbed by the final base scale and induction
  constant.

By coefficient Cauchy–Schwarz and phase-space counting, $lr(bar.v.double U bar.v.double)_oo lt.tilde 1$.
  Hence a nonempty level set has

#[#set math.equation(numbering: n => "(7.4)")
 $ g lt.tilde L^e chi^(- a) . $ <w:eq-gtrivial>]

For $D gt.eq L^kappa$, Chebyshev and 48 give

#[#set math.equation(numbering: n => "(7.5)")
 $ mu { \| U \| gt.eq chi^a g L^(- e) } lt.eq C_kappa m L^(2 n) D^(- c_s) chi^zeta g^(- 2) . $ <w:eq-largeD>]

The ratio of this bound to the desired right side, apart from its constant, is at most

$ D^(- \( c_s - sigma \)) chi^zeta g^(p - 2) lt.tilde L^(e \( p - 2 \) - kappa \( c_s - sigma \))
  chi^(zeta - a \( p - 2 \)) . $

It is bounded if $p - 2$ is small enough. In the range $D < L^kappa$ and $chi lt.eq L^(- v_0)$,
  32 gives the same comparison with

$ L^(epsilon.alt + kappa sigma + e \( p - 2 \)) chi^(zeta - a \( p - 2 \)) . $

Choose $epsilon.alt$ small after $kappa \, p - 2$; the positive density power makes this bounded as well.
  These estimates also handle bounded scales uniformly as $chi arrow.b 0$ by enlarging the final constant.
  If $g < D^(- 1)$, the total mass bound $mu \( bb(R)^(n + 1) \) lt.tilde m L^(2 n)$ is enough,
  since $g^(- p) D^(- sigma) gt.eq D^(p - sigma) gt.eq 1$.

It remains to consider

#[#set math.equation(numbering: n => "(7.6)")
 $ chi > L^(- v_0) \, wide D^(- 1) lt.eq g lt.tilde L^(e + a v_0) \, wide D < L^kappa . $ <w:eq-active>]

In this range the threshold $lambda = chi^a g L^(- e)$ is bounded below by a fixed negative power of $L$.
  Every absolute approximation error below can consequently be assigned a sufficiently large fixed negative power
  of $L$.

=== 7.2 An angular induction with curved narrow sets <an-angular-induction-with-curved-narrow-sets>

Besides a neighborhood of an affine codimension-two plane,
  we must exclude a small quadratic sublevel set inside a hyperplane.
  The latter condition will detect the second fundamental form of a polynomial wall.
  All frequency bins in the following lemma are bins of the original unrotated grid.
  Selecting a bin means selecting its entire field.

#thm([Lemma 7.2.])[
  (Angular induction).  #emph[Assume the outer induction hypothesis in 51 and the active range (7.6).
    Fix a subarray of energy $E_0 lt.eq 1$. In every cube of a fixed spacetime grid of side $R^4$,
    prescribe some of its frequency bins of side $1 \/ R$. Suppose their centers are covered by
    $O \( \( 1 + log X \)^(C_0) \)$ sets, each of one of the following types:]
  + #emph[a strip of width $O \( R^(- 1) \)$ about an affine $\( n - 2 \)$-plane;]
  + #emph[the $O \( R^(- 1) \)$-neighborhood of
$ { v in H ∩ B : \| Q_H \( v \) \| lt.eq R^(- 4) } \, $

 where $H$ is an affine hyperplane, $B$ is a fixed bounded region,
   and $Q_H$ has coefficient norm one in orthonormal coordinates on $H$ with bounded origin.]
  #emph[The cover and the prescribed bins may depend on the macro cube.
    Let $U_(upright("sel"))$ denote the resulting prescribed-bin sum on that cube. For any fixed $c > 0$,
#[#set math.equation(numbering: n => "(7.7)")
 $ mu { \| U_(upright("sel")) \| gt.eq c lambda } lt.eq C C_(upright("ind")) R^(- c_2) m L^(2 n) g^(- p)
   E_0^(p \/ 2) + C_N m L^(- N) . $ <w:eq-angular>]

 Here $N$ can be any prescribed fixed exponent, given sufficiently many initial profile derivatives.
   The exponent $c_2 > 0$ depends on the dimensional choices in (7.2), not on $u$ or $C_0$.]
] <w:angular>

#proof[
  We give the geometric iteration, the measure transport, and the exponent calculation separately.
  ===== 7.2.1 The narrow geometry. <the-narrow-geometry.>
  Assign every selected bin to one covering set. In a set of type (b),
    choose one approximating point for each assigned bin and sort the sizes of $\| nabla
    Q_H \|$ there into dyadic classes $m_1$, down to $1 \/ R$; put all smaller gradients in the last class.
    There are $O \( log R \)$ classes. Each assignment concerns the whole bin, not a subset of its packet labels.
  Consider one class through the $J$ iterations of ratio $K$.
    If $m_1$ is a sufficiently small constant, the normalization of $Q_H$, its bounded coefficients,
    and its small value at an approximating point force its quadratic part to have norm bounded below.
    Some component of $nabla Q_H$ then has a linear part bounded below.
    The condition $\| nabla Q_H \| lt.tilde m_1$ puts this class in a strip of width $O \( m_1 + R^(- 1) \)$
    within the $O \( R^(- 1) \)$-neighborhood of $H$. For parent inverse widths
  $ s lt.eq frac(c, K m_1) \, $
  this is a codimension-two strip at the next child precision.
  For a dyadic class with a positive lower gradient bound, the other regime is
  $ frac(C K, m_1) lt.eq s lt.eq R / K . $
  Choose an approximating point in the parent. Taylor expansion around it places all assigned descendants within
  #[#set math.equation(numbering: n => "(7.8)")
   $ C #scale(x: 120%, y: 120%)[\(] m_1^(- 1) \( s^(- 2) + R^(- 4) \) +
     R^(- 1) #scale(x: 120%, y: 120%)[\)] lt.tilde \( K s \)^(- 1) $ <w:eq-quadraticwidth>]
  of the tangent affine $\( n - 2 \)$-plane to its level set in $H$.
    The last, small-gradient class never needs this second regime.
    If the gradient is bounded below by a fixed constant, only a bounded number of initial steps are outside the
    second regime. In general the gap between the two regimes is a factor $O \( K^2 \)$,
    so at most a bounded number of ratio-$K$ steps need a crude estimate.
  Use the functional $cal(T)_b$ of 34, with $P = 2 \/ \( 1 - b \)$.
    Since $b < 2 \/ n$, we have $P lt.eq q_(n - 2)$. At every good step 33 applies after rescaling the width in
    (7.8) to $O \( K^(- 1) \)$. The exceptional steps use Cauchy–Schwarz.
    Consequently the whole angular iteration, excluding the transport factors, costs
  #[#set math.equation(numbering: n => "(7.9)")
   $ C_epsilon.alt K^C R^epsilon.alt \, $ <w:eq-Kcost>]
  where the exponent $C$ is independent of $J$. Constants depending on the fixed $J$ are allowed.
    This distinction is essential: good-step losses multiply to $R^epsilon.alt$, rather than $K^(C J)$.
  For this nonrecursive calculation one may smoothly truncate compact profiles in native spacetime Fourier
    variables at radius $L^(1 \/ 4)$. With sufficiently many fixed derivatives,
    every relevant subfield and rescaling has error smaller than any prescribed negative power of $L$.
    There are only polynomially many labels of packets meeting the domain.
    The choice of $kappa$ makes the fixed hierarchy $R = K^J$ small enough relative to $L$ that the truncated
    supports satisfy the thickness and overlap hypotheses of the packet estimates at each step.
    Supremum estimates for these approximations use ordinary convolution.
    At the terminal step we return to the original compact child fields,
    so none of this truncation changes the induction’s profile class.
    The absolute error estimate is justified below, including when the tested mass is small.
  ===== 7.2.2 Initial measure functional and recombination. <initial-measure-functional-and-recombination.>
  Let $nu$ be the original measure restricted to the set on the left of (7.7), and write $M_0 =
    nu \( bb(R)^(n + 1) \)$. For each cover/class index, pad the enumeration where needed and restrict $nu$
    separately to the macro cubes. On a unit cube $q$, the density bound gives $mu \( q \)^(1 - b)
    lt.tilde \( m chi \)^(1 - b)$. Hölder on the constituent unit cubes,
    followed by the weighted supremum estimate for the bandlimited approximation,
    bounds $lambda^2 M_0$ by the sum of the initial $cal(T)_b$ functionals, multiplied by
  $ C \( m chi \)^(1 - b) \( 1 + log X \)^C . $
  The sum of unit-cube convolution weights inside a $K^2$-cube is bounded by the enlarged Schwartz weight used for
    that cube. Thus the weighted versions of the transport inequality apply without a factor counting unit cubes.
    During each calculation the angular subset prescribed on the original macro is kept fixed,
    including in every shifted norm.
  After $J$ steps, the transport factors and (7.9) give
  #[#set math.equation(numbering: n => "(7.10)")
   $ C_epsilon.alt K^C R^(epsilon.alt + 2 - \( n + 2 \) b) . $ <w:eq-angular-factor>]
  We explain why the macro restrictions can now be recombined. Write
  $ A_(K \, v) \( x \, t \) = \( \( x - 2 v t \) \/ K \, t \/ K^2 \) . $
  For a fixed angular chain, class index, and complete grid-shift sequence,
    every step is a translated pushforward under $A_(K \, v_j)$.
    The grids on the right of the transport inequalities are global and unrotated;
    rotations used to prove a strip inequality do not change these lists. Hence the composition is
  #[#set math.equation(numbering: n => "(7.11)")
   $ tau_(z_(upright("sh"))) compose A_(R \, V) \, wide V = v_1 + v_2 \/ K + dots.h.c + v_J \/ K^(J - 1) \,
     wide \| V \| lt.eq C_n \, $ <w:eq-affine-composition>]
  with a translation $z_(upright("sh"))$ independent of the original macro cube.
    The inverse image of a terminal $K^2$-cube has diameter at most $C_n R^2 K^2 lt.eq C_n R^4$,
    regardless of the size of $z_(upright("sh"))$. It therefore meets only boundedly many original macros.
    For their transported measures this gives, on every terminal cube $Q$,
  $ sum_(cal(M)) nu_(cal(M)) \( Q \)^b lt.eq C_n (sum_(cal(M)) nu_(cal(M)) \( Q \))^b . $
  The combined measure is dominated by one translated pushforward of $nu$, has mass at most $M_0$,
    and has ball parameter
  #[#set math.equation(numbering: n => "(7.12)")
   $ m' asymp C m R^(n + 1) . $ <w:eq-childm>]
  Infinite shift sequences are summed with their summable weights; neither the mass, the ball constant,
    nor the number of occupied cubes depends on their absolute translation.
    Since assignments were by whole original $1 \/ R$-bins, the terminal field is the same full compact bin field,
    or zero, on every contributing macro. Thus the outer induction will charge each original bin energy once.
  ===== 7.2.3 The terminal induction. <the-terminal-induction.>
  Put $l = L \/ R$. In each terminal $K^2$-cube with nonzero original child supremum,
    move its mass to a point arbitrarily close to that supremum and bound its $P$-norm by the supremum.
    This changes ball bounds by at most $K^C$. Sort the cube masses as $nu_(upright("child")) \( Q \) asymp m' d$.
    Unit covering of the inverse image, whose volume scales as $R^(n + 2)$ while (7.12) scales as $R^(n + 1)$, gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ d lt.eq C K^C R chi . $ <w:eq-dcap>]
  The moved measure has ball parameter $C K^C m'$, relative unit density at most $min \( 1 \, C d \)$, and,
    after fixed constant inflation, admissible moment parameter $D = 1$.
    Its relevant time range is that of the original compact child field.
    Spatial boxes can be partitioned as in the theorem.
  Apply the outer induction at $l$ and integrate the weak $L^p$ bound against the trivial mass bound $M_0$.
    Since $p > 2$, the resulting $L^2$ integral is bounded by
  #[#set math.equation(numbering: n => "(7.14)")
   $ C K^C C_(upright("ind"))^(2 \/ p) \( m' \)^(2 \/ p) l^(4 n \/ p - 2 e) d^(2 a) M_0^(1 - 2 \/ p)
     E_(upright("bin")) \, $ <w:eq-terminalL2>]
  where $E_(upright("bin"))$ is that bin’s original coefficient energy.
    Indeed, integrating a distribution estimate $nu { \| V \| > t } lt.eq
    min \( M_0 \, A t^(- p) \)$ gives $integral \| V \|^2 thin thin upright(d) nu lt.eq
    C_p A^(2 \/ p) M_0^(1 - 2 \/ p)$. Multiplication by $\( m' d \)^(b - 1)$ returns to the mass-power functional;
    the fixed $K$-volume factor costs another $K^C$. The dyadic $d$ sum converges at its lower end because
  $ b - 1 + 2 a = delta > 0 . $
  By (7.13), its total cost is $C \( K^C R chi \)^delta$.
  To justify returning from the Fourier approximations even on cubes with zero original supremum, normalize $m =
    1$. There are polynomially many occupied cubes, and concavity gives
  $ sum_Q nu \( Q \)^b lt.eq \( \# Q \)^(1 - b) M_0^b . $
  Choosing the fixed truncation order large enough makes the entire error, with all prefactors restored,
    at most $L^(- N') M_0^b$ for any prescribed $N'$. Either this absorbs into $lambda^2 M_0$, or,
    using $lambda gt.eq L^(- C)$ from (7.6),
  $ lambda^2 M_0 lt.tilde L^(- N') M_0^b quad arrow.r.double quad M_0 lt.tilde L^(- \( N' - 2 C \) \/ \( 1 - b \)) . $
  The latter is the asserted absolute negligible mass after choosing $N'$ large.
    Restoring homogeneity supplies the factor $m$.
  ===== 7.2.4 The gain. <the-gain.>
  Sum the disjoint bin energies. The factors of $m$ and $chi$ before solving for $M_0$ are exactly $m^(2 \/ p)
    chi^(2 a)$. Apart from $K^C R^epsilon.alt$ and fixed logarithmic powers, the exponent of $R$ is
  #[#set math.equation(numbering: n => "(7.15)")
   $ Gamma \( p \, delta \) = 2 - \( n + 2 \) b + \( n + 1 \) \( b - 1 + 2 \/ p \) - 4 n \/ p + 2 e +
     delta . $ <w:eq-Gamma>]
  At $p = 2$, $delta = 0$, direct simplification gives $Gamma = beta - b < 0$.
    Solving for $M_0$ multiplies this exponent by $p \/ 2 > 0$.
    First choose $delta$ and $p_max - 2$ small, then $J$ large so that $K^C =
    R^(C \/ J)$ is paid by the strict margin, and finally choose the decoupling loss small.
    The remaining logarithmic factors are absorbed by increasing $B$ for the fixed $C_0$.
    This proves (7.7) with a fixed $c_2 > 0$. ◻
]

=== 7.3 Heavy bins and a polynomial wall <w:heavy>

Suppose, towards a contradiction to 51, that

#[#set math.equation(numbering: n => "(7.16)")
 $ Y = { \| U \| gt.eq lambda } \, wide M_Y = mu \( Y \) > C_(upright("ind")) m L^(2 n) D^(- sigma) g^(- p) .
   $ <w:eq-counterlevel>]

All constants used in the geometric construction below are independent of $C_(upright("ind"))$.
  Translations of the spatial box are immaterial. For a macro cube with center $z = \( x \, t \)$,
  call a $1 \/ R$-bin heavy if

#[#set math.equation(numbering: n => "(7.17)")
 $ sum_(alpha med upright(i n med t h e med b i n)) \| c_alpha \|^2
   (1 + frac(\| x - y_alpha - 2 omega_alpha t \|, L))^(- M) gt.eq W \, wide W =
   X^(- P_0) frac(m L^(n + 1), M_Y) . $ <w:eq-heavy>]

The power $P_0$ will be chosen after an inner sparsity exponent $P_1$.

#thm([Lemma 7.3.])[
  (Reduction to broad heavy incidences).  #emph[There is a subset $Y' subset Y$ with $mu \( Y' \) gt.eq
    c M_Y$ such that, at each point of $Y'$:]
  + #emph[the heavy-bin field has modulus at least $lambda \/ 2$;]
  + #emph[the heavy-bin centers are not contained in a strip of any fixed large constant times $R^(- 1)$ about an
    affine $\( n - 2 \)$-plane, nor in a single quadratic neighborhood of the form in 52;]
  + #emph[every heavy bin supplies at least $W \/ 2$ of its weighted coefficient square mass from trajectories
    within distance $X^(C_w) L$.]
  #emph[In particular some $n$ heavy bins have direction vectors $\( 2 omega \, 1 \)$ whose $n$-volume is at least
    $R^(- C)$ throughout the bins.]
] <w:heavy-reduction>

#proof[
  For each bin restrict $mu \|_Y$ to the macros where that bin is light.
    Since $R^4 lt.double L$, the weight in (7.17) is comparable at the macro center and at each point of the
    macro. Therefore the sum of its coefficient energies times their packet moments on this restricted measure is
    at most $C W M_Y$.
  Put $D_1 = X^(P_1)$. Split off the labels whose moment exceeds $m L^(n + 1) \/ D_1$.
    In each bin their total energy is at most $C D_1 X^(- P_0)$;
    summing over the $O \( R^n \)$ bins only contributes a fixed power of $R$.
    The other labels satisfy the inner induction hypothesis at $D_1$, on the restricted measure,
    with the unchanged original profiles. Apply it at threshold $c R^(- n) lambda$.
    Disjoint bin energies and $p \/ 2 > 1$ give total exceptional mass at most
  #[#set math.equation(numbering: n => "(7.18)")
   $ C C_(upright("ind")) m L^(2 n) g^(- p) R^(n p) D_1^(- sigma) . $ <w:eq-light-inner>]
  Choose $P_1$ so that $2 D lt.eq D_1$ and $u n p_max - sigma P_1 + sigma < 0$ with a fixed spare margin.
    The later choice of $kappa$ ensures $D_1 lt.eq L$. If $D_1$ has already reached $L^kappa$,
    the large-$D$ case is available; otherwise this is a strict inner induction step.
  For each split-off bin, use unrotated cap scaling and the outer induction at $L \/ R$.
    The ball parameter is $C m R^(n + 1)$, the relative unit density is at most $min \( 1 \, C chi R \)$,
    and the scaled level parameter is at least $g R^(- C)$. Consequently all split-off fields together contribute
    at most
  #[#set math.equation(numbering: n => "(7.19)")
   $ C C_(upright("ind")) m L^(2 n) g^(- p) R^C \( D_1 X^(- P_0) \)^(p \/ 2) . $ <w:eq-light-outer>]
  The fixed power $R^C$ includes the bin count and threshold splitting; its exponent can use $p_max$.
    Choose $P_0$ sufficiently larger than $P_1$ so that this expression, and (7.18),
    are small fractions of the lower bound in (7.16) once $B$ is large.
    The thresholds of the $O \( R^n \)$ light-bin fields sum to at most $lambda \/ 2$ when $c$ is small.
    This proves (i).
  On every adverse macro for (ii), the heavy-bin sum is exactly a prescribed-bin field of the type in 52.
    Its mass is at most the target bound times $C R^(- c_2) D^sigma$, plus an absolute negligible error.
    Since $sigma < u c_2$, increasing $B$ makes this a small fraction.
    The construction may choose the adverse hyperplane and quadratic separately on each macro, as allowed by that lemma.
  For (iii), the measure ball bound and the fixed time range give, by covering tube annuli,
  $ integral_(\| x - y_alpha - 2 omega_alpha t \| > X^(C_w) L)
    (1 + frac(\| x - y_alpha - 2 omega_alpha t \|, L))^(- M) thin thin upright(d) mu lt.eq C m L^(n + 1) X^(- A_w) \, $
  where $A_w$ can exceed $P_0$ by choosing $C_w$ large (the fixed exponent $M$ was chosen sufficiently large
    first). Sum with $\| c_alpha \|^2$ and compare with $W M_Y = X^(- P_0) m L^(n + 1)$.
    Markov’s inequality removes only a small fraction of $Y$ and ensures the stated contribution in every heavy
    bin. Finally, successive maximal affine heights among the remaining centers give $n$ robustly independent
    directions; failure would place all centers in a forbidden codimension-two strip.
    Choosing the strip constant large makes the volume bound stable throughout the bins. ◻
]

Pass to tube coordinates $\( x \, t \) \/ L$ and replace the measure by $nu =
  mu \/ \( m L^n \)$ in those coordinates. The relevant domain has diameter $O \( L \)$ and

$ nu \( B \( z \, r \) \) lt.eq C r^n quad \( r gt.eq 1 \) . $

Write $N_Y = nu \( Y \)$. Formula (7.17) becomes

#[#set math.equation(numbering: n => "(7.20)")
 $ W = X^(- P_0) L \/ N_Y . $ <w:eq-Wnormalized>]

The incidence tubes have width $X^(C_w)$ in these coordinates.

#thm([Lemma 7.4.])[
  (Incidence mass and a wall).  #emph[The preceding level set satisfies
#[#set math.equation(numbering: n => "(7.21)")
 $ N_Y W^(n \/ \( n - 1 \)) lt.eq X^C \, wide N_Y gt.eq X^(- C) L^n . $ <w:eq-incidence-mass>]

 Moreover, a subset of $Y'$ of mass comparable to $N_Y$ lies within distance $X^C$ of the zero set of a polynomial
   of degree at most $X^(C_(upright("part")))$ in tube coordinates.]
] <w:wall>

#proof[
  For a robust $n$-tuple, project its directions onto an $n$-dimensional space where their determinant is at least
    $R^(- C)$. Such a space exists by their $n$-volume lower bound.
    A further polynomially fine angular subdivision makes the projection common to the tuple’s families.
    Apply endpoint $n$-linear Kakeya to the projected tubes.
  To relate its cube sum to $nu$, divide into columns of side comparable to the tube width.
    Each tube meets only polynomially many width boxes over a projected column, uniformly in its label;
    its projected direction is bounded away from zero by the determinant condition.
    Each box has $nu$-mass at most $X^C$. If $a_(i \, j) gt.eq
    0$ denotes the incident weight of family $i$ in the $j$th vertical box,
    Hölder with $n$ factors followed by the monotonicity of finite sequence norms gives
  $ sum_j product_(i = 1)^n a_(i \, j)^(1 \/ \( n - 1 \)) lt.eq
    product_(i = 1)^n (sum_j a_(i \, j))^(1 \/ \( n - 1 \)) . $
  The total coefficient weight in each family is at most one.
    The projected Kakeya bound, its polynomial transversality cost and the polynomial number of tuples therefore
    bound the mass seeing weight $W$ from every family by $X^C W^(- n \/ \( n - 1 \))$.
    This proves the first inequality in (7.21). Substitute (7.20) to obtain the second.
    We also have $N_Y lt.tilde L^n$ from the ball bound.
  The separation into cells and a polynomial wall follows the Fourier-restriction partitioning framework of Guth
    #cite(label("Guth2016Restriction")) Sections 3.2–3.4. For completeness,
    use polynomial partitioning with parameter $P_2 = X^(C')$ on $nu \|_Y$.
    It gives a polynomial of degree $O \( P_2 \)$, $O \( P_2^(n + 1) \)$ sign regions,
    and mass at most $C N_Y \/ P_2^(n + 1)$ in each open region.
    The finite-set partitioning theorem follows from iterative polynomial bisection #cite(label("GuthKatz2015"))
    Theorem 4.1; its integrable-density form is #cite(label("Guth2016Restriction"), form: "prose") Theorem 1.4.
    For the present finite Borel measure, smooth it first and use that bisection argument.
    Normalize the coefficient vector of each of the finitely many factors separately and take a convergent
    subsequence. A compact subset off the limiting zero set has stable signs;
    its limiting mass obeys the same bound. Exhausting an open sign region by such compact subsets proves the
    assertion for the original measure. Mass on the zero set is already part of the wall.
    Connectedness of sign regions is not required.
  A central line not contained in the wall meets only $O \( P_2 \)$ open sign regions.
    Let $E_(cal(O))$ be the total coefficient energy of labels whose line visits $cal(O)$.
    Then $sum_(cal(O)) E_(cal(O)) lt.tilde P_2$. Regions with $E_(cal(O)) > C_(*)
    P_2^(- n)$ have total mass at most $C N_Y \/ C_(*)$ by the region mass bound. Choose $C_(*)$ large.
    Away from a width-enlarged wall, a point and its nearby incident line point are in the same region.
    In every remaining region the preceding projected Kakeya argument with local energies bounds the off-wall mass
    of $Y'$ by
  $ X^C W^(- n \/ \( n - 1 \)) P_2^(- n^2 \/ \( n - 1 \)) lt.eq X^(C'') N_Y P_2^(- n^2 \/ \( n - 1 \)) . $
  The last inequality uses (7.20) and $N_Y lt.tilde L^n$. Since
  $ frac(n^2, n - 1) - \( n + 1 \) = frac(1, n - 1) > 0 \, $
  choosing $C'$ large pays the number of regions. A fixed positive fraction of the mass must therefore be near the
    polynomial wall. ◻
]

=== 7.4 Why the wall is flat <w:curvature>

Testing the second fundamental form on incident line directions is related to the flat-point argument of Guth–Katz
  #cite(label("GuthKatz2010Algebraic")) Lemma 3.3 and Corollary 3.4.
  Here the incidences are approximate and the ambient dimension is higher;
  the quadratic narrow estimate supplies the additional directional exclusion needed to bound the full Hessian.
  We prove the quantitative reduction to affine plates below.

We now work in macroscopic coordinates, obtained by dividing tube coordinates by $L$.
  The domain is a fixed bounded box, and the wall and incidence errors are at most

#[#set math.equation(numbering: n => "(7.22)")
 $ Delta lt.eq X^(C_4) \/ L . $ <w:eq-Delta>]

The exponent $C_4$ is already fixed. All further enlargements in this subsection are fixed powers of $X$ and will
  be small on the macroscopic scale by the later choice of $kappa$.

We use the following two elementary consequences of fixed-dimensional semialgebraic complexity.
  Here a description of complexity $X^C$ means that the number and degrees of its defining polynomials are bounded
  by such a power; their coefficients are unrestricted.

+ A bounded set of dimension at most $n - 1$ and complexity $X^C$ is covered by $X^(C')
  rho^(- \( n - 1 \))$ boxes of diameter $O \( rho \)$. To see this, use a generic shifted mesh.
  A box meeting a component that does not meet any face contains that component,
  so the component bound pays such boxes. Intersections with grid faces generically lower dimension,
  have the same type of complexity bound, and are counted by induction on dimension,
  with the zero-dimensional component bound as base case.
+ A bounded set of complexity $X^C$ has a partition into $X^(C')$ cells within which any two points can be joined
  by a path of length $X^(C')$. Use a compatible cylindrical decomposition, including the enclosing box.
  Recursively lift paths in the base to a graph or to the continuous middle section of a sector,
  adding vertical segments inside a sector. The paths have polynomial description complexity in fixed dimension.
  Each bounded coordinate has polynomially many monotonicity pieces,
  so the length is bounded by their total variation. The paths may be taken continuous and piecewise smooth.

The required cylindrical decomposition, projection and bounded-variable quantifier-elimination bounds are
  standard; see #cite(label("Basu2014"), form: "prose"). These bounds are polynomial in description size when
  dimension is fixed and do not depend on coefficient magnitudes.
  They control the number of pieces and path lengths, not graph derivatives. The latter are obtained next.

#thm([Lemma 7.5.])[
  (Regular graph pieces and derivative bounds).  #emph[Let $Z$ be the square-free polynomial wall.
    It has a semialgebraic exceptional subset of dimension at most $n - 1$ and complexity $X^C$ such that,
    outside its $C rho$-neighborhood, every relevant point of $Z$ has a local graph coordinate with bounded slope
    and second and third graph derivatives bounded by a fixed power of $rho^(- 1)$.
    The estimates are independent of the polynomial coefficients.
    The mass of the discarded neighborhood in tube coordinates is at most $X^C rho L^n$.]
] <w:regular-wall>

#proof[
  Square-freeness implies that the singular set has dimension at most $n - 1$.
    Decompose the bounded regular part into polynomially many pieces with a specified omitted coordinate $j$,
    on which the implicit graph $x_j = phi.alt \( macron(x) \)$ has slope bounded by a dimensional constant.
    Choose a finite set of base directions sufficient to polarize tensors through order three.
    Refine the pieces by the signs, including zero, of the corresponding fourth directional derivatives of
    $phi.alt$. Implicit differentiation makes these tests semialgebraic with polynomial complexity.
    Put all singular points, lower-dimensional pieces and frontiers into the exceptional set;
    use a strictly larger box so that its artificial boundary is harmless.
    The frontier dimension property gives the stated dimension bound.
  At distance $C rho$ from this set, a straight base segment of length $c rho$ lifts in the same graph/sign piece.
    Indeed its lift has bounded speed. If maximal continuation stopped earlier,
    its Cauchy endpoint would be a frontier or a singular point within distance $rho$,
    unless the implicit graph could be continued. Both alternatives contradict the stopping assumption.
    Global injectivity of the base projection is unnecessary.
  On such a two-sided segment let $g \( t \) = phi.alt \( u + t e \)$, so $\| g' \| lt.eq C$.
    The fixed sign of $g''''$ makes $g'''$ monotone. If $\| g''' \( 0 \) \| = A$,
    on one half-interval of length comparable to $rho$ its magnitude is at least $A$, with constant sign.
    The midpoint second difference of $g'$ on that half-interval has magnitude at least $c A rho^2$ and at most $4
    C$. Thus $A lt.tilde rho^(- 2)$. Apply the same argument on shorter interior intervals,
    then a difference quotient for $g'$, to get $\| g'' \| lt.tilde rho^(- 1)$.
    Polarization bounds the full second and third tensors.
  By property (a), the exceptional set is covered by $X^C rho^(- \( n - 1 \))$ boxes.
    Each becomes a ball of radius $O \( rho L \)$ in tube coordinates and has $nu$-mass at most $C \( rho L \)^n$.
    Their total mass is $X^C rho L^n$. Choose $rho = X^(- C_5)$ with $C_5$ large and require $Delta lt.double
    rho$. By (7.21), this discards an arbitrarily small fraction of $N_Y$. ◻
]

Every remaining point of the level set near the wall can now be attached to a regular $p in
  Z$ at distance $O \( Delta \)$, with the preceding slope and derivative bounds.
  No regularity of this attachment is needed; all bad events below can be described by existence of an eligible
  nearby $p$.

#thm([Lemma 7.6.])[
  (Line tests).  #emph[For any prescribed large $A$, choose a fixed $C_6$ sufficiently large.
    For every label, outside polynomially many macroscopic time intervals of total length at most $X^(- A)$,
    an incidence with any eligible $p$ satisfies
#[#set math.equation(numbering: n => "(7.23)")
 $ \| v_j - nabla phi.alt \( p \) dot.op macron(v) \| lt.eq X^(C_6) \/ L \,
   wide \| nabla^2 phi.alt \( p \) \[ macron(v) \, macron(v) \] \| lt.eq X^(C_6) \/ L \, wide
   v = \( 2 omega \, 1 \) . $ <w:eq-line-tests>]

 The exponent bounding the number of intervals is independent of the sizes of $A \, C_6$.]
] <w:line-tests>

#proof[
  Lift the projection of the nearby line position onto the local graph.
    The lift is $O \( Delta \)$ from $p$, and its first and second derivatives differ from those at $p$ by
    $O \( Delta X^C \)$ by 55. For the macroscopic line $ell \( s \)$ define
  $ H \( s \) = ell_j \( s \) - phi.alt \( macron(ell) \( s \) \) . $
  At a relevant incidence, $\| H \| lt.tilde Delta$. Failure of (7.23) forces $\| H' \|$ or $\|
    H'' \|$ to be at least $c X^(C_6) \/ L$, after increasing $C_6$ beyond the fixed derivative error powers.
  Order the regular roots over the projected line parameter by cylindrical decomposition and refine by these
    inequalities and signs. This gives polynomially many smooth branch intervals.
    They are graph sections, not sectors, and their implicit derivatives are the actual derivatives of $H$.
    On an interval where $\| H \| lt.tilde Delta$ and a first derivative of fixed sign has magnitude at least $q$,
    the length is $O \( Delta \/ q \)$. For a second derivative of fixed sign and magnitude at least $q$,
    a midpoint second-difference estimate bounds the length by $O \( \( Delta \/ q \)^(1 \/ 2) \)$.
    Set $q = c X^(C_6) \/ L$ and use (7.22). Increasing $C_6$ makes the sum of lengths at most $X^(- A)$.
    Thresholds change coefficients, not degrees or the number of quantified variables,
    so the interval-count exponent does not increase with $A \, C_6$.
    Quantifying the existence of any eligible nearby point preserves this complexity bound and proves the last
    assertion as well. ◻
]

The bad parameters of one label contribute at most

#[#set math.equation(numbering: n => "(7.24)")
 $ X^C \( L X^(- A) + X^C \) $ <w:eq-badline-mass>]

to its enlarged tube’s $nu$-mass: cover the bad intervals in tube coordinates by width boxes and use the ball
  bound. The prefactor and count exponents are fixed independently of $A \, C_6$;
  the initial $Delta$ can be enlarged to include the incidence width.
  Choose $A$ large, then $C_6$, and finally let $L$ dominate the fixed powers.
  Sum (7.24) with $\| c_alpha \|^2$ and compare with $W N_Y = L X^(- P_0)$.
  Markov removes only a small fraction of $Y'$, and ensures that each heavy bin supplies at least one label
  passing both tests. In fact it supplies positive weighted mass of such labels.
  All assertions are simultaneous at each retained wall point.

#thm([Proposition 7.7.])[
  (Affine plate covering).  #emph[A subset $Y_0 subset Y'$ with $mu \( Y_0 \) gt.tilde
    M_Y$ is contained in a union of at most $X^C$ affine hyperplane plates,
    each of thickness $X^C$ in tube coordinates.]
] <w:geometry>

#proof[
  At a retained regular point $p$, let $upright(bold(n)) = \( upright(bold(n))_x \, upright(bold(n))_t \)$ be a
    unit normal. The first line test gives
  $ \| upright(bold(n))_x dot.op 2 omega + upright(bold(n))_t \| lt.tilde X^(C_6) \/ L $
  for a supplied bounded frequency, so $\| upright(bold(n))_x \| gt.tilde 1$.
    The exact tangent-frequency hyperplane is consequently well conditioned.
  Suppose the graph Hessian has norm greater than $X^(C_7) \/ L$.
    Normalize its quadratic form and restrict it via $omega mapsto
    overline(\( 2 omega \, 1 \))$ to that exact hyperplane. The resulting polynomial on the hyperplane has
    coefficient norm comparable to one. To verify this, choose coordinates on the tangent space in which its
    time-one slice has bounded offset. Its direction space and one bounded point span the tangent space with
    bounded condition number because $\| upright(bold(n))_x \| gt.tilde 1$. A homogeneous quadratic has the form
  $ Q \( y \, t \) = y^T C y + 2 t b dot.op y + a t^2 \; $
  its restriction to $t = 1$ records all of $C \, b \, a$. The bounded graph slope makes base projection another
    bounded isomorphism. This proves the coefficient comparison.
    Divide the restricted polynomial by its coefficient norm, so that it has norm exactly one as required in 52;
    this changes the following bounds only by fixed factors.
  Move each supplied frequency to the exact tangent hyperplane.
    Its distance is $O \( X^(C_6) \/ L \)$, and by the second line test its normalized quadratic value there is at most
  $ C X^(C_6 - C_7) + C X^(C_6) \/ L . $
  Choose $C_7$ large relative to $C_6 \, u$ and then make $L$ dominant. This quantity is less than $R^(- 4)$.
    Every heavy-bin center is within $O \( R^(- 1) \)$ of these frequencies,
    so all heavy bins are trapped in a forbidden quadratic neighborhood from 53. The contradiction proves
  #[#set math.equation(numbering: n => "(7.25)")
   $ lr(bar.v.double nabla^2 phi.alt \( p \) bar.v.double) lt.eq X^(C_7) \/ L . $ <w:eq-smallhess>]
  This is where the quadratic narrow estimate is essential:
    tangent directions on a nonflat ruled quadric may span an affine hyperplane,
    but their quadratic values still detect its curvature.
  For each fixed graph coordinate $j$, partition the exact semialgebraic subset defined by regularity,
    the bounded slope condition and (7.25) into cells with property (b) above.
    Use paths inside these cells, not paths inside the larger regular wall.
    Even if the base projection has several sheets, the implicit gradient
  $ g_j \( p \) = - partial_(upright("base")) P \( p \) \/ partial_j P \( p \) $
  is a single-valued function of the wall point. Along a piecewise smooth path $p$ in this subset,
    with base coordinate $u$,
  $ thin upright(d) g_j = nabla^2 phi.alt_j thin thin upright(d) u \, wide thin upright(d) p_j =
    g_j dot.op thin upright(d) u . $
  For path length $D_0 lt.eq X^C$, these identities bound the gradient change by $X^(C_7) D_0 \/
    L$ and the height error from the starting tangent plane by $X^(C_7) D_0^2 \/ L$.
    A projected loop reaching a different sheet obeys the same identities.
    Thus every cell lies within $X^C \/ L$ of one affine plane in macroscopic coordinates.
    Add the $O \( Delta \)$ attachment error and return to tube coordinates.
    The number of cells and the plate widths are both fixed powers of $X$, as claimed. ◻
]

=== 7.5 Assigning packets to plates <w:assignment>

The plate covering is used only to organize the original compact packets. It does not change their profiles.
  Assign a label to a plate if its central line comes within distance $X^(C_8)$ of that plate somewhere in the
  enlarged tube-coordinate domain and its normal velocity deviation for the same plate is at most $X^(C_9) \/ L$.
  If there are several choices, choose one. Thus the assigned coefficient energies are disjoint.
  Increase each assigned plate’s width by a fixed power of $X$ so that it contains the compact packet support in
  the domain: the normal displacement over time $O \( L \)$ is at most $X^(C_9)$,
  in addition to the initial distance and the fixed packet width.

Every unassigned label has moment on $mu \|_(Y_0)$ at most $m L^(n + 1) \/ D_1$,
  after choosing the powers in order. Indeed choose $C_8$ larger than the plate-width power and truncate its
  moment at distance $X^(C_8) \/ 2$, paying the tail by the same annular estimate as in 53.
  If its line is ever this close to a plate but is unassigned, its normal velocity exceeds $X^(C_9) \/ L$.
  The time spent within that distance is at most

$ C L frac(X^(C_8) + X^(C_(upright("plate"))), X^(C_9)) $

for each plate, in tube coordinates. Cover those intervals by width boxes and sum over the polynomial number of
  plates. Choosing $C_9$ large makes the resulting moment smaller than the asserted bound.
  Inner induction at $D_1$ therefore removes the unassigned field on only a small fraction of $Y_0$.
  The assigned sum is at least a fixed multiple of $lambda$ on a set of mass comparable to $M_Y$.

Choose a dyadic inverse cap width $h$, nested with $R$, such that

#[#set math.equation(numbering: n => "(7.26)")
 $ b_1 = L \/ h asymp X^(C_10) . $ <w:eq-h>]

The exponent $C_10$ is larger than the preceding plate-count and width powers and the loss in (7.21).
  Intersections of two enlarged plates whose projective normals differ by at least $1 \/ h$ have small total mass.
  In tube coordinates such an intersection fits in a box with $n -
  1$ lengths $O \( L \)$ and two remaining widths at most $X^C h$.
  Covering by balls of the latter radius gives mass at most $X^C L^(n - 1) h$.
  The same bound, with a larger fixed power, pays all pairs of plates.
  By (7.21) and (7.26), this is negligible relative to $N_Y$.

Group the plates by a bounded-overlap grid of projective normals at resolution $1 \/ h$,
  choosing labels disjointly. At a retained point only boundedly many clusters contribute,
  so one cluster field has modulus $gt.tilde lambda$. Cluster energies partition a subenergy of the original
  array. Within each cluster all frequencies lie within $C \/ h$ of a single affine frequency hyperplane.
  To see this, the assignment condition gives an almost tangent direction of bounded velocity for each plate,
  so the spatial part of its normal is bounded below; changing the normal by $O \( 1 \/ h \)$ changes its
  tangent-frequency hyperplane by the same order. A bounded spatial rotation,
  shear and modulation now put this hyperplane in tangential frequency coordinates of dimension $k = n - 1$.
  These transformations are used only in the following nonrecursive estimates.

For each cluster, subdivide labels in the original frequency axes into $1 \/ R$-bins and then $1 \/ h$-bins.
  On a macro cube where the cluster is high, call a coarse bin significant if its field has a witness there of
  modulus at least $c R^(- n) lambda$. The nonsignificant fields sum to at most a small multiple of $lambda$ at a
  tested point.

Except for a small total mass, the tangential projections of the significant centers cannot be covered by
  $O \( C_11 log X \)$ strips of width $C_(*) \/ R$ about affine $\( k - 1 \)$-planes.
  Here $C_(*)$ is any sufficiently large fixed dimensional constant,
  and $C_11$ is the later fixed band cutoff exponent. Such a cover,
  together with the cluster’s $C \/ h$ normal width, would put the original bins in codimension-two strips in full
  frequency space. Apply 52 to the cluster subarray on each adverse macro.
  Summing disjoint energies and using $p \/ 2 > 1$ preserves the bound.
  Increasing $B$ absorbs the fixed logarithmic power. All ensuing coarse-bin witnesses are allowed to be anywhere
  within $O \( R^4 \)$ of their tested points.

=== 7.6 Flattened packets and their two energy budgets <flattened-packets-and-their-two-energy-budgets>

For a fine bin $theta$ centered at $v$, use the original-axis map $F_theta = A_(h \, v)$.
  After removing its carrier, the fine-bin field is

$ h^(- n \/ 2) U'_theta \( F_theta z \) \, $

where $U'_theta$ is a child array of size $b_1$. Partition its native spacetime into smooth compact unit cells
  $T$, with a fixed enlargement $T^(*)$ containing each cutoff support.
  The resulting packets have carrier $v$, width $h$ and duration $h^2$.
  Their sizes and associated densities can be taken as

#[#set math.equation(numbering: n => "(7.27)")
 $ s_(theta \, T) & = C h^(- n \/ 2) max_(\| alpha \| lt.eq N_(*)) sup_(T^(*)) \| partial^alpha U'_theta \| \,\
d_(theta \, T) & = \( m h^(n + 1) \)^(- 1) integral \( 1 + "dist" \( F_theta z \, T \) \)^(- P_(*)) thin thin
  upright(d) mu \( z \) . $ <w:eq-flatsize>]

Here $P_(*) \, N_(*)$ are the fixed orders committed to in step (ii) of 7.1.
  The envelope order $P = P_(*)$ was chosen strictly above both $M + n + 2$ and the lower envelope order in 14.
  Use it both for the full square-envelope weight $w_T$ and for the density kernel. Thus

$ integral w_T \( z \) thin thin upright(d) mu \( z \) = m h^(n + 1) d_(theta \, T) \, $

before replacing densities by their dyadic band values. The order $N_(*)$ includes the frame derivative order and
  the fixed reserves for the normal Fourier expansion and cell Sobolev estimates.
  Dividing each localized profile by $s_(theta \, T)$ then gives the same fixed low-order profile bound in every
  frame application. Extra original regularity needed by the sparse estimate does not redefine these sizes or
  frame inputs.

Keep the cells needed on the physical domain and its macro enlargements.
  The pushed measure has ball parameter $C m h^(n + 1)$, so $d_(theta \, T) lt.tilde 1$.

#thm([Lemma 7.8.])[
  (Energy budgets after flattening).  #emph[For each physical time bin of length $h^2$, including its fixed enlargement,
#[#set math.equation(numbering: n => "(7.28)")
 $ sum_(upright("bin")) s_(theta \, T)^2 lt.tilde h^(- n) . $ <w:eq-flat-unweighted>]

 There is also the global bound, summed over all clusters, fine bins, cells and time bins with bounded overlap,
#[#set math.equation(numbering: n => "(7.29)")
 $ sum_(theta \, T) d_(theta \, T)^beta s_(theta \, T)^2 lt.tilde_B h^(- n) b_1^(2 n \/ \( n + 1 \)) D^(- c_s) .
   $ <w:eq-flat-weighted>]

 The first assertion is only a per-time-bin statement.]
] <w:flatten>

#proof[
  A physical time interval of length $h^2$ has bounded length in the child time variable,
    even though a full child packet has duration $b_1^2$. At each such time, the Gram matrix of child atoms,
    also after the fixed derivatives in (7.27), has summable rows.
    Integration by parts gives decay in the scaled carrier separation $b_1 \( omega - omega' \)$,
    while compact spatial profiles localize intercepts. Transported phase-space counting bounds the number of
    labels at each scaled distance. All child frequencies are in a fixed bounded box,
    so differentiation introduces no positive power of $b_1$. Consequently
  $ sum_theta lr(bar.v.double partial^alpha U'_theta \( dot.op \, t \) bar.v.double)_2^2 lt.tilde sum_theta
    E_theta lt.eq 1 $
  for the required derivatives. Unit-cell Sobolev, summed in space and over the bounded child-time interval,
    proves (7.28).
  For the weighted bound apply 48, including its fixed derivative versions, to every full child array.
    The pushforward of $mu$ has ball parameter $C m h^(n + 1)$ and its packet moment at scale $b_1$ retains the
    same $D$, since $h^(n + 1) b_1^(n + 1) = L^(n + 1)$. The choice $b_1
    asymp \( B D \)^(C_10)$ ensures that $D$ is at least a fixed positive power of $b_1$ once $D$ is larger than a
    constant depending on $B$; the remaining bounded $b_1 \, D$ cases cost only a constant depending on $B \,
    C_10$. Also $D lt.eq b_1$ by the choice of $C_10$.
  Convolve the pushed measure by the isotropic polynomial kernel used in (7.27),
    and restrict to the suitably enlarged time range. Its ball and packet-moment bounds are preserved:
    translation of a packet weight costs at most its fixed polynomial order, and $P_(*) > M + n +
    2$ makes that cost integrable. The convolved measure has mass at least a constant times $m h^(n + 1)
    d_(theta \, T)$ on the cells where the suprema are taken.
    The sparse estimate therefore gives (7.29), after division by the normalization in (7.27).
    Cluster energies are disjoint and enlarged physical time bins have bounded overlap, so this is a global sum. ◻
]

=== 7.7 Density bands and the frame estimate <density-bands-and-the-frame-estimate>

The two budgets will serve different parts of the summation.
  Very small densities will pay the polynomial number of clusters and time bins,
  so their energies can be bounded one time bin at a time. For the remaining densities we will choose transverse
  coarse bins from one common density band. The corresponding density weight can then remain attached to each
  packet energy and be summed with the global weighted budget.
  We now construct these two kinds of tuples and verify the hypotheses of the frame estimate.

Write the densities in dyadic bands $d_ell = C_d 2^(- ell)$, $ell gt.eq 0$, with fixed upper constant $C_d$.
  Only $O \( log h \)$ indices occur on the needed cells. Indeed their distances from the measure support are
  bounded by a fixed power of $h$, while (7.21) gives a polynomial lower bound on total mass;
  the strictly positive kernel in (7.27) then gives $d_(theta \, T) gt.eq h^(- C)$.

At a witness for each significant coarse bin, at least one band field has modulus at least

#[#set math.equation(numbering: n => "(7.30)")
 $ A_ell = c' R^(- n) lambda \( 1 + ell \)^(- 2) . $ <w:eq-bandlevel>]

This follows by threshold splitting, since $sum_(ell gt.eq 0) \( 1 + ell \)^(- 2) < oo$.
  Choose one such band for each significant bin. There are two possibilities:

+ A chosen band is tiny, $d_ell < X^(- C_11)$. Starting from its center, complete it to a robust $n = k +
  1$ tuple of significant coarse bins in tangential frequency space.
+ All chosen bands are non-tiny. There are only $O \( C_11 log X \)$ colors.
  Some single color supplies a robust $n$-tuple.

Both statements follow from the strip-union exclusion: successive maximal affine heights can all be chosen at
  least $C_(*) \/ R$. If a color failed to supply such a simplex, it would lie in one strip.
  The determinant lower bound for a successful tuple is $c R^(- k)$ throughout the bins when $C_(*)$ is large enough.

Fix a cluster, a time bin of length $h^2$, an ordered coarse tuple and its band indices $ell_i$, $1 lt.eq i lt.eq
  n$. Let $M_0$ be the mass of tested points assigned to this tuple, and let $E_i =
  sum s_(theta \, T)^2$ over its $i$th part, with the fixed time enlargement.
  A tuple of mass at most $m h^(2 n - c_4)$ can be discarded,
  where $c_4 > 0$ is a small fixed dimensional constant. The total number of tuples is $X^C \( log h \)^C$,
  so their relative discarded mass, by (7.21), is at most

$ X^C \( log h \)^C \( h \/ L \)^(2 n) h^(- c_4) = o \( 1 \) . $

This is one of the requirements imposed on the later $kappa$.

For every remaining tuple, Markov and (7.27) retain at least half its mass where all full square envelopes are
  bounded by

#[#set math.equation(numbering: n => "(7.31)")
 $ B_i = C (frac(m h^(n + 1) d_(ell_i) E_i, M_0))^(1 \/ 2) . $ <w:eq-Bi>]

They remain comparable at every point of the macro containing the tested point, since $R^4 lt.double h$.
  Thus they also bound the envelopes at the separate coarse-bin witnesses.
  Zero-energy cases need no consideration. By (7.28) and the mass cutoff,

#[#set math.equation(numbering: n => "(7.32)")
 $ B_i lt.tilde h^(\( 1 - 2 n + c_4 \) \/ 2) \, wide A_(ell_i) \/ B_i gt.eq h^(c_3) $ <w:eq-framecutoff>]

for a fixed $c_3 > 0$. For the latter assertion, use $g gt.eq D^(- 1)$, $chi > L^(- v_0)$ and the margin (7.3).
  Choose $c_4 \, v_0 \, c_3$ as sufficiently small dimensional fractions of that margin;
  the later choice of $kappa$ pays every fixed $X$ power in $L \/ h$, $R$ and the threshold,
  and logarithmic factors are smaller than any fixed positive power of $h$.
  This verifies the frame cutoff without allowing a geometric power to determine $u$ retroactively.

#thm([Lemma 7.9.])[
  (A tuple bound).  #emph[For each retained tuple,
#[#set math.equation(numbering: n => "(7.33)")
 $ lambda^2 M_0 lt.eq C R^C \( 1 + sum_i ell_i \)^C m chi^(1 - beta) h^(n + 2 n \/ \( n + 1 \))
   (product_(i = 1)^n d_(ell_i) E_i)^(beta \/ n) (sum_(i = 1)^n E_i)^(1 - beta) . $ <w:eq-tuple>]

 The $R$ exponent is independent of the number of plate clusters and time bins and of $C_10 \, C_11$.]
] <w:tuple>

#proof[
  Partition the sheared normal spatial coordinate into slabs of width $h$,
    with bounded enlargements to accommodate witnesses. The projected measure in tangential spacetime has
    unit-cube mass at most $C m chi h$ on each slab, by unit covering in the normal coordinate.
  Only nearby normal and time labels of compact packets contribute in a fixed slab and time bin.
    Recenter at the time-bin origin. The residual normal frequency is $O \( 1 \/ h \)$,
    so its drift during $h^2$ is $O \( h \)$. Projected tangential packets consequently have bounded phase-space
    multiplicity. Rotating the lattice changes only bounded multiplicities and comparable polynomial weights.
    The omitted normal and time indices have bounded normalized displacements,
    so the projected envelopes are bounded by a constant times the full envelopes.
  In the normal coordinate divided by $h$, expand each cutoff profile in a Fourier series.
    The residual normal carrier and time phase have bounded normalized derivatives and can be included in that
    profile. The exterior Fourier phase has modulus one. For mode $m in bb(Z)$,
    the tangential packet amplitude and envelope gain $rho_m lt.tilde \( 1 + \| m \| \)^(- A_(*))$,
    with any required fixed $A_(*)$ supplied by the original derivative order.
    Split thresholds by $gamma_m = c \( 1 + \| m \| \)^(- 2)$.
    The frame cutoff improves rather than deteriorates under the factor $gamma_m \/ rho_m$.
  Witnesses need not be on the tested point’s projected unit cube.
    Translate the tangential spacetime packets by an integer offset, separately for each family,
    so that its witness lies in that cube. Each offset is $O \( R^4 \)$, so summing all choices costs $R^C$.
    Counting, transversality and envelope comparability are preserved.
  Apply 14, normalizing family $i$ by $B_i$, and multiply the resulting cube count by $C m chi h$.
    Before summing modes, the right side contains the decay factors
  $ product_(i = 1)^n \( rho_(m_i) \/ gamma_(m_i) \)^(4 \/ \( k n \)) quad
    upright("and, in its ") j upright("th summand,") quad \( rho_(m_j) \/ gamma_(m_j) \)^2 . $
  Every family has a positive decay exponent, even when it does not index the energy summand.
    All independent mode sums therefore converge for fixed large $A_(*)$.
    Sum slabs at this stage, keeping the same global $B_i$ from (7.31) in every slab and putting only its nearby
    packet energies in the linear sum. Each packet occurs in boundedly many enlarged slabs. We obtain
  #[#set math.equation(numbering: n => "(7.34)")
   $ M_0 lt.eq C R^C m chi h product_(i = 1)^n \( B_i \/ A_(ell_i) \)^(4 \/ \( k n \)) sum_(i = 1)^n
     frac(h^(k + 2) E_i, A_(ell_i)^2) . $ <w:eq-frame-before-solve>]
  Summing slabs after solving a nonlinear mass inequality instead would lose a multiplicity factor; (7.34) avoids it.
  Substitute (7.31) and (7.30). Up to the displayed $R$ and band-index factors, the result is
  $ M_0^(1 + 2 \/ k) lt.eq C R^C \( 1 + sum_i ell_i \)^C m^(1 + 2 \/ k) chi h^(n + 2 + 2 \( n + 1 \) \/ k)
    lambda^(- 2 - 4 \/ k) (product_i d_(ell_i) E_i)^(2 \/ \( k n \)) sum_i E_i . $
  Raise both sides to $k \/ \( k + 2 \) = 1 - beta$. The exponent of $h$ becomes $n +
    2 n \/ \( n + 1 \)$ and the product exponent becomes $beta \/ n$; the $lambda$ exponent is exactly $- 2$.
    This is (7.33). ◻
]

=== 7.8 Summation and completion of the induction <summation-and-completion-of-the-induction>

#proof[
  #emph[Completion of the proof of 51.] First sum the tuples with a tiny band.
    The per-bin bound $E_i lt.tilde h^(- n)$ gives
  $ (product_i E_i)^(beta \/ n) (sum_i E_i)^(1 - beta) lt.tilde h^(- n) . $
  Here the polynomial number of clusters and the $O \( \( L \/ h \)^2 \) =
    X^(2 C_10)$ time bins may be counted explicitly. Their total power of $X$ is fixed before $C_11$.
    To sum the density bands, extend the range to all nonnegative indices and use
  #[#set math.equation(numbering: n => "(7.35)")
   $ sum_(min_i d_(ell_i) < X^(- C_11)) \( 1 + sum_i ell_i \)^C product_i d_(ell_i)^(beta \/ n) lt.eq
     C X^(- beta C_11 \/ \( 2 n \)) . $ <w:eq-tinysum>]
  Indeed assign a tiny index, bound the polynomial by a product of polynomials,
    and absorb each into half its exponential decay. The remaining series are geometric.
    There is no factor $log h$ in (7.35). Choose $C_11$ large enough to pay all the previous cluster,
    time-bin and tuple powers and the desired negative power of $D$.
  For a common non-tiny band, the energy expression in (7.33) is bounded by
  $ C d_ell^beta sum_i E_i . $
  Each packet has one density index, and can occur in only $R^C$ coarse tuple and witness-offset choices.
    Normal slabs and enlarged time bins have bounded overlap. Cluster labels are disjoint coefficient subarrays.
    Hence this sum is charged directly to the global weighted bound (7.29),
    with no factor counting clusters or time bins. Also $ell lt.eq C + C_11 log_2 X$,
    so its band factor is only $C \( C_11 \) \( 1 + log X \)^C$. The scale factors cancel as
  $ h^(n + 2 n \/ \( n + 1 \)) h^(- n) b_1^(2 n \/ \( n + 1 \)) = L^(2 n \/ \( n + 1 \)) . $
  The choices of $u$ and then $B$ absorb $R^(C_f)$ and the fixed logarithmic powers into part of the sparse gain.
    Combining both types of tuples, and recalling that a fixed fraction of $M_Y$ remained, gives
  #[#set math.equation(numbering: n => "(7.36)")
   $ lambda^2 M_Y lt.eq C_B m chi^(1 - beta) L^(2 n \/ \( n + 1 \)) D^(- c_s \/ 2) . $ <w:eq-finalL2>]
  We now verify the promised polynomial level bound, before choosing $p - 2$.
    From (7.21), $M_Y gt.eq c m L^(2 n) X^(- C_(upright("geo")))$.
    Substitute this and $lambda = chi^a g L^(- e)$ in (7.36). Since $2 n - 2 e = 2 n \/ \( n + 1 \)$, we obtain
  $ g^2 lt.eq C_B chi^zeta X^(C_(upright("geo"))) D^(- c_s \/ 2) lt.eq C_B X^(C_(upright("geo"))) . $
  Thus $g lt.eq C_B X^(C_g)$ with $C_g$ fixed by geometry, independently of $kappa \, p - 2 \,
    C_(upright("ind"))$. This confirms the noncircular order of choices in 7.1.
  Finally (7.36) and $chi^zeta lt.eq 1$ imply
  $ M_Y lt.eq C_B m L^(2 n) g^(- 2) D^(- c_s \/ 2) lt.eq C'_B m L^(2 n) g^(- p) D^(- sigma) \, $
  provided
  $ C_g \( p - 2 \) + sigma < c_s \/ 2 . $
  This requirement is compatible with the easy-range inequalities, since $p -
    2$ is chosen after all geometric exponents and after $kappa$.
    All uses of induction removed small fractions of the hypothetical mass:
    their ratios were negative powers of $X$, or $R^(- c_2) D^sigma$, fixed before choosing $C_(upright("ind"))$.
    Every remaining constant $C'_B$ is independent of that induction constant.
    Taking $C_(upright("ind")) > C'_B$ contradicts (7.16). Both inductions close, proving 51. ◻
]

== 8 Frequency summation and the simultaneous Gaussian trace <e:section>

Put $s = n \/ \( 2 \( n + 1 \) \)$. We first turn 51 into a short-time estimate for exact extensions.
  We then sum the frequencies on a single dyadic time tree. This order matters:
  maximizing separately at each frequency would give a stronger frequency norm than $H^s$. Throughout this section

$ S \( t \) f \( x \) = \( 2 pi \)^(- n) integral_(bb(R)^n) e^(i x dot.op xi - i t \| xi \|^2) hat(f) \( xi \)
  thin upright(d) xi $

when $hat(f)$ has bounded support. For general $f in L^2$, $S \( t \) f$ initially denotes its $L^2$ equivalence class.

=== 8.1 Exact data and compact arrays <exact-data-and-compact-arrays>

#thm([Lemma 8.1.])[
  (Compact layers for bounded-frequency data).  #emph[Let $g in
    L^2 \( bb(R)^n \)$ have support in a fixed bounded frequency box, and let $L gt.eq 1$.
    On $\| T \| lt.eq C L^2$, its extension is a sum of compact arrays of scale $L$,
$ cal(E) g \( X \, T \) = sum_(q in bb(Z)^n) U_q \( X \, T \) . $

 For any prescribed finite profile derivative order $J$ and any $A > 0$,
   the arrays can be chosen with uniformly bounded $C^J$ native profiles and coefficient energies
#[#set math.equation(numbering: n => "(8.1)")
 $ E_q lt.eq C_(A \, J) chevron.l q chevron.r^(- 2 A) lr(bar.v.double g bar.v.double)_2^2 . $ <e:layer-energy>]

 Each fixed $q$ has uniformly bounded phase-space multiplicity.
   Finite coefficient truncations converge uniformly on the stipulated time range,
   and the sum in $q$ also converges uniformly. Consequently any homogeneous weak $L^p$ estimate for these compact
   arrays passes to $cal(E) g$ without a power of $L$ or a count of layers.]
] <e:compact-layers>

#proof[
  Here $cal(E) g$ uses the same Fourier normalization as $S \( t \)$;
    fixed normalizing constants below are harmless. Choose a smooth partition $sum_theta chi_theta =
    1$ on the frequency box, with bounded overlap and caps of side $L^(- 1)$ centered at $omega_theta$.
    In a fixed larger box $B subset bb(R)^n$ form
  $ G_theta \( zeta \) = L^(- n \/ 2) \( chi_theta g \) \( omega_theta + zeta \/ L \) \, $
  extended by zero. Its Fourier-series coefficients $c_(theta \, m)$ satisfy
  #[#set math.equation(numbering: n => "(8.2)")
   $ sum_(theta \, m) \| c_(theta \, m) \|^2 lt.eq C lr(bar.v.double g bar.v.double)_2^2 $ <e:parseval>]
  by Parseval and bounded overlap. If $psi_theta$ is a smooth bump equal to one on the support of this rescaled
    cap and supported inside $B$, then
  $ \( chi_theta g \) \( omega_theta + zeta \/ L \) = L^(n \/ 2) psi_theta \( zeta \) sum_m c_(theta \, m)
    e^(- i gamma m dot.op zeta) $
  as an $L^2$ identity, where the fixed lattice constant $gamma > 0$ depends only on $B$.
    In particular, no derivative of $g$ has been taken. Writing
  $ H_theta \( u \, tau \) = \( 2 pi \)^(- n) integral e^(i u dot.op zeta - i tau \| zeta \|^2)
    psi_theta \( zeta \) thin upright(d) zeta \, $
  the corresponding extension terms are
  #[#set math.equation(numbering: n => "(8.3)")
   $ c_(theta \, m) L^(- n \/ 2) e^(i \( X dot.op omega_theta - T \| omega_theta \|^2 \)) H_theta #h(-0.16667em)
     (frac(X - gamma L m - 2 T omega_theta, L) \, T / L^2) . $ <e:exact-packet>]
  For bounded $tau$, integration by parts in $zeta$ gives arbitrary spatial decay for $H_theta$ and every fixed
    number of its derivatives, uniformly in $theta$ and $L$.
  Take $rho in C_c^oo \( bb(R)^n \)$ with $sum_(q in bb(Z)^n) rho \( u - q \) = 1$,
    and a fixed time cutoff equal to one on the required native time range.
    In the $q$th summand replace the intercept $gamma L m$ by $gamma L m + L q$.
    With the new native spatial variable $u$, the profile is
  $ rho \( u \) chi \( tau \) H_theta \( u + q \, tau \) . $
  Its $C^J$ norm is at most $C_(A \, J) chevron.l q chevron.r^(- A)$. Extract this factor into the coefficient.
    The divided profile is compact and uniformly bounded in $C^J$, and (8.2) gives (8.1).
    A fixed $q$ translates the entire intercept lattice by the same vector; hence phase-space multiplicity is unchanged.
  For completeness, convergence holds in the pointwise form needed here.
    At any point of a fixed compact layer only $O \( 1 \)$ intercepts for each cap can contribute,
    and there are $O \( L^n \)$ caps. Cauchy–Schwarz therefore bounds the contribution of a coefficient tail by
  $ C chevron.l q chevron.r^(- A) L^(- n \/ 2) L^(n \/ 2) #scale(x: 180%, y: 180%)[\(]
    sum_(\( theta \, m \) upright(" in the tail")) \| c_(theta \, m) \|^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $
  This tends to zero uniformly. Taking $A > n$ also gives uniform summation in $q$.
    Independently, the cap Fourier-series partial sums converge to $g$ in $L^2$ on a bounded frequency set;
    Cauchy–Schwarz on that set makes their exact extensions converge uniformly. The two limits coincide.
  Finally choose positive $b_q$ with $sum_q b_q = 1$ and $b_q asymp chevron.l q chevron.r^(- n - 1)$.
    The elementary implication
  $ lr(|sum_q U_q|) > lambda quad arrow.r.double quad \| U_q \| > b_q lambda med upright("for some ") q $
  passes a weak $p$ estimate to the sum, with cost $sum_q b_q^(- p) E_q^(p \/ 2)$.
    This is bounded by $C lr(bar.v.double g bar.v.double)_2^p$ after choosing the fixed $A$ sufficiently large. ◻
]

#thm([Proposition 8.2.])[
  (Lossless short-time weak estimate).  #emph[Let $p > 2$ be the exponent in 51.
    If $N gt.eq 1$ and $f_N in L^2$ has Fourier support in a fixed annulus dilated by $N$,
    then for every unit ball $Omega subset bb(R)^n$ and every time interval $I$ of length $N^(- 1)$,
#[#set math.equation(numbering: n => "(8.4)")
 $ ∥sup_(t in I) \| S \( t \) f_N \|∥_(L^(p \, oo) \( Omega \)) lt.eq
   C N^s lr(bar.v.double f_N bar.v.double)_2 . $ <e:short-formula>]

 The constant is independent of the centers of $Omega$ and $I$.]
] <e:short-time>

#proof[
  Unitarity replaces $f_N$ by $S \( t_0 \) f_N$ and puts the left endpoint of $I$ at zero.
    Spatial translation also preserves its norm and frequency support.
    Set $L = sqrt(N)$, $X = N x$, and $T = N^2 t$. The normalized bounded-frequency input is $g \( eta \) =
    N^(n \/ 2) hat(f)_N \( N eta \)$, up to the fixed Plancherel normalization. Thus
  $ S \( t \) f_N \( x \) = N^(n \/ 2) cal(E) g \( N x \, N^2 t \) \, wide
    lr(bar.v.double g bar.v.double)_2 asymp lr(bar.v.double f_N bar.v.double)_2 . $
  A measurable time graph $T = T \( X \)$ over the dilated spatial ball carries the measure obtained by pushing
    forward $thin upright(d) X$. Its mass in any spacetime ball of radius $r$ is at most $C r^n$,
    regardless of the regularity of the graph. Its native time range is bounded, its unit mass bound has $chi =
    1$, and 27 supplies the tube moment with $D = 1$ and a fixed measure constant.
  Apply 51 to the layers in 60 and use the summable threshold splitting there. On the scaled graph the result is
  $ mu { \| cal(E) g \| > L^(- e) g_0 } lt.eq C L^(2 n) g_0^(- p) lr(bar.v.double g bar.v.double)_2^p . $
  Returning to the original graph multiplies its mass by $N^(- n) = L^(- 2 n)$. The amplitude factor is exactly
  $ N^(n \/ 2) L^(- e) = N^(\( n - e \) \/ 2) = N^(n \/ \( 2 \( n + 1 \) \)) = N^s . $
  This proves the level estimate for every measurable graph.
    For a finite list of times, choose the first time achieving the maximum; that graph is measurable.
    Exhaust a countable dense set of times and use the continuity of bounded-frequency extensions to obtain (8.4).
    At bounded $N$, the same statement follows directly from the Fourier $L^1$ bound, so no lower scale is omitted. ◻
]

=== 8.2 One time tree for every frequency <one-time-tree-for-every-frequency>

The argument below is the common-tree mechanism of the planar companion #cite(label("PSE2026")) Section 9.
  We give the full calculation in dimension $n$: its spatial rescaling is the point at which the endpoint exponent
  enters.

#thm([Lemma 8.3.])[
  (Dual square sum).  #emph[Fix measurable $t : Omega arrow.r \[ 0 \, 1 \)$ and $w : Omega arrow.r
    bb(C)$ with $\| w \| lt.eq 1$, where $Omega$ is a unit ball.
    Let $psi$ be a smooth compactly supported annular cutoff.
    For $N = 2^j$, $j gt.eq 1$, and a half-open dyadic interval $I subset \[ 0 \, 1 \)$ set
$ G_N \( I \) \( xi \) = psi \( xi \/ N \) integral_({ x in Omega : t \( x \) in I })
  e^(i x dot.op xi - i t \( x \) \| xi \|^2) w \( x \) thin upright(d) x \, wide d_j \( I \) =
  N^(- 2 s) lr(bar.v.double G_N \( I \) bar.v.double)_2^2 . $

 Then
#[#set math.equation(numbering: n => "(8.5)")
 $ sum_(j gt.eq 1) d_j \( \[ 0 \, 1 \) \) lt.eq C . $ <e:dual-square-formula>]

 The same $t$ and $w$ are used for every $j$.]
] <e:dual-square>

#proof[
  Write $m_I = \| { x in Omega : t \( x \) in I } \|$ and let $cal(D)_a$ be the intervals at #emph[absolute] depth
    $a$. The pairing kernel for the squared Fourier norm has phase, after $xi = N eta$,
  $ N \( x - y \) dot.op eta - N^2 \( t \( x \) - t \( y \) \) \| eta \|^2 . $
  If two intervals in $cal(D)_j$ have indices differing by a sufficiently large fixed constant,
    then $\| t \( x \) - t \( y \) \| gt.eq C \/ N$. Since $\| x -
    y \|$ is bounded and $eta$ lies in an annulus away from zero, the time term dominates the gradient.
    Repeated integration by parts gives any prescribed negative power of $N$ for the kernel.
    Integrate this bound once over the entire set of far pairs;
    there is no factor equal to the number of pairs of intervals.
    The other pairs have bounded neighbor multiplicity, and Hilbert-space Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ d_j \( \[ 0 \, 1 \) \) lt.eq C sum_(I in cal(D)_j) d_j \( I \) + C 2^(- 2 j) . $ <e:initial-time-separation>]
  Let $J subset I in cal(D)_j$ be at relative depth $k$, where $0 lt.eq k lt.eq j$, and put $r = 2^(- k)$.
    Its time width is $r \/ N$. Dualizing 61 and integrating a weak $L^p$ function over a set of mass $m_J$ gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ d_j \( J \) lt.eq C m_J^(2 - 2 \/ p) . $ <e:first-descendant>]
  Indeed $integral_A \| F \| lt.eq C_p \| A \|^(1 - 1 \/ p) lr(bar.v.double F bar.v.double)_(p \, oo)$ for $p >
    1$, and duality may be taken over unit $L^2$ inputs with the annular cutoff.
  We also need the spatially localized bound
  #[#set math.equation(numbering: n => "(8.8)")
   $ d_j \( J \) lt.eq C r^(2 s) m_J . $ <e:second-descendant>]
  Partition space into cubes of side $r$. For pairs outside a fixed number of neighbor offsets, $\| x - y \| gt.eq
    C r$ whereas $\| t \( x \) - t \( y \) \| lt.eq r \/ N$. The spatial term now dominates the phase gradient, giving
  $ \| K_N \( x - y \, t \( x \) - t \( y \) \) \| lt.eq C N^n \( 1 + N \| x - y \| \)^(- n - 2) . $
  Its spatial integral is bounded. Thus the normalized contribution of these pairs is at most $C N^(- 2 s) m_J
    lt.eq C r^(2 s) m_J$, using $N r gt.eq 1$. For neighbor pairs, Cauchy–Schwarz reduces to single-cube energies.
    On a cube $Q$ of side $r$, put
  $ x = x_Q + r X \, wide t = t_J + r^2 T \, wide eta = r xi . $
  The frequency is $N r$, the time interval has length $1 \/ \( N r \)$,
    and the squared Fourier norm acquires a factor $r^n$. If $m_(J \, Q) = \| Q ∩ Omega ∩ { t in J } \|$,
    a fixed cover of the rescaled unit cube by unit balls lets 61 bound this normalized energy by
  $ C r^(n + 2 s) (m_(J \, Q) / r^n)^(2 - 2 \/ p) lt.eq C r^(2 s) m_(J \, Q) . $
  The last inequality uses $m_(J \, Q) lt.eq r^n$ and $2 - 2 \/ p > 1$. Summation proves (8.8).
    This remains valid at $N r = 1$: the scale-one instance of 61 is the elementary bounded-frequency estimate.
    We never descend beyond $k = j$. Taking the geometric mean of (8.7) and (8.8) yields
  #[#set math.equation(numbering: n => "(8.9)")
   $ d_j \( J \) lt.eq C 2^(- s k) m_J^alpha \, wide alpha = 3 / 2 - 1 / p > 1 . $ <e:interpolated-descendant>]
  Starting at each $I in cal(D)_j$, follow its heavier child for $j$ generations,
    breaking ties by a fixed convention. Let $H \( I \, k \)$ be the interval after $k$ heavier-child steps,
    with $H \( I \, 0 \) = I$, and let $P \( I \, k \)$ be the lighter child at the $k$th step; see 2.
    Thus $H \( I \, j \)$ is the terminal heavy interval. These lighter children and $H \( I \, j \)$ partition
    $I$, including any atoms of $t_(\#) thin upright(d) x$, because intervals are half-open.
    Additivity of $G_N$, the triangle inequality, and weighted Cauchy–Schwarz with weights $2^(- s k \/ 2)$ give
  #[#set math.equation(numbering: n => "(8.10)")
   $ d_j \( I \) lt.eq C sum_(k = 1)^j 2^(- s k \/ 2) m_(P \( I \, k \))^alpha +
     C 2^(- s j \/ 2) m_I^alpha . $ <e:heavy-path>]
  Here the terminal mass was bounded by $m_I$.
  For child masses $a gt.eq b gt.eq 0$,
  #[#set math.equation(numbering: n => "(8.11)")
   $ \( a + b \)^alpha - a^alpha - b^alpha gt.eq \( 2^alpha - 2 \) b^alpha . $ <e:convexity-deficit>]
  For $b > 0$, this follows by writing $a \/ b gt.eq 1$ and differentiating $\( u + 1 \)^alpha - u^alpha - 1$;
    the case $b = 0$ is immediate. Sum the nonnegative deficits over a finite dyadic tree and telescope.
    Then pass to increasing finite trees. The result bounds the sum of the lighter-child $alpha$ powers over any
    set of distinct parents by $m_(\[ 0 \, 1 \))^alpha \/ \( 2^alpha - 2 \)$.
  Fix a relative depth $k$. As $j gt.eq k$ and $I in cal(D)_j$ vary, the parents of $P \( I \, k \)$ are distinct.
    Their absolute depth is $j + k - 1$, so different $j$ give different levels; for the same $j$,
    different initial $I$ have disjoint descendants. This is precisely why the same time tree must be used for all
    frequencies. Hence
  $ sum_(j gt.eq k) sum_(I in cal(D)_j) m_(P \( I \, k \))^alpha lt.eq C . $
  Also $sum_(I in cal(D)_j) m_I^alpha lt.eq m_(\[ 0 \, 1 \))^alpha$.
    Sum (8.10) first at fixed $k$ and then in $k$; both $2^(- s k \/ 2)$ and the terminal factors $2^(- s j \/ 2)$
    are summable since $s > 0$. Finally sum the errors in (8.6). This proves (8.5). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((0, 0.03528), [$I in cal(D)_j$], anchor: "south")
  circle((0.8, -0.8), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  circle((-1.1, -0.8), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((-1.135, -0.8), [$P(I,1)$], anchor: "east")
  line((0, 0), (0.8, -0.8), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  line((0, 0), (-1.1, -0.8), stroke: (paint: rgb("#737373"), thickness: 0.6pt, miter-limit: 10))
  content((1.15, -1.28), [#text(size: 9pt)[$dots.v$]])
  line((0.8, -0.8), (1.55, -1.75), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dotted"))
  circle((1.55, -1.9), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((1.575, -1.875), [$H(I,k-1)$], anchor: "south-west")
  circle((0.4, -2.8), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((0.3751, -2.825), [$P(I,k)$], anchor: "north-east")
  circle((2.45, -2.8), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  line((1.55, -1.9), (0.4, -2.8), stroke: (paint: rgb("#737373"), thickness: 0.6pt, miter-limit: 10))
  line((1.55, -1.9), (2.45, -2.8), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  line((2.45, -2.8), (3, -3.5), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dotted"))
  circle((3.15, -3.7), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.15, -3.735), [$H(I,j)$], anchor: "north")
  content((4.1, 0), [#text(size: 9pt)[absolute depth $j$]], anchor: "west", padding: 0.1176cm)
  content((4.1, -1.9), [#text(size: 9pt)[absolute depth $j+k-1$]], anchor: "west", padding: 0.1176cm)
  content((4.1, -2.8), [#text(size: 9pt)[relative depth $k$, $r=2^(-k)$]], anchor: "west", padding: 0.1176cm)
  content((4.1, -3.7), [#text(size: 9pt)[relative depth $j$, $"Nr"=1$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: A heavier-child path starting at absolute depth $j$. Its lighter child at relative depth $k$ has a parent at absolute depth $j + k - 1$. Holding $k$ fixed and changing the frequency index $j$ therefore selects distinct parent vertices in one common tree. The path stops at $k = j$, where the rescaled frequency is $N r = 1$. ],
) <e:time-tree-figure>

#thm([Theorem 8.4.])[
  (Local $L^1$ endpoint maximal estimate).  #emph[For compactly supported $hat(f) in L^2$ and every unit ball $Omega$,
#[#set math.equation(numbering: n => "(8.12)")
 $ integral_Omega sup_(0 lt.eq t < 1) \| S \( t \) f \( x \) \| thin upright(d) x lt.eq
   C lr(bar.v.double f bar.v.double)_(H^s \( bb(R)^n \)) . $ <e:maximal-formula>]

 The constant is uniform under translation of $Omega$.]
] <e:maximal>

#proof[
  Take a smooth inhomogeneous Littlewood–Paley decomposition $f = f_(upright("lo")) +
    sum_(j gt.eq 1) f_(2^j)$ with bounded frequency overlap. The low-frequency part satisfies $sup_(x \, t) \|
    S \( t \) f_(upright("lo")) \( x \) \| lt.eq C lr(bar.v.double f_(upright("lo")) bar.v.double)_2$.
    For a fixed measurable graph $t \( x \)$ and phase $w \( x \)$, frequency Cauchy–Schwarz and 62 give
  $ lr(|integral_Omega w \( x \) sum_j S \( t \( x \) \) f_(2^j) \( x \) thin upright(d) x|) & lt.eq
    C (sum_j 2^(2 j s) lr(bar.v.double f_(2^j) bar.v.double)_2^2)^(1 \/ 2)
    (sum_j 2^(- 2 j s) lr(bar.v.double G_(2^j) \( \[ 0 \, 1 \) \) bar.v.double)_2^2)^(1 \/ 2)\
 & lt.eq C lr(bar.v.double f bar.v.double)_(H^s) . $
  Choose the annular cutoff in $G_(2^j)$ equal to one on the corresponding Littlewood–Paley support.
    The first factor is the Sobolev square sum; no frequency logarithm or $ell^1$ sum has appeared.
    For a finite time list, select the first maximizer of the full field and its conjugate phase (zero where the
    field is zero). These are measurable and are common to every frequency.
    The preceding bound is then the integral of that finite maximum.
    Increase the lists to a dense countable subset of $\[ 0 \, 1 \)$ containing zero.
    Continuity of the bounded-frequency field and monotone convergence prove (8.12).
    All kernel estimates depend only on spatial differences, giving the asserted translation uniformity. ◻
]

=== 8.3 One representative and all real times <e:trace>

To complete 1, we first construct a representative continuous in time and then remove Gaussian regularization
  uniformly in time on one full-measure spatial set. The following approximate-identity lemma will be applied to a
  countable family of error envelopes.

#thm([Lemma 8.5.])[
  (Gaussian approximation with uniform local integrals).  #emph[Let $M gt.eq 0$ be measurable and $A =
    sup_z integral_(B \( z \, 1 \)) M < oo$. For
$ K_a \( y \) = \( 4 pi a \)^(- n \/ 2) e^(- \| y \|^2 \/ \( 4 a \)) \, wide a > 0 \, $

 the convolution $K_a * M$ is finite at every point. At every Lebesgue point $x$ of $M$,
   it tends to $M \( x \)$ as $a arrow.b 0$.]
] <e:gaussian-local>

#proof[
  For a fixed $rho > 0$, cover each annulus $2^ell rho lt.eq \| y \| < 2^(ell + 1)
    rho$ by $C \( 1 + 2^ell rho \)^n$ unit balls. Uniformly in the center $x$,
  #[#set math.equation(numbering: n => "(8.13)")
   $ integral_(\| y \| gt.eq rho) K_a \( y \) M \( x - y \) thin upright(d) y lt.eq
     C A a^(- n \/ 2) sum_(ell gt.eq 0) \( 1 + 2^ell rho \)^n e^(- 4^ell rho^2 \/ \( 4 a \)) . $ <e:gaussian-annuli>]
  The series is finite for every $a > 0$, and for all sufficiently small $a$ it is at most $C_rho A a^(- n \/ 2)
    e^(- rho^2 \/ \( 8 a \))$. The integral over a bounded ball is finite by local integrability,
    which proves the first assertion.
  At a Lebesgue point set $H_x \( r \) = integral_(\| y \| < r) \| M \( x - y \) -
    M \( x \) \| thin upright(d) y = o \( r^n \)$. Given $epsilon > 0$, choose $rho$ so that $H_x \( r \) lt.eq
    epsilon r^n$ for $0 < r lt.eq rho$. Radial integration by parts gives
  $ integral_(\| y \| < rho) K_a \( y \) \| M \( x - y \) - M \( x \) \| thin upright(d) y lt.eq
    epsilon (K_a \( rho \) rho^n + integral_0^rho \( - K'_a \( r \) \) r^n thin upright(d) r) lt.eq C epsilon . $
  The complementary integral tends to zero by (8.13), together with the elementary Gaussian tail bound for the
    constant $\| M \( x \) \|$. Letting $epsilon arrow.b 0$ proves the claim. ◻
]

#proof[
  Fix $n gt.eq 3$ and a complex-valued $f in H^s \( bb(R)^n \)$.
    Choose $f_j$ with $hat(f)_j in C_c^oo$ and $lr(bar.v.double f_j - f bar.v.double)_(H^s) lt.eq 2^(- j)$.
    The successive differences satisfy a summable $H^s$ bound. By 63, on every unit ball
  $ integral sum_j sup_(0 lt.eq t < 1) \| S \( t \) \( f_(j + 1) - f_j \) \( x \) \| thin upright(d) x < oo . $
  A countable covering of $bb(R)^n$ therefore gives a common full-measure set $E_0$ on which $S \( t \)
    f_j \( x \)$ converges uniformly for $0 lt.eq t < 1$. Call the limit $v \( x \, t \)$ and set
    $v \( x \, t \) = 0$ off $E_0$. For every $x$, $v \( x \, dot.op \)$ is continuous on $\[ 0 \, 1 \)$;
    it is jointly measurable as a pointwise limit on a measurable set.
    The measurability of $E_0$ and of all the suprema just used can equally be read from the countable dense set
    of times, by continuity.
  Fix an arbitrary real $t in \[ 0 \, 1 \)$. Unitarity gives $S \( t \) f_j arrow.r S \( t \) f$ in $L^2$,
    whereas the construction gives pointwise convergence to $v \( dot.op \, t \)$ almost everywhere.
    Hence $v \( dot.op \, t \)$ is an $L^2$ representative of $S \( t \) f$.
    For each $a > 0$ and $x in bb(R)^n$, the function $K_a \( x - dot.op \)$ lies in $L^2$.
    Pairing it with this $L^2$ class and using Plancherel yields the everywhere-defined identity
  #[#set math.equation(numbering: n => "(8.14)")
   $ U_a f \( x \, t \) = \( K_a * v \( dot.op \, t \) \) \( x \) . $ <e:class-gaussian-identity>]
  The fixed $t$ was arbitrary. Thus (8.14) holds for every triple $\( x \, a \, t \)$ in the indicated ranges;
    no intersection of time-dependent exceptional sets has been taken.
    The convolution is absolutely convergent by Cauchy–Schwarz.
  Let
  $ M_j \( x \) = sup_(0 lt.eq t < 1) \| v \( x \, t \) - S \( t \) f_j \( x \) \| . $
  These functions are measurable because the supremum equals the one over rational times.
    They tend to zero on $E_0$. Uniform convergence there and Fatou’s lemma applied to $sup_t \|
    S \( t \) \( f_ell - f_j \) \|$ show that
  #[#set math.equation(numbering: n => "(8.15)")
   $ A_j := sup_z integral_(B \( z \, 1 \)) M_j \( x \) thin upright(d) x lt.eq
     C lr(bar.v.double f - f_j bar.v.double)_(H^s) . $ <e:envelope-local-integrals>]
  All translated balls have the same constant by 63. The values on the null complement of $E_0$ do not affect this
    estimate. Intersect $E_0$ with the Lebesgue-point sets of the countably many $M_j$.
    By 64, at every point of this intersection $K_a * M_j \( x \) arrow.r M_j \( x \)$ for every $j$.
  For every $y$ and every $t$, the definition of $M_j$ gives the simultaneous inequality $\| v \( y \, t \) -
    S \( t \) f_j \( y \) \| lt.eq M_j \( y \)$. Combining it with (8.14) gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ sup_(0 < t < 1) \| U_a f \( x \, t \) - v \( x \, t \) \| lt.eq \( K_a * M_j \) \( x \) + M_j \( x \) +
     R_j \( a \) \, $ <e:envelope-gaussian-bound>]
  where
  $ R_j \( a \) := \( 2 pi \)^(- n) integral \| 1 - e^(- a \| xi \|^2) \| thin \| hat(f)_j \( xi \) \| thin
    upright(d) xi arrow.r 0 . $
  This last convergence is uniform in $x \, t$ since $hat(f)_j in L^1$.
    First let $a arrow.b 0$ at a point of the common set. The limsup of the left side of (8.16) is at most $2
    M_j \( x \)$. Then let $j arrow.r oo$. This proves (1.2) for all real times in the interval at once.
  Finally, intersect with the Lebesgue points of $f$ and with the full-measure set on which $v \( x \, 0 \) =
    f \( x \)$, supplied by the fixed-time $L^2$ identity at zero.
    On the resulting $E_f$, $v \( x \, 0 \) = f^(*) \( x \)$ and time continuity gives $v \( x \, t \) arrow.r
    f^(*) \( x \)$ as real $t arrow.b 0$. The Gaussian limit in (1.2) is taken first,
    so these are exactly the asserted iterated limits. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
