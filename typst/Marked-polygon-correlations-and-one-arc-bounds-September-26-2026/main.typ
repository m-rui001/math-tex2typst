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

#align(center)[#text(size: 16pt, weight: "bold")[Marked polygon correlations and one-arc bounds]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

How much critical polygon mass remains after each polygon is weighted by the square of its length? A bound on the number of large polygons does not answer this question: a polygon can have many vertices while staying inside a small region. The useful observable records two visited ports. Summing their correlation counts a polygon once for each ordered pair of visits and thus recovers its squared length.

We use the regular honeycomb lattice dual to the triangular lattice of side length one. A polygon is a simple cycle, with neither orientation nor distinguished vertex. Its length $\| P \|$ is its number of vertices, and its weight is $rho_(upright(v))^(\| P \|)$, where

$ rho_(upright(v)) = \( 2 + sqrt(2) \)^(- 1 \/ 2) . $

Translation classes use the translations of the triangular lattice; the two honeycomb vertex types are consequently retained. Diameter is Euclidean diameter in this fixed embedding.

#thm([Theorem 1.1.])[
  (Squared-length polygon mass).  #emph[For every $eta > 0$ there is $C_eta < oo$ such that, for $H gt.eq 1$, 
$ sum_(\[ P \] med "diam" P lt.eq H) rho_(upright(v))^(\| P \|) \| P \|^2 lt.eq C_eta H^(2 \/ 3 + eta) . $

 The sum is over the simple unoriented polygon translation classes just defined.]
] <thm:polygon-moment>

Nienhuis predicted the honeycomb critical point and critical exponents through the dilute $O \( n \)$ model [8]. Duminil-Copin and Smirnov proved the exact connective constant, hence the value of $rho_(upright(v))$, using a local parafermionic identity [3].

The spectral parameters used below come from an integrable extension of this model. Nienhuis obtained soluble square-lattice $O \( n \)$ models through the Yang–Baxter equations [9]. Ikhlef and Cardy related the local discrete-holomorphicity equations for parafermionic observables to these integrable weights, with a linear relation between the spectral parameter and the rhombus angle [6] Section 3. Glazman and Manolescu proved boundary two-point invariance for columnwise rhombic half-planes in this Yang–Baxter setting [5]. Zhou and Batchelor studied finite-size corrections to the bulk transfer-matrix spectra of dilute integrable models [14]. The estimates below also require uniform control of marked positive lattice sums, including their dependence on the finite geometry and normalization.

Our main intermediate observable lives on a honeycomb cylinder. Cut the cylinder along a row of ports in cyclic order

$ \[ p \, X \, p' \, Y \] \, #h(2em) \| X \| = s \, quad \| Y \| = b \, quad N = s + b + 2 upright(" even") . $

A port is the midpoint of a triangular edge, hence of a crossed honeycomb edge. A path between ports includes the initial and final half-edges and has one factor $rho_(upright(v))$ for each visited vertex. The finite transfer uses site logarithms $a_i = 2 i u_i$, with $lambda = pi \/ 8$ and $beta = 2 lambda = pi \/ 4$. After a common shift, the physical logs have heights $0$ or $beta$. All sites of $Y$ have height zero; the sites of $X$ can have either height. The two choices specify the two allowed triangular band directions along the row. Both marked sites can have either height.

Write $cal(C) \( p \, p' \)$ for the sum of the weights of individual cylinder polygons visiting both ports. Each polygon is counted once, including when it winds around the cylinder. The normalized half-cylinder states defining this sum are described in Section 2; their physical series converge absolutely. Let $t$ be the fraction of ordinary $X$ sites at upper height, and put

$ gamma = 4 / 3 \, #h(2em) L_X = gamma^(- 1) log s \, #h(2em) L_Y = gamma^(- 1) log b . $

For fixed $c_1 > 0$ and a sufficiently small fixed $c_4 > 0$, the sharp estimate proved in Theorem 26 is

$ log cal(C) \( p \, p' \) lt.eq - 4 / 3 log s + 617 / 1200 log \( b \/ s \) + o \( log b \) \, $

uniformly when $c_1 L_Y lt.eq L_X lt.eq L_Y$, $t in \[ 1 \/ 2 \, 1 \]$, and, if $t < 1$, $s \( 1 - t \) gt.eq e^(c_4 L_Y)$. The margin permits an exponentially small minority of lower sites. Section 6 shows that a fixed fraction of the ordered marks on every sufficiently long planar polygon meet it. This is enough to prove Theorem 1; no uniform estimate for every possible ordered pair is used in that deduction.

There is a second, deliberately coarser, output. Let $A \( p \, p' \)$ be the critical weight of individual simple arcs leaving $p$ on its west half-edge and arriving at $p'$ on its east half-edge, with the other marked half-edges vacant and no additional loop components. We prove a fixed polynomial bound $A \( p \, p' \) lt.eq b^C$ for $L_Y gt.eq L_X gt.eq L_(*)$ when the upper-site fraction of $X$ is at least $1 \/ 2 - delta_1$, for fixed positive $delta_1 \, L_(*) \, C$. The ratio $L_X \/ L_Y$ may approach zero. This estimate is useful when the cylinder period grows in one direction while the separation of its marks stays fixed. Its proof, Theorem 8.3, appears after the sharper two-mark argument and uses only real integration, so it requires neither the minority-site margin nor the sharp fluctuation asymptotic.

=== 1.1 How the proof works <how-the-proof-works>

The finite spin contraction in Section 3 selects a single polygon through the two marks. Resolving each ordinary site against a pair of dual covector families turns that contraction into a finite sum of contour integrals. The original polygon sum is positive; the integrals used to estimate it can be complex. Their normalization is therefore kept exact throughout the argument.

The first normalization issue is independent of the contour saddle. Section 4 proves a lower bound for the vacuum polynomial uniform in both site multiplicities. It writes a Pfaffian ratio as a positive expectation and evaluates its first logarithmic variation by Cauchy interpolation. This retains the coefficient $5 \/ 24$ even at very unequal multiplicities. The Pfaffian integration and Cauchy identities are classical tools [1,7]; the uniform estimate for the present normalization is proved here.

Next, Section 5 deforms one main contour until its centering measure is real and positive. The real interaction then controls a negative Sobolev norm of every species and the $L^2$ norm of the total primitive. We first verify this on horizontal boundary lines by an exact finite symbol calculation, then transfer it to the curved contour by harmonic balayage and a positive Green energy.

Section 6 uses that coercivity to bound the particles outside their natural intervals. An imaginary trial field gains $2 L_X$ in the common interval; a different square completion controls the two shoulders between $L_X$ and $L_Y$. Their activity sum and the normalization are both retained, rather than absorbed into a size-dependent constant.

The remaining task is to implement these deterministic trial fields in the actual integrals. The trial setup introduces the normalized reference measure in Section 6.2. Section 7 computes the unequal-wall determinant and handles a site mixture tending to one by a rescaled central coordinate. It then establishes the source and quadratic bounds for the magnetic reference law and implements the trial fields by finite-rank particle transport. The sharp source estimate and the transport adapt the corresponding proofs in the companion on cylinder weights [10] Theorem 4.3 and Lemma 5.2; their regularity, density, and contour hypotheses are verified in the magnetic coordinates. Finally it combines the trial gain, determinant, reference normalization, explicit particles and denominator, and sums the resulting positive marked-pair estimate over planar polygons. The one-arc argument needs less accuracy and consequently remains valid on its larger parameter domain.

== 2 Finite cylinder vacua <sec:reference>

The marked contraction uses a finite normalized half-cylinder state. We specify that state and the local identities supplied by the companion [10]; the next section applies them to select a single polygon. The magnetic mean and all estimates for its contour integrals are proved after the finite identity has been established.

=== 2.1 The finite diagram model <the-finite-diagram-model>

Slots are vacant or occupied. A diagram pairs some of its occupied boundary slots by noncrossing curves. Composition glues matching slots; an occupancy mismatch or a closed loop gives zero. Tensor product juxtaposes diagrams, and transpose exchanges inputs and outputs. Set $lambda = pi \/ 8$, $beta = 2 lambda$, $q = e^(i beta)$, $c = cos \( 3 lambda \)$, $d = cos \( 2 lambda \)$ and $C_0 = cos lambda$. The two-slot operator $R \( v \)$ has the following coefficients:

$ L \( v \) & = sin \( 2 lambda + v \) sin \( 3 lambda + v \) \,\
A \( v \) & = d sin \( 3 lambda - v \) \/ L \( v \) \, & U \( v \) & = d sin v \/ L \( v \) \,\
B \( v \) & = sin v sin \( 3 lambda - v \) \/ L \( v \) \, & E \( v \) & = sin \( 3 lambda - v \) sin \( 2 lambda - v \) \/ L \( v \) \,\
F \( v \) & = sin \( v - lambda \) sin v \/ L \( v \) . $

They multiply, respectively, a single vertical connection, a cap or cup, a single diagonal connection, two vertical connections, and a cap together with a cup. The empty diagram has coefficient one; each single vertical or diagonal connection has two positions. The operator $S_2$ splits one slot into two: a vacancy becomes a vacancy plus $rho_(upright(v))$ times a cup, and an occupied strand can take either output with coefficient $rho_(upright(v))$. The zero-to-two-slot operator $S_3$ is a vacancy plus a cup. These conventions also define their spin representations in Section 3.

For a cyclic list $\( u_i \)_(1 lt.eq i lt.eq N)$ write $x_i = e^(2 i u_i)$ with $sqrt(x_i) = e^(i u_i)$, and set $D_0 \( x \, y \) = x^2 + y^2 + 2 d x y$. The normalized vacuum $U_N$ is the vector of half-cylinder matching weights with empty component one. Its matching basis has disk connectivity: compactify the vacant open end to a point and allow no strand to end there. This retains the ordinary noncrossing partial matchings even when a subsequent gluing produces a winding polygon. At physical parameters $u_i in { lambda \, 2 lambda }$ its series with vacant far boundary converges absolutely. Algebraically, $U_N = V_N \/ h_N$, where $V_N$ is homogeneous of degree $N \( N - 1 \) \/ 2$ and

#[#set math.equation(numbering: n => "(1)")
 $ h_N = product_(i < j) frac(D_0 \( x_i \, x_j \), x_i - x_j) "Pf" [frac(x_i^2 - x_j^2, D_0 \( x_i \, x_j \))] . $ <eq:vacuum-pfaffian>]

For odd $N$ append a last column of ones and its negative transpose; $h_0 = h_1 = 1$. In each slot, the vacant part of $V_N$ has degree at most $N - 1$, and the occupied part is $sqrt(x_i)$ times a polynomial of degree at most $N - 2$.

The finite identities we use are the Yang–Baxter relation, unitarity, $R \( j lambda \) = S_j S_j^(sans(t))$ for $j = 2 \, 3$, and the corresponding vacuum braid and splitting identities

$ U_N \( dots.h \, u_i \, u_(i + 1) \, dots.h \) & = R_i \( u_(i + 1) - u_i \) U_N \( dots.h \, u_(i + 1) \, u_i \, dots.h \) \,\
U_N \|_(u_(i + 1) = u_i + j lambda) & = S_j U_(upright("red")) . $

The merge replaces $\( q^(- 1) x \, q x \)$ by $x$; the deletion removes $\( x \, q^3 x \)$. The vacuum is cyclically covariant and covariant under reversing the row while replacing $u_i$ by $3 lambda - u_i$. Finally

$ h_N \( x_1^(- 1) \, dots.h \, x_N^(- 1) \) = h_N \( x_1 \, dots.h \, x_N \) product_i x_i^(- \( N - 1 \)) . $

These local, homogeneous-vacuum, and stationary-cylinder statements are supplied by [10] Proposition 2.2, Lemma 2.3, and Proposition 2.6. They hold as rational identities at generic complex parameters and continue at regular coincidences. In particular the right-half state is the same vacuum on the list $\( 3 lambda - u_i \)_i$. The distinction between the polynomial $h_N$ and the normalized physical state $U_N$ will matter in every marked identity below.

We record the scalar factors of the two reductions, since the marked contraction will be cleared on its original site list while the splitting identities act on longer lists. Define the centered scalar

$ tilde(h)_j \( x_1 \, dots.h \, x_j \) = h_j \( x_1 \, dots.h \, x_j \) product_(i = 1)^j x_i^(- \( j - 1 \) \/ 2) . $

For a spectator list $Z$ of length $j - 2$, the scalar reductions in [10] Proposition 2.2 and the proof of Lemma 2.3 give

#[#set math.equation(numbering: n => "(2)")
 $ frac(tilde(h)_j \( Z \, q^(- 1) x \, q x \), tilde(h)_(j - 1) \( Z \, x \)) & = 2 d product_(z in Z) frac(z + x, sqrt(z x)) \,\
frac(tilde(h)_j \( Z \, x \, y \), tilde(h)_(j - 2) \( Z \)) & = 2 c product_(z in Z) frac(\( z - q^(- 3) x \) \( z - q^6 x \), z sqrt(x y)) \, #h(2em) y = q^3 x . $ <eq:vacuum-centered-merge>]

Here and below the square roots follow the fixed spectral arguments. Indeed the uncentered factors are respectively $\( q^(- 1) + q \) x product_(z in Z) \( z + x \)$ and $\( x + y \) product_(z in Z) \( z - q^(- 3) x \) \( z - q^6 x \)$; centering and $x + y = 2 c sqrt(x y)$ give the displayed formulas. They hold first where the scalar quotients are defined and then as cleared identities.

== 3 The finite marked-pair identity <sec:06-magnetic-algebra>

The purpose of this section is to express the positive two-mark observable as an exactly normalized finite contour sum. The spin contraction selects one polygon, the dual covectors resolve its ordinary sites, and residue cancellation produces the contour identity.

We retain the periodic vacuum $U_N$, its polynomial normalization $h_N$, and the constants

$ lambda = pi / 8 \, #h(2em) beta = 2 lambda = pi / 4 \, #h(2em) q = e^(i beta) \, #h(2em) k = q^3 \, #h(2em) c = cos \( 3 lambda \) \, #h(2em) d = cos \( 2 lambda \) \, #h(2em) gamma = frac(pi, 3 beta) . $

The cyclic order of the sites in this section is $\[ p \, X \, p' \, Y \]$. The two marked objects $p \, p'$ are sites, or ports, and $X \, Y$ are the ordinary sites. Set

$ s = \| X \| \, #h(2em) b = \| Y \| \, #h(2em) n = s + b \, #h(2em) N = n + 2 \, #h(2em) sigma_i = cases(delim: "{", 1 & i in X \,, - 1 & i in Y .) $

Throughout, $n$ is even. At physical parameters let $cal(C) \( p \, p' \)$ be the sum of the weights of individual cylinder polygons visiting both marked ports. Each polygon has its original vertex-activity weight. Below, the symbol $rho$ will instead denote the probability density used to center the contour gas.

=== 3.1 A bilinear spin contraction <a-bilinear-spin-contraction>

Use the three-dimensional spin space with basis indexed by $0 \, + 1 \, - 1$, where $0$ denotes a vacancy. An ordered cup or cap has coefficient $k^h$ on the spins $h \, - h$ for $h in { + 1 \, - 1 }$, and a straight strand preserves its spin. These assignments represent composition of diagrams by ordinary matrix multiplication: two successive bends contribute $k^h k^(- h) = 1$, and a closed unmarked loop contributes $k^2 + k^(- 2) = 0$. All transposes and contractions here are bilinear, without complex conjugation. Each local box preserves total spin.

For the star list write $u_i^(*) = 3 lambda - u_i$ and $U^(*) = U_N \( \( u_i^(*) \)_i \)$. The star on this symbol thus denotes a parameter substitution, not an adjoint.

#thm([Lemma 3.1.])[
  (Marked spin contraction).  #emph[In the linear order starting at $p$, 
#[#set math.equation(numbering: n => "(3)")
 $ cal(C) \( p \, p' \) = sum_(upright(bold(h)) in { 0 \, plus.minus 1 }^(X union Y)) k^(- 2 sum_(i in X) h_i) thin U_(+ \, upright(bold(h))_X \, - \, upright(bold(h))_Y) thin U_(- \, upright(bold(h))_X \, + \, upright(bold(h))_Y)^(*) . $ <eq:06-spin-contraction>]

]
] <lem:06-spin-contraction>

#proof[
  First fix a pair of disk matching diagrams in the two half-cylinder vacua. Draw their common cut vertically upwards, with the sites in the stated order, and their matching arcs on the two sides of this line. The ket occupies the left side. Orient a left arc from $+$ to $-$, and a right arc from $-$ to $+$. Away from the marked ports the spin contractions concatenate directed arcs. At each marked port the two prescribed spins instead give the two endpoints of directed paths. Thus a nonzero assignment forces two disjoint simple directed arcs from $p$ to $p'$, constituting a single marked loop. Their directions are fixed, with no remaining factor of two.
  Every other loop avoids the marked loop and cannot separate its two marked points. Its algebraic crossing number through the cut interval $X$ is therefore zero. The twist in (3) does not change its orientation sum, which is the ordinary loop value $k^2 + k^(- 2) = 0$. It remains to compute the marked loop’s phase.
  Let $W$ be the sum of the tangent turns along its two directed arcs, and let $F_X$ be their total number of westward minus eastward crossings of $X$. The cup and cap coefficients contribute $k^(- W \/ pi)$, and the inserted twist contributes $k^(- 2 F_X)$. We claim that $W = - 2 pi F_X$. One may smooth the semicircular matching arcs at their joins. For a simple regular arc $Gamma$ from $p$ to $p'$, consider the direction of the chord $Gamma \( t \) - Gamma \( s \)$ on the triangle $s lt.eq t$. It extends continuously to its diagonal by the tangent direction. Since the triangle is simply connected, its argument has a continuous lift. Comparing its three boundary sides shows that the tangent turn equals the sum of the argument changes of $Gamma - p$ and $p' - Gamma$, with tangent limits at the vanishing endpoints.
  For $Gamma - p$, put the argument cut downwards. There are no sites below $p$, so the matching drawing has no crossings of this cut. The initial angles on the two arcs are $0 \, pi$, and the final angles are both $pi \/ 2$; their summed change is zero. For $p' - Gamma$, use the upward cut and the range $\( - 3 pi \/ 2 \, pi \/ 2 \)$. The sums of the initial and final one-sided angle limits are both $- pi$. Each algebraic crossing of the cut contributes $- 2 pi$, giving total change $- 2 pi F_X$. This proves the claim, so the marked loop has phase one.
  The disk matching drawing is also valid when the resulting polygon winds around the cylinder: no vacuum strand runs to an infinite end. Finally the absolute convergence of the physical half-cylinder vacuum sums allows the diagram-by-diagram calculation to be summed. ◻
]

=== 3.2 The finite algebra of the marked pair <the-finite-algebra-of-the-marked-pair>

Put $a_i = 2 i u_i$, $x_i = e^(a_i)$, and

$ P_j \( v \) = - 2 sinh #h(-0.16667em) (frac(v + i j beta, 2)) . $

We retain the centered normalization $tilde(h)_j$ from Section 2. The finite gas integral $I$ has the following factors and contours. Within a group, its site–site, particle–site and particle–particle factors are respectively $B_s \, F_s \, E_s$; across groups they are $B_c \, F_c \, E_c$:

$ B_s = P_2 P_(- 2) P_3 P_(- 3) \, & F_s = \( P_1 P_(- 1) \)^(- 1) \, & E_s = P_0^2 P_2 P_(- 2) F_s \,\
B_c = P_2^2 P_3^2 \, & F_c = P_1^(- 2) \, & E_c = P_0^2 P_2^2 F_c . $

The within-group factors are even. Across groups, evaluate each factor at the $X$ coordinate minus the $Y$ coordinate. For each group there are main singletons, far singletons, and far doubles, of elementary multiplicities $1 \, 1 \, 2$. A double has one real integration variable and two fixed imaginary shifts. After a common shift, the ordinary $X$ sites and both marks have heights $0$ or $beta$, and the ordinary $Y$ sites have height zero. Real site offsets are first generic and distinct. The horizontal contours have the following heights, in units of $beta$:

$ & X & Y\
upright("main singleton") & 1 \/ 2 & 0\
upright("far singleton") & 25 \/ 8 & - 7 \/ 2\
upright("far double") & \( 3 + epsilon \, 4 + epsilon \) & \( - 3 \, - 4 \) . $

Here $epsilon > 0$ is fixed and sufficiently small, and all horizontal lines are oriented from left to right. Lemma 6 will justify their deformation and confluence, including the curved main $X$ contour used later. Multiply all site–site factors, all particle–site factors and all interactions between distinct elementary particles, omitting the internal pair of each double. Integrate each real variable with measure $d v \/ \( 2 pi \)$ (the curved main differential is used after deformation). For species counts $n_sigma \, f_sigma \, d_sigma$, include the activity and factorial factor

$ product_(sigma = plus.minus 1) frac(p_sigma^(n_sigma) \( - p_sigma \)^(f_sigma) \( 4 c^2 p_sigma^2 \)^(d_sigma), n_sigma ! f_sigma ! d_sigma !) . $

Sum only through total elementary degree at most $n$. This defines $I$ as a finite polynomial of contour integrals, not as an infinite activity expansion.

Only $X union Y$ supplies sites to this gas. A double is always interpreted as its two elementary particles when a product over particles is written. The marked-site insertion is

#[#set math.equation(numbering: n => "(4)")
 $ cal(T) = product_(a in { a_p \, a_(p') }) [product_(i in X union Y) P_(2 sigma_i) \( a_i - a \) P_(3 sigma_i) \( a_i - a \) product_(v med upright("elementary")) frac(P_(- 4 sigma_v) \( v - a \), P_(sigma_v) \( v - a \))] . $ <eq:06-insertion>]

The two marks are treated separately, even when their spectral parameters agree. Write $I \( cal(T) \)$ for the integral with this additional factor. These finite integrals are absolutely convergent. Indeed, if a cluster of elementary degree $r gt.eq 1$ in a term of total degree $m lt.eq n$ is translated to either infinity, the site factors supply $e^(- n r \| v \|)$ and its interactions with the other particles supply $e^(r \( m - r \) \| v \|)$. Thus its tail is $O \( e^(- r \( n - m + r \) \| v \|) \)$. The marked insertion ratios are bounded at both ends. Ordering the real integration coordinates and applying this estimate to each separating gap proves joint integrability; after combining the factors of each double, the specified contours avoid every pole. Only degrees $n$ and $n - 1$ will be used, respectively, for marked polygons and one arc.

#thm([Theorem 3.2.])[
  (Marked-pair contour identity).  #emph[At the physical parameters, and by continuation at regular complex parameters on the contours of Lemma 6, 
#[#set math.equation(numbering: n => "(5)")
 $ tilde(h)_N^2 cal(C) \( p \, p' \) = \( 2 c \)^2 \( 2 d \)^n sum_(M = - min \( s \, b \))^(min \( s \, b \)) \( - 1 \)^(s b + M) \[ p_(+)^(thin s - M) p_(-)^(thin b + M) \] I \( cal(T) \) . $ <eq:06-marked-identity>]

 Here $p_(+) \, p_(-)$ are formal activities, unrelated to the marked port $p$.]
] <thm:06-marked-identity>

We prove the finite algebra first. Its two ingredients are stated separately to make clear where the normalization in (5) enters.

#thm([Lemma 3.3.])[
  (A complete pair of dual covector families).  #emph[Fix one ordinary group of sign $sigma$, containing $g$ sites. For each $ell in { 1 \, 0 \, - 1 }^g$, construct a covector $D_ell$ as follows. Split a site with $ell_j = 0$ by $S_2$ into arguments $u_j - lambda \, u_j + lambda$, with relative signs $+ \, -$. An unsplit site retains its sign $ell_j$. Stably braid the resulting roots into pluses followed by minuses, and project their spins to $sigma$ times their relative signs. On the star list, use signs $- \, +$ in each split, stably sort minuses before pluses, and project in the same relative-spin convention; call the resulting covector $D_ell^(*)$.]
  #emph[At generic arguments, 
#[#set math.equation(numbering: n => "(6)")
 $ D_ell \( D_r^(*) \)^(sans(t)) = upright(bold(1))_(ell = r) thin d_ell \, #h(2em) d_ell = product_(z med upright(p l u s med r o o t)\
w med upright(m i n u s med r o o t)) F \( u_w - u_z \) . $ <eq:06-biorthogonality>]

 Here $F$ is the local cap–cup box coefficient, rather than a site–particle gas factor. In particular $d_ell eq.not 0$ generically, and these $3^g$ covectors give a complete bilinear resolution of the identity. Each covector has input charge $sigma sum_j ell_j$.]
] <lem:06-dual-covectors>

#proof[
  The root lists associated with a site and its star correspond under $u mapsto 3 lambda - u$ with the same relative signs. The splitting relation transports an exchange of two underlying sites to the exchange of their two blocks of roots. After sorting, this agrees with the original sorting up to exchanges within a fixed sign class. The latter act on the projected spin by the nonzero scalar $E$. The Yang–Baxter, unitarity, and disjoint-commutation identities show that different reduced sequences for the same permutation agree. This comparison may first be made with generic roots: none of the braids being compared exchanges the two roots of the same split, so specialization to a split is legitimate. The transports of the real and star lists cancel in their bilinear pairing by symmetry and unitarity. Consequently the vanishing or nonvanishing of $D_ell \( D_r^(*) \)^(sans(t))$ is unchanged when the same permutation is applied to the underlying sites of both lists.
  If $ell_j > r_j$, put site $j$ first. A leading plus root on one side and a leading minus root on the other are then untouched by sorting. At least one of these two sites is unsplit. It forces its input spin, whereas a leading root of a split can arise only from vacancy or from the input spin of that root. These conditions are incompatible. If $ell_j < r_j$, use the analogous argument with site $j$ last. This proves the off-diagonal vanishing.
  On the diagonal, replace each $S_2 S_2^(sans(t))$ by $R \( 2 lambda \)$. The remaining network sorts the minuses-first list into the pluses-first list. Each opposite-sign pair crosses once, and no equal-sign pair needs to cross. Follow the first plus through all the minuses. At any crossing it can only transfer charge to the new minus; because its final spin is again the maximal plus spin, it cannot make such a transfer. Each crossing therefore has the interchanged-spin coefficient $F$. Removing this strand and repeating proves the product in (6). It is nonzero at generic arguments. Since there are exactly $3^g$ covectors in a $3^g$-dimensional space, the two families are bases. Explicitly their identity resolution is
  $ "Id" = sum_ell frac(\( D_ell^(*) \)^(sans(t)) D_ell, d_ell) . $
  ◻
]

#thm([Lemma 3.4.])[
  (Two occupied spin blocks).  #emph[For a list of $2 m$ sites in linear order and $d_0 in { 1 \, - 1 }$, 
#[#set math.equation(numbering: n => "(7)")
 $ tilde(h)_(2 m) thin U_(d_0^m \( - d_0 \)^m) = \( 2 c thin k^(d_0) \)^m product_(i < j\
i \, j med upright(i n med t h e med s a m e med b l o c k)) P_2 \( a_i - a_j \) P_3 \( a_i - a_j \) . $ <eq:06-two-blocks>]

 Also $tilde(h)_j$ is unchanged on replacing its entire list by the star list.]
] <lem:06-two-blocks>

#proof[
  Within either equal-spin block, fusion at the ascending differences $2 lambda \, 3 lambda$ makes the amplitude vanish. For nonadjacent sites move them together by braid covariance; equal-spin exchanges are scalars, so the same zeros hold. For any occupied slot the centered polynomial degree bound has exactly the degree supplied by these two factors for each of the other $m - 1$ sites in its block. Thus their product exhausts the degree in every slot, leaving a constant depending only on $m \, d_0$.
  Determine the constant by deleting the adjacent pair across the two blocks at multiplicative arguments $x \, y = q^3 x$. In the centered deletion quotient (2), each spectator factor is the negative of its removed same-block $P_2 P_3$ factor. There are $2 m - 2$ spectators, so these signs multiply to one. The inserted cup contributes $k^(d_0)$. The constant therefore satisfies $C_m = \( 2 c thin k^(d_0) \) C_(m - 1)$, with $C_0 = 1$, proving (7). Finally reciprocity of $h_j$, together with its homogeneity, gives the asserted equality of the centered normalizations. ◻
]

#proof[
  Resolve the contractions on $X$ and $Y$ with Lemma 4. The twist acts by a scalar on each charge subspace. Total spin conservation, including the marked spins, leaves exactly
  $ sum_(i in X) ell_i = sum_(i in Y) ell_i . $
  Splitting and braid covariance of the normalized vacuum identify the resulting projected amplitudes with amplitudes on the sorted root lists. Write $X_plus.minus \, Y_plus.minus$ for the roots with the indicated relative signs. Move the ket tail $Y_(-)$ to the front, and the bra tail $Y_(+)$ to the front. The ket blocks are $\[ Y_(-) \, p \, X_(+) \]$, $\[ X_(-) \, p' \, Y_(+) \]$, while the bra blocks are $\[ Y_(+) \, p \, X_(-) \]$, $\[ X_(+) \, p' \, Y_(-) \]$. Both pairs have equal block sizes.
  Cyclic covariance is an identity of matching diagrams. In the spin embedding, moving a tail to the front reverses the endpoint order exactly for cups joining the tail to its complement. If the tail endpoint has spin $h$, its old coefficient divided by its new one is $k^(- 2 h)$. Cups internal to the tail have total spin zero. Thus a moved tail of total spin $H$ changes the amplitude, old order relative to new order, by $k^(- 2 H)$. For the two tails above the product is $k^(2 sum_Y ell_i)$, canceling the original twist. The phases in the two constants of (7) also cancel. We next record all remaining factors, including the divisors from the change of normalization.
  At an ordinary site of label $ell$, encode each root by its relative sign $e$ and its shift $h$, so that its log coordinate is $a_i + i h beta$:
  $ cal(R) \( 1 \) = { \( 1 \, 0 \) } \, #h(2em) cal(R) \( - 1 \) = { \( - 1 \, 0 \) } \, #h(2em) cal(R) \( 0 \) = { \( 1 \, - 1 \) \, \( - 1 \, 1 \) } . $
  Clearing $tilde(h)_N^2$ on the original list, instead of the expanded list, divides by the squares of (2). Since $\( 2 d \)^2 = 2$ and $P_4 \( log \( z \/ x \) \) P_(- 4) \( log \( z \/ x \) \) = \( z + x \)^2 \/ \( z x \)$, each expanded site contributes a scalar divisor $2$, and a spectator divisor $P_4 P_(- 4)$. For two ordinary sites this divisor occurs once if exactly one is expanded; if both are expanded, it occurs at shifts $- 1 \, 0 \, 1$ of their log difference. The diagonal $d_ell$ also contains, within every expansion, $F \( 2 lambda \) = \( 2 c \)^2 \/ 2$. If $z$ sites are expanded, the total number of occupied roots including the marks is $N + z$. The two block constants contribute $\( 2 c \)^(N + z)$, and the scalar divisors contribute $\( 2 c \)^(2 z)$. Their quotient is therefore
  $ \( 2 c \)^(N - z) = \( 2 c \)^2 \( 2 c \)^(sum_i ell_i^2) . $
  For an ordered ordinary pair with groups $sigma \, omega$, multiply the following factor over $\( e \, h \) in cal(R) \( ell \)$, $\( f \, g \) in cal(R) \( r \)$, evaluating it at shift $h - g$ of the log difference:
  $ upright("condition") & upright("factor")\
