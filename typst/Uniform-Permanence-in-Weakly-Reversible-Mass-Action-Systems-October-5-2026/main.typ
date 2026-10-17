#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform Permanence in \
Weakly Reversible Mass-Action Systems]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Weak reversibility requires every reaction in a chemical reaction network to have a directed return path. It is natural to ask whether this graph condition alone prevents concentrations from approaching zero or infinity. Permanence asks for more: after a transient, all trajectories allowed by the same conservation laws must satisfy the same positive lower and finite upper bounds. We prove this conclusion for arbitrary finite weakly reversible networks with fixed positive reaction rates.

=== 1.1 The problem and main result <the-problem-and-main-result>

Let $d gt.eq 1$. A finite reaction network consists of a set of #emph[complexes] $C subset bb(Z)_(gt.eq 0)^d$ and a set of directed #emph[reactions] $R subset C times C$. We write $y arrow.r y'$ for $\( y \, y' \) in R$. The network is #emph[weakly reversible] if for every $y arrow.r y' in R$ there is a directed path from $y'$ to $y$. A #emph[linkage class] is a connected component of the underlying undirected graph. Assign a positive constant $k_(y arrow.r y')$ to each reaction. The mass-action equation is

#[#set math.equation(numbering: n => "(1.1)")
 $ dot(x) = f \( x \) := sum_(y arrow.r y' in R) k_(y arrow.r y') x^y \( y' - y \) \, #h(2em) x^y := product_(i = 1)^d x_i^(y_i) . $ <eq:mass-action>]

The #emph[stoichiometric subspace] and the #emph[positive stoichiometric class] of $c in bb(R)_(> 0)^d$ are

$ S := "span"_(bb(R)) { y' - y : y arrow.r y' in R } \, #h(2em) P := \( c + S \) ∩ bb(R)_(> 0)^d . $

Since $f \( x \) in S$, any positive solution starting in $P$ remains in $P$ for as long as it exists. The class $P$ need not be bounded.

A global positive trajectory is #emph[persistent] if $liminf_(t arrow.r oo) x_i \( t \) > 0$ for every $i$. These lower bounds may depend on the trajectory. We call the system #emph[permanent on $P$] if every solution starting in $P$ is global and positive, and there is one compact set $K subset P$ that eventually contains each such solution. The entry time may depend on the initial point, but $K$ may not. This is the classwise uniformity in the permanence question #cite(label("BorosHofbauer2020")) Definition 4.1.

#thm([Theorem 1.1.])[
  #emph[Let $C subset bb(Z)_(gt.eq 0)^d$ be finite, let $R subset C times C$ be weakly reversible, and fix positive rate constants in (1.1). For every positive stoichiometric class $P$ there is a nonempty compact convex set $K_P subset P$ with the following properties. Every initial point $x^0 in P$ gives a unique global positive solution, and there is a finite $T \( x^0 \) gt.eq 0$ such that 
$ x \( t \) in K_P #h(2em) \( t gt.eq T \( x^0 \) \) . $

 Moreover, $K_P$ is forward invariant. In particular, there is $epsilon_P in \( 0 \, 1 \)$, depending only on the network, the fixed rates, and $P$, such that every such solution satisfies 
#[#set math.equation(numbering: n => "(1.2)")
 $ epsilon_P lt.eq x_i \( t \) lt.eq epsilon_P^(- 1) #h(2em) \( 1 lt.eq i lt.eq d \, med t gt.eq T \( x^0 \) \) . $ <eq:uniform-bounds>]

]
] <thm:main>

Thus the fixed-positive-rate, weakly reversible formulation of the permanence conjecture holds, including on unbounded classes. The uniformity in (1.2) is within each fixed class and rate choice; the transient time is allowed to depend on $x^0$.

=== 1.2 Historical context and the contribution <historical-context-and-the-contribution>

The structural theory of mass-action systems begins with the work of Horn and Jackson and of Feinberg #cite(label("HornJackson1972")) #cite(label("Feinberg1972")). A system is #emph[complex-balanced] if it has a positive state at which the total incoming and outgoing reaction fluxes agree at each complex. For a complex-balanced system, the classical theory gives a unique positive equilibrium in each positive stoichiometric class and an entropy-type Lyapunov function. Complex balance imposes conditions on the rates as well as the graph; weak reversibility by itself does not impose these balance identities. Feinberg’s discussion of weakly reversible systems #cite(label("Feinberg1987")) Remark 6.1.E raised the question of excluding limiting states with a zero concentration. Persistence excludes approach to the boundary even along subsequences, and permanence adds upper bounds and uniformity over initial points.

Important partial results developed both the dynamical picture and the geometric methods. Anderson proved that every positive trajectory of a complex-balanced system with one linkage class converges to its class’s positive equilibrium #cite(label("Anderson2011")) Corollary 4.11. Craciun, Nazarov, and Pantea proved permanence for two-species weakly reversible systems, as part of their more general theorem for endotactic networks #cite(label("CraciunNazarovPantea2013")) Theorem 6.4. Their endotactic condition expresses an inward-pointing property of the reactions seen in every direction. Pantea proved persistence of bounded weakly reversible trajectories when $dim S = 2$, with no restriction to two species #cite(label("Pantea2012")) Theorem 5.1. Gopalkrishnan, Miller, and Shiu proved permanence under the geometric condition of strong endotacticity, which includes every weakly reversible network with one linkage class #cite(label("GopalkrishnanMillerShiu2014")) Theorems 1.1 and 1.3. Boros and Hofbauer later gave another proof of the single-linkage permanence theorem, producing a compact forward-invariant absorbing set #cite(label("BorosHofbauer2020")) Theorem 4.2. These permanence results also permit rates varying in time within fixed positive bounds.

Craciun’s toric-differential-inclusion approach constructs invariant regions by comparing monomials in logarithmic coordinates. The revised manuscript of September 23, 2026 proves persistence for bounded positive trajectories of weakly reversible systems, including rates bounded above and away from zero; its complex-balanced application establishes global convergence #cite(label("Craciun2026")) Section 8, final remark. The general weakly reversible persistence statement there assumes boundedness of the trajectory. Our theorem treats fixed rates and supplies one eventual bound for every trajectory in a class.

