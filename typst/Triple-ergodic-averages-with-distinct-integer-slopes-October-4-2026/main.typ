#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Triple-ergodic-averages-with-distinct-integer-slopes-October-4-2026]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $\( X \, cal(F) \, mu \)$ be a probability space and let $T : X arrow.r
  X$ be an invertible measure-preserving transformation with measurable inverse.
  Given bounded measurable functions $f_1 \, f_2 \, f_3$ and distinct nonzero integers $lambda_1 \, lambda_2 \,
  lambda_3$, consider

#[#set math.equation(numbering: n => "(1.1)")
 $ A_N \( x \) = 1 / N sum_(n = 1)^N product_(j = 1)^3 f_j \( T^(lambda_j n) x \) . $ <eq:averages>]

The issue is convergence at almost every point, rather than only in norm.
  We assume that $T$ is mixing, in the sense that

#[#set math.equation(numbering: n => "(1.2)")
 $ mu \( A ∩ T^(- n) B \) arrow.r mu \( A \) mu \( B \) quad upright("as ") \| \| n arrow.r
   oo quad \( A \, B in cal(F) \) . $ <eq:mixing>]

#thm([Theorem 1.1.])[
  #emph[For every system satisfying (1.2), every triple of pairwise distinct nonzero integers $lambda_1 \,
    lambda_2 \, lambda_3$, and every bounded measurable $f_1 \, f_2 \, f_3 : X arrow.r bb(C)$,
    the averages in (1.1) satisfy
$ A_N \( x \) arrow.r product_(j = 1)^3 integral_X f_j thin d mu quad upright("for almost every ") x \, $

 as $N$ tends to infinity through all positive integers. The exceptional null set may depend on the slopes and the
   functions.]
] <thm:main>

The probability space need not be standard or countably generated. Both positive and negative slopes are allowed.
  The proof depends on the analytic results of the companion manuscripts [12,13];
  their role and the extension required here are described below.

=== 1.1 Context and predecessors <context-and-predecessors>

Birkhoff’s pointwise ergodic theorem [3] treats one function.
  Products along several iterates arise naturally in Furstenberg’s ergodic proof of the multiple recurrence
  theorem and its connection with arithmetic progressions [7].
  Multiple recurrence, norm convergence, and pointwise convergence are different questions.
  In particular, convergence in $L^2$ does not by itself establish convergence at almost every point along the
  full sequence.

For weakly mixing transformations, the product-of-integrals limit in $L^2$ is classical.
  Bergelson’s weakly mixing PET theorem [2] Theorem 1.2 and p. 340 includes distinct nonzero integer slopes of
  either sign. For general systems, Host and Kra [9] and Ziegler [15] developed the norm-convergence theory using
  characteristic factors with nilpotent structure. These results explain the limiting structure without resolving
  the corresponding pointwise question.

Bourgain’s double recurrence theorem [4] establishes almost-sure convergence for two bounded functions evaluated
  at two powers of one transformation. Pointwise theorems for longer products also have substantial precedents
  under additional assumptions on the system. For example, Derrien and Lesigne [6] Theorem 4.2 prove polynomial
  pointwise theorems for $K$-systems and exact endomorphisms;
  their invertible case includes the linear configurations considered here.
  Other structural hypotheses yielding pointwise convergence for all finite progression lengths include singular
  spectrum on the Pinsker factor of a weakly mixing system, by Assani [1],
  and the pairwise-independent-joining property for weakly mixing systems, by Gutman, Huang, Shao, and Ye [8].
  The significance of Theorem 1 is that its dynamical assumption is mixing alone,
  while the three slopes are arbitrary distinct nonzero integers.

The harmonic-analytic method separates convergence from identification of the limit.
  A uniform oscillation estimate gives pointwise convergence; mixing identifies that limit by an $L^2$ argument.
  Oscillation methods in ergodic theory are developed in [4,10],
  and the passage from translation estimates to orbit estimates follows the transference principle of
  Calderón [5]. We give that passage directly, so it imposes no additional structure on the probability space.

=== 1.2 Analytic input and the coefficient extension <analytic-input-and-the-coefficient-extension>

The manuscript [12] proves an $L^3$ bound for the trilinear Hilbert transform through local four-linear forms.
  Its proof includes chart detection, localization by quadratic data, comparison on short depth blocks,
  and a separated-frequency counting estimate. The quantitative inverse theorem of Leng, Sah,
  and Sawhney [11] enters its chart detection argument. Arithmetic regularity and inverse-theorem methods also
  occur in Tao’s sublogarithmic cancellation theorem for truncated multilinear Hilbert transforms [14];
  that cancellation theorem is distinct from the uniform local estimate used here.

The companion [13] adapts the local estimates to inputs that vary with depth and deduces pointwise convergence for
  the slopes $1 \, 2 \, 3$. The local forms in both companions use the four coordinates $x \, x + t \, x + 2 t \,
  x + 3 t$. A power of $T$ and a permutation of the functions do not turn an arbitrary triple into this
  configuration. Thus their stated theorems cannot simply be invoked for the slopes in Theorem 1.

The new work is the extension of their local proofs to $x + b_j t$, $0 lt.eq j lt.eq 3$,
  for fixed distinct integers with $b_0 = 0$. Three features are particularly useful beyond this application.
  First, an integer left inverse of the #emph[whole] primitive configuration replaces a unimodular pair of
  coordinates; this removes extra lattice or torus configurations in discretization.
  Second, a Vandermonde relation provides the quadratic cancellation and the Fourier randomization for every set
  of four distinct slopes. Third, a height base divisible by all pair differences preserves the divisibility
  required in the separated-frequency argument. The last step must preserve a bound polynomial in the dimension:
  an exponential loss there would not fit the proof’s parameter choices.

These are extensions of the proofs in [12,13], not new proofs of their coefficient-independent projection and row
  estimates. We state the local conclusion completely, prove the coefficient-sensitive identities and estimates,
  and specify the results imported from the companions at their points of use.
  In particular, the technical part is a proof by reference to those manuscripts,
  whereas the ergodic deduction is presented in full.

=== 1.3 Proof structure <proof-structure>

Section 2 defines the admissible kernels and states the local estimate for inputs with controlled variation on
  blocks of depths. Section 3 proves Theorem 1 from that estimate:
  smooth scale differences are realized by cancellative kernels,
  then transferred to integer sequences and finite orbits. The resulting oscillation bound gives convergence for
  smooth profiles; moment-corrected approximations to interval indicators recover all integer lengths.

The remaining sections prove the local estimate. Section 4 establishes the coefficient modifications in detection
  and localization. Section 5 proves the short-block, height, and counting modifications.
  Section 6 closes the parameter argument, first for fixed inputs and then for depth-dependent inputs.
  All analytic constants may depend on the fixed slopes; no bound is required uniformly over triples of integers.

== 2 The local estimate and the coefficient algebra <sec:local>

The analytic estimate concerns four inputs on the real line.
  Its constant may depend on the slopes, but must be independent of the number of scales and of the number of
  changes of the inputs. This uniformity will give the oscillation estimate in Section 3.

=== 2.1 Normalization and local forms <normalization-and-local-forms>

Set

$ g = gcd \( \| lambda_1 \| \, \| lambda_2 \| \, \| lambda_3 \| \) \, wide S = T^g \, wide b_0 = 0 \, wide b_j =
  lambda_j \/ g quad \( 1 lt.eq j lt.eq 3 \) . $

Then $S$ is invertible, probability preserving, and mixing, and $T^(lambda_j n) = S^(b_j n)$.
  Henceforth the four distinct integers $b_0 \, b_1 \, b_2 \, b_3$ are fixed,
  and $gcd \( \| b_1 \| \, \| b_2 \| \, \| b_3 \| \) = 1$. We make no assertion of uniformity as these integers vary.

Dyadic intervals are half-open. The depth of a descendant $I$ of a dyadic interval $J$ is $s \( I \) =
  log_2 \( \| J \| \/ \| I \| \)$. A finite rooted tree contains every ancestor between any of its intervals and
  its root. The dyadic lattice may be translated.

#prodef([Definition 2.1.])[
  (Local kernels).  Fix $delta_0 > 0$ and $C_0 gt.eq 1$. For an interval $I$ of length $r$,
    a kernel $w_I in C_c^oo \( bb(R)^2 \; bb(C) \)$ is admissible if
  + $"dist" \( x + b_j t \, partial I \) gt.eq delta_0 r$ and $x +
    b_j t in I$ for every $\( x \, t \) in "supp" w_I$ and $0 lt.eq j lt.eq 3$;
  + for every $v in bb(R)$ and $0 lt.eq j lt.eq 3$,
    #[#set math.equation(numbering: n => "(2.1)")
     $ integral_(bb(R)) w_I \( v - b_j t \, t \) thin d t = 0 \; $ <eq:marginals>]
  + for nonnegative integers $a \, d$ and $n = a + d$,
    #[#set math.equation(numbering: n => "(2.2)")
     $ lr(bar.v.double partial_x^a partial_t^d w_I bar.v.double)_oo lt.eq
       r^(- n) #scale(x: 120%, y: 120%)[\(] C_0 \( n + 2 \) #scale(x: 120%, y: 120%)[\)]^(C_0 \( n + 2 \)) .
       $ <eq:derivatives>]
  For scalar measurable inputs define
  #[#set math.equation(numbering: n => "(2.3)")
   $ H_I \( z_0 \, z_1 \, z_2 \, z_3 \) = r^(- 2) integral_(bb(R)^2) w_I \( x \, t \) product_(j = 0)^3
     z_j \( x + b_j t \) thin d x thin d t \, $ <eq:local-form>]
  whenever the integral is absolutely convergent.
] <def:kernels>

For a nonempty integer block $B = { u \, dots.h \, v }$ and functions $z_s$ on a common domain, put

$ cal(V)_B \( z \) = max_(u lt.eq s lt.eq v) \| z_s \| + sum_(s = u)^(v - 1) \| z_(s + 1) - z_s \| . $

This is a pointwise bound on both size and variation within the block; no variation across block boundaries is included.

#thm([Theorem 2.2.])[
  (Local estimate with variation in depth).  #emph[Fix the primitive distinct integers $b_0 = 0 \, b_1 \, b_2 \,
    b_3$ and the parameters $delta_0 \, C_0$. Let $cal(T)$ be a finite dyadic tree with root $J$ and largest depth
    $d$, and let $cal(I) subset.eq cal(T)$. Assign an admissible kernel to every $I in cal(I)$.
    For each $0 lt.eq j lt.eq 3$, let $z_(j \, s) : J arrow.r bb(C)$, $0 lt.eq s lt.eq d$, be measurable,
    and partition ${ 0 \, dots.h \, d }$ into $W_j gt.eq 1$ deterministic nonempty consecutive blocks. Suppose that
$ cal(V)_B \( z_j \) lt.eq W_j^(- 1 \/ 2) quad upright("almost everywhere on ") J $

 for each block in the $j$th partition. Extend every input by zero outside $J$. Then
#[#set math.equation(numbering: n => "(2.4)")
 $ sum_(I in cal(I)) \| I \| thin \|
   H_I \( z_(0 \, s \( I \)) \, z_(1 \, s \( I \)) \, z_(2 \, s \( I \)) \, z_(3 \, s \( I \)) \) \| lt.eq
   C_(b \, delta_0 \, C_0) \| J \| . $ <eq:local-estimate>]

 The constant is independent of the lattice, tree, depth range, subcollection, kernels,
   and the four partitions and their sizes.]
] <thm:local>

The schedules are prescribed at every depth, even depths with no summation intervals.
  This is exactly the hypothesis of [13] Theorem 3.2, except for the coefficients in the local forms.
  Sections 4–6 prove the theorem by extending that proof and its analytic inputs from [12].
  Before turning to those technical arguments, Section 3 proves the implication from Theorem 3 to the ergodic theorem.

=== 2.2 Integer reconstruction and quadratic cancellation <integer-reconstruction-and-quadratic-cancellation>

Two features of the coefficients recur in both the analytic proof and transference.
  Pairs of coordinates determine $\( x \, t \)$ over $bb(R)$, but need not determine it over $bb(Z)$.
  All four coordinates together do determine the integral step.
  Quadratic cancellation requires a separate identity, furnished by Vandermonde interpolation.

#thm([Lemma 2.3.])[
  (Coefficient identities).  #emph[There exist integers $e_0 \, e_1 \, e_2 \, e_3$ and nonzero integers $c_0 \,
    c_1 \, c_2 \, c_3$ such that
#[#set math.equation(numbering: n => "(2.5)")
 $ sum_(j = 0)^3 e_j = 0 \, wide sum_(j = 0)^3 e_j b_j = 1 \, $ <eq:bezout>]

 and
#[#set math.equation(numbering: n => "(2.6)")
 $ sum_(j = 0)^3 c_j b_j^a = 0 wide \( a = 0 \, 1 \, 2 \) . $ <eq:vandermonde>]

 The nullspace over $bb(R)$ of the two rows $\( 1 \)_j \, \( b_j \)_j$ is spanned by $\( c_j \)_j$ and
   $\( b_j c_j \)_j$. Consequently, for $y_j = x + b_j t$,
$ x = y_0 \, wide t = sum_j e_j y_j \, wide sum_j c_j y_j^2 = 0 . $

 For any distinct $i \, j$, the pair map $\( x \, t \) mapsto \( x + b_i t \, x + b_j t \)$ is injective on
   $bb(Z)^2$ and pushes normalized Haar measure on $\( bb(R) \/ L bb(Z) \)^2$ to normalized Haar measure,
   for every $L > 0$.]
] <lem:algebra>

#proof[
  Bezout’s identity gives integers $e_1 \, e_2 \, e_3$ with $sum_(j = 1)^3 e_j b_j = 1$; set $e_0 = -
    sum_(j = 1)^3 e_j$. Let $P \( z \) = product_(j = 0)^3 \( z - b_j \)$.
    Lagrange interpolation of $z^a$, $0 lt.eq a lt.eq 2$, followed by comparison of the coefficient of $z^3$,
    gives $sum_j b_j^a \/ P' \( b_j \) = 0$. Multiply by a common positive integer multiple of the denominators to
    obtain (2.6) with every $c_j eq.not 0$. The two displayed null vectors are independent because the $b_j$ are
    distinct, and the nullspace has dimension two. The identities for $y_j$ follow by expansion.
    Finally the pair matrix has determinant $b_j - b_i eq.not 0$,
    so it is injective on the lattice and surjective on the real torus.
    A surjective continuous homomorphism of compact groups pushes normalized Haar measure to normalized Haar measure. ◻
]

#prodef([Remark 2.4.])[
  Primitivity does not mean that some pair is unimodular. For example,
    the slopes $\( b_0 \, b_1 \, b_2 \, b_3 \) = \( 0 \, 6 \, 10 \, 15 \)$ are primitive,
    but no pair difference is $1$ in absolute value. This is why the integer inverse in (2.5),
    rather than division by a pair determinant, is used in the lattice and torus arguments below.
] <rem:nonunimodular>

=== 2.3 The fixed-input constant <the-fixed-input-constant>

The proof of Theorem 3 first establishes a fixed-input estimate.
  For $2 < q < 3$, let $M_q f = \( M \( \| \| f^q \) \)^(1 \/ q)$,
  where $M$ is the uncentered Hardy–Littlewood maximal operator. Let $C_N \( q \)$ be the least constant for which

#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(I in cal(A)) \| \| I thin \| H_I \( f_0 \, f_1 \, f_2 \, f_3 \) \| lt.eq
   C_N \( q \) integral_(bb(R)) product_(j = 0)^3 M_q f_j \( x \) thin d x $ <eq:CN>]

for all finite collections $cal(A)$ of intervals in one translated dyadic lattice,
  whose lengths belong to at most $N$ consecutive scales, admissible kernels,
  and compactly supported scalar $L^q$ inputs. This is the definition in [12] Section 2, with our coefficients.
  Pair-coordinate estimates imply $C_N \( q \) lt.tilde_b N$,
  so this constant is finite before any absorption argument.
  The analytic proof will show $sup_N C_N \( q \) < oo$ for a suitable fixed $q > 2$,
  and then use that bound in the scheduled-input argument. This order avoids using Theorem 3 to prove its own
  analytic input.

== 3 From the local estimate to pointwise convergence <sec:transfer>

We now deduce Theorem 1 from Theorem 3. This section is independent of the internal notation of the analytic
  proof. It follows the transference scheme of [13] Sections 2–3, including its use of signed smooth profiles.
  We give all the details, both to handle arbitrary integer slopes and to separate the two roles of the
  hypotheses: the local estimate gives almost everywhere convergence of smooth averages on every invertible
  probability preserving system; mixing identifies their limit.

Throughout, $b_0 = 0 \, b_1 \, b_2 \, b_3$ are the fixed primitive slopes,
  $S$ is an invertible measure-preserving transformation, and $e_j$ are the integers in (2.5).
  All constants in this section may depend on the slopes.

=== 3.1 Smooth profiles and cancellation kernels <smooth-profiles-and-cancellation-kernels>

#prodef([Definition 3.1.])[
  (Averaging profile).  An averaging profile is a real $phi in C_c^oo \( bb(R) \)$ with
  #[#set math.equation(numbering: n => "(3.1)")
   $ integral_(bb(R)) phi = 1 \, wide integral_(bb(R)) t^j phi \( t \) thin d t =
     0 quad \( 1 lt.eq j lt.eq 3 \) \, $ <eq:tr-moments>]
  and, for some $G gt.eq 1$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ parallel phi^(\( n \)) parallel_oo lt.eq #scale(x: 120%, y: 120%)[\(] G \( n + 2 \)
     #scale(x: 120%, y: 120%)[\)]^(G \( n + 2 \)) wide \( n gt.eq 0 \) . $ <eq:tr-gevrey>]
  Write $phi_a \( t \) = a^(- 1) phi \( t \/ a \)$ for $a > 0$. Profiles are necessarily signed:
    a nonnegative smooth function of mass one cannot have zero second moment.
] <def:tr-profile>

The derivative class in (3.2) is closed under fixed translations, dilations, differentiation,
  and finite linear combinations. It contains a nonnegative bump $rho$ of mass one supported in $\[ - 1 \, 1 \]$.
  For completeness, normalize

$ rho_0 \( t \) =
  cases(delim: "{", exp #scale(x: 120%, y: 120%)[\(] - 1 \/ \( 1 - t^2 \) #scale(x: 120%, y: 120%)[\)] \, & \|
  t \| < 1 \,, 0 \, & \| t \| gt.eq 1 .) $

For $\| t \| < 1$, put $d = 1 - t^2$. On a complex disk of radius $c d$ about $t$,
  with sufficiently small absolute $c > 0$, the real part of $\( 1 - z^2 \)^(- 1)$ is at least $c' \/ d$.
  Cauchy’s estimate gives

$ \| rho_0^(\( n \)) \( t \) \| lt.eq n ! \( c d \)^(- n) e^(- c' \/ d) . $

For each $n$ this tends to zero at the endpoints, and its maximum over $0 < d lt.eq
  1$ is at most $C^(n + 1) n ! \( n + 1 \)^n$. Thus the zero extension is smooth and satisfies (3.2) after
  enlarging $G$. Lemma 14 will construct averaging profiles arbitrarily close to interval indicators.

Fix a profile $phi$, and put

#[#set math.equation(numbering: n => "(3.3)")
 $ psi = phi_2 - phi \, wide Delta_k \( t \) = phi_(2^(k + 1)) \( t \) - phi_(2^k) \( t \) =
   2^(- k) psi \( 2^(- k) t \) . $ <eq:tr-difference>]

#thm([Lemma 3.2.])[
  (Realizing a scale difference).  #emph[There exist a dyadic integer $D gt.eq 1$, a constant $C_0 gt.eq 1$,
    and a real function $cal(W) in C_c^oo \( bb(R)^2 \)$, depending only on $phi$ and the slopes,
    with the following property. For an interval $I$ of length $r = D 2^k$ and midpoint $m_I$, the kernel
$ w_I \( x \, t \) = cal(W) (frac(x - m_I, r) \, t / r) $

 is admissible for Theorem 3, with interior margin $delta_0 = 1 \/ 8$ and derivative constant $C_0$. Moreover,
#[#set math.equation(numbering: n => "(3.4)")
 $ 1 / r integral_(bb(R)) cal(W) \( z \, t \/ r \) thin d z =
   Delta_k \( t \) wide \( t in bb(R) \) . $ <eq:tr-kernel-integral>]

]
] <lem:tr-kernel>

#proof[
  The moments of $psi$ through order three vanish: its $j$th moment is $\( 2^j - 1 \) integral t^j phi \( t \)
    thin d t$. Choose $B gt.eq 1$ with $"supp" psi subset.eq \[ - B \, B \]$, and define
  $ g \( t \) = 1 / 6 integral_(- oo)^t \( t - v \)^3 psi \( v \) thin d v . $
  For $t > B$, expansion of the cubic and the four zero moments show that $g \( t \) = 0$;
    it also vanishes for $t < - B$. Hence $g in C_c^oo \( bb(R) \)$, $g^(\( 4 \)) = psi$,
    and $g$ satisfies (3.2) with a possibly larger constant. Indeed,
    its first four derivative bounds follow from integration over $\[ - B \, B \]$,
    and its subsequent derivatives are derivatives of $psi$.
  Take $u \( z \) = 8 rho \( 8 z \)$, with the bump constructed above.
    Choose a dyadic integer $D > 4 B max_j \| b_j \|$, and set
  $ F \( z \, sigma \) = u \( z \) D^(- 3) g \( D sigma \) \, wide L_j = partial_sigma - b_j partial_z \, wide
    cal(W) = product_(j = 0)^3 L_j F . $
  The constant-coefficient operators commute. On the support of $cal(W)$,
  $ \| z + b_j sigma \| lt.eq 1 / 8 + frac(\| b_j \| B, D) < 3 / 8 . $
  After rescaling, every $x + b_j t$ therefore lies in $I$, at distance greater than $r \/ 8$ from its endpoints.
    Put $G_j = product_(i eq.not j) L_i F$. The chain rule gives
  $ w_I \( v - b_j t \, t \) = r frac(d, d t) G_j (frac(v - b_j t - m_I, r) \, t / r) . $
  The function differentiated is compactly supported in $t$, so its integral is zero.
    This proves all four line cancellations. The product rule and (3.2) give the required derivative bounds,
    with fixed $D \, b_j$ absorbed into $C_0$.
  Finally, integration in $z$ kills every term of $product_j L_j F$ containing a $z$-derivative. Since $integral u = 1$,
  $ integral_(bb(R)) cal(W) \( z \, sigma \) thin d z = D g^(\( 4 \)) \( D sigma \) = D psi \( D sigma \) . $
  Division by $r = D 2^k$ yields (3.4). ◻
]

We use the block size and variation $cal(V)_B$ from Section 2.
  Block endpoints are always deterministic; the input values may depend on the spatial variable.

