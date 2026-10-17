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

#align(center)[#text(size: 16pt, weight: "bold")[The first lattice correction to Bloch's law]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The leading low-temperature magnetization deficit of a three-dimensional ferromagnet is determined by long-wavelength spin waves. At the next order, the lattice dispersion becomes visible. We prove that this first lattice correction gives the corresponding term in the spontaneous magnetization of the quantum Heisenberg ferromagnet, for every fixed positive half-integer spin.

=== 1.1 The model and the result <the-model-and-the-result>

Let $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$ and $Lambda_N = { - N \, dots.h \, N }^3 subset bb(Z)^3$. At each site $x$ let $bold(S)_x = \( S_x^1 \, S_x^2 \, S_x^3 \)$ be the spin-$S$ operators on $bb(C)^(2 S + 1)$. With free boundary conditions, the Hamiltonian and total $z$-spin are

$ H_(S \, N) = - sum_({ x \, y } subset Lambda_N\
\| x - y \|_1 = 1) bold(S)_x dot.op bold(S)_y \, #h(2em) M_N = sum_(x in Lambda_N) S_x^3 . $

Every unordered lattice edge is counted once. For inverse temperature $beta > 0$ and field $h gt.eq 0$, define

$ p_(S \, beta) \( h \) = lim_(N arrow.r oo) frac(1, beta \| Lambda_N \|) log "Tr" e^(- beta \( H_(S \, N) - h M_N \)) \, #h(2em) m_S \( beta \) = partial_(h +) p_(S \, beta) \( 0 \) . $

The pressure limit is the usual finite-range thermodynamic limit. Convexity and the bound $\| M_N \| lt.eq S \| Lambda_N \|$ give its finite right derivative. Thus the volume limit precedes the zero-field limit in the definition of $m_S$.

The full ideal-magnon density uses the lattice dispersion $epsilon_S \( k \) = 2 S sum_(j = 1)^3 \( 1 - cos k_j \)$:

#[#set math.equation(numbering: n => "(1.1)")
 $ n_S^(upright("sw")) \( beta \) = integral_(\[ - pi \, pi \]^3) frac(d^3 k, \( 2 pi \)^3 thin \[ e^(beta epsilon_S \( k \)) - 1 \]) . $ <eq:ideal-density>]

The integral is finite in dimension three.

#thm([Theorem 1.1.])[
  #emph[For every fixed $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$, 
$ lim_(beta arrow.r oo) \( beta S \)^(5 \/ 2) #scale(x: 120%, y: 120%)[\[] S - m_S \( beta \) - n_S^(upright("sw")) \( beta \) #scale(x: 120%, y: 120%)[\]] = 0 . $

]
] <thm:main>

Expanding the lattice heat kernel gives the following explicit form. Here $zeta$ denotes the Riemann zeta function.

#thm([Corollary 1.2.])[
  #emph[For every fixed positive half-integer $S$, 
$ S - m_S \( beta \) = frac(zeta \( 3 \/ 2 \), 8 pi^(3 \/ 2)) \( beta S \)^(- 3 \/ 2) + frac(3 zeta \( 5 \/ 2 \), 128 pi^(3 \/ 2)) \( beta S \)^(- 5 \/ 2) + o #scale(x: 120%, y: 120%)[\(] \( beta S \)^(- 5 \/ 2) #scale(x: 120%, y: 120%)[\)] . $

]
] <cor:expansion>

=== 1.2 Historical context and inputs <historical-context-and-inputs>

The spin-wave description of a ferromagnet begins with Bloch’s prediction of a magnetization deficit proportional to $T^(3 \/ 2)$, where $T = beta^(- 1)$ [2]. The bosonic representation of Holstein and Primakoff made the distinction between independent spin waves and their interactions explicit [9]. Dyson subsequently developed the interaction expansion [5,6]. In that expansion, the terms of orders $T^(5 \/ 2)$ and $T^(7 \/ 2)$ in the magnetization already arise from the lattice dispersion of independent magnons [6] Section 5, Equation (71); the leading interaction contribution is of order $T^4$ [6] Section 8, Equation (122). Later effective-field-theory calculations retain this distinction and extend the expansion for cubic lattices [8]. The present result justifies the first lattice correction at fixed quantum spin, with magnetization defined by the zero-field right derivative of the thermodynamic pressure.

Rigorous thermodynamic estimates developed through a different sequence of arguments. Conlon and Solovej obtained a low-temperature free-energy bound with the predicted power but a nonoptimal coefficient [3]; Tóth improved this bound using a random-stirring representation [14]. Correggi, Giuliani, and Seiringer proved the leading spin-wave free-energy asymptotic in three dimensions for every fixed spin [4] Theorem 2.1. Their result concerns the free energy at zero field; extracting the right derivative at zero field requires additional control. Benedikter obtained an interaction correction as a free-energy upper bound in the different regime $S arrow.r oo$ with $beta S$ fixed [1].

The probabilistic framework comes from Tóth’s cycle representation for spin $1 \/ 2$ [14] and Nachtergaele’s realization of spin $S$ inside the symmetric tensor product of $2 S$ spin-$1 \/ 2$ spaces [10] Section 2.2. Within this framework, two companion manuscripts provide the direct inputs. #emph[Spontaneous magnetization in the quantum Heisenberg ferromagnet] establishes low-temperature ordering and uniform estimates for loops conditioned to be up at prescribed points [13] Theorems 1.1 and 7.5. #emph[Bloch’s Law for Finite-Range Heisenberg Ferromagnets in Three Dimensions] proves the leading magnetization asymptotic and develops the return-kernel and pressure arguments used below [12] Theorem 1.1 and Sections 2–7.

The heat-kernel bounds follow the energy-dissipation and composition argument of Nash [11] pp. 935–936, with the local geometric and flow estimates supplied by the companions.

=== 1.3 The comparison behind the proof <the-comparison-behind-the-proof>

The cycle representation replaces a spin-$S$ site by $2 S$ binary slots. Random exchanges join the slot trajectories into cycles on a time circle of length $beta$. Requiring selected slot-time points to be up is called pinning. A single-slot down probability can be expressed through the return probability of a walk in the complement of the cycles that avoid the pins. We recall the precise identities in Section 2.

The return walk sees a periodic, moving set of obstacles. It loses an edge when the other endpoint is occupied by an obstacle, and is transported when that obstacle exchanges with a hole. The comparison must preserve both effects. For an isolated obstacle, their signed contribution to the free heat equation telescopes to the change of the profile along the obstacle trajectory, together with a cutoff error. The resulting bound is controlled by its displacement over a short block and smaller time-variation and cutoff terms. This is the cancellation that improves the error beyond the leading spin-wave scale.

We organize the proof around a finite-dimensional capacity criterion in Section 3. The criterion compares a hitting function with a trial potential and requires two estimates: a scalar residual pairing, and a bound on the residuals against Dirichlet energy. It applies to nonselfadjoint contraction kernels, so no reversibility of the exposed environment is needed. The free trial potential sums returns over all positive periods; the capacity comparison therefore retains the full Bose sum.

Section 4 strengthens the pin estimates to joint snapshot bounds and proves the path and heat-kernel estimates needed on short blocks. Section 5 constructs the free trial potential, and Section 6 proves the signed cancellation and the ordered Duhamel identities. Sections 7 and 8 establish the two residual estimates. Finally, Section 9 converts the uniform pinned comparison to the right derivative of the thermodynamic pressure and proves Corollary 2.

Throughout the proof $S$ is fixed. Constants may depend on $S$; the local comparison estimates will be uniform in volume and in the allowed deterministic pin sets. All norms on finite slot spaces use counting measure.

== 2 Pinned cycles and the return walk <sec:loops>

We first express a pinned spin deficit as a return probability for one particle. The resulting walk moves through a periodic set of holes. We state precisely the loop identities and pin estimates imported from [13,12]; the estimates that improve their precision are proved in Section 4.

=== 2.1 The picture and its pin law <the-picture-and-its-pin-law>

Fix a finite free-boundary cube $Lambda = Lambda_N subset bb(Z)^3$ and write $H_(S \, Lambda) = H_(S \, N)$ and $ell = 2 S$. Its slot set is $V_Lambda = Lambda times { 1 \, dots.h \, ell }$. A slot edge joins every pair of slots whose sites are nearest neighbors. The base picture consists of independent Poisson clocks of rate $1 \/ 2$ on these undirected edges during $\[ 0 \, beta \)$, and independent uniform permutations of the $ell$ slots at each site at the seam $0$. Following the swaps and then the seam permutations produces directed cycles on the time circle $bb(R) \/ beta bb(Z)$. A slot-time point at an instantaneous operation is understood to lie just after that operation. Write $bb(E)_(upright(b))$ for expectation under the base law. This is the exchange-cycle representation of Tóth [14], with the higher-spin symmetrization discussed by Nachtergaele [10] Section 2.2.

Let $partial_(upright("in")) Lambda$ be the sites of $Lambda$ having a neighbor outside it, and put

$ D_0 = partial_(upright("in")) Lambda times { 1 \, dots.h \, ell } times \( bb(R) \/ beta bb(Z) \) . $

An #emph[allowed pin set] is $D = D_0 union F$, where $F$ is a finite deterministic set of slot-time points. Pins require the corresponding cycles to be up. If $n_D \( omega \)$ is the number of cycles missing $D$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ Z_D = bb(E)_(upright(b)) 2^(n_D) \, #h(2em) bb(P)_D \( d omega \) = Z_D^(- 1) 2^(n_D \( omega \)) bb(P)_(upright(b)) \( d omega \) \, #h(2em) cal(B)_D = union.big_(C ∩ D = diameter) C . $ <eq:pinlaw>]

Under the associated color law, cycles meeting $D$ are up and all other cycles are independently up or down with equal probabilities. These definitions also make sense for $D = diameter$. We denote probabilities under the color law by $bb(P)_D^(upright("col"))$.

Hereafter all low-temperature bounds are uniform in the finite cube and in its allowed deterministic pin set. Their constants may depend on the fixed spin and on fixed geometric constants, but not on the number or placement of the extra pins.

=== 2.2 Exposure and a fresh walk <exposure-and-a-fresh-walk>

For an allowed $E$ and an unpinned point $i$, set $P = E union { i }$. Sample the picture under $bb(P)_P$ and expose all cycles in $cal(B)_P$, including their inter-site jumps and their seam mappings. At each time their occupied slots are called #emph[obstacles]; the complementary slots are #emph[holes]. Every pin is a hole at its prescribed time.

At fixed exposure, the fresh walk on holes has rate $1 \/ 2$ on every edge between holes. When an obstacle swaps into a hole, that hole is transported in the opposite direction. A swap of two obstacles has no effect on the holes. At the seam the walk uses a fresh uniform bijection between the remaining slots at each site, respecting the exposed part of the seam permutation. The exposure is repeated periodically, while all transition randomness of the walk is resampled on each turn. This is a time-inhomogeneous Markov walk at fixed exposure; it is not obtained by following the unexposed part of a single conditioned picture.

Let $q_i$ be its probability, starting from $i$, of returning to the same slot-time point at strictly positive elapsed time before hitting $E$. A return can occur only at an integer number of periods. We use $r = bb(E)_P q_i$ and $d_E \( i \) = bb(P)_E^(upright("col")) \( i upright(" is down") \)$.

#thm([Proposition 2.1.])[
  (Loop and pin inputs).  #emph[The following statements hold at every finite volume and $beta > 0$.]
  + #emph[If $q_Lambda$ is the number of slot edges and $c \( omega \)$ the number of cycles, then 
$ "Tr" e^(- beta H_(S \, Lambda)) = e^(beta q_Lambda \/ 4) bb(E)_(upright(b)) 2^(c \( omega \)) . $

 The spectral distribution of the total $z$-spin is obtained by the unpinned color law, assigning $+ 1 \/ 2$ to each up slot and $- 1 \/ 2$ to each down slot at time zero. The expectation, in this normalized color law, of the exponential of $beta$ times the field times this sum is the ratio of the field and zero-field partition functions.]
  + #emph[For the allowed sets $E \, P$ and point $i$ above, 
#[#set math.equation(numbering: n => "(2.2)")
 $ bb(P)_E \( i in cal(B)_E \) = frac(2 r, 1 + r) \, #h(2em) d_E \( i \) = frac(r, 1 + r) \, #h(2em) r = bb(E)_P q_i . $ <eq:pinreturn>]

]
  + #emph[More generally, let $T$ be a nonempty finite set of points at one deterministic time, disjoint from an allowed $D$, and put $P' = D union T$. Expose $cal(B)_(P')$ and let $q_j^(D \, T)$ be the fresh-walk probability from $j in T$ of hitting $T$ at positive elapsed time before $D$. Then 
#[#set math.equation(numbering: n => "(2.3)")
 $ bb(P)_D \( T subset cal(B)_D \) lt.eq \( 2 r_T \)^(\| T \|) \, #h(2em) r_T = frac(1, \| T \|) sum_(j in T) bb(E)_(P') q_j^(D \, T) . $ <eq:simultaneouspin>]

]
  + #emph[For any allowed $D$, the factorial measure of $j$ distinct inter-site marks under $bb(P)_D$ is bounded by $2^j$ times the base factorial measure. This holds with chronological ordering and with arbitrary deterministic restrictions on the edges and times.]
] <prop:loopinputs>

The first assertion is the exact spin-$S$ representation in [13] Proposition 2.2, with the present rate and Hamiltonian normalizations. The second combines the one-pin weight identity and fresh-turn identity in [12] Propositions 2.4 and 2.8. The third combines [13] Proposition 3.1 and Lemma 4.4; in particular, no spatial separation of the test points is assumed. The last assertion is [13] Lemma 2.4. The statements include all-time boundary pins by the dense-boundary limit proved there.

=== 2.3 Kernel conventions and energy <kernel-conventions-and-energy>

Kernels act forward on column vectors, with counting inner products and norms. Killing on a pin means a projection at its prescribed time; boundary killing is imposed throughout, including at interval endpoints. Killing on exit from a spatial set retains the exit rates on the generator’s diagonal. The adjoint of an interval reverses the order of all factors, inverts transports, transposes the seam averages, and reverses the order of killing projections. Thus the two sides of an instantaneous operation remain distinct slices. Each seam factor is included exactly once in a traversal.

Extend the hole graph by making every slot outside $Lambda$ available. Its edges join available slots over neighboring sites. For a vector extended by zero on the inner boundary and outside $Lambda$, define

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(D)_t \( v \) = 1 / 2 sum_({ a \, b } upright(" available at ") t) \( v \( a \) - v \( b \) \)^2 . $ <eq:dirichlet>]

The exterior extension will allow flows to infinity; all test vectors will have finite support.

#thm([Lemma 2.2.])[
  (Contraction and energy loss).  #emph[At fixed exposure, every killed interval kernel and its adjoint are substochastic in both counting sums and contract counting $ell^p$ for $p = 1 \, 2 \, oo$. Between instantaneous operations a propagated vector satisfies 
$ frac(d, d t) lr(bar.v.double v_t bar.v.double)_2^2 = - 2 cal(D)_t \( v_t \) . $

 The squared norm cannot increase at an instantaneous operation.]
  #emph[Let $U$ be a one-period kernel with any allowed pin killings, and let $y$ vanish on its cut killing slots. Set $e_y = chevron.l y \, \( I - U \) y chevron.r gt.eq 0$. For either $U_d = U$ or $U^(*)$, let $Y_t$ be the adjoint propagation of $y$ from the terminal cut to an intermediate slice. Then 
#[#set math.equation(numbering: n => "(2.5)")
 $ integral_(upright("traversal")) cal(D)_t \( Y_t \) thin d t lt.eq e_y \, #h(2em) lr(bar.v.double y - U_d^(*) y bar.v.double)_2^2 lt.eq 2 e_y . $ <eq:energy>]

 The contraction and local norm-loss statements hold with extra spatial killing and for intervals continued across a period cut. Equation (2.5) concerns one complete traversal; each copy of that traversal has the same bound.]
] <lem:kernelenergy>

#proof[
  For one realization of the fresh exchanges and seam completions, the unkilled trajectories define a bijection between the endpoint hole sets. Deleting trajectories that encounter a killing set gives a partial permutation. Averaging proves the two substochastic bounds and the $ell^1$ and $ell^oo$ contractions. Rowwise Cauchy–Schwarz gives the $ell^2$ contraction, as in [12] Section 3.1. Transposition gives the stated reverse realization and the same bounds.
  On a smooth interval the generator is symmetric, with rate $1 \/ 2$ on each available edge and Dirichlet killing rates. Summing by edges proves the norm-loss identity. Zero extension gives exactly (2.4): a surviving interior slot has no edge directly to the exterior of the cube. Instantaneous contractions can only add to the norm loss. Finally, for $V = U$ or $U^(*)$, the real quadratic forms agree and
  $ lr(bar.v.double y bar.v.double)_2^2 - lr(bar.v.double V y bar.v.double)_2^2 = 2 e_y - lr(bar.v.double y - V y bar.v.double)_2^2 . $
  This identity, contraction, and the integrated norm loss prove (2.5). ◻
]

All these are finite-volume statements with piecewise smooth evolution. We disregard the null event of coincident Poisson marks or marks at a prescribed deterministic time. Deterministic operations that coincide are composed in their assigned order. The kernels are measurable from finite-time transition formulas, and hitting probabilities from increasing finite-horizon limits. Consequently we may average them under the actual picture law, including on events defined below.

== 3 A capacity comparison on one period <sec:capacity>

The probability of returning to a pin includes arbitrarily many turns of the fresh walk. We compare this probability directly, through a hitting problem on one cut. The local conclusion needed for magnetization is the following uniform comparison. Write $B_r \( x \) = { z in bb(Z)^3 : \| z - x \|_oo lt.eq r }$ for a site ball and set $R_(*) = ceil.l beta^(5 \/ 3) ceil.r$.

#thm([Proposition 3.1.])[
  (Uniform comparison away from pins).  #emph[For every fixed positive half-integer $S$ there are $beta_0 \( S \) < oo$ and a function $epsilon_S \( beta \) arrow.r 0$ as $beta arrow.r oo$ such that the following holds for every $beta gt.eq beta_0 \( S \)$. Let $Lambda$ be any finite cube, let $E = D_0 union F$ with $F$ any finite deterministic set of slot-time pins, and let $i = \( x \, a \)$ be a time-zero post-seam slot. Suppose that $B_(50 R_(*)) \( x \)$ is interior to $Lambda$ and that $E$ has no point above this ball. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ \| d_E \( i \) - 1 / ell n_S^(upright("sw")) \( beta \) \| lt.eq epsilon_S \( beta \) beta^(- 5 \/ 2) . $ <eq:pinnedcomparison>]

 The same uniform error bound, after enlarging $epsilon_S$ if necessary, holds for $\| bb(E)_(E union { i }) q_i - ell^(- 1) n_S^(upright("sw")) \( beta \) \|$.]
] <prop:comparison>

