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

#align(center)[#text(size: 16pt, weight: "bold")[Universal Computation with Eventually Stationary Navier--Stokes Forcing]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction and result <sec:introduction>

Can a force that eventually stops changing continue to perform an arbitrarily long computation? We ask this for the incompressible Navier–Stokes equation with a fixed flat geometry, fixed viscosity and zero initial velocity. The observation is equally fixed: one material particle must enter a specified open region. Only the finite prescription of the force may depend on the machine and its input.

An exact real coordinate can retain an unbounded tape as a positional expansion. Moore’s generalized shifts convert local tape instructions into piecewise affine maps and relate their smooth realizations to three-dimensional flows #cite(label("Moore1990")) #cite(label("Moore1991")). A difficulty is that a tape instruction may erase information whereas a smooth flow has invertible finite-time maps. Landauer discusses retaining intermediate information to avoid this loss #cite(label("Landauer1961")) Section 3; Bennett implements reversible simulation by recording instruction indices #cite(label("Bennett1973")) Eqs. (9)–(11). Our finite recording table follows that information-retention principle. Its seven rows and full-domain inverse are proved here, rather than imported from a reversible-machine existence theorem.

Fluid versions of computational universality already exist in different geometric settings. Cardona, Miranda, Peralta-Salas and Presas obtain stationary Euler flows on an adapted Riemannian three-sphere, using an area-preserving realization of generalized shifts and a suspension #cite(label("CardonaMirandaPeraltaSalasPresas2021")). Dyhr, González-Prieto, Miranda and Peralta-Salas obtain stationary unforced Navier–Stokes universality using an adapted metric and the Hodge Laplacian #cite(label("DyhrGonzalezPrietoMirandaPeraltaSalas2026")). The geometric ancestry includes the Reeb–Beltrami correspondence of Etnyre and Ghrist #cite(label("EtnyreGhrist2000")) and the earlier higher-dimensional Euler realization in #cite(label("CardonaMirandaPeraltaSalasPresas2023")), first posted in 2019. These Euler and Hodge-viscous constructions choose the geometry and use stationary initial velocity. Here the flat metric is fixed and the fluid starts at rest. We place the machine in an external force and prove its construction directly.

Fixed-metric Euler computation also has important precedents: Cardona, Miranda and Peralta-Salas construct an unrestricted steady Euler simulation on Euclidean $bb(R)^3$ with infinite energy #cite(label("CardonaMirandaPeraltaSalas2023Beltrami")) arXiv version 3, Theorem 1. They also give a robust tape-bounded simulation on the flat three-torus, with observation restricted to the initial trajectory segment before exit from a specified compact region #cite(label("CardonaMirandaPeraltaSalas2023Beltrami")) arXiv version 3, Theorem 26. Their Remark 29 gives an unforced viscous tape-bounded version with nonzero Beltrami initial velocity. The compact forced viscous experiment here starts from rest and permits an unbounded computation.

The force identity itself is elementary: for a prescribed incompressible velocity, its material acceleration minus its viscous term is a body force. The substance of the argument is to prescribe the velocity from the finite machine table without running that machine. We first retain the history needed for an inverse. Gapped tape coordinates then give separated source rectangles and, independently, separated target rectangles. The two families may overlap. Ordered extraction to a parking region, reciprocal deformation and ordered delivery realize every branch by an area-preserving motion. A third spatial coordinate supplies the phase. A fixed ramp starts this autonomous field from rest, after which the force is stationary.

Write $bb(T) = bb(R) \/ bb(Z)$ and $x = \( X \, Y \, Z \) in bb(T)^3$. We use

#[#set math.equation(numbering: n => "(1)")
 $ partial_t u + \( u dot.op nabla \) u = - nabla p + nu Delta u + f \, #h(2em) "div" u = 0 \, #h(2em) u \( 0 \) = 0 . $ <eq:NS>]

The Laplacian is the componentwise flat Laplacian and pressure has mean zero. A classical solution has continuous $u$, $u_t$, spatial derivatives of $u$ through order two, $p$ and $nabla p$ on every closed finite time cylinder. All constructed solutions are smooth. For a particle label $a$, the material trajectory solves $dot(Phi) \( t \, a \) = u \( t \, Phi \( t \, a \) \)$, $Phi \( 0 \, a \) = a$.

An effective smooth force is supplied by a finite program that evaluates every requested mixed derivative at computably supplied space-time arguments to any prescribed rational error. It also computes the derivative bounds used below. There is no efficiency requirement, but the program must describe all branches of the mechanism; it cannot first compute the selected execution and replay it.

#thm([Theorem 1.1.])[
  (Eventually steady forcing).  #emph[Fix a positive computable viscosity $nu$. There is an effective procedure taking a deterministic Turing machine and finite input to a body force $f$ on the flat torus $bb(T)^3$, such that:]
  + #emph[$f$ is smooth on $bb(T)^3 times \[ 0 \, oo \)$, has zero spatial mean, and is independent of time for $t gt.eq 1$. Every spatial, temporal, and mixed derivative of $f$ is bounded on this entire domain.]
  + #emph[With initial velocity zero, the Navier–Stokes equation has a global smooth solution, unique in the classical class on every finite time interval. Its kinetic energy is bounded uniformly in time.]
  + #emph[For the fixed particle label and fixed open set 
$ P = \( 1 \/ 4 \, 1 \/ 4 \, 0 \) \, #h(2em) cal(O) = { \( X \, Y \, Z \) in bb(T)^3 : 1 \/ 32 < Y < 1 \/ 8 } \, $

 the material trajectory from $P$ enters $cal(O)$ at a finite time if and only if the machine halts on the input.]
  #emph[The force is specified by a finite formula which does not simulate the chosen execution. The construction is also uniform as a formula in an arbitrary positive parameter $nu$.]
] <thm:main>

For a fixed positive noncomputable $nu$, the same finite formulas and mathematical conclusions hold, with evaluation relative to that parameter. The algorithmic assertion concerns computable $nu$. The force can also be made solenoidal by the periodic Helmholtz–Leray projection; this changes the pressure, not the velocity. Theorem 1 concerns these explicitly supplied smooth solutions and is not a regularity theorem for arbitrary fluid data.