#thm([Lemma 3.3.])[
  (A real-line test).  #emph[Let $0 lt.eq k_(-) lt.eq k_(+)$, and partition ${ k_(-) \, dots.h \,
    k_(+) }$ into $w$ nonempty consecutive blocks. Suppose that bounded Borel functions $h_1 \, h_2 \,
    h_3$ and $h_(0 \, k)$ are supported in a common interval of length $L > 0$, that $\| h_j \| lt.eq
    1$ for $1 lt.eq j lt.eq 3$, and that $cal(V)_(B_0) \( h_0 \) lt.eq w^(- 1 \/ 2)$ on every block $B_0$. Then
#[#set math.equation(numbering: n => "(3.5)")
 $
   lr(|sum_(k = k_(-))^(k_(+)) integral_(bb(R)^2) h_(0 \, k) \( x \) product_(j = 1)^3 h_j \( x + b_j t \)
   Delta_k \( t \) thin d x thin d t|) lt.eq C_(phi \, b) \( L + D 2^(k_(+)) \) . $ <eq:tr-real>]

 The constant is independent of the scale range, partition, and inputs.]
] <lem:tr-real>

#proof[
  Put $r_k = D 2^k$ and $R = r_(k_(+))$. For $0 lt.eq a < R$, use the translated dyadic lattice
  $ cal(D)_a = { \[ a + m 2^q \, a + \( m + 1 \) 2^q \) : m \, q in bb(Z) } . $
  At scale $r_k$, use the kernels from Lemma 7. Only roots of length $R$ meeting the common support interval can
    contribute: the zeroth coordinate of a supported kernel belongs to its interval.
    These roots have total length at most $L + 2 R$.
  Restrict all inputs to each such root. This changes no local form,
    since all four coordinates on its kernel support belong to the summation interval.
    In the root tree, depth is $s = k_(+) - k$. Reversing the scale order preserves the block size and variation.
    Thus slot zero satisfies the schedule hypothesis of Theorem 3,
    and the three fixed slots satisfy it with one block each. Summing that theorem over the roots gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ lr(|sum_(k = k_(-))^(k_(+)) sum_(I in cal(D)_a\
\| I \| = r_k) r_k H_I \( h_(0 \, k) \, h_1 \, h_2 \, h_3 \)|) lt.eq
  C_(b \, 1 \/ 8 \, C_0) \( L + 2 R \) . $ <eq:tr-root-sum>]
  For $r = r_k$, the following sum is $r$-periodic in $a$. Since $r$ divides $R$, unfolding one period yields
  $ 1 / R integral_0^R sum_(I in cal(D)_a\
\| I \| = r) r^(- 1) w_I \( x \, t \) thin d a & = 1 / r integral_0^r sum_(m in bb(Z)) r^(- 1) cal(W)
  (frac(x - a - \( m + 1 \/ 2 \) r, r) \, t / r) thin d a\
 & = 1 / r integral_(bb(R)) cal(W) \( z \, t \/ r \) thin d z = Delta_k \( t \) . $
  As $r H_I$ is the integral against $r^(- 1) w_I$, averaging (3.6) in $a$ gives (3.5).
    All exchanges of integrals and sums involve finitely many scales, bounded supports,
    and uniformly finitely many relevant intervals. ◻
]

=== 3.2 Integer sequences and finite orbit segments <integer-sequences-and-finite-orbit-segments>

The next step is where primitivity is useful. We do not assume that any pair of slopes has difference one.

#thm([Lemma 3.4.])[
  (An integer-sequence test).  #emph[Under the scale and block hypotheses of Lemma 8, let $h_1 \, h_2 \,
    h_3$ and $h_(0 \, k)$ instead be sequences on $bb(Z)$, supported in a common integer interval of cardinality
    $L gt.eq 1$. Assume the same pointwise size and block variation bounds. Then
#[#set math.equation(numbering: n => "(3.7)")
 $
   lr(|sum_(k = k_(-))^(k_(+)) sum_(m \, n in bb(Z)) h_(0 \, k) \( m \) product_(j = 1)^3 h_j \( m + b_j n \)
   Delta_k \( n \)|) lt.eq C'_(phi \, b) \( L + D 2^(k_(+)) \) . $ <eq:tr-integer>]

]
] <lem:tr-integer>

#proof[
  Write $E_b = sum_j \| e_j \|$, and fix $0 < rho < 1 \/ 4$ so small that
  #[#set math.equation(numbering: n => "(3.8)")
   $ rho #scale(x: 120%, y: 120%)[\(] 2 + max_j \| b_j \| E_b #scale(x: 120%, y: 120%)[\)] < 1 . $ <eq:tr-radius>]
  Plant every sequence value on the half-open interval $\[ m - rho \, m + rho \)$,
    and set it equal to zero elsewhere. The resulting Borel functions have the same size and variation bounds,
    and their common real support lies in an interval of length at most $L - 1 + 2 rho lt.eq L$.
  Suppose a configuration lies in four planted intervals, with integer centers $p_j$, and write $delta_j = x +
    b_j t - p_j$, so $\| delta_j \| < rho$ away from null boundaries. Set
  $ m = p_0 \, wide n = sum_j e_j p_j \, wide xi = x - m \, wide eta = t - n . $
  By (2.5), $eta = sum_j e_j delta_j$. Consequently
  $ \| p_j - \( m + b_j n \) \| lt.eq \| delta_j \| + \| xi \| + \| b_j eta \| < rho \( 2 + \| b_j \| E_b \) < 1 . $
  The expression inside the absolute value is an integer, so $p_j = m + b_j n$ for all four slots.
    Conversely, a configuration lies in the intervals with these centers precisely when
  $ \( xi \, eta \) in P_rho := { \( xi \, eta \) in bb(R)^2 : \| xi +
    b_j eta \| < rho med \( 0 lt.eq j lt.eq 3 \) } \, $
  up to boundaries. This polygon has positive finite area $A_rho$:
    it contains a neighborhood of zero and is bounded because two distinct coordinate forms are linearly
    independent. Distinct integer pairs $\( m \, n \)$ give disjoint regions up to boundaries,
    by uniqueness of the centers and (2.5). On $P_rho$, $\| eta \| lt.eq rho E_b$.
  It follows that the real-line integral at scale $k$ is exactly
  $ I_k = sum_(m \, n in bb(Z)) h_(0 \, k) \( m \) product_(j = 1)^3 h_j \( m + b_j n \) integral_(P_rho)
    Delta_k \( n + eta \) thin d xi thin d eta . $
  Let $D_k$ be the discrete sum at scale $k$ in (3.7). The derivative bound $parallel Delta'_k parallel_oo =
    2^(- 2 k) parallel psi' parallel_oo$ gives
  $ \| Delta_k \( n + eta \) - Delta_k \( n \) \| lt.eq rho E_b parallel psi' parallel_oo 2^(- 2 k) . $
  If this difference is nonzero, then $\| n \| lt.eq B 2^k + rho E_b$.
    Since $k gt.eq 0$, there are $O_(phi \, b) \( 2^k \)$ such integers $n$,
    and at most $L$ contributing integers $m$. Every coefficient product has absolute value at most one. Hence
  $ \| I_k - A_rho D_k \| lt.eq A_rho C_(phi \, b) L 2^(- k) . $
  Sum over $k$, use $sum_(k gt.eq 0) 2^(- k) = 2$, and apply Lemma 8 to the planted inputs.
    Division by $A_rho > 0$ proves (3.7). ◻
]

For measurable functions $\| f_j \| lt.eq 1$ on the probability space, put

#[#set math.equation(numbering: n => "(3.9)")
 $ F_n \( x \) = product_(j = 1)^3 f_j \( S^(b_j n) x \) \, wide V_k^phi \( x \) =
   sum_(n in bb(Z)) phi_(2^k) \( n \) F_n \( x \) quad \( k gt.eq 0 \) . $ <eq:tr-orbit-averages>]

All sums are finite. If $"supp" phi subset.eq \[ - B_phi \, B_phi \]$, with $B_phi gt.eq 1$, then

#[#set math.equation(numbering: n => "(3.10)")
 $ \| V_k^phi \( x \) \| lt.eq \( 2 B_phi + 1 \) parallel phi parallel_oo . $ <eq:tr-uniform>]

#thm([Proposition 3.5.])[
  (Finite orbit oscillation).  #emph[For every deterministic list $0 lt.eq k_1 < dots.h.c < k_(w + 1)$,
#[#set math.equation(numbering: n => "(3.11)")
 $ sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| V_ell^phi - V_(k_i)^phi \| thin d mu lt.eq
   C''_(phi \, b) sqrt(w) . $ <eq:tr-oscillation>]

 This holds on every invertible probability preserving system, with a constant independent of that system,
   the functions, and the endpoints.]
] <prop:tr-oscillation>

#proof[
  First take sequences $h_j$, bounded by one and supported in an integer interval $cal(K)$ of cardinality $L$, and set
  $ sans(V)_k \( m \) = sum_n phi_(2^k) \( n \) product_(j = 1)^3 h_j \( m + b_j n \) . $
  For $m$ in a subset $cal(E) subset.eq cal(K)$, let $ell_i \( m \)$ be the smallest maximizing index of $\|
    sans(V)_ell \( m \) - sans(V)_(k_i) \( m \) \|$ in the finite range $k_i lt.eq ell lt.eq k_(i + 1)$.
    Write $d_i \( m \) = sans(V)_(ell_i \( m \)) \( m \) - sans(V)_(k_i) \( m \)$, and take $alpha_i \( m \) =
    overline(d_i \( m \)) \/ \| d_i \( m \) \|$ when $d_i \( m \) eq.not 0$, and zero otherwise.
    In the block $k_i lt.eq k < k_(i + 1)$, set
  $ h_(0 \, k) \( m \) =
    cases(delim: "{", alpha_i \( m \) \/ \( 4 sqrt(w) \) \, & m in cal(E) \, k < ell_i \( m \) \,, 0 \, &
    upright("otherwise") .) $
  On each block this sequence has size at most $\( 4 sqrt(w) \)^(- 1)$ and at most one jump of that size.
    Its block size and variation is therefore at most $w^(- 1 \/ 2)$.
    The block endpoints remain deterministic, although the prefix and phase depend on $m$.
  The identity $Delta_k = phi_(2^(k + 1)) - phi_(2^k)$ telescopes, so Lemma 9 gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ sum_(m in cal(E)) sum_(i = 1)^w max_(k_i lt.eq ell lt.eq k_(i + 1)) \| sans(V)_ell \( m \) -
     sans(V)_(k_i) \( m \) \| lt.eq 4 C'_(phi \, b) sqrt(w) thin \( L + D 2^(k_(w + 1)) \) .
     $ <eq:tr-sequence-oscillation>]
  Indeed, the sum tested in that lemma is exactly $\( 4 sqrt(w) \)^(- 1)$ times the nonnegative left side,
    since $alpha_i \( m \) d_i \( m \) = \| d_i \( m \) \|$.
  We now use finite orbit segments, the elementary form of Calderón’s transference principle [5].
    Fix the endpoints, and choose an integer
  $ Q gt.eq B_phi max_j \| b_j \| thin 2^(k_(w + 1)) . $
  For each $M gt.eq 1$ and $x in X$, use the sequences
  $ h_(j \, x) \( r \) =
    cases(delim: "{", f_j \( S^r x \) \, & 1 - Q lt.eq r lt.eq M + Q \,, 0 \, & upright("otherwise") .) $
  Their common support has cardinality $M + 2 Q$. For $1 lt.eq m lt.eq M$ and all scales in the endpoint list,
    no term of the average is cut off, so $sans(V)_k \( m \) = V_k^phi \( S^m x \)$.
    Apply (3.12) with $cal(E) = { 1 \, dots.h \, M }$, integrate over $x$, and use invariance under $S^m$. This gives
  $ M sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| V_ell^phi - V_(k_i)^phi \| thin d mu lt.eq
    4 C'_(phi \, b) sqrt(w) thin \( M + 2 Q + D 2^(k_(w + 1)) \) . $
  The maxima are measurable finite maxima. Divide by $M$ and let $M arrow.r oo$,
    keeping the endpoints and hence $Q$ fixed. This proves (3.11). ◻
]

#thm([Lemma 3.6.])[
  (Oscillation implies convergence).  #emph[Let $\( Z_k \)_(k gt.eq 0)$ be a uniformly bounded sequence of
    measurable complex functions on a probability space. Suppose that, for every deterministic $0 lt.eq
    k_1 < dots.h.c < k_(w + 1)$,
$ sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| Z_ell - Z_(k_i) \| thin d mu lt.eq C sqrt(w) . $

 Then $Z_k$ converges on a measurable conull set.]
] <lem:tr-cauchy>

#proof[
  We include the standard finite-block argument; compare the oscillation methods in [4,10]. The measurable function
  $ omega \( x \) = lim_(K arrow.r oo) sup_(p \, q gt.eq K) \| Z_p \( x \) - Z_q \( x \) \| $
  vanishes exactly where the sequence is Cauchy. If its positive set has positive measure,
    there are $delta > 0$ and $E = { omega > 2 delta }$ with $mu \( E \) = d > 0$. For every $K$,
  $ sup_(ell gt.eq K) \| Z_ell - Z_K \| gt.eq 1 / 2 omega > delta quad upright("on ") E . $
  By monotone convergence of the finite maxima, a deterministic $L > K$ satisfies $integral
    max_(K lt.eq ell lt.eq L) \| Z_ell - Z_K \| thin d mu gt.eq delta d \/ 2$.
    Starting with $k_1 = 0$, choose successive endpoints this way.
    The assumed estimate would give $w delta d \/ 2 lt.eq C sqrt(w)$ for every $w$, a contradiction.
    Thus $omega = 0$ almost everywhere, and completeness of $bb(C)$ proves the claim. ◻
]

Proposition 10, (3.10), and Lemma 11 already give almost everywhere convergence of $V_k^phi$.
  Mixing has not yet been used.

=== 3.3 Identifying the limit by mixing <identifying-the-limit-by-mixing>

We include the norm argument to make explicit that it accommodates arbitrary distinct nonzero slopes and both
  signs of time. The set-mixing assumption on $S$ implies, by uniform approximation by simple functions,
  that for bounded measurable $g \, h$,

#[#set math.equation(numbering: n => "(3.13)")
 $ integral_X g thin \( h compose S^m \) thin d mu arrow.r
   (integral_X g thin d mu) (integral_X h thin d mu) quad \( \| m \| arrow.r oo \) . $ <eq:tr-functional-mixing>]

#thm([Lemma 3.7.])[
  (The Hilbert space van der Corput criterion).  #emph[Let $\( u_n \)_(n gt.eq 1)$ be bounded vectors in a complex
    Hilbert space, with inner product linear in the first variable. If the limits
$ gamma_h = lim_(N arrow.r oo) 1 / N sum_(n = 1)^(N - h) chevron.l u_(n + h) \, u_n chevron.r $

 exist for each $h gt.eq 1$ and tend to zero as $h arrow.r oo$, then $N^(- 1) sum_(n = 1)^N u_n arrow.r 0$ in norm.]
] <lem:tr-vdc>

#proof[
  We record the finite estimate underlying the criterion; compare [9] Lemma D.1.
    Extend $u_n$ by zero outside ${ 1 \, dots.h \, N }$. The identity
  $ H sum_(n = 1)^N u_n = sum_(m = 1)^(N + H - 1) sum_(j = 0)^(H - 1) u_(m - j) $
  and Cauchy’s inequality give
  $ ∥1 / N sum_(n = 1)^N u_n∥^2 lt.eq frac(N + H - 1, N^2 H^2) #scale(x: 240%, y: 240%)[\(] & H sum_(n = 1)^N
    parallel u_n parallel^2\
 & + 2 sum_(h = 1)^(H - 1) \( H - h \) "Re" sum_(n = 1)^(N - h) chevron.l u_(n + h) \,
   u_n chevron.r #scale(x: 240%, y: 240%)[\)] . $
  If $parallel u_n parallel lt.eq M$, first let $N arrow.r oo$ with $H$ fixed, obtaining
  $ limsup_N ∥1 / N sum_(n = 1)^N u_n∥^2 lt.eq M^2 / H + 2 / H sum_(h = 1)^(H - 1) \| gamma_h \| . $
  The right side tends to zero with $H$, since the Cesàro means of $\( \| gamma_h \| \)$ tend to zero. ◻
]

#thm([Lemma 3.8.])[
  (Norm convergence at distinct slopes).  #emph[If $S$ is mixing, $a_1 \, dots.h \,
    a_r$ are distinct nonzero integers, and $g_1 \, dots.h \, g_r$ are bounded measurable functions, then
#[#set math.equation(numbering: n => "(3.14)")
 $ 1 / N sum_(n = 1)^N product_(j = 1)^r g_j compose S^(a_j n) arrow.r
   product_(j = 1)^r integral_X g_j thin d mu quad upright("in ") L^2 \( mu \) . $ <eq:tr-norm>]

 Consequently, for $F_n$ in (3.9) and $p = product_(j = 1)^3 integral_X f_j thin d mu$,
   every $chi in C_c^1 \( bb(R) \)$ of integral one satisfies
#[#set math.equation(numbering: n => "(3.15)")
 $ sum_(n in bb(Z)) a^(- 1) chi \( n \/ a \) F_n arrow.r p quad upright("in ") L^2 \( mu \) \, wide a arrow.r
   oo . $ <eq:tr-weighted-norm>]

]
] <lem:tr-norm>

#proof[
  Write $U^m f = f compose S^m$. These operators are unitary on $L^2 \( mu \)$, with inner product $chevron.l f \,
    g chevron.r = integral f overline(g) thin d mu$. We induct on $r$, starting with the empty product $r = 0$.
    Suppose first that one of the $g_j$ has mean zero. Put
  $ u_n = product_(j = 1)^r U^(a_j n) g_j \, wide q_(j \, h) = \( U^(a_j h) g_j \) overline(g_j) . $
  By invariance,
  $ chevron.l u_(n + h) \, u_n chevron.r = integral_X q_(1 \, h) product_(j = 2)^r U^(\( a_j - a_1 \) n)
    q_(j \, h) thin d mu . $
  For fixed $h$, induction applies to the distinct nonzero slopes $a_j - a_1$, $2 lt.eq j lt.eq r$.
    The average of this correlation therefore tends to
  $ gamma_h = product_(j = 1)^r integral_X q_(j \, h) thin d mu . $
  Here removing the final $h$ terms and dividing by $N$ instead of $N - h$ does not change the limit.
    By (3.13), the $j$th factor tends to $\| integral g_j thin d mu \|^2$ as $h arrow.r oo$.
    At least one limit is zero, so $gamma_h arrow.r 0$. Lemma 12 proves (3.14) in the centered case.
    For general inputs, write each $g_j$ as its mean plus a mean-zero function and expand.
    The constant term is the asserted limit, and every other term contains a centered factor,
    so the centered case applies. This completes the induction.
    Only fixed $h$ is used in the induction; no estimate uniform in $h$ is needed.
  Apply (3.14) to $b_j$ and $- b_j$. The partial sums
  $ R_N^plus.minus = sum_(n = 1)^N \( F_(plus.minus n) - p \) quad upright("satisfy") quad
    parallel R_N^plus.minus parallel_2 = o \( N \) . $
  Choose $B gt.eq 1$ containing the support of $chi$, and put $M_a = floor.l B a floor.r + 1$, $w_n^plus.minus =
    a^(- 1) chi \( plus.minus n \/ a \)$. Then $w_(M_a)^plus.minus = 0$, and summation by parts gives
  $ sum_(n = 1)^(M_a) w_n^plus.minus \( F_(plus.minus n) - p \) =
    sum_(n = 1)^(M_a - 1) \( w_n^plus.minus - w_(n + 1)^plus.minus \) R_n^plus.minus . $
  Its norm is at most $a^(- 2) parallel chi' parallel_oo sum_(n < M_a) parallel R_n^plus.minus parallel_2 =
    o \( 1 \)$. To see the last assertion, split at a fixed $N_0$,
    and use $parallel R_n^plus.minus parallel_2 lt.eq epsilon.alt n$ beyond $N_0$;
    the tail is $O_B \( epsilon.alt \)$, and the finite initial part tends to zero.
    The $n = 0$ term is $O \( a^(- 1) \)$ in norm, while the Riemann sum $a^(- 1) sum_n
    chi \( n \/ a \)$ tends to one. Adding the two signs and the zero term proves (3.15). ◻
]

For each averaging profile, Lemma 13 gives $V_k^phi arrow.r p$ in $L^2$.
  Its almost everywhere limit is therefore $p$. More explicitly,
  if $E_phi$ is the measurable conull convergence set, Fatou’s lemma gives

$ integral_(E_phi) \| lim_k V_k^phi - p \|^2 thin d mu lt.eq liminf_k parallel V_k^phi - p parallel_2^2 = 0 . $

=== 3.4 Removing the smooth weights <removing-the-smooth-weights>

The moment restrictions need not obstruct approximation in $L^1$.
  The correction below, from [13] Lemma 2.8, moves a small amount of signed mass to a large scale.
  Uniform control of the supports or derivative constants is neither asserted nor needed.

#thm([Lemma 3.9.])[
  (Profiles approximate interval indicators).  #emph[For every $c in \[ 1 \, 2 \]$ and $epsilon.alt > 0$,
    there is an averaging profile $phi$ with
$ parallel phi - h_c parallel_(L^1 \( bb(R) \)) < epsilon.alt \, wide h_c = c^(- 1) upright(bold(1))_(\( 0 \, c \]) . $

]
] <lem:tr-density>