The bound is uniform over the number and locations of all pins outside the displayed ball. This uniformity permits a field to be represented by additional random pins. The proof is completed in Section 9, after the required residual estimates have been established.

We first give a finite-dimensional criterion that identifies the two estimates needed for this comparison: a scalar residual at a trial potential and a residual bound in the energy seminorm. Both directions of the period occur because its transition matrix need not be symmetric. The relation between hitting potentials and energy also appears in nonreversible potential theory; see [7] Section 2, Equation (2.6). The comparison below follows from direct finite-dimensional identities.

Let $H$ be a finite coordinate set, let $K subset H$ be killing coordinates, and fix $i in H \\ K$. Suppose that $U$ is a nonnegative doubly substochastic matrix on $bb(R)^H$, with zero rows and columns on $K$. It acts forward on columns. Complete each column to one by adding a cemetery state, and use $U$ for the successive transitions of the resulting killed chain. Let $q$ be its probability, starting at $i$, of returning to $i$ after at least one step before killing. Let $f_j$ be the probability of hitting $i$ before killing from $j$, with $f_i = 1$ and $f = 0$ on $K$. Thus $0 lt.eq f lt.eq 1$.

Write

$ A = I - U \, #h(2em) eta = upright(bold(1))_({ i }) \, #h(2em) e_z = chevron.l z \, A z chevron.r . $

All inner products and norms use counting measure. Since $U$ is an $ell^2$ contraction, $e_z gt.eq 0$, and real inner products give $e_z = chevron.l z \, A^(*) z chevron.r$. In the application, $H$ is the set of holes at the time-zero cut and $U$ is one traversal killed on $E$. Lemma 4 supplies exactly these contraction properties and their continuous-time energy interpretation.

Choose a real vector $h$ with $h_i = 1$ and $h = 0$ on $K$, and a real number $c$. Define its two residuals by

#[#set math.equation(numbering: n => "(3.2)")
 $ mu_(+) = U h - h + c eta \, #h(2em) mu_(-) = U^(*) h - h + c eta . $ <eq:capacityresiduals>]

Thus $A h = c eta - mu_(+)$ and $A^(*) h = c eta - mu_(-)$.

#thm([Lemma 3.2.])[
  (Finite capacity comparison).  #emph[For the preceding data, put $y = f - h$. Then 
#[#set math.equation(numbering: n => "(3.3)")
 $ A^(*) f & = \( 1 - q \) eta \,\
e_y & = chevron.l y \, mu_(-) chevron.r \,\
q - \( 1 - c \) & = chevron.l h \, mu_(+) chevron.r + chevron.l y \, mu_(+) chevron.r . $ <eq:harmonic>]

 No assumption of almost-sure killing is required.]
  #emph[Suppose, in addition, that $lr(bar.v.double h bar.v.double)_oo lt.eq M$ and there are numbers $X \, epsilon gt.eq 0$ such that, for both $d = + \, -$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ \| chevron.l mu_d \, z chevron.r \| lt.eq X sqrt(e_z) + epsilon quad upright("whenever ") z \|_K = 0 upright(" and ") lr(bar.v.double z bar.v.double)_oo lt.eq 1 + M . $ <eq:abstractdual>]

 Then 
#[#set math.equation(numbering: n => "(3.5)")
 $ \| q - \( 1 - c \) \| lt.eq \| chevron.l h \, mu_(+) chevron.r \| + 2 X^2 + 2 epsilon . $ <eq:capacitystability>]

]
] <lem:capacity>

#proof[
  For $j in.not K union { i }$, the first-step decomposition of the hitting event gives $f_j = sum_k U_(k j) f_k = \( U^(*) f \)_j$. The same equation is zero on $K$, whereas $\( U^(*) f \)_i = q$. This proves (3.3), even if the chain can remain forever in a class disjoint from $i$ and the cemetery state. In particular,
  $ chevron.l f \, A f chevron.r = chevron.l A^(*) f \, f chevron.r = 1 - q . $
  Subtracting the adjoint residual equation from (3.3) gives
  $ A^(*) y = \( 1 - q - c \) eta + mu_(-) . $
  Since $y_i = 0$, pairing with $y$ proves (3.3). To obtain the capacity identity, use $h_i = f_i = 1$ to write
  $ 1 - q = chevron.l A^(*) f \, h chevron.r = chevron.l f \, A h chevron.r = c - chevron.l f \, mu_(+) chevron.r . $
  Substituting $f = h + y$ proves (3.3).
  The vector $y$ is admissible in (3.4). Hence $e_y lt.eq X sqrt(e_y) + epsilon$, which implies $sqrt(e_y) lt.eq X + sqrt(epsilon)$. Consequently
  $ \| chevron.l y \, mu_(+) chevron.r \| lt.eq X^2 + X sqrt(epsilon) + epsilon lt.eq 2 X^2 + 2 epsilon . $
  Insert this bound into (3.3). ◻
]

The adjoint residual in (3.3) controls the distance between the hitting potential and the trial vector. The forward residual then controls the capacity itself. In particular, one scalar estimate and two energy estimates suffice; no expansion in the number of returns is involved.

The same criterion can be averaged over a random environment. Precisely, suppose that all preceding objects are measurable, that $c in \[ 0 \, 1 \]$ is deterministic, and that (3.4) holds on a measurable event $cal(G)$ with a uniform bound $M$. Then (3.5) and $0 lt.eq q lt.eq 1$ give

#[#set math.equation(numbering: n => "(3.6)")
 $ \| bb(E) q - \( 1 - c \) \| lt.eq bb(E) #h(-0.16667em) [upright(bold(1))_(cal(G)) \| chevron.l h \, mu_(+) chevron.r \|] + 2 bb(E) \[ upright(bold(1))_(cal(G)) X^2 \] + 2 bb(E) \[ upright(bold(1))_(cal(G)) epsilon \] + bb(P) \( cal(G)^c \) . $ <eq:averagedcapacity>]

We next construct an event on which diffusion and spatial flow estimates are available. After that construction, the all-turn free potential will provide the trial vector $h$.

== 4 Sparse obstacles and local propagation <sec:geometry>

The return comparison requires an exceptional set smaller than $beta^(- 5 \/ 2)$ and spatial propagation sharper than a ballistic bound. We obtain both from a six-point sparsity estimate and a displacement estimate for isolated exposed strands. The former is an extension of the one-point argument in [12] Section 4; the latter uses a direct recoloring of the exchange picture. We then fix a good exposure and derive the heat-kernel and flow estimates used in the comparison.

All site distances and balls in this section use the supremum norm. A site is #emph[blocked] if none of its slots is a hole. In the extended hole graph, blocked sites occur only inside $Lambda$.

=== 4.1 Geometric inputs and the snapshot estimate <geometric-inputs-and-the-snapshot-estimate>

We first recall the geometric hypotheses under which the available slots support uniform diffusion and flows. Fix the constant $M_(*) gt.eq 48$ used in [12] Section 3; it is chosen there from [13] Lemma 5.5. A time is #emph[regular at radius $R_0$ about $x$] if:

+ every $B_(M_(*)) \( z \)$ with $z in B_(11 R_0) \( x \)$ contains fewer than six blocked sites;
+ for each blocked $z$ with $b = \| z - x \|_oo > 10 R_0$, its blocked component, with component steps of supremum length at most eight, has radius about $z$ at most $\( 1 + b \)^(1 \/ 300)$.

We call the first condition #emph[local regularity].

#thm([Proposition 4.1.])[
  (Imported geometric estimates).  #emph[For all sufficiently large $beta$, every allowed pin set $D$, every deterministic time, every anchor $x$, and every $R_0$ above a fixed threshold, the following bounds hold. Put $p = \( 5 \/ beta \)^(10 \/ 11)$.]
  + #emph[The probability of a nonregular time under $bb(P)_D$ is at most 
#[#set math.equation(numbering: n => "(4.1)")
 $ C R_0^3 p^6 + C e^(- c R_0^xi) \, $ <eq:regularityprob>]

 for some fixed $xi > 0$. Failure of the second regularity condition alone has probability at most $C e^(- c R_0^xi)$.]
  + #emph[At every locally regular time, every nonnegative vector on the hole graph supported above $B_(R_0) \( x \)$ satisfies 
#[#set math.equation(numbering: n => "(4.2)")
 $ lr(bar.v.double v bar.v.double)_2^(2 + 4 \/ 3) lt.eq C cal(D)_t \( v \) lr(bar.v.double v bar.v.double)_1^(4 \/ 3) . $ <eq:nash>]

 There is an available slot within bounded distance of every site in $B_(2 R_0) \( x \)$. Available slots over two sites in this ball at distance $b$ can be joined by a path of length at most $C \( 1 + b \)$, staying within distance $C \( 1 + b \)$ of the first site and inside $B_(3 R_0) \( x \)$.]
  + #emph[At every regular time, each available slot $a$ above $B_(R_0) \( x \)$ admits a unit flow $J_a$ to infinity on the extended hole graph. For $b$ the distance between its source site and an edge, 
#[#set math.equation(numbering: n => "(4.3)")
 $ \| J_a \( e \) \| lt.eq C \( 1 + b \)^(- 199 \/ 100) \, #h(2em) \| J_a \( e \) \| lt.eq C \( 1 + b \)^(- 2) quad \( b lt.eq R_0 \) . $ <eq:flowenvelopes>]

]
  #emph[All constants are uniform in the volume, pins, anchor, and deterministic time.]
] <prop:geometryinputs>

The probability estimates are [13] Proposition 5.4 and Theorem 7.5, with their separate local and distant-component bounds, as applied in [12] Proposition 4.3. To check the time-grid hypothesis of the pin theorem, include zero, the queried time, and every extra pin time in a finite grid and refine until every gap is at most $p^12$. Then $beta = 5 p^(- 11 \/ 10)$, and the theorem is uniform in the grid.

The Nash inequality is [13] Proposition 5.6. Its proof uses only local regularity: alternatively fill all sufficiently remote sites with holes to obtain full regularity without changing the energy of a vector supported in $B_(R_0) \( x \)$. The path assertion follows from [13] Lemma 5.5. Every site in $B_(2 R_0 + 1) \( x \)$ has an unblocked nearest neighbor, since six blocked neighbors would violate local regularity. Along a nearest-neighbor site route replace blocked vertices by such neighbors and use the lemma’s bounded paths between successive surviving vertices. All detours have bounded size. Slots over the same site are connected through an unblocked neighbor. For $R_0$ above a fixed threshold the resulting paths stay in $B_(3 R_0) \( x \)$. The global flow envelope is [13] Proposition 6.2; the inverse-square improvement is proved in [12] Lemma 3.6. That proof uses only regularity at the stated radius and a fixed lower threshold, so the near envelope is available for arbitrary $R_0$ here.

We next strengthen the pin theorem to its natural diffusive density, for the finitely many points needed below. Write $lambda = beta^(- 3 \/ 2)$.

#thm([Proposition 4.2.])[
  (Uniform snapshot sparsity).  #emph[For every allowed pin set $D$ and every set $T$ of distinct slot points at one deterministic time, with $1 lt.eq \| T \| lt.eq 6$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(P)_D \( T subset cal(B)_D \) lt.eq C lambda^(\| T \|) . $ <eq:snapshot>]

 The bound is uniform in the finite cube, the pin set, the time, and the points, including distinct slots at the same site.]
] <prop:snapshot>

#proof[
  If $T$ meets $D$, the probability is zero. Otherwise set $m = \| T \|$ and $P' = D union T$. By (2.3), it suffices to prove $r_T lt.eq C lambda$. We adapt the one-turn energy argument of [12] Section 4, retaining all $m$ sources.
  Fix the exposure under $bb(P)_(P')$ and use the time of $T$ as the cut. Let $U$ be the fresh one-period kernel killing only on the inner boundary, and put $Q = \( U + U^(*) \) \/ 2$ and $eta = upright(bold(1))_T$. Let $f = 1$ on $T$; off $T$, let $f$ be the probability of hitting $T$ at a future cut before boundary killing. Finite-horizon approximation gives $0 lt.eq f lt.eq 1$ and $U^(*) f = f$ off $T$, even if eventual killing is not almost sure. For $g = f - eta$, put $e_g = chevron.l g \, \( I - Q \) g chevron.r gt.eq 0$. Removing all pins of $D$ except the boundary increases the return probability. Harmonicity off $T$ and expansion of the quadratic form therefore give
  #[#set math.equation(numbering: n => "(4.5)")
   $ m r_T & lt.eq bb(E)_(P') #scale(x: 120%, y: 120%)[\[] m - chevron.l f \, \( I - Q \) f chevron.r #scale(x: 120%, y: 120%)[\]]\
 & = bb(E)_(P') #scale(x: 120%, y: 120%)[\[] chevron.l eta \, Q eta chevron.r + chevron.l \( U + U^(*) \) eta \, g chevron.r - e_g #scale(x: 120%, y: 120%)[\]] . $ <eq:snapshotenergy>]
  This is also the multipoint hitting-energy identity in [13] Lemma 4.5.
  Here are the propagation estimates used to bound the two positive terms. For each $j in T$, let $x_j$ be its site and choose radius $R_0 = ceil.l a beta ceil.r$, with $a$ a sufficiently large fixed constant. Let $H_j$ be the event that the total nonregular time at this radius about $x_j$ is at most $beta \/ 100$. Equation (4.1) and Markov’s inequality give
  #[#set math.equation(numbering: n => "(4.6)")
   $ bb(P)_(P') \( H_j^c \) + sup_t bb(P)_(P') \( t upright(" is nonregular about ") x_j \) lt.eq C beta^(- 27 \/ 11) = o \( lambda \) . $ <eq:bootstrapbad>]
  The localization, diffusion, and spread-source estimates in [12] Lemma 4.4 and Propositions 4.5 and 3.7, with one turn, have the following consequences. Replacing a propagation from $j$ by the propagation killed on exit from $B_(R_0) \( x_j \)$ loses expected mass at most $C e^(- c beta)$. On $H_j$, a localized propagation of duration at least $beta \/ 3$ has $ell^2$ norm at most $C beta^(- 3 \/ 4)$; localized full-period entries are at most $C lambda$. At a regular endpoint, a nonnegative localized mass $mu$ of mass at most one and norm at most $C beta^(- 3 \/ 4)$ satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| chevron.l mu \, Y chevron.r \| lt.eq #scale(x: 120%, y: 120%)[\(] C beta^(- 1 \/ 2) cal(D)_t \( Y \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) $ <eq:bootstrapspread>]
  for every finitely supported $Y$. These estimates apply with pin law $P'$: for the source $j$, all other points of $P'$ are allowed extra pins. They impose no separation on $T$.
  Since there are at most $m^2$ return entries, localization, diffusion, and (4.6) imply $bb(E)_(P') chevron.l eta \, Q eta chevron.r lt.eq C lambda$. For the cross term, consider one pairing $chevron.l U_d upright(bold(1))_({ j }) \, g chevron.r$, where $U_d = U$ or $U^(*)$. Split it at elapsed time $u in I = \[ beta \/ 3 \, 2 beta \/ 3 \]$. Localize only the propagated starting mass, and let $Y \( u \)$ be the adjoint suffix applied to $g$. Both the mass and $lr(bar.v.double Y \( u \) bar.v.double)_oo$ are at most one. Discarding the localization loss, $H_j^c$, and nonregular split slices therefore changes the expected pairing by $o \( lambda \)$. On retained slices use (4.7); then average over $I$. Lemma 4 and Cauchy–Schwarz give, at each fixed exposure, the retained average bound
  $ frac(C beta^(- 1 \/ 4), \| I \|) integral_I sqrt(cal(D)_(t \( u \)) \( Y \( u \) \)) thin d u lt.eq C beta^(- 3 \/ 4) sqrt(e_g) . $
  In this application the energy uses boundary-only killing, as does $U$, and its quadratic form equals that of $Q$. There are $2 m lt.eq 12$ such pairings. Substituting in (4.5) and using
  $ C beta^(- 3 \/ 4) sqrt(e_g) - e_g lt.eq C' beta^(- 3 \/ 2) $
  proves $r_T lt.eq C lambda$. Equation (2.3) now proves (4.4). ◻
]

=== 4.2 Short blocks and isolated strands <short-blocks-and-isolated-strands>

The density $lambda$ in Proposition 8, in place of the coarser $p$ in (4.1), makes six-obstacle events sufficiently rare on the larger spatial scales introduced next. The snapshot estimate will give at most five obstacles in a mesoscopic neighborhood. To compare an isolated moving obstacle with a smooth profile, we also need its displacement to be smaller than the block length. We prove that displacement bound before assembling the good event, so that no conditioning on that event enters its proof.

From now on $i$ lies at time zero just after the seam, over site $x$, and $P = E union { i }$. Choose

#[#set math.equation(numbering: n => "(4.8)")
 $ D_(*) = sqrt(beta) \, #h(2em) L = beta^delta \, #h(2em) delta = 1 / 200 \, #h(2em) R = beta^(3 \/ 2 + delta \/ 4) \, #h(2em) R_(*) = ceil.l beta^(5 \/ 3) ceil.r . $ <eq:scales>]

We assume $B_(50 R_(*)) \( x \)$ is interior to $Lambda$ and contains no site above which $E$ has a pin. All subsequent bounds are uniform under this assumption. We call an error #emph[rapidly small] if, for every fixed $j$, its absolute value is at most $C_j beta^(- j)$ with this uniformity.

Partition each half-period into equal blocks of length between $L$ and $2 L$. Subdivide the blocks into bins of length between one and three. Use the same partitions in reverse. The seam is assigned to the last forward block and bin and to the first reverse block and bin. An exposed #emph[strand] in a block is the trajectory of one exposed slot at its starting slice in the chosen direction. This definition counts different strands of the same cycle separately.

