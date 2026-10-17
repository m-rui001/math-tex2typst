#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[A-uniform-Hilbert-transform-estimate-for-Lipschitz-directions-September-25-2026]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Short transforms and band reduction <intro:section>

Let $v : bb(R)^2 arrow.r S^1$ be a Lipschitz unit vector field. For $0 < epsilon.alt < a$, define the short directional Hilbert transform by

$ H_(v \, a)^epsilon.alt f \( x \) = integral_(epsilon.alt < \| t \| < a) f \( x - t v \( x \) \) thin frac(upright(d) t, t) . $

The direction is held fixed at the output point $x$: the integral samples the straight line through $x$ in direction $v \( x \)$. For $f in cal(S) \( bb(R)^2 \)$, the symmetric principal value $H_(v \, a) f = lim_(epsilon.alt arrow.b 0) H_(v \, a)^epsilon.alt f$ exists at every point, since $f \( x - t v \( x \) \) - f \( x + t v \( x \) \) = O_x \( \| t \| \)$ near zero.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $a_(*) in \( 0 \, 1 \/ 2 \)$ and $C_(*) < oo$ such that every Lipschitz field $v : bb(R)^2 arrow.r S^1$ with $"Lip" \( v \) lt.eq 1$ satisfies 
$ sup_(0 < epsilon.alt < a_(*)) ∥H_(v \, a_(*))^epsilon.alt f∥_(L^2 \( bb(R)^2 \)) lt.eq C_(*) ∥f∥_(L^2 \( bb(R)^2 \)) #h(2em) \( f in cal(S) \( bb(R)^2 \) \) . $

 Its symmetric principal value therefore satisfies 
$ ∥H_(v \, a_(*)) f∥_2 lt.eq C_(*) ∥∥ f_2 \, #h(2em) \| { x : \| H_(v \, a_(*)) f \( x \) \| > lambda } \| lt.eq C_(*)^2 lambda^(- 2) ∥∥ f_2^2 quad \( lambda > 0 \) . $

]
] <thm:main>

Both coordinates may enter the field arbitrarily subject to the Lipschitz bound. The supremum in the theorem is outside the norm, so its first assertion is a uniform operator bound for each inner truncation. The principal-value assertion is stated on Schwartz functions and gives an $L^2$-bounded extension by density.

The outer length has a natural scaling. If $L_v = "Lip" \( v \) > 0$, put $tilde(v) \( X \) = v \( X \/ L_v \)$ and $tilde(f) \( X \) = f \( X \/ L_v \)$. Then $"Lip" \( tilde(v) \) = 1$, and changing variables $s = L_v t$ gives

$ H_(v \, a_(*) \/ L_v)^epsilon.alt f \( x \) = H_(tilde(v) \, a_(*))^(L_v epsilon.alt) tilde(f) \( L_v x \) \, #h(2em) ∥tilde(f)∥_2 = L_v ∥∥ f_2 . $

The theorem thus has the same constant at outer length $a_(*) \/ L_v$. If $L_v = 0$, the field is constant. Rotation and Fubini reduce its transform, for any finite outer length, to the one-dimensional Hilbert transform. These conventions distinguish the short-scale assertion from an estimate at arbitrary outer lengths for varying fields.

=== 1.1 The problem and its predecessors <the-problem-and-its-predecessors>

Stein’s question places Lipschitz regularity at the center of the planar directional singular-integral problem. In the formulation #cite(label("LLStein")) Conjecture 1.5, it asks for a uniform weak-$\( 2 \, 2 \)$ bound with the outer length controlled by the reciprocal Lipschitz seminorm. 1 gives an affirmative answer with a strong $L^2$ bound. The scale restriction limits the turning of the field, but it does not make the operator a Fourier multiplier: the line used by the integral still varies with the output point.

Lacey and Li trace Stein’s question to Zygmund’s conjecture on almost-everywhere differentiation by averages over shrinking straight segments in direction $v \( x \)$. They also recall a Besicovitch obstruction showing that Hölder regularity of any exponent below one does not by itself give the corresponding uniform weak-$\( 2 \, 2 \)$ estimate for the short positive averaging maximal operator #cite(label("LLStein")) Preface, Conjecture 1.2 and Chapter 2. Analytic fields admit additional structure: Bourgain proved an $L^2$ theorem for their averaging maximal operator #cite(label("Bourgain1989")), and Stein and Street proved local $L^p$, $1 < p < oo$, estimates for single-parameter singular Radon transforms associated with real-analytic maps #cite(label("SteinStreet2012")). Their singular-integral theorem includes analytic frozen-direction Hilbert transforms, with localization depending on the analytic map. The uniform Lipschitz estimate considered here asks for constants controlled by the Lipschitz seminorm alone.

Several distinct advances explain the remaining difficulty. Lacey and Li proved an annular weak-$\( 2 \, 2 \)$ estimate, together with strong $L^p$ estimates for $p > 2$, for directional Hilbert transforms with measurable directions #cite(label("LLAnnular")) Theorem 1.1. An annular restriction isolates a frequency scale; it does not give a uniform strong $L^2$ bound for the complete transform. For Lipschitz unit fields, Guo obtained annular weak-$\( 2 \, 2 \)$ and strong $L^p$, $p > 2$, bounds, uniformly in the annulus scale, for the $r$-variation, $r > 2$, of smooth dyadic Hilbert-transform partial sums over the short scale range determined by the reciprocal Lipschitz length; the varying dyadic cutoff is distinct from the hard inner time cutoff in 1 #cite(label("GuoVariation2017")) Theorem 1.2 and (1.6)–(1.8) of the author version. Lacey and Li’s Lipschitz Kakeya theorem controls averages over short rectangles on which the field has a prescribed popular direction #cite(label("LLKakeya")) Theorem 1.4. For popularity $delta$, its weak-$L^2$ norm costs $C delta^(- 1 \/ 2)$. We use precisely this estimate.

The Lacey–Li memoir develops the relation between those maximal operators and the Hilbert-transform problem #cite(label("LLStein")). Its Theorem 1.18 assumes a stronger maximal estimate below $L^2$ for the strong annular conclusion; its full-transform conclusion also requires $C^(1 + eta)$ regularity. These are conditional results with hypotheses different from those of 1. For bounded measurable slopes depending on one coordinate, Bateman proved single-annulus $L^p$ estimates for $1 < p < oo$ #cite(label("Bateman2013")). Bateman and Thiele proved strong $L^p$ bounds for the full-line principal-value transform when $3 \/ 2 < p < oo$, for every nonvanishing measurable field depending on one coordinate #cite(label("BatemanThiele2013")) Theorem 1. The one-coordinate $L^2$ case is already connected to Carleson’s theorem by a partial Fourier transform #cite(label("Carleson1966")) #cite(label("BatemanThiele2013")); Bateman and Thiele obtain the stated wider $p$-range. The one-coordinate hypothesis remains a substantive restriction on the direction field. Guo extended the one-coordinate setting to fields constant along suitable Lipschitz foliations, with a uniform transversality assumption #cite(label("Guo2015")) #cite(label("Guo2017")).

A different family of results combines Lipschitz control with lacunary directions. Guo and Thiele proved strong $L^p$ bounds without a frequency restriction for short principal-value transforms associated with dyadic roundings of a positive Lipschitz slope #cite(label("GuoThiele2017")); Di Plinio and Parissis extended this framework to finite lacunary order for fields generated by separated dyadic roundings of Lipschitz angular functions #cite(label("DiPlinioParissis2018")). The rounded direction field can itself be discontinuous. These results exploit directional structure beyond that assumed in the present theorem.

A further reduction separates frequency reassembly from the main single-band estimate. Di Plinio, Guo, Thiele and Zorin-Kranich established that uniform strong $L^2$ bounds on vertical frequency bands imply the full short principal-value bound under a small uniform Lipschitz bound in the vertical variable #cite(label("DiPlinioGuoThieleZorinKranich2018")) Corollaries 1.3–1.4 of the author version. We give a commutator proof adapted to the two truncation endpoints and to the narrow frequency bins used later. The new estimate to be proved is the logarithmically improved restricted bound on a band; the principle of band-to-full reassembly is already present in that work.

=== 1.2 The analytic and geometric reductions <the-analytic-and-geometric-reductions>

We describe the proof before fixing its technical parameters. Localization and rotation write a short piece of the operator in slope form

$ H_(u \, a)^epsilon.alt h \( x \, y \) = integral_(epsilon.alt < \| t \| < a) h \( x - t \, y - t u \( x \, y \) \) thin frac(upright(d) t, t) \, #h(2em) \| u \| lt.eq 1 \, quad "Lip" \( u \) lt.eq C \, $

with both input and test supported in a short horizontal strip. Writing $eta$ for the frequency dual to $y$, a vertical frequency band at scale $w$ means that $\| eta \|$ is comparable to $w^(- 1)$. For its smooth projection $P_w$, the central restricted estimate is

$ \| chevron.l H_(u \, a)^epsilon.alt P_w f \, g chevron.r \| lt.tilde #scale(x: 120%, y: 120%)[\(] 1 + \| log \( \| F \| \/ \| E \| \) \| #scale(x: 120%, y: 120%)[\)]^(- 3) sqrt(\| F \| \| E \|) \, #h(2em) \| f \| lt.eq upright(bold(1))_F \, quad \| g \| lt.eq upright(bold(1))_E . $

Here $F \, E$ are sets of positive finite measure in the horizontal strip. Its constants are uniform in $w$ and $epsilon.alt$. The logarithmic factor makes amplitude-level summation converge. A Lipschitz commutator then permits Littlewood–Paley reassembly across vertical bands. These implications, including all endpoint errors, are proved in this section before the restricted estimate itself is used.

The difficult regime is $\| E \| gt.double \| F \|$. Write $L = log sqrt(\| E \| \/ \| F \|)$. Positive operator bounds discard all but very short integration times. The vertical band is then divided into narrow intervals centered at frequencies $eta_j$, with common width comparable to $W^(- 1)$, where $W = m w$ and $m$ grows subexponentially in $L$. The components form one finite-dimensional Hilbert space. A wave packet has horizontal length $ell$, transverse width $W$, and a direction label with precision $d = w \/ ell$. Smooth packet forms retain the original field only through scalar selectors of its direction.

Ordinary size and density estimates remove the small-density packets. Each remaining packet is assigned to a top box whose direction is popular on a measured subset of the test set. The popularity witnesses are disjoint. Lacey–Li’s theorem controls a decaying weighted count of the tops, after every thin parallelogram has been enclosed by an admissible orthogonal rectangle. This step is geometric: it supplies a polynomial cost in $L$, and does not provide the final oscillatory saving.

=== 1.3 The phase gain and its iteration <the-phase-gain-and-its-iteration>

Two statements make the oscillation usable. First, on every reference line the packet sums have polynomial moment bounds, square-function bounds and $3$-variation bounds. The variation argument combines Lépingle’s martingale inequality with the comparison between smooth Fourier truncations and conditional expectations developed by Jones, Seeger and Wright #cite(label("Lepingle1976")) #cite(label("JSW2008")). All three packet estimates hold for every fixed deterministic subcollection. Popularity and Lipschitz control then produce one exceptional set outside which each separated list of significant top directions in the required angular cluster and precision range has at most $D = L^C$ members, simultaneously over angular resolutions.

Second, a finite Fourier sum with at most $D$ separated real frequencies has a strict improvement over the usual coefficient exponent. For suitable band-limited probability measures $nu$, we prove

$ ∥sum_(i = 1)^d a_i e^(i lambda_i t)∥_(L^p \( nu \)) lt.eq (sum_(i = 1)^d \| a_i \|^(r_(*)))^(1 \/ r_(*)) \, #h(2em) 1 / r_(*) = 1 - frac(1 + c \/ log \( 2 D \), p) \, quad p gt.eq 4 . $

The operator constant is exactly one, for complex coefficients and for Hilbert-valued coefficients acted on by diagonal phases. The proof separates the case of one dominant coefficient from its complement. In the latter case, separated quantiles give a strict fourth-moment deficit, which survives a small improvement of the coefficient exponent. An unspecified constant in this inequality would accumulate at every angular level and destroy the argument.

The iteration organizes directions into nested angular intervals. Each interval carries the positive mass of the tops whose direction precision is sufficiently fine for that interval; these are its eligible tops. It also carries an oscillatory amplitude assembled from its packets. The significant-direction count enters phase averaging through a weighted selection of separated block children, whose analytic weights cancel the probability cost of retaining them. We compare mass-normalized $p$-energies after adding the mass itself as a baseline. On an appropriate spatial interval, a finer amplitude can be predicted from one good point by diagonal phase motion. The finite Fourier estimate therefore controls the average of the predicted energy factor. The comparison errors are proportional to the relative mass lost on the path, so their sum is controlled by a logarithmic mass telescope.

Packets that stop between two angular endpoints create residual terms. Square summation handles blocks with a definite mass drop. Across nearly unary portions of a path, the energies telescope and the remaining residual sums are estimated by $3$-variation of one fixed sequence for that path. The sequence is chosen before the spatial point or mass stop is selected. Normalized factors on nested spatial cells can then be integrated without any cost proportional to the angular depth.

Finally we interpolate among shifted groupings of angular levels. At the central parameter the packet coefficients contain boundary weights. Averaging one common angular-grid translation removes these weights, using eligibility as well as angular proximity in the boundary telescope. With $p = L^(1 \/ 2)$, the strict phase gain leaves a decrease of order $\( sqrt(L) log L \)^(- 1)$ in the exponent of $sqrt(\| E \| \/ \| F \|)$. This dominates all fixed polynomial losses and supplies the logarithmic restricted estimate above.

=== 1.4 Organization, inputs and uniformity <organization-inputs-and-uniformity>

Section 1 gives the analytic reduction and the precise packet estimates needed for the band theorem. Section 2 proves the ordinary tile estimates and constructs the popular forest. Section 3 establishes every-line concentration and the simultaneous count of significant directions. Section 4 proves the constant-one finite Fourier inequality. Section 5 constructs the angular hierarchy and the predicted factors. Section 6 controls residuals and integrates path products. Section 7 performs interpolation, angular-grid averaging and the final strong-type assembly.

There are two specialized external inputs: Lacey–Li’s short Lipschitz-popularity maximal theorem, stated in 2, and the unweighted scalar martingale $3$-variation inequality of Lépingle, used in the form #cite(label("ZorinKranich2020")) Theorem 1.1, $p = 2$, $r = 3$, weight one. The latter enters the locally proved Fourier/martingale comparison in 25; we credit its origin to #cite(label("Lepingle1976")). Standard one-dimensional Hilbert-transform, maximal-function and interpolation facts are recalled where used. The commutator, tile, concentration, finite-phase and hierarchy arguments are included in full.

All packet collections, scale ranges and angular depths are finite until estimates independent of those truncations have been proved. The bin Hilbert spaces are finite-dimensional and complex, and every constant is independent of their dimension. Pairings are linear in the first variable. A factor $L^C$ always has a fixed exponent; it never conceals the number of packets, scales or hierarchy levels.

=== 1.5 Fourier conventions and the local reduction <red:section>

We use the Fourier convention

$ hat(f) \( xi \, eta \) = integral_(bb(R)^2) f \( x \, y \) e^(- i \( x xi + y eta \)) thin upright(d) x thin upright(d) y \, #h(2em) f \( x \, y \) = frac(1, \( 2 pi \)^2) integral_(bb(R)^2) hat(f) \( xi \, eta \) e^(i \( x xi + y eta \)) thin upright(d) xi thin upright(d) eta . $

The same convention is used in one dimension. Pairings are linear in the first entry. A constant depending on a fixed finite list of smooth cutoffs or on their prescribed seminorms is an absolute constant. No such list will depend on a frequency scale, an inner truncation, the number of packets, or the dimension of the bin Hilbert space.

=== 1.6 A maximal theorem and elementary analytic tools <a-maximal-theorem-and-elementary-analytic-tools>

We first record precisely the specialized maximal theorem used later. If an orthogonal rectangle $R$ has long side $L \( R \)$, short side $W \( R \)$, and long-side direction $e_R in S^1$, let $"EX" \( R \)$ be the arc centered at $e_R$ of total length $W \( R \) \/ L \( R \)$.

#thm([Theorem 1.2.])[
  (Lacey–Li).  #emph[Let $v : bb(R)^2 arrow.r S^1$ be Lipschitz and $0 < delta < 1$. Restrict to rectangles satisfying 
$ L \( R \) lt.eq frac(1, 100 "Lip" \( v \)) \, #h(2em) lr(|R ∩ v^(- 1) \( "EX" \( R \) \)|) gt.eq delta lr(||) R \, $

 where the first restriction is void when $"Lip" \( v \) = 0$. Then 
$ cal(M)_(v \, delta) h \( z \) = sup_R frac(upright(bold(1))_R \( z \), lr(||) R) integral_R lr(||) h quad upright("satisfies") quad ∥cal(M)_(v \, delta) h∥_(L^(2 \, oo)) lt.eq C delta^(- 1 \/ 2) ∥∥ h_2 . $

 Here the supremum is tested at every point of $R$, and the constant is independent of $v$ and $delta$.]
] <red:kakeya>

This is #cite(label("LLKakeya")) Theorem 1.4. Requiring the field to lie in a smaller fixed subarc only restricts the collection of admissible rectangles. In the bounded slope range, the map $t mapsto \( 1 \, t \) \/ sqrt(1 + t^2)$ changes slope distances into arc distances by comparable absolute factors. These observations explain the slope version of 2 used below. When an intermediate box is a parallelogram, the application of the theorem will explicitly enclose it by a comparable orthogonal rectangle of admissible length.

We also use the following familiar one-dimensional estimates, with their indicated uniformities. The Hardy–Littlewood maximal operator is bounded on $L^p$, $1 < p < oo$, and

#[#set math.equation(numbering: n => "(1.1)")
 $ sup_(0 < r < R < oo) ∥integral_(r < \| t \| < R) h \( thin dot.op - t thin \) frac(thin upright(d) t, t)∥_p lt.eq C_p ∥∥ h_p . $ <red:horizontal-hilbert>]

The supremum in (1.1) is outside the norm; the usual maximal truncation theorem gives this assertion as well. See #cite(label("Hajlasz2012")) Theorems 1.1 and 7.6 and the proof of (7.7). Fubini gives the corresponding horizontal estimates on $bb(R)^2$. The $L^2$ square-function identities used here are consequences of Plancherel and finite overlap of smooth frequency annuli. The standard smooth Littlewood–Paley and random-sign multiplier formulations are also recorded in #cite(label("Tao2006Notes4")) Proposition 5.3, Corollary 5.4, and Remark 4.5. We give the particular Carleson embedding and commutator arguments needed for our reduction below. The John–Nirenberg and martingale variation estimates are stated in the sections where their local forms are used.

=== 1.7 The local slope operator and its endpoints <the-local-slope-operator-and-its-endpoints>

Fix an absolute bound $C_(upright("Lip"))$ large enough for the slope fields obtained in the following localization; for example, a bound of ten suffices after taking the squares small enough. Choose an absolute horizontal length $b_0 > 0$ with $b_0 C_(upright("Lip")) < 1 \/ 10$, and subsequently choose $0 < a_(*) < b_0 \/ 100$. These constants may be decreased to accommodate the fixed geometric enlargements in later applications of 2. All such enlargements are chosen absolutely. For the remainder of the local argument write $a = a_(*)$, and put

#[#set math.equation(numbering: n => "(1.2)")
 $ H_(u \, a)^epsilon.alt h \( x \, y \) = integral_(epsilon.alt < \| t \| < a) h \( x - t \, y - t u \( x \, y \) \) frac(thin upright(d) t, t) \, #h(2em) 0 < epsilon.alt < a \, $ <red:local-operator>]

where $lr(||) u lt.eq 1$ and $"Lip" \( u \) lt.eq C_(upright("Lip"))$. The local inputs and tests will be supported in $I times bb(R)$, where $I$ is any interval of length at most $b_0$.

#thm([Lemma 1.3.])[
  #emph[For $lr(||) t thin C_(upright("Lip")) < 1$, define 
$ A_t h \( x \, y \) = h \( x - t \, y - t u \( x \, y \) \) . $

 For $1 lt.eq p < oo$, 
#[#set math.equation(numbering: n => "(1.3)")
 $ ∥A_t h∥_p lt.eq \( 1 - lr(||) t thin C_(upright("Lip")) \)^(- 1 \/ p) ∥∥ h_p \, $ <red:translate-bound>]

 and $A_t$ is a contraction on $L^oo$. Consequently, replacing either symmetric endpoint at scale $r$ by a measurable endpoint between $c r$ and $C r$, with $c \, C > 0$ fixed and $max \( 1 \, C \) r C_(upright("Lip")) < 1 \/ 2$, costs a bounded $L^p$ operator, independently of $r$.]
] <red:fixed-time>

#proof[
  For each fixed $x$, the map $phi_(x \, t) \( y \) = y - t u \( x \, y \)$ is increasing, onto, and satisfies
  $ \( 1 - lr(||) t thin C_(upright("Lip")) \) lr(|y - y'|) lt.eq lr(|phi_(x \, t) \( y \) - phi_(x \, t) \( y' \)|) lt.eq \( 1 + lr(||) t thin C_(upright("Lip")) \) lr(|y - y'|) . $
  The change-of-variables formula for a one-dimensional bi-Lipschitz map, followed by translation in $x$, proves (1.3). A difference of endpoint truncations is pointwise dominated by
  $ integral_(c' r < \| t \| < C' r) lr(|A_t h|) frac(thin upright(d) t, \| t \|) $
  with $c' = min \( 1 \, c \)$ and $C' = max \( 1 \, C \)$. Minkowski and (1.3) bound this by $C_p log \( C' \/ c' \) ∥∥ h_p$. The same proof applies to inner and outer endpoints, and permits endpoints depending on $\( x \, y \)$. ◻
]

We explain the localization of the original unit-field operator. Partition the plane into squares $Q$ of a sufficiently small fixed side length. For output in $Q$, only a fixed enlargement $Q^(+)$ of that square contributes to a transform of length $a_(*)$. Rotate coordinates so that the vector at the center of $Q$ points along the positive first coordinate axis. Since $"Lip" \( v \) lt.eq 1$, on the rotated output square we have

$ v = \( v_1 \, v_2 \) \, #h(2em) v_1 gt.eq c > 0 \, #h(2em) u = v_2 \/ v_1 \, #h(2em) lr(||) u lt.eq 1 \, #h(2em) "Lip" \( u \) lt.eq C_(upright("Lip")) . $

The last inequality follows by subtracting the two ratios and using the lower bound for $v_1$. Extend $u$ to the plane with the same Lipschitz bound, using $inf_(z in Q) \( u \( z \) + C_(upright("Lip")) \| thin dot.op - z \| \)$, and then clip the extension to $\[ - 1 \, 1 \]$. The infimum extension agrees with $u$ on $Q$, and clipping preserves both agreement and the Lipschitz bound.

At an output point, the substitution $s = t v_1 \( x \, y \)$ changes $thin upright(d) t \/ t$ to $thin upright(d) s \/ s$ and changes the two endpoints to $epsilon.alt v_1 \( x \, y \)$ and $a_(*) v_1 \( x \, y \)$. By 3, each endpoint can be replaced by $epsilon.alt$ or $a_(*)$, respectively, at a uniform $L^2$ cost. The rotated sets $Q$ and $Q^(+)$ fit in a common horizontal interval of length at most $b_0$, after choosing the square side and $a_(*)$ in that order. Thus a uniform bound for $upright(bold(1))_(I times bb(R)) H_(u \, a)^epsilon.alt upright(bold(1))_(I times bb(R))$ implies the required bound on this output square. The output squares are disjoint, the sets $Q^(+)$ have bounded overlap, and rotations preserve area. Squaring the local estimates and summing over $Q$ therefore proves the global estimate. Notice that both endpoint errors are uniform in the inner radius $epsilon.alt$.

=== 1.8 The band theorem and summation of amplitude levels <the-band-theorem-and-summation-of-amplitude-levels>

A vertical band cutoff at length $w > 0$ is a multiplier $P_w = p \( w D_y \)$, where $p$ is smooth and supported in a fixed compact annulus ${ r : c_eta lt.eq \| r \| lt.eq C_eta }$, with $0 < c_eta < C_eta < oo$ absolute. We allow a fixed bounded family of such cutoffs, including slightly enlarged cutoffs equal to one on the supports of others. All constants below are uniform when the required finitely many cutoff seminorms are bounded. The dyadic inverse frequency scale $w$ belongs to $2^(bb(Z))$.

#thm([Theorem 1.4.])[
  (Restricted estimate on a vertical band).  #emph[For the fixed absolute constants in (1.2), there is an absolute $C$ such that, for every field $u$ with $lr(||) u lt.eq 1$ and $"Lip" \( u \) lt.eq C_(upright("Lip"))$, every $0 < epsilon.alt < a$, every dyadic $w$, and every vertical band cutoff $P_w$, 
#[#set math.equation(numbering: n => "(1.4)")
 $ lr(|chevron.l H_(u \, a)^epsilon.alt P_w f \, g chevron.r|) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + lr(|log \( \| F \| \/ \| E \| \)|) #scale(x: 120%, y: 120%)[\)]^(- 3) sqrt(\| F \| \| E \|) $ <eq:src-1>]

 whenever $F \, E subset I times bb(R)$ have positive finite measure, $lr(||) f lt.eq upright(bold(1))_F$, $lr(||) g lt.eq upright(bold(1))_E$, and $lr(||) I lt.eq b_0$.]
] <thm:band-restricted>

The proof of 4 will be completed after the packet estimates and their iteration have been established. The next results show, without using that theorem as a premise elsewhere in its proof, that it implies 1. The last part of this section then gives explicit sufficient packet estimates for 4.

#thm([Lemma 1.5.])[
  #emph[Suppose a bilinear form $cal(B)$ satisfies 
$ lr(|cal(B) \( f \, g \)|) lt.eq C_0 \( 1 + \| log \( \| F \| \/ \| E \| \) \| \)^(- 3) sqrt(\| F \| \| E \|) quad \( \| f \| lt.eq upright(bold(1))_F \, med \| g \| lt.eq upright(bold(1))_E \) $

 on finite-measure sets in a fixed measurable domain. Then 
$ lr(|cal(B) \( f \, g \)|) lt.eq C C_0 ∥∥ f_2 ∥∥ g_2 $

 for finite amplitude decompositions, and hence for all $L^2$ inputs whenever the form is obtained by an $L^2$-continuous truncation or by completion from those inputs.]
] <red:restricted-strong>

#proof[
  Use disjoint amplitude sets $F_i = { 2^(i - 1) < \| f \| lt.eq 2^i }$ and write $f = sum_i 2^i f_i$, where $\| f_i \| lt.eq upright(bold(1))_(F_i)$. For the moment all sums are finite. Put $a_i = 2^i sqrt(\| F_i \|)$, so $sum_i a_i^2 lt.eq 4 ∥∥ f_2^2$. Group the indices into measure classes
  $ cal(I)_k = { i : 2^k lt.eq \| F_i \| < 2^(k + 1) } \, #h(2em) A_k = (sum_(i in cal(I)_k) a_i^2)^(1 \/ 2) . $
  If $i_0$ is the largest index in a nonempty class, then
  $ sum_(i in cal(I)_k) a_i lt.eq 2^(\( k + 1 \) \/ 2) sum_(i lt.eq i_0) 2^i lt.eq 2 sqrt(2) thin a_(i_0) lt.eq 2 sqrt(2) thin A_k . $
  Make the analogous decomposition $g = sum_j 2^j g_j$, with measure classes $cal(J)_l$ and square sums $B_l$. For $i in cal(I)_k$, $j in cal(J)_l$,
  $ \( 1 + \| log \( \| F_i \| \/ \| E_j \| \) \| \)^(- 3) lt.eq C \( 1 + \| k - l \| \)^(- 3) . $
  The assumed bound, followed by the within-class estimates, gives
  $ lr(|cal(B) \( f \, g \)|) lt.eq C C_0 sum_(k \, l) \( 1 + \| k - l \| \)^(- 3) A_k B_l lt.eq C C_0 ∥∥ A_(ell^2) ∥∥ B_(ell^2) . $
  The final step is Young’s inequality for the summable sequence $\( 1 + \| k \| \)^(- 3)$. This proves the assertion. Truncating the amplitude decompositions and using the asserted continuity or completion gives the last statement, with no dependence on the number of classes. ◻
]

=== 1.9 A Lipschitz commutator <a-lipschitz-commutator>

The estimate below belongs to the Lipschitz commutator theory initiated by Calderón and developed by Coifman and Meyer #cite(label("Calderon1965")) #cite(label("CoifmanMeyer1978")). We give a dyadic proof with the precise multiplier seminorms needed for Littlewood–Paley reassembly and for the later narrow-bin reduction. The argument separates low output frequencies from the annular interactions, because the constant must remain uniform as the number of frequency scales increases. Let $chi$ be a real even smooth cutoff equal to one on $\[ - 1 \, 1 \]$ and supported in $\[ - 2 \, 2 \]$, and define

$ S_k = chi \( 2^(- k) D \) \, #h(2em) Delta_k = S_k - S_(k - 1) . $

Thus $Delta_k$ is supported in ${ 2^(k - 1) lt.eq \| zeta \| lt.eq 2^(k + 1) }$, and Plancherel gives

#[#set math.equation(numbering: n => "(1.5)")
 $ ∥∥ h_2^2 asymp sum_k ∥Delta_k h∥_2^2 . $ <red:lp-square>]

#thm([Lemma 1.6.])[
  (The required Carleson embedding).  #emph[For every fixed integer $c$, every $q in L^oo \( bb(R) \)$, and every $h in L^2 \( bb(R) \)$, 
#[#set math.equation(numbering: n => "(1.6)")
 $ sum_k ∥\( Delta_k q \) S_(k + c) h∥_2^2 lt.eq C_c ∥∥ q_oo^2 ∥∥ h_2^2 . $ <red:carleson-estimate>]

]
] <red:carleson>

#proof[
  For a dyadic interval $J$ of length $2^(- j)$, split $q = q upright(bold(1))_(3 J) + q upright(bold(1))_(\( 3 J \)^c)$. By (1.5), the first part satisfies
  $ sum_(k gt.eq j) integral_J \| Delta_k \( q upright(bold(1))_(3 J) \) \|^2 lt.eq C ∥∥ q_oo^2 \| J \| . $
  The kernels of $Delta_k$ have Schwartz decay at scale $2^(- k)$. For $x in J$ and $k gt.eq j$, this gives
  $ \| Delta_k \( q upright(bold(1))_(\( 3 J \)^c) \) \( x \) \| lt.eq C ∥∥ q_oo 2^(j - k) . $
  After summing the squares, we obtain
  #[#set math.equation(numbering: n => "(1.7)")
   $ sum_(k gt.eq j) integral_J \| Delta_k q \|^2 lt.eq C ∥∥ q_oo^2 \| J \| . $ <red:carleson-measure>]
  For each dyadic interval $I$ of length $2^(- k)$, set $alpha_I = integral_I \| Delta_k q \|^2$. Then (1.7) says $sum_(I subset J) alpha_I lt.eq C ∥∥ q_oo^2 \| J \|$.
  Write $M$ for the Hardy–Littlewood maximal operator. Kernel decay, summed on dyadic annuli about a point of $I$, gives
  $ sup_(x in I) \| S_(k + c) h \( x \) \| lt.eq C_c "ess inf"_(y in I) M h \( y \) . $
  The shift $c$ is fixed, so moving the kernel center across $I$ changes the bound by only a fixed factor. If $F gt.eq 0$ belongs to $L^2$, the dyadic Carleson condition implies
  $ sum_I alpha_I #scale(x: 120%, y: 120%)[\(] "ess inf"_I F #scale(x: 120%, y: 120%)[\)]^2 lt.eq C ∥∥ q_oo^2 ∥∥ F_2^2 . $
  Indeed, for each $t > 0$, sum over the maximal dyadic intervals on which $"ess inf"_I F > t$, apply the Carleson condition on each such interval, and integrate against $2 t thin upright(d) t$. Their union lies, up to null sets, in ${ F > t }$. Apply this assertion with $F = M h$, and use the $L^2$ maximal theorem. This proves (1.6). This is also the usual continuous Littlewood–Paley Carleson embedding; compare the proof of #cite(label("Tao2007Notes6")) Proposition 4.1. ◻
]

#thm([Lemma 1.7.])[
  #emph[Let $b in W^(1 \, oo) \( bb(R) \)$, and let $T = frak(m) \( D \)$, where $frak(m)$ is smooth away from zero and 
$ A \( frak(m) \) = max_(0 lt.eq r lt.eq 4) sup_(zeta eq.not 0) \| zeta \|^r \| frak(m)^(\( r \)) \( zeta \) \| < oo . $

 Then 
#[#set math.equation(numbering: n => "(1.8)")
 $ ∥\[ b \, T \] partial h∥_2 lt.eq C A \( frak(m) \) ∥b'∥_oo ∥∥ h_2 . $ <red:commutator-estimate>]

 The commutator is initially defined on the Sobolev space $W^(1 \, 2) \( bb(R) \)$; the estimate gives its bounded extension to $L^2$. Its constant is independent of $∥∥ b_oo$ and of all frequency truncations.]
] <red:commutator>

#proof[
  Put $L_b = ∥b'∥_oo$ and $b_k = Delta_k b$. Cancellation and the first absolute moment of the smooth kernels give
  #[#set math.equation(numbering: n => "(1.9)")
   $ ∥b_k∥_oo lt.eq C 2^(- k) L_b \, #h(2em) ∥partial S_k b∥_oo lt.eq C L_b \, #h(2em) b'_k = Delta_k b' . $ <red:b-band>]
  Also $∥S_N b - b∥_oo lt.eq C 2^(- N) L_b$. Consequently, for each fixed $j$, the exact identity
  #[#set math.equation(numbering: n => "(1.10)")
   $ b = S_(j - 4) b + sum_(k gt.eq j - 3) b_k $ <red:b-reconstruction>]
  has a uniformly convergent high-frequency sum. This identity retains the constant and low-frequency part of $b$; no homogeneous reconstruction of a bounded function at frequency zero is needed.
  For any fixed smooth annular cutoff $rho$, let $K_j$ be the kernel of $frak(m) \( D \) rho \( 2^(- j) D \)$. Rescaling and three integrations by parts on its fixed compact frequency support show
  #[#set math.equation(numbering: n => "(1.11)")
   $ integral_(bb(R)) \| z \| thin \| K_j \( z \) \| thin upright(d) z lt.eq C A \( frak(m) \) 2^(- j) . $ <red:kernel-first-moment>]
  In fact the rescaled kernel is bounded by $C A \( frak(m) \) \( 1 + \| z \| \)^(- 3)$, which proves the assertion.
  First suppose that $hat(h)$ is smooth and compactly supported away from zero. Put $h_j = Delta_j h$; only finitely many $h_j$ are nonzero. Apply (1.10) to each of them. There are three interactions.
  For the low frequencies of $b$, put $B_j = S_(j - 4) b$. The supports of both $h_j$ and $B_j h_j$ lie in a fixed annulus of radius $2^j$. A slightly enlarged annular multiplier $T_j$ therefore satisfies $\[ B_j \, T \] partial h_j = \[ B_j \, T_j \] partial h_j$. The kernel formula and (1.11) give
  $ ∥\[ B_j \, T_j \] partial h_j∥_2 lt.eq "Lip" \( B_j \) integral \| z \| \| K_j \( z \) \| thin upright(d) z thin ∥partial h_j∥_2 lt.eq C A \( frak(m) \) L_b ∥h_j∥_2 . $
  The outputs remain in fixed annuli of radius $2^j$. Finite frequency overlap and (1.5) bound their sum by $C A \( frak(m) \) L_b ∥∥ h_2$.
  For $k gt.eq j + 4$, the output of $\[ b_k \, T \] partial h_j$ lies in a fixed annulus of radius $2^k$. Plancherel, Bernstein’s inequality, and (1.9) yield
  $ ∥\[ b_k \, T \] partial h_j∥_2 lt.eq C A \( frak(m) \) L_b 2^(j - k) ∥h_j∥_2 . $
  Group by $k$, use frequency overlap, and apply Young’s inequality on $ell^2 \( bb(Z) \)$ to the summable sequence $2^(- n) upright(bold(1))_(n gt.eq 4)$. This bounds the high–low sum by the same quantity and proves its convergence in $L^2$.
  It remains to consider $\| k - j \| lt.eq 3$. Fix one such difference and write $H_k = h_(k + r)$, $\| r \| lt.eq 3$. The exact identity
  #[#set math.equation(numbering: n => "(1.12)")
   $ \[ b_k \, T \] partial H_k = partial \( \[ b_k \, T \] H_k \) - b'_k T H_k + T \( b'_k H_k \) $ <red:commutator-high-high>]
  treats the possible low output frequencies. Indeed, $partial \( \[ b_k \, T \] H_k \)$ has spectrum in a ball of radius $C 2^k$. Its $Delta_i$ projection vanishes for $i > k + c_0$, with $c_0$ fixed, and otherwise
  $ ∥Delta_i partial \( \[ b_k \, T \] H_k \)∥_2 lt.eq C A \( frak(m) \) L_b 2^(i - k) ∥H_k∥_2 . $
  Another application of (1.5) and Young’s inequality to $2^(- n) upright(bold(1))_(n gt.eq - c_0)$ bounds the sum of these derivative terms. Thus arbitrarily low output frequencies cause no logarithmic loss.
  Choose a fixed $c_1$ so that $S_(k + c_1)$ equals one on the spectrum of every product $b'_k H_k$. For $g in L^2$,
  $ lr(|⟨sum_k b'_k H_k \, g⟩|) & lt.eq (sum_k ∥H_k∥_2^2)^(1 \/ 2) (sum_k ∥\( Delta_k b' \) S_(k + c_1) g∥_2^2)^(1 \/ 2)\
 & lt.eq C L_b (sum_k ∥H_k∥_2^2)^(1 \/ 2) ∥∥ g_2 \, $
  by 6. Since $∥∥ T_(2 arrow.r 2) lt.eq A \( frak(m) \)$, this bounds $T sum_k b'_k H_k$. Replacing $H_k$ by $T H_k$ in the same calculation bounds $sum_k b'_k T H_k$: the frequency supports are unchanged and $sum_k ∥T H_k∥_2^2 lt.eq A \( frak(m) \)^2 sum_k ∥H_k∥_2^2$. Equation (1.12), summed over its seven possible differences, completes the proof on the chosen dense class.
  For $h in W^(1 \, 2)$, approximate by $\( S_N - S_(- N) \) h$, followed if necessary by smooth compact Fourier approximations away from zero. The approximation converges in $W^(1 \, 2)$. Since $b$ is bounded and $T$ is $L^2$-bounded, the defining commutators converge in $L^2$. The estimate passes to the limit, and then defines a bounded operator on all of $L^2$. ◻
]

For a vertical multiplier $T$, set

$ C_t h \( x \, y \) = h \( x \, y - t u \( x \, y \) \) . $

#thm([Corollary 1.8.])[
  #emph[For $lr(||) t lt.eq b_0$ and $T$ as in 7, 
#[#set math.equation(numbering: n => "(1.13)")
 $ ∥T C_t h - C_t T h∥_2 lt.eq C A \( frak(m) \) lr(||) t thin ∥∥ h_2 . $ <red:composition-bound>]

 The constant is uniform over $lr(||) u lt.eq 1$, $"Lip" \( u \) lt.eq C_(upright("Lip"))$.]
] <red:composition-commutator>

#proof[
  Work first with a smooth field and on one fixed $x$-fiber. Let $phi_s \( y \) = y - s u \( x \, y \)$. Direct differentiation gives
  $ C_s^(- 1) C'_s = b_s partial_y \, #h(2em) b_s = - u \( x \, dot.op \) compose phi_s^(- 1) \, $
  and hence, since $T$ commutes with $partial_y$,
  #[#set math.equation(numbering: n => "(1.14)")
   $ frac(thin upright(d), thin upright(d) s) \( C_s T C_s^(- 1) \) = C_s \[ b_s \, T \] partial_y C_s^(- 1) . $ <red:conjugation-derivative>]
  The bi-Lipschitz estimates in 3 imply
  $ ∥C_s∥_(2 arrow.r 2) + ∥C_s^(- 1)∥_(2 arrow.r 2) lt.eq C \, #h(2em) "Lip" \( b_s \) lt.eq frac(C_(upright("Lip")), 1 - \| s \| C_(upright("Lip"))) lt.eq C . $
  Apply 7 inside (1.14), integrate from $0$ to $t$, and multiply by $C_t$. The estimate is uniform in the fiber, so integration in $x$ proves (1.13).
  A bounded Lipschitz field is approximated by convolutions with smooth approximate identities, preserving the bounds on its size and Lipschitz seminorm. For each fixed small $s$, the corresponding composition operators converge strongly on $L^2$: this follows first for continuous compactly supported inputs by uniform convergence of the maps, and then by density and their uniform operator bounds. Passing to the limit proves the assertion for the original field. ◻
]

=== 1.10 Square-function reassembly <square-function-reassembly>

The preceding composition estimate pays a factor of $\| t \|$, which cancels the singular measure $thin upright(d) t \/ \| t \|$ when commutators are integrated. This is the mechanism that permits the band estimates to be assembled. Di Plinio, Guo, Thiele and Zorin-Kranich established this band-to-full reduction under Lipschitz regularity #cite(label("DiPlinioGuoThieleZorinKranich2018")) Corollaries 1.3–1.4 of the author version. We retain the argument here to track the fixed outer endpoint, arbitrary inner endpoint and horizontal localization used throughout this paper.

Choose a real smooth annular function $p$ so that $sum_(w in 2^(bb(Z))) p \( w eta \)^2 = 1$ for $eta eq.not 0$. Such a function is obtained by dividing an ordinary smooth dyadic partition by the square root of its sum of squares. Set $P_w = p \( w D_y \)$. For every finite set $cal(W)$ of scales and every choice of signs $epsilon_w in { - 1 \, 1 }$, the multiplier $T = sum_(w in cal(W)) epsilon_w P_w$ satisfies $A \( frak(m)_T \) lt.eq C$, by finite overlap of the annuli. Writing $S_t^x h \( x \, y \) = h \( x - t \, y \)$, we have

$ H_(u \, a)^epsilon.alt = integral_(epsilon.alt < \| t \| < a) C_t S_t^x frac(thin upright(d) t, t) . $

The vertical multiplier $T$ commutes with $S_t^x$. Thus 8 implies

#[#set math.equation(numbering: n => "(1.15)")
 $ ∥\[ T \, H_(u \, a)^epsilon.alt \]∥_(2 arrow.r 2) lt.eq C integral_(epsilon.alt < \| t \| < a) \| t \| frac(thin upright(d) t, \| t \|) lt.eq C a . $ <red:integrated-commutator>]

All these operators are already bounded on $L^2$ for fixed $epsilon.alt > 0$, with the elementary bound $C log \( a \/ epsilon.alt \)$; no conclusion of 4 is needed to form their square functions.

Randomize the signs independently and use their orthogonality. For $f = upright(bold(1))_(I times bb(R)) f$, Equation (1.15) and the triangle inequality in the random-sign $L^2$ space give

#[#set math.equation(numbering: n => "(1.16)")
 $ (sum_(w in cal(W)) ∥upright(bold(1))_(I times bb(R)) P_w H_(u \, a)^epsilon.alt f∥_2^2)^(1 \/ 2) lt.eq C ∥∥ f_2 + (sum_(w in cal(W)) ∥upright(bold(1))_(I times bb(R)) H_(u \, a)^epsilon.alt P_w f∥_2^2)^(1 \/ 2) . $ <red:reassembly>]

The horizontal restriction commutes with every vertical multiplier.

#thm([Proposition 1.9.])[
  #emph[The uniform restricted estimate in 4 implies 1.]
] <red:band-implies-main>

#proof[
  Apply 5 to the localized band form. It gives a uniform local $L^2$ bound for $H_(u \, a)^epsilon.alt tilde(P)_w$, where $tilde(P)_w$ is an enlarged cutoff equal to one on the spectrum of $P_w$. Since $P_w f$ retains the same horizontal support,
  $ ∥upright(bold(1))_(I times bb(R)) H_(u \, a)^epsilon.alt P_w f∥_2 = ∥upright(bold(1))_(I times bb(R)) H_(u \, a)^epsilon.alt tilde(P)_w \( P_w f \)∥_2 lt.eq C ∥P_w f∥_2 . $
  Insert this in (1.16) and let $cal(W)$ increase to all dyadic scales. Plancherel and the square partition give $∥upright(bold(1))_(I times bb(R)) H_(u \, a)^epsilon.alt f∥_2 lt.eq C ∥∥ f_2$, uniformly in $epsilon.alt$. The localization already proved above gives the asserted global bound for the unit field. Finally, for a Schwartz input the symmetric principal value exists pointwise; Fatou gives its $L^2$ bound, and Chebyshev gives the weak estimate in 1. ◻
]

=== 1.11 Removing long and very short times <removing-long-and-very-short-times>

We now reduce 4 to packet estimates. In this part only, abbreviate $H_(u \, a)^epsilon.alt$ to $H$, and put

$ L = log sqrt(\| E \| \/ \| F \|) . $

Fix a sufficiently large absolute threshold $L_0$, which can be increased after the fixed constants in the argument are chosen. When $L gt.eq L_0$, choose dyadic numbers satisfying

#[#set math.equation(numbering: n => "(1.17)")
 $ 1 / 2 e^(- L^0.97) < tau lt.eq e^(- L^0.97) \, #h(2em) e^(L^0.9) lt.eq m < 2 e^(L^0.9) \, #h(2em) W = m w . $ <red:small-time-parameters>]

Here $tau$ is the short-time cutoff. The parameter $m$ sets the number of vertical frequency bins: their width will be comparable to $W^(- 1)$, and $W = m w$ is the corresponding spatial width. For every fixed $C$, the product $m^C tau$ tends to zero as $L arrow.r oo$; this pays for the binning errors. We take $L_0$ large enough that $tau < a$. For all other values of $L$, let $m = 1$, $W = w$, and let $tau in \( 0 \, a \)$ be a fixed small dyadic constant.

#thm([Lemma 1.10.])[
  #emph[For any fixed $1 < p < oo$, the contribution of $max \( epsilon.alt \, tau \) < \| t \| < a$ to $H P_w$ has $L^p$ norm at most $C_p \( 1 + L \)$ if $L gt.eq L_0$, and at most a fixed $C_p$ otherwise. On the remaining times below $w$, replacing $u$ by zero costs a uniformly bounded $L^p$ operator. The resulting horizontal symmetric truncation is uniformly bounded on $L^p$.]
] <red:time-reduction>

#proof[
  The first assertion follows from 3, the uniform $L^1$ norm of the convolution kernel of $P_w$, and
  $ integral_(tau < \| t \| < a) frac(thin upright(d) t, \| t \|) = 2 log \( a \/ tau \) lt.eq C \( 1 + L^0.97 \) . $
  For the second, the fundamental theorem of calculus gives
  $ & \( P_w h \) \( x - t \, y - t u \( x \, y \) \) - \( P_w h \) \( x - t \, y \)\
 & #h(2em) = - t u \( x \, y \) integral_0^1 \( partial_y P_w h \) \( x - t \, y - theta t u \( x \, y \) \) thin upright(d) theta . $
  The intermediate maps satisfy 3, and the kernel of $partial_y P_w$ has $L^1$ norm $O \( w^(- 1) \)$. Consequently,
  #[#set math.equation(numbering: n => "(1.18)")
   $ ∥\( A_t - S_t^x \) P_w h∥_p lt.eq C_p \| t \| w^(- 1) ∥∥ h_p . $ <red:short-time-error>]
  Integrating over any subinterval of $0 < \| t \| < w$ against $thin upright(d) t \/ \| t \|$ gives a constant. Equation (1.1) handles the horizontal part, uniformly in its inner and outer endpoints. ◻
]

Every error with $L^p$ norm $B_p$ contributes at most

#[#set math.equation(numbering: n => "(1.19)")
 $ B_p \| F \|^(1 \/ p) \| E \|^(1 - 1 \/ p) = B_p sqrt(\| F \| \| E \|) (frac(\| F \|, \| E \|))^(1 \/ p - 1 \/ 2) $ <red:restricted-error>]

to the restricted form. In the regime $L gt.eq L_0$, choose one fixed $p < 2$, for example $p = 3 \/ 2$; the normalized error is then at most $C \( 1 + L \) e^(- L \/ 3)$. In the opposite regime $\| F \| gt.eq \| E \|$, the fixed choice $p = 4$ gives the power $\( \| E \| \/ \| F \| \)^(1 \/ 4)$ for each uniformly bounded error. On a bounded range of $L$, fixed operator bounds suffice. These choices are made once and do not approach the endpoint $p = 2$.

=== 1.12 From a spatial truncation to a finite scale sum <from-a-spatial-truncation-to-a-finite-scale-sum>

Choose an even smooth cutoff $chi_0$, equal to one near zero and compactly supported, and set

$ theta.alt \( r \) = chi_0 \( r \) - chi_0 \( 2 r \) \, #h(2em) psi \( r \) = - i pi "sgn" \( r \) theta.alt \( r \) . $

The function $psi$ is smooth and supported in a fixed compact annulus. Its inverse Fourier transform $k$ is Schwartz, and $k_ell \( t \) = ell^(- 1) k \( t \/ ell \)$ has multiplier $psi \( ell zeta \)$. Since $sum_(ell in 2^(bb(Z))) theta.alt \( ell zeta \) = 1$ for $zeta eq.not 0$,

$ sum_(ell in 2^(bb(Z))) k_ell \( t \) = 1 / t #h(2em) \( t eq.not 0 \) . $

The identity follows by Fourier inversion in tempered distributions; away from zero the kernel sum is locally uniformly convergent by Schwartz decay for small $ell$ and the bound $C \/ ell$ for large $ell$.

#thm([Lemma 1.11.])[
  #emph[For dyadic $0 < r lt.eq R$, 
#[#set math.equation(numbering: n => "(1.20)")
 $ integral_(bb(R)) lr(|upright(bold(1))_({ r < \| t \| < R }) / t - sum_(r lt.eq ell lt.eq R) k_ell \( t \)|) thin upright(d) t lt.eq C . $ <red:scale-kernel-error>]

 Also, 
#[#set math.equation(numbering: n => "(1.21)")
 $ integral_(bb(R)) \| t \| lr(|sum_(r lt.eq ell lt.eq R) k_ell \( t \)|) thin upright(d) t lt.eq C R . $ <red:scale-first-moment>]

 Both constants are independent of the number of scales. Changing either spatial endpoint by a fixed factor preserves the first bound.]
] <red:scale-truncation>

#proof[
  For $r < \| t \| < R$, the omitted scales below $r$ have sum bounded by $C r \/ \| t \|^2$, using $lr(|k_ell \( t \)|) lt.eq C ell \/ \| t \|^2$ and a geometric sum. The omitted scales above $R$ have sum at most $C \/ R$. The integrals of these bounds over the middle interval are bounded. For $\| t \| < r$, the retained sum is at most $C sum_(ell gt.eq r) ell^(- 1) lt.eq C \/ r$; for $\| t \| > R$, it is at most $C R \/ \| t \|^2$. These are integrable on their respective regions and prove (1.20). For the moment bound, use
  $ integral \| t \| \| k_ell \( t \) \| thin upright(d) t = ell integral \| s \| \| k \( s \) \| thin upright(d) s $
  and $sum_(ell lt.eq R) ell lt.eq 2 R$. Finally, changing an endpoint by a fixed factor changes the spatial kernel only on an annulus having bounded $thin upright(d) t \/ \| t \|$ measure. ◻
]

After 10, the only possible remaining times are between $r = max \( w \, epsilon.alt \)$ and $tau$. Round the lower endpoint to a comparable dyadic number; the resulting annular error has a uniform $L^p$ bound. If this lower endpoint exceeds $tau$, there is no remaining model. Otherwise 11 reduces the multiplier, with $u$ frozen at the output point, to

#[#set math.equation(numbering: n => "(1.22)")
 $ frak(a)_(u \, cal(L)) \( x \, y \; xi \, eta \) = sum_(ell in cal(L)) psi #scale(x: 120%, y: 120%)[\(] ell \( xi + eta u \( x \, y \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(L) subset { ell in 2^(bb(Z)) : w lt.eq ell lt.eq tau } . $ <eq:src-2>]

Here $cal(L)$ is the consecutive set of retained scales; when $epsilon.alt lt.eq w$ it is the whole displayed range. Denote the associated operator by $cal(A)_(u \, cal(L))$, or simply $cal(A)$. Its spatial representation is

$ cal(A) h \( x \, y \) = integral_(bb(R)) K_(cal(L)) \( t \) h \( x - t \, y - t u \( x \, y \) \) thin upright(d) t \, #h(2em) K_(cal(L)) = sum_(ell in cal(L)) k_ell . $

The kernels in this representation are not compactly supported in $t$. This causes no large-time change-of-variables problem: if both the input and the test are supported in $I times bb(R)$, a nonzero contribution has $t in I - I$, hence $\| t \| lt.eq b_0$. Every vertical cutoff preserves that horizontal support. Thus 3 applies to the localized kernel error in (1.20), and its $L^p$ cost is uniform. Only the original input and test carry horizontal restrictions; no spatial support is subsequently imposed on their convolutions.

=== 1.13 Narrow vertical bins <narrow-vertical-bins>

Split the vertical cutoff into its positive and negative frequency parts. Reflection $y mapsto - y$ interchanges the two cases and replaces $u$ by $- u$, preserving all assumptions. We work with positive frequencies, so $c_eta lt.eq w eta lt.eq C_eta$.

Suppose first that $L gt.eq L_0$ and $m$ is as in (1.17). Choose real smooth cutoffs $Q_j$, $1 lt.eq j lt.eq J lt.eq C m$, supported in intervals of length $C \/ W$ centered at $eta_j asymp w^(- 1)$, with bounded overlap and

$ sum_(j = 1)^J Q_j \( eta \)^2 = 1 quad upright("on ") "supp" p \( w eta \) . $

One obtains them from a fixed smooth partition at spacing $W^(- 1)$ by dividing by the square root of its sum of squares on a slightly enlarged band. Their normalized profiles and all fixed derivatives are uniform. In particular, their convolution kernels have bounded $L^1$ norms, and

#[#set math.equation(numbering: n => "(1.23)")
 $ A \( Q_j \) lt.eq C m^4 . $ <red:bin-mikhlin>]

Let $tilde(Q)_j$ be a slightly enlarged cutoff equal to one on the spectrum of $Q_j P_w$. These cutoffs again have the stated bin width and normalized smoothness bounds.

Set $F_j^0 = Q_j P_w f$ and $G_j^0 = Q_j g$. The identity on the band and self-adjointness of the $Q_j$ give

#[#set math.equation(numbering: n => "(1.24)")
 $ chevron.l cal(A) P_w f \, g chevron.r = sum_j chevron.l cal(A) tilde(Q)_j F_j^0 \, G_j^0 chevron.r + sum_j chevron.l \[ cal(A) \, Q_j \] F_j^0 \, g chevron.r . $ <red:bin-diagonalization>]

Indeed, expand $P_w = sum_j Q_j^2 P_w$, commute one $Q_j$ past $cal(A)$, and use $tilde(Q)_j F_j^0 = F_j^0$. This identity does not require $cal(A)$ to preserve individual bins.

On localized inputs and tests, Equations (1.13), (1.21), and (1.23) imply

$ lr(|chevron.l \[ cal(A) \, Q_j \] F_j^0 \, g chevron.r|) lt.eq C m^4 tau ∥F_j^0∥_2 ∥∥ g_2 . $

In applying the composition estimate, only $\| t \| lt.eq b_0$ are tested, as explained above. Bounded frequency overlap gives $sum_j ∥F_j^0∥_2^2 lt.eq C ∥∥ f_2^2$, so the total error in (1.24) is at most

#[#set math.equation(numbering: n => "(1.25)")
 $ C m^5 tau ∥∥ f_2 ∥∥ g_2 . $ <red:bin-error>]

The harmless integer exponent five includes the factor $sqrt(J)$. More generally, any fixed multiplier seminorm choice would give $C m^C tau$, and for every fixed $C \, N$,

#[#set math.equation(numbering: n => "(1.26)")
 $ m^C tau lt.eq C exp #scale(x: 120%, y: 120%)[\(] C' L^0.9 - L^0.97 #scale(x: 120%, y: 120%)[\)] = O \( L^(- N) \) . $ <red:bin-error-small>]

The large-$L$ threshold in this statement is absolute after the fixed exponents are chosen.

Let $cal(H) = bb(C)^J$ with its Euclidean norm, and regard $F^0 = \( F_j^0 \)_j$, $G^0 = \( G_j^0 \)_j$ as $cal(H)$-valued functions. For some fixed power $Q = C m^C$, their norms obey

#[#set math.equation(numbering: n => "(1.27)")
 $ ∥F^0∥_(L^oo \( cal(H) \)) & lt.eq Q \, & ∥F^0∥_(L^1 \( cal(H) \)) & lt.eq Q \| F \| \, & ∥F^0∥_(L^2 \( cal(H) \))^2 & lt.eq C \| F \| \,\
∥G^0∥_(L^oo \( cal(H) \)) & lt.eq Q \, & ∥G^0∥_(L^1 \( cal(H) \)) & lt.eq Q \| E \| \, & ∥G^0∥_(L^2 \( cal(H) \))^2 & lt.eq C \| E \| . $ <red:bin-vector-norms>]

For the first two columns, apply the uniform scalar kernel bounds and sum over at most $C m$ components. For the last column, use Plancherel and bounded overlap. No compact support in $y$ is asserted after the projections. Horizontal support in $I$ is preserved.

When $m = 1$, we do not perform this commutation or project the test. Instead retain the original positive-frequency band cutoff on the input and use one scalar component. It fits in a vertical frequency interval centered at a fixed $eta_1 asymp w^(- 1)$ of length $C \/ w = C \/ W$. Its positive annular support is retained.

#thm([Lemma 1.12.])[
  (Amplitude levels after bin projection).  #emph[Let $h : bb(R)^2 arrow.r cal(H)$ satisfy 
$ ∥∥ h_oo lt.eq Q \, #h(2em) ∥∥ h_1 lt.eq Q M_0 \, #h(2em) ∥∥ h_2^2 lt.eq C_0 M_0 \, $

 where $M_0 > 0$ and $Q lt.eq C exp \( C L^0.9 \)$. Write 
$ A_i = { 2^(i - 1) < ∥h \( dot.op \)∥_(cal(H)) lt.eq 2^i } \, #h(2em) a_i = 2^i sqrt(\| A_i \| \/ M_0) . $

 For sufficiently large absolute $L$, 
#[#set math.equation(numbering: n => "(1.28)")
 $ sum_i a_i lt.eq C sqrt(1 + L) \, #h(2em) sum_({ i : thin \| log \( \| A_i \| \/ M_0 \) \| > L \/ 4 }) a_i lt.eq C e^(- c L) . $ <red:level-weight-bounds>]

 Empty level sets are omitted. The constants depend on the fixed constants in the hypotheses, not on the dimension of $cal(H)$.]
] <red:bin-levels>

#proof[
  The amplitude upper bound implies $2^i lt.eq 2 Q$ on every nonempty level. If $\| A_i \| < e^(- L \/ 4) M_0$, then $a_i lt.eq 2^i e^(- L \/ 8)$, and summing the geometric series in $i$ gives $C Q e^(- L \/ 8)$. If $\| A_i \| > e^(L \/ 4) M_0$, the $L^1$ bound gives
  $ 2^i lt.eq 2 Q e^(- L \/ 4) \, #h(2em) a_i^2 = 4^i \| A_i \| \/ M_0 lt.eq 2 Q thin 2^i . $
  Summing the square-root geometric series over the allowed amplitudes again gives $C Q e^(- L \/ 8)$. Since $log Q = O \( L^0.9 \)$, both tails are $O \( e^(- c L) \)$.
  The remaining level sets occupy at most $C \( 1 + L \)$ dyadic measure classes. Within a class, the geometric estimate in the proof of 5 bounds the sum of $a_i$ by a constant times its square sum. Cauchy–Schwarz over the classes and $sum_i a_i^2 lt.eq 4 C_0$ give the first bound in (1.28). The already bounded tails can be included in that bound. ◻
]

Apply 12 to the two vectors in (1.27). Decomposing them into amplitude levels produces vector inputs and tests bounded by indicators of new sets. The extra cutoffs $tilde(Q)_j$ in (1.24) remain part of the operator after this decomposition; thus no band support is being assumed for an individual amplitude slice. If both new sets have retained measures, then their logarithmic disparity is in

#[#set math.equation(numbering: n => "(1.29)")
 $ [3 / 4 L \, 5 / 4 L] subset [1 / 2 L \, 2 L] . $ <red:new-disparity>]

Indeed, the two changes of logarithmic measure are each at most $L \/ 4$, and the logarithm of the square-root ratio uses one half of their difference. The product of the two sums of normalized amplitude weights is $O \( 1 + L \)$.

=== 1.14 The admissible packet forms <the-admissible-packet-forms>

We next describe the packet model with all geometric and analytic uniformities that will be used. Fix $w in 2^(bb(Z))$, $m gt.eq 1$, $W = m w$, a finite dyadic scale set $cal(L) subset \[ w \, tau \]$, and at most $C m$ bin centers $eta_j asymp w^(- 1)$. The scalar case $m = 1$ just described is included. Constants in this definition are fixed throughout.

#prodef([Definition 1.13.])[
  A tile $s$ has a length $ell_s in cal(L)$, a bounded slope $theta_s$, a center $z_s = \( x_s \, y_s \)$, and precision $d_s = w \/ ell_s$. Its box is
  $ R_s = {\( x \, y \) : \| x - x_s \| lt.eq ell_s / 2 \, quad \| \( y - y_s \) - theta_s \( x - x_s \) \| lt.eq W / 2} \, #h(2em) \| R_s \| = ell_s W . $
  A $t$-box is defined by the same formula with slope $t$. The nominal horizontal length need not be the Euclidean long side when $W > ell_s$.
  At a fixed scale, slope labels have bounded multiplicity on every interval of length $d_s$. For each scale and label, the centers lie in one translated box lattice
  $ z_0 + { \( n ell_s \, theta_s n ell_s + k W \) : n \, k in bb(Z) } . $
  The lattice and center of a tile are common to every bin component. An admissible collection is any finite subcollection of such lattices.
  Its analyzing and synthesizing waves, denoted $Phi_(s \, j)$ and $Psi_(s \, j)$, are bounded-normalized modulated Schwartz functions adapted to $R_s$. More precisely, each can be written as
  $ e^(i eta_j \( \( y - y_s \) - theta_s \( x - x_s \) \)) phi.alt_(s \, j) (frac(x - x_s, ell_s) \, frac(\( y - y_s \) - theta_s \( x - x_s \), W)) \, $
  where, for all fixed nonnegative integers $a \, b \, N$,
  #[#set math.equation(numbering: n => "(1.30)")
   $ \| partial_X^a partial_Y^b phi.alt_(s \, j) \( X \, Y \) \| lt.eq C_(a \, b \, N) \( 1 + \| X \| + \| Y \| \)^(- N) . $ <red:packet-seminorms>]
  The constants are uniform in $s \, j \, w \, m$. Both waves also have Fourier support in
  #[#set math.equation(numbering: n => "(1.31)")
   $ \| eta - eta_j \| lt.eq C W^(- 1) \, #h(2em) c'_eta lt.eq w eta lt.eq C'_eta \, #h(2em) \| xi + theta_s eta \| lt.eq c_(*) ell_s^(- 1) \, $ <red:packet-spectra>]
  with fixed positive $c'_eta \, C'_eta$. The constant $c_(*)$ is chosen sufficiently small compared with the selector separation constants below and the fixed annular support of $psi$.
  The scalar selector $b_(s \, j)$ is smooth, with
  #[#set math.equation(numbering: n => "(1.32)")
   $ "supp" b_(s \, j) subset { t : c_b d_s lt.eq \| t - theta_s \| lt.eq C_b d_s } \, #h(2em) d_s^r ∥b_(s \, j)^(\( r \))∥_oo lt.eq C_r $ <red:selector-assumptions>]
  for every fixed $r gt.eq 0$, where $0 < c_b < C_b$ are absolute. Finally, the collection uses one angular dyadic grid. Each tile has an interval $Omega_s$ in that grid, of length $C_Omega d_s$, where $C_Omega$ is a fixed large dyadic number, containing both the wave slope support ${ - xi \/ eta : \( xi \, eta \) in "supp" hat(Phi)_(s \, j) union "supp" hat(Psi)_(s \, j) }$ and every selector support, with a margin at least $c_Omega d_s$, where $c_Omega > 0$ is fixed. The interval is common to all components. Its level depends only on $ell_s$.
] <red:packets>

The associated form is

#[#set math.equation(numbering: n => "(1.33)")
 $ Lambda_(cal(S)) \( f \, g \) = sum_(s in cal(S)) \| R_s \|^(- 1) sum_j chevron.l f_j \, Phi_(s \, j) chevron.r chevron.l b_(s \, j) \( u \) Psi_(s \, j) \, g_j chevron.r . $ <eq:src-3>]

It is linear in $f$ and conjugate-linear in $g$. The definition makes sense for an arbitrary measurable bounded field $u$. In particular, the ordinary scalar and vector estimates in the next section do not require spatial Lipschitz regularity of $u$. The stronger estimates later in the proof use the Lipschitz hypothesis from (1.2).

#thm([Proposition 1.14.])[
  (Packet representation).  #emph[The diagonal form 
$ sum_j chevron.l cal(A)_(u \, cal(L)) tilde(Q)_j f_j \, g_j chevron.r $

 is a sum, with absolutely summable scalar coefficients, of averages of forms (1.33). Each form satisfies 13, uniformly in $w \, m \, cal(L)$, and has one common angular grid and common spatial lattices across components. The same assertion holds for $m = 1$ with the original positive-frequency band cutoff in place of $tilde(Q)_1$. The sums can be obtained as limits of finite packet collections.]
] <red:packet-representation>

#proof[
  We give the construction, including the normalization and the separation of the different series forms. At each length $ell$, partition the frequency slope $- xi \/ eta$ smoothly into intervals of width $c thin d$, $d = w \/ ell$, with centers $theta$ on a lattice of spacing a fixed small multiple of $d$. Take $c$ so small that on every such frequency piece $lr(|ell \( xi + theta eta \)|) lt.eq c_(*) \/ 4$. Introduce normalized coordinates
  #[#set math.equation(numbering: n => "(1.34)")
   $ X' = ell \( xi + theta eta \) \, #h(2em) Y' = W \( eta - eta_j \) \, #h(2em) U' = \( u - theta \) \/ d . $ <red:normalized-symbol>]
  Then
  #[#set math.equation(numbering: n => "(1.35)")
   $ ell \( xi + u eta \) = X' + \( w eta \) U' \, #h(2em) w eta = w eta_j + Y' \/ m . $ <red:symbol-identity>]
  The vertical cutoff restricts $Y'$ to a fixed compact interval and $w eta$ to a fixed positive annulus. On the support of $psi$, its argument is bounded away from zero. In view of $lr(|X'|) lt.eq c_(*) \/ 4$, this forces $c'_b lt.eq \| U' \| lt.eq C'_b$, with fixed positive bounds. Enlarge these bounds slightly, retaining separation from zero. Since $d lt.eq 1$ and $lr(||) u lt.eq 1$, only bounded values of $theta$ can contribute.
  In the coordinates (1.34), the product of the annular multiplier, the slope partition, and the vertical cutoff is smooth on a fixed compact coordinate region, with all fixed derivatives bounded uniformly. For example the slope partition is a smooth function of $- X' \/ \( w eta \)$, and (1.35) shows that its derivatives are uniform because $w eta$ stays away from zero and $m gt.eq 1$. Choose slightly enlarged smooth plateaus in $X' \, Y' \, U'$, with the $X'$-plateau supported in $\| X' \| < c_(*)$, the $U'$-plateau supported away from zero, and an additional vertical plateau keeping $w eta$ in a positive annulus. Fourier series on a larger fixed coordinate box now give
  $ sum_(nu in bb(Z)^3) a_(nu \, ell \, theta \, j) A_(nu \, ell \, theta \, j) \( xi \, eta \) B_(nu \, ell \, theta \, j) \( \( u - theta \) \/ d \) \, $
  where $A_nu$ is a localized exponential in $\( X' \, Y' \)$, $B_nu$ is a localized exponential in $U'$, and for every fixed $N$,
  #[#set math.equation(numbering: n => "(1.36)")
   $ sup_(ell \, theta \, j \, w \, m) \| a_(nu \, ell \, theta \, j) \| lt.eq C_N \( 1 + \| nu \| \)^(- N) . $ <red:fourier-series-decay>]
  This follows by integration by parts on the fixed coordinate box. Multiplication by the plateaus restores the original symbol exactly; their supports give the strict spectral and selector restrictions in 13.
  Factor the frequency function $A_nu$ into two smooth frequency functions by inserting a plateau equal to one on its support. Both factors retain $\| X' \| < c_(*)$, a vertical interval of length $C \/ W$, and a positive annular vertical support. Their inverse Fourier transforms are modulated Schwartz kernels at the scales $ell \, W$. Their fixed seminorms, and those of the selector factor, grow at most polynomially in $\| nu \|$. The coefficients in (1.36) absorb these losses uniformly. One can do this simultaneously for every fixed seminorm as follows. Let $A_nu^(*) = sup_(ell \, theta \, j \, w \, m) \| a_(nu \, ell \, theta \, j) \|$ and omit zero values. Extract the common coefficient $c_nu = \( A_nu^(*) \)^(1 \/ 4)$, multiply each of the two frequency factors by $\( A_nu^(*) \)^(1 \/ 4)$, and multiply the selector factor by $a_(nu \, ell \, theta \, j) \/ \( A_nu^(*) \)^(3 \/ 4)$. The product is unchanged. Each of the three factors now has uniform fixed seminorms, by (1.36), and $sum_nu c_nu < oo$. In particular, no derivative order in this construction grows with $L$ or a truncation parameter.
  For clarity, consider one such factored term $b \( u \) A \( D \) B \( D \)$. Write $K_A \, K_B$ for its two convolution kernels and $\| R \| = ell W$. At an intermediate convolution center $z$, put
  $ Psi_z \( x \) = \| R \| K_A \( x - z \) \, #h(2em) Phi_z \( y \) = \| R \| overline(K_B \( z - y \)) . $
  Then the contribution to the bilinear form is exactly
  #[#set math.equation(numbering: n => "(1.37)")
   $ frac(1, \| R \|^2) integral_(bb(R)^2) chevron.l f \, Phi_z chevron.r chevron.l b \( u \) Psi_z \, g chevron.r thin upright(d) z . $ <red:continuous-packets>]
  The conjugation in $Phi_z$ keeps its Fourier support in the same positive-frequency region as that of $Psi_z$. Both waves have the carrier $eta_j \( - theta \, 1 \)$ and satisfy (1.30)–(1.31).
  Let $cal(Q)$ be a fundamental cell of the box lattice, of area $\| R \|$. For any integrable function $F$,
  $ integral_(bb(R)^2) F \( z \) thin upright(d) z = integral_(cal(Q)) sum_(n \, k in bb(Z)) F #scale(x: 120%, y: 120%)[\(] z + \( n ell \, theta n ell + k W \) #scale(x: 120%, y: 120%)[\)] thin upright(d) z . $
  Applying this identity to (1.37) and normalizing the average over $cal(Q)$ leaves precisely the factor $\| R \|^(- 1)$ in (1.33). Use the same translation for every $j$ at this scale and slope. There are only finitely many lengths and relevant slope labels, so a finite product of these normalized translation measures supplies a common average for their complete sum.
  We also need one angular grid per form. The union of the wave slope supports and all selector supports for a label $theta$ is contained in $\[ theta - C d \, theta + C d \]$, with $C$ fixed and independent of $j$. Choose a sufficiently large fixed dyadic multiple $H d$. Among three adjacent dyadic grids, this interval is contained in a cell of length $H d$ with a margin comparable to $d$. One may see this directly from the three grids
  $ { 2^(- k) \( \[ 0 \, 1 \) + n + \( - 1 \)^k alpha \) : n \, k in bb(Z) #scale(x: 120%, y: 120%)[}] \, #h(2em) alpha in { 0 \, 1 \/ 3 \, 2 \/ 3 } : $
  they are nested, and their boundary positions at any fixed scale are spaced by one third of that scale. Taking $H$ large gives the claimed containment and margin. This is the usual adjacent-grid principle; see #cite(label("LernerNazarov2019")) Theorem 3.1 and Remark 3.2. Assign each label to one suitable grid and split the sum into the three resulting forms. Since $d = w \/ ell$ is dyadic, the chosen cell level depends only on $ell$.
  At a fixed length and label, the lattice sums converge absolutely in a bilinear pairing of $L^2$ functions. Indeed, envelope decay and Cauchy–Schwarz give
  $ sum_z \| R \|^(- 1) \| chevron.l f \, Phi_z chevron.r \|^2 lt.eq C ∥∥ f_2^2 \, #h(2em) sum_z \| R \|^(- 1) \| chevron.l b_z \( u \) Psi_z \, g chevron.r \|^2 lt.eq C ∥∥ g_2^2 . $
  For example, bound each squared pairing by $C \| R \|$ times the integral of $\| f \|^2$ against a decaying box envelope, and then sum those envelopes over the lattice. Their sum is uniformly bounded. The same argument works with the bounded selector and with vector components, by a further Cauchy–Schwarz inequality in $j$. Since the length and label sets are finite, the continuous representation is justified by these bounds and the summability in $nu$, first on regular inputs and then on $L^2$. Exhausting each lattice by finite subsets gives the claimed finite packet approximations.
  For each fixed series index and angular grid, all scales and labels are kept in one form before its estimate is applied. Different series indices remain separate forms and are summed only using $sum_nu c_nu < oo$. In particular, their copies of the same spatial lattice are never combined into a collection with unbounded multiplicity. This completes the representation. ◻
]

=== 1.15 The precise remaining model estimates <the-precise-remaining-model-estimates>

The following proposition states the forward dependency used to finish the band theorem. It also records exactly how much saving survives the bin and amplitude reductions.

#thm([Proposition 1.15.])[
  #emph[Suppose that the following bounds hold, uniformly for every admissible finite form $Lambda_(cal(S))$ in 13, with the fixed packet constants there. The field $u : bb(R)^2 arrow.r bb(R)$ is bounded and measurable, the sets $F \, E subset bb(R)^2$ are measurable with positive finite measure, and the input and test satisfy $∥f \( z \)∥_(cal(H)) lt.eq upright(bold(1))_F \( z \)$, $∥g \( z \)∥_(cal(H)) lt.eq upright(bold(1))_E \( z \)$.]
  + #emph[For $m gt.eq 1$, there is a fixed exponent $C_1$ such that 
#[#set math.equation(numbering: n => "(1.38)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C \( 1 + log \( 2 m \) \)^(C_1) sqrt(\| F \| \| E \|) . $ <red:model-basic>]

]
  + #emph[For $L gt.eq L_0$, with $tau \, m \, W$ as in (1.17), assume in addition that $lr(||) u lt.eq 1$, $"Lip" \( u \) lt.eq C_(upright("Lip"))$, and $F \, E subset I times bb(R)$ for an interval $I$ with $lr(||) I lt.eq b_0$. Whenever $L \/ 2 lt.eq log sqrt(\| E \| \/ \| F \|) lt.eq 2 L$, 
#[#set math.equation(numbering: n => "(1.39)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C L^(- 20) sqrt(\| F \| \| E \|) . $ <red:model-improved>]

]
  + #emph[For $m = 1$, one scalar component, and $\| E \| lt.eq \| F \|$, there is a fixed $c > 0$ such that 
#[#set math.equation(numbering: n => "(1.40)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C sqrt(\| F \| \| E \|) \( \| E \| \/ \| F \| \)^c . $ <red:model-reverse>]

]
  #emph[Then 4 holds. The constants remain uniform in $w$, $epsilon.alt$, and the number of retained scales.]
] <red:model-suffices>

#proof[
  We apply the assumed bounds to the local field and sets of 4, for which $lr(||) u lt.eq 1$, $"Lip" \( u \) lt.eq C_(upright("Lip"))$, and $F \, E subset I times bb(R)$ with $lr(||) I lt.eq b_0$. Suppose first that $L = log sqrt(\| E \| \/ \| F \|) gt.eq L_0$. The time and scale reductions give exponentially small normalized errors by (1.19). The bin error is smaller than any fixed power of $L^(- 1)$, by (1.26). It remains to estimate the diagonal form in (1.24).
  Apply the amplitude decompositions from 12 to $F^0 \, G^0$. The projections defining these vectors preserve horizontal support. After omitting levels of measure zero, their level sets have positive finite measure by (1.27) and lie in $I times bb(R)$; the normalized slices satisfy the stated indicator bounds. First use finite decompositions. Each pair of slices has a packet representation by 14; its cutoff is $tilde(Q)_j$, so the slice itself need not have narrow spectrum. Summing the common series coefficients and averaging the translations preserve each assumed model bound. Pairs for which both measures are retained satisfy (1.29); apply (1.39) to them. Their total contribution, divided by $sqrt(\| F \| \| E \|)$, is at most
  $ C L^(- 20) \( 1 + L \) lt.eq C L^(- 19) . $
  If either measure is discarded, use (1.38). The sum of those normalized weights is at most $C sqrt(1 + L) thin e^(- c L) + C e^(- 2 c L)$; the factor $\( 1 + log \( 2 m \) \)^(C_1)$ is a fixed power of $L$. These terms are therefore exponentially small. The estimates are uniform for the finite amplitude sums. Their tails converge absolutely by the same bounds, so they apply to the full diagonal form. All errors and the main term are bounded by $C \( 1 + L \)^(- 3) sqrt(\| F \| \| E \|)$, as required.
  If $L$ ranges over a fixed bounded interval, use $m = 1$. No bin projections or their amplitude losses are needed. The time and scale errors have bounded operator norms, and (1.38), with the scalar packet representation, bounds the remaining form. The factor $\( 1 + \| log \( \| F \| \/ \| E \| \) \| \)^(- 3)$ is bounded below by a positive absolute constant on this interval.
  Finally suppose that $L$ is large and negative. Again use $m = 1$, retain the original scalar input and test, and apply (1.40). It gives a positive power of $\| E \| \/ \| F \|$. The errors give the power $\( \| E \| \/ \| F \| \)^(1 \/ 4)$ by the fixed choice $p = 4$ in (1.19). Every fixed positive power of this ratio is bounded by a constant times $\( 1 + \| log \( \| F \| \/ \| E \| \) \| \)^(- 3)$. This proves the remaining case.
  All arguments include an arbitrary positive inner cutoff. If $epsilon.alt > w$, the lower retained scale is raised to a dyadic scale comparable to $epsilon.alt$, which simply selects a finite subcollection of the allowed scales. If it exceeds $tau$, the middle form is empty and the error estimates suffice. If $w gt.eq tau$, the short-time and horizontal bounds already cover the whole remaining integral. None of the bounds used here depends on how many scales lie between the endpoints. ◻
]

The basic and reverse-disparity assertions of 15 will follow from the ordinary tile estimates, in particular 16. The remaining large-positive-disparity assertion is the improvement proved by the popular-forest argument and assembled in 51. Thus the conditional use of 4 in 9 is separate from, and subsequent to, the proof of its model hypotheses.

== 2 Ordinary tiles and the popular forest <tile:section>

The purpose of this section is to separate the part of the packet form controlled by ordinary size and density estimates from the part requiring phase averaging. The size–density–tree decomposition follows the time-frequency framework of Lacey and Thiele for the Carleson operator #cite(label("LaceyThiele2000")) and its planar directional adaptation by Lacey and Li #cite(label("LLAnnular")) #cite(label("LLStein")). We prove the estimates in the present normalization, including arbitrary subcollections and the Hilbert-valued summation needed for narrow vertical bins.

For the ordinary estimates, write the packet form (1.33) as $Lambda_(cal(S)) \( f \, g \)$, where $cal(S)$ is a finite collection from one of the forms constructed in the preceding section. The constants in these estimates depend on fixed packet adaptation, separation, and multiplicity constants only. In particular, they do not depend on the number of tiles or lengths, on $w$, or on $m = W \/ w gt.eq 1$. These ordinary estimates hold for every measurable real-valued slope function $u$.

=== 2.1 Density and the model estimates <density-and-the-model-estimates>

Fix one of the angular dyadic grids. Denote by $Omega \( t \, l \)$ the interval in this grid at the level corresponding to the dyadic length $l$ that contains $t$. The intervals are half open. Their length is a fixed constant times $w \/ l$; in particular, $Omega \( t \, ell_s \) = Omega_s$ whenever $t in Omega_s$.

For a box $R$ of length $l$, width $W$, slope $t$, and center $z_R = \( x_R \, y_R \)$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ B_R \( x \, y \) = (1 + frac(\| x - x_R \|, l) + frac(\| \( y - y_R \) - t \( x - x_R \) \|, W))^(- D_0) . $ <tile:eq-density-weight>]

Here $D_0$ is a sufficiently large fixed integer, chosen once below. For a measurable set $E$ of finite measure define

#[#set math.equation(numbering: n => "(2.2)")
 $ D_E \( s \) = sup_(ell_s lt.eq l lt.eq tau \, med l med upright("dyadic")\
t in Omega_s \, med z_s in R) frac(1, \| R \|) integral_(E ∩ { u in Omega \( t \, l \) }) B_R \( z \) thin thin upright(d) z . $ <tile:eq-density>]

The boxes in this supremum have the dimensions and slope used in (2.1). Since $integral B_R lt.eq C \| R \|$, all densities are bounded by a fixed constant. Density is monotone in $E$; passing to a subcollection of tiles does not change the density of any remaining tile.

#thm([Proposition 2.1.])[
  (Ordinary model estimates).  #emph[Let the bin Hilbert space be $cal(H) = bb(C)^J$, where $J lt.eq C_(upright("bin")) m$. If $∥g \( z \)∥_(cal(H)) lt.eq upright(bold(1))_E \( z \)$ and $D_E \( s \) lt.eq gamma$ for every $s in cal(S)$, with $0 < gamma lt.eq C$, then 
#[#set math.equation(numbering: n => "(2.3)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C \( 1 + log \( 2 m \) \)^C gamma^(1 \/ 4) \| E \|^(1 \/ 2) ∥f∥_(L^2 \( cal(H) \)) . $ <eq:src-4>]

 In the scalar case, if $\| f \| lt.eq upright(bold(1))_F$, $\| g \| lt.eq upright(bold(1))_E$, and $0 < \| E \| < \| F \| < oo$, then 
#[#set math.equation(numbering: n => "(2.4)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C sqrt(\| F \| \| E \|) (frac(\| E \|, \| F \|))^(9 \/ 20) . $ <tile:eq-reverse-disparity>]

 Both conclusions hold uniformly for every subcollection of $cal(S)$.]
] <tile:prop-model>

We first prove the scalar estimates, suppressing the bin index $j$; size and density selection and the tree bound provide the scalar model bounds. The final component summation gives the stated logarithmic vector loss in $m$.

=== 2.2 Maximal functions and separated synthesis <maximal-functions-and-separated-synthesis>

For a slope $t$, let $cal(M)_t$ be the uncentered strong maximal operator in the coordinates $\( x \, y - t x \)$. We shall use

#[#set math.equation(numbering: n => "(2.5)")
 $ ∥cal(M)_t h∥_2 lt.eq C ∥h∥_2 \, $ <tile:eq-strong-maximal>]

with a constant independent of $t$. Here and below maximal operators act on the absolute value of their argument. To recall a proof, the one-dimensional uncentered maximal operator $M$ is of weak type $\( 1 \, 1 \)$: a finite interval covering of a compact subset of ${ M h > lambda }$ has a disjoint subfamily whose threefold enlargements cover that subset, giving measure at most $3 lambda^(- 1) ∥h∥_1$. Approximation gives the full inequality. Apply it to $h upright(bold(1))_({ \| h \| > lambda \/ 2 })$, since the complementary part has maximal function at most $lambda \/ 2$, and integrate the distribution estimate against $2 lambda thin thin upright(d) lambda$. Fubini’s theorem gives $∥M h∥_2^2 lt.eq C ∥h∥_2^2$. The strong maximal operator is bounded pointwise by the composition of the two one-dimensional maximal operators. Fubini and the determinant-one shear prove (2.5).

A consequence we use repeatedly is smooth reproduction on a box. Suppose a Schwartz function, after removal of a fixed carrier, has Fourier support

$ \| xi + t eta \| lt.eq A \/ r \, #h(2em) \| eta \| lt.eq A \/ W . $

A product of smooth low-pass cutoffs that equals one on this set reproduces the function. Its kernel is bounded, for any fixed $N$, by

$ frac(C_(A \, N), r W) (1 + frac(\| x \|, r))^(- N) (1 + frac(\| y - t x \|, W))^(- N) . $

Decomposing this majorant into dilated rectangles proves the following statement. If $Q$ is an $r times W$ box of slope $t$, and $F_alpha$ is any finite family with these common spectral bounds, then

#[#set math.equation(numbering: n => "(2.6)")
 $ sup_(z in Q) sup_alpha \| F_alpha \( z \) \| lt.eq C_A inf_(z in Q) cal(M)_t #scale(x: 120%, y: 120%)[\(] sup_alpha \| F_alpha \| #scale(x: 120%, y: 120%)[\)] \( z \) . $ <tile:eq-reproduction>]

Indeed, replacing the center of any kernel rectangle by any other point of $Q$ changes its required enlargement by only an absolute factor. A common carrier has modulus one and does not affect this argument.

A test tree has parameters $T = \( z_T \, t \, l \)$, where $l lt.eq tau$ is dyadic, and a box $R_T$ of length $l$, width $W$, and slope $t$. Its tiles satisfy

#[#set math.equation(numbering: n => "(2.7)")
 $ ell_s lt.eq l \, #h(2em) z_s in R_T \, #h(2em) t in Omega_s . $ <tile:eq-tree>]

An arbitrary subset satisfying these conditions is also a tree. Choose a fixed $c_1 > 0$ so that $c_(*) lt.double c_1 lt.double min \( c_b \, c_Omega \)$, where $c_b d_s$ is the lower distance of the selector support from $theta_s$. A tile is separated in this tree if $\| t - theta_s \| gt.eq c_1 d_s$.

For a positive integer $J_0$ define the top polynomial

#[#set math.equation(numbering: n => "(2.8)")
 $ frak(p)_(T \, J_0) \( z \) = (1 + frac(\( x - x_T \)^2, l^2) + frac(\( \( y - y_T \) - t \( x - x_T \) \)^2, W^2))^(J_0) . $ <tile:eq-top-polynomial>]

#thm([Lemma 2.2.])[
  (Separated synthesis).  #emph[Let $cal(T)$ be separated tiles satisfying (2.7), and let $Upsilon_s$ be either of their packet families $Phi_s$ or $Psi_s$. For every fixed $J_0$, 
#[#set math.equation(numbering: n => "(2.9)")
 $ ∥frak(p)_(T \, J_0) sum_(s in cal(T)) c_s Upsilon_s∥_2 & lt.eq C_(J_0) (sum_(s in cal(T)) \| c_s \|^2 \| R_s \|)^(1 \/ 2) \,\
∥frak(p)_(T \, J_0) sup_(a < b) lr(|sum_(s in cal(T)\
a < ell_s lt.eq b) c_s Upsilon_s|)∥_2 & lt.eq C_(J_0) (sum_(s in cal(T)) \| c_s \|^2 \| R_s \|)^(1 \/ 2) . $ <tile:eq-synthesis>]

 The same statements hold for Hilbert-valued sums $#scale(x: 120%, y: 120%)[\(] sum_s c_(s \, j) Upsilon_(s \, j) #scale(x: 120%, y: 120%)[\)]_j$, with $sum_s ∥c_s∥_(cal(H))^2 \| R_s \|$ on the right and constants independent of $J$. Bounded scalar factors depending on $s \, j$, such as $b_(s \, j) \( t \)$, can be incorporated into the coefficients.]
] <tile:lem-synthesis>

#proof[
  From the packet support and $t in Omega_s$,
  $ xi + t eta = \( xi + theta_s eta \) + \( t - theta_s \) eta \, #h(2em) a_0 / ell_s lt.eq \| xi + t eta \| lt.eq a_1 / ell_s \, $
  where $0 < a_0 < a_1 < oo$ are fixed. Positivity of $a_0$ uses $c_(*) lt.double c_1$ and the two fixed bounds on $w eta$. For envelopes, replacing slope $theta_s$ by $t$ changes the transverse coordinate over one tile length by at most $C d_s ell_s = C w lt.eq C W$. Thus every fixed Schwartz envelope remains a uniform envelope in the $t$-coordinates.
  At one length there are boundedly many labels, since all labels of the tree lie in an interval of length $O \( d_s \)$. Within each label the centers lie on a translated box lattice. The inner product of two normalized packets at this length is bounded by a fixed rapidly decreasing function of their normalized center separation. Its row and column sums are bounded. The elementary Schur inequality, obtained by applying $2 \| a_s a_q \| lt.eq \| a_s \|^2 + \| a_q \|^2$ to these row and column sums, proves the fixed-length synthesis bound.
  This argument also applies after multiplying packets by $frak(p)_(T \, J_0)$. Their centers belong to $R_T$, their lengths are at most $l$, and their widths are $W$. Consequently the polynomial can be absorbed into a fixed larger number of packet decay powers. Multiplication by a polynomial differentiates the Fourier transform and does not enlarge its support.
  Choose a fixed integer $q_0$ such that $2^(q_0) a_0 > 4 a_1$, and split dyadic lengths according to their exponents modulo $q_0$. Within each resulting list, the displayed annuli are disjoint and have gaps. Orthogonality in the first $t$-coordinate therefore proves (2.9), also for the polynomially weighted packets.
  On one such list, the sum over all lengths above a given endpoint is exactly a smooth low-pass convolution in that coordinate applied to the complete sum: choose the cutoff to equal one on the lower-frequency annuli retained at that endpoint and zero on all higher-frequency annuli. The gap permits dilates of one fixed smooth cutoff. Their absolute kernels are dominated by the one-dimensional maximal operator. An interval of lengths is a difference of two endpoint sums. Apply this observation to the full weighted sum, use its just-proved $L^2$ bound, and sum over the fixed number of lists. This gives (2.9).
  For Hilbert-valued sums, the fixed-length and orthogonality bounds follow by summing the scalar squared bounds over components. The same low-pass convolution acts on every component, since $a_0 \, a_1$ are common. Its norm is pointwise bounded by the positive kernel acting on the Hilbert norm of the full sum. The maximal-function proof is therefore dimension free. Alternatively one can sum the squared scalar maximal estimates. ◻
]

For scalar coefficients $v_s = chevron.l f \, Phi_s chevron.r \/ \| R_s \|$, define their size on a collection by

#[#set math.equation(numbering: n => "(2.10)")
 $ "size" \( v \) = sup_T (frac(1, \| R_T \|) sum_(s in T\
\| t - theta_s \| gt.eq c_1 d_s) \| v_s \|^2 \| R_s \|)^(1 \/ 2) . $ <tile:eq-size>]

A one-tile test gives $\| v_s \| lt.eq C "size" \( v \)$. If $Phi_s = 0$, then $v_s = 0$. Otherwise choose $\( xi \, eta \) in "supp" hat(Phi)_s$ and put $q = - xi \/ eta$. The angular margin and $c_1 lt.double c_Omega$ place both $q - 2 c_1 d_s$ and $q + 2 c_1 d_s$ in $Omega_s$. At least one is at distance at least $2 c_1 d_s$ from $theta_s$; use it as the direction of a top centered at $z_s$ with length $ell_s$. This is a separated one-tile test of area $\| R_s \|$, which proves the bound. Moreover

#[#set math.equation(numbering: n => "(2.11)")
 $ "size" \( v \) lt.eq C ∥f∥_oo . $ <tile:eq-bounded-size>]

To prove this, for the separated portion of a fixed tree put $B_T = sum_s \| v_s \|^2 \| R_s \|$ and $A_T = sum_s v_s Phi_s$. The pairing is linear in its first argument, so $B_T = chevron.l f \, A_T chevron.r$. By 17 and Cauchy–Schwarz with $frak(p)_(T \, 1)^(- 1)$,

$ B_T lt.eq ∥f∥_oo ∥A_T∥_1 lt.eq C ∥f∥_oo \| R_T \|^(1 \/ 2) B_T^(1 \/ 2) . $

Division, with the zero case understood, proves (2.11).

=== 2.3 Removing large size <removing-large-size>

#thm([Lemma 2.3.])[
  (Size selection).  #emph[Suppose $"size" \( v \) lt.eq C_(*) sigma$, with $C_(*)$ fixed. One can remove a collection of trees so that the remaining size is at most $sigma$ and 
#[#set math.equation(numbering: n => "(2.12)")
 $ sum_T \| R_T \| lt.eq C sigma^(- 2) ∥f∥_2^2 . $ <tile:eq-size-budget>]

 The removed tiles partition into ordinary trees satisfying (2.7); their total top area has the same bound.]
] <tile:lem-size>

#proof[
  First consider positive separated tests, with $t - theta_s gt.eq c_1 d_s$. While a test has energy larger than $sigma^2 \| R_T \| \/ 2$, choose one whose direction is within $epsilon$ of the infimum of the directions of all such tests. Here $epsilon > 0$ is a sufficiently small fixed multiple of $min_(s in cal(S)) d_s$. Delete all remaining tiles with $ell_s lt.eq l_T$, $t_T in Omega_s$, and $z_s in A_0 R_T$, including nonseparated tiles. The fixed absolute dilation $A_0$ is chosen below. Record the positive separated test tiles present at selection as $cal(Q)_T$. The procedure terminates because every selection deletes at least one tile. Thereafter perform the negative separated selection, using directions within $epsilon$ of the supremum and reversing the order. At the end, each signed energy is at most $sigma^2 \| R_T \| \/ 2$; hence the size is at most $sigma$.
  We prove the area bound for the positive selection. The $cal(Q)_T$ are disjoint and
  #[#set math.equation(numbering: n => "(2.13)")
   $ B := sum_T sum_(s in cal(Q)_T) \| v_s \|^2 \| R_s \| asymp sigma^2 sum_T \| R_T \| . $ <tile:eq-selected-energy>]
  The lower comparison is the selection threshold and the upper one follows from the initial size bound, which persists on every remaining subcollection. We claim
  #[#set math.equation(numbering: n => "(2.14)")
   $ ∥sum_T sum_(s in cal(Q)_T) v_s Phi_s∥_2^2 lt.eq C B . $ <tile:eq-selected-bessel>]
  Expand the squared norm. Pairs with lengths in a fixed ratio have total contribution $O \( B \)$. Indeed, spectral overlap forces their labels to lie within $O \( d_s \)$, so there are boundedly many neighboring labels. Their box shapes are comparable because the transverse discrepancy over either length is $O \( w \) lt.eq O \( W \)$. Packet decay and the spatial lattices then give the bounded row and column sums for the normalized Gram matrix, exactly as in the fixed-length proof above.
  For the other pairs fix the top $T$ of the longer member $q in cal(Q)_T$, and write $t = t_T$. Let $cal(A)_T$ consist of the selected tiles $s$ for which $ell_q > C_0 ell_s$ and $chevron.l Phi_s \, Phi_q chevron.r eq.not 0$ for at least one such $q$. Choose the fixed $C_0$ sufficiently large. Spectral overlap and the common vertical frequency range give
  $ \| theta_s - theta_q \| lt.eq C c_(*) \( d_s + d_q \) \, #h(2em) \| theta_q - t \| lt.eq C_Omega d_q . $
  Thus, by the choices of $c_(*)$ and $C_0$,
  #[#set math.equation(numbering: n => "(2.15)")
   $ \| theta_s - t \| lt.eq 1 / 4 c_1 d_s \, #h(2em) t in Omega_s . $ <tile:eq-short-direction>]
  The second assertion uses the fixed margin about the wave slope support inside $Omega_s$.
  We next verify a bounded overlap fact for the boxes of $cal(A)_T$ in the coordinates of slope $t$. These boxes can all be replaced by fixed comparable $ell_s times W$ boxes in those coordinates. Suppose two of the latter overlap, with $ell_s$ much smaller than $ell_(s')$. Let $t_s \, t_(s')$ be the directions of their respective selecting tests. Because $s$ was in a positive separated test,
  $ t_s gt.eq theta_s + c_1 d_s > t + 1 / 2 c_1 d_s \, #h(2em) \| t_(s') - t \| lt.eq C d_(s') . $
  After separating the lengths by another fixed factor, $t_(s') < t + 1 / 4 c_1 d_s$. If the test selecting $s'$ had not yet been selected when $s$ was selected, all its eventual test tiles would still have been present at that time. It would therefore already have been failing, since deleting tiles only decreases each fixed test energy. The near-infimum rule, with $epsilon lt.double c_1 min d_s$, therefore forces the test of $s'$ to have been selected first.
  Its length is at least $ell_(s')$. Overlap of the comparable $t$-boxes bounds the horizontal center separation by $C ell_(s')$. In the coordinates of $t_(s')$, the transverse center separation is $O \( W + w \) = O \( W \)$: use $\| t_(s') - t \| ell_(s') = O \( w \)$, or equivalently compare each original tile over its own length. Also $t_(s') in Omega_s$, by the margin in (2.15). For an absolute $A_0$ this places $s$ in the enlarged deletion tree of $s'$, a contradiction. At comparable lengths, bounded label and lattice multiplicity give bounded overlap directly. Splitting lengths into a fixed number of lists proves the asserted overlap bound for all of $cal(A)_T$. The same reasoning applies to any fixed enlargement of these boxes by increasing $A_0$ once.
  Let $B_s^(*)$ be sufficiently rapidly decreasing uniform tile envelopes in the $t$-coordinates, and put $D_T = frak(p)_(T \, J_0)^(- 1)$, with $J_0$ a fixed large integer. Then
  #[#set math.equation(numbering: n => "(2.16)")
   $ ∥D_T sum_(s in cal(A)_T) B_s^(*)∥_2 lt.eq C \| R_T \|^(1 \/ 2) . $ <tile:eq-short-envelopes>]
  Here centers of $cal(A)_T$ need not belong to $R_T$. To prove the estimate, test against $∥h∥_2 lt.eq 1$. Since $ell_s lt.eq l_T$, the top weight can be passed across a tile envelope by spending fixed decay powers. Decomposition into dilated tile boxes, followed by the overlap just proved, gives
  $ sum_s integral \| h \| D_T B_s^(*) & lt.eq C sum_s \| R_s \| inf_(R_s^t) D_T inf_(R_s^t) cal(M)_t h\
 & lt.eq C integral D_T cal(M)_t h lt.eq C ∥D_T∥_2 ∥h∥_2 lt.eq C \| R_T \|^(1 \/ 2) . $
  The notation $R_s^t$ denotes the fixed comparable $t$-box; changing it by an absolute dilation is harmless. This proves (2.16).
  For each $s in cal(A)_T$, the sum of its cross terms with $cal(Q)_T$ can include all $q in cal(Q)_T$ with $ell_q > C_0 ell_s$, since the added inner products are zero. Therefore its absolute value is bounded using
  $ U_T \( z \) = sup_(r > 0) lr(|sum_(q in cal(Q)_T\
ell_q > r) v_q Phi_q \( z \)|) . $
  The coefficient bound $\| v_s \| lt.eq C sigma$, (2.16), and 17 show that all such cross terms for this top have sum at most
  $ C sigma integral (sum_(s in cal(A)_T) B_s^(*)) U_T lt.eq C sigma \| R_T \|^(1 \/ 2) ∥D_T^(- 1) U_T∥_2 lt.eq C sigma^2 \| R_T \| . $
  Summing and using (2.13) proves (2.14). Pairing its synthesis with $f$ gives $B lt.eq ∥f∥_2 \( C B \)^(1 \/ 2)$, hence $B lt.eq C ∥f∥_2^2$. The negative selection has the identical proof with order reversed.
  Finally, partition each enlarged deletion box $A_0 R_T$ into a fixed number of translated ordinary top boxes of length $l_T$ and width $W$, assigning tiles by their centers. Their direction and length conditions are unchanged, and their total area is $O \( \| R_T \| \)$. This proves the last assertion and (2.12). ◻
]

=== 2.4 Removing large density <removing-large-density>

#thm([Lemma 2.4.])[
  (Density selection).  #emph[For $0 < eta lt.eq C$, all tiles with $D_E \( s \) > eta$ can be assigned to keeper boxes $R_T$, of dyadic length $l_T lt.eq tau$, width $W$, and slope $t_T$, with the following properties. There are pairwise disjoint measurable sets $E_T$ such that 
#[#set math.equation(numbering: n => "(2.17)")
 $ E_T subset E ∩ K_eta R_T ∩ { u in Omega \( t_T \, l_T \) } \, #h(2em) \| E_T \| gt.eq c eta \| R_T \| \,\
sum_T \| R_T \| lt.eq C eta^(- 1) \| E \| \, #h(2em) K_eta lt.eq C \( 1 + eta^(- 1 \/ 100) \) \,\
ell_s lt.eq l_T \, #h(2em) t_T in Omega_s \, #h(2em) z_s in C K_eta R_T quad upright("for each tile assigned to ") T . $ <tile:eq-density-witnesses>]

 After partitioning by centers, the assigned tiles form ordinary test trees of total top area at most 
#[#set math.equation(numbering: n => "(2.18)")
 $ C eta^(- 1) \( 1 + eta^(- 1 \/ 20) \) \| E \| . $ <tile:eq-density-budget>]

]
] <tile:lem-density>

#proof[
  For each tile to be removed select one box in (2.2) witnessing an average greater than $eta$. Since
  $ integral_(bb(R)^2 \\ K R) B_R lt.eq C K^(2 - D_0) \| R \| \, $
  choosing the fixed $D_0$ sufficiently large and then $K = K_eta lt.eq C \( 1 + eta^(- 1 \/ 100) \)$ retains at least $eta \| R \| \/ 2$ of the weighted test inside $K R$. Its unweighted tested set has measure at least $eta \| R \| \/ 2$, because $B_R lt.eq 1$.
  Process these finitely many witnesses in decreasing length order. Keep a witness unless both its $K$-dilated spatial box and its dyadic direction interval intersect the corresponding objects of an earlier keeper. Assign it to any such keeper when it is rejected. The tested sets of the keepers are disjoint: a common tested point would force both intersections and preclude keeping the later one. This proves (2.17) and (2.17).
  Let a rejected witness have length $l'$, direction $t'$, and original associated tile $s$, and let its keeper have length $l_T gt.eq l'$ and direction $t_T$. Dyadic nesting gives
  $ Omega \( t_T \, l_T \) subset Omega \( t' \, l' \) subset Omega_s \, #h(2em) \| t_T - t' \| lt.eq C w \/ l' . $
  Choose a point common to the two dilated spatial boxes. Moving from it to the rejected box center, or to $z_s$, costs horizontally $O \( K l' \)$ and transversely in the $t_T$-coordinates $O \( K W + K l' \| t_T - t' \| \) = O \( K W \)$. This proves (2.17). A keeper’s own associated tiles satisfy the same conclusion.
  Partition $C K R_T$ into $O \( K^2 \)$ translated boxes of length $l_T$, width $W$, and slope $t_T$, assigning tiles by their centers. The length and angular requirements for a test tree persist. Their total area is at most $C \( 1 + eta^(- 1 \/ 50) \) eta^(- 1) \| E \|$, which is bounded by (2.18) after changing the absolute constant. ◻
]

=== 2.5 The tree estimate <the-tree-estimate>

#thm([Lemma 2.5.])[
  (Tree bound).  #emph[Suppose a scalar tree $cal(T)$ satisfies $D_E \( s \) lt.eq eta$ on its tiles and has size at most $sigma$. If $\| g \| lt.eq upright(bold(1))_E$, then 
#[#set math.equation(numbering: n => "(2.19)")
 $ \| Lambda_(cal(T)) \( f \, g \) \| lt.eq C sigma eta \| R_T \| . $ <tile:eq-tree-bound>]

 The size assumption can be replaced by the same bound on any encompassing collection.]
] <tile:lem-tree>

#proof[
  The assertion is immediate for an empty tree, so assume the tree is nonempty. Work in centered coordinates $\( x \, y - t x \)$ of the top, so its coordinate extents are $l times W$. For clarity write the transverse coordinate as $y'$, with top center $\( 0 \, 0 \)$. All tile centers satisfy $\| x_s \| lt.eq l \/ 2$ and $\| y'_s \| lt.eq W \/ 2$. The packet envelopes are uniform in these coordinates.
  Partition the horizontal line into maximal dyadic intervals $I$ for which there is no tile with $x_s in 3 I$ and $ell_s lt.eq \| I \|$. The tiles are finite and have positive minimum length, so these intervals cover the line up to endpoints and are pairwise disjoint. Each parent fails the condition, furnishing a tile $q_I$ with
  #[#set math.equation(numbering: n => "(2.20)")
   $ ell_(q_I) lt.eq 2 \| I \| \, #h(2em) "dist" \( x_(q_I) \, I \) lt.eq C \| I \| . $ <tile:eq-whitney-witness>]
  Fix a sufficiently large absolute dyadic constant $C_(upright(W))$. We treat lengths $ell_s lt.eq C_(upright(W)) \| I \|$ and longer lengths separately on the strip above $I$.
  For a short tile, density tested at its own box and wave decay give, for every fixed large $N_0$,
  #[#set math.equation(numbering: n => "(2.21)")
   $ integral_(E ∩ { x in I }) \| v_s b_s \( u \) Psi_s \| lt.eq C sigma eta \| R_s \| (1 + frac("dist" \( x_s \, I \), ell_s))^(- N_0) . $ <tile:eq-short-tree-term>]
  Indeed the selector support lies in $Omega_s$, the density definition includes $R_s$ with direction $theta_s$, and a fixed number of additional wave-decay powers extracts the last factor while retaining the density weight.
  Here is an explicit summation of (2.21). At a fixed length there are $O \( 1 \)$ labels, and each horizontal column contains $O \( 1 \)$ centers within the transverse top strip. If $ell_s lt.eq r := \| I \|$, the defining property of $I$ gives $"dist" \( x_s \, I \) gt.eq r$. Summing over the one-dimensional center lattice then bounds its contribution, divided by $C sigma eta W$, by $C r \( ell_s \/ r \)^(N_0 - 1)$. For $r < ell_s lt.eq C_(upright(W)) r$, the same lattice sum is $O \( r \)$ after multiplication by $ell_s$, and there are only a fixed number of such lengths. Thus the total is $O \( sigma eta W r \)$. All intervals with $r lt.eq l$ lie within a fixed enlargement of the top’s horizontal interval, by (2.20); their disjoint lengths sum to $O \( l \)$. If $r > l$, all tile lengths are at most $l$, all centers are at distance at least $r$ from $I$, and their restriction $\| x_s \| lt.eq l \/ 2$ improves the preceding sum to $C sigma eta W l \( l \/ r \)^(N_0 - 1)$. For each such dyadic $r$, only $O \( 1 \)$ intervals can occur, again by the parent witness. Summing proves a total short-tile contribution $C sigma eta l W$.
  Now let $I$ admit longer tiles. Choose a dyadic $l' asymp \| I \|$, greater than $ell_(q_I)$ and small enough that $l' < ell_s$ for every longer tile. Increasing $C_(upright(W))$ once ensures this. It also ensures $l' lt.eq tau$. By (2.20), a box of slope $t$, length $l'$, and width $W$ can contain $z_(q_I)$ and the portion $I times \[ - W \/ 2 \, W \/ 2 \]$, with a fixed enlargement absorbed into the choice of $l'$. Dyadic nesting puts every longer selector support inside $Omega \( t \, l' \)$. Consequently the original longer-tile sum vanishes outside $A_I = { u in Omega \( t \, l' \) }$. We perform all following freezing and error decompositions after multiplying that sum by $upright(bold(1))_(A_I)$, and retain this indicator on both the main term and the error. Individually the frozen terms need not vanish outside $A_I$. For the cells
  $ Q_(I \, k) = I times \[ \( k - 1 / 2 \) W \, \( k + 1 / 2 \) W \] \, #h(2em) k in bb(Z) \, $
  the density test at $q_I$ therefore yields
  #[#set math.equation(numbering: n => "(2.22)")
   $ mu_(I \, k) := \| Q_(I \, k) ∩ E ∩ { u in Omega \( t \, l' \) } \| lt.eq C eta \( 1 + \| k \| \)^(D_1) \| I \| W \, $ <tile:eq-cell-density>]
  where the fixed $D_1$ can be taken to be $D_0$. The density weight on the cell is bounded below by a constant times $\( 1 + \| k \| \)^(- D_0)$.
  Put $a = \| u - t \|$ at the point of evaluation. For nonseparated tiles, selector support implies $a asymp d_s$, so only a fixed number of dyadic lengths occur. Their pointwise sum is bounded by $C sigma \( 1 + \| k \| \)^(- N_1)$ on $Q_(I \, k)$, for any fixed $N_1$. For separated tiles replace $b_s \( u \)$ by $upright(bold(1))_({ d_s gt.eq a }) b_s \( t \)$. If $d_s gt.eq a$, the error is at most $C a \/ d_s$, using the derivative bound on $b_s$. If $d_s < a$, the actual selector vanishes unless $d_s gt.eq a \/ C$, since $\| t - theta_s \| lt.eq C_Omega d_s$. There are only a fixed number of these remaining scales. Summing the geometric series in $a \/ d_s$, and using lattice overlap at each scale, bounds the entire error by $C sigma \( 1 + \| k \| \)^(- N_1)$. This argument also covers $a = 0$, when the separated error is zero.
  The resulting main sum, at each point, is an interval sum of the separated packets with coefficients $v_s b_s \( t \)$: its lengths obey $C_(upright(W)) \| I \| < ell_s lt.eq w \/ a$. Let $M_(I \, k)$ be the supremum on $Q_(I \, k)$ of the absolute values of all such interval sums with arbitrary upper endpoint. We claim that, for every fixed sufficiently large $N_2$,
  #[#set math.equation(numbering: n => "(2.23)")
   $ sum_(I \, k) M_(I \, k)^2 \( 1 + \| k \| \)^(N_2) \| I \| W lt.eq C sigma^2 \| R_T \| \, $ <tile:eq-cell-suprema>]
  where only the $I$ admitting longer tiles occur. To see this, let $U$ be the maximal interval sum over all separated lengths of the tree. For each fixed $I$, every interval sum under consideration has horizontal $t$-frequency at most $C \/ \| I \|$ and vertical frequency, after the common carrier is removed, at most $C \/ W$. The same is true after multiplication by any top polynomial. Apply (2.6) to the weighted sums and dominate their absolute values by $frak(p)_(T \, J_0) U$. Since the cells are disjoint, the squared cell suprema are bounded in sum by $C ∥cal(M)_t \( frak(p)_(T \, J_0) U \)∥_2^2$. For all the present cells $\| x \| lt.eq C l$, and $frak(p)_(T \, J_0) asymp \( 1 + \| k \| \)^(2 J_0)$ there. Taking $4 J_0 gt.eq N_2$, (2.5) and 17 prove (2.23).
  The intervals admitting longer tiles have total length $O \( l \)$, by their parent witnesses and $\| I \| < l \/ C_(upright(W))$. Choose $N_2 > 2 D_1 + 2$. Factoring the full density bound before Cauchy–Schwarz,
  $ sum_(I \, k) M_(I \, k) mu_(I \, k) & lt.eq C eta (sum_(I \, k) M_(I \, k)^2 \( 1 + \| k \| \)^(N_2) \| I \| W)^(1 \/ 2)\
 & #h(1.2cm)  dot.op (sum_(I \, k) \( 1 + \| k \| \)^(2 D_1 - N_2) \| I \| W)^(1 \/ 2) lt.eq C sigma eta \| R_T \| . $
  The previously bounded pointwise errors have the same total bound by (2.22), taking $N_1 > D_1 + 2$. Adding the short contribution proves (2.19). ◻
]

=== 2.6 Proof of the model estimates <proof-of-the-model-estimates>

#proof[
  We first prove the scalar part of (2.3). If $∥f∥_2 = 0$ or $\| E \| = 0$, the form is zero; assume otherwise. Process thresholds $eta = 2^(- n)$ in decreasing order, starting high enough that no density or size condition fails. At each step first remove densities exceeding $eta$ by 19, then lower size to
  $ sigma_eta = sqrt(eta) thin ∥f∥_2 \/ \| E \|^(1 \/ 2) $
  by 18. At the start of the step, the remaining collection has density at most $2 eta$, as well as the original bound $gamma$, and size at most $sqrt(2) sigma_eta$. These bounds persist under all removals within the step.
  The density removals have total ordinary top area at most $C \( 1 + eta^(- 1 \/ 20) \) eta^(- 1) \| E \|$, and the size removals at most $C sigma_eta^(- 2) ∥f∥_2^2 = C eta^(- 1) \| E \|$. Applying 20 to every resulting ordinary tree and summing bounds the form by
  #[#set math.equation(numbering: n => "(2.24)")
   $ C ∥f∥_2 \| E \|^(1 \/ 2) sum_(eta med upright("dyadic")) min \( gamma \, 2 eta \) sqrt(eta) thin \( 1 + eta^(- 1 \/ 20) \) eta^(- 1) . $ <tile:eq-threshold-sum>]
  There is no limiting remainder to estimate for a finite collection. Every positive-density tile is eventually removed. If $D_E \( s \) = 0$, testing at $R_s$ shows that $b_s \( u \) g = 0$ almost everywhere, since the weight is strictly positive; such a term is zero. Zero-size terms are zero as well.
  For $0 < gamma lt.eq 1$, the terms with $eta lt.eq gamma$ sum to $C gamma^(9 \/ 20)$, and the terms with $eta gt.eq gamma$ do also: the relevant powers are $eta^(1 \/ 2) \, eta^(9 \/ 20)$ below the crossover and $gamma eta^(- 1 \/ 2) \, gamma eta^(- 11 \/ 20)$ above it. For bounded larger $gamma$ the sum is uniformly bounded. This proves the asserted scalar $gamma^(1 \/ 4)$ estimate, with room in its exponent.
  For (2.4), put $r = \| E \| \/ \| F \| < 1$. In addition to the threshold size estimate, every tree has size at most a fixed constant by (2.11). Its actual size at step $eta$ is therefore at most $C min \( 1 \, sqrt(eta \/ r) \)$. No change in the removal algorithm is necessary. With the universal density bound, the sum of the tree contributions at that step is at most
  $ C \| E \| min \( 1 \, sqrt(eta \/ r) \) min \( 1 \, eta \) eta^(- 1) \( 1 + eta^(- 1 \/ 20) \) . $
  For $r lt.eq eta lt.eq 1$, this sums to $C \| E \| r^(- 1 \/ 20)$; the scales $eta > 1$ cost $C \| E \|$. For $eta lt.eq r$, the sum is at most
  $ C \| E \| r^(- 1 \/ 2) sum_(eta lt.eq r) \( eta^(1 \/ 2) + eta^(9 \/ 20) \) lt.eq C \| E \| r^(- 1 \/ 20) = C sqrt(\| F \| \| E \|) thin r^(9 \/ 20) . $
  This proves the reverse-disparity claim, including the density-area inflation from the selection.
  Finally consider $cal(H) = bb(C)^J$. For a scalar measurable $h$ supported in $E$, write
  $ ∥h∥_(2 \, 1)^(\#) = integral_0^oo \| { \| h \| > a } \|^(1 \/ 2) thin thin upright(d) a . $
  Layer-cake decomposition, retaining the complex phase of $h$, extends the scalar estimate to
  $ \| Lambda_j \( f_j \, g_j \) \| lt.eq C gamma^(1 \/ 4) ∥f_j∥_2 ∥g_j∥_(2 \, 1)^(\#) . $
  Every sliced support lies in $E$, so its density still has upper bound $gamma$. As $\| g_j \| lt.eq 1$, split the last integral at $a_0 = \( 2 + m \)^(- 2)$. The portion below $a_0$ is at most $a_0 \| E \|^(1 \/ 2)$; for the rest, Cauchy–Schwarz gives
  $ integral_(a_0)^1 \| { \| g_j \| > a } \|^(1 \/ 2) thin thin upright(d) a lt.eq (integral_(a_0)^1 a \| { \| g_j \| > a } \| thin thin upright(d) a)^(1 \/ 2) (integral_(a_0)^1 frac(thin upright(d) a, a))^(1 \/ 2) lt.eq C sqrt(1 + log \( 2 m \)) ∥g_j∥_2 . $
  Since $J lt.eq C_(upright("bin")) m$ and $sum_j ∥g_j∥_2^2 lt.eq \| E \|$,
  $ sum_j \( ∥g_j∥_(2 \, 1)^(\#) \)^2 lt.eq C \( 1 + log \( 2 m \) \) \| E \| . $
  Cauchy–Schwarz in $j$ proves (2.3), even with a square root of this logarithmic factor. All arguments used only the stated packet hypotheses, which persist on every subcollection. Every choice of decay or derivative order above is fixed before the parameters and the finite tile collection are chosen. This completes the proof of 16. ◻
]

For later parameter choices we record a fixed numerical loss available from this proof. In the regime $m asymp exp \( L^0.9 \)$, with $L$ sufficiently large, the last vector estimate implies

#[#set math.equation(numbering: n => "(2.25)")
 $ \| Lambda_(cal(S)) \( f \, g \) \| lt.eq C L^(b_4) gamma^(c_4) \| E \|^(1 \/ 2) ∥f∥_(L^2 \( cal(H) \)) \, #h(2em) b_4 = 1 \, quad c_4 = 1 / 4 . $ <tile:eq-improvement-loss>]

These exponents are fixed independently of all subsequent density, forest, and mask choices.

=== 2.7 The improvement problem and popular tops <forest:section>

We now turn to the improvement estimate (1.39) in the local Lipschitz setting: $\| u \| lt.eq 1$, $"Lip" \( u \) lt.eq C_(upright("Lip"))$, and the sets $F \, E$ have positive finite measure and lie in the horizontal testing strip $cal(D) = I times bb(R)$, where $\| I \| lt.eq b_0$. Write $cal(H)$ for the finite-dimensional Hilbert space of vertical bins; the input and test satisfy $∥f \( z \)∥_(cal(H)) lt.eq upright(bold(1))_F \( z \)$ and $∥g \( z \)∥_(cal(H)) lt.eq upright(bold(1))_E \( z \)$. We use the parameters in (1.17): $L$ is sufficiently large, $m asymp exp \( L^0.9 \)$, $W = m w$, and every tile length is at most the dyadic cutoff $tau lt.eq exp \( - L^0.97 \)$. All tile collections in this part are finite. Every estimate is independent of the number of tiles, tops, scales, and bins.

=== 2.8 The assignment to popular tops <the-assignment-to-popular-tops>

Using the fixed exponents $b_4 = 1$ and $c_4 = 1 \/ 4$ from (2.25), choose once an integer $C_2$ with $c_4 C_2 gt.eq b_4 + 42$. Remove tiles for which $D_E \( s \) lt.eq L^(- C_2)$. By 16, in the form (2.25), the absolute value of their contribution is at most

$ C L^(b_4 - c_4 C_2) ∥f∥_2 sqrt(\| E \|) lt.eq C L^(- 40) sqrt(\| F \| \| E \|) . $

The choice of $C_2$ depends only on the fixed ordinary loss and the fixed target exponent.

Apply 19 to the remaining tiles with threshold $eta = L^(- C_2)$, retaining its unsplit keeper boxes. Denote the resulting finite collection of tops by $cal(T)$. A top $T$ has center $z_T = \( x_T \, y_T \)$, slope $s_T$, length $l_T lt.eq tau$, and box

$ R_T = {\( x \, y \) : \| x - x_T \| lt.eq l_T / 2 \, quad \| \( y - y_T \) - s_T \( x - x_T \) \| lt.eq W / 2} . $

We put $d_T = w \/ l_T$, and denote the top assigned to a tile $s$ by $T \( s \)$. Set $C_(upright("as")) = C_2 + 10$, increasing the absolute lower threshold for $L$ if necessary. This exponent absorbs the assignment dilation $C \( 1 + L^(C_2 \/ 100) \)$, the witness density $c L^(- C_2)$, and the area bound $C L^(C_2) \| E \|$. The density lemma gives

#[#set math.equation(numbering: n => "(2.26)")
 $ ell_s lt.eq l_(T \( s \)) \, #h(2em) s_(T \( s \)) in Omega_s \, #h(2em) \| theta_s - s_(T \( s \)) \| lt.eq C d_s \, #h(2em) z_s in L^(C_(upright("as"))) R_(T \( s \)) . $ <forest:eq-assignment>]

There are pairwise disjoint measurable sets $E_T$ such that

#[#set math.equation(numbering: n => "(2.27)")
 $ & E_T subset E ∩ L^(C_(upright("as"))) R_T \, #h(2em) \| E_T \| gt.eq L^(- C_(upright("as"))) \| R_T \| \,\
 & \| u \( z \) - s_T \| lt.eq C d_T quad \( z in E_T \) \, #h(2em) S := sum_(T in cal(T)) \| R_T \| lt.eq L^(C_(upright("as"))) \| E \| . $ <forest:eq-witnesses>]

These inequalities hold for every sufficiently large $L$, without additional constants in the displayed powers. The angular inclusion in (2.26) follows from the nesting of the keeper interval inside $Omega_s$. The direction bound on $E_T$ follows from the length of that keeper interval. The disjointness and lower measure bound also imply the stated estimate for $S$.

The horizontal centers of all tops lie in a fixed slight enlargement of $I$. Indeed, $E_T eq.not diameter$, and a point of $E_T$ has horizontal coordinate in $I$ and at distance at most $L^(C_(upright("as"))) l_T \/ 2$ from $x_T$. Since $L^(C_(upright("as"))) tau arrow.r 0$, this distance is smaller than any prescribed positive absolute constant for sufficiently large $L$.

=== 2.9 The adjoint sum and exceptional subsets <the-adjoint-sum-and-exceptional-subsets>

Only the retained tiles, with the assignment $T \( s \)$, are used henceforth. With pairings linear in the first entry, define

#[#set math.equation(numbering: n => "(2.28)")
 $ a_(s \, j) = \| R_s \|^(- 1) chevron.l g_j \, b_(s \, j) \( u \) Psi_(s \, j) chevron.r \, #h(2em) phi.alt_s = \( a_(s \, j) Phi_(s \, j) \)_j \, #h(2em) P = sum_s phi.alt_s . $ <forest:eq-adjoint>]

These conventions give precisely the form (1.33):

$ chevron.l f \, P chevron.r = sum_s \| R_s \|^(- 1) sum_j chevron.l f_j \, Phi_(s \, j) chevron.r chevron.l b_(s \, j) \( u \) Psi_(s \, j) \, g_j chevron.r . $

Indeed $chevron.l f_j \, a_(s \, j) Phi_(s \, j) chevron.r = overline(a_(s \, j)) chevron.l f_j \, Phi_(s \, j) chevron.r$. For fixed $g$ satisfying $∥g \( z \)∥_(cal(H)) lt.eq upright(bold(1))_E \( z \)$, the supremum of the absolute value of this pairing over $∥f \( z \)∥_(cal(H)) lt.eq upright(bold(1))_F \( z \)$ equals $integral_F ∥P \( z \)∥_(cal(H)) thin upright(d) z$. Equality follows by taking $f = P \/ ∥P∥_(cal(H))$ on $F ∩ { P eq.not 0 }$, and zero elsewhere.

Put $N = sqrt(\| E \| \/ \| F \|)$. The remaining objective, to be proved by the subsequent estimates, is

#[#set math.equation(numbering: n => "(2.29)")
 $ integral_F ∥P \( z \)∥_(cal(H)) thin upright(d) z lt.eq C L^(- 20) N \| F \| \, #h(2em) L / 2 lt.eq log N lt.eq 2 L . $ <eq:src-7>]

Applying (2.25) with its absolute density upper bound and arbitrary $L^2$ input, and then taking the Hilbert-space dual norm, gives the fixed exponent $C_P = b_4 = 1$ such that

#[#set math.equation(numbering: n => "(2.30)")
 $ ∥P∥_(L^2 \( bb(R)^2 \; cal(H) \)) lt.eq C L^(C_P) sqrt(\| E \|) . $ <forest:eq-adjoint-l2>]

Consequently, for every measurable $Z subset F$,

#[#set math.equation(numbering: n => "(2.31)")
 $ integral_Z ∥P \( z \)∥_(cal(H)) thin upright(d) z lt.eq C L^(C_P) (frac(\| Z \|, \| F \|))^(1 \/ 2) N \| F \| . $ <forest:eq-discard>]

For any prescribed fixed $Q_0 > 0$, an exceptional subset with $\| Z \| lt.eq L^(- 2 \( C_P + Q_0 + 1 \)) \| F \|$ therefore costs at most $C L^(- Q_0) N \| F \|$. This estimate is applied to the original sum $P$ before any masks or other modifications. It does not require an $L^2$ bound for those modified sums.

=== 2.10 A weak $L^2$ estimate for the top count <a-weak-l2-estimate-for-the-top-count>

For a top $T$, use normalized coordinates

#[#set math.equation(numbering: n => "(2.32)")
 $ X_T \( z \) = frac(x - x_T, l_T) \, #h(2em) Y_T \( z \) = frac(\( y - y_T \) - s_T \( x - x_T \), W) \, #h(2em) "dist"_T \( z \) = \| X_T \( z \) \| + \| Y_T \( z \) \| . $ <forest:eq-coordinates>]

Fix a sufficiently large absolute exponent $D_2 > 4$. For now let $K_0 gt.eq 1$ be any fixed power of $L$; the choice used with the masks is specified below. Set $C_3 = 2^(D_2)$ and

#[#set math.equation(numbering: n => "(2.33)")
 $ h_T \( z \) = C_3 (1 + frac("dist"_T \( z \), K_0))^(- D_2) \, #h(2em) n \( z \) = sum_(T in cal(T)) h_T \( z \) . $ <eq:src-5>]

In particular, $h_T gt.eq 1$ on ${ "dist"_T lt.eq K_0 }$. We use the convention

$ ∥a∥_(L^(2 \, oo) \( cal(D) \)) = sup_(lambda > 0) lambda \| { z in cal(D) : \| a \( z \) \| > lambda } \|^(1 \/ 2) . $

#thm([Proposition 2.6.])[
  #emph[For the tops in (2.27), 
#[#set math.equation(numbering: n => "(2.34)")
 $ ∥n∥_(L^(2 \, oo) \( cal(D) \)) lt.eq C L^C sqrt(S) . $ <eq:src-6>]

 More precisely, if 
$ D_(*) gt.eq max \( 2 K_0 \, thin 2 L^(C_(upright("as"))) \, thin 2 \) \, $

 then one may take the right-hand side to be $C L^(C_(upright("as"))) D_(*)^3 sqrt(S)$, provided $D_(*)$ is chosen within an absolute factor of the displayed maximum. In particular, when $K_0 = L^k$, a permissible exponent in (2.34) is 
#[#set math.equation(numbering: n => "(2.35)")
 $ c_(upright("cnt")) \( k \) = C_(upright("as")) + 3 max \( k \, C_(upright("as")) \) . $ <forest:eq-count-exponent>]

]
] <forest:prop-count>

Once the fixed power $K_0$ is chosen, this estimate together with $S lt.eq L^(C_(upright("as"))) N^2 \| F \|$ makes the part of $F$ where $n$ exceeds $N$ times a sufficiently large fixed power of $L$ small enough for (2.31).

#proof[
  If $S = 0$, the assertion is immediate, so assume $S > 0$. We first state the maximal-function input in the form used here. For a Lipschitz unit vector field $v_0$, let $M_(v_0 \, delta)$ be the supremum of averages over Euclidean rectangles containing the evaluation point, with long side at most $c_(upright("LL")) \/ "Lip" \( v_0 \)$, for which the field belongs to the rectangle’s direction uncertainty arc on at least a $delta$ fraction of the rectangle. The arc is centered at the long-side direction and has total length equal to the short-to-long side ratio, as in 2. 2, namely #cite(label("LLKakeya")) Theorem 1.4, gives
  #[#set math.equation(numbering: n => "(2.36)")
   $ ∥M_(v_0 \, delta) a∥_(2 \, oo) lt.eq C delta^(- 1 \/ 2) ∥a∥_2 \, #h(2em) 0 < delta < 1 . $ <forest:eq-kakeya-input>]
  The same estimate holds if the admissible rectangles are required to satisfy a smaller fixed uncertainty interval, since this restricts the family of rectangles. When $"Lip" \( v_0 \) = 0$, the length restriction is understood as absent. We apply this result to $v_0 = \( 1 \, u \) \/ sqrt(1 + u^2)$, whose Lipschitz constant is bounded by an absolute constant. We also use the ordinary uncentered strong maximal operator $M_(upright("str"))$ over axis-parallel rectangles, which is bounded on $L^2 \( bb(R)^2 \)$.
  Let $Q subset cal(D)$ have finite measure, let $D gt.eq D_(*)$, and put
  $ a_T \( D \) = frac(\| Q ∩ D R_T \|, \| D R_T \|) = frac(\| Q ∩ D R_T \|, D^2 \| R_T \|) . $
  Here and below dilation is about the box center in its slope coordinates. We prove, for $0 < beta lt.eq 1$, that
  #[#set math.equation(numbering: n => "(2.37)")
   $ sum_(T : a_T \( D \) > beta) \| R_T \| lt.eq min (S \, thin C L^(2 C_(upright("as"))) D^2 beta^(- 2) \| Q \|) . $ <forest:eq-dilation-tail>]
  Fix a top occurring on the left-hand side. Set
  $ J_T = I ∩ \[ x_T - D l_T \/ 2 \, x_T + D l_T \/ 2 \] \, #h(2em) a = \| J_T \| \, #h(2em) b = C_(upright(w)) D W \, $
  where $C_(upright(w)) gt.eq 1$ is a fixed absolute constant. The witness set is contained in $D R_T ∩ cal(D)$, so $a > 0$. The slope parallelogram
  $ tilde(R)_T = { \( x \, y \) : x in J_T \, quad \| \( y - y_T \) - s_T \( x - x_T \) \| lt.eq b \/ 2 } $
  contains both $E_T$ and $Q ∩ D R_T$. It satisfies
  #[#set math.equation(numbering: n => "(2.38)")
   $ a lt.eq min \( \| I \| \, D l_T \) \, #h(2em) a b lt.eq C_(upright(w)) D^2 \| R_T \| \, #h(2em) b / a gt.eq C_(upright(w)) W / l_T = C_(upright(w)) m d_T . $ <forest:eq-clipped-geometry>]
  Thus the possibly very long horizontal dilation has been clipped before any Euclidean enclosing rectangle is constructed.
  Suppose first that $b \/ a lt.eq epsilon_0$, for a fixed small absolute $epsilon_0$. Projection onto the orthonormal directions
  $ e_T = frac(\( 1 \, s_T \), sqrt(1 + s_T^2)) \, #h(2em) e_T^perp = frac(\( - s_T \, 1 \), sqrt(1 + s_T^2)) $
  encloses $tilde(R)_T$ in a Euclidean rectangle $U_T$ whose side lengths are
  $ L_T = sqrt(1 + s_T^2) thin a + frac(\| s_T \|, sqrt(1 + s_T^2)) b \, #h(2em) B_T = b / sqrt(1 + s_T^2) . $
  The slopes are absolutely bounded. Consequently $L_T asymp a$, $B_T asymp b$, $\| U_T \| lt.eq C D^2 \| R_T \|$, and
  $ L_T lt.eq C \| I \| \, #h(2em) B_T / L_T gt.eq c m d_T . $
  On the witness set, normalization of the direction gives $∥v_0 - e_T∥ lt.eq C d_T$. Since $m arrow.r oo$, this error is smaller than any required fixed small multiple of $B_T \/ L_T$, for sufficiently large $L$. The fixed widening constant $C_(upright(w))$ can absorb the absolute aperture constants as well. Choose the horizontal localization constant so that $C \| I \|$ meets the length restriction in (2.36). The rectangle $U_T$ is then admissible with the common popularity parameter
  $ delta_D = c L^(- C_(upright("as"))) D^(- 2) \, $
  where $c > 0$ is sufficiently small and absolute. Indeed, $\| E_T \| gt.eq L^(- C_(upright("as"))) \| R_T \|$, and $\| U_T \| lt.eq C D^2 \| R_T \|$. Moreover,
  $ frac(1, \| U_T \|) integral_(U_T) upright(bold(1))_Q gt.eq frac(\| Q ∩ D R_T \|, C D^2 \| R_T \|) > c beta . $
  Every point of $E_T$ therefore belongs to ${ M_(v_0 \, delta_D) upright(bold(1))_Q > c beta }$.
  If $b \/ a > epsilon_0$, enclose $tilde(R)_T$ in the axis-parallel rectangle with horizontal side $J_T$ and vertical side of length $b + \| s_T \| a$. Its area is at most $C a b lt.eq C D^2 \| R_T \|$. It contains $E_T$ and $Q ∩ D R_T$, so every point of $E_T$ belongs to ${ M_(upright("str")) upright(bold(1))_Q > c beta }$. This argument also covers boxes whose transverse side exceeds the horizontal side.
  The sets $E_T$ are pairwise disjoint. Summing their lower measure bounds and using the two maximal estimates yields
  $ sum_(T : a_T \( D \) > beta) \| R_T \| & lt.eq L^(C_(upright("as"))) lr(|union.big_(T : a_T \( D \) > beta) E_T|)\
 & lt.eq C L^(C_(upright("as"))) \( delta_D^(- 1) + 1 \) beta^(- 2) \| Q \|\
 & lt.eq C L^(2 C_(upright("as"))) D^2 beta^(- 2) \| Q \| . $
  The bound by $S$ is immediate, proving (2.37).
  For positive numbers $S_0 \, A_0$, direct integration, split at $min \( 1 \, sqrt(A_0 \/ S_0) \)$, gives
  $ integral_0^1 min \( S_0 \, A_0 beta^(- 2) \) thin upright(d) beta lt.eq 2 sqrt(S_0 A_0) . $
  Layer cake in (2.37) therefore gives
  #[#set math.equation(numbering: n => "(2.39)")
   $ sum_T \| R_T \| a_T \( D \) & lt.eq C L^(C_(upright("as"))) D sqrt(S \| Q \|) \,\
sum_T \| Q ∩ D R_T \| & lt.eq C L^(C_(upright("as"))) D^3 sqrt(S \| Q \|) . $ <forest:eq-dilation-layer>]
  In the second line the additional factor $D^2$ is the dilation-area ratio.
  Set $D_k = 2^k D_(*)$. The explicit formula for $h_T$ implies the pointwise bound
  $ h_T \( z \) lt.eq C_(D_2) sum_(k gt.eq 0) 2^(- k D_2) upright(bold(1))_(D_k R_T) \( z \) . $
  To verify it outside $D_(*) R_T$, choose the least $k gt.eq 1$ such that $z in D_k R_T$. Then $"dist"_T \( z \) > 2^(k - 2) D_(*)$, while $D_(*) gt.eq 2 K_0$, so $h_T \( z \) lt.eq C_(D_2) 2^(- k D_2)$. Inside $D_(*) R_T$, use $h_T lt.eq C_3$. Applying (2.39),
  #[#set math.equation(numbering: n => "(2.40)")
   $ integral_Q n lt.eq C L^(C_(upright("as"))) D_(*)^3 sqrt(S \| Q \|) sum_(k gt.eq 0) 2^(- k \( D_2 - 3 \)) lt.eq C L^(C_(upright("as"))) D_(*)^3 sqrt(S \| Q \|) . $ <forest:eq-testing-count>]
  The sum converges because $D_2 > 4$. Finally take $Q = { z in cal(D) : n \( z \) > lambda }$. This set has finite measure, since the collection is finite and $D_2 > 2$. The inequality $lambda \| Q \| lt.eq integral_Q n$ proves the asserted weak $L^2$ bound. All exponents in this argument are fixed: in particular the dilation cost before the final summation is exactly $D^3$, independently of the number of tops and angular scales. ◻
]

=== 2.11 Parameters and masks <parameters-and-masks>

All logarithms below are natural. Set

#[#set math.equation(numbering: n => "(2.41)")
 $ p & = L^(1 \/ 2) \, #h(2em) G = 2^(thin 2 ⌈L^0.7 \/ \( 2 log 2 \)⌉) \,\
K & = ⌈\( log L \)^2⌉ \, #h(2em) B = G^K . $ <forest:eq-parameters>]

Thus $G$ and $sqrt(G)$ are dyadic powers, $log G asymp L^0.7$, and $log B asymp L^0.7 \( log L \)^2 = o \( L^0.9 \)$. In particular,

#[#set math.equation(numbering: n => "(2.42)")
 $ B^100 / m arrow.r 0 #h(2em) \( L arrow.r oo \) . $ <forest:eq-scale-separation>]

The parameters have different tasks. The large bin number $m$ permits fine angular phase separation while keeping changes in the packet envelopes small. The much smaller time cutoff $tau$ pays for the commutation errors. The scale ratio $G$ will separate prediction and averaging lengths; grouping $K$ angular transitions into a block gives the ratio $B$. Their strict asymptotic ordering is what allows these tasks to coexist.

Let $A > 2$ be a fixed exponent to be chosen sufficiently large after the unmasked top estimates in (3.17). Their fixed exponents and dilation $K_1 = L^(A_1)$ are independent of $A$. The comparison of the original and masked sums uses 21 at $K_1$, so its loss $c_(upright("cnt")) \( A_1 \)$ is fixed before $A$ is chosen. The count at the $A$-dependent $K_0$ below is used only after that choice. Constants in the mask estimates may depend on the fixed value of $A$. Put $r_L = 2 ceil.l L ceil.r$, and define, in the coordinates (2.32),

#[#set math.equation(numbering: n => "(2.43)")
 $ q_T \( z \) = ("sinc" frac(X_T \( z \), L^A) thin "sinc" frac(Y_T \( z \), L^A))^(r_L) \, #h(2em) "sinc" \( a \) = cases(delim: "{", sin \( a \) \/ a \, & a eq.not 0 \,, 1 \, & a = 0 .) $ <eq:src-8>]

The exponent is even, so $0 lt.eq q_T lt.eq 1$ and the mask is real. From now on take

$ K_0 = L^(A + 2) $

in (2.33). A top is called #emph[significant at $z$] if $"dist"_T \( z \) lt.eq K_0$. Every significant top contributes at least one to $n \( z \)$.

#thm([Lemma 2.7.])[
  #emph[The mask has Fourier support 
#[#set math.equation(numbering: n => "(2.44)")
 $ "supp" hat(q)_T subset {\( xi \, eta \) : \| xi + s_T eta \| lt.eq frac(r_L, L^A l_T) \, quad \| eta \| lt.eq frac(r_L, L^A W)} . $ <forest:eq-mask-spectrum>]

 For sufficiently large $L$, with all other exponents fixed, 
#[#set math.equation(numbering: n => "(2.45)")
 $ \| q_T \( z \) \| & lt.eq exp \( - L log L \) &  & upright("if ") "dist"_T \( z \) > K_0 \,\
\| q_T \( z \) \| h_T \( z \)^(- 1) & lt.eq C &  & upright("for all ") z \,\
\| 1 - q_T \( z \) \| & lt.eq C L^(1 - A) &  & upright("if ") "dist"_T \( z \) lt.eq L^(A \/ 2) . $ <forest:eq-mask-outside>]

 In particular multiplication by $q_T$ adds at most $O \( L^(1 - A) \)$ times the bandwidths of the top box to a Fourier support.]
] <forest:lem-mask>

#proof[
  For the Fourier convention $e^(i x xi)$, the transform of $"sinc" \( x \)$ is supported in $\[ - 1 \, 1 \]$. Taking its $r_L$-th power convolves that transform $r_L$ times, so the transform of $"sinc" \( X \/ L^A \)^(r_L)$ is supported in $\[ - r_L \/ L^A \, r_L \/ L^A \]$. The product of the two one-dimensional functions has this support bound in each normalized frequency coordinate. The affine coordinate change (2.32) sends these coordinates to $l_T \( xi + s_T eta \)$ and $W eta$, proving (2.44). The center translation contributes only a Fourier phase. The calculation can equivalently be performed first for compactly supported Fourier distributions and then their convolutions; the resulting mask is integrable for $r_L > 1$.
  Write $d = "dist"_T \( z \)$. Since at least one of $\| X_T \( z \) \| \, \| Y_T \( z \) \|$ is at least $d \/ 2$, the elementary inequality $\| "sinc" \( a \) \| lt.eq min \( 1 \, \| a \|^(- 1) \)$ gives, for $d > 0$,
  #[#set math.equation(numbering: n => "(2.46)")
   $ \| q_T \( z \) \| lt.eq min (1 \, (frac(2 L^A, d))^(r_L)) . $ <forest:eq-mask-pointwise>]
  If $d > K_0 = L^(A + 2)$, this is at most $\( 2 L^(- 2) \)^(r_L) lt.eq exp \( - L log L \)$, proving (2.45). To include arbitrary distances in the weighted bound, write $d = t K_0$, with $t > 1$. Once $r_L gt.eq D_2$,
  $ \| q_T \( z \) \| h_T \( z \)^(- 1) lt.eq 2^(- D_2) \( 1 + t \)^(D_2) \( 2 L^(- 2) \)^(r_L) t^(- r_L) lt.eq \( 2 L^(- 2) \)^(r_L) . $
  For $d lt.eq K_0$, use $q_T lt.eq 1$ and $h_T gt.eq 1$. This proves (2.45), including the region arbitrarily far from the top.
  Finally, if $d lt.eq L^(A \/ 2)$, both arguments of the sinc functions have absolute value at most $L^(- A \/ 2)$. They lie in $\[ 0 \, 1 \]$ after evaluation by sinc, and
  $ 0 lt.eq 1 - "sinc" \( X_T \/ L^A \) "sinc" \( Y_T \/ L^A \) lt.eq C frac(X_T^2 + Y_T^2, L^(2 A)) lt.eq C L^(- A) . $
  The inequality $1 - a^(r_L) lt.eq r_L \( 1 - a \)$, for $0 lt.eq a lt.eq 1$, proves (2.45). Since $r_L \/ L^A = O \( L^(1 - A) \)$, the bandwidth assertion follows from (2.44) and addition of Fourier supports under multiplication. ◻
]

For completeness, the spectral enlargement also respects the finer tile coordinates. If $T = T \( s \)$, an added frequency $\( zeta \, nu \) in "supp" hat(q)_T$ satisfies

$ \| zeta + theta_s nu \| lt.eq r_L / L^A (1 / l_T + frac(\| theta_s - s_T \|, W)) lt.eq frac(C L^(1 - A), ell_s) \, #h(2em) \| nu \| lt.eq frac(C L^(1 - A), W) . $

Here we used $ell_s lt.eq l_T$, $\| theta_s - s_T \| lt.eq C d_s$, and $d_s \/ W = 1 \/ \( m ell_s \)$. Thus all fixed spectral margins needed later remain available after taking $L$ sufficiently large.

== 3 Reference-line concentration and significant directions <conc:section>

We use the finite packet forms, their assignment to popular tops, and the notation of the preceding sections. In particular, all estimates concern one of the separate forms in the packet expansion. Its label multiplicity and its spatial lattice multiplicity are bounded by absolute constants. The Hilbert space of bin components is denoted by $cal(H)$, and $∥g \( z \)∥_(cal(H)) lt.eq upright(bold(1))_E \( z \) lt.eq 1$. Every subcollection in this section is fixed before its functions are evaluated at a spatial point.

The first task is to control every interval of scales assigned to a top outside one small exceptional set. We prove moment bounds on each reference line, then obtain the uniform top and derivative bounds in 28. 29 uses these bounds to replace the original adjoint sum $P$ by the masked sum $P_q$ and impose the weighted top-count threshold.

For a slope $t$, put $Y_t \( x \, y \) = y - t x$. A $t$-box of dimensions $r times W$ is a rectangle in the coordinates $\( x \, Y_t \)$. The affine change to these coordinates preserves area. Fix a reference length $l$ and consider tiles satisfying

#[#set math.equation(numbering: n => "(3.1)")
 $ ell_s lt.eq l \, #h(2em) lr(|theta_s - t|) lt.eq C_(*) B^4 d_s \, #h(2em) d_s = w \/ ell_s . $ <eq:src-9>]

Here and below the fixed constant $C_(*)$ can be increased finitely many times. This only changes absolute constants in the conclusions. The inequality $B^100 lt.double m$ is more than sufficient for all such choices.

The tiles assigned to one top satisfy the narrower bound $lr(|theta_s - s_T|) lt.eq C d_s$. The wider $B^4$ window also covers the fixed packet families used for residual estimates, where the reference slope can be that of a different top; see (5.40) and (5.41).

For a fixed, sufficiently large integer $n$, write

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(B)_(s \, n)^t \( z \) = (1 + frac(\( x - x_s \)^2, ell_s^2))^(- n) (1 + frac(\( Y_t \( z \) - Y_t \( z_s \) \)^2, W^2))^(- n) . $ <conc:envelope>]

The change from the packet coordinates of slope $theta_s$ to these coordinates has normalized shear at most $C_(*) B^4 \/ m$. Thus packet bounds with any specified fixed number of derivatives and any specified fixed decay order imply the corresponding bounds by $C_n cal(B)_(s \, n)^t$. We always choose the available packet decay orders larger than the envelope orders used below. These are fixed integers; none grows with $L$, the number of scales, or $dim cal(H)$.

=== 3.1 Positive estimates and the main coefficients <positive-estimates-and-the-main-coefficients>

For a reference slope $t$, decompose the actual coefficient as $a_s = a_s^(upright("main")) + a_s^(upright("err"))$, where componentwise

#[#set math.equation(numbering: n => "(3.3)")
 $ a_(s \, j)^(upright("main")) = 1 / lr(|R_s|) integral upright(bold(1))_({ lr(|u \( z \) - t|) lt.eq d_s }) g_j \( z \) overline(b_(s \, j) \( t \) Psi_(s \, j) \( z \)) thin thin upright(d) z . $ <conc:main-coefficient>]

This convention agrees with the pairing, linear in its first argument, used to define $a_s$. In particular the error analyzes $overline(b_(s \, j) \( u \)) g_j - upright(bold(1))_({ lr(|u - t|) lt.eq d_s }) overline(b_(s \, j) \( t \)) g_j$.

We first record a positive estimate which also applies when only one scale is present. For $r > 0$ let $k_(r \, n) \( x \) = r^(- 1) \( 1 + x^2 \/ r^2 \)^(- n)$.

#thm([Lemma 3.1.])[
  #emph[For a fixed scale $ell = w \/ d$, and any subcollection of tiles satisfying (3.1) at this scale, 
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(ell_s = ell) ∥a_s∥_(cal(H)) cal(B)_(s \, n)^t \( z \) lt.eq C_n . $ <conc:original-positive>]

 There are fixed constants $0 < c < 1 < C'$ for which 
#[#set math.equation(numbering: n => "(3.5)")
 $ f_d \( z \) & = C (upright(bold(1))_({ c d lt.eq lr(|u \( z \) - t|) lt.eq C' B^4 d }) + lr(|u \( z \) - t|) / d upright(bold(1))_({ lr(|u \( z \) - t|) lt.eq c d })) \,\
sum_(ell_s = ell) ∥a_s^(upright("err"))∥_(cal(H)) cal(B)_(s \, n)^t \( z \) & lt.eq C_n #scale(x: 120%, y: 120%)[\(] k_(ell \, n') *_x k_(W \, n') *_(Y_t) f_d #scale(x: 120%, y: 120%)[\)] \( z \) $ <conc:error-input>]

 for a fixed $n' > 2$ with $2 n' < n$. The constants are independent of the number of labels permitted in (3.1).]
] <conc:single-scale>

#proof[
  Minkowski’s inequality bounds the norm of an analyzing coefficient by the integral of its scalar analyzing envelope times the largest modulus of its multiplier among the components, divided by $ell W$; the factor $∥g∥_(cal(H))$ can be replaced by one. At a fixed source point the support condition for $b_(s \, j) \( u \)$ allows only a bounded number of labels at this scale. This remains true after taking the maximum over components, since the support condition is the common condition on the label slope at precision $d$.
  Choose the available analyzing decay order $N gt.eq 2 n$, with $n \, n' \, N$ all fixed. For one label, the lattice gives the unequal-exponent bound
  $ sum_(s upright(" in that lattice")) frac(cal(B)_(s \, N)^t \( z' \) cal(B)_(s \, n)^t \( z \), ell W) lt.eq C_(n \, N \, n') k_(ell \, n') \( x - x' \) k_(W \, n') \( Y_t \( z \) - Y_t \( z' \) \) . $
  Indeed, in each normalized coordinate, $1 + lr(|a - b|)^2 lt.eq 2 \( 1 + lr(|a - c|)^2 \) \( 1 + lr(|b - c|)^2 \)$ extracts the relative kernel with exponent $n'$ from the two endpoint envelopes. The remaining exponents are $N - n'$ at the source and $n - n'$ at the output. Drop the source factor, which is at most one, and sum the output envelope. Its lattice sum is uniformly bounded since $n - n' > 1 \/ 2$: first sum the vertical centers in each horizontal row, then the horizontal rows. The transverse translations of the rows do not affect these one-dimensional bounds. The comparison with the reference coordinates already gives the required analyzing envelope. Summing the bounded number of labels active at the source and integrating proves (3.4).
  For the error, if $lr(|u - t|) lt.eq c d$ with $c$ sufficiently small, the replacement indicator is one and smoothness gives $lr(|b_(s \, j) \( u \) - b_(s \, j) \( t \)|) lt.eq C lr(|u - t|) \/ d$. The union of labels on which either multiplier is nonzero is bounded. Outside this region, any nonzero original multiplier requires $lr(|u - t|) lt.eq C' B^4 d$ by (3.1), whereas a nonzero replacement requires $lr(|u - t|) lt.eq d$. The multipliers are bounded there. Again, only boundedly many labels are active at the source, counting both families. Applying the same lattice calculation with the common factor (3.5) proves (3.5). ◻
]

The smoothness and support assumptions on $b_(s \, j)$ also show that nonzero main coefficients use only a bounded number of labels per scale. In such a component, $lr(|t - theta_s|) asymp d_s$. On a line of slope $t$, the Fourier frequency of a packet is $xi + t eta$, and hence its support is contained in

#[#set math.equation(numbering: n => "(3.6)")
 $ c_a ell_s^(- 1) lt.eq lr(|xi + t eta|) lt.eq C_a ell_s^(- 1) $ <conc:main-annuli>]

with absolute $0 < c_a < C_a$. This uses the separation of the selector from $theta_s$ and the small choice of the packet bandwidth $c_(*)$.

Multiplying a synthesizing packet by its top mask preserves (3.6), with slightly relaxed absolute constants. Indeed the extra frequency on a $t$-line has magnitude at most

#[#set math.equation(numbering: n => "(3.7)")
 $ C L^(1 - A) (l_(T \( s \))^(- 1) + lr(|t - s_(T \( s \))|) / W) lt.eq C L^(1 - A) \( 1 + B^4 \/ m \) ell_s^(- 1) . $ <conc:mask-bandwidth>]

Here $ell_s lt.eq l_(T \( s \))$ and $lr(|t - s_(T \( s \))|) lt.eq C B^4 d_s$. For $A gt.eq 2$ and sufficiently large $L$, this is less than $c_a \/ \( 10 ell_s \)$. Moreover, for every fixed derivative order the masked packets have the same uniform envelope bounds. One can see this either from the explicit sinc product or from its compact Fourier support and bounded supremum. In particular

#[#set math.equation(numbering: n => "(3.8)")
 $ lr(|\( partial_x + t partial_y \) q_T|) lt.eq C L^(1 - A) #scale(x: 120%, y: 120%)[\(] l_T^(- 1) + lr(|t - s_T|) \/ W #scale(x: 120%, y: 120%)[\)] \, #h(2em) lr(|partial_y q_T|) lt.eq C L^(1 - A) \/ W . $ <conc:mask-derivative>]

These absolute bounds are global and do not require a good-point assumption.

#thm([Lemma 3.2.])[
  #emph[For every $t$-box $Q$ of width $W$, the main coefficients satisfy 
#[#set math.equation(numbering: n => "(3.9)")
 $ sum_(z_s in Q\
ell_s lt.eq upright("length") \( Q \)) ∥a_s^(upright("main"))∥_(cal(H))^2 lr(|R_s|) lt.eq C lr(|Q|) . $ <eq:src-10>]

 The same estimate holds after restricting to any fixed subcollection.]
] <conc:coefficient-carleson>

#proof[
  Let $cal(S)_Q$ be the finite set in the sum and dualize its weighted coefficient norm against vectors $c_s$ satisfying $sum_(s in cal(S)_Q) ∥c_s∥^2 lr(|R_s|) = 1$. Using (3.3), the dual pairing is bounded by the integral of the norm of the synthesis
  $ sum_(s in cal(S)_Q) upright(bold(1))_({ lr(|u \( z \) - t|) lt.eq d_s }) #scale(x: 120%, y: 120%)[\(] c_(s \, j) b_(s \, j) \( t \) Psi_(s \, j) \( z \) #scale(x: 120%, y: 120%)[\)]_j . $
  At each $z$, the indicators choose a partial interval of the dyadic lengths: $lr(|u \( z \) - t|) lt.eq w \/ ell_s$ is monotone in $ell_s$. The norm of this synthesis is therefore at most its maximal partial length sum. All its nonzero component frequencies satisfy (3.6).
  Write $r = upright("length") \( Q \) > 0$. Apply the proof of the Hilbert-valued synthesis estimate in 17, including a fixed polynomial growth weight $P_Q$ about $Q$. This proof applies to the present reference box even if $r$ is not dyadic or $r > tau$. For the weighted packet bounds it uses only center containment in $Q$ and $ell_s lt.eq r$; multiplication by $P_Q$ preserves frequency support and gives tile bounds with slower fixed decay. The annular separation and maximal partial sums depend on the dyadic tile lengths, not on the reference length $r$. For example, a fixed sufficiently large integer $q$ gives the admissible polynomial
  $ P_Q \( z \) = (1 + frac(\( x - x_Q \)^2, r^2))^q (1 + frac(\( Y_t \( z \) - Y_t \( z_Q \) \)^2, W^2))^q \, #h(2em) integral P_Q^(- 2) lt.eq C_q r W = C_q lr(||) Q . $
  The main label count is bounded, so the same synthesis proof yields
  $ integral ∥upright("selected synthesis")∥ lt.eq (integral P_Q^(- 2))^(1 \/ 2) ∥P_Q thin upright("maximal synthesis")∥_2 lt.eq C lr(|Q|)^(1 \/ 2) . $
  Taking the supremum over $c_s$ proves (3.9). Deleting packets preserves both the synthesis hypotheses and this proof. ◻
]

=== 3.2 Fourier sums and a dyadic martingale <fourier-sums-and-a-dyadic-martingale>

For a finite sequence $\( F_k \)$ of functions with values in $cal(H)$, define its interval-sum variation by

#[#set math.equation(numbering: n => "(3.10)")
 $ cal(V)_3 \( F_k \) \( x \) = sup_(cal(I)) (sum_(I in cal(I)) ∥sum_(k in I) F_k \( x \)∥_(cal(H))^3)^(1 \/ 3) \, $ <conc:variation-definition>]

where $cal(I)$ ranges over finite families of disjoint integer intervals. Empty intervals contribute zero. This is bounded by the usual $3$-variation of partial sums with the initial zero partial sum included: insert the endpoints of the chosen intervals in order and retain the resulting nonnegative terms. This formulation allows the interval endpoints to depend on the evaluation point.

#thm([Lemma 3.3.])[
  #emph[Suppose $F_k in L^2 \( bb(R) \; cal(H) \)$ has Fourier support in ${ nu : c_a 2^k lt.eq lr(|nu|) lt.eq C_a 2^k }$, with fixed positive $c_a \, C_a$. Then 
#[#set math.equation(numbering: n => "(3.11)")
 $ ∥cal(V)_3 \( F_k \)∥_(L^2 \( bb(R) \)) lt.eq C_(c_a \, C_a) (sum_k ∥F_k∥_2^2)^(1 \/ 2) . $ <conc:annular-var-bound>]

 The constant is independent of the finite index range and of $dim cal(H)$.]
] <conc:annular-variation>

#proof[
  We give the smooth-convolution versus dyadic-expectation comparison explicitly; compare #cite(label("JSW2008")) Lemma 3.2 and Section 4. Split the integers into a fixed number $q$ of residue classes, large enough that the annuli in one class have gaps of ratio greater than four. The variation of the sum is at most the sum of the variations of these classes, so it suffices to treat one class. Its supports are disjoint, and $F = sum_k F_k$ satisfies $∥∥ F_2^2 = sum_k ∥F_k∥_2^2$.
  Choose a smooth function $chi$ equal to one on $\[ - 1 \, 1 \]$ and supported in $\[ - 2 \, 2 \]$, and let $P_i$ have multiplier $chi \( 2^(- i) nu \)$. At a sequence of integer indices lying in the annular gaps, $P_i F$ is exactly the partial sum of all the preceding bands. Include an index below the first band, where this partial sum is zero.
  For each integer $i$, let $cal(F)_i$ be the sigma algebra generated by the intervals $\[ a 2^(- i) \, \( a + 1 \) 2^(- i) \)$, $a in bb(Z)$, and let $E_i$ be averaging on its atoms. The sigma algebras increase with $i$ and $\( E_i F \)_i$ is a martingale. We prove the comparison bound
  #[#set math.equation(numbering: n => "(3.12)")
   $ sum_i ∥\( P_i - E_i \) F∥_2^2 lt.eq C ∥∥ F_2^2 . $ <conc:expectation-comparison>]
  Take a smooth dyadic partition $F = sum_j f_j$ with $f_j$ supported in a fixed annulus of size $2^j$ and $sum_j ∥f_j∥_2^2 lt.eq C ∥∥ F_2^2$. If $j lt.eq i - C$, then $P_i f_j = f_j$, and Poincaré’s inequality on each interval of length $2^(- i)$, followed by Bernstein’s inequality, gives
  $ ∥\( P_i - E_i \) f_j∥_2 lt.eq C 2^(j - i) ∥f_j∥_2 . $
  If $j gt.eq i + C$, then $P_i f_j = 0$. Define its band primitive $A_j$ by $hat(A)_j \( nu \) = hat(f)_j \( nu \) \/ \( i nu \)$. Thus $A'_j = f_j$ and $∥A_j∥_2 lt.eq C 2^(- j) ∥f_j∥_2$. With $h = 2^(- i)$, averaging on a cell gives $E_i f_j = \( A_j \( \( a + 1 \) h \) - A_j \( a h \) \) \/ h$ there. The sampling estimate
  #[#set math.equation(numbering: n => "(3.13)")
   $ sum_(a in bb(Z)) ∥A_j \( a h \)∥_(cal(H))^2 lt.eq C 2^j ∥A_j∥_2^2 \, #h(2em) h gt.eq c 2^(- j) \, $ <conc:band-sampling>]
  follows directly from smooth reproduction. Namely, take a Schwartz kernel $K_j$ whose Fourier transform equals one on the spectrum of $A_j$ and which satisfies $lr(|K_j \( x \)|) lt.eq C_N 2^j \( 1 + 2^j lr(||) x \)^(- N)$. Cauchy–Schwarz in $A_j = K_j * A_j$ gives $∥A_j \( a h \)∥^2 lt.eq C integral lr(|K_j \( a h - x \)|) ∥A_j \( x \)∥^2 thin upright(d) x$; summing uses $sup_x sum_a lr(|K_j \( a h - x \)|) lt.eq C 2^j$. Consequently
  $ ∥E_i f_j∥_2^2 lt.eq C h^(- 1) sum_a ∥A_j \( a h \)∥^2 lt.eq C 2^(i - j) ∥f_j∥_2^2 . $
  For $lr(|i - j|) lt.eq C$ use the bounded $L^2$ norms of $P_i \, E_i$. The resulting bounds have the form $∥\( P_i - E_i \) f_j∥_2 lt.eq a_(i - j) ∥f_j∥_2$ with a fixed $ell^1 \( bb(Z) \)$ sequence $a$. The triangle inequality followed by the $ell^1 * ell^2$ convolution inequality proves (3.12).
  For any sequence $\( D_i \)$, its usual $3$-variation is bounded pointwise by $2 \( sum_i ∥D_i∥^2 \)^(1 \/ 2)$: each endpoint of an increasing sequence is used at most twice, and $ell^3$ is bounded by $ell^2$. Thus (3.12) controls the variation of $\( P_i - E_i \) F$.
  Lépingle’s martingale variation inequality #cite(label("Lepingle1976")), in the unweighted $L^2$ case and at variation exponent $3$, gives $∥V^3 \( E_i F \)∥_2 lt.eq C ∥∥ F_2$; see #cite(label("ZorinKranich2020")) Theorem 1.1, with $p = 2$, $r = 3$, and weight one. For a finite index range on $bb(R)$, apply its probability-space version on every atom of the coarsest sigma algebra, normalizing Lebesgue measure there, and sum the squared inequalities. This proves the same statement on the line without a finite-measure assumption. For Hilbert-valued $F$, apply the scalar inequality to its real and imaginary components. Minkowski’s inequality, in the form $ell^3 \( ell^2 \) lt.eq ell^2 \( ell^3 \)$, and the outer $L^2$ norm give the same constant independently of the number of components. Combining with the comparison and then taking the selected low-pass indices proves the estimate for one spaced class. Summing the fixed number of classes proves (3.11). ◻
]

=== 3.3 Every-line moment bounds <every-line-moment-bounds>

We use the following precise local form of the John–Nirenberg inequality #cite(label("JohnNirenberg1961")); a proof is included to specify the normalization.

#thm([Lemma 3.4.])[
  #emph[Let $I$ be a finite interval and let $f$ be a locally integrable scalar function on $I$. Suppose that for each dyadic subinterval $J$ of $I$, $lr(||) J^(- 1) integral_J lr(|f - f_J|) lt.eq A$, where $f_J$ denotes its average. Then, for every $b gt.eq 1$, 
$ (frac(1, lr(||) I) integral_I lr(||) f^b)^(1 \/ b) lt.eq lr(|f_I|) + C b A . $

]
] <conc:john-nirenberg>

#proof[
  If $A = 0$, dyadic differentiation makes $f$ constant almost everywhere, and the assertion is immediate. Otherwise take the maximal proper dyadic subintervals $J$ of $I$ on which the average of $lr(|f - f_I|)$ exceeds $2 A$. Their total length is at most $lr(||) I \/ 2$, the function has $lr(|f - f_I|) lt.eq 2 A$ almost everywhere off their union, and dyadic parent maximality gives $lr(|f_J - f_I|) lt.eq 4 A$ on each selected interval. Repeat the same selection inside each $J$, now subtracting its own mean. At generation $k$ the selected union has measure at most $2^(- k) lr(||) I$. Outside it, the successive differences of means and the final differentiation bound show $lr(|f - f_I|) lt.eq \( 4 k + 2 \) A$. This proves an exponential distributional bound for $lr(|f - f_I|) \/ A$. Integrating that bound by layer cake gives $∥f - f_I∥_(L^b \( I \, thin upright(d) x \/ lr(||) I \)) lt.eq C b A$; adding the mean proves the lemma. Finite stopping generations and then monotone convergence justify the argument for any locally integrable $f$. ◻
]

Fix a sufficiently large envelope exponent $n$. At each scale put

$ U_ell \( z \) = sum_(ell_s = ell) ∥a_s^(upright("main"))∥ cal(B)_(s \, n)^t \( z \) \, #h(2em) cal(E)_t \( z \) = sum_s ∥a_s^(upright("err"))∥ cal(B)_(s \, n)^t \( z \) \, #h(2em) cal(S)_t \( z \) = (sum_ell U_ell \( z \)^2)^(1 \/ 2) . $

These quantities can be formed on any fixed subcollection; it is also permissible to dominate a subcollection by the positive quantities on the full collection.

#thm([Proposition 3.5.])[
  #emph[For every slope $t$, every collection satisfying (3.1), every line $Y_t = y_0$, every horizontal interval $I$ of length $l$ on that line, and every $b gt.eq 2$, the normalized $L^b \( I \)$ norms of $cal(E)_t$, $cal(S)_t$, and 
$ cal(V)_3 (sum_(ell_s = 2^k) phi.alt_s) \, #h(2em) cal(V)_3 (sum_(ell_s = 2^k) q_(T \( s \)) phi.alt_s) $

 are at most $C b^C \( 1 + log B \)^C$. The constants are uniform in the line, interval, finite collection, dimension, and number of scales. In particular the assertion holds for every fixed deterministic subcollection with the same constants.]
] <conc:line-moments>

#proof[
  We give the local mean and oscillation bounds, including their behavior on intervals shorter than $l$. All convolutions in what follows are in the $\( x \, Y_t \)$ coordinates.
  First, (3.5) satisfies
  #[#set math.equation(numbering: n => "(3.14)")
   $ 0 lt.eq f_d lt.eq C \, #h(2em) sum_(d upright(" dyadic")) f_d lt.eq C \( 1 + log B \) . $ <conc:error-input-sum>]
  The first indicators are nonzero for only $O \( 1 + log B \)$ dyadic $d$ at a fixed point, and the second terms sum geometrically. Average first with the common vertical kernel $k_(W \, n')$. Its $L^1$ norm is fixed, so (3.14) persists on each reference line. The right side of (3.5), summed over scales, therefore defines a nonnegative majorant $cal(A)_t$ for $cal(E)_t$.
  Let $J$ be any horizontal interval of length $r lt.eq l$. If $ell lt.eq r$,
  $ 1 / r integral_J k_(ell \, n') \( x - x' \) thin upright(d) x lt.eq C / r (1 + frac("dist" \( x' \, J \), r))^(- 2) . $
  Hence the local mean of the short-scale part of $cal(A)_t$ is at most $C \( 1 + log B \)$, by summing the source functions before integration. For $ell > r$, the derivative of its convolution with a bounded source has supremum at most $C \/ ell$. The total oscillation of these terms on $J$ is at most $C r sum_(ell > r) ell^(- 1) lt.eq C$. It follows that $cal(A)_t$ has local BMO norm $O \( 1 + log B \)$. Its mean on an interval of length $l$ has the same bound, since all scales then belong to the short-scale part. John–Nirenberg on that interval gives $∥cal(E)_t∥_(L^b \( I \, thin upright(d) x \/ l \)) lt.eq C b \( 1 + log B \)$. We only use domination by the BMO majorant here; no assertion that an arbitrary function below a BMO function is BMO is required.
  For the square function, fixed-scale lattice overlap gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ U_ell \( z \)^2 lt.eq C sum_(ell_s = ell) ∥a_s^(upright("main"))∥^2 cal(B)_(s \, n)^t \( z \) . $ <conc:lattice-square>]
  For the same interval $J$, partition center space into $t$-boxes $Q_(a b)$ of dimensions $r times W$, with horizontal offset $a$ from $J$ and transverse offset $b$ from the reference line. For $z_s in Q_(a b)$ and $ell_s lt.eq r$, the envelope bound implies
  $ integral_J cal(B)_(s \, n)^t \( x \, y_0 + t x \) thin upright(d) x lt.eq C ell_s \( 1 + lr(||) a + lr(||) b \)^(- n_1) $
  for a fixed $n_1 > 4$, after choosing $n$ sufficiently large. Indeed the transverse decay gives the $b$ factor; for a distant horizontal box the integral is bounded by $C r \( ell_s \/ \( r lr(||) a \) \)^(n_1)$, which is at most $C ell_s \( 1 + lr(||) a \)^(- n_1)$ because $ell_s lt.eq r$. Equation (3.9) gives exactly
  $ sum_(z_s in Q_(a b)\
ell_s lt.eq r) ∥a_s^(upright("main"))∥^2 ell_s = W^(- 1) sum_(z_s in Q_(a b)\
ell_s lt.eq r) ∥a_s^(upright("main"))∥^2 lr(|R_s|) lt.eq C r . $
  Summing the offsets in (3.15) proves
  #[#set math.equation(numbering: n => "(3.16)")
   $ 1 / r integral_J sum_(ell lt.eq r) U_ell^2 thin upright(d) x lt.eq C . $ <conc:line-short-square>]
  This argument applies on each line directly; it is not a restriction of an almost-everywhere plane estimate to a line. Notice also that the factor $W$ has canceled, so the estimate has no dependence on $m$. Since main coefficients are bounded, fixed-scale lattice bounds give $U_ell lt.eq C$ and $lr(|partial_x U_ell|) lt.eq C \/ ell$ on the line. The long-scale part of $cal(S)_t^2$ has oscillation at most $C$ on $J$. By (3.16), its local BMO norm is bounded; its mean on every length-$l$ interval is bounded as well. John–Nirenberg applied to $cal(S)_t^2$ gives $∥cal(S)_t∥_(L^b \( I \, thin upright(d) x \/ l \)) lt.eq C sqrt(b)$.
  It remains to prove the main-term variation bound, with or without the mask. Fix $J$ and its center boxes $Q_(a b)$ as above, and first restrict to scales $ell_s lt.eq r$. Group the synthesis by those boxes. For a fixed box multiply its synthesis by
  $ P_(a b) \( x \) = (1 + frac(\( x - x_(Q_(a b)) \)^2, r^2))^(q_0) \, $
  where $q_0$ is a sufficiently large fixed integer. Because centers lie in $Q_(a b)$ and $ell_s lt.eq r$, these multiplied waves still have fixed tile envelope bounds. Their Fourier supports are preserved by polynomial multiplication. Using (3.15) and integrating on the entire line therefore gives
  $ sum_ell ∥P_(a b) sum_(ell_s = ell\
z_s in Q_(a b)) a_s^(upright("main")) Phi_s∥_(L^2 \( bb(R) \; cal(H) \))^2 lt.eq C r \( 1 + lr(||) b \)^(- n_1) \, $
  and the same bound holds with $q_(T \( s \)) Phi_s$ in place of $Phi_s$. Here and elsewhere $a_s^(upright("main")) Phi_s$ denotes componentwise multiplication. The bound follows from (3.9) as above, retaining transverse decay while integrating the horizontal envelope. Apply 25 with the length index reversed; this preserves the interval-sum variation. The support hypotheses hold by (3.6) and (3.7). On $J$, $P_(a b) gt.eq c \( 1 + lr(||) a \)^(2 q_0)$, and multiplication by this one scalar commutes with every interval sum and with its norm. Thus the $L^2 \( J \)$ variation of the synthesis from $Q_(a b)$ is at most
  $ C r^(1 \/ 2) \( 1 + lr(||) a \)^(- 2 q_0) \( 1 + lr(||) b \)^(- n_1 \/ 2) . $
  Minkowski and summation over $a \, b$ give a bound $C r^(1 \/ 2)$ for the short-scale main variation.
  For each longer scale the derivative of main synthesis on the line is bounded by $C \/ ell$, also after masking by (3.8). The variation of the long-scale part therefore changes by at most $C r sum_(ell > r) ell^(- 1) lt.eq C$ on $J$. The full main variation differs from the long-scale variation by at most the short-scale variation pointwise, by the triangle inequality for (3.10). This proves its bounded local BMO norm. Taking $r = l$ proves its bounded mean on $I$. John–Nirenberg gives normalized $L^b$ norm at most $C b$. The variation of the error synthesis is bounded by the positive sum $C cal(E)_t$, since disjoint intervals use each scale at most once. For the masked error the same is true because $lr(|q_T|) lt.eq 1$. The already proved error bound completes the proposition. ◻
]

All arguments in 27 use only fixed support, decay, and derivative bounds on the synthesizing waves. They still hold if those waves are replaced by waves with the same supports and such bounds multiplied by a fixed constant $C_0$; the conclusions are then multiplied by $C C_0$. This observation includes fixed polynomial growth weights about a region containing the centers, provided the polynomial is absorbed into a slower fixed tile envelope. It also includes the componentwise operator $W \( partial_y - i eta_j \)$ on the unmasked synthesizing waves. After demodulation its multiplier has bounded magnitude on the vertical packet support. These observations will be used only at fixed orders below.

=== 3.4 Uniform top bounds and neighborhood derivatives <uniform-top-bounds-and-neighborhood-derivatives>

Choose a fixed exponent $A_1$ so that $K_1 = L^(A_1)$ contains the polynomial dilation of $R_T$ in which all assigned centers lie, with a fixed additional margin. This choice depends on the top assignment and the fixed weight exponent $D_2$, and is made before choosing $A$. Set

$ h_T^(\( 1 \)) \( z \) = C_3 #scale(x: 120%, y: 120%)[\(] 1 + "dist"_T \( z \) \/ K_1 #scale(x: 120%, y: 120%)[\)]^(- D_2) . $

For an interval $cal(J)$ of dyadic lengths define the top sum $F_(T \, cal(J)) = sum_(s : T \( s \) = T \, med ell_s in cal(J)) phi.alt_s$. The family of these sums includes empty intervals and is finite for our finite packet collection. Let $cal(D) F = \( W \( partial_y - i eta_j \) F_j \)_j$.

#thm([Corollary 3.6.])[
  #emph[For every fixed $J_(*) > 0$ there are a fixed exponent $C_(upright("top"))$ and a measurable set $cal(X)_(upright("top"))$ with $lr(|cal(X)_(upright("top"))|) lt.eq S e^(- J_(*) L)$ such that, for all tops $T$ and all $z in.not cal(X)_(upright("top"))$, 
#[#set math.equation(numbering: n => "(3.17)")
 $ sup_(cal(J)) med sup_(lr(||) v lt.eq W) (∥F_(T \, cal(J)) \( z + \( 0 \, v \) \)∥_(cal(H)) + ∥cal(D) F_(T \, cal(J)) \( z + \( 0 \, v \) \)∥_(cal(H))) lt.eq L^(C_(upright("top"))) #scale(x: 120%, y: 120%)[\(] h_T^(\( 1 \)) \( z \) #scale(x: 120%, y: 120%)[\)]^8 . $ <eq:src-11>]

 Independently of this exceptional set, for every $z$, every $l_(*) > 0$, and every interval $cal(J) subset \[ l_(*) \, oo \)$, 
#[#set math.equation(numbering: n => "(3.18)")
 $ ∥\( partial_x + s_T partial_y \) F_(T \, cal(J)) \( z \)∥_(cal(H)) lt.eq L^(C_(upright("top"))) / l_(*) #scale(x: 120%, y: 120%)[\(] h_T^(\( 1 \)) \( z \) #scale(x: 120%, y: 120%)[\)]^8 . $ <conc:top-horizontal-derivative>]

 All packet orders, $K_1$, and $C_(upright("top"))$ can be fixed before $A$; they are independent of the later mass cutoff and hierarchy depth.]
] <conc:top-good>

#proof[
  Use 27 on assigned top tiles, with $t = s_T$ and $l = l_T$. These satisfy (3.1) with a fixed angular constant. Write $X = \( x - x_T \) \/ l_T$ and $Y = \( Y_(s_T) \( z \) - Y_(s_T) \( z_T \) \) \/ W$. For a sufficiently large fixed integer $q$, let
  $ P_T \( z \) = (1 + frac(X^2 + Y^2, K_1^2))^q . $
  Its product with any assigned wave is bounded by a slower fixed tile envelope with uniform constants. Indeed at the centers $X \, Y$ are bounded by a fixed fraction of $K_1$, and in moving away from a center the top scales are no smaller than the corresponding tile scales. The same statement holds for the fixed derivatives in use. Multiplication by $P_T$ preserves spectrum. Applying the last observation after 27 gives a uniform polynomial moment bound on every length-$l_T$ interval of every parallel line for $sup_(cal(J)) ∥P_T F_(T \, cal(J))∥$ and $sup_(cal(J)) ∥P_T cal(D) F_(T \, cal(J))∥$.
  We justify the required vertical neighborhood supremum. Demodulate component $j$ by $e^(- i eta_j Y_(s_T))$. Each of the just described weighted sums has vertical Fourier support in $\[ - C \/ W \, C \/ W \]$. Choose one Schwartz reproduction kernel $K_W$ with Fourier transform one on that interval. Its absolute values at all arguments shifted by at most $W$ are bounded by $C_n W^(- 1) \( 1 + lr(||) y \/ W \)^(- n)$. Reproduction, the Hilbert norm inequality, and the supremum over $cal(J)$ show that its vertical neighborhood supremum is bounded by convolution of the corresponding unshifted supremum with this positive integrable kernel. Minkowski in normalized $L^b$ on horizontal intervals preserves the uniform moment estimate. Finally $P_T \( z + \( 0 \, v \) \) asymp P_T \( z \)$ for $lr(||) v lt.eq W$, uniformly in $z$, because $K_1 gt.eq 1$. We have therefore proved, on every top-scale box, polynomial moments for $P_T$ times the entire left side of (3.17).
  For clarity, this yields a global exceptional-area bound, not merely one inside the top box. Partition the plane into boxes of dimensions $l_T times W$, indexed by $\( a \, b \) in bb(Z)^2$. On each such box, $1 + "dist"_T \/ K_1 asymp 1 + \( lr(||) a + lr(||) b \) \/ K_1$. Choose $q$ with $2 q > 8 D_2 + 4$. If the left side of (3.17) exceeds its right side in that box, its product with $P_T$ exceeds
  $ c L^(C_(upright("top"))) #scale(x: 120%, y: 120%)[\(] 1 + \( lr(||) a + lr(||) b \) \/ K_1 #scale(x: 120%, y: 120%)[\)]^(2 q - 8 D_2) . $
  Take moment order $b_L = ceil.l L ceil.r$. The available moment bound is at most a fixed power of $L$, since $1 + log B$ is such a power. Choose $C_(upright("top"))$ larger by a fixed amount. Markov’s inequality and summation over $\( a \, b \)$ then give
  $ lr(|cal(X)_T|) lt.eq C lr(|R_T|) K_1^2 e^(- \( J_(*) + 1 \) L) lt.eq lr(|R_T|) e^(- J_(*) L) $
  for sufficiently large $L$, after increasing the threshold exponent or the fixed lower bound on $L$. Equivalently one can first arrange $e^(- \( J_(*) + 2 \) L)$ to absorb the polynomial $K_1^2$. Taking the union over tops proves the asserted bound by $S = sum_T lr(|R_T|)$. This argument uses fixed $q$ and fixed packet orders, even though the moment order grows with $L$.
  For (3.18), coefficient norms are bounded, there are boundedly many assigned labels per scale, and each differentiated wave has a bound $C ell_s^(- 1)$ times a fixed tile envelope in slope $s_T$. At a fixed scale, summing this envelope over assigned centers is at most $C ell_s^(- 1) \( 1 + "dist"_T \/ K_1 \)^(- 8 D_2)$. To see the decay, multiply by the inverse top factor, absorb it into a slower tile envelope as for $P_T$, and use bounded lattice overlap. Summing over $ell_s gt.eq l_(*)$ costs $sum_(ell gt.eq l_(*)) ell^(- 1) lt.eq C \/ l_(*)$. The same bound applies to any interval of these lengths by the triangle inequality. This proves the unconditional derivative estimate and completes the corollary. ◻
]

=== 3.5 The masked sum and the count threshold <the-masked-sum-and-the-count-threshold>

The choice of $A$ in the preceding section can now be completed. Its dependence on the fixed constants just obtained is allowed; their construction did not depend on $A$.

#thm([Proposition 3.7.])[
  #emph[Given any fixed $H > 0$, choose $A$ sufficiently large after $K_1$ and $C_(upright("top"))$, and then choose a sufficiently large fixed count threshold exponent $C_n$. There is a measurable set $F_(upright("conc")) subset F$ such that 
$ lr(|F \\ F_(upright("conc"))|) lt.eq L^(- H) lr(||) F \, #h(2em) integral_(F_(upright("conc"))) ∥P - P_q∥_(cal(H)) lt.eq L^(- H) N lr(||) F \, #h(2em) P_q = sum_s q_(T \( s \)) phi.alt_s \, $

 and (3.17) holds there for every top. On this set, 
#[#set math.equation(numbering: n => "(3.19)")
 $ n \( z \) = sum_T h_T \( z \) lt.eq N L^(C_n) . $ <eq:src-12>]

 One has $K_0 = L^(A + 2) > K_1$, so both (3.17) and (3.18) also hold with $h_T$ in place of $h_T^(\( 1 \))$.]
] <conc:mask-removal>

#proof[
  First fix, for example, $J_(*) = 10$ in 28, and fix the resulting $C_(upright("top"))$ before making any choice of $A$. Its exceptional area is smaller than any prescribed fixed inverse power of $L$ times $lr(||) F$, since $S \/ lr(||) F lt.eq L^C N^2 lt.eq L^C e^(4 L)$. On $"dist"_T lt.eq L^(A \/ 2)$, the elementary estimate for the mask is $lr(|1 - q_T|) lt.eq C L^(1 - A)$: use $lr(|1 - "sinc" v|) lt.eq C v^2$ near zero and the integer power $2 ceil.l L ceil.r$ in (2.43). Outside this region, $lr(|1 - q_T|) lt.eq 2$, whereas
  $ #scale(x: 120%, y: 120%)[\(] h_T^(\( 1 \)) #scale(x: 120%, y: 120%)[\)]^7 lt.eq C L^(- 7 D_2 \( A \/ 2 - A_1 \)) . $
  Equation (3.17), with the full length interval, therefore implies outside $cal(X)_(upright("top"))$ that, for any prescribed fixed $H_1$,
  #[#set math.equation(numbering: n => "(3.20)")
   $ ∥P - P_q∥ lt.eq L^(- H_1) sum_T h_T^(\( 1 \)) $ <conc:mask-pointwise>]
  once $A$ is chosen large enough. In the near region the factor $L^(C_(upright("top")) + 1 - A)$ suffices; in the far region use the displayed seventh power to reduce $\( h_T^(\( 1 \)) \)^8$ to $h_T^(\( 1 \))$.
  Apply (2.34) with dilation $K_1$ to $n_1 = sum_T h_T^(\( 1 \))$. For any finite-measure set $A_0$ in the testing domain, weak $L^2$ and layer cake imply
  $ integral_(A_0) n_1 lt.eq 2 ∥n_1∥_(2 \, oo) lr(|A_0|)^(1 \/ 2) lt.eq L^C S^(1 \/ 2) lr(|A_0|)^(1 \/ 2) . $
  Since $S lt.eq L^C lr(||) E$ and $lr(||) E = N^2 lr(||) F$, choosing $H_1$ larger than $H$ by the fixed powers in these inequalities proves the claimed mask integral even when $A_0 = F \\ cal(X)_(upright("top"))$.
  After $A$ has been fixed, (2.34) with dilation $K_0$ gives
  $ lr(|{ z in F : n \( z \) > N L^(C_n) }|) lt.eq L^(C - 2 C_n) S \/ N^2 lt.eq L^(C - 2 C_n) lr(||) F . $
  Take $C_n$ sufficiently large and define $F_(upright("conc"))$ by deleting this set and $cal(X)_(upright("top"))$ from $F$. Increasing the fixed thresholds slightly makes the sum of their areas at most $L^(- H) lr(||) F$. This proves all assertions. ◻
]

The original adjoint estimate (2.3) gives $∥∥ P_2 lt.eq L^(C_P) lr(||) E^(1 \/ 2)$ for a fixed exponent $C_P$. Thus, by taking $H$ as large as required, any discarded set above has arbitrarily small prescribed polynomial pairing with the original $P$. The concentration estimates above hold for finite tile sets and scale ranges, with constants independent of their cardinalities. After the later assembly proves the uniform model bound for each finite form, the estimate passes to the convergent bilinear packet representation as in Proposition 1.14, Proposition 1.15.

=== 3.6 A simultaneous count of separated significant directions <count:section>

On the set $F_(upright("conc"))$ from 29, the weighted threshold (3.19) bounds the total top mass by $N L^(C_n)$. Because each significant top contributes at least one, this bounds their number by the same quantity, which may grow with $N$. For the later finite Fourier gain we need a bound polynomial in $L$ for significant directions that are $rho$-separated inside an interval of length $B rho$, with top precisions at most $rho \/ B^2$. We derive that bound from the popularity witnesses, simultaneously for every $rho > 0$ and every such list.

We retain the parameters and the finite family of tops from the preceding sections. In particular, every top has width $W = m w$, length $l_T lt.eq tau$, and precision $d_T = w \/ l_T$. Its witness satisfies

#[#set math.equation(numbering: n => "(3.21)")
 $ E_T subset L^(a_0) R_T \, #h(2em) \| E_T \| gt.eq L^(- a_0) l_T W \, #h(2em) \| u - s_T \| lt.eq c_0 d_T quad upright("on ") E_T \, $ <count:witness-data>]

where $a_0$ and $c_0$ are fixed constants; increasing $a_0$ absorbs the fixed constants in the first two bounds. The dilated box in (3.21) is understood in the coordinates of $R_T$. The sum of the top areas is $S = sum_T l_T W$. A top is significant at $z$ when $"dist"_T \( z \) lt.eq K_0$, with $K_0 = L^(A + 2)$ as before.

#thm([Proposition 3.8.])[
  #emph[There is a fixed exponent $C_D$ with the following property. For every fixed $J > 0$ and all sufficiently large $L$, there is a measurable set $cal(E)_(upright("count")) subset bb(R)^2$ such that 
#[#set math.equation(numbering: n => "(3.22)")
 $ \| cal(E)_(upright("count")) \| lt.eq S e^(- J L) . $ <count:exceptional-budget>]

 Define 
#[#set math.equation(numbering: n => "(3.23)")
 $ Z_0 = F_(upright("conc")) \\ cal(E)_(upright("count")) \, #h(2em) D = L^(C_D) . $ <count:good-set>]

 For every $z in Z_0$, every $rho > 0$, and every list $cal(L)$ of tops significant at $z$ satisfying 
#[#set math.equation(numbering: n => "(3.24)")
 $ & max_(T in cal(L)) s_T - min_(T in cal(L)) s_T lt.eq B rho \, #h(2em) d_T lt.eq rho \/ B^2 quad \( T in cal(L) \) \,\
 & \| s_T - s_(T') \| gt.eq rho quad \( T \, T' in cal(L) \, med T eq.not T' \) \, $ <count:list-hypotheses>]

 one has $\# cal(L) lt.eq D \/ 100$. The exponent $C_D$ depends only on the fixed geometric constants, including the already chosen mask exponent $A$. It is independent of the number of tops, the number of scales, and the bin Hilbert space.]
] <count:simultaneous>

The margin in the conclusion permits a fixed number of additional directions and fixed multiplicity factors in later applications, after increasing the absolute lower bound on $L$. The exceptional set will be constructed from one angular bin family for each reference top. It therefore applies to all $rho$ and all lists simultaneously.

We transfer the other tops’ popularity witnesses to a line in the direction of a longest top. Separated top directions then occupy distinct angular bins, and the following lemma bounds the number of bins each having a large average on some interval through the evaluation point. The reference top contributes one additional direction.

=== 3.7 A counting lemma on a line <a-counting-lemma-on-a-line>

The popular-bin counting argument is inspired by Bateman’s one-variable covering/BMO method #cite(label("Bateman2008Maximal")) Section 3.3.2, Lemmas 5–6. The moment estimate below is proved directly; the Lipschitz transfer to reference lines and the simultaneous multiresolution formulation are established here, rather than imported from Bateman’s maximal theorem.

#thm([Lemma 3.9.])[
  #emph[Let $\( f_b \)_(b in cal(B))$ be a countable family of measurable functions on $bb(R)$ such that $0 lt.eq f_b lt.eq 1$ and $sum_b f_b lt.eq C_0$, where $C_0 gt.eq 1$. Fix $H > 0$ and $0 < theta.alt lt.eq 1$. There is a measurable function $cal(N) : bb(R) arrow.r \[ 0 \, oo \]$ with the following properties. If $cal(B)_x$ is any collection of distinct indices such that, for every $b in cal(B)_x$, some interval $I_b$ containing $x$ satisfies 
#[#set math.equation(numbering: n => "(3.25)")
 $ 0 < \| I_b \| lt.eq H \, #h(2em) \| I_b \|^(- 1) integral_(I_b) f_b gt.eq theta.alt \, $ <count:line-average>]

 then $\# cal(B)_x lt.eq cal(N) \( x \)$. Moreover, for every bounded interval $U$ and every $lambda gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.26)")
 $ \| { x in U : cal(N) \( x \) > lambda } \| lt.eq C \( \| U \| + H \) exp \( - c theta.alt lambda \/ C_0 \) \, $ <count:line-tail>]

 where $C \, c > 0$ are absolute. If the $f_b$ depend jointly measurably on an additional parameter, $cal(N)$ can be chosen jointly measurable in that parameter and $x$.]
] <count:line-lemma>

#proof[
  For $t in { 0 \, 1 \/ 3 \, 2 \/ 3 }$ use the dyadic grid whose intervals of length $2^k$ are
  $ cal(D)_k^t = { 2^k \[ j + \( - 1 \)^k t \, j + 1 + \( - 1 \)^k t \) : j in bb(Z) } . $
  These grids are nested: a boundary at scale $k + 1$ is a boundary at scale $k$ because $3 t$ is an integer. At a fixed scale their combined boundary points have spacing $2^k \/ 3$. Given an interval $I$ of positive finite length, choose the least integer $k$ with $2^k > 3 \| I \|$. Its closure meets boundary points from at most one of the three grids. Hence $I$ is contained in an interval $Q$ from one of the other grids, and $\| Q \| lt.eq 6 \| I \|$.
  Choose an integer $k_H$ with $6 H lt.eq 2^(k_H) < 12 H$, and in each grid retain only scales $k lt.eq k_H$. Put $beta = theta.alt \/ 6$. For each $b$ and each grid, call $Q$ bad if
  $ \| Q \|^(- 1) integral_Q f_b gt.eq beta . $
  Let $cal(J)_b^t$ be the intervals maximal under inclusion among these bad intervals. Every bad interval is contained in a maximal one, since it has only finitely many ancestors up to level $k_H$. For fixed $b \, t$, the members of $cal(J)_b^t$ are pairwise disjoint. Define
  $ cal(N)_t \( x \) = sum_(b in cal(B)) sum_(Q in cal(J)_b^t) upright(bold(1))_Q \( x \) \, #h(2em) cal(N) \( x \) = sum_(t in { 0 \, 1 \/ 3 \, 2 \/ 3 }) cal(N)_t \( x \) . $
  Each interval in (3.25) produces a bad dyadic interval containing $x$, at an allowed scale. Thus each distinct index in $cal(B)_x$ contributes at least once to $cal(N) \( x \)$.
  For every dyadic interval $P$ at an allowed scale, disjointness within each bin gives the Carleson estimate
  #[#set math.equation(numbering: n => "(3.27)")
   $ sum_b sum_(Q in cal(J)_b^t\
Q subset.eq P) \| Q \| & lt.eq beta^(- 1) sum_b sum_(Q in cal(J)_b^t\
Q subset.eq P) integral_Q f_b\
 & lt.eq beta^(- 1) integral_P sum_b f_b lt.eq cal(A) \| P \| \, #h(2em) cal(A) = C_0 \/ beta . $ <count:carleson>]
  All sums here are of nonnegative terms, so this argument also applies to countably many bins and intervals.
  For completeness, (3.27) has an elementary exponential-tail consequence. Fix a root interval $P_0$ of length $2^(k_H)$. First take any finite subfamily of the selected interval occurrences inside $P_0$, retaining multiplicities when different bins select the same interval, and let $V$ count that subfamily. For an integer $r gt.eq 1$, expansion of $V^r$ and the nesting of intersecting dyadic intervals give
  #[#set math.equation(numbering: n => "(3.28)")
   $ integral_(P_0) V^r lt.eq r ! sum_(Q_1 supset.eq dots.h.c supset.eq Q_r) \| Q_r \| lt.eq r ! cal(A)^r \| P_0 \| . $ <count:moment>]
  The chain sum counts occurrences with their multiplicities. To obtain the second inequality, sum first over $Q_r subset.eq Q_(r - 1)$ and apply (3.27); repeat until the remaining sum is bounded by $cal(A) \| P_0 \|$. Repeated intervals are allowed throughout. Ordering the $r$ occurrences accounts for the factor $r !$ and can only overcount.
  Enumerate all selected occurrences inside $P_0$. Their finite initial sums increase to $cal(N)_t$ on $P_0$, so monotone convergence and (3.28) show
  #[#set math.equation(numbering: n => "(3.29)")
   $ integral_(P_0) exp \( cal(N)_t \/ \( 2 cal(A) \) \) lt.eq sum_(r = 0)^oo 2^(- r) \| P_0 \| = 2 \| P_0 \| . $ <count:exponential-moment>]
  In particular the count is finite almost everywhere. Markov’s inequality bounds its superlevel measure in $P_0$ by $2 \| P_0 \| exp \( - lambda \/ \( 2 cal(A) \) \)$. The root intervals of one grid meeting $U$ have total length at most $\| U \| + 2^(k_H + 1)$. Sum the root estimates and observe that $cal(N) > lambda$ implies $cal(N)_t > lambda \/ 3$ for at least one grid. Since $cal(A) = 6 C_0 \/ theta.alt$ and $2^(k_H) < 12 H$, this proves (3.26).
  There are countably many bins and dyadic intervals. For each fixed interval its badness is determined by a measurable integral. Its maximality adds only finitely many conditions on its ancestors before level $k_H$. Consequently the displayed count is measurable. The same argument, using measurability of integrals with a parameter, proves the final assertion. No maximality selection or exceptional set depending on an uncountable family of intervals is required. ◻
]

=== 3.8 Transferring witnesses to a reference line <transferring-witnesses-to-a-reference-line>

Fix a top $R$. We use the coordinates

$ z = \( x \, y_R + s_R \( x - x_R \) + v \) . $

The significant region of $R$ is contained in

#[#set math.equation(numbering: n => "(3.30)")
 $ cal(Q)_R = { \| x - x_R \| lt.eq K_0 l_R \, med \| v \| lt.eq K_0 W } . $ <count:reference-box>]

The coordinate change $\( x \, v \) mapsto z$ has Jacobian one.

For each integer $h$, partition each of the two angular annuli

$ \[ s_R + 2^h \, s_R + 2^(h + 1) \) \, #h(2em) \( s_R - 2^(h + 1) \, s_R - 2^h \] $

into $B^2$ intervals of length $delta_h = 2^h \/ B^2$. Here $B$ is a dyadic integer, as stipulated in its definition. Denote this countable family of base intervals by $cal(B)_R$. Enlarge every base interval concentrically by a fixed factor $c_1$, chosen below, and write $b^(+)$ for the resulting closed interval. For sufficiently large $L$, and hence $B$, these enlarged intervals satisfy

#[#set math.equation(numbering: n => "(3.31)")
 $ sum_(b in cal(B)_R) upright(bold(1))_(b^(+)) \( a \) lt.eq C_(upright("bin")) #h(2em) \( a in bb(R) \) \, $ <count:bin-overlap>]

with a fixed $C_(upright("bin"))$. Indeed, enlargement moves an endpoint by at most $c_1 2^h \/ B^2$. Once $B^2 gt.eq 4 c_1$, an enlarged interval from annulus $h$ stays at distance comparable to $2^h$ from $s_R$. A point therefore meets only a fixed number of annuli, and at most a fixed number, depending on $c_1$, of the enlarged equal-length intervals in each such annulus.

Choose a fixed power $P_L = L^(a_1)$ sufficiently large to dominate the dilation constants in (3.21), $K_0$, and their fixed multiples. It will not depend on $R$ or on a list. Replacing a witness for this argument by a compact subset $tilde(E)_T subset E_T$ of at least half its measure is permitted by inner regularity. The slope condition can first be enforced after deleting a null subset if necessary. The horizontal projection $A_T$ of $tilde(E)_T$ is compact, and Fubini’s theorem gives

#[#set math.equation(numbering: n => "(3.32)")
 $ \| A_T \| gt.eq frac(\| tilde(E)_T \|, 2 L^(a_0) W) gt.eq 1 / 4 L^(- 2 a_0) l_T . $ <count:projection-size>]

The denominator bounds the length of each vertical section of the dilated witness box. The original witnesses themselves remain unchanged elsewhere in the proof.

Suppose now that a list satisfies (3.24) at $z$, and choose $R$ from the list with maximal length. If the list is empty there is nothing to prove. For $T eq.not R$ put $Delta_T = \| s_T - s_R \|$. Then

#[#set math.equation(numbering: n => "(3.33)")
 $ rho lt.eq Delta_T lt.eq B rho \, #h(2em) d_T lt.eq Delta_T \/ B^2 \, #h(2em) l_T lt.eq l_R lt.eq tau . $ <count:relative-precision>]

There is an interval $I_T$ containing both $A_T$ and the horizontal coordinate $x$ of $z$ with

#[#set math.equation(numbering: n => "(3.34)")
 $ \| I_T \| lt.eq 2 P_L l_T lt.eq 2 P_L l_R . $ <count:witness-interval>]

For example use the interval centered at $x_T$ of radius $P_L l_T$; significance gives $\| x - x_T \| lt.eq K_0 l_T$.

For $x' in A_T$, take any $\( x' \, y' \) in tilde(E)_T$, and let $z' = \( x' \, y + s_R \( x' - x \) \)$ be the point with horizontal coordinate $x'$ on the reference line through $z$. The top-coordinate representations of the witness point and $z$ give

#[#set math.equation(numbering: n => "(3.35)")
 $ \| y' - \( y + s_R \( x' - x \) \) \| lt.eq P_L #scale(x: 120%, y: 120%)[\(] W + l_T Delta_T #scale(x: 120%, y: 120%)[\)] . $ <count:vertical-distance>]

This bound holds for every possible witness point above $x'$, so no measurable choice of such points is needed. By the Lipschitz bound on $u$,

#[#set math.equation(numbering: n => "(3.36)")
 $ \| u \( z' \) - s_T \| lt.eq c_0 d_T + "Lip" \( u \) P_L #scale(x: 120%, y: 120%)[\(] W + l_T Delta_T #scale(x: 120%, y: 120%)[\)] . $ <count:transferred-error>]

The parameter choices ensure

#[#set math.equation(numbering: n => "(3.37)")
 $ "Lip" \( u \) P_L m tau lt.eq B^(- 100) \, #h(2em) B^2 lt.eq m $ <count:small-time>]

for sufficiently large $L$. To check the first assertion, $log \( P_L m tau \) = - L^0.97 + O \( L^0.9 + log L \)$, whereas $log B = O \( L^0.7 \( log L \)^2 \)$; the fixed Lipschitz constant does not affect this comparison. Since $W = m l_T d_T lt.eq m tau Delta_T \/ B^2$, the last two terms in (3.36) are at most

$ #scale(x: 120%, y: 120%)[\(] "Lip" \( u \) P_L m tau + "Lip" \( u \) P_L tau B^2 #scale(x: 120%, y: 120%)[\)] Delta_T / B^2 lt.eq 2 B^(- 100) Delta_T / B^2 . $

Consequently the transferred error is bounded by $\( c_0 + 1 \) Delta_T \/ B^2$.

Let $b \( T \)$ be the unique base interval containing $s_T$. If its annulus index is $h$, then $2^h lt.eq Delta_T < 2^(h + 1)$. Choose $c_1$ large enough in terms of $c_0$ so that every point within $2 \( c_0 + 1 \) delta_h$ of any point of a base interval lies in its enlargement. Equations (3.36) and (3.37) now show

$ u \( z' \) in b \( T \)^(+) #h(2em) \( x' in A_T \) . $

Define, on every reference line, the bin functions

#[#set math.equation(numbering: n => "(3.38)")
 $ f_(R \, b) \( x' \, v \) = upright(bold(1))_(b^(+)) #scale(x: 120%, y: 120%)[\(] u \( x' \, y_R + s_R \( x' - x_R \) + v \) #scale(x: 120%, y: 120%)[\)] . $ <count:line-bin-functions>]

They are jointly measurable, and their sum is bounded by $C_(upright("bin"))$ by (3.31). Combining (3.32) and (3.34), there is a fixed exponent $a_2$ such that, with $theta.alt = L^(- a_2)$,

#[#set math.equation(numbering: n => "(3.39)")
 $ frac(1, \| I_T \|) integral_(I_T) f_(R \, b \( T \)) \( x' \, v \) thin thin upright(d) x' gt.eq theta.alt . $ <count:popular-line-bin>]

For example any fixed $a_2 > 2 a_0 + a_1$ suffices once $L$ is large. All choices so far precede the eventual choice of $D$.

The base intervals $b \( T \)$ for $T in cal(L) \\ { R }$ are distinct. Indeed, any one such interval has length $2^h \/ B^2 lt.eq Delta_T \/ B^2 lt.eq rho \/ B < rho$, so it cannot contain two directions from a $rho$-separated list.

=== 3.9 The common exceptional set and the choice of $D$ <the-common-exceptional-set-and-the-choice-of-d>

Apply 31 to the full family (3.38), with

$ H_R = 2 P_L l_R \, #h(2em) theta.alt = L^(- a_2) \, #h(2em) C_0 = C_(upright("bin")) . $

Write $cal(N)_R \( x \, v \)$ for its jointly measurable count. This construction depends on $R$ but on neither $rho$ nor a list. Whenever $R$ is a longest member of an admissible list at $z = \( x \, y_R + s_R \( x - x_R \) + v \)$, the preceding argument gives

#[#set math.equation(numbering: n => "(3.40)")
 $ \# cal(L) lt.eq 1 + cal(N)_R \( x \, v \) . $ <count:list-by-one-count>]

Use the threshold $Lambda_(upright("count")) = L^(a_2 + 2)$ and let

$ cal(E)_R = { z in cal(Q)_R : cal(N)_R \( x \, v \) > Lambda_(upright("count")) } . $

In (3.26), take $U = \[ x_R - K_0 l_R \, x_R + K_0 l_R \]$. Since $P_L$ dominates $K_0$, that estimate gives, for each $v$,

$ \| { x in U : cal(N)_R \( x \, v \) > Lambda_(upright("count")) } \| lt.eq C P_L l_R e^(- c L^2) . $

Integrating over $\| v \| lt.eq K_0 W$ and using the Jacobian-one coordinates yields

#[#set math.equation(numbering: n => "(3.41)")
 $ \| cal(E)_R \| lt.eq C P_L K_0 l_R W e^(- c L^2) . $ <count:one-top-exception>]

In particular, for every fixed $J > 0$, the right-hand side is at most $e^(- J L) l_R W$ for sufficiently large $L$, because $P_L K_0$ is a fixed power of $L$.

Set $cal(E)_(upright("count")) = union.big_R cal(E)_R$. The top family is finite, and the sets are measurable. Summing (3.41) proves (3.22). The same proof applies to any countable family with finite area sum by countable subadditivity. The angular families were already countable, and their finite approximations were handled in the proof of 31; thus no cardinality or depth factor is introduced by a limiting operation.

Choose

#[#set math.equation(numbering: n => "(3.42)")
 $ C_D = a_2 + 4 \, #h(2em) D = L^(C_D) . $ <count:choice-D>]

At a point outside $cal(E)_(upright("count"))$, a longest member $R$ of any nonempty admissible list is significant, so the point lies in $cal(Q)_R$ and $cal(N)_R lt.eq Lambda_(upright("count"))$ there. Equation (3.40) gives $\# cal(L) lt.eq 1 + L^(a_2 + 2) lt.eq D \/ 100$ for sufficiently large $L$. This proves 30.

Finally, this additional discard is permissible in the original adjoint pairing. The ordinary model estimate gives $∥P∥_2 lt.eq L^C sqrt(\| E \|)$, and $S lt.eq L^C \| E \|$. Consequently

#[#set math.equation(numbering: n => "(3.43)")
 $ integral_(F_(upright("conc")) \\ Z_0) ∥P∥ lt.eq L^C \| E \| e^(- J L \/ 2) lt.eq L^C e^(\( 2 - J \/ 2 \) L) thin N \| F \| \, $ <count:discard-cost>]

where the last inequality uses $\| E \| = N^2 \| F \|$ and $N lt.eq e^(2 L)$. Taking, for example, any fixed $J > 4$ makes this smaller than any prescribed inverse power of $L$ times $N \| F \|$, after increasing the absolute lower bound on $L$. The estimates (3.17) and (3.19), together with the already established mask replacement, continue to hold on $Z_0 subset F_(upright("conc"))$.

== 4 A strict finite Fourier inequality with constant one <phase:section>

The next estimate improves the sequence exponent in the usual finite Fourier bound while keeping the operator norm at most one. Keeping this constant prevents a fixed loss from accumulating over the levels of the angular hierarchy. The distinction between a dominant coefficient and a strict norm deficit is related to the study of near-extremizers for discrete Young and Hausdorff–Young inequalities. Relevant precedents include Fournier’s work on sharpness, the fourth-moment case of Eisner and Tao, and the quantitative discrete results of Charalambides and Christ #cite(label("Fournier1977")) #cite(label("EisnerTao2012")) #cite(label("CharalambidesChrist2011")). Here the frequencies are arbitrary separated real numbers and the averaging probability is specified by its Fourier support. We prove the needed quantitative gap in that setting, including the exact constant one after the coefficient exponent is improved.

Throughout this section the Fourier transform of a finite measure is $hat(nu) \( omega \) = integral e^(- i omega t) thin thin upright(d) nu \( t \)$.

Fix the absolute constants

#[#set math.equation(numbering: n => "(4.1)")
 $ epsilon.alt_0 = 1 / 4 \, #h(2em) kappa_0 = 2^(- 10) \, #h(2em) c_(upright("ph")) = 2^(- 60) . $ <phase:absolute-constants>]

For the bound $D gt.eq 1$ from the preceding section and for $p gt.eq 4$, put

#[#set math.equation(numbering: n => "(4.2)")
 $ alpha = 2 + frac(c_(upright("ph")), log \( 2 D \)) \, #h(2em) mu = frac(alpha - 1, p) \, #h(2em) r_(*) = frac(1, 1 - mu) . $ <phase:parameters>]

In particular, $2 < alpha < 7 \/ 3$, $0 < mu < 1 \/ 3$, and $1 < r_(*) lt.eq 3 \/ 2$. The numerical values in (4.1) are convenient fixed choices satisfying the estimates below.

#thm([Proposition 4.1.])[
  (Finite Fourier gain).  #emph[Let $lambda_1 \, dots.h \, lambda_d in bb(R)$, where $d lt.eq D$, satisfy $lr(|lambda_i - lambda_j|) gt.eq Delta > 0$ for $i eq.not j$. Let $nu$ be any positive probability measure on $bb(R)$ such that $"supp" hat(nu) subset \( - epsilon.alt_0 Delta \, epsilon.alt_0 Delta \)$. Then, for every finite $p gt.eq 4$ and every complex coefficient sequence, 
#[#set math.equation(numbering: n => "(4.3)")
 $ (integral_(bb(R)) lr(|sum_(i = 1)^d a_i e^(i lambda_i t)|)^p thin thin upright(d) nu \( t \))^(1 \/ p) lt.eq (sum_(i = 1)^d \| a_i \|^(r_(*)))^(1 \/ r_(*)) . $ <eq:src-13>]

 The same estimate holds for coefficients in a finite-dimensional Hilbert space $cal(H)$ when the exponentials act diagonally: in an orthonormal basis, the $xi$-th component may use frequencies $lambda_(i \, xi)$, provided they are $Delta$-separated as $i$ varies, for each fixed $xi$. The right side is then $\( sum_i ∥a_i∥_(cal(H))^(r_(*)) \)^(1 \/ r_(*))$. All these estimates have constant one.]
] <phase:finite-fourier>

We first prove a quantitative gap in the fourth moment when no coefficient dominates. The proof compares the law of three indices subject to an approximate additive relation with the independent triple law; separated lower and upper quantiles force a definite difference between these laws. We then handle a dominant coefficient directly, interpolate, and pass to Hilbert-valued coefficients.

#thm([Lemma 4.2.])[
  (A quantitative gap away from a single coefficient).  #emph[For a separated frequency list as above, define 
$ cal(Q) = { \( i \, j \, k \, l \) : \| lambda_i + lambda_j - lambda_k - lambda_l \| < epsilon.alt_0 Delta } . $

 Let $x_i gt.eq 0$, $sum_i x_i = 1$, and put 
$ Q \( x \) = sum_(\( i \, j \, k \, l \) in cal(Q)) \( x_i x_j x_k x_l \)^(3 \/ 4) . $

 Then $Q \( x \) lt.eq 1$. If $0 < kappa < 1$ and $max_i x_i lt.eq 1 - kappa$, then 
#[#set math.equation(numbering: n => "(4.4)")
 $ Q \( x \) lt.eq 1 - delta_kappa \, #h(2em) delta_kappa = frac(kappa^4 \( 1 - kappa \/ 2 \)^2, 4096) gt.eq 2^(- 14) kappa^4 . $ <phase:quantitative-gap>]

]
] <phase:quantile-gap>

#proof[
  Any three specified indices have at most one completion to an element of $cal(Q)$: two possible missing frequencies would be within $2 epsilon.alt_0 Delta < Delta$ of each other. On the finite set of quadruples, consider the four nonnegative measures
  $ A = x_i x_j x_k upright(bold(1))_(cal(Q)) \, quad B = x_i x_k x_l upright(bold(1))_(cal(Q)) \, quad C = x_i x_j x_l upright(bold(1))_(cal(Q)) \, quad E = x_j x_k x_l upright(bold(1))_(cal(Q)) . $
  Each has total mass at most one, by unique completion. Their pointwise geometric mean is the summand defining $Q \( x \)$, so Hölder’s inequality already gives $Q \( x \) lt.eq 1$.
  For nonnegative measures on a finite set write $sans(H) \( f \, g \) = sum sqrt(f g)$ for their Hellinger affinity. Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ Q \( x \) lt.eq #scale(x: 120%, y: 120%)[\(] sans(H) \( A \, B \) sans(H) \( C \, E \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq sans(H) \( A \, B \)^(1 \/ 2) . $ <phase:affinity-lower-bound>]
  Project $A$ to the three coordinates $\( i \, k \, l \)$, obtaining a measure $P$ of mass at most one, and let $P_0 \( i \, k \, l \) = x_i x_k x_l$ be the independent triple law. For each $\( i \, k \, l \)$ there is at most one completing $j$. Consequently
  #[#set math.equation(numbering: n => "(4.6)")
   $ sans(H) \( P \, P_0 \) = sans(H) \( A \, B \) gt.eq Q \( x \)^2 . $ <phase:projected-affinity>]
  This identity also holds when a factor $x_i$, $x_k$, or $x_l$ vanishes, since the corresponding terms on both sides are zero.
  Adjoin one point to the triple space and place the missing mass of $P$ there, giving a probability $P^(+)$. Extend $P_0$ by zero at that point. For any two probabilities $U \, V$,
  $ 1 / 2 sum \| U - V \| lt.eq 1 / 2 (sum \( sqrt(U) - sqrt(V) \)^2)^(1 \/ 2) (sum \( sqrt(U) + sqrt(V) \)^2)^(1 \/ 2) = sqrt(1 - sans(H) \( U \, V \)^2) . $
  Every event $cal(A)$ in the triple space therefore satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ P_0 \( cal(A) \) - P \( cal(A) \) lt.eq sqrt(1 - sans(H) \( P \, P_0 \)^2) lt.eq sqrt(1 - Q \( x \)^4) . $ <phase:event-deficit-upper>]
  Thus a fourth moment close to the ordinary bound would force the completed triple law close to the independent law, quantitatively and without a factor depending on the number of frequencies.
  Let $X$ be a random frequency with probabilities $x_i$. Choose lower and upper $kappa \/ 4$-quantile frequencies $a \, b$, so that
  $ Pr \( X lt.eq a \) \, Pr \( X gt.eq b \) gt.eq kappa \/ 4 \, #h(2em) Pr \( X < a \) \, Pr \( X > b \) lt.eq kappa \/ 4 . $
  They can be chosen with $a lt.eq b$. If $a = b$, that atom would have mass at least $1 - kappa \/ 2 > 1 - kappa$, a contradiction. Hence $b - a gt.eq Delta$, and $\[ a \, b \]$ has mass at least $1 - kappa \/ 2$. Of its two closed halves, choose one, denoted $\[ e \, h \]$, with mass at least $\( 1 - kappa \/ 2 \) \/ 2$.
  Consider the triple event
  $ cal(A) = { lambda_i gt.eq b \, med lambda_k lt.eq a \, med lambda_l lt.eq h } . $
  For any completion in $cal(Q)$ with these pair restrictions,
  $ lambda_l - lambda_j > lambda_i - lambda_k - epsilon.alt_0 Delta gt.eq b - a - epsilon.alt_0 Delta > \( b - a \) \/ 2 = h - e . $
  Thus $lambda_l lt.eq h$ forces $lambda_j < e$. Under the measure $A$, the free coordinates $\( i \, j \, k \)$ carry their independent probabilities, with a possible deletion when no completion exists. It follows that
  $ P \( cal(A) \) lt.eq Pr \( X gt.eq b \) Pr \( X lt.eq a \) Pr \( X < e \) \, $
  whereas
  $ P_0 \( cal(A) \) = Pr \( X gt.eq b \) Pr \( X lt.eq a \) Pr \( X lt.eq h \) . $
  Their difference is at least
  $ g_kappa = \( kappa \/ 4 \)^2 frac(1 - kappa \/ 2, 2) = frac(kappa^2 \( 1 - kappa \/ 2 \), 32) . $
  Combining this with (4.7) gives $Q \( x \)^4 lt.eq 1 - g_kappa^2$. Since $\( 1 - t \)^(1 \/ 4) lt.eq 1 - t \/ 4$ for $0 lt.eq t lt.eq 1$, $Q \( x \) lt.eq 1 - g_kappa^2 \/ 4$. This is (4.4). ◻
]

#proof[
  #emph[The ordinary fourth-moment bound.] Write $T a \( t \) = sum_i a_i e^(i lambda_i t)$ and $s = 4 \/ 3$. The Fourier support hypothesis and positivity of $nu$ give
  $ integral \| T a \|^4 thin thin upright(d) nu lt.eq sum_(cal(Q)) \| a_i a_j a_k a_l \| . $
  Indeed every other term in the fourth-power expansion averages to zero, and the absolute value of every surviving Fourier coefficient is at most one. If $∥∥ a_(ell^s) = 1$, the last sum is $Q \( x \)$ for $x_i = \| a_i \|^s$. Thus 33 proves the ordinary norm-one bound
  #[#set math.equation(numbering: n => "(4.8)")
   $ ∥T a∥_(L^4 \( nu \)) lt.eq ∥∥ a_(ell^(4 \/ 3)) . $ <phase:ordinary-fourth>]
  For the improved bound at four, put
  $ theta = frac(c_(upright("ph")), log \( 2 D \)) \, #h(2em) r_4 = frac(4, 3 - theta) . $
  Then $4 \/ 3 < r_4 lt.eq 3 \/ 2$ and
  #[#set math.equation(numbering: n => "(4.9)")
   $ ∥∥ a_(ell^(4 \/ 3)) lt.eq D^(theta \/ 4) ∥∥ a_(ell^(r_4)) \, #h(2em) D^theta lt.eq e^(c_(upright("ph"))) . $ <phase:exponent-comparison>]
  #emph[No dominant coefficient.] For a nonzero sequence, normalize $x_i = \| a_i \|^(4 \/ 3) \/ sum_k \| a_k \|^(4 \/ 3)$. If $max_i x_i lt.eq 1 - kappa_0$, (4.4) and (4.9) yield
  $ ∥T a∥_(L^4 \( nu \))^4 lt.eq \( 1 - delta_(kappa_0) \) e^(c_(upright("ph"))) ∥∥ a_(ell^(r_4))^4 lt.eq ∥∥ a_(ell^(r_4))^4 . $
  Here $delta_(kappa_0) gt.eq 2^(- 54) > c_(upright("ph"))$, and $1 - delta lt.eq e^(- delta)$.
  #emph[A dominant coefficient.] Suppose instead that one coefficient has normalized mass exceeding $1 - kappa_0$. Divide all coefficients by that coefficient and remove its carrier from $T a$. The normalized sum is $1 + U \( t \)$, and, if $b$ denotes the $ell^(r_4)$ norm of the other coefficients,
  #[#set math.equation(numbering: n => "(4.10)")
   $ b lt.eq (frac(kappa_0, 1 - kappa_0))^(3 \/ 4) < 1 / 64 . $ <phase:small-remainder>]
  Frequency separation gives the exact identities
  $ integral U thin thin upright(d) nu = 0 \, #h(2em) integral \| U \|^2 thin thin upright(d) nu = sum_(i eq.not i_0) \| a_i \/ a_(i_0) \|^2 lt.eq b^2 . $
  By (4.8) and (4.9), $integral \| U \|^4 thin thin upright(d) nu lt.eq e^(c_(upright("ph"))) b^4$, and hence $integral \| U \|^3 thin thin upright(d) nu lt.eq e^(c_(upright("ph")) \/ 2) b^3$. Expanding $\| 1 + U \|^4$, the linear term has mean zero. Bounding the remaining terms gives
  $ integral \| 1 + U \|^4 thin thin upright(d) nu & lt.eq 1 + 6 b^2 + 4 e^(c_(upright("ph")) \/ 2) b^3 + e^(c_(upright("ph"))) b^4\
 & lt.eq 1 + 14 b^2 lt.eq 1 + 8 / 3 b^(r_4) lt.eq \( 1 + b^(r_4) \)^(4 \/ r_4) . $
  For the penultimate inequality, use $b^(2 - r_4) lt.eq sqrt(b) lt.eq 1 \/ 8$; for the last one, use $4 \/ r_4 gt.eq 8 \/ 3$ and convexity. Restoring the dominant coefficient proves the norm-one $ell^(r_4)$-to-$L^4 \( nu \)$ estimate in this case too. The zero sequence is immediate.
  #emph[Interpolation with constant one.] The same operator has norm at most one from $ell^1$ to $L^oo \( nu \)$. For $0 < t lt.eq 1$, interpolation between these two bounds gives
  $ 1 / p_t = t / 4 \, #h(2em) 1 / r_t = 1 - t + t / r_4 . $
  One can see the normalization directly from the three-lines lemma #cite(label("Hajlasz2012")) Lemma 3.3, p. 57. For $∥∥ a_(ell^(r_t)) = ∥∥ g_(L^(p'_t) \( nu \)) = 1$, initially with $g$ simple, interpolate their nonzero magnitudes by
  $ a_i \( z \) = "sgn" \( a_i \) \| a_i \|^(r_t \( 1 - z + z \/ r_4 \)) \, #h(2em) g \( z \) = "sgn" \( g \) \| g \|^(p'_t \( 1 - z + 3 z \/ 4 \)) . $
  Here $"sgn"$ denotes complex phase, and the phase of $g$ is chosen for a bilinear dual pairing. The zero values stay zero. On the two vertical boundaries, these functions have respective unit norms in $\( ell^1 \, L^1 \)$ and $\( ell^(r_4) \, L^(4 \/ 3) \)$. The analytic function $integral \( T a \( z \) \) g \( z \) thin thin upright(d) nu$ is thus bounded by one there and at $z = t$. Finite sums and simple functions justify analyticity and boundedness on the strip; density and duality remove the simplicity restriction. Taking $t = 4 \/ p$ gives
  $ 1 / r_t = 1 - frac(1 + theta, p) = 1 - frac(alpha - 1, p) \, $
  which is precisely $r_t = r_(*)$. This proves the scalar form of (4.3) for every finite $p gt.eq 4$.
  #emph[Hilbert-valued coefficients.] Finally write the Hilbert space as $ell^2$ in an orthonormal basis, and let $F_xi \( t \) = sum_i a_(i \, xi) e^(i lambda_(i \, xi) t)$. Minkowski’s inequality, the scalar result, and Minkowski’s inequality again give
  $ ∥∥ F_(L^p \( nu \; ell^2 \)) & lt.eq (sum_xi ∥F_xi∥_(L^p \( nu \))^2)^(1 \/ 2)\
 & lt.eq (sum_xi (sum_i \| a_(i \, xi) \|^(r_(*)))^(2 \/ r_(*)))^(1 \/ 2)\
 & lt.eq (sum_i (sum_xi \| a_(i \, xi) \|^2)^(r_(*) \/ 2))^(1 \/ r_(*)) . $
  The first inequality uses $p gt.eq 2$, and the last uses $r_(*) lt.eq 2$. Each has constant one and is independent of the Hilbert dimension. Only the frequency list within an individual component enters the scalar estimate, completing the proof. ◻
]

== 5 Angular hierarchy and predicted factors <hier:section>

We continue with the finite popular forest and the set $Z_0$ from 30, on which the top estimates, the bound (3.19), and the separated-top count hold. The parameters $p \, G \, K \, B$ are defined in (2.41), and $alpha \, mu \, r_(*)$ in (4.2). We use $i$ for individual angular levels and $j$ for blocks of levels. Each shift chooses different block endpoints. The analytic family constructed below is shared by all $K$ groupings. Its block identities explain how the phase estimate will compare a parent amplitude with its children, while its equal-coordinate value leaves the boundary weights removed in the final angular-grid average. We then prove the estimates that predict amplitudes at a finer angular level, up to a small error, from one good point on a much longer horizontal interval. No mass cutoff is used in those estimates.

All sums below are finite. We retain the strictly positive spatial weights $h_T$ from (2.33); in particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 < h_T lt.eq C_3 \, #h(2em) integral_(bb(R)^2) h_T thin thin upright(d) z lt.eq L^C \| R_T \| . $ <hier:top-weight-basic>]

The integral follows by the change of variables to the normalized coordinates of $R_T$, since the decay exponent in that definition is greater than two. Its constant includes the fixed polynomial dilation $K_0^2$. Constants denoted by $L^C$ in this section are independent of the number of tiles, tops, levels, and Hilbert-space components.

=== 5.1 Eligible masses and shifted blocks <eligible-masses-and-shifted-blocks>

Choose a dyadic number $d \( 0 \)$ such that $B^2 lt.eq d \( 0 \) < 2 B^2$, enlarging it by a fixed absolute factor if necessary to cover the initial precision range. For a translation parameter $theta.alt in \[ 0 \, d \( 0 \) \)$, let

#[#set math.equation(numbering: n => "(5.2)")
 $ d \( i \) = d \( 0 \) G^(- i) \, #h(2em) cal(G)_i^theta.alt = { \[ theta.alt + q d \( i \) \, theta.alt + \( q + 1 \) d \( i \) \) : q in bb(Z) #scale(x: 120%, y: 120%)[}] . $ <hier:angular-grid>]

Since $G$ is an integer dyadic power, these grids are nested. We fix $theta.alt$ for now. The top slopes lie in a bounded interval, so only an absolute number of intervals in $cal(G)_0^theta.alt$ contain a top slope. These intervals are the roots. The half-open convention assigns each top $T$ a unique interval $v_i \( T \)$ at every level $i$.

For $v in cal(G)_i^theta.alt$ put

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(T) \( v \) = { T : s_T in v \, med d_T lt.eq d \( i \) \/ B^2 } \, #h(2em) n_v \( z \) = sum_(T in cal(T) \( v \)) h_T \( z \) . $ <hier:eligible-mass>]

We call these tops eligible at $v$. A node is nonempty if $cal(T) \( v \) eq.not diameter$. For such a node $n_v \( z \) > 0$ at every spatial point. An empty node has mass and amplitude zero and is omitted from every expression involving a negative power or logarithm of its mass. Thus none of the logarithms below requires a spatial lower cutoff.

If $v_1 \, dots.h \, v_G$ are the immediate children of $b$, then their eligible top sets are disjoint subsets of $cal(T) \( b \)$. More precisely,

#[#set math.equation(numbering: n => "(5.4)")
 $ n_b - sum_(v upright(" child of ") b) n_v = sum_(T in cal(T) \( b \)\
d_T > d \( i + 1 \) \/ B^2) h_T gt.eq 0 \, #h(2em) b in cal(G)_i^theta.alt . $ <hier:mass-loss>]

The same assertion holds between any two levels, with the corresponding eligibility cutoff. In particular, every positive mass difference used below is itself a sum of the same positive functions $h_T$.

For a packet $s$ and a top $T$, define their last eligible levels by

#[#set math.equation(numbering: n => "(5.5)")
 $ k_s = max { i gt.eq 0 : d_s lt.eq d \( i \) \/ B^2 } \, #h(2em) k_T = max { i gt.eq 0 : d_T lt.eq d \( i \) \/ B^2 } . $ <hier:stopping-levels>]

The initial precision choice makes these sets nonempty. The assigned-top relation $ell_s lt.eq l_(T \( s \))$ gives $d_(T \( s \)) lt.eq d_s$, and therefore $k_s lt.eq k_(T \( s \))$. Thus a packet is stopped only while its assigned top is still eligible. Since the collection is finite and all precisions are positive, the maximum of the $k_T$ is finite. The grids may be defined at every level, but no amplitude requires a level beyond this maximum. We also keep the first block endpoint past this maximum, so that terminal blocks have the same notation as other blocks.

For each $sigma in { 0 \, dots.h \, K - 1 }$ use the endpoints

#[#set math.equation(numbering: n => "(5.6)")
 $ i_0^sigma = 0 \, #h(2em) i_j^sigma = 1 + sigma + \( j - 1 \) K quad \( j gt.eq 1 \) . $ <hier:shifted-blocks>]

The first block has between one and $K$ transitions; all subsequent blocks have $K$. The transition $i arrow.r i + 1$ is the final transition of a block for precisely the shift $sigma equiv i med \( mod med K \)$. For this shift, let $a \( i \)$ be the starting level of that block. Given an immediate child $v in cal(G)_(i + 1)^theta.alt$ with immediate parent $b in cal(G)_i^theta.alt$, denote its ancestor at level $a \( i \)$ by $J \( i \, v \)$. Define

#[#set math.equation(numbering: n => "(5.7)")
 $ m_v = n_b + sum_(v' in cal(G)_(i + 1)^theta.alt \, med v' subset J \( i \, v \) \, med v' subset.not b\
"dist" \( v \, v' \) < G^(- 1 \/ 4) d \( i \)) n_(v') . $ <eq:src-14>]

Here the distance is the distance between the angular intervals. The summands outside $b$ have disjoint top sets, and these sets are disjoint from $cal(T) \( b \)$. They all consist of tops eligible at $J \( i \, v \)$. Consequently,

#[#set math.equation(numbering: n => "(5.8)")
 $ n_v lt.eq n_b lt.eq m_v lt.eq n_(J \( i \, v \)) . $ <hier:boundary-mass-bounds>]

In particular, $m_v - n_v$ is a sum of positive top weights. The use of the larger block ancestor in (5.7) never changes the radius of the neighbor test: that radius is always tied to the immediate transition scale $d \( i \)$. 1 shows the shifted block endpoints and the top sets entering $m_v$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.4588), [#text(size: 7pt)[$0$]])
  content((0.94, 0.4588), [#text(size: 7pt)[$1$]])
  content((1.88, 0.4588), [#text(size: 7pt)[$2$]])
  content((2.82, 0.4588), [#text(size: 7pt)[$3$]])
  content((3.76, 0.4588), [#text(size: 7pt)[$4$]])
  content((4.7, 0.4588), [#text(size: 7pt)[$5$]])
  content((5.64, 0.4588), [#text(size: 7pt)[$6$]])
  content((6.58, 0.4588), [#text(size: 7pt)[$7$]])
  content((7.52, 0.4588), [#text(size: 7pt)[$8$]])
  content((8.46, 0.4588), [#text(size: 7pt)[$9$]])
  content((-0.517, 0.4588), [#text(size: 7pt)[level]], anchor: "east", padding: 0.1176cm)
  content((-0.47, 0), [#text(size: 9pt)[$sigma =0$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (8.46, 0), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, miter-limit: 10))
  line((0.094, 0), (0.8366, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((1.072, 0), (1.748, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((2.012, 0), (2.688, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((2.914, 0), (3.657, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((3.892, 0), (4.568, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((4.832, 0), (5.508, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((5.734, 0), (6.477, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((6.712, 0), (7.388, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((7.652, 0), (8.328, 0), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  circle((0, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((0.94, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((1.88, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((2.82, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((3.76, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((4.7, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((5.64, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((6.58, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((7.52, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((8.46, 0), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  line((0, 0.0962), (0, 0.2368), (0.94, 0.2368), (0.94, 0.0962), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((0.94, 0.0962), (0.94, 0.2368), (3.76, 0.2368), (3.76, 0.0962), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((3.76, 0.0962), (3.76, 0.2368), (6.58, 0.2368), (6.58, 0.0962), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((-0.47, -0.8732), [#text(size: 9pt)[$sigma =1$]], anchor: "east", padding: 0.1176cm)
  line((0, -0.8732), (8.46, -0.8732), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, miter-limit: 10))
  line((0.1316, -0.8732), (0.8084, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((1.034, -0.8732), (1.777, -0.8732), stroke: (paint: rgb("#003a00"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#003a00"))))
  line((2.012, -0.8732), (2.688, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((2.952, -0.8732), (3.628, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((3.854, -0.8732), (4.597, -0.8732), stroke: (paint: rgb("#003a00"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#003a00"))))
  line((4.832, -0.8732), (5.508, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((5.772, -0.8732), (6.448, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((6.674, -0.8732), (7.417, -0.8732), stroke: (paint: rgb("#003a00"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#003a00"))))
  line((7.652, -0.8732), (8.328, -0.8732), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  circle((0, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((0.94, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((1.88, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((2.82, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((3.76, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((4.7, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((5.64, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((6.58, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((7.52, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((8.46, -0.8732), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  line((0, -0.777), (0, -0.6364), (1.88, -0.6364), (1.88, -0.777), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10))
  line((1.88, -0.777), (1.88, -0.6364), (4.7, -0.6364), (4.7, -0.777), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10))
  line((4.7, -0.777), (4.7, -0.6364), (7.52, -0.6364), (7.52, -0.777), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10))
  content((-0.47, -1.746), [#text(size: 9pt)[$sigma =2$]], anchor: "east", padding: 0.1176cm)
  line((0, -1.746), (8.46, -1.746), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, miter-limit: 10))
  line((0.1316, -1.746), (0.8084, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((1.072, -1.746), (1.748, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((1.974, -1.746), (2.717, -1.746), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  line((2.952, -1.746), (3.628, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((3.892, -1.746), (4.568, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((4.794, -1.746), (5.537, -1.746), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  line((5.772, -1.746), (6.448, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((6.712, -1.746), (7.388, -1.746), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#c6c6c6"))))
  line((7.614, -1.746), (8.357, -1.746), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  circle((0, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((0.94, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((1.88, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((2.82, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((3.76, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((4.7, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((5.64, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((6.58, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((7.52, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  circle((8.46, -1.746), radius: 0.04762, fill: rgb("#acacac"), stroke: none)
  line((0, -1.65), (0, -1.51), (2.82, -1.51), (2.82, -1.65), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  line((2.82, -1.65), (2.82, -1.51), (5.64, -1.51), (5.64, -1.65), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  line((5.64, -1.65), (5.64, -1.51), (8.46, -1.51), (8.46, -1.65), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
})
  #cetz.canvas({
  import cetz.draw: *
  line((0, 0), (8.46, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, -0.12), (0, 0.12), (8.46, -0.12), (8.46, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.23, 0.13), [#text(size: 9pt)[block ancestor $J$]], anchor: "south", padding: 0.1176cm)
  rect((2.162, -1.35), (5.64, -0.7), fill: rgb("#e0e0ff"), stroke: none)
  rect((2.162, -1.35), (5.64, -0.7), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((3.619, -1.025), [#text(size: 9pt)[immediate parent $b$]])
  rect((5.151, -1.35), (5.508, -0.7), fill: rgb("#0000a6"), stroke: none)
  content((5.33, -1.4), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  rect((5.696, -1.35), (6.016, -0.7), fill: rgb("#ffd3a6"), stroke: none)
  rect((5.696, -1.35), (6.016, -0.7), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10))
  rect((6.091, -1.35), (6.411, -0.7), fill: rgb("#ffd3a6"), stroke: none)
  rect((6.091, -1.35), (6.411, -0.7), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10))
  content((6.721, -1.02), [#text(size: 9pt)[neighbors $v'$]], anchor: "west", padding: 0.1176cm)
  line((6.43, -1.02), (6.655, -1.02), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.151, -1.7), (5.151, -2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((6.533, -1.5), (6.533, -2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.151, -2.27), (6.533, -2.27), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((6.627, -2.27), [#text(size: 9pt)[$tilde.op G^(-1"/"4)d(i)$]], anchor: "west", padding: 0.1176cm)
  content((4.606, -2.27), [#text(size: 9pt)[local neighbor radius]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: Shifted blocks and boundary masses, schematically. The upper diagram uses $K = 3$. Each shift starts with $1 + sigma$ transitions and then uses blocks of $K$ transitions; colored arrows are the final transitions for that shift. At a final transition $i arrow.r i + 1$, the mass $m_v$ includes all of $n_b$ and the masses of neighboring children outside $b$ but inside $J$. The neighbor radius is determined by the immediate scale $d \( i \)$, even when $J$ begins much earlier. Neither diagram is to scale. ],
) <fig:shifted-blocks>

For $zeta = \( zeta_0 \, dots.h \, zeta_(K - 1) \) in bb(C)^K$ and nonempty $v$ at level $i + 1$, put

#[#set math.equation(numbering: n => "(5.9)")
 $ w_v \( zeta \, z \) = exp #h(-0.16667em) (zeta_(i med mod med K) log frac(n_v \( z \), m_v \( z \))) . $ <hier:analytic-transition>]

All logarithms in this formula are real logarithms of positive numbers. Thus the weights are entire functions of $zeta$ and have modulus at most one when all $Re zeta_sigma gt.eq 0$.

=== 5.2 The analytic family and its block comparisons <the-analytic-family-and-its-block-comparisons>

For a nonempty node $v$ at level $h$, define the $cal(H)$-valued analytic amplitude by

#[#set math.equation(numbering: n => "(5.10)")
 $ A_v \( zeta \, z \) = sum_(s : s_(T \( s \)) in v\
k_s gt.eq h) q_(T \( s \)) \( z \) phi.alt_s \( z \) thin n_(v_(k_s) \( T \( s \) \)) \( z \)^(- mu \/ K) product_(i = h)^(k_s - 1) w_(v_(i + 1) \( T \( s \) \)) \( zeta \, z \) . $ <eq:src-15>]

The condition $k_s gt.eq h$ already ensures eligibility of $T \( s \)$ at $v$. The empty product is one. This single definition is used for every shift. At fixed $z$, it is a finite sum of entire $cal(H)$-valued functions of $zeta$.

We first exhibit two algebraic uses of this common family. For the block comparison, temporarily fix a shift $sigma$ and parameters satisfying

#[#set math.equation(numbering: n => "(5.11)")
 $ Re zeta_sigma = mu \, #h(2em) Re zeta_(sigma') = 0 quad \( sigma' eq.not sigma \) \, #h(2em) ∥Im zeta∥_2 lt.eq L^2 . $ <hier:vertex-parameters>]

We refer to this choice of real parts as the vertex corresponding to $sigma$. Write $i_j = i_j^sigma$ and $rho_j = d \( i_j \)$. Thus

#[#set math.equation(numbering: n => "(5.12)")
 $ G lt.eq rho_j / rho_(j + 1) lt.eq B \, $ <hier:block-ratio>]

including the first, possibly shorter, block.

For a nonempty $J in cal(G)_(i_j)^theta.alt$, call its nonempty descendants at level $i_(j + 1)$ its #emph[block children]. For such a block child $c$, all packets entering $A_c$ have the same transition factor from $J$ to $c$. Denote it by $lambda_c = product_(i = i_j)^(i_(j + 1) - 1) w_(v_(i + 1))$, along that descendant path. Only the last transition of this block has a nonzero real exponent. Separating packets according to whether their stopping level precedes $i_(j + 1)$ therefore gives the exact identity

#[#set math.equation(numbering: n => "(5.13)")
 $ A_J = sum_(c subset J\
c in cal(G)_(i_(j + 1))^theta.alt) lambda_c A_c + B_J \, #h(2em) \| lambda_c \| = (n_c / m_c)^mu . $ <eq:src-18>]

The remainder $B_J$ is precisely the sum in (5.10) over $i_j lt.eq k_s < i_(j + 1)$. Its assigned tops need not lose eligibility at the end of the block. Thus residual packets and lost top mass are different parts of the block decomposition.

For each nonempty $J$, we add the mass to the normalized $p$-th power of the amplitude. The resulting positive amount $V_J$ and its multiplicative comparison factor $beta_J$ are

#[#set math.equation(numbering: n => "(5.14)")
 $ V_J = n_J + n_J^(alpha - p) ∥A_J∥_(cal(H))^p \, #h(2em) beta_J = frac(V_J, n_J + sum_c n_c^(alpha - p) ∥A_c∥_(cal(H))^p) . $ <eq:src-19>]

We use $beta_J^0$ for the same ratio with $B_J$ omitted only in the numerator. The mass baseline makes $V_J$ and every denominator positive, including when all its block-child amplitudes vanish. The sum is over the nonempty descendants at the end of the block. Equivalently, the denominator is the lost eligibility mass $n_J - sum_c n_c$ plus the block-child amounts $sum_c V_c$. This is the comparison later used in the exact path expansion.

At any one spatial point, abbreviate $n = n_J$ and normalize the child amplitudes by

#[#set math.equation(numbering: n => "(5.15)")
 $ l_c = n_c / n \, #h(2em) X_c = n_c^(mu - 1) A_c \, #h(2em) beta_J^0 = frac(1 + ∥sum_c l_c^(1 - mu) lambda_c X_c∥_(cal(H))^p, 1 + sum_c l_c ∥X_c∥_(cal(H))^p) . $ <eq:src-25>]

The ratio follows by dividing (5.14) by $n$ and using $p mu = alpha - 1$. Also $sum_c l_c lt.eq 1$. This is a pointwise identity: the masses, scalar factors, and vectors still vary with the spatial point. The vector sum in its numerator is the weighted child sum whose phase motion we will compare with the weighted child energies in the denominator.

The boundary mass $m_c$ is designed to pay for selecting separated children in that comparison. At the final transition of this block put $i = i_(j + 1) - 1$ and

#[#set math.equation(numbering: n => "(5.16)")
 $ Q = G^(- 1 \/ 4) d \( i \) = G^(3 \/ 4) rho_(j + 1) . $ <hier:child-separation>]

Fix one spatial point and choose any finite subfamily $cal(C)$ of nonempty block children. Join distinct $c \, c' in cal(C)$ when $"dist" \( c \, c' \) < Q$. Give the children independent exponential clocks of rates $n_c$, and retain a child when its clock rings before those of all its neighbors. The rates are positive. The clocks have no ties with probability one, and the retained intervals have pairwise distance at least $Q$. The retention probability of $c$ is

#[#set math.equation(numbering: n => "(5.17)")
 $ pi_c = integral_0^oo n_c e^(- n_c t) product_(c' tilde.op c) e^(- n_(c') t) thin thin upright(d) t = frac(n_c, n_c + sum_(c' tilde.op c) n_(c')) gt.eq n_c / m_c . $ <pred:retention-probability>]

To see the inequality, let $b$ be the immediate parent of $c$. The eligible top sets of $c$ and its competitors inside $b$ are disjoint subsets of $cal(T) \( b \)$, so their masses sum to at most $n_b$. Every competitor outside $b$ lies inside $J$ and within $Q = G^(- 1 \/ 4) d \( i \)$ of $c$, so its mass is included among the additional terms of $m_c$ in (5.7). Thus $m_c$ bounds the entire competing mass even when only a subfamily of children is used.

Multiplying the coefficient of a retained child by $pi_c^(- 1)$ reconstructs its original coefficient in expectation. The corresponding expected $r_(*)$-power cost is

$ bb(E) #h(-0.16667em) [upright(bold(1))_({ c upright(" retained") }) pi_c^(- 1)] = 1 \, #h(2em) bb(E) #h(-0.16667em) [upright(bold(1))_({ c upright(" retained") }) pi_c^(- r_(*))] = pi_c^(1 - r_(*)) . $

The coefficient exponent in (5.13) matches this cost exactly. The identities $r_(*) \( 1 - mu \) = 1$ and $mu r_(*) = r_(*) - 1$ give

#[#set math.equation(numbering: n => "(5.18)")
 $ pi_c^(1 - r_(*)) \| lambda_c \|^(r_(*)) = (frac(n_c \/ m_c, pi_c))^(r_(*) - 1) lt.eq 1 . $ <hier:selection-cancellation>]

The first identity also turns $l_c^(r_(*) \( 1 - mu \))$ into $l_c$, the weight in the denominator of (5.15). The later snapshot construction will use this selection for the child vectors it retains and check the remaining hypotheses of the finite Fourier estimate.

The same analytic family has a second algebraic use at the equal-coordinate parameter

$ zeta^(upright(c)) = \( mu \/ K \, dots.h \, mu \/ K \) . $

Let $v$ be a root and let $s$ be a packet contributing to $A_v$, with $T = T \( s \)$. Apart from the factor $q_T phi.alt_s$, the coefficient of $s$ in $n_v^(mu \/ K) A_v \( zeta^(upright(c)) \, z \)$ is

$ n_v^(mu \/ K) n_(v_(k_s) \( T \))^(- mu \/ K) product_(i = 0)^(k_s - 1) (n_(v_(i + 1) \( T \)) / m_(v_(i + 1) \( T \)))^(mu \/ K) . $

Cancelling consecutive eligible masses identifies it as

#[#set math.equation(numbering: n => "(5.19)")
 $ kappa_s = product_(i = 0)^(k_s - 1) (n_(v_i \( T \)) / m_(v_(i + 1) \( T \)))^(mu \/ K) \, #h(2em) T = T \( s \) . $ <eq:src-30>]

The empty product is one, and each factor lies in $\( 0 \, 1 \]$ by (5.7). Thus for each root the equal-coordinate value produces its portion of the masked packet sum with only these boundary ratios in its coefficients. The remaining tasks are to estimate the vertex values, interpolate those estimates to $zeta^(upright(c))$, and remove the boundary ratios by averaging the angular-grid translation.

=== 5.3 Full-root variation and amplitude bounds <full-root-variation-and-amplitude-bounds>

We now leave the temporary vertex specialization and return to the general range $0 lt.eq Re zeta_sigma lt.eq mu$ for every coordinate, with arbitrary imaginary parts. The following bounds control the endpoint weights without a loss proportional to the number of levels. Along one eligible top path, write $n_i = n_(v_i \( T \))$ and

#[#set math.equation(numbering: n => "(5.20)")
 $ P_i = log n_i / n_(i + 1) \, #h(2em) R_i = log m_(v_(i + 1) \( T \)) / n_(i + 1) . $ <hier:positive-logs>]

Both are nonnegative as long as the top remains eligible at level $i + 1$.

#thm([Lemma 5.1.])[
  (Full-root variation bound).  #emph[Fix an eligible path from a root $v_0 \( T \)$ through level $k$. At every spatial point, 
#[#set math.equation(numbering: n => "(5.21)")
 $ sum_(i = 0)^(k - 1) R_i lt.eq K log n_(v_0 \( T \)) / n_(v_k \( T \)) \, #h(2em) sum_(i = 0)^(k - 1) P_i = log n_(v_0 \( T \)) / n_(v_k \( T \)) . $ <hier:full-root-telescope>]

 For a fixed starting level $h lt.eq k_T$, define, for $h lt.eq k lt.eq k_T$, 
$ omega_(T \, h \, k) \( zeta \, z \) = n_(v_k \( T \)) \( z \)^(- mu \/ K) product_(i = h)^(k - 1) w_(v_(i + 1) \( T \)) \( zeta \, z \) . $

 If $0 lt.eq Re zeta_sigma lt.eq mu$ for every $sigma$, then the supremum plus total variation of this sequence, with the endpoint $k$ varying, is bounded by 
#[#set math.equation(numbering: n => "(5.22)")
 $ sup_(h lt.eq k lt.eq k_T) \| omega_(T \, h \, k) \| + sum_(k = h)^(k_T - 1) \| omega_(T \, h \, k + 1) - omega_(T \, h \, k) \| lt.eq C h_T^(- mu \/ K) [1 + K \( 1 + ∥zeta∥_2 \) log n_(v_0 \( T \)) / h_T] . $ <eq:src-16>]

 The same bound holds upon restricting the endpoints to a subinterval.]
] <hier:weight-variation>

#proof[
  Fix a shift $sigma$. For the transitions $i equiv sigma med \( mod med K \)$ with $i < k$, (5.8) gives
  $ R_i lt.eq log n_(a \( i \)) / n_(i + 1) . $
  For this fixed shift, the intervals of levels $\[ a \( i \) \, i + 1 \]$ are successive blocks starting at zero. Their logarithms telescope. The endpoint of the last completed block is at most $k$, so the sum is at most $log \( n_0 \/ n_k \)$, by monotonicity of the masses. Summing over the $K$ shifts proves the first inequality in (5.21). The second is an ordinary telescope. This is a full-root bound. In particular, it remains applicable to weights occurring on a later segment even when another shift’s block starts before that segment.
  Set $a = mu \/ K$, solely for this proof, and use the specified logarithm
  $ L_k = - a log n_k - sum_(i = h)^(k - 1) zeta_(i med mod med K) R_i \, #h(2em) omega_(T \, h \, k) = e^(L_k) . $
  Its increment is
  #[#set math.equation(numbering: n => "(5.23)")
   $ L_(k + 1) - L_k = a P_k - zeta_(k med mod med K) R_k . $ <hier:log-weight-increment>]
  Since $n_k gt.eq h_T$ and all real transition exponents are nonnegative, $\| e^(L_k) \| lt.eq h_T^(- a)$. For any complex $A \, B$,
  $ \| e^B - e^A \| lt.eq \| B - A \| integral_0^1 \| e^(\( 1 - t \) A + t B) \| thin thin upright(d) t lt.eq \| B - A \| max \( \| e^A \| \, \| e^B \| \) . $
  Using this inequality for adjacent logarithms and then (5.21) proves (5.22). Notice that the exponential of the sum of the absolute logarithmic increments has not been used. Such an exponential would be unsuitable when $h_T$ is very small. ◻
]

#thm([Lemma 5.2.])[
  (Amplitude bounds).  #emph[On $Z_0$, for $0 lt.eq Re zeta_sigma lt.eq mu$, 
#[#set math.equation(numbering: n => "(5.24)")
 $ ∥A_v \( zeta \, z \)∥_(cal(H)) lt.eq L^C \( 1 + ∥zeta∥_2 \) n_v \( z \) . $ <eq:src-17>]

 More precisely, the contribution of any one eligible top $T$ to $A_v$, also when restricted to any interval of packet lengths, is bounded by 
#[#set math.equation(numbering: n => "(5.25)")
 $ L^C \( 1 + ∥zeta∥_2 \) \| q_T \( z \) \| h_T \( z \)^4 . $ <hier:individual-amplitude>]

 If all eligible tops of $v$ are insignificant at $z in Z_0$, then 
#[#set math.equation(numbering: n => "(5.26)")
 $ ∥A_v \( zeta \, z \)∥_(cal(H)) lt.eq L^C \( 1 + ∥zeta∥_2 \) e^(- L log L) n_v \( z \) . $ <hier:insignificant-amplitude>]

]
] <hier:amplitudes>

#proof[
  For vectors $f_h \, dots.h \, f_k$ and scalars $omega_h \, dots.h \, omega_k$, summation by parts gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ ∥sum_(i = h)^k omega_i f_i∥ lt.eq (\| omega_k \| + sum_(i = h)^(k - 1) \| omega_(i + 1) - omega_i \|) max_(h lt.eq j lt.eq k) ∥sum_(i = h)^j f_i∥ . $ <hier:summation-by-parts>]
  Group the packets assigned to $T$ according to their stopping level. The resulting initial sums, or the sums obtained after restricting to an interval of packet lengths, are interval partial sums of the original top’s length sequence. By (3.17) and the fact that the $K_0$-dilated weight is at least the corresponding $K_1$-dilated weight, their norm at $z in Z_0$ is at most $L^C h_T \( z \)^8$. The mask $q_T \( z \)$ is common to this whole top. Apply (5.27) and (5.22).
  To see that the logarithmic factor can be absorbed uniformly, use (3.19) and $log N lt.eq 2 L$. Since $n_(v_0 \( T \)) lt.eq n$ and $h_T lt.eq C_3$,
  $ 0 lt.eq log n_(v_0 \( T \)) / h_T lt.eq C L + log^(+) 1 / h_T . $
  Here and below $log^(+) x = max \( 0 \, log x \)$. Also $mu \/ K < 1$. The elementary boundedness of $x^delta log^q \( 1 \/ x \)$ on $\( 0 \, 1 \]$, for fixed $delta > 0$ and fixed $q$, shows that
  $ h_T^(8 - mu \/ K) [1 + K \( 1 + ∥zeta∥_2 \) log n_(v_0 \( T \)) / h_T] lt.eq L^C \( 1 + ∥zeta∥_2 \) h_T^4 . $
  This proves (5.25). Summing over the eligible tops and using $h_T^4 lt.eq C_3^3 h_T$ proves (5.24). For insignificant tops, the mask estimate after (2.43) gives $\| q_T \| lt.eq e^(- L log L)$. Applying the same summation proves (5.26). ◻
]

=== 5.4 Spatial meshes for prediction <spatial-meshes-for-prediction>

Return to a fixed shift $sigma$ and a vertex parameter satisfying (5.11). Write $i_j = i_j^sigma$ and $rho_j = d \( i_j \)$ as in the block comparison above, and take $J in cal(G)_(i_j)^theta.alt$. Its block children and their factors are those in (5.13). Let $R$ be any top eligible in $J$, and parametrize a line of slope $s_R$ by $z \( x \) = \( x \, y_(*) + s_R x \)$. On this line use one nested dyadic grid in the parameter $x$, at lengths

#[#set math.equation(numbering: n => "(5.28)")
 $ H_j = frac(w, rho_(j + 1) sqrt(G)) \, #h(2em) H_(- 1) = frac(w, rho_0 sqrt(G)) . $ <eq:src-20>]

These are dyadic lengths because $w \, d \( 0 \) \, G$, and $sqrt(G)$ are dyadic. They increase with $j$. The grids can, for example, have common origin zero. Each $H_j$ cell is a union of $H_(j - 1)$ cells.

=== 5.5 Positive-mass motion and the locality of other shifts <positive-mass-motion-and-the-locality-of-other-shifts>

#thm([Lemma 5.3.])[
  (Mass motion).  #emph[Fix $R \, J \, j$ as above and an interval $I$ of horizontal length $H_j$ on a line of slope $s_R$. Consider the masses $n_J \, n_c \, m_c$ in (5.13), the masses used in the factors $lambda_c$, and those used in any endpoint multiplier of a packet contributing to $A_c$. Each such mass, and each of its positive subset-complement differences used below, is a sum of weights of tops $T$ satisfying 
#[#set math.equation(numbering: n => "(5.29)")
 $ \| s_T - s_R \| lt.eq C rho_j \, #h(2em) d_T lt.eq rho_j \/ B^2 . $ <hier:motion-locality>]

 There is an absolute constant $C$ such that, with $epsilon_(upright("mov")) = C G^(- 1 \/ 2)$, every nonzero such mass $a$ satisfies 
#[#set math.equation(numbering: n => "(5.30)")
 $ \| partial_x log a \| lt.eq epsilon_(upright("mov")) / H_j quad upright("almost everywhere on ") I . $ <hier:mass-log-derivative>]

 If $r = a \/ \( a + b \)$ is one of the ratios of a submass to its containing mass, then 
#[#set math.equation(numbering: n => "(5.31)")
 $ \| partial_x log r \| lt.eq frac(2 epsilon_(upright("mov")), H_j) \( 1 - r \) lt.eq frac(2 epsilon_(upright("mov")), H_j) \( - log r \) . $ <hier:ratio-derivative>]

 When $b = 0$, the ratio is identically one and its derivative is zero. In particular, nonzero $n_J - n_c$ and $m_c - n_c$ have the relative motion bound (5.30). All these masses vary by a factor $1 + O \( G^(- 1 \/ 2) \)$ across $I$.]
  #emph[For the parameters (5.11), the block factors also satisfy, for $x \, x_0 in I$, 
#[#set math.equation(numbering: n => "(5.32)")
 $ lr(|frac(lambda_c \( x \), lambda_c \( x_0 \)) - 1|) lt.eq G^(- c_0) $ <hier:complex-transition-motion>]

 for some absolute $c_0 > 0$ and all sufficiently large $L$.]
] <hier:mass-motion>

#proof[
  All descendants of $J$ have slopes inside $J$, so their top slopes are within $rho_j$ of $s_R$. Their eligibility cutoffs are at most $rho_j \/ B^2$. A mass in an additional boundary term (5.7) at a transition $i gt.eq i_j$ can come from an interval outside $J$, because the block associated to another shift can start before $i_j$. However, that interval is within $G^(- 1 \/ 4) d \( i \)$ of the relevant child and has width $d \( i + 1 \)$. The relevant child is a descendant of $J$, and $d \( i \) lt.eq rho_j$. Hence every added slope is within $C rho_j$ of $s_R$. The tops in an added interval have precision at most $d \( i + 1 \) \/ B^2$; those in the immediate-parent mass have precision at most $d \( i \) \/ B^2$. This proves (5.29), including for weights below the block. Taking a difference of the relevant nested top sets preserves the same property. This argument uses the neighbor radius at the immediate transition, rather than the possibly larger width of the other shift’s block ancestor.
  In normalized coordinates of a top $T$, horizontal motion along $s_R$ has velocities $1 \/ l_T$ and $\( s_R - s_T \) \/ W$. Differentiating (2.33), using the Lipschitz property of the absolute value at almost every point, gives
  $ \| partial_x log h_T \| lt.eq C (1 / l_T + frac(\| s_R - s_T \|, W)) lt.eq C (frac(rho_j, B^2 w) + frac(rho_j, m w)) . $
  The factor $K_0^(- 1)$ available from the dilation is not needed. Multiplying by $H_j$ and using (5.12) yields
  $ H_j \| partial_x log h_T \| lt.eq C / sqrt(G) (B / B^2 + B / m) lt.eq C G^(- 1 \/ 2) . $
  For a positive sum $a = sum_T h_T$, its logarithmic derivative is the weighted average of the logarithmic derivatives of the summands. This proves (5.30), also for positive differences, which are such sums by their set interpretation.
  If $a \, b > 0$, direct differentiation gives
  $ partial_x log frac(a, a + b) = frac(b, a + b) #scale(x: 120%, y: 120%)[\(] partial_x log a - partial_x log b #scale(x: 120%, y: 120%)[\)] . $
  This proves (5.31); the inequality $1 - r lt.eq - log r$ holds for $0 < r lt.eq 1$. If the complementary top set is empty, $r = 1$ everywhere. In particular, writing $q_r = - log r gt.eq 0$,
  #[#set math.equation(numbering: n => "(5.33)")
   $ \| partial_x q_r \| lt.eq frac(2 epsilon_(upright("mov")), H_j) q_r \, #h(2em) e^(- 2 epsilon_(upright("mov"))) q_r \( x_0 \) lt.eq q_r \( x \) lt.eq e^(2 epsilon_(upright("mov"))) q_r \( x_0 \) quad \( x \, x_0 in I \) . $ <hier:loss-motion>]
  The inequalities remain valid for an identically zero loss.
  Finally, a block factor is a product of at most $K$ transition factors. The simpler bound $\| partial_x log r \| lt.eq 2 epsilon_(upright("mov")) \/ H_j$ shows that its specified complex logarithm changes by at most $C K \( 1 + ∥zeta∥_2 \) G^(- 1 \/ 2)$. For (5.11) this is $L^C G^(- 1 \/ 2)$ and tends to zero faster than any negative fixed power of $L$. Exponentiating proves (5.32) after decreasing $c_0$. This last argument does not require any bound on the size of a logarithmic loss itself. ◻
]

=== 5.6 Variation of moving endpoint weights <variation-of-moving-endpoint-weights>

The next estimate makes explicit why the motion of the analytic weights can be controlled from a single point, even for very small $h_T$. For a finite scalar sequence $a = \( a_k \)$ let

$ ∥a∥_(upright("BV")) = sup_k \| a_k \| + sum_k \| a_(k + 1) - a_k \| . $

Only this elementary finite-sequence norm is used here.

#thm([Lemma 5.4.])[
  (Moving weights).  #emph[In the setting of 36, fix a top $T$ contributing to $A_c$, and take endpoint weights $omega_k = omega_(T \, i_(j + 1) \, k)$. If $z_0 in I ∩ Z_0$ and the parameters satisfy (5.11), then, uniformly for $z' in I$, 
#[#set math.equation(numbering: n => "(5.34)")
 $ ∥\( omega_k \( z' \) \)_k∥_(upright("BV")) & lt.eq L^C h_T \( z_0 \)^(- 4) \,\
∥\( omega_k \( z' \) - omega_k \( z_0 \) \)_k∥_(upright("BV")) & lt.eq G^(- 1 \/ 2) L^C h_T \( z_0 \)^(- 4) . $ <hier:moving-weight-bv>]

 Both conclusions hold for any interval of endpoints. Neither assumes that $z'$ belongs to $Z_0$.]
] <hier:moving-weights>

#proof[
  Parametrize the interval by its horizontal coordinate $x$, and write $h = i_(j + 1)$ and $a = mu \/ K$ in this proof. Use $P_i \, R_i$ from (5.20) for $h lt.eq i < k_T$. By (5.33), each of these nonnegative losses is comparable throughout $I$ to its value at $x_0$, with factor $e^(O \( epsilon_(upright("mov")) \))$, and its absolute derivative is bounded by $C epsilon_(upright("mov")) \/ H_j$ times itself. Define
  $ cal(B) \( x \) = sum_(i = h)^(k_T - 1) #scale(x: 120%, y: 120%)[\(] a P_i \( x \) + \| zeta_(i med mod med K) \| R_i \( x \) #scale(x: 120%, y: 120%)[\)] . $
  It follows that $cal(B) \( x \) lt.eq e^(C epsilon_(upright("mov"))) cal(B) \( x_0 \)$. By the full-root bound,
  #[#set math.equation(numbering: n => "(5.35)")
   $ cal(B) \( x_0 \) lt.eq C K \( 1 + ∥zeta∥_2 \) log frac(n_(v_0 \( T \)) \( z_0 \), h_T \( z_0 \)) . $ <hier:moving-loss-budget>]
  The full-root mass is used only at the snapshot in this inequality; its spatial derivative is not needed.
  Let $L_k = log omega_k$ be the specified logarithm in the proof of 34, and put $q_k = partial_x L_k$. Equation (5.23) and the mass derivative bound imply
  $ sup_k \| q_k \| & lt.eq frac(C epsilon_(upright("mov")), H_j) #scale(x: 120%, y: 120%)[\(] a + cal(B) \( x \) #scale(x: 120%, y: 120%)[\)] \,\
sum_k \| q_(k + 1) - q_k \| & lt.eq frac(C epsilon_(upright("mov")), H_j) cal(B) \( x \) . $
  For example, the initial term is $q_h = - a partial_x log n_h$, and subsequent differences are the derivatives of $a P_i - zeta_(i med mod med K) R_i$. At every point of $I$,
  $ sup_k \| omega_k \( x \) \| lt.eq h_T \( x \)^(- a) lt.eq e^(a epsilon_(upright("mov"))) h_T \( z_0 \)^(- a) . $
  The complex-exponential estimate used for (5.22) therefore gives
  $ ∥omega \( x \)∥_(upright("BV")) lt.eq C h_T \( z_0 \)^(- a) #scale(x: 120%, y: 120%)[\(] 1 + cal(B) \( x_0 \) #scale(x: 120%, y: 120%)[\)] . $
  For finite sequences the product rule for differences gives
  $ ∥a b∥_(upright("BV")) lt.eq sup_k \| a_k \| ∥b∥_(upright("BV")) + sup_k \| b_k \| sum_k \| a_(k + 1) - a_k \| . $
  Using $partial_x omega_k = omega_k q_k$ and the preceding estimates yields
  #[#set math.equation(numbering: n => "(5.36)")
   $ ∥partial_x omega \( x \)∥_(upright("BV")) lt.eq frac(C epsilon_(upright("mov")), H_j) h_T \( z_0 \)^(- a) #scale(x: 120%, y: 120%)[\(] 1 + cal(B) \( x_0 \) #scale(x: 120%, y: 120%)[\)]^2 . $ <hier:weight-derivative-bv>]
  The functions involved are absolutely continuous on the line. Integrate (5.36) between $x_0$ and $x'$, over distance at most $H_j$, and use the triangle inequality for the finite-sequence norm. This proves the difference bound with right side $C epsilon_(upright("mov")) h_T \( z_0 \)^(- a) \( 1 + cal(B) \( x_0 \) \)^2$.
  At the snapshot, (3.19), (5.11), and (5.35) bound the last expression by $G^(- 1 \/ 2) L^C h_T \( z_0 \)^(- 4)$. Indeed the only possible nonpolynomial quantity is $log^(+) \( 1 \/ h_T \( z_0 \) \)$, whose square is absorbed by the difference between exponents $a < 1$ and $4$. The same argument proves (5.34). There is no assumption that $G^(- 1 \/ 2) cal(B) \( x_0 \)$ is small: very small $h_T$ is allowed, and only a polynomial in its logarithm has appeared. ◻
]

=== 5.7 Amplitude motion from one good snapshot <amplitude-motion-from-one-good-snapshot>

#thm([Lemma 5.5.])[
  (Predictable amplitude motion).  #emph[Fix a block child $c$ of $J$, a path top $R$ eligible in $J$, and an $H_j$ cell on a line of slope $s_R$. Let $t_c$ be the angular center of $c$. If $z_0 in Z_0$ lies in that cell and $z' = z_0 + \( b \, s_R b \)$ is any other point in the cell, then, for the parameters (5.11), 
#[#set math.equation(numbering: n => "(5.37)")
 $ ∥A_c \( zeta \, z' \) - cal(D)_c \( b \) A_c \( zeta \, z_0 \)∥_(cal(H)) lt.eq G^(- c_0) n_c \( z_0 \) \, #h(2em) cal(D)_c \( b \)_(nu nu) = exp #scale(x: 120%, y: 120%)[\(] i \( s_R - t_c \) eta_nu b #scale(x: 120%, y: 120%)[\)] . $ <eq:src-21>]

 Here $c_0 > 0$ is absolute and may also be used, after decreasing it, in (5.32). The estimates hold at all displaced points in the cell, not just its points in $Z_0$.]
] <hier:amplitude-motion>

#proof[
  Fix one top $T$ contributing to $A_c$. Its contributing packets have $k_s gt.eq i_(j + 1)$, hence
  #[#set math.equation(numbering: n => "(5.38)")
   $ ell_s gt.eq l_(*) := frac(B^2 w, rho_(j + 1)) \, #h(2em) l_T gt.eq l_(*) . $ <hier:predictable-length>]
  Also $s_T in c$, so $\| s_T - t_c \| lt.eq rho_(j + 1) \/ 2$, while $\| s_T - s_R \| lt.eq C rho_j$.
  Consider any interval partial sum $S$ of these unweighted packets on $T$. The good-snapshot estimates (3.17), including their demodulated vertical-derivative and vertical-neighborhood versions, bound $S$ and $W \( partial_y - i eta_nu \) S_nu$ by $L^C h_T \( z_0 \)^8$ throughout the vertical neighborhood of radius $W$ at $z_0$. Put $v = \( s_R - s_T \) b$ and first move to $z_1 = z_0 + \( 0 \, v \)$. Since
  $ \| v \| lt.eq C rho_j H_j lt.eq frac(C B w, sqrt(G)) lt.double W \, $
  the fundamental theorem of calculus after componentwise demodulation gives
  $ ∥S \( z_1 \) - "diag" \( e^(i eta_nu v) \) S \( z_0 \)∥ lt.eq L^C h_T \( z_0 \)^8 frac(\| v \|, W) lt.eq G^(- 1 \/ 2) L^C h_T \( z_0 \)^8 . $
  Next move from $z_1$ to $z'$ along slope $s_T$ by horizontal distance $b$. The nonexceptional horizontal derivative estimate in 28, applied to lengths at least $l_(*)$, bounds this change by
  $ L^C h_T \( z_0 \)^8 frac(\| b \|, l_(*)) lt.eq G^(- 1 \/ 2) L^C h_T \( z_0 \)^8 . $
  To justify its spatial weight here, the two displacements change the normalized coordinates of $T$ by at most $C \/ \( B^2 sqrt(G) \) + C B \/ \( m sqrt(G) \)$. Its weight at every intermediate point is therefore comparable to $h_T \( z_0 \)$. If the derivative estimate is expressed using the smaller dilation $K_1$, that weight is bounded above by the $K_0$-dilated weight used here. No good-point estimate at $z_1$ or $z'$ has been invoked for this horizontal move.
  The replacement of $s_T$ by $t_c$ in the diagonal phase costs at most
  $ C \| s_T - t_c \| frac(\| b \|, w) ∥S \( z_0 \)∥ lt.eq G^(- 1 \/ 2) L^C h_T \( z_0 \)^8 \, $
  because $eta_nu asymp w^(- 1)$ uniformly in $nu$. This proves, uniformly over the interval partial sum,
  #[#set math.equation(numbering: n => "(5.39)")
   $ ∥S \( z' \) - cal(D)_c \( b \) S \( z_0 \)∥ lt.eq G^(- 1 \/ 2) L^C h_T \( z_0 \)^8 . $ <hier:unweighted-motion>]
  The same bound holds with the mask $q_T$ multiplying $S$ at its own evaluation point. Indeed $\| q_T \| lt.eq 1$, and its formula (2.43), together with boundedness of the derivative of sinc, gives
  $ \| q_T \( z' \) - q_T \( z_0 \) \| lt.eq L^C (frac(\| b \|, l_T) + frac(\| s_R - s_T \| thin \| b \|, W)) lt.eq G^(- 1 \/ 2) L^C . $
  Combining this with the snapshot bound for $S$ proves the masked version of (5.39). This estimate uses absolute motion of the mask and does not divide by $q_T$, which may vanish.
  Group the masked packets by stopping level and denote their sums by $f_k \( z \)$. Their weighted contribution to the difference in (5.37) is
  $ & sum_k omega_k \( z' \) #scale(x: 120%, y: 120%)[\(] f_k \( z' \) - cal(D)_c \( b \) f_k \( z_0 \) #scale(x: 120%, y: 120%)[\)]\
 & #h(15mm)  + sum_k #scale(x: 120%, y: 120%)[\(] omega_k \( z' \) - omega_k \( z_0 \) #scale(x: 120%, y: 120%)[\)] cal(D)_c \( b \) f_k \( z_0 \) . $
  All interval partial sums of the first parenthesis have norm at most $G^(- 1 \/ 2) L^C h_T \( z_0 \)^8$, by the masked version of (5.39). The snapshot partial sums in the second line have norm at most $L^C h_T \( z_0 \)^8$. Apply (5.27) to both lines, then (5.34) and (5.34). The result for this top is at most $G^(- 1 \/ 2) L^C h_T \( z_0 \)^4$. Sum over the tops eligible in $c$. Since $h_T^4 lt.eq C_3^3 h_T$, this is at most $G^(- 1 \/ 2) L^C n_c \( z_0 \)$. Finally $log G asymp L^0.7$ absorbs every fixed power of $L$ into a smaller positive power of $G$, proving (5.37). ◻
]

=== 5.8 One deterministic residual sequence for each path <one-deterministic-residual-sequence-for-each-path>

We now refine $Z_0$ by a set which depends on the angular translation but not on $zeta$. Its purpose is to make the later residual estimates available on most of the path weight. The subsets of packets used in its definition must be fixed before evaluating a spatial point or choosing a mass cutoff.

For each possible path top $R$, let

#[#set math.equation(numbering: n => "(5.40)")
 $ cal(P)_R = { s : ell_s lt.eq l_R \, quad \| theta_s - s_R \| lt.eq C B^4 d_s } \, $ <hier:reference-packets>]

where the absolute constant is large enough to cover the assigned-top comparisons below. Apply the main/error decomposition of 27 with reference slope $s_R$ to this fixed collection. Denote the resulting positive error sum by $cal(E)_R$ and positive main square function by $cal(S)_R$. The absolute envelopes can use fixed decay exponents slow enough to dominate the norms of the unweighted synthesis packets. There is no loss in doing so because the packet bounds are available with arbitrarily large fixed decay exponents.

For each shift $sigma$, define a second fixed collection

#[#set math.equation(numbering: n => "(5.41)")
 $ cal(Q)_(R \, sigma) = union.big_(j gt.eq 0\
i_(j + 1)^sigma lt.eq k_R) {s : i_j^sigma lt.eq k_s < i_(j + 1)^sigma \,\
T \( s \) in cal(T) #scale(x: 120%, y: 120%)[\(] v_(i_(j + 1)^sigma) \( R \) #scale(x: 120%, y: 120%)[\)]} . $ <hier:deterministic-residual-subset>]

For blocks at whose endpoint $R$ is still eligible, these are the packets that stop within the block while their assigned tops remain eligible in the child $v_(i_(j + 1)^sigma) \( R \)$. The union takes all such blocks at once, fixing one packet collection before any spatial point or mass cutoff is chosen. Let $cal(V)_(R \, sigma)$ be the $3$-variation of the sequence formed by summing $q_(T \( s \)) phi.alt_s$ from this collection at each packet length. It permits any finite list of disjoint intervals of that one length sequence. Subsequent choices of those intervals may depend on the evaluation point; the collection and its length sequence remain fixed.

Every packet in $cal(Q)_(R \, sigma)$ satisfies the hypotheses of 27 with $t = s_R$ and $l = l_R$. Indeed, $k_s < i_(j + 1)^sigma lt.eq k_R$ gives

#[#set math.equation(numbering: n => "(5.42)")
 $ d_s > rho_(j + 1) / B^2 gt.eq d_R \, #h(2em) ell_s < l_R . $ <hier:residual-precision>]

Since $s_(T \( s \))$ and $s_R$ are in the same block-child interval of width $rho_(j + 1)$,

$ \| theta_s - s_R \| lt.eq \| theta_s - s_(T \( s \)) \| + \| s_(T \( s \)) - s_R \| lt.eq C d_s + rho_(j + 1) lt.eq C B^2 d_s lt.eq C B^4 d_s . $

For later use, if a residual packet only lies in the larger path node $J = v_(i_j) \( R \)$ and has $ell_s lt.eq l_R$, then $\| s_(T \( s \)) - s_R \| lt.eq rho_j lt.eq B rho_(j + 1) < B^3 d_s$; thus it belongs to $cal(P)_R$ as well. These facts explain both choices of fixed collections.

#thm([Lemma 5.6.])[
  (Good paths).  #emph[There is a fixed exponent $C_(upright("path"))$, chosen independently of the mass cutoff below, such that the following construction is valid. Call $R$ bad at $z$ if any of $cal(E)_R \( z \) \, cal(S)_R \( z \) \, cal(V)_(R \, sigma) \( z \)$, $0 lt.eq sigma < K$, exceeds $L^(C_(upright("path")))$. Otherwise call it good at $z$. For every fixed angular translation, 
#[#set math.equation(numbering: n => "(5.43)")
 $ sum_R integral_(bb(R)^2) h_R \( z \) upright(bold(1))_({ R upright(" bad at ") z }) thin thin upright(d) z lt.eq S e^(- 10 L) . $ <hier:weighted-bad-paths>]

 The constant $10$ may be replaced by any prescribed absolute constant by increasing the fixed exponent. The measurable set 
#[#set math.equation(numbering: n => "(5.44)")
 $ Z = Z_theta.alt = {z in Z_0 : sum_(R upright(" bad at ") z) h_R \( z \) lt.eq e^(- L)} $ <hier:good-set>]

 is independent of $zeta$ and satisfies 
#[#set math.equation(numbering: n => "(5.45)")
 $ \| Z_0 \\ Z \| lt.eq S e^(- 9 L) lt.eq L^C e^(- 5 L) \| F \| . $ <hier:good-set-budget>]

 Its removal is therefore allowable in the target estimate (2.29), using the original adjoint sum’s $L^2$ bound.]
] <hier:good-paths>

#proof[
  Fix $R$, a line of slope $s_R$, and any horizontal interval $I$ of length $l_R$ on that line. By 27, the normalized $L^b \( I \)$ norm of each indicated quantity is at most $C b^C \( 1 + log B \)^C$. The same bound holds for $cal(V)_(R \, sigma)$ because (5.41) is a fixed subset satisfying (3.1). As $log B = K log G$ is bounded by a fixed power of $L$, this bound is polynomial in $L$ when $b$ is a fixed positive multiple of $L$.
  For clarity, fix an arbitrarily large absolute number $J_0$. Choose $b = ceil.l L ceil.r$ and then a fixed exponent $C_(upright("path"))$ sufficiently larger than those in the moment bound. Markov’s inequality gives, for all large $L$,
  $ & \| { x in I : cal(E)_R \( x \) > L^(C_(upright("path"))) } \| + \| { x in I : cal(S)_R \( x \) > L^(C_(upright("path"))) } \|\
 & #h(2em) + sum_(sigma = 0)^(K - 1) \| { x in I : cal(V)_(R \, sigma) \( x \) > L^(C_(upright("path"))) } \| lt.eq e^(- J_0 L) \| I \| . $
  The factor $K + 2$ is polynomial and is absorbed by the same choice. Alternatively one may increase the fixed multiple in the choice of $b$; neither choice depends on the number of scales or tops.
  Partition the whole reference line into intervals of length $l_R$. Along this line $h_R$ changes by at most an absolute factor on each such interval, directly from (2.33). Hence the preceding estimate implies
  $ integral_I h_R upright(bold(1))_({ R upright(" bad") }) thin thin upright(d) x lt.eq C e^(- J_0 L) integral_I h_R thin thin upright(d) x . $
  Sum over the intervals and integrate in the transverse coordinate $y - s_R x$; this change of coordinates has determinant one. Using (5.1) gives
  $ integral_(bb(R)^2) h_R upright(bold(1))_({ R upright(" bad") }) thin thin upright(d) z lt.eq L^C e^(- J_0 L) \| R_R \| . $
  Sum over $R$ and take $J_0$ large enough to obtain (5.43). This establishes the estimate with its full spatial weight, not only on the central part of $R$.
  Markov’s inequality applied to the nonnegative sum defining (5.44) gives its first measure bound. Since $S lt.eq L^C \| E \| = L^C N^2 \| F \|$ and $N lt.eq e^(2 L)$, the second follows. For example, Cauchy–Schwarz and the previously proved adjoint estimate give
  $ integral_(Z_0 \\ Z) ∥P∥ lt.eq \| Z_0 \\ Z \|^(1 \/ 2) ∥P∥_2 lt.eq L^C e^(- 5 L \/ 2) N \| F \| \, $
  which is smaller than any required fixed negative power of $L$ times $N \| F \|$. The estimate is applied to the original sum $P$, as required for exceptional discards.
  Finally, all packet collections used here depend only on the finite geometric data, the angular translation, and the shift. They do not depend on $z$, $zeta$, significance, or a mass cutoff. Their finite length variations and the other thresholded quantities are measurable in $z$. They are measurable jointly with $theta.alt$ as well: at the finitely many relevant angular levels, membership of each of the finitely many top slopes in its interval changes at finitely many translation endpoints. On the complementary parameter intervals all the relevant membership data are fixed. This also proves the asserted independence from $zeta$. ◻
]

=== 5.9 Mass stopping and the exact path expansion <mass-stopping-and-the-exact-path-expansion>

Choose a cutoff

#[#set math.equation(numbering: n => "(5.46)")
 $ M = L^(A_M) \, $ <hier:mass-cutoff>]

where the fixed exponent $A_M$ will be taken sufficiently large in the residual estimates. Every threshold and exponent in the preceding lemmas has already been fixed without reference to $A_M$. Statements below that use $M$ hold for each such fixed exponent after increasing the lower threshold for $L$.

For convenience set

#[#set math.equation(numbering: n => "(5.47)")
 $ C_M = L^(C p) \( 1 + M \)^(alpha - 1) \, $ <hier:stop-cost>]

with a fixed sufficiently large $C$. Equation (5.24) and $p mu = alpha - 1$ imply that a node of mass $n_J lt.eq M$ satisfies

#[#set math.equation(numbering: n => "(5.48)")
 $ V_J lt.eq C_M n_J . $ <hier:small-node-amount>]

Indeed $V_J \/ n_J lt.eq 1 + L^(C p) n_J^(alpha - 1)$ for the parameters.

#thm([Lemma 5.7.])[
  (Expansion into top paths).  #emph[Fix $z in Z$, a root, a shift, and parameters as above. Starting from a node with $n_J > M$, expand 
#[#set math.equation(numbering: n => "(5.49)")
 $ V_J = beta_J (n_J - sum_c n_c + sum_c V_c) \, $ <hier:exact-expansion>]

 and stop a branch on first reaching a node of mass at most $M$. At each expanding node, split $n_J - sum_c n_c$ into the individual weights of the tops which do not remain eligible at the block endpoint. At a stopped node split $V_J$ proportionally among its eligible top weights. This gives exactly one terminal path for each eligible root top $R$, with a terminal amount $e_R$ satisfying 
#[#set math.equation(numbering: n => "(5.50)")
 $ 0 < e_R lt.eq C_M h_R \, #h(2em) V_(upright("root")) = sum_R e_R product_(J upright(" active on ") R upright("’s path")) beta_J . $ <hier:top-path-expansion>]

 If $n_(upright("root")) > M$, at least one half of this sum comes from tops which are good at $z$. Consequently, 
#[#set math.equation(numbering: n => "(5.51)")
 $ V_(upright("root")) \( z \) lt.eq 2 C_M sum_(R upright(" eligible at root")\
R upright(" good at ") z) h_R \( z \) product_(J upright(" active on ") R upright("’s path")) beta_J \( z \) . $ <hier:good-path-domination>]

 If $n_(upright("root")) lt.eq M$, (5.48) applies instead.]
] <hier:path-expansion>

#proof[
  Identity (5.49) follows directly from (5.14), because $V_c - n_c = n_c^(alpha - p) ∥A_c∥^p$. The term $n_J - sum_c n_c$ is a sum of top weights by (5.4), now between the endpoints of the whole block. Every top either remains eligible in exactly one block child or loses eligibility and terminates at $J$. The construction therefore branches by disjoint top sets, assigning each top exactly one path. It terminates after finitely many blocks even if no mass stop occurs, since no top is eligible beyond the final level. At such a final expanding node the block-child sum is empty and all tops terminate directly.
  If $R$ terminates directly at an expanding node, its terminal amount is $h_R$. If it reaches a mass-stopped node $c$, the terminal amount is $\( V_c \/ n_c \) h_R$, which is at most $C_M h_R$ by (5.48). Repeated use of (5.49) proves the equality in (5.50).
  To verify the claim about bad paths, it is useful to normalize the expansion by actual probabilities. At an active node define
  $ D_J = n_J - sum_c n_c + sum_c V_c = n_J + sum_c \( V_c - n_c \) > M . $
  Choose a block child $c$ with probability $V_c \/ D_J$, or a directly terminating top $R$ with probability $h_R \/ D_J$. These probabilities sum to one. At a mass-stopped node choose an eligible top with probability $h_R \/ n_c$. The probability of a given complete terminal path is exactly its summand in (5.50) divided by $V_(upright("root"))$. In fact, for an active edge $J arrow.r c$, $V_c \/ D_J = beta_J V_c \/ V_J$, and at a direct terminal edge $h_R \/ D_J = beta_J h_R \/ V_J$. The successive $V_c$ factors cancel; at a mass stop the last factor $h_R \/ n_c$ leaves the amount $\( V_c \/ n_c \) h_R$. This proves the asserted probability identity without an independence assumption on the amplitudes.
  For a directly terminating top, its last conditional probability is $h_R \/ D_J lt.eq h_R \/ M lt.eq h_R$. If a top terminates in the next node by a mass stop, the combined last choice of that child and then that top has conditional probability
  $ V_c / D_J h_R / n_c lt.eq C_M h_R / M lt.eq C_M h_R . $
  Earlier conditional probabilities are at most one. Thus the unconditional probability of any specified terminal top is at most $C_M h_R$. This estimate also covers tops which terminate after many active ancestors; it uses only the last active step. By (5.44), the total probability of bad terminal tops is at most
  $ C_M sum_(R upright(" bad at ") z) h_R \( z \) lt.eq C_M e^(- L) < 1 / 2 $
  for all sufficiently large $L$. Here $log C_M = O \( p log L + log \( 1 + M \) \) = o \( L \)$ for each fixed $A_M$. The probability identity now implies that good tops carry at least half of the total amount, and the bound on $e_R$ proves (5.51). ◻
]

The remaining path estimate, proved below in 46, is

#[#set math.equation(numbering: n => "(5.52)")
 $ integral_(Z ∩ { R upright(" good") }) h_R product_(J upright(" active on ") R upright("’s path")) beta_J lt.eq L^(C p) \( 1 + M \)^C integral_(bb(R)^2) h_R . $ <eq:src-22>]

Section 5.11, Section 6 prove (5.52) from the estimates established above. Once that estimate is available, (5.51) and (5.1) control the integral of $V_(upright("root"))$ by summing over the eligible root tops.

=== 5.10 Path drops and marked spatial cells <path-drops-and-marked-spatial-cells>

Fix a top $R$ and one shift. Let $J_R$ be the last block index with $i_(J_R) lt.eq k_R$. For $0 lt.eq j lt.eq J_R$ put

#[#set math.equation(numbering: n => "(5.53)")
 $ J_j = v_(i_j) \( R \) \, #h(2em) n_j = n_(J_j) \, #h(2em) n_(J_R + 1) = 0 \, #h(2em) h_j^(*) = n_j - n_(j + 1) \, #h(2em) u_j = h_j^(*) / n_j . $ <hier:path-drops>]

For $j < J_R$, the path block child is $v_(i_(j + 1)) \( R \)$. For $j = J_R$ there is no path child: $R$ ceases to be eligible at the next block endpoint. Other tops in $J_j$ may still continue, and all their children are retained in (5.13) and (5.14). Only the path notation sets the next mass to zero. In particular, the last possible path drop has $h_j^(*) = n_j$ and $u_j = 1$.

The actual active indices form the prefix before the first mass at most $M$, equivalently the indices with $n_j > M$. A path which stops by mass need not reach its final possible block $J_R$. At the last active index of such a path we retain the actual eligible next mass in (5.53); it is not set to zero merely because the expansion stops there.

#thm([Lemma 5.8.])[
  (Drops and marking).  #emph[At a point of $Z_0$, the active path drops satisfy 
#[#set math.equation(numbering: n => "(5.54)")
 $ sum_(j : thin n_j > M) u_j lt.eq 1 + log^(+) n_0 / M lt.eq C L . $ <hier:drop-budget>]

 On each line of slope $s_R$, mark an $H_j$ cell $I$ when 
#[#set math.equation(numbering: n => "(5.55)")
 $ inf_(z in I) n_j \( z \) > M \, #h(2em) sup_(z in I) h_j^(*) \( z \) gt.eq 1 / 2 . $ <eq:src-23>]

 Every point of a marked cell is active and has $h_j^(*) gt.eq c$ for an absolute $c > 0$. At an active point in an unmarked cell with $h_j^(*) gt.eq 1$, one has $M < n_j < M + 1$ for all sufficiently large $L$. There is at most one such index on each active path, and its factor is bounded at points of $Z_0$ by 
#[#set math.equation(numbering: n => "(5.56)")
 $ beta_(J_j) lt.eq L^(C p) \( 1 + M \)^C . $ <hier:missing-factor>]

 If an index is inactive at a point, the cell containing that point is unmarked. Finally, even in the last possible block, 
#[#set math.equation(numbering: n => "(5.57)")
 $ H_j lt.eq frac(l_R, B sqrt(G)) . $ <hier:mesh-within-top>]

]
] <hier:marking>

#proof[
  If there are no active indices there is nothing to prove in (5.54). Otherwise let $q$ be the last active index. For $j < q$, the next mass is also greater than $M$, and
  $ u_j = 1 - n_(j + 1) / n_j lt.eq log n_j / n_(j + 1) . $
  The last term $u_q$ is at most one, whether its next mass is positive or zero. Therefore the sum is at most $1 + log \( n_0 \/ n_q \) lt.eq 1 + log \( n_0 \/ M \)$. This argument deliberately does not telescope through a possibly tiny mass below the stopping cutoff. Equation (3.19) gives the last inequality.
  Both $n_j$ and $h_j^(*)$ are positive sums of weights of tops eligible at $J_j$, except that the difference can be identically zero. In the last possible block it is simply $n_j$. Thus 36 gives relative variation $1 + O \( G^(- 1 \/ 2) \)$ across the whole $H_j$ cell. A marked cell has positive supremum of $h_j^(*)$, so this difference is not identically zero there, and its infimum is at least $1 / 2 e^(- C G^(- 1 \/ 2)) gt.eq 1 / 4$ for large $L$. The first marking condition supplies activity everywhere on the cell.
  Suppose instead that $z$ is active, its cell is unmarked, and $h_j^(*) \( z \) gt.eq 1$. The second marking condition then holds, so the first one fails: the cell has infimum mass at most $M$. The relative-motion bound implies
  $ M < n_j \( z \) lt.eq e^(C G^(- 1 \/ 2)) M < M + 1 \, $
  where the last inequality holds because $M$ is a fixed polynomial in $L$. Its drop of at least one gives $n_(j + 1) \( z \) < M$ (or zero at the last possible block), and all subsequent masses are at most that mass. This is consequently the last active index and can occur at most once. At a point of $Z_0$, since the denominator of (5.14) is at least $n_j$, (5.24) gives
  $ beta_(J_j) lt.eq V_(J_j) / n_j lt.eq 1 + L^(C p) n_j^(alpha - 1) lt.eq L^(C p) \( 1 + M \)^C \, $
  proving (5.56). If $n_j \( z \) lt.eq M$, its cell cannot have infimum greater than $M$, proving the assertion about inactive indices. This observation will justify assigning the value one to the auxiliary phase factor on every unmarked cell.
  Finally, eligibility at the starting level gives $d_R lt.eq rho_j \/ B^2$, equivalently $l_R gt.eq B^2 w \/ rho_j$. Together with (5.12), this yields
  $ H_j / l_R lt.eq frac(rho_j, B^2 rho_(j + 1) sqrt(G)) lt.eq frac(1, B sqrt(G)) . $
  This only uses eligibility at the start of the block, and therefore applies to the final possible block as well. ◻
]

All constructions above are finite and measurable. Their constants are uniform in the finite depth, so no lower bound on a nonzero top weight, or on the number of angular levels retained, is part of the argument. The limits from finite packet collections and the angular-translation average are taken only after the subsequent sections have obtained the uniform estimates.

=== 5.11 Prediction and averaging on marked cells <pred:section>

Fix a shift at a vertex of the analytic parameter simplex, with imaginary parameters of Euclidean norm at most $L^2$. Retain the block notation, path top $R$, and meshes from the preceding construction. Thus $J$ is the path interval at level $i_j$, its block children $c$ have width $rho_(j + 1)$, and

$ G rho_(j + 1) lt.eq rho_j lt.eq B rho_(j + 1) \, #h(2em) H_j = frac(w, rho_(j + 1) sqrt(G)) \, #h(2em) H_(j - 1) = frac(w, rho_j sqrt(G)) . $

The first inequalities include the initial, possibly shorter, block. The path child is denoted by $a$ when it exists. At the last path block there is no path child, even when some other tops continue; in that case the relative path drop is $u_j = 1$.

#thm([Proposition 5.9.])[
  (Averaging factors on marked cells).  #emph[There is an absolute $c_(upright("av")) > 0$ with the following property, for all sufficiently large $L$. On a fixed line of slope $s_R$, each marked $H_j$-cell $I$ meeting $Z$ admits a nonnegative function $Gamma_j$ which is constant on the $H_(j - 1)$-subcells of $I$, satisfies $\| I \|^(- 1) integral_I Gamma_j lt.eq 1$, and obeys 
#[#set math.equation(numbering: n => "(5.58)")
 $ beta_J^0 \( z \) lt.eq exp #scale(x: 120%, y: 120%)[\(] G^(- c_(upright("av"))) u_j \( z \) #scale(x: 120%, y: 120%)[\)] Gamma_j \( z \) #h(2em) \( z in I \) . $ <eq:src-24>]

 Set $Gamma_j = 1$ on unmarked cells and on cells not meeting $Z$. The functions can be chosen measurably on each fixed line. No choice jointly measurable in the family of parallel lines is needed.]
] <pred:marked-comparison>

We first construct a normalized prediction $tilde(beta)$ whose average is at most one for suitable probability measures. We compare it with $beta_J^0$, then blend it with one to obtain $cal(B)$, whose comparison error contains the relative path drop. Finally we pass to uniform cell measure, take the finer-cell supremum $cal(B)^sharp$, and normalize it to obtain $Gamma_j$. The losses in these last operations also contain the relative path drop.

=== 5.12 Snapshot data and denominator shrinkage <snapshot-data-and-denominator-shrinkage>

Fix a marked cell $I$ meeting $Z$, and choose one snapshot $z_0 in I ∩ Z$. Parameterize the line by horizontal displacement $b$ from $z_0$, and also write $I$ for the translated parameter interval. All unprimed masses and amplitudes below are evaluated at $z_0$; a prime denotes evaluation at $z_0 + \( b \, s_R b \)$. Let $n = n_J \( z_0 \)$ and $upsilon = u_j \( z_0 \)$. If the path child exists, then $upsilon = 1 - n_a \/ n$; otherwise $upsilon = 1$. The positive-mass motion bounds give

#[#set math.equation(numbering: n => "(5.59)")
 $ 1 / 2 upsilon lt.eq u_j \( z \) lt.eq 2 upsilon #h(2em) \( z in I \) $ <pred:drop-comparability>]

for large $L$. Marking ensures $upsilon > 0$. Only nonempty children are used. Their masses are positive at every point, since the sets of eligible tops are fixed and their weights are strictly positive.

Use the pointwise normalization (5.15), with $l_c$ and $X_c$ evaluated at the snapshot and the primed quantities evaluated at the displaced point. That identity expresses $beta_J^0$ in either set of data. The next construction shrinks snapshot vectors to obtain one-sided denominator comparisons for those children. When $upsilon < 1 \/ 2$, the path vector will instead remain unchanged so that its numerator and denominator variations can be compared together. All vector norms in this section are in $cal(H)$. The weights satisfy $sum_c l_c lt.eq 1$, and, when there is a path child, $sum_(c eq.not a) l_c lt.eq upsilon$. When there is none, an off-path sum means the sum over all children.

Choose a fixed exponent $C_(*)$, large enough for the estimates below, and put

#[#set math.equation(numbering: n => "(5.60)")
 $ K_(*) = L^(C_(*)) \( 1 + N^mu \) . $ <pred:amplitude-scale>]

Equations (3.19) and (5.24) imply, at the snapshot,

#[#set math.equation(numbering: n => "(5.61)")
 $ ∥X_c∥ lt.eq K_(*) \, #h(2em) n^mu lt.eq K_(*) \, #h(2em) sum_(c eq.not a) l_c^(1 - mu) ∥X_c∥ lt.eq K_(*) upsilon . $ <pred:snapshot-size>]

Enlarging the fixed exponent absorbs absolute constants here and below. For the last estimate use

$ l_c^(1 - mu) X_c = n^(mu - 1) A_c = n^mu l_c \( A_c \/ n_c \) . $

The sum over all children in this estimate is at most $K_(*)$.

Let $gamma > 0$ be a sufficiently small fixed exponent below the motion exponent in 38, and set $epsilon = G^(- gamma)$. This choice is independent of the depth, dimension, and parameters $L \, p \, D$. Decreasing $gamma$, if necessary, absorbs the fixed powers of $L$ in the following consequences of the motion estimates:

#[#set math.equation(numbering: n => "(5.62)")
 $ ∥l'_c ""^(1 \/ p) X'_c - cal(D)_c \( b \) l_c^(1 \/ p) X_c∥ & lt.eq epsilon l_c^(1 \/ p) n_c^mu \,\
∥n' ""^(mu - 1) lambda'_c A'_c - n^(mu - 1) lambda_c cal(D)_c \( b \) A_c∥ & lt.eq epsilon K_(*) l_c . $ <pred:scaled-motion>]

Both estimates hold throughout $I$, without a good-point hypothesis at the displaced point. For the scalar rescaling in the first one, write $l_c^(1 \/ p) X_c = n^(- 1 \/ p) n_c^(alpha \/ p - 1) A_c$. The exponents $- 1 \/ p$ and $alpha \/ p - 1$ are absolutely bounded. Their factors have the stated relative mass motion; the error in $A_c$ is bounded by (5.37), and its snapshot size is at most $L^C n_c$. This proves (5.62). For the second estimate use $n^(mu - 1)$, the relative complex motion of $lambda_c$, $lr(|lambda_c|) lt.eq 1$, and $n^(mu - 1) n_c = n^mu l_c lt.eq K_(*) l_c$.

Shrink $A_c$ radially toward zero by a distance at most $2 epsilon n_c$, choosing

$ tilde(A)_c = cases(delim: "{", \( 1 - 2 epsilon n_c \/ ∥A_c∥ \)_(+) A_c \, & A_c eq.not 0 \,, 0 \, & A_c = 0 .) $

If no eligible top in $c$ is significant at $z_0$, set $tilde(A)_c = 0$. This fits within the same error: 35 and the mask suppression give

$ ∥A_c∥ lt.eq L^C e^(- L log L) n_c lt.eq epsilon n_c $

for such a child. There is one exception: when $upsilon < 1 \/ 2$, leave the path vector unchanged, setting $tilde(A)_a = A_a$. Define $tilde(X)_c = n_c^(mu - 1) tilde(A)_c$. For every child to which shrinkage was applied,

#[#set math.equation(numbering: n => "(5.63)")
 $ l'_c ∥X'_c∥^p gt.eq l_c ∥tilde(X)_c∥^p #h(2em) \( b in I \) . $ <pred:denominator-lower-bound>]

Indeed radial shrinkage reduces the norm of $l_c^(1 \/ p) X_c$ by the smaller of its whole norm and $2 epsilon l_c^(1 \/ p) n_c^mu$, whereas (5.62) permits a reduction of at most $epsilon l_c^(1 \/ p) n_c^mu$ at a displaced point.

The bounds in (5.61) continue to hold with $tilde(X)_c$. Including the shrinkage error in (5.62) gives

#[#set math.equation(numbering: n => "(5.64)")
 $ ∥l'_c ""^(1 - mu) lambda'_c X'_c - l_c^(1 - mu) lambda_c cal(D)_c \( b \) tilde(X)_c∥ lt.eq C epsilon K_(*) l_c . $ <pred:shrunk-numerator-motion>]

=== 5.13 Exact averaging of the prediction <exact-averaging-of-the-prediction>

On the whole parameter line, define

#[#set math.equation(numbering: n => "(5.65)")
 $ F \( b \) = sum_c l_c^(1 - mu) lambda_c cal(D)_c \( b \) tilde(X)_c \, #h(2em) tilde(beta) \( b \) = frac(1 + ∥F \( b \)∥^p, 1 + sum_c l_c ∥tilde(X)_c∥^p) . $ <pred:model>]

The masses, scalar weights, and vectors are fixed snapshot data. Only the diagonal unitaries $cal(D)_c \( b \)_(xi xi) = e^(i \( s_R - t_c \) eta_xi b)$ vary.

#thm([Lemma 5.10.])[
  (Fourier-supported averaging).  #emph[There is a fixed sufficiently small $epsilon.alt' > 0$ such that, with 
#[#set math.equation(numbering: n => "(5.66)")
 $ Q = G^(3 \/ 4) rho_(j + 1) \, #h(2em) delta = epsilon.alt' Q \/ w \, $ <pred:separation-bandwidth>]

 every positive probability $nu$ satisfying $"supp" hat(nu) subset \( - delta \, delta \)$ obeys $integral tilde(beta) thin thin upright(d) nu lt.eq 1$.]
] <pred:fourier-average>

#proof[
  Use only children for which $tilde(X)_c eq.not 0$; an empty collection gives the assertion immediately. Apply the clock selection from (5.17) to this finite subfamily at the snapshot, with $Q$ as in (5.66). The clock rates are fixed as $b$ varies. Each retained set has pairwise interval distance at least $Q$, and the retention probabilities satisfy $pi_c gt.eq n_c \/ m_c$.
  Every used child other than the possible unshrunk path child contains a significant eligible top at $z_0$. From each retained child other than that possible exception, select one such top. Their slopes are $Q$-separated, their precisions satisfy
  $ d_T lt.eq rho_(j + 1) \/ B^2 lt.eq Q \/ B^2 \, $
  and their diameter is at most $rho_j lt.eq B rho_(j + 1) lt.eq B Q$. The simultaneous count in 30, with $D$ as chosen in (3.42), bounds this list by $D \/ 100$. Adding the possible retained path child leaves at most $D$ members. Clock exclusion separates that extra child too; it does not require a significant representative for that one child.
  In each Hilbert component, the retained carrier frequencies are separated by at least $c Q \/ w$, with $c > 0$ absolute, since $eta_xi asymp w^(- 1)$. Choose $epsilon.alt' lt.eq epsilon.alt_0 c$. For a retained set $cal(S)$, let
  $ F_(cal(S)) \( b \) = sum_(c in cal(S)) pi_c^(- 1) l_c^(1 - mu) lambda_c cal(D)_c \( b \) tilde(X)_c . $
  Expectation over the clocks gives $bb(E)_(cal(S)) F_(cal(S)) = F$; no independence of retention indicators is asserted or needed. Put $r = r_(*)$. Minkowski in that expectation, (4.3), and Jensen for the concave function $t^(1 \/ r)$ give
  #[#set math.equation(numbering: n => "(5.67)")
   $ ∥∥ F_(L^p \( nu \; cal(H) \)) & lt.eq bb(E)_(cal(S)) (sum_(c in cal(S)) pi_c^(- r) l_c lr(|lambda_c|)^r ∥tilde(X)_c∥^r)^(1 \/ r)\
 & lt.eq (sum_c pi_c^(1 - r) l_c lr(|lambda_c|)^r ∥tilde(X)_c∥^r)^(1 \/ r)\
 & lt.eq (sum_c l_c ∥tilde(X)_c∥^r)^(1 \/ r) lt.eq (sum_c l_c ∥tilde(X)_c∥^p)^(1 \/ p) . $ <pred:weighted-phase-bound>]
  The power of $l_c$ uses $r \( 1 - mu \) = 1$. The third line uses the retention cancellation (5.18) for the present child subfamily. The last inequality in (5.67) is Hölder with weights of total mass at most one and $r lt.eq p$; the missing mass can be placed at a zero vector. Raise to power $p$, add one, and divide by the constant denominator in (5.65). ◻
]

2 summarizes the horizontal scales used in the comparison and discretization below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (11.7, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.7, -0.12), (0.7, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3.8, -0.12), (3.8, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.75, -0.12), (6.75, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((10.5, -0.12), (10.5, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.7, 0.2), [#text(size: 9pt)[$H_(j-1)$#linebreak()$ frac(w, rho_j sqrt(G) )$]], anchor: "south", padding: 0.1176cm)
  content((3.8, 0.2), [#text(size: 9pt)[phase scale#linebreak()$ frac(w, Q)$]], anchor: "south", padding: 0.1176cm)
  content((6.75, 0.2), [#text(size: 9pt)[$H_j$#linebreak()$ frac(w, rho_(j+1) sqrt(G) )$]], anchor: "south", padding: 0.1176cm)
  content((10.5, 0.2), [#text(size: 9pt)[$l_*$#linebreak()$ frac(B^2w, rho_(j+1))$]], anchor: "south", padding: 0.1176cm)
  line((3.8, -0.65), (6.75, -0.65), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#0000a6")), end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((5.275, -0.68), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$ frac("QH"_j, w) =G^(1"/"4)$]]], anchor: "north", padding: 0.1176cm)
  line((6.75, -1.35), (10.5, -1.35), stroke: (paint: rgb("#003300"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#003300")), end: (symbol: ">>", fill: rgb("#003300"))))
  content((8.625, -1.38), [#text(fill: rgb("#003300"))[#text(size: 9pt)[$ frac(l_*, H_j) =B^2 sqrt(G)$]]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The horizontal-length axis (schematic) for a marked block. Here $Q = G^(3 \/ 4) rho_(j + 1)$ is the retained angular separation and $G rho_(j + 1) lt.eq rho_j lt.eq B rho_(j + 1)$, including the initial block. The quantity $l_(*) = B^2 w \/ rho_(j + 1)$ is the lower bound for predictable packet lengths in (5.38). On an interval of length $H_j$, the separated relative phases oscillate many times while the packet envelopes move little. The preceding mesh also satisfies $H_(j - 1) rho_j \/ w = G^(- 1 \/ 2)$, which controls the step supremums. Absolute frequency constants are suppressed. ],
) <fig:phase-scales>

=== 5.14 Comparison to the actual factor <comparison-to-the-actual-factor>

On the underlying real Hilbert space put $cal(L) \( Y \) = log \( 1 + ∥∥ Y^p \)$. For $p gt.eq 4$,

#[#set math.equation(numbering: n => "(5.68)")
 $ ∥nabla cal(L) \( Y \)∥ lt.eq p \, #h(2em) ∥D^2 cal(L) \( Y \)∥ lt.eq C p^2 . $ <pred:log-derivatives>]

Indeed its radial first derivative is $p r^(p - 1) \/ \( 1 + r^p \)$, its radial second derivative is

$ frac(p \( p - 1 \) r^(p - 2), 1 + r^p) - frac(p^2 r^(2 p - 2), \( 1 + r^p \)^2) \, $

and each tangential Hessian eigenvalue is $p r^(p - 2) \/ \( 1 + r^p \)$. Splitting into $r lt.eq 1$ and $r gt.eq 1$ proves the bounds; the formulas extend continuously at zero. No dimension enters these estimates.

If $upsilon gt.eq 1 \/ 2$, every child was shrunk. The denominator comparison (5.63), the sum of (5.64), and (5.68) yield

#[#set math.equation(numbering: n => "(5.69)")
 $ log beta_J^0 \( z \) - log tilde(beta) \( b \) lt.eq C p K_(*) epsilon upsilon \, #h(2em) upsilon gt.eq 1 \/ 2 . $ <pred:balanced-comparison>]

The factor $upsilon$ here costs only an absolute factor of two.

For $0 < upsilon < 1 \/ 2$, retaining that factor requires the unshrunk path vector. Write $sigma_a = lambda_a \/ lr(|lambda_a|)$ and remove $cal(D)_a \( b \)$ and $sigma_a$ from the predicted numerator. With

$ Y & = l_a^(1 \/ p) X_a \,\
C_a & = l_a^(1 - mu - 1 \/ p) lr(|lambda_a|) = l_a^(1 - alpha \/ p) \( n_a \/ m_a \)^mu \,\
Z_1 \( b \) & = sigma_a^(- 1) cal(D)_a \( b \)^(- 1) sum_(c eq.not a) l_c^(1 - mu) lambda_c cal(D)_c \( b \) tilde(X)_c \,\
R_1 & = sum_(c eq.not a) l_c ∥tilde(X)_c∥^p \, $

the prediction becomes

#[#set math.equation(numbering: n => "(5.70)")
 $ tilde(beta) \( b \) = frac(1 + ∥C_a Y + Z_1 \( b \)∥^p, 1 + ∥∥ Y^p + R_1) . $ <pred:path-baseline>]

Here $Y \, C_a$, and the denominator are constant on the whole line. Since $n_a lt.eq m_a lt.eq n$, both $l_a$ and $n_a \/ m_a$ lie in $\[ 1 - upsilon \, 1 \]$. As $1 - alpha \/ p gt.eq 0$, we have

#[#set math.equation(numbering: n => "(5.71)")
 $ 0 < C_a lt.eq 1 \, #h(2em) 1 - C_a lt.eq C upsilon \, #h(2em) ∥Z_1 \( b \)∥ lt.eq K_(*) upsilon . $ <pred:path-coefficient>]

In the actual numerator remove $cal(D)_a \( b \)$ and $sigma'_a = lambda'_a \/ lr(|lambda'_a|)$. Define

$ Y' = l'_a ""^(1 \/ p) cal(D)_a \( b \)^(- 1) X'_a \, #h(2em) C'_a = l'_a ""^(1 - mu - 1 \/ p) lr(|lambda'_a|) \, #h(2em) R'_1 = sum_(c eq.not a) l'_c ∥X'_c∥^p \, $

and let $Z'_1$ be the remaining, similarly rotated off-path sum. The actual ratio has the form (5.70) with primes. We have

#[#set math.equation(numbering: n => "(5.72)")
 $ ∥Y' - Y∥ & lt.eq C epsilon K_(*) \, & lr(|C'_a - C_a|) & lt.eq C epsilon upsilon \,\
∥Z'_1 - Z_1∥ & lt.eq C epsilon K_(*) upsilon \, & R'_1 & gt.eq R_1 . $ <pred:path-errors>]

The first and last statements follow from (5.62) and (5.63). For the off-path sum, sum (5.64) over $c eq.not a$, whose weights sum to at most $upsilon$. Changing the removed scalar phase costs at most $C epsilon$ times the off-path size, because $lr(|sigma'_a - sigma_a|) lt.eq C epsilon$.

The extra $upsilon$ in the coefficient estimate follows from the complementary-mass assertion of 36. If $r = A \/ \( A + B \)$, with $A > 0$, $B gt.eq 0$, and the positive summands change relatively by at most $C epsilon$, then

$ \| r' - r \| lt.eq C epsilon r \( 1 - r \) \, #h(2em) \| log r' - log r \| lt.eq C epsilon \( 1 - r \) . $

If $B = 0$, the ratio is identically one. Apply this to $n_a \/ n$, with complement $n - n_a$, and to $n_a \/ m_a$, with complement $m_a - n_a$. Both values of $1 - r$ are at most $upsilon$. The bounded nonnegative powers defining $C_a$ give its claimed variation. This concerns the modulus of the path weight; its scalar phase has already been removed.

Set $frak(r) = R_1 \/ \( 1 + ∥∥ Y^p + R_1 \)$. We claim

#[#set math.equation(numbering: n => "(5.73)")
 $ log beta_J^0 \( z \) - log tilde(beta) \( b \) & lt.eq C p^2 K_(*)^2 epsilon upsilon + C p K_(*) epsilon frak(r) \,\
- log tilde(beta) \( b \) & gt.eq frak(r) - C p K_(*) upsilon . $ <eq:src-26>]

Hold $Z_1 = Z_1 \( b \)$ fixed when comparing $Y$ with $Y'$. The derivative in $V$ of $cal(L) \( C_a V + Z_1 \) - cal(L) \( V \)$, along that segment, is bounded by

$ p \| 1 - C_a \| + C p^2 #scale(x: 120%, y: 120%)[\(] \| 1 - C_a \| ∥∥ V + ∥Z_1∥ #scale(x: 120%, y: 120%)[\)] lt.eq C p^2 K_(*) upsilon . $

Equation (5.72) bounds its change by $C p^2 K_(*)^2 epsilon upsilon$. The changes in $C_a \, Z_1$ fit the same bound by (5.68).

For the residual denominator, set

$ J \( V \) = - log \( 1 + R_1 e^(- cal(L) \( V \)) \) . $

Its derivative has norm at most $p R_1 \/ \( e^(cal(L) \( V \)) + R_1 \)$. On the segment from $Y$ to $Y'$, $lr(|cal(L) \( V \) - cal(L) \( Y \)|) lt.eq C p K_(*) epsilon$. This tends to zero as $L$ increases, so that residual ratio is at most $2 frak(r)$, and $J \( Y' \) - J \( Y \) lt.eq C p K_(*) epsilon frak(r)$. The actual residual $R'_1 gt.eq R_1$ can only decrease the actual ratio. This proves the first inequality of (5.73). For the second, use $C_a lt.eq 1$, (5.68), and $log \( 1 + t \) gt.eq t \/ \( 1 + t \)$:

$ - log tilde(beta) & = cal(L) \( Y \) - cal(L) \( C_a Y + Z_1 \) + log \( 1 + R_1 e^(- cal(L) \( Y \)) \)\
 & gt.eq - p ∥Z_1∥ + frak(r) gt.eq frak(r) - C p K_(*) upsilon . $

=== 5.15 Absorbing the baseline error by blending <absorbing-the-baseline-error-by-blending>

The parameter sizes give

#[#set math.equation(numbering: n => "(5.74)")
 $ p K_(*) = G^(o \( 1 \)) quad upright("as ") L arrow.r oo \, $ <pred:subpower-amplitude>]

with every preceding constant fixed. Indeed $log N lt.eq 2 L$, $mu = O \( L^(- 1 \/ 2) \)$, and $log G asymp L^(7 \/ 10)$, so $log \( p K_(*) \) = O \( sqrt(L) + log L \) = o \( log G \)$. All the preceding smallness requirements consequently follow from a single sufficiently large lower bound on $L$.

Set $theta_(upright("bl")) = sqrt(epsilon)$ and blend the prediction with one:

#[#set math.equation(numbering: n => "(5.75)")
 $ cal(B) \( b \) = \( 1 - theta_(upright("bl")) \) tilde(beta) \( b \) + theta_(upright("bl")) . $ <pred:blend>]

It retains average at most one for every probability in 43. Concavity of the logarithm gives

$ log cal(B) - log tilde(beta) gt.eq - theta_(upright("bl")) log tilde(beta) . $

For $upsilon < 1 \/ 2$, Equation (5.73) yields

$ log beta_J^0 - log cal(B) & lt.eq #scale(x: 120%, y: 120%)[\(] C p^2 K_(*)^2 epsilon + C p K_(*) theta_(upright("bl")) #scale(x: 120%, y: 120%)[\)] upsilon + #scale(x: 120%, y: 120%)[\(] C p K_(*) epsilon - theta_(upright("bl")) #scale(x: 120%, y: 120%)[\)] frak(r)\
 & lt.eq #scale(x: 120%, y: 120%)[\(] C p^2 K_(*)^2 epsilon + C p K_(*) sqrt(epsilon) #scale(x: 120%, y: 120%)[\)] upsilon . $

The last coefficient of $frak(r)$ is nonpositive for large $L$. For $upsilon gt.eq 1 \/ 2$, use (5.69) and $log tilde(beta) lt.eq cal(L) \( F \) lt.eq p ∥∥ F lt.eq C p K_(*)$ to obtain the same last bound. Therefore

#[#set math.equation(numbering: n => "(5.76)")
 $ beta_J^0 \( z \) lt.eq e^(a_L upsilon) cal(B) \( b \) \, #h(2em) a_L = C p^2 K_(*)^2 epsilon + C p K_(*) sqrt(epsilon) lt.eq G^(- gamma \/ 3) $ <pred:blended-domination>]

for sufficiently large $L$. The baseline has absorbed the term proportional to $frak(r)$; the remaining error is proportional to $upsilon$.

=== 5.16 Changing to uniform measure without a loss per level <changing-to-uniform-measure-without-a-loss-per-level>

Choose a fixed nonnegative Schwartz function $k$ of integral one with $"supp" hat(k) subset \[ - 1 \/ 4 \, 1 \/ 4 \]$. For example, square the absolute value of the inverse Fourier transform of a nonzero smooth function supported in $\( - 1 \/ 8 \, 1 \/ 8 \)$ and normalize its integral. Let $H = H_j$, $h = G^(- 1 \/ 16)$, $s = H G^(- 1 \/ 8)$, and $k_s \( t \) = s^(- 1) k \( t \/ s \)$. Let $I^(+)$ be the concentric enlargement of $I$ of length $\( 1 + h \) H$, and define

#[#set math.equation(numbering: n => "(5.77)")
 $ thin upright(d) nu_I \( t \) = (frac(upright(bold(1))_(I^(+)), \| I^(+) \|) * k_s) \( t \) thin thin upright(d) t . $ <pred:majorant-probability>]

This is a positive probability whose Fourier transform is supported in $\[ - 1 \/ \( 4 s \) \, 1 \/ \( 4 s \) \]$. Since $H delta = epsilon.alt' G^(1 \/ 4)$, this support lies strictly inside $\( - delta \, delta \)$ for large $L$.

Every point of $I$ is at distance at least $h H \/ 2$ from the complement of $I^(+)$. The Schwartz tail beyond $\( h H \) \/ \( 2 s \) = G^(1 \/ 16) \/ 2$ is $O \( G^(- 1 \/ 8) \)$, by a fixed tail estimate. Thus the density in (5.77) is at least $H^(- 1) \( 1 - C G^(- 1 \/ 16) \)$ on $I$. Writing $omega_I$ for uniform probability on $I$, choose $0 < eta lt.eq C G^(- 1 \/ 16) < 1 \/ 2$ so that

#[#set math.equation(numbering: n => "(5.78)")
 $ nu_I gt.eq \( 1 - eta \) omega_I \, #h(2em) nu_I = \( 1 - eta \) omega_I + eta nu_(upright("rem")) $ <pred:measure-decomposition>]

for a positive probability $nu_(upright("rem"))$.

The bound $integral cal(B) thin thin upright(d) nu_I lt.eq 1$ alone would lose an amount of order $eta$ on changing measure. We need a bound proportional to $upsilon$. If $tilde(beta) lt.eq 1$ on the whole line, then $cal(B) lt.eq 1$ and its uniform average is already at most one. Otherwise choose $b_0$ with $tilde(beta) \( b_0 \) > 1$. When $upsilon < 1 \/ 2$, the denominator and path vector in (5.70) are fixed. For all $b in bb(R)$,

$ log tilde(beta) \( b \) & gt.eq log tilde(beta) \( b_0 \) - p ∥Z_1 \( b \) - Z_1 \( b_0 \)∥\
 & gt.eq - 2 p K_(*) upsilon . $

Consequently

#[#set math.equation(numbering: n => "(5.79)")
 $ \( 1 - tilde(beta) \( b \) \)_(+) lt.eq C p K_(*) upsilon #h(2em) \( b in bb(R) \) . $ <pred:negative-deviation>]

This does not assume an upper bound on $R_1$: its contribution cancels in the logarithmic difference. Equivalently, a value exceeding one already forces $R_1 \/ \( 1 + ∥∥ Y^p \) lt.eq e^(C p K_(*) upsilon) - 1$. For $upsilon gt.eq 1 \/ 2$, Equation (5.79) follows from nonnegativity since $p K_(*) upsilon gt.eq 1$. The blend inherits the same lower bound, as $\( 1 - cal(B) \)_(+) = \( 1 - theta_(upright("bl")) \) \( 1 - tilde(beta) \)_(+)$.

In the case where the prediction exceeds one somewhere, (5.78) gives

$ 1 gt.eq integral cal(B) thin thin upright(d) nu_I gt.eq \( 1 - eta \) integral cal(B) thin thin upright(d) omega_I + eta \( 1 - C p K_(*) upsilon \) . $

Including the easier case $cal(B) lt.eq 1$, this proves

#[#set math.equation(numbering: n => "(5.80)")
 $ integral cal(B) thin thin upright(d) omega_I lt.eq 1 + C G^(- 1 \/ 16) p K_(*) upsilon . $ <pred:uniform-average>]

The relative mass drop has survived the change of probability.

=== 5.17 Step supremums and normalization <step-supremums-and-normalization>

The points $s_R \, t_c$ lie in $J$, so all component frequencies of $cal(D)_c$ have magnitude at most $C rho_j \/ w$. For $upsilon gt.eq 1 \/ 2$, differentiating (5.65) and using (5.61) gives $∥partial_b F \( b \)∥ lt.eq C \( rho_j \/ w \) K_(*)$. For $upsilon < 1 \/ 2$, remove the path carrier as in (5.70). The off-path frequencies are $\( t_a - t_c \) eta_xi$, again of magnitude at most $C rho_j \/ w$, so $∥partial_b Z_1 \( b \)∥ lt.eq C \( rho_j \/ w \) K_(*) upsilon$. In both cases,

$ lr(|frac(thin upright(d), thin upright(d) b) log tilde(beta) \( b \)|) lt.eq C p K_(*) upsilon rho_j / w . $

Blending cannot increase the absolute logarithmic derivative, because

$ frac(thin upright(d), thin upright(d) b) log cal(B) = frac(\( 1 - theta_(upright("bl")) \) tilde(beta), cal(B)) frac(thin upright(d), thin upright(d) b) log tilde(beta) \, #h(2em) 0 lt.eq frac(\( 1 - theta_(upright("bl")) \) tilde(beta), cal(B)) lt.eq 1 . $

On each $H_(j - 1)$-subcell $I' subset I$, let $cal(B)^sharp$ equal $sup_(b in overline(I')) cal(B) \( b \)$. The prediction is positive and continuous, and these compact-cell supremums are finite. The meshes are nested. Since $H_(j - 1) rho_j \/ w = G^(- 1 \/ 2)$,

#[#set math.equation(numbering: n => "(5.81)")
 $ cal(B) lt.eq cal(B)^sharp lt.eq e^(b_L upsilon) cal(B) \, #h(2em) b_L = C p K_(*) G^(- 1 \/ 2) . $ <pred:step-supremum>]

Use the fixed half-open mesh convention at endpoints; taking supremums over closed subcells preserves the inequalities. Define

#[#set math.equation(numbering: n => "(5.82)")
 $ m_I = max (1 \, integral cal(B)^sharp thin thin upright(d) omega_I) \, #h(2em) Gamma_j = cal(B)^sharp \/ m_I quad upright("on ") I . $ <pred:gamma-normalization>]

This function is nonnegative, constant on the finer cells, and has average at most one. Equations (5.80) and (5.81) yield

#[#set math.equation(numbering: n => "(5.83)")
 $ log m_I lt.eq #scale(x: 120%, y: 120%)[\(] b_L + C G^(- 1 \/ 16) p K_(*) #scale(x: 120%, y: 120%)[\)] upsilon . $ <pred:normalization-cost>]

#proof[
  Perform the construction on each marked cell meeting $Z$. Equations (5.76), (5.81), and (5.82) give
  $ beta_J^0 \( z \) lt.eq e^(a_L upsilon) cal(B) \( b \) lt.eq e^(a_L upsilon) cal(B)^sharp \( b \) = e^(a_L upsilon) m_I Gamma_j \( b \) . $
  By (5.83), the exponent is at most
  $ #scale(x: 120%, y: 120%)[\(] G^(- gamma \/ 3) + C p K_(*) G^(- 1 \/ 2) + C p K_(*) G^(- 1 \/ 16) #scale(x: 120%, y: 120%)[\)] upsilon . $
  Equations (5.74) and (5.59) bound this by $G^(- c_(upright("av"))) u_j \( z \)$, for a fixed positive exponent: choose $c_(upright("av")) < min \( gamma \/ 4 \, 1 \/ 64 \)$ and then take $L$ sufficiently large. This proves (5.58) with no error independent of the mass drop.
  There are countably many cells on each fixed line and finitely many levels in the current truncation. Choose one snapshot in every relevant cell, use (5.82) there, and set $Gamma_j = 1$ elsewhere. This is a measurable step function of the line parameter. The proof of 46 integrates the original integrand on lines where its slice is measurable, as holds for almost every transverse parameter. It therefore needs no jointly measurable snapshot choices across parallel lines. ◻
]

== 6 Residual terms and integration along paths <res:section>

We work with a finite tile collection and a fixed angular translation. Fix a shift $sigma$ and a parameter $zeta$ whose real part is the corresponding vertex: $Re zeta_sigma = mu$, all other real parts vanish, and $∥Im zeta∥_2 lt.eq L^2$. All estimates in this section are uniform in these choices, the number of tiles, the angular depth, and $dim cal(H)$. We take $L$ sufficiently large that

#[#set math.equation(numbering: n => "(6.1)")
 $ p > alpha \, #h(2em) 0 < mu lt.eq 1 / 12 . $ <res:small-mu>]

We retain the stopping threshold $M = L^(A_M)$ from (5.46); its fixed exponent will be chosen at the end of the residual estimates.

Fix a path top $R$. We retain the block notation of the hierarchy: $J_j = v_(i_j) \( R \)$, $n_j = n_(J_j)$, and $A_j = A_(J_j)$. The last possible block is the last one whose starting node contains $R$ as an eligible top. At this last block there is no path child, even if other tops continue; the next path mass is defined to be zero. At every other block write $J_(j + 1)$ for the path child and set

$ h_j^(*) = n_j - n_(j + 1) \, #h(2em) u_j = h_j^(*) / n_j . $

An index is active if $n_j > M$. The active indices form a prefix. On $Z$, the mass bound (3.19) and monotonicity give

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(j upright(" active")) u_j lt.eq C L . $ <res:relative-drop-sum>]

Indeed, except for the last active index, use $1 - n_(j + 1) \/ n_j lt.eq log \( n_j \/ n_(j + 1) \)$ and telescope down to a mass larger than $M$. The final summand is at most one. This proof also applies when the path stops by ineligibility.

=== 6.1 Marked residuals <marked-residuals>

For $n > 0$ and $A in cal(H)$, put

$ V \( n \, A \) = n + n^(alpha - p) ∥A∥^p = n #scale(x: 120%, y: 120%)[\(] 1 + ∥n^(mu - 1) A∥^p #scale(x: 120%, y: 120%)[\)] . $

The function $cal(L)_p \( Y \) = log \( 1 + ∥Y∥^p \)$ is globally $p$-Lipschitz on the underlying real Hilbert space. Away from zero its derivative has norm $p ∥Y∥^(p - 1) \/ \( 1 + ∥Y∥^p \) lt.eq p$, and the assertion at zero follows by continuity. Since $beta_J$ and $beta_J^0$ have the same denominator, the decomposition (5.13) therefore implies

#[#set math.equation(numbering: n => "(6.3)")
 $ log beta_(J_j) - log beta_(J_j)^0 lt.eq C p thin n_j^(- 1 + mu) ∥B_(J_j)∥ . $ <eq:src-27>]

#thm([Lemma 6.1.])[
  (Square summation of residual blocks).  #emph[At a point $z in Z$ where $R$ is a good path, 
#[#set math.equation(numbering: n => "(6.4)")
 $ (sum_j ∥B_(J_j) \( z \)∥^2)^(1 \/ 2) lt.eq L^(C_b) . $ <res:block-square-bound>]

 Here the sum can be restricted to any subset of the possible blocks. The fixed exponent $C_b$ is independent of $M$.]
] <res:block-square>

#proof[
  A residual packet in block $j$ has
  #[#set math.equation(numbering: n => "(6.5)")
   $ rho_(j + 1) / B^2 < d_s lt.eq rho_j / B^2 \, #h(2em) i_j lt.eq k_s < i_(j + 1) . $ <res:residual-range>]
  Because $rho_j \/ rho_(j + 1) lt.eq B$, this block contains at most $N_(upright("len")) := C \( 1 + log B \)$ dyadic packet lengths. Also $s_(T \( s \)) \, s_R in J_j$, so the top assignment and (6.5) imply
  $ lr(|theta_s - s_R|) lt.eq C d_s + rho_j lt.eq C B^3 d_s lt.eq C B^4 d_s . $
  Thus the reference-line estimates apply whenever $ell_s lt.eq l_R$.
  The coefficient multiplying $q_(T \( s \)) phi.alt_s$ in $B_(J_j)$ is a product of transition weights of modulus at most one, followed by $n_(v_(k_s) \( T \( s \) \))^(- mu \/ K)$. The ending mass is at least $h_(T \( s \))$. Consequently the modulus of the coefficient multiplying $phi.alt_s$ is at most $\| q_(T \( s \)) \| h_(T \( s \))^(- mu \/ K) lt.eq C$. This last bound follows from the mask estimate (2.43): on the significant region $h_T gt.eq 1$, while off that region the mask has faster decay than this fixed small negative power of $h_T$.
  At $z$ let $e_ell$ and $a_ell$ be the sums of the absolute error and main envelopes, respectively, at length $ell$ in the fixed family $cal(P)_R$ of (5.40). The preceding bounds place every residual packet with $ell_s lt.eq l_R$ in this family, so its absolute envelopes are included in these positive sums. Goodness of $R$, as specified in 39, gives
  $ sum_(ell lt.eq l_R) e_ell lt.eq L^C \, #h(2em) (sum_(ell lt.eq l_R) a_ell^2)^(1 \/ 2) lt.eq L^C . $
  The contribution of such lengths to $∥B_(J_j)∥$ is bounded by $C sum_(ell in cal(I)_j) \( e_ell + a_ell \)$, where $cal(I)_j$ is the set of residual lengths in that block. The sets $cal(I)_j$ are disjoint. Positivity and Cauchy–Schwarz within each block therefore give
  $ {sum_j (sum_(ell in cal(I)_j \, thin ell lt.eq l_R) e_ell)^2}^(1 \/ 2) & lt.eq sum_(ell lt.eq l_R) e_ell \,\
sum_j (sum_(ell in cal(I)_j \, thin ell lt.eq l_R) a_ell)^2 & lt.eq N_(upright("len")) sum_(ell lt.eq l_R) a_ell^2 . $
  The factor $N_(upright("len"))$ is polynomial in $L$.
  Before the last possible block, $R$ remains eligible at the child level. Hence $d_R lt.eq rho_(j + 1) \/ B^2 < d_s$, and consequently $ell_s < l_R$. Lengths larger than $l_R$ can occur only in the last possible block. At each of its at most $N_(upright("len"))$ lengths, the total absolute coefficient envelope is bounded by a constant, by 23, applied with reference length equal to that scale. To recall the reason this bound has no factor counting the available labels, the condition $\| theta_s - s_R \| lt.eq C B^4 d_s$ makes the analyzing and synthesizing box envelopes comparable to common $s_R$-coordinate envelopes, since $W gt.double B^4 w$. Summing centers first produces a common positive convolution kernel of integral $O \( 1 \)$. At each source point only boundedly many selector labels are nonzero. Summing these labels then uses $∥g∥_(cal(H)) lt.eq 1$, and costs $O \( 1 \)$. The uniformly bounded multipliers just considered preserve this absolute estimate. The last block therefore contributes at most $C N_(upright("len"))$ in norm. Combining the estimates proves (6.4). ◻
]

By 41, at any marked point one has $h_j^(*) gt.eq c_m$ for a fixed $c_m > 0$. Monotonicity of the masses therefore implies

#[#set math.equation(numbering: n => "(6.6)")
 $ \# { j : med j upright(" marked at ") z \, med t lt.eq n_j < 2 t } lt.eq C \( 1 + t \) \, #h(2em) t gt.eq M . $ <res:marked-shell-count>]

For completeness, all but the final marked index in this shell account for disjoint mass drops of size at least $c_m$ while the mass lies in an interval of length at most $t$; the final index costs one even if its drop leaves the shell. Dyadic summation gives

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(j upright(" marked at ") z) n_j^(- 2 + 2 mu) lt.eq C sum_(r gt.eq 0) \( 2^r M \)^(- 1 + 2 mu) lt.eq C M^(- 1 + 2 mu) . $ <res:marked-weight-sum>]

Combining (6.3), 44, and Cauchy–Schwarz yields

#[#set math.equation(numbering: n => "(6.8)")
 $ sum_(j upright(" marked at ") z) #scale(x: 120%, y: 120%)[\(] log beta_(J_j) - log beta_(J_j)^0 #scale(x: 120%, y: 120%)[\)] lt.eq C p L^(C_b) M^(- 1 \/ 2 + mu) . $ <res:marked-cost>]

=== 6.2 Unary segments and their energy telescope <unary-segments-and-their-energy-telescope>

Call an active index #emph[unary] at $z$ if its cell is unmarked and $h_j^(*) \( z \) < 1$. At such an index the path child exists: at the last possible block the drop would instead be $n_j > M$. A significant top has mass at least one. Thus every significant top eligible in $J_j$ must remain eligible in the path child, since the total mass removed from that child is $h_j^(*) < 1$.

At a unary index write

#[#set math.equation(numbering: n => "(6.9)")
 $ A_j = lambda_j A_(j + 1) + U_j + W_j . $ <res:unary-decomposition>]

Here $lambda_j$ is the path-child coefficient in (5.13); $U_j$ consists of the residual packets assigned to tops which remain eligible in the path child. These are exactly the packets of the fixed subset $cal(Q)_(R \, sigma)$ in (5.41) which stop in block $j$. The term $W_j$ collects all contributions of tops eligible in $J_j$ which do not continue in the path child, including their residual packets and, when present, their contributions through other children.

Those latter tops are all insignificant at $z$. Their contributions within $A_(J_j)$ are whole interval sums on individual tops, so 35 bounds the contribution of each by $L^C \( 1 + ∥zeta∥ \) \| q_T \| h_T^4$. Since $h_T$ is bounded above by an absolute constant and $\| q_T \| lt.eq e^(- L log L)$ there, this is at most $C e^(- L) h_T$ for sufficiently large $L$. The masses of these tops sum to $h_j^(*)$. Therefore

#[#set math.equation(numbering: n => "(6.10)")
 $ ∥W_j∥ lt.eq C e^(- L) h_j^(*) . $ <res:discarded-top-error>]

This estimate uses a sum of top masses, not the number of such tops.

Partition each consecutive run of unary indices into consecutive segments $\[ e \, f \)$. Starting at $e$, end a completed segment as soon as its accumulated drop is at least one. Each individual drop is less than one, so every completed segment has total drop in $\[ 1 \, 2 \)$. At the end of the run, retain the final remainder as one segment if it is nonempty. Hence every segment satisfies

#[#set math.equation(numbering: n => "(6.11)")
 $ Delta_(e \, f) := sum_(e lt.eq j < f) h_j^(*) = n_e - n_f < 2 \, #h(2em) n_f > M - 2 \, #h(2em) n_j asymp n_e quad \( e lt.eq j lt.eq f \) . $ <res:segment-masses>]

The endpoint remains an eligible path node, including when it is the node where the mass stopping rule first applies.

The number of segment starts in a mass shell obeys

#[#set math.equation(numbering: n => "(6.12)")
 $ \# { \[ e \, f \) : med t lt.eq n_e < 2 t } lt.eq C \( 1 + t \) \, #h(2em) t gt.eq M . $ <res:segment-shell-count>]

Completed segments account for disjoint drops of size at least one. For each remainder other than the final remainder on the path, charge it to the next interruption of a unary run. Such an interruption is either marked, with drop at least $c_m$, or is an active unmarked index with drop at least one. The mass at this interruption differs from the start mass of the remainder by less than two. Thus the interruptions charged by starts in $\[ t \, 2 t \)$ lie in the enlarged shell $\[ t - 2 \, 2 t \)$ and their fixed positive drops give $O \( 1 + t \)$ choices. The one possible final remainder adds one.

For one segment define

$ A_i^(*) = (product_(i lt.eq j < f) lambda_j) A_f \, #h(2em) V_i^(*) = V \( n_i \, A_i^(*) \) \, #h(2em) e lt.eq i lt.eq f \, $

with the empty product equal to one. Since $n_i gt.eq n_(i + 1)$, $alpha - p < 0$, and $\| lambda_i \| lt.eq 1$, we have

#[#set math.equation(numbering: n => "(6.13)")
 $ V_i^(*) lt.eq h_i^(*) + V_(i + 1)^(*) \, #h(2em) V_f^(*) = V_f . $ <res:starred-subsolution>]

Indeed, the baseline terms differ by $h_i^(*)$, while the energy term on the left is at most $n_(i + 1)^(alpha - p) ∥A_(i + 1)^(*)∥^p$. The denominator of $beta_(J_i)$ contains the energy of the path child and the nonnegative energies of all other children. It is therefore at least $h_i^(*) + V_(i + 1)$. It follows that

$ sum_(e lt.eq i < f) log beta_(J_i) lt.eq log V_e - log V_f - sum_(e lt.eq i < f) log \( 1 + h_i^(*) \/ V_(i + 1) \) . $

On the other hand, (6.13) gives

$ log V_e^(*) - log V_f lt.eq sum_(e lt.eq i < f) log \( 1 + h_i^(*) \/ V_(i + 1)^(*) \) . $

Subtracting these inequalities produces the useful estimate

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(e lt.eq i < f) log beta_(J_i) & lt.eq log \( V_e \/ V_e^(*) \) + sum_(e lt.eq i < f) [log \( 1 + h_i^(*) \/ V_(i + 1)^(*) \) - log \( 1 + h_i^(*) \/ V_(i + 1) \)]\
 & lt.eq C p thin n_e^(- 1 + mu) max_(e lt.eq i lt.eq f) ∥A_i - A_i^(*)∥ . $ <eq:src-28>]

To justify the last line, first use the Lipschitz estimate for $cal(L)_p$ to obtain

$ \| log V \( n \, A \) - log V \( n \, A' \) \| lt.eq p n^(mu - 1) ∥A - A'∥ . $

For $h gt.eq 0$, the derivative of $x mapsto log \( 1 + h e^(- x) \)$ has absolute value $h \/ \( e^x + h \)$. Along the interval between $log V_(i + 1)$ and $log V_(i + 1)^(*)$, both endpoint amounts, and therefore every intermediate amount, are at least $n_(i + 1)$. The corresponding correction term is bounded by

$ h_i^(*) / n_(i + 1) p n_(i + 1)^(mu - 1) ∥A_(i + 1) - A_(i + 1)^(*)∥ . $

Now use (6.11) and $sum_(e lt.eq i < f) h_i^(*) \/ n_(i + 1) lt.eq 2 \/ \( M - 2 \)$. This proves (6.14), including its endpoint case.

=== 6.3 Common residual weights and variation <common-residual-weights-and-variation>

We give the coefficient calculation needed to apply the good-path variation estimate. It is important here that the same angular grid underlies all shifts.

For integer levels $k$ along the path put $v_k = v_k \( R \)$ and $a_k = n_(v_k)$, so $a_(i_j) = n_j$. For a fixed segment $\[ e \, f \)$ and a block index $j in \[ e \, f \)$, define

#[#set math.equation(numbering: n => "(6.15)")
 $ omega_j \( k \) = a_k^(- mu \/ K) product_(r = i_j)^(k - 1) (a_(r + 1) / m_(v_(r + 1)))^(zeta_(r med mod med K)) \, #h(2em) i_j lt.eq k < i_f . $ <res:common-weight>]

Here $i_j$ denotes the angular level at the start of block $j$.

Every packet in $U_b$, for $j lt.eq b < f$, is assigned to a top in $v_(i_(b + 1)) \( R \)$. It follows by nesting that its top lies in $v_k \( R \)$ at every intermediate level $k lt.eq i_(b + 1)$, in particular at its stopping level $k_s$. Multiplying its coefficient in $U_b$ by the path propagation factor $product_(j lt.eq r < b) lambda_r$ therefore gives exactly $omega_j \( k_s \) q_(T \( s \)) phi.alt_s$. This identity holds for every contributing top, whether or not that top is significant. Thus the scalar coefficient depends only on the stopping level, rather than on the packet or top inside that level.

#thm([Lemma 6.2.])[
  (Variation of the common coefficients).  #emph[Uniformly over the segments and their starting indices, 
#[#set math.equation(numbering: n => "(6.16)")
 $ sup_(i_j lt.eq k < i_f) \| omega_j \( k \) \| + sum_(k = i_j)^(i_f - 2) \| omega_j \( k + 1 \) - omega_j \( k \) \| lt.eq L^(C_w) . $ <res:common-weight-BV>]

 The exponent $C_w$ is fixed before $M$ is chosen.]
] <res:common-weight-variation>

#proof[
  Every ending mass in this sequence is at least $a_(i_f) = n_f > M - 2$. Since all real parts of $zeta$ are nonnegative, $\| omega_j \( k \) \| lt.eq a_k^(- mu \/ K) lt.eq 1$ when $M gt.eq 3$. Using the real logarithms of positive masses, a logarithmic increment of the coefficient is
  $ log omega_j \( k + 1 \) - log omega_j \( k \) = mu / K log a_k / a_(k + 1) - zeta_(k med mod med K) log m_(v_(k + 1)) / a_(k + 1) . $
  The logarithm here is the specified linear expression defining the coefficient, so no branch of a complex logarithm is being chosen. The first sum of absolute increments telescopes. For the second use 34 on the entire root-to-endpoint path. All its summands are nonnegative, whence
  $ sum_(k = i_j)^(i_f - 2) \| log omega_j \( k + 1 \) - log omega_j \( k \) \| & lt.eq (mu / K + K max_sigma \| zeta_sigma \|) log n_(upright("root")) / n_f\
 & lt.eq L^(C_w) . $
  The last step uses $n_(upright("root")) lt.eq N L^C$ on $Z$, $log N lt.eq 2 L$, $n_f > M - 2 gt.eq 1$, and $max_sigma \| zeta_sigma \| lt.eq mu + L^2$. The full-root bound is needed: a denominator $m_v$ belonging to a different shift may involve a block whose starting level precedes the segment. No estimate using only $log \( n_e \/ n_f \)$ is asserted.
  For two successive logarithmic values $z_0 \, z_1$ in this sequence, both $\| e^(z_0) \|$ and $\| e^(z_1) \|$ are at most one. Along the straight segment between them, $\| e^(\( 1 - t \) z_0 + t z_1) \| lt.eq 1$. Integration of the derivative of the exponential consequently yields $\| e^(z_1) - e^(z_0) \| lt.eq \| z_1 - z_0 \|$. The logarithmic-increment bound proves (6.16). ◻
]

Let $cal(Q)_(R \, sigma)$ denote the fixed residual subset in (5.41). For each unary segment $\[ e \, f \)$ define

$ Lambda_(e \, f) \( z \) = max_(i_e lt.eq a lt.eq b < i_f) ∥sum_(s in cal(Q)_(R \, sigma)\
a lt.eq k_s lt.eq b) q_(T \( s \)) \( z \) phi.alt_s \( z \)∥ . $

An empty sum has value zero. Finite depth makes the maximum finite. The interval of stopping levels $\[ a \, b \]$ corresponds to an interval of dyadic packet lengths. The latter follows directly from the definition $k_s = max { k : d_s lt.eq d \( k \) \/ B^2 }$, which is monotone in $ell_s$. Since distinct unary segments have disjoint level intervals $\[ i_e \, i_f \)$, one may choose a maximizing interval in each segment and apply the single good-path $3$-variation bound to all those disjoint intervals. Thus

#[#set math.equation(numbering: n => "(6.17)")
 $ (sum_(\[ e \, f \)) Lambda_(e \, f) \( z \)^3)^(1 \/ 3) lt.eq L^(C_v) . $ <res:segment-cube-sum>]

The segments may depend on $z$; the variation is a supremum over all choices of disjoint intervals, so this dependence does not alter the inequality. The underlying packet subset itself is the single deterministic set $cal(Q)_(R \, sigma)$.

Abel summation for a finite scalar sequence $\( omega_k \)$ and vector sequence $\( F_k \)$ gives

$ ∥sum_(k = a)^b omega_k F_k∥ lt.eq (\| omega_b \| + sum_(k = a)^(b - 1) \| omega_k - omega_(k + 1) \|) max_(a lt.eq t lt.eq b) ∥sum_(k = a)^t F_k∥ . $

Applying this identity with (6.15), and then iterating (6.9), yields

#[#set math.equation(numbering: n => "(6.18)")
 $ max_(e lt.eq i lt.eq f) ∥A_i - A_i^(*)∥ lt.eq L^(C_w) Lambda_(e \, f) + C e^(- L) Delta_(e \, f) . $ <res:segment-perturbation>]

Indeed the propagated $W_j$ terms have modulus at most their unpropagated bounds because $\| lambda_j \| lt.eq 1$. There are no residual terms beyond $i_f$ in this calculation: $U_j$ uses only $i_j lt.eq k_s < i_(j + 1)$ with $j < f$. When $f$ is a mass-stopping node it is still an eligible node and (6.11) applies. A final block ending by ineligibility cannot be unary and is excluded from this calculation.

Using (6.12) and dyadic mass shells, we get

#[#set math.equation(numbering: n => "(6.19)")
 $ sum_(\[ e \, f \)) n_e^(\( - 1 + mu \) 3 \/ 2) & lt.eq C sum_(r gt.eq 0) \( 2^r M \)^(- 1 \/ 2 + 3 mu \/ 2) lt.eq C M^(- 1 \/ 2 + 3 mu \/ 2) \,\
(sum_(\[ e \, f \)) n_e^(\( - 1 + mu \) 3 \/ 2))^(2 \/ 3) & lt.eq C M^(- 1 \/ 3 + mu) . $ <res:segment-weight-sum>]

Hölder with exponents $3 \/ 2$ and $3$, followed by (6.14), (6.17), and (6.18), therefore bounds the sum of the unary log factors by

#[#set math.equation(numbering: n => "(6.20)")
 $ sum_(j upright(" unary at ") z) log beta_(J_j) lt.eq C p L^(C_u) M^(- 1 \/ 3 + mu) + C p e^(- L) (max_(j upright(" active")) n_j^mu) sum_(j upright(" active")) u_j . $ <res:unary-cost>]

For the error term, use $n_e gt.eq n_j$ and $mu - 1 < 0$ within a segment to obtain $n_e^(mu - 1) h_j^(*) lt.eq n_j^(mu - 1) h_j^(*) = n_j^mu u_j$. By (3.19), $max n_j^mu lt.eq exp \( C sqrt(L) \)$. Together with (6.2), this makes the second term in (6.20) tend to zero.

Choose a fixed exponent $C_(upright("res"))$ larger than all polynomial exponents in (6.8) and (6.20), and then choose

#[#set math.equation(numbering: n => "(6.21)")
 $ A_M > 4 \( C_(upright("res")) + 2 \) \, #h(2em) M = L^(A_M) . $ <res:choice-M>]

By (6.1), $- 1 \/ 3 + mu lt.eq - 1 \/ 4$ and $- 1 \/ 2 + mu lt.eq - 5 \/ 12$. Since $p = L^(1 \/ 2)$, this choice makes both principal residual costs bounded by an absolute constant for sufficiently large $L$. None of the good-path thresholds or the exponents used to select $A_M$ depended on $M$.

=== 6.4 The path product and its integral <the-path-product-and-its-integral>

#thm([Theorem 6.3.])[
  (Integrated path product).  #emph[With $M$ chosen by (6.21), the estimate (5.52) holds for every path top $R$, every shift, and every vertex parameter with $∥Im zeta∥_2 lt.eq L^2$. Its constants are independent of the tile collection, angular depth, and Hilbert-space dimension.]
] <res:path-product>

#proof[
  Fix a line of slope $s_R$, and on that line use the functions $Gamma_j$ constructed in 42. At a point of $Z$ where $R$ is good, the active indices fall into the marked indices, the unary indices, and at most one active unmarked index with $h_j^(*) gt.eq 1$. For the marked indices, combine (5.58), (6.8), and (6.2). Their phase-domination losses have sum at most $C L G^(- c)$, which is bounded. The unary factors have bounded log product by (6.20) and (6.21).
  At the possible remaining index, 41 gives $M < n_j < M + 1$. From (5.24) and the baseline $n_j$ in the denominator of $beta_(J_j)$,
  $ beta_(J_j) lt.eq 1 + L^(C p) n_j^(alpha - 1) lt.eq L^(C p) \( 1 + M \)^C . $
  Here $C$ is fixed, since $alpha$ stays in a fixed compact interval below three. We have therefore proved the pointwise domination
  #[#set math.equation(numbering: n => "(6.22)")
   $ product_(j upright(" active at ") z) beta_(J_j) \( z \) lt.eq L^(C p) \( 1 + M \)^C product_(j = 0)^(J_R) Gamma_j \( z \) \, #h(2em) z in Z ∩ { R upright(" good") } \, $ <res:pointwise-product>]
  where $J_R$ is the last possible block index for $R$. It is legitimate to include every possible index on the right: if $n_j \( z \) lt.eq M$, its mesh cell cannot satisfy $inf n_j > M$, so it is unmarked and $Gamma_j \( z \) = 1$. Unmarked active indices likewise have $Gamma_j = 1$.
  Recall that $Gamma_j$ is constant on the mesh of length $H_(j - 1)$ and has average at most one on every cell of length $H_j$. The meshes are nested. On any cell $I$ of the largest mesh $H_(J_R)$, successive averaging from the smallest mesh upward therefore gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ integral_I product_(j = 0)^(J_R) Gamma_j \( x \) thin thin upright(d) x lt.eq \| I \| . $ <res:mesh-average>]
  More explicitly, all later factors $Gamma_k$, $k > j$, are constant on each $H_j$ cell. Integrating $Gamma_j$ on those cells can thus only decrease the integral of the nonnegative product. Iterate this observation for $j = 0 \, 1 \, dots.h \, J_R$.
  The weight $h_R$ is uniformly comparable on $I$. This remains true for a terminal block and for the short first block: eligibility of $R$ at $i_j$ gives $rho_j gt.eq B^2 d_R$, and every block has $rho_j \/ rho_(j + 1) lt.eq B$. Thus
  #[#set math.equation(numbering: n => "(6.24)")
   $ H_j = frac(w, rho_(j + 1) sqrt(G)) lt.eq frac(l_R, B sqrt(G)) lt.eq l_R . $ <res:mesh-versus-top>]
  Along the line of slope $s_R$, the transverse normalized coordinate of $R$ is fixed and the horizontal normalized coordinate changes by at most $H_j \/ l_R$. The definition (2.33) consequently gives $sup_I h_R lt.eq C inf_I h_R$, with an absolute constant depending only on the fixed decay exponent. By (6.23),
  $ integral_I h_R product_(j = 0)^(J_R) Gamma_j thin thin upright(d) x lt.eq \( sup_I h_R \) \| I \| lt.eq C integral_I h_R thin thin upright(d) x . $
  Sum over the largest-mesh cells and use (6.22). Whenever the original integrand in (5.52) has a measurable slice on this line, we obtain
  $ integral_(Z ∩ { R upright(" good") } upright(" on the line")) h_R product_(j upright(" active")) beta_(J_j) thin thin upright(d) x lt.eq L^(C p) \( 1 + M \)^C integral_(upright("line")) h_R thin thin upright(d) x . $
  The snapshots used to construct the $Gamma_j$ need only be chosen on this one line. There are countably many mesh cells, so these choices give measurable step functions on that line. No jointly measurable choice of snapshots across different lines is required. The original integrand in (5.52), expressed entirely through $h_R$, the good sets, and the finite hierarchy factors $beta_(J_j)$, is nonnegative and Lebesgue measurable. In the coordinates $\( x \, y - s_R x \)$, it has a measurable slice for almost every transverse parameter. The preceding line estimate therefore holds for almost every such parameter. Integrating it and applying Tonelli, using the Jacobian-one coordinate change, proves (5.52). ◻
]

All sums and products in this section were finite. The shell counts, Abel estimates, and mesh averaging bounds contain no factor equal to the number of scales, tiles, or hierarchy levels. They therefore apply with identical constants to every finite truncation required in the packet reduction.

== 7 Interpolation, boundary averaging, and completion <assembly:section>

We continue with a finite popular collection and its adjoint sum $P = sum_s phi.alt_s$. Thus $N = \( \| E \| \/ \| F \| \)^(1 \/ 2)$, $L \/ 2 lt.eq log N lt.eq 2 L$, and $S lt.tilde L^C \| E \|$. All statements in this section are uniform in the finite collection, its depth, and the dimension of $cal(H)$. We write $theta.alt$ for the translation of the angular grid. The set $Z_0$ and the functions $P \, P_q \, h_T \, n$ do not depend on $theta.alt$, whereas the smaller set $Z = Z_theta.alt$, the angular masses, and the analytic sums do. Until the boundary-averaging step, we fix $theta.alt$ and suppress it in the notation.

=== 7.1 From the path estimate to analytic interpolation <from-the-path-estimate-to-analytic-interpolation>

#thm([Proposition 7.1.])[
  (Vertex estimate).  #emph[For every nonempty root $v$, every shift $sigma$, and every parameter with 
$ Re zeta = mu e_sigma \, #h(2em) parallel Im zeta parallel_2 lt.eq L^2 \, $

 one has 
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel n_v^(alpha \/ p - 1) A_v \( zeta \) parallel_(L^p \( Z \; cal(H) \)) lt.eq L^C S^(1 \/ p) . $ <eq:src-29>]

 The constant and exponent are independent of the shift and the grid translation.]
] <assembly:vertices>

#proof[
  Recall the nonnegative amount
  $ V_v = n_v + n_v^(alpha - p) parallel A_v parallel^p . $
  On the set where $n_v lt.eq M$, Equation (5.24) gives
  $ V_v lt.eq L^(C p) \( 1 + M \)^(alpha - 1) n_v . $
  Here and below the bound on the imaginary parts is absorbed into $L^(C p)$. On the remaining set, apply Lemma 40. At least half of the root amount is carried by good paths, and the terminal amount of a path ending at $R$ is at most $L^(C p) \( 1 + M \)^(alpha - 1) h_R$. Consequently,
  $ integral_Z V_v & lt.eq L^(C p) \( 1 + M \)^(alpha - 1) integral n_v\
 & quad + 2 L^(C p) \( 1 + M \)^(alpha - 1) sum_(R : thin s_R in v) integral_(Z ∩ { upright("good ") R }) h_R product_(upright("active path of ") R) beta_J . $
  The root and its descendants contain only their eligible tops; sums over tops here and subsequently are understood with that convention. Theorem 46, namely Equation (5.52), bounds each integral in the second line by $L^(C p) \( 1 + M \)^C integral h_R$. Moreover,
  $ sum_R integral h_R lt.tilde L^C S \, $
  by the definition of the dilated decaying weights. We conclude that
  $ integral_Z V_v lt.eq L^(C p) \( 1 + M \)^C S . $
  Since $M$ is a fixed power of $L$, taking a $p$-th root and using $n_v^(alpha - p) parallel A_v parallel^p lt.eq V_v$ proves the result. ◻
]

#thm([Lemma 7.2.])[
  (Interpolation of the shift parameters).  #emph[Equation (7.1) also holds at 
$ zeta^(upright(c)) = \( mu \/ K \, dots.h \, mu \/ K \) . $

]
] <assembly:interpolation>

#proof[
  Let
  $ frak(S)_mu = { a in \[ 0 \, oo \)^K : med sum_sigma a_sigma = mu } \, #h(2em) cal(F)_v \( zeta \, z \) = n_v \( z \)^(alpha \/ p - 1) A_v \( zeta \, z \) . $
  Every nonempty mass is positive. For each fixed $z$, the defining sum is a finite sum of exponentials of linear functions of $zeta$, with real logarithms of positive ratios as coefficients. In particular it is entire in $zeta$.
  We first give a uniform bound on the tube over $frak(S)_mu$, without using the vertex estimate. From Equations (5.24) and (3.19), and from $integral n_v lt.eq integral n lt.tilde L^C S$, we have, for $a in frak(S)_mu$ and $eta in bb(R)^K$,
  #[#set math.equation(numbering: n => "(7.2)")
   $ parallel cal(F)_v \( a + i eta \) parallel_(L^p \( Z \)) & lt.eq L^C \( 1 + mu + parallel eta parallel_2 \) (integral_Z n_v^alpha)^(1 \/ p)\
 & lt.eq L^C \( 1 + parallel eta parallel_2 \) \( N L^C \)^(\( alpha - 1 \) \/ p) S^(1 \/ p) . $ <assembly:crude-analytic-bound>]
  The factor involving $N$ is at most $exp \( C sqrt(L) \)$, since $log N lt.eq 2 L$, $p = L^(1 \/ 2)$, and $2 < alpha < 3$ for sufficiently large $L$.
  Multiply the analytic family by
  $ cal(D) \( zeta \) = exp (sum_sigma zeta_sigma^2) . $
  On the tube under consideration,
  $ \| cal(D) \( a + i eta \) \| = exp \( parallel a parallel_2^2 - parallel eta parallel_2^2 \) lt.eq exp \( mu^2 - parallel eta parallel_2^2 \) . $
  At a vertex, Proposition 47 controls $cal(D) cal(F)_v$ whenever $parallel eta parallel_2 lt.eq L^2$. For $parallel eta parallel_2 > L^2$, Equation (7.2) gives the same bound: indeed
  $ \( 1 + parallel eta parallel_2 \) exp \( mu^2 - parallel eta parallel_2^2 + C sqrt(L) \) $
  is bounded by an absolute constant in this range, after increasing the fixed lower threshold for $L$. Thus the damped family has norm at most $L^C S^(1 \/ p)$ at every vertex, uniformly in all imaginary parts.
  Here are details that justify applying scalar three-lines to this family. Test against any element $b$ of the dual unit ball $L^(p') \( Z \; cal(H) \)$. One may first restrict the pairing to a bounded set on which every nonempty mass used in the finite family is bounded below by a positive constant. Such sets exhaust $Z$, and the restriction does not increase the norm of $b$. On each such set, integration defines an entire scalar function; logarithms of the finitely many masses are bounded there. The crude bound above and the damping make this scalar function bounded on every interpolating strip. If two real vectors $a_0 \, a_1$ have established uniform bounds for all imaginary parts, apply the bounded scalar three-lines lemma #cite(label("Hajlasz2012")) Lemma 3.3, p. 57 to
  $ z mapsto integral_Z cal(D) #scale(x: 120%, y: 120%)[\(] \( 1 - z \) a_0 + z a_1 + i eta #scale(x: 120%, y: 120%)[\)] chevron.l cal(F)_v #scale(x: 120%, y: 120%)[\(] \( 1 - z \) a_0 + z a_1 + i eta \, dot.op #scale(x: 120%, y: 120%)[\)] \, b chevron.r thin thin upright(d) x \, $
  with the indicated preliminary restriction understood. The boundary lines have the required bounds because their imaginary vectors are still arbitrary. The real parts throughout the strip remain in the simplex. Starting with its vertices and successively taking convex combinations proves the same bound at their barycenter, with no factor depending on $K$. Exhaustion of $Z$, followed by duality, removes the preliminary restriction. Finally $cal(D) \( zeta^(upright(c)) \) = exp \( mu^2 \/ K \)$ is an absolute factor. This proves the lemma. ◻
]

=== 7.2 The central weight and the exponent budget <the-central-weight-and-the-exponent-budget>

The central coefficient identity (5.19) gives weights $kappa_s in \( 0 \, 1 \]$. Define

$ cal(W)_theta.alt = sum_s kappa_s q_(T \( s \)) phi.alt_s . $

By that identity, its portion in root $v$ is $n_v^(mu \/ K) A_v \( zeta^(upright(c)) \)$.

Put $gamma = 1 - alpha \/ p + mu \/ K$, which is positive for the values of $L$ under consideration. Interpolation and Hölder’s inequality give, for each root,

$ integral_Z parallel n_v^(mu \/ K) A_v \( zeta^(upright(c)) \) parallel & lt.eq parallel n_v^(alpha \/ p - 1) A_v \( zeta^(upright(c)) \) parallel_(L^p \( Z \)) (integral_Z n_v^(gamma p'))^(1 \/ p')\
 & lt.eq L^C S^(1 \/ p) \| F \|^(1 - 1 \/ p) \( N L^C \)^gamma . $

Only an absolute number of roots meet the bounded set of top slopes. Since $S lt.tilde L^C \| E \| = L^C N^2 \| F \|$, summing over them proves

#[#set math.equation(numbering: n => "(7.3)")
 $ integral_(Z_theta.alt) parallel cal(W)_theta.alt parallel lt.eq L^C \| F \| N^(thin 1 + \( 2 - alpha \) \/ p + mu \/ K) . $ <assembly:central-estimate>]

We record explicitly why this improves by every fixed negative power of $L$. The net decrease of the exponent of $N$ is

$ delta_L = frac(alpha - 2, p) - mu / K = 1 / p (alpha - 2 - frac(alpha - 1, K)) . $

The separated-count bound is a fixed power of $L$, so the definition of $alpha$ gives $alpha - 2 gt.eq c_1 \/ log L$ with a fixed $c_1 > 0$. Also $alpha - 1 lt.eq 2$ and $K gt.eq \( log L \)^2$. For sufficiently large $L$, therefore,

$ delta_L gt.eq frac(c_1, 2 sqrt(L) log L) \, #h(2em) delta_L log N gt.eq frac(c_1 sqrt(L), 4 log L) . $

In particular, for every fixed $Q > 0$, after increasing the absolute lower threshold for $L$, Equation (7.3) implies, uniformly in $theta.alt$,

#[#set math.equation(numbering: n => "(7.4)")
 $ integral_(Z_theta.alt) parallel cal(W)_theta.alt parallel lt.eq L^(- Q) N \| F \| . $ <assembly:central-power-gain>]

This conclusion absorbs any fixed polynomial losses in the preceding estimates; none of their exponents is changed here.

=== 7.3 Boundary averaging with the eligibility condition <boundary-averaging-with-the-eligibility-condition>

We now restore the dependence on the uniformly translated angular grid. The next estimate is pointwise on the fixed set $Z_0$.

#thm([Lemma 7.3.])[
  (Expected boundary loss).  #emph[Let $epsilon.alt = 4 G^(- 1 \/ 4)$. For $z in Z_0$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ bb(E)_theta.alt parallel P_q \( z \) - cal(W)_theta.alt \( z \) parallel lt.eq L^C epsilon.alt n \( z \) . $ <assembly:expected-error>]

 Here the expectation is normalized Lebesgue measure for the common translation modulo $d \( 0 \)$; independent translations at different levels are neither assumed nor needed.]
] <assembly:boundary-loss>

#proof[
  Fix $z in Z_0$ and a top $T$, and suppress $z$ from the masses. For $i < k_T$ let
  $ r_i \( theta.alt \) = log m_(v_(i + 1) \( T \)) / n_(v_i \( T \)) gt.eq 0 \, #h(2em) M_i \( b \) = sum_(U : thin \| s_U - s_T \| lt.eq b thin d \( i \)\
d_U lt.eq d \( i \) \/ B^2) h_U . $
  Unlike $r_i$, the latter mass does not depend on the grid translation. Each mass in this display is at least $h_T$ when $i < k_T$, and is at most $n$.
  Let $b_i \( theta.alt \) in \[ 0 \, 1 \/ 2 \]$ be the distance from $s_T$ to the nearer boundary of its level-$i$ interval, divided by $d \( i \)$. An extra top counted in $m_(v_(i + 1) \( T \)) - n_(v_i \( T \))$ has slope within $epsilon.alt d \( i \)$ of $s_T$. Indeed the neighbor distance in Equation (5.7) is $G^(- 1 \/ 4) d \( i \)$, and the two level-$\( i + 1 \)$ interval lengths add at most $2 d \( i \) \/ G$. Such a top is eligible at level $i + 1$, hence also at level $i$. It lies outside the immediate parent. It follows that $r_i = 0$ if $b_i > epsilon.alt$. If $0 < b_i lt.eq epsilon.alt$, the immediate parent contains every top counted by $M_i \( b_i \)$, whereas its extra mass is disjoint from these inner tops and is at most $M_i \( epsilon.alt \) - M_i \( b_i \)$. Consequently
  #[#set math.equation(numbering: n => "(7.6)")
   $ r_i \( theta.alt \) lt.eq log frac(M_i \( epsilon.alt \), M_i \( b_i \( theta.alt \) \)) . $ <assembly:one-boundary-loss>]
  Endpoint coincidences can be omitted: for the finite set of slopes and levels they form a null set of translations.
  For a fixed number $0 < b < epsilon.alt$, set $r = ceil.l log_G \( epsilon.alt \/ b \) ceil.r$. The inclusion
  #[#set math.equation(numbering: n => "(7.7)")
   $ M_(i + r) \( epsilon.alt \) lt.eq M_i \( b \) $ <assembly:mass-inclusion>]
  uses both conditions in the definition of $M_i$: the radius satisfies $epsilon.alt d \( i + r \) lt.eq b d \( i \)$, and the precision threshold $d \( i + r \) \/ B^2$ is no larger than $d \( i \) \/ B^2$. To handle the end of the path without losing a term, define
  $ a_i = cases(delim: "{", log \( M_i \( epsilon.alt \) \/ h_T \) \, & 0 lt.eq i < k_T \,, 0 \, & i gt.eq k_T .) $
  If $i + r < k_T$, Equation (7.7) applies. If $i + r gt.eq k_T$, use $M_i \( b \) gt.eq h_T$ instead. In both cases
  $ log frac(M_i \( epsilon.alt \), M_i \( b \)) lt.eq a_i - a_(i + r) . $
  Summing and cancelling gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ sum_(i < k_T) log frac(M_i \( epsilon.alt \), M_i \( b \)) lt.eq sum_(0 lt.eq i < min \( r \, k_T \)) a_i lt.eq r log n / h_T . $ <assembly:boundary-telescope>]
  This argument also covers $k_T = 0$, with empty sums.
  Because $d \( 0 \) \/ d \( i \) = G^i$ is an integer, the common uniform translation is uniform modulo every $d \( i \)$. Thus each $b_i$ has density $2$ on $\[ 0 \, 1 \/ 2 \]$. Linearity of expectation, Equation (7.6), and Equation (7.8) imply
  #[#set math.equation(numbering: n => "(7.9)")
   $ bb(E)_theta.alt sum_(i < k_T) r_i \( theta.alt \) & lt.eq 2 integral_0^epsilon.alt sum_(i < k_T) log frac(M_i \( epsilon.alt \), M_i \( b \)) thin thin upright(d) b\
 & lt.eq 2 log \( n \/ h_T \) integral_0^epsilon.alt ceil.l log_G \( epsilon.alt \/ b \) ceil.r thin thin upright(d) b lt.eq C epsilon.alt log \( n \/ h_T \) . $ <assembly:total-boundary-loss>]
  For completeness the integral in the last line equals $epsilon.alt \/ \( 1 - G^(- 1) \)$: express the ceiling as a sum of indicators of $b < epsilon.alt G^(- j)$, $j gt.eq 0$, and integrate. The dependence of the different $b_i$’s is absent from this calculation.
  On the fixed top $T$, the value of $kappa_s$ depends only on the stopping level $k_s$. As packet length increases, $k_s$ increases; Equation (5.19) shows that these values are nonincreasing. Their deficits from one are nondecreasing and satisfy
  $ 0 lt.eq 1 - kappa_s lt.eq mu / K sum_(i < k_T) r_i \( theta.alt \) \, $
  using $k_s lt.eq k_T$ and $1 - e^(- x) lt.eq x$. Group the packets by stopping level. Every interval of these levels is an interval of packet lengths, so Equation (3.17) bounds its unweighted sum by $L^C h_T^8$. Summation by parts against the monotone deficits, and $\| q_T \| lt.eq 1$, therefore give
  $ ∥sum_(s : T \( s \) = T) \( 1 - kappa_s \) q_T phi.alt_s∥ lt.eq L^C h_T^8 mu / K sum_(i < k_T) r_i \( theta.alt \) . $
  For example, write the deficits as sums of their nonnegative increments and use the bound on the corresponding suffix sums; the sum of these increments is their largest value. Taking expectations, using $mu \/ K lt.eq 1$, and summing over tops proves
  $ bb(E)_theta.alt parallel P_q - cal(W)_theta.alt parallel lt.eq L^C epsilon.alt sum_T h_T^8 log \( n \/ h_T \) . $
  The weights have a fixed absolute upper bound. For every such weight,
  $ h_T^8 log \( n \/ h_T \) lt.eq C h_T \( 1 + log_(+) n \) \, $
  because $h^7 log_(+) \( 1 \/ h \)$ is bounded on a fixed bounded interval. Equation (3.19) gives $1 + log_(+) n lt.tilde L$ on $Z_0$. This proves Equation (7.5). ◻
]

=== 7.4 Recovering the original adjoint sum <recovering-the-original-adjoint-sum>

#thm([Theorem 7.4.])[
  (Improvement for the popular model).  #emph[The popular adjoint sum satisfies Equation (2.29); namely, 
$ integral_F parallel P parallel lt.tilde L^(- 20) N \| F \| . $

]
] <assembly:improved-model>

#proof[
  We make the exceptional-set comparison explicit because the good set depends on the grid. Write $parallel P parallel_2 lt.eq L^(C_P) sqrt(\| E \|)$, as supplied by Equation (2.3). Proposition 29 and Proposition 30 allow the fixed polynomial thresholds to be chosen so that
  #[#set math.equation(numbering: n => "(7.10)")
   $ integral_(F \\ Z_0) parallel P parallel lt.eq L^(- 30) N \| F \| \, #h(2em) integral_(Z_0) parallel P - P_q parallel lt.eq L^(- 30) N \| F \| . $ <assembly:fixed-exceptions>]
  Indeed a discarded area at most $L^(- 2 C_P - 60) \| F \|$ has the stated first bound by Cauchy–Schwarz. The exponentially small concentration and count exceptions meet this area bound for sufficiently large $L$.
  For each fixed translation the good-path construction gives
  $ \| Z_0 \\ Z_theta.alt \| lt.eq S e^(- 9 L) . $
  This is Markov’s inequality applied to the weighted bad-path mass: its integral is at most $S e^(- 10 L)$, and the deletion threshold is $e^(- L)$. Since $S lt.tilde L^C N^2 \| F \|$ and $N^2 lt.eq e^(4 L)$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ integral_(Z_0 \\ Z_theta.alt) parallel P parallel lt.eq L^(C_P) sqrt(\| E \|) thin \( S e^(- 9 L) \)^(1 \/ 2) lt.eq L^C e^(- 5 L \/ 2) N \| F \| lt.eq L^(- 30) N \| F \| . $ <assembly:moving-exceptions>]
  These are bounds for each translation; no union over translations is taken.
  For every $theta.alt$, the triangle inequality gives the following decomposition, whose left side is independent of $theta.alt$:
  #[#set math.equation(numbering: n => "(7.12)")
   $ integral_F parallel P parallel & lt.eq integral_(F \\ Z_theta.alt) parallel P parallel + integral_(Z_theta.alt) parallel P - P_q parallel + integral_(Z_theta.alt) parallel P_q - cal(W)_theta.alt parallel + integral_(Z_theta.alt) parallel cal(W)_theta.alt parallel . $ <assembly:original-decomposition>]
  The first two terms are controlled by Equations (7.10) and (7.11). The final term is controlled by Equation (7.4) with $Q = 30$. Average the remaining term over translations. It is nonnegative and $Z_theta.alt subset Z_0$, so Tonelli’s theorem and Lemma 49 yield
  $ bb(E)_theta.alt integral_(Z_theta.alt) parallel P_q - cal(W)_theta.alt parallel & lt.eq integral_(Z_0) bb(E)_theta.alt parallel P_q - cal(W)_theta.alt parallel\
 & lt.eq L^C epsilon.alt integral_(Z_0) n lt.eq L^C epsilon.alt N \| F \| lt.eq L^(- 30) N \| F \| . $
  The penultimate inequality uses Equation (3.19); the last uses $epsilon.alt = 4 G^(- 1 \/ 4)$ and $log G asymp L^.7$. All functions being averaged are measurable: for finitely many tops, packets, and levels, the angular assignments change only at finitely many translation values, and the good sets were defined by measurable quantities. Thus this averaging is legitimate even though $Z_theta.alt$ and $cal(W)_theta.alt$ use the same translation. Averaging Equation (7.12) now proves the asserted estimate. In particular, on every discarded set we have estimated the original sum $P$. ◻
]

=== 7.5 Choice of parameters and completion of the reductions <choice-of-parameters-and-completion-of-the-reductions>

We collect the order of the absolute choices. First fix the packet adaptation, separation, and overlap constants and the fixed geometric enlargements used with 2. Fix the local slope bound $C_(upright("Lip"))$, strip length $b_0$, and outer length $a = a_(*)$ as in (1.2), with the required room for those enlargements. Choose the low-density exponent $C_2$ by (2.25), before constructing the popular forest.

Next fix the decay exponent in the top-count weight and the concentration orders that determine $K_1$. Choose the fixed mask-removal and exceptional-area powers, then choose $A$ using the count at dilation $K_1$, whose constants do not depend on $A$. The count at the larger dilation $K_0 = L^(A + 2)$ is used only after this comparison. Fix the threshold in (3.19), the separated-count exponent defining $D$, and the good-path thresholds. These choices determine the polynomial powers in the motion, prediction, and residual estimates.

Now choose $M = L^(A_M)$ as in (6.21). For large $L$, $mu < 1 \/ 12$, so this fixed exponent controls both

$ p L^C M^(- 1 \/ 2 + mu) quad upright("and") quad p L^C M^(- 1 \/ 3 + mu) $

in the marked and unary residual estimates. The good-path thresholds were fixed before $A_M$, and their required proportion remains valid:

$ e^(- L) L^(C p) \( 1 + M \)^(alpha - 1) = exp #scale(x: 120%, y: 120%)[\(] - L + O \( sqrt(L) log L \) + O \( log L \) #scale(x: 120%, y: 120%)[\)] < 1 / 2 $

for sufficiently large $L$.

Finally choose $L_0$ after the outer length and all fixed exponents. It ensures $tau < a$, the geometric smallness requirements, and all the inequalities used above, because

$ log B = O \( L^.7 \( log L \)^2 \) = o \( L^.9 \) \, #h(2em) log \( N^mu \) = O \( sqrt(L) \) = o \( log G \) \, $

and, for every fixed exponent $C$,

$ log \( m^C tau \) = O \( L^.9 \) - Theta \( L^.97 \) arrow.r - oo . $

It also enforces the saving in (7.4). All choices are independent of the depth, tile count, and dimension.

#thm([Theorem 7.5.])[
  (The three model estimates).  #emph[For the packet forms in (1.33), let $u$ be a bounded measurable real slope, let $F \, E subset bb(R)^2$ be measurable sets of positive finite measure, and suppose $parallel f parallel_(cal(H)) lt.eq upright(bold(1))_F$ and $parallel g parallel_(cal(H)) lt.eq upright(bold(1))_E$ pointwise. The following estimates hold uniformly over every finite subcollection.]
  + #emph[For $m gt.eq 1$, 
$ \| Lambda \( f \, g \) \| lt.tilde \( 1 + log \( 2 m \) \)^C sqrt(\| F \| \| E \|) . $

]
  + #emph[Suppose $L gt.eq L_0$, with $tau \, m \, W$ chosen by (1.17), and $L \/ 2 lt.eq log sqrt(\| E \| \/ \| F \|) lt.eq 2 L$. If $lr(||) u lt.eq 1$, $"Lip" \( u \) lt.eq C_(upright("Lip"))$, and $F \, E subset I times bb(R)$ for an interval $I$ of length at most $b_0$, then 
$ \| Lambda \( f \, g \) \| lt.tilde L^(- 20) sqrt(\| F \| \| E \|) . $

]
  + #emph[For the scalar model with $m = 1$ and $\| E \| lt.eq \| F \|$, there is an absolute $c > 0$ such that 
$ \| Lambda \( f \, g \) \| lt.tilde sqrt(\| F \| \| E \|) (frac(\| E \|, \| F \|))^c . $

]
] <assembly:all-model-estimates>

#proof[
  The first and third assertions are precisely the ordinary estimates proved with (2.3). For the second, the fixed deletion of tiles with $D_E \( s \) lt.eq L^(- C_2)$ in 2.7 contributes at most $C L^(- 40) sqrt(\| F \| \| E \|)$, by (2.25). Assign the remaining tiles to the popular tops as already constructed. Their adjoint sum is $P$, and the coefficient convention in Equation (1.33) gives
  $ \| Lambda_(upright("popular")) \( f \, g \) \| lt.eq integral_F parallel P parallel . $
  Theorem 50 bounds this by $L^(- 20) N \| F \| = L^(- 20) sqrt(\| F \| \| E \|)$. Adding the deleted contribution proves the second assertion. All preceding arguments apply to arbitrary finite tile sets and thus give the claimed uniformity. ◻
]

#proof[
  #emph[Completion of the proofs of Theorem 1.4, Theorem 1.1.] Theorem 51 supplies exactly the three hypotheses of Proposition 15. That proposition therefore proves the band restricted estimate (1.4). The dependence here is forward: the reductions established the implication from the model estimates, which have now been proved without using the band restricted theorem.
  All estimates were obtained first for finite packet collections and positive inner truncations, with constants independent of both. The summable smooth expansions and translated-lattice averages in the packet reduction consequently pass to their limits as specified in Proposition 15. The amplitude summation, vertical Littlewood–Paley reassembly, and spatial localization proved in the reductions give a uniform strong $L^2$ estimate for the original fixed-field transform with a positive inner cutoff. For a Schwartz input its symmetric principal value exists pointwise; Fatou’s lemma gives the same strong bound for the principal-value operator, which extends by density. For the already chosen outer length $a = a_(*)$, Chebyshev’s inequality gives the weak $\( 2 \, 2 \)$ assertion of Theorem 1. The constants are independent of the vector field, the input, and the level in that inequality. The dilation calculation following 1 gives the outer length $a_(*) \/ "Lip" \( v \)$ for positive Lipschitz seminorm; constant directions have already been handled by the one-dimensional theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