sigma = omega \, med f = e & P_2 P_3 P_(- 2) P_(- 3)\
sigma = omega \, med f = - e & P_(- 2 e) P_(- 3 e) \/ \( P_e P_0 \)\
sigma = 1 \, med omega = - 1 \, med f = - e & P_(- 2 e)^(thin 2) P_(- 3 e)^(thin 2)\
upright("otherwise") & 1 . $
  A string of length $a$ at a group-$sigma$ site $a_i$ consists of particles at $a_i + i sigma j beta$, $1 lt.eq j lt.eq a$; length zero means the empty string. Divide by the merge divisors just specified. The result is precisely the ordinary mutual string product with lengths $1 + sigma ell \, 1 + omega r$, multiplied by $1$ within a group and $\( - 1 \)^(1 - ell r)$ between groups. Here is an exponent check that also fixes the signs. Encode $product_j P_j \( v \)^(m_j)$ by the Laurent polynomial $sum_j m_j xi^j$; shifting $v$ by $i h beta$ multiplies this polynomial by $xi^h$. For string lengths $a \, b'$, put
  $ A = sum_(h = 1)^a xi^(sigma h) \, #h(2em) D = sum_(h = 1)^(b') xi^(- omega h) . $
  The string polynomial is $B - F \( A + D \) + E A D$, where
  $ & B & F & E\
sigma = omega & xi^2 + xi^(- 2) + xi^3 + xi^(- 3) & xi + xi^(- 1) & 2 + xi^2 + xi^(- 2) - xi - xi^(- 1)\
sigma = 1 \, omega = - 1 & 2 xi^2 + 2 xi^3 & 2 xi & 2 + 2 xi^2 - 2 xi . $
  Subtract this polynomial from the root-product polynomial and subtract $xi^4 + xi^(- 4)$ at every divisor shift. The result is zero within either group. Across groups it is the following matrix, with rows and columns in the order $+ \, 0 \, -$:
  $ mat(delim: "(", 0, b_4 + 2 b_5, 2 b_5 + 2 b_6; - b_4, b_4 + b_3 - b_5, b_4 + 2 b_5; 0, - b_4, 0) \, #h(2em) b_j = xi^(j - 8) - xi^j . $
  Since $P_(j - 8) = - P_j$, each $b_j$ contributes a minus sign. The displayed matrix gives exactly $\( - 1 \)^(1 - ell r)$.
  A root $\( e \, h \)$ interacts with either marked spectator $a$ by $P_(- 2 e) P_(- 3 e)$, at shift $h$. Dividing by the merge divisor when necessary gives, for $ell = 1 \, 0 \, - 1$, respectively,
  $ P_(- 2) P_(- 3) \, #h(2em) P_(- 3) P_3 \, #h(2em) P_2 P_3 $
  at $a_i - a$. Substituting the strings of lengths $1 + sigma ell$ in (4) gives these same three factors. There is no marked–marked pair factor: the two marks lie in different blocks in both amplitudes.
  Set $M = - sum_X ell_i = - sum_Y ell_i$. The particle totals are $s - M \, b + M$, and the cross signs multiply to
  $ \( - 1 \)^(s b - \( sum_X ell_i \) \( sum_Y ell_i \)) = \( - 1 \)^(s b - M^2) = \( - 1 \)^(s b + M) . $
  To compute the string weights, move a group-$sigma$ main line toward its far line, in direction $sigma$. With measure $d v \/ \( 2 pi \)$, the old integral equals the new one plus $i sigma$ times the sum of enclosed residues. Directly from the $P_j$ factors,
  #[#set math.equation(numbering: n => "(8)")
   $ "Res"_(v = i sigma beta) F_s \( v \) = frac(1, 2 i sigma d) \, #h(2em) "Res"_(v = i sigma beta) E_s \( v \) = 4 i sigma c^2 \, #h(2em) F_s \( 2 i sigma beta \) = - frac(1, 2 d) . $ <eq:06-string-residues>]
  Consequently the empty, one-root, and two-root residues are
  $ r_0 = 1 \, #h(2em) r_1 = frac(1, 2 d) \, #h(2em) r_2 = r_1 \( - 4 c^2 \) (- frac(1, 2 d)) = c^2 / d^2 . $
  For two identical particles, the two choices of the first root cancel their factorial $2 !$. The numbers of strings of lengths zero and two are equal because the total elementary count is $n$. Thus $\( 2 d \)^n product_i r_(1 + sigma_i ell_i) = \( 2 c \)^(sum_i ell_i^2)$. This proves (5) for the finite string sum. The following contour argument completes the proof. ◻
]

=== 3.3 The magnetic contours <the-magnetic-contours>

It remains to show that the contours defining $I$ produce exactly the strings used in the finite calculation, and that they permit the later deformation of the main $X$ line.

#thm([Lemma 3.5.])[
  (Admissible contour deformation).  #emph[These contours give the string sum in (5). The main $X$ contour may further be replaced by any smooth graph with bounded derivative and heights in $\[ beta \/ 2 \, beta \)$. Height $beta$ is allowed when all $X$ sites have that height. The identity passes to coinciding real offsets.]
] <lem:06-contours>

#proof[
  Write $A = 25 \/ 8$, $C' = 7 \/ 2$. First move the double heights to $\( A - 1 \, A \)$ in $X$ and $\( - C' + 1 \, - C' \)$ in $Y$. Then move the main contours to their far-singleton contours. The same-group site poles produce strings of lengths $0 \, 1 \, 2$. There is room for both roots before the endpoint in each case, including for a site of height $beta$ in $X$. An attempted third root is separated by $2 i sigma beta$ from the first; the zero of $P_(- 2 sigma)$ in their interaction cancels the pole from the second root. Thus no longer string occurs. The inequality $A + C' < 7$ excludes cross-group singleton poles. The interaction of a double with another particle has no poles: up to translation of the argument, the fused factors are
  $ E_s \( v \) E_s \( v + i beta \) = P_0 \( v \) P_1 \( v \) P_(- 2) \( v \) P_3 \( v \) \, #h(2em) E_c \( v \) E_c \( v + i beta \) = P_0 \( v \)^2 P_3 \( v \)^2 . $
  Together with the stated heights, these identities make the double movements regular. Finally $P_(sigma_v) \( v - a \)^(- 1)$ introduces no crossed pole on any of these paths. These observations also exclude poles during the subsequent deformation of the main $X$ contour, including interactions of two moving main particles.
  For completeness, the cancellation on the far contours is coefficientwise in $p_(+) \, p_(-)$. An unpicked main singleton cancels an original far singleton because their activities sum to zero. A main particle at $v$ attaching to an original far singleton at $w$ crosses the opposite pole, $v - w = - i sigma beta$. Its oriented residue is $i sigma "Res"_(z = - i sigma beta) E_s \( z \) = 4 c^2$, by (8) and evenness of $E_s$. It therefore produces a double canceling the original double:
  $ 4 c^2 p_sigma^2 + 4 c^2 \( - p_sigma \) p_sigma = 0 . $
  The factorial measures give precisely the binomial coefficients for mixing these two origins of each final species. Thus only site-bound strings remain.
  There are $n$ ordinary sites and $n$ elementary particles in each coefficient under consideration. The original confinement argument therefore gives simultaneous exponential integrability at infinity. Every factor from the marked insertion is bounded there, and fused residues have the same confinement. One may consequently perform the one-variable deformations and cancellations under all spectator integrals. Continuing from generic distinct offsets gives confluence: the physical transfer and its normalized vacuum are regular there, while the contour integrals remain absolutely convergent. Together with the finite calculation above, this completes the proof of Theorem 3. ◻
]

== 4 A denominator bound without balanced multiplicities <sec:denominator>

The contour numerator is normalized by a vacuum polynomial. Its lower bound must hold even when nearly every site has the same height. We prove that uniform statement before analyzing the numerator. The proof uses a positive Pfaffian integral and a Cauchy interpolation formula; there is no comparison of unequal multiplicities to a balanced list.

Define

$ H_(*) \( u \) = frac(e^(2 u) + 2 d e^u + 1, \( e^u - 1 \) e^(u \/ 2)) tanh \( gamma u \/ 2 \) \, $

with its removable value at $u = 0$.

#thm([Theorem 4.1.])[
  (Uniform denominator lower bound).  #emph[For every even integer $N gt.eq 2$, let all $N$ site logs, including the marks, be purely imaginary with heights in ${ 0 \, beta }$. Uniformly in their two multiplicities, as $N arrow.r oo$, 
#[#set math.equation(numbering: n => "(9)")
 $ log lr(|frac(tilde(h)_N^2, \( gamma \/ 2 \)^N product_(i < j) H_(*) \( a_i - a_j \)^2)|) gt.eq (5 / 24 - o \( 1 \)) log N . $ <eq:06-denominator>]

]
] <thm:06-denominator>

#proof[
  A common shift leaves the ratio unchanged. Center the sites so that $\| Im a_i \| lt.eq beta \/ 2$, and initially take distinct imaginary sites anywhere in this interval. The Pfaffian formula for $h_N$ and the reference Pfaffian product formula show that, before dividing by $\( gamma \/ 2 \)^N$, the cleared ratio is
  $ (frac("Pf" \[ f \( a_i - a_j \) \], "Pf" \[ f_0 \( a_i - a_j \) \]))^2 \, #h(2em) f \( u \) = frac(sinh u, cosh u + d) \, quad f_0 \( u \) = tanh \( gamma u \/ 2 \) . $
  The odd kernels have the convergent integral representations
  $ f_0 \( u \) & = integral_0^oo \( e^(i k u) - e^(- i k u) \) thin frac(d k, i gamma sinh \( 3 beta k \)) \,\
f \( u \) & = gamma / 2 integral_0^oo \( e^(i k u) - e^(- i k u) \) (1 + frac(1, 2 cosh \( 2 beta k \))) frac(d k, i gamma sinh \( 3 beta k \)) . $
  They hold on all differences being used. They follow, for example, by Fourier transforming the integrable derivatives and then integrating; oddness fixes the integration constant. At $k = 0$ the difference of exponentials cancels the measure’s simple pole, and at infinity the available strip widths give absolute convergence.
  Put $m = N \/ 2$. Expanding the $m$-th exterior power of these kernels gives a Pfaffian integral over $0 < k_1 < dots.h.c < k_m$, whose integrand is the determinant with column pairs $\( e^(i k_j a_i) \, e^(- i k_j a_i) \)$, times the product of the corresponding measures. This is the exterior-power form of the determinant–Pfaffian integration identity [1]. Taking a difference within each column pair proves absolute convergence near zero. Writing $a_i = i y_i$, all entries of this determinant are real exponentials. With $y_i$’s ordered, the determinant never vanishes when the $2 m$ exponents are distinct: a nontrivial linear combination of $r$ exponentials with distinct real exponents has at most $r - 1$ real zeros, by dividing by its first exponential and applying Rolle’s theorem inductively. After fixing the column order, the determinant therefore has a fixed sign on the chamber. The sign argument is a real-exponential instance of the total-positivity principle; compare the variation-diminishing background in [11]. Here the elementary Rolle induction gives the strict sign needed for these specific nodes. Removing its constant phase gives a probability measure $bb(P)_0$ from the reference integrand.
  Define
  $ S \( k \) = log (1 + frac(1, 2 cosh \( 2 beta k \))) . $
  The normalized Pfaffian ratio is $bb(E)_0 exp \( sum_(j = 1)^m S \( k_j \) \)$. Consequently Jensen’s inequality gives
  #[#set math.equation(numbering: n => "(10)")
   $ log lr(|frac(tilde(h)_N^2, \( gamma \/ 2 \)^N product_(i < j) H_(*) \( a_i - a_j \)^2)|) gt.eq 2 bb(E)_0 sum_(j = 1)^m S \( k_j \) . $ <eq:06-jensen>]
  To evaluate the right side, deform the reference spectral measure by $1 + t S \( k \)$, and denote its odd kernel by $f_t$. The logarithmic derivative at zero of $\( "Pf" f_t \/ "Pf" f_0 \)^2$ is exactly this right side.
  Adding any constant all-ones matrix to an even-size skew matrix does not change its determinant. Indeed the rank-one determinant identity gives the multiplier $1 + c thin upright(bold(1))^(sans(t)) A^(- 1) upright(bold(1)) = 1$ for invertible skew $A$, and the identity follows in general by polynomial continuation. Add the constant $1 + t S \( 0 \)$ to $f_t$, and conjugate the difference kernel by $e^(- gamma u \/ 2)$. At $t = 0$ this gives
  $ K \( u \) = "sech" \( gamma u \/ 2 \) \, #h(2em) hat(K) \( k \) = frac(2 pi, gamma) "sech" \( 3 beta k \) . $
  The derivative kernel $J$ has transform
  $ hat(J) \( k \) = hat(K) \( k \) T \( k \) \, #h(2em) T \( k \) = S \( k - i gamma \/ 2 \) . $
  For justification, the derivative before conjugation is the convolution of $f_0 + 1$ with the inverse transform of $S$: the added constant is exactly its constant term $S \( 0 \)$. The function $1 + 1 \/ \( 2 cosh \( 2 beta k \) \)$ is holomorphic and nonzero in $\| "Im" k \| < pi \/ \( 4 beta \)$: the first zero of $2 cosh \( 2 beta k \)$ is on that strip boundary, and the first zero of $2 cosh \( 2 beta k \) + 1$ has imaginary height $pi \/ \( 3 beta \)$. Thus $S$ extends to this strip as the holomorphic logarithm that is real on the real axis. It decays exponentially on smaller closed strips, and $gamma \/ 2 = pi \/ \( 6 beta \)$ lies inside this strip. Thus the conjugation shifts the multiplier as displayed.
  Let $K \[ a \]$ be the matrix $K \( a_i - a_j \)$, and put $L_0 = gamma^(- 1) log N$. We will show, uniformly in the node positions,
  #[#set math.equation(numbering: n => "(11)")
   $ frac("Tr" \( K \[ a \]^(- 1) J \[ a \] \), 2 L_0) arrow.r integral_(bb(R)) T \( k \) thin frac(d k, 2 pi) . $ <eq:06-trace-limit>]
  This uses interpolation directly and hence requires no symmetry of the two site multiplicities. The Cauchy determinant formula gives
  $ G \( z \, w \) & := K \[ z \, a \] K \[ a \]^(- 1) K \[ a \, w \]\
 & = K \( z - w \) #scale(x: 120%, y: 120%)[\(] 1 - B \( z \) B \( w \) #scale(x: 120%, y: 120%)[\)] \,\
B \( z \) & = product_(i = 1)^N frac(e^(gamma z) - e^(gamma a_i), e^(gamma z) + e^(gamma a_i)) . $
  This identity follows by applying the bordered Cauchy determinant formula to the interpolation error; its one-point factors are those in the displayed product.
  Choose $beta \/ 2 < h < beta$, and define a smooth integrable function $g$ by
  $ hat(g) \( - k \) = frac(T \( k \), hat(K) \( k \) thin 2 cosh \( 2 h k \)) . $
  The symbol and all its derivatives decay exponentially because $2 h > beta$. Expanding the finite interpolation sum and applying Fourier inversion in $x$ gives
  #[#set math.equation(numbering: n => "(12)")
   $ "Tr" \( K \[ a \]^(- 1) J \[ a \] \) = sum_plus.minus integral_(bb(R)) integral_(bb(R)) G \( x + r \/ 2 plus.minus i h \, x - r \/ 2 minus.plus i h \) thin g \( r \) thin d r thin d x . $ <eq:06-interpolation-trace>]
  In fact the $x$-integration of the product of its two $K$’s has symbol $hat(K) \( k \)^2 e^(minus.plus 2 h k)$; summing signs and integrating $r$ leaves $hat(K) \( k \) T \( k \)$, which is precisely $J$. All shifts stay within the regular strips.
  For $z = x plus.minus i h$ and $a_i = i y_i$, $\| y_i \| lt.eq beta \/ 2$, put $c_0 = cos \( gamma \( h + beta \/ 2 \) \) > 0$. If $r = e^(gamma x)$ and $theta.alt_i = gamma \( plus.minus h - y_i \)$, the squared modulus of the $i$th factor of $B$ is
  $ frac(r^2 + 1 - 2 r cos theta.alt_i, r^2 + 1 + 2 r cos theta.alt_i) \, #h(2em) cos theta.alt_i gt.eq c_0 . $
  Every factor has modulus at most one. The inequality $r \/ \( r + 1 \)^2 gt.eq min \( r \, r^(- 1) \) \/ 4$ and telescoping products give, uniformly in the nodes,
  $ \| B \( z \) \| lt.eq exp \( - c_1 N e^(- gamma \| x \|) \) \, #h(2em) \| 1 - B \( z \) \| lt.eq C_1 N e^(- gamma \| x \|) quad upright("in the two tails") . $
  The second bound at the negative end uses that $N$ is even. It follows that for each fixed $r$
  $ frac(1, 2 L_0) integral_(bb(R)) \[ 1 - B \( x + r \/ 2 plus.minus i h \) B \( x - r \/ 2 minus.plus i h \) \] thin d x arrow.r 1 . $
  Indeed in $\| x \| lt.eq \( 1 - delta \) L_0$ the product tends uniformly to zero, while outside $\| x \| lt.eq \( 1 + delta \) L_0$ the tail integral is negligible. The transition region costs $O \( delta L_0 \)$. These estimates are uniform in the node positions. The normalized absolute integral is also bounded independently of $r$: use $\| 1 - B \( z \) B \( w \) \| lt.eq \| 1 - B \( z \) \| + \| 1 - B \( w \) \|$ and translate each bound. Since $g \( r \) K \( r plus.minus 2 i h \)$ is integrable, dominated convergence in (12) proves (11).
  The same uniform estimates pass to coincident nodes. One can take divided differences in the finite interpolation matrices, or first take limits in the Pfaffian inequality: after clearing the Vandermonde factors, the ratios are continuous by polynomiality. Explicitly, on an allowed difference $u = i y$, $\| y \| lt.eq beta$,
  $ H_(*) \( i y \) = \( cos y + d \) tan \( gamma y \/ 2 \) \/ sin \( y \/ 2 \) \, $
  with removable value $gamma \( 1 + d \) > 0$ at zero; it is finite and nonzero on the entire interval. We pass to the limit in this cleared scalar ratio, not in the inverse interpolation matrix. The uniform positive lower bound obtained above prevents loss to zero in this limit.
  Finally shift the integral of $T$ back to the real line. For $k > 0$, setting $y = e^(- 2 beta k)$ gives
  $ S \( k \) = log \( 1 - y^3 \) - log \( 1 - y \) - log \( 1 + y^2 \) . $
  Integration of the absolutely integrable logarithmic series yields
  $ integral_(bb(R)) S \( k \) thin d k = frac(5 pi^2, 72 beta) . $
  Combining (10) and (11), and using $gamma beta = pi \/ 3$, gives
  $ 2 L_0 thin frac(5 pi^2, 72 beta) thin frac(1, 2 pi) = 5 / 24 log N \, $
  which proves (9). ◻
]

== 5 A positive magnetic mean and coercive energy <sec:magnetic-mean>

To estimate the contour sum, we center its ordinary particles by a positive measure. A curved contour makes that measure real and positive. The second part of the section proves that its real interaction controls all species, uniformly when the contour approaches a boundary line.

=== 5.1 The contour carrying a positive magnetic mean <the-contour-carrying-a-positive-magnetic-mean>

From this point onward all real site offsets vanish. Among the ordinary $X$ sites, a fraction $t in \[ 1 \/ 2 \, 1 \]$ has height $beta$, and the rest have height zero. All ordinary $Y$ sites have height zero, and either mark may have either height. The contour construction and the constants in the energy estimates do not depend on the site counts; the centering identities hold exactly for each pair of counts. For the geometric comparison in Figure 1, write

$ L_X = frac(log s, gamma) \, #h(2em) L_Y = frac(log b, gamma) . $

