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

#align(center)[#text(size: 16pt, weight: "bold")[Scalar Potentials and Slow Clocks for Forced Fluid Computation]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Finite instructions in a viscous flow <sec:introduction>

A smooth fluid motion is invertible on every finite time interval. A machine instruction may overwrite its scanned symbol and lose the information needed to undo that instruction. To make a fluid particle execute an arbitrary machine, one must resolve this difference and then keep track of what happens between successive encoded configurations. This paper gives explicit geometric realizations with fixed observation sets and controlled forcing.

We work on $bb(R)^3$ and on the unit flat torus $bb(T)^3 = \( bb(R) \/ bb(Z) \)^3$. For a fixed viscosity $nu > 0$ the equation is

#[#set math.equation(numbering: n => "(1)")
 $ partial_t u + \( u dot.op nabla \) u - nu Delta u + nabla p = f \, #h(2em) "div" u = 0 \, #h(2em) u \( 0 \, dot.op \) = 0 . $ <eq:NS>]

Our principal compact-support result is the following.

#thm([Theorem 1.1.])[
  #emph[Fix a positive computable viscosity $nu$. A deterministic one-tape machine and finite input effectively determine a smooth force on $\[ 0 \, oo \) times bb(R)^3$, supported in one compact spatial set for all time, whose solution from zero velocity has pressure zero and satisfies 
$ parallel partial_t^j D_x^alpha u \( t \) parallel_oo + parallel partial_t^j D_x^alpha f \( t \) parallel_oo lt.eq C_(j \, alpha) \( 1 + t \)^(- 1 - j) $

 for every $j gt.eq 0$ and spatial multi-index $alpha$. The particle initially at the origin enters ${ x_1 < - 1 }$ exactly when the machine halts. Every displayed derivative belongs to space-time $L^2$, and the kinetic energy is uniformly bounded. Uniqueness holds among smooth classical solutions with, for every finite $T$, 
$ u in C \( \[ 0 \, T \] \; H^2 \) ∩ C^1 \( \[ 0 \, T \] \; L^2 \) \, quad p in C \( \[ 0 \, T \] \; H^1 \) \, quad sup_(\[ 0 \, T \] times bb(R)^3) \( \| u \| + \| nabla u \| \) < oo . $

 The formulas remain valid for any fixed positive real viscosity, with evaluation relative to that parameter.]
] <bcs:scalar-theorem>

The input is a finite deterministic one-tape machine and a finite word. The output is a finite program for evaluating the force $f \( t \, x \)$ and each requested mixed derivative to arbitrary rational accuracy. The program specifies every local instruction branch. It does not determine the machine’s later configurations and then prescribe their replay. Numerical effectivity uses a fixed computable viscosity; the same formulas can also be evaluated relative to any fixed real $nu > 0$.

For a material label $a$, write $X_u \( t \, a \)$ for the solution of $partial_t X_u \( t \, a \) = u \( t \, X_u \( t \, a \) \)$, $X_u \( 0 \, a \) = a$. A material detector asks whether this one particle ever enters a fixed open set $O$. The label and set are independent of the machine and input. The forces constructed here have unique global smooth solutions in the precise comparison classes below, so the detector has an unambiguous meaning.

The geometric question behind this theorem is: how can one instruction’s image overlap another instruction’s source without confusing their motions? We give each source rectangle a separate height. The lift selects the source, the planar phase performs its positive reciprocal affine map, and the descent selects the image. Separate disjointness of the source family and image family is sufficient. A delayed-head recorder makes that image condition hold, and every tracked path has a first coordinate between its endpoints. This last property proves the detector statement at all real times.

Two further questions lead to different constructions. Prefix replacements can change planar area. Section 6 realizes them by a planar motion with transverse divergence compensation: the plane containing the computation stays invariant while nearby transverse volume changes compensate planar compression. The resulting torus force has the same logarithmic derivative decay, and the fixed particle $\( 1 \/ 4 \, 1 \/ 2 \, 1 \/ 2 \)$ detects halting in the right half of the first coordinate.

For a spatial suspension, the third coordinate must instead remain available as a clock. Section 7 therefore routes full rectangles within the plane itself. Its Hamiltonian field gives periodic forcing from rest and, with a distinct startup profile, forcing that is stationary after time one. The latter has a nonzero vertical mean during startup, computed explicitly in Proposition 12. Effective forward and inverse derivative bounds also let us apply the injection, stirring and waiting theorem of the companion #cite(label("velocity2026")) Theorem 3.1. The resulting observation tests the third velocity component on a fixed strip, rather than following a marked particle.

=== 1.1 History of the ideas and the role of the forcing <history-of-the-ideas-and-the-role-of-the-forcing>

Turing’s undecidable symbol-printing question supplies the logical obstruction behind the final reachability corollary #cite(label("Turing1936")) Section 8. A machine can be made to halt when it prints the specified symbol, while each ordinary stop without that printing is redirected into an infinite dummy loop. This connects that formulation to the halting convention used here. Landauer discussed retaining intermediate information to avoid logical irreversibility #cite(label("Landauer1961")) Section 3; Bennett implemented reversible computation by recording a history of transitions #cite(label("Bennett1973")). Our explicit local recorders use that information-retention principle. Their exact-real tape coordinates have no finite-storage bound, and we do not import thermodynamic or computational-complexity conclusions.

Moore’s generalized shifts encode tapes by positional expansions and turn local symbolic rules into piecewise affine maps #cite(label("Moore1990")) #cite(label("Moore1991")). His smooth realizations and suspensions explain the symbolic-to-dynamical framework used here. Cardona, Miranda, Peralta-Salas and Presas realize bijective generalized shifts by area-preserving disk diffeomorphisms and suspend them in a geometric construction of stationary Euler flows #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Proposition 5.1 and Theorem 3.1. Their Euler realization uses an adapted Riemannian metric. Cardona, Miranda and Peralta-Salas later constructed a Turing-complete stationary Euler field for the Euclidean metric on $bb(R)^3$; its computational invariant set is noncompact and the field has infinite energy #cite(label("CardonaMirandaPeraltaSalas2023")) arXiv v3, Theorem 1 and the following discussion. We work in fixed flat coordinates and explicitly prescribe a viscous force from zero initial velocity. The local proofs below supply their own closed-rectangle action, support, quantitative bounds and intermediate observation paths.

Dyhr, González-Prieto, Miranda and Peralta-Salas construct unforced stationary Turing-complete Navier–Stokes fields with Hodge viscosity on compact three-manifolds admitting a nowhere-zero harmonic one-form, after a generally non-small metric deformation #cite(label("DyhrGonzalezPrietoMirandaPeraltaSalas2026")) Theorem A. That geometric result supplies viscous context; the fixed-flat-metric, zero-initial-data force prescriptions here are proved separately.

Cardona, Miranda and Peralta-Salas also realize computation through the unforced Euler evolution on a constructed high-dimensional compact Riemannian manifold with a specially chosen metric: the computational input is encoded in the initial velocity, and the observation is entry into an open set of smooth divergence-free velocity fields #cite(label("CardonaMirandaPeraltaSalas2022")) arXiv v1, Theorem 1.1, Remark 1.2 and Definition 5.1. This supplies a velocity-field antecedent to the observation used in our diffusion application.

For a prescribed divergence-free velocity $U$, the identity $f = U_t + \( U dot.op nabla \) U - nu Delta U$ always makes $\( U \, 0 \)$ a solution. It does not by itself construct a finite computational mechanism. The work lies in defining $U$ from all local instruction branches, proving its effectivity, and controlling the complete trajectories and force derivatives. The analytic uniqueness step is the classical energy comparison associated with Leray #cite(label("Leray1934")) Section 18, proved locally in Section 2 for the classes we use.

=== 1.2 Proof organization <proof-organization>

Section 2 fixes the analytic comparison classes and proves the residual realization lemma. Section 3 proves the onto-clock identity and logarithmic estimate, emphasizing that accumulated computational time must remain unbounded. Section 4 proves the compact-support theorem by a complete compiler, coding and scalar-potential argument. Section 5 then gives the optional root clocks and spatial startup profiles. Section 6 replaces reciprocal planar maps by general prefix maps and compensates their area change. Section 7 keeps the realization planar and derives the suspension and diffusion applications. Section 8 states the decision consequence and the scope of the exact detector.

== 2 Prescribed solutions and their uniqueness <sec:analytic>

A construction below first specifies a smooth velocity $U$ and then defines its residual force. We need uniqueness only for those data. On a torus, the comparison class consists of classical velocities $v$ with $v \, v_t$ and spatial derivatives through order two continuous on every finite closed time cylinder, and periodic pressures $p$ with $p \, nabla p$ continuous and mean zero. On $bb(R)^3$, we use smooth classical solutions satisfying, for each $T < oo$,

#[#set math.equation(numbering: n => "(2)")
 $ v in C \( \[ 0 \, T \] \; H^2 \) ∩ C^1 \( \[ 0 \, T \] \; L^2 \) \, #h(2em) p in C \( \[ 0 \, T \] \; H^1 \) \, #h(2em) sup_(\[ 0 \, T \] times bb(R)^3) \( \| v \| + \| nabla v \| \) < oo . $ <eq:comparison>]

These conditions concern competitors as well as the exhibited solution. In the whole-space constructions the reference velocity has fixed compact support; a competitor is not required to have that support.

#thm([Lemma 2.1.])[
  (Residual realization).  #emph[Fix $nu > 0$ and let $U$ be a prescribed smooth divergence-free velocity with $U \( 0 \) = 0$, bounded together with its spatial gradient on every finite time interval. In the whole-space case assume also the velocity conditions in (2). Then the force 
$ f = cal(F)_nu \[ U \] := U_t + \( U dot.op nabla \) U - nu Delta U $

 has $\( U \, 0 \)$ as its unique solution in the stated comparison class. Its material trajectories exist uniquely for all finite forward times and give smooth diffeomorphisms at each such time. A mean-zero velocity on the torus has a mean-zero residual force.]
] <lem:b-comparison>

#proof[
  Substitution proves existence. If $\( v \, p \)$ is another solution, put $w = v - U$. The difference equation is
  $ w_t + \( v dot.op nabla \) w + \( w dot.op nabla \) U = nu Delta w - nabla p \, #h(2em) w \( 0 \) = 0 \, quad "div" w = 0 . $
  On the torus, multiply by $w$ and integrate periodically. Transport by $v$ and pressure give zero, and diffusion gives $- nu parallel nabla w parallel_2^2$. The stated classical regularity justifies these integrations and time differentiation.
  On $bb(R)^3$, insert a smooth cutoff $chi_R$ equal to one on the ball of radius $R$, supported in the ball of radius $2 R$, and with $\| nabla chi_R \| lt.eq C \/ R$. The boundary errors in the transport, pressure and diffusion integrations are bounded respectively by
  $ C R^(- 1) parallel v parallel_oo parallel w parallel_2^2 \, #h(2em) C R^(- 1) parallel p parallel_2 parallel w parallel_2 \, #h(2em) C R^(- 1) parallel nabla w parallel_2 parallel w parallel_2 . $
  They tend to zero. The $C^1 \( L^2 \)$ condition justifies differentiation of the squared norm; $C \( H^2 \)$ and the finite-interval bounds justify the limiting products and integrations. Equivalently one can pass to the integrated-in-time identity, with the same estimates uniform on each finite interval. In either domain the result is
  $ 1 / 2 frac(d, d t) parallel w parallel_2^2 + nu parallel nabla w parallel_2^2 lt.eq parallel nabla U parallel_(oo \, upright("op")) parallel w parallel_2^2 . $
  Gronwall’s inequality gives $w = 0$. The equation then gives $nabla p = 0$. Mean-zero normalization on the torus fixes $p = 0$; on $bb(R)^3$, the only spatially constant $H^1$ pressure is zero.
  Bounded speed prevents finite-time escape of a material trajectory. Local spatial Lipschitz continuity gives uniqueness, and solving backwards on a finite interval gives the inverse flow. Smooth dependence on the initial point gives its smoothness. Finally, the torus integral of $Delta U$ and of $\( U dot.op nabla \) U = "div" \( U ⊗ U \)$ vanishes, proving the mean assertion. ◻
]

