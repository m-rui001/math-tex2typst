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

#align(center)[#text(size: 16pt, weight: "bold")[Computation under Rapidly Vanishing Navier--Stokes Forcing]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 The question and the three memories <sec:introduction>

Can an incompressible fluid continue to compute when its velocity, its force, and every fixed derivative of both become smaller than every inverse power of time? A particle in such a field has finite total path length. Nevertheless, finite length does not bound the information stored in an exact real coordinate. We exploit this distinction by putting successive configurations at increasingly fine spatial scales.

Here computation means a particular reachability problem. Fix a flat domain, a viscosity $nu > 0$, zero initial velocity, one initial particle position $a_(*)$, and an open set $O$. The input is a finite program describing an external force. The question is whether the material trajectory from $a_(*)$ enters $O$ at some finite time. Our compiler takes a deterministic Turing machine and a finite input word to such a force program. Its output prescribes the local instruction rule at every spatial code. The particle performs the iteration; the compiler does not first run the computation and then prescribe its trace.

The logical obstruction comes from Turing’s undecidable symbol-printing problem [10] Section 8. To put a tape into a bounded continuous space, one can use a positional expansion. Moore developed this connection through generalized shifts, where a local tape instruction becomes a piecewise affine change of real coordinates [7,8]. An additional difficulty is that a smooth flow is invertible between finite times, whereas a machine instruction may erase information. Landauer discussed the role of retaining intermediate information [5] Section 3; Bennett gave an explicit reversible simulation that records executed instruction indices [1]. Our fields retain entire configuration records at finer scales instead. No reversible compiler is needed for any of the three constructions.

There are several fluid settings in which computation has already been realized. Cardona, Miranda, Peralta-Salas and Presas constructed stationary Euler flows on an adapted Riemannian three-sphere [3]. Cardona, Miranda and Peralta-Salas later obtained universal Beltrami fields in Euclidean three-space; their computational set is noncompact and the fields have infinite energy [2] Theorem 1. The same work gives robust simulations for tape-bounded machines on a flat torus, controlling the orbit while it remains in a specified compact region [2] Theorems 2 and 26. Its viscous construction begins with nonzero initial velocity and uses a finite interval of Beltrami time, chosen to cover the bounded computation [2] Remark 29. These results distinguish unrestricted exact computation from robust bounded computation. Dyhr, González-Prieto, Miranda and Peralta-Salas obtain stationary, unforced particle computation for every viscosity on compact Hodge-admissible three-manifolds, after deforming the metric [4] Theorem A. Here Hodge-admissibility means the presence of a nowhere-zero harmonic one-form. Their velocity is nonzero and harmonic for the Hodge Laplacian, so its viscous term vanishes. Our data are zero initial velocity and a prescribed external force on a fixed flat domain. In the Euclidean constructions both force and velocity have fixed compact spatial support.

An ordinary change of clock does not explain the conclusion here. For a bounded recurring field $V$, the reparametrization $U \( t \) = tau' \( t \) V \( tau \( t \) \)$ must have $tau \( t \) arrow.r oo$ to traverse infinitely many internal steps. A rapidly decreasing nonnegative $tau'$ is integrable and cannot meet that condition. This observation does not rule out other cancellations or other models; it identifies why an onto slowdown alone is insufficient for our construction. We instead keep the physical step length equal to one and shrink the spatial displacement. The next displacement is so much smaller than the current reading scale that it absorbs every fixed derivative cost.

The three constructions keep the instruction being read valid throughout the motion that writes the next record. They achieve this in different ways. In Section 3, the state, absolute head position and whole finite tape window form an integer code. Disjoint compact curls carry the spatial addresses along with their localized velocity fields; the next displacement is much smaller than the separation between addresses. This gives the compactly supported Euclidean construction of Theorem 3 and, by placing it in a fixed torus chart, Corollary 4.

Section 4 instead leaves the coordinate being read stationary while appending the next configuration to a second coordinate. The two coordinates exchange roles on successive steps (Theorem 5). Section 5 uses a single periodic memory coordinate: divisibility removes old records from its residue, and the new displacement stays inside the constant plateau of the selector that read the instruction. A second coordinate signals halting. A third velocity component makes this planar motion incompressible without changing the observed particle (Theorem 6). Thus each construction resolves the same reading-during-writing problem with a different geometric mechanism.

All three constructions use exact observation. A nonhalting particle approaches, or lies on, the boundary of its detector, and a late halting signal may be arbitrarily small. Moore already emphasized the fragility of whole-tape positional encodings [8] Section 7. Our results supply no uniform finite-precision detection tolerance. Section 6 makes this limitation precise and derives undecidability of the corresponding fixed particle tests.

== 2 Forces, solution classes, and effective profiles <sec:analytic>

Write $bb(T) = bb(R) \/ bb(Z)$. On $Omega = bb(R)^3$ or the unit flat torus $bb(T)^3$, we use the convention

#[#set math.equation(numbering: n => "(1)")
 $ partial_t u + \( u dot.op nabla \) u = - nabla p + nu Delta u + f \, #h(2em) "div" u = 0 \, #h(2em) u \( 0 \, dot.op \) = 0 . $ <eq:NS>]

The viscosity is fixed and positive. Algorithmic assertions assume that it is computable. The displayed residual formulas also have their relative meaning for a fixed noncomputable viscosity: their coefficients are effective relative to that parameter. The material flow $X^u$ solves $partial_t X^u \( t \, a \) = u \( t \, X^u \( t \, a \) \)$, $X^u \( 0 \, a \) = a$. Subscripts on $X^u$ denote its spatial coordinates.

A classical solution has $u \, u_t$, spatial derivatives of $u$ through order two, $p$, and $nabla p$ continuous on each finite closed time cylinder and satisfies (1) pointwise. On the torus all fields are periodic and pressure has mean zero. On $bb(R)^3$ we additionally require, for every finite $T$,

#[#set math.equation(numbering: n => "(2)")
 $ u in C \( \[ 0 \, T \] \; H^2 \) ∩ C^1 \( \[ 0 \, T \] \; L^2 \) \, #h(2em) p in C \( \[ 0 \, T \] \; H^1 \) \, #h(2em) sup_(\[ 0 \, T \] times bb(R)^3) \( \| u \| + \| nabla u \| \) < oo . $ <eq:energy-class>]

The constructed solutions are smooth up to $t = 0$. These are uniqueness classes for the data we construct, not a global existence assertion for arbitrary forces or initial velocities.

For a smooth divergence-free field $U$ with $U \( 0 \) = 0$, set

#[#set math.equation(numbering: n => "(3)")
 $ cal(R)_nu \[ U \] = U_t + \( U dot.op nabla \) U - nu Delta U . $ <eq:residual>]

We use the following two analytic facts in their exact stated classes. The realization and uniqueness statement is [9] Lemma 3, Appendix A.1, whose proof includes the noncompact cutoff argument. The effective periodic projection is [9] Lemma 1, proved using quantitative Fourier tails. We restate the needed conclusions so that every application below specifies its assumptions.

#thm([Lemma 2.1.])[
  (Realization and uniqueness).  #emph[Let $U$ be smooth and divergence free on $\[ 0 \, oo \) times Omega$, with $U \( 0 \) = 0$ and bounded $U \, nabla U$ on finite time intervals. On $bb(R)^3$ suppose also that $U$ has the velocity regularity in (2). Then $\( U \, 0 \)$ is the unique solution with force $cal(R)_nu \[ U \]$ in the classical class just specified. Its material flow is defined uniquely for all finite times. On $bb(T)^3$, a mean-zero $U$ has mean-zero residual. The same uniqueness conclusion holds for an independently established reference solution $\( U \, P \)$ in the class. In the noncompact uniqueness assertion, a bound on the competitor’s gradient may be omitted while keeping its bounded velocity and all other conditions in (2). The reference field still has bounded gradient.]
] <lem:realization>

The underlying estimate is the classical difference-energy estimate [6] Section 18:

$ 1 / 2 frac(d, d t) parallel v - U parallel_2^2 + nu parallel nabla \( v - U \) parallel_2^2 lt.eq parallel nabla U parallel_oo parallel v - U parallel_2^2 . $

Its noncompact proof uses exactly the pressure integrability in (2). Every Euclidean velocity below has fixed compact support and all derivatives bounded on finite intervals, so it satisfies all of these hypotheses directly. All Euclidean uniqueness statements below include the competitor extension in Lemma 1.

#thm([Lemma 2.2.])[
  (Effective solenoidal projection).  #emph[Let $g$ be an effectively specified smooth mean-zero field on $\[ 0 \, oo \) times bb(T)^3$, with effective bounds for every mixed derivative on finite time intervals. There is an effective smooth mean-zero $phi.alt$ with $Delta phi.alt = "div" g$. The field $g - nabla phi.alt$ is solenoidal and mean zero. If $\( U \, P \)$ solves (1) for $g$, then $\( U \, P - phi.alt \)$ solves it for $g - nabla phi.alt$. Every bound of the form $sup_(t \, x) \( 1 + t \)^J \| partial_t^l partial_x^alpha g \| < oo$ for all $J \, l \, alpha$ is preserved. Effective constants for the projected bounds can be computed from effective constants for the corresponding bounds on $g$ at finitely many higher spatial orders.]
] <lem:projection>