#thm([Lemma 4.3.])[
  (Domination of an isolated strand).  #emph[Fix an allowed pin set $P$, a deterministic slot $v$, and an interval $\[ s \, t \]$ of positive length less than $beta$ containing no seam in its interior. Follow the picture’s strand $X$ from $v$ at time $s$ to time $t$. Let $cal(I)$ be the event that this strand is exposed and, throughout the interval, no other exposed slot lies at its site or a neighboring site, on both sides of every jump. For every measurable path event $cal(A)$ consisting of paths that stay in the interior, 
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(P)_P #scale(x: 120%, y: 120%)[\(] cal(I) ∩ { X in cal(A) } #scale(x: 120%, y: 120%)[\)] lt.eq 2 bb(E)_(upright(b)) upright(bold(1))_({ X in cal(A) }) . $ <eq:isolateddomination>]

 On the right, $X$ is the base tagged walk, with rate $1 \/ 2$ along each slot edge; on interior paths its law is the free walk law. Any seam at an endpoint is excluded: use the post-seam side at $s$ and the pre-seam side at $t$. The same bound holds when both paths are traced backward from a prescribed slot at $t$ to $s$, with these same chronological sides.]
] <lem:isolatedpath>

#proof[
  We first impose that the distinguished exposed cycle is colored down. Conditionally on a picture in $cal(I)$, this costs exactly a factor $1 \/ 2$. We prove that the resulting joint path law is bounded by the base tagged-walk law.
  Fix a path $X$ starting at $v$, with successive slots joined by slot edges and jump times $s < tau_1 < dots.h.c < tau_j < t$. Let $A_X$ consist of the edge–time pairs $\( e \, u \)$ with $s < u < t$, $u$ not a jump time, and $e$ incident to $X \( u \)$; let $mu$ be the base Poisson intensity measure. The path requires its $j$ jump marks and the absence of all other marks in $A_X$. Poisson disintegration gives the density
  $ q \( X \) = 2^(- j) exp { - mu \( A_X \) } $
  with respect to counting measure on such slot lists and Lebesgue measure on ordered jump times. The complementary clocks and seams retain their independent base laws. Denote those variables by $zeta$, and let $N_X \( zeta \)$ count the admissible color histories for which $cal(I)$ holds and the distinguished cycle is down.
  Recolor only the segment $X$ up. Every other slot at its site or a neighboring site is up, since isolation makes those slots unexposed. At a prescribed jump the colors change from $\( arrow.b \, arrow.t \)$ to $\( arrow.t \, arrow.b \)$; after recoloring, both slots are up on both sides, so the mark can be deleted. Fill $A_X$ with arbitrary additional marks. Each new mark joins two up slots, so the recolored history remains valid. Its only color discontinuities are the prescribed $arrow.b #h(-0.16667em) arrow.r #h(-0.16667em) arrow.t$ flip at $\( v \, s \)$ and $arrow.t #h(-0.16667em) arrow.r #h(-0.16667em) arrow.b$ flip at $\( X \( t \) \, t \)$. All pins remain up, because the original segment belongs to an exposed cycle. Figure 1 depicts the deleted jumps, the arbitrary up–up fillings, and the oriented endpoint flips.
  For fixed $X$, $zeta$, and filling, the map on color histories is injective: recoloring the specified segment down recovers the original history. In the filled picture, a cycle containing a prescribed oriented flip has at most one compatible coloring. Every other cycle has at most its usual one choice if pinned and two choices if unpinned. Writing $w_P = 2^(n_P)$ and $omega'$ for the filled picture, we therefore have $N_X \( zeta \) lt.eq w_P \( omega' \)$ for every filling.
  For fixed $X$, the set $A_X$ is deterministic. Independent Poisson filling on $A_X$, together with the complementary clocks and seams, has exactly the unconditioned base law. Averaging yields
  $ bb(E)_zeta N_X \( zeta \) lt.eq bb(E)_(upright(b)) w_P = Z_P . $
  The down-strand path density is $q \( X \) bb(E)_zeta N_X \( zeta \) \/ Z_P$, hence at most $q \( X \)$. Summing over jump lists and integrating their ordered times proves the assertion for every measurable $cal(A)$; finite volume gives finitely many marks almost surely. Removing the down-color condition supplies the factor two. At seam endpoints the flips are inserted on the specified sides of the unchanged seam mapping. Reversing time gives the reverse assertion, with the flip directions reversed. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.29, 3.96), [#text(size: 9pt)[Fixed isolated down strand]])
  line((0, 0.22), (0, 3.344), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0.86, 0.22), (0.86, 3.344), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((1.72, 0.22), (1.72, 3.344), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((2.58, 0.22), (2.58, 3.344), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((-0.559, 0.308), (-0.559, 3.256), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((-0.559, 3.256), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  line((0.86, 0.308), (0.86, 1.012), (1.72, 1.012), (1.72, 2.244), (0.86, 2.244), (0.86, 3.256), stroke: (paint: rgb("#a53732"), thickness: 1.2pt, miter-limit: 10))
  line((1.032, 1.012), (1.591, 1.012), stroke: (paint: rgb("#a53732"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a53732"))))
  line((1.548, 2.244), (0.989, 2.244), stroke: (paint: rgb("#a53732"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a53732"))))
  circle((0.86, 0.308), radius: 0.07056, fill: rgb("#a53732"), stroke: none)
  circle((0.86, 3.256), radius: 0.07056, fill: rgb("#a53732"), stroke: none)
  content((0, 0.308), [#text(size: 9pt)[$t_0$]], anchor: "east", padding: 0.1176cm)
  content((0, 3.256), [#text(size: 9pt)[$t_1$]], anchor: "east", padding: 0.1176cm)
  content((1.892, 1.408), [#text(fill: rgb("#a53732"))[#text(size: 9pt)[$X$]]], anchor: "west", padding: 0.1176cm)
  content((1.29, -0.308), [#text(size: 9pt)[The incident holding intervals#linebreak()contain no exchange marks.]])
  content((8.09, 3.96), [#text(size: 9pt)[Recolor, delete, and fill]])
  line((6.8, 0.22), (6.8, 3.344), stroke: (paint: rgb("#98bdbc"), thickness: 0.4pt, miter-limit: 10))
  line((7.66, 0.22), (7.66, 3.344), stroke: (paint: rgb("#98bdbc"), thickness: 0.4pt, miter-limit: 10))
  line((8.52, 0.22), (8.52, 3.344), stroke: (paint: rgb("#98bdbc"), thickness: 0.4pt, miter-limit: 10))
  line((9.38, 0.22), (9.38, 3.344), stroke: (paint: rgb("#98bdbc"), thickness: 0.4pt, miter-limit: 10))
  line((7.66, 0.308), (7.66, 1.012), (8.52, 1.012), (8.52, 2.244), (7.66, 2.244), (7.66, 3.256), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((6.8, 0.704), (7.66, 0.704), stroke: (paint: rgb("#196c69"), thickness: 1.2pt, miter-limit: 10))
  line((7.66, 1.496), (8.52, 1.496), stroke: (paint: rgb("#196c69"), thickness: 1.2pt, miter-limit: 10))
  line((8.52, 1.848), (9.38, 1.848), stroke: (paint: rgb("#196c69"), thickness: 1.2pt, miter-limit: 10))
  line((6.8, 2.772), (7.66, 2.772), stroke: (paint: rgb("#196c69"), thickness: 1.2pt, miter-limit: 10))
  circle((7.66, 0.308), radius: 0.1058, fill: rgb("#ffffff"), stroke: (paint: rgb("#196c69"), thickness: 0.8pt, miter-limit: 10))
  circle((7.66, 3.256), radius: 0.1058, fill: rgb("#ffffff"), stroke: (paint: rgb("#196c69"), thickness: 0.8pt, miter-limit: 10))
  content((7.746, 0.308), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[down $arrow.r$ up]]])], anchor: "west")
  content((7.746, 3.256), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[up $arrow.r$ down]]])], anchor: "west")
  content((8.09, -0.308), [#text(size: 9pt)[New incident marks exchange#linebreak()two up colors.]])
})],
  caption: [Figure 1: The color-counting comparison for a fixed isolated strand. Time runs upwards; horizontal segments represent instantaneous exchanges, and the slot coordinates are schematic. Recoloring the prescribed segment $X$ up allows its jump marks to be removed and its incident holding intervals to be filled freely. The only remaining color discontinuities are the two directed endpoint flips. Each cycle meeting a flip has at most one admissible coloring, which gives the pin-weight bound used in the path comparison. ],
) <fig:surgery>

In particular, (4.9) bounds a joint event, not the strand law conditioned on isolation. This is precisely what is needed when excluding rare isolated strands with large displacement.

#thm([Proposition 4.4.])[
  (Good exposures).  #emph[Under $bb(P)_P$ there is an event $cal(G)$ with 
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(P)_P \( cal(G)^c \) = o \( beta^(- 5 \/ 2) \) $ <eq:goodprob>]

 having the following properties in $B_(12 R_(*)) \( x \)$, in either direction of traversal.]
  + #emph[A strand makes at most $c_0 L$ inter-site steps in a block and at most $C log beta$ in a bin. The bounds also apply to segments traced from an intermediate visit to the region, in either time direction.]
  + #emph[At each block cut, every ball of radius $c_1 L$ centered in the region contains at most five obstacle slots. Local regularity at radius $R_(*)$ about $x$ holds at all times. In every block, the set of fully regular times at that radius has length at least half the block.]
  + #emph[A strand is called isolated in a block and direction if no other obstacle slot lies within $c_2 L$ of its starting site. Every such strand stays at distance greater than two from all other obstacles and has maximal site displacement at most $C L^(3 \/ 4)$ in the block.]
  #emph[The constants are fixed in the order $c_0$, then $c_2$, then $c_1$, with each sufficiently large for the preceding choices. The event and all its properties repeat on subsequent copies of the period.]
] <prop:good>

#proof[
  First control the number of strand steps. A chronological connected list of $j$ inter-site marks in an interval of length $u$, anchored at a prescribed site, has probability at most
  #[#set math.equation(numbering: n => "(4.11)")
   $ frac(\( C u \)^j, j !) . $ <eq:marklist>]
  Indeed, there are at most $C^j$ successive site and slot-edge choices, and the ordered time simplex has volume $u^j \/ j !$; apply the factorial bound in Proposition 3. The same count works in reverse order. It bounds lists anywhere in the interval, so it also covers a segment beginning at an arbitrary intermediate visit; no union over real starting times is necessary. Taking $j = c_0 L$ on blocks, with $c_0$ large, gives $e^(- c L)$ tails. Taking $j = C log beta$ on bins gives rapidly small tails by the factorial in (4.11). A polynomial union over sites, blocks, bins, and both directions proves the first property with rapidly small error. For this count and the next one enlarge the region to $B_(20 R_(*)) \( x \)$.
  At a fixed block cut and center, six obstacles in a ball of radius $c_1 L$ supply six distinct slot points there. There are at most $C L^18$ such six-tuples. Proposition 8, followed by a union over centers and at most $C beta$ cuts, bounds this failure probability by
  #[#set math.equation(numbering: n => "(4.12)")
   $ C beta R_(*)^3 L^18 lambda^6 lt.eq C beta^(- 3 + 18 delta) = C beta^(- 2.91) = o \( beta^(- 5 \/ 2) \) . $ <eq:sixfailure>]
  Seam permutations preserve the site counts, including multiplicities, so this estimate holds on either seam side.
  If six blocked sites were present in one of the required fixed-radius balls during a block, one obstacle at each site could be traced back to the block cut. The first property would place their six distinct starting slots in a ball of radius $c_1 L$, once $c_1$ is large enough. This is impossible. Thus local regularity holds at all times. For the remaining condition, Proposition 7 bounds the expected measure of times when distant-component regularity fails in any block $I$ by $C \| I \| e^(- c R_(*)^xi)$. Markov’s inequality and a union over blocks show, with rapidly small error, that it fails on less than half of every block. This proves the second property.
  The step bound also ensures that an isolated strand cannot meet another obstacle during its block. Any potential encounter can be traced back in both strands to their distinct block-start slots, at total distance at most a fixed multiple of $c_0 L$. Choose $c_2$ larger than that multiple. This argument also covers strands entering the region, by tracing backward from the encounter.
  It remains to bound the isolated strand’s displacement. The site coordinate of the base walk in Lemma 9 jumps at rate $S$ to each nearest neighbor. Exponential martingales in each coordinate give, for $u lt.eq 2 L$,
  $ bb(P)_(upright(b)) (max_(0 lt.eq v lt.eq u) \| X \( v \) - X \( 0 \) \|_oo > C L^(3 \/ 4)) lt.eq C e^(- c sqrt(L)) . $
  For example, use an exponential parameter of order $L^(- 1 \/ 4)$; the martingale compensator is at most a constant times $u L^(- 1 \/ 2)$. On the step event already established, strands beginning in the region stay interior. Lemma 9 therefore bounds the joint event of isolation and excessive displacement. A polynomial union over slots, blocks, and directions is rapidly small. Seams make no spatial displacement; for a seam block, enumerate also the slots on its other seam side. Combining these exceptional sets proves (4.10) and the third property. ◻
]

=== 4.3 Heat propagation at a fixed good exposure <heat-propagation-at-a-fixed-good-exposure>

From this point, all actual kernels kill on $E$, not at $i$. The estimates in this subsection are deterministic statements about the fresh walk at an exposure in $cal(G)$. The earlier picture probabilities have already done their work in constructing that event.

#thm([Lemma 4.5.])[
  (Local heat bound).  #emph[On $cal(G)$, a fresh-walk interval kernel of elapsed length $u$, additionally killed on exit from $B_(R_(*)) \( x \)$, has maximum entry at most 
#[#set math.equation(numbering: n => "(4.13)")
 $ C \( 1 + u \)^(- 3 \/ 2) . $ <eq:heatbound>]

 The bound holds for either time direction, for every starting slice, with additional spatial killing, and across copies of the period.]
] <lem:heatbound>

#proof[
  We use Nash’s energy-dissipation argument [11] pp. 935–936. For a nonnegative input of mass at most one, let $l = lr(bar.v.double v bar.v.double)_2^2$. The all-time local regularity in Proposition 10 permits (4.2) at every smooth time, so $l' lt.eq - c l^(5 \/ 3)$. Instantaneous operations are contractions by Lemma 4. Integrating gives $lr(bar.v.double v bar.v.double)_2 lt.eq C \( 1 + u \)^(- 3 \/ 4)$ for a unit point input. Split the kernel at its midpoint and express an entry as the inner product of a forward mass and an adjoint mass, each propagated for $u \/ 2$. Their two norm bounds give (4.13). ◻
]

#thm([Lemma 4.6.])[
  (Displacement of the fresh walk).  #emph[On $cal(G)$, from any slot above $B_(6 R) \( x \)$ and any starting slice, a fresh walk run for elapsed time $u lt.eq 2 beta$ in either direction stays within site distance 
#[#set math.equation(numbering: n => "(4.14)")
 $ C \( 1 + u \/ L \) L^(3 \/ 4) $ <eq:localization>]

 of its starting site, apart from a rapidly small probability uniform over the fixed good exposure. The assertion bounds the probability of excessive displacement before killing. In particular, adding killing on exit from $B_(R_(*)) \( x \)$ changes these propagations by a rapidly small amount in total mass.]
] <lem:localization>

#proof[
  Consider first a piece of one block, of length at most $2 L$, starting at any slice and over a site $z$ in $B_(9 R) \( x \)$. Stop on exiting $B_L \( z \)$, including its exit step in the displacement estimate. Every obstacle strand visiting this ball or its immediate neighbors traces back at most $c_0 L$ steps to a distinct slot at the deterministic block cut. The obstacle count in Proposition 10 thus shows that at most five strands can be relevant before stopping. Their instantaneous neighborhoods have uniformly bounded size.
  The rate jumps of each site coordinate have bounded rates and unit increments. Their drift vanishes away from the neighboring obstacles and is uniformly bounded elsewhere. Lemma 11, with the stopping-ball killing, bounds the expected occupation time near the relevant strands by
  $ C integral_0^(2 L) \( 1 + t \)^(- 3 \/ 2) thin d t lt.eq C . $
  The expectation is uniform in the starting slot and slice, including either side of any prescribed operation.
  A forced transport occurs only when the fresh walk is at its prescribed departure hole. In any bin there are at most $C log beta$ relevant transports, by the bin step bound for the five strands. Apply (4.13) to the probability of presence just before each such operation. Summing over bins, using their lengths between one and three, bounds the expected number of forced steps before stopping by
  $ C log beta sum_(n gt.eq 0) \( 1 + n \)^(- 3 \/ 2) lt.eq C log beta . $
  The same estimate holds from an arbitrary intermediate slice: a unit-time interval intersects only a bounded number of the original bins. These estimates use deterministic transport times at fixed exposure, with no conditional Poisson assertion.
  Let $A$ be the accumulated occupation time near obstacles plus the number of forced steps. From every stopping slice and surviving state, the conditional expected remaining accumulation is at most $C log beta$. The Markov property and Markov’s inequality show that each further increment of size $2 C log beta + 1$ has conditional probability at most $1 \/ 2$. Occupation time is continuous and the transport-count overshoot is at most one. Restarting at successive thresholds therefore gives, for each fixed $a > 0$,
  $ Pr \( A > a L^(3 \/ 4) \) lt.eq C_a exp { - c_a L^(3 \/ 4) \/ log beta } . $
  This controls both the integrated drift and the forced displacement.
  Subtract the integrated drift from the ordinary rate jumps. For each coordinate, bounded rates and unit jumps imply that its compensated process $M_t$ has $exp { theta M_t - C theta^2 t }$ as a supermartingale for $\| theta \| lt.eq 1$, with a fixed $C$. The maximal inequality with $theta$ of order $L^(- 1 \/ 4)$ gives
  $ Pr #scale(x: 120%, y: 120%)[\(] max_(t lt.eq 2 L) \| M_t \| > a L^(3 \/ 4) #scale(x: 120%, y: 120%)[\)] lt.eq C_a e^(- c_a sqrt(L)) . $
  The three displacement contributions prove the claimed bound on one block piece. Since $C L^(3 \/ 4) < L$ for large $beta$, they also bound the probability of reaching the stopping sphere. Seam operations change no site coordinate.
  An interval of length $u$ meets at most $C \( 1 + u \/ L \)$ block pieces. Apply the preceding uniform bound successively and add their displacements. There are polynomially many pieces, so the total failure probability remains rapidly small. Throughout an interval of length at most $2 beta$, the resulting displacement is $O \( beta L^(- 1 \/ 4) \) = o \( R \)$. The walk therefore stays in the local region used above, and in $B_(R_(*)) \( x \)$. This proves the lemma. ◻
]