These logarithmic wall intervals constrain the later particle estimates; they are distinct from the contour carrying the mean.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.29, 0), (3.29, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.29, 0), [#text(size: 9pt)[$u$]], anchor: "west", padding: 0.1176cm)
  line((-3.008, 0.8925), (3.008, 0.8925), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-3.008, 1.785), (3.008, 1.785), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-3.008, 0.8925), [#text(size: 9pt)[$beta"/"2$]], anchor: "east", padding: 0.1176cm)
  content((-3.008, 1.785), [#text(size: 9pt)[$beta$]], anchor: "east", padding: 0.1176cm)
  line((-3.008, 1.683), (-2.932, 1.683), (-2.856, 1.683), (-2.78, 1.683), (-2.703, 1.683), (-2.627, 1.683), (-2.551, 1.683), (-2.475, 1.683), (-2.399, 1.683), (-2.323, 1.683), (-2.246, 1.683), (-2.17, 1.683), (-2.094, 1.683), (-2.018, 1.683), (-1.942, 1.683), (-1.866, 1.683), (-1.79, 1.683), (-1.713, 1.683), (-1.637, 1.683), (-1.561, 1.682), (-1.485, 1.682), (-1.409, 1.681), (-1.333, 1.68), (-1.257, 1.678), (-1.18, 1.675), (-1.104, 1.67), (-1.028, 1.663), (-0.9519, 1.654), (-0.8757, 1.641), (-0.7996, 1.625), (-0.7234, 1.605), (-0.6473, 1.58), (-0.5711, 1.552), (-0.495, 1.521), (-0.4188, 1.489), (-0.3427, 1.458), (-0.2665, 1.429), (-0.1904, 1.405), (-0.1142, 1.387), (-0.03808, 1.378), (0.03808, 1.378), (0.1142, 1.387), (0.1904, 1.405), (0.2665, 1.429), (0.3427, 1.458), (0.4188, 1.489), (0.495, 1.521), (0.5711, 1.552), (0.6473, 1.58), (0.7234, 1.605), (0.7996, 1.625), (0.8757, 1.641), (0.9519, 1.654), (1.028, 1.663), (1.104, 1.67), (1.18, 1.675), (1.257, 1.678), (1.333, 1.68), (1.409, 1.681), (1.485, 1.682), (1.561, 1.682), (1.637, 1.683), (1.713, 1.683), (1.79, 1.683), (1.866, 1.683), (1.942, 1.683), (2.018, 1.683), (2.094, 1.683), (2.17, 1.683), (2.246, 1.683), (2.323, 1.683), (2.399, 1.683), (2.475, 1.683), (2.551, 1.683), (2.627, 1.683), (2.703, 1.683), (2.78, 1.683), (2.856, 1.683), (2.932, 1.683), (3.008, 1.683), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((0.658, 1.147), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$z(u)=u+i beta theta (u)$]]], anchor: "west", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((0, 1.377), (0, 1.785), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0.047, 1.785), [#text(size: 9pt)[$d_0$]], anchor: "south-west", padding: 0.1176cm)
  content((0, -0.5525), [#text(size: 9pt)[Positive mean on the curved $X$ contour]])
  rect((-2.82, -4.072), (-1.692, -3.673), fill: rgb("#ffe6cc"), stroke: none)
  rect((-1.692, -4.072), (1.692, -3.673), fill: rgb("#e0e0ff"), stroke: none)
  rect((1.692, -4.072), (2.82, -3.673), fill: rgb("#ffe6cc"), stroke: none)
  line((-3.29, -4.2), (3.29, -4.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.29, -4.2), [#text(size: 9pt)[$u$]], anchor: "west", padding: 0.1176cm)
  line((-2.82, -4.26), (-2.82, -4.123), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.82, -4.268), [#text(size: 9pt)[$-L_Y$]], anchor: "north", padding: 0.1176cm)
  line((-1.692, -4.26), (-1.692, -4.123), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.692, -4.268), [#text(size: 9pt)[$-L_X$]], anchor: "north", padding: 0.1176cm)
  line((0, -4.26), (0, -4.123), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -4.268), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((1.692, -4.26), (1.692, -4.123), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.692, -4.268), [#text(size: 9pt)[$L_X$]], anchor: "north", padding: 0.1176cm)
  line((2.82, -4.26), (2.82, -4.123), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.82, -4.268), [#text(size: 9pt)[$L_Y$]], anchor: "north", padding: 0.1176cm)
  content((0, -3.873), [#text(size: 9pt)[common interval]])
  content((-2.256, -3.631), [#text(size: 9pt)[shoulder]], anchor: "south", padding: 0.1176cm)
  content((2.256, -3.631), [#text(size: 9pt)[shoulder]], anchor: "south", padding: 0.1176cm)
  line((-1.692, -3.095), (1.692, -3.095), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((-2.82, -2.67), (2.82, -2.67), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10))
  content((1.739, -3.095), [#text(size: 9pt)[$X$ wall]], anchor: "west", padding: 0.1176cm)
  content((2.867, -2.67), [#text(size: 9pt)[$Y$ wall]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Two distinct geometries in the magnetic estimate. Above, the main $X$ contour carries a positive mean; the central distance $d_0$ can become small when almost all $X$ sites are upper sites. Below, the particle numbers set different logarithmic wall lengths. The sharp trial field treats the common interval and its two shoulders separately. The curves and lengths are schematic. ],
) <fig:magnetic-geometry>

The probability density and its transform are

$ rho \( w \) = frac(sinh \( 2 gamma w \), sqrt(3) thin beta sinh \( 3 gamma w \)) \, #h(2em) hat(rho) \( k \) = frac(1, c_(*) \( k \)) \, #h(2em) c_(*) \( k \) = 2 cosh \( beta k \) - 1 . $

The apparent singularity at $w = 0$ is removable. Let $frak(R)$ be its analytic primitive on $\| Im w \| < beta$, normalized by $frak(R) \( 0 \) = 0$. We construct the contour as a level set of the imaginary primitive. Its uniform Lipschitz bound will suffice for real-energy coercivity. When $t$ tends to one, the finer central estimates below will also control smoothing and the particle coordinates used for fluctuations.

#thm([Lemma 5.1.])[
  (Positive-density contour and its uniform regularity).  #emph[For $1 \/ 2 lt.eq t < 1$, there is a unique real-analytic even function $theta : bb(R) arrow.r \[ 1 \/ 2 \, 1 \)$ satisfying, with $z \( u \) = u + i beta theta \( u \)$, 
#[#set math.equation(numbering: n => "(13)")
 $ Im #scale(x: 120%, y: 120%)[\[] \( 1 - t \) frak(R) \( z \( u \) \) + t frak(R) \( z \( u \) - i beta \) #scale(x: 120%, y: 120%)[\]] = 0 . $ <eq:06-curve>]

 For $t = 1$, take $theta = 1$ and $nu_X = rho$. For $t < 1$, define 
#[#set math.equation(numbering: n => "(14)")
 $ nu_X \( u \) = \[ \( 1 - t \) rho \( z \( u \) \) + t rho \( z \( u \) - i beta \) \] thin z' \( u \) . $ <eq:06-density>]

 In every case $nu_X$ is real, positive, even, and has integral one. The graphs $z$ are uniformly Lipschitz for $t in \[ 1 \/ 2 \, 1 \]$. There is a unique $theta_oo in \[ 1 \/ 2 \, 1 \]$ satisfying 
#[#set math.equation(numbering: n => "(15)")
 $ \( 1 - t \) sin \( gamma beta theta_oo \) + t sin \( gamma beta \( theta_oo - 1 \) \) = 0 \, $ <eq:06-limit-height>]

 and $theta \( u \) - theta_oo$ tends to zero exponentially with every fixed-order derivative, uniformly in $t$. Outside any fixed neighborhood of zero, the curves and the correspondingly rescaled tail densities $e^(gamma \| u \|) nu_X \( u \)$ have uniform analytic bounds, and $nu_X \( u \) asymp e^(- gamma \| u \|)$.]
  #emph[More precisely, put $r = 1 - t > 0$, $Delta \( u \) = beta \( 1 - theta \( u \) \)$, and $d_0 = Delta \( 0 \)$. As $r arrow.b 0$, 
#[#set math.equation(numbering: n => "(16)")
 $ d_0 asymp r log \( 1 \/ r \) \, #h(2em) sup_u (\| z \( u \) - \( u + i beta \) \| + \| z' \( u \) - 1 \| + lr(|frac(nu_X \( u \), rho \( u \)) - 1|)) = o \( 1 \) . $ <eq:06-center-regularity>]

 On a fixed small interval around zero, for each integer $j gt.eq 1$, 
$ \( \| u \| + d_0 \)^j (\| partial_u^j \( z' \( u \) - 1 \) \| + \| partial_u^j \( nu_X \( u \) - rho \( u \) \) \|) = o \( 1 \) $

 uniformly in $u$. The odd increasing change of coordinates $b_X$ defined by 
$ integral_0^(b_X \( u \)) rho \( v \) thin d v = integral_0^u nu_X \( v \) thin d v $

 has $b_X \( u \) - u = o \( 1 \)$ and $b'_X \( u \) = 1 + o \( 1 \)$ uniformly as $t arrow.t 1$, with the same scaled estimates for positive-order derivatives of $b'_X - 1$.]
] <lem:06-magnetic-curve>

#proof[
  The choice at $t = 1$ has all the asserted positivity and mass properties. We construct the contour for $t < 1$, then prove the uniform estimates as $t arrow.t 1$. First $Re rho \( w \) > 0$ throughout $\| Im w \| < beta$. To verify the sign away from the removable zero, write $gamma w = x + i y$, so $\| y \| < pi \/ 3$. The numerator of the real part, up to a positive factor, is
  $ cosh \( 5 x \) cos y - cosh x cos \( 5 y \) . $
  Here $cos y > 0$ and $cos y - cos \( 5 y \) = 2 sin \( 3 y \) sin \( 2 y \) gt.eq 0$; strict positivity follows except at the removable case $x = y = 0$, where $rho \( 0 \) > 0$.
  Set $Phi_t \( u \, y \) = Im \[ \( 1 - t \) frak(R) \( u + i y \) + t frak(R) \( u + i \( y - beta \) \) \]$. Its derivative in $y$ is strictly positive for $0 < y < beta$. By conjugation symmetry, $Phi_t \( u \, beta \/ 2 \) lt.eq 0$ for $t gt.eq 1 \/ 2$. At $y arrow.t beta$, its second summand tends to zero and the first is strictly positive, possibly infinite at $u = 0$. The intermediate value theorem and strict monotonicity give the unique root. The analytic implicit-function theorem gives real analyticity, and symmetry in $u$ gives evenness.
  For positivity of $nu_X$, write $A = \( 1 - t \) rho \( z \) + t rho \( z - i beta \) = a + i b$, with $a > 0$. Differentiating $Phi_t \( u \, beta theta \( u \) \) = 0$ gives $beta theta' = - b \/ a$, and hence
  $ nu_X = A \( 1 + i beta theta' \) = frac(\| A \|^2, a) > 0 . $
  Evenness follows from conjugation symmetry. Moving each translated density contour within its pole-free strip shows $integral nu_X = 1$. Equivalently the primitive in (13) tends to $1 \/ 2$ and $- 1 \/ 2$ at its two ends.
  The exponential expansion of $rho$ at either end begins with a positive multiple of $e^(- gamma \| u \|)$. Substitution into the imaginary primitive equation, divided by this leading term, gives (15). Its derivative with respect to $theta_oo$ is bounded below uniformly, since both relevant cosine arguments lie in $\[ - pi \/ 3 \, pi \/ 3 \]$. The analytic implicit-function theorem applied to the exponentially small remainder proves the uniform tail statements, including fixed-order derivatives. On compact $t$-subintervals below one, the same conclusions in the remaining bounded $u$-region follow by compactness and the strict derivative in $y$.
  It remains to examine the possible central degeneration as $r = 1 - t arrow.b 0$. At $w = i beta$, the density has a simple pole with negative imaginary residue, explicitly $- i \/ \( 6 beta gamma \)$. On a sufficiently small fixed interval in $u$, the defining equation therefore compares
  $ - \( 1 - r \) Im frak(R) \( u - i Delta \) asymp Delta $
  with
  $ r Im frak(R) \( u + i beta - i Delta \) asymp r (1 + log^(+) frac(1, \| u \| + Delta)) . $
  At $u = 0$ this gives $d_0 asymp r log \( 1 \/ r \)$. The same estimates, separating $\| u \| lt.eq d_0$ and $\| u \| > d_0$, give $\| u \| + Delta \( u \) asymp \| u \| + d_0$.
  To obtain uniform derivative bounds, write the defining equation as
  $ F_r \( u \, Delta \) = r Im frak(R) \( u + i beta - i Delta \) + \( 1 - r \) Im frak(R) \( u - i Delta \) = 0 . $
  The regular function vanishes identically when $Delta = 0$, and its Taylor expansion on this fixed central interval is
  $ Im frak(R) \( u - i Delta \) = - Delta rho \( u \) + O \( Delta^3 \) . $
  Thus its $u$-derivative is $O \( Delta \)$, whereas its $Delta$-derivative is $- rho \( u \) + O \( Delta^2 \)$. Either first derivative of the pole summand, including its coefficient, is bounded by
  $ O #h(-0.16667em) (frac(r, \| u \| + d_0)) = O #h(-0.16667em) (frac(1, log \( 1 \/ r \))) = o \( 1 \) . $
  Since $rho$ is bounded below here and $Delta = o \( 1 \)$, it follows that
  $ \| partial_Delta F_r \| gt.eq c_3 > 0 \, #h(2em) \| partial_u F_r \| lt.eq C (Delta + frac(r, \| u \| + d_0)) = o \( 1 \) . $
  In particular $Delta' = - partial_u F_r \/ partial_Delta F_r = o \( 1 \)$. For higher derivatives, extend each imaginary part analytically using the two conjugate analytic terms. Around a real solution at $u_0$, take complex discs in $u \, Delta$ of radii $c_2 \( \| u_0 \| + d_0 \)$. The pole remains outside these discs when $c_2$ is sufficiently small. The $Delta$-derivative remains bounded away from zero, while varying $u$ with $Delta = Delta \( u_0 \)$ changes $F_r$ by $o \( 1 \) \( \| u_0 \| + d_0 \)$, by the same estimates. The analytic implicit root therefore extends to a disc of comparable radius with oscillation $o \( 1 \) \( \| u_0 \| + d_0 \)$. Cauchy’s estimates give $z' - 1 = o \( 1 \)$ and the stated scaled higher-derivative bounds. The formula for $nu_X$ gives the same estimates for $nu_X - rho$. In this central region $rho$ is bounded below; off it the uniform tail expansion supplies the relative estimate in (16). These statements prove, in particular, uniform Lipschitzness and uniform comparison $nu_X asymp rho$ throughout the parameter interval.
  Finally the cumulative distributions are strictly increasing and have identical total mass. Analytic inversion on bounded intervals, and inversion of their normalized exponential tails, show that their matching map $b_X$ is odd and obeys the claimed uniform displacement and derivative bounds. Differentiating $rho \( b_X \) b'_X = nu_X$ on the same analytic discs gives the scaled higher-derivative estimates. ◻
]

=== 5.2 Exact centering of the ordinary and marked factors <exact-centering-of-the-ordinary-and-marked-factors>

Label the six species by $I = \( sigma \, J \)$, where $J = 0 \, F \, P$ denotes main, far singleton, or far double, and let $w_I = 1 \, 1 \, 2$, respectively. On each species use the real coordinate $u$ as its integration coordinate; only the main $X$ species follows the curved graph $z \( u \)$. Let $H$ be minus the sign-normalized particle–particle logarithm, and $V$ the sign-normalized ordinary site–particle logarithm, with the following logarithm convention. Reduce each angle to $\[ 0 \, 2 pi \)$ and use linear combinations of

$ K_theta.alt \( u \) = - log #h(-0.16667em) [2 (sin \( theta.alt \/ 2 \) cosh \( u \/ 2 \) - i cos \( theta.alt \/ 2 \) sinh \( u \/ 2 \))] \, quad K_0 \( u \) = - log \| 2 sinh \( u \/ 2 \) \| . $

The particle factors determine the exponents in $H$; the negative site–particle exponents determine $V$. Reverse cross entries by transposing and reflecting the argument. Fourier transforms use $hat(f) \( k \) = integral e^(- i k u) f \( u \) thin d u$ and inverse measure $d k \/ \( 2 pi \)$. At nonzero frequency,

$ hat(K)_theta.alt \( k \) = frac(pi e^(\( pi - theta.alt \) k), k sinh \( pi k \)) \, #h(2em) hat(K)_0 \( k \) = frac(pi cosh \( pi k \), k sinh \( pi k \)) . $

The transforms follow by differentiating twice and taking the double pole residue; symmetric averaging gives the angle-zero case. Affine ambiguities are fixed by the real tails $- \| u \| \/ 2 + O \( e^(- \| u \|) \)$ and the odd imaginary tails $\( pi - theta.alt \) "sign" \( u \) \/ 2$. The forms extend bilinearly to complex measures.

For the curved main self interaction, retain the horizontal logarithm and add the continuous logarithm of the ratio of its curved and horizontal factors. In particular the two vanishing sinh factors are divided before this correction is taken. Choose the logarithm that is zero before contour deformation. This prescription fixes the diagonal continuation and gives kernels conjugated by simultaneous negation of both real coordinates. Constant signs depend only on the species counts.

Put

$ mu_X = s nu_X \( u \) thin d u \, #h(2em) mu_Y = b rho \( u \) thin d u \, #h(2em) mu_I = 0 quad \( I med upright("far") \) \, $

and write $frak(t)_I^(thin a)$ for the particle logarithm of the single-mark factor $product_v P_(- 4 sigma_v) \( v - a \) \/ P_(sigma_v) \( v - a \)$.

#thm([Lemma 5.2.])[
  (Magnetic mean identities).  #emph[The ordinary one-body logarithm is $H mu$. Multiplying the ordinary site-pair factors by $exp \( \( mu \, H mu \) \/ 2 \)$ gives, up to a constant sign, 
#[#set math.equation(numbering: n => "(17)")
 $ C_(*)^n product_(i < j\
i \, j in X union Y) H_(*) \( a_i - a_j \)^2 \, #h(2em) C_(*) = frac(\( 1 + d \) gamma, 4 d cos \( beta \/ 2 \)) . $ <eq:06-ordinary-mean>]

 For each marked log $a$, its site factors in $cal(T)$, multiplied by $exp \( \( frak(t)^(thin a) \, mu \) \)$, give, again up to a constant sign, 
#[#set math.equation(numbering: n => "(18)")
 $ product_(i in X union Y) H_(*) \( a_i - a \)^2 . $ <eq:06-marked-mean>]

 On either main contour the real part of $frak(t)_I^(thin a)$, together with its first derivative, decays exponentially at infinity. Its imaginary part tends exponentially to $sigma_I \( 3 beta \/ 2 \) "sign" u$. The logarithm is regular with uniformly bounded first derivative at the center. On far species one has an exponentially decreasing upper bound for its real part; zeros of its numerator are allowed.]
] <lem:06-magnetic-mean>

#proof[
  We justify the contour continuations in the Fourier mean identities, since the $X$ site measure now has two different heights. For a test on the $X$ main contour, slide separately the two translated $rho$ contours to a horizontal line through the test point, keeping that line at distance strictly less than $beta$ from the relevant site height. For the diagonal logarithm, split the contour at the test point and deform its two halves with this common endpoint. Its logarithmic singularity is integrable, and the chosen continuous branch crosses no cut. For any other test species use a fixed admissible horizontal height between $beta \/ 2$ and $beta$.
  No additional singularity is met in these slides. The signed same-group separation of a far elementary particle from a main contour or its associated horizontal site line has absolute value strictly between $2 beta$ and $5 beta$. The cross separation, with the $X$ coordinate first, is positive and less than $6 beta$. All these bounds follow directly from the listed contours. They also hold for the slides used in a second pairing with a site’s translated density. A same-group $V$ is always slid within distance $beta$ of its site. Coincident site–main heights in a cross $V$ are regular.
  On horizontal contours Fourier transforms use $hat(f) \( k \) = integral e^(- i k u) f \( u \) thin d u$; put $x = beta k$. The self-main entry has transform
  $ hat(H)_(upright("self")) \( k \) = frac(2 pi c_(*) \( k \) cosh \( 3 x \), k sinh \( pi k \)) . $
  For a same-group far elementary particle at signed height separation $j beta$, replace the numerator $c_(*) cosh \( 3 x \)$ by
  $ c_(*) cosh \( x \) e^(\( 4 "sign" j - j \) x) . $
  For a cross elementary pair at separation $d beta > 0$, replace it by $c_(*) e^(\( 3 - d \) x)$, transposing by $k mapsto - k$ when the row and column are reversed. Convolution with each translated $rho$ cancels $c_(*)$; the translation multiplier adjusts the height from its main contour to its site. These are exactly the transforms of the corresponding $V$ entries. This proves the one-body identity.
  Pair once more with the translated density of a second site. For a horizontal same-group pair the symbol of $log B_s + rho * H_(upright("self")) * rho$, divided by $2 pi \/ \( k sinh \( pi k \) \)$, is
  $ - cosh \( 2 x \) - cosh x + frac(cosh \( 3 x \), c_(*) \( k \)) = - 2 cosh x + cosh \( 4 x \) - sinh \( 4 x \) tanh \( 3 x \/ 2 \) . $
  The expression on the right is the symbol of $log H_(*)^2$ in the same normalization: factor $H_(*)$ and use $accent(log \| tanh \( gamma u \/ 2 \) \|, ̂) \( k \) = - pi tanh \( 3 beta k \/ 2 \) \/ k$. This is the horizontal centering calculation of [10] Lemma 3.1; the contour slides above extend it to the two site heights here. In the cross case one may first compute at positive main–main separation and undo that shift in the transforms. The cancellation needed there is
  $ frac(sinh \( 3 x \), c_(*) \( k \)) = sinh \( 2 x \) + sinh x . $
  Endpoint identities at a height difference $beta$ follow by moving the heights slightly inward and taking the regular limit. The half self term for each site is fixed by the same-group identity at zero. With the affine terms fixed by the tails as below, this gives
  $ exp #h(-0.16667em) (1 / 2 \( rho * H_(upright("self")) * rho \) \( 0 \)) = frac(H_(*) \( 0 \), sqrt(B_s \( 0 \))) = frac(gamma \( 1 + d \), 4 d cos \( beta \/ 2 \)) = C_(*) . $
  Here $H_(*) \( 0 \) = gamma \( 1 + d \)$ and $sqrt(B_s \( 0 \)) = 4 sin beta sin \( 3 beta \/ 2 \) = 4 d cos \( beta \/ 2 \)$, with the positive square root. There is one such factor per ordinary site, proving (17) with its exact normalization.
  For a single mark, slide the density in the same way. After removing the ordinary-site to marked-site translation multiplier, the combined log symbol, divided by $- pi \/ \( k sinh \( pi k \) \)$, is
  $ e^(2 sigma x) + e^(sigma x) + frac(1 - e^(3 sigma x), c_(*) \( k \)) = 2 (cosh \( 2 x \) + cosh x - frac(cosh \( 3 x \), c_(*) \( k \))) . $
  The equality follows by multiplying by $2 cosh x - 1$. This is exactly the symbol of $log H_(*)^2$, proving (18). These transform comparisons determine the second derivatives. To fix the affine ambiguity, subtract the linear real tails: the remaining real constants vanish by the exponential expansions and the centered real offsets; a translated $rho$ has purely imaginary first moment. On horizontal contours the imaginary parts are bounded and odd, so their affine ambiguity vanishes as well. Continuing the chosen logarithms fixes the stated signs.
  Finally on a main contour the numerator angle of a marked particle factor is reduced to $4$ plus the relevant shift, in units of $beta$, and the denominator angle is $1$ or $7$ plus that shift. These angles stay in the open interval $\( 0 \, 8 \)$. The log-sinh tail expansion therefore gives zero real limit, exponential real decay with a derivative, and the imaginary limits $sigma \( 3 beta \/ 2 \) "sign" u$. The compact part remains uniformly regular because the main angles stay away from zeros and $z'$ is uniformly bounded by Lemma 8. On far contours the denominator remains regular and the same tail expansion bounds the log modulus above by $C e^(- c_2 \| u \|)$. A numerator zero only improves this upper bound. ◻
]

=== 5.3 Positivity of the real energy <positivity-of-the-real-energy>

For a real vector of smooth rapidly decreasing densities $xi = \( xi_I \)$, assume weighted neutrality and define

$ integral_(bb(R)) sum_I w_I xi_I = 0 \, #h(2em) d_xi = sum_I w_I xi_I \, #h(2em) D \( u \) = integral_(- oo)^u d_xi \( v \) thin d v \, #h(2em) B \( xi \) = 1 / 2 \( xi \, Re H thin xi \) . $

Use the inhomogeneous negative Sobolev norm

$ parallel xi_I parallel_(- 1 \/ 2)^2 = integral_(bb(R)) \( 1 + k^2 \)^(- 1 \/ 2) \| hat(xi)_I \( k \) \|^2 thin frac(d k, 2 pi) . $

#thm([Theorem 5.3.])[
  (Uniform real-energy coercivity).  #emph[For the magnetic contours there are constants $0 < c_2 < C_2 < oo$ such that 
#[#set math.equation(numbering: n => "(19)")
 $ c_2 (parallel D parallel_2^2 + sum_I parallel xi_I parallel_(- 1 \/ 2)^2) lt.eq B \( xi \) lt.eq C_2 (parallel D parallel_2^2 + sum_I parallel xi_I parallel_(- 1 \/ 2)^2) . $ <eq:06-real-positivity>]

 They are uniform in $t in \[ 1 \/ 2 \, 1 \]$ and in all sufficiently small positive far-contour parameters $epsilon$. The form extends to the completion in this norm.]
] <thm:06-real-positivity>

#proof[
  We will sweep the curved $X$ charge harmonically to the two edges of the strip between heights $beta \/ 2$ and $beta$. The boundary energy and the remaining positive Green energy together will control both the species norms and the weighted total primitive.
  #strong[The horizontal boundary lines.] Allow independent $X$ main charges on the two boundary lines. This gives a translation-invariant system with seven species. At $epsilon = 0$, their elementary height lists, in units of $beta \/ 8$, are
  $ \( 4 \) \, quad \( 8 \) \, quad \( 25 \) \, quad \( 24 \, 32 \) \, quad \( 0 \) \, quad \( - 28 \) \, quad \( - 24 \, - 32 \) . $
  The first four species belong to $X$; the final three belong to $Y$. Divide the real Fourier symbol by $pi \/ \( k sinh \( pi k \) \)$, and divide its $I J$ entry by $w_I w_J$. Expand the resulting matrix in $v = cosh \( beta k \/ 8 \) - 1$. Its constant matrix has every entry equal to $2$, and every coefficient of degree $1 lt.eq l lt.eq 32$ is strictly positive definite. Here is a finite rational verification of this assertion.
  The coefficient of $v^l$ in $cosh \( 32 thin "arcosh" \( 1 + v \) \)$ is
  $ c_(32 \, l) = frac(2^l, \( 2 l \) !) product_(a = 0)^(l - 1) \( 32^2 - a^2 \) > 0 . $
  After division by this coefficient, define
  $ h_l \( j \) = product_(a = 0)^(l - 1) frac(i_j^2 - a^2, 32^2 - a^2) \, #h(2em) i_j = \( j med mod med 64 \) - 32 . $
  For each pair of elementary heights, let $j$ be their absolute difference. Average over the two species’ height lists the expression
  $ 2 h_l \( j \) + h_l \( j + 16 \) + h_l \( j - 16 \) - h_l \( j - 8 \) - h_l \( j + 8 \) $
  when they are in the same group, and
  $ 2 #scale(x: 120%, y: 120%)[\(] h_l \( j \) + h_l \( j + 16 \) - h_l \( j + 8 \) #scale(x: 120%, y: 120%)[\)] $
  when they are in opposite groups. Denote the resulting symmetric matrix by $M_l$. These formulas follow by summing the log-factor angles modulo $2 pi = 8 beta$. The elementary cosh coefficient formula follows from $\( 2 v + v^2 \) y'' + \( 1 + v \) y' = i_j^2 y$.
  For $l lt.eq 12$, symmetric elimination gives successive pivots strictly larger than the rational decimals in the following table:
  $ l & 1 & 2 & 3 & 4 & 5 & 6 & 7\
1 & 1 & .7 & .8 & .27 & .49 & .59 & .09\
2 \, 3 & 1 & 1 & 1 & .32 & .8 & 1 & .30\
4 \, 5 \, 6 & 1.7 & 1.65 & 1.48 & .35 & 1.53 & 1.65 & .45\
7 \, dots.h \, 12 & 1.9 & 1.88 & 1.74 & .35 & 1.89 & 1.88 & .48 $
  The entries are obtained using exact rational substitution in
  $ m_(i j)^(\( p \)) = m_(i j)^(\( p - 1 \)) - frac(m_(i p)^(\( p - 1 \)) m_(j p)^(\( p - 1 \)), m_(p p)^(\( p - 1 \))) \, #h(2em) i \, j > p \, #h(2em) M_l = \( m_(i j)^(\( 0 \)) \) . $
  Thus all these matrices are positive definite.
  For $13 lt.eq l lt.eq 32$, each $h_l \( j \)$ is nonnegative and nonincreasing in $l$: before a zero occurs, every additional factor lies in $\[ 0 \, 1 \]$, and after that zero the product stays zero. Split the displayed averages into their positive and negative parts, $M_l = P_l - Q_l$. A lower bound for its diagonal is $"diag" \( P_32 - Q_13 \)$, and an entrywise upper bound for the absolute off-diagonal entries is
  $ max \( P_13 - Q_32 \, thin Q_13 - P_32 \) . $
  Weight column $j$ relative to row $i$ by $v_j \/ v_i$, with $v = \( 1 \, 1 \, 1 \, 2 \, 1 \, 1 \, 1 \)$. Subtracting the weighted off-diagonal row sums from the diagonal lower bounds gives exactly
  $ \( & 539085539017 \/ 288991072832 \, med 153103458093 \/ 288991072832 \, med 6754920483 \/ 37289170688 \,\
 & 2413205499 \/ 288991072832 \, med 8798842243 \/ 4515485513 \,\
 & 496150561213 \/ 288991072832 \, med 32952783649 \/ 1155964291328 \) . $
  All seven numbers are positive. Weighted strict diagonal dominance of the symmetric $M_l$ proves positive definiteness for every remaining degree.
  At small frequencies the constant coefficient supplies the rank-one $k^(- 2)$ term for the weighted total density, and the strictly positive first coefficient supplies a uniformly positive bounded term on all species. At large frequencies the top coefficient supplies a positive multiple of $1 \/ \| k \|$, since $pi = 4 beta$. The intervening frequencies are controlled by continuity and positivity. The real tail $- w_I w_J \| u - v \|$ contributes exactly $parallel D parallel_2^2$ to $B$. These observations prove the two-sided norm estimate on the seven boundary-line species at $epsilon = 0$.
  #strong[Uniform movement of the far double.] The estimate continues uniformly to sufficiently small $epsilon > 0$. At small frequencies use the strict positive quadratic coefficient, and on compact frequency intervals use continuity. To check uniformity at infinite frequency, divide the normalized symbol further by $cosh \( 4 beta k \)$. For $0 lt.eq epsilon < 1 \/ 16$ it has the form
  $ "diag" \( 2 \, 2 \, 2 \, 1 / 2 \, 2 \, 2 \, 1 / 2 \) + q_epsilon \( k \) \( E_24 + E_42 \) + O \( e^(- c_3 \| k \|) \) \, #h(2em) q_epsilon \( k \) = frac(cosh \( \( 4 - epsilon \) beta k \), 2 cosh \( 4 beta k \)) . $
  Here $E_(i j)$ is the elementary matrix, and the error is uniform in $epsilon$: after collecting the elementary factors of each double, all other contributing angles stay a fixed distance from zero modulo $8 beta$. In particular the potentially small angles in the $X$-double/$Y$-double entry cancel with total coefficient $2 - 4 + 2 = 0$, for every $epsilon$. The exceptional pair couples the $X$ main line of height $beta$ to the $X$ double, and $0 lt.eq q_epsilon lt.eq 1 \/ 2$. The only nontrivial $2$ by $2$ block is $mat(delim: "(", 2, q; q, 1 \/ 2)$; its least eigenvalue is at least $\( 5 - sqrt(13) \) \/ 4 > 0$. This proves uniform coercivity also in every joint limit $epsilon arrow.b 0$, $\| k \| arrow.r oo$.
  #strong[Harmonic sweeping to the boundary.] We now pass from the two boundary lines to the graph. Let $cal(S) = { z : beta \/ 2 < Im z < beta }$, and balayage the real charge on the graph harmonically to the two edges of $cal(S)$. Leave all other species unchanged, and denote the resulting seven-species charge by $tilde(xi)$. All interactions are harmonic in this strip, in either variable away from the source, and have at most linear growth. The only interior source in a graph self interaction is
  $ - 2 log lr(|2 sinh frac(z - z', 2)|) \, $
  whose logarithmic singularity is $- 2 log \| z - z' \|$. Let $G_(cal(S))$ be the Dirichlet Green kernel of $- Delta$, with singularity $- \( 2 pi \)^(- 1) log \| z - z' \|$, and put
  $ cal(G) \( xi_X \) = integral.double G_(cal(S)) \( z \( u \) \, z \( v \) \) thin xi_X \( u \) xi_X \( v \) thin d u thin d v . $
  Harmonic interpolation first in one variable and then in the other therefore gives the exact identity
  #[#set math.equation(numbering: n => "(20)")
   $ B \( xi \) = B_(partial cal(S)) \( tilde(xi) \) + 2 pi cal(G) \( xi_X \) . $ <eq:06-balayage>]
  The coefficient $2 pi$ includes the factor $1 \/ 2$ in the definition of $B$. The Green energy is nonnegative for signed real charges: by Dirichlet inversion and integration by parts it is the squared dual norm of the charge acting on traces of zero-boundary functions with gradient $L^2$-norm at most one. Harmonic measures in the strip decay exponentially; their Fourier kernels are ratios of the form $sinh \( y k \) \/ sinh \( beta k \/ 2 \)$. These facts justify the interpolations for rapidly decreasing densities and then by completion.
  #strong[Uniform control as the graph approaches an edge.] For clarity, we verify that (20) gives exactly the claimed norm, even when the graph approaches the upper edge. The Sobolev trace principle underlies this comparison [4] Theorem 1.I; we give the strip construction to retain uniform constants as the graph approaches an edge. The trace map $H^1 \( bb(R)^2 \) arrow.r H^(1 \/ 2) \( bb(R) \)$ on the graph and a right inverse both have bounds depending only on its uniform Lipschitz constant. Flatten the graph by a uniformly bilipschitz map. On a horizontal line, the trace bound follows by transverse Fourier Cauchy–Schwarz, and a right inverse extends a mode $k$ by $e^(- sqrt(1 + k^2) \| y \|)$. Reflection across the strip edges with a cutoff gives the same trace bound for strip functions. Harmonic extension from the two boundaries is bounded $H^(1 \/ 2) arrow.r H^1$; this follows either from the displayed Fourier kernels or the Dirichlet principle together with the fixed strip width.
  Duality now bounds the two projected charges’ $H^(- 1 \/ 2)$ norms by the graph charge’s norm. It also bounds the Green energy above by that squared norm, since zero-boundary strip functions have their full $H^1$ norm controlled by their gradient. Conversely, extend an arbitrary $H^(1 \/ 2)$ test on the graph to the plane, restrict it to the strip, and decompose it into its harmonic boundary extension and a zero-boundary remainder. Pairing these two terms with the charge gives
  $ parallel xi_X parallel_(- 1 \/ 2)^2 lt.eq C_3 (parallel tilde(xi)_(X \, beta \/ 2) parallel_(- 1 \/ 2)^2 + parallel tilde(xi)_(X \, beta) parallel_(- 1 \/ 2)^2 + cal(G) \( xi_X \)) . $
  Thus the Sobolev parts of the norms are equivalent in both directions, with the Green term included.
  It remains to compare primitives of the weighted total densities. Let $tilde(D)$ be the primitive after projection. For a smooth compactly supported function $b$, pair the horizontal marginal of the difference between graph charge and projected charge with $b$. This pairing equals that of the graph charge with $b \( u \)$ minus the harmonic extension of the same boundary value $b$ on both edges. The latter difference has zero boundary values and gradient norm at most $C_4 parallel b' parallel_2$: compare the harmonic extension to the constant-in-height function $b \( u \)$ by the Dirichlet principle. Green-energy duality, followed by integration by parts in $u$, therefore yields
  $ parallel D - tilde(D) parallel_2^2 lt.eq C_5 cal(G) \( xi_X \) . $
  Together with (20), the boundary-line coercivity, and the Sobolev norm comparisons, this proves both inequalities in (19). All constants depend only on the fixed strip width and uniform Lipschitz bounds, so remain uniform as the graph reaches an edge, including the case $t = 1$. ◻
]

== 6 Magnetic trial actions with unequal walls <sec:07_magnetic_analysis-trials>

The next estimates retain a positive part of the real energy while gaining $2 L_X$ from the common interval and controlling the activities on the two shoulders. We first define the trial action, then separate its smoothing, common-interval, and shoulder estimates. The resulting bounds will be implemented in the actual particle integral in the next section.

=== 6.1 Explicit particles and the trial action <explicit-particles-and-the-trial-action>

Retain the magnetic contours, their elementary multiplicities $w_I$, and the real-energy form $B$ of the preceding section. A double label always represents the sum of its two elementary constituents when a kernel is computed. Write $s_X = s$, $s_Y = b$, $macron(nu)_X = nu_X$ and $macron(nu)_Y = rho$ for their sizes and positive unit-mass mean densities. The two main labels are $X \, Y$; the subscript $n$ means the pair of main labels. Throughout this section,

$ beta = pi / 4 \, #h(2em) gamma = frac(pi, 3 beta) = 4 / 3 \, #h(2em) kappa = \( 3 beta \)^2 \, #h(2em) p = \( 3 - theta_oo \) beta \, #h(2em) L = L_Y . $

The parameter $p$ in the kernel formulas is distinct from a marked port. We assume $c_1 L lt.eq L_X lt.eq L_Y = L$, with $c_1 > 0$ fixed. Constants can depend on $c_1$. An error $o \( L \)$, or $o \( 1 \) B \( x \)$, is uniform over the stated frozen configurations after all smoothing, localization, and projection parameters have been fixed. When counts are restricted to a fixed power of $L$, uniformity includes the positions and counts in that restriction. Errors denoted $o_epsilon \( 1 \) L$ have a coefficient tending to zero as $epsilon arrow.b 0$, with $h = epsilon^(K_2)$ as specified below; they are different from the large-$L$ errors.

Split main particles at their respective walls $\[ - L_g \, L_g \]$. Put the particles outside their own walls, together with every far-label particle, into the explicit configuration $zeta$. Its total number is $n_e$, with elementary multiplicities included whenever a group total is tested. The interior density $alpha_g$ has mass $m'_g$, obtained by subtracting these explicit multiplicities from $s - M \, b + M$. Here $M$ remains an integer. We use the following explicit regularization. Fix a small $h > 0$. Let $psi = psi^(\( h \))$ be the even positive convolution probability whose Fourier transform averages $cosh \( \( pi - h v \) k \) \/ cosh \( pi k \)$ over $0 < v < 1$, with probability density proportional to $e^(- 1 \/ sqrt(v))$. Before averaging its real density is

$ frac(cosh \( u \/ 2 \) sin \( h v \/ 2 \), 2 pi \( sinh^2 \( u \/ 2 \) + sin^2 \( h v \/ 2 \) \)) . $

Hence $psi lt.eq C \/ h$, its tails are at most $C h e^(- \| u \| \/ 2)$ for $\| u \| gt.eq 1$, and $integral u^2 psi \( u \) thin d u lt.eq C h$. Its Fourier transform has upper and lower stretched-exponential bounds of the form $C e^(- c \( h \| k \| \)^(1 \/ 3))$ and $c e^(- C \( h \| k \| \)^(1 \/ 3))$. Put $S_0 \( u \) = - 2 log \| 2 sinh \( u \/ 2 \) \|$. Then $S_0 gt.eq S_0 * psi gt.eq S_0 * psi * psi$ by the preceding Fourier formula with the real tails fixed. Choose an even Gevrey cutoff $chi$, equal to one on $\[ - 1 \/ 2 \, 1 \/ 2 \]$, zero outside $\[ - 1 \, 1 \]$, and between zero and one. On like-main interior/explicit entries set

$ R_h \( u \) = chi \( u \) \( S_0 - S_0 * psi \) \( u \) gt.eq 0 \, #h(2em) tilde(H)_(n e) = H_(n e) - R_h \, $

with $R_h = 0$ on other entries. We also write $R$ for this kernel when no operator complement is involved. This cutoff uses the horizontal difference, including on the curved contour. Define

$ cal(E) \( alpha \, zeta \) = 1 / 2 \( alpha - mu \, H_(n n) \( alpha - mu \) \) + \( alpha - mu \, tilde(H)_(n e) zeta \) + 1 / 2 \( zeta \, H zeta \)_(upright("off")) . $

The last expression omits each individual explicit self interaction; near empirical diagonals will instead use smooth reference compensation. Put

$ x = "Re" alpha - mu + psi * zeta \, #h(2em) z = "Im" alpha \, #h(2em) D' = sum_I w_I x_I \, #h(2em) D'_z = sum_I w_I z_I . $

The primitives vanish at infinity, and each main component of $z$ has integral zero. To distinguish a contour from a density, write $frak(z)_I \( u \)$ for its complex parametrization; thus $frak(z)_X \( u \) = u + i beta theta \( u \)$ on main $X$. Let $frak(t)_I$ be the sum of the particle logarithms from the two marked anomalies. The trial action is

$ cal(D) \( alpha \, zeta \) = cal(E) \( alpha \, zeta \) - \( frak(t)_n \, alpha - mu \) - \( frak(t) \, zeta \) . $

A purely imaginary constant depending only on the species counts never affects a bound on its real part.

=== 6.2 Reference measure and sector normalization <sec:reference-law>

The comparison law has two independent labels, denoted $X \, Y$. For an integer $n gt.eq 0$, its unnormalized measure on $\[ 0 \, pi \]^n$ is

$ frac(1, n !) product_(i = 1)^n frac(2 sin t_i thin d t_i, 2 pi) product_(i < j) \| 2 \( cos t_i - cos t_j \) \|^2 . $

Under $x = cos t$ this is the Legendre orthogonal-polynomial ensemble. Andréief’s determinant integration identity gives its mass [13] equation (1.3)

#[#set math.equation(numbering: n => "(21)")
 $ J_n = product_(i = 0)^(n - 1) frac(2 dot.op 16^i \( i ! \)^4, pi \( 2 i + 1 \) \( \( 2 i \) ! \)^2) = exp { - 1 / 4 log \( n + 1 \) + O \( 1 \) } \, #h(2em) J_0 = 1 . $ <eq:reference-normalization>]

We write $bb(E)_0$ only for the probability expectation, divided by $J_(N_X) J_(N_Y)$. Neither of these factors is part of the observable.

On each label, let $r in \[ - A_g \, A_g \]$ be a real reference parameter and let $t_g \( r \)$ be an increasing probability coordinate taking values in $\[ 0 \, pi \]$, with density $lambda_g \( r \) = t'_g \( r \) \/ pi$. The corresponding point on the main contour is denoted by $Z_g \( r \)$. We will specify this parametrization, including its endpoint caps, in Section 7. With $X_(N_g)$ the empirical counting measure in the reference parameter, put

$ q_g = X_(N_g) - N_g lambda_g \( r \) thin d r \, #h(2em) Q'_g = q_g \, #h(2em) Q_g \( - A_g \) = Q_g \( A_g \) = 0 . $

The reference kernel is block diagonal, with each diagonal block

$ H_(upright("ref")) \( t \, t' \) = - 2 log \| 2 \( cos t - cos t' \) \| . $

Its mean against $d t \/ pi$ is zero. The Hilbert space $cal(X)$ is the completion of smooth Dirichlet primitives for the form

$ h_0 \( Q \, Q \) = \( Q' \, H_(upright("ref")) Q' \) = pi^2 sum_(g \, n gt.eq 1) n \| b_(g \, n) \|^2 \, #h(2em) Q_g \( t \) = sum_(n gt.eq 1) b_(g \, n) sin \( n t \) . $

Real symmetric forms extend bilinearly to complex arguments; norms and adjoints always use the Hermitian convention. An empirical primitive need not have finite $h_0$ energy. We evaluate its quadratic cost only after subtracting the reference singularity, so that the remaining kernel is smooth, including its diagonal. No subtraction of two infinite self energies is involved.

Let $p_g$ be the pushforward of $lambda_g \( r \) thin d r$ to the horizontal coordinate of the $g$ wall, and write $p_L = \( p_X \, p_Y \)$. For this sector take $N_g = m'_g$, restricted to nonnegative integer counts. Inserting $m' p_L + q$ into the trial action always means pushing $q$ to the same horizontal coordinates. The two interior empirical measures are denoted by $X_(upright("int")) = \( X_(N_X) \, X_(N_Y) \)$; their pushforward is likewise understood in pairings with the trial kernels.

We now compute the factor produced by changing to this reference law. Put $a_(*) = 2 cos \( beta \/ 2 \) = d \/ c$. On a main label the local particle factor and the reference pair factor have the respective expansions

$ E_s \( Z_g \( r \) - Z_g \( r' \) \) & = a_(*)^2 Z'_g \( r \)^2 \( r - r' \)^2 \( 1 + o \( 1 \) \) \,\
\| 2 \( cos t_g \( r \) - cos t_g \( r' \) \) \|^2 & = #scale(x: 120%, y: 120%)[\(] 2 sin t_g \( r \) t'_g \( r \) #scale(x: 120%, y: 120%)[\)]^2 \( r - r' \)^2 \( 1 + o \( 1 \) \) . $

Consequently the smooth-diagonal compensation contributes

$ exp #h(-0.16667em) (frac(\( H - H_(upright("ref")) \)_(g g) \( r \, r \), 2)) = frac(2 sin t_g \( r \) t'_g \( r \), a_(*) Z'_g \( r \)) . $

Here $H$ is composed with the contour parametrization, and the branch is continued from the straight contour; endpoint values are taken by continuity. Multiplication by $d Z_g \( r \) \/ \( 2 pi \)$ cancels $Z'_g \( r \)$ and leaves $a_(*)^(- 1)$ times the reference one-particle measure $2 sin t_g thin d t_g \/ \( 2 pi \)$.

The finite identity and ordinary mean extraction contribute $\( \( 2 d \) C_(*) \)^n$, where $n = N - 2$ is the total elementary particle degree. Since

$ frac(\( 2 d \) C_(*), a_(*)) = gamma / 2 \, #h(2em) N_X + N_Y = n - sum_(v in zeta) w_(I \( v \)) \, $

extracting $\( gamma \/ 2 \)^n$ leaves $a_(*)^(w_I)$ for each explicit particle of species $I$. Thus a singleton retains activity $d \/ c$, and a double retains $4 c^2 \( d \/ c \)^2$. The magnetic mean identities supply all ordinary and marked site-pair factors. Restoring the missing marked–marked factor and replacing $n$ by $N$ in the extracted power changes the result only by a uniformly bounded factor, because the allowed marked log differences are $0 \, plus.minus i beta$ and $H_(*)$ is nonzero there.

After extracting $\( gamma \/ 2 \)^N product_(i < j) H_(*) \( a_i - a_j \)^2$, the remaining sector is therefore an unnormalized reference integral with integrand

$ A exp #h(-0.16667em) (- cal(D) \( m' p_L + q \, zeta \) + 1 / 2 H_(upright("ref")) \[ q \, q \]) \, #h(2em) A = exp \( - \( X_(upright("int")) \, R zeta \) \) . $

The difference in the exponent uses smooth-diagonal compensation on both labels, as above. Including the explicit integration measures, the remaining prefactor is bounded in modulus by

$ C product_(v in zeta) (frac(\| d frak(z)_(I \( v \)) \( v \) \|, 2 pi) \( d \/ c \)^(w_(I \( v \))) a_(I \( v \)) thin e^(\( mu \, R delta_v \))) \, $

with a factorial divisor for each explicit species. Here $a_I = 1$ for a main or far singleton and $a_I = 4 c^2$ for a double; on straight contours $d frak(z) = d v$. Count-dependent signs have modulus one. Finally $\( mu \, R delta_v \) = O_h \( 1 \)$, and is $o \( 1 \)$ past a macroscopic buffer outside the corresponding wall.

=== 6.3 Smoothing and count control <smoothing-and-count-control>

Smoothing lets the positive real energy control the explicit particles. The first estimate counts them locally; the second controls their total number, group imbalance, and distance beyond the longer wall.

#thm([Lemma 6.1.])[
  (Curved smoothing and count control).  #emph[Let $n_j$ be the local explicit counts on the smoothing grids, with a separate grid beginning at each wall. Uniformly for sufficiently small $epsilon > 0$, 
#[#set math.equation(numbering: n => "(22)")
 $ sum n_j^2 lt.eq C \( 1 + \| log h \| \) \( B \( x \) + 1 \) \, #h(2em) ell_e + \( M^2 + n_e^2 \) \/ L lt.eq C_h \( B \( x \) + 1 \) \, quad ell_e = sum_(v in zeta) \( \| v \| - L_Y \)_(+) . $ <eq:M-20>]

]
  #emph[Put 
$ Delta_H = 1 / 2 { \( zeta \, Re H zeta \)_(upright("off")) - \( psi * zeta \, Re H thin psi * zeta \) } . $

 Then 
#[#set math.equation(numbering: n => "(23)")
 $ Re cal(E) =  & B \( x \) - B \( z \) - \( x \, Im H z \) + Delta_H\
 & + O #h(-0.16667em) (epsilon.alt_(upright("sm")) \( h \, epsilon \, L \) \( B \( x \) + B \( z \) + 1 \)) \,\
epsilon.alt_(upright("sm")) \( h \, epsilon \, L \) lt.eq  & C epsilon^(- C) h^(c_2) + o_L \( 1 \) . $ <eq:M-21>]

 Here $C \, c_2 > 0$; $o_L \( 1 \) arrow.r 0$ at fixed $h \, epsilon$. Decreasing $c_2$ absorbs logarithmic losses in $h$. Also, entrywise off the omitted diagonals, 
#[#set math.equation(numbering: n => "(24)")
 $ Re \( H - psi H psi \)_(I J) \( u \, v \) med gt.eq med - C epsilon^(- C) h^(c_2) e^(- c_2 \| u - v \|) - o_L \( 1 \) e^(- c_2 \| u - v \|) quad upright("at explicit positions") . $ <eq:M-22>]

 Here $psi H psi$ denotes separate convolution. Its own-variable diagonal costs at most $C \( 1 + \| log h \| \)$ (upper bound on real part, uniform in $epsilon$).]
] <lem:07_magnetic_analysis-smoothing>

#proof[
  #strong[Positive count tests.] We give the count tests explicitly. For each far label use translates of a nonnegative bump covering a unit cell to test the positive field $x_I = psi * zeta_I$. For a main label use a grid beginning at its own wall and bumps supported outside that wall. The first bump rises from zero to one across distance $h$, remains one through distance two, and then cuts off. Every particle in that first cell contributes a fixed positive amount after smoothing. The squared $H^(1 \/ 2)$ norm of a bump is $O \( 1 + \| log h \| \)$, as follows from the difference-quotient seminorm, and bounded overlaps give the same bound for linear combinations with the sum of squared coefficients. The mean cell masses are summably bounded because $s_g macron(nu)_g \( u \) = O \( 1 \)$ at its own wall. Duality and magnetic coercivity therefore give the first count estimate.
  Beyond the larger wall, a count to the right of $v$ is bounded by twice its positive smeared cumulative there. Its square integrates to $O \( B \( x \) + 1 \)$ using the total primitive and the exponentially small mean tail; the left end is identical. Counts are integers, so this also bounds their distance sum $ell_e$. The remaining count mass lies in $O \( L \)$ cells and is bounded by Cauchy–Schwarz. Finally the $X$-group total of $x$ is $- M$. Test it on a smooth plateau covering the larger wall interval, whose $H^(1 \/ 2)$ norm is $O \( sqrt(L) \)$; its complement is bounded by the positive smeared tail masses. This proves the remaining count estimates. The covariance kernel of $\( 1 + k^2 \)^(- 1 \/ 2)$ is bounded by $C \( 1 + \| log \| u \| \| \) e^(- c \| u \|)$; convolving twice with $psi$ also gives $parallel psi * zeta parallel_(- 1 \/ 2)^2 lt.eq C \( 1 + \| log h \| \) sum_j n_j^2$, which we use in the smoothing estimate below.
  #strong[Horizontal singularity and curved residuals.] We give the additional kernel estimates needed for curvature. Subtract $S_0 delta_(I J)$ from $H_(I J)$. This accounts for the full horizontal angle-zero terms, using double fusion; the residual curved self-log ratio on main has bounded size locally by divided differences and the graph estimates. Except for this ratio, all residual log singularities have horizontal offsets in imaginary height bounded away from zero by $c_3 epsilon$, after double fusion, for like near-diagonal real positions. This follows from $1 \/ 2 lt.eq theta lt.eq 1$, the singletons $25 \/ 8 \, - 7 \/ 2$, doubles $3 + epsilon \, 4 + epsilon \; - 3 \, - 4$, and the shifts in $E_s \, E_c$; for two curved main particles with different real positions use uniform Lipschitzness near their diagonal. All angle-nonzero sums thus have fixed-order local derivative bounds polynomial in $1 \/ epsilon$ (up to one derivative in each argument suffices, or fixed higher order where the curve has regular derivatives). In the far tails of the difference coordinate use the convergent log series. More precisely, the remaining leading terms after subtracting $S_0 delta_(I J)$ are
  $ - \( w_I w_J - delta_(I J) \) log \( 2 cosh \( u - v \) \) + i \( c_(I J)^0 - upsilon_I \( u \) w_J + w_I upsilon_J \( v \) \) tanh \( u - v \) $
  with exponentially localized residuals. Here $c_(I J)^0$ are straight-contour sign coefficients, $upsilon_X \( u \) = beta \( theta \( u \) - theta_oo \)$ on main $X$, and $upsilon_I = 0$ otherwise. Indeed vary just the imaginary coordinate there: each reduced-angle log contributes its height translation to the linear tail, including the continued squared diagonal log via the same log ratio, and there is no zero crossed off a self diagonal. Derivatives up to one in each variable of the exponentially localized bounds also hold away from the curved same-main diagonal neighborhood. In that neighborhood the extra log ratio is smooth with uniform fixed-derivative bounds outside a fixed neighborhood of zero; near zero it is bounded with first derivative in $u$ at most $C \/ \( \| u \| + d_0 \)$ when the graph approaches angle 1 as above. This follows by differentiating the divided difference: for $\| u - v \| lt.eq c_3 \( \| u \| + d_0 \)$ use the local derivative bounds on $frak(z)'_X$, otherwise divide the bounded slopes by $\| u - v \|$. Thus in this exceptional neighborhood its localized $H^(1 \/ 2)$-norm in $u$ is at worst polynomial in $L$ (recall $1 - t gt.eq 1 \/ s$ if nonzero). Indeed in the difference quotient split translation lengths below and above $c_3 \( \| u \| + d_0 \)$; the squared seminorm bound costs $C \( 1 + \| log d_0 \| \)$. At $t = 1$ itself there is no such issue.
  #strong[Smoothing the residual kernels.] For (23) only the mixed error of $tilde(H)_(n e)$ versus $H_(n e) psi$ has to be paired against $alpha - mu$. The displayed smoothing transform gives the Fourier bound $C h^(c_2) \( 1 + \| k \| \)^(- 1) hat(psi)$ for the $S_0$ term. For the decaying residuals just described, convolving in the explicit variable instead of evaluating at its point changes the kernel, as a test in the interior variable, by $O \( epsilon^(- C) h^(c_2) + o_L \( 1 \) \)$ in each localized $H^(1 \/ 2)$-norm, with exponential decay in the distance between unit cells. Indeed the first and mixed derivative bounds suffice by averaging shifts (the probability has small first moment and small exponential tails); when the explicit argument belongs to a curved same-main entry it starts beyond $L_X$. To meet the exceptional neighborhood at zero it must thus shift by $gt.tilde L_X$, gaining exponential smallness against the polynomial localized norm there. The smooth real leading tail gives decaying small errors too by even averaging and exponentially decaying second derivatives. For the imaginary leading terms the only change not exponentially localized is from varying $w_I upsilon_J \( v \)$ in the convolution. In (23) this only pairs against $z$; summing with $w_I$ and integrating by parts gains $tanh'$ against $D_z$, so the small-error estimate uses just Lipschitz $upsilon_J$. Summing tests in spatial cells uses (22), Sobolev norm bounds from $B$, and $parallel psi * zeta parallel_(- 1 \/ 2)^2 lt.eq C \( 1 + \| log h \| \) sum n_j^2$ from the previous argument. For clarity, local $H^(1 \/ 2)$ bounds with exponential envelopes combine with loss at most constant in cell $ell^2$: insert a unit-scale partition with bounded overlap and use the difference-quotient norm. This proves (23).
  For (24) the singular diagonal real summand $S_0$ can only decrease on smoothing. Use the same localized residual estimates (only point values needed), now with any same-curved-label explicit points both outside their wall; the $log \( 2 cosh \)$ tail again costs small decaying errors. On a same-variable smoothed diagonal the underlying shifts within a label stay regular uniformly after subtracting $S_0$, giving the stated uniform self bound.
  #strong[Summing the localized errors.] To make the cell summation explicit, if $a_j$ and $b_j$ are the local negative Sobolev norms of the two fields, the error is bounded by $C epsilon.alt_(upright("sm")) sum_(i \, j) e^(- c \| i - j \|) a_i b_j$. The convolution operator with matrix $e^(- c \| i - j \|)$ is bounded on $ell^2$. Cauchy–Schwarz, the magnetic energy norm equivalence, and the count bound then give $C epsilon.alt_(upright("sm")) \( B \( x \) + B \( z \) + 1 \)$. The omitted diagonal is treated separately, with one $C \( 1 + \| log h \| \)$ cost per explicit particle; it is never included in the off-diagonal estimate. ◻
]

#thm([Corollary 6.2.])[
  (Unshifted coercivity).  #emph[Consequently, for $z = 0$, 
#[#set math.equation(numbering: n => "(25)")
 $ Re cal(D) med gt.eq med c B \( x \) - C_(h \, epsilon) \( L + n_e \) $ <eq:M-23>]

 for small suitable $h \, epsilon$.]
] <cor:07_magnetic_analysis-unshifted>

#proof[
  The two anomaly logs subtracted from the action in (23) cost arbitrarily small positive fractions of $B \( x \)$ plus constants depending on parameters for their real parts (a lower bound suffices). Indeed use the $H^1$ bounds on main and decaying real upper bounds on far, with (22) and $x = Re alpha - mu + psi * zeta$. The imaginary correction is exactly $+ \( Im frak(t)_n \, z \)$.
  Choose $h$ after $epsilon$ so that the smoothing error is absorbed by the positive real form. Equation (24) and the diagonal bound leave at most $C_(h \, epsilon) n_e$; the bounded anomaly terms are covered by $C_(h \, epsilon) L$. ◻
]

=== 6.4 The common interval <the-common-interval>

A coarse tilt first bounds the number of far particles in the common interior. For the remaining configurations, a localized square completion then extracts the marked-pair gain.

For the remaining estimates assume polynomially bounded $n_e \, \| M \| \, ell_e$, in fixed powers of $L$. Our tilts are smooth density derivatives supported strictly within their wall intervals by macroscopic buffers (of size depending on parameters), with their #emph[primitives] compactly supported there, and polynomial fixed-derivative bounds. They depend only on the frozen data, not the variable real interior trial fluctuations. When a primitive used below is constant through the center rather than zero there, we discuss its implementation separately below.

#thm([Lemma 6.3.])[
  (The coarse magnetic tilt).  #emph[Take symmetric nonnegative smooth probes $phi_(+) \( u \) = phi_(-) \( - u \)$ of height order 1, rescaled bumps in $plus.minus \[ \( 1 - 2 delta \) L_X \, \( 1 - delta \) L_X \]$ for fixed small $delta > 0$. Let $I_phi = integral phi_(+) = integral phi_(-) asymp delta L_X$, and define the nonnegative probe drop by 
$ U = I_phi^(- 1) integral f_R^psi \( u \) \( phi_(-) \( u \) - phi_(+) \( u \) \) thin d u . $

 Here $f_R^psi$ is the weighted smeared far count to the right and is nonincreasing. A coarse tilt is $D_z = 0 \, med z_X = t_0 U \( phi_(+) - phi_(-) \)$. For small fixed $t_0 > 0$ it gives 
#[#set math.equation(numbering: n => "(26)")
 $ Re cal(D) med gt.eq med c B \( x \) + c_delta U^2 L - C_(h \, epsilon) \( L + n_e \) . $ <eq:M-24>]

]
] <lem:07_magnetic_analysis-coarse>

