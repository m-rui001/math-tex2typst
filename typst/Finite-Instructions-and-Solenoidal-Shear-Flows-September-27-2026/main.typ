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

#align(center)[#text(size: 16pt, weight: "bold")[Finite Instructions and Solenoidal Shear Flows]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 From finite instructions to a fluid experiment <sec:intro>

A local machine instruction changes finitely many symbols, but its smooth realization must move every nearby point consistently. There are two obstacles. An irreversible instruction may merge distinct inputs, whereas a smooth flow has an injective time map. Even after the instruction is made reversible, a source rectangle can overlap another instruction’s destination. The first obstacle asks for retained history; the second asks for an order of geometric operations that does not disturb data waiting to move.

Information retention is the classical basis of reversible simulation. Landauer discusses its logical role [5] Section 3, and Bennett records the index of the instruction just performed on a history tape [1] Eqs. (9)–(11). We use that principle in a one-head recorder with a finite transition table, a moving history frontier, and a temporary return mark. We prove the full-domain inverse of our particular local table explicitly. Moore’s generalized shifts [7] provide the positional-coding viewpoint: tape prefixes become separated real intervals, and head moves become affine expansions and contractions. Here the exact closed rectangles, their gaps, and the entire continuous motion are also part of the argument.

Fluid realizations of computation have a geometric history as well. Cardona, Miranda, Peralta-Salas and Presas construct stationary Euler computation on an adapted Riemannian three-sphere, using an area-preserving realization of generalized shifts [3]. Their neighborhood contraction, transport, and expansion in Proposition 5.1 is a related geometric predecessor. For the Euclidean metric, Cardona, Miranda and Peralta-Salas construct Turing-complete Beltrami fields on $bb(R)^3$; their universal construction uses a noncompact invariant set and has infinite energy. They also obtain robust simulations of tape-bounded machines on the flat three-torus [2]. Dyhr, González-Prieto, Miranda and Peralta-Salas obtain stationary unforced viscous computation after a metric deformation, using Hodge viscosity [4]. Our flat metric and zero initial velocity are fixed; the machine enters a prescribed external force. The affine shear paths and their observer bounds are proved here, with no import of the predecessors’ geometric or analytic conclusions.

Our construction follows one complete path from an ordinary machine to a forced fluid. Each auxiliary instruction becomes a reciprocal planar affine map. Separate heights let all branches execute their affine changes without interference: lift, apply four shears, translate, and lower. At any one time the velocity is transverse to its own spatial variation. Its convective acceleration therefore vanishes, which gives a solenoidal force with pressure zero directly. A separate initialization transports the same fixed particle to the rational input code. The finite mechanism is then repeated.

The flat metric, positive viscosity, zero fluid data, particle label, and observation strip are all fixed before the machine and input are supplied. The force depends on the finite table and finite input. This is a forced reachability construction; the prescribed velocity supplies existence, and an energy comparison supplies uniqueness for those data. The encoding uses exact real coordinates and makes no finite-precision robustness assertion. The existence result concerns this constructed family of forces, not regularity for arbitrary Navier–Stokes data.

Write $bb(T)_L^3 = \( bb(R) \/ L bb(Z) \)^3$. We use

#[#set math.equation(numbering: n => "(1)")
 $ u_t + \( u dot.op nabla \) u = - nabla p + nu Delta u + f \, #h(2em) "div" u = 0 \, #h(2em) u \( 0 \) = 0 . $ <eq:NS>]

Pressure is spatially periodic and has mean zero. A classical competitor on a torus has continuous $u \, u_t$, spatial derivatives of $u$ through order two, and $p \, nabla p$ on every finite closed time cylinder. The material position of label $a$ solves $dot(X) = u \( t \, X \)$, $X \( 0 \) = a$. An effective prescription evaluates each requested mixed derivative at computably supplied arguments to prescribed rational error, with effective bounds on compact sets. It specifies every instruction branch, without first running and replaying the distinguished computation.

#thm([Theorem 1.1.])[
  (Initialized computation by a solenoidal force).  #emph[Fix a positive computable viscosity $nu$ on the unit flat torus $bb(T)^3$. There is an algorithm taking a deterministic one-tape machine $M$ with head moves in ${ - 1 \, 0 \, 1 }$ and a finite input word $w$ to an effective smooth force $f_(M \, w)$ with these properties.]
  + #emph[The force is divergence free and has zero spatial mean. Equation (1) has a global smooth solution $\( u \, p \) = \( U \, 0 \)$, unique in the classical class just specified on every finite time interval.]
  + #emph[All mixed derivatives of $U$ and $f_(M \, w)$ are globally bounded, and the kinetic energy is uniformly bounded. Both fields have period one for $t gt.eq 1$ and vanish on a neighborhood of every integer time. The period-one mechanism after initialization depends on $M$ alone.]
  + #emph[With fixed label $a_(*) = \( 1 \/ 8 \, 3 \/ 8 \, 1 \/ 2 \)$ and fixed open strip $O = { \( x \, y \, z \) : 1 \/ 2 < x < 1 }$, the trajectory enters $O$ at a finite time if and only if $M$ halts on $w$, including an initially halted machine.]
  #emph[For arbitrary fixed real $nu > 0$, the same formulas and conclusions hold; the evaluation algorithm is then relative to that parameter.]
] <thm:initialized>

Section 2 constructs the reversible instruction table and proves that each original step takes finitely many positive microsteps. Section 3 gives the full-rectangle shear construction and its intermediate-time bound. Section 4 proves the exact radix interface, initializes the fixed particle, and completes Theorem 1. The mathematical input and output of each step are thus available within this paper. Section 5 then records optional changes to the recorder and the shear schedule.

== 2 A recorder with an inverse on its full domain <sec:recorder>

We use a two-sided tape indexed by $bb(Z)$. A configuration consists of a control state, a head position, and a tape. A local transition reads the symbol at the head, replaces it, changes the control, and moves the head. The transition is #emph[partial]: combinations not listed in its table have no successor. Our first objective is a table with enough local information to reconstruct each predecessor.

Let $Q$ be a finite state set, let $H subset.eq Q$ be the halting states, and let $Sigma$ be a finite work alphabet with a specified blank symbol $square.stroked.tiny in Sigma$. Suppose that every nonhalting pair has an instruction

$ r = \( q \, a \) \, #h(2em) delta \( q \, a \) = \( q_r \, b_r \, d_r \) \, #h(2em) d_r in { - 1 \, 0 \, 1 } . $

There are no instructions from $H$. To normalize a missing instruction, adjoin a halting state $q_(upright("stop"))$ and put $delta \( q \, a \) = \( q_(upright("stop")) \, a \, 0 \)$ at each missing pair. Hereafter the given machine is this normalized machine. Define

$ cal(R) = \( Q \\ H \) times Sigma \, #h(2em) cal(G) = { E \, P } union.sq { \[ r \] : r in cal(R) } . $