For reference, its Fourier coefficients are

#[#set math.equation(numbering: n => "(4)")
 $ hat(phi.alt) \( k \) = - frac(i k dot.op hat(g) \( k \), 2 pi \| k \|^2) quad \( k eq.not 0 \) \, #h(2em) hat(phi.alt) \( 0 \) = 0 . $ <eq:projection>]

This projection changes pressure. It supplies no compact-support preservation statement on Euclidean space.

=== 2.1 What the program can evaluate <what-the-program-can-evaluate>

An effective prescription takes the finite machine and word to a finite program that evaluates the force and every requested mixed derivative at computably supplied arguments to arbitrary prescribed rational error. It also gives bounds for every fixed derivative order in the indicated weighted classes. No efficiency estimate is asserted. The residual is of the form $f^(\( 0 \)) + nu f^(\( 1 \))$, with both coefficient fields effective independently of $nu$.

All smooth profiles can be built from

$ rho \( r \) = cases(delim: "{", e^(- 1 \/ r) \, & r > 0 \,, 0 \, & r lt.eq 0 \,) #h(2em) H \( r \) = frac(rho \( r \), rho \( r \) + rho \( 1 - r \)) \, #h(2em) theta \( r \) = H \( 2 r - 1 \/ 2 \) . $

Thus $theta$ is zero on $\( - oo \, 1 \/ 4 \]$ and one on $\[ 3 \/ 4 \, oo \)$. Products of rational translates and rescalings of $H$ give cutoffs equal to one on a neighborhood of a prescribed rational box and zero outside a prescribed rational enlargement. The derivatives of $rho$ on the positive half-line are polynomials in $1 \/ r$ times $e^(- 1 \/ r)$. The inequality $y^m e^(- y) lt.eq \( m + k \) ! y^(- k)$ supplies an effective vanishing estimate at zero, and the denominator of $H$ is at least $e^(- 2)$. These bounds permit evaluation at flat endpoints without deciding equality of an arbitrary computable real to an endpoint.

Every time sum below has unit slots separated by fixed zero collars. A rational enclosure of a time argument selects a finite superset of possible slots; one evaluates all of them. Spatially periodic profiles are handled by finite supersets of neighboring translates in the same way. Each memory construction will supply its own finite spatial selection bound. This step is essential: the use of exact coordinates does not provide a decision procedure for testing exact real equality.

== 3 Addressed compact curls <sec:addressed>

The first construction assigns a localized curl to each point of a fine spatial grid. Its displacement depends on the configuration encoded by that address. The curl carries its center along the prescribed path, while disjoint supports keep neighboring instructions separate. Retaining old configuration codes at coarser scales lets these small motions implement transitions that need not be reversible.

#thm([Theorem 3.1.])[
  (Compact support and rapid decay).  #emph[Fix a positive computable viscosity $nu$. From a deterministic Turing machine $M$ and a finite input $w$ one can effectively construct a smooth force on $\[ 0 \, oo \) times bb(R)^3$, supported for all times in the fixed compact set 
$ K = \[ - 2 \, 1 \] times \[ - 1 \, 2 \] times \[ - 1 \, 1 \] \, $

 such that, for every pair of nonnegative integers $J \, l$ and spatial multi-index $alpha$, 
#[#set math.equation(numbering: n => "(5)")
 $ sup_(t gt.eq 0 \, thin x in bb(R)^3) \( 1 + t \)^J \| partial_t^l partial_x^alpha f \( t \, x \) #scale(x: 120%, y: 120%)[\|] < oo . $ <eq:rapid-force-bound>]

 The Navier–Stokes equation with this force and zero initial velocity has an explicit global smooth solution, unique in the finite-interval class (2). Its material trajectory from the origin satisfies 
#[#set math.equation(numbering: n => "(6)")
 $ M upright(" halts on ") w quad arrow.l.r.double quad X_1 \( t \, 0 \) < - 1 upright(" for some ") t gt.eq 0 . $ <eq:rapid-event>]

 The velocity has the same fixed support and rapid mixed-derivative bounds. The pressure is zero. The force is a general body force. Because $K$ is fixed, the same bounds hold with $\( 1 + t + \| x \| \)^J$ in place of $\( 1 + t \)^J$.]
] <thm:rapid>

=== 3.1 One transition on a complete finite configuration <one-transition-on-a-complete-finite-configuration>

Use a tape indexed by $bb(Z)$, a head initially at $0$, and input symbols in cells $0 \, dots.h \, B - 1$, where $B = \| w \|$, with all other cells blank. A transition writes one symbol and moves the head by $d in { - 1 \, 0 \, 1 }$. Normalize missing transitions to enter a fresh terminal state without moving or changing the scanned symbol, and give terminal states no outgoing transitions. This preserves halting. Write $Q$, $Q_h subset Q$, and $Gamma$ for the resulting state set, terminal set, and alphabet. Number the states and symbols consecutively from zero, giving the blank symbol number zero. Choose integers $r_A \, r_Q gt.eq 1$ so that

$ A = 2^(r_A) gt.eq \| Gamma \| \, #h(2em) S = 2^(r_Q) gt.eq \| Q \| . $

After $n$ transitions, the head $i$ satisfies $\| i \| lt.eq n$, and every nonblank cell lies in $\[ - n \, n + B \]$. Define

#[#set math.equation(numbering: n => "(7)")
 $ P_n & = 2^(n + 2) \, & M_n & = S P_n A^(2 n + B + 1) = 2^(L_n) \,\
 &  & L_n & = r_Q + n + 2 + r_A \( 2 n + B + 1 \) . $ <eq:rapid-capacity>]

For the configuration $\( q \, tau \, i \)$ at that time, put

#[#set math.equation(numbering: n => "(8)")
 $ T = sum_(v = - n)^(n + B) "id" \( tau \( v \) \) A^(v + n) \, #h(2em) j = i + n \, #h(2em) k_n = "id" \( q \) + S \( j + P_n T \) . $ <eq:rapid-code>]

Here $0 lt.eq j lt.eq 2 n < P_n$, so $0 lt.eq k_n < M_n$. The code and $n$ recover the state, the head, and the entire tape, with blank extensions.

The following functions are defined on #emph[every] integer $0 lt.eq k < M_n$, not only on configurations reached from the input. Extract

$ r = k med mod med S \, #h(2em) j = floor.l k \/ S floor.r med mod med P_n \, #h(2em) T = floor.l k \/ \( S P_n \) floor.r . $

Let $h_n \( k \)$ be one if $r$ identifies a terminal state and zero otherwise. If $r$ identifies a nonterminal state, $j lt.eq 2 n$, and $z = floor.l T \/ A^j floor.r med mod med A$ identifies an alphabet symbol, look up the single transition $\( q \, z \) mapsto \( q' \, z' \, d \)$ and set

#[#set math.equation(numbering: n => "(9)")
 $ F_n \( k \) = "id" \( q' \) + S #scale(x: 120%, y: 120%)[\(] j + d + 1 + P_(n + 1) A \( T + \( z' - z \) A^j \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rapid-transition>]

In all other cases set $F_n \( k \) = 0$. In the lookup case, replacing the $j$th digit gives an integer in $\[ 0 \, A^(2 n + B + 1) \)$. Multiplication by $A$ adds the new blank cell on the left, and the two-place enlargement of the tape window leaves a blank cell on the right. Also $0 lt.eq j + d + 1 lt.eq 2 n + 2 < P_(n + 1)$. Consequently

#[#set math.equation(numbering: n => "(10)")
 $ 0 lt.eq F_n \( k \) < M_(n + 1) \, #h(2em) k_(n + 1) = F_n \( k_n \) quad upright("at each actual nonterminal step") . $ <eq:rapid-transition-range>]

The range assertion does not require unscanned digits of a padded code to represent genuine alphabet symbols.

=== 3.2 Reading the newest record while retaining the earlier ones <reading-the-newest-record-while-retaining-the-earlier-ones>

Set

#[#set math.equation(numbering: n => "(11)")
 $ C = max { 1 \, L_0 \, 1 + 2 r_A } \, #h(2em) s_n = C 2^(\( n + 2 \)^2) \,\
delta_n = 2^(- s_n) \, #h(2em) D_n = 2^(s_n) \, #h(2em) b_n = delta_(n + 1) M_(n + 1) . $ <eq:rapid-scales>]

These quantities depend on the machine and input length, not on its execution. The elementary bounds are

$ L_n lt.eq C \( n + 1 \) \, #h(2em) s_n gt.eq 16 C \( n + 1 \) \, #h(2em) s_(n + 1) / s_n = 2^(2 n + 5) gt.eq 32 \( n + 1 \) . $

These estimates give

#[#set math.equation(numbering: n => "(12)")
 $ & sum_(n gt.eq 0) delta_n M_n lt.eq sum_(n gt.eq 0) 2^(- 15 \( n + 1 \)) < 1 \,\
 & b_n lt.eq delta_n^(n + 10) < delta_n \/ 8 \,\
 & 0 lt.eq j < n quad arrow.r.double quad delta_j \/ delta_n upright(" is an integer multiple of ") M_n . $ <eq:rapid-total-memory>]