#proof[
  Indeed, on the straight comparison contours (main $X$ at $theta_oo$) the term $- \( x \, Im H z \)$ gives
  #[#set math.equation(numbering: n => "(27)")
   $ - 2 p integral D z_X - 2 pi integral f_R^psi z_X - \( x \, J_o z \) #h(2em) \( D_z = 0 \, med integral z_X = 0 \) . $ <eq:M-25>]
  The main sign matrix has upper entry $p$; each elementary far row, less the corresponding main row, has difference of its sign coefficients against the $X \, Y$ columns equal to $4 beta = pi$, directly by the far-row transform formulas. The residual $J_o$ is the straight odd kernel after subtracting its sign tail. The log-factor Fourier formulas give its decaying multiplier bounds, uniformly here since against main columns we’re away from real log poles in the straight comparison at fixed parameters (constants polynomial in $1 \/ epsilon$); near zero frequency these remainders are uniformly bounded also as $epsilon arrow.b 0$. For replacing a straight imaginary kernel by the curved kernel against tilts in macroscopic deep regions away from zero, the localized residual after the extra $upsilon$-terms with $tanh$ is negligible: where the two arguments are close both are exponentially-asymptotic to straight with derivatives (divide out the self singularity first); elsewhere use the exponential difference-tail estimates with one derivative in each variable. Schur bounds then control the operator against $H^(- 1 \/ 2)$-fields by an exponentially small norm, localizing the tilted variable by a slightly larger deep cutoff. In the extra $tanh$ terms $w_I upsilon_J \( v \)$ pairs against weighted-total $x$ via $D$, with $upsilon_J$ small on tilted support. The term $- upsilon_I \( u \) w_J$ vanishes when $D_z = 0$ (and for a deep-supported $D_z$ gains exponential smallness against $tanh'$). This justifies (27) up to negligible errors here. The far-count term is exactly $2 pi t_0 U^2 I_phi$. All mixed terms besides the $f_R^psi$-gain cost a fraction of $B \( x \)$ plus $O \( t_0^2 U^2 delta L \) + o \( L \)$ by these estimates and low-frequency concentration of the rescaled probes. The cost of $B \( z \)$ is similarly bounded; the anomaly term is favorable up to negligible errors by its tails. This proves (26), taking $h$ sufficiently small as indicated. In particular for bounded $U lt.eq U_0$ only $O \( U_0 \)$ far particles lie in $\[ - \( 1 - 2 delta \) L_X \, \( 1 - 2 delta \) L_X \]$.
  For a particle in the interval between the probe supports, its contribution to the difference of the normalized averages is bounded below by a positive constant once $L$ is large. The exponentially small smoothing tails do not alter this lower bound. Thus positivity of the counts gives the asserted $O \( U_0 \)$ bound on particles there. ◻
]

The common and shoulder intervals are shown in Figure 1. For $U lt.eq U_0$, localize the sharp tilt into the common region and the two shoulders. Use a smooth square partition of unity in $u$, including two nonnegative symmetric masks $w_c \, w_s$: the first is 1 in the common bulk (say $C delta L_X < \| u \| < \( 1 - C delta \) L_X$), supported away from zero and the common walls by $delta L_X$, and the second is 1 in the shoulder bulk $L_X + C delta L < \| u \| < L_Y - C delta L$, supported between these walls away from either by $delta L$. Here $C$ is a fixed sufficiently large constant; the second can be omitted when the interval between walls is sufficiently narrow. Use disjoint separated supports, derivatives $O_(delta \, j) \( L^(- j) \)$, with remaining masks varying only at distances $gt.tilde delta L_X$ from zero too. Such partitions follow by smoothed cosine/sine switches.

#thm([Lemma 6.4.])[
  (Localization of the real energy).  #emph[For each mask $w$, set $D_(y^w) = w D$ and $y_I^w = w x_I$ for $I eq.not Y$, and define $y_Y^w = \( w D \)' - sum_(I eq.not Y) w_I w x_I$. If $y^w$ denotes the resulting field, then 
$ sum_w B \( y^w \) = B \( x \) + o \( 1 \) B \( x \) \, #h(2em) B \( y^w \) gt.eq 0 . $

 On the common and shoulder masks, $B \( y^w \)$ may be replaced by its straight-contour form $B_oo \( y^w \)$ with error $o \( 1 \) B \( x \)$.]
] <lem:07_magnetic_analysis-localization>

#proof[
  Indeed the real linear-growth tail $- w_I w_J \| u - v \|$ contributes just $integral D^2$. In the remaining decaying kernels the extra term from differentiating masks in the main $Y$ charge, of type $w' D$, is negligible by Sobolev bounds (those decaying kernels are bounded forms on $H^(- 1 \/ 2)$; for main $Y$ entries as needed here this follows already from log diagonal plus smooth localized terms with one derivative in each variable and the harmless $\| u - v \|$ cusp). All other errors use the kernel times $1 - sum w \( u \) w \( v \)$, vanishing quadratically at the diagonal, with uniformly integrable bounds $O_delta \( L^(- 1) \)$ also after up to one derivative in each variable. Indeed this factor kills diagonal log derivative singularities, and where both arguments are near the exceptionally varying central scales the masks are constant (off diagonal at large separation only first graph derivatives are needed). The identity
  $ 1 - sum_w w \( u \) w \( v \) = 1 / 2 sum_w \( w \( u \) - w \( v \) \)^2 $
  makes the diagonal cancellation explicit. A differentiated error kernel has integrable bounds in both variables; applying Schur’s test after half a derivative on each side bounds its pairing on $H^(- 1 \/ 2) times H^(- 1 \/ 2)$. The terms involving $w' D$ are $o \( 1 \) B \( x \)$, because $parallel w' parallel_oo = O_delta \( L^(- 1) \)$ and $parallel D parallel_2^2 lt.eq C B \( x \)$. Each localized form is positive by the magnetic norm equivalence. On $w_c \, w_s$ we may also replace it by the straight $B_oo$ with negligible errors using again the log ratios after diagonal division and the decaying residual estimates (real growth tail unchanged). Write the localized real fields on these masks as $y^c \, y^s$. ◻
]

#thm([Lemma 6.5.])[
  (The common-region trial gain).  #emph[For the unscaled common-region tilt, set $z_X = A_0 "sign" \( u \) w_c^2 \, med z_Y = - z_X \, med A_0 = 6 beta \/ \( 2 kappa \)$, denoting these components by $z^c$. The reserve factor $v_0$ is introduced in Proposition 18. Then 
#[#set math.equation(numbering: n => "(28)")
 $ B_oo \( y^c \) - B \( z^c \) - \( x \, Im H z^c \) + \( Im frak(t)_n \, z^c \) med gt.eq med integral w_c^2 thin d u - o \( B \( x \) + L \) $ <eq:M-26>]

 with errors understood as terms having coefficient tending to zero.]
] <lem:07_magnetic_analysis-common>

#proof[
  In (27) the far part is favorable by monotonicity, and the anomaly gives $6 beta A_0 integral w_c^2 + o \( L \)$. The odd remainder costs $o \( sqrt(L) \) sqrt(B \( x \))$ by Fourier bounds and low-frequency concentration. The cost $B \( z^c \)$ is $\( kappa - p^2 \) A_0^2 integral w_c^4 + o \( L \)$ by the straight main symbol. At small frequency the real $B_oo$ symbol in variables $D \, x_(I eq.not Y)$ has the $D$ coefficient 1 and mixed $D$ terms vanishing at zero; the complementary block stays strictly positive by the real norm bound. To spell out the square completion, let $cal(B) \( k \)$ be the real energy symbol in these variables, with the convention that its $D \, D$ entry tends to one. For $f_L \( u \) = "sign" \( u \) w_c \( u \)$, minimizing the quadratic form against the linear test at each frequency gives
  $ B_oo \( y^c \) - 2 p A_0 integral \( w_c D \) f_L gt.eq - frac(p^2 A_0^2, 2 pi) integral \| hat(f)_L \( k \) \|^2 \[ cal(B) \( k \)^(- 1) \]_(D D) thin d k . $
  The inverse entry tends to one at zero, since the mixed block vanishes there and the complementary block is strictly positive. Its growth away from zero is polynomial by the energy norm equivalence. The smooth scaled function $f_L$ has Fourier mass concentrated at frequencies of order $L^(- 1)$, with arbitrarily rapid decay outside that scale. Splitting the integral at a small fixed frequency and then letting that cutoff tend to zero shows that the right side equals $- p^2 A_0^2 integral w_c^2 - o \( L \)$. Finally $0 lt.eq w_c lt.eq 1$ and $kappa > p^2$, so the sum of the two negative quadratic costs is at least $- kappa A_0^2 integral w_c^2 - o \( L \)$. Since $A_0 = 3 beta \/ kappa$, $6 beta A_0 - kappa A_0^2 = 9 beta^2 \/ kappa = 1$, proving (28). ◻
]

=== 6.5 The shoulders <the-shoulders>

Only the $Y$ main particles remain in the shoulders. Eliminating their real and imaginary responses leaves a reduced kernel on every other label. Its positivity and self cost will control the shoulder activities.

#thm([Lemma 6.6.])[
  (The shoulder trial gain).  #emph[In the shoulder calculation let $e$ index #emph[all labels except main $Y$], and use straight translation-invariant kernels below. Set, as matrix kernels, 
$ cal(H) = Re \( H_(e e) - P \) \, #h(2em) hat(P) = hat(H)_(e Y) hat(H)_(Y Y)^(- 1) hat(H)_(Y e) quad \( k eq.not 0 \) $

 with $Re P$ chosen to have real tail $- w_I w_J \| u - v \|$ plus decaying terms. Put $K_1 = \( Im H_(e Y) \) partial \, med H_p = - H_(Y Y) partial^2$, where $H_p$ denotes the positive scalar primitive symbol $k^2 hat(H)_(Y Y)$ (including its positive limit at zero). Take 
$ a = w_s \( psi * zeta \)_e \, #h(2em) V_0 = - H_p^(- 1) K_1^(sans(t)) a \, #h(2em) D_(z^s) = w_s V_0 \, quad z_X^s = 0 \, quad z_Y^s = \( w_s V_0 \)' . $

 The multipliers to $V_0$ are exponentially decreasing analytic symbols on some strip around real frequency, by the far-row and straight main formulas ($X$ heights at least $1 \/ 2$, far interactions against main $Y$ regular with margin). All needed derivatives of $V_0$ are thus polynomially bounded under count truncations. Moreover $a - w_s x_e$ is exponentially small in the negative norm (only the tail mean of main $X$), so these fields have the required Sobolev sizes bounded by $C sqrt(B \( x \) + 1)$, with $C$ uniform at small $epsilon$ and sufficiently large $L$. Then 
#[#set math.equation(numbering: n => "(29)")
 $ B_oo \( y^s \) - B \( z^s \) - \( x \, Im H z^s \) + \( Im frak(t)_n \, z^s \) med gt.eq med 1 / 2 \( a \, cal(H) a \) - o \( B \( x \) + 1 \) . $ <eq:M-27>]

]
] <lem:07_magnetic_analysis-shoulder>

#proof[
  Indeed the anomaly pairs against a derivative supported deep in each tail with vanishing integral there. The curved imaginary corrections are negligible as explained after (27); on straight kernels the mixed term is $- \( w_s x_e \, K_1 V_0 \)$ up to negligible commutators (the differentiated kernels are smooth exponentially decreasing with derivatives). Also $2 B \( z^s \) = \( w_s V_0 \, H_p w_s V_0 \) lt.eq \( V_0 \, H_p V_0 \) + o \( B \( x \) + 1 \)$ by the same square partition argument on main $Y$ alone. This recovers plus half the square of the imaginary coupling with $H_p^(- 1)$. In $B_oo \( y^s \)$ minimizing over the remaining real total primitive at each frequency gives the real Schur subtraction $\( Re H_(e Y) \) H_(Y Y)^(- 1) \( Re H_(Y e) \)$ from $Re H_(e e)$; here both are combined before integration, via the neutral form symbols, so no zero-frequency subtraction constants enter. The resulting bounded symbol (order $- 1$ at infinity) acts on $w_s x_e$, replaceable by $a$ as above. Combining gives (29). The cross term in $B \( z^c + z^s \)$ is negligible by support separation and the zero common total, using exponentially decaying real residual kernels.
  The sign in this completion is essential: if $b = K_1^(sans(t)) a$, then $V_0 = - H_p^(- 1) b$ gives
  $ - 1 / 2 \( V_0 \, H_p V_0 \) - \( b \, V_0 \) = 1 / 2 \( b \, H_p^(- 1) b \) . $
  Adding this positive term to the real Schur complement produces $"Re" \( H_(e e) - H_(e Y) H_(Y Y)^(- 1) H_(Y e) \)$, rather than the Schur complement of $"Re" H$ alone. ◻
]

#thm([Lemma 6.7.])[
  (Positivity and self cost of the reduced shoulder kernel).  #emph[For the straight asymptotic labels and all sufficiently small $epsilon > 0$, the tail-normalized kernel $P$ above satisfies 
#[#set math.equation(numbering: n => "(30)")
 $ cal(H)_(I J) \( r \) gt.eq - C epsilon e^(- c_2 \| r \|) \, #h(2em) "Re" P_(I I) \( 0 \) lt.eq - w_I^2 pi \/ 2 . $ <eq:M-28>]

 The first inequality is entrywise off point singularities. Its constants are uniform as $epsilon arrow.b 0$.]
] <lem:07_magnetic_analysis-positive>