=== 4.4 Overlaps of flows <overlaps-of-flows>

The final geometric estimate measures the energy cost of superposing flows from different source locations. It retains their separation, which will be essential when averaging the sparse source locations.

#thm([Lemma 4.7.])[
  (Flow overlap).  #emph[At a fully regular slice on $cal(G)$, choose the unit flows in (4.3) for available slots $a \, a'$ over $B_(6 R) \( x \)$. Then 
#[#set math.equation(numbering: n => "(4.15)")
 $ sum_e \| J_a \( e \) J_(a') \( e \) \| lt.eq frac(C, 1 + "dist" \( a \, a' \)) \, $ <eq:flowoverlap>]

 where the distance is between their sites.]
] <lem:flowoverlap>

#proof[
  Where both edge distances from the source sites are at most $R_(*)$, use the two inverse-square envelopes. Their convolution in dimension three is bounded by $C \/ \( 1 + b \)$ at source separation $b$: balls of radius $b \/ 2$ about either source contribute $C \/ \( 1 + b \)$, and dyadic shells outside them have the same total bound.
  If one source distance exceeds $R_(*)$, both are at least a fixed multiple of $R_(*)$, since $a \, a'$ lie over $B_(6 R) \( x \)$ and $R = o \( R_(*) \)$. The global envelopes then bound the remaining sum by
  $ C R_(*)^(3 - 2 \( 199 \/ 100 \)) = C R_(*)^(- 98 \/ 100) lt.eq C R^(- 1) . $
  The last inequality follows from $\( 5 \/ 3 \) \( 98 \/ 100 \) = 49 \/ 30 > 3 \/ 2 + delta \/ 4$. As $b lt.eq 12 R$, this is bounded by the right-hand side of (4.15). ◻
]

== 5 The ideal potential and its profiles <sec:profiles>

We now choose the trial vector for the capacity comparison. The free potential includes every positive number of periods, so its capacity already contains the full ideal-magnon density. A spatial cutoff makes it a finite-volume test vector without truncating those periods. We also obtain the spatial and temporal estimates needed to compare its evolution with the walk among holes.

Fix $S$, put $ell = 2 S$, and use the scales in (4.8). Let $E = D_0 union F$, where $F$ is a finite deterministic set of slot-time pins, and let $i = \( x \, a \)$ be an unpinned post-seam slot at time zero. Throughout the comparison assume that $B_(50 R_(*)) \( x \)$ lies in the interior of the cube and that no point of $E$ lies above this ball. The picture law is $bb(P)_P$, where $P = E union { i }$. At a fixed exposure let $U$ be the forward one-period kernel killed on $E$, retaining its zero rows and columns on killed cut slots. Set $A = I - U$ and use the energy $e_y$ of Section 3.

=== 5.1 The all-turn free potential <the-all-turn-free-potential>

On $bb(Z)^3 times { 1 \, dots.h \, ell }$, let $cal(L)$ have rate $1 \/ 2$ on every slot edge, and let $T_s = exp \( s cal(L) \)$. Let $J$ be the projection that averages the slots at each site. For a slot-uniform vector the site jump rate is $ell \/ 2 = S$ to each neighbor. Denote this site semigroup by $P_s$, and its kernel from the origin by $p_s \( z \)$. Its Fourier multiplier is

#[#set math.equation(numbering: n => "(5.1)")
 $ hat(p)_s \( k \) = exp #h(-0.16667em) [- 2 s S sum_(j = 1)^3 \( 1 - cos k_j \)] \, #h(2em) k in \[ - pi \, pi \]^3 . $ <eq:freemultiplier>]

If a vector has zero sum on the slots at every site, then $cal(L)$ acts on it as $- 3 ell I$. Therefore

#[#set math.equation(numbering: n => "(5.2)")
 $ T_s = P_s J + e^(- 3 ell s) \( I - J \) . $ <eq:slotdecomposition>]

The free seam is $J$. It commutes with $T_s$, so the ideal full-period operator, in either direction, is

$ U_0 = J T_beta = T_beta J = P_beta J \, #h(2em) \( U_0^n \)_(\( z \, b \) \, \( x \, a \)) = 1 / ell p_(n beta) \( z - x \) quad \( n gt.eq 1 \) . $

In particular the slot modes removed by the seam contribute nothing to a positive full turn.

With $eta = upright(bold(1))_({ i })$ on the full slot lattice, define the slot-uniform function

#[#set math.equation(numbering: n => "(5.3)")
 $ v \( z \) = 1 / ell sum_(n gt.eq 1) p_(n beta) \( z - x \) \, #h(2em) c = frac(1, 1 + v \( x \)) . $ <eq:freepotential>]

The estimates below show that the sum is finite and $v \( x \) = O_S \( beta^(- 3 \/ 2) \)$. Positivity and the semigroup property give

#[#set math.equation(numbering: n => "(5.4)")
 $ U_0 \( eta + v \) = v . $ <eq:freepotentialidentity>]

Choose $chi : bb(R)^3 arrow.r \[ 0 \, 1 \]$ smooth, equal to one when $\| z - x \|_oo lt.eq R \/ 2$ and zero when $\| z - x \|_oo gt.eq R$, with first and second derivatives bounded by $C \/ R$ and $C \/ R^2$. Use its restriction to sites as a slot-uniform multiplier. The full trial vector is

#[#set math.equation(numbering: n => "(5.5)")
 $ h = c chi \( eta + v \) \, $ <eq:trialvector>]

and the same symbol denotes its restriction to the cut holes. It vanishes on every killed cut slot and satisfies $h \( i \) = 1$. Moreover $p_s \( z \) lt.eq p_s \( 0 \)$, by the Fourier representation, so $0 lt.eq h lt.eq 1$.

=== 5.2 Forward and reverse profiles <forward-and-reverse-profiles>

Put $g = c \( eta + v \)$ on the full slot lattice. The forward and reverse profiles, before restriction to holes, are

#[#set math.equation(numbering: n => "(5.6)")
 $ a_s & = chi T_s g quad \( 0 lt.eq s < beta \) \, & a_beta & = chi J T_beta g \,\
b_0 & = chi g \, #h(2em) b_(0 +) = chi J g \, & b_s & = chi T_s J g quad \( 0 < s lt.eq beta \) . $ <eq:forwardprofile>]

Here $s$ is elapsed time in the indicated direction. The forward traversal contains the seam at its end. The reverse traversal contains it at its beginning, with $b_0$ its incoming value and $b_(0 +)$ its outgoing value. Each traversal includes the seam exactly once. At every slice, the same symbols also denote the restrictions to the holes on the specified side of any instantaneous operation; “full profile values” will always refer to the formulas before restriction.

Multiplication by $chi$ commutes with $J$. Thus the full profiles undergo the ideal seam operation, and (5.4) gives the endpoint identities

#[#set math.equation(numbering: n => "(5.7)")
 $ a_0 = b_0 = h \, #h(2em) a_beta = b_beta = h - c eta . $ <eq:profileendpoints>]

The smooth part of either profile is the contribution of $c v$; the point part is the contribution of $c eta$. This decomposition also applies to full profile values.

For $r_z = \| z - x \|_oo$ and $d gt.eq 1$, introduce

#[#set math.equation(numbering: n => "(5.8)")
 $ G \( z \) & = beta^(- 1) \( D_(*) + r_z \)^(- 1) \, #h(2em) W \( z \) = beta^(- 1) \( D_(*) + r_z \)^(- 2) \,\
P_d \( z \) & = d^(- 3) \( 1 + r_z \/ d \)^(- 12) \, #h(2em) W_d \( z \) = d^(- 4) \( 1 + r_z \/ d \)^(- 12) . $ <eq:weights>]

For a slot function $u$, a bounded-distance difference at $z$ means $u \( z \, a \) - u \( z' \, a' \)$ with $\| z - z' \|_oo$ at most a fixed constant; the constants below may depend on that constant. This includes differences between two slots at the same site.

#thm([Lemma 5.1.])[
  (Bounds for the free profiles).  #emph[For fixed $S$ and all sufficiently large $beta$, the following bounds hold uniformly in the direction, elapsed time, site, and slot. For the full smooth profile $u_s$, its absolute value, bounded-distance differences, and open-interval time derivative are bounded, respectively, by 
#[#set math.equation(numbering: n => "(5.9)")
 $ C G \( z \) \, #h(2em) C W \( z \) \, #h(2em) C W \( z \) \/ D_(*) . $ <eq:smoothbounds>]

 For the full point profile $w_s$, put $d = sqrt(1 + s)$. The corresponding bounds are 
#[#set math.equation(numbering: n => "(5.10)")
 $ C P_d \( z \) \, #h(2em) C W_d \( z \) \, #h(2em) C W_d \( z \) \/ d . $ <eq:pointbounds>]

 The smooth profile is slot-uniform and does not change at the seam. The slot differences and seam changes of the point profile satisfy the difference bound in (5.10). For each fixed $a > 0$, when $s gt.eq a beta$ the bounds (5.9) also hold for $w_s$, with a constant depending on $a$.]
] <lem:freebounds>

#proof[
  We first record the heat-kernel estimates before applying the cutoff. For every fixed integer $m gt.eq 0$ and $j = 0 \, 1 \, 2$, Fourier inversion gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ \| nabla^j p_t \( z \) \| lt.eq C_(m \, j) \( 1 + t \)^(- \( 3 + j \) \/ 2) (1 + frac(\| z \|_oo, sqrt(1 + t)))^(- m) . $ <eq:heatderivative>]
  Here $j$ nearest-neighbor differences may be taken in arbitrary coordinate directions. One time derivative satisfies the same bound with $j = 2$. To verify the estimates, write $omega \( k \) = 2 S sum_j \( 1 - cos k_j \)$ and use $omega \( k \) gt.eq c_S \| k \|^2$ on $\[ - pi \, pi \]^3$. A $j$-fold difference inserts a multiplier vanishing to order $j$ at zero; a time derivative inserts $- omega$, which vanishes to order two. The integral without frequency differentiation is thus $O \( \( 1 + t \)^(- \( 3 + j \) \/ 2) \)$. For the spatial weight, integrate by parts $m$ times in a coordinate for which $\| z_j \| = \| z \|_oo$. The integral of the absolute value of the differentiated multiplier is at most $C_(m \, j) \( 1 + t \)^(\( m - 3 - j \) \/ 2)$: near zero this follows by rescaling $k$ by $\( 1 + t \)^(- 1 \/ 2)$, using $nabla omega = O \( \| k \| \)$ and bounded higher derivatives; away from zero the exponential dominates every power of $t$. The periodic integrands have no boundary terms. Combining this bound with the bound without integration by parts proves (5.11). The case $0 lt.eq t lt.eq 1$ follows from uniform bounds on the same derivatives.
  The slot-uniform part of the smooth evolution is a sum of site kernels at times $n beta + s$, $n gt.eq 1$. For $j = 0 \, 1 \, 2$, choose $m > j + 1$ in (5.11). Splitting the time sum at $n beta + s$ of order $r_z^2$, or comparing it with its integral on dyadic intervals, gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(n gt.eq 1) \( n beta + s \)^(- \( 3 + j \) \/ 2) (1 + r_z / sqrt(n beta + s))^(- m) lt.eq C / beta \( D_(*) + r_z \)^(- 1 - j) . $ <eq:heatsum>]
  For completeness, when $r_z lt.eq D_(*)$ the sum without its spatial factor is $O \( beta^(- \( 3 + j \) \/ 2) \)$. When $r_z > D_(*)$, the terms with $n beta + s gt.eq r_z^2$ sum to $C beta^(- 1) r_z^(- 1 - j)$. For the remaining terms, use the bound $\( 1 + r_z \/ sqrt(t) \)^(- m) lt.eq \( sqrt(t) \/ r_z \)^m$ and sum $t^(\( m - 3 - j \) \/ 2)$ up to $r_z^2$; the same bound results. This proves (5.12) and the asserted pointwise convergence of $v$. It gives the value and difference estimates in (5.9); for time derivatives use
  $ beta^(- 1) \( D_(*) + r_z \)^(- 3) lt.eq W \( z \) \/ D_(*) . $
  For the point part, (5.11) gives (5.10) with $m = 12$. Formula (5.2) adds only a site-supported slot deviation decaying as $e^(- 3 ell s)$. This deviation, its spatial differences, and its time derivative satisfy the same bounds, with constants depending on $S$. In the reverse direction the initial seam removes that deviation; at a seam its change is bounded by the incoming absolute value of the slot deviation and hence by $C W_d \( z \)$. The smooth part is unchanged because it is slot-uniform.
  It remains to justify multiplication by $chi$. Value and time derivative estimates are preserved. In a spatial difference the extra term contains a difference of $chi$, supported where $r_z$ is of order $R$. There $G \( z \) \/ R lt.eq C W \( z \)$, and $P_d \( z \) \/ R lt.eq C W_d \( z \)$ since $d lt.eq sqrt(1 + beta) lt.double R$. Thus the difference estimates are preserved as well. Finally, if $s gt.eq a beta$, then $d$ is comparable with $D_(*)$; direct comparison of the envelopes gives $P_d lt.eq C_a G$, $W_d lt.eq C_a W$, and $W_d \/ d lt.eq C_a W \/ D_(*)$. This proves the last assertion. ◻
]

At the source site, the free potential therefore recovers the ideal density exactly. Fourier inversion and monotone convergence give

#[#set math.equation(numbering: n => "(5.13)")
 $ ell v \( x \) = sum_(n gt.eq 1) p_(n beta) \( 0 \) & = integral_(\[ - pi \, pi \]^3) frac(d^3 k, \( 2 pi \)^3) sum_(n gt.eq 1) e^(- 2 n beta S sum_j \( 1 - cos k_j \))\
 & = n_S^(upright("sw")) \( beta \) . $ <eq:freeidealdensity>]

The integral is finite in dimension three, also as a consequence of the heat-kernel sum in (5.12).

The uncut potential need not be square summable. Its evolutions above are defined pointwise by the convergent positive series, while the trial vector and every restricted profile used in a finite cube have finite support. Equation (5.13) identifies $v \( x \)$ with the target in Proposition 5. It remains to bound the change of return capacity when the ideal period is replaced by the walk among holes. Define $mu_(+) \, mu_(-)$ from this $h$ and $c$ by (3.2). Section 6 realizes these residuals as propagated local errors of the profiles.

== 6 Comparison sources and their cancellation <sec:sources>

We now express the errors of the trial potential as sources in the actual heat equation. The key fact is a conservation identity: along an isolated obstacle, the signed source is an endpoint difference of the profile, up to its cutoff commutator. Its size is therefore controlled by the obstacle’s displacement, although the total variation of the source counts every jump. We establish this identity before using it to estimate either the scalar or the energy pairing.

Throughout this section we impose the interiority and absence of pins over $B_(50 R_(*)) \( x \)$ required in Section 5. Constants are uniform in the finite cube, the allowed pin set, and the injection slot. The two traversals and their profiles are those defined there: $a_s$ is the forward profile and $b_s$ is the reverse profile, each indexed by its own elapsed time $s in \[ 0 \, beta \]$. Profiles are evaluated on the full slot lattice before restriction to the current holes.

=== 6.1 Sources on intervals and at operations <sources-on-intervals-and-at-operations>

Fix one of the two directions and write $phi_s$ for its profile. On an open interval containing no instantaneous operation, let $cal(L)_s^(upright("act"))$ be the generator on the holes, with the prescribed killing. The continuous source is the vector

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(L)_s^(upright("act")) \( phi_s \|_(H_s) \) - \( partial_s phi_s \) \|_(H_s) . $ <eq:continuous-source>]

Here $H_s$ denotes the hole set on the slice. At an instantaneous transition $K : bb(R)^(H_(-)) arrow.r bb(R)^(H_(+))$, the atomic source, on the outgoing slice, is

#[#set math.equation(numbering: n => "(6.2)")
 $ K \( phi_(-) \|_(H_(-)) \) - phi_(+) \|_(H_(+)) . $ <eq:atomic-source>]

In reverse time these are the transposed maps, in reverse order. Thus a reverse atomic source lies before the operation when viewed in forward time.

Write $s^(+)$ and $s^(-)$ for these collections of continuous densities and atomic vectors in the forward and reverse traversals. Integrating against a collection will mean a Lebesgue integral of its continuous part plus the sum over its atoms. Every source is supported above $B_(R + 2) \( x \)$. There are no pins of $E$ or boundary slots in this region, so killing creates no additional source there.

There are two types of source. The first is the cutoff commutator, defined on the full lattice by

#[#set math.equation(numbering: n => "(6.3)")
 $ gamma_s = cal(L) phi_s - partial_s phi_s \, #h(2em) b_(*) := beta^(- 1) R^(- 3) . $ <eq:backgroundsource>]

The uncut profile solves the free heat equation. Consequently $gamma_s$ is supported where $R \/ 3 lt.eq r_z lt.eq 2 R$, and

#[#set math.equation(numbering: n => "(6.4)")
 $ \| gamma_s \( z \, a \) \| lt.eq C b_(*) . $ <eq:backgroundbound>]

These assertions hold separately for the smooth part and the point part of either profile. Indeed the commutator of $cal(L)$ with $chi$ consists of a cutoff second difference times a profile value, and products of first differences. On this annulus, Lemma 14 gives values at most $C \/ \( beta R \)$ and first differences at most $C \/ \( beta R^2 \)$, uniformly in elapsed time. The bounds on the cutoff derivatives prove (6.4). There is no cutoff atom at the seam, because the sitewise cutoff commutes with both full-profile seam averaging and restriction within a site.

The remaining sources come from obstacles. A removed edge from a hole $j$ to an obstacle $k$ contributes

#[#set math.equation(numbering: n => "(6.5)")
 $ 1 / 2 \( phi_s \( j \) - phi_s \( k \) \) quad upright("at the hole ") j . $ <eq:removed-edge-source>]

If an obstacle moves from $k$ to a hole $j$, the hole moves from $j$ to $k$. The source on this arriving hole is

#[#set math.equation(numbering: n => "(6.6)")
 $ phi_s \( j \) - phi_s \( k \) . $ <eq:transport-source>]

Exchanges between two obstacles create no source. At a seam the source is the difference between the actual average on the remaining hole slots and the full-profile average, restricted to the outgoing holes. It vanishes at sites with no obstacles.