The undecidability is about exact trajectories; the theorem supplies no uniform finite-precision tolerance for the infinite encoded computation. Finite-time perturbation bounds will nevertheless be quantitative and effective. They also permit the planar construction to be used in diffusion problems where control of small neighborhoods is essential.

Section 2 gives the short analytic tools. Section 3 constructs the recording table and proves its inverse and initialization. Section 4 gives the complete planar geometry and its derivative bounds. Section 5 supplies the spatial clock and proves Theorem 1. Section 6 gives the slow temporal alternative. The periodic alternative is obtained directly from the planar field and therefore requires no loading interval.

== 2 Effective profiles and analytic realization <sec:analytic>

We will construct a smooth velocity explicitly. The three lemmas in this section explain how its finite formulas can be evaluated at cutoff endpoints and how its residual determines a unique fluid solution.

#thm([Lemma 2.1.])[
  (Flat profiles).  #emph[Put $E \( t \) = e^(- 1 \/ t)$ for $t > 0$ and $E \( t \) = 0$ for $t lt.eq 0$, and put $beta \( t \) = E \( t \) \/ \( E \( t \) + E \( 1 - t \) \)$. These functions are computably smooth. The function $beta$ is zero for $t lt.eq 0$, one for $t gt.eq 1$, and satisfies $beta \( t \) + beta \( 1 - t \) = 1$. Products of rational translates and rescalings give effective cutoffs equal to one near a prescribed rational closed box and supported in any prescribed larger open rational box. All their derivatives have effective bounds.]
] <lem:profiles>

#proof[
  On $t > 0$ the $j$th derivative of $E$ is $P_j \( 1 \/ t \) e^(- 1 \/ t)$, where the polynomial $P_j$ is generated recursively. For integers $m \, k gt.eq 0$ and $y > 0$, $y^m e^(- y) lt.eq \( m + k \) ! y^(- k)$. These estimates prove flatness and give an effective error tending to zero as $t arrow.b 0$. Away from zero, ordinary arithmetic and the exponential evaluate the derivatives. The denominator defining $beta$ is at least $e^(- 2)$, since at least one of $t \, 1 - t$ is at least $1 \/ 2$. Quotient differentiation is therefore effective even when equality with an endpoint is undecidable. For $a < b < c < d$ the product $beta \( \( t - a \) \/ \( b - a \) \) beta \( \( d - t \) \/ \( d - c \) \)$ has the required interval plateau; coordinate products give boxes. The derivative bounds follow by the product and chain rules and the preceding estimates.
  For later periodic evaluation, let $F_0$ be a smooth function on $\[ 0 \, 1 \]$ that is zero near the endpoints, extended by zero to $bb(R)$. Given a computably supplied $s in bb(R)$, compute a rational $q$ with $\| q - s \| < 1$. Its periodization and all derivatives are finite sums:
  $ F_(upright("per"))^(\( j \)) \( s \) = sum_(k = floor.l q floor.r - 2)^(ceil.l q ceil.r + 2) F_0^(\( j \)) \( s - k \) . $
  Every omitted translate is zero, since a nonzero term requires $k in \[ s - 1 \, s \]$. Floors and ceilings are taken only of the rational $q$, so no integer-part test is made on $s$. The same coordinatewise finite sum evaluates spatial periodizations of compact chart-supported fields. This supplies the finite-index bound for the periodic pulses below. ◻
]

#thm([Lemma 2.2.])[
  (Prescribed velocity and comparison).  #emph[Let $U$ be a smooth divergence-free velocity on $\[ 0 \, oo \) times bb(T)^3$ with $U \( 0 \) = 0$. Define 
#[#set math.equation(numbering: n => "(2)")
 $ F = U_t + \( U dot.op nabla \) U - nu Delta U . $ <eq:residual>]

 Then $\( U \, 0 \)$ is a global smooth solution of (1) with force $F$, unique in the classical class on every finite time interval. If $U$ has zero spatial mean, so does $F$.]
] <lem:realization>

#proof[
  Substitution proves existence. To prove uniqueness, use the classical difference-energy method #cite(label("Leray1934")) Section 18. For another solution $\( v \, p \)$ with the same force and data set $w = v - U$. Its equation is
  $ w_t + \( v dot.op nabla \) w + \( w dot.op nabla \) U - nu Delta w + nabla p = 0 . $
  The stated regularity permits multiplication by $w$ and periodic integration by parts. The pressure and transport terms vanish, giving
  $ 1 / 2 frac(d, d t) parallel w parallel_2^2 + nu parallel nabla w parallel_2^2 lt.eq parallel nabla U parallel_(oo \, upright("op")) parallel w parallel_2^2 . $
  On every finite interval the coefficient is bounded. Gronwall’s inequality and $w \( 0 \) = 0$ give $w = 0$; the pressure gradient then vanishes, and its normalization gives $p = 0$. Smoothness on compact time cylinders also gives a unique material flow through every finite time. Finally, each component of $\( U dot.op nabla \) U$ is the divergence of a periodic vector field, and the integral of $Delta U$ vanishes. Integrating (2) proves the mean assertion. ◻
]

#thm([Lemma 2.3.])[
  (Solenoidal projection).  #emph[A computably smooth mean-zero force $F$ on $bb(T)^3$, with effective spatial derivative bounds, can be replaced by a computably smooth mean-zero solenoidal force $F - nabla phi.alt$, where $Delta phi.alt = "div" F$ and $integral phi.alt = 0$. Replace the pressure $p$ by $p - phi.alt$. The velocity is unchanged. Eventual stationarity, periodicity and bounds for mixed derivatives are preserved. Any temporal $L^2$ estimates for all spatial derivative orders are preserved as well.]
] <lem:projection>

