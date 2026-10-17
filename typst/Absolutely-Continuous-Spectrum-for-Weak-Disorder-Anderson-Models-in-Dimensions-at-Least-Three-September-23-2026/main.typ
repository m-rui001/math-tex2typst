#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Absolutely Continuous Spectrum for Weak-Disorder Anderson Models in Dimensions at Least Three]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Anderson model asks how independent disorder changes the spectral and transport properties of a lattice Hamiltonian. We prove a weak-disorder delocalization result for independent uniform site potentials in every fixed dimension $d gt.eq 3$: on a fixed open interval, the spectrum is purely absolutely continuous and has nonzero weight. Both eigenvalue mass and singular continuous mass are excluded.

=== 1.1 The model and the result <the-model-and-the-result>

Fix an integer $d gt.eq 3$. On the product probability space

$ Omega = \[ - 1 \, 1 \]^(bb(Z)^d) \, #h(2em) bb(P) = (1 / 2 upright(bold(1))_(\[ - 1 \, 1 \]) \( v \) thin d v)^(⊗ bb(Z)^d) \, $

let $V_x \( omega \) = omega_x$. For $lambda > 0$, define the bounded self-adjoint operator on $ell^2 \( bb(Z)^d \)$ by

#[#set math.equation(numbering: n => "(1)")
 $ \( H_(lambda \, omega) psi \) \( x \) = - sum_(j = 1)^d #scale(x: 120%, y: 120%)[\(] psi \( x + upright(bold(e))_j \) + psi \( x - upright(bold(e))_j \) #scale(x: 120%, y: 120%)[\)] + lambda V_x \( omega \) psi \( x \) . $ <eq:model>]

Here $upright(bold(e))_1 \, dots.h \, upright(bold(e))_d$ are the coordinate vectors. Multiplication by $\( - 1 \)^(x_1 + dots.h.c + x_d)$ is a unitary operator that reverses the hopping sign and leaves the diagonal potential unchanged. Thus the positive-hopping convention gives the identical conclusion. For a Borel set $B$, write $chi_B \( H \)$ for the spectral projection, and let $cal(H)_(upright("ac")) \( H \)$ be the subspace of vectors whose spectral measures are absolutely continuous with respect to Lebesgue measure.

#thm([Theorem 1.1.])[
  #emph[There is a fixed sufficiently small number $e_2 in \( 0 \, 1 \/ 100 \)$ such that, for every fixed integer $d gt.eq 3$, there is a number $lambda_d > 0$ with the following property. Set 
#[#set math.equation(numbering: n => "(2)")
 $ I_d = cases(delim: "{", \( - 6 + e_2 \/ 2 \, - 6 + e_2 \) \, & d = 3 \,, - 2 d + \( 1 \/ 200 \, 1 \/ 100 \) \, & d gt.eq 4 .) $ <eq:energy-windows>]

 Then for every fixed $0 < lambda < lambda_d$, almost surely 
$ I_d subset sigma \( H_(lambda \, omega) \) \, #h(2em) chi_(I_d) \( H_(lambda \, omega) \) ell^2 \( bb(Z)^d \) subset cal(H)_(upright("ac")) \( H_(lambda \, omega) \) . $

 In particular, the spectral restriction to $I_d$ is purely absolutely continuous and $chi_(I_d) \( H_(lambda \, omega) \) eq.not 0$. For $d gt.eq 4$, one may take $lambda_d = sqrt(3) thin 2^(- n_(*) \( d \))$, where the finite-matrix specification of $n_(*) \( d \)$ is given in Definition 39. For $d = 3$, the proof supplies an existential positive threshold.]
] <thm:main>

The interval is independent of $lambda$. The probability-one event may depend on the fixed coupling, and all estimates may depend on the fixed dimension. No uniformity as $d arrow.r oo$ is asserted. The integer $n_(*) \( d \)$ for $d gt.eq 4$ is specified by an infinite family of probability conditions on finite matrices. The proof establishes its existence but supplies no effective numerical bound.

=== 1.2 Historical context and scope <historical-context-and-scope>

Anderson’s random-site-energy model explains how spatial disorder can suppress quantum transport #cite(label("Anderson1958")). The competing weak-disorder question is whether extended states survive on a Euclidean lattice of dimension at least three. Simon’s Problem 1 asks for a purely absolutely continuous energy range for the nearest-neighbor model with iid uniform potentials in dimensions at least three, at suitable disorder widths #cite(label("Simon2000")). Theorem 1 supplies the purely absolutely continuous energy range requested in that problem for every sufficiently small fixed disorder width in each fixed dimension $d gt.eq 3$. It does not locate the full mobility edge discussed after Problem 1 or resolve the diffusion question stated separately as Problem 3.

Rigorous localization was developed through several complementary methods. Fröhlich and Spencer introduced a multiscale Green-function analysis in strong-disorder and suitable extreme-energy regimes #cite(label("FrohlichSpencer1983")); Fröhlich, Martinelli, Scoppola and Spencer subsequently established pure-point spectrum with exponentially decaying eigenfunctions in such regimes #cite(label("FMSS1985")). The fractional-moment method of Aizenman and Molchanov gives another route to spectral localization at large disorder and extreme energies #cite(label("AizenmanMolchanov1993")). Corollary 2 combines a fixed-disorder edge-localization theorem with Theorem 1 at the same coupling. A localized edge interval alone does not determine the spectral type throughout the rest of the band.

On the Bethe lattice, Klein proved purely absolutely continuous spectrum on compact intervals inside the free band at sufficiently weak disorder #cite(label("Klein1994")) #cite(label("Klein1998")). Aizenman, Sims and Warzel established stability of the absolutely continuous component by a fluctuation-based method #cite(label("AizenmanSimsWarzel2006")); that result does not itself assert spectral purity. Aizenman and Warzel used resonant delocalization to obtain an absolutely continuous component beyond the free band for regular full-support laws at weak disorder, and proved pure absolute continuity near the spectral edges in a weak bounded-disorder regime that includes the uniform law #cite(label("AizenmanWarzel2013")). For sufficiently high-degree trees, at a specified hopping scale and for a regular class of full-support single-site densities, Aggarwal and Lopatto obtained mobility edges separating absolutely continuous and pure-point intervals #cite(label("AggarwalLopatto2025")). The branching geometry distinguishes these results from the model on $bb(Z)^d$; the last result also has different law and scale assumptions.

Jakšić, Last and Warzel gave a further tree argument and a conditional lattice criterion through the Schur complement of a two-site Poisson-transformed spectral measure #cite(label("JaksicLastWarzel2026")). Their criterion assumes a positive lower limit of the expected energy-integrated quantity and concludes a nontrivial absolutely continuous component. It does not establish that lower bound for the present weak-disorder lattice model.

Erdős, Salmhofer and Yau proved a weak-coupling diffusion limit for the lattice model: at disorder-dependent long times and spatial scales, the expected Wigner distribution converges to a heat-equation solution as the coupling tends to zero #cite(label("ErdosSalmhoferYau2007")). For Gaussian disorder, Black, Drogin and Hernández obtained estimates at long finite times and positive resolvent heights in a weak-coupling regime #cite(label("BlackDroginHernandez2025")). Here the boundary limit is taken at each fixed sufficiently small positive coupling, and the conclusion also excludes singular spectral mass.

=== 1.3 The proof mechanism <the-proof-mechanism>

The proof first establishes a finite-volume resolvent certificate. On a large periodic lattice, we construct a set containing at least half the sites and add small complex damping only on that set. The diagonal imaginary parts there remain bounded below as the damping tends to zero. At each site, the final real potential is its original independent uniform variable. Proposition 3 states the certificate precisely.

We begin with the free operator and write each uniform potential as a series of independent binary signs. Revealing a sign replaces part of the artificial damping by true randomness. Active sites retain damping; terminal sites have their complete true potentials and have been eliminated by a Schur complement. During a stage, a diagonal self-consistency parameter remains frozen until the stage-end reset. We carry three controls for the rescaled inverse on active physical sites. Its complex entrywise square controls the linearized equation for the eventual diagonal reset. A bound on row fourth moments prevents the mass of a resolvent row from concentrating at a few sites, limiting the influence of individual updates. The Ward identity turns squared absolute resolvent entries into a Laplacian whose inverse form supplies a spatial energy norm for accumulating local changes. Fourier estimates for the free resolvent initialize these bounds with slack on the chosen energy interval.

During the one-digit stages, ordinary updates are tested on finite tiles, since a union bound over all sites at all scales would be too expensive. A coupled active site carries a true prefix with an untouched suffix, and a first tile trial uses its next true sign when that site is reached. If an ordinary tile trial fails, its numerical changes are rolled back and every answer remains in the retained information. All active sites in that tile are marked #emph[pending], including sites not reached by the trial. The mark is conservative: at a pending site the construction ceases to rely on the true-prefix and untouched-suffix guarantees. Ordinary updates at pending sites use independent auxiliary digits; a retry uses new ones throughout the tile.

At later scales we clear small components of pending sites. A unitary scattering matrix records the interaction between a fixed core and its exterior. The range of its cross block contains the survivor directions through which completing the core can act. Unitarity bounds the size of that change, so small diagonal entries of the projection onto the cross-block range make its effect small in every surviving row. This gives a deterministic target for preparing the core, with no freshness assumption on the core values.

Regularized projection weights guide exposures of true residuals at exterior sites. A spatial estimate controls the entire cross-block range even when its nonzero singular values are arbitrarily small; together with component separation and the retained marking rules, it keeps selected exterior pivots close to their core and ensures that their true residuals are still untouched. A negative drift bounds the number of exposures, while stopped martingale estimates control their accumulated effect, including a first violating update. After successful preparation, any still-unknown true core values are revealed and recorded, and the deterministic completion is applied. The core and exposed exterior sites then become committed terminals. A failed clearing rolls back its provisional matrix changes, keeps every answer, and marks its core and every inspected exterior site pending.

Two inductions connect these operations to the certificate. A deterministic induction combines committed local changes, controls the geometry of terminal sites, keeps at least half the sites active, and closes the self-consistent reset. A probabilistic induction tracks the retained information and bounds failures at deterministically ordered labels by successive conditioning. A surviving pending site yields either a recent failure label or many separated older witnesses whose leaf labels are distinct. With high probability the cutoff finds no pending sites and the later sweeps succeed. The last sweep then inserts the entire remaining true suffix at every active site. Those sites keep the final small damping, although their real potentials are now complete true values.

The spectral argument converts the certificate to information about the ordinary resolvent of the true operator. A cut by its spectral projection onto a narrow energy window controls the comparison through that projection’s rank for every qualifying certificate. Own-site averaging under the original product law of the true potentials bounds the expected rank, giving a positive expectation for a bounded function of the true scalar diagonal imaginary part. That estimate passes to infinite volume. At almost every fixed energy, ergodicity and rank-one changes of a site potential then propagate boundary positivity to every site almost surely. Conditioning on the operator with one site removed produces an exceptional energy set independent of the remaining site variable. Absolute continuity holds on its complement, and spectral averaging removes mass on the exceptional set itself. This final step gives purity.

The form of the construction is common to all fixed $d gt.eq 3$. Dimension enters through three estimates. A deliberately weaker Fourier bound retains the three-dimensional interpolation gains in every dimension, with a convex-slice argument handling two-resolvent shell tangencies. The allowed size exponent for pending components is chosen inversely proportional to $d$, keeping spatial packing losses below the analytic gains. The history recursion uses a dimension-dependent separation of scales to pay for the possible positions of spatial witnesses.

Related resolvent controls appear in Black, Drogin and Hernández’s work on the Gaussian Anderson model: a self-consistent diagonal shift, concentration governed by fourth-power row sums, and an elliptic equation for averaged squared resolvent entries #cite(label("BlackDroginHernandez2025")) Sections 1.1–1.2. Their spatial equation develops the $T$-equation approach of Erdős, Knowles, Yau and Yin for random band matrices #cite(label("ErdosKnowlesYauYin2013")). Here the Ward identity gives an exact Laplacian for each current matrix state, and we transport its inverse form and the other controls through the adaptive revelations.

=== 1.4 Coexistence with edge localization <coexistence-with-edge-localization>

The interval $I_d$ lies above the lower free band edge $- 2 d$. At the lower edge of the almost-sure spectrum, fixed-disorder localization gives a separate interval. Combining that result with Theorem 1 yields the following consequence at the same fixed coupling.

#thm([Corollary 1.2.])[
  (Spectral coexistence).  #emph[For every fixed $d gt.eq 3$ and every fixed $0 < lambda < lambda_d$, there is a deterministic number $delta_(d \, lambda) in \( 0 \, lambda \/ 2 \]$ such that the open interval 
$ J_(d \, lambda) = \( - 2 d - lambda \, - 2 d - lambda + delta_(d \, lambda) \) $

 is disjoint from $I_d$ and, almost surely, both $chi_(I_d) \( H_(lambda \, omega) \)$ and $chi_(J_(d \, lambda)) \( H_(lambda \, omega) \)$ are nonzero. The restriction to $I_d$ is purely absolutely continuous, whereas the restriction to $J_(d \, lambda)$ is pure point with exponentially decaying eigenfunctions. The probability-one event may depend on $d$ and $lambda$.]
] <cor:coexistence>

#proof[
  The variables $lambda V_x$ have the iid law $mu_lambda \( d v \) = \( 2 lambda \)^(- 1) upright(bold(1))_(\[ - lambda \, lambda \]) \( v \) thin d v$. Its concentration function is $sup_a mu_lambda \( \[ a \, a + t \] \) = min { 1 \, t \/ \( 2 lambda \) }$, so it satisfies the bounded-support Hölder hypothesis of the fixed-disorder edge localization theorem of Elgart and Klein. Their author-preprint Theorem 2.2 and Corollary 1.8(i)–(ii) #cite(label("ElgartKlein2019")) give a deterministic $A > 0$ and almost-sure pure-point spectrum with exponentially decaying eigenfunctions on $\[ - 2 d - lambda \, - 2 d - lambda + A \)$. Take $delta_(d \, lambda) = min { A \/ 2 \, lambda \/ 2 }$. The almost-sure spectrum is $\[ - 2 d - lambda \, 2 d + lambda \]$ #cite(label("ElgartKlein2019")) author-preprint equation (1.17), hence its projection on the nonempty open interval $J_(d \, lambda)$ cannot vanish. This interval lies below $- 2 d$, while $I_d$ lies above $- 2 d$. Intersect the localization and spectrum events with the probability-one event of Theorem 1, at the same fixed coupling. ◻
]

===== 1.4.1 Organization. <organization.>

Section 2 sets up the certificate and matrix states. Section 3 initializes the invariant bounds. Sections 4 and 5 establish ordinary updates and their stopped local trials. Sections 6 and 7 prepare pending cores, combine the committed changes, and close the deterministic induction. Section 8 controls the retained failures and completes the finite-volume certificate and the threshold specification. Section 9 converts the certificate to Theorem 1.

== 2 A finite-volume certificate and the matrix state <sec:state>

The construction will produce a certificate for a damped resolvent of the finite Anderson matrix with the true potentials. We state that target first, then describe the numerical state and the information retained while the potential is revealed. Each finite-volume construction fixes the energy and coupling; its event may depend on both, while its probability estimate is uniform in the energy interval. Throughout the proof $d gt.eq 3$ is a fixed integer. Constants denoted by $c \, C$, including constants implicit in $O \( dot.op \)$ and $asymp$, may depend on $d$ and the fixed interval $I_d$. No assertion is uniform as $d arrow.r oo$.

=== 2.1 The certificate <the-certificate>

Fix the interval $I_d$ from (2), a coupling $0 < lambda < 1$, and integers

#[#set math.equation(numbering: n => "(3)")
 $ n_0 & = floor.l log_4 \( 3 \/ lambda^2 \) floor.r \, #h(2em) m gt.eq 4 n_0 \,\
s_n & = lambda^2 / 3 4^(n_0 - n) quad \( n_0 lt.eq n lt.eq m \) \,\
eta & = s_m \, #h(2em) t_n = s_n + eta . $ <eq:scales>]

Equivalently, if $u = \( lambda^2 \/ 3 \) 4^(n_0) in \( 1 \/ 4 \, 1 \]$, then $s_n = u 4^(- n)$ and $eta = u 4^(- m)$. Thus $1 / 4 4^(- n) < s_n lt.eq 4^(- n)$ and $t_n asymp 4^(- n)$, with absolute comparison constants. Let

$ L = 4^(20 m) \, #h(2em) bb(T)_L = \( bb(Z) \/ L bb(Z) \)^d \, #h(2em) N = L^d \, $

and let $H_m$ be the periodic version of (1), in the negative-hopping convention:

$ \( H_m f \) \( i \) = - sum_(\| e \|_1 = 1) f \( i + e \) + lambda V_i f \( i \) \, #h(2em) V_i med upright("independent and uniform on ") \[ - 1 \, 1 \] . $

There is an independent potential at every point of this $d$-dimensional torus. For $A subset bb(T)_L$, write $P_A$ for coordinate restriction or projection, as indicated by its domain, and let $"diag"_A r$ be the full matrix with diagonal $r_i$ on $A$ and zero elsewhere.

#thm([Proposition 2.1.])[
  (Finite-volume certificate).  #emph[For each fixed $d gt.eq 3$ there exist $lambda_0 \( d \) > 0$ and constants $c \, C > 0$ with the following property. For every fixed $0 < lambda < lambda_0 \( d \)$, every $E in I_d$, and every $m gt.eq 4 n_0$, one can use auxiliary independent randomness to construct an event $cal(S)_m$, depending on the fixed $E \, lambda$, such that $bb(P) \( cal(S)_m \) arrow.r 1$ as $m arrow.r oo$. On $cal(S)_m$ there are a set $A subset bb(T)_L$, $\| A \| gt.eq N \/ 2$, and complex numbers $r_i$, $i in A$, satisfying 
$ \| r_i \| lt.eq C \, #h(2em) c lt.eq Im r_i lt.eq C \, $

 such that 
$ hat(G) = \( H_m - E - eta "diag"_A r \)^(- 1) quad upright("exists") \, #h(2em) Im hat(G)_(i i) gt.eq c quad \( i in A \) . $

 For fixed $d$ the constants are independent of $E \, lambda \, m$, and the convergence in probability is uniform in $E in I_d$ for each fixed $lambda$. The failure estimates are also uniformly small for all $m gt.eq 4 n_0$ and $u in \( 1 \/ 4 \, 1 \]$ once $n_0$ is sufficiently large. The potential in $H_m$ consists entirely of the original true variables.]
] <prop:certificate>

The proof occupies Sections 3–8. Section 9 proves that this certificate implies Theorem 1. The true potential vector retains its original product law as an unconditional marginal of the enlarged probability space. The success event may depend on that vector. The spectral proof uses a feasibility event in the true variables and unconditional averaging.

=== 2.2 True digits, site states, and retained information <true-digits-site-states-and-retained-information>

A uniform random variable $lambda V_i$ has the representation

#[#set math.equation(numbering: n => "(4)")
 $ lambda V_i = sum_(k gt.eq 1) lambda 2^(- k) epsilon_(i \, k) \, #h(2em) bb(P) \( epsilon_(i \, k) = 1 \) = bb(P) \( epsilon_(i \, k) = - 1 \) = 1 / 2 \, $ <eq:history-binary>]

with independent signs over all sites and indices. Resolve the possible binary ambiguity on its null set by a fixed convention. After the first $h$ signs at a site have been exposed, and before any further information about that site has been queried, its remaining sum is uniform on $\[ - lambda 2^(- h) \, lambda 2^(- h) \]$, with mean zero and variance $lambda^2 4^(- h) \/ 3$. In particular, after $n - n_0$ digits its variance is $s_n$, and its next digit has amplitude $sqrt(3 s_n \/ 4)$.

At each committed state the physical sites are partitioned into an active set $A$ and a terminal set $T$. Active sites retain artificial damping. A committed terminal site has its exact true potential, has been Schur-eliminated, and never changes again. During the one-digit stages an active site’s real potential value is partial. At the final endpoint, the active sites carry complete true potentials while retaining damping.

A subset of the active sites is marked #emph[pending]; a nonpending active site is #emph[coupled]. Before the final residual sweep, the construction maintains the following implication: at a coupled site the installed partial value is exactly the true revealed prefix, and no digit of its remaining suffix has been queried. At a stage boundary this prefix has $n - n_0$ digits; during a one-digit sweep it has one more digit at sites already processed. The final sweep installs the entire remaining true suffix. A pending site’s partial value may contain auxiliary digits, and the construction makes no freshness claim for its true suffix. The mark is conservative: the marking rule can cover an active site whose own next digit was not queried. A pending site can leave this class only by becoming terminal.

The numerical matrices and the information already revealed are separate records. Inside a trial, newly terminal physical sites and other matrix changes are provisional until the trial commits. A failure restores the pretrial potential values and partition into active and terminal sites, together with the corresponding matrices, and then applies the trial’s marking rule for pending sites. All answers already obtained remain in the retained history. Previously committed terminal sites remain permanent.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.35), [#box(width: 3.7cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[Coupled active#linebreak() true digits only]])])
  content((0, -1.35), [#box(width: 3.7cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[Pending active#linebreak() may use auxiliary digits]])])
  content((7.8, 0), [#box(width: 3.7cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), fill: rgb("#e8e8e8"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[Committed terminal#linebreak() complete true potential#linebreak() permanent]])])
  line((0, 0.55), (0, -0.55), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[failed trial]]])], anchor: "west")
  line((1.85, -1.35), (5.95, -0.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, -1.075), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[successful clearing]]])], anchor: "north")
  line((1.85, 1.35), (5.95, 0.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, 1.075), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[included in a#linebreak()successful clearing]]])], anchor: "south")
  rect((-2.35, -2.3), (2.35, 2.3), stroke: (paint: rgb("#999999"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  content((0, 2.32), [#text(size: 9pt)[Active sites retain artificial damping]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The arrows show possible changes between committed site states. A pending mark is conservative: the marked site’s own true suffix may remain unqueried. The final suffix sweep is reached only when no site is pending; after it succeeds, the active sites have complete true potentials and retain artificial damping. ],
) <fig:site-states>

Initially every site is active and coupled, and every partial value is zero. The retained-information lemma below supplies the conditional law of an unqueried input. Sections 5 and 7 verify that the inputs selected by ordinary trials and clearings are eligible for that law. In the matrix estimates, “fresh” means a centered variable with the stated law conditional on the history available before the chosen update. It is an explicit input until the corresponding eligibility check has been made.

===== 2.2.1 Retained information. <retained-information.>

The construction uses a separate countable array of independent auxiliary fair signs. It also uses independent uniform orders of fixed finite sets: a uniform order of a set $S$ of size $M$ is a uniformly chosen bijection from ${ 1 \, dots.h \, M }$ to $S$. All these sources are independent of the true signs and of one another. Only an auxiliary sign that is used, or the next entry of an order being used, is exposed. Section 5 specifies the source indices for each ordinary trial.

Number the successive queries and completed measurable decisions by $q = 1 \, 2 \, dots.h$, and let $cal(F)_q^(upright("ret"))$ be the information retained after operation $q$. Initially $cal(F)_0^(upright("ret"))$ contains only the fixed parameters and deterministic initial data. A completed measurable numerical choice counts as one operation even when it is defined by a limit, as with the later ridge choice or diagonal reset. Before a query, its type and source index are chosen measurably from the current history. A query may expose one true digit, one unused auxiliary sign, the remaining true suffix at a selected site, or the next entry of a selected finite order that has an unexposed entry. A whole true suffix is one operation; under the fixed binary convention, its value determines all the digits it contains. The history records the queried indices and answers and every exposed order entry. Numerical updates, choices, and failure decisions must be measurable from the information recorded by that time, so adjoining them gives no further information.

The current potential values, active and terminal sets, pending marks, and matrices are measurable functions of this retained history. Rollback and marking are measurable operations, and the sigma-fields $cal(F)_q^(upright("ret"))$ continue to increase: answers observed in failed trials remain known. Whenever an operation installs an exact true value whose remaining digits have not yet been queried, it first exposes and records that true suffix. This also applies when the change is controlled by a deterministic estimate.

#thm([Lemma 2.2.])[
  (Conditional freshness).  #emph[Suppose queries obey the preceding rule. Conditional on the retained history, the unqueried true digits retain their product fair-sign law. The same holds jointly for unused auxiliary signs. In particular, at distinct sites whose remaining true suffixes are unqueried, those suffixes are conditionally independent and have the uniform laws specified above. After a revealed prefix of an independent uniform order, its remaining order is conditionally uniform over the unexposed elements, jointly with the stated product law for unqueried signs.]
  #emph[These statements hold after every deterministic finite number of operations and at every almost surely finite stopping time of $\( cal(F)_q^(upright("ret")) \)$, with conditioning on the stopped sigma-field.]
] <lem:conditional-freshness>

#proof[
  Condition on the history before a query. Its source index is then fixed. Coordinates whose values are already recorded contribute no new information. If a query includes both known and unqueried digits, apply the following factorization to its unqueried part. For a sign query, the product law factors into the queried coordinate and the other unqueried coordinates. Adjoining the answer leaves the latter factors unchanged. For a whole true suffix, apply the same argument to its block of digits: test against finite cylinder functions of the other coordinates and then use the monotone class theorem. This is a statement about conditional expectations, so it also covers a continuous residual answer without conditioning on an individual value of probability zero. The same factorization applies to unused auxiliary signs.
  For a uniform order with $r$ elements still unexposed, each possible next element has exactly $\( r - 1 \) !$ completions. Its remaining order is therefore uniform after that entry is revealed. An answer subsequently queried at the selected index uses no unexposed order entry. Choices and failure decisions made from the enlarged history add no information. Induction proves the assertions after every fixed finite number of operations.
  For precision at a random operation time, let $tau$ be a stopping time of $\( cal(F)_q^(upright("ret")) \)$ with $bb(P) \( tau < oo \) = 1$, and let $cal(F)_tau^(upright("ret"))$ be its stopped sigma-field. For $D in cal(F)_tau^(upright("ret"))$, apply each finite-operation conditional-expectation identity against $D ∩ { tau = q } in cal(F)_q^(upright("ret"))$ and sum over $q$. These countably many events exhaust $D$ up to a null set and give the same identity conditional on $cal(F)_tau^(upright("ret"))$. A whole-suffix query remains one operation in this argument. ◻
]

=== 2.3 Schur reduction and the Ward Laplacian <schur-reduction-and-the-ward-laplacian>

For the fixed $E$ and $lambda > 0$, almost surely every principal matrix of the true $H_m - E$ is invertible. Indeed, for a nonempty subset its determinant is a polynomial in the independent continuous potentials, with nonzero highest monomial $product_i lambda V_i$. Its zero set has Lebesgue measure zero. There are finitely many subsets on the torus. We henceforth work on this event, which also covers subsets chosen adaptively later. This probability-one property is not a preliminary test of unrevealed potentials and supplies no information to the algorithm’s filtration. The empty terminal block requires no inverse.

Let $cal(H)$ be the real symmetric matrix with the current real potential values on $A$ and exact true values on $T$. Eliminate the terminal block at the real energy $E$, obtaining

$ M = \( cal(H) - E \)_(A A) - \( cal(H) - E \)_(A T) \( cal(H) - E \)_(T T)^(- 1) \( cal(H) - E \)_(T A) . $

The matrix $M$ is real symmetric. Its off-diagonal entries connect nearest neighbors or sites joined through one connected component of terminal sites. Throughout, the subscript in a Schur complement names the #emph[eliminated] indices: if $R$ is the complement of $cal(E)$,

$ "Schur"_(cal(E)) B = B_(R R) - B_(R cal(E)) B_(cal(E) cal(E))^(- 1) B_(cal(E) R) . $

We use this notation only when the displayed inverse exists. Put $r = \( r_i \)_(i in A) in bb(C)^A$, $p_i = Im r_i > 0$, and, for a scale $t > 0$, define

$ g = \( M - t "diag" r \)^(- 1) \, #h(2em) h = sqrt(t) thin g \, #h(2em) K_(i j) = h_(i j)^2 \, quad F_(i j) = \| h_(i j) \|^2 \, quad q_i = Im g_(i i) . $

The inverse exists because its matrix has strictly negative imaginary part. In particular $parallel g parallel lt.eq \( t min p_i \)^(- 1)$. Both $g$ and $h$ are complex symmetric. For a matrix $B$, $Im B = \( B - B^(*) \) \/ \( 2 i \)$; here it is also the entrywise imaginary part. The resolvent identity gives the Ward identity

#[#set math.equation(numbering: n => "(5)")
 $ h "diag" \( p \) h^(*) = Im g \, #h(2em) F p = q . $ <eq:ward>]

Consequently

$ D = "diag" \( p q \) - "diag" \( p \) F "diag" \( p \) $

is a real graph Laplacian, with nonnegative edge weights $p_i p_j F_(i j)$. Its quadratic form is

$ D \( f \) = 1 / 2 sum_(i \, j) p_i p_j F_(i j) \| f_i - f_j \|^2 . $

The nonnegative weights $F_(i j) = \| h_(i j) \|^2$ describe how the Ward mass is distributed across a row. We use $B \( f \) = chevron.l f \, B f chevron.r$ for the quadratic form of a Hermitian matrix. At the committed states below, the kernel of $D$ is precisely the constants. Its pseudoinverse $X = D^(+)$ is then an inverse on neutral charges, namely vectors $y$ with $sum_i y_i = 0$.

We record the precise Schur identity for these inverse forms. If $U$ is eliminated and $R = A \\ U eq.not diameter$, then $D_(U U)$ is positive definite: extending a zero-energy vector by zero on $R$ would otherwise give a nonconstant vector in $ker D$. Moreover,

$ \( "Schur"_U D \) \( f_R \) = min_(f_U) D \( f_R \, f_U \) . $

It follows that $"Schur"_U D$ has only the constant kernel. For a neutral $y$ supported on $R$, extend it by zero to $A$ and use the variational formula

$ X \( y \) = sup_f { 2 Re chevron.l y \, f chevron.r - D \( f \) } . $

Minimizing first over $f_U$ proves

#[#set math.equation(numbering: n => "(6)")
 $ \( "Schur"_U D \)^(+) \( y \) = D^(+) \( y \) . $ <eq:schur-inverse-form>]

All later inverse-form comparisons across deletion are understood in this sense, on survivor-supported neutral charges, not as an equality of full pseudoinverse matrices.

At the beginning of a stage the state satisfies $r_i = g_(i i)$. During a sweep or clearing trial, $r$ remains frozen. Thus $q = p$ at the stage boundary, and the difference $g_(i i) - r_i$ measures the subsequent diagonal lag. Because $g$ itself depends on $r$, restoring the equality requires a small self-consistent correction. The stage-end reset in Section 7 constructs that correction.

The role of $K$ is visible in this self-consistency equation. For the physical active inverse, differentiation with respect to the complex diagonal parameter gives

$ frac(partial g_(i i), partial r_j) = t g_(i j)^2 = K_(i j) . $

Thus the linearization of $r - \( g_(i i) \( r \) \)_(i in A) = 0$ is $I - K$, which is invertible whenever $parallel K parallel < 1$.

For $n_0 lt.eq n < m$, a transition from scale $n$ to $n + 1$ consists of an ordinary sweep, any scheduled clearings at $t_(n + 1)$, and a diagonal reset. Clearings run only through $J = floor.l m \/ 2 floor.r$. At the end of stage $J$, the construction aborts if any site remains pending; after $J$ it aborts if the first trial at any tile fails. At scale $m$, a final residual sweep inserts each remaining true suffix, leaves damping $eta$, and has no reset. Sections 7 and 8 specify the trial, marking, and abort rules.

=== 2.4 The bounds carried between stages <the-bounds-carried-between-stages>

The full-torus positive nearest-neighbor Laplacian is denoted by $Lambda$. Thus $Lambda \( v \)$ is the sum of $\| v_i - v_j \|^2$ over unordered nearest-neighbor edges. Charges on a subset are extended by zero when inserted in $Lambda^(+)$. We fix

$ delta = 0.01 \, #h(2em) kappa = 0.005 delta \, #h(2em) nu = 10^(- 5) delta \/ d \, #h(2em) H_(*) = t^(1 + delta) \, #h(2em) b = t_(n_0) t . $

Thus $d nu = 10^(- 5) delta$; the dimension-scaled choice will absorb the overlap of component neighborhoods. Constants in $O \( dot.op \)$ depend only on $d$, the displayed fixed energy window, and the fixed broad bounds specified below. By making $lambda_0 \( d \)$ smaller we may make $n_0$ arbitrarily large. Every later use of a strict power margin is made after this single choice.

At a committed stage boundary, the entries of $r$ are bounded and $c lt.eq p_i lt.eq C$. We maintain

$ parallel K parallel lt.eq 1 / 3 \, #h(2em) max_i sum_j \| h_(i j) \|^4 lt.eq H_(*) \, #h(2em) ker D = bb(C) upright(bold(1)) . $

The fourth-power bound is the squared row norm $sum_j F_(i j)^2$. It limits concentration across the columns of each row. The local variance estimates need this control in addition to Ward’s bound on the weighted row sum. On neutral charges we maintain the three comparisons

#[#set math.equation(numbering: n => "(7)")
 $ X & gt.eq c_n b thin Lambda^(+) \,\
X & lt.eq C_0 I + C_n b thin Lambda^(+) \,\
X & lt.eq \( 1 + t^kappa \) "diag" \( p^(- 2) \) + C_n t thin Lambda^(+) . $ <eq:comparators>]

Here $C_0$ is a sufficiently large fixed constant, while $c_n \, C_n$ remain bounded above and below by positive constants, changing only by summable relative errors. Boundedness of the weighted row sums of $F$ also gives $X gt.eq c I$ on this subspace: the absolute row sums of $D$ are at most $2 max_i p_i q_i$, so $D lt.eq C I$.

The first two comparisons express an equivalence of spatial energies. To formulate it also for the duplicated sites used in a sweep, allow one or two #emph[ports] at each active physical site. For a port charge $y$, let $y_Sigma$ be the full-torus charge formed by summing its ports at each physical site and extending by zero. A full-torus function $v$ is repeated at all ports at a site. Define the dual quadratic forms

#[#set math.equation(numbering: n => "(8)")
 $ W^(*) \( y \) & = parallel y parallel_2^2 + b thin Lambda^(+) \( y_Sigma \) \, #h(2em) sum_x y_x = 0 \,\
W \( f \) & = inf_(f = alpha + v \|_(upright("ports"))) (parallel alpha parallel_2^2 + b^(- 1) Lambda \( v \)) . $ <eq:dual-forms>]

The second form is on potentials modulo constants. Lemma 5 proves the duality and explains the resulting relations $X asymp W^(*)$ and $D asymp W$. The final comparison in (7) is sharper: its high-frequency diagonal coefficient tends to one. Retaining that coefficient will supply the extra gain in the row-fourth-moment estimates.

We also track geometry. Let $d_T \( i \, j \)$ be shortest-path pseudodistance in the physical torus when an edge touching a terminal site has cost zero and every other nearest-neighbor edge has cost one. The induction will maintain

$ d_T \( i \, j \) gt.eq 1 / 2 "dist" \( i \, j \) - t^(- 1.03) . $

The matrices $M$ can have large entries after a Schur reduction. Nevertheless, every nonlocal entry joins points at zero $d_T$-distance. This permits the resolvent decay estimate needed for local monitoring. Section 7 proves the geometric bound, including the temporary terminal sites inside a clearing trial.

There are two distinct uses of these bounds. An ordinary trial stops at the first local budget violation or failure of a required prefix bound, including the global correction, row, and lag caps. The violating increment is included in the stopped estimates. Clearing prefixes are governed by their own stopped trial budgets, which yield the provisional diagonal and row bounds; geometry is supplied separately. For each successful clearing, the assembly argument proves the $K$ and Laplacian comparisons for the committed output from its stated hypotheses. The trial statements make these two regimes explicit. The maximal concentration estimate used for their stopped probability bounds is proved in Section 5.

== 3 The initial state and its comparison forms <sec:initialization>

This section constructs the initial state with every site active and its partial potential equal to zero, for every fixed $d gt.eq 3$ and the corresponding interval $I_d$ in (2). We prove that the initial inverse has a bounded diagonal, a small squared-entry operator, small fourth-power row sums, and the three comparison bounds in (7). We first establish the lattice inequalities used to express those bounds and to localize them later.

=== 3.1 Duality and lattice estimates <duality-and-lattice-estimates>

Let $bb(T)_L = \( bb(Z) \/ L bb(Z) \)^d$, $L gt.eq 4$, and $N = L^d$. An index set $cal(A)$ consists of sites of $bb(T)_L$, with at most two copies of each site permitted. Write $pi : cal(A) arrow.r bb(T)_L$ for the underlying site map. For a function $v$ on $bb(T)_L$, let $\( cal(C) v \)_x = v_(pi \( x \))$. The adjoint sends a charge $y$ on $cal(A)$ to

$ \( y_Sigma \)_i = \( cal(C)^(*) y \)_i = sum_(x : pi \( x \) = i) y_x \, $

with value zero at sites not represented in $cal(A)$. The positive nearest-neighbor Laplacian is denoted by $Lambda$, and $Lambda^(+)$ is its inverse on mean-zero functions, extended by zero on constants. We normalize the gradient energy by $parallel nabla v parallel_2^2 = chevron.l v \, Lambda v chevron.r$.

#thm([Lemma 3.1.])[
  (Dual comparison forms).  #emph[For $b > 0$, define 
$ W \( f \) & = inf_(f = alpha + cal(C) v) #scale(x: 120%, y: 120%)[\(] parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 #scale(x: 120%, y: 120%)[\)] \,\
W^(*) \( y \) & = parallel y parallel_2^2 + b chevron.l y_Sigma \, Lambda^(+) y_Sigma chevron.r \, #h(2em) sum_(x in cal(A)) y_x = 0 . $

 Then $W$ is a positive definite quadratic form on functions on $cal(A)$ modulo constants, and $W^(*)$ is its dual quadratic form: 
$ W^(*) \( y \) = sup_f #scale(x: 120%, y: 120%)[\(] 2 Re chevron.l y \, f chevron.r - W \( f \) #scale(x: 120%, y: 120%)[\)] . $

 In particular, if $D$ is a Laplacian on $cal(A)$ whose kernel is exactly the constants and $X = D^(+)$, then $c W^(*) lt.eq X lt.eq C W^(*)$ on neutral charges is equivalent to $C^(- 1) W lt.eq D lt.eq c^(- 1) W$ on functions modulo constants.]
] <lem:dual-forms>

#proof[
  Because $cal(C)$ carries constants to constants, $W$ is unchanged by addition of a constant to $f$. The minimization is a finite-dimensional least-squares problem, so its minimum is attained and is a quadratic form in $f$. Zero energy forces $alpha = 0$ and $v$ constant, so the induced form on the quotient is positive definite.
  For a neutral $y$, completion of squares gives
  $ sup_f #scale(x: 120%, y: 120%)[\(] 2 Re chevron.l y \, f chevron.r - W \( f \) #scale(x: 120%, y: 120%)[\)] & = sup_(alpha \, v) #scale(x: 120%, y: 120%)[\(] 2 Re chevron.l y \, alpha + cal(C) v chevron.r - parallel alpha parallel_2^2 - b^(- 1) chevron.l v \, Lambda v chevron.r #scale(x: 120%, y: 120%)[\)]\
 & = parallel y parallel_2^2 + b chevron.l cal(C)^(*) y \, Lambda^(+) cal(C)^(*) y chevron.r . $
  Neutrality makes $cal(C)^(*) y$ orthogonal to constants. The inverse matrix of a positive quadratic form is its dual, which proves both the identity and the comparison assertion on the quotient. ◻
]

We use unnormalized Fourier coefficients $hat(y) \( k \) = sum_x y_x e^(- i k dot.op x)$, with inverse normalization $N^(- 1)$. Frequencies belong to the grid $cal(K)_L = \( 2 pi \/ L \) bb(Z)^d$ modulo $2 pi bb(Z)^d$, represented in $\[ - pi \, pi \)^d$; the symbol of $Lambda$ is

#[#set math.equation(numbering: n => "(9)")
 $ ell \( k \) = 4 sum_(j = 1)^d sin^2 \( k_j \/ 2 \) asymp \| k \|^2 . $ <eq:initial-laplacian-symbol>]

#thm([Lemma 3.2.])[
  (A charge estimate for fixed dimension $d gt.eq 3$).  #emph[There is a constant $C_d$ such that, for every $L gt.eq 4$, every index set $cal(A)$ as above, and every charge $y$ on $cal(A)$, 
$ chevron.l y_Sigma \, Lambda^(+) y_Sigma chevron.r lt.eq C_d parallel y parallel_1^(4 \/ 3) parallel y parallel_2^(2 \/ 3) . $

]
] <lem:fourier-charge>

#proof[
  Counting grid frequencies in dyadic annuli and using (9) gives
  #[#set math.equation(numbering: n => "(10)")
   $ N^(- 1) sum_(0 < \| k \| lt.eq a) ell \( k \)^(- 1) lt.eq C_d a^(d - 2) lt.eq C_d a \, #h(2em) 0 < a lt.eq 1 . $ <eq:initial-frequency-sum>]
  For completeness, a ball of radius $r gt.eq 2 pi \/ L$ contains at most $C_d \( 1 + L r \)^d lt.eq C_d N r^d$ grid points. On an annulus $r \/ 2 < \| k \| lt.eq r$, the summand is at most $C r^(- 2)$. Decomposing the ball of radius $a$ into dyadic annuli, discarding empty annuli below the first mesh frequency, gives $C_d sum_(j gt.eq 0) \( 2^(- j) a \)^(d - 2) lt.eq C_d a^(d - 2)$. If $a$ is smaller than the first nonzero frequency, the sum is empty. The weaker last bound deliberately retains the exponents needed later; it is valid because $a lt.eq 1$ and $d - 2 gt.eq 1$.
  At each frequency $\| hat(y_Sigma) \( k \) \| lt.eq parallel y parallel_1$, while at most two copies per site gives $parallel y_Sigma parallel_2^2 lt.eq 2 parallel y parallel_2^2$. The low frequencies in the quadratic form are therefore bounded by $C a parallel y parallel_1^2$, and Parseval bounds the high frequencies by $C a^(- 2) parallel y parallel_2^2$. For $y eq.not 0$, choose $a = \( parallel y parallel_2 \/ parallel y parallel_1 \)^(2 \/ 3) lt.eq 1$. This proves the claimed inequality. For $y = 0$ there is nothing to prove. ◻
]

#thm([Lemma 3.3.])[
  (Weighted cube inequality).  #emph[Let $Q$ be a lattice cube in $bb(Z)^d$ of integer side $l gt.eq 1$, let $v : Q arrow.r bb(C)$, and let $w_i gt.eq 0$ be weights. With the gradient restricted to edges contained in $Q$, 
$ parallel v - "avg"_Q v parallel_(2 \, Q)^2 lt.eq C_d l^2 parallel nabla v parallel_(2 \, Q)^2 \, $

 and 
#[#set math.equation(numbering: n => "(11)")
 $ sum_(i in Q) w_i \| v_i - "avg"_Q v \|^2 lt.eq C_d \( max_Q w \)^(1 \/ 3) #scale(x: 180%, y: 180%)[\(] sum_Q w #scale(x: 180%, y: 180%)[\)]^(2 \/ 3) parallel nabla v parallel_(2 \, Q)^2 . $ <eq:initial-weighted-cube>]

 For fixed $d$, the constants are independent of $l$, $v$, and the weights. The statements also hold for cubes in a torus whenever their internal edges are identified with those of a lattice cube.]
] <lem:cube-weight>

#proof[
  The case $l = 1$ is immediate. Translate $Q$ to ${ 0 \, dots.h \, l - 1 }^d$. Define
  $ rho \( j \) = cases(delim: "{", j \, & 0 lt.eq j < l \,, 2 l - 1 - j \, & l lt.eq j < 2 l \,) #h(2em) V \( j_1 \, dots.h \, j_d \) = v \( rho \( j_1 \) \, dots.h \, rho \( j_d \) \) - "avg"_Q v . $
  This gives a centered function on $bb(T)_(2 l)$. Each original site has $2^d$ preimages. Every internal cube edge is copied $2^d$ times, and differences on the folding edges vanish. Consequently
  $ parallel V parallel_2^2 = 2^d parallel v - "avg"_Q v parallel_(2 \, Q)^2 \, #h(2em) Lambda_(2 l) \( V \) = 2^d parallel nabla v parallel_(2 \, Q)^2 . $
  The smallest positive eigenvalue of $Lambda_(2 l)$ is at least $c l^(- 2)$, so Parseval proves the first assertion.
  For the weighted assertion put $M = max_Q w$ and $S = sum_Q w$. If $S = 0$ there is nothing to prove. Otherwise $a = \( M \/ S \)^(1 \/ 3) in \( 0 \, 1 \]$. Split $V$ into frequencies $0 < \| k \| lt.eq a$ and $\| k \| > a$; its zero Fourier coefficient vanishes. With normalized inverse Fourier transformation, Cauchy–Schwarz gives
  $ \| V_(upright("low")) \( x \) \|^2 lt.eq (\( 2 l \)^(- d) sum_(0 < \| k \| lt.eq a) ell \( k \)^(- 1)) (\( 2 l \)^(- d) sum_k ell \( k \) \| hat(V) \( k \) \|^2) . $
  Thus (10) and Parseval imply
  $ parallel V_(upright("low")) parallel_oo^2 lt.eq C_d a Lambda_(2 l) \( V \) \, #h(2em) parallel V_(upright("high")) parallel_2^2 lt.eq C_d a^(- 2) Lambda_(2 l) \( V \) . $
  These inequalities include the case of an empty low-frequency range. Restricting to $Q$, using $\| z_1 + z_2 \|^2 lt.eq 2 \| z_1 \|^2 + 2 \| z_2 \|^2$, and applying the exact reflection identities above, we obtain
  $ sum_(i in Q) w_i \| v_i - "avg"_Q v \|^2 lt.eq C_d \( S a + M a^(- 2) \) parallel nabla v parallel_(2 \, Q)^2 . $
  The chosen value of $a$ gives $S a = M a^(- 2) = M^(1 \/ 3) S^(2 \/ 3)$, proving the claim. ◻
]

#thm([Lemma 3.4.])[
  (Spatial counting and exponential moments).  #emph[For ordinary nearest-neighbor distance on $bb(T)_L$, balls satisfy $\| B \( x \, R \) \| lt.eq C_d \( 1 + R \)^d$. If $1 lt.eq R lt.eq L \/ 4$, they also satisfy $\| B \( x \, R \) \| gt.eq c_d R^d$. Uniformly in $L$, for $0 < u lt.eq 1$ and $a = 0 \, 2$, 
#[#set math.equation(numbering: n => "(12)")
 $ sum_y "dist" \( x \, y \)^a e^(- u "dist" \( x \, y \)) lt.eq C_d u^(- d - a) \, $ <eq:lattice-exponential-moments>]

 where the factor $"dist" \( x \, x \)^0$ is interpreted as $1$.]
] <lem:lattice-counting>

#proof[
  Represent each displacement by coordinate differences of least absolute value. A distance ball is contained in the coordinate box $\[ - R \, R \]^d$, proving the upper bound. For $R lt.eq L \/ 4$, a coordinate box of radius $floor.l R \/ d floor.r$ embeds without identifications and is contained in the distance ball, giving the lower bound after adjusting the constant for bounded $R$. The number of representatives at distance $r$ is at most $C_d \( 1 + r \)^(d - 1)$, by counting nonnegative integer $d$-tuples of sum $r$ and their signs. Thus the left side of (12) is bounded by $C_d sum_(r gt.eq 0) \( 1 + r \)^(d - 1 + a) e^(- u r)$, which is at most $C_d u^(- d - a)$ by comparison with its integral. ◻
]

These lattice estimates are uniform in the torus and cube sizes. They will allow local changes to be measured in the same forms as the initial state. We now construct that state and identify its Fourier comparison operator.

=== 3.2 The fixed interval and the scalar diagonal equation <the-fixed-interval-and-the-scalar-diagonal-equation>

Self-consistent diagonal equations and free lattice resolvent estimates also play a central role in #cite(label("BlackDroginHernandez2025")) Section 2.2 and Appendix A. We prove the specific finite-volume estimates needed here, including the gap at the smallest nonzero grid frequency.

The free dispersion in the negative-hopping convention is

$ a \( k \) = - 2 sum_(j = 1)^d cos k_j = - 2 d + ell \( k \) . $

Write $a_d = e_2$ for $d = 3$ and $a_d = 1 \/ 100$ for $d gt.eq 4$, so that $I_d = - 2 d + \( a_d \/ 2 \, a_d \)$. Choose $e_2 > 0$ fixed and sufficiently small, with $e_2 < 1 \/ 100$. For estimates involving a small shift of energy, use the larger compact offset interval

$ cal(J)_d = \[ 2 a_d \/ 5 \, 5 a_d \/ 4 \] subset \( 0 \, 0.04 \) . $

For $d gt.eq 4$ this is exactly $\[ 1 \/ 250 \, 1 \/ 80 \]$. The parameter $a_d$ is fixed before the coupling or any scale is chosen. In the free-resolvent analysis below, constants may depend on $d$ and this fixed $a_d$; this dependence is included in the notation $C_d$. In what follows, integrals over the frequency torus are normalized by $\( 2 pi \)^(- d)$.

#thm([Lemma 3.5.])[
  (The free resolvent near the band minimum).  #emph[The function 
$ G_0 \( z \) = integral_(\[ - pi \, pi \)^d) frac(1, a \( k \) - z) thin frac(d k, \( 2 pi \)^d) \, #h(2em) Im z > 0 \, $

 extends continuously from above to $- 2 d + cal(J)_d$. Its boundary imaginary part there is bounded above and below by positive constants depending only on the fixed dimension and window. Uniformly for $alpha in - 2 d + cal(J)_d$ and $0 < v lt.eq 1$, 
#[#set math.equation(numbering: n => "(13)")
 $ integral frac(d k \/ \( 2 pi \)^d, \| a \( k \) - alpha - i v \|) lt.eq C_d log \( 2 \/ v \) \, #h(2em) lr(|integral frac(d k \/ \( 2 pi \)^d, \( a \( k \) - alpha - i v \)^2)|) lt.eq C_d log \( 2 \/ v \) . $ <eq:initial-density-integrals>]

 The second estimate holds uniformly also for $- 2 sum_(j = 1)^d c_j cos \( k_j + phi.alt_j \)$ whenever $max_j \| c_j - 1 \| lt.eq epsilon_d$ for a sufficiently small fixed $epsilon_d > 0$, with arbitrary real phases $phi.alt_j$.]
] <lem:initial-bottom-density>

#proof[
  On $\( - pi \, pi \)^d$ make the one-to-one change of coordinates $x_j = 2 sin \( k_j \/ 2 \)$. Then $a \( k \) + 2 d = \| x \|^2$ and $d k = product_j \( 1 - x_j^2 \/ 4 \)^(- 1 \/ 2) d x$. For $0 < s < 0.04$ the entire sphere of radius $sqrt(s)$ lies in the coordinate domain, so polar integration shows that the normalized density of $a + 2 d$ equals
  #[#set math.equation(numbering: n => "(14)")
   $ rho_d \( s \) = frac(s^(d \/ 2 - 1), 2 \( 2 pi \)^d) integral_(S^(d - 1)) product_(j = 1)^d \( 1 - s omega_j^2 \/ 4 \)^(- 1 \/ 2) thin d sigma \( omega \) . $ <eq:initial-density-formula>]
  This density is positive and smooth on $\( 0 \, 0.04 \)$. On every compact subinterval its derivatives are bounded and the density has a positive lower bound, with constants allowed to depend on $d$.
  Choose a smooth cutoff $chi$ supported in $\( a_d \/ 5 \, 2 a_d \)$ and equal to one on a neighborhood of $cal(J)_d$. Split the Stieltjes integral into this localized density and the complementary part. In the latter part the real denominator stays a fixed distance from zero for energies in $- 2 d + cal(J)_d$, so it is continuous and bounded up to the real axis, as is its derivative. In the former part, subtract $rho_d \( alpha + 2 d \)$ locally from the density. The difference vanishes linearly at the real energy; its Cauchy integral has a continuous upper boundary value. The constant part is an explicit logarithmic integral. This proves upper-half-plane continuity and gives the boundary imaginary part $pi rho_d \( alpha + 2 d \)$.
  For the first inequality in (13), integrate the bounded localized density against $\( \( s - \( alpha + 2 d \) \)^2 + v^2 \)^(- 1 \/ 2)$; its integral over the fixed support is at most $C log \( 2 \/ v \)$. For the second, integration by parts gives
  $ integral frac(chi \( s \) rho_d \( s \), \( s - \( alpha + 2 d \) - i v \)^2) thin d s = integral frac(\( chi rho_d \)' \( s \), s - \( alpha + 2 d \) - i v) thin d s . $
  There is no boundary term. The same absolute-integral estimate bounds this expression, while the complementary contribution stays bounded.
  For the perturbation assertion, first translate all phases in the continuum torus integral. Put $x_j = 2 sqrt(c_j) sin \( k_j \/ 2 \)$, so the new minimum is $- 2 sum_j c_j$ and the excess energy is $\| x \|^2$. The Jacobian is
  $ product_(j = 1)^d c_j^(- 1 \/ 2) \( 1 - x_j^2 \/ \( 4 c_j \) \)^(- 1 \/ 2) . $
  Choose $epsilon_d$ so small that $c_j gt.eq 1 \/ 2$ and $2 d epsilon_d < a_d \/ 10$. Energies in $- 2 d + cal(J)_d$ then have excess above the shifted minimum in a fixed compact subinterval of $\( a_d \/ 5 \, 2 a_d \)$. The corresponding polar density and its derivatives are uniformly bounded there. A cutoff equal to one on that compact interval gives the same integration-by-parts estimate, uniformly in the coefficients and phases. ◻
]

#thm([Proposition 3.6.])[
  (Initialization).  #emph[For each fixed $d gt.eq 3$ there are $lambda_0 \( d \) > 0$ and positive constants $a_0 \, B \, c \, C \, C_0$, depending only on the fixed dimension and window, with the following property. For $0 < lambda < lambda_0 \( d \)$, the scales in (3), $m gt.eq 4 n_0$, $L = 4^(20 m)$, and every $E in I_d$, write $t = t_(n_0)$. There is a scalar $r$ with 
$ \| Re r \| lt.eq B \, #h(2em) a_0 lt.eq p := Im r lt.eq B \, #h(2em) r = N^(- 1) sum_k frac(1, a \( k \) - E - t r) . $

 It is the unique solution in the displayed rectangle and depends continuously on $E$.]
  #emph[Take all sites active, all partial potentials zero, and $g = \( H_0 - E - t r \)^(- 1)$, where $H_0$ is the free hopping matrix on $bb(T)_L$. With $h \, K \, F \, D \, X$ as in Section 2, one has $g_(i i) = r$, $parallel K parallel lt.eq 1 \/ 10$, and 
$ max_i sum_j \| h_(i j) \|^4 lt.eq 1 / 10 t^(1 + delta) . $

 The kernel of $D$ is exactly the constants, and on neutral charges, 
#[#set math.equation(numbering: n => "(15)")
 $ X & gt.eq c t^2 Lambda^(+) \, #h(2em) X gt.eq c I \,\
X & lt.eq C_0 I + C t^2 Lambda^(+) \,\
X & lt.eq \( 1 + t^kappa \) p^(- 2) I + C t Lambda^(+) . $ <eq:initial-comparisons>]

 Thus this state satisfies (7), with startup $b = t_(n_0) t = t^2$ and constants independent of $E \, lambda \, m$.]
] <prop:initialization>

#proof[
  We first solve the scalar equation, then prove the two smallness bounds, and finally identify the inverse form of $D$.
  ===== 3.2.1 The scalar fixed point. <the-scalar-fixed-point.>
  By Lemma 9, the boundary values $G_0 \( alpha + i 0 \)$ for $alpha in - 2 d + cal(J)_d$ form a compact subset of the upper half-plane. Choose $a_0 > 0$ and $B < oo$ so that they lie strictly inside the rectangle
  $ cal(B) = { r : \| Re r \| lt.eq B \, med a_0 lt.eq Im r lt.eq B } . $
  The closure of $I_d$ lies in the interior of $- 2 d + cal(J)_d$. Hence, when $t$ is small, $E + t Re r in - 2 d + cal(J)_d$ for every $E in I_d$ and $r in cal(B)$. Uniform boundary continuity on this compact interval shows that $r mapsto G_0 \( E + t r \)$ maps $cal(B)$ into its interior with fixed slack.
  For a periodic $C^1$ function, comparing each grid cell with its corner gives an integral-to-grid error at most $C L^(- 1) parallel nabla f parallel_oo$. On $cal(B)$, set $z = E + t r$ and $R \( k \) = \( a \( k \) - z \)^(- 1)$. Since $Im z asymp t$,
  #[#set math.equation(numbering: n => "(16)")
   $ parallel nabla R parallel_oo lt.eq C t^(- 2) \, #h(2em) parallel nabla \( R^2 \) parallel_oo lt.eq C t^(- 3) . $ <eq:initial-grid-derivatives>]
  The finite-grid map $Phi \( r \) = N^(- 1) sum_k R \( k \)$ consequently preserves $cal(B)$, provided $C \/ \( L t^2 \)$ is sufficiently small. Here $t asymp 4^(- n_0)$ and $L gt.eq 4^(20 n_0)$, so
  #[#set math.equation(numbering: n => "(17)")
   $ epsilon_L := frac(C, L t^2) lt.eq C t^18 . $ <eq:initial-grid-error>]
  The second estimate of Lemma 9 holds for every $r in cal(B)$, without a fixed-point hypothesis. Differentiating the finite sum and using (16) gives
  $ sup_(r in cal(B)) \| Phi' \( r \) \| lt.eq C t log \( 1 \/ t \) + epsilon_L . $
  It is less than $1 \/ 2$ for small $t$. Integrating the complex derivative along any segment in the convex rectangle makes $Phi$ a contraction. Iteration from one fixed starting point in $cal(B)$ constructs its unique fixed point. The iterates are continuous in $E$ and converge uniformly, so the fixed point is continuous in $E$.
  At this solution, translation invariance gives $g_(i i) = r$. Taking imaginary parts of the scalar equation, and cancelling $p > 0$, yields the exact finite-grid normalization
  #[#set math.equation(numbering: n => "(18)")
   $ t "avg"_k \| R \( k \) \|^2 = 1 . $ <eq:initial-normalization>]
  ===== 3.2.2 The Fourier symbols and the remaining bounds. <the-fourier-symbols-and-the-remaining-bounds.>
  For each grid displacement $zeta in cal(K)_L$, Fourier transformation gives
  #[#set math.equation(numbering: n => "(19)")
   $ hat(F) \( zeta \) = t "avg"_k R \( k \) overline(R \( k + zeta \)) \, #h(2em) hat(K) \( zeta \) = t "avg"_k R \( k \) R \( k + zeta \) . $ <eq:initial-symbols>]
  The first symbol is real, either because $F$ is real and even or by the change $k mapsto - k - zeta$ and $R \( - k \) = R \( k \)$. Its zero mode is $1$ by (18), and Cauchy–Schwarz gives $\| hat(F) \( zeta \) \| lt.eq 1$. Both convolution operators are unitarily diagonalized by Fourier transformation, and Parseval gives the row identity:
  $ parallel K parallel = max_(zeta in cal(K)_L) \| hat(K) \( zeta \) \| \, #h(2em) sum_j \| h_(i j) \|^4 = N^(- 1) sum_(zeta in cal(K)_L) \| hat(F) \( zeta \) \|^2 . $
  Thus the two smallness assertions require a uniform bound for $hat(K)$ and an averaged square bound for $hat(F)$. At the fixed point $q = p$ is scalar, so $D = p^2 \( I - F \)$. The inverse-form comparisons will follow from a two-sided estimate of $1 - hat(F) \( zeta \)$ at every nonzero grid frequency. At higher frequencies we will also use that $hat(F)$ is small to retain the sharp diagonal coefficient.
  ===== 3.2.3 An absolute-product bound, including tangential intersections. <an-absolute-product-bound-including-tangential-intersections.>
  We first pass to the continuum frequency torus. For every nonzero displacement $zeta in \[ - pi \, pi \)^d$, we claim
  #[#set math.equation(numbering: n => "(20)")
   $ t integral \| R \( k \) R \( k + zeta \) \| thin frac(d k, \( 2 pi \)^d) lt.eq frac(C_d t log^2 \( 1 \/ t \), \| zeta \|) . $ <eq:initial-absolute-product>]
  For quadratic dispersion, Erdős, Salmhofer and Yau obtain a related inverse-displacement two-resolvent bound by radial and angular integration #cite(label("ErdosSalmhoferYau2008")) author-preprint Appendix A, Lemma A.1, equations (A.2) and (A.4). The proof below supplies the required near-bottom lattice estimate by convex slicing, including tangency.
  In this estimate the displacement need not lie on the finite grid. For small $t$ the real excess energy $Re z + 2 d$ lies in $cal(J)_d$. If either dispersion has excess at least $0.04$, the corresponding denominator is separated from zero by a fixed positive constant. Lemma 9 then bounds this part of the integral, including the factor $t$, by $C_d t log \( 1 \/ t \)$. This is absorbed by the right side of (20), since $\| zeta \| lt.eq pi sqrt(d)$.
  In the joint region where both excess energies are below $0.04$, the frequency vectors $k$ and $k + zeta$ have unique small unwrapped representatives: every coordinate has absolute value at most $2 arcsin \( 0.1 \) < 0.201$. Their difference is the representative $zeta$, so $\| zeta_j \| < 0.402$. Set $x_j = sin \( k_j + zeta_j \/ 2 \)$. The joint region is contained in $\| x_j \| < 1 \/ 4$, where the change of variables and its inverse have bounded Jacobians. The two dispersions become
  $ A_plus.minus \( x \) = - 2 sum_(j = 1)^d cos \( zeta_j \/ 2 \) sqrt(1 - x_j^2) med plus.minus med 2 sum_(j = 1)^d sin \( zeta_j \/ 2 \) x_j . $
  Since $cos \( zeta_j \/ 2 \) gt.eq cos \( 0.201 \) > 0$, their Hessians are uniformly positive and bounded on that box. Their difference is linear:
  $ A_(+) \( x \) - A_(-) \( x \) = b_zeta dot.op x \, #h(2em) \( b_zeta \)_j = 4 sin \( zeta_j \/ 2 \) \, #h(2em) c \| zeta \| lt.eq \| b_zeta \| lt.eq C \| zeta \| . $
  Suppose that the two energy constraints
  $ \| A_(-) \( x \) - Re z \| lt.eq s_1 \, #h(2em) \| A_(+) \( x \) - Re z \| lt.eq s_2 $
  hold simultaneously, where $s_1 \, s_2 > 0$. Their difference gives $\| b_zeta dot.op x \| lt.eq s_1 + s_2$. Thus $x$ lies in a slab normal to $b_zeta$ of width at most $C max \( s_1 \, s_2 \) \/ \| zeta \|$. On each slice of this slab, the remaining task is to bound the narrower energy shell, including when the slice is tangent to an energy surface.
  For either sign, every affine hyperplane $H$ meeting the box, every $E' in bb(R)$, and every $s > 0$, we claim
  $ "vol"_H { x in H ∩ \[ - 1 \/ 4 \, 1 \/ 4 \]^d : \| A_plus.minus \( x \) - E' \| lt.eq s #scale(x: 120%, y: 120%)[}] lt.eq C_d s \, $
  where $"vol"_H$ is $\( d - 1 \)$-dimensional volume on $H$. Fix the sign and extend each one-variable summand outside its coordinate interval by its second-order Taylor quadratic at the endpoint. This gives a globally $C^2$ function $f$ with $c I lt.eq nabla^2 f lt.eq C I$, uniformly in $zeta$. On a hyperplane $H$ that meets the box choose $x_0 in H$ in the box. The restriction $f \|_H$ is coercive and uniformly convex, and therefore has a unique minimizer $x_(*)$. If $P_H$ is projection to the direction space of $H$, strong convexity and $P_H nabla f \( x_(*) \) = 0$ give
  $ c \| x_(*) - x_0 \| lt.eq \| P_H nabla f \( x_0 \) \| lt.eq C_d . $
  Consequently $H$ intersected with the box lies in a ball of a fixed radius $R_d$ about $x_(*)$. In polar coordinates in $H$, of dimension $q = d - 1 gt.eq 2$, one has
  $ frac(d, d r) f \( x_(*) + r omega \) gt.eq c r \, #h(2em) frac(r^(q - 1), frac(d, d r) f \( x_(*) + r omega \)) lt.eq C r^(q - 2) lt.eq C_d quad \( 0 < r lt.eq R_d \) . $
  Along each ray the energy is increasing. Changing from $r$ to the energy and integrating an interval of length $2 s$ proves the asserted shell bound, also when the interval contains the minimum. This explicitly includes tangency of the hyperplane to an energy surface; no nonzero-gradient assumption at the constrained minimum is used.
  On each slice of the slab above, apply this shell bound to the narrower of the two energy constraints. Fubini’s theorem and the bounded coordinate Jacobian give joint volume at most
  $ C_d frac(max \( s_1 \, s_2 \) min \( s_1 \, s_2 \), \| zeta \|) = C_d frac(s_1 s_2, \| zeta \|) . $
  Partition each denominator into dyadic sizes $s_i gt.eq c t$, with the innermost bin of size comparable to $t$ and the outermost of fixed size. On a pair of bins the product inverse is at most $C \/ \( s_1 s_2 \)$, while the containing shells have the volume just bounded. There are $O \( log \( 1 \/ t \) \)$ bins for each denominator. Multiplication by $t$ and summation prove (20).
  Uniformly in $zeta$,
  $ parallel nabla \( R R_zeta \) parallel_oo + parallel nabla \( R overline(R_zeta) \) parallel_oo lt.eq C_d t^(- 3) \, #h(2em) R_zeta \( k \) = R \( k + zeta \) . $
  Thus the error in either $t$-weighted product average is at most $epsilon_L$ from (17). These absolute quadrature errors will be used only for product estimates, not to prove the gap at very small nonzero frequencies.
  ===== 3.2.4 Smallness of $K$ and the fourth-power rows. <smallness-of-k-and-the-fourth-power-rows.>
  The absolute-product estimate is small for $\| zeta \| > sqrt(t)$. To control $hat(K)$ also at smaller grid frequencies, use cancellation in the signed product. For $zeta in cal(K)_L$ with $\| zeta \| lt.eq sqrt(t)$, use the elementary identity
  $ frac(1, A B) = integral_0^1 frac(d u, \[ \( 1 - u \) A + u B \]^2) . $
  The two denominators have the same strictly negative imaginary part, so none of the interpolated denominators vanishes. The interpolated dispersion $\( 1 - u \) a \( k \) + u a \( k + zeta \)$ is a cosine sum with shifted phases and amplitudes satisfying
  $ A_j \( u \)^2 = 1 - 4 u \( 1 - u \) sin^2 \( zeta_j \/ 2 \) = 1 - O \( t \) . $
  Lemma 9 bounds the integral of its inverse square by $C log \( 1 \/ t \)$, uniformly in $u$ and $zeta$. Consequently
  $ \| hat(K) \( zeta \) \| lt.eq C t log \( 1 \/ t \) + epsilon_L quad \( \| zeta \| lt.eq sqrt(t) \) . $
  For larger $zeta$, (20) bounds it by $C sqrt(t) log^2 \( 1 \/ t \) + epsilon_L$. These estimates tend to zero uniformly, giving the asserted bound on $parallel K parallel$.
  For the fourth-power row sums, the Parseval identity above and the absolute-product bound give the following estimate. All frequency sums in this calculation are over $cal(K)_L$:
  #[#set math.equation(numbering: n => "(21)")
   $ sum_j \| h_(i j) \|^4 & lt.eq N^(- 1) + C t^2 log^4 \( 1 \/ t \) (N^(- 1) sum_(zeta eq.not 0) \| zeta \|^(- 2)) + C epsilon_L^2\
 & lt.eq N^(- 1) + C t^2 log^4 \( 1 \/ t \) + C epsilon_L^2 . $ <eq:initial-fourth-row>]
  The frequency sum is bounded uniformly by the $d$-dimensional shell count used earlier. Here $N^(- 1) lt.eq C_d t^(20 d)$ and $epsilon_L^2 lt.eq C t^36$; hence the last expression is $o \( t^(1 + delta) \)$, providing the stated fourth-row slack.
  We have obtained a well-defined initial diagonal and the two smallness bounds. It remains to prove the gap of $F$ and identify the resulting inverse form. The gap at the smallest frequencies requires a direct estimate of the finite sum, which we give next.
  ===== 3.2.5 The gap at every grid frequency. <the-gap-at-every-grid-frequency.>
  In this part $zeta in cal(K)_L$. The exact normalization and (19) imply
  #[#set math.equation(numbering: n => "(22)")
   $ 1 - hat(F) \( zeta \) = t / 2 "avg"_k \| R \( k \) - R \( k + zeta \) \|^2 . $ <eq:initial-gap-identity>]
  The dispersion is Lipschitz, so the resolvent identity and $\| R \| lt.eq C \/ t$ give
  $ \| R \( k \) - R \( k + zeta \) \| lt.eq C \| zeta \| thin \| R \( k \) \| thin \| R \( k + zeta \) \| . $
  Bound one factor by $C \/ t$ and use (18) for the other. Since also $\| hat(F) \| lt.eq 1$, this proves
  #[#set math.equation(numbering: n => "(23)")
   $ 1 - hat(F) \( zeta \) lt.eq C min \( 1 \, \| zeta \|^2 \/ t^2 \) . $ <eq:initial-gap-upper>]
  For the lower bound choose a sufficiently small fixed number $zeta_0 > 0$. Suppose $0 < \| zeta \| lt.eq zeta_0$, and put $e = zeta \/ \| zeta \|$ and $alpha = Re z + 2 d in cal(J)_d$. In the coordinates $x_j = 2 sin \( k_j \/ 2 \)$, choose fixed $0 < theta_1 < theta_0$ and a fixed small $c_0 > 0$, and define
  $ P_e & = { k : med \| \| x \( k \) \|^2 - alpha \| lt.eq c_0 t \, quad x \( k \) dot.op e \/ \| x \( k \) \| gt.eq cos theta_0 } \,\
P_e^(-) & = { k : med \| \| x \( k \) \|^2 - alpha \| lt.eq c_0 t \/ 2 \, quad x \( k \) dot.op e \/ \| x \( k \) \| gt.eq cos theta_1 } . $
  All these points are in the bottom coordinate neighborhood. The radii are bounded above by a small constant and below by a positive constant. Writing $x = rho omega$, the derivative identity
  $ nabla a \( k \) dot.op e = 2 sum_j x_j sqrt(1 - x_j^2 \/ 4) thin e_j gt.eq 2 rho cos theta_0 - rho^3 \/ 2 $
  uses $\| sqrt(1 - u) - 1 \| lt.eq u$ and $parallel \( x_j^3 \)_j parallel_2 lt.eq rho^3$. Taking $cos theta_0 gt.eq 3 \/ 4$, and using $rho^2 < 0.02$, proves $nabla a \( k \) dot.op e gt.eq rho gt.eq c_1 > 0$ on $P_e$. The constants are uniform in $e \, alpha$ and $t$. Shrink $zeta_0$ so that the segment from $k$ to $k + zeta$ remains in this small neighborhood. Its Hessian $2 "diag" \( cos k_j \)$ is positive there, so the directional derivative along the segment stays at least $c_1$.
  We next count grid points directly. Polar integration in the $x$ coordinates, with its bounded positive Jacobian, gives
  $ \( 2 pi \)^(- d) \| P_e^(-) \| gt.eq c_d t . $
  The angular margin from $theta_1$ to $theta_0$ is fixed, while the radial energy margin is $c_0 t \/ 2$. Both the coordinate map and its inverse have uniformly bounded derivatives. It follows that $P_e^(-)$ lies at Euclidean distance at least $c_d t$ from the complement of $P_e$: a displacement of size $c_d t$ changes the energy by at most $c_0 t \/ 2$ and the angular coordinate by less than its fixed margin. The mesh-cell diameter is $2 pi sqrt(d) \/ L = o \( t \)$. Associate to each point of $P_e^(-)$ the corner grid point of its mesh cell. For small $t$ that grid point belongs to $P_e$. Each cell has normalized volume $N^(- 1)$, and hence
  #[#set math.equation(numbering: n => "(24)")
   $ N^(- 1) \# \( cal(K)_L ∩ P_e \) gt.eq c_d t . $ <eq:initial-grid-patch-count>]
  This argument is uniform in the direction of $zeta$, including directions that vary with the grid size.
  At each of these points,
  $ \| a \( k + zeta \) - a \( k \) \| gt.eq c \| zeta \| \, #h(2em) \| a \( k \) - z \| lt.eq C t \, #h(2em) \| a \( k + zeta \) - z \| lt.eq C \( t + \| zeta \| \) . $
  Their nonnegative contribution to (22) therefore gives
  #[#set math.equation(numbering: n => "(25)")
   $ 1 - hat(F) \( zeta \) gt.eq c frac(\| zeta \|^2, \( t + \| zeta \| \)^2) \, #h(2em) 0 < \| zeta \| lt.eq zeta_0 . $ <eq:initial-direct-grid-gap>]
  This argument is valid even for $\| zeta \|$ of order $L^(- 1)$: no additive quadrature error has been subtracted from the gap.
  For $\| zeta \| gt.eq zeta_0$, the absolute-product estimate and the grid error give
  $ \| hat(F) \( zeta \) \| lt.eq C t log^2 \( 1 \/ t \) \/ zeta_0 + epsilon_L < 1 \/ 2 $
  when $t$ is small. Combining this with (23) and (25) proves
  #[#set math.equation(numbering: n => "(26)")
   $ 1 - hat(F) \( zeta \) asymp min \( 1 \, \| zeta \|^2 \/ t^2 \) \, #h(2em) zeta eq.not 0 . $ <eq:initial-gap-comparison>]
  ===== 3.2.6 The three inverse-form bounds. <the-three-inverse-form-bounds.>
  Equation (26) and $D = p^2 \( I - F \)$ now show that $D$ has precisely the constants as kernel. Thus, for $zeta in cal(K)_L \\ { 0 }$,
  $ hat(X) \( zeta \) = frac(p^(- 2), 1 - hat(F) \( zeta \)) . $
  The same gap comparison gives
  $ c max \( 1 \, t^2 \/ \| zeta \|^2 \) lt.eq hat(X) \( zeta \) lt.eq C \( 1 + t^2 \/ \| zeta \|^2 \) . $
  Together with (9), this proves the two rough comparisons and the lower bound by $c I$.
  For the sharp upper bound split at $\| zeta \| = sqrt(t)$. Above this scale,
  $ \| hat(F) \( zeta \) \| lt.eq C sqrt(t) log^2 \( 1 \/ t \) + epsilon_L = o \( t^kappa \) . $
  By making the disorder threshold smaller, we obtain $hat(X) \( zeta \) lt.eq \( 1 + t^kappa \) p^(- 2)$ on this range. Below it, $t \/ \| zeta \|^2 gt.eq 1$ and the rough upper bound is at most $C t \/ \| zeta \|^2$. Adding the nonnegative high-frequency term and using (9) proves the last line of (15) with its stated coefficient $1 + t^kappa$.
  All smallness conditions used above hold once $t_(n_0)$ is sufficiently small. Since $t_(n_0) asymp 4^(- n_0)$ uniformly in $m gt.eq 4 n_0$, one choice of $lambda_0 \( d \)$ ensures them all. This completes the construction of the initial state. ◻
]

Proposition 10 supplies every initial comparison constant with fixed slack. Lemma 5 also gives $X asymp W^(*)$ and $D asymp W$ at this state. The subsequent construction transports these forms as sites are duplicated, updated, and eliminated; the weighted cube estimate provides the corresponding local energy control.

== 4 The algebra and estimates of an ordinary sweep <sec:sweep>

An ordinary sweep inserts a potential increment at each active site while decreasing the artificial damping. The physical sites remain active, and the vector $r$ remains frozen, so we must keep the endpoint diagonal error small. The random potential increment is conditionally centered; its nonlinear effect on the resolvent has a small conditional mean, but an individual update need not be small in every useful norm. We therefore estimate a whole family of possible next updates at a fixed prestate. Random ordering will turn these estimates into bounds for one tile in Section 5.

We first explain the change of coordinates that expresses a bit-port deletion as a Schur complement plus an explicit correction. We then control three quantities: the matrix $K$, the Laplacian $D$, and the diagonal self-consistency error. A fourth estimate preserves the row fourth powers needed in all three arguments. Throughout Section 4, $d gt.eq 3$ is fixed, $N = L^d$ with $L = 4^(20 m)$, and constants may depend on $d$ and the broad bounds in Section 2. In particular, they do not depend on the number of ports or on the subset of possible next updates.

All the one-step identities and estimates used below are proved here for the present $d$-dimensional operator. We use the parameters $delta = .01$, $kappa = .005 delta$, and $nu = 10^(- 5) delta \/ d$ of Section 2; $nu$ enters the later geometry, not the one-step algebra.

Self-consistent resolvent equations and fourth-power row estimates as inputs to concentration also appear in #cite(label("BlackDroginHernandez2025")) Sections 1.1–1.2. Here we give explicit one-step estimates for every subset of remaining ports.

=== 4.1 Splitting a site into two ports <splitting-a-site-into-two-ports>

At the beginning of a stage $n < m$ that inserts one digit, put $t = t_n$ and

$ w = frac(3 s_n, 4 t_n) \, #h(2em) theta = 1 - w = t_(n + 1) / t_n . $

For the final residual sweep at $n = m$, take instead $t = t_m = 2 eta$ and $w = theta = 1 \/ 2$. In both cases $theta in \[ 1 \/ 4 \, 5 \/ 8 \]$. The one-step estimates below use only this range and the conditional moment assumptions stated below, so they apply to the final suffix as well as to a single digit.

Start from a committed physical state at a stage boundary satisfying the bounds of Section 2, including $r_i^(upright("phys")) = g_(i i)^(upright("phys"))$. The terminal set stays fixed throughout the sweep. At a numerical prefix, let $M_(upright("cur"))$ be the real Schur matrix with the current real potential values, and let $cal(I)$ be the set of active physical sites whose current sweep increment has already been inserted. The physical inverse represented at that prefix is

#[#set math.equation(numbering: n => "(27)")
 $ g^(upright("phys")) = (M_(upright("cur")) - t "diag" #scale(x: 120%, y: 120%)[\(] \( theta.alt_i r_i^(upright("phys")) \)_(i in A) #scale(x: 120%, y: 120%)[\)])^(- 1) \, #h(2em) theta.alt_i = theta + w upright(bold(1))_({ i in.not cal(I) }) . $ <eq:sweep-physical-prefix>]

Thus an unprocessed site retains the full frozen shift $- t r_i^(upright("phys"))$, whereas a processed site retains $- theta t r_i^(upright("phys"))$. The matrix $M_(upright("cur"))$ records the real potential additions; $r^(upright("phys"))$ does not change. This description applies equally to a committed prefix and to the current provisional prefix of a tile trial.

Represent each active physical site initially by a bit port and a reserve port, with weights $k_(upright("bit")) = w^(1 \/ 4)$ and $k_(upright("res")) = theta^(1 \/ 4)$. The bit port is deleted when that site is processed, and the reserve port remains throughout the sweep. In particular, deleting a bit port does not make its physical site terminal. For the ports remaining above $i$, one has $sum_x k_x^4 = theta.alt_i$. If $x$ is a port above $i$ and $y$ is a port above $j$, define

#[#set math.equation(numbering: n => "(28)")
 $ g_(x y) & = k_x k_y g_(i j)^(upright("phys")) \, & r_x & = k_x^2 r_i^(upright("phys")) \, & p_x & = Im r_x \,\
h & = sqrt(t) thin g \, & K_(x y) & = h_(x y)^2 \, & F_(x y) & = \| h_(x y) \|^2 . $ <eq:sweep-virtual>]

After a deletion these formulas use the new physical inverse and the remaining ports. This virtual $g$ is not an inverse on the duplicated space; its entries are repeated and rescaled physical resolvent entries. Put $q_x = Im g_(x x)$ and $D = "diag" \( p q \) - "diag" \( p \) F "diag" \( p \)$. When $D$ has only the constant kernel, $X = D^(+)$ denotes its inverse form on neutral port charges, as in Section 2.

#thm([Lemma 4.1.])[
  (Port identities).  #emph[For every numerical prefix represented by (27)–(28), the virtual matrices satisfy the Ward identity $h "diag" \( p \) h^(*) = Im g$. Their operator norm obeys $parallel h parallel lt.eq C \/ sqrt(t)$. At the initial duplication, the operator norm of $K$ is unchanged. The boundary fourth-power bound implies that every full fourth-power row sum is at most $3 H_(*) \/ 4$, and every reserve row summed only over reserve columns is at most $theta^2 H_(*)$.]
  #emph[For a potential $f$ on the initial ports, set $macron(f)_i = sum_(x upright(" above ") i) k_x^4 f_x$. Then 
#[#set math.equation(numbering: n => "(29)")
 $ D_0 \( f \) & = D^(upright("phys")) \( macron(f) \) + sum_i \( p_i^(upright("phys")) \)^2 sum_(x upright(" above ") i) k_x^4 \| f_x - macron(f)_i \|^2 \,\
X_0 \( y \) & = X^(upright("phys")) \( y_Sigma \) + sum_x frac(\| y_x \|^2, k_x^4 \( p_i^(upright("phys")) \)^2) - sum_i frac(\| \( y_Sigma \)_i \|^2, \( p_i^(upright("phys")) \)^2) \, $ <eq:sweep-duplicate-energy>]

 where the second identity is for neutral charges and $\( y_Sigma \)_i = sum_(x upright(" above ") i) y_x$. In particular $X_0 asymp W^(*)$ and $D_0 asymp W$, and the sharp stage-start comparison implies 
#[#set math.equation(numbering: n => "(30)")
 $ X_0 lt.eq \( 1 + t^kappa \) "diag" \( p_x^(- 2) \) + C_n t Lambda_Sigma^(+) . $ <eq:sweep-sharp-duplicate>]

]
] <lem:duplication>

#proof[
  Let $V_(x i) = k_x upright(bold(1))_({ x upright(" above ") i })$ on the remaining ports. The physical imaginary damping at $i$ is $t p_i^(upright("phys")) sum_(x upright(" above ") i) k_x^4 gt.eq c t$. Moreover,
  $ V^(*) "diag" \( p_x \) V = "diag" (p_i^(upright("phys")) sum_(x upright(" above ") i) k_x^4) . $
  Applying the physical Ward identity to $g = V g^(upright("phys")) V^top$ proves the virtual one. Since $p gt.eq c$, $c parallel h parallel^2 lt.eq parallel Im h parallel \/ sqrt(t) lt.eq parallel h parallel \/ sqrt(t)$, proving the norm bound.
  At the initial duplication, the matrix $Q_(x i) = k_x^2 upright(bold(1))_({ x upright(" above ") i })$ satisfies $Q^(*) Q = I$, and $K_0 = Q K^(upright("phys")) Q^top$. Also
  $ sum_y \| h_(x y) \|^4 = k_x^4 sum_j \| h_(i j)^(upright("phys")) \|^4 \, $
  because the fourth powers of the two weights over a site sum to one. The stated bounds follow from $max \( w \, theta \) lt.eq 3 \/ 4$; restricting the columns to reserves introduces a further factor $theta$.
  At a stage start, $q_i^(upright("phys")) = p_i^(upright("phys"))$. Expanding the two terms in $D_0$ gives (29). Its dual formula follows by maximizing $2 Re chevron.l y \, f chevron.r - D_0 \( f \)$ separately over the averages $macron(f)$ and the weighted-mean-zero fluctuations above each site. The broad comparison with $W^(*)$, and its dual with $W$, follow from the physical comparisons and the fact that the two weights are bounded away from zero.
  For the sharp bound, retain the exact diagonal cancellation in (29). Weighted Cauchy–Schwarz gives
  $ frac(\| \( y_Sigma \)_i \|^2, \( p_i^(upright("phys")) \)^2) lt.eq sum_(x upright(" above ") i) frac(\| y_x \|^2, k_x^4 \( p_i^(upright("phys")) \)^2) . $
  The coefficient of the diagonal form is therefore exactly $1 + t^kappa$, as claimed. ◻
]

The reserve part of this identity is the target of the sweep. If $y$ is a neutral physical charge, let $y_(upright("res"))$ put that charge on the reserve ports and zero on the bit ports. The exact initial identity is

#[#set math.equation(numbering: n => "(31)")
 $ theta X_0 \( y_(upright("res")) \) = theta X^(upright("phys")) \( y \) + \( 1 - theta \) sum_i frac(\| y_i \|^2, \( p_i^(upright("phys")) \)^2) . $ <eq:sweep-reserve-target>]

If all bit ports have been deleted, the definitions give $h_(upright("cur")) = sqrt(theta t) thin g^(upright(p h y s \, n e w))$ and $p_(upright("cur")) = sqrt(theta) thin p^(upright("phys"))$. When the current Laplacian has only the constant kernel, these scalings give $X^(upright(p h y s \, n e w)) \( y \) = theta X_(upright("cur")) \( y_(upright("res")) \)$. We must therefore keep $X_(upright("cur"))$ close to $X_0$ on the surviving reserves. In the target form (31), an old sharp diagonal coefficient $1 + t^kappa$ becomes $1 + theta t^kappa$. Since $theta^kappa > theta$, this lies below the next coefficient $1 + \( theta t \)^kappa$, leaving room for later errors. The initial reserve-row fourth-power sum, $theta^2 H_(*)$, likewise has strict slack below the cap at the new scale, $\( theta t \)^(1 + delta)$. The estimates below control the corrections that could consume these two margins, as well as the $K$ norm and the diagonal error.

=== 4.2 One deletion and the transported matrices <one-deletion-and-the-transported-matrices>

Let $cal(F)$ denote the retained history just before choosing the next permutation slot, including the numerical prestate and all earlier queries. Conditional on choosing a particular remaining bit port $x$ above a physical site $i$, the real variable $xi_0$ is required to satisfy

#[#set math.equation(numbering: n => "(32)")
 $ bb(E) \( xi_0 divides cal(F) \, x \) = 0 \, #h(2em) bb(E) \( xi_0^2 divides cal(F) \, x \) = t \, #h(2em) \| xi_0 \| lt.eq C sqrt(t) . $ <eq:sweep-digit-moments>]

Deleting $x$ adds the real potential increment $k_x^2 xi_0 = sqrt(w) thin xi_0$ to the partial potential at $i$. It also changes $theta.alt_i$ from $1$ to $theta$ in (27), thereby adding $t w r_i^(upright("phys")) = k_x^2 t r_x$ to the diagonal of the damped matrix. The complete change to that matrix is therefore $k_x^2 \( xi_0 + t r_x \)$. Only the first summand changes the real partial potential; the second removes the bit port’s share of the frozen shift and damping. For an ordinary stage, $xi_0$ is the next true digit, or an auxiliary digit when prescribed, divided by $sqrt(w)$; its physical variance is $s_n - s_(n + 1) = w t$. The expectation symbol in the remainder of Section 4 denotes this conditional expectation whenever the prestate and hypothetical pivot have been fixed. In such statements, “conditioning on the prestate” always includes the full retained history $cal(F)$, not just the matrix entries of the current state. At the final sweep, the untouched true suffix $zeta$ has conditional mean zero, variance $s_m = eta = w t$, and $\| zeta \| lt.eq sqrt(3 eta)$; thus $xi_0 = zeta \/ sqrt(w)$ satisfies (32). We assume neither symmetry nor two-point support in any estimate below. The ordinary query rule is verified in Section 5 using Lemma 4; the conditional law is an input here, and no conclusion conditions on future success of the construction. The Laplacian pivot is strictly positive: by Ward, $q_x - p_x F_(x x) = sum_(y eq.not x) p_y F_(x y)$, and the reserve port at the same site contributes a positive term because the physical diagonal inverse has positive imaginary part.

#thm([Lemma 4.2.])[
  (Single deletion).  #emph[For sufficiently small $t$, suppose $\| g_(x x) \| + \| r_x \| lt.eq C$ and $q_x - p_x F_(x x) > 0$, and let $R$ be the remaining ports other than $x$. With $l = h_(R x)$, 
#[#set math.equation(numbering: n => "(33)")
 $ h' = h_(R R) - gamma l l^top \, #h(2em) gamma = frac(xi_0 + t r_x, sqrt(t) \[ 1 + \( xi_0 + t r_x \) g_(x x) \]) . $ <eq:sweep-single-update>]

 Put $z_x = sqrt(t) \( g_(x x) - r_x \)$ and $a_x = 1 - K_(x x)$. Then 
#[#set math.equation(numbering: n => "(34)")
 $ \| gamma \| lt.eq C \, quad bb(E) gamma = - z_x + O \( t \) \, quad bb(E) gamma^2 = 1 + O \( sqrt(t) \) \, quad bb(E) \| gamma \|^2 = 1 + O \( sqrt(t) \) . $ <eq:sweep-gamma-moments>]

 On the survivor coordinates, 
#[#set math.equation(numbering: n => "(35)")
 $ I - K' & = "Schur"_({ x }) \( I - K \) - J_x \,\
D' & = "Schur"_({ x }) \( D \) + L_x \,\
J_x & = - 2 gamma "diag" \( l \) h_(R R) "diag" \( l \) + \( gamma^2 - a_x^(- 1) \) l^2 \( l^2 \)^top . $ <eq:sweep-j-identity>]

 Here $l^2$ is the entrywise square. The real symmetric Laplacian $L_x$ has survivor edge weights 
#[#set math.equation(numbering: n => "(36)")
 $ p_i p_j [- 2 Re \( gamma macron(h)_(i j) h_(i x) h_(x j) \) + (\| gamma \|^2 - frac(p_x, q_x - p_x F_(x x))) F_(i x) F_(x j)] . $ <eq:sweep-l-formula>]

 The subscript of $"Schur"$ denotes the indices eliminated.]
] <lem:single-update>

#proof[
  Sherman–Morrison on the physical inverse, followed by (28), gives (33). For the moment calculation write $epsilon = sqrt(t)$ and $xi_0 = epsilon xi$. The denominator is $1 + O \( epsilon \)$ uniformly, and
  $ gamma = xi + epsilon \( r_x - g_(x x) xi^2 \) + epsilon^2 \( g_(x x)^2 xi^3 - 2 r_x g_(x x) xi \) + O \( epsilon^3 \) . $
  Now use $bb(E) xi = 0$, $bb(E) xi^2 = 1$ and boundedness of $xi$. No vanishing third moment is needed.
  Entrywise squaring (33) and using the scalar pivot $a_x$ in $I - K$ gives (35)–(35). For $D$, the old edge conductance is $p_i p_j F_(i j)$ and its pivot is $p_x \( q_x - p_x F_(x x) \)$. Eliminating $x$ adds conductance $p_i p_j p_x F_(i x) F_(x j) \/ \( q_x - p_x F_(x x) \)$. Subtracting this from the conductance obtained by expanding $\| h_(i j) - gamma h_(i x) h_(x j) \|^2$ proves (36). ◻
]

Pad $J_x$ and $L_x$ by zero on the deleted coordinate and on all earlier deleted ports. Adding such a survivor-supported matrix commutes with earlier elimination. Writing $E_(upright("del"))$ for the set of deleted ports, induction gives the exact cumulative identities

#[#set math.equation(numbering: n => "(37)")
 $ I - K_(upright("cur")) = "Schur"_(E_(upright("del"))) (I - K_0 - sum J_x) \, #h(2em) D_(upright("cur")) = "Schur"_(E_(upright("del"))) (D_0 + sum L_x) . $ <eq:sweep-cumulative-schur>]

For later use impose the prefix bounds

#[#set math.equation(numbering: n => "(38)")
 $ ∥sum J_x∥ lt.eq t^(.10 delta) \, #h(2em) lr(|sum L_x|) lt.eq t^(.10 delta) D_0 . $ <eq:sweep-global-caps>]

The second bound is a two-sided quadratic-form bound. These caps imply $D_(upright("cur")) \( f \|_(upright("cur")) \) lt.eq C W \( f \)$ for every extension $f$ to the initial ports, and $X_(upright("cur")) = \( 1 + O \( t^(.10 delta) \) \) X_0$ on survivor-supported neutral charges.

They also control $K$, despite the fact that $I - K$ is complex symmetric rather than self-adjoint. Indeed, let $A = I - B$ with $parallel B parallel lt.eq rho < 1$, and write $I - hat(B) = "Schur"_(E_(upright("del"))) A$ on the survivors. The harmonic extension of a survivor vector $v$ to $u$ exists because $parallel B parallel < 1$; it satisfies $u_(upright("cur")) = v$ and $\( A u \)_(upright("deleted")) = 0$. Hence $\( B u \)_(upright("deleted")) = u_(upright("deleted"))$ and $\( B u \)_(upright("cur")) = hat(B) v$, so

$ parallel u_(upright("deleted")) parallel^2 + parallel hat(B) v parallel^2 lt.eq rho^2 \( parallel u_(upright("deleted")) parallel^2 + parallel v parallel^2 \) . $

Consequently $parallel hat(B) parallel lt.eq rho$. Apply this with $B = K_0 + sum J_x$ and $hat(B) = K_(upright("cur"))$.

=== 4.3 Consequences of the prestate caps <consequences-of-the-prestate-caps>

During a sweep set

$ beta = .42 delta \, #h(2em) P = \( I - K \)^(- 1) \, #h(2em) z = sqrt(t) \( g_(upright("diag")) - r \) \, #h(2em) U = P z \, #h(2em) tilde(U) = U \/ sqrt(t) . $

We call $g_(upright("diag")) - r$ the raw diagonal error and $tilde(U) = P \( g_(upright("diag")) - r \)$ its transformed lag. On the current ports their exact relation is

$ g_(upright("diag")) - r = \( I - K \) tilde(U) . $

On the virtual space we use this algebraic identity. Comparing the equation $\( I - K \) U = z$ before and after a deletion will combine the diagonal change with the Schur change of $I - K$. Lemma 16 uses the cancellation $bb(E) gamma = - z_x + O \( t \)$ in that combined equation to control the transformed lag. At the start $U = 0$ by the physical fixed-point relation.

In addition to (38), the prestate caps are

#[#set math.equation(numbering: n => "(39)")
 $ max_i sum_j F_(i j)^2 lt.eq H_(*) = t^(1 + delta) \, #h(2em) parallel tilde(U) parallel_oo lt.eq t^beta . $ <eq:sweep-row-lag-caps>]

The frozen $r$ has bounded modulus and its imaginary part lies between fixed positive constants. There are at least $N \/ 2$ active physical sites. The local stopping rule will retain an update only when the two displays of mutable caps hold at its prestate; the stage induction supplies the fixed bounds on $r \, p$ and the active-site count.

#thm([Lemma 4.3.])[
  (Analytic prestate bounds).  #emph[Suppose the initial physical state satisfies the bounds at a stage boundary in Section 2, including self-consistency, and is duplicated as in Lemma 11. Suppose its current numerical prefix satisfies (38)–(39), the broad bounds on the frozen $r \, p$, and the active-site count above. Then 
#[#set math.equation(numbering: n => "(40)")
 $ \| g_(i i) - r_i \| lt.eq C t^beta \, quad q_i = p_i + O \( t^beta \) \, quad sum_j F_(i j) lt.eq C \, quad \| h_(i i) \| lt.eq C sqrt(t) \,\
T_(*)^2 := max_i parallel "diag" \( h_i \) h parallel^2 lt.eq C sqrt(H_(*) \/ t) = C t^(delta \/ 2) \,\
\( F^3 \)_(i i) lt.eq C t^kappa H_(*) . $ <eq:sweep-broad>]

 The bounds hold uniformly for every current set of remaining ports.]
] <lem:sweep-prestate>

#proof[
  Since $z = \( I - K \) U$ and $F p = q$,
  $ \| g_(i i) - r_i \| lt.eq t^beta (1 + frac(q_i, min_j p_j)) . $
  Taking imaginary parts first bounds $q_i$ for small $t$; substituting back proves (40).
  For (40), Ward gives
  $ "diag" \( h_i \) h h^(*) "diag" \( macron(h)_i \) lt.eq C t^(- 1 \/ 2) "diag" \( h_i \) \( Im h \) "diag" \( macron(h)_i \) . $
  Apply the weighted Schur test to the matrix on the right using weights $\| h_(i j) \|$, omitting its zero rows and columns. Its weighted absolute row quotient is at most
  $ sum_k \| h_(j k) \| F_(i k) lt.eq (sum_k F_(j k))^(1 \/ 2) (sum_k F_(i k)^2)^(1 \/ 2) lt.eq C sqrt(H_(*)) . $
  This proves the operator estimate.
  To prove (40), put $M = "diag" \( p q \)$, fix $i$, and define
  $ f_j = F_(i j) / p_j \, #h(2em) macron(m) = frac(sum_j M_(j j) f_j, "Tr" M) \, #h(2em) y = M \( f - macron(m) upright(bold(1)) \) . $
  The charge $y$ is neutral. The variational formula for $X$ gives
  $ X \( y \) gt.eq 2 chevron.l y \, f chevron.r - D \( f \) = f^top M f - 2 macron(m)^2 "Tr" M + \( F^3 \)_(i i) . $
  On the other hand, (30), Schur duality, and the lower half of (38) imply
  $ X lt.eq \( 1 + C t^kappa \) M^(- 1) + C t Lambda_Sigma^(+) . $
  Here we used $p_j^(- 2) = \( q_j \/ p_j \) M_(j j)^(- 1)$ and $q_j \/ p_j = 1 + O \( t^beta \)$; both $beta$ and $.10 delta$ exceed $kappa$. Since
  $ y^top M^(- 1) y = f^top M f - macron(m)^2 "Tr" M \, $
  comparison yields
  $ \( F^3 \)_(i i) lt.eq C t^kappa f^top M f + C macron(m)^2 "Tr" M + C t Lambda^(+) \( y_Sigma \) . $
  The row bounds and the active-site count give
  $ f^top M f lt.eq C H_(*) \, #h(2em) parallel y parallel_2^2 lt.eq C H_(*) \, #h(2em) parallel y parallel_1 lt.eq C \, #h(2em) macron(m)^2 "Tr" M lt.eq C \/ N . $
  For example, the numerator in the last expression is $\( sum_j q_j F_(i j) \)^2 lt.eq C$, whereas $"Tr" M gt.eq c N$. Lemma 6 now gives
  $ \( F^3 \)_(i i) lt.eq C \( t^kappa H_(*) + t H_(*)^(1 \/ 3) + N^(- 1) \) . $
  The exponent difference $1 / 3 - frac(2 delta, 3) - kappa$ is positive, and $N^(- 1) = 4^(- 20 d m) lt.eq C_d t^(1 + delta + kappa)$ for $n lt.eq m$. This proves (40). ◻
]

The small factor in (40) is the extra information provided by the sharp inverse-form comparison. Bounded row sums alone would not preserve the fourth-power cap. We next show how these prestate bounds control an arbitrary family of possible next deletions.

=== 4.4 The correction to $K$ <the-correction-to-k>

Fix one prestate satisfying Lemma 13, and let $cal(B)$ be any prestate-measurable subset of its remaining bit ports. For each $x in cal(B)$, all matrices in the following estimates are evaluated at this same prestate; only its hypothetical fresh scalar $xi_(0 \, x)$ varies. There is no requirement that the hypothetical outcomes be mutually independent. Every subset and tracked column set below is fixed by the prestate. All increments are padded by zero at their pivot.

#thm([Lemma 4.4.])[
  (Means and operator squares for $J$).  #emph[For every such subset $cal(B)$, 
#[#set math.equation(numbering: n => "(41)")
 $ ∥sum_(x in cal(B)) bb(E) J_x∥ lt.eq C t^beta . $ <eq:sweep-j-mean>]

 For every collection of allowable hypothetical outcomes and every vector $u$, 
#[#set math.equation(numbering: n => "(42)")
 $ sum_(x in cal(B)) parallel J_x u parallel^2 + sum_(x in cal(B)) parallel J_x^(*) u parallel^2 lt.eq C t^(delta \/ 2) parallel u parallel^2 . $ <eq:sweep-j-stack>]

 In particular $parallel J_x parallel lt.eq C t^(delta \/ 4)$.]
] <lem:sweep-j>

#proof[
  Extend $mu_x = bb(E) gamma_x$ by zero outside $cal(B)$. The moment and lag bounds give $parallel mu parallel_oo lt.eq C sqrt(t) thin t^beta$. If the omitted pivot rows and columns are restored temporarily, the sum of the linear means in (35) is $- 2 h compose \( h "diag" \( mu \) h \)$. Its absolute row sum is at most
  $ 2 parallel h_i parallel_2 parallel \( h "diag" \( mu \) h \)_i parallel_2 lt.eq C parallel h parallel parallel mu parallel_oo lt.eq C t^beta . $
  Terms incorrectly restored with $x = i$ or $x = j$ have magnitude at most $C t F_(i j)$ and hence total row and column sums $O \( t \)$. For the quadratic mean, $\| bb(E) gamma_x^2 - a_x^(- 1) \| lt.eq C sqrt(t)$; its absolute row sum is bounded by $C sqrt(t) sum_x F_(i x) sum_j F_(x j) lt.eq C sqrt(t)$. Symmetry and the Schur test prove (41).
  For the linear square bound, fix an output $i$ and put $v_j = h_(i j) u_j$. Restoring the omitted inner index $j = x$ gives
  $ sum_x lr(|h_(i x) sum_j h_(x j) v_j|)^2 lt.eq T_(*)^2 sum_j F_(i j) \| u_j \|^2 . $
  The restored term equals $h_(x x) h_(i x)^2 u_x$; its squared sum over $i \, x$ is at most $C t H_(*) parallel u parallel^2$. Deleting the output $i = x$ can only decrease these estimates. Sum over $i$ and use the bounded column sums of $F$ to obtain $C \( T_(*)^2 + t H_(*) \) parallel u parallel^2$. The realized scalar $gamma_x$ is bounded, so the same estimate applies to the linear part of $J_x$.
  For its quadratic part,
  $ parallel l^2 \( l^2 \)^top u parallel^2 lt.eq H_(*) \| \( K u \)_x - K_(x x) u_x \|^2 . $
  Summation over $x$ gives $C H_(*) parallel u parallel^2$ because $parallel K parallel$ is bounded. The quadratic coefficient is uniformly bounded. Combining these estimates proves the first stack in (42). Every $J_x$ is complex symmetric, so applying the same bound to $macron(u)$ proves the adjoint stack. ◻
]

=== 4.5 The Laplacian increment <the-laplacian-increment>

We next control the change in the energy form. The estimates must hold when the next pivot is chosen from an arbitrary subset of the remaining bit ports. We prove a relative bound for the sum of the conditional means and two bounds for the sum of the squared output norms. The latter combine to give the dual norm needed for the local concentration argument.

#thm([Lemma 4.5.])[
  (Laplacian increment estimates).  #emph[Fix a valid prestate as in Lemma 13, with current port set $V$, and let $S$ be any subset of its remaining bit ports. For each $x in S$, let $L_x$ be the Laplacian increment of Lemma 12, padded by zero in row and column $x$. The conditional expectation for this increment is over its fresh scalar update, with the prestate and the choice of $x$ fixed. Then, with $beta = .42 delta$, 
#[#set math.equation(numbering: n => "(43)")
 $ lr(|sum_(x in S) bb(E) L_x|) lt.eq C t^beta D $ <eq:sweep-laplacian-mean>]

 as real quadratic forms on $V$. For every common real potential $f in bb(R)^V$, and for arbitrary choices of the scalar outcomes at the hypothetical pivots $x in S$, 
#[#set math.equation(numbering: n => "(44)")
 $ sum_(x in S) parallel L_x f parallel_2^2 & lt.eq C t^(delta \/ 2) D \( f \) \, & sum_(x in S) parallel L_x f parallel_1^2 & lt.eq C t^(- 1) D \( f \) \,\
sum_(x in S) W^(*) \( L_x f \) & lt.eq C t^(delta \/ 2) D \( f \) . $ <eq:sweep-laplacian-stacks>]

 The outputs are neutral; in the last display they may equivalently be padded by zero to the initial ports of the sweep.]
] <lem:sweep-laplacian>

#proof[
  All matrices and coefficients below are evaluated at the fixed prestate. In particular, the values of $f$ do not depend on the hypothetical pivot. The zero-padded operator $L_x$ uses $f \|_(V \\ { x })$ and has zero output at $x$. Whenever we split a difference through $x$, we use the value $f_x$ of this same common potential.
  Write $d_(i j) f = f_i - f_j$. The uniform bounds on $p$ give
  #[#set math.equation(numbering: n => "(45)")
   $ cal(E) \( f \) := sum_(i \, j in V) F_(i j) \( d_(i j) f \)^2 asymp D \( f \) = 1 / 2 sum_(i \, j in V) p_i p_j F_(i j) \( d_(i j) f \)^2 . $ <eq:sweep-laplacian-unweighted-energy>]
  For brevity put
  $ c_x = frac(p_x, q_x - p_x F_(x x)) \, #h(2em) rho_x = \| gamma_x \|^2 - c_x \, #h(2em) mu_x = bb(E) gamma_x . $
  The prestate bounds and Lemma 12 imply
  #[#set math.equation(numbering: n => "(46)")
   $ \| gamma_x \| + \| rho_x \| lt.eq C \, #h(2em) \| mu_x \| lt.eq C sqrt(t) thin t^beta \, #h(2em) \| bb(E) rho_x \| lt.eq C t^beta . $ <eq:sweep-laplacian-coefficients>]
  Indeed, $q_x = p_x + O \( t^beta \)$, $F_(x x) = O \( t \)$, and hence $c_x = 1 + O \( t^beta + t \)$. The scalar moment bounds give $bb(E) \| gamma_x \|^2 = 1 + O \( sqrt(t) \)$ and $mu_x = - sqrt(t) \( g_(x x) - r_x \) + O \( t \)$. Since $beta < 1 \/ 2$, these imply (46).
  Decompose $L_x = L_x^(\( 1 \)) + L_x^(\( 2 \))$ according to its survivor edge weights
  #[#set math.equation(numbering: n => "(47)")
   $ p_i p_j [- 2 Re #h(-0.16667em) (gamma_x overline(h_(i j)) h_(i x) h_(x j)) + rho_x F_(i x) F_(x j)] \, #h(2em) i \, j eq.not x . $ <eq:sweep-laplacian-edge-split>]
  Both parts are real symmetric Laplacians; their edge weights may have either sign.
  ===== 4.5.1 The sum of the means. <the-sum-of-the-means.>
  Let
  $ M_mu = "diag" \( mu_x upright(bold(1))_({ x in S }) \)_(x in V) \, #h(2em) H_mu = h M_mu h \, #h(2em) P_p = "diag" \( p \) \, $
  and retain the endpoint weights by introducing
  $ H_p = P_p^(1 \/ 2) h P_p^(1 \/ 2) \, #h(2em) A_p = P_p^(1 \/ 2) H_mu P_p^(1 \/ 2) = H_p "diag" \( mu_x upright(bold(1))_({ x in S }) \/ p_x \) H_p . $
  First include all intermediate indices $x in S$, also when $x = i$ or $x = j$, in the linear mean. Its quadratic form becomes
  $ - Re sum_(i \, j) p_i p_j overline(h_(i j)) \( H_mu \)_(i j) \( d_(i j) f \)^2 . $
  Writing $M_f = "diag" \( f \)$ and using $chevron.l A \, B chevron.r_(upright("HS")) = "Tr" \( A^(*) B \)$, this is exactly
  $ - Re chevron.l \[ M_f \, H_p \] \, \[ M_f \, A_p \] chevron.r_(upright("HS")) \, #h(2em) D \( f \) = 1 / 2 parallel \[ M_f \, H_p \] parallel_(upright("HS"))^2 . $
  The diagonal matrix $M_f$ commutes with $C_mu = "diag" \( mu_x upright(bold(1))_({ x in S }) \/ p_x \)$. Therefore
  $ \[ M_f \, A_p \] = \[ M_f \, H_p \] C_mu H_p + H_p C_mu \[ M_f \, H_p \] \, $
  and the ideal property of the Hilbert–Schmidt norm gives
  $ parallel \[ M_f \, A_p \] parallel_(upright("HS")) lt.eq 2 parallel H_p parallel parallel C_mu parallel parallel \[ M_f \, H_p \] parallel_(upright("HS")) . $
  Since $p$ is bounded above and below, $parallel H_p parallel lt.eq C t^(- 1 \/ 2)$ and $parallel C_mu parallel lt.eq C sqrt(t) thin t^beta$. Cauchy–Schwarz in the exact pairing thus bounds its absolute value by $C t^beta D \( f \)$. In particular this is a signed cancellation with the actual $p_i p_j$ weights retained; no regularity or constancy of $p$ has been used. For an edge $i j$, removing the intermediate index $x = i$, if $i in S$, costs at most
  $ C \| mu_i h_(i i) \| F_(i j) lt.eq C t^(1 + beta) F_(i j) . $
  The removal of $x = j$ has the same bound. Summing these edgewise errors costs at most $C t^(1 + beta) D \( f \)$.
  The quadratic mean has absolute form bounded by
  $ C t^beta sum_(x in S) sum_(i \, j) F_(i x) F_(x j) \( d_(i j) f \)^2 . $
  Use
  $ \( d_(i j) f \)^2 lt.eq 2 \( d_(i x) f \)^2 + 2 \( d_(x j) f \)^2 $
  and the bounded row and column sums of the symmetric matrix $F$. After extending the $x$-sum to $V$, the last expression is at most $C t^beta cal(E) \( f \)$. This proves (43) for every subset $S$.
  ===== 4.5.2 The linear output stacks. <the-linear-output-stacks.>
  For each $i in V$, define the complex vector
  $ u_j^i = p_j overline(h_(i j)) \( f_i - f_j \) . $
  The reality of $f$ allows the real part in (47) to be taken after summing over $j$. Therefore, for $i eq.not x$,
  #[#set math.equation(numbering: n => "(48)")
   $ \| \( L_x^(\( 1 \)) f \)_i \| lt.eq C \| h_(i x) \| lr(|sum_(j eq.not x) h_(x j) u_j^i|) . $ <eq:sweep-laplacian-linear-output>]
  Moreover,
  $ sum_i parallel u^i parallel_2^2 lt.eq C cal(E) \( f \) lt.eq C D \( f \) . $
  Temporarily include $j = x$ in (48). The bound of Lemma 13,
  $ max_i parallel "diag" \( h_i \) h parallel^2 lt.eq C sqrt(H_(*) \/ t) = C t^(delta \/ 2) \, $
  gives
  #[#set math.equation(numbering: n => "(49)")
   $ sum_(x in S) sum_i \| h_(i x) \( h u^i \)_x \|^2 lt.eq sum_i parallel "diag" \( h_i \) h u^i parallel_2^2 lt.eq C t^(delta \/ 2) D \( f \) . $ <eq:sweep-laplacian-linear-two>]
  For the squared $ell^1$ norms, first apply Cauchy–Schwarz in $i$:
  $ sum_(x in S) (sum_i \| h_(i x) \( h u^i \)_x \|)^2 & lt.eq sum_x (sum_i F_(i x)) sum_i \| \( h u^i \)_x \|^2\
 & lt.eq C sum_i parallel h u^i parallel_2^2 lt.eq C t^(- 1) D \( f \) . $
  It remains to remove the artificially included $j = x$ terms. Their absolute values are at most
  $ C \| h_(x x) \| F_(i x) \| d_(i x) f \| lt.eq C sqrt(t) thin F_(i x) \| d_(i x) f \| . $
  Their squared $ell^2$ stack is bounded by
  $ C t sum_(i \, x) F_(i x)^2 \( d_(i x) f \)^2 lt.eq C t thin max_(i \, j) F_(i j) thin cal(E) \( f \) \, $
  and their squared $ell^1$ stack is bounded by
  $ C t sum_x (sum_i F_(i x) \| d_(i x) f \|)^2 lt.eq C t cal(E) \( f \) . $
  These are absorbed in the preceding bounds, since $max F lt.eq sqrt(H_(*))$. Dropping the output $i = x$ only reduces the majorants. This proves both required stacks for $L_x^(\( 1 \))$.
  ===== 4.5.3 The quadratic output stacks. <the-quadratic-output-stacks.>
  Put $epsilon = max_(i \, j) F_(i j) lt.eq sqrt(H_(*))$. By (46), the absolute output is bounded by a constant times
  $ Q_(x i) := F_(i x) sum_j F_(x j) \| d_(i j) f \| . $
  Here we have included all omitted indices, which only increases the nonnegative majorant. Cauchy–Schwarz in $j$, followed by splitting differences at $x$, gives
  $ sum_(x \, i) Q_(x i)^2 & lt.eq C sum_(x \, i \, j) F_(i x)^2 F_(x j) \( d_(i j) f \)^2\
 & lt.eq C sum_(x \, i) F_(i x)^2 \( d_(i x) f \)^2 + C sum_(x \, j) (sum_i F_(i x)^2) F_(x j) \( d_(x j) f \)^2\
 & lt.eq C epsilon cal(E) \( f \) . $
  In the last step we used $sum_i F_(i x)^2 lt.eq epsilon sum_i F_(i x) lt.eq C epsilon$. For the other stack, the total mass $sum_(i \, j) F_(i x) F_(x j)$ is bounded uniformly in $x$, so
  $ sum_x (sum_i Q_(x i))^2 & lt.eq C sum_(x \, i \, j) F_(i x) F_(x j) \( d_(i j) f \)^2\
 & lt.eq C cal(E) \( f \) . $
  Both estimates remain true with the $x$-sum restricted to $S$. Since $sqrt(H_(*)) lt.eq t^(delta \/ 2)$, combining the linear and quadratic bounds proves (44). No factor depending on the number of candidate pivots has been used.
  ===== 4.5.4 The dual norm stack. <the-dual-norm-stack.>
  The Laplacian property implies that every $y_x = L_x f$ is neutral. Lemma 6, including its version for at most two ports per site, gives
  $ W^(*) \( y_x \) lt.eq parallel y_x parallel_2^2 + C b parallel y_x parallel_1^(4 \/ 3) parallel y_x parallel_2^(2 \/ 3) . $
  Hölder’s inequality over $x$, followed by (44) and $b lt.eq t$, yields
  $ sum_(x in S) W^(*) \( L_x f \) & lt.eq C t^(delta \/ 2) D \( f \) + C b (sum_x parallel L_x f parallel_1^2)^(2 \/ 3) (sum_x parallel L_x f parallel_2^2)^(1 \/ 3)\
 & lt.eq C #scale(x: 120%, y: 120%)[\(] t^(delta \/ 2) + t^(1 \/ 3 + delta \/ 6) #scale(x: 120%, y: 120%)[\)] D \( f \) lt.eq C t^(delta \/ 2) D \( f \) . $
  The last inequality uses $1 \/ 3 + delta \/ 6 > delta \/ 2$. This proves (44). ◻
]

=== 4.6 The transformed diagonal lag <the-transformed-diagonal-lag>

The next estimate controls increments of the transformed lag $tilde(U) = \( I - K \)^(- 1) \( g_(upright("diag")) - r \)$. Its cap yields a small raw diagonal error through Lemma 13, preserving the small conditional means used in the preceding increment bounds. For brevity write $u = tilde(U)$ in this subsection. At a deletion, we freeze the removed coordinate of $u$, and continue to update its surviving coordinates. In particular, the increment is zero at the deleted coordinate.

Fix the prestate and let $V$ be its set of ports. For a prestate-measurable subset $S subset.eq V$ of eligible bit ports, an array $Y = \( Y_i^x \)$ has row index $i in V$ and hypothetical deletion index $x in S$. Define

$ A_j \( Y \) = max_(i in V) (sum_(x in S) \| Y_i^x \|^j)^(1 \/ j) \, #h(2em) j = 1 \, 2 . $

Every survivor vector associated with deletion $x$ is extended by zero at coordinate $x$. This convention is used throughout this subsection.

#thm([Lemma 4.6.])[
  (Increments of the transformed lag).  #emph[Let $t > 0$ be sufficiently small, $beta = .42 delta$, and $H_(*) = t^(1 + delta)$. At a fixed prestate, suppose that $h = h^top$, $g = h \/ sqrt(t)$, $K_(i j) = h_(i j)^2$, $F_(i j) = \| h_(i j) \|^2$, and 
#[#set math.equation(numbering: n => "(50)")
 $ max_i sum_j F_(i j) lt.eq C \, #h(2em) max_i sum_j F_(i j)^2 lt.eq H_(*) \, #h(2em) parallel h parallel lt.eq C t^(- 1 \/ 2) \, #h(2em) max_i \| h_(i i) \| lt.eq C sqrt(t) \,\
T_(*) := max_i parallel "diag" \( h_(i j) \)_j h parallel lt.eq C t^(delta \/ 4) \, #h(2em) parallel r parallel_oo lt.eq C \, #h(2em) parallel u parallel_oo lt.eq t^beta . $ <eq:sweep-lag-prestate>]

 Here $u = P \( g_(upright("diag")) - r \)$. Assume also that $P = \( I - K \)^(- 1)$ exists and that 
$ L_P = max (1 \, max_i sum_j \| P_(i j) \|) \, #h(2em) L_P lt.eq C log \( 1 \/ t \) . $

 For each $x$ in any prestate-measurable subset $S$ of eligible bit ports, perform the update of Lemma 12 with a conditionally centered variable $xi_(0 \, x)$ satisfying 
$ bb(E) \( xi_(0 \, x)^2 divides upright("prestate") \) = t \, #h(2em) \| xi_(0 \, x) \| lt.eq C sqrt(t) . $

 Write $Delta u^x$ for the resulting lag increment, padded by zero at $x$. Then, uniformly over $S$ and over all hypothetical outcomes, 
$ A_2 \( Delta u \) lt.eq C L_P t^(delta \/ 2) . $

 Moreover, with all expectations conditional on the prestate, 
$ max_i lr(|sum_(x in S) bb(E) Delta u_i^x|) lt.eq C [L_P \( t^(2 beta) + sqrt(t) \) + L_P^2 t^(delta \/ 2)] . $

 The constants are independent of the number of ports and of $S$.]
] <lem:sweep-lag>

The row and operator bounds in the statement are supplied by Lemma 13. The absolute row-sum bound for $P$ is proved in Lemma 20; the present argument uses precisely that displayed bound. We give the details of the survivor restrictions and of the nonlinear remainder, since both affect the conditional mean.

#proof[
  All matrices without a prime are fixed at the prestate. Expectations in the proof are conditional on that prestate. Set
  $ R_F = max_i sum_j F_(i j) \, #h(2em) M_F = max_(i \, j) F_(i j) lt.eq sqrt(H_(*)) . $
  Thus $R_F lt.eq C$. For a hypothetical deletion $x$, write
  $ R_x = V \\ { x } \, #h(2em) l^x = \( h_(i x) \)_(i in R_x) \, #h(2em) k^x = \( \( h_(i x) \)^2 \)_(i in R_x) \, #h(2em) a_x = 1 - K_(x x) . $
  The diagonal bound gives $a_x = 1 + O \( t \)$, so $a_x$ is bounded away from zero. Lemma 12 gives
  $ gamma_x = frac(xi_(0 \, x) + t r_x, sqrt(t) thin \[ 1 + \( xi_(0 \, x) + t r_x \) g_(x x) \]) \, $
  $ J_x = - 2 gamma_x "diag" \( l^x \) h_(R_x R_x) "diag" \( l^x \) + \( gamma_x^2 - a_x^(- 1) \) k^x \( k^x \)^top . $
  ===== 4.6.1 The exact equation. <the-exact-equation.>
  Let $B_x = "Schur"_({ x }) \( I - K \)$. In the block decomposition with deleted coordinate $x$, the off-diagonal column of $I - K$ is $- k^x$. Eliminating $U_x$ from $\( I - K \) U = z$ therefore gives
  $ B_x U_(R_x) = z_(R_x) + k^x z_x \/ a_x . $
  On the other hand, the update gives
  $ I - K' = B_x - J_x \, #h(2em) z'_(R_x) = z_(R_x) - gamma_x k^x . $
  Subtracting the two equations yields
  $ \( B_x - J_x \) Delta U_(R_x) = - \( gamma_x + z_x \/ a_x \) k^x + J_x U_(R_x) = : Z^x . $
  Since $B_x^(- 1) = P_(R_x R_x)$,
  #[#set math.equation(numbering: n => "(51)")
   $ Delta U_(R_x) = \( I - P_(R_x R_x) J_x \)^(- 1) P_(R_x R_x) Z^x . $ <eq:sweep-lag-exact>]
  The inverse in this formula will also follow from the convergent series below.
  ===== 4.6.2 Moments and the forcing array. <moments-and-the-forcing-array.>
  The identity $g_(i i) - r_i = \[ \( I - K \) u \]_i$ and the row-sum bound imply $\| g_(i i) - r_i \| lt.eq C t^beta$. Expanding the denominator of $gamma_x$ using $\| xi_(0 \, x) + t r_x \| lt.eq C sqrt(t)$, centering, and variance $t$, gives
  $ mu_x := bb(E) gamma_x = - z_x + O \( t \) \, #h(2em) bb(E) gamma_x^2 = 1 + O \( sqrt(t) \) . $
  In particular,
  #[#set math.equation(numbering: n => "(52)")
   $ max_x \| mu_x \| lt.eq C sqrt(t) thin t^beta \, #h(2em) bb(E) gamma_x + z_x \/ a_x = O \( t \) \, #h(2em) nu_x := bb(E) gamma_x^2 - a_x^(- 1) = O \( sqrt(t) \) \,\
\| gamma_x \| + \| gamma_x^2 - a_x^(- 1) \| lt.eq C . $ <eq:sweep-lag-moments>]
  For the middle estimate, the extra term is $z_x \( a_x^(- 1) - 1 \) = O \( t^(3 \/ 2 + beta) \)$.
  Put $Y^x = Z^x \/ sqrt(t)$. Its direct forcing satisfies
  $ A_2 (- frac(gamma_x + z_x \/ a_x, sqrt(t)) k^x) lt.eq C sqrt(H_(*) \/ t) = C t^(delta \/ 2) . $
  The linear part of $J_x u_(R_x)$, apart from its bounded coefficient, is
  $ h_(i x) sum_(j eq.not x) h_(i j) h_(x j) u_j . $
  For fixed $i$, restore the term $j = x$ and set $D_i = "diag" \( h_(i j) \)_j$. The resulting vector indexed by $x$ is $D_i h D_i u$, of norm at most
  $ parallel D_i h parallel thin parallel D_i u parallel_2 lt.eq C T_(*) t^beta . $
  The restored term $h_(i x)^2 h_(x x) u_x$ has $ell_x^2$-norm at most $C sqrt(t) sqrt(H_(*)) thin t^beta$. Removing the output $x = i$ only reduces this norm. The quadratic part is bounded by
  $ lr(|h_(i x)^2 sum_(j eq.not x) h_(x j)^2 u_j|) lt.eq R_F t^beta F_(i x) \, $
  and hence has $A_2$-norm at most $C t^beta sqrt(H_(*))$. Consequently,
  #[#set math.equation(numbering: n => "(53)")
   $ A_2 \( Y \) & lt.eq C (t^(delta \/ 2) + t^(beta + delta \/ 4) + t^beta sqrt(t H_(*)) + t^beta sqrt(H_(*)))\
 & lt.eq C t^(delta \/ 2) \, $ <eq:sweep-lag-forcing-square>]
  because $beta + delta \/ 4 = .67 delta > .50 delta$.
  For the summed mean, the direct forcing costs at most $C sqrt(t) sum_x F_(i x) lt.eq C sqrt(t)$. Extend $mu_x$ by zero off $S$. Before the survivor omissions, the summed linear part of $bb(E) J_x$ is $- 2 h compose \( h "diag" \( mu \) h \)$. Its absolute row sum is bounded by
  $ sum_j \| h_(i j) \| thin \| \( h "diag" \( mu \) h \)_(i j) \| & lt.eq parallel h_i parallel_2 thin parallel \( h "diag" \( mu \) h \)_i parallel_2\
 & lt.eq C parallel h parallel thin parallel mu parallel_oo lt.eq C t^beta . $
  Contracting against $u$ contributes another factor $t^beta$. Each omitted set $x = i$ or $j = x$ costs at most
  $ C parallel mu parallel_oo sqrt(t) thin R_F parallel u parallel_oo \, $
  and their intersection satisfies the same bound. For the quadratic part, $\| nu_x \| lt.eq C sqrt(t)$, while
  $ sum_x F_(i x) sum_j F_(x j) \| u_j \| lt.eq R_F^2 t^beta . $
  Its survivor omissions decrease this absolute bound. We have proved
  #[#set math.equation(numbering: n => "(54)")
   $ M_0 := max_i lr(|sum_(x in S) bb(E) Y_i^x|) lt.eq C \( t^(2 beta) + sqrt(t) \) . $ <eq:sweep-lag-forcing-mean>]
  This estimate controls the signed sum of the conditional means; it does not assert an $A_1$ bound on the forcing itself.
  ===== 4.6.3 The restricted inverse. <the-restricted-inverse.>
  Let $M_x = I - e_x e_x^(*)$, and define $Q^x = M_x P M_x$. Since $Y_x^x = 0$, the padded vector $P_(R_x R_x) Y^x$ equals $Q^x Y^x = M_x P Y^x$. For an array $W$, write $\( Q W \)^x = Q^x W^x$. Minkowski’s inequality gives
  #[#set math.equation(numbering: n => "(55)")
   $ A_j \( Q W \) lt.eq L_P A_j \( W \) \, #h(2em) j = 1 \, 2 . $ <eq:sweep-lag-inverse-arrays>]
  For means, the output mask depends on the deletion index. Precisely,
  $ sum_(x in S) bb(E) \( Q^x Y^x \)_i = (P sum_(x in S) bb(E) Y^x)_i - bold(1)_({ i in S }) \( P bb(E) Y^i \)_i . $
  For every hypothetical outcome, (53) gives $A_2 \( Y \) lt.eq C t^(delta \/ 2)$. Jensen’s inequality therefore bounds the second term by $C L_P t^(delta \/ 2)$. Thus
  #[#set math.equation(numbering: n => "(56)")
   $ max_i lr(|sum_x bb(E) \( Q^x Y^x \)_i|) lt.eq L_P M_0 + C L_P t^(delta \/ 2) . $ <eq:sweep-lag-mask>]
  ===== 4.6.4 Two array bounds for the correction. <two-array-bounds-for-the-correction.>
  We next control repeated applications of the random matrices $J_x$. The bounds below are pathwise and apply to any array $W$, including one depending on the same outcomes as $J_x$. Write $A_2 \( W \) = A_W$. Up to uniformly bounded coefficients, the linear and quadratic outputs are
  $ cal(L)_i^x = h_(i x) sum_(j eq.not x) h_(i j) h_(x j) W_j^x \, #h(2em) cal(Q)_i^x = h_(i x)^2 sum_(j eq.not x) h_(x j)^2 W_j^x . $
  Both are set to zero when $i = x$. Cauchy–Schwarz in $j$ gives
  $ sum_x \| cal(L)_i^x \|^2 lt.eq R_F sum_(x \, j) F_(i x) F_(i j) \| W_j^x \|^2 lt.eq R_F^2 M_F A_W^2 . $
  Also $\| W_j^x \| lt.eq A_W$, so
  $ \| cal(Q)_i^x \| lt.eq R_F A_W F_(i x) \, #h(2em) sum_x \| cal(Q)_i^x \|^2 lt.eq R_F^2 H_(*) A_W^2 . $
  Writing $\( J W \)^x = J_x W^x$, we obtain
  #[#set math.equation(numbering: n => "(57)")
   $ A_2 \( J W \) lt.eq C \( M_F^(1 \/ 2) + H_(*)^(1 \/ 2) \) A_2 \( W \) lt.eq C \( H_(*)^(1 \/ 4) + H_(*)^(1 \/ 2) \) A_2 \( W \) . $ <eq:sweep-lag-J-square>]
  All omissions only reduce the nonnegative upper bounds above.
  For the $A_1$ estimate, apply Cauchy–Schwarz over $\( x \, j \)$:
  $ sum_x \| cal(L)_i^x \| & lt.eq sum_(x \, j) \| h_(i x) h_(x j) \| thin \| h_(i j) W_j^x \|\
 & lt.eq (sum_(x \, j) F_(i x) F_(x j))^(1 \/ 2) (sum_(x \, j) F_(i j) \| W_j^x \|^2)^(1 \/ 2) lt.eq R_F^(3 \/ 2) A_W . $
  The quadratic part satisfies
  $ sum_x \| cal(Q)_i^x \| lt.eq A_W sum_(x \, j) F_(i x) F_(x j) lt.eq R_F^2 A_W . $
  Therefore
  #[#set math.equation(numbering: n => "(58)")
   $ A_1 \( J W \) lt.eq C A_2 \( W \) . $ <eq:sweep-lag-J-sum>]
  ===== 4.6.5 The remainder and the final mean. <the-remainder-and-the-final-mean.>
  Define the columnwise operator $cal(C)$ by $\( cal(C) W \)^x = Q^x J_x W^x$, and put
  $ q_(*) = C L_P \( H_(*)^(1 \/ 4) + H_(*)^(1 \/ 2) \) . $
  Equations (55) and (57) give $A_2 \( cal(C) W \) lt.eq q_(*) A_2 \( W \)$. For small $t$, $q_(*) < 1 \/ 2$. Equation (51) thus has the convergent series solution
  $ Delta u = sum_(k gt.eq 0) cal(C)^k Q Y \, #h(2em) A_2 \( Delta u \) lt.eq frac(L_P, 1 - q_(*)) A_2 \( Y \) lt.eq C L_P t^(delta \/ 2) . $
  Apply (58) to the outermost correction in every term of positive degree. It gives
  #[#set math.equation(numbering: n => "(59)")
   $ A_1 \( Delta u - Q Y \) & lt.eq C L_P sum_(k gt.eq 0) A_2 \( cal(C)^k Q Y \)\
 & lt.eq frac(C L_P^2, 1 - q_(*)) A_2 \( Y \) lt.eq C L_P^2 t^(delta \/ 2) . $ <eq:sweep-lag-remainder>]
  Both $J_x$ and $Y^x$ depend on $xi_(0 \, x)$; their expectations need not factor. The remainder estimate is valid for every collection of hypothetical outcomes, so averaging it bounds the sum of the absolute conditional mean remainders. Combining it with (54) and (56) yields
  $ max_i lr(|sum_x bb(E) Delta u_i^x|) lt.eq C [L_P \( t^(2 beta) + sqrt(t) \) + L_P^2 t^(delta \/ 2)] \, $
  as required. No independence between a correction and its forcing was used. ◻
]

=== 4.7 Fourth powers of a row <fourth-powers-of-a-row>

The last estimate applies to two tracked column sets: all remaining columns, and reserve columns only. In the second case the row itself is a reserve port. A tracked row is frozen when its port is deleted. When another port $x$ is deleted, define its proxy increment by taking the fourth-power change on the surviving tracked columns and ignoring the favorable loss of the removed column. Thus the accumulated proxy is an upper bound for the actual change of the tracked row sum.

#thm([Lemma 4.7.])[
  (Fourth-power proxies).  #emph[At a prestate satisfying Lemma 13, fix a surviving row $i$, a tracked column set $cal(C)$, and any subset $cal(B)$ of possible next bit ports. Let $R_i^x$ be the proxy increment just defined, with $R_i^i = 0$. Then 
#[#set math.equation(numbering: n => "(60)")
 $ lr(|sum_(x in cal(B)) bb(E) R_i^x|) lt.eq C t^kappa H_(*) \, #h(2em) sum_(x in cal(B)) \| R_i^x \|^2 lt.eq C t^kappa H_(*)^2 . $ <eq:sweep-fourth-bounds>]

 The second inequality holds for every collection of hypothetical outcomes. Hence $\| R_i^x \| lt.eq C t^(kappa \/ 2) H_(*)$.]
] <lem:sweep-fourth>

#proof[
  The linear part of $R_i^x$, for $x eq.not i$, is
  $ - 4 Re \( gamma_x A_(i x) \) \, #h(2em) A_(i x) = h_(i x) sum_(j in cal(C)\
j eq.not x) F_(i j) macron(h)_(i j) h_(x j) . $
  Cauchy–Schwarz gives
  $ \| A_(i x) \|^2 lt.eq F_(i x) (sum_j F_(i j)^2) (sum_j F_(i j) F_(x j)) \, #h(2em) sum_x \| A_(i x) \|^2 lt.eq H_(*) \( F^3 \)_(i i) lt.eq C t^kappa H_(*)^2 . $
  For the mean, extend $mu_x = bb(E) gamma_x$ by zero outside $cal(B) \\ { i }$ and put $B = h "diag" \( mu \) h$. The Ward row bounds and $parallel mu parallel_oo lt.eq C sqrt(t) thin t^beta$ imply
  $ max_j \| B_(i j) \| lt.eq C sqrt(t) thin t^beta \, #h(2em) parallel B_i parallel_2 lt.eq C t^beta \, #h(2em) parallel B_i parallel_4 lt.eq C t^(1 \/ 4 + beta) . $
  Therefore the absolute linear mean, summed over $x$, is bounded by
  $ C sum_(j in cal(C)) \| h_(i j) \|^3 \| B_(i j) \| + C t H_(*) lt.eq C H_(*)^(3 \/ 4) t^(1 \/ 4 + beta) + C t H_(*) . $
  The error term accounts for restoring $j = x$: its individual value is $mu_x h_(x x) F_(i x)^2$ and its summed absolute value is at most $C t H_(*)$.
  For complex $a \, b$, the elementary fourth-power expansion gives
  $ \| \| a - b \|^4 - \| a \|^4 + 4 Re \( \| a \|^2 macron(a) b \) #scale(x: 120%, y: 120%)[\|] lt.eq C \( \| a \|^2 \| b \|^2 + \| b \|^4 \) . $
  Apply this to $a = h_(i j)$ and $b = gamma_x h_(i x) h_(x j)$. The sum over $x \, j$ of the absolute nonlinear errors is at most
  $ C sum_(x \, j) \( F_(i j) F_(i x) F_(x j) + F_(i x)^2 F_(x j)^2 \) lt.eq C \( \( F^3 \)_(i i) + H_(*)^2 \) . $
  After division by $H_(*)$, the total bias is thus bounded by
  $ C \( t^(beta - delta \/ 4) + t + t^kappa + H_(*) \) lt.eq C t^kappa \, $
  since $beta - delta \/ 4 = .17 delta > kappa$. The square stack of the nonlinear errors is bounded by the square of their absolute sum, and is smaller than $C t^kappa H_(*)^2$. Combining with the linear square stack proves Lemma 17. All bounds remain valid after restricting either of the two index sets. ◻
]

=== 4.8 The form needed for stopped random ordering <the-form-needed-for-stopped-random-ordering>

We collect the estimates in a format that separates algebra from locality and freshness. Set $ell = 1 + log \( 1 \/ t \)$.

#thm([Proposition 4.8.])[
  (Ordinary-sweep increment estimates).  #emph[Consider a current numerical prefix of a sweep whose initial physical state satisfies the bounds at a stage boundary in Section 2, including self-consistency, and is duplicated as in Lemma 11. Assume that this prestate satisfies (38)–(39), the broad bounds on $r \, p$, and the active-site count. For the lag estimates also assume $parallel \( I - K \)^(- 1) parallel_(oo arrow.r oo) lt.eq C ell$. Let $cal(B)$ be any subset of the remaining bit ports and use fresh scalars satisfying (32). Then the estimates of Lemmas 14, 15, 16, and 17 hold before division by the number of remaining permutation slots.]
  #emph[More precisely, let $cal(H)$ be a finite-dimensional real Hilbert space and let $B : cal(H) arrow.r$ initial-port potentials be a fixed linear extension map with 
$ W \( B v \) lt.eq C parallel v parallel_(cal(H))^2 \, #h(2em) parallel B^(*) y parallel_(cal(H)^(*))^2 lt.eq C W^(*) \( y \) . $

 The dual estimate is required for neutral charges $y$. Interpret $B^(*) L_x B$ as a self-adjoint operator by the Riesz identification. The following table gives a bound for the summed conditional mean, the pathwise square stack, and a single jump: 
$ upright("increment") & upright("summed mean") & upright("square stack") & upright("jump")\
J_x & t^beta & t^(delta \/ 2) & t^(delta \/ 4)\
B^(*) L_x B & t^beta & t^(delta \/ 2) & t^(delta \/ 4)\
Delta tilde(U)_i^x & ell \( t^(2 beta) + sqrt(t) \) + ell^2 t^(delta \/ 2) & ell^2 t^delta & ell t^(delta \/ 2)\
R_i^x \/ H_(*) & t^kappa & t^kappa & t^(kappa \/ 2) $

 All entries are upper bounds up to a fixed multiplicative constant. For $J_x$ the square stack includes both orders, as required by Hermitian dilation.]
] <prop:sweep-increments>

#proof[
  Only the pullback and centering assertions remain to explain. The Schur comparison following (38) gives $D_(upright("cur")) \( B v \|_(upright("cur")) \) lt.eq C W \( B v \) lt.eq C parallel v parallel_(cal(H))^2$. The form mean and dual square bound of Lemma 15 consequently imply
  $ ∥sum_x bb(E) \( B^(*) L_x B \)∥ lt.eq C t^beta \, #h(2em) sum_x \( B^(*) L_x B \)^2 lt.eq C t^(delta \/ 2) I . $
  The latter follows by applying the assumed dual bound to $L_x \( B v \|_(upright("cur")) \)$ and summing over $x$. The remaining rows of the table are Lemmas 14, 16, and 17.
  If there are $M$ remaining slots in a uniformly random ordering, each conditional mean and second moment is the corresponding sum divided by $M$; skipped slots contribute zero. Center the joint random slot-and-scalar increment. For a self-adjoint increment $Y$,
  $ bb(E) \[ \( Y - bb(E) Y \)^2 \] = bb(E) Y^2 - \( bb(E) Y \)^2 lt.eq bb(E) Y^2 . $
  The centered jump increases by at most a factor two. Apply this to the Hermitian dilation for a complex or rectangular increment. Predictable stopping preserves all these bounds, including the prospective first breaking step because its prestate still satisfies the hypotheses. ◻
]

These estimates supply the local concentration inputs for an ordinary sweep. It remains to accumulate them with a failure bound independent of the torus volume. Section 5 proves the inverse row bound, constructs fixed local tests, and shows that their budgets imply the sweep caps. It then applies stopped concentration to those tests and returns to the physical endpoint described by (31).

== 5 Local trials and the ordinary sweep <sec:local-sweeps>

The increment estimates of Section 4 concern a fixed prestate and an arbitrary set of possible next ports. We now turn them into a complete ordinary sweep. The obstacle is the volume of the torus: it is much larger than the inverse damping scale. We therefore expose the next digits, and finally the remaining suffixes, in tiles and monitor each trial in a bounded neighborhood of its tile. Resolvent decay will show that these finitely many tests control the global matrices as well.

Throughout Section 5, the dimension $d gt.eq 3$ is fixed. Constants may depend on $d$, but are independent of the torus volume and the stage. Terminal sites remain fixed. We assume that their collapsed distance, defined below, satisfies

#[#set math.equation(numbering: n => "(61)")
 $ d_T \( i \, j \) gt.eq 1 / 2 "dist" \( i \, j \) - t^(- 1.03) . $ <eq:local-metric-input>]

Here $"dist"$ is nearest-neighbor distance on the torus. The estimate is initially immediate, and Lemma 34 will preserve it when terminal sites are added.

The analytic estimates use the following conditional interface. If $cal(F)$ is the full retained history before the next slot is chosen and $x$ is the selected port, its real scalar update satisfies

$ bb(E) \( xi_0 divides cal(F) \, x \) = 0 \, #h(2em) bb(E) \( xi_0^2 divides cal(F) \, x \) = t \, #h(2em) \| xi_0 \| lt.eq C sqrt(t) . $

The next exposed slot of a trial is conditionally uniform among its unexposed physical sites. No symmetry or two-point support is used for the scalar. For the final sweep, $t = t_m = 2 eta$ and $w = 1 \/ 2$: an untouched true suffix $xi$ has variance $eta = w t$, mean zero, and $\| xi \| lt.eq sqrt(3 w t)$, so $xi_0 = xi \/ sqrt(w)$ has exactly these bounds. Applying this interface to a true suffix requires that the suffix is still unqueried at its retained pre-query history. Lemma 4 supplies the conditional laws for unqueried coordinates and independently supplied order variables. The trial rule below verifies that ordinary sweeps query such inputs.

=== 5.1 Decay and the inverse of $I - K$ <decay-and-the-inverse-of-i-k>

Assign cost zero to each nearest-neighbor edge meeting a terminal site, and cost one to every other nearest-neighbor edge. The minimum path cost is the pseudometric $d_T$. Ports at the same physical site have distance zero in both metrics. The following proof uses the exponential-conjugation method of Combes and Thomas #cite(label("CombesThomas1973")), applied to this collapsed metric.

#thm([Lemma 5.1.])[
  (Decay in the collapsed distance).  #emph[Suppose the true terminal principal matrix is invertible. Let $g$ be the active inverse with imaginary diagonal damping between $c t$ and $C t$. There are constants $a \, C > 0$, depending only on these bounds and $d$, such that 
#[#set math.equation(numbering: n => "(62)")
 $ \| h_(i j) \| lt.eq C t^(- 1 \/ 2) exp { - a t d_T \( i \, j \) } . $ <eq:local-ct>]

 This also holds in the port representation, with changed constants. If (61) holds and $u = t^3$, then 
#[#set math.equation(numbering: n => "(63)")
 $ \| h_(i j) \| lt.eq C t^(- 1 \/ 2) exp { - c u "dist" \( i \, j \) } . $ <eq:local-physical-decay>]

 All constants are independent of the torus size.]
] <lem:locality>

#proof[
  Write the physical active inverse as $g = M^(- 1)$, where the real part of $M$ is the terminal Schur matrix. Its dissipative part gives $parallel M^(- 1) parallel lt.eq C \/ t$. Every off-diagonal entry created by eliminating a connected terminal component joins sites at collapsed distance zero. Consequently conjugation by $Q \( i \) = exp { a t d_T \( z \, i \) }$ leaves all these entries unchanged. Only direct active-active hopping entries change. There are at most $2 d$ in each row and column, and their relative change is $O \( a t \)$. Thus $parallel Q M Q^(- 1) - M parallel lt.eq C_d a t$. For a sufficiently small fixed $a$, a Neumann series gives $parallel Q M^(- 1) Q^(- 1) parallel lt.eq C \/ t$. Set $z = j$ and multiply by $sqrt(t)$ to obtain (62). The bounded port weights preserve this estimate.
  For completeness, the additive error in (61) cannot simply be absorbed into a polynomial prefactor after exponentiation. Split instead at ordinary distance $t^(- 2)$. Below this distance, the crude bound $C t^(- 1 \/ 2)$ suffices, since $u t^(- 2) = t$. Above it, $d_T \( i \, j \) gt.eq "dist" \( i \, j \) \/ 4$ for small $t$, and (62) is stronger than (63). ◻
]

#thm([Lemma 5.2.])[
  (Absolute row bound).  #emph[For an active inverse or its port representation as in Lemma 19, assume (61), bounded positive $p$, $parallel K parallel lt.eq rho_0 < 1$, and 
$ F p = q \, #h(2em) q_i = p_i + O \( t^beta \) \, #h(2em) beta > 0 . $

 Then, for sufficiently small $t$, 
#[#set math.equation(numbering: n => "(64)")
 $ parallel P parallel_(oo arrow.r oo) lt.eq C log \( 1 \/ t \) \, #h(2em) P = \( I - K \)^(- 1) . $ <eq:local-p-row>]

 Moreover $\| P_(i j) \| lt.eq C exp { - c u "dist" \( i \, j \) }$, where $u = t^3$ and the constant $c > 0$ may be decreased.]
] <lem:inverse-row>

#proof[
  The Ward identity and bounded positive $p$ give $sup_i sum_j F_(i j) lt.eq C$. Since $F$ is symmetric, the column sums obey the same bound. Tilt $K$ by $Q \( i \) = e^(u "dist" \( z \, i \))$. Each row and column sum of $Q K Q^(- 1) - K$ is bounded by
  $ sup_i sum_j F_(i j) #scale(x: 120%, y: 120%)[\(] e^(u "dist" \( i \, j \)) - 1 #scale(x: 120%, y: 120%)[\)] . $
  The contribution from distances at most $t^(- 2)$ is $O \( t \)$. For greater distances, the stronger estimate $\| h_(i j) \| lt.eq C t^(- 1 \/ 2) e^(- c t "dist" \( i \, j \))$ from the proof of Lemma 19 makes the sum exponentially small. The row-column norm bound therefore gives $parallel Q K Q^(- 1) parallel lt.eq rho < 1$, uniformly over $z$. Hence
  $ \| \( K^k \)_(i j) \| lt.eq rho^k e^(- u "dist" \( i \, j \)) . $
  Summing in $k$ proves the entrywise assertion.
  To improve the absolute row sum, use a different estimate for short powers. Entrywise $\| K^k \| lt.eq F^k$, and $F p lt.eq \( 1 + C t^beta \) p$, so
  $ sum_j \| \( K^k \)_(i j) \| lt.eq C \( 1 + C t^beta \)^k . $
  These sums are uniformly bounded for $k lt.eq k_0 = ceil.l C_1 log \( 1 \/ t \) ceil.r$. For the other powers, use
  $ sum_j e^(- u "dist" \( i \, j \)) lt.eq C_d u^(- d) = C_d t^(- 3 d) \, $
  which remains valid with two ports per site. Indeed, choosing minimal torus displacement representatives embeds each distance shell into $bb(Z)^d$, where the shell of radius $r$ has at most $C_d \( 1 + r \)^(d - 1)$ sites. Summing the geometric shell series gives the displayed bound uniformly in the torus size. Choose $C_1 = C_1 \( d \)$ so that $t^(- 3 d) rho^(k_0) lt.eq 1$. The first $k_0$ powers then cost $C k_0$, and all remaining powers together cost $C$. ◻
]

The transformed-lag cap in Section 4 supplies precisely the hypothesis $q = p + O \( t^beta \)$ of Lemma 20. Lemma 20 therefore completes the inverse-row input used in the lag increment estimates. We shall also need decay for a single prospective update, even if that update violates one of the finer caps.

#thm([Lemma 5.3.])[
  (A prospective ordinary update).  #emph[Suppose the sweep starts by duplicating a physical state satisfying the complete stage-boundary bounds of Section 2, including self-consistency, the broad bounds and comparators (7), the boundary cap $parallel K^(upright("phys")) parallel lt.eq 1 \/ 3$, the fourth-power row cap $H_(*) = t^(1 + delta)$, and an active physical-site count of at least $N \/ 2$, as in Lemma 11. In particular its initial data include $D_0 asymp W$ and the sharp duplicated comparison (30). Assume the broad bounds on the frozen $r \, p$, the fixed metric bound (61), and both current prefix conditions (38) and (39), where $beta = .42 delta$. For small $t$, these hypotheses give a fixed margin $parallel K parallel lt.eq rho_0 < 1$, bounded positive $p$, and $\| g_(i i) - r_i \| = O \( t^beta \)$. Perform one bit-port update with the conditional moment and size bounds above. Its poststate exists and, for small $t$, satisfies 
$ parallel K' parallel lt.eq rho_1 < 1 \, #h(2em) q'_i = p_i + O \( t^beta \) \, #h(2em) sup_i sum_j \| h'_(i j) \|^2 lt.eq C . $

 It satisfies Lemmas 19 and 20 without any assumption on the post-update fine caps. The lag and row proxy increments obey 
#[#set math.equation(numbering: n => "(65)")
 $ \| Delta tilde(U)_i \| + \| Delta R_i \| lt.eq t^(- C) e^(- c u "dist" \( i \, x \)) \, $ <eq:local-scalar-tails>]

 where $R_i$ denotes either normalized fourth-power row proxy. The entries of $J_x$, and the edge weights of $L_x$, obey 
#[#set math.equation(numbering: n => "(66)")
 $ t^(- C) exp { - c u \[ "dist" \( i \, x \) + "dist" \( j \, x \) \] } . $ <eq:local-matrix-tails>]

]
] <lem:local-prospective>

#proof[
  Reserve ports keep the physical damping at least $c t$, so the updated inverse exists. By the single-update formula,
  $ \| g'_(i i) - g_(i i) \| lt.eq C \| h_(i x) \|^2 \/ sqrt(t) lt.eq C sqrt(H_(*) \/ t) = C t^(delta \/ 2) . $
  Since $delta \/ 2 > beta$, this proves the new diagonal estimate. The formula $h'_(i j) = h_(i j) - gamma h_(i x) h_(x j)$, with $\| gamma \| lt.eq C$, also gives
  $ sum_j \| h'_(i j) \|^2 lt.eq 2 sum_j \| h_(i j) \|^2 + C \| h_(i x) \|^2 sum_j \| h_(x j) \|^2 lt.eq C . $
  The inherited stage-start data and the current cap conditions are the prestate hypotheses of Proposition 18; Lemma 20 supplies its inverse-row input. That proposition gives $parallel J_x parallel lt.eq C t^(delta \/ 4)$. Write $I - hat(K) = "Schur"_({ x }) \( I - K \)$. The Schur contraction proved after (38) gives $parallel hat(K) parallel lt.eq parallel K parallel lt.eq rho_0$, while the exact next-step identity is
  $ I - K' = "Schur"_({ x }) \( I - K \) - J_x = I - hat(K) - J_x . $
  Thus $parallel K' parallel lt.eq rho_0 + C t^(delta \/ 4) lt.eq rho_1 < 1$ for small $t$. The terminal set has not changed, so its metric bound has not changed either. Lemmas 19 and 20 now apply.
  The explicit formulas for $J_x \, L_x$ contain a factor joining each surviving endpoint to $x$. Lemma 19 therefore gives (66). In the exact lag formula $Delta tilde(U) = P' Z^x \/ sqrt(t)$, the vector $Z^x$ has the same single-center decay by its definition and the prestate bound on $U$. The entrywise bound on $P'$ preserves that decay under convolution. The fourth-power proxy formulas are finite sums of the same factors. Each convolution loses at most a power of $u^(- 1)$, because $sum_j e^(- c u "dist" \( i \, j \)) lt.eq C_d u^(- d)$; decreasing the exponent constant absorbs the convolution. This proves (65) with a polynomial prefactor whose degree may depend on $d$. Crucially, none of these deductions used a post-update fine cap. ◻
]

=== 5.2 A finite-dimensional test for the energy increment <a-finite-dimensional-test-for-the-energy-increment>

At ordinary stage $n$, partition the torus into cubes of side $L_(upright("tile")) = 4^(6 n) asymp t^(- 6)$. Around each tile choose concentric cubes $Q \, Q'$ of side $3 L_(upright("tile")) \, 5 L_(upright("tile"))$. They fit in the torus, and each family has uniformly bounded overlap. Let $chi$ equal one on $Q$, vanish at the boundary of $Q'$, and have nearest-neighbor slopes at most $C \/ L_(upright("tile"))$.

Write $cal(P)_0$ for the ports present at the start of the duplicated sweep. The fixed real local test space $cal(H)_T$ consists of pairs $\( alpha \, v \)$, where $alpha$ is indexed by $cal(P)_0 ∩ Q'$, and $v$ is indexed by all physical sites in $Q'$, modulo constants. Its dimension is at most $3 \| Q' \| lt.eq C_d L_(upright("tile"))^d lt.eq C_d t^(- 6 d)$. Its norm and extension map are

#[#set math.equation(numbering: n => "(67)")
 $ parallel \( alpha \, v \) parallel_(upright("loc"))^2 = parallel alpha parallel_(Q')^2 + b^(- 1) parallel nabla v parallel_(Q')^2 \, #h(2em) B_T \( alpha \, v \) = chi #scale(x: 120%, y: 120%)[\(] alpha + v - "avg"_(Q') v #scale(x: 120%, y: 120%)[\)] . $ <eq:local-pullback>]

The extension is zero outside $Q'$, and physical values of $v$ are repeated on ports. The subscript $T$ here identifies the tile. The symbol $B_T^(*)$ denotes the pullback into the dual of the local space. A pulled-back symmetric form is measured by the norm of its representing self-adjoint operator in the local inner product. The set $cal(P)_0$, the cubes, $chi$, $t \, b$, the local norm, and $B_T$ stay fixed throughout the sweep, including retries. They may depend on the stage-start history, on which we condition. Each new correction is extended by zero to $cal(P)_0$ at its time of creation. The precise record convention below keeps this reference space fixed at every stopping step.

#thm([Lemma 5.4.])[
  (Local pullback).  #emph[The maps in (67) satisfy 
$ W \( B_T f \) lt.eq C parallel f parallel_(upright("loc"))^2 \, #h(2em) parallel B_T^(*) y parallel_(upright("loc") \, *)^2 lt.eq C W^(*) \( y \) $

 for neutral charges $y$. At a prestate satisfying the inherited stage-start and current hypotheses of Proposition 18, the comparison $D_(upright("cur")) \( f \|_(upright("cur")) \) lt.eq C W \( f \)$ holds. Pad each $L_x$ to the initial ports. The pulled-back increments $B_T^(*) L_x B_T$ then satisfy the mean and operator-square-stack bounds of Proposition 18, up to a fixed constant, in the local norm.]
] <lem:local-pullback>

#proof[
  Use the displayed decomposition of $B_T f$ in the infimum defining $W$. Its $alpha$ part has no larger norm. The product rule and cube Poincare inequality give
  $ parallel nabla \[ chi \( v - "avg" v \) \] parallel^2 lt.eq C parallel nabla v parallel_(Q')^2 + C L_(upright("tile"))^(- 2) parallel v - "avg" v parallel_(Q')^2 lt.eq C parallel nabla v parallel_(Q')^2 . $
  This proves the first estimate, and duality gives the second.
  For clarity, let $cal(R)$ be the Riesz map from the local space to its dual, and set $A_x = cal(R)^(- 1) B_T^(*) L_x B_T$. Every $L_x y$ is neutral. Hence
  $ sum_x parallel A_x f parallel_(upright("loc"))^2 lt.eq C sum_x W^(*) \( L_x B_T f \) lt.eq C t^(delta \/ 2) D_(upright("cur")) \( \( B_T f \) \|_(upright("cur")) \) lt.eq C t^(delta \/ 2) parallel f parallel_(upright("loc"))^2 . $
  Since each $A_x$ is self-adjoint in this fixed inner product, this is the scalar identity bound
  $ sum_x A_x^2 lt.eq C_d t^(delta \/ 2) I_(cal(H)_T) \, #h(2em) ∥sum_x bb(E) A_x∥_(cal(H)_T) lt.eq C_d t^beta . $
  The mean estimate follows from the corresponding form bound. Both assertions hold for every subset of possible next ports; the square bound holds for arbitrary choices of their hypothetical outcomes. All maps here act on a fixed initial-port space; deleting a port merely pads the new matrix by zero there. ◻
]

=== 5.3 Trials and the transfer of local budgets <trials-and-the-transfer-of-local-budgets>

Start from a physical state satisfying the complete stage-boundary bounds of Section 2, including self-consistency, (7), the broad bounds on $r \, p$, the boundary cap $parallel K^(upright("phys")) parallel lt.eq 1 \/ 3$, the fourth-power row cap $H_(*) = t^(1 + delta)$, and an active physical-site count of at least $N \/ 2$. Duplicate it as in Lemma 11. The resulting initial data include

$ tilde(U)_0 = 0 \, #h(2em) D_0 asymp W \, #h(2em) X_0 lt.eq \( 1 + t^kappa \) "diag" \( p_x^(- 2) \) + C_n t Lambda_Sigma^(+) \, $

and the full duplicated fourth-power rows are at most $.75 H_(*)$. These initial comparisons, the broad bounds on the frozen $r \, p$, the active physical-site count, and (61) are standing assumptions for the rest of this section. Bit-port deletions leave the physical active and terminal sets unchanged, so the count and metric remain fixed; the initial comparison data and frozen parameters also remain fixed.

Process the tiles in a fixed order. A trial in a tile $T$ starts from its current committed numerical pre-tile state and reveals a uniform permutation of all $M = L_(upright("tile"))^d$ physical sites in $T$, one slot at a time. A terminal slot is skipped. At an active slot the trial deletes the bit port at that site and uses the update of Lemma 12. For each digit stage $n < m$, tile $T$, trial number $a gt.eq 1$, and physical site $i in T$, supply an auxiliary fair sign $epsilon_(n \, T \, a \, i)^(upright("aux"))$. The auxiliary signs are independent over these indices and independent of the true digits. The corresponding physical digit is $sqrt(3 s_n \/ 4) thin epsilon_(n \, T \, a \, i)^(upright("aux"))$. Also supply independent uniform permutations $pi_(n \, T \, a)$ for $n_0 lt.eq n lt.eq m$, each tile $T$ at that stage, and $a gt.eq 1$, independent of both sign families. Only the slots and auxiliary signs actually used are revealed. On a first digit trial, a coupled active site $i$ uses $sqrt(3 s_n \/ 4) thin epsilon_(i \, n - n_0 + 1)$, and a pending site uses its designated auxiliary digit. Later digit trials use their new auxiliary family at every active site. The actual final sweep is entered only with no pending site; its first trial at a tile uses $xi_i := sum_(k > m - n_0) lambda 2^(- k) epsilon_(i \, k)$, the whole remaining true suffix, at every active site and aborts on failure. It uses only $pi_(m \, T \, 1)$, samples no auxiliary suffix, and has no retry.

We now specify the numerical records and the test made after a slot. For each deletion $x$, retain $J_x \, L_x$ on the fixed initial-port space $cal(P)_0$: pad the new increments by zero at $x$ and at ports deleted before that update. Entries already recorded in an earlier increment are retained when a later port is deleted. This is the convention in the cumulative Schur identities (37).

There are also three scalar records on fixed coordinate sets. Let $Delta sans(u)_i^x$ equal the transformed-lag increment $Delta tilde(U)_i^x$ on the survivors of deletion $x$, and set it to zero at $x$ and at every earlier deleted coordinate. For $sigma in { upright("all") \, upright("res") }$, let $Delta sans(R)_i^(sigma \, x) = R_i^(sigma \, x) \/ H_(*)$ be the normalized proxy increment of Lemma 17, with all current columns tracked when $sigma = upright("all")$, and reserve columns tracked when $sigma = upright("res")$. The latter record is defined only for reserve rows. Each proxy sums the fourth-power change over surviving tracked columns; it omits the favorable loss of the removed column. Its increment is zero when its own row is deleted and thereafter. Thus all three records have fixed coordinate sets in $cal(P)_0$, with a coordinate frozen at its deletion. The normalized proxy increments are the quantities denoted by $Delta R_i$ in (65).

Write $x_ell$ for the bit port at slot $ell$ when that slot is active, and interpret each summand below as zero at a terminal slot. The records for prefix $k$ of a trial in $T$ are

$ J_(T \, k) & = sum_(ell lt.eq k) J_(x_ell) \, & L_(T \, k) & = sum_(ell lt.eq k) L_(x_ell) \,\
sans(u)_(T \, k) & = sum_(ell lt.eq k) Delta sans(u)^(x_ell) \, & sans(R)_(T \, k)^sigma & = sum_(ell lt.eq k) Delta sans(R)^(sigma \, x_ell) . $

Every one of these records is zero at the start of each trial, including a retry. If an earlier tile $S$ has been accepted, write $J_S \, L_S \, sans(u)_S \, sans(R)_S^sigma$ for the endpoint records of its accepted trial. At a current prefix in $T$, define the accumulated sweep records by

#[#set math.equation(numbering: n => "(68)")
 $ J_(T \, k)^(upright("sw")) & = sum_(S prec T) J_S + J_(T \, k) \, & L_(T \, k)^(upright("sw")) & = sum_(S prec T) L_S + L_(T \, k) \,\
sans(u)_(T \, k)^(upright("sw")) & = sum_(S prec T) sans(u)_S + sans(u)_(T \, k) \, & sans(R)_(T \, k)^(sigma \, upright("sw")) & = sum_(S prec T) sans(R)_S^sigma + sans(R)_(T \, k)^sigma . $ <eq:local-sweep-records>]

Only the accepted trial of each earlier tile enters these sums. A failed numerical prefix is absent. In this included numerical record, a physical site is used as a pivot at most once: the tiles are disjoint and each trial permutation visits a site once. The retained information may contain failed queries at those same physical sites.

Let $cal(P)_(upright("cur"))$ be the current survivor ports, and let $cal(P)_(upright("res"))$ be the reserve ports, which survive the whole sweep. Along any included sequence for which the increments are defined, the lag record has the exact restriction identity

$ sans(u)_(T \, k)^(upright("sw")) \|_(cal(P)_(upright("cur"))) = tilde(U)_(upright("cur")) . $

Indeed, both start at zero and have identical increments on each survivor; a deleted coordinate of the fixed record keeps its value immediately before deletion. The row records have a different role. For a surviving row, and respectively for a reserve row, they give only

$ sum_(j in cal(P)_(upright("cur"))) \| h_(i j)^(upright("cur")) \|^4 & lt.eq sum_(j in cal(P)_0) \| h_(i j)^0 \|^4 + H_(*) sans(R)_i^(upright("all") \, upright("sw")) \,\
sum_(j in cal(P)_(upright("res"))) \| h_(i j)^(upright("cur")) \|^4 & lt.eq sum_(j in cal(P)_(upright("res"))) \| h_(i j)^0 \|^4 + H_(*) sans(R)_i^(upright("res") \, upright("sw")) . $

Here and below the current $\( T \, k \)$ subscripts are suppressed when unambiguous. The inequalities retain the favorable removed-column loss on the left and omit it from the proxy on the right.

Call the current prefix #emph[valid] when it satisfies both (38) and (39), with the exact meanings

#[#set math.equation(numbering: n => "(69)")
 $ parallel J_(T \, k)^(upright("sw")) parallel lt.eq t^(.10 delta) \, #h(2em) \| L_(T \, k)^(upright("sw")) \| lt.eq t^(.10 delta) D_0 \,\
max_(i in cal(P)_(upright("cur"))) sum_(j in cal(P)_(upright("cur"))) \| h_(i j)^(upright("cur")) \|^4 lt.eq H_(*) \, #h(2em) parallel tilde(U)_(upright("cur")) parallel_(ell^oo \( cal(P)_(upright("cur")) \)) lt.eq t^beta \, #h(2em) beta = .42 delta . $ <eq:local-validity>]

The first line tests the accumulated padded corrections on the initial space, and the second tests the actual current row and transformed lag on survivors. The two-sided form inequality for $L_(T \, k)^(upright("sw"))$ is on the initial ports. The standing data above are not additional prefix tests. By the Section 4 Schur and prestate arguments, validity and those data supply the hypotheses of Proposition 18; Lemma 20 supplies its absolute inverse-row bound.

Let $P_(Q_T)$ be the Euclidean projection onto $cal(P)_0 ∩ Q_T$, and let $cal(R)_T$ be the Riesz map of $cal(H)_T$. At every trial prefix impose the local budgets

#[#set math.equation(numbering: n => "(70)")
 $ parallel sans(u)_(T \, k) parallel_(ell^oo \( cal(P)_0 ∩ Q_T \)) lt.eq t^(.44 delta) \, #h(2em) max_(sigma in { upright("all") \, upright("res") }) parallel sans(R)_(T \, k)^sigma parallel_(ell^oo \( Q_T \)) lt.eq t^(.0005 delta) \,\
parallel P_(Q_T) J_(T \, k) P_(Q_T) parallel lt.eq t^(.125 delta) \, #h(2em) parallel cal(R)_T^(- 1) B_T^(*) L_(T \, k) B_T parallel_(cal(H)_T) lt.eq t^(.125 delta) . $ <eq:local-budgets>]

For a row record, the norm over $Q_T$ uses its fixed row indices above that cube. The matrix norm is Euclidean and the form norm uses the fixed local inner product. These budgets apply to changes accumulated since this trial began, whereas (69) uses the full included sweep record.

After a slot, continue precisely when the local budgets and validity still hold. Stop and fail at their first violation, retaining the update that produces it. Its preceding prefix satisfies both cap displays, so Lemma 21 supplies the poststate inverse and a fixed $I - K'$ invertibility margin. The transformed lag and this first possibly failing test are therefore defined without assuming fine caps at the poststate. If all $M$ slots finish without a violation, accept the trial’s numerical changes and endpoint records. On a failure restore the pre-tile potential values, port set, and matrices, and discard the failed trial records. Retain every queried index and answer and every exposed permutation slot, including the answer producing the first violation. A failed first trial marks every active site of the tile pending, including active sites whose slots were not reached. Previously terminal sites remain terminal. When the digit retry construction is used, its numerical starting state has those restored values and all active labels in the tile pending. A later failure restores that retry starting state and retains its own queried information; the next retry uses a new auxiliary family and independent permutation. At the later cutoff where the construction requires the pending set to be empty, it begins aborting at any first-trial failure instead of entering a retry.

Here is the ordinary verification of the input law. At entry to scale $n$, assume the retained-history invariant that each coupled active site has the first $n - n_0$ true digits as its partial value and its remaining suffix is untouched. A digit trial consumes the next bit; the final trial at $n = m$ consumes the whole suffix after those $m - n_0$ digits. The permutation exposes a site before its scalar answer is queried, and every stopping and acceptance decision is a function of the resulting retained history. At a coupled first-trial slot the required true bit, or final suffix, is therefore unqueried; at a pending slot the designated auxiliary entry is unused. Lemma 4 gives the scalar law conditional on the retained history before the slot and on the newly exposed slot, and gives the conditionally uniform order on the unexposed slots of the new independent permutation. On success a coupled site consumes that true input and retains the unused suffix (empty after final completion), while a pending site stays pending. On first-trial failure the numerical rollback leaves every answer in the history, and the whole-tile marking rule removes all its active sites from the class at which true freshness is used. This rule also conservatively marks unreached active sites, whose own suffixes may still be untouched. Retries use only their unused auxiliary entries. Thus ordinary trials preserve the invariant at every coupled site and satisfy the conditional interface above after arbitrary previous failures. This verification uses the generic reveal lemma, without conditioning on future acceptance of a trial.

#thm([Lemma 5.5.])[
  (Transfer from tiles to the whole sweep).  #emph[Under the standing duplicated stage-start and metric assumptions, consider the numerical record consisting of the accepted endpoint records of earlier tiles and one current trial prefix, possibly empty. Suppose the physical pivots in this collection are distinct and every included update has a prestate satisfying (69). Assume (70) for each accepted endpoint record and for the current prefix record. The last included poststate is allowed to violate a mutable cap. Then, for sufficiently small $t$, 
$ parallel J^(upright("sw")) parallel lt.eq C t^(.125 delta) lt.double t^(.10 delta) \, #h(2em) \| L^(upright("sw")) \| lt.eq C t^(.125 delta) D_0 lt.double t^(.10 delta) D_0 \,\
parallel sans(u)^(upright("sw")) parallel_oo lt.eq C t^(.44 delta) \, #h(2em) max_(sigma in { upright("all") \, upright("res") }) parallel sans(R)^(sigma \, upright("sw")) parallel_oo lt.eq C t^(.0005 delta) . $

 Consequently its actual surviving transformed lag and full rows satisfy 
$ parallel tilde(U)_(upright("cur")) parallel_oo lt.eq C t^(.44 delta) < t^(.42 delta) \, #h(2em) max_(i in cal(P)_(upright("cur"))) sum_(j in cal(P)_(upright("cur"))) \| h_(i j)^(upright("cur")) \|^4 lt.eq \( .75 + C t^(.0005 delta) \) H_(*) < H_(*) . $

 The reserve-row output retained for the endpoint is 
$ max_(i in cal(P)_(upright("res"))) sum_(j in cal(P)_(upright("res"))) \| h_(i j)^(upright("cur")) \|^4 lt.eq \( theta^2 + C t^(.0005 delta) \) H_(*) . $

 In particular the current prefix is strictly inside all four mutable caps in (69).]
] <lem:local-transfer>

#proof[
  For each included tile write $J_T \, L_T \, sans(u)_T \, sans(R)_T^sigma$ for its accepted endpoint record or its current prefix record. Every included update has a valid prestate, so Lemma 21 gives the scalar and matrix tails through the last candidate update. Its proof does not require that candidate poststate to satisfy a fine cap.
  For $J$, bounded overlap of the cubes gives
  $ ∥sum_T 1_(Q_T) J_T 1_(Q_T)∥ lt.eq C max_T parallel 1_(Q_T) J_T 1_(Q_T) parallel . $
  Indeed, test against two vectors and apply Cauchy–Schwarz to $sum_T parallel 1_(Q_T) f parallel parallel 1_(Q_T) g parallel$. No sign assumption on $J_T$ is needed. The discarded entries are negligible by (66) and distinctness of the pivots: an entry discarded for a tile has an endpoint at distance at least $L_(upright("tile"))$ from its pivot, and the remaining exponential kernel has uniformly bounded row and column sums up to a power of $t^(- 1)$. Thus its total operator norm is at most $t^(- C) e^(- c u L_(upright("tile")))$. The analogous scalar argument uses bounded overlap at each monitored row and (65) elsewhere. It gives the stated bounds for the fixed records $sans(u)^(upright("sw"))$ and $sans(R)^(sigma \, upright("sw"))$, up to the same negligible error.
  For the energy form, test an arbitrary split $f = alpha + v$ on the initial ports, and write $f_T$ for the restrictions of the pair $\( alpha \, v \)$ to the local space $cal(H)_T$. On $Q_T times Q_T$, differences of $B_T f_T$ equal differences of $f$. The error is a tail. If $x$ is in the tile and an endpoint lies outside $Q_T$, its distance from $x$ is at least $L_(upright("tile"))$. Extracting part of this distance from (66), then summing over distinct pivots, bounds the absolute error edge kernel by
  #[#set math.equation(numbering: n => "(71)")
   $ t^(- C) e^(- c u L_(upright("tile"))) e^(- c u "dist" \( i \, j \)) . $ <eq:local-edge-tail>]
  Convolution sums only change the polynomial prefactor. For a minimal torus displacement representative $a$,
  $ sum_i \| v_i - v_(i + a) \|^2 lt.eq \| a \|_1^2 parallel nabla v parallel^2 . $
  The shell count used in Lemma 20 gives, for $s = 0 \, 2$,
  $ sum_a \| a \|_1^s e^(- c u \| a \|_1) lt.eq C_d sum_(r gt.eq 0) \( 1 + r \)^(d - 1 + s) e^(- c u r) lt.eq C_d u^(- d - s) \, $
  where for $s = 0$ the zero displacement contributes one. Thus the gradient contribution costs at most $C_d u^(- d - 2)$, and the $alpha$ contribution at most $C_d u^(- d)$. It follows that (71) contributes at most
  $ t^(- C) e^(- c u L_(upright("tile"))) \( parallel alpha parallel^2 + b^(- 1) parallel nabla v parallel^2 \) . $
  For the pullback tail of one tile, apply this same kernel estimate to the zero extensions
  $ alpha_T = chi_T alpha \, #h(2em) v_T = chi_T \( v - "avg"_(Q'_T) v \) . $
  Its error is bounded by the exponential prefactor times $parallel alpha_T parallel^2 + b^(- 1) parallel nabla v_T parallel^2$, which is at most $C parallel \( alpha \, v \) parallel_(upright("loc") \, T)^2$ by the product and Poincare estimate in Lemma 22. Summing these local energies costs only bounded overlap. Since $u L_(upright("tile")) asymp t^(- 3)$, all these errors are smaller than any power of $t$. The local form budgets give
  $ sum_T \| \( B_T^(*) L_T B_T \) \( f_T \) \| lt.eq t^(.125 delta) sum_T parallel f_T parallel_(upright("loc"))^2 lt.eq C t^(.125 delta) \( parallel alpha parallel^2 + b^(- 1) parallel nabla v parallel^2 \) . $
  Combining this with the two tail estimates and taking the infimum over splits yields
  $ \| L^(upright("sw")) \| lt.eq C t^(.125 delta) W lt.eq C t^(.125 delta) D_0 lt.double t^(.10 delta) D_0 . $
  Here the last comparison is the initial comparison $D_0 asymp W$, not an assumed post-update comparison. The preceding overlap bounds similarly give $parallel J^(upright("sw")) parallel lt.eq C t^(.125 delta) lt.double t^(.10 delta)$ and $parallel sans(u)^(upright("sw")) parallel_oo lt.eq C t^(.44 delta) lt.double t^(.42 delta)$. Restricting the latter record to survivors gives the actual transformed lag bound. The total normalized row-proxy increase is at most $C t^(.0005 delta)$. Its upper-bound relation with actual row growth, together with the initial full-row bound $.75 H_(*)$ and the initial reserve-row bound $theta^2 H_(*)$, proves the two row conclusions. All the conclusions therefore hold through the candidate update. ◻
]

At a first possible failure with no local crossing, this transfer will force the four mutable caps to remain strict. We now estimate the probability of a local crossing in one tile.

=== 5.4 A maximal concentration estimate <a-maximal-concentration-estimate>

We will repeatedly apply the following finite-dimensional estimate inside a neighborhood whose dimension is polynomial in $t^(- 1)$ for fixed $d$. The variance envelopes below are predictable scalars dominating the conditional squares in matrix order. This precise version follows from the finite-dimensional Golden–Thompson inequality, as the proof shows. For the general matrix-martingale framework, compare #cite(label("Tropp2011")) Theorem 1.2 and Corollary 1.3; the scalar-envelope version used here is proved below.

#thm([Lemma 5.6.])[
  #emph[Let $Y_k$ be self-adjoint $D_s$-dimensional matrix martingale differences adapted to $\( cal(F)_k \)$, with $parallel Y_k parallel lt.eq J$. Suppose 
$ bb(E) \( Y_k^2 divides cal(F)_(k - 1) \) lt.eq v_k I \, #h(2em) sum_k v_k lt.eq V $

 pathwise, where $v_k$ is nonnegative and $cal(F)_(k - 1)$-measurable, and $J \, V$ are deterministic. Then for $a > 0$, with an absolute $c > 0$, 
$ bb(P) (sup_n ∥sum_(k lt.eq n) Y_k∥ > a) lt.eq 2 D_s exp [- c min (a^2 / V \, a / J)] . $

 The zero-variance case is understood by continuity. A stopped process may be continued by zero increments.]
] <lem:matrix-concentration>

#proof[
  For $u > 0$ with $u J lt.eq 1$, functional calculus gives $e^(u Y_k) lt.eq I + u Y_k + C u^2 Y_k^2$. Taking conditional expectations, using the martingale-difference property, and applying $1 + x lt.eq e^x$ yields $bb(E) \( e^(u Y_k) divides cal(F)_(k - 1) \) lt.eq e^(C u^2 v_k) I$. The Golden–Thompson inequality #cite(label("Golden1965")) #cite(label("Thompson1965")), in the finite-Hermitian form stated in #cite(label("ForresterThompson2014")) Equation (1.1), says $"Tr" e^(B + C) lt.eq "Tr" \( e^B e^C \)$ for finite-dimensional Hermitian $B \, C$. Applied conditionally, and using that $v_k$ is a predictable scalar, it shows that
  $ Z_n = "Tr" exp (u sum_(k lt.eq n) Y_k - C u^2 sum_(k lt.eq n) v_k I) $
  is a nonnegative supermartingale with $Z_0 = D_s$. At the first upper eigenvalue crossing of $a$, it is at least $exp \( u a - C u^2 V \)$. Stopping at that crossing and a finite horizon bounds its probability by $D_s exp \( - u a + C u^2 V \)$. Let the horizon increase, choose $u$ to be a small constant times $min \( a \/ V \, 1 \/ J \)$, and repeat with $- Y_k$. The union of the two crossings gives the result. ◻
]

A rectangular or complex increment $B$ is handled by the Hermitian matrix $mat(delim: "(", 0, B; B^(*), 0)$. Its square requires bounds for both $B B^(*)$ and $B^(*) B$. Conditional centering doubles the jump bound at most. It does not increase either conditional square: if $macron(B) = bb(E) \( B divides cal(F) \)$, then

$ bb(E) \[ \( B - macron(B) \) \( B - macron(B) \)^(*) divides cal(F) \] = bb(E) \[ B B^(*) divides cal(F) \] - macron(B) macron(B)^(*) lt.eq bb(E) \[ B B^(*) divides cal(F) \] \, $

and the same calculation holds in the other order. For vector increments, the squared Euclidean norm bounds both dilation blocks. All spaces and their inner products are fixed at the start of each trial; removed indices are padded by zeros.

Here is how scalar envelopes arise in a randomly ordered trial. If there are $r$ equally likely next slots and their possible square-matrix increments $B_x$ satisfy, for every vector $v$ and every collection of outcomes,

$ sum_x #scale(x: 120%, y: 120%)[\(] parallel B_x v parallel^2 + parallel B_x^(*) v parallel^2 #scale(x: 120%, y: 120%)[\)] lt.eq V_(*) parallel v parallel^2 \, $

then averaging first over the outcome in each slot and then over its uniform selection bounds each conditional dilation square by $\( V_(*) \/ r \) I$. Only the conditional marginal laws of these hypothetical outcomes are needed. Over $M$ slots their envelopes sum to at most $V_(*) sum_(r = 1)^M r^(- 1)$. For $M lt.eq t^(- C_d)$ this costs $O_d \( log \( 1 \/ t \) \)$. The localized energy operators and vector arrays used later have the corresponding square-stack bounds. In every application below, the predictable variance sum is bounded through the first prospective budget-breaking update. That increment is included whenever the trial’s tests permit another update at the preceding prefix; this decision is predictable, and all subsequent increments are zero. Thus the concentration hypotheses are verified before the outcome that might violate a budget is observed.

=== 5.5 One trial and its retries <one-trial-and-its-retries>

#thm([Lemma 5.7.])[
  (One trial).  #emph[Under the standing duplicated stage-start and metric assumptions, suppose all earlier tiles were accepted under the trial rule and the present trial starts with their accepted matrix state and accumulated records satisfying (69). Its active labels may reflect earlier failed attempts at the current tile. Assume the conditional slot and scalar interface stated above. Uniformly in the full retained history at this trial start, the conditional probability that the next trial fails is at most $exp { - t^(- c) }$, for a fixed $c > 0$.]
] <lem:local-trial>

#proof[
  Condition on the entire retained history at the trial start. There are $M = L_(upright("tile"))^d asymp_d t^(- 6 d)$ permutation slots. While the trial is running, let $cal(F)_(k - 1)$ be the full retained history immediately before slot $k$. It includes all earlier queries, their answers, exposed permutation slots and decisions, but not the next slot or its answer. Given $cal(F)_(k - 1)$, the next member is uniform among the $r_k = M - k + 1$ unexposed physical sites. A terminal slot has zero increment. At each other possible slot, the scalar law conditional on $cal(F)_(k - 1)$ and that newly exposed slot satisfies (32). The current numerical prestate is $cal(F)_(k - 1)$-measurable.
  Let $tau$ be the first prefix violating a local budget or one of the four mutable caps, and put $tau = M + 1$ if there is none. The multiplier $s_k = upright(bold(1))_({ k lt.eq tau })$ is predictable: it asks only whether prefixes through $k - 1$ satisfied the local budgets and validity. When $s_k = 1$, evaluate the next raw increment at that valid prestate; when $s_k = 0$, set the stopped increment to zero without another query. This defines the stopped increment as $s_k$ times the raw increment where it is evaluated. Thus the first breaking update is included, and every retained update has a valid prestate. After stopping, the formal remaining increments are zero and $cal(F)_k$ stays equal to the history at stopping. The actual retained filtration continues through rollback, marking, and later trials. The poststate of the first breaking update need not satisfy the fine caps; Lemma 21 supplies all decay estimates needed through the breaking update. The next-slot law and its count $r_k$ are used only when $s_k = 1$; after stopping every variance envelope is zero.
  We verify the scalar identity variance hypothesis of Lemma 24 separately for every monitored quantity. Put $ell = 1 + log \( 1 \/ t \)$, let $bb(E)_(k - 1)$ denote conditional expectation given $cal(F)_(k - 1)$, and use the Hermitian dilation
  $ sans(H) \( B \) = mat(delim: "(", 0, B; B^(*), 0) \, #h(2em) sans(H) \( B \)^2 = "diag" \( B B^(*) \, B^(*) B \) . $
  All operators below act on the fixed spaces and scalar coordinate sets defined above.
  For a monitored lag coordinate, take $sans(H) \( Delta sans(u)_i^x \)$ on $bb(C)^2$. Its square is $\| Delta sans(u)_i^x \|^2 I_2$, so the lag stack of Proposition 18 gives $C_d ell^2 t^delta I_2$ after summing over all remaining possible bit ports. The record has zero increment at its own deletion and thereafter.
  For $J$, write $P_Q$ for the fixed Euclidean projection onto $cal(P)_0 ∩ Q$ and $C_x = P_Q J_x P_Q$ on that space. Both square orders are controlled:
  $ sum_x C_x C_x^(*) lt.eq P_Q #scale(x: 180%, y: 180%)[\(] sum_x J_x J_x^(*) #scale(x: 180%, y: 180%)[\)] P_Q lt.eq C_d t^(delta \/ 2) I_Q \, #h(2em) sum_x C_x^(*) C_x lt.eq C_d t^(delta \/ 2) I_Q . $
  Consequently the sum of squares of $sans(H) \( C_x \)$ is bounded by $C_d t^(delta \/ 2)$ times the identity on the doubled local port space. Zero padding makes these compressions meaningful even after ports are deleted.
  For $L$, use the self-adjoint Riesz operator $A_x = cal(R)_T^(- 1) B_T^(*) L_x B_T$ on $cal(H)_T$. Lemma 22 gives directly $sum_x A_x^2 lt.eq C_d t^(delta \/ 2) I_(cal(H)_T)$. For either normalized row proxy, its increment $Delta sans(R)_i^(sigma \, x)$ is real; Proposition 18 gives $sum_x \| Delta sans(R)_i^(sigma \, x) \|^2 lt.eq C_d t^kappa$. This is an identity bound on its fixed one-dimensional real space, again with zero increments from the row’s deletion onward.
  Each of these pathwise stacks holds over any remaining subset and for every collection of allowed hypothetical scalar outcomes. They can therefore be averaged under any joint law with the required conditional marginals. Independence among hypothetical outcomes at different possible next ports is unnecessary. Averaging over the uniform next slot divides the relevant stack by $r_k$. For each of the four self-adjoint stopped raw increments $Z_k^a$, center the joint slot-and-scalar outcome by setting $Y_k^a = Z_k^a - bb(E)_(k - 1) Z_k^a$. Then
  $ bb(E)_(k - 1) \( Y_k^a \)^2 = bb(E)_(k - 1) \( Z_k^a \)^2 - \( bb(E)_(k - 1) Z_k^a \)^2 lt.eq v_k^a I_a \, $
  with the explicit predictable scalar choices
  $ v_k^(upright("lag")) & = C_d s_k ell^2 t^delta \/ r_k \, & v_k^J & = C_d s_k t^(delta \/ 2) \/ r_k \,\
v_k^L & = C_d s_k t^(delta \/ 2) \/ r_k \, & v_k^(upright("row")) & = C_d s_k t^kappa \/ r_k . $
  Here $I_a$ is the identity on the indicated fixed space. Centering increases the jump bound by at most a factor two. The harmonic sum obeys
  $ sum_(k = 1)^M r_k^(- 1) lt.eq 1 + log M lt.eq C_d ell . $
  Thus the deterministic total variance envelopes, centered jump bounds, and budgets, up to constants depending only on $d$, are
  $ upright("quantity") & V & upright("jump") & upright("budget")\
tilde(U)_i & ell^3 t^delta & ell t^(delta \/ 2) & t^(.44 delta)\
J \, med B_T^(*) L B_T & ell t^(delta \/ 2) & t^(delta \/ 4) & t^(.125 delta)\
upright("normalized row proxy") & ell t^kappa & t^(kappa \/ 2) & t^(.0005 delta) $
  The same averaging of the arbitrary-subset mean estimates bounds the sum of norms of conditional means by
  $ B_(upright("lag")) & = C_d \[ ell^2 \( t^(2 beta) + sqrt(t) \) + ell^3 t^(delta \/ 2) \] \,\
B_J + B_L & lt.eq C_d ell t^beta \, #h(2em) B_(upright("row")) lt.eq C_d ell t^kappa . $
  These are respectively $o \( t^(.44 delta) \)$, $o \( t^(.125 delta) \)$, and $o \( t^(.0005 delta) \)$, so each is smaller than half its budget for sufficiently small $t$. Apply Lemma 24 to the centered sums at half-budget. The exponent margins for squared budget divided by $V$ and for budget divided by the jump bound are, respectively, $.25 delta$ and $.125 delta$ for $J \, L$, $.12 delta$ and $.06 delta$ for the transformed lag, and $.004 delta$ and $.002 delta$ for a normalized row proxy, using $kappa = .005 delta$. For the lag, the two ratios are bounded below by
  $ c t^(- .12 delta) \/ ell^3 \, #h(2em) c t^(- .06 delta) \/ ell . $
  All these ratios tend to infinity by a positive power of $t^(- 1)$, apart from logarithms.
  The $J$ dilation has dimension $2 \| cal(P)_0 ∩ Q \| lt.eq C_d t^(- 6 d)$, and $dim cal(H)_T lt.eq C_d t^(- 6 d)$. Each lag test has dimension two and each row-proxy test dimension one; their total number is at most $C_d t^(- 6 d)$. The sum of all dimension prefactors in the concentration bound is consequently at most $C_d t^(- 6 d)$, independent of $N$. The union over these local tests has probability at most $e^(- t^(- c))$, after decreasing $c > 0$ and increasing the dimension-dependent starting scale. There is no union over the entire torus in this single-trial bound.
  Suppose now that the trial fails at prefix $tau$, but no local budget is violated there. Earlier accepted trials never crossed either test, and all earlier current prefixes satisfy validity. Thus every included update, including the one at $tau$, has a valid prestate. The accepted earlier endpoint records satisfy the local budgets, and by hypothesis so does the current record at $tau$. Their physical pivots are distinct by the record convention following (68). Lemma 23 therefore puts the poststate at $tau$ strictly inside all four mutable caps, contradicting the definition of $tau$. Every trial failure thus includes a local budget crossing; a simultaneous violation of a local budget and a mutable cap is already counted in that event. The local crossing estimate proves the lemma. ◻
]

The same estimate applies after any number of failed retries whenever each retry is supplied with a new independent permutation and fresh scalar inputs satisfying the conditional moment interface. The indexed auxiliary signs supply these inputs for the digit sweeps. Each retry begins from the restored valid numerical pre-tile state, while its law is taken with respect to the larger retained history. Let $cal(F)_T$ be the retained pre-tile history and set $p_(upright("fail")) = exp { - t^(- c) } < 1$. For each fixed attempt number $a$, stop at the first of the start of attempt $a$ and completion of the tile by an earlier attempt. This stopping time of the retained filtration is almost surely finite: before it there are at most $a - 1$ attempted trials, each with at most $M$ slots. Assign the $a$-th failure indicator value zero when an earlier attempt has completed the tile. The conditional failure bound then holds at every such stopped history, using Lemma 25 when attempt $a$ is scheduled and the zero indicator otherwise. Successive conditioning gives

$ bb(P) \( upright("the next ") k upright(" trials all fail") divides cal(F)_T \) lt.eq p_(upright("fail"))^k = e^(- k t^(- c)) . $

Hence a tile has infinitely many failures with probability zero. There are finitely many tiles at a fixed sweep, so any such supplied retry process terminates almost surely. The actual construction uses this retry conclusion for digit sweeps before the cutoff and uses the first-trial estimate after the cutoff, including the final sweep. This argument conditions only on histories already reached; no estimate within a trial conditions on its eventual acceptance.

=== 5.6 The endpoint of an ordinary sweep <the-endpoint-of-an-ordinary-sweep>

We have proved that accepted locally monitored trials maintain all four mutable caps. The remaining task is to express a completed sweep in the physical normalization at the smaller damping scale.

#thm([Proposition 5.8.])[
  (Ordinary sweep).  #emph[Suppose a committed stage state satisfies the complete stage-boundary bounds of Section 2, including the broad bounds and comparators (7), the self-consistency relation $r_i = g_(i i)$, the fourth-power bound $H_(*) = t^(1 + delta)$, the boundary cap $parallel K_(upright("old")) parallel lt.eq 1 \/ 3$, and (61). Assume also that at least $N \/ 2$ physical sites are active, where $N$ is the torus volume, and assume the conditional slot and scalar interface above. Let $theta in \[ .25 \, .625 \]$ be the reserve fraction, so the new damping scale is $t' = theta t$. This includes $theta = t_(n + 1) \/ t_n$ at ordinary stages and $theta = 1 \/ 2$ in the final residual sweep. Set $w = 1 - theta$ and use port weights $k_(upright("bit")) = w^(1 \/ 4)$, $k_(upright("reserve")) = theta^(1 \/ 4)$ in Lemma 11. Queried variables in port normalization are real variables satisfying the conditional moment and size assumptions above. If every failed trial is followed by a retry supplied with a new independent permutation and fresh inputs satisfying this interface, the trial process terminates almost surely. The indexed auxiliary signs supply these retries for digit sweeps; the actual final sweep instead aborts at its first failure. Every completed sweep leaves the terminal set unchanged and has the following endpoint bounds, with $r \, p$ frozen in physical normalization: 
$ X_(upright("new")) & = \( 1 + O \( t^(.10 delta) \) \) #scale(x: 120%, y: 120%)[\[] theta X_(upright("old")) + \( 1 - theta \) "diag" \( p^(- 2) \) #scale(x: 120%, y: 120%)[\]] \,\
parallel K_(upright("new")) parallel & lt.eq parallel K_(upright("old")) parallel + t^(.10 delta) \,\
sup_i \| g_(i i)^(upright("new")) - r_i \| & lt.eq C t^beta \,\
sup_i sum_j \| h_(i j)^(upright("new")) \|^4 & lt.eq #scale(x: 120%, y: 120%)[\(] theta^2 + C t^(.0005 delta) #scale(x: 120%, y: 120%)[\)] t^(1 + delta) < .7 \( theta t \)^(1 + delta) . $

 The first line denotes two-sided quadratic-form bounds on neutral charges. A first trial at any tile fails conditionally with probability at most $e^(- t^(- c))$.]
  #emph[In particular, with $b' = theta b$, the lower and low-frequency constants in (7) change by relative $1 + O \( t^(.10 delta) \)$; the rough diagonal upper constant becomes at most $\( 1 + O \( t^(.10 delta) \) \) \( theta C_0 + C \)$; and the sharp diagonal upper coefficient becomes $1 + theta t^kappa + O \( t^(.10 delta) \)$.]
] <prop:ordinary-sweep>

#proof[
  Lemma 25 and successive conditioning prove the stated conditional retry termination. Lemma 23 and the stopping rule maintain the mutable caps along every accepted sweep, using Lemma 21 through each candidate breaking update. The exact padded Schur identities then give the $K$ estimate. The two-sided $L$ cap keeps $D_0 + L^(upright("sw"))$ comparable to $D_0$, with only the constant kernel, so Schur duality gives multiplicative transport of $X$ on survivor-supported neutral charges. The only surviving ports are reserve ports, and on those ports
  $ h_(upright("cur")) = sqrt(theta t) thin g^(upright(p h y s \, n e w)) \, #h(2em) p_(upright("cur")) = sqrt(theta) thin p^(upright("phys")) \, #h(2em) X^(upright(p h y s \, n e w)) = theta X_(upright("cur")) . $
  For a neutral physical charge $y$ placed on the reserve ports, the exact initial identity (31) reads
  $ theta X_0 \( y_(upright("res")) \) = theta X_(upright("old")) \( y \) + \( 1 - theta \) sum_i frac(\| y_i \|^2, p_i^2) . $
  Combining these two formulas with the multiplicative transport proves the first assertion. Applying each old comparison separately yields the three stated new coefficients. In particular the sharp coefficient follows from $theta \( 1 + t^kappa \) + \( 1 - theta \) = 1 + theta t^kappa$.
  Lemma 13 gives the actual virtual diagonal difference $g_(i i)^(upright("cur")) - r_i = O \( t^beta \)$; division by the reserve factor $sqrt(theta)$ preserves that bound physically. The reserve-row conclusion of Lemma 23 is $\( theta^2 + C t^(.0005 delta) \) H_(*)$: its fixed proxy bounds the possible increase after discarding favorable removed-column losses. At the endpoint the virtual $h$ is already the new physical $h$. Finally, $sup_(.25 lt.eq theta lt.eq .625) theta^(1 - delta) < .7$, so the strict last inequality holds for small $t$. ◻
]

After the cutoff the actual construction requires that no active site is pending and aborts at any later first-trial failure. On a retained history that reaches and completes the final residual sweep without abort, every accepted final update therefore uses the whole true suffix; no auxiliary retry contributes to the certificate endpoint. Its law is used at its retained pre-query history, before final acceptance is known. With $t = 2 eta$ and $w = 1 \/ 2$, the physical update is $xi_i + eta r_i$: it inserts the complete true suffix and changes the artificial term from $- 2 eta r_i$ to $- eta r_i$. Terminal sites already have their true values. Thus all physical potentials at this endpoint are the original true values, while the remaining active sites are still active and retain the damping $- eta "diag"_A r$.

== 6 Clearing a small pending component <sec:clearing>

An ordinary sweep can leave active sites marked pending. Their partial potentials may contain auxiliary digits, and a failed trial may already have exposed true digits that cannot be used again as fresh inputs. A successful clearing completes a small component of pending sites to its true values and removes its damping. The estimate for this completion must hold for the true values obtained, without a freshness assumption on the core.

The preparation uses true residuals at selected exterior sites. To explain the selection, we first identify the directions through which completing the core can change its exterior. This gives a projection bound that suffices for completion. We then show that the whole relevant range is spatially localized, and construct the projection bound by a stopped sequence of exterior exposures. The result in this section is conditional on explicit local geometry and residual laws. Section 7 verifies those inputs for the scheduled pending components and combines the successful changes.

Fix the dimension $d gt.eq 3$. Throughout this section the damping scale $t$ and the vector $r$ are fixed; constants may depend on $d$, but not on the torus volume or on the particular component. The current active inverse is

$ g = \( M - t "diag" r \)^(- 1) \, #h(2em) M = M^top in bb(R)^(A times A) \, #h(2em) h = sqrt(t) thin g \, $

where $M$ includes the Schur complement of the true terminal sites. Write $p_i = Im r_i$ and assume the fixed broad bounds

#[#set math.equation(numbering: n => "(72)")
 $ \| r_i \| lt.eq C \, #h(2em) c lt.eq p_i lt.eq C . $ <eq:clearing-broad>]

Split the active sites into a fixed core $B$ and its current exterior $R = A \\ B$. During preparation, exterior sites can be removed from the trial’s active set. The direct partial potential values on $B$ stay uncompleted until the final core change, but eliminating an exterior site changes inverse entries involving $B$ and hence the current scattering cross block.

We use the parameters

#[#set math.equation(numbering: n => "(73)")
 $ delta = .01 \, #h(2em) nu = 10^(- 5) delta \/ d \,\
beta_w = .36 delta \, #h(2em) e_0 = .44 delta \, #h(2em) e_h = .46 delta \,\
H_(*) = t^(1 + delta) \, #h(2em) r_(*) = t^(- nu) \, #h(2em) l_(*) = t^(1 + e_0) \, #h(2em) n_h = floor.l t^(- 1 - e_h) floor.r . $ <eq:clearing-parameters>]

The empty core needs no change. For the main development assume $1 lt.eq \| B \| lt.eq r_(*)$; the stopped trial below includes the empty case.

For a terminal set $T$, give every nearest-neighbor edge touching $T$ cost zero and every other such edge cost one. Let $d_T$ be the resulting shortest-path pseudometric. A nonlocal entry created by eliminating a connected terminal component joins active sites at zero $d_T$-distance. For a set $B$, put $d_T \( i \, B \) = min_(b in B) d_T \( i \, b \)$.

=== 6.1 The scattering range and the completion target <the-scattering-range-and-the-completion-target>

Write $D_p = "diag" \( p \)$ and define

#[#set math.equation(numbering: n => "(74)")
 $ S = I + 2 i t D_p^(1 \/ 2) g D_p^(1 \/ 2) . $ <eq:clearing-scattering>]

The matrix $S$ is symmetric and unitary. Indeed, for $Z = D_p^(1 \/ 2) g D_p^(1 \/ 2)$ the Ward identity gives $"Im" Z = t Z Z^(*)$, and hence

$ S S^(*) = I + 2 i t \( Z - Z^(*) \) + 4 t^2 Z Z^(*) = I . $

Write

$ cal(C) = S_(R B) \, #h(2em) Pi = Pi_("ran" cal(C)) $

for the scattering cross block and the orthogonal projection onto its range in $bb(C)^R$. Its diagonal has the concrete meaning

$ Pi_(i i) = sup_(v in "ran" cal(C) \, med parallel v parallel = 1) \| v_i \|^2 \, $

with value zero when the range is zero. Thus a small diagonal means that no unit vector in the cross-block range can concentrate at one exterior site. The next lemma shows why this is the condition needed to complete the core.

#thm([Lemma 6.1.])[
  (Core completion from its scattering range).  #emph[Consider an active split $B \, R$, with $R eq.not diameter$, frozen positive bounded $p$, damping $t$, and $\| B \| lt.eq r_(*)$. Suppose every relevant true terminal principal matrix is invertible and the projection $Pi$ onto $"ran" cal(C)$, where $cal(C) = S_(R B)$, satisfies $Pi_(i i) lt.eq 2 l_(*)$. Set the potential on $B$ to its true value, remove its damping, and eliminate $B$. The new survivor inverse $g'$ exists. Write $Delta g = g' - g_(R R)$, $Delta h = sqrt(t) thin Delta g$, and $Delta S = S' - S_(R R)$, where $S'$ is the scattering matrix of the new survivor inverse. Then 
$ parallel Delta S parallel lt.eq 2 \, #h(2em) Delta S = Pi Delta S overline(Pi) \, $

 and 
#[#set math.equation(numbering: n => "(75)")
 $ max_(i \, j in R) \| Delta g_(i j) \| & lt.eq C t^(e_0) \, & max_(i in R) sum_(j in R) \| Delta h_(i j) \|^2 & lt.eq C t^(e_0) \,\
max_(i in R) sum_(j in R) \| Delta h_(i j) \|^4 & lt.eq C t^(1 + 3 e_0) \, & sum_(i \, j in R) \| Delta h_(i j) \|^2 & lt.eq C r_(*) \/ t . $ <eq:assembly-core-rows>]

 These bounds are deterministic for every true core completion satisfying the stated invertibility hypothesis.]
] <lem:core-completion>

#proof[
  Let $T_0$ denote the existing terminal set. The true principal matrices on $T_0$ and on $T_0 union B$ are invertible. Eliminating the latter set therefore produces a real symmetric survivor matrix with damping $t "diag" \( p_R \)$, whose inverse exists by dissipativity. Reversing these Schur eliminations shows that the full active matrix, with the new diagonal on $B$, is invertible as well.
  Let $V$ be its diagonal change on $B$; its entries include the removal of $- t r_i$. In particular $Im V_(i i) = t p_i > 0$ and $V$ is invertible. The finite-dimensional resolvent identity gives
  #[#set math.equation(numbering: n => "(76)")
   $ Delta g = - g_(R B) \( I + V g_(B B) \)^(- 1) V g_(B R) . $ <eq:clearing-core-resolvent>]
  To see that the middle inverse exists, write $cal(M) = g^(- 1)$ for the old active matrix and $E_B : bb(C)^B arrow.r bb(C)^(B union R)$ for coordinate inclusion. The finite-rank determinant identity gives
  $ det \( cal(M) + E_B V E_B^top \) = det \( cal(M) \) det \( I + V g_(B B) \) \, $
  and both full determinants are nonzero. Thus no estimate on the norm of this middle inverse is assumed.
  The old scattering matrix $S$ is symmetric unitary. Its $R$ block $S_(R R)$ is a contraction, whereas the new survivor scattering matrix $S'$ is symmetric unitary. Hence $Delta S = S' - S_(R R)$ satisfies $parallel Delta S parallel lt.eq 2$. Since $g_(B R) = g_(R B)^top$, (76) yields
  $ Delta S = cal(C) C_(*) cal(C)^top \, #h(2em) cal(C) = S_(R B) \, $
  where the coefficient $C_(*)$ incorporates the invertible diagonal $p_B$ factors. Its size is irrelevant. Left range inclusion gives $Pi Delta S = Delta S$. Transposing this equality and using $Delta S^top = Delta S$ gives $Delta S Pi^top = Delta S$. An orthogonal projection is Hermitian, so $Pi^top = overline(Pi)$; thus
  #[#set math.equation(numbering: n => "(77)")
   $ Delta S = Pi Delta S overline(Pi) . $ <eq:clearing-core-support>]
  The conjugation on the right is necessary for a generally complex range. The two projections have the same real diagonal. Cauchy–Schwarz and the operator norm bound imply
  $ \| Delta S_(i j) \| lt.eq 2 sqrt(Pi_(i i) Pi_(j j)) lt.eq 4 l_(*) . $
  Similarly, $Delta S Delta S^(*) lt.eq 4 Pi$ gives $sum_j \| Delta S_(i j) \|^2 lt.eq 4 Pi_(i i) lt.eq 8 l_(*)$. The factorization has rank at most $\| B \|$, whence $parallel Delta S parallel_(upright("HS"))^2 lt.eq 4 \| B \|$.
  Finally,
  $ Delta S = 2 i sqrt(t) thin sqrt(p_R) thin Delta h thin sqrt(p_R) . $
  Bounded positive $p$ gives respectively $max \| Delta h_(i j) \| lt.eq C l_(*) \/ sqrt(t) = C sqrt(t) thin t^(e_0)$, $max_i sum_j \| Delta h_(i j) \|^2 lt.eq C l_(*) \/ t = C t^(e_0)$, and $sum_(i j) \| Delta h_(i j) \|^2 lt.eq C \| B \| \/ t$. The fourth-power row sum is at most the largest squared entry times the row square sum, namely $C t^(1 + 2 e_0) t^(e_0)$. This proves (75)–(75). ◻
]

The middle coefficient in the core resolvent factorization can be large. The proof controls the resulting scattering change by its operator norm and its range instead. This explains why the raw row norms of $cal(C)$ are insufficient: a small singular amplitude can still correspond to a range direction concentrated at one exterior site. We must control the full range, including every nonzero singular direction. The exterior equation gives that range a spatial bound before any diagonal lag or comparison estimate is imposed.

=== 6.2 Localization of the full scattering range <localization-of-the-full-scattering-range>

#thm([Lemma 6.2.])[
  (Localization of the full scattering range).  #emph[Let $B \, R$ split the active sites of a matrix obtained by eliminating true terminal sites, and suppose the active damping is $t "diag" \( p \)$ with $c lt.eq p_i lt.eq C$. For $cal(C) = S_(R B)$ and the orthogonal projection $Pi$ onto $"ran" cal(C)$, there is $a > 0$, depending only on the fixed bounds and on $d$, such that 
#[#set math.equation(numbering: n => "(78)")
 $ Pi_(i i) lt.eq C exp { - 2 a t \( d_T \( i \, B \) - 1 \)_(+) } \, #h(2em) i in R . $ <eq:clearing-projection-decay>]

 This assertion requires no bound on $g_(i i)$, $K$, or the inverse energy form, and no lower bound on the nonzero singular values of $cal(C)$.]
] <lem:clearing-range-localization>

#proof[
  Write $cal(M) = M - t "diag" \( r \)$, so $g = cal(M)^(- 1)$. The exterior block is dissipative: for every $z in bb(C)^R$,
  $ - Im chevron.l z \, cal(M)_(R R) z chevron.r = t sum_(i in R) p_i \| z_i \|^2 gt.eq c t parallel z parallel^2 . $
  Cauchy–Schwarz implies $parallel cal(M)_(R R) z parallel gt.eq c t parallel z parallel$, and hence $cal(M)_(R R)$ is invertible with $parallel cal(M)_(R R)^(- 1) parallel lt.eq C \/ t$. For any coefficient vector $z in bb(C)^B$, the vector $w = g_(R B) z$ obeys
  #[#set math.equation(numbering: n => "(79)")
   $ cal(M)_(R R) w = - cal(M)_(R B) g_(B B) z = : f . $ <eq:clearing-exterior-equation>]
  Every nonzero off-diagonal entry of $M$ is either a direct lattice hop or comes from the terminal Schur correction. The latter correction is block supported on active neighbors of a connected terminal component: the terminal matrix and its inverse are block diagonal by those components. Any two such neighbors have collapsed distance zero. Consequently the source $f$ is supported on ${ i : d_T \( i \, B \) lt.eq 1 }$.
  Let $rho_i = \( d_T \( i \, B \) - 1 \)_(+)$ and let $cal(E)$ be multiplication by $e^(a t rho_i)$. Then $cal(E) f = f$. The function $rho$ is one-Lipschitz in the collapsed pseudometric. The diagonal and every terminal Schur entry commute with $cal(E)$, including arbitrarily large Schur entries. Only direct hopping entries can contribute to
  $ E_a = cal(E) cal(M)_(R R) cal(E)^(- 1) - cal(M)_(R R) . $
  For each such entry, $\| rho_i - rho_j \| lt.eq 1$, so its change is at most $e^(a t) - 1 lt.eq C a t$ for $t lt.eq 1$. There are at most $2 d$ direct neighbors in each row and column. The absolute row and column sum bounds therefore give $parallel E_a parallel lt.eq C_d a t$. Using (79) now gives the exact identity
  $ \( cal(M)_(R R) + E_a \) cal(E) w = f = cal(M)_(R R) w \, #h(2em) cal(E) w = w - cal(M)_(R R)^(- 1) E_a cal(E) w . $
  Choose $a > 0$ so small that $parallel cal(M)_(R R)^(- 1) E_a parallel lt.eq 1 \/ 2$. Absorption proves
  #[#set math.equation(numbering: n => "(80)")
   $ parallel cal(E) w parallel lt.eq 2 parallel w parallel #h(2em) \( w in "ran" g_(R B) \) . $ <eq:clearing-range-weight>]
  All matrices are finite, so no domain issue arises from the exponential weight. Crucially, the right side is the norm of $w$ itself, not the norm of a vector used to represent it.
  Because $cal(C) = 2 i t sqrt(p_R) thin g_(R B) sqrt(p_B)$, the matrix $sqrt(p_B)$ is invertible, and $sqrt(p_R)$ commutes with $cal(E)$, bounded positive $p$ transfers (80) to $parallel cal(E) v parallel lt.eq C parallel v parallel$ for all $v in "ran" cal(C)$. Thus $\| v_i \| lt.eq C e^(- a t rho_i) parallel v parallel$ on this entire range. The squared norm of coordinate evaluation on $"ran" cal(C)$ is $Pi_(i i)$; equivalently, $Pi_(i i) = sup_(v in "ran" cal(C) \, thin parallel v parallel = 1) \| v_i \|^2$. This proves (78). When $cal(C) = 0$ the projection is zero and the same conclusion holds. Rank deficiency and arbitrarily small positive singular values never entered the estimate. ◻
]

#thm([Corollary 6.3.])[
  (Spatial decay of a core completion).  #emph[Under the hypotheses of Lemma 27, let $d_T$ be the collapsed distance immediately before completion. The same survivor change satisfies 
#[#set math.equation(numbering: n => "(81)")
 $ \| Delta h_(i j) \| lt.eq C t^(- 1 \/ 2) exp { - a t \[ \( d_T \( i \, B \) - 1 \)_(+) + \( d_T \( j \, B \) - 1 \)_(+) \] } . $ <eq:clearing-core-decay>]

]
] <cor:core-decay>

#proof[
  In the support identity (77), use Lemma 28 at both endpoints in place of the uniform bound $Pi_(i i) lt.eq 2 l_(*)$. The estimate $\| Delta S_(i j) \| lt.eq 2 sqrt(Pi_(i i) Pi_(j j))$ and $Delta S = 2 i sqrt(t) thin sqrt(p_R) thin Delta h thin sqrt(p_R)$ give the result. ◻
]

The same range estimate will locate the exterior exposures used to reach the projection bound. We now construct that bound while controlling the accumulated change of the inverse.

=== 6.3 Exterior heats and regularized projection weights <subsec:clearing-algebra>

An exterior update, called a heat step, replaces the partial potential at one exterior site $x$ by its true value and removes that site from the trial’s active set. Such removal remains provisional until the clearing is committed; rollback restores the pretrial matrix and partial potential data while retaining the revealed values in the history. If its unexposed true residual is $xi$, the change of its diagonal in the damped matrix is $xi + t r_x$. The conditional hypotheses on the residual are

#[#set math.equation(numbering: n => "(82)")
 $ bb(E) \( xi divides cal(F) \) = 0 \, #h(2em) bb(E) \( xi^2 divides cal(F) \) = t - eta \, #h(2em) \| xi \| lt.eq C sqrt(t) \, #h(2em) eta \/ t lt.eq C t . $ <eq:clearing-residual>]

Here $cal(F)$ is the recorded history before the site is inspected. The selection of $x$ must be $cal(F)$-measurable. For the scheduled components, Section 7 combines the pivot geometry with Lemma 4 to verify these hypotheses.

There are two distinct sets of state bounds in the argument. At the beginning of a component trial we have fourth-power row slack and a small diagonal lag. At a provisional heat prefix we use only

#[#set math.equation(numbering: n => "(83)")
 $ max_i \| g_(i i) - r_i \| lt.eq C t^(beta_w) \, #h(2em) max_i sum_j \| h_(i j) \|^4 lt.eq H_(*) . $ <eq:clearing-prestate>]

Together with (72), Ward’s identity gives

#[#set math.equation(numbering: n => "(84)")
 $ sum_j p_j \| h_(i j) \|^2 = Im g_(i i) \, #h(2em) max_i sum_j \| h_(i j) \|^2 lt.eq C . $ <eq:clearing-row-bound>]

The provisional estimates below use no bound on $K$ and no comparison of the Laplacian $D$ with a reference form. Section 7 transports those comparisons for the resulting committed operation.

At each heat the core $B$ remains fixed, but its current exterior $R$ and the cross block $cal(C) = S_(R B)$ change. Write $S_B = S_(B B)$ and set

$ Gamma = cal(C)^(*) cal(C) . $

Unitarity gives $Gamma = I - S_B^(*) S_B$. For a ridge parameter $tau > 0$, define

#[#set math.equation(numbering: n => "(85)")
 $ G_tau = Gamma + tau I \, #h(2em) U = cal(C) G_tau^(- 1 \/ 2) \, #h(2em) m_i = parallel u_i parallel^2 quad \( i in R \) \, $ <eq:clearing-ridge>]

where $u_i$ is the $i$-th row of $U$. Equivalently, $m_i$ is the $i$-th diagonal entry of

$ cal(C) \( cal(C)^(*) cal(C) + tau I \)^(- 1) cal(C)^(*) . $

These entries are the standard ridge leverage scores #cite(label("ElAlaouiMahoney2015")) Section 3.3, Definition 1; here we use them to select predictable exterior residual exposures while the ridge decreases toward the full range projection.

To see exactly what the regularization retains, write a singular-value decomposition $cal(C) = sum_(alpha : sigma_alpha > 0) sigma_alpha v_alpha w_alpha^(*)$, with orthonormal left and right singular vectors. Then

$ cal(C) \( Gamma + tau I \)^(- 1) cal(C)^(*) = sum_(alpha : sigma_alpha > 0) frac(sigma_alpha^2, sigma_alpha^2 + tau) v_alpha v_alpha^(*) . $

As $tau arrow.b 0$, every nonzero singular direction receives weight one, including directions with arbitrarily small singular value. The matrix therefore increases to $Pi_("ran" cal(C))$, and each $m_i$ is at most the corresponding projection diagonal. No zero singular direction contributes. For fixed $cal(C)$, each $m_i$ is continuous for $tau > 0$ and

$ frac(d, d tau) m_i \( tau \) = - cal(C)_i \( Gamma + tau I \)^(- 2) cal(C)_i^(*) lt.eq 0 . $

Thus decreasing the ridge increases the regularized weights continuously toward the completion target.

Put

$ m_(*) = max_(i in R) m_i \, #h(2em) cal(A) = sum_(i in R) m_i \, #h(2em) cal(P) = sum_(i in R) m_i^2 . $

If $R$ is empty, the maximum is zero. The matrices

#[#set math.equation(numbering: n => "(86)")
 $ Q = U^(*) U \, #h(2em) V_tau = I - Q = tau G_tau^(- 1) $ <eq:clearing-ridge-defect>]

satisfy $0 lt.eq Q \, V_tau lt.eq I$, so $cal(A) = "Tr" Q lt.eq "rank" cal(C) lt.eq \| B \| lt.eq r_(*)$.

Whenever the maximum regularized weight is at least $2 l_(*)$ and at most $4 l_(*)$, the procedure heats a site of maximum weight, chosen from the recorded history before its residual is inspected. Removing that pivot deletes its contribution $m_(*)^2$ from $cal(P)$; the issue is to show that redistribution to the surviving rows is smaller. Maximality also gives $m_i lt.eq m_(*)$ in the estimates for that redistribution. The next lemma establishes this fixed-ridge drift under the provisional prestate bounds.

A heat holds the scalar $tau$ fixed, changes the damped diagonal at its chosen site $x$ by $xi + t r_x$, and provisionally eliminates $x$ as a true terminal. The standing invertibility of true terminal principal matrices makes the elimination well-defined. The new cross block is recomputed from the new active inverse at the same scalar ridge. Use primes for quantities on $R' = R \\ { x }$.

#thm([Lemma 6.4.])[
  (Conditional leverage drift).  #emph[Suppose the active inverse $g$, with frozen $r \, p$, satisfies 
$ \| g_(i i) \| + \| r_i \| lt.eq C \, #h(2em) c lt.eq p_i lt.eq C \, #h(2em) \| g_(i i) - r_i \| lt.eq C t^(beta_w) \, #h(2em) sum_j \| h_(i j) \|^4 lt.eq H_(*) $

 at the prestate of a heat, where $h = sqrt(t) thin g$. Suppose $\| B \| lt.eq r_(*)$, $tau > 0$, and $x$ is a predictable maximizer of the ridge leverage, with 
$ 2 l_(*) lt.eq m_x = m_(*) lt.eq 4 l_(*) . $

 Conditionally on this prestate, assume that $xi$ is real and that 
#[#set math.equation(numbering: n => "(87)")
 $ bb(E) xi = 0 \, #h(2em) bb(E) xi^2 = t - eta \, #h(2em) \| xi \| lt.eq C sqrt(t) \, #h(2em) 0 lt.eq eta \/ t lt.eq C t . $ <eq:clearing-residual-moments>]

 If 
#[#set math.equation(numbering: n => "(88)")
 $ 0 lt.eq nu < frac(1 + delta, 2) \, #h(2em) 0 < e_0 < delta - nu \, #h(2em) e_0 / 2 < beta_w < 1 / 2 \, $ <eq:clearing-drift-exponents>]

 then, uniformly over these prestates as $t arrow.b 0$, 
$ \| bb(E) \( cal(A)' - cal(A) \) \| = o \( m_(*) \) \, #h(2em) bb(E) \( cal(P)' - cal(P) \) lt.eq - \( 1 - o \( 1 \) \) m_(*)^2 . $

 These conclusions include an update at which a poststate cap first fails; only the displayed prestate assumptions are required.]
] <lem:leverage-drift>

#proof[
  All expectations in the proof are conditional on the prestate. Write $m = m_(*) = m_x$. The Sherman–Morrison identity gives, on surviving indices,
  #[#set math.equation(numbering: n => "(89)")
   $ h'_(i j) = h_(i j) + c_x h_(i x) h_(x j) \, #h(2em) c_x = - frac(xi + t r_x, sqrt(t) thin { 1 + \( xi + t r_x \) g_(x x) }) . $ <eq:clearing-heat-update>]
  The denominator is bounded away from zero because $g_(x x)$ is bounded and $\| xi + t r_x \| lt.eq C sqrt(t)$. Expansion to second order gives
  $ bb(E) c_x = sqrt(t) thin \( g_(x x) - r_x \) - eta / sqrt(t) g_(x x) + O \( t \) . $
  Here the remainder follows from $bb(E) \| xi + t r_x \|^3 lt.eq C t^(3 \/ 2)$. Since $beta_w < 1 \/ 2$, it follows that
  #[#set math.equation(numbering: n => "(90)")
   $ \| c_x \| lt.eq C \, #h(2em) \| bb(E) c_x \| lt.eq C sqrt(t) thin t^(beta_w) \, #h(2em) bb(E) \| c_x \|^2 = 1 + O \( sqrt(t) + eta \/ t \) . $ <eq:clearing-heat-moments>]
  For $i in R'$, let
  $ v_i = h_(i x) sqrt(p_i \/ p_x) . $
  The Ward identity and the diagonal lag bound show that
  $ sum_(upright("active ") i) \| h_(i x) \|^2 p_i / p_x = frac("Im" g_(x x), p_x) = 1 + O \( t^(beta_w) \) . $
  Each omitted index in $B union { x }$ contributes at most $C sqrt(H_(*))$. Thus
  #[#set math.equation(numbering: n => "(91)")
   $ parallel v parallel^2 = 1 + O \( t^(beta_w) + r_(*) sqrt(H_(*)) \) \, #h(2em) max_i \| v_i \| lt.eq C H_(*)^(1 \/ 4) \, #h(2em) sum_i \| v_i \|^4 lt.eq C H_(*) . $ <eq:clearing-v-bounds>]
  The cross block in the old normalization is, exactly,
  #[#set math.equation(numbering: n => "(92)")
   $ W = cal(C)' G_tau^(- 1 \/ 2) = U_(R') + c_x v u_x . $ <eq:clearing-cross-update>]
  There is no complex conjugate on $u_x$ in this formula, because the resolvent update is symmetric.
  ===== 6.3.1 The unitary cancellation. <the-unitary-cancellation.>
  Define $b_x = U_(R')^(*) v$. The estimate needed for $b_x$ is stronger than the direct bound $parallel U_(R') parallel parallel v parallel$. Orthogonality of the $B$ columns of $S$ to its $x$-th column gives
  $ cal(C)^(*) S_(R x) = - S_B^(*) S_(B x) . $
  Since $S_B$ is symmetric, $overline(Gamma) = I - S_B S_B^(*)$, and $Gamma S_B^(*) = S_B^(*) overline(Gamma)$. Functional calculus therefore gives the intertwining identity
  $ G_tau^(- 1 \/ 2) S_B^(*) = S_B^(*) \( overline(Gamma) + tau I \)^(- 1 \/ 2) . $
  Also $S_(B x) = cal(C)_x^top$, so symmetry gives
  $ parallel \( overline(Gamma) + tau I \)^(- 1 \/ 2) S_(B x) parallel = parallel cal(C)_x G_tau^(- 1 \/ 2) parallel = sqrt(m) . $
  As $parallel S_B parallel lt.eq 1$, we obtain $parallel U^(*) S_(R x) parallel lt.eq sqrt(m)$. For $i in R'$, $S_(i x) = 2 i sqrt(t) thin p_x v_i$. Restoring and then subtracting the $x$-th term in $U^(*) S_(R x)$ yields
  #[#set math.equation(numbering: n => "(93)")
   $ b_x = frac(U^(*) S_(R x) - u_x^(*) S_(x x), 2 i sqrt(t) thin p_x) \, #h(2em) parallel b_x parallel lt.eq C sqrt(m \/ t) . $ <eq:clearing-b-cancellation>]
  ===== 6.3.2 The Gram increment. <the-gram-increment.>
  Set
  $ D_(*) = W^(*) W - Q \, #h(2em) epsilon_t = t^(beta_w) + sqrt(t) + r_(*) sqrt(H_(*)) . $
  Multiplication of (92) gives
  #[#set math.equation(numbering: n => "(94)")
   $ D_(*) = \( \| c_x \|^2 parallel v parallel^2 - 1 \) u_x^(*) u_x + c_x b_x u_x + overline(c_x) u_x^(*) b_x^(*) . $ <eq:clearing-gram-increment>]
  Let $parallel dot.op parallel_1$ denote the trace norm. Equations (90)–(93) imply
  #[#set math.equation(numbering: n => "(95)")
   $ parallel D_(*) parallel_1 lt.eq C m / sqrt(t) \, #h(2em) parallel bb(E) D_(*) parallel_1 lt.eq C m epsilon_t \, #h(2em) "Tr" D_(*)^2 lt.eq C m^2 / t . $ <eq:clearing-gram-bounds>]
  For example, the conditional mean of the two mixed terms is bounded by $2 \| bb(E) c_x \| parallel b_x parallel sqrt(m) lt.eq C m t^(beta_w)$. The final bound follows from $"Tr" D_(*)^2 lt.eq parallel D_(*) parallel_1^2$. Since $m lt.eq 4 t^(1 + e_0)$, we have $parallel D_(*) parallel = o \( 1 \)$, pathwise.
  The new Gram matrix satisfies the exact congruence
  #[#set math.equation(numbering: n => "(96)")
   $ Gamma' + tau I = G_tau^(1 \/ 2) \( I + D_(*) \) G_tau^(1 \/ 2) . $ <eq:clearing-gram-congruence>]
  Indeed, $W^(*) W = Q + D_(*)$ and $tau G_tau^(- 1) = I - Q$. Inverting this congruence shows that the new leverages are
  #[#set math.equation(numbering: n => "(97)")
   $ m'_i = w_i \( I + D_(*) \)^(- 1) w_i^(*) . $ <eq:clearing-leverage-update>]
  No commutation of $D_(*)$ and $G_tau$ is used here.
  ===== 6.3.3 Total leverage. <total-leverage.>
  By cyclicity of the trace and $W^(*) W = Q + D_(*) = I + D_(*) - V_tau$,
  #[#set math.equation(numbering: n => "(98)")
   $ cal(A)' - cal(A) = "Tr" { V_tau \( I + D_(*) \)^(- 1) D_(*) } . $ <eq:clearing-total-leverage>]
  The identity
  $ \( I + D_(*) \)^(- 1) D_(*) = D_(*) - D_(*)^2 \( I + D_(*) \)^(- 1) $
  and $0 lt.eq V_tau lt.eq I$ imply
  $ \| bb(E) \( cal(A)' - cal(A) \) \| lt.eq parallel bb(E) D_(*) parallel_1 + C bb(E) "Tr" D_(*)^2 lt.eq C m \( epsilon_t + t^(e_0) \) = o \( m \) . $
  The quadratic remainder is controlled by $"Tr" D_(*)^2$, without a factor depending on $\| B \|$.
  ===== 6.3.4 Squared leverage. <squared-leverage.>
  It remains to show that the loss of the pivot row dominates the redistribution of leverage among the survivors. Put
  $ d_i = m'_i - m_i \, #h(2em) d_i^0 = parallel w_i parallel^2 - parallel u_i parallel^2 = 2 "Re" \( c_x v_i u_x u_i^(*) \) + \| c_x \|^2 \| v_i \|^2 m . $
  Then
  #[#set math.equation(numbering: n => "(99)")
   $ cal(P)' - cal(P) = - m^2 + 2 sum_(i in R') m_i d_i + sum_(i in R') d_i^2 . $ <eq:clearing-square-decomposition>]
  Since $parallel U parallel lt.eq 1$,
  $ sum_i \| u_x u_i^(*) \|^2 lt.eq m \, #h(2em) sum_i m_i^2 lt.eq m cal(A) lt.eq m r_(*) . $
  Cauchy–Schwarz and (91) therefore give
  #[#set math.equation(numbering: n => "(100)")
   $ lr(|sum_i m_i bb(E) d_i^0|) lt.eq C \| bb(E) c_x \| m sqrt(m) + C m sqrt(r_(*) m H_(*)) . $ <eq:clearing-raw-mean>]
  To handle normalization, expand
  $ \( I + D_(*) \)^(- 1) - I = - D_(*) + D_(*)^2 \( I + D_(*) \)^(- 1) . $
  The first-order term with the old rows has conditional mean bounded by
  $ lr(|"Tr" {(sum_i m_i u_i^(*) u_i) bb(E) D_(*)}|) lt.eq m parallel bb(E) D_(*) parallel_1 \, $
  because $parallel sum_i m_i u_i^(*) u_i parallel lt.eq m$. Replacing the old rows by the updated rows costs at most
  #[#set math.equation(numbering: n => "(101)")
   $ C m sqrt(m) thin parallel D_(*) parallel_1 . $ <eq:clearing-row-replacement>]
  For completeness, if $M_R = "diag" \( \( m_i \)_(i in R') \)$, then
  $ W^(*) M_R W - U_(R')^(*) M_R U_(R') = c_x U_(R')^(*) M_R v u_x + overline(c_x) u_x^(*) v^(*) M_R U_(R') + \| c_x \|^2 \( v^(*) M_R v \) u_x^(*) u_x . $
  Its trace norm is at most $C m sqrt(m) + C m^2 lt.eq C m sqrt(m)$, using $parallel U_(R') parallel lt.eq 1$, $parallel M_R parallel lt.eq m$, and $parallel v parallel lt.eq C$. Taking its trace against $D_(*)$ proves (101). Moreover, $parallel W parallel lt.eq 2$ and $max_i parallel w_i parallel^2 lt.eq C m$. The second-order normalization term consequently costs at most $C m "Tr" D_(*)^2$ after summing with weights $m_i$.
  The square terms in (99) are small as well. Pointwise Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(102)")
   $ sum_i \| d_i^0 \|^2 lt.eq C m sum_i m_i \| v_i \|^2 + C m^2 H_(*) lt.eq C m sqrt(r_(*) m H_(*)) + C m^2 H_(*) . $ <eq:clearing-raw-squares>]
  Write $R_D = \( I + D_(*) \)^(- 1) - I$. Since $R_D$ is Hermitian,
  $ \| w_i R_D w_i^(*) \|^2 lt.eq parallel w_i parallel^2 w_i R_D^2 w_i^(*) . $
  Summing this inequality, and using $parallel R_D parallel_(upright("HS"))^2 lt.eq C "Tr" D_(*)^2$, gives
  #[#set math.equation(numbering: n => "(103)")
   $ sum_i \| d_i - d_i^0 \|^2 lt.eq C m "Tr" D_(*)^2 . $ <eq:clearing-normalization-squares>]
  All the errors just obtained are $o \( m^2 \)$. More explicitly, after division by $m^2$, their bounds are constant multiples of
  $ t^(beta_w - e_0 \/ 2) \, #h(2em) t^(\( delta - e_0 - nu \) \/ 2) \, #h(2em) epsilon_t \, #h(2em) t^(e_0 \/ 2) \, #h(2em) t^(e_0) \, #h(2em) H_(*) . $
  Every exponent is positive under (88). This proves the claimed drift of $cal(P)$. ◻
]

=== 6.4 Lowering the ridge and counting heats <subsec:clearing-ridge-count>

The procedure combines two motions: a fixed-ridge heat redistributes weight while reducing $cal(P)$ in conditional expectation, and a ridge decrease raises the regularized weights toward the projection. To control both with one quantity, define

$ Phi = cal(P) - 10 l_(*) cal(A) . $

During a ridge decrease for which every $m_i lt.eq 2 l_(*)$, each $d m_i$ is nonnegative. Hence

#[#set math.equation(numbering: n => "(104)")
 $ d cal(P) = 2 sum_i m_i thin d m_i lt.eq 4 l_(*) thin d cal(A) \, #h(2em) d Phi lt.eq - 6 l_(*) thin d cal(A) lt.eq 0 . $ <eq:clearing-ridge-monotonicity>]

The same conclusion holds at the zero-ridge limit by continuity. At a heat satisfying Lemma 30, with $m = m_(*) gt.eq 2 l_(*)$, the correction to the squared-weight drift obeys

$ 10 l_(*) \| bb(E) \( cal(A)' - cal(A) \) \| = o \( l_(*) m \) = o \( m^2 \) . $

Combining this with the drift of $cal(P)$ gives, for small $t$,

#[#set math.equation(numbering: n => "(105)")
 $ bb(E) \( Phi' - Phi \) lt.eq - 1 / 2 m_(*)^2 . $ <eq:clearing-phi-drift>]

Thus a ridge decrease contributes no positive drift, while an admissible heat with $2 l_(*) lt.eq m_(*) lt.eq 4 l_(*)$ decreases $Phi$ in conditional expectation by at least $2 l_(*)^2$.

Start with $tau = l_(*)^(- 2)$. Since $cal(C)$ is a block of a unitary matrix, $m_(*) lt.eq tau^(- 1) = l_(*)^2 < 2 l_(*)$. Whenever $m_(*) < 2 l_(*)$, decrease $tau$ until one of two events occurs. If the maximum diagonal of $Pi_("ran" cal(C))$ is at most $2 l_(*)$, declare completion at the zero-ridge limit. Otherwise there is a unique positive ridge at which $m_(*) = 2 l_(*)$, and the decrease stops there. For a nonzero row the displayed derivative of $m_i \( tau \)$ is strictly negative, which proves uniqueness. The ridge is measurable: its comparison with any positive rational is determined by the measurable value of $max_i m_i \( tau \)$ there. The zero-ridge projection is measurable as the pointwise limit of the positive-ridge matrices. At a heat, choose the least site among those of maximum weight. This tie rule makes the pivot predictable.

#thm([Lemma 6.5.])[
  (Number of heats).  #emph[Consider an adapted procedure using the ridge rule above, with heats only at positive ridge and at prestates satisfying Lemma 30. Stop the procedure at completion, at any prescribed failure, or at a prescribed finite heat limit. In particular, no further heat is performed after one of the prestate hypotheses fails. The prescribed stop is a stopping time for the revealed history. Let $sigma$ be any almost surely finite stopping time at which this same procedure has reached a prefix before that stop, with $m_(*) lt.eq 4 l_(*)$. Conditional on the retained history at $sigma$, the expected number $H$ of further heats before this stop is at most 
$ bb(E) H lt.eq C r_(*) / l_(*) . $

 There are constants $c \, C > 0$, independent of the prefix, such that 
$ bb(P) \( H gt.eq n \) lt.eq C exp (- c thin frac(n l_(*), r_(*))) #h(2em) \( n gt.eq 1 \) . $

 In particular, if the prescribed limit is $n_h = floor.l t^(- 1 - e_h) floor.r$ and $e_h > e_0 + nu$, then 
#[#set math.equation(numbering: n => "(106)")
 $ bb(P) \( H gt.eq n_h \) lt.eq C exp { - c thin t^(- \( e_h - e_0 - nu \)) } . $ <eq:clearing-heat-tail>]

]
] <lem:clearing-heat-count>

#proof[
  At this prefix, $cal(P) lt.eq 4 l_(*) cal(A)$, so $Phi lt.eq 0$. At every later endpoint, including one reached by a failing heat,
  $ Phi gt.eq - 10 l_(*) cal(A) gt.eq - 10 l_(*) r_(*) . $
  The latter bound needs neither a leverage cap nor a diagonal cap: it follows from the definition of ridge leverage and $cal(A) lt.eq \| B \|$. The same statement holds at the projection limit. Sum the conditional drift (105) over the heats, including the last heat, and include the nonpositive ridge changes from (104). Stopping first at $H and k$ gives
  $ 2 l_(*)^2 thin bb(E) \( H and k \) lt.eq 10 l_(*) r_(*) . $
  Letting $k$ increase proves the expected-count estimate.
  This estimate holds conditionally after every later reached prefix before stopping, with the same constant. Take a block length $k_(upright("block")) = ceil.l 2 C r_(*) \/ l_(*) ceil.r$, enlarging $C$ if necessary. Conditional Markov inequality bounds the probability of a further block of $k_(upright("block"))$ heats by $1 \/ 2$. On a prefix at which a stop has already occurred the probability is zero. Iterating over blocks therefore gives $bb(P) \( H gt.eq k k_(upright("block")) \) lt.eq 2^(- \( k - 1 \))$, which implies the stated exponential bound after adjusting its constants. Finally,
  $ frac(n_h l_(*), r_(*)) gt.eq c thin t^(- \( e_h - e_0 - nu \)) $
  for sufficiently small $t$, proving (106). ◻
]

For the chosen parameters,

$ beta_w - e_0 / 2 = .14 delta \, #h(2em) delta - e_0 - nu = \( .56 - 10^(- 5) \/ d \) delta \, #h(2em) e_h - e_0 - nu = \( .02 - 10^(- 5) \/ d \) delta $

are all positive. The leverage argument therefore bounds the probability of exhausting the heat limit. It remains to control the other stopping conditions, so that the procedure reaches completion.

=== 6.5 The stopped trial and its local inputs <the-stopped-trial-and-its-local-inputs>

We now state the local input that turns the range estimate into a trial whose probability bound is independent of the torus volume. There is a scale $ell asymp t^(- 4)$ such that, as long as earlier heat pivots lie within ordinary distance $ell \/ 2$ of $B$, the current collapsed distance, and the distance after one further such deletion, satisfy

#[#set math.equation(numbering: n => "(107)")
 $ d_T \( i \, k \) gt.eq 1 / 2 "dist" \( i \, k \) - t^(- 1.03) . $ <eq:clearing-distance-input>]

The core lies in an ordinary-distance ball of radius $t^(- C_(upright("loc")))$, for a fixed $C_(upright("loc"))$. Every exterior site within distance $ell \/ 2$ of $B$ which has not already been deleted is coupled and has a still unexposed true residual. A predictable choice of such a site therefore satisfies (82). These are hypotheses about geometry and recorded information; they contain no provisional bound on $K$ or comparison for $D$.

Here is the selection consequence of the geometric input. By the singular-value formula, a regularized weight is at most its projection diagonal. For $"dist" \( i \, B \) gt.eq ell \/ 2$, Lemma 28 and (107) bound that diagonal by $C exp \( - c t^(- 3) \) < 2 l_(*)$. Consequently

#[#set math.equation(numbering: n => "(108)")
 $ m_x = m_(*) gt.eq 2 l_(*) quad arrow.r.double quad "dist" \( x \, B \) < ell \/ 2 . $ <eq:clearing-proposed-location>]

Starting with no earlier pivots, this implication proves location inductively whenever the stated metric input is available under the preceding-location hypothesis. It applies to the pivot chosen before a first breaking heat. The input for the distance after that deletion will also control its prospective output. Section 7 supplies this geometric input for the scheduled components.

For bookkeeping, keep a matrix $hat(h)$ indexed by the sites active at trial start. A pair of entries is frozen immediately before the first of its two endpoints is removed. Only survivor–survivor entries receive a heat increment. Put $hat(g) = hat(h) \/ sqrt(t)$, and write $h^0 \, g^0$ for the trial-start matrices. Thus each original row of $hat(h) - h^0$, and the whole matrix viewed as a vector, has a fixed index set throughout the trial. The three distortion budgets are

#[#set math.equation(numbering: n => "(109)")
 $ max_(i \, k) \| hat(g)_(i k) - g_(i k)^0 \| & lt.eq t^(.42 delta) \,\
max_i sum_k \| hat(h)_(i k) - h_(i k)^0 \|^2 & lt.eq t^(.25 delta) \,\
sum_(i \, k) \| hat(h)_(i k) - h_(i k)^0 \|^2 & lt.eq n_h t^(- .01 delta) . $ <eq:clearing-budgets>]

If $B$ is empty, declare DONE without changing the state. Otherwise the trial starts at ridge $tau = l_(*)^(- 2)$. If the maximum ridge leverage is below $2 l_(*)$, lower the ridge to the first value where the maximum equals $2 l_(*)$; if the zero-ridge projection already has maximum leverage at most $2 l_(*)$, stop with outcome DONE. Otherwise choose an exterior site of maximum regularized weight, using a fixed ordering to break ties, perform one heat step, and recompute the cross block and its leverages at the same scalar ridge. Stop with outcome FAIL if a distortion budget is exceeded, if a leverage exceeds $4 l_(*)$, or if $n_h$ heats have been performed. Repeat the ridge lowering and heating rule until one of these outcomes occurs. True values exposed during a trial are part of the recorded history even when the state is later rolled back.

Call the state just before a heat performed by this rule a #emph[running heat prestate]. Its three distortion budgets and leverage cap still hold, fewer than $n_h$ heats have been performed, and the rule has selected a positive ridge with $2 l_(*) lt.eq m_(*) lt.eq 4 l_(*)$. These are exactly the conditions under which the stopped rule performs another heat. The budget argument below derives (83) at these states from the starting slack. Write $cal(F)_0$ for the retained history at trial start.

#thm([Proposition 6.6.])[
  (Preparation of a small component).  #emph[Assume (72), the geometry and conditional residual inputs just stated, and $1 lt.eq \| B \| lt.eq r_(*)$. At trial start suppose 
#[#set math.equation(numbering: n => "(110)")
 $ max_i sum_k \| h_(i k)^0 \|^4 lt.eq .8 H_(*) \, #h(2em) max_i \| g_(i i)^0 - r_i \| = o \( t^(beta_w) \) \, $ <eq:clearing-start>]

 uniformly over the input states under consideration. Assume also that every true terminal principal matrix at the fixed energy is invertible. For all sufficiently small $t$, the stopped trial is measurable and satisfies 
$ bb(P) \( upright("FAIL") divides cal(F)_0 \) lt.eq exp \( - t^(- c_2) \) $

 for a fixed $c_2 > 0$. The constants are independent of the torus volume and of the component. On DONE, fewer than $n_h$ exterior sites carry their true values and are provisionally removed, the budgets (109) hold, and 
#[#set math.equation(numbering: n => "(111)")
 $ max_(i in R) \( Pi_("ran" cal(C)) \)_(i i) lt.eq 2 l_(*) . $ <eq:clearing-projection-output>]

 Here $cal(C) = S_(R B)$ is formed from the final active inverse before completion of $B$. Thus DONE is the successful preparation outcome. The subsequent deterministic core completion and the single successful commit are specified with the clearing schedule in Section 7.]
] <prop:clearing-trial>

The uniform little-oh in (110) is supplied by committed-state assembly. In the proof of Proposition 32 it is used only to obtain (83) from the entry budget. We next verify every other stopping probability. All estimates are stopped at the first failure and continued afterwards by zero increments; the step which first causes failure is included.

=== 6.6 Distinct pivots and the distortion budgets <distinct-pivots-and-the-distortion-budgets>

The deterministic consequences of the budgets are useful before applying concentration. First,

#[#set math.equation(numbering: n => "(112)")
 $ sum_k \| hat(h)_(i k) - h_(i k)^0 \|^4 lt.eq max_k \| hat(h)_(i k) - h_(i k)^0 \|^2 sum_k \| hat(h)_(i k) - h_(i k)^0 \|^2 lt.eq t^(1 + 1.09 delta) . $ <eq:clearing-fourth-distortion>]

The triangle inequality in $ell^4$, the initial factor $.8$, and the positive margin $.09 delta$ imply the fourth-power part of (83). The entry budget and (110) imply its lag part. Thus those provisional hypotheses hold at every running heat prestate.

For a fixed original site $i$, sum over pivots $x$ for which $i$ is still active immediately before the corresponding heat. Each summand is evaluated at that prestate. Distinctness of the pivots and the previous entry budgets imply, through a prospective breaking step,

#[#set math.equation(numbering: n => "(113)")
 $ sum_x F_(i x)^2 lt.eq C sum_x \| h_(i x)^0 \|^4 + C n_h t^(2 + 1.68 delta) lt.eq C \( H_(*) + t^(1 + 1.22 delta) \) lt.eq C H_(*) . $ <eq:clearing-pivot-fourth>]

The first sum uses only the corresponding distinct columns of the initial row. This is why a bound on the current row alone would not have been enough. Cauchy–Schwarz now gives the pathwise predictable budget

#[#set math.equation(numbering: n => "(114)")
 $ B_i := sum_x F_(i x) lt.eq C sqrt(n_h H_(*)) lt.eq C t^(.27 delta) . $ <eq:clearing-pivot-mass>]

For reference, the heat increment on surviving pairs is

#[#set math.equation(numbering: n => "(115)")
 $ Delta hat(g)_(i k) = c_x / sqrt(t) h_(i x) h_(x k) \, #h(2em) Delta hat(h)_(i k) = c_x h_(i x) h_(x k) . $ <eq:clearing-entry-increment>]

Entries with a removed endpoint have zero increment. The conditional mean of $c_x$ is $O \( sqrt(t) thin t^(beta_w) \)$, its absolute value is bounded, and the Ward row bound (84) is available at the prestate. For a fixed entry, summing its conditional means in absolute value costs

$ C t^(beta_w) sum_x sqrt(F_(i x) F_(k x)) lt.eq C t^(beta_w) sqrt(B_i B_k) . $

The conditional variance sum is at most

$ C / t sum_x F_(i x) F_(k x) lt.eq C H_(*) \/ t \, $

by (113), and each jump is at most $C sqrt(H_(*) \/ t) = C t^(delta \/ 2)$.

For a fixed row regarded as a vector, its increment has norm at most $C \| h_(i x) \|$; the same estimate with $C$ replaced by $C sqrt(t) thin t^(beta_w)$ bounds its conditional mean. Consequently the total mean norm, predictable variance, and maximum jump are bounded respectively by

$ C sqrt(t) thin t^(beta_w) sqrt(n_h B_i) \, #h(2em) C B_i \, #h(2em) C H_(*)^(1 \/ 4) . $

For the whole matrix regarded as a Frobenius vector, the increment norm is at most $C parallel h_(dot.op x) parallel_2^2 lt.eq C$, where the dot denotes the full current active column. Its corresponding three bounds are

$ C sqrt(t) thin t^(beta_w) n_h \, #h(2em) C n_h \, #h(2em) C . $

The conditional means here are computed before the query: the endpoint mask is predictable, so the scalar $bb(E) c_x$ can indeed be factored out of the increment. This mask is a contraction in the row and Frobenius norms and does not change any bound. Center each increment at its conditional mean. For a complex vector $z$, its Hermitian dilation

$ cal(D) \( z \) = mat(delim: "(", 0, z^(*); z, 0) quad upright("satisfies") quad cal(D) \( z \)^2 = "diag" \( parallel z parallel^2 \, z z^(*) \) lt.eq parallel z parallel^2 I . $

Centering cannot increase the conditional second moment in matrix order. Thus the displayed squared-norm bounds give predictable #emph[scalar] variance envelopes in the fixed original coordinate spaces. For entries and rows their pathwise sums follow from (113) and (114); for the Frobenius vector the Ward bound and the limit of $n_h$ heats give the sum directly. All include the candidate first breaking heat. This verifies the precise hypotheses of Lemma 24, rather than requiring a matrix-valued variance theorem.

Here are the margins at the required thresholds. For entries, use $a = t^(.42 delta)$; the total drift is $O \( t^(.63 delta) \)$ and

$ a^2 / V gt.eq c t^(- .16 delta) \, #h(2em) a / J gt.eq c t^(- .08 delta) . $

For row norms, use $a = t^(.125 delta)$; the drift is $O \( t^(.265 delta) \)$ and $a^2 \/ V gt.eq c t^(- .02 delta)$, with a larger margin for $a \/ J$. For the Frobenius norm, use $a = sqrt(n_h) thin t^(- .005 delta)$; its drift divided by $a$ is $O \( t^(.135 delta) \)$, and $a^2 \/ V gt.eq c t^(- .01 delta)$. Thus all three budget crossings have stretched-exponentially small probability after restriction to a polynomial number of coordinates. We justify that restriction below, before drawing the conclusion.

=== 6.7 A two-sided bound on leverage changes <a-two-sided-bound-on-leverage-changes>

The drift calculation controls the number of heats, but it does not by itself keep individual leverages below $4 l_(*)$. We prove that cap separately. For each original exterior site $i$, record the fixed-ridge heat change $d_i = m'_i - m_i$ whenever $i$ survives the heat. Set the recorded change to zero at its own deletion and after deletion. Ridge adjustments are not included. More precisely, number the heats by $k$. While the trial is running, let $cal(F)_(k - 1)$ be the full retained history immediately before the residual query for heat $k$, including the already selected pivot and ridge $tau_k$. Put

$ Z_(k \, i) = upright(bold(1))_({ i upright(" survives heat ") k }) { m_i^(upright("post")) \( tau_k \) - m_i^(upright("pre")) \( tau_k \) } . $

The survival indicator is predictable, because the pivot is chosen before its residual is queried. After stopping, the formal remaining increments are zero and $cal(F)_k$ stays equal to the history at stopping. The actual retained filtration continues through rollback, marking, and later trials. Thus $Z_(k \, i) - bb(E) \( Z_(k \, i) divides cal(F)_(k - 1) \)$ is one adapted martingale stream even though $tau_k$ can vary with $k$. Every estimate below is uniform in that predictable positive ridge; no discretization or union over its possible values is needed. The notation $d_i$ denotes $Z_(k \, i)$ at the heat under consideration.

Write $epsilon_t = t^(beta_w) + sqrt(t) + r_(*) sqrt(H_(*))$. The same expansion of the Gram normalization used in Lemma 30 gives, at a running heat prestate,

#[#set math.equation(numbering: n => "(116)")
 $ \| bb(E) \( d_i divides cal(F) \) \| lt.eq C l_(*) [sqrt(t) thin t^(beta_w) \| v_i \| + \| v_i \|^2 + l_(*) epsilon_t + frac(l_(*) \| v_i \|, sqrt(t)) + l_(*)^2 / t] \, $ <eq:clearing-one-row-bias>]

#[#set math.equation(numbering: n => "(117)")
 $ \| d_i \| lt.eq C l_(*) (\| v_i \| + l_(*) / sqrt(t)) . $ <eq:clearing-one-row-jump>]

For completeness, the first two terms of (116) are the conditional mean of the raw row-norm change. In the first-order normalization, keeping the old row gives $C l_(*) parallel bb(E) D_(*) parallel_1 lt.eq C l_(*)^2 epsilon_t$. Replacing it by the new row costs $C l_(*) \| v_i \| parallel D_(*) parallel lt.eq C l_(*)^2 \| v_i \| \/ sqrt(t)$. The quadratic remainder is at most $C l_(*) "Tr" D_(*)^2 lt.eq C l_(*)^3 \/ t$. The pathwise estimate follows by using $\| c_x \| lt.eq C$ and $parallel D_(*) parallel lt.eq C l_(*) \/ sqrt(t)$ instead of their means.

Since the weights $p_i$ are bounded above and below,

$ sum \| v_i \|^2 lt.eq C B_i \, #h(2em) sum \| v_i \| lt.eq C sqrt(n_h B_i) . $

The sum of the absolute conditional biases in (116), divided by $l_(*)$, is therefore bounded by

#[#set math.equation(numbering: n => "(118)")
 $ C [t^(.265 delta) + t^(.27 delta) + t^(.34 delta) + t^(1 \/ 2 - .02 delta) + t^(1 \/ 2 + .48 delta - nu) + t^(.345 delta) + t^(.42 delta)] = o \( 1 \) . $ <eq:clearing-bias-margins>]

The conditional variance sum is at most

#[#set math.equation(numbering: n => "(119)")
 $ C l_(*)^2 (B_i + n_h l_(*)^2 \/ t) lt.eq C l_(*)^2 t^(.27 delta) . $ <eq:clearing-leverage-variance>]

The jump divided by $l_(*)$ is at most $C \( H_(*)^(1 \/ 4) + l_(*) \/ sqrt(t) \)$, a positive power of $t$.

Apply both signs of the maximal martingale inequality at a sufficiently small fixed multiple of $l_(*)$. After adding the absolute bias bound (118), except with stretched-exponentially small probability we have

#[#set math.equation(numbering: n => "(120)")
 $ sup_s lr(|sum_(k lt.eq s) d_i^(\( k \))|) lt.eq l_(*) \/ 2 $ <eq:clearing-two-sided>]

at every prefix and every monitored row. The absolute value in (120) is essential: it bounds the change over any interval of heat steps by $l_(*)$.

Suppose a surviving row first exceeded $4 l_(*)$. Immediately after the most recent ridge lowering, or at initialization if there was none, its leverage was at most $2 l_(*)$. Let $k_0$ be the number of heats preceding that adjustment and $s$ the current number. The ridge has been held constant for heats $k_0 + 1 \, dots.h \, s$, and the row has survived all of them. Its actual change is therefore exactly

$ sum_(k = k_0 + 1)^s Z_(k \, i) = sum_(k lt.eq s) Z_(k \, i) - sum_(k lt.eq k_0) Z_(k \, i) . $

The two prefix sums use the single varying-ridge stream; their difference is the desired constant-ridge interval sum. Equation (120) bounds it in absolute value by $l_(*)$, giving leverage at most $3 l_(*)$, a contradiction. This argument includes a prospective cap-breaking heat and uses only running heat prestates in its concentration estimates.

=== 6.8 Finite monitoring and conclusion <finite-monitoring-and-conclusion>

It remains to make the stopped probability estimates independent of the ambient torus size. The location implication (108) keeps every selected pivot within $ell \/ 2$ of $B$, including the pivot of a prospective first failure. The residual hypothesis therefore applies at every heat.

Choose a fixed ordinary-distance cube $Q$ containing $B$, its $ell$-neighborhood, and a further buffer of width $t^(- 5)$. By the bound on the diameter of $B$, the number of sites in $Q$ is polynomial in $1 \/ t$. Outside $Q$, projection decay rules out a leverage-cap crossing deterministically, even at a prospective failing output. For the distortion processes, the collapsed-distance resolvent estimate gives

$ \| h_(i k) \| lt.eq C t^(- 1 \/ 2) e^(- c t d_T \( i \, k \)) . $

Each heat increment with an endpoint outside $Q$ has an exponentially small factor connecting that endpoint to the pivot. The other factor has bounded row square sum by (84). More explicitly, the squared Frobenius norm of the portion of one increment with at least one endpoint outside $Q$ is at most

$ C (sum_(i in.not Q) \| h_(i x) \|^2) (sum_k \| h_(x k) \|^2) . $

The first sum has a dimension-dependent bound which is still independent of the torus volume. An ordinary shell of integer radius $q$ has at most $C_d \( 1 + q \)^(d - 1)$ sites. For an endpoint outside $Q$ its distance from the pivot is at least $t^(- 5)$, so (107) gives $d_T \( i \, x \) gt.eq "dist" \( i \, x \) \/ 4$ for small $t$. Therefore

$ sum_(i in.not Q) \| h_(i x) \|^2 lt.eq C_d t^(- 1) sum_(q gt.eq t^(- 5)) \( 1 + q \)^(d - 1) e^(- c t q) lt.eq C_d t^(- d - 1) e^(- c' t^(- 4)) . $

In the last step, extract $e^(- c t^(- 4) \/ 2)$ and bound the remaining exponential moment by $C_d t^(- d)$. Summing at most $n_h$ increments preserves an exponential bound by the triangle inequality. The same reasoning gives the entry and individual-row tails. It uses no factor proportional to the torus volume.

We may therefore apply the martingale inequalities to entries and row vectors compressed to $Q$, and to the matrix compressed to $Q times Q$, and then add the deterministic tails. Compressions do not increase the conditional square bounds. If the core lies in a ball of radius $t^(- C_(upright("loc")))$, then

$ \| Q \| lt.eq C_d \( t^(- C_(upright("loc"))) + t^(- 4) + t^(- 5) \)^d . $

Thus the largest vector-dilation dimension is at most $1 + \| Q \|^2$, and there are at most $C \| Q \|^2$ entry, row, and leverage tests. These are fixed powers of $1 \/ t$ for each fixed $d$. Take the martingale thresholds to be one quarter of the budget thresholds. Their predictable biases and deterministic tails are smaller than another quarter for sufficiently small $t$. The strict margins proved above imply that the probability of a distortion crossing or leverage crossing is at most $exp \( - t^(- c) \)$ for some fixed $c > 0$.

Finally, Lemma 31 bounds the probability of reaching $n_h$ heats before another stop by $C exp \[ - c t^(- \( e_h - e_0 - nu \)) \]$. Because $e_h - e_0 - nu = \( .02 - 10^(- 5) \/ d \) delta > 0$, this is of the same required form after decreasing the exponent. There are no other failure modes. The procedure uses measurable spectral functions, a measurable threshold ridge and a fixed tie rule; each real update is measurable as well. It must stop after at most $n_h$ heats. On DONE the zero-ridge projection satisfies (111) by the stopping rule, and the budgets hold. This proves Proposition 32.

On DONE the preparation has supplied bounded accumulated heat distortion and a small diagonal for the final full-range projection. Lemma 27 turns that projection bound into deterministic control of the true core completion, and Corollary 29 gives its spatial decay. The next section specifies the successful commit and the rollback of a failed preparation, and accumulates successful operations using comparisons only at committed states.

== 7 Committing clearings and restoring the stage bounds <sec:assembly>

The preceding section prepares a fixed core under explicit geometry and conditional residual laws. We now specify the scheduled clearings, verify those inputs, and prove that every successful operation preserves the bounds needed by later trials. The removed terminal groups are separated, their inverse changes have controlled spatial overlap, and the changes can be compared in one energy form fixed at the start of the stage. A failed trial is rolled back and contributes no analytic error to this assembly. Fix the dimension $d gt.eq 3$ throughout. Recall that

$ nu = 10^(- 5) delta \/ d \, #h(2em) d nu = 10^(- 5) delta . $

Constants in this section may depend on $d$, but not on the final resolution, energy in $I_d$, or a retained history reaching a committed state.

Here is the schedule for these trials. After the ordinary sweep from stage $j - 1$ to stage $j$, run clearings only when $j lt.eq floor.l m \/ 2 floor.r$. Freeze the graph whose vertices are the pending active sites and whose edges join pairs at distance at most $R_j = 4^(8 j)$. We call its connected components the snapshot components. Fix a total order on the torus sites; the anchor of a nonempty component is its least site. In anchor order, attempt each component $B$ with $\| B \| lt.eq t_j^(- nu)$ once, and leave larger components alone. If its preparation reaches DONE, reveal and record any still-unknown true values on $B$, apply the deterministic core completion, and commit the core together with the heat pivots as one successful clearing. This step uses the standing invertibility of true principal matrices and adds no further test. If preparation reaches FAIL, restore the pretrial matrix and partial potential data, undoing all provisional eliminations. Retain every queried answer, then mark the core and all inspected exterior sites pending, including the pivot whose heat first failed. After all these attempts, reset the diagonal before the next ordinary sweep. If no clearing is scheduled, reset immediately after the ordinary sweep. The final residual sweep has no reset. In this section the post-sweep stage is the new index $j$, and its parameter is $t = t_j$.

Throughout a clearing stage, $t$, $r$, $p = Im r$, and $b = t_(n_0) t$ are frozen. We distinguish a committed prestate from a provisional state inside a trial. The former satisfies the comparison bounds for $D$ and the norm bound for $K$. At a running heat prestate we use only positive bounded $p$, the stopped lag and fourth-row bounds of Proposition 32, the Ward identity, and the geometry proved below. In particular, we do not assume a comparison for $D$ or a norm bound for $K$ at a provisional heat prefix. The committed bounds are proved below from the outputs of successful operations and the stage hypotheses; they are not additional stopping tests for the preparation.

=== 7.1 Geometry and localization during a clearing <geometry-and-localization-during-a-clearing>

For a terminal set, give a nearest-neighbor edge cost zero if either endpoint is terminal, and cost one otherwise. Its path pseudometric is denoted by $d_T$; $"dist"$ always denotes ordinary torus distance. In particular, the subscript $T$ distinguishes the collapsed metric from the dimension $d$.

#thm([Lemma 7.1.])[
  (Adding separated terminal groups).  #emph[Let $c > 0$ and $mu gt.eq 0$, and suppose $d_T \( u \, v \) gt.eq c "dist" \( u \, v \) - mu$. Let $O_a$ be sets of new terminals, each containing at most $M$ sites, with $"dist" \( O_a \, O_(a') \) gt.eq R - 2 ell$ for $a eq.not a'$. If 
$ cal(L) = c \( R - 2 ell \) - mu > 2 M \, $

 then the pseudometric $d'_T$ after all these additions satisfies 
$ d'_T \( u \, v \) gt.eq c \( 1 - 2 M \/ cal(L) \) "dist" \( u \, v \) - mu - 2 M . $

 The number of added groups does not enter this bound.]
] <lem:assembly-metric>

#proof[
  A path minimizing the new cost can be chosen simple by deleting cycles. Suppose it meets $k gt.eq 1$ different groups, and let $A$ be its old cost. Each site of their union is incident to at most two edges of the simple path. Its cost therefore decreases by at most $2 M k$, even if the path returns to a group after leaving it. In the chronological sequence of group visits there are at least $k - 1$ transitions between different groups. To obtain disjoint segments, list the groups visited along the path, suppress consecutive repetitions of the same group, and use the segment from the last visit to one group before the first visit to the next. There are at least $k - 1$ such transitions. Each has old cost at least the old collapsed distance between its endpoints, hence at least $cal(L)$. This argument already includes all shortcuts through old terminals. Repeated visits can increase the number of transitions but do not increase the count of distinct groups in the loss $2 M k$. Hence $A gt.eq \( k - 1 \) cal(L)$ and
  $ d'_T \( u \, v \) gt.eq A - 2 M k gt.eq \( 1 - 2 M \/ cal(L) \) A - 2 M gt.eq c \( 1 - 2 M \/ cal(L) \) "dist" \( u \, v \) - mu - 2 M . $
  If the path meets no new group, the old lower bound applies directly. ◻
]

#thm([Lemma 7.2.])[
  (Localization of a clearing trial).  #emph[At post-sweep stage $j lt.eq floor.l m \/ 2 floor.r$, put 
$ R_j = 4^(8 j) \, #h(2em) ell_j = 4^(4 j) \, #h(2em) r_(*) = t_j^(- nu) \, #h(2em) n_h = floor.l t_j^(- 1 - e_h) floor.r \, #h(2em) e_h = .46 delta . $

 Take the snapshot components of pending sites joined at distance at most $R_j$, and consider only components $B$ of size at most $r_(*)$. Assume the terminal set was initially empty and the preceding clearing stages used the same cardinality and pivot-location rules. The new terminals of a completed successful group consist of its core and heat pivots. The current provisional group contains its heat pivots, with the next proposed pivot included when its prospective output is considered. Suppose each such counted group has at most $C n_h$ sites and all previous pivots in a trial lie within $ell_j \/ 2$ of its snapshot component. The following assertions hold after increasing $n_0$ uniformly in $m$:]
  + #emph[At every committed endpoint and running heat prestate, the terminal metric satisfies 
#[#set math.equation(numbering: n => "(121)")
 $ d_T \( u \, v \) gt.eq 1 / 2 "dist" \( u \, v \) - t_j^(- 1.03) . $ <eq:assembly-terminal-metric>]

]
  + #emph[At a running heat prestate, every proposed heat pivot, including a pivot whose update would first break a distortion budget, lies within $ell_j \/ 2$ of $B$. After that pivot is included as a provisional terminal, the metric bound (121) still holds at its prospective output, even if the output first breaks a cap or reaches the heat limit.]
  + #emph[At each committed endpoint, running heat prestate, and prospective output, at least $N \/ 2$ physical sites remain active. In particular, the current exterior of an eligible core is nonempty for sufficiently large $n_0$. An eligible component and all its edits lie within distance $D_s = C t_j^(- nu) R_j$ of its anchor. Cubes of radii $100 D_s$ or $200 D_s$ about these anchors have overlap at most $C t_j^(- d nu)$.]
  #emph[These conclusions require no bound on $K$ or comparison for $D$ at provisional heat prefixes.]
] <lem:clearing-locality>

#proof[
  We first prove the metric assertion under the stated location hypothesis, and then use it to continue that hypothesis to the next pivot. Distinct snapshot components are separated by more than $R_j$. Their new terminal sets, including the current provisional additions, are therefore separated by at least $R_j - 2 ell_j$. For an actual success, the number of new terminals is less than $n_h + \| B \| lt.eq n_h + r_(*) lt.eq C n_h$ for small $t_j$, since $nu < 1 + e_h$. A provisional group, including its one prospective pivot, obeys the same bound from the heat limit. Apply Lemma 33 with $M = C n_h$ to all additions of the stage at once. Starting with the ordinary metric before any clearing, the multiplicative losses are bounded by a constant times
  $ sum_(j gt.eq n_0) t_j^(- 1 - e_h) / R_j lt.eq C sum_(j gt.eq n_0) 4^(- j \( 7 - e_h \)) . $
  This sum can be made arbitrarily small. The additive defects, through stage $j$, are at most
  $ C sum_(i = n_0)^j t_i^(- 1 - e_h) lt.eq C' t_j^(- 1 - e_h) lt.eq t_j^(- 1.03) \, $
  where $e_h = .0046 < .03$. In these estimates $t_i asymp 4^(- i)$ uniformly in the final resolution. They also imply the inequality $cal(L) > 2 M$ required in the metric lemma. This proves (121).
  At the current running heat prestate, the metric just proved supplies (107) with $ell = ell_j asymp t_j^(- 4)$. The selection implication (108) therefore places the next proposed pivot within $ell_j \/ 2$ of $B$. Its underlying full-range estimate uses only survivor damping and terminal Schur structure, so this application needs neither a lower singular-value bound for the cross block nor a provisional bound on $K$ or $D$. Induction over the proposed pivots proves that there is no first violation of the location hypothesis. In particular the argument applies before a prospective first budget-breaking update; it does not assume that update will be accepted. Once that pivot is localized, applying the same separated-group bound with it included also gives the metric estimate at its prospective poststate. A subsequent rollback removes its numerical metric cost.
  One anchor from each snapshot component forms an $R_j$-separated set. Packing disjoint balls of radius a fixed fraction of $R_j$ bounds the number of components by $C N \/ R_j^d$. Each success, or the current provisional trial, removes at most $C n_h$ sites. The total fraction removed through all stages is bounded by
  $ C sum_(j gt.eq n_0) n_h \/ R_j^d lt.eq C sum_(j gt.eq n_0) t_j^(8 d - 1 - e_h) < 1 / 2 $
  for large $n_0$. Failed trials are rolled back and have no terminal cost. This proves the active-count assertion, including provisional prefixes and their prospective outputs. Moreover, $r_(*) = t_j^(- nu) lt.eq C 4^(nu m \/ 2) lt.double N = 4^(20 d m)$ for $j lt.eq m \/ 2$. Removing the at most $r_(*)$ core sites from an active set of size at least $N \/ 2$ leaves a nonempty exterior. At DONE, the precompletion terminal and active sets are those of the committed state at trial start if no heat occurred, and those of the last heat output otherwise. The same metric and active-count bounds therefore hold there.
  A snapshot component of size at most $r_(*)$ has diameter at most $\( r_(*) - 1 \) R_j$. Adding the pivot neighborhood gives the stated $D_s$. Assign exactly one cube to each snapshot component, centered at its anchor. For all cubes containing a given point, the disjoint balls of radius $R_j \/ 3$ about their anchors fit in a ball of radius $C D_s$. The $d$-dimensional volume bounds therefore give overlap at most $C_d \( D_s \/ R_j \)^d = C_d t_j^(- d nu)$. There is no factor for the number of sites in a component: all its edits use this single enclosing cube. All these cubes fit on the torus: $j lt.eq m \/ 2$ implies $D_s lt.eq C 4^(\( 8 + nu \) m \/ 2) lt.double 4^(20 m)$. ◻
]

===== 7.1.1 The true residual at a selected pivot. <the-true-residual-at-a-selected-pivot.>

The geometry now identifies which true information is available in an actual scheduled trial. All ordinary pending marks are made before the snapshot is frozen. A pending snapshot site outside $B$ therefore belongs to a different component, at distance greater than $R_j$ from $B$. An exterior inspected in an earlier failed clearing lies within $ell_j \/ 2$ of its own snapshot component, hence at distance greater than $R_j - ell_j \/ 2$ from $B$. Neither kind of site can be the current pivot, which lies within $ell_j \/ 2$ of $B$. Earlier successful inspections are committed terminals and unavailable; earlier pivots in this trial have been provisionally removed. The ordinary-sweep rule has preserved the invariant that a coupled active site has an untouched true suffix. The exclusions above therefore show that the selected localized exterior pivot is coupled and has an untouched true residual. This conclusion includes the pivot whose update first causes failure.

The pivot and ridge are measurable from the retained pre-query history: the current provisional matrix is known, and the ridge and tie rules use measurable spectral functions of that matrix. Lemma 4 therefore gives the conditional law of the untouched residual $xi$ at the selected site. At stage $j$ its moments are exactly

$ bb(E) \( xi divides cal(F) \) = 0 \, #h(2em) bb(E) \( xi^2 divides cal(F) \) = s_j = t_j - eta \, #h(2em) \| xi \| lt.eq sqrt(3 s_j) \, #h(2em) eta \/ t_j lt.eq C t_j \, $

where the last inequality uses $j lt.eq m \/ 2$. The deterministic location argument did not assume this product law; it first proved that the chosen coordinate is among those to which the law applies.

Every exposed residual is recorded before its outcome is tested. On FAIL, rollback restores the matrix and partial potential data from trial start before marking the core and every inspected exterior, including the first breaking pivot, while retaining their answers. On DONE, a pending core may still contain unknown true values. Revealing and recording those values makes the completed numerical state a function of the retained history. Lemma 27 applies pointwise to the obtained values under its standing invertibility hypothesis; it needs no centered law or freshness for them. Core and heat pivots then become committed terminals in the one successful operation. Thus every active site queried during this clearing becomes terminal on success or pending on rollback; no exposed suffix remains at a coupled active site for the next component or stage. The invertibility of true principal matrices is the probability-one fact at the fixed energy from Section 2, not a preliminary query or an additional conditioning of the product law.

These observations verify the geometric and random-input hypotheses of Proposition 32 for each scheduled eligible component. Once the deterministic assembly below supplies its trial-start lag and row slack at every committed prefix, the conditional failure estimate applies after any earlier failed trials, with all their information retained.

=== 7.2 Summing the committed changes <summing-the-committed-changes>

A successful clearing supplies one difference between its inverse before and after the operation, restricted to its surviving sites. We first state the deterministic result that sums these differences. The energy error has two parts: the change of the surviving edges, and the old energy carried through the sites that have been removed. Both will be compared in the spatial form fixed at the start of the stage.

#thm([Proposition 7.3.])[
  (Deterministic assembly of committed changes).  #emph[Fix a clearing stage with parameter $t$. Consider the finite sequence of its committed numerical states: the initial post-sweep state, indexed by $0$, and the states after successive successful clearings, indexed by $a = 1 \, dots.h \, k_max$. Failed trials leave this numerical sequence unchanged. Let $A_a subset A_(a - 1)$ be the active sites after operation $a$, put $O_a = A_(a - 1) \\ A_a$, and let $T_a$ be the complement of $A_a$ in the physical torus.]
  #emph[At each index use the physical state of Section 2: the sites in $T_a$ have their exact true potentials, the sites in $A_a$ have their current partial potentials, and $M^(\( a \))$ is the real terminal-Schur matrix. The relevant true terminal principal matrices are invertible at the fixed energy. Use the restriction of one frozen vector $r$ at every index, with $p = Im r$ bounded above and below by positive constants, and write 
$ g^(\( a \)) = \( M^(\( a \)) - t "diag" \( r \|_(A_a) \) \)^(- 1) \, #h(2em) h^(\( a \)) = sqrt(t) thin g^(\( a \)) \, #h(2em) K_(i j)^(\( a \)) = \( h_(i j)^(\( a \)) \)^2 \, #h(2em) F_(i j)^(\( a \)) = \| h_(i j)^(\( a \)) \|^2 . $

 Let $D_a$ be the Ward Laplacian of this state, so 
$ D_a \( f \) = 1 / 2 sum_(i \, j in A_a) p_i p_j F_(i j)^(\( a \)) \| f_i - f_j \|^2 . $

 With $q_i^(\( a \)) = Im g_(i i)^(\( a \))$, the Ward identity gives $F^(\( a \)) p = q^(\( a \))$. The word committed here identifies the numerical endpoints. The comparison at the initial endpoint is an input; its transport to later endpoints is the conclusion below.]
  #emph[Assume at the initial state that, on potentials modulo constants, 
#[#set math.equation(numbering: n => "(122)")
 $ c W lt.eq D_0 lt.eq C W \, #h(2em) max_(i in A_0) sum_(j in A_0) \| h_(i j)^(\( 0 \)) \|^4 lt.eq .7 H_(*) \, #h(2em) max_(i in A_0) \| g_(i i)^(\( 0 \)) - r_i \| lt.eq C t^(.42 delta) . $ <eq:assembly-initial-data>]

 Here $H_(*) = t^(1 + delta)$ and $W \( f \) = inf_(f = alpha + v \|_(A_0)) \( parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 \)$, with $b = t_(n_0) t$.]
  #emph[Assume also the geometric bounds supplied by Lemma 34. For $D_s asymp t^(- 8 - nu)$, each $O_a$ lies in the ball of radius $D_s$ about its anchor $z_a$ and has size at most $C n_h$, where $n_h = floor.l t^(- 1 - .46 delta) floor.r$. The anchors are distinct. The cube halos $Q_a \, Q'_a$ of radii $100 D_s \, 200 D_s$ are embedded lattice cubes in the torus, and each family has overlap at most $C t^(- d nu)$. At every indexed state, $\| A_a \| gt.eq N \/ 2$ and 
$ d_(T_a) \( u \, v \) gt.eq 1 / 2 "dist" \( u \, v \) - m' \, #h(2em) m' lt.eq t^(- 1.03) . $

]
  #emph[For each operation set 
$ a^(\( a \)) = h^(\( a \)) - h^(\( a - 1 \)) \|_(A_a times A_a) . $

 Assume these actual survivor differences satisfy 
#[#set math.equation(numbering: n => "(123)")
 $ max_(i \, j in A_a) \| a_(i j)^(\( a \)) \| & lt.eq C sqrt(t) thin t^(.42 delta) \,\
max_(i in A_a) sum_(j in A_a) \| a_(i j)^(\( a \)) \|^2 & lt.eq C t^(.25 delta) \, #h(2em) sum_(i \, j in A_a) \| a_(i j)^(\( a \)) \|^2 lt.eq C t^(- 1 - .47 delta) . $ <eq:assembly-single-distortions>]

 Assume further that, with constants $c \, C > 0$ and a fixed $P$, 
#[#set math.equation(numbering: n => "(124)")
 $ \| a_(i j)^(\( a \)) \| lt.eq t^(- P) exp #h(-0.16667em) {- c t [\( "dist" \( i \, O_a \) - C m' \)_(+) + \( "dist" \( j \, O_a \) - C m' \)_(+)]} . $ <eq:assembly-single-decay>]

 Then, for all sufficiently small $t$, every prefix $0 lt.eq k lt.eq k_max$ satisfies 
#[#set math.equation(numbering: n => "(125)")
 $ parallel K^(\( k \)) parallel & lt.eq parallel K^(\( 0 \)) parallel + t^(.10 delta) \,\
max_(i in A_k) \| g_(i i)^(\( k \)) - r_i \| & lt.eq C t^(.42 delta - d nu) = o \( t^(.36 delta) \) \,\
max_(i in A_k) (sum_(j in A_k) \| h_(i j)^(\( k \)) \|^4)^(1 \/ 4) & lt.eq (.7^(1 \/ 4) + C t^(.0225 delta - d nu)) H_(*)^(1 \/ 4) < \( .8 H_(*) \)^(1 \/ 4) . $ <eq:assembly-K-output>]

 All Schur complements in the successive definition 
$ L_a = D_a - "Schur"_(O_a) D_(a - 1) quad upright("on ") A_a $

 exist, and each $D_a$ has precisely the constant kernel. Extend each $L_a$ by zero to $A_0$. Then 
#[#set math.equation(numbering: n => "(126)")
 $ lr(|sum_(a = 1)^k L_a|) lt.eq t^(.10 delta) D_0 $ <eq:assembly-energy-output>]

 in quadratic forms. In particular, writing $X_k = D_k^(+)$, every neutral charge $y$ supported in $A_k$ satisfies 
#[#set math.equation(numbering: n => "(127)")
 $ \( 1 + t^(.10 delta) \)^(- 1) X_0 \( y \) lt.eq X_k \( y \) lt.eq \( 1 - t^(.10 delta) \)^(- 1) X_0 \( y \) \, $ <eq:assembly-inverse-output>]

 where $y$ is extended by zero in $X_0 \( y \)$. All constants are uniform in the number of components and the torus volume.]
] <prop:committed-assembly>

===== 7.2.1 The inputs supplied by a successful clearing. <the-inputs-supplied-by-a-successful-clearing.>

We verify the two per-operation bounds before proving the deterministic summation. At a trial satisfying the starting hypotheses of Proposition 32, its DONE output gives the heat budgets and the final projection cap. By the schedule above, any still-unknown core values are then revealed and recorded, and Lemma 27 applies pointwise; the nonempty-exterior condition is supplied by Lemma 34. On the final survivors, the recorded heat difference is exactly $hat(h) - h^0$ restricted to those survivors. Adding the core difference gives the actual endpoint difference $a^(\( a \))$.

The heat contribution to (123) has entry bound $sqrt(t) thin t^(.42 delta)$, squared row bound $t^(.25 delta)$, and squared Hilbert–Schmidt bound $n_h t^(- .01 delta) lt.eq t^(- 1 - .47 delta)$. The corresponding core bounds are $C sqrt(t) thin t^(.44 delta)$, $C t^(.44 delta)$, and $C r_(*) \/ t = C t^(- 1 - nu)$. The triangle inequality, squared when necessary, gives the displayed combined bounds because $nu < .47 delta$. Restricting the heat record to the final survivors can only decrease its entry, row, and Frobenius bounds; the core difference is already indexed by the final survivors.

To verify (124), consider a pair of final survivors. A heat at $x in O_a$ changes its entry by $c_x h_(i x) h_(x j)$ with $\| c_x \| lt.eq C$. Lemma 19 and (121) bound this product by

$ C t^(- 1) exp { - c t \[ \( "dist" \( i \, O_a \) - C m' \)_(+) + \( "dist" \( j \, O_a \) - C m' \)_(+) \] } . $

There are at most $n_h$ heats, so their sum has the claimed form. For the core change, Corollary 29 gives the same decay from the core, and the core is contained in $O_a$; use the same terminal metric. The prefactors, including $n_h$, are bounded by a fixed power of $t^(- 1)$. This proves the asserted decay without any comparison for $D$ at a provisional prefix. Thus each successful scheduled operation supplies the two bounds assumed in the proposition, provided its trial starts with the stated lag and row slack. The prefix conclusions below supply that slack to the next trial when the result is used in the stage induction.

#proof[
  Put $epsilon.alt = t^(.10 delta) < 1 \/ 2$. We prove the form bound and the existence of its Schur complements by induction on the prefix length $k$. In the step for $k$, suppose the form bound and the identity below hold at every shorter prefix. For each $a lt.eq k$, let $S_(a - 1) = sum_(s < a) L_s$, padded to $A_0$, and $E_(a - 1) = A_0 \\ A_(a - 1)$. The induction hypothesis is $\| S_(a - 1) \| lt.eq epsilon.alt D_0$ together with
  #[#set math.equation(numbering: n => "(128)")
   $ D_(a - 1) = "Schur"_(E_(a - 1)) \( D_0 + S_(a - 1) \) . $ <eq:assembly-schur-identity>]
  For the empty prefix, $S_0 = 0$ and $E_0 = diameter$, so the identity is immediate. The initial lower comparison with $W$ makes the kernel of $D_0$ precisely the constants. At a later prefix, the form bound gives the same kernel for $D_0 + S_(a - 1)$. The Schur fact from Section 2 then gives the constant kernel of $D_(a - 1)$ and, since $A_a$ is nonempty, the existence of its pivot on $O_a$. Thus $L_a$ is defined. Minimization over eliminated coordinates also gives, for every extension $F$ to $A_0$,
  #[#set math.equation(numbering: n => "(129)")
   $ D_(a - 1) \( F \|_(A_(a - 1)) \) lt.eq \( 1 + epsilon.alt \) D_0 \( F \) lt.eq C W \( F \) . $ <eq:assembly-pre-comparison>]
  ===== 7.2.2 The two energy contributions. <the-two-energy-contributions.>
  On surviving pairs the changes of $K$ and $F$ are exactly
  $ Delta K^(\( a \)) = 2 h^(\( a - 1 \)) compose a^(\( a \)) + a^(\( a \)) compose a^(\( a \)) \, #h(2em) Delta F^(\( a \)) = 2 Re \( overline(h^(\( a - 1 \))) compose a^(\( a \)) \) + \| a^(\( a \)) \|^2 \, $
  where old matrices are restricted to $A_a times A_a$ and $compose$ denotes entrywise multiplication. Let $D_(A_a)^(upright("edge"))$ be the Laplacian made from the old edges with both endpoints in $A_a$. For a potential $f$ on $A_a$, the fact that $p$ is frozen gives
  #[#set math.equation(numbering: n => "(130)")
   $ \( D_a - D_(A_a)^(upright("edge")) \) \( f \) & = 1 / 2 sum_(i \, j in A_a) p_i p_j Delta F_(i j)^(\( a \)) \| f_i - f_j \|^2 \,\
B_a & = "Schur"_(O_a) D_(a - 1) - D_(A_a)^(upright("edge")) gt.eq 0 \,\
L_a & = \( D_a - D_(A_a)^(upright("edge")) \) - B_a . $ <eq:assembly-energy-split>]
  The first term uses the single endpoint difference $a^(\( a \))$. The form $B_a$ is nonnegative because the Schur complement minimizes the old energy over $O_a$, while the surviving-edge energy does not depend on those coordinates. It carries old energy through the removed sites, so its far part will require the old resolvent decay separately from the decay of $a^(\( a \))$.
  Fix a real potential $f$ on $A_0$ and one split $f = alpha + v \|_(A_0)$ for the whole prefix. Put
  $ c_a = "avg"_(Q'_a) v \, #h(2em) W_a = parallel alpha parallel_(2 \, Q'_a ∩ A_0)^2 + b^(- 1) parallel nabla v parallel_(2 \, Q'_a)^2 . $
  The last norm sums nearest-neighbor edges of the cube; harmless enlargement of $Q'_a$ includes its boundary edges. We use this same split for every $a$ and take the infimum defining $W \( f \)$ only after summing the local estimates.
  ===== 7.2.3 Uniform tails for the survivor changes. <uniform-tails-for-the-survivor-changes.>
  We first record the tail estimate for $a^(\( a \))$ and the two survivor changes it produces. Put $rho_i = "dist" \( i \, z_a \)$ and $sigma_i = \( "dist" \( i \, O_a \) - C m' \)_(+)$. Since $O_a$ lies within distance $D_s$ of $z_a$ and $C m' = o \( D_s \)$,
  $ sigma_i + sigma_j gt.eq rho_i + rho_j - 4 D_s . $
  If $\( i \, j \) in.not Q_a times Q_a$, then $rho_i + rho_j gt.eq 100 D_s$, and hence
  $ sigma_i + sigma_j gt.eq 1 / 2 \( rho_i + rho_j \) + 46 D_s . $
  It follows from (124), after decreasing $c$ and increasing $P$, that
  #[#set math.equation(numbering: n => "(131)")
   $ \| a_(i j)^(\( a \)) \| upright(bold(1))_(\( i \, j \) in.not Q_a^2) lt.eq t^(- P) e^(- c t D_s) e^(- c t \( rho_i + rho_j \)) . $ <eq:assembly-anchor-tail>]
  The inverse of a real symmetric active matrix with damping $- i t "diag" \( p \)$ has norm at most $C \/ t$. Thus $\| h_(i j)^(\( a - 1 \)) \| lt.eq C t^(- 1 \/ 2)$, and (131) also holds for the absolute values of the tail entries of $Delta K^(\( a \))$ and $Delta F^(\( a \))$, after increasing $P$.
  On the $d$-dimensional torus, uniformly in its side length, for every fixed $q gt.eq 0$ and $0 < t lt.eq 1$,
  #[#set math.equation(numbering: n => "(132)")
   $ sum_z e^(- c t "dist" \( i \, z \)) "dist" \( i \, z \)^q lt.eq C_(d \, q) t^(- d - q) . $ <eq:assembly-lattice-moments>]
  For $q = 0$ take $0^0 = 1$. Indeed, counting coordinate representatives of minimal length gives at most $C_d \( 1 + s \)^(d - 1)$ sites in the shell $s lt.eq "dist" \( i \, z \) < s + 1$. The sum is bounded by $C_(d \, q) sum_(s gt.eq 0) e^(- c t s) \( 1 + s \)^(d + q - 1)$, which is at most the right side by comparison with its integral. In particular the zeroth and second moments cost $C t^(- d)$ and $C t^(- d - 2)$. Distinctness of the anchors and the triangle inequality consequently give
  $ sum_a e^(- c t \( "dist" \( i \, z_a \) + "dist" \( j \, z_a \) \)) lt.eq C t^(- d) e^(- c t "dist" \( i \, j \) \/ 2) . $
  Therefore the sum of all tail kernels has row and column sums at most $t^(- P) e^(- c t D_s)$. The same conclusion holds after arbitrary restrictions to survivors or to a committed prefix.
  To use the same tail in the energy form, extend the fixed $alpha$ by zero to the torus. For every lattice displacement $u$, a shortest nearest-neighbor path and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(133)")
   $ sum_i \| v_(i + u) - v_i \|^2 lt.eq "dist" \( 0 \, u \)^2 parallel nabla v parallel_2^2 . $ <eq:assembly-translation>]
  Apply the row-sum bound to the $alpha$ differences and (133) to the $v$ differences. Equations (131)–(132) then imply
  #[#set math.equation(numbering: n => "(134)")
   $ sum_a sum_(\( i \, j \) in.not Q_a^2) \| Delta F_(i j)^(\( a \)) \| thin \| f_i - f_j \|^2 lt.eq t^(- P) e^(- c t D_s) \( parallel alpha parallel_2^2 + parallel nabla v parallel_2^2 \) . $ <eq:assembly-tail-form>]
  We henceforth denote such bounds by $epsilon_t$ times the indicated norm, where $epsilon_t = t^(- P) e^(- c t D_s)$ with $P$ allowed to increase. Because $t D_s asymp t^(- 7 - nu)$, $epsilon_t$ is smaller than every fixed positive power of $t$. Since $b lt.eq 1$, the right side of (134) is at most $epsilon_t \( parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 \)$.
  ===== 7.2.4 The diagonal, fourth powers, and $K$. <the-diagonal-fourth-powers-and-k.>
  For a site surviving a prefix, its diagonal increments telescope. There are at most $C t^(- d nu)$ halos $Q_a$ containing that site. Their near increments obey $\| Delta g_(i i)^(\( a \)) \| lt.eq C t^(.42 delta)$; all other increments sum to at most $epsilon_t$, by (131) and $Delta g = a^(\( a \)) \/ sqrt(t)$. Together with (122), this proves (125). In particular, at every committed prestate the Ward identity gives
  #[#set math.equation(numbering: n => "(135)")
   $ sum_j \| h_(i j) \|^2 lt.eq q_i \/ min_j p_j lt.eq C . $ <eq:assembly-row-two>]
  The first two bounds in (123) imply
  $ sum_j \| a_(i j)^(\( a \)) \|^4 lt.eq max_j \| a_(i j)^(\( a \)) \|^2 sum_j \| a_(i j)^(\( a \)) \|^2 lt.eq C t^(1 + 1.09 delta) . $
  For the near pieces, Minkowski’s inequality in $ell^4$, followed by halo overlap, costs at most
  $ C t^(- d nu) t^(\( 1 + 1.09 delta \) \/ 4) = C t^(.0225 delta - d nu) H_(*)^(1 \/ 4) $
  per row. The sum of the $ell^4$ norms of the tail rows is at most their summed $ell^1$ norm, which is bounded by $epsilon_t$. Telescoping on the final surviving columns, and observing that discarding columns decreases the initial row norm, proves (125). The strict final inequality holds because $.0225 delta - d nu > 0$.
  For $K$, at a committed prestate (135) and Cauchy–Schwarz yield
  $ sum_j \| Delta K_(i j)^(\( a \)) \| lt.eq 2 (sum_j \| h_(i j) \|^2)^(1 \/ 2) (sum_j \| a_(i j)^(\( a \)) \|^2)^(1 \/ 2) + sum_j \| a_(i j)^(\( a \)) \|^2 lt.eq C t^(.125 delta) . $
  The matrices are symmetric, so the same bound holds for column sums. The near pieces have at most $C t^(- d nu)$ overlapping row supports, and the tails have norm at most $epsilon_t$. On $A_k$ the exact telescoping identity is
  $ K^(\( k \)) = K^(\( 0 \)) \|_(A_k times A_k) + sum_(a lt.eq k) Delta K^(\( a \)) \|_(A_k times A_k) . $
  The row and column sum bound therefore gives $parallel K^(\( k \)) parallel lt.eq parallel K^(\( 0 \)) parallel + C t^(.125 delta - d nu) + epsilon_t$, which implies (125).
  ===== 7.2.5 The local energy of a survivor change. <the-local-energy-of-a-survivor-change.>
  We now estimate the near part of the first term in (130) using the common split fixed above. For nonnegative symmetric weights $w_(i j)$ supported in $Q_a^2$, let $l_i = sum_j w_(i j)$, $L_oo = max_i l_i$ and $L_1 = sum_i l_i$. The difference inequality and Lemma 7 give
  #[#set math.equation(numbering: n => "(136)")
   $ sum_(i \, j) w_(i j) \| f_i - f_j \|^2 & lt.eq C L_oo parallel alpha parallel_(2 \, Q'_a ∩ A_0)^2 + C sum_i l_i \| v_i - c_a \|^2\
 & lt.eq C (L_oo + b L_oo^(1 \/ 3) L_1^(2 \/ 3)) W_a . $ <eq:assembly-weighted-local>]
  Apply this with $w_(i j) = \| a_(i j)^(\( a \)) \|^2$ on surviving pairs. By (123) and $b = t_(n_0) t lt.eq t$,
  $ L_oo lt.eq C t^(.25 delta) \, #h(2em) L_1 lt.eq C t^(- 1 - .47 delta) \, #h(2em) b L_oo^(1 \/ 3) L_1^(2 \/ 3) lt.eq C t^(1 \/ 3 - .23 delta) . $
  Since $1 \/ 3 - .23 delta > .25 delta$ for $delta = .01$, we obtain
  #[#set math.equation(numbering: n => "(137)")
   $ sum_(i \, j in Q_a ∩ A_a) \| a_(i j)^(\( a \)) \|^2 \| f_i - f_j \|^2 lt.eq C t^(.25 delta) W_a . $ <eq:assembly-delta-local>]
  For the old factor in the cross term, apply the preceding-prefix bound (129) with a local extension. Choose a cutoff $chi_a$ equal to one on $Q_a$, supported in $Q'_a$, and with $\| nabla chi_a \| lt.eq C \/ D_s$. Set $F = chi_a alpha + chi_a \( v - c_a \) \|_(A_0)$. Cube Poincare gives
  $ parallel nabla \[ chi_a \( v - c_a \) \] parallel_2^2 lt.eq C (parallel nabla v parallel_(2 \, Q'_a)^2 + D_s^(- 2) parallel v - c_a parallel_(2 \, Q'_a)^2) lt.eq C parallel nabla v parallel_(2 \, Q'_a)^2 \, $
  and hence $W \( F \) lt.eq C W_a$. Differences of $F$ agree with those of $f$ on $Q_a^2$. The old Laplacian edge weights $p_i p_j \| h_(i j) \|^2$ are nonnegative; therefore (129) bounds their near commutator energy by $C W_a$. Weighted Cauchy–Schwarz with (137) proves that the near survivor-edge change has absolute form at most
  #[#set math.equation(numbering: n => "(138)")
   $ C t^(.125 delta) W_a . $ <eq:assembly-survivor-energy>]
  Indeed its cross term costs the square root of $C W_a dot.op C t^(.25 delta) W_a$, and its quadratic term costs $C t^(.25 delta) W_a$. The bounded factors $p_i p_j$ only alter the constants.
  ===== 7.2.6 The old energy carried through $O_a$. <the-old-energy-carried-through-o_a.>
  We next estimate $B_a$, the second term in (130). Test the old Schur minimum with the constant choice $f_x = c_a$ for all $x in O_a$. This gives
  #[#set math.equation(numbering: n => "(139)")
   $ 0 lt.eq B_a \( f \|_(A_a) \) lt.eq C sum_(i in A_a) sum_(x in O_a) F_(i x)^(\( a - 1 \)) \| f_i - c_a \|^2 . $ <eq:assembly-bridge-trial>]
  All old edges with both endpoints in $O_a$ vanish for this trial.
  For $i in Q_a$, put $l_i = sum_(x in O_a) F_(i x)^(\( a - 1 \))$. The row estimate above gives fourth-power rows below $.8 H_(*)$ at the old state $a - 1$. Cauchy–Schwarz and $\| O_a \| lt.eq C n_h$ imply
  $ max_i l_i lt.eq C sqrt(n_h H_(*)) = C t^(.27 delta) . $
  By symmetry and (135), $sum_i l_i lt.eq C n_h lt.eq C t^(- 1 - .46 delta)$. Thus
  $ b \( max_i l_i \)^(1 \/ 3) \( sum_i l_i \)^(2 \/ 3) lt.eq C t^(1 \/ 3 - \( 13 \/ 60 \) delta) lt.eq C t^(.27 delta) . $
  Apply Lemma 7 to the $v - c_a$ term in (139), and the supremum bound to its $alpha$ term. The resulting near contribution is at most $C t^(.27 delta) W_a$.
  The far part of this constant trial uses the old terminal geometry. If $i in.not Q_a$ and $x in O_a$, then
  $ d_(T_(a - 1)) \( i \, x \) gt.eq 1 / 2 \( "dist" \( i \, z_a \) - D_s \) - m' gt.eq c "dist" \( i \, z_a \) . $
  The old Combes–Thomas bound of Lemma 19 therefore gives, after summing the at most $C n_h$ removed sites,
  $ sum_(x in O_a) F_(i x)^(\( a - 1 \)) lt.eq t^(- P) e^(- c t D_s) e^(- c t "dist" \( i \, z_a \)) . $
  In (139) use
  $ \| f_i - c_a \|^2 lt.eq 3 #scale(x: 120%, y: 120%)[\(] \| alpha_i \|^2 + \| v_i - v_(z_a) \|^2 + \| v_(z_a) - c_a \|^2 #scale(x: 120%, y: 120%)[\)] . $
  After summing distinct anchors, the first two terms are bounded by (132) and (133), respectively. For the last term, cube Poincare gives the sufficient pointwise estimate
  $ \| v_(z_a) - c_a \|^2 lt.eq sum_(Q'_a) \| v - c_a \|^2 lt.eq C D_s^2 parallel nabla v parallel_(2 \, Q'_a)^2 . $
  Summing the far weights costs $C t^(- d)$, and summing these local gradient energies costs the halo overlap $C t^(- d nu)$. All remaining factors are powers of $t^(- 1)$, absorbed into $epsilon_t$. Hence the total far contribution from the Schur trials is at most
  #[#set math.equation(numbering: n => "(140)")
   $ epsilon_t \( parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 \) . $ <eq:assembly-bridge-tail>]
  ===== 7.2.7 Closing the comparison induction. <closing-the-comparison-induction.>
  Use the decomposition (130). Equations (138), (134), and (140), followed by halo overlap, imply for the current prefix and the one fixed split of $f$ that
  $ \| S_k \( f \) \| & lt.eq C t^(.125 delta) sum_(a lt.eq k) W_a + epsilon_t \( parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 \)\
 & lt.eq #scale(x: 120%, y: 120%)[\(] C t^(.125 delta - d nu) + epsilon_t #scale(x: 120%, y: 120%)[\)] \( parallel alpha parallel_2^2 + b^(- 1) parallel nabla v parallel_2^2 \) . $
  Take the infimum over all splits and use $W lt.eq C D_0$. Since
  $ .125 delta - d nu = .12499 delta > .10 delta \, $
  the resulting estimate is at most $1 / 2 t^(.10 delta) D_0 \( f \)$ for sufficiently small $t$. This is a strict improvement of the induction bound. It also makes the kernel of $D_0 + S_k$ precisely the constants. Since $A_k$ is nonempty, its Schur pivot on $E_k$ exists. The zero extension of $L_k$ and associativity of Schur complements now give
  $ "Schur"_(E_k) \( D_0 + S_k \) = "Schur"_(O_k) \( D_(k - 1) + L_k \) = "Schur"_(O_k) D_(k - 1) + L_k = D_k . $
  This continues (128) and gives the constant kernel of $D_k$. Thus the form induction closes. The diagonal and row estimates proved above also preserve the trial-start margins. The application uses no comparison for $D$ or cap on $K$ at an intermediate heat of a provisional trial.
  Finally (128) holds also at prefix $k$. For a neutral charge supported in $A_k$, inversion of a Schur complement gives the inverse quadratic form of $D_0 + S_k$ on its zero extension. The inequalities $\( 1 - epsilon.alt \) D_0 lt.eq D_0 + S_k lt.eq \( 1 + epsilon.alt \) D_0$ therefore imply (127) by inversion on the space modulo constants. ◻
]

=== 7.3 Resetting the diagonal <resetting-the-diagonal>

The completed stage has changed the resolvent while keeping $r$ frozen. We restore the relation $r_i = g_(i i)$ by a small deterministic change in $r$. This is the only reset between consecutive ordinary sweeps.

#thm([Proposition 7.4.])[
  (Diagonal reset).  #emph[Let $g = \( M - t "diag" r \)^(- 1)$ on a nonempty active set, where $M$ is real symmetric, $r$ is bounded, and $0 < c lt.eq p_i = Im r_i lt.eq C$. Assume $ker D = bb(C) upright(bold(1))$. Suppose $q_i = Im g_(i i) lt.eq C$, the lag $e' = "diag" \( g \) - r$ satisfies $parallel e' parallel_oo = o \( t^(.36 delta) \)$ uniformly in the construction parameters, and 
$ parallel K parallel < 1 / 2 \, #h(2em) parallel \( I - K \)^(- 1) parallel_(oo arrow.r oo) lt.eq C log \( 1 \/ t \) . $

 For small $t$ there is a measurable vector $zeta$, with $parallel zeta parallel_oo lt.eq t^(.35 delta)$, such that for $r' = r + zeta$ and $g' = \( M - t "diag" r' \)^(- 1)$ one has $g'_(i i) = r'_i$. Writing $rho = parallel zeta parallel_oo$, the changes satisfy 
#[#set math.equation(numbering: n => "(141)")
 $ max_i parallel Delta h_i parallel_2 & lt.eq C rho \, & max_(i \, j) \| Delta h_(i j) \| & lt.eq C sqrt(t) thin rho \, & max_i parallel Delta h_i parallel_4 & lt.eq C t^(1 \/ 4) rho \,\
parallel K' - K parallel & lt.eq C rho \, & \( 1 - C rho \) D & lt.eq D' lt.eq \( 1 + C rho \) D . $ <eq:assembly-reset-rows>]

 Here $D'$ uses $p' = Im r'$, which remains in a fixed positive bounded range. The corresponding inverse forms on neutral charges change by a factor $1 + O \( rho \)$.]
] <prop:reset>

#proof[
  The dissipative inverse bound gives $parallel g parallel lt.eq C \/ t$, and Ward gives
  $ parallel g_(i dot.op) parallel_2^2 = t^(- 1) sum_j \| h_(i j) \|^2 lt.eq C \/ t . $
  For a vector $z$ in a sufficiently small fixed $ell^oo$ ball, put $Z = "diag" z$ and $g_z = \( M - t "diag" \( r + z \) \)^(- 1)$. The Neumann series converges because $parallel t Z g parallel lt.eq C parallel z parallel_oo$. Its first diagonal derivative is $t sum_j g_(i j)^2 z_j = \( K z \)_i$. Thus
  #[#set math.equation(numbering: n => "(142)")
   $ "diag" \( g_z \) = "diag" \( g \) + K z + cal(R) \( z \) \, #h(2em) parallel cal(R) \( z \) parallel_oo lt.eq C parallel z parallel_oo^2 . $ <eq:assembly-reset-taylor>]
  For completeness, every diagonal term of order $k gt.eq 2$ is bounded using the two endpoint rows and $k - 1$ intervening operator norms:
  $ t^k \( C t^(- 1 \/ 2) \)^2 \( C t^(- 1) \)^(k - 1) parallel z parallel_oo^k lt.eq C^(k + 1) parallel z parallel_oo^k . $
  The same expansion, replacing one factor of $z$ by $z - w$, proves
  $ parallel cal(R) \( z \) - cal(R) \( w \) parallel_oo lt.eq C a parallel z - w parallel_oo quad upright("if ") parallel z parallel_oo \, parallel w parallel_oo lt.eq a . $
  There is no volume or negative power of $t$ in either constant.
  Set $P = \( I - K \)^(- 1)$. The reset equation is
  $ z = P \( e' + cal(R) \( z \) \) . $
  Take $a = t^(.35 delta)$. The image of the radius-$a$ ball has radius at most
  $ C log \( 1 \/ t \) #scale(x: 120%, y: 120%)[\(] o \( t^(.36 delta) \) + C t^(.70 delta) #scale(x: 120%, y: 120%)[\)] = o \( a \) \, $
  and its Lipschitz constant is at most $C log \( 1 \/ t \) t^(.35 delta) = o \( 1 \)$. It is therefore a contraction. Its unique fixed point in that ball is $zeta$. Iteration from zero proves measurability in the initial data. For small $t$, its imaginary part cannot move $p$ out of a fixed positive bounded range.
  The exact resolvent identity, in the $h$ normalization, is
  $ Delta h = h sqrt(t) thin "diag" \( zeta \) h' . $
  Both old and new inverse operator norms are $O \( t^(- 1) \)$; their endpoint row norms in the $h$ normalization are bounded. For the new rows this follows also by multiplying an old row by the convergent Neumann factor. The identity gives $parallel Delta h_i parallel_2 lt.eq C rho$, and Cauchy–Schwarz using its two endpoint rows gives $\| Delta h_(i j) \| lt.eq C sqrt(t) thin rho$. Interpolating these two estimates proves $parallel Delta h_i parallel_4 lt.eq C t^(1 \/ 4) rho$. Since
  $ sum_j \| K'_(i j) - K_(i j) \| lt.eq parallel Delta h_i parallel_2 \( parallel h'_i parallel_2 + parallel h_i parallel_2 \) lt.eq C rho \, $
  symmetry and the row-sum bound prove the norm assertion for $K$.
  For a real diagonal potential $f$, put $B = sqrt(t) thin "diag" \( zeta \)$. Then $h' = \( h^(- 1) - B \)^(- 1)$ and $\[ f \, B \] = 0$, so $\[ f \, h' \] = h' h^(- 1) \[ f \, h \] h^(- 1) h'$. Factoring the outside matrices gives the exact identity
  #[#set math.equation(numbering: n => "(143)")
   $ \[ f \, h' \] = \( I - h sqrt(t) thin "diag" zeta \)^(- 1) \[ f \, h \] \( I - sqrt(t) thin "diag" zeta thin h \)^(- 1) . $ <eq:assembly-reset-commutator>]
  Write the two outside factors as $L$ and $R$. Each, and each inverse, differs from identity by $O \( rho \)$ in operator norm, since $parallel h parallel = O \( t^(- 1 \/ 2) \)$. Keep the nonconstant $p$ factors explicitly: if $P_p = "diag" \( sqrt(p) \)$ and $C_f = P_p \[ f \, h \] P_p$, then
  $ P_p \[ f \, h' \] P_p = \( P_p L P_p^(- 1) \) C_f \( P_p^(- 1) R P_p \) . $
  The outside factors and their inverses are $I + O \( rho \)$, because $P_p$ and $P_p^(- 1)$ have bounded norm. Their multiplication changes the Hilbert–Schmidt norm by two-sided factors $1 + O \( rho \)$. Finally $p'_i \/ p_i = 1 + O \( rho \)$ uniformly, so replacing $P_p$ by $P_(p')$ has the same relative cost. Because
  $ 2 D \( f \) = parallel sqrt(p) thin \[ f \, h \] sqrt(p) parallel_(upright("HS"))^2 \, $
  we obtain (141). These two-sided inequalities preserve the constant kernel, and inversion on the neutral subspace proves the final assertion. ◻
]

=== 7.4 Closure of the deterministic induction <closure-of-the-deterministic-induction>

We can now return from a completed stage to the same assumptions with which the next stage begins. The probabilistic work in the next section will control how many pending sites remain; the result here applies pathwise to every finite history produced by the trial rules, with numerical rollback on failure.

#thm([Proposition 7.5.])[
  (Uniform stage bounds).  #emph[Choose the fixed energy window and the initialization constants as in Proposition 10. For sufficiently large $n_0$, uniformly in $m gt.eq 4 n_0$ and in the fixed energy in that window, the following statements hold along every finite history produced by the ordinary-sweep and clearing rules, with failed trials rolled back. At each completed stage start the diagonal fixed-point relation, the three comparisons (7), the fourth-row bound $max_i sum_j \| h_(i j) \|^4 lt.eq t^(1 + delta)$, and $parallel K parallel lt.eq 1 \/ 3$ hold. The vectors $r$ remain bounded with their imaginary parts in one fixed positive bounded range. The low comparison constants remain in fixed positive bounded ranges, and the rough high constant $C_0$ can be chosen independently of the stage. The kernel of $D$ consists of the constants, at least $N \/ 2$ sites remain active, and the terminal metric satisfies (121).]
  #emph[During a clearing stage, every committed prestate has lag $o \( t^(.36 delta) \)$, fourth-row sums below $.8 t^(1 + delta)$, and the comparison bounds furnished by Proposition 35. No comparison for $D$ or bound on $K$ is asserted at a provisional heat prefix. All constants and smallness thresholds are independent of the history and of the torus volume.]
] <prop:deterministic-induction>

#proof[
  Initialization supplies the assertions at the first stage, with $parallel K parallel = o \( 1 \)$. Enlarge the permitted bounds on $r$, $p$, and the low comparison constants by fixed factors, retaining positive lower bounds. We show that the estimates obtained under these enlarged ranges remain inside them. The form equivalence $D asymp W$ used below follows from the upper rough comparison for $X$, and from the two lower bounds $X gt.eq c b Lambda^(+)$ and $X gt.eq c I$.
  Apply Proposition 26 at the old scale $t_(upright("old"))$, and write $t = theta t_(upright("old"))$. On neutral physical-site charges define the comparison form
  #[#set math.equation(numbering: n => "(144)")
   $ cal(X) = theta X_(upright("old")) + \( 1 - theta \) "diag" \( p^(- 2) \) \, $ <eq:assembly-affine-reset>]
  The exact reserve-port identity in Lemma 11 identifies $cal(X)$ with $theta X_0$ restricted to reserve charges, where $X_0$ is the duplicated stage-start inverse form. Proposition 26 places the actual post-sweep inverse form between $\( 1 - epsilon.alt \) cal(X)$ and $\( 1 + epsilon.alt \) cal(X)$, with $epsilon.alt = C t_(upright("old"))^(.10 delta)$. The low scale changes from $b_(upright("old"))$ to $theta b_(upright("old"))$. The physical lag after the sweep is $O \( t^(.42 delta) \)$, its fourth-row sums are below $.7 t^(1 + delta)$, and its $K$ norm has increased by at most $C t_(upright("old"))^(.10 delta)$.
  If this stage is within the clearing cutoff, consider its snapshot components in their prescribed order. The post-sweep state satisfies (122): its lag and row margins were just obtained, and the form equivalence supplies its comparison. At the first trial, and then at any trial whose preceding prefix has the bounds of Proposition 35, the lag and row hypotheses of Proposition 32 hold. The location induction of Lemma 34 applies throughout the stopped trial. On DONE, the heat and core calculation following Proposition 35 supplies its two operation inputs for the new numerical endpoint. Applying that proposition to the enlarged prefix gives a total relative form error $O \( t^(.10 delta) \)$. Its proof bounds the total $K$ increment by $C t^(.125 delta - d nu)$ and the final lag by $C t^(.42 delta - d nu) = o \( t^(.36 delta) \)$. In fourth-row norm the cumulative change, divided by $t^(\( 1 + delta \) \/ 4)$, is $O \( t^(.0225 delta - d nu) \) = o \( 1 \)$. For large $n_0$ it moves the sweep’s $.7$ bound to a bound strictly below $.8$, uniformly at every committed prefix. These bounds supply the starting margins for the next component. Failed trials restore the previous analytic state; their new pending marks do not alter any of these bounds. If no clearing is scheduled, the sweep endpoint itself has the stronger required estimates.
  The committed endpoint has $parallel K parallel < 1 \/ 2$ once the total summable increments are chosen small. Lemma 20, applied with its lag and the terminal metric, gives $parallel \( I - K \)^(- 1) parallel_(oo arrow.r oo) lt.eq C log \( 1 \/ t \)$. Proposition 36 now restores $g_(i i) = r_i$. Its fourth-row norm cost relative to $t^(\( 1 + delta \) \/ 4)$ is
  $ C t^(1 \/ 4) t^(.35 delta) \/ t^(\( 1 + delta \) \/ 4) = C t^(.10 delta) = o \( 1 \) . $
  The full fourth-row bound is therefore restored. Its form error is $O \( t^(.35 delta) \)$, and the change of $r$ and the additional $K$ cost are bounded by the same power.
  It remains to check the three individual comparison constants. For the sharp upper bound, (144) transforms the diagonal coefficient $1 + t_(upright("old"))^kappa$ into $1 + theta t_(upright("old"))^kappa$. Clearing, sweep, and reset change this by $O \( t_(upright("old"))^(.10 delta) \)$; the change from $p$ to $p'$ at reset has the smaller error $O \( t^(.35 delta) \)$. For $theta in \[ .25 \, .625 \]$, continuity and $kappa < 1$ give
  $ inf_(theta in \[ .25 \, .625 \]) \( theta^kappa - theta \) > 0 . $
  Thus, for small $t_(upright("old"))$,
  $ 1 + theta t_(upright("old"))^kappa + C t_(upright("old"))^(.10 delta) lt.eq 1 + \( theta t_(upright("old")) \)^kappa \, $
  because $.10 delta > kappa = .005 delta$. For the rough upper bound the high coefficient is at most
  $ \( 1 + o \( 1 \) \) #scale(x: 120%, y: 120%)[\(] theta C_0 + C #scale(x: 120%, y: 120%)[\)] . $
  Choosing $C_0$ large first and $n_0$ large second keeps this below $C_0$, since $theta lt.eq .625$. Both low comparison coefficients change only by factors $1 + O \( t_(upright("old"))^(.10 delta) \)$; the lower factor is interpreted as $1 - O \( t_(upright("old"))^(.10 delta) \)$.
  All these errors are bounded by a constant times $4^(- c n)$ for a fixed $c > 0$. Their sum from $n_0$ onward can be made arbitrarily small, and the corresponding positive products stay bounded above and away from zero. This closes the enlarged ranges for the low constants, $r$, and $p$. It also keeps $parallel K parallel lt.eq 1 \/ 3$, using the initialization margin and the summable norm increments. Bounded $p \, q$ give $parallel D parallel lt.eq C$, hence $X gt.eq c I$ on neutral charges. Relative form comparisons and Schur complementation preserve the one-dimensional constant kernel. The geometry and active-count bounds are supplied independently by Lemma 34. After the clearing cutoff the terminal set no longer changes, and the permissible metric defect $t^(- 1.03)$ only increases as $t$ decreases, so the same metric bound continues to hold.
  Finally, if $a_lambda = \( lambda^2 \/ 3 \) 4^(n_0)$, then $a_lambda in \( 1 \/ 4 \, 1 \]$ and $t_n = a_lambda \( 4^(- n) + 4^(- m) \)$. The geometric sums and smallness choices above are therefore uniform in $m$ and in the energy after the initialization window has been fixed. One fixed dimension-dependent lower threshold for $n_0$ suffices simultaneously for all $m gt.eq 4 n_0$, $a_lambda in \( 1 \/ 4 \, 1 \]$, and $E in I_d$. For $d gt.eq 4$, the intrinsic choice of the final disorder threshold will be made in Definition 39 after the probability estimates. The argument proves preservation along every finite history produced by the rules; almost-sure termination of ordinary retries is a separate consequence of their conditional failure bound, used in the next section. ◻
]

== 8 Failure histories and removal of pending sites <sec:history>

We now use the conditional trial bounds to show that all pending sites disappear with high probability before the last half of the scales. A final sweep will then replace every remaining partial potential by its true value. Throughout this section, the dimension $d gt.eq 3$, the energy $E in I_d$, and the coupling $lambda$ are fixed. Probabilities initially include the auxiliary randomness used in the construction, and every cutoff below may depend on $d$.

At the start of a reached scale $n$, a coupled active site has used exactly its first $n - n_0$ true digits and no digit in its remaining suffix has been queried. The ordinary rules in Section 5 and the clearing rules in Section 7 prove this invariant; Lemma 4 supplies the conditional law of the unqueried coordinates. Pending is a conservative status at which the construction makes no such claim; a pending site can leave that status only by becoming a committed terminal. In particular, the same invariant survives a numerical rollback: the affected active sites are marked pending, while the revealed answers stay in the retained history.

At each scheduled trial start reached after a finite history produced by these rules, including histories with failed trials, these checks verify the random-input hypotheses of Propositions 26 and 32. The ordinary argument also proves, by successive conditioning, that auxiliary retries terminate almost surely. Each clearing trial has a finite heat limit. Its ridge choices and the diagonal reset after a stage are measurable functions of the known numerical state, so neither exposes further randomness. At fixed $m$ there are finitely many scales, tiles, and snapshot components, so the construction reaches each subsequent scheduled trial after an almost surely finite number of operations. We use these conditional conclusions below; the numerical bounds along committed states are the pathwise conclusion of Proposition 37.

=== 8.1 Birth labels and chronological probability bounds <birth-labels-and-chronological-probability-bounds>

A #emph[birth] is a first tile-trial failure in a one-digit sweep or a failed clearing trial. Give a one-digit sweep from scale $j - 1$ to $j$ the post-sweep index $j$. The late-failure bound below treats the final residual sweep separately. A birth label consists of this index, its type, and its tile or snapshot-component anchor. Tile and clearing labels are distinct even when their physical anchors coincide. Each birth assigns its label to every site covered by that failure’s marking rule, replacing any label the site already carried. At the end of each clearing stage, including the last stage before the cutoff check, every pending site thus carries its latest birth label.

There is a deterministic ordering of all possible labels: increasing scale, the prescribed tile order within each sweep, and then increasing site order for possible clearing anchors. At an anchor absent from the frozen snapshot, or belonging to a component too large to be attempted, insert a skipped slot. Auxiliary retries create no further birth labels. Use one designated site as the label anchor for every one-digit tile. After a global abort, continue this bookkeeping list by recording all remaining slots as skipped. The list of possible labels is deterministic even though eligibility of a particular clearing anchor and the time spent on earlier retries depend on history.

Let $B_a$ be the indicator of a birth at a potential label $a$, with value zero at a skipped slot, and let $cal(F)_a^(-)$ be the retained history just before that slot. In the operation filtration of Lemma 4, the time at which this slot is reached is a stopping time: the preceding queries, trial outcomes, and decisions to schedule or skip a slot are all recorded. It is almost surely finite by the retry bound above. Thus $cal(F)_a^(-)$ is the corresponding stopped history, and whether the slot is scheduled is $cal(F)_a^(-)$-measurable. The uniform conditional trial estimates imply, for some fixed $c > 0$ and sufficiently large $n_0$,

#[#set math.equation(numbering: n => "(145)")
 $ bb(E) \( B_a divides cal(F)_a^(-) \) lt.eq p_(j \( a \)) \, #h(2em) p_j = exp \( - 4^(c j) \) . $ <eq:history-birth>]

Here the exponent has been decreased to absorb fixed constants and the one-unit difference between sweep and post-sweep indices. Indeed, writing $a_lambda = \( lambda^2 \/ 3 \) 4^(n_0)$ gives

#[#set math.equation(numbering: n => "(146)")
 $ 1 / 4 < a_lambda lt.eq 1 \, #h(2em) t_j = a_lambda \( 4^(- j) + 4^(- m) \) \, #h(2em) 1 / 4 4^(- j) < t_j lt.eq 2 thin 4^(- j) quad \( j lt.eq m \) . $ <eq:history-scale-comparison>]

For any distinct, deterministically specified labels $a_1 < dots.h.c < a_s$,

#[#set math.equation(numbering: n => "(147)")
 $ bb(P) \( B_(a_1) = dots.h.c = B_(a_s) = 1 \) lt.eq product_(b = 1)^s p_(j \( a_b \)) . $ <eq:history-joint>]

To prove this, the product of the first $s - 1$ indicators is measurable before the last slot. Apply (145) to the last indicator and repeat backwards. The stopped histories include every query made during the almost surely finite intervening retries. Hence their random durations do not affect the chronological argument. Equation (147) does not assert independence of births. Adaptive anchors will be handled by a union over deterministic possible labels.

=== 8.2 Witnesses for a surviving pending site <witnesses-for-a-surviving-pending-site>

The remaining task is to exploit the small conditional probabilities of births. Pending sites can survive a clearing stage without a new failure only by belonging to a component too large to clear. Such a component provides many separated pending sites at a much earlier scale.

An eligible component at scale $j$ has at most $t_j^(- nu)$ sites. Its $R_j$-connectedness and the inspection radius imply that every site marked by its failed trial lies at distance at most

#[#set math.equation(numbering: n => "(148)")
 $ C t_j^(- nu) R_j + ell_j lt.eq C 4^(\( 8 + nu \) j) $ <eq:history-mark-radius>]

from its anchor. The same bound holds for a tile birth, whose marks lie in a tile of side $4^(6 \( j - 1 \))$.

After clearing stage $j$, every pending site is either a mark of a failure at that stage or belongs to a huge snapshot component, meaning one with more than $t_j^(- nu)$ vertices. This includes pending marks made during the preceding sweep, since they were present when the snapshot was taken. Eligible components disappear on success and receive a new label on failure. Separation and the pivot-locality argument in Section 7 prevent another component’s trial from touching a huge component.

We also use the following persistence observation. If a site is pending at the end of stage $j$ and its latest birth index is at most $r < j$, then it was pending at the end of stage $r$. It could not have become coupled in between, and if it had become terminal it could never have been marked again.

#thm([Proposition 8.1.])[
  (Pending-site bound).  #emph[There is a constant $c_(upright(h)) > 0$ such that, after increasing the fixed lower cutoff $n_0$ if necessary, for every $n_0 lt.eq j lt.eq floor.l m \/ 2 floor.r$ and every torus site $x$, 
$ bb(P) \( x upright(" is pending at the end of stage ") j \) lt.eq exp \( - 4^(c_(upright(h)) j) \) . $

 All constants are uniform in $m \, E \, lambda$ in the stated ranges.]
] <prop:witness-bound>

#proof[
  Put
  $ alpha_(upright(h)) = nu \/ \( 100 d \) \, #h(2em) beta_(upright(h)) = 0.2 nu \, #h(2em) W_j = 4^(10 j) \, quad r = floor.l alpha_(upright(h)) j floor.r \, quad k_j = floor.l 4^(beta_(upright(h)) j) floor.r . $
  The radius $W_j$ will contain both the possible reach of a stage-$j$ failure and the connected exploration of a huge component near the root. Passing to the much earlier scale $r$ makes a ball of radius $3 W_r$ small compared with that component. We will retain only $k_j$ of the separated older sites obtained this way. The estimates below verify these three uses of the choices.
  We define a deterministic family of finite rooted trees, called witnesses. A leaf of a scale-$j$ witness rooted at $x$ specifies one birth label of index $s$ with $n_0 < s lt.eq j$ and $s > r$, whose anchor is within distance $W_j \/ 2$ of $x$. Alternatively, when $r gt.eq n_0$, an internal vertex specifies $k_j$ child centers within distance $W_j \/ 2$ of $x$, separated from each other by more than $3 W_r$, and a scale-$r$ witness at each child. The family at scale $n_0$ is empty, since there are initially no pending sites. The scales strictly decrease down a branch, so every tree is finite.
  ===== 8.2.1 Extracting a witness and separating its leaf labels. <extracting-a-witness-and-separating-its-leaf-labels.>
  We first show that a pending site yields a witness all of whose leaf births occurred. A site newly marked by a clearing failure has a stage-$j$ birth nearby, giving a leaf by (148). Otherwise it lies in a huge snapshot component. Explore a connected set of
  $ M_j = floor.l t_j^(- nu) floor.r + 1 gt.eq c_1 4^(nu j) $
  distinct vertices starting at $x$. Each is within distance $M_j R_j lt.eq C 4^(\( 8 + nu \) j)$ of $x$. If one has latest birth index $s > r$, its birth anchor is within $C 4^(\( 8 + nu \) j) + C 4^(\( 8 + nu \) s) < W_j \/ 2$ of $x$, once $n_0$ is large. This again gives a leaf.
  If no such latest birth exists, all explored sites were pending at end $r$, by persistence. Necessarily $r gt.eq n_0$. A ball of radius $3 W_r$ contains at most
  $ C W_r^d = C 4^(10 d r) lt.eq C 4^(0.1 nu j) $
  sites. Greedy packing of the explored set therefore supplies at least $c_2 4^(0.9 nu j)$ centers with the required separation, more than $k_j$ for sufficiently large $n_0$. Choose $k_j$ and recursively extract their witnesses. Their centers lie within $W_j \/ 2$ of $x$.
  Every birth anchor in a scale-$j$ witness is within $W_j$ of its root. For a leaf this is immediate. For an extracted branch it follows from
  $ C 4^(\( 8 + nu \) j) + W_r < W_j . $
  For the entire deterministic witness family the same conclusion follows from $W_j \/ 2 + W_r < W_j$. Thus different child witnesses have disjoint sets of possible physical birth anchors: their support balls have radius $W_r$ and centers more than $3 W_r$ apart. Induction shows that all leaf birth labels in a witness are distinct. This is the reason for spatial separation; no spatial independence is needed.
  ===== 8.2.2 Summing deterministic witness weights. <summing-deterministic-witness-weights.>
  First fix a deterministic possible witness tree, including all its centers and leaf labels. Its leaves have distinct labels, so (147) bounds the probability that all its leaves occur by the product of their $p_s$’s. Assign this product as the tree’s weight. Let $Z_j$ be the supremum over roots of the sum of these weights over all allowed scale-$j$ witnesses, and put $Z_(n_0) = 0$. The deterministic family is finite at every scale. A union bound now bounds the pending probability by $Z_j$. The adaptive extraction above proves only existence of a member of this family; we do not condition on the tree extracted from a realized component. A related expansion into deterministic trees of separated lower-scale events appears in Sznitman’s treatment of cascading events #cite(label("Sznitman2012")) Definition 3.1 and proof of Theorem 3.4. Here the chronological conditional bound (147) supplies the product weight for distinct birth labels.
  There are at most $C j W_j^d$ possible leaf labels, since there are at most $j$ scales, two types, and $C W_j^d$ anchor positions. In counting branches, order the child centers and discard their separation constraint to obtain an upper bound. Hence
  #[#set math.equation(numbering: n => "(149)")
   $ Z_j lt.eq C j W_j^d exp { - 4^(c max \( n_0 \, r \)) } + \( C W_j^d Z_r \)^(k_j) \, #h(2em) r = floor.l alpha_(upright(h)) j floor.r . $ <eq:history-recursion>]
  The second term is absent when $r < n_0$, and vanishes at $r = n_0$.
  ===== 8.2.3 Closing the numerical recursion. <closing-the-numerical-recursion.>
  Choose
  #[#set math.equation(numbering: n => "(150)")
   $ c_(upright(h)) = min { c alpha_(upright(h)) \/ 4 \, nu \/ 20 } > 0 . $ <eq:history-exponent>]
  Then $c_(upright(h)) < c alpha_(upright(h))$ and $beta_(upright(h)) + c_(upright(h)) alpha_(upright(h)) - c_(upright(h)) gt.eq .15 nu > 0$. We prove $Z_j lt.eq e^(- 4^(c_(upright(h)) j))$ by induction. The leaf term in (149) requires care when $alpha_(upright(h))$ is tiny. If $r < n_0$, then
  $ j < \( n_0 + 1 \) \/ alpha_(upright(h)) \, #h(2em) c_(upright(h)) j lt.eq c \( n_0 + 1 \) \/ 4 . $
  Its logarithm is at most
  $ log \( C j \) + 10 d j log 4 - 4^(c n_0) lt.eq - 4^(c_(upright(h)) j) - log 2 $
  after one fixed increase of $n_0$: the entropy is $O_d \( n_0 \/ alpha_(upright(h)) \)$, whereas $4^(c n_0)$ dominates both that quantity and $4^(c \( n_0 + 1 \) \/ 4)$. This treats the entire, possibly very long, nonrecursive range. If $r gt.eq n_0$, use $j < \( r + 1 \) \/ alpha_(upright(h))$ and $c_(upright(h)) j lt.eq c \( r + 1 \) \/ 4$ instead. Now $4^(c r)$ dominates the entropy $O_d \( \( r + 1 \) \/ alpha_(upright(h)) \)$ and the target exponent $4^(c \( r + 1 \) \/ 4)$, uniformly for $r gt.eq n_0$. The same half-bound for the leaf term follows. These thresholds depend on $d$ but not on $m$.
  For the second term, assume $r gt.eq n_0$ and $Z_r > 0$; otherwise it vanishes. A single fixed increase of $n_0$ ensures, for every integer $u gt.eq n_0$,
  #[#set math.equation(numbering: n => "(151)")
   $ 4^(c_(upright(h)) u) gt.eq 2 (log C + 10 d log 4 thin frac(u + 1, alpha_(upright(h)))) . $ <eq:history-initial-entropy>]
  Such a choice is possible because exponential growth dominates the fixed linear function on the right. Since $j < \( r + 1 \) \/ alpha_(upright(h))$, the induction hypothesis now gives
  $ log \( C W_j^d Z_r \) lt.eq - 1 / 2 4^(c_(upright(h)) r) . $
  Using $k_j gt.eq 4^(beta_(upright(h)) j) \/ 2$ and $r gt.eq alpha_(upright(h)) j - 1$, we obtain
  $ \( C W_j^d Z_r \)^(k_j) lt.eq exp { - 1 / 4 4^(- c_(upright(h))) 4^(\( beta_(upright(h)) + c_(upright(h)) alpha_(upright(h)) \) j) } lt.eq 1 / 2 e^(- 4^(c_(upright(h)) j)) . $
  Together with the first half-bound this closes the induction. Condition (151) explicitly includes the first recursive scales, when the parent index can be nearly $n_0 \/ alpha_(upright(h))$; it requires no dependence of $n_0$ on $m$.
  Finally, these geometric counts are valid on the torus. Since $j lt.eq floor.l m \/ 2 floor.r$, every support radius is at most $W_j lt.eq 4^(5 m)$, whereas the side is $4^(20 m)$. All exploration and separation estimates therefore use the same uniform $d$-dimensional ball bounds as on the lattice. ◻
]

=== 8.3 The cutoff and the last true-tail sweep <the-cutoff-and-the-last-true-tail-sweep>

We can now finish the finite-volume construction. Write $J = floor.l m \/ 2 floor.r$. Proposition 38 and the volume $N = 4^(20 d m)$ give

#[#set math.equation(numbering: n => "(152)")
 $ bb(P) \( upright("some site is pending at end ") J \) lt.eq exp { 20 d m log 4 - 4^(c_(upright(h)) J) } arrow.r 0 . $ <eq:history-cutoff>]

Abort if this event occurs. Otherwise every active site is coupled. Thereafter no clearing is scheduled, so a new pending site would have no later route to a committed terminal before the final sweep. We therefore perform ordinary sweeps without clearing and abort at the first first-trial failure. There are at most $\( m + 1 \) N$ possible tile trials in these stages, including the final sweep. Give a trial after a previous abort failure indicator zero. Successive conditioning and the uniform trial bound yield

#[#set math.equation(numbering: n => "(153)")
 $ bb(P) \( upright("a later ordinary failure before abort") \) lt.eq C \( m + 1 \) N exp \( - 4^(c J) \) arrow.r 0 \, $ <eq:history-late-failure>]

decreasing $c$ once more if necessary. No independence between the late trials is asserted.

These two errors are also small uniformly over every $m gt.eq 4 n_0$, once $n_0$ is sufficiently large. Indeed, with $q = min \( c \, c_(upright(h)) \) > 0$ and $a = 20 d log 4$, their sum is at most

#[#set math.equation(numbering: n => "(154)")
 $ \[ 1 + C \( m + 1 \) \] exp { a m - 4^(q \( m \/ 2 - 1 \)) } . $ <eq:history-uniform-abort>]

Choose a dimension-dependent $M$ so large that for all $m gt.eq M$, $4^(q \( m \/ 2 - 1 \)) gt.eq \( a + 2 \) m$ and $1 + C \( m + 1 \) lt.eq e^m$. Then (154) is at most $e^(- m)$ whenever $m gt.eq 4 n_0 gt.eq M$. The scale comparison (146) makes this estimate uniform in $a_lambda in \( 1 \/ 4 \, 1 \]$ and $E in I_d$ as well.

Consider a retained history that reaches the start of scale $m$ without abort. Every active site is still coupled, so its true residual $xi_i$ has not been queried. Lemma 4 gives its uniform law with variance $s_m = eta$, conditionally independent between sites. Reaching this stage is decided by retained information; the law does not condition on eventual success of the final sweep. For that sweep take

$ t = 2 eta \, #h(2em) w = theta = 1 / 2 \, #h(2em) xi_(0 \, i) = xi_i \/ sqrt(w) = sqrt(2) thin xi_i . $

Then, conditional on its pre-query history,

$ bb(E) xi_(0 \, i) = 0 \, #h(2em) bb(E) xi_(0 \, i)^2 = t \, #h(2em) \| xi_(0 \, i) \| lt.eq sqrt(3 t) . $

These are the bounded-input moment hypotheses of Proposition 26. The entire residual, rather than one digit, may therefore be consumed in this final sweep. If $k = w^(1 \/ 4)$ and $r_(upright("bit")) = k^2 r_(upright("phys"))$, the physical diagonal update is exactly

$ k^2 \( xi_(0 \, i) + t r_(upright("bit")) \) = sqrt(w) thin \( xi_i \/ sqrt(w) + t sqrt(w) thin r_(upright("phys")) \) = xi_i + eta r_(upright("phys")) . $

It inserts the full true residual and leaves the artificial term $- eta r_(upright("phys"))$ from the previous $- 2 eta r_(upright("phys"))$. The reserve normalization is $sqrt(theta t) = sqrt(eta)$. No reset is needed after this sweep.

#proof[
  #emph[Completion of the proof of Proposition 3.] Initialization and Proposition 37 provide the committed-state invariants throughout the construction. Lemma 4, together with the ordinary and clearing query rules verified in Sections 5 and 7, supplies all conditional random-input hypotheses, including after failed trials. Preliminary auxiliary retries terminate almost surely. By (152) and (153), with probability $1 - o_m \( 1 \)$ the cutoff finds no pending site and every subsequent sweep, including the whole-tail sweep, succeeds.
  On that event all terminal sites have their exact true potentials, and the last sweep makes every remaining active potential true as well. The active set $A$ has cardinality at least $N \/ 2$ by the deterministic induction. Its final frozen coefficients satisfy $\| r_i \| lt.eq C$ and $c lt.eq Im r_i lt.eq C$; the endpoint diagonal-lag bound of the last ordinary sweep gives an active diagonal imaginary part at least a fixed positive constant. The final active inverse is precisely the Schur inverse of
  $ H_m - E - eta "diag"_A r . $
  The true terminal principal block is invertible on the probability-one event established in Section 2, and the active Schur block has strictly negative definite imaginary part before inversion. Thus the full inverse exists and has the asserted active diagonal entries.
  The analytic interpolation exponents remain $4 \/ 3 \, 2 \/ 3$ in all dimensions: Section 3 proves a deliberately weaker Fourier bound requiring only $d gt.eq 3$. The common choice of $nu$ leaves $d nu = 10^(- 5) delta$, below every analytic gain consumed by packing. The additional factor $d$ in the history scale ratio is needed for the count of spatial witnesses in Section 8.
  All numerical lower bounds on $n_0$, including (151), are fixed independently of $m$, $a_lambda in \( 1 \/ 4 \, 1 \]$, and $E in I_d$. For every starting index above this dimension-dependent cutoff, the certificate probability tends to one as $m arrow.r oo$ and is at least $1 \/ 2$ uniformly for all $m gt.eq 4 n_0$ after a further fixed increase of the cutoff. This proves the certificate with its stated uniform constants. ◻
]

Although $A$ and $r$ may depend on both true and auxiliary variables, the true potential vector has its prescribed iid law as the unconditional marginal of the enlarged space. Each joint success witnesses the assertion in the true variables that a qualifying certificate exists for $H_m$. Section 9 proves that this feasibility event is Borel. Its probability under the true product law is at least the joint success probability. The spectral averaging is then unconditional under that law.

=== 8.4 An intrinsic positive disorder threshold <an-intrinsic-positive-disorder-threshold>

In this subsection only, fix $d gt.eq 4$. We specify its threshold by finite matrices and a fixed success probability. This avoids leaving an arbitrary choice among the many smallness constants in the preceding estimates. For $d = 3$ we retain the existential threshold in Proposition 3.

#prodef([Definition 8.2.])[
  (Finite-box threshold).  For the fixed dimension $d gt.eq 4$, let $n_(*) \( d \)$ be the least integer $k gt.eq 10$ with the following property. For every pair of integers $n_0 gt.eq k$ and $m gt.eq 4 n_0$, every $u in \( 1 \/ 4 \, 1 \]$, and every $E in I_d = - 2 d + \( 1 \/ 200 \, 1 \/ 100 \)$, set
  $ L = 4^(20 m) \, #h(2em) N = L^d \, #h(2em) lambda \( n_0 \, u \) = sqrt(3 u) thin 2^(- n_0) \, #h(2em) eta = u 4^(- m) . $
  Let $H_(m \, n_0 \, u)$ be the true periodic negative-hopping Anderson matrix on $\( bb(Z) \/ L bb(Z) \)^d$ with independent uniform $\[ - 1 \, 1 \]$ variables and coupling $lambda \( n_0 \, u \)$. With probability at least $1 \/ 2$, there must exist a set $A$ and coefficients $r = \( r_i \)_(i in A)$ such that
  #[#set math.equation(numbering: n => "(155)")
   $ \| A \| gt.eq N \/ 2 \, #h(2em) \| r_i \| lt.eq k \, #h(2em) Im r_i gt.eq 1 \/ k quad \( i in A \) \,\
G_A^(upright("cert")) := \( H_(m \, n_0 \, u) - E - eta "diag"_A r \)^(- 1) med upright("exists") \, #h(2em) Im \( G_A^(upright("cert")) \)_(i i) gt.eq 1 \/ k quad \( i in A \) . $ <eq:threshold-criterion>]
  The probability here is taken only over the true site variables. Define
  #[#set math.equation(numbering: n => "(156)")
   $ lambda_d = sqrt(3) thin 2^(- n_(*) \( d \)) . $ <eq:threshold-lambda>]
] <def:threshold>

#thm([Proposition 8.3.])[
  (Existence and measurability of the threshold).  #emph[The feasibility event in (155) is Borel, and the set of integers in Definition 39 is nonempty. Consequently $lambda_d > 0$. For every fixed $0 < lambda < lambda_d$, every $m gt.eq 4 n_0$, and every $E in I_d$, the true operator at coupling $lambda$ satisfies (155) with $k = n_(*) \( d \)$ and certificate probability at least $1 \/ 2$.]
] <prop:threshold>

#proof[
  First fix $k \, n_0 \, m \, u \, E$ and $A$. Write
  $ B_A \( omega \, r \) = H_(m \, n_0 \, u) \( omega \) - E - eta "diag"_A r . $
  The product of the potential cube $\[ - 1 \, 1 \]^N$ and
  $ cal(R)_A \( k \) = { r in bb(C)^A : \| r_i \| lt.eq k \, med Im r_i gt.eq 1 \/ k } $
  is compact. For each positive integer $q$, impose on this product the additional conditions
  $ \| det B_A \( omega \, r \) \| gt.eq 1 \/ q \, #h(2em) Im \( B_A \( omega \, r \)^(- 1) \)_(i i) gt.eq 1 \/ k quad \( i in A \) . $
  The inverse is continuous on the determinant-bounded set, so the resulting set is compact. Its projection onto the potential coordinates is compact. Taking the countable union over $q$ and the finite union over $A$ with $\| A \| gt.eq N \/ 2$ gives exactly the feasibility event, hence a Borel set. This argument uses the full finite matrix, without any extra condition on a Schur denominator.
  For existence, all constants and starting-index requirements in Proposition 37 and the witness proof depend only on $d$ and on the fixed window. They are uniform in $u in \( 1 \/ 4 \, 1 \]$ because $t_n = u \( 4^(- n) + 4^(- m) \) asymp 4^(- n)$. Equation (154) makes the total failure probability at most $1 \/ 2$ simultaneously for every $m gt.eq 4 n_0$ once $n_0$ exceeds one fixed cutoff. On success the certificate has uniform bounds $\| r_i \| lt.eq C_r$, $Im r_i gt.eq c_p$, and $Im G_(i i)^(upright("cert")) gt.eq c_g$, with all three constants positive where appropriate. Choose an integer $k gt.eq 10$ above that cutoff and above $C_r \, c_p^(- 1) \, c_g^(- 1)$. Then the constructed success event implies (155) for every allowed set of parameters. Although the construction also uses auxiliary randomness, its success implies the Borel feasibility event in the true variables alone. The latter event therefore has probability at least the joint success probability, which is at least $1 \/ 2$. Thus such $k$ exist.
  Finally, if $0 < lambda < sqrt(3) thin 2^(- n_(*) \( d \))$, set
  $ n_0 = ⌊log_4 \( 3 \/ lambda^2 \)⌋ \, #h(2em) u = \( lambda^2 \/ 3 \) 4^(n_0) . $
  Then $n_0 gt.eq n_(*) \( d \)$, $1 \/ 4 < u lt.eq 1$, $sqrt(3 u) thin 2^(- n_0) = lambda$, and $s_m = u 4^(- m)$. Definition 39 applies directly. Universal quantification over $u$ and $E$ refers to their individual finite-box probabilities; it does not require a common probability-one event over those parameters. ◻
]

The existence proof supplies no effective numerical upper bound for $n_(*) \( d \)$. The spectral readout uses the fixed probability $1 \/ 2$ and the certificate bounds in (155) at the torus and damping scales prescribed in Definition 39. Its comparison holds for every qualifying pair $\( A \, r \)$, so no measurable choice of a certificate and no independence between $A$ and the true variables are required.

== 9 From the certificate to pure absolute continuity <sec:spectral>

Fix an integer $d gt.eq 3$ and a disorder parameter $lambda > 0$. We prove a conditional transfer from a probability-$1 \/ 2$ finite-volume certificate to pure absolute continuity. The final application checks the certificate at the couplings of Theorem 1, using Proposition 3 for $d = 3$ and Definition 39 together with Proposition 40 for $d gt.eq 4$.

The finite-dimensional comparison bounds a bounded function of the true scalar resolvent. A narrow spectral projection of the true operator isolates the very near eigenvalues, whose effect is bounded by a term proportional to its rank. The bound is valid for every qualifying adaptive damping set. We then pass to the infinite-volume boundary values and propagate positivity to all sites at almost every fixed energy. The final argument conditions on the operator with one site removed and excludes singular mass, including mass on the exceptional energy set. The operators considered below are bounded and self-adjoint, with $parallel H_(lambda \, omega) parallel lt.eq 2 d + lambda$. We use their spectral resolution and functional calculus in the form of #cite(label("Teschl2009")) Theorem 3.7.

=== 9.1 Conditional spectral averaging <conditional-spectral-averaging>

We use own-site averaging twice: first to bound the expected number of eigenvalues in a narrow true spectral window, and later to remove spectral mass on an energy-null set fixed after freezing the other potentials. We record its conditioning explicitly and prove the precise form used below. For the general rank-one theory and spectral-averaging background, see #cite(label("SimonWolff1986")) Theorem 5 and Section 7 and #cite(label("Marx2011")) Theorem 1.1 and Proposition 3.1.

#thm([Lemma 9.1.])[
  (Own-site averaging).  #emph[Let $cal(K)$ be a Hilbert space, let $H^c$ be bounded and self-adjoint on $cal(K)$, and let $b in cal(K)$. On $bb(C) xor cal(K)$ set 
$ H_s = mat(delim: "(", s, b^(*); b, H^c) \, #h(2em) s in bb(R) . $

 Let $mu_s$ be the spectral measure of $\( 1 \, 0 \)$ for $H_s$. If $s$ has a probability density $rho in L^oo \( bb(R) \)$, then for every Borel set $B subset bb(R)$, 
#[#set math.equation(numbering: n => "(157)")
 $ integral_(bb(R)) rho \( s \) mu_s \( B \) thin d s lt.eq parallel rho parallel_oo \| B \| . $ <eq:spectral-averaging-bound>]

 This estimate holds conditionally when $H^c$ and $b$ are random and independent of $s$.]
] <lem:spectral-averaging>

#proof[
  For $Im z > 0$ define
  $ M \( z \) = z + chevron.l b \, \( H^c - z \)^(- 1) b chevron.r . $
  Then $Im M \( z \) > 0$, and the Schur identity gives
  #[#set math.equation(numbering: n => "(158)")
   $ g_s \( z \) := chevron.l \( 1 \, 0 \) \, \( H_s - z \)^(- 1) \( 1 \, 0 \) chevron.r = frac(1, s - M \( z \)) . $ <eq:spectral-cavity>]
  For any $a in bb(R)$ and $v > 0$,
  $ integral_(bb(R)) Im frac(1, s - a - i v) thin d s = integral_(bb(R)) frac(v, \( s - a \)^2 + v^2) thin d s = pi . $
  Hence $integral rho \( s \) Im g_s \( E + i eta \) thin d s lt.eq pi parallel rho parallel_oo$. Multiply by a nonnegative continuous compactly supported function $phi \( E \)$, integrate in $E$, and divide by $pi$. The spectral theorem and Fubini identify the inner energy integral as the integral of the Poisson convolution of $phi$ against $mu_s$. That convolution converges uniformly to $phi$ as $eta arrow.b 0$. Since $mu_s \( bb(R) \) = 1$, dominated convergence gives
  $ integral rho \( s \) integral phi thin d mu_s thin d s lt.eq parallel rho parallel_oo integral phi \( E \) thin d E . $
  Regularity of the two Borel measures proves (157). For a fixed value of the conditioning variables the same calculation applies verbatim. No cyclicity assumption on $\( 1 \, 0 \)$ is needed. ◻
]

=== 9.2 The spectral readout <the-spectral-readout>

#thm([Proposition 9.2.])[
  (Spectral readout).  #emph[Fix $d gt.eq 3$, $lambda > 0$ and a nonempty bounded open interval $I$. Let $H_m$ be the true Anderson operator on $bb(T)_m = \( bb(Z) \/ L_m bb(Z) \)^d$, $L_m = 4^(20 m)$, with independent uniform diagonal values in $\[ - lambda \, lambda \]$ at every site, and let $eta_m asymp 4^(- m)$. Suppose that for every fixed $E in I$ and all sufficiently large $m$, with probability at least $1 \/ 2$ there exist $A subset bb(T)_m$ and numbers $r_i$, $i in A$, such that 
$ \| A \| gt.eq N_m \/ 2 \, #h(2em) \| r_i \| lt.eq B \, #h(2em) 0 < p_(-) lt.eq Im r_i lt.eq p_(+) \, $

 where $N_m = L_m^d$ and the displayed constants do not depend on $m$ or $E$, and such that $\( H_m - E - eta_m "diag"_A r \)^(- 1)$ exists and its active block $hat(G)_A$, acting on $ell^2 \( A \)$, satisfies 
$ Im \( hat(G)_A \)_(i i) gt.eq q_(*) > 0 #h(2em) \( i in A \) \, $

 with $q_(*)$ independent of $m \, E$. Every diagonal value of $H_m$, on $A$ and on $A^c$, is already a true site value; here $A$ records the sites retaining artificial damping. The certificate may depend on all true variables and auxiliary randomness; no measurable selection of $A \, r$ is required. Then almost surely 
$ I subset sigma \( H_(lambda \, omega) \) \, #h(2em) chi_I \( H_(lambda \, omega) \) ell^2 \( bb(Z)^d \) subset cal(H)_(upright("ac")) \( H_(lambda \, omega) \) . $

 In particular, this spectral restriction is purely absolutely continuous and $chevron.l e_0 \, chi_I \( H_(lambda \, omega) \) e_0 chevron.r > 0$.]
] <prop:certificate-readout>

#proof[
  Write $H = H_(lambda \, omega)$. For $Im z > 0$, write
  $ G \( z \) = \( H - z \)^(- 1) \, #h(2em) G^(\( m \)) \( z \) = \( H_m - z \)^(- 1) \, $
  and put
  $ q_x \( z \) = Im G_(x x) \( z \) \, #h(2em) q_i^(\( m \)) \( z \) = Im G_(i i)^(\( m \)) \( z \) . $
  When a diagonal resolvent entry has a finite complex boundary value, write $q_x \( E + i 0 \) = Im G_(x x) \( E + i 0 \)$. Our first objective is to prove that, for Lebesgue-almost every fixed $E in I$,
  #[#set math.equation(numbering: n => "(159)")
   $ bb(P) vec(G_(x x) \( E + i 0 \) upright(" exists finitely and ") q_x \( E + i 0 \) > 0, upright("for every ") x in bb(Z)^d) = 1 . $ <eq:spectral-all-positive>]
  The probability-one event here may depend on $E$. Once this assertion is proved, the last part of the proof will use Fubini and own-site averaging to obtain the almost-sure spectral statement on the whole interval.
  ===== 9.2.1 A true finite-volume resolvent bound. <a-true-finite-volume-resolvent-bound.>
  Fix $E in I$ and suppress the subscripts on $eta_m \, N_m$. We seek a lower bound for a bounded function of $q_i^(\( m \)) \( E + i eta \)$ which is valid for the true operator even though the certificate is chosen adaptively.
  Let $cal(S)_(m \, E)$ be the event in the true potential variables that a certificate exists. This event is Borel. For each of the finitely many possible $A$, constrain the true potential vector and $r$ to their compact ranges and impose $\| det \( H_m - E - eta "diag"_A r \) \| gt.eq 1 \/ j$, $j in bb(N)$. The inverse inequalities define a closed set there. Its projection onto the potential coordinates is compact; taking the union over $j$ and $A$ gives $cal(S)_(m \, E)$. An auxiliary construction with success probability at least $1 \/ 2$ therefore implies $bb(P) \( cal(S)_(m \, E) \) gt.eq 1 \/ 2$ for the true product law.
  Almost surely, every true principal matrix of $H_m - E$ is invertible. Indeed, each of its determinants is a nonzero polynomial in the independent continuously distributed diagonal variables, and there are finitely many subsets: the product of all diagonal variables in a nonempty block has coefficient one in its determinant. This event applies to an adaptively selected subset as well. For any qualifying pair $\( A \, r \)$, let $S_A$ be the real symmetric Schur complement of $H_m - E$ after eliminating $A^c$. The active block of the certified full inverse is
  $ hat(G)_A = \( S_A - eta R \)^(- 1) \, #h(2em) R = "diag" \( r_i : i in A \) . $
  Define $G_A = \( S_A - i eta I \)^(- 1)$ on the same active space. Here $hat(G)_A$ acts on $ell^2 \( A \)$, and dissipativity on that space gives $parallel hat(G)_A parallel lt.eq \( eta p_(-) \)^(- 1)$. The inverse identity and the Ward identity give, respectively,
  $ hat(G)_A - G_A = hat(G)_A thin eta \( R - i I \) G_A \, #h(2em) Im hat(G)_A = eta hat(G)_A^(*) "diag" \( Im r \) hat(G)_A . $
  Set $C_R = 1 + \( B + 1 \) \/ p_(-)$. For $i in A$, these identities imply
  $ q_(*) lt.eq eta p_(+) parallel hat(G)_A e_i parallel^2 \, #h(2em) parallel hat(G)_A e_i parallel lt.eq C_R parallel G_A e_i parallel . $
  Thus, with $c_(*) = q_(*) \/ \( p_(+) C_R^2 \) > 0$,
  #[#set math.equation(numbering: n => "(160)")
   $ eta parallel G_A e_i parallel^2 gt.eq c_(*) #h(2em) \( i in A \) . $ <eq:spectral-subset-column>]
  Put $T = \( H_m - E \)^(- 1)$, and regard $B_A = P_A T P_A$ as an operator on $ell^2 \( A \)$, where $P_A$ is coordinate projection. Block inversion gives $S_A^(- 1) = B_A$, and hence
  $ G_A = P_A \( H_m - E - i eta P_A \)^(- 1) P_A = f_eta \( B_A \) \, #h(2em) f_eta \( u \) = frac(u, 1 - i eta u) . $
  Thus $G_A$ is an active-space intermediary: it is the compression of an inverse damped on $A$. To compare it with the full scalar resolvent, we separate the true spectral modes very close to $E$ before forming a second compression. Those modes may make $T$ large, but the difference they create after compression has rank at most their number. Away from them, the inverse-square weight is bounded by a multiple of the scalar resolvent’s Poisson weight.
  For $0 < epsilon.alt lt.eq 1$, define
  $ Q = chi_(\[ E - epsilon.alt eta \, E + epsilon.alt eta \]) \( H_m \) \, quad r_Q = "rank" Q \, quad T_c = T \( I - Q \) \, quad B_c = P_A T_c P_A \, quad G_c = f_eta \( B_c \) . $
  The identity
  $ B_A - B_c = P_A T Q P_A $
  shows that $"rank" \( B_A - B_c \) lt.eq r_Q$, for every set $A$. For self-adjoint matrices $B \, C$,
  $ f_eta \( B \) - f_eta \( C \) = \( I - i eta B \)^(- 1) \( B - C \) \( I - i eta C \)^(- 1) . $
  Thus $D = G_A - G_c$ has
  #[#set math.equation(numbering: n => "(161)")
   $ "rank" D lt.eq r_Q \, #h(2em) parallel D parallel lt.eq 2 \/ eta \, #h(2em) parallel D parallel_(upright("HS"))^2 lt.eq 4 r_Q \/ eta^2 . $ <eq:spectral-cut-rank>]
  Put $M_epsilon.alt = 1 + epsilon.alt^(- 2)$. Since $Q$ commutes with $T$, the matrix $T_c$ is self-adjoint, and so is its compression $B_c$ on $ell^2 \( A \)$. Its own functional calculus gives
  $ G_c^(*) G_c = B_c^2 \( I + eta^2 B_c^2 \)^(- 1) lt.eq B_c^2 . $
  Together with contraction of the coordinate projection this implies
  #[#set math.equation(numbering: n => "(162)")
   $ eta parallel G_c e_i parallel^2 & lt.eq eta parallel B_c e_i parallel^2 lt.eq eta parallel T_c e_i parallel^2\
 & lt.eq M_epsilon.alt q_i^(\( m \)) \( E + i eta \) \, #h(2em) i in A . $ <eq:spectral-cut-column>]
  For the last inequality, outside the cut interval one has $eta \/ \( u - E \)^2 lt.eq M_epsilon.alt eta \/ \( \( u - E \)^2 + eta^2 \)$. The argument neither commutes $P_A$ past $Q$ nor uses an operator-monotonicity assertion about $f_eta$.
  Define the bounded continuous function $Phi \( u \) = min { 2 M_epsilon.alt u \, c_(*) }$ for $u gt.eq 0$. Equations (160) and (162), together with the squared triangle inequality, give
  $ Phi \( q_i^(\( m \)) \) gt.eq c_(*) - 2 eta parallel D e_i parallel^2 #h(2em) \( i in A \) . $
  Summing and using (161) yields
  $ 1 / N sum_i Phi \( q_i^(\( m \)) \) gt.eq c_(*) \/ 2 - frac(8 r_Q, eta N) . $
  Every qualifying certificate implies this same inequality for the true scalar resolvent and the true rank $r_Q$. Thus it holds on the existential event $cal(S)_(m \, E)$ without choosing a certificate measurably. Outside that event the left side is nonnegative, so pointwise it is at least $c_(*) / 2 upright(bold(1))_(cal(S)_(m \, E)) - 8 r_Q \/ \( eta N \)$. Taking expectations under the unconditioned true product law gives
  #[#set math.equation(numbering: n => "(163)")
   $ bb(E) 1 / N sum_i Phi \( q_i^(\( m \)) \) gt.eq c_(*) / 2 bb(P) \( cal(S)_(m \, E) \) - frac(8 bb(E) r_Q, eta N) . $ <eq:spectral-truncated-average>]
  Under this law, at each site the true diagonal value is uniform on $\[ - lambda \, lambda \]$ and independent of the other site values. Conditioning on those other values, applying Lemma 41, and summing gives the finite-volume Wegner estimate #cite(label("Wegner1981"))
  $ bb(E) r_Q lt.eq frac(N, 2 lambda) \( 2 epsilon.alt eta \) = frac(epsilon.alt eta N, lambda) . $
  The rank estimate is under the unconditioned true law; the success event enters only through its probability in (163). Choose $0 < epsilon.alt lt.eq min { 1 \, c_(*) lambda \/ 64 }$, fixed as $m$ varies. Using $bb(P) \( cal(S)_(m \, E) \) gt.eq 1 \/ 2$, for all sufficiently large $m$ Equation (163) therefore gives
  $ bb(E) 1 / N sum_i Phi \( q_i^(\( m \)) \( E + i eta_m \) \) gt.eq c_(*) \/ 8 . $
  The expression being averaged now depends only on the true potentials. Translation invariance of that true product law on the torus yields
  #[#set math.equation(numbering: n => "(164)")
   $ bb(E) Phi \( q_0^(\( m \)) \( E + i eta_m \) \) gt.eq c_(*) \/ 8 . $ <eq:spectral-finite-root>]
  The construction of $A$ need not be translation equivariant.
  ===== 9.2.2 Infinite volume and the first boundary conclusion. <infinite-volume-and-the-first-boundary-conclusion.>
  We next transfer (164) to the infinite lattice. Couple the potentials on a root cube of radius comparable to $L_m$, less than half the torus side, to the infinite iid model. Cutting the boundary bonds of this cube gives the same root component in the two models. Exponential conjugation of a scalar-damped nearest-neighbor resolvent gives
  $ \| G \( x \, y \; E + i eta \) \| lt.eq C eta^(- 1) e^(- c eta "dist" \( x \, y \)) . $
  Indeed, conjugation by $e^(a eta "dist" \( x \, dot.op \))$ changes the hopping in operator norm by at most $C a eta$; a Neumann series and $parallel G parallel lt.eq eta^(- 1)$ prove the estimate for sufficiently small fixed $a$. Truncated weights give the same conclusion on the infinite lattice. The bound also holds after boundary bonds are removed. A cube of side comparable to $L_m$ has $2 d$ faces, each containing $O_d \( L_m^(d - 1) \)$ crossing bonds. Resolvent identity across these bonds, with the root a distance $asymp L_m$ from every face, gives
  #[#set math.equation(numbering: n => "(165)")
   $ \| G_00^(\( m \)) \( E + i eta_m \) - G_00 \( E + i eta_m \) \| lt.eq C_d L_m^(d - 1) eta_m^(- 2) e^(- c_d eta_m L_m) = o \( 1 \) . $ <eq:spectral-volume-comparison>]
  Indeed, $eta_m L_m asymp 4^(19 m)$, whereas the logarithm of the prefactor is $O_d \( m \)$. This estimate is uniform in the potential. Since $Phi$ is bounded and Lipschitz, it follows that
  #[#set math.equation(numbering: n => "(166)")
   $ liminf_m bb(E) Phi \( q_0 \( E + i eta_m \) \) gt.eq c_(*) \/ 8 . $ <eq:spectral-infinite-root>]
  Each diagonal resolvent entry is the Borel transform of a finite measure, and thus has a finite complex boundary value for Lebesgue-almost every energy; see #cite(label("Teschl2009")) Corollary 3.25. Fubini gives a deterministic full-measure subset of $I$ on which these limits exist almost surely. Bounded convergence in (166) shows that, for almost every fixed $E in I$,
  #[#set math.equation(numbering: n => "(167)")
   $ bb(E) Phi \( q_0 \( E + i 0 \) \) gt.eq c_(*) \/ 8 \, #h(2em) bb(P) \( q_0 \( E + i 0 \) > 0 \) > 0 . $ <eq:spectral-positive-probability>]
  All subsequent energy limits concern the true resolvent. In particular, no joint choice of the auxiliary construction over uncountably many energies is required.
  ===== 9.2.3 Boundary nonvanishing and propagation of positivity. <boundary-nonvanishing-and-propagation-of-positivity.>
  The shortest-path observation and rank-one comparison below have precedents in Jakšić and Last #cite(label("JaksicLast2000")) author-preprint Section 1.1 and proof of Theorem 2.4. We give the boundary-value argument used here. We first claim that, for every fixed realization and pair $x eq.not y$, $G_(x y) \( E + i 0 \)$ exists finitely and is nonzero for Lebesgue-almost every $E$. This form will let us apply Fubini before returning to a fixed energy.
  To prove the claim, real symmetry gives
  $ G_(x y) \( z \) = 1 / 4 #scale(x: 120%, y: 120%)[\(] chevron.l e_x + e_y \, G \( z \) \( e_x + e_y \) chevron.r - chevron.l e_x - e_y \, G \( z \) \( e_x - e_y \) chevron.r #scale(x: 120%, y: 120%)[\)] . $
  Both quadratic forms are Herglotz functions, so $G_(x y)$ has finite boundary values a.e. To prove nonvanishing, let $ell = \| x - y \|_1$. The first nonzero coefficient of the convergent expansion
  $ \( H - z \)^(- 1) = - sum_(n gt.eq 0) H^n z^(- n - 1) $
  in the $\( x \, y \)$ entry occurs at $n = ell$. A product of fewer than $ell$ nearest-neighbor steps and diagonal factors cannot join $x$ to $y$; at length $ell$ every factor must be a hopping step on a shortest path. Thus $\( H^ell \)_(x y)$ equals $\( - 1 \)^ell$ times the positive number of shortest lattice paths and $G_(x y)$ is not identically zero in any dimension considered.
  Write each quadratic Herglotz function $m_plus.minus$ as $m_plus.minus = i \( 1 + b_plus.minus \) \/ \( 1 - b_plus.minus \)$ with $b_plus.minus$ bounded analytic and $\| b_plus.minus \| < 1$. Their difference is a quotient of bounded analytic functions with nonzero numerator. A nonzero bounded analytic function $f$ on the upper half-plane cannot have zero vertical boundary values on a positive-measure set. For completeness, normalize $\| f \| lt.eq 1$ and choose $z_0$ with $f \( z_0 \) eq.not 0$. Jensen’s inequality after mapping ${ Im z > eta }$ to the disk gives
  $ integral_(bb(R)) frac(Im z_0 - eta, pi \( \( x - Re z_0 \)^2 + \( Im z_0 - eta \)^2 \)) \[ - log \| f \( x + i eta \) \| \] thin d x lt.eq - log \| f \( z_0 \) \| $
  for $0 < eta < Im z_0$. To obtain this boundary inequality from Jensen on smaller circles, use Fatou’s lemma and the continuity of $f$ across the line $Im z = eta$; the single boundary point corresponding to infinity has zero harmonic measure. Another application of Fatou’s lemma as $eta arrow.b 0$ rules out a positive-measure zero-boundary set. If the finite boundary value of $G_(x y)$ were zero, the bounded-analytic numerator would tend to zero too, since the denominator factors $1 - b_plus.minus$ are bounded. Applying the uniqueness statement to that numerator proves the claimed nonvanishing.
  For each realization, intersect the boundary statements over the countable set of sites and pairs, and then apply Fubini. Together with (167), this gives a deterministic full-measure set $I_0 subset I$ such that for every fixed $E in I_0$, (167) holds and, almost surely, all diagonal and off-diagonal boundary values are finite and every off-diagonal value for distinct sites is nonzero. Fix such an $E$ for the rest of this propagation argument. The event that some site has $q_x \( E + i 0 \) > 0$ is translation invariant and has positive probability. Ergodicity of the iid translation action makes its probability one. One elementary proof of the required ergodicity approximates an invariant event by a finite-coordinate cylinder event, translates the latter to make the two cylinder events independent, and lets the approximation error tend to zero.
  Fix an ordered pair $x eq.not y$ and condition on all potentials except the true diagonal value $s_x$. For almost every such complement, the finite-boundary and nonzero-off-diagonal properties hold for almost every $s_x in \[ - lambda \, lambda \]$. Call these own-site values admissible. This full-measure set may depend on the complement and on $E$; the argument requires admissibility only for almost every own-site value at this fixed energy. There cannot be two distinct admissible values $s_1 \, s_2$ for which $q_x > 0$ and $q_y = 0$. To see this, evaluate at $s_1$ and set
  $ g = G_(x x) \( E + i 0 \) \, quad a = G_(x y) \( E + i 0 \) \, quad h = s_2 - s_1 . $
  The boundary imaginary-part matrix on ${ x \, y }$ is positive semidefinite, being a limit of such matrices. Its $y$-diagonal is zero, so its $\( x \, y \)$ entry vanishes. Hence $a$ is real; it is nonzero by the preceding argument. Moreover, $Im g > 0$, so $1 + h g eq.not 0$ for every real $h$. The upper-half-plane rank-one identity therefore passes to the boundary and gives
  $ G_(y y)^(\( s_2 \)) = G_(y y)^(\( s_1 \)) - frac(h a^2, 1 + h g) \, #h(2em) q_y^(\( s_2 \)) = frac(h^2 a^2 Im g, \| 1 + h g \|^2) > 0 \, $
  a contradiction. The set of admissible $s_x$ giving $q_x > 0 \, q_y = 0$ therefore contains at most one point and has zero conditional probability under the uniform own-site law. The inadmissible values already form a conditional null set. Thus
  $ bb(P) \( q_x \( E + i 0 \) > 0 \, med q_y \( E + i 0 \) = 0 \) = 0 . $
  Countably many pairs, combined with almost-sure existence of a positive site, prove (159) for every $E in I_0$. This completes the fixed-energy part of the proof.
  ===== 9.2.4 Exclusion of singular mass. <exclusion-of-singular-mass.>
  We now use the fixed-energy assertion (159) to prove an almost-sure statement about the spectral measure on $I$. Positivity a.e. in energy is not by itself sufficient: a spectral measure could also have singular mass on an exceptional null set. After fixing the other site potentials, we construct an energy set on which every value of the remaining site potential has a finite diagonal boundary value. Its complement can then be used in conditional spectral averaging. This conditional spectral-averaging step is the purity principle of Aizenman and Warzel #cite(label("AizenmanWarzel2013")) Proposition 2.2, credited there to Mira Shamis via Simon–Wolff’s arguments; compare also Jakšić and Last #cite(label("JaksicLast2000")) author-preprint Section 4.
  Fix a site $x$, and write $overline(omega)$ for the potentials at the other sites. Let $H_(overline(omega))^c$ be the compression with site $x$ removed, and let $b$ be the hopping vector from $x$ to the remaining sites. Both are independent of the true diagonal value $s$ at $x$. For a real value $s$ at that site, the cavity identity (158) becomes
  $ G_(x x)^(\( s \)) \( z \) = frac(1, s - M_(overline(omega)) \( z \)) \, #h(2em) M_(overline(omega)) \( z \) = z + chevron.l b \, \( H_(overline(omega))^c - z \)^(- 1) b chevron.r . $
  The function $M_(overline(omega))$ has finite boundary values for almost every energy, since its second term is a Borel transform of a finite positive measure. Its finite boundary values have nonnegative imaginary part. By (159) and Fubini, for almost every $overline(omega)$ and almost every $E in I$, the diagonal boundary value exists finitely and has positive imaginary part for almost every $s in \[ - lambda \, lambda \]$. If the finite value $M_(overline(omega)) \( E + i 0 \)$ were real, the cavity formula would give zero imaginary boundary part for every $s eq.not M_(overline(omega)) \( E + i 0 \)$, a contradiction. Thus the set
  $ S_(overline(omega)) = { E in I : M_(overline(omega)) \( E + i 0 \) upright(" exists finitely and ") Im M_(overline(omega)) \( E + i 0 \) > 0 } $
  has full Lebesgue measure in $I$ for almost every complement. The boundary condition defining $S_(overline(omega))$ is Borel and jointly measurable in $\( overline(omega) \, E \)$: at positive height the resolvents are jointly measurable and continuous in height, so boundary existence and its bounds can be expressed using rational heights. The set depends only on the complementary configuration, and hence is independent of $s$. At each point of $S_(overline(omega))$, the positive imaginary part of $M_(overline(omega)) \( E + i 0 \)$ keeps the cavity denominator nonzero for every real $s$. Thus the diagonal resolvent has a finite boundary value there for every $s$.
  We spell out the measure-theoretic consequence. Let $mu$ be a finite positive measure with Borel transform $g$, and let $S$ be a Borel set on which $limsup_(eta arrow.b 0) Im g \( E + i eta \) < oo$. Put
  $ S_k = { E in S : sup_(0 < eta < 1 \/ k) Im g \( E + i eta \) lt.eq k } . $
  These sets are Borel, since continuity at positive height allows the supremum to be taken over rational heights. Then $S = union.big_k S_k$. For $E in S_k$ and $0 < r < 1 \/ k$,
  #[#set math.equation(numbering: n => "(168)")
   $ mu \( \( E - r \, E + r \) \) lt.eq 2 r Im g \( E + i r \) lt.eq 2 k r . $ <eq:spectral-poisson-cover>]
  Let $B subset S_k$ be a Lebesgue-null Borel set. For each $epsilon > 0$, cover $B$ by open intervals $J_j$ with $sum_j \| J_j \| < epsilon$ and $\| J_j \| < 1 \/ k$. Discard intervals missing $B$ and choose $E_j in B ∩ J_j$. The intervals $\( E_j - \| J_j \| \, E_j + \| J_j \| \)$ still cover $B$, so Equation (168) gives
  $ mu \( B \) lt.eq sum_j mu \( \( E_j - \| J_j \| \, E_j + \| J_j \| \) \) lt.eq 2 k sum_j \| J_j \| < 2 k epsilon . $
  Letting $epsilon arrow.b 0$ proves $mu \|_(S_k) lt.double d E$, and hence $mu \|_S lt.double d E$. This proves directly the bounded-boundary criterion in the Borel-set form we need; compare #cite(label("Teschl2009")) Theorem 3.23 and Corollary 3.24.
  Apply this deterministic argument, for each $s$, to its site measure $mu_s$ on $S_(overline(omega))$. The bounded-Poisson subsets $S_k$ may depend on $s$, but the larger set $S_(overline(omega))$ does not. Therefore
  $ mu_s \|_(S_(overline(omega))) lt.double d E quad upright("for every ") s . $
  For its complementary Borel null set $B_(overline(omega)) = I \\ S_(overline(omega))$, conditional spectral averaging gives
  $ integral_(- lambda)^lambda frac(1, 2 lambda) mu_s \( B_(overline(omega)) \) thin d s lt.eq frac(1, 2 lambda) \| B_(overline(omega)) \| = 0 . $
  For almost every complement, this proves $mu_s \( B_(overline(omega)) \) = 0$ for almost every own-site value $s in \[ - lambda \, lambda \]$. Together with absolute continuity on $S_(overline(omega))$ for every $s$, it follows that $mu_x \|_I lt.double d E$ almost surely under the true product law. Countably intersecting over $x$ gives simultaneous absolute continuity of all basis measures on $I$.
  The vectors $chi_I \( H \) e_x$ consequently belong to $cal(H)_(upright("ac")) \( H \)$. Their linear span is dense in $chi_I \( H \) ell^2 \( bb(Z)^d \)$, and the absolutely continuous subspace is closed. This proves the spectral-subspace inclusion. Finally, (159) and Fubini give $q_0 \( E + i 0 \) > 0$ for a.e. $E in I$ on a probability-one event. If some point of $I$ lay outside the closed spectrum, it would have an open neighborhood in $I$ disjoint from the spectrum. The resolvent is real there, so its diagonal imaginary boundary parts vanish throughout that neighborhood, a contradiction. Thus $I subset sigma \( H \)$ as well. Moreover $mu_0 \( I \) > 0$: if $mu_0 \( I \) = 0$, the Poisson integral of $mu_0$ tends to zero at each interior point of $I$, since that point has positive distance from $bb(R) \\ I$. This contradicts $q_0 \( E + i 0 \) > 0$ for almost every $E in I$. In particular $chi_I \( H \) eq.not 0$. ◻
]

#proof[
  For $d = 3$, fix the interval $I_3 = \( - 6 + e_2 \/ 2 \, - 6 + e_2 \)$ and set $lambda_3 = lambda_0 \( 3 \) > 0$ from Proposition 3. For each fixed $0 < lambda < lambda_3$, that proposition supplies the certificate with probability tending to one, hence at least $1 \/ 2$ for all sufficiently large $m$, and with constants uniform in $E in I_3$. Proposition 42 therefore proves the two spectral assertions on $I_3$.
  For $d gt.eq 4$, set
  $ I_d = - 2 d + \( 1 \/ 200 \, 1 \/ 100 \) \, #h(2em) lambda_d = sqrt(3) thin 2^(- n_(*) \( d \)) > 0 \, $
  where $n_(*) \( d \)$ is specified in Definition 39. For each fixed $0 < lambda < lambda_d$, put
  $ n_0 = floor.l log_4 \( 3 \/ lambda^2 \) floor.r gt.eq n_(*) \( d \) \, #h(2em) u = \( lambda^2 \/ 3 \) 4^(n_0) in \( 1 \/ 4 \, 1 \] . $
  The existence assertion in Proposition 40 follows from the construction proving Proposition 3. Its final assertion applies the defining feasibility criterion directly: for this coupling and each $m gt.eq 4 n_0$ and $E in I_d$, the true-variable certificate event has probability at least $1 \/ 2$. With $eta_m = s_m = u 4^(- m)$, its fixed bounds $B = p_(+) = n_(*) \( d \)$ and $p_(-) = q_(*) = 1 \/ n_(*) \( d \)$ satisfy precisely the hypotheses of Proposition 42 on $I_d$. Hence almost surely $I_d$ is contained in the spectrum, and its spectral restriction is purely absolutely continuous and has nonzero weight. In either dimension case, conjugating by $psi \( x \) mapsto \( - 1 \)^(x_1 + dots.h.c + x_d) psi \( x \)$ gives the identical conclusion for positive hopping and leaves every iid diagonal variable unchanged. The interval is independent of $lambda$, and the probability-one event is asserted separately for each fixed disorder parameter. This proves the stated spectral conclusion; no diffusion assertion is used or deduced. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
