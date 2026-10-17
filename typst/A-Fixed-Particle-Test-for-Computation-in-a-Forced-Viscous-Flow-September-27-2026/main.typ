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

#align(center)[#text(size: 16pt, weight: "bold")[A Fixed Particle Test for Computation \
in a Forced Viscous Flow]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Fix a flat three-dimensional torus, a positive viscosity, zero initial fluid velocity, one particle label, and an open region that serves as a detector. Can a finite program for an external force make that particle enter the region exactly when a given Turing machine halts? The machine and its finite input may change the force; the geometry, initial velocity, particle label and detector remain fixed. We prove this for an explicit family of smooth forces. The resulting reachability problem is undecidable.

The question connects computability with the dynamics of a continuous system. Turing proved that no machine can decide whether an arbitrary described machine ever prints a designated symbol [10] Section 8. The halting formulation used here follows by a finite modification that halts on that event. A bounded continuous phase space can represent such a tape by an infinite positional expansion. Moore’s generalized shifts made this connection explicit: local symbol changes and shifts of the tape become affine operations on real coordinates [7,8]. Exact real coordinates supply the unbounded information capacity; this is not a bound on what a finite-precision measurement can recover.

A further issue arises when such operations are realized by a smooth flow. A machine may overwrite a symbol or merge two states, whereas the flow between two finite times is invertible. Retaining intermediate information is a classical way to avoid this loss [5] Section 3. Bennett gave an explicit reversible simulation that records the index of each executed instruction on a history tape [1] Eqs. (9)–(11). Our construction uses the same information-retention principle in a different setting: a third real coordinate retains the selected branches, while two planar coordinates execute the original, possibly irreversible machine.

Computational universality has also been realized in fluid trajectories. Cardona, Miranda, Peralta-Salas and Presas constructed stationary Euler flows on an adapted Riemannian three-sphere whose trajectories simulate Turing machines [3]. Their proof passes through area-preserving realizations of generalized shifts. Dyhr, González-Prieto, Miranda and Peralta-Salas subsequently obtained stationary unforced Navier–Stokes universality using an adapted metric and Hodge viscosity [4]. Their velocity is harmonic for the chosen Hodge Laplacian, so the viscous term vanishes.

Fixed-metric computation also has precedents. Cardona, Miranda and Peralta-Salas construct universal steady Euler flows on Euclidean $bb(R)^3$ with infinite energy, and robust tape-bounded simulations on the flat three-torus, observed before exit from a prescribed compact region [2] arXiv version 3, Theorems 1 and 26. Their unforced viscous version starts from nonzero Beltrami velocity and traverses a finite interval of its Euler trajectory, chosen to cover the bounded computation [2] arXiv version 3, Remark 29.

Here the flat torus and viscosity are fixed in advance and the fluid starts at rest. The machine and input instead enter an external force prescription. These are different choices of data for the fluid equation, and the earlier results do not supply the construction below.

There is an elementary way to force a chosen smooth incompressible velocity: subtract its viscous term from its material acceleration. The mathematical work lies in choosing that velocity from the finite instruction table. It must execute each instruction, retain the information needed for invertibility, and avoid the detector at every intermediate time of a nonhalting run. In particular, our force formula must prescribe all instruction branches; it must not first execute the input computation and then replay its trajectory.

We implement an instruction in two pulses. The first records its branch number in the third coordinate. The second reads the newest record through a periodic gate and applies the corresponding planar motion. Earlier records remain present but do not affect that gate. As the history grows, the gates have finer spatial scales. We make successive steps longer so that the time-dependent velocity and force have square-integrable derivatives of every fixed order.

The result concerns exact material trajectories for these explicitly constructed forces. It gives neither a uniform perturbation tolerance for arbitrarily long runs nor an efficient simulation-time bound. Its existence and uniqueness proof uses the prescribed smooth velocity; it is not a regularity theorem for general Navier–Stokes data.

== 2 The statement and the history invariant <sec:statement>

Write $bb(T) = bb(R) \/ bb(Z)$ and fix a positive computable viscosity $nu$. For velocity $u \( t \, X \)$, pressure $p \( t \, X \)$ and external force $f \( t \, X \)$, the incompressible Navier–Stokes equations are

#[#set math.equation(numbering: n => "(1)")
 $ partial_t u + \( u dot.op nabla \) u = - nabla p + nu Delta u + f \, #h(2em) "div" u = 0 \, #h(2em) u \( 0 \) = 0 $ <eq:NS>]

on the unit flat torus $bb(T)^3$. Pressure is periodic and has mean zero. We write $X = \( x \, y \, z \)$ for a spatial point, use representatives in $\[ 0 \, 1 \)$ when specifying a coordinate interval, and take $parallel dot.op parallel_oo$ over space. The material flow of a smooth velocity $u$ is defined by

$ frac(d, d t) Phi_u \( t \, a \) = u \( t \, Phi_u \( t \, a \) \) \, #h(2em) Phi_u \( 0 \, a \) = a . $

For a label $a_(*) in bb(T)^3$ and an open set $O subset bb(T)^3$, the particle event is $Phi_u \( t \, a_(*) \) in O$ for some finite $t$.

An effective force prescription is a finite program that evaluates the force and any requested mixed derivative at computably supplied space-time arguments, to any prescribed rational error. It also supplies the derivative bounds on compact sets used below. The program prescribes the transition mechanism on all its branches; it does not compute and replay the distinguished execution. No running-time bound is required.

A classical competitor has continuous velocity, spatial derivatives through order two, time derivative, pressure and pressure gradient on every closed cylinder $\[ 0 \, T \] times bb(T)^3$, with the periodicity and pressure normalization above. The constructed solution is smooth, including all one-sided time derivatives at zero.