The lemma is the classical difference-energy argument; it is not a general large-data existence theorem. All forces below come with their explicitly constructed global smooth solution. A smooth compactly supported velocity with the derivative bounds we establish automatically belongs to the whole-space velocity class in (2).

== 3 Changing the speed without losing computation <bcs:clocks-section>

A slower flow executes the same instructions only if its new clock reaches every finite logical time. The unforced viscous continuation in #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Section 6.B uses a speed $M e^(- nu t)$, with $M > 0$, and has only the finite total logical time $M \/ nu$. Here a prescribed residual force allows the nonintegrable speed $\( 1 + t \)^(- 1)$. The logarithmic estimate below is the only clock bound needed for the first compact construction. Other onto clocks and spatial startup profiles follow that complete application in Section 5. The force is always defined from the prescribed field; it is not inferred from an unknown solution.

We use the explicit smooth step

#[#set math.equation(numbering: n => "(3)")
 $ rho \( v \) = cases(delim: "{", e^(- 1 \/ v) \, & v > 0 \,, 0 \, & v lt.eq 0 \,) #h(2em) sigma \( v \) = frac(rho \( v \), rho \( v \) + rho \( 1 - v \)) . $ <bcs:smooth-step>]

It is zero for $v lt.eq 0$, one for $v gt.eq 1$, and satisfies $sigma \( v \) + sigma \( 1 - v \) = 1$. Each positive-side derivative of $rho$ is $e^(- 1 \/ v)$ times a polynomial in $1 \/ v$ and extends flatly by zero. The bounds $y^m e^(- y) lt.eq \( m + k \) ! y^(- k)$ give effective errors near the joining point, while the denominator of $sigma$ is at least $e^(- 2)$. Thus all these functions and derivatives can be evaluated without an exact equality test at a seam. For phase intervals we use $zeta \( s \) = sigma \( 2 s - 1 \/ 2 \)$, which is constant near both endpoints.

#thm([Lemma 3.1.])[
  (Onto changes of clock).  #emph[Fix $nu > 0$. Let $W \( s \, x \)$ be a smooth divergence-free field for $s gt.eq 0$, on a flat torus or on $bb(R)^3$. Suppose all its mixed derivatives are bounded, $W \( 0 \) = 0$, and in the whole-space case its spatial support lies in a fixed compact set. Let $g : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ be smooth, nondecreasing, onto, with $g \( 0 \) = 0$. Then 
#[#set math.equation(numbering: n => "(4)")
 $ u \( t \, x \) & = g' \( t \) W \( g \( t \) \, x \) \,\
f \( t \, x \) & = g'' \( t \) W \( g \( t \) \, x \) - nu g' \( t \) Delta W \( g \( t \) \, x \)\
 & quad + \( g' \( t \) \)^2 \[ partial_s W + \( W dot.op nabla \) W \] \( g \( t \) \, x \) $ <bcs:clock-force>]

 gives a prescribed solution with pressure zero and zero initial velocity. Its material flow is $X_u \( t \, a \) = X_W \( g \( t \) \, a \)$, and hence preserves every all-time reachability event. If $\( W dot.op nabla \) W = 0$ identically, $f$ is divergence free. Spatial mean zero, when imposed on $W$, is inherited by $u$ and $f$.]
  #emph[For $g \( t \) = log \( 1 + t \)$, every $j gt.eq 0$ and spatial multi-index $alpha$ satisfy 
#[#set math.equation(numbering: n => "(5)")
 $ parallel partial_t^j D_x^alpha u \( t \) parallel_oo + parallel partial_t^j D_x^alpha f \( t \) parallel_oo lt.eq C_(j \, alpha) \( 1 + t \)^(- 1 - j) . $ <bcs:log-bounds>]

 All these derivatives belong to $L^2 \( \[ 0 \, oo \) \; L^oo \)$; on a torus or with fixed compact support they also belong to space-time $L^2$.]
] <bcs:clock>

#proof[
  The chain rule gives (4) as $u_t + \( u dot.op nabla \) u - nu Delta u$. The divergence statements follow by differentiation; the convection term is absent under the additional shear hypothesis. On a torus its spatial integral is zero because $\( W dot.op nabla \) W = "div" \( W ⊗ W \)$. The same chain rule applied to $X_W \( g \( t \) \, a \)$ proves the trajectory identity. Onto means that every finite logical time has a finite preimage. This proves both directions of the event equivalence, including a visit during initialization. Existence is supplied by the explicit field, and uniqueness in the appropriate comparison class is Lemma 2.
  For the logarithmic choice put $a = \( 1 + t \)^(- 1)$ and $s = log \( 1 + t \)$. For any smooth bounded-derivative function $A$ and positive integer $r$,
  $ partial_t \[ a^r A \( s \, x \) \] = a^(r + 1) \( partial_s - r \) A \( s \, x \) . $
  The velocity is $a W$, while the force is
  $ - nu a Delta W \( s \, x \) + a^2 \[ partial_s W - W + \( W dot.op nabla \) W \] \( s \, x \) . $
  Repeated use of the displayed identity, commuting spatial derivatives, proves (5). Integrating $\( 1 + t \)^(- 2 - 2 j)$ gives the stated norms. Fixed support also gives uniformly bounded kinetic energy. None of these calculations requires the executed instruction sequence. ◻
]

== 4 A compact realization by three scalar potentials <bcs:scalar-section>

A planar instruction may be easy to interpolate even when its image overlaps another instruction’s source. A third coordinate resolves this overlap: lift each source rectangle to its own height, perform its planar map there, and lower it using its image rectangle. This section makes that procedure into a complete machine-to-fluid construction. Zero is the blank digit, so some encoded points lie on interval endpoints; every cutoff below is one on a neighborhood of the full closed rectangle.

We now prove Theorem 1. The proof first makes the finite instruction table injective, then realizes its full rectangles, and finally changes the physical clock.

=== 4.1 Recording an instruction before moving the head <recording-an-instruction-before-moving-the-head>

We first produce a finite local table whose images can be distinguished. Retaining erased information is the history method of reversible computation #cite(label("Bennett1973")). Here the ordinary head displacement is delayed until the history has been written and the recorder has returned.

Let $A$ be the work alphabet, $Q$ the state set, and $q_0$ the initial state. Identify all designated halt states with one state $h$, redirect transitions into them to $h$, and replace an initially terminal state by $h$. Replace each missing instruction at $\( q \, a \)$ by the stationary symbol-preserving instruction $\( q \, a \) mapsto \( h \, a \, 0 \)$. A transition into $h$ completes its prescribed write and move before halting. For a one-sided tape, include an immutable end-marker track at cell zero in $A$ and retain its prescribed boundary action in the finite table; every write preserves that track. Write $delta \( q \, a \) = \( q^(+) \, b \, d^(+) \)$ with $d^(+) in { - 1 \, 0 \, 1 }$. Let

$ I = { \( q \, d \, a \) : q eq.not h \, med d in { - 1 \, 0 \, 1 } \, med a in A } \, #h(2em) cal(H) = { tack.t \, P } union.sq { \[ i \] : i in I } . $

A tape cell has a work letter, a history letter in $cal(H)$, and a bit. The auxiliary states are $R_(q \, d) \, B_(q \, d) \, L_(q \, d)$ and $F_i$. At a ready state $R_(q \, d)$ after $n$ ordinary steps, the intended invariant has its frontier at cell $2 + n$, at least two cells to the right of the work head; records occupy cells $2 \, dots.h \, 1 + n$, all remaining history cells except the frontier are blank, and all bits are zero. The recorder writes the work letter and marks the old head, scans right to append a history record, and returns to erase that mark. Only then does it make the ordinary head displacement, restoring a ready state; the proof below verifies the invariant and finite scan lengths.

The following rules, expanded over the indicated letters, are the entire table.

+ In $R_(q \, d_0)$ with $q eq.not h$, on $\( a \, gamma \, 0 \)$ with $gamma eq.not P$, write $\( b \, gamma \, 1 \)$, move right, and enter $F_i$, where $i = \( q \, d_0 \, a \)$.
+ In $F_i$, move right over unmarked cells with history different from $P$. On $\( v \, P \, 0 \)$, write $\( v \, \[ i \] \, 0 \)$, move right, and enter $B_(q^(+) \, d^(+))$.
+ In $B_(q \, d)$, on $\( v \, tack.t \, 0 \)$, write $\( v \, P \, 0 \)$, move left, and enter $L_(q \, d)$.
+ In $L_(q \, d)$, move left over unmarked cells whose history is not $P$. On $\( v \, gamma \, 1 \)$ with $gamma eq.not P$, erase the bit, move by $d$, and enter $R_(q \, d)$.

Initialize in $R_(q_0 \, 0)$ with head at zero and the given finite work input, blank work elsewhere. The history track has $P$ at cell $2$ and $tack.t$ at every other cell; every marker bit is zero.

#thm([Lemma 4.1.])[
  #emph[At successive ready states the auxiliary table has exactly the ordinary work tape, head and state. It reaches an $R_(h \, d)$ exactly when the ordinary machine halts. Every ordinary step uses a positive finite number of auxiliary steps. On the full domain of the auxiliary table, a destination state fixes the incoming displacement, and that state together with the full written symbol determines the incoming rule.]
] <bcs:delayed-recorder>

#proof[
  After $n$ completed ordinary steps, put $k = 2 + n$. The unique frontier $P$ is at $k$, cells $2 \, dots.h \, k - 1$ contain the records, and all other history cells are blank. At a ready state all bits are zero and the head $j$ satisfies $k - j gt.eq 2$. The first rule changes the work letter and marks $j$. The right scan reaches the frontier, writes the record, creates the frontier at $k + 1$, and returns to the sole marked cell. Erasing that mark and then moving by $d^(+)$ restores the invariant, since $\( k + 1 \) - \( j + d^(+) \) gt.eq 2$. Both scans cross finite intervals. An initial halt requires no ordinary transition.
  For the inverse assertion, into $F_i$ the index $i$ identifies the original ready state and read work letter, while the written bit distinguishes entry from the scanning loop. An arrival at $B_(q \, d)$ writes a record $\[ i \]$, which identifies the forward state; its work letter is retained. Into $L_(q \, d)$, the frontier written on entry distinguishes that rule from the backward loop. An arrival at $R_(q \, d)$ is the marker-erasure rule with displacement $d$, and the written work and history letters recover the read symbol. Within each family the retained letters distinguish the remaining choices. These checks use all allowed symbols and do not assume initialization. ◻
]

=== 4.2 From the local table to full rectangles <from-the-local-table-to-full-rectangles>

