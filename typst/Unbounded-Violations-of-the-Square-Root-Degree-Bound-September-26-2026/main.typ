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

#align(center)[#text(size: 16pt, weight: "bold")[Unbounded Violations of the Square-Root Degree Bound]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

The sum of the linear Fourier coefficients of a Boolean function measures its correlation with the sum of its
  inputs. For a real-valued function $f : { - 1 \, 1 }^n arrow.r bb(R)$, with $X$ uniform on the sign cube, write

$ hat(f) \( S \) = bb(E) #h(-0.16667em) [f \( X \) product_(i in S) X_i] \, wide deg \( f \) = max { \| S \| :
  hat(f) \( S \) eq.not 0 } . $

Constants have degree zero. This is the degree of the real multilinear polynomial representing $f$,
  as in the work of Nisan and Szegedy [6]. For Boolean $f$, taking values in ${ - 1 \, 1 }$, Cauchy–Schwarz gives

$ sum_(i = 1)^n hat(f) \( { i } \) = bb(E) #h(-0.16667em) [f \( X \) sum_(i = 1)^n X_i] lt.eq sqrt(n) . $

Gopalan and Servedio conjectured that $sqrt(deg \( f \))$ could replace $sqrt(n)$;
  see O’Donnell’s problem list [7] p. 9. We show that no constant multiple of this proposed bound holds.

#thm([Theorem 1.1.])[
  #emph[For every real $C > 0$, there are a positive integer $n$ and a nonconstant Boolean function $f : { - 1 \,
    1 }^n arrow.r { - 1 \, 1 }$ such that
$ sum_(i = 1)^n hat(f) \( { i } \) > C sqrt(deg \( f \)) . $

 Consequently,
$ sup_(n gt.eq 1 \, med f : { - 1 \, 1 }^n arrow.r { - 1 \, 1 }\
deg \( f \) > 0) frac(sum_i \| hat(f) \( { i } \) \|, sqrt(deg \( f \))) = oo . $

]
] <thm:main>

The universal signed and absolute versions of the conjecture are equivalent.
  Indeed, the coordinate change $x_i mapsto "sign" \( hat(f) \( { i } \) \) x_i$, with sign $+ 1$ at zero,
  preserves degree and makes every linear coefficient nonnegative.
  Our construction produces a large signed sum directly. The dimension and all copy counts in the construction are
  finite; we do not obtain useful bounds on their growth.

=== The square-root and majority bounds <the-square-root-and-majority-bounds>

The conjecture is attributed to Gopalan and Servedio, circa 2009, in O’Donnell’s problem list.
  It also appears as Conjecture 3.17 in the preprint of Filmus, Hatami, Keller and Lifshitz [3].
  Here the singleton coefficients are summed linearly, rather than squared.

A sharper proposal in the same problem list uses the majority benchmark

$ B_d = bb(E) \| X_1 + dots.h.c + X_d \| lt.eq sqrt(d) . $

This is the signed singleton sum of majority on $d$ bits, with either fixed value at ties.
  Replacing $sqrt(deg \( f \))$ by $B_(deg \( f \))$ gives a stronger inequality,
  so a counterexample to that inequality need not violate the square-root bound.
  Jha [4] Theorem 2.1 gave discrete-derivative reformulations of the majority proposal.
  Wang [9] Theorems 2.2, 3.2 and 3.6 gave another equivalent formulation and proved the cases $d = 1$ and $d = n -
  1$. Kudin and Pašalić [5] proved the cases $d = 2 \, 3$ and refuted the majority bound at $d = 4$.
  Theorem 1 excludes every constant multiple of the weaker square-root bound.
  Stating both inequalities explicitly distinguishes the questions despite the different names used for them in
  the literature.

A linear degree bound does hold for every Boolean function.
  Let $"Inf"_i \( f \)$ be the probability that flipping coordinate $i$ changes its value, and let $I \( f \) =
  sum_i "Inf"_i \( f \)$ be the total influence. The discrete derivative in coordinate $i$,
  defined as half the difference between the values with that coordinate set to $+ 1$ and $- 1$,
  takes values in ${ - 1 \, 0 \, 1 }$. Its mean is $hat(f) \( { i } \)$,
  so the absolute value of this mean is at most its second moment, $"Inf"_i \( f \)$.
  The Fourier formula for total influence and Parseval’s identity therefore give [6] Lemma 2.4 and Corollary 2.5

$ sum_i \| hat(f) \( { i } \) \| lt.eq I \( f \) = sum_(S subset.eq \[ n \]) \| S \| hat(f) \( S \)^2 lt.eq
  deg \( f \) . $

Theorem 1 thus separates the conjectured square-root scale from this surviving linear bound.

=== Retaining variance with low-degree observations <retaining-variance-with-low-degree-observations>

Instead of constructing $f$ immediately, we first construct a finite-valued observation $F$ of independent signs.
  If $H_N = X_1 + dots.h.c + X_N$, the information that $F$ retains about this sum is measured by

$ T_F = bb(E) \[ H_N divides F \] \, wide v \( F \) = bb(E) T_F^2 . $

We call $T_F$ the #emph[score] of $F$ and $v \( F \)$ its retained variance.
  When $v \( F \) > 0$, its standardized score is $T_F \/ sqrt(v \( F \))$.
  We call a positive real number $D$ a #emph[cell degree bound] if every output indicator
  $upright(bold(1))_({ F = a })$ has degree at most $D$. Every function of $F$ then has degree at most $D$,
  including $f = "sign" \( T_F \)$. This readout has correlation $bb(E) \[ f H_N \] = bb(E) \| T_F \|$.
  Averaging independent copies makes its score approximately Gaussian,
  so a large ratio $v \( F \) \/ D$ gives the theorem.

Conditional coordinate sums also appear in decision-tree inequalities.
  A subcube is obtained by fixing some coordinates. If the cells of $F$ are subcubes,
  the unfixed coordinates remain independent uniform signs under conditioning,
  so $v \( F \)$ equals the expected number of fixed coordinates.
  O’Donnell and Servedio [8] Theorem 3 and Lemma 3 bound the signed singleton sum of a Boolean readout by the
  square root of this expectation. Blais, Tan and Wan [1] Lemma 3.1 and Theorem 1 use the conditional coordinate
  sum to prove square-root bounds in parity decision-tree depth,
  where a query reveals the product of a specified set of inputs. Our cells need not be subcubes:
  their indicators are controlled by polynomial degree, and cancellation allows retained variance to exceed that
  degree cost.

The main construction repeatedly increases this ratio. Revealing $m$ independent standardized scores retains
  variance $m$. We use $m + 1$ scores and design an observation retaining strictly more than $m$ units of
  variance, although each output indicator is a linear combination of functions of at most $m$ inputs.
  Such an indicator may depend on all $m + 1$ inputs: the degree saving comes from cancellation,
  not from ignoring a fixed coordinate.

Here is the reporting rule behind the gain. One score selects a leaf among the remaining $m$ scores,
  each of which has a short prescribed interval. Usually we report all but one score.
  On the exceptional event that only the selected leaf misses its interval, we report a single tag.
  The intervals are chosen so that the sum of all the scores can be predicted on this event with mean squared
  error less than one. Every other report has residual error exactly one.
  Thus the exceptional tag improves on the variance retained by revealing $m$ scores.
  Its indicator admits the required cancellation identity.

Section 2 proves the finite-observation calculus and amplification criterion.
  Section 3 then explains the reports and their prediction error before choosing the Gaussian intervals.
  Once that choice is fixed, the central limit theorem supplies a sufficiently large finite average at each step.
  A finite number of steps gives any prescribed ratio, and a final sign readout proves the theorem.
  Thus Sections 2 and 3 contain a complete proof of Theorem 1.

The further constructions distinguish which features of this rule are needed for a gain.
  In Section 4, the #emph[coarse report] shows that the all-leaves-pass values can also be replaced by one tag;
  switching to an extra independent score isolates the conditional-variance saving on the exceptional event.
  Section 5 allows different degree costs for different outputs:
  retained variance need only exceed their #emph[average] cost.
  Reporting typical words of outputs and merging the remaining words into one cell then gives a degree bound valid
  everywhere while retaining almost all the variance. Appendix 6 supplies an independent Gaussian event for the
  average-cost criterion. Appendix 7 gives a different Gaussian parameter schedule for the coarse report,
  together with the transfer argument for its law-dependent coefficients.

== 2 Finite observations and amplification <sec:observations>

We first justify the degree and conditioning identities used by every construction.
  Throughout, $F$ is a finite-valued observation, $T_F = bb(E) \[ H_N divides F \]$ is its centered score,
  and $D > 0$ is a cell degree bound. The bound $D$ may be real;
  it need not equal the actual integer degree of any indicator.

Every real function of $F$ has degree at most $D$, by expansion in its finitely many value indicators.
  Unused labels have zero indicators. If distinct observation labels produce the same numerical score,
  their indicators add, so score collisions preserve the same bound.
  A function of $r$ observations on disjoint blocks, with bounds $D_1 \, dots.h \, D_r$,
  has degree at most $sum_i D_i$. Indeed, it expands in products of their indicators,
  and the degree of a product is at most the sum of the degrees:
  multiplication of Fourier characters takes symmetric differences of their index sets.

Let $F_1 \, dots.h \, F_r$ be independent observations on disjoint bit blocks, with scores $T_1 \, dots.h \, T_r$,
  and let $H_(upright("tot"))$ be the total bit sum. Conditioning on their tuple gives
  $bb(E) \[ H_(upright("tot")) divides F_1 \, dots.h \, F_r \] = sum_i T_i$.
  For any observation $Q$ that is a function of this tuple, the tower property therefore gives

$ bb(E) \[ H_(upright("tot")) divides Q \] = bb(E) #h(-0.16667em) [sum_i T_i thin mid(bar.v) thin Q] . $

These are instances of the conditional-expectation projection identities; see [2] Theorems 4.1.13 and 4.1.15.
  In particular, for $v = v \( F \) > 0$, the numerical observation

#[#set math.equation(numbering: n => "(1)")
 $ Z_M = frac(T_1 + dots.h.c + T_M, sqrt(M v)) $ <eq:averaging>]

formed from $M$ independent copies has cell degree bound $M D$, and its score is exactly $sqrt(M v) thin Z_M$.
  The classical i.i.d. central limit theorem [2] Theorem 3.4.1 gives $Z_M arrow.r.double G$,
  where $G$ is standard normal. For each fixed initial $F$, all moments are finite, and

#[#set math.equation(numbering: n => "(2)")
 $ bb(E) Z_M^4 = frac(bb(E) T_F^4, M v^2) + 3 frac(M - 1, M) . $ <eq:fourth>]

Thus the fourth moments are bounded uniformly in $M$ for this fixed observation.
  The bound may change when a later amplification stage uses a different observation.
  All citations to probability results refer to the January 11, 2019 author version of Durrett [2].