For the second assertion, use $s_(n + 1) - L_(n + 1) gt.eq \( 15 \/ 16 \) s_(n + 1) gt.eq 30 \( n + 1 \) s_n gt.eq \( n + 10 \) s_n$. For the third, $s_n - L_n gt.eq \( 15 \/ 16 \) s_n gt.eq 30 s_(n - 1) gt.eq s_j$ when $j < n$, using $s_n \/ s_(n - 1) gt.eq 32$. The strict inequality in (12) follows from $delta_n lt.eq 2^(- 16)$.

Up to the first halt, store the actual configurations at

#[#set math.equation(numbering: n => "(13)")
 $ y_n = sum_(j = 0)^n delta_j k_j in \[ 0 \, 1 \) . $ <eq:rapid-history>]

This number is an integer multiple $m delta_n$, with $0 lt.eq m < D_n$. Equation (12) gives the essential read operation:

#[#set math.equation(numbering: n => "(14)")
 $ m med mod med M_n = k_n . $ <eq:rapid-read>]

Thus the current code can be read without discarding the old codes. This uses the information-retention principle of reversible computation [5,1], with spatial digits in place of a history tape. Retaining this history permits a diffeomorphic flow to realize a machine whose transition map is not injective: in the realization below, distinct grid addresses start at least $delta_n$ apart in the coding coordinate and move by less than $delta_n \/ 8$, even when their next codes coincide.

=== 3.3 Moving each address by a localized curl <moving-each-address-by-a-localized-curl>

With the switch $H$ and progress function $theta$ of Section 2, set

$ zeta \( v \) = product_(ell = 1)^3 H #scale(x: 120%, y: 120%)[\(] 16 \( v_ell + 1 \/ 8 \) #scale(x: 120%, y: 120%)[\)] H #scale(x: 120%, y: 120%)[\(] 16 \( 1 \/ 8 - v_ell \) #scale(x: 120%, y: 120%)[\)] . $

The nondecreasing function $theta$ is zero for $s lt.eq 1 \/ 4$ and one for $s gt.eq 3 \/ 4$. The bump $zeta$ is supported in $\[ - 1 \/ 8 \, 1 \/ 8 \]^3$ and equals one on $\[ - 1 \/ 16 \, 1 \/ 16 \]^3$. All required derivative bounds are effective.

For a prescribed center path $c \( sigma \)$ and a spatial scale $delta > 0$, the curl field

#[#set math.equation(numbering: n => "(15)")
 $ cal(V) \( sigma \, x \) = nabla_x times [zeta (frac(x - c \( sigma \), delta)) frac(dot(c) \( sigma \) times \( x - c \( sigma \) \), 2)] $ <eq:rapid-curl>]

is divergence-free and equals $dot(c) \( sigma \)$ on a neighborhood of the moving center. Indeed, there the cutoff is one and $nabla_x times \( a times \( x - c \) \) = 2 a$ for constant $a$.

On $0 lt.eq t lt.eq 1$, use (15) with $delta = 1$ and $c \( t \) = theta \( t \) \( - 1 \, y_0 \, 0 \)$, where only the initial code $k_0$ is computed from the input. This defines a velocity $W$ carrying the origin exactly to $\( - 1 \, y_0 \, 0 \)$.

On the $n$th subsequent interval $\[ 1 + n \, 2 + n \]$, let $sigma = t - 1 - n$. For each integer $0 lt.eq m lt.eq D_n$ set

#[#set math.equation(numbering: n => "(16)")
 $ k & = m med mod med M_n \, & a_(n \, m) & = \( - 1 \, m delta_n \, 0 \) \,\
d_(n \, m) & = #scale(x: 120%, y: 120%)[\(] - b_n h_n \( k \) \, thin delta_(n + 1) F_n \( k \) \, thin 0 #scale(x: 120%, y: 120%)[\)] \, & c_(n \, m) \( sigma \) & = a_(n \, m) + theta \( sigma \) d_(n \, m) . $ <eq:rapid-address-motion>]

Let $V_(n \, m)$ be (15) with center $c_(n \, m)$ and scale $delta_n$, and define

#[#set math.equation(numbering: n => "(17)")
 $ W \( t \, x \) = sum_(m = 0)^(D_n) V_(n \, m) \( sigma \, x \) #h(2em) \( 1 + n lt.eq t lt.eq 2 + n \) . $ <eq:rapid-field>]

By (10) and (12), $\| d_(n \, m) \|_oo lt.eq b_n < delta_n \/ 8$. The support of $V_(n \, m)$ is therefore contained in

$ \| x_2 - m delta_n \| < delta_n \/ 4 . $

These supports are pairwise disjoint. In particular the sum can also be evaluated by the nearest grid index; it vanishes on a neighborhood of each boundary between two such choices. Each summand is a smooth curl, and all time pieces vanish on fixed-width neighborhoods of their joins. Every finite time interval meets only finitely many pieces, each with finitely many summands. Hence $W$ is globally smooth and divergence-free, with $W \( 0 \) = 0$. The center and displacement bounds, including the loading segment, place its support in the interior of $K$ for all time.

=== 3.4 Why every fixed derivative decreases rapidly <why-every-fixed-derivative-decreases-rapidly>

For one summand introduce

$ macron(x) = frac(x - a_(n \, m), delta_n) \, #h(2em) eta = d_(n \, m) / delta_n \, #h(2em) xi = d_(n \, m) / b_n . $

Then $V_(n \, m)$ is $b_n$ times the fixed smooth expression

#[#set math.equation(numbering: n => "(18)")
 $ nabla_(macron(x)) times [zeta \( macron(x) - theta \( sigma \) eta \) frac(theta' \( sigma \) xi times \( macron(x) - theta \( sigma \) eta \), 2)] . $ <eq:rapid-scaled-field>]

The parameters $eta \, xi$ lie in $\[ - 1 \, 1 \]^3$. On this compact parameter set the expression has bounded $sigma \, macron(x)$ derivatives of every order, uniformly bounded spatial support, and effective bounds. Disjointness of the summands therefore gives, independently of $n$ and $m$,

#[#set math.equation(numbering: n => "(19)")
 $ parallel partial_t^l partial_x^alpha W \( t \, dot.op \) parallel_oo lt.eq C_(l \, alpha) b_n delta_n^(- \| alpha \|) #h(2em) \( 1 + n lt.eq t lt.eq 2 + n \) . $ <eq:rapid-velocity-estimate>]

In particular there is no factor counting the grid cells. Time differentiation costs no additional negative power of $delta_n$: the center displacement in scaled coordinates is the bounded parameter $eta$ in (18).

Prescribe the force

#[#set math.equation(numbering: n => "(20)")
 $ f = partial_t W + \( W dot.op nabla \) W - nu Delta W . $ <eq:rapid-residual>]

The product rule and (19) give on the $n$th step interval

#[#set math.equation(numbering: n => "(21)")
 $ parallel partial_t^l partial_x^alpha f \( t \, dot.op \) parallel_oo lt.eq C'_(l \, alpha \, nu) (b_n delta_n^(- \| alpha \| - 2) + b_n^2 delta_n^(- \| alpha \| - 1)) . $ <eq:rapid-residual-estimate>]

For fixed derivative orders and all sufficiently large $n$, (12) bounds the right-hand side by a constant times $delta_n$. More explicitly, its two terms are bounded by $delta_n^(n + 8 - \| alpha \|)$ and $delta_n^(2 n + 19 - \| alpha \|)$; $n gt.eq \| alpha \|$ is a sufficient effective cutoff for both exponents to be at least one. Since $delta_n lt.eq 2^(- n)$ and $1 + t lt.eq n + 3$ on this interval, multiplication by any fixed power of $1 + t$ remains bounded. The finitely many preceding intervals and the loading interval have finite bounds individually. This proves (5), and the same argument applies to $W$. All constants needed for a prescribed finite set of orders can be computed: the tail uses the displayed inequalities, and the remaining finite set uses derivatives of the fixed cutoffs.

Lemma 1 now applies to $u = W$, $p = 0$, with the force (20). Compact support and the derivative bounds supply every required finite-interval Sobolev and boundedness condition. It gives the asserted global solution, uniqueness, and well-defined material flow.

=== 3.5 The particle reads its own current configuration <the-particle-reads-its-own-current-configuration>

At time $1$, the observed particle is $\( - 1 \, y_0 \, 0 \)$, and during loading its first coordinate is $- theta \( t \) gt.eq - 1$. Suppose the machine has reached its $n$th configuration and the particle is $\( - 1 \, y_n \, 0 \)$ at time $1 + n$. By (14), this point is the center $a_(n \, m)$ for $m = y_n \/ delta_n$, whose residue is $k_n$. The curve $c_(n \, m) \( sigma \)$ solves the particle equation by (15) and the disjoint supports, so uniqueness identifies it with the actual trajectory throughout the interval.

If the configuration is nonterminal, its first coordinate remains exactly $- 1$ throughout that interval. Its second-coordinate endpoint is $y_n + delta_(n + 1) F_n \( k_n \) = y_(n + 1)$. This proves the configuration correspondence by induction, until a first halt or indefinitely. If the configuration is terminal, the next interval instead ends with first coordinate $- 1 - b_n < - 1$. This also covers an initially terminal machine. Thus a halt produces the event in finite time, whereas a nonhalting run never produces it, even between the coding times.

=== 3.6 Finite evaluation without executing the input <finite-evaluation-without-executing-the-input>

Equations (7)–(17) are a finite program for the prescribed field. At any finite time only a bounded number of possible time pieces need be considered. Their parameters are finite integers and dyadic rationals, although no efficiency is claimed. Each piece is a finite sum of effective smooth functions. Equivalently, a second-coordinate approximation with error less than $delta_n \/ 32$ locates the only possibly active address unless its error interval meets a midpoint between adjacent grid points. In that case the true coordinate is within $delta_n \/ 16$ of the midpoint, and hence outside every supporting strip of half-width $delta_n \/ 4$; the value and all derivatives are zero. An inferred grid index outside $\[ 0 \, D_n \]$ contributes zero. A time approximation with certified error less than $1 \/ 32$ similarly resolves the time piece, or, if its enclosure meets an integer join, places the true time within $1 \/ 16$ of that join. This lies inside the quarter-unit zero collar. Thus the field, its derivatives, and (20) can be evaluated to arbitrary precision, including at the joins, without deciding equality of a real number to a branch boundary.

Crucially, $F_n$ performs one transition lookup on the integer supplied by a #emph[spatial address]. Its definition applies simultaneously to all padded configurations and never computes $k_1 \, k_2 \, dots.h$ from $k_0$. Only $k_0$ is used in loading; the particle’s successive positions perform the iteration. After loading, the entire prescription depends on the input only through its length. Physical steps occupy successive unit intervals, so there is no finite accumulation of computation times. This completes the proof of Theorem 3.

=== 3.7 A solenoidal force on the unit torus <a-solenoidal-force-on-the-unit-torus>

The compact curl field also fits into a fixed interior torus chart. The scale change is made at the velocity level; the force is then recomputed for the specified viscosity.

#thm([Corollary 3.2.])[
  (Solenoidal rapid forcing on the torus).  #emph[Fix a positive computable viscosity. From any deterministic Turing machine $M$ and finite input $w$, one can effectively construct on the unit flat torus $bb(T)^3$ a smooth, solenoidal, spatially mean-zero force satisfying all the bounds (5) with $bb(T)^3$ in place of $bb(R)^3$, with zero initial velocity, such that the unique smooth solution satisfies 
$ M upright(" halts on ") w quad arrow.l.r.double quad 1 / 4 < X_1 \( t \, a_(*) \) < 3 / 8 upright(" for some ") t gt.eq 0 \, #h(2em) a_(*) = \( 1 \/ 2 \, 1 \/ 4 \, 1 \/ 2 \) . $

 Here the inequality denotes the indicated open coordinate slab of the torus. Pressure is normalized to mean zero, and uniqueness holds in the classical periodic class of Section 2. The velocity and all its mixed derivatives also decrease faster than every inverse power of time.]
] <cor:rapid-torus>

