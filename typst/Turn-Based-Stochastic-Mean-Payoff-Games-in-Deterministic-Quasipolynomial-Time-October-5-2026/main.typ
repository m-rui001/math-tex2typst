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

#align(center)[#text(size: 16pt, weight: "bold")[Turn-Based Stochastic Mean-Payoff Games \
in Deterministic Quasipolynomial Time]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Mean-payoff games ask how two players can control the long-run average reward of an infinite play. In the stochastic version, some transitions are chosen by chance. This combines strategic choice with the possibility of moving between regions having different long-run rewards. The input may describe very small transition probabilities and very large rewards with only a few binary digits, so an algorithm whose cost depends on their magnitudes need not be efficient in the input length.

=== 1.1 The problem and the result <the-problem-and-the-result>

An instance consists of a finite directed multigraph $G = \( V \, E \)$ with $V = { 1 \, dots.h \, n }$, $n gt.eq 1$, and at least one outgoing edge at every vertex. The vertex set is partitioned as

$ V = V_max union.sq V_min union.sq V_(upright("ch")) . $

Each edge $e$ has an integer reward $w \( e \)$. At a vertex of $V_max$, Max chooses the next edge; at a vertex of $V_min$, Min chooses it; at a vertex $i in V_(upright("ch"))$, the next edge is drawn from a prescribed rational probability distribution $p_i$ on the outgoing edges. Rewards and the numerators and positive denominators of the probabilities are encoded in binary. The graph and all edge data are listed explicitly. Loops, parallel edges, zero probabilities, and unreduced fractions are permitted.

Both players observe the complete finite history, including traversed edges, and may use arbitrary behavioral strategies with private randomness. Chance draws have the prescribed conditional law at the current vertex. A pure positional strategy chooses one outgoing edge at each vertex of its player, independently of the preceding history. For a play $pi = \( X_0 \, e_0 \, X_1 \, e_1 \, dots.h \)$ define

$ "MP"_w \( pi \) = liminf_(T arrow.r oo) 1 / T sum_(t = 0)^(T - 1) w \( e_t \) \, #h(2em) "val" \( i \) = sup_sigma inf_tau bb(E)_(i \, sigma \, tau) \[ "MP"_w \] . $

Here $sigma$ and $tau$ range over Max’s and Min’s behavioral strategies, respectively. The expectation is taken after the pathwise lower limit. If $L$ is the complete binary input length, the decision problem is to output the set

$ U = { i in V : "val" \( i \) gt.eq 0 } . $

#thm([Theorem 1.1.])[
  #emph[There are a uniform deterministic Turing machine and an absolute constant $C$ such that, on every valid input described above, the machine outputs exactly $U$ in at most 
$ 2^(C \( log_2 \( L + 2 \) \)^2) $

 bit operations. The bound includes input reading, exact rational arithmetic, and output. Vertices of value zero are included.]
] <thm:main>

=== 1.2 Historical context <subsec:history>

Shapley introduced stochastic games with positive stopping probabilities and characterized their values by a contraction operator #cite(label("Shapley1953")). Gillette considered the undiscounted, long-run average objective #cite(label("Gillette1957")); Liggett and Lippman supplied the classical stationary-strategy theorem for perfect-information time-average games #cite(label("LiggettLippman1969")). The relation between discounting and long-run optimization is also classical. Blackwell showed in finite dynamic programming that one stationary policy is optimal for every discount factor sufficiently close to one #cite(label("Blackwell1962")). Rational discounted values provide the corresponding stabilization mechanism for perfect-information stochastic games; see, for example, Gimbert and Zielonka #cite(label("GimbertZielonka2010")) Theorem 3.

The computational problem connects several familiar classes of games. A simple stochastic game is a finite turn-based reachability game in which chance chooses fairly between two successors. Condon placed its threshold problem in $upright("NP") ∩ upright("coNP")$ #cite(label("Condon1992")), and Ludwig gave a randomized subexponential algorithm #cite(label("Ludwig1995")). Zwick and Paterson developed pseudopolynomial algorithms for deterministic mean-payoff games and a reduction to simple stochastic games #cite(label("ZwickPaterson1996")). Andersson and Miltersen later proved polynomial-time Turing equivalences among computing values and optimal strategies in simple stochastic, stochastic mean-payoff, and stochastic discounted-payoff games, with numerical parameters—including the discount factor—given in binary #cite(label("AnderssonMiltersen2009")) Theorem 1. Randomized strategy-improvement algorithms have subexponential expected bounds #cite(label("Zwick2026")). A different line obtains pseudopolynomial bounds when the number of random positions is fixed #cite(label("BorosEtAl2019")) #cite(label("AllamigeonEtAl2025")). Numerical reward and denominator parameters in such bounds distinguish them from a bound in the complete binary input length. Deterministic quasipolynomial algorithms have also been obtained for simple stochastic games of bounded treewidth #cite(label("ChatterjeeEtAl2023")).

Theorem 1 also gives a deterministic quasipolynomial algorithm for deciding whether the reachability value of a simple stochastic game is at least $1 \/ 2$. Make the target absorbing, with reward $+ 1$ on its self-loop, and give every other edge reward $- 1$; any other terminal vertex receives a self-loop of reward $- 1$. For every strategy pair the pathwise mean payoff is $2 upright(bold(1))_({ upright("target is reached") }) - 1$. Its expectation is twice the reachability probability minus one, so taking the strategy extrema proves the reduction. The transformation increases the input length by at most a constant factor.

An explicit small discount is only one part of the present algorithm. Andersson and Miltersen already bounded a sufficient discount using determinant coefficients and polynomial sign stabilization #cite(label("AnderssonMiltersen2009")) Lemma 1; Gaubert, Grand-Clément, and Katz give sharper bounds on Blackwell optimality thresholds #cite(label("GaubertGrandClementKatz2025")). Hansen, Miltersen, and Zwick proved that strategy iteration is strongly polynomial when the discount factor is fixed #cite(label("HansenMiltersenZwick2013")). The dependence of their bound on the inverse distance of that factor from one does not yield a polynomial bound in its binary encoding. Here the discount has polynomial bit length, and a recursive comparison algorithm controls the cost of locating its fixed point.

For games without chance vertices, a deterministic quasipolynomial algorithm in the complete binary input length is given in #cite(label("OpenAI2026Deterministic"), form: "prose") Theorem 1.1. Its simultaneous labeling construction is the direct predecessor of the method used here. We extend that construction to discounted operators, so that chance transitions enter through the same order and translation properties as player choices.

=== 1.3 The proof and its main ideas <the-proof-and-its-main-ideas>

The first part of the proof replaces the mean-payoff problem by one discounted fixed point. For $0 < u < 1$, the discounted map takes the maximum, minimum, or chance average of $u w \( e \) + \( 1 - u \) t_j$ over edges $e : i arrow.r j$. It is a contraction and has a unique fixed point $v \( u \)$. An explicit integer $H$, of polynomial binary length, gives a nonzero-value gap of at least $1 \/ H$ and a discount $lambda$ for which $parallel v \( lambda \) - "val" parallel_oo lt.eq 1 \/ \( 16 H \)$. Section 2 proves these estimates by elementary bounds on the rational functions of a fixed positional pair. Its gain and bias then give pathwise guarantees against every behavioral opponent. This establishes the payoff convention used here directly.

Finding the discounted fixed point by ordinary contraction iteration would take a number of steps depending on $1 \/ lambda$, which can be exponential in the input length. The second part of the proof treats any monotone map $F : bb(R)^n arrow.r bb(R)^n$ satisfying

$ F \( t + c upright(bold(1)) \) = F \( t \) + gamma c upright(bold(1)) \, #h(2em) 0 < gamma < 1 . $

In an integer box, a subsolution is an integer vector $y$ satisfying $F_i \( y \) gt.eq y_i$ at coordinates above the lower face; a supersolution satisfies the reverse inequality at coordinates below the upper face. A subsolution close to an upper face requires a plus label there, while a supersolution close to a lower face requires a minus label. The procedure assigns each coordinate a positive mass for each sign. Its guarantee holds simultaneously for all comparison vectors whose coordinates away from the opposite face have total mass at most one.

Section 3 adapts the two-pass pivot and mass-reweighting method of #cite(label("OpenAI2026Deterministic"), form: "prose") Sections 4–5. The crucial translations have a fixed sign: subsolutions move downward and supersolutions upward. The discounted translation identity preserves their required inequalities, allowing comparison vectors in a large box to be used in smaller recursive boxes. Two pivot passes then arrange a redistribution of the masses that keeps the required comparisons valid. At each recursive call, at most one child leaves both mass vectors unchanged. Every other child increases each product of a coordinate’s two masses by a fixed factor. Starting from uniform masses, only $O \( log \( n + 1 \) \)$ such choices are possible along a path, even when the coordinate range is exponentially large.

The final part explains why these boundary labels suffice to find the fixed point. After scaling, we place an integer subsolution $Y$ and an integer supersolution $Z$ on opposite sides of it, with $Z - Y$ uniformly small. Neither vector is computed. A label excluding one comparison vector from a boundary strip permits that boundary to move inward while retaining both. Section 4 shrinks the enclosing box in this way, and the value gap converts the final approximation into the exact nonnegative-value set.