The immediate input to the present argument is the affine approximation lemma and trapping construction of #cite(label("OpenAI2026")). That paper proves that every prescribed positive initial point belongs to a compact convex forward-invariant set contained in the positive orthant. Such sets give boundedness and persistence, but may depend on the initial point. We reproduce the affine lemma and its proof in Section 2, and adapt the trapping construction in Section 3. The additional arguments establish strict increase away from a trapping set and connect trapping sets at different scales. They turn bounds for individual trajectories into permanence on a fixed class. Monomial comparisons and invariant regions have the earlier antecedents just described; the affine approximation lemma is credited to #cite(label("OpenAI2026")) Lemma 2.1 and Corollary 2.2.

=== 1.3 Proof overview <proof-overview>

Fix one representative $c in P$. For $0 < h < 1$, set $B_h = \[ h \, h^(- 1) \]^d$. Every $x in B_h$ has a unique representation $x = \( h^(p_1) \, dots.h \, h^(p_d) \)$ with $p in \[ - 1 \, 1 \]^d$. The affine lemma constructs a finite concave minimum

$ F_h \( x \) = min_(lambda in Lambda) #scale(x: 120%, y: 120%)[\(] r_lambda dot.op x + b_lambda \( h \) #scale(x: 120%, y: 120%)[\)] \, $

whose slopes $r_lambda in \[ - 1 \, 1 \]^d$ are independent of $h$. A label $lambda$ is #emph[active] at $x$ when it attains this minimum. For any prescribed tolerance $E : \[ - 1 \, 1 \]^d arrow.r \( 0 \, oo \)$, the construction ensures $∥r_lambda - p∥_oo < E \( r_lambda \)$ for every active label, uniformly for small $h$. We choose the tolerance so that every nonzero comparison $r_lambda dot.op v$, where $v$ is a coordinate vector or a difference of distinct complexes, has the same sign as $p dot.op v$. To preserve these signs, our tolerance shrinks near a hyperplane $r dot.op v = 0$; on the hyperplane, the zero comparison imposes no restriction. This is why the affine lemma allows a discontinuous tolerance. When $r_lambda dot.op v eq.not 0$, finiteness of the slope family also gives a uniform positive lower bound for $lr(|p dot.op v|)$.

At sufficiently small scales, the labels active at $c$ have zero slope, so $F_h \( c \)$ is the global maximum of $F_h$. Its plateau

$ K_h := { x in bb(R)^d : F_h \( x \) = F_h \( c \) } $

is compact and convex, contains $c$, and satisfies $K_h subset "int" B_(sqrt(h))$ (Proposition 4). The restriction to $P$ now supplies the decisive strictness condition. A member of the affine family whose slope lies in $S^perp$ is constant on $c + S$, so its value on $P$ is at least $F_h \( c \)$. Such a label cannot be active at a point of $P \\ K_h$.

For any active label $lambda$, order the complexes by the levels $r_lambda dot.op y$, and separate consecutive levels by cuts. If a downward reaction crosses a cut, its directed return path contains an upward crossing. Monomials at lower source levels dominate those at higher levels, so one upward flux exceeds the entire downward flux for sufficiently small $h$. The net upward flux across each cut is therefore nonnegative, and is positive whenever a reaction crosses it. Summing these fluxes times the gaps between levels gives $r_lambda dot.op f \( x \) gt.eq 0$, with strict inequality when $r_lambda in.not S^perp$. Compactness at each fixed scale makes the strict inequality uniform over all active labels to which it applies (Proposition 5). Thus $F_h$ is nondecreasing along solution segments in $B_h$ and increases at a fixed positive rate on $B_h ∩ \( P \\ K_h \)$. A trajectory in $P$ that stays in $B_h$ for all later times must reach $K_h$ in finite time and remain there.

Every initial point in $P$ belongs to some $K_h$, giving global existence first. The inclusion $K_h subset B_(sqrt(h))$ then permits passage to a larger scale. Repeated square roots, capped at a scale $h_P$ fixed by the class, reach $h_P$ after finitely many steps. Section 4 carries out this iteration and obtains $K_P = K_(h_P) ∩ \( c + S \)$, with $h_P$ chosen independently of the initial point.

== 2 Affine minima with arbitrary tolerance <sec:affine>

The proof will use a finite minimum of affine functions on the positive orthant. Its essential property is that an active slope approximates the exponent vector of the point where it is active. The allowed error will depend on the slope and may be discontinuous. We prove the construction and its uniform consequence from #cite(label("OpenAI2026")) Lemma 2.1 and Corollary 2.2 in full.

For $m gt.eq 1$, $u in bb(R)^m$, and $0 < h < 1$, put

$ X_h \( u \) = \( h^(u_1) \, dots.h \, h^(u_m) \) . $

A #emph[label] $lambda = \( r_lambda \, b_lambda \)$ consists of a slope $r_lambda in bb(R)^m$, independent of $h$, and an offset $b_lambda \( h \)$ defined for all sufficiently small positive $h$. For a finite nonempty family $Lambda$ of labels, write

$ F_h \( x \) = min_(lambda in Lambda) #scale(x: 120%, y: 120%)[\(] r_lambda dot.op x + b_lambda \( h \) #scale(x: 120%, y: 120%)[\)] . $

A label is #emph[active at $x$] if its affine value equals $F_h \( x \)$. Every minimizing label is active when there is a tie. All offsets in a finite family are understood to be restricted to a common interval on which they are defined.

#thm([Lemma 2.1.])[
  (Affine approximation with arbitrary tolerance).  #emph[Let $m gt.eq 1$ be an integer, let $a < b$ be real numbers, and let $E : \[ a \, b \]^m arrow.r \( 0 \, oo \)$ be any function. There is a finite nonempty family $Lambda$ of labels with 
$ r_lambda in \[ a \, b \]^m \, #h(2em) b_lambda \( h \) = o \( h^a \) quad \( h arrow.r 0 + \) \, $

 such that the following implication holds. If $h_nu arrow.r 0 +$, $p^nu in bb(R)^m$ converges to $p in \[ a \, b \]^m$, and a fixed label $lambda in Lambda$ is active at $X_(h_nu) \( p^nu \)$ for every $nu$, then 