Assign a removed-edge source to its obstacle and a transport source to the obstacle responsible for the transport. Assign seam sources at a site to its obstacle strands, in any fixed manner. If a strand is isolated, it is the only obstacle there and receives the entire seam source at that site. These assignments can be made either in a block or in a bin, with strands enumerated at its initial slice in the direction being used. On $cal(G)$, tracing a strand back from a source site in $B_(R + 2) \( x \)$ uses at most $C L$ steps in its block, by Proposition 10. Thus every strand contributing a nonzero source starts in $B_(4 R) \( x \)$, for large $beta$. All subsequent strand sums are restricted to this ball.

=== 6.2 Conservation along an isolated strand <conservation-along-an-isolated-strand>

#thm([Lemma 6.1.])[
  (Signed source identity).  #emph[Fix a good picture in $cal(G)$ and one directed block $I = \[ u \, v \]$. Let $Z_s$ be an isolated obstacle strand starting above $B_(4 R) \( x \)$ on this block, with its specified sides at operations. For either profile part, the total signed mass of the assigned obstacle sources, obtained by summing over source slots and integrating in time, is 
#[#set math.equation(numbering: n => "(6.7)")
 $ phi_v \( Z_v \) - phi_u \( Z_u \) + integral_u^v gamma_s \( Z_s \) thin d s . $ <eq:signedsource>]

 The endpoint values include any seam assigned to the block. The same formula holds in reverse elapsed time.]
] <lem:signedsource>

#proof[
  At every smooth time, all neighboring slots of $Z_s$ are holes, by isolation. Summing (6.5) over these slots therefore gives
  $ 1 / 2 sum_(j tilde.op Z_s) \( phi_s \( j \) - phi_s \( Z_s \) \) = \( cal(L) phi_s \) \( Z_s \) = \( partial_s phi_s \) \( Z_s \) + gamma_s \( Z_s \) . $
  The transport contribution (6.6) is exactly the profile increment along each jump of $Z_s$.
  It remains to check the seam, where the two hole sets can differ. At the strand’s site let $H_(-) \, H_(+)$ be the incoming and outgoing holes, and let $Z_(-) \, Z_(+)$ be the corresponding obstacle slots. The actual hole map preserves the sum over holes. The full-profile seam preserves the sum over all slots. Since the obstacle is the only one at this site, the total seam source is exactly
  $ sum_(H_(+)) \( K phi_(-) - phi_(+) \) & = sum_(H_(-)) phi_(-) - sum_(H_(+)) phi_(+)\
 & = phi_(+) \( Z_(+) \) - phi_(-) \( Z_(-) \) . $
  Thus it also supplies the increment along the obstacle strand. Integrating the time derivatives and summing all increments telescopes to (6.7). Reverse traversal has the same conservation of counting sums and uses the inverse transport, so this proof applies with reverse elapsed time as well. ◻
]

We next turn this identity into bounds that retain both the signed mass and the total variation. Keeping the two quantities separate is essential: total variation controls propagation and localization, whereas the smaller signed mass controls long spatial scales.

#thm([Lemma 6.2.])[
  (Block source bounds).  #emph[On a picture in $cal(G)$, let a strand start above $z in B_(4 R) \( x \)$ in a directed block of length between $L$ and $2 L$. For the smooth profile part, take $cal(W) = W$. For a point-profile part, suppose that $d = sqrt(1 + s)$ is comparable throughout the block and $inf d gt.eq L$, and take $cal(W) = W_d$ at its starting elapsed time. Then the obstacle sources assigned to this strand are supported within distance $C L$ of $z$ and have total variation at most 
#[#set math.equation(numbering: n => "(6.8)")
 $ C L cal(W) \( z \) . $ <eq:blocksourcevariation>]

 If the strand is isolated, their signed sum has absolute value at most 
#[#set math.equation(numbering: n => "(6.9)")
 $ C L^(3 \/ 4) cal(W) \( z \) . $ <eq:blocksourcecancellation>]

 Both assertions also hold with $cal(W) = W$ for the point profile on blocks in the second half of elapsed time, and for the sum of that part and the smooth part, after changing the constant.]
] <lem:cancellation>

#proof[
  The step bounds in Proposition 10 keep the strand and its adjacent source sites within $C L$ of its starting site. The weights $W$ are comparable throughout this region, because $L lt.double D_(*)$. The stated hypotheses give the same comparability for $W_d$. Each strand has bounded degree, contributes for at most $2 L$ units of continuous time, and makes at most $C L$ jumps. The difference bounds of Lemma 14, together with (6.5) and (6.6), give (6.8). At a seam, fixed slot multiplicity bounds the number of terms, and the difference of the two averages is bounded by the slot-difference bound. This adds at most $C cal(W) \( z \)$.
  For an isolated strand use Lemma 15. Its endpoint displacement is at most $C L^(3 \/ 4)$. The spatial endpoint difference therefore costs at most $C L^(3 \/ 4) W \( z \)$ in the smooth case. Time variation costs $C L W \( z \) \/ D_(*)$, and a seam increment costs at most $C W \( z \)$. On the cutoff annulus, $b_(*) lt.eq C W \( z \) \/ D_(*)$, so the integral in (6.7) has the same time bound. Since $1 + L \/ D_(*) lt.eq C L^(3 \/ 4)$, this proves (6.9) for the smooth part.
  For the point part the time derivative is bounded by $C W_d \/ d$. On the cutoff annulus its commutator is bounded by
  $ C #scale(x: 120%, y: 120%)[\(] W_d \/ R + P_d \/ R^2 #scale(x: 120%, y: 120%)[\)] lt.eq C W_d \/ d \, $
  because $d lt.eq sqrt(1 + beta) lt.double R$. The same endpoint argument gives $C \[ L^(3 \/ 4) + 1 + L \/ d \] W_d \( z \)$, which proves the stated bound. Finally Lemma 14 bounds the point part by the smooth envelopes when $s gt.eq beta \/ 2$. Addition proves the last assertion; the division at $beta \/ 2$ is a block endpoint. ◻
]

Near elapsed time zero, $W_d$ varies too quickly to use block cancellation. The bins of length between $1$ and $3$ provide the following uniform replacement. We write $H_beta = C \( 1 + log beta \)^C$ for a fixed power of a logarithm; the constants, and hence this power, may be enlarged at subsequent uses.

#thm([Lemma 6.3.])[
  (Bin source bounds).  #emph[On a picture in $cal(G)$, the obstacle sources assigned to one strand in one directed bin, starting above $z in B_(4 R) \( x \)$ at elapsed time $s$, have total variation at most 
#[#set math.equation(numbering: n => "(6.10)")
 $ H_beta #scale(x: 120%, y: 120%)[\(] W \( z \) + W_d \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) d = sqrt(1 + s) . $ <eq:binsourcevariation>]

 The two profile parts separately satisfy this bound with their own weight. Their source sites lie within $C log beta$ of $z$.]
] <lem:sourcebins>

#proof[
  Proposition 10 bounds both displacement and the number of jumps in a bin by $C log beta$. Continuous contributions have bounded time length. Within a bin, $1 + s$ changes by a bounded factor, while a spatial shift of $C log beta$ changes any of the polynomial envelopes in Lemma 14 by at most a fixed power of $1 + log beta$. The formulas for removed edges, transports, and seam averaging now give the result. ◻
]

There are at most $C R^3$ possible starting slots in each bin and $C beta$ bins, while $W + W_d lt.eq C$. Including the background, the total variation of either complete source collection on $cal(G)$ is therefore at most $C H_beta beta R^3$. In particular, multiplying a rapidly small propagation error by one or two such total variations still gives a rapidly small error.

=== 6.3 Propagation and the two-source identity <propagation-and-the-two-source-identity>

Let $T_(v \, u)$ denote actual forward propagation between specified slices, including exactly the operations lying between them. Reverse propagation is the adjoint with the ordered endpoints. Propagate every source from its insertion slice to its terminal cut in its own direction. The resulting signed masses are precisely the residuals defined in Section 3:

#[#set math.equation(numbering: n => "(6.11)")
 $ mu_(+) = integral T_(beta \, s) thin s^(+) \( d s \) = U h - h + c eta \, #h(2em) mu_(-) = integral T_(beta \, s)^(upright("rev")) thin s^(-) \( d s \) = U^(*) h - h + c eta . $ <eq:residualdefinition>]

For example, on a smooth interval the difference between the actual mass and the profile satisfies the actual heat equation with forcing (6.1). At an operation it is multiplied by the actual map and then receives (6.2). Telescoping from the initial profile $h$ to the terminal profile $h - c eta$ proves (6.11).

For a scalar pairing it is useful to make this substitution twice. Read the reverse profile at forward physical time $t$ by writing $macron(b)_t = b_(beta - t)$, always on the specified side of an operation. In particular it is evaluated on the outgoing slice when paired with a forward source.

#thm([Lemma 6.4.])[
  (Two-source Duhamel identity).  #emph[For the comparison sources just defined, 
#[#set math.equation(numbering: n => "(6.12)")
 $ chevron.l mu_(+) \, h chevron.r = integral chevron.l s^(+) \( d s \) \, macron(b)_s chevron.r + integral.double_(s prec t) chevron.l T_(t \, s) s^(+) \( d s \) \, s^(-) \( d t \) chevron.r . $ <eq:doubledduhamel>]

 In the second integral the reverse sources are indexed by forward physical time. The order $s prec t$ means that the forward insertion slice lies before the reverse insertion slice. Thus $T_(t \, s)$ runs from after the first operation to before the later operation when both sources are atomic. There is no term pairing the forward and reverse sources of the same operation.]
] <lem:duhamel>

#proof[
  Here is the exact telescoping calculation for instantaneous factors; it also fixes the endpoint convention in the integrals. Let $K_j : V_(j - 1) arrow.r V_j$, $1 lt.eq j lt.eq n$, be the chronological factors between counting spaces, and write $a_j \, b_j$ for comparison values at those slices, with $a_0 = b_n = h$. In this calculation $b_j$ is indexed in forward order. Put
  $ p_j = K_j a_(j - 1) - a_j \, #h(2em) q_j = K_j^(*) b_j - b_(j - 1) \, #h(2em) P_(r \, l) = K_r dots.h.c K_(l + 1) . $
  The forward error is $sum_j P_(n \, j) p_j$. Reverse telescoping gives
  $ P_(n \, j)^(*) h = b_j + sum_(k > j) P_(k - 1 \, j)^(*) q_k . $
  Their pairing is consequently
  $ sum_j chevron.l p_j \, b_j chevron.r + sum_(j < k) chevron.l P_(k - 1 \, j) p_j \, q_k chevron.r . $
  The indices $j < k$ express that $p_j$ is inserted after its factor, whereas $q_j$ is inserted before that factor. On each intervening smooth interval the variation-of-constants formula gives the same identity with time integrals. Composing these formulas with the finite telescoping calculation proves (6.12). Two continuous source measures have no diagonal mass; atomic terms retain the strict slice order above. In particular the forward terminal seam source pairs directly with $h$ in the first sum. The reverse seam source lies before that operation and pairs only with earlier forward sources, through kernels ending before the seam. No kernel in this pairing crosses that seam twice. ◻
]

== 7 The scalar error at the trial potential <sec:scalar>

The first error in the capacity comparison is the pairing of the propagated source with the trial potential itself. We estimate it using Lemma 18. Its first term benefits from signed cancellation on isolated strands. Its second term contains two sources, and heat-kernel decay and spatial localization make their joint contribution smaller. All expectations below use the actual pin law $bb(P)_P$.

#thm([Proposition 7.1.])[
  (Scalar estimate).  #emph[With the scales of (4.8), under the interiority and pin assumptions of Section 5, 
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E)_P #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(G)) \| chevron.l mu_(+) \, h chevron.r \| #scale(x: 120%, y: 120%)[\]] = o \( beta^(- 5 \/ 2) \) . $ <eq:scalarclaim>]

 The error is uniform in the finite cube, the deterministic pin set, and the injection slot.]
] <prop:scalar>

=== 7.1 A single source paired with the free profile <a-single-source-paired-with-the-free-profile>

For forward time $s$ put

$ d = sqrt(1 + s) \, #h(2em) d' = sqrt(1 + beta - s) . $

The reverse profile $macron(b)_s$ has value bound $C \( G + P_(d') \)$. The basic weight integral is

#[#set math.equation(numbering: n => "(7.2)")
 $ integral_0^beta sum_(r_z lt.eq 4 R) \( W + W_d \) \( z \) \( G + P_(d') \) \( z \) thin d s lt.eq C beta^(- 1) \( 1 + log beta \) . $ <eq:scalarweightintegral>]

To verify it, first sum the smooth product by radial shells:

$ sum_(r_z lt.eq 4 R) W \( z \) G \( z \) lt.eq C beta^(- 2) (1 + integral_0^(4 R) frac(r^2 thin d r, \( D_(*) + r \)^3)) lt.eq C beta^(- 2) \( 1 + log beta \) . $

For $s lt.eq beta \/ 2$, Lemma 14 gives $P_(d') lt.eq C G$, and

$ sum_z W_d \( z \) G \( z \) lt.eq sup G sum_z W_d \( z \) lt.eq C beta^(- 3 \/ 2) d^(- 1) . $

Integration over this half-period costs at most $C beta^(- 1)$. For $s gt.eq beta \/ 2$, use $W_d lt.eq C W$ and $sum_z P_(d') \( z \) lt.eq C$, so the remaining product costs at most $C sup W = C beta^(- 2)$ per unit time. This proves (7.2).

Consider first the blocks contained in $\[ beta^(1 \/ 4) \, beta - beta^(1 \/ 4) \]$. On each such block $d \, d' gt.eq beta^(1 \/ 8)$ and their weights are comparable over the block and over distances $C L$. At a deterministic initial slice, Proposition 8 bounds the probability of an obstacle at a prescribed slot by $C lambda$. If it is not isolated, a second distinct obstacle lies within $c_2 L$, whence the same proposition and a union bound give

#[#set math.equation(numbering: n => "(7.3)")
 $ bb(P)_P \( upright("the prescribed slot is an obstacle and is not isolated") \) lt.eq C L^3 lambda^2 . $ <eq:nonisolatedprobability>]

Here and below fixed slot multiplicities are included in constants.

For a nonisolated strand starting over $z$, the total variation bound in Lemma 16 bounds its scalar contribution by

$ C L \( W + W_d \) \( z \) \( G + P_(d') \) \( z \) . $

For an isolated strand subtract from the testing profile $macron(b)$ its value at the strand’s initial site and time, at any one slot. The constant value pairs with the signed source, whose bound is $C L^(3 \/ 4) \( W + W_d \) \( z \)$. The remaining variation of the testing profile is at most

#[#set math.equation(numbering: n => "(7.4)")
 $ C L \( W + W_(d') \) \( z \) lt.eq C L beta^(- 1 \/ 8) \( G + P_(d') \) \( z \) . $ <eq:profilevariation>]

Spatial variation follows from the difference bounds over distance $C L$; time variation over the block follows from the time derivative bounds. The last inequality uses $W lt.eq G \/ D_(*)$ and $W_(d') = P_(d') \/ d'$.

Take expectations, use (7.3), and sum the blocks. Their lengths are comparable to $L$, so their weight sums are bounded by $L^(- 1)$ times (7.2). The contribution of all these blocks is at most

#[#set math.equation(numbering: n => "(7.5)")
 $ C beta^(- 1) \( 1 + log beta \) [L^3 lambda^2 + lambda #scale(x: 120%, y: 120%)[\(] L^(- 1 \/ 4) + L beta^(- 1 \/ 8) #scale(x: 120%, y: 120%)[\)]] = o \( beta^(- 5 \/ 2) \) . $ <eq:centralfirstterm>]

The three powers of $beta$ are respectively $- 4 + 3 delta$, $- 5 \/ 2 - delta \/ 4$, and $- 21 \/ 8 + delta$. The middle term is the one for which signed cancellation is needed.

The remaining blocks lie within $2 beta^(1 \/ 4)$ of an endpoint, for large $beta$, because $L lt.double beta^(1 \/ 4)$. Use the bin total variation bound from Lemma 17, without cancellation. Weights at times and sites within a bin change by at most $H_beta$, so the expected contribution is bounded by $H_beta lambda$ times the integral in (7.2) restricted to these endpoint intervals. On the first interval the preceding estimates give

$ C [beta^(1 \/ 4) beta^(- 2) \( 1 + log beta \) + beta^(- 3 \/ 2) integral_0^(2 beta^(1 \/ 4)) \( 1 + s \)^(- 1 \/ 2) thin d s] lt.eq C [beta^(- 7 \/ 4) \( 1 + log beta \) + beta^(- 11 \/ 8)] . $

The last interval costs at most $C beta^(- 7 \/ 4) \( 1 + log beta \)$. Multiplication by $H_beta lambda$ gives powers at most $- 23 \/ 8$ and $- 13 \/ 4$, both strictly below $- 5 \/ 2$.

The cutoff background is estimated separately. On its annulus the reverse profile has size at most $C \/ \( beta R \)$, so

#[#set math.equation(numbering: n => "(7.6)")
 $ lr(|integral chevron.l gamma_s \|_(H_s) \, macron(b)_s chevron.r thin d s|) lt.eq C beta R^3 b_(*) frac(1, beta R) = frac(C, beta R) = o \( beta^(- 5 \/ 2) \) . $ <eq:scalarbackground>]

We have therefore bounded the first term of (6.12). It remains to control the interaction between its two source collections.

=== 7.2 Snapshot moments for spatial boxes <snapshot-moments-for-spatial-boxes>

The source locations at two different times are correlated. The following consequence of the snapshot estimate controls their pairing without an independence assumption.

#thm([Lemma 7.2.])[
  (Box moment bound).  #emph[Partition the sites into cubes $Q$ of side comparable to $F gt.eq 1$. At any deterministic slice let $cal(O)$ be its obstacle slots, and let $w$ be a nonnegative deterministic site weight of finite support. With slot multiplicity in the sums, set $A_Q = sum_(\( z \, a \) in cal(O) \, med z in Q) w \( z \)$. Then 
#[#set math.equation(numbering: n => "(7.7)")
 $ (bb(E)_P sum_Q A_Q^2)^(1 \/ 2) lt.eq C [sqrt(lambda) thin parallel w parallel_2 + lambda {sum_Q (sum_(z in Q) w \( z \))^2}^(1 \/ 2)] . $ <eq:boxmoment>]

 If two such sums are taken at different deterministic slices, the expected sum of products over pairs of anchors at distance at most $C F$ is bounded by a constant times the product of their respective right sides in (7.7).]
] <lem:boxmoment>

#proof[
  Expand $sum_Q A_Q^2$. Terms using the same slot are bounded by $C lambda parallel w parallel_2^2$ by Proposition 8. Terms using two distinct slots, including two slots at the same site, are bounded by $C lambda^2 sum_Q \( sum_(z in Q) w \( z \) \)^2$. Taking a square root proves (7.7). At a seam the same bound holds on either side: each $A_Q$ depends only on the number of obstacle slots at each site, and these numbers are preserved by the seam.
  Distance at most $C F$ restricts the two anchors to cubes whose indices differ by one of a bounded number of offsets. For each offset, Cauchy–Schwarz in the product of the picture probability space and the cube index set gives
  $ bb(E)_P sum_Q A_Q A'_(Q + v) lt.eq (bb(E)_P sum_Q A_Q^2)^(1 \/ 2) (bb(E)_P sum_Q \( A'_Q \)^2)^(1 \/ 2) . $
  Sum the bounded number of offsets. Both factors use their own snapshot estimate, so no joint law at the two times is required. ◻
]