#proof[
  Let $W$ be the divergence-free velocity constructed in Theorem 3; its definition does not involve viscosity. Put $lambda = 1 \/ 8$ and $c = \( 1 \/ 2 \, 1 \/ 4 \, 1 \/ 2 \)$, and define in the unit chart
  $ v \( t \, x \) = lambda W (t \, frac(x - c, lambda)) \, $
  extending by zero and then periodically. The fixed support $c + lambda K$ lies strictly inside the unit cube. Thus the extension is smooth, divergence-free, zero initially, and rapidly decreasing with every mixed derivative. The velocity $W$ is a curl at each time, with the compactly supported potentials displayed in (15). If $W = nabla_y times A$, then $v$ is the periodic curl of $lambda^2 A \( t \, \( x - c \) \/ lambda \)$, so $v$ has zero spatial mean.
  For the desired viscosity prescribe first
  $ g = partial_t v + \( v dot.op nabla \) v - nu Delta v . $
  This recomputes the residual at the torus viscosity; no invariance of viscosity under spatial scaling is being assumed. All mixed derivatives of $g$ decrease rapidly, and its spatial mean is zero because $v$ has mean zero, $\( v dot.op nabla \) v = "div" \( v ⊗ v \)$, and the Laplacian has zero integral. Lemma 2 replaces $g$ effectively by its solenoidal, mean-zero projection, preserving all these decay bounds and changing only the pressure, not the velocity.
  In the indicated chart the particle trajectory is exactly $c + lambda X^W \( t \, 0 \)$ as long as this expression remains in the chart, by differentiation and uniqueness. It remains there throughout every nonhalting run and through the first halting signal. During loading its first coordinate is at least $3 \/ 8$; subsequently it is exactly $3 \/ 8$ at every nonterminal step and throughout that step. A terminal step ends at $3 \/ 8 - b_n \/ 8$, which belongs to $\( 1 \/ 4 \, 3 \/ 8 \)$ since $0 < b_n < 1$. The remaining coordinates stay in the same interior chart by (12) and the displacement bounds. There is therefore no wrapping ambiguity before the event, and the claimed equivalence follows. ◻
]

== 4 Alternating fractional memories <sec:alternating>

The second mechanism alternates between two coordinates: the current configuration is read from one coordinate, which stays fixed while the next configuration is appended to the other. Neither coordinate is erased. The available precision increases with the slot index; the displacement needed to write the next block is much smaller than every fixed derivative cost of reading the current block.

#thm([Theorem 4.1.])[
  (Rapid decay with alternating memories).  #emph[Fix a positive computable viscosity. From a deterministic Turing machine and a finite input one can effectively construct a smooth force $f$ on $\[ 0 \, oo \) times bb(R)^3$, with spatial support contained in a fixed compact set independent of time, such that for every $J \, l gt.eq 0$ and spatial multi-index $alpha$, 
#[#set math.equation(numbering: n => "(22)")
 $ sup_(t gt.eq 0 \, thin X in bb(R)^3) \( 1 + t + \| X \| \)^J \| partial_t^l partial_X^alpha f \( t \, X \) \| < oo . $ <eq:alternating-schwartz>]

 The solution with zero initial velocity is explicit, global, and unique in the class (2), with pressure zero. Its velocity satisfies the same support and derivative estimates. The material particle initially at $\( - 1 \, 0 \, 0 \)$ reaches $X_1 > 0$ if and only if the machine halts.]
] <thm:alternating>

The proof has three tasks: recover one complete configuration from a stationary donor coordinate, use it to prescribe the next displacement, and bound the derivatives of that displacement.

=== 4.1 A finite block and an alternating history <a-finite-block-and-an-alternating-history>

Let $Q$ be the machine’s state set, $H_Q subset.eq Q$ its halting states, and $Gamma$ its tape alphabet. Normalize missing transitions by adding a halting state, without moving or changing the scanned symbol. Extend the resulting table after a halting state by $delta \( q \, a \) = \( q \, a \, 0 \)$. This extension merely freezes a halted configuration. Let $N$ be the input length, choose $b = 2 \( 1 + max \( \| Q \| \, \| Gamma \| \) \)$, and assign distinct even digits $g_a \, g_q in { 0 \, 2 \, dots.h \, b - 2 }$ within the symbol and state families, with blank digit zero. Write $m = \( b - 2 \) \/ \( b - 1 \) < 1$ and $J_s = \[ g_s \/ b \, \( g_s + 1 \) \/ b \]$ for each member of either family. Intervals are disjoint within each family. Using rational rescalings of the effective cutoffs in Section 2, choose smooth functions $phi.alt_s = 1$ on a neighborhood of $J_s$, with pairwise disjoint supports within that family and effective bounds for every derivative.

We work in coordinates $\( x \, y \, z \) = \( X_2 \, X_3 \, X_1 \)$, a right-handed cyclic permutation. After $n$ machine transitions let $xi_n \, eta_n$ be the fractional base-$b$ codes of the tape strictly left of the head and from the head rightward, each nearest symbol first. They need at most $K_n = N + 2 n + 2$ digits, padded by zeros. Indeed the head moves at most $n$ cells, while a nonblank cell was either in the initial input or was visited in those $n$ moves. Put

#[#set math.equation(numbering: n => "(23)")
 $ C_n = frac(g_(q_n) + xi_n + b^(- K_n) eta_n, b) \, #h(2em) s_n = \( N + 1 \) 2^(\( n + 3 \)^2) \, #h(2em) epsilon.alt_n = b^(- s_n) . $ <eq:alternating-block>]

The block has one state digit, $K_n$ left-stack places, and $K_n$ right-stack places, with zero padding. Every digit is allowed, so all fractional tails lie in $\[ 0 \, m \]$, and $b^(1 + 2 K_n) C_n$ is an integer. We have

$ s_n > 1 + 2 K_n \, #h(2em) s_(n + 1) / s_n = 2^(2 n + 7) \, #h(2em) s_(n + 1) > s_n + 1 + 2 K_n . $

For example $2^(\( n + 3 \)^2) gt.eq 8 \( n + 1 \)$ gives the first inequality directly. The intended memories at time $1 + n$ are

#[#set math.equation(numbering: n => "(24)")
 $ x_n = sum_(0 lt.eq j lt.eq n\
j upright(" even")) epsilon.alt_j C_j \, #h(2em) y_n = sum_(0 lt.eq j lt.eq n\
j upright(" odd")) epsilon.alt_j C_j . $ <eq:alternating-history>]