#thm([Theorem 1.])[
  #emph[There is an algorithm taking a deterministic single-tape machine $M$ and a finite word $w$ to an effective smooth mean-zero force $f_(M \, w)$ for (1), with the following properties.]
  + #emph[The equation has a global smooth solution $u_(M \, w)$, unique among classical solutions on every finite time interval.]
  + #emph[For every time order $h gt.eq 0$ and spatial multi-index $mu$, both 
$ t mapsto parallel partial_t^h partial_X^mu u_(M \, w) \( t \) parallel_oo \, #h(2em) t mapsto parallel partial_t^h partial_X^mu f_(M \, w) \( t \) parallel_oo $

 belong to $L^oo \( 0 \, oo \) ∩ L^2 \( 0 \, oo \)$.]
  + #emph[The particle initially at $a_(*) = \( 1 \/ 8 \, 3 \/ 8 \, 0 \)$ enters 
$ O = { \( x \, y \, z \) in bb(T)^3 : 1 \/ 2 < x < 1 } $

 at a finite time if and only if $M$ halts on $w$.]
  #emph[The force may additionally be chosen divergence free, with unchanged velocity and observation. Constants in the derivative estimates may depend on $M \, w \, nu$ and the derivative orders. After a loading interval, the prescribed velocity mechanism depends on $M$ but not on $w$.]
] <thm:main>

The proof has one particularly useful invariant. A branch specifies the current state and the symbols read by one local instruction; the precise list is given in Section 3. Number these finitely many branches by $1 \, dots.h \, J$ and put $Lambda = J + 1$. If the first $n$ selected branches are $j_0 \, dots.h \, j_(n - 1)$, we will arrange

#[#set math.equation(numbering: n => "(2)")
 $ z_n = sum_(i < n) j_i Lambda^(- i - 1) . $ <eq:history>]

Thus $Lambda^n z_n$ is an integer. Translating $z$ by $j_n Lambda^(- n - 1)$ makes its new value satisfy

#[#set math.equation(numbering: n => "(3)")
 $ Lambda^n z = j_n / Lambda med \( mod med 1 \) . $ <eq:selector>]

A smooth periodic gate can now select instruction $j_n$. This is the continuous history record corresponding to the transition-index record in Bennett’s reversible simulation [1]. The earlier digits have become an integer and do not affect this gate. They have not been erased: they remain in $z$, so two planar updates with overlapping images can still represent different pasts.

We next construct the planar branches and then realize (2) by a divergence-free field. The symbols $j_n$ describe the trajectory in the proof; they will not occur in the formula for the force.

Here is the route through the proof. Section 3 converts each instruction into an area-preserving planar motion and proves that it cannot cause a false detection between nonhalting configurations. Section 4 combines the recorder and these motions into one smooth incompressible velocity, and proves the event equivalence. Section 5 chooses the force, establishes the derivative bounds and uniqueness, and verifies effective evaluation without running the machine. The Fourier projection there gives the optional solenoidal force.

A force that eventually stops changing in time poses a further question: its spatial mechanism must keep computing without progressively changing the gates. A separate companion gives that finite spatial mechanism and proves eventual stationarity [9]. The present proof uses the ordinary machine directly and requires no result from that companion.

The optional comparison theorem in Appendix 6.1 also applies on $bb(R)^3$ and $bb(R)^2 times bb(T)$, with explicit Sobolev and pressure assumptions for other constructed flows. The particle theorem above concerns $bb(T)^3$ only. For a positive viscosity that is not assumed computable, the same formulas and estimates hold, with effective evaluation relative to the ability to approximate that fixed viscosity. Unqualified algorithmic assertions in this paper use the computable viscosity fixed above.

== 3 A machine instruction as a planar motion <sec:planar>

Our task in this section is to turn each machine instruction into a planar motion whose entire path respects the detector. First encode the tape, then interpolate the resulting affine update by a Hamiltonian field.

First merge designated halting states into a single state $q_h$, or adjoin an unreachable $q_h$ if none is designated. Let $Q$ now have $N gt.eq 1$ states, and let the tape alphabet $Sigma$ have $m gt.eq 1$ letters, including a blank $square.stroked.tiny$. Replace a missing instruction on symbol $a$ by $\( q_h \, a \, S \)$, and give $q_h$ stationary identity instructions. This finite normalization preserves the halting event, including an initially halted input. The tape is a sequence $\( s_i \)_(i in bb(Z))$ in $Sigma$, with finitely many nonblank cells initially. Place the input word starting at cell zero, put blanks elsewhere, and start the head at zero in the machine’s initial state. Write $delta \( q \, a \) = \( q' \, b \, D \)$, where $D$ is a left move, right move or stay.

The positional coding is the generalized-shift representation of a tape [8] Section 1, Lemma 0, with gaps inserted between symbol intervals. Give the letters the odd digits $d_a in { 1 \, 3 \, dots.h \, 2 m - 1 }$ in base $B = 2 m + 1$, and set

$ v \( a_0 a_1 dots.h \) = sum_(r gt.eq 0) d_(a_r) B^(- r - 1) \, #h(2em) I_a = \[ d_a \/ B \, \( d_a + 1 \) \/ B \] . $

The intervals $I_a$ are separated by gaps of length at least $1 \/ B$. A code lies in the interval of its first letter, and $B v \( a omega \) - d_a = v \( omega \)$ removes that letter. This proves unique decoding. A blank tail has value $d_square.stroked.tiny \/ \( B - 1 \)$, so all initial codes are rational.

If the head is at cell $k$, encode the two relative tape halves by

$ ell = v \( s_(k - 1) s_(k - 2) dots.h \) \, #h(2em) r = v \( s_k s_(k + 1) dots.h \) . $

Put $kappa = \( 16 N \)^(- 1)$ and $y_0 = 3 \/ 8$. Enumerate nonhalting states as $q_0 \, dots.h \, q_(N - 2)$ and choose

$ c \( q_i \) = 1 \/ 8 + 2 i kappa \, #h(2em) c \( q_h \) = 3 \/ 4 . $

The planar code is $P = \( c \( q \) + kappa ell \, y_0 + kappa r \)$. The state box $\[ c \( q \) \, c \( q \) + kappa \] times \[ y_0 \, y_0 + kappa \]$ lies in

$ K = \[ 1 \/ 8 \, 13 \/ 16 \] times \[ 3 \/ 8 \, 7 \/ 16 \] . $

Every nonhalting state box has $x lt.eq 1 \/ 4$; the halting box has $x gt.eq 3 \/ 4$. These inequalities leave room for a fixed detector between the two.

Index the triples $j = \( q \, l \, a \)$ by $1 \, dots.h \, J = N m^2$. Here $a$ is the letter under the head and $l$ the letter immediately to its left. Their closed source rectangles are

$ R_j = \( c \( q \) + kappa I_l \) times \( y_0 + kappa I_a \) . $

They are pairwise disjoint. If $ell_(*) = B ell - d_l$ and $r_(*) = B r - d_a$, the tape instruction is exactly

#[#set math.equation(numbering: n => "(4)")
 $ D & ell' & r'\
R & \( d_b + ell \) \/ B & r_(*)\
L & ell_(*) & \[ d_l + \( d_b + r_(*) \) \/ B \] \/ B\
S & ell & \( d_b + r_(*) \) \/ B . $ <eq:branches>]