In the applications, the weights are restricted to the deterministic anchor region $B_(4 R) \( x \)$. We bound their norms by the corresponding unrestricted envelopes. For these weights, denote the resulting bounds by

#[#set math.equation(numbering: n => "(7.8)")
 $ J \( d \) & = C #scale(x: 120%, y: 120%)[\(] beta^(- 3 \/ 4) d^(- 5 \/ 2) + beta^(- 3 \/ 2) d^(- 1) #scale(x: 120%, y: 120%)[\)] \, &  & w = W_d \,\
B \( F \) & = C #scale(x: 120%, y: 120%)[\(] beta^(- 2) + beta^(- 5 \/ 2) F #scale(x: 120%, y: 120%)[\)] \, &  & w = W . $ <eq:JB>]

To check the first line, direct shell sums give $parallel W_d parallel_2 lt.eq C d^(- 5 \/ 2)$ and $parallel W_d parallel_1 lt.eq C d^(- 1)$; the square root of the squared box sums is no greater than the total weight. For the second line, $parallel W parallel_2 lt.eq C beta^(- 1) D_(*)^(- 1 \/ 2)$. It remains to bound the squared box sums by $C beta^(- 2) F^2$. Use the larger envelope $C beta^(- 1) \( 1 + r_z \)^(- 2)$. The bounded number of cubes within distance $C F$ of $x$ each have weight sum at most $C F \/ beta$. At distance comparable to $n F$, each cube has weight at most $C beta^(- 1) F n^(- 2)$ and there are $O \( n^2 \)$ cubes in such a shell. Summing their squares over $n gt.eq 1$ gives $C beta^(- 2) F^2 sum_(n gt.eq 1) n^(- 2)$, as claimed.

The time sum of $J$ over the bins of either traversal satisfies

#[#set math.equation(numbering: n => "(7.9)")
 $ sum_(upright("bins")) J #scale(x: 120%, y: 120%)[\(] sqrt(1 + s_(upright("bin"))) #scale(x: 120%, y: 120%)[\)] lt.eq C beta^(- 3 \/ 4) . $ <eq:Jsum>]

Indeed the bin lengths are bounded above and below, so $sum \( 1 + s_(upright("bin")) \)^(- 5 \/ 4) lt.eq C$ and $sum \( 1 + s_(upright("bin")) \)^(- 1 \/ 2) lt.eq C sqrt(beta)$. The latter gives $C beta^(- 1)$, which is smaller than the right side of (7.9).

=== 7.3 Two sources separated in time <two-sources-separated-in-time>

First remove interactions involving cutoff background. Counting mass and supremum contractions of the actual kernels imply that two background sources cost at most

$ C beta^2 b_(*)^2 R^3 = C R^(- 3) . $

For one background source, integrate its time variable and use its supremum bound. The resulting cost is at most $C beta b_(*)$ times the total variation of the other, obstacle, source collection. Lemmas 17 and 20, or simply the one-point snapshot bound, give

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)_P [upright(bold(1))_(cal(G)) integral parallel s_(upright("obs"))^plus.minus parallel_1] lt.eq H_beta lambda \( R + sqrt(beta) \) . $ <eq:expectedsourcevariation>]

For the smooth weight, use $sum_(r_z lt.eq 4 R) W \( z \) lt.eq C beta^(- 1) R$ and $O \( beta \)$ bins. For the point weight use $sum_z W_d \( z \) lt.eq C \/ d$ and sum in time. Thus all terms with background are $o \( beta^(- 5 \/ 2) \)$.

We can now assume both sources are obstacle sources. Group their bin pairs by dyadic scales $T in { 1 \, 2 \, 4 \, dots.h }$, up to a constant times $beta$, according to $1 + t - s asymp T$. The scale $T = 1$ also includes a bounded number of neighboring and identical bins. Equivalently one may group by bin indices; the bin length bounds preserve comparability away from this first scale. For a fixed bin there are $O \( T \)$ partner bins at scale $T$.

First replace each intervening propagator by its version killed on exiting $B_(R_(*)) \( x \)$. Every source starts in $B_(R + 2) \( x \)$, so Lemma 12 bounds the discarded mass by a rapidly small quantity, uniformly on $cal(G)$. The source supports and total variations are bounded by fixed powers of $beta$, by (6.4) and Lemma 17; hence the aggregate loss in the double pairing is still rapidly small. Lemma 11 now bounds each entry of the killed kernel by $C T^(- 3 \/ 2)$. The displacement assertion in Lemma 12 further permits us, with another rapidly small aggregate error, to retain only anchor sites at distance at most

#[#set math.equation(numbering: n => "(7.11)")
 $ F = F \( T \) := C \( 1 + T \/ L \) L^(3 \/ 4) . $ <eq:scalarinteractionradius>]

The $C log beta$ shifts from the bin anchors to insertion sites are absorbed by $L^(3 \/ 4)$.

Apply Lemma 20 with boxes of side comparable to $F \( T \)$. The two bin total variations contribute only $H_beta$ times their anchor weights. We treat the three possible weight products in turn.

===== 7.3.1 Two smooth weights. <two-smooth-weights.>

There are $O \( beta \)$ first bins and $O \( T \)$ partners per first bin. Their contribution at scale $T$ is at most

#[#set math.equation(numbering: n => "(7.12)")
 $ H_beta beta T^(- 1 \/ 2) B \( F \)^2 lt.eq H_beta [beta^(- 3) T^(- 1 \/ 2) + beta^(- 4) T^(- 1 \/ 2) F^2] . $ <eq:WWscale>]

Since $F^2 lt.eq C \( L^(3 \/ 2) + T^2 L^(- 1 \/ 2) \)$, the dyadic sum is at most

#[#set math.equation(numbering: n => "(7.13)")
 $ H_beta [beta^(- 3) + beta^(- 4) L^(3 \/ 2) + beta^(- 5 \/ 2) L^(- 1 \/ 2)] = o \( beta^(- 5 \/ 2) \) . $ <eq:WWsum>]

Here $sum_T T^(- 1 \/ 2) lt.eq C$ and $sum_(T lt.eq C beta) T^(3 \/ 2) lt.eq C beta^(3 \/ 2)$. The final term explains why a displacement bound smaller than $T$ is needed in (7.11).

===== 7.3.2 One smooth and one point weight. <one-smooth-and-one-point-weight.>

Sum the point weight over its own elapsed-time bins using (7.9); each such bin has $O \( T \)$ smooth partners. The scale-$T$ bound is

$ H_beta T^(- 1 \/ 2) B \( F \) beta^(- 3 \/ 4) . $

Inserting (7.8) and (7.11), and summing dyadically, gives at most

#[#set math.equation(numbering: n => "(7.14)")
 $ H_beta [beta^(- 11 \/ 4) + beta^(- 13 \/ 4) L^(3 \/ 4) + beta^(- 11 \/ 4) L^(- 1 \/ 4)] = o \( beta^(- 5 \/ 2) \) . $ <eq:WPsum>]

This time the growing sum is $sum_(T lt.eq C beta) T^(1 \/ 2) lt.eq C sqrt(beta)$. The calculation applies whichever direction supplies the point weight, because (7.9) holds in either elapsed-time order.

===== 7.3.3 Two point weights. <two-point-weights.>

When $t - s lt.eq beta \/ 2$, their elapsed profile times satisfy

$ s + \( beta - t \) = beta - \( t - s \) gt.eq beta \/ 2 . $

At least one is therefore at least $beta \/ 4$, and its point weight is bounded by $C W$ by Lemma 14. These pairs are already covered by (7.14). The remaining pairs have separation comparable to $beta$. Use the entry bound $C beta^(- 3 \/ 2)$ and the unrestricted two snapshot pairing from Lemma 20, with a single box containing the source support. Summing both time variables by (7.9) costs at most

#[#set math.equation(numbering: n => "(7.15)")
 $ H_beta beta^(- 3 \/ 2) (sum_(upright("bins")) J \( d \))^2 lt.eq H_beta beta^(- 3) . $ <eq:PPsum>]

This finishes the estimate of the second term in (6.12). To conclude, the smallest power gains in the entire scalar calculation are $L^(- 1 \/ 4) = beta^(- delta \/ 4)$ in (7.5), $beta^(- delta \/ 4)$ in (7.6), and $L^(- 1 \/ 2) = beta^(- delta \/ 2)$ in (7.13). Each dominates every fixed logarithmic power because $delta = 1 \/ 200 > 0$. All other displayed terms have larger power margins. Taking the expected absolute value in Lemma 18 proves Proposition 19.

== 8 Residuals in the dual energy norm <sec:energy>

We now bound the two residuals from Lemma 18 against an arbitrary test vector, using the one-period energy of that vector. The scalar estimate of Section 7 is not sufficient for this purpose: the test vector need not resemble the free potential. Instead, we represent propagated sources as divergences of flows and pair those flows with the gradient of the propagated test vector. For a group of sources associated with one obstacle strand, we first route the signed mass to a nearby slot. Only the resulting net mass must then be sent to infinity. The cancellation in Lemma 16 reduces this second cost.

#thm([Proposition 8.1.])[
  (Dual energy estimate).  #emph[Fix $S$, and use the scales in (4.8). Suppose that $B_(50 R_(*)) \( x \)$ lies in the interior of the finite cube and that no point of $E$ lies above this ball. Let $cal(G)$ be the good event of Proposition 10, and let $mu_(+) \, mu_(-)$ be the terminal residuals in (6.11). There are nonnegative measurable functions $X_(+) \, X_(-)$ of the exposure and a deterministic rapidly small function $rho \( beta \)$ such that, on $cal(G)$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ \| chevron.l mu_d \, y chevron.r \| lt.eq X_d sqrt(e_y) + C_0 rho \( beta \) \, #h(2em) d in { + \, - } \, $ <eq:dualenergy>]

 for every real cut vector $y$ that vanishes on the cut killing slots and satisfies $lr(bar.v.double y bar.v.double)_oo lt.eq C_0$. The functions $X_d$ do not depend on $y$ or $C_0$, and 
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(E)_P #h(-0.16667em) [upright(bold(1))_(cal(G)) \( X_(+)^2 + X_(-)^2 \)] = o \( beta^(- 5 \/ 2) \) . $ <eq:dualenergyexpectation>]

 All estimates are uniform over the finite cubes, deterministic pin sets, and injection slots satisfying the stated assumptions.]
] <prop:dualenergy>

We work in one direction at a time, writing $U_d = U$ for the forward direction and $U_d = U^(*)$ for the reverse direction. Time in the following argument is elapsed time in this chosen traversal; all instantaneous operations retain the ordering fixed in Sections 2 and 6. Write $T_(t \, s)$ for its propagator from $s$ to $t$, and extend this notation periodically when $t > beta$.

For a terminal vector $y$, the adjoint suffix $Y \( t \) = T_(beta \, t)^(*) y$ satisfies, by Lemma 4,

#[#set math.equation(numbering: n => "(8.3)")
 $ integral_0^beta cal(D)_t \( Y \( t \) \) thin d t lt.eq e_y \, #h(2em) lr(bar.v.double y - U_d^(*) y bar.v.double)_2^2 lt.eq 2 e_y \, #h(2em) lr(bar.v.double Y \( t \) bar.v.double)_oo lt.eq C_0 . $ <eq:energy-suffix>]

These bounds hold for signed vectors. In particular, they require neither a reversible one-period kernel nor time-reversal invariance of the exposure law.

At a fixed slice, a finite-energy flow $J$ with divergence $nu$ gives

#[#set math.equation(numbering: n => "(8.4)")
 $ \| chevron.l nu \, Y chevron.r \| = lr(|sum_e J \( e \) #scale(x: 120%, y: 120%)[\(] Y \( e^(-) \) - Y \( e^(+) \) #scale(x: 120%, y: 120%)[\)]|) lt.eq #scale(x: 120%, y: 120%)[\(] 2 lr(bar.v.double J bar.v.double)_2^2 cal(D)_t \( Y \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <eq:flowpairing-energy>]

Here $Y$ is extended by zero on the killed inner boundary and outside the cube. It has finite support, so summation by parts has no term at infinity, and boundary-crossing edges are already included in $cal(D)_t$. Nonzero total mass is allowed: the flows in Lemma 13 carry that mass to infinity on the extended available-slot graph. This is the same flow-pairing principle as in [12] Section 3.3; the block cancellation below provides the additional saving needed here.

=== 8.1 Flows for the sources of one block <flows-for-the-sources-of-one-block>

Divide the sources in the chosen direction into two collections. The first contains all cutoff sources, all obstacle sources from the smooth potential, and the point-profile obstacle sources whose elapsed times lie in $\[ beta \/ 2 \, beta \]$. The second contains the remaining point-profile obstacle sources, at elapsed times in $\[ 0 \, beta \/ 2 \)$. We begin with the first collection. Its obstacle sources satisfy the block bounds of Lemma 16 with envelope $W$, and its cutoff sources have size at most $C b_(*)$ per slot and unit time, where

$ b_(*) = beta^(- 1) R^(- 3) $

is the bound in (6.3). Since $beta \/ 2$ is a block division, no block is truncated when the late point-profile sources are included.

Let $I_1 \, dots.h \, I_n$ be the consecutive blocks in this direction, with lengths between $L$ and $2 L$. Thus $n lt.eq C beta \/ L$. For each block $I_j$, let $cal(A)_j$ be the obstacle slots at its starting slice whose sites lie in $B_(4 R) \( x \)$, and use the same index for the strand starting at such a slot. Denote its starting site by $z_alpha$. Set

$ theta_alpha = cases(delim: "{", L^(- 1 \/ 4) \, & upright("if this strand is isolated in ") I_j \,, 1 \, & upright("otherwise") \,) #h(2em) Q_j = sum_(alpha in cal(A)_j) W \( z_alpha \)^2 \, $

and

$ C_j = sum_(alpha \, alpha' in cal(A)_j) frac(theta_alpha theta_(alpha') W \( z_alpha \) W \( z_(alpha') \), 1 + \| z_alpha - z_(alpha') \|_oo) . $

These are finite snapshot sums, with slot multiplicities retained.

#thm([Lemma 8.2.])[
  (One-block flow bound).  #emph[For the first collection of sources, fix a block $I_j$ on $cal(G)$. Propagate its sources to a fully regular slice $t$ of $I_(j + 1)$, interpreting $I_(n + 1) = beta + I_1$ in a copy of the period. Their propagated signed mass differs in counting $ell^1$ norm by a rapidly small amount from a localized mass $nu_j \( t \)$, supported in $B_(6 R) \( x \)$, which is the divergence of a flow of squared norm at most 
#[#set math.equation(numbering: n => "(8.5)")
 $ F_j = C (L^6 Q_j + L^2 C_j + L^2 b_(*)^2 R^5) . $ <eq:blockflowbound>]

 The constant and the localization error are uniform in $j$ and $t$. Moreover, 
#[#set math.equation(numbering: n => "(8.6)")
 $ bb(E)_P \[ upright(bold(1))_(cal(G)) F_j \] lt.eq C #scale(x: 120%, y: 120%)[\[] & L^6 lambda beta^(- 2) D_(*)^(- 1) + L^2 \( L^(- 1 \/ 2) lambda^2 + L^3 lambda^3 \) beta^(- 2) R + L^2 b_(*)^2 R^5 #scale(x: 120%, y: 120%)[\]] . $ <eq:blockflowexpectation>]

 If the sources of the final block are propagated only to the terminal cut, their mass differs by a rapidly small amount in $ell^1$ from a mass $m_(upright("loc"))$ satisfying 
#[#set math.equation(numbering: n => "(8.7)")
 $ lr(bar.v.double m_(upright("loc")) bar.v.double)_2^2 lt.eq K_n := C L^5 \( Q_n + b_(*)^2 R^3 \) . $ <eq:lastblocknorm>]

]
] <lem:blockflow>