$ ∥p - r_lambda∥_oo < E \( r_lambda \) . $

 The slopes and the family are independent of $h$. No regularity is assumed of $E$, and the approximating vectors $p^nu$ need not lie in $\[ a \, b \]^m$.]
] <lem:affine>

#proof[
  We induct on $m$. Write $mu \( u \) = min_i u_i$ and $upright(bold(1)) = \( 1 \, dots.h \, 1 \)$. Since the largest coordinate of $X_h \( u \)$ is $h^(mu \( u \))$, we first construct a family for each fixed value $t$ of the smallest exponent. We then extend its guarantee to a neighborhood of $t$ and combine finitely many such families by shifting their offsets. The fixed-minimum construction is a singleton when $m = 1$; the extension and combination therefore also prove the base case.
  Throughout the proof, asymptotic comparisons along $h_nu arrow.r 0 +$ and $p^nu arrow.r p$ use fixed gaps between limiting exponents. In particular, if $p_i > q$, then eventually $p_i^nu gt.eq q + delta$ for some $delta > 0$, so $h_nu^(p_i^nu) = o \( h_nu^q \)$; if $p_i < q$, the ratio $h_nu^(p_i^nu) \/ h_nu^q$ tends to infinity. We shall use these comparisons only with strict limiting gaps.
  #emph[A family for a fixed minimum.] Fix $t in \[ a \, b \]$. We construct a finite family $Lambda_t$ containing $\( t upright(bold(1)) \, 0 \)$, with $mu \( r \) = t$ for every slope, such that the conclusion of the lemma holds for activity within $Lambda_t$ whenever $mu \( p \) = t$.
  If $m = 1$ or $t = b$, the family ${ \( t upright(bold(1)) \, 0 \) }$ suffices: a point $p in \[ a \, b \]^m$ with $mu \( p \) = t$ then equals $t upright(bold(1))$. Otherwise $m > 1$ and $t < b$. Say a label has #emph[type $k$] if exactly $k$ entries of its slope exceed $t$, the remaining entries being $t$. Start with the type $0$ label $\( t upright(bold(1)) \, 0 \)$, and construct types $k = 1 \, dots.h \, m - 1$ successively. After type $k - 1$ has been constructed, choose $beta_k$ satisfying
  $ t < beta_k < b \, #h(2em) beta_k < beta_(k - 1) quad upright("if ") k > 1 \,\