The history symbol $E$ means empty; $P$ is the frontier of the recorded instructions. A complete tape symbol is $\( a \, ell \, m \) in Sigma times cal(G) times { 0 \, 1 }$. The bit $m$ marks the position to which the head must return. The symbol $\[ r \]$ plays the role of Bennett’s instruction record [1] Eqs. (9)–(11); the frontier and return mark implement the recording with one head. The new control states are the distinct symbols $S_q \, F_q \, L_q$ for $q in Q$ and $A_r \, R_r$ for $r in cal(R)$. Controls $S_q$ will be the checkpoints at which the original work configuration is recovered.

#thm([Lemma 2.1.])[
  (Finite recording table).  #emph[For the machine just specified there is a finite partial one-head transition table satisfying these properties on its entire allowed domain:]
  + #emph[Each destination control has a fixed incoming displacement.]
  + #emph[The destination control and the written complete symbol determine the preceding control and the read complete symbol.]
  #emph[Initialize its work track with a prescribed finite input, its head at zero, and its control at $S_q$, where $q$ is the original initial state. For any integer $r_0 gt.eq 2$, put the history frontier at $r_0$, empty history elsewhere, and mark zero at every cell. At the $n$th checkpoint it represents exactly the original configuration after $n$ instructions, and its frontier is at $r_0 + n$. If that original instruction has next head position $h'$, the next checkpoint is reached after exactly 
#[#set math.equation(numbering: n => "(2)")
 $ 2 \( r_0 + n - h' \) + 4 $ <eq:count>]

 local transitions. A nonhalting original run gives an indefinitely defined recorder run, and a halting checkpoint is reached exactly when the original machine halts.]
] <lem:recorder>