#proof[
  Every obstacle source in the block is associated with a strand starting within $B_(4 R) \( x \)$. Sources of that strand are within $C L$ of its start, and have total variation at most $C L W \( z_alpha \)$. Lemma 12 permits their propagation to the next block to be killed outside a larger ball of radius $C L$ about $z_alpha$, at a rapidly small relative loss of total variation. Apply this restriction separately to each strand. Apply the same restriction about each injection site to the cutoff sources. The elapsed propagation time is at most $4 L$, also for the final block continued into the copied period.
  These balls lie in the unpinned interior. Up to the first exit from its chosen ball, the propagation conserves counting mass: the local heat evolution, hole transports, and seam averages all do so, and there is no pin killing there. The localized propagation loses mass only at that exit. Its signed net mass therefore differs from the signed sum of the injected sources by at most their total variation times the rapidly small exit probability. All source variations and the number of injection sites are polynomially bounded in $beta$ on $cal(G)$. Their aggregate loss is consequently rapidly small, uniformly in the volume and in the averaging slice.
  Fix a fully regular averaging slice. For each $alpha$, choose one available representative slot $a_alpha$ within a bounded distance of $z_alpha$. Proposition 7 provides this slot and paths from every slot carrying the localized mass to $a_alpha$, of length and displacement at most $C L$. Erase loops from these paths. Routing a signed mass along them produces a flow whose divergence is that mass minus its net mass at $a_alpha$. Its norm is at most the total variation times the largest path norm, hence its squared norm is bounded by
  $ C L #scale(x: 120%, y: 120%)[\(] L W \( z_alpha \) #scale(x: 120%, y: 120%)[\)]^2 = C L^3 W \( z_alpha \)^2 . $
  At a given edge, only strands starting within $C L$ can contribute. There are at most $C L^3$ such starting slots, by deterministic counting and fixed slot multiplicity. Cauchy–Schwarz on each edge therefore bounds the squared norm of the sum of these local flows by
  #[#set math.equation(numbering: n => "(8.8)")
   $ C L^6 Q_j . $ <eq:blocklocalflow>]
  Let $q_alpha$ be the remaining net mass at $a_alpha$. The cancellation in Lemma 16, and the preceding conservation observation, give
  $ \| q_alpha \| lt.eq C L theta_alpha W \( z_alpha \) . $
  Indeed the error from localization is rapidly small relative to $L W \( z_alpha \)$, so for an isolated strand it is absorbed into $C L^(3 \/ 4) W \( z_alpha \)$. Send $q_alpha$ to infinity along the unit flow from $a_alpha$. Bounded displacement of these representatives preserves the inverse-distance overlap estimate in Lemma 13, up to a constant. The squared norm of the resulting sum of flows is thus at most
  #[#set math.equation(numbering: n => "(8.9)")
   $ C sum_(alpha \, alpha') frac(\| q_alpha q_(alpha') \|, 1 + \| z_alpha - z_(alpha') \|_oo) lt.eq C L^2 C_j . $ <eq:blocknetflow>]
  This is the only part of the obstacle flow that carries mass over arbitrarily large distances, and it is the part on which isolated-strand cancellation saves a factor $L^(- 1 \/ 2)$ after squaring.
  For the cutoff sources, each injection site contributes total variation at most $C L b_(*)$ in the block. Send their localized descendants directly to infinity using Lemma 13. If two injection sites are within $C L$, use the constant overlap bound. There are at most $C R^3 L^3$ such ordered pairs. For sites farther apart, the descendants are still separated by a constant multiple of their starting distance, after increasing the threshold $C L$. The inverse-distance sum over a ball of radius $C R$ is $C R^5$. Their total squared flow norm is at most
  #[#set math.equation(numbering: n => "(8.10)")
   $ C L^2 b_(*)^2 \( R^3 L^3 + R^5 \) lt.eq C L^2 b_(*)^2 R^5 . $ <eq:blockcutoffflow>]
  Adding the three flows and using the squared triangle inequality proves (8.5). Every source of these flows is within $B_(6 R) \( x \)$, since $L = o \( R \)$.
  We next average the bound over the exposure. Radial shells give
  #[#set math.equation(numbering: n => "(8.11)")
   $ sum_(\| z - x \|_oo lt.eq 4 R) W \( z \)^2 lt.eq C beta^(- 2) D_(*)^(- 1) \, #h(2em) sum_(\| z - x \|_oo \, \| z' - x \|_oo lt.eq 4 R) frac(W \( z \) W \( z' \), 1 + \| z - z' \|_oo) lt.eq C beta^(- 2) R . $ <eq:weightenergysums>]
  For the second estimate one may enlarge $W \( z \)$ to $beta^(- 1) \( 1 + \| z - x \|_oo \)^(- 2)$. Two comparable dyadic shells of radius $b$ contribute at most $C beta^(- 2) b$: for each site in one shell, the inverse-distance sum over the other is at most $C b^2$. Shells of radii $c lt.eq b \/ 2$ contribute at most $C beta^(- 2) c$. Summing first over $c$ and then over the dyadic values of $b lt.eq C R$ proves the estimate without a logarithmic factor.
  Proposition 8 bounds the expectation of $Q_j$ by $C lambda sum W^2$. To estimate $C_j$, first take pairs whose starting sites are at distance at most $C_1 L$, where $C_1$ is a sufficiently large fixed constant compared with the isolation radius. Charge only one obstacle, with probability $C lambda$, and allow $C L^3$ possible second slots. The envelope $W$ is comparable at these distances because $L = o \( D_(*) \)$. This portion of $L^2 C_j$ is bounded in expectation by
  $ C L^5 lambda sum W^2 \, $
  which is absorbed into the $L^6$ term in (8.6).
  For a more distant pair, the two starting slots are distinct. If both are isolated, their occupation probability is at most $C lambda^2$, and $theta_alpha theta_(alpha') = L^(- 1 \/ 2)$. If at least one is not isolated, a third distinct obstacle slot must lie within distance $c_2 L$ of that member. The separation ensures that this third slot is different from the other member of the pair. A union bound over its $C L^3$ possible positions and the three-point snapshot bound give probability at most $C L^3 lambda^3$. Applying (8.11) proves (8.6). Only one-time snapshot probabilities have been used; no independence between strands or between blocks is needed.
  Finally, at the terminal cut, the localized mass from one strand has $ell^2$ norm at most its variation $C L W \( z_alpha \)$. The mass from one cutoff injection site has norm at most $C L b_(*)$. Their supports have overlap at most $C L^3$. Cauchy–Schwarz at each slot proves (8.7). The displayed bounds use measurable finite snapshot sums; choosing the flows measurably is unnecessary. ◻
]

=== 8.2 Averaging over the next block <averaging-over-the-next-block>

The flow bound controls a block at any fully regular slice of its successor. We now use these choices of slice to share a single Dirichlet energy budget among the blocks. The final block requires a separate step, because its successor lies beyond the terminal cut.

Let $m_j$ be the terminal mass produced by the first collection of sources in $I_j$. For $j < n$, at a slice $t in I_(j + 1)$ the block pairing is the propagated source mass paired with $Y \( t \) = T_(beta \, t)^(*) y$. Lemma 22 and (8.4) therefore apply directly. For the final block, put $m = m_n$ and use the exact identity

#[#set math.equation(numbering: n => "(8.12)")
 $ chevron.l m \, y chevron.r = chevron.l m \, y - U_d^(*) y chevron.r + chevron.l m \, U_d^(*) y chevron.r . $ <eq:lastblockcopy>]

The second term equals $chevron.l U_d m \, y chevron.r$. It is represented by continuing the source mass through a copy of the period, with terminal test vector $y$ at time $2 beta$. At its averaging slice $t in beta + I_1$, the test vector is consequently $T_(2 beta \, t)^(*) y$. The localized norm bound and (8.3) control the first term:

#[#set math.equation(numbering: n => "(8.13)")
 $ \| chevron.l m \, y - U_d^(*) y chevron.r \| lt.eq sqrt(2 K_n e_y) + C_0 rho \( beta \) . $ <eq:lastblockcorrection>]

The localization error here is estimated in $ell^1$, using $lr(bar.v.double y - U_d^(*) y bar.v.double)_oo lt.eq 2 C_0$. Figure 2 shows the ordinary averaging windows and the window used for this continued final block.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.17, 0.675), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.585, 0.3375), [#text(size: 9pt)[$I_1$]])
  rect((2.25, 0), (3.42, 0.675), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.835, 0.3375), [#text(size: 9pt)[$I_j$]])
  rect((3.42, 0), (4.59, 0.675), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.005, 0.3375), [#text(size: 9pt)[$I_(j+1)$]])
  rect((5.76, 0), (6.93, 0.675), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.345, 0.3375), [#text(size: 9pt)[$I_n$]])
  content((1.71, 0.3375), [#text(size: 9pt)[$dots.h$]])
  content((5.175, 0.3375), [#text(size: 9pt)[$dots.h$]])
  rect((6.93, 0), (8.55, 0.675), fill: rgb("#e8f0f0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.74, 0.3375), [#text(size: 9pt)[$I_1+ beta$]])
  content((9.045, 0.3375), [#text(size: 9pt)[$dots.h$]])
  line((-0.225, -0.225), (9.585, -0.225), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9.585, -0.225), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.18), (0, -0.27), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.27), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((6.93, -0.18), (6.93, -0.27), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.93, -0.27), [#text(size: 9pt)[$beta$]], anchor: "north", padding: 0.1176cm)
  line((6.93, -0.045), (6.93, 1.89), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  bezier((2.835, 0.81), (4.005, 0.81), (2.991, 1.239), (3.849, 1.239), stroke: (paint: rgb("#196c69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#196c69"))))
  content((3.42, 1.71), [#text(fill: rgb("#196c69"))[#text(size: 9pt)[propagate, then average#linebreak()on regular slices]]])
  bezier((6.345, 0.81), (7.74, 0.81), (6.531, 1.321), (7.554, 1.321), stroke: (paint: rgb("#196c69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#196c69"))))
  content((7.65, 2.295), [#text(fill: rgb("#196c69"))[#text(size: 9pt)[continue through#linebreak()the next period]]])
  content((4.59, -1.17), [#text(size: 9pt)[$chevron.l m,y chevron.r = chevron.l m,y-U_d^*y chevron.r + chevron.l U_"dm",y chevron.r$]])
})],
  caption: [Figure 2: Averaging the source mass from one block in the next block. The last block uses the first block of a copied period. The displayed identity separates the pairing of its terminal mass $m$ into a term controlled by contraction energy and a term whose propagation can be split at the copied averaging slices. The averaging windows are disjoint modulo one period, so their Dirichlet energies are summed with a constant total cost. Block widths are schematic. ],
) <fig:period-averaging>

For each $j$, average over the fully regular subset of its successor block. Proposition 10 gives this subset measure at least $c L$. Applying Cauchy–Schwarz in that time variable bounds its averaged localized pairing by

#[#set math.equation(numbering: n => "(8.14)")
 $ C sqrt(F_j \/ L) (integral_(I_(j + 1)) cal(D)_t \( Y_j \( t \) \) thin d t)^(1 \/ 2) \, $ <eq:blockaverage>]

where $Y_j \( t \) = T_(beta \, t)^(*) y$ for $j < n$, whereas $Y_n \( t \) = T_(2 beta \, t)^(*) y$ and $I_(n + 1) = beta + I_1$. The intervals $I_2 \, dots.h \, I_n$ are disjoint in the original period, and $beta + I_1$ lies in the copied period. Each full period has the bound (8.3), so

$ sum_(j = 1)^n integral_(I_(j + 1)) cal(D)_t \( Y_j \( t \) \) thin d t lt.eq 2 e_y . $

Cauchy–Schwarz across the block indices in (8.14), followed by (8.13), gives

#[#set math.equation(numbering: n => "(8.15)")
 $ lr(|sum_(j = 1)^n chevron.l m_j \, y chevron.r|) lt.eq C (sum_(j = 1)^n F_j \/ L + K_n)^(1 \/ 2) sqrt(e_y) + C_0 rho \( beta \) . $ <eq:smoothdualcoefficient>]

The sum of localization errors is still rapidly small because $n lt.eq C beta \/ L$.

The expectation of the first term in parentheses is bounded by $C beta \/ L^2$ times the right side of (8.6). Substituting $lambda = beta^(- 3 \/ 2)$, $D_(*) = sqrt(beta)$, and $b_(*) = beta^(- 1) R^(- 3)$, this is

#[#set math.equation(numbering: n => "(8.16)")
 $ C [L^4 beta^(- 3) + L^(- 1 \/ 2) beta^(- 4) R + L^3 beta^(- 11 \/ 2) R + frac(1, beta R)] . $ <eq:smoothdualexpectation>]

Likewise, (8.7) and the one-point snapshot bound give

#[#set math.equation(numbering: n => "(8.17)")
 $ bb(E)_P \[ upright(bold(1))_(cal(G)) K_n \] lt.eq C (L^5 beta^(- 4) + L^5 beta^(- 2) R^(- 3)) . $ <eq:copycorrectionexpectation>]

Thus the block argument has converted cancellation of source mass into a dual energy bound. It remains to handle the early point-profile sources, for which cancellation at the scale $L$ was not used.

=== 8.3 Early point-profile sources <early-point-profile-sources>

#thm([Lemma 8.3.])[
  (Diffusion of the early sources).  #emph[Let $mu_d^(upright("early"))$ be the terminal mass of the point-profile obstacle sources at elapsed times in $\[ 0 \, beta \/ 2 \)$, and let $M$ be their total variation before propagation. Then 
#[#set math.equation(numbering: n => "(8.18)")
 $ bb(E)_P \[ upright(bold(1))_(cal(G)) M^2 \] lt.eq H_beta beta^(- 3 \/ 2) . $ <eq:earlymassmoment>]

 For every test vector of Proposition 21, on $cal(G)$, 
#[#set math.equation(numbering: n => "(8.19)")
 $ \| chevron.l mu_d^(upright("early")) \, y chevron.r \| lt.eq C M beta^(- 3 \/ 4) sqrt(e_y) + C_0 rho \( beta \) . $ <eq:earlydualbound>]

]
] <lem:earlysourceenergy>

#proof[
  For a bin beginning at elapsed time $s$, put $d_s = sqrt(1 + s)$. Lemma 17 bounds its source variation on $cal(G)$ by $H_beta sum_alpha W_(d_s) \( z_alpha \)$, where the sum is over the obstacle slots above $B_(4 R) \( x \)$ at that bin’s starting slice. The single-box case of Lemma 20 gives
  $ ∥sum_alpha W_(d_s) \( z_alpha \)∥_(L^2 \( bb(P)_P \)) & lt.eq C (sqrt(lambda) thin lr(bar.v.double W_(d_s) bar.v.double)_2 + lambda lr(bar.v.double W_(d_s) bar.v.double)_1)\
 & lt.eq C (beta^(- 3 \/ 4) d_s^(- 5 \/ 2) + beta^(- 3 \/ 2) d_s^(- 1)) = J \( d_s \) . $
  Minkowski’s inequality in the probability space now gives
  $ parallel upright(bold(1))_(cal(G)) M parallel_(L^2 \( bb(P)_P \)) lt.eq H_beta sum_(upright("bins")) J \( d_s \) lt.eq H_beta beta^(- 3 \/ 4) . $
  For the last inequality, bins have lengths between $1$ and $3$, so the sum of $d_s^(- 5 \/ 2) = \( 1 + s \)^(- 5 \/ 4)$ is bounded and the sum of $d_s^(- 1) = \( 1 + s \)^(- 1 \/ 2)$ is at most $C sqrt(beta)$. Absorbing the square of a logarithmic factor into $H_beta$ proves (8.18). This use of Minkowski requires no independence of the bin snapshots.
  Propagate all these sources to a slice in a block contained in the last quarter of the traversal. Every propagation has elapsed time at least $beta \/ 4$. Localize to $B_(6 R) \( x \)$; by Lemma 12, the discarded total variation is rapidly small on $cal(G)$. Lemma 11 and substochasticity show that a localized unit point mass has total mass at most one and maximum entry at most $C beta^(- 3 \/ 2)$. The additional spatial restriction only decreases the kernel. Consequently the localized signed source mass $nu_t$ is dominated in absolute value by a nonnegative mass $sigma_t$ such that
  $ lr(bar.v.double sigma_t bar.v.double)_1 lt.eq M \, #h(2em) lr(bar.v.double sigma_t bar.v.double)_oo lt.eq C M beta^(- 3 \/ 2) . $
  At a fully regular such slice, use the unit flows of Lemma 13. For every slot $a$, splitting distances at $D_(*)$ gives
  $ sum_(a') frac(sigma_t \( a' \), 1 + "dist" \( a \, a' \)) & lt.eq C M beta^(- 3 \/ 2) D_(*)^2 + C M D_(*)^(- 1)\
 & lt.eq C M beta^(- 1 \/ 2) . $
  Superposing the unit flows with coefficients $nu_t \( a \)$ therefore gives a flow with divergence $nu_t$ and squared norm at most
  $ C sum_(a \, a') frac(sigma_t \( a \) sigma_t \( a' \), 1 + "dist" \( a \, a' \)) lt.eq C M^2 beta^(- 1 \/ 2) . $
  There are blocks of total length at least $c beta$ contained in the last quarter, and at least half of each is fully regular. Average (8.4) over this regular set. Cauchy–Schwarz in time and (8.3) give (8.19). ◻
]

#proof[
  The two collections exhaust the sources in the chosen direction. Combine (8.15) and (8.19), and choose a measurable coefficient with
  $ X_d^2 lt.eq C (sum_(j = 1)^n F_j \/ L + K_n + M^2 beta^(- 3 \/ 2)) . $
  All expressions on the right are measurable functions of the exposure; none depends on the test vector. Equations (8.16), (8.17), and (8.18) bound its expectation on $cal(G)$. With $L = beta^delta$ and $R = beta^(3 \/ 2 + delta \/ 4)$, their sum is at most
  #[#set math.equation(numbering: n => "(8.20)")
   $ C [beta^(- 3 + 4 delta) + beta^(- 5 \/ 2 - delta \/ 4) + beta^(- 4 + 13 delta \/ 4) + beta^(- 4 + 5 delta) + beta^(- 13 \/ 2 + 17 delta \/ 4) + H_beta beta^(- 3)] = o \( beta^(- 5 \/ 2) \) \, $ <eq:energyfinalpowers>]
  since $delta = 1 \/ 200$. The term $beta^(- 5 \/ 2 - delta \/ 4)$ covers both the isolated net-mass flows and the cutoff flows. All localization errors were estimated in $ell^1$ against test vectors of supremum norm at most a constant times $C_0$, so they give the uniform rapidly small remainder in (8.1). The argument used elapsed time and the ordered kernels throughout; it applies to $U$ and to $U^(*)$ with the same bounds. Adding the two expected squares proves (8.2). ◻
]

== 9 From the pinned comparison to magnetization <sec:pressure>

We first combine the two residual estimates to prove the uniform pinned comparison. We then express a positive field as a mixture of deterministic pin sets. Integrating the finite-volume magnetization bounds in the field will preserve the required order: volume tends to infinity before the field tends to zero.

=== 9.1 Completion of the capacity comparison <completion-of-the-capacity-comparison>

#proof[
  Fix the cube, pins, and starting slot in the proposition, and expose the cycles under $bb(P)_P$, $P = E union { i }$. Use the trial vector $h$ and constant $c$ from (5.5) and (5.3). On the good event $cal(G)$ of Proposition 10, Proposition 21, applied with a fixed supremum bound $2$, gives a measurable $X$ such that
  $ \| chevron.l mu_d \, z chevron.r \| lt.eq X sqrt(e_z) + epsilon_beta \, #h(2em) d = + \, - \, $
  for vectors vanishing on killed cut slots with $lr(bar.v.double z bar.v.double)_oo lt.eq 2$, where $epsilon_beta$ is rapidly small and
  $ bb(E)_P \[ upright(bold(1))_(cal(G)) X^2 \] = o \( beta^(- 5 \/ 2) \) . $
  If the two directions initially give different coefficients, take their maximum; this preserves the displayed expectation bound. The source identities (6.11) identify these residuals with those in (3.2). Since $0 lt.eq h lt.eq 1$, the averaged capacity criterion (3.6) applies. Proposition 19 and the probability estimate in Proposition 10 give
  #[#set math.equation(numbering: n => "(9.1)")
   $ r := bb(E)_P q_i = 1 - c + o \( beta^(- 5 \/ 2) \) . $ <eq:returncomparison>]
  Every error here is uniform over the cube and the allowed pin sets. In particular, the good-event estimate is used only through its probability on the complement; there $q_i in \[ 0 \, 1 \]$ suffices.
  By Lemma 14, $v \( x \) = O \( beta^(- 3 \/ 2) \)$, so
  $ 1 - c = frac(v \( x \), 1 + v \( x \)) = v \( x \) + O \( beta^(- 3) \) . $
  The exact pin identity (2.2) now yields
  #[#set math.equation(numbering: n => "(9.2)")
   $ d_E \( i \) = frac(r, 1 + r) = v \( x \) + o \( beta^(- 5 \/ 2) \) = 1 / ell sum_(n gt.eq 1) p_(n beta) \( 0 \) + o \( beta^(- 5 \/ 2) \) . $ <eq:slotcomparison>]
  Indeed $r = O \( beta^(- 3 \/ 2) \)$, so the second rational transformation also costs only $O \( beta^(- 3) \)$. By (5.13), the last sum is $n_S^(upright("sw")) \( beta \)$. The uniform little-oh in (9.2) is equivalent to the asserted function $epsilon_S \( beta \) arrow.r 0$ after choosing a sufficiently large $beta_0 \( S \)$. Equations (9.1) and (5.13), together with $1 - c = v \( x \) + O \( beta^(- 3) \)$, also give $r = ell^(- 1) n_S^(upright("sw")) \( beta \) + o \( beta^(- 5 \/ 2) \)$, as asserted. ◻
]