For example, a right move prefixes the written letter $b$ to the left tape and removes $a$ from the right tape. A left move removes $l$ from the left tape and prefixes $l \, b$ to the old right tail. These operations explain both entries in each row of the table.

Let $F_j$ be the resulting affine map in the physical coordinates $P$. It maps the whole rectangle $R_j$ into the next state box, and its linear part is $"diag" \( lambda_j \, lambda_j^(- 1) \)$, with $lambda_j = B^(- 1) \, B \, 1$ respectively. Different image rectangles may overlap. We will distinguish them by history, not by assuming that an ordinary machine is reversible.

We have obtained the correct endpoint update. We now realize it by a continuous motion, keeping every nonhalting-to-nonhalting path to the left of the detector. Local area-preserving realizations of bijective generalized shifts also occur in [3] Proposition 5.1; here a separate history coordinate will distinguish different branches with overlapping images.

Let $C_j^0 \, C_j^1$ be the centers of $R_j \, F_j \( R_j \)$ and $E_j = C_j^1 - C_j^0$. For $0 lt.eq s lt.eq 1$ define

$ C_j \( s \) = C_j^0 + s E_j \, quad g_j \( s \) = 1 - s + s lambda_j \, quad gamma_j \( s \) = frac(lambda_j - 1, g_j \( s \)) \, $

#[#set math.equation(numbering: n => "(5)")
 $ Psi_(j \, s) \( P \) = C_j \( s \) + "diag" \( g_j \( s \) \, g_j \( s \)^(- 1) \) \( P - C_j^0 \) . $ <eq:path>]

This path starts at $P$ and ends at $F_j \( P \)$. Its first coordinate is the convex combination of the two endpoint coordinates. To control the second coordinate, let $a$ be the source rectangle’s vertical half-width. Convexity of the reciprocal gives

$ frac(a, g_j \( s \)) lt.eq \( 1 - s \) a + s a / lambda_j . $

Together with the linear motion of the center, this keeps the entire rectangle in $K$. In particular, an instruction with nonhalting source and target stays in $x lt.eq 1 \/ 4$ throughout its motion.

Choose a smooth cutoff $chi$ equal to one on a neighborhood of $K$ and supported in the open unit square. Periodize the compactly supported Hamiltonian

$ H_j \( s \, x \, y \) = chi \( x \, y \) #scale(x: 120%, y: 120%)[\[] E_(j \, x) \( y - C_(j \, y) \( s \) \) - E_(j \, y) \( x - C_(j \, x) \( s \) \) + gamma_j \( s \) \( x - C_(j \, x) \( s \) \) \( y - C_(j \, y) \( s \) \) #scale(x: 120%, y: 120%)[\]] . $

The planar field $V_j = \( partial_y H_j \, - partial_x H_j \)$ is divergence free and has mean zero. On the moving rectangle its components are $E_(j \, x) + gamma_j \( x - C_(j \, x) \)$ and $E_(j \, y) - gamma_j \( y - C_(j \, y) \)$. Differentiating (5) gives exactly these velocities. Uniqueness for the smooth ODE therefore shows that $V_j$ realizes the claimed path, including its intermediate-time bound. The cutoff introduces no error there because all its derivatives vanish on that path.

== 4 Recording and selecting the instruction <sec:recording>