The reusable part of the argument is the labeling procedure: its correctness uses monotonicity and the scalar translation identity, and does not inspect the graph or the transition probabilities. The two-sided integer comparison vectors provide the link from that procedure to a discounted game. Quantitative discounting supplies the required accuracy, while the recursion determines the deterministic quasipolynomial running time.

Throughout, vector inequalities, extrema, and integer rounding are coordinatewise, and $upright(bold(1))$ denotes the all-ones vector. The proof uses only exact arithmetic.

== 2 A quantitative discount reduction <sec:discount>

We first reduce the sign of each mean-payoff value to an approximation of one discounted fixed point. The reduction needs two quantitative facts: nonzero values are separated from zero, and a discount of polynomial bit length approximates every value more accurately than this separation. We prove both facts directly, including the identification of the limiting discounted value with the expected pathwise lower average.

The discounted fixed-point method originates in Shapley’s work #cite(label("Shapley1953")). Our argument for a single positional pair at all small discounts is a quantitative version of the eventual-optimality principle introduced by Blackwell for finite Markov decision processes #cite(label("Blackwell1962")); stationary optimality for perfect-information stochastic games with limiting-average payoffs was established by Liggett and Lippman #cite(label("LiggettLippman1969")). Quantitative thresholds for small-discount optimality are studied further in #cite(label("GaubertGrandClementKatz2025")). The estimates and the payoff convention needed here are proved below.

Let $n = \| V \|$, and define

#[#set math.equation(numbering: n => "(2.1)")
 $ W & = max #scale(x: 120%, y: 120%)[\(] 1 \, max_(e in E) \| w \( e \) \| #scale(x: 120%, y: 120%)[\)] \,\
Q & = product_(e upright(" outgoing from")\
i in V_(upright("ch"))) "den" \( p_i \( e \) \) \,\
A_0 & = n ! thin \[ Q \( 3 + W \) \]^n \, #h(2em) H = \( W + 4 \) A_0 \, #h(2em) lambda_0 = frac(1, 32 H^2) . $ <eq:discount-parameters>]

Here $W \, Q \, A_0 \, H$ are positive integers. The denominator in the product defining $Q$ is the positive denominator supplied in the input; the fractions need not be reduced. An empty product is one. The explicit input gives $n = O \( L \)$ and $log Q \, log W = O \( L \)$, because the denominator and reward bits are included in $L$. Therefore

$ log H = O #h(-0.16667em) (n #scale(x: 120%, y: 120%)[\(] log \( n + 1 \) + log Q + log \( W + 3 \) #scale(x: 120%, y: 120%)[\)]) = O \( \( L + 2 \)^2 \) \, $

so $lambda_0$ has polynomial bit length.

For $0 < u < 1$, define $f_u : bb(R)^V arrow.r bb(R)^V$ by taking at vertex $i$ the maximum, minimum, or prescribed chance average of

#[#set math.equation(numbering: n => "(2.2)")
 $ u w \( e \) + \( 1 - u \) t_j \, #h(2em) e : i arrow.r j \, $ <eq:discount-edge>]

according as $i$ belongs to Max, Min, or Chance. This map is monotone and is a contraction in the maximum norm, with constant $1 - u$. Indeed, each expression in (2.2) changes by at most $\( 1 - u \) parallel t - t' parallel_oo$, and taking an extremum or an average preserves that bound. Its iterates from zero converge, because the successive differences decrease geometrically. Their limit is the unique fixed point, denoted $v \( u \)$. Since $f_u$ preserves $\[ - W \, W \]^V$,

#[#set math.equation(numbering: n => "(2.3)")
 $ parallel v \( u \) parallel_oo lt.eq W . $ <eq:discount-bound>]

#thm([Theorem 2.1.])[
  (Quantitative discount reduction).  #emph[For every game in the input class, there are vectors $G \, psi in bb(R)^V$ and a pure positional strategy pair $\( sigma^(*) \, tau^(*) \)$ whose selected edges attain the extrema defining $f_u \( v \( u \) \)$ for every $0 < u lt.eq 1 \/ \( 2 H \)$. Moreover, 
#[#set math.equation(numbering: n => "(2.4)")
 $ v_i \( u \) = G_i + u psi_i + O \( u^2 \) #h(2em) \( u arrow.b 0 \) . $ <eq:gain-bias-expansion>]

 For every start vertex $i$ and every behavioral opposing strategy, 
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E)_(i \, sigma^(*) \, tau) \[ "MP"_w \] gt.eq G_i \, #h(2em) bb(E)_(i \, sigma \, tau^(*)) \[ "MP"_w \] lt.eq G_i . $ <eq:gain-strategy-bounds>]

 Consequently $G_i = "val" \( i \)$. Each $G_i$ is rational with a representation whose denominator has absolute value at most $A_0$, and 
#[#set math.equation(numbering: n => "(2.6)")
 $ \| G_i \| lt.eq W \, #h(2em) G_i eq.not 0 med arrow.r.double med \| G_i \| gt.eq 1 / H \,\
\| v_i \( lambda_0 \) - G_i \| lt.eq frac(1, 16 H) . $ <eq:discount-gap-error>]

]
] <thm:discount>

The proof has an algebraic part and a probabilistic part. Rational functions first give a pair that works for every sufficiently small discount, together with its limiting gain $G$ and first-order term $psi$. We then use these two vectors to control individual plays against arbitrary behavioral opponents.

=== 2.1 A positional pair valid for all small discounts <a-positional-pair-valid-for-all-small-discounts>

Temporarily fix a pure positional pair: one outgoing edge at each Max and Min vertex. Let $P$ be its row-stochastic transition matrix and let $r_i$ be its expected one-step reward at $i$. At a chance vertex the transition probabilities of parallel edges are added in $P$, whereas their possibly different rewards are averaged in $r$. The pair’s discounted equations are

#[#set math.equation(numbering: n => "(2.7)")
 $ x \( u \) = u r + \( 1 - u \) P x \( u \) . $ <eq:pair-discount-equations>]

The matrix $I - \( 1 - u \) P$ is invertible for $0 < u < 1$: a vector in its kernel would satisfy $parallel x parallel_oo lt.eq \( 1 - u \) parallel x parallel_oo$. The corresponding affine contraction preserves $\[ - W \, W \]^V$, so its solution satisfies $parallel x \( u \) parallel_oo lt.eq W$.

The determinant argument follows the rational-function sign method of Andersson and Miltersen #cite(label("AnderssonMiltersen2009")) Lemma 1; we derive all coefficient bounds in the input parameters above. For a polynomial $a$, write $parallel a parallel_(upright("coef"))$ for the sum of the absolute values of its coefficients. This norm is subadditive and submultiplicative. Every entry of $Q P$ and $Q r$ is an integer. Cramer’s rule therefore gives integer polynomials $N_i \, D$ with

#[#set math.equation(numbering: n => "(2.8)")
 $ x_i \( u \) = frac(N_i \( u \), D \( u \)) \, #h(2em) D \( u \) = det #scale(x: 120%, y: 120%)[\(] Q \( I - \( 1 - u \) P \) #scale(x: 120%, y: 120%)[\)] . $ <eq:discount-cramer>]

Each entry of the matrix defining $D$ has coefficient norm at most $3 Q$. The replacing column defining $N_i$ is $Q u r$, whose entries have coefficient norm at most $Q W$. Expanding each determinant over its $n !$ permutations gives

#[#set math.equation(numbering: n => "(2.9)")
 $ parallel D parallel_(upright("coef")) lt.eq A_0 \, #h(2em) parallel N_i parallel_(upright("coef")) lt.eq A_0 . $ <eq:discount-polynomial-bound>]

Whether this pair’s chosen edge is optimal at a player vertex $i$ is determined by comparisons with every outgoing edge $e : i arrow.r j$. Each comparison is the sign of

#[#set math.equation(numbering: n => "(2.10)")
 $ x_i \( u \) - u w \( e \) - \( 1 - u \) x_j \( u \) = frac(N_i \( u \) - u w \( e \) D \( u \) - \( 1 - u \) N_j \( u \), D \( u \)) . $ <eq:discount-edge-comparison>]

The numerator has coefficient norm at most $\( 3 + W \) A_0 lt.eq H$.

To control these signs, let $a$ be any nonzero integer polynomial with $parallel a parallel_(upright("coef")) lt.eq H$. Factoring its lowest power of $u$ gives $a \( u \) = u^ell \( c + u q \( u \) \)$, where $c$ is a nonzero integer. For $0 < u lt.eq 1 \/ \( 2 H \)$,

$ \| u q \( u \) \| lt.eq H u lt.eq 1 / 2 < \| c \| . $

Thus the sign of $a \( u \)$ throughout this interval is the sign of its lowest nonzero coefficient. This observation applies to both the numerator and denominator in (2.10); the denominator is nonzero there by invertibility. Every edge comparison therefore has a constant sign or vanishes identically on the interval.