These are specifications of the trajectory to be proved, not parameters obtained by executing the machine while constructing the field. Figure 1 illustrates the stationary-donor invariant.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$x_n$ contains $C_n$#linebreak()$y_n$ contains earlier records]]])])
  content((5.2, 0), [#box(width: 3.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$x_n$ unchanged#linebreak()$y_n+ epsilon_(n+1)C_(n+1)$]]])])
  content((5.2, -2), [#box(width: 3.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$x_n+ epsilon_(n+2)C_(n+2)$#linebreak()$y_(n+1)$ unchanged]]])])
  line((1.6, 0), (3.6, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.6, 0.8), [#text(size: 9pt)[read $x$; write $y$]], anchor: "south", padding: 0.1176cm)
  line((5.2, -0.55), (5.2, -1.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.2, -1), [#text(size: 9pt)[read $y$; write $x$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Two successive slots, starting with even $n$. Every old record remains present. The donor does not move during its slot, so its decoded instruction stays constant while the new record is written. The signal coordinate $z$ is omitted from the diagram. ],
) <fig:alternating>

=== 4.2 A smooth decoder on every real donor value <a-smooth-decoder-on-every-real-donor-value>

The positional tape representation is a generalized-shift encoding [8]. We now give the decoder on arbitrary real arguments, so the field is defined independently of the distinguished execution. Choose rational $m < a_P < b_P < 1$ and define on $\[ 0 \, 1 \]$

$ P \( v \) = v - H #scale(x: 120%, y: 120%)[\(] \( v - a_P \) \/ \( b_P - a_P \) #scale(x: 120%, y: 120%)[\)] . $

Near zero this is $v$, and near one it is $v - 1$; it therefore extends to a smooth bounded $1$-periodic function, with all derivatives bounded. It equals the fractional part whenever that fractional part belongs to $\[ 0 \, m \]$. For slot $n$, let the donor $D$ be $x$ when $n$ is even and $y$ when $n$ is odd, and set

#[#set math.equation(numbering: n => "(25)")
 $ C = P \( b^(s_n) D \) \, #h(2em) B = P \( b^(s_n + 1 + K_n) D \) \, #h(2em) A = P \( b^(s_n + 1) D \) - b^(- K_n) B . $ <eq:alternating-read>]

At the intended donor these give $C_n \, eta_n \, xi_n$ respectively. To verify this, every earlier donor block with index $j < n$ contributes an integer after multiplication by $b^(s_n)$: its denominator is $b^(s_j + 1 + 2 K_j)$, and $s_n gt.eq s_(j + 1) > s_j + 1 + 2 K_j$. The remaining block is $C_n$. Multiplication once more by $b$ removes the state digit. Multiplication by $b^(K_n)$ removes the first $K_n$ tape digits since $b^(K_n) xi_n$ is an integer, leaving the tail $eta_n$. All fractional parts used here lie in $\[ 0 \, m \]$, where $P$ is exact. Subtraction then gives $A = xi_n$. This is the precise role of old-scale divisibility in the alternating encoding.

Make a finite list of the normalized table branches, including its freezing halting transitions, and split each left move by its left-top symbol $ell$. For a branch $i : \( q \, a \) mapsto \( p_i \, b_i \, d_i \)$ put

$ Psi_i \( D \) = phi.alt_q \( C \) phi.alt_a \( B \) cases(delim: "{", 1 \, & d_i = 0 \, 1 \,, phi.alt_ell \( A \) \, & d_i = - 1 .) $

Let $R = b B - g_a$ and define its tape update by

#[#set math.equation(numbering: n => "(26)")
 $ \( T_i^1 \, T_i^2 \) = cases(delim: "{", \( \( g_(b_i) + A \) \/ b \, R \) \, & d_i = 1 \,, \( A \, \( g_(b_i) + R \) \/ b \) \, & d_i = 0 \,, \( b A - g_ell \, \( g_ell + \( g_(b_i) + R \) \/ b \) \/ b \) \, & d_i = - 1 .) $ <eq:alternating-update>]

At an intended donor precisely the correct branch has weight one, and all others vanish. The displayed digit push and pop formulas give $xi_(n + 1) \, eta_(n + 1)$, which fit in $K_(n + 1)$ places. Define, on all real donor arguments,

#[#set math.equation(numbering: n => "(27)")
 $ L_n \( D \) & = epsilon.alt_(n + 1) / b sum_i Psi_i \( D \) #scale(x: 120%, y: 120%)[\(] g_(p_i) + T_i^1 + b^(- K_(n + 1)) T_i^2 #scale(x: 120%, y: 120%)[\)] \,\
E_n \( D \) & = epsilon.alt_n - epsilon.alt_(n + 1) + 2 epsilon.alt_(n + 1) sum_(q in H_Q) phi.alt_q \( C \) . $ <eq:alternating-write>]

Thus $L_n \( D \) = epsilon.alt_(n + 1) C_(n + 1)$ on the intended donor. The field retains all old records, so the branches need no disjoint images and no reversible-table preprocessing.

=== 4.3 Keeping the donor stationary during the write <keeping-the-donor-stationary-during-the-write>

Choose one fixed compact cutoff $chi$ equal to one on a neighborhood of $\[ 0 \, 1 \]^2 times \[ - 1 \, 1 \]$ in $\( x \, y \, z \)$ coordinates, again using rational rescalings of the effective cutoffs so that every derivative has an effective bound. In slot $\[ 1 + n \, 2 + n \]$ prescribe $U = theta' \( t - 1 - n \) V_n$, where

#[#set math.equation(numbering: n => "(28)")
 $ V_n = cases(delim: "{", "curl" \( chi \( z L_n \( x \) - y E_n \( x \) \) \, 0 \, 0 \) \, & n upright(" even") \,, "curl" \( 0 \, chi \( x E_n \( y \) - z L_n \( y \) \) \, 0 \) \, & n upright(" odd") .) $ <eq:alternating-curls>]

On the plateau these velocities are respectively $\( 0 \, L_n \, E_n \)$ and $\( L_n \, 0 \, E_n \)$. In particular the donor is stationary throughout its slot. During initialization, for $0 lt.eq t lt.eq 1$, set

$ d = \( epsilon.alt_0 C_0 \, 0 \, 1 - epsilon.alt_0 \) \, #h(2em) U \( t \, x \, y \, z \) = theta' \( t \) "curl" [1 / 2 chi \( x \, y \, z \) #scale(x: 120%, y: 120%)[\(] d times \( x \, y \, z \) #scale(x: 120%, y: 120%)[\)]] . $

On the plateau this equals $theta' \( t \) d$, so the particle follows $\( 0 \, 0 \, - 1 \) + theta \( t \) d$. This whole segment lies in the plateau. Only the initial code $C_0$ is supplied to the field.

We verify the trajectory before using it for observation. Initialization ends at $\( epsilon.alt_0 C_0 \, 0 \, - epsilon.alt_0 \)$. If the memories at the start of slot $n$ are (24), the stationary donor gives the values in (25). With progress $theta \( t - 1 - n \)$, the other memory acquires $L_n \( D \)$ and the signal acquires $E_n \( D \)$. This proves the next memory identity. All proposed paths remain on the plateau: the two memories are between zero and $sum_j epsilon.alt_j$, and

$ sum_(j gt.eq 0) epsilon.alt_j lt.eq 2 epsilon.alt_0 < 1 \/ 4 . $

Here $s_(j + 1) - s_j gt.eq 1$ and $b gt.eq 4$ already give a geometric majorant; the stated constant two is more than sufficient. The signal starts at $- epsilon.alt_0$, and each increment lies between zero and $epsilon.alt_n + epsilon.alt_(n + 1)$. Its total displacement is less than $2 sum_j epsilon.alt_j < 1 \/ 2$. Hence $\| z \| < 1$ on all slots, even after halting. The proposed curves genuinely solve the cutoff field, and ODE uniqueness identifies them with the material trajectory.

Before the first slot whose current state is halting, the signal is $- epsilon.alt_n$ at the slot’s start and interpolates monotonically to $- epsilon.alt_(n + 1)$, remaining strictly negative. In the first halting slot it instead ends at $+ epsilon.alt_(n + 1)$. This also covers an initially halting machine, which is detected in the first post-loading slot. Loading stays negative. Thus $z = X_1 > 0$ occurs exactly when the machine halts, with no intermediate false positive.

=== 4.4 Derivative bounds and effective evaluation <derivative-bounds-and-effective-evaluation>

The particle correspondence has been proved for every real time. It remains to prove that the field defining it has the claimed rapid bounds. The functions $C \, A \, B$ in (25) are uniformly bounded. Applying the chain and product rules through spatial order $r$ gives

$ ∥L_n \/ epsilon.alt_(n + 1)∥_(C^r) + ∥sum_(q in H_Q) phi.alt_q \( C \)∥_(C^r) lt.eq C_r b^(r \( s_n + 1 + K_n \)) . $

Constants depend on the fixed table, base, and smooth functions, but not on $n$. The factors $b^(- K_n)$ and $b^(- K_(n + 1))$ are at most one; there are only finitely many branches. Accounting for one derivative in the curl and for the fixed cutoff yields

#[#set math.equation(numbering: n => "(29)")
 $ parallel V_n parallel_(C^r) lt.eq C'_r (b^(- s_n) + b^(- s_(n + 1) + \( r + 1 \) \( s_n + 1 + K_n \))) . $ <eq:alternating-estimate>]

For each fixed $r$, the second term is at most $b^(- s_n)$ for all sufficiently large $n$, because $s_(n + 1) \/ s_n = 2^(2 n + 7)$ and $K_n + 1 < s_n$. Temporal derivatives only differentiate the fixed clock pulse, and the zero collars give smooth gluing. The right side therefore tends to zero faster than every inverse power of $1 + n$ for each fixed mixed order. Early slots and loading have finite individual bounds. These facts prove all the rapid mixed bounds for $U$.

For $f = cal(R)_nu \[ U \]$, the linear terms require one additional time derivative or two additional spatial derivatives. Each derivative of the quadratic term is a finite sum of products of mixed derivatives of $U$, one with an additional spatial derivative. The already proved estimates bound every such factor; one factor may carry any requested temporal weight and the other is bounded. Consequently $f$ has every rapid mixed bound. Fixed compact support turns a temporal weight into the full weight $\( 1 + t + \| X \| \)^J$ in (22). The fixed support gives all Sobolev conditions in (2). Lemma 1 supplies uniqueness and the global material flow.

For a finite slot index all scales, the fixed branch list, and all coefficients are effective. A coarse enclosing time interval selects finitely many candidate slots; zero collars make evaluation consistent where such choices overlap. The periodic function $P$ can be evaluated by finitely many neighboring integer translates, or by its affine formula across an integer, without a discontinuous fractional-part test. Flat cutoff bounds and finite differentiation give arbitrary rational-error evaluation of the field, the force, and every derivative. Bounds for any fixed finite set of orders are obtained from a finite initial range plus the explicit tail inequality in (29). Only $C_0$ is computed from the input orbit; subsequent slot functions perform one local table update on their spatial donor arguments. Physical slots have unit length and no finite accumulation time. This proves Theorem 5.

== 5 Periodic lattice memory on the torus <sec:lattice>

We now store successive configurations in a single torus coordinate. The earlier records remain in that coordinate, but a residue calculation removes them when the next transition is read. A second coordinate records whether the current state is halting. Both the new record and the halting signal become much smaller at each step. This separation of scales will make every derivative of the velocity and force decay faster than every inverse power of time. The positional stack operations belong to the generalized-shift approach [8]; the residue arithmetic and smooth realization are proved below.

The planar motion used for this purpose need not preserve area. We first construct and verify that motion. A third component will then cancel its divergence while leaving the coding plane invariant.

#thm([Theorem 5.1.])[
  (Periodic lattice memory).  #emph[Fix a computable viscosity $nu > 0$. A finite deterministic machine and a finite input effectively determine a smooth force $g$ on the unit flat torus $bb(T)^3 = \( bb(R) \/ bb(Z) \)^3$ with zero spatial mean. The Navier–Stokes equations with force $g$ and zero initial velocity have a smooth solution $\( U \, 0 \)$ with zero spatial mean. Its particle from 
$ a_(*) = \( 1 \/ 4 \, 1 \/ 2 \, 1 \/ 2 \) $

 enters the fixed open set 
$ O = { x in bb(T)^3 : 1 \/ 2 < x_1 < 1 med \( mod med 1 \) } $

 at some finite time if and only if the machine halts on that input. For every pair of nonnegative integers $r \, J$ and every spatial multi-index $alpha$, there is an effective constant $C_(r \, alpha \, J)$ such that 
#[#set math.equation(numbering: n => "(30)")
 $ parallel partial_t^r partial_x^alpha U \( t \) parallel_oo + parallel partial_t^r partial_x^alpha g \( t \) parallel_oo lt.eq C_(r \, alpha \, J) \( 1 + t \)^(- J) \, #h(2em) t gt.eq 0 . $ <eq:lattice-rapid>]

 There is also an effective smooth mean-zero solenoidal force $f$ with the same bounds and exactly the same velocity and material event. It is $f = g - nabla phi.alt$, with pressure $- phi.alt$, where $phi.alt$ is the mean-zero periodic solution of $Delta phi.alt = "div" g$.]
  #emph[For either force, uniqueness holds among periodic classical solutions for which the velocity, its time derivative and its spatial derivatives through order two, and the pressure and its spatial gradient, are continuous on every $\[ 0 \, T \] times bb(T)^3$. Pressure is normalized to have zero spatial mean.]
] <thm:lattice>

=== 5.1 Reading a configuration from an integer residue <reading-a-configuration-from-an-integer-residue>

Normalize a missing instruction by entering a fresh halting state without moving or changing the scanned symbol. To retain absolute tape position as well as the contents relative to the head, add a read-only bit track with a unique marked bit at the initial origin. Transitions preserve the bit and ignore it when choosing an instruction. The resulting alphabet is denoted by $Gamma$, its all-blank symbol by $square.stroked.tiny$, its state set by $Q$, and its finite initial word by $omega$. The word contains the marked origin even when the original input is empty. This modification preserves halting.

Choose $b = max \( 2 \, \| Gamma \| \, \| Q \| \)$. Give the symbols distinct digits in ${ 0 \, dots.h \, b - 1 }$, assigning zero to $square.stroked.tiny$, and number the states from zero. After $n$ transitions, put

$ d_n = \| omega \| + 1 + 2 n \, #h(2em) p_n = 2 d_n + 1 \, #h(2em) P_n = b^(p_n) . $

The nearest $d_n$ cells to the left of the head form a stack with integer code $L$; the nearest $d_n$ cells starting at the head form a stack with code $R$. In each stack the nearest cell is the least significant base-$b$ digit. All cells outside these two stacks are blank: a head travels at most one cell per transition, whereas the available width grows by two. If the state number is $s$, the complete configuration therefore has the code

#[#set math.equation(numbering: n => "(31)")
 $ c_n = L + b^(d_n) R + b^(2 d_n) s \, #h(2em) 0 lt.eq c_n < P_n . $ <eq:lattice-code>]

The slot number $n$ specifies the stack width. The origin bit determines the head’s absolute position, so the code loses no tape information.

We must prescribe the field at every spatial address, rather than only at addresses visited by this computation. For an arbitrary integer $j$, let $\[ j \]_q$ denote its least nonnegative residue modulo the positive integer $q$. Extract

$ c & = \[ j \]_(P_n) \,\
L & = \[ c \]_(b^(d_n)) \, #h(2em) R = #scale(x: 120%, y: 120%)[\[] floor.l c \/ b^(d_n) floor.r #scale(x: 120%, y: 120%)[\]]_(b^(d_n)) \,\
s & = floor.l c \/ b^(2 d_n) floor.r \, #h(2em) l = \[ L \]_b \, quad a = \[ R \]_b . $

Define $h_n \( j \) = 1$ if $s$ is a halting-state index, and $h_n \( j \) = 0$ otherwise. If $s$ is a valid nonhalting state and $a$ a valid symbol, look up the single instruction $\( s \, a \) mapsto \( s' \, a' \, m \)$, where $m in { - 1 \, 0 \, 1 }$. Set

#[#set math.equation(numbering: n => "(32)")
 $ \( L' \, R' \) & = cases(delim: "{", \( a' + b L \, \( R - a \) \/ b \) \, & m = 1 \,, \( \( L - l \) \/ b \, l + b a' + b \( R - a \) \) \, & m = - 1 \,, \( L \, R - a + a' \) \, & m = 0 \,)\
F_n \( j \) & = L' + b^(d_(n + 1)) R' + b^(2 d_(n + 1)) s' . $ <eq:lattice-transition>]

In every other case define $F_n \( j \) = 0$. Digits away from the scanned cell need not be checked for membership in the alphabet.

#thm([Lemma 5.2.])[
  #emph[The functions $F_n \, h_n$ on $bb(Z)$ are $P_n$-periodic, $h_n in { 0 \, 1 }$, and $0 lt.eq F_n < P_(n + 1)$ at every address. If $c_n$ is a true nonhalting configuration and $j equiv c_n med \( mod med P_n \)$, then $F_n \( j \) = c_(n + 1)$.]
] <lem:lattice-address>

#proof[
  All extracted data depend only on $\[ j \]_(P_n)$. In each nonzero branch, $0 lt.eq L' \, R' < b^(d_n + 1)$. For the left move, the only less immediate bound follows from
  $ R - a lt.eq b^(d_n) - b \, #h(2em) l \, a' lt.eq b - 1 \, $
  which give $l + b a' + b \( R - a \) lt.eq b^(d_n + 1) - 1$. The right and stationary branches satisfy the same bounds directly. Since $d_(n + 1) = d_n + 2$ and $0 lt.eq s' < b$, the output fits in the three fields of the next code. The formulas are precisely the stack operations for a tape transition. In particular, after a left move the new right stack consists of the old left top, the symbol just written, and the old right tail. This is $l + b a' + b \( R - a \)$; the last term has two digit shifts because $R - a$ already contains one factor of $b$. The two new blank places suffice for every branch. ◻
]

=== 5.2 Scales that retain old records without reading them <scales-that-retain-old-records-without-reading-them>

Suppose a real coordinate stores a partial history as $y_(*) + sum_(k = 0)^n epsilon.alt_k c_k$, with $y_(*) = 1 \/ 2$. To recover $c_n$, we want every earlier summand, after division by $epsilon.alt_n$, to be an integer multiple of $P_n$. We also want the next displacement to be much smaller than $epsilon.alt_n$, so a smooth selector will read the same integer throughout that displacement. The following explicit scales meet both requirements:

#[#set math.equation(numbering: n => "(33)")
 $ K_n = \( p_0 + 10 \) 2^(n \( n + 1 \)) \, #h(2em) epsilon.alt_n = b^(- K_n) \, #h(2em) beta_0 = 1 \/ 4 \, quad beta_n = epsilon.alt_n quad \( n gt.eq 1 \) . $ <eq:lattice-scales>]

The numbers $beta_n$ give the distance of a nonhalting signal from the boundary $x_1 = 1 \/ 2$. The separate choice $beta_0 = 1 \/ 4$ fixes the initial first coordinate at $1 \/ 4$, independently of the input; later distances use the shrinking memory scales. Its contribution to the first transition is a single finite-time term in the decay estimates.

#thm([Lemma 5.3.])[
  #emph[For $n gt.eq 0$, 
#[#set math.equation(numbering: n => "(34)")
 $ P_n & divides epsilon.alt_n^(- 1) \, & P_n & divides epsilon.alt_k \/ epsilon.alt_n quad \( 0 lt.eq k < n \) \,\
P_(n + 1) epsilon.alt_(n + 1) & lt.eq epsilon.alt_n^(thin 2^(2 n + 2) - 1) lt.eq epsilon.alt_n^3 < epsilon.alt_n \/ 4 . $ <eq:lattice-divisibility>]

 Moreover, $beta_n$ decreases strictly and $epsilon.alt_n lt.eq 2^(- n)$.]
] <lem:lattice-scales>