#thm([Lemma 2.1.])[
  (Transfer of predictor errors).  #emph[Let $Z_j$ be centered,
    variance-one random variables converging in distribution to a standard normal, with $sup_j bb(E) Z_j^4 < oo$.
    For fixed $r$, let $upright(bold(Z))_j$ consist of $r$ independent copies of $Z_j$,
    and let $upright(bold(G))$ consist of $r$ independent standard normals.
    If $g : bb(R)^r arrow.r bb(R)$ is measurable, its discontinuities have Gaussian measure zero, and
$ \| g \( z \) \| lt.eq K (1 + sum_(i = 1)^r z_i^2) $

 for some fixed $K$, then $bb(E) g \( upright(bold(Z))_j \) arrow.r bb(E) g \( upright(bold(G)) \)$.]
] <lem:transfer>

#proof[
  Independence gives joint weak convergence. Clipping $g$ to a bounded range gives convergence of expectations by
    the null-discontinuity criterion for weak convergence [2] Theorem 3.10.1(vi).
    The fourth-moment bound and fixed $r$ give $sup_j bb(E) \[ g \( upright(bold(Z))_j \)^2 \] < oo$,
    so the clipping errors in first moment tend to zero uniformly;
    this is the higher-moment criterion for uniform integrability [2] Theorem 4.6.2. The Gaussian error does also. ◻
]

#thm([Lemma 2.2.])[
  (Boolean readout).  #emph[Suppose finite observations have positive cell degree bounds $D$ and arbitrarily large
    ratios $v \( F \) \/ D$. Then Theorem 1 holds.]
] <lem:readout>

#proof[
  Fix $C > 0$ and choose $F$ with $v \( F \) > 4 C^2 D$. For $M$ independent copies, define $f =
    "sign" \( T_1 + dots.h.c + T_M \)$, with sign $1$ at zero. Its degree is at most $M D$.
    Conditioning on the tuple of observations,
  $ sum_i hat(f) \( { i } \) = bb(E) \[ f H_(M N) \] = bb(E) \| T_1 + dots.h.c + T_M \| =
    sqrt(M v \( F \)) thin bb(E) \| Z_M \| . $
  The central limit theorem and the uniform second-moment bound imply $bb(E) \| Z_M \| arrow.r bb(E) \| G \| =
    sqrt(2 \/ pi) > 1 \/ 2$. For a sufficiently large finite $M$, the displayed sum exceeds $C sqrt(M D) gt.eq
    C sqrt(deg \( f \))$. It is positive, so $f$ is nonconstant. ◻
]

#thm([Proposition 2.3.])[
  (Amplification criterion).  #emph[Let $1 lt.eq d < r$ be integers,
    and let $cal(W)$ be a measurable observation rule on $r$ real inputs. Suppose:]
  + #emph[On any product of finite input alphabets, the indicator of each output value is a finite linear
    combination of functions each depending on at most $d$ input coordinates.]
  + #emph[There is an $eta > 0$ such that, whenever centered variance-one laws $Z_j$ converge weakly to a standard
    normal with uniformly bounded fourth moments, independent copies satisfy, for all sufficiently large $j$,
$ "Var" #h(-0.16667em) (bb(E) #h(-0.16667em)
  [sum_(i = 1)^r Z_(j \, i) thin mid(bar.v) thin cal(W) \( upright(bold(Z))_j \)]) gt.eq d + eta . $

]
  #emph[Then finite observations have arbitrarily large retained variance-to-cell-degree ratios, and Theorem 1 follows.]
] <prop:amplification>

#proof[
  Fix a finite observation $F$ with $v = v \( F \) > 0$ and degree bound $D > 0$.
    Form $r$ independent blocks of $M$ copies of $F$, and apply $cal(W)$ to their normalized scores from (1).
    The new observation $F'$ has finite range. Its cell degree is at most $d M
    D$ by the first assumption and expansion in value indicators. The second assumption applies by (2).
    For a sufficiently large finite $M$, the tower property therefore gives
  $ v \( F' \) = M v thin "Var" #h(-0.16667em) (bb(E) #h(-0.16667em) [sum_(i = 1)^r Z_(M \, i) divides F']) gt.eq
    M v \( d + eta \) . $
  The ratio increases by at least the fixed factor $1 + eta \/ d > 1$.
    Start with the observation of one sign, for which $v = D = 1$, and iterate.
    Each stage is finite and has its own sufficiently large finite copy count.
    A finite number of stages exceeds any prescribed ratio. Apply Lemma 3. ◻
]

== 3 Retaining more variance than the degree cost <sec:observation>

We now construct the observation rule needed for amplification.
  Revealing any fixed set of $m$ of $m + 1$ independent centered variance-one inputs retains variance $m$ from
  their sum: the unobserved input accounts for the remaining unit.
  Our rule will retain strictly more than $m$, while every output indicator is a linear combination of functions
  of at most $m$ inputs. These are the two conclusions required by Proposition 4, with $r = m + 1$ and $d = m$.

The rule usually leaves one input unobserved. On one specially chosen event,
  it instead reports only that the event occurred. This improves the prediction error if the sum of all the inputs
  is sufficiently close to one fixed number on that event. We first describe the rule and calculate its error for
  arbitrary independent inputs. We will then choose its parameters using Gaussian inputs.

=== 3.1 A reporting rule and its prediction error <a-reporting-rule-and-its-prediction-error>

Let $m gt.eq 3$, let $I_1 \, dots.h \, I_m$ be intervals, and let $iota : bb(R) arrow.r { 1 \, dots.h \,
  m }$ be a selector with finitely many cut points. All endpoint and tie conventions are part of the rule.
  Write its inputs as $\( u \, z_1 \, dots.h \, z_m \)$ and their sum as $L = u + sum_(j = 1)^m z_j$.
  The coordinate $u$ selects the leaf $z_(iota \( u \))$. Define

$ B = { z_j in I_j upright(" for every ") j } \, wide P =
  { z_j in I_j upright(" for every ") j eq.not iota \( u \) } \, wide A = P \\ B . $

Thus $A$ is the event that the selected leaf alone fails its interval test.
  Since $B subset.eq P$, the sets $A$, $B$, and $P^c$ partition the input space.
  Define the tagged observation $cal(W)$ by

$ upright("Event") & upright("Information reported")\
A & upright("the tag ") A upright(" only")\
B & \( B \, z_1 \, dots.h \, z_m \)\
P^c & \( P^c \, u \, iota \( u \) \, \( z_j \)_(j eq.not iota \( u \)) \) . $

On $B$, the central input is omitted. On $P^c$, the selected leaf is omitted.
  Although the exceptional report on $A$ can depend on all $m + 1$ inputs, its indicator has the pointwise identity

#[#set math.equation(numbering: n => "(3)")
 $ upright(bold(1))_A = sum_(i = 1)^m upright(bold(1))_({ iota \( u \) = i }) product_(j eq.not i)
   upright(bold(1))_(I_j) \( z_j \) - product_(j = 1)^m upright(bold(1))_(I_j) \( z_j \) . $ <eq:indicator>]

Each summand uses only $m$ coordinates. This cancellation is what allows the exceptional report to have the same
  degree cost as the ordinary reports.

#thm([Lemma 3.1.])[
  #emph[For every product of finite input alphabets, the rule $cal(W)$ has finite range,
    and each output indicator is a finite linear combination of functions of at most $m$ input coordinates.]
  #emph[For independent centered variance-one inputs, whose marginal laws need not agree,
    and every fixed $b in bb(R)$, put
$ Delta_b = bb(E) \[ upright(bold(1))_A \( 1 - \( L - b \)^2 \) \] . $

 Then
#[#set math.equation(numbering: n => "(4)")
 $ "Var" \( bb(E) \[ L divides cal(W) \] \) gt.eq m + Delta_b . $ <eq:retained>]

]
] <lem:report>

#proof[
  Identity (3) gives the required decomposition for the $A$ report.
    An attained $B$ report fixes the $m$ leaf values and imposes no condition on $u$.
    An attained $P^c$ report fixes $u$, its selected index $i$, and the $m - 1$ unselected leaves.
    At least one of these reported leaves fails its test; hence the reported values already force $P^c$,
    whatever the omitted value $z_i$ may be. Its indicator therefore depends on only the $m$ reported coordinates.
    Unused output labels have zero indicators. This proves the first assertion on every input,
    including interval endpoints.
  To estimate the retained variance, predict $L$ by $b$ on $A$, by $sum_j z_j$ on $B$, and by $u +
    sum_(j eq.not iota \( u \)) z_j$ on $P^c$. This predictor is a function of the reported information.
    On $B$ its error is $u$; independence gives $bb(E) \[ upright(bold(1))_B u^2 \] = bb(P) \( B \)$.
    For the last type of report, fix an index $i$ and let $E_i = P^c ∩ { iota \( u \) = i }$.
    This event and its reported data depend only on $u$ and the leaves other than $z_i$. Consequently
  $ bb(E) \[ upright(bold(1))_(E_i) z_i \] = 0 \, wide bb(E) \[ upright(bold(1))_(E_i) z_i^2 \] = bb(P) \( E_i \) . $
  Summing the squared errors over the three types of report gives
  $ bb(P) \( A^c \) + bb(E) \[ upright(bold(1))_A \( L - b \)^2 \] = 1 - Delta_b . $
  Conditional expectation has no larger mean squared error [2] Theorems 4.1.13 and 4.1.15.
    Since $L$ is centered and $"Var" \( L \) = m + 1$, the conditional-variance identity gives (4). ◻
]

The remaining task is now precise: choose the intervals, selector,
  and constant $b$ so that $Delta_b > 0$ for Gaussian inputs.
  A strict positive margin will survive the normal approximation used in amplification.
  The next calculation produces that margin by subtracting the contribution of $B$ from that of $P$ in (3).

=== 3.2 Choosing the intervals in the Gaussian model <choosing-the-intervals-in-the-gaussian-model>

We will obtain a positive predictor deficit and also record the conditional variance on $A$.
  The latter describes the event’s gain without specifying a predictor:
  on $A$, the sum varies less than one unobserved variance-one input.

#thm([Lemma 3.2.])[
  #emph[There are a finite odd integer $m gt.eq 3$, closed intervals $I_1 \, dots.h \, I_m$,
    and a selector $iota$ with finitely many cut points such that the following holds for independent standard
    normal inputs. Let $beta_j$ be the probability of $I_j$, and let $mu_j \,
    s_j^2$ be the conditional mean and variance on $I_j$. Define
$ p_(*) = product_(j = 1)^m beta_j \, wide S = sum_(j = 1)^m s_j^2 \, wide b = sum_(j = 1)^m mu_j - 1 . $

 Then $p_(*) > 0$, $S < 1 \/ 4$, and