#proof[
  In the Fourier basis $e^(2 pi i k dot.op x)$ set
  $ hat(phi.alt) \( k \) = - frac(i k dot.op hat(F) \( k \), 2 pi \| k \|^2) quad \( k eq.not 0 \) \, #h(2em) hat(phi.alt) \( 0 \) = 0 . $
  The multiplier for $nabla phi.alt$ is $k k^(sans(T)) \/ \| k \|^2$ and has operator norm one. For a derivative order $r$, integrate the coefficient of $F$ by parts $r + 5$ times in a coordinate with largest $\| k_i \|$. There are at most $C n^2$ lattice points with $n lt.eq \| k \| < n + 1$, so the derivative series converges absolutely with a computable tail, and
  $ parallel partial_t^h partial_x^mu nabla phi.alt \( t \) parallel_oo lt.eq C_mu max_i parallel partial_t^h partial_(x_i)^(\| mu \| + 5) F \( t \) parallel_oo . $
  This proves the asserted uniform and temporal bounds. Riemann sums with derivative error bounds evaluate each Fourier coefficient; the series tail makes the resulting procedure effective. Differentiation in time commutes with this fixed spatial multiplier. Substitution gives $- nabla \( p - phi.alt \) + \( F - nabla phi.alt \) = - nabla p + F$, which checks the pressure sign and completes the proof. ◻
]

== 3 A finite reversible rule table <sec:compiler>

We use deterministic machines with one head on a tape indexed by $bb(Z)$, a finite alphabet containing a blank, and head moves in ${ - 1 \, 0 \, 1 }$. The finite input occupies cells $0 \, dots.h \, r - 1$, all other cells are blank, and the head starts at $0$. A transition writes one symbol before moving the head. A machine can effectively be put in the convention of a single halting state $q_(upright(H))$, no rules there, and a total table elsewhere: missing instructions and multiple halting states can be redirected to a new halting state. We also add a fresh initial state $q_(upright("start"))$ whose rules leave the symbol and head unchanged and enter the former initial state. This extra step preserves halting, even when the original initial state was halting.

Fluid maps are invertible. We therefore first retain the information that a machine transition would otherwise erase. History recording is the classical way to obtain reversible computation #cite(label("Bennett1973")) Eqs. (9)–(11); the following explicit version also has the local property needed for our geometric construction.

#thm([Lemma 3.1.])[
  (An injective local compiler).  #emph[From a deterministic machine and its finite input one can effectively construct a finite partial one-head transition table and an initial tape which differs from a constant blank tape at finitely many cells, with these properties.]
  + #emph[Its initialized run reaches a single terminal state, which has no outgoing rules, if and only if the original machine halts. Otherwise every successive transition is defined and the run continues forever. At specified finite checkpoints its state and tape recover the original computation.]
  + #emph[All rules arriving at a fixed state have the same head displacement. The destination state and the full written symbol determine the incoming rule, including its old state and read symbol.]
] <lem:compiler>

#proof[
  Let $Q$ and $Gamma$ be the states and alphabet of the augmented machine. For each $tau = \( q \, a \)$ in $cal(T) = \( Q \\ { q_(upright(H)) } \) times Gamma$, write its instruction as $\( q_tau^(+) \, a_tau^(+) \, d_tau \)$. Use the three-track alphabet
  $ Sigma = Gamma times { 0 \, 1 } times cal(L) \, #h(2em) cal(L) = { tack.t \, E } union.sq cal(T) . $
  The tracks hold data, a head marker, and history, respectively. The states are $R_q \, C_q \, L_q$ for $q in Q$ and $A_tau \, F_tau$ for $tau in cal(T)$, all distinguished by their types and subscripts. Only $R_(q_(upright(H)))$ is terminal. Initially the state is $R_(q_(upright("start")))$, the data and head are the given data and head, all marker bits vanish, and the history is $E$ at cell $2$ and $tack.t$ elsewhere. Thus the full blank symbol is $\( upright("blank") \, 0 \, tack.t \)$.
  The intended invariant at the ready checkpoint after $n$ augmented steps is the following: the control is $R_q$, and its data and head $h$ are exactly those of the augmented machine, with $\| h \| lt.eq n$. Every marker bit vanishes. History cells $2 \, dots.h \, n + 1$ contain the successive $n$ instruction tags, cell $n + 2$ contains $E$, and every other history cell contains $tack.t$. We prove this invariant below.
  The next transition first performs the data instruction and enters $A_tau$. It then marks the new head position and enters the forward scan $F_tau$. That scan reaches $E$, replaces it by the instruction record $tau$, and enters $C_(q_tau^(+))$ one cell to its right. The $C$ step advances the frontier to that empty cell and turns into $L_(q_tau^(+))$. The leftward scan returns to the marked work-head position, erases the mark, and enters the next ready state. The frontier always lies beyond the new work head; the temporary marker remembers where the returning scan must stop.
  Here is the entire partial table. Each row is expanded over all symbols satisfying its displayed restrictions; $a in Gamma$ and $ell in cal(L)$.
  #[#set math.equation(numbering: n => "(3)")
   $ \( R_q \, \( a \, 0 \, ell \) \) & mapsto \( A_tau \, \( a_tau^(+) \, 0 \, ell \) \, d_tau \) & q eq.not q_(upright(H)) \, med tau = \( q \, a \) \, med ell eq.not E \,\
\( A_tau \, \( a \, 0 \, ell \) \) & mapsto \( F_tau \, \( a \, 1 \, ell \) \, 1 \) & ell eq.not E \,\
\( F_tau \, \( a \, 0 \, ell \) \) & mapsto \( F_tau \, \( a \, 0 \, ell \) \, 1 \) & ell eq.not E \,\
\( F_tau \, \( a \, 0 \, E \) \) & mapsto \( C_(q_tau^(+)) \, \( a \, 0 \, tau \) \, 1 \) \, & \
\( C_q \, \( a \, 0 \, tack.t \) \) & mapsto \( L_q \, \( a \, 0 \, E \) \, - 1 \) \, & \
\( L_q \, \( a \, 0 \, ell \) \) & mapsto \( L_q \, \( a \, 0 \, ell \) \, - 1 \) & ell eq.not E \,\
\( L_q \, \( a \, 1 \, ell \) \) & mapsto \( R_q \, \( a \, 0 \, ell \) \, 0 \) & ell eq.not E . $ <eq:compiler-table>]
  The invariant holds initially. To verify its induction step, the first row performs the data instruction and moves to $h' = h + d_tau lt.eq n + 1 < n + 2$. The second row marks $h'$ and starts a rightward scan. The third and fourth rows reach the finite frontier $n + 2$, replace $E$ by $tau$, and advance one cell. The fifth row writes the new frontier at $n + 3$ and turns left. The last two rows return to the unique marker, erase it, and enter $R_(q_tau^(+))$ at $h'$. This takes $4 + 2 \( n + 2 - h' \)$ transitions, a positive finite number. No undefined rule is encountered. Halting and the checkpoint correspondence follow.
  For completeness, the local injectivity can be checked destination by destination. Into $A_tau$, the tag fixes the old state and data symbol, and the written symbol retains the old history letter. Into $F_tau$ both incoming types move right; the arrival from $A_tau$ writes marker $1$, whereas the scan loop writes marker $0$. Into $C_q$ the move is right and the written tag identifies $tau$, while the data letter is retained. Into $L_q$ both types move left; the arrival from $C_q$ writes $E$, whereas the loop never does. Into $R_q$ only the last row applies, with displacement zero and the data and history letters retained. In every case the destination and written full symbol recover the unique expanded rule. In particular the full configuration map is injective on its domain: from a destination configuration its state fixes $d$, so the old head was at the new head minus $d$; the symbol at that cell identifies the rule and hence the old read symbol and state. Restoring that one symbol recovers the entire predecessor configuration. ◻
]