#proof[
  Here $p_n = p_0 + 4 n$ and $K_(n + 1) = 2^(2 n + 2) K_n$. Induction gives $K_n gt.eq p_(n + 1)$, starting with $K_0 = p_0 + 10 gt.eq p_0 + 4$. Thus $K_n gt.eq p_n$ and, for $k < n$,
  $ K_n - K_k gt.eq K_n - K_(n - 1) gt.eq 3 K_(n - 1) gt.eq p_n . $
  These inequalities prove the two divisibilities, since all quantities are powers of the same integer $b$. Also
  $ b^(p_(n + 1) - K_(n + 1)) lt.eq b^(K_n - 2^(2 n + 2) K_n) = epsilon.alt_n^(thin 2^(2 n + 2) - 1) . $
  The remaining assertions follow from $b gt.eq 2$, $K_0 gt.eq 13$ and the strict growth of $K_n$. ◻
]

We have now specified the finite rule table and the scale arithmetic. The next step makes the residue calculation into a smooth field whose actual particle follows the whole stored history.

=== 5.3 Smooth selectors and the complete particle path <smooth-selectors-and-the-complete-particle-path>

Fix an effective smooth nondecreasing function $sigma$ with $sigma \( t \) = 0$ for $t lt.eq 1 \/ 3$ and $sigma \( t \) = 1$ for $t gt.eq 2 \/ 3$. Take $sigma \( t \) = H \( 3 t - 1 \)$ with the function $H$ fixed in Section 2. Choose an effective smooth bump $psi$ that is one on $\[ - 1 \/ 4 \, 1 \/ 4 \]$ and zero outside $\[ - 3 \/ 8 \, 3 \/ 8 \]$. Products of translates and rescalings of $H$ supply such a bump. These functions and their derivatives have effective bounds; flatness at the endpoints follows from the exponential factor in $rho$.