#proof[
  #strong[The reduced kernel.] We first identify the reduced kernels, and then estimate their off-diagonal and diagonal parts separately. Use $x = beta k$. Define
  $ F_y \( r \) = 2 "atanh" \( sin \( pi y \/ 6 \) "sech" \( pi r \/ \( 6 beta \) \) \) \, #h(2em) G_y = F_(y + 1) - F_y + F_(y - 1) . $
  For $\| y \| lt.eq 3$, $F_y$ has symbol $2 pi sinh \( y x \) \/ \( k cosh \( 3 x \) \)$: differentiate in $y$ and use the elementary sech transform by residues (imaginary shifts inside the first poles); extend to the endpoints by log integrability. Beyond that range use the foldings indicated by the sine.
  For two elementary constituents let $d$ be their absolute height difference in $beta$ units. Then the following give their contributions to $cal(H)$:
  - across groups, $G_(d - 4)$;
  - within a group, $\( G_(2 + d) + G_(2 - d) \) \/ 2$, plus only in group $X$ a correction with symbol
    $ frac(2 pi, k) frac(c_(*) \( k \) sinh x cosh \( d x \), 4 cosh x cosh \( 2 x \) cosh \( 3 x \)) . $
  Indeed divide all $H_(I Y)$ symbols by $2 pi c_(*) \/ \( k sinh \( 4 x \) \)$; the contributions are $e^(\( 3 - a \) x)$ for $X$ elementary at height $a$, $e^(\( - 4 + j \) x) cosh x$ for $Y$ far at height $- j$, with main $Y$-entry $cosh \( 3 x \)$. For a cross pair, before folding at $d + h = 8 \, med h = 0 \, 1 \, 2$, its real $H$-numerator in the same normalization is $cosh \( \( 3 - d \) x \)$. The subtraction uses $cosh \( \( 7 - d \) x \) cosh x \/ cosh \( 3 x \)$, giving just the unfurled $G_(d - 4)$ expression by product-to-sum. Each crossing replaces a $cosh \( \( 4 - d - h \) x \) \/ sinh \( 4 x \)$ by its reflected expression, adding $2 sinh \( \( 8 - d - h \) x \)$ with the same coefficient; this is precisely the fold correction of $F_(d + h - 5)$. For a same-group pair before crossings at $d = 1 \, 2$, the real symbol divided now by $2 pi \/ k$ is $c_(*) cosh \( 3 x \) cosh \( d x \) \/ sinh \( 4 x \) - sinh \( d x \)$; the last term corresponds to folding $F_(3 + d) \/ 2$. Subtracting $c_(*) cosh^2 \( x \) cosh \( d x \) \/ \( sinh \( 4 x \) cosh \( 3 x \) \)$ gives the stated $Y$ expression, with crossings again exactly folds (additional $+ sinh \( \( d - 1 \) x \) \, - sinh \( \( d - 2 \) x \)$ respectively). For $X$ remove the $cosh^2 \( x \)$ in that subtraction, giving the correction. This covers the whole indicated ranges. Real tails cancel at infinity, excluding affine ambiguities; the prescription of $Re P$ with two derivatives given by the symbols is smooth analytic with exponentially decaying second derivatives as used above (heights here within fixed decay margins).
  #strong[Positivity at zero far-contour parameter.] All resulting #emph[fused] entries are nonnegative at $epsilon = 0$, off point singularities. For the extra correction at $\| d \| lt.eq 3$, use the three factors
  $ frac(sinh x, k cosh x) \, #h(2em) frac(c_(*), cosh \( 2 x \)) \, #h(2em) frac(cosh \( d x \), cosh \( 3 x \)) . $
  Each has a positive inverse transform as a measure: use averaging and real parts of imaginary-shifted sech (for $c_(*) = 2 cosh x - 1$, the shifted real sech dominates $cos \( pi \/ 4 \)$ times the unshifted). When one partner is a double, pair differences $d \, d + 1$ signed; combining the two uses $c_(*) cosh \( x \/ 2 \) = cosh \( 3 x \/ 2 \)$, also positive by the same test for $\| d + 1 \/ 2 \| lt.eq 3$, which holds at zero parameter. Any perturbative deficit here is $O \( epsilon \) e^(- c_2 \| r \|)$ by the individual analytic symbols with decay margins.
  For the $G$-terms note $G_y gt.eq 0$ for $0 lt.eq y lt.eq 21 \/ 8$: with $t_1 = pi y \/ 6 \, med q_0 = "sech" \( pi r \/ \( 6 beta \) \)$, the hyperbolic tangent addition comparison reduces to $sqrt(3) gt.eq 1 + q_0^2 \( sin^2 t_1 - 1 \/ 4 \)$, true since $sin^2 \( 7 pi \/ 16 \) + 3 \/ 4 < sqrt(3)$. This handles the singleton cross pairs, while double cross partners combine by $G_v + G_(v + 1) = F_(v - 1) + F_(v + 2) gt.eq 0$ at $- 1 \/ 2 lt.eq v lt.eq 3$. For like-group singleton pairs only $d = 0$ or $d in \[ 17 \/ 8 \, 21 \/ 8 \]$ are needed. In the latter case $G_(2 + d) = G_(2 - y) gt.eq G_y = - G_(2 - d)$, $y = d - 2$: compare odd Taylor powers of atanh at $t_1 = pi y \/ 6 in \[ pi \/ 48 \, 5 pi \/ 48 \]$ and $pi \/ 3 - t_1$. The linear difference favors the latter; for third powers use $sin^3 alpha = \( 3 sin alpha - sin \( 3 alpha \) \) \/ 4$, whose triple-angle contribution is identical. For odd orders $m gt.eq 5$, the difference (apart from common coefficients) is
  $ cos^m t_1 - sin^m \( pi \/ 3 - t_1 \) + 2 sin^m \( pi \/ 6 - t_1 \) - sin^m \( pi \/ 6 + t_1 \) + sin^m t_1 med gt.eq med .945^m - .833^m - .754^m > 0 . $
  The last strict inequality holds at $m = 5$, where the difference exceeds $0.1088$. Dividing by $.945^m$ shows that it persists for every larger $m$, since both ratios $.833 \/ .945$ and $.754 \/ .945$ are less than one. For a same-group double combine at signed differences $d \, d + 1$; the four $G$’s become $F_(1 + d) + F_(4 + d) + F_(- d) + F_(3 - d)$. The necessary lower differences (double heights counted upwards in $X$, or in absolute value in $Y$) at zero parameter are $d in \[ 2 \, 5 \/ 2 \]$ or $d in \[ - 1 \, 0 \]$. In the first case $F_(1 + d) gt.eq F_d \, med F_(3 - d) gt.eq F_(d - 2) = - F_(4 + d)$; in the second all terms are positive or zero.
  #strong[Moving the far double.] For small $epsilon > 0$ only combinations involving the moved $X$-double can change. Cross partners there continue positive: for $1 lt.eq v lt.eq 3$ use the preceding identity, while for $3 lt.eq v lt.eq 4$, $sin \( pi \( v - 1 \) \/ 6 \) gt.eq - sin \( pi \( v + 2 \) \/ 6 \)$, so that $F_(v - 1) + F_(v + 2) gt.eq 0$. Thus the whole range $1 lt.eq v lt.eq 4$ is covered; in the just indicated same-group comparisons, every loss costs only $C epsilon e^(- c_2 \| r \|)$ by differentiation wherever the comparison may fail (e.g. $d$ near $5 \/ 2$), away from negative log divergences. Explicitly the case $d in \[ 2 + epsilon \, 5 \/ 2 + epsilon \]$ obeys the same inequalities until $5 \/ 2$, and the other moving lower difference is $d = - 1 \/ 8 + epsilon$. This proves the first bound in (30).
  #strong[The diagonal self cost.] Finally by tail normalization
  $ Re P_(I I) \( 0 \) = w_I^2 integral_0^oo [frac(2 c_(*) \( x \/ beta \) A_I \( x \)^2, x sinh \( 4 x \) cosh \( 3 x \)) - frac(1, 2 x^2)] d x $
  where $A_I = 1$ or $cosh x$ for $X$ or $Y$ respectively, times $cosh \( x \/ 2 \)$ for a double. We have
  $ 4 x \( 2 cosh x - 1 \) cosh^2 x cosh^2 \( x \/ 2 \) \( 1 + 4 x^2 \) med lt.eq med sinh \( 4 x \) cosh \( 3 x \) \, #h(2em) x gt.eq 0 . $
  Indeed the coefficient condition by product-to-sum is $\( 2 n + 1 \) \( b_n + 4 \( 2 n \) \( 2 n - 1 \) b_(n - 1) \) lt.eq 7 dot.op 49^n + 1$, $b_n = delta_(n 0) + 3 + 2 dot.op 4^n + 9^n + 16^n$, second summand absent at zero. For $n = 0 \, 1 \, 2 \, 3$ the left sides are $8 \, 300 \, 10500 \, 347172$; thereafter both left summands grow by a factor at most $16 \( 2 n + 3 \) \( 2 n + 2 \) \/ \( 2 n \( 2 n - 1 \) \)$ from $n$ to $n + 1 \, med n gt.eq 3$. This factor is at most $38.4$ for $n gt.eq 3$, whereas $\( 7 dot.op 49^(n + 1) + 1 \) \/ \( 7 dot.op 49^n + 1 \) > 48$; the four checked cases therefore initiate the induction. Thus the bracket is bounded above by $- 2 \/ \( 1 + 4 x^2 \)$, and $integral_0^oo 2 \/ \( 1 + 4 x^2 \) thin d x = pi \/ 2$, proving the second inequality in Equation (30). ◻
]

=== 6.6 Combining the trial fields and summing explicit particles <combining-the-trial-fields-and-summing-explicit-particles>

We combine the common and shoulder fields while reserving enough positive energy to absorb smoothing errors. The explicit particles will then be summed with their actual activities and factorial measures.

#thm([Proposition 6.8.])[
  (The sharp magnetic trial estimate).  #emph[Suppose $U lt.eq U_0$. Fix sufficiently small $epsilon > 0$, choose $h = epsilon^(K_2)$ with $K_2$ sufficiently large, and put $v_0 = 1 - sqrt(epsilon)$. For the tilt $v_0 \( z^c + z^s \)$, 
#[#set math.equation(numbering: n => "(31)")
 $ Re cal(D) med gt.eq med & c_(epsilon \, h) { B \( x \) + ell_e + \( M^2 + n_e^2 \) \/ L } + 2 L_X - o_epsilon \( 1 \) L - O \( delta L \) - o \( L \)\
 & - sum_(v in zeta) [v_0 / 2 w_s \( v \)^2 Re P_(I \( v \) I \( v \)) \( 0 \) + C \( 1 + \| log h \| \) \( 1 - v_0 w_s \( v \)^2 \)] . $ <eq:M-29>]

 Use zero for an unnecessary $P$ entry in this notation. Constants depending on $h \, epsilon \, delta$ have been absorbed in the little-oh in $L$. Here $c_(epsilon \, h) > 0$ may be chosen independently of small fixed $delta$, and $o_epsilon \( 1 \) arrow.r 0$ in the indicated parameter order.]
] <prop:07_magnetic_analysis-sharp>

#proof[
  To use (28),(29) simultaneously while retaining control, fix small far parameter $epsilon > 0$, take $h = epsilon^(K_2)$ for a sufficiently large fixed $K_2$, set $eta_0 = sqrt(epsilon)$, and #emph[scale both tilts] by $v_0 = 1 - eta_0$. Keep $v_0 B \( x \)$ for localization; the tilt cost is no worse than scaling the old costs by $v_0$, leaving a real-energy reserve. The smoothing errors of (23) can use small portions of that reserve (and $o_epsilon \( 1 \) L$), since the unscaled $B \( z \) lt.eq C \( B \( x \) + L \)$. In $Delta_H$ split off the piece with entry weights $v_0 w_s \( u \) w_s \( v \)$ on the explicit positions (same convention for missing diagonals). On the complement (24) costs $o \( eta_0 \) B \( x \) + o \( 1 \)$, plus the diagonal omission bound
  $ - C \( 1 + \| log h \| \) sum_(v in zeta) \( 1 - v_0 w_s \( v \)^2 \) . $
  For the piece split off only $e$ labels intervene. All curvature changes there are negligible even after smoothing, since straight approximation holds exponentially well on deep support (with log ratios at the main diagonal), with buffers to any exceptional smearing regions where only pointwise residual bounds are needed. After combining with $v_0 \( a \, cal(H) a \) \/ 2$ the result is
  $ v_0 / 2 \( w_s zeta_e \, cal(H) w_s zeta_e \)_(upright("off")) - v_0 / 2 sum_(v in zeta_e) w_s \( v \)^2 Re P_(I \( v \) I \( v \)) \( 0 \) $
  up to negligible errors or $o \( eta_0 \) \( B \( x \) + 1 \)$. Indeed one can replace $a$ by $psi * \( w_s zeta_e \)$ in that quadratic by slow variation, with error at most $C_(epsilon \, h \, delta) L^(- 1) sum n_j^2$ using the decaying kernel $cal(H)$ (at most local log singularities, as proved in Lemma 17). The remaining averaging errors use $Re \( P - psi P psi \)$, $O \( h^(c_2) \)$ with exponential spatial decay, since after two derivatives the symbol of $Re P$ is analytic and exponentially decreasing, uniformly here.
  Thus (22) absorbs the first lower-bound error by the reserve. In this argument the off-diagonal deficit is at most $C epsilon sum_j n_j^2$. By Equation (22), its energy coefficient is $O \( epsilon \( 1 + \| log h \| \) \) = o \( sqrt(epsilon) \)$. The smoothing errors are smaller still when $K_2$ is large. These estimates leave a fixed positive fraction of the $sqrt(epsilon) B \( x \)$ reserve. Applying Equation (22) to a further fraction of that reserve gives the tail and count terms in (31). Finally $integral w_c^2 = 2 L_X - O \( delta L \)$, and scaling the gain by $v_0$ loses only $O \( sqrt(epsilon) L \)$. ◻
]

#thm([Corollary 6.9.])[
  (Summation of explicit particles).  #emph[After applying Proposition 18, the sum and integrals over explicit particles with $U lt.eq U_0$ cost at most 
#[#set math.equation(numbering: n => "(32)")
 $ exp #scale(x: 120%, y: 120%)[\(] \( .44 + o_epsilon \( 1 \) \) thin 2 \( L_Y - L_X \) + C_(epsilon \, h) delta L + o \( L \) #scale(x: 120%, y: 120%)[\)] $ <eq:M-30>]

 besides the negative bulk cost and any reference fluctuation cost.]
] <cor:07_magnetic_analysis-activities>

#proof[
  Indeed in deep shoulders there are three singleton types and two double types (no main $Y$); $\( mu \, R delta_v \) = o \( 1 \)$, curve Jacobian modulus $1 + o \( 1 \)$ where applicable, and the deep extra log penalty $C \( 1 + \| log h \| \) eta_0 = o \( 1 \)$ per particle. By (30) the limiting sum of grand activities per unit length there is bounded by $3 \( d \/ c \) e^(- pi \/ 4) \/ \( 2 pi \) + 2 dot.op 4 c^2 \( d \/ c \)^2 e^(- pi) \/ \( 2 pi \) = 0.429757 dots.h < 0.44$. All boundary and transition buffers have only $O \( delta L \)$ volume; two infinite ends also use the $ell_e$ damping. Common interior far counts are bounded by (26); thus factorial integration with the indicated per-particle constants gives (32). The polynomially many allowed $M$’s cost only $e^(o \( L \))$. In using coarse bounds, summing with $e^(C_(epsilon \, h) n_e)$ and part of the retained damping costs at most $e^(O_(epsilon \, h) \( L \))$; $U_0$ can be chosen sufficiently large afterwards.
  For example, for a species of activity $a$ on a set of length $V$, the factorial sum is
  $ sum_(m gt.eq 0) \( a V \)^m \/ m ! = e^(a V) . $
  This identity applied species by species explains both the shoulder contribution and the buffer-volume bound. On an infinite end, replace $V$ by $integral_0^oo e^(- c_(epsilon \, h) r) thin d r$, retaining the $ell_e$ penalty. In the common interior the bounded number of far particles contributes at most a fixed power of $L$, hence $e^(o \( L \))$. ◻
]

=== 6.7 Selecting marks for the polygon moment <selecting-marks-for-the-polygon-moment>

We also use the planar polygon tail

#[#set math.equation(numbering: n => "(33)")
 $ sum_(\[ P \] : "diam" P > R) rho_(upright(v))^(\| P \|) lt.eq C \( 1 + R \)^(- 2) \, #h(2em) R gt.eq 0 \, $ <eq:planar-tail>]

from [10] Theorem 10.5. Its classes are unrooted, unoriented polygons modulo triangular-lattice translations, with vertex length. This positive estimate is used only to dispose of polygons too short for the geometric marked-pair selection. It is distinct from the reference-law and contour inputs used to estimate the marked integral.

#thm([Lemma 6.10.])[
  (Reduction to marks with macroscopic margins).  #emph[For the polygon second-moment estimate, it suffices to implement the trial bounds under the additional margin $L_X gt.eq c_1 L$ and, when $t eq.not 1$, $s \( 1 - t \) gt.eq e^(c_4 L)$ for a fixed sufficiently small $c_4 > 0$. This latter margin matters for tilting primitives through the central region. More precisely, a uniform marked-pair estimate 
$ cal(C) \( p \, p' \) lt.eq D^(o \( 1 \)) s^(- 4 \/ 3) \( D \/ s \)^(2 \/ 3) $

 for the resulting configurations with $b asymp D$ implies the required second-length moment bound at dyadic diameter $D$.]
] <lem:07_magnetic_analysis-marks>