#[#set math.equation(numbering: n => "(5)")
 $ d_A := bb(E) \[ upright(bold(1))_A \( 1 - \( L - b \)^2 \) \] > 3 / 4 p_(*) . $ <eq:deficit>]

 The boundary of $A$ lies in a finite union of coordinate hyperplanes.
   In particular, $bb(P) \( A \) > 0$ and $"Var" \( L divides A \) < 1$.]
] <lem:gaussian>

#proof[
  The shift by one in $b$ determines where to place the intervals.
    Conditional on $u = t$ and $P$, the mean of $L - b$ is $1 + t - mu_(iota \( t \))$,
    so selecting an interval near $1 + t$ makes this mean small.
    Conditional on $B$ alone, with $u$ still random, its mean is instead one.
    Subtracting the contribution of $B$ will turn that fixed squared mean into the positive term in $d_A$.
  We let odd $m$ tend to infinity to choose the parameters, and then fix one finite value. Set
  $ R = sqrt(8 log m) \, wide h = m^(- 3 \/ 2) \, wide a_i = 1 - R + frac(2 R \( i - 1 \), m - 1) \, wide
    I_i = \[ a_i - h \, a_i + h \] . $
  For $\| t \| lt.eq R$, select a center $a_(iota \( t \))$ nearest to $1 + t$,
    resolving ties by the smaller index. For $\| t \| > R$, use the middle index, whose center is $1$.
    These choices define the rule on the whole real line. Its finitely many interval endpoints and selector cut
    points also give the asserted boundary property.
  Write $phi.alt \( t \) = \( 2 pi \)^(- 1 \/ 2) e^(- t^2 \/ 2)$. Every $beta_i$ lies in $\( 0 \, 1 \)$.
    Condition first on $u = t$ and put $i = iota \( t \)$. The event $P$ then has probability $p_(*) \/ beta_i$;
    it restricts the leaves $j eq.not i$ to their intervals and leaves $z_i$ unrestricted.
    Under this conditioning, $L - b$ has mean $1 + t - mu_i$ and variance $1 + sum_(j eq.not i) s_j^2$. Thus
  $ bb(E) \[ upright(bold(1))_P \( 1 - \( L - b \)^2 \) \] = - p_(*) J \, wide J =
    integral_(bb(R)) (\( 1 + t - mu_(iota \( t \)) \)^2 + sum_(j eq.not iota \( t \)) s_j^2)
    frac(phi.alt \( t \), beta_(iota \( t \))) thin d t . $
  On $B$, with $u$ again random, $L - b$ has mean $1$ and variance $1 + S$. Therefore
  $ bb(E) \[ upright(bold(1))_B \( 1 - \( L - b \)^2 \) \] = - p_(*) \( 1 + S \) . $
  Since $upright(bold(1))_A = upright(bold(1))_P - upright(bold(1))_B$, we obtain the exact identity
  #[#set math.equation(numbering: n => "(6)")
   $ d_A = p_(*) \( 1 + S - J \) . $ <eq:gaussian-identity>]
  The positive constant $1$ comes from the mean of $L - b$ on $B$.
    It remains to make the nonnegative error $J$ small. Nearest-center selection controls its central part;
    the fallback to the middle interval controls the tails.
  The elementary interval estimates are
  $ \| mu_i - a_i \| lt.eq h \, wide s_i^2 lt.eq h^2 \, wide beta_i gt.eq
    2 h \( 2 pi \)^(- 1 \/ 2) exp #h(-0.16667em) (- frac(\( \| a_i \| + h \)^2, 2)) . $
  For $\| t \| lt.eq R$, the grid spacing and the selector give
  $ \| 1 + t - mu_(iota \( t \)) \| lt.eq frac(R, m - 1) + h \, wide \| a_(iota \( t \)) \| + h lt.eq \| t \| + 2 $
  when $m$ is sufficiently large. Hence $phi.alt \( t \) \/ beta_(iota \( t \)) lt.eq \( e^2 \/ 2 h \)
    e^(2 R)$ on this range, and
  $ J_(upright("central")) & lt.eq frac(e^2 R, h) e^(2 R) ((frac(R, m - 1) + h)^2 + m h^2)\
 & = O #h(-0.16667em) (R \( R^2 + 1 \) e^(2 R) m^(- 1 \/ 2)) = o \( 1 \) . $
  Here $e^(2 R) = m^(o \( 1 \))$, while $R$ is a power of $log m$.
  On $\| t \| > R$, the selected interval is centered at $1$.
    For $h lt.eq 1$ its probability is at least $2 h phi.alt \( 2 \)$,
    and the numerator in $J$ is $O \( 1 + t^2 \)$. Integration by parts gives
  $ integral_(\| t \| > R) \( 1 + t^2 \) phi.alt \( t \) thin d t = O \( \( R + 1 \) e^(- R^2 \/ 2) \) . $
  Consequently
  $ J_(upright("tail")) = O \( h^(- 1) \( R + 1 \) e^(- R^2 \/ 2) \) = O \( \( R + 1 \) m^(- 5 \/ 2) \) = o \( 1 \) . $
  Also $S lt.eq m h^2 = m^(- 2) arrow.r 0$. Fix a sufficiently large finite odd $m$ so that $J < 1 \/ 4$ and $S <
    1 \/ 4$. Identity (6) now proves (5), with $p_(*) > 0$.
  Finally, write $p_A = bb(P) \( A \)$. Since $d_A > 0$, we have $p_A > 0$, and
  $ d_A = p_A #scale(x: 120%, y: 120%)[\(] 1 - "Var" \( L divides A \) - \( bb(E) \[ L divides A \] - b \)^2
    #scale(x: 120%, y: 120%)[\)] > 0 . $
  This also proves $"Var" \( L divides A \) < 1$. ◻
]

=== 3.3 Transfer to finite inputs and amplification <transfer-to-finite-inputs-and-amplification>

Fix all the Gaussian choices from Lemma 6, including $m$, the intervals, the selector, $b$, and $p_(*) > 0$.
  Set $eta = p_(*) \/ 2$. If centered variance-one laws $Z_n$ converge weakly to a standard normal and have
  uniformly bounded fourth moments, apply Lemma 2 to the fixed function

$ g \( u \, z_1 \, dots.h \, z_m \) = upright(bold(1))_A \( 1 - \( L - b \)^2 \) . $

It has quadratic growth and discontinuities only on the finitely many hyperplanes from Lemma 6;
  these have Gaussian measure zero. For independent copies of $Z_n$, therefore, $bb(E) g arrow.r
  d_A > 3 p_(*) \/ 4$, and eventually $bb(E) g > eta$. Lemma 5 then gives

$ "Var" #h(-0.16667em) (bb(E) #h(-0.16667em)
  [sum_(i = 1)^(m + 1) Z_(n \, i) thin mid(bar.v) thin cal(W) \( upright(bold(Z))_n \)]) > m + eta . $

Together with the pointwise output-indicator decomposition in that lemma,
  this verifies both hypotheses of Proposition 4 with $\( r \, d \, eta \) = \( m + 1 \, m \, p_(*) \/ 2 \)$.

The Gaussian parameters and $eta$ remain fixed throughout the iteration.
  Proposition 4 therefore increases the ratio of retained variance to cell degree bound by at least $1 +
  eta \/ m > 1$ at each stage, using a sufficiently large finite copy count chosen for the current observation.
  Starting from one revealed sign, finitely many stages make this ratio exceed $4 C^2$ for any prescribed $C > 0$.
  Lemma 3 then supplies a nonconstant Boolean function with signed singleton sum greater than $C
  sqrt(deg \( f \))$, proving Theorem 1.

== 4 Two other reporting rules <sec:alternatives>

The report in Section 3, which we call the #emph[refined report],
  keeps every leaf value when all the leaves pass their tests.
  We now ask what happens if that information is replaced by one mark.
  The resulting loss can be computed exactly and is smaller than the Gaussian gain.
  A second rule uses one additional independent input: it reveals the original inputs off the exceptional event
  and the extra input on that event. The first modification shows that the all-pass leaf values are dispensable;
  the second isolates the conditional-variance saving on the exceptional event.

=== 4.1 Merging the all-leaves-pass reports <subsec:coarse-mark>

Start with any integer $m gt.eq 3$, intervals $I_1 \, dots.h \, I_m$, and a selector $iota : bb(R) arrow.r { 1 \,
  dots.h \, m }$ with finitely many cut points. Fix all endpoint and tie conventions.
  As before, on inputs $\( u \, z_1 \, dots.h \, z_m \)$ put

$ L = u + sum_(j = 1)^m z_j \, wide B = { z_j in I_j upright(" for every ") j } \, $

$ P = { z_j in I_j upright(" for ") j eq.not iota \( u \) } \, wide A = P \\ B . $

Define the #emph[coarse report] $cal(O)$ by

$ upright("Event") & upright("Information reported")\
A & upright("the mark ") X\
B & upright("the mark ") Y\
P^c & \( O \, u \, iota \( u \) \, \( z_j \)_(j eq.not iota \( u \)) \) . $

The marks $X \, Y$ and the ordinary-report tag $O$ are distinct.
  The rule differs from the refined report only on $B$. The next lemma separates its pointwise cost from the
  choice of an input law, so that other interval constructions can use the same reporting rule.

#thm([Lemma 4.1.])[
  (Cost and error of the coarse report).  #emph[On every product of finite input alphabets,
    $cal(O)$ has finite range, and each output indicator is a finite linear combination of functions of at most
    $m$ input coordinates.]
  #emph[Let the inputs be independent, centered, and of variance one; their marginal laws need not agree.
    For any fixed constants $b_0 \, b_1 in bb(R)$, define
#[#set math.equation(numbering: n => "(7)")
 $ g_(b_0 \, b_1) = upright(bold(1))_A #scale(x: 120%, y: 120%)[\(] 1 - \( L - b_0 \)^2
   #scale(x: 120%, y: 120%)[\)] + upright(bold(1))_B #scale(x: 120%, y: 120%)[\(] 1 - \( L - b_1 \)^2
   #scale(x: 120%, y: 120%)[\)] . $ <eq:coarse-deficit>]

 Then the optimal residual error $cal(R) = bb(E) \[ \( L - bb(E) \[ L divides cal(O) \] \)^2 \]$ satisfies
#[#set math.equation(numbering: n => "(8)")
 $ 1 - cal(R) gt.eq bb(E) g_(b_0 \, b_1) \, wide "Var" \( bb(E) \[ L divides cal(O) \] \) gt.eq m +
   bb(E) g_(b_0 \, b_1) . $ <eq:coarse-residual>]

]
] <lem:coarse-report>

