#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Boundedness and persistence of \
weakly reversible mass-action systems]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Weak reversibility is a condition on the directed graph of a chemical reaction network: each reaction has a directed return path. Two central questions ask whether this condition alone prevents species extinction under mass-action kinetics and whether every positive trajectory remains bounded. We prove the joint boundedness and persistence conclusion for arbitrary positive constant reaction rates, any number of connected components in the reaction graph, and every species dimension.

=== 1.1 The problem and main result <the-problem-and-main-result>

A finite reaction network with $d gt.eq 1$ species consists of a finite set of #emph[complexes] $cal(C) subset bb(Z)_(gt.eq 0)^d$ and a set $cal(R) subset { \( y \, y' \) : y \, y' in cal(C) \, med y eq.not y' }$ of directed reactions. We write a reaction as $y arrow.r y'$. The network is #emph[weakly reversible] if, for each $y arrow.r y' in cal(R)$, there is a directed path from $y'$ to $y$. A connected component of the underlying undirected reaction graph is called a #emph[linkage class]. There is no restriction on their number. Empty reaction sets and isolated complexes are allowed.

Assign a positive constant $kappa_(y arrow.r y')$ to each reaction. The mass-action equation is

#[#set math.equation(numbering: n => "(1.1)")
 $ dot(x) = f \( x \) := sum_(y arrow.r y' in cal(R)) kappa_(y arrow.r y') x^y \( y' - y \) \, #h(2em) x^y := product_(i = 1)^d x_i^(y_i) . $ <eq:mass-action>]

Since the exponents are nonnegative integers, $f$ is a polynomial vector field. A forward trajectory in $bb(R)_(> 0)^d$ is called #emph[persistent] if

$ liminf_(t arrow.r oo) x_i \( t \) > 0 #h(2em) \( 1 lt.eq i lt.eq d \) . $

The bounds in this definition may depend on the trajectory.

#thm([Theorem 1.1.])[
  #emph[Let $d gt.eq 1$, let $cal(C) subset bb(Z)_(gt.eq 0)^d$ be finite, let $cal(R)$ be weakly reversible, and let all reaction rates be positive constants. For every $x^0 in bb(R)_(> 0)^d$, the solution of (1.1) with $x \( 0 \) = x^0$ exists for every $t gt.eq 0$. There is a number $epsilon in \( 0 \, 1 \)$, depending on the network, the rates, and $x^0$, such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ epsilon lt.eq x_i \( t \) lt.eq epsilon^(- 1) #h(2em) \( t gt.eq 0 \, med 1 lt.eq i lt.eq d \) . $ <eq:main-bounds>]

]
] <thm:main>

In particular, every positive trajectory is bounded and persistent. To relate the statement to conservation laws, put

$ S = "span"_(bb(R)) { y' - y : y arrow.r y' in cal(R) } \, #h(2em) P = \( x^0 + S \) ∩ bb(R)_(gt.eq 0)^d . $

The subspace $S$ is the #emph[stoichiometric subspace], and $P$ is the closed #emph[stoichiometric compatibility class] of $x^0$. Since $f \( x \)$ takes values in $S$, integration of the equation shows that a positive trajectory starting at $x^0$ stays in $P$. Theorem 1 applies whether or not $P$ is bounded. It therefore includes the persistence question for bounded entire compatibility classes. The estimate (1.2) also shows directly that the omega-limit set is nonempty and disjoint from the orthant boundary: every sequence of times tending to infinity has a subsequence along which the trajectory converges inside the compact positive box in (1.2). We make no assertion in this generality that the trajectory converges to an equilibrium, or that the same $epsilon$ works for all positive initial points. In particular, the theorem does not assert uniform eventual bounds over all positive initial points in a compatibility class.

The proof gives a geometric strengthening, stated precisely in Proposition 6: each $x^0 > 0$ belongs to a compact convex polytope $K subset bb(R)_(> 0)^d$ such that every solution starting in $K$ exists globally and remains in $K$. The set $K$ need not be a whole compatibility class. It is constructed in the ambient species space and may meet several such classes. Its convexity also yields a short proof of the known existence theorem of Boros #cite(label("Boros2019")): every positive stoichiometric class contains a positive equilibrium (Corollary 7).

=== 1.2 History and the role of the construction <history-and-the-role-of-the-construction>

The classical structural theory begins with complex balance. A system is #emph[complex-balanced] if it admits a positive state at which the total incoming and outgoing reaction fluxes agree at every complex. Horn and Jackson’s equilibrium and stability theory #cite(label("HornJackson1972")), Horn’s complex-balancing criteria #cite(label("Horn1972")), and Feinberg’s deficiency-zero analysis #cite(label("Feinberg1972")) provide the foundations. Weak reversibility is a property of the graph, whereas complex balance also depends on the rates. The global-attractor question for complex-balanced systems asks whether every positive trajectory converges to the unique positive equilibrium in its stoichiometric class. This convergence follows from Theorem 1 under the additional complex-balance assumption; Remark 8 gives the argument.

Feinberg #cite(label("Feinberg1987")) Remark 6.1.E formulated the weaker expectation that a positive trajectory of a weakly reversible mass-action system cannot converge to a point where a species concentration is zero. Persistence excludes approach to the boundary along any sequence of times. Anderson #cite(label("Anderson2011")) Section 1.1 separated the #emph[boundedness conjecture], that positive trajectories of weakly reversible mass-action systems are bounded, from the #emph[persistence conjecture] for bounded trajectories. Together these imply persistence without an assumed upper bound. Theorem 1 establishes both conclusions for arbitrary positive constant reaction rates.

August and Barahona #cite(label("AugustBarahona2010")) Theorem 6 previously stated the general boundedness and persistence conclusion. Their proof, Part III on page 45 before Equation (11), infers monomial dominance from a maximal sum of exponents and a sufficiently large product of concentrations. That implication does not hold throughout the stated region. In $2 A arrows.rl B$ with both rates one, the concentrations $\( a \, b \) = \( T \, T^3 \)$ satisfy $a b arrow.r oo$ but $a^2 < b$, and

$ dot(a) + dot(b) = b - a^2 = T^3 - T^2 > 0 #h(2em) \( T > 1 \) . $

This contradicts the asserted implication. It does not contradict their theorem: $a + 2 b$ is conserved in this example. Our proof controls the relevant exponent pairings separately and establishes the conclusion independently.

Several earlier results give classwise permanence or permit time-dependent rates. Here #emph[permanence] means that, for each fixed compatibility class, there is a compact subset of the positive orthant that eventually contains every positive trajectory in that class, with entry time depending on the initial state. Anderson #cite(label("Anderson2011")) proved boundedness for weakly reversible systems with a single linkage class. Gopalkrishnan, Miller, and Shiu #cite(label("GopalkrishnanMillerShiu2014")) proved permanence for the larger class of strongly endotactic systems, which includes every weakly reversible single-linkage system; Boros and Hofbauer #cite(label("BorosHofbauer2020")) gave a later proof of the single-linkage result. Craciun, Nazarov, and Pantea #cite(label("CraciunNazarovPantea2013")) proved boundedness, persistence, and permanence for two-species weakly reversible systems as part of their more general endotactic result. Pantea #cite(label("Pantea2012")) proved persistence of bounded weakly reversible trajectories when the stoichiometric subspace has dimension two, with arbitrary species and linkage counts. Two species and two-dimensional stoichiometry are different restrictions. These results also permit rates that vary in time while remaining bounded above and away from zero. Our theorem treats constant rates in all dimensions and with any number of linkage classes. Its bounds may depend on the initial point, so it does not assert the classwise uniformity of permanence.