Now choose attaining edges in the maximum and minimum defining $f_(lambda_0) \( v \( lambda_0 \) \)$. They give a pure positional pair $\( sigma^(*) \, tau^(*) \)$, and its linear solution at $lambda_0$ equals $v \( lambda_0 \)$. Since $lambda_0 lt.eq 1 \/ \( 2 H \)$, all edge inequalities that hold at $lambda_0$ continue to hold for every $0 < u lt.eq 1 \/ \( 2 H \)$. For each such $u$, the pair’s linear solution is consequently a fixed point of $f_u$, hence equals $v \( u \)$. The pair is needed for the proof; the algorithm need not compute it.

=== 2.2 The rational gain and its approximation error <the-rational-gain-and-its-approximation-error>

Use the polynomials of the pair just selected. Let $ell$ be the lowest nonzero degree of $D$. Boundedness of $N_i \( u \) \/ D \( u \)$ as $u arrow.b 0$ implies that $u^ell$ also divides each $N_i$. Define $hat(D) = D \/ u^ell$ and $hat(N)_i = N_i \/ u^ell$. Their coefficient norms satisfy (2.9), and $hat(D) \( 0 \)$ is a nonzero integer. The quotient is analytic at zero, so it has the expansion (2.4), with

#[#set math.equation(numbering: n => "(2.11)")
 $ G_i = frac(hat(N)_i \( 0 \), hat(D) \( 0 \)) . $ <eq:rational-gain>]

The bound (2.3) gives $\| G_i \| lt.eq W$. The displayed denominator has magnitude at most $A_0$, and its numerator is an integer. Thus $G_i eq.not 0$ implies $\| G_i \| gt.eq 1 \/ A_0 gt.eq 1 \/ H$.

The same coefficient bounds also control the approximation error. The polynomial $hat(N)_i - G_i hat(D)$ has constant coefficient zero and coefficient norm at most $\( 1 + W \) A_0$. For $0 < u lt.eq 1 \/ \( 2 H \)$, the tail of $hat(D)$ has magnitude at most $A_0 u lt.eq 1 \/ 2$, so $\| hat(D) \( u \) \| gt.eq 1 \/ 2$. It follows that

#[#set math.equation(numbering: n => "(2.12)")
 $ \| v_i \( u \) - G_i \| lt.eq 2 \( 1 + W \) A_0 u lt.eq 2 H u . $ <eq:uniform-discount-error>]

At $u = lambda_0$, this is the error claimed in (2.6).

It remains to identify $G_i$ with the mean-payoff value. The gain controls which transitions can persist, and the coefficient $psi$ then controls the rewards on those transitions. For a selected player edge $e : i arrow.r j$, substitution of (2.4) into the discounted equation gives

#[#set math.equation(numbering: n => "(2.13)")
 $ G_i = G_j \, #h(2em) psi_i = w \( e \) + psi_j - G_j . $ <eq:selected-gain-bias>]

At a chance vertex, the corresponding identities are

#[#set math.equation(numbering: n => "(2.14)")
 $ G_i & = sum_(e : i arrow.r j) p_i \( e \) G_j \,\
psi_i & = sum_(e : i arrow.r j) p_i \( e \) #scale(x: 120%, y: 120%)[\(] w \( e \) + psi_j - G_j #scale(x: 120%, y: 120%)[\)] . $ <eq:chance-gain-bias>]

At a Min vertex, the inequality $v_i \( u \) lt.eq u w \( e \) + \( 1 - u \) v_j \( u \)$ for an arbitrary outgoing edge first gives $G_i lt.eq G_j$. If $G_i = G_j$, subtracting this common constant, dividing by $u$, and letting $u arrow.b 0$ gives

#[#set math.equation(numbering: n => "(2.15)")
 $ psi_i lt.eq w \( e \) + psi_j - G_j . $ <eq:min-gain-bias>]

At a Max vertex, the gain inequality and, when the gains agree, the bias inequality both reverse.

=== 2.3 From one-step inequalities to pathwise payoffs <from-one-step-inequalities-to-pathwise-payoffs>

We use two elementary facts about adapted processes. Fixing a selected strategy will give the gain along a play one-sided conditional drift. The first lemma shows that the gain then becomes constant, so only gain-preserving player moves can persist and the bias inequalities apply. The second lemma shows that the centered contributions at chance vertices have vanishing averages.

#thm([Lemma 2.2.])[
  (Finite-valued submartingales).  #emph[Let $\( Z_t \)_(t gt.eq 0)$ be adapted to a filtration $\( cal(F)_t \)_(t gt.eq 0)$ and take values in a fixed finite subset of $bb(R)$. If $bb(E) \[ Z_(t + 1) divides cal(F)_t \] gt.eq Z_t$ for every $t$, then $Z_t$ is eventually constant almost surely. Its eventual value $Z_oo$ satisfies $bb(E) Z_oo gt.eq bb(E) Z_0$.]
] <lem:finite-submartingale>

#proof[
  Add a constant to make $Y_t = Z_t + c$ nonnegative. Conditional expectation and the assumed drift give
  $ bb(E) \[ Y_(t + 1)^2 - Y_t^2 \] & = bb(E) \[ \( Y_(t + 1) - Y_t \)^2 \] + 2 bb(E) #h(-0.16667em) [Y_t thin bb(E) \[ Y_(t + 1) - Y_t divides cal(F)_t \]]\
 & gt.eq bb(E) \[ \( Y_(t + 1) - Y_t \)^2 \] . $
  Summing and using boundedness shows that $bb(E) sum_(t gt.eq 0) \( Y_(t + 1) - Y_t \)^2 < oo$. The sum is therefore finite almost surely. If there is more than one possible value, let $Delta > 0$ be the minimum distance between distinct values. Every change contributes at least $Delta^2$ to the sum, so only finitely many changes occur. The singleton case is immediate. Finally, $bb(E) Z_t gt.eq bb(E) Z_0$ for all $t$, and bounded convergence gives the claimed expectation inequality. ◻
]

#thm([Lemma 2.3.])[
  (Averages of bounded martingale differences).  #emph[Let $\( cal(F)_t \)_(t gt.eq 0)$ be a filtration. Suppose $D_t$ is $cal(F)_(t + 1)$-measurable, $bb(E) \[ D_t divides cal(F)_t \] = 0$, and $\| D_t \| lt.eq c$ for a fixed finite constant $c$. Then $T^(- 1) sum_(t < T) D_t arrow.r 0$ almost surely.]
] <lem:bounded-martingale-average>

#proof[
  For $s < t$, conditioning on $cal(F)_t$ gives $bb(E) \[ D_s D_t \] = 0$. Hence $bb(E) \[ \( sum_(t < T) D_t \)^2 \] lt.eq T c^2$. Chebyshev’s inequality at $T = j^2$ gives, for every $epsilon > 0$,
  $ bb(P) #h(-0.16667em) (lr(|1 / j^2 sum_(t < j^2) D_t|) > epsilon) lt.eq frac(c^2, epsilon^2 j^2) . $
  The sum over $j$ is finite. The probability that one of these events occurs after index $m$ is at most the tail of this sum, which tends to zero. Applying this argument to $epsilon = 1 \, 1 \/ 2 \, 1 \/ 3 \, dots.h$ proves convergence along squares on a single event of probability one. For $j^2 lt.eq T < \( j + 1 \)^2$, the additional partial sum has magnitude at most $c \( 2 j + 1 \)$. Dividing by $T gt.eq j^2$ extends convergence to every $T$. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 2.] Fix a start vertex $i$, fix Max to $sigma^(*)$, and let Min use an arbitrary behavioral strategy. Write $X_t$ for the vertex before the edge $e_t$ is traversed, and let $cal(F)_t$ be the sigma-field generated by the complete observed history through $X_t$. At a chance vertex the conditional law of $e_t$ is the prescribed distribution. At a player vertex it is the distribution induced by that player’s strategy, including any private randomness.
  The process $G_(X_t)$ has nonnegative conditional drift. A selected Max edge preserves $G$ by (2.13); every Min edge weakly increases $G$; and the first identity in (2.14) gives zero drift at a chance vertex. Lemma 3 gives an eventual value $G_oo$ with
  #[#set math.equation(numbering: n => "(2.16)")
   $ bb(E) G_oo gt.eq G_i . $ <eq:gain-limit-expectation>]
  Define the one-step residual and its chance part by
  $ R_t = w \( e_t \) + psi_(X_(t + 1)) - psi_(X_t) - G_(X_t) \, #h(2em) D_t = upright(bold(1))_({ X_t in V_(upright("ch")) }) R_t . $
  These random variables are uniformly bounded because the arena is finite. At a chance vertex, the two identities in (2.14) imply
  $ bb(E) \[ R_t divides cal(F)_t \] = sum_(e : X_t arrow.r j) p_(X_t) \( e \) \( w \( e \) + psi_j \) - psi_(X_t) - G_(X_t) = 0 . $
  Outside chance vertices $D_t = 0$. Thus $bb(E) \[ D_t divides cal(F)_t \] = 0$, and Lemma 4 gives $T^(- 1) sum_(t < T) D_t arrow.r 0$ almost surely.
  After $G_(X_t)$ has become constant, every traversed nonchance edge preserves $G$. Its residual is zero at Max vertices by (2.13), and nonnegative at Min vertices by (2.15). The nonchance residuals are therefore nonnegative except for a finite initial segment. Consequently
  $ liminf_(T arrow.r oo) 1 / T sum_(t < T) R_t gt.eq 0 #h(2em) upright("almost surely") . $
  Telescoping the bias terms gives
  #[#set math.equation(numbering: n => "(2.17)")
   $ 1 / T sum_(t < T) w \( e_t \) = 1 / T sum_(t < T) G_(X_t) + 1 / T sum_(t < T) R_t + frac(psi_(X_0) - psi_(X_T), T) . $ <eq:gain-bias-telescoping>]
  The first average tends to $G_oo$, and the last term tends to zero. Hence $"MP"_w gt.eq G_oo$ almost surely. Taking expectations and using (2.16) proves the first inequality in (2.5).
  For the second inequality, fix Min to $tau^(*)$ and let Max be arbitrary. Now $- G_(X_t)$ has nonnegative conditional drift. The same finite-valued lemma yields an eventual gain $G_oo$ with $bb(E) G_oo lt.eq G_i$. The chance residuals still have average zero. At Min vertices the selected edges have residual zero; at Max vertices an edge preserving $G$ has nonpositive residual by the reversed version of (2.15). Thus the nonchance residuals are eventually nonpositive, and (2.17) gives
  $ limsup_(T arrow.r oo) 1 / T sum_(t < T) w \( e_t \) lt.eq G_oo #h(2em) upright("almost surely") . $
  This also bounds the pathwise lower average. Taking expectations proves the second inequality in (2.5).
  Max can therefore guarantee $G_i$, and Min can guarantee that the payoff is at most $G_i$, so $"val" \( i \) = G_i$. The payoffs and gain limits in these expectation comparisons are bounded. The argument permits each opposing history-dependent distribution and establishes the expected-liminf convention directly. ◻
]