#proof[
  The $X$ indicator has the pointwise expansion (3). The $Y$ indicator depends only on the $m$ leaves.
    An ordinary output specifies $u$, its selected index $i$, and the $m - 1$ unselected leaf values.
    If these data are attained, one of the reported leaves fails its interval test.
    They therefore force $P^c$ for every value of the omitted leaf $z_i$,
    so the indicator uses just the $m$ reported inputs. An inconsistent or unattained output label has zero
    indicator. Thus the assertion holds pointwise, including endpoints and selector ties.
  Predict $L$ by $b_0$ on $X$, by $b_1$ on $Y$, and by $u +
    sum_(j eq.not iota \( u \)) z_j$ on an ordinary report. For each fixed $i$, the event $E_i =
    P^c ∩ { iota \( u \) = i }$ and all its reported data depend only on $u$ and the leaves other than $z_i$.
    Independence gives
  $ bb(E) \[ upright(bold(1))_(E_i) z_i \] = 0 \, wide bb(E) \[ upright(bold(1))_(E_i) z_i^2 \] = bb(P) \( E_i \) . $
  The ordinary reports consequently contribute exactly $bb(P) \( P^c \)$ to the squared prediction error.
    The total error of this predictor is
  $ bb(P) \( P^c \) + bb(E) \[ upright(bold(1))_A \( L - b_0 \)^2 \] +
    bb(E) \[ upright(bold(1))_B \( L - b_1 \)^2 \] = 1 - bb(E) g_(b_0 \, b_1) . $
  Conditional expectation minimizes squared error, proving the first inequality in (8).
    The second follows because $L$ is centered with variance $m + 1$. ◻
]

Now fix the Gaussian intervals and selector from Lemma 6. Write

$ M_mu = sum_(j = 1)^m mu_j \, wide b = M_mu - 1 \, wide p_(*) = bb(P) \( B \) > 0 \, wide S = sum_(j = 1)^m s_j^2 . $

The Gaussian calculation gave $d_A = bb(E) \[ upright(bold(1))_A \( 1 - \( L - b \)^2 \) \] =
  p_(*) \( 1 + S - J \)$ with $J < 1 \/ 4$. In Lemma 7 take $b_0 = b$ and $b_1 = M_mu$.
  On $B$, the central Gaussian remains unrestricted and the leaves are independently restricted to their
  intervals. Thus $L - M_mu$ has conditional mean zero and variance $1 + S$, giving

#[#set math.equation(numbering: n => "(9)")
 $ bb(E) g_(b \, M_mu) = d_A - p_(*) S = p_(*) \( 1 - J \) > 3 / 4 p_(*) . $ <eq:coarse-gaussian-gain>]

The term $p_(*) S$ is precisely the added error on $B$: the refined predictor had error $u$ there,
  while merging its reports leaves the conditional leaf variance $S$ unobserved.
  Equation (9) is an identity for this predictor’s gain; (8) is the resulting lower bound for optimal retained variance.

All these Gaussian choices are now fixed. Let centered variance-one laws $Z_n$ converge weakly to a standard
  normal with uniformly bounded fourth moments, and take $m + 1$ independent copies as inputs.
  The fixed function $g_(b \, M_mu)$ has quadratic growth; its discontinuities lie on the finitely many interval
  and selector hyperplanes. Lemma 2 and (9) imply that eventually $bb(E) g_(b \, M_mu) > eta$, where $eta =
  p_(*) \/ 2 > 0$. Lemma 7 then gives retained variance greater than $m +
  eta$ and the required pointwise cell cost. Therefore Proposition 4 applies with

$ \( r \, d \, eta \) = \( m + 1 \, m \, p_(*) \/ 2 \) . $

This criterion and Lemma 3 give Theorem 1 by the coarse rule as well.

=== 4.2 Switching to an independent score <subsec:extra-block>

Keep the fixed Gaussian event $A$ and predictor $b$ above, and put $q = m + 1$.
  Add one independent centered variance-one input $w$ to the original tuple
  $upright(bold(z)) = \( u \, z_1 \, dots.h \, z_m \)$. Define

$ cal(O)_(+) \( upright(bold(z)) \, w \) =
  cases(delim: "{", \( upright("off") \, upright(bold(z)) \) \, & upright(bold(z)) in.not A \,, \(
  upright("on") \, w \) \, & upright(bold(z)) in A .) $

Off $A$ the original sum $L$ is known and $w$ is omitted.
  On $A$ the extra input is known and the original sum must be predicted.
  The rule gains variance whenever the conditional variance of $L$ on $A$ is smaller than the one unit of residual
  variance of $w$.

This rule has $q + 1$ inputs but cell cost at most $q$. Indeed,
  an off-$A$ output fixes the first $q$ inputs and places no condition on $w$.
  The indicator of an on-$A$ output $\( upright("on") \, w_0 \)$ is

$ upright(bold(1))_A \( upright(bold(z)) \) upright(bold(1))_({ w = w_0 }) . $

Multiplying (3) by the last value test expresses this indicator as a sum of functions of at most $m + 1 =
  q$ inputs. The tags keep the two types of report separate, and unattained labels have zero indicators.
  These pointwise expansions also cover the prescribed endpoints and ties.
  The rule has finite range on every finite product alphabet.

To establish a gain for the approximating laws, first transfer the unconditional deficit,
  before conditioning on $A$. For independent copies of any centered variance-one law $Z_n$ tending to a standard
  normal with uniformly bounded fourth moments, Lemma 2 gives

$ Delta_(b \, n) := bb(E) \[ upright(bold(1))_A \( 1 - \( L - b \)^2 \) \] arrow.r d_A > 3 / 4 p_(*) . $

Thus, for all sufficiently large $n$, $Delta_(b \, n) > eta = p_(*) \/ 2$.
  Since $Delta_(b \, n) lt.eq bb(P) \( A \)$, these laws have positive probability of $A$.
  Only now fix such an $n$, write $Delta_b = Delta_(b \, n)$, and define

$ p = bb(P) \( A \) > 0 \, wide c = bb(E) \[ L divides A \] . $

Independence of $w$ from the original tuple shows that $bb(E) \[ L + w divides cal(O)_(+) \]$ equals $L$ off $A$
  and $c + w$ on $A$. The sum $L + w$ is centered, so its conditional mean is centered too.
  Using $bb(E) w = 0$, $bb(E) w^2 = 1$, and $bb(E) L^2 = q$ gives the exact identity

#[#set math.equation(numbering: n => "(10)")
 $ "Var" \( bb(E) \[ L + w divides cal(O)_(+) \] \) & = bb(E) \[ upright(bold(1))_(A^c) L^2 \] + p \( c^2 + 1 \)\
 & = q + p #scale(x: 120%, y: 120%)[\(] 1 - "Var" \( L divides A \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:switching-variance>]

The same input law satisfies

#[#set math.equation(numbering: n => "(11)")
 $ p #scale(x: 120%, y: 120%)[\(] 1 - "Var" \( L divides A \) #scale(x: 120%, y: 120%)[\)] = Delta_b +
   p \( c - b \)^2 > eta . $ <eq:switching-correction>]

The identities in (10) and the equality in (11) hold more generally for any independent centered variance-one
  original inputs and an independent centered variance-one $w$, whenever $p > 0$, with $Delta_b =
  bb(E) \[ upright(bold(1))_A \( 1 - \( L - b \)^2 \) \]$. Their marginal laws need not agree.
  The nonnegative correction $p \( c - b \)^2$ records the improvement from the fixed Gaussian predictor $b$ to
  the actual conditional mean $c$. For the fixed approximating law, (10) therefore exceeds $q + eta$.
  This argument uses convergence of one fixed predictor error, not continuity of conditional variances.

The pointwise cost and the transferred gain verify Proposition 4 with the distinct triple

$ \( r \, d \, eta \) = \( m + 2 \, m + 1 \, p_(*) \/ 2 \) . $

The criterion again proves Theorem 1, with ratio multiplier at least $1 + eta \/ \( m + 1 \) > 1$.
  For both rules in this section, the Gaussian parameters and $eta$ stay fixed throughout.
  Each stage starts from one fixed finite observation and chooses its own finite averaging count;
  the fourth-moment bound is uniform in that count, not across all stages.

== 5 Amplifying an average degree saving <sec:mean-cost>

A finite observation can have some inexpensive outputs and some expensive ones.
  We now convert an average degree saving into a bound valid on every input.
  Apply the observation independently many times, retain output words whose total cost is controlled,
  and merge all other words into one label. The indicator of the merged cell is the complement of the retained
  indicators. Its degree therefore satisfies the same bound, even if individual discarded words do not.

This operation must also retain enough variance and restore the normal approximation needed to repeat it.
  We use the score $T_F$, retained variance $v \( F \)$, and pointwise cell-degree calculus of Section 2.
  The new ingredient is a separate cost for each output label.
  These costs measure degrees of indicator expansions, not the number of queries required to determine an output.

=== 5.1 From a variance saving to an average cost saving <sec:refinement-first>

Let $q gt.eq 2$ be an integer, and let $cal(P) : bb(R)^q arrow.r
  cal(L)$ be a measurable map to a finite label set. Give label $l$ an integer cost $ell \( l \) in { 1 \,
  dots.h \, q }$. The relevant algebraic requirement is that, on every product of finite input alphabets,
  the cell indicator for $l$ is a finite linear combination of functions each depending on at most $ell \( l \)$
  input coordinates. The indicator itself need not depend on only that many coordinates.
  When the inputs are scores of observations with cell degree bound $D$,
  this requirement bounds the degree of the output cell by $D ell \( l \)$.

Suppose now that a Gaussian construction supplies an event $A$ on which one coordinate of degree cost can be
  saved, while the sum has conditional variance less than one.
  The next lemma turns this event into an observation whose retained variance exceeds its average cost.
  We keep $A$ as one cell and refine its complement finely enough that the extra prediction error uses less than
  the available variance saving.

#thm([Lemma 5.1.])[
  (Refining the complement of one event).  #emph[Let $q gt.eq 2$,
    let $G = \( G_1 \, dots.h \, G_q \)$ have independent standard normal coordinates, and put $S_G = sum_i G_i$.
    Suppose a measurable set $A subset bb(R)^q$ has Gaussian-null boundary,
$ p_A := bb(P) \( G in A \) > 0 \, wide r_A := "Var" \( S_G divides G in A \) < 1 \, $

 and its indicator, on every product of finite alphabets, is a finite linear combination of functions each
   depending on at most $q - 1$ coordinates. Then there is a finite pointwise partition $cal(P)$ with one cell $A$
   of cost $q - 1$ and all other cells of cost $q$ that has Gaussian-null cell boundaries and the prescribed
   pointwise coordinate bounds. Writing
$ V = "Var" \( bb(E) \[ S_G divides cal(P) \( G \) \] \) \, wide c = bb(E) ell \( cal(P) \( G \) \) \, $

 we have $V > c = q - p_A$.]
] <lem:refinement>