#proof[
  Let $rho$ be the mass-one bump constructed above, and set $rho_delta \( t \) =
    delta^(- 1) rho \( t \/ delta \)$. For sufficiently small $delta > 0$, the real smooth function $v =
    h_c * rho_delta$ has mass one and $parallel v - h_c parallel_1 < epsilon.alt \/ 2$. Indeed,
  $ parallel h_c \( thin dot.op - s \) - h_c parallel_1 = 2 min \( \| s \| \, c \) \/ c \, $
  and averaging this identity against $rho_delta$ proves the claim.
    Also $parallel v^(\( n \)) parallel_oo lt.eq delta^(- n - 1) parallel rho^(\( n \)) parallel_oo$,
    so $v$ satisfies (3.2). Fix $v$, and write $m_j = integral t^j v \( t \) thin d t$ for $1 lt.eq j lt.eq 3$.
  Choose four distinct real numbers $z_0 \, z_1 \, z_2 \, z_3$, and define
  $ P_j \( z \) = integral_(bb(R)) \( z + u \)^j rho \( u \) thin d u \, wide rho_(i \, A) \( t \) =
    A^(- 1) rho \( t \/ A - z_i \) quad \( A gt.eq 1 \) . $
  The $j$th moment of $rho_(i \, A)$ is $A^j P_j \( z_i \)$.
    Since $P_j$ is monic of degree $j$, the fixed matrix $sans(M) = \( P_j \( z_i \) \)_(j \, i = 0)^3$ is an
    invertible triangular change of the Vandermonde matrix $\( z_i^j \)_(j \, i = 0)^3$. Solve
  $ sans(M) beta = \( 0 \, - m_1 \/ A \, - m_2 \/ A^2 \, - m_3 \/ A^3 \)^(sans(T)) . $
  The inverse matrix is fixed, hence $sum_i \| beta_i \| = O_v \( A^(- 1) \)$. Thus
  $ phi = v + sum_(i = 0)^3 beta_i rho_(i \, A) $
  has mass one, its first three moments vanish exactly, and its added $L^1$ error is $O_v \( A^(- 1) \)$.
    Take $A$ large enough that this error is less than $epsilon.alt \/ 2$.
    Finite addition and fixed dilations preserve (3.2), so this real compactly supported function is the required
    profile. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Continue with $\| f_j \| lt.eq 1$, and write
  $ A_N \( x \) = 1 / N sum_(n = 1)^N F_n \( x \) \, wide p = product_(j = 1)^3 integral_X f_j thin d mu . $
  For every rational $c in \[ 1 \, 2 \]$ and integer $h gt.eq 1$,
    choose an averaging profile $phi_(c \, h)$ with $parallel h_c - phi_(c \, h) parallel_1 < 2^(- h)$.
    The preceding results give a measurable conull set on which $V_k^(phi_(c \, h)) arrow.r p$.
    Intersect these sets over the countable family, obtaining a conull set $E$.
  For $N_k = floor.l c 2^k floor.r$, the choice of endpoints in $h_c$ gives the exact identity
  $ 2^(- k) sum_(n in bb(Z)) h_c \( n \/ 2^k \) F_n \( x \) = frac(N_k, c 2^k) A_(N_k) \( x \) . $
  Since $\| F_n \| lt.eq 1$, for every profile $phi$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| A_(N_k) \( x \) - V_k^phi \( x \) \| lt.eq frac(1, c 2^k) +
     2^(- k) sum_(n in bb(Z)) \| h_c \( n \/ 2^k \) - phi \( n \/ 2^k \) \| . $ <eq:tr-approximation>]
  The second term tends to $parallel h_c - phi parallel_1$:
    its summand is a bounded compactly supported Riemann-integrable function,
    with possible discontinuities only at $0 \, c$. Apply (3.16) with $phi_(c \, h)$, then let $h arrow.r oo$.
    For every $x in E$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ A_(floor.l c 2^k floor.r) \( x \) arrow.r p quad upright("for every rational ") c in \[ 1 \, 2 \] .
     $ <eq:tr-rational-scales>]
  Fix an integer $s gt.eq 1$, and use the finite rational grid $c_i = 1 + i \/ s$, $0 lt.eq i lt.eq s$.
    If $2^k lt.eq N < 2^(k + 1)$, choose the largest $i$ such that $n = floor.l c_i 2^k floor.r lt.eq N$.
    Then $0 lt.eq N - n lt.eq 2^k \/ s + 1$. Averages of terms bounded by one satisfy, whenever $1 lt.eq n lt.eq N$,
  $ \| A_N - A_n \| lt.eq frac(2 \( N - n \), N) . $
  By (3.17), the maximum error over the finite grid tends to zero for $x in E$. Consequently
  $ limsup_(N arrow.r oo) \| A_N \( x \) - p \| lt.eq 2 \/ s wide \( x in E \) . $
  Let $s arrow.r oo$ to obtain convergence along all positive integers.
  Finally undo the normalization of the functions and use $S = T^g$, $b_j = lambda_j \/ g$,
    as in the initial reduction. If the functions are specified only as essentially bounded classes,
    choose bounded representatives and remove the union of all integer translates of their exceptional sets.
    This is still a measurable null set. Every other exceptional set used above is measurable and every
    intersection is countable. Thus the proof needs no standardness or completeness assumption on the probability
    space. ◻
]

== 4 Quadratic structure and localization for the new slopes <sec:analytic>

We begin the proof of Theorem 3 by establishing the quadratic detection and localization estimates for the
  configuration $y_j = x + b_j t$. These estimates supply the input to the short-block and frequency arguments of
  Section 5. The relevant constructions are those of [12] Sections 3–6 and [13] Sections 4–6.
  We retain their interval projections and stopping constructions,
  and prove below the coefficient-dependent identities and estimates on which those constructions rely.

Throughout this section, the slopes are fixed. Constants may depend on them and on the admissibility parameters.
  A rational number has height at most $H$ if its numerator and positive denominator in reduced form are at most
  $H$ in absolute value; matrix heights are entrywise. We use the quantitative convention of [12] Section 3.1:
  a quasipolynomial bound in parameters $H_1 \, dots.h \, H_m gt.eq 2$ is a bound of the form

$ exp #h(-0.16667em) (C_(q \, b) (1 + sum_(a = 1)^m log H_a)^C) . $

The degree $C$ is chosen independently of $q$, the number of depths, and the input schedules.
  A fixed number of such constructions may be composed. Constructions repeated a variable number of times retain
  the explicit count estimates in H and V.

=== 4.1 Local bounds and the chart class <local-bounds-and-the-chart-class>

For a scalar or Hilbert-valued function, write $lr(bar.v.double  bar.v.double)
  z_(p \, I) = \( \| I \|^(- 1) integral_I lr(bar.v.double z \( y \) bar.v.double)^p thin d y \)^(1 \/ p)$,
  with the essential-supremum convention for $p = oo$. Norms without an interval subscript use ordinary Lebesgue
  measure. The elementary bound used throughout the argument is unchanged except for its constant.

#thm([Lemma 4.1.])[
  (Local absolute bound).  #emph[If $1 lt.eq p_j lt.eq oo$ and $sum_j p_j^(- 1) lt.eq 2$, then
$ \| I \|^(- 2) integral_(bb(R)^2) \| w_I \( x \, t \) \| product_(j = 0)^3
  lr(bar.v.double z_j \( x + b_j t \) bar.v.double) thin d x thin d t lt.eq
  C_b product_(j = 0)^3 lr(bar.v.double z_j bar.v.double)_(p_j \, I) . $

 The assertion also holds for Hilbert-valued inputs, using their norms in the integrand.]
] <lem:local-absolute>

#proof[
  For two distinct roles $i \, j$, the map $\( x \, t \) mapsto \( y_i \, y_j \)$ has determinant $b_j -
    b_i eq.not 0$. This proves the endpoint with $p_i = p_j = 1$ and the other exponents infinite.
    The support and kernel bounds give the all-infinite endpoint,
    and normalized norm monotonicity gives the endpoints with only one exponent equal to one.
    Log-convexity of the positive integral fills the stated polytope, as in [12] Lemma 2.1. ◻
]

On the support of a local kernel, all four coordinates lie in an interval of length $r = \| I \|$. Consequently

#[#set math.equation(numbering: n => "(4.1)")
 $ \| t \| lt.eq frac(r, max_j b_j - min_j b_j) lt.eq r / 3 . $ <eq:analytic-step-support>]

In any pair of coordinate variables, the rescaled kernel thus has support in a fixed box and the same type of
  derivative bounds. Its integral in either coordinate with the other fixed is zero,
  by the corresponding one-coordinate marginal hypothesis. These facts also give $C_N \( q \) lt.tilde_b
  N$ and preserve the normalization-removal argument of [12] Lemma 2.4.

We recall the concrete class in which the quadratic structure is detected. Write $e \( u \) = exp \( 2 pi i u \)$.
  A #emph[quadratic chart atom] is a function

#[#set math.equation(numbering: n => "(4.2)")
 $ phi.alt \( y \) = e \( lambda y^2 + beta y \) sum_(n in bb(Z)^d) chi \( theta y - n \) e
   #scale(x: 120%, y: 120%)[\(] \( theta y \)^T C \( theta y - n \) #scale(x: 120%, y: 120%)[\)] \,
   $ <eq:analytic-chart>]

where $theta in bb(R)^d$, $lambda \, beta in bb(R)$, $C in bb(Q)^(d times d)$,
  and $chi$ is smooth and compactly supported. An overall constant of modulus one is allowed.
  We use exactly the complexity convention of [12] Definition 4.1:
  for complexity $H gt.eq e^2$, $d lt.eq log H$, the height of $C$ is at most $H$,
  $"supp" chi subset \[ - H \, H \]^d$, and

$ lr(bar.v.double partial^alpha chi bar.v.double)_oo lt.eq
  H^(c_(upright("ch")) \( \| alpha \| + 1 \)) \( \| alpha \| + 1 \)^(c_(upright("ch")) \( \| alpha \| + 1 \)) $

with a fixed chart constant $c_(upright("ch"))$. The real oscillation parameters $lambda \, beta \,
  theta$ are unrestricted. A bounded atom has supremum norm at most one;
  any normalization factor is put in its external scalar coefficient.

The elementary operations, Weyl alternative, and chart expansion of [12] Lemmas 4.2–4.4 concern this class itself.
  Their proofs therefore apply without a coefficient change.
  We will need the precise splitting supplied by the Weyl alternative.
  In its multivariable version replace $theta y$ by $V z$, and the ordinary quadratic phase by $z^T Lambda z$,
  where $Lambda$ is real symmetric and $z$ has at most three coordinates. Put

$ C_(upright("sy")) = 1 / 2 \( C + C^T \) \, wide C_(upright("sk")) = 1 / 2 \( C - C^T \) \, wide "sym" M = 1 /
  2 \( M + M^T \) . $

Let $Q \( z \)$ be this multivariable chart. Suppose $0 < delta < 1 \/ 2$ and a Lipschitz function $theta.alt$,
  supported in a fixed box with supremum and Lipschitz norms at most $H$, satisfies

$ sup_xi lr(|integral theta.alt \( z \) Q \( z \) e \( - xi^T z \) thin d z|) gt.eq delta . $

The Weyl alternative then supplies a rational subspace $U$, the orthogonal projection $P_f$ onto $U$, $P_s = 1 -
  P_f$, and the bounds

#[#set math.equation(numbering: n => "(4.3)")
 $ \( C - C^T \) \|_(U times U) = 0 \, wide V_f = P_f V \, quad V_s = P_s V \, wide
   lr(bar.v.double V_s bar.v.double) lt.eq H' \,\
Lambda_(*) = Lambda + 1 / 2 V^T C_(upright("sy")) V + "sym" \( V_f^T C_(upright("sk")) V_s \) \, wide
  lr(bar.v.double Lambda_(*) bar.v.double) lt.eq H' . $ <eq:analytic-splitting>]

The projection heights are at most $H'$, and $H'$ is quasipolynomial in $H \, delta^(- 1)$.
  The subsequent chart expansion has the absolute coefficient and pooled Fourier-tail bounds of [12] Lemma 4.4.
  These are the bounds used below, including when expansions must be summed over depths.

=== 4.2 Separation along the configuration and local detection <separation-along-the-configuration-and-local-detection>

The first coefficient-dependent step moves two structured inputs into the other two coordinates and the step
  variable. This is the form of separation needed for both detection and the later predictor estimates.

#thm([Lemma 4.2.])[
  (Progression separation).  #emph[Let $i \, k \, a \, l$ be the four distinct roles and let $phi.alt_i \,
    phi.alt_k$ be bounded chart atoms of complexity at most $H$.
    On $y_j = x + b_j t$, their product has an absolutely convergent expansion
$ phi.alt_i \( y_i \) phi.alt_k \( y_k \) = sum_nu a_nu psi_(a \, nu) \( y_a \) psi_(l \, nu) \( y_l \) Q_nu \( t \) $

 with bounded chart atoms as factors and the same shell bounds as [12] Lemma 4.5, with constants depending on $b$.
   In particular, for a quasipolynomial $D = D_b \( H \)$, a dyadic Fourier shell of size $T gt.eq
   1$ has absolute coefficient sum at most $D T^(- 100)$, and its factors have complexity at most $\( D T \)^C$.]
] <lem:progression-separation>

#proof[
  First separate $phi.alt_i$, temporarily suppressing its linear phase. Choose the fixed rationals
  $ alpha_i = 1 \, quad alpha_k = 0 \, quad alpha_a = frac(b_i - b_l, b_l - b_a) \, quad alpha_l =
    frac(b_a - b_i, b_l - b_a) . $
  They satisfy $sum_j alpha_j = sum_j b_j alpha_j = 0$. Insert the smooth integer partitions of unity from H at
    $theta y_a \, theta y_l \, theta t$, and write the lifts as $d_j = theta y_j - m_j$ and $d' = theta t - m$.
    For $j = i \, l$, set
  $ k_j = d_j - d_a - \( b_j - b_a \) d' \, wide k_a = 0 . $
  These carries are integer vectors. The support restrictions bound them by the chart budget,
    with a fixed slope factor. Conversely, $k_i \, m_a \, m$ determine $m_i$ uniquely.
    Each remaining specified carry equality is imposed exactly by a smooth cutoff equal to one at the specified
    integer vector and zero at all other integer vectors.
  For $S_alpha = sum_j alpha_j b_j^2$, direct expansion gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_j alpha_j #scale(x: 120%, y: 120%)[\(] lambda y_j^2 + \( theta y_j \)^T C d_j
     #scale(x: 120%, y: 120%)[\)] =  & S_alpha #scale(x: 120%, y: 120%)[\(] lambda t^2 + \( theta t \)^T C d'
     #scale(x: 120%, y: 120%)[\)]\
 & + sum_j alpha_j \( theta y_j \)^T C k_j . $ <eq:analytic-separation-identity>]
  Indeed, substituting $d_j = d_a + \( b_j - b_a \) d' + k_j$ cancels the common-lift and $x$-terms.
    Here $S_alpha = \( b_i - b_a \) \( b_i - b_l \)$. Solving for the phase in role $i$ leaves chart matrices $-
    alpha_a C \, - alpha_l C \, S_alpha C$ in the three desired variables.
    For fixed carries, the last sum is linear in $x \, t$, and hence splits between $y_a \, y_l$;
    so does the suppressed linear phase.
  The coupled amplitude is smooth in $d_a \, d_l \, d'$. Its Fourier expansion on a larger fixed box separates
    those variables, exactly as in the proof of [12] Lemma 4.5.
    The new substitutions cost at most $C_b^n$ in derivatives of order $n$,
    and their rational heights grow by fixed factors. The possible integer choices increase by at most
    $C_b^(O \( d \))$. Since $d lt.eq log H$, these changes are within the quasipolynomial chart budget.
    H’s integration by parts, with derivative order exceeding the Fourier dimension by at least $110$,
    gives the stated absolute shell bound. Separate the second atom with $alpha_i =
    0$ and combine the factors by direct sums of horizontal coordinates. This completes the expansion. ◻
]

For one separated term, let

$ A_r = sup_(xi in bb(R)) lr(|integral_(bb(R)) Q \( r u \) zeta \( u \) e \( - xi u \) thin d u|) \, $

where $zeta$ is smooth, nonnegative, equal to one on $\[ - 1 \/ 3 \, 1 \/ 3 \]$,
  and has $lr(bar.v.double zeta bar.v.double)_1 lt.eq 1$, as in [13] Section 5.4.
  The two-input form in the remaining roles has norm at most $C_b A_r$ on normalized $L^2 \( I \)$ inputs.
  To see this, use

$ t = frac(y_l - y_a, b_l - b_a) . $

Fourier-expand the smooth normalized kernel in those two coordinates.
  Each term is a modulated convolution with a fixed dilation of $Q \( t \) zeta \( t \/ r \)$,
  so Plancherel gives the claimed bound. If $A_r gt.eq delta$,
  the Weyl alternative and chart expansion further give the finite smooth separation in [12] Lemma 4.6:
  for every $0 < epsilon < 1 \/ 2$, the two-coordinate kernel has a separated approximation with uniform error at
  most $epsilon$, whose number of terms, atom complexities,
  and absolute coefficient sum are quasipolynomial in $H \, delta^(- 1) \, epsilon^(- 1)$.
  The retained phases are $lambda_(*) t^2 + gamma t$, with $\| lambda_(*) \| r^2$ bounded by the stated budget,
  and the linear phase splits as

$ e \( gamma t \) = e (- frac(gamma y_a, b_l - b_a)) e (frac(gamma y_l, b_l - b_a)) . $

Thus the fixed rational-height description of the effective quadratic and linear frequencies in that lemma is preserved.

#thm([Lemma 4.3.])[
  (Local detection).  #emph[Fix $q > 2$ and $C_1 gt.eq 1$. Suppose that the four inputs $R \, h \, u \, v$,
    in any slot order, satisfy
$ lr(bar.v.double  bar.v.double) R_(2 \, I) lt.eq C_1 \, wide lr(bar.v.double  bar.v.double) h_(q \, I) lt.eq 1 \,
  wide lr(bar.v.double  bar.v.double) u_(2 \, I) \, lr(bar.v.double  bar.v.double) v_(2 \, I) lt.eq 1 \,
  wide \| H_I \( R \, h \, u \, v \) \| > delta \, $

 where $0 < delta < 1 \/ 2$. There is a bounded chart atom $phi.alt$ of complexity at most $D$ such that
$ lr(|frac(1, \| I \|) integral_I R \( y \) overline(phi.alt \( y \)) thin d y|) gt.eq D^(- 1) \, wide D lt.eq
  exp #h(-0.16667em) (C_(q \, b) \( 1 + log C_1 + log \( 1 \/ delta \) \)^C) . $

 The degree $C$ is independent of $q$.]
] <lem:local-detection>

#proof[
  We verify the progression estimate in [12] Lemma 4.11 and then apply its detection proof.
    Normalize $I = \[ 0 \, 1 \)$. Extend the kernel to the same fixed circle used there.
    By (4.1), its real support fits in the periodic $\( x \, t \)$-box,
    and all real $y_j$ on that support already belong to $I$.
    Hence zero-extended inputs on the circle give the correct original integral,
    even when some slopes are large or negative. The kernel’s absolute Fourier coefficient sum is uniformly bounded.
  The integer left inverse in Lemma 4 distributes a circle character with indices $\( p \, q' \)$ into slot
    characters with indices $p upright(bold(1))_(j = 0) + q' e_j$.
    To a character-weighted progression average apply H’s three Cauchy–Schwarz steps,
    taking Haar differences in the directions $\( - b_j \, 1 \)$.
    The last cube has three independent increments multiplied by nonzero differences $b_i - b_j$.
    Each such integer multiplication pushes circle Haar measure to itself.
    The last integral is therefore the eighth power of the same circle $U^3$ norm as in H.
    Character multiplication preserves that norm, the $L^2$ norm, and the supremum norm.
    This proves H’s local generalized von Neumann estimate; its accompanying two-$L^1$ bound follows from Lemma 15.
  The continuous inverse theorem and bounded-input decomposition in [12] Sections 4.5–4.6 concern functions on
    this circle and its chart atoms, and require no change. In the proof of [12] Lemma 4.12,
    clip the three opposing inputs at height $B$. The local absolute bound gives total error at most $C_b C_1
    B^(- \( q - 2 \) \/ q)$. Taking $B$ of order $\( C_b C_1 \/ delta \)^(q \/ \( q - 2 \))$,
    apply that bounded-input decomposition twice. The error estimates use the generalized von Neumann and
    two-$L^1$ bounds just proved. Two bounded atoms remain opposite $R$ and an input of normalized $L^2$ norm at
    most one. Lemma 16 and the preceding single-scale separation give a finite sum of products of one-coordinate
    moments, with controlled absolute coefficient sum. One moment of $R$ consequently has the asserted size.
    These are a fixed number of quasipolynomial constructions.
    The clipping exponent contributes only a $q$-dependent multiplier to a logarithm,
    so the final logarithmic degree is independent of $q$, as required. ◻
]

=== 4.3 The base reduction and inputs that vary with depth <the-base-reduction-and-inputs-that-vary-with-depth>

Detection is used in H and V to construct finite approximation spaces on interval trees.
  We recall their meaning before verifying the scale estimates.
  A column with label $v$, born on an interval $J_v$, is an augmented function

$ Phi_v \( y \) = \( phi.alt_v \( y \) \, sqrt(epsilon.alt_v) thin upright(bold(u))_v \) \, wide y in J_v \, $

where $phi.alt_v$ is a scalar chart atom, $epsilon.alt_v > 0$,
  and the $upright(bold(u))_v$ are distinct orthonormal private coordinates.
  Only the first, physical coordinate enters $H_I$. A local projection on $I$ is the orthogonal projection onto
  constant-coefficient combinations of the available columns restricted to $I$.
  Lists are inherited on descendants. Accordingly the direct-sum projections on successively finer interval
  partitions have nested ranges. The private-coordinate, compression,
  and height-bin estimates of [12] Section 3 depend only on these definitions and the column budgets,
  and apply unchanged.

There are two coefficient-dependent scale estimates in the base construction.
  For two fixed chart atoms, the separation above reduces the other two inputs to a kernel of the form
  $w_I \( x \, t \) Q \( t \)$, with fixed bounded one-coordinate multipliers.
  The proof of [12] Lemma 5.1 and Corollary 5.2 expands $Q$, groups nearby linear frequencies,
  and uses the zero marginals of $w_I$. In coordinates $\( y_a \, y_l \)$,
  its double primitive has compact support in an interior rectangle.
  Fourier expansion followed by one derivative in each coordinate expresses it as a sum of tensor products of
  mean-zero smooth bumps. In role $p in { a \, l }$, the resulting scalar rows have fixed bounded carrier functions

$ m_(nu \, p) \( y \) = e \( nu y \) psi_p \( y \) \, wide nu = plus.minus frac(gamma, b_l - b_a) \, $

where $psi_p$ is the fixed separated multiplier in that role.
  These are the only coefficient replacements in the row estimate.
  They alter frequency separations and rational heights by fixed factors.
  H’s height-bin argument, ordinary Bessel estimate, and compression step therefore give its absolute scale sum
  and finite predictor list with the same quantitative orders,
  including the pooled-tail bound needed for summation over all depths.
  The finer partition comparison in [12] Lemma 5.3 uses the resulting one-coordinate predictor moments,
  so its projection-increment proof applies with the same replacement.

For the second estimate, fix three bounded chart columns and take the transpose in role $l$ at $y + h$.
  Its other coordinates are

$ y + h + \( b_j - b_l \) t wide \( j eq.not l \) . $