#proof[
  Fix a dyadic diameter bin $D \/ 2 < "diam" P lt.eq D$. We retain a fixed positive fraction of the ordered vertex pairs on every sufficiently long polygon in this bin, then compare their weights with marked cylinder correlations.
  #strong[Short polygons and retained pairs.] By Equation (33), polygons of length at most $D^(4 \/ 3)$ contribute at most $C D^(- 2) D^(8 \/ 3) = O \( D^(2 \/ 3) \)$ to the second-length mass in this bin. On a longer polygon, retain the ordered pairs whose separation exceeds $D^(1 \/ 2)$ and whose displacement has perpendicular component greater than $D^(1 \/ 8)$ in absolute value to each of the three triangular lattice directions. For each first vertex, the excluded disk contains $O \( D \)$ lattice vertices, and the three excluded strips within distance $D$ contain $O \( D^(1 + 1 \/ 8) \)$. Since $\| P \| > D^(4 \/ 3)$, at least half of its ordered vertex pairs remain once $D$ is large.
  #strong[A row determined by the two ports.] Choose a triangular angular basis whose positive $60^compose$ cone contains the directed displacement. At each endpoint triangle, at least one of the two occupied sides has an allowed direction, since only one of the three side directions is excluded. Move the endpoint to such an occupied port, using a fixed rule if there is a choice. These moves have bounded length and preserve the retained margins. Write $e_1 \, e_2$ for the chosen unit basis sides and $h_p \, h_(p')$ for the positive half-side vectors at the resulting ports. Then
  $ p' - p - h_p - h_(p') = m_1 e_1 + m_2 e_2 \, #h(2em) m_1 \, m_2 in bb(Z)_(gt.eq 0) \, quad m_j gt.double D^(1 \/ 8) . $
  The left side joins vertices of the triangular tiling, which proves integrality. The angular margin gives the two positive lower bounds. Travel from $p$ along $h_p$, then along the $m_1 + m_2$ complete sides in a fixed order, and finally along $h_(p')$ to $p'$. This gives a row with $s = m_1 + m_2$ ordinary bands and $s asymp \| p - p' \|$.
  Choose among the finitely many rotations and reflections so that the larger coefficient is assigned to the upper site height. Let $e_(upright("low"))$ be the other basis direction. Continue from $p'$ along its remaining half-side, then along $b$ complete sides in direction $e_(upright("low"))$, and finish with a half-side parallel to $h_p$. The period vector is
  $ T = m_1 e_1 + m_2 e_2 + b e_(upright("low")) + 2 h_p + 2 h_(p') . $
  All increments lie in the same positive cone, so the repeated row is simple and $\| T \| gt.eq T dot.op e_(upright("low")) gt.eq b$. Choose $b$ to be the smallest integer at least $K D$ for which $s + b + 2$ is even, with $K$ a fixed sufficiently large constant. Then $b asymp D$, $s lt.eq b$, and $\| T \| > 2 D$. No two points of $P$ can differ by a nonzero integer multiple of $T$, so its cylinder projection is injective. This choice of row and period depends only on the port data, the chosen basis, and $D$. Figure 2 shows the endpoint half-sides, a fixed order of the ordinary bands, and the complementary part of the period.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0.49, 0), (2.45, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((2.45, 0), (3.92, 2.546), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((0.98, 0), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((1.96, 0), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((2.695, 0.4244), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.185, 1.273), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.675, 2.122), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.47, 0.1274), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$X$]]], anchor: "south", padding: 0.1176cm)
  content((1.47, -0.0784), [#text(size: 9pt)[$m_1e_1$]], anchor: "north", padding: 0.1176cm)
  content((3.087, 1.274), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$m_2e_2$]]], anchor: "south", angle: 60deg, padding: 0.1176cm)
  line((-0.49, 0), (0, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0.49, 0), stroke: (paint: rgb("#5a005a"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#5a005a"))))
  line((3.92, 2.546), (4.165, 2.97), stroke: (paint: rgb("#5a005a"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#5a005a"))))
  line((4.165, 2.97), (4.41, 3.395), stroke: (paint: rgb("#5a005a"), thickness: 0.8pt, miter-limit: 10))
  line((9.31, 3.395), (9.8, 3.395), stroke: (paint: rgb("#5a005a"), thickness: 0.8pt, miter-limit: 10))
  line((9.8, 3.395), (10.29, 3.395), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  content((0.2254, 0.1176), [#text(fill: rgb("#5a005a"))[#text(size: 9pt)[$h_p$]]], anchor: "south", padding: 0.1176cm)
  content((3.998, 2.852), [#text(fill: rgb("#5a005a"))[#text(size: 9pt)[$h_(p')$]]], anchor: "east", padding: 0.1176cm)
  line((4.41, 3.395), (9.31, 3.395), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10))
  circle((4.9, 3.395), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  circle((5.88, 3.395), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  circle((6.86, 3.395), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  circle((7.84, 3.395), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  circle((8.82, 3.395), radius: 0.08481, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  content((6.86, 3.512), [#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$Y$: $b$ bands in direction $e_1$]]], anchor: "south", padding: 0.1176cm)
  circle((0.49, 0), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((2.45, 0), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((3.92, 2.546), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((4.41, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((9.31, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((1.47, 0), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((2.94, 0.8487), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((3.43, 1.697), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((5.39, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((6.37, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((7.35, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((8.33, 3.395), radius: 0.04989, fill: rgb("#a6a6a6"), stroke: none)
  circle((0, 0), radius: 0.1048, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0), [$p$], anchor: "east")
  circle((4.165, 2.97), radius: 0.1048, fill: rgb("#000000"), stroke: none)
  content((4.14, 2.995), [$p'$], anchor: "south-east")
  circle((9.8, 3.395), radius: 0.1048, fill: rgb("#000000"), stroke: none)
  content((9.825, 3.37), [$p+T$], anchor: "north-west")
  line((0.294, -1.225), (10.09, 2.17), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: rgb("#404040"))))
  content((5.194, 0.4724), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$T=m_1e_1+m_2e_2+"be"_1+2h_p+2h_(p')$]]])], anchor: "north")
  line((0.196, 2.009), (1.176, 2.009), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.176, 2.009), [#text(size: 9pt)[$e_1$ \(low\)]], anchor: "west", padding: 0.1176cm)
  line((0.196, 2.009), (0.686, 2.858), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.686, 2.858), [#text(size: 9pt)[$e_2$ \(upper\)]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 2: Constructing the cyclic cut from an ordered pair of visited ports. Open circles are ordinary ports at the midpoints of complete triangular sides; black circles are the marks. The $X$ part joins $p + h_p$ to $p' - h_(p')$ using $m_1$ sides in direction $e_1$ and $m_2$ in direction $e_2$, in a fixed order. The complementary part has $b$ ordinary sides in the low direction. The displayed mark types have $h_p = e_1 \/ 2$ and $h_(p') = e_2 \/ 2$; either half-side can have either allowed direction. Identifying $p + T$ with $p$ closes the row on the cylinder. Taking $\| T \| > 2 D$ makes projection injective on each planar polygon of diameter at most $D$. Counts and lengths are illustrative. ],
  ) <fig:marked-row>
  The retained pairs have $s gt.double D^(1 \/ 2)$, and the minority count is $s \( 1 - t \) = min \( m_1 \, m_2 \) gt.double D^(1 \/ 8)$. Consequently
  $ L_X gt.eq frac(log D, 2 gamma) - O \( 1 \) \, #h(2em) L_Y = frac(log D, gamma) + O \( 1 \) . $
  Every fixed $0 < c_1 < 1 \/ 2$ and $0 < c_4 < gamma \/ 8$ therefore gives $L_X gt.eq c_1 L_Y$ and $s \( 1 - t \) gt.eq e^(c_4 L_Y)$ for all sufficiently large $D$. These configurations meet the stated margins.
  #strong[Counting the marked occurrences.] Moving a vertex to an incident port has at most two inverse choices at each endpoint. The choices of basis, rotation, reflection, and port type also have bounded multiplicity. Normalize the first port modulo triangular-lattice translations. Once its lift is fixed, the projected polygon has a unique planar lift through that port, with its original vertex weight. Thus the retained pairs account for at least a fixed multiple of $\| P \|^2$ marked occurrences, and any one marked cylinder polygon arises from at most a fixed number of these occurrences.
  For a dyadic displacement scale $S$, let $cal(R)_(D \, S)$ be the row setups just constructed with $S lt.eq s < 2 S$, and write $cal(C)_(frak(r))$ for the corresponding marked correlation. There are $O \( S^2 \)$ setups: after fixing the first port type, there are only $O \( S^2 \)$ possible second-port displacements, and the remaining choices are bounded. Positivity and the preceding multiplicity bounds give
  $ sum_(\[ P \] : med D \/ 2 < "diam" P lt.eq D\
\| P \| > D^(4 \/ 3)) rho_(upright(v))^(\| P \|) \| P \|^2 lt.eq C sum_(S med upright("dyadic")\
D^(1 \/ 2) lt.double S lt.double D) med sum_(frak(r) in cal(R)_(D \, S)) cal(C)_(frak(r)) . $
  A bound of the stated form makes each displacement scale contribute at most $D^(2 \/ 3 + o \( 1 \))$. The $O \( log D \)$ scales and the short-polygon estimate prove the claimed reduction. ◻
]

== 7 Magnetic fluctuations and the rare central scale <sec:07_magnetic_analysis-fluctuations>

The trial bounds have reduced the problem to a reference integral with fixed integer dimensions. Its Hessian sees the entire wall intervals on the main contours, including the rare central scale. This differs from the preceding smoothing estimates, where a same-main explicit particle can reach that scale only through an exponentially small smoothing tail. We first control the Hessian and its determinant at the rare scale. We then choose a coordinate in which the trial fields can be implemented by small particle motions, adapting the reference and contour arguments of [10] to the unequal magnetic walls.

=== 7.1 Reference coordinates and the relative Hessian <reference-coordinates-and-the-relative-hessian>

We now implement (25),(26),(31) under the parameter margins just stated. Retain the sizes $s_g$ and unit-mass mean densities $macron(nu)_g$ introduced in the trial setup. In this part no interpolation of dimensions, nor continuation in $M$, is needed: use $N_g = m'_g$ particles in the reference integral of group $g$ (only nonnegative integer dimensions occur). All inner trial changes have zero mass separately by group. After the polynomial count truncation justified in the proof of Proposition 25, $N_g = s_g + O \( L^K \)$ for a fixed $K$, whereas $s_g = e^(gamma L_g)$; hence $N_g asymp s_g$. Phase factors depending only on counts have modulus one.

We may work on subsequences on which $L_X \/ L$ and the mixture fraction $t$ have limits. Call the case $lim t < 1$, or $t = 1$ identically, regular. In the remaining case, passing to another subsequence, $t < 1 \, med t arrow.r 1$; call this the rare case and use the scale $d_0 = beta \( 1 - theta \( 0 \) \)$ from the curve estimates. Thus $log \( 1 \/ d_0 \) = O \( L \)$, and $s d_0$ grows at least as $e^(c L)$ for some $c > 0$.

We first specify the cap maps used in the reference coordinates. For an interval $\[ - Lambda \, Lambda \]$ choose a fixed $a_0 = O \( 1 \)$ and an odd map $W : \[ - Lambda - a_0 \, Lambda + a_0 \] arrow.r \[ - Lambda \, Lambda \]$. At the positive endpoint write $W \( Lambda + a_0 - r \) = Lambda - omega \( r \)$, where $omega$ is quadratic near zero, increasing with $omega' \( r \) asymp min \( r \, 1 \)$, and $omega \( r \) = r - a_0$ for $r gt.eq 1$. Integrating a smooth cutoff between $r$ and one constructs $omega$ and fixes $a_0$. Thus $W \( v \) = v$ away from bounded endpoint neighborhoods and reflects evenly at the endpoints.

Use first an #emph[unstretched] parameter $v$ per wall interval. In the regular case set the intermediate coordinate $xi = u$ on each, and use the cap map $xi = W_g \( v \)$ onto $\[ - L_g \, L_g \]$ using the cap construction just given for each separate length. Take the reference probability with density in $v$

$ lambda_g^0 \( v \) = C_g thin eta_g \( W_g \( v \) \) \, #h(2em) eta_g = macron(nu)_g . $

In the rare case do this on $Y$ as usual, but on $X$ set $xi = b_X \( u \)$ by the mean-matching map, use $W_X$ onto $\[ - b_X \( L_X \) \, b_X \( L_X \) \]$, and take $eta_X = rho$. Write $A_g$ for the unstretched positive endpoints and $U_g \( v \)$ for the resulting map to $u$. In all cases $A_g = L_g + O \( 1 \)$, $C_g = 1 + O \( e^(- gamma L_g) \)$. The push of the unnormalized density $eta_g \( W_g \( v \) \) thin d v$ to $u$ agrees with $macron(nu)_g thin d u$ away from or before the bounded-width cap regions (i.e. throughout the interior bulk); the cap and omitted tail masses are $O \( e^(- gamma L_g) \)$ with exponential decay outside. Denote the normalized push by $p_g$, and the reference angular coordinate by $t_g \( v \) = pi integral_(- A_g)^v lambda_g^0$. The curve estimates show that the unstretched densities have uniform fixed-order relative derivative bounds, sizes comparable to $e^(- gamma \| v \|)$, and uniform local analytic bounds off the caps. They extend evenly at the endpoints.

The coordinate maps are thus

$ v med mapsto^(med W_g med) med xi med mapsto med u = U_g \( v \) \, #h(2em) xi = u med upright("except on rare ") X \, quad xi = b_X \( u \) med upright("there") . $

The contour point is $frak(z)_g \( u \)$, while $t_g \( v \)$ is the reference angle. Densities are pushed through these maps. A primitive instead composes with $U_g$: if $q_u = partial_u Q_u$, then $Q_v \( v \) = Q_u \( U_g \( v \) \)$ and $q_u \( u \) thin d u = partial_v Q_v \( v \) thin d v$. We use the same letter for these representations of a primitive. Consequently $h_0$, the true quadratic form, and their relative determinant do not change under a further reparametrization. The unstretched coordinate $v$ will be used for the spectral calculation.

Use the reference space $cal(X)$ of Section 6.2 with these two angular variables. Compose the true $H_(n n)$ with the maps $U_g$, subtract its diagonal reference kernel, and call the mixed derivative of that smooth difference $cal(K)$. Thus $H_(upright("form")) \( Q \, Q \) = h_0 \( Q \, Q \) + \( Q \, cal(K) Q \)$ and $T = I + j^(*) cal(K) j$, where $j$ is inclusion in physical $L^2$. We will prove the following spectral bounds:

#[#set math.equation(numbering: n => "(34)")
 $ parallel T - I parallel_1 lt.eq C L \, quad parallel T parallel lt.eq C \, quad A_T = \( T + T^(*) \) \/ 2 gt.eq c L^(- 2) I \,\
N_(A_T) \( a \) lt.eq C L sqrt(a) quad \( 0 < a < a_0 \) . $ <eq:G-8>]

The same gap and small-value count are required for singular values and orthogonal compressions.

=== 7.2 Spectral bounds and the unequal-wall determinant <spectral-bounds-and-the-unequal-wall-determinant>

The bounds above control the logarithm at small singular values; the bulk symbols then determine its leading integral. We begin with the local norm and cell estimates needed for that control.

The magnetic statements in Equation (34) will now be verified. The embedding $j$ in unstretched $L^2 \( d v \)$ has uniformly bounded norm; $j j^(*)$ is the labelwise kernel

$ G \( v \, v' \) = frac(1, 2 pi^2) log frac(sin \( \( t_g \( v \) + t_g \( v' \) \) \/ 2 \), sin \( \| t_g \( v \) - t_g \( v' \) \| \/ 2 \)) . $

The kernel $G$ has uniformly integrable logarithmic singularities and exponential off-diagonal decay. Thus Schur’s test gives a uniform bound for $j$. We next prove the lower spectral bounds directly in these magnetic coordinates, before computing the determinant.

For a primitive $Q = \( Q_X \, Q_Y \)$ put $d_g \( v \) = A_g - \| v \|$ and define

$ frak(e) \( Q \) = sum_g [integral.double_(\| v - v' \| lt.eq 2) frac(\| Q_g \( v \) - Q_g \( v' \) \|^2, \| v - v' \|^2) thin d v thin d v' + integral_(d_g \( v \) lt.eq 2) frac(\| Q_g \( v \) \|^2, d_g \( v \)) thin d v] . $

The odd angular extension gives

#[#set math.equation(numbering: n => "(35)")
 $ h_0 \( Q \, Q \) lt.eq C \( frak(e) \( Q \) + parallel j Q parallel_2^2 \) \, #h(2em) "Re" H_(upright("form")) \( Q \, Q \) gt.eq c frak(e) \( Q \) . $ <eq:magnetic-local-norm>]

For the first inequality, the angular difference kernels in physical variables are

$ frac(t'_g \( v \) t'_g \( v' \), sin^2 \( \( t_g \( v \) - t_g \( v' \) \) \/ 2 \)) \, #h(2em) frac(t'_g \( v \) t'_g \( v' \), sin^2 \( \( t_g \( v \) + t_g \( v' \) \) \/ 2 \)) . $

The first is at most $C \| v - v' \|^(- 2)$ locally and is exponentially integrable away from the diagonal. The reflected kernel has the same bound away from common endpoints; near an endpoint it is bounded by the inverse square of the sum of endpoint distances. Integrating one variable gives $C \/ d_g \( v \)$. These statements use the exponential reference density and its relative derivative bounds, which are uniform also after rare-center mean matching. They prove the first inequality.

For the second, push $Q_g$ to the physical $u$ coordinate and extend by zero outside its wall. The real-energy theorem controls the Fourier seminorm with multiplier $k^2 \/ \( 1 + \| k \| \)$. This is equivalent to the local difference seminorm with kernel $\| u - u' \|^(- 2)$ and a fixed sufficiently large distance cutoff, including the zero extension. Near a cap, $U'_g \( v \) asymp min \( 1 \, d_g \( v \) \)$, and interactions with the exterior zeros give $U'_g \( v \) \/ \( L_g - \| U_g \( v \) \| \) asymp 1 \/ d_g \( v \)$. When two endpoint distances are comparable, change of variables preserves the local difference kernel up to bounded factors. When they are not comparable, the inequality $\| Q \( v \) - Q \( v' \) \|^2 lt.eq 2 \| Q \( v \) \|^2 + 2 \| Q \( v' \) \|^2$ bounds the missing part by the endpoint term. The mean-matching derivative is uniformly comparable to one, so this argument also covers rare $X$. This proves Equation (35).

Partition each physical parameter interval into cells of lengths between $1 \/ 2$ and one, and let $q_a$ be the mean on cell $a$. The local seminorm bounds the sum of the cell variances and $sum_a \| q_(a + 1) - q_a \|^2$. On a block of length comparable to $b gt.eq 1$ whose total mean vanishes, discrete Poincaré gives $parallel Q parallel_2^2 lt.eq C b^2 frak(e) \( Q \)$. The same estimate on a whole wall, without a zero-mean condition, follows by controlling its first and last cell means with the endpoint term. Since both interval lengths are at most $C L$, Equation (35) gives the global gap $c L^(- 2)$.

For a threshold $a$ above a fixed multiple of $L^(- 2)$, choose blocks of length $b = c_0 a^(- 1 \/ 2)$ with small fixed $c_0$. Their zero-mean conditions have codimension at most $C L \/ b$; on their common kernel the Rayleigh quotient of $A_T$ is at least $a$. Min–max gives $N_(A_T) \( a \) lt.eq C L sqrt(a)$. Below the global gap the count is zero; changing constants covers the intermediate range. Compression cannot increase this count. Finally, if a subspace satisfies $parallel T Q parallel < a parallel Q parallel$, then $chevron.l Q \, A_T Q chevron.r lt.eq parallel Q parallel parallel T Q parallel < a parallel Q parallel^2$ on that subspace. This gives the same count for singular values, including compressions. We have therefore established the magnetic lower bounds required in Equation (34). The following determinant proof supplies its norm and trace bounds, including the rare center.

#thm([Lemma 7.1.])[
  (The magnetic fluctuation determinant).  #emph[The relative Hessian satisfies $parallel T - I parallel_1 = O \( L \) \, med parallel T parallel = O \( 1 \)$, and 
#[#set math.equation(numbering: n => "(36)")
 $ - 1 / 2 log \| det T \| = frac(7 gamma, 8) L_X + frac(5 gamma, 16) \( L_Y - L_X \) + o \( L \) . $ <eq:M-31>]

 In the rare case, let $T^0$ be the straight comparison with main coordinates $W_X \( v \) + i beta \, W_Y \( v \)$, using exactly the same reference form $h_0$. Then 
#[#set math.equation(numbering: n => "(37)")
 $ parallel T - T^0 parallel = o \( 1 \) \, #h(2em) parallel T - T^0 parallel_1 = o \( L \) . $ <eq:M-32>]

 In particular all errors in (36) are uniform along every subsequence specified above, including $t arrow.t 1$.]
] <lem:07_magnetic_analysis-determinant>

#proof[
  #strong[Trace bounds for the straight comparison.] In the rare case let $T^0$ denote the straight comparison using physical main coordinates $W_X \( v \) + i beta \, med W_Y \( v \)$, and #emph[exactly the same] $h_0$. In the regular case let $T^0 = T$. For $T^0$ the mixed derivative of the true-minus-reference kernel has uniform $C^j$ bounds of order $C_j e^(- c \| v - v' \|)$, all fixed $j$. Indeed on a regular curved main the same diagonal argument subtracts the horizontal log, the residual using the divided ratio for the curved $sinh$; it is uniformly regular including at caps by composition (the ratio of the two physical complex and horizontal differences before composing with $W_X$ already extends smoothly with controlled log). Other near-diagonal entries are offset from their zero angles. At long differences the linear and sign asymptotes, including the terms from curved heights, are additive in individual coordinates in fixed order and vanish on mixed differentiation; the remaining log tails and the reference sine ratios obey the same exponential estimates. To obtain the trace bound, partition each interval into cells of lengths in $\[ 1 \, 2 \]$ and use their normalized cosine bases $e_(a \, n)$. Integrating twice by parts in each variable, with the first boundary term zero and the second controlled by a kernel derivative, gives
  $ \| chevron.l e_(a \, n) \, cal(K) e_(b \, m) chevron.r \| lt.eq frac(C e^(- c \| a - b \|), \( 1 + n^2 \) \( 1 + m^2 \)) . $
  Summing the trace norms of these rank-one entries gives $O \( L \)$; Schur’s test gives an operator norm $O \( 1 \)$. Boundedness of $j$ transfers both statements to $T^0$.
  #strong[The common and shoulder symbols.] Cyclic kernel integrals then give the word limits used below. More precisely, deep points $\| v \| < L_X$, away from the center and edges by distances tending to infinity, see the common symbol $T_oo \( k \)$ there with $p = \( 3 - lim theta_oo \) beta$ (angle 1 for the horizontal comparison in the rare case); see the main transform formulas. Indeed the reference densities in each tail are asymptotic with derivatives to a constant times $e^(- gamma \| v \|)$, and the curved height is exponentially asymptotic to $theta_oo$. Deep points in $L_X < \| v \| < L_Y$ see only its $Y \, Y$ entry. Their respective weights after division by $2 L$ are $lim L_X \/ L$ and the complement. Bounded-distance exceptional regions have zero limiting share, and relative-coordinate tails can be truncated uniformly by the kernel bounds. For completeness, its $2 times 2$ expression, for $k > 0$ and $x = beta k$, is
  $ T_oo \( k \) = frac(2 cosh x - 1, sinh \( 4 x \) coth \( 3 x \/ 2 \)) mat(delim: "(", cosh \( 3 x \), e^(p k); e^(- p k), cosh \( 3 x \)) \; #h(2em) T_oo \( - k \) = T_oo \( k \)^(sans(t)) . $
  It is obtained by dividing the true primitive symbol $k^2 hat(H)$ by the limiting reference symbol $2 pi k coth \( pi k \/ \( 2 gamma \) \)$. Its determinant is independent of $p$, and, with $y = e^(- x)$,
  $ sqrt(det T_oo \( k \)) = frac(\( 1 - y^3 \) \( 1 - y^6 \), \( 1 + y \) \( 1 - y^8 \)) . $
  The logarithmic integral is
  $ integral_0^oo log sqrt(det T_oo \( x \/ beta \)) thin d x = - pi^2 / 18 - pi^2 / 36 - pi^2 / 12 + pi^2 / 48 = - frac(7 pi^2, 48) . $
  Each term follows by integrating the convergent logarithmic series. Accounting for both signs of $k$, the determinant square, and the common interval length $2 L_X$ yields the contribution $7 gamma L_X \/ 8$ to $- 1 / 2 log \| det T \|$. The scalar shoulder symbol for $x = beta \| k \| \, med y = e^(- x)$ is
  $ frac(c_(*) \( k \) cosh \( 3 x \), sinh \( 4 x \) coth \( 3 x \/ 2 \)) = frac(\( 1 - y^3 \) \( 1 + y^6 \), \( 1 + y \) \( 1 - y^8 \)) $
  The integral of the logarithm of the shoulder symbol over $x in \( 0 \, oo \)$ is
  $ - pi^2 / 18 + pi^2 / 72 - pi^2 / 12 + pi^2 / 48 = - frac(5 pi^2, 48) \, $
  by expanding each logarithm in its absolutely integrable series. This gives (36) by the same truncated-log argument once trace convergence holds also for $T$, since (34) was proved for $T$.
  #strong[Passing to the logarithmic determinant.] Here is the truncated-log passage used in this calculation. For the singular values $s_i \( T \)$, the small-value count gives
  $ sum_(s_i < eta) log \( eta \/ s_i \) = integral_0^eta frac(\# { s_i < r }, r) thin d r lt.eq C L sqrt(eta) . $
  Clipping $log \( T^(*) T \)$ below $eta^2$ therefore loses only $O \( L sqrt(eta) \)$. On the bounded spectral interval, approximate the clipped logarithm by polynomials vanishing at one, with error at most $epsilon.alt \| x - 1 \|$. The trace error is at most $epsilon.alt parallel T^(*) T - I parallel_1 = O \( epsilon.alt L \)$. Cyclic kernel integration proves the polynomial trace limits: truncate relative separations, use the integrable logarithmic bound for $G$ and the exponential bounds for $cal(K)$, and then discard bounded neighborhoods of the center and walls. The common interval occupies length $2 L_X$ and the shoulders length $2 \( L_Y - L_X \)$. The same clipping estimate holds for the displayed symbols. The common symbol has one singular value comparable to $k^2$ near zero and its other singular value stays positive; the scalar shoulder symbol tends to $3 \/ 8$ there. Both symbols approach identity exponentially at infinity. Take size to infinity, then $epsilon.alt arrow.b 0$ and $eta arrow.b 0$. The two logarithmic integrals give exactly the coefficients in Equation (36).
  #strong[The rare-center comparison.] It remains to prove the comparison uniformly at the rare central scale. Ordinary derivative bounds in $v$ degenerate at that scale, so we use a dyadic decomposition. In intermediate coordinates put
  $ frak(z)_X \( b_X^(- 1) \( xi \) \) = xi + i beta + E \( xi \) . $
  Then $E \, E'$ are $o \( 1 \)$ uniformly, with fixed higher derivatives $E^(\( j \)) = o \( 1 \) thin \[ min \( 1 \, \| xi \| + d_0 \) \]^(1 - j)$, by the graph and matching estimates. The kernel on primitives uses a mixed derivative of the difference $K_d = H_(n n) - H_(n n)^0$ with the two sets of maps just described. Split $X$, on $\| v \| lt.eq 1$ (so $W_X \( v \) = v$), into sign-paired shells of radii $r_j = 2^(- j)$ down to $r_J asymp d_0$: $r_(j + 1) < \| v \| < r_j \, med j < J$, and the last central interval $\| v \| < r_J$. In shell $j$ encode $Q_X$ by its oscillation from the single mean $m_j$ over that shell, measured in $L^2$ after rescaling the shell by $r_j$, and keep the numbers $m_0 \, med m_j - m_(j - 1)$. The means thus contribute to $Q_X$ by these coefficients times the steps $upright(bold(1))_(\| v \| < r_j)$. Outside this region and on $Y$ keep $Q$ itself in $L^2$ on cells of lengths between 1 and 2. This joint encoding has squared norm bounded by $C h_0 \( Q \, Q \)$. Indeed same- and adjacent-shell squared mean/oscillation differences are bounded in sum by the ordinary difference seminorm on $\[ - 1 \, 1 \]$, directly controlled there by the angular difference representation of $h_0$; the outer mean and ordinary cells cost $parallel j Q parallel^2$. For example, with $A_j = { r_(j + 1) < \| v \| < r_j }$,
  $ 1 / r_j integral_(A_j) \| Q - m_j \|^2 lt.eq C integral.double_(A_j times A_j) frac(\| Q \( u \) - Q \( v \) \|^2, \| u - v \|^2) thin d u thin d v \, $
  and the same calculation on $A_j times A_(j + 1)$ bounds $\| m_j - m_(j + 1) \|^2$. These pair regions have bounded overlap. The last central interval satisfies the same scaled estimate. Thus the encoding map is bounded independently of the number of shells.
  For oscillation or ordinary cells the matrix kernel on this encoding takes one derivative of $K_d$ on the natural unit scale of each applicable variable (rescaled for shells). For a step, integrate that derivative over the step: take instead the difference of values at $+ r_j \, - r_j$. Thus there is no cost from a large #emph[common] primitive mean at tiny scales. Each cell pair, including derivatives through two further orders per continuous variable, has bounds $C epsilon.alt_L$ times:
  - $min \( r_i \/ r_j \, r_j \/ r_i \)$ between shells (steps are included at their corresponding scale);
  - $r_j e^(- c \| v' \|)$ from shell $j$ to an ordinary cell at $v'$;
  - $e^(- c \| v - v' \|)$ between ordinary cells;
  where $epsilon.alt_L = o \( 1 \)$.
  To verify them, on two central $X$ arguments the diagonal log change is a multiple of the smooth log of $1 + \( E \( v \) - E \( v' \) \) \/ \( v - v' \)$ plus regular analytic changes. For comparable scales this has all required bounds by divided differences at nearby arguments in the same regular neighborhood of radius of that scale (including the innermost pair), or by separation otherwise. For a much smaller scale $r_i lt.double r_j$ differentiation on the smaller scale gains $r_i \/ r_j$, since the denominator has size $r_j$ and all positive-order normalized derivatives of $E$ on the smaller shell have size $C epsilon.alt_L r_i$; further derivatives on either scale preserve the bound. A step difference gains the same by varying its argument across $\[ - r_i \, r_i \]$, using only the uniform slope bound for $E$ there. The larger step endpoints themselves stay on the larger scale. The argument across the interface to ordinary $X$ cells is identical; a bounded-distance ordinary $Y$ argument instead sees a nonsingular analytic kernel. In far-separated comparisons the pure one-variable log asymptotes drop out after the two derivatives/differences, including when one uses step endpoints (order with the other far argument is fixed); the log series remainders give exponential decay along with the small change bounds, with the scale gain from a central derivative or step. On ordinary $X$ cells near a cap the divided differences for the change use $E \( xi \) - E \( xi' \)$ divided by $xi - xi'$ #emph[before] the cap map, so do not incur any endpoint derivative loss. These observations prove the stated estimates for the log branches continued by the graph deformation; additive constants do not enter.
  By smooth cell expansion (e.g. the same cosine trace bound as before, on the two separate sign components where needed), these are also trace-norm bounds per pair. Their row and column sums are $O \( epsilon.alt_L \)$, and their overall sum $O \( epsilon.alt_L \( L + J \) \)$. Factoring on both sides by the bounded encoding proves (37). Consequently the needed trace bounds and word limits transfer to $T$ (trace-norm comparison of products), proving (36).
  Since $J = O \( 1 + log \( 1 \/ d_0 \) \) = O \( L \)$, the shell-pair trace estimate is indeed $o \( L \)$. To transfer a word of fixed length in $T - I \, T^(*) - I$, expand its difference from the corresponding word in $T^0$ as a sum with one difference factor in each summand. The trace norm is $o \( L \)$, because all other factors have bounded operator norms. The small-singular-value count in Equation (34) controls the removed portion of the logarithm uniformly, so no uniform pointwise inverse bound at the rare scale is required. ◻
]

=== 7.3 A finite core and regular coordinates <a-finite-core-and-regular-coordinates>

The determinant estimate controls the global cost. To realize the trial field by moving actual particles, we next choose a finite core and a coordinate in which its fields, dual tests, and density have uniform regularity.

Fix a small tolerance $xi > 0$. We construct a real orthogonal projection $Pi$ of rank $O_xi \( L \)$, supported on each label in $\| v \| < \( 1 - delta_(*) \) L_g$ for a fixed $delta_(*) > 0$, such that

#[#set math.equation(numbering: n => "(38)")
 $ parallel T - I - Pi \( T - I \) Pi parallel_1 lt.eq xi L . $ <eq:G-10>]

Apply the smooth-core construction of [10] Lemma 3.11 to $T^0$. Its cell approximation uses the compensated-kernel bounds proved above. It then applies the reference inverse $G$ to smooth cell functions and cuts off the resulting fields inside the walls. The exponential decay of $G$ makes this cutoff error negligible; discarding the outer $O \( delta_(*) L \)$ cells costs $O \( delta_(*) L \)$ in trace norm. These arguments apply separately on our two intervals. On rare $X$, both $G$ and the reference density in $v$ remain regular, so the constructed orthonormal fields have polynomial fixed-order derivative bounds in $v$. To pass from $T^0$ to $T$, use

$ parallel \( T - I \) - Pi \( T - I \) Pi parallel_1 lt.eq parallel \( T^0 - I \) - Pi \( T^0 - I \) Pi parallel_1 + 2 parallel T - T^0 parallel_1 . $

Choosing the initial tolerance smaller and using Equation (37) proves Equation (38).

Write $S = "ran" Pi$, $R = S^perp$ and $T_e = T_(R R) - T_(R S) T_(S S)^(- 1) T_(S R)$. Its Hermitian part $"Re" T_e$ inherits the gap and small-value count in Equation (34). The accompanying comparison is

#[#set math.equation(numbering: n => "(39)")
 $ \| log \| det T_(S S) \| - log \| det T \| \| & = o_xi \( L \) \,\
sum_(lambda < 1 \, med lambda in "spec" "Re" T_e) - log lambda & = o_xi \( L \) . $ <eq:G-11>]

Here the normalized limsup tends to zero when $xi arrow.b 0$ after $L arrow.r oo$. These conclusions follow from [10] Lemma 3.12, whose operator argument uses precisely Equation (38) and the magnetic gap and small-value counts already proved. In particular it controls the negative logarithms of $"Re" T_e$, not only the determinant of $T_e$.

The core fields themselves are now regular in $v$. Their images under the true form can still vary on the rare scale. The next change of coordinate controls these dual tests as well as the particle motion; it preserves the forms and the projection just constructed.

#thm([Lemma 7.2.])[
  (A regular parameter for transport).  #emph[On rare $X$, define $tau \( 0 \) = 0$ and 
$ frac(d tau, d v) = 1 + 1 / sqrt(d_0^2 + W_X \( v \)^2) \; $

 on the other intervals set $tau = v$. Let $tilde(A)_g$ be the new endpoints and $lambda_g \( tau \) = lambda_g^0 \( v \) thin d v \/ d tau$ the reference probability density. Then $tilde(A)_g asymp L$, $\| log lambda_g \| = O \( L \)$, and $lambda_g$ has smooth even endpoint reflections with uniformly bounded relative derivatives of every fixed order. Off the bounded-width caps, the maps extend analytically to fixed small disks in $tau$. In those disks the density has relative bounds, and increments and positive-order derivatives of $v$, $U_g$, and $frak(z)_g \( U_g \)$ are bounded on the scale $d v \/ d tau$. For every fixed $delta_(*) > 0$, if $N_g asymp s_g$, then 
#[#set math.equation(numbering: n => "(40)")
 $ N_g lambda_g \( tau \) gt.eq e^(c \( delta_(*) \) L) #h(2em) upright("on ") \| v \| lt.eq \( 1 - delta_(*) \) L_g $ <eq:M-33>]

 for all sufficiently large sizes.]
  #emph[Suppose also that $n_e \, ell_e \, \| M \|$ are bounded by fixed powers of $L$. In the $tau$ coordinate the following data have polynomial bounds for every fixed derivative order:]
  - #emph[the compensated kernel $H_(n n) - H_(upright("ref"))$, with smooth even endpoint reflections and analytic continuations in its core variables;]
  - #emph[the linear density test $H_(n n) \( m' p_L - mu \) + tilde(H)_(n e) zeta - frak(t)_n$, with the same reflections and core analyticity;]
  - #emph[the smooth dual tests obtained by applying $h_0$ or $H_(upright("form"))$ to the core basis fields or the trial primitives. These tests have odd reflections when paired against primitives.]
  #emph[The constant term of $"Re" cal(D)$ on $m' p_L$ is bounded below by $- upright("poly") \( L \)$. The core density bound also holds where a trial primitive is nonzero through the center.]
] <lem:07_magnetic_analysis-stretch>

#proof[
  #strong[Local scale and density.] On rare $X$,
  $ frac(d v, d tau) asymp min \( 1 \, d_0 + \| v \| \) . $
  The added length near the center is $O \( 1 + log \( 1 \/ d_0 \) \) = O \( L \)$. Thus the intervals still have length comparable to $L$. In a $v$-disk of radius $c \( \| v \| + d_0 \)$ near the center, the derivative of $tau$ has small relative variation when $c$ is small. Analytic inversion, together with the graph and mean-matching estimates on that same scale, gives the claimed fixed $tau$-disks. At the caps the stretch is smooth and respects the reflections; analytic continuation there is not needed.
  The identity $lambda_g = lambda_g^0 thin d v \/ d tau$ gives the logarithmic and relative derivative bounds. On $\| v \| lt.eq 1$ in rare $X$ it gives
  $ N_X lambda_X gt.eq c s d_0 gt.eq e^(c' L) \, $
  using the minority margin. Away from this central region, throughout a core,
  $ N_g lambda_g gt.eq c s_g e^(- gamma \( 1 - delta_(*) \) L_g) = c e^(gamma delta_(*) L_g) . $
  These two estimates prove Equation (40). In particular one need not remove the center from the support of a primitive.
  #strong[Compensated logarithms.] Consider first two points on the same label. If their $tau$-distance is at least a fixed $c_0 > 0$, their horizontal physical separation is at least a constant times either local scale $d v \/ d tau$. This follows by integrating the local scale on a fixed subinterval; it remains true at a cap, where the physical derivative can vanish at the endpoint. Likewise the sine of half the angular difference bounds both local $lambda_g$ from below up to constants. The sine of the angular half-sum is at least as large. The logarithms and their derivatives therefore have the asserted bounds away from the local diagonal.
  Near the diagonal, divide both physical and reference differences by $tau - tau'$. Off the caps, the physical complex quotient has size comparable to $d v \/ d tau$, while the reference cosine quotient has size comparable to $lambda_g sin t_g$; here $sin t_g asymp lambda_g^0$ away from the endpoints. Their relative analytic derivative bounds follow from divided differences on the fixed disks just constructed. At an endpoint, divide also by the reflected coordinate difference. The quadratic cap maps make both quotients smooth, nonzero on their natural scales, and even under reflection. Their logarithmic ratio is consequently smooth through both diagonals. Cross-label factors and the remaining same-label factors stay at regular imaginary offsets when their real arguments approach. Shrinking the core disks preserves those separations. This proves the bounds and core analyticity for $H_(n n) - H_(upright("ref"))$.
  #strong[Linear sources and end corrections.] For each label decompose the signed measure $m'_g p_g - mu_g$ into $\( m'_g C_g - s_g \) macron(nu)_g thin d u$ plus $m'_g C_g$ times the difference between the unnormalized capped push and $macron(nu)_g thin d u$. The first coefficient is polynomial. Its convolution is given by the mean identities, so it consists of ordinary $V$-logs evaluated on the contour. The only possible shrinking site-pole distance is at the rare $X$ center. There it is bounded below by a constant times $\| u \| + d_0$, exactly the local scale controlled by $tau$.
  For the difference of measures, insert a fixed-width cutoff around the caps and their exterior tails. The measures agree off this set, and their densities in their respective parameters carry the factor $e^(- gamma L_g)$. In a same-label end convolution, subtract the ordinary local logarithm and its reflected term for the capped input. The curved divided-log remainder is regular. Derivatives of the singular logarithm transfer to the smooth cutoff density, using its even extension for the capped input; for the full-line input transfer derivatives in $u$ before composition. Multiplication by $m'_g$ thus leaves polynomial bounds. The end correction is analytic in core variables by spatial separation on the same label and by imaginary offsets on the other label.
  The explicit-particle term $tilde(H)_(n e) zeta$ uses the regular offsets and horizontal subtraction from Equation (23). Its subtraction $R_h$ is inactive on moving core variables. The anomaly logs have the uniform offsets established in the mean calculation. These observations prove the linear-test assertion. Its constant term has the stated lower bound by Equation (25).
  #strong[Dual tests and polynomial approximation.] Against a smooth density supported in the core, subtract the local $tau$-diagonal logarithm of $H_(upright("ref"))$ and transfer its derivatives to the density. The remaining kernel has the bounds just proved. Thus $H_(upright("ref"))$ maps these densities to smooth even tests with polynomial derivatives. The basis fields were constructed with polynomial derivatives in $v$, hence also in $tau$. The trial primitives have the same property by Equations (26), (28) and (29). Differentiating their density tests gives the odd-reflected primitive tests for $h_0$. Adding the smooth compensated kernel gives those for the true $H_(upright("form"))$. This last step is why no polynomial derivative bound for the true form in the unstretched rare coordinate is needed.
  We will also use physical sine approximation on the $tau$ intervals. Two estimates ensure that its errors remain polynomial. First, $cal(X) arrow.r.hook L^2 \( d tau \)$ has polynomial norm: the inverse kernel satisfies
  $ \| G \( tau \, tau' \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] L + \| log min \( 1 \, \| tau - tau' \| \) \| #scale(x: 120%, y: 120%)[\)] $
  by the exponential lower bound on $lambda_g$, and Schur’s test applies on intervals of length $O \( L \)$. Second, $h_0$ is polynomially bounded on unit vectors in every polynomial Dirichlet sine bandwidth. For this use the angular difference kernel with its density factors. Its unreflected part is at most $C \( 1 + \| tau - tau' \|^(- 2) \)$, by the relative density derivative bounds. The reflected part contributes an endpoint inverse-distance mass term, since
  $ sin t_g gt.eq c lambda_g min \( 1 \, tilde(A)_g - \| tau \| \) \, $
  and its density-weighted kernel is bounded outside pairs near the same endpoint. Sine functions vanish at the endpoints, so these local difference and boundary estimates give the asserted bandwidth bound. ◻
]

=== 7.4 Source and compensated quadratic estimates <sec:reference-integration>

The preceding construction gives the concrete magnetic coordinates and trial form. We now state the two reference-law bounds used to integrate that form, retaining the partition masses from Equation (21).

#thm([Proposition 7.3.])[
  (Reference sources).  #emph[For fixed $C_1$, integer dimensions $0 lt.eq N_g lt.eq C_1 e^(gamma L)$, and a real smooth reflected test $ell \( Q \)$, 
#[#set math.equation(numbering: n => "(41)")
 $ log bb(E)_0 e^(ell \( Q \)) lt.eq C_2 L + 1 / 2 parallel ell parallel_(*)^2 . $ <eq:G-13>]

 If $ell \( Q \) = \( f \, q \)$ and $f_g \( t \) = f_(g \, 0) + 2 sum_(k gt.eq 1) f_(g \, k) cos k t$, then $parallel ell parallel_(*)^2 = sum_(g \, k gt.eq 1) k \| f_(g \, k) \|^2$. Constants in $f$ do not affect the test.]
] <prop:reference-source>

This is the reference-source estimate of [10] Theorem 4.2: comparison to the reflected circle integral gives the displayed Gaussian term, and the reciprocal factors $J_(N_g)^(- 1)$ give the $O \( L \)$ normalization cost. The circle inequality is a finite strong Szegő bound [12]; its Schur-polynomial proof is related to the unitary trace-moment argument of Diaconis and Evans [2].

For the sharp bound we need to remove this $O \( L \)$ normalization cost. Set

$ cal(G) = { parallel Q parallel_(- 2 \, tilde(A)) lt.eq L^D } \, $

where the negative norm uses squared weights $\( 1 + \( n \/ tilde(A)_g \)^2 \)^(- 2)$ in the orthonormal sine basis of each $tau$ interval. The event may couple the two labels. For fixed $D$, dimensions $N_g asymp s_g$, and smooth even-reflected physical tests $f_g \( tau \)$ whose fixed-order derivatives have specified polynomial bounds, we claim

#[#set math.equation(numbering: n => "(42)")
 $ log bb(E)_0 \[ upright(bold(1))_(cal(G)) e^(ell \( Q \)) \] lt.eq o \( L \) + 1 / 2 parallel ell parallel_(*)^2 . $ <eq:G-14>]

The error is uniform when these powers and dimension-comparison constants are fixed. Theorem 4.3 of [10] proves the corresponding electric statement. We adapt its change of variables here, since the unequal walls and the rare center affect both the motion and the normalization gain.

Choose a smooth primitive $0 lt.eq a_g lt.eq 1 \/ 4$, equal to $1 \/ 4$ on $\| v \| lt.eq \( 1 - 2 delta \) L_g$ and zero before $\| v \| = \( 1 - delta \) L_g$, with monotone slow switches in $v$. For the two signs $epsilon.alt = plus.minus 1$ make the real changes of variables

$ F_(g \, epsilon.alt) \( tau \) = tau - epsilon.alt frac(a_g \( tau \), N_g lambda_g \( tau \)) . $

These are increasing diffeomorphisms, equal to the identity near the endpoints. Their displacements and all required fixed derivatives are exponentially small by Equation (40), including across the center. The cosine-difference ratios extend smoothly through the same-label diagonal by analytic division. Off that diagonal the sine separation estimates in Lemma 22 give the same exponentially small derivative bounds. Thus their errors paired with $Q$ or $Q ⊗ Q$ are $o \( 1 \)$ on $cal(G)$. Convolutions of $H_(upright("ref"))$ with the smooth mean-push remainders have the same bounds by local-log subtraction. These are the error estimates used in the proof of [10] Theorem 4.3, now in $tau$.

Write $frak(g)_g = log cot \( t_g \/ 2 \)$ and

$ G_g = \( frak(g)_g \, a'_g \) - 1 / 2 h_0 \( a_g \, a_g \) \, $

with the form restricted to label $g$. The one-coordinate density ratio cancels the omitted half-diagonal in the Vandermonde log change. As in that proof, pulling back the tilted density with angular weight $2 \( 1 + epsilon.alt cos t_g \)$ instead of $2 sin t_g$ gives its original density times

$ exp {epsilon.alt #scale(x: 120%, y: 120%)[\[] \( frak(g)_g \, X_(N_g) \) + \( f_g \, a'_g \) - \( q_g \, H_(upright("ref")) a'_g \) #scale(x: 120%, y: 120%)[\]] + G_g + o \( 1 \)} $

on $cal(G)$. Only core derivatives of $frak(g)_g$ occur, since the motion vanishes near the endpoints.

The gain is most simply calculated in the unstretched $v$ coordinate. There $- frak(g)'_g = t'_g \/ sin t_g arrow.r gamma$ in either tail, so

$ \( frak(g)_g \, a'_g \) = gamma integral a_g \( v \) thin d v + o_delta \( L \) . $

On the support of the switches, two points in the same tail satisfy

$ H_(upright("ref")) \( t_g \( v \) \, t_g \( v' \) \) = 4 gamma min \( \| v \| \, \| v' \| \) + O #scale(x: 120%, y: 120%)[\(] 1 + \| log min \( 1 \, \| v - v' \| \) \| #scale(x: 120%, y: 120%)[\)] \, $

whereas opposite-tail values are bounded. This follows by factoring the difference of the squared exponentially small distances to the nearest angular endpoint. The identity

$ integral.double_(\[ 0 \, oo \)^2) min \( r \, r' \) b' \( r \) b' \( r' \) thin d r thin d r' = integral_0^oo b \( r \)^2 thin d r $

and the slow switches therefore give

$ h_0 \( a_g \, a_g \) = 4 gamma integral a_g \( v \)^2 thin d v + O_delta \( 1 \) \, #h(2em) G_g gt.eq frac(gamma L_g, 4) - O \( delta L \) - o_delta \( L \) . $

In particular the extra length introduced by the central stretch has no effect on this coordinate-invariant energy.

Use the #emph[same] sign $epsilon.alt$ for both labels before taking the geometric mean. The terms odd in $epsilon.alt$ cancel on the single event $cal(G)$. Cauchy–Schwarz, removal of that event from the two positive integrals, and the circle comparison then give

$ log bb(E)_0 \[ upright(bold(1))_(cal(G)) e^(ell \( Q \)) \] lt.eq - sum_g G_g - sum_g log J_(N_g) + 1 / 2 parallel ell parallel_(*)^2 + o \( 1 \) . $

Since $- log J_(N_g) = gamma L_g \/ 4 + O \( 1 \)$, the excess over the Gaussian term is $O \( delta L \) + o_delta \( L \)$. Taking $L arrow.r oo$ and then $delta arrow.b 0$ proves Equation (42).

#thm([Proposition 7.4.])[
  (Compensated quadratic integration).  #emph[Let $F$ be real symmetric and bounded on $cal(X)$, with $F gt.eq g I$, $g > 0$, and $F - I$ trace class. Suppose its perturbation and a real linear functional $h_0 \( l \, dot.op \)$ are represented by smooth reflected physical kernels and tests. Let $c in bb(R)$. For 
$ V \( Q \) = c + h_0 \( l \, Q \) + 1 / 2 h_0 \( Q \, \( F - I \) Q \) \, #h(2em) m_F = c - 1 / 2 h_0 \( l \, F^(- 1) l \) \, $

 one has 
#[#set math.equation(numbering: n => "(43)")
 $ log bb(E)_0 e^(- V \( Q \)) lt.eq - m_F + C_2 L + 1 / 2 sum_(lambda < 1 \, med lambda in "spec" F) - log lambda . $ <eq:G-18>]

 The sum counts multiplicity. If the sharper source bound (42) holds, the gap is inverse-polynomial, and the data and required fixed-order derivatives have polynomial bounds, the same estimate on $cal(G)$ has $o \( L \)$ in place of $C_2 L$.]
] <prop:quadratic-integration>

For clarity, the cancellation underlying this import is short. Set $Q_(*) = - F^(- 1) l$ and $J = \( I - F \)_(+)$. Completing the square gives

$ - V \( Q \) lt.eq - m_F + h_0 \( Q_(*) \, Q \) - 1 / 2 parallel Q_(*) parallel^2 + 1 / 2 h_0 \( Q - Q_(*) \, J \( Q - Q_(*) \) \) . $

Linearize the last term with a real Gaussian vector $g_J$ of covariance $J$, and apply Proposition 23 to $Q_(*) + g_J$. The mixed terms cancel exactly, leaving $e^(- m_F + C_2 L) bb(E) e^(parallel g_J parallel^2 \/ 2) = e^(- m_F + C_2 L) det \( I - J \)^(- 1 \/ 2)$. Smooth finite-dimensional approximation, gap control and Fatou’s lemma give the stated general form, as in [10] Lemma 4.4. For its sharpened version, use physical sine truncation in $tau$. The two Sobolev estimates at the end of Lemma 22 give polynomial operator and dual-test bounds on every polynomial bandwidth. Smoothness then makes the truncation error smaller than any prescribed inverse power of $L$, both on $cal(G)$ and after division by the gap. Equation (42) applies to the resulting polynomially bounded Gaussian sources; outside a sufficiently large polynomial ball use Equation (41) and the Gaussian tail. This is the approximation argument of that lemma with our physical coordinate.

=== 7.5 The finite-rank transport construction <the-finite-rank-transport-construction>

The remaining step is to realize the complex trial field in the particle integral. We adapt the three-stage deformation proved in [10] Lemma 5.2. Its statement concerns electric sectors; below we give the affine path for the magnetic form, prove its gap bounds, and check the geometric estimates needed for the same contour argument. Particle dimensions stay fixed throughout.

For fixed explicit configuration $zeta$, define the quadratic cost $cal(C)_0 \( Y \) = cal(D) \( m' p_L + Y' \, zeta \)$, where density derivatives are pushed from the regular coordinate to the physical one. For a real smooth trial primitive $Z_0$ supported in the active core, write

$ C_z \( Y \) = cal(C)_0 \( Y + i Z_0 \) = c_z + h_0 \( u_z \, Y \) + 1 / 2 h_0 \( Y \, T Y \) \, #h(2em) m_z = inf_(Y med upright("real")) "Re" C_z \( Y \) . $

The endpoint of the affine transformation is

#[#set math.equation(numbering: n => "(44)")
 $ Q + a \( Q \) = i Z_0 + Q_R + T_(S S)^(- 1 \/ 2) Q_S - T_(S S)^(- 1) Pi u_z - T_(S S)^(- 1) T_(S R) Q_R . $ <eq:G-19>]

The square root is the principal branch in the right half-plane, well-defined by accretivity. The corresponding motion of a coordinate $r$ of label $g$ is $- a_g \( Q \) \( r \) \/ \( N_g lambda_g \( r \) \)$. Throughout this motion each $N_g$ is a fixed nonnegative integer.

The following proposition bounds the resulting magnetic integral, including its two unnormalized reference masses.

#thm([Proposition 7.5.])[
  (Implementation of magnetic trial actions).  #emph[Let $Z_0$ be the primitive of the coarse or sharp tilt, and set 
$ C_z \( Y \) = cal(D) \( m' p_L + \( Y + i Z_0 \)' \, zeta \) \, #h(2em) m_z = inf_(Y in cal(X) upright(" real")) "Re" C_z \( Y \) . $

 Derivatives here denote densities pushed from $tau$ to the physical coordinate. After the reference transport, the logarithm of the modulus of the unnormalized sector integral is at most 
$ - m_z + frac(7 gamma, 8) L_X + frac(5 gamma, 16) \( L_Y - L_X \) - gamma / 4 \( L_X + L_Y \) + o_(upright("proj")) \( L \) + o \( L \) . $

 The discarded part can be made smaller than $exp \( - L^(E_2) \)$ for any required fixed $E_2$. The coefficient of $o_(upright("proj")) \( L \)$ is arbitrarily small after the core projection is improved. Without a tilt one also has the bound $- m_0 + O \( L \)$, which permits polynomial truncation of $n_e \, \| M \| \, ell_e$.]
] <prop:07_magnetic_analysis-transport>

#proof[
  #strong[Coarse integration and count truncation.] For any chosen tilt, the infimum $m_z$ satisfies its deterministic trial lower bound: first test smooth real fields, then use continuity in $cal(X)$. For $Z_0 = 0$, take absolute values and apply Proposition 24 with $F = "Re" T$. The smooth compensated data are defined at fixed sizes even before polynomial truncation. The spectral bounds and $parallel T - I parallel_1 = O \( L \)$ give an $O \( L \)$ negative-log sum, and the reference masses $J_(N_g)$ are bounded above. Thus the logarithm of the unshifted integral is at most $- m_0 + O \( L \)$.
  Combining this with Equations (22) and (25) retains damping in $ell_e + \( M^2 + n_e^2 \) \/ L$, apart from $C_(h \, epsilon) \( L + n_e \)$. Sum the Gaussian damping in $M$ and the position damping with the factorial measures as in Equation (32). We may thereby restrict $n_e \, \| M \| \, ell_e$ to sufficiently large fixed powers of $L$ with error $exp \( - omega \( L \) \)$ at the extracted-product normalization. Fix these powers from now on. Then $N_g = s_g + O \( L^K \) asymp s_g$, and all kernels, dual tests, and lower bounds for constant terms have the polynomial controls proved above. The sharp source estimate (42) is available in $tau$.
  #strong[The affine path and its real gap.] Put
  $ sans(A) = T_(S S) \, #h(2em) sans(C) = T_(S R) \, #h(2em) sans(B) = sans(A)^(- 1) sans(C) \, #h(2em) H_theta.alt = \( 1 - theta.alt \) I + theta.alt sans(A) \, quad D_theta.alt = H_theta.alt^(- 1 \/ 2) . $
  For $0 lt.eq theta.alt lt.eq 1$, the three successive output primitives are
  $ & Q + i theta.alt Z_0 \,\
 & i Z_0 + Q_R + Q_S - theta.alt \( sans(A)^(- 1) Pi u_z + sans(B) Q_R \) \,\
 & i Z_0 + Q_R + D_theta.alt Q_S - sans(A)^(- 1) Pi u_z - sans(B) Q_R . $
  The stages join at their endpoints, and the last endpoint is Equation (44). Accretivity places the spectrum of $H_theta.alt$ in the right half-plane. The resolvent representation of its principal inverse square root gives polynomial bounds on $D_theta.alt$ and its required parameter derivatives, using Equation (34). Flattening the parameter at the joins produces a smooth path.
  We verify the real Hessian along this path. Write $T \[ Y \, Y \] = h_0 \( Y \, T Y \)$ with the complex bilinear convention. The first stage changes only the source. For real $s in S \, r in R$, the second-stage linear map satisfies the exact identity
  $ T \[ \( s - theta.alt sans(B) r \, r \) \, \( s - theta.alt sans(B) r \, r \) \] = T \[ \( s \, \( 1 - theta.alt \) r \) \, \( s \, \( 1 - theta.alt \) r \) \] + \( 2 theta.alt - theta.alt^2 \) T_e \[ r \, r \] . $
  Both real forms on the right have the magnetic gap, and the two coefficients of $parallel r parallel^2$ add to one. At the third stage the Hessian is block diagonal, with blocks $T_e$ and $sans(A) H_theta.alt^(- 1)$, because $D_theta.alt$ commutes with $sans(A)$ and is symmetric. The Hermitian identity
  $ H_theta.alt^(*) "Re" \( sans(A) H_theta.alt^(- 1) \) H_theta.alt = \( 1 - theta.alt \) "Re" sans(A) + theta.alt sans(A)^(*) sans(A) $
  gives an inverse-polynomial gap throughout this stage as well. All nontrivial input uses of $Q$ are through smooth dual tests; all output changes lie in $S + bb(C) Z_0$ and are core-supported. Their polynomial bounds follow from the core construction and the stretched regularity lemma. The path changes the Hessian by finite rank $O \( L \)$, so its trace norms and lower bounds for minimizing costs are polynomial too.
  At the endpoint, the real Hessian is $I_S xor "Re" T_e$. Its real infimum is at least $m_z$. Indeed, for fixed real $r$, the complex stationary point of $C_z \( s + r \)$ in $S$ is $s_(*) = - sans(A)^(- 1) \( Pi u_z + sans(C) r \) = s_1 + i s_2$. Completing that square gives
  $ "Re" C_z \( s_(*) + r \) = "Re" C_z \( s_1 + r \) + 1 / 2 h_0 \( s_2 \, "Re" sans(A) thin s_2 \) gt.eq m_z . $
  The remaining endpoint input adds $parallel s parallel^2 \/ 2$.
  #strong[The particle chain and its pole distances.] Write $a_theta.alt \( Q \)$ for the output change along the flattened path. Choose a smooth cutoff $chi$, equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 4 \, oo \)$, and use the parameter
  $ theta.alt \( Q \) = chi \( parallel Q parallel_(- 2 \, tilde(A))^2 \/ L^(2 D) \) . $
  Thus configurations in $cal(G)$ undergo the full path, while those outside $parallel Q parallel_(- 2 \, tilde(A)) lt.eq 2 L^D$ remain fixed. For $a \( Q \) = a_(theta.alt \( Q \)) \( Q \)$, move a particle at $tau$ by
  $ Delta_g \( tau \; Q \) = - frac(a_g \( Q \) \( tau \), N_g lambda_g \( tau \)) . $
  The homotopy uses $a_(upsilon theta.alt \( Q \)) \( Q \)$ for $0 lt.eq upsilon lt.eq 1$. The exponent $D$ will be chosen after the polynomial truncations. For fixed $D$, Equation (40) makes $Delta_g$ and its fixed-order spatial derivatives exponentially small, with $Q$ and the cutoff parameter frozen for these derivatives.
  On rare $X$, a fixed small $tau$-disk corresponds to physical increments on scale $d v \/ d tau asymp min \( 1 \, d_0 + \| u \| \)$ in the core. Hence the physical particle displacement is exponentially small relative to $d_0 + \| u \|$ near the center. The nearest site pole has at least that distance by the stretched regularity lemma. All other poles have fixed separation there. The compensated kernels and maps therefore remain analytic on the moving chains, including against inactive coordinates. Same-label coincidences are Vandermonde zeros; the divided difference of the compensated ratio extends analytically through them.
  The exact contour argument of [10] Lemma 5.2 now applies to these chains. Its maps need only be $C^2$ in the real particle variables. This holds here because a particle’s first and second variations of its empirical primitive are $- delta_tau$ and $delta'_tau$, both continuous in the physical $H^(- 2)$ space. Holomorphy is required of the density times volume form, not of the smooth core fields defining the chain.
  To see that the one nonholomorphic factor causes no difficulty, partition every coordinate into a slightly enlarged active core and its complement, and freeze the complementary coordinates. A like-main explicit particle lies outside its own wall, whereas $R_h$ is supported at horizontal distance at most one. Thus $A = exp \( - \( X_(upright("int")) \, R_h zeta \) \)$ is independent of every active coordinate. Factor it out before applying Stokes’ theorem to the remaining holomorphic top form. The displacements vanish near the core boundaries, so the side faces of the homotopy contribute zero. Only after this contour equality do we use $0 lt.eq A lt.eq 1$.
  #strong[Compensated cost and finite Jacobian.] We indicate why the error estimates in that contour proof persist in $tau$. Freeze $Q$ and $a$, and multiply $Delta$ by a scalar complex parameter. Its analytic disk can have exponentially large radius: the motion stays inside the fixed $tau$-disks, and the cosine-difference ratios stay near one by simultaneous divided differences and the small spatial derivatives of $Delta$. After removal of the unchanged explicit-pair constant, all measures have at most exponential total variation and all remaining kernels have polynomial bounds. Cauchy’s estimate on the growing disk, at a sufficiently high fixed Taylor order, therefore gives an $o \( 1 \)$ remainder at scalar parameter one.
  For real frozen displacements the $k$th mean-push coefficient is
  $ d_(g \, k) = frac(\( - partial_tau \)^k, k !) \( N_g lambda_g Delta_g^k \) . $
  It has $d_(g \, 1) = a'_g$, while the coefficients for $k gt.eq 2$ and their fixed derivatives are exponentially small, since $N_g lambda_g Delta_g^k = - a_g Delta_g^(k - 1)$. Pairings of the centered push terms against smooth tests are also exponentially small on the polynomial event. Local-log subtraction controls $H_(upright("ref")) d_(g \, k)$. The resulting finite Taylor identities are polynomial in the frozen field coefficients and hence hold for complex displacements as well. This is exactly the compensated substitution in the companion proof: after its one-coordinate density and diagonal cancellation, the cost is
  $ cal(C)_0 \( Q + a \( Q \) \) - 1 / 2 h_0 \( Q \, Q \) + o \( 1 \) . $
  As before, the displayed expression means its smooth compensated expansion; no empirical self energy is evaluated separately.
  The remaining Jacobian differs from the identity by a matrix of rank $O \( L \)$. On the full-shift event its reduced entries are empirical quadratures of smooth core tests divided by $N_g lambda_g$. Their centered errors are exponentially small by Equation (40) and the $H^(- 2)$ event bound. The matrix determinant lemma therefore gives its modulus as
  $ \( 1 + o \( 1 \) \) \| det T_(S S) \|^(- 1 \/ 2) \, $
  just as in [10] Lemma 5.2.
  #strong[The transition and restoration of masses.] For each fixed path parameter the compensated real cost has the inverse-polynomial gap and polynomial bounds proved above. The negative-metric penalty $L^(- E) parallel Q parallel_(- 2 \, tilde(A))^2$ has polynomial operator norm and trace norm by the stretched Sobolev estimates. Choose $E$ large enough that subtracting it preserves half the gap. For this metric penalty use the sine-truncation extension of the coarse quadratic bound in [10] Lemma 4.4; its finite smooth truncations converge on empirical fields, and Fatou’s lemma passes the bound to the full penalty. It then suppresses $parallel Q parallel_(- 2 \, tilde(A)) > L^D$ by
  $ exp \( - L^(2 D - E) + L^(E_1) \) \, $
  where $E_1$ is fixed independently of $D$.
  The actual parameter depends on $Q$. On the transition region, path derivatives of the cost are at most $L^(C + 2 D)$, so a grid of mesh $L^(- C - 2 D - 1)$ compares every cost with a grid cost within one. Summing the preceding estimate over this polynomial grid controls that dependence. The cutoff adds one rank-one Jacobian term; the reduced matrix has size $O \( L \)$ and entries at most $e^(C_D L)$, so its determinant costs at most $exp \( O_D \( L^2 \) \)$. These estimates give a discarded contribution smaller than any prescribed $exp \( - L^(E_2) \)$ by choosing $D$ sufficiently large. Choose $E_2$ after the fixed polynomial count and position cutoffs: their total factorial integration volume and number of sectors are at most $exp \( upright("poly") \( L \) \)$, so summing the discarded contributions remains negligible. All these choices are fixed before $L arrow.r oo$.
  On the full-shift event apply the sharp quadratic bound using Equation (42) and the infimum comparison with $m_z$. Equation (39) bounds the remaining negative-log sum by $o_xi \( L \)$ and replaces the core determinant by the full determinant. Finally restore $J_(N_X) J_(N_Y)$, whose logarithm is $- gamma \( L_X + L_Y \) \/ 4 + O \( 1 \)$. Equation (36) now gives exactly the stated sector bound. Each $N_g$ remained the same integer throughout the deformation. ◻
]

=== 7.6 The sharp bound and the polygon moment <the-sharp-bound-and-the-polygon-moment>

All factors are now available: the trial gain, the fluctuation determinant, the two reference masses, the explicit-particle sum, and the uniform vacuum denominator. We assemble them before summing over planar marks.

#thm([Theorem 7.6.])[
  (The sharp marked-pair bound).  #emph[Fix $c_1 in \( 0 \, 1 \]$ and a sufficiently small $c_4 > 0$. Consider the physical cyclic row $\[ p \, X \, p' \, Y \]$ with $s = \| X \|$, $b = \| Y \|$, and $N = s + b + 2$ even. All real site offsets vanish. Ordinary $Y$ sites have height zero; ordinary $X$ sites and both marks have heights in ${ 0 \, beta }$. Let $t$ be the upper-height fraction in $X$ and set $L_X = gamma^(- 1) log s$, $L_Y = gamma^(- 1) log b$. Uniformly as $L_Y arrow.r oo$ under 
$ c_1 L_Y lt.eq L_X lt.eq L_Y \, #h(2em) 1 / 2 lt.eq t lt.eq 1 \, #h(2em) t < 1 med arrow.r.double med s \( 1 - t \) gt.eq e^(c_4 L_Y) \, $

 one has 
$ log cal(C) \( p \, p' \) lt.eq - 4 / 3 log s + 617 / 1200 log \( b \/ s \) + o \( log b \) . $

]
] <thm:07_magnetic_analysis-moment>

#proof[
  For $U > U_0$, Equation (26), the count bound, and factorial summation make the contribution negligible once $U_0$ is sufficiently large, after the smoothing and probe parameters have been fixed. For $U lt.eq U_0$, combine Proposition 25 with Equations (31) and (32), and divide by the cleared denominator of Theorem 7. The denominator estimate applies uniformly to the site mixture, and $N asymp b$.
  The exponent can be checked before changing variables. The trial cost contributes $- 2 L_X$, the fluctuation and reference factors contribute $3 gamma L_X \/ 8 + gamma \( L_Y - L_X \) \/ 16$, and the explicit shoulders cost at most $0.88 \( L_Y - L_X \)$. The denominator contributes $- \( 5 gamma \/ 24 \) L_Y + o \( L \)$. Their sum is
  $ - 16 / 9 L_X + (0.88 + gamma / 16 - frac(5 gamma, 24)) \( L_Y - L_X \) + o \( L \) . $
  Since $gamma = 4 \/ 3$, $gamma L_X = log s$, and $gamma L_Y = log b$, this is the claimed marked-pair exponent. To remove the error coefficients, first make the reserve and smoothing loss arbitrarily small, then make the buffer fraction sufficiently small, and finally improve the core projection. Each choice remains fixed while $L arrow.r oo$. The regular and rare subsequence arguments cover every sequence of site mixtures and wall ratios, proving uniformity. ◻
]

#proof[
  The coefficient $617 \/ 1200$ is smaller than $2 \/ 3$. For the configurations selected in Lemma 20, $b asymp D$ and $s lt.eq b$. The sharp theorem therefore bounds the retained port-pair weights by $D^(o \( 1 \)) s^(- 4 \/ 3) \( D \/ s \)^(2 \/ 3)$. At dyadic diameter $D$, a dyadic displacement scale $s$ has only $O \( s^2 \)$ possible placements after fixing the first port modulo translation. Its contribution is at most
  $ D^(o \( 1 \)) s^2 s^(- 4 \/ 3) \( D \/ s \)^(2 \/ 3) = D^(2 \/ 3 + o \( 1 \)) . $
  There are $O \( log D \)$ displacement scales. The short-polygon contribution is already bounded in Lemma 20 by the planar diameter tail. Summing the dyadic diameter bounds up to $H$ proves Theorem 1. ◻
]

== 8 A polynomial bound for a single cylinder arc <sec:one-arc>

The marked-pair estimate uses a sharp fluctuation determinant. The single-arc application needs only a polynomial upper bound, and this weaker objective permits a larger parameter range. In particular, the shorter wall may grow arbitrarily slowly compared with the longer one. We prove the contour identity first, including its finite spin and residue calculation, and then bound its absolute integral by the real reference comparison. No imaginary displacement of particles is used in that comparison.

Retain the cyclic order $\[ p \, X \, p' \, Y \]$, the magnetic factors $P_j$ and $cal(T)$, and the constants $beta = pi \/ 4$ and $gamma = 4 \/ 3$. There are $s = \| X \|$ and $b = \| Y \|$ ordinary sites, and $N = s + b + 2$ is even. Both marks and all ordinary sites have spectral heights in ${ 0 \, beta }$; every $Y$ site has height zero. The variable $rho_(upright(v)) = 1 \/ sqrt(2 + sqrt(2))$ denotes the vertex activity, whereas $rho \( u \)$ continues to denote the centering probability density. All arc masses are unsigned critical masses with the previously specified port convention.

=== 8.1 The one-arc contour identity <the-one-arc-contour-identity>

Let $A \( p \, p' \)$ be the mass of self-avoiding cylinder arcs departing on the west, or ket, side of a marked port $p$, and arriving on the east, or bra, side of a marked port $p'$. The arc has no other visit to either port, and their unused half-edges are vacant. Prescribe spin $+$ on the ket at $p$, spin $+$ on the bra at $p'$, and vacancy on the opposite sides, with ordinary-site twist $k^(- 2 sum_(i in X) h_i)$. In the bilinear spin notation this is

$ cal(A) \( p \, p' \) = sum_(upright(bold(h)) in { 0 \, plus.minus 1 }^(X union Y)) k^(- 2 sum_(i in X) h_i) U_(+ \, upright(bold(h))_X \, 0 \, upright(bold(h))_Y) U_(0 \, upright(bold(h))_X \, + \, upright(bold(h))_Y)^(*) . $

#thm([Lemma 8.1.])[
  (One-arc contraction).  #emph[There is a constant $omega$ with $\| omega \| = 1$, independent of the arc, such that $cal(A) \( p \, p' \) = omega A \( p \, p' \)$.]
] <09_fast_paths:one-arc-contraction>

#proof[
  A closed loop disjoint from the marked arc cannot separate its endpoints, so its two orientations cancel as in the marked-pair calculation. Order the vertical matching from $p$. The directed arc has westward initial and final tangents. With argument cut below $p$, the angle change of $Gamma - p$ is $- pi \/ 2$; with argument cut upward, that of $p' - Gamma$ is $- 3 pi \/ 2 - 2 pi F_X$. The chord-angle identity therefore cancels the twist against the cup phases, leaving a constant phase. The summability and projection of the half-cylinder states are the same as for the marked-pair contraction. ◻
]

There are $n = s + b$ ordinary sites and two marks, with $N = n + 2$ even. In the finite calculation below $t = + 1 \, - 1$ indexes the groups $X \, Y$; it is not the fraction of upper ordinary sites. Write $p_t$ for the logarithmic coordinate of the mark preceding group $t$, rather than for an activity. Define two probe factors

$ K_t & = frac(P_(- 3 t) \( y_t - p_(- t) \), P_(2 t) \( y_t - p_t \) P_0 \( y_t - p_t \)) \,\
Q_t & = product_(a upright(" ordinary")) P_(s_a - t) \( a - y_t \)^(- 1) product_(v upright(" elementary")) frac(P_(s_v - t + 1) \( v - y_t \) P_(s_v - t - 1) \( v - y_t \), P_(s_v - t) \( v - y_t \)) . $

The signs $s_a \, s_v$ specify groups; a double contributes both its elementary particles. Integrate $y_(+)$ around the strip with height interval $\( - 0.8 \, 3.34 \)$, and $y_(-)$ around $\( - 2.72 \, 1.23 \)$, in units of $beta$, with measure $d y_t \/ \( 2 pi i \)$ and positive orientation: lower horizontal integral minus upper horizontal integral. Ordinary sites have heights 0 or 1, and all ordinary minus sites have height 0. Initially the main lines have heights $1 \/ 2 \, 0$, the far singleton lines have heights $25 \/ 8 \, - 2.35$, and doubles have these far endpoints and their endpoints one step inward.

#thm([Lemma 8.2.])[
  (One-arc gas identity).  #emph[Use the ordinary magnetic activity coefficients, including signs, but elementary particle totals 
$ \( s + m - 1 \, b - m \) \, #h(2em) m in bb(Z) \, $

 restricted to nonnegative values. The preceding contraction multiplied by $tilde(h)_N^2$ is the sum of these gas integrals with factor $cal(T) K_(+) K_(-) Q_(+) Q_(-)$, multiplied by $\( 2 d \)^n$ and sector scalars of uniformly bounded modulus. A scalar may depend on $m \, n \, s \, b$, but not on the chosen pole sites or strings in its sector.]
] <09_fast_paths:one-arc-identity>

#proof[
  We first compute residues and then compare every exceptional spin factor. Keep real site offsets generic and distinct until taking confluence. Moving main contours to the far lines produces ordinary strings of length 0, 1 or 2; the cancellation excluding longer strings is unchanged. All singleton poles of $Q_t$ lie outside the swept regions. For a double, multiplication of its elementary factors cancels the relevant particle-dependent denominator before moving contours. The additional real growth is bounded by
  $ sum_(t = plus.minus 1) {1 / 2 sum_v \| Re v - Re y_t \| - frac(n + 1, 2) \| Re y_t \|} . $
  There are $n - 1$ ordinary elementary particles. Up to a constant depending on the counts and fixed site offsets, their ordinary gas exponent is at most
  $ - n sum_v \| Re v \| + sum_({ v \, w }) \| Re v - Re w \| lt.eq - 2 sum_v \| Re v \| \, $
  where the second sum is over unordered elementary pairs. Omitting an internal double pair does not change this bound, since its real difference is zero. By the same triangle inequality, the displayed probe contribution is at most
  $ sum_v \| Re v \| - sum_(t = plus.minus 1) \| Re y_t \| . $
  Adding the two bounds gives simultaneous exponential decay in all particles and both probes, justifying closure of the strips.
  For a group-$z$ site with string length $a$, its site and string contribution to $Q_t$, at argument site minus probe, is
  $ a & 0 & 1 & 2\
 & 1 \/ P_J & P_(J + 2 z) \/ P_(J + z) & P_(J + 3 z) \, #h(2em) J = z - t . $
  The probe residues are therefore type $upright(A)$, at $y_t = p_t$, or type $upright(B)_a$, at $y_t = a_j + i t a beta$, where $a_j$ is an ordinary site of group $t$ with string length $a = 0 \, 1$. There are no other poles in the indicated strips.
  Expand in the full-group biorthogonal bases $D_l \, D_r^(*)$, including each initial mark, using Lemma 4. The summand contains $D_l U \, D_r^(*) U^(*)$ divided by their two norms; the remaining $D_l^(*) \, D_r$ meet the prescribed operator. An ordinary permutation in either group leaves the summand invariant: braid transport multiplies vectors and their norms by the same scalars, and the prescribed operator intertwines the ordinary braids. Place an ordinary site last. Its untouched last roots exclude $r_j < l_j$. Projection gives $sum l = m$ in both groups and $sum \( l - r \) = 1$ in each group. The plus mark has $l_p = 1$, while the minus mark has $r_p = - 1$, by their leading occupied roots. Thus the possibilities are precisely
  $ & t = + 1 & t = - 1 & upright("ordinary exceptions")\
upright(A) & \( l_p \, r_p \) = \( 1 \, 0 \) & \( l_p \, r_p \) = \( 0 \, - 1 \) & upright("none")\
upright(B)_a & \( l_p \, r_p \) = \( 1 \, - 1 \) & \( l_p \, r_p \) = \( 1 \, - 1 \) & r_j = l_j + 1 upright(" at one site ") j . $
  Other labels match. The string length at any ordinary site is $min \( 1 + t l_j \, 1 + t r_j \)$, giving exactly the claimed particle totals.
  Sort nonexceptional spectators first. On the plus group’s $D_l^(*)$ the occupied mark traverses minus roots with saturated spins: each emerged minus forces nondecrease, and the initial spin is maximal. These crossings supply their $F$-factors. In type $upright(A)$ the vacancy on $D_r$ splits to $+ \, -$, since its leading root is plus; the second strand is again saturated. In type $upright(B)$ it starts vacant and ends minus while crossing plus roots, so exactly one crossing contributes the unit producing an emerged plus. This must be the leading plus root of site $j$. If $l_j = - 1$, the actual spin on $D_l^(*)$ is minus, forcing the real split to vacancy, minus: a minus could not emerge plus at the leading root. If $l_j = 0$, the actual spin must be vacant, and the starred split there is minus, plus. Their first relevant roots are untouched when the ordinary sites are sorted before inserting the mark. All remaining exceptional strands then cross spectators with saturated spins. Consequently there is exactly one output cup $U$ in place of one $F$-factor. For the minus group exchange starred and real lists and negate relative spins; the physical cup phases agree. Spectator overlap gives the matching norm.
  Here are explicit rules for the product comparison. Recall
  $ cal(R) \( plus.minus 1 \) = { \( plus.minus 1 \, 0 \) } \, #h(2em) cal(R) \( 0 \) = { \( 1 \, - 1 \) \, \( - 1 \, 1 \) } . $
  For ordered sites, evaluate factors at first coordinate minus second. Roots $\( e \, g \) \, \( f \, h \)$ shift that difference by $g - h$. Put $u = 1$ for the $l$-half, $u = - 1$ for the $r$-half. Equal groups and equal signs contribute $P_(2 u) P_(3 u)$; opposite groups and opposite signs contribute $P_(- 2 e) P_(- 3 e)$. For equal groups and opposite signs an uncancelled norm contributes
  $ frac(P_(- 2 e) P_(- 3 e), P_0 P_e) . $
  Include this once, from the $l$-list, for matching ordinary spectators. If the earlier site is exceptional, include it in each half only for $e = - u$, as the saturated routes require. In each half divide by $2 cosh \( \( dot.op \) \/ 2 \)$ at shift zero if exactly one site label is zero, or at shifts $- 1 \, 0 \, 1$ if both are zero. Finally the special cup contributes $\( - 2 i t d \) \/ P_(- t a)$ at mark minus changed site. These rules account for both occupied cyclic blocks and both centered merge quotients.
  The ordinary one-site baseline is $\( 2 c \)^(\( a - 1 \)^2)$; use the same baseline at the changed site. The additional exceptional factors are
  $ C_0 = frac(rho_(upright(v)) \( 2 c \)^(3 \/ 2), 2 d F \( 2 lambda \)) quad \( upright(A) \) \, #h(2em) C_0 frac(2 c, \( 2 c \)^(\( a - 1 \)^2)) quad \( upright(B)_a \) . $
  Each split supplies centered divisor $2 d$, one internal split norm is uncancelled, and the forced split coefficient is $rho_(upright(v))$, up to phase. Let $z_(l \, t) \, z_(r \, t)$ be the split-site counts. Rotating the minus tail in both halves, including block phases and the twist, gives
  $ k^(1 + \( z_(l \, +) - z_(r \, +) + z_(r \, -) - z_(l \, -) \) \/ 2) . $
  The tail exponent is twice the number of relative plus roots in its $r$-list minus twice the number of relative minus roots in its $l$-list; the twist exponent is $- 2 \( m - 1 \)$. The split and cup phases contribute $k$ per group in $upright(A) \, upright(B)_0$, and 1 in $upright(B)_1$, leaving the constant $k^2$.
  For the remaining pair comparison, record phases in units of $pi \/ 8$ modulo 16. Temporarily omit the cup numerator and own-probe residues. Remove the baseline ordinary cross-group sign $\( - 1 \)^(1 - \( a - 1 \) \( b' - 1 \))$, including changed sites; its total is sector-dependent only. Matching spectator pairs now have ratio 1. A full plus exceptional list of type $upright(A)$ or $upright(B)_0$, against a spectator of length $j$, has phases
  $ j & 0 & 1 & 2\
upright("same group") & 12 & 8 & 12\
upright("opposite group") & 4 & 8 & 4 . $
  Negate entries for $upright(B)_1$, and negate them for a minus exceptional list, combining both negations when applicable. The plus-list versus minus-list phases in order $upright(A) \, upright(B)_0 \, upright(B)_1$, and the phases within one exceptional list, are
  $ mat(delim: "(", 0, 4, 0; 12, 0, 4; 0, 12, 0) \, #h(2em) \( 0 \, 4 t \, - 4 t \) . $
  For example, place a plus exceptional list of type $upright(A)$ before a same-group spectator of string length zero, and write $x$ for mark minus spectator. The mark has labels $l = 1 \, r = 0$, whereas the spectator has $l = r = - 1$. The $l$-half contributes 1. The two mark roots in the $r$-half, including the single merge divisor, give
  $ frac(P_(- 3) \( x \) P_(- 4) \( x \), P_(- 1) \( x \) P_0 \( x \)) frac(P_(- 1) \( x \) P_(- 2) \( x \), 2 cosh \( x \/ 2 \)) = i frac(P_(- 2) \( x \) P_(- 3) \( x \), P_0 \( x \)) . $
  The corresponding ordinary-mark and probe factors on the gas side are
  $ frac(P_2 \( - x \) P_3 \( - x \), P_0 \( - x \)) = - frac(P_(- 2) \( x \) P_(- 3) \( x \), P_0 \( x \)) . $
  Their ratio is $- i$, the phase 12 in the table. Here we used $P_(- 4) \( x \) = 2 i cosh \( x \/ 2 \)$ and $P_j \( - x \) = - P_(- j) \( x \)$. The other entries use the same root and merge rules.
  The following substitution verifies these tables and the constancy of the ratios. Encode powers of $P_j$ by $xi^j$ in the signed spin-minus-gas polynomial of each pair. Insert the preceding root factors at shift $g - h$, subtract $xi^4$ at each merge shift, and subtract $xi^(- t a)$ for the special denominator. Subtract ordinary string exponents for two ordinary sites. For an ordinary site of group $z$, length $a$, against a mark, subtract at ordinary minus mark
  $ xi^(2 z) + xi^(3 z) + sum_(h = 1)^a xi^(z h) \( xi^(- 4 z) - xi^z \) . $
  For a probe shifted from its site by $b = 0$ in $upright(A)$, or $b = t a$ in $upright(B)_a$, add for another ordinary site of group $z$, length $j$, at ordinary minus probe-site,
  $ xi^(z - t - b) [1 - sum_(h = 1)^j xi^(z h) \( xi + xi^(- 1) - 1 \)] . $
  For another mark add, at probe-site minus mark, $xi^b \( 1 + xi^(2 t) \)$ in the same group and $- xi^(b - 3 t)$ in the other group. Reverse exponents for reversed arguments. Substituting the displayed $cal(R)$’s gives zero modulo $xi^8 - 1$. To recover the constant send the ordered real difference to $+ oo$: sum coefficients times exponent plus 8, omit the added 8 on reversed probe and ordinary-mark monomials, and replace it by $- 4$ on merge monomials. This gives the displayed tables after baseline removal.
  The residues of the singular own-probe factors are $- 1 \/ P_(2 t) \( 0 \) \, 1 \, P_t \( 0 \)$ for $upright(A) \, upright(B)_0 \, upright(B)_1$; the remaining factors are evaluated at the pole. Write these residues as the vector $R$. The exceptional scalar ratios relative to $C_0$ are $E = \( 1 \, 1 \, 2 c \)$, and the cup numerators are $N = \( 1 \, - 2 i t d \, - 2 i t d \)$. In the spin-to-residue ratio their combined contribution is $E N \/ R = \( 2 i t d \, - 2 i t d \, 2 d \)$. They have equal modulus $2 d$, and relative phases $\( 0 \, 8 \, - 4 t \)$, since $sin lambda = c$. With the internal exceptional phases this is $\( 0 \, 8 + 4 t \, - 8 t \)$. Total ordinary length $n - 1$ makes the spectator contribution zero if exactly one $upright(B)_1$ occurs, and $8 \( 1 + \# upright(B)_0 \)$ otherwise. Adding the matrix above gives 8 in all nine cases. Thus the ratio is independent of pole sites and string lengths within a sector. Finally, replacing ordinary baselines by $2 d$ times their internal residues contributes only $\( c \/ d \)^(sum \( 1 - a \)) = c \/ d$. All remaining magnitudes are fixed constants, proving the identity and uniform bound. ◻
]

=== 8.2 Neutralizing the two probes <neutralizing-the-two-probes>

Set $L_X = gamma^(- 1) log s$ and $L_Y = gamma^(- 1) log b$. From now on the real site offsets are zero. The following estimate is the single-arc output needed in geometric applications. The statement includes the strongly unequal-wall regime.

#thm([Theorem 8.3.])[
  (Uniform one-arc bound).  #emph[ There are constants $delta_1 > 0$, $L_(*) > 0$, and $C < oo$ such that 
$ A \( p \, p' \) lt.eq b^C $

 whenever $L_Y gt.eq L_X gt.eq L_(*)$, $s lt.eq b$, and at least $1 \/ 2 - delta_1$ of the ordinary $X$ sites have height $beta$. The marks may each have either height in ${ 0 \, beta }$. There is no positive lower bound on $L_X \/ L_Y$.]
] <09_fast_paths:one-arc-bound>

The proof has three tasks. We move the probe integral to the positive magnetic mean contours, keeping the residues that bind a particle to a probe. We then add two positive half-masses to make the fluctuation field neutral. Coercivity and the real reference comparison finally bound the remaining integral by $exp \( O \( L_Y \) \)$. The last step below checks uniformity as $L_X \/ L_Y$ tends to zero.

#proof[
  Write $L = L_Y$. Initially suppose that $L_X gt.eq c_1 L$ with fixed $c_1 > 0$ and let $L arrow.r oo$. We will identify all uses of this temporary restriction and remove them at the end.
  ===== 8.2.1 Deformation and bound particles. <deformation-and-bound-particles.>
  Move the doubles to the final magnetic lines. Their fused factors cancel the probe denominators, so this movement crosses no new pole. Move the minus far singleton from height $- 2.35 beta$ to $- 7 beta \/ 2$. The only crossed poles bind a particle to the upper edge of the plus probe, giving particle height $- 2.66 beta$, or to the lower edge of the minus probe, at height $- 2.72 beta$. A pair zero prevents two particles from binding to the same probe. After a binding, the distances swept from that particle during the remaining minus far-singleton movement are strictly less than one in units of $beta$. Move free variables of the same label together; this avoids any additional particle pole. There are therefore only boundedly many binding types, each with at most two attached particles.
  The factorial measures survive this operation exactly. If a species has $r$ particles, summing the $r$ possible choices of the attached particle changes $1 \/ r !$ into $1 \/ \( r - 1 \) !$. For two distinct choices, $r \( r - 1 \) \/ r ! = 1 \/ \( r - 2 \) !$. The same cancellation applies when the particles come from different species. Thus the unbound variables retain one factorial divisor for each species, with no extra growing factor from the labels of the bound particles.
  Move the main $X$ line to the positive-density magnetic graph. On the final contours all denominators are regular after fusing doubles and deleting each binding denominator. The joint tail exponent is bounded above by
  $ - sum_v \| Re v \| - sum_(t = plus.minus 1) \| Re y_t \| $
  up to a constant depending on the counts. This proves simultaneous absolute convergence and justifies the deformations and the limit of coinciding real site offsets.
  We also need a small extension below upper-site fraction $1 \/ 2$. For any sufficiently small fixed $delta_2 > 0$, decrease $delta_1$ so that the positive-density graph has heights in $\[ 1 \/ 2 - delta_2 \, 1 \]$ in units of $beta$. The positive-real-part implicit-function argument of Lemma 8 continues uniformly on this slightly larger parameter interval. All regular offsets retain strict margins. The boundary-line positivity used in Theorem 10 persists by compact continuity of its normalized symbol. At infinity this perturbation creates no new offset-zero coincidence, and the limiting off-diagonal pair remains unchanged. Consequently the magnetic mean and real-energy estimates used below continue with uniform constants.
  ===== 8.2.2 Mean cancellation and neutralization. <mean-cancellation-and-neutralization.>
  Fix a binding type and freeze the probes. The ordinary mean and marked-anomaly identities of Lemma 9 apply to attached particles as well, because their shifts remain admissible. Each probe has an additional exact real mean cancellation: its ordinary-site log is the negative of its particle log integrated against $mu$.
  Here is the transform check, including the branch information. Evaluate the mean on group $sigma$ horizontally. Main height minus probe height plus $sigma - t$ belongs strictly to $\( 1 \, 7 \)$ or $\( - 7 \, - 1 \)$, and the corresponding site difference stays in the same component of $bb(R) \\ 8 bb(Z)$. The three probe shifts $+ 1 \, - 1 \, 0$, with coefficients $+ 1 \, + 1 \, - 1$, multiply the logarithmic transform by $c_(*) \( k \) = 2 cosh \( beta k \) - 1$. Each translated copy of the base density $rho$ contributes its translation factor times $1 \/ c_(*) \( k \)$. Multiplying by $c_(*) \( k \)$ cancels the density transform while retaining that site translation; summing the upper and lower copies gives exactly the site transform, with no angle fold. After removing the common linear growth, the exponential tails fix the real constant. The remaining mark factor satisfies
  #[#set math.equation(numbering: n => "(45)")
   $ log \| K_t \| lt.eq C - 1 / 2 \| Re y_t \| . $ <eq:one-arc-probe-tail>]
  Split main particles at their own walls $\[ - L_g \, L_g \]$. Let $alpha$ denote the interior trial densities and $zeta$ the positive counting measures of the remaining free particles together with the attached particles. In the reference real form, place an attached particle on the standard minus far-singleton line; its actual line will be accounted for by a localized error. Let $psi$ be the even positive smoothing probability already used in Lemma 11. On that same minus far-singleton label define
  $ chi_t \( u \) = 1 / 2 psi \( u - Re y_t \) \, #h(2em) t = plus.minus 1 \, #h(2em) x = Re alpha - mu + psi * zeta + chi_(+) + chi_(-) . $
  All other components of $chi_t$ are zero. The one-arc gas has $n - 1$ ordinary elementary particles, whereas $mu$ has total mass $n$. Since each $chi_t$ is nonnegative and has mass $1 \/ 2$, the weighted total mass of $x$ is zero. Thus $B \( x \)$ is defined and the magnetic coercivity theorem applies. More precisely, put $M = 1 - m$ in the gas identity. The $X$ total is $s - M$, and the $Y$ total after adding the two half-masses is $b + M$. Thus the count tests have exactly the magnetic group totals, with only the bounded extra positive masses in their local estimates.
  Let $cal(D)_(upright("arc"))$ be the centered trial cost after subtracting the logarithms of the probes and their binding residues. The extracted site factor remains
  $ cal(P)_N = \( gamma \/ 2 \)^N product_(i < j) H_(*) \( a_i - a_j \)^2 $
  up to a bounded multiplier. The change by one in the ordinary total and the at most two binding residues contribute only bounded activity and scalar factors. We claim that, for fixed sufficiently small smoothing scale $h$,
  #[#set math.equation(numbering: n => "(46)")
   $ Re cal(D)_(upright("arc")) gt.eq c B \( x \) + 1 / 2 sum_(t = plus.minus 1) \| Re y_t \| - C_h \( L + n_e \) \, $ <eq:09-trial>]
  where $n_e$ is the number of explicit variables, including the bounded number of attachments.
  To verify this inequality, first retain only the linear tails. After mean cancellation, the probe contribution apart from $K_t$ is
  $ - 1 / 2 sum_(t = plus.minus 1) (sum_I w_I \( Re alpha - mu + zeta \)_I \, \| thin dot.op - Re y_t \|) . $
  This is exactly the cross term with two point half-masses for the tail kernel $- w_I w_J \| u - v \|$. Replacing those point masses by $chi_t$ changes the expression by exponentially localized tests, because $psi$ is even. The compensator self and mutual terms are bounded above uniformly in the two centers: the negative linear mutual tail has a favorable sign, and the smoothed local remainders are bounded. A removed binding denominator changes no tail, since its binding distance is zero. Equation (45) supplies the remaining positive term in the trial cost.
  It remains to control the localized parts of the kernels. The residual probe logs have uniformly bounded localized $H^1$ norms on the main curves. On explicit labels and residues they have exponentially localized upper bounds. Negative Sobolev duality from magnetic coercivity bounds their pairing against the interior-minus-mean field by an arbitrarily small positive fraction of $B \( x \)$ plus a constant. In applying it, write that field as $x - psi * zeta - chi_(+) - chi_(-)$; this retains the compensator terms. Averaging far-label logs against $psi$ gives the required smooth compensator tests. The explicit parts are controlled by bounded localized kernels and the cell estimate
  $ sum_j n_j^2 lt.eq C \( 1 + \| log h \| \) \( B \( x \) + 1 \) . $
  The added positive masses have bounded total, so this estimate and the remaining count estimates of Lemma 11 have only bounded additive changes.
  For an attached particle, compare its actual line with the standard far line only after smoothing. Against an interior variable the tails agree and their difference is a regular localized test. Against another explicit charge compare the actual action directly with the twice-smoothed standard kernel. Regularity of the actual denominators, equality of their tails, and boundedness of the smoothed local kernel show that the negative error is at most $C_h e^(- c \| u - v \|)$. In particular no comparison at an unsmoothed fictitious collision is used. Since there are at most two attachments, summing these explicit-pair errors costs at most $C_h n_e$. The localized tests paired against $x$ cost at most $eta B \( x \) + C_(h \, eta)$ by Sobolev duality, for any fixed $eta > 0$; pairing against $psi * zeta$ costs another $C_h n_e$, and the two compensators cost a bounded amount. Thus these attachment errors do not require a coefficient tending to zero with $h$. The marked anomalies satisfy the same bounds. Equation (24) controls free explicit pairs, with an omitted-diagonal cost at most $C_h n_e$. The remaining mixed errors are paired against $x - psi * zeta - chi_(+) - chi_(-)$. Choose $h$ after the fixed far-contour parameter so that the smoothing coefficient is small enough to absorb the quadratic errors into $B \( x \)$. These estimates prove Equation (46).
  ===== 8.2.3 Real reference integration and factorial summation. <real-reference-integration-and-factorial-summation.>
  We now integrate the interior fluctuations with the probes and explicit configuration frozen. The interior Hessian and its diagonal compensation are the same as in the magnetic gas without the probes. The new linear tests are smooth in the reflected reference coordinates at each fixed size. The magnetic decomposition also contains the attenuation $frak(a) = exp \( - \( X_(upright("int")) \, R zeta \) \) in \[ 0 \, 1 \]$, where $X_(upright("int"))$ is the interior empirical configuration and $R$ is the nonnegative horizontal cutoff kernel. Take the absolute value of the integral before replacing this factor by one; no signed or oscillatory identity is inferred by discarding it. Apply the coarse real source estimate (41) and the compensated quadratic integration estimate (43), with zero displacement. The latter evaluates only the smooth compensated cost on an empirical field, not its two singular energies separately.
  For clarity, the spectral loss is $O \( L \)$ already at this coarse level. Let $F$ be the real Hessian relative to $h_0$. The magnetic verification of Equation (34) and the trace bound give
  $ F gt.eq c L^(- 2) I \, #h(2em) parallel F - I parallel_1 lt.eq C L \, #h(2em) N_F \( a \) lt.eq C L sqrt(a) quad \( 0 < a < a_0 \) . $
  On $\[ a_0 \, 1 \)$, $- log a lt.eq C_(a_0) \( 1 - a \)$, so the trace norm bounds that part of the negative logarithmic sum by $C L$. Below $a_0$, the sum is
  $ \( - log a_0 \) N_F \( a_0 \) + integral_0^(a_0) frac(N_F \( a \), a) thin d a \, $
  which is again $O \( L \)$ because $integral_0^(a_0) a^(- 1 \/ 2) thin d a < oo$. Thus
  $ sum_(lambda < 1) - log lambda lt.eq C L . $
  The unnormalized reference masses must also be retained. For each nonnegative integer dimension $N_g$ they satisfy $J_(N_g) = exp \( - 1 / 4 log \( N_g + 1 \) + O \( 1 \) \)$, with $J_0 = 1$, and hence are bounded above. All dimensions are fixed integers during this real integration and at most $n - 1 lt.eq 2 b$. Consequently the reference integral is at most the exponential of minus its real trial infimum plus $C L$. This use of the source estimate needs neither a count truncation nor the sharp magnetic transport theorem.
  Reserve a fixed fraction of $B \( x \)$ in Equation (46). The magnetic count bounds, with the bounded extra masses, give
  $ ell_e + frac(M^2 + n_e^2, L) lt.eq C_h \( B \( x \) + 1 \) \, #h(2em) ell_e = sum_(v in zeta) \( \| Re v \| - L \)_(+) . $
  The inequality $C_h n_e lt.eq eta n_e^2 \/ L + C_(h \, eta) L$, with suitably small $eta > 0$, absorbs the linear cost in a further reserved fraction. We obtain positive damping in $ell_e$, $M^2 \/ L$, and $n_e^2 \/ L$, as well as $1 / 2 sum_t \| Re y_t \|$, at a cost $C L$.
  Here is the resulting absolute summation. Each free explicit position has an exponentially damped tail outside $\[ - L \, L \]$, so its integral, including its fixed activity, is at most $C \( L + 1 \)$. If the free counts are $r_I$, their factorial sum is bounded by
  $ sum_(\( r_I \) gt.eq 0) product_I frac(\[ C \( L + 1 \) \]^(r_I), r_I !) = exp \( O \( L \) \) . $
  This enlargement drops the favorable quadratic count damping and the finite-degree restriction. Summing the remaining imbalance damping $exp \( - c M^2 \/ L \)$ over $M in bb(Z)$ costs $O \( sqrt(L) \)$. The at most two attachments have already been absorbed into the probe integrals and their factorial cancellation. Finally
  $ product_(t = plus.minus 1) integral_(bb(R)) e^(- \| v_t \| \/ 2) thin d v_t < oo . $
  The bounded number of contour edges and binding types adds a fixed factor. Therefore the absolute contour sum divided by $\| cal(P)_N \|$ is at most $exp \( C L \)$.
  The uniform denominator theorem, Theorem 7, applies to all $N$ site heights in ${ 0 \, beta }$ without a restriction on their two multiplicities. Dividing the last estimate by $\| tilde(h)_N^2 \/ cal(P)_N \|$ proves $A \( p \, p' \) lt.eq b^C$ in the temporary comparable-wall regime.
  ===== 8.2.4 Uniformity for arbitrarily unequal walls. <uniformity-for-arbitrarily-unequal-walls.>
  We used only the count and smoothing estimates (22)–(25), an $O \( L_Y \)$ trace bound, and the gap and small-value count in Equation (34). We did not use the sharp determinant asymptotic or perform a physical shift. These coarse ingredients extend as follows.
  Keep a separate unstretched reference coordinate on each wall. Counts and tails always use $L_Y$, while a grid for main explicit particles starts at that label’s own wall. Denote the upper ordinary-site fraction by $t_X$. If $t_X$ tends to one without being identically one, put $d_0 = beta \( 1 - theta \( 0 \) \)$. Its discreteness gives $1 - t_X gt.eq 1 \/ s$ whenever it is nonzero. The curve estimates therefore give $1 + \| log d_0 \| = O \( L_X \)$. The exceptional localized half-derivative loss at the curved origin is only polynomial in this quantity. A main explicit particle from that label lies beyond its own wall; smoothing it into the exceptional neighborhood gains an exponential buffer of order $L_X$. Thus the smoothing errors formerly written $o_L \( 1 \)$ become $o_(L_X) \( 1 \)$, with no wall-ratio assumption. All other offset, norm, and cell estimates are uniform on their separate wall intervals.
  The regular trace comparison has bounded cost per unit cell, hence total cost $O \( L_Y \)$. At the rare center, the dyadic comparison in Equation (37) uses $O \( 1 + log \( 1 \/ d_0 \) \) = O \( L_X \)$ shells. Its coarse trace cost is therefore still $O \( L_Y \)$. The caps and the block-mean proof of the gap and small-value count are unchanged: their two interval lengths are bounded above by $L_Y$. This proves precisely the spectral estimates used in the real comparison. Each fixed-size kernel and linear test is smooth, which is all that the coarse source estimate requires. No lower bound for the rare central density and no polynomial margin for its derivatives is needed, because particles are never shifted.
  Fix the far parameter and then a sufficiently small smoothing scale. The bounds just proved give a bounded exponent along every sequence with $L_Y gt.eq L_X arrow.r oo$, taking convergent mixture subsequences when needed. If no fixed $L_(*)$ and uniform exponent existed, one could choose examples with $L_X gt.eq j$ and $log A \( p \, p' \) \/ log b > j$. A subsequence would contradict these same coarse bounds. Hence some fixed $L_(*)$ and $C$ work throughout the stated domain, completing the proof. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~G.~de Bruijn. On some multiple integrals involving determinants. #emph[Journal of the Indian Mathematical Society], New Series, #strong[19] (1955), 133--151. #link("https://pure.tue.nl/ws/files/1920642/597510.pdf")[Published article scan].]
#bibitem([2])[P.~Diaconis and S.~N. Evans. Linear functionals of eigenvalues of random matrices. #emph[Transactions of the American Mathematical Society] #strong[353] (2001), 2615--2633. #link("https://doi.org/10.1090/S0002-9947-01-02800-8")[doi:10.1090/S0002-9947-01-02800-8].]
#bibitem([3])[H.~Duminil-Copin and S.~Smirnov. The connective constant of the honeycomb lattice equals $sqrt(2 + sqrt(2))$. #emph[Annals of Mathematics] #strong[175] (2012), 1653--1665. #link("https://doi.org/10.4007/annals.2012.175.3.14")[doi:10.4007/annals.2012.175.3.14].]
#bibitem([4])[E.~Gagliardo. Caratterizzazioni delle tracce sulla frontiera relative ad alcune classi di funzioni in n variabili. #emph[Rendiconti del Seminario Matematico della Università di Padova] #strong[27] (1957), 284--305. #link("https://www.numdam.org/item/RSMUP_1957__27__284_0/")[Original article].]
#bibitem([5])[A.~Glazman and I.~Manolescu. Self-avoiding walk on $bb(Z)^2$ with Yang--Baxter weights: universality of critical fugacity and 2-point function. #emph[Annales de l'Institut Henri Poincaré, Probabilités et Statistiques] #strong[56] (2020), 2281--2300. #link("https://doi.org/10.1214/19-AIHP1024")[doi:10.1214/19-AIHP1024].]
#bibitem([6])[Y.~Ikhlef and J.~Cardy. Discretely holomorphic parafermions and integrable loop models. #emph[Journal of Physics A: Mathematical and Theoretical] #strong[42] (2009), 102001. #link("https://doi.org/10.1088/1751-8113/42/10/102001")[doi:10.1088/1751-8113/42/10/102001]. #link("https://arxiv.org/abs/0810.5037")[arXiv:0810.5037].]
#bibitem([7])[M.~Ishikawa, S.~Okada, H.~Tagawa and J.~Zeng. Generalizations of Cauchy's determinant and Schur's Pfaffian. #emph[Advances in Applied Mathematics] #strong[36] (2006), 251--287. #link("https://doi.org/10.1016/j.aam.2005.07.001")[doi:10.1016/j.aam.2005.07.001]. #link("https://arxiv.org/abs/math/0411280")[arXiv:math/0411280].]
#bibitem([8])[B.~Nienhuis. Exact critical point and critical exponents of $O \( n \)$ models in two dimensions. #emph[Physical Review Letters] #strong[49] (1982), 1062--1065. #link("https://doi.org/10.1103/PhysRevLett.49.1062")[doi:10.1103/PhysRevLett.49.1062].]
#bibitem([9])[B.~Nienhuis. Critical and multicritical $O \( n \)$ models. #emph[Physica A] #strong[163] (1990), 152--157. #link("https://doi.org/10.1016/0378-4371(90)90325-M")[doi:10.1016/0378-4371(90)90325-M].]
#bibitem([10])[OpenAI. Cylinder loop weights and planar nesting. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Cylinder-loop-weights-and-planar-nesting-September-26-2026/main.pdf")[OAI:Cylinder-loop-weights-and-planar-nesting-September-26-2026], 2026.]
#bibitem([11])[I.~J. Schoenberg. On Pólya frequency functions. II: Variation-diminishing integral operators of the convolution type. #emph[Acta Scientiarum Mathematicarum (Szeged)] #strong[12] (1950), 97--106. #link("https://acta.bibl.u-szeged.hu/13626/1/math_012_pars_b_097-106.pdf")[Original journal scan].]
#bibitem([12])[B.~Simon. The sharp form of the strong Szegő theorem. In #emph[Geometry, Spectral Theory, Groups, and Dynamics], Contemporary Mathematics #strong[387], American Mathematical Society, 2005, 253--275. #link("https://arxiv.org/abs/math/0402110")[arXiv:math/0402110].]
#bibitem([13])[C.~A.~Tracy and H.~Widom. Correlation functions, cluster functions and spacing distributions for random matrices. #emph[Journal of Statistical Physics] #strong[92] (1998), 809--835. #link("https://doi.org/10.1023/A:1023084324803")[doi:10.1023/A:1023084324803]. #link("https://arxiv.org/abs/solv-int/9804004")[arXiv:solv-int/9804004].]
#bibitem([14])[Y.~K.~Zhou and M.~T.~Batchelor. Critical behaviour of the dilute $O \( n \)$, Izergin--Korepin and dilute $A_L$ face models: Bulk properties. #emph[Nuclear Physics B] #strong[485] (1997), 646--664. #link("https://doi.org/10.1016/S0550-3213(96)00654-2")[doi:10.1016/S0550-3213(96)00654-2]. #link("https://arxiv.org/abs/cond-mat/9611156")[arXiv:cond-mat/9611156].]