== 3 Simultaneous labeling for discounted monotone maps <sec:labeling>

We now construct the labels that will permit a box to shrink while retaining the integer comparison vectors around the discounted fixed point. The construction depends only on order and on the response to a common translation. We therefore work in the following abstract setting: $n gt.eq 1$ and $F : bb(R)^n arrow.r bb(R)^n$ satisfy

#[#set math.equation(numbering: n => "(3.1)")
 $ t lt.eq t' med arrow.r.double med F \( t \) lt.eq F \( t' \) \, #h(2em) F \( t + c upright(bold(1)) \) = F \( t \) + gamma c upright(bold(1)) quad \( t in bb(R)^n \, med c in bb(R) \) \, #h(2em) 0 < gamma < 1 . $ <eq:label-map>]

All vector inequalities, minima, maxima, and floors in this section are coordinatewise. The algorithm uses $F$ only by evaluating $floor.l F \( t \) floor.r$ at integer vectors $t$.

The two pivot passes and subsequent mass change adapt the simultaneous labeling construction of #cite(label("OpenAI2026Deterministic")) Sections 4–5. Here the operator has the discounted translation rule in Equation (3.1). The proof below establishes the required labeling theorem directly; the signs of the witness translations are what make that adaptation possible.

=== 3.1 Witnesses and the labeling guarantee <witnesses-and-the-labeling-guarantee>

An input consists of $A in bb(Z)^n$, a width

#[#set math.equation(numbering: n => "(3.2)")
 $ D = h 2^d \, #h(2em) 128 lt.eq h lt.eq 255 \, quad h \, d in bb(Z) \, quad d gt.eq 0 \, $ <eq:label-width>]

and positive rational mass vectors $a \, b in bb(Q)_(> 0)^n$. Write $u = A + D upright(bold(1))$, $P = D \/ 32$, and $a \( S \) = sum_(i in S) a_i$, $b \( S \) = sum_(i in S) b_i$ for $S subset.eq { 1 \, dots.h \, n }$. The representation in Equation (3.2) is unique. Its short range of mantissas will later allow small relative decreases in the width.

#prodef([Definition 3.1.])[
  (Witnesses and claims).  An integer vector $y in \[ A \, u \]$ is a #emph[subsolution in the box] if
  $ F_i \( y \) gt.eq y_i quad upright("for every ") i in S_y \, #h(2em) S_y = { i : y_i > A_i } . $
  It is a #emph[plus witness] if also $a \( S_y \) lt.eq 1$; its claims are the indices $i$ for which $y_i gt.eq u_i - P$.
  An integer vector $z in \[ A \, u \]$ is a #emph[supersolution in the box] if
  $ F_i \( z \) lt.eq z_i quad upright("for every ") i in S_z \, #h(2em) S_z = { i : z_i < u_i } . $
  It is a #emph[minus witness] if also $b \( S_z \) lt.eq 1$; its claims are the indices $i$ for which $z_i lt.eq A_i + P$. The sets $S_y \, S_z$ are the respective supports. A witness is #emph[relevant] if it has at least one claim.
] <def:label-witness>

Every claim belongs to its witness’s support, since $0 < P < D$. The output must respect all these claims simultaneously, although the algorithm is not given any witness and does not search for one.

#thm([Theorem 3.2.])[
  (Recursive simultaneous labeling).  #emph[Let $F : bb(R)^n arrow.r bb(R)^n$ satisfy Equation (3.1). There is a terminating deterministic procedure $cal(L) \( A \, D \, a \, b \)$, using exact evaluations of $floor.l F \( t \) floor.r$ for $t in bb(Z)^n$ and integer and rational arithmetic, with the following guarantee. For every input as in Equation (3.2) and Definition 5, its output $ell in { + \, - }^n$ satisfies 
$ y_i gt.eq A_i + D - P & med arrow.r.double med ell_i = + &  & upright("for every plus witness ") y \,\
z_i lt.eq A_i + P & med arrow.r.double med ell_i = - &  & upright("for every minus witness ") z . $

]
] <thm:labeling>

The existence of a labeling will already follow from the finite box iteration below. The purpose of the recursive construction is to obtain such labels with the controlled branching and decreasing rank of Lemma 9, replacing dependence on the numerical width by dependence on its exponent.

#thm([Lemma 3.3.])[
  (Comparison and a finite box iteration).  #emph[Every subsolution $y$ and supersolution $z$ in the same box satisfy $y lt.eq z$. Starting at $t^0 = u$, the iteration 
#[#set math.equation(numbering: n => "(3.3)")
 $ t^(m + 1) = T \( t^m \) \, #h(2em) T \( t \) = min { u \, max { A \, floor.l F \( t \) floor.r } } \, $ <eq:label-floor>]

 stops at a vector $t^(*)$ after at most $n D + 1$ evaluations of $T$. For every such pair $y \, z$ one has $y lt.eq t^(*) lt.eq z$.]
] <lem:label-comparison>

#proof[
  If $m = max_j \( y_j - z_j \) > 0$, choose $i$ with $y_i - z_i = m$. Since $y_i > z_i gt.eq A_i$ and $z_i < y_i lt.eq u_i$, both defining inequalities apply at $i$. Monotonicity and the common translation rule give
  $ m lt.eq F_i \( y \) - F_i \( z \) lt.eq F_i \( z + m upright(bold(1)) \) - F_i \( z \) = gamma m \, $
  a contradiction.
  The map $T$ preserves the finite integer box and is monotone. Moreover $T \( u \) lt.eq u$, so induction gives $t^(m + 1) lt.eq t^m$. Each changing step decreases the nonnegative integer $sum_i \( t_i^m - A_i \)$ by at least one. Its initial value is $n D$, which proves the termination bound, including the final unchanged step.
  For an integer $y in \[ A \, u \]$, the subsolution condition is equivalent to $y lt.eq T \( y \)$. Indeed, when $y_i > A_i$, the latter inequality is equivalent to $y_i lt.eq floor.l F_i \( y \) floor.r$, and at the other coordinates it is automatic. If $y$ is a subsolution, induction gives $y lt.eq t^m$: from $y lt.eq t^m$ one obtains $y lt.eq T \( y \) lt.eq T \( t^m \) = t^(m + 1)$. Thus $y lt.eq t^(*)$. The fixed point $t^(*) = T \( t^(*) \)$ is itself a subsolution, and the comparison principle gives $t^(*) lt.eq z$ for every supersolution $z$. ◻
]

=== 3.2 The recursive procedure <the-recursive-procedure>

A #emph[centered call] of even width $r$ at an integer pivot $k$ means the call $cal(L) \( k - \( r \/ 2 \) upright(bold(1)) \, r \, a' \, b' \)$ with the indicated masses. All calls use the same map $F$. In a nonbase call set

#[#set math.equation(numbering: n => "(3.4)")
 $ c = A + D / 2 upright(bold(1)) \, #h(2em) M = D / 8 \, #h(2em) q = D / 128 \, #h(2em) p = q / 32 = D / 4096 . $ <eq:label-scales>]

The pivot will stay between $c - M upright(bold(1))$ and $c + M upright(bold(1))$. The two passes use narrow centered boxes to identify some labels directly and arrange the remaining witnesses so that the later mass change preserves their admissibility. The downward pass preserves the plus masses, and the upward pass preserves the minus masses. A final wider centered call supplies the signs used to change both mass vectors.

#strong[Procedure $cal(L) \( A \, D \, a \, b \)$.] Execute the first applicable base case. If neither applies, execute Steps 3–6 in order.