The revised toric-differential-inclusion approach of Craciun #cite(label("Craciun2026")) Section 8, final remark, p. 81, in version 3 dated September 23, 2026, gives persistence for bounded positive trajectories of weakly reversible systems with uniformly positive and bounded variable rates. Its complex-balanced application combines the boundary construction with the Horn–Jackson Lyapunov bound. The general weakly reversible statement assumes a trajectory upper bound. Our construction supplies that bound together with persistence, through a compact convex forward-invariant polytope containing each prescribed positive initial point.

The geometric and analytical methods also have substantial antecedents. Invariant polygons and quantitative monomial comparisons appear in Craciun, Nazarov, and Pantea #cite(label("CraciunNazarovPantea2013")), and projected polyhedra in Pantea #cite(label("Pantea2012")). Anderson’s monomial tiers and return-path domination #cite(label("Anderson2011Global")), the projection and multiscale arguments of Gopalkrishnan, Miller, and Shiu #cite(label("GopalkrishnanMillerShiu2013")) #cite(label("GopalkrishnanMillerShiu2014")), and Craciun’s ordered-complex embedding into toric differential inclusions #cite(label("Craciun2019")) organize related comparisons. Our finite affine-label construction and directed-cut estimate are proved directly; none of these research results is an input to the proof.

=== 1.3 Proof overview <proof-overview>

The obstacle is to find a single finite family of linear inequalities that controls both small and large concentrations. An individual reaction need not point inward across a proposed face. Weak reversibility supplies return paths, so the inward estimate will concern the combined flux across cuts of the reaction graph. The normal of each active face must make strict comparisons that agree with the monomial sizes. Near a tie, an arbitrary approximation to a normal can reverse a comparison; the geometric construction must respect these ties.

For $0 < h < 1$ and $p in \[ - 1 \, 1 \]^d$, write

$ X_h \( p \) = \( h^(p_1) \, dots.h \, h^(p_d) \) . $

These points fill the box $B_h = \[ h \, h^(- 1) \]^d$. We construct a concave piecewise-affine function

$ F_h \( x \) = min_(lambda in Lambda) #scale(x: 120%, y: 120%)[\(] r_lambda dot.op x + c_lambda \( h \) #scale(x: 120%, y: 120%)[\)] \, $

where $Lambda$ is a finite set indexing the affine functions, and the slopes $r_lambda in \[ - 1 \, 1 \]^d$ are independent of $h$. A label $lambda$ is #emph[active] at $x$ if its affine function attains this minimum; every minimizer is active at a tie.

Lemma 2 and Corollary 3 supply the family for any positive tolerance $E : \[ - 1 \, 1 \]^d arrow.r \( 0 \, oo \)$: for all sufficiently small $h$, every label active at $X_h \( p \)$ satisfies $lr(bar.v.double p - r_lambda bar.v.double)_oo < E \( r_lambda \)$, uniformly over the cube. No continuity of $E$ is required. We can therefore make the tolerance small near the hyperplanes where a coordinate or a complex comparison vanishes, while keeping it positive on those hyperplanes. This forces each nonzero slope comparison to have the same sign as the corresponding exponent comparison, with a fixed positive gap. In particular, for some $H > 0$ independent of $h$,

$ r_lambda dot.op y < r_lambda dot.op z quad arrow.r.double quad x^z lt.eq h^H x^y #h(2em) \( x = X_h \( p \) \, med lambda upright(" active") \) . $

The parameter order is essential: first the tolerance, then the fixed finite slopes, then their positive separation $H$, and only then the final value of $h$. A finite covering by nearby slopes alone would not ensure that the slopes attaining the minimum have the required accuracy.

Order the complexes by an active slope. Across a cut between two successive distinct levels, weak reversibility supplies an upward reaction whenever there is a downward reaction. The monomial comparison makes one upward rate dominate the sum of all downward rates once $h$ is small enough. Summing over the cuts gives $r_lambda dot.op f \( x \) gt.eq 0$ for every active label. Consequently $F_h$ is nondecreasing along any trajectory segment in $B_h$. At a tie, its right derivative is the minimum of the derivatives of all active branches, so controlling a preferred active label would not suffice. Equal slope levels need not have equal monomials; edges within one level contribute zero to the normal derivative.

The coordinate comparisons force every label active at the prescribed $x^0$ to have slope zero when $h$ is sufficiently small. Fixing such a label gives a constant branch with value $M = F_h \( x^0 \)$ and hence the global bound $F_h lt.eq M$. The maximum set

$ K = { x in bb(R)^d : F_h \( x \) = M } $

is an intersection of finitely many closed affine half-spaces and contains $x^0$. A zero slope cannot be active on $partial B_h$, so $K$ misses that boundary. Convexity now places all of $K$ inside $B_h$: a segment from $x^0$ to any point outside the box would meet its boundary. Thus $K$ is a compact positive polytope. Along a solution starting in $K$, nondecrease of $F_h$ and the ceiling $M$ force the solution to remain in the maximum set. A first-exit argument and compact continuation prove invariance and global existence, giving the trajectory bounds. No active-label estimate outside $B_h$ is needed.

Section 2 proves the approximation lemma by induction on dimension and finite gluing over the minimum exponent, then obtains its uniform form. Section 3 imposes the sign constraints, proves the cut and derivative estimates, constructs the invariant polytope, and deduces the trajectory bounds, positive-equilibrium existence and complex-balanced convergence.

== 2 Affine labels with a prescribed tolerance <sec:affine>

We construct a finite minimum of affine functions whose minimizing slopes approximate the exponents of a positive point. The permitted error is prescribed separately at each slope. Allowing this prescription to be discontinuous will let us impose sign conditions on finitely many linear forms in the application.

For an integer $m gt.eq 1$, $u in bb(R)^m$, and $0 < h < 1$, write

$ X_h \( u \) = \( h^(u_1) \, dots.h \, h^(u_m) \) . $

A #emph[label] is a pair $\( r \, c \)$ consisting of a vector $r in bb(R)^m$, independent of $h$, and a real-valued offset $c \( h \)$ defined for all sufficiently small positive $h$. For a finite nonempty family $Lambda$ of labels, write its members as $lambda = \( r_lambda \, c_lambda \)$. For fixed sufficiently small $h > 0$ and $x in bb(R)^m$, a label $lambda in Lambda$ is #emph[active at $x$] if

$ r_lambda dot.op x + c_lambda \( h \) = min_(eta in Lambda) #scale(x: 120%, y: 120%)[\(] r_eta dot.op x + c_eta \( h \) #scale(x: 120%, y: 120%)[\)] . $

Thus every minimizing label is active when a tie occurs. Whenever finitely many families are combined, we restrict their offsets to a common interval $0 < h < h_(*)$ on which they are all defined.

#thm([Lemma 2.1.])[
  (Affine approximation with arbitrary tolerance).  #emph[Let $m gt.eq 1$ be an integer, let $a < b$ be real numbers, and let $E : \[ a \, b \]^m arrow.r \( 0 \, oo \)$ be any function. There is a finite nonempty family $Lambda$ of labels $lambda = \( r_lambda \, c_lambda \)$, with $r_lambda in \[ a \, b \]^m$ and $c_lambda \( h \) = o \( h^a \)$ as $h arrow.r 0 +$, such that the following holds. For every sequence $h_nu arrow.r 0 +$ and every sequence $p^nu in bb(R)^m$ converging to $p in \[ a \, b \]^m$, if a fixed label $lambda in Lambda$ is active at $X_(h_nu) \( p^nu \)$ for every $nu$, then 