#proof[
  Partition $\[ - M \, M \)$ into finitely many half-open intervals of length at most $h$,
    and add the two tail intervals. Approximate a real coordinate by the midpoint of its bounded interval and by
    zero on the tails. For a standard normal coordinate, the expected squared error is at most
  $ h^2 + bb(E) \[ G_1^2 upright(bold(1))_({ \| G_1 \| gt.eq M }) \] . $
  Let $tilde(S)_G$ be the sum of these coordinate approximations.
    It is constant on each box of the resulting finite rectangular grid.
    Since $\( sum_i a_i \)^2 lt.eq q sum_i a_i^2$, choosing finite $M$ large enough and then $h >
    0$ small enough ensures
  $ bb(E) \( S_G - tilde(S)_G \)^2 < p_A \( 1 - r_A \) . $
  Give $A$ one label and give every intersection of $A^c$ with a grid box its own label.
    Retain this partition pointwise, even on cells of zero Gaussian probability.
    Every new cell has boundary contained in the boundary of $A$ together with the finitely many grid hyperplanes,
    and hence has Gaussian-null boundary. Give $A$ cost $q - 1$ and every other cell cost $q$.
    The special-cell algebraic requirement is assumed; the others are automatic for functions of $q$ inputs.
    Conditional means minimize squared error on every cell [2] Theorem 4.1.15, so
  $ bb(E) "Var" \( S_G divides cal(P) \( G \) \) lt.eq p_A r_A +
    bb(E) \[ upright(bold(1))_(A^c) \( S_G - tilde(S)_G \)^2 \] < p_A . $
  Since $"Var" \( S_G \) = q$, it follows that $V > q - p_A = bb(E) ell \( cal(P) \( G \) \) = c$. ◻
]

The event is fixed before the complement grid is chosen. The resulting partition is then fixed before any normal
  approximation or iteration. This gives the concrete inequality $V > c$ that the amplification theorem below needs.

=== 5.2 Amplifying the average cost saving <amplifying-the-average-cost-saving>

#thm([Theorem 5.2.])[
  (Amplification from a mean cost advantage).  #emph[Let $q gt.eq 2$, let $cal(P) : bb(R)^q arrow.r
    cal(L)$ be a measurable map to a finite label set, and let $ell : cal(L) arrow.r { 1 \, dots.h \, q }$.
    Suppose that, on every product of finite input alphabets,
    each cell indicator for $l$ is a finite linear combination of functions of at most $ell \( l \)$ input
    coordinates. Suppose also that every cell has boundary of standard Gaussian measure zero in $bb(R)^q$.
    For independent standard normals $G_1 \, dots.h \, G_q$, put
$ S_G = sum_(i = 1)^q G_i \, wide V = "Var" \( bb(E) \[ S_G divides cal(P) \( G \) \] \) \, wide c =
  bb(E) ell \( cal(P) \( G \) \) . $

 If $V > c$, then finite observations on sign cubes have arbitrarily large ratios $v \( F \) \/ D$,
   where $D > 0$ is a cell degree bound. The Boolean conclusion of Theorem 1 follows by taking the sign of the
   final score, without a further averaging step. All partitions and observations are defined pointwise,
   including cells of zero Gaussian probability.]
] <thm:mean-cost>

Only restricted first moments need to pass to the Gaussian limit in this criterion.
  The next lemma isolates that fact; it also explains why zero limiting cell probabilities cause no difficulty.

#thm([Lemma 5.3.])[
  (Transfer for a fixed finite partition).  #emph[Under the boundary hypothesis of Theorem 9,
    let $Z_n$ be centered random variables of variance one converging in distribution to a standard normal.
    Use $q$ independent copies to set
$ S_n = sum_(i = 1)^q Z_(n \, i) \, wide L_n = cal(P) \( upright(bold(Z))_n \) \, wide V_n =
  "Var" \( bb(E) \[ S_n divides L_n \] \) \, wide c_n = bb(E) ell \( L_n \) . $

 Then
$ liminf_n V_n gt.eq V \, wide c_n arrow.r c \, wide bb(E) \| Z_n \| arrow.r sqrt(2 \/ pi) . $

 No fourth-moment hypothesis is required.]
] <lem:mc-transfer>

#proof[
  Independence gives joint weak convergence of the input tuples.
    The Gaussian-null boundaries imply convergence of all cell probabilities [2] Theorem 3.10.1(v).
    For a fixed cell $E$, clip the sum continuously to $\[ - t \, t \]$.
    The clipped sum times $upright(bold(1))_E$ is bounded and has Gaussian-null discontinuities,
    so its expectations converge [2] Theorem 3.10.1(vi). Since $S_n$ is centered and has variance $q$,
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \| S_n \| upright(bold(1))_({ \| S_n \| > t }) #scale(x: 120%, y: 120%)[\]]
    lt.eq q \/ t . $
  Removing the clipping therefore proves $bb(E) \[ S_n upright(bold(1))_({ upright(bold(Z))_n in E }) \] arrow.r
    bb(E) \[ S_G upright(bold(1))_({ G in E }) \]$.
  For each $n$, the centered conditional mean satisfies
  $ V_n =
    sum_(l : bb(P) \( L_n = l \) > 0) frac(bb(E) \[ S_n upright(bold(1))_({ L_n = l }) \]^2, bb(P) \( L_n = l \)) . $
  Every term for a cell of positive Gaussian probability converges to the corresponding Gaussian term.
    All remaining terms are nonnegative. This proves the lower limit inequality;
    it does not require deleting the cells with zero limiting probability.
    The cost convergence follows from the finitely many convergent cell probabilities.
    Finally, weak convergence and the bound $bb(E) \[ \| Z_n \| upright(bold(1))_({ \| Z_n \| > t }) \] lt.eq
    1 \/ t$ give convergence of the absolute first moments. ◻
]

#proof[
  The partition and costs are fixed throughout the proof. Choose
  $ 0 < delta < \( V - c \) \/ 2 \, wide 1 < lambda < frac(V - delta, c + delta) . $
  For any centered, variance-one law $Z$, use independent copies to define
  $ S_Z = sum_(i = 1)^q Z_i \, wide L = cal(P) \( upright(bold(Z)) \) \, wide V_Z =
    "Var" \( bb(E) \[ S_Z divides L \] \) \, wide c_Z = bb(E) ell \( L \) . $
  For a finite observation $F$ with $v = v \( F \) > 0$, write $Z = T_F \/ sqrt(v)$.
    We will increase $v \/ D$ while maintaining
  #[#set math.equation(numbering: n => "(12)")
   $ V_Z > V - delta \, wide c_Z < c + delta \/ 2 \, wide bb(E) \| Z \| > 1 \/ 2 . $ <eq:invariant>]
  Lemma 10 shows that all three inequalities hold eventually along every sequence of centered,
    variance-one laws converging to a standard normal.
  To initialize, observe the bit sum itself: $F = H_N$, with score $T_F = H_N$ and $v = D = N$.
    The central limit theorem for independent uniform signs [2] Theorem 3.4.1 supplies a finite $N$ for which (12)
    holds. The initial ratio is $v \/ D = 1$.
  Now hold one such $F$ fixed. Apply $cal(P)$ to the standardized scores of $q$ independent copies of $F$,
    obtaining the group label $L$. The algebraic assumption and the degree calculus give
  $ deg \( upright(bold(1))_({ L = l }) \) lt.eq D ell \( l \) . $
  The tower property identifies the group score and its variance as
  #[#set math.equation(numbering: n => "(13)")
   $ T_L = sqrt(v) thin bb(E) \[ S_Z divides L \] \, wide tau^2 := v \( L \) = v V_Z > 0 . $ <eq:group>]
  Thus this group has a variance advantage relative to its mean cost.
    We next obtain a common degree bound without losing that advantage.
  Take $K$ independent copies of $L$. Retain a label word $\( l_1 \, dots.h \, l_K \)$ when $sum_(b = 1)^K
    ell \( l_b \) lt.eq K \( c + delta \)$. Let $F'_K$ report each retained word exactly and report one failure
    label for every other word. Every retained-word indicator is a product with degree at most
  #[#set math.equation(numbering: n => "(14)")
   $ D'_K = D K \( c + delta \) . $ <eq:degree>]
  The failure indicator is one minus the finite sum of all retained-word indicators,
    so it satisfies the same degree bound on every input. The real upper bound $D'_K$ need not be rounded to an
    integer. Since the independent costs have mean $c_Z < c + delta \/ 2$,
    the law of large numbers [2] Theorem 2.2.3 gives a failure probability $epsilon_K arrow.r 0$.
  Write $U_K = sum_(b = 1)^K T_(L_b)$ and $T'_K = T_(F'_K)$.
    The tower property again gives $T'_K = bb(E) \[ U_K divides F'_K \]$.
    On a retained word, $U_K$ is known exactly. On failure, its conditional mean is at least as good a predictor
    as zero [2] Theorem 4.1.15. Consequently
  #[#set math.equation(numbering: n => "(15)")
   $ bb(E) \( U_K - T'_K \)^2 & lt.eq bb(E) \[ U_K^2 upright(bold(1))_({ upright("failure") }) \]\
 & lt.eq \( bb(E) U_K^4 \)^(1 \/ 2) epsilon_K^(1 \/ 2) = o \( K tau^2 \) . $ <eq:loss>]
  For the last equality, $T_L$ has finite range, mean zero, and positive variance, and independence gives
  $ bb(E) U_K^4 = K bb(E) T_L^4 + 3 K \( K - 1 \) tau^4 = O \( K^2 tau^4 \) . $
  The implicit constant can depend on the current observation, which has been fixed before $K$ tends to infinity.
  The conditional-expectation projection identity [2] Theorem 4.1.15 and its proof now yields
  $ v \( F'_K \) = K tau^2 - bb(E) \( U_K - T'_K \)^2 tilde.op K tau^2 . $
  In particular, this variance is positive for all sufficiently large $K$.
    The central limit theorem [2] Theorem 3.4.1 gives $U_K \/ \( sqrt(K) tau \) arrow.r.double N \( 0 \, 1 \)$.
    By (15), replacing $U_K$ by $T'_K$ changes the normalized variable by a term tending to zero in $L^2$.
    Moreover, $sqrt(v \( F'_K \)) \/ \( sqrt(K) tau \) arrow.r 1$.
    The addition and rescaling forms of Slutsky’s theorem [2] Exercises 3.2.13–3.2.14 therefore give
  $ T'_K / sqrt(v \( F'_K \)) arrow.r.double N \( 0 \, 1 \) . $
  These new standardized scores are centered and have variance one.
    Lemma 10 restores all three inequalities in (12) for sufficiently large $K$. At the same time, (13) and (14) give
  $ frac(v \( F'_K \), D'_K) arrow.r v / D frac(V_Z, c + delta) > lambda v / D . $
  One sufficiently large finite $K$ therefore restores every maintained condition and increases the ratio by a
    factor greater than $lambda$.
  For any prescribed $C > 0$, choose a positive integer $k$ with $lambda^k > 4 C^2$.
    Perform $k$ such steps, choosing a finite batch size separately at each step.
    The final observation remains finite and satisfies
  $ v \( F \) \/ D > 4 C^2 \, wide bb(E) \| T_F \| > 1 / 2 sqrt(v \( F \)) . $
  Let $N$ now denote the total number of bits underlying the final observation.
    Its sign readout $f = "sign" \( T_F \)$, with sign $1$ at zero, has degree at most $D$.
    Conditioning the bit sum on $F$ gives the signed identity
  $ sum_i hat(f) \( { i } \) = bb(E) \[ f H_N \] = bb(E) \| T_F \| > 1 / 2 sqrt(v \( F \)) > C sqrt(D) gt.eq
    C sqrt(deg \( f \)) . $
  The positive signed correlation excludes constant $f$. Arbitrarily large target ratios follow from the same
    finite iteration. ◻
]

=== 5.3 Applying the criterion to the reporting event <applying-the-criterion-to-the-reporting-event>

Apply the criterion first with $q = m + 1$ and the reporting event $A$ of Lemma 6.
  That lemma gives positive probability, conditional variance of the coordinate sum below one,
  and Gaussian-null boundary. Identity (3) gives the required pointwise expansion into functions of at most $m$
  coordinates. Lemma 8 therefore supplies a finite partition with costs $m$ and $m + 1$ and with $V > c = m + 1 -
  bb(P) \( A \)$. Theorem 9 gives the signed Boolean conclusion.
  Appendix 6 supplies a second event with these same four properties and uses the same refinement and amplification.

== 6 A weighted Gaussian mixture <app:weighted-mixture>

We give an independent Gaussian construction for the mean-cost argument of Section 5.
  The event again requires exactly the selected leaf to fail its interval test,
  but now we first divide the central coordinate into bins and choose each leaf interval from its bin’s
  conditional mean. This lets us compute the variance on the event as a finite mixture.
  The relevant weights change when we condition on the event; controlling those weights is the main estimate.

Our goal is a positive-probability event on which the sum has conditional variance less than one,
  with an indicator that saves one coordinate in each summand.
  Lemma 8 will then produce the required finite partition. The parameter choice below is independent of the
  parameter choice in Lemma 6.

=== 6.1 The event and its conditional bin weights <app:weighted-identity>

For $R > 0$, put

#[#set math.equation(numbering: n => "(16)")
 $ m = 1 + ceil.l e^(R^2 \/ 4) ceil.r \, wide Delta = frac(2 R, m - 1) \, wide h = e^(- 3 R^2 \/ 8) \, wide q =
   m + 1 . $ <app:weighted-schedule>]