+ #strong[Mass base case.] If $a_i b_i > 1$ for every $i$, return $+$ at $i$ when $b_i > 1$, and return $-$ otherwise.
+ #strong[Width base case.] If $d < 12$, compute $t^(*)$ by Equation (3.3). Return $+$ at $i$ when $t_i^(*) > A_i + D \/ 2$, and return $-$ otherwise.
+ #strong[Downward pass.] Initialize $k = c$. Make a centered width-$q$ call at $k$ with masses $\( a \, 4 / 3 b \)$, and use its labels to update all coordinates simultaneously by
  #[#set math.equation(numbering: n => "(3.5)")
   $ k_i^(upright("new")) = cases(delim: "{", max { c_i - M \, k_i - p } \, & upright("if the child labels ") i upright(" by ") - \,, k_i \, & upright("if the child labels ") i upright(" by ") + .) $ <eq:label-down-update>]
  Replace $k$ by $k^(upright("new"))$ and repeat until an update leaves the pivot unchanged. Denote this last pivot by $k^arrow.b$ and set
  #[#set math.equation(numbering: n => "(3.6)")
   $ I_(-) = { i : k_i^arrow.b < c_i - P } . $ <eq:label-minus-override>]
+ #strong[Upward pass.] Start at $k = k^arrow.b$. Make a centered width-$q$ call at $k$ with masses $\( 4 / 3 a \, b \)$, and update simultaneously by
  #[#set math.equation(numbering: n => "(3.7)")
   $ k_i^(upright("new")) = cases(delim: "{", min { c_i + M \, k_i + p } \, & upright("if the child labels ") i upright(" by ") + \,, k_i \, & upright("if the child labels ") i upright(" by ") - .) $ <eq:label-up-update>]
  Replace $k$ by $k^(upright("new"))$ and repeat until an unchanged update. Denote the last pivot by $k^f$ and set
  #[#set math.equation(numbering: n => "(3.8)")
   $ I_(+) = { i : k_i^f > c_i + P } . $ <eq:label-plus-override>]
+ #strong[Provisional labels and new masses.] Make a centered width-$D \/ 2$ call at $k^f$ with masses $\( a \, b \)$. For its output $ell^0$, define
  #[#set math.equation(numbering: n => "(3.9)")
   $ \( macron(a)_i \, macron(b)_i \) = cases(delim: "{", \( 4 / 5 a_i \, 8 / 5 b_i \) \, & ell_i^0 = + \,, \( 8 / 5 a_i \, 4 / 5 b_i \) \, & ell_i^0 = - .) $ <eq:label-reweight>]
+ #strong[Continuation and overrides.] Call $cal(L) \( A \, D \, macron(a) \, macron(b) \)$. In its output replace the signs on $I_(-)$ by $-$ and those on $I_(+) \\ I_(-)$ by $+$. Return this label vector.

Each pass includes the final child call whose update changes nothing. That call will certify a mass inequality at the stopped pivot. All coordinates in one update use the same old pivot and the same child output; there is no order-dependent coordinate update.

The purpose of the passes is the following mass property. For every witness with a claim outside its own override set—$I_(+)$ for a plus witness and $I_(-)$ for a minus witness—the coordinates in its support whose provisional labels match its sign will have total mass greater than $3 \/ 4$. Here mass means $a$-mass for a plus witness and $b$-mass for a minus witness. Its original total mass is at most one, so Step 5 will leave its new total mass below

$ 8 / 5 - 4 / 5 dot.op 3 / 4 = 1 . $

It will therefore remain a witness for the continuation in the unchanged box. At the same time, every product $a_i b_i$ is multiplied by $32 \/ 25$. We first use this product growth to prove termination; the subsequent witness analysis proves the stated mass property and hence correctness.

#thm([Lemma 3.4.])[
  (Valid boxes and bounded passes).  #emph[Every child input is valid and its box lies inside its parent’s box. If the child calls terminate, each pivot pass makes at most $1024 n + 1$ calls. The width base case makes at most $522240 n + 1$ evaluations of $floor.l F floor.r$.]
] <lem:label-mechanics>

#proof[
  In a nonbase call $d gt.eq 12$, so $c \, M \, q \, p$ and the half-widths $q \/ 2 \, D \/ 4$ are integral. The centered widths have the allowed representations $q = h 2^(d - 7)$ and $D \/ 2 = h 2^(d - 1)$. The pivot caps keep $c - M upright(bold(1)) lt.eq k lt.eq c + M upright(bold(1))$, and a centered box has width $r lt.eq D \/ 2$. Its boundaries satisfy
  $ k - r / 2 upright(bold(1)) gt.eq A + D / 8 upright(bold(1)) gt.eq A \, #h(2em) k + r / 2 upright(bold(1)) lt.eq A + frac(7 D, 8) upright(bold(1)) lt.eq u . $
  The continuation uses the same box. All masses remain positive rationals.
  Every pivot coordinate lies on the grid of spacing $p$ through $c_i$, because $M \/ p = 512$ is integral. In a changing update some coordinate moves by $p$; each coordinate is monotone during a pass and travels at most $2 M$, hence moves at most $1024$ times. There are at most $1024 n$ changing updates, followed by one unchanged update. Finally, $d < 12$ implies $D lt.eq 255 dot.op 2^11 = 522240$, so the width bound follows from Lemma 7. ◻
]

The continuation preserves the width, so width reduction alone does not prove termination. The mass products provide the missing measure. Define

#[#set math.equation(numbering: n => "(3.10)")
 $ mu \( a \, b \) = min_i a_i b_i \, #h(2em) rho = 32 / 25 \, #h(2em) B \( mu \) = min { j in bb(Z)_(gt.eq 0) : rho^j mu > 1 } . $ <eq:label-budget>]

This integer is used only in the proof, not computed by the procedure.

#thm([Lemma 3.5.])[
  (Rank and branching).  #emph[The procedure terminates. At a nonbase call every child has smaller rank $d + B \( mu \( a \, b \) \)$. There is exactly one child preserving $B$, the provisional call, and it decreases $d$ by one. There are at most $2048 n + 3$ other children; each decreases $B$ by at least one and does not increase $d$.]
] <lem:label-rank>

#proof[
  At a nonbase call $B \( mu \) > 0$, since otherwise the mass base case would apply. Whenever $mu' gt.eq rho mu$, the definition gives $B \( mu' \) lt.eq B \( mu \) - 1$. Both pivot passes multiply every mass product by $4 \/ 3 gt.eq rho$. The continuation multiplies every mass product by $\( 4 \/ 5 \) \( 8 \/ 5 \) = rho$, independently of the provisional label. These children reduce $B$ and preserve or reduce $d$. Only the provisional call keeps the masses; it halves the width and reduces $d$ by one. This proves the rank assertion.
  Induction on the nonnegative rank proves termination. The base cases are finite by their definitions and Lemma 8. At a nonbase call every child terminates by induction, and the bound on each pivot pass then applies. The number of children decreasing $B$ is at most $2 \( 1024 n + 1 \) + 1 = 2048 n + 3$. ◻
]

=== 3.3 Translating a witness into a centered box <translating-a-witness-into-a-centered-box>

To analyze the labels, we follow an arbitrary parent witness through the centered calls. Translation places its largest deviation from the pivot at one boundary of the child box; clipping removes coordinates far below that largest deviation. The surviving support will identify the mass forced near the largest deviation when a pivot pass stops.

Fix a nonbase input and a pivot $k in \[ c - M upright(bold(1)) \, c + M upright(bold(1)) \]$. For a relevant plus witness $y$, define its #emph[peak] and #emph[gaps] by

#[#set math.equation(numbering: n => "(3.11)")
 $ s_y \( k \) = max_i \( y_i - k_i \) \, #h(2em) g_i^y \( k \) = s_y \( k \) - \( y_i - k_i \) . $ <eq:label-plus-gaps>]

For a relevant minus witness $z$, put

#[#set math.equation(numbering: n => "(3.12)")
 $ s_z \( k \) = max_i \( k_i - z_i \) \, #h(2em) g_i^z \( k \) = s_z \( k \) - \( k_i - z_i \) . $ <eq:label-minus-gaps>]

The gaps are nonnegative integers and at least one gap is zero. The following lemma handles both signs, including the inequalities introduced by the discount factor.

#thm([Lemma 3.6.])[
  (Translation and clipping).  #emph[Let $r in { q \, D \/ 2 }$ and let $y$ or $z$ be a relevant witness of the parent box. Define, according to its sign, 
#[#set math.equation(numbering: n => "(3.13)")
 $ y'_i & = max { k_i - r \/ 2 \, med y_i - s_y \( k \) + r \/ 2 } \,\
z'_i & = min { k_i + r \/ 2 \, med z_i + s_z \( k \) - r \/ 2 } . $ <eq:label-translation>]

 The resulting vector is an integer subsolution or supersolution, respectively, in the centered width-$r$ box. Its support is exactly ${ i : g_i \( k \) < r }$, which is contained in the parent’s support. It claims every index with $g_i \( k \) lt.eq r \/ 32$. It is a witness for that child whenever its support has mass at most one for the child’s mass vector of the corresponding sign.]
] <lem:label-translation>