Each instruction uses two pulses. The first reads the current source rectangle and adds its branch number to the history; the second uses that new digit to select the planar motion. Thus we can use the individual motions of Section 3 even when their planar images overlap. Figure 1 shows one step; the formulas below implement it simultaneously for every possible branch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.15cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P in R_j$#linebreak()$z=z_n$]]])])
  content((4.8, 0), [#box(width: 2.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P in R_j$#linebreak()$z=z_n+j Lambda^(-n-1)$]]])])
  content((10.5, 0), [#box(width: 2.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F_j(P)$#linebreak()$z=z_n+j Lambda^(-n-1)$]]])])
  line((1.075, 0), (3.4, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.4, 0), [#text(size: 9pt)[$P$ fixed]], anchor: "north", padding: 0.1176cm)
  line((6.2, 0), (9.1, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((7.65, 0), [#text(size: 9pt)[$z$ fixed]], anchor: "north", padding: 0.1176cm)
  content((4.8, -1.2), [#text(size: 9pt)[$Lambda^n z=j"/"Lambda (mod 1)$#linebreak()the new digit selects the next pulse]])
})],
  caption: [Figure 1: One simulated instruction, schematically. The first pulse leaves both tape coordinates fixed while recording the selected branch. The second leaves the history fixed while executing that branch’s planar motion. The diagram describes the encoded particle; planar images of different branches need not be disjoint. ],
) <fig:pulses>

We specify the cutoffs to ensure that closed rectangle boundaries are covered. Let

$ rho \( s \) = cases(delim: "{", e^(- 1 \/ s) \, & s > 0 \,, 0 \, & s lt.eq 0 \,) #h(2em) sigma \( s \) = frac(rho \( s \), rho \( s \) + rho \( 1 - s \)) . $

For a closed interval $I = \[ a \, b \]$, set

$ eta_I^epsilon \( v \) = sigma #h(-0.16667em) (frac(2 \( v - a + epsilon \), epsilon)) sigma #h(-0.16667em) (frac(2 \( b + epsilon - v \), epsilon)) . $

The cutoff $eta_I^epsilon$ equals one on a neighborhood of $I$ and vanishes outside its $epsilon$ enlargement. Products define the analogous rectangle cutoffs. For the earlier Hamiltonians, choose $chi = eta_K^(1 \/ 32)$; its support is strictly inside the unit square.

The source rectangles have gaps at least $kappa \/ B$, so the supports in

$ G_0 \( x \, y \) = sum_(j = 1)^J j eta_(R_j)^(kappa \/ \( 4 B \)) \( x \, y \) $

are disjoint. Periodize this function from the unit-square chart and put

$ G \( x \, y \) = G_0 \( x \, y \) - G_0 \( x \, y - 1 \/ 2 \) . $

The original supports lie in $1 \/ 4 < y < 1 \/ 2$; their half-period translates miss every $R_j$. Consequently $G = j$ on $R_j$ and $G$ has zero mean. The correction permits a mean-zero vertical recorder without altering the tracked computation. Define the gates by periodizing the following bumps with period one:

$ b_j \( z \) = eta_({ j \/ Lambda })^(1 \/ \( 4 Lambda \)) \( z \) \, #h(2em) Lambda = J + 1 . $

Their supports are disjoint and each equals one near its own center.

Let $theta \( s \) = sigma \( 2 s - 1 \/ 2 \)$. It rises smoothly from zero to one inside $\( 0 \, 1 \)$ and is constant near both endpoints. Set

$ S_n = 2^(n^2) \, quad t_0 = 1 \, quad t_(n + 1) = t_n + 2 S_n \, #h(2em) alpha_n \( t \) = frac(t - t_n, S_n) \, quad beta_n \( t \) = frac(t - t_n - S_n, S_n) . $

Step $n$ has a recorder interval and an equally long planar interval.

The initial planar code $P_(upright("in"))$ is rational. Let $V_(upright("load"))$ be the Hamiltonian field of

$ chi \( x \, y \) \[ \( P_(upright("in") \, x) - 1 \/ 8 \) y - \( P_(upright("in") \, y) - 3 \/ 8 \) x \] . $

It translates $\( 1 \/ 8 \, 3 \/ 8 \)$ along its straight segment to $P_(upright("in"))$. Define the velocity on $\[ 0 \, oo \) times bb(T)^3$ by

#[#set math.equation(numbering: n => "(6)")
 $ U \( t \, x \, y \, z \) =  & \( theta' \( t \) V_(upright("load")) \( x \, y \) \, 0 \)\
 & + sum_(n gt.eq 0) (frac(theta' \( beta_n \( t \) \), S_n) sum_(j = 1)^J b_j \( Lambda^n z \) V_j \( theta \( beta_n \( t \) \) \, x \, y \) \, quad frac(theta' \( alpha_n \( t \) \), S_n Lambda^(n + 1)) G \( x \, y \)) . $ <eq:field>]

The displayed sum is a formula for all possible instructions. It has no reference to which instruction the machine will actually select.

At any time only one stage can be active. Since $t_n gt.eq 1 + 2 n$, the sum is locally finite; the zero collars make every join smooth. Multiplying a planar divergence-free field by a function of $z$ preserves its planar divergence, and the vertical component is independent of $z$. Thus $"div" U = 0$. Each planar field has zero planar mean, while $G$ has zero planar mean, so $U$ has zero spatial mean. Also $U \( 0 \) = 0$.

After the loader, the particle has planar coordinate $P_(upright("in"))$ and $z_0 = 0$. Suppose at $t_n$ it has the current planar configuration and history (2). It belongs to exactly one source rectangle, say $R_(j_n)$. During the recorder interval its planar coordinate stays fixed, while integration of the last component in (6) adds $j_n Lambda^(- n - 1)$ to $z$. Equation (3) follows. On the planar interval only $b_(j_n)$ is nonzero at this particle, and its value is one. Its path is therefore $Psi_(j_n \, theta \( beta_n \( t \) \)) \( P \( t_n \) \)$, ending at the next machine code. The third coordinate stays fixed on this interval. This proves the induction and (2) for every $n$.

There is no wraparound ambiguity for the tracked history: $0 lt.eq z_n lt.eq 1 - Lambda^(- n)$. At a known step its finite radix expansion recovers every previous branch, hence every head displacement and the absolute head position. The planar coordinates recover the state and relative tape. This is an encoding of the computation, not merely a halting indicator.

If the machine halts, a planar code with $x gt.eq 3 \/ 4$ is reached after finitely many finite stages. If it is initially halted, the loader already reaches such a code. Conversely, for a nonhalting run the loader stays in $x lt.eq 1 \/ 4$, a recorder interval does not change $x$, and (5) stays in $x lt.eq 1 \/ 4$ at every planar stage. This proves both directions of the event equivalence at every real time.

== 5 Slowing the gates and obtaining the force <sec:force>

The velocity now implements the machine and gives the correct event at every time. It remains to control its derivatives, realize it as the unique fluid velocity, and show that the force has a finite effective prescription.

=== 5.1 Bounds for the prescribed velocity <bounds-for-the-prescribed-velocity>

Why choose the rapidly growing stage lengths $S_n$? Differentiating a gate $b_j \( Lambda^n z \)$ $k$ times costs a factor $Lambda^(n k)$. The factor $S_n^(- 1)$ in the velocity compensates for this at every fixed derivative order. More precisely, for a time order $h$ and spatial multi-index $mu = \( mu_x \, mu_y \, mu_z \)$, the fixed smooth profiles above give, throughout step $n$,

#[#set math.equation(numbering: n => "(7)")
 $ parallel partial_t^h partial_X^mu U \( t \) parallel_oo lt.eq C_(h \, mu) S_n^(- 1 - h) Lambda^(n mu_z) . $ <eq:bounds>]

The profiles $V_j$ and their phase derivatives are uniformly bounded for $0 lt.eq s lt.eq 1$, because $g_j \( s \) > 0$. The recorder has no $z$ dependence and has an additional small factor $Lambda^(- n - 1)$, so it also satisfies this estimate. The constants depend on the finite table and derivative orders but not on $n$.

The right side of (7) is bounded, and integration over the two intervals of length $S_n$ gives

$ integral_1^oo parallel partial_t^h partial_X^mu U \( t \) parallel_oo^2 thin d t lt.eq 2 C_(h \, mu)^2 sum_(n gt.eq 0) 2^(- \( 1 + 2 h \) n^2) Lambda^(2 n mu_z) < oo . $

The loader occupies a compact time interval and adds a finite amount. Now prescribe

#[#set math.equation(numbering: n => "(8)")
 $ f = partial_t U + \( U dot.op nabla \) U - nu Delta U . $ <eq:force>]

Then $\( u \, p \) = \( U \, 0 \)$ solves (1). Every mixed derivative of $f$ is a finite sum of derivatives of $U$ and products of two such derivatives. Each factor is bounded, and each has the stated temporal $L^2$ norm; use one bounded factor and one $L^2$ factor in a product. All force estimates in the theorem follow. Integration of (8) over the torus gives zero mean, because $U$ has zero mean and $\( U dot.op nabla \) U = "div" \( U ⊗ U \)$.

=== 5.2 Uniqueness for the constructed torus flow <uniqueness-for-the-constructed-torus-flow>

The residual identity gives the solution. We now show that its particle event is determined by the force and initial data. The proof is the classical difference-energy comparison [6] Section 18. If $\( v \, p \)$ is another solution in the classical class of Section 2, set $w = v - U$. Subtraction gives

$ w_t + \( v dot.op nabla \) w + \( w dot.op nabla \) U = - nabla p + nu Delta w \, #h(2em) "div" w = 0 . $

Multiplication by $w$ and periodic integration by parts yield

$ 1 / 2 frac(d, d t) parallel w parallel_2^2 + nu parallel nabla w parallel_2^2 lt.eq parallel nabla U parallel_(oo \, upright("op")) parallel w parallel_2^2 . $

The stated continuity of $v_t$, the first two spatial derivatives and pressure gradient justifies all these operations. The transport and pressure terms vanish by incompressibility. Boundedness of $nabla U$ on each finite interval and $w \( 0 \) = 0$ give $w = 0$ by Gronwall’s inequality. The equation then gives $nabla p = 0$, and mean-zero normalization gives $p = 0$. Smoothness and bounded spatial gradient on the compact torus give a unique material flow through every finite time. Thus the event already proved for $U$ belongs to the unique fluid solution. Appendix 6.1 supplies the corresponding noncompact comparison theorem and the finite-time flow identities.

=== 5.3 Solenoidal forcing with the same velocity <solenoidal-forcing-with-the-same-velocity>

The Helmholtz–Leray projection removes the divergence of the force. Because it changes a gradient, it also changes the pressure. The following quantitative version is useful both for the present $L^2$ bounds and for other time profiles.

#thm([Lemma 1.])[
  (Effective periodic projection).  #emph[Let $g$ be a smooth mean-zero vector field on $\[ 0 \, oo \) times bb(T)^3$, effectively evaluable together with all mixed derivatives and with effective bounds for those derivatives on every finite time interval. There is a unique smooth mean-zero $phi.alt$ satisfying $Delta phi.alt = "div" g$. Both $phi.alt$ and $g_(upright("sol")) = g - nabla phi.alt$ are effective, and $g_(upright("sol"))$ is divergence free and mean zero. For every $h gt.eq 0$ and spatial multi-index $mu$, 
#[#set math.equation(numbering: n => "(9)")
 $ parallel partial_t^h partial_X^mu nabla phi.alt \( t \) parallel_oo lt.eq C_mu max_(1 lt.eq i lt.eq 3) parallel partial_t^h partial_(X_i)^(\| mu \| + 5) g \( t \) parallel_oo . $ <eq:projection-estimate>]

 Thus, when all mixed derivatives of $g$ are bounded, square-integrable in time in spatial supremum norm, or rapidly decaying, the same property holds for $g_(upright("sol"))$. Here rapid decay means a finite supremum after multiplication by $\( 1 + t \)^A$, for every $A gt.eq 0$ and every fixed derivative order. Time periodicity and stationarity after a given time are also preserved. If $\( U \, P \)$ solves the equation with force $g$, then it solves it with force $g_(upright("sol"))$ and pressure $P - phi.alt$. More precisely, any common pointwise time weight on the finitely many derivatives on the right of (9) passes to the derivative on its left. Thus a specified polynomial bound is preserved whenever those higher spatial derivatives have that bound.]
] <lem:projection>

#proof[
  For the Fourier basis $e^(2 pi i k dot.op X)$ set
  $ hat(phi.alt) \( k \) = - frac(i k dot.op hat(g) \( k \), 2 pi \| k \|^2) quad \( k eq.not 0 \) \, #h(2em) hat(phi.alt) \( 0 \) = 0 . $
  The multiplier for $nabla phi.alt$ is $k k^(sans(T)) \/ \| k \|^2$, whose operator norm is one. For a derivative of order $r$, integrate the coefficients of $partial_t^h g$ by parts $r + 5$ times in a coordinate with maximal $\| k_i \|$. A term of the differentiated series is bounded by a fixed multiple of $\| k \|^(- 5)$ times the right-hand derivative norm in (9). There are $O \( n^2 \)$ points in the shell $parallel k parallel_oo = n$. The series and its derivatives therefore converge absolutely, with an explicit tail bounded by $C sum_(n > K) n^(- 3)$. The series for $phi.alt$ has one further factor $\| k \|^(- 1)$. Termwise differentiation proves the Poisson equation; the Fourier coefficients also prove uniqueness among mean-zero solutions and establish (9).
  The Fourier identification used here is justified in Appendix 6.2. Since $g$ is real, $hat(phi.alt) \( - k \) = overline(hat(phi.alt) \( k \))$, so $phi.alt$ is real.
  Riemann sums with a bound on one more spatial derivative compute each coefficient to any requested error. Combined with the tail estimate, this gives effective evaluation of every derivative. The estimate is pointwise in time and commutes with time derivatives, so it proves each stated norm and weighted-decay assertion. Linearity and uniqueness of the mean-zero Poisson solution preserve periodicity and eventual stationarity. Finally,
  $ - nabla \( P - phi.alt \) + \( g - nabla phi.alt \) = - nabla P + g \, $
  which proves the pressure formula. Conversely, a classical solution with force $g_(upright("sol"))$ and pressure $p$ solves the equation with force $g$ and pressure $p + phi.alt$. This correspondence preserves the normalized classical class on the torus, since $phi.alt$ is smooth and mean zero. It therefore preserves uniqueness for fixed initial data, as well as the reference velocity. ◻
]

To apply Lemma 1 to the force in (8), we still need to verify its effective-evaluation hypotheses. The next subsection supplies them and completes the optional solenoidal construction. This periodic projection does not assert preservation of compact support on a Euclidean domain, nor does it preserve pressure zero.

=== 5.4 Effective evaluation without a simulated execution <effective-evaluation-without-a-simulated-execution>

It remains to check that the prescription really is effective. We record the elementary fact about smooth profiles separately so that its computational hypothesis is explicit.

#thm([Lemma 2.])[
  (Effective smooth profiles).  #emph[The functions $rho \, sigma$ defined in Section 4 and their finite products, sums, translations, and positive rescalings by computable parameters have effective evaluations of every derivative, with effective derivative bounds on compact sets. A reciprocal may be included when an effective positive lower bound for its denominator is given. A compactly supported profile periodized through zero collars has the same property if a rational box containing its support is supplied. An infinite sum of such profiles has this property on compact sets if a finite superset of all possibly active indices can be computed there.]
] <lem:profiles>

#proof[
  On $s > 0$, derivatives of $rho$ have the form $P \( 1 \/ s \) e^(- 1 \/ s)$, where $P$ is an effectively computable polynomial. For $v > 0$, $v^m e^(- v) lt.eq \( m + k \) ! v^(- k)$ bounds every monomial and gives an effective neighborhood of zero where each derivative is smaller than a requested error. Away from that neighborhood ordinary effective arithmetic and the exponential evaluate it. This avoids deciding whether the supplied real is exactly zero. The denominator of $sigma$ is at least $e^(- 2)$; quotient differentiation therefore gives effective bounds as well. The finite operations in the statement preserve these properties by their differentiation rules.
  For a profile $psi$ with support in a supplied rational interval $\[ a \, b \]$, obtain a rational $q$ with $\| s - q \| lt.eq 1$. A translate $psi \( s - k \)$ can be nonzero only for an integer $k in \[ q - b - 1 \, q - a + 1 \]$. Evaluating all integers in this rational interval therefore computes the periodization and each of its derivatives; no integer-part computation on the real $s$ is required. The same argument works coordinatewise for a supplied rational box. A supplied finite active-index bound reduces the last assertion to a finite sum. Local finiteness without that effective bound would not suffice for this argument. ◻
]

All tables, rational initial codes, affine maps and stage times are obtained from the finite input. Lemma 2 applies to their cutoffs and phase functions; the denominators $g_j \( s \)$ have the effective positive lower bounds $min { 1 \, lambda_j }$. The supports of $chi$ and the rectangle cutoffs lie in the rational coordinatewise enlargements of $K$ by $1 \/ 32$ and of $R_j$ by $kappa \/ \( 4 B \)$, respectively. The unperiodized gate defining $b_j$ is supported in $\[ \( j - 1 \/ 4 \) \/ Lambda \, \( j + 1 \/ 4 \) \/ Lambda \]$. Thus every periodization has the supplied support enclosure required by the lemma. For a time argument, obtain a rational upper bound $T > t$. The inequality $t_n gt.eq 1 + 2 n$ gives a finite superset of possible active stages in (6); evaluating all of them is sufficient. Periodizations are evaluated by the same finite-superset procedure in coordinate charts, without deciding a real argument’s integer part. The Gaussian series above gives effective norm bounds: for example, if $n gt.eq 4 Lambda mu_z$, then $Lambda^(2 n mu_z) lt.eq 2^(n^2 \/ 2)$.

We may now apply Lemma 1 to $f$ in (8). It gives an effective mean-zero solenoidal force $f - nabla phi.alt$ with solution $\( U \, - phi.alt \)$, the same derivative bounds, and the same particle event. The lemma’s pressure correspondence also transfers uniqueness from the original force. Riemann sums with derivative error bounds compute the Fourier coefficients, and the summable tail controls truncation. Neither this procedure nor the raw-force evaluation uses the branch sequence $j_0 \, j_1 \, dots.h$. For $t gt.eq 1$ the loader and all its derivatives vanish, so the raw force depends on $M$ and $nu$ but not on $w$. Its spatial projection at that time has the same independence. This completes the proof of Theorem 1.

#thm([Corollary 1.])[
  #emph[No algorithm decides the fixed particle event for every force description produced by this construction.]
]