The positional encoding follows the generalized-shift viewpoint of Moore #cite(label("Moore1990")) #cite(label("Moore1991")); its explicit gap and endpoint estimates are proved here. Order the alphabet $Gamma = A times cal(H) times { 0 \, 1 }$ with its all-blank symbol first. Give its letters the digits $c \( a \) = 2 "index" \( a \)$, starting at index zero, in base $G = 2 \| Gamma \|$. Put

$ E \( a_1 a_2 dots.h.c \) = sum_(n gt.eq 1) c \( a_n \) G^(- n) \, #h(2em) I_a = \[ c \( a \) \/ G \, \( c \( a \) + 1 \) \/ G \] . $

The digits range from $0$ to $G - 2$. Distinct first-letter intervals have a gap at least $G^(- 1)$, and $G E \( a omega \) - c \( a \) = E \( omega \)$ uniquely decodes the tails, including the zero blank tail. Give the states distinct positive indices. Set $o_s$ equal to three times its index for nonterminal states, and minus three times its index for $R_(h \, d)$. A relative tape with head at $j$ is encoded by

$ \( x \, y \) = #scale(x: 120%, y: 120%)[\(] o_s + E \( w_(j - 1) w_(j - 2) dots.h.c \) \, E \( w_j w_(j + 1) dots.h.c \) #scale(x: 120%, y: 120%)[\)] . $

At an initialized ready state the consecutive records immediately left of the frontier give their number $n$, so the frontier has absolute index $2 + n$. Its relative distance from the head recovers the absolute head index as well.