$ lr(bar.v.double p - r_lambda bar.v.double)_oo < E \( r_lambda \) . $

 No regularity of $E$ is assumed, and the approximating vectors $p^nu$ need not belong to $\[ a \, b \]^m$.]
] <lem:affine>

Two aspects of the statement will be used separately. The slopes form a fixed finite set, rather than a set that changes with $h$. Also, the conclusion concerns every label that stays active along a sequence, including labels tied with other minimizers. The freedom for $p^nu$ to leave the cube is needed by the induction: a projected sequence may approach a face of a smaller cube from either side.

#proof[
  We induct on $m$, using only positive dimensions smaller than $m$. The largest coordinate of $X_h \( p \)$ is $h^(min_i p_i)$, so we first construct a family for each fixed value of the smallest exponent. Within that family, negative offsets compensate for raising slope entries on the smaller coordinates of $X_h \( p \)$. Compactness extends the family’s guarantee to nearby minimum values, and a finite interval construction then selects among these families. When $m = 1$, the first step uses singleton families and invokes no induction hypothesis; the remaining steps therefore also establish the base case.
  #emph[Step 1: construction at a fixed minimum.] Set $mu \( u \) = min_i u_i$, write $upright(bold(1)) = \( 1 \, dots.h \, 1 \)$, and fix $t in \[ a \, b \]$. We will construct a finite family $Lambda_t$ whose slopes all satisfy $mu \( r \) = t$, containing $\( t upright(bold(1)) \, 0 \)$, with the following property: the conclusion of the lemma holds for activity within $Lambda_t$ whenever the limiting vector $p in \[ a \, b \]^m$ satisfies $mu \( p \) = t$.
  If $m = 1$ or $t = b$, take $Lambda_t = { \( t upright(bold(1)) \, 0 \) }$. In either case, a limit in the cube with minimum $t$ must equal $t upright(bold(1))$, so the asserted property holds. Assume henceforth in this construction that $m > 1$ and $t < b$.
  A label has #emph[type $k$] if precisely $k$ entries of its slope are strictly greater than $t$, with all other entries equal to $t$. Type $0$ consists of $\( t upright(bold(1)) \, 0 \)$. Construct types $k = 1 \, dots.h \, m - 1$ in increasing order. After type $k - 1$ has been constructed, choose $beta_k$ so that
  $ t < beta_k < b \, #h(2em) beta_k < beta_(k - 1) quad upright("if ") k > 1 \,\