beta_k - t < E \( r \) quad upright("for every slope ") r upright(" of type ") k - 1 upright(".") $
  These conditions use only finitely many positive values of $E$, so such a choice is possible. The new type $k$ labels will force every limiting exponent on a coordinate left at $t$ by a type $k - 1$ label that stays active to be at most $beta_k$. The last inequality will then bound the error by that label’s tolerance.
  For each $k$-element coordinate set $U subset { 1 \, dots.h \, m }$ and $s in \[ beta_k \, b \]^U$, let $r \( s \)$ equal $s$ on $U$ and $t$ off $U$. Apply the induction hypothesis in dimension $k$ to this cube with tolerance $s mapsto E \( r \( s \) \)$, identifying $U$ with its naturally ordered coordinates. For every resulting label $\( s \, d \)$, add to $Lambda_t$ the type $k$ label
  #[#set math.equation(numbering: n => "(2.1)")
   $ r = r \( s \) \, #h(2em) c \( h \) = - h^(beta_k) + d \( h \) \, #h(2em) d \( h \) = o \( h^(beta_k) \) . $ <eq:local-labels>]
  Here and below $c$ denotes a local offset. The resulting family is finite, and all its offsets are $o \( h^t \)$. The negative offset favors raising slope entries on coordinates where $X_h \( p \)$ is small; the decreasing $beta_k$ make that preference stronger with each successive type.
  To verify the guarantee, let $p^nu arrow.r p in \[ a \, b \]^m$ with $mu \( p \) = t$, and suppose a type $k$ label $\( r \, c \)$ stays active within $Lambda_t$ along $h_nu arrow.r 0 +$. Let $U$ be its raised coordinate set, and abbreviate $h = h_nu$. For $k > 0$, comparison with $\( t upright(bold(1)) \, 0 \)$ gives
  $ sum_(i in U) \( r_i - t \) h^(p_i^nu) lt.eq h^(beta_k) - d \( h \) = \( 1 + o \( 1 \) \) h^(beta_k) . $
  Every coefficient on the left is at least $beta_k - t > 0$. A limiting exponent $p_i < beta_k$ would make the corresponding term divided by $h^(beta_k)$ tend to infinity. Therefore
  #[#set math.equation(numbering: n => "(2.2)")
   $ p_i gt.eq beta_k #h(2em) \( i in U \) . $ <eq:raised-coordinates>]
  Among labels made from this same $U$, all contributions off $U$ and the term $- h^(beta_k)$ are common. Thus $\( s \, d \)$ is active in the family furnished by induction. Its limiting exponent vector lies in $\[ beta_k \, b \]^U$, so
  $ max_(i in U) lr(|p_i - r_i|) < E \( r \) . $
  The approximating vectors $p_U^nu$ may approach a face of that cube from outside. This is why the induction statement allows them outside the cube, including when $p_i = beta_k$ or $p_i = b$.
  It remains to bound the coordinates off $U$. This argument also includes type $0$, for which $U = diameter$. If $k < m - 1$, we claim that
  $ p_i lt.eq beta_(k + 1) #h(2em) \( i in.not U \) . $
  Otherwise choose $j in.not U$ with $p_j > beta_(k + 1)$ and any type $k + 1$ label raised on $U union { j }$. Every limiting exponent on this set exceeds $beta_(k + 1)$, by (2.2) and $beta_k > beta_(k + 1)$ when $k > 0$. The competitor’s affine value minus that of $\( t upright(bold(1)) \, 0 \)$ is therefore
  $ - h^(beta_(k + 1)) + o \( h^(beta_(k + 1)) \) . $
  For the supposed active label, the same difference is zero if $k = 0$, and is bounded below by $- h^(beta_k) + o \( h^(beta_k) \)$ if $k > 0$. Since $h^(beta_k) = o \( h^(beta_(k + 1)) \)$, the competitor is strictly smaller for all sufficiently small $h$ along the sequence, a contradiction. Consequently, off $U$,
  $ lr(|p_i - r_i|) lt.eq beta_(k + 1) - t < E \( r \) . $
  If $k = m - 1$, there is just one coordinate off $U$. Its limiting exponent is $t$, since $mu \( p \) = t$ and all coordinates on $U$ have limiting exponents greater than $t$. Its error is zero. This proves the required strict bound for every active label at the fixed minimum.
  #emph[Extension to nearby minima.] For a fixed label $lambda = \( r \, c \) in Lambda_t$, let $A_lambda subset \[ a \, b \]^m$ consist of the limits of all sequences $p^nu in bb(R)^m$ for which $h_nu arrow.r 0 +$ and $lambda$ is active within $Lambda_t$ at $X_(h_nu) \( p^nu \)$. This set is closed. Indeed, if $z_n in A_lambda$ and $z_n arrow.r z$, choose from a sequence realizing $z_n$ a parameter $0 < h_n < 1 \/ n$ and a vector $u_n$ with $∥u_n - z_n∥_oo < 1 \/ n$ such that $lambda$ is active at $X_(h_n) \( u_n \)$. Then $u_n arrow.r z$, so this selected sequence realizes $z in A_lambda$. This argument uses actual active points and requires no continuity of the offsets in $h$.
  The set of limits violating the desired estimate,
  $ B_t = union.big_(lambda = \( r \, c \) in Lambda_t) { p in A_lambda : ∥p - r∥_oo gt.eq E \( r \) } \, $
  is compact: the union is finite and each $E \( r \)$ here is a fixed number. The preceding argument shows that $B_t$ contains no point with $mu \( p \) = t$. Continuity of $mu$ and compactness therefore give $rho_t > 0$ such that $B_t$ contains no point with
  $ mu \( p \) in I_t := \( t - rho_t \, t + rho_t \) . $
  If $B_t$ is empty any positive radius initially suffices; otherwise take $rho_t < min_(p in B_t) lr(|mu \( p \) - t|)$. Thus $Lambda_t$ has the asserted limiting activity property whenever $mu \( p \) in I_t$.
  Shrink $rho_t$ further, if necessary, so that every local offset obeys
  #[#set math.equation(numbering: n => "(2.3)")
   $ c \( h \) = o \( h^(t + rho_t) \) . $ <eq:local-decay>]
  For a nonsingleton family, choose $t + rho_t < min_k beta_k$ and use (2.1); for a singleton the offset is zero. We have obtained a family valid near each possible minimum exponent. The remaining task is to ensure that a globally active label comes from a family valid at its own limiting point.
  #emph[Combining the families.] Take a finite subcover of $\[ a \, b \]$ from the intervals $I_t$. Discard intervals contained in others, keeping just one if two coincide, and order the remaining centers as $t_1 < dots.h.c < t_N$. Write $I_(t_j) = \( L_j \, R_j \)$. Noncontainment forces both endpoints to have the same strict order; since $t_j = \( L_j + R_j \) \/ 2$, it is the order of the centers. Hence
  $ L_1 < dots.h.c < L_N \, #h(2em) R_1 < dots.h.c < R_N . $
  Consecutive intervals overlap. If $R_j lt.eq L_(j + 1)$, a point of $\[ R_j \, L_(j + 1) \] subset \( t_j \, t_(j + 1) \) subset \[ a \, b \]$ would be uncovered. The first interval contains $a$ and the last contains $b$.
  For $1 lt.eq j < N$, choose a cut
  $ q_j in #scale(x: 120%, y: 120%)[\(] max { t_j \, L_(j + 1) } \, min { t_(j + 1) \, R_j } #scale(x: 120%, y: 120%)[\)] . $
  The interval displayed is nonempty because consecutive intervals overlap and each contains its own center. With $q_0 = a$ and $q_N = b$, we have
  #[#set math.equation(numbering: n => "(2.4)")
   $ t_j < q_j < t_(j + 1) quad \( 1 lt.eq j < N \) \, #h(2em) \[ q_(j - 1) \, q_j \] subset I_(t_j) quad \( 1 lt.eq j lt.eq N \) . $ <eq:affine-cuts>]
  For $N = 1$, the sole interval contains $\[ a \, b \]$ and no interior cuts are needed. The closed intervals in (2.4) are the ranges of minimum exponents assigned to the respective families; see Figure 1.
  Combine the selected families, replacing every local offset $c \( h \)$ in $Lambda_(t_j)$ by
  #[#set math.equation(numbering: n => "(2.5)")
   $ tilde(c) \( h \) = c \( h \) - sum_(ell = 1)^(j - 1) h^(q_ell) . $ <eq:affine-shifts>]
  These offsets are $o \( h^a \)$: (2.3) has $t_j + rho_(t_j) > a$, and each shift exponent satisfies $q_ell > t_ell gt.eq a$. A common shift preserves activity within each family. Between consecutive families, the new term $- h^(q_j)$ will force any limiting minimum exponent to the correct side of the cut.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-0.36, 0), (9.9, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((9.9, 0), [#text(size: 9pt)[$mu (p)$]], anchor: "west", padding: 0.1176cm)
  line((0.54, 0.064), (0.54, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.54, -0.096), [#text(size: 9pt)[$a=q_0$]], anchor: "north", padding: 0.1176cm)
  line((1.8, 0.064), (1.8, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.8, -0.096), [#text(size: 9pt)[$t_1$]], anchor: "north", padding: 0.1176cm)
  line((3.15, 0.064), (3.15, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.15, -0.096), [#text(size: 9pt)[$q_1$]], anchor: "north", padding: 0.1176cm)
  line((4.5, 0.064), (4.5, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.5, -0.096), [#text(size: 9pt)[$t_2$]], anchor: "north", padding: 0.1176cm)
  line((5.85, 0.064), (5.85, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.85, -0.096), [#text(size: 9pt)[$q_2$]], anchor: "north", padding: 0.1176cm)
  line((7.2, 0.064), (7.2, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.2, -0.096), [#text(size: 9pt)[$t_3$]], anchor: "north", padding: 0.1176cm)
  line((8.55, 0.064), (8.55, -0.064), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.55, -0.096), [#text(size: 9pt)[$b=q_3$]], anchor: "north", padding: 0.1176cm)
  line((0.54, 0.16), (0.54, 2.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.15, 0.16), (3.15, 2.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.85, 0.16), (5.85, 2.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((8.55, 0.16), (8.55, 2.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.09, 2), (3.69, 2), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-0.09, 2), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((3.69, 2), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.54, 2), (3.15, 2), stroke: (thickness: 2.0pt, miter-limit: 10))
  circle((0.54, 2), radius: (0.063, 0.056), fill: black, stroke: none)
  circle((3.15, 2), radius: (0.063, 0.056), fill: black, stroke: none)
  content((3.825, 2), [#text(size: 9pt)[$I_(t_1)$]], anchor: "west", padding: 0.1176cm)
  line((2.61, 1.36), (6.39, 1.36), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((2.61, 1.36), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((6.39, 1.36), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3.15, 1.36), (5.85, 1.36), stroke: (thickness: 2.0pt, miter-limit: 10))
  circle((3.15, 1.36), radius: (0.063, 0.056), fill: black, stroke: none)
  circle((5.85, 1.36), radius: (0.063, 0.056), fill: black, stroke: none)
  content((6.525, 1.36), [#text(size: 9pt)[$I_(t_2)$]], anchor: "west", padding: 0.1176cm)
  line((5.31, 0.72), (9.09, 0.72), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((5.31, 0.72), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((9.09, 0.72), radius: (0.054, 0.048), fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.85, 0.72), (8.55, 0.72), stroke: (thickness: 2.0pt, miter-limit: 10))
  circle((5.85, 0.72), radius: (0.063, 0.056), fill: black, stroke: none)
  circle((8.55, 0.72), radius: (0.063, 0.056), fill: black, stroke: none)
  content((9.225, 0.72), [#text(size: 9pt)[$I_(t_3)$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Combining three local families, schematically. Each thick closed interval $\[ q_(j - 1) \, q_j \]$ lies inside the open neighborhood $I_(t_j)$ where its family is valid. The shifts in (2.5) force the limiting minimum exponent of an active label into this closed interval. At a cut, either neighboring family remains valid. ],
  ) <fig:intervals>
  Suppose a fixed label from $Lambda_(t_j)$ is active in the combined family along $h_nu arrow.r 0 +$ and $p^nu arrow.r p in \[ a \, b \]^m$. Write $c \( h \)$ for its original local offset and $h = h_nu$. We claim
  $ q_(j - 1) lt.eq mu \( p \) lt.eq q_j . $
  If $j < N$ and $mu \( p \) > q_j$, each coordinate $h^(p_i^nu)$ is $o \( h^(q_j) \)$. Also $c \( h \) = o \( h^(q_j) \)$, by (2.3) and $q_j < R_j = t_j + rho_(t_j)$. Subtracting the value of the shifted label $\( t_(j + 1) upright(bold(1)) \, 0 \)$ from the active label’s value gives
  $ \( r - t_(j + 1) upright(bold(1)) \) dot.op X_h \( p^nu \) + c \( h \) + h^(q_j) = h^(q_j) + o \( h^(q_j) \) > 0 \, $
  a contradiction.
  If $j > 1$ and $mu \( p \) < q_(j - 1)$, compare instead with the shifted label $\( t_(j - 1) upright(bold(1)) \, 0 \)$. The difference is
  $ \( r - t_(j - 1) upright(bold(1)) \) dot.op X_h \( p^nu \) + c \( h \) - h^(q_(j - 1)) . $
  Every coefficient in the scalar product is at least $t_j - t_(j - 1) > 0$. Some coordinate has $p_i < q_(j - 1)$, so its exponential divided by $h^(q_(j - 1))$ tends to infinity. Meanwhile, $c \( h \) = o \( h^(q_(j - 1)) \)$ because $q_(j - 1) < t_j < t_j + rho_(t_j)$. Thus the displayed difference divided by $h^(q_(j - 1))$ tends to $+ oo$, again contradicting activity. The outer bounds for $j = 1$ or $j = N$ follow from $mu \( p \) in \[ a \, b \]$.
  By (2.4), the claimed bounds place $mu \( p \)$ inside $I_(t_j)$, including when it equals a cut. The label is active within its original local family, so the guarantee on $I_(t_j)$ gives $∥p - r∥_oo < E \( r \)$. This completes the induction. ◻
]

The sequential formulation yields the uniform statement needed below. Its order of choices is important: the family, and hence its finite set of slopes, is fixed before the upper bound on $h$ is chosen.

#thm([Corollary 2.2.])[
  (Uniform activity bound).  #emph[Let $m gt.eq 1$, $a < b$, and $E : \[ a \, b \]^m arrow.r \( 0 \, oo \)$ be as in Lemma 2. Fix a family $Lambda$ supplied by that lemma. There is $h_0 in \( 0 \, 1 \)$ such that, for every $0 < h < h_0$ and every $p in \[ a \, b \]^m$, each label $lambda in Lambda$ active at $X_h \( p \)$ satisfies 
$ ∥p - r_lambda∥_oo < E \( r_lambda \) . $

]
] <cor:activity>

#proof[
  Otherwise there are $h_nu arrow.r 0 +$, points $p^nu in \[ a \, b \]^m$, and active labels $lambda_nu$ such that $∥p^nu - r_(lambda_nu)∥_oo gt.eq E \( r_(lambda_nu) \)$. By finiteness and compactness, pass to a subsequence on which $lambda_nu = lambda$ is fixed and $p^nu arrow.r p in \[ a \, b \]^m$. The inequality passes to the limit and contradicts Lemma 2. No continuity of $E$ is needed because its argument $r_lambda$ is fixed on this subsequence. ◻
]

== 3 Compact plateaux and strict increase <sec:trapping>

We now apply Corollary 3 to the reaction network. For each sufficiently small scale we will construct a compact set in the positive orthant that is forward invariant. For a fixed positive stoichiometric class, we will also prove that a trajectory in that class remaining in the scale’s box reaches this set in finite time. The affine minimum and sign argument adapt the trapping construction of #cite(label("OpenAI2026")) Section 3; the strict increase away from a plateau is the additional property needed for finite entry within a fixed class.

Use $X_h$ from Section 2 with $m = d$, and for $0 < h < 1$ put

$ B_h = \[ h \, h^(- 1) \]^d . $

Every $x in B_h$ is uniquely $X_h \( p \)$ for $p in \[ - 1 \, 1 \]^d$, with $p = log x \/ log h$, where the logarithm of a vector is taken coordinatewise. We first choose the tolerance in Corollary 3 so that active slopes determine both coordinate signs and the ordering of monomials. Let

#[#set math.equation(numbering: n => "(3.1)")
 $ D = { e_i : 1 lt.eq i lt.eq d } union { z - y : y \, z in C \, med z eq.not y } \, $ <eq:comparison-directions>]

where $e_i$ is the $i$th coordinate vector. This is a finite set of nonzero vectors. We include all pairs of complexes because the flux estimate will compare sources of different reactions, possibly in different components of the reaction graph. Define, for $r in \[ - 1 \, 1 \]^d$,

#[#set math.equation(numbering: n => "(3.2)")
 $ E \( r \) = min ({1 / 2} union {frac(lr(|r dot.op v|), 2 ∥v∥_1) : v in D \, med r dot.op v eq.not 0}) . $ <eq:network-tolerance>]

Zero scalar products impose no sign restriction and are omitted. Thus $E$ is positive at every point, including on the comparison hyperplanes; no continuity is needed. Fix the finite nonempty family supplied by Corollary 3 for this $E$, and write its affine functions as

$ L_(lambda \, h) \( x \) = r_lambda dot.op x + b_lambda \( h \) \, #h(2em) F_h \( x \) = min_(lambda in Lambda) L_(lambda \, h) \( x \) . $

The slopes $r_lambda in \[ - 1 \, 1 \]^d$ and the index set $Lambda$ are fixed independently of $h$. A label $lambda$ is active at $x$ if $L_(lambda \, h) \( x \) = F_h \( x \)$; denote the set of these labels by $A_h \( x \)$. For every sufficiently small $h$, the activity estimate is

#[#set math.equation(numbering: n => "(3.3)")
 $ x = X_h \( p \) in B_h \, quad lambda in A_h \( x \) quad arrow.r.double quad ∥p - r_lambda∥_oo < E \( r_lambda \) . $ <eq:network-activity>]

Because the family of slopes is fixed and finite, the number

#[#set math.equation(numbering: n => "(3.4)")
 $ H = min ({ 1 } union {lr(|r_lambda dot.op v|) / 2 : lambda in Lambda \, med v in D \, med r_lambda dot.op v eq.not 0}) $ <eq:uniform-sign-gap>]

is positive. If $x = X_h \( p \) in B_h$, $lambda in A_h \( x \)$, and $r = r_lambda$, then

$ lr(|\( p - r \) dot.op v|) lt.eq ∥p - r∥_oo ∥v∥_1 < E \( r \) ∥v∥_1 lt.eq lr(|r dot.op v|) / 2 #h(2em) \( v in D \, med r dot.op v eq.not 0 \) . $

Consequently,

#[#set math.equation(numbering: n => "(3.5)")
 $ r dot.op v eq.not 0 quad arrow.r.double quad "sgn" \( p dot.op v \) = "sgn" \( r dot.op v \) \, #h(2em) lr(|p dot.op v|) gt.eq H #h(2em) \( v in D \) . $ <eq:sign-and-size>]

Fix a positive stoichiometric class $P$, and choose one representative $c in P$ once for this class. Choose $h_P in \( 0 \, 1 \)$ so small that the affine functions are defined and (3.3) holds for every $0 < h lt.eq h_P$, and also

#[#set math.equation(numbering: n => "(3.6)")
 $ ∥frac(log c, log h)∥_oo < H \, #h(2em) h^H sum_(e in R) k_e < min_(e in R) k_e quad \( 0 < h lt.eq h_P \) . $ <eq:class-scale>]

The second inequality is imposed only when $R eq.not diameter$. Such a choice exists because $H > 0$, all the rates are positive, and both $1 \/ lr(|log h|)$ and $h^H$ tend to zero as $h$ tends to zero. In particular, $c in "int" B_h$ for these scales. All the remaining statements of this section concern $0 < h lt.eq h_P$.

#thm([Proposition 3.1.])[
  (The compact plateau).  #emph[For $0 < h lt.eq h_P$, let 
$ M_h = F_h \( c \) \, #h(2em) K_h = { x in bb(R)^d : F_h \( x \) = M_h } . $

 There is a constant label with value $M_h$, and $F_h lt.eq M_h$ on $bb(R)^d$. The set $K_h$ is nonempty, compact, and convex, and 
#[#set math.equation(numbering: n => "(3.7)")
 $ K_h subset "int" B_(sqrt(h)) . $ <eq:plateau-containment>]

]
] <prop:plateau>

#proof[
  Write $p_c = log c \/ log h$. If a label active at $c$ had a nonzero coordinate $r_(lambda \, i)$, (3.5) with $v = e_i$ would give $lr(|p_(c \, i)|) gt.eq H$, contrary to (3.6). Thus every label active at $c$ has zero slope. At least one label is active there, so one of the affine functions is the constant $M_h$. It follows that $F_h lt.eq M_h$ everywhere, and that $M_h$ is the least value of any constant label. Hence
  $ K_h = ⋂_(lambda in Lambda) { x in bb(R)^d : L_(lambda \, h) \( x \) gt.eq M_h } $
  is closed and convex, and contains $c$.
  If $x = X_h \( p \) in K_h ∩ B_h$, the constant label with value $M_h$ is active at $x$. Applying (3.3) to its zero slope gives
  $ ∥p∥_oo < E \( 0 \) = 1 / 2 \, #h(2em) upright("and thus") #h(2em) x in "int" B_(sqrt(h)) . $
  In particular, $K_h$ misses the boundary of $B_h$. If some point of $K_h$ lay outside $B_h$, the segment joining it to $c in "int" B_h$ would meet that boundary at a point of $K_h$, by convexity. This is impossible. Thus $K_h subset B_h$, and the preceding argument proves (3.7) for every point of $K_h$. Closedness and boundedness give compactness. ◻
]

The plateau is now a compact candidate for a trapping set. A slope in $S^perp$ gives an affine function that is constant on $P$. We first exclude such slopes below the plateau, then compare reaction fluxes to prove strict increase for every remaining active label.

#thm([Proposition 3.2.])[
  (Increase of active affine functions).  #emph[Fix $0 < h lt.eq h_P$. For every $x in B_h$ and every $lambda in A_h \( x \)$, 
#[#set math.equation(numbering: n => "(3.8)")
 $ r_lambda dot.op f \( x \) gt.eq 0 \, #h(2em) r_lambda dot.op f \( x \) > 0 quad upright("if ") r_lambda in.not S^perp . $ <eq:active-flux-sign>]

 Moreover, there is a number $delta_h > 0$ such that 
#[#set math.equation(numbering: n => "(3.9)")
 $ r_lambda dot.op f \( x \) gt.eq delta_h quad upright("whenever ") x in B_h \, med lambda in A_h \( x \) \, med r_lambda in.not S^perp . $ <eq:uniform-active-increase>]

 At every point of $P \\ K_h$, all active slopes lie outside $S^perp$. In particular, (3.9) applies to every active label at each $x in B_h ∩ \( P \\ K_h \)$.]
] <prop:increase>

#proof[
  First, let $x in P \\ K_h$. If $r_lambda in S^perp$, then $x - c in S$ implies
  $ L_(lambda \, h) \( x \) = L_(lambda \, h) \( c \) gt.eq F_h \( c \) = M_h . $
  But $F_h \( x \) < M_h$ by Proposition 4. Such a label cannot be active at $x$.
  If $R$ is empty, then $f = 0$ and $S = { 0 }$, so (3.8) holds and (3.9) is vacuous. For the flux comparison, assume $R eq.not diameter$ and fix $x = X_h \( p \) in B_h$ and an active slope $r$. Whenever $y \, z in C$ satisfy $r dot.op y < r dot.op z$, (3.5) applied to $z - y$ gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ x^z / x^y = h^(p dot.op \( z - y \)) lt.eq h^H . $ <eq:monomial-order>]
  List the distinct values of $r dot.op y$, for $y in C$, as $a_1 < dots.h.c < a_m$. For $1 lt.eq j < m$, define the net upward flux across the cut at $a_j$ by
  $ Q_j \( x \) =  & sum_(u arrow.r u' in R thin :\
r dot.op u lt.eq a_j < r dot.op u') k_(u arrow.r u') x^u - sum_(u arrow.r u' in R thin :\
r dot.op u' lt.eq a_j < r dot.op u) k_(u arrow.r u') x^u . $
  An edge crossing the cut in the first sum is called upward, and an edge in the second sum is called downward.
  If there is a downward edge $u arrow.r u'$, weak reversibility supplies a directed path from $u'$ back to $u$. This path starts below the cut and ends above it, so it contains an upward edge, say $w arrow.r w'$. Every source $u$ of a downward edge has $r dot.op u > r dot.op w$. By (3.10) and (3.6),
  $ sum_(u arrow.r u' in R thin :\
r dot.op u' lt.eq a_j < r dot.op u) k_(u arrow.r u') x^u lt.eq h^H x^w sum_(e in R) k_e < k_(w arrow.r w') x^w . $
  Thus one upward edge already contributes more than the entire downward sum, and $Q_j \( x \) > 0$. If there is no downward edge, then $Q_j \( x \) gt.eq 0$, with strict inequality whenever there is an upward edge. In all cases $Q_j \( x \)$ is nonnegative, and it is positive if any reaction crosses the cut.
  The contribution of an edge to $r dot.op f \( x \)$ is its flux multiplied by the difference between the levels of its target and source. Writing this difference as the signed sum of the intervening gaps gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ r dot.op f \( x \) = sum_(j = 1)^(m - 1) \( a_(j + 1) - a_j \) Q_j \( x \) . $ <eq:cut-flux-decomposition>]
  Every term is nonnegative. If $r in.not S^perp$, some reaction $y arrow.r y'$ satisfies $r dot.op \( y' - y \) eq.not 0$ and therefore crosses at least one cut; the corresponding term is positive. This proves (3.8). When $m = 1$, the sum is empty and every reaction has zero scalar product with $r$, as required. Self-loops never cross a cut and contribute zero to the vector field.
  For the uniform bound, the active set of a fixed label,
  $ T_(lambda \, h) = { x in B_h : L_(lambda \, h) \( x \) = F_h \( x \) } \, $
  is compact. If $r_lambda in.not S^perp$ and $T_(lambda \, h)$ is nonempty, the continuous function $r_lambda dot.op f$ is strictly positive on this set and has a positive minimum there. Take the minimum of these positive numbers over the finitely many eligible labels. If there are none, choose any $delta_h > 0$. This proves (3.9), including the case $R = diameter$. ◻
]

The strict inequality in Proposition 5 is uniform at a fixed scale even near the plateau. Together with the finite nature of the affine minimum, this gives a direct finite-time trapping statement.

#thm([Lemma 3.3.])[
  (Trapping and finite entry).  #emph[Fix $0 < h lt.eq h_P$. Along any solution segment contained in $B_h$, the function $t mapsto F_h \( x \( t \) \)$ is nondecreasing. If the segment $x \( \[ s \, t \] \)$ is contained in $B_h ∩ \( P \\ K_h \)$, then 
#[#set math.equation(numbering: n => "(3.12)")
 $ F_h \( x \( t \) \) - F_h \( x \( s \) \) gt.eq delta_h \( t - s \) . $ <eq:trajectory-increase>]

 Every solution starting in $K_h$ exists for all nonnegative time and remains in $K_h$. In particular, solutions starting in $K_h ∩ P$ remain in $K_h ∩ P$. Finally, any global solution in $P$ that stays in $B_h$ from some time onward enters $K_h$ in finite time and then remains there.]
] <lem:trapping>

#proof[
  For a solution $x \( t \)$ and each fixed time $t$ before its maximal existence time, the right derivative of its affine minimum is
  #[#set math.equation(numbering: n => "(3.13)")
   $ frac(d^(+), d t) F_h \( x \( t \) \) = min_(lambda in A_h \( x \( t \) \)) r_lambda dot.op f \( x \( t \) \) . $ <eq:right-derivative>]
  Indeed, all inactive labels have a positive gap above the minimum at time $t$. There are finitely many of them, so continuity excludes them from the minimum for a sufficiently short time to the right. For each active label, differentiability of the solution gives
  $ L_(lambda \, h) \( x \( t + s \) \) = F_h \( x \( t \) \) + s thin r_lambda dot.op f \( x \( t \) \) + o \( s \) #h(2em) \( s arrow.b 0 \) . $
  Taking the minimum of these finitely many expansions proves (3.13).
  We use the elementary fact that a continuous function $g$ on $\[ a \, b \]$ with right derivative at least $q$ at every point of $\[ a \, b \)$ satisfies $g \( b \) - g \( a \) gt.eq q \( b - a \)$. For completeness, for any $eta > 0$ the function $g \( u \) - q u + eta u$ has positive right derivative before $b$. Its maximum on the compact interval therefore cannot occur before $b$. Comparing its values at $a$ and $b$ and then letting $eta arrow.b 0$ proves the assertion. Formula (3.13) and Proposition 5 now give monotonicity in $B_h$, and give (3.12) when the segment lies in $P \\ K_h$.
  Suppose next that $x \( 0 \) in K_h$, and consider the maximal solution of the polynomial vector field $f$. Since $K_h subset "int" B_h$, the solution initially stays in $B_h$. On any interval on which it does so, monotonicity and the global upper bound $F_h lt.eq M_h$ force $F_h \( x \( t \) \) = M_h$. Hence it remains in $K_h$. It cannot have a first exit from $"int" B_h$ within its interval of existence: continuity would place the exit point in both $K_h$ and the boundary of $B_h$, contradicting Proposition 4. Thus the solution stays in the compact set $K_h$ throughout its maximal interval. A solution of a smooth vector field that remains in a compact subset of its domain extends past any finite endpoint of its interval of existence. To see the relevant point here, $f$ is bounded on a neighborhood of $K_h$, so a finite endpoint would give a limit of $x \( t \)$ in $K_h$, at which local existence continues the solution. The solution is therefore global. It remains positive by (3.7); moreover, $f \( x \) in S$ implies $x \( t \) - x \( 0 \) in S$, so a solution starting in $P$ stays in $P$.
  Finally, let a global solution in $P$ remain in $B_h$ for all $t gt.eq t_0$. If it never enters $K_h$ after $t_0$, then (3.12) gives
  $ F_h \( x \( t \) \) gt.eq F_h \( x \( t_0 \) \) + delta_h \( t - t_0 \) #h(2em) \( t gt.eq t_0 \) \, $
  contradicting $F_h lt.eq M_h$ for sufficiently large $t$. It must enter $K_h$ at a finite time, and the forward invariance just proved keeps it there. ◻
]