== 4 An area-preserving planar processor <sec:processor>

The next construction realizes the entire finite rule table in one period. Area-preserving realization of generalized shifts is also a central step in #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Proposition 5.1. Here we give explicit local Hamiltonian motions, quantitative flow bounds and a corridor respected at every intermediate time. In particular, it does not construct the sequence of branches visited by the chosen input.

#thm([Theorem 4.1.])[
  (A smooth planar processor).  #emph[From the machine and input one can effectively construct a smooth field $V \( s \, X \, Y \)$ on $bb(R) times bb(T)^2$ with the following properties.]
  + #emph[$V$ is $1$-periodic in $s$, vanishes on neighborhoods of integer $s$, is divergence free in $\( X \, Y \)$, and has zero spatial mean. Its planar support is a compact subset of the open unit-square chart. It has a smooth periodic Hamiltonian potential supported in that chart. The same formula, extended by zero, defines a compactly supported field on $bb(R)^2$ with the same conclusions below. The construction also supplies a finite list of closed rational source rectangles $D_r$, target rectangles $H_r$ and affine maps $F_r : D_r arrow.r H_r$, each with positive reciprocal diagonal linear part. The two rectangle families are separately disjoint. These maps implement the symbolic branches under an explicit tape encoding. The period map agrees with $F_r$ on a positive neighborhood of $D_r$, with an effective lower bound for the neighborhood radius. All its derivatives have effective finite uniform bounds.]
  + #emph[Starting from $p = \( 1 \/ 4 \, 1 \/ 4 \)$ at $s = 0$, the trajectory at successive integer times encodes every transition of the compiled machine, until its terminal state is reached. All these trajectory segments lie in 
$ J_(*) = \[ 1 \/ 8 \, 7 \/ 8 \] times \[ 1 \/ 32 \, 7 \/ 8 \] . $

 The trajectory reaches the fixed strip 
$ H = { \( X \, Y \) in bb(T)^2 : 1 \/ 32 < Y < 1 \/ 8 } $

 at a finite time if and only if the original machine halts. If the machine does not halt, $3 \/ 16 lt.eq Y lt.eq 7 \/ 8$ throughout the trajectory. If it halts, an integer-time point lies in $H$ at distance at least $1 \/ 32$ from its boundary.]
  + #emph[One can compute $L gt.eq 1$ such that planar transition maps over any phase interval of length $s gt.eq 0$, and their inverses, have first derivative norm at most $e^(L s)$ and second derivative norm at most $e^(2 L s) - e^(L s)$. Here $L$ bounds both $D_(X \, Y) V$ and $D_(X \, Y)^2 V$ globally. Perturbations of an initial point are magnified by at most $e^(L s)$ over such an interval.]
] <thm:planar-processor>

=== 4.1 Separated radix coordinates <separated-radix-coordinates>

The passage from symbolic rules to affine maps is the generalized-shift construction of Moore #cite(label("Moore1990")) #cite(label("Moore1991")). We specify the gapped coordinates and verify the full rectangle maps needed for smooth incompressible motion.

Write $K = \| Sigma \|$, put $B = 2 K + 2$, and assign the symbols distinct odd digits $c \( a \) in { 1 \, 3 \, dots.h \, 2 K - 1 }$. Define

$ C \( a_1 \, a_2 \, dots.h \) = sum_(k gt.eq 1) frac(c \( a_k \), B^k) \, #h(2em) I_a = frac(c \( a \) + \[ 0 \, 1 \], B) \, #h(2em) I_(a \, b) = frac(c \( a \) + I_b, B) . $

Every sequence code lies in $\[ 1 \/ \( B - 1 \) \, \( 2 K - 1 \) \/ \( B - 1 \) \] subset \( 0 \, 1 \)$. The closed intervals $I_a$ are separated by positive gaps, as are the intervals $I_(a \, b)$ for distinct ordered pairs. A sequence code lies in the interior of its first-symbol interval. Reading that interval and rescaling recovers the tail, so the sequence representation is unique.

For a compiled configuration with state $i$, head $h$, and tape $\( a_k \)_(k in bb(Z))$, use head-relative coordinates

#[#set math.equation(numbering: n => "(4)")
 $ x = C \( a_(h - 1) \, a_(h - 2) \, dots.h \) \, #h(2em) y = C \( a_h \, a_(h + 1) \, dots.h \) . $ <eq:two-stack-code>]

The initial coordinates $x_0 \, y_0$ are computable rationals: the finite nonblank part is followed on each side by a geometric constant-symbol tail. Let $m$ be the number of compiled states and let $N$ be the number of branches obtained by counting a displacement $0$ or $1$ rule once, and a displacement $- 1$ rule $K$ times. There is at least one rule. Set

$ lambda = frac(1, 100 \( m + N + 1 \)) \, #h(2em) a_(*) = 1 / 4 - lambda x_0 . $

Associate to each state a square using