After squaring the normalized $L^2$ norm, the six atoms form a multivariable chart in $\( h \, t \, t' \)$.
  At a fixed path point $y$, all parameters before multiplication by $r$ or $r^2$ remain fixed as the depth
  changes. H’s Weyl alternative, chart expansion, and height-bin argument therefore apply.
  Away from the bounded number of intermediate scales, the bounded effective quadratic parameters are tiny and
  each retained $t$-frequency is tiny or large. Smoothness handles the large frequencies.
  Removing the tiny oscillations leaves exactly

$ integral_(bb(R)) w_I \( y + h - b_l t \, t \) thin d t = 0 . $

This proves the active-scale count and the small-norm scale sum in [12] Lemma 5.7, with constants depending on $b$.

For scheduled inputs we use [13] Section 4. Its row estimates concern Hilbert-space operators on refining interval
  partitions, evaluated on inputs at prescribed nondecreasing read depths.
  Their hypotheses are support on the input partition, representation of the adjoint ranges on the observation
  partition by the inherited columns, the stated order of successive partitions,
  and an ordinary Bessel bound before evaluation on the varying inputs. None involves the maps $y_j$.
  Restriction to a new spatial root preserves the pointwise block bound in Theorem 3.
  The original $W_j$ and original depth schedules are retained;
  subsequences may have empty intersections with some blocks, as allowed in V’s row argument.
  Its nearest-endpoint extension is retained as well.

The smooth rows in [13] Lemma 4.6 require the ordinary Bessel bound just verified, with the fixed carriers above.
  Thus the scheduled scale-sum and predictor results [13] Lemma 5.3 and Corollary 5.4,
  and its delayed replacement Lemma 5.5, hold with the new coefficients.
  The remaining steps of its Section 5 use the same local detection, fixed-cell fits, projection energies,
  and staggered pair comparisons. A finer projection in a comparison is still applied to the input at the
  prescribed read depth, and its row estimate has no factor depending on $W_j$.

We now describe the output of the base construction. For the fixed-input argument,
  embed the scalar input as $F_(j \, s) = \( f_j \, 0 \)$, independent of $s$,
  on a subtree satisfying $lr(bar.v.double f_j bar.v.double)_(q \, I) lt.eq 1$ on every cell,
  as in [12] Proposition 2.3. For the scheduled argument, put $F_(j \, s) = \( z_(j \, s) \, 0 \)$ with the inputs
  of Theorem 3. The adaptive fits and two-earliest-increments expansion of [12] Lemmas 5.4–5.5,
  or [13] Sections 5.1–5.2, express the original form, at any finite accuracy cutoff,
  in tuples with two differences of fitted projections and two original-input residuals,
  together with a remainder whose absolute length-weighted sum tends to zero on the fixed finite tree.
  Each tuple has an earlier and a later accuracy index, and a choice of the four roles.
  Their exact staggered ordering is retained from those results.
  High-position truncation, using the predictor estimates above, is [12] Proposition 5.6 or [13] Sections 5.5–5.6.
  It assigns each original summation cell to a segment root $R$ with inherited projection families;
  write $cal(I)_R$ for the cells assigned to $R$. Auxiliary projection cells are not additional summands.

Fix one tuple and let $k$ be its later accuracy logarithm.
  The two positions called low in this construction are denoted $i \, j$, and the other two by $a \, l$.
  On a cell of depth $s$, the resulting arguments satisfy

#[#set math.equation(numbering: n => "(4.5)")
 $ Y_(p \, I) = B_(p \, I) + U_(p \, I) \, wide U_(i \, I) = U_(j \, I) = 0 \,\
B_(p \, I) = sum_(h = 1)^(m_p) epsilon_(p \, h) Q_s^(p \, h) F_(p \, s) \, wide m_p lt.eq 2 \, quad
  epsilon_(p \, h) in { - 1 \, 1 } \,\
U_(p \, I) = \( P_(p \, s + K_0)^(upright("new")) - P_(p \, s)^(upright("new")) \) F_(p \, s)
  quad \( p = a \, l \) . $ <eq:analytic-basic-arguments>]

All expressions are restricted to $I$; a projection indexed by a finer depth is the direct sum on that finer
  partition. The $Q^(p \, h)$ and $P_p^(upright("new"))$ are the inherited basic families just constructed,
  and $K_0$ is their positive integer delay. Their column sizes, inverse private weights, scalar complexities,
  coefficient sums, and path counts have a joint budget $e^k lt.eq D_(upright("base")) lt.eq
  exp \( C_(q \, b) k^C \)$. On every segment they give

#[#set math.equation(numbering: n => "(4.6)")
 $ lr(bar.v.double B_(p \, I) bar.v.double)_(2 \, I) \, med lr(bar.v.double U_(p \, I) bar.v.double)_(2 \, I) \,
   med lr(bar.v.double Y_(p \, I) bar.v.double)_(2 \, I) lt.eq C_(q \, b) \, wide Lambda_k lt.eq C_(q \, b) k^C \,\
sum_(I in cal(I)_R) \| I \| lr(bar.v.double U_(p \, I) bar.v.double)_(2 \, I)^2 lt.eq
  Lambda_k^2 \| R \| quad \( p = a \, l \) . $ <eq:analytic-basic-energy>]

One may take $Lambda_k$ to dominate $C_(q \, b) \( 1 + K_0 \) log \( 2 D_(upright("base")) \)$.
  For the fixed-input argument the smaller bound in H also suffices.

For noninitial accuracy levels, every pair of full $Y$ arguments has form norm at most $eta =
  exp \( - k^theta \)$, and $\| H_I \( Y_I \) \| lt.eq eta$.
  Here the pair norm is the supremum against normalized $L^2 \( I \)$ inputs in the complementary two positions;
  $0 < theta < 1$ is fixed before $q$. Define $cal(A)_R$ to consist of those cells for which some available triple
  of basic scalar columns has transpose norm greater than $D_(upright("base"))^(- C_(upright("act")))$,
  with the fixed sufficiently large exponent in H or V. The active-scale estimate gives $sum_(I in cal(A)_R)
  upright(bold(1))_I lt.eq D_(upright("base"))^C$.

There are three remaining patterns: $z^diameter = B$, $z^a$ replaces only role $a$ of $B$ by $U_a$,
  and $z^l$ replaces only role $l$ by $U_l$. Put

#[#set math.equation(numbering: n => "(4.7)")
 $ frak(M)_R \( z \) = sum_(I in cal(A)_R) \| I \| min { eta \, \| H_I \( z_I \) \| } . $ <eq:analytic-base-target>]

The output of [12] Proposition 5.8 and [13] Proposition 5.6 is

#[#set math.equation(numbering: n => "(4.8)")
 $ sum_(I in cal(I)_R) \| I \| thin \| H_I \( Y_I \) \| lt.eq C_(q \, b) eta Lambda_k^2 \| R \| +
   e^(- k) \| R \| + sum_(z in { z^diameter \, z^a \, z^l }) frak(M)_R \( z \) . $ <eq:analytic-active-reduction>]

Indeed the term with both $U$ factors uses the full complementary pair bound and (4.6).
  The inactive triple scale sum bounds the omitted cells. On the others, apply $min \( eta \, sum x_m \) lt.eq
  sum min \( eta \, x_m \)$ to the full tuple before separating its patterns.
  No individual pattern is asserted to have the full-pair smallness.

For each fixed tuple the segment roots have total length bounded by a fixed multiple of the original root length,
  and the sum of the high-truncation replacement errors is at most $C_(q \, b) e^(- k)$ times that length.
  These are the segment-packing assertions in the cited base constructions.
  The finitely many initial accuracy levels use the active path bound and local sizes, without the factor $eta$,
  and hence have depth-independent bounds. All these estimates are valid anew on a normalized subroot with its
  inherited lists and original input schedule. We have therefore reduced both input classes to estimating (4.7)
  uniformly over these concrete base patterns.

=== 4.4 Curvature tags and separation of distinct tags <curvature-tags-and-separation-of-distinct-tags>

We now localize the base arguments according to their quadratic structure.
  Recall the nonzero integers $c_j$ of Lemma 4. A column in role $i$ has #emph[normalized curvature tag]
  $v = \( theta_v \, C_v \, lambda_v \)$ when its quadratic chart phase is written as

$ c_i #scale(x: 120%, y: 120%)[\(] lambda_v y^2 + \( theta_v y \)^T C_v \( theta_v y - n \)
  #scale(x: 120%, y: 120%)[\)] . $

Its linear modulation is not part of its tag. This is H’s normalization with $\( - 1 \, 3 \, - 3 \, 1 \)$ replaced
  by $c$. Division by the fixed nonzero $c_i$ preserves the chart budgets.

At length $r$, the difference data of two tags $v \, v'$ are

#[#set math.equation(numbering: n => "(4.9)")
 $ V' = r binom(theta_v, theta_(v')) \, wide C' = "diag" \( C_v \, - C_(v') \) \, wide Lambda' =
   r^2 \( lambda_v - lambda_(v') \) . $ <eq:analytic-tag-difference>]

The ambient graph in [12] Section 6.1 joins two tags when these data admit (4.3) with bounds at most the chosen
  edge height $H_(upright("ed"))$; equal tags have distance zero.
  This graph includes all hypothetical tags within the basic budget.
  Its distances depend on tags and depth, and do not increase when the interval length is halved.

#thm([Lemma 4.4.])[
  (Separation of distinct tags).  #emph[For single-column complexities at most $exp \( C_(q \, b) k^C \)$ and
    $log \( 1 \/ tau \) lt.eq C_(q \, b) k^C$, the edge height can be chosen with $log H_(upright("ed")) lt.eq
    C_(q \, b) k^C$ so that tags at graph distance greater than one have both of the following properties.
    Their same-slot normalized physical inner product is at most $tau$ in absolute value.
    In distinct slots, their form norm against two arbitrary normalized $L^2 \( I \)$ spectators is at most $tau$.]
] <lem:tag-separation>