=== 9.2 Boundary pins and field pins <boundary-pins-and-field-pins>

Write $V_N = \| Lambda_N \|$, use $partial Lambda_N = partial_(upright("in")) Lambda_N$ for the inner boundary, and let $q_(Lambda_N)$ be the number of slot edges. For a picture $omega$, let $cal(C) \( omega \)$ be its cycles and $a_C$ the number of time-zero slots on $C$. For colors $sigma_C in { - 1 \, 1 }$, define

$ M \( omega \, sigma \) = 1 / 2 sum_C a_C sigma_C \, #h(2em) N_arrow.b \( omega \, sigma \) = sum_(C : thin sigma_C = - 1) a_C = S V_N - M \( omega \, sigma \) . $

Let $chi_D \( omega \, sigma \)$ indicate that every cycle meeting $D$ is up. The spin-loop representation in Proposition 3 identifies the ordinary partition function with

$ Z_N \( t \) = e^(beta q_(Lambda_N) \/ 4) bb(E)_(upright(b)) sum_sigma e^(beta t M \( omega \, sigma \)) \, #h(2em) p_N \( t \) = frac(log Z_N \( t \), beta V_N) . $

Its boundary-pinned counterpart and pressure are

#[#set math.equation(numbering: n => "(9.3)")
 $ Z_N^(+) \( t \) = e^(beta q_(Lambda_N) \/ 4) bb(E)_(upright(b)) sum_sigma chi_(D_0) \( omega \, sigma \) e^(beta t M \( omega \, sigma \)) \, #h(2em) p_N^(+) \( t \) = frac(log Z_N^(+) \( t \), beta V_N) . $ <eq:pinnedpressure>]

We use the surface estimate of [12] Proposition 7.1. Its argument is short and records why all-times boundary pins do not change the pressure.

#thm([Lemma 9.1.])[
  (Surface cost of boundary pins).  #emph[For every finite $beta > 0$, every $t gt.eq 0$, and every finite cube, 
#[#set math.equation(numbering: n => "(9.4)")
 $ 0 lt.eq p_N \( t \) - p_N^(+) \( t \) lt.eq \( log 2 \) (ell / beta + 24 ell^2) frac(\| partial Lambda_N \|, V_N) . $ <eq:surfacecost>]

 In particular $p_N^(+) \( t \) arrow.r p_(S \, beta) \( t \)$ for each fixed $beta > 0$ and $t gt.eq 0$.]
] <lem:surfacecost>

#proof[
  After extracting the all-up factor, the field-tilted picture weight is
  $ W_t \( omega \) = product_C \( 1 + e^(- beta t a_C) \) . $
  Let $bb(E)_t$ denote expectation under this tilted picture law. Given the picture, each cycle is up independently with probability $\( 1 + e^(- beta t a_C) \)^(- 1) gt.eq 1 \/ 2$. If $b_0$ counts cycles meeting $D_0$, Jensen’s inequality therefore gives
  $ 1 gt.eq frac(Z_N^(+) \( t \), Z_N \( t \)) gt.eq bb(E)_t 2^(- b_0) gt.eq exp \[ - \( log 2 \) bb(E)_t b_0 \] . $
  Let $J_partial$ count marks on slot edges incident to a boundary site, and let $q_partial$ be the number of those edges. Every boundary-meeting cycle either has a boundary slot at time zero or passes through one of these marks. A mark belongs to at most two cycles, so
  $ b_0 lt.eq ell \| partial Lambda_N \| + 2 J_partial \, #h(2em) q_partial lt.eq 6 ell^2 \| partial Lambda_N \| . $
  Insertion of one mark joins two cycles or splits one. Each factor of $W_t$ lies in $\[ 1 \, 2 \]$, and at most two new factors appear, whence $W_t \( omega union { u } \) lt.eq 4 W_t \( omega \)$ for almost every inserted mark $u$. The Poisson insertion formula at rate $1 \/ 2$ implies
  $ bb(E)_t J_partial lt.eq 2 beta q_partial lt.eq 12 beta ell^2 \| partial Lambda_N \| . $
  The preceding inequalities, divided by $beta V_N$, prove (9.4). The pressure limit follows because the boundary-to-volume ratio tends to zero. ◻
]

For $t gt.eq 0$ put $b_beta \( t \) = 1 - e^(- beta t)$, and let $nu_b$ be the law that selects each time-zero slot independently with probability $b = b_beta \( t \)$. If $A$ is the selected set and $"Up" \( omega \, sigma \)$ is the set of up slots at that cut, then

#[#set math.equation(numbering: n => "(9.5)")
 $ sum_A nu_b \( A \) upright(bold(1))_({ A subset "Up" }) = \( 1 - b \)^(N_arrow.b) = e^(- beta t N_arrow.b) . $ <eq:fieldpinidentity>]

Consequently the field law in (9.3) is the picture/color marginal of the joint law

#[#set math.equation(numbering: n => "(9.6)")
 $ hat(bb(P))_(N \, t) \( d omega \, d sigma \, A \) med prop med bb(P)_(upright(b)) \( d omega \) thin nu_b \( A \) chi_(D_0 union A) \( omega \, sigma \) \, $ <eq:fieldjointlaw>]

where the color variable uses counting measure. Indeed the common factor extracted from its normalizer is $e^(beta q_(Lambda_N) \/ 4 + beta t S V_N)$. Conditional on $A$, this is exactly the zero-field color law with the deterministic pins $E = D_0 union A$.

The marginal law of $A$ is generally not Bernoulli, because its normalization is weighted by the pinned partition function. Conditioning instead on $\( omega \, sigma \)$ makes selections on up slots independent Bernoulli choices of parameter $b$, and forbids selections on down slots. Thus every specified slot $j$ satisfies

#[#set math.equation(numbering: n => "(9.7)")
 $ hat(bb(P))_(N \, t) \( j in A \) = b_beta \( t \) hat(bb(P))_(N \, t) \( j upright(" up") \) lt.eq b_beta \( t \) . $ <eq:fieldpinbound>]

This is the only property of the posterior pin law needed below.

=== 9.3 Thermodynamic and zero-field limits <thermodynamic-and-zero-field-limits>

#proof[
  Fix $S$ and a sufficiently large $beta$. The finite-volume magnetization is bounded, so differentiation under the sum in (9.3) is justified. Equations (9.6) and (9.5) give
  #[#set math.equation(numbering: n => "(9.8)")
   $ S - \( p_N^(+) \)' \( t \) = 1 / V_N hat(bb(E))_(N \, t) N_arrow.b = 1 / V_N sum_(j upright(" at time ") 0) hat(bb(E))_(N \, t) d_(D_0 union A) \( j \) . $ <eq:pressuredeficit>]
  Here $d_E \( j \)$ means the down probability also for pinned slots, where it is zero. Let $rho_N$ be the fraction of sites $x$ for which $B_(50 R_(*)) \( x \)$ is interior to $Lambda_N$. For such a site let $cal(A)_x$ be the event that no selected pin lies above that ball. A union bound using (9.7) gives
  $ hat(bb(P))_(N \, t) \( cal(A)_x^c \) lt.eq C_(S \, beta) thin b_beta \( t \) \, $
  where $C_(S \, beta)$ is finite and independent of $N$. On $cal(A)_x$, Proposition 5 applies to each of the $ell$ slots at $x$, for every conditional pin set $A$. On its complement, and at sites outside the interior region, use the boundedness of down probabilities. Summing the slot estimates in (9.8) gives
  #[#set math.equation(numbering: n => "(9.9)")
   $ \| S - \( p_N^(+) \)' \( t \) - n_S^(upright("sw")) \( beta \) \| lt.eq ell epsilon_S \( beta \) beta^(- 5 \/ 2) + C_S \( 1 - rho_N \) + C_(S \, beta) b_beta \( t \) . $ <eq:derivativecomparison>]
  Here $n_S^(upright("sw")) \( beta \)$ is bounded for the large values of $beta$ under consideration, so its contribution on exceptional sites is included in $C_S$.
  Integrate (9.9) over $t in \[ 0 \, h \]$, for $h > 0$, and divide by $h$. Now take $N arrow.r oo$, keeping $beta$ and $h$ fixed. The radius is fixed in this limit, so $rho_N arrow.r 1$, and Lemma 24 gives convergence of $p_N^(+)$ at both field endpoints. We obtain
  $ \| S - frac(p_(S \, beta) \( h \) - p_(S \, beta) \( 0 \), h) - n_S^(upright("sw")) \( beta \) \| lt.eq ell epsilon_S \( beta \) beta^(- 5 \/ 2) + C_(S \, beta) / h integral_0^h b_beta \( t \) thin d t . $
  For this fixed $beta$, the last term tends to zero as $h arrow.b 0$. Convexity and the uniform magnetization bound give the right derivative of the limiting pressure. Therefore
  $ \| S - m_S \( beta \) - n_S^(upright("sw")) \( beta \) \| lt.eq ell epsilon_S \( beta \) beta^(- 5 \/ 2) . $
  Finally let $beta arrow.r oo$. Since $S$ is fixed, multiplication by $\( beta S \)^(5 \/ 2)$ proves the theorem. ◻
]

=== 9.4 The explicit lattice correction <the-explicit-lattice-correction>

The full ideal density has a two-term expansion with a remainder small enough to identify the coefficient in Corollary 2.

#proof[
  Put $t = beta S$. Independence of the three coordinates gives
  $ p_beta \( 0 \) = I \( t \)^3 \, #h(2em) I \( t \) = frac(1, 2 pi) integral_(- pi)^pi e^(- 2 t \( 1 - cos k \)) thin d k . $
  We claim, uniformly for $t gt.eq 1$, that
  #[#set math.equation(numbering: n => "(9.10)")
   $ I \( t \) = 1 / sqrt(4 pi t) (1 + frac(1, 16 t) + O \( t^(- 2) \)) . $ <eq:laplaceexpansion>]
  To see this, set $u = sqrt(t) thin k$ and first restrict to $\| u \| lt.eq t^(1 \/ 10)$. Taylor’s formula gives
  $ 2 t \( 1 - cos \( u \/ sqrt(t) \) \) = u^2 - frac(u^4, 12 t) + O \( u^6 \/ t^2 \) \, $
  and hence, on this interval,
  $ e^(- 2 t \( 1 - cos \( u \/ sqrt(t) \) \)) = e^(- u^2) (1 + frac(u^4, 12 t) + O #h(-0.16667em) (frac(u^6 + u^8, t^2))) . $
  The bound $2 \( 1 - cos k \) gt.eq c k^2$ controls the omitted interval by $O \( e^(- c t^(1 \/ 5)) \)$ after the same rescaling. Extending the Gaussian integrals to $bb(R)$ has an error of this size as well. Since
  $ integral_(bb(R)) e^(- u^2) thin d u = sqrt(pi) \, #h(2em) integral_(bb(R)) u^4 e^(- u^2) thin d u = 3 / 4 sqrt(pi) \, $
  the formula (9.10) follows, with a constant that can be enlarged to cover all $t gt.eq 1$. Cubing gives
  $ p_beta \( 0 \) = \( 4 pi t \)^(- 3 \/ 2) (1 + frac(3, 16 t) + O \( t^(- 2) \)) . $
  Apply this uniform estimate at $n t$, $n gt.eq 1$, and sum. The remainder is bounded by $C t^(- 7 \/ 2) sum_(n gt.eq 1) n^(- 7 \/ 2)$, so
  #[#set math.equation(numbering: n => "(9.11)")
   $ n_S^(upright("sw")) \( beta \) = frac(zeta \( 3 \/ 2 \), 8 pi^(3 \/ 2)) \( beta S \)^(- 3 \/ 2) + frac(3 zeta \( 5 \/ 2 \), 128 pi^(3 \/ 2)) \( beta S \)^(- 5 \/ 2) + O \( \( beta S \)^(- 7 \/ 2) \) . $ <eq:idealdensityexpansion>]
  Theorem 1 now gives the asserted expansion of $S - m_S \( beta \)$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~Benedikter. Interaction corrections to spin-wave theory in the large-$S$ limit of the quantum Heisenberg ferromagnet. #emph[Mathematical Physics, Analysis and Geometry] #strong[20] (2017), article~5. #link("https://doi.org/10.1007/s11040-016-9237-6")[doi:10.1007/s11040-016-9237-6].]
#bibitem([2])[F.~Bloch. Zur Theorie des Ferromagnetismus. #emph[Zeitschrift für Physik] #strong[61] (1930), 206--219. #link("https://doi.org/10.1007/BF01339661")[doi:10.1007/BF01339661].]
#bibitem([3])[J.~G.~Conlon and J.~P.~Solovej. Upper bound on the free energy of the spin $1 \/ 2$ Heisenberg ferromagnet. #emph[Letters in Mathematical Physics] #strong[23] (1991), 223--231. #link("https://doi.org/10.1007/BF01885500")[doi:10.1007/BF01885500].]
#bibitem([4])[M.~Correggi, A.~Giuliani, and R.~Seiringer. Validity of the spin-wave approximation for the free energy of the Heisenberg ferromagnet. #emph[Communications in Mathematical Physics] #strong[339] (2015), 279--307. #link("https://doi.org/10.1007/s00220-015-2402-0")[doi:10.1007/s00220-015-2402-0].]
#bibitem([5])[F.~J.~Dyson. General theory of spin-wave interactions. #emph[Physical Review] #strong[102] (1956), 1217--1230. #link("https://doi.org/10.1103/PhysRev.102.1217")[doi:10.1103/PhysRev.102.1217].]
#bibitem([6])[F.~J.~Dyson. Thermodynamic behavior of an ideal ferromagnet. #emph[Physical Review] #strong[102] (1956), 1230--1244. #link("https://doi.org/10.1103/PhysRev.102.1230")[doi:10.1103/PhysRev.102.1230].]
#bibitem([7])[A.~Gaudillière and C.~Landim. A Dirichlet principle for non reversible Markov chains and some recurrence theorems. #emph[Probability Theory and Related Fields] #strong[158] (2014), 55--89. #link("https://doi.org/10.1007/s00440-012-0477-5")[doi:10.1007/s00440-012-0477-5]. Author preprint: #link("https://arxiv.org/abs/1111.2445v1")[arXiv:1111.2445v1].]
#bibitem([8])[C.~P.~Hofmann. Cubic ideal ferromagnets at low temperature and weak magnetic field. #emph[Physica B: Condensed Matter] #strong[510] (2017), 117--126. #link("https://doi.org/10.1016/j.physb.2017.01.019")[doi:10.1016/j.physb.2017.01.019].]
#bibitem([9])[T.~Holstein and H.~Primakoff. Field dependence of the intrinsic domain magnetization of a ferromagnet. #emph[Physical Review] #strong[58] (1940), 1098--1113. #link("https://doi.org/10.1103/PhysRev.58.1098")[doi:10.1103/PhysRev.58.1098].]
#bibitem([10])[B.~Nachtergaele. Quasi-state decompositions for quantum spin systems. In B.~Grigelionis et al. (eds.), #emph[Probability Theory and Mathematical Statistics], Proceedings of the Sixth Vilnius Conference, VSP/TEV, Utrecht--Tokyo--Vilnius, 1994, pp.~565--590. #link("https://arxiv.org/abs/cond-mat/9312012v2")[arXiv:cond-mat/9312012v2].]
#bibitem([11])[J.~Nash. Continuity of solutions of parabolic and elliptic equations. #emph[American Journal of Mathematics] #strong[80] (1958), 931--954. #link("https://doi.org/10.2307/2372841")[doi:10.2307/2372841].]
#bibitem([12])[OpenAI. #emph[Bloch's Law for Finite-Range Heisenberg Ferromagnets in Three Dimensions]. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Blochs-Law-for-Finite-Range-Heisenberg-Ferromagnets-in-Three-Dimensions-October-5-2026/bloch-law-heisenberg.pdf")[OAI:Blochs-Law-for-Finite-Range-Heisenberg-Ferromagnets-in-Three-Dimensions-October-5-2026], 2026.]
#bibitem([13])[OpenAI. #emph[Spontaneous magnetization in the quantum Heisenberg ferromagnet]. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026/paper.pdf")[OAI:Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026], 2026.]
#bibitem([14])[B.~Tóth. Improved lower bound on the thermodynamic pressure of the spin $1 \/ 2$ Heisenberg ferromagnet. #emph[Letters in Mathematical Physics] #strong[28] (1993), 75--84. #link("https://doi.org/10.1007/BF00739568")[doi:10.1007/BF00739568].]