For $j in bb(Z)$, define a bump centered at the $j$th point of the scale-$n$ lattice by

$ J_(n \, j) \( y \) = psi #scale(x: 120%, y: 120%)[\(] \( y - y_(*) \) \/ epsilon.alt_n - j #scale(x: 120%, y: 120%)[\)] . $

Their supports are pairwise disjoint. In planar coordinates $xi = \( xi_1 \, xi_2 \)$, prescribe the loading field and the $n$th transition field by

#[#set math.equation(numbering: n => "(35)")
 $ v_(upright("in")) \( t \, xi \) & = sigma' \( t \) \( 0 \, epsilon.alt_0 c_0 \) \,\
v_n \( t \, xi \) & = sigma' \( t - 1 - n \) vec(beta_n - beta_(n + 1) + 2 beta_(n + 1) sum_(j in bb(Z)) h_n \( j \) J_(n \, j) \( xi_2 \), epsilon.alt_(n + 1) sum_(j in bb(Z)) F_n \( j \) J_(n \, j) \( xi_2 \)) \,\
v & = v_(upright("in")) + sum_(n gt.eq 0) v_n . $ <eq:lattice-loader>]

The field is independent of $xi_1$. Translation of $xi_2$ by one shifts the lattice index by $epsilon.alt_n^(- 1)$, a multiple of $P_n$ by Lemma 8. The coefficients therefore repeat, and $v$ is a field on $bb(T)^2$. Only the loader acts during $\[ 0 \, 1 \]$, and only $v_n$ acts during $\[ 1 + n \, 2 + n \]$. The fixed zero collars of the pulses make their sum smooth, including at every slot boundary and at time zero.

Let $Y \( t \)$ be the real-coordinate lift of its particle starting at $\( 1 \/ 4 \, y_(*) \)$. The loader leaves the first coordinate unchanged and ends at

$ Y \( 1 \) = \( 1 \/ 4 \, y_(*) + epsilon.alt_0 c_0 \) . $

We claim that, at $t_n = 1 + n$ and up to the first halting configuration,

#[#set math.equation(numbering: n => "(36)")
 $ Y_1 \( t_n \) = 1 \/ 2 - beta_n \, #h(2em) Y_2 \( t_n \) = y_(*) + sum_(k = 0)^n epsilon.alt_k c_k . $ <eq:lattice-history>]

The claim holds for $n = 0$. Assuming it at $n$, put

$ j_(*) = \( Y_2 \( t_n \) - y_(*) \) \/ epsilon.alt_n . $

This is an integer, and (34) gives $j_(*) equiv c_n med \( mod med P_n \)$. Changing the lift of $Y_2$ by an integer changes $j_(*)$ by a multiple of $P_n$, so the decoded instruction is intrinsic to the torus.

Throughout this slot the actual trajectory is

#[#set math.equation(numbering: n => "(37)")
 $ Y_2 \( t_n + tau \) & = Y_2 \( t_n \) + sigma \( tau \) epsilon.alt_(n + 1) F_n \( j_(*) \) \,\
Y_1 \( t_n + tau \) & = Y_1 \( t_n \) + sigma \( tau \) #scale(x: 120%, y: 120%)[\(] beta_n - beta_(n + 1) + 2 beta_(n + 1) h_n \( j_(*) \) #scale(x: 120%, y: 120%)[\)] \, quad 0 lt.eq tau lt.eq 1 . $ <eq:lattice-path-y>]

Indeed, Lemma 7 and (34) bound the second-coordinate displacement by $epsilon.alt_n \/ 4$. The proposed curve stays on the plateau $J_(n \, j_(*)) = 1$, where every other bump vanishes. Differentiating (37)–(37) therefore gives exactly (35). Spatial smoothness and ODE uniqueness identify it with the actual particle.

At a nonhalting configuration, Lemma 7 gives $F_n \( j_(*) \) = c_(n + 1)$ and $h_n \( j_(*) \) = 0$. The endpoint is thus the next history in (36). Throughout that slot the first coordinate lies between $1 \/ 2 - beta_n$ and $1 \/ 2 - beta_(n + 1)$, both strictly below $1 \/ 2$. At a halting configuration $h_n \( j_(*) \) = 1$, and the first-coordinate endpoint is instead

$ Y_1 \( t_n + 1 \) = 1 \/ 2 + beta_(n + 1) in \( 1 \/ 2 \, 1 \) . $

This also handles an initially halted input, whose signal appears in the first slot after loading. There is no first-coordinate wrap before the first detection. Consequently the open event has the required equivalence at all real times, not just at integer endpoints.

=== 5.4 Rapid bounds and the incompressible lift <rapid-bounds-and-the-incompressible-lift>

The stored history grows, but neither its length nor the number of lattice cells enters a derivative bound. At each spatial point at most one bump in (35) is nonzero. For $\| alpha \| = k$, all time orders $r$, and $n gt.eq 0$, the coefficient bounds give

#[#set math.equation(numbering: n => "(38)")
 $ parallel partial_t^r partial_xi^alpha v_n parallel_oo lt.eq C_(r \, k) (upright(bold(1))_(k = 0) beta_n + P_(n + 1) epsilon.alt_(n + 1) epsilon.alt_n^(- k)) . $ <eq:lattice-slot-bound>]

The constant drift disappears after a spatial derivative; each derivative of a bump costs one factor of $epsilon.alt_n^(- 1)$. For $n gt.eq max \( 1 \, k \)$, (34) bounds the right-hand side by $C'_(r \, k) epsilon.alt_n$. Since $epsilon.alt_n lt.eq 2^(- n)$ and $1 + t lt.eq n + 3$ on the $n$th slot, every polynomial time weight is bounded. The finitely many earlier slots and the loader contribute finite effective constants. Thus $v$ satisfies all the mixed rapid bounds in (30).