#[#set math.equation(numbering: n => "(5)")
 $ Psi_i \( x \, y \) = \( a_(*) + lambda x \, b_i + lambda y \) \, #h(2em) b_i = cases(delim: "{", 1 \/ 4 - lambda y_0 \, & i = R_(q_(upright("start"))) \,, 1 \/ 16 \, & i = R_(q_(upright(H))) \,, 1 \/ 3 + ell \/ \[ 12 \( m + 1 \) \] \, & i upright(" is the ") ell upright("th remaining state") .) $ <eq:state-squares>]

The state squares are pairwise disjoint: consecutive squares in the last group are separated since $lambda < 1 \/ \[ 12 \( m + 1 \) \]$, and the initial and terminal squares lie in separate lower height ranges. Every nonterminal square has

#[#set math.equation(numbering: n => "(6)")
 $ 1 \/ 4 - lambda lt.eq Y < 1 \/ 2 \, $ <eq:state-height-bounds>]

whereas the terminal square has $1 \/ 16 lt.eq Y lt.eq 1 \/ 16 + lambda$. The initialized code is exactly $p = \( 1 \/ 4 \, 1 \/ 4 \)$.

For each expanded rule $\( i \, a \) mapsto \( j \, b \, d \)$, the following table specifies its local domain rectangle, affine map, and image rectangle. For $d = - 1$ there is a branch for every $e in Sigma$.

#[#set math.equation(numbering: n => "(7)")
 $ d & upright("domain") & \( x' \, y' \) & upright("image")\
1 & \[ 0 \, 1 \] times I_a & \( \( c \( b \) + x \) \/ B \, med B y - c \( a \) \) & I_b times \[ 0 \, 1 \]\
0 & \[ 0 \, 1 \] times I_a & \( x \, med y + \( c \( b \) - c \( a \) \) \/ B \) & \[ 0 \, 1 \] times I_b\
- 1 & I_e times I_a & \( B x - c \( e \) \, med c \( e \) \/ B + \( c \( b \) + B y - c \( a \) \) \/ B^2 \) & \[ 0 \, 1 \] times I_(e \, b) . $ <eq:branch-table>]

The right-move formula prefixes the written symbol to the left stack and removes the read symbol from the right stack. The left-move formula removes $e$ from the left stack and prefixes $e \, b$ to the old right tail. Thus these are exactly the tape operations, including the stationary case, and all have determinant one.

Map each domain by $Psi_i$ and its image by $Psi_j$. Enumerate the resulting pairs of actual rectangles as $\( D_r \, H_r \)$, $1 lt.eq r lt.eq N$, with centers $upright(bold(d))_r \, upright(bold(h))_r$. They have rational endpoints, and each side has length at most $lambda$. The $D_r$ are pairwise disjoint by determinism, state separation, and digit gaps. The $H_r$ are pairwise disjoint as well: a target state fixes the displacement by Lemma 5, and distinct incoming rules have distinct written full symbols. For displacement $1$ or $0$ these symbols separate the $I_b$ factors, and for displacement $- 1$ the ordered pairs $\( e \, b \)$ separate the $I_(e \, b)$ factors. No disjointness between a domain and an image is asserted or needed. The actual branch map is

#[#set math.equation(numbering: n => "(8)")
 $ upright(bold(w)) mapsto upright(bold(h))_r + A_r \( upright(bold(w)) - upright(bold(d))_r \) \, #h(2em) A_r = "diag" \( mu_r \, mu_r^(- 1) \) \, #h(2em) mu_r = B^(- d) . $ <eq:actual-branch>]

=== 4.2 Localized Hamiltonian motions <localized-hamiltonian-motions>

Use the effective smooth step from Lemma 2:

#[#set math.equation(numbering: n => "(9)")
 $ beta \( u \) = frac(E \( u \), E \( u \) + E \( 1 - u \)) . $ <eq:smooth-step>]

It is smooth, $beta = 0$ on $\( - oo \, 0 \]$, and $beta = 1$ on $\[ 1 \, oo \)$. For a phase slot $\[ s_0 \, s_1 \]$ let

$ theta \( s \) = beta (frac(3 \( s - s_0 \), s_1 - s_0) - 1) . $

This interpolates from zero to one and is constant near both ends.

Suppose a closed rational axis-aligned rectangle $J$ contains the entire desired motion of one rectangle, is contained in the open unit square, and is disjoint from all other current rectangles. Choose $delta > 0$ to be one third of the minimum of its sup-norm distances to those rectangles and to the chart boundary (omitting the first set when there are no other rectangles). These distances are positive rational numbers. If a coordinate interval of $J$ is $\[ a \, b \]$, the factor

$ beta (frac(u - a + delta, delta \/ 2)) beta (frac(b + delta - u, delta \/ 2)) $

is one on a neighborhood of $\[ a \, b \]$ and supported in $\[ a - delta \, b + delta \]$. The product of the two factors gives a smooth cutoff $chi$ equal to one near $J$, supported in the open chart, and zero near every stationary rectangle. For a scalar function $G$ we use the pulse

#[#set math.equation(numbering: n => "(10)")
 $ V \( s \, X \, Y \) = theta' \( s \) #scale(x: 120%, y: 120%)[\(] partial_Y \( chi G \) \, - partial_X \( chi G \) #scale(x: 120%, y: 120%)[\)] . $ <eq:Hamiltonian-pulse>]

Its potential is extended periodically from its compact support. The pulse is divergence free and has zero planar mean.

For translation by $upright(bold(u)) = \( u_1 \, u_2 \)$ take $G = u_1 Y - u_2 X$. Points $upright(bold(w))$ of the active rectangle then follow exactly $upright(bold(w)) + theta \( s \) upright(bold(u))$, provided their swept bounding box is contained in $J$. For the scaling $"diag" \( mu \, mu^(- 1) \)$ about a center $bold(pi)$ take

$ G = \( log mu \) \( X - pi_1 \) \( Y - pi_2 \) . $

The exact paths are

$ bold(pi) + "diag" \( mu^(theta \( s \)) \, mu^(- theta \( s \)) \) \( upright(bold(w)) - bold(pi) \) . $

These claims follow by differentiating the displayed paths, since $chi = 1$ on a neighborhood of every tracked point. Smooth ODE uniqueness identifies them with the pulse flow. Other current rectangles stay fixed because the pulse vanishes near them.