Split each local rule $\( s \, a \) mapsto \( s' \, b \, d \)$ by the letter $l$ immediately to the left, and index the resulting geometric branches by $i$. This index labels the split branches, rather than the recorder triples used above. The source of branch $i$ is $C_i = \( o_s + I_l \) times I_a$, and the affine instruction is

#[#set math.equation(numbering: n => "(6)")
 $ Theta_i \( x \, y \) = cases(delim: "{", \( o_(s') + \( c \( b \) + x - o_s \) \/ G \, med G y - c \( a \) \) \, & d = 1 \,, \( o_(s') + G \( x - o_s \) - c \( l \) \, med \( c \( l \) + y + \( c \( b \) - c \( a \) \) \/ G \) \/ G \) \, & d = - 1 \,, \( o_(s') + x - o_s \, med y + \( c \( b \) - c \( a \) \) \/ G \) \, & d = 0 .) $ <bcs:scalar-branches>]

Removing and prefixing digits proves the update on every applicable code. Its linear part is $"diag" \( lambda_i \, lambda_i^(- 1) \)$ with positive $lambda_i$. Its full image rectangle is, respectively,

$ \( o_(s') + \( c \( b \) + I_l \) \/ G \) times \[ 0 \, 1 \] \, quad \( o_(s') + \[ 0 \, 1 \] \) times \( c \( l \) + I_b \) \/ G \, quad \( o_(s') + I_l \) times I_b . $

The source family is separated. The image family is separated too: within a destination the displacement is fixed by Lemma 4, and the pair $\( l \, b \)$ identifies the split rule. Distinct such pairs have distinct two-digit intervals in a moving case, or separated coordinate products in the stationary case. Every gap is at least $G^(- 2)$. This verifies the needed geometric property on full rectangles, not just on encoded points.

=== 4.3 Lifting, interpolation, and lowering <lifting-interpolation-and-lowering>

For a closed interval $\[ a \, b \]$ and $epsilon > 0$ use

$ eta_(\[ a \, b \])^epsilon \( v \) = sigma \( 2 \( v - a + epsilon \) \/ epsilon \) sigma \( 2 \( b + epsilon - v \) \/ epsilon \) \, $

where $sigma$ is the smooth step in (3). It is one on a neighborhood of the closed interval and vanishes outside its $epsilon$ enlargement. Products give rectangle cutoffs. With $epsilon = 1 \/ \( 4 G^2 \)$, choose $g_i$ for $C_i$ and $macron(g)_i$ for $Theta_i \( C_i \)$; within each family their supports are disjoint.

Write $Theta_i \( x \, y \) = \( lambda_i x + alpha_i \, lambda_i^(- 1) y + beta_i \)$ and let $N$ be the number of branches. Put $h_i = 3 i$. Choose $eta_i \( z \)$ equal to one near $h_i$ and supported within distance one of it. Choose $theta.alt \( z \)$ equal to one on a neighborhood of $\[ 0 \, 3 N \]$ and compactly supported. Let $O = 1 + max_s \| o_s \|$, and choose an integer $A$ greater than $O + 1$ and every number

$ max \( 1 \, lambda_i \) O + \| alpha_i \| \, #h(2em) max \( 1 \, lambda_i^(- 1) \) + \| beta_i \| . $

Choose a compactly supported planar cutoff $Xi$ equal to one near $\[ - A \, A \]^2$. Define the two divergence-free differential operators

$ D_y P = \( - partial_z P \, 0 \, partial_x P \) \, #h(2em) D_z P = \( partial_y P \, - partial_x P \, 0 \) . $

They act on scalar potentials; their divergence vanishes because mixed partial derivatives commute.

Figure 1 shows why separate source and image families suffice. A source is selected before lifting; its image is selected only after the planar map.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.4, 0), (9, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((9, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((-0.4, 0), (-0.4, 2.9), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((-0.4, 2.9), [#text(size: 9pt)[$z$]], anchor: "south", padding: 0.1176cm)
  line((0.7, 0), (2.3, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((5.7, 0), (7.3, 0), stroke: (paint: rgb("#003a00"), thickness: 1.2pt, miter-limit: 10))
  content((1.5, 0), [#text(size: 9pt)[$C_i times \{0\}$]], anchor: "north", padding: 0.1176cm)
  content((6.5, 0), [#text(size: 9pt)[$Theta_i(C_i) times \{0\}$]], anchor: "north", padding: 0.1176cm)
  line((1.5, 0.15), (1.5, 2.2), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((1.5, 1.175), [#text(size: 9pt)[lift]], anchor: "east", padding: 0.1176cm)
  line((1.7, 2.35), (6.3, 2.35), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4, 2.35), [#text(size: 9pt)[reciprocal affine interpolation]], anchor: "south", padding: 0.1176cm)
  line((6.5, 2.2), (6.5, 0.15), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003a00"))))
  content((6.5, 1.175), [#text(size: 9pt)[lower]], anchor: "west", padding: 0.1176cm)
  line((-0.25, 2.35), (1.25, 2.35), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((-0.4, 2.35), [#text(size: 9pt)[$h_i$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: The three scalar-potential phases for one instruction. This is a schematic projection onto the $x \, z$ coordinates; the second planar coordinate is suppressed. Distinct branches use separate heights. Source rectangles are disjoint among themselves, as are image rectangles, while a source may overlap an image. During the middle phase the first coordinate stays between its endpoints. ],
) <fig:scalar-stages>

For $m = 1 \, 2 \, 3$ let $r_m \( tau \) = sigma \( 8 tau - \( 2 m - 1 \) \)$. The three derivative supports are disjoint and contained in $\( 0 \, 1 \)$. Put

$ a_i \( r \) = 1 + \( lambda_i - 1 \) r \, #h(2em) b_i \( r \) = \( lambda_i - 1 \) \/ a_i \( r \) . $

For $\( x_0 \, y_0 \) in C_i$, the desired planar path is the reciprocal interpolation

#[#set math.equation(numbering: n => "(7)")
 $ \( x \, y \) = \( a_i \( r \) x_0 + r alpha_i \, med a_i \( r \)^(- 1) y_0 + r beta_i \) \, #h(2em) 0 lt.eq r lt.eq 1 . $ <bcs:scalar-path>]

It starts at $\( x_0 \, y_0 \)$ and ends at $Theta_i \( x_0 \, y_0 \)$. The scalar potential generating this path is

$ K_i \( x \, y \, r \) = b_i \( r \) x y + \( 1 - r b_i \( r \) \) alpha_i y - \( 1 + r b_i \( r \) \) beta_i x . $

All denominators have a positive lower bound. Use the potentials

$ P_1 & = r'_1 x theta.alt \( z \) sum_i h_i g_i \( x \, y \) \,\
P_2 & = r'_2 Xi \( x \, y \) sum_i eta_i \( z \) K_i \( x \, y \, r_2 \) \,\
P_3 & = - r'_3 x theta.alt \( z \) sum_i h_i macron(g)_i \( x \, y \) \, #h(2em) W = D_y P_1 + D_z P_2 + D_y P_3 . $

The resulting field is divergence free, smooth, supported in one compact spatial set, and zero near the temporal endpoints.

For $\( x_0 \, y_0 \) in C_i$ at height zero, the first phase is exactly $\( x_0 \, y_0 \, h_i r_1 \)$. On this path $g_i = 1$, all its derivatives vanish, and $theta.alt = 1$, so the curl correction has no horizontal component. At height $h_i$ the second phase follows (7) with $r = r_2 \( tau \)$. Indeed its derivatives with respect to $r$ are $b_i x + \( 1 - r b_i \) alpha_i$ and $- b_i y + \( 1 + r b_i \) beta_i$, which are $partial_y K_i$ and $- partial_x K_i$. The choice of $A$ keeps the path in the plateau of $Xi$; exactly one height cutoff is active. At its endpoint $macron(g)_i = 1$, so the third phase lowers it as $z = h_i \( 1 - r_3 \)$. ODE uniqueness proves that these are the actual trajectories. One period therefore sends every point $\( x \, y \, 0 \)$ above $C_i$ to $\( Theta_i \( x \, y \) \, 0 \)$.

The first coordinate during (7) is $\( 1 - r \) x_0 + r Theta_(i \, 1) \( x_0 \, y_0 \)$. The other phases keep it fixed. Thus a branch with nonterminal endpoints cannot cross the negative detection half-space during its interpolation.

=== 4.4 Loading and an unbounded slow clock <loading-and-an-unbounded-slow-clock>

The initial code $\( x_(*) \, y_(*) \)$ is rational because it has only finitely many nonblank digits. Put $r_(*) \( t \) = sigma \( 2 t - 1 \/ 2 \)$ and, on $0 lt.eq t lt.eq 1$, use

$ P_(*) \( t \, x \, y \, z \) = r'_(*) \( t \) Xi \( x \, y \) theta.alt \( z \) \( x_(*) y - y_(*) x \) \, #h(2em) U = D_z P_(*) . $

The trajectory of the origin is $\( r_(*) x_(*) \, r_(*) y_(*) \, 0 \)$. The chosen plateau contains this segment. Extend $W$ with period one in its time variable, writing the result as $V$. The loader occupies the first unit of time; after it, the onto processor clock $s = log_2 t$ starts at zero when $t = 1$. For $t > 1$ define

$ U \( t \, x \) = frac(1, t log 2) V \( log_2 t \, x \) . $

The zero time collars glue these definitions smoothly at $t = 1$. At $t = 2^m$, the particle has the code after $m$ auxiliary steps, up to its first halt. This follows from the onto clock $log_2 t$ and the exact full-rectangle map. Each finite ordinary computation thus finishes in finite physical time.

For a nonhalting computation every code has $x gt.eq 3$, and the loader travels from zero to such a code. Convexity of the first coordinate proves avoidance of $x < - 1$ at every real time. A terminal code has $x lt.eq - 2$, including an initial halt immediately after loading. This proves the event equivalence.

Finally,

$ partial_t \[ t^(- a) Y \( log_2 t \, x \) \] = t^(- a - 1) \[ - a Y + \( log 2 \)^(- 1) partial_s Y \] \( log_2 t \, x \) . $

The proof of Lemma 3 therefore gives the stated $t^(- 1 - j)$ bounds on $t > 1$; the finite loading interval adds bounded quantities. Define $f = U_t + \( U dot.op nabla \) U - nu Delta U$. Fixed compact support gives the Sobolev comparison conditions and every asserted norm. Lemma 2 proves uniqueness. All rules, cutoffs and clock formulas are finite effective data. Periodic evaluation uses a finite superset of possibly active translates, so it does not test equality at a seam or follow the machine’s run. This proves Theorem 1.

== 5 Other clocks and spatial startup profiles <bcs:clock-options>

The compact construction is now complete. We record optional root clocks and startup profiles. The logarithmic estimate in Lemma 3 gains a factor $\( 1 + t \)^(- 1)$ with each time derivative; the root-clock estimate below gives the common exponent $beta$ at every fixed mixed order. The final profile proposition acts on a fixed spatial field $Z$, whose flow is autonomous, rather than on a time-dependent processor. Its force and trajectory identities also apply to the distinct startup profile $sigma \( t \)$ used for the spatial suspension in Section 7.

#thm([Proposition 5.1.])[
  (The root clocks).  #emph[Under the hypotheses of Lemma 3, set $g \( t \) = \( 1 + t \)^q - 1$, where $q = 1 \/ 3$ or $q = 1 \/ 4$, and put $beta = 1 - q$. All mixed derivatives of the velocity and force in (4) are bounded, and for every fixed $j \, alpha$, 
$ parallel partial_t^j D_x^alpha u \( t \) parallel_oo + parallel partial_t^j D_x^alpha f \( t \) parallel_oo lt.eq C_(j \, alpha) \( 1 + t \)^(- beta) . $

 In particular each is square-integrable in time in spatial supremum norm. The cube-root exponent is $2 \/ 3$ and the fourth-root exponent is $3 \/ 4$.]
] <bcs:power-clock>

#proof[
  Every positive-order derivative $g^(\( k \))$ is bounded and is $O_k \( \( 1 + t \)^(- beta) \)$. Each differentiated term in $g' W \( g \)$ contains at least one such factor and a bounded derivative of $W$. One factor supplies the decay and the others are bounded. Applying this statement to $u_t - nu Delta u$, and applying the product rule to convection, proves the force estimate. Since $2 beta > 1$, its square is integrable. Both clocks are increasing and unbounded, so Lemma 3 applies to the event. ◻
]

The displayed bound applies to each mixed derivative separately; no claim of a common constant over all derivative orders is intended. An unslowed periodic field and any of these slowed fields define separate choices of force.

#thm([Proposition 5.2.])[
  (A spatial field with a startup profile).  #emph[Let $Z \( x \)$ be a smooth divergence-free field on a flat torus. Let $sigma$ be the smooth step which is zero for $t lt.eq 0$, one for $t gt.eq 1$, and satisfies $sigma \( t \) + sigma \( 1 - t \) = 1$. Define 
$ alpha_0 \( t \) = sigma \( 2 t - 1 \) \, #h(2em) alpha_1 \( t \) = frac(sigma \( 2 t - 1 \), 1 + t) \, #h(2em) u \( t \, x \) = alpha \( t \) Z \( x \) . $

 For either choice $alpha = alpha_0 \, alpha_1$, the residual force is 
#[#set math.equation(numbering: n => "(8)")
 $ f = alpha' Z + alpha^2 \( Z dot.op nabla \) Z - nu alpha Delta Z . $ <bcs:autonomous-force>]

 It has bounded mixed derivatives, gives zero initial velocity and pressure zero, and follows the spatial flow of $Z$ at the onto time $s \( t \) = integral_0^t alpha$. For $alpha_0$, $s \( t \) = t - 3 \/ 4$ for $t gt.eq 1$, and the force is stationary there. For $alpha_1$, 
$ s \( t \) = s \( 1 \) + log frac(1 + t, 2) quad \( t gt.eq 1 \) \, $

 and the force tends uniformly to zero and belongs to space-time $L^2$. If $integral Z = 0$, both forces have zero mean. In general their means equal $alpha' integral Z$.]
] <bcs:autonomous-profile>

#proof[
  Substitution proves the force identity and the material correspondence. Symmetry of the step gives $integral_0^1 sigma \( 2 t - 1 \) thin d t = 1 / 2 integral_0^1 sigma \( v \) thin d v = 1 \/ 4$. The formulas for $s$ follow and show that its range is $\[ 0 \, oo \)$. For the slow profile the coefficients $alpha' \, alpha^2 \, alpha$ are respectively $O \( \( 1 + t \)^(- 2) \)$, $O \( \( 1 + t \)^(- 2) \)$, and $O \( \( 1 + t \)^(- 1) \)$ after startup; all derivatives are bounded, and integration proves the force norm. Spatial integration of (8) proves the mean statement. ◻
]

These elementary clock estimates do not give faster-than-every-power decay for an arbitrary repeated processor. For example, a nonnegative speed bounded by $C \( 1 + t \)^(- 2)$ has finite accumulated time. The constructions with rapidly shrinking signals require their own memory mechanisms.

== 6 Prefix histories and a plane that compensates area change <bcs:prefix-section>

Reciprocal rectangle maps preserve planar area. Prefix replacements need not: writing a history symbol can change the total prefix length. We now allow arbitrary positive diagonal scalings in the plane, and compensate their area change in the transverse direction. The computational plane itself remains invariant. A logarithmic clock then gives a complete decaying-force construction from ordinary tape instructions.

#thm([Theorem 6.1.])[
  #emph[For fixed computable $nu > 0$, every deterministic one-tape machine and finite input effectively determine a smooth mean-zero force on the unit torus, with zero initial velocity, such that 
$ parallel partial_t^j D_x^alpha f \( t \) parallel_oo lt.eq C_(j \, alpha) \( 1 + t \)^(- 1 - j) $

 for every $j \, alpha$. The unique global smooth velocity satisfies the same bounds. Its particle from $\( 1 \/ 4 \, 1 \/ 2 \, 1 \/ 2 \)$ enters ${ 1 \/ 2 < x_1 < 1 }$ exactly when the machine halts. One choice of force has pressure zero; projecting that force gives a divergence-free choice with the same velocity and a changed normalized pressure. For a fixed machine, the repeated motion before the clock change is independent of the input; only its initial loading motion changes.]
] <bcs:prefix-theorem>

=== 6.1 A record between ordinary tape symbols <a-record-between-ordinary-tape-symbols>

Let $Q$ be the finite state set, $q_(upright("in"))$ its initial state, $Q_h subset.eq Q$ its terminal states, and $Gamma$ the work alphabet with blank $square.stroked.tiny$. Missing instructions are replaced by stationary transitions to an added terminal state, preserving the read letter. A transition into a terminal state is completed; an initially terminal configuration also counts as halting. Add a read-only origin bit to the work alphabet, one only at cell zero and preserved by every write. For empty input, the initial word is a marked blank. This allows recovery of the absolute head position after decoding.

The record symbols retain erased information in the sense of reversible history computation #cite(label("Bennett1973")). For each nonterminal $q$, previous displacement $d in { - 1 \, 0 \, 1 }$, and read letter $a$, create a record $g \( q \, d \, a \)$, and let $G$ be the set of these records. Two infinite stacks $L \, R$ use the alphabet $cal(A) = Gamma union.sq G$. Labels are $C \( q \, d \)$ and $S_(+) \( q \) \, S_(-) \( q \)$. At a checkpoint $C \( q \, d \)$, deleting the records from $L$ gives the tape left of the head in reverse order; deleting them from $R$ gives the tape from the head rightward. The top of $R$ is a work letter. The scan labels transfer leading records between the stacks until the next work letter appears.

A prefix rule $\( ell \; alpha \, beta \) arrow.r \( ell' \; alpha' \, beta' \)$ replaces the indicated prefixes of $L \, R$ and retains their infinite tails. For $delta \( q \, a \) = \( q' \, b \, m \)$ and $g = g \( q \, d \, a \)$, use

#[#set math.equation(numbering: n => "(9)")
 $ \( C \( q \, d \) \; epsilon.alt \, a \) arrow.r \( S_(+) \( q' \) \; b g \, epsilon.alt \) \, &  & m = 1 \,\
\( C \( q \, d \) \; epsilon.alt \, a \) arrow.r \( S_(-) \( q' \) \; epsilon.alt \, b g \) \, &  & m = - 1 \,\
\( C \( q \, d \) \; epsilon.alt \, a \) arrow.r \( C \( q' \, 0 \) \; g \, b \) \, &  & m = 0 . $ <bcs:prefix-work-rules>]

Here $epsilon.alt$ is the empty word. For every $q$, every $g in G$ and every $c in Gamma$, also use

#[#set math.equation(numbering: n => "(10)")
 $ \( S_(+) \( q \) \; epsilon.alt \, g \) arrow.r \( S_(+) \( q \) \; g \, epsilon.alt \) \, & \( S_(+) \( q \) \; epsilon.alt \, c \) arrow.r \( C \( q \, 1 \) \; epsilon.alt \, c \) \,\
\( S_(-) \( q \) \; g \, epsilon.alt \) arrow.r \( S_(-) \( q \) \; epsilon.alt \, g \) \, & \( S_(-) \( q \) \; c \, epsilon.alt \) arrow.r \( C \( q \, - 1 \) \; epsilon.alt \, c \) . $ <bcs:prefix-scan-rules>]

The terminal labels are exactly the checkpoints $C \( q \, d \)$ with $q in Q_h$; there are no rules out of them. The scan labels $S_plus.minus \( q \)$ remain nonterminal even for $q in Q_h$, so a pending move finishes before its terminal checkpoint is reached. Initialize at $C \( q_(upright("in")) \, 0 \)$ with left stack $square.stroked.tiny^oo$ and right stack $omega square.stroked.tiny^oo$, where $omega$ includes the origin bit.

#thm([Lemma 6.2.])[
  #emph[The full domain cylinders of these rules are pairwise disjoint, and their full image cylinders are pairwise disjoint. Initialized checkpoints recover the ordinary machine configurations. Each ordinary transition takes a positive finite number of prefix steps, and a terminal checkpoint occurs exactly on halting.]
] <bcs:prefix-symbolic>

#proof[
  Rules with a common source label test incompatible top letters. For images entering $S_(+) \( q \)$, an ordinary transition begins the left stack with a work letter followed by its distinct source record, whereas a scan loop begins it with a record. These distinguish all incoming cylinders. The same argument uses the right stack for $S_(-) \( q \)$. Into $C \( q \, 1 \)$ or $C \( q \, - 1 \)$, the final scan writes a distinct first work letter on $R$; into $C \( q \, 0 \)$, the source record at the start of $L$ distinguishes the rule. Labels separate the remaining cases. Thus these assertions hold for arbitrary tails, without an initialization assumption.
  For a right move, (9) removes the read letter from $R$ and puts the written letter and its record on $L$. The positive scan transfers leading records from $R$ until the next work letter is exposed. Deleting records gives exactly the rightward tape update. A left move first replaces the read letter by $b g$ on $R$; its scan transfers records from $L$ and then its first work letter to $R$, giving the leftward update. A stationary move only changes the scanned work letter after deletion. Each transition adds one record, so there are finitely many records at every reached checkpoint and every scan is finite. The origin bit survives deletion and gives absolute alignment. A scan associated to a transition into $Q_h$ finishes before the terminal checkpoint is declared. This proves the assertions, including initial halting. ◻
]

=== 6.2 A planar motion for arbitrary diagonal rectangle maps <a-planar-motion-for-arbitrary-diagonal-rectangle-maps>

As in Moore’s positional representation of symbolic shifts #cite(label("Moore1991")), assign the ordered letters of $cal(A)$ the digits $1 \, 3 \, dots.h \, 2 M - 1$ in base $B = 2 M + 1$, where $M = \| cal(A) \|$. Set

$ gamma \( w \) = sum_(j gt.eq 1) D \( w_j \) B^(- j) \, quad c \( alpha \) = sum_(j = 1)^(\| alpha \|) D \( alpha_j \) B^(- j) \, quad I \( alpha \) = \[ c \( alpha \) \, c \( alpha \) + B^(- \| alpha \|) \] . $

The identity $gamma \( alpha w \) = c \( alpha \) + B^(- \| alpha \|) gamma \( w \)$ and the gaps between digits prove unique decoding. Child intervals lie strictly inside the parent, so incompatible prefix cylinders have separated intervals even as closed sets.

Put $Omega = \( 0 \, 1 \)^2$ and $Omega_(-) = \( 0 \, 1 \/ 2 \) times \( 0 \, 1 \)$. If the labels number $N$, give label $ell_i$ a square $K_i$ of half-side $1 \/ \[ 16 \( N + 1 \) \]$, centered at height $i \/ \( N + 1 \)$ and first coordinate $3 \/ 4$ for terminal labels, $1 \/ 4$ otherwise. Let $Phi_i$ be the positive axis-preserving affine map of $\[ 0 \, 1 \]^2$ onto that square. The encoded state is $Phi_i \( gamma \( L \) \, gamma \( R \) \)$. A rule with prefixes $alpha \, beta$ and $alpha' \, beta'$ has rectangles

$ D_i = Phi_ell \( I \( alpha \) times I \( beta \) \) \, #h(2em) E_i = Phi_(ell') \( I \( alpha' \) times I \( beta' \) \) . $

Both families are separately disjoint by Lemma 8. Each source lies in $Omega_(-)$, and each target lies entirely in one open half of $Omega$. The positive diagonal affine map $D_i arrow.r E_i$ implements the prefix rule exactly. Its determinant is allowed to differ from one.

The shrink–move–expand interpolation also appears in the proof of #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Proposition 5.1; here we specify rational routes that preserve the required observation half-plane.

#thm([Lemma 6.3.])[
  #emph[Let $D_i \, E_i$, $1 lt.eq i lt.eq m$, be rational axis-aligned closed rectangles of positive side lengths. Suppose the $D_i$ are pairwise disjoint in $Omega_(-) = \( 0 \, 1 \/ 2 \) times \( 0 \, 1 \)$, the $E_i$ are pairwise disjoint in $Omega = \( 0 \, 1 \)^2$, and each $E_i$ lies entirely in one open half of $Omega$. There is an effective smooth field $v_(*) \( s \, Y \)$ supported in $\( 0 \, 1 \) times Omega$ whose time-one map on each full $D_i$ is its positive diagonal affine identification with $E_i$. If $E_i subset Omega_(-)$, the whole trajectory from $D_i$ remains in $Omega_(-)$. No incompressibility is asserted in this planar lemma.]
] <bcs:prefix-planar>

#proof[
  For an empty list take zero. Otherwise choose positive rational enlargement margins separately for the source and target families, preserving their disjointness and their open-half containment. Let $p_i \, q_i$ be their centers, and $r_i^D \, r_i^E$ their half-side vectors. Write $y_0 = min_i { p_(i \, 2) \, q_(i \, 2) }$ and choose temporary centers
  $ k_i = \( 1 \/ 8 \, med i y_0 \/ \[ 2 \( m + 1 \) \] \) \, #h(2em) 1 lt.eq i lt.eq m . $
  These are mutually distinct and lie below all source and target centers. Move $p_i$ to $k_i$ in increasing order, avoiding the centers $k_j$ with $j < i$ and $p_j$ with $j > i$. Then move $k_i$ to $q_i$ in increasing order, avoiding $q_j$ with $j < i$ and $k_j$ with $j > i$. Each first route stays in $Omega_(-)$; a second route stays there if its target does, and otherwise stays in $Omega$.
  Here is a finite rational rule for such a route. In its allowed rectangle $\( 0 \, b \) times \( 0 \, 1 \)$, choose a point $w$ at height $min \( p_2 \, q_2 \) \/ 2$, off every line from either endpoint to a forbidden center. No horizontal forbidden line has this height. Each nonhorizontal line has one computable rational intersection with it. Choose $w_1$ positive and smaller than $b$ and every positive intersection coordinate, for example half their positive minimum with $b$. The two segments $p$–$w$–$q$ stay in the allowed rectangle and avoid the forbidden centers.
  Choose a common rational $epsilon > 0$ equal to $1 \/ 20$ times the minimum of the rectangle half-sides, segment-endpoint boundary distances, and, for each segment $a$–$b$ and forbidden center $o$, $\| det \( b - a \, o - a \) \| \/ 2$; omit empty collections. Every included number is positive. Since segment lengths are less than two, the determinant quantity is a lower bound for the Euclidean distance to its line. The moving square of half-side $2 epsilon$ therefore misses every stationary square of half-side $epsilon$: an intersection would put their centers within $3 sqrt(2) epsilon$, contradicting this clearance. It also remains inside its allowed rectangle.
  Shrink each $D_i$ about $p_i$ to a square of half-side $epsilon$. To implement this, let $zeta$ be a smooth step constant near the endpoints of $\[ 0 \, 1 \]$, put
  $ A_i \( tau \) = \( 1 - zeta \( tau \) \) I + zeta \( tau \) "diag" \( \( epsilon \, epsilon \) \/ r_i^D \) \, $
  and multiply $A'_i A_i^(- 1) \( Y - p_i \)$ by a cutoff equal to one near $D_i$ and supported in its chosen enlargement. The cutoffs are disjoint, all diagonal entries are positive, and the exact path is $p_i + A_i \( tau \) \( Y - p_i \)$. The matrices shrink coordinatewise, so these paths stay in $D_i$.
  For each scheduled segment $a$–$b$, put $c \( tau \) = a + zeta \( tau \) \( b - a \)$ and use the translation field $c' \( tau \)$ times a cutoff which is one on a neighborhood of the moving square and supported in the concentric square of half-side $2 epsilon$. This translates that square exactly and vanishes on all held squares. After every small square has reached its target center, reverse the shrinking operation at each $q_i$ with matrices $\( 1 - zeta \) I + zeta "diag" \( r_i^E \/ \( epsilon \, epsilon \) \)$. Its paths remain in $E_i$.
  Each field vanishes near its phase endpoints. Rescale the finite list of $J$ phases $V_0 \, dots.h \, V_(J - 1)$ by $v_(*) \( s \) = J sum_j V_j \( J s - j \)$ to fit them in one time unit. The resulting map sends $p_i + xi$ to $q_i + "diag" \( r_i^E \/ r_i^D \) xi$, as required. Every stage obeys the indicated half-plane restriction. All cutoffs, paths, inverse diagonal lower bounds and derivative estimates are finite effective data. ◻
]

=== 6.3 Compensating the planar divergence <compensating-the-planar-divergence>

The rational initial code is denoted by $Z_(upright("in"))$. Its rationality follows from the finite input and the blank tail $D \( square.stroked.tiny \) \/ \( B - 1 \)$. Let $p_(*) = \( 1 \/ 4 \, 1 \/ 2 \)$ and load it along $c \( s \) = p_(*) + zeta \( s \) \( Z_(upright("in")) - p_(*) \)$. A translating bump supported in a sufficiently thin tube around this segment gives a field $v_(upright("in"))$ with precisely that trajectory. For instance, take the half-side of the moving square to be one quarter of the smaller endpoint distance from $partial Omega$, and take the same enlargement margin. Convexity keeps the support in $Omega$. A nonterminal loader stays in $Omega_(-)$; a terminal loader reaches the right half.

Extend $v_(*) \, v_(upright("in"))$ by zero in time and periodically in space, and define

$ v \( s \, Y \) = v_(upright("in")) \( s \, Y \) + sum_(n gt.eq 1) v_(*) \( s - n \, Y \) . $

All mixed derivatives are bounded because only one repeated phase template and one loader occur. At logical time $1 + n$, the trajectory from $p_(*)$ is the code after $n$ prefix steps, up to a terminal visit. The rectangle lemma proves absence of a right-half visit during every nonterminal transition as well as at its endpoints. Together with the finite-scan invariant, this gives the all-time halting equivalence.

Choose a periodic smooth function $eta \( z \)$ supported near $1 \/ 2$ which equals $z - 1 \/ 2$ on a neighborhood of $1 \/ 2$. Define

#[#set math.equation(numbering: n => "(11)")
 $ W \( s \, Y \, z \) = #scale(x: 120%, y: 120%)[\(] eta' \( z \) v \( s \, Y \) \, - eta \( z \) "div"_Y v \( s \, Y \) #scale(x: 120%, y: 120%)[\)] . $ <bcs:prefix-lift>]

The horizontal divergence and vertical derivative cancel. The spatial mean is zero: $integral eta' = 0$, and the integral of a periodic planar divergence is zero. At $z = 1 \/ 2$, the vertical component vanishes and the horizontal component is exactly $v$. Thus this plane carries the entire prescribed computation despite the planar area changes. The lift has bounded mixed derivatives and vanishes at logical time zero.

Apply Lemma 3 with $g \( t \) = log \( 1 + t \)$. The particle from $\( p_(*) \, 1 \/ 2 \)$ is $\( Y \( g \( t \) \) \, 1 \/ 2 \)$, so its prefix-step observations occur at $t = e^(1 + n) - 1$. Every finite logical time occurs at finite physical time, and the event equivalence is preserved. The lemma gives the exact derivative decay for the velocity and its residual, which has zero mean and pressure zero. Lemma 2 gives uniqueness on the torus.

For clarity, the optional solenoidal force changes pressure. Given the residual $f$, let $phi.alt$ be the zero-mean solution of $Delta phi.alt = "div" f$ and replace $\( f \, p \)$ by $\( f - nabla phi.alt \, - phi.alt \)$. This leaves $- nabla p + f$ and therefore the velocity unchanged. In Fourier variables,

$ phi.alt \( t \, x \) = - sum_(k eq.not 0) frac(i thin k dot.op hat(f)_k \( t \), 2 pi \| k \|^2) e^(2 pi i k dot.op x) . $

Integration by parts in a coordinate of maximal $\| k_l \|$ gives, for every $m$, $\| partial_t^j hat(f)_k \( t \) \| lt.eq C_(j \, m) \( 1 + t \)^(- 1 - j) \| k \|_oo^(- m)$. There are $24 r^2 + 2$ lattice points with $\| k \|_oo = r$. Choosing $m$ large proves uniform convergence after any fixed derivatives, retains the decay, and gives effective tails. Finite Fourier coefficients are effectively integrated using derivative bounds. Termwise differentiation gives the Poisson equation, with zero mode zero; uniqueness of Fourier coefficients on continuous periodic functions identifies it pointwise. Thus the projected force is effective, mean zero and divergence free. This is the classical Helmholtz–Leray projection, with its pressure correction explicit.

Finally all infinite sums used to prescribe the force are evaluated from finite supersets of possibly active translates, obtained from a coarse enclosure of the time and position. The elementary flat-step derivatives have effective bounds near their seams. Neither construction nor evaluation uses a configuration reached after initialization. This completes Theorem 7.

===== 6.3.1 Other onto clocks. <other-onto-clocks.>

The field $W$ in (11), including its loader, also satisfies Proposition 5. Using $\( 1 + t \)^(1 \/ 3) - 1$ or $\( 1 + t \)^(1 \/ 4) - 1$ therefore gives separate force choices with the same fixed label and detector. Every mixed derivative is respectively $O \( \( 1 + t \)^(- 2 \/ 3) \)$ or $O \( \( 1 + t \)^(- 3 \/ 4) \)$. After the loader, the code after $n$ prefix steps is sampled at $\( 2 + n \)^3 - 1$ or $\( 2 + n \)^4 - 1$. These assertions use the same full-domain instruction motion and the same all-time path bound.

== 7 A planar processor that leaves room for a spatial clock <bcs:expanded-section>

The compact scalar-potential lift and the prefix lift spend the third coordinate on separating branches or compensating area change. For a stationary spatial suspension we instead need the entire instruction motion in a plane. We construct it by moving disjoint rectangles to well-separated temporary positions, changing their shapes there, and routing them to the targets. Input-dependent placement makes the initial particle fixed, so no one-time loader interrupts periodicity.

Fix

$ c_L = \( 1 \/ 4 \, 1 \/ 4 \) \, quad c_R = \( 3 \/ 4 \, 1 \/ 4 \) \, quad X_(*) = \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \) \, quad cal(S) = { X in bb(T)^3 : 2 \/ 3 < X_1 < 5 \/ 6 } . $

We use the circle interpretation of the first-coordinate interval.

=== 7.1 A partial table with a recognizable inverse <a-partial-table-with-a-recognizable-inverse>

This construction retains an ordinary partial instruction table: the machine halts when its state and scanned letter have no instruction. The optional one-sided-tape convention of Section 4 is retained by including its immutable end-marker in the work alphabet and keeping the prescribed boundary actions; the recorder preserves that track. Let $Q$ be the finite state set, $A$ the work alphabet, $q_0$ the initial state, and $E subset Q times A$ the set of defined instructions, and write $e = \( q \, a \) mapsto \( q'_e \, b_e \, d_e \)$. Let

$ H_0 = { mono(u) \, mono(P) } union.sq { mono(r)_e : e in E } \, quad H_1 = H_0 \\ { mono(P) } \, quad Gamma = A times H_0 times { 0 \, 1 } . $

The extra tracks record instructions and mark the place to which the recorder must return, following the history principle of Bennett #cite(label("Bennett1973")). States are $sans(R u n)_q \, sans(T u r n)_q \, sans(B a c k)_q \, sans(S t o p)_q$ and $sans(M a r k)_e \, sans(S e e k)_e$. Put

$ \( tau_(q \, a) \, beta_(q \, a) \, mu_(q \, a) \) = cases(delim: "{", \( sans(M a r k)_(\( q \, a \)) \, b_(\( q \, a \)) \, d_(\( q \, a \)) \) \, & \( q \, a \) in E \,, \( sans(S t o p)_q \, a \, 0 \) \, & \( q \, a \) in.not E .) $

At a checkpoint $sans(R u n)_q$ after $k$ ordinary steps, the intended invariant has frontier $F = 2 + k$ at least two cells to the right of the head, records in cells $2 \, dots.h \, F - 1$, blank history elsewhere except at the frontier, and all bits zero. Here a defined work instruction moves the head first; the next row marks that new position, scans right to append the record and advance the frontier, then returns to erase the mark. This order restores the updated head position at the next checkpoint, as the proof below shows.

Use exactly the following seven rule families:

#[#set math.equation(numbering: n => "(12)")
 $ \( sans(R u n)_q \, \( a \, h \, 0 \) \) mapsto \( tau_(q \, a) \, \( beta_(q \, a) \, h \, 0 \) \, mu_(q \, a) \) \, & h in H_1 \,\
\( sans(M a r k)_e \, \( a \, h \, 0 \) \) mapsto \( sans(S e e k)_e \, \( a \, h \, 1 \) \, 1 \) \, & h in H_1 \,\
\( sans(S e e k)_e \, \( a \, h \, 0 \) \) mapsto \( sans(S e e k)_e \, \( a \, h \, 0 \) \, 1 \) \, & h in H_1 \,\
\( sans(S e e k)_e \, \( a \, mono(P) \, 0 \) \) mapsto \( sans(T u r n)_(q'_e) \, \( a \, mono(r)_e \, 0 \) \, 1 \) \,\
\( sans(T u r n)_q \, \( a \, mono(u) \, 0 \) \) mapsto \( sans(B a c k)_q \, \( a \, mono(P) \, 0 \) \, - 1 \) \,\
\( sans(B a c k)_q \, \( a \, h \, 0 \) \) mapsto \( sans(B a c k)_q \, \( a \, h \, 0 \) \, - 1 \) \, & h in H_1 \,\
\( sans(B a c k)_q \, \( a \, h \, 1 \) \) mapsto \( sans(R u n)_q \, \( a \, h \, 0 \) \, 0 \) \, & h in H_1 . $ <bcs:expanded-table>]

There are no rules out of a stop state. Initially the work tape is the finite input with blanks elsewhere, the head is at zero, every bit is zero, and the history has $mono(P)$ at cell $2$ and $mono(u)$ everywhere else.

#thm([Lemma 7.1.])[
  #emph[The initialized table reaches a stop state exactly when the ordinary partial-table machine halts. Otherwise it has defined transitions forever. On its full allowed domain, the destination state and full written symbol determine a unique incoming rule; the destination alone determines its displacement.]
] <bcs:expanded-compiler>

#proof[
  At a checkpoint $sans(R u n)_q$ after $k$ ordinary steps, the state, head $i$, and work tape agree with the machine. The frontier is at $F = 2 + k$, records occupy $2 \, dots.h \, F - 1$, history is empty elsewhere, all bits are zero, and $i lt.eq F - 2$. A defined instruction first updates the work and moves to $i' = i + d_e lt.eq F - 1$. The mark row marks $i'$, the right scan reaches $F$, writes its record and moves to $F + 1$. The turn row creates the new frontier and the backward scan finds the sole marked cell. Erasure restores the checkpoint invariant with $F$ increased by one. Each scan is finite. An undefined instruction enters a stop state by the first row, including at the initial configuration.
  Into $sans(M a r k)_e$, $e$ identifies the old state and work letter, and the written history letter distinguishes the variants. Into $sans(S e e k)_e$ the marked entry and unmarked loop both move right and have different written bits. Into $sans(T u r n)_q$ the record identifies $e$. Into $sans(B a c k)_q$ both arrivals move left; entry writes the frontier whereas the loop does not. Into $sans(R u n)_q$ the erasure row is the only type, and the written work and history letters recover its read symbol. Into $sans(S t o p)_q$ the unchanged letter identifies the old pair and the displacement is zero. Undoing that displacement and replacing the uniquely recovered read symbol reconstructs the full predecessor tape. ◻
]

=== 7.2 Coding a fixed starting point <coding-a-fixed-starting-point>

Give the $m = \| Gamma \|$ letters odd digits $D \( s \) = 1 \, 3 \, dots.h \, 2 m - 1$ in base $B = 2 m + 1$. Let

$ C \( s_1 s_2 dots.h.c \) = sum_(j gt.eq 1) D \( s_j \) B^(- j) \, #h(2em) I_s = \[ D \( s \) \/ B \, \( D \( s \) + 1 \) \/ B \] . $

A code lies strictly inside its first-letter interval, and successive stripping uniquely decodes it. The left and right tape lists have coordinates $xi = C \( s_(- 1) s_(- 2) dots.h.c \)$ and $eta = C \( s_0 s_1 dots.h.c \)$. For a rule $\( 𝜍 \, s \) mapsto \( tau \, s' \, d \)$ write $beta = \( D \( s' \) - D \( s \) \) \/ B$. Its normalized rectangles and maps are

#[#set math.equation(numbering: n => "(13)")
 $ d & upright("source") & \( xi \, eta \) mapsto\
0 & \[ 0 \, 1 \] times I_s & \( xi \, eta + beta \) \,\
1 & \[ 0 \, 1 \] times I_s & \( \( D \( s' \) + xi \) \/ B \, B eta - D \( s \) \) \,\
- 1 & I_l times I_s & \( B xi - D \( l \) \, \( D \( l \) + eta + beta \) \/ B \) \, quad l in Gamma . $ <bcs:expanded-branches>]

The image rectangles are $\[ 0 \, 1 \] times I_(s')$, $I_(s') times \[ 0 \, 1 \]$, and $\[ 0 \, 1 \] times \( D \( l \) \/ B + B^(- 1) I_(s') \)$, respectively. The digit identities prove that these are the correct tape maps, with determinant one and positive diagonal part $"diag" \( B^(- d) \, B^d \)$.

Let $K$ be the number of states and $N$ the number of split branches. They are positive, even if $E$ is empty, because the run-to-stop rules exist. Set

$ r = \[ 10^6 \( K + 1 \) \( N + 1 \) \( B + 1 \)^2 \]^(- 1) . $

Each state has a square $o_𝜍 + r \[ 0 \, 1 \]^2$, based near $c_R$ for stop states and near $c_L$ otherwise. If $\( xi_(*) \, eta_(*) \)$ is the rational initial tape code, set $o_(sans(R u n)_(q_0)) = c_L - r \( xi_(*) \, eta_(*) \)$. Enumerate the other states by $j = 1 \, dots.h \, K - 1$ and set their origins to their cluster base plus $\( 0 \, 3 j r \)$. These squares are separated by at least $r$ and lie within sup distance $\( 3 K + 1 \) r$ of their bases. The initial physical code is exactly $c_L$.

Write the resulting physical affine branches $T_i : R_i arrow.r R'_i$ with centers $p_i \, p'_i$ and linear parts $"diag" \( lambda_i \, lambda_i^(- 1) \)$. Distinct sources are separated by at least $r \/ B^2$. Images have the same separation: in a target state the displacement is fixed and written symbols distinguish incoming rules, by Lemma 10. For a left move, the two-digit target interval distinguishes $\( l \, s' \)$; its gaps are at least $B^(- 2)$. This is a full-rectangle separation statement. At checkpoints, the record block length also recovers $k$, hence the frontier’s absolute index $2 + k$ and the absolute head position.

=== 7.3 Routing full rectangles inside the plane <routing-full-rectangles-inside-the-plane>

Area-preserving realization of symbolic rectangle maps is central to the generalized-shift construction of Cardona, Miranda, Peralta-Salas and Presas #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Proposition 5.1. We give the full local construction needed here. Its quantitative collars and complete intermediate paths supply the later suspension and diffusion tests.

#thm([Lemma 7.2.])[
  #emph[There is an effective smooth planar Hamiltonian field $V \( s \, Y \)$, period one in $s$ and zero near each integer phase, with support in $\( 1 \/ 8 \, 7 \/ 8 \)^2$ and spatial mean zero, whose period map equals $T_i$ on each full $R_i$. All mixed derivatives have effective uniform bounds. A rectangle with a non-stop destination stays in $1 \/ 8 < Y_1 < 3 \/ 8$ throughout its transition. The trajectory from $c_L$ enters $2 \/ 3 < Y_1 < 5 \/ 6$ exactly when the machine halts, and a halting visit occurs at an integer phase.]
] <bcs:expanded-processor>

#proof[
  Put $A_0 = 100 B^2$ and expand source centers about $c_L$ to $P_i = c_L + A_0 \( p_i - c_L \)$. Expand each target center about its own cluster base $c$ to $P'_i = c + A_0 \( p'_i - c \)$. Within each family expanded centers are separated by at least $100 r$, and they remain within $1 \/ 1000$ of their cluster bases. Choose temporary centers $q_i = \( 1 \/ 4 \, 3 \/ 4 \) + \( 0 \, 100 i r \)$. They too have separation $100 r$, remain within $1 \/ 1000$ of $\( 1 \/ 4 \, 3 \/ 4 \)$, and are far from either cluster.
  Move the rectangles as
  $ K_i \( s \) = c_i \( s \) + "diag" \( theta_i \( s \) \, theta_i \( s \)^(- 1) \) \( R_i - p_i \) . $
  There are five operations: expand all source centers from $p_i$ to $P_i$ without changing shapes; move them one at a time to $q_i$; interpolate $theta_i$ positively from $1$ to $lambda_i$ there; move them one at a time to $P'_i$; and compress target centers about their cluster bases to $p'_i$. During the shape change each side length is monotone between its endpoint values and hence at most $r$.
  Figure 2 separates the roles of these five operations and shows the clearance used in the single-center moves below.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.86, 4.752), fill: rgb("#f5f5ff"), stroke: none)
  line((0, 0), (0, 4.752), (2.86, 0), (2.86, 4.752), stroke: (paint: rgb("#a6a6ff"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.434, 5.192), [#text(size: 9pt)[non-stop routes remain in#linebreak()$1"/"8<Y_1<3"/"8$]])
  rect((5.016, 0), (6.732, 4.752), fill: rgb("#ebf5eb"), stroke: none)
  content((5.878, 5.192), [#text(size: 9pt)[observed strip#linebreak()$2"/"3<Y_1<5"/"6$]])
  rect((1.98, 0.2112), (2.262, 0.396), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.121, 0.132), [#text(size: 9pt)[source#linebreak()$p_i$]], anchor: "north", padding: 0.1176cm)
  rect((2.068, 0.88), (2.35, 1.065), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.42, 0.968), [#text(size: 9pt)[$P_i$]], anchor: "west", padding: 0.1176cm)
  line((2.147, 0.4752), (2.2, 0.8008), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((2.438, 0.5544), [#text(size: 9pt)[1]], anchor: "west", padding: 0.1176cm)
  rect((0.616, 0.2112), (0.9504, 0.3696), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((0.7832, 0.132), [#text(size: 9pt)[target#linebreak()$p_i'$]], anchor: "north", padding: 0.1176cm)
  rect((0.5104, 0.88), (0.8448, 1.038), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((0.44, 0.9592), [#text(size: 9pt)[$P_i'$]], anchor: "east", padding: 0.1176cm)
  line((0.6864, 0.8008), (0.7744, 0.4488), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((0.528, 0.5544), [#text(size: 9pt)[5]], anchor: "east", padding: 0.1176cm)
  rect((1.672, 3.802), (1.954, 3.986), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.751, 3.678), (1.874, 4.11), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.628, 4.189), [#text(size: 9pt)[$q_i$]], anchor: "south", padding: 0.1176cm)
  content((1.98, 3.802), [#text(size: 9pt)[3]], anchor: "west", padding: 0.1176cm)
  rect((0.4576, 3.802), (0.7216, 3.995), fill: rgb("#dbdbdb"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((0.5896, 4.18), [#text(size: 9pt)[$q_j$]], anchor: "south", padding: 0.1176cm)
  line((2.209, 1.162), (2.209, 3.344), (1.918, 3.626), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((2.244, 2.508), [#text(size: 9pt)[2]], anchor: "west", padding: 0.1176cm)
  rect((0.5368, 1.628), (0.8008, 1.804), fill: rgb("#dbdbdb"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  rect((0.22, 1.285), (1.118, 2.147), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.132, 1.716), [#text(size: 9pt)[$P_j'$]], anchor: "east", padding: 0.1176cm)
  line((1.646, 3.731), (0.6688, 2.147), (1.118, 2.147), (1.118, 1.285), (0.6688, 1.285), (0.6688, 1.144), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((1.206, 1.716), [#text(size: 9pt)[4]], anchor: "west", padding: 0.1176cm)
  rect((2.341, 4.259), (2.605, 4.418), fill: rgb("#d9ecd9"), stroke: (paint: rgb("#003300"), thickness: 0.4pt, miter-limit: 10))
  content((2.64, 4.338), [#text(size: 9pt)[$q_k$]], anchor: "west", padding: 0.1176cm)
  line((2.64, 4.189), (5.896, 1.197), stroke: (paint: rgb("#003300"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003300"))))
  content((4.074, 2.71), [#box(inset: 0.04586cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(fill: rgb("#002d00"))[#text(size: 9pt)[4: a stop destination]]]])], angle: -35deg)
  rect((5.72, 0.8976), (6.054, 1.056), fill: rgb("#d9ecd9"), stroke: (paint: rgb("#003300"), thickness: 0.4pt, miter-limit: 10))
  content((6.142, 0.9768), [#text(size: 9pt)[$P_k'$]], anchor: "west", padding: 0.1176cm)
  line((5.896, 0.8008), (5.966, 0.4576), stroke: (paint: rgb("#003300"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003300"))))
  content((6.142, 0.572), [#text(size: 9pt)[5]], anchor: "west", padding: 0.1176cm)
  rect((5.799, 0.2112), (6.134, 0.3696), fill: rgb("#d9ecd9"), stroke: (paint: rgb("#003300"), thickness: 0.4pt, miter-limit: 10))
  content((5.966, 0.132), [#text(size: 9pt)[$p_k'$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.924), [#text(size: 8pt)[1: spread source centers 2: move to temporary centers#linebreak()3: change shape 4: move to expanded targets 5: compress target centers]], anchor: "north-west", padding: 0.1176cm)
  content((8.836, 5.352), [#text(size: 9pt)[one held rectangle#linebreak()during a center move]])
  rect((7.56, 0.828), (9.88, 3.148), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((8.575, 1.889), (8.865, 2.087), fill: rgb("#dbdbdb"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  circle((8.72, 1.988), radius: 0.0635, fill: black, stroke: none)
  content((8.929, 1.988), [#text(size: 9pt)[$o$]], anchor: "west", padding: 0.1176cm)
  line((8.72, 2.336), (9.88, 2.336), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((9.3, 2.336), [#text(size: 9pt)[$4r$]], anchor: "south", padding: 0.1176cm)
  line((6.98, 3.728), (7.56, 3.148), (9.88, 3.148), (9.88, 0.828), (10.46, 0.248), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  rect((9.741, 1.42), (10.02, 1.605), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((9.677, 1.356), (10.08, 1.669), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  circle((9.88, 1.512), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  content((10.29, 1.512), [#text(size: 8pt)[moving rectangle#linebreak()and its collar]], anchor: "west", padding: 0.1176cm)
  content((8.72, -0.187), [#text(size: 8pt)[sup-norm obstacle]])
})],
    caption: [Figure 2: Planar routing, shown schematically with the small clusters and rectangles magnified. A branch first moves to a temporary center, changes shape there, and then moves to its target. A non-stop branch remains in the left column; a branch with a stop destination may reach the observed strip. The gray rectangle at $P'_j$ has already reached its expanded target and is held during operation 4. The right inset distinguishes the center’s obstacle from the smaller held rectangle and the moving rectangle’s collar. Source and target clusters may overlap, and routes used at different times may cross. The proof supplies the quantitative separation and the schedule of moves; no distances are to scale. ],
  ) <fig:planar-routing>
  For a single-center move place a closed sup-norm square of radius $4 r$ about each stationary center. These obstacles are disjoint: held centers belong to a temporary family and one expanded family, whose members have the stated separation. The endpoints avoid them. Start with the straight segment between the endpoints. Replace every portion inside an obstacle by the clockwise route along its boundary. The original crossing portions are disjoint by convexity; a detour meets no other obstacle because the squares are disjoint. Tangencies require no detour. This gives a finite rational polygonal path at sup distance at least $4 r$ from each held center.
  The paths lie well within the unit chart. For a move from source to temporary center they stay near the column $Y_1 = 1 \/ 4$. A move from temporary center to a non-stop target has endpoints within $1 \/ 1000$ of this column; its straight segment cannot meet a right-cluster obstacle, and its detours remain within $1 \/ 1000 + 4 r$ of the column. Thus its entire rectangle stays in $\( 1 \/ 8 \, 3 \/ 8 \)$ in the first coordinate. Moves to stop targets may cross the observed strip, as they should.
  Divide $\[ 0 \, 1 \]$ into equal slots for all polygonal segments and each simultaneous expansion, shape change and compression. On each slot use the same smooth step $zeta$ in its local time $tau in \[ 0 \, 1 \]$ for all interpolated quantities: a center moving from $a$ to $b$ follows $a + zeta \( tau \) \( b - a \)$, and each $theta_i$ is interpolated with this step. In each simultaneous expansion or compression, center differences within a cluster are therefore multiplied by one common factor in $\[ 1 \, A_0 \]$. These paths glue smoothly, and $theta_i gt.eq B^(- 1)$. Put $epsilon = r \/ \( 10 B^2 \)$. The $epsilon$-enlargements of $K_i \( s \)$ remain disjoint. During source expansion, and during target compression within either cluster, a separating center difference is multiplied by a factor at least one while the rectangle sizes stay fixed.
  For targets in different clusters, both centers stay within sup distance $1 \/ 1000$ of their respective bases throughout compression. Their enlarged rectangles therefore have first-coordinate gap at least
  $ 1 \/ 2 - 2 \/ 1000 - r - 2 epsilon > 0.49 . $
  During routing the clearance $4 r$ exceeds the sum of half-sides and collars; at temporary positions the separation is $100 r$. They lie in $\( 1 \/ 8 \, 7 \/ 8 \)^2$.
  Choose a smooth product cutoff $chi_i \( s \, Y \)$ equal to one on the $epsilon \/ 2$ enlargement and zero outside the $epsilon$ enlargement. With $Z = Y - c_i$ and $a_i = dot(theta)_i \/ theta_i$, define
  $ psi_i = chi_i \( dot(c)_(i \, 1) Z_2 - dot(c)_(i \, 2) Z_1 + a_i Z_1 Z_2 \) \, #h(2em) V = sum_i \( partial_2 psi_i \, - partial_1 psi_i \) . $
  On $K_i \( s \)$ this is exactly the affine velocity $dot(c)_i + "diag" \( a_i \, - a_i \) \( Y - c_i \)$. Consequently the trajectory of every $Y_0 in R_i$ is $c_i \( s \) + "diag" \( theta_i \, theta_i^(- 1) \) \( Y_0 - p_i \)$ and ends at $T_i \( Y_0 \)$. Disjoint collars eliminate interference. The compactly supported stream functions make the field divergence free with zero mean. Their vanishing time collars give a smooth periodic extension.
  At integer phases the point from $c_L$ follows the table by induction. A stop code is near $c_R$ and lies in the strip; on a nonhalting run every destination is non-stop and the full continuous trajectory remains in the left column. Finally the finite rational geometry, positive denominator bound and explicit smooth cutoffs provide effective bounds at every derivative order, without executing the encoded machine. ◻
]

The same construction supplies the estimates needed for diffusion. Choose an effective integer $L gt.eq 1$ bounding the first and second spatial derivative operator norms of $V$, and put $R = 4^L$. If $Psi_s$ is its flow from phase zero, then for $0 lt.eq s lt.eq n$,

#[#set math.equation(numbering: n => "(14)")
 $ parallel D Psi_s^(plus.minus 1) parallel_oo lt.eq e^(L n) lt.eq R^n \, #h(2em) parallel D^2 Psi_s^(plus.minus 1) parallel_oo lt.eq n L e^(3 L n) lt.eq n L R^(3 n) . $ <bcs:expanded-variation>]

Indeed the first variation equation has coefficient norm at most $L$. The second has the same linear coefficient, zero initial data, and forcing at most $L$ times the square of the first variation; variation of constants gives the bound. The reversed-time field has the same spatial derivative bounds, proving the inverse estimates as well.

=== 7.4 Periodic and eventually stationary forcing <periodic-and-eventually-stationary-forcing>

#thm([Proposition 7.3.])[
  #emph[For each fixed computable $nu > 0$, the machine and input effectively determine a smooth period-one mean-zero force on $bb(T)^3$, all of whose derivatives are bounded, such that the solution from zero velocity has its particle from $X_(*)$ enter $cal(S)$ exactly when the machine halts. A separate choice of force is stationary for $t gt.eq 1$, also with bounded derivatives and the same fixed event. Both constructions have pressure zero. The stationary choice has a generally nonzero mean force during startup.]
] <bcs:expanded-material>

#proof[
  For the periodic choice take $U \( t \, X \) = \( V \( t \, \( X_1 \, X_2 \) \) \, 0 \)$ and its residual. The phase collar makes $U \( 0 \) = 0$. Its mean is zero, all derivatives are bounded, and the fixed particle has constant third coordinate $1 \/ 4$. Lemma 11 proves the event; Lemma 2 gives uniqueness. The optional torus projection may make this periodic force solenoidal, with its accompanying pressure change.
  Spatial suspension is the standard way to turn a periodic motion into an autonomous one; see Moore #cite(label("Moore1991")) Section 6 and the geometric construction in #cite(label("CardonaMirandaPeraltaSalasPresas2021")) Theorem 3.1. In the present flat coordinates the formula and its startup mean are explicit. For the stationary choice put
  $ Z \( X \) = \( V \( X_3 - 1 \/ 4 \, \( X_1 \, X_2 \) \) \, 1 \) \, #h(2em) U \( t \, X \) = sigma \( t \) Z \( X \) . $
  Periodicity in the phase makes $Z$ smooth on the torus, and its divergence is zero. Its residual is $sigma' Z + sigma^2 \( Z dot.op nabla \) Z - nu sigma Delta Z$, which is stationary after time one. Set $s \( t \) = integral_0^t sigma$. The particle’s third coordinate is $1 \/ 4 + s \( t \)$ modulo one, and its planar coordinates are $Psi_(s \( t \)) \( c_L \)$. The clock is onto, so the same event equivalence follows. Here $integral Z = \( 0 \, 0 \, 1 \)$, hence
  $ integral U = \( 0 \, 0 \, sigma \( t \) \) \, #h(2em) integral f = \( 0 \, 0 \, sigma' \( t \) \) . $
  The vertical startup acceleration therefore contributes the mean force shown above; after startup that mean is zero. ◻
]

=== 7.5 A velocity threshold for the same strip <bcs:expanded-diffusion>

The injection, stirring and waiting theorem in #cite(label("velocity2026")) Theorem 3.1 applies to this planar field. Each block injects a fresh narrow scalar bump near $c_L$, carries it through $n$ processor periods in a short physical interval, and then lets heat diffuse during a long wait. The short stirring time keeps the new bump close in height to its transported profile; its small mass and the waits keep old injections below the detection threshold. The scalar becomes the third velocity component, so a visit of a transported bump to the strip yields a velocity-field observation. We now state the exact substitution and the bounds supplied by that theorem.

Take its initial point to be $c_L$, its observed planar set to be $E = { 2 \/ 3 < Y_1 < 5 \/ 6 }$, and its constants to be $d = 1 \/ 16$ and $C_H = 10^8$. The field $V$ is Hamiltonian, smooth, period one, has zero phase collars and a fixed compact chart support. Lemma 11 gives a terminal integer-phase visit, which is precisely the companion theorem’s halting hypothesis; the constant $d$ controls the nonhalting separation below. In a nonhalting run the trajectory lies in $1 \/ 8 < Y_1 < 3 \/ 8$, whose infimum circle distance from the observed arc is

$ min { 2 \/ 3 - 3 \/ 8 \, med 1 + 1 \/ 8 - 5 \/ 6 } = 7 \/ 24 > 2 d . $

Thus the whole nonhalting orbit has distance at least $7 \/ 24 > 2 d$ from $E$. Equation (14) supplies the effective forward and inverse first and second derivative bounds. These verify every geometric hypothesis of the parameterized compact detector theorem.

For specificity, its unit-viscosity construction uses $R = 4^L$, a smooth bump $g$ supported in $\[ - 1 \, 1 \]^2$, equal to one near zero and between zero and one, and a bound $C gt.eq 1$ on its first two derivative operator norms. All derivative norms here are Euclidean operator norms, as in the companion theorem. Its parameters here are

$ b_n & = 10^(- 6) \( 2 R \)^(- n) \, & g_n \( Y \) & = g \( \( Y - c_L \) \/ b_n \) \,\
D_n & = 2 C b_n^(- 2) \( 1 + n L \) R^(3 n) \, & delta_n & = \[ 100 \( 1 + D_n \) \]^(- 1) \, #h(2em) t_n = 2 n . $

Here $D_n$ bounds the Laplacian of the bump after transport through at most $n$ periods; the choice of $delta_n$ controls the accumulated diffusion error. If $V_0$ is one period extended by zero, the prescribed horizontal field and scalar source are

$ a \( t \, Y \) = sum_(n gt.eq 1) n / delta_n sum_(j = 0)^(n - 1) V_0 (frac(n \( t - t_n - delta_n \), delta_n) - j \, Y) \, #h(2em) h \( t \, Y \) = sum_(n gt.eq 1) delta_n^(- 1) sigma' \( \( t - t_n \) \/ delta_n \) g_n \( Y \) . $

Let $F = a_t + \( a dot.op nabla \) a - Delta a$. The force is the precomputed pair $\( F \, h \)$; the unknown transported scalar is absent from it. The theorem supplies the scalar $w$ solving $w_t + a dot.op nabla w = Delta w + h$, $w \( 0 \) = 0$, and the velocity $\( a \, w \)$ with pressure zero. In this specialization, the total injected mass is bounded by $M_0$, with

$ M_0 = sum_(n gt.eq 1) 4 b_n^2 < 10^(- 11) \, #h(2em) 2 delta_n D_n < 1 \/ 50 < 1 \/ 16 \, #h(2em) 2 - 2 delta_n > 1 . $

The companion theorem uses these inequalities with the off-diagonal heat bound $C_H = 10^8$ at separation $1 \/ 16$. It proves an all-time velocity threshold, including the waits between bursts, rather than only a sampled-time statement.

#thm([Corollary 7.4.])[
  #emph[For fixed computable $nu > 0$, the machine and input effectively determine a smooth prescribed force on $\[ 0 \, oo \) times bb(T)^3$, whose unique global smooth solution from zero velocity and with pressure zero satisfies 
$ exists t gt.eq 0 med exists X in cal(S) : med u_3 \( t \, X \) > 1 \/ 2 quad arrow.l.r.double quad upright("the machine halts") . $

 Uniqueness holds in the torus classical comparison class of Section 2: the velocity, its time derivative and spatial derivatives through order two are continuous on each finite closed cylinder, and the periodic pressure and its gradient are continuous, with mean-zero pressure normalization. No uniform large-time amplitude bound or mean-zero condition is asserted for this force.]
] <bcs:expanded-eulerian>

#proof[
  The verified substitution in #cite(label("velocity2026")) Theorem 3.1 gives the unit-viscosity assertion. For general viscosity set
  $ U_nu \( t \, Y \, z \) = \( nu a \( nu t \, Y \) \, w \( nu t \, Y \) \) \, #h(2em) f_nu \( t \, Y \, z \) = \( nu^2 F \( nu t \, Y \) \, nu h \( nu t \, Y \) \) . $
  Independence of $z$ makes each horizontal equation acquire factor $nu^2$ and the scalar equation factor $nu$. Thus the equations have viscosity $nu$ and pressure zero, while the observed third component keeps threshold $1 \/ 2$. Finite-time smoothness, effectivity and uniqueness are exactly the conclusions of the invoked detector theorem and Lemma 2. ◻
]

===== 7.5.1 The material event during the diffusion experiment. <the-material-event-during-the-diffusion-experiment.>

The same force also retains the fixed material event from $X_(*)$. At unit viscosity, block $n$ advances the horizontal flow through $n$ full processor periods and each gap freezes the horizontal position. Let $S \( t \)$ be the cumulative processor time: it is zero before the first stirring interval, increases from $n \( n - 1 \) \/ 2$ to $n \( n + 1 \) \/ 2$ in block $n$, and is constant between stirring intervals. More explicitly, in the stirring interval of block $n$ put

$ tau = frac(n \( t - t_n - delta_n \), delta_n) in \[ 0 \, n \] \, #h(2em) S \( t \) = frac(n \( n - 1 \), 2) + tau . $

The preceding cumulative phase is an integer. Periodicity gives $V \( tau \, Y \) = V \( S \( t \) \, Y \)$, so $a \( t \, Y \) = S' \( t \) V \( S \( t \) \, Y \)$ inside each burst. During injections and waits, $a = 0$ and $S$ is constant. The zero phase collars and continuity join these identities at the endpoints. Uniqueness therefore gives the horizontal trajectory $Psi_(S \( t \)) \( c_L \)$, including partial bursts. The horizontal field is independent of the third coordinate, so the vertical motion driven by $w$ does not change this identity. The function $S$ is continuous, nondecreasing, finite at finite time, and unbounded. Lemma 11 therefore proves entry into the original strip exactly on halting, including throughout the bursts and gaps. At viscosity $nu$, use $S \( nu t \)$. The scalar injections independently begin at $c_L$ and test successively longer prefixes; they do not reset the material trajectory.

== 8 The decision consequence and exact observation <sec:decision>

#thm([Corollary 8.1.])[
  #emph[There is no algorithm deciding the fixed material reachability event from every force description produced by Theorem 1. The same conclusion holds separately for the force descriptions and fixed observations of Theorem 7, Proposition 12, and Corollary 13.]
]

#proof[
  Compose a proposed decision algorithm with the effective construction from a machine and input. The proved equivalence between the event and halting would decide whether that arbitrary machine halts. Turing’s symbol-printing undecidability gives the contradiction after the elementary modification described in the introduction #cite(label("Turing1936")) Section 8. ◻
]

The constructions use exact real positions and exact force prescriptions. Their conclusions concern the complete trajectory or velocity at every real time. A uniform tolerance for perturbing the program, the field or the observed coordinates is a separate requirement. Likewise, an onto slowdown preserves every finite computational step but does not furnish faster-than-every-power decay for an arbitrary periodic mechanism. These distinctions specify what the fixed detectors and slow clocks prove.


#bibliography("refs.bib", style: "ieee", title: [References])