Let $G = \( G_0 \, dots.h \, G_m \)$ have independent standard normal coordinates and set $L = sum_(j = 0)^m G_j$.
  Partition $\[ - R \, R \)$ into $m - 1$ half-open intervals $B_i$ of length $Delta$, and let $B_m =
  bb(R) \\ \[ - R \, R \)$. Define

$ pi_i = bb(P) \( G_0 in B_i \) \, wide v_i = bb(E) \[ G_0 divides G_0 in B_i \] \, wide u_i =
  "Var" \( G_0 divides G_0 in B_i \) . $

Every $pi_i$ is positive. For each leaf $j in { 1 \, dots.h \, m }$, take the half-open interval

$ I_j = \[ v_j + 1 - h \/ 2 \, v_j + 1 + h \/ 2 \) \, wide chi_j = upright(bold(1))_(I_j) . $

For any real input $g = \( g_0 \, dots.h \, g_m \)$, define $g in A$ when,
  for the unique $i$ such that $g_0 in B_i$, all leaves other than $i$ belong to their intervals and leaf $i$ does
  not. The half-open conventions assign every endpoint a definite outcome.
  All unqualified bin and leaf sums below range from $1$ to $m$.

#thm([Lemma 6.1.])[
  (The weighted-mixture event).  #emph[For all sufficiently large finite $R$, the event $A$ just defined satisfies
$ p_A := bb(P) \( G in A \) > 0 \, wide r_A := "Var" \( L divides G in A \) < 1 . $

 Its boundary is contained in finitely many coordinate hyperplanes,
   and on every real input its indicator has the expansion
#[#set math.equation(numbering: n => "(17)")
 $ upright(bold(1))_A \( g \) = sum_(i = 1)^m upright(bold(1))_(B_i) \( g_0 \) product_(1 lt.eq j lt.eq m\
j eq.not i) chi_j \( g_j \) - product_(j = 1)^m chi_j \( g_j \) . $ <app:weighted-cell>]

 Each product involves at most $m = q - 1$ coordinates.]
] <lem:weighted-event>

#proof[
  Exactly one bin contains $g_0$. The first term in (17) tests all unselected leaves;
    subtracting the all-leaves-pass indicator requires the selected leaf to fail.
    This proves the identity pointwise, including all endpoints.
    The boundary assertion follows from the finite collections of bin and leaf-interval endpoints.
    It remains to prove the variance saving. We let $R arrow.r
    oo$ for this calculation and fix a finite value only after the estimates.
  ===== 6.1.1 Conditional moments. <conditional-moments.>
  Write $phi.alt$ for the standard normal density. Symmetry of the two tails gives $v_m = 0$; for $i < m$,
    the conditional mean lies in the closure of $B_i$, so $\| v_i \| lt.eq R$ and $u_i lt.eq Delta^2$.
    Integration by parts gives
  $ integral_R^oo t^2 phi.alt \( t \) thin d t = R phi.alt \( R \) + integral_R^oo phi.alt \( t \) thin d t \,
    wide integral_R^oo phi.alt \( t \) thin d t lt.eq frac(phi.alt \( R \), R) . $
  Thus
  #[#set math.equation(numbering: n => "(18)")
   $ pi_m u_m = O \( R e^(- R^2 \/ 2) \) \, wide sum_i pi_i v_i = 0 \, wide sum_i pi_i v_i^2 = 1 -
     sum_i pi_i u_i = 1 - o \( 1 \) \, $ <app:weighted-bin-moments>]
  where the last equality follows from $sum_i pi_i u_i lt.eq Delta^2 + O \( R e^(- R^2 \/ 2) \) = o \( 1 \)$.
  For the leaf intervals, write
  $ alpha_j = bb(P) \( G_j in I_j \) \, wide t_j = bb(E) \[ G_j divides G_j in I_j \] \, wide r_j =
    "Var" \( G_j divides G_j in I_j \) . $
  The bounded normal density and the interval lengths imply, uniformly in $j$ for sufficiently large $R$,
  #[#set math.equation(numbering: n => "(19)")
   $ 0 < alpha_j lt.eq C h < 1 / 2 \, wide \| t_j - \( v_j + 1 \) \| lt.eq h \/ 2 \, wide 0 lt.eq r_j lt.eq
     h^2 . $ <app:weighted-rare-moments>]
  Constants in this section are absolute unless stated otherwise.
    Let $d_j \, b_j$ be the conditional mean and variance of $G_j$ on $I_j^c$.
    Using the unconditional mean zero and variance one gives
  #[#set math.equation(numbering: n => "(20)")
   $ d_j = - frac(alpha_j t_j, 1 - alpha_j) \, wide b_j = frac(1 - alpha_j r_j, 1 - alpha_j) -
     frac(alpha_j t_j^2, \( 1 - alpha_j \)^2) . $ <app:weighted-complement>]
  Indeed the complementary second moment is $\( 1 - alpha_j \( r_j + t_j^2 \) \) \/ \( 1 - alpha_j \)$,
    from which we subtract $d_j^2$.
  ===== 6.1.2 The mixture identity. <the-mixture-identity.>
  The event $A$ changes the distribution of the selected bin. Put
  $ w_i = pi_i frac(1 - alpha_i, alpha_i) \, wide W = sum_i w_i \, wide omega_i = w_i / W . $
  Independence gives
  #[#set math.equation(numbering: n => "(21)")
   $ p_A = W product_(j = 1)^m alpha_j > 0 \, wide bb(P) \( G_0 in B_i divides G in A \) =
     omega_i . $ <app:weighted-probability>]
  Here $W$ is finite and positive for every finite $R$. Within $A ∩ { G_0 in
    B_i }$ the coordinates remain independent under their respective bin, interval,
    and complementary-interval restrictions. The conditional mean and variance of $L$ are therefore
  $ sum_(j = 1)^m t_j - 1 + e_i \, wide u_i + sum_j r_j + b_i - r_i \, wide e_i = v_i + 1 - frac(t_i, 1 - alpha_i) . $
  The small mean error satisfies
  #[#set math.equation(numbering: n => "(22)")
   $ \| e_i \| lt.eq h \/ 2 + frac(alpha_i \| t_i \|, 1 - alpha_i) =
     O \( h \( R + 2 \) \) . $ <app:weighted-mean-error>]
  Applying the variance decomposition with the conditional weights $omega_i$, not the original weights $pi_i$,
    gives the exact identity
  #[#set math.equation(numbering: n => "(23)")
   $ W #scale(x: 120%, y: 120%)[\(] 1 - "Var" \( L divides G in A \) #scale(x: 120%, y: 120%)[\)] & =
     sum_i w_i \( 1 - b_i + r_i \) - sum_i w_i u_i\
 & quad - W sum_j r_j - W "Var"_(i tilde.op omega) \( e_i \) . $ <app:weighted-variance-identity>]
  We next show that the first sum has lower limit at least one and that each of the three subtracted terms tends
    to zero. This will give the strict conditional variance bound despite the possibly large total weight $W$.
  The schedule in (16) makes the bin scale $Delta^2 \/ h$, the aggregate leaf scale $m h$,
    and the tail scale $e^(- R^2 \/ 2) \/ h$ tend to zero even after multiplication by $e^(3 R)$ and any fixed
    power of $R$. The leaf intervals are narrow enough to control their total variance,
    but wide enough that inverse interval probabilities do not overwhelm the bin and tail estimates below.
  ===== 6.1.3 The positive contribution. <the-positive-contribution.>
  Substituting (20) yields
  #[#set math.equation(numbering: n => "(24)")
   $ w_i \( 1 - b_i + r_i \) = pi_i (- 1 + r_i / alpha_i + frac(t_i^2, 1 - alpha_i)) gt.eq
     pi_i \( t_i^2 - 1 \) . $ <app:weighted-positive-term>]
  Since $t_i = v_i + 1 + O \( h \)$ uniformly, we have
  $ sum_i pi_i \( t_i^2 - 1 \) = sum_i pi_i v_i^2 + 2 sum_i pi_i v_i + O \( h \( R + 2 \) \) = 1 + o \( 1 \) $
  by (18). The shift of the leaf intervals by one is important:
    it produces the term $t_i^2 - 1$, whose average tends to one.
  ===== 6.1.4 The three error terms. <the-three-error-terms.>
  For $i < m$, the fact that $v_i$ belongs to the closure of $B_i$ gives the density-ratio bound
  #[#set math.equation(numbering: n => "(25)")
   $ w_i lt.eq pi_i / alpha_i & lt.eq Delta /
     h frac(phi.alt \( max { 0 \, \| v_i \| - Delta } \), phi.alt \( \| v_i \| + 1 + h \))\
 & lt.eq Delta / h e^(3 R) $ <app:weighted-density-ratio>]
  for all sufficiently large $R$. For the final inequality, put $x = \| v_i \| lt.eq R$.
    The logarithm of the density ratio is at most
  $ frac(\( x + 1 + h \)^2 - max { 0 \, x - Delta }^2, 2) lt.eq \( 1 + h + Delta \) x +
    frac(\( 1 + h \)^2, 2) lt.eq 3 R . $
  The middle inequality follows by expanding when $x gt.eq Delta$; when $x < Delta$, use $x^2 \/ 2 lt.eq Delta x$.
    For the tail bin, $v_m = 0$, so $alpha_m gt.eq h phi.alt \( 1 + h \)$ and $w_m lt.eq C pi_m \/ h$.
    Summing and using $\( m - 1 \) Delta = 2 R$ gives
  #[#set math.equation(numbering: n => "(26)")
   $ W lt.eq frac(2 R e^(3 R) + C, h) . $ <app:weighted-total-weight>]
  First, $u_i lt.eq Delta^2$ on interior bins and $pi_m u_m = O \( R e^(- R^2 \/ 2) \)$ on the tail bin.
    Since $Delta^2 lt.eq 4 R^2 e^(- R^2 \/ 2)$, we obtain
  $ sum_i w_i u_i lt.eq W Delta^2 + C pi_m u_m \/ h = O \( R^3 e^(3 R - R^2 \/ 8) \) + O \( R e^(- R^2 \/ 8) \) =
    o \( 1 \) . $
  Second, $sum_j r_j lt.eq m h^2$ and $m h = O \( e^(- R^2 \/ 8) \)$, so
  $ W sum_j r_j lt.eq W m h^2 = O \( \( R e^(3 R) + 1 \) e^(- R^2 \/ 8) \) = o \( 1 \) . $
  Third, (22) gives
  $ W "Var"_(i tilde.op omega) \( e_i \) lt.eq W thin O \( h^2 \( R + 2 \)^2 \) =
    O \( \( R e^(3 R) + 1 \) \( R + 2 \)^2 e^(- 3 R^2 \/ 8) \) = o \( 1 \) . $
  Each negative quadratic exponent dominates the linear exponent and polynomial factors.
    Combining these estimates with (23) and (24) shows that
  $ W #scale(x: 120%, y: 120%)[\(] 1 - "Var" \( L divides G in A \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 +
    o \( 1 \) > 0 $
  for all sufficiently large $R$. Since $W > 0$, this proves the lemma. ◻
]