#proof[
  Compose a proposed decision procedure with the terminating compiler of Theorem 1. The event equivalence would decide whether an arbitrary machine halts on its finite input. This would also decide Turing’s symbol-printing problem [10] Section 8: modify the simulated machine to halt when the specified symbol is printed and to continue forever otherwise, including if the original machine stops without printing it. Turing proves that no such decision procedure exists. Equivalently, one may fix a universal machine and encode the machine and word in its finite input; the same event then tests its computation. ◻
]

== 6 Comparison on noncompact domains and Fourier identification <comparison-on-noncompact-domains-and-fourier-identification>

The main particle theorem is already complete. We record two analytic details separately: a comparison theorem with precise noncompact pressure assumptions, useful for other prescribed flows, and the elementary Fourier uniqueness argument used in the periodic projection.

=== 6.1 The precise comparison class <app:comparison>

Let $Omega$ be $bb(T)^3$, $bb(R)^3$, or $bb(R)^2 times bb(T)$. A classical solution on $\[ 0 \, T \]$ has continuous $u$, $u_t$, all spatial derivatives of $u$ through order two, $p$, and $nabla p$ on the closed time cylinder, and satisfies the equation pointwise. In the noncompact cases we additionally require

#[#set math.equation(numbering: n => "(10)")
 $ u in C \( \[ 0 \, T \] \; H^2 \( Omega \) \) ∩ C^1 \( \[ 0 \, T \] \; L^2 \( Omega \) \) \, #h(2em) p in C \( \[ 0 \, T \] \; H^1 \( Omega \) \) \,\