#proof[
  For the first assertion use the Weyl alternative on the conjugate product,
    after the smoothing of the interval indicator in [12] Lemma 6.1.
    Its fixed nonzero factor $c_i$ changes the allowed rational heights by a fixed amount,
    and multiplying back gives the splitting for the tag difference.
  For distinct source slots $i \, j$, let the spectators be at $a \, l$,
    and write the centered source coordinates in terms of the normalized spectator coordinates $z \, w$.
    Their linear parts are $r \( xi_p z + zeta_p w \)$, where
  $ xi_p = frac(b_l - b_p, b_l - b_a) \, wide zeta_p = frac(b_p - b_a, b_l - b_a) wide \( p = i \, j \) . $
  These are nonzero fixed rationals. The cancellation of polynomials of degree at most two gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ c_i xi_i zeta_i = - c_j xi_j zeta_j = : kappa eq.not 0 . $ <eq:analytic-mixed-curvature>]
  Use the difference data (4.9). For a small return $V' h = m + d_h$,
    choose an integer period $Pi$ and require $m in Pi bb(Z)^(d_v + d_(v'))$, where $d_v \,
    d_(v')$ are the horizontal dimensions of the two tags. Choose $Pi$ sufficiently divisible that $xi_i Pi \,
    xi_j Pi$ are integers and $Pi C_v \, Pi C_(v') \, c_i xi_i Pi C_v \,
    c_j xi_j Pi C_(v')$ have integral entries. This clears the lattice-index and phase denominators together.
    Translate $z$ by $h$, and the source lift indices by $xi_i m_v$ and $xi_j m_(v')$, respectively.
    The phase-increment calculation in the proof of [12] Lemma 4.3, together with (4.10), gives the modulation in $w$
  $ kappa Omega \( h \, m \) \, wide Omega \( h \, m \) = \( 2 Lambda' + \( V' \)^T C' V' \)
    h - \( V' \)^T \( C' - \( C' \)^T \) m . $
  Indeed each source contribution has the multiplier $c_p xi_p zeta_p$;
    the two contributions therefore combine into these difference data.
    The remaining linear terms in $z$ are absorbed in the first spectator.
    The amplitude and kernel errors are bounded by a quasipolynomial times $\| h \| +
    lr(bar.v.double d_h bar.v.double)$, as in H.
  Call the two spectators $f \, g$, and clip them at a sufficiently large inverse polynomial in $tau$.
    Their discarded $L^1$ tails are small by their $L^2$ bounds and Lemma 15.
    If the form is larger than $tau$, applying the return calculation to sufficiently many multiples of
    $\( h \, m \)$ gives large correlations of one fixed bounded kernel with tests $f_ell \( z \) g_ell \( w \)$,
    where the $f_ell$ have bounded $L^2$ norms and
  $ g_ell \( w \) = g \( w \) e \( ell kappa Omega \( h \, m \) w \) $
  up to a common bounded multiplier. The small return threshold is chosen before these multiples so that all
    translation errors remain small. No regularity of the first spectator is required:
    it is translated by a change of variables. If $\| Omega \( h \, m \) \|$ exceeds a fixed constant,
    the second tests are Bessel on the fixed box, with bound controlled by the clipping height.
    Cauchy–Schwarz in $z$ then contradicts the number of large correlations.
    Thus $Omega$ is bounded on every sufficiently small return.
  The concluding return-to-splitting argument in the proof of [12] Lemma 4.3 uses precisely this bound:
    its alternating return identity yields an isotropic lattice space,
    successive minima bound the rational fast projection and slow part,
    and coordinate-direction returns bound the effective quadratic form.
    The enlarged denominator-clearing period changes only its quasipolynomial constants.
    It supplies (4.3), contradicting the assumed graph distance.
    This is the distinct-slot argument of [12] Lemma 6.1 for the present coefficients. ◻
]

=== 4.5 Same-tag tests and the localization output <same-tag-tests-and-the-localization-output>

The complementary fact is that a column of one tag can detect a residual in another role using a template of that
  same tag. This keeps the approximation spaces finite without repeatedly increasing their nonlinear complexity.
  A pure source column means one scalar column label, rather than a linear combination of labels.

#thm([Lemma 4.5.])[
  (Uniform same-tag test).  #emph[Fix an original tag $v$ and its original source columns within the complexity
    budget $exp \( C_(q \, b) k^C \)$. There are fixed template families in all four slots,
    consisting of bounded columns of tag $v$ with arbitrary external linear modulations.
    Suppose a pure source column from the original or template family in role $i$ has form norm greater than
    $t_0 > 0$ against a physical residual in $L^2 \( I \)$ in role $j$ and two normalized $L^2 \( I \)$
    spectators. The residual then has a normalized moment of magnitude at least $t_0 \/
    H_0$ against a template in role $j$, where $H_0 lt.eq exp \( C_(q \, b) k^C \)$.
    This bound is independent of the external linear modulations and of the number of earlier template insertions.]
] <lem:same-tag-test>

#proof[
  Use the nonnegative partition function $rho$ and template amplitudes $rho \( d \)
    e \( ell^T d \/ P_0 \)$ of [12] Lemma 6.6, with $ell$ ranging over residue vectors modulo a sufficiently large
    integer period $P_0$. For the four lifts $d_p = theta_v y_p - n_p$, set
  #[#set math.equation(numbering: n => "(4.11)")
   $ d_diamond.stroked.small = sum_p e_p d_p \, wide k_p = d_p - d_0 -
     b_p d_diamond.stroked.small . $ <eq:analytic-common-carries>]
  The Bézout identities show that $d_diamond.stroked.small$ is a lift of $theta_v
    t$ modulo the integer lattice and every $k_p$ is integral. All are bounded on the branch boxes.
    The common quadratic phases cancel by Lemma 4; for fixed carries the remaining phase is
  $ sum_p c_p \( theta_v y_p \)^T C_v k_p \, $
  which is linear in the coordinates. Smooth equality cutoffs in the four lifts impose (4.11) exactly,
    because their arguments are integer valued on the configuration.
    Their Fourier expansion on a sufficiently large box therefore produces the same template amplitudes.
    Increasing the period and the possible carry count costs only the allowed chart budget.
  As in H, write each Fourier index as $ell = P_0 q' + r'$.
    The factor $e \( \( q' \)^T d_p \)$ is an external linear modulation,
    so only $r'$ enters the template amplitude. This gives the same bound even when the source was itself a
    previously inserted template. For an original source, the remaining smooth horizontal amplitude,
    after phase cancellation, is periodized and expanded in ordinary torus characters.
    Its remaining dependence on the source coordinate is a linear modulation,
    which is absorbed into the spectator tests. All these absolute coefficient sums are bounded by the same
    quasipolynomial budget. After separating the smooth kernel, express the target coordinate as $y_j =
    alpha y_a + beta y_l$, with fixed nonzero rational $alpha \, beta$.
    Fourier-expand the demodulated residual on a fixed larger interval.
    If $M$ is the supremum of its normalized template moments, one separated term is bounded by
  $ M sum_m \| A_m B_m \| lt.eq M (sum_m \| A_m \|^2)^(1 \/ 2) (sum_m \| B_m \|^2)^(1 \/ 2) lt.eq C_b M . $
  The last inequality is Bessel’s inequality for spectator frequencies with nonzero spacings proportional to
    $alpha \, beta$. Summing the absolute Fourier coefficients gives $H_0 M$, and proves the assertion. ◻
]

We record how these two tests enter the remainder of the imported construction.
  This also fixes the meaning of its output used in Section 5.
  Put $P = ceil.l eta^(- alpha) ceil.r$, where $alpha > 0$ will be chosen in the closing argument.
  The vertices are occurrences of the original columns and are ordered by admission.
  Added main and helper columns attach to those vertices and have their normalized tags;
  they create no new graph vertices. H’s short-path, color,
  and historical-mask constructions [12] Lemmas 6.2–6.5 form groups of these vertices and assign current groups to
  each summation cell. An actual use is such an occurrence of a current group at a cell.
  A mask is the subset of available vertices allowed in a specified local projection.
  A pad enlarges that subset by the prescribed graph radius;
  a positive smeared filter is the average of $P$ nested pad projections.
  A history is the ordered product of such filters or their complements used in the binary localization.
  The number $cal(L)$ of colors is polynomial in $k$, and these main histories have $O \( log cal(L) \)$ factors.
  Each group records a distinguished tag $z$, the primary winner in H’s color construction.
  Every vertex admitted to its masks has, already at admission, a graph path to $z$ of length polynomial in $P \,
  k$. The short-path lemma therefore gives the endpoint splitting (4.3) relative to $z$,
  with logarithmic height polynomial in $P \, k$. This is the splitting used for the first matching of a column in
  Section 5.

We use the precise masks and historical-use convention of those lemmas. Its relevant properties are as follows.
  Masks are inherited on descendants; at an actual use, enlarging a pad by one includes every neighbor of the
  preceding mask. An endpoint is usable when its mask is nonempty and its cell has a downstream actual use of its
  group. Distinct groups of one color have tags separated by graph distance greater than one on overlapping usable
  endpoints. The endpoint bound along short paths follows from the rational splitting (4.3).
  The usable-space Bessel bound follows from same-slot separation in Lemma 18.
  These proofs involve only rational linear algebra, inherited interval projections,
  and the indicated splitting and separation bounds; thus their path, rank,
  and pad counts keep the quantitative orders in H.

For completeness, the closure condition imposed on these spaces has an exact form.
  At rank $r$, let $n_(r - 1)$ bound the number of labels through the preceding rank along a path, let $D =
  D_(upright("base"))$, and let $tau_3 = D^(- C_tau)$. For a basic argument $a$, each prescribed history $cal(H)$,
  target mask $cal(M)$, and pure lower-rank source whose tag belongs to that mask,
  the form norm against the residual $\( 1 - P_(r \, cal(M)) \) cal(H)
  a$ and two normalized $L^2$ spectators is required to be at most

#[#set math.equation(numbering: n => "(4.12)")
 $ frac(tau_3, D sqrt(n_(r - 1))) lr(bar.v.double  bar.v.double) a_(2 \, I) . $ <eq:analytic-closure>]

On failure, Lemma 19 supplies a new column and hence a projection increment.
  The products-of-prefixes estimate of H Section 3 bounds the sum of those increments,
  exactly as in its Lemma 6.7. Its rank recurrence and main/helper catalog counts are therefore unchanged.
  This count depends on the names of masks and histories, including anticipated helper bases,
  but not on the numerical edge height or on later mode precision.
  As in [12] Section 6.4 and [13] Section 6.1, first fix these counts, then the mismatch tolerance,
  and finally the edge height needed in Lemma 18. The lower-rank count in (4.12) is retained,
  so no full source count is lost when these errors are summed.

It follows that the binary localization and outgoing-filter identities of [12] Proposition 6.8 and Lemma 6.9 hold
  for the present forms: they use (4.12), distinct-tag form separation, the local absolute bound,
  and the same nested projection algebra. In the color construction of [12] Lemma 6.3,
  the first failure of its marking conditions may remove a subtree.
  Increasing the fixed thresholds makes the sum of these roots’ lengths an arbitrarily small fixed fraction of $\|
  R \|$. Section 6 restarts the original summands on those roots.
  After these marking-failure cuts, let $cal(A)_R^(upright("main"))$ denote the remaining active cells.
  For each base pattern and $I in cal(A)_R^(upright("main"))$ of depth $s$, the localization is

#[#set math.equation(numbering: n => "(4.13)")
 $ H_I \( z_I \) = sum_lambda med sum_(G med upright("current"))
   H_I \( Z_(0 \, G \, s)^lambda \, dots.h \, Z_(3 \, G \, s)^lambda \) + e_I \,\
Z_(p \, G \, s)^lambda = overline(L)_(p \, G \, s)^lambda cal(B)_(p \, s)^lambda z_(p \, I) \, wide
  sum_(I in cal(A)_R^(upright("main"))) \| I \| \| e_I \| lt.eq
  C_(q \, b) e^(- k) \| R \| . $ <eq:analytic-localization>]

Here $lambda$ ranges over polynomially many fixed binary search leaves.
  The inner history $cal(B)_(p \, s)^lambda$ is independent of $G$,
  and $overline(L)_(p \, G \, s)^lambda$ is the outer ball average.
  The minimum in (4.7) is distributed across the fixed leaves,
  while the group sum remains inside the original cell contribution.
  The filters act on the whole basic arguments in this identity.
  We next record their endpoint bounds, then the algebra that moves the complementary filters onto a side operand.

For varying inputs, this localization acts at each cell on its one actual tuple at that cell’s original depth.
  The insertion tests freeze that operand while the column list grows.
  The products-of-prefixes estimate therefore remains a fixed-vector estimate, and gives the same closure count;
  this is the argument of [13] Section 6.1. After the operator families have been fixed,
  its Lemma 6.1 and Corollary 6.2 control their changes between endpoint depths.
  More explicitly, for one slot, search leaf, and color, write the full localized endpoint output as $Z_(G \, s) =
  overline(L)_(G \, s) cal(B)_s B_s$, where $overline(L)$ is the outer positive ball average and $cal(B)$ its
  group-independent inner history. If depth intervals $\[ r \, t \]$ have edge-overlap multiplicity at most $a$,
  and $E_(G \, r \, t)$ is a union of $t$-cells with downstream actual uses certifying the indicated group,
  those results give

#[#set math.equation(numbering: n => "(4.14)")
 $ sum_(G \, \[ r \, t \])
   lr(bar.v.double upright(bold(1))_(E_(G \, r \, t)) \( Z_(G \, t) - Z_(G \, r) \) bar.v.double)_2^2 lt.eq
   a G_0 \| R \| \, wide G_0 = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
   C_(q \, b) \( 1 + log \( 2 k \) \)^C #scale(x: 120%, y: 120%)[\)] . $ <eq:analytic-endpoint-variation>]

The shared histories without an outer ball satisfy the corresponding estimate counted once across groups.
  Endpoints before the attempt root are zero, and all other endpoints use inherited continuations and local
  refits. The proof first establishes the ordinary Bessel bounds for operator changes,
  using usable endpoint ranges and compression, and then evaluates the rows at their prescribed depth inputs.
  Input changes use only the original block variation bound.
  Thus the constants in (4.14) are independent of the partitions and $W_j$.

=== 4.6 Transferring the complementary filters <transferring-the-complementary-filters>

The side estimate will encounter two distinguished operands while the other two retain their whole localized
  histories. We state the projection identity for this situation explicitly.
  Fix an actual group use at a cell $I$, one search leaf, and four distinct roles $a \, a' \, c \, d$.
  Let $S_a \, S_(a')$ be fixed Hilbert-valued $L^2 \( I \)$ operands in the first two roles.
  They are called side operands here because they are retained while the complementary histories are simplified;
  their particular construction and cross-depth bounds are given in Section 5.
  The other two roles have the whole localized arguments with basic inputs $B_c \, B_d$ from (4.13).
  Choose the side operands before closing the helper catalog.
  The helper version of (4.12) is imposed with these fixed states as bases and lower-rank main columns as sources,
  as in [12] Lemma 6.7.

Expand each complementary factor $1 - overline(Q)$ as the difference of the identity and a positive average.
  There are only $2^(O \( log cal(L) \))$ resulting products.
  In one such product, remove the largest-rank outermost positive filter in roles $c \, d$.
  The positive main ranks are distinct in the source construction,
  so the remaining source in the other complementary role has strictly lower rank.
  Suppose the filter being removed is on role $c$. Let $Q_(c \, p)$, $1 lt.eq p lt.eq P$,
  be its individual pad projections, and $Q_(a \, p)$ the helper-rank projections in role $a$ with the same masks
  and pads. For $j = a \, c$, set

#[#set math.equation(numbering: n => "(4.15)")
 $ Q_(j \, 0) = 0 \, wide Q_(j \, P + 1) = 1 \, wide A_j^p = Q_(j \, p) -
   Q_(j \, p - 1) quad \( 1 lt.eq p lt.eq P + 1 \) \,\
overline(Q)_j = 1 / P sum_(u = 1)^P Q_(j \, u) = sum_(p = 1)^(P + 1) frac(P - p + 1, P) A_j^p . $ <eq:analytic-bands>]

The $A_j^p$ are mutually orthogonal projections and sum to the identity.
  Their final band is included, with weight zero in the positive average.

Let $x_c$ be the inner history on $B_c$ after deleting the outgoing filter,
  and let $x_d$ be the entire remaining history on $B_d$. Write $x_a = cal(D)_a S_a$,
  where $cal(D)_a$ is the product of helper averages already transferred, and $x_(a') = S_(a')$.
  In the next displays arguments are written in role order $a \, a' \, c \, d$;
  each still occupies its original slot in $H_I$. Multilinearity and (4.15) give

#[#set math.equation(numbering: n => "(4.16)")
 $ & H_I \( x_a \, x_(a') \, overline(Q)_c x_c \, x_d \) - H_I \( overline(Q)_a x_a \, x_(a') \, x_c \, x_d \)\
 & wide = sum_(p \, q = 1)^(P + 1) frac(p - q, P) H_I \( A_a^p x_a \, x_(a') \, A_c^q x_c \, x_d \) .
   $ <eq:analytic-band-transfer>]

Indeed the coefficient of the pair of bands is the weight of band $q$ in role $c$ minus the weight of band $p$ in
  role $a$. This proves H’s Equation (15), including its terminal bands,
  for the present form without a coefficient change.

The estimate accompanying [12] Lemma 6.9 permits only $\| p - q \| lt.eq 2$ to be retained:
  the other terms at this cell and group have total absolute value at most

$ D_(upright("base"))^(- C_3) lr(bar.v.double S_a bar.v.double)_(2 \, I) lr(bar.v.double S_(a') bar.v.double)_(2 \, I) $

for any prescribed fixed $C_3$, after the numerical accuracies are chosen.
  Its hypotheses are precisely the closure and separation estimates proved above.
  If $p > q + 2$, expand the lower $c$-band into pure main sources and use the helper closure test on the higher
  $a$-band, written as a difference of residual projections.
  If $q > p + 2$, expand the lower-rank source in role $d$.
  A source tag within one edge of the lower helper mask belongs, by neighbor closure, to the next outgoing mask;
  the main closure test then controls the higher $c$-band. For a tag farther away,
  expand the helper primal and use Lemma 18. The coefficient counts are canceled by the lower-rank denominator in
  (4.12), except for fixed count powers already included when the mismatch tolerance was chosen.
  The $O \( P^2 \)$ band pairs and polynomially many transfer positions fit those accuracy choices because $log
  P = O \( k \)$.

For each fixed offset $h = q - p in { - 2 \, - 1 \, 0 \, 1 \, 2 }$, retain the coupled sum

#[#set math.equation(numbering: n => "(4.17)")
 $ cal(B)_(I \, h) = - h / P sum_(1 lt.eq p lt.eq P + 1\
1 lt.eq p + h lt.eq P + 1) H_I \( A_a^p x_a \, x_(a') \, A_c^(p + h) x_c \, x_d \) . $ <eq:analytic-retained-bands>]

The sum over $p$ stays inside the cell contribution. When the current group is also summed,
  its sum stays there as well. This is the expression to which the short-block estimate is applied;
  taking absolute values of its individual bands would lose the matched-band summation used in that estimate.

Forward only the transferred main term in (4.16) to the next step.
  Removing the remaining positive filters in decreasing rank ends at

#[#set math.equation(numbering: n => "(4.18)")
 $ H_I \( cal(D)_a S_a \, S_(a') \, B_c \, B_d \) \, wide cal(D)_a upright(" a product of ") O \( log cal(L) \)
   upright(" helper averages") . $ <eq:analytic-transfer-main>]

Restoring $B_c \, B_d$ to the full $Y_c \, Y_d$ uses their pair bound from the base reduction.
  Each correction has an additional basic $U$ factor and is therefore a three-side term.

For the retained defects, the endpoint convention matters.
  If the outgoing filter is a ball filter, split $A_c^(P + 1) = 1 -
  Q_(c \, P)$ into the shared identity and its positive ball endpoint.
  The other complementary band endpoints have usable ball ranges.
  If the outgoing filter is cumulative, its outer ball has already been removed and the entire complementary band
  expression is shared across groups. Role $d$ likewise either has one positive outer ball filter or is shared.
  In the endpoint energy estimates, a shared identity is evaluated on the union of required cells and counted
  once; the original form still retains every actual use. These are exactly the endpoint classes controlled by
  (4.14) and [13] Corollary 6.2; they give the side estimate in Section 5 its coupled band operands.

We have obtained the base minimum, the localized group expressions, their outgoing-filter identity,
  and the endpoint estimates with the same main-column budgets as H and V.
  The remaining work is to estimate the coupled near bands and the remaining localized quadratic contributions.
  Section 5 establishes the coefficient-dependent comparisons used for those two estimates.

== 5 Short blocks, rational shifts, and the core estimate <sec:arithmetic>

Starting from the localization proved in the preceding section,
  we now split the arguments into side terms and core terms.
  Side terms are controlled by square estimates for projection increments,
  together with a comparison on a bounded block of depths. Core terms are controlled by separation of the
  frequencies left after removing a common quadratic phase.
  We prove the coefficient-dependent parts of both arguments here.
  The projection, graph, and amplitude summations that we use from [12,13] are identified at their points of
  application.

Throughout this section, the primitive integer vector $b = \( 0 \, b_1 \, b_2 \, b_3 \)$, the integers $e_j$,
  and the nonzero integers $c_j$ are those of Lemma 4. Constants may depend on these fixed integers and on the
  admissible kernel bounds. We write $e \( t \) = exp \( 2 pi i t \)$.
  For an interval $I$, the notation $parallel f parallel_(2 \, I)$ denotes
  $\( \| I \|^(- 1) integral_I \| f \|^2 \)^(1 \/ 2)$, also for Hilbert-space-valued functions.

=== 5.1 A comparison on a short block <a-comparison-on-a-short-block>

We first establish the version of [12] Lemma 7.2 needed by the side argument.
  This estimate compares randomized inputs with the fixed-input constant $C_N \( q \)$; in particular,
  the exponent of the block length must tend to zero as $q$ tends to two.

#thm([Proposition 5.1.])[
  (Short-block comparison).  #emph[Let $2 < q < 3$. Let a finite dyadic tree piece have root $R$,
    with internal summation intervals in at most $K$ consecutive depths and within the original range of at most
    $N$ depths. Its terminal intervals, called leaves, partition $R$ and occur in this depth block or one depth
    below it. In role $j$, let $upright(bold(z))_j$ be a deterministic Hilbert-space-valued function supported on
    $R$, with $parallel upright(bold(z))_j parallel_(2 \, L) lt.eq s_j$ on every leaf $L$.
    Suppose scalar randomizations $z_j^sigma$ satisfy
$ #scale(x: 120%, y: 120%)[\(] bb(E)_sigma \| z_j^sigma \( y \) \|^a #scale(x: 120%, y: 120%)[\)]^(1 \/ a) lt.eq
  C_a parallel upright(bold(z))_j \( y \) parallel $

 for $a = 2 \, 4 \, 8$, with constants independent of the tree and $K$.
   For measurable signs $\| epsilon.alt_I \( sigma \) \| lt.eq 1$ and any subcollection of internal intervals,
$ bb(E)_sigma
  lr(|sum_I \| I \| epsilon.alt_I \( sigma \) H_I \( z_0^sigma \, z_1^sigma \, z_2^sigma \, z_3^sigma \)|)
  lt.eq \( 1 + C_N \( q \) \)
  C_(q \, b) \( 1 + log \( K + 2 \) \)^C \( K + 2 \)^(11 \( q - 2 \) \/ \( q - 1 \)) \| R \| product_j s_j . $

 The constant $C_(q \, b)$ may also depend on the fixed moment bounds $C_a$ and the kernel bounds.]
] <prop:short-block-b>

#proof[
  Homogeneity reduces to $s_j = 1$; a zero size makes the form zero.
    Multiplying all signs by one random scalar of modulus one reduces the expected absolute value to the absolute
    value of an expected signed sum.
  We use the partition of the four leaf depths from the proof of [12] Lemma 7.2.
    Here is the information from that partition that will be needed.
    If the least depth occurs more than once, designate two roles attaining it.
    If it occurs once, designate that role and separate the least and second least depths by the smallest dyadic
    interval of depth indices containing them in opposite halves.
    Specify the nonempty set of roles whose depths belong to its upper half,
    and designate one of those roles by a fixed ordering. Every role that is neither the minimum role nor in that
    specified set has depth greater than the upper endpoint of that dyadic interval.
    This partitions the depth tuples into rectangles of masks $E_j$, each a union of leaves.
    There are $O \( 1 + log \( K + 2 \) \)$ length classes and a bounded number of role assignments.
    Within each class, there are $O \( K + 1 \)$ positions; the masks in each of the two designated roles,
    say $a \, a'$, are disjoint over those positions. For a fixed rectangle there is an index $t$ such that every
    role has leaf depth at least $t$, with the possible exception of role $a$.
    Only summation depths $s < t$ contribute. Indeed a leaf meeting an internal interval must be its strict
    descendant. The same assertion holds after the small coordinate enlargements below,
    by the kernel’s fixed interior support margin.
  Write $r_s$ for the length at depth $s$, and set $delta = beta r_t$,
    where $beta > 0$ is a sufficiently small fixed dyadic number depending on $b$ and the support margin.
    Decompose the physical coordinates as
  $ x = delta \( n + u \) \, wide tau = delta \( m + v \) \, wide n_j = n + b_j m \, wide w_j = u + b_j v . $
  The slow coordinates $n \, m$ are integers. Choose the fast representatives from the parallelogram
  #[#set math.equation(numbering: n => "(5.1)")
   $ cal(P)_b = { \( u \, v \) : 0 lt.eq u < 1 \, quad 0 lt.eq u + b_1 v < \| b_1 \| } . $ <eq:fast-tile>]
  This is a fundamental domain for translation by $bb(Z)^2$, of area one.
    To decompose a point, first choose $n$ so that its first coordinate minus $n$ belongs to $\[ 0 \, 1 \)$,
    and then choose $m$ so that $u + b_1 v$ belongs to $\[ 0 \, \| b_1 \| \)$.
    The latter choices differ by $b_1$, so existence and uniqueness hold for either sign of $b_1$.
  Let $bb(T)_0 = bb(R) \/ \( T_0 bb(Z) \)$, with Haar probability measure,
    where $T_0$ will be a sufficiently large fixed number. Define $F_j^sigma \( p \, w \)$ by sampling
    $z_j^sigma \( delta \( p + w \) \) upright(bold(1))_(E_j) \( delta \( p + w \) \)$ on a bounded interval of
    real lifts and setting it to zero elsewhere on $bb(T)_0$.
    Use lift intervals $\[ 0 \, 1 \)$ and $\[ 0 \, \| b_1 \| \)$ in roles zero and one,
    and bounded intervals containing the ranges of $w_2 \, w_3$ on $cal(P)_b$ in the other roles.
  The fast Haar integral reproduces integration over $cal(P)_b$, up to its fixed normalization.
    To check the potentially noninjective pair coordinates, suppose a torus progression has all four bounded lifts
    $tilde(w)_j$ in these windows. Put
  $ tilde(u) = tilde(w)_0 \, wide tilde(v) = sum_j e_j tilde(w)_j . $
  The integer inverse of Lemma 4 gives $tilde(w)_j = tilde(u) + b_j tilde(v) med \( mod med T_0 \)$.
    All the discrepancies are bounded in terms of the fixed windows and $b \, e$.
    Choose $T_0$ larger than these bounds. Each discrepancy then vanishes,
    so these are equalities of real numbers and $\( tilde(u) \, tilde(v) \) in cal(P)_b$.
    Conversely, every point of the tile gives exactly these lifts.
    This verifies the sampling identity without asserting that any coordinate pair is unimodular.
  Replace the kernel by its value at $\( delta n \, delta m \)$.
    At depth $s$, the error is $O_b \( delta \/ r_s \)$, with a fixed support enlargement.
    The normalized sampled form has factor $\( delta \/ r_s \)^2$.
    On the product of local counting measure and the fast torus,
    any two distinct coordinate maps are injective on the lattice and Haar-surjective on the torus.
    Consequently the two- $L^1$, two-$L^oo$ bounds hold, and interpolation gives the absolute form estimate
    whenever the four reciprocal exponents sum to at most two.
  For clarity, let $M_(j \, I)$ be the squared mass of $upright(bold(z))_j$ in all masked sampling windows
    relevant to $I$, including their bounded overlap multiplicity.
    Choosing $beta$ small enough puts these windows inside $I$. The leaf normalization therefore gives
  $ M_(j \, I) lt.eq C_b \| I \| \, wide sum_("depth" \( I \) = s) M_(j \, I) lt.eq C_b \| E_j \| . $
  The absolute $L^2$ estimate and the moment hypothesis bound the sampling errors at depth $s$ by
  $ C_b delta / r_s \| E_a \|^(1 \/ 2) \| E_(a') \|^(1 \/ 2) . $
  The sum over $s < t$ is bounded, and summing rectangle positions uses the disjointness of both designated masks.
  We next improve the integrability of the fast inputs. On their fast Fourier coefficients define
  $ accent(U_(j \, gamma) F, ̂) \( p \, k \) = e \( gamma k^2 \/ c_j \) hat(F) \( p \, k \) \, wide
    gamma in bb(R) \/ \( C_c bb(Z) \) \, quad C_c = "lcm"_j \| c_j \| . $
  The fast progression integral is unchanged under simultaneous application of these unitaries.
    Its Fourier support obeys $sum k_j = sum b_j k_j = 0$, so Lemma 4 gives $k_j =
    c_j \( h + b_j h' \)$ for real $h \, h'$. Thus
  $ sum_j k_j^2 \/ c_j = sum_j c_j \( h + b_j h' \)^2 = 0 . $
  For a single role, integrating the fourth power first in the fast variable and then in $gamma$ equates the sums
    and the sums of squares of two pairs of Fourier indices. Those pairs agree as multisets, whence
  #[#set math.equation(numbering: n => "(5.2)")
   $ bb(E)_gamma integral_(bb(T)_0) \| U_(j \, gamma) F \( p \, w \) \|^4 thin d w lt.eq
     2 parallel F \( p \, dot.op \) parallel_2^4 . $ <eq:fast-fourth>]
  Fourier polynomial approximation is justified by the pairwise $L^2$ form estimate and this same fourth-moment
    estimate for differences.
  Let $frak(e)_j \( p \)$ now denote the fast $L^2$ size of the deterministic stack in the sampling window.
    Window overlap gives $delta sum_p frak(e)_j \( p \)^2 lt.eq C_b \| E_j \|$.
    If all leaves of a role have depth at least $t$, then $frak(e)_j \( p \) lt.eq C_b$:
    disjoint leaves meeting a window of length $O_b \( delta \)$ have total length at most $O_b \( delta \) +
    2 r_t$. In every role, including the possible remaining role $a$,
  $ frac(delta, \| I \|) sum_(p med upright("relevant to") med I) frak(e)_j \( p \)^2 lt.eq C_b . $
  Minkowski’s inequality transfers the assumed sign moments to these window sizes.
    Intermediate moment orders below eight are bounded by the eighth moment using Hölder’s inequality.
  Write $G_j = U_(j \, gamma) F_j$. If role $a$ has leaves above depth $t$,
    clip it radially at $A = \( K + 2 \)^10$. The clipped tail has local $L^1$ norm at most $A^(- 1) parallel F_a
    parallel_2^2$, whose $L^4$ norm in the random parameters is $O_b \( A^(- 1) \)$.
    In the other roles the local $L^3$ norms have bounded fourth moments,
    by (5.2) and the preceding window bounds. The absolute form estimate with exponents $\( 1 \, 3 \, 3 \, 3 \)$
    therefore gives expected tail error $O_b \( A^(- 1) \)$ per normalized cell.
    Even summing $O \( \( K + 1 \)^2 \)$ positions and depths is harmless.
    For the rest of the proof, replace $G_a$ by this clipped function when that role is present.
  To return to the original continuous form, fix the random parameters and $\( u \, v \) in bb(T)_0^2$, and plant bursts
  $ g_j \( y \) = sum_p G_j \( p \, u + b_j v \) upright(bold(1))_({ \| y - delta p \| < c' delta }) . $
  Choose $c' > 0$ so small that $c' \( 2 + max_j \| b_j \| sum_l \| e_l \| \) < 1$.
    If a real configuration lies in bursts centered at $p_j$, set $n = p_0$, $m = sum_j e_j p_j$. Then
  $ \| x \/ delta - n \| < c' \, wide \| tau \/ delta - m \| < c' sum_j \| e_j \| \, wide \| p_j - n - b_j m \| < 1 . $
  The last quantity is an integer and hence is zero. For this slow pair the allowed offsets form the polygon ${ \|
    u' + b_j v' \| < c' med \( 0 lt.eq j lt.eq 3 \) }$, of fixed positive finite area.
    The center-valued kernel integral on the polygon therefore gives exactly the sampled product,
    times that area and $delta^2$. The second kernel replacement has the same error estimate as the first:
    unitarity and clipping preserve fast $L^2$ bounds and do not enlarge the set of slow indices.
    We can now apply $C_N \( q \)$ to these fixed compactly supported burst inputs,
    using the original admissible kernels.
  For completeness, the exponent calculation is unchanged. Put
  $ p_a = p_(a') = p_(*) = 2 + 2 \( q - 2 \) \, wide p_j = frac(2 p_(*), p_(*) - 2) quad \( j in.not { a \, a' } \) . $
  Use fast exponent $p_(*)$ in the clipped role and exponent four in the other roles.
    Fast pairwise Hölder, random Hölder of exponent four, spatial Hölder with the $p_j$,
    and the mixed-norm maximal theorem [12] Lemma 7.1 apply: all exponents in that maximal theorem exceed $q$.
    The resulting regular-role factors are $C_b \| E_j \|^(1 \/ p_j)$;
    the clipped factor is $C_(q \, b) A^(1 - 2 \/ p_(*)) \| E_a \|^(1 \/ p_(*))$.
    Summing $O \( K + 1 \)$ positions in the two disjoint designated masks costs $\( K + 2 \)^(1 - 2 \/ p_(*))$.
    Hence the total power is
  $ A^(1 - 2 \/ p_(*)) \( K + 2 \)^(1 - 2 \/ p_(*)) = \( K + 2 \)^(11 \( q - 2 \) \/ \( q - 1 \)) . $
  The logarithmic number of length classes finishes the proof. ◻
]

This proposition supplies exactly the input used by the side estimates [12] Lemmas 7.3–7.4 and Proposition 7.5 and
  [13] Section 6.5. Their remaining arguments concern nested projections, frozen stacks, and variation in depth.
  In addition to the local absolute form bound, they assume the square estimate H(17) for the linear sides.
  We identify its source below; no coordinate substitution is needed in those projection arguments.

=== 5.2 A common gauge and a lattice of rational shifts <a-common-gauge-and-a-lattice-of-rational-shifts>

We describe the data from the mode construction of [12] Section 8 before checking its arithmetic.
  Fix a localized group $G$, with central tag $z = \( theta_z \, C_z \, lambda_z \)$, and a role $l$.
  A #emph[primary] is an available main column of this role’s outer projection.
  Its first matching cell is the cell where the finite expansion described below is chosen;
  that choice and its labels are then inherited on descendants.
  Thus later freezing does not resample a primary’s expansion.

Choose an integer $Q_0$ clearing the denominators of $C_z$, and put $theta.alt = theta_z \/ Q_0$.
  For an offset $rho$ in the unit cube of horizontal coordinates, define

$ d^rho \( y \) = rho + { theta_z y - rho } \, wide p^rho \( y \) =
  lambda_z y^2 + \( theta_z y \)^T C_z d^rho \( y \) . $

Choose $delta_c = exp \( - k^(C_(upright("cut"))) \)$ sufficiently small after the main budgets,
  with fixed exponent $C_(upright("cut"))$. Let $zeta^rho$ be the product Gevrey cutoff of [12] Section 8,
  vanishing within distance $delta_c$ of each branch cut and equal to one outside distance $2 delta_c$.
  It is bounded between zero and one. For each role and group, one offset is kept fixed throughout its history.
  Its expectation is at least $1 \/ 2$, and $bb(E)_rho \| 1 - \( zeta^rho \)^2 \|^2 lt.eq C d_max delta_c$,
  where $d_max$ denotes an upper bound for the dimensions.

For a primary $Phi = \( phi_Phi \, epsilon.alt_Phi^(1 \/ 2) upright(bold(e))_Phi \)$ with normalized tag $v$,
  the endpoint splitting from the localization section and the chart expansion of [12] Lemma 4.4 give,
  at its first match,

$ zeta^rho phi_Phi e \( - c_l p^rho \) = sum_m a_(Phi \, m) e \( lambda_m y^2 + gamma_m y \) + O \( delta_c \) . $

The chart expansion uses this same error tolerance $delta_c$,
  and all modes of one primary have the same quadratic coefficient. As in [12] Lemma 8.1, use mode atoms

$ psi_m \( y \) =
  (zeta^rho \( y \) e \( c_l p^rho \( y \) \) e \( lambda_m y^2 + gamma_m y \) \, epsilon.alt_(upright(m))^(1 \/
  2) upright(bold(e))_m) . $

The coefficient sum, mode count, normalized curvature, and rational heights have logarithms polynomial in the
  accuracy and localization parameters $k \, P$. In particular, for modes of one primary,

#[#set math.equation(numbering: n => "(5.3)")
 $ gamma_m - gamma_(m') = a dot.op \( theta_v \, theta.alt \) \, wide
   a in bb(Q)^(dim \( theta_v \, theta.alt \)) upright(" of controlled height") . $ <eq:mode-differences-b>]

Multiplication of the splitting by the fixed integer $c_l$ changes only fixed constants in these bounds.

The resulting lift $cal(R)_(l \, G)$ is one fixed pointwise bounded operator on augmented inputs.
  Indeed, set $q_Phi = sum_m a_(Phi \, m) \( psi_m \)_(upright("phys")) - \( zeta^rho \)^2 phi_Phi$,
  so that $\| q_Phi \| lt.eq delta_c$. For an augmented input $F$, its lifted physical component is

$ \( zeta^rho \)^2 F_(upright("phys")) + sum_(Phi med upright("matched")) epsilon.alt_Phi^(- 1 \/ 2) F_Phi q_Phi \, $

and its mode coordinate belonging to $\( Phi \, m \)$ is $epsilon.alt_(upright(m))^(1 \/ 2) a_(Phi \, m)
  epsilon.alt_Phi^(- 1 \/ 2) F_Phi$. Choose $delta_c$ small and $epsilon.alt_(upright(m))$ small after the main
  column budgets. Cauchy–Schwarz then gives a uniform operator norm.
  The private coordinate of an outer projection output records its column coefficient,
  so this operator gives exactly its mode synthesis. It is cell-local and independent of the freezing block.

There is also a common periodic multiplier for the four gauges. For four offsets, put $d_j = d^(rho_j) \( y_j \)$ and

$ d_diamond.stroked.small = sum_j e_j d_j \, wide k_j = d_j - d_0 - b_j d_diamond.stroked.small . $

The $k_j$ are bounded integer vectors. Between branch cuts the lifts are affine and their affine parts cancel in
  this expression; hence the carries are locally constant. The three identities $sum c_j b_j^a = 0$, $0 lt.eq
  a lt.eq 2$, give

#[#set math.equation(numbering: n => "(5.4)")
 $ product_j e \( c_j p^(rho_j) \( y_j \) \) = e (sum_j c_j \( theta_z y_j \)^T C_z k_j) . $ <eq:gauge-multiplier-b>]

For fixed carries the right side is an ordinary character on the torus with coordinates
  $\( theta.alt y_(l') \, theta.alt t \)$, for any anchor $l'$:
  $Q_0$ clears $C_z$, and changing the anchor uses integer coefficients $b_j - b_(l')$.
  Smooth cutoffs slightly larger than the original ones extend these character pieces by zero at the cuts.
  They give the smooth periodic multiplier, bounded by one, required in [12] Section 8.3.

The number of carries and the derivative bounds acquire only fixed factors per coordinate or derivative.
  Their logarithmic costs remain polynomial in $P \, k$. Choose a mode budget $D_(*) gt.eq e^k$, $log D_(*) lt.eq
  "poly"_b \( P \, k \)$, covering the mode lists, coefficient sums, heights, inverse private weights,
  and absolute Fourier sums, and large enough to dominate the dimensions and all fixed slope factors.
  Only then choose a Fourier cutoff $B_(*)$ with tails at most $D_(*)^(- 300)$.
  This preserves the order of choices in H; a coefficient-sum budget is not defined through its own truncation radius.

To control rational divisions at later frequency tests, fix an integer

#[#set math.equation(numbering: n => "(5.5)")
 $ D_(upright(s)) gt.eq 6 \, wide 6 divides D_(upright(s)) \, wide \| b_i -
   b_j \| divides D_(upright(s)) quad \( i eq.not j \) . $ <eq:Ds-choice>]

The mode graphs will use shifts in the lattice generated by $theta.alt \/ L_h$, where

#[#set math.equation(numbering: n => "(5.6)")
 $ L_h = D_(upright(s))^h \, wide E_h = A_0^(h + 1) . $ <eq:height-parameters-b>]

Here $E_h$ bounds integer shift indices. The choice of $D_(upright(s))$ is fixed independently of all depth and
  accuracy parameters. From this point, constants indexed by $b$ may also depend on this fixed choice of
  $D_(upright(s))$.

We recall the scale geometry to make the graph conditions explicit.
  In a depth block $\[ s_0 \, s_0 + K \)$, freeze coefficients at $u_(s_0) = s_0 - 4 K$,
  compare on a cell $J$ at depth $v_(s_0) = s_0 - 2 K$, and put $t_(s_0) = s_0 + K$.
  A mode has instantaneous frequency $omega_m \( x \) = 2 lambda_m x + gamma_m$.
  On the list frozen at $u_(s_0)$, join two modes in the PRE graph if

$ sup_(x in J) \| omega_m \( x \) - omega_(m') \( x \) + n dot.op theta.alt \/ L_h \| lt.eq Xi \/ r_(v_(s_0)) quad
  upright("for some ") n in bb(Z)^(dim theta_z) \, quad \| n \|_oo lt.eq E_h . $

The CURRENT graph has the same definition with threshold $Xi \/ r_(t_(s_0))$.
  Write $cal(E)_h \( m \)$, $cal(F)_h \( m \)$ for their components.
  Both graphs increase with height, because a witness $n$ at height $h$ becomes $D_(upright(s)) n$ at height $h +
  1$, provided $A_0 gt.eq D_(upright(s))$. They also increase along successive depth blocks on inherited lists.

Here are parameter choices sufficient for the arithmetic.
  Let $d_max gt.eq 2$ bound all relevant dimensions, set $Delta = 10$, and put

$ C_(*) = \( 10 d_max D_(*) \)^(100 d_max^4) \, wide R' = ceil.l log_2 C_(*) ceil.r + 2 Delta + 10 . $

Choose the largest height $J_(*)$, with $0 lt.eq h lt.eq J_(*)$,
  large compared with $delta_(*)^(- 2) d_max R' log \( 2 D_(upright(m)) \)$,
  where $D_(upright(m))$ is the main-column budget and $delta_(*) > 0$ is a sufficiently small fixed number.
  Take $A_0$ to be a sufficiently large fixed power of $C_(*) D_(upright(s))^(R') B_(*) D_(*)$, and $Xi =
  D_(*)^1000$. Choose a rational height reserve and a frequency gap with

$ cal(H) > \( d_max C_(*) E_(J_(*)) B_(*) L_(J_(*)) Q_0 Xi \)^10 \, wide cal(T) > \( d_max cal(H) \)^(C d_max^4) Xi . $

Finally choose $K$, polynomial in $P \, k$, after these logarithmic budgets,
  so the height-bin packets of [12] Lemma 3.5 and the gap $cal(T)$ fit inside a block.
  Increase it so the pre-lag Taylor errors are as small as any prescribed fixed inverse power of $D_(*)$.
  All degrees can be fixed independently of $q$.

For a primary with horizontal parameters $Theta = \( theta_v \, theta.alt \)$,
  call a block nonexceptional when every rational vector $a$ of height at most $cal(H)$ satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ \| a dot.op Theta \| lt.eq cal(T)^(- 1) \/ r_(v_(s_0)) quad upright("or") quad \| a dot.op Theta \| gt.eq
   cal(T) \/ r_(t_(s_0)) . $ <eq:tiny-huge-b>]

The height-bin proof of [12] Lemma 8.2 gives $O \( d_max \)$ exceptional blocks per primary.
  At a nonexceptional block let $K_(upright("rat"))$ be the rational span of the tiny vectors, and set $K_B =
  { w : \( 0 \, w \) in K_(upright("rat")) }$. Cramer’s rule and the choice of $cal(T)$ show that every
  height-$cal(H)$ vector in $K_(upright("rat"))$ is itself tiny.

#thm([Lemma 5.2.])[
  (Height stabilization).  #emph[For a nonexceptional primary, all but $O \( d_max R' \)$ heights $h in { 0 \,
    dots.h \, J_(*) }$ have the following property: two of its modes in one CURRENT component at height $h$ are
    directly adjacent in PRE at height $h - Delta$.]
] <lem:height-b>

#proof[
  This is [12] Lemma 8.3 with the shift lattice (5.6); we give its divisibility and size argument.
    A simple CURRENT path has at most $D_(*)$ edges. The equal quadratic coefficients of its endpoint modes and
    (5.3) yield
  $ a + \( 0 \, m_h \/ L_h \) in K_(upright("rat")) \, wide m_h in bb(Z)^(dim theta_z) \, quad \| m_h \|_oo lt.eq
    D_(*) E_h . $
  Indeed the path bounds its evaluation by $D_(*) Xi \/ r_(t_(s_0))$, and the gap forces the tiny alternative.
  Let $V_i$ be the rational span of the height-$D_(*)$ vectors $q$ for which $q + \( 0 \, m \/ L_i \) in
    K_(upright("rat"))$ with $\| m \|_oo lt.eq D_(*) E_i$. Let $U_i$ be the span of the integer vectors in $K_B$
    of size at most $C_(*)^3 D_(*) E_i$. These spaces increase.
    Discard heights below $R'$ and those where either rank changes between $h - R'$ and $h$;
    there are $O \( d_max R' \)$ such heights.
  At a remaining height, express $a in V_(h - R')$ in a defining basis $a = sum_j beta_j a_j$,
    with witnesses $m_j$. Cramer’s rule bounds the coefficients and their common denominator by $C_(*)$.
    Subtracting the relations gives
  $ m_h - D_(upright(s))^(R') sum_j beta_j m_j in K_B . $
  After clearing denominators its size is at most $C_(*)^3 D_(*) E_h$, so it lies in $U_h = U_(h - R') = : U$.
    The quotient $bb(Z)^(dim theta_z) \/ \( U ∩ bb(Z)^(dim theta_z) \)$ is free,
    since the intersection with the rational space $U$ is saturated. In an integer basis of this quotient,
  $ \[ m_h \] = D_(upright(s))^(R') sum_j beta_j \[ m_j \] . $
  For each prime $p divides D_(upright(s))$, every integral coordinate on the right has valuation at least $R'
    v_p \( D_(upright(s)) \) - log_2 C_(*) gt.eq Delta v_p \( D_(upright(s)) \)$.
    Thus $\[ m_h \]$ is divisible by $D_(upright(s))^Delta$.
  Choose an integral lift $m'$ of this quotient class divided by $D_(upright(s))^Delta$. Then
  $ m' - D_(upright(s))^(R' - Delta) sum_j beta_j m_j in U . $
  Round its coefficients in an integer spanning set for $U$ whose vectors have size at most $C_(*)^3 D_(*)
    E_(h - R')$. The adjusted lift remains integral and satisfies
  $ \| m' \|_oo lt.eq D_(upright(s))^(R' - Delta) sum_j \| beta_j \| thin \| m_j \|_oo +
    d_max C_(*)^3 D_(*) E_(h - R') lt.eq E_(h - Delta) . $
  The last inequality follows from the stated fixed-power choice of $A_0$.
    No lattice basis or covolume estimate is involved. Since $m_h - D_(upright(s))^Delta m' in K_B$,
    the vector $a + \( 0 \, m' \/ L_(h - Delta) \)$ belongs to $K_(upright("rat"))$ and remains within the height
    reserve. It is tiny by (5.7), which gives the required PRE edge. ◻
]

We now specify the remaining output imported from [12] Section 8.
  Write $pi \( cal(D) \)$ for the primary labels represented in a set $cal(D)$ of modes.
  A mode is good at height $h gt.eq Delta$ when

$ ⌊log_1.1 \| pi \( cal(E)_(h - Delta) \( m \) \) \|⌋ = ⌊log_1.1 \| pi \( cal(F)_h \( m \) \) \|⌋ $

and at least nine tenths of the primaries in $cal(F)_h \( m \)$ are nonexceptional and satisfy Lemma 21 at $h$.
  Heights below $Delta$ are bad. Call a mode core if it is bad at at most $delta_(*) \( J_(*) + 1 \)$ heights;
  call every other mode a linear-side mode. The increasing graphs and height stabilization give the coherence of
  these predicates, the bad-density count, and hereditary representatives by exactly [12] Lemmas 8.4–8.8,
  Proposition 8.9, and Lemma 8.10. Those arguments use component inclusion, cardinality, projections,
  and the rational gap; their coordinate inputs have all been established above.
  A minimal PRE or CURRENT component means a component at height zero.
  Good modes in a CURRENT component have one PRE predecessor at height $h - Delta$.
  Moreover, core modes in one minimal CURRENT component have identical good-height predicates throughout the upper range

$ cal(H)_(upright("up")) = { h in bb(Z) : ceil.l 4 delta_(*) J_(*) ceil.r lt.eq h lt.eq J_(*) } . $

Each core mode has bad fraction at most $2 delta_(*)$ in this range.

We also record the decomposition of the original localized outputs.
  Let $Z_(l \, G \, s)$ be the current augmented output in role $l$.
  For a basic-$B$ role in the block beginning at $s_0$, put

$ tilde(Z)_(l \, G \, s_0) = cal(R)_(l \, G) Z_(l \, G \, u_(s_0)) . $

Let $A_(l \, G \, s_0)$ and $V_(l \, G \, s_0)$ be its exact core and linear-side mode subtotals,
  with all private coordinates retained. Define the full side by

$ S_(l \, G \, s) = Z_(l \, G \, s) - Z_(l \, G \, u_(s_0)) + V_(l \, G \, s_0) wide \( s_0 lt.eq s < s_0 + K \) . $

In a basic-$U$ role set $S_(l \, G \, s) = Z_(l \, G \, s)$ and $A_(l \, G \, s_0) = cal(E)_(l \, G \, s_0) = 0$.
  On physical components these definitions give

$ Z_(l \, G \, s) = A_(l \, G \, s_0) + S_(l \, G \, s) + cal(E)_(l \, G \, s_0) . $

For a basic-$B$ role, the physical error is

$
  cal(E)_(l \, G \, s_0) = \( Z_(l \, G \, u_(s_0)) \)_(upright("phys")) - \( tilde(Z)_(l \, G \,
  s_0) \)_(upright("phys")) . $

The offsets can be fixed so that every term containing this physical error is negligible.
  The explicit lift, applied to $Z_(l \, G \, u_(s_0)) = sum_Phi beta_Phi Phi$, gives

$ cal(E)_(l \, G \, s_0) = \( 1 - \( zeta^rho \)^2 \) \( Z_(l \, G \, u_(s_0)) \)_(upright("phys")) -
  sum_Phi beta_Phi q_Phi . $

The main coefficients and original actual-use cells were fixed before the offsets.
  Their coefficient, size, and path-count bounds, together with the cutoff expectation,
  imply the error estimate from [12] Section 8, subsection on fixing offsets:

$ bb(E)_rho sum_(l \, G \, I med upright("used")) \| I \| thin parallel cal(E)_(l \, G \, s_0 \( I \))
  parallel_(2 \, I)^2 lt.eq D_(upright(m))^C d_max delta_c \| R \| . $

With $delta_c$ chosen this small in the main budget, fix offsets satisfying this bound.
  All later selections only remove nonnegative terms; they need not be independent of the offsets.
  The linear-side square estimate is uniform in the offsets.
  The local absolute $L^2$ form bound and Cauchy–Schwarz therefore make the terms containing $cal(E)$ negligible,
  after the same size stops as in H. This explains why the subsequent estimates may use the exact core and
  full-side arguments.

Here are the quantitative conclusions used below. A successful CURRENT component contains a good core mode,
  whose PRE component at $h - Delta$ is its uniquely determined good predecessor.
  For fixed height, role, group, and the pair of floor logarithms of the predecessor’s primary and mode counts,
  choose a representative mode inherited under predecessor inclusion.
  On comparable actual use cells $I \, I'$, distinct representatives satisfy H(25), namely

#[#set math.equation(numbering: n => "(5.8)")
 $ \| omega_a \( x_(*) \) - omega_(a') \( x_(*) \) + n dot.op theta.alt \/ L_h \| > Xi /
   2 max \( \| I \|^(- 1) \, \| I' \|^(- 1) \) \, wide \| n \|_oo lt.eq E_h \, $ <eq:representative-separation-b>]

for $x_(*) in I ∩ I'$. On an actual cell, a successful component $cal(F)$ has amplitude

$ sigma_(cal(F))^2 =
  sum_(cal(D) subset.eq cal(F)) (parallel A_(cal(D)) parallel_(2 \, I) + D_(*)^(- 30) sum_(m in cal(D)\
m med upright("core")) \| alpha_m \|)^2 . $

Here $cal(D)$ runs over minimal CURRENT components, $A_(cal(D))$ is the full core subtotal in the augmented mode
  space, and $alpha_m$ is its frozen mode coefficient. This is H(26);
  the added coefficient terms absorb uniform Taylor and Fourier errors.

The Bessel estimates and bad-density count give H(17):

$ sum_(G \, s_0) parallel V_(l \, G \, s_0) parallel_2^2 lt.eq G_0 \| R \| \, wide G_0 =
  exp #scale(x: 120%, y: 120%)[\(] C_(q \, b) \( 1 + log \( 2 k \) \)^C #scale(x: 120%, y: 120%)[\)] . $

This is the square hypothesis needed for the side estimates following Proposition 20.
  After the stopping construction of [12] Proposition 8.12,
  the representatives occurring in a dyadic amplitude bin $sigma_j$ along a retained path satisfy H(28):

#[#set math.equation(numbering: n => "(5.9)")
 $ sum_G \| cal(A)_j^G \| lt.eq min \( D_(*) \, P^C sigma_j^(- 2) \) \, wide
   sum_(s \, G) parallel S_(l \, G \, s) parallel_(2 \, I_s)^2 lt.eq P^C . $ <eq:core-path-budgets-b>]

Here $cal(A)_j^G$ is the set of distinct representative labels in that bin.
  All local side and component sizes are at most $P^C$.

For scheduled inputs, these statements are used in the form proved in [13] Section 6.3–6.4, especially Lemma 6.3.
  The rows are cell-local projections composed with the fixed bounded lift $cal(R)_(l \, G)$.
  Their ordinary Bessel estimates come from the separated mode construction,
  and their adjoint main ranges lie in the usable endpoint spaces established by localization.
  V evaluates the depth input after the final main basic projection.
  Its row composition result therefore applies to the same size, variation, reading-depth,
  and endpoint hypotheses. In particular, the possibly large mode budget $D_(*)$ is not inserted into the strong
  square constant $G_0$. This is the distinction required by V’s side estimate and by the final choice of $q$.

=== 5.3 The side estimate and the near-band gain <the-side-estimate-and-the-near-band-gain>

We now estimate the contribution of the full sides to the cell minimum in (4.7).
  The input is the localized expression (4.13), its outgoing-filter identity,
  the endpoint variation estimate (4.14), and the linear-side square bound H(17).
  These are precisely the hypotheses of [12] Proposition 7.5;
  for scheduled inputs their counterparts are assembled in [13] Section 6.5.

Expand each localized argument into its core, full side, and negligible physical error.
  Terms with at least three side factors have a length-weighted $p$-power bound $P^C \| R \|$,
  for any fixed $2 \/ 3 < p < 1$. Indeed Cauchy–Schwarz first sums the group index in two side roles;
  writing the three resulting square sizes as $a_s \, b_s \, c_s$, their contribution is bounded using

$ sum_s \( a_s b_s c_s \)^p lt.eq (sum_s a_s^2)^(p \/ 2) (sum_s b_s^2)^(p \/ 2) (sum_s c_s^2)^(p \/ 2) . $

This uses $3 p > 2$ and the retained path caps; the fourth argument uses its $P^C$ size bound.
  The group sum is formed before the power is taken.

In a term with exactly two sides, restore its two core complements to the whole current arguments
  $Z_(c \, G \, s) \, Z_(d \, G \, s)$. The corrections have a third side.
  The outgoing-filter identity then removes the complementary projections one at a time,
  transferring helper averages to one side, say role $a$. Its main term is

$ H_I \( cal(D)_(a \, s) S_(a \, G \, s) \, S_(a' \, G \, s) \, B_c \, B_d \) \, $

where $cal(D)_(a \, s)$ is the resulting product of helper averages.
  Restoring the full base pair $Y_c \, Y_d$ introduces another third-side error.
  The pair-smallness from the base reduction bounds this main term by $eta$ times the two side sizes.
  Summing costs at most $eta P^C \| R \|$.

At one transfer step, use the outgoing and helper bands defined in (4.15),
  with these two full sides as its fixed side operands. The exact outgoing-minus-helper defect is (4.16).
  Its far bands have negligible error. For each remaining offset $h$, $\| h \| lt.eq 2$,
  the retained expression (4.17) has coefficient $- h \/ P = O \( P^(- 1) \)$.
  Its paired sum over the band index must remain inside the cell contribution.

Freeze the complementary band stack and the other complementary argument at the block’s first depth.
  Their differences from current values have square budgets by (4.14).
  Freeze errors therefore supply a third strong factor and have the preceding $p$-power bound.
  The same argument handles cells where a frozen complement has large size:
  its difference from its bounded current value is then large.
  On the remaining ancestor hulls inside a block, both frozen complements have bounded local $L^2$ size.

The binary-prefix decomposition in [12] Lemma 7.4 now writes the two varying sides, at their uses,
  as selections from fixed vector stacks. The terminal complementary band $1 -
  Q_(c \, P)$ is first split into the identity and a positive ball term.
  Positive outer-ball ranges have joint group budgets, whereas group-independent identity and cumulative histories
  are counted once rather than once per group. This convention is needed for the following stack energies.
  One stack includes the band index. There are only $G_0$ overhead factors.
  Individual pad choices stay inside the actual positive averaged operators:
  a choice is coupled across depths, and Jensen’s inequality restores the average after estimating it.
  They are not additional stack configurations. The stack energies satisfy H(18):

$ sum_nu parallel upright(bold(A))_nu parallel_2^2 lt.eq P G_0 \| R \| \, wide
  sum_nu parallel upright(bold(B))_nu parallel_2^2 lt.eq G_0 \| R \| . $

Here $nu$ records the group, block, and fixed stack configuration.
  The functions remain fixed after subsequent cuts. Independent Rademacher signs select the two position indices,
  and a third family matches the band in $upright(bold(A))_nu$ with the frozen complementary band stack.
  Iterated Khintchine gives the moment hypothesis of Proposition 20.

For precision, the passage from these energies to a sum of local stack sizes uses the common hull cuts of [12]
  Section 7. A hull consists of all ancestors between a use and its maximal use cell,
  including their full intervals. Write $Omega_nu$ for the union of the original use cells.
  The main path and catalog counts give $sum_nu \| Omega_nu \| lt.eq M_0 \| R \|$, with $log M_0 lt.eq
  "poly"_(q \, b) \( k \)$. For a family of total stack energy at most $E \| R \|$,
  write $tilde(m)_nu$ for its full hull maxima. They obey

$ sum_nu \| { x : tilde(m)_nu \( x \) > T } \| lt.eq min \( M_0 \| R \| \, C E \| R \| \/ T \) . $

Stopping at level $C_1 E$ and integrating up to that level costs at most $C E \( 1 + log \( 2 + C_1 M_0 \) \) \|
  R \|$. Thus only a main-budget logarithm enters $G_0$. For the retained hull define

$ m_(A \, nu) \( x \) = sup_(I med upright(i n med t h e med r e t a i n e d med h u l l)\
x in I) frac(1, \| I \|) integral_I parallel upright(bold(A))_nu \( y \) parallel^2 thin d y \, $

with value zero for an empty supremum; define $m_(B \, nu)$ in the same way.
  The weak $L^1$ estimate for the dyadic maximal function, followed by truncation and integration,
  gives common individual cuts; Markov’s inequality for the truncated sum gives the joint cuts for which these
  squared hull maxima satisfy

$ sum_nu m_(A \, nu) lt.eq P G_0 \, wide sum_nu m_(B \, nu) lt.eq G_0 . $

The removed roots have arbitrarily small fixed total relative length.
  They are first crossings of partial ancestor quantities, so retained caps hold on whole intervals even in
  branches containing a later cut. A sparse decomposition of each retained hull into tree pieces gives disjoint
  major subsets of the piece roots. If $a_Q \, b_Q$ are the two normalized stack sizes at such a root, then

$ sum_(nu \, Q) \| Q \| a_Q b_Q lt.eq C integral_R sum_nu sqrt(m_(A \, nu) m_(B \, nu)) lt.eq P^(1 \/ 2) G_0 \| R \| . $

Complete each piece by its boundary children. The two side stacks then have the required leaf-size bounds,
  and the frozen complements have bounded leaf sizes. Proposition 20 applies to at most $K$ depths of each piece.
  Multiplying by the transfer coefficient $O \( P^(- 1) \)$ yields the near-band bound

#[#set math.equation(numbering: n => "(5.10)")
 $ \( 1 + C_N \( q \) \) C_(q \, b) P^(- 1 \/ 2) G_0 \( K + 2 \)^(C_19 \( q - 2 \)) \| R \| . $ <eq:near-band-b>]

The logarithmic factor of the short-block estimate is included in $G_0$.
  Arbitrary signs at the original cells are allowed, so this is an absolute estimate for their coupled band
  contributions. No absolute sum over individual paired band indices has been used.

Thus [12] Proposition 7.5, with the coefficient-dependent comparison now proved,
  gives a complete conditional side bound. Third-side and freeze errors have $p$-power cost $P^C \| R \|$;
  transferred main terms have absolute cost $eta P^C \| R \|$; the remaining near bands satisfy (5.10).
  Applying $min \( eta \, x \) lt.eq eta^(1 - p) x^p$ only to the powered terms gives their contribution
  $C_(q \, b) eta^epsilon P^C \| R \|$, with $epsilon = 1 - p > 0$.
  All cuts remove original summands at first crossings and the data are reconstructed on each normalized subroot.
  This is the root-uniform side estimate used in the closing argument.
  The scheduled version follows from the same fixed stacks and the row estimates already stated, as in [13] Section 6.5.

=== 5.4 Frequency tests for three or four core arguments <frequency-tests-for-three-or-four-core-arguments>

Fix a retained path point $x_(*)$, an actual cell $I = I_s$ with $r = \| I \|$, a group,
  and a common successful height $h in cal(H)_(upright("up"))$ for the core arguments. Put $R_s = r^(- 1)$ and

$ xi = theta.alt \/ L_(h - Delta) \, wide gamma_j^(*) = omega_(a_j) \( x_(*) \) \, wide B'_h = D_(*)^5 E_(h - Delta) . $

The representative $a_j$ belongs to the good predecessor of the component in role $j$.
  Summing a PRE path and using the pre-lag Taylor bound expresses its selected physical argument,
  up to the controlled uniform error, as

$ e \( c_j p^(rho_j) \( y_j \) \) e \( gamma_j^(*) \( y_j - x_(*) \) \) g_j \( xi \( y_j - x_(*) \) \) . $

The function $g_j$ is a cutoff times a trigonometric polynomial.
  After collecting the common multiplier (5.4), all Fourier indices in any anchor coordinates lie in the box of
  radius $B'_h$, enlarged by fixed factors depending on $b$.
  This is H(29) with its complete coefficient-sum and error bounds.

To compare physical and torus amplitudes, take the horizontal tiny space $K_B$ of a nonexceptional primary in a
  successful component, and let

$ bb(H) = \( K_B ∩ bb(Z)^(dim theta_z) \)^perp subset.eq bb(T)^(dim theta_z) . $

This is a connected torus because the integer lattice being annihilated is saturated.
  The tiny/huge alternative makes physical interval averages of the relevant characters agree with Haar averages
  on $bb(H)$, to the prescribed small error. The component floors above absorb those errors, giving H(30):

$ a'_j := parallel g_j parallel_(L^2 \( bb(H) \)) lt.eq C_b
  [sum_(cal(D) med upright("selected")) (parallel A_(cal(D)) parallel_(2 \, I) + D_(*)^(- 30) sum_(m in cal(D)\
m med upright("core")) \| alpha_m \|)^2]^(1 \/ 2) lt.eq C_b sigma_(cal(F)_j) . $

The selected sets are whole minimal CURRENT subtotals, by coherence of the height predicates on
  $cal(H)_(upright("up"))$. For distinct roles, $u + \( b_j - b_(l') \) v$ and $u + \( b_i - b_(l') \)
  v$ have independent Haar distributions on $bb(H)^2$. Interpolating the six two-$L^1$ bounds gives

#[#set math.equation(numbering: n => "(5.11)")
 $ integral_(bb(H)^2) product_j \| g_j \( u + \( b_j - b_(l') \) v \) \| thin d u thin d v lt.eq
   product_j a'_j . $ <eq:core-haar-b>]

A bounded progression multiplier changes only the constant.

For four core roles put

$ Q = sum_j gamma_j^(*) \, wide T = sum_j b_j gamma_j^(*) . $

Choose, by a fixed rule independent of the mode masks, a reference $q' = Q + n dot.op xi$, $t' = T +
  m dot.op xi$ in the full Fourier box with $max \( \| q' \| \, \| t' \| \) lt.eq U_0 R_s$, where $U_0 =
  D_(*)^250$. Introduce dyadic parameters by

#[#set math.equation(numbering: n => "(5.12)")
 $ mu asymp min (1 \, min_j frac(\| t' - b_j q' \|, R_s)) \, wide
   nu asymp max (1 \, frac(\| q' \|, R_s) \, frac(\| t' \|, R_s)) . $ <eq:four-core-test-b>]

Discard absent references and inner minima below $U_0^(- 1)$.
  The four marginals of the normalized kernel make its Fourier transform vanish on $t' = b_j q'$.
  The mean value theorem near these lines and rapid Fourier decay give $C_(L \, b) mu
  nu^(- L)$ for every fixed $L$. The tiny/huge dichotomy puts all moderate frequencies in one pair of character
  cosets modulo $K_B$; summing that pair of cosets is a Haar integral bounded by (5.11).
  Thus its contribution is at most $C_(L \, b) mu nu^(- L) product_j a'_j$.

For three core roles with side role $l$, anchor at $y_l$ and put

$ Q = sum_(j eq.not l) gamma_j^(*) \, wide T_l = sum_(j eq.not l) \( b_j - b_l \) gamma_j^(*) . $

Choose a moderate reference $T_l + m dot.op xi$ and write $beta = r \( T_l + m dot.op xi \)$.
  Set $mu asymp min \( 1 \, \| beta \| \)$, $nu asymp max \( 1 \, \| beta \| \)$,
  with the same small and large discards. Partial Fourier integration of the kernel in the step variable gives a
  function $W_beta$ whose fixed-order derivatives are bounded by $C_(L \, b) mu nu^(- L)$.
  At zero this uses the $l$-marginal; at large frequency it uses integration by parts.
  Duality in (5.11) bounds the remaining horizontal coefficient sequence in $ell^2$.

More explicitly, average a fresh offset cutoff $zeta^(rho_l) \/ c_zeta$ in the side, where $c_zeta =
  bb(E)_(rho_l) zeta^(rho_l) gt.eq 1 \/ 2$ is constant. This insertion is an exact identity in expectation.
  Keep the bounded factor $c_zeta^(- 1)$ outside the estimate and set $S' =
  zeta^(rho_l) e \( - c_l p^(rho_l) \) S_(upright("phys"))$ on $I$.
  Its normalized $L^2$ norm is at most that of the side. Write $hat(S)'_I \( k' \)$ for its normalized Fourier
  coefficients. The horizontal pairings decay in $\| k' + r \( Q + n dot.op xi \) \|$.
  Schur’s estimate on a dyadic shell of radius $Lambda$, followed by averaging the fresh offset, gives H(32) with

#[#set math.equation(numbering: n => "(5.13)")
 $ b_Lambda^2 = bb(E)_(rho_l) sum_(k' in bb(Z) :\
\| k' + r \( Q + n dot.op xi \) \| lt.eq 2 Lambda med upright("for some") med n \,\
\| n \|_oo lt.eq B'_h) \| hat(S)'_I \( k' \) \|^2 . $ <eq:side-windows-b>]

The contribution is bounded by $C_(L \, b) mu nu^(- L) product_(j eq.not l) a'_j sum_(1 lt.eq Lambda lt.eq U_0)
  Lambda^(- L) b_Lambda$, where the sum is dyadic. Notice that the windows use the whole Fourier box and are
  independent of the mode masks.

The error estimates in [12] Section 9.1–9.2 now apply with these explicit tests.
  They use the absolute local form estimate, Fourier tails, the pre-lag, and the rational gap,
  all with reserves already chosen above. Per tuple the error is bounded by a fixed multiple of $D_(*)^(- 100)$
  times the absolute core coefficient sums, and by the side size if a side is present.
  The common-height argument samples heights independently and uniformly from $cal(H)_(upright("up"))$ until all
  roles are good; its first-success weights sum to one on each pure tuple.
  A core mode has bad fraction at most $2 delta_(*)$, so the sum over failure assignments converges.
  Consequently these errors sum absolutely to $O \( e^(- k) \| R \| \)$,
  and the principal cell terms have the form H(33):

#[#set math.equation(numbering: n => "(5.14)")
 $ C_(L \, b) mu nu^(- L) Lambda^(- L) (product_(j = 0)^3 sigma_j) N_s^G . $ <eq:tested-cell-b>]

Here the $sigma_j$ are dyadic component-amplitude bins, with the side bin belonging to $b_Lambda$;
  $N_s^G$ counts the representative tuples passing the tests. For four cores, $Lambda = 1$.
  We next bound these counts across scales.

=== 5.5 Sparse mass for separated tests <sparse-mass-for-separated-tests>

The finite counting statement is useful independently of the mode construction.
  Its integer divisibility is the reason for the choice (5.5).

#thm([Lemma 5.3.])[
  (Sparse mass).  #emph[Let $J subset.eq { 0 \, 1 \, 2 \, 3 }$ consist of three or four core roles.
    In each role let a finite label set $cal(A)_i$ be identified injectively with real numbers,
    with $\| cal(A)_i \| lt.eq M$, $M gt.eq 1$. Let $d gt.eq 0$ be an integer.
    Fix $zeta in bb(R)^d$, $B \, L gt.eq 1$, $Q \, Sigma \, R_0 > 0$, and $0 < mu lt.eq 1 lt.eq nu$.
    Every shift vector below belongs to $bb(Z)^d$. For finitely many distinct integers $s$,
    at dyadic scales $R_s = R_02^s$, let $cal(E)_s subset.eq product_(i in J) cal(A)_i$ and $N_s = \|
    cal(E)_s \|$. Assume the following five conditions.]
  + #emph[Two labels in different core roles determine at most one full tuple,
    and that pair occurs at at most $L$ scales.]
  + #emph[If there is a side role, there are $w_s gt.eq 0$, $sum_s w_s lt.eq M$,
    such that every fixed core label is incident to at most $w_s$ tuples at scale $s$.]
  + #emph[Distinct same-role labels occurring at scales $s \, t$ satisfy
$ \| a - a' + n dot.op zeta \| > Sigma max \( R_s \, R_t \) quad \( \| n \|_oo lt.eq Q \) . $

]
  + #emph[For every triple $T subset.eq J$, with excluded role $l' in { 0 \, 1 \, 2 \, 3 } \\ T$ and $alpha_i =
    b_i - b_(l')$, each tuple has a witness $\| n \|_oo lt.eq B$ such that
$ mu R_s lt.eq lr(|sum_(i in T) alpha_i a_i + D_(upright(s))^2 n dot.op zeta|) lt.eq nu R_s . $

]
  + #emph[At every occupied scale, $\| n dot.op zeta \| in.not \[ mu R_s \/ 1000 \, 1000 nu R_s \]$ for all $\|
    n \|_oo lt.eq Q$.]
  #emph[There are constants $C_b \, C_(upright("res") \, b)$ such that, if
$ Q gt.eq C_(upright("res") \, b) \( d + 1 \)^2 B \, wide Sigma gt.eq C_(upright("res") \, b) \( d + 1 \)^2 nu \, $

 then, with $ell = 1 + log_2 \( 2 + \( d + 1 \)^2 nu \/ mu \)$,
$ sum_(s : N_s lt.eq delta M^2) N_s lt.eq C_b ell L^29 delta^(1 \/ 2080) M^2 wide \( 0 < delta lt.eq 1 \) . $

 The exponents and constants are independent of the dimension and the number of labels and scales,
   apart from the indicated factors.]
] <lem:sparse-b>

#proof[
  We follow the finite argument of [12] Lemma 9.1, spelling out the arithmetic and the dimension dependence.
    The proof first covers most label differences by neighborhoods associated with later scales.
    Three such future covers then place sums of triples in a thin slab.
    Separated anchor labels reduce that slab’s cover from three factors of $M$ to two,
    while the pure-shift gap makes many translated triples distinct inside the cover.
    This comparison forces small mass at sparsely occupied scales.
  Approximate all finite real data on a sufficiently fine common grid,
    taking approximants on a fixed divisible multiple of its step so divisions by the $alpha_i$ remain on the
    grid. For example, a multiple of $D_(upright(s))^2$ suffices.
    Choosing the grid after the data preserves separation and annular inequalities with fixed relaxed margins and
    leaves a narrower pure-shift gap. Round scalar widths upward by at most one grid step.
    The estimates below are uniform in that step.
  Restrict to $N_s lt.eq delta M^2$. Pair determination gives total mass at most $L M^2$.
    For parameters $delta lt.eq alpha \/ 2$ and $0 < kappa < 1$,
    greedily partition the scales in decreasing order of $R_s$ into counting blocks of mass at most $alpha M^2$.
    There are at most $J_0 = 3 L \/ alpha$ blocks. For a block $frak(b)$,
    let $R_(frak(b))^(+)$ be its largest scale, take $N_0 = ceil.l C_b B ceil.r$ with $C_b > 32 D_(upright(s))$,
    and choose a grid width $epsilon.alt_(frak(b)) asymp nu R_(frak(b))^(+)$. Use the finite neighborhoods
  $ U_(frak(b)) \( t \) = { D_(upright(s)) n dot.op zeta + u : \| n \|_oo lt.eq t N_0 \, med
    u upright(" on the grid") \, med \| u \| lt.eq t epsilon.alt_(frak(b)) } . $
  They are symmetric and satisfy $U \( t \) + U \( t' \) subset.eq U \( t + t' \)$.
  Fix a role and a counting block with uncovered mass exceeding $kappa M^2$.
    Project onto this role and another core role, retaining one scale witness per pair,
    and color edges by a third core label. The graph has at least $\( kappa \/ L \)
    M^2$ edges and a proper coloring with at most $M$ colors.
    The elementary four-step-walk observation in the proof of [12] Lemma 9.1 gives a subset $B_0$ of at least $c
    eta M$ vertices, $eta = kappa \/ L$, such that any two have at least $c eta^5
    M^3$ four-step walks with distinct ordered color tuples. Repeated vertices are allowed.
    That observation is purely a graph statement: choose a random neighborhood,
    remove vertices with many low-codegree partners, and count the two choices of a common neighbor on either side
    of a retained midpoint.
  Alternating the four annular relations along a walk cancels the intermediate labels.
    Dividing by the nonzero integer $alpha_i$ gives
  $ a - a' in q \( c_1 \, c_2 \, c_3 \, c_4 \) + U_(frak(b)) \( 1 \) . $
  Here $q$ depends only on the ordered four edge colors; these $c_i$ are graph colors,
    unrelated to the fixed quadratic weights. The scalar error after division is at most $4 nu R_(frak(b))^(+)$,
    and $D_(upright(s))^2 \/ alpha_i$ is an integer multiple of $D_(upright(s))$, with its index covered by $N_0$.
    Packed differences outside $U_(frak(b)) \( 2 \)$ cannot use the same color tuple.
    The $M^4$ possible color tuples therefore bound their number by $C eta^(- 5) M$.
    Repeating after removing $B_0$ covers all but $kappa M^2$ occurrences in each role and block by at most $K_1 =
    C \( L \/ kappa \)^6$ subsets, each with its difference set covered by $K_1 M$ translates of $U_(frak(b)) \( 2 \)$.
  Discard uncovered occurrences. Call a core label future when it belongs to a cover subset in a later counting
    block. Nonfuture label sets are disjoint over blocks. Let $m_i^(frak(b))$ be their cardinalities in core role
    $i$. Treat the side as nonfuture, with $m_l^(frak(b)) = sum_(s in frak(b)) w_s$.
    Occurrences with fewer than three future roles have two nonfuture roles.
    Their total mass is at most $C sqrt(L alpha) M^2$, by summing
    $min \( alpha M^2 \, L m_i^(frak(b)) m_j^(frak(b)) \)$ and Cauchy–Schwarz.
    The discarded uncovered mass is at most $4 J_0 kappa M^2$.
  Assign each remaining occurrence three future roles and one future cover subset in each.
    A class fixes its current counting block and its three future block/subset choices.
    There are at most $4 J_0^4 K_1^3$ classes. Fix one of mass $rho M^2$, with future subsets $B_1 \, B_2 \, B_3$.
    The subscripts now enumerate those roles; their coefficients remain the corresponding $alpha_i$.
    Set $Gamma = C_(upright("gap") \, b) \( d + 1 \)^2 nu \/ mu$. If $rho lt.eq C_b delta ell$, retain this bound.
    Otherwise split the mass into four consecutive ranges by quartiles,
    omitting the at most three scale bins crossing a cut. Each range retains at least $rho M^2 \/ 8$ mass.
    The first provides anchor sets $B_(i 0) subset B_i$ of size at least $c rho M \/ L$.
    Let $R^(\#)$ be the largest scale of the second range; these anchors are separated modulo reserved shifts at
    scale $R^(\#)$. The fourth range gives a set $F$ of at least $c rho M^2 \/
    L$ distinct triples projected onto these three roles. The third range supplies the scale margin,
    and a greedy thinning of the second gives $q gt.eq c_b rho \/ \( delta ell \)$ triples $t_v$,
    also projected onto these roles, at scales separated by factors at least $Gamma$.
    All future-block scales and fourth-range scales are smaller than these by at least the required factor $Gamma$.
  Write $U_i$ for the neighborhoods of the three future subsets.
    Subdividing index and scalar intervals covers $U_i \( t \)$ by at most $\( 2 t + 1 \)^(d + 1)$ translates of
    $U_i \( 1 \)$. Hence there is an odd $H_i lt.eq 100 \( d + 1 \)^2$ with $\| U_i \( H_i + 2 \) \| lt.eq
    2 \| U_i \( H_i \) \|$. The preliminary exponential cover is used only to find this small-growth index,
    and is never paid in the cardinality estimate. The translates $a + U_i \( H_i \)$, $a in B_(i 0)$,
    are disjoint: an intersection would contradict the anchor separation with a shift index
    $O_b \( \( d + 1 \)^2 B \)$ and scalar error $O_b \( \( d + 1 \)^2 nu R^(\#) \)$.
  Set $Z_i = B_(i 0) + U_i \( H_i \)$. The difference covers give $\| Z_i - B_i \| lt.eq
    C \( K_1 L \/ rho \) \| Z_i \|$. Choose a nonempty $X_i subset Z_i$ minimizing $r_i = \| X_i -
    B_i \| \/ \| X_i \|$. Petridis’s minimal-growth subset argument, in the form reproduced in [12] Lemma 9.1,
    gives $\| X_i - m B_i \| lt.eq r_i^m \| X_i \|$. One anchor translate contains a subset $Y_i subset.eq
    X_i$ of at least $\| X_i \| \/ M$ points. If $cal(P) subset.eq m
    B_i$ has all distinct differences outside $U_i \( 2 H_i \)$, the sets $Y_i - p$, $p in cal(P)$,
    are disjoint and lie in $X_i - m B_i$. Thus $\| cal(P) \| lt.eq r_i^m M$.
    A maximal packing covers $m B_i$ by that many translates of $U_i \( 2 H_i \)$. Only $m = 2 \, 3$ is used.
  The outputs $t_v + F$ lie in the slab
  $ \( x_1 \, x_2 \, x_3 \) in 2 B_1 times 2 B_2 times 2 B_3 \, wide
    lr(|sum_i alpha_i x_i + D_(upright(s))^2 n dot.op zeta|) lt.eq 2 nu R^(\#) \, quad \| n \|_oo lt.eq 2 B . $
  Put $r_0 = C K_1 L \/ rho$. Cover the first two sumsets by $r_0^2 M$ boxes each.
    Above a fixed pair, dividing the slab equation by $alpha_3$ places the third coordinate in
  $ c + { n dot.op zeta : \| n \|_oo lt.eq C_b \( d + 1 \)^2
    B } + \[ - C_b \( d + 1 \)^2 nu R^(\#) \, C_b \( d + 1 \)^2 nu R^(\#) \] . $
  Every shift remains integral: both $D_(upright(s))^2 \/ alpha_3$ and $D_(upright(s)) alpha_i \/
    alpha_3$ are integers. If $cal(P)$ is a packing of the local third-coordinate set outside $U_3 \( 2 H_3 \)$,
    then $B_30 + cal(P) subset 3 B_3$ is still a packing. Collisions with different anchors are excluded by the
    same shift and scalar bounds. Thus $\| B_30 \| thin \| cal(P) \| lt.eq r_0^3 M$.
    The entire slab is covered by at most $C K_1^7 \( L \/ rho \)^8 M^2$ product boxes.
  Each such box contains at most one of the indexed outputs $t_v + F$.
    Within one translation this follows from label separation.
    Across translations, let $R_(upright("big"))$ be the larger selected scale.
    Its annular residual has magnitude at least $mu R_(upright("big"))$;
    the other three residuals together are at most $mu R_(upright("big")) \/ 10$.
    Membership in one box adds scalar error at most $C_b \( d + 1 \)^2 nu max_i R_(upright("future") \, i)^(+)
    lt.eq mu R_(upright("big")) \/ 10$, by the choice of $C_(upright("gap") \, b)$.
    The resulting pure shift has magnitude between $4 mu R_(upright("big")) \/ 5$ and $3 nu R_(upright("big"))$,
    with index $O_b \( \( d + 1 \)^2 B \) lt.eq Q$, contradicting the forbidden gap.
  Comparing $q \| F \|$ with the slab cover yields $rho^10 lt.eq C_b delta ell K_1^7 L^9$, and hence $rho lt.eq
    C_b ell K_1 L delta^(1 \/ 10)$. Including all choices and losses gives
  $ M^(- 2) sum_(s : N_s lt.eq delta M^2) N_s lt.eq
    C_b (frac(L kappa, alpha) + sqrt(L alpha) + ell L^29 alpha^(- 4) kappa^(- 24) delta^(1 \/ 10)) . $
  Take $alpha = delta^(1 \/ 1040)$, $kappa = alpha^2$ for sufficiently small $delta$,
    and use the crude mass bound for the remaining values. This proves the stated exponent $1 \/ 2080$. ◻
]

=== 5.6 Application of the count and the resulting core bound <application-of-the-count-and-the-resulting-core-bound>

We verify the hypotheses rather than apply the original arithmetic form of [12] Proposition 9.2.
  Fix a path, height, role types, frequency bands, and amplitude bins in (5.14).
  Identify each representative label with its value $omega_a \( x_(*) \)$,
  which is injective in a fixed role and type by (5.8). Define

$ M_i^G = \| cal(A)_i^G \| quad upright("for core roles") \, wide M_l^G =
  sigma_l^(- 2) sum_s parallel S_(l \, G \, s) parallel_(2 \, I_s)^2 quad upright("for a side") \, wide M' =
  max_i M_i^G . $

Groups with a nonzero count have $M' gt.eq 1$.

Two fixed core labels determine the others. For four cores, subtract the equations for $Q \,
  T$ of two candidate tuples. The two unknown label differences solve a system with determinant $b_j - b_i$,
  modulo bounded rational shifts and errors $O_b \( nu max \( R_s \, R_t \) \)$.
  For three cores the equation for $T_l$ determines the last label, dividing by $b_j - b_l$.
  The shift reserve and separation force these differences to vanish.
  For every core triple with excluded role $l'$, the tests also give the annulus

#[#set math.equation(numbering: n => "(5.15)")
 $ c_b mu R_s lt.eq lr(|sum_i \( b_i - b_(l') \) omega_(a_i) \( x_(*) \) + n dot.op xi|) lt.eq C_b nu R_s \,
   wide \| n \|_oo lt.eq C_b B'_h . $ <eq:annulus-application-b>]

For four cores this is $t' - b_(l') q'$; for three it is the $T_l$ test.
  Once the labels are fixed, the height-bin lemma [12] Lemma 3.5 bounds their scale occurrences by $L_0 lt.eq
  P^C \( 1 + log \( nu \/ mu \) \)^C$.

If one role is a side, windows (5.13) for different triples incident to a fixed core label are disjoint.
  An overlap gives both a relation for their $Q$ values with error $O \( Lambda R_s \)$ and their two $T_l$
  relations. Solving the resulting two-by-two system again divides by a $b_j - b_i$;
  separation then identifies the tuples. Couple the fresh offset across these windows.
  Parseval shows their incidence count is at most $w_s = sigma_l^(- 2) parallel S_(l \, G \, s)
  parallel_(2 \, I_s)^2$, giving the side-budget hypothesis.

Here are the promised reserve checks for all these divisions. In Lemma 22 take

$ zeta = xi \/ D_(upright(s))^2 = D_(upright(s))^(Delta - 2) theta.alt \/ L_h \, wide
  Q_(upright("res")) = ⌊E_h \/ D_(upright(s))^(Delta - 2)⌋ \, wide Sigma = Xi \/ 2 . $

Every divided $xi$-shift is integral in this finer lattice, because each determinant divides $D_(upright(s))$.
  The fixed-power choice of $A_0$ ensures

$ Q_(upright("res")) gt.eq C_(upright("res") \, b) \( d + 1 \)^2 C_b B'_h \, wide d = dim theta_z . $

Also $nu \, Lambda lt.eq C_b D_(*)^250$, while $Xi = D_(*)^1000$, so the separation reserve holds.
  All rational shifts remain below $cal(H)$. Every successful component contains a nonexceptional primary,
  even if its representative is exceptional. Applying (5.7) to its pure horizontal shifts excludes the entire
  intermediate interval required by the pure-shift hypothesis, since $mu gt.eq
  U_0^(- 1)$ and the interval length $\| I_s \|$ lies between $r_(t_(s_0))$ and $r_(v_(s_0))$.
  This checks all five hypotheses.

Lemma 22, pair determination, and the side incidence bound therefore give the two counts H(34):
  for some fixed $p_0 < 1$,

#[#set math.equation(numbering: n => "(5.16)")
 $ sum_s N_s^G & lt.eq L_0 min_(i eq.not j) M_i^G M_j^G \,\
sum_s \( N_s^G \)^(p_0) & lt.eq P^C \( 1 + nu + mu^(- 1) + Lambda \)^C \( M' \)^(2 p_0) . $ <eq:count-one-b>]

Indeed the sparse-mass exponent $c' = 1 \/ 2080$ allows any $1 - p_0 < c'$.
  On the bins $2^(- j - 1) \( M' \)^2 < N_s^G lt.eq 2^(- j) \( M' \)^2$,
  apply the sparse bound and sum the geometric series with ratio $2^(1 - p_0 - c') < 1$.

Finally the amplitude and group summation of [12] Proposition 9.3 uses precisely (5.14), (5.9), and (5.16)–(5.16).
  Interpolate the two counts with a sufficiently small fixed weight $theta' > 0$,
  giving power $p = \( 1 - theta' \) + theta' p_0$. The path square budgets sum the group factors,
  and the core count cap $D_(*)$ controls the common amplitude shift.
  The three amplitude-gap sums are geometric, as in that proposition.
  The frequency losses after interpolation are at most $mu^(- C theta') nu^(C theta') Lambda^(C theta')$;
  choose $theta'$ small and then the derivative order $L$ large so they are summable against $mu^p nu^(- L p)
  Lambda^(- L p)$. Applying the original cell minimum before subadditivity yields

#[#set math.equation(numbering: n => "(5.17)")
 $ C_(q \, b) eta^epsilon P^(C_4) \| R \| + O \( e^(- k) \| R \| \) $ <eq:core-final-b>]

for the terms with at least three core arguments, with fixed $epsilon > 0$ and $C_4$ independent of $q$.
  The same calculation is the core step of [13] Section 6.6:
  its frozen scheduled inputs provide exactly the amplitudes, representatives,
  and same-cell side incidence verified above. Together with Proposition 20 and the side square bound,
  this supplies the side and core estimates required to close the proof of Theorem 3.

== 6 Parameter choice and completion of the local estimate <sec:completion>

The preceding sections provide the coefficient-dependent inputs to the completion arguments in [12] Section 10 and
  [13] Section 7. We now explain the common parameter choice and the two distinct conclusions obtained from it.
  First we bound the fixed-input constant $C_N \( q \)$ independently of $N$.
  Only after this absorption do we complete the proof for depth-dependent inputs.

=== 6.1 The retained-cell estimate <the-retained-cell-estimate>

We use the base reductions of [12] Proposition 5.8 and [13] Proposition 5.6, with the modifications proved above.
  At one noninitial accuracy level their target, on a normalized root $R$,
  is a sum of terms $\| \| I min { eta \, \| H_I \( z_I \) \| }$ over a specified subset of descendant cells.
  Here $z_I$ is the four-tuple supplied by the base expansion at $I$, and $eta =
  exp \( - k^theta \)$ is its quality parameter, with $k$ the accuracy log and $0 < theta < 1$ fixed.
  The constructions then decompose each of these four-tuples into the localized terms estimated in the preceding
  sections.

The stopping constructions in [12] Section 10.1 and [13] Section 7.1 are used in their stated order.
  Main columns and their uses are fixed first; mode expansions and the whole side functions are fixed next;
  helper projections are constructed after those side functions.
  Size and counting stops are then imposed on these fixed objects.
  A stop removes original summands from an attempt; it does not redefine a previously fixed stack function.
  In particular, the maximal functions in the short-block estimates remain defined on whole retained cells,
  including the portions below later stopping cells.

Let $cal(A)_R^(upright("ret"))$ denote the cells not removed by these stops in the attempt rooted at $R$.
  The conclusions of the preceding sections give the same estimate as the retained-cell calculations in the two
  companions:

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(I in cal(A)_R^(upright("ret"))) \| \| I min { eta \, \| H_I \( z_I \) \| } & lt.eq
   #scale(x: 180%, y: 180%)[\[] C_q eta^epsilon P^(C_4) + \( 1 + C_N \( q \) \) C_q P^(- 1 \/ 2)
   G_0 \( K + 2 \)^(C_19 \( q - 2 \)) #scale(x: 180%, y: 180%)[\]] \| \| R\
 & quad + O \( e^(- k) \| \| R \) . $ <eq:retained>]

Here $epsilon > 0$ is fixed, $P$ is the transfer parameter, $K$ is the depth-block length,
  and $G_0$ is the row and stack overhead. The constants may depend on $b \, delta_0 \, C_0$.

For clarity, the estimate has three sources. Terms with at least three core factors use the powered core estimate,
  and terms with at least three side factors use their square-energy bounds.
  With $p = 1 - epsilon > 2 \/ 3$, both are converted to the first term of (6.1) by $min { eta \, a } lt.eq
  eta^(1 - p) a^p$. Terms with exactly two sides use the transfer estimate for the whole complementary arguments.
  Its main term is again included in the first term. The remaining coupled near-band sum is estimated at power one
  by the short-block comparison; it gives the second term, including its factor $1 + C_N \( q \)$, by (5.10).
  Physical and numerical errors are estimated at power one as well.
  These alternatives exhaust the four-position expansion. The minimum is applied to the whole contribution of a
  cell before subadditivity is used; no smallness of a separately selected group is being assumed.

=== 6.2 Restarts and the complexity hierarchy <restarts-and-the-complexity-hierarchy>

The integrated size, path-count, and square-energy bounds allow the stopping thresholds to be enlarged by fixed
  factors so that the first stopped cells occupy at most $\| \| R \/ 4$.
  At each such cell send the original summands there and below to a new attempt.
  The local normalizations and column bounds are available on every new root.
  Linear-side energy is proved anew by the construction on that root,
  not by asserting a proportional restriction of a global energy bound. The resulting attempt roots satisfy

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(R upright(" an attempt root below ") R_0) \| \| R lt.eq sum_(m = 0)^oo 4^(- m) \| R_0 \| = 4 /
   3 \| R_0 \| . $ <eq:attempt-packing>]

All the trees are finite, so the restart argument can equivalently be read as induction on their remaining depths.

In the scheduled-input construction, the original depths, functions,
  and block partitions remain attached to the summands. Restriction to a new root preserves the pointwise size and
  variation bounds with the same $W_j$. The row estimates of [13] Section 4 therefore apply at each restart with
  no factor depending on $W_j$.

The distinction between the two complexity scales is essential. The bounds supplied by the constructions are

#[#set math.equation(numbering: n => "(6.3)")
 $ log D_(upright(m)) & lt.eq C_q k^C \, & log D_(*) & lt.eq C_q \( 1 + k + P \)^C \,\
K & lt.eq C_q \( 1 + k + P \)^(C_5) \, & G_0 & lt.eq exp #scale(x: 120%, y: 120%)[\(]
  C_q \( 1 + log \( 2 k \) \)^C #scale(x: 120%, y: 120%)[\)] . $ <eq:budget-hierarchy>]

Here $D_(upright(m))$ bounds the main and helper catalogs, and $D_(*)$ bounds the larger mode, Fourier,
  and rational-height data. The latter data enter the counting and mode estimates,
  but are not fed back into the main catalog construction. Strong stack estimates compress main projection
  families only; mode projections have already been included in the Bessel rows.
  This is precisely the separation in [12] Section 10.3 and [13] Section 7.3.

The coefficient modifications preserve this separation. Chart substitutions multiply heights and derivative bounds
  by fixed slope-dependent factors; the change of height base occurs only in the mode construction.
  The sparse-count estimate retains its dimension-polynomial reserves and its power saving.
  Thus all the degrees $C \, C_4 \, C_5 \, C_19$ can be fixed #emph[before] choosing $q$.
  Their numerical values may be enlarged to cover both the fixed-input and scheduled-input constructions.
  Only coefficients such as $C_q$ are allowed to depend on the later choice of $q$.

Choose $q in \( 2 \, 3 \)$ sufficiently close to $2$ that

#[#set math.equation(numbering: n => "(6.4)")
 $ C_19 C_5 \( q - 2 \) < 1 / 8 $ <eq:common-q>]

for both constructions. This common choice is legitimate because local detection is available for every $q >
  2$ and short-block comparison for every $2 < q < 3$. Next put $P = ceil.l eta^(- alpha) ceil.r$,
  choosing a fixed $alpha > 0$ so small that $alpha C_4 < epsilon \/ 2$,
  as well as the analogous finitely many upper bounds already included in the powered costs.
  Finally choose the starting accuracy sufficiently large. Since $P$ dominates every fixed power of $k$ and $G_0 =
  P^(o \( 1 \))$, we obtain

$ P^(- 1 \/ 2) G_0 \( K + 2 \)^(C_19 \( q - 2 \)) lt.eq C_q P^(- 1 \/ 4) \, wide eta^epsilon P^(C_4) lt.eq
  C_q eta^(epsilon \/ 2) . $

Also $P^(- 1 \/ 4) lt.eq eta^(alpha \/ 4)$, and $e^(- k)$ is smaller than these quality powers for large $k$.
  Consequently, for some $c_(*) > 0$, (6.1) and (6.2) give the full base-segment bound

#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(I upright(" in the base segment")) \| \| I min { eta \, \| H_I \( z_I \) \| } lt.eq
   C_q eta^(c_(*)) \( 1 + C_N \( q \) \) \| R_0 \| . $ <eq:quality-gain>]

=== 6.3 Fixed inputs: accuracy summation and absorption <fixed-inputs-accuracy-summation-and-absorption>

The base accuracy levels satisfy $k_(t + 1) = k_t^A$ for a fixed $A > 1$.
  For tuples whose later level is $t$, there are $O \( t \)$ choices of the earlier level and a bounded number of
  slot patterns. The segment-root packing in [12] Section 5, followed by (6.2),
  gives a bounded total root length for each tuple. The noninitial terms in (6.5) therefore have total coefficient
  controlled by

#[#set math.equation(numbering: n => "(6.6)")
 $ C_q sum_(t gt.eq 12) t exp \( - c_(*) k_t^theta \) . $ <eq:accuracy-series>]

This series is finite, and its value is arbitrarily small when the starting accuracy is sufficiently large.
  The replacement and two-increment errors have the same summable multiplicity.
  The finitely many initial levels have depth-independent bounds from the active-scale reduction,
  as in [12] Section 10.4. Thus the modified construction proves the following normalized conclusion.

#thm([Proposition 6.1.])[
  (Normalized absorption).  #emph[For the fixed $q$ chosen above and every sufficiently small $tau > 0$,
    there is $A_tau < oo$, independent of $N$, such that the following holds.
    Suppose a finite rooted dyadic subtree has root $I_(*)$, its summation cells lie in at most $N$ consecutive
    depths, and its fixed scalar inputs satisfy
$ (\| \| I^(- 1) integral_I \| f_j \|^q)^(1 \/ q) lt.eq 1
  quad \( 0 lt.eq j lt.eq 3 \, I upright(" in the subtree") \) . $

 Then, for any subset of summation cells and admissible kernels,
$ sum_(I upright(" a summation cell")) \| \| I thin \| H_I \( f_0 \, f_1 \, f_2 \, f_3 \) \|
  lt.eq \( A_tau + tau C_N \( q \) \) \| I_(*) \| . $

]
] <prop:absorption>

The argument just given is the proof: take the coefficient in (6.6) below $tau$ and include its constant part,
  the initial levels, and the numerical errors in $A_tau$. The base expansion is first taken at a finite accuracy
  cutoff. At each fixed cell the terminal residual tends to zero by the pair-comparison estimates of the base
  reduction; since there are only finitely many cells, the passage to all accuracy levels is legitimate.
  This is the concluding expansion step in [12] Section 10.4.

We include the outer normalization argument to make the absorption explicit.
  Start with disjoint roots at the largest scale in a finite collection from (2.7).
  At a root $J$, write $a_(j \, J) = \( \| \| J^(- 1) integral_J \| f_j \|^q \)^(1 \/ q)$.
  If some $a_(j \, J)$ vanishes, all forms below $J$ vanish.
  Otherwise stop at the first strict descendants $J'$ on which an average of $\| f_j \|^q$ exceeds $16
  a_(j \, J)^q$. The union of first stops has measure at most $\| \| J \/ 4$.
  Dividing $f_j$ by $16^(1 \/ q) a_(j \, J)$ normalizes the intervening tree, so Proposition 23 bounds its sum by

$ 16^(4 \/ q) \( A_tau + tau C_N \( q \) \) \| \| J product_j a_(j \, J) . $

Repeat at the stopped roots. The sets $E_J$ left after deleting their first stops are disjoint,
  have measure at least $3 \| \| J \/ 4$, and satisfy $M_q f_j gt.eq a_(j \, J)$ on $E_J$. Hence

$ sum_J \| \| J product_j a_(j \, J) lt.eq 4 / 3 integral_(bb(R)) product_j M_q f_j . $

Taking the supremum in the definition of $C_N \( q \)$ gives

$ C_N \( q \) lt.eq C A_tau + C tau C_N \( q \) \, $

where $C$ is independent of $N$ and bounded for $2 < q < 3$.
  Choose $C tau < 1 \/ 2$ and use the already established finiteness of $C_N \( q \)$ to absorb the last term.
  We have proved

#[#set math.equation(numbering: n => "(6.7)")
 $ C_(upright(H)) \( q \) := sup_(N gt.eq 1) C_N \( q \) < oo . $ <eq:uniform-CN>]

=== 6.4 Depth-dependent inputs <depth-dependent-inputs>

Now perform the scheduled-input construction with the same $q$,
  using its own subsequent choices of $alpha$ and starting accuracy. Insert (6.7) into (6.5).
  The factor $1 + C_N \( q \)$ is now a fixed constant. The scheduled base expansion of [13] Section 5 has the
  same accuracy multiplicity and segment-root packing, with the depth-row estimates supplying the uniform bounds.
  Its noninitial terms therefore sum by (6.6). Its finitely many initial levels are bounded by its active-scale
  reduction independently of the number of depths and of every $W_j$.

Finally, at a fixed original cell, all accuracy updates are evaluated on its same actual scheduled input
  $z_(j \, s \( I \))$. The per-cell pair comparisons therefore make the terminal residual tend to zero.
  There are finitely many cells, so the finite-cell sum commutes with this limit.
  The triangle inequality and the uniform summed bounds give (2.4), exactly as in [13] Section 7.4.
  This proves Theorem 3, and hence, by Section 3, Theorem 1.

#heading(level: 1)[References]
#bibitem([1])[I. Assani, #emph[Multiple recurrence and almost sure convergence for weakly mixing dynamical
  systems], Israel J. Math. #strong[103] (1998), 111--124.]
#bibitem([2])[V. Bergelson, #emph[Weakly mixing PET], Ergodic Theory Dynam. Systems #strong[7] (1987), no.~3, 337--349.]
#bibitem([3])[G.~D. Birkhoff, #emph[Proof of the ergodic theorem], Proc. Natl. Acad. Sci.
  USA #strong[17] (1931), no.~12, 656--660.]
#bibitem([4])[J. Bourgain, #emph[Double recurrence and almost sure convergence], J. Reine Angew. Math.
  #strong[404] (1990), 140--161.]
#bibitem([5])[A.~P. Calderón, #emph[Ergodic theory and translation-invariant operators], Proc. Natl. Acad. Sci.
  USA #strong[59] (1968), no.~2, 349--353.]
#bibitem([6])[J.-M. Derrien and E. Lesigne, #emph[Un théorème ergodique polynômial ponctuel pour les
  endomorphismes exacts et les $K$-systèmes], Ann. Inst. H. Poincaré Probab. Statist.
  #strong[32] (1996), no.~6, 765--778.]
#bibitem([7])[H. Furstenberg, #emph[Ergodic behavior of diagonal measures and a theorem of Szemerédi on arithmetic
  progressions], J. Analyse Math. #strong[31] (1977), 204--256.]
#bibitem([8])[Y. Gutman, W. Huang, S. Shao, and X. Ye, #emph[Almost sure convergence of the multiple ergodic
  average for certain weakly mixing systems], Acta Math. Sin. (Engl. Ser.) #strong[34] (2018), no.~1, 79--90.]
#bibitem([9])[B. Host and B. Kra, #emph[Nonconventional ergodic averages and nilmanifolds], Ann. of Math.
  (2) #strong[161] (2005), no.~1, 397--488.]
#bibitem([10])[R.~L. Jones, R. Kaufman, J.~M. Rosenblatt, and M.
  Wierdl, #emph[Oscillation in ergodic theory], Ergodic Theory Dynam. Systems #strong[18] (1998), no.~4, 889--935.]
#bibitem([11])[J. Leng, A. Sah, and M. Sawhney, #emph[Quasipolynomial bounds on the inverse theorem for the Gowers
  $U^(s + 1) \[ N \]$-norm], preprint, #link("https://arxiv.org/abs/2402.17994v3")[arXiv:2402.17994v3], August 10,
  2024.]
#bibitem([12])[OpenAI, #emph[An $L^3$ bound for the trilinear Hilbert transform],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026/paper.pdf")[OAI:An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026],
  2026.]
#bibitem([13])[OpenAI, #emph[Pointwise convergence of triple ergodic averages for mixing transformations],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Pointwise-convergence-of-triple-ergodic-averages-for-mixing-transformations-October-4-2026/pointwise-triple-ergodic-averages-mixing-transformations.pdf")[OAI:Pointwise-convergence-of-triple-ergodic-averages-for-mixing-transformations-October-4-2026],
  2026.]
#bibitem([14])[T. Tao, #emph[Cancellation for the multilinear Hilbert transform], Collect. Math.
  #strong[67] (2016), 191--206.]
#bibitem([15])[T. Ziegler, #emph[Universal characteristic factors and Furstenberg averages], J. Amer. Math. Soc.
  #strong[20] (2007), no.~1, 53--97.]