#proof[
  A parent claim gives, in either case,
  #[#set math.equation(numbering: n => "(3.14)")
   $ s \( k \) gt.eq D \/ 2 - M - P = 11 D \/ 32 . $ <eq:label-peak-lower>]
  Outside the parent support one has $y_i = A_i$ or $z_i = u_i$. The corresponding deviation is at most $- D \/ 2 + M = - 3 D \/ 8$, so its gap is at least $23 D \/ 32 > D \/ 2$. Such an index cannot belong to ${ i : g_i \( k \) < r }$.
  Before clipping, the two expressions on the right of Equation (3.13) are
  $ k_i + r \/ 2 - g_i^y \( k \) \, #h(2em) k_i - r \/ 2 + g_i^z \( k \) \, $
  respectively. They lie on the correct side of the far boundary; clipping at the other boundary puts the vector in the child box. These expressions also show directly that the support is exactly the set of gaps strictly below $r$, and that every gap at most $r \/ 32$ gives a claim.
  For the plus case let $t = - s_y \( k \) + r \/ 2 < 0$, where the strict sign follows from Equation (3.14) and $r \/ 2 lt.eq D \/ 4$. One has $y' gt.eq y + t upright(bold(1))$. At an index in the child support, equality holds in that coordinate, and the parent subsolution inequality applies. Therefore
  $ F_i \( y' \) gt.eq F_i \( y + t upright(bold(1)) \) = F_i \( y \) + gamma t gt.eq y_i + t = y'_i \, $
  using $gamma t gt.eq t$. For the minus case let $t = s_z \( k \) - r \/ 2 > 0$. Now $z' lt.eq z + t upright(bold(1))$, with coordinatewise equality on the child support, and
  $ F_i \( z' \) lt.eq F_i \( z + t upright(bold(1)) \) = F_i \( z \) + gamma t lt.eq z_i + t = z'_i \, $
  using $gamma t lt.eq t$. Thus the required inequalities survive both translation and clipping. The stated mass condition is exactly the remaining condition for being a child witness. ◻
]

=== 3.4 What the two pivot passes enforce <what-the-two-pivot-passes-enforce>

We prove correctness by induction on the rank from Lemma 9. For the remainder of this subsection, fix a nonbase call and assume that all its children satisfy Theorem 6. Witnesses, supports, and claims refer to the parent input unless stated otherwise.

In each pass, the sign whose masses are unchanged protects its own peak: coordinates close enough to that peak must receive its sign and remain stationary. The opposite sign has its masses multiplied by $4 \/ 3$. At the final unchanged update, any witness of that sign with a claim outside its override set must consequently have mass greater than $3 \/ 4$ near its peak. The next two lemmas make these statements precise.

#thm([Lemma 3.7.])[
  (The downward pass).  #emph[For every relevant plus witness $y$, the peak $s_y \( k \)$ is constant throughout the downward pass and at most $D \/ 2$. No plus witness claims an index in $I_(-)$. Every minus witness $z$ with a claim outside $I_(-)$ satisfies 
#[#set math.equation(numbering: n => "(3.15)")
 $ b #scale(x: 120%, y: 120%)[\(] { i : g_i^z \( k^arrow.b \) < q } #scale(x: 120%, y: 120%)[\)] > 3 \/ 4 . $ <eq:label-down-mass>]

]
] <lem:label-down>

#proof[
  Fix a relevant plus witness $y$ and consider an update from $k$. The width-$q$ translation in Lemma 10 is a plus witness for the child, since the plus masses are unchanged and its support is contained in $S_y$. Its claims include all indices with $g_i^y \( k \) lt.eq q \/ 32 = p$. The child labels all of them by $+$, so they do not move. In particular, every peak achiever continues to attain the old peak.
  At any other coordinate let $delta_i = k_i - k_i^(upright("new"))$. Then $0 lt.eq delta_i lt.eq p$ and
  $ y_i - k_i^(upright("new")) = s_y \( k \) - g_i^y \( k \) + delta_i < s_y \( k \) . $
  Thus no moving coordinate reaches the old peak, even when several coordinates move simultaneously. The peak is unchanged. At the initial pivot $c$, $y lt.eq u$ gives $s_y \( c \) lt.eq D \/ 2$. If $y$ claims $i$, it follows that
  $ k_i^arrow.b gt.eq y_i - D \/ 2 gt.eq A_i + D \/ 2 - P = c_i - P \, $
  so $i in.not I_(-)$.
  For the mass assertion, let $z$ claim $j in.not I_(-)$. Then $k_j^arrow.b gt.eq c_j - P$ and $z_j lt.eq A_j + P$, whence
  #[#set math.equation(numbering: n => "(3.16)")
   $ s_z \( k^arrow.b \) gt.eq D \/ 2 - 2 P = 7 D \/ 16 > D \/ 2 - M . $ <eq:label-down-uncapped>]
  At a lower-capped coordinate $k_i^arrow.b = c_i - M$ one instead has $k_i^arrow.b - z_i lt.eq D \/ 2 - M$, since $z_i gt.eq A_i$. Every peak achiever is therefore strictly above the lower cap.
  If the mass in Equation (3.15) were at most $3 \/ 4$, the width-$q$ translation of $z$ would have support mass at most one under the final child’s minus masses $4 / 3 b$. It would be a minus witness and would claim every peak achiever. The child would label such a coordinate by $-$, forcing it to move down because it is above the lower cap. This contradicts the unchanged update. The mass is therefore strictly greater than $3 \/ 4$. ◻
]

#thm([Lemma 3.8.])[
  (The upward pass).  #emph[For every relevant minus witness $z$, the peak $s_z \( k \)$ is constant throughout the upward pass and at most $D \/ 2$. No minus witness claims an index in $I_(+)$. At the final pivot the following mass inequalities hold: 
#[#set math.equation(numbering: n => "(3.17)")
 $ b #scale(x: 120%, y: 120%)[\(] { i : g_i^z \( k^f \) < q } #scale(x: 120%, y: 120%)[\)] & > 3 \/ 4 &  & upright("if ") z upright(" has a claim outside ") I_(-) \,\
a #scale(x: 120%, y: 120%)[\(] { i : g_i^y \( k^f \) < q } #scale(x: 120%, y: 120%)[\)] & > 3 \/ 4 &  & upright("if ") y upright(" has a claim outside ") I_(+) . $ <eq:label-final-minus-mass>]

]
] <lem:label-up>

#proof[
  Fix a relevant minus witness $z$. The width-$q$ translation is a minus witness for every child in this pass because the minus masses are unchanged. All coordinates with $g_i^z \( k \) lt.eq p$ must receive $-$ and stay fixed. In particular a peak achiever stays fixed. At a coordinate with $g_i^z \( k \) > p$, write $delta_i = k_i^(upright("new")) - k_i in \[ 0 \, p \]$. Then
  $ k_i^(upright("new")) - z_i = s_z \( k \) - g_i^z \( k \) + delta_i < s_z \( k \) . $
  No coordinate overtakes the peak, so the peak is constant. At the starting pivot $k^arrow.b lt.eq c$ and $z gt.eq A$, it is at most $D \/ 2$. A minus claim at $i$ consequently implies
  $ k_i^f lt.eq z_i + D \/ 2 lt.eq A_i + P + D \/ 2 = c_i + P \, $
  excluding $i$ from $I_(+)$. Because the peak is constant and $k$ only increases during this pass, every gap $g_i^z \( k \)$ is nonincreasing. Thus the set of gaps below $q$ can only grow, and Equation (3.15) implies Equation (3.17).
  Now let a plus witness $y$ claim $j in.not I_(+)$. At the final pivot $k_j^f lt.eq c_j + P$ and $y_j gt.eq A_j + D - P$, so
  $ s_y \( k^f \) gt.eq D \/ 2 - 2 P = 7 D \/ 16 > D \/ 2 - M . $
  An upper-capped coordinate $k_i^f = c_i + M$ has $y_i - k_i^f lt.eq D \/ 2 - M$, since $y_i lt.eq u_i$. Every peak achiever is strictly below the upper cap. If the mass in Equation (3.17) were at most $3 \/ 4$, its width-$q$ translation would be a plus witness for the last child, whose plus masses are $4 / 3 a$. Every peak achiever would have label $+$ and would move up, contradicting the final unchanged update. This proves the remaining inequality. ◻
]