sup_(\[ 0 \, T \] times Omega) \( \| u \| + \| nabla u \| \) < oo . $ <eq:energy-class>]

The Sobolev spaces are periodic in the torus coordinates. On $bb(T)^3$ the pressure has mean zero; on the noncompact domains its $H^1$ membership fixes the representative, since a nonzero spatial constant is not in $L^2$.

#thm([Lemma 3.])[
  (Prescribed motion and uniqueness).  #emph[Fix $nu > 0$ and $Omega in { bb(T)^3 \, bb(R)^3 \, bb(R)^2 times bb(T) }$. Let $U$ be smooth and divergence free on $\[ 0 \, oo \) times Omega$, with $U \( 0 \) = 0$, and suppose $U$ and $nabla U$ are bounded on every finite closed time cylinder. In the noncompact cases assume the velocity conditions in (10). Then the force 
$ cal(F)_nu \[ U \] = U_t + \( U dot.op nabla \) U - nu Delta U $

 has the solution $\( u \, p \) = \( U \, 0 \)$, unique in the classical class just defined on each finite time interval. Its material trajectories exist uniquely for every finite time. On $bb(T)^3$, mean-zero $U$ gives mean-zero $cal(F)_nu \[ U \]$.]
  #emph[More generally, if an independently constructed pair $\( U \, P \)$ is a classical solution in the same class for a given force and initial velocity, it is the unique solution for those data in that class. In either noncompact uniqueness statement, the competitor’s gradient bound can be omitted while keeping its bounded velocity and all other conditions. The reference velocity $U$ still has bounded gradient. For smooth $U$, each finite-time material map $Phi_t$ is a smooth diffeomorphism and satisfies 
