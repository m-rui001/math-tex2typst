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

#align(center)[#text(size: 16pt, weight: "bold")[The Gaussian free field limit of the balanced six-vertex model \
with variance multiplier $1 \/ arcsin \( c \/ 2 \)$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The six-vertex model assigns an arrow to each edge of the square lattice,
  subject to the rule that two arrows enter and two arrows leave each vertex.
  Its height function is a discrete random surface. We prove the Gaussian free field limit of this surface
  throughout the critical range $a = b = 1$, $0 < c lt.eq 2$, for the plane state specified below.

=== 1.1 The plane law and the height convention <the-plane-law-and-the-height-convention>

The two vertices having both horizontal arrows directed inward, or both directed outward, have weight $c$;
  the other four vertices have weight one. A finite configuration has the product of its vertex weights. On

$ T_(M \, L) = \( bb(Z) \/ M bb(Z) \) times \( bb(Z) \/ L bb(Z) \) \, wide M \, L gt.eq 4 \, quad L med
  upright("even") \, $

condition every vertical column of horizontal edges to contain $L \/ 2$ left arrows and $L \/ 2$ right arrows.
  This is a conserved sector of the row transfer matrix. We first take $M arrow.r oo$, and then even $L arrow.r
  oo$, in the local weak topology of arrow configurations. We denote the resulting plane law by $bb(P)_c$.
  Existence in the previously untreated range is part of the theorem.

Give the face on the left of an arrow height one more than the face on its right.
  The ice rule makes this a well-defined height $h$, modulo an additive constant, on the faces of the plane.
  For $x = \( x_1 \, x_2 \) in bb(R)^2$, let $h \( x \)$ be the height of the face with bottom-left corner
  $\( floor.l x_1 floor.r \, floor.l x_2 floor.r \)$, and set

$ h_delta \( x \) = h \( x \/ delta \) \, wide delta > 0 . $

This convention also fixes the value on grid lines.

Let $Gamma$ be the real plane Gaussian free field modulo constants, normalized by the Green kernel

#[#set math.equation(numbering: n => "(1.1)")
 $ G \( x \, y \) = - frac(1, 2 pi) log \| x - y \| . $ <eq:green>]

Thus its covariance on smooth compactly supported tests of total integral zero is the integral of $G$ against
  their product. For compactly supported finite signed measures $mu \, nu$ of total mass zero, write

$ cal(E) \( mu \, nu \) = integral.double G \( x \, y \) thin mu \( thin upright(d) x \) nu \( thin upright(d) y \) . $

We say that $mu$ has finite energy if

$ integral.double log_(+) frac(1, \| x - y \|) thin \| mu \| \( thin upright(d) x \) \|
  mu \| \( thin upright(d) y \) < oo \, wide log_(+) t = max \( log t \, 0 \) . $

For compactly supported finite signed measures, this is equivalent to requiring $cal(E) \( mu \, mu \)$ to be an
  ordinary finite signed-measure integral. In particular, the definition does not allow cancellation between
  infinite positive and negative energies.

#thm([Theorem 1.1.])[
  #emph[For every fixed $c in \( 0 \, 2 \]$, the prescribed iterated balanced-torus limit $bb(P)_c$ exists. Define
#[#set math.equation(numbering: n => "(1.2)")
 $ Delta = 1 - c^2 / 2 \, wide sigma \( c \)^2 = frac(2, arccos Delta) =
   frac(1, arcsin \( c \/ 2 \)) . $ <eq:multiplier>]

 As $delta arrow.b 0$ through arbitrary positive real values,
   the fields $h_delta$ converge to $sigma \( c \) Gamma$ in each of the following senses.]
  + #emph[For every finite family $mu_1 \, dots.h \, mu_m$ of compactly supported finite signed measures of total
    mass zero and finite energy,
$ #scale(x: 120%, y: 120%)[\(] chevron.l h_delta \, mu_j chevron.r #scale(x: 120%, y: 120%)[\)]_(j = 1)^m med
  arrow.r.double med
  cal(N) #h(-0.16667em)
  (0 \, #scale(x: 120%, y: 120%)[\(] sigma \( c \)^2 cal(E) \( mu_i \, mu_j \)
  #scale(x: 120%, y: 120%)[\)]_(i \, j = 1)^m) . $

]
  + #emph[For every bounded open $U subset bb(R)^2$ and $- 1 < alpha < 0$, there is convergence in law,
    with tightness, in the ordinary restriction spaces
$ cal(C)_(upright("res"))^alpha \( U \) := B_(oo \, oo)^alpha \( U \) \, wide B_(p \, q)^alpha \( U \) \, wide
  W^(alpha \, p) \( U \) \, quad 1 lt.eq p < oo \, quad 1 lt.eq q lt.eq oo \, $

 modulo constants. Convergence also holds in the outward completion (1.4) defined below.
   No regularity of $partial U$ is required. One may fix a smooth compactly supported $rho$ of integral one and
   replace each field $X$ by $X - chevron.l X \, rho chevron.r$, using the same pinning for the limit.]
  + #emph[For every $k gt.eq 1$ and every tuple $\( u_i \, u'_i \)_(i = 1)^k$ with ${ u_i \, u'_i } ∩ { u_j \,
    u'_j } = diameter$ for $i eq.not j$,
#[#set math.equation(numbering: n => "(1.3)")
 $ bb(E)_c product_(i = 1)^k #scale(x: 120%, y: 120%)[\(] h_delta \( u'_i \) -
   h_delta \( u_i \) #scale(x: 120%, y: 120%)[\)] arrow.r sigma \( c \)^k sum_pi product_({ i \, j } in pi)
   C_(i j) \, $ <eq:increment-main>]

 where the sum is over pairings of ${ 1 \, dots.h \, k }$, is zero for odd $k$, and
$ C_(i j) = G \( u'_i \, u'_j \) - G \( u'_i \, u_j \) - G \( u_i \, u'_j \) + G \( u_i \, u_j \) . $

 The convergence is uniform on compact sets of such tuples.]
] <thm:main>

The theorem concerns this particular zero-slope plane state.
  It makes no uniqueness assertion among all Gibbs states or all slopes, and no estimate uniform as $c arrow.b 0$.

===== 1.1.1 Regularity conventions. <regularity-conventions.>

The restriction spaces in part 2 are restrictions of the corresponding whole-plane distribution spaces,
  with their quotient norms. For $W^(alpha \, p)$ we include both the Bessel-potential and the negative
  Slobodeckij realizations. The Hölder laws are supported on the separable closure of smooth functions.
  This choice makes the statement meaningful on every bounded open set without an extension theorem for its
  boundary. We also prove convergence in the intrinsic dual spaces $\( W^(s \, p') \( U \) \)^(*)$,
  for $0 < s < 1$ and $1 lt.eq p < oo$, where the fractional seminorm uses only pairs of points of $U$;
  see Proposition 45.

The outward convention is the literal seminorm of #cite(label("DKLM2026")) Definition 2.6(iii).
  Let $cal(T)_1 \( Q \)$, with $Q = \( - 1 \, 1 \)^2$, consist of compactly supported signed densities in $Q$,
  of integral zero, whose zero extensions are $1$-Lipschitz. Set

#[#set math.equation(numbering: n => "(1.4)")
 $ parallel f parallel_(upright("out") \, alpha \, U) = sup_(0 < epsilon lt.eq 1 \, med phi in cal(T)_1 \( Q \)\
"supp" phi subset U \/ epsilon) epsilon^(- alpha)
  lr(|integral f \( x \/ epsilon \) phi \( x \) thin thin upright(d) x|) . $ <eq:source-holder>]

Here $U$ indexes the allowed tests of the global plane field;
  the sampled points $x \/ epsilon$ need not lie in $U$. The space is the completion of $C_c^oo \( bb(R)^2 \)$
  modulo the kernel of this seminorm. The absolute value leaves the source convention unchanged because the test
  family is symmetric. Its convergence requires a separate argument from convergence in restriction spaces.

=== 1.2 Prior work and the new ingredients <prior-work-and-the-new-ingredients>

At $c = 1$, Lieb computed the exact square-ice entropy #cite(label("Lieb1967")).
  The Gaussian description of critical six-vertex heights and the prediction of its coupling belong to the
  Coulomb-gas approach. In the F-model regime $1 < c < 2$, Di Francesco,
  Saleur and Zuber #cite(label("DFSZ1987")) Section 2.3 give a Gaussian-action prediction which,
  after converting their height steps of $pi \/ 2$ to unit steps, agrees with (1.2).
  This physics prediction is distinct from convergence in the measure classes and distribution topologies of Theorem 1.

At the free-fermion point $c = sqrt(2)$, a dimer representation makes the correlations determinantal.
  Kenyon’s conformal-invariance and GFF theorems for domino tilings #cite(label("Kenyon2000"))
  #cite(label("Kenyon2001")) are foundational scaling-limit results in this setting.
  The periodic dimer Gibbs measures, surface tension and logarithmic fluctuations studied by Kenyon,
  Okounkov and Sheffield #cite(label("KOS2006")) describe the corresponding plane-state picture.
  Near the free-fermion point, Falco #cite(label("Falco2013")) derived arrow-correlation asymptotics and
  logarithmic height variance for the isotropic six-vertex model through an interacting-fermion representation.
  Giuliani, Mastropietro and Toninelli proved GFF convergence for a symmetric weakly interacting dimer
  model #cite(label("GMT2017")) and the relation between its height amplitude and correlation
  exponent #cite(label("GMTHaldane2017")). Their later treatment of tilted profiles #cite(label("GMT2020"))
  Section 2.3 and Theorem 2 includes the six-vertex interaction and establishes height-covariance and amplitude
  identities near the free-fermion point; its Remark 5 leaves the higher-cumulant extension needed for a full GFF
  theorem undeveloped.

Duminil-Copin, Kozlowski, Krachun, Manolescu and Tikhonovskaia #cite(label("DCKKMT2022")) proved existence and
  condensation of Bethe roots and obtained the free energy and its expansion near half filling.
  Duminil-Copin, Karrila, Manolescu and Oulamara #cite(label("DCKMO2024")) proved logarithmic delocalization for
  $1 lt.eq c lt.eq 2$, using crossing estimates and free-energy information.
  Lis #cite(label("Lis2021")) developed the Baxter–Kelland–Wu representation for multi-point spin correlations and
  proved infinite-volume and delocalization results on subintervals of this range.
  Glazman and Lammers #cite(label("GlazmanLammers2025")) subsequently obtained delocalization,
  including logarithmic bounds in the isotropic case, by percolation methods.
  These results establish the scale of fluctuations; identifying their joint law requires additional information.
  The variational framework of Sheffield #cite(label("Sheffield2005")) and the strict convexity theorem of Lammers
  and Tassy #cite(label("LammersTassy2024")) provide the equilibrium tools used below when $c gt.eq 1$.

Duminil-Copin, Kozlowski, Lammers and Manolescu #cite(label("DKLM2026")) give a nonperturbative GFF theorem on
  $sqrt(3) lt.eq c lt.eq 2$, with the exact multiplier (1.2).
  Their proof combines transfer-matrix spectral representations and reflection positivity with rotational
  invariance and regularity estimates. The rotational-invariance input is listed as in preparation in the cited
  version. We retain the use of transfer spectra and reflection,
  but for $0 < c < 2$ construct the two Gaussian currents from finite row identities and uniform thermodynamic
  estimates. At $c = 2$, Appendix 9 supplies the needed rotational-invariance statement from the independent fair
  orientations of FK loops, the plane loop correspondence of #cite(label("Lis2021")),
  and the homotopy coupling underlying the FK rotation theorem of #cite(label("DCKKMO2026Rotation")).
  The remaining endpoint argument uses #cite(label("DKLM2026")).
  Its conditional amplitude theorem is also used on $1 lt.eq c < 2$, after convergence has been established.
  Thus the full-range statement concerns precisely the balanced plane law defined above,
  with its normalization fixed in physical height units.

The finite algebra is the algebraic Bethe ansatz. The norm determinant goes back to Gaudin,
  McCoy and Wu #cite(label("GaudinMcCoyWu1981")) and Korepin #cite(label("Korepin1982"));
  the scalar-product formula is due to Slavnov #cite(label("Slavnov1989")).
  We use its trigonometric and diagonally twisted forms as developed by Kitanine,
  Maillet and Terras #cite(label("KMT1999")) and Kitanine, Maillet, Slavnov and Terras #cite(label("KMST2005")).
  These exact finite identities are the algebraic input. Uniform control as the row length grows is a separate
  analytical problem, addressed in Section 3.

Three estimates connect this finite algebra to the limiting field.
  Root-tail control and an edge maximum principle give uniform inverses for Gaudin matrices and for mixed
  discrete–continuous quadrature operators. Finite-dimensional residue conditions then control simultaneous
  escapes of several rapidities in the determinant formulas.
  Next, bounds on the zeros of angular spectral functions outside two separated scale windows justify the limiting
  holomorphic and antiholomorphic currents. Finally, when $c < 1$,
  a homogeneous stiffness lower bound and a staggered vacuum-overlap upper bound identify the same covariance
  coefficient. This last step supplies the normalization where the conditional probabilistic input is unavailable.
  Moment estimates and desmoothing pass from the currents to the test classes and separated increments in Theorem 1.

=== 1.3 Proof overview <sec:overview>

For $0 < c < 2$, introduce

$ lambda = arccos \( - Delta \) in \( 0 \, pi \) \, wide eta = lambda \/ pi . $

Section 2 defines commuting row operators and their diagonal marks, which record height increments.
  Section 3 constructs their limiting matrix elements, proves uniform tail bounds,
  and shows that words with widely separated angular parameters decorrelate.
  A positive full-line resolvent gives uniform density comparisons for every fixed positive $lambda$,
  including the small-$lambda$ range.

These matrix elements define a Hilbert space with commuting angular rows in Section 4.
  Their joint spectral values are inner functions of a complex row parameter.
  The finite folded-row continuation argument in Lemma 16 gives a common analytic neighborhood;
  canonical inner-function factorization describes the possible zeros and boundary
  singularities #cite(label("AiDongJiang2019")). A mark acts as a current.
  The finite mass $kappa$ of the spectrum transverse to common angular dilation is the coefficient of the
  logarithmic height covariance. Section 5 computes $kappa$ directly when $c < 1$; for $c gt.eq
  1$ the cited conditional normalization theorem applies once convergence has been established.

Section 6 separates the angular spectrum into two scales and proves the Wick rules for the limiting currents.
  Section 7 passes from these currents to smooth tests, separated point increments and finite-energy measures,
  then proves convergence in negative regularity spaces. Its wavelet argument uses compactly supported
  wavelets #cite(label("Daubechies1988")) and the classical Besov coefficient characterization in the form of
  #cite(label("HairerLabbe2017")) Proposition 2.3; restriction from the plane avoids any regularity assumption on
  the boundary of $U$. The final proof combines the interval $0 < c < 2$ with the endpoint argument of Appendix 9.
  Each thermodynamic passage specifies which size tends to infinity first.

== 2 Finite rows and their scalar products <sec:finite>

The first step is finite-dimensional. We express every fixed word of marked rows as a finite sum of determinants
  on the Bethe roots, with all normalizing factors specified.
  The construction of those roots and the estimates needed to pass to infinite volume are deferred to Section 3.
  In particular, no completeness assertion for Bethe eigenvectors is used in this section.

=== 2.1 The physical row and the standard monodromy <the-physical-row-and-the-standard-monodromy>

The algebra below holds for $0 < lambda < pi$, corresponding to the open parameter interval $0 < c < 2$.
  The endpoint $c = 2$ is treated separately in Appendix 9. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ lambda = arccos \( - Delta \) \, wide eta = lambda \/ pi \, wide v = pi \/ 2 \, wide x = i eta z \, wide w =
   e^(i z) . $ <eq:spectral-coordinates>]

The physical time angle is $z = 0$, increasing time points east, and the space angle is $v$,
  increasing space points north. Thus a common imaginary translation of the $z$ arguments is a common real
  translation of their $x$ arguments. At a path step, the spin is $+
  1$ when the arrow points along its left normal; the height increment is minus that spin.
  These conventions fix the sign of every marked row.

Let $L$ be even and let $b_0 \, dots.h \, b_(L - 1)$ be real numbers.
  On $cal(H)_L = \( bb(C)^2 \)^(⊗ L)$ use the orthonormal spin basis, and put

$ Z = mat(delim: "(", 1, 0; 0, - 1) \, wide X = mat(delim: "(", 0, 1; 1, 0) . $

An auxiliary copy of $bb(C)^2$ is denoted by the subscript $a$.
  Products over the sites below have increasing site index from left to right. Define

#[#set math.equation(numbering: n => "(2.2)")
 $ R \( u \) & =
   mat(delim: "(", sin \( lambda - u \) \/ sin lambda, 0, 0, 0; 0, sin u \/ sin lambda, 1, 0; 0, 1, sin u \/ sin
   lambda, 0; 0, 0, 0, sin \( lambda - u \) \/ sin lambda) \,\
M_(upright("ph")) \( x \) & = product_(j = 0)^(L - 1) R_(a j) #scale(x: 120%, y: 120%)[\(] lambda \/ 2 +
  i \( x - b_j \) #scale(x: 120%, y: 120%)[\)] \, wide T^D \( x \) =
  "tr"_a #scale(x: 120%, y: 120%)[\(] D_a M_(upright("ph")) \( x \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:physical-R>]

where $D$ is an arbitrary complex $2 times 2$ matrix. Its row index is on the right tile of the horizontal seam
  and its column index on the left. The four indices in (2.2) send the top and left step spins to the bottom and
  right step spins. When $b_j = 0$ and $x = 0$, dividing all vertex weights by $sin \( lambda \/ 2 \) \/ sin
  lambda$ gives $a = b = 1$ and $c = 2 cos \( lambda \/ 2 \)$, hence $Delta = - cos lambda$.

Write $\[ u \] = sinh u$ and $s_lambda = \[ i lambda \] = i sin lambda$.
  The standard monodromy used in the algebraic Bethe ansatz is

#[#set math.equation(numbering: n => "(2.3)")
 $ L_(a j) \( x - b_j \) & =
   mat(delim: "(", \[ x - b_j + i lambda \/ 2 \] \/ s_lambda, 0, 0, 0; 0, \[ x - b_j - i lambda \/ 2 \] \/
   s_lambda, 1, 0; 0, 1, \[ x - b_j - i lambda \/ 2 \] \/ s_lambda, 0; 0, 0, 0, \[ x - b_j + i lambda \/ 2 \] \/
   s_lambda) \,\
M \( x \) & = product_(j = 0)^(L - 1) L_(a j) \( x - b_j \) =
  mat(delim: "(", sans(A) \( x \), sans(B) \( x \); sans(C) \( x \), sans(L) \( x \))_a . $ <eq:standard-monodromy>]

In particular, the physical mixed diagonal entry has the opposite sign. Let

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(P)_L = product_(j med upright("even")) Z_j \, wide cal(Q)_L = product_(j = 0)^(L - 1) Z_j . $ <eq:parity-gauges>]

#thm([Lemma 2.1.])[
  (Finite row algebra).  #emph[For even $L$, real $b_j$, and all complex spectral arguments,
#[#set math.equation(numbering: n => "(2.5)")
 $ M_(upright("ph")) \( x \) = cal(P)_L M \( x \) cal(P)_L cal(Q)_L \, wide T^D \( x \)^(*) =
   T^(X overline(D) X) \( macron(x) \) . $ <eq:monodromy-gauge>]

 The rows with a common diagonal twist commute. More generally, put
$ cal(R) \( u \) =
  mat(delim: "(", \[ u + i lambda \] \/ s_lambda, 0, 0, 0; 0, \[ u \] \/ s_lambda, 1, 0; 0, 1, \[ u \] \/
  s_lambda, 0; 0, 0, 0, \[ u + i lambda \] \/ s_lambda) \, wide cal(R)_(upright("ph")) \( u \) =
  Z_a cal(R) \( u \) Z_b . $

 Then
#[#set math.equation(numbering: n => "(2.6)")
 $ cal(R)_(upright("ph") \, a b) \( p - q \) M_(upright("ph") \, a) \( p \) M_(upright("ph") \, b) \( q \) =
   M_(upright("ph") \, b) \( q \) M_(upright("ph") \, a) \( p \) cal(R)_(upright("ph") \, a b) \( p - q \) .
   $ <eq:physical-RTT>]

 Where the intertwiner is invertible, exchanging two rows conjugates their joint auxiliary mark by
   $cal(R)_(upright("ph")) \( p - q \)$. For the homogeneous chain,
   $T^I \( i lambda \/ 2 \)$ is the cyclic spin translation and $T^I \( - i lambda \/ 2 \)$ is its inverse.]
] <lem:row-algebra>

#proof[
  The local identity is $R_(a j) \( lambda \/ 2 + i \( x - b_j \) \) = Z_a L_(a j) \( x - b_j \) Z_j$.
    Both local matrices commute with $Z_a Z_j$. Moving the auxiliary $Z$’s through the product,
    and using that $L$ is even, gives (2.5). This also proves that the gauge is independent of the roots,
    spectral arguments, and inhomogeneities.
  If $N_(alpha beta) \( x \)$ is one auxiliary block of a physical local matrix,
    direct conjugation of its entries gives $N_(alpha beta) \( x \)^(*) =
    N_(macron(alpha) macron(beta)) \( macron(x) \)$, where a bar on a spin index exchanges its two values.
    In an entry of a monodromy, different local factors act on different quantum sites.
    They therefore commute when the adjoint reverses their order. Consequently
  $ \( M_(upright("ph") \, alpha beta) \( x \) \)^(*) =
    M_(upright("ph") \, macron(alpha) macron(beta)) \( macron(x) \) . $
  Taking the marked trace proves the second identity in (2.5); no reversal of the spatial inhomogeneities is involved.
  The standard six-vertex Yang–Baxter identity gives $cal(R)_(a b) \( p - q \) M_a \( p \) M_b \( q \) =
    M_b \( q \) M_a \( p \) cal(R)_(a b) \( p - q \)$. It is a local identity of the three displayed six-vertex
    matrices: spin conservation reduces its nonconstant entries to the addition formula for $sinh$. Moreover,
  $ M_(upright("ph") \, a) \( p \) M_(upright("ph") \, b) \( q \) =
    Z_b cal(P)_L M_a \( p \) M_b \( q \) cal(P)_L Z_b \, $
  and the analogous reversed product has $Z_a$ in place of $Z_b$. Substitution yields (2.6).
    Taking auxiliary traces proves the assertion about marks.
    For a common diagonal matrix $D$, $D ⊗ D$ commutes with the intertwiner, so the two twisted rows commute.
    Finally $R \( 0 \)$ is the permutation matrix, and tracing a chain of such permutations gives the cyclic
    translation. The other endpoint follows by the adjoint identity. ◻
]

=== 2.2 Bethe vectors, counting functions, and finite regularity <bethe-vectors-counting-functions-and-finite-regularity>

Let $\| 0 chevron.r = \| + chevron.r^(⊗ L)$. It is annihilated by $sans(C) \( x \)$,
  and its two diagonal eigenvalues are

#[#set math.equation(numbering: n => "(2.7)")
 $ a \( x \) = product_(j = 0)^(L - 1) frac(\[ x - b_j + i lambda \/ 2 \], s_lambda) \, wide l \( x \) =
   product_(j = 0)^(L - 1) frac(\[ x - b_j - i lambda \/ 2 \], s_lambda) . $ <eq:vacuum-functions>]

The scalar functions in the creation-entry commutation rules are

#[#set math.equation(numbering: n => "(2.8)")
 $ f \( u \) = frac(\[ u + i lambda \], \[ u \]) \, wide g \( u \) = frac(s_lambda, \[ u \]) \, wide
   beta \( u \) = frac(g \( u \), f \( u \)) = frac(s_lambda, \[ u + i lambda \]) . $ <eq:fgbeta>]

In particular $beta \( 0 \) = 1$ and $1 \/ f \( 0 \) = 0$ by continuation.
  For a finite list $U$ set $\| U chevron.r = product_(u in U) sans(B) \( u \) \| 0 chevron.r$.
  The creation entries commute, so this vector is symmetric in $U$. Fix an integer $0 lt.eq n lt.eq L$.
  For a list $Y = \( y_1 \, dots.h \, y_n \)$ of distinct roots define

#[#set math.equation(numbering: n => "(2.9)")
 $ F_Y \( x \) & = product_(y in Y) frac(\[ y - x + i lambda \], \[ y - x \]) \,\
q_Y \( x \) & = frac(l \( x \), a \( x \)) product_(y in Y) frac(\[ x - y + i lambda \], \[ x - y - i lambda \]) \,\
tau_t \( x \; Y \) & = e^(i t) a \( x \) F_Y \( x \) #scale(x: 120%, y: 120%)[\(] 1 +
  e^(- 2 i t) q_Y \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:bethe-functions>]

Here $t$ is real near zero. We say that $Y$ is on shell for $t$ when

#[#set math.equation(numbering: n => "(2.10)")
 $ q_Y \( y_j \) = - e^(2 i t) wide \( 1 lt.eq j lt.eq n \) . $ <eq:bethe-equations>]

The apparently singular eigenvalue in (2.9) then has removable poles at the roots.

For real $u$ put

#[#set math.equation(numbering: n => "(2.11)")
 $ s \( u \) = frac(sin lambda, pi \( cosh \( 2 u \) - cos lambda \)) \, wide K \( u \) =
   frac(sin \( 2 lambda \), pi \( cosh \( 2 u \) - cos \( 2 lambda \) \)) . $ <eq:bare-kernels>]

At $lambda = pi \/ 2$, the second function is identically zero.
  Let $S$ and $Theta$ be their odd primitives, vanishing at zero. Define

#[#set math.equation(numbering: n => "(2.12)")
 $ xi_Y \( u \) = sum_(j = 0)^(L - 1) S \( u - b_j \) - sum_(k = 1)^n Theta \( u - y_k \) . $ <eq:counting-function>]

Consecutive real roots are solutions of

#[#set math.equation(numbering: n => "(2.13)")
 $ xi_Y \( y_j \) = j - frac(n + 1, 2) + t / pi \, wide y_1 < dots.h.c < y_n . $ <eq:consecutive-counting>]

#thm([Lemma 2.2.])[
  (Finite Bethe data).  #emph[Let $L$ be even, $b_j$ real, and $0 < lambda < pi$.
    A real solution of (2.13) satisfies (2.10). If its Bethe vector is nonzero,
    then $\| Y chevron.r$ is an eigenvector of $e^(i t) sans(A) \( x \) +
    e^(- i t) sans(L) \( x \)$ with eigenvalue $tau_t \( x \; Y \)$,
    and $cal(P)_L \| Y chevron.r$ is an eigenvector of the physical twisted row with eigenvalue $\( - 1 \)^n
    tau_t \( x \; Y \)$. The Jacobian of (2.13) is
#[#set math.equation(numbering: n => "(2.14)")
 $ G_(j k) = xi'_Y \( y_j \) delta_(j k) + K \( y_j - y_k \) \, wide xi'_Y \( u \) =
   sum_(a = 0)^(L - 1) s \( u - b_a \) - sum_(k = 1)^n K \( u - y_k \) . $ <eq:Gaudin-matrix>]

 If $det G eq.not 0$, the roots have a real analytic continuation for real $t$ near the given value, and on that branch
#[#set math.equation(numbering: n => "(2.15)")
 $ G frac(thin upright(d) Y, thin upright(d) t) = 1 / pi upright(bold(1)) . $ <eq:twist-root-derivative>]

 For $lambda gt.eq pi \/ 2$, $G$ is positive definite at every real root list. Whenever $xi'_Y \( y_j \) > 0$, write
#[#set math.equation(numbering: n => "(2.16)")
 $ ell_j = frac(1, xi'_Y \( y_j \)) \, wide \( K ell \)_(j k) = K \( y_j - y_k \) ell_k \; wide
   G "diag" \( ell \) = I + K ell . $ <eq:Gaudin-weights>]

 These assertions concern finite matrices; they give no uniform bound on $\( I + K ell \)^(- 1)$ as $L$ increases.]
] <lem:bethe-data>

#proof[
  Logarithmic differentiation gives $q'_Y \/ q_Y = 2 pi i xi'_Y$.
    Comparing the limits as $u arrow.r + oo$ fixes the integration constant:
  #[#set math.equation(numbering: n => "(2.17)")
   $ q_Y \( u \) = \( - 1 \)^n e^(2 pi i xi_Y \( u \)) wide \( u in bb(R) \) . $ <eq:q-counting-phase>]
  Indeed $S \( + oo \) = \( 1 - eta \) \/ 2$ and $Theta \( + oo \) = \( 1 - 2 eta \) \/ 2$,
    while $q_Y \( + oo \) = e^(- i lambda L + 2 i lambda n)$ and $L$ is even.
    Equation (2.13) now gives the Bethe equations. The two diagonal action formulas proved in Lemma 4 below give
    the coefficient replacing a root $p$ by $x$ as
  $ g \( x - p \)
    (e^(i t) a \( p \) product_(y eq.not p) f \( y - p \) - e^(- i t) l \( p \) product_(y eq.not p) f \( p - y \)) . $
  The Bethe equation, with the self factor $- 1$ removed, makes the parenthesis zero.
    The unchanged coefficient is (2.9). The physical eigenvalue follows from (2.5),
    since $cal(Q)_L = \( - 1 \)^n$ on the sector with $n$ minus spins.
  Differentiating the left side of (2.13) with respect to every root gives (2.14);
    the $K \( 0 \)$ term cancels the derivative of the self interaction.
    The analytic implicit-function theorem gives the local branch,
    and differentiation with respect to $t$ gives (2.15). When $K lt.eq 0$,
  $ G_(j j) = sum_a s \( y_j - b_a \) + sum_(k eq.not j) \| K \( y_j - y_k \) \| > sum_(k eq.not j) \| G_(j k) \| . $
  The matrix is real symmetric, so strict diagonal dominance proves positive definiteness.
    The formula for $G "diag" \( ell \)$ follows entry by entry. ◻
]

In the remainder of the paper, a #emph[regular real on-shell list] means a list of distinct real roots satisfying
  the Bethe equations, with $xi'_Y \( y_j \) > 0$ for every $j$ and $det G_Y eq.not 0$.
  Section 3 constructs lists with these properties.

We also record the full-line kernels that will be used to compare the finite matrices with convolution.
  With $hat(f) \( p \) = integral_(bb(R)) e^(- i p u) f \( u \) thin upright(d) u$,

#[#set math.equation(numbering: n => "(2.18)")
 $ hat(s) \( p \) & = frac(sinh \( \( pi - lambda \) p \/ 2 \), sinh \( pi p \/ 2 \)) \, & hat(K) \( p \) & =
   frac(sinh \( \( pi - 2 lambda \) p \/ 2 \), sinh \( pi p \/ 2 \)) \,\
h := parallel K parallel_(L^1 \( bb(R) \)) & = \| 1 - 2 eta \| < 1 \, & r \( u \) := \( I + K * \)^(- 1)
  s \( u \) & = frac(1, 2 lambda cosh \( u \/ eta \)) . $ <eq:kernel-transforms>]

Here $K *$ denotes convolution with $K$. To verify the transforms,
  integrate $e^(- i p u) sin theta \/ \[ pi \( cosh \( 2 u \) - cos theta \) \]$ around a rectangle of height $i
  pi$, for $0 < theta < 2 pi$. The two residues at $i theta \/
  2$ and $i \( pi - theta \/ 2 \)$ give $sinh \( \( pi - theta \) p \/ 2 \) \/ sinh \( pi p \/ 2 \)$;
  coincident or zero values follow by continuity. Take $theta = lambda \, 2 lambda$.
  The kernel $K$ has constant sign, proving the $L^1$ formula, and $hat(s) \/ \( 1 + hat(K) \) =
  1 \/ \( 2 cosh \( lambda p \/ 2 \) \)$ proves the formula for $r$. In particular $integral r = 1 \/ 2$. We write

#[#set math.equation(numbering: n => "(2.19)")
 $ R_0 * = K * \( I + K * \)^(- 1) \; wide R_0 + K * R_0 = K . $ <eq:full-line-resolvent>]

The inverse exists, for example on bounded functions, by the Neumann series since $h < 1$.

=== 2.3 Exact actions on products of creation entries <exact-actions-on-products-of-creation-entries>

For the next formulas all arguments are initially distinct and avoid the zeros of their displayed denominators.
  They are identities of meromorphic functions; coincident cases are obtained by taking the limit of the complete
  expression. We use the scalar functions $f \, g \, beta$ defined in (2.8).

#thm([Lemma 2.3.])[
  (Single-entry actions).  #emph[For a finite spectral set $U$, put $E = U union { v' }$. Then
#[#set math.equation(numbering: n => "(2.20)")
 $ sans(B) \( v' \) \| U chevron.r & = \| E chevron.r \,\
sans(A) \( v' \) \| U chevron.r & = sum_(p in E) a \( p \) beta \( v' - p \) product_(u in E \\ { p })
  f \( u - p \) \| E \\ { p } chevron.r \,\
sans(L) \( v' \) \| U chevron.r & = sum_(p in E) l \( p \) beta \( p - v' \) product_(u in E \\ { p })
  f \( p - u \) \| E \\ { p } chevron.r \,\
sans(C) \( v' \) \| U chevron.r & = sum_(p \, q in E\
p eq.not q) a \( p \) l \( q \) beta \( v' - p \) beta \( q - v' \) f \( q - p \) product_(u in E \\ { p \, q })
  f \( u - p \) f \( q - u \) \| E \\ { p \, q } chevron.r . $ <eq:A-action>]

 The last sum is over ordered pairs: $p$ belongs to the upper diagonal factor and $q$ to the lower diagonal
   factor. Thus a word of $m$ entries is an explicit sum over paths that add the new argument at each step and
   remove zero, one, or two elements. If the final set has the original cardinality,
   its sets of removed original roots and surviving added arguments have equal size, at most $m$.]
] <lem:finite-actions>

#proof[
  The standard RTT relation gives commuting creation entries and
  $ sans(A) \( p \) sans(B) \( u \) & = f \( u - p \) sans(B) \( u \) sans(A) \( p \) +
    g \( p - u \) sans(B) \( p \) sans(A) \( u \) \,\
sans(L) \( p \) sans(B) \( u \) & = f \( p - u \) sans(B) \( u \) sans(L) \( p \) +
  g \( u - p \) sans(B) \( p \) sans(L) \( u \) \,\
 & = g \( p - u \) #scale(x: 120%, y: 120%)[\(] sans(A) \( u \) sans(L) \( p \) -
   sans(A) \( p \) sans(L) \( u \) #scale(x: 120%, y: 120%)[\)] . $
  Move the diagonal entry successively through the creation entries and apply its vacuum value.
    Combining terms that replace the same root uses
  $ f \( u - h \) - f \( u - p \) = g \( p - u \) frac(\[ p - h \], \[ u - h \]) . $
  This gives (2.20); reversing differences gives (2.20). These formulas include the unchanged term $p =
    v'$ because $beta \( 0 \) = 1$.
  For completeness, the two-removal induction can be checked before any on-shell specialization.
    Induct on $\| U \|$. Strip one creation at $u$ from the product, use the commutator,
    and apply the two diagonal formulas. For fixed upper and lower removals $h \, k$, divide the coefficients by
  $ a \( h \) l \( k \) f \( k - h \) product_(s med upright("remaining")) f \( s - h \) f \( k - s \) . $
  The required addition of the three resulting contributions is
  $ beta \( v' - h \) beta \( k - v' \) & = frac(beta \( v' - h \) beta \( k - v' \), f \( u - h \) f \( k - u \))\
 & quad +
   g \( v' - u \)
   (frac(beta \( u - h \) beta \( k - v' \), f \( k - u \)) - frac(beta \( v' - h \) beta \( k - u \), f \( k -
   v' \))) . $
  Substituting (2.8) and multiplying by the displayed denominators reduces this identity to the addition formula
    for $sinh$. The initial case is $sans(C) \( v' \) \| 0 chevron.r = 0$;
    for one creation the two ordered removals give the displayed commutator on the vacuum.
    The induction proves (2.20), including cases where $p$ or $q$ is the newly added argument.
    Finally, there are only $m$ newly added arguments. If the final cardinality equals the initial one,
    the number of absent original roots equals the number of surviving added arguments and is therefore at most $m$. ◻
]

We now have an exact expansion of a finite row word into off-shell Bethe vectors.
  The remaining finite-dimensional step is to take their scalar products with the initial vector and cancel the
  vacuum factors.

=== 2.4 Slavnov’s identity with its normalization factors <slavnovs-identity-with-its-normalization-factors>

The scalar-product determinant below specializes to the norm determinant associated with Gaudin,
  McCoy and Wu and proved by Korepin #cite(label("GaudinMcCoyWu1981")) #cite(label("Korepin1982")).
  We use the twisted Slavnov identity to keep the exact prefactors in our convention visible.

Let $Y$ be on shell for $t$ and have $n$ distinct real roots.
  For a list $U$ of length $n$, define the algebraic scalar product

#[#set math.equation(numbering: n => "(2.21)")
 $ S \( Y \, U \) = chevron.l 0 \| product_(y in Y) sans(C) \( y \) product_(u in U) sans(B) \( u \) \| 0
   chevron.r . $ <eq:ABA-scalar>]

It is not defined using a Hermitian adjoint; that identification will be proved separately.
  Write $C \( Y \, U \)_(j k) = 1 \/ \[ U_k - y_j \]$, and put

#[#set math.equation(numbering: n => "(2.22)")
 $ m_u^t \( y \) & = - frac(1, 2 pi i) #scale(x: 120%, y: 120%)[\[] \( 1 + e^(- 2 i t) q_Y \( u \) \) coth \( u - y \)\
 & #h(24mm)  - coth \( u - y - i lambda \) - e^(- 2 i t) q_Y \( u \) coth \( u - y + i lambda \)
   #scale(x: 120%, y: 120%)[\]] \,\
M^t \( Y \, U \)_(j k) & = m_(U_k)^t \( y_j \) . $ <eq:finite-source-column>]

All root coincidences in these matrices mean analytic limits along the full formula. In particular

#[#set math.equation(numbering: n => "(2.23)")
 $ M^t \( Y \, Y \) = G_Y . $ <eq:source-Gaudin-limit>]

The derivatives $partial_(y_j) tau_t$ below are taken with respect to the independent root coordinates before
  imposing the on-shell equations; they are not derivatives along a Bethe-root branch.

#thm([Lemma 2.4.])[
  (Exact scalar products and deleted columns).  #emph[In the normalization (2.3),
#[#set math.equation(numbering: n => "(2.24)")
 $ S \( Y \, U \) = e^(- i n t) (product_(y in Y) l \( y \))
   frac(det_(j \, k) partial_(y_j) tau_t \( U_k \; Y \), det C \( Y \, U \)) . $ <eq:Slavnov-exact>]

 Consequently, if $det G_Y eq.not 0$, then $S \( Y \, Y \) eq.not 0$ and
#[#set math.equation(numbering: n => "(2.25)")
 $ S \( Y \, Y \) = \( 2 pi i s_lambda \)^n (product_(y in Y) a \( y \) l \( y \))
   (product_(j eq.not k) f \( y_j - y_k \)) det G_Y . $ <eq:Gaudin-norm-exact>]

 Suppose $U$ is obtained by replacing the roots indexed by $H = \( p_1 \, dots.h \, p_k \)$ by
   $V = \( v'_1 \, dots.h \, v'_k \)$, in those same slots. Set
$ A_Y \( p \) = a \( p \) product_(y in Y \\ { p }) f \( y - p \) quad \( p in Y \) . $

 Then the normalized scalar product is exactly
#[#set math.equation(numbering: n => "(2.26)")
 $ frac(S \( Y \, U \), S \( Y \, Y \)) = \( - s_lambda \)^(- k)
   frac(product_(v' in V) a \( v' \) F_Y \( v' \), product_(p in H) A_Y \( p \))
   frac(det #scale(x: 120%, y: 120%)[\(] \( G_Y^(- 1) m_(v')^t \)_p #scale(x: 120%, y: 120%)[\)]_(H \, V),
   det #scale(x: 120%, y: 120%)[\(] 1 \/ \[ v' - p \] #scale(x: 120%, y: 120%)[\)]_(H \, V)) .
   $ <eq:deleted-scalar-product>]

 If the positive weights (2.16) are defined, the last numerator equals
#[#set math.equation(numbering: n => "(2.27)")
 $ det #scale(x: 120%, y: 120%)[\(] \( G_Y^(- 1) m_(v')^t \)_p #scale(x: 120%, y: 120%)[\)]_(H \, V) =
   (product_(p in H) ell_p) det #scale(x: 120%, y: 120%)[\(] W_(v') \( p \)
   #scale(x: 120%, y: 120%)[\)]_(H \, V) \, wide W_(v') = \( I + K ell \)^(- 1) m_(v')^t . $ <eq:W-determinant>]

 Empty products and determinants have value one.]
] <lem:scalar-product>

#proof[
  We apply the trigonometric scalar-product theorem to the fundamental six-vertex monodromy (2.3),
    with highest vector $\| 0 chevron.r$, vacuum functions $a \, l$, and diagonal twist $kappa = e^(- 2 i t)$.
    To match the conventions of #cite(label("KMST2005")), take its anisotropy to be $i
    lambda$ and its inhomogeneities to be $b_j + i lambda \/ 2$, with a relabeling of sites if necessary.
    Its monodromy is $s_lambda^L M \( x \)$, so the scalar product and the vacuum-times-derivative determinant
    both acquire the same factor $s_lambda^(2 L n)$. After cancelling this factor,
    the prefactor is $product_(y in Y) l \( y \)$ for the eigenvalue $sans(A) + kappa sans(L)$;
    this is #cite(label("KMST2005")) Proposition 3.1, equations (3.8)–(3.9).
    Replacing that eigenvalue by $tau_t = e^(i t) tau_kappa$ multiplies its $n$ derivative columns by $e^(i t)$
    and therefore gives the compensating factor $e^(- i n t)$ in (2.24).
    The untwisted derivative-over-Cauchy version, with its equal-spin-normalized monodromy,
    is #cite(label("KMT1999")) Theorem 3.1, equations (3.4)–(3.5).
    These are finite scalar-product identities; they make no assertion about completeness or about a thermodynamic
    limit.
  Differentiation of (2.9) gives
  $ partial_(y_j) tau_t \( u \; Y \) = e^(i t) a \( u \) F_Y \( u \) \( - 2 pi i \) m_u^t \( y_j \) . $
  The factor $e^(i n t)$ cancels that in (2.24). When $u arrow.r y_k$,
    the product $\( 1 + e^(- 2 i t) q_Y \( u \) \) coth \( u - y_k \)$ tends to $- 2 pi i xi'_Y \( y_k \)$,
    because $q'_Y \( y_k \) = - 2 pi i e^(2 i t) xi'_Y \( y_k \)$.
    The two remaining coth terms give $K \( y_k - y_j \)$ after division by $- 2 pi i$.
    This proves (2.23), including its diagonal.
  At a root $p$ the residue of the extracted vacuum factor is
  #[#set math.equation(numbering: n => "(2.28)")
   $ lim_(u arrow.r p) \[ u - p \] a \( u \) F_Y \( u \) = - s_lambda A_Y \( p \) . $ <eq:vacuum-residue>]
  Cancel these poles with the corresponding Cauchy poles. If every column tends to its root,
    the remaining determinant is $det G_Y$, giving (2.25). For partial coincidence first cancel the unchanged
    columns. The determinant of the matrix obtained from $G_Y$ by replacing columns $H$ by $m_(v')^t$,
    divided by $det G_Y$, is $det \( \( G_Y^(- 1) m_(v')^t \)_p \)_(H \, V)$:
    multiply the matrix on the left by $G_Y^(- 1)$ and expand along its unchanged unit columns.
    Expanding the Cauchy determinant along its unchanged poles leaves exactly
    $det \( 1 \/ \[ v' - p \] \)_(H \, V)$ with the same slot order. Each deleted root loses the factor in (2.28).
    This proves (2.26), including its sign and constant. Finally $G_Y^(- 1) =
    "diag" \( ell \) \( I + K ell \)^(- 1)$ proves (2.27).
  All factors in the norm outside $det G_Y$ are nonzero: real $y \,
    b$ give $\[ y - b plus.minus i lambda \/ 2 \] eq.not 0$, and distinct real roots give $\[ y - y' \] eq.not
    0$ and $\[ y - y' plus.minus i lambda \] eq.not 0$. The scalar-product theorem is first used at generic
    variables. At any regular on-shell specialization, the nonsingular counting Jacobian permits a local analytic
    perturbation of the roots along with the parameters. Meromorphic continuation and the pole cancellations above
    then give the asserted formulas there as well. In particular, no exclusion at a root of unity is necessary. ◻
]

=== 2.5 Hilbert duality and the finite-word formula <hilbert-duality-and-the-finite-word-formula>

#thm([Lemma 2.5.])[
  (The Hilbert dual).  #emph[For even $L$ and real inhomogeneities,
#[#set math.equation(numbering: n => "(2.29)")
 $ sans(B) \( x \)^(*) = - sans(C) \( macron(x) \) . $ <eq:B-Hilbert-adjoint>]

 Thus for a distinct real on-shell list with $det G_Y eq.not 0$, the physical unit vector
#[#set math.equation(numbering: n => "(2.30)")
 $ Omega_Y = frac(cal(P)_L \| Y chevron.r, parallel cal(P)_L \| Y chevron.r parallel) $ <eq:physical-Bethe-vector>]

 is well defined, and
$ parallel cal(P)_L \| Y chevron.r parallel^2 = \( - 1 \)^n S \( Y \, Y \) > 0 . $

 If $Y \, Z$ are two such real on-shell lists of the same size, possibly for different twists, then
#[#set math.equation(numbering: n => "(2.31)")
 $ \| chevron.l Omega_Y \, Omega_Z chevron.r \|^2 =
   frac(S \( Y \, Z \) S \( Z \, Y \), S \( Y \, Y \) S \( Z \, Z \)) . $ <eq:two-orientation-overlap>]

 These identities also hold for real staggered $b_j$, without a Perron interpretation of the vectors.]
] <lem:hilbert-dual>

#proof[
  Polarize the adjoint identity in Lemma 2 over the four auxiliary marks.
    It gives $sans(B)_(upright("ph")) \( x \)^(*) = sans(C)_(upright("ph")) \( macron(x) \)$.
    Using the gauge identity and commuting $cal(P)_L$ with $cal(Q)_L$ gives $sans(B) \( x \)^(*) =
    cal(Q)_L sans(C) \( macron(x) \) cal(Q)_L$. Since $sans(C)$ changes the number of minus spins by one,
    it anticommutes with $cal(Q)_L$, proving (2.29). Creation entries commute, so for real roots
  $ \( cal(P)_L \| Y chevron.r \)^(*) = \( - 1 \)^n chevron.l 0 \| product_(y in Y) sans(C) \( y \) cal(P)_L . $
  Lemma 5 makes this norm nonzero, and positivity is then Hilbert-space positivity.
    Applying the same identity to both cross scalar products proves (2.31).
    Absorbing the twist into the monodromy merely replaces $sans(B)$ by $e^(i t)
    sans(B)$ and $sans(C)$ by $e^(- i t) sans(C)$, preserving the adjoint relation and the normalized ratio. ◻
]

We can now combine the entry actions with the scalar-product formula.
  The result is a sum over the original roots removed by a row word.
  Its determinant size depends only on the word length, not on the chain length;
  this is the form needed for the thermodynamic limit. In the remainder of this subsection $t = 0$,
  $Y$ is a regular real on-shell list, and the spectral arguments $v'_1 \, dots.h \,
  v'_m$ are distinct and generic. Define normalized physical rows by

#[#set math.equation(numbering: n => "(2.32)")
 $ A_L^D \( x \) = frac(T^D \( x \), \( - 1 \)^n tau_0 \( x \; Y \)) \, wide P_L = A_L^I \, wide J_L = A_L^Z \,
   $ <eq:normalized-finite-row>]

on the open set where the denominator is nonzero. Then $P_L \( x \) Omega_Y = Omega_Y$.
  Holomorphic continuation and norm bounds for these rows will be proved using the estimates of Section 3.

For each path in Lemma 4, let $T$ be the set remaining just after its current removal and define

#[#set math.equation(numbering: n => "(2.33)")
 $ U_Y \( T \, p \) & =
   frac(product_(u in T \\ Y) f \( u - p \), product_(y in Y \\ \( T union { p } \)) f \( y - p \)) \, &
   L_Y \( T \, p \) & =
   frac(product_(u in T \\ Y) f \( p - u \), product_(y in Y \\ \( T union { p } \)) f \( p - y \)) \,\
chi_Y \( p \) & = cases(delim: "{", 1 \, & p in Y \,, q_Y \( p \) \, & p in.not Y .) $ <eq:path-quotients>]

Associate with an action at $v'$ the correction factor

#[#set math.equation(numbering: n => "(2.34)")
 $ gamma =
   cases(delim: "{", 1 \, & sans(B) upright(" (no removal)") \,, beta \( v' - p \) U_Y \( T \, p \) \, & sans(A)
   upright(" (remove ") p \) \,, chi_Y \( p \) beta \( p - v' \) L_Y \( T \, p \) \, & sans(L)
   upright(" (remove ") p \) \,, chi_Y \( q \) beta \( v' - p \) beta \( q - v' \) f \( q - p \) U_Y \( T \, p \)
   L_Y \( T \, q \) \, & sans(C) upright(" (remove ") p \, q \) .) $ <eq:path-correction>]

These are explicit rational functions of hyperbolic sines.
  The only dependence on the original root set outside the factors displayed in (2.33) is through $q_Y$ at added
  arguments.

#thm([Corollary 2.6.])[
  (Exact finite-word expansion).  #emph[Expand each auxiliary mark as
$ T^(D_j) = sum_(alpha \, beta) \( D_j \)_(beta alpha) M_(upright("ph") \, alpha beta) . $

 For each resulting entry word, let $n_j$ be the number of minus spins after its $j$th action, with $n_0 = n$.
   Entry words with $n_m eq.not n$ have zero expectation in $Omega_Y$.
   For a path of a word with $n_m = n$, let $H subset Y$ be the roots absent at the end and let $V$ be its
   surviving added arguments, ordered in the same replacement slots.
   Then $\| H \| = \| V \| = : k lt.eq m$, and its contribution to the normalized physical expectation is
#[#set math.equation(numbering: n => "(2.35)")
 $
   (product_(j = 1)^m \( D_j \)_(beta_j alpha_j)) \( - 1 \)^(sum_(j = 1)^m \( n_(j - 1) - n \)) \( -
   s_lambda \)^(- k) frac(product_(j = 1)^m gamma_j, product_(j = 1)^m \( 1 + q_Y \( v'_j \) \))
   frac(det \( W_(v') \( p \) \)_(H \, V), det \( 1 \/ \[ v' - p \] \)_(H \, V)) product_(p in H) ell_p .
   $ <eq:exact-path-determinant>]

 The expectation is the sum of these contributions. In particular,
   the determinant size is bounded by the word length. For diagonal entry words the parity sign in (2.35) is one.
   Among distinct removed original roots the correction product contains only reciprocal $f$ factors,
   with one for each pair. Each removed original root also contributes one factor $beta$ joining it to the row
   argument at the step that removes it.]
] <cor:finite-word-expansion>

#proof[
  For this proof extend the vacuum base to added arguments by
  $ cal(A)_Y \( p \) = cases(delim: "{", A_Y \( p \) \, & p in Y \,, a \( p \) F_Y \( p \) \, & p in.not Y .) $
  The coefficient of an upper removal is $cal(A)_Y \( p \) beta \( v' - p \) U_Y \( T \, p \)$.
    The corresponding lower coefficient is $cal(A)_Y \( p \) chi_Y \( p \) beta \( p - v' \) L_Y \( T \, p \)$:
    on a root the equality of the two vacuum bases is precisely (2.10) at $t = 0$, including its self factor $-
    1$; off a root their ratio is $q_Y \( p \)$. For two removals the extra factor is $f \( q - p \)$,
    exactly as in (2.20). Thus the coefficient of a path before taking its scalar product is the product of its
    corrections $gamma_j$ times one $cal(A)_Y \( p \)$ for every removed element.
  Every original root is either retained or removed once. Similarly,
    each new spectral argument is either retained in $V$ or removed once,
    possibly in the very action that introduced it. Consequently the product of vacuum bases along the path is
  $ (product_(p in H) A_Y \( p \)) (product_(v' in { v'_1 \, dots.h \, v'_m } \\ V) a \( v' \) F_Y \( v' \)) . $
  Multiply by (2.26). The deleted-root bases cancel, and the surviving arguments supply the missing vacuum bases.
    Dividing by $product_j tau_0 \( v'_j \; Y \)$ leaves exactly $product_j \( 1 + q_Y \( v'_j \) \)^(- 1)$ and
    $\( - s_lambda \)^(- k)$. Equation (2.27) supplies the determinant and weights.
  The Hilbert dual contributes the same $\( - 1 \)^n$ to the scalar product and norm, so it cancels by Lemma 6.
    Each physical entry, after division by $\( - 1 \)^n$, contributes $\( - 1 \)^(n_(j - 1) - n)$ from $cal(Q)_L$
    on its input sector; adjacent $cal(P)_L$ factors cancel. This proves the explicit parity sign.
    Different final spin sectors are orthogonal, proving the zero assertion.
  Finally consider a pair of deleted original roots. If removed at different steps,
    the earlier root occurs in the denominator of (2.33) at the later removal.
    If removed together, the two denominators contribute $f \( q - p \)^(- 2)$ and the extra factor
    $f \( q - p \)$ leaves one reciprocal. There are no other factors involving two original roots.
    The factor $beta$ at each original removal is explicit in (2.34). This proves the last claims. ◻
]

For real $u$, $\| f \( u \) \|^2 = 1 + sin^2 lambda \/ sinh^2 u gt.eq 1$.
  Thus the reciprocal factors between deleted roots cause no collision growth,
  and for a bounded generic added argument the corresponding $beta$ factor decays like $e^(- \| p \|)$ as its real
  root $p$ escapes. These bounds control the pair factors and the individual removal factors.
  Simultaneous escape of several roots still requires a determinant bound, which will be proved in Section 3.

=== 2.6 Two-twist overlaps <two-twist-overlaps>

The normalization argument in Section 5 will also use a different consequence of the same scalar-product formula:
  the overlap of the unit vectors associated with two twists.
  Unlike a fixed row word, this overlap retains determinants of the full root-set size.
  We record its exact pair product here, before taking any thermodynamic limit.

To factor (2.31), denote the twists of $Y \, Z$ by $t_Y \, t_Z$, respectively. Put

$ Delta \( Y \) = product_(j < k) \[ y_k - y_j \] \, wide cal(H) \( Y \, U \) =
  product_(j \, k) \[ y_j - U_k + i lambda \] \, wide c_n = \( 2 pi i \)^n \( - 1 \)^(n \( n - 1 \) \/ 2) . $

The trigonometric Cauchy identity rewrites (2.24) as

#[#set math.equation(numbering: n => "(2.36)")
 $ S \( Y \, U \) = c_n (product_(y in Y) l \( y \)) (product_(u in U) a \( u \))
   frac(cal(H) \( Y \, U \), Delta \( Y \) Delta \( U \)) det M^(t_Y) \( Y \, U \) . $ <eq:Slavnov-separated>]

Consequently all one-set factors cancel separately, leaving

#[#set math.equation(numbering: n => "(2.37)")
 $ \| chevron.l Omega_Y \, Omega_Z chevron.r \|^2 =
   frac(cal(H) \( Y \, Z \) cal(H) \( Z \, Y \), cal(H) \( Y \, Y \) cal(H) \( Z \, Z \))
   frac(det M^(t_Y) \( Y \, Z \) det M^(t_Z) \( Z \, Y \), det G_Y det G_Z) . $ <eq:overlap-determinant-finite>]

This is a finite identity, including the full shifted pair product.
  In particular, along a finite regular twist branch $Y \( t \)$, take $Y = Y \( 0 \)$ and $Z = Y \( t \)$.
  The overlap is nonzero for $t$ near zero, since its value at zero is one.
  Its local logarithm and derivatives there are therefore well defined.
  Neither changing the phases of the unit vectors nor changing the logarithm branch changes the quadratic
  coefficient. No neighborhood uniform in $L$ is asserted here.

We now return to the fixed-word formula (2.35). Its scalar coefficients are explicit,
  but passing to the plane requires uniform control of the root measures, the Gaudin inverses,
  and determinants with several roots in the sparse ends. Section 3 supplies those estimates.

== 3 Thermodynamic row kernels <sec:thermodynamic>

The finite formulas of Section 2 reduce a row word to sums over finitely many selected Bethe roots.
  To pass to a plane kernel we must control those sums even when several selected roots approach the sparse ends
  of the root configuration. We first construct the real roots,
  then prove the inverse and determinant estimates that justify this passage.
  All constants in this Section may depend on the fixed parameter $0 < lambda < pi$.
  They need not remain bounded as $lambda arrow.b 0$ or $lambda arrow.t pi$.

=== 3.1 The three limiting procedures <the-three-limiting-procedures>

We use the notation $s \, K \, r \, G \, xi$ of Section 2, and put

$ h = integral_(bb(R)) \| K \( u \) \| thin upright(d) u = \| 1 - 2 eta \| < 1 \, wide R_0 = K * \( I + K * \)^(- 1) . $

Here $K *$ denotes convolution on the line; the last expression means the convolution kernel of the indicated
  operator. Since $h < 1$, its Neumann series converges on bounded functions.
  There is also a number $a > 0$ such that the same series converges with the weight $e^(a \| u \|)$:
  choose $a$ so that $integral e^(a \| u \|) \| K \( u \) \| thin upright(d) u < 1$.
  In particular $R_0$ and each of its fixed derivatives are exponentially integrable.

The following limits have different purposes.

+ In the #emph[homogeneous plane limit], all $b_j = 0$ and $L$ tends to infinity through even integers.
  If $lambda > pi \/ 2$ we use $n = L \/ 2$. If $0 < lambda lt.eq pi \/ 2$, we use $n = L \/ 2 -
  floor.l L^epsilon.alt floor.r$, where $epsilon.alt > 0$ is sufficiently small and fixed.
  Its permitted size is specified in the proof of Lemma 10.
+ In the #emph[array limit], which we use only for $lambda > 2 pi \/ 3$, put
  $ b_j = (j - frac(L - 1, 2)) d / 2 \, wide B = frac(L d, 2) \, wide n = L \/ 2 . $
  First $B arrow.r oo$ through the allowed even widths, and then $d arrow.b 0$.
    A common real center $a_B$ of the row arguments may vary with $B$,
    provided $\| a_B \| lt.eq \( 1 - gamma \) B \/ 2$ for a fixed $gamma > 0$.
    Differences of arguments range over a fixed compact set.
+ In the #emph[regular-filling limit], also used subsequently only for $lambda > 2 pi \/ 3$,
  the chain is homogeneous. First $L arrow.r oo$ with $n \/ L arrow.r rho < 1 \/ 2$,
  and then $rho arrow.t 1 \/ 2$. We assert comparison with the plane state in this procedure for equal-time local
  matrices.

For example, uniform array convergence to a function $F$ means

#[#set math.equation(numbering: n => "(3.1)")
 $ lim_(d arrow.b 0) limsup_(B arrow.r oo) sup_(\| a_B \| lt.eq \( 1 - gamma \) B \/ 2\
bold(x) in cal(K)) \| F_(d \, B) \( a_B + bold(x) \) - F \( bold(x) \) \| = 0 $ <eq:array-limit-convention>]

for every fixed compact parameter set $cal(K)$ under discussion.
  It is not necessary to assert a limit for every fixed $d$.
  A uniform bound in this procedure means that there are $C \,
  d_0 > 0$ such that for every $0 < d < d_0$ there is $B_0 \( d \)$ for which the bound holds whenever $B gt.eq
  B_0 \( d \)$. The corresponding convention for regular filling is $lim_(rho arrow.t 1 \/ 2)
  limsup_(L arrow.r oo)$. Word lengths, matrices, derivative orders,
  and compact parameter sets are fixed before these limits.
  No estimate below is asserted uniformly in an unbounded word length.

=== 3.2 Real roots, counting cells, and the sparse ends <real-roots-counting-cells-and-the-sparse-ends>

There are two constructions of roots. At exact half filling with $K < 0$,
  the last few roots remain sparse and need individual estimates.
  At regular filling, and in the homogeneous near-half-filled sequence used when $K gt.eq 0$,
  even the terminal cells become dense. The next lemma supplies both constructions and the quadrature measure that
  will enter the finite-word formula.

#thm([Lemma 3.1.])[
  (Construction and density of the roots).  #emph[The zero-twist consecutive-root equations of Lemma 3 have
    distinct real solutions with the following properties.]
  + #emph[If $lambda > pi \/ 2$, the solutions at half filling exist for every finite homogeneous or real-array
    chain. Their counting derivative $rho_L = xi'$ is positive. If
$ p_L \( u \) = sum_(j = 0)^(L - 1) r \( u - b_j \) \, $

 then $rho_L - p_L$ and their integrated discrepancy are uniformly bounded on the entire line.]
  + #emph[In the homogeneous chain, let
$ r_Q = \( I + K_Q \)^(- 1) s \, wide H_Q = \( I + K_Q \)^(- 1) 1 \, $

 where $K_Q$ integrates over $\[ - Q \, Q \]$. For all $Q gt.eq 0$,
#[#set math.equation(numbering: n => "(3.2)")
 $ c r \( u \) lt.eq r_Q \( u \) lt.eq C r \( u \) \, wide c lt.eq H_Q \( u \) lt.eq
   C quad \( \| u \| lt.eq Q \) . $ <eq:regular-density-comparison>]

 The mass $integral_(- Q)^Q r_Q$ increases to $1 \/ 2$, and
$ 1 / 2 - integral_(- Q)^Q r_Q asymp e^(- Q \/ eta) . $

 Choose $Q = Q_L$ by $integral_(- Q)^Q r_Q = n \/ L$. If $Q$ stays bounded with a positive limiting filling,
   or if $L r \( Q \)$ tends to infinity at least as a fixed positive power of $L$,
   the roots exist for all sufficiently large $L$. If $y_j^0$ are the mid-quantiles of $L r_Q$,
   then $L r_Q \( y_j^0 \) \| y_j - y_j^0 \| lt.eq C$ uniformly in $j$, and
#[#set math.equation(numbering: n => "(3.3)")
 $ xi' \( u \) = L r_Q \( u \) + O \( 1 \) $ <eq:regular-counting-density>]

 on the interval, including a bounded counting extension at its endpoints.]
  + #emph[In all three limiting procedures the measures
$ nu_L = sum_j ell_j delta_(y_j) \, wide ell_j = xi' \( y_j \)^(- 1) \, $

 have uniformly bounded mass on intervals of length one. In a region whose slightly enlarged neighborhood has
   density at least $M$, their error against bounded Lipschitz tests on a fixed bounded interval is at most
#[#set math.equation(numbering: n => "(3.4)")
 $ C / M #scale(x: 120%, y: 120%)[\(] parallel phi.alt parallel_oo +
   "Lip" \( phi.alt \) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-quadrature>]

 Thus $nu_L$ converges locally to Lebesgue measure in the dense portions of the limits.]
  #emph[At zero twist the homogeneous vectors constructed from these roots are the sector Perron vectors.
    The Gaudin matrices are nonsingular, so each constructed finite root list has a real-analytic twist branch
    near zero.]
] <lem:root-limits>

#proof[
  We first construct the exactly half-filled lists and control their sparse ends.
    We then compare the finite-interval density with the full-line density and use its quantiles to construct the
    dense lists. Both constructions will give the same local quadrature estimate.
  #strong[Exactly half-filled roots.] Suppose $K < 0$ and write $k = - K > 0$. The Jacobian of the counting equations is
  $ G_(i i) = sum_j s \( y_i - b_j \) + sum_(j eq.not i) k \( y_i - y_j \) \, wide G_(i j) = -
    k \( y_i - y_j \) quad \( i eq.not j \) . $
  Its quadratic form is the sum of a positive diagonal form and $sum_(i < j) k \( y_i - y_j \) \| u_i - u_j \|^2$.
    It is strictly positive, so the equations are strictly convex gradient equations.
    Start at $lambda = pi \/ 2$, where $K = 0$ and each counting level has one real preimage,
    and continue in a compact parameter interval. There can be no coincident roots because their prescribed
    counting levels are distinct.
  There can be no escaping roots either. If $k_0$ roots tend to $+ oo$, sum their equations.
    The interaction primitives within that set cancel by oddness.
    Dividing by $k_0$, the limiting excess of the left side over the prescribed levels is
  $ \( 1 - eta \) \( L \/ 2 - n + k_0 \) > 0 . $
  The same argument applies at $- oo$. All site parameters here are finite in each continuation problem.
    Nonsingularity and this compactness continue the solution to the required parameter.
  At half filling the total mass of $rho_L = xi'$ is $n$. The two outer counting half-levels occur at infinity.
    Consequently the signed measure and its primitive
  $ e_L = sum_j delta_(y_j) - rho_L \( u \) thin upright(d) u \, wide F_L \( u \) = e_L \( \( - oo \, u \] \) $
  satisfy $\| F_L \| lt.eq 1 \/ 2$ and $F_L \( plus.minus oo \) = 0$.
    The density equation and convolution inversion give
  #[#set math.equation(numbering: n => "(3.5)")
   $ rho_L - p_L = - R_0 * e_L = - R'_0 * F_L . $ <eq:counting-sawtooth>]
  Integrating once also bounds the difference of the tail integrals by $parallel R_0 parallel_1 \/ 2$.
    This proves the first assertion. Moreover $\| rho'_L \| lt.eq C rho_L$:
    both $s$ and $k$ are positive kernels with bounded logarithmic derivatives.
  #strong[The sparse terminal cells.] The preceding discrepancy estimate identifies the dense bulk,
    but a uniform inverse must also control the last few roots.
    We therefore estimate their densities and gaps directly. Number the roots from the right as $x_1 > x_2 >
    dots.h.c$ and write $T \( u \) = integral_u^oo rho_L \( v \) thin upright(d) v$.
    Then $T \( x_j \) = j - 1 \/ 2$. For either $q = s$ or $q = k$, put $macron(q) \( u \) =
    integral_u^oo q \( v \) thin upright(d) v$. The displayed hyperbolic formulas for the kernels imply
  #[#set math.equation(numbering: n => "(3.6)")
   $ q \( u \) & lt.eq C macron(q) \( u \) &  & \( u in bb(R) \) \,\
c macron(q) \( u \) & lt.eq q \( u \) \, wide macron(q) \( u + t \) lt.eq
  C e^(- 2 t) macron(q) \( u \) &  & \( u \, t gt.eq 0 \) . $ <eq:kernel-tail-comparison>]
  At a root $x_j$ lying beyond every bare center, its own kernel and the $j -
    1$ farther-out kernels contribute at most $h \/ 2 + h \( j - 1 \) = h T \( x_j \)$ to this tail.
    The remaining centers are inward. Their tail is at least $\( 1 - h \) T \( x_j \)$, so
  #[#set math.equation(numbering: n => "(3.7)")
   $ c \( j - 1 / 2 \) lt.eq rho_L \( x_j \) lt.eq C \( j - 1 / 2 \) . $ <eq:edge-index-density>]
  This bounds each fixed-index reciprocal density away from both zero and infinity.
  Terminal gaps cannot become long. If $x_(j + 1)$ also lies beyond the bare centers and $Delta = x_j -
    x_(j + 1)$, compare the inward tail at $x_j$ with its tail at $x_(j + 1)$ using (3.6). It gives
  $ \( 1 - h \) \( j - 1 / 2 \) lt.eq C e^(- 2 Delta) \( j + 1 / 2 \) \, wide Delta lt.eq 1 / 2 log frac(3 C, 1 - h) . $
  Conversely $1 = integral_(x_(j + 1))^(x_j) rho_L$ and the upper tail comparison give $Delta gt.eq
    c \/ \( j + 1 \)$. Thus each fixed-index gap has positive finite subsequential limits.
  The explicit tail of $p_L$, together with its bounded integrated error,
    locates any sufficiently large fixed edge index at $e_L^(upright("edge")) + O \( 1 \)$, where
  #[#set math.equation(numbering: n => "(3.8)")
   $ e_L^(upright("edge")) = eta log L quad upright("or") quad e_(d \, B)^(upright("edge")) = B \/ 2 +
     eta log \( 1 \/ d \) $ <eq:nominal-edges>]
  in the homogeneous and array cases, respectively. For example,
    choose an index larger than the integrated error bound; the $p_L$ tail is comparable to
    $exp \( - \( u - e_L^(upright("edge")) \) \/ eta \)$ near the displayed edge.
    That root lies beyond the bare centers in the limiting procedures.
    The gap estimate then places the last root no more than a bounded distance beyond that edge.
    The left end is identical. For each fixed density threshold $M$,
    the portions with density below $M$ start within a distance $C_M$ of the nominal edges and contain only a
    bounded number of root indices. Both the number and the distance may depend on $M$.
  These statements have their asserted array uniformity. In a purported failure sequence we may take $d arrow.b
    0$ and $B$ arbitrarily large depending on $d$. Every fixed edge index is then eventually beyond all bare
    centers, and (3.7) applies to every such index. One should not instead take a fixed-$d$ edge limit and assert
    that its reciprocal weights tend to zero inward: the subsequent $d arrow.b 0$ limit is essential for that assertion.
  #strong[Finite-interval densities.] We turn to the dense construction.
    Its reference configuration will consist of quantiles of $L r_Q$,
    so we first need positivity and a relative comparison with $r$, uniformly as $Q$ grows.
    The inverse of $I + K_Q$ exists on bounded functions because its perturbation has norm at most $h < 1$.
    Comparison with the full-line equation gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ r_Q - r = \( I + K_Q \)^(- 1) K_(upright("out")) r \, $ <eq:finite-Q-correction>]
  where $K_(upright("out"))$ integrates over $bb(R) \\ \[ - Q \, Q \]$.
    When $K < 0$, write the right side as the negative of the exit kernel $\( I - k_Q \)^(- 1)
    k_(upright("out"))$ applied to $r$. That positive kernel has mass at most $h$:
    the constant $h$ is a supersolution of its mass equation, since $h - k_Q h -
    k_(upright("out")) 1 = \( 1 - h \) k_Q 1 gt.eq 0$. For exterior $v$ and interior $u$, we have $r \( v \) lt.eq
    r \( Q \) lt.eq r \( u \)$. Applying the exit-kernel mass bound to this inequality gives $\( 1 - h \) r lt.eq
    r_Q lt.eq r$ on the interval. The positive Neumann series also gives $1 lt.eq
    H_Q lt.eq \( 1 - h \)^(- 1)$ in this case.
  For $0 < lambda < pi \/ 2$, a direct bound on the alternating Neumann series for $I +
    K_Q$ would lose positivity when $h$ is large. Instead the full-line dressed kernel is positive.
    To see this explicitly, put
  $ theta.alt = frac(pi lambda, pi - lambda) \, wide J_lambda \( u \) =
    frac(sin theta.alt, \( pi - lambda \) #scale(x: 120%, y: 120%)[\(] cosh \( 2 pi u \/ \( pi - lambda \) \) -
    cos theta.alt #scale(x: 120%, y: 120%)[\)]) . $
  Here $0 < theta.alt < pi$, so $J_lambda gt.eq 0$. Rescaling the bare-kernel transform in (2.18) gives
  $ hat(J)_lambda \( p \) = frac(sinh \( \( pi - 2 lambda \) p \/ 2 \), sinh \( \( pi - lambda \) p \/ 2 \)) . $
  Together with $hat(r) \( p \) = \( 2 cosh \( lambda p \/ 2 \) \)^(- 1)$, this identifies $R_0 = J_lambda * r$.
    In particular
  #[#set math.equation(numbering: n => "(3.10)")
   $ R_0 gt.eq 0 \, wide integral_(bb(R)) R_0 = frac(h, 1 + h) = : tau < 1 / 2 . $ <eq:positive-dressed-resolvent>]
  This argument uses integrable kernels, so Fourier uniqueness identifies the actual convolution kernel,
    not just its multiplier.
  Let $I_Q = \[ - Q \, Q \]$ and $O_Q = bb(R) \\ I_Q$. The positive operator $u mapsto
    R_0 * \( upright(bold(1))_(O_Q) u \)$ has sup norm at most $tau$.
    Its Neumann series defines bounded nonnegative functions on the entire line by
  #[#set math.equation(numbering: n => "(3.11)")
   $ overline(r)_Q & = r + R_0 * \( upright(bold(1))_(O_Q) overline(r)_Q \) \,\
overline(H)_Q & = frac(1, 1 + h) + R_0 * \( upright(bold(1))_(O_Q) overline(H)_Q \) .
  $ <eq:positive-interval-extensions>]
  Multiplying by $I + K *$ and using $\( I + K * \) R_0 * = K *$ gives
  $ overline(r)_Q + K * \( upright(bold(1))_(I_Q) overline(r)_Q \) = s \, wide overline(H)_Q +
    K * \( upright(bold(1))_(I_Q) overline(H)_Q \) = 1 . $
  Their restrictions are therefore $r_Q \, H_Q$, by uniqueness for $I + K_Q$.
    Since $r$ decreases on $\[ 0 \, oo \)$, the first equation in (3.11), restricted to $O_Q$, gives
  $ parallel overline(r)_Q parallel_(L^oo \( O_Q \)) lt.eq r \( Q \) +
    tau parallel overline(r)_Q parallel_(L^oo \( O_Q \)) \, wide
    parallel overline(r)_Q parallel_(L^oo \( O_Q \)) lt.eq frac(r \( Q \), 1 - tau) . $
  Applying the same equation inside $I_Q$ and the second equation on the full line now yields
  #[#set math.equation(numbering: n => "(3.12)")
   $ r \( u \) & lt.eq r_Q \( u \) lt.eq r \( u \) + frac(tau r \( Q \), 1 - tau) lt.eq frac(r \( u \), 1 - tau) \,\
frac(1, 1 + h) & lt.eq H_Q \( u \) lt.eq 1 wide \( \| u \| lt.eq Q \) . $ <eq:positive-interval-comparison>]
  At $lambda = pi \/ 2$, $K = R_0 = 0$, $r_Q = r = s$, and $H_Q = 1$.
    We have thus proved (3.2) for every fixed $0 < lambda < pi$.
  These arguments also give the relative derivative bounds needed for quadrature.
    In the positive-kernel case, differentiate the convolution in (3.11);
    each fixed derivative of $R_0$ is integrable, and the exterior source is bounded by
    $r \( Q \) \/ \( 1 - tau \)$. Thus every fixed derivative of $r_Q - r$ is $O \( r \( Q \) \)$ on $I_Q$.
    For $K < 0$, put $d_Q = r_Q - r$ and differentiate $d_Q = K_(upright("out")) r -
    K_Q d_Q$ in its output variable; the same bound follows from $parallel d_Q parallel_oo lt.eq
    h r \( Q \)$ and the integrability of all fixed derivatives of $K$.
    Since $\| r^(\( j \)) \| lt.eq C_j r$ and $r \( u \) gt.eq r \( Q \)$ on the interval,
    in both cases $\| r_Q^(\( j \)) \( u \) \| lt.eq C_j r_Q \( u \)$.
    All these constants can be chosen uniformly when $lambda$ ranges over a compact subinterval of
    $\( 0 \, pi \)$. At an endpoint we extend $r_Q$ by $s - K_Q r_Q$ outside the interval.
    For $K gt.eq 0$ this is the positive function $overline(r)_Q$ just constructed;
    for $K < 0$ it is the positive sum $s + k_Q r_Q$. The same derivative bounds hold on an extension of bounded
    counting length at either endpoint, since its physical width is $O \( \( L r \( Q \) \)^(- 1) \)$ in the dense
    limits used below.
  Differentiation with respect to the interval endpoint, followed by symmetry of the kernel, gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ frac(thin upright(d), thin upright(d) Q) integral_(- Q)^Q r_Q \( u \) thin upright(d) u =
     2 r_Q \( Q \) H_Q \( Q \) > 0 . $ <eq:filling-derivative>]
  Indeed $\( I + K_Q \) partial_Q r_Q = - r_Q \( Q \) \( K \( thin dot.op - Q \) + K \( thin dot.op + Q \) \)$;
    pair this with $H_Q$. The just proved bound $\| r_Q - r \| lt.eq
    C r \( Q \)$ shows that the integrated difference on $\[ - Q \, Q \]$ is at most $2 C Q
    r \( Q \)$ and tends to zero. Thus the mass tends to $integral_(bb(R)) r = 1 \/ 2$.
    By (3.2), the right side of (3.13) is bounded above and below by positive constants times $r \( Q \)$.
    Integrating (3.13) from $Q$ to infinity proves the asserted mass-deficit estimate.
  #strong[From dense quantiles to exact roots.] The interval density now has a strictly increasing mass and
    uniform relative derivative bounds. Choose $Q$ to have the desired mass $n \/ L$,
    and let $y_j^0$ be the mid-quantiles of $L r_Q$. The continuum counting function has derivative $L
    r_Q$ on the interval and, by oddness, gives the required levels at these quantiles.
    Midpoint quadrature against a function of bounded variation bounds the discrete residual of each root equation
    by a constant. The same holds for every fixed derivative of the counting function:
    apply that quadrature to translates of the interaction kernel or its derivatives.
  Put $m_L = L r \( Q \)$, and use displacement coordinates $zeta_j = L r_Q \( y_j^0 \) \( y_j - y_j^0 \)$.
    At the quantiles the Jacobian in these coordinates is
  $ I + (frac(K \( y_i^0 - y_j^0 \), L r_Q \( y_j^0 \)))_(i j) + O \( m_L^(- 1) \) $
  in the sup row norm. The middle matrix has absolute row norm at most $h +
    o \( 1 \)$ by quadrature and the relative derivative bounds just proved. Its inverse is uniformly bounded.
    On any fixed-radius ball in the $zeta$ coordinates, the physical displacements are $O \( m_L^(- 1) \)$.
    Neighbor sums of kernel derivatives, weighted by $1 \/ \( L r_Q \)$, are bounded.
    Comparing the bare-minus-root density to $L r_Q$ before displacing the roots also bounds the change of the
    divided diagonal entries by $O \( m_L^(- 1) \)$. Thus the Jacobian varies by $o \( 1 \)$ on that ball.
  For clarity, Newton’s map here may be taken with the inverse Jacobian frozen at the quantiles.
    Choose the ball radius larger than twice that inverse bound times the residual bound.
    For large $L$ its derivative has norm less than $1 \/ 2$,
    so it maps the ball into itself and is a contraction. The fixed point gives the exact roots and (3.3).
    Positivity of the resulting counting derivative forces their ordering.
    The same estimates hold uniformly on every fixed compact continuation interval joining $lambda > 0$ to $pi \/
    2$: throughout that interval $h$ is bounded strictly below one,
    and the density and derivative comparisons above are uniform.
    For the near-half-filled sequence, the mass-deficit comparison also gives $L r \( Q \) asymp
    L^epsilon.alt$ uniformly there. The Jacobian is nonsingular;
    equivalently its symmetrization has positive eigenvalues,
    since the absolute row bound for the perturbation of the identity is below one.
  #strong[Quadrature and the Perron vector.] Both root constructions are now available,
    with positive counting density and a nonsingular Gaudin matrix.
    Their common local quadrature estimate follows from the counting cells.
    In a cell of density at least $M$, its length $Delta_j$ is $O \( M^(- 1) \)$.
    The relative derivative bound gives $\| ell_j - Delta_j \| lt.eq C Delta_j^2$.
    Integrate a Lipschitz test cell by cell and include the two partial boundary cells to obtain (3.4).
    Uniform local mass follows in the dense region from the same argument and at the ends from (3.7) and the gap
    bounds. In regular filling every cell is dense, including the bounded counting extension of the interval.
  The Gaudin determinant and Lemma 6 make each Bethe vector nonzero.
    In the homogeneous chain the logarithmic row derivative at the swap has, up to an additive scalar,
    local link matrix equal to the swap times $- eta R' \( 0 \)$.
    Its hopping coefficient on an opposite-spin pair is $- eta \/ sin lambda < 0$.
    Within each nontrivial particle sector the hopping graph is connected,
    so the sector minimum is simple and has a positive vector.
    At $lambda = pi \/ 2$ this is the free nearest-neighbor exclusion Hamiltonian.
    In ordered particle coordinates its eigenvectors are antisymmetrized plane waves with circle sign
    $\( - 1 \)^(n - 1)$, and the minimum fills the consecutive momenta about zero.
    These are precisely the consecutive Bethe roots: their physical shift phase is $e^(i p) = -
    F_({ y }) \( i lambda \/ 2 \)$, and differentiation of the eigenvalue gives $- 2 pi eta s \( y \) = -
    cos p$ at the free point. The sign gauge thus centers the occupied momenta at zero.
  The real-root branch remains this simple minimum by continuation.
    The physical transfer matrix is primitive in the sector: its diagonal is positive,
    and successive allowed auxiliary swaps move any particle to a neighboring hole, connecting the sector.
    It commutes with the link Hamiltonian. The positive simple minimum is consequently its Perron vector.
    Taking the long cylinder limit gives its normalized vacuum expectations.
    Finally nonsingularity of $G$ gives the finite analytic twist branch by the implicit function theorem.
    This last statement does not require a twist neighborhood uniform in $L$. ◻
]

=== 3.3 Uniform inverses on pointwise function spaces <uniform-inverses-on-pointwise-function-spaces>

Lebesgue $L^oo$ equivalence classes cannot be used when an operator evaluates a function at the roots.
  We use $C_b \( bb(R) \)$ with its pointwise sup norm, or the space of bounded continuously differentiable
  functions with norm $parallel u parallel_oo + parallel u' parallel_oo$.
  The root-node spaces carry their ordinary finite-dimensional sup norms.

#thm([Lemma 3.2.])[
  (Gaudin and mixed-measure inverse bounds).  #emph[In the limits specified above,
#[#set math.equation(numbering: n => "(3.14)")
 $ parallel \( I + K ell \)^(- 1) parallel_(oo arrow.r oo) lt.eq C \, wide \( K ell \)_(i j) =
   K \( y_i - y_j \) ell_j . $ <eq:Gaudin-sup-inverse>]

 There is also a small $a > 0$ for which the inverse has uniformly bounded row norm after conjugation by either
   $e^(a y_i)$ or $e^(- a y_i)$.]
  #emph[Let $chi_(-) \, chi_0 \, chi_(+)$ be a nonnegative partition of unity whose two transitions are translates
    of fixed smooth profiles with bounded first derivatives. The middle function has compact support,
    the transitions lie in regions of a fixed sufficiently high density,
    and the two transition regions recede from one another. The left function is one to the left of its transition
    and zero to its right; the right function has the opposite convention at the right transition. Put
$ D_L = nu_L - thin upright(d) u \, wide D^bullet = chi_bullet D_L . $

 The mixed operator
#[#set math.equation(numbering: n => "(3.15)")
 $ I + R_0 * \( D^0 + D^(+) \) $ <eq:mixed-operator>]

 has a uniform lower bound in the pointwise sup norm. The analogous assertion holds with the two ends interchanged.]
] <lem:gaudin-inverse>

#proof[
  For regular filling, local quadrature up to the endpoints bounds the absolute row norm of $K ell$ by $h +
    o \( 1 \) < 1$. This proves (3.14) there. For $K < 0$ at half filling,
    finite strict diagonal dominance does not give a uniform inverse:
    its bare-source deficit may shrink at the last roots. We first isolate those roots from the contracting bulk,
    then use their reciprocal densities to obtain a decaying solution of a one-sided averaging equation.
  Truncate the exponentially small kernel tail at a fixed distance and then choose a high density threshold.
    Local mass and (3.4) show that every row sufficiently far inside the dense portion has absolute row sum at
    most a fixed $q < 1$. The edge-index bounds confine all other rows to a fixed number of indices at either end.
  If the inverse bound failed, there would be vectors $W_L$ with $parallel W_L parallel_oo =
    1$ and $\( I - k ell \) W_L arrow.r 0$ in sup norm. A near-unit coordinate must lie among those fixed edge
    indices. Retain one end, translate its terminal root to zero, and extract all fixed-index gaps and weights.
    At the right end write the limiting points as $x_1 = 0 > x_2 > dots.h.c$;
    the left end is treated by reflection. The bounds of Lemma 8 make the limiting weights positive and finite;
    at every fixed index they satisfy $c \/ j lt.eq ell_j lt.eq C \/ j$.
    The limiting points have no finite accumulation, since otherwise this lower bound would contradict the uniform
    local mass bound. In the array case this extraction is along $d arrow.b 0$ with $B$ sufficiently large,
    exactly as in (3.1).
  Put $v_j = ell_j W_j$ in the resulting one-sided limit. It is nonzero, and $v_j arrow.r 0$ as $j arrow.r oo$.
    Uniform local mass and exponential tails justify passing the equation to this limit. It reads
  $ \( rho_j - k \( 0 \) \) v_j = sum_(i eq.not j) k \( x_j - x_i \) v_i . $
  The left coefficient is positive: finite row dominance bounds it below by $k \( x_j - x_i \) >
    0$ for any other retained index $i$, whose limiting gap is finite.
    After division by this coefficient, the equation is an averaging equation with strictly positive off-diagonal
    weights whose sum is at most one. The latter follows from finite Gaudin row dominance and Fatou’s lemma;
    a strictly positive limiting deficit is not required. The absolute maximum of $v$ is attained,
    and some other index has smaller modulus. Its positive weight strictly decreases this maximum, a contradiction.
  We spell out the mixed case. The measure
  $ tilde(nu) = thin upright(d) u + D^0 + D^(+) = chi_(-) thin thin upright(d) u + \( 1 - chi_(-) \) nu_L $
  is nonnegative. Exponential decay and bounded local variation justify Fubini, and $R_0 + K * R_0 =
    K$ gives the exact identity
  #[#set math.equation(numbering: n => "(3.16)")
   $ \( I + K * \) \( I + R_0 * \( D^0 + D^(+) \) \) u = u + K * \( accent(nu u, ̃) \) . $ <eq:undo-dressing>]
  The line convolution $I + K *$ is boundedly invertible because $h < 1$.
  For $K < 0$, suppose the undressed operator had normalized approximate null functions $u_L$.
    They satisfy $u_L = k * \( accent(nu u, ̃)_L \) + o \( 1 \)$ uniformly.
    The quantity $sup_x integral k \( x - y \) tilde(nu) \( thin upright(d) y \)$ is uniformly bounded.
    It follows that the supremum of $\| u_L \|$ on $"supp" tilde(nu)$ is bounded below. Divide by that supremum.
    The support supremum is now one and the full supremum remains bounded.
    On the support, every row except a fixed number of right-edge atoms has sum at most $q < 1$:
    the replaced side is Lebesgue, the blend is dense, and the remaining noncontracting part is the original
    discrete right end.
  Thus a near-unit support value survives at one of those atoms.
    The modified left side is arbitrarily far away from each retained right-edge index,
    so its contribution disappears in the extracted equation. The preceding harmonic-maximum argument applies.
    There is no additional approximate mode between the atoms:
    $k * \( accent(nu u, ̃)_L \)$ has a uniformly bounded derivative,
    so the approximate equation makes $u_L$ equicontinuous up to a vanishing sup error.
    In the regular-filling case the entire mixed measure instead has absolute kernel row norm $h + o \( 1 \)$,
    by quadrature, and contracts directly. Equation (3.16) proves the claimed lower bound.
  Finally exponential conjugation changes the discrete kernel row norm by at most
  $ sup_i sum_j \| K \( y_i - y_j \) \| ell_j \| e^(a \( y_i - y_j \)) - 1 \| lt.eq C \| a \| . $
  This follows by summing over unit intervals and using local mass and exponential kernel decay.
    A sufficiently small $a$ therefore preserves the inverse bound by the inverse identity.
    The same perturbation estimate preserves the mixed lower bounds.
    The weighted middle contraction is proved explicitly in Lemma 11. ◻
]

=== 3.4 An analytic normalization for all marked rows <an-analytic-normalization-for-all-marked-rows>

The inverse estimates control the scalar-product columns.
  To continue the resulting kernels from one convenient spectral region to the whole strip,
  we also need a common operator bound. Write

$ cal(S)_lambda = { x in bb(C) : \| "Im" x \| < lambda \/ 2 } . $

This is the angle strip $\| "Re" z \| < v$ under $x = i eta z$.

#thm([Lemma 3.3.])[
  (Harmonic row normalization).  #emph[There is a real harmonic function $U$ on $cal(S)_lambda$ such that,
    for every finite real-inhomogeneity chain,
#[#set math.equation(numbering: n => "(3.17)")
 $ parallel T^D \( x \) parallel lt.eq 2 parallel D parallel exp (sum_j U \( x - b_j \)) . $ <eq:harmonic-row-bound>]

 Choose a nonvanishing analytic function $cal(N)_L$ whose modulus is the exponential on the right.
   In the homogeneous plane and array limits, the untwisted vacuum eigenvalue $tau_L$ satisfies
#[#set math.equation(numbering: n => "(3.18)")
 $ \| tau_L \( x \) \/ cal(N)_L \( x \) \| arrow.r 1 $ <eq:vacuum-modulus-normalization>]

 locally uniformly in the strip, with the moving-bulk convention (3.1) in the array case.
   Consequently, for each compact $cal(K) subset cal(S)_lambda$,
#[#set math.equation(numbering: n => "(3.19)")
 $ limsup sup_(x in cal(K)) parallel A_L^D \( x \) parallel lt.eq 2 parallel D parallel . $ <eq:normalized-row-bound>]

 In particular the vacuum denominator has no zeros on such a compact for all sufficiently large systems in the
   indicated sense.]
] <lem:row-normalization>

#proof[
  On $"Im" x = lambda \/ 2$, local inversion says that each site matrix divided by its equal-spin entry is
    unitary. Taking the auxiliary trace costs at most $2 parallel D parallel$,
    and gives the boundary estimate with $\| a \( x \) \|$. Crossing gives the reflected lower boundary estimate.
    For $0 < "Im" x < lambda \/ 2$ define
  #[#set math.equation(numbering: n => "(3.20)")
   $ U \( x \) = log lr(|frac(\[ x + i lambda \/ 2 \], \[ i lambda \])|) +
     integral_(bb(R)) r \( u \) log lr(|frac(\[ u - x + i lambda \], \[ u - x \])|) thin upright(d) u .
     $ <eq:harmonic-normalizer>]
  The integrand has no singularities in that open half-strip and decays exponentially at both real ends.
    Its boundary value on $"Im" x = lambda \/ 2$ is zero, because the two sinh moduli coincide.
    Reflect (3.20) conjugately to the lower half-strip. The two values agree on the real line.
    Differentiating the logarithmic sinh kernels at that line,
    with the denominator term interpreted by its Poisson-kernel limit, gives the upper normal derivative
  $ pi \( s - K * r - r \) = 0 . $
  Thus the two harmonic functions glue harmonically. Their growth at the real ends is at most linear.
  For unit vectors $u \, v$, apply the strip maximum principle to $log \| chevron.l u \,
    T^D \( x \) v chevron.r \| - sum_j U \( x - b_j \)$. The boundary bound is $log \( 2 parallel D parallel \)$
    and the growth is at most linear. One may justify the unbounded-strip principle by subtracting $epsilon
    cosh \( a "Re" x \) cos \( a "Im" x \)$, with $0 < a < pi \/ lambda$,
    applying the principle in finite rectangles, and then sending $epsilon$ to zero.
    Taking the supremum over $u \, v$ proves (3.17). The strip is simply connected,
    so a harmonic conjugate gives the nonvanishing $cal(N)_L$.
  It remains to compare it with the actual eigenvalue. It suffices first to work in a fixed small open
    neighborhood inside the upper swap point $i lambda \/ 2$. There $q_Y \( x \) arrow.r 0$.
    Homogeneously, for each fixed $0 < lambda < pi$ choose a sufficiently small disc about $i lambda \/ 2$.
    The root ratio $\[ x - y + i lambda \] \/ \[ x - y - i lambda \]$ is bounded by a constant $M_lambda$ for
    every real $y$ on that disc: the imaginary part of its denominator stays away from $pi bb(Z)$,
    and the ratio has finite limits at both real ends. The one-site ratio
    $\[ x - i lambda \/ 2 \] \/ \[ x + i lambda \/ 2 \]$ tends uniformly to zero as the disc shrinks.
    Shrink it until its supremum times $max \( 1 \, sqrt(M_lambda) \)$ is less than some $q_(*) < 1$.
    Then $n lt.eq L \/ 2$ gives $\| q_Y \( x \) \| lt.eq q_(*)^L$ on the disc,
    and hence on its intersection with the strict strip. The disc and $q_(*)$ may depend on the fixed $lambda$.
    For the array, $lambda > 2 pi \/ 3$ and the neighborhood can be chosen so that each site and root ratio has
    modulus at most one. Indeed the difference of the squared sinh moduli is governed, respectively,
    by $sin \( 2 "Im" x \) sin lambda > 0$ and $sin \( 2 "Im" x \) sin \( 2 lambda \) < 0$.
    There are order $1 \/ d$ sites at bounded distance from the moving bulk center,
    with site ratios uniformly below one. Hence $q_Y \( x \) = O \( e^(- c \/ d) \)$ after $B arrow.r oo$,
    uniformly in that bulk.
  Put
  $ H_x \( u \) = log lr(|frac(\[ u - x + i lambda \], \[ u - x \])|) \, wide tilde(H)_x = \( I + K * \)^(- 1) H_x . $
  These are smooth tests in $u$ on the chosen neighborhood.
    The exponentially weighted Neumann series gives uniform exponential decay for $tilde(H)_x$ and all its fixed
    derivatives, also after real recentering. The density equation gives the exact identity
  #[#set math.equation(numbering: n => "(3.21)")
   $ sum_(y in Y) H_x \( y \) - integral_(bb(R)) p_L \( u \) H_x \( u \) thin upright(d) u =
     integral_(bb(R)) tilde(H)_x \( u \) e_L \( thin upright(d) u \) . $ <eq:normalizer-discrepancy>]
  At half filling, integrate by parts against the bounded counting sawtooth $F_L$.
    In counting coordinates its mean over every complete cell is zero.
    On a dense fixed window, the relative derivative bound for $rho_L$ makes the physical cell averages converge
    to that mean. Thus $F_L$ tends weakly to zero there. The exponential tail of the test and the uniform bound
    $\| F_L \| lt.eq 1 \/ 2$ discard the complement of an increasing window.
    This proves that (3.21) tends to zero, including the array limit after bulk recentering.
  For the homogeneous near-half-filled sequence, use the true outer counting half-levels as cell endpoints.
    They are a bounded counting distance from $plus.minus Q$ by (3.3),
    and the positive comparison extends to them. The cellwise primitive is zero at the endpoints and is bounded by
    $1 \/ 2$ inside. The same midpoint argument therefore works within these cells.
    Outside them, the root measure vanishes and
  $ \| xi' \( u \) \| lt.eq C L r \( Q \) = O \( L^epsilon.alt \) . $
  To see this uniform exterior bound, replace the root sum of any translate of $K$ by its $L r_Q$ integral.
    Midpoint quadrature and bounded counting displacement cost $O \( 1 \)$ by variation and reciprocal-density
    summation. The remaining exterior expression $L \( s - K_Q r_Q \)$ is $O \( L r \( Q \) \)$,
    by the full-line equation and (3.9). Its pairing with the dressed test outside the cells is consequently
    $O \( L^epsilon.alt e^(- a Q) \)$ for a fixed $a > 0$. Since $Q = eta \( 1 - epsilon.alt \) log L +
    O \( 1 \)$, it tends to zero when
  #[#set math.equation(numbering: n => "(3.22)")
   $ 0 < epsilon.alt < frac(a eta, 1 + a eta) . $ <eq:epsilon-choice>]
  Decreasing $a$ if necessary gives one such choice on the compact continuation interval used to construct the roots.
  The first-term eigenvalue formula, $q_Y arrow.r 0$, and (3.21) now prove (3.18) on this open neighborhood.
    On the whole strip, $tau_L \/ cal(N)_L$ is bounded by two.
    Every subsequential holomorphic limit therefore has modulus one on the neighborhood and is a unimodular
    constant by the maximum modulus principle. Normal-family compactness gives local uniform modulus convergence
    throughout the strip. The same argument works for any purported failing moving-bulk array sequence.
    Dividing (3.17) by $\| tau_L \|$ proves the last assertions. ◻
]

=== 3.5 Joint tails from finite residue conditions <joint-tails-from-finite-residue-conditions>

Fix a word length $m$ and generic arguments $v'_1 \, dots.h \,
  v'_m$ in a small complex neighborhood of $i lambda \/ 2$.
  Generic here means that the finite difference factors in Corollary 7 have no poles or forbidden coincidences.
  This is a nonempty open condition. We may recenter all real coordinates in the array case.
  The columns in (2.27), at zero twist, are denoted by $W_(v')$. Their source columns are

#[#set math.equation(numbering: n => "(3.23)")
 $ m_(v') \( u \) =
   frac(\( 1 + q_Y \( v' \) \) coth \( v' - u \) - coth \( v' - u - i lambda \) - q_Y \( v' \) coth \( v' - u + i
   lambda \), - 2 pi i) . $ <eq:thermodynamic-source-column>]

Extend each finite node solution to the line by $W = m - K * \( nu_L W \)$.
  Lemma 9, local mass, and the kernel derivative bounds give a uniform bound for $W$ and each fixed derivative on
  the line. Undoing this convolution equation gives

#[#set math.equation(numbering: n => "(3.24)")
 $ W = W^0 - R_0 * \( D_L W \) \, wide W^0 = \( I + K * \)^(- 1) m . $ <eq:finite-dressing-equation>]

Write $E = bb(C)^m$ for the coefficient space and $W \( c \) = sum_(j = 1)^m c_j W_(v'_j)$ for $c in E$,
  with the same notation for linear combinations of the free columns $W_(v'_j)^0$.
  All these statements are uniform for $parallel c parallel_2 lt.eq 1$.

We need decay for a whole minor of these columns. To see how much,
  fix a finite action path and write $H = \( p_1 \, dots.h \, p_k \)$ for its deleted original roots and $V$ for
  its surviving row arguments. In (2.35), leave the determinant $det \( W_(v') \( p \) \)_(H \, V)$ aside for the
  moment and extract the quadrature weights $product_(p in H) ell_p$.
  The hyperbolic Cauchy determinant in (2.35) contributes at most

$ C exp (k sum_i \| p_i \| - sum_(i < j) \| p_i - p_j \|) $

after the root-pair cancellations. To check those cancellations also near collisions,
  for each pair of deleted original roots Corollary 7 supplies a reciprocal $f$ factor.
  Combined with its Cauchy denominator, its modulus is bounded by

$ \| \[ p_i - p_j plus.minus i lambda \] \|^(- 1) lt.eq C_lambda e^(- \| p_i - p_j \|) . $

All other fixed-argument factors are bounded on the generic parameter set.
  There is at least one removal factor $beta \( v' - p_i \)$ or $beta \( p_i - v' \)$ for each original root
  deleted, and it is at most $C e^(- \| p_i \|)$. The factors $q_Y \( v' \)$ are bounded and the row denominators
  $1 + q_Y \( v' \)$ are bounded away from zero in the spectral region used here.
  Consequently, apart from the dressed determinant and the quadrature weights, the summand has modulus at most

$ C exp (\( k - 1 \) sum_i \| p_i \| - sum_(i < j) \| p_i - p_j \|) . $

With $k_(+) \( t \) = \# { i : p_i > t }$ and $k_(-) \( t \) = \# { i : - p_i > t }$, its exponent is exactly

#[#set math.equation(numbering: n => "(3.25)")
 $ integral_0^oo #scale(x: 120%, y: 120%)[\(] k_(+) \( t \) \( k_(+) \( t \) - 1 \) +
   k_(-) \( t \) \( k_(-) \( t \) - 1 \) #scale(x: 120%, y: 120%)[\)] thin upright(d) t . $ <eq:Cauchy-tail-cost>]

One verifies this identity first on a region with the signs and ordering fixed,
  or by writing every distance as an integral of indicator functions.

Thus $r$ roots escaping together at one end cost $r \( r - 1 \)$ in the exponential rate.
  A bound on each column by the same decaying function would not control arbitrarily large fixed minors.
  We will instead find nested subspaces of column combinations with successively faster decay.
  For the $j$th direction it suffices to obtain a rate $beta_j > 2 j - 2$,
  because the first $r$ such rates then sum to more than $r \( r - 1 \)$.
  The number of slow directions is determined by the poles of the full-line dressed equation.

The pole spaces needed for this equation are particularly small.
  Let $\( d_j \)$ be the increasing list, with multiplicities, formed from

#[#set math.equation(numbering: n => "(3.26)")
 $ {frac(2 k - 1, eta) : k gt.eq 1} quad union quad {frac(2 k, 1 - eta) : k gt.eq 1} . $ <eq:decay-pole-list>]

At coincident entries, retain both copies; the list bounds the maximum possible pole orders. For every $j$,

#[#set math.equation(numbering: n => "(3.27)")
 $ d_j gt.eq 2 j - 1 . $ <eq:pole-count>]

Indeed, if $n_1 \, n_2$ count the entries of the two progressions strictly below $T = 2 j - 1$, then $2 n_1 -
  1 < eta T$ and $2 n_2 < \( 1 - eta \) T$. Adding gives $n_1 + n_2 < j$.

For completeness, the Fourier calculation behind the list uses

$ 1 + hat(K) \( p \) = frac(2 sinh \( \( pi - lambda \) p \/ 2 \) cosh \( lambda p \/ 2 \), sinh \( pi p \/ 2 \)) . $

In particular

$ hat(R)_0 \( p \) =
  frac(sinh \( \( pi - 2 lambda \) p \/ 2 \), 2 sinh \( \( pi - lambda \) p \/ 2 \) cosh \( lambda p \/ 2 \)) . $

The Fourier transform of each coth difference in (3.23) has denominator $sinh \( pi p \/ 2 \)$,
  as follows by shifting the integration contour by $i pi$ and accounting for the coth residues.
  This denominator cancels upon dressing. The remaining possible poles for both $W^0$ and $R_0$ are exactly those
  bounded by (3.26); the apparent singularity at zero is removable.
  On any horizontal Fourier contour avoiding these poles, the transforms decay exponentially in the real
  direction. The generic arguments range in a compact analytic neighborhood, so this decay is uniform.
  Multiplication by any fixed power of the Fourier variable preserves integrability.

Thus, for $beta > 0$ not in the list, shifting the contour and subtracting the crossed residues gives

$ R_(0 \, beta) = R_0 - P_beta \, wide W_beta^0 \( c \) = W^0 \( c \) - p_beta \( c \) \, $

where the global exponential polynomials $P_beta \, p_beta \( c \)$ belong to

#[#set math.equation(numbering: n => "(3.28)")
 $ cal(E)_beta = "span" { u^q e^(- d u) : d < beta \, med 0 lt.eq q < m_d } . $ <eq:residue-space>]

Here $m_d$ is the multiplicity in the list, and $dim cal(E)_beta lt.eq r_beta := \# { j : d_j < beta }$.
  Using two nearby pole-free contours gives, for some $delta > 0$,

#[#set math.equation(numbering: n => "(3.29)")
 $ e^(beta u) \| R_(0 \, beta)^(\( q \)) \( u \) \| lt.eq C_(beta \, q) e^(- delta \| u \|)
   quad \( q = 0 \, 1 \, 2 \) \, $ <eq:shifted-kernel-envelope>]

and the corresponding bounds for the free columns. Any other fixed derivative order is available in the same way.
  The residue polynomials are subtracted on the whole line, without cutoffs;
  this preserves their finite-dimensional translation span.

#thm([Lemma 3.4.])[
  (Finite-chain weighted flags).  #emph[Let $E = bb(C)^m$ be the coefficient space of the fixed column list.
    For each admissible $beta > 0$ there is a subspace $F_(beta \, L) subset
    E$ of codimension at most $r_beta$ such that
#[#set math.equation(numbering: n => "(3.30)")
 $ \| W \( c \) \( u \) \| lt.eq C_beta e^(- beta u) parallel c parallel_2 quad
   upright("at every positive root ") u \, quad c in F_(beta \, L) . $ <eq:weighted-node-decay>]

 For a fixed finite list of increasing shifts, choose one discrepancy partition for the whole list.
   The resulting subspaces may be chosen nested. There are analogous flags at the negative end.
   The constants are uniform in the three limiting procedures, with regular filling understood as $Q arrow.r
   oo$ after $L arrow.r oo$. Restriction to any column coordinate subspace preserves the codimension bound and all
   unit-vector estimates.]
] <lem:weighted-flags>

#proof[
  #strong[Separate the two sparse ends.] Choose the fixed-profile partition in Lemma 9 so that
  $ "supp" D^(-) subset \( - oo \, a_L \] \, wide "supp" D^(+) subset \[ b_L \, oo \) \, wide a_L < 0 < b_L . $
  The word center is deep between these boundaries. The middle support is compact and dense.
    At a fixed density threshold, Lemma 8 gives
  #[#set math.equation(numbering: n => "(3.31)")
   $ max Y lt.eq b_L + C_0 \, wide min Y gt.eq a_L - C_0 \, $ <eq:last-node-split>]
  with a threshold-dependent constant uniform in the limits.
    For regular filling take the transitions just inside $\[ - Q \, Q \]$.
    For the array both the last root and the transition contain the same $eta log \( 1 \/ d \)$ shift in (3.8).
    All three signed pieces have uniformly bounded variation mass on intervals of length one.
  Use the pointwise Banach space
  $ X_beta = {u in C^1 \( bb(R) \) : parallel u parallel_beta :=
    sup_x e^(beta x) \( \| u \( x \) \| + \| u' \( x \) \| \) < oo} . $
  The quadrature error on each unit-scale test is as small as desired on the middle support and its taper.
    To bound $R_(0 \, beta) * \( D^0 u \)$, insert a smooth unit-scale partition in the integration variable and
    apply (3.4). For the output and its first derivative, the test derivatives involve $R_(0 \, beta) \,
    R'_(0 \, beta) \, R''_(0 \, beta)$ and $u \, u'$. The envelopes (3.29) sum after weighting to give
  $ parallel R_(0 \, beta) * \( D^0 u \) parallel_beta lt.eq
    C_beta epsilon_(upright("quad")) parallel u parallel_beta . $
  Choose the density threshold so this norm is below $1 \/ 2$ for the fixed finite list of shifts, including zero.
  We first remove the right-end discrepancy from the column equation, keeping its true left-end input. Let
  $ W^p \( c \) = \( I + R_0 * D^0 \)^(- 1) \( W^0 \( c \) - R_0 * \( D^(-) W \( c \) \) \) \, $
  using the shift-zero contraction on $X_0$. Our task is to characterize the combinations $c$ for which this
    bounded column also belongs to $X_beta$. The omitted right end will then be restored with the mixed-operator
    lower bound.
  #strong[Solve after subtracting the slow residues.] For $c in E$ solve in $X_beta$
  #[#set math.equation(numbering: n => "(3.32)")
   $ \( I + R_(0 \, beta) * D^0 \) U_beta \( c \) = W_beta^0 \( c \) -
     R_(0 \, beta) * \( D^(-) W \( c \) \) . $ <eq:shifted-middle-equation>]
  The true-column bound and local variation imply
  $ parallel R_(0 \, beta) * \( D^(-) W \( c \) \) parallel_beta lt.eq C_beta e^(beta a_L) parallel c parallel_2 . $
  For example multiply the convolution integrand by $e^(beta \( x - y \)) e^(beta y)$, use $y lt.eq a_L$,
    and sum the exponentially decaying weighted kernel envelopes over unit intervals.
    The same argument applies to the first derivative. Consequently
  #[#set math.equation(numbering: n => "(3.33)")
   $ parallel U_beta \( c \) parallel_beta lt.eq C_beta parallel c parallel_2 . $ <eq:shifted-solution-bound>]
  This estimate holds for every coefficient vector before imposing any residue condition.
  #strong[Impose only the residue conditions.] Define the linear map
  #[#set math.equation(numbering: n => "(3.34)")
   $ Lambda_beta \( c \) = P_beta * \( D^0 U_beta \( c \) + D^(-) W \( c \) \) -
     p_beta \( c \) . $ <eq:residue-condition-map>]
  Its values lie in $cal(E)_beta$. Indeed convolution of an exponential polynomial with a source preserves that
    span: expand each $\( x - y \)^q$. The middle source is compactly supported,
    and the left moments converge because $d > 0$ and the left variation mass is locally bounded.
    Rank-nullity therefore gives $"codim" ker Lambda_beta lt.eq r_beta$.
    No inverse or condition-number bound for $Lambda_beta$ is used.
  Restoring the residues in (3.32) gives
  $ \( I + R_0 * D^0 \) U_beta \( c \) = W^0 \( c \) - R_0 * \( D^(-) W \( c \) \) + Lambda_beta \( c \) . $
  For $c in ker Lambda_beta$, this identity first proves $U_beta \( c \) in X_0$:
    in the rearranged equation the middle source $D^0 U_beta$ is a finite compactly supported measure,
    so its convolution and first derivative are bounded at both ends. The other two terms are already bounded.
    This membership assertion for a fixed chain does not yet require a uniform estimate for that compact source.
    Only now apply the shift-zero inverse to identify $U_beta \( c \) =
    W^p \( c \)$ and obtain its uniform unweighted bound.
  Conversely, if $W^p \( c \) in X_beta$, rewrite its equation with the shifted kernels.
    The defect is an element of $cal(E)_beta$ which also belongs to $X_beta$. It is zero:
    every nonzero exponential polynomial in (3.28) violates the $beta$-weighted bound at $+ oo$.
    Weighted uniqueness then gives $W^p \( c \) = U_beta \( c \)$ and $Lambda_beta \( c \) = 0$. Hence
  #[#set math.equation(numbering: n => "(3.35)")
   $ F_(beta \, L) := ker Lambda_beta = { c : W^p \( c \) in X_beta } . $ <eq:flag-membership>]
  The spaces are nested, because $W^p \( c \)$ is already unweighted bounded at $-
    oo$ and a larger positive weight at $+ oo$ implies every smaller one.
    Estimates (3.33) hold uniformly for every unit vector in these subspaces.
  #strong[Restore the right end at the actual nodes.] For such a vector, subtract the true and middle equations:
  $ \( I + R_0 * \( D^0 + D^(+) \) \) \( W \( c \) - W^p \( c \) \) = - R_0 * \( D^(+) W^p \( c \) \) . $
  The right side has sup norm at most $C_beta e^(- beta b_L)$.
    The infinite Lebesgue portion of $D^(+)$ causes no extra factor:
    sum its uniformly bounded local variation against $e^(- beta \( b_L + j \))$ over $j gt.eq 0$.
    The mixed lower bound therefore gives the same estimate for $W - W^p$.
    At every actual positive root, (3.31) converts it to $C_beta e^(- beta u)$, which proves (3.30).
    Reflecting proves the negative-end assertion. Finally restriction of (3.34) to a coordinate subspace still has
    rank at most $r_beta$, and a unit vector there is a unit vector in $E$.
    All the asserted restriction properties follow. ◻
]

The flag estimates now supply the decay rates required by (3.25).

#thm([Lemma 3.5.])[
  (Joint tail bound).  #emph[For a fixed generic row word and any one of its nonzero finite action paths,
    let $H = \( p_1 \, dots.h \, p_k \)$ be the deleted original roots and $V$ its surviving row arguments.
    After extracting the quadrature weights $product_(i = 1)^k ell_(p_i)$ from (2.35),
    the remaining summand is bounded in modulus by
#[#set math.equation(numbering: n => "(3.36)")
 $ C exp (- epsilon sum_(i = 1)^k \| p_i \|) $ <eq:joint-tail-majorant>]

 for some $epsilon > 0$. The constant and exponent may depend on the fixed word and generic compact parameter set,
   but are uniform in the limiting procedures. In particular,
   the sum over paths with $max_i \| p_i \| > R$ is $O \( e^(- epsilon' R) \)$ uniformly, for some $epsilon' > 0$.]
] <lem:joint-determinant-tails>

#proof[
  Choose pole-free numbers $beta_j in \( 2 j - 2 \, 2 j - 1 \)$ for $1 lt.eq j lt.eq k$.
    By (3.27), the corresponding flag has codimension at most $j - 1$.
    For a positive-row minor with $r$ columns, order its rows as $p_1 gt.eq dots.h.c gt.eq p_r gt.eq 0$.
    Choose an orthonormal basis of its coefficient space backwards:
    the $j$th basis vector belongs to $F_(beta_j \, L)$. This is possible because these spaces are nested and have
    dimension at least $r - j + 1$. A unitary basis change does not alter the determinant modulus.
    Applying (3.30) to its columns and using the rearrangement inequality in the determinant expansion gives
  #[#set math.equation(numbering: n => "(3.37)")
   $ \| det W \| lt.eq C exp (- sum_(j = 1)^r beta_j p_j) = C exp
     (- integral_0^oo sum_(j = 1)^(k_(+) \( t \)) beta_j thin upright(d) t) \, $ <eq:positive-minor-bound>]
  where $k_(+) \( t \) = \# { i : p_i > t }$. For a determinant with both signs,
    first expand by its positive and negative rows. Every Laplace minor has a column coordinate subspace,
    on which the same codimension and unit-vector estimates hold. Choose its flag basis separately.
    Thus no simultaneous adaptation of the two tail flags is required.
    The finite Laplace sum gives the product of the positive bound and its negative counterpart.
  Set $epsilon = min_(j lt.eq k) \( beta_j - \( 2 j - 2 \) \) > 0$.
    For every $r lt.eq k$, $sum_(j = 1)^r beta_j gt.eq r \( r - 1 \) + epsilon r$.
    Combining (3.37) at both ends with (3.25) proves (3.36). The case $k =
    0$ is the empty determinant and needs no tail estimate. Uniform local quadrature mass now bounds the sums of
    the majorant by convergent geometric series on unit boxes.
    Discarding boxes with some coordinate beyond $R$ proves the last assertion, with a harmless smaller exponent. ◻
]

=== 3.6 Limits of fixed row words <limits-of-fixed-row-words>

The joint tail bound lets us take the thermodynamic limit first on a bounded rapidity window,
  and then remove that window. The harmonic row bound extends the resulting convergence to the whole strict strip.

#thm([Proposition 3.6.])[
  (Limits of fixed row words).  #emph[For each fixed integer $m gt.eq 0$ and fixed $2 times 2$ matrices $D_1 \,
    dots.h \, D_m$, the homogeneous plane coefficients
#[#set math.equation(numbering: n => "(3.38)")
 $ ⟨Omega_L \, A_L^(D_m) \( x_m \) dots.h.c A_L^(D_1) \( x_1 \) Omega_L⟩ $ <eq:word-kernel-definition>]

 converge locally uniformly on $cal(S)_lambda^m$ to a holomorphic function
   $cal(K)_(D_m \, dots.h \, D_1) \( x_m \, dots.h \, x_1 \)$.
   It is invariant under every common complex translation for which the translated arguments remain in the strip.
   For $lambda > 2 pi \/ 3$, the same functions are the array limits in (3.1).]
  #emph[If $v_L$ is any fixed finite linear combination of row words applied to $Omega_L$, then
$ lim parallel A_L^D \( x \) v_L parallel^2 lt.eq 4 parallel D parallel^2 lim parallel v_L parallel^2 . $

 The two limits are determined by the word coefficients and the adjoint rule.
   This is the bound used to construct bounded row actions in Section 4.
   For $lambda > 2 pi \/ 3$, in the regular-filling procedure the expectations of every fixed equal-time local
   matrix product converge to those of the homogeneous plane construction.]
] <prop:word-kernel>

#proof[
  First keep all arguments in the generic neighborhood used above.
    The finite row expansion has finitely many action patterns, each with at most $m$ deleted original roots.
    Words with a net change of particle number have coefficient zero.
    On each bounded rapidity window, the line extensions of the dressed columns and their derivatives are
    uniformly bounded. Local quadrature and their convolution equation therefore give, along any subsequence,
    a smooth local limit satisfying
  $ W + K * W = m_(v')^(\( 0 \)) \, wide m_(v')^(\( 0 \)) \( u \) =
    frac(coth \( v' - u \) - coth \( v' - u - i lambda \), - 2 pi i) . $
  The tails in this equation are negligible by exponential kernel decay and bounded local mass.
    Since $h < 1$, the bounded solution is unique. The elementary identity $m_(v')^(\( 0 \)) \( u \) =
    s \( u - v' + i lambda \/ 2 \)$ shows that dressing replaces $s$ by $r$.
    Equivalently its Fourier transform is
    $e^(- i p \( v' - i lambda \/ 2 \)) \/ \( 2 cosh \( lambda p \/ 2 \) \)$. This gives
  #[#set math.equation(numbering: n => "(3.39)")
   $ W_(v') \( u \) arrow.r frac(1, 2 lambda cosh \( \( u - v' + i lambda \/ 2 \) \/ eta \)) .
     $ <eq:continuum-dressed-column>]
  For the array, the same conclusion holds along every bulk-recentered sequence in its prescribed double-limit sense.
  Apply (2.35) on a bounded rapidity window. Its weights are exactly the product quadrature measure.
    Local quadrature, (3.39), and $q_Y \( v' \) arrow.r 0$ turn its sum into the corresponding line integral.
    The apparent near-collision singularities have already been canceled by the root-pair factors;
    deleting diagonal tuples has no effect in the limit, since the maximal atom on such a window tends to zero.
    Lemma 12 then permits the window to grow to the whole line.
    This proves convergence of every path and hence of the word.
    It also proves independence of the choice between homogeneous and array limits.
    All surviving ingredients depend only on rapidity differences.
    Changing all variables of integration by a common real amount therefore proves real-translation invariance in
    the $x$ coordinate.
  Lemma 10 bounds all the finite words locally uniformly on the full strip.
    Normal-family compactness and the identity theorem extend the convergence from the generic open set to
    $cal(S)_lambda^m$, with uniqueness of every subsequential limit.
    The derivative in the common translation direction vanishes on that open set and hence everywhere.
    Integrating it along translations staying in the strip gives the stated complex-translation invariance.
    For any finite linear combination of word vectors, apply the finite operator inequality (3.19) to its Gram
    norm. Passing to the limit gives the bound $2 parallel D parallel$ for the induced row action and also shows
    that it respects zero Gram vectors.
  For the remaining equal-time assertion, first fix $Q < oo$ and send $L arrow.r
    oo$ with filling $integral_(- Q)^Q r_Q$. The same finite path calculation is valid,
    now with dense nodes on $\[ - Q \, Q \]$ and the interval dressing operator. Then send $Q arrow.r oo$.
    The inverse bounds, local convergence, and joint tail bound are uniform in this second limit,
    so the same full-line integrals result.
  This calculation can be made on small contours surrounding $i lambda \/ 2$,
    using nested distinct radii to keep all arguments generic.
    For the regular-filling assertion we only use $lambda > 2 pi \/ 3$;
    choose the contour radii so small that all the fixed shifted poles stay outside them.
    On these contours the homogeneous $q_Y$ still tends to zero exponentially,
    and the eigenvalue first term is analytic and nonzero. Thus each complete finite normalized word is
    holomorphic on the product of the enclosed discs for sufficiently large $L$.
    The same determinant bounds apply on their boundary contours,
    including the portions just outside the strict strip. Convergence on these contours is uniform:
    first take the fixed-$Q$ chain limit on a bounded rapidity window,
    then use the uniform joint tail bound when taking $Q arrow.r oo$ and removing that window.
    The iterated Cauchy formula therefore gives the coincident endpoint values.
  At the swap, a marked row implements an arbitrary matrix on one site together with the cyclic shift.
    Multiplying marked swap rows conjugates the successive site matrices by that shift;
    their product reads any finite set of sites, with identity marks at unused sites.
    The residual shift fixes the homogeneous Perron vector, so its vacuum expectation is exactly the desired
    local-matrix expectation. The half-filled homogeneous calculation has the same endpoint contours and
    integrals. This proves equality of the equal-time local states in the stated order of limits,
    without asserting an unrestricted row-strip limit at a fixed nonzero magnetization. ◻
]

=== 3.7 Clustering of diagonal row words <clustering-of-diagonal-row-words>

#thm([Proposition 3.7.])[
  (Separated diagonal words).  #emph[Partition a fixed finite list of diagonal marked rows into groups.
    Within each group fix its internal arguments in the strict angle strip.
    Translate the arguments of group $g$ by a common imaginary amount $i t_g$, and let every $\| t_g -
    t_(g') \|$ tend to infinity. Then the plane word kernel factors into the product of the individual group
    kernels. Convergence is locally uniform in the internal strict arguments. The order within each group is retained.]
] <prop:word-clustering>

#proof[
  We first use generic arguments near the upper boundary in the $x$ coordinate.
    Their real parts may be separated by arbitrary translations.
    The integral formula of Proposition 13 applies there by analytic continuation of its difference integrals;
    keep the imaginary parts in a fixed small generic box and avoid the finitely many coincidence poles during
    continuation.
  For a path with deleted roots $H$ and surviving arguments $V$,
    write $N_H \( t \)$ and $N_V \( t \)$ for the numbers of their real parts to the left of $t$.
    These two lists have equal length. The quotient of the continuum determinant (3.39) and the original
    hyperbolic Cauchy determinant, including the root-pair cancellations, is bounded by
  #[#set math.equation(numbering: n => "(3.40)")
   $ C exp (- \( eta^(- 1) - 1 \) integral_(bb(R)) \( N_H \( t \) - N_V \( t \) \)^2 thin upright(d) t) .
     $ <eq:matching-cluster-bound>]
  Here the constant is uniform as the fixed internal lists separate. To verify the exponent, use
  $ cosh \( \( p - v' + i lambda \/ 2 \) \/ eta \) = i sinh \( \( p - v' \) \/ eta \) $
  and apply the sinh Cauchy identity at scales $1 \/ eta$ and $1$.
    The exponent in their ratio is $- \( eta^(- 1) - 1 \)$ times
  $ sum_(p in H \, v' in V) \| p - "Re" v' \| - sum_(p < p') \| p - p' \| - sum_(v' < v'') \| "Re" v' - "Re" v'' \| . $
  This expression is exactly the integral in (3.40). The bounded imaginary offsets and fixed within-group generic
    factors change only the constant. The reciprocal $f$ factors remove the near-root-collision denominators as in
    Lemma 12.
  The integral in (3.40) controls ordered matching distance.
    Indeed $N_H - N_V$ is integer-valued, so its square is at least its absolute value, and
  $ integral_(bb(R)) \| N_H - N_V \| thin upright(d) t = sum_j \| p_j - "Re" v'_j \| $
  for the two ordered lists. Since $eta < 1$, the estimate localizes all integration variables integrably around
    the surviving arguments, uniformly in their separations.
  For diagonal words every action has one removal. Each removal also has its factor $beta$ decaying exponentially
    in the distance between the adding argument and the removed argument or root.
    If a path couples two different groups, either this factor or (3.40) makes its integral vanish as the gap
    grows. More explicitly, first restrict every matched root to a fixed radius of its matching argument using the
    uniform exponential bound. On this restricted region any removal between distinct groups has distance tending
    to infinity. Discard these paths and then increase the matching radius.
    The surviving paths have their additions and removals inside individual groups;
    in each group the numbers of deleted original roots and surviving added arguments are equal.
  On a bounded matching region the two determinants are block diagonal in the limit,
    so their quotient tends to the product of the group quotients. Cross-group correction products tend to one.
    In fact $f \( u \) arrow.r e^(plus.minus i lambda)$ as $u arrow.r plus.minus oo$,
    and at every removal the numbers of extra surviving arguments and missing original roots in another group
    agree. Their limiting phases cancel. The constants $\( - \[ i lambda \] \)^(- 1)$ occur once per deleted
    column and multiply in the same way. Termwise limits, the integrable matching bound,
    and the finite sum over paths therefore give exactly the product of the separate group answers.
  If different groups were interlaced in the original word,
    they may first be gathered while retaining each internal order.
    The normalized intertwiner in RTT tends exponentially to an invertible diagonal matrix at large real
    separation. Its conjugation of a pair of diagonal marks therefore differs from the unchanged pair by an
    exponentially small matrix. The bounded limiting rows make the corresponding exchange error tend to zero.
  Finally the row norm bound makes these translated kernels a normal family as functions of the internal strict
    arguments. Every subsequential holomorphic limit equals the product on the generic open box just treated.
    The identity theorem determines it throughout the product strip, proving the proposition and its local uniformity. ◻
]

The construction now supplies all row-kernel inputs for the angular Hilbert space:
  holomorphy, the common-translation symmetry, bounded marked actions, and diagonal clustering.
  The physical identification and endpoint continuation are treated next.

== 4 The plane representation and its angular spectrum <sec:angular>

The word kernels constructed in Section 3 now become operators on a Hilbert space.
  We identify their boundary values with local spins and spatial translations,
  and their physical-angle coefficients with the prescribed plane law.
  The resulting spectral description will provide both the normalization calculation and the separation into two
  chiral limits. Throughout this section

$ 0 < lambda < pi \, wide eta = lambda \/ pi \, wide v = pi \/ 2 \, wide w = e^(i z) . $

All constants may depend on the fixed parameter. The arguments below use the ordinary homogeneous-row Hilbert
  norm. No metric associated with a diagonal cut, and no positive-association statement for $c < 1$, is used.

=== 4.1 From word kernels to operators <from-word-kernels-to-operators>

Let $cal(W)$ be the complex vector space spanned by formal strict-row words

$ A^(D_m) \( z_m \) dots.h.c A^(D_1) \( z_1 \) Omega \, wide \| "Re" z_j \| < v \, $

including the empty word $Omega$. Give two words the limiting scalar product obtained by reflecting the first word
  with the adjoint rule of Lemma 2. Proposition 13 proves existence of all these simultaneous limits.
  The form is positive, since every finite Gram matrix is a limit of positive finite-chain Gram matrices.
  We quotient by its null space and complete; the resulting Hilbert space is denoted by $cal(H)$.

#thm([Proposition 4.1.])[
  (The angular representation).  #emph[On $cal(H)$ the rows act as bounded holomorphic operator families, with
$ parallel A^D \( z \) parallel lt.eq 2 parallel D parallel \, wide A^D \( z \)^(*) =
  A^(X overline(D) X) \( - overline(z) \) . $

 They satisfy the finite RTT exchange identities wherever their auxiliary intertwiner is invertible.
   There is a strongly continuous unitary group $U_b$, $b in bb(R)$, fixing $Omega$, such that
#[#set math.equation(numbering: n => "(4.1)")
 $ U_b A^D \( z \) U_b^(*) = A^D \( z + i b \) . $ <eq:angular-covariance>]

 Words with real arguments in any nonempty open subinterval of $\( - v \, v \)$ span a dense subspace.
   The family $P = A^I$ consists of commuting normal operators and has a simultaneous representation by almost
   surely holomorphic scalar functions $f$ on the strip, with
#[#set math.equation(numbering: n => "(4.2)")
 $ f \( - overline(z) \) = overline(f \( z \)) \, wide \| f \( z \) \| lt.eq 2 . $ <eq:angular-scalar-star>]

 In the half-plane coordinate this reality condition reads $f \( overline(w) \) = overline(f \( w \))$.]
] <prop:angular-space>

#proof[
  The uniform normalized row bounds of Lemma 10, applied before taking each Gram limit,
    show that left multiplication by a row preserves null vectors and has the asserted bound.
    Thus it extends to the completion. Adjoint and RTT identities pass to all word pairings and then to bounded
    operators. Matrix coefficients on words are holomorphic by Proposition 13;
    local boundedness extends this to all matrix coefficients and hence to operator holomorphy.
  Translate all arguments of a word by $i b$. In its Gram product the adjoint arguments are translated by the same
    amount, because $- overline(z + i b) = - overline(z) + i b$.
    Common-translation invariance of the word kernels therefore makes this map an isometry.
    Translation by $- i b$ is its inverse. Continuity of the kernels gives strong continuity on words,
    and the isometry bound extends it to $cal(H)$. This proves (4.1).
    Notice that positive dilation of $w$ corresponds to one of the two signs of this unitary parameter.
  If a vector is orthogonal to every word whose real arguments lie in a fixed open interval,
    successive applications of the identity theorem to the word arguments show that it is orthogonal to all strict
    words. This proves density. Commutation of the untwisted rows and their adjoint rule put them in one abelian
    von Neumann algebra. Generate that algebra using a countable dense set of arguments.
    A multiplication representation, together with the uniformly bounded Taylor series on a countable cover of the
    strip, gives scalar analytic representatives on one common set of full measure. This also proves (4.2).
    The spectral measure class is invariant under imaginary translation by (4.1). ◻
]

=== 4.2 Finite division and the two boundary lines <finite-division-and-the-two-boundary-lines>

Boundary rows identify the local spins and the site shift.
  To construct them on $cal(H)$, we first divide the finite marked row by its unmarked counterpart near a swap
  point. The resulting uniform quotient bound continues the vacuum vectors;
  RTT then continues dense word vectors on the same disc. Passing their Taylor series to spectral fibers will give
  scalar continuation with a common radius.

#thm([Lemma 4.2.])[
  (Boundary division and scalar continuation).  #emph[There is $r_lambda > 0$,
    independent of the even chain length, for which the two homogeneous quotients
$ T^D \( z \) T^I \( z \)^(- 1) \, wide T^I \( z \)^(- 1) T^D \( z \) $

 are holomorphic and bounded by $C_lambda parallel D parallel$ on discs of radius $r_lambda$ about $z =
   v$ and $z = - v$. The limiting rows have strong boundary values
#[#set math.equation(numbering: n => "(4.3)")
 $ A^D \( v \) = S D_0 \, wide A^D \( - v \) = \( X D^t X \)_0 S^(- 1) \, $ <eq:angular-endpoints>]

 where $S$ is the unitary site shift and $S Omega = Omega$.
   Almost every spectral function extends analytically and without zeros to bands of a common positive width about
   $"Re" z = plus.minus v$, has modulus one on these lines, and satisfies $\| f \| lt.eq 1$ between them.
   Consequently it is inner in the right half-plane, and every zero $zeta$ satisfies
#[#set math.equation(numbering: n => "(4.4)")
 $ "Re" zeta gt.eq c_0 \| zeta \| $ <eq:angular-cone>]

 for a fixed $c_0 > 0$. At each specified strict argument the spectral set on which $f$ vanishes has measure zero.]
] <lem:scalar-continuation>

#proof[
  Write $u = eta \( v - z \)$, so $u = 0$ at the upper endpoint, and put $b \( u \) =
    sin u \/ sin lambda$ and $r \( u \) = 1 - b \( u \)^2$. Define the reversed unmarked row by
  $ tilde(T)^I \( - u \) = "tr"_(a') #scale(x: 120%, y: 120%)[\(] R_(a' \, L - 1) \( - u \) dots.h.c
    R_(a' \, 0) \( - u \) #scale(x: 120%, y: 120%)[\)] . $
  Multiply $T^D \( u \)$ by this row. Transposition in $a'$ reverses the second auxiliary product;
    factors at different quantum sites then commute past one another.
    The product is therefore the two-auxiliary partial trace of
  $ \( D ⊗ I \) G_0 \( u \) dots.h.c G_(L - 1) \( u \) \, wide G_j \( u \) =
    R_(a j) \( u \) R_(a' j) \( - u \)^(t_(a')) . $
  The auxiliary line spanned by $Phi = 2^(- 1 \/ 2) \( \| + + chevron.r + \| - - chevron.r \)$ is invariant.
    Inversion of $R$ makes the action on this line equal to $r \( u \) I$.
    At $u = 0$ the swap identity makes the range of $G_j \( 0 \)$ lie in $bb(C) Phi ⊗ bb(C)^2$.
    Thus, in the same auxiliary decomposition for every site,
  #[#set math.equation(numbering: n => "(4.5)")
   $ r \( u \)^(- 1) G_j \( u \) = mat(delim: "(", I, B_j \( u \); 0, C_j \( u \)) \, wide
     parallel B_j \( u \) parallel lt.eq C_lambda \, quad parallel C_j \( u \) parallel lt.eq
     C_lambda \| u \| . $ <eq:folded-block>]
  These bounds follow directly from the entries of $R$, since $sin lambda eq.not 0$.
    For example, on a sufficiently small disc of radius proportional to $sin lambda$ one has $\| r \| gt.eq
    3 \/ 4$ and $parallel C_j parallel lt.eq 1 \/ 4$. The upper-right block of the product in (4.5) is bounded by
    a geometric series, while its lower-right block has norm at most $4^(- L)$.
    Taking the unmarked auxiliary trace therefore gives
  $ r \( u \)^(- L) T^I \( u \) tilde(T)^I \( - u \) = I + F_L \( u \) \, wide parallel F_L \( u \) parallel lt.eq
    3 dot.op 4^(- L) . $
  The off-diagonal triangular block has zero auxiliary trace.
    The marked partial trace is uniformly bounded by $C_lambda parallel D parallel$.
    The displayed identity is invertible, so both finite square factors are invertible and
  $ T^D \( u \) T^I \( u \)^(- 1) = #scale(x: 120%, y: 120%)[\(] r \( u \)^(- L) T^D \( u \) tilde(T)^I \( - u \)
    #scale(x: 120%, y: 120%)[\)] \( I + F_L \( u \) \)^(- 1) $
  has the required uniform bound. Reversing the local product gives the same argument with an invariant covector
    and proves the other quotient. Crossing transfers it to the lower endpoint.
    None of these steps uses the sign of $cos lambda$.
  The common finite vacuum remains an eigenvector of $T^I$ in these discs by analytic continuation.
    Its eigenvalue is nonzero there because the row is invertible. Thus
  $ A_L^D \( z \) Omega_L = #scale(x: 120%, y: 120%)[\(] T^D \( z \) T^I \( z \)^(- 1)
    #scale(x: 120%, y: 120%)[\)] Omega_L $
  is uniformly bounded and holomorphic on a common endpoint disc.
    Cauchy’s estimates control every fixed Taylor coefficient and the norm of each Taylor remainder on a smaller
    disc, uniformly in $L$.
  We first use these bounds to construct continued vacuum vectors inside $cal(H)$.
    Take a subsequential Gram enlargement containing the vectors obtained by applying finite words of strict rows,
    endpoint rows and shifts to the vacuum and to these Taylor coefficients.
    Use countable dense strict arguments and a basis of marks.
    The coefficient bounds define a holomorphic vector series on the common disc in this enlargement.
    On its intersection with the strict strip, uniform Taylor remainder bounds identify that series with the
    already constructed strict vacuum vector. Its orthogonal projection onto $cal(H)^perp$ is consequently zero on
    this open intersection, and hence on the entire disc by the identity theorem.
    The continued vacuum vectors therefore belong to $cal(H)$.
    Their pairings with strict words also show uniqueness, independent of the enlargement.
    At the center, the finite swap and crossing identities give the endpoint vectors in (4.3);
    the Cauchy bounds approximate them in norm by nearby strict vacuum vectors.
  Choose a closed interval $I subset \( - v \, v \)$ with nonempty interior such that every RTT intertwiner
    between either endpoint and an angle in $I$ is invertible. Such an interval exists:
    the excluded angles form a finite set. More explicitly, the possible zeros of the intertwiner determinant
    occur at $s in pi bb(Z) plus.minus lambda$, where $s = eta \( z - alpha \)$.
    When $lambda > pi \/ 2$ the possible interior exceptions at the endpoints are $alpha =
    plus.minus \( v - \( pi - lambda \) \/ eta \)$; avoiding these points suffices.
    There is then a common endpoint disc on which all these inverses are bounded.
    Commute an endpoint-near row through a fixed word with angles in $I$.
    RTT expresses the result as a finite sum of bounded strict rows acting on continued marked vacuum vectors.
    The number and bounds of the terms may depend on the word, but the radius of analyticity does not.
    The same finite-chain estimates give norm convergence to the endpoint action.
    Density of the $I$-words and the uniform interior row bound extend this to strong convergence on all of
    $cal(H)$. In particular both $S$ and $S^(- 1)$ preserve $cal(H)$; their restrictions are unitary inverses.
    Successive strong approximations give the same Gram limits for products containing several endpoint rows.
    Define $D_0 = S^(- 1) A^D \( v \)$ and $D_j = S^(- j) D_0 S^j$.
    The finite site-matrix identities pass to these products:
    at each site this is a unital star representation of the $2 times 2$ matrix algebra,
    and matrices at distinct sites commute. Products of these matrices are the local spin operators used below.
  To pass from this vector continuation to scalar continuation with one radius,
    choose countably many dense $I$-words $h_j$ and a finite measure equivalent to the scalar spectral measure.
    On a fixed endpoint disc write the continued vector $P \( z \) h_j$ as $sum_(k gt.eq 0)
    a_(j k) \( z - v \)^k$. For $r' < R$ smaller than its common radius, Cauchy’s estimate gives
  $ parallel a_(j k) parallel_(L^2) lt.eq M_(j \, R) R^(- k) \, wide
    sum_(k gt.eq 0) \( r' \)^k parallel a_(j k) parallel_(L^2) < oo . $
  The series of fiber norms is therefore summable almost everywhere.
    Intersecting over the countable words and radii produces pointwise holomorphic vector series on the same disc.
    On the interior part each series equals $f \( z \) h_j$. Its continuation is consequently proportional to
    $h_j$. At almost every spectral point at least one $h_j$ is nonzero,
    and the resulting scalar ratios agree by the identity theorem.
    This constructs the scalar continuation on a common disc.
  Equation (4.3) gives unitary values at both endpoints. Covariance and strong convergence give unitary boundary
    values at $plus.minus v + i b$. Applying this first on a countable dense set of $b$’s and then using
    continuity shows that $\| f \| = 1$ on each continued boundary diameter.
    Schwarz reflection gives $f \( z \) overline(f \( 2 v - overline(z) \)) = 1$ there,
    and the analogous formula at $- v$. Thus the continued functions are nonzero.
    Rational imaginary translations cover the boundary lines by discs of one radius, with a common null set.
    The bounded strip maximum principle now yields $\| f \| lt.eq 1$.
    Under $w = e^(i z)$ the excluded boundary bands give (4.4). Finally each scalar function has isolated zeros.
    Fubini on an imaginary-translation orbit gives a null zero set at almost every point of that orbit,
    and invariance of the spectral measure class transfers the assertion to every specified point. ◻
]

The scalar continuation has a consequence on the entire Hilbert space $cal(H)$,
  before any restriction on the marks. Canonical inner factorization,
  in the form recalled in #cite(label("AiDongJiang2019")) pp. 1367–1368,
  Equations (1)–(3) and transferred from the disk by the Cayley map, gives

#[#set math.equation(numbering: n => "(4.6)")
 $ f \( w \) = gamma e^(- a w - b \/ w) product_j beta_j \( w \) \, wide a \, b gt.eq 0 \, quad \| gamma \| = 1 \,
   $ <eq:general-inner-factorization>]

where $beta_j$ is a constant-phase multiple of $\( w - zeta_j \) \/ \( w + overline(zeta)_j \)$ and $sum_j "Re"
  zeta_j \/ \( 1 + \| zeta_j \|^2 \) < oo$. Continuation through every nonzero finite point of the imaginary axis
  excludes singular measure there. The only possible remaining boundary singularities are at $0$ and $oo$,
  giving the factors $e^(- b \/ w)$ and $e^(- a w)$. The zero cone (4.4) holds on this full space as well.
  We will use this general form for the full-space energy bounds. Diagonal words permit a further conclusion:
  below we show that their spectral functions have no singular factors and only finitely many zeros.

=== 4.3 Identification with the physical plane <identification-with-the-physical-plane>

We next fix the probabilistic meaning of this representation.
  The physical row angle is $z = 0$, or $w = 1$, and the physical weights are $c R \( lambda \/ 2 \)$, with $a =
  b = 1$. Multiplying every vertex weight by $c$ does not affect any normalized finite-volume law.

#thm([Proposition 4.3.])[
  (Physical law, both axes, and reflection).  #emph[The row representation gives the local probabilities of the
    plane law $bb(P)_c$ in Theorem 1. In particular its prescribed iterated balanced-torus limit exists when $c <
    1$. Quantization with time pointing east and quantization with time pointing north describe this same law.
    For an ordinary observable supported on one side of either coordinate cut,
    the squared norm of its prepared state is its expectation paired with its complex-conjugate reflected
    observable, with the corresponding spin reflection. Products of neutral height observables may be prepared
    using paths confined to that side.]
] <prop:physical-plane>

#proof[
  At fixed even transverse length, primitivity of the physical transfer in the chosen sector identifies the
    long-torus limit with its normalized Perron vector. A finite collection of arrows is read by physical row
    steps on a seam and by spins on finitely many equal-time sections.
    Repeated seam marks are combined, and the spins are expressed by (4.3).
    Its joint probabilities are therefore finite linear combinations of strict and endpoint word coefficients.
    Their limits exist by Proposition 13 and Lemma 16. When $c <
    1$ the root construction used the exactly balanced sector, so these are precisely the two limits,
    in their prescribed order, defining $bb(P)_c$.
  #strong[The two axes when $c < 1$.] Here the exactly balanced roots already identify the cylinder limit.
    To compare its two axial quantizations, fix a rectangle. Orient its input path upward along the left side and
    then eastward along the top side, and express all spins relative to those directed steps.
    Let $K$ be the tensor of its unmarked physical tiles, viewed as a matrix from the input sides to the other two
    sides. It is a product of physical $R \( lambda \/ 2 \)$ matrices and permutations of tensor factors.
    The local eigenvalues before the harmless factor $c$ are $1 \/ c \, 1 \/ c \, 1 \/ c + 1 \, 1 \/ c - 1$.
    Thus $K$ is invertible for $c < 1$.
  For a finite surrounding cylinder, cut on all four sides and contract the exterior with its normalized vacuum
    data. This gives a linear functional $L$ of the inside matrix, with $L \( K \) = 1$.
    The normalization includes the exterior transfer eigenvalues appropriate to that cylinder.
    Putting elementary matrices $D_1 \, dots.h \, D_q$ on the input path tests the functional on
    $K \( D_1 ⊗ dots.h.c ⊗ D_q \)$: the row index of each mark is inside and its column index outside.
    Since tensor products of elementary matrices span the input matrix algebra and $K$ is fixed and invertible,
    the limiting marked path values determine every entry of the limiting exterior functional.
    They also prove that those entries have limits.
  In the eastward representation the successive path angles are $v \, 0$; in the northward representation,
    with space pointing west, they are $0 \, - v$. To compare them,
    first replace the first pair by $\( v - epsilon \, epsilon \)$ and translate both angles by $- v$.
    The resulting pair is $\( - epsilon \, - v + epsilon \)$, still strict.
    Common-translation invariance identifies the marked word values.
    Strong boundary convergence then permits $epsilon arrow.b 0$. The spin and matrix-index conventions agree:
    at a reversed collapsed step the mark is $X D^t X$, exactly as in (4.3).
    Crossing only relabels those spins; the interior physical tensor remains $K$.
    Thus the two normalized limiting functionals agree on $K D$ for every elementary tensor $D$,
    and hence on every inside matrix. All local arrow probabilities agree.
    This argument compares normalized exterior functionals; it requires no equality between eigenvalues of
    cylinders of different circumferences.
  #strong[Identification when $c gt.eq 1$.] In this range we must identify the state also when the root
    construction uses sectors tending to half filling. Let $W_c$ be the physical vertex weight and,
    for a stationary probability measure $rho$ on allowed arrow configurations, put
  #[#set math.equation(numbering: n => "(4.7)")
   $ cal(F)_c \( rho \) = - h \( rho \) - bb(E)_rho log W_c \, $ <eq:angular-free-energy>]
  where $h$ is specific entropy per vertex. The equivalent gradient formulation fixes the height parity and
    forgets an additive constant; these changes have zero entropy cost per unit area.
    Spatial translation acts on gradients: after translating an anchored height representative,
    one subtracts its new reference value. Thus fixing the reference parity does not remove any physical
    translation from the gradient action. The domain and reference-height convention are those of
    #cite(label("Sheffield2005")) Section 2.3 and Appendix B;
    the entropy–energy decomposition is also explicit in #cite(label("LammersTassy2024")) Sections 2.3.2–2.3.4.
    Since the alphabet is finite and $0 < c < oo$, the entropy and local energy in (4.7) are finite.
    Hard constraints are included by restricting to allowed configurations.
  Write $U \( 0 \)$ for the homogeneous harmonic normalization in Lemma 10, and set $p_(*) = U \( 0 \) + log c$.
    The same boundary-unitarity and strip argument used there applies to a row with specified auxiliary input and
    output spins: it is a matrix-unit auxiliary mark. A rectangle of width $a$ and height $b$,
    with any boundary data, therefore has partition sum at most
  $ exp { a b p_(*) + C \( a + b \) } . $
  Indeed each open row has operator norm at most $2 e^(a p_(*))$,
    and summing the boundary spins costs only an exponential in its perimeter.
    The finite entropy variational inequality on the rectangle then gives $h \( rho \) + bb(E)_rho log W_c lt.eq
    p_(*)$ for every stationary allowed state.
  For the near-balanced tori, choose their longitudinal lengths sufficiently large to realize the Perron
    asymptotic. Their constrained log partition functions per vertex tend to $p_(*)$ by Lemma 10.
    Tile each torus by fixed-size squares. Entropy subadditivity, with a negligible uncovered fraction,
    bounds its entropy per vertex above by the entropy of a fixed-square marginal divided by the square area,
    plus a vanishing boundary error. Pass to the local limit at this fixed square size,
    then let the square size grow. The exact finite identity “entropy plus mean log weight equals log partition
    function” proves the reverse inequality $h \( rho \) + bb(E)_rho log W_c gt.eq p_(*)$.
    Hence the limiting state attains the global minimum of (4.7).
    Its expected spatial tilt is zero by the sector sizes. The other expected tilt is zero as well:
    at the physical angle the current mark is skew-adjoint, whereas its finite physical expectation is real.
    This observation specifies the tilt; it is not being used as a uniqueness argument.
  The equilibrium characterization following equation (6) in #cite(label("DKLM2026")), for $1 lt.eq c lt.eq 2$,
    identifies the finite-specific-free-energy minimizer with the balanced plane law.
    We spell out the variational-domain reduction needed to apply this characterization,
    since a zero expected tilt alone would not suffice. For a fixed spatial translation lattice $cal(L)$,
    let $cal(P)_(cal(L))$ denote invariant laws of allowed gradients and write
  $ sigma_(cal(L)) \( a \) = inf { cal(F)_c \( rho \) : rho in cal(P)_(cal(L)) \, med S \( rho \) = a } . $
  Here $S \( rho \)$ is the expected physical slope. Both the preceding perimeter bound and the tiling proof apply
    on this domain, using the average energy over a fundamental cell if necessary.
    We keep the same $cal(L)$ when forming the infimum and the ergodic decomposition.
    The surface tension is unchanged on passing from full translations to a finite-index sublattice:
    average any sublattice-invariant law over the finitely many translation cosets.
    This preserves its slope and its entropy–energy density and makes it fully invariant;
    the reverse inequality between the infima follows from inclusion of the domains.
    Thus one may use the full physical gradient translation action.
    If a periodic height-potential representation uses a parity-preserving sublattice,
    the argument is performed throughout on that sublattice and is then projected back to arrows.
  Specific free energy is affine under this ergodic decomposition #cite(label("Sheffield2005")) Chapter 3.
    Thus every component of a globally minimizing law is itself a global minimizer:
    each component has free energy at least the global infimum, and their average equals it.
    For $c gt.eq 1$, strict convexity of the six-vertex surface tension on the interior of its slope domain is
    #cite(label("LammersTassy2024")) Theorem 13.16 of the 2020 preprint.
    Its stated condition is $c^2 gt.eq max \( 1 \, 1 \)$, and the accompanying simply-attractive-potential
    description supplies the height-model setting. Arrow reversal makes $sigma_(cal(L))$ even.
    The origin is an interior slope: height functions formed as sums of two one-dimensional unit-increment paths
    give allowed stationary gradient laws at every slope in $\[ - 1 \, 1 \]^2$,
    all of finite specific free energy. Hence strict convexity implies $sigma_(cal(L)) \( a \) >
    sigma_(cal(L)) \( 0 \)$ for every nonzero interior $a$. A boundary slope cannot be another minimizer:
    otherwise convexity along the segment from $0$ to that slope would contradict this strict inequality at an
    interior point. Every minimizing ergodic component therefore has slope zero and is a fixed-slope minimizer.
    The variational principle makes it a minimal gradient phase.
  At this last step we use the zero-slope uniqueness supplied by the combined equilibrium characterization in
    #cite(label("DKLM2026")), with its Sheffield and delocalization inputs and its range $1 lt.eq c lt.eq 2$.
    This is not an assertion of uniqueness for every Gibbs state, nor an extension to $c > 2$.
    The domain reduction above explains why the possibly nonergodic auxiliary state is covered,
    even when a formulation of the underlying height result is stated for minimal phases.
    The gradient-to-arrow correspondence is one-to-one after forgetting the additive height constant,
    so their common law is $bb(P)_c$. The same argument applies to either axial quantization,
    and therefore identifies the two orientations as well.
  #strong[Reflection across a coordinate cut.] In either homogeneous axial quantization,
    transposing the finite row product at a coordinate cut reflects its tiles and changes the spin mark by the
    stated adjoint rule. The finite Gram square is therefore the expectation of the observable and its conjugate
    reflected copy. Pass to the local and Gram limits to obtain the assertion.
    Neutral height differences can be read along paths on the prescribed side of the cut,
    so the same identity applies to their finite products. ◻
]

=== 4.4 Finite inner functions and a measure on dilation orbits <finite-inner-functions-and-a-measure-on-dilation-orbits>

We now restrict when indicated to the closed diagonal-word subspace $cal(D) subset cal(H)$:
  it is generated by words all of whose marks are diagonal.
  It is invariant under $P \, J$ and their adjoints, where $J = A^Z$ and $Z = "diag" \( 1 \, - 1 \)$.
  Endpoint diagonal rows show that it contains the states needed for ordinary height insertions.
  Write $P \( w \)$ and $J \( w \)$ in half-plane coordinates from now on.

#thm([Lemma 4.4.])[
  (Inner spectra and the current measure).  #emph[On $cal(D)$,
    almost every spectral function is either $1$ or a finite Blaschke product in the right half-plane, with
#[#set math.equation(numbering: n => "(4.8)")
 $ f \( 0 \) = f \( oo \) = 1 \, wide f \( overline(w) \) = overline(f \( w \)) . $ <eq:finite-inner-symmetry>]

 Its zeros obey (4.4). In particular its degree is even; write it as $2 n_f$ when it is nonconstant.
   Every zero produces a fixed-width, fixed-depth dip of $\| f \( e^s \) \|$ near its logarithmic radius.]
  #emph[There is a possibly infinite positive measure $mu$ on the nonconstant functions and a measurable spectral
    vector $sans(h)$ such that
#[#set math.equation(numbering: n => "(4.9)")
 $ J \( w \) Omega = \( 1 - f \( w \) \) sans(h) \, wide mu \( thin upright(d) f \) =
   parallel sans(h) \( f \) parallel^2 thin sigma \( thin upright(d) f \) . $ <eq:current-cocycle>]

 Here $sigma$ is any scalar measure used for the direct-integral representation;
   the resulting measure $mu$ does not depend on that choice. It is invariant under dilation of the argument.
   On the cross-section where the smallest zero radius is one, it has the form
#[#set math.equation(numbering: n => "(4.10)")
 $ mu = thin upright(d) s thin nu \( thin upright(d) F \) \, wide f \( w \) = F \( e^s w \) \, wide kappa :=
   nu \( 1 \) < oo . $ <eq:orbit-disintegration>]

 If $cal(L) \( F \)$ is the difference between its largest and smallest logarithmic zero radii, then
#[#set math.equation(numbering: n => "(4.11)")
 $ nu { cal(L) > t } lt.eq C e^(- 2 eta t) quad \( t gt.eq 1 \) . $ <eq:orbit-width-tail>]

 For a fixed diagonal word $h$,
#[#set math.equation(numbering: n => "(4.12)")
 $ parallel \( 1 - P \( e^s \) \) h parallel lt.eq C_h e^(- eta \| s \|) . $ <eq:diagonal-boost-tail>]

 For products of fixed words placed at scales $r_i$, the corresponding bound outside their fixed internal argument
   ranges is $C sum_i e^(- eta \| s - log r_i \|)$, uniformly when these ranges separate.]
] <lem:inner-spectra>

#proof[
  As an auxiliary argument is dilated far from all arguments in a fixed word,
    the scalar-normalized RTT intertwiner tends to an invertible diagonal matrix,
    with error $O \( e^(- eta \| s \|) \)$. Its limiting diagonal matrix commutes with the diagonal joint
    auxiliary marks. Move $P \( e^s \)$ through the word to the vacuum, where it equals the identity.
    The exchange errors are finite sums of bounded marked-row products, proving (4.12).
    Moving through several separated groups gives the stated sum, since the number of factors is fixed.
    These are operator-norm bounds on each finite exchange error, not just bounds on its vacuum expectation.
  On a countable total set in $cal(D)$, the spectral integral of $\| 1 -
    f \( e^s \) \|^2$ over $s$ is consequently finite. Apply the full-space factorization (4.6).
    If $a > 0$ or $b > 0$, then $\| f \( e^s \) \|$ tends to zero at one end,
    contrary to the integrability just proved. For a zero $zeta$ with $r = \| zeta \|$, the identity
  $ lr(|frac(t - zeta, t + overline(zeta))|)^2 = 1 - frac(4 t "Re" zeta, \| t + overline(zeta) \|^2) \, wide t > 0 \, $
  and (4.4) imply $1 - \| f \( e^s \) \| gt.eq epsilon_0$ whenever $\| s - log r \| lt.eq delta_0$,
    with fixed positive $epsilon_0 \, delta_0$. Infinitely many zeros would escape to one end and supply
    infinitely many disjoint such intervals, again contradicting integrability.
    The resulting finite product has limits at both ends, and integrability forces both limits to be one.
    Reality was already established. Nonreal zeros occur in conjugate pairs,
    and the endpoint quotient is $\( - 1 \)^(deg f)$, so the degree is even. This proves (4.8) and the dip assertion.
  Differentiate commutation of equal diagonal-twist transfers at twist zero and apply it to $Omega$.
    Since $P \( w \) Omega = Omega$, it gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ \( 1 - P \( w' \) \) J \( w \) Omega = \( 1 - P \( w \) \) J \( w' \) Omega . $ <eq:twist-cocycle>]
  There is no component of $J \( w \) Omega$ on $f = 1$. Indeed, let $Q$ be the projection to that spectral set,
    which contains $Omega$. The endpoint identities and their dilates glue $Q J \( w \)
    Q$ to the left half-plane by $Q J \( - w \) Q = - Q J \( w \) Q$, because $P \( w \) = I$ on $Q$.
    It is bounded on the punctured plane, so the singularities at zero and infinity are removable.
    Liouville’s theorem and oddness make it zero. On every nonconstant fiber $\| f \( 1 \) \| < 1$,
    so one may set $sans(h) = J \( 1 \) Omega \/ \( 1 - f \( 1 \) \)$.
    Equation (4.13) gives (4.9), first at a countable set of arguments and then everywhere,
    including endpoints by strong convergence. Covariance, with $U_b Omega = Omega$,
    makes this quotient transform without a scalar multiplier.
    Its squared fiber norm therefore gives a dilation-invariant measure.
  Every nonconstant finite product has a unique smallest zero radius.
    Rescale it to one to obtain a measurable cross-section. Translation invariance in its logarithmic dilation
    coordinate gives (4.10), initially as a sigma-finite disintegration.
    Each orbit has a dip of fixed width at its first zero, where $\| 1 - f \( 1 \) \| gt.eq epsilon_0$. Since
  $ integral \| 1 - f \( 1 \) \|^2 thin upright(d) mu = parallel J \( 1 \) Omega parallel^2 < oo \, $
  this disintegration is locally finite and $kappa < oo$.
  Applying (4.12) to $J \( 1 \) Omega$ gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ I \( l \) := integral \| 1 - f \( 1 \) \|^2 \| 1 - f \( e^l \) \|^2 thin upright(d) mu lt.eq
     C e^(- 2 eta l) wide \( l gt.eq 1 \) . $ <eq:two-dip-bound>]
  On an orbit of width $cal(L)$, integrate first over the dip window of its smallest zero and then over $l$
    placing the second argument in the dip window of its largest zero.
    Both intervals have a fixed width and both factors a fixed lower bound. Thus
  $ c thin nu { cal(L) > t } lt.eq integral_(t - 2 delta_0)^oo I \( l \) thin upright(d) l \, $
  after changing the constant for bounded $t$. This proves (4.11). ◻
]

=== 4.5 Low spectral bands and the two leading current modes <low-spectral-bands-and-the-two-leading-current-modes>

We now return to the full space $cal(H)$. The low-energy estimates will be used with arbitrary local spin states,
  so the finite-product conclusion on $cal(D)$ is not enough for this part of the argument.
  The full-space factorization (4.6) will instead control the zeros and the possible singular factors.
  Our aim is to isolate the two leading angular modes of a current after time damping. Define

$ H_0 = - log \| P \( 1 \) \| \, wide Q_u = upright(bold(1))_(\[ 0 \, u \]) \( H_0 \) \, wide Q_u^sigma =
  Q_u upright(bold(1))_({ "sgn" P \( 1 \) = sigma }) \, quad sigma = plus.minus 1 . $

The logarithm is defined by spectral calculus; the fixed-argument no-zero assertion makes its value finite almost
  everywhere. Put

#[#set math.equation(numbering: n => "(4.15)")
 $ N \( w \) = 1 / 2 { J \( w \) P \( w \) + P \( w \) J \( w \) } . $ <eq:angular-N-definition>]

This current averages the two positions of a mark among two consecutive steps.
  Its two leading Laurent modes will become the two continuum currents. The factor $1 \/ 2$ will be retained throughout.

#thm([Lemma 4.5.])[
  (Low-band current estimates).  #emph[There are constants $A \, a \, C \, u_0 > 0$ such that, for $0 < u < u_0$,
    $Q_u J \( w \) Q_u$ extends to a bounded holomorphic function on the full annulus $A u < \| w \| < a \/ u$. If
#[#set math.equation(numbering: n => "(4.16)")
 $ Q_u J \( w \) Q_u = sum_(j in bb(Z)) w^j J_(u \, j) \, $ <eq:angular-Laurent>]

 then $parallel J_(u \, j) parallel lt.eq C \( C u \)^(\| j \|)$, with the exponent zero for $j = 0$.
   Set $theta = eta \/ 2 > 0$. Uniformly on the closed right unit semicircle,
#[#set math.equation(numbering: n => "(4.17)")
 $ parallel Q_u^sigma J \( w \) Q_u^sigma parallel & lt.eq
   C u \, & parallel Q_u^sigma J \( w \) Q_u^(- sigma) parallel & lt.eq C u^theta \,\
Q_u^sigma N \( w \) Q_u^sigma & = sigma Q_u^sigma \( w J_(u \, 1) + w^(- 1) J_(u \, - 1) \) Q_u^sigma + O \( u^2 \) \,\
parallel Q_u^sigma N \( w \) Q_u^(- sigma) parallel & lt.eq
  C u^(1 + theta) \, & parallel Q_u N \( w \) Q_u parallel & lt.eq C u . $ <eq:angular-J-bands>]

 The estimates remain valid for unequal input and output cutoffs, using their maximum for $u$.
   With $m$ ordinary time rows on each side, $N$ costs $O \( m^(- 1) \)$ and a sign-opposite undoubled $J$ costs
   $O \( m^(- theta) \)$. The leading-mode remainder is $O \( m^(- 1 - theta) \)$ when,
   on each dyadic input/output block, the leading expression is taken at the larger cutoff;
   the precise block sum is defined in the proof.]
  #emph[Finally, if $S = P \( i \)$ and $K$ is the principal argument of $S^2$, then
#[#set math.equation(numbering: n => "(4.18)")
 $ S^2 = e^(i K) \, wide \| K \| lt.eq C H_0 . $ <eq:angular-phase-bound>]

]
] <lem:low-band>

#proof[
  #strong[The zero budget and analytic annulus.] Evaluate (4.6) at $1$. On the band $H_0 lt.eq u$ it gives
  $ a + b + 1 / 2 sum_j log (1 + frac(4 "Re" zeta_j, \| 1 - zeta_j \|^2)) lt.eq u . $
  The cone condition implies the zero budget
  #[#set math.equation(numbering: n => "(4.19)")
   $ a + b + sum_j min \( \| zeta_j \| \, \| zeta_j \|^(- 1) \) lt.eq C u . $ <eq:angular-zero-budget>]
  Indeed $"Re" zeta_j gt.eq c_0 \| zeta_j \|$ and $\| 1 - zeta_j \| lt.eq 1 + \| zeta_j \|$.
    Each zero is therefore either of radius at most $C u$ or of reciprocal radius at most $C u$.
    Comparing each factor at $w$ and at $1$ shows, on $A u < \| w \| < a \/ u$, $"Re" w gt.eq 0$, that
  $ lr(|log frac(f \( w \), f \( 1 \))|) lt.eq C u \( \| w \| + \| w \|^(- 1) \) . $
  Choose $A$ large and $a$ small once and for all. The function and its inverse are then bounded on this
    half-annulus. More precisely,
  #[#set math.equation(numbering: n => "(4.20)")
   $ P \( w \) Q_u^sigma = sigma Q_u^sigma + O #scale(x: 120%, y: 120%)[\(] u \( \| w \| + \| w \|^(- 1) \)
     #scale(x: 120%, y: 120%)[\)] \, $ <eq:angular-band-sign>]
  and the same estimate holds for the inverse restricted to the band.
  The endpoint formulas give
  $ J \( i \) = S Z_0 \, wide J \( - i \) = - Z_0 S^(- 1) \, wide J \( - i \) = -
    P \( i \)^(- 1) J \( i \) P \( i \)^(- 1) . $
  The other endpoint gives the analogous identity on the other ray.
    Dilate these uncompressed identities using (4.1), and only then compress.
    This is important because $Q_u$ need not commute with the dilation group. The formula
  #[#set math.equation(numbering: n => "(4.21)")
   $ J_u \( - w \) = - P \( w \)^(- 1) J_u \( w \) P \( w \)^(- 1) \, wide J_u \( w \) = Q_u J \( w \) Q_u \,
     $ <eq:angular-current-gluing>]
  defines the left half of the annulus; both inverses here and below are only on $Q_u cal(H)$.
    Boundedness and strong boundary convergence make the two definitions agree on both imaginary rays.
    Scalar Morera applied to every matrix coefficient gives holomorphic gluing.
    Thus $parallel J_u \( w \) parallel lt.eq C$ on the full annulus.
    Cauchy’s formula on circles near its inner and outer boundaries proves (4.16) and its coefficient bounds.
    In particular, uniformly on $\| w \| = 1$,
  #[#set math.equation(numbering: n => "(4.22)")
   $ 1 / 2 \( J_u \( w \) - J_u \( - w \) \) = w J_(u \, 1) + w^(- 1) J_(u \, - 1) + O \( u^3 \) =
     O \( u \) . $ <eq:angular-odd-expansion>]
  The nonconstant even modes are $O \( u^2 \)$, but this observation alone does not control the constant coefficient.
  #strong[Sign blocks and the leading modes.] For $X_(sigma tau) \( w \) = Q_u^sigma J \( w \) Q_u^tau$,
    (4.21) and (4.20) give
  $ X_(sigma tau) \( - w \) = - sigma tau X_(sigma tau) \( w \) + O \( u \) parallel X_(sigma tau) \( w \) parallel . $
  On an equal-sign block its even part is therefore bounded by $C u parallel X_(sigma sigma) \( w \) parallel$.
    Its odd part is $O \( u \)$ by (4.22). Absorbing gives $parallel X_(sigma sigma) parallel lt.eq
    C u$ and then an $O \( u^2 \)$ bound for its whole even part, including the constant coefficient.
    This proves the first estimate in (4.17).
  For opposite signs use an additional RTT comparison at $r = sqrt(u)$.
    The normalized intertwiner for arguments $r \, w$ is $R_oo + O \( r^eta \)$ with bounded inverse,
    uniformly for $w$ on the closed right unit semicircle; $R_oo$ is diagonal and invertible.
    It commutes with the joint mark $I ⊗ Z$. Conjugating this mark and expanding the $O \( r^eta \)$ error in
    tensor matrix units, each producing a bounded marked-row product, proves
  $ parallel \[ P \( r \) \, J \( w \) \] parallel lt.eq C r^eta . $
  Strong approximation includes the endpoints. On $Q_u^sigma$, $P \( r \) = sigma I + O \( sqrt(u) \)$ by (4.20).
    Compression of the commutator yields
  $ \( 2 - C sqrt(u) \) parallel X_(sigma \, - sigma) \( w \) parallel lt.eq C u^(eta \/ 2) \, $
  which proves the second estimate in (4.17). Inserting $P \( w \) = sigma I +
    O \( u \)$ in (4.15) now proves (4.17)–(4.17): equal signs add, whereas opposite signs cancel.
    In the latter case the odd part of $X$ is itself $O \( u^(1 + theta) \)$ by the gluing identity.
    Thus the leading expression can equivalently be written
  $ 1 / 2 { "sgn" \( P \( 1 \) \) Q_u \, w J_(u \, 1) + w^(- 1) J_(u \, - 1) } + O \( u^(1 + theta) \) $
  on the whole band. Higher modes need not vanish at a fixed cutoff;
    the displayed error is what removes them after rescaling.
  #strong[Time damping and shift phase.] For unequal bands embed both in their larger band.
    Here is the precise meaning of the damped leading-mode remainder.
    For large $m$, put $t_q = 2^q \/ m$ and let $q_m$ be the largest integer with $t_(q_m) < u_0$.
    Let $B_0 = upright(bold(1))_(\[ 0 \, t_0 \]) \( H_0 \)$, $B_q =
    upright(bold(1))_(\( t_(q - 1) \, t_q \]) \( H_0 \)$ for $1 lt.eq q lt.eq q_m$, and let $B_(*) = I -
    sum_(q = 0)^(q_m) B_q$. Write $Sigma = "sgn" P \( 1 \)$ and define
  $ L_u \( w \) = 1 / 2 { Sigma Q_u \, w J_(u \, 1) + w^(- 1) J_(u \, - 1) } \, wide u_(q r) = max \( t_q \, t_r \) . $
  On the pair of low bands $B_q \, B_r$ the preceding estimates give
  $ parallel B_q \( N \( w \) - L_(u_(q r)) \( w \) \) B_r parallel lt.eq C u_(q r)^(1 + theta) . $
  Thus the leading operator after damping is the finite block sum
  $ L_m^(upright("damp")) \( w \) = sum_(q \, r = 0)^(q_m) P \( 1 \)^m B_q L_(u_(q r)) \( w \) B_r P \( 1 \)^m . $
  Each block uses its own larger cutoff; no cutoff-independent Laurent coefficient is asserted.
    On $B_q$ with $q gt.eq 1$, time damping contributes at most $e^(- m t_q \/ 2)$.
    For every $beta > 0$ the corresponding double sum is bounded by
  $ C_beta m^(- beta) sum_(q \, r gt.eq 0) max \( 2^q \, 2^r \)^beta e^(- c \( 2^q + 2^r \)) lt.eq
    C'_beta m^(- beta) \, $
  where the lowest bands are absorbed into the constant. Taking $beta = 1 + theta$ gives
  $ parallel P \( 1 \)^m N \( w \) P \( 1 \)^m - L_m^(upright("damp")) \( w \) parallel lt.eq C m^(- 1 - theta) . $
  Indeed any term involving $B_(*)$ is exponentially small:
    its spectrum lies above $t_(q_m) gt.eq u_0 \/ 2$, and $N$ is globally bounded.
    The same block sum with $beta = 1$ bounds the damped $N$ itself, and with $beta =
    theta$ bounds a sign-opposite $J$. These arguments also work when the damping rows range in a fixed compact
    strict-angle interval. Schwarz–Pick compares their modulus loss $1 - \| f \( w \) \|$ uniformly with $1 - \|
    f \( 1 \) \|$. On low bands this is comparable to $H_0$; on the remaining spectrum it is bounded below by a
    positive constant.
  On a sufficiently small band, (4.20) at $w = i$ gives $\| arg f \( i \)^2 \| lt.eq C H_0 \( f \)$,
    by applying the estimate with cutoffs decreasing to the fiber value.
    On its complement the principal argument is at most $pi$, which is also bounded by a fixed multiple of $H_0$.
    Spectral calculus proves (4.18). ◻
]

=== 4.6 The endpoint Hamiltonian and the sum rule <the-endpoint-hamiltonian-and-the-sum-rule>

The contraction $P \( 1 \)$ measures time damping. We also need the generator obtained by differentiating the
  unitary endpoint, because it is local on spin states. These are different operators:
  we keep the notation $H_0$ for the former and $E$ for the latter.

#thm([Lemma 4.6.])[
  (The local endpoint generator).  #emph[The nonnegative self-adjoint spectral operator
#[#set math.equation(numbering: n => "(4.23)")
 $ E = S^(- 1) partial_z P \( z \) \|_(z = v) \, wide E \( f \) = - partial_s arg f \( i e^s \)\|_(s = 0) \,
   $ <eq:angular-endpoint-energy>]

 agrees on local-spin vectors with the vacuum-subtracted nearest-neighbor Hamiltonian whose link is
#[#set math.equation(numbering: n => "(4.24)")
 $ h_(j \, j + 1) = - eta thin "swap"_(j \, j + 1) R'_(j \, j + 1) \( 0 \) =
   mat(delim: "(", eta cot lambda, 0, 0, 0; 0, 0, - eta \/ sin lambda, 0; 0, - eta \/ sin lambda, 0, 0; 0, 0, 0,
   eta cot lambda)_(j \, j + 1) . $ <eq:angular-local-link>]

 In particular $\[ h_(j \, j + 1) \, Z_j + Z_(j + 1) \] = 0$ and $E Omega = 0$.
   The closure of the local-spin subspace reduces $E$, and its real-time evolution is the local Hamiltonian
   evolution. For all sufficiently small $u$,
#[#set math.equation(numbering: n => "(4.25)")
 $ upright(bold(1))_({ E lt.eq u }) lt.eq upright(bold(1))_({ H_0 lt.eq C u }) . $ <eq:angular-E-H-comparison>]

 With $Z_1 = S^(- 1) Z_0 S$, the exact adjacent-pair identity is
#[#set math.equation(numbering: n => "(4.26)")
 $ N \( i \) = 1 / 2 S^2 \( Z_0 + Z_1 \) . $ <eq:angular-adjacent-current>]

]
] <lem:endpoint-Hamiltonian>

#proof[
  Differentiate the inner factors along the imaginary boundary.
    The singular factors in (4.6) contribute $a + b$, and a zero $zeta$ contributes
  #[#set math.equation(numbering: n => "(4.27)")
   $ frac(2 "Re" zeta, \| i - zeta \|^2) . $ <eq:angular-zero-energy>]
  All contributions are nonnegative. Scalar continuation makes the derivative finite almost everywhere and
    justifies the sum, or one may first differentiate finite partial products and use positivity.
    Since $partial_z = i w partial_w$, this is exactly the spectral derivative in (4.23).
    The cone condition bounds (4.27) below by a constant times $min \( \| zeta \| \, \| zeta \|^(- 1) \)$.
    Thus small $E$ implies the small/large zero budget in (4.19).
    On that budget the negative logarithm of each factor at $1$ is bounded above by the same quantity.
    This proves (4.25).
  At finite length, differentiate one factor in the swap row and divide by its shift.
    The inserted link is $- eta "swap" R' \( 0 \)$, proving (4.24).
    Dividing by the vacuum eigenvalue subtracts its vacuum energy.
    For a fixed local matrix $O$, the finite action on $O Omega_L$ is therefore
  $ [sum_j h_(j \, j + 1) \, O] Omega_L \, $
  where only links meeting the support of $O$ occur. To justify passing this derivative to the limit,
    write the local matrix as a linear combination of products of one-site matrices,
    inserting identity marks at gaps. Put $B_L \( D \) = A_L^D \( v \) = S_L D_0$. The finite identity
  $ B_L \( D_m \) dots.h.c B_L \( D_1 \) = S_L^m \( D_m \)_(m - 1) dots.h.c \( D_1 \)_0 $
  expresses $O Omega_L$, after a fixed translation if needed,
    as a finite sum of upper-endpoint words with a single power of $S_L$ outside the word.
    First commute the unmarked row $P_L \( z \)$ through that outer shift.
    Then move it through the upper-endpoint rows by RTT. The intertwiner at coincident upper-endpoint arguments is
    the invertible permutation matrix, so all these exchanges are analytic on a fixed small disc about $v$.
    Changed auxiliary marks still belong to the same finite-dimensional matrix algebra.
    Each resulting term is a bounded endpoint word applied to a continued marked vacuum vector,
    which has the uniform Taylor bounds from the finite division estimate.
    This proves wordwise vector Taylor bounds for $P_L \( z \) O Omega_L$ on that disc.
    The same Gram and uniform-remainder argument as in Lemma 16 identifies the continued vector in $cal(H)$.
    Cauchy’s formula therefore passes its derivative, in norm and in all Gram pairings,
    to the spectral derivative. Consequently
  #[#set math.equation(numbering: n => "(4.28)")
   $ E \( O Omega \) = [sum_j h_(j \, j + 1) \, O] Omega . $ <eq:angular-local-commutator>]
  Iterating is legitimate because the commutator remains local.
    If $O$ is supported on an interval of length $ell$, each new commutator enlarges the support by at most two.
    Its norm is bounded by $2 parallel h parallel$ times the number of interacting links. Hence
  $ parallel E^k O Omega parallel lt.eq C_O C_O^k k ! . $
  Local vectors are analytic for the symmetric operator specified by (4.28).
    Analytic-vector uniqueness makes its closure self-adjoint on their closed span.
    Since $E$ extends this operator, the span reduces $E$ and the two self-adjoint operators agree there.
    This also identifies real-time evolution. Finally $J \( i \) = S Z_0$ and $P \( i \) = S$ in (4.15) give (4.26). ◻
]

#thm([Lemma 4.7.])[
  (Energy and winding sum rule).  #emph[Let $p$ denote the phase of the unit shift $S = P \( i \)$, modulo $2 pi$,
    and let $"sym"$ average a measure at $p$ and $- p$. Set
$ D_0 = - chevron.l Omega \, \[ Z_0 \, \[ Z_0 \, h_(0 \, 1) \] \] Omega chevron.r . $

 Away from $p = 0$, the projection of the current measure obeys
#[#set math.equation(numbering: n => "(4.29)")
 $ 2 "sym" #scale(x: 120%, y: 120%)[\(] \( p \)_(*) \( E mu \) #scale(x: 120%, y: 120%)[\)] =
   D_0 frac(thin upright(d) p, 2 pi) . $ <eq:angular-sum-rule>]

 On each orbit of degree $2 n_F$, the phase winds monotonically through $n_F$ complete turns. In particular
#[#set math.equation(numbering: n => "(4.30)")
 $ integral n_F thin upright(d) nu \( F \) < oo . $ <eq:angular-degree-integral>]

]
] <lem:sum-rule>

#proof[
  Since $Z_0 Omega = S^(- 1) J \( i \) Omega$, the spectral measure of the local density vector is
  #[#set math.equation(numbering: n => "(4.31)")
   $ parallel Z_0 Omega parallel^2 \( thin upright(d) f \) = \| 1 -
     f \( i \) \|^2 thin upright(d) mu \( f \) . $ <eq:angular-density-measure>]
  Set $c \( j \) = chevron.l Omega \, \[ Z_0 \, \[ E \, Z_j \] \] Omega
    chevron.r$ and take its spatial Fourier transform. By $E Omega = 0$,
    the transform is twice the symmetrized energy-weighted spectral measure of $Z_0 Omega$.
    On the other hand (4.28) and conservation of $Z_0 + Z_1$ leave only the three coefficients at separations
    $0 \, 1 \, - 1$, namely $2 D_0 \, - D_0 \, - D_0$. Their transform is $\| 1 - e^(i p) \|^2 D_0$. Thus
  $ 2 "sym" #scale(x: 120%, y: 120%)[\(] \( p \)_(*) \( E \| 1 - f \( i \) \|^2 mu \)
    #scale(x: 120%, y: 120%)[\)] = \| 1 - e^(i p) \|^2 D_0 frac(thin upright(d) p, 2 pi) . $
  Testing on compact subsets of the circle without zero permits division by the squared factor and proves (4.29).
  On a nonconstant finite-product orbit, direct differentiation gives $- thin upright(d) p \/ thin upright(d) s =
    E \( F \( e^s dot.op \) \) > 0$. The boundary phase change on the positive imaginary ray is one half of the
    full boundary change: this follows either by pairing conjugate zeros in (4.8) or by integrating (4.27) with
    its dilated argument. It is $2 pi n_F$. At each nonzero phase there are consequently $n_F$ crossings,
    counted with multiplicity, and none has zero derivative. The change of variables from $s$ to phase gives
  $ \( p \)_(*) \( E thin thin upright(d) s thin nu \) = (integral n_F thin upright(d) nu \( F \)) thin upright(d) p $
  away from zero, first with truncated orbit measures and then by monotone convergence.
    Equation (4.29) implies finiteness; in these conventions it also gives $4 pi integral n_F thin upright(d) nu =
    D_0$. The endpoints of an orbit and its finitely many zero-phase crossings have zero $thin upright(d)
    s$ measure, so no missing phase atom is involved in this computation. ◻
]

=== 4.7 The height variogram <the-height-variogram>

The measure constructed above already determines height covariances.
  The following bound will also supply the logarithmic majorants needed for nonsmooth tests and regularity.

#thm([Proposition 4.8.])[
  (Exact variogram and logarithmic growth).  #emph[After an axial symmetry,
    any nonzero lattice displacement may be written $\( k \, j \)$ with $k gt.eq 1$ and $\| j \| lt.eq k$.
    Its height variance is
#[#set math.equation(numbering: n => "(4.32)")
 $ bb(E)_c #scale(x: 120%, y: 120%)[\(] h \( k \, j \) - h \( 0 \, 0 \) #scale(x: 120%, y: 120%)[\)]^2 & =
   2 "Re" integral #scale(x: 120%, y: 120%)[\(] 1 - f \( 1 \)^k f \( plus.minus i \)^(\| j \|)
   #scale(x: 120%, y: 120%)[\)] thin upright(d) mu \( f \)\
 & = 4 kappa log k + O \( 1 \) \, $ <eq:angular-variogram>]

 where the sign of $i$ is chosen according to the vertical direction.
   The error is uniform over these displacements. In particular the variance is bounded by
   $C \( 1 + log \( 1 + \| k \| + \| j \| \) \)$.]
] <prop:variogram>

#proof[
  First consider a directed path of physical or endpoint steps, and write their spectral multipliers as $t_1 \,
    dots.h \, t_m$. Reflection changes the sign of a current.
    Equations (4.9) and (4.3) therefore express the covariance of two distinct increments, in their path order,
    as the negative real part of the integral of
  $ \( 1 - t_a \) t_(a + 1) dots.h.c t_(b - 1) \( 1 - t_b \) \, wide a < b \, $
  with the conjugate term supplying the real covariance. A single increment has variance one.
    At an endpoint this equals $2 "Re" integral \( 1 - f \( i \) \) thin upright(d) mu$,
    because $\| f \( i \) \| = 1$ and (4.31) integrates to $parallel Z_0 Omega parallel^2 = 1$.
    The same identity holds at the physical step $w = 1$: on each orbit move the ray from $i
    bb(R)_(+)$ to $bb(R)_(+)$ by Cauchy’s theorem for $\( 1 - F \( w \) \) thin upright(d) w \/ w$.
    Its small and large circular arcs vanish, since $F \( 0 \) = F \( oo \) = 1$.
    The integrated identity is justified by the bounds below.
  The elementary telescoping identity
  $ 1 - product_(a = 1)^m t_a = sum_(a = 1)^m \( 1 - t_a \) -
    sum_(a < b) \( 1 - t_a \) t_(a + 1) dots.h.c t_(b - 1) \( 1 - t_b \) $
  therefore gives the first equality of (4.32), taking $k$ horizontal and $\| j \|$ vertical steps.
    It is equally valid by truncating the orbit measure first and then passing to the absolutely convergent
    integrals below.
  Here are bounds that both justify this passage and give the asymptotic.
    On an orbit choose one zero radius as origin in logarithmic coordinates and let $cal(L)$ be the range of the
    log radii. Beyond either extreme by distance $d$, the factor formulas and the endpoint normalizations give
  #[#set math.equation(numbering: n => "(4.33)")
   $ \| 1 - F \( e^s \) \| + \| 1 - F \( plus.minus i e^s \) \| lt.eq C n_F e^(- d) \, $ <eq:angular-orbit-tail>]
  or the trivial constant bound when it is smaller. The factors on the imaginary ray have modulus one;
    those on the positive ray have modulus at most one. Hence the integrand in (4.32) is absolutely integrable on
    each orbit. Outside the zero range enlarged by $log k + log \( 1 + n_F \)$, the inequality $\| 1 -
    a^k b^(\| j \|) \| lt.eq k \| 1 - a \| + \| j \| \| 1 - b \|$, with $\| j \| lt.eq k$,
    and (4.33) give a bounded integral. The remaining extra interval lengths cost at most
    $C \( cal(L) + log \( 1 + n_F \) + 1 \)$.
  For the main interval, use any single zero. Its cone bound gives
  $ \| F \( e^s \) \|^k lt.eq exp { - c k e^(- \| s - s_0 \|) } quad upright("for ") \| s - s_0 \| lt.eq log k \, $
  where $s_0$ is its logarithmic radius (with the sign dictated by the chosen orbit coordinate).
    The integral of the right side over this interval is bounded uniformly in $k$.
    Multiplication by $F \( plus.minus i e^s \)^(\| j \|)$ does not change that bound.
    Consequently the integral of the real part of $1 - F \( e^s \)^k F \( plus.minus i e^s \)^(\| j \|)$ is
  $ 2 log k + O #scale(x: 120%, y: 120%)[\(] 1 + cal(L) + log \( 1 + n_F \) #scale(x: 120%, y: 120%)[\)] . $
  The remainder is integrable against $nu$ by (4.11), (4.30), and $kappa < oo$.
    Multiplication by the factor $2$ in the variogram proves (4.32).
    The same majorants justify the orbitwise contour move and the telescoping passage above.
    Axial symmetry, already proved for the physical law, supplies the final uniform displacement bound. ◻
]

We have thus obtained a physical representation with a finite measure $nu$ of dilation orbits,
  an as yet unevaluated constant $kappa$, and uniform low-energy current estimates.
  Section 5 determines $kappa$ for $c < 1$; for $1 lt.eq c < 2$,
  the final proof uses the conditional amplitude theorem after convergence has been proved.
  Section 6 uses the same estimates, including their higher-mode errors, to identify all limiting current correlations.

== 5 Determining the covariance below $c = 1$ <sec:normalization>

Throughout this section $0 < c < 1$, so $2 pi \/ 3 < lambda < pi$.
  Our objective is to determine the orbit mass $kappa$ defined in Section 4.
  Two different finite systems give opposite bounds. A homogeneous chain at fixed particle density gives a lower
  bound through its response to a seam twist. A dense array of real inhomogeneities gives an upper bound through
  the change of its vacuum vector under the same twist. Neither comparison uses positive association.

#thm([Proposition 5.1.])[
  (The covariance constant below one).  #emph[With the row and height conventions of Sections 2 and 4,
#[#set math.equation(numbering: n => "(5.1)")
 $ kappa = frac(1, 2 pi \( pi - lambda \)) . $ <eq:kappa-value>]

 Consequently a limiting covariance $- 2 kappa log \| x - y \|$ has squared multiplier $4 pi kappa =
   2 \/ \( pi - lambda \) = sigma \( c \)^2$ relative to (1.1).]
] <prop:normalization>

=== 5.1 Homogeneous stiffness at fixed density <homogeneous-stiffness-at-fixed-density>

For $Q < oo$, let $K_Q$ denote convolution with $K$ restricted to $\[ - Q \, Q \]$, and write

$ r_Q = \( I + K_Q \)^(- 1) s \, wide H_Q = \( I + K_Q \)^(- 1) upright(bold(1)) . $

These are the density and dressed constant of Lemma 8. Choose the homogeneous finite chain with particle number
  $n \/ L arrow.r integral_(- Q)^Q r_Q \( u \) thin thin upright(d) u$.
  The first limit in this subsection is $L arrow.r oo$ at this fixed $Q$; only afterwards does $Q arrow.r oo$.
  After both limits, the equal-time local state is the balanced plane state, by Proposition 13 and Proposition 17.
  At fixed $Q$, the filling remains strictly below one half.

Insert the auxiliary seam $e^(i t Z)$, and let $cal(H)_L \( t \)$ be the endpoint Hamiltonian before subtracting
  its ground energy. Denote its continued sector ground energy by $e_L \( t \)$,
  its unit ground vector at zero twist by $Omega_L$, and

$ E_(upright("exc") \, L) = cal(H)_L \( 0 \) - e_L \( 0 \) $

on that magnetization sector. The untwisted sector minimum is simple.
  All inverse-energy expressions below are restricted to $Omega_L^perp$ in that sector.

At the swap endpoint, the auxiliary spin is carried from site to site. The seam therefore twists the closing link.
  Conjugating by site rotations whose angles increase in increments $t \/
  L$ distributes this twist over all links, since each link conserves the sum of its two spins.
  Let $b_j$ and $d_j$ be respectively the first and second derivatives of the local link under the single-link
  twist, with a common choice of orientation. Put $cal(J)_L = sum_j b_j$ and $D_(0 \, L) = L^(- 1) sum_j d_j$.
  Ordinary second-order perturbation theory then gives

#[#set math.equation(numbering: n => "(5.2)")
 $ L e''_L \( 0 \) = chevron.l D_(0 \, L) chevron.r - 2 /
   L ∥E_(upright("exc") \, L)^(- 1 \/ 2) \( I - \| Omega_L chevron.r chevron.l Omega_L \| \) cal(J)_L Omega_L∥^2 .
   $ <eq:kohn>]

This boundary-twist curvature identity has a standard spin-chain formulation in Shastry and
  Sutherland #cite(label("ShastrySutherland1990")) pp. 243–244, who trace the method to Kohn.
  Indeed, after distributing the seam, $cal(H)'_L \( 0 \) = L^(- 1) cal(J)_L$ and $cal(H)''_L \( 0 \) =
  L^(- 2) sum_j d_j$. The sign chosen for $t$ has no effect on (5.2).
  For either orientation, the second link derivative is $d_j = - \[ Z_j \, \[ Z_j \, h_(j \, j + 1) \] \]$.
  Thus the completed local-state limit of $chevron.l D_(0 \, L) chevron.r$ is precisely the constant $D_0$ in Lemma 21.

#thm([Lemma 5.2.])[
  (Homogeneous stiffness).  #emph[The iterated homogeneous stiffness satisfies
#[#set math.equation(numbering: n => "(5.3)")
 $ lim_(Q arrow.r oo) lim_(L arrow.r oo) L e''_L \( 0 \) = frac(2, pi - lambda) . $ <eq:stiffness-value>]

]
] <lem:stiffness>

#proof[
  The root-dependent part of the endpoint energy is $sum_j e \( y_j \)$, where
  $ e \( u \) = - 2 pi eta s \( u \) . $
  Differentiating the counting equations at zero twist gives
  $ G y' = upright(bold(1)) / pi \, wide \( G y'' \)_j = - L s' \( y_j \) \( y'_j \)^2 +
    sum_k K' \( y_j - y_k \) \( y'_j - y'_k \)^2 . $
  All derivatives here are taken on the regular real-root branch at fixed finite $L$.
    Lemma 9 and the fixed-$Q$ quadratures imply, at the nodes,
  $ L y'_j arrow.r W \( y_j \) \, wide W = frac(H_Q, pi r_Q) . $
  Set $epsilon_Q = \( I + K_Q \)^(- 1) e'$. The symmetry of $G$ gives $L G^(- 1) e' arrow.r epsilon_Q \/ r_Q$.
    Substituting the equation for $y''$ into the second energy derivative and expanding its square therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ lim_(L arrow.r oo) L e''_L \( 0 \) & = integral_(- Q)^Q {\( r_Q epsilon'_Q - epsilon_Q r'_Q \) W^2 +
     2 epsilon_Q W \( r_Q W \)'} thin thin upright(d) u\
 & = 2 #scale(x: 120%, y: 120%)[\(] epsilon_Q r_Q W^2 #scale(x: 120%, y: 120%)[\)] \( Q \) . $ <eq:stiffness-boundary>]
  Here is the cancellation in the first equality. The direct squared displacement term is $integral r_Q e'' W^2$.
    The term $- s' + K'_Q r_Q$ in the implicit derivative is $- r'_Q$, so it contributes $-
    integral epsilon_Q r'_Q W^2$. Transposing the other $K'_Q$ term replaces $e''$ by $epsilon'_Q$.
    The remaining cross term uses $\( I + K_Q \) \( r_Q W \) = 1 \/ pi$.
    The integrand is now the derivative of $epsilon_Q r_Q W^2$.
    The density and $W$ are even and $epsilon_Q$ is odd, proving the boundary expression.
  We next evaluate its boundary factors, rather than differentiating a bulk asymptotic. Write
  $ r \( u \) = frac(1, 2 lambda cosh \( u \/ eta \)) . $
  If $g$ solves the full-line equation with the relevant source,
    its restriction is corrected to the interval solution by
  $ g med mapsto med g + \( I + K_Q \)^(- 1) K_(upright("out")) g \, $
  where $K_(upright("out")) g$ integrates over $bb(R) \\ \[ - Q \, Q \]$.
    Apply this map to $r$ and to $- 2 pi eta r'$. On the outer tail near $Q$ their ratio tends uniformly to $2
    pi$. The contribution of the opposite tail is negligible relative to $r \( Q \)$:
    insert a sufficiently small exponential weight in the convergent Neumann series for $K_Q$,
    and use the separation of the two ends. The same comparison gives $r_Q \( Q \) asymp r \( Q \)$, hence
  $ frac(epsilon_Q \( Q \), r_Q \( Q \)) arrow.r 2 pi . $
  After translating the endpoint $Q$ to zero, the Neumann series for $H_Q$ converges term by term to its half-line
    series and is dominated by the geometric series with ratio $parallel K parallel_1 < 1$.
    Thus $H_Q \( Q \)$ has a limit. Symmetry of the resolvent, or differentiation of its series,
    gives the exact identity
  #[#set math.equation(numbering: n => "(5.5)")
   $ frac(thin upright(d), thin upright(d) Q) integral_(- Q)^Q H_Q \( u \) thin thin upright(d) u =
     2 H_Q \( Q \)^2 . $ <eq:dressed-constant-boundary>]
  The bulk series also gives
  $ frac(1, 2 Q) integral_(- Q)^Q H_Q \( u \) thin thin upright(d) u arrow.r frac(1, 1 + hat(K) \( 0 \)) . $
  Since the right side of (5.5) has a limit, averaging that identity identifies
  $ H_Q \( Q \)^2 arrow.r frac(1, 1 + hat(K) \( 0 \)) = frac(pi, 2 \( pi - lambda \)) . $
  Finally (5.4) equals $2 epsilon_Q \( Q \) H_Q \( Q \)^2 \/ \[ pi^2 r_Q \( Q \) \]$.
    The two boundary limits yield (5.3). ◻
]

=== 5.2 An infrared comparison with the plane <an-infrared-comparison-with-the-plane>

The inverse in (5.2) is not a local observable. We therefore regularize it before passing to the plane. For $u > 0$ put

$ g_u \( E \) = frac(1 - e^(- u E^2), E) \, wide g_u \( 0 \) = 0 . $

On nonnegative energies $0 lt.eq g_u \( E \) lt.eq E^(- 1)$.
  Extend $g_u$ as an odd function to the real line when using its Fourier representation.

#thm([Lemma 5.3.])[
  (Infrared comparison).  #emph[With $kappa$ as in Section 4,
#[#set math.equation(numbering: n => "(5.6)")
 $ kappa gt.eq frac(1, 2 pi \( pi - lambda \)) . $ <eq:kappa-lower>]

]
] <lem:infrared>

#proof[
  Replace the inverse-energy quadratic form in (5.2) by the smaller form with $g_u \( E_(upright("exc") \, L) \)$,
    keeping $u$ fixed. Translation invariance rewrites its factor $2 \/
    L$ as the sum over link separations of twice a symmetrized single-source pairing.
  An explicit real-time representation is
  $ g_u \( E \) = integral_0^oo "erfc" #h(-0.16667em) (frac(t, 2 sqrt(u))) sin \( t E \) thin thin upright(d) t \,
    wide "erfc" \( x \) = 2 / sqrt(pi) integral_x^oo e^(- s^2) thin thin upright(d) s . $
  Integration by parts gives this identity. Its sine kernel is bounded at zero, integrable,
    and has a Gaussian tail at large real times. Oddness expresses the symmetrized pairing through expectations of
    real-time commutators of the local currents. The endpoint-Hamiltonian identification in Lemma 20 makes this
    the same real-time evolution as that generated by the finite-range link Hamiltonian.
    For link separation $r$, split the time integral at a fixed small multiple of $r$.
    In the shorter-time part the finite-range Lieb–Robinson estimate gives exponential decay in $r$;
    in the longer-time part the filter tail is summable without using locality #cite(label("LiebRobinson1972")).
    The estimates are uniform in the circle distance. For bounded times the local evolutions are norm approximated
    on a bounded neighborhood, so local convergence of the ground states gives convergence of each such commutator.
  Let $beta_b$ be the spectral measure of the plane vector $b_0 Omega$ for the commuting angular rows;
    the endpoint energy $E$ and shift phase $p$ are functions on this spectrum. The preceding summability shows that
  $ 2 "sym" #scale(x: 120%, y: 120%)[\(] \( p \)_(*) \( g_u \( E \) beta_b \) #scale(x: 120%, y: 120%)[\)] =
    cal(S)_u \( p \) thin frac(thin upright(d) p, 2 pi) $
  has a continuous density. The finite regularized term converges to $cal(S)_u \( 0 \)$, first as $L arrow.r
    oo$ and then as $Q arrow.r oo$. Throughout this passage $u$ is fixed. Consequently (5.2) and Lemma 24 imply
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(2, pi - lambda) lt.eq D_0 - cal(S)_u \( 0 \) . $ <eq:regularized-stiffness>]
  The current and local spin preserve the magnetization sector,
    so the nonnegativity used in this comparison is sector nonnegativity.
    The real-time commutator estimate itself needs no ground-state hypothesis.
  At nonzero momentum, the continuity equation
  $ i \[ E \, Z_j \] = b_j - b_(j - 1) $
  identifies the current spectral density. On the vacuum, $parallel Z_0 Omega
    parallel^2 \( thin upright(d) f \) = \| 1 - f \( i \) \|^2 mu \( thin upright(d) f \)$.
    The continuity equation implies, away from $p = 0$, that the energy-weighted current measure satisfies
    $g_u \( E \) beta_b = E \( 1 - e^(- u E^2) \) mu$. Indeed the spin measure carries $\| 1 - f \( i \) \|^2$,
    which cancels the squared shift difference in the continuity equation.
    Subtract this identity from the sum rule in Lemma 21. On the punctured phase circle this gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ #scale(x: 120%, y: 120%)[\(] D_0 - cal(S)_u \( p \) #scale(x: 120%, y: 120%)[\)]
     frac(thin upright(d) p, 2 pi) = 2 "sym" #scale(x: 120%, y: 120%)[\(] \( p \)_(*) \( E e^(- u E^2) mu \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:filtered-density>]
  The equality extends to the limit $p arrow.r 0$ because the left side is continuous.
    Indeed, the summable commutator bounds show that the fixed-$u$ susceptibility measure has an absolutely
    convergent spatial Fourier series, hence no atom at phase zero.
    The regulator annihilates zero energy, and the $f = 1$ current component was removed in the construction of
    $mu$. Thus the off-zero division has omitted no additional contribution to this continuous density.
  On a dilation orbit write $p \( s \) = arg f \( i e^s \)$.
    Its absolute derivative is $E$, and its winding number is $n_f$ when the Blaschke degree is $2 n_f$.
    For small nonzero $p$ of either sign, changing variables from $s$ to $p$ in (5.8) leaves $n_f$ crossings,
    weighted by $e^(- u E^2)$, and the density convention contributes $4 pi$.
    As $p arrow.r 0$, precisely one crossing escapes to the corresponding orbit end, where $E arrow.r 0$;
    the other crossings have positive limiting energy. The sum is bounded by $n_f$,
    and $integral n_f thin thin upright(d) nu < oo$ by the sum rule.
    Dominated convergence, first at $p arrow.r 0$ and then at $u arrow.r oo$, therefore gives
  $ lim_(u arrow.r oo) #scale(x: 120%, y: 120%)[\(] D_0 - cal(S)_u \( 0 \) #scale(x: 120%, y: 120%)[\)] = 4 pi kappa . $
  Combining this with (5.7) proves (5.6). ◻
]

=== 5.3 The exact overlap to be estimated <the-exact-overlap-to-be-estimated>

We now use the other finite system: real site parameters on an array of spacing $d \/ 2$, of length $B =
  L d \/ 2$, at half filling. Let $Omega_(L \, t)$ be the unit real-root vector with seam twist $e^(i t Z)$,
  continued near zero, and put

#[#set math.equation(numbering: n => "(5.9)")
 $ I_L = ∥\( I - \| Omega_L chevron.r chevron.l Omega_L \| \) partial_t Omega_(L \, t) \|_(t = 0)∥^2 .
   $ <eq:fidelity-cost>]

These staggered vectors need no Perron interpretation.

Let $A$ and $C$ be the root lists at zero and at $t$. Use $\[ x \] = sinh x$,
  and let $M_(A C)$ be the reduced scalar-product matrix of Section 2,
  with on-shell roots $A$ and column arguments $C$. In $M_(C A)$,
  use the twisted on-shell roots $C$ and their twisted Bethe ratio $e^(- 2 i t) q_C$.
  At $t = 0$ both coincident matrices are the appropriate Gaudin matrices.
  Lemmas 5 and 6, followed by the hyperbolic Cauchy identity, give

#[#set math.equation(numbering: n => "(5.10)")
 $ \| chevron.l Omega_(L \, 0) \, Omega_(L \, t) chevron.r \|^2 =
   product_(j \, k)
   frac(\[ A_j - C_k + i lambda \] \[ C_j - A_k + i lambda \], \[ A_j - A_k + i lambda \] \[ C_j - C_k + i
   lambda \]) frac(det M_(A C) det M_(C A), det G_A det G_C) . $ <eq:exact-overlap>]

This is the identity (2.37): its one-set factors cancel, including those converting the algebraic duals into
  Hilbert duals. It therefore measures the overlap of unit vectors.

For each finite chain, the analytic implicit-function theorem applies to the counting equations because $G$ is
  nonsingular. The roots remain distinct, the vector remains nonzero and its squared normalized overlap is nonzero
  on a sufficiently small neighborhood of zero. The local logarithm with value zero at $t =
  0$ is therefore defined. Differentiating a unit vector shows

#[#set math.equation(numbering: n => "(5.11)")
 $ log \| chevron.l Omega_(L \, 0) \, Omega_(L \, t) chevron.r \|^2 = - I_L t^2 +
   O_L \( t^3 \) . $ <eq:overlap-quadratic>]

Only its quadratic coefficient is used. There is no need for a complex neighborhood whose radius is uniform in $L$.

#thm([Lemma 5.4.])[
  (Staggered overlap asymptotic).  #emph[In the order $B arrow.r oo$, then $d arrow.b 0$,
#[#set math.equation(numbering: n => "(5.12)")
 $ I_L / B arrow.r frac(1, 2 lambda \( pi - lambda \)) . $ <eq:overlap-density>]

 The limit is understood in the double-limit convention (3.1).]
] <lem:overlap-asymptotic>

We first use this asymptotic to bound $kappa$. Its proof occupies Sections 5.5–5.6 below.

=== 5.4 Packing angular windows <packing-angular-windows>

We connect the staggered susceptibility to the plane by detecting separated angular ranges in the spectrum of its
  derivative vector. Let $zeta_L$ be the spectral measure of the orthogonal derivative vector in (5.9),
  for the simultaneous self-adjoint rows $P_L \( e^s \)$, divided by their designated untwisted vacuum
  eigenvalues. Its total mass is $I_L$. Denote its spectral coordinates by $f_s$.
  The differentiated eigen-equation expresses multiplication of that vector by $1 - f_s$ as the marked row vector,
  with its vacuum component removed. Consequently convergence of all finite Gram words gives

#[#set math.equation(numbering: n => "(5.13)")
 $ \( 1 - f_s \)^2 thin zeta_L arrow.r \( 1 - f \( e^s \) \)^2 thin mu $ <eq:weighted-measure-convergence>]

against bounded continuous functions of finitely many coordinates in a fixed window.
  The convergence is uniform when the window center stays in a fixed-fraction array interior.

We need a finite-array bound for two dips before summing over windows.
  Write $psi_L$ for the orthogonal derivative vector and $P_s = P_L \( e^s \)$, $J_s = J_L \( e^s \)$.
  The differentiated eigen-equation is

$ \( 1 - P_(s') \) psi_L = i J_(s') Omega_L - a_(s') Omega_L $

for a scalar $a_(s')$. Since $P_s Omega_L = Omega_L$,

$ \( 1 - P_s \) \( 1 - P_(s') \) psi_L = - i \[ P_s \, J_(s') \] Omega_L . $

The spectral theorem therefore gives the exact identity

$ integral \( 1 - f_s \)^2 \( 1 - f_(s') \)^2 thin thin upright(d) zeta_L =
  parallel \[ P_s \, J_(s') \] Omega_L parallel^2 . $

Lemma 10 bounds every singly marked row, uniformly at all centers in a fixed-fraction array interior,
  once the array is sufficiently long and its spacing sufficiently small.
  In finite RTT the normalized intertwiner at separation $s -
  s'$ is an invertible diagonal matrix plus $O \( e^(- eta \| s - s' \|) \)$;
  the diagonal matrix commutes with the mark $I ⊗ Z$. Expanding the conjugation error in auxiliary matrix units
  expresses the commutator as a fixed finite sum of two-row products. The single-row bounds consequently imply

#[#set math.equation(numbering: n => "(5.14)")
 $ integral \( 1 - f_s \)^2 \( 1 - f_(s') \)^2 thin thin upright(d) zeta_L lt.eq
   C e^(- 2 eta \| s - s' \|) . $ <eq:finite-two-dip>]

The constant is independent of the array length, small spacing and both bulk centers.
  In particular there is no additive convergence error whose sum over a growing number of pairs could accumulate.

#thm([Lemma 5.5.])[
  (Packing angular windows).  #emph[The plane orbit mass satisfies
#[#set math.equation(numbering: n => "(5.15)")
 $ kappa lt.eq frac(eta, 2 lambda \( pi - lambda \)) . $ <eq:kappa-upper>]

]
] <lem:detector-packing>

#proof[
  Choose finitely many real samples in a window, and let $Q \( f \) = sum_j \( 1 - f_(s_j) \)^2$.
    Any bounded continuous detector $F$ supported away from the all-ones point can be written
  $ F = sum_j F / Q \( 1 - f_(s_j) \)^2 \, $
  with each quotient extended continuously by zero near that point.
    Thus (5.13) gives convergence for such detectors without assuming convergence of the full unweighted mass.
    Similarly, products of two detectors are bounded by finite sums of two-dip factors.
    The constants depend on the fixed window and mesh of samples, not on the array center in the permitted bulk.
  The cone condition and the dip estimate for inner functions provide a fixed dip width and depth around each zero
    scale, independent of the degree. Choose a fixed fine sampling mesh and a continuous detector $0 lt.eq
    F_T lt.eq 1$ in a window of length $T$, equal to one when a prescribed interior dip is detected and zero near
    all ones. Each dilation orbit contributes an interval of centers of length at least $T - C$. Hence
  $ integral F_T thin thin upright(d) mu gt.eq \( T - C \) kappa . $
  Take the detector to be a continuous cutoff of $max_j \| 1 - f_(s_j) \|$ at a fixed positive dip threshold $a$.
    Then $F_T lt.eq C_a sum_j \( 1 - f_(s_j) \)^2$, with $C_a$ independent of $T$.
    Equation (5.14) bounds the product for two windows separated by a gap $g$ by $C T^2 e^(- 2 eta g)$.
    For $N$ regularly spaced windows, their pair integrals sum to at most
  $ frac(C N T^2 e^(- 2 eta g), 1 - e^(- 2 eta \( T + g \))) . $
  Pack windows of length $T$ and gaps $g$ into a bulk interval of logarithmic length $\( 1 - gamma \) B \/ eta$.
    Their number $N_B$ satisfies
  $ N_B / B arrow.r frac(1 - gamma, eta \( T + g \)) . $
  For numbers $a_j in \[ 0 \, 1 \]$, $sum_j a_j lt.eq 1 + sum_(j < k) a_j a_k$.
    Integrating this inequality against $zeta_L$, using bulk-uniform detector convergence and the finite two-dip
    estimate, gives
  $ frac(1 - gamma, eta \( T + g \)) \( T - C \) kappa lt.eq lim_(d arrow.b 0) limsup_(B arrow.r oo) I_L / B +
    frac(C T^2 e^(- 2 eta g), T + g) . $
  For fixed $T \, g \, gamma$, all detectors use only a fixed finite number of samples,
    so this application does not ask for convergence of a growing word.
    The uniform estimates allow the inequalities to be summed over their translated windows.
    The single-window convergence error, after division by $B$, is $\( N_B \/ B \) epsilon_(d \, B \, T)$,
    where $lim_(d arrow.b 0) limsup_(B arrow.r oo) epsilon_(d \, B \, T) = 0$.
    Shortening the bulk interval at its ends by $O \( T + g \)$ keeps every sample in the permitted interior and
    does not change the limiting count.
  Use Lemma 26, choose $g = A log T$ with $A$ sufficiently large, let $T arrow.r oo$,
    and then let $gamma arrow.b 0$. This proves (5.15). ◻
]

#proof[
  Since $eta = lambda \/ pi$, the upper bound (5.15) equals the lower bound (5.6). Thus (5.1) holds.
    The covariance conversion follows directly from (1.1). ◻
]

=== 5.5 Counting-coordinate accuracy and the finite trace limit <sec:finite-trace>

It remains to prove the overlap asymptotic used above. This subsection and Section 5.6 together prove Lemma 26.
  We first compare the finite quadratic logarithmic traces, divided by the physical length $B$,
  with their bulk convolution traces; the next subsection evaluates the resulting symbols.
  All Taylor coefficients are taken at finite $L$ before $B arrow.r oo$ at fixed $d$, and then $d arrow.b 0$,
  with $B = L d \/ 2$.

We first justify the precision needed to differentiate (5.10). The leading root density alone would not suffice.
  In a dense interior interval, Lemmas 8 and 9 give

$ xi' \( u \) = d^(- 1) + O \( 1 \) \, wide \| xi^(\( m \)) \( u \) \| lt.eq C_m d^(- 1) quad \( m gt.eq 1 \) \, $

with fixed derivative order. In the coordinate $z = xi \( u \)$,
  roots have unit midpoint spacing and derivatives of the inverse coordinate satisfy

$ lr(|frac(thin upright(d)^m u, thin upright(d) z^m)|) lt.eq C_m d^m . $

For a smooth exponentially localized test $F$, localized away from the ends, this gives

#[#set math.equation(numbering: n => "(5.16)")
 $ integral lr(|frac(thin upright(d)^m, thin upright(d) z^m) F \( u \( z \) \)|) thin thin upright(d) z lt.eq
   C_m d^(m - 1) . $ <eq:counting-derivative>]

Cutoffs can be put arbitrarily many decay lengths from the test center; their errors tend to zero as $B arrow.r
  oo$ at fixed $d$.

Midpoint summation minus integration can be integrated by parts against bounded periodic primitives of the
  unit-spaced counting discrepancy. Using (5.16) to arbitrarily high fixed order gives an error $O_N \( d^N \)$
  for every fixed $N$, besides the vanishing end errors. Apply this to the dressed density equation and all its
  fixed derivatives. The uniform site array has the same quadrature accuracy,
  so convolution inversion improves the density estimate to

#[#set math.equation(numbering: n => "(5.17)")
 $ xi' \( u \) = d^(- 1) + O_N \( d^N \) $ <eq:all-order-density>]

with the same accuracy for its fixed derivatives in the interior.

Differentiating the Gaudin equation for the twist gives the constant interior displacement

$ y_j \( t \) - y_j \( 0 \) = d z_(*) + O_N \( d^N \) \, wide z_(*) = frac(t, 2 \( pi - lambda \)) \, $

to each fixed Taylor order at zero. For the first derivative this is

$ frac(d, pi \( 1 + hat(K) \( 0 \) \)) = frac(d, 2 \( pi - lambda \)) . $

For higher derivatives, the differentiated site-array source is arbitrarily small by midpoint quadrature,
  and difference terms vanish on a constant displacement. Induction with the Gaudin inverse proves the assertion.
  The statement concerns spacings and root differences, not an arbitrarily chosen absolute mesh origin.
  Errors over several spacings can grow polynomially with index separation;
  the kernels against which they are summed decrease exponentially.

We next establish the finite matrix estimates needed for the trace comparison, including the sparse ends. Write

$ x_j = y_j \( 0 \) \, quad rho \( u \) = xi'_0 \( u \) \, quad rho_j = rho \( x_j \) \, quad ell_j =
  rho_j^(- 1) \, quad sans(D)_0 = "diag" \( ell_j \) \, quad cal(A) = G_0 sans(D)_0 = I + K ell . $

For each matrix $M \( t \)$ among $M_(A C) \( t \) \, M_(C A) \( t \) \, G_C \( t \) \, G_A$, use $N \( t \) =
  M \( t \) sans(D)_0$, keeping $sans(D)_0$ fixed at zero twist.
  Then $N \( 0 \) = cal(A)$, and $log det N - log det M$ is constant.
  Equivalently, $N \( 0 \)^(- 1) N^(\( r \)) \( 0 \) = sans(D)_0^(- 1) G_0^(- 1) M^(\( r \)) \( 0 \) sans(D)_0$,
  so the finite trace identity is

#[#set math.equation(numbering: n => "(5.18)")
 $ frac(thin upright(d)^2, thin upright(d) t^2) log det M \( t \)\|_(t = 0) =
   "Tr" #scale(x: 120%, y: 120%)[\(] cal(A)^(- 1) N'' \( 0 \) -
   cal(A)^(- 1) N' \( 0 \) cal(A)^(- 1) N' \( 0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:second-log-trace>]

In particular, no derivative of $ell_j$ occurs, and an edge weight has not been replaced by $d$.

Here and below constants are uniform for sufficiently small $d$ and $B gt.eq B_0 \( d \)$, as in Section 3.
  Let $p \( u \) = sum_alpha r \( u - b_alpha \)$. The sawtooth estimate (3.5) gives $rho = p + O \( 1 \)$,
  with bounded integrated error. The $d \/ 2$-spaced array and exponential decay of $r$ give $p \( u \) lt.eq
  C \/ d$ on the line. Between the outer bare sites, at least $c \/ d$ sites lie within distance one of $u$,
  once $B gt.eq 2$; hence $rho \( u \) gt.eq c \/ d$ there for small $d$.
  At an exterior root, (3.7) instead gives $rho_j gt.eq c$. Consecutive counting levels differ by one, so

#[#set math.equation(numbering: n => "(5.19)")
 $ 0 < rho \( u \) lt.eq C \/ d \, wide c d lt.eq ell_j lt.eq C \, wide x_(j + 1) - x_j gt.eq c d \,\
sup_u sum_j ell_j e^(- gamma \| u - x_j \|) lt.eq C_gamma quad \( gamma > 0 \) . $ <eq:overlap-finite-array-bounds>]

The last estimate is the local quadrature-mass bound of Lemma 8, summed over unit intervals.
  Since $K < 0$, $rho$ is a sum of positive kernels $s$ and $k = - K$;
  their fixed derivatives are bounded by constant multiples of themselves.
  Thus $\| rho^(\( m \)) \( u \) \| lt.eq C_m rho \( u \)$.

Put $v_j = y'_j \( 0 \)$, $w_j = y''_j \( 0 \)$ on the twisted branch, and $sigma \( u \) =
  sum_alpha s \( u - b_alpha \)$. Twice differentiating the finite counting equations gives

$ G_0 v = pi^(- 1) upright(bold(1)) \, wide G_0 w = - H \, wide H_i = sigma' \( x_i \) v_i^2 -
  sum_j K' \( x_i - x_j \) \( v_i - v_j \)^2 . $

Since $G_0^(- 1) = sans(D)_0 cal(A)^(- 1)$, Lemma 9 first gives $\| v_j \| lt.eq C ell_j$.
  Using $sigma \( x_i \) + sum_j k \( x_i - x_j \) = rho_i$, we then obtain

$ \| H_i \| lt.eq C (ell_i^2 rho_i + sum_j k \( x_i - x_j \) ell_j^2) lt.eq C . $

Here $rho_i ell_i = 1$, $ell_i lt.eq C$, and the last bound in (5.19) were used. Consequently

#[#set math.equation(numbering: n => "(5.20)")
 $ \| v_j \| + \| w_j \| lt.eq C ell_j . $ <eq:overlap-root-jets>]

For the moving counting density $rho_t = xi'_(C \( t \))$, derivatives at fixed $u$ are

$ dot(rho) \( u \) = sum_j K' \( u - x_j \) v_j \, wide dot.double(rho) \( u \) = sum_j { K' \( u - x_j \) w_j -
  K'' \( u - x_j \) v_j^2 } . $

These functions and their required fixed spatial derivatives are $O \( 1 \)$, by (5.19) and (5.20).
  This includes all terminal indices.

We remove the coincident-column singularity before differentiation.
  For either overlap orientation, let $Y \( t \)$ be its on-shell list, $U \( t \)$ its column list,
  and $Q \( t \, u \) = e^(- 2 i t_Y) q_(Y \( t \)) \( u \)$, where $t_Y = 0$ for $M_(A C)$ and $t_Y =
  t$ for $M_(C A)$. Thus $Q \( t \, Y_j \( t \) \) = - 1$. Set

$ h_j = U_j - Y_j \, wide L_j \( t \) = integral_0^1 rho_(Y \( t \)) \( Y_j + theta h_j \) thin upright(d)
  theta \, wide cal(E) \( z \) = frac(e^z - 1, z) \, quad cal(E) \( 0 \) = 1 . $

The identity $q' \/ q = 2 pi i rho_Y$ gives $Q \( t \, U_j \) = - e^(2 pi i h_j L_j)$. With

$ H_lambda \( u \) = frac(coth u - coth \( u + i lambda \), - 2 pi i) \, wide beta_j \( t \) = 1 -
  e^(2 pi i h_j L_j) \, $

the finite scalar-product matrix is exactly $M_(i j) = K \( u_(i j) \) + beta_j H_lambda \( u_(i j) \)$,
  where $u_(i j) = U_j - Y_i$. Its constant coth tails have canceled. On the diagonal this becomes the analytic identity

#[#set math.equation(numbering: n => "(5.21)")
 $ M_(j j) = K \( h_j \) + L_j cal(E) \( 2 pi i h_j L_j \) \[ h_j coth h_j - h_j coth \( h_j + i lambda \) \] .
   $ <eq:overlap-coalescent-column>]

At zero twist, $h_j = 0$, $L_j = rho_j$, and $\| h'_j \| + \| h''_j \| lt.eq C ell_j$.
  Differentiating the integral defining $L_j$, using the preceding density bounds,
  gives $\| L'_j \| + \| L''_j \| lt.eq C$: every spatial density derivative is multiplied by a velocity or
  acceleration $O \( ell_j \)$, and the fixed-position time derivatives are $O \( 1 \)$.
  For $z_j = 2 pi i h_j L_j$, this implies

$ z'_j \( 0 \) = 2 pi i rho_j h'_j \( 0 \) = O \( 1 \) \, wide z''_j \( 0 \) =
  2 pi i \( rho_j h''_j + 2 h'_j L'_j \) \|_(t = 0) = O \( 1 \) . $

The bracket in (5.21) is analytic with value one at zero;
  it and $cal(E) \( z_j \)$ have bounded first two Taylor derivatives.
  The product rule and $ell_j rho_j =
  1$ therefore give $ell_j \( \| M'_(j j) \( 0 \) \| + \| M''_(j j) \( 0 \) \| \) lt.eq C$.
  No reciprocal displacement or reciprocal root velocity is introduced.

For $i eq.not j$, ordinary differentiation at $u = x_j - x_i$ gives

$ M'_(i j) & = K' \( u \) u'_(i j) + beta'_j H_lambda \( u \) \,\
M''_(i j) & = K'' \( u \) \( u'_(i j) \)^2 + K' \( u \) u''_(i j) + beta''_j H_lambda \( u \) +
  2 beta'_j H'_lambda \( u \) u'_(i j) . $

Here $beta_j \( 0 \) = 0$, $\| beta'_j \( 0 \) \| + \| beta''_j \( 0 \) \| lt.eq C$, and $u'_(i j) \,
  u''_(i j)$ are bounded by (5.20). For some fixed $gamma > 0$,

$ \| K^(\( r \)) \( u \) \| lt.eq C_r e^(- gamma \| u \|) \, quad \| H_lambda \( u \) \| lt.eq
  C \( 1 + \| u \|^(- 1) \) e^(- gamma \| u \|) \, quad \| H'_lambda \( u \) \| lt.eq
  C \( 1 + \| u \|^(- 2) \) e^(- gamma \| u \|) . $

Choose small $alpha > 0$ and write $parallel T parallel_(alpha \, x) =
  sup_i sum_j e^(alpha \| x_i - x_j \|) \| T_(i j) \|$. The minimum gap bounds the two pole factors by $C \/
  d$ and $C \/ d^2$. Multiplication by the column weight $ell_j$, local quadrature mass, and the diagonal estimate prove

#[#set math.equation(numbering: n => "(5.22)")
 $ parallel M' \( 0 \) sans(D)_0 parallel_(alpha \, x) lt.eq C \/ d \, wide
   parallel M'' \( 0 \) sans(D)_0 parallel_(alpha \, x) lt.eq
   C \/ d^2 quad \( M = M_(A C) \, M_(C A) \) . $ <eq:overlap-taylor-row-bounds>]

For the Gaudin denominator, put $r_i \( t \) = rho_t \( y_i \( t \) \)$. The formulas

$ r'_i = dot(rho)_i + rho'_i v_i \, wide r''_i = dot.double(rho)_i + 2 dot(rho)'_i v_i + rho''_i v_i^2 + rho'_i w_i $

give bounded first two derivatives. Differentiating $G_(i j) \( t \) = r_i \( t \) delta_(i j) +
  K \( y_i \( t \) - y_j \( t \) \)$ and summing with the same column weights thus gives $parallel G'_C \( 0 \)
  sans(D)_0 parallel_(alpha \, x) + parallel G''_C \( 0 \) sans(D)_0 parallel_(alpha \, x) lt.eq C$.
  Lemma 9, with both signs of its exponential weight, gives $parallel cal(A)^(- 1) parallel_(alpha \, x) lt.eq C$.
  Weighted absolute row norms are submultiplicative by the triangle inequality.
  Hence the matrix inside the trace in (5.18), and each of its diagonal entries, are bounded by $C \/ d^2$,
  uniformly in $B$.

The discarded count includes all exterior roots. Indeed, with $T \( u \) =
  integral_u^oo rho \( v \) thin upright(d) v$, the half-integer tail levels and integrated sawtooth estimate give

$ \# { j : x_j gt.eq x } lt.eq T \( x \) + 1 lt.eq sum_alpha macron(r) \( x - b_alpha \) + C \, wide
  macron(r) \( v \) = integral_v^oo r \( u \) thin upright(d) u . $

For $x = B \/ 2 - R$, at most $C \( R \/ d + 1 \)$ bare sites lie to its right,
  each contributing at most $1 \/ 2$. The other sites contribute at most $C sum_(m gt.eq 0)
  e^(- m d \/ \( 2 eta \)) lt.eq C \/ d$. Reflection therefore proves

#[#set math.equation(numbering: n => "(5.23)")
 $ \# { j : \| x_j \| gt.eq B \/ 2 - R } lt.eq C \( R + 1 \) \/ d . $ <eq:overlap-end-count>]

Deleting these diagonal entries costs at most $C \( R + 1 \) \/ \( d^3 B \)$ after division by $B$.
  This tends to zero at fixed $d$ if $R = R \( B \) arrow.r oo$ and $R \( B \) \/ B arrow.r 0$;
  a fixed number of nested strips has the same property.

For the inverse comparison we use one common weighted row algebra, including at the sparse ends:

#[#set math.equation(numbering: n => "(5.24)")
 $ parallel T parallel_(a \, d) = sup_i sum_j e^(a d \| i - j \|) \| T_(i j) \| \, wide T_n =
   I + \( d K \( d \( i - j \) \) \)_(1 lt.eq i \, j lt.eq n) . $ <eq:overlap-common-row-norm>]

Since $\| x_i - x_j \| gt.eq c d \| i - j \|$, the actual-matrix bounds above hold in this norm for sufficiently
  small fixed $a > 0$. Choose $a$ also so that $integral e^(a \| u \|) \| K \( u \) \| thin upright(d) u < 1$.
  For small $d$, $parallel T_n - I parallel_(a \, d) lt.eq q < 1$;
  the finite Neumann series gives $parallel T_n^(- 1) parallel_(a \, d) lt.eq \( 1 - q \)^(- 1)$,
  uniformly in $n$. Thus the exact identity

$ cal(A)^(- 1) - T_n^(- 1) = cal(A)^(- 1) \( T_n - cal(A) \) T_n^(- 1) $

holds in the same weighted algebra for both inverses. Two nested physical cutoffs separated by $R$ inside the bare
  array have at least $c R \/ d - O \( 1 \)$ intervening root indices, since $rho gt.eq c \/ d$ there.
  Any index path from a retained inner diagonal to the outer strip therefore gains a factor $C e^(- c' R)$.

In the interior, (5.17) and the twist-jet estimates give $ell_j = d +
  O_N \( d^N \)$ and arbitrarily accurate comparisons of root differences with $d \( j - i \)$.
  Apply these to the normalized Taylor matrices, using (5.21) on the diagonal.
  Fixed derivatives at distinct-root poles cost only powers of $1 \/ d$;
  polynomial growth with index separation is absorbed by exponential decay.
  Choosing a higher initial accuracy order therefore makes the interior row errors of the Taylor matrices and of
  $cal(A) - T_n$ $O_N \( d^N \)$ for every fixed $N$, besides errors vanishing at fixed $d$ as the strips recede.
  Their global row bounds have only polynomial costs in $1 \/ d$.
  The inverse identity and telescoping the fixed products in (5.18), with nested strips,
  give a retained diagonal error at most

$ P \( d^(- 1) \) #scale(x: 120%, y: 120%)[\[] O_N \( d^N \) + o_(B arrow.r oo \, d) \( 1 \) +
  C_d e^(- c' R \( B \)) #scale(x: 120%, y: 120%)[\]] $

for a fixed polynomial $P$. No intermediate row sum costs a factor growing with $B$.
  Since exactly $n = B \/ d$ indices occur, the trace per physical length costs only one additional factor $1 \/
  d$. Send $B arrow.r oo$ first, and choose $N > deg P + 1$ before letting $d arrow.b 0$.

Finally, the weighted Neumann series compares $T_n^(- 1)$ with the full-lattice convolution inverse:
  every omitted path from an interior row crosses the matrix boundary,
  and so has the same exponentially small bound. The same argument applies to the finite products.
  The corresponding convolution trace integrand has diagonal coefficient $d \( 2 pi \)^(- 1)
  integral_(- pi \/ d)^(pi \/ d) hat(F) \( p \) thin upright(d) p$.
  Multiplication by $n \/ B = 1 \/ d$ gives precisely the Fourier measure $thin upright(d)
  p \/ \( 2 pi \)$ per unit physical length. No infinite-volume trace-class assertion is involved.

=== 5.6 Evaluation of the symbol <sec:overlap-symbol>

#proof[
  In the product part of (5.10), the quadratic coefficient is a sum of $\( log \[ x + i lambda \] \)''$ times the
    two first displacements. Its integral on the real line is $2$,
    from the two limits of $coth \( x + i lambda \)$. The constant accelerations cancel between cross and
    within-set terms. With root density $1 \/ d$ and displacement $d z_(*)$,
    the coefficient per unit length is $2 z_(*)^2$, with a vanishing two-limit error.
  For the determinants, the bulk sequence of $d M_(A C)$, at row-column difference $y = d \( k + z_(*) \)$, is $d$ times
  #[#set math.equation(numbering: n => "(5.25)")
   $
     frac(\( 1 - e^(2 pi i z_(*)) \) coth y - coth \( y - i lambda \) + e^(2 pi i z_(*)) coth \( y + i
     lambda \), - 2 pi i) . $ <eq:overlap-toeplitz>]
  For $M_(C A)$ replace $z_(*)$ by $- z_(*)$; for the two Gaudin denominators use $z_(*) = 0$.
    The coincident pole is continued by its removable limit. The preceding trace comparison reduces the
    computation to the quadratic coefficient of these bulk symbols.
  Use Fourier exponent $- i p d \( k + z_(*) \)$. The simple pole contributes the shifted-sampling identity
  $ sum_(k in bb(Z)) frac(e^(- i p d \( k + z_(*) \)), k + z_(*)) =
    pi #scale(x: 120%, y: 120%)[\(] cot \( pi z_(*) \) - i "sgn" p #scale(x: 120%, y: 120%)[\)] \, wide
    0 < \| p \| < pi \/ d \, $
  with symmetric summation. Subtract $1 \/ y$ from the singular cotangent before treating the remaining part.
    Its derivative is integrable and analytic in every strip $\| "Im" y \| < a < min \( lambda \, pi - lambda \)$.
    Contour shift therefore makes every nonzero alias exponentially small in $1 \/ d$,
    including its fixed Taylor coefficients. This remains uniform at the band ends since a nonzero alias has
    absolute frequency at least $pi \/ d$; the value at $p = 0$ is irrelevant to the integral.
  Write $a_0 = e^(- lambda p)$ and $b_0 = e^(- \( pi - lambda \) p)$.
    The continuous transform together with the sampled pole gives
  $ frac(\( 1 - e^(2 pi i z_(*)) \) \( 1 + a_0 b_0 \) \/ 2 - b_0 + e^(2 pi i z_(*)) a_0, 1 - a_0 b_0) +
    frac(1 + e^(2 pi i z_(*)), 2) = frac(\( 1 - b_0 \) \( 1 + e^(2 pi i z_(*)) a_0 \), 1 - a_0 b_0) . $
  Dividing by the value at zero twist, the relative symbol is
  $ frac(1 + e^(2 pi i z_(*)) a_0, 1 + a_0) . $
  The offset Fourier phases cancel between the two orientations. Their combined quadratic logarithmic coefficient is
  $ - 4 pi^2 z_(*)^2 frac(a_0, \( 1 + a_0 \)^2) . $
  Since
  $ integral_(bb(R)) frac(e^(- lambda p), \( 1 + e^(- lambda p) \)^2) thin frac(thin upright(d) p, 2 pi) =
    frac(1, 2 pi lambda) \, $
  the determinant contribution per length is $- 2 pi z_(*)^2 \/ lambda$.
    For each finite $L$, let $\[ t^2 \]$ denote the Taylor coefficient at $t =
    0$ of the local logarithm fixed above. Adding the product contribution proves the explicit coefficient limit
  $ lim_(d arrow.b 0) limsup_(B arrow.r oo\
B =
  L d \/ 2)
  lr(|1 / B \[ t^2 \] log \| chevron.l Omega_(L \, 0) \, Omega_(L \, t) chevron.r \|^2 + frac(1, 2 lambda \( pi -
  lambda \))|) = 0 . $
  The Taylor coefficient is taken before either array limit;
    no common analytic neighborhood or uniform finite-$t$ expansion is asserted.
    By (5.11) that coefficient is $- I_L$, which proves the lemma. ◻
]

== 6 Chiral currents and Gaussian correlations <sec:chiral>

The goal is to identify the limiting correlations of rescaled centered height differences.
  We first express these finite lattice observables as marked-row products.
  The angular spectrum then separates each product into a holomorphic and an antiholomorphic part;
  a second separation of scales identifies the collision coefficient that determines their Gaussian correlations.

We work at any fixed $0 < c < 2$, equivalently $0 < lambda < pi$,
  and use the diagonal-word Hilbert space $cal(D)$ of Section 4. Its vacuum is $Omega$.
  The commuting rows $P \( w \)$ have spectral functions $f$, the marked row is $J \( w \)$, and

$ H_0 = - log \| P \( 1 \) \| \, wide S = P \( i \) \, wide N \( w \) =
  frac(J \( w \) P \( w \) + P \( w \) J \( w \), 2) . $

Throughout this section $z = x + i y$ denotes a physical point; $w$ remains the angular row parameter.
  At a mesh face define the centered height differences

$ D_(x \, delta) h_delta \( z \) & = 1 / 2 #scale(x: 120%, y: 120%)[\(] h_delta \( z + delta \) -
  h_delta \( z - delta \) #scale(x: 120%, y: 120%)[\)] \,\
D_(y \, delta) h_delta \( z \) & = 1 / 2 #scale(x: 120%, y: 120%)[\(] h_delta \( z + i delta \) -
  h_delta \( z - i delta \) #scale(x: 120%, y: 120%)[\)] \,\
D_delta^(+) & = 1 / 2 \( D_(x \, delta) - i D_(y \, delta) \) \, wide D_delta^(-) = 1 /
  2 \( D_(x \, delta) + i D_(y \, delta) \) . $

The mesh inverse $delta^(- 1)$ is not included in these definitions.
  One may evaluate at any point using the stipulated face convention.
  All arguments below allow the chosen lattice faces to move with the mesh.

Take points whose real coordinates are pairwise distinct.
  In eastward quantization, a centered horizontal or vertical difference is the mean of two consecutive height
  steps. The path convention and $N = \( J P + P J \) \/ 2$ identify its insertion as $- N \( 1 \)$ or $-
  N \( i \)$, respectively. To read a product, join these two-step segments in increasing time order,
  using positive time steps and signed transverse steps. Between their endpoints the propagators are
  $P \( 1 \)^(m_delta) S^(l_delta)$. For successive points $z_i = x_i + i y_i$ and $z_j = x_j +
  i y_j$ in that order, $delta m_delta arrow.r x_j - x_i > 0$ and $delta l_delta arrow.r y_j - y_i$.
  The endpoint offsets change $m_delta \, l_delta$ by at most a fixed number of sites and do not change these limits.

Thus the concrete task is to determine the scaling limit of marked-row products with positive time gaps.
  We construct the two limiting current forms first, then prove convergence of these products and identify their
  correlations.

On $cal(D)$, Lemma 18 gives finite Blaschke products with $f \( 0 \) = f \( oo \) = 1$ and real symmetry,
  including the constant product $f = 1$. Their zeros $zeta$ lie in the fixed cone $"Re" zeta gt.eq
  c_0 \| zeta \|$. The current vacuum identity and its measure are

#[#set math.equation(numbering: n => "(6.1)")
 $ J \( w \) Omega = \( 1 - f \( w \) \) sans(h) \, wide mu \( d f \) =
   parallel sans(h) \( f \) parallel^2 sigma \( d f \) \, wide mu = d s thin nu \, wide nu \( 1 \) =
   kappa < oo . $ <eq:chiral-vacuum-data>]

Here $sigma$ is a scalar spectral measure and $s$ is logarithmic dilation along a nonconstant spectral orbit.
  The symbol $sans(h)$ is a spectral field; it need not be a vector of finite norm.
  Every use of it below includes an integrable multiplier.

=== 6.1 The two chiral forms <the-two-chiral-forms>

Define nonnegative spectral multiplication operators on $cal(D)$ by

#[#set math.equation(numbering: n => "(6.2)")
 $ a_(+) \( f \) = - f' \( 0 \) = sum_zeta 2 "Re" \( zeta^(- 1) \) \, wide a_(-) \( f \) = -
   frac(d, d v) f \( v^(- 1) \)\|_(v = 0) = sum_zeta 2 "Re" zeta . $ <eq:chiral-energies>]

Both values are zero on $f = 1$, and both are strictly positive on every nonconstant fiber.
  Write $E_plus.minus \( R \) = upright(bold(1))_(a_plus.minus lt.eq R)$ and $cal(D)_plus.minus^(upright("fin")) =
  union.big_(R > 0) E_plus.minus \( R \) cal(D)$. These are dense linear subspaces.
  A current form on this domain means a sesquilinear form whose restriction to each bounded spectral band is a
  bounded operator; no unbounded-operator closure is implicit in this usage.

#thm([Lemma 6.1.])[
  #emph[There are consistent skew-adjoint forms $j_plus.minus$ on $cal(D)_plus.minus^(upright("fin"))$ such that,
    for every $R > 0$,
#[#set math.equation(numbering: n => "(6.3)")
 $ parallel E_plus.minus \( R \) j_plus.minus E_plus.minus \( R \) parallel lt.eq C R \, wide
   E_plus.minus \( R \) j_plus.minus Omega = E_plus.minus \( R \) a_plus.minus sans(h) . $ <eq:chiral-form-bound>]

 Their vacuum means vanish. For $s > 0$, the damped forms extend to bounded operators and satisfy
#[#set math.equation(numbering: n => "(6.4)")
 $ parallel e^(- s a_plus.minus) j_plus.minus e^(- s a_plus.minus) parallel lt.eq C \/ s . $ <eq:chiral-damped-form>]

 For every nonnegative measurable function $g$ on $\( 0 \, oo \)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ integral g \( a_plus.minus \( f \) \) thin upright(d) mu \( f \) =
   kappa integral_0^oo g \( t \) frac(d t, t) . $ <eq:chiral-Haar-integral>]

]
] <lem:chiral-forms>

#proof[
  We give the construction at zero. The construction at infinity uses the coordinate $v =
    1 \/ w$ and the same estimates. The reciprocal-radius budget in (6.2), together with the cone condition,
    gives, for a sufficiently small constant $c_(*) > 0$, uniformly on the band $E_(+) \( R \)$
  #[#set math.equation(numbering: n => "(6.6)")
   $ P \( w \) = I + O \( R \| w \| \) \, wide parallel P \( w \)^(- 1) parallel lt.eq C \, quad "Re" w gt.eq 0 \,
     quad \| w \| < c_(*) \/ R . $ <eq:chiral-disc-inverse>]
  For example, normalize each Blaschke factor to one at zero.
    Its difference from one is at most $C \| w \| "Re" \( zeta^(- 1) \)$ in this disc,
    and the sum of these bounds is at most $C R \| w \|$. Taking $c_(*)$ small bounds the product and its inverse.
    All inverses in this proof are restricted to the stated band.
  On $E_(+) \( R \) cal(D)$ write $P_R \( w \)$ for the restriction of $P \( w \)$.
    Compress $J$ by $E_(+) \( R \)$ and continue it to the other half-disc by the reversal identity
  #[#set math.equation(numbering: n => "(6.7)")
   $ J_R \( - w \) = - P_R \( w \)^(- 1) J_R \( w \) P_R \( w \)^(- 1) \, wide J_R =
     E_(+) \( R \) J E_(+) \( R \) . $ <eq:chiral-gluing>]
  For this boundary gluing, first dilate the uncompressed endpoint reversal identity and then compress by
    $E_(+) \( R \)$, which commutes with every $P \( w \)$. Thus the argument of Lemma 19 applies without moving a
    cutoff through a boost. The resulting function is bounded and holomorphic on the punctured disc.
    Its center is removable: the negative Laurent coefficients vanish by the Cauchy bounds.
    At the center (6.7) says $J_R \( 0 \) = - J_R \( 0 \)$, so that constant coefficient is zero.
    Define $E_(+) \( R \) j_(+) E_(+) \( R \)$ to be the linear Taylor coefficient.
    The Cauchy estimate on a circle of radius proportional to $R^(- 1)$ proves the bound $C R$.
  Compression from a larger band to a smaller band commutes with taking this coefficient.
    This proves consistency and defines the form on the union of bands.
    For positive real $w$, $J \( w \)^(*) = - J \( w \)$, so the coefficient is skew-adjoint as a form.
    The same argument gives $j_(-)$.
  Dilation multiplies $a_(+)$ by the dilation factor and $a_(-)$ by its reciprocal.
    On each nonconstant orbit either substitution changes Haar measure $d s$ to $d t \/ t$.
    Equation (6.1) therefore gives (6.5). In particular, $integral_(a_plus.minus lt.eq R) a_plus.minus^2 thin
    upright(d) mu = kappa R^2 \/ 2$. Dividing the vacuum identity by $w$, or by $v$ at infinity,
    and taking the band Taylor coefficient now gives the vacuum assertion in (6.3).
    Its inner product with $Omega$ is zero: $Omega$ lies in the zero-energy band,
    and its compressed current mean is bounded by $C R$ for every $R > 0$.
  For the damping assertion, divide the spectrum of $a_plus.minus$ into $\[ 0 \, s^(- 1) \]$ and
    $\( 2^(q - 1) s^(- 1) \, 2^q s^(- 1) \]$, $q gt.eq 1$. The form bound controls a block between levels $q \,
    r$ by $C s^(- 1) max \( 2^q \, 2^r \)$. Damping on both sides supplies $e^(- 2^(q - 1))
    e^(- 2^(r - 1))$ when the respective index is positive. The sum of these block norms is at most $C \/ s$,
    which proves both existence of the bounded extension and (6.4).
    The same argument shows that tails of these damped block sums tend to zero in operator norm. ◻
]

=== 6.2 Separated scales and representative norms <separated-scales-and-representative-norms>

Let $cal(C)$ be the span of strict diagonal words applied to $Omega$.
  For two positive scales $r_1 \, r_2$, represent an elementary tensor $u_1 ⊗
  u_2$ of such words in $cal(D)$ by replacing every argument in word $i$ by $r_i w$,
  multiplying the two resulting words in that order, and applying the product to $Omega$.
  Extend this prescription to finite linear combinations and denote a chosen representative of $u$ by
  $u_(r_1 \, r_2)$. Different word expressions for the same tensor have difference tending to zero in norm as $\|
  log \( r_1 \/ r_2 \) \| arrow.r oo$. Indeed, Proposition 14, applied after adjunction, gives

#[#set math.equation(numbering: n => "(6.8)")
 $ chevron.l u_(r_1 \, r_2) \, v_(r_1 \, r_2) chevron.r arrow.r chevron.l u \,
   v chevron.r quad \( u \, v in cal(C) ⊗ cal(C) \) . $ <eq:chiral-Gram-limit>]

The asymptotic diagonal RTT exchange permits the two separated word groups to be interchanged with an error
  tending to zero in norm. Consequently a fixed diagonal marked row at $r_i
  w$ acts in the limit on factor $i$ alone. More precisely,
  write $\( A^D \( w \) \)_i$ for the action of $A^D \( w \)$ on tensor factor $i$,
  where $D$ is diagonal and $w$ is strict. Commuting the row through the other word group when necessary gives

$ ∥A^D \( r_i w \) u_(r_1 \, r_2) - #scale(x: 120%, y: 120%)[\(] \( A^D \( w \) \)_i u
  #scale(x: 120%, y: 120%)[\)]_(r_1 \, r_2)∥ arrow.r 0 . $

The error is a finite sum of bounded marked-row products with auxiliary coefficients tending to zero by RTT.
  Thus this is a norm limit, not only a statement about vacuum expectations.

We use convergence of representatives, not a bounded map from the entire tensor completion.
  Precisely, a family $v_delta in cal(D)$ converges strongly to $v in cal(D) ⊗ cal(D)$ if,
  for every $epsilon.alt > 0$, there is a finite word tensor $u$ with

$ parallel u - v parallel < epsilon.alt \, wide limsup_(delta arrow.b 0) parallel v_delta -
  u_delta parallel < epsilon.alt . $

The scales defining $u_delta$ will always be specified. Equation (6.8) makes this definition independent of the
  chosen word expressions.

#thm([Lemma 6.2.])[
  #emph[Suppose $T_delta$ are uniformly bounded operators and, on every finite word tensor,
    $T_delta u_delta$ converges strongly to $T u$. Then $T$ extends to a bounded operator on the tensor
    completion, and $T_delta v_delta arrow.r T v$ for every strongly converging family $v_delta arrow.r v$.
    Such operator limits may be composed, without a commutation assumption.]
  #emph[A family $v_delta$ converges strongly to $v$ if its pairings with all core representatives converge to the
    pairings with $v$ and its norms converge to $parallel v parallel$.]
] <lem:chiral-representatives>

#proof[
  If $parallel T_delta parallel lt.eq M$, then (6.8) implies $parallel T u parallel lt.eq
    M parallel u parallel$ on the core. Approximate $v_delta$ by $u_delta$ as in the definition.
    The norm of $T_delta \( v_delta - u_delta \)$ is at most $M$ times that approximation error,
    while $T_delta u_delta$ has the asserted limit. Taking the approximation error to zero proves the first
    assertion and then composition. For the last assertion, use
  $ parallel v_delta - u_delta parallel^2 = parallel v_delta parallel^2 + parallel u_delta parallel^2 -
    2 "Re" chevron.l v_delta \, u_delta chevron.r arrow.r parallel v - u parallel^2 $
  and approximate $v$ by a core vector $u$. ◻
]

#thm([Proposition 6.3.])[
  (Two-scale spectral limit).  #emph[Take $r_1 = delta^(- 1)$ and $r_2 = delta$,
    with $delta arrow.b 0$ through arbitrary positive real values.
    On core representatives,
    the joint spectral functions $\( f \( delta^(- 1) thin dot.op \) \, f \( delta thin dot.op \) \)$ converge in
    law in the compact-open topology of the right half-plane to the two tensor-factor functions
    $\( F_1 \, F_2 \)$. Jointly with these functions,
#[#set math.equation(numbering: n => "(6.9)")
 $ delta^(- 1) H_0 & arrow.r A := a_(+) ⊗ I + I ⊗ a_(-) \,\
delta^(- 1) arg S & arrow.r - a_(+) ⊗ I + I ⊗ a_(-) \, wide "sgn" P \( 1 \) arrow.r I $ <eq:chiral-scaled-spectrum>]

 in spectral law. The argument is the principal argument near zero. There is an unbounded set of $R > 0$ for which
#[#set math.equation(numbering: n => "(6.10)")
 $ Q_delta \( R \) := upright(bold(1))_(H_0 \/ delta lt.eq R) arrow.r Q \( R \) :=
   upright(bold(1))_(A lt.eq R) $ <eq:chiral-band-limit>]

 strongly on representatives. Bounded spectral multipliers obtained jointly from these limits have the same strong
   interpretation whenever their discontinuity sets have zero limiting state mass.]
  #emph[If $m_delta gt.eq 0$ and $l_delta$ are integers with $delta m_delta arrow.r x gt.eq
    0$ and $delta l_delta arrow.r y$, then
#[#set math.equation(numbering: n => "(6.11)")
 $ P \( 1 \)^(m_delta) S^(l_delta) arrow.r e^(- \( x + i y \) a_(+)) ⊗ e^(- \( x - i y \) a_(-))
   $ <eq:chiral-semigroup-limit>]

 strongly on representatives.]
] <prop:two-scale>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.705, -0.28), (-1.995, 0.7), fill: rgb("#ebebff"), stroke: none)
  rect((1.995, -0.28), (3.705, 0.7), fill: black, stroke: none)
  rect((-3.705, -0.28), (-1.995, 0.7), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  rect((1.995, -0.28), (3.705, 0.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-4.75, 0), (4.987, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.987, 0), [#text(size: 9pt)[$log | zeta |$]], anchor: "west", padding: 0.1176cm)
  circle((-3.467, 0.245), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  circle((-3.04, 0.245), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  circle((-2.708, 0.245), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  circle((-2.28, 0.245), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  circle((2.232, 0.245), radius: 0.0635, fill: black, stroke: none)
  circle((2.565, 0.245), radius: 0.0635, fill: black, stroke: none)
  circle((3.04, 0.245), radius: 0.0635, fill: black, stroke: none)
  circle((3.467, 0.245), radius: 0.0635, fill: black, stroke: none)
  line((-2.85, -0.07), (-2.85, 0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -0.07), (0, 0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.85, -0.07), (2.85, 0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.85, -0.385), [#text(size: 9pt)[$log delta$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.385), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((2.85, -0.385), [#text(size: 9pt)[$- log delta$]], anchor: "north", padding: 0.1176cm)
  content((-2.85, 1.33), [#text(size: 9pt)[scale $delta$: second factor]], anchor: "south", padding: 0.1176cm)
  content((2.85, 1.33), [#text(size: 9pt)[scale $delta^(-1)$: first factor]], anchor: "south", padding: 0.1176cm)
  content((-2.85, -0.735), [#text(size: 9pt)[$a_-(F_2)$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.735), [#text(size: 9pt)[physical scale $w=1$]], anchor: "north", padding: 0.1176cm)
  content((2.85, -0.735), [#text(size: 9pt)[$a_+(F_1)$]], anchor: "north", padding: 0.1176cm)
  line((-3.705, 0.721), (-1.995, 0.721), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-2.85, 0.7563), [#text(size: 9pt)[$2D$]], anchor: "south", padding: 0.1176cm)
  line((1.995, 0.721), (3.705, 0.721), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.85, 0.7563), [#text(size: 9pt)[$2D$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic zero windows for the two factors: the window at $log delta$ belongs to factor $2$, and the window at $- log delta$ belongs to factor $1$. The proof fixes their half-width $D$ and a bound on the number of zeros before sending $delta$ to zero. It controls the state mass of configurations with any zero outside these windows before expanding at the intervening physical scale $w = 1$. ],
) <fig:chiral-windows>

#proof[
  #emph[Spectral functions and exclusion of exterior zeros.] The strong row actions preceding Lemma 29 give
    convergence of every polynomial in finitely many samples of the two spectral functions and their complex
    conjugates. The functions are bounded by one on the right half-plane;
    normal-family compactness therefore gives the joint compact-open convergence.
    The limiting functions are the original finite Blaschke spectral functions on the two factors,
    and are not identically zero. For a vector $v$, its state spectral measure is $sigma_v \( B \) =
    parallel upright(bold(1))_B v parallel^2$ on measurable sets of spectral functions.
    These measures have total masses $parallel u_delta parallel^2 arrow.r parallel u parallel^2$;
    normalization to probability is harmless when $u eq.not 0$.
  The rescaled quantities in (6.9) require control of #emph[every] zero, including zeros between the two scales.
    For a fixed core representative, the exterior RTT estimate from Lemma 18 gives, outside fixed word offsets,
  #[#set math.equation(numbering: n => "(6.12)")
   $ parallel \( I - P \( e^s \) \) u_(r_1 \, r_2) parallel^2 lt.eq
     C_u sum_(i = 1)^2 e^(- 2 eta \| s - log r_i \|) . $ <eq:chiral-exterior-dip>]
  Every zero $zeta$ forces a fixed-width interval about $log \| zeta \|$ on which $\| 1 -
    f \( e^s \) \|$ is bounded below by a positive constant. This follows from the cone condition and the modulus
    loss of its single Blaschke factor; all other factors have modulus at most one.
    Integrating (6.12) outside slightly smaller windows thus yields
  #[#set math.equation(numbering: n => "(6.13)")
   $ & sigma_(u_(r_1 \, r_2)) {upright("some zero lies outside ") union.big_(i = 1)^2 { zeta : \|
     log \( \| zeta \| \/ r_i \) \| lt.eq D }}\
 & #h(40mm)  lt.eq C_u e^(- c_(*) D) . $ <eq:chiral-all-zero-event>]
  An additive fixed change in $D$ absorbs the dip width and the word offsets.
    To justify the event bound explicitly, if any zero lies outside the enlarged windows,
    one entire dip interval lies in the integration region. The integral of $\| 1 -
    f \( e^s \) \|^2$ there is then at least a fixed positive number.
    Markov’s inequality after integration over the state spectral measure gives (6.13).
  #emph[Complete zero clusters and the physical-scale expansion.] Here is the order of truncations.
    Given a desired exceptional mass, first choose $D$ large enough in (6.13) and so that the finite zero sets of
    $F_1 \, F_2$ lie in their annuli with correspondingly high probability.
    Choose their boundary circles to carry no limiting zero almost surely. Only countably many radii are excluded:
    first restrict to a bounded zero count, then apply this assertion to its finite intensity measure,
    and finally take the union over count bounds. On these fixed annuli,
    the cone keeps the zeros in a compact subset of the open right half-plane.
    The argument principle and compact-open convergence give joint convergence of the complete zero multisets,
    including multiplicities. Next choose a finite degree bound $M$ so that larger limiting counts have
    arbitrarily small mass. Take the scale limit only after $D$ and $M$ have been fixed.
    Zero counts and locations now lie in a compact, bounded-count set,
    so every product expansion below is uniform. Finally let the allowed exceptional mass tend to zero,
    increasing $D$ and $M$ if necessary.
  Each limiting product has even degree: conjugate zeros pair, real zeros contribute a factor $-
    1$ between the two ends, and both end values are one. On the preceding high-mass event the complete limiting
    zero counts occur in the chosen annuli. Multiplicity convergence therefore makes both finite-scale clusters
    even with probability tending to one. This proves the needed parity; it is not an assumption on a truncated cluster.
  For clarity, write the large zeros as $delta^(- 1) alpha_j$ and the small zeros as $delta beta_j$.
    On the retained event each normalized zero has modulus between $e^(- D)$ and $e^D$,
    and there are at most $M$ zeros. Normalize each factor to one at zero.
    The two even clusters then give, for $w = 1 \, i$,
  #[#set math.equation(numbering: n => "(6.14)")
   $ f \( w \) = 1 - delta (w sum_j 2 "Re" alpha_j^(- 1) + w^(- 1) sum_j 2 "Re" beta_j) +
     O_(D \, M) \( delta^2 \) . $ <eq:chiral-product-expansion>]
  The two sums converge jointly to $a_(+) \( F_1 \)$ and $a_(-) \( F_2 \)$.
    Taking logarithmic modulus at $1$ and phase at $i$ gives (6.9). The middle sign is positive on this event.
    Values of $H_0 \/ delta$ can be arbitrarily large on the discarded event;
    convergence in law and bounded multiplier convergence require no first-moment estimate for that quantity.
  #emph[Strong multiplier convergence and propagators.] We next strengthen bounded spectral convergence to
    convergence of vectors. Choose a countable total word core, including its rational linear combinations,
    and exclude the union of the atoms of $A$ in all their state measures.
    That union is countable; any other $R$ is admissible in (6.10).
    At such $R$, continuous cutoffs approximate the indicator in each state $L^2$ norm.
    More generally, let $b_delta$ be a uniformly bounded spectral multiplier with the stated joint limit $b$.
    The algebra of polynomials in a countable dense set of interior samples and their conjugates generates the
    spectral functions and is dense in the state $L^2$ space.
    Given a state $u$, choose such a polynomial $p$ with $parallel \( b - p \) u parallel$ small.
    Joint convergence gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ parallel \( b_delta - p_delta \) u_delta parallel^2 arrow.r
     parallel \( b - p \) u parallel^2 . $ <eq:chiral-multiplier-norm>]
  For indicators, take the continuous approximations first. Polynomial actions already converge strongly.
    Equation (6.15) proves strong convergence of the multiplier actions;
    polarization gives the corresponding mixed pairings. Lemma 29 extends these actions to all strongly converging
    families and permits their compositions. No assertion that a current preserves the exceptional-zero event is needed.
  Finally, $\| f \( 1 \) \| lt.eq 1$ and $\| f \( i \) \| = 1$.
    The bounded multipliers $f \( 1 \)^(m_delta) f \( i \)^(l_delta)$ converge jointly by (6.9) to
    $e^(- x A + i y \( - a_(+) ⊗ I + I ⊗ a_(-) \))$, which is (6.11). The same vector argument applies. ◻
]

The exceptional-event estimate is the reason that local spectral convergence can be used at the intervening
  physical scale $w = 1$. It also permits the energy cutoffs needed for current insertions.
  We next prove their convergence in norm, before removing those cutoffs by time damping.

=== 6.3 Current insertions and damping <current-insertions-and-damping>

#thm([Lemma 6.4.])[
  #emph[For every admissible $R > 0$ in Proposition 30 and every $\| w \| = 1$ with $"Re" w gt.eq 0$,
#[#set math.equation(numbering: n => "(6.16)")
 $ delta^(- 1) Q_delta \( R \) N \( w \) Q_delta \( R \) arrow.r
   Q \( R \) #scale(x: 120%, y: 120%)[\(] w \( j_(+) ⊗ I \) +
   w^(- 1) \( I ⊗ j_(-) \) #scale(x: 120%, y: 120%)[\)] Q \( R \) $ <eq:chiral-current-limit>]

 strongly on representatives. All displayed operators are bounded at fixed $R$.
   Finite products with propagators from (6.11) converge when successive positive time gaps stay bounded below.
   In these vacuum products, the cutoffs on both sides of each current may be removed after the scale limit,
   with error tending to zero uniformly on compact sets of separated time coordinates.]
] <lem:current-limit>

#proof[
  Write $Q_delta = Q_delta \( R \)$ and $Q = Q \( R \)$. Glue $J_delta \( w \) =
    Q_delta J \( w \) Q_delta$ to the full annulus
  $ C R delta < \| w \| < c_(*) \/ \( R delta \) $
  using Lemma 19. Let $C_(k \, delta)$ be its Laurent coefficients.
    Fix $rho > 0$ sufficiently small compared with $R^(- 1)$. At the outer circle, the substitution $v = delta w$ gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ delta^(- 1) C_(1 \, delta) = frac(1, 2 pi i) integral_(\| v \| = rho) J_delta \( v \/ delta \)
     frac(d v, v^2) . $ <eq:chiral-outer-coefficient>]
  At the inner circle, put $w = delta v$ to obtain
  #[#set math.equation(numbering: n => "(6.18)")
   $ delta^(- 1) C_(- 1 \, delta) = frac(1, 2 pi i) integral_(\| v \| = rho^(- 1)) J_delta \( delta v \) thin d
     v . $ <eq:chiral-inner-coefficient>]
  Both contours are counterclockwise. The rescaled contours are fixed,
    and both integrands are uniformly bounded in operator norm at fixed $R \, rho$.
  On the strict right semicircle the marked rows converge on their respective tensor factors.
    The cutoffs converge strongly by (6.10). On the reflected semicircle the integrand is the product specified by
    reversal, for example
  $ - #scale(x: 120%, y: 120%)[\(] Q_delta P \( v \/ delta \)^(- 1) Q_delta #scale(x: 120%, y: 120%)[\)]
    J_delta \( v \/ delta \) #scale(x: 120%, y: 120%)[\(] Q_delta P \( v \/ delta \)^(- 1) Q_delta
    #scale(x: 120%, y: 120%)[\)] . $
  The inverse factors are uniformly bounded spectral multipliers on $Q_delta cal(D)$ only.
    Their joint limits follow from Proposition 30, since on $Q
    cal(D)^(⊗ 2)$ the first energy is at most $R$ and (6.6) applies.
    The second contour uses the analogous estimate at infinity.
    Lemma 29 therefore proves convergence of these noncommuting products at every strict contour point.
  Here is the norm justification for passing through the contour integrals.
    For a representative $u_delta$, let $v_delta \( t \)$ be the integrand applied to it,
    including the scalar contour weight, and let $v \( t \)$ be its limit.
    The vectors are bounded uniformly in $t \, delta$. Core test pairings of $integral v_delta \( t \) d
    t$ converge by a single dominated integral. Their squared norms converge because
  #[#set math.equation(numbering: n => "(6.19)")
   $ ∥integral v_delta \( t \) d t∥^2 = integral.double chevron.l v_delta \( t \) \,
     v_delta \( s \) chevron.r thin d t thin d s arrow.r integral.double chevron.l v \( t \) \,
     v \( s \) chevron.r thin d t thin d s . $ <eq:chiral-double-contour>]
  Pairings of strongly convergent representatives converge,
    so dominated convergence applies to this double integral.
    The two imaginary-axis points have contour measure zero. The norm criterion in Lemma 29 now gives strong
    convergence of each coefficient action. By the definitions of the chiral forms,
    the limits of (6.17) and (6.18) are respectively
  $ Q \( j_(+) ⊗ I \) Q \, wide Q \( I ⊗ j_(-) \) Q . $
  It remains to pass from these coefficients to $N$. Put $Sigma = "sgn" P \( 1 \)$ and
  $ T_delta \( w \) = w delta^(- 1) C_(1 \, delta) + w^(- 1) delta^(- 1) C_(- 1 \, delta) . $
  The same-sign and opposite-sign estimates of Lemma 19 give, for some $theta > 0$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ delta^(- 1) Q_delta N \( w \) Q_delta = 1 / 2 #scale(x: 120%, y: 120%)[\(] Sigma T_delta \( w \) +
     T_delta \( w \) Sigma #scale(x: 120%, y: 120%)[\)] + O_R \( delta^theta \) $ <eq:chiral-sign-removal>]
  in operator norm, uniformly on the unit semicircle. Indeed the anticommutator is $+
    T_delta$ on the positive-sign block, $- T_delta$ on the negative-sign block, and zero between opposite signs.
    On same-sign blocks the even Laurent part and all odd modes of order larger than one vanish after rescaling,
    with the stated remainder. The opposite-sign block of the rescaled $N$ has the same vanishing bound.
    Proposition 30 gives $Sigma arrow.r I$ strongly on representatives.
    The coefficient operators are uniformly bounded and have the strong limits just proved.
    Composition in (6.20) proves (6.16). The low-band bounds include the endpoints $w = plus.minus i$.
  We finish with a summable bound for removing cutoffs. For all $U > 0$ and all sufficiently small $delta$,
  #[#set math.equation(numbering: n => "(6.21)")
   $ parallel upright(bold(1))_(H_0 \/ delta lt.eq U) thin delta^(- 1) N \( w \)
     upright(bold(1))_(H_0 \/ delta lt.eq U) parallel lt.eq C U . $ <eq:chiral-all-band-bound>]
  If $U delta$ is small this is Lemma 19; otherwise the global bound on $N$ gives it by $delta^(- 1) lt.eq C U$.
    Decompose $H_0 \/ delta$ into bands $\[ 0 \, 1 \]$ and $\( 2^(q - 1) \, 2^q \]$, $q gt.eq 1$.
    A current block between levels $q \, r$ costs at most $C max \( 2^q \, 2^r \)$.
    Each internal propagator with $delta m gt.eq b > 0$ supplies at level $q gt.eq
    1$ the factor $e^(- b 2^(q - 1))$, since $parallel P \( 1 \)^m upright(bold(1))_(H_0 \/ delta > 2^(q - 1))
    parallel lt.eq e^(- b 2^(q - 1))$; unit shifts do not affect this norm.
    The outer states are the vacuum, of energy zero. For a product of $k$ currents,
    a bound for the sum over its $k - 1$ internal indices is a constant times
  #[#set math.equation(numbering: n => "(6.22)")
   $ sum_(q_1 \, dots.h \, q_(k - 1) gt.eq 0) product_(j = 1)^(k - 1) \( 1 + 2^(q_j) \)^2 e^(- b' 2^(q_j)) \, wide
     b' > 0 . $ <eq:chiral-dyadic-majorant>]
  This converges, and its tails with any $2^(q_j) > R$ tend to zero uniformly in the mesh.
    The limiting forms have the identical bound using $A$ and (6.3).
    Fixed-cutoff convergence, followed by this tail estimate, proves the product assertion.
    The constants are uniform when the finitely many limiting time gaps have a fixed positive lower bound. ◻
]

=== 6.4 The limiting derivative correlations <the-limiting-derivative-correlations>

For the centered differences introduced at the start of the section,
  Lemma 31 and (6.11) show that the insertions of $delta^(- 1) D_delta^(+)$ and $delta^(- 1)
  D_delta^(-)$ converge to $- j_(+) ⊗ I$ and $- I ⊗ j_(-)$, respectively. For example, the two combinations follow from

$ N \( 1 \) arrow.r.squiggly j_(+) ⊗ I + I ⊗ j_(-) \, wide N \( i \) arrow.r.squiggly i j_(+) ⊗ I - i I ⊗ j_(-) . $

Currents in different factors commute. Their propagators and the tensor vacuum factor as well.
  The limiting mixed correlations therefore factor into a pure $+$ correlation and a pure $-$ correlation.

Write $a = a_(+)$ and $j = j_(+)$ for the moment. For increasing real parts,
  $"Re" z_(i_1) < dots.h.c < "Re" z_(i_k)$, define

#[#set math.equation(numbering: n => "(6.23)")
 $ F_k \( z_1 \, dots.h \, z_k \) = ⟨Omega \, thin \( - j \) e^(- \( z_(i_k) - z_(i_(k - 1)) \) a) \( - j \)
   dots.h.c e^(- \( z_(i_2) - z_(i_1) \) a) \( - j \) Omega⟩ . $ <eq:chiral-ordered-function>]

Set $F_0 = 1$ and $F_1 = 0$. The products in (6.23) are defined by inserting positive real damping on both sides
  of each form; arbitrary extra end damping may be inserted because $a Omega = 0$.
  Lemma 28 makes the resulting factors bounded, and the dyadic tail bound shows that the value is independent of
  this allocation. By reality of the height field, the pure $-$ answer is
  $overline(F_k \( z_1 \, dots.h \, z_k \))$. All the preceding convergence is uniform on compact subsets of the
  region of distinct real coordinates. Indeed, it holds along every sequence of moving mesh faces converging to
  such a configuration, and the cutoff and damping bounds are uniform on its compact subsets.

The two-point function is already explicit. If $"Re" z_1 < "Re" z_2$, skew-adjointness,
  the vacuum identity and (6.5) give

$ F_2 \( z_1 \, z_2 \) = - integral a \( f \)^2 e^(- \( z_2 - z_1 \) a \( f \)) thin d mu \( f \) = -
  kappa integral_0^oo t e^(- \( z_2 - z_1 \) t) thin d t = - frac(kappa, \( z_2 - z_1 \)^2) . $

The integrals converge because $"Re" \( z_2 - z_1 \) > 0$.
  For higher moments, we need this coefficient at a collision even between nonvacuum exterior states.

We now determine these holomorphic correlations from their singularities.
  The two axial orderings give analytic formulas away from a finite grid of possible punctures.
  We will bound the growth at every puncture, compute the coefficient when two physical points actually collide,
  and remove the remaining artificial punctures. These facts and decay at infinity will force Wick’s recursion.

#thm([Lemma 6.5.])[
  #emph[Let
$ U_x = { \( z_1 \, dots.h \, z_k \) : "Re" z_i eq.not "Re" z_j upright(" for ") i eq.not j } \, quad U_y =
  { \( z_1 \, dots.h \, z_k \) : "Im" z_i eq.not "Im" z_j upright(" for ") i eq.not j } . $

 The function $F_k$ has a symmetric, jointly holomorphic extension to $U_x union U_y$,
   and is the limit of the centered $+$ derivative correlations on both sets.]
  #emph[Fix $z_2 \, dots.h \, z_k$ with distinct real coordinates and distinct imaginary coordinates.
    As a function of $z_1$, the extension is holomorphic away from the grid points
#[#set math.equation(numbering: n => "(6.24)")
 $ p_(j h) = "Re" z_j + i "Im" z_h \, wide 2 lt.eq j \, h lt.eq k . $ <eq:chiral-grid-points>]

 Near any such point it is $O \( \| z_1 - p_(j h) \|^(- 2) \)$,
   locally uniformly as the fixed points vary while retaining these coordinate separations.
   For $k gt.eq 2$ it tends to zero as $\| z_1 \| arrow.r oo$ with the other points fixed.]
] <lem:chiral-holomorphy>

#proof[
  On a compact subset of an eastward ordering chamber, give each current a fixed positive amount of damping on
    both sides. The remaining semigroups have parameters with real parts bounded below.
    These semigroups are holomorphic in operator norm there: for instance $parallel a^m e^(- s a) parallel lt.eq
    m ! s^(- m)$ after reducing $s$ by a fixed factor. The resulting bounded product is jointly holomorphic in all
    its parameters. This proves joint holomorphy on $U_x$, rather than merely separate holomorphy.
  By Proposition 17, northward quantization describes the same physical law.
    In its coordinates $z' = - i z$, the centered differences transform as $D_(x' \, delta) =
    D_(y \, delta)$ and $D_(y' \, delta) = - D_(x \, delta)$, hence $D_delta^(+) = - i D_delta^(' +)$.
    The possible face-origin shift is one lattice spacing and is covered by moving-face convergence.
    The northward formula is thus holomorphic on $U_y$. On $U_x ∩
    U_y$ both formulas are limits of the same physical moments, so they agree and glue.
    Permuting the insertions does not change a physical product, which proves symmetry.
  With the other points as in the statement, failure of both axial orderings occurs only at the grid points
    (6.24). Choose a small neighborhood of the fixed configuration in which all its real gaps and imaginary gaps
    remain at least $b > 0$. Near $p_(j h)$, the eastward representation has only one possibly small gap,
    $g_x = \| "Re" \( z_1 - p_(j h) \) \|$, between $z_1$ and $z_j$.
    The northward representation has only one possibly small gap, $g_y = \| "Im" \( z_1 - p_(j h) \) \|$,
    between $z_1$ and $z_h$. Use the ordering with $g = max \( g_x \, g_y \) gt.eq \| z_1 -
    p_(j h) \| \/ sqrt(2)$. Only the two currents bordering that gap need shrinking damping.
    Give each damping $g \/ 4$ on both sides: the inner dampings consume $g \/ 2$,
    and the outer dampings come from neighboring fixed gaps or from a vacuum endpoint.
    All other currents receive fixed damping. Equation (6.4) gives a cost $C \/
    g$ for each of the two currents and a bounded cost for the rest. This proves the uniform quadratic bound.
    A point sharing the other coordinate is separated in the chosen ordering.
  Finally, when $\| z_1 \|$ is large, one coordinate makes $z_1$ extreme in the corresponding ordering,
    with a gap $g$ of order $\| z_1 \|$ to all other points. Give the isolated current damping of order $g$ on
    both sides, using free damping on its vacuum side. Keep fixed damping around all remaining currents.
    The isolated factor costs $C \/ g$; imaginary semigroup factors have norm one. Thus $F_k arrow.r 0$ at infinity. ◻
]

=== 6.5 The collision operator <the-collision-operator>

The remaining input for Gaussianity is the coefficient at a genuine collision.
  A second separation of scales shows that a short pair of chiral currents becomes a scalar,
  even between nonvacuum exterior states.

#thm([Lemma 6.6.])[
  #emph[For $a = a_(+)$ and $j = j_(+)$, the bounded operators
#[#set math.equation(numbering: n => "(6.25)")
 $ K_epsilon.alt = e^(- epsilon.alt a) \( epsilon.alt j \) e^(- epsilon.alt a) \( epsilon.alt j \)
   e^(- epsilon.alt a) $ <eq:chiral-collision-operator>]

 are uniformly bounded for $epsilon.alt > 0$ and satisfy
#[#set math.equation(numbering: n => "(6.26)")
 $ K_epsilon.alt harpoon.rt - kappa I wide \( epsilon.alt arrow.b 0 \) . $ <eq:chiral-collision-limit>]

 Consequently, fix $z_2 \, dots.h \, z_k$ with pairwise distinct real coordinates and pairwise distinct imaginary
   coordinates, and let $2 lt.eq j lt.eq k$. Then
#[#set math.equation(numbering: n => "(6.27)")
 $ lim_(epsilon.alt arrow.b 0) epsilon.alt^2 F_k \( z_j + epsilon.alt \, z_2 \, dots.h \, z_k \) = -
   kappa F_(k - 2) \( z_2 \, dots.h \, hat(z)_j \, dots.h \, z_k \) . $ <eq:chiral-double-pole>]

 The coefficient on the right is independent of both colliding positions.]
] <lem:collision>

#proof[
  Split the middle damping of (6.25) into two halves. Each of the resulting damped current factors has norm
    bounded by a constant, by (6.4) at scale $epsilon.alt \/ 2$. This gives uniform boundedness.
  Apply the representative construction with scales $r_1 = epsilon.alt$ and $r_2 = 1$.
    Its Gram and row limits use only separation of the two scales, so they are unchanged.
    The all-zero event estimate (6.13), with the same order of fixed windows, bounded degree,
    and then scale limit, gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ epsilon.alt a \( f \) arrow.r a \( F_1 \) $ <eq:chiral-collision-energy>]
  jointly with the two spectral functions. To see the scaling directly,
    a zero $epsilon.alt alpha$ contributes $2 "Re" alpha^(- 1)$ to $epsilon.alt a$,
    whereas a zero $beta$ at the unshifted scale contributes $2 epsilon.alt "Re" beta^(- 1)$.
    On the bounded-count annuli the latter sum tends uniformly to zero.
    The exceptional-zero event has arbitrarily small mass and is discarded before making this expansion.
  Choose a non-atomic band endpoint and put $B_epsilon.alt = upright(bold(1))_(epsilon.alt a lt.eq R)$ and $B =
    upright(bold(1))_(a ⊗ I lt.eq R)$. The spectral multiplier argument proves $B_epsilon.alt arrow.r B$ strongly.
    The definition of $j$ by its Taylor coefficient gives, for a sufficiently small fixed $rho < c_(*) \/ R$,
  #[#set math.equation(numbering: n => "(6.29)")
   $ epsilon.alt B_epsilon.alt j B_epsilon.alt = frac(1, 2 pi i) integral_(\| v \| = rho) B_epsilon.alt
     J \( epsilon.alt v \) B_epsilon.alt thin frac(d v, v^2) arrow.r B \( j ⊗ I \) B . $ <eq:chiral-collision-contour>]
  Indeed, the unscaled band is $a lt.eq R \/ epsilon.alt$, whose Taylor disc has radius proportional to
    $epsilon.alt \/ R$. On the right semicircle the row acts on the first factor;
    on the left semicircle the bounded compressed inverse and reversal apply.
    The single- and double-contour argument (6.19) proves convergence in representative norm.
    Thus (6.28) and (6.29) give the cutoff limit of $K_epsilon.alt$.
  These cutoffs can be removed in operator norm uniformly in $epsilon.alt$.
    Decompose $epsilon.alt a$ into $\[ 0 \, 1 \]$ and the dyadic bands above one.
    A block of $epsilon.alt j$ between levels $q \, r$ costs at most $C max \( 2^q \, 2^r \)$.
    The three damping factors of $K_epsilon.alt$ give an absolutely summable majorant
  $ C sum_(q_0 \, q_1 \, q_2 gt.eq 0) max \( 2^(q_0) \, 2^(q_1) \) max \( 2^(q_1) \, 2^(q_2) \)
    e^(- b \( 2^(q_0) + 2^(q_1) + 2^(q_2) \)) . $
  Absorbing the lowest-band constants into $C$ gives some fixed $b > 0$.
    The part with any $2^(q_i) > R$ tends to zero as $R arrow.r oo$.
    The same estimate holds for the limiting tensor product. Therefore, on separated-scale representatives,
  $ K_epsilon.alt arrow.r #scale(x: 120%, y: 120%)[\(] e^(- a) j e^(- a) j e^(- a) #scale(x: 120%, y: 120%)[\)] ⊗ I . $
  A fixed unboosted word vector $u$ is exactly the representative of $Omega ⊗ u$:
    its small-scale word is the identity. Hence for fixed word vectors $u \,
    v$ the last limit contracts the first factor to
  $ chevron.l Omega \, j e^(- a) j Omega chevron.r = - integral a \( f \)^2 e^(- a \( f \)) thin upright(d)
    mu \( f \) = - kappa integral_0^oo t e^(- t) thin d t = - kappa . $
  The sign uses the skew-adjointness of $j$; the integrals are justified by (6.5).
    This proves (6.26) on a dense set of test vectors. Uniform boundedness extends it to every pair of vectors in
    $cal(D)$.
  For (6.27), take $z_1 = z_j + epsilon.alt$ in the eastward ordering. The two colliding currents are consecutive.
    After multiplication by $epsilon.alt^2$, their part of the product becomes $K_epsilon.alt$,
    provided its two outer dampings are subtracted from the adjacent exterior gaps.
    Those gaps remain positive for small $epsilon.alt$; at an endpoint, insert damping freely on the vacuum.
    The two exterior vectors converge strongly, because all their damping gaps remain positive.
    They may therefore be replaced by their limits in the weak convergence of the uniformly bounded
    $K_epsilon.alt$. The two insertion minus signs cancel. Omitting the colliding currents recombines the
    adjoining semigroups, giving exactly the right side of (6.27). No dependence on the collision position remains. ◻
]

=== 6.6 Removal of artificial poles and Wick recursion <removal-of-artificial-poles-and-wick-recursion>

#thm([Proposition 6.7.])[
  #emph[Let $k gt.eq 1$, and let $z_1 \, dots.h \, z_k$ have pairwise distinct real coordinates or pairwise
    distinct imaginary coordinates. For $epsilon_i in { + \, - }$ and moving mesh faces $z_(i \, delta) arrow.r z_i$,
#[#set math.equation(numbering: n => "(6.30)")
 $ lim_(delta arrow.b 0) bb(E) product_(i = 1)^k delta^(- 1) D_delta^(epsilon_i) h_delta \( z_(i \, delta) \) =
   sum_pi med product_({ i \, j } in pi) C_(epsilon_i \, epsilon_j) \( z_i \, z_j \) \,
   $ <eq:chiral-Gaussian-current-limit>]

 where the sum is over pairings, is zero for odd $k$, and
#[#set math.equation(numbering: n => "(6.31)")
 $ C_(+ +) \( z \, xi \) = - frac(kappa, \( z - xi \)^2) \, wide C_(- -) \( z \, xi \) = -
   frac(kappa, \( macron(z) - macron(xi) \)^2) \, wide C_(+ -) \( z \, xi \) = C_(- +) \( z \, xi \) =
   0 . $ <eq:chiral-contractions>]

 Convergence is uniform on compact subsets of either separated-time region.
   By linearity the corresponding assertion holds for all products of the real centered derivatives $delta^(- 1)
   D_(x \, delta)$ and $delta^(- 1) D_(y \, delta)$. These are the off-diagonal derivatives of the Gaussian covariance
#[#set math.equation(numbering: n => "(6.32)")
 $ K_kappa \( z \, xi \) = - 2 kappa log \| z - xi \| . $ <eq:chiral-log-covariance>]

]
] <prop:gaussian-currents>

#proof[
  The preceding lemmas already give the limits as products of pure chiral functions and their conjugates.
    It remains to determine $F_k$. Fix generic spectators $z_2 \, dots.h \, z_k$ as in Lemma 32.
    Its quadratic bound makes every grid puncture of $F_k$ a pole of order at most two:
    the Cauchy bound for a Laurent coefficient of order $- m$, $m > 2$,
    is $C r^(m - 2)$ on a circle of radius $r$, and tends to zero.
  First consider an artificial puncture $p = p_(j h) = "Re" z_j + i "Im" z_h$ with $j eq.not h$.
    Take a fixed small circle $Gamma$ about its position for the chosen spectators.
    In a sufficiently small complex neighborhood of the spectators,
    the circle encloses just this moving grid point and remains in $U_x union U_y$. The contour moments
  $ m_ell = frac(1, 2 pi i) integral_Gamma zeta^ell F_k \( zeta \, z_2 \, dots.h \, z_k \) thin d zeta $
  are jointly holomorphic in the spectator variables, by the uniform bounds and joint holomorphy on the circle.
    If the principal part is $A \/ \( zeta - p \)^2 + B \/ \( zeta - p \)$, residue calculation gives
  #[#set math.equation(numbering: n => "(6.33)")
   $ m_ell = B p^ell + A ell p^(ell - 1) \, wide m_0 m_2 - m_1^2 = - A^2 \, wide m_0 m_3 - m_1 m_2 = -
     2 p A^2 . $ <eq:chiral-pole-moments>]
  If $A$ is nonzero at any parameter value, the nonzero denominator persists locally and
  $ p = frac(m_0 m_3 - m_1 m_2, 2 \( m_0 m_2 - m_1^2 \)) $
  is holomorphic there. This is impossible, since
  $ p = frac(z_j + macron(z)_j, 2) + frac(z_h - macron(z)_h, 2) \, wide partial_(macron(z)_j) p = 1 / 2 . $
  Thus $A$ vanishes. If $B$ is nonzero, $p = m_1 \/ m_0$ gives the same contradiction.
    Every artificial puncture is removable. This removal is joint in the parameters:
    inside $Gamma$, the Cauchy integral of $F_k \( eta \, upright(bold(z)) \) \/ \( eta - zeta \)$ supplies a
    jointly holomorphic extension and agrees with each one-variable removable extension.
  At a true collision, put $xi = \( z_1 + z_j \) \/ 2$ and $d = z_1 - z_j$, retaining generic exterior points.
    Locally the union $U_x union U_y$ contains every $d eq.not 0$.
    The function $H \( xi \, d \, upright(bold(z)) \) = d^2 F_k$ is uniformly bounded there and therefore extends
    jointly holomorphically to $d = 0$. One can see this directly by its Cauchy coefficients in $d$:
    boundedness removes the negative coefficients, uniformly on smaller spectator neighborhoods.
    Symmetry under exchanging the two colliding insertions makes $H$ even in $d$.
    Lemma 33 identifies its constant term as
  $ H \( xi \, 0 \, upright(bold(z)) \) = - kappa F_(k - 2) \( upright(bold(z)) \) \, $
  independent of $xi$. Subtracting this term leaves an even holomorphic function with zero constant term,
    hence a function divisible by $d^2$. It follows that
  $ F_k + frac(kappa F_(k - 2) \( upright(bold(z)) \), \( z_1 - z_j \)^2) $
  is holomorphic at this diagonal. In particular there is no simple residue.
    Independence of the collision center is needed here: a varying coefficient of $d^(- 2)$ could otherwise create
    a simple term when $z_j$ is held fixed.
  Subtract all these true double-pole terms as a function of $z_1$.
    The artificial points are removable, the true points have no remaining principal parts,
    and the resulting function is entire. Lemma 32 gives decay at infinity,
    and the subtracted rational terms also decay there. Liouville’s theorem yields
  #[#set math.equation(numbering: n => "(6.34)")
   $ F_k \( z_1 \, dots.h \, z_k \) = -
     kappa sum_(j = 2)^k frac(F_(k - 2) \( z_2 \, dots.h \, hat(z)_j \, dots.h \, z_k \), \( z_1 - z_j \)^2) .
     $ <eq:chiral-Wick-recursion>]
  Together with $F_0 = 1$ and $F_1 = 0$, this is Wick’s recursion with contraction $- kappa \/ \( z_i - z_j \)^2$.
    Continuity extends it from the generic spectators to every strict axial chamber.
    Factorization of the two chiral sectors and reality then give (6.30).
  Finally, $partial_z partial_xi K_kappa \( z \, xi \) = - kappa \/ \( z - xi \)^2$ and $partial_z
    partial_(macron(xi)) K_kappa \( z \, xi \) = 0$ away from collisions.
    The conjugate identity gives the other pure contraction. This proves the covariance assertion and,
    by linearity, all the real derivative formulas. The uniform moving-face convergence established above gives
    the asserted local uniformity. Estimates across a time-ordering wall and for undifferentiated fields will be
    supplied in Section 7; none is needed for this proposition. ◻
]

== 7 Moment bounds and convergence of the height field <sec:probability>

The current limits of Section 6 concern insertions at separated times. We now pass to the height field itself.
  We first identify its law on smooth neutral tests, then remove endpoint smoothings to obtain the separated
  increment moments. The logarithmic variogram bound extends this identification to finite-energy signed measures.
  After these three steps, we prove tightness in negative regularity, treating ordinary restriction spaces,
  the outward test convention, and intrinsic dual spaces separately.

Two estimates drive these passages. An energy-commutator argument gives uniform ordinary moments for neutral
  spatial averages. A small neutral factor separated from all other factors has a correlation that tends to zero
  as a positive power of its diameter. The latter estimate makes the successive removal of endpoint smoothings summable.

Throughout the angular argument, fix $0 < c < 2$, and retain the plane state, $kappa$, the vacuum $Omega$,
  the shift $S = P \( i \)$, and the nonnegative endpoint Hamiltonian $E$ from Section 4.
  The Gaussian field appearing before its normalization is identified has covariance

#[#set math.equation(numbering: n => "(7.1)")
 $ K_kappa \( x \, y \) = - 2 kappa log \| x - y \| . $ <eq:prob-log-kernel>]

We denote this field modulo constants by $cal(H)_kappa$. All constants below may depend on the fixed parameter and
  the stated moment order. None depends on an integer approximation to $delta^(- 1)$:
  $delta > 0$ is always an arbitrary real mesh size.

=== 7.1 Ordinary moments from the endpoint Hamiltonian <ordinary-moments-from-the-endpoint-hamiltonian>

On an equal-time column, $Z_l$ is the diagonal spin at site $l$, with values $plus.minus 1$.
  These are self-adjoint site operators; they should be distinguished from marked time rows.
  A path height increment is the negative of its step spin.
  Vacuum moments of the commuting site spins are their ordinary moments under $bb(P)_c$.

#thm([Lemma 7.1.])[
  (Ordinary spatial moments).  #emph[Fix $0 < A < oo$. Let $R gt.eq 1$,
    and let $g = \( g_l \)_(l in bb(Z))$ be a finitely supported real sequence such that
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_l \| g_l \| lt.eq A R \, wide sum_l \| g_(l + 1) - g_l \| lt.eq A \, wide sum_l \| g_(l + 1) -
   g_l \|^2 lt.eq A \/ R . $ <eq:prob-g-conditions>]

 Then, for every $1 lt.eq b < oo$,
#[#set math.equation(numbering: n => "(7.3)")
 $ ∥sum_l g_l Z_l∥_(L^b \( bb(P)_c \)) lt.eq C_(A \, b) . $ <eq:prob-ordinary-moments>]

 In particular the conclusion holds if $g$ has support of length at most $A R$, $\| g_l \| lt.eq A$,
   and $\| g_(l + 1) - g_l \| lt.eq A \/ R$. The same assertions hold with the two axes interchanged.]
] <lem:ordinary-moments>

#proof[
  Work throughout this proof in $cal(H)_(upright("spin"))$,
    the closed span of $O Omega$ with $O$ a finite local spin matrix.
    By Lemma 20, this subspace contains $Omega$ and reduces $E$.
    Every finite local spin matrix and its adjoint preserve the local generating vectors and hence their closed
    span. In particular $D = D_g = sum_l g_l Z_l$ is bounded and self-adjoint on $cal(H)_(upright("spin"))$.
    The shift preserves this subspace in both directions, since it translates local matrices and fixes $Omega$.
    In this proof $E$ denotes its self-adjoint restriction to $cal(H)_(upright("spin"))$, $B_M =
    upright(bold(1))_({ E lt.eq M \/ R })$ is its spectral projection there,
    and all Hilbert-space norms are taken on this subspace.
  First we prove a two-sided compression bound. For fixed $M$,
    Lemma 20 places the range of $B_M$ inside the ambient spectral band $H_0 lt.eq C M \/ R$,
    when $R$ is sufficiently large. The full-space estimates of Lemma 19 therefore apply to these compressions
    without increasing their norms. The identity
  $ N \( i \) = 1 / 2 S^2 \( Z_0 + Z_1 \) $
  and translation by the unitary shift therefore give $parallel B_M \( Z_l + Z_(l + 1) \) B_M parallel lt.eq
    C_M \/ R$. Pair the consecutive sites in the sum for $D$.
    The coefficients of the paired sums have total absolute value at most $A R$;
    the remaining single-site terms have total absolute coefficient at most $sum_l \| g_(l + 1) - g_l \|$. Consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ parallel B_M D B_M parallel lt.eq C_(A \, M) . $ <eq:prob-two-sided>]
  For bounded $R$, this follows instead from $parallel D parallel lt.eq sum_l \| g_l \|$.
  The local-link description of $E$ in Lemma 20 gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ parallel \[ D \, \[ E \, D \] \] parallel lt.eq C sum_l \| g_(l + 1) - g_l \|^2 lt.eq
     C_A \/ R . $ <eq:prob-double-commutator>]
  Indeed the diagonal part of a link commutes with $D$, and its spin exchange preserves $Z_l + Z_(l + 1)$;
    only the coefficient difference $g_l - g_(l + 1)$ enters each commutator.
    These identities initially hold on the local analytic core in $cal(H)_(upright("spin"))$,
    which is a core for the restricted $E$. On that core, $\[ E \, D \]$ is a finite sum of bounded local
    operators. To extend it, approximate a vector in $"Dom" \( E \) subset
    cal(H)_(upright("spin"))$ in the graph norm by local core vectors and use $E D u =
    D E u + \[ E \, D \] u$ there. Boundedness of $D$ and of this commutator, followed by closedness of $E$,
    shows that $D$ preserves the restricted domain and that the identity extends to it.
    The same holds for every fixed local power of $D$, justifying the following energy-projection and vacuum
    calculations on this subspace.
  Set $m_(*) = parallel D B_1 parallel$, which is finite since $D$ is bounded.
    For a unit vector $u in B_1 cal(H)_(upright("spin"))$, expanding the double commutator yields
  $ chevron.l D u \, E D u chevron.r = 1 / 2 chevron.l u \, \[ D \, \[ E \, D \] \] u chevron.r +
    "Re" chevron.l D u \, D E u chevron.r lt.eq frac(C_A + m_(*)^2, R) . $
  Here $E u in B_1 cal(H)_(upright("spin"))$ and $parallel E u parallel lt.eq R^(- 1)$.
    The component of $D u$ above energy $2 \/ R$ thus has squared norm at most $\( C_A + m_(*)^2 \) \/ 2$.
    Its component below $2 \/ R$ is bounded by (7.4), with $M = 2$. Taking a supremum gives
  $ m_(*)^2 lt.eq C_A + 1 / 2 m_(*)^2 \, wide upright("and therefore") wide parallel D B_1 parallel =
    parallel B_1 D parallel lt.eq C_A . $
  We next bound powers of $D$ on the vacuum. Since $E Omega = 0$,
  $ 2 chevron.l D^k Omega \, E D^k Omega chevron.r = chevron.l Omega \, \[ D^k \, \[ E \, D^k \] \] Omega chevron.r . $
  In the site-diagonal representation, let $D^(upright("sw") \, l)$ be the value of $D$ after exchanging the spins
    at $l \, l + 1$. An exchange term in this double commutator has, up to a bounded link coefficient and sign,
    the multiplier $#scale(x: 120%, y: 120%)[\(] D^k - \( D^(upright("sw") \, l) \)^k
    #scale(x: 120%, y: 120%)[\)]^2$. This nonnegative multiplier commutes with the exchange. Furthermore,
  $ \| D - D^(upright("sw") \, l) \| lt.eq 2 \| g_l - g_(l + 1) \| \,
    wide \| D^k - \( D^(upright("sw") \, l) \)^k #scale(x: 120%, y: 120%)[\|]^2 lt.eq C_(A \, k) \| g_l -
    g_(l + 1) \|^2 \( 1 + \| D \|^(2 k - 2) \) . $
  For the second inequality use the factorization of $a^k - b^k$ and $\| a - b \| lt.eq 2 A$.
    Taking the absolute value of an exchange expectation is bounded by the expectation of its nonnegative
    multiplier, since the exchange is a norm-one involution commuting with that multiplier. Summing the links proves
  #[#set math.equation(numbering: n => "(7.6)")
   $ chevron.l D^k Omega \, E D^k Omega chevron.r lt.eq C_(A \, k) / R #scale(x: 120%, y: 120%)[\(] 1 +
     parallel D^(k - 1) Omega parallel^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:prob-power-energy>]
  The low-energy component satisfies $parallel B_1 D^k Omega parallel lt.eq
    C_A parallel D^(k - 1) Omega parallel$; on its complement, positivity of $E -
    R^(- 1)$ bounds the squared norm by $R chevron.l D^k Omega \, E D^k Omega chevron.r$.
    Induction in $k$ now bounds every $parallel D^k Omega parallel$.
    These are the even ordinary moments of $D$; interpolation gives all finite orders.
    Axial symmetry gives the other orientation. ◻
]

#thm([Corollary 7.2.])[
  (Neutral blocks).  #emph[Let $b in bb(R)^2$, $r > 0$, and let $f$ be a measurable real density supported in a
    square of side $A r$ centered within distance $A r$ of $b$, with
$ integral f = 0 \, wide \| f \| lt.eq A r^(- 2) . $

 For every finite $q$,
#[#set math.equation(numbering: n => "(7.7)")
 $ parallel chevron.l h_delta \, f chevron.r parallel_(L^q) lt.eq C_(A \, q) $ <eq:prob-neutral-block>]

 uniformly in $b \, r \, delta$. Products of finitely many such blocks have uniform absolute moment bounds,
   even when their supports overlap.]
] <cor:neutral-blocks>

#proof[
  Suppose first $r \/ delta gt.eq 1$, and put $R = r \/ delta$.
    Integrate $f$ on mesh cells, giving masses $a_(j l)$ of size $O \( R^(- 2) \)$,
    with $O \( R \)$ possible indices in each direction. Let $m_j = sum_l a_(j l)$,
    and choose a mass-one discrete profile $\( p_l \)$, of width $O \( R \)$, bounded by $C \/ R$.
    The masses $a_(j l) - m_j p_l$ are neutral in each column.
    Their discrete primitives are bounded by $C \/ R$, with consecutive differences $O \( R^(- 2) \)$.
    Summation by parts and Lemma 35, applied after multiplication by $R$,
    bound the $L^q$ norm of each column contribution by $C_q \/ R$.
    Their sum is bounded by Minkowski’s inequality. For the remaining masses $m_j p_l$, note that $sum_j m_j = 0$,
    $\| m_j \| lt.eq C \/ R$; sum by parts in the other axis, then average against $p_l$.
    This gives the same bound. If $r < delta$, the support meets only a bounded number of neighboring faces.
    Neutrality, bounded total variation, and unit height jumps give a deterministic bound.
    Finally apply Hölder’s inequality to products, using the required higher moments. No disjointness is used. ◻
]

=== 7.2 Smooth test functions <smooth-test-functions>

#thm([Proposition 7.3.])[
  #emph[For every finite family of smooth compactly supported densities $phi.alt_1 \, dots.h \,
    phi.alt_m$ of integral zero, the vector $#scale(x: 120%, y: 120%)[\(] chevron.l h_delta \,
    phi.alt_i chevron.r #scale(x: 120%, y: 120%)[\)]_i$ converges jointly in law and in every joint moment to the
    corresponding pairings of $cal(H)_kappa$. The moment convergence is uniform when the tests vary in a compact
    smooth family with a common compact support.]
] <prop:smooth-tests>

#proof[
  First assume that $integral phi.alt \( x \, y \) thin d y = 0$ for every $x$.
    For fixed continuum time $x$, put $F \( x \, y \) = integral_(- oo)^y phi.alt \( x \, t \) thin d t$.
    Discrete summation by parts writes the line pairing as
  $ integral h_delta \( x \, y \) phi.alt \( x \, y \) thin d y = -
    sum_(l in bb(Z)) F \( x \, \( l + 1 \) delta \) #scale(x: 120%, y: 120%)[\(]
    h \( floor.l x \/ delta floor.r \, l + 1 \) - h \( floor.l x \/ delta floor.r \, l \)
    #scale(x: 120%, y: 120%)[\)] . $
  The primitive is compactly supported, bounded, and changes by $O \( delta \)$ at consecutive sites.
    Lemma 35 therefore bounds this pairing in every $L^q$, uniformly in $x$ and $delta$.
    The same remains true for any finite product of line pairings.
  Replace the forward height differences in this expression by the centered differences of Proposition 34,
    shifting the coefficients accordingly. The coefficient error has size $O \( delta \)$ and consecutive
    differences $O \( delta^2 \)$, on $O \( delta^(- 1) \)$ sites.
    Dividing this error by $delta$ puts it under Lemma 35; the resulting $L^q$ error is $O \( delta \)$,
    uniformly in the line coordinate.
  Expand a joint moment as an integral over its time coordinates.
    For distinct fixed times, Proposition 34 applies to the transverse Riemann sums,
    locally uniformly on their compact supports and including the rounding of faces.
    Their limit is Wick’s formula for transverse derivatives of $K_kappa$.
    Integration by parts against the compact primitives gives the undifferentiated test densities and the kernel
    (7.1). The line moment bounds dominate the integrand uniformly.
    Equal-time walls have Lebesgue measure zero, so dominated convergence completes the time integrations.
    The resulting products of logarithmic kernels are integrable:
    in each Wick pairing the two-point variables are disjoint from those of every other pair,
    and the logarithm is locally integrable in two dimensions. Gaussian moments determine the law.
    Axial symmetry gives the same result for horizontally line-neutral tests.
  For an arbitrary smooth neutral $phi.alt$, let
  $ q \( x \) = integral phi.alt \( x \, y \) thin d y \, wide p_R \( y \) = R^(- 1) p \( y \/ R \) \, wide
    phi.alt_R \( x \, y \) = phi.alt \( x \, y \) - q \( x \) p_R \( y \) \, $
  where $p$ is a fixed smooth compact probability density. Then $phi.alt_R$ is vertically line-neutral,
    while $q p_R$ is horizontally line-neutral. For fixed $R$, the already proved result gives
  $ lim_(delta arrow.b 0) bb(E) \| chevron.l h_delta \, q p_R chevron.r \|^2 =
    integral.double K_kappa \( z \, z' \) q \( x \) p_R \( y \) q \( x' \) p_R \( y' \) thin d z thin d z' . $
  This tends to zero as $R arrow.r oo$. To see this, set $y = R t$, $y' = R t'$.
    The additive $- 2 kappa log R$ contributes zero because $integral q = 0$.
    The remaining logarithm is $log sqrt(\( \( x - x' \) \/ R \)^2 + \( t - t' \)^2)$,
    which converges almost everywhere to $log \| t - t' \|$, independently of $x \, x'$.
    On the fixed supports it is bounded in absolute value by $C + log_(+) \( 1 \/ \| t - t' \| \)$.
    Dominated convergence and neutrality of $q$ prove the assertion.
    The identical approximation holds for $cal(H)_kappa$. Thus first taking the mesh limit at fixed $R$,
    and only then taking $R arrow.r oo$, proves joint convergence in law.
  For any fixed compact support, Corollary 36 bounds all higher moments of each fixed smooth pairing.
    Uniform integrability therefore upgrades convergence in law to all joint moments.
    Finally, small changes in a smooth test on a fixed support give small $L^q$ changes by the same corollary,
    after dividing by the sup norm of the change. A finite covering of a compact family proves the asserted
    uniformity. ◻
]

Smooth neutral tests now have the claimed Gaussian limit and all its joint moments.
  To recover point increments, we compare each endpoint with a smooth average at successively smaller scales.
  The next estimate controls the correlation contributed by the smallest scale in such a product.

=== 7.3 Removing smoothings at separated endpoints <removing-smoothings-at-separated-endpoints>

Let $𝜚$ be a smooth probability density supported in a small unit square, and define

$ H_(delta \, r) \( b \) = integral h_delta \( x \) r^(- 2) 𝜚 \( \( x - b \) \/ r \) thin d x . $

Differences $H_(delta \, r) \( b \) - H_(delta \, 2 r) \( b \)$ obey Corollary 36.
  At $r asymp delta$, the residual $h_delta \( b \) - H_(delta \, r) \( b \)$ is deterministically bounded by unit
  height jumps. We will use both kinds of differences as individual endpoint factors.

#thm([Lemma 7.4.])[
  (A separated endpoint factor).  #emph[Fix an integer $k gt.eq 2$, constants $A \, c_0 \, c_1 > 0$,
    a separation $d_0 > 0$, and a bounded region containing all factor centers.
    Choose $r_0 = a_k d_0$, with $a_k > 0$ sufficiently small in terms of these fixed data. Let $n lt.eq k$ and let
$ A_i = chevron.l h_delta \, mu_i chevron.r \, wide 1 lt.eq i lt.eq n \, $

 where each $mu_i$ is a finite signed measure of mass zero, total variation at most $A$,
   and support in a square of side $A r_i$ about $b_i$. Assume $parallel A_i parallel_(L^(2 k)) lt.eq A$.
   These hypotheses include the neutral density blocks of Corollary 36 and the terminal residuals just defined.]
  #emph[Suppose one selected factor has scale $c_0 delta lt.eq r lt.eq r_0$,
    all other scales lie in $\[ r \, r_0 \]$, and all other centers are at distance at least $c_1
    d_0$ from its center. Then, for some $tau > 0$,
#[#set math.equation(numbering: n => "(7.8)")
 $ lr(|bb(E) product_(i = 1)^n A_i|) lt.eq C \( r \/ d_0 \)^tau . $ <eq:prob-separated-block>]

 The constants are uniform in the centers, the measures, the mesh and the scales subject to these bounds.
   The other centers need not be mutually separated.]
] <lem:separated-block>

#proof[
  If empty time slabs separate the selected factor from all the others,
    the intervening rows damp its short height paths. General endpoint geometry need not have such a slab in
    either axial ordering. We will create one by translating the groups lying to the left and right of the
    selected factor’s horizontal cluster. Those groups remain separated from the cluster by horizontal gaps;
    bounded analytic continuation across these gaps then returns them, one at a time, to their original positions.
  #strong[The estimate with empty time slabs.] First suppose that the selected support has an empty axial slab on
    each side, of width at least $c_2 d_0$, separating it from all other factors.
    Insert time cuts in these two slabs. The vectors defined by the exterior factors have bounded Hilbert norms.
    Here is the connection with ordinary moments. Read all heights on one side of a cut relative to a common face,
    along a common seam and spatial paths contained on that side.
    Spatial steps use equal-time diagonal spins; each time-seam step uses a time spin,
    with repeated occurrences allowed when several paths share the step.
    In a finite homogeneous system, reflection across the cut transposes the entire product and complex-conjugates
    its scalar coefficients. The crossing identity reverses the time-step spins and preserves the spatial-step
    spins, exactly as for the reflected height differences. The squared norm is therefore the ordinary expectation
    of the exterior product times its conjugate reflected product.
    This finite identity passes to the plane by Proposition 17.
    Hölder’s inequality and the ordinary moments of the individual factors bound that expectation.
    The factors on a side may overlap; Hölder’s inequality requires no separation among them.
  Inside the slab, use neutrality to express the selected factor as an average of differences from a fixed
    reference face in its support. Each difference has a path of $O \( r \/ delta \)$ steps,
    with a bounded number of straight segments. Choose the direction of the difference so that time runs forward;
    spatial steps may have either sign. There remain $m gt.eq c_3 d_0 \/ delta$ unmarked time rows on both sides.
    Pair consecutive steps along each straight segment. The paired current identity and Lemma 19 give the
    sandwiched norm bounds
  #[#set math.equation(numbering: n => "(7.9)")
   $ parallel P \( 1 \)^m \( upright("two consecutive step sum") \) P \( 1 \)^m parallel & lt.eq C m^(- 1) \,\
parallel P \( 1 \)^m \( upright("one step") \) P \( 1 \)^m parallel & lt.eq C m^(- theta_0) $ <eq:prob-damped-costs>]
  for some $0 < theta_0 lt.eq 1$. To verify the passage from band bounds to these inequalities,
    split both sides into the bands $H_0 lt.eq m^(- 1)$ and $2^(j - 1) \/ m < H_0 lt.eq 2^j \/ m$.
    A block between two such bands has current bound a power of the larger cutoff,
    while the time rows contribute $exp \( - c 2^j - c 2^(j') \)$.
    The resulting double geometric-exponential sum is $O \( m^(- 1) \)$ for a paired current.
    For a single current use the equal-sign $O \( u \)$ and opposite-sign $O \( u^theta \)$ estimates,
    with $theta_0 = min \( 1 \, theta \)$. Bands above a fixed cutoff are exponentially damped and the
    uncompressed row norms are bounded. Unit shifts commute with the damping and do not enlarge these norms.
  There are $O \( r \/ delta \)$ pairs and only a bounded number of unpaired steps.
    The bounded total variation of the selected factor and the exterior norm bounds give
  $ lr(|bb(E) product_i A_i|) lt.eq C (r / d_0 + (delta / d_0)^(theta_0)) lt.eq C \( r \/ d_0 \)^(tau_0) \, wide
    tau_0 = min \( 1 \, theta_0 \) . $
  This includes a terminal residual: its comparison paths have bounded length and the same damping margins.
    Rounding the cuts changes their widths by only a bounded number of sites.
  #strong[Creating a slab by two translations.] Cluster the centers by their first-coordinate projections:
    consecutive projections belong to the same cluster if their gap is at most $a d_0 \/ k$,
    for a sufficiently small fixed $a$. Every cluster has width at most $a d_0$.
    Choose $a_k$ much smaller than $a \/ k$, so that the supports preserve a gap of size $c_k
    d_0$ at each cluster boundary. In the cluster containing the selected center,
    every other center has second-coordinate distance at least $c_k d_0$ from it.
    Indeed its first-coordinate distance is at most $a d_0$, whereas its Euclidean distance has the lower bound in
    the statement.
  Translate the clusters strictly to the left as one group vertically,
    and do the same independently for the clusters strictly to the right.
    For each group there is an interval of translation amounts,
    of length at least $c_k d_0$ and at distance at most $C_k d_0$ from zero,
    such that every translation in the interval leaves a vertical gap of size $c_k
    d_0$ around the selected support. To construct one, exclude the intervals of translations putting any of its
    at most $k$ centers within a fixed small multiple of $d_0$ of the selected height.
    Their total length is bounded by $C_k d_0$; choose a larger bounded translation range and take a complementary
    interval of the asserted size. The choices for the two groups are independent.
    Restrict to translations by even numbers of lattice sites.
    Lattice stationarity preserves each individual $L^(2 k)$ bound under these translations,
    so Hölder’s inequality still controls the exterior products.
    Throughout the resulting rectangle of choices the selected factor has a free slab in the northward time
    ordering, so the preceding estimate applies.
  #strong[Returning the two groups.] The first-coordinate gaps have remained open throughout these vertical
    translations. They supply the damping needed to transfer the estimate back to zero translation. Write
  $ K = "Arg" \( S^2 \) \, wide - pi lt.eq K lt.eq pi . $
  This is bounded spectral functional calculus. The low-band estimate $S = plus.minus 1 +
    O \( H_0 \)$ gives $\| K \| lt.eq C H_0$ for small $H_0$;
    on the complement the same inequality follows by increasing $C$, since $\| K \| lt.eq pi$. Thus
  #[#set math.equation(numbering: n => "(7.10)")
   $ \| K \| lt.eq C H_0 \, wide parallel P \( 1 \)^N e^(i z K) parallel lt.eq 1 quad
     upright("if") quad \| "Im" z \| lt.eq N \/ C . $ <eq:prob-shift-strip>]
  For integer $m$, $e^(i m K) = S^(2 m)$. Across a first-coordinate gap containing $N gt.eq
    c_k d_0 \/ delta$ unmarked rows, translating an entire exterior group by $2
    m$ sites therefore inserts $P \( 1 \)^N S^(plus.minus 2 m)$ between fixed exterior vectors.
    This identity follows by conjugating every site and seam insertion on that side by the site shift,
    which fixes the vacuum. Reflection and the ordinary moment estimates bound both exterior vectors uniformly.
    Equation (7.10) extends the pairing to a bounded holomorphic function of $z \/ \( d_0 \/ delta \)$ on a strip
    of fixed positive width. If one of the exterior groups is absent there is no restoration step for that group.
  For completeness, the elementary analytic estimate used here is the following.
    A holomorphic function bounded by one on a fixed-width strip, whose absolute value is at most $a lt.eq
    1$ on a fixed-length real interval within a fixed bounded distance of zero,
    has absolute value at zero at most $C a^theta.alt$, where $theta.alt >
    0$ depends only on those geometric constants. Take a half-disc based on a shorter part of the interval.
    The two-constants theorem bounds the function by $a^omega$ on an interior disc,
    since the harmonic measure of the base there is bounded below by $omega > 0$.
    Cover the remaining path to zero by finitely many overlapping discs inside the strip.
    The three-circles inequality transfers a positive power bound at each step.
    The number and radii of these discs depend only on the fixed strip, interval, and distance bounds.
  Our free-slab estimate initially holds only at the allowed integer values of $m$.
    Cauchy’s estimate on a slightly smaller strip bounds the derivative in the normalized real coordinate.
    The gap between successive allowed values is $O \( delta \/ d_0 \)$,
    so throughout a shorter real interval the bound becomes
  $ C \( r \/ d_0 \)^(tau_0) + C delta \/ d_0 lt.eq C' \( r \/ d_0 \)^(tau_0) \, $
  using $r gt.eq c_0 delta$ and $tau_0 lt.eq 1$. First restore the left group while keeping the right translation
    at any one of its allowed values. The analytic estimate gives the same bound with a possibly smaller positive
    exponent, uniformly over those right translations. Then restore the right group.
    The two reductions of the exponent still leave a fixed $tau > 0$. This proves (7.8) in the original geometry. ◻
]

#thm([Proposition 7.5.])[
  #emph[For every $k gt.eq 1$, all $k$-point height-increment moments converge to the Wick increment moments of
    $cal(H)_kappa$, uniformly on compact sets of tuples whose endpoint sets belonging to different increments are
    disjoint.]
] <prop:offdiagonal>

#proof[
  The first moment is zero by arrow-reversal symmetry. For $k gt.eq 2$,
    fix such a compact set of tuples and let $d_0 > 0$ be a lower bound on all cross-pair endpoint distances.
    Endpoints within a single pair may coincide. Choose $r_0 = a_k d_0$ as in Lemma 38, and put $r_j =
    2^(- j) r_0$. For each endpoint, telescope its bump averages down to the last scale $r_J asymp delta$,
    and include the residual from that average to the specified face value.
    This is a finite exact identity, including for points on grid lines under the fixed floor convention.
  Expand the product of increments. A factor is either a coarse increment at scale $r_0$,
    or one of the two endpoint blocks at a dyadic scale, including the terminal residual.
    All individual blocks have uniformly bounded moments. The coarse increments also do:
    join their endpoints by a bounded-length chain of overlapping scale-$r_0$ bumps and telescope,
    applying Corollary 36 to each difference. The number of links is bounded by the fixed compact size and
    separation data.
  In a summand containing an endpoint block, select one of minimum scale $r$.
    Decompose every other coarse increment by a bump chain avoiding a disc of radius $d_0 \/
    3$ about the selected endpoint. Such a chain exists with bounded length because both endpoints of that other
    pair are at least $d_0$ away; a polygonal detour around the disc has length bounded in terms of the same fixed
    data. After subdividing into steps of size $O \( r_0 \)$,
    every factor other than the selected one has center at distance at least $c d_0$ from it.
    There are still at most $k$ factors in each resulting product;
    the number of resulting products is bounded independently of the mesh and dyadic levels.
    Apply Lemma 38 to each of them.
  At fixed deepest dyadic index $j$, there are at most $C_k \( 1 + j \)^(k - 1)$ choices of the other levels and
    endpoint labels. Consequently the error from keeping only scales coarser than $r_(J_0)$ is bounded by
  #[#set math.equation(numbering: n => "(7.11)")
   $ C sum_(j gt.eq J_0) \( 1 + j \)^(k - 1) 2^(- tau j) \, $ <eq:prob-desmoothing-tail>]
  uniformly once the mesh is fine enough to reach that level. This tends to zero as $J_0 arrow.r oo$.
    Notice that the terminal residual obeys the same bound; dropping it before applying the estimate would not
    justify point evaluation.
  For fixed $J_0$, Proposition 37 gives the joint moments of the smoothed increments, uniformly in their centers.
    The corresponding Gaussian Wick expressions converge uniformly as the smoothing radius tends to zero:
    each paired kernel involves endpoints from two different increments,
    so its arguments stay a positive distance apart. Combine this with (7.11).
    If the two endpoints within a pair coincide, that increment and its smoothed versions are identically zero;
    no additional exclusion is needed. ◻
]

=== 7.4 Ordinary finite-energy signed measures <ordinary-finite-energy-signed-measures>

#thm([Lemma 7.6.])[
  #emph[Let $mu$ be a compactly supported finite signed measure for which $integral.double G \( x \, y \) thin
    mu \( d x \) mu \( d y \)$ is an ordinary finite signed-measure integral. Then $mu$ has no atoms, and
#[#set math.equation(numbering: n => "(7.12)")
 $ integral.double log_(+) frac(1, \| x - y \|) thin \| mu \| \( d x \) \| mu \| \( d y \) < oo .
   $ <eq:prob-absolute-energy>]

 If $mu \, nu$ both satisfy this assumption, the corresponding mixed absolute logarithmic integral is finite as well.]
] <lem:log-integrability>

#proof[
  The total variation of $mu ⊗ mu$ is $\| mu \| ⊗ \| mu \|$.
    Ordinary integrability is integrability with respect to this variation.
    On a fixed compact support, the negative part of $- log \| x - y \|$ is bounded, which proves (7.12).
    An atom would give positive product mass to the logarithmic diagonal singularity, so there are no atoms.
  For the mixed assertion take dyadic squares of side $2^(- j)$ in a box containing both supports.
    Up to an additive bounded kernel, $log_(+) \( 1 \/ \| x - y \| \)$ is bounded above by a constant times
    $sum_(j gt.eq 0) upright(bold(1))_({ \| x - y \| lt.eq C 2^(- j) })$. Write $a = \| mu \|$, $b = \| nu \|$.
    At a fixed level the mixed mass of these nearby pairs is at most $sum_Q sum_(Q' tilde.op Q) a \( Q \)
    b \( Q' \)$, where each square has a bounded number of neighbors. Cauchy–Schwarz bounds this by
  $ C (sum_Q a \( Q \)^2)^(1 \/ 2) (sum_Q b \( Q \)^2)^(1 \/ 2) . $
  The sums of $sum_Q a \( Q \)^2$ and $sum_Q b \( Q \)^2$ over all levels are finite by their self-integrability:
    pairs in one square are within $sqrt(2) thin 2^(- j)$, and summing their indicators is bounded by
    $C \( 1 + log_(+) \( 1 \/ \| x - y \| \) \)$. A second Cauchy–Schwarz inequality over $j$ proves the claim. ◻
]

#thm([Proposition 7.7.])[
  #emph[For every finite family of compactly supported, neutral,
    finite signed measures of the ordinary finite-energy class in Theorem 1,
    the associated height pairings converge jointly in law to the centered Gaussian vector with covariance
    obtained by integrating $K_kappa$ against the pairs of measures.]
] <prop:finite-energy>

#proof[
  Let $V \( a \) = bb(E) \( h \( a \) - h \( 0 \) \)^2$ for lattice-face displacement $a in bb(Z)^2$,
    and put $V \( 0 \) = 0$. Proposition 22 and axial symmetry imply
  $ V \( a \) = 4 kappa log \( 1 or \| a \| \) + O \( 1 \) \, $
  with a uniform bounded error over all lattice displacements.
    For distinct continuum points $x \, y$ in a fixed compact set, write
  $ V_delta \( x \, y \) = V #scale(x: 120%, y: 120%)[\(] floor.l x \/ delta floor.r -
    floor.l y \/ delta floor.r #scale(x: 120%, y: 120%)[\)] . $
  For $0 < delta lt.eq 1$ this gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ lr(|V_delta \( x \, y \) - 4 kappa log delta^(- 1)|) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| log \| x -
     y \| \| #scale(x: 120%, y: 120%)[\)] . $ <eq:prob-rounded-log-bound>]
  Indeed when $\| x - y \|$ exceeds a fixed multiple of $delta$, the lattice separation is comparable to $\| x -
    y \| \/ delta$. In the other case its size is bounded, and $log delta^(- 1) lt.eq C + \| log \| x - y \| \|$.
    This latter case includes distinct points rounded to the same face.
  For any four points, stationarity of increments and zero mean give
  #[#set math.equation(numbering: n => "(7.14)")
   $ & bb(E) \[ \( h_delta \( x' \) - h_delta \( x \) \) \( h_delta \( y' \) - h_delta \( y \) \) \]\
 & wide = 1 / 2 #scale(x: 120%, y: 120%)[\(] V_delta \( x' \, y \) + V_delta \( x \, y' \) -
   V_delta \( x' \, y' \) - V_delta \( x \, y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:prob-four-variograms>]
  The four copies of $4 kappa log delta^(- 1)$ cancel exactly.
    Equation (7.13) therefore supplies a majorant by a constant and four continuum logarithmic singularities.
  For a neutral $mu eq.not 0$, its Jordan parts have the same mass $M > 0$.
    The measure $M^(- 1) mu^(+) \( d x' \) mu^(-) \( d x \)$ represents its pairing as an integral of
    $h_delta \( x' \) - h_delta \( x \)$. Use this representation for two pairings.
    By Lemma 40, the four-logarithm majorant is integrable against the resulting product measure.
    Geometric coincidences of endpoints belonging to different pairings have measure zero because the Jordan parts
    are nonatomic. Distinct endpoints rounded to a common lattice face remain covered by the same majorant.
    Proposition 39 for two increments and dominated convergence thus give, for every such $mu \, nu$,
  #[#set math.equation(numbering: n => "(7.15)")
   $ lim_(delta arrow.b 0) bb(E) \[ chevron.l h_delta \, mu chevron.r chevron.l h_delta \, nu chevron.r \] =
     integral.double K_kappa \( x \, y \) thin mu \( d x \) nu \( d y \) . $ <eq:prob-energy-covariance>]
  The zero measure causes no exception.
  It remains to identify laws beyond second moments. Let $mu_epsilon.alt = mu * 𝜚_epsilon.alt$,
    where the mollifier is smooth, nonnegative and compactly supported. These measures are smooth and neutral.
    Mollification converges in logarithmic energy:
  #[#set math.equation(numbering: n => "(7.16)")
   $ integral.double K_kappa \( x \, y \) \( mu - mu_epsilon.alt \) \( d x \) \( mu - mu_epsilon.alt \) \( d y \)
     arrow.r 0 . $ <eq:prob-energy-mollification>]
  To check this for the present ordinary integral, the logarithm convolved in one or both variables converges
    pointwise off the diagonal. On the fixed enlarged compact support its absolute value is bounded by
    $C \( 1 + \| log \| x - y \| \| \)$, uniformly in small $epsilon.alt$.
    For $\| x - y \| gt.eq C epsilon.alt$ this follows by comparison of distances; for $\| x -
    y \| < C epsilon.alt$, scaling the bounded compact mollifier gives $C + \| log epsilon.alt \| lt.eq
    C' \( 1 + \| log \| x - y \| \| \)$. Lemma 40 permits dominated convergence in each of the four energy terms,
    proving (7.16).
  Apply (7.15) to $mu - mu_epsilon.alt$. It gives
  $ lim_(epsilon.alt arrow.b 0) limsup_(delta arrow.b 0) parallel chevron.l h_delta \, mu -
    mu_epsilon.alt chevron.r parallel_(L^2) = 0 . $
  At fixed $epsilon.alt$, Proposition 37 identifies the Gaussian limit.
    The same energy estimate approximates the Gaussian pairing.
    Applying this argument to a finite family, or to each of its linear combinations,
    proves the asserted joint law and cross covariance. ◻
]

The scalar pairings and separated increments are now identified.
  We next strengthen convergence of individual pairings to convergence in norms.
  The ordinary restriction norms use fields localized on a fixed box.
  The source’s outward seminorm instead tests the global field over an increasing sequence of boxes;
  it requires a separate tail estimate.

=== 7.5 Negative regularity and the outward test convention <negative-regularity-and-the-outward-test-convention>

Fix a smooth compactly supported probability density $rho$, and write $X_delta = h_delta - chevron.l h_delta \,
  rho chevron.r$. For a compactly supported smooth cutoff $chi$, put $X_delta^chi = chi X_delta$.

#thm([Lemma 7.8.])[
  (Pinned averages).  #emph[Let $0 < ell lt.eq 1$, and let $psi_(b \, ell)$ be supported in a square of side $A
    ell$ about $b$, with $\| psi_(b \, ell) \| lt.eq A ell^(- 2)$.
    For centers $b$ in a fixed compact set and every finite $q$,
#[#set math.equation(numbering: n => "(7.17)")
 $ parallel chevron.l X_delta^chi \, psi_(b \, ell) chevron.r parallel_(L^q) lt.eq
   C_(A \, q \, chi \, rho) \( 1 + \| log ell \| \) . $ <eq:prob-pinned-averages>]

 The estimate is uniform in $delta > 0$.]
] <lem:pinned-averages>

#proof[
  Let $m = integral chi psi_(b \, ell)$, so $\| m \| lt.eq C$.
    Subtract $m$ times a smooth mass-one bump of scale $ell$ at $b$. The difference obeys Corollary 36.
    Next telescope that bump through the scales $ell \, 2 ell \, dots.h \, 1$,
    and finally compare the scale-one bump with $rho$. Each difference is neutral, has bounded total variation,
    and is supported and bounded at its stated scale. There are $O \( 1 + \| log ell \| \)$ differences.
    The same argument works below the mesh scale because the final clause of Corollary 36 has no lower bound on
    $ell \/ delta$. ◻
]

#thm([Proposition 7.9.])[
  #emph[For every bounded open $U subset bb(R)^2$ and every $- 1 < alpha < 0$, the pinned fields converge in law,
    with tightness, in the ordinary restriction spaces
$ cal(C)_(upright("res"))^alpha \( U \) := B_(oo \, oo)^alpha \( U \) \, wide B_(p \, q)^alpha \( U \) \, wide
  W^(alpha \, p) \( U \) \, quad 1 lt.eq p < oo \, quad 1 lt.eq q lt.eq oo \, $

 to the corresponding pinning of $cal(H)_kappa$. Here the Hölder laws are supported on the separable closure of
   smooth functions in the displayed norm. Convergence also holds in the literal outward-scaling completion
   defined by (16) of #cite(label("DKLM2026")) Definition 2.6(iii). No boundary regularity of $U$ is assumed.
   An intrinsic dual interpretation of the negative Sobolev norms is treated at the end of this section.]
] <prop:negative-regularity>

#proof[
  Choose a compactly supported $chi$ equal to one on a box containing $overline(U)$ and $"supp" rho$.
    Use compactly supported wavelets of sufficient finite regularity,
    including their coarse-scale scaling functions #cite(label("Daubechies1988")) Section 4.C.
    We use the full-space Besov coefficient characterization in #cite(label("HairerLabbe2017")) Proposition 2.3.
    Normalize the scale-$2^(- j)$ test functions as densities of size $O \( 2^(2 j) \)$,
    and denote their averages of $X_delta^chi$ by $a_(j \, k)$. There are $O \( 2^(2 j) \)$ relevant indices $k$.
    For $alpha < beta < 0$, choose a moment order $b$ with $2 + b beta < 0$. Lemma 42 gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ bb(E) sum_(j gt.eq 0) sum_k \| 2^(j beta) a_(j \, k) \|^b lt.eq
     C_b sum_(j gt.eq 0) 2^(\( 2 + b beta \) j) \( 1 + j \)^b < oo . $ <eq:prob-wavelet-sum>]
  The coarse block has the same bound. This bounds the stronger $B_(oo \, oo)^beta$ norm in probability.
    On a fixed compact support its bounded sets have uniformly vanishing tails in $B_(oo \, oo)^alpha$, since
  $ sup_(j > J \, k) 2^(j alpha) \| a_(j \, k) \| lt.eq 2^(\( alpha - beta \) J) sup_(j \, k) 2^(j beta) \|
    a_(j \, k) \| . $
  For finitely many levels only finitely many coefficients remain.
    This proves compactness by finite-dimensional truncation,
    and also puts the fields and limits in the separable smooth closure.
  The same gain proves the other asserted norm compactness.
    Indeed a compactly supported distribution bounded in $B_(oo \, oo)^beta$ has scale blocks satisfying $parallel
    Delta_j X parallel_(L^p) lt.eq C 2^(- j beta)$ for every finite $p$. Thus
  $ sum_(j > J) 2^(j alpha) parallel Delta_j X parallel_(L^p) lt.eq C sum_(j > J) 2^(j \( alpha - beta \)) arrow.r 0 . $
  This controls every $ell^q$ Besov block norm, including $q = oo$.
    It also controls the negative Bessel-potential norm: on a scale block,
    $\( 1 - Delta \)^(alpha \/ 2)$ has an $L^1$-bounded convolution kernel after extracting $2^(j alpha)$,
    so summing these bounds works for all $p gt.eq 1$. The same summable block bound controls the usual full-space
    negative Slobodeckij realization. Passing to its restriction uses the defining quotient norm.
    Restricting a global extension to $U$ is continuous by definition;
    no extension operator from $U$ is being invoked. Proposition 37 identifies every subsequential limit,
    and hence proves the full mesh convergence.
  For clarity, retain also the source’s printed outward convention.
    Let $Q_0 = \( - 1 \, 1 \)^2$, and let $cal(T)_1 \( Q_0 \)$ consist of compactly supported neutral densities
    whose zero extension is one-Lipschitz. For smooth functions its seminorm is
  #[#set math.equation(numbering: n => "(7.19)")
   $ parallel f parallel_(upright("out") \, alpha \, U) = sup_(0 < epsilon lt.eq 1 \, med phi in cal(T)_1 \( Q_0 \)\
"supp" phi subset U \/ epsilon) epsilon^(- alpha) lr(|integral f \( x \/ epsilon \) phi \( x \) thin d x|) .
  $ <eq:prob-outward-norm>]
  The absolute value is immaterial for the symmetric test family. Constants vanish in this seminorm.
    Its completion is understood modulo its kernel, as in the source.
  Write $epsilon = 2^(- j) a$, $1 \/ 2 lt.eq a lt.eq 1$. The exact mesh identity, including the floor convention, is
  $ h_delta \( x \/ epsilon \) = h_(2^(- j) delta) \( x \/ a \) . $
  After the change of variables $x = a y$, the test becomes $a^2 phi \( a y \)$, supported in $2 Q_0$, neutral,
    with a uniformly bounded Lipschitz norm. The condition involving $U$ only reduces this family.
    For any fixed $- 1 < gamma < 0$, local $cal(C)^gamma$ control bounds all these pairings.
    One can see this directly from a wavelet expansion: cancellation of fine wavelets against a Lipschitz test
    gains $2^(- j)$, and the resulting series converges because $1 + gamma > 0$.
    The preceding moment argument, with a still stronger negative exponent and arbitrarily high moment order,
    therefore gives random variables $Z_(j \, delta)$ such that
  $ sup_delta parallel Z_(j \, delta) parallel_(L^b) lt.eq C_b \, wide
    sup_(2^(- j - 1) lt.eq epsilon lt.eq 2^(- j)) \( upright("quantity in ") upright("(7.19)") \) lt.eq
    C 2^(j alpha) Z_(j \, delta) . $
  A local pin may be inserted in the rescaled field since every test is neutral.
    In particular the supremum over $j gt.eq J$ tends to zero in $L^b$, uniformly in $delta$,
    by the summability of $sum_(j gt.eq J) 2^(j alpha)$. On finitely many bands,
    the tested original coordinates lie in one bounded box. Their test norms are bounded by constants depending on
    the number of bands, so the stronger local compactness already proved applies.
  These estimates also give the required smooth completion,
    rather than only a bound on a larger space of functionals.
    Take a smooth compact cutoff $chi_0$ equal to one on a sufficiently large fixed box and a compact smooth
    mollifier $theta_eta$, and use
  $ f_(delta \, J \, eta) \( x \) = chi_0 \( 2^(- J) x \) \( X_delta * theta_eta \) \( x \) . $
  Convolution preserves the local negative Hölder bound, uniformly for $0 < eta lt.eq 1$,
    since its rescaled radius on band $j$ is at most $2^(- j)$.
    For the outward bands $j gt.eq J$, the cutoff becomes a bump of scale at most $2^(J - j)$ in the rescaled
    coordinates. The local $cal(C)^gamma$ test bound gives its contribution the additional factor
    $2^(\( J - j \) \( 2 + gamma \)) lt.eq 1$; comparison of the fixed pin with the rescaled pin costs at most
    $C \( 1 + j \)$ by the same dyadic telescoping as in Lemma 42.
    Thus the cutoff approximations have tails bounded by a constant times $sum_(j gt.eq J) \( 1 + j \)
    2^(j alpha)$, uniformly in probability and in the mollification parameter.
    On finitely many bands send $eta arrow.b 0$; then send $J arrow.r oo$.
    These smooth approximations and the vanishing tail prove membership and tightness in the completion of (7.19).
    Its limits agree with the smooth-test limit on each finite band. This proves the literal outward assertion too. ◻
]

=== 7.6 Intrinsic negative Sobolev norms on an arbitrary open set <intrinsic-negative-sobolev-norms-on-an-arbitrary-open-set>

The restriction-space proof above already requires no regularity of $partial U$.
  We give a further argument to cover the convention in which a negative Sobolev norm is the norm dual to an
  intrinsic positive Slobodeckij norm on $U$. The distinction matters for irregular open sets,
  where an extension theorem is unavailable.

For $0 < s < 1$, $1 < q < oo$, write

$ parallel phi.alt parallel_(W^(s \, q) \( U \))^q = parallel phi.alt parallel_(L^q \( U \))^q +
  integral.double_(U times U) frac(\| phi.alt \( x \) - phi.alt \( y \) \|^q, \| x - y \|^(2 + s q)) thin d x thin
  d y . $

For $q = oo$, use the sup norm and the essential supremum of $\| phi.alt \( x \) - phi.alt \( y \) \| \/ \| x -
  y \|^s$. The cells in the following argument are intersections of ordinary dyadic squares with $U$;
  they may have arbitrarily small relative area and arbitrarily irregular shapes.

#thm([Lemma 7.10.])[
  (Averages on small-area cells).  #emph[Let $Q$ be a square of side $0 < ell lt.eq 1$ in a fixed bounded box,
    and let $A subset Q$ be measurable with $\| A \| > 0$. Put $t = \| A \| \/ ell^2$. Then for every finite $b$,
#[#set math.equation(numbering: n => "(7.20)")
 $ ∥frac(1, \| A \|) integral_A X_delta \( x \) thin d x∥_(L^b) lt.eq
   C_b \( 1 + \| log ell \| + \| log t \| \) $ <eq:prob-cell-average>]

 uniformly in $delta$ and in the shape of $A$.]
] <lem:cell-averages>

#proof[
  We first refine the comparison of line weights. Suppose nonnegative weights $a_l$,
    supported on $O \( R \)$ consecutive sites, satisfy
  $ sum_l a_l = m > 0 \, wide a_l lt.eq M \/ R \, wide R gt.eq 1 . $
  Let $b_l$ be a mass-one profile bounded by $C \/ R$, and assume that the union of the supports of $a$ and $b$
    lies in one interval of length $C R$. We claim
  #[#set math.equation(numbering: n => "(7.21)")
   $ ∥sum_l \( a_l - m b_l \) h_l∥_(L^b) lt.eq C_b m #scale(x: 120%, y: 120%)[\(] 1 +
     log_(+) \( M \/ m \) #scale(x: 120%, y: 120%)[\)] . $ <eq:prob-line-entropy>]
  Increasing a fixed constant in $M$ if needed, assume $M gt.eq m$.
    For dyadic integer $v gt.eq 1$, let $A_v a$ replace the weights in each consecutive block of $v$ sites by
    their block average. The difference $d = A_v a - A_(2 v) a$ is neutral in every $2 v$-block.
    For its normalized primitive $g_l = m^(- 1) sum_(i lt.eq l) d_i$, this gives
  $ sum_l \| g_l \| lt.eq C v \, wide sum_l \| g_(l + 1) - g_l \| lt.eq C \, wide sum_l \| g_(l + 1) -
    g_l \|^2 lt.eq C \/ v . $
  The first bound sums a block length times its variation mass.
    For the last, use $parallel d parallel_oo lt.eq C m \/ v$ and $parallel d parallel_1 lt.eq 2 m$.
    Lemma 35 and summation by parts give cost at most $C_b m$ for each flattening step.
    This use of the lemma explains why its statement retained the three summability conditions,
    without a support-diameter hypothesis.
  If $min \( R \, R m \/ M \) > 1$, choose a dyadic $v_0$ comparable from below to that number;
    otherwise put $v_0 = 1$. When $v_0 > 1$, one can start directly with $a - A_(v_0) a$.
    Its primitive has the same first two bounds, and
  $ m^(- 2) parallel a - A_(v_0) a parallel_2^2 lt.eq C m^(- 2) parallel a parallel_2^2 lt.eq
    C M \/ \( R m \) lt.eq C \/ v_0 . $
  When $v_0 = 1$, this initial difference vanishes. Continue flattening until $v asymp R$,
    where comparison with $m b$ has bounded cost by the original width-$R$ case of the lemma.
    The number of steps is $O \( 1 + log_(+) \( M \/ m \) \)$, proving (7.21).
  Now rescale the square $Q$ to a unit square. For any probability density $f lt.eq M$ on it, set $m \( x \) =
    integral f \( x \, y \) thin d y$. Apply (7.21) to its mesh masses on each vertical line,
    comparing them with $m \( x \)$ times one bounded profile. Minkowski’s inequality bounds the total cost by
  $ C_b integral m \( x \) #scale(x: 120%, y: 120%)[\(] 1 +
    log \( M \/ m \( x \) \) #scale(x: 120%, y: 120%)[\)] thin d x lt.eq C_b \( 1 + log M \) . $
  The last inequality is Jensen’s inequality for the concave function $u mapsto u log \( M \/ u \)$,
    with $integral m = 1$ on an interval of length one. Compare the remaining horizontal marginal with a bounded
    profile by the same line estimate. We have therefore compared the original density with a fixed scale-$ell$
    product smoothing, at cost $C_b \( 1 + log M \)$. Telescoping that smoothing to scale one and then to the pin
    costs $C_b \( 1 + \| log ell \| \)$, as in Lemma 42. If $ell < delta$,
    all comparisons inside a comparable square use only a bounded number of faces and have a deterministic bound;
    the remaining pin comparison is unchanged. Taking $f = ell^2 \| A \|^(- 1)
    upright(bold(1))_A$ in rescaled coordinates gives $M = t^(- 1)$ and proves (7.20). ◻
]

#thm([Proposition 7.11.])[
  (Intrinsic dual convergence).  #emph[Let $U subset bb(R)^2$ be bounded and open, let $0 < s < 1$,
    and let $1 lt.eq p < oo$, with conjugate exponent $q = p'$.
    The pinned fields converge in law, with norm tightness, in $\( W^(s \, q) \( U \) \)^(*)$ to the canonically
    pinned Gaussian field with kernel $K_kappa$. The laws are supported on a separable closed subspace of this
    dual. No extension property or regularity of $partial U$ is required.]
] <prop:intrinsic-dual>

#proof[
  Take a fixed square containing $U$, subdivided dyadically at side lengths $ell_j asymp 2^(- j)$.
    For a square $Q$ at level $j$, put
  $ U_Q = Q ∩ U \, wide t_Q = \| U_Q \| \/ \| Q \| \, wide X_(delta \, Q) = \| U_Q \|^(- 1) integral_(U_Q) X_delta . $
  Ignore cells of zero area. Let
  $ Z_(delta \, j) = sum_(Q upright(" at level ") j) X_(delta \, Q) upright(bold(1))_(U_Q) \, wide
    F_(delta \, j) \( phi.alt \) = integral_U Z_(delta \, j) phi.alt \, $
  and let $P_j phi.alt$ denote cell averaging of $phi.alt$ on the same partition. Consistency of averaging implies
  #[#set math.equation(numbering: n => "(7.22)")
   $ \( F_(delta \, j + 1) - F_(delta \, j) \) \( phi.alt \) =
     integral_U Z_(delta \, j + 1) \( phi.alt - P_j phi.alt \) . $ <eq:prob-cell-difference>]
  Suppose first $p > 1$, so $q < oo$, and choose $0 < zeta < s q$.
    Call a parent $P$ of side $ell = ell_j$ thick when $t_P gt.eq ell^zeta$. Jensen’s inequality gives
  $ integral_(U_P) \| phi.alt - phi.alt_P \|^q & lt.eq \| U_P \|^(- 1) integral.double_(U_P times U_P) \|
    phi.alt \( x \) - phi.alt \( y \) \|^q thin d x thin d y\
 & lt.eq C ell^(s q) t_P^(- 1) integral.double_(U_P times U_P)
   frac(\| phi.alt \( x \) - phi.alt \( y \) \|^q, \| x - y \|^(2 + s q)) thin d x thin d y . $
  Summing over thick parents yields
  #[#set math.equation(numbering: n => "(7.23)")
   $ parallel phi.alt - P_j phi.alt parallel_(L^q \( upright("thick") \)) lt.eq
     C ell^(s - zeta \/ q) \[ phi.alt \]_(W^(s \, q) \( U \)) . $ <eq:prob-thick-cell>]
  On all cells, averaging is an $L^q$ contraction, so the same difference has $L^q$ norm at most $2 parallel
    phi.alt parallel_(L^q)$.
  Lemma 44, with $b = p$, implies
  $ bb(E) parallel Z_(delta \, j + 1) parallel_(L^p \( U \))^p lt.eq C_p \( 1 + j \)^p . $
  For this inequality sum $\| Q \| t_Q \( 1 + j + log \( 1 \/ t_Q \) \)^p$ over children,
    and use $t \( 1 + log \( 1 \/ t \) \)^p lt.eq C_p$ for $0 < t lt.eq 1$.
    A child of a thin parent has $t_Q lt.eq 4 ell^zeta$. The sharper elementary inequality
  $ t \( A + log \( 1 \/ t \) \)^p lt.eq C_p A^p t^(1 \/ 2) \, wide A gt.eq 1 \, $
  therefore gives
  #[#set math.equation(numbering: n => "(7.24)")
   $ bb(E) parallel Z_(delta \, j + 1) upright(bold(1))_(upright("thin")) parallel_(L^p \( U \))^p lt.eq
     C_p \( 1 + j \)^p ell^(zeta \/ 2) . $ <eq:prob-thin-cell>]
  The sum of the areas $\| Q \|$ is bounded by the area of the surrounding square,
    independently of the geometry of $U$. Equations (7.22)–(7.24) and Hölder’s inequality now give
  #[#set math.equation(numbering: n => "(7.25)")
   $ bb(E) parallel F_(delta \, j + 1) - F_(delta \, j) parallel_(\( W^(s \, q) \( U \) \)^(*)) lt.eq
     C \( 1 + j \) (ell_j^(s - zeta \/ q) + ell_j^(zeta \/ \( 2 p \))) . $ <eq:prob-dual-tail-step>]
  Both exponents are positive.
  At $p = 1$, $q = oo$, the intrinsic Hölder seminorm gives directly
  $ parallel phi.alt - P_j phi.alt parallel_oo lt.eq C ell_j^s \[ phi.alt \]_(C^s \( U \)) . $
  There is no need to distinguish thin parents in this case. The first moment version of the cell estimate gives
  #[#set math.equation(numbering: n => "(7.26)")
   $ bb(E) parallel F_(delta \, j + 1) - F_(delta \, j) parallel_(\( W^(s \, oo) \( U \) \)^(*)) lt.eq
     C \( 1 + j \) ell_j^s . $ <eq:prob-dual-endpoint>]
  Thus at every finite $p$ the right-hand side, denoted by $a_j$, is summable over $j$, uniformly in $delta$.
  Let $cal(E)_0$ be the closed linear span in $cal(E) = \( W^(s \, q) \( U \) \)^(*)$ of the countable collection
    of cell indicator pairing functionals. It is a separable Banach space.
    For each fixed mesh, $X_delta$ is a bounded function on the bounded set $U$,
    and its conditional cell averages converge to it in $L^p \( U \)$.
    Since $L^p \( U \)$ maps continuously into $cal(E)$, they also converge in $cal(E)_0$.
    Summing the preceding estimates proves
  #[#set math.equation(numbering: n => "(7.27)")
   $ sup_delta bb(E) parallel X_delta - F_(delta \, J) parallel_(cal(E)) lt.eq sum_(j gt.eq J) a_j arrow.r
     0 . $ <eq:prob-dual-uniform-tail>]
  Every coefficient $X_(delta \, Q)$ is the pairing with the neutral measure
  $ mu_Q = \| U_Q \|^(- 1) upright(bold(1))_(U_Q) thin d x - rho thin d x . $
  This bounded compact density has ordinary finite logarithmic energy, regardless of the shape or area of $U_Q$.
    Proposition 41 therefore gives joint convergence of the coefficients at each finite level.
    Couple their Gaussian limits using the countable family of Gaussian pairings with $mu_Q$,
    and denote the corresponding finite-level elements of $cal(E)_0$ by $F_J$.
    Finite-dimensional convergence and the lower semicontinuity of the norm transfer the bound $bb(E) parallel
    F_(j + 1) - F_j parallel_(cal(E)) lt.eq a_j$. The sum of these norms is almost surely finite and integrable,
    so $F_J$ converges almost surely and in $L^1 \( cal(E)_0 \)$ to an $cal(E)_0$-valued random variable $F$.
    Finite-level convergence and (7.27) then prove $X_delta arrow.r.double F$ in $cal(E)_0$, including norm tightness.
  We finally identify the limit on the whole intrinsic test space, not only on interior smooth tests.
    For $phi.alt in W^(s \, q) \( U \)$, the measure
  $ mu_phi.alt = phi.alt upright(bold(1))_U thin d x - (integral_U phi.alt) rho thin d x $
  has ordinary finite logarithmic energy. Indeed $q > 1$ or $q = oo$,
    and on a fixed compact set Hölder’s inequality for the logarithmic kernel gives
  $ integral.double \| log \| x - y \| \| thin \| f \( x \) f \( y \) \| thin d x thin d y lt.eq
    C_q parallel f parallel_(L^1) parallel f parallel_(L^q) . $
  For finite $q$, $P_J phi.alt arrow.r phi.alt$ in $L^q \( U \)$; for $q =
    oo$ the intrinsic Hölder bound gives uniform essential convergence.
    The associated neutral measures consequently converge in logarithmic energy.
    Hence $F_J \( phi.alt \)$ converges to the canonical pinned Gaussian pairing with $mu_phi.alt$.
    This identifies $F$ on every intrinsic test and rules out an unidentified boundary functional in the larger
    dual. The proof is complete. ◻
]

#prodef([Remark 7.12.])[
  (Other difference-norm conventions).  If a negative Besov convention is dual to a positive intrinsic Besov
    difference norm, choose $0 < t < s < 1$. The positive test norm of order $s$ controls the intrinsic
    $W^(t \, q)$ norm: in a dyadic difference expansion, the gain $2^(- j \( s - t \))$ is summable,
    for every sequence exponent including its endpoints. The convergence just proved for
    $\( W^(t \, q) \( U \) \)^(*)$ therefore gives the corresponding negative Besov dual convergence of order $-
    s$. This is in addition to the ordinary restriction Besov conclusion of Proposition 43.
]

For $0 < c < 2$, the section has established all three convergence mechanisms with covariance $K_kappa$.
  Since $K_kappa = 4 pi kappa thin G$, the squared multiplier is $4 pi kappa$.
  Proposition 23 computes it for $c < 1$; the conditional normalization theorem quoted in the introduction applies
  after these convergence statements have been proved for $1 lt.eq c < 2$.

=== 7.7 The endpoint topology implication <the-endpoint-topology-implication>

The endpoint argument uses a different route to Gaussian convergence.
  We isolate the additional implication needed for the ordinary restriction spaces and arbitrary-domain intrinsic
  duals, rather than identify these spaces with the outward seminorm in #cite(label("DKLM2026")).

#thm([Proposition 7.13.])[
  (Endpoint topology implication).  #emph[At $c = 2$, suppose that the height pairings with every finite family of
    ordinary finite-energy neutral measures converge jointly to those of $sigma Gamma$.
    Then the commonly pinned fields also converge, with tightness,
    in all the negative-regularity spaces stated in Propositions 43 and 45.
    This includes the ordinary restriction Hölder, Besov and Sobolev spaces on every bounded open set,
    the outward-scaling completion, and the explicitly defined intrinsic Sobolev duals.]
] <prop:endpoint-topologies>

#proof[
  We obtain the required moment bounds directly from #cite(label("DKLM2026")) Theorem 4.5 and equations (28)–(30),
    which applies at $c = 2$. For $2 n$ increments whose continuum endpoints lie in a fixed bounded box,
    that theorem implies, for $0 < delta lt.eq 1$,
  #[#set math.equation(numbering: n => "(7.28)")
   $
     lr(|bb(E)_2 product_(i = 1)^(2 n) #scale(x: 120%, y: 120%)[\(] h_delta \( x_i \) - h_delta \( y_i \)
     #scale(x: 120%, y: 120%)[\)]|) lt.eq C_n sum_pi product_({ i \, j } in pi) (1 + sum_(u in { x_i \, y_i })
     sum_(v in { x_j \, y_j }) log_(+) frac(1, \| u - v \|)) . $ <eq:prob-endpoint-log-moments>]
  Here and below inequalities with a logarithmic singularity are used off the corresponding coincidence diagonals.
    To check the mesh cutoff, let $d_(i j)$ be the minimum cross-endpoint distance after rounding to lattice
    faces, and $D_(i j)$ the continuum distance. Rounding gives $D_(i j) lt.eq delta \( d_(i j) + C \)$,
    while each lattice increment length is at most $C \/ delta$.
    The logarithmic branch of the cited bound therefore satisfies
  $ 1 + log_(+) frac(C \/ delta, 1 or d_(i j)) lt.eq C' (1 + log_(+) 1 / D_(i j)) . $
  Its other branch is at most one. The logarithm of the minimum of four distances is bounded by the sum of their
    positive logarithms, giving (7.28). If a rounded increment is zero, the entire moment vanishes;
    otherwise every scale ratio is well-defined. Thus the estimate also handles distinct continuum endpoints that
    round to the same face.
  Let $f$ be a probability density supported in a square of side $0 < ell lt.eq
    1$ and bounded by $C \/ \( ell^2 t \)$, where $0 < t lt.eq 1$. For every point $v$, the disc-mass bound gives
  $ integral log_(+) frac(1, \| u - v \|) thin f \( u \) thin d u & =
    integral_0^oo #h(-0.16667em) (integral_(\| u - v \| < e^(- s)) f \( u \) thin d u) d s\
 & lt.eq integral_0^oo min (1 \, frac(C e^(- 2 s), ell^2 t)) d s lt.eq
   C' #scale(x: 120%, y: 120%)[\(] 1 + \| log ell \| + \| log t \| #scale(x: 120%, y: 120%)[\)] . $
  Write $chevron.l X_delta \, f chevron.r$ as the integral of $h_delta \( x \) -
    h_delta \( y \)$ against $f \( x \) rho \( y \) thin d x thin d y$.
    After expanding its $2 n$-th moment, each pair in (7.28) involves endpoint variables disjoint from those in
    every other pair. The pair integrals therefore multiply. The fixed smooth pin has a uniform logarithmic
    integral, and the last display bounds the other ones. Consequently
  $ bb(E)_2 \| chevron.l X_delta \, f chevron.r \|^(2 n) lt.eq
    C_n #scale(x: 120%, y: 120%)[\(] 1 + \| log ell \| + \| log t \| #scale(x: 120%, y: 120%)[\)]^n . $
  This is stronger than the bound needed in (7.20). Taking $f = \| A \|^(- 1) upright(bold(1))_A$,
    for an arbitrary positive-area subset $A$ of the square, proves that estimate at the endpoint.
    Signed densities bounded by $C ell^(- 2)$ are dominated by a constant times the uniform probability density on
    their supporting square. The same moment expansion therefore proves (7.17), including its smooth cutoff.
    Interpolation gives all finite moment orders. Coarser meshes have uniform deterministic bounds on the fixed box.
  We also need scale-uniform neutral blocks for the outward completion.
    If both endpoints of every increment lie in a square of side $r$,
    the preceding rounding argument replaces $1 + log_(+) \( 1 \/ D_(i j) \)$ by $1 + log_(+) \( r \/ D_(i j) \)$.
    Integration against densities bounded by $C r^(- 2)$ gives a constant independent of $r$ and $delta$ when
    $delta lt.eq r$. When $delta > r$, unit jumps give the same bound deterministically.
    For a neutral signed density $g$ on that square, choose a probability density $p lt.eq
    C r^(- 2)$ there and use the exact representation
  $ chevron.l h_delta \, g chevron.r = integral.double #scale(x: 120%, y: 120%)[\(] h_delta \( x \) -
    h_delta \( y \) #scale(x: 120%, y: 120%)[\)] g \( x \) p \( y \) thin d x thin d y . $
  Domination by $\| g \( x \) \| p \( y \) lt.eq C r^(- 4)$ gives the required moment bound without dividing by a
    possibly small Jordan mass. This proves the neutral-block estimate (7.7) at $c = 2$.
  We may now repeat the wavelet proof of Proposition 43: for $alpha < beta < 0$ choose $b$ with $2 + b beta < 0$.
    The endpoint pinned-average bound gives (7.18); finite-level truncations and the gain
    $2^(j \( alpha - beta \))$ yield compactness in every asserted restriction norm.
    Smooth neutral pairings identify the limits by the hypothesis.
    The global localization and continuous restriction to $U$ require no boundary extension theorem.
    The neutral-block bound and the exact mesh-rescaling identity give the outward tails and smooth approximations
    by the same proof.
  Finally the endpoint cell-average estimate gives every thick- and thin-cell bound in the proof of
    Proposition 45, including the case $p = 1$, $q = oo$. Its finite-level coefficients are pairings with ordinary
    finite-energy measures, so their joint convergence is part of the hypothesis.
    The summable dual norm tail proves convergence in the same separable closed subspace;
    energy approximation identifies the limit on the entire intrinsic test space. This proves the proposition. ◻
]

== 8 Completion of the proof <completion-of-the-proof>

#proof[
  At $c = 2$, Proposition 52 proves the result. Its independent loop argument supplies the rotational-invariance
    premise of the public endpoint proof, and its final step retains the ordinary restriction and intrinsic
    topologies of the present theorem.
  Fix $0 < c < 2$. Sections 2 and 3 construct the limits of every finite word of rows and marks.
    Proposition 17 identifies the physical words with local arrow probabilities of the prescribed plane law.
    For $c < 1$ the construction uses the exactly balanced sector throughout and proves existence in the required
    iterated order. Where an auxiliary near-balanced limit is used for $c gt.eq 1$,
    the equilibrium identification gives the already existing balanced law.
    The same proposition identifies the two axial descriptions of its local observables.
  The angular representation of Section 4 has orbit mass $kappa < oo$ and height variogram $4 kappa log \| x \| +
    O \( 1 \)$. Proposition 34 establishes the holomorphic and antiholomorphic Wick rules,
    with logarithmic covariance $- 2 kappa log \| x - y \|$. Propositions 37, 39 and 41 identify the smooth tests,
    separated increments and finite-energy measures. Propositions 43 and 45 give the restriction,
    outward and intrinsic norm convergences. In each case the squared GFF multiplier is $4 pi kappa$.
    Their estimates apply to arbitrary real mesh sizes and identify every subsequential limit;
    hence the limits hold along the full $delta arrow.b 0$.
  If $0 < c < 1$, Proposition 23 gives
  $ 4 pi kappa = frac(2, pi - lambda) = frac(2, arccos Delta) . $
  For $1 lt.eq c < 2$, we have now proved a subsequential GFF limit in the required senses for the balanced law,
    so the hypothesis of #cite(label("DKLM2026")) Theorem 4.3 is satisfied.
    That theorem identifies its squared multiplier as $- 1 \/ f'' \( 0 \)$,
    where $f$ is the source’s free-energy function. By #cite(label("DKLM2026")) Theorem 4.4, $f'' \( 0 \) = - 1 /
    2 arccos Delta$, giving the same multiplier. This use of the conditional theorem comes after,
    and does not supply, the convergence argument.
  Finally, ordinary finite signed-energy tests have the joint covariance in the statement by Proposition 41.
    All pinning choices differ by an additive constant, the negative-regularity assertions use the common chosen
    pin, and increments cancel it. The uniformity in (1.3) and the arbitrary-open-set conclusions have already
    been proved in their respective propositions. This completes the theorem. ◻
]

== 9 Rotation of the fair-signed height at $q = 4$ <sec:endpoint-rotation>

At $c = 2$, the height can be represented by critical $q = 4$ FK loops with independent fair orientations.
  We use this representation to prove isometry invariance of its separated increment correlations,
  the symmetry input in the endpoint GFF argument of #cite(label("DKLM2026")).

Averaging over orientations leaves only loops that separate at least two of the prescribed endpoint pairs.
  Such loops have a positive macroscopic diameter. The homotopy coupling of #cite(label("DCKKMO2026Rotation"))
  Sections 3.5–3.6 and 4.2 matches these loops with their multiplicities and preserves the topological information
  from which we recover their endpoint separations. Qualitative bulk RSW estimates control the unmatched
  exceptional events. We use the coupling itself because the loop-set distance in the rotation theorem does not
  retain multiplicities.

For $k gt.eq 2$, let

$ cal(D)_k = {bold(u) = \( u_1 \, u'_1 \, dots.h \, u_k \, u'_k \) : { u_i \, u'_i } ∩ { u_j \, u'_j } =
  diameter quad \( i eq.not j \)} . $

Coincidence within one pair is allowed. Give the critical $q =
  4$ FK loops independent fair signs and let $h_delta$ be the resulting height,
  with jumps of size one and an immaterial additive constant.
  At a continuum point use any fixed face representative within $O \( delta \)$. Put

#[#set math.equation(numbering: n => "(9.1)")
 $ Phi_(k \, delta) \( bold(u) \) = bb(E) product_(i = 1)^k #scale(x: 120%, y: 120%)[\(] h_delta \( u'_i \) -
   h_delta \( u_i \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rr-Phi>]

#thm([Theorem 9.1.])[
  (Isometry invariance of the endpoint correlations).  #emph[For every even $k gt.eq
    2$ and every compact $K subset cal(D)_k$,
#[#set math.equation(numbering: n => "(9.2)")
 $ lim_(delta arrow.b 0) sup_(bold(u) in K) sup_(I in "Isom" \( bb(R)^2 \))
   lr(|Phi_(k \, delta) \( bold(u) \) - Phi_(k \, delta) \( I bold(u) \)|) = 0 . $ <eq:rr-target>]

]
] <thm:rr-rotation>

We first identify this fair-signed field with the balanced plane law of Theorem 1.
  The torus loop weight and the torus FK weight differ, so the passage to the plane is part of the argument.

#thm([Lemma 9.2.])[
  (The endpoint plane correspondence).  #emph[After the fixed similarity identifying the medial square grid with
    $bb(Z)^2$, the fair unit-jump height of critical plane $upright("FK")_4$ has the same gradient law as the
    zero-slope six-vertex height with $upright(bold(a)) = upright(bold(b)) = 1$ and $upright(bold(c)) = 2$.]
] <lem:rr-bkw>

#proof[
  On an even square torus, give equal weight to each pair consisting of noncrossing local switch pairings and an
    orientation of each resulting closed loop. Erasing orientations gives weight $2^ell$ to a configuration with
    $ell$ loops. Erasing pairings gives an ice-rule arrow configuration:
    each of the four $a$- and $b$-type vertices admits one compatible pairing,
    and each of the two $c$-type vertices admits two. Thus the arrow marginal has weights $\( 1 \, 1 \, 2 \)$,
    and the loop orientations, conditionally on the unoriented loops, are independent and fair.
    This is the endpoint specialization of the local calculation in #cite(label("Lis2021")) Section 2,
    Equations (2.1)–(2.3).
  The torus weight $2^ell$ need not equal the torus FK weight.
    Precisely the needed plane passage is supplied by #cite(label("Lis2021")) Lemma 3.1:
    its unoriented loop law converges locally to critical plane $upright("FK")_4$.
    Fix a finite set of observed medial edges. Bulk annular RSW implies that every plane FK loop meeting this set
    is finite almost surely. For any $epsilon > 0$, choose a box containing all these loops with probability at
    least $1 - epsilon$. The event that the observed loops close inside this box is determined by its finitely
    many pairings. On that event, local convergence transfers their full loop identities,
    and hence their independent fair orientations. Letting the box grow proves convergence of the local arrow law
    to independently oriented plane FK loops.
  On the other hand, the unrestricted six-vertex torus laws have the zero-slope plane limit used in
    #cite(label("DKLM2026")) Theorem 2.2 and the paragraph following it.
    That paragraph identifies the unrestricted torus limit with the slope-zero law defined through balanced
    cylinders. This is a lattice Gibbs-law fact preceding the GFF argument.
    The two descriptions of the arrow limit agree, and arrows determine unit height differences.
    Additive constants do not affect the gradient law. This proves the lemma. ◻
]

Consequently Theorem 48 supplies exactly the $upright(bold(c)) =
  2$ case of the symmetry input #cite(label("DKLM2026")) Theorem 4.1.
  The proof uses the lattice correspondence and qualitative FK estimates, before identifying any Gaussian limit.

=== 9.1 Even moments retain only macroscopic loops <even-moments-retain-only-macroscopic-loops>

Smooth the discrete contours locally into disjoint Jordan loops. This changes their location by $O \( delta \)$.
  For such a loop $L$ set

$ D_i \( L \) = upright(bold(1))_("int" L) \( u'_i \) - upright(bold(1))_("int" L) \( u_i \) . $

A reference orientation may multiply all the $D_i \( L \)$ by one sign depending on $L$;
  the fair sign absorbs that choice. Let $Pi_(upright("even")) \( k \)$ denote the partitions of ${ 1 \, dots.h \,
  k }$ whose blocks all have even size. Conditional expectation over the signs gives the exact identity

#[#set math.equation(numbering: n => "(9.3)")
 $ P_k \( cal(L) \; bold(u) \) :=
   bb(E)
   [product_i #scale(x: 120%, y: 120%)[\(] h_delta \( u'_i \) - h_delta \( u_i \) #scale(x: 120%, y: 120%)[\)]
   thin mid(bar.v) thin cal(L)] = sum_(pi in Pi_(upright("even")) \( k \)) med sum_(f : pi arrow.r cal(L)\
f med upright("injective")) product_(B in pi) product_(i in B) D_i \( f \( B \) \) . $ <eq:rr-even-polynomial>]

At positive mesh only finitely many loops separate any prescribed pair:
  each such loop crosses a fixed finite lattice path between its endpoints.
  Hence the expansion is a finite identity. In particular, there is no limiting interchange in its derivation.

Call a loop relevant if at least two coordinates of $\( D_1 \( L \) \, dots.h \, D_k \( L \) \)$ are nonzero.
  Every loop in a nonzero summand of (9.3) is relevant. If endpoints belonging to distinct slots are separated by
  $d > 0$, a relevant loop surrounds one endpoint from each of two distinct slots. Therefore

#[#set math.equation(numbering: n => "(9.4)")
 $ "diam" L gt.eq d . $ <eq:rr-macro>]

Here we used that the closure of a Jordan domain is contained in the convex hull of its boundary.
  Also, a separating loop intersects the segment joining the separated endpoints.
  Thus, if the endpoints lie in $B \( 0 \, M \)$, every relevant loop meets that disk.
  For rounded continuum endpoints, replace $d$ by $d - O \( delta \)$.

We record the quantitative estimates needed below. They hold also for the two-angle mixed isoradial lattices in
  the rotation construction. For any fixed choice of the two angles,
  their mesh geometry has bounded distortion and their bulk conditional RSW bounds are available from
  #cite(label("DCKKMO2026Rotation")) Theorem 2.2, Remark 2.3 and Proposition 2.12.

#thm([Lemma 9.3.])[
  (Counts, escape, and deterministic-point avoidance).  #emph[Let $N \( a \, M \)$ be the number of loops of
    diameter at least $a$ meeting $B \( 0 \, M \)$. For $delta$ sufficiently smaller than $a$, and every fixed $p < oo$,
#[#set math.equation(numbering: n => "(9.5)")
 $ parallel N \( a \, M \) parallel_(L^p) lt.eq C_p \( 1 + M \/ a \)^2 . $ <eq:rr-count>]

 There are $C \, gamma > 0$ such that, with harmless fixed changes of the radii,
#[#set math.equation(numbering: n => "(9.6)")
 $ bb(P) { exists L : L ∩ B \( 0 \, M \) eq.not diameter \, L subset.not B \( 0 \, R \) } & lt.eq
   C \( M \/ R \)^gamma \, &  & R gt.eq 10 M \,\
bb(P) { exists L : "diam" L gt.eq a \, "dist" \( z \, L \) lt.eq r } & lt.eq
  C #scale(x: 120%, y: 120%)[\(] \( r + C delta \) \/ a #scale(x: 120%, y: 120%)[\)]^gamma \, &  & 0 < r < a \/
  100 . $ <eq:rr-escape>]

 The constants are independent of the deterministic center $z$.]
] <lem:rr-estimates>

#proof[
  Bulk RSW in a sequence of buffered annuli gives a polynomial bound for an actual primal or dual arm between
    their extreme rims: each annulus has a uniformly positive conditional probability of a blocking circuit of the
    opposite color.
  We also need a count consequence of RSW. In an annulus, an #emph[actual component] consists of vertices
    connected by open paths inside the annulus; boundary wiring alone does not identify its vertices.
    The number of such components crossing a fixed-aspect annulus has a geometric tail.
    To see this, explore complete actual components from the inner rim and reveal all their closed exiting edges.
    Remove the explored components, including noncrossing ones, until a crossing component has been found.
    The domain Markov property leaves on the surviving graph only the boundary identifications inherited from the
    original rims: the closed exiting edges prevent an explored component from wiring surviving bulk vertices.
    Extend the surviving configuration by closed edges on the deleted graph.
    Its conditional law is stochastically dominated by FK on the original annulus with every vertex on both
    original rims wired together. Even under this maximal boundary condition,
    bulk RSW gives a dual circuit in a buffered middle annulus with probability bounded below.
    Such a circuit blocks a further actual primal crossing, irrespective of the identifications at the original
    rims. Repeating this exploration bounds the conditional chance of each additional crossing by a fixed number
    below one. Apply the same argument with the colors exchanged.
  A loop has a primal cluster on one side and a dual cluster on the other.
    The cluster on its bounded side is its #emph[interior-side cluster];
    an open path in this cluster running alongside an arc of the contour is an #emph[interior bank].
    Each loop is the unique exterior contour of its interior-side cluster,
    so distinct loops give distinct colored clusters. Cover $B \( 0 \, M \)$ by $O \( \( 1 + M \/ a \)^2 \)$ balls
    of radius $a \/ 100$. A loop of diameter at least $a$ meeting one of these balls has an interior bank crossing
    an annulus about the ball’s center whose two radii are fixed multiples of $a$.
    Choosing one such annular component for each loop gives distinct actual components for distinct global
    clusters. The preceding geometric tail and Minkowski’s inequality prove (9.5).
  For (9.6), a bank of an escaping loop gives an actual arm from scale $M$ to scale $R$.
    For (9.6), a bank of the indicated loop gives an arm from scale $r +
    C delta$ about $z$ to a fixed fraction of $a$. The polynomial arm bound proves both assertions. ◻
]

Fix a compact $K subset cal(D)_k$, write $d_K > 0$ for its minimum cross-slot endpoint distance,
  and choose $M$ containing every endpoint in $K$. If $k = 2 m$, an even partition has at most $m$ blocks,
  so (9.3) implies

#[#set math.equation(numbering: n => "(9.7)")
 $ \| P_(2 m) \( cal(L) \; bold(u) \) \| lt.eq C_m N \( d_K \/ 2 \, M + 1 \)^m \, wide bold(u) in K \, $ <eq:rr-UI>]

for sufficiently small mesh. All fixed moments of the right-hand side are uniformly bounded by Lemma 50.
  These are bounds for the #emph[sign-averaged polynomial];
  no uniform absolute-moment assertion about a product of pointwise height differences is being made.

Two consequences will be useful. First, removing loops not contained in $B \( 0 \, R \)$ changes the expectation
  of the polynomial by at most $C_K \( M \/ R \)^(gamma \/ 2)$, by (9.6), (9.7), and Cauchy–Schwarz.
  Second, if corresponding endpoints of two tuples in a compact subset of $cal(D)_k$ move by at most $r$,
  evaluate both polynomials in the same loop sample. Off the events in (9.6) at those endpoints,
  every relevant loop has unchanged endpoint indicators. Hence

#[#set math.equation(numbering: n => "(9.8)")
 $ \| Phi_(k \, delta) \( bold(u) \) - Phi_(k \, delta) \( bold(v) \) \| lt.eq
   C_K #scale(x: 120%, y: 120%)[\(] \( r + C delta \) \/ d_K #scale(x: 120%, y: 120%)[\)]^(gamma \/ 2) .
   $ <eq:rr-continuity>]

This estimate is uniform in the absolute location of the tuple.
  It covers within-slot coincidences and changes of the rounding convention.
  The supremum over $K$ is a supremum of deterministic tuple estimates;
  we do not require one avoidance event to hold simultaneously at all points occurring in $K$.

=== 9.2 The FK coupling and its marked clusters <the-fk-coupling-and-its-marked-clusters>

Let $bb(L) \( alpha \)$ be the rectangular isoradial lattice in #cite(label("DCKKMO2026Rotation")) Section 1.4;
  $bb(L) \( pi \/ 2 \)$ is a fixed rotation and dilation of the square lattice.
  The next lemma extracts the precise part of its coupling that we use.
  Its assertion is about loop multiplicities, not merely about proximity of loop sets.

#thm([Lemma 9.4.])[
  (Homotopy coupling with dense marked clusters).  #emph[Fix $alpha in \( 0 \, pi \)$.
    As the mesh tends to zero, the construction of #cite(label("DCKKMO2026Rotation")) Section 3.6 gives a coupling
    of two auxiliary loop samples. Their restrictions to a deterministic window exhausting the plane have,
    unconditionally, the respective homogeneous laws on $delta bb(L) \( pi \/ 2 \)$ and $delta bb(L) \( alpha \)$.]
  #emph[Outside an event of probability tending to zero, there are correspondingly indexed,
    pairwise disjoint marked clusters, called nails, whose mesh tends to zero and whose window exhausts the plane.
    Corresponding nails have diameter tending to zero and lie at distance tending to zero from the same grid
    point. There is a bijection $psi$ between all loops surrounding at least two but not all nails in the two
    samples. It preserves their oriented reduced crossing words relative to the nail grid.]
] <lem:rr-nails>

#proof[
  This is the construction preceding the metric conclusion, with its parameters retained.
    In the notation of #cite(label("DCKKMO2026Rotation")) Definition 3.8 and Section 3.6, pp. 49–50, choose $eta =
    N^(- b)$ and $t = N^(- b^2)$, for $b > 0$ sufficiently small.
    On an event of probability $1 - O \( N^(- c) \)$, the selected nail clusters survive the whole
    extrema-resampling and track-exchange chain. The proof in the cited section retains a bijection of the
    non-trivial loops throughout this chain. During an extrema-resampling step,
    each such loop either avoids the resampled boxes or the configuration remains unchanged.
    During a track exchange, the local changes preserve the loops without breaking them and preserve their
    homotopy classes relative to the surviving nails. Thus the oriented reduced words are unchanged at every step,
    for both colors of contour.
  Initially, the nail grid spacing is $t^(1 \/ 2) N$, nail diameters are $O \( t N \)$,
    and the nail window has size comparable to $t^(1 \/ 4) N$.
    The terminal nail positions differ by these errors from their images under $M_(pi \/ 2 \, alpha)$.
    The independent FK argument in #cite(label("DCKKMO2026Rotation")) Section 4.2,
    proof of Theorem 1.7 proves $M_(pi \/ 2 \, alpha) = upright("id")$.
    We may therefore use the already constructed coupling with corresponding nails at the same limiting positions.
  For clarity, these scales can be arranged for every small physical mesh $delta$.
    Set $a = b^2$ and choose $N = 2 floor.l 1 / 2 delta^(- 1 \/ \( 1 - 3 a \/ 8 \)) floor.r$,
    so $N$ is even as required by the track construction. Then the physical grid spacing, nail diameter,
    and nail-window size are respectively of orders
  $ N^(- a \/ 8) \, wide N^(- 5 a \/ 8) \, wide N^(a \/ 8) . $
  The homogeneous observation window has scale $delta N$, which also diverges.
    Center the nail window by translating each endpoint sample by a period vector of its own homogeneous lattice
    nearest the same centering vector. The two chosen translations differ by $O \( delta \)$;
    this only adds a vanishing error to corresponding nail positions.
    The endpoint restrictions have exactly the homogeneous laws,
    by #cite(label("DCKKMO2026Rotation")) Proposition 2.11. After centering,
    both the nail window and the homogeneous observation windows exhaust the plane.
    The probability $O \( N^(- c) \)$ tends to zero. This proves the stated extraction;
    no conclusion about curve-set convergence is used to recover the bijection. ◻
]

Here is the topological information in a crossing word that will matter.
  Orient each loop by the reference convention and let $s_L in { - 1 \,
  1 }$ be its winding number at an interior point. For any two nails,
  join chosen points in them by a path of nail-grid edges, with transverse perturbations if necessary.
  The algebraic intersection number of $L$ with this path equals the difference of its winding numbers at the two
  nail points. It is read from the oriented crossing word. Cyclic permutation and deletion of an adjacent inverse
  pair do not change it. Consequently, if $n \, n'$ and $tilde(n) \, tilde(n)'$ are corresponding nail points,

#[#set math.equation(numbering: n => "(9.9)")
 $ s_L #scale(x: 120%, y: 120%)[\(] upright(bold(1))_("int" L) \( n' \) -
   upright(bold(1))_("int" L) \( n \) #scale(x: 120%, y: 120%)[\)] =
   s_(psi \( L \)) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_("int" psi \( L \)) \( tilde(n)' \) -
   upright(bold(1))_("int" psi \( L \)) \( tilde(n) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rr-winding-difference>]

We need only these differences. In particular, no inference of an absolute inside set from a finite grid word is
  required.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0.664, 0), radius: (1.013, 1.228), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((1.494, 1.245), [#text(fill: rgb("#00008c"))[$L$]])
  circle((-1.037, 0.581), radius: 0.05644, fill: black, stroke: none)
  circle((0.664, 0.581), radius: 0.05644, fill: black, stroke: none)
  content((-1.112, 0.581), [$u_1$], anchor: "east", padding: 0.1176cm)
  content((0.7304, 0.581), [$u'_1$], anchor: "west", padding: 0.1176cm)
  line((-1.037, 0.581), (-0.913, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.664, 0.581), (0.5395, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-0.913, 0.7055), (-0.8134, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((0.5395, 0.7055), (0.6391, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  circle((-1.037, -0.581), radius: 0.05644, fill: black, stroke: none)
  circle((0.664, -0.581), radius: 0.05644, fill: black, stroke: none)
  content((-1.112, -0.581), [$u_2$], anchor: "east", padding: 0.1176cm)
  content((0.7304, -0.581), [$u'_2$], anchor: "west", padding: 0.1176cm)
  line((-1.037, -0.581), (-0.913, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.664, -0.581), (0.5395, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-0.913, -0.4565), (-0.8134, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((0.5395, -0.4565), (0.6391, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  content((0.2905, -1.618), [two separated slots])
  line((1.992, 0), (3.403, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.697, 0), [$psi$], anchor: "south", padding: 0.1176cm)
  bezier((4.689, -0.913), (5.727, 1.162), (4.233, -0.083), (4.772, 1.245), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  bezier((5.727, 1.162), (5.602, -1.245), (6.64, 0.996), (6.64, -1.162), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  bezier((5.602, -1.245), (4.689, -0.913), (5.063, -1.411), (4.855, -1.162), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((6.474, 1.369), [#text(fill: rgb("#00008c"))[$psi (L)$]])
  circle((3.942, 0.581), radius: 0.05644, fill: black, stroke: none)
  circle((5.644, 0.581), radius: 0.05644, fill: black, stroke: none)
  line((3.942, 0.581), (4.067, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.644, 0.581), (5.519, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((4.067, 0.7055), (4.167, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((5.519, 0.7055), (5.619, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  circle((3.942, -0.581), radius: 0.05644, fill: black, stroke: none)
  circle((5.644, -0.581), radius: 0.05644, fill: black, stroke: none)
  line((3.942, -0.581), (4.067, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.644, -0.581), (5.519, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((4.067, -0.4565), (4.167, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((5.519, -0.4565), (5.619, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  content((5.27, -1.618), [$D( psi (L))= plus.minus D(L)$])
})],
  caption: [Figure 2: Nearby nails (squares) detect the separations of endpoint pairs (dots). The homotopy bijection preserves oriented winding differences. A single sign change of a loop’s whole separation vector cancels when that loop occurs an even number of times. ],
) <fig:rr-nails>

=== 9.3 Transfer of the correlation polynomial <transfer-of-the-correlation-polynomial>

Fix $alpha in \( 0 \, pi \)$ and compact $K subset cal(D)_k$. Choose $0 < r < d_K \/ 1000$.
  Apply Lemma 51 and, for each endpoint, select an indexed nail close to it.
  For all small enough meshes both corresponding nails lie within $r \/ 2$ of that endpoint.
  Nails selected for endpoints in distinct slots are distinct.
  In both samples discard the event that a loop of diameter at least $d_K \/ 4$ comes within $r$ of an endpoint.
  Lemma 50 bounds the probability of these exceptions by $C_K \( r \/ d_K \)^gamma + o \( 1 \)$,
  uniformly for the individual tuples in $K$.

On the remaining event, a relevant loop $L$ surrounds the nails near one endpoint of each of two distinct slots,
  and excludes a nail near the other endpoint of a separated slot.
  It is therefore non-trivial in the exact sense of Lemma 51, so $psi \( L \)$ is defined.
  For those two slots the winding differences at the corresponding nails are nonzero by (9.9).
  Thus $psi \( L \)$ separates each of the two nail pairs. In particular,
  it encloses one nail from each of two distinct slots, whose distance is at least $d_K - O \( r + delta \)$.
  This proves that $psi \( L \)$ itself has diameter at least $d_K \/ 4$.
  Its endpoint-avoidance event is consequently applicable; smallness of the partner has not been assumed away.

Endpoint indicators and nearby-nail indicators agree for both loops, as illustrated in Figure 2.
  Equation (9.9) now gives, for #emph[every] slot,

#[#set math.equation(numbering: n => "(9.10)")
 $ D_i \( psi \( L \) \) = s_L / s_(psi \( L \)) D_i \( L \) . $ <eq:rr-signature>]

The inverse bijection gives the same statement starting with a relevant loop in the second sample.
  Hence it is a bijection between all relevant loops, preserving their entire separation vectors up to one sign
  per loop. For a block $B$ in an even partition,

$ product_(i in B) D_i \( psi \( L \) \) = (s_L / s_(psi \( L \)))^(\| B \|) product_(i in B) D_i \( L \) =
  product_(i in B) D_i \( L \) . $

Transporting the injective labels in (9.3) therefore makes the two polynomials #emph[exactly equal] on the good
  event. This uses the actual bijection, so distinct loops are never identified with one another.
  Cauchy–Schwarz and (9.7) bound the expectation error by $C_K \( r \/ d_K \)^(gamma \/ 2) + o \( 1 \)$.

It remains to pass from the auxiliary mixed samples to the intended homogeneous ones.
  Fix $R > 10 M$ and couple their restrictions identically in $B \( 0 \, R \)$ using the local-law assertion of
  Lemma 51; for small enough mesh this disk lies in both homogeneous windows.
  Off the escaping-loop event in either sample, all relevant complete loops are identical.
  Equations (9.6) and (9.7) bound the expectation error by $C_K \( M \/ R \)^(gamma \/ 2)$.
  Let the mesh tend to zero, then $r arrow.b 0$ and $R arrow.t oo$.
  Writing $Phi_(k \, delta)^alpha$ for the fair-signed correlation on $delta bb(L) \( alpha \)$, we obtain

#[#set math.equation(numbering: n => "(9.11)")
 $ lim_(delta arrow.b 0) sup_(bold(u) in K)
   lr(|Phi_(k \, delta)^(pi \/ 2) \( bold(u) \) - Phi_(k \, delta)^alpha \( bold(u) \)|) =
   0 . $ <eq:rr-isoradial-transfer>]

No diameter threshold needs to be a continuity point: all small loops were removed by the even-moment identity itself.

#proof[
  The rectangular model on $bb(L) \( alpha \)$ is invariant under reflection $S_(alpha \/ 2)$ about
    $e^(i alpha \/ 2) bb(R)$ #cite(label("DCKKMO2026Rotation")) Remark 1.8.
    Its fair-sign height correlations inherit that symmetry. If the chosen endpoint rounding is not reflection
    equivariant, the reflected representatives differ by $O \( delta \)$, which is harmless by (9.8).
    Apply (9.11) at the original and reflected tuples. The square model is consequently asymptotically invariant
    under $S_(alpha \/ 2)$, uniformly on every compact subset of $cal(D)_k$.
    Composing with its exact horizontal-reflection symmetry yields invariance under rotation through $alpha$.
    Square symmetries cover the endpoints and the other half of the circle.
    This proves the assertion for each fixed rotation.
  The estimate (9.8) upgrades this to uniformity in the rotation angle.
    Indeed, the orthogonal images of $K$ form a compact subset of $cal(D)_k$,
    and a finite angular net approximates every rotation with endpoint displacement at most $C_K$ times its
    angular mesh. First use convergence at the finitely many net angles, and then let the angular mesh decrease.
    Reflections follow by composition with an exact square symmetry.
    This argument requires no estimate uniform in a degenerating isoradial angle.
  Finally, any translation differs from a period translation of the mesh-$delta$ square lattice by a vector of
    length $O \( delta \)$. Exact period invariance and the location-uniform estimate (9.8) handle this residual
    displacement, uniformly over #emph[all] translation vectors.
    Every plane isometry is a translation followed by an orthogonal map.
    The fixed rotation and dilation identifying $bb(L) \( pi \/ 2 \)$ with $bb(Z)^2$ merely change the mesh
    convention and compact set. These observations prove (9.2) for the original square lattice. ◻
]

=== 9.4 The endpoint field and all test classes <the-endpoint-field-and-all-test-classes>

#thm([Proposition 9.5.])[
  (Completion at the endpoint).  #emph[The conclusions of Theorem 1 hold at $c = 2$, with squared multiplier $2 \/ pi$.]
] <prop:endpoint-completion>

#proof[
  Lemma 49 identifies the fair unit-jump height with the prescribed balanced plane law.
    Theorem 48 supplies #cite(label("DKLM2026")) Theorem 4.1 at $c = 2$;
    odd correlations vanish by arrow reversal. We can therefore follow the isotropic argument of that paper with
    its symmetry premise now proved here.
  Specifically, #cite(label("DKLM2026")) Theorems 6.1, 7.1 and 8.1 give this alternative:
    either the field converges to a fixed GFF multiple in all three senses of its Definitions 2.5–2.7,
    or two mesh sequences give GFF limits with distinct nonnegative multipliers.
    These senses include separated correlations, finite-energy tests and the outward completion.
    The free-energy identification in its Theorems 4.3–4.4 gives every possible squared multiplier as
  $ sigma^2 = - frac(1, f'' \( 0 \)) = frac(2, arccos \( - 1 \)) = 2 / pi . $
  Thus the alternative with two distinct multipliers is excluded, and convergence holds along the full mesh limit.
  Proposition 47 now applies to the finite-energy convergence.
    Using the lattice-cutoff estimate of #cite(label("DKLM2026")) Theorem 4.5,
    it proves convergence and tightness in the ordinary restriction and intrinsic negative topologies on every
    bounded open set, with the common chosen pin. Its proof retains endpoints rounded to the same face and
    arbitrarily small positive-area cells at the boundary.
  Finally, the fixed similarity identifying the FK medial lattice with $bb(Z)^2$ changes the logarithmic Green
    kernel only by an additive constant. Neutrality cancels that constant,
    so the coefficient and test conclusions agree with Theorem 1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