== 4 A common absorbing set for each class <sec:permanence>

Fix a positive stoichiometric class $P$ and its representative $c$, and retain the scale $h_P$ and the functions $F_h$ from Section 3. Lemma 6 gives invariance at each scale and finite-time entry whenever a trajectory stays in the corresponding box. Proposition 4 connects these two properties through

#[#set math.equation(numbering: n => "(4.1)")
 $ K_h subset "int" B_(sqrt(h)) #h(2em) \( 0 < h lt.eq h_P \) . $ <eq:scale-containment>]

We now use this relation to replace an initial-point-dependent trapping set by one fixed set for $P$.

#proof[
  Let $x^0 in P$. Since $x^0$ is positive, we may choose $0 < h_0 lt.eq h_P$ so small that
  $ ∥frac(log x^0, log h_0)∥_oo < H \, $
  where the logarithm is componentwise and $H > 0$ is the fixed separation constant from Section 3. In particular, $x^0 in B_(h_0)$. The coordinate sign comparisons force every label active at $x^0$ to have slope zero, just as they did at $c$. An active constant label must have the least value among all constant labels, namely $M_(h_0) = F_(h_0) \( c \)$. Hence
  $ x^0 in K_(h_0) . $
  Lemma 6 implies that the solution through $x^0$ is global, stays positive, and remains in $K_(h_0)$. Since $f \( x \) in S$, it also remains in $P$.
  Starting at $h_0$, define
  #[#set math.equation(numbering: n => "(4.2)")
   $ h_(j + 1) = min { sqrt(h_j) \, h_P } . $ <eq:scale-sequence>]
  We claim that for every $j$ there is a finite time $T_j$ such that $x \( t \) in K_(h_j)$ for all $t gt.eq T_j$. The case $j = 0$ holds with $T_0 = 0$. Suppose it holds at $j$. Because $h_(j + 1) lt.eq sqrt(h_j)$, the boxes satisfy $B_(sqrt(h_j)) subset B_(h_(j + 1))$. Thus (4.1) yields
  $ x \( t \) in B_(h_(j + 1)) quad \( t gt.eq T_j \) . $
  The finite-entry assertion of Lemma 6, followed by its invariance assertion, supplies a finite $T_(j + 1) gt.eq T_j$ with $x \( t \) in K_(h_(j + 1))$ for all $t gt.eq T_(j + 1)$. This proves the claim. The argument uses containment in successive boxes; no nesting of the sets $K_h$ is assumed.
  Repeated square roots of $h_0 in \( 0 \, 1 \)$ tend to $1$. Since $h_P < 1$, the capped sequence (4.2) therefore reaches $h_P$ after finitely many steps. We conclude that every solution through a point of $P$ enters $K_(h_P)$ in finite time and stays there.
  Finally set
  $ K_P = K_(h_P) ∩ \( c + S \) . $
  This is nonempty because it contains $c$, and it is compact and convex as the intersection of the compact convex set $K_(h_P)$ with a closed affine subspace. Since $K_(h_P)$ lies in the positive orthant, $K_P subset P$. Both $K_(h_P)$ and the affine subspace $c + S$ are forward invariant, so $K_P$ is forward invariant. The preceding argument proves its absorbing property. Moreover, $K_P subset B_(h_P)$, and therefore $epsilon_P = h_P in \( 0 \, 1 \)$ gives
  $ epsilon_P lt.eq x_i \( t \) lt.eq epsilon_P^(- 1) quad \( 1 lt.eq i lt.eq d \) $
  for all sufficiently large $t$, with the entry time allowed to depend on $x^0$. The scale $h_P$, and hence these bounds, was fixed before choosing the initial point. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