$ U \( t \, dot.op \) = \( partial_t Phi_t \) compose Phi_t^(- 1) \, #h(2em) partial_(t t) Phi_t \( a \) = \( f - nabla P + nu Delta U \) \( t \, Phi_t \( a \) \) . $

]
] <lem:realization>

#proof[
  Substitution proves the residual assertion. For either uniqueness statement, let $\( v \, p \)$ be another solution for the same data, and set $w = v - U$ and $q = p - P$. Subtracting the equations gives
  $ w_t + \( v dot.op nabla \) w + \( w dot.op nabla \) U = - nabla q + nu Delta w \, #h(2em) "div" w = 0 . $
  On the torus, multiplication by $w$ and periodic integration give
  #[#set math.equation(numbering: n => "(11)")
   $ 1 / 2 frac(d, d t) parallel w parallel_2^2 + nu parallel nabla w parallel_2^2 lt.eq parallel nabla U \( t \) parallel_(oo \, upright("op")) parallel w parallel_2^2 . $ <eq:energy-comparison>]
  The transport and pressure integrals vanish by incompressibility.
  Here are the cutoff details on the other two domains. Let $x'$ denote the noncompact coordinates, choose $0 lt.eq zeta lt.eq 1$ smooth with compact support, equal to one on $\| x' \| lt.eq 1$, and set $zeta_R \( x' \) = zeta \( x' \/ R \)$. Multiply the difference equation by $zeta_R w$ and integrate in all coordinates. Integration by parts leaves, besides the term $- integral zeta_R w dot.op \( w dot.op nabla \) U$, three boundary errors. Their absolute values are at most
  $ C / R parallel v parallel_oo parallel w parallel_2^2 \, #h(2em) C / R parallel q parallel_2 parallel w parallel_2 \, #h(2em) frac(C nu, R) parallel nabla w parallel_2 parallel w parallel_2 \, $
  respectively for transport, pressure, and viscosity. For example, the pressure term is $integral q nabla zeta_R dot.op w$ because $"div" w = 0$. Each displayed norm is uniformly bounded on $\[ 0 \, T \]$ by (10). Also $w in C^1 \( \[ 0 \, T \] \; L^2 \)$ justifies differentiating $integral zeta_R \| w \|^2$. Integrate the identity between any two times and then let $R arrow.r oo$. Dominated convergence applies to the quadratic terms and the error integrals tend to zero. This gives (11) in integrated form, equivalently almost everywhere in time. Thus no decay of the pressure beyond the stated $C_t H^1$ condition has been assumed.
  On every finite interval the coefficient in (11) is bounded. Its integrating factor and $w \( 0 \) = 0$ imply $w = 0$. The equation then gives $nabla q = 0$; the mean-zero or $H^1$ pressure convention gives $q = 0$. The estimates use boundedness of $v$ but never a bound on $nabla v$, which proves the stated competitor extension.
  Finally, bounded spatial gradient gives a uniformly Lipschitz vector field on each finite time interval, so the material ODE has unique local solutions. Bounded velocity prevents escape to infinity in finite time. Successive local solutions therefore cover each finite interval, and periodic coordinates descend to their quotients. Solving the same ODE backwards on $\[ 0 \, t \]$ gives the inverse map. Smooth dependence on the initial point proves the diffeomorphism assertion; differentiating the trajectory equation proves the two displayed identities. For the mean assertion, integrate the residual: the integrals of $Delta U$ and $\( U dot.op nabla \) U = "div" \( U ⊗ U \)$ vanish on the torus. ◻
]