=== 4.3 Routing without collisions <routing-without-collisions>

Place parking centers at

$ bold(pi)_r = (1 / 2 + frac(r, 4 \( N + 1 \)) \, 3 / 4) \, #h(2em) 1 lt.eq r lt.eq N . $

The parking-column spacing is larger than $lambda$. Divide a phase period into $5 N$ equal slots and perform these operations:

+ In decreasing order of the source horizontal centers $upright(bold(d))_(r \, 1)$, translate $D_r$ horizontally right to its parking column, then vertically to $bold(pi)_r$.
+ With all rectangles parked, apply the scaling $A_r$ at each parking center, in index order.
+ In increasing order of the target horizontal centers $upright(bold(h))_(r \, 1)$, translate each parked rectangle vertically to its target height, then horizontally left into $H_r$.

Ties in the two orders are broken by the branch index.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (3.3, 2.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.35, 0.35), (0.9, 0.7), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.55, 0.95), (1.05, 1.3), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.7, 1.5), (1.2, 1.8), fill: rgb("#b2b2b2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.45, 2.1), (2.95, 2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.28, 1.65), (2.7, 1.65), (2.7, 2.02), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.65, -0.4), [#box(width: 3.835cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Extract to the right, then up]]])])
  rect((4.1, 0), (7.4, 2.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((4.45, 2.1), (5, 2.4), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.5, 2.05), (5.9, 2.45), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((6.55, 2.13), (7.1, 2.37), fill: rgb("#b2b2b2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((6.66, 2.05), (6.99, 2.45), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((6.825, 2.38), (6.825, 2.58), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((6.825, 2.12), (6.825, 1.92), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.75, -0.4), [#box(width: 3.835cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Reshape within#linebreak()separate columns]]])])
  rect((8.2, 0), (11.5, 2.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((8.55, 0.95), (9.1, 1.3), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((8.6, 1.5), (9.2, 1.8), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((8.95, 0.3), (9.25, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((10.75, 2), (11.05, 2.5), fill: rgb("#b2b2b2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10.9, 1.92), (10.9, 0.55), (9.35, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9.85, -0.4), [#box(width: 3.835cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Insert down, then to the left]]])])
})],
  caption: [Figure 1: The three routing stages, schematically. Extraction is ordered by decreasing source horizontal center; insertion is ordered by increasing target horizontal center. Those orders keep overlapping vertical projections from becoming obstacles. The source and target families are separately disjoint; they need not be disjoint from one another. ],
) <fig:planar-routing>

Figure 1 summarizes the three routing stages. We verify the required clearance for every pulse; this also treats rectangles of unequal widths. During horizontal extraction, consider an unextracted rectangle whose vertical interval meets the active one. Since the source rectangles are disjoint, their horizontal intervals are strictly separated. The center ordering forces the other interval to lie wholly to the left (equal centers would force disjoint vertical intervals), so it cannot meet the rightward swept box. Previously parked rectangles lie near height $3 \/ 4$, whereas sources lie below $1 \/ 2$. The subsequent vertical move is in a parking column, disjoint from both the source squares near $X = 1 \/ 4$ and the other parking columns.

During a scaling, each side length is between its initial and final lengths, both at most $lambda$. Thus its entire motion lies in $bold(pi)_r + \[ - lambda \/ 2 \, lambda \/ 2 \]^2$, separated from all other parking boxes. A vertical insertion again uses an empty parking column and avoids the state squares. During horizontal insertion, parked rectangles are above the target heights. Any previously inserted target whose vertical interval meets the active target has its horizontal interval wholly to the left, by disjointness and the increasing-center order; it therefore does not meet the active rectangle’s leftward swept box, which stops at its own target.

All swept bounding boxes are contained in the open unit square. They have rational endpoints, including the scaling bounding boxes, and their distances to stationary boxes are positive. Consequently the cutoff recipe applies at every slot. Induction through the slots proves that every full source rectangle is moved according to its assigned map, while all other tracked rectangles are held fixed during that pulse. The resulting period map is exactly (8) on every $D_r$.

The action holds on a positive neighborhood as well. For every slot, include two kinds of clearance: the swept active rectangle’s distance from the complement of the region where its cutoff is one, and each held rectangle’s distance from the support of that cutoff. The cutoff recipe gives effective positive lower bounds for both kinds. Minimize these bounds over all slots and all tracked rectangles, obtaining $m > 0$. Let $M gt.eq 1$ bound the operator norm of the linear part of every partial affine product along every branch, with the identity used during a held slot. Such a bound is computed from the finitely many translations and reciprocal scalings. Choose a rational radius $0 < rho < m \/ \( 2 M \)$. Induction through the slots shows that a perturbation of norm less than $rho$ stays in the active one-plateau or the inactive zero-region, as appropriate. It therefore follows the same affine formulas. All sources have been parked before target insertion starts, so possible source–target overlaps introduce no additional simultaneous obstacles. This proves neighborhood action on whole rectangles, including their boundaries, with a radius computed from the finite table and geometry rather than from its chosen execution.

The pulses vanish near all slot joints and phase endpoints; joining them and repeating periodically gives a smooth $V$. Every tracked path has

$ 1 \/ 4 - lambda lt.eq X lt.eq 3 \/ 4 + lambda \/ 2 \, #h(2em) 1 \/ 16 lt.eq Y lt.eq 3 \/ 4 + lambda \/ 2 \, $

and hence lies in $J_(*)$. For a branch whose source and target are both nonterminal, (6) and the parking height give the stronger bound

#[#set math.equation(numbering: n => "(11)")
 $ 1 \/ 4 - lambda lt.eq Y lt.eq 3 \/ 4 + lambda \/ 2 quad upright("throughout the period") . $ <eq:no-transient-halting>]

Translations interpolate endpoint intervals, and the sole scaling takes place at height $3 \/ 4$, so the bound includes all intermediate times and all times when the rectangle is stationary. Since $lambda < 1 \/ 100$, its lower bound is greater than $3 \/ 16$. The terminal square lies in $H$, at distance at least $1 \/ 32$ from its boundary, because $lambda < 1 \/ 32$.

#proof[
  #emph[Completion of the proof of Theorem 6.] At integer phase times, induction using (7) proves that the trajectory from $p$ has exactly the coordinates of the next compiled configuration. The radix code is interior to its appropriate branch rectangle, including the left-symbol subrectangle for a left move. At ready checkpoints Lemma 5 recovers the original state and tape. If absolute tape indices are desired, the finite history block begins at absolute cell $2$: its tags and frontier are visible in the two head-relative stacks, and so locate the head relative to that cell. Thus the correspondence encodes the computation, not only its outcome.
  If the machine halts, some integer phase time reaches the terminal square. If it does not, all consecutive states are nonterminal and (11) excludes $H$ at every time. The smooth field itself is defined everywhere for all phase times, so no issue of continuation arises after a halting event.
  All tables, rational rectangles, orders, clearances, and slots are computed by finite procedures from the machine and its input. The only additional constants are computable numbers such as $log B$. The elementary cutoffs are computably smooth, not merely formal piecewise descriptions: near a switching point the derivative estimates in Lemma 2 give effective smallness bounds, with the fixed denominator lower bound $e^(- 2)$. Finite symbolic differentiation and those bounds therefore produce effective uniform bounds for every derivative of every pulse, including across all joints and chart boundaries. No test for exact equality of a real argument with a switching point is needed to evaluate to a prescribed accuracy.
  Choose an effective $L gt.eq 1$ bounding the operator norms of $D V$ and $D^2 V$ uniformly. The first variational equation gives $parallel D Phi_s parallel lt.eq e^(L s)$. The second gives
  $ parallel D^2 Phi_s parallel lt.eq integral_0^s e^(L \( s - r \)) L e^(2 L r) thin d r = e^(2 L s) - e^(L s) lt.eq e^(2 L s) . $
  For an arbitrary initial phase $s_0$ and length $s gt.eq 0$, the inverse of the transition map from $s_0$ to $s_0 + s$ is the time-$s$ map of
  $ frac(d q, d r) = - V \( s_0 + s - r \, q \) \, #h(2em) 0 lt.eq r lt.eq s . $
  This reversed nonautonomous field has the same global spatial derivative bounds $L$. Its first and second variational equations therefore give exactly the same bounds for the derivatives of the inverse map, on the whole torus and for the compactly supported planar extension. The difference of two lifted trajectories satisfies the Lipschitz estimate $e^(L s)$ as well. In particular every finite computational trajectory has an effective tube of controlled radius: an initial perturbation of size $eta e^(- L s)$ stays within $eta$ up to time $s$. This is a finite-time estimate only, not a uniform robustness claim for an infinite computation. ◻
]

== 5 An autonomous spatial clock and a steady force <sec:lagrangian>

The planar phase can be supplied by the third spatial coordinate, while retaining zero spatial mean. This yields the following precise form of forced Navier–Stokes universality. Passing from a smooth return map to a three-dimensional flow is a classical part of the generalized-shift construction #cite(label("Moore1991")) Section 6. Here we give the particular mean-zero clock that equals unit speed on the entire tracked corridor.

#proof[
  Let $V$ be the field of Theorem 6. Choose a smooth cutoff $chi_(*) \( X \, Y \)$, equal to one near $J_(*)$ and compactly supported in the open unit square, using the same rational-margin recipe as above. Extend its compactly supported products periodically. Set
  #[#set math.equation(numbering: n => "(12)")
   $ g \( X \, Y \) = partial_X #scale(x: 120%, y: 120%)[\(] X chi_(*) \( X \, Y \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) W \( X \, Y \, Z \) = #scale(x: 120%, y: 120%)[\(] V_1 \( Z \, X \, Y \) \, V_2 \( Z \, X \, Y \) \, g \( X \, Y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:autonomous-suspension>]
  This is a smooth periodic vector field. Its divergence vanishes because $V$ has zero planar divergence and $g$ is independent of $Z$. Each component has zero spatial mean by its derivative representation. Crucially, $g = 1$ on a neighborhood of $J_(*)$; it need not be positive on the whole torus.
  For a planar computational segment starting at phase zero, the path
  $ s mapsto \( Phi_s^V \( X \, Y \) \, s med mod med 1 \) \, #h(2em) 0 lt.eq s lt.eq 1 \, $
  solves the autonomous $W$ equation, since the planar path stays in $J_(*)$. The smooth field has a unique global flow: periodicity gives boundedness and a uniform spatial Lipschitz constant, so the standard local ODE solution continues through every finite time. Uniqueness therefore identifies this displayed path with that flow. Repeating the argument period by period shows that the $W$ trajectory from $P$ encodes the compiled run at integer values of its path parameter $s$, up to and including terminal entry if it occurs. No absorbing motion after terminal entry is required for the existential event. The all-time exclusion and terminal inclusion in Theorem 6 prove the required reachability equivalence for this autonomous flow.
  To start from zero velocity, use the fixed ramp
  #[#set math.equation(numbering: n => "(13)")
   $ alpha \( t \) = beta \( 2 t - 1 \) \, #h(2em) U \( t \, X \, Y \, Z \) = alpha \( t \) W \( X \, Y \, Z \) \, $ <eq:steady-ramp>]
  and prescribe
  #[#set math.equation(numbering: n => "(14)")
   $ f \( t \) = alpha' \( t \) W + alpha \( t \)^2 \( W dot.op nabla \) W - nu alpha \( t \) Delta W . $ <eq:steady-force>]
  Everything on the right is a previously constructed function, not an unknown solution. The ramp is zero near zero and equals one for $t gt.eq 1$. Thus $f$ is eventually stationary and all its mixed derivatives are bounded. Its mean is zero: this holds for $W$ and $Delta W$, while $integral_(bb(T)^3) \( W dot.op nabla \) W = 0$ by periodicity and $nabla dot.op W = 0$. The residual identity gives the exact solution $u = U$, $p = 0$. Lemma 3 supplies uniqueness in the classical class on each finite time interval. Since $U$ is uniformly bounded on a compact spatial domain, its kinetic energy is uniformly bounded.
  Material trajectories of $U$ are exactly those of $W$ with path parameter
  $ s \( t \) = integral_0^t alpha \( r \) thin d r . $
  This is continuous, finite at finite $t$, and has range $\[ 0 \, oo \)$. Indeed $beta \( u \) + beta \( 1 - u \) = 1$, so $s \( 1 \) = 1 \/ 4$ and $s \( t \) = t - 3 \/ 4$ for $t gt.eq 1$. Consequently every positive integer computational phase $n$ occurs at physical time $n + 3 \/ 4$. The equivalence for $W$ transfers to the physical material flow, including all intermediate times.
  The force formula uses only the finite rule table, the finite input’s rational initial coordinates, and the finite routing construction. Every branch is implemented in each phase cycle; the current fluid position selects the next branch. In particular evaluating the force at a late physical time requires no evaluation of an equally long machine run, and after time one the force has no time-dependent instruction stream at all. This proves effectiveness and the absence of external replay. Taking any fixed universal Turing machine gives the asserted universal encoding. ◻
]

#thm([Corollary 5.1.])[
  (Periodic forcing from time zero).  #emph[There is also an effective construction with zero initial velocity on $bb(T)^3$, a smooth mean-zero force of period one in time with all mixed derivatives bounded, and the fixed particle event of Theorem 1.]
] <cor:periodic>

#proof[
  Take $U \( t \, X \, Y \, Z \) = \( V_1 \( t \, X \, Y \) \, V_2 \( t \, X \, Y \) \, 0 \)$ directly from Theorem 6. Since $V$ vanishes near phase zero, $U \( 0 \) = 0$. It is divergence free, mean zero, and periodic. The prescribed residual force $f = partial_t U + \( U dot.op nabla \) U - nu Delta U$ has the same period, mean, and bounded-derivative properties. Lemma 3 gives the unique global classical solution $U$, whose particle trajectory from $\( 1 \/ 4 \, 1 \/ 4 \, 0 \)$ is exactly the planar processor trajectory with third coordinate zero. Theorem 6 proves the fixed-event equivalence. ◻
]

#prodef([Remark 5.2.])[
  (Solenoidal body forces).  Lemma 4 can replace the forces in Theorem 1 and Corollary 7 by effective mean-zero solenoidal forces, changing only the pressure. It preserves the respective eventual stationarity or periodicity, as well as all mixed-derivative bounds. The velocity and its fixed particle observable remain unchanged.
]

== 6 A slow clock with infinite accumulated time <sec:profiles>

The autonomous spatial field also separates the geometric construction from its physical rate of execution. Slowing it is legitimate only when the accumulated path parameter still reaches every finite computational time. The following statement makes that requirement explicit.

#thm([Proposition 6.1.])[
  (Scalar clock).  #emph[Let $W$ be the field (12). Suppose $a : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ is computably smooth, is zero near zero, has an effective finite bound for $\| a^(\( h \)) \|$ for every integer $h gt.eq 0$ (including boundedness of $a$ itself), and $integral_0^oo a \( t \) thin d t = oo$. Then 
$ U_a \( t \, x \) = a \( t \) W \( x \) \, #h(2em) F_a = a' W + a^2 \( W dot.op nabla \) W - nu a Delta W $

 is a smooth mean-zero forcing construction with bounded mixed derivatives, zero initial velocity and the same fixed-particle event as Theorem 1. Its unique classical velocity is $U_a$. For the specific choice 
#[#set math.equation(numbering: n => "(15)")
 $ a \( t \) = frac(beta \( 2 t - 1 \), 1 + t) \, $ <eq:slow-clock>]

 every time order $h$ and spatial multi-index $mu$ satisfy 
$ parallel partial_t^h partial_x^mu U_a \( t \) parallel_oo + parallel partial_t^h partial_x^mu F_a \( t \) parallel_oo lt.eq C_(h \, mu) \( 1 + t \)^(- 1 - h) . $

 In particular all these spatial supremum norms belong to $L^2 \( 0 \, oo \)$, and the force tends uniformly to zero.]
] <prop:scalar-clock>

