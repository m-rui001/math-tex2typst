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

#align(center)[#text(size: 16pt, weight: "bold")[Elliptic capacity propagation and Fourier restriction to the sphere]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $S^2 = { omega in bb(R)^3 : \| omega \| = 1 }$, and let $sigma$ be surface area measure, with $sigma \( S^2 \) = 4 pi$. For a bounded measurable function $g : S^2 arrow.r bb(C)$, define

$ E g \( x \) = integral_(S^2) g \( omega \) e^(2 pi i x dot.op omega) thin d sigma \( omega \) . $

The bounded-data restriction problem asks for the exponents $p$ for which this extension operator maps $L^oo \( S^2 \)$ boundedly into $L^p \( bb(R)^3 \)$. We prove the full conjectured open range.

#thm([Theorem 1.1.])[
  #emph[For every real $p > 3$, there is a finite constant $C_p$, depending only on $p$, such that 
$ parallel E g parallel_(L^p \( bb(R)^3 \)) lt.eq C_p parallel g parallel_(L^oo \( S^2 \, sigma \)) $

 for every bounded measurable complex-valued function $g$ on $S^2$.]
] <thm:main>

The exponent range is sharp. For the constant function $g = 1$, direct integration gives

$ E 1 \( x \) = frac(2 sin \( 2 pi \| x \| \), \| x \|) #h(2em) \( x eq.not 0 \) . $

The radial integral of $\| E 1 \|^p$ diverges for $0 < p lt.eq 3$. Thus Theorem 1 proves exactly the conjectured open range; it makes no endpoint assertion.

=== 1.1 The restriction problem and earlier methods <the-restriction-problem-and-earlier-methods>

The restriction problem originates in Stein’s work, and the Tomas–Stein theory gives the classical $L^2 \( S^2 \) arrow.r L^4 \( bb(R)^3 \)$ extension estimate #cite(label("Stein1979")) #cite(label("Tomas1975")) #cite(label("Tomas1979")). The oscillatory-integral work of Carleson–Sjölin and Hörmander #cite(label("CarlesonSjolin1972")) #cite(label("Hormander1973")), Fefferman’s ball-multiplier obstruction #cite(label("Fefferman1971")), and Córdoba’s geometric multiplier estimates #cite(label("Cordoba1975")) established important parts of the analytic and geometric background. Bourgain’s connection between restriction and tube geometry #cite(label("Bourgain1991Besicovitch")) made concentration of wave packets a central issue: curvature separates packet directions, but many tubes can still pass through a small region of space.

The bilinear framework of Tao–Vargas–Vega #cite(label("TaoVargasVega1998")) isolates interactions between separated frequency pieces and reassembles them across separation scales by rescaling and almost orthogonality. Wolff’s cone theorem #cite(label("Wolff2001")) and Tao’s paraboloid theorem #cite(label("Tao2003")) developed this approach through wave packets and induction on scale. In Tao’s argument, a constraint from the Fourier analysis restricts the directions of the packets that must be counted geometrically; this supplies the additional structure needed to adapt Wolff’s counting argument to the paraboloid.

The multilinear theorem of Bennett–Carbery–Tao #cite(label("BennettCarberyTao2006")) controls interactions among surface pieces whose normals uniformly span the ambient space. In three dimensions it bounds the geometric mean of three extensions in $L^3$ on a ball, using the $L^2$ norms of the three inputs and an arbitrarily small positive power of the radius. Bourgain–Guth #cite(label("BourgainGuth2011")) made this useful for the linear problem by separating transverse interactions from concentration in one small frequency region and from coplanar interactions. Their argument treats the latter configurations by rescaling and square-function estimates. This progression makes the concentration of packet directions, as well as their transverse intersections, a central part of the restriction problem.

Guth’s polynomial-partitioning argument #cite(label("Guth2016")) divides the extension integral between cells and a neighborhood of an algebraic surface. Away from that neighborhood, each packet tube meets few of the trimmed cells, allowing induction; the remaining concentration is organized by tubes tangent to the surface. This gives the bounded-data estimate for $p > 13 \/ 4$ on a compact smooth positively curved surface $S$. Shayya’s weighted estimates #cite(label("Shayya2017")) give estimates with finite $L^q \( S \)$ input norms in this output range. Kim #cite(label("Kim2017")) treats these finite-input estimates through rescaling and interpolation. Wang’s broom method #cite(label("Wang2022Brooms")) then exploits a further constraint on the truncated paraboloid: tubes that collect near one region spread toward others, which limits repeated concentration near separated surface neighborhoods. Combined with polynomial partitioning and a two-ends argument, it yields the bounded-data estimate for $p > 42 \/ 13$.

Wang and Wu #cite(label("WangWu2022")) #cite(label("WangWu2024")) combine incidence estimates with refined decoupling. The latter controls oscillatory interaction using the number of packets meeting each small ball, while the incidence argument retains how the occupied part of a tube is distributed along its length. Their two-ends Furstenberg inequalities use this spacing information to improve the multiplicity bound. In #cite(label("WangWu2024")) Theorem 0.2 they obtain the diagonal estimate $L^p \( S \) arrow.r L^p \( bb(R)^3 \)$ for $p > 22 \/ 7$ on compact positively curved $C^2$ surfaces, including boundary. The input norm matters in this comparison: a diagonal estimate controls all $L^p \( S \)$ data, whereas Theorem 1 is stated for bounded sphere data. The latter reaches the full open output range $p > 3$; its sphere-specific factorization consequence is discussed separately below.

=== 1.2 Elliptic capacity and the geometric obstacle <elliptic-capacity-and-the-geometric-obstacle>

The geometric and oscillatory estimates use the same eccentricity-biased weight. For an ellipse $E subset bb(R)^2$ with semiaxes $L gt.eq w > 0$, set

$ W \( E \) = L^(1 + kappa) w^(1 - kappa) \, #h(2em) 0 < kappa < 1 \/ 10 . $

A joint test for two vector coordinates uses translates of the same ellipse, with the two centers chosen independently. It therefore measures concentration of their joint law without assuming independence. Equivalently, $W \( E \) = L w \( L \/ w \)^kappa$: the usual area weight is multiplied by a power of the eccentricity. Differently oriented tests intersect in smaller rectangles. In the hairbrush estimate of Lemma 8, the extra exponent $kappa$ turns the resulting overlap count into a power saving. The propagation argument uses that saving to control how concentration can change as a line moves.

Let $M$ be a large dyadic scale, and consider a joint law of uniformly bounded line parameters $\( U \, V \)$ and a time $T in \[ 0 \, 1 \)$, with $X_t = V + t U$. Suppose its initial joint tests obey $Pr \( U in u + E \, V in v + E \) lt.eq K W \( E \)$. The time hypothesis is conditional on a base label that determines $U \, V$: at interval length $M^(- y)$, for $0 lt.eq y lt.eq 1$, both the number of occupied time bins and the largest bin probability have upper bounds with exponents $s y$ and $- s y$, respectively, up to a small error. Here $s in \( 0 \, 1 \]$.

At the terminal resolution let $T_1$ be the left endpoint of the time bin of length $M^(- 1)$ containing $T$. A propagation exponent $q$ means that a dominated sublaw $nu$ satisfies

$ nu \( T_1 = t \, med U in u + E \, med X_t in x + M^(- 1) E \) lt.eq M^(- q + o \( 1 \)) K W \( E \) $

simultaneously for all terminal bins and independent centers $u \, x$. The retained mass is $M^(- o \( 1 \))$, meaning that it exceeds every fixed negative power for sufficiently large $M$. Theorem 5 supplies every strict exponent below $1 + 2 s - 10 kappa$ when the time error is sufficiently small. That theorem specifies the input and terminal ellipse scales and all conditional quantifiers.

===== 1.2.1 Inputs and methodological precedents. <inputs-and-methodological-precedents.>

The planar input belongs to the projection and Furstenberg-set tradition of Marstrand and Kaufman #cite(label("Marstrand1954")) #cite(label("Kaufman1968")), Bourgain’s discretized projection theorem #cite(label("Bourgain2010")), and Oberlin’s work on exceptional projections #cite(label("Oberlin2012")). Packing-dimension advances of Orponen and Shmerkin #cite(label("Orponen2020Packing")) #cite(label("Shmerkin2022Packing")), their Hausdorff-dimension improvement #cite(label("OrponenShmerkin2023Hausdorff")), and their work relating projections, Furstenberg sets, and the $A B C$ sum-product problem #cite(label("OrponenShmerkin2026ABC")) provide further context for Ren–Wang’s sharp finite incidence theorem #cite(label("RenWang2023")). In the finite form used here, each point of a planar family is incident to a comparably sized family of thin tubes. Counts in smaller balls and angular intervals control concentration of the points and tube directions. Ren–Wang’s theorem gives a lower bound for the total number of distinct tubes. Drawing lines of constant projection through the points converts this into a bound for projected supports. We prove the weighted, conditional, and joint-coordinate consequences needed for our laws.

The proof uses finite entropy in the sense of Shannon #cite(label("Shannon1948")) and the entropy rules organized by Tao #cite(label("Tao2010Entropy")). The local-entropy approach of Hochman–Shmerkin #cite(label("HochmanShmerkin2012")) and Hochman’s inverse principles #cite(label("Hochman2014")) are related methodological precedents; our correlated conditional laws are handled by the finite arguments below. The radial step is closely related to the reciprocal thin-tube bootstrap of Orponen–Shmerkin–Wang #cite(label("OrponenShmerkinWang2024Radial")). Hairbrush intersection counting #cite(label("Wolff1995Kakeya")) #cite(label("TaoVargasVega1998")) and the density and factoring arguments of Wang–Zahl and Guth–Wang–Zahl #cite(label("WangZahl2025Convex")) #cite(label("GuthWangZahl2026")) supply further geometric context. The independently translated elliptic capacity and its propagation through arbitrary finite complex arrays and coordinate masks are the specific estimates established here. The external analytic input is Bourgain–Demeter’s $ell^2$ decoupling theorem #cite(label("BourgainDemeter2015")). Section 6 proves the canonical-packet refinement needed here, following the grouping and rescaling method of Guth–Iosevich–Ou–Wang #cite(label("GIOW2020")) and the localized extension formulation of Wang–Wu #cite(label("WangWu2024")). Besides these decoupling and finite-incidence inputs, the proof uses classical almost-everywhere differentiation #cite(label("Tao2011Measure")) #cite(label("Heinonen2005Lipschitz")).

=== 1.3 The finite packet theorem <the-finite-packet-theorem>

The packet estimate underlying the sphere theorem applies to arbitrary finite complex coefficient arrays. We summarize its definitions before stating the uniform bound; Section 6 develops the frame identities and norm properties in detail.

On a graph patch of the sphere, absorbing the surface-area density into the data gives the phase $x dot.op xi + t phi.alt \( xi \)$, with $xi in bb(R)^2$. Rescaling a physical region of size $N^2$ gives the factor $e^(2 pi i N^2 \( x dot.op xi + t phi.alt \( xi \) \))$. A packet near frequency $nu$, centered at $z$ at time $t_I$, is concentrated near the line

$ x = z + \( t - t_I \) U_nu \, #h(2em) U_nu = - nabla phi.alt \( nu \) . $

Thus its frequency and position labels specify the velocity and center tested by the elliptic capacity. The phase is continued smoothly beyond the patch as specified in the theorem below.

For a fixed dyadic $N$, a dyadic factor $q in \[ 1 \, N \]$ determines the frequency width $theta = q \/ N$, time-bin length $r = q^(- 2)$, and spatial mesh parameter $w = \( q N \)^(- 1)$. Choose a fixed smooth, nonnegative, compactly supported window $chi$ whose integer translates satisfy $sum_(n in bb(Z)^2) chi \( xi - n \)^2 = 1$. Let $L_(upright(f))$ be a fixed side length containing its support. A bin $I$ of length $r$, with left endpoint $t_I$, has packet labels $\( nu \, z \) in theta bb(Z)^2 times L_(upright(f))^(- 1) w bb(Z)^2$. With $chi_theta^nu \( xi \) = chi \( \( xi - nu \) \/ theta \)$, the exact maps for the fixed phase $phi.alt$ in the theorem below are

$ \( sans(P)_(q \, I) f \)_(nu \, z) & = integral f \( xi \) chi_theta^nu \( xi \) e^(2 pi i N^2 \( z dot.op xi + t_I phi.alt \( xi \) \)) thin d xi \,\
sans(S)_(q \, I) c \( xi \) & = \( L_(upright(f)) theta \)^(- 2) sum_(nu \, z) c_(nu \, z) chi_theta^nu \( xi \) e^(- 2 pi i N^2 \( z dot.op xi + t_I phi.alt \( xi \) \)) . $

Analysis thus takes unnormalized Fourier coefficients in each window; synthesis has the corresponding inverse Fourier-series factor.

For an array $c = \( c_v \)$ in one bin, indexed by $v = \( nu_v \, z_v \)$, put

$ K \( c \) & = theta^2 sup_(E \, u \, z) frac(1, W \( E \)) sum_(U_(nu_v) in u + E\
z_v in z + r E) \| c_v \|^2 \,\
G \( c \)^3 & = w^2 #scale(x: 180%, y: 180%)[\(] sum_v \| c_v \|^2 #scale(x: 180%, y: 180%)[\)] K \( c \)^(1 \/ 2) \, #h(2em) A \( c \) = inf_(\| c \| lt.eq sum_(j = 1)^k \| a_j \|) sum_(j = 1)^k G \( a_j \) . $

The supremum uses ellipses with both semiaxes at least $theta$, and independent centers $u \, z$; the infimum uses finite arrays and coordinatewise domination. The squared coefficients place mass $\| c_v \|^2$ at the velocity–position pairs $\( U_(nu_v) \, z_v \)$. Thus $K$ measures joint concentration, $G$ combines that concentration with squared coefficient mass, and the atomic norm $A$ allows finite decompositions into arrays of controlled $G$-cost. Subscripts below specify the scale and bin.

#thm([Theorem 1.2.])[
  (Uniform propagation of finite packet arrays).  #emph[Fix $0 < kappa < 1 \/ 10$, a smooth elliptic continuation $phi.alt$ of a spherical graph patch allowed in Section 6, a bounded frequency-label region $Omega subset bb(R)^2$, and the fixed window system used in (6.2)–(6.2). The continuation is defined on $bb(R)^2$, has uniformly definite bounded Hessian, and has bounded derivatives of every order at least two.]
  #emph[For every finite $B gt.eq 1$ and every $epsilon > 0$, there is a finite constant $C$ with the following property. Let $m \, N$ be dyadic with $1 lt.eq m lt.eq N lt.eq m^B$, and let $d$ be any finite complex array on the initial packet grid, at factor $1$. For each interval $I$ in the partition of $\[ 0 \, 1 \)$ into intervals of length $m^(- 2)$, let $M_I$ be any coordinate projection retaining finitely many entries of the factor-$m$ packet grid. Assume that every initial index in $"supp" d$ and every retained terminal index has frequency label $nu in Omega$ and position label $\| z \| lt.eq m^B$. Set 
$ \( T_m d \)_I = M_I thin sans(P)_(m \, I) sans(S)_(1 \, \[ 0 \, 1 \)) d . $

 Write $A_1 \, G_1$ for the atomic norm and capacity gauge at the initial scale 
$ \( theta \, r \, w \) = \( N^(- 1) \, 1 \, N^(- 1) \) \, $

 and $A_(m \, I)$ for the same atomic norm in the terminal bin $I$, at scale 
$ \( theta \, r \, w \) = \( m \/ N \, m^(- 2) \, \( m N \)^(- 1) \) . $

 Then 
$ m^(- 2) sum_(I subset \[ 0 \, 1 \)\
\| I \| = m^(- 2)) A_(m \, I) #scale(x: 120%, y: 120%)[\(] \( T_m d \)_I #scale(x: 120%, y: 120%)[\)]^3 lt.eq C m^(10 kappa + epsilon) A_1 \( d \)^3 lt.eq C m^(10 kappa + epsilon) G_1 \( d \)^3 \, $

 where the sum is over the specified partition. The constant is uniform in $m \, N \, d$ and the coordinate projections. It may depend on $B \, kappa \, epsilon \, phi.alt \, Omega$, and the fixed windows.]
] <thm:intro-packets>

The maps retain the complete transition matrices between the selected coordinate sets. Each projection deletes coordinates; it does not delete selected summands within a retained coefficient. The initial array need not be the analysis array of a function. Frequency labels may lie anywhere in the fixed region $Omega$ of the chosen continuation, including its transition annulus. The phase and its derivative bounds are fixed before $m \, N$ vary.

Theorem 45 proves this estimate, with the atomic-input formulation supplied by Lemma 43. The scale subscripts above only specify which of the norms from Section 6 is being used.

=== 1.4 Consequences and related estimates <consequences-and-related-estimates>

For the sphere, Bourgain’s factorization theorem #cite(label("Bourgain1991Besicovitch")), in the weak-type and interpolation form explained in #cite(label("Buschenhenke2024")) Section 1.1, (1.1)–(1.2), upgrades the full family in Theorem 1 to

$ parallel E g parallel_(L^q \( bb(R)^3 \)) lt.tilde_q parallel g parallel_(L^q \( S^2 \)) #h(2em) \( 3 < q < oo \) . $

This controls finite-$L^q$ sphere data as well as bounded data. Interpolation also gives the open mixed-norm range in Section 9. The factorization is sphere-specific; the general-surface application below uses the packet theorem itself.

===== 1.4.1 A Kakeya maximal consequence. <a-kakeya-maximal-consequence.>

The sphere conclusion gives another route to the strong maximal estimate proved independently in #cite(label("OpenAIKakeya2026")) Theorem 1.1. For $a in bb(R)^3$, $omega in S^2$, and $0 < delta < 1$, put

$ T_delta \( a \, omega \) & = { a + t omega + u : \| t \| lt.eq 1 / 2 \, med u perp omega \, med \| u \| lt.eq delta } \,\
K_delta f \( omega \) & = sup_(a in bb(R)^3) frac(1, pi delta^2) integral_(T_delta \( a \, omega \)) \| f \( x \) \| thin d x . $

Thus the tubes have unit length and volume $pi delta^2$.

#thm([Corollary 1.3.])[
  #emph[For every $epsilon > 0$ there is a finite $C_epsilon$ such that, for every $0 < delta < 1$ and $f in L^3 \( bb(R)^3 \)$, 
$ parallel K_delta f parallel_(L^3 \( S^2 \, sigma \)) lt.eq C_epsilon delta^(- epsilon) parallel f parallel_(L^3 \( bb(R)^3 \)) . $

]
] <cor:sphere-kakeya-maximal>

Sphere factorization, weighted tube duality, and interpolation give this corollary; the complete transfer is proved in Section 9. The supremum over tube locations is part of the assertion, so it controls translated tube averages with no restriction on where the tubes meet. The scale loss is an arbitrary positive power. In particular, the standard implication from maximal estimates gives Hausdorff dimension $3$ for every set containing a unit line segment in every direction #cite(label("MattilaFourierNotes")) Theorem 2.12. That dimension conclusion was already proved by Wang and Zahl #cite(label("WangZahl2025Convex")) Theorem 1.1; their result also gives Minkowski dimension $3$.

===== 1.4.2 The full packet theorem on other surfaces. <the-full-packet-theorem-on-other-surfaces.>

The full array formulation also has a separate application. The companion article #cite(label("OpenAIDiagonal2026")) Theorem 1.1 combines it with a translated-tube Kakeya maximal estimate to prove $L^p \( Sigma \) arrow.r L^p \( bb(R)^3 \)$ extension for every $3 < p < oo$ on each compact smooth positively curved surface, possibly with smooth boundary. For spheres and quadratic graphs, bounded-data-to-diagonal factorization already has an established history #cite(label("Bourgain1991Besicovitch")) #cite(label("Buschenhenke2024")); the companion treats general elliptic charts using the full packet theorem and an explicit phase continuation. Recent smooth Alpert testing formulations #cite(label("Sawyer2026TestingComparison")) #cite(label("RiosSawyer2026ConvolutionTesting")) study extension through specified testing conditions. The conclusions here concern deterministic complex arrays and all bounded measurable sphere data, with the fixed phase, window, and complexity parameters specified in the theorem.

===== 1.4.3 An independent Bochner–Riesz route. <an-independent-bochnerriesz-route.>

The bounded-data spherical estimate in Theorem 1 also follows independently from the Bochner–Riesz multiplier theorem in #cite(label("OpenAIBochnerRiesz2026")) Corollary 12.4, through Tao’s implication #cite(label("Tao1999Epsilon")). This implication does not recover the capacity and packet estimates proved here.

=== 1.5 The argument <the-argument>

The eccentricity bias in $W$ limits the mass that can concentrate simultaneously in differently oriented tests. The proof develops this fact for conditional laws, applies the resulting propagation theorem to packet arrays, and finally removes the spatial power loss.

===== 1.5.1 Geometric propagation. <geometric-propagation.>

Suppose the retained-law bound above fails. Extremizing over relative spatial scales selects tests whose mass is large compared with their capacity weight at successive time resolutions. Writing their radii as powers of $M$ gives two logarithmic width-depth functions of time depth. The hairbrush bound controls differences between their axes, assigning each sample of the joint law a reference axis on a short interval of scales. Near a differentiability point of the two width-depth functions, their rates describe whether the aspect ratio is stationary, increasing, or decreasing. This is the calibrated width path constructed in Section 2.

We record conditional Shannon entropies of velocity, position, time, and the reference axis, rounding these variables at compatible resolutions. Time and axis may be correlated. The laws are first regularized on finite grids, so the limiting entropy increments retain the support counts and probability bounds required by the projection theorems. Those theorems force lower bounds on entropy growth. In each of the three aspect cases, the bounds contradict the concentration required by failure of geometric propagation.

===== 1.5.2 Propagation of wave-packet bounds. <propagation-of-wave-packet-bounds.>

The exact frame maps compose between packet scales, and the atomic norm lets us combine estimates despite intermediate coordinate restrictions. Insert finitely many intermediate scales and form a layered graph whose vertices are the retained packet indices. An edge records that a child frequency and center lie in a parent’s localization neighborhood. A path is a sequence of such indices from an initial packet to a terminal one; the coefficients still evolve by the full masked matrices.

Suppose amplification has a growth exponent greater than $10 kappa$. Among families approaching the largest exponent, first take the infimum $s$ of the exponents $sigma$ for which each initial index reaches at most $m^(2 sigma + o \( 1 \))$ terminal time bins. This infimum is positive; it need not be attained. Then minimize the number of paths per original initial index, again at the level of scale exponents. The second extremum forces later coordinate selections to retain a subpower fraction of those paths whenever they preserve nearly maximal amplification. Uniform counting on selected paths then gives both conditional prefix counts and maximal prefix probabilities with exponent $s$ in the geometric base $M = m^2$. The initial packet index is the base label and determines the line parameters $\( U_nu \, z \)$. This is the law to which geometric propagation applies.

The geometric bound controls output capacity. Refined decoupling controls a fourth moment, while the frame identity gives a second moment bound. Their combination cancels the possible time-support deficit and leaves a growth exponent at most $10 kappa$. Figure 2 shows how the two extrema lead to the conditional time law and the capacity–mass cancellation.

===== 1.5.3 Removing the spatial loss. <removing-the-spatial-loss.>

The atomic norm controls the normalized sum of cubed packet coefficients. For actual graph-patch data, terminal coefficients are samples of the localized extension, up to rapidly decaying truncation errors. Averaging the sampling lattice therefore gives a cubic integral estimate. Taking $kappa$ small makes its spatial power loss arbitrarily small. On widely separated balls, a joint frame estimate bounds the total initial coefficient mass without a factor for the number of balls. A covering of the large-value set, followed by Fourier reproduction and layer integration, yields the global estimate for every $p > 3$. This last step works directly for bounded measurable complex data.

===== 1.5.4 Structural statements within the proof. <structural-statements-within-the-proof.>

The geometric and entropy arguments also yield structural statements. The matrix form of the ellipse weight obeys the composition inequality (2.7). Corollary 16 determines a sample’s axis, up to the corresponding aspect precision, from its exact line parameters and time prefix. Lemmas 23 and 25 describe additive parts of the entropy’s local limits and lower bounds when some resolutions increase along a path and others decrease. They also apply to the specified paths on boundary faces of the admissible resolution domain.

=== 1.6 Organization and conventions <organization-and-conventions>

Sections 2–5 prove the geometric propagation theorem. Section 2 constructs the calibrated path; Section 3 develops its entropy profiles and tangent rules; Section 4 proves the projection consequences of the planar Furstenberg theorem; and Section 5 treats the three possible directions of aspect change. Sections 6 and 7 prove the wave-packet estimate, and Section 8 concludes the proof of Theorem 1. Section 9 gives the sphere-to-Kakeya transfer and the mixed-norm sphere estimates.

Functions may be complex-valued, and probability laws may have arbitrary correlations, unless a more restrictive hypothesis is explicitly stated. Ellipse containments suppress independent translations when two spatial coordinates are tested. Fixed multiplicative constants are harmless in scale exponents. The geometric and packet sections specify their limiting conventions separately; in each case finite grids and fixed complexity are chosen before the large-scale limit. A #emph[subpower] loss denotes a factor $M^(o \( 1 \))$, or $m^(o \( 1 \))$, in the base currently under discussion.

== 2 Geometric propagation and a calibrated path <sec:geo>

=== 2.1 Ellipse capacity and the propagation exponent <ellipse-capacity-and-the-propagation-exponent>

We parametrize lines by $P = \( U \, V \) in bb(R)^2 times bb(R)^2$, and write

$ X_v = V + v U . $

Throughout this section, two tests using the same ellipse may have independently chosen centers. Thus $U in E \, med V in E$ abbreviates $U in u + E \, med V in v + E$, with arbitrary $u \, v in bb(R)^2$; it does not require the two centers to coincide.

Fix $0 < kappa < 1 \/ 10$. For a centered ellipse $E$ with radii $L gt.eq w > 0$, define

$ W \( E \) = L^(1 + kappa) w^(1 - kappa) . $

We call $W \( E \)$ its capacity weight. Rectangles with the same semiaxes may replace ellipses in upper bounds, at the cost of an absolute constant. The same is true of dilations by bounded factors. In particular, a constant enlargement of a tested ellipse is covered by boundedly many tests at the original widths.

Let $M = 2^n$, with $n arrow.r oo$. A time test at depth $y$ uses the dyadic intervals of length $2^(- floor.l y n floor.r)$. For $T in \[ 0 \, 1 \)$, let $T_y = \[ T \]_y$ denote the left endpoint of its interval at this depth. Dyadic roundings change the scales below by bounded factors only.

#prodef([Definition 2.1.])[
  A #emph[sublaw] of a probability measure $mu$ is a finite measure $nu lt.eq mu$. Along a sequence with base $M arrow.r oo$, a sublaw has #emph[large mass] if
  $ nu \( upright("whole space") \) = M^(- o \( 1 \)) . $
  Normalizing such a sublaw changes every upper mass bound by at most a factor $M^(o \( 1 \))$. We use either its unnormalized masses or its normalized probabilities, recording this factor when necessary.
] <geo:large-sublaw>

All probability spaces may be taken to be standard Borel. Auxiliary labels are retained under restriction and pushforward; only the displayed spatial and time tests enter the mass bounds. At each finite stage, compact coordinate windows are discretized by finite dyadic grids. Orientations at widths $L \, w$ are discretized at spacing comparable to $w \/ L$. A translated ellipse of arbitrary orientation is covered by boundedly many constant enlargements of grid cells at these matched scales. Conversely, each grid cell is covered by boundedly many continuous tests. All assignments of heavy cells can therefore be made from finite lists.

Fix $s in \( 0 \, 1 \]$, and initially allow a positive error $epsilon.alt$ in the time distribution. There is a base label determining $P = \( U \, V \)$, such that, conditionally on this label, almost surely,

$ max_(I in cal(D)_j) Pr \( T in I divides upright("label") \) & lt.eq M^epsilon.alt 2^(- s j) \,\
\# { I in cal(D)_j : Pr \( T in I divides upright("label") \) > 0 } & lt.eq M^epsilon.alt 2^(s j) \, #h(2em) 0 lt.eq j lt.eq n \, quad "(2.1)" $ <eq:source-1>

where $cal(D)_j$ is the dyadic partition at depth $j$. Testing a sufficiently fine fixed grid of ratios $j \/ n$ is equivalent to testing every depth, with a corresponding arbitrarily small increase of $epsilon.alt$: interpolate the upper weight bound from the preceding grid depth and the support bound from the following one.

Suppose that $P$ remains in a bounded set, uniformly along the sequence, and that for a fixed finite $D gt.eq 1$,

$ Pr \( U in E \, med V in E \) lt.eq K W \( E \) \, #h(2em) M^(- D) lt.eq w lt.eq L lt.eq 1 . quad "(2.2)" $ <eq:source-2>

The constant $K$ may depend on the instance. For an exponent $q$, the propagation assertion is the existence of a large sublaw on which, simultaneously for all indicated times, centers, and ellipses,

$ Pr \( T_1 = v \, med U in E \, med X_v in M^(- 1) E \) lt.eq M^(- q + o \( 1 \)) K W \( E \) \, #h(2em) M^(- \( D - 1 \)) lt.eq w lt.eq L lt.eq 1 . quad "(2.3)" $ <eq:source-3>

Figure 1 depicts the input and terminal tests. The shared ellipse orientation imposes no independence condition on the law of the two spatial variables.

#figure(
  [#raw(block: true, lang: "latex", "\\begin{tikzpicture}[x=1cm,y=1cm,>=Stealth,\n  axes/.style={gray!65,thin},\n  capacityellipse/.style={draw=linkblue,fill=linkblue!8,thick}]\n  \\foreach \\x/\\name in {0/U,4.2/V,8.4/X_v} {\n    \\begin{scope}[shift={(\\x,0)}]\n      \\draw[axes,->] (-1.25,0)--(1.35,0);\n      \\draw[axes,->] (0,-.85)--(0,1.15);\n      \\node at (0,-1.15) {\\(\\name\\)-plane};\n    \\end{scope}\n  }\n  \\begin{scope}[shift={(.12,.20)},rotate=25]\n    \\draw[capacityellipse] (0,0) ellipse (1.00 and .37);\n    \\draw[linkblue,dashed] (-1,0)--(1,0);\n  \\end{scope}\n  \\begin{scope}[shift={(4.05,.26)},rotate=25]\n    \\draw[capacityellipse] (0,0) ellipse (1.00 and .37);\n    \\draw[linkblue,dashed] (-1,0)--(1,0);\n  \\end{scope}\n  \\begin{scope}[shift={(8.57,.21)},rotate=25]\n    \\draw[capacityellipse] (0,0) ellipse (.50 and .185);\n    \\draw[linkblue,dashed] (-.5,0)--(.5,0);\n  \\end{scope}\n  \\node at (.05,1.4) {\\(E+u_0\\)};\n  \\node at (4.15,1.4) {\\(E+v_0\\)};\n  \\node at (8.45,1.4) {\\(M^{-1}E+x_0\\)};\n  \\draw[decorate,decoration={brace,mirror,amplitude=4pt}]\n    (-1.1,-1.53)--(5.3,-1.53);\n  \\node at (2.1,-1.98) {initial test};\n  \\draw[->,thick] (5.8,.3)--(6.8,.3)\n    node[midway,above] {\\(V+vU\\)};\n\\end{tikzpicture}")],
  caption: [Figure 1: An elliptic capacity test uses the same shape and orientation in the two spatial coordinates, with independently chosen centers. The terminal test keeps the $U$-ellipse and contracts the position ellipse by $M^(- 1)$. The picture depicts testing sets, not a product assumption on the law; the displayed contraction is schematic. ],
) <fig:capacity-tests>

Let $q \( epsilon.alt \, D \)$ be the supremum of the exponents for which this assertion holds universally along sequences satisfying (2.1) and (2.2). Define

$ q_(*) = lim_(epsilon.alt arrow.b 0) inf_(1 lt.eq D < oo) q \( epsilon.alt \, D \) . $

The limit exists by monotonicity in the admissible time error. Constants in the coordinate bounds, or bounded changes in the coordinate ranges, are immaterial by covering and isotropic normalization.

#thm([Theorem 2.2.])[
  (Geometric propagation).  #emph[For $0 < s lt.eq 1$ and $0 < kappa < 1 \/ 10$, 
$ q_(*) gt.eq 1 + 2 s - 10 kappa . quad "(2.4)" $ <eq:source-4>

]
] <geo:main>

The estimate concerns arbitrary joint laws of $U \, V \, T$, with the base label determining $U \, V$. Both bounds in (2.1) are conditional on that label and hold at every dyadic depth. The capacity in (2.2) is one joint test, with independent centers and a shared ellipse shape. The conclusion allows a dominated sublaw; it need not hold for the original law. For example, if $U$ is uniform on a fixed disk, $V = 0$, and $T$ is independently uniform, a unit test in the first time bin has mass of order $M^(- 1)$. Restricting $T$ to $\[ 1 \/ 2 \, 1 \)$ removes this focusing event and gives the corresponding $M^(- 3) W \( E \)$ bound.

===== 2.1.1 Route through the geometric proof. <route-through-the-geometric-proof.>

We argue by failure of Theorem 5. The following four stages organize the argument.

+ In this section, heavy-box counts and angular exclusion reduce failure to a calibrated path of ellipse widths and reference axes. The initial complexity $D$ may increase as the time error decreases; the bounded-complexity reduction precedes the local limit.
+ Section 3 encodes that obstruction by finite sheared states. Regularization supplies hereditary support and weight bounds before entropy profiles and their tangents are formed.
+ Section 4 derives scalar and joint-coordinate rate inequalities from the planar incidence theorem, including the case of correlated time and axis parameters.
+ Section 5 excludes every possible aspect velocity by a backward comparison whose gain exceeds the calibrated rate.

The heavy ellipses and their calibrated path belong to this counterfactual failure construction. The universal conclusion is the retained-law estimate (2.3) at every strict exponent $q < q_(*)$.

=== 2.2 Sequence conventions and conditional time profiles <sequence-conventions-and-conditional-time-profiles>

We first make the order of limits precise. A statement valid for every sequence, with subpower retention and subpower losses, is uniform with arbitrarily small fixed power losses once the base is sufficiently large and the other parameters are fixed. Otherwise, selecting a violating instance at each of arbitrarily large bases would give a violating sequence. Conversely, the fixed-power statements yield subpower losses by a diagonal choice. This applies simultaneously to any fixed finite collection of restrictions or estimates. Passing to subsequences is permitted throughout.

For clarity, the recurring limit choices are summarized here. Each row fixes a finite problem before the underlying base is increased; the local proofs below give the quantitative choices.

table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Order of choices
]),
  table.cell(rowspan: 1, colspan: 1)[Failure sequence
], table.cell(rowspan: 1, colspan: 1)[Fix a positive failure margin, finite complexity, mesh, and list of restrictions; then increase the base.
],
  table.cell(rowspan: 1, colspan: 1)[Calibration
], table.cell(rowspan: 1, colspan: 1)[Fix the first-order scale and stretched window, then choose finite-stage errors negligible in $delta log M$, with $delta log M arrow.r oo$.
],
  table.cell(rowspan: 1, colspan: 1)[Tangent realization
], table.cell(rowspan: 1, colspan: 1)[Fix the tangent radius and finite physical cutoffs; make previous errors negligible in the new logarithmic unit before shrinking that radius.
],
  table.cell(rowspan: 1, colspan: 1)[Projection tests
], table.cell(rowspan: 1, colspan: 1)[Fix a positive output gap, then smaller input nonconcentration and density losses; finally let the block base tend to infinity.
],
  table.cell(rowspan: 1, colspan: 1)[Backward comparison
], table.cell(rowspan: 1, colspan: 1)[Fix the tangent problem and any large velocity; choose clipping and endpoint errors afterward.
],
)

In particular, for each $q < q_(*)$, the definition of $q_(*)$ gives one sufficiently small time-error threshold valid for every finite $D$. The sufficiently large base threshold may depend on that fixed $D$. We will justify the sequence-to-uniform use of this statement below and retain this distinction in the packet application.

The input bound immediately gives $q_(*) gt.eq 0$. Indeed, a terminal test in (2.3) implies $V = X_v - v U in c + O \( E \)$, since $0 lt.eq v < 1$, and hence its mass is at most a constant multiple of $K W \( E \)$. Suppose for contradiction that

$ q_(*) < 1 + 2 s - 10 kappa . $

All exponents under consideration are then bounded; in particular, they may be taken less than $4$.

Choose $epsilon.alt_i arrow.b 0$, finite complexities $D_i$, and exponents tending to $q_(*)$ from above, for which the universal assertion fails. For each fixed $i$, the complexity $D_i$ is fixed and $n arrow.r oo$. We distinguish errors $o_i \( 1 \)$, which tend to zero as $i arrow.r oo$, from $o_n \( 1 \)$, which tend to zero along the sequence with $i$ fixed.

We may choose these sequences with a fixed-power margin at each fixed $i$. More precisely, after leaving room above the relevant supremum, there are positive tolerances tending to zero with $i$ such that even a slightly weaker tested exponent cannot be obtained while retaining at least the corresponding fixed negative power of $M$. To see this, negate the uniform fixed-power formulation of the sequence assertion. If every fixed positive tolerance worked at every sufficiently large base, a diagonal would give the sequence assertion itself. Shrinking a tolerance preserves failure, so the tolerances can be chosen as small as needed. Consequently, restrictions retaining $M^(- o_n \( 1 \))$ mass and changes of $M^(o_n \( 1 \))$ in the bounds preserve the chosen failure. This also explains why a subsequence on which vanishing-loss conclusions hold cannot remain inside the selected failing sequence.

#thm([Lemma 2.3.])[
  (Reuse of the time profile).  #emph[Suppose a reference law satisfies (2.1) with error $epsilon.alt > 0$. Fix a finite collection of prefix depths. After any fixed finite succession of restrictions retaining $M^(- o_n \( 1 \))$ mass, one may remove a negligible part of the retained measure so that the following statements hold.]
  #emph[Conditionally on each surviving base label, the retained time law satisfies (2.1) with error $O \( epsilon.alt \)$. Conditionally on a surviving base label and a prefix at depth $j_0$, the descendant law has maximum weights and support counts of exponent $s$, with error $O \( epsilon.alt \)$ in the original $log M$ units. Further conditioning on parent cells determined by the base label and prefix does not change this conclusion.]
] <geo:time-conditioning>

#proof[
  All comparisons are made directly with the original reference law. For a fixed base label, let $p_I$ be the probability of a prefix $I in cal(D)_(j_0)$, and let $N_I \( j \)$ be its number of supported descendants at depth $j gt.eq j_0$. The hypotheses give
  $ max_I p_I lt.eq M^epsilon.alt 2^(- s j_0) \, #h(2em) sum_I N_I \( j \) lt.eq M^epsilon.alt 2^(s j) . $
  Thus, when the prefix is sampled according to its original law,
  $ sum_I p_I N_I \( j \) lt.eq M^(2 epsilon.alt) 2^(s \( j - j_0 \)) . $
  For a sufficiently large fixed constant $C$, Markov’s inequality allows the removal of prefixes for which
  $ N_I \( j \) > M^(C epsilon.alt) 2^(s \( j - j_0 \)) \, $
  at original mass at most $M^(- \( C - 2 \) epsilon.alt)$. Summing over $j lt.eq n$ remains power-small, since $n = M^(o_n \( 1 \))$.
  The prefixes for which
  $ p_I < 2^(- s j_0) M^(- C epsilon.alt) $
  have total original probability at most $M^(- \( C - 1 \) epsilon.alt)$, by the prefix support bound. First remove these prefixes and the support-count exceptions at every prescribed depth. Then, from the deepest prescribed depth to the shallowest, discard each label-prefix fiber whose current retained fraction, relative to its original mass, is less than $M^(- C epsilon.alt)$. Finally apply the same retained-fraction test to the base-label fibers. Each retained-fraction stage removes at most $M^(- C epsilon.alt)$ times the original total mass. A later stage deletes whole fibers at every previously checked depth, so the retained fraction in each surviving fiber keeps its lower bound. The finite union of these losses and the original-law exceptions is negligible compared with $M^(- o_n \( 1 \))$.
  Measured in the original conditional law given a surviving base label, the final retained mass of a surviving prefix is at least
  $ p_I M^(- C epsilon.alt) gt.eq 2^(- s j_0) M^(- 2 C epsilon.alt) . $
  Dividing the original descendant weight bound by this retained denominator therefore gives
  $ Pr \( T in J divides upright("retained label and prefix") \) lt.eq M^(O \( epsilon.alt \)) 2^(- s \( j - j_0 \)) $
  for a descendant $J$ at depth $j$. Its support count is bounded by the preceding Markov truncation. Parent cells determined by the label and prefix select entire such fibers. Finally, making every truncation against the reference law keeps the absolute constants from accumulating under successive restrictions; only a fixed finite union of power-small exceptional sets is removed. ◻
]

On a fixed interval of time-depth length $tau > 0$, the new base is $M^(tau + o_n \( 1 \))$, and the time error in its log units is $O \( epsilon.alt_i \/ tau \)$. Since $inf_D q \( epsilon.alt \, D \) arrow.r q_(*)$, the universal propagation estimate is therefore available on that interval with exponent $q_(*) - o_i \( 1 \)$. A sufficiently small time-error threshold works for every finite complexity at an exponent strictly below $q_(*)$. The sufficiently large base threshold may depend on the fixed complexity, which is all that is needed here.

When the estimate is applied in many parents, fixed-parameter uniformity supplies the same subpower relative retention and loss in all of them. Width complexities and dyadic base ratios that vary along a sequence, but remain bounded for fixed $i$, cause no difficulty: pass to convergent logarithmic ratios, or use a finite fine power net. Apply the estimate at a fixed complexity slightly larger than required. If this asks for input tests just below the available floor, round their widths up to that floor; the arbitrarily small slack changes the input constant by an arbitrarily small power only. No application uses a complexity escaping to infinity along an $n$-sequence with $i$ fixed.

#thm([Lemma 2.4.])[
  (Isolation of terminal widths).  #emph[The failing families may be chosen so that the terminal widths $L \, w$ are fixed in logarithmic units along each sequence, up to arbitrarily small prescribed rounding errors. The orientation and the two centers remain unrestricted. The input constant is still the original $K$, up to subpower factors, and the time profile retains error $O \( epsilon.alt_i \)$.]
] <geo:fixed-widths>

#proof[
  For each fixed $i$, choose a finite power net in the permitted width range, including its endpoints. Its step tends to zero as $i arrow.r oo$, and is small compared with the margin in the selected failure. Round both widths upward. This enlarges the test and increases $W$ by only the allowed small power.
  Seek the desired sublaw successively for each pair in this finite net, always testing against the original $K$. If all steps succeeded, their successive subpower restrictions would give (2.3) for every width, contradicting the selected failure. Some step therefore fails on a retained law. Successful steps need only proceed along a subsequence, and there are finitely many steps for fixed $i$. Lemma 6 preserves the time profile, and the fixed-power failure margin absorbs the finite net and normalization losses. ◻
]

=== 2.3 A hairbrush bound and angular uniqueness <a-hairbrush-bound-and-angular-uniqueness>

The time profile is now reusable after the stated trims, and the terminal widths can be isolated. We next count heavy boxes and control all their axes through each surviving point. The proof uses the intersection-counting mechanism of classical hairbrush arguments; see Wolff #cite(label("Wolff1995Kakeya")) and the discussion in #cite(label("TaoVargasVega1998")) arXiv version 1, Section 3.7. The joint ellipse estimate required here is proved in full below.

Here a #emph[particle] is an outcome of the full joint law, including any auxiliary labels. A #emph[lag] is a time depth $y in \[ 0 \, 1 \]$. For a possible value $v$ of $T_y$, independent centers $u \, x in bb(R)^2$, and a centered ellipse $E$, the corresponding box is the event

$ C_y \( v \; u \, x \; E \) = { T_y = v \, med U in u + E \, med X_v in x + M^(- y) E } . $

Its radii are those of $E$, measured in the variables $\( U \, M^y X_v \)$, and its mass includes the time-bin probability. Auxiliary labels do not enter the membership test. A source box is the time-free event ${ U in u + E \, med V in x + E }$.

#thm([Lemma 2.5.])[
  (Hairbrush estimate).  #emph[Let $mu$ be a subprobability law on the particles. Fix a lag and suppose that every box in a chosen time bin, with independently translated spatial tests of the same ellipse $F$, satisfies $mu \( C \) lt.eq H W \( F \)$. Fix radii $L gt.eq w > 0$, and put $A = H W \( E \)$, where $E$ has radii $L \, w$. Assume the cap is available at all radii between $w$ and $L$, including bounded dilations.]
  #emph[Let $C_0$ be a box of radii $L \, w$. Suppose each particle $z$ in a measurable set $S subset C_0$ belongs to an assigned box $C_z$ in the same bin, of the same radii, such that 
$ mu \( C_z \) gt.eq A M^(- e) \, #h(2em) theta lt.eq angle \( C_z \, C_0 \) lt.eq 2 theta \, #h(2em) theta gt.tilde w \/ L . $

 Angles are distances between unoriented long axes. At fixed polynomial scale complexity, $m = mu \( S \)$ satisfies 
$ m lt.eq M^(2 e + o \( 1 \)) H W \( E \) (frac(w, L theta))^(2 kappa) . quad "(2.5)" $ <eq:source-5>

 The same assertion holds for source boxes, with time omitted.]
] <geo:hairbrush>

#proof[
  Replace ellipses by comparable rectangles. Within the chosen bin, write $Z = \( Z^(\( 1 \)) \, Z^(\( 2 \)) \)$ for the two spatial variables; at lag $y$, these are $\( U \, M^y X_v \)$. Translations in the two components remain independent. Set
  $ eta = frac(w, L theta) . $
  The bounded-factor cases with $eta gt.tilde 1$ follow directly from $mu \( S \) lt.eq mu \( C_0 \) lt.tilde A$. We may therefore suppose $eta lt.tilde 1$.
  For $z \, z' in S$, let $d L$ be the larger longitudinal separation of $Z^(\( j \)) \( z \) \, Z^(\( j \)) \( z' \)$, measured in the axis of $C_0$. For $d gt.tilde eta$, the particles $z'$ at separation at most $d L$ lie in a product rectangle of radii $O \( d L \) \, O \( w \)$. Consequently their mass is at most
  $ A d^(1 + kappa) . $
  Suppose $d gt.double eta$ and $C_z ∩ C_(z') eq.not diameter$. Choose a component realizing this longitudinal separation. The transverse separation of its anchors in the axis of $C_0$ is $O \( w \)$. Projection onto a normal to the axis of $C_z$, using a common point of the two rectangles and their bounded lengths, gives
  $ d L theta lt.tilde w + L gamma \, #h(2em) gamma = angle \( C_z \, C_(z') \) . $
  Hence $gamma gt.tilde d theta$.
  In each component the intersection is contained in a rectangle with the axis of $C_z$ and radii
  $ O #h(-1em) (frac(w, d theta)) = O \( L eta \/ d \) \, #h(2em) O \( w \) . $
  The two component intersections use the same orientation, though their centers may differ. The assumed cap thus gives
  $ mu \( C_z ∩ C_(z') \) lt.tilde A \( eta \/ d \)^(1 + kappa) . $
  Every radius used lies between $w$ and $L$, up to bounded factors. This argument only uses that a box contains its anchor; the anchor need not be its center.
  For fixed $z$, the close pairs $d = O \( eta \)$ contribute at most $A^2 eta^(1 + kappa)$ to the overlap integral. Each remaining dyadic shell contributes at most
  $ #scale(x: 120%, y: 120%)[\(] A d^(1 + kappa) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] A \( eta \/ d \)^(1 + kappa) #scale(x: 120%, y: 120%)[\)] = A^2 eta^(1 + kappa) . $
  There are $O \( 1 + log \( L \/ w \) \)$ shells, so
  $ integral_S integral_S mu \( C_z ∩ C_(z') \) thin d mu \( z' \) thin d mu \( z \) lt.tilde m A^2 eta^(1 + kappa) #scale(x: 120%, y: 120%)[\(] 1 + log \( L \/ w \) #scale(x: 120%, y: 120%)[\)] . $
  The union of the $C_z$ lies in a product rectangle of radii $O \( L \) \, O \( theta L \)$, of mass at most $O \( A eta^(- \( 1 - kappa \)) \)$. For
  $ f \( p \) = integral_S upright(bold(1))_(C_z) \( p \) thin d mu \( z \) \, $
  heaviness and Fubini give
  $ integral f thin d mu gt.eq m A M^(- e) \, #h(2em) integral f^2 thin d mu = integral_S integral_S mu \( C_z ∩ C_(z') \) thin d mu \( z' \) thin d mu \( z \) . $
  Cauchy–Schwarz on the enclosing box yields
  $ m^2 A^2 M^(- 2 e) lt.tilde A eta^(- \( 1 - kappa \)) thin m A^2 eta^(1 + kappa) #scale(x: 120%, y: 120%)[\(] 1 + log \( L \/ w \) #scale(x: 120%, y: 120%)[\)] . $
  After cancellation this is
  $ m lt.tilde A M^(2 e) eta^(2 kappa) #scale(x: 120%, y: 120%)[\(] 1 + log \( L \/ w \) #scale(x: 120%, y: 120%)[\)] . $
  The logarithm is subpower at fixed polynomial complexity, proving (2.5). Nothing else in the proof uses time. ◻
]

#thm([Corollary 2.6.])[
  (Counting heavy boxes).  #emph[Suppose the hypotheses of Lemma 8 hold in every time bin with the same $H$. Fix radii $L \, w$, and use an orientation grid of spacing comparable to $rho = w \/ L$, with translated grids having bounded overlap at each orientation. Let $cal(H)$ be the family of boxes of mass at least $H W \( E \) M^(- e)$. Then, over all time bins, 
$ \# cal(H) lt.eq #scale(x: 120%, y: 120%)[\(] H W \( E \) #scale(x: 120%, y: 120%)[\)]^(- 1) M^(O_kappa \( e \) + o \( 1 \)) . quad "(2.6)" $ <eq:source-6>

]
] <geo:heavy-count>

#proof[
  Write $A = H W \( E \)$ and $c_kappa = 4 \/ kappa$. Choose $tau_M arrow.b 0$ sufficiently slowly that all bounded and logarithmic factors are $M^(o \( tau_M \))$ and $tau_M log M arrow.r oo$. Set
  $ Theta_0 = rho M^(c_kappa \( e + tau_M \)) . $
  From each $C in cal(H)$, remove the particles belonging to another heavy box whose axis differs from that of $C$ by more than $Theta_0$. Summing (2.5) over angular shells bounds the removed mass by
  $ A M^(2 e - 2 kappa c_kappa \( e + tau_M \) + o \( tau_M \)) = A M^(- 6 e - 8 tau_M + o \( tau_M \)) = o \( A M^(- e) \) . $
  If the cutoff exceeds the angular range there is nothing to remove. The remaining set $G_C subset C$ has mass at least $1 / 2 A M^(- e)$.
  A particle belonging to some $G_C$ can belong to heavy boxes only at orientations within $Theta_0$ of $C$. It therefore belongs to at most
  $ O \( 1 + Theta_0 \/ rho \) lt.eq M^(c_kappa \( e + tau_M \) + o \( tau_M \)) $
  grid boxes: there are this many possible orientations, bounded translated-grid overlap at each orientation, and only one time bin. Summing the masses of the $G_C$ and using total mass at most one gives
  $ 1 / 2 thin \# cal(H) thin A M^(- e) lt.eq M^(c_kappa \( e + tau_M \) + o \( tau_M \)) . $
  In particular,
  $ \# cal(H) lt.eq A^(- 1) M^(\( 1 + c_kappa \) e + c_kappa tau_M + o \( tau_M \)) \, $
  which proves (2.6). ◻
]

#thm([Corollary 2.7.])[
  (Pointwise angular exclusion).  #emph[Let $cal(H)$ be the family in Corollary 9. Suppose a large sublaw $nu lt.eq mu$ carries assigned boxes $C \( z \) in cal(H)$, with $z in C \( z \)$. Assume the cap is also available at all enlarged widths used below. After removing $o \( nu \( upright("whole space") \) \)$ mass, the following implication holds pointwise: 
$ z in M^d D \, quad D in cal(H) quad arrow.r.double quad angle \( C \( z \) \, D \) lt.eq w / L M^(C_kappa \( e + d \) + o \( 1 \)) . $

 Here $D$ is in the particle’s time bin, and dilation acts on each spatial rectangle about its own center. One retained set works simultaneously for the dyadic dilations in any fixed power range $d gt.eq 0$.]
] <geo:angular-exclusion>

#proof[
  Keep $A = H W \( E \)$, $rho = w \/ L$, $c_kappa = 4 \/ kappa$, and take
  $ C_kappa = frac(c_kappa + 10, 2 kappa) . $
  Write $nu \( upright("whole space") \) = M^(- r_M)$, with $r_M arrow.r 0$. Choose $tau_M arrow.b 0$ slowly enough that $r_M = o \( tau_M \)$, all counting and logarithmic error exponents are $o \( tau_M \)$, and $tau_M log M arrow.r oo$.
  Fix a dilation $Q = M^d$. Its baseline is
  $ A_Q = H W \( Q E \) = Q^2 A = M^(2 d) A . $
  Every enlarged heavy box has mass at least
  $ A M^(- e) = A_Q M^(- \( e + 2 d \)) . $
  For each $C in cal(H)$, consider its particles that belong to some $Q D$, $D in cal(H)$, at angle greater than
  $ Theta_d = rho M^(C_kappa \( e + d + tau_M \)) . $
  Since $C subset Q C$, apply Lemma 8 to the central box $Q C$, the tilted boxes $Q D$, baseline $A_Q$, and tolerance $e + 2 d$. Summing angular shells bounds this exceptional mass by
  $ A M^(2 e + 6 d - 2 kappa C_kappa \( e + d + tau_M \) + o \( tau_M \)) . $
  The application uses the caps between $Q w$ and $Q L$, with bounded dilations.
  Summing over the original heavy-box list, using the explicit count in the preceding proof, gives total exceptional mass at most
  $ & M^(\( 3 + c_kappa \) e + 6 d + c_kappa tau_M - 2 kappa C_kappa \( e + d + tau_M \) + o \( tau_M \))\
 & thin = M^(- 7 e - \( c_kappa + 4 \) d - 10 tau_M + o \( tau_M \)) . $
  The dyadic dilations in a fixed power range have $M^(o \( tau_M \))$ members after the choice of $tau_M$. Their union has exceptional mass
  $ M^(- 10 tau_M + o \( tau_M \)) = o \( M^(- r_M) \) . $
  Removing this union proves the pointwise implication; its remaining tolerance $C_kappa tau_M$ is $o \( 1 \)$. ◻
]

The heavy list and capacity bounds refer to the fixed prelaw. The retained set has the stronger pointwise exclusion property for every relevant high box. Later conditioning will use this property, rather than a bound only for a randomly selected pair of boxes.

=== 2.4 Reduction to bounded spatial complexity <reduction-to-bounded-spatial-complexity>

#thm([Lemma 2.8.])[
  (Bounded complexity).  #emph[In the contradiction families for Theorem 5, the complexities $D_i$ may be bounded by a constant depending only on $kappa$.]
] <geo:bounded-complexity>

#proof[
  Work at the fixed failing widths supplied by Lemma 7. Choose a fixed large integer $J$, depending only on $kappa$, with $2 kappa J > 30$, and put
  $ f = min \( L \, w M^J \) \, #h(2em) F = \( L \, f \) . $
  Here $F$ denotes the ellipse of those radii in the orientation that will be specified for each group.
  First suppose $L > w M^J$. Call a source box of widths $L \, w$ #emph[high] if its mass is at least
  $ K W \( E \) M^(- 10) . $
  Use boundedly enlarged grids so that every terminal test lies in a source test with these widths up to bounded factors: from $U in E \, med X_v in M^(- 1) E$ we obtain $V = X_v - v U in c + O \( E \)$.
  Consider the particles whose $P$ lies in two high source boxes at angular distance greater than $M^J w \/ L$. Inside any tested source box, at least one of those two boxes makes angle $gt.tilde M^J w \/ L$ with the test. Applying Lemma 8 at the source with $e = 10$, and summing angular shells, bounds this sublaw’s mass in the test by
  $ K W \( E \) M^(20 - 2 kappa J + o_n \( 1 \)) . $
  Our choice of $J$ makes this better than every failing exponent under consideration. The sublaw of particles in no high source box likewise has mass at most $K W \( E \) M^(- 10)$ in each source test. Each of these sublaws therefore satisfies the required terminal bounds. Neither can have large mass in the selected counterexample family. After their removal, a large sublaw remains, and all high source boxes through any one surviving $P$ have axes within $O \( M^J w \/ L \)$.
  Choose one such axis as a function of $P$, round it at spacing comparable to $f \/ L = w M^J \/ L$, and partition by the rounded direction and by translated $U \, V$ grid boxes of widths $F$ in that direction. This partition depends on $P$ alone. When $L lt.eq w M^J$, instead use isotropic $F = \( L \, L \)$, with no angular partition.
  Any terminal test that violates the pre-partition threshold supplies a high source box through all of its retained particles. In the eccentric case, their rounded directions must therefore lie within $O \( f \/ L \)$ of its direction. There are boundedly many such rounded directions. In either case, the terminal test meets boundedly many translated $U \, V$ group cells at each allowed direction, because it is contained in a source $O \( E \) \, O \( E \)$ test. Thus each violating terminal test meets boundedly many groups. Tests already below the threshold remain below it under further restrictions.
  We now normalize a group. Let $A_F$ be the linear map taking the unit disk to $F$, and subtract the two group centers before applying $A_F^(- 1)$. For a nonsingular linear map $A$, extend the notation by $W \( A \) = W \( A B_2 \)$. The singular value formula is
  $ W \( A \) = \| det A \|^(1 - kappa) parallel A parallel^(2 kappa) \, $
  and consequently
  $ W \( A B \) lt.eq W \( A \) W \( B \) . quad "(2.7)" $ <geo:submultiplicativity>
  If the group has mass $m_G$, its normalized input cap is thus at most
  $ frac(K W \( F \), m_G) . $
  This bound holds for every orientation of the normalized test.
  For a previously violating terminal test at the selected widths that meets the group, its target ellipse $E$ makes angle $O \( f \/ L \)$ with the group axes, by the preceding partition argument. If $A_E$ maps the unit disk to that ellipse, then
  $ parallel A_F^(- 1) A_E parallel asymp 1 \, #h(2em) \| det \( A_F^(- 1) A_E \) \| = w \/ f . $
  Its pullback therefore has radii comparable to $1 \, w \/ f$. Moreover,
  $ W \( F \) W \( A_F^(- 1) E \) lt.tilde L^(1 + kappa) f^(1 - kappa) \( w \/ f \)^(1 - kappa) = W \( E \) . $
  The input floor needed for this target is a constant multiple of $M^(- 1) w \/ f$. Under $A_F$, the smallest radius of any such normalized input ellipse is at least
  $ f \( M^(- 1) w \/ f \) = M^(- 1) w gt.eq M^(- D_i) . $
  The original input cap is therefore available. The normalized complexity is
  $ 1 + log_M \( f \/ w \) lt.eq J + 1 . $
  Bounded coordinate normalizations and endpoint roundings can be handled with arbitrarily small positive slack in complexity and the corresponding arbitrarily small loss in the input constant, as described above. For all sufficiently large indices, complexity at most $J + 3$ suffices.
  If the limiting worst exponent for complexities bounded by $J + 3$ were strictly greater than $q_(*)$, its universal bound would improve all these normalized groups beyond the selected failing threshold. Fixed-parameter uniformity supplies a large sublaw in every group with the same subpower losses. On multiplying back by group masses, the factors $m_G^(- 1)$ cancel, and the preceding inequality for the capacity weights returns the original $K W \( E \)$. Recombining uses only boundedly many groups per previously violating test, while all other tests already obey the threshold. The recombined sublaw has large mass, a contradiction.
  The limiting worst exponent at bounded complexities is therefore $q_(*)$, and counterexample families may be chosen there. Increasing the fixed bound if necessary proves the lemma. ◻
]

#thm([Lemma 2.9.])[
  (Extension of the width range).  #emph[After Lemma 11, one may extend the input cap to any prescribed larger bounded power range of widths, preserve failure at the selected terminal widths, and place those widths a fixed power below the upper boundary of the permitted range.]
] <geo:range-extension>

#proof[
  Put $rho = M^(- D_i)$. Add independent uniform disk noises of radius $rho$ to $U$ and $V$, and append those noises to the base label. Their independence of the original law preserves the conditional time profile.
  For an ellipse $E$ of radii $L \, w$, let $E^(+)$ have the same axes and radii $max \( L \, rho \) \, max \( w \, rho \)$. For one noise variable, the probability of entering a translated $E$, given the original point, is at most a constant times $\| E \| \/ \| E^(+) \|$, and vanishes unless that point lies in a bounded enlargement of the corresponding translate of $E^(+)$. Independence of the two noises yields
  $ Pr \( U_(upright("sm")) in E \, med V_(upright("sm")) in E \) lt.tilde K W \( E^(+) \) (frac(\| E \|, \| E^(+) \|))^2 lt.tilde K W \( E \) . $
  The final inequality follows because contracting a semiaxis gets exponent $2$ from dilution, whereas its exponent in $W$ is either $1 + kappa$ or $1 - kappa$, both less than $2$. This extends the cap to smaller widths. Bounded support extends it to larger widths by clipping the long radius at a fixed support bound and covering by boundedly many tests. If both radii exceed that bound, the total-mass bound suffices: a fixed covering of the original bounded support by unit source boxes already gives $K gt.tilde 1$, with a constant depending only on that support bound.
  Failure persists under smoothing. A good sublaw of the smoothed joint law pushes back to a sublaw of the original law with the same mass. The perturbations of $U$ and $X_v$ are $O \( rho \)$, and the smallest selected terminal position radius is $M^(- 1) w gt.eq rho$. Thus every original terminal test maps into boundedly enlarged smoothed tests, and their good estimates would give the original ones.
  Finally, an isotropic power shrinking of both spatial variables puts the relevant widths a fixed power below the upper endpoint. If the shrinking factor is $B^(- 1)$, the transformed constant is $K B^2$, while the ellipse weight becomes $W \( E \/ B \) = B^(- 2) W \( E \)$; their product, and therefore the failing comparison, is unchanged. After the bounded-complexity reduction, all required ranges and shrinking powers remain bounded. ◻
]

From now on we use these extended ranges for universal upper bounds and angular exclusions. Factoring through width bands will use only the original available range, shifted by the isotropic normalization. This distinction avoids requiring an unavailable input cap at a band endpoint.

We have reduced the spatial complexity without changing the retained-law obstruction. The backward construction uses two complementary facts at each selected epoch: a simultaneous cap bounds all allowed tests, while the finite heavy-box list prevents a large later sublaw from improving the selected-width bound.

=== 2.5 Backward construction of heavy ellipses <backward-construction-of-heavy-ellipses>

Fix a finite dyadic mesh of positive lags $y lt.eq 1$, including $1$. At each lag, apply the universal estimate with exponent $q_(*) - o_i \( 1 \)$, propagating from depth $0$ to depth $y$. Lemma 6 and fixed-parameter uniformity permit these finitely many applications successively. We obtain a large normalized #emph[prelaw], still carrying the selected failure, with simultaneous bounds

$ Pr \( T_y = v \, med U in E \, med X_v in M^(- y) E \) lt.eq K W \( E \) M^(- q_(*) y + o_i \( 1 \) + o_n \( 1 \)) quad "(2.8)" $ <geo:prelaw-caps>

throughout the required extended width ranges. Dyadic roundings are understood up to bounded factors. For each fixed mesh, all displayed $o_i \( 1 \)$ errors tend to zero before the mesh is subsequently refined.

At $y = 1$, call a prelaw box at the selected failing widths high if its mass is at least

$ K W \( E \) M^(- q_(*) y - e_y) \, $

where $e_y = o_i \( 1 \) > 0$ is chosen to dominate the upper-cap errors and the small margin in the selected failure. Particles lying in no such box already satisfy a stronger terminal cap, so they cannot carry large mass. Assign a high box to each remaining particle.

Corollary 9 bounds the resulting list by

$ #scale(x: 120%, y: 120%)[\(] K W \( E \) M^(- q_(*) y) #scale(x: 120%, y: 120%)[\)]^(- 1) M^(O_kappa \( e_y \) + o_n \( 1 \)) . $

This creates a hereditary obstruction: any later sublaw carried by the assigned list and satisfying a cap improved by a sufficiently larger multiple of $e_y$ has power-small total mass, simply by summing over the list. Thus a later large sublaw cannot make that improvement. Importantly, the boxes are high and counted in the prelaw; no later restriction changes the validity of their covering list.

#thm([Lemma 2.10.])[
  (Backward width band).  #emph[Suppose that at a mesh epoch $y$ the current large sublaw has assigned boxes of widths $L \, w$ and the preceding hereditary obstruction. Let $y' < y$ be the previous mesh epoch. After a further large restriction, the particles have assigned high prelaw boxes at $y'$, with a common pair of dyadic widths both belonging to 
$ #scale(x: 120%, y: 120%)[\[] w M^(- \( y - y' \)) \, L #scale(x: 120%, y: 120%)[\]] \, quad "(2.9)" $ <eq:source-7>

 up to bounded endpoint roundings. The tolerance $e_(y')$ may be chosen to tend to zero sufficiently slowly relative to $e_y$ and the propagation errors.]
] <geo:width-band>

#proof[
  Call a prelaw box at epoch $y'$, with both widths in (2.9), high when its mass is at least
  $ K W \( F \) M^(- q_(*) y' - e_(y')) . $
  Suppose a large sublaw consists of particles belonging to none of these high boxes. Every test in this band then has the improved cap with factor $M^(- e_(y'))$: a test above that threshold would itself be a high prelaw box containing those particles. The finite grids and bounded coverings make this statement simultaneous over all centers, orientations, and band widths.
  Partition this contrary sublaw by the prefix $v' = T_(y')$ and by isotropic parent cells of widths $L$ for $U$ and $h' L$ for $X_(v')$, where
  $ h' = 2^(- floor.l y' n floor.r) . $
  Let a parent have centers $u_Q \, x_Q$ and mass $m_Q$. Normalize it by
  $ U' = frac(U - u_Q, L) \, #h(2em) V' = frac(X_(v') - x_Q, h' L) \, #h(2em) S = frac(T - v', h') . $
  The residual time $S$ lies in $\[ 0 \, 1 \)$, and its terminal partition has base
  $ M_(upright("res")) = 2^(floor.l y n floor.r - floor.l y' n floor.r) = M^(y - y' + o_n \( 1 \)) . $
  If $s_0$ is the left endpoint of a tested residual interval of length $M_(upright("res"))^(- 1)$, then on that event $v = v' + h' s_0 = T_y$, and
  $ V' + s_0 U' = frac(X_v - x_Q - \( v - v' \) u_Q, h' L) . $
  Both translations are fixed by the parent and this residual prefix. Moreover, $h' \/ M_(upright("res")) = 2^(- floor.l y n floor.r) asymp M^(- y)$, so the residual terminal position scale agrees with the original one, up to the declared dyadic rounding.
  A normalized terminal test has ellipse widths $1 \, w \/ L$, so the smallest input width required for its propagation is a constant multiple of
  $ M_(upright("res"))^(- 1) w \/ L . $
  In original units this is exactly the lower endpoint $w M^(- \( y - y' \))$ of (2.9), up to a bounded factor. The band cap hence supplies the full normalized input bound, with constant
  $ frac(K L^2 M^(- q_(*) y' - e_(y')), m_Q) $
  up to subpower factors, because $W \( L F \) = L^2 W \( F \)$. The parent time profile is supplied by Lemma 6. Its complexity is bounded for the fixed mesh and fixed $i$.
  Apply universal propagation on the residual interval. Multiplication by the original parent mass cancels $m_Q^(- 1)$; multiplication by $W \( E \/ L \)$ cancels the factor $L^2$. Thus the resulting sublaw in this parent satisfies the original terminal test with bound
  $ K W \( E \) M^(- q_(*) y - e_(y') + o_i \( 1 \) + o_n \( 1 \)) . $
  The relative retained masses and errors may be taken uniformly in the parents.
  Recombination costs only a bounded factor. A terminal bin determines its prefix, and
  $ X_(v') = X_v + \( v' - v \) U \, #h(2em) \| v' - v \| lt.tilde M^(- y') . $
  As $U$ varies in a terminal ellipse of long radius $L$, the rebased position varies by $O \( M^(- y') L \)$. The terminal cell consequently meets boundedly many of the isotropic parent cells in both variables.
  Choosing $e_(y')$ larger than the relevant multiples of $e_y$ and the propagation errors contradicts the hereditary obstruction at $y$. The contrary particles cannot have large mass. We may assign high boxes to the remaining large sublaw and select a common dyadic pair of widths. The number of such pairs is subpower, so this selection retains large mass. For a fixed finite mesh the tolerances can be chosen in this backward order while all still tend to zero. Bounded rounding of the band endpoints contributes a vanishing error in logarithmic units. ◻
]

Iterating Lemma 13 backward gives assigned heavy ellipses at every epoch of the mesh. The same list-count obstruction is inherited at each newly assigned epoch, so the induction can continue. All restrictions still compare directly to the prelaw for spatial caps and to the reference law for the conditional time profile.

=== 2.6 Width compactness and first-order calibration <width-compactness-and-first-order-calibration>

Write the selected radii at epoch $y$ as

$ L \( y \) = M^(- x \( y \)) \, #h(2em) w \( y \) = M^(- x \( y \) - d \( y \)) \, #h(2em) d \( y \) gt.eq 0 \, $

and write $"axis"_y \( z \)$ for a particle’s assigned long axis.

The band relation implies, for successive $y' < y$,

$ x \( y' \) gt.eq x \( y \) \, #h(2em) x \( y' \) + d \( y' \) + y' lt.eq x \( y \) + d \( y \) + y \, $

up to the vanishing rounding errors. The width depths remain in a bounded range by Lemma 11 and Lemma 12.

Choose successively finer dyadic meshes, with refinement slow enough that the accumulated errors tend to zero. On each finite mesh first take sufficiently large $i$, then sufficiently large $n$. Compactness for the two monotone functions, or a diagonal argument on dyadic rationals, gives limiting functions of bounded variation, still denoted $x \, d$, such that

$ x med upright("is nonincreasing") \, #h(2em) x + d + y med upright("is nondecreasing") . $

The finite-stage depths converge at continuity points. The two bounded-variation functions have ordinary derivatives almost everywhere; we use the monotone and bounded-variation differentiation theorems in #cite(label("Tao2011Measure")) Theorem 1.6.25 and Corollary 1.6.35. This differentiability concerns the limiting path. The finite paths will approximate its first-order window by the separate choices in Lemma 15.

#thm([Lemma 2.11.])[
  (Stability of neighboring axes).  #emph[The large sublaws may be chosen so that neighboring mesh epochs satisfy 
$ angle #scale(x: 120%, y: 120%)[\(] "axis"_y \( z \) \, "axis"_(y') \( z \) #scale(x: 120%, y: 120%)[\)] & lt.eq M^(- d \( y \) + C_kappa Delta + o \( 1 \)) \,\
Delta & = \| y' - y \| + \| x \( y' \) - x \( y \) \|\
 & thin + \| \( x + d \) \( y' \) - \( x + d \) \( y \) \| . quad "(2.10)" $ <eq:source-8>

 They also satisfy the pointwise single-epoch exclusions of Corollary 10, including the allowed dilations. These assertions are needed only when $Delta$ is small.]
] <geo:axis-stability>

#proof[
  Let $mu$ be the prelaw and $y' < y$. Put
  $ h & = y - y' \, #h(2em) a_0 = \| x \( y \) - x \( y' \) \| \,\
b_0 & = \| \( x + d \) \( y \) - \( x + d \) \( y' \) \| \,\
B_0 & = \( 1 + kappa \) a_0 + \( 1 - kappa \) b_0 . $
  A later box has a single earlier prefix $v'$, and
  $ M^(y') X_(v') = M^(- h) M^y X_v + M^(y') \( v' - v \) U . $
  The last coefficient is bounded, so its particles fit an earlier-bin box with the same axis and the later widths, up to bounded factors.
  Let $F$ have radii $L_F = max \( L \( y \) \, L \( y' \) \)$ and $w_F = max \( w \( y \) \, w \( y' \) \)$. Enlarge the transported box and the earlier assigned box along their own axes to these common widths. For $j in { y \, y' }$, let $E_j$ have radii $L \( j \) \, w \( j \)$, and set
  $ A_j = K W \( E_j \) M^(- q_(*) j) \, #h(2em) A_F = K W \( F \) M^(- q_(*) y') . $
  The capacity ratios and the later box’s original heaviness give, up to the existing vanishing errors,
  $ A_F / A_(y') lt.eq M^(B_0) \, #h(2em) mu \( upright("transported later box") \) gt.eq A_F M^(- e_y - q_(*) h - B_0) \, #h(2em) w_F / L_F lt.eq M^(- d \( y \) + b_0) . $
  The extended width range supplies the caps at these common widths and at the intermediate widths required by Lemma 8.
  Apply that lemma inside each enlarged earlier box, assigning to each exceptional particle its transported later box. Use angular cutoff $M^(- d \( y \) + C_kappa Delta + sigma)$, where $sigma > 0$ will tend to zero, and sum the angular shells. Sum next over the #emph[original] earlier assigned list, whose count is at most $A_(y')^(- 1) M^(\( 1 + 4 \/ kappa \) e_(y') + o \( 1 \))$ by the proof of Corollary 9. The factor $A_F$ in the hairbrush bound cancels this list baseline up to $A_F \/ A_(y') lt.eq M^(B_0)$. Thus the total exceptional mass is at most
  $ M^(3 B_0 + 2 q_(*) h + 2 kappa b_0 + \( 1 + 4 \/ kappa \) e_(y') + 2 e_y - 2 kappa C_kappa Delta - 2 kappa sigma + o \( 1 \)) . $
  Since $B_0 \, h \, b_0 = O \( Delta \)$, a sufficiently large $C_kappa$ absorbs their contributions. Write the current retained mass as $M^(- r_M)$, with $r_M = o_n \( 1 \)$. At each fixed mesh, choose $sigma = sigma_i arrow.b 0$ slowly enough that $e_y \, e_(y')$ and all $o_i \( 1 \)$ errors are $o \( sigma_i \)$. With $i$ fixed, take $n$ sufficiently large that $r_M$, the $o_n \( 1 \)$ errors, and logarithmic counting losses are negligible compared with $sigma_i$, while $sigma_i log M arrow.r oo$. The exceptional mass is then $o \( M^(- r_M) \)$, as required.
  Perform these removals for each neighboring pair and apply Corollary 10 at each epoch, including its dyadic dilation grid. At each fixed mesh the number of requirements is subpower. Choose the vanishing margins also to dominate the logarithm of this number divided by $log M$; the union of the exceptional sets still has negligible relative mass. ◻
]

#thm([Lemma 2.12.])[
  (Calibrated widths and a reference axis).  #emph[Let $y_0 in \( 0 \, 1 \)$ be a point of ordinary differentiability of both limiting width depths, and put 
$ x_0 = x \( y_0 \) \, #h(2em) d_0 = d \( y_0 \) \, #h(2em) a = - x' \( y_0 \) \, #h(2em) b = - \( x + d \)' \( y_0 \) \, #h(2em) lambda = a - b . $

 Then $a gt.eq 0$, $b lt.eq 1$, and $lambda eq.not 0$ implies $d_0 > 0$.]
  #emph[There are thicknesses $delta arrow.b 0$, stretches $H_delta arrow.t oo$, and finite-stage families whose local mesh epochs $y = y_0 + delta v$, $\| v \| lt.eq H_delta$, satisfy uniformly 
$ x \( y \) & = x_0 - a delta v + o \( delta \) \,\
x \( y \) + d \( y \) & = x_0 + d_0 - b delta v + o \( delta \) . quad "(2.11)" $ <geo:affine-widths>

 Their neighboring increments in (2.10) have $Delta = o \( delta \)$. All cap and list errors are $o \( delta \)$, the mesh spacing is $o \( delta \)$, and $log n \/ n = o \( delta \)$, while $delta log M arrow.r oo$.]
  #emph[For each particle, choose as reference the assigned axis at the end of the stretched interval having the deeper affine aspect. Then 
$ angle #scale(x: 120%, y: 120%)[\(] "axis"_(upright("ref")) \( z \) \, "axis"_(y_0 + delta v) \( z \) #scale(x: 120%, y: 120%)[\)] lt.eq M^(- d_0 - delta lambda v + o \( delta \)) quad "(2.12)" $ <geo:reference-axis>

 uniformly on the local mesh. If $lambda = 0$, any one local epoch may be used as reference. When $d_0 > 0$, a further constant-mass restriction permits the reference directions to be represented by $\( 1 \, R^compose \)$, with $R^compose$ uniformly bounded.]
] <geo:calibration>

#proof[
  The two monotonicities give $a gt.eq 0$ and $b lt.eq 1$. Also $d' = lambda$. Since $d gt.eq 0$, a differentiable interior point with $d_0 = 0$ is a local minimum and has derivative zero. This proves the assertion when $lambda eq.not 0$.
  Differentiability gives a common modulus $omega \( h \) arrow.r 0$ for the two depth functions, with affine approximation error at most $\| h \| omega \( \| h \| \)$. Choose $H_delta arrow.r oo$ so slowly that $delta H_delta arrow.r 0$ and
  $ H_delta omega \( delta H_delta \) arrow.r 0 . $
  The errors are then $o \( delta \)$ uniformly for $\| h \| lt.eq delta H_delta$.
  To transfer this conclusion to the finite-stage families, first fix $delta$ and a finite accuracy grid of continuity points. Convergence at these points, together with the monotonicity of $x$ and $x + d + y$, traps intermediate width values between nearby ones. Next take sufficiently advanced meshes, sufficiently large $i$, and sufficiently large $n$. A diagonal choice gives (2.11), makes every cap, list, and rounding error $o \( delta \)$, and makes the neighboring depth increments $o \( delta \)$. For the angular bounds, first fix $delta$ and prescribe a margin $o \( delta \)$. Choose the mesh and $i$ so that $sigma_i$ lies below that margin and every $e_y$ and outer error is $o \( sigma_i \)$; then choose $n$ so that $r_M$, the finite-base errors, and $log n \/ n$ are $o \( sigma_i \)$. Choose the single-epoch angular-exclusion margins with the same hierarchy. We may also impose $log n \/ n = o \( delta \)$, $delta log M arrow.r oo$, and a number of epochs subpower in $M^delta$.
  If $lambda > 0$, use the latest local epoch as reference; if $lambda < 0$, use the earliest. Along the chain from a given epoch to that reference, every intermediate aspect depth is at least $d_0 + delta lambda v - o \( delta \)$, by (2.11). Summing (2.10) along this chain gives (2.12): the worst angular error determines the logarithmic scale, and the number of links costs $M^(o \( delta \))$. For $lambda = 0$, all aspect depths are $d_0 + o \( delta \)$, so the same argument works with any reference epoch.
  Finally cover the space of unoriented directions by finitely many sectors. On one sector a large constant fraction of the law remains; after a fixed rotation, its slopes are uniformly bounded. This gives the stated representation of the reference axis. ◻
]

#thm([Corollary 2.13.])[
  (Pointwise axis prediction).  #emph[In the families of Lemma 15, two retained particles with the same $P = \( U \, V \)$ and the same time prefix at a local epoch have reference axes agreeing to that epoch’s aspect precision, up to a factor $M^(o \( delta \))$. In a bounded-slope sector, the number of possible reference-slope bins at depth $d_0 + delta lambda v$, given the base label and the time prefix at $y_0 + delta v$, is at most $M^(o \( delta \))$.]
] <geo:axis-prediction>

#proof[
  The two particles have exactly the same displayed point $\( U \, M^y X_(T_y) \)$ at the epoch in question. Each therefore lies in the other’s assigned high prelaw box. The pointwise exclusion of Corollary 10 bounds the distance between their assigned axes by the aspect ratio times $M^(o \( delta \))$. Equation (2.12) transfers the same bound to their reference axes. Angle and slope are comparable in the fixed sector.
  This is a pointwise membership argument against all high prelaw boxes. It does not require the two particles to carry the same auxiliary label, or their coincidence to have positive pair probability. Since the base label determines $P$, the asserted conditional bin count follows. ◻
]

The geometric reduction supplies a first-order width path and a reference axis with subpower error in the local logarithmic unit $delta log M$. The exact line and time prefix predict that axis at the aspect precision of each local epoch. The capacity bounds, heavy-box lists, and pointwise angular exclusions remain available after any further restriction of relative mass $exp \( - o \( delta log M \) \)$; normalization then costs $exp \( o \( delta log M \) \)$. For each fixed finite list of later restrictions whose relative masses are subpower with $delta$ fixed, choose the sufficiently large finite stage before decreasing $delta$, so their normalization losses are negligible in this local unit. The next section records these properties in finite measured states before passing to entropy limits.

== 3 Entropy profiles and their tangents <sec:entropy>

We retain the calibrated path constructed in Section 2. At its differentiability point $y_0$, write

$ x_0 = x \( y_0 \) \, #h(2em) d_0 = d \( y_0 \) \, #h(2em) a = - x' \( y_0 \) \, #h(2em) b = - \( x + d \)' \( y_0 \) \, #h(2em) lambda = a - b . $

Thus $a gt.eq 0$, $b lt.eq 1$, and the path widths, on the scale $y = y_0 + delta v$, have depths $x_0 - delta a v + o \( delta \)$ and $x_0 + d_0 - delta b v + o \( delta \)$. The first-order logarithmic unit is

$ L_log = log cal(M) = delta log M arrow.r oo . $

All the errors from the path construction are $o \( L_log \)$ in logarithmic units. The stretched interval in Lemma 15 contains every fixed bounded interval of offsets in the limit. In particular, choosing an earlier or later #emph[fixed] offset will not leave the available path.

The task in this section is to preserve the cap, heavy-list, and axis-prediction information in finite conditional laws. The profile rules used later come from those laws and their hereditary regularization.

We use discrete Shannon entropy, denoted by $"H"$, with natural logarithms; see Shannon #cite(label("Shannon1948")). The standard chain rule, conditioning, and submodularity rules are collected, for example, in #cite(label("Tao2010Entropy")) arXiv:0906.4387v5, Appendix A. An expression such as $"H" \( Z divides cal(B) \)$ is a conditional entropy; the base label $cal(B)$ need not be discrete. It determines $P = \( U \, V \)$. Every measured variable below is discretized, and its range at a finite stage has at most $exp \( O \( log M \) \)$ elements.

=== 3.1 Admissible sheared states <admissible-sheared-states>

Suppose first that $lambda eq.not 0$, so $d_0 > 0$. Let $R^compose$ be the reference slope chosen for each particle and used throughout the calibrated local epochs in Lemma 15, in a fixed bounded slope chart. For offsets $z = \( C \, B \, D \, A \, Y \, R \)$, put $t = T_(y_0 + delta Y)$ and $r = \[ R^compose \]_(d_0 + delta R)$. The state $Z \( z \)$ is the ordered tuple of bins of the following measured coordinates, at the corresponding absolute depths:

$ upright("offset") & upright("measured coordinate") & upright("absolute depth")\
C & U_1 & x_0 + delta C\
B & U_2 - r U_1 & x_0 + d_0 + delta B\
D & \( X_t \)_1 & x_0 + y_0 + delta D\
A & \( X_t \)_2 - r \( X_t \)_1 & x_0 + y_0 + d_0 + delta A\
Y & t & y_0 + delta Y\
R & r & d_0 + delta R quad "(3.1)" $ <eq:source-9>

The notation for a depth includes the dyadic rounding convention of Section 2. The domain of admissible offsets is the closed convex set

$ Omega = { B lt.eq C + R \, quad D lt.eq C + Y \, quad A lt.eq B + Y \, quad A lt.eq D + R } . quad "(3.2)" $ <eq:source-10>

Full alignment means equality in all four constraints. It can be parametrized by $\( C \, Y \, R \)$, with $B = C + R$, $D = C + Y$, and $A = C + Y + R$.

We write $z lt.eq z'$ when every offset of $z$ is at most the corresponding offset of $z'$. The meet $z and z'$ and join $z or z'$ are their coordinatewise minimum and maximum. A comparison rectangle has corners $z and z'$, $z$, $z'$, and $z or z'$; all four must belong to $Omega$.

#thm([Lemma 3.1.])[
  (Finite-state comparison).  #emph[On any fixed bounded subset of $Omega$, comparable states are nested up to bounded ambiguity. A refinement costs at most the logarithm of the product of its scalar resolution ratios, up to an additive constant. For a coordinate rectangle whose four corners belong to $Omega$, the two side states together determine the upper state up to bounded ambiguity, and each determines the bottom state up to bounded ambiguity. Consequently their entropies satisfy monotonicity, the scalar-coordinate Lipschitz bounds, and submodularity, with additive bounded errors.]
  #emph[If only the parameter cutoffs increase, the entropy increment is at least the corresponding parameter entropy increment conditional on $cal(B)$, again up to a bounded error.]
] <ent:finite-states>

#proof[
  Write the spatial entries in the order of (3.1) as $\( x \, h \, z \, w \)$. Changing the truncated parameters by $\( Delta t \, Delta r \)$ gives the exact update
  $ \( x \, h \, z \, w \) mapsto #scale(x: 120%, y: 120%)[\(] x \, h - Delta r thin x \, z + Delta t thin x \, w + Delta t thin h - Delta r thin z - Delta t Delta r thin x #scale(x: 120%, y: 120%)[\)] . quad "(3.3)" $ <ent:shear-update>
  For component widths $beta_x \, beta_h \, beta_z \, beta_w$ and parameter widths $beta_t \, beta_r$, the errors in this update at the starting component resolutions are bounded precisely when
  $ beta_x beta_r lt.tilde beta_h \, #h(2em) beta_x beta_t lt.tilde beta_z \, #h(2em) beta_t beta_h lt.tilde beta_w \, #h(2em) beta_r beta_z lt.tilde beta_w . $
  These are (3.2), including the absolute background depths. They also bound the doubly sheared error, since $beta_t beta_r beta_x lt.tilde beta_t beta_h lt.tilde beta_w$. The shifts of bin centers are known from the parameter labels and can be subtracted exactly. Only the within-bin errors require these inequalities; large absolute center coordinates cause no additional loss.
  A finer state supplies finer parameter bins and finer spatial measurements. Applying (3.3) recovers a coarser state with a bounded number of possible bin labels. Conversely, inside a coarse state, each newly tested scalar coordinate and each parameter has at most a constant times its resolution ratio many refinements. This proves the first assertions.
  For a coordinate rectangle, the side states supply the finer pair of parameter labels. Each finest spatial component is already measured by at least one side. Update that side to the finer parameter pair at its own component accuracy, using the inequalities valid at that side. This recovers the upper state. The same update proves that either side recovers the bottom state. Applying the usual entropy submodularity inequality to the two side labels proves the asserted inequality with an additive bounded error.
  Finally let $Q_0 \, Q_1$ be the coarse and fine parameter pairs in a parameter-only refinement, and let $Z_0 \, Z_1$ be its states. The nesting just proved gives
  $ "H" \( Z_1 \) - "H" \( Z_0 \) & gt.eq "H" \( Q_1 divides Z_0 \) - O \( 1 \)\
 & gt.eq "H" \( Q_1 divides Z_0 \, cal(B) \) - O \( 1 \)\
 & = "H" \( Q_1 divides Q_0 \, cal(B) \) - O \( 1 \) . $
  For the last equality, $Z_0$ is determined by $cal(B)$ and $Q_0$, whereas $Z_0$ includes $Q_0$. No independence between the two parameters, or between either parameter and $cal(B)$, is used. ◻
]

=== 3.2 Regularization before taking a profile <regularization-before-taking-a-profile>

Entropy values alone do not give the probability bounds needed in a projection test. We first control finite support sizes and maximal cell weights uniformly under the restrictions that follow; only then do we pass to an entropy profile. A subpower restriction here means a restriction of relative mass $exp \( - o \( L_log \) \)$.

#thm([Lemma 3.2.])[
  (Hereditary regularization).  #emph[For any fixed finite family of states, their joint labels, and conditional parameter labels given $cal(B)$, one may restrict to a subpower-density law with the following properties. At every unconditional state of absolute entropy $h$, 
$ \# "supp" Z lt.eq exp #scale(x: 120%, y: 120%)[\(] h + o \( L_log \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) max_z Pr \( Z = z \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - h + o \( L_log \) #scale(x: 120%, y: 120%)[\)] . quad "(3.4)" $ <ent:absolute-flatness>

 Analogous conditional bounds hold on the retained base-label fibers. For comparable states of absolute entropies $h_0 \, h_1$, typical coarse bins have fine support at most $exp \( h_1 - h_0 + o \( L_log \) \)$ and maximal conditional fine weight at most $exp \( - \( h_1 - h_0 \) + o \( L_log \) \)$.]
  #emph[These assertions can hold simultaneously on any prescribed countable family of successively finer finite grids, interpreted diagonally. Subsequent subpower restrictions preserve the referenced entropy profiles and these estimates, after discarding exceptional parent or base-label fibers. If lower weights are required in a finite collection of tests, bins of smaller weight than the corresponding reciprocal-support exponent can be discarded with subpower slack; their retained lower weights refer, in particular, to the law before that last discard.]
] <ent:regularization>

#proof[
  Fix a finite family first. The number of bins in each of its labels is at most $exp \( O \( log M \) \)$. Tails of probabilities smaller than an appropriately large negative power of $M$ have negligible total mass, by this count. Partition the remaining probabilities into dyadic classes. There are $O \( log M \)$ relevant classes per label. Do the same for all the prescribed joint labels and, pointwise on the base label, for the prescribed conditional parameter probabilities. Pigeonholing selects common classes on an event of relative mass
  $ exp #scale(x: 120%, y: 120%)[\(] - O_J \( log log M \) #scale(x: 120%, y: 120%)[\)] = exp #scale(x: 120%, y: 120%)[\(] - o \( L_log \) #scale(x: 120%, y: 120%)[\)] \, $
  where $J$ is the fixed number of tests. We choose all diagonal parameters slowly enough that this remains true as the grids grow.
  Suppose a selected unconditional class has original weight comparable to $w$. It contains at most $O \( w^(- 1) \)$ bins. After restriction and normalization by a subpower density, its maximal weight is at most $w exp \( o \( L_log \) \)$. Its new absolute entropy is therefore $- log w + o \( L_log \)$, by the upper support bound and the lower bound on entropy supplied by the maximal atom. This proves (3.4). For conditional classes, discard base-label fibers on which the relative retained mass is smaller than a sufficiently slowly vanishing power. Such fibers have negligible total retained mass. The identical support and maximal weight argument then applies on every remaining fiber. This procedure is also valid when $cal(B)$ takes values in a standard Borel space: the dyadic class of a conditional probability is a measurable finite label, and no count of base labels is involved.
  Here is the conditional-parent deduction explicitly. Replace the coarse and fine labels by their joint label when necessary. By Lemma 17, this changes the fine support and entropy bounds by bounded factors and additive constants. Write the errors in (3.4) as $epsilon L_log$. If a parent has more than $exp \( h_1 - h_0 + eta L_log \)$ descendants, then counting all joint cells and using the parent maximal weight bounds the total mass of such parents by $O \( exp \( - \( eta - 2 epsilon \) L_log \) \)$. Parents of weight below $exp \( - h_0 - eta L_log \)$ have total mass at most $exp \( - \( eta - epsilon \) L_log \)$. Outside these two exceptions, the conditional support and maximal weight bounds are the asserted ones, with errors $O \( \( eta + epsilon \) L_log \)$. Choose $eta arrow.b 0$ much more slowly than $epsilon$. The discarded fractions can thereby be made negligible compared with any finite list of subpower densities needed later.
  The support bound also shows that bins of absolute weight below $exp \( - h - eta L_log \)$ have negligible total mass. For a finite list of joint labels, one may remove these bins successively, or iteratively remove bins whose remaining weight is below the chosen threshold. Charge each removed bin when it is first deleted. The sum of all charges is bounded by the sum of the corresponding support counts times their thresholds, and is still negligible if the slack dominates the existing errors. Dividing joint weights by parent weights gives the corresponding conditional lower-weight statements.
  After any further restriction of density $rho = exp \( - o \( L_log \) \)$, the support bounds remain valid and maximal weights grow by at most $rho^(- 1)$. Thus the absolute entropies change by $o \( L_log \)$. The same parent and base-fiber trims recover the conditional statements. This proves heredity. Finally apply the construction on larger finite grids, with their size increasing sufficiently slowly. Off-grid tests are sandwiched by admissible finer and coarser grid states. The domain has interior shift vectors with every coordinate positive, and others with every coordinate negative, so such sandwiches exist with arbitrarily small offset errors. The Lipschitz estimates of Lemma 17 complete the diagonal extension. ◻
]

=== 3.3 The calibrated profile and conditional axis prediction <the-calibrated-profile-and-conditional-axis-prediction>

#thm([Proposition 3.3.])[
  (Calibrated entropy profile).  #emph[After the regularization of Lemma 18 and passage to a subsequence, the functions 
$ frac("H" \( Z \( z \) \) - "H" \( Z \( 0 \) \), L_log) $

 converge locally uniformly on $Omega$ to a continuous Lipschitz function $F$. Each scalar partial lies in $\[ 0 \, 1 \]$ where defined. The function is coordinatewise nondecreasing, and its off-diagonal distributional second partials are nonpositive in the interior. The same assertions hold for disjoint groups of coordinates advanced together with nonnegative speeds, on every valid comparison rectangle. At full alignment, 
$ F \( C \, B \, D \, A \, Y \, R \) gt.eq k_C C + k_B B + q_(*) Y \, #h(2em) k_C = 1 + kappa \, quad k_B = 1 - kappa \, quad "(3.5)" $ <eq:source-11>

 with equality on 
$ gamma \( Y \) = \( - a Y \, - b Y \, \( 1 - a \) Y \, \( 1 - b \) Y \, Y \, lambda Y \) . $

]
] <ent:states>

#proof[
  The finite-state comparisons give equicontinuity, after reference subtraction, with errors tending to zero in the present log unit. One first takes a subsequence on a countable dense grid, and then uses the admissible coordinatewise joins and bounded comparable shifts to obtain local uniform convergence on the full domain. Monotonicity and Lipschitz bounds pass to the limit. The entropy rectangle inequalities give submodularity. Equivalently, $- partial_(i j) F$ is a nonnegative distribution, and hence a nonnegative Radon measure, for $i eq.not j$ in the interior. Pinning coordinates or summing disjoint nonnegative coordinate increments preserves those inequalities. Comparisons on faces follow by translating the valid rectangle into the interior and passing to the limit; convexity of the domain makes these translations available.
  To verify the normalization in (3.5), put
  $ B_0 = - log K + #scale(x: 120%, y: 120%)[\(] 2 x_0 + \( 1 - kappa \) d_0 + q_(*) y_0 #scale(x: 120%, y: 120%)[\)] log M . $
  At full alignment, a state atom is contained in a tested ellipse cell, with its displayed time bin and axis. The simultaneous cap from Section 2 therefore gives
  $ "H" \( Z \( z \) \) gt.eq B_0 + L_log \( k_C C + k_B B + q_(*) Y \) - o \( L_log \) . $
  For a nonmesh time use a nearby earlier mesh time, with the rebasing and width errors controlled by (2.10). On the calibrated path, Corollary 9 supplies the opposite support estimate. Given an assigned high box and its time bin, the reference-axis approximation at path aspect accuracy leaves only $exp \( o \( L_log \) \)$ possibilities for the labels (3.1). The same is true of the slight width mismatches and time rebasing. Thus the support logarithm is at most the displayed lower bound plus $o \( L_log \)$. In particular, $"H" \( Z \( 0 \) \) = B_0 + o \( L_log \)$. Subtract this equality and divide by $L_log$. Equality first holds on the fine mesh and then everywhere on the line by continuity. All the cap and list estimates survive the subpower restriction used to regularize. ◻
]

We also track the referenced conditional entropy of $\( t \, r \)$ given $cal(B)$ on the same realizing sequence. Its limiting profile will be denoted by $Psi \( Y \, R \)$. The time-only profile is $s Y$, since the upper weights and upper support counts in (2.1) give both entropy bounds, with errors negligible in the present unit.

#thm([Lemma 3.4.])[
  (Conditional prediction of the axis).  #emph[For $lambda > 0$, $Psi \( Y \, R \) = s Y$ on $R lt.eq lambda Y$. For $lambda < 0$, this equality holds for every finite $\( Y \, R \)$. Parameter-coordinate increments of $F$ dominate those of $Psi$. In particular, if $lambda < 0$, then $partial_Y F gt.eq s$.]
  #emph[In the latter case set $c = b - a = - lambda > 0$. In the region 
$ C > a R \/ c \, #h(2em) B > b R \/ c \, #h(2em) Y > - R \/ c \,\
D > \( a - 1 \) R \/ c \, #h(2em) A > \( b - 1 \) R \/ c quad "(3.6)" $ <eq:source-12>

 inside $Omega$, $F$ is locally independent of $R$.]
] <ent:predictability>

#proof[
  Given $P$ and a time prefix at a local epoch, all particles in that fiber have the same measured line state at that epoch. Their assigned high boxes therefore pass through that state. The pointwise exclusion in Corollary 10 applies to #emph[all] high prelaw boxes, irrespective of subsequent restrictions or additional labels. It implies that the assigned axes in the fiber have only subpower many possibilities at path aspect precision. Corollary 16 transfers this conclusion to the common reference axis. The conditional entropy excess of the axis over the time prefix is consequently $o \( L_log \)$ at that precision.
  If $lambda > 0$, the epoch of offset $Y$ predicts the reference axis at offset depth $lambda Y$, hence also at every $R lt.eq lambda Y$. If $lambda < 0$, for any fixed $\( Y \, R \)$ choose an earlier fixed epoch $v lt.eq Y$ with $lambda v > R$. Its time prefix is determined by the one at $Y$, and its aspect precision is finer than the requested axis cutoff. The common reference epoch is still earlier, on the deeper-aspect end of the stretched interval. Chaining (2.10) from that reference to $v$ loses only the worst aspect precision, namely the precision at $v$. Thus this epoch also predicts the common reference axis to the requested accuracy. This proves the asserted zero excess entropy, including its absolute $o \( L_log \)$ bound before reference subtraction. Lemma 17 proves the increment comparison with $F$, and hence $partial_Y F gt.eq s$ in the decreasing-aspect case.
  We give the spatial prediction argument for (3.6) with all its buffers. Fix a state in that open region and choose a sufficiently small $eta > 0$. Test the path epoch
  $ v_(*) = - frac(R + eta, c) . $
  Two particles with the same displayed state have a common truncated slope $r$ and time $t_Y = T_(y_0 + delta Y)$. Their differences satisfy
  $ \| Delta U_1 \| & lt.tilde M^(- x_0 - delta C) \, & \| Delta U_2 - r Delta U_1 \| & lt.tilde M^(- x_0 - d_0 - delta B) \,\
\| Delta \( X_(t_Y) \)_1 \| & lt.tilde M^(- x_0 - y_0 - delta D) \, & \| Delta \( X_(t_Y) \)_2 - r Delta \( X_(t_Y) \)_1 \| & lt.tilde M^(- x_0 - y_0 - d_0 - delta A) . $
  Since $Y > v_(*)$, they also have the same epoch-$v_(*)$ prefix. Choose the assigned axis $r_(*)$ of either particle at that epoch. Its distance from $r$ is at most $M^(- d_0 - delta R + o \( delta \))$: compare first with that particle’s reference axis at depth $R + eta$, and then with its common prefix $r$ at depth $R$.
  In the $r_(*)$ frame, the velocity errors have the two offset depths
  $ C \, #h(2em) min \( B \, C + R \) \, $
  with absolute background depths $x_0$ and $x_0 + d_0$. If $t_(*) = T_(y_0 + delta v_(*))$, then $\| t_(*) - t_Y \| lt.tilde M^(- y_0 - delta v_(*))$. Using $X_(t_(*)) = X_(t_Y) + \( t_(*) - t_Y \) U$, the position errors in that frame have offset depths
  $ min \( D \, C + v_(*) \) \, #h(2em) min \( A \, D + R \, B + v_(*) \, C + R + v_(*) \) \, $
  with background depths $x_0 + y_0$ and $x_0 + y_0 + d_0$. The path targets at this epoch are
  $ - a v_(*) \, quad - b v_(*) \, quad \( 1 - a \) v_(*) \, quad \( 1 - b \) v_(*) . $
  Every displayed error depth is strictly finer than its target for small $eta$. Indeed this follows from the five inequalities in (3.6); the additional comparisons $C + R > b R \/ c$ and $D + R > \( b - 1 \) R \/ c$ follow from $c = b - a$.
  Thus peers in this state lie in bounded enlargements of one another’s assigned epoch boxes. The all-high-box angular exclusion forces their assigned axes to agree up to a subpower factor at offset depth $R + eta$. Comparison with each particle’s reference axis gives the same conclusion for the finer reference-axis bins. The state therefore determines this extra axis precision with entropy cost $o \( L_log \)$. After refining the parameter, its spatial labels at the original cutoffs can be updated with bounded ambiguity by (3.2). Hence increasing $R$ a little at fixed other offsets costs zero in the limiting profile. The strict margins hold throughout a neighborhood, proving local independence. ◻
]

===== 3.3.1 The stationary reference axis as a conditioning label. <the-stationary-reference-axis-as-a-conditioning-label.>

When $lambda = 0$, let $R_0$ be the reference slope truncated at absolute depth $d_0$; take a constant label if $d_0 = 0$. Retain $R_0$ and measure the spatial coordinates in its frame. Normalize the velocity widths by $M^(- x_0) \, M^(- \( x_0 + d_0 \))$ and the position widths by the same factors times $M^(- y_0)$. Use common offset depths $u$ for both velocity components, $z$ for both position components, and $Y$ for time. The domain is $z lt.eq u + Y$.

Write $W_zeta$ for these spatial and time bins at $zeta = \( u \, z \, Y \)$, and $hat(Z)_zeta = \( R_0 \, W_zeta \)$ for the recorded state. We use the referenced conditional entropy

$ frac("H" \( W_zeta divides R_0 \) - "H" \( W_0 divides R_0 \), L_log) = frac("H" \( hat(Z)_zeta \) - "H" \( hat(Z)_0 \), L_log) . quad "(3.7)" $ <ent:stationary-axis-cancellation>

This is an exact finite-stage identity. The size of $"H" \( R_0 \)$ is unrestricted: it cancels, rather than being charged as a subpower loss. Include $R_0$ and the needed joint labels in the regularization list. Thus we work with conditional blocks of a recorded label, without selecting a single axis bin at a supposed subpower cost. The resulting profile has the following properties.

#thm([Proposition 3.5.])[
  (Stationary-aspect profile).  #emph[There is a hereditary Lipschitz submodular profile $F \( u \, z \, Y \)$ on $z lt.eq u + Y$, with scalar-group Lipschitz bounds $2 \, 2 \, 1$, satisfying at alignment 
$ F \( u \, u + Y \, Y \) gt.eq 2 u + q_(*) Y \,\
F \( - a Y \, \( 1 - a \) Y \, Y \) = - 2 a Y + q_(*) Y \, #h(2em) partial_Y F gt.eq s . quad "(3.8)" $ <eq:source-13>

 At alignment, arbitrary ellipse tests in the normalized frame are also available. For their two width depths $l_1 \, l_2$, the width term $2 u$ is replaced by 
$ \( 1 + kappa \) min \( l_1 \, l_2 \) + \( 1 - kappa \) max \( l_1 \, l_2 \) . $

 Any additional axis label required for such a lower-bound test may be included on the measured side.]
] <ent:stationary-profile>

#proof[
  #strong[Conditional capacity and the heavy list.] The finite-state and regularization arguments apply with the two spatial components grouped and with $R_0$ recorded. Conditional entropy inherits the same comparison inequalities. To check the baseline, at alignment set
  $ b_zeta = B_0 + L_log \( 2 u + q_(*) Y \) \, $
  with $B_0$ as in the proof of Proposition 19. The joint cap gives maximal atom weight $exp \( - b_zeta + o \( L_log \) \)$ for $hat(Z)_zeta$. On a positive fiber $R_0 = r$ of probability $p_r$, normalization therefore gives
  $ "H" \( W_zeta divides R_0 = r \) gt.eq b_zeta + log p_r - o \( L_log \) . $
  Averaging over $r$ gives the lower bound $b_zeta - "H" \( R_0 \) - o \( L_log \)$. On the calibrated path, the joint high-box list bounds $"H" \( hat(Z)_zeta \) lt.eq b_zeta + o \( L_log \)$. Indeed, an assigned high box and time bin leave only $exp \( o \( L_log \) \)$ possibilities for the depth-$d_0$ reference-axis bin, by Lemma 15 with $lambda = 0$. Consequently
  $ "H" \( W_zeta divides R_0 \) = b_zeta - "H" \( R_0 \) + o \( L_log \) . $
  The upper estimate is an averaged conditional entropy statement; no uniform support bound in every untrimmed axis fiber is needed. The common $"H" \( R_0 \)$ term cancels in (3.7), giving the alignment lower bound and calibrated equality in (3.8). Typical-parent regularization gives the conditional support and weight bounds within the recorded $\( R_0 \, upright("parent") \)$ fibers, so these comparisons have the required hereditary realizations.
  ===== 3.3.2 Conditional time increments. <conditional-time-increments.>
  For brevity put $t_Y = T_(y_0 + delta Y)$. The same single-epoch prediction as in Lemma 20 gives $"H" \( R_0 divides cal(B) \, t_Y \) = o \( L_log \)$ at every fixed local cutoff. The exact chain rule reads
  $ "H" \( t_Y divides cal(B) \, R_0 \) = "H" \( t_Y divides cal(B) \) + "H" \( R_0 divides cal(B) \, t_Y \) - "H" \( R_0 divides cal(B) \) . $
  Subtract this identity at two cutoffs. The last term cancels, and the middle terms are negligible. Thus the time increment retains slope $s$, and the finite-state conditional comparison gives $partial_Y F gt.eq s$. No bound on the unconditional entropy of $R_0$, or on $"H" \( R_0 divides cal(B) \)$, is asserted.
  ===== 3.3.3 Elliptic tests in the normalized frame. <elliptic-tests-in-the-normalized-frame.>
  For an ellipse in the normalized frame, apply the submultiplicativity of $W$ under the fixed background linear normalization, as in Section 2. Its weight in offset units is the negative exponential of the stated width term. Each cell, with its axis label included if necessary, is contained in one of these ellipse tests up to bounded covering, proving the same entropy lower bound. ◻
]

=== 3.4 Realizing tangents and conditional blocks <realizing-tangents-and-conditional-blocks>

A tangent at a point $z_0$ of a profile is a locally uniform limit, on the corresponding rescaled domain, of

$ F_(z_0 \, h) \( z \) = frac(F \( z_0 + h z \) - F \( z_0 \), h) \, #h(2em) h arrow.b 0 . $

We may take several profiles to their tangents simultaneously. Centers may lie on an alignment face or on an affine sheet in that face. Constraints strict at the center disappear locally after rescaling; binding linear constraints retain their exact tangent form.

#thm([Lemma 3.6.])[
  (Realization of tangents).  #emph[Every tangent used below, and every finite succession of such tangents at finitely many sites, has a realizing sequence of the same sheared states, with hereditary support and weight estimates in its final log unit. Required common physical cutoffs at different sites can be kept identical. Exact alignment identities are preserved, before bounded dyadic rounding, whenever the center and the tested cutoffs lie on the corresponding alignment.]
] <ent:tangent-realization>

#proof[
  First fix a radius $h$ and a finite test grid for the desired tangent. Approximate the original profile on the corresponding grid of absolute cutoffs to an error much smaller than $h$. Choose the original stage sufficiently far out that $h L_log arrow.r oo$, and that every previous logarithmic error and every probability-class loss is $o \( h L_log \)$. Lemma 18 can be imposed on this finite list and on its joint and conditional labels. Now pass to a diagonal sequence as $h arrow.b 0$ and the grid grows. This realizes the tangent in its new log unit. Repeating the construction handles iterated tangents. A finite collection of sites is treated by putting all its cutoffs in the same list. Coordinates prescribed to be physically common are represented by the same absolute cutoff, rather than by separately rounded approximations.
  Inside a common parent bin, subtract the known bin centers and use its spatial and parameter widths as units. Formula (3.3) still applies. For instance a time increment changes position by its normalized scalar increment times normalized velocity, with known center terms subtracted exactly. At an aligned triple the position unit equals the velocity unit times the time unit. The defining affine equalities of these depths are preserved under a centered rescaling through alignment. Dyadic rounding changes the units only by bounded factors.
  For comparable parent and refinement states, the conditional support and maximal-weight estimates now use their entropy difference, by Lemma 18. This applies as well after a fine parameter bin is included in the parent tuple: the old spatial labels can be rebased to that parameter bin with bounded ambiguity. Lower typical weights, when needed, are obtained by the same trims.
  To see the resulting product density, fix a typical parent and let $sans(A) \, sans(B)$ be the supported bin sets of two prescribed refinement labels. Let $sans(E) subset sans(A) times sans(B)$ consist of pairs with positive conditional joint probability. Use joint labels with the parent where nesting has bounded ambiguity; this does not change the exponents. Write $L$ for the final logarithmic unit. If the two marginal entropy exponents are $alpha \, beta$ and the joint exponent is $alpha + beta$, regularization gives
  $ \| sans(A) \| lt.eq e^(\( alpha + o \( 1 \) \) L) \, #h(2em) \| sans(B) \| lt.eq e^(\( beta + o \( 1 \) \) L) \,\
max_(\( a \, b \) in sans(E)) Pr \( a \, b divides upright("parent") \) lt.eq e^(- \( alpha + beta - o \( 1 \) \) L) . $
  The conditional law has mass one, so $\| sans(E) \| gt.eq e^(\( alpha + beta - o \( 1 \) \) L)$ and hence
  $ frac(\| sans(E) \|, \| sans(A) \| thin \| sans(B) \|) gt.eq e^(- o \( L \)) . $
  This is subpower density of supported bin pairs, with no independence assertion. All these statements hold at every fixed finite power grid, and hence on successively finer grids by the same diagonal choice. ◻
]

In projection arguments we will use the actual realized profiles. A full-alignment test is based in a full profile, or in a tangent centered through full alignment at each intervening step. A slice with other coordinates moved to create slack need preserve only the aligned triples it tests.

=== 3.5 Peeling at an affine sheet <peeling-at-an-affine-sheet>

#thm([Lemma 3.7.])[
  (Peeling).  #emph[Let a Lipschitz, coordinatewise nondecreasing, submodular profile be defined on a convex domain given locally by linear inequalities, and let $Sigma$ be an affine sheet in one of its faces. Suppose a group of coordinates is held fixed by a tangent direction to $Sigma$ that strictly increases all the coordinates still attached outside that group. Coordinates separated at earlier steps may vary arbitrarily in this direction. At almost every point of $Sigma$, a first tangent splits that group as an independent additive summand. A finite succession of such separations can be made in the same first tangent.]
  #emph[Suppose that, after these separations, each group varies on $Sigma$ by one proportional family of linear forms, and that the nonzero forms of different groups are pairwise nonproportional. Then each group’s restriction to its sheet diagonal is affine. In particular, a separated singleton with nonconstant form has a constant full partial derivative throughout the tangent.]
] <ent:peeling>

#proof[
  We prove the assertion with an interior mollification first. Write $mu_(i j) = - partial_(i j) F gt.eq 0$ for $i eq.not j$. Choose a compact sheet patch, a smooth cutoff on a slightly larger patch, and an offset compact set lying strictly inside the tangent domain. Translate the sheet patch by $h u$, with $u$ in that offset set and $h > 0$ small. If $i$ belongs to the group being separated and $w$ is the chosen sheet-tangent direction, then $w_i = 0$ and
  $ - partial_(i w) F = sum_(j eq.not i) w_j mu_(i j) . $
  The integral of the left side on the translated patch against the cutoff is bounded uniformly in $h$ and $u$: integrate by parts in the sheet direction $w$ and use the bounded first derivative $partial_i F$. Terms from previously separated groups have bounded absolute integrals by the estimates at their earlier separation steps, using symmetry of mixed derivatives. All the remaining terms outside the current group are nonnegative, with strictly positive coefficients $w_j$. Consequently each such $mu_(i j)$ has a uniformly bounded integral on the translated sheet patch. Use nested, slightly larger patches at successive steps. This establishes all the required cross-pair bounds before any tangent is taken.
  Average these bounds also over compact interior offsets $u$. For the rescaled function $F_(x \, h)$ the corresponding mixed derivative has density $h mu_(i j) \( x + h u \)$ in the offset variable. Thus its averaged mass on an offset compact set, integrated over sheet centers $x$, is $O \( h \)$. These bounds are summable for dyadic $h$. By positivity, summability, and exhaustion by countably many compact subsets, at almost every sheet center all the cross-pair measures tend to zero on compact subsets in every limiting dyadic tangent.
  For an unmollified profile, the off-diagonal negative mixed derivatives are Radon measures. Mollify at a radius much smaller than $h$ times the strict interior margin of the offset compact set. Enlarge that compact set slightly when testing the measure. The same averaged bounds pass to the measures and give the conclusion just obtained. This argument never takes a Hessian trace on a binding face.
  Vanishing cross derivatives give additive separation on the convex open tangent domain. One way to see this is to mollify locally again: the gradient in a given group is then constant along each fiber of all the other coordinates. Connected convex fibers show that it depends only on that group’s coordinates. The resulting conservative field has a primitive on their convex projection. Patching these primitives gives a sum of group functions, up to a constant; Lipschitz continuity extends the identity to the closed domain.
  Apply Rademacher’s theorem in intrinsic Euclidean coordinates on the relative interior of $Sigma$ #cite(label("Heinonen2005Lipschitz")) Theorem 3.1. At almost every sheet center the restriction of the original profile to $Sigma$ is differentiable. Its locally uniform linear blowup shows that the restriction of any tangent there is affine on the whole tangent sheet. This uses intrinsic sheet measure, not ambient almost-everywhere differentiability. After the preceding splitting it is a sum of Lipschitz functions of the distinct group forms. Such a sum can be affine only if each summand is affine along its form. For completeness, fix one form and apply successive finite differences in directions annihilating each of the other forms but not the fixed one. Additional differences annihilate the affine right side. The result says that a sufficiently high distributional derivative of the chosen one-variable function vanishes. It is a polynomial, and its global Lipschitz bound makes its degree at most one. A zero group form is constant on the sheet and requires no assertion beyond that. For a singleton with nonzero form, its projected coordinate runs through the real line on the sheet, so its full summand is affine and its full partial is constant. ◻
]

#prodef([Remark 3.8.])[
  A useful sufficient condition for successive peeling is that the distinct nonzero group forms are positive on a common vector. They generate a pointed polyhedral cone. An extreme ray has an exposing functional zero on that ray and strictly positive on the other generating rays. This is the required sheet direction for that group. Remove it and repeat. Zero forms can first be separated as the group held fixed by the common positive direction. Proportional forms must be combined before this procedure.
  The tangent choices can be made measurably when their rates are integrated over a sheet. The dyadic blowups, jointly for any countable list of profiles, form a precompact family in a separable metrizable space of locally uniform convergence. On a patch of fixed binding constraints, choose nested balls from countable nets that are visited infinitely often. This selects a limiting tangent and a subsequence measurably. Tangential derivatives of the original restriction agree for all choices at its differentiability points.
] <ent:peeling-forms>

=== 3.6 Signed envelopes along a path <signed-envelopes-along-a-path>

The next lemma separates the cost of the coordinates that decrease along a path from the remaining coordinates. It constructs a tangent of the full profile and an auxiliary function of the decreasing coordinates, obtained from tangents of slices with the remaining cutoffs fixed at finer levels. The auxiliary function gives lower bounds for ordered increments and an upper comparison that is exact at the starting point. In the applications, projection tests continue to use actual entropy profiles and their realized tangents with the required alignments preserved. The auxiliary function is used only through the increment comparisons and overlap identities proved below.

#thm([Lemma 3.9.])[
  (Signed envelope).  #emph[Let $F_0$ be a Lipschitz, coordinatewise nondecreasing, submodular profile on a convex polyhedral cutoff domain $cal(D)$. All increment comparisons below are required to have valid corners. Let 
$ gamma \( y \) = \( N \( y \) \, Q \( y \) \) \, #h(2em) y in J \, $

 be a Lipschitz path in a boundary sheet of $cal(D)$. Suppose each coordinate of $N$ is strictly decreasing, with its speed bounded above and below in magnitude, and each coordinate of $Q$ is nondecreasing. Constant coordinates may belong to $Q$. Assume 
$ \( N \( alpha \) \, Q \( beta \) \) in cal(D) #h(2em) \( alpha lt.eq beta \) . $

 Assume also the following exterior-slack property. On compact subintervals of $J$, one can choose a vector $e$ with strictly positive $Q$-coordinates such that replacing $Q \( beta \)$ by $Q \( beta \) + epsilon e$ preserves admissibility and opens every constraint involving $Q$ by a positive constant times $epsilon$. At a path point, fix a strictly exterior value of $Q$ supplied by this property. Define the pure tangent domain $cal(P)$ to be the tangent domain of that fixed slice at the path’s $N$-coordinates. The inequalities involving $Q$ are strict, so $cal(P)$ is given by the active inequalities involving only $N$ and is independent of the chosen exterior value. Assume that $cal(P)$ is either full space or the three-dimensional half-space ${ \( C \, B \, R \) in bb(R)^3 : B lt.eq C + R }$; in the latter case the pure group consists exactly of $N = \( C \, B \, R \)$.]
  #emph[At almost every $y_0 in J$, put 
$ v = - N' \( y_0 \) \, #h(2em) w = Q' \( y_0 \) \, #h(2em) n \( t \) = - t v \, #h(2em) q \( t \) = t w . $

 Thus $v_i > 0$ and $w_j gt.eq 0$. There are a first tangent $F$ of $F_0$ at $gamma \( y_0 \)$ and a Lipschitz, nondecreasing, submodular function $G$ on the pure tangent domain $cal(P)$, both referenced to vanish at the origin, with the following properties.]
  + #emph[The function $F - G$ is nondecreasing under valid ordered increases of $N$ at fixed $Q$. Moreover, 
$ F \( n \( alpha \) \, q \( beta \) \) - G \( n \( alpha \) \) $

 is independent of $alpha$ whenever $alpha lt.eq beta$.]
  + #emph[On any compact test region, if $H$ is sufficiently large that $n \( - H \) gt.eq N$ and the comparison tuples are valid, then 
$ F \( N \, Q \) lt.eq G \( N \) + F \( n \( - H \) \, Q \) - G \( n \( - H \) \) = G \( N \) + F^(+) \( Q \) . quad "(3.9)" $ <eq:source-14>

 Equality holds at the origin. There is also equality for pure increments in the overlap region: if $Q gt.eq q \( beta \)$ and $N lt.eq N'$ satisfy $N_i > n_i \( beta \)$ for every $i$, and all four tuples obtained from $N \, N'$ and $Q \, q \( beta \)$ are valid, then 
$ F \( N' \, Q \) - F \( N \, Q \) = G \( N' \) - G \( N \) . $

]
  + #emph[If $cal(P) = bb(R)^d$, then $G$ is linear on every strict ordering region of the normalized depths $x_i = N_i \/ v_i$. There is a number $m$ such that $G \( n \( t \) \) = - m t$, and in every ordering region 
$ sum_i v_i partial_i G = m . $

 When $x_i$ is strictly largest, $partial_i G$ is a constant marginal rate; this rate is a global upper bound for that partial.]
    #emph[If instead $cal(P)$ has the constraint $B lt.eq C + R$, the same affine rate holds on the tied line. Write the corresponding speeds as $a \, b \, c > 0$, so $b = a + c$. The $C$-partial is constant on 
$ C / a > max {B / b \, R / c} \, $

 and the $R$-partial is constant on 
$ R / c > max {C / a \, B / b} . $

 Each constant is a global upper bound for its partial, interpreted distributionally in the interior.]
  #emph[The tangent and all genericity requirements can be imposed simultaneously for countably many ancillary profiles and exterior slices.]
] <ent:signed-envelope>

#proof[
  #strong[Fixed exterior slices and their rates.] For each fixed later parameter $beta$, the function $y mapsto F_0 \( N \( y \) \, Q \( beta \) \)$ is Lipschitz on $y < beta$. Choose a countable dense family of parameters containing all dyadic partition endpoints used below. At common differentiability points of the corresponding restrictions, define
  $ r_beta \( y \) = - frac(d, d y) F_0 \( N \( y \) \, Q \( beta \) \) \, #h(2em) m \( y \) = lim_(beta arrow.b y) r_beta \( y \) \, $
  where the limit is taken through that countable family. Submodularity and monotonicity of $Q$ show that $r_beta \( y \)$ increases as $beta$ decreases to $y$. All these rates are bounded, so $m$ is bounded and measurable.
  ===== 3.6.1 Finite increments with a moving tied parameter. <finite-increments-with-a-moving-tied-parameter.>
  The Lipschitz integral formula #cite(label("Heinonen2005Lipschitz")) Theorem 3.3 applies to each fixed restriction. Its bounded rates are locally integrable. Choose $y_0$ to be a Lebesgue point of $m$ and of every applicable fixed-$beta$ rate, using #cite(label("Tao2011Measure")) Theorem 1.6.19 after a cutoff on a larger compact interval. There are only countably many fixed restrictions. A shrinking interval with fixed rescaled endpoints has average oscillation bounded by a fixed multiple of a centered interval’s average, so the same Lebesgue-point conclusion applies below. Fix $alpha_1 < alpha_2 < beta_0$, and put
  $ I_h =  & F_0 #scale(x: 120%, y: 120%)[\(] N \( y_0 + h alpha_1 \) \, Q \( y_0 + h beta_0 \) #scale(x: 120%, y: 120%)[\)]\
 & - F_0 #scale(x: 120%, y: 120%)[\(] N \( y_0 + h alpha_2 \) \, Q \( y_0 + h beta_0 \) #scale(x: 120%, y: 120%)[\)] . $
  For each fixed $beta_(*) > y_0$ in the countable family, and all sufficiently small $h > 0$, ordered increment comparisons give
  $ integral_(y_0 + h alpha_1)^(y_0 + h alpha_2) r_(beta_(*)) \( s \) thin d s lt.eq I_h lt.eq integral_(y_0 + h alpha_1)^(y_0 + h alpha_2) m \( s \) thin d s . $
  These are finite-increment comparisons on valid rectangles, or their limits along the ordered path. If the moving parameter $y_0 + h beta_0$ is outside the countable family, approximate it by parameters in that family still later than the entire increment interval. Lipschitz continuity of $F_0$ and $Q$ passes the bounds to the limit; no continuity of derivatives in the conditioning value is required. Divide by $h$, apply Lebesgue differentiation, and then let $beta_(*) arrow.b y_0$ to obtain
  $ lim_(h arrow.b 0) I_h / h = m \( y_0 \) \( alpha_2 - alpha_1 \) . $
  Differentiability of the path at $y_0$ and the Lipschitz bound permit its replacement by the linearizations $n \, q$. Hence every tangent at this point has pure tied rate $m \( y_0 \)$ when the pure cutoffs are strictly finer than the fixed $Q$-path time. Continuity includes the endpoint of the ordered region.
  ===== 3.6.2 Approximating the trace by exterior slices. <approximating-the-trace-by-exterior-slices.>
  We next obtain the same rate from strictly exterior slices. Work on a compact path interval with a fixed exterior vector $e$. For a dyadic partition of mesh $delta_k$, set, on each interval $I = \[ a_I \, b_I \]$,
  $ Q^I = Q \( b_I \) + delta_k e \, #h(2em) m_k \( y \) = - frac(d, d y) F_0 \( N \( y \) \, Q^I \) \, quad y in I . $
  The entire countable family of these constants is fixed before choosing generic centers. Ordered comparison gives $0 lt.eq m_k lt.eq m$. We claim that $m_k arrow.r m$ in $L^1$ on compact subintervals.
  Fix a coarser dyadic interval $\[ a \, b \]$. For every fine $I subset \[ a \, b \]$, one has $Q^I lt.eq Q \( b \) + delta_k e$, with all comparison tuples valid. Sum the corresponding pure increments to obtain
  $ integral_a^b m_k \( y \) thin d y gt.eq F_0 \( N \( a \) \, Q \( b \) + delta_k e \) - F_0 \( N \( b \) \, Q \( b \) + delta_k e \) . $
  First let the fine mesh tend to zero while keeping $\[ a \, b \]$ fixed. Lipschitz continuity removes the exterior shift. Then refine the coarse partition. Its fixed-endpoint rates converge almost everywhere to the defining monotone trace, so dominated convergence makes the sum of its tied increments tend to $integral m$. The upper bound $m_k lt.eq m$ proves the claim. After a subsequence of partitions, $m_k \( y \) arrow.r m \( y \)$ almost everywhere. The fine limit preceding the coarse limit is essential here; it also handles constant coordinates of $Q$ without continuity assumptions on derivatives in those coordinates.
  ===== 3.6.3 The pure limit and overlap equality. <the-pure-limit-and-overlap-equality.>
  Choose $y_0$ outside all exceptional sets for the profile, the countable exterior slices, and the restrictions used below. Blow up $F_0$ at $\( N \( y_0 \) \, Q \( y_0 \) \)$ and, simultaneously, each applicable slice $N mapsto F_0 \( N \, Q^I \)$ at $N \( y_0 \)$. Equicontinuity and a diagonal subsequence give a first tangent $F$ and slice tangents $G_k$. For each fixed exterior slice, strict mixed slack makes its rescaled domain contain every compact subset of $cal(P)$ eventually. Differentiability along the tied path gives
  $ G_k \( n \( t \) \) = - m_k \( y_0 \) t . $
  For fixed $k$, its exterior $Q^I$ is strictly finer than the $Q$-coordinates of any fixed compact blowup test once the blowup radius is small. Submodularity therefore gives
  $ partial_i F gt.eq partial_i G_k \, #h(2em) i in N \, $
  in distributions on the interior. Valid face comparisons follow by interior translation and continuity. Take a locally uniform subsequential limit of the referenced $G_k$, denoted by $G$. Then
  $ partial_i F gt.eq partial_i G \, #h(2em) G \( n \( t \) \) = - m \( y_0 \) t . $
  Thus $F - G$ is nondecreasing under valid ordered pure increments. The finite-increment trace calculation makes its tied pure increments vanish for $alpha < beta$, and continuity includes $alpha = beta$. This proves (i) and (3.9), including equality at the origin.
  For overlap equality, first fix $q \( beta \)$. A pure tuple strictly finer than $n \( beta \)$ is bounded above and below by two tied tuples with path times strictly below $beta$. They are valid. Monotonicity of $F - G$ and its equal values at the tied tuples imply that $F \( N \, q \( beta \) \) - G \( N \)$ is constant throughout the comparison region. The pure increment identity therefore holds at $q \( beta \)$. Increasing $q \( beta \)$ to $Q$ can only decrease a pure increment of $F$, whereas (i) bounds it below by the corresponding increment of $G$. These bounds agree, proving (ii).
  ===== 3.6.4 Order sectors of the pure profile. <order-sectors-of-the-pure-profile.>
  It remains to identify the pure slice tangents. Suppose first that $cal(P)$ is full space. Fix an exterior slice $Q^I$ and a nonempty proper coordinate subset $S$. For each later parameter $beta$ in the countable dense family, define on the local valid restrictions
  $ r_beta^S \( y \) & = - frac(d, d y) F_0 \( N_S \( y \) \, N_(S^c) \( beta \) \, Q^I \) \, #h(2em) y < beta \,\
r_S \( y \) & = lim_(beta arrow.b y) r_beta^S \( y \) . $
  As $beta$ decreases, the complementary cutoffs become finer, so submodularity makes these rates decrease. Require differentiability of all these fixed restrictions and take $y_0$ to be a common Lebesgue point of their rates and traces, for every exterior slice and subset.
  For $alpha_1 < alpha_2 < beta_0$, put
  $ I_h^S =  & F_0 \( N_S \( y_0 + h alpha_1 \) \, N_(S^c) \( y_0 + h beta_0 \) \, Q^I \)\
 & - F_0 \( N_S \( y_0 + h alpha_2 \) \, N_(S^c) \( y_0 + h beta_0 \) \, Q^I \) . $
  For fixed $beta_(*) > y_0$ in the dense family, sufficiently close to $y_0$ that the fixed-complement restriction is valid near $y_0$, and for sufficiently small $h$, the reversed ordered-increment bounds are
  $ integral_(y_0 + h alpha_1)^(y_0 + h alpha_2) r_S \( s \) thin d s lt.eq I_h^S lt.eq integral_(y_0 + h alpha_1)^(y_0 + h alpha_2) r_(beta_(*))^S \( s \) thin d s . $
  As before, approximate a moving complementary parameter by dense parameters later than the increment interval, and use Lipschitz continuity to pass these finite-increment bounds to the limit. Divide by $h$, let $h arrow.b 0$, and then let $beta_(*) arrow.b y_0$. Lebesgue differentiation gives $I_h^S \/ h arrow.r r_S \( y_0 \) \( alpha_2 - alpha_1 \)$. Thus the slice tangent has constant tied-$S$ rate $r_S \( y_0 \)$ whenever $S$ is strictly finer than its complement. The exterior value $Q^I$ stays fixed throughout this blowup.
  The complement need not be tied: bound its normalized depths above and below by tied, strictly coarser depths. Full pure space and the fixed exterior slack make all these corners valid locally. Ordered increments sandwich the tied-$S$ rate between the same two constants. For the slice tangent $G_k$, abbreviate its rate $r_S \( y_0 \)$ by $r_S$.
  Write $x_i = N_i \/ v_i$ and order them as $x_(\( 1 \)) lt.eq dots.h.c lt.eq x_(\( d \))$. Start with all normalized depths equal to $x_(\( 1 \))$, increase the remaining coordinates together, and freeze each as its specified depth is reached. The tied-subset calculation yields
  $ G_k \( N \) = r_(\[ d \]) x_(\( 1 \)) + sum_(j = 2)^d r_(S_j) #scale(x: 120%, y: 120%)[\(] x_(\( j \)) - x_(\( j - 1 \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) S_j = { i : x_i gt.eq x_(\( j \)) } \, $
  where $r_(\[ d \]) = m_k \( y_0 \)$. Repeated depths cause no ambiguity, since their differences vanish. This proves linearity on strict ordering regions. Translating all normalized depths by the same amount proves the identity for the weighted sum of partials. If $x_i$ is strictly largest, its partial is the singleton rate $r_({ i }) \/ v_i$. At any other point, make all complementary coordinates sufficiently coarser to put $i$ in this finest sector. Submodularity shows that the original partial is no larger than this singleton rate. The finitely many coefficients are bounded, so these assertions pass to the locally uniform limit $G$.
  For the pure constraint $B lt.eq C + R$, the function $B - C - R$ along the path is nonpositive and vanishes at the center. Its derivative there is zero, giving $b = a + c$. The full tied trace and the singleton traces for $C \, R$ still have valid comparisons. For example, if $C \/ a > max \( B \/ b \, R \/ c \)$, tied complements $\( B \, R \) = \( b T \, c T \)$ with $T < C \/ a$ are valid, because $b T < C + c T$. Tied complements above and below the given normalized complement sandwich its singleton increments. Nonnegative connecting segments remain in the domain by convexity and validity of their endpoints. Thus the $C$-partial is constant in the finest sector. Taking a sufficiently coarse tied complement at any other interior point gives the global upper bound. The argument for $R$ is identical. These statements pass to $G$ in distributions.
  All exceptional sets arise from differentiability and Lebesgue differentiation for countably many fixed restrictions. Intersect their full-measure sets and diagonalize the equicontinuous blowups. This proves the simultaneous assertion. ◻
]

The pure auxiliary profile need not inherit projection statements. At a center on the boundary of a strict order sector, a pure-gradient lower bound for the actual profile passes distributionally to the part of its tangent domain consisting of directions into that sector. If this sector cone meets the tangent interior and peeling makes the relevant singleton partial constant throughout the tangent, its value on that open portion is the same constant used everywhere else. The sector bound therefore bounds that constant. The transfer uses interior ordered-increment inequalities and their continuous extension to valid boundary rectangles.

#prodef([Remark 3.10.])[
  (Boundary increments and inherited flatness).  At a binding constraint, overlap equality applies in particular to a strictly positive pure direction with valid comparison tuples. If individual pure-gradient lower bounds hold and a subsequently tested tangent has constant partials in these coordinates, equality of that weighted sum forces equality in each lower bound: every weight is strictly positive and every excess over its lower bound is nonnegative. First pass each bound to the interior part of its sector cone and identify the constant partial there. A two-sided coordinate perturbation at the boundary origin is unnecessary.
  Flatness of the exterior slices on a common strict comparison region passes to their tangents and then to $G$. In particular, the flatness in (3.6) is inherited wherever its offset conditions hold for those slices. Pure lower profiles are used only through the properties just proved; projection tests continue to use actual entropy profiles.
  The exterior-slack vectors have explicit choices in the applications. On the calibrated path with $lambda > 0$ and $a > 0$, the negative coordinates are $C$ and whichever of $B \, D$ strictly decrease. Large positive shifts in $R \, Y$, with smaller positive shifts in the other nonnegative coordinates, open the mixed constraints. For $lambda < 0$, the negatives are $R \, B$, and also $C$ if $a > 0$. Positive shifts in $Y \, D \, A$, successively smaller in that order, open the mixed constraints; add a positive shift in $C$ when it is static. In the scalar domain $Z lt.eq X + y$ with decreasing $X$, shift $y$ more than $Z$.
  The tied-subset argument also applies with signs reversed on a full domain along a line whose speeds are all strictly positive. It gives the piecewise-affine order slopes of unconditional or conditional two-variable profiles used below.
] <ent:signed-envelope-boundary>

The final lemma turns local comparisons into one finite path. Its almost-everywhere hypothesis is along every admissible path, as its statement specifies.

=== 3.7 From local gains to a finite path <from-local-gains-to-a-finite-path>

#thm([Lemma 3.11.])[
  (Local gains and path control).  #emph[Fix a starting state and a duration $T > 0$, and consider paths from that state with velocities in a compact convex box. The states may be restricted to a closed linear half-space; assume there is an available velocity following its boundary. Let the potential be continuous and Lipschitz on the compact region reachable by these paths. If the potential depends on time, include time as a state coordinate with its prescribed unit velocity. Suppose that along #emph[every] admissible Lipschitz path, at almost every interior time, arbitrarily short admissible straight steps increase the potential at a rate exceeding $g_0 + epsilon$, where $epsilon > 0$ is fixed. Then a reachable terminal state has potential at least $g_0 T$ greater than its value at the prescribed start.]
  #emph[The local hypothesis is satisfied at a point if a tangent there has a strict admissible finite-step comparison from the tangent origin with the stated margin. A sufficiently small admissible perturbation of its velocity or endpoint is harmless within a strict margin.]
] <ent:control>

#proof[
  Include time among the state coordinates, so the terminal face is part of the compact reachable set. Call a state good if it admits a positive-length straight step before the terminal time with gain rate greater than $g_0 + epsilon \/ 2$, and call all other states bad. Goodness is relatively open. Indeed a strict comparison persists under small perturbations. If a step ends on the terminal face or on the boundary of the half-space, shorten it slightly; the comparison remains strict. A step starting on the half-space boundary either enters the interior or follows the boundary, and remains admissible when its start is moved slightly into the half-space. For an interior start, shortening or a small convex perturbation toward a boundary-following velocity keeps the perturbed step admissible. Thus the bad set is closed; it includes the terminal face.
  By hypothesis, the bad set occupies zero time on every admissible path. Its shrinking neighborhoods consequently have uniformly vanishing occupation time over all such paths. To prove this, otherwise choose shrinking radii and paths with a fixed positive occupation time. The paths have a common Lipschitz bound. A uniformly convergent subsequence has an admissible limit, because the velocity box is compact and convex and the half-space is closed. Uniform convergence shows that the limiting path spends at least that positive time in every fixed neighborhood of the closed bad set. Continuity from above of Lebesgue measure then gives positive time in the bad set itself, a contradiction.
  Fix a small neighborhood of the bad set. Outside it, compactness and openness of goodness give finitely many comparison steps, each valid on an open set of starting states and with its length bounded below by a positive number. At a state outside the neighborhood, take one of these good steps. Inside the neighborhood, take an arbitrary viable straight step of a fixed sufficiently small length, clipped at terminal time. Choose that length so that such a step stays in a slightly larger neighborhood, using the common speed bound. This constructs a path reaching the terminal time in finitely many steps. The total time of its nongood steps is at most the occupation time of the larger neighborhood, hence is uniformly small. Its good steps gain at least $g_0 + epsilon \/ 2$ per unit time, whereas the Lipschitz bound gives a uniform lower rate on the remaining steps. Taking the neighborhood small enough makes the total gain at least $g_0$ times the full duration.
  Finally, a strict endpoint comparison from the tangent origin passes back along its defining blowup sequence: the endpoint error is little-oh of the step length, while the gain margin is a fixed positive multiple of that length. Admissibility under the linear domain constraint is retained in this passage. Any additional perturbation must remain admissible and have velocity in the given box; sufficiently small such perturbations preserve the strict margin. This gives the last assertion. ◻
]

== 4 Projection tests and correlated parameters <sec:projection>

The only external projection statement used here is the finite incidence estimate below. We derive its weighted consequence, a radial improvement, and the correlated-product estimate needed when two spatial coordinates have the same rate. Each test uses the hereditary finite realizations of Section 3.

Throughout this section, $m arrow.r oo$ denotes the base of the block being tested; a fixed positive block length is absorbed into this base. A probability law in a bounded Euclidean set is #emph[Frostman of exponent $d$ at this scale] if

$ mu \( B \( v \, h \) \) lt.eq m^(o \( 1 \)) h^d \, #h(2em) m^(- 1) lt.eq h lt.eq 1 . $

The analogous terminology for directions uses angular intervals. It suffices to impose these bounds on arbitrarily fine fixed grids of powers of $m$, allowing an arbitrarily small power loss. Between grid points one uses monotonicity. A restriction is #emph[dense] if its probability is $m^(- o \( 1 \))$. At a fixed power scale, #emph[power-small] means bounded by $m^(- c)$ for some $c > 0$; the constant may depend on that scale and on the strict exponent gaps in the assertion. All limits below keep these gaps fixed before letting the input losses tend to zero. Bounded enlargements of bins and boundedly overlapping grids do not affect an exponent.

=== 4.1 The discretized input and its weighted projection consequence <the-discretized-input-and-its-weighted-projection-consequence>

We state the external incidence theorem in the form needed here. A $\( delta \, d \, C \)$-set is a nonempty finite family $P$ of dyadic $delta$-squares such that

$ \| { p in P : p ∩ B \( v \, h \) eq.not diameter } \| lt.eq C h^d \| P \| \, #h(2em) delta lt.eq h lt.eq 1 \, $

with harmless constant enlargements at the mesh scale. Tubes are counted by their dyadic cells in a bounded slope–intercept chart of line space. Finitely many charts cover the directions that occur.

#thm([Theorem 4.1.])[
  (Discretized planar Furstenberg estimate).  #emph[Let $0 < k lt.eq 2$ and $0 < sigma lt.eq 1$. For every $epsilon > 0$ there is $eta = eta \( epsilon \, k \, sigma \) > 0$ such that the following holds for sufficiently small dyadic $delta$. Suppose $P$ is a $\( delta \, k \, delta^(- eta) \)$-set of pins in a fixed bounded planar region, normalized to $\[ 0 \, 1 \]^2$. For every $p in P$, let $cal(T) \( p \)$ be a family of $delta$-tubes meeting $p$, with $\| cal(T) \( p \) \| asymp M$, whose directions form a $\( delta \, sigma \, delta^(- eta) \)$-set. Then 
$ lr(|union.big_(p in P) cal(T) \( p \)|) gt.tilde_epsilon delta^(- min { k \, \( k + sigma \) \/ 2 \, 1 } + epsilon) M . $

 Consequently the union has lower exponent at least $min { k + sigma \, \( k + 3 sigma \) \/ 2 \, 1 + sigma }$ as the nonconcentration losses tend to zero.]
] <proj:furstenberg>

This is Theorem 4.1 of Ren–Wang #cite(label("RenWang2023")), in the explicitly cited arXiv version 2, with the notation and nonemptiness convention of their Definitions 1.3, 2.3–2.4, and 3.1. Their theorem is already a finite-scale estimate for incident tube pencils. In particular, no discretization of a Hausdorff-dimension conclusion is being used. The last assertion follows from $M gt.tilde delta^(- sigma + eta)$, which is the direction nonconcentration bound at radius $delta$. Comparable pencil cardinalities are obtained, when necessary, by a dyadic pigeonhole. There are only logarithmically many such classes in our bounded, polynomial-size grids. The dependence of $eta$ on $epsilon$ is part of the theorem and is retained in every use below.

#thm([Lemma 4.2.])[
  (Weighted projection test).  #emph[Let $mu$ be a planar Frostman $k$ probability law and let $zeta$ be a Frostman $sigma$ law of directions, where $0 < k lt.eq 2$ and $0 < sigma lt.eq 1$. Let $E$ be a set of point–direction pairs of dense $mu times zeta$ measure. For a direction $omega$, write $E_omega$ for the corresponding point fiber. If the projections of these fibers have at most $m^(u + o \( 1 \))$ mesh bins for every retained direction, then 
$ u gt.eq min { k \, \( k + sigma \) \/ 2 \, 1 } . quad "(4.1)" $ <eq:source-15>

 The same conclusion applies to dense point restrictions chosen separately for each direction. It is enough to have the stated ball bounds with losses that can be made arbitrarily small.]
] <proj:projection>

#proof[
  First discard direction fibers and pin fibers whose relative masses are too small, using a threshold with exponent tending to zero sufficiently slowly. Normalize the restrictions of the reference laws $mu$ and $zeta$ to the retained pin and direction sets, and keep $E$ as a subset of their product. We continue to denote these reference laws by $mu \, zeta$; their Frostman bounds lose only subpower factors, and $E$ still has dense product measure. We now reduce these weighted laws to the finite sets in Theorem 28.
  Sample the reference direction law $zeta$ #emph[globally], before drawing the pencils, so every pencil uses the same sampled population. For small fixed $0 < rho < sigma$, take $n asymp m^(sigma - rho)$ independent samples. Choose a permitted empirical loss $m^a$ with $a > rho$, with both exponents below the input allowance in Theorem 28. The required count in an interval of radius $h$ is at most $m^a n h^sigma$. At $h = m^(- 1)$ this threshold is of order $m^(a - rho)$, whereas the expected count is at most $n h^sigma m^(o \( 1 \))$. Binomial tails therefore give the count bound simultaneously over the polynomial family of intervals with mesh endpoints. Enlargement then gives it for all angular intervals. The expected proportion of samples sharing a mesh bin with another sample is at most
  $ O #scale(x: 120%, y: 120%)[\(] m^(sigma - rho) sup_omega zeta \( B \( omega \, O \( m^(- 1) \) \) \) #scale(x: 120%, y: 120%)[\)] lt.eq m^(- rho + o \( 1 \)) . $
  Thus repetitions can be removed at a cost negligible compared with the dense incidence. The tail failures can also be made negligible relative to that density. Averaging gives a sample on which dense incidence survives, with dense direction fibers at a dense set of pins. Apply the same construction to the reference pin law, using $m^(k - rho)$ samples after also requiring $rho < k$; mesh balls have a polynomial-size covering family. Restriction to a dense fiber divides a normalized ball bound by at most a subpower factor. Finally pigeonhole the pencil cardinalities. Their exponent is $sigma - rho - o \( 1 \)$, and the pin exponent is $k - rho - o \( 1 \)$; the normalized nonconcentration losses remain arbitrarily small.
  For each retained point–direction pair, draw the line of constant projection through that point. The sampled directions number at most $m^(sigma + o \( 1 \))$ in total. Hence the projection support hypothesis gives the global line-count upper bound $m^(sigma + u + o \( 1 \))$. On the other hand, Theorem 28, with output error $epsilon$, gives lower exponent
  $ sigma - rho + min { k \, \( k + sigma \) \/ 2 \, 1 } - epsilon - o \( 1 \) . $
  To make this comparison quantitative, first prescribe an output error, then choose all sampling, restriction, and Frostman losses below the input allowance in that theorem, and finally let $m$ tend to infinity. Sending the output error and $rho$ to zero proves (4.1).
  In a bounded pin chart, the map from a direction to the line through a given pin is uniformly bi-Lipschitz in its slope coordinate. The passage between angular bins, lines, and dyadic tubes therefore changes only bounded covering constants. If angular bounds are initially known only for balls centered at surviving directions, an arbitrary ball meeting the support is contained in the ball of twice its radius centered at one of those directions. This also proves the stated variants. ◻
]

The weighted reduction above uses one common sampled direction population to obtain its line-count upper bound. Its point fibers may depend on the direction; the dense incidence hypothesis supplies the needed comparison of laws. In the radial bootstrap below, only the Furstenberg lower bound is needed, and its direction pencils will instead be sampled separately at each pin.

=== 4.2 A radial consequence <a-radial-consequence>

The dispersed/concentrated-tube division below is closely related to the reciprocal thin-tube bootstrap of Orponen–Shmerkin–Wang #cite(label("OrponenShmerkinWang2024Radial")) arXiv:2209.00348v1, Section 1.3, Lemma 2.8, and Corollary 2.18. We prove the required finite-scale bounds and power-small exceptions here, retaining the conditional-law hypotheses needed in later applications.

For distinct planar points $x \, y$, let $\[ y - x \]$ denote the unoriented direction of their joining line. For a planar law $nu$, put

$ A_beta \( x \, y \) = nu { z eq.not x : "angle" \( \[ z - x \] \, \[ y - x \] \) lt.eq beta } . $

Using oriented directions would make only a bounded difference.

#thm([Lemma 4.3.])[
  (Radial nonconcentration away from strips).  #emph[Let $0 < s_0 lt.eq 1$ and let $nu$ be a planar Frostman $s_0$ law at resolution $m^(- 1)$. Suppose that, for every fixed $chi > 0$, every strip of width $m^(- chi)$ has power-small $nu$ mass, uniformly over the strip. For every $sigma < s_0$ and every fixed $h in \( 0 \, 1 \]$, with $beta = m^(- h)$, the set of pairs for which 
$ A_beta \( x \, y \) > beta^sigma $

 has power-small $nu times nu$ measure. Near-diagonal pairs may be included in the exceptional set. The assertion holds simultaneously on any fixed finite grid of scale powers.]
] <proj:radial>

#proof[
  At a fixed power scale $beta$, all original subpower losses are also $beta^(o \( 1 \))$. It is enough to rule out a sequence on which the bad pair mass is $beta^(o \( 1 \))$: failure of any power bound would supply such a subsequence. We use angular grids with bounded overlap, choosing strict exponent margins so that fixed constants in the definition of $A_beta$ are harmless.
  We first prove the assertion for $2 sigma < s_0$. At any pin there are at most $O \( beta^(- sigma) \)$ angular bins of mass at least $beta^sigma$. Suppose that pairs in these bins have dense incidence. Cauchy–Schwarz, applied to target fibers, gives two pins with a dense common target set. They can be required to be at distance at least $beta^alpha$, for any fixed sufficiently small $alpha > 0$, because the Frostman estimate makes closer pin pairs power-small. Likewise, discard the strip of width $beta^alpha$ about their joining line. The strip hypothesis makes the total discarded triple mass power-small, whereas the common-target triple mass is the square of the dense incidence and is still subpower.
  For a target outside this strip, the two joining directions make an angle whose sine is at least a constant times $beta^(2 alpha)$. Indeed the cross product is the pin separation times the distance to their joining line, and all distances in the denominator are bounded. An intersection of two pencil tubes is therefore contained in a ball of radius $O \( beta^(1 - 2 alpha) \)$. The common targets lie in at most $O \( beta^(- 2 sigma) \)$ such balls. Their total mass is at most
  $ beta^(- 2 sigma + \( 1 - 2 alpha \) s_0 - o \( 1 \)) \, $
  which is power-small when $alpha$ is sufficiently small. This contradicts dense common incidence and proves the initial range.
  For the improvement step, suppose the assertion is already known at an exponent $sigma < s_0$, at every fixed power scale. Choose $alpha \, eta > 0$ so that
  $ 3 eta + alpha < frac(s_0 - sigma, 2) \, #h(2em) eta < frac(alpha \( s_0 - sigma \), 2) . quad "(4.2)" $ <proj:radial-margins>
  We prove it at $sigma + eta$. A sufficiently fine finite power grid, the previous assertion in both orders of a pair, and removal of power-small exceptions give the following inherited estimates: at every retained pair the angular masses, at all radii from $beta$ to $1$, are bounded by $beta^(- tau)$ times the radius to the power $sigma$. Here $tau > 0$ is arbitrarily small and is chosen after the strict margins in (4.2). Bounds centered at surviving directions extend to all angular balls by enlargement.
  Suppose that angular bins of unrestricted target mass at least $beta^(sigma + eta)$ carry dense incidence even after this removal. Call such a bin #emph[dispersed] if its containing tube has $nu times nu$ mass at least $beta^(2 sigma + 3 eta)$ in pairs separated by at least $beta^alpha$. If the dispersed bins carry dense incidence, discard pins whose surviving dispersed target fiber has less than a subpower fraction of the target mass. The normalized remaining pin law satisfies the planar $s_0$ bounds. At each such pin $x$, normalize its surviving target fiber and push it forward by $y mapsto \[ y - x \]$. The inherited angular bounds make this pin’s direction law Frostman $sigma$, with arbitrarily small restriction losses. Sample the pins and then sample each of these direction laws, using the sampling and collision estimates above; choose comparable pencil cardinalities. Every selected tube is dispersed, up to a bounded enlargement, and the direction sets may vary with the pin. These are the pin set and incident pencils in Theorem 28. As its input losses tend to zero, it produces at least
  $ beta^(- \( s_0 + 3 sigma \) \/ 2 + o \( 1 \)) $
  distinct dispersed tubes. Here $min { s_0 + sigma \, \( s_0 + 3 sigma \) \/ 2 \, 1 + sigma } = \( s_0 + 3 sigma \) \/ 2$, since $sigma < s_0 lt.eq 1$.
  A separated subcollection of tubes gives the opposite bound. A pair of points at separation at least $beta^alpha$ belongs to at most $O \( beta^(- alpha) \)$ tubes of this subcollection: the admissible slopes occupy an interval of length $O \( beta \/ \| z - z' \| \)$, and for each slope only boundedly many intercept bins are possible. Integrating the separated-pair masses of the tubes therefore gives at most
  $ O \( beta^(- 2 sigma - 3 eta - alpha) \) $
  tubes. The first strict inequality in (4.2), followed by sufficiently small input losses in Theorem 28, contradicts the lower bound.
  It remains to consider nondispersed bins. If such a bin has mass $b gt.eq beta^(sigma + eta)$, averaging the separated-pair mass inside the bin gives a ball of radius $O \( beta^alpha \)$ containing all but
  $ O \( beta^(2 sigma + 3 eta) \/ b \) lt.eq O \( beta^(sigma + 2 eta) \) $
  of its unrestricted target mass. There are at most $O \( beta^(- sigma - eta) \)$ heavy bins per pin, so removing these outside portions costs $O \( beta^eta \)$ in pair mass. Dense incidence survives.
  At a target $y$ with a dense reverse fiber, each surviving pin $x$ now determines a tube carrying unrestricted target mass $gt.tilde beta^(sigma + eta)$ inside $B \( y \, C beta^alpha \)$: the surviving $y$ lies in the ball chosen for its bin, and doubling that ball about $y$ retains the same original target mass. If $z$ belongs to the same angular bin from $x$, boundedness of the ambient region gives
  $ lr(|det (z - y \, frac(y - x, \| y - x \|))|) lt.tilde beta . $
  For fixed $z$, the admissible reverse directions $\[ x - y \]$ therefore lie within $O \( beta \/ \| z - y \| \)$ of $\[ z - y \]$, with the trivial bound when $\| z - y \| lt.tilde beta$. Apply the inherited reverse angular estimate to this interval and integrate in $z$. Normalizing the dense reverse fiber costs only a subpower factor, so the average is at most
  $ & beta^(- 2 tau) integral_(\| z - y \| lt.tilde beta^alpha) min { 1 \, \( beta \/ \| z - y \| \)^sigma } thin d nu \( z \)\
 & thin lt.tilde beta^(sigma - 3 tau + alpha \( s_0 - sigma \)) . $
  To obtain the last line, split the integral into the ball of radius $beta$ and dyadic annuli between $beta$ and $C beta^alpha$, then use the planar Frostman bound; its exponent exceeds $sigma$. Taking $tau$ sufficiently small, the second inequality in (4.2) makes this upper bound power-smaller than $beta^(sigma + eta)$. This is again a contradiction.
  The averaging in the nondispersed case uses the original targets inside each angular bin; thus its discarded mass estimate does not presuppose that a restricted bin retains its original weight. On a dense reverse fiber the prior centered angular estimates remain valid after normalization, with only a subpower loss. These facts justify both removals used above.
  The improvement $eta$ can be chosen bounded below while $sigma$ stays a fixed distance below $s_0$. Starting from any exponent below $s_0 \/ 2$ and iterating finitely many times proves the assertion at every fixed exponent below $s_0$. At each step the desired output gap is fixed first, then the old angular losses and the Furstenberg-theorem input losses are chosen. A finite union of the exceptional sets proves the simultaneous-grid assertion. ◻
]

=== 4.3 Scalar consequences for entropy tangents <scalar-consequences-for-entropy-tangents>

In the order of the coordinates in (3.1), write the full partial derivatives as

$ \( p \, n_1 \, e \, g \, t \, r \) = \( partial_C F \, partial_B F \, partial_D F \, partial_A F \, partial_Y F \, partial_R F \) . $

Each of these six partials lies in $\[ 0 \, 1 \]$. Here $t = partial_Y F$ and $r = partial_R F$ are entropy rates; in (3.1) the same letters denote truncated parameters. To avoid imposing a false conclusion when the input rate vanishes, define, for $z > 0$,

$ f_z \( 0 \) = 0 \, #h(2em) f_z \( l \) = min { 1 \, z + l } quad \( l > 0 \) . $

#thm([Proposition 4.4.])[
  (Scalar projection inequalities).  #emph[At almost every point of the full alignment there is a tangent with constant full partials, representing the derivatives along the alignment, for which 
$ e gt.eq f_t \( p \) \, #h(2em) g gt.eq f_t \( n_1 \) \, #h(2em) n_1 gt.eq f_r \( p \) \, #h(2em) g gt.eq f_r \( e \) \, quad "(4.3)" $ <eq:source-16>

 whenever the corresponding subscript is positive.]
] <proj:scalar>

#proof[
  On the full alignment the six coordinate forms are
  $ C \, quad C + R \, quad C + Y \, quad C + Y + R \, quad Y \, quad R . $
  They are pairwise nonproportional and positive on a common vector. The peeling rule of Lemma 23, applied successively to extreme rays of the cone generated by these forms, makes each coordinate a singleton summand in a tangent. Hence the tangent is affine with the stated full partials.
  We give the normal-velocity/time test in detail. Choose a block length $ell > 0$ and a parent state $z_0$ on $A = B + Y$, with each of the other three slacks in (3.2) larger than $ell$. Keep $C \, D \, R$ fixed. Writing $upright(bold(e))_i$ for the coordinate vectors, compare these four refinements of $z_0$:
  $ upright("state") & upright("entropy increment from ") z_0\
z_(upright("sp")) = z_0 + ell \( upright(bold(e))_B + upright(bold(e))_A \) & ell \( n_1 + g \)\
z_(upright("par")) = z_0 + ell upright(bold(e))_Y & ell t\
z_(upright("joint")) = z_0 + ell \( upright(bold(e))_B + upright(bold(e))_A + upright(bold(e))_Y \) & ell \( n_1 + g + t \)\
z_(upright("out")) = z_0 + ell \( upright(bold(e))_A + upright(bold(e))_Y \) & ell \( g + t \) . $
  The spatial and output refinements preserve $A = B + Y$; the parameter and joint states lie on its admissible side. The chosen slacks make all four states admissible. Their increments are those of the affine tangent.
  Inside a common parent cell, subtract the known bin centers and normalize by the parent units. Let $v \, w$ be the two skew-normal spatial entries in the starting parameter frame, and let $a$ be the normalized time increment. The matched equality makes the position unit the product of the velocity and time units, so the output measurement is the scalar shear $w + a v$. The spatial state measures $\( v \, w \)$ and the parameter state measures $a$. Lemma 17 identifies their joint labels with $z_(upright("joint"))$ up to bounded ambiguity: the fine time label permits rebasing with the finely measured velocity. Center-dependent terms are known translations, and (3.2) bounds the remaining errors.
  Lemmas 18 and 22 turn these increments into hereditary support and weight bounds. At every fixed block subresolution, the spatial law is planar Frostman $n_1 + g$, the coefficient law is Frostman $t$, and their joint exponent is $n_1 + g + t$.
  We make the comparison with the actual marginal laws explicit. Let $mu_1 \, mu_2$ be the marginals of the same joint law, with support exponents $alpha \, beta$ and maximal joint-bin weight $m^(- alpha - beta + o \( 1 \))$. In any incidence of joint mass $rho = m^(- o \( 1 \))$, discard marginal bins with reference weights below $m^(- alpha - o \( 1 \))$ and $m^(- beta - o \( 1 \))$, choosing the threshold slack to tend to zero sufficiently slowly. The support bounds make their marginal masses, and hence the joint mass incident to them, $o \( rho \)$. Since the paired labels encode the joint cells up to bounded multiplicity, at least $rho m^(alpha + beta - o \( 1 \))$ pairs remain. Each has $mu_1 times mu_2$ weight at least $m^(- alpha - beta - o \( 1 \))$. Their total product mass is therefore at least $rho m^(- o \( 1 \)) = m^(- o \( 1 \))$. For the present labels take $alpha = n_1 + g$ and $beta = t$. This proves dense incidence for the actual Frostman marginals, also after the required subpower joint restrictions.
  Conditioning $z_(upright("out"))$ on $z_(upright("par"))$ leaves exponent $g$, so the projections occupy at most $m^(g + o \( 1 \))$ bins for typical fine time labels, where $m$ absorbs the block length. The parent and time-bin trims can be made negligible relative to this dense incidence. If $n_1 \, t > 0$, Lemma 29 gives
  $ g gt.eq min { n_1 + g \, \( n_1 + g + t \) \/ 2 \, 1 } . $
  If $g < 1$, the first and third entries of this minimum exceed $g$, so $g gt.eq n_1 + t$. If $g = 1$, the desired inequality is automatic. This proves $g gt.eq f_t \( n_1 \)$; the case $n_1 = 0$ is also automatic by the definition of $f_t \( 0 \)$.
  The other three tests use the following triples and shear maps:
  $ upright("cutoffs") & upright("matched face") & upright("projection")\
\( C \, D \, Y \) & D = C + Y & z + a x\
\( C \, B \, R \) & B = C + R & y - a x\
\( D \, A \, R \) & A = D + R & w - a z . $
  Here the unused cutoffs are fixed with strict slack, and $a$ denotes the parameter increment in the corresponding normalized units. The same joint-count and conditional-support calculation proves the remaining assertions. The shear update (3.3) controls the labels at the unused cutoffs; it does not require the normalized spatial law to be independent of the coefficient law. Only dense product incidence is used.
  The tangent is affine throughout its admissible domain. Placing a test on its matched face with slack at the other constraints leaves all six rates unchanged. The zero-input and saturated-output cases are automatic; in every other case the projection minimum gives the linear inequality that the output rate is at least the sum of the input and parameter rates. Thus each displaced test proves the assertion for the original constant rates. ◻
]

#thm([Proposition 4.5.])[
  (Conditional parameter profile at an increasing tie).  #emph[Suppose $lambda > 0$. At a generic point of the calibrated line one may take a further joint tangent in which the conditional parameter profile, referenced to zero at the center, is 
$ K \( Y \, R \) = s Y + theta \( R - lambda Y \)_(+) \, #h(2em) 0 lt.eq theta lt.eq s \/ lambda . quad "(4.4)" $ <eq:source-17>

 Consequently $t gt.eq s$ below the tie, while $r gt.eq theta$ and $t gt.eq s - lambda theta$ above it. The simultaneous parameter advance $\( Y \, R \) = \( u \, lambda u \)$ has rate at least $s$.]
  #emph[Let $Gamma$ be the plane $R = lambda Y$ inside full alignment. If $lambda eq.not 1$, the spatial partials can simultaneously be made singleton constants at generic points of $Gamma$. There (4.3) holds with time subscript $s$, and also with tilt subscript $theta$ when $theta > 0$.]
] <proj:parameter-profile>

#proof[
  The predictability statement of Section 3 gives $K \( Y \, R \) = s Y$ for $R lt.eq lambda Y$. Apply the increasing-coordinate trace rule proved with Lemma 25 to the two conditional parameter coordinates. A generic tangent along their increasing tie is affine on each of the two ordering half-planes. Continuity along $R = lambda Y$ forces its upper-side expression to be $s Y + theta \( R - lambda Y \)$. Monotonicity in $R$ and $Y$ gives $theta gt.eq 0$ and $s - lambda theta gt.eq 0$, respectively. This proves (4.4). Conditional parameter increments lower-bound the corresponding full-state increments, giving all the asserted rate bounds without an independence assumption.
  On $Gamma$ the spatial forms are
  $ C \, #h(2em) C + lambda Y \, #h(2em) C + Y \, #h(2em) C + \( 1 + lambda \) Y . $
  For $lambda > 0$, $lambda eq.not 1$, they are distinct, nonproportional forms, and the only remaining proportional group consists of the two parameters. Peeling separates the four spatial singletons, whose rates are constant throughout this tangent. At a generic full-alignment point on the lower side $R < lambda Y$, take a further realized tangent. It has the same four spatial rates, and the conditional-parameter increment bound gives its time rate at least $s$. Proposition 31 therefore gives the time inequalities with subscript $s$. At a generic full-alignment point on the upper side $R > lambda Y$, the same construction gives tilt rate at least $theta$ and the tilt inequalities with that subscript. The two further tangents may have different parameter partials, but both conclusions concern the original four constant spatial rates. They therefore hold simultaneously at the tie. ◻
]

=== 4.4 Products of correlated parameter differences <products-of-correlated-parameter-differences>

At $lambda = 1$ the forms $B$ and $D$ coincide on $Gamma$. Accordingly the preceding scalar tests alone do not separate their rates. We first prove the parameter fact needed for this case.

#thm([Lemma 4.6.])[
  (Product coefficients).  #emph[Let $nu$ be a law of pairs $d = \( r_d \, t_d \)$ in a bounded planar set. Assume its time marginal is Frostman $s$, its tilt marginal is Frostman $theta$ for some $theta > 0$, and $0 < s lt.eq 1$. Assume also that its simultaneous two-coordinate refinements have an affine hereditary profile of dimension at least $s$: in typical intermediate cells the normalized unrestricted increments satisfy the Frostman $s$ bounds at all subsequent fixed block subresolutions. For a pin $f = \( r_f \, t_f \)$ define 
$ Q_f \( d \) = \( r_d - r_f \) \( t_d - t_f \) . $

 The following alternatives suffice at every fixed finite grid of resolutions.]
  + #emph[If some strip of width $m^(- chi)$, with fixed $chi > 0$, has dense $nu$ mass, restrict $nu$ to that strip. At any fixed resolution $m^(- h)$ with $0 < h < chi$ sufficiently small, the coefficients $Q_f \( d \)$ have Frostman exponent $s$, up to subpower loss, on dense pairs away from the time diagonal.]
  + #emph[If every strip of each fixed power width has power-small mass, then for every $sigma < s$ and every fixed $h in \( 0 \, 1 \]$, pairs lying in coefficient bins of conditional mass greater than $m^(- h sigma)$ have power-small total mass. After removal of these exceptions on a sufficiently fine finite grid, the pinned coefficient laws satisfy Frostman bounds with exponent arbitrarily close to $s$ and arbitrarily small power loss.]
] <proj:product>

#proof[
  #strong[The dense-strip alternative.] Suppose first that a strip of width $m^(- chi)$ has dense mass. Its slope $a = d r \/ d t$ satisfies
  $ m^(- o \( 1 \)) lt.eq \| a \| lt.eq m^(o \( 1 \)) . $
  Indeed, if $\| a \| lt.eq m^(- epsilon)$ along a subsequence, its intersection with the bounded parameter region lies in a tilt interval of length $O \( m^(- epsilon) + m^(- chi) \)$. The positive tilt Frostman exponent makes its mass power-small. If $\| a \| gt.eq m^epsilon$, including the vertical case, use the time marginal instead. Since this applies to every fixed $epsilon > 0$, it proves the claim. Conditioning on the strip costs only a subpower factor in either marginal bound.
  On the strip write
  $ r = a t + b + e \, #h(2em) \| e \| lt.eq m^(- chi) sqrt(1 + a^2) = m^(- chi + o \( 1 \)) . $
  Uniformly in its pins and targets,
  $ Q_f \( d \) = a \( t_d - t_f \)^2 + O \( m^(- chi + o \( 1 \)) \) . $
  The time Frostman bound permits removal of pairs with $\| t_d - t_f \| < m^(- o \( 1 \))$, with the cutoff decreasing sufficiently slowly that the lost mass is negligible compared with every dense incidence being retained. On each sign branch of $t_d - t_f$ the quadratic has derivative of magnitude between $m^(- o \( 1 \))$ and $m^(o \( 1 \))$. At radii $rho gt.eq m^(- h)$, with fixed $h < chi$, the inverse image of a coefficient interval is therefore contained in at most two time intervals of length $m^(o \( 1 \)) rho$. The time marginal bound proves (i), also at all the intermediate radii needed for a projection test.
  ===== 4.4.1 Power-light strips and the conditional query law. <power-light-strips-and-the-conditional-query-law.>
  For (ii), the planar law is Frostman $s$, by the simultaneous refinement hypothesis. Lemma 30 therefore applies. Fix $sigma < s$ and $h > 0$. Suppose that pairs landing in bins of $Q_f$ of conditional mass at least $m^(- h sigma)$ carry dense incidence $E$. Condition the product law on this incidence. For each pin the conditioned output occupies at most $O \( m^(h sigma) \)$ bins, so, with $P_h$ the output bin,
  $ "H" \( P_h divides f \) lt.eq h sigma log m + O \( 1 \) . quad "(4.5)" $ <proj:product-upper>
  All entropies in the rest of this proof are under the conditioned law unless explicitly described as unrestricted.
  Choose $sigma < s' < s$ and divide $\[ 0 \, h \]$ into $J$ equal blocks of length $eta = h \/ J$. The integer $J$ will be large but fixed. Let $D_j$ be the target parameter cell at depth $j eta$, and let $P_j$ be the nested bin of $Q_f$ at that depth. For $j gt.eq 3$ we claim that, apart from a negligible conditioned mass,
  $ "H" \( P_(j + 1) divides f \, D_j \) gt.eq \( s' - epsilon \) eta log m - o \( log m \) \, quad "(4.6)" $ <proj:product-block>
  where $epsilon > 0$ is arbitrarily small. We verify carefully the conditioning and direction estimates behind this assertion.
  Use the hereditary parent estimates on this fixed block grid under the original target law $nu$, before conditioning on $E$. Choose their errors and parent-trim thresholds as in Lemma 18, so that the omitted original cell mass is negligible compared with the dense incidence being retained. For a remaining value $C$ of $D_j$, let $c$ be its center and let $mu_C$ be the normalized original restriction $nu \|_C$, expressed in the cell’s increment units. This #emph[unrestricted] law is Frostman $s$ at all the required block subresolutions. The following density trims compare the conditioned query and target fibers to this law. The map $psi_C \( v \) = c + m^(- j eta) v$ returns an increment to its physical target cell. Define the pulled-back incidence and its target fibers by
  $ E_C = { \( f \, v \) : \( f \, psi_C \( v \) \) in E } \, #h(2em) E_(C \, f) = { v : \( f \, v \) in E_C } . $
  The pin law $nu$ remains in the original parameter coordinates. Set
  $ alpha_C = \( nu times mu_C \) \( E_C \) . $
  After discarding cells with too small an incidence density, $alpha_C = m^(- o \( 1 \))$ in cells carrying almost all of the conditioned mass. To see this, the total incidence in cells with $alpha_C < rho$ is at most $rho$; choose the subpower threshold $rho$ much smaller than the original dense incidence. The query law in such a cell is
  $ q_C \( d f \) = frac(mu_C \( E_(C \, f) \), alpha_C) thin nu \( d f \) lt.eq m^(o \( 1 \)) nu \( d f \) . quad "(4.7)" $ <proj:query-domination>
  Another density trim ensures $mu_C \( E_(C \, f) \) = m^(- o \( 1 \))$ for almost all contributing queries. The same reasoning applies after any of the finitely many required power-small exceptional pair sets has been removed.
  ===== 4.4.2 Radial control of the query directions. <radial-control-of-the-query-directions.>
  The gradient of $Q_f$ at $c$ is
  $ nabla Q_f \( c \) = \( t_c - t_f \, r_c - r_f \) . $
  Thus its direction is the radial direction from $f$ to $c$ with the coordinates interchanged. Remove the exceptional pairs from Lemma 30, in both orders and at a fine grid of angular powers, using exponent $s'$, for the physical pairs $\( f \, psi_C \( v \) \)$. This removes a negligible fraction of the dense incidence. Direction estimates may be transferred from an actual surviving target $d in C$ to the center $c$. For comparison pins at distance at least $m^(- eta)$ from $c$, this changes the direction by
  $ O \( m^(- j eta) \/ m^(- eta) \) = O \( m^(- \( j - 1 \) eta) \) \, $
  which is below the block angular mesh for $j gt.eq 3$. Comparison pins closer than $O \( m^(- eta) \)$ have mass at most $m^(- eta s + o \( 1 \))$ by planar Frostman. The surviving queried pin itself can be required to be at distance at least $m^(- o \( 1 \))$ from the target, so its direction also changes by less than the block mesh. For a ball centered at a surviving query direction, choose its corresponding good target in $C$ and use its radial estimate. Enlarging the angular ball by the above errors bounds all the far comparison pins; the near ones have just been bounded separately. Re-centering balls extends the conclusion to every angular interval. In view of (4.7), the law of gradient directions under $q_C$ is consequently Frostman $s'$, with any prescribed small power loss down to the block mesh. The grids and prior losses are chosen sufficiently fine and small for that purpose.
  ===== 4.4.3 Collision bounds inside a target cell. <collision-bounds-inside-a-target-cell.>
  Here is the elementary projection-energy calculation in the normalized cell. Let $v \, v'$ be independent with law $mu_C$, and let $omega$ have the gradient-direction law. A projection collision at mesh $m^(- eta)$ requires $omega$ to lie in boundedly many angular intervals of total length $O \( m^(- eta) \/ \| v - v' \| \)$. Therefore its averaged probability is bounded by
  $ & m^(epsilon_0) integral.double min { 1 \, \( m^(- eta) \/ \| v - v' \| \)^(s') } thin d mu_C \( v \) d mu_C \( v' \)\
 & thin lt.eq m^(- eta s' + epsilon_1) . quad "(4.8)" $ <proj:collision>
  The last estimate follows by summing annuli and using the Frostman $s$ bound, with $s > s'$. Both $epsilon_0 \, epsilon_1$ can be chosen arbitrarily small compared with $eta$. Markov’s inequality gives this collision bound, with another arbitrarily small loss, for almost all queries. Restriction to $E_(C \, f)$ multiplies the collision probability by at most $mu_C \( E_(C \, f) \)^(- 2) = m^(o \( 1 \))$. Thus the estimate applies to the target fibers actually present in the conditioned incidence, rather than just to unrestricted increments.
  The gradient magnitude is at least $m^(- o \( 1 \))$ after the near-diagonal removal. Normalizing it changes the mesh to $m^(- eta + o \( 1 \))$, an admissible subpower change in (4.8). Taylor expansion gives, for bounded $v$,
  $ Q_f \( c + m^(- j eta) v \) = Q_f \( c \) + m^(- j eta) nabla Q_f \( c \) dot.op v + m^(- 2 j eta) v_r v_t . $
  The remainder is below the physical next resolution $m^(- \( j + 1 \) eta)$. Hence a bin of the nonlinear output is covered by boundedly many bins of the linearized output at the relevant normalized mesh. Finally, for bin probabilities $a_i$,
  $ - sum_i a_i log a_i gt.eq - log sum_i a_i^2 . $
  The collision estimate yields (4.6). The negligible removed conditioned mass is restored using entropy concavity. All bounds are averaged with respect to the actual conditional query laws, so no independence after conditioning has been assumed.
  ===== 4.4.4 Summing the output entropy increments. <summing-the-output-entropy-increments.>
  Because $Q_f$ is uniformly Lipschitz on the bounded parameter region, $D_j$ together with $f$ determines $P_j$ up to bounded ambiguity. Nested output bins also give
  $ "H" \( P_(j + 1) divides f \) - "H" \( P_j divides f \) & gt.eq "H" \( P_(j + 1) divides f \, D_j \) - "H" \( P_j divides f \, D_j \) . quad "(4.9)" $ <proj:product-chain>
  Indeed the left side is $"H" \( P_(j + 1) divides f \, P_j \)$, and conditioning further on $D_j$ can only decrease it. The subtracted right-hand term is $O \( 1 \)$. Sum (4.9) for $j = 3 \, dots.h \, J - 1$ and use (4.6). This gives
  $ "H" \( P_h divides f \) gt.eq \( J - 3 \) \( s' - epsilon \) eta log m - o \( log m \) . $
  Choose $J$ so large, and then $epsilon$ and all other losses so small, that $\( 1 - 3 \/ J \) \( s' - epsilon \) > sigma$. This contradicts (4.5).
  We have ruled out a subpower sequence of bad pair masses, and therefore proved a power-small bound at each fixed coefficient scale. Remove these exceptions on a finite fine grid. The conditional mass bound at the bin containing any surviving coefficient gives the centered Frostman bound there; an interval meeting the retained support is covered by a bounded enlargement centered at one of its points. Normalizing dense pin fibers and interpolating between grid powers costs an arbitrarily small power. This proves (ii). ◻
]

=== 4.5 The tied spatial pair <the-tied-spatial-pair>

We now return to the coincident spatial forms. The middle pair $\( B \, D \)$ remains one joint measurement. Overlaps of full spatial fibers will produce scalar projections with coefficients supplied by Lemma 33; no separate rates for the two tied coordinates are assumed.

#thm([Proposition 4.7.])[
  (The equal-slope tie).  #emph[Suppose $lambda = 1$ and $theta > 0$ in (4.4). At a generic point of $Gamma$ there is a tangent with singleton spatial rates $p \, g$, an affine diagonal rate $H$ for the pair $\( B \, D \)$, and an affine diagonal parameter rate. These rates satisfy 
$ g gt.eq f_s \( p \) \, #h(2em) H gt.eq f_s \( p \) . quad "(4.10)" $ <eq:source-18>

]
] <proj:tied>

#proof[
  On $Gamma$ the coordinate forms are $C$, $C + Y$ twice, $C + 2 Y$, and $Y$ twice. Peeling separates the singleton groups $C \, A$ and the paired groups $\( B \, D \)$ and $\( Y \, R \)$; each group has an affine restriction to its diagonal. This gives the claimed form. Write $J \( B \, D \)$ for the separated middle-pair summand of this actual tangent. On lower-side full alignment, $R < Y$ is equivalent to $B < D$. Further full-alignment tangents there preserve $p$ and have time rate at least $s$, so the scalar time test gives $partial_D J gt.eq f_s \( p \)$ almost everywhere in $B < D$. For $h > 0$, monotonicity in $B$ and integration of this $D$-bound give
  $ H h = J \( b + h \, b + h \) - J \( b \, b \) gt.eq J \( b \, b + h \) - J \( b \, b \) gt.eq h f_s \( p \) . $
  The integration first holds on almost every vertical segment; continuity includes every such segment and its boundary endpoint. This proves the inequality for $H$ without assigning separate $B \, D$ partials at the tie. If $p = 0$, both assertions in (4.10) are immediate. Assume from now on that $p > 0$.
  Take a block in a typical fully aligned parent on the tie. In normalized units write the spatial entries in its starting frame as $x \, y \, z \, w$, and fine parameter pairs as $d = \( r_d \, t_d \)$ with law $nu$. The parameter diagonal rate is at least $s$. Heredity makes its law Frostman of that diagonal dimension, also inside intermediate parameter cells at every later fixed subresolution. The time marginal is Frostman $s$, and the tilt marginal has exponent at least $theta > 0$, by (4.4) and the conditional-parameter lower bound. Thus the parameter laws satisfy the hypotheses of Lemma 33.
  Denote the parent by $z_0$ and the block length by $ell > 0$. With $upright(bold(e))_i$ denoting the coordinate vectors, set
  $ z_(upright("sp")) & = z_0 + ell \( upright(bold(e))_C + upright(bold(e))_B + upright(bold(e))_D + upright(bold(e))_A \) \,\
z_(upright("par")) & = z_0 + ell \( upright(bold(e))_Y + upright(bold(e))_R \) \,\
z_(upright("joint")) & = z_(upright("par")) + ell \( upright(bold(e))_C + upright(bold(e))_B + upright(bold(e))_D + upright(bold(e))_A \) . $
  The spatial increment of $z_(upright("sp"))$ has exponent $p + H + g$. Group additivity gives the same exponent for $z_(upright("joint"))$ conditional on $z_(upright("par"))$. The marginal-weight comparison in the proof of Proposition 31, with spatial exponent $p + H + g$ and the parameter diagonal exponent, therefore gives dense incidence under the product of the actual spatial and parameter marginals. Given the fine parameter label $d$, write the spatial entries in its frame as $x \, y_d \, z_d \, w_d$. The two further states
  $ z_(upright("par")) + ell \( upright(bold(e))_C + upright(bold(e))_A \) \, #h(2em) z_(upright("par")) + ell \( upright(bold(e))_B + upright(bold(e))_D + upright(bold(e))_A \) $
  have increments $ell \( p + g \)$ and $ell \( H + g \)$ from $z_(upright("par"))$. The remaining refinement from the first of these states to $z_(upright("joint"))$ costs $ell H$. All these states satisfy (3.2); in particular the fine parameters provide the slack for these partial spatial refinements.
  Lemma 17 rebases the full spatial labels using the known fine parameters, with bounded ambiguity. Lemmas 18 and 22, applied to these state pairs at every required block subresolution, make the conditional $\( x \, w_d \)$ law planar Frostman $p + g$. Its additional $\( y_d \, z_d \)$ fibers have support upper exponent $H$, and the output triples $\( y_d \, z_d \, w_d \)$ have support upper exponent $H + g$. We use these conditional laws before any overlap restriction.
  We spell out how the dense spatial overlaps carry the weights needed for Lemma 29. This also ensures that subsequent choices of parameters do not replace a weighted projection problem by a mere cardinality assertion. Let $m'$ be the base of the positive-length block presently used; it may be a fixed fractional block. In a typical parent, let $S_f$ be the coarse-frame spatial bins incident to a fine parameter bin $f$. Coarse-frame and fine-frame full spatial bins determine one another up to bounded coverings when $f$ is given. The exact truncated parameters are used in subtracting center-dependent translations, so large absolute centers create no new error.
  Put $L = p + H + g$. The common spatial universe is the support of the spatial label at $z_(upright("sp"))$, of size at most $\( m' \)^(L + o \( 1 \))$. For almost every tested $f$, $S_f$ has size $\( m' \)^(L + o \( 1 \))$, and every retained joint cell has pre-trim conditional weight at least $\( m' \)^(- L - o \( 1 \))$ given $f$. These conclusions follow from the support and maximal-weight bounds for $z_(upright("joint"))$ conditional on $z_(upright("par"))$, followed by discarding cells below the reciprocal-support threshold. The lower weights refer to this conditional law before that final discard. The exceptional fraction can be made negligible compared with any prescribed dense parameter restriction, by taking the threshold slack to zero sufficiently slowly. In particular the entire sets $S_f$ remain available after such a restriction.
  For any dense restriction of the parameter law, Cauchy–Schwarz in the common spatial universe gives
  $ integral.double \| S_f ∩ S_d \| thin d nu \( f \) d nu \( d \) & = sum_x (integral upright(bold(1))_(S_f) \( x \) thin d nu \( f \))^2\
 & gt.eq frac((integral \| S_f \| thin d nu \( f \))^2, \| upright("spatial universe") \|) gt.eq \( m' \)^(L - o \( 1 \)) . $
  Here $x$ in the sum denotes a full spatial cell, not only its first coordinate. Since the overlap upper bound is $\( m' \)^(L + o \( 1 \))$, a dense set of parameter pairs has overlaps of full exponent $L$. Power-small exceptional parameter pairs can be removed before selecting these overlaps.
  For one such pair $f \, d$, put $Delta r = r_d - r_f$ and $Delta t = t_d - t_f$. The shear update gives, to mesh accuracy,
  $ y_d & = y_f - Delta r thin x \, & z_d & = z_f + Delta t thin x \,\
w_d - Delta t thin y_d + Delta r thin z_d & = w_f + Delta t Delta r thin x . quad "(4.11)" $ <proj:overlap-identity>
  The last identity follows by substituting the first two into the full shear update, including its mixed term. Bounded bin errors produce only bounded mesh errors in normalized units.
  There are at most $\( m' \)^(p + g + o \( 1 \))$ $\( x \, w_f \)$ bins in the overlap. Discard those carrying fewer than $\( m' \)^(H - o \( 1 \))$ additional full cells, with the slack chosen sufficiently slowly. They account for a negligible fraction of an overlap of exponent $L$. Call the remaining input bins rich. Inside one rich input bin, the different full cells map to different triples $\( y_d \, z_d \, w_d \)$ up to bounded multiplicity: once $x$ is fixed to mesh accuracy, the frame change can be inverted from that triple. Thus a scalar value on the right of (4.11), attained in one rich input bin, uses at least $\( m' \)^(H - o \( 1 \))$ output triples. Scalar values separated by a sufficiently large mesh constant use disjoint triples, because the left side of that identity is determined to mesh accuracy by a triple. The total output support has size at most $\( m' \)^(H + g + o \( 1 \))$. Consequently the scalar projection
  $ \( x \, w_f \) mapsto w_f + Delta r Delta t thin x $
  of the rich subset has at most $\( m' \)^(g + o \( 1 \))$ bins.
  These rich subsets are dense for the original conditional $\( x \, w_f \)$ law. Indeed they retain $\( m' \)^(L - o \( 1 \))$ joint cells, each with pre-trim conditional weight at least $\( m' \)^(- L - o \( 1 \))$. Their total weight is therefore $\( m' \)^(- o \( 1 \))$, and their image consists of the corresponding coarse-accuracy input bins. The planar Frostman bound is the one before this final restriction, obtained from the matched $C \, A$ advances. The rich restriction costs only a subpower factor. This is the required passage from overlap counts to weighted point fibers.
  We now obtain enough coefficient directions. If $nu$ has dense mass in a strip of width $m^(- chi)$ for some fixed $chi > 0$, first restrict the parameters to this strip and repeat the overlap argument with the full spatial sets of the typical parameter bins. Use a fixed positive fractional block ending at depth $h < chi$ sufficiently small. Lemma 33(i) gives a Frostman $s$ law of $Delta r Delta t$ on dense pairs. The removed time-diagonal pairs have negligible mass compared with the dense overlaps. All spatial rate, fiber, and weight statements above apply at this fractional depth with $m' = m^h$.
  If there is no such strip restriction along the realizing sequence, pass to a subsequence on which every strip of each fixed power width has power-small mass. This dichotomy is obtained by inspecting the maximum strip mass on countably many fixed power grids; bounded mesh enlargements suffice. Lemma 33(ii) gives coefficient exponents arbitrarily close to $s$ off power-small exceptional pairs. Remove these pairs on the finite fine grid of coefficient resolutions before choosing a pin with dense overlap.
  In either case, averaging selects $f$ with densely many targets $d$ that have the coefficient Frostman bounds and the rich projected-input subsets just constructed. Parameter binning changes the coefficient only by mesh order. If several target bins produce the same coefficient bin, choose one corresponding rich input subset for that bin; each has the required dense mass for the same pre-trim conditional $\( x \, w_f \)$ law. Thus the coefficient marginal together with these rich subsets supplies dense product incidence for Lemma 29. The map from a bounded scalar coefficient to the associated projection direction is bi-Lipschitz in a bounded chart.
  Applying that lemma and letting all coefficient and restriction losses tend to zero yields
  $ g gt.eq min { p + g \, \( p + g + s \) \/ 2 \, 1 } . $
  Since $p > 0$, either $g = 1$, or the first and third terms exceed $g$ and the middle term gives $g gt.eq p + s$. In both cases $g gt.eq f_s \( p \)$, completing the proof. ◻
]

== 5 Excluding calibrated aspect paths <sec:aspect>

We complete the proof of Theorem 5. Suppose, to the contrary, that

$ q_(*) < 1 + 2 s - 10 kappa . quad "(5.1)" $ <asp:contradiction>

The preceding construction supplies a calibrated entropy profile and finite parameters

$ a gt.eq 0 \, #h(2em) b lt.eq 1 \, #h(2em) lambda = a - b . $

We may take further simultaneous tangents at generic points of the calibrated line. The support inequality, its equality on that line, the conditional parameter profiles, and the predictability statement survive these operations by Lemmas 20 and 22. All actual entropy profiles below have been regularized as in Lemma 18. Thus a “dense” restriction means a restriction of subpower relative mass, and support exponents used in a conditional block have the corresponding typical-bin weight bounds. These conventions also apply to iterated tangents.

The cases below exhaust the finite parameters supplied by the calibration. The table records their roles; every comparison is proved in the corresponding subsection.

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Aspect
], table.cell(rowspan: 1, colspan: 1)[Further distinction
], table.cell(rowspan: 1, colspan: 1)[Comparison mechanism
]),
  table.cell(rowspan: 1, colspan: 1)[$lambda = 0$
], table.cell(rowspan: 1, colspan: 1)[$a > 0$ or $a = 0$
], table.cell(rowspan: 1, colspan: 1)[Isotropic profile, radial test, and strip-axis reduction.
],
  table.cell(rowspan: 1, colspan: 1)[$lambda > 0$, $a > 0$
], table.cell(rowspan: 1, colspan: 1)[$theta = 0$; or $theta > 0$ with $lambda eq.not 1$ or $lambda = 1$
], table.cell(rowspan: 1, colspan: 1)[Longitudinal comparisons, pure-order costs, and the joint-coordinate tie.
],
  table.cell(rowspan: 1, colspan: 1)[$lambda > 0$, $a = 0$
], table.cell(rowspan: 1, colspan: 1)[Zero or positive full $C$-slope; for $theta > 0$, causal interior or boundary
], table.cell(rowspan: 1, colspan: 1)[Static-coordinate separation and a local constrained comparison.
],
  table.cell(rowspan: 1, colspan: 1)[$lambda < 0$
], table.cell(rowspan: 1, colspan: 1)[$a > 0$ or $a = 0$
], table.cell(rowspan: 1, colspan: 1)[Spatial axis prediction, constrained pure orders, and longitudinal comparisons.
],
)

Here $theta$ is the additional conditional axis rate in (4.4), not a spatial slope. The backward gain identity and reusable scalar comparisons are collected after the stationary case. All projection bounds below are applied to actual realizing profiles; pure envelopes provide only the ordered costs and overlap identities of Lemma 25.

=== 5.1 Stationary aspect <stationary-aspect>

#thm([Proposition 5.1.])[
  #emph[There is no calibrated profile satisfying (5.1) with $lambda = 0$.]
] <asp:stationary>

#proof[
  Here $0 lt.eq a = b lt.eq 1$, and we use the isotropic profile $F \( u \, z \, Y \)$ of (3.8), on $z lt.eq u + Y$. The reference-axis label is retained with the exact entropy cancellation (3.7); the later choice of a strip axis will also retain its earlier parent. Suppose first that $a > 0$. Take a generic tangent on the calibrated line and apply Lemma 25, with $u$ the only negative coordinate. Its pure profile is $P u$, where $P$ is constant and $partial_u F gt.eq P$ throughout the domain. For $T > 0$, run backwards from $\( 0 \, 0 \, 0 \)$ to $\( T \, 0 \, - T \)$, keeping $z = 0$, with the frozen velocity cutoff in the upper envelope sufficiently fine for this segment. The remaining time rate is at least $s$, so the support inequality and upper envelope give
  $ \( 2 - q_(*) \) T lt.eq F \( T \, 0 \, - T \) lt.eq \( P - s \) T . $
  Consequently
  $ q_(*) gt.eq s + 2 - P \, #h(2em) upright("and hence") #h(2em) P > 1 - s . $
  On the early side of the calibrated line, namely $u + a Y < 0$, $z = u + Y$, the support inequality and equality on the line imply an average bound $partial_u F + partial_z F lt.eq 2$ when integrating toward the line at fixed $Y$. Since $partial_u F gt.eq P > 1 - s$, there is a generic aligned point on this side with position rate $E := partial_z F < 1 + s$. Lemma 23 gives an affine tangent in the three isotropic coordinates there; denote its time rate by $tau gt.eq s$. Simultaneously retain a tangent at the calibrated point with the same velocity depth $u$, whose time depth is $- u \/ a$. This is later than the early point and has finer position depth. The two sites have the same physical velocity units, and the later profile still satisfies $partial_u F gt.eq P$.
  If $a = 0$, first peel off the constant coordinate on the line $u = 0 \, z = Y$. In a tangent,
  $ F \( u \, z \, Y \) = J \( u \) + H_0 \( z \, Y \) \, $
  where the second factor is defined on the full projected $\( z \, Y \)$-plane. At a further generic point on the line, the two-coordinate order rule makes $H_0$ affine on each order half-plane. On $z gt.eq Y$, write
  $ H_0 \( z \, Y \) = E z + tau Y . $
  Then $tau gt.eq s$ and $E + tau = q_(*)$, so $E < 1 + s$. At $Y = 0 \, u = z > 0$, the support inequality gives
  $ J \( u \) gt.eq \( 2 - E \) u . quad "(5.2)" $ <asp:J-prefix>
  The following projection block is based at the origin in this case. Choose any fixed point on $u = 0 \, z = Y$ with $Y > 0$ as the later site; the tests near it will use velocity depths near zero.
  We give the common block argument. Write $m$ for its base and let $b_0 in bb(R)^2$ be normalized velocity. Let $\( d \, c_0 \) in bb(R) times bb(R)^2$ be normalized time and position in the fine-time frame, after subtracting known translations. Position in the parent frame is therefore
  $ A_(b_0) \( d \, c_0 \) := c_0 - d b_0 $
  to mesh accuracy. The profile and its regularization give the following properties inside typical parents.
  + Velocity has a Frostman ball bound of some exponent strictly greater than $1 - s$. For $a > 0$ this follows from $partial_u F gt.eq P$; for $a = 0$ it follows from (5.2) at every tested prefix depth.
  + Velocity cells and time-position cells have dense product incidence. Indeed the refinements $\( u \, z \, Y \) = \( 1 \, 0 \, 0 \)$, $\( 0 \, 1 \, 1 \)$, and $\( 1 \, 1 \, 1 \)$ have additive joint exponents. The time-position exponent is $E + tau$.
  + Given a fine velocity bin $b_0$, the image under $A_(b_0)$ has a Frostman $E$ bound and at most $m^(E + o \( 1 \))$ bins. The fiber in one image bin has at most $m^(tau + o \( 1 \))$ time-position cells. These follow by testing $u = 1$, $0 lt.eq z lt.eq 1$, $Y = 0$, and the joint refinement, rebasing with the known velocity.
  Suppose that every strip of power-small width has power-small velocity mass. By Lemma 30, applied with a slightly smaller ball exponent at most one, directions $b - b_0$ have an angular Frostman exponent $sigma > 1 - s$ outside removable exceptional pairs. Product density and Cauchy–Schwarz give a pin $b_0$ and a dense set of such $b$’s that share a dense set of time-position cells with $b_0$. We may also arrange $\| b - b_0 \| gt.eq m^(- o \( 1 \))$.
  Fix one of these overlaps. Keep its rich $A_b$-bins, each containing at least $m^(tau - o \( 1 \))$ cells. The support upper bound for $A_b$ shows that these retain full overlap exponent $E + tau$. Inside a fixed $A_b$-bin the different cells give, up to bounded mesh multiplicity, different $d$-bins: once $d$ and $A_b$ are given, $c_0 = A_b + d b$ is known to the tested accuracy. Moreover
  $ A_(b_0) = A_b + \( b - b_0 \) d . $
  Since $\| b - b_0 \| gt.eq m^(- o \( 1 \))$, the rich bin therefore yields at least $m^(tau - o \( 1 \))$ distinct $A_(b_0)$-bins in one thick row parallel to $b - b_0$. Select perpendicular row labels separated by a sufficiently large mesh constant. Their collections of point bins are disjoint up to bounded multiplicity. There are at most $m^(E + o \( 1 \))$ point bins in all, so the perpendicular projection of the retained $A_(b_0)$’s has at most $m^(E - tau + o \( 1 \))$ bins.
  This restriction is dense for the Frostman image law, not merely large in cardinality. Indeed full overlap exponent $E + tau$, together with the fiber upper bound $tau$, gives $E - o \( 1 \)$ image exponent. The typical image bins have pre-trim weights at least $m^(- E - o \( 1 \))$, by Lemma 18. Thus the image restriction has subpower mass. We can consequently apply Lemma 29 to these direction-dependent restrictions. It is contradicted by
  $ E - tau < E \, #h(2em) E - tau < 1 \, #h(2em) E - tau < \( E + sigma \) \/ 2 . $
  The first inequality uses $tau gt.eq s > 0$, the second uses $E < 1 + s$, and the third follows from $E - 2 tau < 1 - s < sigma$. If $E - tau < 0$, the support upper bound itself is already impossible.
  It follows that, in a dense family of parents, a dense amount of velocity mass lies in strips of width $m^(- chi)$ for some fixed $chi > 0$, after subselection. Here the choice need not use one exceptionally rare parent. To see this, average the maximal conditional strip mass over the parents, using finite grids and bounded strip enlargements. If no fixed width power had subpower average along a subsequence, each such average would be power-small. Markov’s inequality and diagonal selection over countably many width powers would produce typical parents with all strips power-light, contrary to the block argument. We retain the selected strip mass across the parents, choosing its axis separately in each parent.
  Choose a fixed neighborhood of the later site in which the time and position cutoffs remain finer than those of the earlier parent. Use the resulting parallel and normal coordinates there, and include the earlier parent label. At later isotropic states with positive velocity refinement, this label is recoverable up to bounded ambiguity. Both time and position are finer than at the earlier parent; rebasing position backwards multiplies velocity uncertainty by at most the earlier time resolution. The label includes the earlier time bin, spatial bins, and any fixed original slope label. Once it is known, the strip axis is fixed, and switching isotropic grids costs only bounded multiplicity. Thus the later isotropic profile and calibration are preserved under the dense restriction.
  The conditional time rate is also preserved. Given the base label, the fixed original slope label, and a later time prefix, the earlier parent time and its spatial bins, hence its selected axis, are already determined. Conditioning on these extras therefore consumes no further time increment. The linear frame change in velocity is used for position in the matched units as well: position units are velocity units times the corresponding time unit. In the two-site construction only the time and position units change between the sites. This retains the scalar shear relation. Lemma 22 allows these tests to be realized simultaneously, with errors negligible in the final block units.
  Now take mixed velocity depths $l_1 \, l_2 in \( 0 \, chi \)$, with position depths $l_i + Y$. Given the parent, the normal velocity rate is zero throughout this depth window. The parallel velocity rate is at least $P$ if $a > 0$, and at least $J' \( l_1 \)$ almost everywhere if $a = 0$. For completeness, this lower bound is valid also at the aligned faces used in projection tests. Compare a short parallel increment with the same increment after making time and both position cutoffs finer, with the two position cutoffs equal and with strict slack. At the finer state change the normal velocity cutoff to the parallel cutoff at both endpoints; this costs zero while both depths remain in $\( 0 \, chi \)$. The resulting isotropic increment has the asserted lower rate. Dropping the extra conditioning can only increase that increment by submodularity. Valid interior comparisons pass to the aligned tangents by continuity.
  Whenever this parallel rate exceeds $1 - s$, its aligned position rate equals one by the scalar projection test (4.3), now in the fixed axes. The distinct velocity, position, and time forms can be peeled at generic mixed aligned states, so these are full partial rates there.
  For $a > 0$, start on the later calibrated path with equal velocity depths $l_1 = l_2 = l in \( 0 \, chi \)$. Choose the backward duration small enough to stay in the chosen neighborhood and to keep both depths in $\( 0 \, chi \)$. Hold the parallel depth $l_1$ fixed and increase the normal depth $l_2$ at speed one. Then the normal position depth $l_2 + Y$ is fixed, while the parallel position depth decreases at speed one. The normal velocity has zero rate, so time contributes at least $s$ and parallel position contributes one. The advancing normal depth is the larger width depth and therefore has coefficient $1 - kappa$ in the ellipse support term. Thus the profile minus the ellipse width term decreases backwards at rate at least
  $ 2 + s - kappa . quad "(5.3)" $ <asp:stationary-gain>
  To integrate generic derivatives, perturb the isotropic starting depth and starting time slightly. The resulting segments sample all three mixed alignment parameters. Integrate on generic segments and pass back by Lipschitz continuity. Parent recoverability holds throughout because the starting velocity depths remain inside the strip window. The initial equality and support now contradict (5.1).
  For $a = 0$, (5.2) supplies arbitrarily small positive $l$ with $J' \( l \) > 1 - s$, on a set of positive measure. Fix a positive comparison duration within the chosen later neighborhood and smaller than $chi \/ 2$. For each sufficiently small such generic $l$, set both initial depths to $l$ and use generic later starting times. The error of the initial isotropic state against the calibrated value is $O \( l \)$, and including the parent adds no error in exponent. Sending $l$ to zero with the duration fixed again contradicts (5.1), since $2 + s - kappa > 1 + 2 s - 10 kappa$ for $s lt.eq 1$. ◻
]

=== 5.2 Gain and scalar backward comparisons <gain-and-scalar-backward-comparisons>

Henceforth $lambda eq.not 0$. Set

$ u_(*) = 1 - s \, #h(2em) h = \( 1 + s \) \/ 2 \, #h(2em) k_C = 1 + kappa \, #h(2em) k_B = 1 - kappa . $

Testing states are fully aligned unless indicated otherwise:

$ R = B - C \, #h(2em) D = C + Y \, #h(2em) A = B + Y . $

Put $cal(H) = F - k_C C - k_B B$, and write $z \( y \)$ for a fully aligned state with $Y = y$. A backward segment of duration $T$ starts at $z \( 0 \)$ and ends at $z \( - T \)$; its #emph[gain] is $cal(H) \( z \( 0 \) \) - cal(H) \( z \( - T \) \)$. Prescribe velocities by $C' = - v_1$, $B' = - v_2$, where primes denote forward $y$-derivatives. Recall that

$ \( p \, n_1 \, e \, g \, t \, r \) = \( partial_C F \, partial_B F \, partial_D F \, partial_A F \, partial_Y F \, partial_R F \) . $

The forward $y$-derivative of $cal(H) \( z \( y \) \)$ is

$ t + \( v_1 - v_2 \) r - v_1 p - v_2 n_1 + \( 1 - v_1 \) e + \( 1 - v_2 \) g + k_C v_1 + k_B v_2 . quad "(5.4)" $ <eq:source-19>

Indeed $R' = v_1 - v_2$, $D' = 1 - v_1$, and $A' = 1 - v_2$. Integrating this derivative over $\[ - T \, 0 \]$ gives the gain. With the increasing backward clock $tau = - y$, the potential in Lemma 27 is $- cal(H) \( z \( - tau \) \)$. At a calibrated start, referenced to zero, (3.5) gives $cal(H) \( z \( - T \) \) gt.eq - q_(*) T$, so the gain is at most $q_(*) T$. If an upper envelope $U gt.eq F$ from (3.9) agrees with $F$ at the start, its endpoint gain is a lower bound for the actual gain. An initial error tending to zero is harmless.

We make precise how rates on generic sheets will be used. A singleton rate obtained by peeling is a constant full partial in that tangent; a group rate is the derivative along its specified diagonal. To integrate an inequality valid on a sheet-open region, first integrate on almost all slightly translated parallel segments and then pass to the chosen segment by Lipschitz continuity. This also transfers an inequality to a boundary approached from the indicated side. Subsequent off-sheet tests of a singleton-affine tangent retain that singleton rate.

In particular, let $Gamma$ be the fully aligned plane $R = lambda Y$ when $lambda > 0$. For $lambda eq.not 1$, its spatial partials are singleton constants in a generic first tangent, and the parameter diagonal $\( Y \, R \) mapsto \( Y + z \, R + lambda z \)$ has rate at least $s$. The latter lower bound can be tested with spatial cutoffs fixed in the interior of the separated tangent. Projection tests on its two sides supply the subscripts $s$ and $theta$ of (4.4) simultaneously. When $lambda = 1$, the corresponding grouped conclusion is (4.10). These facts hold in tangents based anywhere on the tie, not only on the equality line.

#thm([Lemma 5.2.])[
  (Scalar comparison).  #emph[Suppose a local restriction of an inherited profile has grouped coordinates $X \, y \, Z$, with domain $Z lt.eq X + y$, and no other local constraints. The groups consist of disjoint nonnegative coordinate increments of the underlying profile; additional fixed coordinates are allowed. At generic aligned points write their rates as $d_X \, d_y \, d_Z$. Suppose, also in the tangent tests at the path points under consideration, that 
$ d_y gt.eq t_0 \, #h(2em) d_X > u_(*) \/ 2 med arrow.r.double med d_Z gt.eq h . quad "(5.5)" $ <eq:source-20>

 For $k in { k_C \, k_B }$, the gain of this scalar profile minus $k X$ can reach rate $t_0 + h - kappa$, with arbitrarily small further loss. More precisely, along every path on $Z = X + y$, parametrized by $y$ and with $- X' \( y \) in \[ rho \, 1 - rho \]$, almost every point admits arbitrarily short straight backward comparisons with this rate, up to a loss tending to zero with $rho$, and with velocity in the same interval.]
] <asp:scalar>

#proof[
  Apply Lemma 25 separately along the path under consideration. The negative coordinate is $X$; $y \, Z$ strictly increase. Slack is obtained by shifting $y$ more than $Z$. At almost every path point the resulting tangent has pure slope $p_0$, and $d_X gt.eq p_0$. If $p_0 > u_(*) \/ 2$, velocity zero gives rate at least $t_0 + h$ by (5.5).
  If $p_0 lt.eq u_(*) \/ 2$, use velocity one. In centered offsets its ray is $X = - y \, Z = 0 \, y < 0$. If $m in \[ rho \, 1 - rho \]$ is the original path speed, choose $beta in \( y \/ m \, y \)$. Then
  $ - y > - m beta \, #h(2em) y > beta \, #h(2em) 0 > \( 1 - m \) beta . $
  These inequalities give the overlap condition of Lemma 25, locally up to alignment. Thus $d_X = p_0$ on the comparison ray, and integration gives rate at least
  $ t_0 + k - p_0 gt.eq t_0 + 1 - kappa - u_(*) \/ 2 = t_0 + h - kappa . $
  Perturb velocities zero and one into the permitted interval. The loss is arbitrarily small by the Lipschitz bounds. The strict comparison in the tangent gives arbitrarily short comparisons in the original profile. Any additional linear contribution to the gain is included in these same endpoint calculations. ◻
]

#thm([Lemma 5.3.])[
  (Longitudinal comparisons).  #emph[The following two comparisons are available locally, and in inherited path tangents, under the stated derivative and conditional-time bounds.]
  + #emph[#emph[Low longitudinal rate.] Fix $v_1 = 1$, so $D = d'_0$ is constant. Suppose the backward cost of the varying $C$-term has been bounded by $P lt.eq u_(*) \/ 2$ and removed. This may be done in the pure upper envelope when $B$ is not negative, or where $partial_C F = P$ exactly. If $t gt.eq s$ in the local region, the total gain can reach $1 + 2 s - kappa$, with arbitrarily small further loss.]
  + #emph[#emph[High longitudinal rate.] Fix $v_1 = 0$, so $C = c'_0$ is constant. Suppose $p gt.eq P > u_(*) \/ 2$ in neighborhoods of the aligned states being visited, up to the domain constraints, and $t gt.eq s$. The same gain $1 + 2 s - kappa$ is available.]
] <asp:longitudinal>

#proof[
  For the low comparison use the scalar groups
  $ X = B \, #h(2em) y = Y \, #h(2em) Z = A = R + d'_0 . $
  For the upper envelope (3.9), the remaining function is
  $ F^(+) \( Q \) = F \( n \( - H_0 \) \, Q \) - G \( n \( - H_0 \) \) . $
  Its rates are those of the actual frozen-cutoff slice $Q mapsto F \( n \( - H_0 \) \, Q \)$, since the subtracted term is constant. Choose $H_0$ sufficiently large for all the following compact tests; in particular $C$ is fixed sufficiently fine in this slice. Any additional negative $D$ is held fixed in the pure part; in the remaining part it is either $d'_0$ or fixed finer, with $D < C + Y$. In the exact-slope version $F - P C$ is locally independent of $C$. Freeze $C$ at a slightly finer value to obtain strict slack for $B < C + R$ and $D < C + Y$; on alignment this auxiliary slice agrees with the remainder up to a constant.
  To verify (5.5), retain $R \, A$ separately with $A lt.eq D + R$, $A lt.eq B + Y$, while the other faces have slack. At a generic scalar aligned point in any path tangent, peel off the singleton rates for $B \, Y$; the $\( R \, A \)$-summand has affine diagonal rate. Increase $R$ separately to open $A < D + R$, retaining $A = B + Y$. The time-projection block for $\( B \, Y \, A \)$ gives $g gt.eq f_s \( n_1 \)$. Its fixed $D$-measurement rebases under time refinement with bounded ambiguity because $C$ is fine. The two marginal laws and their dense product relation are the comparable-cutoff laws of Lemma 18; thus this is the actual sheared block test. If $d_X = n_1 > u_(*) \/ 2$, it follows that $g gt.eq h$. The direction increasing $B \, R \, A$ together preserves $A = B + Y$ and has rate $n_1 + r + g gt.eq n_1 + h$. Integrate this inequality on the displaced matching slices and pass back by continuity to the $\( R \, A \)$-grouped slice. There the same direction has rate $n_1 + d_Z$. The peeled singleton $n_1$ is constant on both slices, so subtraction gives $d_Z gt.eq h$. The conditional parameter increment with $C \, D$ fixed gives $d_y gt.eq s$.
  These constructions also apply after the signed-path tangent: take simultaneous tangents of the indicated auxiliary slices, which have actual realizing states. When freezing $C$ is only local, cover the open path portion by countably many neighborhoods with a single valid frozen value on each. Lemma 36 with $t_0 = s$ now gives total rate at least
  $ s + h - kappa + k_C - P gt.eq 1 + 2 s - kappa . $
  For the high comparison the scalar groups are
  $ X = B = R + c'_0 \, #h(2em) y = Y = D - c'_0 \, #h(2em) Z = A . $
  At full-aligned generic states, $e gt.eq f_s \( p \) gt.eq h$. Hence the $y$-group has rate at least $s + h$. If $g < h$, the projection inequalities imply $n_1 lt.eq u_(*) \/ 2$. They also force $r = 0$: otherwise $g gt.eq f_r \( e \) gt.eq h$, a contradiction.
  We justify transfer to the grouped slice, including its path tangents. At a generic scalar aligned point, first peel off the fixed coordinate $C$ by a direction increasing every other coordinate; then separate the $X \, y \, Z$ groups. Their distinct forms are positive on a common vector. The $A$-rate is therefore a constant singleton in this first tangent. Test full-aligned generic points on nearby translated sheets, allowing $C$ to vary. The aligned $y$-direction also advances $A$; subtracting its constant rate transfers $d_y = t + e gt.eq s + h$. If this singleton rate is less than $h$, the aligned $X$-direction, with the same subtraction, transfers $d_X = n_1 + r lt.eq u_(*) \/ 2$. Thus (5.5) holds with $t_0 = s + h$, and Lemma 36 gives $s + 2 h - kappa = 1 + 2 s - kappa$. ◻
]

Whenever a prescribed-length comparison is needed in a free region, apply Lemma 27 to these pathwise short steps, taking $rho$ small. If the construction occurs inside a tangent, its endpoint comparison is enough: the effective straight velocity lies in the convex velocity box, and the comparison passes back to arbitrarily short original steps. A linear closed half-space constraint passes back as well. Pure backward cost bounds may be integrated with the remaining gain, or subtracted at the final endpoint from an upper envelope that is exact at the start. Choose the additional endpoint, clipping, and control losses so that, together with the loss already incurred in the selected comparison, the total is less than $10 kappa$.

=== 5.3 Increasing aspect with positive longitudinal speed <increasing-aspect-with-positive-longitudinal-speed>

#thm([Proposition 5.4.])[
  #emph[There is no calibrated profile satisfying (5.1) with $lambda > 0$ and $a > 0$.]
] <asp:increasing-positive>

#proof[
  Take the conditional parameter tangent (4.4) and a further simultaneous signed-envelope tangent on the calibrated line. The negative coordinates are $C$, together with $B$ if $b > 0$ and $D$ if $a > 1$. Their pure domain is full: the parameters $R \, Y$ in mixed constraints increase, and negative cutoffs at an earlier path time can be paired with the other cutoffs at a later time. Large positive shifts in $R \, Y$ open the required slack. On compact aligned tests all negatives can be replaced by $n \( - H_0 \)$ in (3.9) for sufficiently large $H_0$. When relevant, the differences $C - B$ and $C - D$ of the shifted negatives increase strictly, since $a > b$ and $a > a - 1$.
  Let $P in \[ 0 \, 1 \]$ be the pure marginal rate of $C$. If $P = 0$, test the upper envelope backwards for unit time with $v_1 = M_0 \, v_2 = 0$, where $M_0$ is large and fixed. The $C$-cost is zero, $B$ is constant, and $Y \, A \, R$ decrease backwards. The only possible positive backward cost is that of $D$, at most $M_0 - 1$, whether it belongs to the pure or remaining profile. The gain is at least
  $ k_C M_0 - \( M_0 - 1 \) = 1 + kappa M_0 \, $
  contradicting support for large $M_0$. Comparisons along binding faces follow by translating the segments into the relative interior first. Henceforth $P > 0$.
  We divide the remaining proof into three cases. When $theta = 0$, we use longitudinal comparisons, upper-envelope tests, and full-alignment projection bounds. When $theta > 0$ and $lambda eq.not 1$, we use the projection inequalities on the tied plane and then separate the possible velocities. When $theta > 0$ and $lambda = 1$, the coincident spatial forms require the grouped projection bounds.
  ==== No additional conditional axis rate <no-additional-conditional-axis-rate>
  First suppose $theta = 0$, so $t gt.eq s$ everywhere. If $b lt.eq 0$ and $P lt.eq u_(*) \/ 2$, apply the low comparison of Lemma 37 to the upper envelope starting at zero. Its pure cost along $v_1 = 1$ is at most $P$, and any additional negative $D$ is constant. If $b lt.eq 0$ and $P > u_(*) \/ 2$, use the high comparison in the actual profile. On its backward paths from $C = 0$, the pure $C$-rate is $P$: if $D$ is negative, its value $D = y < 0$ is strictly coarser than $C = 0$ in normalized negative units. Thus $p gt.eq P$ locally at the visited states. Both comparisons contradict support.
  Suppose $b > 0$, and let $Q_1$ be the pure marginal of $B$. If $P + Q_1 lt.eq u_(*)$, the upper-envelope test $v_1 = v_2 = 1$ keeps $D \, A \, R$ fixed and costs at most $P + Q_1$ in the pure part. The remaining time rate is at least $s$, so its gain is at least $2 + s - \( P + Q_1 \) gt.eq 1 + 2 s$. If $Q_1 = 0$ and $P > u_(*)$, the pure profile is independent of $B$, and the high comparison has $p gt.eq P$ locally at its visited states, with any negative $D$ strictly coarser.
  The remaining possibility is $P \, Q_1 > 0$ and $P + Q_1 > u_(*)$. Consider the aligned sheet
  $ C = - a alpha \, #h(2em) B = - b alpha \, #h(2em) R = B - C \,\
Y = y \, #h(2em) D = C + y \, #h(2em) A = B + y . quad "(5.6)" $ <eq:source-21>
  Initially restrict to $y < alpha$. The free $y$-direction increases precisely $D \, A \, Y$, so at a generic point peeling splits off $\( C \, B \, R \)$. The remaining three forms are distinct, since $a \, b > 0$ and $a eq.not b$. Therefore $e \, g \, t$ are singleton constants in a first tangent. Keeping $Y$ fixed, use the two perturbations
  $ \( C \, B \, D \, A \, Y \, R \) & mapsto \( C + delta \, B \, D + delta \, A \, Y \, R - delta \) \,\
\( C \, B \, D \, A \, Y \, R \) & mapsto \( C \, B + delta \, D \, A + delta \, Y \, R + delta \) \, #h(2em) delta > 0 . quad "(5.7)" $ <asp:aligned-perturbations>
  They preserve full alignment and make $C$, respectively $B$, strictly finest among these two normalized negative depths. Any negative $D$ is strictly coarser because $y < alpha$, and remains so for sufficiently small $delta$. The pure lower bounds give $p gt.eq P$ on the first order side and $n_1 gt.eq Q_1$ on the second. The full-aligned projection tests therefore give the following bounds for the same singleton constants $e \, g \, t$:
  $ e gt.eq f_s \( P \) \, #h(2em) g gt.eq f_s \( Q_1 \) \, #h(2em) t gt.eq s . $
  The two clipped position bounds sum to at least $1 + s$: if neither clips their sum is $2 s + P + Q_1 > 1 + s$; if one clips the other is at least $s$. At fixed $alpha$, the gain is at least $1 + 2 s$. Integrate along generic sheet segments and let $alpha arrow.r 0$. This gives the contradiction on the backward ray $v_1 = v_2 = 0$, $y < 0$.
  ==== The tied plane for $theta > 0$, $lambda eq.not 1$ <the-tied-plane-for-theta0-lambdane1>
  Now assume $theta > 0$, $lambda eq.not 1$. At generic points of $Gamma$, the parameter diagonal rate is at least $s$, and
  $ e gt.eq f_s \( p \) \, #h(2em) g gt.eq f_s \( n_1 \) \, #h(2em) n_1 gt.eq f_theta \( p \) \, #h(2em) g gt.eq f_theta \( e \) . quad "(5.8)" $ <eq:source-22>
  Set
  $ K_L = p + e \, #h(2em) K_N = n_1 + g \, #h(2em) K_Sigma = K_L + K_N . $
  In particular $K_N gt.eq K_L$ and $g gt.eq e$. Parameterize $Gamma$ by $L_0 = C + a y$ and $y$, and average over thin strips on each side of $L_0 = 0$ in a fixed time interval. Integrating the support bound from the equality line gives average $K_Sigma lt.eq 2$ on the minus side and average $K_Sigma gt.eq 2$ on the plus side. For the gain on the tie with $v_1 = m \, v_2 = m - lambda$, formula (5.4) becomes
  $ cal(D)_Gamma \( m \) = upright("parameter diagonal rate") + e + g + m \( 2 - K_Sigma \) + lambda \( K_N - 1 + kappa \) . quad "(5.9)" $ <eq:source-23>
  The strip average of $cal(D)_Gamma \( a \)$ tends to $q_(*)$ on either side as the strip shrinks, by calibration and Lipschitz continuity. The plus-side average of $K_N$ is at least one.
  Write $P \, N_(-) \, E_(-)$ for the minus-side pure rates of the negative coordinates $C \, B \, D$, using zero for an absent negative coordinate. Here the $C$-rate is its marginal $P$, by the ordering of $L_0$ divided by the negative speeds. These are lower bounds for the actual partials. On the plus side let the pure rates be $p_(+) \, N_(+) \, E_(+)$. They are exact actual negative partials there. Indeed all negative cutoffs are strictly finer than the path at time $y$, while the other cutoffs are finer or equal; replacing the latter by their path values is valid. Increase all negatives strictly, with the $C$ increment at least as large as those of any negative $B \, D$. This preserves the constraints at both tuples. Overlap gives equality of the increment with its pure value. Each partial already has its pure affine order slope as a lower bound; in the peeled tangent, equality of this positive combination forces individual equality. Interior derivative comparisons pass to these tangents also at alignment.
  The weighted pure rate does not depend on the order:
  $ J = a P + b_(+) N_(-) + \( a - 1 \)_(+) E_(-) = a p_(+) + b_(+) N_(+) + \( a - 1 \)_(+) E_(+) . quad "(5.10)" $ <eq:source-24>
  The negative speeds in this use are distinct because $lambda eq.not 1$. Marginal maximality gives $p_(+) lt.eq P$. The minus-side averages imply
  $ P + max \( P + theta \, N_(-) \) lt.eq u_(*) \, #h(2em) P + E_(-) lt.eq 1 . quad "(5.11)" $ <eq:source-25>
  Here is the clipping argument. Since $K_N gt.eq K_L$, the average of $K_L$ on the minus side is at most one. If $P + s gt.eq 1$, then $K_L gt.eq P + 1 > 1$, a contradiction. Put $l = max \( f_theta \( P \) \, N_(-) \) > 0$. Then
  $ K_Sigma gt.eq P + \( P + s \) + l + f_s \( l \) . $
  If $l + s gt.eq 1$, this is at least $2 + 2 P > 2$. Thus $l + s < 1$, which also gives $P + theta < 1$ and $l = max \( P + theta \, N_(-) \)$. The average bound now gives $P + l lt.eq 1 - s$. Finally $K_L gt.eq P + E_(-)$ proves the second inequality. We will use
  $ 2 P lt.eq u_(*) \, #h(2em) P + N_(-) lt.eq u_(*) \, #h(2em) theta lt.eq u_(*) - 2 P . $
  When $s = 1$, these already contradict $P > 0$. Otherwise the following cases cover the present parameters.
  ===== 5.3.1 Case $a > 1$, $b lt.eq 0$. <case-a1-ble0.>
  On the plus side, direct expansion gives
  $ cal(D)_Gamma \( a \) gt.eq s + a - J + g + b \( 1 - K_N \) + kappa lambda . $
  The term with $b$ is nonnegative after averaging, because the plus-side average of $K_N$ is at least one. Also
  $ J = a P + \( a - 1 \) E_(-) lt.eq a - 1 + P . $
  If $E_(+) gt.eq s + P$, then $g gt.eq e = E_(+)$, giving average gain at least $1 + 2 s + kappa lambda$. If $E_(+) < s + P$, then $p_(+) + E_(+) lt.eq 2 P + s lt.eq 1$, and therefore
  $ J = \( a - 1 \) \( p_(+) + E_(+) \) + p_(+) lt.eq a - 1 + p_(+) . $
  When $p_(+) > 0$, $g gt.eq e gt.eq f_s \( p_(+) \) = s + p_(+)$, again giving the required gain. When $p_(+) = 0$, choose fixed $M_0 > a$ large and use $v_1 = M_0 \, v_2 = 0$ in the upper envelope. The negative tuple $\( C \, D \) = \( M_0 \, M_0 - 1 \)$ has the plus order, since
  $ frac(M_0 - 1, a - 1) > M_0 / a . $
  Its pure cost is at most $M_0 - 1$, and the varying remaining coordinates decrease backwards. The gain is at least $1 + kappa M_0$, contradicting support for large $M_0$.
  ===== 5.3.2 Case $a gt.eq 1$, $b > 0$. <case-age1-b0.>
  Here $0 < b lt.eq 1$. The exact plus-side rates give
  $ cal(D)_Gamma \( a \) & gt.eq s + a + b - J + \( 1 - b \) g + kappa lambda\
 & gt.eq s + 1 - P + b \( 1 - N_(-) \) + \( 1 - b \) g + kappa lambda \, $
  using $J lt.eq a - 1 + P + b N_(-)$. We have $1 - N_(-) gt.eq s + P$. If $N_(+) gt.eq P$, then $g gt.eq f_s \( N_(+) \) gt.eq s + P$ pointwise. If $N_(+) < P$, use $p_(+) lt.eq P$, $e lt.eq g$, and exactness to get $K_Sigma lt.eq 2 P + 2 g$. Since its plus-side average is at least two, the average of $g$ is at least $1 - P gt.eq s + P$. In both alternatives the average gain is at least $1 + 2 s + kappa lambda$. At $a = 1$, $D$ is absent from the negative group and its coefficient is zero, so the same displayed calculation applies.
  ===== 5.3.3 Case $0 < a lt.eq 1$, $b lt.eq 0$, $lambda > 1$. <case-0ale1-ble0-lambda1.>
  Only $C$ is negative, and $p = P$ exactly on the plus side. Formula (5.9) gives
  $ cal(D)_Gamma \( a \) - cal(D)_Gamma \( 1 \) = \( a - 1 \) \( 2 - K_Sigma \) \, $
  whose plus-side average is nonnegative. Moreover,
  $ cal(D)_Gamma \( 1 \) gt.eq s + 1 - P + g + \( lambda - 1 \) \( K_N - 1 \) + kappa lambda . $
  Here $g gt.eq e gt.eq s + P$, and the last $K_N - 1$ term is nonnegative in average. This again gives average gain at least $1 + 2 s + kappa lambda$.
  ===== 5.3.4 Case $0 < b < a < 1$. <case-0ba1.>
  We have $0 < lambda < 1$, and the negatives are $C \, B$. The plus-side rate $N_(+) = Q_1$ is the $B$-marginal. It is positive: if $Q_1 = 0$, then $N_(-) = 0$, and (5.10) gives $p_(+) = P > 0$, contradicting $n_1 = 0$ and $n_1 gt.eq f_theta \( p \)$ on the plus side.
  If $P + Q_1 gt.eq u_(*)$, use (5.6) with $alpha < y$. This is strictly causal, since $R = lambda alpha < lambda Y$. At a generic point its first tangent has singleton constants $e \, g \, t$. Apply the two perturbations (5.7), taking $delta < lambda \( y - alpha \)$ to preserve the strict causal inequality. The two negative orders give
  $ e gt.eq s + P \, #h(2em) g gt.eq f_s \( Q_1 \) \, #h(2em) t gt.eq s \; $
  the first bound is unclipped because $2 P lt.eq u_(*)$. For increasing $alpha \, y$ together, the gain rate is at least
  $ a + b + kappa lambda + s - J + \( 1 - a \) \( s + P \) + \( 1 - b \) f_s \( Q_1 \) . quad "(5.12)" $ <eq:source-26>
  To justify the cost $J$ at the negative-order tie, perturb within the tangent to $B \/ b > C \/ a$, equivalently $C + a R \/ lambda > 0$ on alignment. At $beta = R \/ lambda$ both negatives are strictly finer than the calibrated path, and all positives are finer or equal; in particular $Y > beta$, with the corresponding position margins. Replacing positives by their path values is valid, still with $B = C + R$. Ordered increases of $C \, B$, with the $C$-increment at least as large, preserve validity. Overlap gives exact negative rates on this open order side, with weighted sum $J$; these comparisons pass to the tangent. The remaining axis term $lambda r$ is nonnegative. Integrate the derivative bound on perturbed parallel segments that retain strict order, then approach the tie. This proves (5.12). Parallel sheets approaching $alpha = y$ transfer it to the calibrated rate.
  If $Q_1 gt.eq u_(*)$, subtract $1 + 2 s$ from (5.12), using $f_s \( Q_1 \) = 1$, to obtain
  $ & kappa lambda + a \( u_(*) - P \) - b N_(-) + \( 1 - a \) P\
 & #h(2em) = kappa lambda + a \( u_(*) - P - N_(-) \) + \( a - b \) N_(-) + \( 1 - a \) P gt.eq 0 . $
  If $0 < Q_1 < u_(*)$, the difference is
  $ & kappa lambda + P + Q_1 - u_(*) + a \( u_(*) - 2 P \) + b \( u_(*) - N_(-) - Q_1 \)\
 & quad = kappa lambda + \( 1 - b \) \( P + Q_1 - u_(*) \) + \( a - b \) \( u_(*) - 2 P \) + b \( u_(*) - P - N_(-) \) gt.eq 0 . $
  Each term has the stated sign by (5.11).
  If instead $P + Q_1 lt.eq u_(*)$, put $A_0 = u_(*) - \( p_(+) + Q_1 \) gt.eq 0$. The upper-envelope test $v_1 = v_2 = 1$ has pure cost $p_(+) + Q_1$, because its negative tuple $C = B = 1$ has the plus order. The remaining time rate is at least $s - lambda theta$. Its gain minus $1 + 2 s$ is therefore at least
  $ A_0 - lambda theta . $
  For a second test follow $cal(D)_Gamma \( 1 \)$ backwards from zero. Its ray has $L_0 = \( a - 1 \) y > 0$ for $y < 0$, so $p = p_(+)$, $n_1 = Q_1$ exactly, and $g gt.eq s + Q_1$, since $0 < Q_1 < u_(*)$. Formula (5.9) gives gain minus $1 + 2 s$ at least
  $ A_0 - lambda \( u_(*) - 2 Q_1 \) + kappa lambda . $
  One test suffices. If $Q_1 gt.eq u_(*) \/ 2$, the second expression is nonnegative. Otherwise set $d = u_(*) - 2 max \( P \, Q_1 \) gt.eq 0$. Then
  $ A_0 gt.eq u_(*) - P - Q_1 gt.eq d \, #h(2em) 0 lt.eq min \( theta \, u_(*) - 2 Q_1 \) lt.eq d . $
  Since $lambda < 1$, the larger of the two lower bounds is nonnegative even after discarding $kappa lambda$.
  ===== 5.3.5 Case $0 < a < 1$, $b lt.eq 0$, $0 < lambda < 1$. <case-0a1-ble0-0lambda1.>
  Only $C$ is negative, with $0 < P lt.eq u_(*) \/ 2$. Start at $C = B = L > 0 \, Y = 0$ on alignment, where $L$ is arbitrarily small and generic, and run backwards for unit time with
  $ C = L - y \, #h(2em) B = L + x \, #h(2em) v_2 = - x' in \[ rho \, 1 - rho \] \, #h(2em) R = x + y lt.eq lambda y . quad "(5.13)" $ <eq:source-27>
  Choose $rho$ small also relative to $1 - lambda$. These paths satisfy $0 lt.eq x lt.eq - y$. At $y < 0$, the actual $C$-partial is $P$ locally by overlap. Indeed $R gt.eq y$ and $lambda gt.eq a$ give $R \/ lambda gt.eq y \/ a$. Choose $beta in \( \( y - L \) \/ a \, y \/ a \)$. Then $C > - a beta$, and each of
  $ B = L + x \, quad D = L \, quad A = L + x + y \, quad Y = y \, quad R = x + y $
  is strictly finer than its path value at $beta$. For $B$ this uses $b lt.eq 0$; for $D \, A \, Y$ it uses $a < 1 \, b lt.eq 0 \, beta < y \/ a$; for $R$ it uses the preceding inequality. The comparison is valid in a neighborhood up to alignment.
  In the strict causal interior $t gt.eq s$, so the exact-slope low comparison gives the pathwise short steps. On the boundary $R = lambda y$, almost every $y$ is a peeling point of $Gamma$ for generic $L$: the map $\( L \, y \) mapsto \( C \, Y \) = \( L - y \, y \)$ is invertible, so Fubini applies. This exceptional set in $y$ is independent of the path, since its boundary state is determined by $L \, y$. In the first tangent there, $p = P$ and $g gt.eq s + P$. Use $v_1 = 1 \, v_2 = 0$ to enter the strict causal side backwards. There $t gt.eq s \, r gt.eq 0$, and the spatial rates are constant throughout the tangent. The gain reaches
  $ s + k_C - P + g gt.eq 1 + 2 s + kappa . $
  Perturb $v_2$ to $rho < 1 - lambda$ to retain the inward direction and the strict gain. Lemma 27 gives the endpoint contradiction, since the starting error tends to zero with $L$.
  ==== The coincident tie $lambda = 1$ <the-coincident-tie-lambda1>
  Finally suppose $lambda = 1 \, theta > 0$, with $P > 0$. Use paths on $Gamma$ through zero with $v_1 = m in \[ rho \, 1 - rho \]$, $v_2 = m - 1$. At $y < 0$ they have $C > 0$, $D = B < 0$. Thus $p gt.eq P$ locally: $C$ is strictly finest if $D \, B$ are also negative. Use the grouped domain
  $ B = D = Z_1 lt.eq C + Y \, #h(2em) A = Z_2 lt.eq Z_1 + Y \, #h(2em) R = Y . $
  Its parameter diagonal rate is at least $s$. The $Z_1$-diagonal rate $H$ and the $Z_2$-rate $g$ satisfy (4.10) at generic aligned states and in the relevant inherited tangents. The slice retains the binding alignment required by the tied projection argument.
  Along each path, $C$ alone decreases, while $Y \, Z_1 \, Z_2$ strictly increase. Take its signed tangent, with positive shifts of these latter coordinates opening both constraints, and let $p_0$ be the pure $C$-slope. Exactness in overlap somewhere, together with the inherited $p gt.eq P$, gives $p_0 gt.eq P > 0$. If $p_0 lt.eq u_(*)$, test $v_1 = 1 \, v_2 = 0$ on the tie. Its ray is $C = - y \, Z_1 = 0 \, Z_2 = y$; a path time strictly between $y \/ m$ and $y$ gives exact $p = p_0$, since the other grouped cutoffs are strictly finer. Its gain is at least
  $ s + k_C - p_0 + g gt.eq s + k_C - p_0 + \( s + p_0 \) = 1 + 2 s + kappa . $
  If $p_0 > u_(*)$, use $v_1 = 0 \, v_2 = - 1$. The pure lower bound and (4.10) give $H \, g gt.eq 1$, so the gain is at least
  $ s + H + 2 g - k_B gt.eq 2 + s + kappa gt.eq 1 + 2 s + kappa . $
  Integrate along nearby generic tie segments and perturb the endpoint values $m = 0 \, 1$ into $\[ rho \, 1 - rho \]$, retaining $v_2 = m - 1$. The tie and velocity box are preserved. These are the required pathwise control steps, giving the final contradiction in this case. ◻
]

#thm([Lemma 5.5.])[
  (Local constrained comparison).  #emph[Let an inherited full profile be based on the parameter tie, with $0 < lambda < 1$, $theta > 0$, the conditional profile (4.4), and the inherited tie projection inequalities. Suppose its full $C$-partial is a constant $P in \( 0 \, u_(*) \/ 2 \]$. Without requiring calibration of this profile, there is a backward endpoint comparison from its origin, respecting $R lt.eq lambda Y$, whose gain per unit time is at least $1 + 2 s - 4 kappa$. Its velocity is in a box with $v_1 = 1$ and $v_2 in \[ rho \, 1 - rho \]$, for sufficiently small $rho > 0$.]
] <asp:constrained>

#proof[
  Use the paths (5.13) from a small generic $C = B = L \, Y = 0$. In the strict causal interior the constant full $C$-slope and $t gt.eq s$ supply the low longitudinal comparison. At generic boundary points, the tie inequalities give $g gt.eq s + P$, and the spatial singleton rates in the first tangent are constant. The backward direction $v_1 = 1 \, v_2 = 0$ enters the strict causal side and has gain at least $s + k_C - P + g gt.eq 1 + 2 s + kappa$. Perturbing to $v_2 = rho < 1 - lambda$ retains this strict gain. The generic-$L$ argument in Proposition 38 gives these steps almost everywhere along every admissible path, including its boundary epochs. Lemma 27 therefore gives a fixed-duration endpoint comparison, with arbitrarily small additional loss.
  Translate both endpoints by the same aligned depth shift to move the start from $L$ to zero. This changes the gain by $O \( L \)$; it does not alter $R \, Y$, so it preserves the half-space. Choose $L$ and the further clipping and control losses so that, together with the $kappa$-loss in the low longitudinal comparison, the total loss per unit time is less than $4 kappa$. The straight endpoint displacement lies in the convex velocity box and respects the half-space. It consequently certifies a short step upon passing back from a tangent. ◻
]

=== 5.4 Increasing aspect with zero longitudinal speed <increasing-aspect-with-zero-longitudinal-speed>

#thm([Proposition 5.6.])[
  #emph[There is no calibrated profile satisfying (5.1) with $lambda > 0$ and $a = 0$.]
] <asp:increasing-zero>

#proof[
  Here $b = - lambda$. Take (4.4) and peel off the constant coordinate $C$ in a generic calibrated tangent; all other coordinates strictly increase. Its additive contribution is a function of $C$ alone. Use aligned backward paths through zero with
  $ rho lt.eq v_1 lt.eq M_0 \, #h(2em) - \( lambda + 1 \) lt.eq v_2 lt.eq 1 \, $
  where $M_0$ is fixed sufficiently large relative to $lambda$ and $1 \/ kappa$. If $theta > 0$, impose $R lt.eq lambda Y$. Along every such path, the $C$-summand is differentiable almost everywhere because $C$ moves monotonically with speed at least $rho$. In a tangent there its full slope $p$ is constant. We verify the control property in this tangent.
  If $p = 0$, take $v_1 = M_0 \, v_2 = 0$. After removing $C$, the only backward cost is at most $M_0 - 1$, from $D$, and the gain is at least $1 + kappa M_0$. Taking $M_0 gt.eq lambda$ also preserves the causal half-space at its boundary. Suppose $p > 0$. If $theta = 0$, or at a strictly causal state, $t gt.eq s$ throughout a neighborhood and its tangents. Use the low longitudinal comparison for $p lt.eq u_(*) \/ 2$ and the high comparison for $p > u_(*) \/ 2$, perturbing $v_1 = 0$ to $rho$ in the latter.
  It remains to consider boundary states with $theta > 0$. The path point need not be generic on $Gamma$. Its tangent nevertheless has constant full $C$-slope $p$. Each of the first three cases below chooses a fixed tie direction using only $p \, lambda$. Its gain bound holds at generic points of the tangent’s tie; integrate on nearby generic parallel tie segments and pass by continuity to the segment from the tangent origin. This gives the endpoint comparison required by Lemma 27. The fourth case supplies such a comparison directly.
  + For $lambda = 1$, use (4.10). If $0 < p lt.eq u_(*)$, the tie test $v_1 = 1 \, v_2 = 0$ has gain at least $s + k_C - p + \( s + p \) = 1 + 2 s + kappa$. If $p > u_(*)$, the test $v_1 = 0 \, v_2 = - 1$ has gain at least $s + 1 + 2 - k_B$. Perturb along the tie; in the second test use $v_1 = rho \, v_2 = rho - 1$.
  + For $lambda eq.not 1$, $p > u_(*) \/ 2$, the spatial inequalities (5.8) give $e \, g gt.eq h$ and $K_N gt.eq K_L gt.eq 1$. Formula (5.9) with $m = 0$ gives at least $s + 2 h = 1 + 2 s$. A small tie perturbation makes $v_1 gt.eq rho$.
  + For $lambda > 1$, $0 < p lt.eq u_(*) \/ 2$, take $m = \( lambda + 1 \) \/ 2$ on the tie. Formula (5.9) gives
    $ cal(D)_Gamma \( m \) gt.eq s + 1 - p + g + frac(lambda - 1, 2) \( K_N - K_L \) + kappa lambda . $
    Here $g gt.eq p + s$, since $p + s lt.eq h lt.eq 1$, and the difference term is nonnegative. The rate is at least $1 + 2 s$, and the velocities fit the chosen box.
  + For $0 < lambda < 1$, $0 < p lt.eq u_(*) \/ 2$, use Lemma 39, with its constant full $C$-slope $P = p$. This enters or follows the causal region and gives a strict endpoint comparison in the tangent.
  All these comparisons, including any secondary control construction inside a tangent, retain a fixed positive margin over $q_(*)$ after the chosen losses. Their endpoint displacements lie in the convex velocity box and respect the constant half-space constraint. Lemma 27 therefore contradicts (3.5) for the original paths. ◻
]

=== 5.5 Decreasing aspect <decreasing-aspect>

#thm([Proposition 5.7.])[
  #emph[There is no calibrated profile satisfying (5.1) with $lambda < 0$.]
] <asp:decreasing>

#proof[
  Write $c = b - a = - lambda > 0$. Then $0 lt.eq a < b lt.eq 1$. We have $t gt.eq s$ everywhere. The negative coordinates on the calibrated line are $B \, R$, and $C$ when $a > 0$. Take the signed-envelope tangent with the slack shifts described in Lemma 25. In this case it is essential to retain the additional prediction (3.6).
  First suppose $a > 0$. The pure domain is $B lt.eq C + R$. Let $P$ be the constant pure $C$-partial on $C \/ a > max { B \/ b \, R \/ c }$, and let $S$ be the constant pure $R$-partial on $R \/ c > max { C \/ a \, B \/ b }$. Lemma 25 supplies these constants and makes each a global upper bound for its corresponding pure partial. On the aligned sector in which $C$ is ahead, $C \/ a > R \/ c$ and $B = C + R$, the pure profile has the form
  $ G \( C \, B \, R \) = P C + Q_2 B quad "(5.14)" $ <eq:source-28>
  after referencing at zero, with constant $Q_2 gt.eq 0$. To prove this identity, note first that $C \/ a > B \/ b$ as well, since $B \/ b = \( a \/ b \) \( C \/ a \) + \( c \/ b \) \( R \/ c \)$. The pure $C$-rate is consequently $P$. The pure $R$-rate is zero there. Indeed in the external slices used to construct the pure profile, (3.6) gives flatness in $R$ when $C \/ a \, B \/ b > R \/ c$; the other coordinates are fixed strictly finer. This flatness holds on an open order region of the slice tangents and passes to $G$.
  Thus varying $C$ from the order tie at fixed $B$, with $R = B - C$, has slope $P$. On the tie, $C = \( a \/ b \) B$, the pure total is affine. Integrating from it proves (5.14). Nonnegativity of the $B$-increment gives $Q_2 gt.eq 0$. The same $B$-rate holds locally in the interior: the $C \, R$ partials there are constant, and one can approach the aligned boundary keeping $B$ fixed. Thus the partials of $G$ near this aligned sector are $\( P \, Q_2 \, 0 \)$ in the $\( C \, B \, R \)$ coordinates. The signed-envelope lower comparison gives $p gt.eq P$ and $n_1 gt.eq Q_2$ for the actual profile.
  The shift to $n \( - H_0 \)$ in (3.9) is valid on compact aligned tests because $a \, b \, c > 0$. If $P = 0$, use $v_1 = M_0 \, v_2 = 0$ backwards from zero. The target pure tuple is $C = M_0 \, B = 0 \, R = - M_0$, in the $C$-ahead sector, so (5.14) gives zero pure cost. The remaining cost is at most $M_0 - 1$, from $D$; the other varying remaining coordinates decrease backwards. Thus the gain is at least $1 + kappa M_0$, contradicting support for large fixed $M_0$.
  If $P + Q_2 lt.eq u_(*)$, use $v_1 = v_2 = 1$. Its pure tuple $C = B = 1 \, R = 0$ is again in the $C$-ahead sector and costs $P + Q_2$. The coordinates $D \, A$ are fixed, while the remaining time rate is at least $s$. The gain is therefore at least $2 + s - \( P + Q_2 \) gt.eq 1 + 2 s$.
  If $P \, Q_2 > 0$ and $P + Q_2 > u_(*)$, use the sheet (5.6) with $y < alpha$, and the comparison $v_1 = v_2 = 0$. At generic sheet points the same peeling separates $e \, g \, t$: the free $y$-direction first splits off $C \, B \, R$, after which the three remaining forms are distinct. The first perturbation in (5.7) enters the $C$-ahead sector while preserving full alignment. Formula (5.14), the pure lower bounds, and the full-aligned projections give simultaneously
  $ e gt.eq f_s \( P \) \, #h(2em) g gt.eq f_s \( Q_2 \) \, #h(2em) t gt.eq s . $
  As above, the two positive input rates with sum greater than $1 - s$ force $e + g gt.eq 1 + s$. Integrate on generic parallel segments and pass to $alpha = 0$, obtaining gain at least $1 + 2 s$.
  The only remaining possibility with $a > 0$ is $P > u_(*)$, $Q_2 = 0$. On the same sheet the $C$-ahead perturbation gives $e gt.eq 1$. If $S > 0$, the second perturbation in (5.7) enters the $R$-ahead sector $R \/ c > C \/ a$, still with $B = C + R$. There the actual tilt rate is at least $S$. Since $e$ is a constant singleton in the first tangent, the tilt projection inequality $g gt.eq f_r \( e \)$ gives $g gt.eq 1$. Transfer this to the sheet and use $v_1 = v_2 = 0$, whose gain is at least $s + 2 gt.eq 1 + 2 s$.
  If $S = 0$, the global upper bound for the pure $R$-partial makes $G$ independent of $R$. It therefore projects to an ordinary submodular profile on full $\( C \, B \)$-space: any $\( C \, B \)$ is feasible after taking $R$ sufficiently fine, and the value does not depend on that choice. If necessary take a further simultaneous generic tangent on the calibrated line so that this two-variable pure profile has ordinary order slopes, by the full-domain order rule of Lemma 25. Its lower comparisons with the actual profile and (5.14) are preserved. If the resulting $B$ marginal is positive, the second perturbation in (5.7) enters its $B$-ahead order, which is the $R$-ahead order on alignment. The normal time projection gives $g gt.eq s$, while the singleton $e gt.eq 1$ persists. The same zero-velocity test then has gain at least $1 + 2 s$. If the $B$-marginal vanishes, $G$ depends on $C$ alone and has global slope $P$, by (5.14). Thus the actual profile satisfies $p gt.eq P > u_(*) \/ 2$, and the high longitudinal comparison contradicts calibration.
  It remains to treat $a = 0$, so $c = b > 0$. Put the static coordinate $C$ in the nonnegative group. The external slices now have strict mixed slack also for $B lt.eq C + R$, and the pure domain in $B \, R$ is full. Prediction (3.6) gives zero pure $R$-rate on $B > R$. The two-variable pure order rule therefore gives
  $ G \( B \, R \) = Q_2 B #h(2em) \( B gt.eq R \) \, quad "(5.15)" $ <asp:decreasing-zero-pure>
  with $Q_2 gt.eq 0$; the equality at $B = R$ follows by continuity. In particular this applies on alignment when $C gt.eq 0$. Both negative coordinates can be shifted to equal finer tied cutoffs in the upper envelope; the other mixed constraints have large slack after that shift.
  Suppose $Q_2 lt.eq u_(*) \/ 2$. Test the upper envelope backwards from zero with $v_2 = 1$ and $v_1 in \[ rho \, 1 - rho \]$. At interior negative times $C > 0$, while $A$ is fixed. The pure backward cost per unit time is $Q_2$, by (5.15). With $B \, R$ frozen at their finer tied shift, the remaining scalar coordinates are
  $ X = C \, #h(2em) y = Y \, #h(2em) Z = D \, $
  with $A$ fixed. Because $C > 0$, the first shear constraint has slack; the only binding local constraint is $D lt.eq C + Y$. The direct longitudinal velocity-time projection gives $e gt.eq f_s \( p \)$, and the time rate is at least $s$. The fixed normal measurements rebase with bounded ambiguity by (3.2), with $B \, R$ fine. Thus (5.5) holds with $t_0 = s$, also in the path tangents. The scalar comparison gives $s + h - kappa$; the additional normal contribution is
  $ k_B - Q_2 gt.eq 1 - kappa - u_(*) \/ 2 = h - kappa . $
  The total is at least $1 + 2 s - 2 kappa$, before an arbitrarily small clipping and control loss, contradicting (5.1).
  Finally suppose $Q_2 > u_(*) \/ 2$. Use actual paths backwards from zero with $v_2 = 0$ and $v_1 = m in \[ rho \, 1 - rho \]$. At negative times $C > 0$, so the pure bound gives $n_1 gt.eq Q_2$ locally and therefore $g gt.eq h$ at generic aligned states and in their inherited tangents. Along each path, $C$ alone decreases; $B$ is static, while $R \, Y \, D \, A$ strictly increase. Apply the signed rule at almost every point of that path, with pure $C$-slope $p_0$. The required overlap and slack hold: increase $R \, Y$ substantially more than the shifts of the other nonnegative coordinates.
  If $p_0 > u_(*) \/ 2$, use $v_1 = v_2 = 0$ in this tangent. The pure and projection bounds give $e \, g gt.eq h$, and $t gt.eq s$, yielding $1 + 2 s$. If $p_0 lt.eq u_(*) \/ 2$, use $v_1 = 1 \, v_2 = 0$. We verify exactness of $p = p_0$ where the gain is transferred. The centered comparison ray has
  $ C = - y \, #h(2em) B = 0 \, #h(2em) R = y \, #h(2em) y < 0 . $
  Perturb to $B > 0$, $R = B - C$, with $C$ near $- y$. Away from $y = 0$, choose
  $ beta in \( - C \/ m \, \( B - C \) \/ m \) \, #h(2em) beta < y . $
  This is possible for sufficiently small positive $B$, since at $B = 0 \, C = - y$ both endpoints tend to $y \/ m < y$. Then $C > - m beta$, and the remaining cutoffs are strictly finer than their path values
  $ 0 \, quad m beta \, quad beta \, quad \( 1 - m \) beta \, quad beta $
  for $B \, R \, Y \, D \, A$, respectively. In particular $R = B - C > m beta$; $D = C + y$ is near zero and exceeds $\( 1 - m \) beta < 0$; and $A = B + y > beta$. Overlap therefore gives exact $p = p_0$ at generic nearby aligned states. Integrate on these perturbed segments and pass to the ray. Discarding the nonnegative $r$-term gives gain at least
  $ s + k_C - p_0 + h gt.eq 1 + 2 s + kappa . $
  Clip endpoint velocities into the prescribed box and use Lemma 27. This proves the contradiction in the last decreasing-aspect case. ◻
]

=== 5.6 Conclusion of the geometric estimate <conclusion-of-the-geometric-estimate>

#proof[
  #emph[Completion of the proof of Theorem 5.] If the claimed exponent bound failed, the calibrated construction would give the profile used at the start of this section. Proposition 35 excludes $lambda = 0$. Propositions 38 and 40 exclude $lambda > 0$, and Proposition 41 excludes $lambda < 0$. These exhaust $a gt.eq 0 \, b lt.eq 1 \, lambda = a - b$.
  Each comparison is in a fixed tangent problem. Fix the finite parameters and any large auxiliary velocity bound first. For an upper-envelope comparison, then choose $H_0$ sufficiently large for the resulting compact test region. The admissible depth perturbations and velocity clipping parameters may subsequently depend on these choices. The scalar losses are at most $2 kappa$ in the uses above, and the local constrained comparison reserves less than $4 kappa$. Choose the additional endpoint, clipping, and control losses so that, together with the scalar or local constrained loss already incurred, the total in the selected comparison is strictly below $10 kappa$. These are alternative comparisons, so their losses are not summed over the mutually exclusive cases. Static coordinates at $a = 1$ or $b = 1$ belong to the nonnegative group, as permitted in Lemma 25; no division by a zero negative speed is used. When $s = 1$, the branches requiring $0 < P lt.eq u_(*) \/ 2$ are empty, and the zero-rate and high-rate comparisons cover the remaining possibilities. The finite realizing grids and large-scale limit are chosen after these finite tests, as in Lemma 22. The strict inequality (5.1) is therefore impossible, proving (2.4). ◻
]

== 6 Propagation of oscillatory packets <sec:packets>

The principal result of this section is the uniform estimate in Theorem 45 for arbitrary finite complex packet arrays and coordinate masks. We define its exact operators and atomic norms, then prove the composition, localization, and fourth-power estimates used in Section 7. That section derives the conditional time profile (2.1) required by geometric propagation from near-extremal packet arrays themselves.

=== 6.1 The phase and an exact packet frame <the-phase-and-an-exact-packet-frame>

The Fourier-series construction and changes of packet frame follow the established wave-packet framework; see #cite(label("Tao2003")) arXiv:math/0210084v2, Section 4 and Lemma 4.1 and #cite(label("GOWWZ2025Packets")) arXiv:2104.11188v1, Section 4.1. We prove the exact frame identities and coefficient estimates used here.

A finite partition of the sphere into sufficiently small graph patches reduces the local analysis to the phase

$ x dot.op xi + t phi.alt \( xi \) \, #h(2em) xi in bb(R)^2 \, $

with a smooth elliptic function $phi.alt$; the surface measure factor is absorbed into the data. We fix such a patch and phase throughout this section. We may extend $phi.alt$ to all of $bb(R)^2$ so that its Hessian is uniformly definite and bounded, and all its derivatives of order at least two are bounded. Indeed, on a patch of radius $rho$, replace $phi.alt$ outside the patch by its quadratic Taylor polynomial, using a cutoff supported on the patch of radius $2 rho$. The resulting change in the Hessian is $O \( rho \)$, since the Taylor remainder and its first two derivatives are $O \( rho^3 \)$, $O \( rho^2 \)$, and $O \( rho \)$, respectively. Taking $rho$ small preserves definiteness. A reflection of the time coordinate exchanges the positive and negative definite cases. Write

$ U_xi = - nabla phi.alt \( xi \) . $

On each fixed bounded frequency region, $xi mapsto U_xi$ is quantitatively bi-Lipschitz. All constants below may depend on the fixed phase, the frequency region, and the chosen windows.

Once this continuation is fixed, the arrays below may use frequency labels anywhere in a fixed bounded region, including the transition region of the cutoff. Their windows need not lie in the original spherical patch. The phase and all its derivative bounds remain fixed before the packet scales vary. The global sphere argument will return to data supported on the original graph patches in Section 8.

Let $N$ be dyadic, put $delta = N^(- 1)$, and use the oscillatory factor

$ e^(2 pi i N^2 \( x dot.op xi + t phi.alt \( xi \) \)) \, #h(2em) 0 lt.eq t < 1 . $

Choose a smooth nonnegative function $chi$ whose integer translates form a square partition of unity. In particular, with

$ chi_theta^nu \( xi \) = chi #scale(x: 120%, y: 120%)[\(] \( xi - nu \) \/ theta #scale(x: 120%, y: 120%)[\)] \, #h(2em) nu in theta bb(Z)^2 \, $

we have $sum_nu \( chi_theta^nu \)^2 = 1$. Fix $L_(upright(f))$ so that each window is supported in a square of side $L_(upright(f)) theta$. For a dyadic factor $1 lt.eq m lt.eq N$, set

$ theta = m delta \, #h(2em) r = m^(- 2) \, #h(2em) w = r theta = delta / m . quad "(6.1)" $ <pkt:scales>

Partition $\[ 0 \, 1 \)$ into intervals $I$ of length $r$, and let $t_I$ be the left endpoint of $I$. A packet index at this scale is $v = \( nu_v \, z_v \, I_v \)$, where

$ nu_v in theta bb(Z)^2 \, #h(2em) z_v in L_(upright(f))^(- 1) w bb(Z)^2 . $

At one time $t_I$, define the analysis and synthesis operators by

$ \( sans(P)_(m \, I) f \)_(nu \, z) & = integral f \( xi \) chi_theta^nu \( xi \) e^(2 pi i N^2 \( z dot.op xi + t_I phi.alt \( xi \) \)) thin d xi \,\
sans(S)_(m \, I) d \( xi \) & = \( L_(upright(f)) theta \)^(- 2) sum_(nu \, z) d_(nu \, z) chi_theta^nu \( xi \) e^(- 2 pi i N^2 \( z dot.op xi + t_I phi.alt \( xi \) \)) . quad "(6.2)" $ <pkt:analysis>

Synthesis is initially defined for finite arrays, and then by continuity on $ell^2$.

#thm([Lemma 6.1.])[
  (Frame identity).  #emph[For each $I$, 
$ sans(S)_(m \, I) sans(P)_(m \, I) f = f \, #h(2em) parallel sans(P)_(m \, I) f parallel_(ell^2)^2 = \( L_(upright(f)) theta \)^2 parallel f parallel_2^2 \, #h(2em) parallel sans(S)_(m \, I) parallel_(ell^2 arrow.r L^2) = \( L_(upright(f)) theta \)^(- 1) . $

 Consequently, if $I_(+) subset I_(-)$ and $ell = m_(+) \/ m_(-)$, the transition $sans(P)_(m_(+) \, I_(+)) sans(S)_(m_(-) \, I_(-))$ has $ell^2 arrow.r ell^2$ norm at most $ell$.]
] <pkt:frame>

#proof[
  The identity $N^2 w theta = 1$ shows that, as $z$ varies over its grid, $N^2 z$ varies over $\( L_(upright(f)) theta \)^(- 1) bb(Z)^2$. Thus the analysis entries for one frequency window are the unnormalized Fourier coefficients on a square of side $L_(upright(f)) theta$. Parseval gives
  $ sum_z \| \( sans(P)_(m \, I) f \)_(nu \, z) \|^2 = \( L_(upright(f)) theta \)^2 parallel f chi_theta^nu parallel_2^2 . $
  Sum over $nu$. Fourier inversion, with its factor $\( L_(upright(f)) theta \)^(- 2)$, gives $sans(S)_(m \, I) sans(P)_(m \, I) f = f sum_nu \( chi_theta^nu \)^2 = f$. Finally, $sans(S)_(m \, I)$ is $\( L_(upright(f)) theta \)^(- 2)$ times the adjoint of $sans(P)_(m \, I)$. The operator norm statements follow. ◻
]

The initial scale is $m = 1$, with the single time interval $\[ 0 \, 1 \)$. A #emph[single-step operator] from factor $1$ to factor $m$ consists of synthesis at factor $1$, followed by analysis in every terminal time bin, followed by any coordinate mask. More generally, successive transitions use synthesis independently in each parent time bin and analysis in its child bins. Each finite array has a specified retained coordinate set, and an index is called #emph[active] when it belongs to that set, even if its coefficient is zero. A coordinate mask projects onto a subset of the retained set. If $M_I$ denotes the terminal coordinate mask, the single-step map is exactly

$ \( T_m d \)_I = M_I sans(P)_(m \, I) sans(S)_(1 \, \[ 0 \, 1 \)) d . $

The initial array is arbitrary and need not belong to the range of an analysis operator. Every map retains the full transition matrix between its active index sets. The localization graphs introduced later count possible interactions; they do not delete individual matrix entries or summands.

=== 6.2 Capacity and the atomic norm <capacity-and-the-atomic-norm>

Recall the biased area $W \( E \) = L^(1 + kappa) a^(1 - kappa)$ for an ellipse with radii $L gt.eq a > 0$. For an array in one time bin at scale $\( theta \, r \, w \)$, define

$ K \( c \) & = theta^2 sup_(E : upright("both radii at least ") theta) frac(1, W \( E \)) sum_(U_(nu_v) in u + E\
z_v in z + r E) \| c_v \|^2 \,\
G \( c \)^3 & = (w^2 sum_v \| c_v \|^2) K \( c \)^(1 \/ 2) . quad "(6.3)" $ <eq:source-29>

The supremum includes both independent translations $u \, z in bb(R)^2$. There is no upper restriction on the radii. Define the lattice atomic norm by

$ A \( c \) = inf {sum_(j = 1)^q G \( a_j \) : \| c \| lt.eq sum_(j = 1)^q \| a_j \| \, med q < oo} . $

The inequality in this definition is coordinatewise. For arrays over all bins of length $r$, put

$ cal(A) \( c \) = (r sum_I A \( c_I \)^3)^(1 \/ 3) . quad "(6.4)" $ <pkt:combined-norm>

#thm([Lemma 6.2.])[
  (Atomic norm properties).  #emph[On each finite index set, $A$ is a norm, is monotone under absolute coordinatewise domination, and is contracted by coordinate masks. The same assertions hold for $cal(A)$. Moreover, 
$ r w^2 sum_v \| c_v \|^3 lt.eq cal(A) \( c \)^3 . quad "(6.5)" $ <eq:source-30>

 An operator estimate with input $G \( d \)$ and output a norm remains true with input $A \( d \)$ and the same constant, provided the estimate holds for every input on the specified support.]
] <pkt:atomic>

#proof[
  A translated disk of radius $theta$ can include any chosen entry in both tests in (6.3). Since its biased area is $theta^2$, we have
  $ K \( c \) gt.eq parallel c parallel_oo^2 \, #h(2em) G \( c \)^3 gt.eq w^2 parallel c parallel_2^2 parallel c parallel_oo gt.eq w^2 sum_v \| c_v \|^3 . $
  The triangle inequality in $ell^3$ transfers this lower bound to every atomic decomposition and hence to $A$. A coordinate atom has cost $w^(2 \/ 3) \| c_v \|$, so $A$ is finite and positive away from zero. Homogeneity, the triangle inequality, and absolute monotonicity follow directly from its definition. The weighted $ell^3$ sum in (6.4) proves the corresponding statements for $cal(A)$ and gives (6.5).
  Atoms in a decomposition can first be restricted to $"supp" d$, since $G$ is monotone. If $\| d \| lt.eq sum_j \| a_j \|$, choose, at each coordinate, complex numbers $d_j$ with the phase of $d$, with $sum_j d_j = d$ and $\| d_j \| lt.eq \| a_j \|$. For a linear map $T$ and an output norm $cal(B)$, a bound $cal(B) \( T b \) lt.eq C G \( b \)$ therefore gives
  $ cal(B) \( T d \) lt.eq sum_j cal(B) \( T d_j \) lt.eq C sum_j G \( a_j \) . $
  Taking the infimum proves the last assertion. In particular, support restrictions imposed on the input are inherited by all atoms. ◻
]

=== 6.3 Uniform exponents and composition <uniform-exponents-and-composition>

#prodef([Definition 6.3.])[
  (Admissible families).  An admissible family has $m arrow.r oo$, with $m \, N$ dyadic and $m lt.eq N lt.eq m^B$ for a fixed finite $B$. Its arrays have finite supports, all their position labels have size at most $m^B$, and all frequency labels lie in a fixed bounded set. Enlarging $B$ is allowed; it must remain fixed along each family. Constants controlling the phase and windows are fixed as well. The same convention applies to diagrams with a fixed finite number of scales.
] <pkt:families>

The full position lattices are infinite, but their retained portions have polynomial size. At a factor $q lt.eq m$, the frequency and position bounds permit at most

$ C \( N \/ q \)^2 \( m^B q N \)^2 = C m^(2 B) N^4 $

indices per bin, and there are $q^2 lt.eq m^2$ bins. The norms are also comparable to the largest coordinate up to polynomial factors. For example, if one bin has $D gt.eq 1$ retained coordinates and $M = max_v \| c_v \|$, the singleton test and the decomposition into coordinate atoms give

$ w^(2 \/ 3) M lt.eq A \( c \) lt.eq D w^(2 \/ 3) M . $

Likewise, $M^2 lt.eq K \( c \) lt.eq D M^2$, since $W \( E \) gt.eq theta^2$. These comparisons and the weighted bin norm show that a coordinate error bounded by an arbitrarily large negative power of $m$ times the largest input coordinate is negligible in all the norms used here.

Let $gamma$ be the supremum, over admissible families and subsequences, of the limiting upper exponents in $m$ of

$ frac(cal(A) \( T_m d \)^3, G \( d \)^3) \, #h(2em) d eq.not 0 \, quad "(6.6)" $ <eq:source-31>

where $T_m$ is a single-step operator, including any terminal mask. By Lemma 43, upper bounds have the same meaning with $A \( d \)^3$ in the denominator. An exponent bound is uniform on every fixed complexity range, with any additional positive power loss: otherwise a sequence violating that bound would itself be an admissible family. We use $m^(o \( 1 \))$ in precisely this sense. In particular, it does not assert uniformity when a complexity parameter escapes to infinity along a single family.

The packet estimate to be proved in Section 7 is the following.

#thm([Theorem 6.4.])[
  (Uniform propagation of finite packet arrays).  #emph[Fix $0 < kappa < 1 \/ 10$, the continued phase, a bounded frequency region, and the window system above. For every fixed admissible complexity range and every $epsilon > 0$, there is a finite constant $C$ such that 
$ cal(A) \( T_m d \)^3 lt.eq C m^(10 kappa + epsilon) G \( d \)^3 quad "(6.7)" $ <pkt:uniform-main>

 for every finite complex initial array $d$ and every terminal coordinate mask in that range. The same estimate holds with $A \( d \)^3$ on the right. The constant is uniform in $m \, N \, d$, and the masks; it may depend on $kappa \, epsilon$, the complexity range, the fixed phase and frequency region, and the windows. Equivalently, 
$ gamma lt.eq 10 kappa . quad "(6.8)" $ <eq:source-32>

]
] <pkt:main>

We prove the theorem in Section 7. The next lemmas give the exact composition and analytic estimates used there.

#thm([Lemma 6.5.])[
  (Composition).  #emph[Fix rational numbers $0 = a_0 < dots.h.c < a_J = 1$ and dyadic factors $m_0 = 1$, $m_J = m$, with $m_j = m^(a_j + o \( 1 \))$. Put $ell_j = m_(j + 1) \/ m_j$. If normalized transition $j$ has cubed norm bound $C_j ell_j^(beta_j + epsilon)$, with $C_j$ independent of $m$ and $epsilon > 0$ arbitrary, the composed cubed norm bound is 
$ product_(j = 0)^(J - 1) C_j ell_j^(beta_j + epsilon) = m^(sum_(j = 0)^(J - 1) \( a_(j + 1) - a_j \) beta_j + epsilon + o \( 1 \)) . $

 This remains true with arbitrary intermediate coordinate masks. A better single-step bound restricted to particular input and output supports can be used at any transition whose supports satisfy that restriction, provided it is hereditary under restriction of the input support.]
] <pkt:composition>

#proof[
  Consider a parent bin $I'$ at factor $m'$, of length $r' = \( m' \)^(- 2)$ and left endpoint $t_0$. Make the change
  $ t = t_0 + r' tilde(t) \, #h(2em) z = r' tilde(z) \, #h(2em) N' = N \/ m' . $
  The factor $e^(2 pi i N^2 t_0 phi.alt)$ is removed by rebasing the data. The phase is again $N' ""^2 \( tilde(x) dot.op xi + tilde(t) phi.alt \( xi \) \)$. At a descendant factor $m''$, the normalized factor is $tilde(m) = m'' \/ m'$. Its frequency width is unchanged, whereas its spatial width and time length become
  $ tilde(w) = w \/ r' \, #h(2em) tilde(r) = r \/ r' . $
  The spatial grids consequently become exactly the grids prescribed above. The capacity is unchanged: the condition $z_v in z + r E$ becomes $tilde(z)_v in tilde(z) + tilde(r) E$. Thus
  $ tilde(K) = K \, #h(2em) tilde(G)^3 = \( r' \)^(- 2) G^3 \, #h(2em) tilde(A)^3 = \( r' \)^(- 2) A^3 . quad "(6.9)" $ <pkt:normalization>
  The last identity follows by applying the same common scalar factor to every atomic cost.
  An estimate with normalized cubed norm constant $C_(m'' \/ m')$ becomes
  $ r'' / r' sum_(I'' subset I') A \( c_(I'') \)^3 lt.eq C_(m'' \/ m') A \( d_(I') \)^3 . $
  Multiply by $r'$ and sum over parent bins. This gives the desired global cubed bound at that transition. Iterate it, using mask contraction at every stage. Taking logarithms in base $m$ gives the stated weighted sum of exponents. In particular, a fixed decrease in $beta_j$ decreases the full exponent by that amount times the positive logarithmic length $a_(j + 1) - a_j$. At each such fixed split, all normalized position and frequency ranges still have fixed polynomial complexity in that step’s scale ratio. The uniformity in Definition 44 therefore applies simultaneously to all bins. Finally, the last assertion follows from the support-preserving atomic decomposition in Lemma 43. ◻
]

#thm([Lemma 6.6.])[
  (Interaction and finite truncation).  #emph[Let $v$ be a parent index and $b$ a child index, with $I_b subset I_v$. The transition matrix vanishes unless $\| nu_b - nu_v \| lt.eq C theta_(+)$, and for every integer $L gt.eq 0$ it obeys 
$ \| T_(b v) \| lt.eq C_L (1 + frac(\| z_b - z_v - \( t_(I_b) - t_(I_v) \) U_(nu_v) \|, w_(-)))^(- L) . quad "(6.10)" $ <pkt:matrix-decay>

 Consequently, for every fixed $eta > 0$, interactions outside the enlarged parent beam of radius $m^eta w_(-)$ give an error smaller than any prescribed negative power of $m$, times the largest input coordinate, on an admissible family. One may also insert intermediate frame identities and truncate all intermediate position grids to sufficiently large polynomial ranges, with the same type of error.]
] <pkt:locality>

#proof[
  The matrix entry is
  $ \( L_(upright(f)) theta_(-) \)^(- 2) integral chi_(theta_(-))^(nu_v) \( xi \) chi_(theta_(+))^(nu_b) \( xi \) e^(2 pi i N^2 \( \( z_b - z_v \) dot.op xi + \( t_(I_b) - t_(I_v) \) phi.alt \( xi \) \)) thin d xi . $
  Disjoint frequency supports give the angular assertion. On overlap, rescale $xi = nu_v + theta_(-) zeta$. The amplitude and all its derivatives are uniformly bounded, since $theta_(-) lt.eq theta_(+)$. After the constant and linear phase terms are removed, the phase derivatives are bounded because
  $ N^2 theta_(-)^2 \( t_(I_b) - t_(I_v) \) = frac(t_(I_b) - t_(I_v), r_(-)) in \[ 0 \, 1 \) . $
  The remaining linear frequency is $\( z_b - z_v - \( t_(I_b) - t_(I_v) \) U_(nu_v) \) \/ w_(-)$. Repeated integration by parts proves (6.10).
  For finite retained arrays, sum the decay bound over the polynomial number of entries counted after Definition 44. An inserted frame identity instead uses the full position lattice; its infinite tail is controlled by summing the same decay over lattice annuli. Fix the number of transitions, the admissible complexity, and the positive beam-radius power first. Then enlarge the intermediate position ranges by fixed polynomial powers, and choose the integration-by-parts order $L$ for the prescribed final error. Frequency labels spread by only a bounded amount at each transition, so a fixed number of insertions and truncations has negligible total error. The polynomial norm comparisons transfer this statement to all the norms in use. This estimates the error of a finite approximation to an exact matrix product; it does not replace a transition by an arbitrarily truncated set of edges. ◻
]

#thm([Lemma 6.7.])[
  (Preliminary bounds).  #emph[For a single-step map and each terminal bin, 
$ w^2 sum_(v in I) \| c_v \|^2 lt.eq delta^2 sum_v \| d_v \|^2 \, #h(2em) K \( c_I \) lt.eq m^(4 + o \( 1 \)) K \( d \) . quad "(6.11)" $ <pkt:mass-capacity>

 In particular, $gamma lt.eq 2$.]
] <pkt:crude>

#proof[
  The mass estimate is Lemma 42, since $w = delta \/ m$. For the capacity estimate, fix an output test ellipse $E$, with both radii at least $theta = m delta$, and choose an arbitrarily small fixed $eta > 0$. By Lemma 47, the input entries contributing to this test, apart from negligible error, have velocities in a translate of $C m^eta E$. Their initial positions lie in another translate of the same enlarged ellipse. Indeed, a contributing position equals its child position minus elapsed time times its velocity, up to $m^eta delta$; the elapsed time is at most one and both radii of $E$ are at least $delta$. Both translations are allowed in the definition of $K \( d \)$.
  Restrict the input to this one product of two translated tests. Its squared sum is at most
  $ delta^(- 2) K \( d \) W \( C m^eta E \) lt.eq C m^(2 eta) delta^(- 2) K \( d \) W \( E \) . $
  Apply the global squared operator norm bound $m^2$ to this restricted input, and then multiply by the output factor $theta^2 \/ W \( E \)$. Since $theta^2 = m^2 delta^2$, the result is $C m^(4 + 2 eta) K \( d \)$, with negligible error. The estimate is uniform over translations, orientations, and eccentricities. Tail errors are uniform too: $theta^2 \/ W \( E \) lt.eq 1$, and $K \( d \) gt.eq parallel d parallel_oo^2$. Let $eta$ be arbitrarily small to obtain the stated exponent bound.
  Finally, $A \( c_I \) lt.eq G \( c_I \)$. Multiply the mass bound by the uniform upper bound for $K \( c_I \)^(1 \/ 2)$ and sum in time with weight $r$. There are $r^(- 1)$ bins, giving $cal(A) \( c \)^3 lt.eq m^(2 + o \( 1 \)) G \( d \)^3$. ◻
]

=== 6.4 A fourth-power estimate from decoupling <a-fourth-power-estimate-from-decoupling>

We use the ordinary $ell^2$ decoupling theorem of Bourgain and Demeter #cite(label("BourgainDemeter2015")) arXiv:1403.5335v3, Theorem 1.1, equation (2). For a smooth elliptic graph, Fourier thickness $S^(- 1)$, and graph caps of diameter $S^(- 1 \/ 2)$, its critical three-dimensional estimate is

$ parallel sum_tau F_tau #scale(x: 180%, y: 180%)[parallel]_4 lt.eq C_epsilon.alt S^epsilon.alt #scale(x: 180%, y: 180%)[\(] sum_tau parallel F_tau parallel_4^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $

The norms here are on all of spacetime. Uniformity over the normalized phases below follows from the proof for general surfaces in #cite(label("BourgainDemeter2015")) Section 7: the ellipticity bounds are fixed, and the common third-derivative bound controls the Taylor approximation on each rescaled cap.

We derive the packet refinement for the precise class used here. The induction follows Guth–Iosevich–Ou–Wang #cite(label("GIOW2020")) arXiv:1808.09346v1, proof of Theorem 4.2; compare the weighted extension formulation in #cite(label("WangWu2024")) arXiv:2411.08871v3, Section 4, Theorem 4.4. Guth–Iosevich–Ou–Wang also record an independent discovery of the refinement by Du and Zhang. The proof below specifies which tubes count packet activity, including at the smaller induction scale. The distinction between a packet’s activity region and its counted tube is substantive; a planar counterexample to a support/counting mismatch is given in #cite(label("SinghSingh2026Refined")) arXiv:2608.28711v1, Proposition 2.1.

#thm([Theorem 6.8.])[
  (Refined decoupling for fixed-profile packets).  #emph[Fix a nonzero, nonnegative $a in C_c^oo \( bb(R)^2 \)$, and a smooth elliptic phase $Phi$ on a fixed compact frequency region. Its ellipticity and derivative bounds are fixed. A canonical packet at scale $R gt.eq 2$ is 
$ F_T \( X \, t \) = d_T R integral a #scale(x: 120%, y: 120%)[\(] sqrt(R) \( xi - xi_T \) #scale(x: 120%, y: 120%)[\)] e^(2 pi i \( \( X - z_T \) dot.op xi + t Phi \( xi \) \)) thin d xi . $

 The frequency centers range over a fixed bounded set and lie on a grid of spacing comparable to $R^(- 1 \/ 2)$. The compact phase region is chosen to contain these centers and all their packet supports $xi_T + R^(- 1 \/ 2) "supp" a$. For each frequency center, the position centers lie on a grid of spacing comparable to $sqrt(R)$. Assume the position centers lie in a translate of a box of side $C R$, where $C$ is fixed. Subsets of these grids are allowed. The coefficients $d_T$ are arbitrary complex numbers.]
  #emph[Fix $0 < delta_0 < 1 \/ 8$. The counted tube associated to the packet is 
$ T = { \( X \, t \) : \| t \| lt.eq 3 R \, quad \| X - z_T + t nabla Phi \( xi_T \) \| lt.eq R^(1 \/ 2 + delta_0) #scale(x: 120%, y: 120%)[}] . $

 The packet has transverse core width $sqrt(R)$, but need not vanish outside this tube. On the time slab below, the coefficient-relative Schwartz bound proved below controls its decay away from the centerline. The enlarged tube is the region used for counting; at each induction scale we use the same definition with that scale’s core width. Let $Y$ be a finite union of cubes from a fixed grid of side $sqrt(R)$, contained in ${ \| t \| lt.eq 2 R }$. Suppose each such cube meets at most $k gt.eq 1$ counted tubes. For every $epsilon > 0$, 
$ parallel sum_T F_T #scale(x: 180%, y: 180%)[parallel]_(L^4 \( Y \))^4 lt.eq C_(epsilon \, delta_0) R^epsilon k R^2 sum_T \| d_T \|^4 . quad "(6.12)" $ <pkt:external-decoupling>

 All constants may depend on the fixed profile, grid bounds, position box constant, and phase bounds. The estimate is uniform over finite subsets and the coefficients. If the weighted packet norms on a box $B$ satisfy $parallel F_T parallel_(L^4 \( w_B \))^4 asymp \| d_T \|^4 R^2$, the right-hand side may equivalently be written as $C_(epsilon \, delta_0) R^epsilon k sum_T parallel F_T parallel_(L^4 \( w_B \))^4$.]
] <pkt:refined-decoupling>

The proof groups the packets into coarser frequency caps and position squares, then rescales each group to scale $sqrt(R)$. Its main task is to compare the tubes counted at that smaller scale with the original multiplicity bound $k$. The local decoupling estimates can then be summed with each packet charged through its fourth-power cost.

#proof[
  The grids give at most $C R^2$ packets. Write $cal(C)_R = R^2 sum_T \| d_T \|^4$. For $\| t \| lt.eq 3 R$, integration by parts in the normalized cap gives, for every fixed $L$,
  $ \| F_T \( X \, t \) \| lt.eq C_L \| d_T \| (1 + frac(\| X - z_T + t nabla Phi \( xi_T \) \|, sqrt(R)))^(- L) . $
  Outside the counted transverse radius this gains $R^(- L delta_0)$. The polynomial packet count can therefore be included before choosing $L$ to obtain any prescribed power of decay. Choose a fixed band-limited Schwartz function $psi$, bounded away from zero on $\[ - 4 \, 4 \]$, and put $P_T = psi \( t \/ R \) F_T$. The spatial $L^oo$ bound is $C \| d_T \|$, and Plancherel gives $parallel F_T \( dot.op \, t \) parallel_2^2 lt.eq C \| d_T \|^2 R$. Hence
  $ parallel P_T parallel_4^4 asymp \| d_T \|^4 R^2 . $
  For the lower bound, use a short interval $\| t \| lt.eq c R$ and a ball of radius $c sqrt(R)$ about the core. The normalized integral is bounded below there because $a$ is fixed, nonnegative and has positive integral. Thus no tail estimate is normalized by the possibly small norm of an arbitrary oscillatory profile.
  Let $D \( R \)$ be the best constant in
  $ parallel sum_T F_T #scale(x: 180%, y: 180%)[parallel]_(L^4 \( Y \))^4 lt.eq D \( R \) k cal(C)_R $
  over the fixed classes just specified. For the induction, strengthen the allowed time slab slightly to $\| t \| lt.eq \( 2 + R^(- 1 \/ 16) \) R$; keep the counted tubes in $\| t \| lt.eq 3 R$. The same core bounds apply. This harmless buffer accommodates cells meeting the endpoints after rescaling: the added length is $O \( R^(3 \/ 4) + R^(1 \/ 2 + rho) \)$, and, at $r = sqrt(R)$,
  $ R^(- 1 \/ 16) + O \( R^(- 1 \/ 4) + R^(- 1 \/ 2 + rho) \) < r^(- 1 \/ 16) $
  for sufficiently large $R$, once $rho < 1 \/ 16$. For bounded $R$, the packet count, the preceding cost bound and Hölder’s inequality give a finite bound for $D \( R \)$. The zero array is immediate, so assume $cal(C)_R > 0$.
  Partition the frequency centers into caps $tau$ of diameter $R^(- 1 \/ 4)$. For each $tau$, partition the time-zero position centers into squares of side $R^(3 \/ 4)$. Assign each packet once to its frequency cap and position square; denote the resulting disjoint packet groups by $cal(W)_l$, and set $P_l = sum_(T in cal(W)_l) P_T$. The centerlines in a group remain in a fixed enlargement of the corresponding coarse cylinder, of radius $R^(3 \/ 4)$ and length $O \( R \)$. At any $sqrt(R)$-cube, only boundedly many such cylinders per coarse cap are nearby. Far cylinders have separation comparable to $R^(3 \/ 4)$ from their $sqrt(R)$ cores and contribute arbitrarily small relative errors. No packet is multiplied by a coarse spatial cutoff. The fine cap supports lie in fixed enlargements of their assigned coarse caps. These enlargements have bounded overlap; a fixed coloring separates them before ordinary decoupling, at a constant cost.
  Here is the exact normalization of a group. If $c_tau$ is its frequency center and $z_l$ its position-square center, put
  $ xi = c_tau + R^(- 1 \/ 4) zeta \, #h(2em) X' = R^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\(] X + t nabla Phi \( c_tau \) - z_l #scale(x: 120%, y: 120%)[\)] \, #h(2em) t' = R^(- 1 \/ 2) t \, #h(2em) r = sqrt(R) . $
  After removing a common unimodular factor and absorbing each packet’s constant phase into its coefficient, the packets have the same form at scale $r$, with the same profile $a$ and $\| d'_T \| = \| d_T \|$. Indeed $R thin d xi = r thin d zeta$, their frequency and position meshes become $r^(- 1 \/ 2)$ and $sqrt(r)$, and the new position centers have size $O \( r \)$. The new phase has derivatives $R^(\( 2 - j \) \/ 4) D^j Phi$ for $j gt.eq 2$, so it stays in the fixed elliptic class. The cutoff becomes $psi \( t' \/ r \)$. The physical Jacobian is $R$; consequently the inner cost $\| d_T \|^4 r^2$, after returning to the original coordinates, is exactly $\| d_T \|^4 R^2$.
  Apply the inductive estimate at scale $r$. Its counted radius $r^(1 \/ 2 + delta_0)$ pulls back to the narrower radius $R^(1 \/ 2 + delta_0 \/ 2)$. A pulled-back inner cube has transverse size $R^(1 \/ 2)$ and longitudinal size $R^(3 \/ 4)$. Directions in one coarse cap differ by $O \( R^(- 1 \/ 4) \)$, so their relative displacement across that cube is $O \( sqrt(R) \)$. Choose
  $ 0 < rho < min \( delta_0 \/ 8 \, thin 1 \/ 16 \) . $
  If a pulled-back inner cube $P$ meets a translate of an outer cube $Q$ by distance at most $C R^(1 \/ 2 + rho)$, then every inner counted tube meeting $P$ belongs to an original tube meeting $Q$. The transverse distance is bounded by
  $ C #scale(x: 120%, y: 120%)[\(] R^(1 \/ 2 + delta_0 \/ 2) + R^(1 \/ 2 + rho) + sqrt(R) #scale(x: 120%, y: 120%)[\)] < R^(1 \/ 2 + delta_0) . $
  This is where the distinction between the core and the counted tube is used. Each induction step rescales the core and chooses its own counted radius; it does not rescale the parent’s already enlarged tube.
  For clarity, we give the local decoupling bookkeeping, including the weights. For every outer cube $Q$, choose a translate and dilate $eta_Q$ of one band-limited Schwartz function which is bounded below on $Q$. Its spatial and temporal scale is $sqrt(R)$. Applying ordinary global decoupling to $eta_Q sum_l P_l$ is legitimate: multiplication broadens Fourier support by $O \( R^(- 1 \/ 2) \)$, exactly the thickness at the coarse decoupling scale $S = sqrt(R)$. Keep the boundedly many nearby coarse cylinders per cap. Their fourth-power estimate is
  $ parallel sum_T F_T #scale(x: 180%, y: 180%)[parallel]_(L^4 \( Q \))^4 lt.eq C_beta R^beta (sum_l parallel eta_Q P_l parallel_4^2)^2 + upright("relative tail errors") \, $
  where $beta > 0$ is arbitrarily small.
  Truncate each local integral to cubes $Q + j sqrt(R)$ with $j in cal(J) subset bb(Z)^3$, $\| j \| lt.eq C R^rho$. The set of shifts is the same for every $Q$, and $\# cal(J) lt.eq C R^(3 rho)$. On the retained region $\| eta_Q \| lt.eq C$. For each group $l$, keep only inner cubes meeting one of these retained translates, with $Q$ ranging over the cubes of $Y$. The time-buffer inequality above places every such whole inner cube in the strengthened child slab. Partition these cubes dyadically by the number of inner counted tubes they meet. Write $Y_(l \, h)$ for the pulled-back union with between $h$ and $2 h$ tubes, where $h$ ranges over $O \( log R \)$ positive dyadic values. The zero-count cells give only relative tail errors by the core bound. Set
  $ A_(l \, j \, h) \( Q \) = integral_(Q + j sqrt(R)) upright(bold(1))_(Y_(l \, h)) thin \| P_l \|^4 . $
  If this is nonzero, the preceding incidence comparison supplies at least $h$ packets from $cal(W)_l$ whose outer tubes meet $Q$. The groups are disjoint, so there are at most $C k \/ h$ such groups $l$. Therefore
  $ (sum_l A_(l \, j \, h) \( Q \)^(1 \/ 2))^2 lt.eq frac(C k, h) sum_l A_(l \, j \, h) \( Q \) . $
  Two finite Cauchy–Schwarz sums over $j \, h$ cost at most $C R^(6 rho) \( log R \)^2$. For each fixed shift $j$, the cubes $Q + j sqrt(R)$ are disjoint. Sum their integrals before estimating them by an entire inner-cell union:
  $ sum_Q A_(l \, j \, h) \( Q \) lt.eq integral_(Y_(l \, h)) \| P_l \|^4 lt.eq C D \( sqrt(R) \) thin h R^2 sum_(T in cal(W)_l) \| d_T \|^4 . $
  The last inequality is the child estimate and the exact Jacobian calculation above; the bounded common cutoff costs only a constant. The factor $h$ cancels the preceding $h^(- 1)$, and summation over the disjoint groups preserves $cal(C)_R$. This order avoids counting one long inner cell once for each outer cube it meets.
  All discarded terms are homogeneous in the coefficients. For example, $\# { T } lt.eq C R^2$ and $\| sum_(T in cal(W)_l) P_T \|^4 lt.eq \( \# cal(W)_l \)^3 sum_(T in cal(W)_l) \| P_T \|^4$. The Schwartz bound on $eta_Q$, summed over the cube grid outside $R^rho Q$, then bounds the off-neighborhood error by $C_L R^(8 - \( 4 L - 3 \) rho) cal(C)_R$, before harmless fixed powers. Choose its decay order after $rho \, delta_0$ and the desired error. The core bound treats far coarse cylinders and zero-count child cells in the same way. Summing over space uses integrable decay; no bound on the number of distant selected cubes is needed. Thus, for every prescribed $A > 0$, these terms are at most $C_A R^(- A) cal(C)_R$ at the current induction scale.
  We have proved the recurrence
  $ D \( R \) lt.eq C R^(beta + 6 rho) \( log R \)^2 D \( sqrt(R) \) + C_A R^(- A) . $
  Choose $rho$ smaller if necessary, after $delta_0$ and $epsilon$, and then $beta$, so that $beta + 6 rho < epsilon \/ 4$. At a sufficiently large fixed base, the logarithm and the fixed constant fit within another $R^(epsilon \/ 8)$. The resulting exponent, including the child bound $R^(epsilon \/ 2)$, is less than $7 epsilon \/ 8$. Induction from that base gives $D \( R \) lt.eq C_(epsilon \, delta_0) R^epsilon$. The additive errors are absorbed at their own scale; no error at the last small scale is asserted to be a rapid-decay error in the original scale. The assumption $k gt.eq 1$ allows their absorption into $k cal(C)_R$. This proves (6.12). The weighted version is the stated packet-cost comparison. ◻
]

#thm([Proposition 6.9.])[
  (Discrete fourth-power propagation).  #emph[Consider one consecutive transition in an admissible family, with scale ratio $ell = m_(+) \/ m_(-) = m^(alpha + o \( 1 \))$, where $alpha > 0$ is fixed. Fix finite retained parent and child coordinate sets and an adjacency power $eta > 0$. Let $d$ be any complex array on the parent sets, and let $M_(I_(+))$ project onto the retained set in child bin $I_(+)$. The output in that bin is 
$ c_(I_(+)) = M_(I_(+)) sans(P)_(m_(+) \, I_(+)) sans(S)_(m_(-) \, I_(-)) d_(I_(-)) \, #h(2em) I_(+) subset I_(-) . $

 Suppose each active child index has at most $k gt.eq 1$ active parents in its parent time bin satisfying 
$ \| nu_b - nu_v \| lt.eq m^eta theta_(+) \, #h(2em) \| z_b - z_v - \( t_(I_b) - t_(I_v) \) U_(nu_v) \| lt.eq m^eta w_(-) . $

 Thus $k$ counts nearby pairs of retained coordinates, independently of whether their coefficients vanish. The displayed operator still uses every matrix entry between the retained sets. Then 
$ r_(+) w_(+)^2 sum_b \| c_b \|^4 lt.eq m^(o \( 1 \)) k thin r_(-) w_(-)^2 sum_v \| d_v \|^4 . quad "(6.13)" $ <eq:source-33>

 For each fixed complexity range, $alpha$, and $eta$, and every $epsilon > 0$, the factor $m^(o \( 1 \))$ may be replaced by $C_epsilon m^epsilon$ for all sufficiently large $m$ in the window 
$ m^(alpha \/ 2) lt.eq ell lt.eq m^(3 alpha \/ 2) . $

 The constant and the lower threshold within this window are uniform. A family’s entry into the window may depend on the rate at which $log_m ell$ tends to $alpha$.]
] <pkt:quartic>

#proof[
  Fix a parent time bin and one child frequency window. Only parent windows overlapping this child window contribute. Select these parents, but keep their synthesis packets intact. In particular, we do not multiply individual parent windows by the child cutoff before applying refined decoupling.
  Let $nu_(+)$ be the child frequency center and $t_(-) = t_(I_(-))$. Set
  $ xi = nu_(+) + theta_(+) zeta \, #h(2em) T = frac(t - t_(-), r_(+)) \, #h(2em) X = frac(x - \( t - t_(-) \) U_(nu_(+)), w_(+)) . $
  The identities $N^2 w_(+) theta_(+) = N^2 r_(+) theta_(+)^2 = 1$ give the normalized phase, after removing the constant and linear terms,
  $ Phi_(+) \( zeta \) = theta_(+)^(- 2) #scale(x: 120%, y: 120%)[\(] phi.alt \( nu_(+) + theta_(+) zeta \) - phi.alt \( nu_(+) \) - theta_(+) nabla phi.alt \( nu_(+) \) dot.op zeta #scale(x: 120%, y: 120%)[\)] . $
  It has uniformly definite Hessian and bounded higher derivatives on a fixed compact set. In these units the parent slab has length
  $ R = r_(-) / r_(+) = ell^2 \, $
  the parent frequency caps have diameter $O \( ell^(- 1) \)$, and the parent packets have transverse width $ell$. More precisely, the normalized synthesis packet has the canonical form in Theorem 49 with the fixed profile $a = L_(upright(f))^(- 2) chi$ and centers
  $ zeta_v = frac(nu_v - nu_(+), theta_(+)) \, #h(2em) Z_v = z_v / w_(+) . $
  Here the constant phase $e^(- 2 pi i N^2 z_v dot.op nu_(+))$ is absorbed into $d_v$, preserving its absolute value. The position mesh is $L_(upright(f))^(- 1) sqrt(R)$. The normalized velocities are bounded, because all selected parent windows overlap the child window. The synthesis factor in (6.2) cancels the area of a parent frequency window, so each parent packet has amplitude $O \( \| d_v \| \)$, with no extra scale factor.
  For completeness, localize time by a fixed Schwartz function $psi \( T \/ R \)$ whose Fourier transform is compactly supported and which is bounded away from zero on an interval containing $\[ 0 \, 1 \]$ in its argument. Denote the resulting parent packets by $P_v$. Their Fourier support lies in an $O \( R^(- 1) \)$ neighborhood of the normalized graph, over caps of diameter $O \( R^(- 1 \/ 2) \)$. On $\| T \| = O \( R \)$, integration by parts on the parent cap gives transverse Schwartz decay on scale $R^(1 \/ 2)$. For larger $\| T \|$, the decay width and constants grow only polynomially in $1 + \| T \| \/ R$, which is harmless against $psi \( T \/ R \)$. Consequently,
  $ parallel P_v parallel_4^4 lt.eq C \| d_v \|^4 R^2 = C \| d_v \|^4 ell^4 . quad "(6.14)" $ <pkt:packet-fourth-cost>
  We next pass from the discrete child samples to a spacetime integral. Write $F = sum_v P_v$. In the normalized variables, the child cutoff is a fixed smooth frequency multiplier. All spatial and temporal frequencies of $F$ lie in a fixed compact set. There is therefore a Schwartz kernel $H$ on spacetime, with uniform bounds, whose Fourier transform implements the child multiplier on that set. An active child index $b$ has normalized sample location
  $ p_b = \( X_b \, T_b \) = (frac(z_b - \( t_(I_b) - t_(-) \) U_(nu_(+)), w_(+)) \, frac(t_(I_b) - t_(-), r_(+))) . $
  At these retained coordinates, up to a unimodular factor,
  $ psi \( T_b \/ R \) c_b = \( H * F \) \( p_b \) . $
  The time coordinates are integers from $0$ to $R - 1$; at each time, the spatial coordinates lie in a translate of $L_(upright(f))^(- 1) bb(Z)^2$. Thus the retained samples have bounded multiplicity at unit resolution. Hölder’s inequality and summation over these samples give
  $ sum_b \| c_b \|^4 lt.eq C integral \| F \( q \) \|^4 sum_b \| H \( p_b - q \) \| thin d q . $
  The summed kernel is uniformly bounded and decays rapidly with the distance to the active sample set. Truncate this distance at $m^beta$, where $beta > 0$ will be chosen small. The omitted integral is bounded by an arbitrarily large negative power times $R^2 sum_v \| d_v \|^4$: use the polynomial number of input packets, (6.14), and the triangle inequality. Cover the retained neighborhood by cubes of side $ell$ and denote their union by $Y$. We have reduced the desired estimate to a bound for $integral_Y \| F \|^4$.
  We check carefully that the degree hypothesis controls the tube multiplicity on these cubes. Choose $beta < min \( eta \, alpha \) \/ 10$. Every cube in $Y$ has an associated active sample within $O \( ell + m^beta \)$ of all its points. An enlarged parent tube meeting that cube has, at the time of this sample, transverse distance at most
  $ C #scale(x: 120%, y: 120%)[\(] ell R^(delta_0) + ell + m^beta #scale(x: 120%, y: 120%)[\)] quad "(6.15)" $ <pkt:cube-adjacency>
  from the sample: the normalized tube velocities are bounded. Choose $0 < delta_0 < 1 \/ 8$ with $3 alpha delta_0 < eta \/ 10$. In the stated ratio window, $R^(delta_0) lt.eq m^(3 alpha delta_0) lt.eq m^(eta \/ 10)$. Then (6.15) is less than $m^eta ell$ for sufficiently large $m$, which is exactly the allowed parent-beam radius in child units. Angular overlap gives a fixed multiple of $theta_(+)$, also less than the permitted $m^eta theta_(+)$. Each such tube is therefore one of the at most $k$ parents counted at the associated sample. This uses the stated adjacency radius, without replacing it by a larger power.
  The sample times satisfy $0 lt.eq T_b < R$, so the cube union $Y$ lies in
  $ - C \( ell + m^beta \) lt.eq T lt.eq R + C \( ell + m^beta \) . $
  In the stated ratio window, $\( ell + m^beta \) \/ R lt.eq m^(- alpha \/ 2) + m^(beta - alpha) arrow.r 0$. Thus $Y$ is contained in ${ \| T \| lt.eq 2 R }$ for sufficiently large $m$, uniformly in that window, as required by Theorem 49.
  Partition space into boxes of side $R$, aligned with the cube grid, over this time slab. In each box retain the packets whose centerlines meet a fixed enlargement of it. Their time-zero centers lie in a box of side $O \( R \)$ because the normalized velocities are bounded. The other packets have rapidly decaying tails there. Admissibility gives a polynomial number of boxes meeting $Y$, so choose the integration-by-parts order after this fixed complexity to make the total discarded contribution negligible. Each relevant tube is charged in only boundedly many boxes, since its length and displacement in the slab are $O \( R \)$.
  Write $P_v = psi \( T \/ R \) tilde(P)_v$, where $tilde(P)_v$ is the underlying canonical extension packet. On the selected cubes,
  $ lr(|sum_v P_v|)^4 lt.eq parallel psi parallel_oo^4 lr(|sum_v tilde(P)_v|)^4 . $
  Apply the coefficient-cost estimate of Theorem 49 to these canonical packets in each box. Their position centers lie in a box of side $O \( R \)$, their coefficients remain arbitrary complex numbers, and their counted-tube multiplicity is at most $k$. The common cutoff and bounded box multiplicity therefore give
  $ sum_(b : upright("fixed child angle")\
I_b subset I_(-)) \| c_b \|^4 lt.eq m^(o \( 1 \)) k thin ell^4 sum_(v in I_(-) : upright("window overlaps") med nu_(+)) \| d_v \|^4 . $
  All tail errors can be absorbed into this bound, since $k gt.eq 1$. Since $R lt.eq m^(3 alpha)$ in the ratio window, the decoupling loss can be made smaller than any prescribed positive power of $m$ uniformly there. For a prescribed final error power, choose first the error allowed by Theorem 49, then its localization power $delta_0$ and the sampling power $beta$ small enough to satisfy the preceding constraints. Their constants are fixed before taking $m arrow.r oo$.
  Each parent window overlaps only boundedly many child windows. Sum over child angles and parent bins and multiply by $r_(+) w_(+)^2$. The scale identity
  $ r_(+) w_(+)^2 ell^4 = r_(-) w_(-)^2 $
  proves (6.13). ◻
]

#prodef([Remark 6.10.])[
  (Weighted packet costs).  In the normalization of the preceding proof, the canonical packets also have the weighted norms appearing in comparisons with refined decoupling formulations. Write $P_v = psi \( T \/ R \) tilde(P)_v$ as above. For a spatial box $B$ used there, with center $X_B$, put $q_B = \( X_B \, 0 \)$ and
  $ w_B \( q \) asymp \( 1 + \| q - q_B \| \/ R \)^(- K_0) \, #h(2em) q = \( X \, T \) \, quad K_0 > 4 . $
  For every packet retained in this box,
  $ parallel tilde(P)_v parallel_(L^4 \( w_B \))^4 asymp \| d_v \|^4 R^2 asymp parallel P_v parallel_4^4 . $
  Indeed, the frequency-integral bound and Plancherel give $parallel tilde(P)_v \( dot.op \, T \) parallel_oo lt.tilde \| d_v \|$ and $parallel tilde(P)_v \( dot.op \, T \) parallel_2^2 lt.tilde \| d_v \|^2 R$. Integration with the temporal decay of $w_B$ or $psi \( T \/ R \)$ proves the upper bounds. For sufficiently small fixed $c > 0$, the nonnegative profile gives $\| tilde(P)_v \( X \, T \) \| gt.tilde \| d_v \|$ on
  $ 0 lt.eq T lt.eq c R \, #h(2em) \| X - Z_v + T nabla Phi_(+) \( zeta_v \) \| lt.eq c sqrt(R) . $
  This is the short-core argument in the proof of Theorem 49. The region has volume comparable to $R^2$. Both $\| psi \( T \/ R \) \|$ and $w_B$ are bounded below there: the time-zero centers of the retained packets lie within distance $O \( R \)$ of $B$, even if a tube meets the box only at a later time. This proves the lower bounds.
]

#prodef([Remark 6.11.])[
  (Vanishing adjacency powers).  Later there will be an outer index $i$, a fixed number $J$ of transitions, and positive adjacency powers $eta_i arrow.r 0$. For each fixed $i$ the scale ratios satisfy $ell_j = m^(1 \/ J + o \( 1 \))$, so $R = ell_j^2 = m^(2 \/ J + o \( 1 \))$. Choose the external error power tending to zero with $i$, and its localization power $delta_i$ still smaller, with $2 delta_i \/ J < eta_i \/ 10$. Choose the sampling power less than $min \( eta_i \, 1 \/ J \) \/ 10$. The cube comparison above then uses precisely the radius $m^(eta_i) w_(-)$, while the coloring and decoupling losses are $m^(o_i \( 1 \))$. Here $o_i \( 1 \)$ denotes an exponent whose limiting upper absolute value as $m arrow.r oo$, with $i$ and $J$ fixed, tends to zero as $i arrow.r oo$. We take the limits in that order. The phase, profile, complexity, and positive radius powers remain fixed in each inner limit. Constants may depend on $i$; since $J$ is fixed, the same convention applies to the product of all transition losses.
] <pkt:vanishing-powers>

== 7 Extremal selection and propagation <sec:extremal>

We prove Theorem 45. We use the packet scales, lattice norms, and propagation exponent introduced in Section 6. In particular, the amplification of a diagram with initial array $d$ and terminal array $c$ is

$ frac(cal(A) \( c \)^3, G \( d \)^3) . $

Every mask below is a coordinate projection on a layer of the diagram. Between successive masks we retain the entire packet transition matrix. Graphs will record its significant interactions, but will not replace the matrix by an edgewise truncation.

We argue by contradiction and assume $gamma > 10 kappa$. We use two successive extrema. The first determines the infimum of the time-support exponents that allow amplification arbitrarily close to $gamma$. The second minimizes, up to a vanishing error, the asymptotic exponent of the path count per original root among diagrams with nearly this time support. This makes the path count stable under the later masks that retain near-extremal amplification, and supplies the counting law needed for geometric propagation.

=== 7.1 The least time dimension of a near-extremal family <the-least-time-dimension-of-a-near-extremal-family>

For $0 lt.eq sigma lt.eq 1$, define $gamma_sigma$ by the same supremum of limiting amplification exponents as $gamma$, with the following additional restriction. There is a fixed $eta > 0$ within the family such that each active initial index touches terminal masked indices in at most $m^(2 sigma + o \( 1 \))$ time bins, where a touch means

$ \| nu_b - nu_v \| lt.eq m^eta theta \, #h(2em) \| z_b - z_v - t_(I_b) U_(nu_v) \| lt.eq m^eta delta . $

Here the initial time is zero. The supremum still ranges over all fixed positive $eta$ and all finite polynomial parameter bounds.

#thm([Lemma 7.1.])[
  (Minimal time dimension).  #emph[One has 
$ gamma_sigma lt.eq 2 sigma \, #h(2em) s := inf { sigma in \[ 0 \, 1 \] : gamma_sigma = gamma } > 0 . quad "(7.1)" $ <eq:source-34>

 For every fixed $sigma < s$, the difference $gamma - gamma_sigma$ is positive. For every $sigma > s$ in $\[ 0 \, 1 \]$, one has $gamma_sigma = gamma$. Near-extremal families defining any of these exponents may be chosen with all nonzero initial coordinate amplitudes between $1$ and $2$.]
] <ext:time-dimension>

#proof[
  Fix a family satisfying the additional support restriction. For a terminal bin $I$, let $cal(R)_I$ be the initial indices touching at least one retained terminal index in $I$. Every matrix entry from an initial index outside $cal(R)_I$ to a retained index in $I$ is a locality tail. Lemma 47 and the polynomial coordinate count show that replacing the input by $d \|_(cal(R)_I)$ changes the output in $I$ by a negligible error. Apply the squared-sum contraction of Lemma 48 to the full transition matrix on this restricted input. Summing over $I$ counts each initial index at most $m^(2 sigma + o \( 1 \))$ times. Therefore
  $ r w^2 sum_b \| c_b \|^2 lt.eq m^(- 2 \( 1 - sigma \) + o \( 1 \)) delta^2 sum_v \| d_v \|^2 . $
  The same lemma gives $K \( c_I \) lt.eq m^(4 + o \( 1 \)) K \( d \)$ in every bin. Since $A \( c_I \) lt.eq G \( c_I \)$, multiplication by the square root of this capacity bound proves amplification at most $m^(2 sigma + o \( 1 \))$.
  The classes of admissible families increase with $sigma$. Consequently $gamma_sigma$ is nondecreasing and at most $gamma$; also $gamma_1 = gamma$, since there are only $m^2$ terminal time bins. The set on which equality holds is therefore an upper interval, possibly without its lower endpoint. Its infimum satisfies $s gt.eq gamma \/ 2 > 0$, and the other assertions about $gamma_sigma$ follow. Equality at $sigma = s$ is not needed.
  To obtain comparable initial amplitudes, first normalize the largest one. The polynomial coordinate counts and the polynomial comparison between coordinate norms and the packet norms allow amplitudes below a sufficiently small fixed negative power of $m$ to be discarded. The remaining amplitudes lie in $O \( log m \)$ dyadic classes. Writing the input as their sum and using linearity followed by the triangle inequality for the output norm, one class retains at least an inverse-logarithmic fraction of the output norm. Restriction to that class can only decrease the initial raw gauge. Its cubed amplification therefore loses a subpower factor. Rescaling its amplitudes gives the interval $\[ 1 \, 2 \]$. The support restriction is hereditary under this operation. ◻
]

An upper bound with exponent $gamma_sigma$ also holds with the initial atomic norm in place of the raw gauge: decompose the input into atoms on its given support and apply the triangle inequality. In particular, Lemma 46 permits this improved bound at one transition of a masked diagram whenever the two supports of that transition satisfy the time restriction. We will repeatedly use the following consequence:

$ upright("a fixed improvement below the time exponent ") s upright(" at one transition")\
upright("gives a fixed improvement below ") gamma upright(" for the diagram.") quad "(7.2)" $ <ext:gap>

The improvement in (7.2) is measured in $m$-power units when the transition ratio is a fixed positive power of $m$.

=== 7.2 A second extremum: the number of paths <a-second-extremum-the-number-of-paths>

Fix $J gt.eq 1$, and let $m_j$, $0 lt.eq j lt.eq J$, be dyadic roundings of $m^(j \/ J)$, with $m_0 = 1$ and $m_J = m$. Put

$ ell_j = m_(j + 1) / m_j \, #h(2em) theta_j = m_j delta \, #h(2em) r_j = m_j^(- 2) \, #h(2em) w_j = r_j theta_j . $

Thus $log_m ell_j arrow.r 1 \/ J$. Insert the intermediate frame identities and truncate to polynomial grids, as permitted by Lemma 47. A diagram consists of these exact transitions and arbitrary vertex masks, including a possible initial mask. Its input array $d$ is normalized as in Lemma 53, on a root set $cal(R)$; amplification is always measured against the entire array on this set, even if an additional root mask is used.

For each fixed $J$, an index $i$ will label a sequence of families. Within family $i$, the polynomial bounds of Definition 44 and all positive radius powers are fixed before $m arrow.r oo$; these bounds may depend on $i$. We write $o_i \( 1 \)$ in an exponent for an error whose limiting upper absolute value as $m arrow.r oo$ tends to zero as $i arrow.r oo$. This includes subpower losses within a fixed family. Thus $J$ remains fixed while we first take the inner limit in $m$ and then the outer limit in $i$. The construction is valid for every fixed $J$; we will later choose one sufficiently large for the geometric time-profile hypothesis.

For a fixed positive radius power $eta$, join an active index $v$ at level $j$ to an active index $b$ at level $j + 1$ when

$ I_b subset I_v \, #h(2em) \| nu_b - nu_v \| lt.eq m^eta theta_(j + 1) \, #h(2em) \| z_b - z_v - \( t_(I_b) - t_(I_v) \) U_(nu_v) \| lt.eq m^eta w_j . quad "(7.3)" $ <eq:source-35>

A path is a sequence of such edges from an active root to a terminal leaf.

===== 7.2.1 Locality for error diagrams. <ext:diagram-locality>

We will repeatedly discard a vertex class whose contribution has a nonadjacent edge in every complete matrix-product summand. For every prescribed $A > 0$, this contribution is $O \( m^(- A) max_(v in cal(R)) \| d_v \| \)$, both coordinatewise and in the packet norms. Indeed, Lemma 47 makes the nonadjacent coefficient smaller than any prescribed negative power; the remaining coefficients and the number of summands have polynomial bounds, and there are only $J$ layers. Choose the locality decay order after the graph radius and these fixed family bounds. This applies, in particular, to roots with no graph path to the tested output and to intermediate vertices with no suffix to that output. It bounds the error of the vertex masking; the retained diagram continues to use the full transition matrices.

#thm([Lemma 7.2.])[
  (Endpoint localization).  #emph[Along a path from level $a$ to level $b > a$, the endpoint angle difference is $O_J \( m^eta theta_b \)$, and 
$ \| z_b - z_a - \( t_(I_b) - t_(I_a) \) U_(nu_a) \| lt.eq O_J \( m^eta w_a \) . $

 For a fixed root and a fixed terminal leaf, the number of paths is at most $m^(O \( J eta \) + o \( 1 \))$.]
] <ext:endpoints>

#proof[
  The angular differences are bounded by a geometric sum of the successive child widths. For the position bound, write $t_j = t_(I_j)$, $U_j = U_(nu_j)$, and $e_j = z_(j + 1) - z_j - \( t_(j + 1) - t_j \) U_j$. Telescoping gives
  $ z_b - z_a - \( t_b - t_a \) U_a = sum_(j = a)^(b - 1) e_j + sum_(j = a + 1)^(b - 1) \( t_b - t_j \) \( U_j - U_(j - 1) \) . $
  The edge errors satisfy $\| e_j \| lt.eq m^eta w_j$. For a switch from level $j - 1$ to level $j$, Lipschitz continuity of the velocity map gives $\| U_j - U_(j - 1) \| lt.tilde m^eta theta_j$, while nesting gives $0 lt.eq t_b - t_j lt.eq r_j$. Its contribution is therefore $O \( m^eta theta_j r_j \) = O \( m^eta w_j \)$. Summing and using $w_j lt.eq w_a$ proves the positional endpoint bound.
  For fixed endpoints, the intermediate time interval at each level is the unique ancestor of the terminal interval. At level $j$, the angular grid has spacing $theta_j$, while the angle lies within $O_J \( m^eta theta_j \)$ of the root angle. There are $m^(O \( eta \) + o \( 1 \))$ choices. Given this angle, the endpoint bound applied from level $j$ to the terminal leaf locates $z_j$ within $O_J \( m^eta w_j \)$ of a prescribed point. On the position grid of spacing comparable to $w_j$, this again gives $m^(O \( eta \) + o \( 1 \))$ choices. Multiplication over the fixed number of intermediate levels proves the claim. ◻
]

At accuracy $epsilon.alt > 0$, call a family of diagrams admissible if it has a fixed radius power $0 < eta < epsilon.alt$, amplification at least $m^(gamma - epsilon.alt)$, and at most $m^(2 \( s + epsilon.alt \))$ terminal time bins accessible from every root by paths at that radius. For such a family consider the limiting lower exponent of

$ frac(\# { upright("paths") }, \# cal(R)) . quad "(7.4)" $ <eq:source-36>

#thm([Lemma 7.3.])[
  (Minimal path count).  #emph[Admissible families exist at arbitrarily small accuracies. The infima of the limiting lower exponents in (7.4) have a finite limit as $epsilon.alt arrow.b 0$. There are families approaching this limit, with accuracies tending to zero, for which the following holds. Call their graphs the high graphs. Choose a smaller fixed positive radius power in each family, tending to zero with its accuracy, and call the corresponding graphs low graphs. After any fixed number of further vertex maskings that retain amplification $m^(gamma - o_i \( 1 \))$, one has 
$ \# { upright("remaining low paths") } gt.eq m^(- o_i \( 1 \)) \# { upright("original high paths") } . quad "(7.5)" $ <eq:source-37>

]
] <ext:path-minimum>

#proof[
  If $s < 1$, choose a support exponent strictly between $s$ and $s + epsilon.alt$; its propagation exponent is $gamma$ by Lemma 53. If $s = 1$, use the unrestricted families. In either case choose a near-extremal single-step family with the desired time sparsity at some fixed enlarged direct radius, and make its input amplitudes comparable. Insert the intermediate identities. By Lemma 54, a sufficiently smaller fixed radius power at the intermediate levels ensures that every path endpoint is a direct touch at the originally chosen radius. Truncation errors and dyadic losses can be made smaller than the unused accuracy. This gives the required admissible families.
  At each step, a parent has at most $O \( m^(4 eta) ell_j^2 \)$ children in a given time bin: the angular grid contributes $O \( m^(2 eta) \)$ choices and the position grid contributes $O \( m^(2 eta) ell_j^2 \)$. There are $ell_j^2$ child time bins. Hence the total path count per root is at most $m^(4 + 4 J eta + o \( 1 \))$. For a lower bound, let $cal(R)'$ be the roots having at least one path. All other roots contribute a negligible error by the locality observation above. Since $1 lt.eq \| d_v \| lt.eq 2$,
  $ G \( d \|_(cal(R)') \)^3 lt.eq C thin frac(\# cal(R)', \# cal(R)) thin G \( d \)^3 . $
  Here the squared mass drops in the displayed proportion, and its capacity does not increase. Composition with exponent $gamma + o \( 1 \)$, together with the lower amplification, gives $\# cal(R)' \/ \# cal(R) gt.eq m^(- epsilon.alt - o \( 1 \))$. There is at least one path per root of $cal(R)'$, proving a lower bound for the exponent in (7.4). The admissible classes are nested as $epsilon.alt$ decreases, so their infima have a finite monotone limit; denote it by $Lambda_J$.
  Choose near-minimizers with accuracies $epsilon.alt_i arrow.b 0$, and pass to subsequences on which their path-count exponents approach $Lambda_J$ also from above. Let their fixed high radius powers be $eta_i$, and choose low powers $0 < eta_i^(upright("lo")) lt.double eta_i$. Suppose further masks have amplification $m^(gamma - rho_i + o \( 1 \))$ with $rho_i arrow.r 0$. The resulting low graph inherits the original upper bound on accessible terminal bins. It is therefore an admissible competitor with accuracy tending to zero, for example an accuracy slightly larger than $max \( epsilon.alt_i \, rho_i \, eta_i^(upright("lo")) \)$. Its limiting lower exponent is at least $Lambda_J - o_i \( 1 \)$. The original high graph has exponent at most $Lambda_J + o_i \( 1 \)$ on the chosen subsequence. This proves (7.5). All adaptive masks still form families with fixed polynomial bounds at each $i$, so this comparison applies to each of a fixed finite number of such selections. ◻
]

Figure 2 shows how this path-retention property enters the rest of the proof.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.15, 0), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[First extremum: $s$#linebreak()\(\_\<\) for $sigma <s$]])])
  content((3.15, 0), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Second extremum: paths per root#linebreak()retain paths under later masks]])])
  content((-3.15, -1.75), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Control conditional time-bin#linebreak()counts and probabilities]])])
  content((3.15, -1.75), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Select terminal coefficients#linebreak()control incoming path counts]])])
  content((-3.15, -3.5), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Geometric propagation#linebreak()bound output capacity]])])
  content((3.15, -3.5), [#box(width: 4.952cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Exact maps and refined decoupling#linebreak()second and fourth moments]])])
  content((0, -5.3), [#box(width: 5.552cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#5e7a96")), fill: rgb("#f6f7f9"), [#set text(hyphenate: false); #align(center)[Capacity--mass cancellation#linebreak()\(10\)]])])
  line((-3.15, 0), (3.15, 0), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((3.15, 0), (3.15, -1.75), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((3.15, -1.75), (-3.15, -1.75), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((-3.15, -1.75), (-3.15, -3.5), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((3.15, -1.75), (3.15, -3.5), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((-3.15, -3.5), (0, -5.3), stroke: (paint: rgb("#476787")), mark: (end: ">"))
  line((3.15, -3.5), (0, -5.3), stroke: (paint: rgb("#476787")), mark: (end: ">"))
})],
  caption: [Figure 2: The two extrema in the packet proof. Here $s$ is the infimum of the terminal time-support exponents permitting amplification approaching $gamma$. Graph paths run from initial packet indices (roots) to terminal indices (leaves). Minimizing the limiting exponent of the path count per original root forces later coordinate selections to retain enough paths whenever they preserve nearly maximal amplification. Uniform counting on a selected path set supplies the time law needed for geometric propagation. The second- and fourth-moment estimates concern the exact masked coefficient maps. ],
) <fig:packet-proof-map>

Fix these high and low radii. Between them choose a fixed intermediate radius power $eta_i^(upright("mid"))$ in each family, so that $eta_i^(upright("lo")) < eta_i^(upright("mid")) < eta_i$. The strict gaps absorb bounded constants in neighborhood containments once $m$ is sufficiently large. Figure 3 illustrates the inclusions used below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.4, 0), (10.7, 0), stroke: (paint: rgb("#acacac")), mark: (end: ">"))
  content((10.7, 0), [time], anchor: "west")
  line((0, -1.55), (0, 1.7), stroke: (paint: rgb("#acacac")), mark: (end: ">"))
  content((0, 1.7), [position], anchor: "south")
  line((0, -1.2), (10, -0.2), (10, 2.2), (0, 1.2), close: true, fill: rgb("#f6f7f9"))
  line((0, -0.4), (10, 0.6), (10, 1.4), (0, 0.4), close: true, fill: rgb("#d8dfe5"))
  line((0, 0), (10, 1), stroke: (paint: rgb("#194169")))
  line((0, -1.2), (10, -0.2), stroke: (paint: rgb("#8ca0b4"), dash: "dashed"))
  line((0, 1.2), (10, 2.2), stroke: (paint: rgb("#8ca0b4"), dash: "dashed"))
  line((0, -0.4), (10, 0.6), stroke: (paint: rgb("#476787")))
  line((0, 0.4), (10, 1.4), stroke: (paint: rgb("#476787")))
  line((5, -1.15), (5, 1.8))
  circle((5, 0.66), radius: 0.07056, fill: black)
  content((5, 0.66), [$b$])
  circle((5, 0.3), radius: 0.07056, fill: black)
  content((5, 0.3), [$b'$])
  content((7.5, 1.75), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [parent high])])
  content((7.8, 1.02), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [parent low])])
  content((5, -1.28), [one child time bin], anchor: "north")
  content((0.6, 0.15), [parent centerline], anchor: "south-west")
  content((5, -2.1), [Position cross-section at the marked bin])
  rect((1.1, -3.97), (8.9, -3.13), fill: rgb("#f6f7f9"), stroke: (paint: rgb("#8ca0b4"), dash: "dashed"))
  rect((2.92, -3.85), (8.12, -3.25), fill: rgb("#e8ecf0"), stroke: (paint: rgb("#6a849e")))
  rect((3.7, -3.73), (6.3, -3.37), fill: rgb("#d8dfe5"), stroke: (paint: rgb("#476787")))
  line((5, -4.45), (5, -3.05), stroke: (paint: rgb("#acacac")))
  line((5.52, -3.85), (5.52, -3.25), stroke: (paint: rgb("#6a849e")))
  circle((5.52, -3.55), radius: 0.07056, fill: black)
  circle((4.35, -3.55), radius: 0.07056, fill: black)
  content((5.52, -4.03), [$b$], anchor: "north")
  content((4.35, -4.03), [$b'$], anchor: "north")
  content((5, -4.51), [parent center], anchor: "north")
  content((2.075, -2.75), [parent high])
  line((2.075, -2.96), (1.685, -3.13), stroke: (paint: rgb("#8ca0b4")))
  content((6.43, -2.75), [intermediate about $b$])
  line((6.43, -2.96), (7.145, -3.25), stroke: (paint: rgb("#6a849e")))
  content((2.14, -4.27), [parent low])
  line((2.92, -4.17), (3.7, -3.73), stroke: (paint: rgb("#476787")))
})],
  caption: [Figure 3: Schematic localization neighborhoods in one position coordinate. At the marked child time bin, the intermediate neighborhood centered at the selected low child $b$ contains every low child of the parent in that bin and is contained in the parent’s high neighborhood. The angular bounds in the actual neighborhoods are not depicted. These inclusions are used for counting paths; the analytic evolution uses the exact coefficient maps with vertex masks. ],
) <fig:adjacency-radii>

=== 7.3 Regularizing the graph by vertex masks <regularizing-the-graph-by-vertex-masks>

We first record how dyadic selections affect the exact diagram. Partitioning the active coordinates at any one layer into $O \( \( log m \)^C \)$ classes writes the exact output as a sum of the outputs with the corresponding vertex masks inserted. The triangle inequality for $cal(A)$ selects a class losing only a subpower factor in amplification. This remains true through finitely many layers. The integer path statistics below have polynomial size, so their positive values require only logarithmically many dyadic classes. Vertices with no high suffix have negligible output contribution by the locality observation and can be discarded.

Let $D_j \( v \)$ be the number of suffix paths from $v$ in the #emph[original high graph]. For a vertex $b$ at level $j + 1$, let $cal(N)_j \( b \)$ consist of the original high vertices $b'$ at level $j + 1$ satisfying

$ I_(b') = I_b \, #h(2em) \| nu_(b') - nu_b \| lt.eq m^(eta_i^(upright("mid"))) theta_(j + 1) \, #h(2em) \| z_(b') - z_b \| lt.eq m^(eta_i^(upright("mid"))) w_j . $

Define

$ S_j \( b \) = sum_(b' in cal(N)_j \( b \)) D_(j + 1) \( b' \) . $

If $b$ is a low child of $v$, the triangle inequality shows that $cal(N)_j \( b \)$ contains every low child of $v$ in that time bin and is contained in the high children of $v$. Indeed, for fixed $i$ and sufficiently large $m$,

$ 2 m^(eta_i^(upright("lo"))) lt.eq m^(eta_i^(upright("mid"))) \, #h(2em) m^(eta_i^(upright("mid"))) + m^(eta_i^(upright("lo"))) lt.eq m^(eta_i) . $

The predicted child position in (7.3) is the same for all children in that bin.

#thm([Lemma 7.4.])[
  (Time branching and pruning).  #emph[One can retain amplification $m^(gamma - o_i \( 1 \))$ by vertex masks such that 
$ D_j \( v \) asymp d_j \, #h(2em) S_j \( b \) asymp s'_j $

 on the selected coordinates, for $0 lt.eq j lt.eq J$ in the first comparison and $0 lt.eq j < J$ in the second, with 
$ d_j / s'_j gt.eq ell_j^(2 s) m^(- o_i \( 1 \)) . quad "(7.6)" $ <eq:source-38>

 One can then prune backwards, retaining this amplification, so that every surviving vertex at level $j$ has at least 
$ \( m \/ m_j \)^(2 s) m^(- o_i \( 1 \)) $

 terminal descendant time bins by low paths. In the pruned graph, and after any subsequent masks, each root reaches at most 
$ m_j^(2 s) m^(o_i \( 1 \)) quad "(7.7)" $ <eq:source-39>

 distinct time bins at level $j$.]
] <ext:branching>

#proof[
  Select dyadic classes for all the indicated positive statistics. For each time bin touched by a remaining parent $v$, select one remaining low child $b$. Its intermediate neighborhood contributes at least a constant times $s'_j$ to $D_j \( v \)$. These contributions for distinct time bins are disjoint, because each suffix has a unique child time bin. Thus the number of touched bins is at most $C d_j \/ s'_j$.
  If (7.6) failed by a fixed positive power of $m$ along a subsequence, the bound $C d_j \/ s'_j$ would, after rebasing the parent interval, be at most $ell_j^(2 sigma + o \( 1 \))$ for some fixed $sigma < s$. Here $log_m ell_j arrow.r 1 \/ J$, and the low radius remains a fixed positive power in the $ell_j$ units within each family. Thus the selected parent and child supports satisfy the hypothesis of (7.2). Its strict improvement for the full transition contradicts the retained amplification, proving (7.6).
  For the pruning, begin at level $J - 1$ and proceed backwards. At level $j$, delete every parent touching fewer than $ell_j^(2 s) m^(- a)$ distinct child time bins in the current child mask, initially with a fixed $a > 0$. The difference made to the output is a diagram whose transition at this level starts from the deleted parent set and ends in that current child mask. That transition has the strict sparsity improvement just described. A telescoping decomposition of the successive mask changes contains only $J$ such error diagrams. Each has a fixed exponent gap, and the triangle inequality shows that their total is negligible compared with a sufficiently accurate near-extremal diagram.
  We may consequently let the deficit $a = a_i arrow.b 0$ slowly enough that its positive exponent gap still dominates the amplification errors in the $i$-th family. This is a diagonal choice: first use the gap for each fixed deficit, and then take the initial accuracies and the family bases sufficiently far out. No quantitative continuity of $gamma_sigma$ at $s$ is required. The resulting pruned graph retains amplification $m^(gamma - o_i \( 1 \))$.
  Each surviving parent now has at least $ell_j^(2 s) m^(- a_i)$ child time bins with surviving low children. Choose one child in each such bin and iterate. The descendant bins associated with distinct child time bins are disjoint. Induction therefore gives at least
  $ product_(h = j)^(J - 1) ell_h^(2 s) m^(- a_i) = \( m \/ m_j \)^(2 s) m^(- \( J - j \) a_i) $
  terminal bins from every surviving level-$j$ vertex.
  Fix a root and one reachable vertex in each of its reachable level-$j$ time bins. The just constructed terminal descendants are disjoint for these different time bins, and all are accessible from the root in the original high graph. In that graph this root reaches at most $m^(2 \( s + epsilon.alt_i \))$ terminal time bins. Dividing this bound by the lower descendant count gives (7.7). If later masks remove some descendants, the original pruned descendants remain valid witnesses in this counting argument; later masks can only decrease the set of reachable prefixes. ◻
]

#thm([Lemma 7.5.])[
  (Incoming counts and terminal selection).  #emph[Further vertex masks can be chosen retaining amplification $m^(gamma - o_i \( 1 \))$ so that the following hold. At each transition, every remaining child has between $k_j$ and $2 k_j$ low parents in the current parent mask, for a positive integer $k_j$. Put $k = product_(j = 0)^(J - 1) k_j$. Each terminal leaf has between $k$ and $2^J k$ incoming low paths, whereas any fixed root–leaf pair has at most $m^(o_i \( 1 \))$ such paths. There is $h_1 > 0$ such that 
$ \| c_b \|^2 asymp h_1 k $

 on all remaining leaves. Moreover, restricting the output to any subset occupying a fraction $m^(- o_i \( 1 \))$ of these leaves still retains amplification $m^(gamma - o_i \( 1 \))$.]
] <ext:leaves>

#proof[
  Proceed forwards. At transition $j$, count the low parents of each child in the already selected parent mask, discard the zero-count class by the locality observation, and select a positive dyadic class retaining amplification $m^(gamma - o_i \( 1 \))$. Subsequent forward selections do not change any already fixed parent layer. Thus the asserted incoming degrees hold in the final graph. Induction from the roots gives the bounds $k$ and $2^J k$ for the number of incoming paths to each leaf. The bound for a specified root–leaf pair follows from Lemma 54, because the radius powers tend to zero.
  It remains to choose the leaves with the stronger norm property. On the finite coordinate space, the lattice norm $cal(A)$ has a nonnegative dual functional $lambda$ of dual norm one satisfying
  $ sum_b lambda_b \| c_b \| = cal(A) \( c \) . $
  One may take the absolute values of a norming functional: the lattice property preserves its dual norm. Polynomial norm comparisons and coordinate counts permit tiny coordinate amplitudes to be discarded with negligible norm, hence negligible pairing with $lambda$. Discarding additionally those contributions $lambda_b \| c_b \|$ smaller than a sufficiently large negative power of $m$ times $cal(A) \( c \)$ loses negligible total pairing, by the polynomial coordinate count. Partition the remaining leaves jointly into dyadic classes for these two quantities. There are only a power of $log m$ such classes. Some class $cal(B)$ satisfies
  $ sum_(b in cal(B)) lambda_b \| c_b \| gt.eq \( log m \)^(- C) cal(A) \( c \) \, #h(2em) \| c_b \|^2 asymp h_1 k quad \( b in cal(B) \) $
  for a suitable $h_1 > 0$. Keep this class as a final leaf mask. Incoming path counts for its leaves are unaffected.
  If $cal(B)' subset cal(B)$ occupies a fraction $f$, comparability of $lambda_b \| c_b \|$ gives
  $ cal(A) \( c \|_(cal(B)') \) gt.eq sum_(b in cal(B)') lambda_b \| c_b \| gt.eq 1 / 2 f thin \( log m \)^(- C) cal(A) \( c \) . $
  For $f = m^(- o_i \( 1 \))$, cubing this inequality loses only a vanishing exponent. The functional need not norm any of the later restricted outputs. ◻
]

=== 7.4 The conditional time law <the-conditional-time-law>

The masks now control prefix counts and incoming leaf degrees while preserving near-extremal amplification. To apply geometric propagation, we still need both support counts and maximal probabilities at every time depth, conditional on each retained root. We obtain these from uniform counting on a selected set of paths. This counting law is auxiliary; the coefficients continue to come from the exact masked matrix maps.

All graph statistics $D_j$ and $S_j$ still refer to the original high graph. All low path counts in this subsection refer to the final masks of Lemma 57.

#thm([Lemma 7.6.])[
  (A linear conditional time profile).  #emph[There is a subset $Omega$ of the final low paths occupying a fraction $m^(- o_i \( 1 \))$ of them such that uniform counting on $Omega$ has these properties:]
  + #emph[Its root marginal is comparable to the uniform law on a set of $N_0$ roots.]
  + #emph[Given each root, the terminal time satisfies (2.1), with base $M = m^2$, target exponent $s$, and error $O \( 1 \/ J \) + o_i \( 1 \)$.]
  #emph[The subset is used only to define this law; it does not change any internal summand of the terminal coefficients.]
] <ext:time-law>

#proof[
  Let $H$ be the original high path count and $L$ the final low path count. By Lemma 55, $L gt.eq m^(- alpha_i) H$, where $alpha_i = o_i \( 1 \)$. Write $T^(\( j \))$ for the level-$j$ time interval containing the terminal time. For a vertex $v$, let $P_H \( v \)$ and $P_L \( v \)$ be its high and final low prefix counts, and let $D_L \( v \)$ be its final low suffix count. Thus $P_L \( v \) lt.eq P_H \( v \)$ and $D_L \( v \) lt.eq D_j \( v \)$.
  Choose $beta_i arrow.b 0$ sufficiently slowly that $beta_i - alpha_i$ dominates the other errors and $m^(alpha_i - beta_i) arrow.r 0$ within each family. Call a remaining level-$j$ vertex bad if
  $ D_L \( v \) < m^(- beta_i) D_j \( v \) . $
  The number of final low paths through bad vertices at this level is bounded by
  $ sum_(v med upright("bad")) P_L \( v \) D_L \( v \) lt.eq m^(- beta_i) sum_v P_H \( v \) D_j \( v \) = m^(- beta_i) H . $
  In the final sum, $v$ ranges over all vertices of the original high graph at that level. Its equality to $H$ holds because every high path visits exactly one such vertex. Summing over $J + 1$ levels shows that the event $cal(G)$ that every visited vertex is good has probability $1 - o \( 1 \)$ under uniform final low path counting.
  Consider this unrestricted uniform low law, conditional on a complete vertex prefix ending at a good $v$ at level $j$. For a prescribed child time bin $I$, its next-bin probability is
  $ frac(sum_(b med upright(l o w med c h i l d med o f) med v\
I_b = I) D_L \( b \), D_L \( v \)) lt.eq m^(beta_i + o_i \( 1 \)) s'_j / d_j lt.eq m^(o_i \( 1 \)) ell_j^(- 2 s) . quad "(7.8)" $ <ext:one-bin>
  If the numerator is nonzero, choose one remaining child $b$ in that bin. Its intermediate neighborhood contains every other low child there, and the original high suffix sum on the neighborhood is comparable to $s'_j$. This bounds the numerator. Goodness and $D_j \( v \) asymp d_j$ bound the denominator, and (7.6) gives the final inequality.
  To iterate (7.8), kill a path as soon as it visits a bad vertex. Fix a nested sequence of time bins through level $j$. Conditional on each surviving #emph[vertex] prefix, the next prescribed-bin probability is bounded by (7.8). Averaging over the vertex prefixes having the same time prefix preserves that bound. Induction, with the process killed at every step, therefore gives, for every root $v$ and level-$j$ bin $I$,
  $ Pr \( cal(G) \, med T^(\( j \)) = I divides v \) lt.eq m^(o_i \( 1 \)) product_(h < j) ell_h^(- 2 s) = m^(o_i \( 1 \)) m_j^(- 2 s) . quad "(7.9)" $ <ext:killed>
  If the root is bad the left side is zero. In writing $cal(G)$ on the left, one may first require survival only through level $j$, for which the induction applies directly, and then impose survival at later levels. This can only decrease the probability. Multiple vertex prefixes with the same time prefix introduce no additional count.
  Discard roots for which $Pr \( cal(G) divides v \) < 1 \/ 2$. Their total probability under the original low root law is at most $2 Pr \( cal(G)^c \) = o \( 1 \)$. Keep the good paths on the other roots. Dividing (7.9) by their conditional survival probability costs at most two, so the maximum probability of a level-$j$ time bin, conditional on each retained root, is $m^(- 2 s log_m m_j + o_i \( 1 \))$. The support bound at that level is (7.7).
  Between consecutive level depths, monotonicity of probabilities uses the preceding level for the maximum weight, and monotonicity of supports uses the following level for the number of occupied bins. Since the gap in base-$M = m^2$ depths is $1 \/ J + o \( 1 \)$, these give (2.1) at every dyadic depth with error at most $s \/ J + o_i \( 1 \)$. The dyadic roundings change only bounded factors.
  The retained measure is still uniform on a subset of paths. Its positive root weights have polynomial ratios, because the numbers of paths are positive integers with polynomial upper bounds. Select a dyadic class of root weights carrying an inverse-logarithmic fraction of the measure, and keep all retained paths from those roots. If their number is $N_0$, the new root weights are comparable to $1 \/ N_0$. This selection of whole root fibers does not change the root-conditional time laws and retains a fraction $m^(- o_i \( 1 \))$ of all final low paths. ◻
]

=== 7.5 Geometry bounds the capacity of the output <geometry-bounds-the-capacity-of-the-output>

Fix a positive $zeta < gamma - 10 kappa$. Choose $J$ sufficiently large that the $O \( 1 \/ J \)$ error in Lemma 58 lies within the small-error range of Theorem 5 for exponent $1 + 2 s - 10 kappa - zeta \/ 2$, and then take $i$ sufficiently large. All the preceding selections are made for this fixed $J$.

For a subset $cal(P)$ of the final low paths, say that a root $v$ is represented in a terminal bin $I$ if some path of $cal(P)$ starts at $v$ and ends in $I$. Count each such root once in that bin, regardless of the number of its paths. Call the paths in $cal(P)$ represented paths.

#thm([Lemma 7.7.])[
  (Represented roots).  #emph[Fix any polynomial upper bound on the radii within each family. There is a subset $cal(P)$, which may depend on this bound, occupying a fraction $m^(- o_i \( 1 \))$ of all final low paths with the following property. In every terminal bin $I$, the number of represented roots satisfying 
$ U_(nu_v) in u + F \, #h(2em) z_v + t_I U_(nu_v) in x + r F $

 is at most 
$ K \( d \) delta^(- 2) W \( F \) thin m^(- 2 \( 1 + s - 10 kappa - zeta \) + o_i \( 1 \)) \, #h(2em) upright("radii") \( F \) gt.eq m^2 delta \, quad "(7.10)" $ <eq:source-41>

 uniformly over all independent centers $u \, x in bb(R)^2$ and all radii up to the chosen upper bound. One can keep a fraction $m^(- o_i \( 1 \))$ of the final leaves such that every kept leaf has at least $k m^(- o_i \( 1 \))$ represented incoming paths.]
] <ext:represented>

#proof[
  Put the uniform law of Lemma 58 on its path subset, take the root as base label, and assign it line parameters $\( U_(nu_v) \, z_v \)$. The root weights are comparable to $1 \/ N_0$, and $1 lt.eq \| d_v \| lt.eq 2$. The input capacity definition therefore gives the density constant
  $ K_0 lt.tilde frac(K \( d \) delta^(- 2), N_0) $
  for tests with radii at least $delta$.
  We fix the width range before applying geometry. Choose a polynomial cutoff $H gt.eq m^2 delta$ bounding the norms of all tested velocities and all spatial coordinates after division by $r$, including the root-line positions and terminal position labels. In the axes of a rectangular test with half-widths $e_j$, each coordinate interval meets the bounded support in a set contained in an interval of half-width $min \( e_j \, H \)$. Choose the two centers independently, using the same clipped half-widths and axes. The resulting joint test covers the original test on the support, and its weight is no larger, up to the fixed ellipse–rectangle comparison. Thus one polynomial width range controls the full terminal capacity supremum.
  Choose $B = m^A$ larger than this cutoff, the upper width bound in the statement, and the root coordinate bounds, with a fixed power margin. This margin also covers the endpoint enlargements. With $M = m^2$, we have $B gt.eq M delta$. Rescale both line coordinates by $B^(- 1)$. The new input floor is
  $ delta' = delta \/ B = M^(- D_m) \, #h(2em) D_m = 1 / 2 \( log_m N + A \) gt.eq 1 . $
  The density constant becomes $K_0 B^2$, since $W$ is homogeneous of degree two. The output weight of a test is $W \( F \/ B \) = B^(- 2) W \( F \)$, so these factors cancel on returning to the old coordinates. The new output floor $M delta'$ corresponds exactly to $M delta$ in the old coordinates. This also covers $m = N$, for which the unnormalized floor would have given the inadmissible value $D = 1 \/ 2$. To make the complexity fixed, take a subsequence with $D_m arrow.r D_0$, and choose $D_(*) = D_0 + a$, where $0 < a < zeta \/ 16$. Eventually $0 < D_(*) - D_m < 2 a$. A radius at least $M^(- D_(*))$ but below the available input floor $M^(- D_m)$ can therefore be rounded up by a factor at most $M^(2 a)$. Doing this to both radii increases $W$ by at most $M^(4 a) = m^(8 a)$. Thus the input cap at the fixed complexity $D_(*)$ costs at most this additional factor. The output floor for $D_(*)$ is smaller than the available output floor, so every required output test is still allowed.
  The definition of the geometric exponent as a small-error limit of an infimum over finite complexities is used here: the sufficiently small time-error threshold may be chosen for all finite $D_(*)$, although the large-base threshold and subpower losses can depend on that fixed complexity. Thus the preceding choice of $J$, followed by $i$ and then the family base, is valid.
  Apply Theorem 5, with base $M = m^2$, to obtain a dominated sublaw of subpower mass. The difference between the chosen geometric exponent and $1 + 2 s - 10 kappa - zeta$ absorbs the arbitrarily small fixed rounding loss just described. After normalization, its line-test probabilities satisfy
  $ Pr #scale(x: 120%, y: 120%)[\(] T_1 = t \, med U in F \, med X_t in r F #scale(x: 120%, y: 120%)[\)] lt.eq frac(K \( d \) delta^(- 2), N_0) thin W \( F \) thin m^(- 2 \( 1 + 2 s - 10 kappa - zeta \) + o_i \( 1 \)) . quad "(7.11)" $ <eq:source-40>
  As throughout, translations in the two tests are independent.
  There are at most $N_0 m^(2 s + o_i \( 1 \))$ possible root–terminal-time pairs. Discard pairs whose probability in this normalized law is less than
  $ N_0^(- 1) m^(- 2 s - tau_i) \, $
  where $tau_i = o_i \( 1 \)$ tends to zero slowly enough to dominate the support error. This discards $o \( 1 \)$ mass. Take $cal(P)$ to be the path atoms in the support of the law after this deletion. Each represented root in a specified terminal bin has pair probability at least this threshold. Dividing (7.11) by the threshold proves (7.10), with all normalization factors absorbed in $m^(o_i \( 1 \))$.
  Let $L$ again be the final low path count. The starting uniform law for geometry is on a subset of at least $m^(- o_i \( 1 \)) L$ paths. Its dominated geometric sublaw retains subpower mass. After normalization, the weight of any path atom is consequently at most $m^(o_i \( 1 \)) \/ L$. The remaining support therefore represents at least $m^(- o_i \( 1 \)) L$ paths, even though their new weights need not be equal.
  Every original final leaf has between $k$ and $2^J k$ incoming low paths. Choose a threshold $k m^(- upsilon_i)$, with $upsilon_i = o_i \( 1 \)$ sufficiently slow, and keep the leaves with at least this many represented incoming paths. The represented paths going to the other leaves are at most $k m^(- upsilon_i)$ times the original leaf count, which is negligible compared with the total represented path count. Since no leaf has more than $2^J k$ incoming paths, the kept leaves occupy a fraction $m^(- o_i \( 1 \))$ of all final leaves. Lemma 57 ensures that this last output restriction retains amplification $m^(gamma - o_i \( 1 \))$. ◻
]

#thm([Lemma 7.8.])[
  (Terminal capacity).  #emph[For the kept coefficients of Lemma 59, in every terminal time bin one has 
$ K \( c_I \|_(upright("kept")) \) lt.eq h_1 K \( d \) thin m^(2 \( 1 - s \) + 20 kappa + 2 zeta + o_i \( 1 \)) . quad "(7.12)" $ <ext:capacity-bound>

]
] <ext:capacity>

#proof[
  Consider an output test $E \, r E$, where the ordered radii of $E$ are $e_1 gt.eq e_2 gt.eq theta = m delta$. Let $F$ have the same axes and radii
  $ f_j = max \( e_j \, delta \/ r \) . $
  By Lemma 54, the initial root of any represented path ending in this output test belongs to the corresponding line test $F \, r F$, enlarged by $m^(o_i \( 1 \))$. Indeed the angular endpoint error is at most $m^(o_i \( 1 \)) theta$, and the position error from the root line is at most $m^(o_i \( 1 \)) delta$. The definition of $F$ covers both errors. Its radii satisfy the floor required in (7.10). The harmless power enlargement changes its weight and the resulting count only by $m^(o_i \( 1 \))$.
  For a fixed represented root at this time, the terminal angular grid supplies at most $m^(o_i \( 1 \))$ possible leaf angles. The leaf positions lie both in the spatial test $r E$ and in an enlarged root beam of radius $m^(o_i \( 1 \)) delta$. Lattice counting bounds their number by
  $ m^(o_i \( 1 \)) w^(- 2) product_(j = 1)^2 min \( r e_j \, delta \) . $
  No boundary correction is needed beyond a constant factor: both $r e_j$ and $delta$ are at least the position mesh $w$. For any root and leaf, the number of paths is $m^(o_i \( 1 \))$, by Lemma 57.
  Each kept leaf has $\| c_b \|^2 lt.tilde h_1 k$ and at least $k m^(- o_i \( 1 \))$ represented incoming paths. Its squared coefficient is therefore bounded by $h_1 m^(o_i \( 1 \))$ times that incoming count. Summing represented paths in the test, then using (7.10), gives
  $ K \( c_I \|_(upright("kept")) \) & lt.eq m^(o_i \( 1 \)) sup_E h_1 theta^2 W \( E \)^(- 1) w^(- 2) product_(j = 1)^2 min \( r e_j \, delta \)\
 & thin dot.op K \( d \) delta^(- 2) W \( F \) m^(- 2 \( 1 + s - 10 kappa - zeta \)) . $
  For the products of semiaxes,
  $ product_(j = 1)^2 min \( r e_j \, delta \) = delta^2 thin frac(e_1 e_2, f_1 f_2) \, #h(2em) frac(W \( F \), f_1 f_2) = (f_1 / f_2)^kappa lt.eq (e_1 / e_2)^kappa = frac(W \( E \), e_1 e_2) . $
  The inequality uses the reduction of aspect ratio when small radii are raised to a common floor. Finally $theta^2 w^(- 2) = r^(- 2) = m^4$. Substitution proves (7.12). ◻
]

=== 7.6 Two mass bounds and the contradiction <two-mass-bounds-and-the-contradiction>

The square root of the capacity bound contributes $m^(1 - s) h_1^(1 \/ 2)$, in addition to $m^(10 kappa + zeta + o_i \( 1 \))$. We bound the coefficient mass in two ways: the frame estimate uses the number of times reached by each root, and the fourth-power estimate gives a factor $h_1^(- 1)$. Their minimum cancels $m^(1 - s) h_1^(1 \/ 2)$ for every value of $h_1$.

#thm([Lemma 7.9.])[
  (Terminal mass).  #emph[The same kept output satisfies 
$ r w^2 sum_(b med upright("kept")) \| c_b \|^2 lt.eq m^(o_i \( 1 \)) min #scale(x: 120%, y: 120%)[\(] m^(- 2 \( 1 - s \)) \, h_1^(- 1) #scale(x: 120%, y: 120%)[\)] delta^2 \# cal(R) . quad "(7.13)" $ <ext:mass-bound>

]
] <ext:mass>

#proof[
  For the first bound, fix a terminal time bin $I$ and let $cal(R)_I$ be the roots having an original high path to that bin. Roots outside this set give a negligible error by the locality observation, applied to the original high graph with output restricted to $I$. Along the unique sequence of time ancestors of $I$, the successive exact masked transitions satisfy the squared-sum bound of Lemma 42, with the parent-bin rebasing of Lemma 46. The transition at level $j$ has squared operator norm at most $ell_j^2$, and masks are orthogonal coordinate projections. With the scale normalizations this gives
  $ w^2 sum_(b in I) \| c_b \|^2 lt.tilde delta^2 \# cal(R)_I $
  apart from negligible error. Summation with weight $r = m^(- 2)$ counts each root at most $m^(2 \( s + epsilon.alt_i \))$ times by the original high time-support bound. This proves the first term in (7.13).
  For the second bound, apply Proposition 50 at each actual masked transition. Lemma 57 bounds its low-parent multiplicity by $2 k_j$. Use Remark 52 with adjacency power $eta_i = eta_i^(upright("lo"))$: within each family the localization and sampling powers are chosen below this fixed positive power. Thus the full masked transition has the required multiplicity bound, and the product of its localization, coloring, and decoupling losses over the fixed $J$ transitions is $m^(o_i \( 1 \))$. The factor $2^J$ is absorbed in the same loss. Successive applications of (6.13) yield
  $ r w^2 sum_(b med upright("kept")) \| c_b \|^4 lt.eq k thin m^(o_i \( 1 \)) delta^2 sum_(v in cal(R)) \| d_v \|^4 lt.tilde k thin m^(o_i \( 1 \)) delta^2 \# cal(R) . $
  Since $\| c_b \|^2 asymp h_1 k$ on the kept leaves, division by $h_1 k$ proves the second term in (7.13). ◻
]

#proof[
  #emph[Completion of the proof of Theorem 45.] For each terminal bin, use its entire kept coefficient array as a single atom in the definition of $A$. Equations (7.12) and (7.13) imply
  $ cal(A) \( c \|_(upright("kept")) \)^3 & lt.eq r sum_I G \( c_I \|_(upright("kept")) \)^3\
 & lt.eq m^(10 kappa + zeta + o_i \( 1 \)) delta^2 \# cal(R) thin K \( d \)^(1 \/ 2)\
 & thin dot.op m^(1 - s) h_1^(1 \/ 2) min #scale(x: 120%, y: 120%)[\(] m^(- 2 \( 1 - s \)) \, h_1^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  For every positive $h_1$,
  $ h_1^(1 \/ 2) min #scale(x: 120%, y: 120%)[\(] m^(- 2 \( 1 - s \)) \, h_1^(- 1) #scale(x: 120%, y: 120%)[\)] lt.eq m^(- \( 1 - s \)) . $
  Also $1 lt.eq \| d_v \| lt.eq 2$ gives $G \( d \)^3 asymp delta^2 \# cal(R) thin K \( d \)^(1 \/ 2)$. The cubed amplification of the kept output is consequently at most $m^(10 kappa + zeta + o_i \( 1 \))$.
  By Lemmas 57 and 59, this same output has amplification at least $m^(gamma - o_i \( 1 \))$. Our choice $zeta < gamma - 10 kappa$, followed by sufficiently large $i$ and then sufficiently large $m$ within that family, is a contradiction. Thus the assumption $gamma > 10 kappa$ is impossible, which proves the propagation bound and its uniform finite-family formulation. ◻
]

== 8 Passage to a global estimate <sec:global>

The packet theorem first gives a cubic estimate on widely separated balls, with an arbitrarily small power loss. We remove that loss by covering a finite list of peaks with sparse families of balls. The initial finiteness of the peak list follows from an elementary fourth-power estimate for the original sphere measure.

The choices have a fixed order: first the separation exponent $C_0$, then the desired distributional error $alpha$, and finally the power loss $epsilon.alt$. The covering radii may depend on $alpha$; the sparse estimate must therefore permit $epsilon.alt$ to be chosen after those radii have been bounded.

This passage from local estimates to a global bound follows the sparse-family strategy of Tao #cite(label("Tao1999Epsilon")); compare the bounded-data formulation in #cite(label("BourgainGuth2011")) arXiv:1012.3760v3, Appendix, Lemmas A1–A2. We prove the required covering and cubic estimates below.

=== 8.1 A sparse estimate for graph patches <a-sparse-estimate-for-graph-patches>

Normalize first by $parallel g parallel_(L^oo \( S^2 \, sigma \)) = 1$. Partition the sphere into finitely many measurable pieces contained in the graph patches of Section 6. Subdivide these pieces, if necessary, so that on each piece one of the terminal windows $chi_1^(nu_0)$ is bounded below by a positive constant. Such a subdivision exists because the windows form a square partition of unity with bounded overlap. In the rotated coordinates of one piece, write its extension as

$ F_0 \( y \) = F_0 \( x \, t \) = integral_(bb(R)^2) f \( xi \) chi_1^(nu_0) \( xi \) e^(2 pi i \( x dot.op xi + t phi.alt \( xi \) \)) thin d xi \, #h(2em) parallel f parallel_oo + parallel f parallel_2 lt.eq C . quad "(8.1)" $ <glob:patch-extension>

Here $f$ is supported in a fixed compact frequency patch. The smooth surface-area density and division by $chi_1^(nu_0)$ have been absorbed into $f$. All constants in this section may depend on these finitely many fixed choices, but are independent of the original bounded measurable data. In particular, no differentiability of $f$ is assumed.

#thm([Lemma 8.1.])[
  (Sparse cubic estimate).  #emph[There are constants $C_0 > 1$ and $mu_0 > 0$ such that the following holds. Let $0 < mu lt.eq mu_0$, let $R gt.eq mu^(- 1)$, and let $cal(B)$ be a collection of at most $mu^(- 8)$ balls of radius $R$ whose distinct centers have distance at least $\( R \/ mu \)^(C_0)$. Then, for every $epsilon.alt > 0$, 
$ sum_(B in cal(B)) integral_B \| F_0 \( y \) \|^3 thin d y lt.eq C_epsilon.alt R^epsilon.alt . quad "(8.2)" $ <eq:source-42>

 The constants are uniform over the data in (8.1) and all translations of the balls.]
] <glob:sparse-cubic>

#proof[
  Choose a dyadic $N$ with $4 R lt.eq N^2 < 16 R$, and put $delta = N^(- 1)$. For a ball with center $b_B in bb(R)^3$, set $a_B = b_B - \( 0 \, 0 \, N^2 \/ 2 \)$. The coordinates $y = a_B + N^2 \( z \, t \)$ place that ball inside ${ \| z \| lt.eq 1 \/ 4 \, med 1 \/ 4 lt.eq t lt.eq 3 \/ 4 }$. We shall also translate the physical sampling lattice by
  $ u in Q = \[ 0 \, L_(upright(f))^(- 1) \)^2 times \[ 0 \, 1 \) . $
  For each such $u$, define
  $ f_(B \, u) \( xi \) = f \( xi \) e^(2 pi i \( a_B + u \) dot.op \( xi \, phi.alt \( xi \) \)) . $
  These functions have the same $L^oo$ and $L^2$ bounds as $f$. All estimates that follow are uniform in $u$ and in the ball locations. Those locations enter only through this modulation of the input; the retained packet coordinates stay in the same bounded normalized region.
  At factor $1$, retain the analysis coefficients of $f_(B \, u)$ with angular windows meeting the fixed frequency support and positions
  $ z in L_(upright(f))^(- 1) delta bb(Z)^2 \, #h(2em) \| z \| lt.eq Z_0 \, $
  where $Z_0$ is a sufficiently large fixed constant. Denote the resulting finite array by $d^(B \, u)$. For each angle $nu$, Fourier-series Parseval gives
  $ sum_z \| d_(nu \, z)^(B \, u) \|^2 lt.eq \( L_(upright(f)) delta \)^2 integral \| f \( xi \) chi_delta^nu \( xi \) \|^2 thin d xi lt.eq C delta^4 . quad "(8.3)" $ <glob:angle-mass>
  The velocity centers $U_nu = - nabla phi.alt \( nu \)$ are separated by at least $c delta$, since the Hessian of the extended phase is uniformly definite. An ellipse $E$ whose radii satisfy $L gt.eq w gt.eq delta$ thus contains at most $C \| E \| delta^(- 2)$ such centers: its $O \( delta \)$ enlargement has area comparable to $\| E \|$. Ignoring the positional restriction in the definition of capacity, we obtain from (6.3) and (8.3)
  $ K \( d^(B \, u) \) lt.eq C delta^4 sup_E frac(\| E \|, W \( E \)) lt.eq C delta^4 \, quad "(8.4)" $ <glob:initial-capacity>
  because $\| E \| \/ W \( E \)$ is a constant multiple of $\( w \/ L \)^kappa lt.eq 1$.
  We next prove the estimate that saves the number of balls:
  $ sum_(B in cal(B)) sum_v \| d_v^(B \, u) \|^2 lt.eq C delta^2 . quad "(8.5)" $ <glob:joint-mass>
  Let $T_B$ be the retained analysis operator acting on the unmodulated function $f$, so that $T_B f = d^(B \, u)$, and let $T = \( T_B \)_(B in cal(B))$. The frame identity shows that each $T_B$ has operator norm at most $L_(upright(f)) delta$. Hence the diagonal blocks of $T T^(*)$ have operator norm at most $C delta^2$.
  An entry in an off-diagonal block is, up to complex conjugation, an integral of the form
  $ integral A \( xi \) e^(2 pi i \( q dot.op xi + s phi.alt \( xi \) \)) thin d xi \, #h(2em) \( q \, s \) = a_B - a_(B') + N^2 \( z - z' \, 0 \) \, quad "(8.6)" $ <glob:gram-entry>
  where $A$ is a product of two $delta$-scale windows supported in a fixed compact set. The common translation $u$ cancels. The position offsets have size $O \( N^2 \) = O \( R \)$, so, for $B eq.not B'$ and sufficiently small $mu_0$,
  $ H := \| \( q \, s \) \| gt.eq c \( R \/ mu \)^(C_0) . $
  The amplitude and its derivatives have bounds polynomial in $R$. There is a fixed exponent $a gt.eq 0$, independent of $kappa$, $epsilon.alt$, and the ball locations, for which
  $ lr(|integral A \( xi \) e^(2 pi i \( q dot.op xi + s phi.alt \( xi \) \)) thin d xi|) lt.eq C R^a H^(- 1 \/ 2) . quad "(8.7)" $ <glob:gram-decay>
  For completeness, write $Psi \( xi \) = q dot.op xi + s phi.alt \( xi \)$. If $\| s \|$ is sufficiently small compared with $H$, then $\| nabla Psi \| gt.eq c H$ on the fixed support and integration by parts proves (8.7). Otherwise $\| s \| gt.eq c H$. Uniform definiteness of the Hessian implies
  $ \| nabla Psi \( xi \) - nabla Psi \( xi' \) \| gt.eq c H \| xi - xi' \| . $
  Consequently the set $\| nabla Psi \| lt.eq 2 H^(3 \/ 4)$ has area at most $C H^(- 1 \/ 2)$. Insert a smooth cutoff to this set. Its contribution is bounded by $C H^(- 1 \/ 2) parallel A parallel_oo$. On the complementary region, integrate by parts with the vector field $nabla Psi \/ \| nabla Psi \|^2$. This field has size $O \( H^(- 3 \/ 4) \)$ and divergence $O \( H^(- 1 \/ 2) \)$; the derivative of the cutoff has size $O \( H^(1 \/ 4) \)$. One integration by parts therefore gives $C R^a H^(- 1 \/ 2)$, after increasing the fixed exponent $a$ to cover the amplitude derivatives. This proves (8.7).
  There are $O \( N^2 \)$ retained angular labels and $O \( N^2 \)$ retained position labels per ball. Thus each off-diagonal row of $T T^(*)$ has at most $C mu^(- 8) R^2$ entries. By (8.7), its absolute row sum is at most
  $ C mu^(- 8) R^(a + 2) \( R \/ mu \)^(- C_0 \/ 2) . $
  Choose $C_0$ so large that $C_0 \/ 2 gt.eq a + 3$ and $C_0 \/ 2 gt.eq 8$. This row sum is then $O \( R^(- 1) \) = O \( delta^2 \)$. The same holds for columns, since the matrix is Hermitian. The Schur bound, together with the diagonal block bound, proves $parallel T T^(*) parallel lt.eq C delta^2$ and hence (8.5). This choice of $C_0$ is made once and does not depend on the power loss $epsilon.alt$.
  Apply the single-step packet map from factor $1$ to factor $N$ to $d^(B \, u)$. Retain only the terminal angle $nu_0$ and positions in a fixed bounded region containing $\| z \| lt.eq 1$, and denote the output by $c^(B \, u)$. At this terminal factor,
  $ theta = 1 \, #h(2em) r = w = N^(- 2) \, #h(2em) r w^2 = N^(- 6) . $
  If the initial positions had not been truncated, the frame identity would give exactly the samples
  $ F_0 #scale(x: 120%, y: 120%)[\(] a_B + u + N^2 \( z \, t_I \) #scale(x: 120%, y: 120%)[\)] . $
  The omitted positions contribute $O_M \( N^(- M) \)$, uniformly on the retained terminal region, for every fixed $M$. Indeed, choose $Z_0$ larger than a fixed bound for the retained terminal positions and the velocities on the frequency patch. If $\| z' \| > Z_0$, then the phase in the synthesis–analysis matrix has, on a parent $delta$-cap, nonvanishing gradient of size at least $c N^2 \( 1 + \| z' \| \)$. Rescaling that cap and integrating by parts gives a matrix bound $C_L \( 1 + N \| z' \| \)^(- L)$ for every $L$. There are $O \( N^2 \)$ relevant parent angular labels, and their position mesh is comparable to $N^(- 1)$. Thus, for $L > 1$, the squared matrix bounds sum to
  $ sum_(nu upright(" relevant")) sum_(z' : thin \| z' \| > Z_0) \( 1 + N \| z' \| \)^(- 2 L) lt.eq C_L N^(4 - 2 L) . $
  Write $tilde(d) = sans(P)_(1 \, \[ 0 \, 1 \)) f_(B \, u)$ for the full initial analysis array. The frame identity gives $sum_v \| tilde(d)_v \|^2 lt.eq C delta^2$, so Cauchy–Schwarz bounds each omitted contribution by $C_L N^(1 - L)$. Taking $L gt.eq M + 1$ proves the claimed error, using only smoothness of the windows and the phase.
  The supports just described belong to one fixed polynomial complexity range. Theorem 45, (6.5), and (8.4) therefore give, for every fixed $0 < kappa < 1 \/ 10$ and $eta > 0$,
  $ N^(- 6) sum_v \| c_v^(B \, u) \|^3 & lt.eq cal(A) \( c^(B \, u) \)^3 lt.eq C_(kappa \, eta) N^(10 kappa + eta) G \( d^(B \, u) \)^3\
 & lt.eq C_(kappa \, eta) N^(10 kappa + eta) delta^4 sum_v \| d_v^(B \, u) \|^2 . quad "(8.8)" $ <glob:sparse-sampling>
  In the last line we used $G \( d \)^3 = delta^2 \( sum \| d_v \|^2 \) K \( d \)^(1 \/ 2)$ at the initial factor. Summing (8.8) and using (8.5), the physical sample sum is at most
  $ C_(kappa \, eta) N^6 N^(10 kappa + eta) delta^4 delta^2 = C_(kappa \, eta) N^(10 kappa + eta) . $
  The sampling errors are harmless: there are at most $C mu^(- 8) N^6 lt.eq C N^22$ samples, and $M$ may be chosen arbitrarily large. The inequality $\| a + b \|^3 lt.eq 4 \( \| a \|^3 + \| b \|^3 \)$ absorbs their total cubed contribution.
  The terminal physical lattice is $Lambda = L_(upright(f))^(- 1) bb(Z)^2 times bb(Z)$, with fundamental cell $Q$. The retained lattice points include each $lambda in Lambda$ for which $lambda + Q$ meets $B - a_B$, since the ball lies in the interior normalized region fixed above. Consequently,
  $ sum_(B in cal(B)) integral_B \| F_0 \( y \) \|^3 thin d y lt.eq integral_Q sum_(B in cal(B)) sum_(v upright(" retained")) \| F_0 \( a_B + u + N^2 \( z_v \, t_(I_v) \) \) \|^3 thin d u . $
  Apply the uniform sampled bound to the right-hand side. Integration over $Q$ tiles physical space by $Lambda$, so it introduces no $N$-dependent density factor. Finally choose $kappa$ and $eta$ sufficiently small that $\( 10 kappa + eta \) \/ 2 lt.eq epsilon.alt$. Since $N^2 asymp R$, this proves (8.2). ◻
]

=== 8.2 A finite list of peaks <a-finite-list-of-peaks>

We now use the geometry of the original sphere to obtain a global estimate at a larger exponent. The convolution calculation keeps the normalization of surface measure explicit and applies directly to bounded measurable complex data.

#thm([Lemma 8.2.])[
  (An elementary fourth-power bound).  #emph[For every bounded measurable $h : S^2 arrow.r bb(C)$, 
$ parallel E h parallel_(L^4 \( bb(R)^3 \))^4 lt.eq 32 pi^3 parallel h parallel_oo^4 . quad "(8.9)" $ <glob:l4-bound>

 Moreover $E h$ and its first derivatives are uniformly bounded by constants times $parallel h parallel_oo$.]
] <glob:fourth-power>

#proof[
  The convolution of surface measure with itself has density
  $ \( sigma * sigma \) \( y \) = frac(2 pi, \| y \|) upright(bold(1))_({ 0 < \| y \| < 2 }) . quad "(8.10)" $ <glob:sphere-convolution>
  To verify the constant, use rotational invariance and fix $omega in S^2$. Under surface area measure in the second variable, $s = omega dot.op nu$ has density $2 pi$ on $\[ - 1 \, 1 \]$, and $\| omega + nu \| = \( 2 + 2 s \)^(1 \/ 2)$. Thus, for a radial test function $q$,
  $ integral q \( \| y \| \) thin d \( sigma * sigma \) \( y \) = 8 pi^2 integral_0^2 q \( r \) r thin d r \, $
  which is exactly the integral against the radial density in (8.10). In particular,
  $ parallel sigma * sigma parallel_2^2 = integral_0^2 frac(4 pi^2, r^2) thin 4 pi r^2 thin d r = 32 pi^3 . $
  Let $lambda = h sigma$, a finite complex measure. Its convolution satisfies the total-variation domination
  $ \| lambda * lambda \| lt.eq parallel h parallel_oo^2 \( sigma * sigma \) \, $
  so it has an $L^2$ density of squared norm at most $32 pi^3 parallel h parallel_oo^4$. The function $\( E h \)^2$ is the Fourier transform, with the positive phase convention, of this convolution. Plancherel proves (8.9). Finally, differentiating the defining integral is justified by boundedness of the frequency support and gives, for example,
  $ parallel E h parallel_oo lt.eq 4 pi parallel h parallel_oo \, #h(2em) parallel nabla E h parallel_oo lt.eq 8 pi^2 parallel h parallel_oo . $
  ◻
]

Each function $F_0$ in (8.1), in its rotated coordinates, is the extension of a uniformly bounded density supported on one of the original sphere pieces. Lemma 63 therefore supplies uniform $L^4$, $L^oo$, and Lipschitz bounds for $F_0$.

#thm([Lemma 8.3.])[
  (Initial peak count).  #emph[For $0 < mu lt.eq 1$, the number of unit lattice cubes $Q'$ satisfying $sup_(Q') \| F_0 \| gt.eq mu$ is at most $C mu^(- 7)$. One may select a point $x_(Q') in Q'$ in each such cube with $\| F_0 \( x_(Q') \) \| gt.eq mu \/ 2$.]
] <glob:initial-peaks>

#proof[
  Take the unit cubes to be half-open, and select such a point in every cube of an arbitrary finite subcollection. A uniform Lipschitz bound shows that $\| F_0 \| gt.eq mu \/ 4$ on the ball of radius $c mu$ about each selected point, where $c > 0$ is fixed and small. Each ball contributes at least $c' mu^7$ to the integral of $\| F_0 \|^4$. These balls have bounded overlap, since their radii are bounded and there is one center in each of distinct unit lattice cubes. Lemma 63 bounds the size of the finite subcollection by $C mu^(- 7)$. Since the same bound holds for every finite subcollection, the whole set of such cubes is finite and has the asserted size. ◻
]

=== 8.3 Sparse covering and reproduction <sparse-covering-and-reproduction>

The covering lemma converts the initial polynomial peak count into sparse families whose number is an arbitrarily small power of $mu^(- 1)$. Their radii remain polynomial in $mu^(- 1)$, with an exponent fixed once $alpha$ is chosen. This is the information needed to apply the sparse cubic estimate and then choose its loss.

#thm([Lemma 8.4.])[
  (Sparse covering).  #emph[Fix $C_0 > 1$ and $A > 0$. For every $0 < alpha < 1$ there is a constant $C_alpha$ with the following property. If $mu > 0$ is sufficiently small and $X$ is a finite indexed list of at most $A mu^(- 7)$ points in $bb(R)^3$, then $X$ is covered by at most $C_alpha mu^(- alpha \/ 2)$ families of balls. Each family has a common radius $rho$ with 
$ mu^(- 1) lt.eq rho \, #h(2em) 2 rho lt.eq mu^(- C_alpha) \, quad "(8.11)" $ <glob:covering-radii>

 and its distinct centers are separated by at least $\( 2 rho \/ mu \)^(C_0)$. Each family has at most $\# X$ balls.]
] <glob:sparse-covering>

#proof[
  Put $beta = alpha \/ 4$, choose an integer $J > 8 \/ beta$, and set $D = 2 C_0 + 2$. For sufficiently small $mu$, we have $\# X lt.eq mu^(- 8)$. Define
  $ R_0 = mu^(- 1) \, #h(2em) R_(j + 1) = \( R_j \/ mu \)^D quad \( 0 lt.eq j < J \) \, #h(2em) n_j \( x \) = \# #scale(x: 120%, y: 120%)[\(] X ∩ B \( x \, R_j \) #scale(x: 120%, y: 120%)[\)] \, $
  where balls are open and counts include the multiplicities of the indexed list. For every point $x$ of the list, some $j < J$ satisfies
  $ n_(j + 1) \( x \) lt.eq mu^(- beta) n_j \( x \) . quad "(8.12)" $ <glob:slow-growth>
  Otherwise $n_J \( x \) > mu^(- J beta) n_0 \( x \) gt.eq mu^(- J beta)$ would contradict $\# X lt.eq mu^(- 8)$.
  Assign each point one such index $j$, and group the points further according to $2^k lt.eq n_j \( x \) < 2^(k + 1)$. There are $O_alpha \( log \( 1 \/ mu \) \)$ groups. In each group choose a maximal disjoint subcollection of the radius-$R_j$ balls centered at its points. The triples of the selected balls cover that group.
  Join two selected centers by an edge when their distance is less than $R_(j + 1) \/ 2$. For a selected center $a$, the radius-$R_j$ balls centered at its neighbors are disjoint and lie in $B \( a \, R_(j + 1) \)$, since $R_j lt.eq R_(j + 1) \/ 2$. Each such ball captures at least $2^k$ indices of the whole list, whereas (8.12) gives $n_(j + 1) \( a \) < 2^(k + 1) mu^(- beta)$. The graph therefore has degree at most $2 mu^(- beta)$. Greedy coloring splits the selected balls into $O \( mu^(- beta) \)$ colors. Including all the groups, the number of families is at most
  $ C_alpha mu^(- beta) log \( 1 \/ mu \) lt.eq C_alpha mu^(- alpha \/ 2) . $
  Use radius $rho = 3 R_j$ for each covering family. Centers in one color have distance at least $R_(j + 1) \/ 2$, and, for sufficiently small $mu$,
  $ R_(j + 1) / 2 = 1 / 2 \( R_j \/ mu \)^(2 C_0 + 2) gt.eq \( 6 R_j \/ mu \)^(C_0) = \( 2 rho \/ mu \)^(C_0) . $
  Finally, write $R_j = mu^(- a_j)$, so that $a_0 = 1$ and $a_(j + 1) = D \( a_j + 1 \)$. The finite number $J$ depends only on $alpha$ and $C_0$. Enlarging $C_alpha$ to at least $a_(J - 1) + 1$ gives $6 R_j lt.eq mu^(- C_alpha)$ for small $mu$, which proves (8.11). The selected balls are centered at points of the list, so every family has at most $\# X$ balls. ◻
]

#thm([Proposition 8.5.])[
  (Distributional bound).  #emph[For every $0 < alpha < 1$ and all sufficiently small $mu > 0$, 
$ \| { y in bb(R)^3 : \| F_0 \( y \) \| > mu } \| lt.eq C_alpha mu^(- 3 - alpha) . quad "(8.13)" $ <glob:distribution-bound>

]
] <glob:distribution>

#proof[
  Let $X = \( x_(Q') \)$ be the finite list supplied by Lemma 64. It suffices to prove $\# X lt.eq C_alpha mu^(- 3 - alpha)$, since the level set in (8.13) is contained in the corresponding unit cubes.
  The Fourier transform of $F_0$, as a tempered distribution, is supported in a fixed compact set. Choose a Schwartz function $psi$ whose Fourier transform is $1$ on a neighborhood of that set. Then $F_0 = psi * F_0$; the convolution is absolutely convergent and the identity holds pointwise because $F_0$ is bounded and continuous. Hölder’s inequality yields
  $ \| F_0 \( x \) \|^3 lt.eq parallel psi parallel_1^2 integral_(bb(R)^3) \| psi \( x - y \) \| thin \| F_0 \( y \) \|^3 thin d y . quad "(8.14)" $ <glob:reproduction>
  Apply Lemma 65, with the separation exponent from Lemma 62, and assign every index of $X$ to one ball in one covering family. Suppose the assigned covering ball has radius $rho$. Truncating the integral in (8.14) to $\| x - y \| lt.eq rho$ costs at most
  $ C parallel F_0 parallel_oo^3 integral_(\| z \| > rho) \| psi \( z \) \| thin d z lt.eq C rho^(- 4) lt.eq C mu^4 . $
  Since $\| F_0 \( x \) \| gt.eq mu \/ 2$, this error is absorbed into the left-hand side for sufficiently small $mu$. The truncated region lies in the doubled assigned covering ball.
  There is a uniform bound
  $ sup_(y in bb(R)^3) sum_(x in X) \| psi \( x - y \) \| lt.eq C_psi . quad "(8.15)" $ <glob:kernel-overlap>
  Indeed, at most one selected point lies in each unit lattice cube, and Schwartz decay bounds the sum by the convergent lattice sum of a sufficiently high inverse power of distance. In particular no pairwise separation assumption on the selected points is needed.
  Let $X_(cal(F))$ denote the indices assigned to one covering family $cal(F)$, of common radius $rho$. Summing the truncated form of (8.14) and using (8.15), we obtain
  $ mu^3 \# X_(cal(F)) lt.eq C sum_(B in cal(F)) integral_(2 B) \| F_0 \( y \) \|^3 thin d y lt.eq C_epsilon.alt \( 2 rho \)^epsilon.alt . $
  For the last inequality, the doubled balls satisfy all the hypotheses of Lemma 62: their radius is at least $mu^(- 1)$, their separation is the required one, and their number is at most $\# X lt.eq mu^(- 8)$ after reducing the threshold for $mu$.
  Fix $alpha$ first, and then choose $epsilon.alt > 0$ so small that $C_alpha epsilon.alt lt.eq alpha \/ 2$, using the exponent in (8.11). Thus
  $ mu^3 \# X_(cal(F)) lt.eq C_alpha mu^(- alpha \/ 2) . $
  There are at most $C_alpha mu^(- alpha \/ 2)$ families. Each index was assigned exactly once, and summing proves $\# X lt.eq C_alpha mu^(- 3 - alpha)$, as required. ◻
]

#proof[
  Fix $p > 3$ and choose $0 < alpha < min { 1 \, p - 3 }$. Let $mu_(*) > 0$ be smaller than the thresholds required above for this choice of $alpha$. By the layer-cake identity and Proposition 66, the contribution of sufficiently small thresholds is bounded by
  $ p integral_0^(mu_(*)) mu^(p - 1) \| { \| F_0 \| > mu } \| thin d mu lt.eq C_(p \, alpha) integral_0^(mu_(*)) mu^(p - 4 - alpha) thin d mu < oo . $
  For larger thresholds, the uniform $L^4$ estimate gives $\| { \| F_0 \| > mu } \| lt.eq C mu^(- 4)$, and the level set is empty above the uniform $L^oo$ bound. Their contribution is therefore finite as well. We conclude that $parallel F_0 parallel_p lt.eq C_p$.
  There are only finitely many graph pieces in (8.1). Rotations preserve Lebesgue measure, so the $L^p$ triangle inequality gives $parallel E g parallel_p lt.eq C_p$ under the normalization $parallel g parallel_oo = 1$. Multiplication by $parallel g parallel_oo$ proves the result for arbitrary nonzero bounded measurable complex data. When the essential supremum is zero, the extension is identically zero. All constructions and estimates depend only on the almost-everywhere class of the data, which completes the assertion of the theorem. ◻
]

== 9 Spherical consequences <sec:consequences>

The global sphere estimate has now been proved. We give the complete transfer to the translated-tube maximal operator defined in the introduction, retaining the weighted tube estimate needed for its strong operator norm. This uses sphere factorization in addition to Theorem 1.

=== 9.1 The Kakeya maximal transfer <the-kakeya-maximal-transfer>

#proof[
  Sphere factorization, due to Bourgain #cite(label("Bourgain1991Besicovitch")), upgrades Theorem 1 to $parallel E g parallel_(L^q \( bb(R)^3 \)) lt.tilde_q parallel g parallel_(L^q \( S^2 \))$ for every $q > 3$; see #cite(label("Buschenhenke2024")) Section 1.1, (1.1)–(1.2) for the weak-type factorization and interpolation in the sphere case. Fix $3 < q < 4$ and put $r = q \/ 2$. Consider unit tubes $T_j = T_delta \( x_j \, omega_j \)$ in $delta$-separated directions. Choose smooth nonnegative bumps $b_j$, bounded by $1$, supported on disjoint caps of radius $c delta$ about $omega_j$, and equal to $1$ on the concentric caps of radius $c delta \/ 2$. Here $c > 0$ is a fixed small constant. The modulation
  $ h_j \( zeta \) = e^(- 2 pi i delta^(- 2) x_j dot.op zeta) b_j \( zeta \) $
  translates the extension to the center of $delta^(- 2) T_j$. We have $parallel h_j parallel_q^q lt.tilde delta^2$ and $\| E h_j \| gt.tilde delta^2$ on that dilated tube. To see the lower bound, write $y - delta^(- 2) x_j = s omega_j + v$, where $\| s \| lt.eq delta^(- 2) \/ 2$, $v perp omega_j$, and $\| v \| lt.eq delta^(- 1)$. On the cap, the phase after removing its value at $omega_j$ has magnitude at most $C \( c + c^2 \)$. Taking $c$ sufficiently small makes the real part of the remaining integrand a fixed positive fraction of $b_j$, whose integral is comparable to $delta^2$.
  For arbitrary weights $a_j gt.eq 0$ and independent random signs $epsilon_j$, Khintchine’s inequality and the diagonal estimate give
  $ delta^(2 q - 6) parallel sum_j a_j 1_(T_j) parallel_r^r lt.tilde_q bb(E) parallel E #scale(x: 180%, y: 180%)[\(] sum_j epsilon_j a_j^(1 \/ 2) h_j #scale(x: 180%, y: 180%)[\)] parallel_q^q lt.tilde_q delta^2 sum_j a_j^r . $
  The factor $delta^(- 6)$ comes from $y = delta^(- 2) x$, while the last inequality uses the disjoint cap supports. Taking the $r$th root gives the weighted tube estimate
  $ parallel sum_j a_j 1_(T_j) parallel_(L^r \( bb(R)^3 \)) lt.tilde_q delta^(12 \/ q - 4) #scale(x: 180%, y: 180%)[\(] delta^2 sum_j a_j^r #scale(x: 180%, y: 180%)[\)]^(1 \/ r) . $
  Set $p = r' = q \/ \( q - 2 \)$. For nonnegative $f in L^p \( bb(R)^3 \)$ and $c_j gt.eq 0$, the normalization $\| T_j \| = pi delta^2$ gives
  $ delta^2 sum_j c_j frac(1, \| T_j \|) integral_(T_j) f = 1 / pi integral f sum_j c_j 1_(T_j) lt.tilde_q delta^(12 \/ q - 4) parallel f parallel_p #scale(x: 180%, y: 180%)[\(] delta^2 sum_j c_j^r #scale(x: 180%, y: 180%)[\)]^(1 \/ r) . $
  Duality for the discrete measure assigning mass $delta^2$ to each direction bounds the $p$-norm of these tube averages. The bound is uniform in all tube locations, so each $T_j$ may independently approximate the supremum defining $K_delta f \( omega_j \)$.
  Choose a maximal $delta$-separated net on $S^2$, with angular cells of area comparable to $delta^2$. Every direction in a cell is within $delta$ of its center $omega_j$. For $delta < 1 \/ 4$, the corresponding tubes satisfy
  $ T_delta \( a \, omega \) subset T_(2 delta) \( a - omega_j \/ 4 \, omega_j \) union T_(2 delta) \( a + omega_j \/ 4 \, omega_j \) . $
  Indeed, the transverse displacement is at most $3 delta \/ 2$ and the axial displacement at most $1 \/ 2 + delta^2 < 3 \/ 4$. Thus $K_delta f \( omega \) lt.eq 8 K_(2 delta) f \( omega_j \)$. Sphere packing splits the net into a fixed number of $2 delta$-separated families. Apply the discrete bound at width $2 delta$ to each family and sum over the angular cells. This gives Bourgain’s strong maximal transfer, in the form stated in #cite(label("MattilaFourierNotes")) Theorem 3.3, pp. 10–11:
  $ parallel K_delta f parallel_(L^p \( S^2 \)) lt.tilde_q delta^(12 \/ q - 4) parallel f parallel_(L^p \( bb(R)^3 \)) \, #h(2em) p = frac(q, q - 2) . $
  For $delta gt.eq 1 \/ 4$, the same bound follows directly from Hölder’s inequality. Interpolating with $parallel K_delta f parallel_oo lt.eq parallel f parallel_oo$, at parameter $p \/ 3$, yields
  $ parallel K_delta f parallel_(L^3 \( S^2 \)) lt.tilde_q delta^(- 4 \( q - 3 \) \/ \( 3 \( q - 2 \) \)) parallel f parallel_(L^3 \( bb(R)^3 \)) . $
  Choosing $q > 3$ sufficiently close to $3$ proves the claim. ◻
]

This deduction starts from the spherical conclusion of Theorem 1 and uses sphere-specific factorization; it does not invoke the general-surface diagonal companion or the independent maximal theorem.

=== 9.2 The open mixed-norm range on the sphere <the-open-mixed-norm-range-on-the-sphere>

The diagonal sphere estimates also give the strict mixed-norm range. For $1 < a lt.eq oo$ and $3 < b < oo$, write $a' = a \/ \( a - 1 \)$ when $a < oo$ and $a' = 1$ when $a = oo$. Then

$ parallel E g parallel_(L^b \( bb(R)^3 \)) lt.eq C_(a \, b) parallel g parallel_(L^a \( S^2 \)) \, #h(2em) b > 2 a' \, quad "(9.1)" $ <eq:sphere-mixed-norm>

for every complex $g in L^a \( S^2 \)$. The defining integral for $E$ remains meaningful because $sigma \( S^2 \) < oo$ implies $L^a \( S^2 \) subset L^1 \( S^2 \)$. Thus the conclusion covers a larger class of input densities, with an output exponent depending on their integrability.

Indeed, for $1 < a lt.eq b$, set $r = 1 + b \/ a' > 3$ and $theta.alt = r \/ b lt.eq 1$. Interpolate the diagonal $L^r \( S^2 \) arrow.r L^r \( bb(R)^3 \)$ estimate from sphere factorization with the elementary $L^1 \( S^2 \) arrow.r L^oo \( bb(R)^3 \)$ estimate. The identities

$ 1 / b = theta.alt / r \, #h(2em) 1 / a = 1 - theta.alt + theta.alt / r $

give (9.1); when $a = b$, the diagonal estimate itself suffices. For $b < a < oo$, use the diagonal estimate at $b$ and Hölder’s inequality on $S^2$. The case $a = oo$ is Theorem 1. This argument uses the strict inequality $b > 2 a'$ to choose $r > 3$ and makes no assertion on the scaling line $b = 2 a'$.


#bibliography("refs.bib", style: "ieee", title: [References])