#proof[
  The construction has seven kinds of transition. We first check their inverse without using any assumptions on the tape. We then prove that the chosen initialization passes through the required checkpoints.
  Here is the intended cycle on an initialized tape. At a checkpoint the work configuration agrees with the original machine, all return marks vanish, and the history frontier lies strictly to the right of the work head. The control $S_q$ performs the work instruction; $A_r$ marks the new head position; $R_r$ scans right and records that instruction at the frontier; $F_(q_r)$ advances the frontier by one cell; and $L_(q_r)$ scans left to the mark, clears it, and returns to the next checkpoint. This invariant guides the construction. The table guards and the inverse argument below apply more broadly, to every allowed tape.
  In the table below, #emph[every] occurrence of $ell$ requires $ell eq.not P$. The symbol $c$ ranges over $Sigma$, the first row ranges over $r in cal(R)$, and the other indices range over their declared sets. These are all the rules.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Read control and symbol
], table.cell(rowspan: 1, colspan: 1)[New control and symbol
], table.cell(rowspan: 1, colspan: 1)[Move
]),
  table.cell(rowspan: 1, colspan: 1)[$S_q \, \( a \, ell \, 0 \)$, $r = \( q \, a \)$
], table.cell(rowspan: 1, colspan: 1)[$A_r \, \( b_r \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$d_r$
],
  table.cell(rowspan: 1, colspan: 1)[$A_r \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$R_r \, \( c \, ell \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$+ 1$
],
  table.cell(rowspan: 1, colspan: 1)[$R_r \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$R_r \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$+ 1$
],
  table.cell(rowspan: 1, colspan: 1)[$R_r \, \( c \, P \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$F_(q_r) \, \( c \, \[ r \] \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$+ 1$
],
  table.cell(rowspan: 1, colspan: 1)[$F_q \, \( c \, E \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$L_q \, \( c \, P \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
],
  table.cell(rowspan: 1, colspan: 1)[$L_q \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$L_q \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
],
  table.cell(rowspan: 1, colspan: 1)[$L_q \, \( c \, ell \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$S_q \, \( c \, ell \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
)
]
  These guards define the full transition domain; they are not assumptions only about tapes reached during a computation.
  The incoming displacement is $d_r$ at $A_r$, $+ 1$ at $R_r$ and $F_q$, $- 1$ at $L_q$, and zero at $S_q$. Undo this displacement to find the cell that was written. Its complete symbol identifies the predecessor as follows.
  - At $A_r$, the record $r = \( q \, a \)$ supplies the previous control and overwritten work symbol. History was preserved and the previous mark was zero.
  - At $R_r$, written mark one identifies the entry from $A_r$; written mark zero identifies the scan loop. The other symbol components were preserved.
  - At $F_q$, the written record $\[ r \]$ identifies the preceding control $R_r$; the read history symbol was $P$.
  - At $L_q$, written history $P$ identifies entry from $F_q$, whose read history was $E$. A scan loop writes history different from $P$.
  - At $S_q$, only the last row enters. Its inverse restores mark one and changes the control to $L_q$.
  In particular the two possible entries into $R_r$ have disjoint written symbols: entry from $A_r$ writes mark one, whereas the loop writes mark zero. Likewise entry from $F_q$ into $L_q$ writes history $P$, whereas an $L_q$ loop writes history different from $P$. These distinctions apply to arbitrary allowed tapes, not only to those satisfying the checkpoint invariant. Thus the preceding complete symbol is reconstructed in every case. Together with the incoming displacement, this reconstructs the entire predecessor configuration on every allowed tape and proves both local properties.
  It remains to show that this reversible table performs the original work. We prove by induction that, at checkpoint $n$, the work state, tape, and head $h_n$ agree with the original machine; $\| h_n \| lt.eq n$; all marks vanish; records occupy precisely the cells $r_0 \, dots.h \, r_0 + n - 1$; and the frontier is at $g = r_0 + n$. The assertion holds initially.
  For a nonhalting instruction, the first row makes exactly the prescribed work write and move. The resulting head position satisfies
  $ h' = h_n + d_r lt.eq n + 1 < r_0 + n = g . $
  The second row marks $h'$ and starts the scan to the right. There is no other mark and no frontier before $g$. The scan therefore reaches $g$, replaces $P$ by $\[ r \]$, and steps into the empty cell $g + 1$. The fifth row puts the new frontier there and starts the return scan. On reaching the unique mark at $h'$, the last row clears it and enters $S_(q_r)$ without moving the work head. Every required rule is defined, and the checkpoint invariant is restored.
  There are $g - h' - 1$ right-loop transitions, $g - h'$ left-loop transitions, and five other transitions. This gives (2), which is positive and finite. Induction proves continued execution of every nonhalting run. The run reaches a halting checkpoint precisely when its control is $S_q$ with $q in H$, including the possibility that the original initial state is halting. ◻
]

== 3 A smooth realization by seven shear stages <sec:shears>

The input to this section is geometric rather than symbolic. We prescribe the action on whole rectangles, including their boundaries. The source rectangles must be mutually separated, and so must the targets; a source may intersect a target because the two families will be used at different times.

=== 3.1 The excursion estimate <the-excursion-estimate>

The only linear maps needed here expand one coordinate by exactly the factor by which they contract the other. Let

$ sans(X) \( a \) \( r \, s \) = \( r + a s \, s \) \, #h(2em) sans(Y) \( a \) \( r \, s \) = \( r \, s + a r \) . $

Each is the unit-time map of a shear. The following estimate uses the sizes of the initial and final offsets, rather than the norms of the four shear matrices separately.

#thm([Lemma 3.1.])[
  #emph[Let $lambda \, h > 0$ and suppose that 
$ \| r \| \, med \| s \| \, med \| lambda r \| \, med \| s \/ lambda \| lt.eq h . $

 The four shears, in chronological order, 
#[#set math.equation(numbering: n => "(3)")
 $ sans(Y) \( - lambda \) \, quad sans(X) \( lambda^(- 1) - 1 \) \, quad sans(Y) \( 1 \) \, quad sans(X) \( lambda - 1 \) $ <eq:shears>]

 send $\( r \, s \)$ to $\( lambda r \, s \/ lambda \)$. At every intermediate endpoint, and throughout every partially completed shear, both coordinates have absolute value at most $2 h$.]
] <lem:excursion>

#proof[
  The successive endpoints are
  $ \( r \, s \) & mapsto \( r \, s - lambda r \)\
 & mapsto #scale(x: 120%, y: 120%)[\(] lambda r + \( lambda^(- 1) - 1 \) s \, s - lambda r #scale(x: 120%, y: 120%)[\)]\
 & mapsto #scale(x: 120%, y: 120%)[\(] lambda r + \( lambda^(- 1) - 1 \) s \, s \/ lambda #scale(x: 120%, y: 120%)[\)]\
 & mapsto \( lambda r \, s \/ lambda \) . $
  The second coordinates are bounded by $2 h$. Positivity of $lambda$ gives
  $ \| \( lambda^(- 1) - 1 \) s \| = \| \| s \| \/ lambda - \| s \| #scale(x: 120%, y: 120%)[\|] lt.eq max { \| s \| \/ lambda \, \| s \| } lt.eq h \, $
  so the same bound holds for the first coordinates. A partial shear follows the segment between two consecutive endpoints; the square $\[ - 2 h \, 2 h \]^2$ is convex. ◻
]

=== 3.2 The realization theorem <the-realization-theorem>

Write $bb(T)_L^3 = \( bb(R) \/ L bb(Z) \)^3$, where $L > 0$ is rational. In each coordinate circle choose an open coordinate interval with rational endpoints and length less than $L$. All coordinates below refer to these fixed charts, so their straight segments have an unambiguous meaning.

#thm([Theorem 3.2.])[
  (Reciprocal affine maps by shears).  #emph[For $1 lt.eq i lt.eq N$, let $P_i \, Q_i$ be closed axis-parallel rectangles with rational endpoints and positive side lengths in the planar chart of $bb(T)_L^3$. Let their centers be $p_i \, q_i$, and suppose 
$ F_i \( X \) = q_i + "diag" \( lambda_i \, lambda_i^(- 1) \) \( X - p_i \) \, quad F_i \( P_i \) = Q_i \, quad lambda_i in bb(Q)_(> 0) . $

 Assume the following:]
  + #emph[The $P_i$ are pairwise positively separated, and the $Q_i$ are pairwise positively separated.]
  + #emph[Every coordinate half-width of every $P_i$ and $Q_i$ is at most a given rational $h > 0$.]
  + #emph[All $p_i \, q_i$ belong to a closed rectangle $K$ with rational endpoints, and $K + \[ - 2 h \, 2 h \]^2$ is compactly contained in the planar chart.]
  + #emph[The coding height $z_0$ is rational and lies inside the vertical chart.]
  #emph[There is an effectively constructed smooth velocity $V$ on $bb(R) times bb(T)_L^3$ with the following properties.]
  + #emph[It is one-periodic in time and vanishes near every integer time. Every mixed space and time derivative has an effective uniform bound.]
  + #emph[$"div" V = 0$, $integral_(bb(T)_L^3) V = 0$, and $\( V dot.op nabla \) V = 0$.]
  + #emph[Its period map is $\( X \, z \) mapsto \( F_i \( X \) \, z \)$ on an effectively specified positive neighborhood of each $P_i times { z_0 }$.]
  + #emph[Starting from $\( X \, z_0 \)$ with $X in P_i$, the four scaling stages stay within horizontal sup distance $2 h$ of $p_i$. The next stage follows $\( \( 1 - theta \) p_i + theta q_i \) + d$, where $0 lt.eq theta lt.eq 1$ and $\| d \|_oo lt.eq h$. The lifting and lowering stages leave $X$ unchanged.]
  + #emph[For each fixed positive computable $nu$, the force $f = partial_t V - nu Delta V$ is smooth, mean zero, and solenoidal, with period one and bounded mixed derivatives. Equation (1) from zero initial velocity has the solution $\( u \, p \) = \( V \, 0 \)$, with uniformly bounded kinetic energy. This solution is unique among spatially periodic classical solutions for which $u$, its spatial derivatives through order two, $u_t$, $p$, and $nabla p$ are continuous on each finite closed time cylinder, and $p$ has zero spatial mean at each time.]
  #emph[No separation between a source and a target is required. For $N = 0$ the zero velocity has all the asserted properties, with no branch conditions.]
] <thm:shears>