The two passes have now separated the claims into those that can safely receive an override and those whose witnesses have substantial mass near a peak at $k^f$. The wider provisional call labels all that mass with the witness’s sign. Reducing the masses of that sign then keeps each remaining witness admissible for the continuation. Figure 1 summarizes how the two passes supply the information used in this final step.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.264cm, inset: 0.2822cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Downward pass: $(a, frac(4, 3) b)$#linebreak() Plus peaks stay fixed.#linebreak()$I_-$ has no plus claims.#linebreak() At stopping, each minus witness#linebreak()claiming outside $I_-$ has#linebreak()$b$-mass $>3"/"4$ at gaps $<q$.]])])
  content((7.164, 0), [#box(width: 6.264cm, inset: 0.2822cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff7f0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Upward pass: $( frac(4, 3) a,b)$#linebreak() Minus peaks stay fixed.#linebreak()$I_+$ has no minus claims.#linebreak() At stopping, each plus witness#linebreak()claiming outside $I_+$ has#linebreak()$a$-mass $>3"/"4$ at gaps $<q$.]])])
  line((3.132, 0), (4.032, 0), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  content((7.164, -2.595), [#text(size: 9pt)[The earlier minus-mass bound persists:#linebreak()every minus gap is nonincreasing.]])
  line((7.164, -1.535), (7.164, -2.135), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  content((3.582, -5.302), [#box(width: 11.06cm, inset: 0.2822cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Provisional call: width $D"/"2$, masses $(a,b)$#linebreak() Every gap $<q$ is a child claim, since $q<D"/"64$.#linebreak()Each remaining witness has mass $>3"/"4$#linebreak()receiving its sign.]]])])
  line((0, -1.535), (0, -2.815), (-1.95, -2.815), (-1.95, -4.235), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((7.164, -3.054), (7.164, -3.204), (9.114, -3.204), (9.114, -4.235), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  content((3.582, -7.447), [#text(size: 9pt)[Multiply masses at matching provisional signs by $4"/"5$,#linebreak()and at opposite signs by $8"/"5$. The witness's total mass becomes $<1$.]])
  line((3.582, -6.369), (3.582, -6.969), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
})],
  caption: [Figure 1: The two passes preserve opposite peaks and force opposite mass inequalities. A remaining witness means one with a claim outside its own override set: $I_(+)$ for plus witnesses and $I_(-)$ for minus witnesses. The upward pass preserves the mass inequality obtained during the downward pass. ],
) <fig:labeling-passes>

=== 3.5 Mass reweighting and completion of the proof <mass-reweighting-and-completion-of-the-proof>

#proof[
  Termination follows from Lemma 9; we prove the labeling guarantee by induction on the same rank. In the mass base case, an index labeled $+$ has $b_i > 1$, so no minus witness can contain that index in its support or claim it. At an index labeled $-$ one has $b_i lt.eq 1$ and $a_i b_i > 1$, hence $a_i > 1$; no plus witness can claim that index. This proves both guarantees.
  In the width base case, Lemma 7 gives $y lt.eq t^(*) lt.eq z$ for all witnesses. A plus claim forces $t_i^(*) gt.eq u_i - P > A_i + D \/ 2$; a minus claim forces $t_i^(*) lt.eq A_i + P < A_i + D \/ 2$. Thus the returned signs are correct.
  For a nonbase call, assume correctness of all its children. Let $Q_(+) = { i : ell_i^0 = + }$ and $Q_(-) = { i : ell_i^0 = - }$ be the provisional sign sets. Consider a plus witness $y$ that has a claim outside $I_(+)$. By Equation (3.17), the set $G_y = { i : g_i^y \( k^f \) < q }$ has $a$-mass greater than $3 \/ 4$. It lies in $S_y$ by Lemma 10. Apply that lemma with width $r = D \/ 2$ to the provisional call. Its plus masses are unchanged, so the translated vector is a plus witness. Since
  $ q = D \/ 128 < D \/ 64 = r \/ 32 \, $
  every index in $G_y$ is a claim of this translated witness. All these indices belong to $Q_(+)$ by the child’s guarantee. Consequently
  #[#set math.equation(numbering: n => "(3.18)")
   $ macron(a) \( S_y \) = 8 / 5 a \( S_y \) - 4 / 5 a \( S_y ∩ Q_(+) \) < 8 / 5 - 4 / 5 dot.op 3 / 4 = 1 . $ <eq:label-plus-survives>]
  The parent vector $y$ is still a subsolution in the unchanged box, so it is a plus witness for the continuation.
  For a minus witness $z$ having a claim outside $I_(-)$, the set $G_z = { i : g_i^z \( k^f \) < q }$ has $b$-mass greater than $3 \/ 4$ by Equation (3.17). It lies in $S_z$. The width-$D \/ 2$ minus translation is a witness for the provisional call because the minus masses are unchanged; every index in $G_z$ is one of its claims, and hence belongs to $Q_(-)$. Therefore
  #[#set math.equation(numbering: n => "(3.19)")
   $ macron(b) \( S_z \) = 8 / 5 b \( S_z \) - 4 / 5 b \( S_z ∩ Q_(-) \) < 8 / 5 - 4 / 5 dot.op 3 / 4 = 1 . $ <eq:label-minus-survives>]
  The same vector $z$ is a minus witness for the continuation.
  It remains to check every claim after the overrides. Let $y$ claim $i$. Lemma 11 gives $i in.not I_(-)$. If $i in I_(+)$, it receives the plus override. If $i in.not I_(+)$, Equation (3.18) applies to $y$, the continuation labels $i$ by $+$, and no override changes it. Now let $z$ claim $i$. Lemma 12 gives $i in.not I_(+)$. If $i in I_(-)$, it receives the minus override. Otherwise Equation (3.19) applies to $z$, and the continuation’s minus label is unchanged. In particular $I_(-) ∩ I_(+)$ contains no claim of either sign, so the stated priority between overrides causes no conflict. This completes the induction. ◻
]

== 4 From labels to an exact decision <sec:application>

We now apply Theorem 6 to a scaled discounted map. The labels need not locate its fixed point directly. Instead, we construct two integer comparison vectors on opposite sides of that point. Their coordinatewise distance is small, so a label excluding one vector from a boundary strip also allows that boundary to move past a smaller strip without excluding either vector. Repeating this operation gives the accuracy required by Theorem 2.

=== 4.1 Two nearby integer comparison vectors <two-nearby-integer-comparison-vectors>

Use the integers $W \, Q \, A_0 \, H$ of Section 2, and set

#[#set math.equation(numbering: n => "(4.1)")
 $ N = 32 H^2 \, #h(2em) lambda = 1 \/ N = lambda_0 \, #h(2em) gamma = 1 - 1 \/ N \,\
K = 256 \( N + 1 \) \, #h(2em) S = 16 H K \, #h(2em) J = S W + N + 1 . $ <eq:application-parameters>]

Let

$ F \( t \) = S f_lambda \( t \/ S \) \, #h(2em) x = S v \( lambda \) . $

Then $F \( x \) = x$, the map $F$ is monotone, and

#[#set math.equation(numbering: n => "(4.2)")
 $ F \( t + c upright(bold(1)) \) = F \( t \) + gamma c upright(bold(1)) #h(2em) \( t in bb(R)^n \, med c in bb(R) \) . $ <eq:application-shift>]

Thus $F$ has the properties used in Section 3. Define the integer vectors

#[#set math.equation(numbering: n => "(4.3)")
 $ Y = floor.l x floor.r - N upright(bold(1)) \, #h(2em) Z = ceil.l x ceil.r + N upright(bold(1)) . $ <eq:comparison-vectors>]

Floors and ceilings are coordinatewise; in particular, a floor of a negative number is taken toward minus infinity. These vectors are used only in the proof. The algorithm will not compute them.

#thm([Lemma 4.1.])[
  #emph[The vectors in (4.3) satisfy 
$ F \( Y \) gt.eq Y \, #h(2em) F \( Z \) lt.eq Z \, #h(2em) Y lt.eq x lt.eq Z \, #h(2em) parallel Y parallel_oo \, parallel Z parallel_oo lt.eq J . $

 For every coordinate $i$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ Z_i - Y_i lt.eq 2 \( N + 1 \) = K \/ 128 . $ <eq:comparison-gap>]

]
] <lem:comparison-vectors>

#proof[
  The inequalities $x - \( N + 1 \) upright(bold(1)) lt.eq Y lt.eq x - N upright(bold(1))$ and $x + N upright(bold(1)) lt.eq Z lt.eq x + \( N + 1 \) upright(bold(1))$, together with $gamma \( N + 1 \) = N - 1 \/ N lt.eq N$, give
  $ F \( Y \) gt.eq x - gamma \( N + 1 \) upright(bold(1)) gt.eq x - N upright(bold(1)) gt.eq Y $
  and
  $ F \( Z \) lt.eq x + gamma \( N + 1 \) upright(bold(1)) lt.eq x + N upright(bold(1)) lt.eq Z . $
  Here we used monotonicity and (4.2). The remaining conclusions follow from these defining bounds and $parallel x parallel_oo lt.eq S W$. ◻
]

=== 4.2 Shrinking the box <shrinking-the-box>

Recall that the permitted widths are $D = h 2^d$ with $128 lt.eq h lt.eq 255$ and integers $d gt.eq 0$. Start with

#[#set math.equation(numbering: n => "(4.5)")
 $ A = - J upright(bold(1)) \, #h(2em) D = D_0 = 128 dot.op 2^(d_0) \, $ <eq:initial-box>]

where $d_0$ is the least nonnegative integer for which $D_0 gt.eq 2 J$. The box $\[ A \, A + D upright(bold(1)) \]$ contains $Y$ and $Z$.

While $D > K$, call $cal(L) \( A \, D \, a \, b \)$ with $a_i = b_i = 1 \/ n$ for all $i$. Put $u = A + D upright(bold(1))$ and $P = D \/ 32$. Within the current box, $Y$ is a subsolution and $Z$ is a supersolution, and their support masses are at most one. Consequently, the labeling guarantee has the following contrapositive form:

#[#set math.equation(numbering: n => "(4.6)")
 $ upright("label ") + upright(" at ") i & quad arrow.r.double quad Z_i > A_i + P \,\
upright("label ") - upright(" at ") i & quad arrow.r.double quad Y_i < u_i - P . $ <eq:label-exclusions>]

For example, $Z_i lt.eq A_i + P$ would be a minus claim and would require a minus label.

Let $D'$ be the next smaller permitted width. More explicitly,

#[#set math.equation(numbering: n => "(4.7)")
 $ D' = cases(delim: "{", \( h - 1 \) 2^d \, & h > 128 \,, 255 dot.op 2^(d - 1) \, & h = 128 .) $ <eq:next-width>]

The second case has $d gt.eq 1$, because the loop condition implies $D > K > 255$. Set $delta = D - D'$. In the first case $delta \/ D = 1 \/ h lt.eq 1 \/ 128$; in the second case this ratio is $1 \/ 256$. Thus

#[#set math.equation(numbering: n => "(4.8)")
 $ 0 < delta lt.eq D \/ 128 \, #h(2em) Z_i - Y_i lt.eq K \/ 128 < D \/ 128 . $ <eq:shrink-slack>]

Define

$ A'_i = cases(delim: "{", A_i + delta \, & upright("if the label is ") + \,, A_i \, & upright("if the label is ") - .) $

Replace $\( A \, D \)$ by $\( A' \, D' \)$.

#thm([Lemma 4.2.])[
  #emph[Every box in this iteration contains $Y$ and $Z$. The iteration makes at most $128 \( d_0 + 1 \)$ calls to $cal(L)$ and ends with $D lt.eq K$.]
] <lem:box-invariant>