=== 6.2 Application to mean-cost amplification <app:weighted-transfer>

Fix one finite $R$ for which Lemma 11 holds. Thus the integer $q = m + 1$, all intervals and bins,
  and the positive numbers

#[#set math.equation(numbering: n => "(27)")
 $ p_A = bb(P) \( G in A \) > 0 \, wide 1 - r_A > 0 $ <app:weighted-saving>]

are fixed before further approximation. The pointwise expansion (17) uses at most $q -
  1$ coordinates in each term, and the finite hyperplane boundary is Gaussian-null.
  These are precisely the hypotheses of Lemma 8. That lemma refines $A^c$ into a finite collection of cells,
  with total squared approximation error below the actual positive quantity $p_A \( 1 - r_A \)$.
  It assigns cost $m$ to $A$ and cost $q$ to every other cell, giving a fixed partition $cal(P)$ for which

#[#set math.equation(numbering: n => "(28)")
 $ V := "Var" \( bb(E) \[ L divides cal(P) \( G \) \] \) > c := bb(E) ell \( cal(P) \( G \) \) = q -
   p_A . $ <app:weighted-mean-cost-gain>]

The partition includes its Gaussian-null cells as pointwise sets;
  later discrete input laws may give those cells positive probability.

With $R$ and this partition fixed, Lemma 10 supplies the finite-input transfer used in Theorem 9.
  The costs $m$ and $q$ are positive integers, and the pointwise coordinate bounds, Gaussian-null boundaries,
  and strict inequality $V > c$ verify all its hypotheses. The theorem therefore gives arbitrarily large ratios of
  retained variance to cell degree and the signed Boolean conclusion of Theorem 1.
  Neither the conditional variance saving nor the required batch sizes are asserted to be uniform in $R$.

== 7 A small-width Gaussian calculation for the coarse report <app:small-width>

The coarse report also admits a different Gaussian parameter choice.
  We balance the interval width against the spacing of the selector grid and use the same cancellation as in (9)
  to compute the resulting predictor error. We also show how this error transfers when the two predictor constants
  are recalibrated to the input law, using convergence of restricted moments.

=== 7.1 The parameters and a law-dependent error bound <app:small-width-rule>

For $0 < w < 1$, put

#[#set math.equation(numbering: n => "(29)")
 $ h = w^(2 \/ 3) \, wide T = sqrt(4 log \( 1 \/ w \)) . $ <app:small-width-schedule>]

List the points of $h bb(Z) ∩ \[ - T \, T \]$ in increasing order as $t_1 \, dots.h \, t_m$,
  and let $i_(*)$ index zero. Thus $m = 2 floor.l T \/ h floor.r + 1 = O \( T \/ h \)$ as $w arrow.b 0$;
  in particular, $m gt.eq 3$ for sufficiently small $w$. On $\| t \| lt.eq T$,
  let $I \( t \)$ be the index of a nearest grid point, breaking ties by the smaller index.
  On $\| t \| > T$, set $I \( t \) = i_(*)$. The grid endpoints need not equal $plus.minus T$, but

$ \| t - t_(I \( t \)) \| lt.eq h wide \( \| t \| lt.eq T \) . $

Give leaf $j$ the closed interval

$ A_j = \[ t_j + 1 - w \/ 2 \, t_j + 1 + w \/ 2 \] . $

These endpoint and tie conventions define the rule on every real input.
  Restrict henceforth to sufficiently small $w$ that $m gt.eq 3$.

The choice $h = w^(2 \/ 3)$ balances two power scales: $h^2 \/ w$ from rounding the central input to a grid point,
  and $w \/ h$ from adding the leaf-interval variances. The accompanying cutoff factors grow more slowly than
  every power of $1 \/ w$. The choice of $T$ makes $e^(- T^2 \/ 2) = w^2$,
  so the Gaussian tail second moment is $o \( w \)$. The estimates below retain all these factors.

Apply the coarse report of Lemma 7 with central input $t$, leaf inputs $u_1 \, dots.h \, u_m$, selector $I$,
  and leaf intervals $A_j$. Denote it by $cal(O)_w$. Thus it returns $Y$ when all leaves pass,
  $X$ when only the selected leaf fails, and $\( O \, t \, I \( t \) \, \( u_j \)_(j eq.not I \( t \)) \)$
  otherwise. In the notation of that lemma, these events are $B$, $A = P \\ B$, and $P^c$.
  For clarity, the special-cell identity here is

#[#set math.equation(numbering: n => "(30)")
 $ upright(bold(1))_A \( t \, u \) = sum_(i = 1)^m upright(bold(1))_({ I \( t \) = i }) product_(j eq.not i)
   upright(bold(1))_(A_j) \( u_j \) - product_(j = 1)^m upright(bold(1))_(A_j) \( u_j \) . $ <app:small-width-cell>]

The lemma proves that every cell has coordinate cost at most $m$:
  the displayed summands use $m$ coordinates, the $Y$ cell ignores $t$,
  and an ordinary report imposes no condition on its omitted leaf.
  This holds pointwise on every finite product alphabet, including unused labels.
  The boundaries of $A$, $B$, and $P$ lie in finitely many coordinate hyperplanes.

Let $U$ be centered with variance one, and take independent copies $U_0 \, dots.h \, U_m$. Write

$ L = sum_(j = 0)^m U_j \, wide cal(R)_w \( U \) =
  bb(E) \[ \( L - bb(E) \[ L divides cal(O)_w \( upright(bold(U)) \) \] \)^2 \] . $

For the moment assume

$ q_j = bb(P) \( U in A_j \) in \( 0 \, 1 \) \, wide Q = product_(j = 1)^m q_j . $

Let $mu_j \, a_j$ be the conditional mean and variance on $A_j$, and put

$ M_mu = sum_j mu_j \, wide S_a = sum_j a_j . $

The interval length gives $0 lt.eq a_j lt.eq w^2$. Use the predictor $M_mu - 1$ on $X$,
  the predictor $M_mu$ on $Y$, and the sum of reported coordinates on ordinary outputs.
  Denote this function of the report by $hat(L)$. We will compute its deficit $1 -
  bb(E) \[ \( L - hat(L) \)^2 \]$ exactly.

The ordinary reports contribute $bb(P) \( P^c \)$ to the squared error, by Lemma 7.
  For the exceptional reports, fix $U_0 = t$ and put $i = I \( t \)$.
  The event $P$ has conditional probability $Q \/ q_i$, restricts every unselected leaf to its interval,
  and leaves $U_i$ unrestricted. Under these restrictions, $L - \( M_mu - 1 \)$ has mean $t + 1 -
  mu_i$ and variance $1 + S_a - a_i$. Hence

$ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_P \( 1 - \( L - \( M_mu - 1 \) \)^2 \)
  #scale(x: 120%, y: 120%)[\]] = - Q bb(E)_t [frac(\( t + 1 - mu_i \)^2 + S_a - a_i, q_i)] . $

On $B$, the central input remains unrestricted. The two respective predictor deficits on $B$ are therefore

$ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_B \( 1 - \( L - \( M_mu - 1 \) \)^2 \)
  #scale(x: 120%, y: 120%)[\]] & = - Q \( 1 + S_a \) \,\
bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_B \( 1 - \( L - M_mu \)^2 \)
  #scale(x: 120%, y: 120%)[\]] & = - Q S_a . $

Subtracting the first of these from the $P$ contribution gives the $X$ contribution, because $A = P \\ B$.
  Adding the $Y$ contribution cancels $S_a$, exactly as in the earlier Gaussian calculation. Define

#[#set math.equation(numbering: n => "(31)")
 $ H_w \( U \) = 1 - bb(E)_t [frac(\( t + 1 - mu_(I \( t \)) \)^2 + S_a - a_(I \( t \)), q_(I \( t \)))] .
   $ <app:small-width-deficit>]

We have proved

#[#set math.equation(numbering: n => "(32)")
 $ 1 - cal(R)_w \( U \) gt.eq 1 - bb(E) \[ \( L - hat(L) \)^2 \] = Q H_w \( U \) . $ <app:small-width-residual>]

The equality is the gain of the specified predictor; the inequality uses optimality of conditional expectation.
  The calculations integrate against the law of $t$, so they require no positive probability for any individual
  central value. We next show that both subtracted errors in (31) tend to zero for Gaussian inputs.
  The product $Q$ may be extremely small; only its strict positivity will matter after $w$ is fixed.