Choose an effective smooth periodic function $eta$ on $bb(T)$ with $eta \( 1 \/ 2 \) = 0$ and $eta' \( 1 \/ 2 \) = 1$. One explicit choice is $\( z - 1 \/ 2 \)$ times a smooth cutoff supported in $\( 1 \/ 2 - 3 \/ 16 \, 1 \/ 2 + 3 \/ 16 \)$ and equal to one near $1 \/ 2$, extended periodically. Define on $bb(T)^3$

#[#set math.equation(numbering: n => "(39)")
 $ U \( t \, xi \, z \) = #scale(x: 120%, y: 120%)[\(] eta' \( z \) v_1 \( t \, xi \) \, eta' \( z \) v_2 \( t \, xi \) \, - eta \( z \) "div"_xi v \( t \, xi \) #scale(x: 120%, y: 120%)[\)] . $ <eq:lattice-lift>]

The two divergence terms cancel. The first two components have zero mean because $integral_(bb(T)) eta' = 0$, and the third has zero mean because $integral_(bb(T)^2) "div"_xi v = 0$. On the plane $z = 1 \/ 2$, the velocity is exactly $\( v \, 0 \)$, so the plane is invariant and the particle from $a_(*)$ is $\( Y \( t \) \, 1 \/ 2 \)$ modulo integers. This proves that the fluid lift preserves the event already verified.

The lift costs at most one planar derivative of $v$. Consequently $U$ obeys all the rapid estimates, is zero initially, and has bounded gradient on each finite time interval. Put

#[#set math.equation(numbering: n => "(40)")
 $ g = partial_t U + \( U dot.op nabla \) U - nu Delta U . $ <eq:lattice-residual>]

This is the residual-realization construction of Lemma 1: a prescribed smooth divergence-free velocity from rest solves the forced equation with this force and pressure zero. Here $g$ has zero mean, since its time-derivative and Laplacian terms integrate to zero and $\( U dot.op nabla \) U = "div" \( U ⊗ U \)$. Product differentiation proves every rapid bound for $g$. More explicitly, a derivative of spatial order $k$ of the residual uses planar derivatives through order $k + 3$ and one additional time derivative, all supplied by (38).

The field $U$ satisfies the periodic classical hypotheses of Lemma 1. That lemma gives the stated uniqueness class, the mean-zero pressure normalization, and the unique global material flow.

=== 5.5 Effective evaluation and solenoidal forcing <effective-evaluation-and-solenoidal-forcing>

The formulas specify all instructions without generating the distinguished execution. Given a computable time, a rational enclosure selects finitely many possible pulse slots. Within a selected slot, enclose a real lift of the second coordinate in a rational interval of length at most $epsilon.alt_n \/ 2$. Include every lattice center whose bump support meets that interval. The number of candidates is uniformly bounded, and every omitted term vanishes. Summing these candidates avoids deciding whether a computable real lies exactly on a cell boundary. Each coefficient requires integer arithmetic and one lookup in the finite transition table. Only the loading code $c_0$ uses the input contents; the later fields use the table and the transformed input length.

The cutoff formulas have effective derivative bounds, and (38) supplies an effective tail estimate. For any fixed $J$, an upper bound on $\( n + 3 \)^J 2^(- n)$ is computable, for example by checking finitely many terms until its successive ratio is bounded by a fixed number below one. Values of the fields, residual, and every requested derivative can therefore be evaluated to arbitrary rational error. If $nu$ is an arbitrary fixed positive real instead, the same algebraic formulas hold, with numerical evaluation relative to that parameter.

Finally apply Lemma 2 to $g$. We have proved its zero spatial mean and effective estimates at every mixed order and every temporal weight. Thus the mean-zero solution of $Delta phi.alt = "div" g$ gives the effective solenoidal force

$ f = g - nabla phi.alt \, #h(2em) p = - phi.alt . $

Equation (4) specifies its coefficients, and the weighted conclusion of the lemma gives (30). The pressure sign preserves $- nabla p + f = g$, hence precisely the same velocity and particle event. A competitor for $f$ with pressure $q$ becomes a competitor for $g$ with pressure $q + phi.alt$, in the same normalized classical class. This also proves the projected uniqueness and completes Theorem 6.

== 6 What the detector decides <sec:consequences>

The constructions give four fixed experiments: the addressed Euclidean field, its torus image, the alternating Euclidean field, and the periodic lattice field. In each case the domain, particle label, detector and viscosity are fixed before the machine and word are supplied. The shrinking scales depend effectively on finite input data, and every transition occupies an entire unit time slot.

#thm([Corollary 6.1.])[
  #emph[For each of these four experiments, no algorithm decides the particle event for every force program produced by its construction. This remains true for the solenoidal mean-zero versions of the two torus experiments.]
] <cor:undecidable>

#proof[
  Composing such an algorithm with the finite compiler would decide halting for arbitrary machines and words. This would decide Turing’s symbol-printing problem [10] Section 8: simulate the given machine, halt when the designated symbol is printed, and continue forever if the machine stops without printing it. Turing proves that no such decision procedure exists. ◻
]

The exact observers also describe the limitation. In the addressed construction the nonhalting first coordinate is exactly $- 1$ after loading, on the boundary of its open detector; a halt in slot $n$ moves it by $- b_n$. Its torus image has boundary $3 \/ 8$ and signal $b_n \/ 8$. The alternating signal approaches zero from below, while the lattice signal approaches $1 \/ 2$ from below. In both cases the first halting slot crosses that boundary by a positive amount depending on its index. Those amounts tend to zero. Consequently these proofs give no positive lower bound on the separation required for a uniform finite-precision test, and no assertion of robustness under a fixed measurement or field perturbation. This qualification concerns the constructions proved here; it does not contradict robust tape-bounded fluid simulations.

There is no conflict between rapid decay and invertibility of the flow. Earlier records remain in the particle coordinates, even when a residue or a smooth periodic decoder ignores them. There is also no accumulation of infinitely many instructions at a finite physical time. What decreases is the distance needed to write the next record and to signal a halt.

#heading(level: 1)[References]
#bibitem([1])[C.~H. Bennett, Logical reversibility of computation, #emph[IBM J. Res. Develop.] #strong[17] (1973), 525--532. #link("https://doi.org/10.1147/rd.176.0525")[`doi:10.1147/rd.176.0525`].]
#bibitem([2])[R. Cardona, E. Miranda and D. Peralta-Salas, Computability and Beltrami fields in Euclidean space, #emph[J. Math. Pures Appl.] #strong[169] (2023), 50--81. #link("https://doi.org/10.1016/j.matpur.2022.11.007")[`doi:10.1016/j.matpur.2022.11.007`]. Theorem locators refer to #link("https://arxiv.org/abs/2111.03559v3")[arXiv:2111.03559v3].]
#bibitem([3])[R. Cardona, E. Miranda, D. Peralta-Salas and F. Presas, Constructing Turing complete Euler flows in dimension 3, #emph[Proc. Natl. Acad. Sci. USA] #strong[118] (2021), e2026818118. #link("https://doi.org/10.1073/pnas.2026818118")[`doi:10.1073/pnas.2026818118`].]
#bibitem([4])[S. Dyhr, Á. González-Prieto, E. Miranda and D. Peralta-Salas, Turing complete Navier--Stokes steady states via cosymplectic geometry, #emph[PNAS Nexus] #strong[5] (2026), no.~5, pgag131. #link("https://doi.org/10.1093/pnasnexus/pgag131")[`doi:10.1093/pnasnexus/pgag131`].]
#bibitem([5])[R. Landauer, Irreversibility and heat generation in the computing process, #emph[IBM J. Res. Develop.] #strong[5] (1961), 183--191. #link("https://doi.org/10.1147/rd.53.0183")[`doi:10.1147/rd.53.0183`].]
#bibitem([6])[J. Leray, Sur le mouvement d'un liquide visqueux emplissant l'espace, #emph[Acta Math.] #strong[63] (1934), 193--248. #link("https://doi.org/10.1007/BF02547354")[`doi:10.1007/BF02547354`].]
#bibitem([7])[C. Moore, Unpredictability and undecidability in dynamical systems, #emph[Phys. Rev. Lett.] #strong[64] (1990), 2354--2357. #link("https://doi.org/10.1103/PhysRevLett.64.2354")[`doi:10.1103/PhysRevLett.64.2354`].]
#bibitem([8])[C. Moore, Generalized shifts: unpredictability and undecidability in dynamical systems, #emph[Nonlinearity] #strong[4] (1991), 199--230. #link("https://doi.org/10.1088/0951-7715/4/2/002")[`doi:10.1088/0951-7715/4/2/002`].]
#bibitem([9])[OpenAI, A Fixed Particle Test for Computation in a Forced Viscous Flow, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-Fixed-Particle-Test-for-Computation-in-a-Forced-Viscous-Flow-September-27-2026/manuscript.pdf")[OAI:A-Fixed-Particle-Test-for-Computation-in-a-Forced-Viscous-Flow-September-27-2026], 2026.]
#bibitem([10])[A.~M. Turing, On computable numbers, with an application to the Entscheidungsproblem, #emph[Proc. London Math. Soc.] (2) #strong[42] (1936--1937), 230--265. #link("https://doi.org/10.1112/plms/s2-42.1.230")[`doi:10.1112/plms/s2-42.1.230`].]