#proof[
  The initial containment was established above. At a plus coordinate, (4.6) and (4.8) give
  $ Y_i > Z_i - D \/ 128 > A_i + D \/ 32 - D \/ 128 = A_i + 3 D \/ 128 gt.eq A_i + delta . $
  The lower endpoint can therefore increase by $delta$; the upper endpoint remains unchanged. At a minus coordinate the same inequalities give
  $ Z_i < Y_i + D \/ 128 < u_i - D \/ 32 + D \/ 128 = u_i - 3 D \/ 128 lt.eq u_i - delta . $
  The upper endpoint can decrease by $delta$; the lower endpoint remains unchanged. This proves the induction step for both comparison vectors.
  There are only $128$ permitted mantissas at any exponent, and the exponent never increases. The strictly decreasing sequence of widths therefore has at most $128 \( d_0 + 1 \)$ terms before reaching the stopping range, which contains all permitted widths at exponent zero. ◻
]

At termination, $Y lt.eq x lt.eq Z$ and the invariant imply $A_i lt.eq x_i lt.eq A_i + D$. Hence

#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|A_i / S - v_i \( lambda \)|) lt.eq K / S = frac(1, 16 H) . $ <eq:fixedpoint-error>]

Theorem 2 now gives

#[#set math.equation(numbering: n => "(4.10)")
 $ lr(|A_i / S - "val" \( i \)|) lt.eq frac(1, 8 H) . $ <eq:final-error>]

Output exactly the indices satisfying

#[#set math.equation(numbering: n => "(4.11)")
 $ A_i / S gt.eq - frac(1, 2 H) \, quad upright("equivalently") quad A_i gt.eq - 8 K . $ <eq:output-test>]

If $"val" \( i \) = 0$, (4.10) puts $A_i \/ S$ at least $- 1 \/ \( 8 H \)$, so the index is included. If $"val" \( i \) > 0$, the same conclusion holds. If $"val" \( i \) < 0$, the value gap in Theorem 2 gives $A_i \/ S lt.eq - 1 \/ H + 1 \/ \( 8 H \) = - 7 \/ \( 8 H \)$, so the index is excluded. This proves exact correctness, including equality at zero.

=== 4.3 Bit complexity and uniformity <subsec:bit-complexity>

It remains to show that the potentially large integer widths do not produce a large recursion tree, and that every local computation has polynomial bit cost. The first point uses the mass-product rank of Section 3; the second uses the explicit binary encoding.

Since every vertex has an outgoing edge and the input is explicit, $n \, \| E \| = O \( L + 1 \)$. The binary lengths of the probabilities and rewards give

$ log_2 Q = O \( L + 1 \) \, #h(2em) log_2 W = O \( L + 1 \) \, #h(2em) log_2 A_0 = O \( \( L + 2 \)^2 \) . $

In particular, all integers in (4.1) and (4.5) have $O \( \( L + 2 \)^2 \)$ bits, and $d_0 = O \( \( L + 2 \)^2 \)$. Reading the input and forming these integers by ordinary exact arithmetic take polynomial time. Every recursive box lies in its parent, and every outer box lies in the initial box. Thus all box endpoints, pivot coordinates, and integer arguments to $F$ have polynomial binary length.

For an integer vector $t$, the quantities used to evaluate $F_i \( t \)$ are

#[#set math.equation(numbering: n => "(4.12)")
 $ frac(S w \( e \) + \( N - 1 \) t_j, N) \, #h(2em) e : i arrow.r j . $ <eq:exact-evaluation>]

Max and Min take exact extrema. At a chance vertex write the encoded probability as $p \( e \) = c_e \/ d_e$ with $d_e > 0$. Its weighted sum can be formed with the common denominator $Q N$ and integer numerator

$ sum_(e : i arrow.r j) c_e Q / d_e #scale(x: 120%, y: 120%)[\(] S w \( e \) + \( N - 1 \) t_j #scale(x: 120%, y: 120%)[\)] . $

Every $d_e$ divides $Q$, even when input fractions are not reduced. This formula gives polynomial bit lengths and polynomial bit cost for an evaluation and its coordinatewise floors. Zero probabilities and parallel edges require no special handling.

Consider one outer call, whose initial masses are $a_i = b_i = 1 \/ n$. For a recursive call put

$ mu = min_i a_i b_i \, #h(2em) rho = 32 / 25 \, #h(2em) B \( mu \) = min { j in bb(Z)_(gt.eq 0) : rho^j mu > 1 } . $

The initial value $B_0 = B \( 1 \/ n^2 \)$ is $O \( log \( n + 1 \) \)$; this includes $n = 1$, for which $B_0 = 1$. Every recursive edge decreases $d + B$. Only the provisional-label child can preserve $B$, and it decreases $d$ by one. Each other child decreases $B$ by at least one and does not increase $d$. Thus the depth is at most

$ Lambda = d_0 + B_0 \, $

and any root-to-node path contains at most $B_0$ edges decreasing $B$. At each node there is at most one $B$-preserving child and at most

$ s_(*) = 2 \( 1024 n + 1 \) + 1 = 2048 n + 3 $

other children: the two pivot passes account for the first term and the reweighted call for the final one.

A path of length $ell$ with $j$ edges decreasing $B$ is specified by their $j$ positions and at most $s_(*)$ choices at each such position; the other child, if present, is unique. The total number of nodes is therefore at most

#[#set math.equation(numbering: n => "(4.13)")
 $ sum_(ell = 0)^Lambda sum_(j = 0)^(min \( ell \, B_0 \)) binom(ell, j) s_(*)^j & lt.eq \( Lambda + 1 \) \( B_0 + 1 \) \( 1 + Lambda s_(*) \)^(B_0)\
 & = 2^(O \( \( log_2 \( L + 2 \) \)^2 \)) . $ <eq:tree-bound>]

The distinction between these two kinds of children is essential: the depth may be polynomial in $L$, but branching choices occur only $O \( log \( n + 1 \) \)$ times on any path.

All masses can be stored as unreduced positive fractions. An edge that changes masses multiplies each by one of a fixed set of rational constants, and so increases its numerator and denominator lengths by at most a constant. The other edge leaves masses unchanged. Thus the mass lengths are polynomial (indeed $O \( log \( n + 1 \) \)$), and every comparison, update, and support-independent base test has polynomial bit cost. The algorithm does not compute $B$; it is used only for this analysis.

Outside its children, a nonbase call performs $O \( n + 1 \)$ pivot updates and associated vector operations, all of polynomial bit cost. In a width base case, $d < 12$ gives $D lt.eq 255 dot.op 2^11$, an absolute constant, so the clipped-floor iteration uses at most $1 + n D$ polynomial-cost evaluations. The mass base case is also polynomial. Consequently (4.13) bounds the bit cost of one outer call up to a polynomial factor. Lemma 14 bounds the number of outer calls by a polynomial as well.

Finally, all loops, tie rules, integer operations, and recursive calls are specified by finite algorithms independent of the input. A depth-first implementation stores a stack of polynomial depth whose individual records have polynomial length. Scanning such a stack or copying a record on a deterministic Turing machine costs at most a polynomial factor per local operation. The final integer tests (4.11) and the output take polynomial time. Absorbing these factors into (4.13) proves the bound $2^(C \( log_2 \( L + 2 \) \)^2)$ for one absolute constant $C$. This completes the proof of Theorem 1.


#bibliography("refs.bib", style: "ieee", title: [References])