beta_k - t < E \( r \) quad upright("for every slope ") r upright(" of type ") k - 1 upright(".") $
  The already constructed type has finitely many slopes, and its tolerance values are all positive, so such a choice is possible. Only those finitely many values are compared; we do not take a positive lower bound for $E$ on an entire cube.
  For each $k$-element subset $U subset { 1 \, dots.h \, m }$ and each $s in \[ beta_k \, b \]^U$, let $r \( s \) in \[ a \, b \]^m$ have entries $s$ on $U$ and $t$ off $U$. Apply the induction hypothesis in dimension $k$ to $\[ beta_k \, b \]^U$, with tolerance $s mapsto E \( r \( s \) \)$; the coordinates of $U$ are taken in their natural order. For every resulting label $\( s \, d \)$, where $d \( h \) = o \( h^(beta_k) \)$, put the label
  $ r = r \( s \) \, #h(2em) c \( h \) = - h^(beta_k) + d \( h \) $
  in type $k$. Taking all such coordinate sets and types gives a finite nonempty family $Lambda_t$. Each of its offsets is $o \( h^t \)$. The negative term $- h^(beta_k)$ favors raising slope entries when the corresponding coordinates of $x$ are small relative to $h^t$; the decreasing $beta_k$ make this preference stronger at each successive type.
  #emph[Step 2: verification at the fixed minimum.] For the construction with $m > 1$ and $t < b$, suppose $h_nu arrow.r 0 +$, $p^nu arrow.r p in \[ a \, b \]^m$, and $mu \( p \) = t$. Fix a label $\( r \, c \)$ of type $k$ that is active within $Lambda_t$ along this sequence, and let $U$ be its set of raised coordinates. All asymptotic comparisons in this verification are along the sequence, and we write $h = h_nu$. Whenever a limiting exponent is strictly above or below a threshold, convergence leaves a fixed positive exponent gap for all large $nu$. We use these gaps, not a replacement of $h^(p_i^nu)$ by $h^(p_i)$: convergence of the exponents alone would not justify that replacement.
  If $k > 0$, comparison with $\( t upright(bold(1)) \, 0 \)$ gives
  $ sum_(i in U) \( r_i - t \) h^(p_i^nu) lt.eq h^(beta_k) - d \( h \) = \( 1 + o \( 1 \) \) h^(beta_k) . $
  Every coefficient on the left is at least $beta_k - t > 0$. If some $p_i < beta_k$ for $i in U$, then, for a fixed $delta > 0$ and all sufficiently large $nu$, $p_i^nu lt.eq beta_k - delta$; dividing the display by $h^(beta_k)$ would yield a term tending to infinity. Consequently
  $ p_i gt.eq beta_k quad \( i in U \) . $
  Among labels constructed from this same $U$, the contributions off $U$ and the offset $- h^(beta_k)$ are common. Thus $\( s \, d \)$ is active in the family supplied by induction. Its limiting exponent vector belongs to $\[ beta_k \, b \]^U$, so the induction hypothesis yields
  $ max_(i in U) \| p_i - r_i \| < E \( r \) . $
  This is precisely where unrestricted approximating vectors are needed: $p_U^nu$ may lie outside $\[ beta_k \, b \]^U$ even though its limit lies inside that cube. In particular, no strict inequality is required when a limiting coordinate equals $beta_k$ or $b$.
  We next control the coordinates off $U$, including type $0$ by taking $U = diameter$. Suppose $k < m - 1$. We claim that
  $ p_i lt.eq beta_(k + 1) quad \( i in.not U \) . $
  If instead $p_j > beta_(k + 1)$ for some $j in.not U$, then every limiting exponent on $U union { j }$ is strictly greater than $beta_(k + 1)$. For $k > 0$, this uses $p_i gt.eq beta_k > beta_(k + 1)$ on $U$; for $k = 0$ there are no such coordinates to check. Choose any type $k + 1$ label whose raised set is $U union { j }$. Its affine value minus the value of $\( t upright(bold(1)) \, 0 \)$ is
  $ - h^(beta_(k + 1)) + o \( h^(beta_(k + 1)) \) \, $
  because $h^(p_i^nu) = o \( h^(beta_(k + 1)) \)$ on every raised coordinate. The corresponding difference for the supposed active label is zero if $k = 0$, and is bounded below by $- h^(beta_k) + o \( h^(beta_k) \)$ if $k > 0$. Since $h^(beta_k) = o \( h^(beta_(k + 1)) \)$ in the latter case, the chosen competitor has a strictly smaller value for all sufficiently large $nu$, a contradiction. This proves the claim. Because $p_i gt.eq t$ and $r_i = t$ off $U$, it follows that
  $ \| p_i - r_i \| lt.eq beta_(k + 1) - t < E \( r \) quad \( i in.not U \) \, $
  where the strict inequality was imposed when constructing type $k + 1$.
  If instead $k = m - 1$, the sole coordinate off $U$ has limiting exponent exactly $t$: all coordinates on $U$ have exponent at least $beta_k > t$, and $mu \( p \) = t$. Its error is therefore zero. Combining the bounds proves $lr(bar.v.double p - r bar.v.double)_oo < E \( r \)$ in all cases, including types $0$ and $m - 1$. No strictness was required at a threshold $p_i = beta_k$.
  #emph[Step 3: extension to nearby minima.] Keep $t$ and its finite family $Lambda_t$ fixed. For a label $lambda = \( r \, c \)$ in that family, let $A_lambda subset \[ a \, b \]^m$ be the set of all limits of sequences $p^nu in bb(R)^m$ for which $h_nu arrow.r 0 +$ and $lambda$ is active within $Lambda_t$ at $X_(h_nu) \( p^nu \)$. This set is closed. Indeed, if $z_n in A_lambda$ and $z_n arrow.r z$, choose from a realizing sequence for $z_n$ a point $u_n$ and parameter $h_n$ such that
  $ 0 < h_n < 1 \/ n \, #h(2em) lr(bar.v.double u_n - z_n bar.v.double)_oo < 1 \/ n \, $
  and $lambda$ is active at $X_(h_n) \( u_n \)$. Then $u_n arrow.r z$, so $z in A_lambda$. This diagonal selection uses actual active points; it does not pass activity through a continuity assertion about $c \( h \)$.
  The set
  $ B_t = union.big_(lambda = \( r \, c \) in Lambda_t) { p in A_lambda : lr(bar.v.double p - r bar.v.double)_oo gt.eq E \( r \) #scale(x: 120%, y: 120%)[}] $
  is therefore compact. Here each $E \( r \)$ is a fixed real number; continuity of $E$ is unnecessary. The fixed-minimum verification shows that $B_t$ contains no point with $mu \( p \) = t$. Since $mu$ is continuous, there is $rho_t > 0$ such that $B_t$ contains no point with
  $ mu \( p \) in I_t := \( t - rho_t \, t + rho_t \) . $
  For example, if $B_t$ is nonempty, take $rho_t$ smaller than the positive minimum of $\| mu \( p \) - t \|$ on $B_t$; if it is empty, any positive radius initially suffices. Thus the limiting active-label conclusion holds whenever $p in \[ a \, b \]^m$ and $mu \( p \) in I_t$.
  Shrink $rho_t$, if necessary, so that every local offset also satisfies
  #[#set math.equation(numbering: n => "(2.1)")
   $ c \( h \) = o \( h^(t + rho_t) \) . $ <eq:affine-local-decay>]
  For a nonsingleton family it suffices to require $t + rho_t < min_(1 lt.eq k lt.eq m - 1) beta_k$; for a singleton family the offset is zero. The stronger decay uses the constructed form $c \( h \) = - h^(beta_k) + o \( h^(beta_k) \)$ with $beta_k > t$; it would not follow from $c \( h \) = o \( h^t \)$ alone. Shrinking the radius preserves the guarantee just proved. We have now obtained the desired approximation near every possible value of $mu \( p \)$. It remains to make a finite combined family select an appropriate one of these neighborhoods.
  #emph[Step 4: finite interval construction and combination.] The local families already approximate correctly near their own minimum levels. We now give each family a common offset shift so that a globally active label must come from a suitable neighborhood. The overlap between neighboring neighborhoods is important: it permits equality at the transition cuts.
  Choose a finite subcover of $\[ a \, b \]$ from the intervals $I_t$. Remove intervals contained in another selected interval, retaining one copy if two coincide. Order the remaining centers as $a lt.eq t_1 < dots.h.c < t_N lt.eq b$, and write $I_(t_j) = \( L_j \, R_j \)$. Noncontainment forces the orders of the left and right endpoints to agree; since $t_j = \( L_j + R_j \) \/ 2$, both orders agree with that of the centers. Hence
  $ L_1 < dots.h.c < L_N \, #h(2em) R_1 < dots.h.c < R_N . $
  Successive intervals overlap. Otherwise $R_j lt.eq L_(j + 1)$, and a point of $\[ R_j \, L_(j + 1) \] subset \( t_j \, t_(j + 1) \)$ would be covered by none of the selected intervals. The first interval contains $a$ and the last contains $b$, by the endpoint orders, coverage, and the fact that all centers lie in $\[ a \, b \]$.
  For $1 lt.eq j < N$, choose
  $ q_j in #scale(x: 120%, y: 120%)[\(] max { t_j \, L_(j + 1) } \, thin min { t_(j + 1) \, R_j } #scale(x: 120%, y: 120%)[\)] . $
  This open interval is nonempty: the two intervals overlap, each contains its own center, and $t_j < t_(j + 1)$. Thus $q_j$ belongs to both adjacent intervals and lies strictly between their centers. Setting $q_0 = a$ and $q_N = b$, we obtain
  #[#set math.equation(numbering: n => "(2.2)")
   $ t_j < q_j < t_(j + 1) quad \( 1 lt.eq j < N \) \, #h(2em) \[ q_(j - 1) \, q_j \] subset I_(t_j) quad \( 1 lt.eq j lt.eq N \) . $ <eq:affine-cuts>]
  If $N = 1$, no cuts are needed and the sole selected interval contains the whole of $\[ a \, b \]$.
  Take the union of the selected families, replacing every offset $c \( h \)$ at level $t_j$ by
  #[#set math.equation(numbering: n => "(2.3)")
   $ tilde(c) \( h \) = c \( h \) - sum_(ell = 1)^(j - 1) h^(q_ell) . $ <eq:affine-shifts>]
  The empty sum at $j = 1$ is zero. Every new offset is $o \( h^a \)$: Equation (2.1) applies with $t_j + rho_(t_j) > a$, and every shift exponent satisfies $q_ell > t_ell gt.eq a$. Within a local family this common shift does not change activity. Between adjacent families the new term $- h^(q_j)$ selects the family on the appropriate side of the cut. Figure 1 shows the interval cover and the closed cut cells assigned to the selected families.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-1.144, 0), (10.12, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.12, 0), [#text(size: 9pt)[$mu (p)$]], anchor: "west", padding: 0.1176cm)
  line((3.344, 0.15), (3.344, 2.588), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((5.456, 0.15), (5.456, 2.588), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-0.88, 2.25), (4.4, 2.25), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  line((0, 2.25), (3.344, 2.25), stroke: (paint: rgb("#0000a6"), thickness: 4.0pt, miter-limit: 10))
  line((2.112, 1.5), (6.688, 1.5), stroke: (thickness: 1.0pt, miter-limit: 10))
  line((3.344, 1.5), (5.456, 1.5), stroke: (thickness: 4.0pt, miter-limit: 10))
  line((4.4, 0.75), (9.68, 0.75), stroke: (thickness: 1.0pt, miter-limit: 10))
  line((5.456, 0.75), (8.8, 0.75), stroke: (thickness: 4.0pt, miter-limit: 10))
  circle((-0.88, 2.25), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((4.4, 2.25), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((2.112, 1.5), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.688, 1.5), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((4.4, 0.75), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((9.68, 0.75), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.76, 2.25), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((4.4, 1.5), radius: 0.07056, fill: black, stroke: none)
  circle((7.04, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((1.76, 2.34), [#text(size: 9pt)[$I_(t_1)$]], anchor: "south", padding: 0.1176cm)
  content((4.4, 1.59), [#text(size: 9pt)[$I_(t_2)$]], anchor: "south", padding: 0.1176cm)
  content((7.04, 0.84), [#text(size: 9pt)[$I_(t_3)$]], anchor: "south", padding: 0.1176cm)
  line((0, 0.06), (0, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.06), [#text(size: 9pt)[$a=q_0$]], anchor: "north", padding: 0.1176cm)
  line((1.76, 0.06), (1.76, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.76, -0.06), [#text(size: 9pt)[$t_1$]], anchor: "north", padding: 0.1176cm)
  line((3.344, 0.06), (3.344, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.344, -0.06), [#text(size: 9pt)[$q_1$]], anchor: "north", padding: 0.1176cm)
  line((4.4, 0.06), (4.4, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.4, -0.06), [#text(size: 9pt)[$t_2$]], anchor: "north", padding: 0.1176cm)
  line((5.456, 0.06), (5.456, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.456, -0.06), [#text(size: 9pt)[$q_2$]], anchor: "north", padding: 0.1176cm)
  line((7.04, 0.06), (7.04, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.04, -0.06), [#text(size: 9pt)[$t_3$]], anchor: "north", padding: 0.1176cm)
  line((8.8, 0.06), (8.8, -0.06), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.8, -0.06), [#text(size: 9pt)[$b=q_3$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Finite gluing, schematically with three selected families. The open intervals $I_(t_j)$ are the neighborhoods where the local families approximate correctly. Each thick closed segment $\[ q_(j - 1) \, q_j \]$ lies strictly inside its corresponding open interval. For a label from family $j$ that stays active along a convergent sequence, the common shifts in (2.3) force the limiting exponent minimum $mu \( p \)$ into that closed segment. Either adjacent family remains valid when $mu \( p \)$ equals a cut. ],
  ) <fig:interval-gluing>
  Suppose a fixed label from level $t_j$ is active in this combined family along $h_nu arrow.r 0 +$ and $p^nu arrow.r p in \[ a \, b \]^m$. Write $c \( h \)$ for its original local offset and again abbreviate $h = h_nu$. We claim
  $ q_(j - 1) lt.eq mu \( p \) lt.eq q_j . $
  If $j < N$ and $mu \( p \) > q_j$, every $h^(p_i^nu)$ is $o \( h^(q_j) \)$. The local offset is also $o \( h^(q_j) \)$, by Equation (2.1) and $q_j in I_(t_j)$. Subtracting the value of the label $\( t_(j + 1) upright(bold(1)) \, 0 \)$ with its shift, the value difference is
  $ \( r - t_(j + 1) upright(bold(1)) \) dot.op X_h \( p^nu \) + c \( h \) + h^(q_j) = h^(q_j) + o \( h^(q_j) \) > 0 $
  for all sufficiently large $nu$, contradicting activity.
  If $j > 1$ and $mu \( p \) < q_(j - 1)$, subtract instead the shifted label $\( t_(j - 1) upright(bold(1)) \, 0 \)$. The difference is
  $ \( r - t_(j - 1) upright(bold(1)) \) dot.op X_h \( p^nu \) + c \( h \) - h^(q_(j - 1)) . $
  Every coefficient in the scalar product is at least $t_j - t_(j - 1) > 0$. For some coordinate $i$, $p_i < q_(j - 1)$, so $h^(p_i^nu) \/ h^(q_(j - 1)) arrow.r oo$. On the other hand, $c \( h \) = o \( h^(q_(j - 1)) \)$ because $q_(j - 1) < t_j < t_j + rho_(t_j)$. The displayed difference divided by $h^(q_(j - 1))$ therefore tends to $+ oo$, again contradicting activity. The outer bounds when $j = 1$ or $j = N$ follow from $mu \( p \) in \[ a \, b \]$.
  By Equation (2.2), the claimed bounds imply $mu \( p \) in I_(t_j)$, including equality at either cut. A label active in the combined family is active within its original local family, since all labels at that level received the same shift. The guarantee for $I_(t_j)$ now gives $lr(bar.v.double p - r bar.v.double)_oo < E \( r \)$. All contradictions above produced a strictly smaller competing value, so the argument applies to every active label even at ties. This completes the induction. ◻
]

The sequential conclusion gives a uniform estimate on the entire cube, with the same fixed finite family. This is the form used for reaction networks.

#thm([Corollary 2.2.])[
  (Uniform activity bound).  #emph[Let $m gt.eq 1$, $a < b$, and $E : \[ a \, b \]^m arrow.r \( 0 \, oo \)$ be as in Lemma 2. Fix a finite nonempty family ${ \( r_lambda \, c_lambda \) : lambda in Lambda }$ supplied by that Lemma. There is $h_0 > 0$ such that, for every $0 < h < h_0$ and every $p in \[ a \, b \]^m$, each label active at $X_h \( p \)$ satisfies 
$ lr(bar.v.double p - r_lambda bar.v.double)_oo < E \( r_lambda \) . $

 The family is fixed before $h_0$ is chosen.]
] <cor:uniform-affine>

#proof[
  Otherwise there are $h_nu arrow.r 0 +$, points $p^nu in \[ a \, b \]^m$, and labels $lambda_nu$ active at $X_(h_nu) \( p^nu \)$ for which
  $ lr(bar.v.double p^nu - r_(lambda_nu) bar.v.double)_oo gt.eq E \( r_(lambda_nu) \) . $
  By finiteness of $Lambda$ and compactness of $\[ a \, b \]^m$, a subsequence has a fixed label $lambda_nu = lambda$ and $p^nu arrow.r p in \[ a \, b \]^m$. Passing to the limit in the displayed inequality contradicts the strict inequality in Lemma 2. The value $E \( r_lambda \)$ is fixed on this subsequence, so no regularity of $E$ is used. ◻
]

In Section 3, we choose the tolerance so that every nonzero dot product of an active slope with a prescribed vector forces the exponent vector to have a dot product of the same sign. The freedom to choose a discontinuous $E$ permits this requirement near the corresponding hyperplanes.

== 3 From affine labels to persistent trajectories <sec:dynamics>

We now apply Lemma 2 to the mass-action vector field. Its uniform form in Corollary 3 lets us choose the tolerance so that every strict ordering made by an active slope gives a monomial comparison with a definite gap. Weak reversibility converts those comparisons into nonnegative derivatives, and an initially active constant branch supplies the compact set that traps the trajectory.

=== 3.1 Uniform approximation and sign constraints <uniform-approximation-and-sign-constraints>

Fix henceforth a network, positive rate constants, and $x^0 in bb(R)_(> 0)^d$ as in Theorem 1. Write $e_1 \, dots.h \, e_d$ for the standard basis of $bb(R)^d$, and set

#[#set math.equation(numbering: n => "(3.1)")
 $ D = { e_1 \, dots.h \, e_d } union { z - y : y \, z in cal(C) \, med y eq.not z } . $ <eq:comparison-directions>]

Every vector in $D$ is nonzero. We include differences of #emph[all] pairs of complexes, not only reaction vectors. The flux comparison below compares the source of one upward reaction with the sources of every downward reaction. Such sources need not be adjacent in the reaction graph and may even belong to different linkage classes.

For $r in \[ - 1 \, 1 \]^d$, define

#[#set math.equation(numbering: n => "(3.2)")
 $ E \( r \) = min ({1 / 2} union {frac(\| r dot.op v \|, 2 lr(bar.v.double v bar.v.double)_1) : v in D \, med r dot.op v eq.not 0}) \, #h(2em) lr(bar.v.double v bar.v.double)_1 = sum_(i = 1)^d \| v_i \| . $ <eq:chosen-tolerance>]

This is a positive number for every $r$, since the displayed minimum is over a finite nonempty set of positive numbers; in particular, $E \( 0 \) = 1 \/ 2$. The definition is allowed to be discontinuous at the hyperplanes $r dot.op v = 0$. This is the reason for allowing arbitrary positive tolerances in Lemma 2.

Apply that Lemma with $m = d$, $a = - 1$, $b = 1$, and the tolerance (3.2). Denote its fixed family by ${ \( r_lambda \, c_lambda \) : lambda in Lambda }$ and put

$ F_h \( x \) = min_(lambda in Lambda) #scale(x: 120%, y: 120%)[\(] r_lambda dot.op x + c_lambda \( h \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( x in bb(R)^d \) . $

Choose $h_0 in \( 0 \, 1 \)$ small enough that all offsets are defined and Corollary 3 applies for $0 < h < h_0$. Before choosing a particular $h$, define

#[#set math.equation(numbering: n => "(3.3)")
 $ H = min ({ 1 } union {1 / 2 \| r_lambda dot.op v \| : lambda in Lambda \, med v in D \, med r_lambda dot.op v eq.not 0}) > 0 . $ <eq:fixed-gap>]

The positivity of $H$ again follows from finiteness. Both the slopes and $H$ are independent of the eventual choice of $h$. Thus the order of choices is

$ D med arrow.r med E med arrow.r med Lambda med arrow.r med \( h_0 \, H \) med arrow.r med h . $

In particular, $H$ is not a separation parameter that is allowed to tend to zero together with $h$.

Suppose that $0 < h < h_0$, $p in \[ - 1 \, 1 \]^d$, and $lambda$ is active at $X_h \( p \)$. For every $v in D$ with $r_lambda dot.op v eq.not 0$, we have

$ \| \( p - r_lambda \) dot.op v \| & lt.eq lr(bar.v.double p - r_lambda bar.v.double)_oo lr(bar.v.double v bar.v.double)_1\
 & < E \( r_lambda \) lr(bar.v.double v bar.v.double)_1 lt.eq 1 / 2 \| r_lambda dot.op v \| . $

Consequently,

#[#set math.equation(numbering: n => "(3.4)")
 $ "sgn" \( p dot.op v \) = "sgn" \( r_lambda dot.op v \) \, #h(2em) \| p dot.op v \| gt.eq H . $ <eq:sign-and-gap>]

In particular, $\| p dot.op v \| < H$ forces $r_lambda dot.op v = 0$. Thus a comparison too close to a tie in exponent space is made an exact tie by the active slope. The converse is not required: equal slope levels may contain complexes with different monomial values. For $x = X_h \( p \)$ and any $y \, z in cal(C)$, this implies

#[#set math.equation(numbering: n => "(3.5)")
 $ r_lambda dot.op y < r_lambda dot.op z quad arrow.r.double quad x^z lt.eq h^H x^y . $ <eq:monomial-order>]

Indeed, $z - y in D$ and $p dot.op \( z - y \) gt.eq H$, while $x^z \/ x^y = h^(p dot.op \( z - y \))$ and $0 < h < 1$.

We can now fix a single $h in \( 0 \, h_0 \)$ satisfying

#[#set math.equation(numbering: n => "(3.6)")
 $ p_i^0 = frac(log x_i^0, log h) \, #h(2em) lr(bar.v.double p^0 bar.v.double)_oo < H \, $ <eq:initial-exponents>]

and, when $cal(R) eq.not diameter$, also satisfying

#[#set math.equation(numbering: n => "(3.7)")
 $ h^H sum_(e in cal(R)) kappa_e < min_(e in cal(R)) kappa_e . $ <eq:rate-separation>]

This choice is possible because $p^0 arrow.r 0$ and $h^H arrow.r 0$ as $h arrow.r 0 +$, with $H > 0$ already fixed. No minimum of reaction rates is needed when $cal(R)$ is empty. Write

$ B_h = \[ h \, h^(- 1) \]^d \, #h(2em) F = F_h . $

Since $H lt.eq 1$, Equation (3.6) places $x^0$ in the interior of $B_h$.

Every label active at $x^0$ has slope zero. In fact, if its $i$th slope coordinate were nonzero, Equation (3.4) applied to $v = e_i$ would give $\| p_i^0 \| gt.eq H$, contradicting (3.6). The finite nonempty family has at least one active label; fix such a label $lambda_0$ and put $M = F \( x^0 \)$. Then

#[#set math.equation(numbering: n => "(3.8)")
 $ r_(lambda_0) = 0 \, #h(2em) M = F \( x^0 \) = c_(lambda_0) \( h \) \, #h(2em) F \( x \) lt.eq M quad \( x in bb(R)^d \) . $ <eq:ceiling>]

Thus a constant branch is forced by the sign constraints, even though it was not prescribed in the application of Lemma 2.

There is no point $x in partial B_h$ at which $F \( x \) = M$. To see this, write $x = X_h \( p \)$ with $p in \[ - 1 \, 1 \]^d$. The boundary condition is $lr(bar.v.double p bar.v.double)_oo = 1$. Equality $F \( x \) = M$ would make $lambda_0$ active, so Corollary 3 would instead give $lr(bar.v.double p bar.v.double)_oo < E \( 0 \) = 1 \/ 2$. We have proved

#[#set math.equation(numbering: n => "(3.9)")
 $ { x in B_h : F \( x \) = M } ∩ partial B_h = diameter . $ <eq:no-boundary-plateau>]

Thus the maximum set ${ F = M }$ contains $x^0$ and misses $partial B_h$. To prove its invariance, we next show that a trajectory segment in $B_h$ cannot decrease $F$. The constant branch alone does not prove this: another branch tied with it might otherwise become smaller. We must control the derivatives of all active branches. The next two arguments establish that control from weak reversibility.

=== 3.2 Flux across the ordered complex levels <flux-across-the-ordered-complex-levels>

The following finite graph statement isolates the role of weak reversibility. Its weights will be the monomials $x^y$, and its levels will be the scalar products $r_lambda dot.op y$.

#thm([Lemma 3.1.])[
  (Flux across level cuts).  #emph[Let $V$ be a finite set and $cal(E)$ a finite set of directed edges with source and target maps $s \, t : cal(E) arrow.r V$. Suppose that for every edge there is a directed path from its target back to its source. Let $a : V arrow.r bb(R)$, let $w_v > 0$ for $v in V$, and let $kappa_e > 0$ for $e in cal(E)$. Assume that there is $delta > 0$ such that 
#[#set math.equation(numbering: n => "(3.10)")
 $ a \( u \) < a \( z \) quad arrow.r.double quad w_z lt.eq delta w_u #h(2em) \( u \, z in V \) . $ <eq:abstract-weight-order>]

 If $cal(E) eq.not diameter$, assume in addition that 
$ delta sum_(e in cal(E)) kappa_e < min_(e in cal(E)) kappa_e . $

 Then 
$ sum_(e in cal(E)) kappa_e w_(s \( e \)) #scale(x: 120%, y: 120%)[\(] a \( t \( e \) \) - a \( s \( e \) \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $

]
] <lem:cut-flux>

#proof[
  The sum is zero if $cal(E)$ is empty, including the case of an empty vertex set. Otherwise list the distinct values of $a$ as $alpha_1 < dots.h.c < alpha_q$. For $1 lt.eq j < q$, let
  $ V_j^(-) = { v in V : a \( v \) lt.eq alpha_j } \, #h(2em) V_j^(+) = V \\ V_j^(-) . $
  Let $cal(E)_j^(+)$ consist of edges from $V_j^(-)$ to $V_j^(+)$ and $cal(E)_j^(-)$ of edges in the reverse direction. Define their net upward flux by
  $ Q_j = sum_(e in cal(E)_j^(+)) kappa_e w_(s \( e \)) - sum_(e in cal(E)_j^(-)) kappa_e w_(s \( e \)) . $
  If $cal(E)_j^(-) eq.not diameter$, take one of its edges. Its return path starts in $V_j^(-)$ and ends in $V_j^(+)$, so that path contains an edge $e_0 in cal(E)_j^(+)$. Put $u = s \( e_0 \)$. Every source $z$ of an edge in $cal(E)_j^(-)$ satisfies $a \( z \) > a \( u \)$, and hence
  $ sum_(e in cal(E)_j^(-)) kappa_e w_(s \( e \)) & lt.eq delta w_u sum_(e in cal(E)_j^(-)) kappa_e\
 & lt.eq delta w_u sum_(e in cal(E)) kappa_e < w_u min_(e in cal(E)) kappa_e lt.eq kappa_(e_0) w_u . $
  It follows that $Q_j > 0$. If $cal(E)_j^(-)$ is empty, then $Q_j gt.eq 0$ directly. Notice that the selected edge $e_0$ need not share a component with every downward edge. The all-pairs hypothesis (3.10) is what permits one upward contribution to dominate the entire downward sum in this proof.
  For each edge, its level difference is the signed sum of the gaps $alpha_(j + 1) - alpha_j$ over the cuts it crosses. Summing this identity over the finite edge set gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ sum_(e in cal(E)) kappa_e w_(s \( e \)) #scale(x: 120%, y: 120%)[\(] a \( t \( e \) \) - a \( s \( e \) \) #scale(x: 120%, y: 120%)[\)] = sum_(j = 1)^(q - 1) \( alpha_(j + 1) - alpha_j \) Q_j gt.eq 0 . $ <eq:cut-decomposition>]
  When $q = 1$, both sides vanish. Equal vertex levels therefore cause no difficulty, and no connectedness assumption has entered the argument. ◻
]

Return-path monomial domination appears in Anderson’s tier argument #cite(label("Anderson2011Global")) Lemma 4.7, and quantitative inward reaction estimates underlie the invariant polygons of Craciun, Nazarov, and Pantea #cite(label("CraciunNazarovPantea2013")). Ordered-cut regrouping also appears in the proof of Craciun’s toric-inclusion embedding theorem #cite(label("Craciun2019")) preprint, Theorem 4.1. Lemma 4 uses a direct finite estimate: one upward edge dominates the full downward flux. No tier extraction, cycle decomposition, or differential inclusion is required in the proof above.

For any $x in B_h$ and any label $lambda$ active at $x$, apply Lemma 4 with

$ V = cal(C) \, quad cal(E) = cal(R) \, quad a \( y \) = r_lambda dot.op y \, quad w_y = x^y \, quad delta = h^H . $

The return paths are supplied by weak reversibility, Equation (3.5) supplies (3.10), and Equation (3.7) supplies the rate inequality when there are reactions. Thus

#[#set math.equation(numbering: n => "(3.12)")
 $ r_lambda dot.op f \( x \) = sum_(y arrow.r y' in cal(R)) kappa_(y arrow.r y') x^y thin r_lambda dot.op \( y' - y \) gt.eq 0 #h(2em) \( x in B_h \, med lambda upright(" active at ") x \) . $ <eq:active-nondecrease>]

This includes $f = 0$ for an empty reaction set. The comparison in (3.10) is required for all ordered vertex pairs, including nonadjacent pairs in one component and pairs in different components; this explains the full set of complex differences in (3.1).

=== 3.3 Derivatives of finite affine minima <derivatives-of-finite-affine-minima>

Although $F$ need not be differentiable where its active labels change, its right derivative along a differentiable curve is explicit. We record the finite-affine minimum case of the classical active-branch directional-derivative principle; see, for example, Bertsekas #cite(label("Bertsekas2009")) Proposition A.3.2(a) for the corresponding maximum formula. The short proof includes all ties and the monotonicity implication needed here.

#thm([Lemma 3.2.])[
  (Right derivative of a finite affine minimum).  #emph[Let $I$ be a finite nonempty index set, let $b_i in bb(R)^d$ and $d_i in bb(R)$ for $i in I$, and define 
$ Phi \( x \) = min_(i in I) \( b_i dot.op x + d_i \) \, #h(2em) A \( x \) = { i in I : b_i dot.op x + d_i = Phi \( x \) } . $

 For a continuously differentiable curve $gamma : \[ u \, v \] arrow.r bb(R)^d$, the right derivative at every $tau in \[ u \, v \)$ exists and is 
$ frac(d^(+), d tau) Phi \( gamma \( tau \) \) = min_(i in A \( gamma \( tau \) \)) b_i dot.op gamma' \( tau \) . $

 If $b_i dot.op gamma' \( tau \) gt.eq 0$ for every $tau in \[ u \, v \)$ and every $i in A \( gamma \( tau \) \)$, then $Phi compose gamma$ is nondecreasing on $\[ u \, v \]$.]
] <lem:minimum-derivative>

#proof[
  Fix $tau < v$. Each inactive branch has a strictly positive gap above any chosen active branch at $gamma \( tau \)$. By continuity and finiteness, every inactive branch stays above that chosen branch at $gamma \( tau + eta \)$ for sufficiently small $eta gt.eq 0$. For the remaining branches, the first-order expansions, uniform over the finite active set, give
  $ Phi \( gamma \( tau + eta \) \) = Phi \( gamma \( tau \) \) + eta min_(i in A \( gamma \( tau \) \)) b_i dot.op gamma' \( tau \) + o \( eta \) #h(2em) \( eta arrow.b 0 \) . $
  This proves the right derivative formula, including at ties.
  Under the stated nonnegativity hypothesis, take any $u lt.eq s < t lt.eq v$ and any $epsilon.alt > 0$. The continuous function
  $ g \( tau \) = Phi \( gamma \( tau \) \) + epsilon.alt tau #h(2em) \( s lt.eq tau lt.eq t \) $
  has strictly positive right derivative at every $tau < t$. It cannot attain its maximum at such a point, because sufficiently small positive increments would increase its value. Compactness therefore places its maximum at $t$, giving $g \( s \) lt.eq g \( t \)$. Letting $epsilon.alt arrow.b 0$ proves $Phi \( gamma \( s \) \) lt.eq Phi \( gamma \( t \) \)$. ◻
]

=== 3.4 The invariant polytope and trajectory bounds <the-invariant-polytope-and-trajectory-bounds>

All active branches have nonnegative derivative in $B_h$, while the constant branch in (3.8) gives $F lt.eq M$ everywhere. We now show that the maximum set of $F$ is the compact invariant polytope announced in the introduction. Its invariance will give Theorem 1.

Nonnegative derivatives on all active inequalities express the familiar inward-tangency condition for invariance, whose classical general form goes back to Nagumo #cite(label("Nagumo1942")). Here we prove invariance directly by a first-exit argument.

#thm([Proposition 3.3.])[
  #emph[For every finite weakly reversible mass-action network with positive constant rates, and every $x^0 in bb(R)_(> 0)^d$, there is a compact convex polytope $K subset bb(R)_(> 0)^d$ containing $x^0$ and forward invariant for the mass-action equation. Here forward invariance means that every solution starting in $K$ exists for all forward time and stays in $K$.]
] <prop:polytope>

#proof[
  Use the family, $h$, $F$, $M$, and $B_h$ constructed above, and set
  #[#set math.equation(numbering: n => "(3.13)")
   $ K = { x in bb(R)^d : F \( x \) = M } = ⋂_(lambda in Lambda) { x in bb(R)^d : r_lambda dot.op x + c_lambda \( h \) gt.eq M } . $ <eq:polytope>]
  The equality follows from $F lt.eq M$. Thus $K$ is a closed convex polyhedron containing $x^0$, and (3.9) gives $K ∩ partial B_h = diameter$.
  In fact $K subset "int" B_h$. Otherwise a segment from $x^0 in "int" B_h$ to a point of $K$ outside that interior would lie in $K$ by convexity and meet $partial B_h$, a contradiction. Therefore $K$ is bounded as well as closed, so it is a compact convex polytope in $bb(R)_(> 0)^d$. This step uses no active-label estimate outside the box.
  Let $z in K$. Since the polynomial vector field $f$ is smooth on $bb(R)^d$, it has a unique local solution $x$ from $z$ with a maximal forward existence interval $\[ 0 \, T_max \)$. We initially regard this as a solution in $bb(R)^d$; confinement below will give positivity. On any interval $\[ 0 \, T \] subset \[ 0 \, T_max \)$ for which $x \( \[ 0 \, T \] \) subset B_h$, (3.12) and Lemma 5 make $F \( x \( t \) \)$ nondecreasing. Since $F \( z \) = M$ and $F lt.eq M$, we obtain
  #[#set math.equation(numbering: n => "(3.14)")
   $ F \( x \( t \) \) = M #h(2em) \( 0 lt.eq t lt.eq T \) . $ <eq:trajectory-plateau>]
  The point $z$ lies in the interior of $B_h$. If the solution reached the boundary at a first time $tau < T_max$, its whole segment $x \( \[ 0 \, tau \] \)$ would lie in $B_h$. Applying (3.14) to that closed segment would give $F \( x \( tau \) \) = M$, contrary to (3.9). Continuity shows that any departure from the interior before $T_max$ would have such a first boundary time. Hence $x \( t \) in "int" B_h$ for all $0 lt.eq t < T_max$, and (3.14) places the whole trajectory in $K$.
  If $T_max < oo$, continuity of $f$ on the compact box gives $L < oo$ with $lr(bar.v.double f \( x \) bar.v.double) lt.eq L$ for $x in B_h$. Consequently
  $ lr(bar.v.double x \( t \) - x \( s \) bar.v.double) lt.eq L \| t - s \| #h(2em) \( 0 lt.eq s \, t < T_max \) \, $
  so $x \( t \)$ has a limit $macron(x) in K subset B_h$ as $t arrow.t T_max$. Local existence from $macron(x)$ extends the solution past $T_max$: the original integral equation passes to the endpoint, and both one-sided derivatives there equal $f \( macron(x) \)$. This contradicts maximality. Thus $T_max = oo$, proving the claimed forward invariance for every $z in K$. ◻
]

#proof[
  For the prescribed $x^0$, Proposition 6 and its construction give a forward-invariant polytope $x^0 in K subset B_h = \[ h \, h^(- 1) \]^d$ with $0 < h < 1$. The solution therefore exists globally and satisfies
  $ h lt.eq x_i \( t \) lt.eq h^(- 1) #h(2em) \( t gt.eq 0 \, med 1 lt.eq i lt.eq d \) . $
  Taking $epsilon = h$ gives (1.2). Each coordinate has positive infimum on the entire forward trajectory, and hence positive forward limit inferior. ◻
]

=== 3.5 Equilibria and complex-balanced convergence <equilibria-and-complex-balanced-convergence>

The convexity of the invariant set also recovers the known existence of positive equilibria in every positive stoichiometric class, proved by Boros #cite(label("Boros2019")) preprint, Theorem 1.

#thm([Corollary 3.4.])[
  #emph[For every finite weakly reversible mass-action network with positive constant rates and every $x^0 in bb(R)_(> 0)^d$, there is an equilibrium $x^(*) in \( x^0 + S \) ∩ bb(R)_(> 0)^d$.]
] <cor:positive-equilibrium>

#proof[
  Let $K$ be the polytope in Proposition 6. The set $Q = K ∩ \( x^0 + S \)$ is nonempty, compact, convex, and forward invariant. Write $phi.alt_t$ for the flow. For each integer $n gt.eq 1$, the continuous map $phi.alt_(1 \/ n) : Q arrow.r Q$ has a fixed point $z_n$ by Brouwer’s theorem. Thus
  $ 0 = n #scale(x: 120%, y: 120%)[\(] phi.alt_(1 \/ n) \( z_n \) - z_n #scale(x: 120%, y: 120%)[\)] = n integral_0^(1 \/ n) f \( phi.alt_s \( z_n \) \) thin d s . $
  Put $L = max_(z in Q) lr(bar.v.double f \( z \) bar.v.double)$. Invariance and the integral equation give $lr(bar.v.double phi.alt_s \( z_n \) - z_n bar.v.double) lt.eq L \/ n$ for $0 lt.eq s lt.eq 1 \/ n$. Uniform continuity of $f$ on $Q$ therefore yields
  $ lr(bar.v.double f \( z_n \) bar.v.double) lt.eq sup_(0 lt.eq s lt.eq 1 \/ n) lr(bar.v.double f \( phi.alt_s \( z_n \) \) - f \( z_n \) bar.v.double) arrow.r 0 . $
  A subsequence of $z_n$ converges to some $x^(*) in Q$, and continuity gives $f \( x^(*) \) = 0$. Since $Q subset bb(R)_(> 0)^d$, this is the required positive equilibrium. ◻
]

#prodef([Remark 3.5.])[
  (Complex-balanced convergence).  Under the additional assumption of complex balance, Theorem 1 recovers the known global-attractor conclusion (see also #cite(label("Craciun2026"))): for fixed positive rate constants, every positive trajectory converges to the unique positive equilibrium in its positive stoichiometric class $P ∩ bb(R)_(> 0)^d$. Indeed, complex balance implies weak reversibility, and Proposition 6 traps the trajectory in the compact positive forward-invariant set $K ∩ \( x^0 + S \)$. Let $x^(*)$ be the unique positive equilibrium in this class. The Horn–Jackson entropy function
  $ V \( x \) = sum_(i = 1)^d (x_i log x_i / x_i^(*) - x_i + x_i^(*)) $
  is nonincreasing and has zero derivative only at equilibria. This dissipation property and uniqueness in each positive class are the standard complex-balance conclusions #cite(label("FeinbergLectures1979")) Proposition 5.3 and Corollaries 5.4–5.5. LaSalle’s invariance principle therefore gives convergence. In particular, the conclusion holds for every fixed positive rate choice on every weakly reversible deficiency-zero network #cite(label("FeinbergLectures1979")) Corollary 5.10. Here the deficiency is $\| cal(C) \| - ell - dim S$, where $ell$ is the number of linkage classes.
] <rem:complex-balanced-convergence>


#bibliography("refs.bib", style: "ieee", title: [References])