=== 6.2 Identifying continuous periodic functions <app:fourier>

A continuous function on $bb(T)^3$ is determined by its Fourier coefficients. Here is the approximate-identity argument used in Lemma 1.

In one variable,

$ F_N \( s \) = 1 / N lr(|sum_(j = 0)^(N - 1) e^(2 pi i j s)|)^2 $

is nonnegative, has integral one, and has Fourier coefficients $\( 1 - \| k \| \/ N \)_(+)$. Outside any fixed neighborhood of the integers, the geometric-sum formula bounds $F_N$ by $C \/ N$. Hence the product of three such kernels has mass tending to one in every neighborhood of zero. Uniform continuity shows that convolution with this product converges uniformly to any continuous function on $bb(T)^3$. Vanishing Fourier coefficients therefore imply a vanishing function.

#heading(level: 1)[References]
#bibitem([1])[C.~H. Bennett, Logical reversibility of computation, #emph[IBM J. Res. Develop.] #strong[17] (1973), 525--532. #link("https://doi.org/10.1147/rd.176.0525")[`doi:10.1147/rd.176.0525`].]
#bibitem([2])[R. Cardona, E. Miranda and D. Peralta-Salas, Computability and Beltrami fields in Euclidean space, #emph[J. Math. Pures Appl.] #strong[169] (2023), 50--81. #link("https://doi.org/10.1016/j.matpur.2022.11.007")[`doi:10.1016/j.matpur.2022.11.007`]. #link("https://arxiv.org/abs/2111.03559v3")[`arXiv:2111.03559v3`].]
#bibitem([3])[R. Cardona, E. Miranda, D. Peralta-Salas and F. Presas, Constructing Turing complete Euler flows in dimension 3, #emph[Proc. Natl. Acad. Sci. USA] #strong[118] (2021), e2026818118. #link("https://doi.org/10.1073/pnas.2026818118")[`doi:10.1073/pnas.2026818118`].]
#bibitem([4])[S. Dyhr, Á. González-Prieto, E. Miranda and D. Peralta-Salas, Turing complete Navier--Stokes steady states via cosymplectic geometry, #emph[PNAS Nexus] #strong[5] (2026), pgag131. #link("https://doi.org/10.1093/pnasnexus/pgag131")[`doi:10.1093/pnasnexus/pgag131`].]
#bibitem([5])[R. Landauer, Irreversibility and heat generation in the computing process, #emph[IBM J. Res. Develop.] #strong[5] (1961), 183--191. #link("https://doi.org/10.1147/rd.53.0183")[`doi:10.1147/rd.53.0183`].]
#bibitem([6])[J. Leray, Sur le mouvement d'un liquide visqueux emplissant l'espace, #emph[Acta Math.] #strong[63] (1934), 193--248. #link("https://doi.org/10.1007/BF02547354")[`doi:10.1007/BF02547354`].]
#bibitem([7])[C. Moore, Unpredictability and undecidability in dynamical systems, #emph[Phys. Rev. Lett.] #strong[64] (1990), 2354--2357. #link("https://doi.org/10.1103/PhysRevLett.64.2354")[`doi:10.1103/PhysRevLett.64.2354`].]
#bibitem([8])[C. Moore, Generalized shifts: unpredictability and undecidability in dynamical systems, #emph[Nonlinearity] #strong[4] (1991), 199--230. #link("https://doi.org/10.1088/0951-7715/4/2/002")[`doi:10.1088/0951-7715/4/2/002`].]
#bibitem([9])[OpenAI, Universal Computation with Eventually Stationary Navier--Stokes Forcing, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Universal-Computation-with-Eventually-Stationary-Navier-Stokes-Forcing-September-27-2026/manuscript.pdf")[OAI:Universal-Computation-with-Eventually-Stationary-Navier-Stokes-Forcing-September-27-2026], 2026.]
#bibitem([10])[A.~M. Turing, On computable numbers, with an application to the Entscheidungsproblem, #emph[Proc. London Math. Soc.] (2) #strong[42] (1936--1937), 230--265. #link("https://doi.org/10.1112/plms/s2-42.1.230")[`doi:10.1112/plms/s2-42.1.230`].]