#proof[
  We construct cutoffs that distinguish the source rectangles, the target rectangles, and a private height for each map. Their plateaus make the motion exactly affine near every prescribed rectangle; their derivative form gives zero spatial mean. Seven separated time pulses then perform the lift, four shears, translation, and lowering. Figure 1 shows the center paths for two branches assigned heights $z_1$ and $z_2$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0.45, 0.45), (4.05, 0.45), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10))
  line((0.45, 1.7), (4.05, 1.7), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((0.45, 2.55), (4.05, 2.55), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((0.45, 0.45), [#text(size: 9pt)[$z_0$]], anchor: "east", padding: 0.1176cm)
  content((0.45, 1.7), [#text(size: 9pt)[$z_1$]], anchor: "east", padding: 0.1176cm)
  content((0.45, 2.55), [#text(size: 9pt)[$z_2$]], anchor: "east", padding: 0.1176cm)
  content((1.05, 0.35), [#text(size: 8pt)[$p_1=q_2$]], anchor: "north", padding: 0.1176cm)
  content((3.45, 0.35), [#text(size: 8pt)[$p_2=q_1$]], anchor: "north", padding: 0.1176cm)
  line((5.25, 0.45), (8.85, 0.45), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10))
  line((5.25, 1.7), (8.85, 1.7), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((5.25, 2.55), (8.85, 2.55), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((5.25, 0.45), [#text(size: 9pt)[$z_0$]], anchor: "east", padding: 0.1176cm)
  content((5.25, 1.7), [#text(size: 9pt)[$z_1$]], anchor: "east", padding: 0.1176cm)
  content((5.25, 2.55), [#text(size: 9pt)[$z_2$]], anchor: "east", padding: 0.1176cm)
  content((5.85, 0.35), [#text(size: 8pt)[$p_1=q_2$]], anchor: "north", padding: 0.1176cm)
  content((8.25, 0.35), [#text(size: 8pt)[$p_2=q_1$]], anchor: "north", padding: 0.1176cm)
  line((10.05, 0.45), (13.65, 0.45), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10))
  line((10.05, 1.7), (13.65, 1.7), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((10.05, 2.55), (13.65, 2.55), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((10.05, 0.45), [#text(size: 9pt)[$z_0$]], anchor: "east", padding: 0.1176cm)
  content((10.05, 1.7), [#text(size: 9pt)[$z_1$]], anchor: "east", padding: 0.1176cm)
  content((10.05, 2.55), [#text(size: 9pt)[$z_2$]], anchor: "east", padding: 0.1176cm)
  content((10.65, 0.35), [#text(size: 8pt)[$p_1=q_2$]], anchor: "north", padding: 0.1176cm)
  content((13.05, 0.35), [#text(size: 8pt)[$p_2=q_1$]], anchor: "north", padding: 0.1176cm)
  content((2.2, 3.55), [#box(width: 4.435cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[\(a\) Lift:#linebreak()stage 1]]])])
  line((1.05, 0.45), (1.05, 1.7), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((3.45, 0.45), (3.45, 2.55), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: rgb("#b20000"))))
  circle((1.05, 0.45), radius: 0.05997, fill: rgb("#0000a6"), stroke: none)
  circle((3.45, 0.45), radius: 0.05997, fill: rgb("#b20000"), stroke: none)
  content((7, 3.55), [#box(width: 4.435cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[\(b\) Shear, then translate:#linebreak()stages 2--6]]])])
  line((5.85, 1.7), (8.25, 1.7), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((7.05, 1.7), [#text(size: 9pt)[6]], anchor: "south", padding: 0.1176cm)
  line((8.25, 2.55), (5.85, 2.55), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: rgb("#b20000"))))
  content((7.05, 2.55), [#text(size: 9pt)[6]], anchor: "south", padding: 0.1176cm)
  circle((5.85, 1.7), radius: 0.08114, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((8.25, 2.55), radius: 0.08114, fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((5.85, 1.6), [#text(size: 8pt)[2--5]], anchor: "north", padding: 0.1176cm)
  content((8.25, 2.45), [#text(size: 8pt)[2--5]], anchor: "north", padding: 0.1176cm)
  content((11.8, 3.55), [#box(width: 4.435cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[\(c\) Lower:#linebreak()stage 7]]])])
  line((13.05, 1.7), (13.05, 0.45), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((10.65, 2.55), (10.65, 0.45), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: rgb("#b20000"))))
  circle((13.05, 1.7), radius: 0.05997, fill: rgb("#0000a6"), stroke: none)
  circle((10.65, 2.55), radius: 0.05997, fill: rgb("#b20000"), stroke: none)
})],
    caption: [Figure 1: Schematic center paths in the $x$–$z$ projection for two branches with exchanged source and target centers; the $y$ coordinate is suppressed. The four shears fix each center before stage 6 translates it. Lift and lower occur at different times, so their projected overlap causes no interference. The lines represent trajectories, not field supports. ],
  ) <fig:height-stages>
  ===== 3.2.1 Cutoffs and heights. <cutoffs-and-heights.>
  For explicit smooth profiles, set
  $ E \( t \) = cases(delim: "{", e^(- 1 \/ t) \, & t > 0 \,, 0 \, & t lt.eq 0 \,) #h(2em) S \( t \) = frac(E \( t \), E \( t \) + E \( 1 - t \)) . $
  Thus $S = 0$ on $\( - oo \, 0 \]$ and $S = 1$ on $\[ 1 \, oo \)$. For $a < b lt.eq c < d$, the product $S \( \( t - a \) \/ \( b - a \) \) S \( \( d - t \) \/ \( d - c \) \)$ is a cutoff supported in $\[ a \, d \]$ and equal to one on $\[ b \, c \]$. Rational choices and products of these functions give the cutoffs below. Every product involving a chart coordinate is supported strictly inside its chart and is extended by zero, then periodically.
  Choose rational collars around the source rectangles, pairwise disjoint and contained in the chart. Do the same independently for the targets. Let $chi_i^(-) \, chi_i^(+)$ be product cutoffs supported in those collars and equal to one on positive neighborhoods of $P_i \, Q_i$. Define
  #[#set math.equation(numbering: n => "(4)")
   $ A_i^(-) \( x \, y \) & = partial_x #scale(x: 120%, y: 120%)[\(] \( x - p_(i \, 1) \) chi_i^(-) \( x \, y \) #scale(x: 120%, y: 120%)[\)] \,\
A_i^(+) \( x \, y \) & = partial_x #scale(x: 120%, y: 120%)[\(] \( x - q_(i \, 1) \) chi_i^(+) \( x \, y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:A>]
  Each has integral zero. It equals one near its own rectangle and zero near every other rectangle of the same family.
  Choose distinct rational heights $z_i$ in the vertical chart. Take cutoffs $gamma_i$ equal to one near $z_i$, with disjoint supports inside that chart, and define
  #[#set math.equation(numbering: n => "(5)")
   $ Z_i \( z \) = partial_z #scale(x: 120%, y: 120%)[\(] \( z - z_i \) gamma_i \( z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:Z>]
  Then $integral Z_i = 0$, and near $z_i$ we have $Z_i = 1$ and $Z_j = 0$ for $j eq.not i$. Finitely many heights leave positive rational margins. The segment from $z_0$ to each $z_i$ stays in the chart.
  Choose one-dimensional cutoffs $rho_x \, rho_y$ equal to one on neighborhoods of the coordinate projections of $K + \[ - 2 h \, 2 h \]^2$, with supports inside the corresponding chart intervals. Put
  $ g_i^x \( x \) = rho_x \( x \) \( x - p_(i \, 1) \) \, #h(2em) g_i^y \( y \) = rho_y \( y \) \( y - p_(i \, 2) \) . $
  These functions need not have zero integral: the factor $Z_i$ will supply zero mean to their three-dimensional fields.
  ===== 3.2.2 Seven fields. <seven-fields.>
  With $e_x \, e_y \, e_z$ the coordinate unit vectors, define
  #[#set math.equation(numbering: n => "(6)")
   $ W_1 & = e_z sum_i \( z_i - z_0 \) A_i^(-) \, & W_2 & = e_y sum_i \( - lambda_i \) Z_i g_i^x \,\
W_3 & = e_x sum_i \( lambda_i^(- 1) - 1 \) Z_i g_i^y \, & W_4 & = e_y sum_i Z_i g_i^x \,\
W_5 & = e_x sum_i \( lambda_i - 1 \) Z_i g_i^y \, & W_6 & = sum_i Z_i thin \( q_i - p_i \, 0 \) \,\
W_7 & = e_z sum_i \( z_0 - z_i \) A_i^(+) . &  & $ <eq:fields>]
  Choose seven successive, disjoint closed intervals inside $\( 0 \, 1 \)$ with rational endpoints. A rescaled derivative of $S$ gives a nonnegative smooth pulse $b_j$ of integral one in each interval. Set
  #[#set math.equation(numbering: n => "(7)")
   $ V \( t \, X \) = sum_(j = 1)^7 b_j \( t \) W_j \( X \) \, #h(2em) 0 lt.eq t lt.eq 1 \, $ <eq:velocity>]
  and extend it periodically. The pulses vanish to all orders at their endpoints. The gaps between stages and around the ends of the period make this extension smooth and give $V = 0$ near every integer time.
  ===== 3.2.3 Exact trajectories. <exact-trajectories.>
  Start at $\( X \, z_0 \)$ with $X in P_i$. During the first stage its horizontal coordinate stays fixed. Its source mask is one and every other source mask vanishes. Integrating $b_1$ therefore lifts it exactly to $z_i$.
  During the next five stages the height is fixed at $z_i$, where only its own height mask contributes. Write $X = p_i + \( r \, s \)$. The endpoint half-width assumptions give
  $ \| r \| \, med \| s \| \, med \| lambda_i r \| \, med \| s \/ lambda_i \| lt.eq h . $
  Lemma 3 shows that the proposed four-shear path stays inside $p_i + \[ - 2 h \, 2 h \]^2$. Consequently both horizontal cutoffs are one all along it. The proposed path solves the ODE for the localized fields, so uniqueness of the smooth ODE identifies it with the actual path. Its endpoint is
  $ p_i + "diag" \( lambda_i \, lambda_i^(- 1) \) \( X - p_i \) . $
  This argument verifies the plateau condition rather than assuming it.
  The sixth field translates by $q_i - p_i$. Its path has the form in (d), with the final offsets bounded by $h$. Convexity of $K$ keeps it in the chart. The endpoint is $F_i \( X \) in Q_i$, where the target mask is one and all other target masks vanish. The seventh field therefore lowers it to $z_0$. Source–target intersections cause no interference: sources and targets are used at different times, with separate heights between.
  We have proved the exact action on closed rectangles. We now give a quantitative neighborhood argument. Each planar partial composition on a branch is affine. Let $C gt.eq 1$ bound the infinity operator norms of all its linear parts, including the final composition. During a partial shear its matrix entries depend affinely on the accumulated pulse mass; the matrix norm is therefore bounded by the larger endpoint norm. Thus finitely many rational matrix bounds provide $C$.
  Choose positive rational margins inside the source-mask and target-mask plateaus, the horizontal $rho_x \, rho_y$ plateaus around all the compact planar paths, the private height plateaus, and the vertical chart around each lift and lowering segment. Call the respective minima $eta_(-) \, eta_(+) \, eta_rho \, eta_z \, eta_(upright("chart"))$. Every minimum is positive by the chosen collars and the finite explicit paths. Take
  $ 0 < delta < 1 / 2 min { eta_(-) \, eta_(+) \/ C \, eta_rho \/ C \, eta_z \, eta_(upright("chart")) } . $
  Starting within sup distance $delta$ of $P_i times { z_0 }$, the first mask is exactly one and all other source masks are zero. It lifts the height from $z_0 + zeta$ to $z_i + zeta$. This height lies in the plateau where $Z_i = 1$ and all other $Z_j = 0$, including their compensating lobes. Inductively through the planar stages, the proposed affine displacement from a reference path is at most $C delta$. It stays inside the horizontal plateaus, so the affine candidate solves the actual localized ODE at every stage. At the final planar endpoint it lies in the target-mask plateau, where lowering sends $z_i + zeta$ exactly to $z_0 + zeta$. ODE uniqueness identifies these explicit candidates with the actual trajectories. This proves the claimed map on a positive neighborhood. The radius may depend on $lambda_i$; the $2 h$ bound on the original closed rectangles does not.
  ===== 3.2.4 The equation and uniqueness. <the-equation-and-uniqueness.>
  For $W_1 \, W_7$, the sole component is vertical and independent of height. For $W_2 \, dots.h \, W_5$, the sole component is independent of its direction of motion. For $W_6$, both horizontal components depend only on height. Thus each $W_j$ is divergence free and has zero self-advection. The derivative representations (4) and (5) give zero spatial mean. Since at most one pulse is active at a time, these three identities hold for $V$ as well; no cross-stage convection terms occur. It follows that $f = V_t - nu Delta V$ is solenoidal and mean zero and that $\( V \, 0 \)$ solves (1) with zero initial velocity.
  We prove uniqueness by energy comparison, as in Leray’s analysis of regular solutions [6] Section 18; the periodic forced calculation is included here. For another solution $v$ in the stated classical class, put $w = v - V$. Subtract the equations and integrate by parts on the torus. The pressure term and transport by $v$ vanish, giving
  $ 1 / 2 frac(d, d t) parallel w parallel_2^2 + nu parallel nabla w parallel_2^2 lt.eq parallel nabla V parallel_(oo \, upright("op")) parallel w parallel_2^2 . $
  The stated regularity justifies these operations on each finite closed time cylinder. Since $w \( 0 \) = 0$, Gronwall’s inequality gives $w = 0$. The remaining pressure gradient vanishes, and the mean-zero pressure normalization gives $p = 0$. Smooth periodicity gives uniformly bounded kinetic energy and all derivative bounds. The smooth bounded velocity and spatial derivative also give a unique global material flow.
  ===== 3.2.5 Effective choices and evaluation. <effective-choices-and-evaluation.>
  All rectangle gaps and chart margins are rational positive numbers. The preceding lists, heights, collars, and pulse intervals can therefore be chosen by finite rational calculations. On $t > 0$, each derivative of $E$ has the form $P \( 1 \/ t \) e^(- 1 \/ t)$ for an effectively computable polynomial $P$. The inequalities $e^y gt.eq y^m \/ m !$ give effective errors near zero, and $E \( t \) + E \( 1 - t \) gt.eq e^(- 2)$. Products and quotients consequently yield effective bounds and evaluations for every derivative of each profile. These estimates work even when an input real cannot be distinguished from a cutoff endpoint. For periodic evaluation use a finite superset of neighboring translates and their zero collars. Thus evaluation requires no exact equality test on a supplied real. The same finite construction computes every mixed derivative bound for $V$ and, from the given computable $nu$, for $f$. ◻
]

=== 3.3 Observation bounds <observation-bounds>

An observation set must be avoided throughout the motion, not only at integer samples. The endpoint-size estimate supplies this additional information without a new transport construction.

#thm([Corollary 3.3.])[
  #emph[Under Theorem 4, suppose a branch satisfies $p_(i \, 1) \, q_(i \, 1) lt.eq a$. Every point starting in $P_i times { z_0 }$ has first coordinate at most $a + 2 h$ throughout the period. If instead both centers are at least $a$, its first coordinate is at least $a - 2 h$. If $cal(O) subset.eq bb(T)_L^3$ is open and $Q_i times { z_0 } subset.eq cal(O)$, every point starting in $P_i times { z_0 }$ reaches $cal(O)$ at the integer sample and remains there for a time interval.]
] <cor:observer>

#proof[
  Lifting preserves the source coordinate. The four scaling stages stay within $2 h$ of $p_i$. Translation interpolates between $p_i$ and $q_i$ with an offset of size at most $h$, and lowering preserves the target coordinate. These bounds give both inequalities. At the endpoint the particle is in the target rectangle, and the velocity vanishes on a neighborhood of the integer time. ◻
]

== 4 Closed rectangles, initialization, and the all-time event <sec:bridge>

We now connect the recorder to the geometric theorem. Symbolic injectivity does not replace separation of filled rectangles: we will write down and compare the image intervals.

=== 4.1 An affine map for every auxiliary instruction <an-affine-map-for-every-auxiliary-instruction>

We use the positional-coding viewpoint of generalized shifts [7] Lemma 0, keeping the entire prefix intervals rather than only their coded subsets. Let $cal(A) = Sigma times cal(G) times { 0 \, 1 }$ be the complete alphabet of Lemma 2, and let $m = \| cal(A) \|$. Give its symbols distinct odd digits $d_a in { 1 \, 3 \, dots.h \, 2 m - 1 }$ and set $B = 2 m + 1$. Define

$ C \( a_0 a_1 dots.h.c \) = sum_(j gt.eq 0) d_(a_j) B^(- j - 1) \, quad T_a \( v \) = frac(d_a + v, B) \, quad I_a = T_a \( \[ 0 \, 1 \] \) . $

A code lies in its first-symbol interval, and $T_a^(- 1)$ removes that symbol. Distinct $I_a$ have gaps at least $1 \/ B$. Distinct two-symbol intervals $T_a \( I_b \)$ have gaps at least $1 \/ B^2$: if their first symbols differ they lie in separated first-symbol intervals; otherwise the common map $T_a$ scales a first-symbol gap by $1 \/ B$. These assertions concern entire closed intervals, including their endpoints.

If the current head is at $k$, put $L = C \( s_(k - 1) s_(k - 2) dots.h.c \)$ and $R = C \( s_k s_(k + 1) dots.h.c \)$. For each allowed recorder instruction $\( s \, a \) mapsto \( s' \, b \, d \)$, and each possible letter $l$ immediately to the left, use the source rectangle $I_l times I_a$. On that rectangle the normalized update is

#[#set math.equation(numbering: n => "(8)")
 $ d & \( L' \, R' \) & upright("full target rectangle")\
+ 1 & \( T_b \( L \) \, T_a^(- 1) \( R \) \) & T_b \( I_l \) times \[ 0 \, 1 \]\
0 & \( L \, T_b \( T_a^(- 1) \( R \) \) \) & I_l times I_b\
- 1 & \( T_l^(- 1) \( L \) \, T_l \( T_b \( T_a^(- 1) \( R \) \) \) \) & \[ 0 \, 1 \] times T_l \( I_b \) . $ <eq:b-radix-table>]

For a right move the written letter is prefixed to the old left stack, and the current letter is removed from the right stack. For a left move, the old left letter is removed from the left stack and the pair $l \, b$ is prefixed to the old right tail. These descriptions prove the formulas on coded points. The displayed affine formulas define the update on every point of the full source rectangle and give exactly the displayed full image. Their linear part is $"diag" \( B^(- d) \, B^d \)$.

Let $cal(S)$ be the finite recorder control set and $N = \| cal(S) \|$. Only $S_q$ with $q in H$ are terminal controls. In particular $F_q$ and $L_q$ are nonterminal even when $q in H$: recording and returning must finish before the terminal checkpoint. Put $kappa = 1 \/ \( 32 N \)$ and $y_0 = 3 \/ 8$. Enumerate the nonterminal controls and place their state squares at

$ \[ c_s \, c_s + kappa \] times \[ y_0 \, y_0 + kappa \] \, #h(2em) c_s = 1 \/ 8 + 2 j kappa quad \( 0 lt.eq j < N \) . $

Enumerate the terminal controls separately with $c_s = 3 \/ 4 + 2 j kappa$. Only as many indices as occur are used in each list. All nonterminal squares lie in $1 \/ 8 lt.eq x < 3 \/ 16$, all terminal squares in $3 \/ 4 lt.eq x < 13 \/ 16$, and distinct squares have horizontal gaps at least $kappa$. The physical code is

#[#set math.equation(numbering: n => "(9)")
 $ G_s \( L \, R \) = \( c_s + kappa L \, y_0 + kappa R \) . $ <eq:b-code>]

For branch $i = \( s \, a \, l \)$, denote its source by $P_i = G_s \( I_l times I_a \)$, and its target by $Q_i$, obtained by applying the appropriate row of (8) and then $G_(s')$. Thus its physical map is

$ F_i = G_(s') compose F_i^(upright("norm")) compose G_s^(- 1) \, #h(2em) D F_i = "diag" \( lambda_i \, lambda_i^(- 1) \) \, #h(2em) lambda_i = B^(- d_i) . $

#thm([Lemma 4.1.])[
  (Separate source and target gaps).  #emph[The finite families $\( P_i \)$ and $\( Q_i \)$ are separately pairwise positively separated, with gap at least $kappa \/ B^2$ in some coordinate for every pair. Their side lengths are positive, rational, and at most $kappa$. No source–target separation is asserted or needed.]
] <lem:b-gap>

#proof[
  Different source controls lie in different state squares. Within one control, determinism permits at most one rule for a read letter $a$. Distinct branches therefore differ in $a$ or in $l$, giving the source gap $kappa \/ B$.
  For targets, different destination controls again give the state-square gap. For one fixed destination control, Lemma 2 gives a single incoming displacement $d$. The same lemma says that a written complete letter $b$ determines the preceding control and read complete letter. Consequently two different branches entering that control must differ in $b$ or in $l$. For $d = + 1$, the left image has the two-symbol prefix $\( b \, l \)$; for $d = - 1$, the right image has prefix $\( l \, b \)$. The previous two-symbol estimate gives gap $kappa \/ B^2$. For $d = 0$, the two coordinates expose $l$ and $b$ separately, giving gap $kappa \/ B$. The full target descriptions in (8) prove this for filled rectangles, not only for their tape-code subsets. The side-length claim follows directly from those descriptions. ◻
]

Take $h = kappa \/ 2$, $z_0 = 1 \/ 2$, and $K = \[ 1 \/ 8 \, 13 \/ 16 \] times \[ 3 \/ 8 \, 7 \/ 16 \]$. Use planar charts $\( 1 \/ 32 \, 31 \/ 32 \)$ in both coordinates and vertical chart $\( 1 \/ 8 \, 7 \/ 8 \)$. Each has length strictly less than one. All source and target centers belong to $K$, and $K + \[ - 2 h \, 2 h \]^2$ lies strictly inside that chart. Theorem 4 therefore produces a period-one velocity $V_M$ acting exactly on all these rectangles and on positive neighborhoods of them. This construction uses only the finite recorder table and rational choices; it does not depend on which branches will be visited.

For every branch with nonterminal source and target, both first-coordinate centers are at most $1 \/ 4$. Corollary 5 then gives throughout its entire period

#[#set math.equation(numbering: n => "(10)")
 $ x lt.eq 1 \/ 4 + 2 h = 1 \/ 4 + kappa lt.eq 9 \/ 32 < 1 \/ 2 . $ <eq:b-safe>]

Every terminal code has $x gt.eq 3 \/ 4$ and hence lies in $O$. The estimate (10) is deliberately applied only to branches whose two ends are nonterminal; the last transition into a terminal checkpoint may enter the detector. No identity rule is added at terminal controls. Such a rule could conflict with an incoming target and is unnecessary for a reachability assertion.

=== 4.2 Loading the fixed label <loading-the-fixed-label>

Initialize the recorder at head zero and control $S_(q_0)$, with the original finite work input, frontier $P$ at cell $2$, history $E$ at every other cell, and every return mark zero. Both complete tape tails are eventually the constant symbol $\( square.stroked.tiny \, E \, 0 \)$. If a tail is constant after $r$ symbols, its code equals a finite rational sum plus $B^(- r) d_(\( square.stroked.tiny \, E \, 0 \)) \/ \( B - 1 \)$. Hence its initial physical point $P_(upright("in")) = \( x_(upright("in")) \, y_(upright("in")) \)$ is computed by finite rational arithmetic, including all history and mark tracks.

Choose a smooth periodic function $Z$ with zero integral and $Z = 1$ near $z_0 = 1 \/ 2$, for example $Z \( z \) = partial_z \( \( z - z_0 \) gamma \( z \) \)$ with $gamma = 1$ near $z_0$ and supported strictly inside $\( 0 \, 1 \)$. Choose nonnegative smooth pulses $beta_x \, beta_y$ of integral one, supported respectively in $\( 1 \/ 8 \, 3 \/ 8 \)$ and $\( 5 \/ 8 \, 7 \/ 8 \)$. Define on $0 lt.eq t lt.eq 1$

#[#set math.equation(numbering: n => "(11)")
 $ U_(upright("load")) \( t \, x \, y \, z \) = beta_x \( t \) \( x_(upright("in")) - 1 \/ 8 \) Z \( z \) e_x + beta_y \( t \) \( y_(upright("in")) - 3 \/ 8 \) Z \( z \) e_y . $ <eq:b-loader>]

The point $a_(*)$ first travels horizontally from $\( 1 \/ 8 \, 3 \/ 8 \, z_0 \)$ to $\( x_(upright("in")) \, 3 \/ 8 \, z_0 \)$, then vertically in the planar chart to $\( x_(upright("in")) \, y_(upright("in")) \, z_0 \)$. Height stays $z_0$, so $Z = 1$ along both segments. If the initial control is nonterminal, this path stays in $x lt.eq 1 \/ 4$. If it is terminal, the endpoint is already in $O$, as required. Both velocity terms have zero spatial mean and zero self-advection, and their supports in time are disjoint.

Now prescribe

#[#set math.equation(numbering: n => "(12)")
 $ U \( t \) = cases(delim: "{", U_(upright("load")) \( t \) \, & 0 lt.eq t lt.eq 1 \,, V_M \( t - 1 \) \, & t gt.eq 1 .) $ <eq:b-U>]

Both pieces vanish on neighborhoods of their joining time. The field is therefore smooth, starts at zero, and has period one after time one. Every derivative is globally bounded: the loader is a finite collection of smooth profiles on a compact interval, and the remaining mechanism is smooth and periodic. Its mean, divergence, and self-advection all vanish at every time.

=== 4.3 Completion of the fluid and observation statements <completion-of-the-fluid-and-observation-statements>

After loading, the particle is precisely the initial code at height $z_0$. At every initialized microstep before a terminal checkpoint it belongs to one and only one source rectangle: its control and the two first letters select that branch. Equations (8) and (9), together with Theorem 4, send it to exactly the successor recorder code at height $z_0$. This proves the simulation by induction over all microsteps that are defined. The checkpoint induction in Lemma 2 verifies every guard between these checkpoints; arbitrary malformed nonterminal tapes are not asserted to have successors.

If the original machine never halts, Lemma 2 says that all recorder steps are defined. It also says that each original instruction finishes after the positive finite number $2 \( 2 + n - h_(n + 1) \) + 4$ of microsteps. In fact this is at least $6$, since $h_(n + 1) lt.eq n + 1$. Thus the nonhalting run yields infinitely many periods; no accumulation of infinitely many periods in finite time occurs. All control states encountered are nonterminal, so (10) excludes $O$ at every intermediate time, while the loader is safe by construction.

If the machine halts after finitely many original instructions, the finite sum of their finite microstep counts gives a finite period at which the particle reaches a terminal checkpoint, whose code belongs to $O$. If it was initially halted, the loader supplies the hit. A machine with no original instruction at a nonhalting pair is first normalized by the explicit stationary stop transition in Section 2; if its initial state is already halting, only the loader is needed for the hit. We impose no condition on later motion after a hit. This proves both directions of the event equivalence for all real times.

Finally set

#[#set math.equation(numbering: n => "(13)")
 $ f_(M \, w) = U_t - nu Delta U . $ <eq:b-force>]

Since $\( U dot.op nabla \) U = 0$, substitution proves that $\( U \, 0 \)$ solves (1). Differentiation and integration preserve the vanishing divergence and mean, so the force is solenoidal and mean zero. Its smoothness, periodicity after initialization, and mixed-derivative bounds follow from those of $U$. The energy comparison proved in Theorem 4 applies on every finite interval also across initialization: the reference gradient is bounded there and no time symmetry is required of a competitor. It gives uniqueness in the stated class. Compactness of the torus and the uniform bound for $U$ give the uniform energy bound and the global material flow.

All state placements, digits, rectangles, and initial rational codes are finite constructions. The effective cutoffs and pulses were proved in Theorem 4; the one-time loader uses the same profiles. An approximate time argument near the join may be handled by evaluating both smooth terms using their zero collars. Periodic evaluation uses a finite superset of nearby translates. Thus no exact equality test at a joining time is needed, and no part of the force evaluator follows the particular machine execution. This completes Theorem 1.

The loader accounts for the time qualification in that theorem. Periodicity from time zero would require a repeated initialization rule or an input-dependent placement inside the periodic mechanism; it does not follow from adding a one-time loader. The present theorem asserts periodicity after initialization.

#thm([Corollary 4.2.])[
  (Undecidability of the fixed particle event).  #emph[No algorithm decides the event of Theorem 1 for every finite force prescription produced by its compiler.]
]

#proof[
  Such an algorithm, composed with the terminating force compiler, would decide halting for arbitrary finite machine descriptions and inputs. It would also decide Turing’s symbol-printing problem [8] Section 8: modify a machine to halt upon printing the specified symbol and to run forever otherwise, including when it stops without printing that symbol. Turing’s undecidability theorem excludes this algorithm. ◻
]

== 5 Optional recorder and schedule changes <sec:optional>

The complete initialized construction above uses neither of the changes in this section. They record two ways to adapt its finite mechanism while retaining the stated inverse and geometric bounds.

=== 5.1 Keeping the return mark at checkpoints <keeping-the-return-mark-at-checkpoints>

Some encodings use a marked work head at a checkpoint. This change has an exact description on all configurations, so it does not require a separate simulation argument.

Let $T$ be the partial transition of Lemma 2. Define an involution $J$ on recorder configurations by toggling the mark under the head when the control is $S_q$, and making no change in any other control. The head position, control, work track, and history track remain fixed. Put

#[#set math.equation(numbering: n => "(14)")
 $ T_(upright("per")) = J compose T compose J \, #h(2em) "dom" T_(upright("per")) = J \( "dom" T \) . $ <eq:conjugacy>]

Only the first and last rows of the table change. The first now reads mark one and writes mark zero before moving to $A_r$. The last preserves mark one while entering $S_q$. All five other rows, including their history guards, are unchanged.

Because $J^2 = "id"$, the identity $T_(upright("per"))^k = J T^k J$ holds wherever either corresponding iterate is defined. Initialize with the sole mark at the work head. The conjugacy then transfers the checkpoint invariant, the step count, and halting equivalence from Lemma 2. Its two incoming properties also hold directly: at $A_r$ the old mark is known to be one, and at $S_q$ the last row copies the marked symbol. Every other inverse is unchanged. This is an equality of partial maps, not just an equivalence of initialized runs.

One may also adjoin a passive track with any finite alphabet. Extend every rule over every value of that track and preserve it at each write. The inverse above reconstructs the active tracks, while the written passive value reconstructs itself. Thus both incoming properties and the checkpoint proof persist. In particular, a passive track initially marked only at the origin retains an absolute reference position. This extension does not change any history guard or append rule.

=== 5.2 Alternative shear schedules <alternative-shear-schedules>

#prodef([Remark 5.1.])[
  (Two schedule variants).  The chronological list
  $ sans(X) \( lambda^(- 1) - 1 \) \, quad sans(Y) \( 1 \) \, quad sans(X) \( lambda - 1 \) \, quad sans(Y) \( - lambda^(- 1) \) $
  has the successive endpoints
  $ & \( r + \( lambda^(- 1) - 1 \) s \, s \) \,\
 & \( r + \( lambda^(- 1) - 1 \) s \, r + s \/ lambda \) \,\
 & \( lambda r \, r + s \/ lambda \) \,\
 & \( lambda r \, s \/ lambda \) . $
  The proof of Lemma 3 bounds each coordinate by $2 h$; convexity handles partial shears. Replacing the four middle scaling fields accordingly preserves the rest of Theorem 4.
  Alternatively, split $W_6$ into its two horizontal components and give them successive unit-integral pulses. This gives eight stages with one Cartesian component active at a time. The horizontal center now moves first in one coordinate and then in the other. Both segments stay in the rectangle $K$, so the coordinate bounds and the proof of Corollary 5 persist. Every field is still transverse, mean zero, and free of self-advection. This variant has the same endpoint map, although its translation path differs.
] <rem:variants>

#heading(level: 1)[References]
#bibitem([1])[C.~H. Bennett, #emph[Logical reversibility of computation], IBM Journal of Research and Development #strong[17] (1973), no.~6, 525--532. #link("https://doi.org/10.1147/rd.176.0525")[doi:10.1147/rd.176.0525].]
#bibitem([2])[R. Cardona, E. Miranda and D. Peralta-Salas, #emph[Computability and Beltrami fields in Euclidean space], Journal de Mathématiques Pures et Appliquées #strong[169] (2023), 50--81. #link("https://doi.org/10.1016/j.matpur.2022.11.007")[doi:10.1016/j.matpur.2022.11.007].]
#bibitem([3])[R. Cardona, E. Miranda, D. Peralta-Salas and F. Presas, #emph[Constructing Turing complete Euler flows in dimension 3], Proceedings of the National Academy of Sciences #strong[118] (2021), e2026818118. #link("https://doi.org/10.1073/pnas.2026818118")[doi:10.1073/pnas.2026818118].]
#bibitem([4])[S. Dyhr, Á. González-Prieto, E. Miranda and D. Peralta-Salas, #emph[Turing complete Navier--Stokes steady states via cosymplectic geometry], PNAS Nexus #strong[5] (2026), pgag131. #link("https://doi.org/10.1093/pnasnexus/pgag131")[doi:10.1093/pnasnexus/pgag131].]
#bibitem([5])[R. Landauer, #emph[Irreversibility and heat generation in the computing process], IBM Journal of Research and Development #strong[5] (1961), no.~3, 183--191. #link("https://doi.org/10.1147/rd.53.0183")[doi:10.1147/rd.53.0183].]
#bibitem([6])[J. Leray, #emph[Sur le mouvement d'un liquide visqueux emplissant l'espace], Acta Mathematica #strong[63] (1934), 193--248. #link("https://doi.org/10.1007/BF02547354")[doi:10.1007/BF02547354].]
#bibitem([7])[C. Moore, #emph[Generalized shifts: unpredictability and undecidability in dynamical systems], Nonlinearity #strong[4] (1991), no.~2, 199--230. #link("https://doi.org/10.1088/0951-7715/4/2/002")[doi:10.1088/0951-7715/4/2/002].]
#bibitem([8])[A. M. Turing, #emph[On computable numbers, with an application to the Entscheidungsproblem], Proceedings of the London Mathematical Society (2) #strong[42] (1936--1937), 230--265. #link("https://doi.org/10.1112/plms/s2-42.1.230")[doi:10.1112/plms/s2-42.1.230].]