#proof[
  The residual formula is (14) with $alpha = a$, so Lemma 3 gives the solution and uniqueness. The mean-zero and derivative assertions follow by differentiating the three displayed coefficient functions. If $gamma \( s \)$ is the trajectory of $W$ from $P$, then $gamma \( s_a \( t \) \)$ solves the material equation, where $s_a \( t \) = integral_0^t a \( r \) thin d r$. This clock is continuous, nondecreasing, finite at each finite time and unbounded. The intermediate value theorem gives $s_a \( \[ 0 \, oo \) \) = \[ 0 \, oo \)$, so the reachability event is unchanged.
  For (15), $a \( t \) = \( 1 + t \)^(- 1)$ for $t gt.eq 1$, and
  $ s_a \( t \) = s_a \( 1 \) + log frac(1 + t, 2) #h(2em) \( t gt.eq 1 \) . $
  Thus the clock is onto. The coefficients $a'$ and $a^2$ have time derivatives of order $h$ bounded by a constant times $\( 1 + t \)^(- 2 - h)$, whereas $a^(\( h \))$ is bounded by a constant times $\( 1 + t \)^(- 1 - h)$. All derivatives of the fixed spatial fields are bounded. These facts give the claimed estimate for $t gt.eq 1$; compactness gives an enlarged constant on $\[ 0 \, 1 \]$. Squaring and integrating proves the $L^2$ claim. ◻
]

This slow profile and the eventually stationary profile are different forces. An integrable nonnegative scalar clock would traverse only a bounded amount of the same spatial trajectory and cannot replace the onto-clock hypothesis. The present exact positional encoding and its finite-time tube estimate also do not yield a uniform perturbation tolerance for an unbounded computation.

#thm([Corollary 6.2.])[
  (Undecidable fixed-particle reachability).  #emph[No algorithm decides the particle event for all finite force descriptions constructed in Theorem 1.]
]

#proof[
  Compose a proposed event algorithm with the terminating construction of the force. The event equivalence would decide whether an arbitrary machine halts on a finite input. It would therefore decide Turing’s symbol-printing problem #cite(label("Turing1936")) Section 8: simulate a given machine and halt exactly when its specified symbol is printed; if it stops without printing, continue forever. Turing proves that no such decision procedure exists. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