=== 7.2 Gaussian estimates, including the rare-probability factors <app:small-width-estimates>

In this subsection $U = G$ is standard normal and $w arrow.b 0$. Write $phi.alt$ for its density.
  Uniformly over the grid,

$ q_j lt.eq w / sqrt(2 pi) \, wide \| mu_j - \( t_j + 1 \) \| lt.eq w \/ 2 \, wide sum_j a_j lt.eq m w^2 =
  O \( T w^(4 \/ 3) \) arrow.r 0 . $

We must control the two errors in (31) after division by the selected interval probability.
  A uniform lower bound of order $w$ for all $q_j$ is unavailable,
  because the grid extends into the Gaussian tails. Instead we compare each interval’s density with the density of
  the central coordinate that selects it.

For $\| t \| lt.eq T$ and $z in A_(I \( t \))$, we have $\| z - t \| lt.eq 1 + h + w \/ 2$.
  Hence, for sufficiently small $w$,

$ q_(I \( t \)) gt.eq w inf_(z in A_(I \( t \))) phi.alt \( z \) \, wide
  frac(phi.alt \( t \), q_(I \( t \))) lt.eq w^(- 1) exp \( C \( 1 + T \) \) . $

The constant $C$ is absolute: the logarithm of the density ratio is $\( z^2 - t^2 \) \/ 2 lt.eq \| t \| \| z -
  t \| + \| z - t \|^2 \/ 2$. Since $T = 2 sqrt(log \( 1 \/ w \))$, for each fixed $epsilon > 0$,

#[#set math.equation(numbering: n => "(33)")
 $ frac(phi.alt \( t \), q_(I \( t \))) = O \( w^(- 1 - epsilon) \) wide \( \| t \| lt.eq T \) .
   $ <app:small-width-inverse-density>]

The fallback interval is centered at $1$, so $q_(i_(*)) gt.eq c w$ for an absolute $c > 0$ and small $w$.
  Integrating the central bound and using this fallback bound on the tails gives

#[#set math.equation(numbering: n => "(34)")
 $ bb(E) 1 / q_(I \( G \)) = O \( T w^(- 1 - epsilon) \) . $ <app:small-width-inverse-mean>]

Take $epsilon = 1 \/ 6$. Since $0 lt.eq S_a - a_(I \( G \)) lt.eq m w^2$, the variance contribution in (31) is at most

$ m w^2 bb(E) 1 / q_(I \( G \)) = O \( T^2 w^(1 \/ 6) \) arrow.r 0 . $

For the squared mismatch, first suppose $\| t \| lt.eq T$. Then

$ \| t + 1 - mu_(I \( t \)) \| lt.eq \| t - t_(I \( t \)) \| + w \/ 2 lt.eq h + w \/ 2 . $

Its central contribution is therefore at most

$ O #scale(x: 120%, y: 120%)[\(] T w^(- 7 \/ 6) \( h + w \)^2 #scale(x: 120%, y: 120%)[\)] =
  O \( T w^(1 \/ 6) \) arrow.r 0 . $

On $\| t \| > T$, the fallback mean is bounded, so the contribution is

$ O (w^(- 1) integral_(\| t \| > T) \( 1 + t^2 \) phi.alt \( t \) thin d t) =
  O #scale(x: 120%, y: 120%)[\(] w^(- 1) \( 1 + T \) e^(- T^2 \/ 2) #scale(x: 120%, y: 120%)[\)] =
  O \( \( 1 + T \) w \) arrow.r 0 . $

For the integral estimate, integration by parts gives $integral_T^oo t^2 phi.alt \( t \) thin d t =
  T phi.alt \( T \) + integral_T^oo phi.alt \( t \) thin d t$, and $integral_T^oo phi.alt \( t \) thin d t lt.eq
  phi.alt \( T \) \/ T$ for $T > 0$. The last equality uses $e^(- T^2 \/ 2) = w^2$.
  Both subtracted errors therefore vanish, proving

#[#set math.equation(numbering: n => "(35)")
 $ H_w \( G \) arrow.r 1 . $ <app:small-width-limit>]

Thus the same coarse report has a strictly positive Gaussian improvement for this independent choice of
  parameters. To use it repeatedly on finite cubes, we now fix those parameters and transfer the particular lower
  bound just proved.

=== 7.3 Restricted moments and the finite-score transfer <app:small-width-transfer>

Fix a sufficiently small $w > 0$ with $m gt.eq 3$ and $H_w \( G \) > 1 \/ 2$.
  All intervals, grid points, selector cells, and $m$ are fixed from now on. Put

$ Q_G = product_(j = 1)^m bb(P) \( G in A_j \) > 0 \, wide eta = Q_G \/ 4 . $

Let $U_n$ be centered variance-one variables such that $U_n arrow.r.double G$ and $sup_n bb(E) U_n^4 < oo$.
  Write $U_(n \, 0) \, dots.h \, U_(n \, m)$ for independent copies.
  Use a subscript $n$ for the interval moments of $U_n$ and a superscript $G$ for their Gaussian values,
  and put $Q_n = product_j q_(j \, n)$. For each bounded interval $A_j$,
  weak convergence off its Gaussian-null boundary gives convergence of its probability and its restricted first
  and second moments. Thus

$ q_(j \, n) arrow.r q_j^G in \( 0 \, 1 \) \, wide mu_(j \, n) arrow.r mu_j^G \, wide a_(j \, n) arrow.r a_j^G . $

All these conditional moments are defined for sufficiently large $n$.
  There are finitely many intervals, so their probabilities are then simultaneously bounded away from zero and
  one. In particular, every coefficient in (31) converges, including the reciprocal-probability factors.

Coefficient convergence alone does not yet transfer its expectation.
  Partition the line into the fixed selector cells $E_i = { t : I \( t \) = i }$, whose boundaries are finite.
  The fallback cell includes both tails as well as the central cell for the grid point zero;
  it still has a finite boundary. For $k = 0 \, 1 \, 2$,

#[#set math.equation(numbering: n => "(36)")
 $ bb(E) \[ U_n^k upright(bold(1))_({ U_n in E_i }) \] arrow.r
   bb(E) \[ G^k upright(bold(1))_({ G in E_i }) \] . $ <app:small-width-restricted-moments>]

To see this, multiply $t^k upright(bold(1))_(E_i) \( t \)$ by a continuous cutoff that is one on $\[ - K \, K \]$
  and zero outside $\[ - K - 1 \, K + 1 \]$. The resulting function is bounded and has only Gaussian-null
  discontinuities, so weak convergence applies. The cutoff errors for $k = 1 \, 2$ vanish uniformly as $K arrow.r
  oo$, by

$ bb(E) \[ \| U_n \| upright(bold(1))_({ \| U_n \| > K }) \] lt.eq K^(- 1) \, wide
  bb(E) \[ U_n^2 upright(bold(1))_({ \| U_n \| > K }) \] lt.eq K^(- 2) sup_j bb(E) U_j^4 . $

The corresponding Gaussian errors also vanish. The case $k =
  0$ follows directly from the continuity-set criterion. These are the same weak-convergence and
  uniform-integrability principles used in Lemma 2; see [2].

On a fixed selector cell $E_i$, the integrand in (31) is a polynomial of degree at most two in $t$.
  Expanding that polynomial expresses its expectation as a finite sum of convergent coefficients times the
  restricted moments in (36). Therefore

$ Q_n H_w \( U_n \) arrow.r Q_G H_w \( G \) > Q_G \/ 2 . $

This proves convergence despite the moving predictor coefficients;
  we have not assumed continuity of conditional variances. For all sufficiently large $n$, (32) now gives $1 -
  cal(R)_w \( U_n \) > eta$. Since the sum of the $m + 1$ independent inputs is centered and has variance $m + 1$,

$ "Var" #h(-0.16667em) (bb(E) #h(-0.16667em)
  [sum_(j = 0)^m U_(n \, j) thin mid(bar.v) thin cal(O)_w \( upright(bold(U))_n \)]) = m + 1 -
  cal(R)_w \( U_n \) > m + eta . $

The pointwise coordinate-cost bound from Lemma 7, with the substitution specified above,
  and this transferred gain verify both hypotheses of Proposition 4 with
  $\( r \, d \, eta \) = \( m + 1 \, m \, Q_G \/ 4 \)$. The criterion gives the signed conclusion of Theorem 1.
  Each averaging limit uses one fixed finite observation and fixed parameters.
  At that stage, the normalized batch scores have a fourth-moment bound uniform in the batch size, by (2);
  no uniformity across subsequent stages is required.

#heading(level: 1)[References]
#bibitem([1])[E. Blais, L.-Y. Tan, and A. Wan, #emph[An inequality for the Fourier spectrum of parity decision
  trees], arXiv:1506.01055v1 (2015). #link("https://arxiv.org/abs/1506.01055v1").]
#bibitem([2])[R. Durrett, #emph[Probability: Theory and Examples], fifth edition,
  Cambridge University Press, 2019. Author's Version~5, January~11, 2019,
  #link("https://sites.math.duke.edu/~rtd/PTE/PTE5_011119.pdf").]
#bibitem([3])[Y. Filmus, H. Hatami, N. Keller, and N. Lifshitz,
  On the sum of the $L_1$ influences of bounded functions, #emph[Israel Journal of Mathematics] #strong[214]
  (2016), 167--192. #link("https://doi.org/10.1007/s11856-016-1355-0"). Preprint version:
  arXiv:1404.3396v3 (2015), #link("https://arxiv.org/abs/1404.3396v3").]
#bibitem([4])[S. K. Jha, #emph[On the Sum of Linear Coefficients of a Boolean Valued Function],
  arXiv:1611.01029v2 (2016). #link("https://arxiv.org/abs/1611.01029v2").]
#bibitem([5])[S. Kudin and E. Pašalić, Proving the conjecture of O'Donnell in certain cases and disproving its
  general validity, #emph[Discrete Applied Mathematics] #strong[289] (2021), 345--353.
  #link("https://doi.org/10.1016/j.dam.2020.11.005").]
#bibitem([6])[N. Nisan and M. Szegedy, On the degree of Boolean functions as real polynomials,
  #emph[Computational Complexity] #strong[4] (1994), 301--313. #link("https://doi.org/10.1007/BF01263419").]
#bibitem([7])[R. O'Donnell, #emph[Open Problems in Analysis of Boolean Functions], arXiv:1204.6447v1 (2012), p.~9.
  #link("https://arxiv.org/abs/1204.6447v1").]
#bibitem([8])[R. O'Donnell and R. A. Servedio, Learning monotone decision trees in polynomial time,
  #emph[SIAM Journal on Computing] #strong[37] (2007), 827--844. #link("https://doi.org/10.1137/060669309").]
#bibitem([9])[Q. Wang, #emph[On a Conjecture of O'Donnell], Cryptology ePrint Archive, Report 2020/002 (2020).
  #link("https://eprint.iacr.org/2020/002").]
