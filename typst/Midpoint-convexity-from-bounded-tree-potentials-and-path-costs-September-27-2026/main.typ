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

#align(center)[#text(size: 16pt, weight: "bold")[Midpoint convexity from bounded tree potentials and path costs]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Bounds on scalar sums along tree paths can have two different geometric effects. They keep path vectors bounded.
  When arbitrarily tall trees of these vectors have weakly null child increments bounded away from zero,
  that boundedness obstructs one-sided asymptotic convexity under every equivalent norm.
  At the same time, quadratic restrictions on the coefficients of a test permit a uniform gain when the two sides
  of a midpoint are considered together. We study explicit norms for which both effects can be calculated.

For an infinite-dimensional real Banach space $X$ with norm $N$,
  write $"cof" \( X \)$ for the closed linear subspaces of finite codimension.
  The averaged midpoint and one-sided moduli used here are

#[#set math.equation(numbering: n => "(1)")
 $ hat(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) gt.eq 1) (frac(N \( x + t y \) + N \( x - t y \), 2) - 1) \,\
overline(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] \, wide
  t > 0 . $ <eq:averaged-modulus>]

Asymptotic uniform convexity, abbreviated AUC, means that the second modulus is positive at every positive radius.
  The first requires a gain in the average of two endpoint norms.
  Its infimum over directions of norm at least one agrees with the infimum over unit directions:
  the average on each line is an even convex function of the radius.
  We retain the larger-direction convention because it is convenient for the quantitative estimates below.

Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov introduced asymptotic midpoint uniform convexity using
  the maximum of the two endpoint norms. They gave an AMUC norm on $ell_2$ which is not AUC,
  and asked whether the two properties agree after renorming #cite(label("DKRRZ2016")) Definition 2.2,
  Theorem 2.4, and Section 5. The maximum and averaged conventions have the same positivity property.
  Indeed, after intersecting a subspace with the kernel of a functional norming the center,
  both endpoint norms are at least one; the average excess is then at least half the maximum excess.
  Their numerical moduli must nevertheless be distinguished.

The example of Dilworth et al. has unit ball equal to the closed convex hull of the Hilbert unit ball and ${
  plus.minus \( e_1 + e_n \) : n gt.eq 2 }$. Its dual description combines a Hilbert bound with bounds on the
  shared-root sums of coefficients. Their proof of Theorem 2.4 selects a positive or negative part of a Hilbert
  tail and perturbs a dual norming functional inward #cite(label("DKRRZ2016")) Lemma 2.5 and proof of Theorem 2.4.
  The finite-height global models below extend the shared-root path pattern through many successive generations.
  The paired relative-potential argument uses the related positive-part mechanism under each of its stated
  quadratic constraints, and uses both inward parts.

For separable reflexive spaces with unconditional asymptotic structure, Baudier, Causey, Dilworth, Kutzarova,
  Randrianarivony, Schlumprecht, and Zhang proved equivalence of AMUC and AUC renormability
  #cite(label("BaudierEtAl2017")) Corollary 5.4. Perreau recorded in 2021 that the reflexive question without that
  structural hypothesis remained open #cite(label("Perreau2021")) Introduction, after Theorem C.
  Baudier later answered the general renorming question negatively using the Kadets–Werner modification of the
  Bourgain–Rosenthal construction #cite(label("Baudier2026")) Theorem 1 and Corollary 1.
  The Kadets–Werner example is infinite dimensional and has the Schur property,
  so it is nonreflexive #cite(label("KW2004")) Theorem 2.5 and the paragraph before Corollary 2.6.
  The original martingale construction is due to Bourgain and Rosenthal #cite(label("BR1980"));
  the Kadets–Werner modification is constructed in Section 2 of their preprint #cite(label("KW2004")).

Our purpose is to give explicit tree models and to relate their midpoint geometry to the admissibility of scalar
  tests and the cost of path decompositions. Classical tree spaces provide further context.
  James defined the disjoint-segment norm on an infinite binary tree #cite(label("James1974")) p. 739,
  and Girardi proved AUC for the canonical predual and full dual of the James tree space with their natural norms
  #cite(label("Girardi2001")) Theorems 3 and 5. The segment tests below impose nodewise incomparability across
  distinct segments, a stronger condition than disjointness;
  their relation to earlier tree constructions is discussed when those tests are defined.

The weakly-null-tree viewpoint was motivated by Perreau’s discussion of asymptotic convexity
  #cite(label("Perreau2021")) §3.3. This is motivation for the obstruction, not an import of the norms,
  four-piece construction, or quantitative constants developed here.

=== Bounded potentials on the infinite tree <bounded-potentials-on-the-infinite-tree>

Our first four spaces have coordinates on the countably branching tree $T = bb(N)^(< omega)$,
  with or without a root coordinate. A coefficient family $f$ defines the scalar potential $P_f \( s \) =
  sum_(u prec.curly.eq s) f_u$, summing over the coordinates present in the model. We require $\| P_f \| lt.eq 1$.
  The additional square-sum constraint concerns either each sibling family, each finite antichain,
  or the whole coefficient family. Section 2 gives all four norming sets before defining their completions.
  Theorem 1 proves

$ hat(delta) \( t \) gt.eq sqrt(1 + t^2 \/ 4) - 1 wide \( 0 < t < 1 \) $

for each of them, and rules out an equivalent AUC norm in every case.
  The estimate has a common proof, without identifying the four norms.

The main difficulty is that a head test can already reach the boundary of the allowed interval $\[ - 1 \, 1 \]$.
  An arbitrary tail perturbation can leave that interval. We split its relative potential into two parts directed
  inward from the inherited head value. Taking a positive part is $1$-Lipschitz,
  so the increments of each part are dominated by the original test coefficients.
  Quadratic budgets can then be combined on disjoint head and tail supports.
  Pairing these two tests with the two endpoints gives the estimate.
  Section 3 develops the different tests obtained by selecting one part, grouping parts by attachment sign,
  or choosing exit components separately. These are independent choices of witnesses:
  the later models can be read after Section 2, without passing through Section 3.
  The bounded-tree obstruction is proved locally in Lemma 3 and instantiated with each model’s actual path and
  child-increment bounds.

Section 4 uses edge coordinates and a free root potential, with no root coordinate contributing to evaluation.
  It gives a direct construction of edge witnesses: inward scalar jumps detect the first edges exiting a head,
  while a contractive map into the Euclidean plane preserves the head and detects the deeper tail.
  The section records the bound supplied by this construction and proves its one-sided renorming obstruction directly.

=== Path and segment costs on finite-height trees <path-and-segment-costs-on-finite-height-trees>

For $n gt.eq 1$, restrict the globally constrained model to $T_n = bb(N)^(lt.eq n)$ and denote its norm by $L_n$.
  Write $b_s = sum_(r prec.curly.eq s) e_r$ for a root-path vector and $B_n mu =
  sum_s mu_s b_s$ for $mu in ell_1 \( T_n \)$. For $x in ell_2 \( T_n \)$, Proposition 5 proves the exact identity

$ L_n \( x \) = inf_(x = h + B_n mu) #scale(x: 120%, y: 120%)[\(] parallel h parallel_2 +
  parallel mu parallel_1 #scale(x: 120%, y: 120%)[\)] . $

At height one this is exactly the norm of Dilworth et al. described above:
  the nontrivial root paths are $e_o + e_s$ for children $s$,
  and the root singleton already belongs to the Hilbert ball.
  This connects the potential argument with path decompositions over arbitrary heights.
  Section 5 examines the outer Hilbert sum of these finite-height blocks.
  Dual clipping controls midpoint tails; removing signed path mass gives complementary deficit estimates.
  Section 6 gives two estimates for dyadic martingales whose values are supported in finite heads,
  each chosen before the sign producing the corresponding new value.
  They bound the sum of expected squared norms on successive new coordinate layers,
  with constants $495$ and $252$ in Theorems 16 and 18.

Replacing the sum of costs by their Euclidean combination changes the norm.
  The root singleton then has norm $1 \/ sqrt(2)$, and the dual constraint is a sum of two squares.
  Section 7 proves the corresponding cancellation and stopping estimates.
  In particular, Theorem 26 bounds the tail of an arbitrary displacement by $8
  sqrt(R^2 - parallel x parallel^2)$ when the center is supported in the head and both endpoint norms are at most
  $R$. A different stopping argument improves the coefficient to $7$ in Proposition 30.

Finally, replacing root paths by segments introduces their starting vertices into the cost.
  Sections 8 and 9 analyze a quotient cost computed from the mass of segment starts and the dual of an
  incomparable-segment test norm, respectively. The start-mass cost gives the squared midpoint inequality with
  coefficient $1 \/ 64$ in Theorem 41. Write $P_E$ for coordinate restriction to $E$ and $Q_E = I - P_E$.
  For the incomparable-segment space, Theorem 47 allows an arbitrary displacement $y$:
  if $P_E x = x$ for a finite ancestral head $E$ and $parallel x plus.minus y parallel_(upright(I)) lt.eq 1$, then

$ parallel Q_E y parallel_(upright(I)) lt.eq \( sqrt(2) + sqrt(6) \) sqrt(1 - parallel x parallel_(upright(I))) . $

This estimate comes from shortening segments with opposite boundary coefficients and controlling an unconditional
  mixture of the endpoint atoms. The quadratic path space $X_(upright(q))$ and the segment-start space $X_S$ are
  reflexive, have positive maximum asymptotic midpoint modulus at every positive radius,
  and admit no equivalent AUC norm.

== 2 Four potential norms, one pair of inward tests <sec:coefficient-tests>

We will construct four spaces satisfying the same midpoint bound.
  The path constraint will keep their path vectors bounded;
  the quadratic constraints will permit the same pair of inward perturbations.

Let $T = bb(N)^(< omega)$, with root $o$, and let $T^(+) = T \\ { o }$.
  Write $r prec.curly.eq s$ when $r$ is a predecessor of $s$, write $s^(-)$ for the parent of a nonroot node $s$,
  and write $"ch" \( r \)$ for the children of $r$. On either $I = T$ or $I = T^(+)$,
  the potential of a coefficient family $f$ is

$ P_f \( s \) = sum_(u in I \, med u prec.curly.eq s) f_u . $

There are four norming sets. Their common condition is $\| P_f \( s \) \| lt.eq 1$ at every node;
  their other conditions are as follows:

$ K & I & upright("support condition") & upright("quadratic condition")\
K_(upright(s)) & T^(+) & upright("none") & sum_(u in "ch" \( r \)) \| f_u \|^2 lt.eq 1 quad \( r in T \)\
K_(upright(p)) & T & upright("none") & sum_(u in "ch" \( r \)) \| f_u \|^2 lt.eq 1 quad \( r in T \)\
K_(upright(a)) & T & f in c_00 \( T \) & sum_(u in A) \| f_u \|^2 lt.eq 1 quad \( A upright(" a finite antichain") \)\
K_(upright(g)) & T & f in ell_2 \( T \) & sum_(u in T) \| f_u \|^2 lt.eq 1 . $

An antichain has no two comparable nodes. The root coefficient is present in $K_(upright(p))$,
  even though it belongs to no sibling group. Its absolute value is bounded by the path condition at $o$.

The root-inclusive sibling constraint also has a useful potential description.
  A family $b : T arrow.r \[ - 1 \, 1 \]$ with $sum_(u in "ch" \( r \)) \| b_u - b_r \|^2 lt.eq
  1$ determines exactly one $f in K_(upright(p))$ by $f_o = b_o$ and $f_s = b_s - b_(s^(-))$ for $s eq.not o$.
  Conversely $b = P_f$ recovers every member of $K_(upright(p))$.
  Thus the root label $b_o$ is free in $\[ - 1 \, 1 \]$; the root coefficient records that label relative to a
  dummy parent whose value is fixed at zero. Section 4 omits this root coordinate and studies the resulting norm
  on the edge coordinates. This convention differs from $K_(upright(s))$, whose root potential is fixed at zero.

For each row, put $parallel x parallel_K = sup_(f in K) sum_(s in I) f_s
  x_s$ on $c_00 \( I \)$ and denote the completion by $X_K$.
  Each test set is symmetric, its coefficients have absolute value at most one,
  and each signed singleton is a test. Thus this formula defines a norm, $parallel e_s parallel_K = 1$,
  and coordinate evaluations are continuous. Each test extends to the completion with norm at most one.
  Moreover these extensions remain norming: the supremum of their evaluations is a $1$-Lipschitz function which
  agrees with the norm on a dense subspace. We will write $f \( x \)$ for the extended evaluation.

The global constraint gives the additional comparison $parallel z parallel_(K_(upright(g))) lt.eq
  parallel z parallel_2$ for every finite array $z$. Consequently the restriction of any $phi in
  X_(K_(upright(g)))^(*)$ to the finite arrays is Hilbert-continuous.
  Its coordinate values form an $ell_2 \( T \)$ family. Thus every sequence of distinct coordinate vectors,
  and in particular every sibling sequence, is weakly null in $X_(K_(upright(g)))$.

#thm([Theorem 2.1.])[
  #emph[Each of the four completed spaces $X_K$ is a separable infinite-dimensional real Banach space.
    For $K in { K_(upright(s)) \, K_(upright(p)) \, K_(upright(a)) \, K_(upright(g)) }$ and $0 < t < 1$,
#[#set math.equation(numbering: n => "(2)")
 $ hat(delta)_(X_K) \( t \) gt.eq sqrt(1 + t^2 \/ 4) - 1 . $ <eq:common-bound>]

 None of these spaces admits an equivalent AUC norm.]
] <thm:four>

The proof has two parts. We first obtain the midpoint bound by perturbing a norming test outside a finite set of
  coordinates. We then construct bounded paths whose child increments prevent AUC renorming.

A finite set $D subset T$ is #emph[initial] if it contains the root and every predecessor of each of its nodes.
  Restricting a test to $D$ preserves every displayed condition:
  quadratic sums decrease, while a path sum freezes when the path leaves $D$.
  Consequently, if $x$ is supported in $D ∩ I$, there is a test $f$ supported there with $f \( x \) =
  parallel x parallel_K$. Indeed we can take the supremum over tests on this fixed finite set,
  which form a closed bounded set in a finite-dimensional space. The tail space

$ F_D = { y in X_K : y_s = 0 upright(" for ") s in D ∩ I } $

is closed and has finite codimension. Its finite vectors are dense:
  subtract the finitely many head coordinates from any finite approximation to $y in F_D$.

A one-generation positive-part perturbation appears in the proof of Theorem 2.4 of Dilworth et al.
  #cite(label("DKRRZ2016")): they select a positive or negative part of a Hilbert tail and orient the dual
  perturbation inward from the root value. The next lemma clips a relative potential on each exit component and
  pairs both inward parts.

#thm([Lemma 2.2.])[
  (Paired inward tests).  #emph[For any of the four norms, any $x$ supported in a finite initial $D$,
    any $y in F_D$, and $t > 0$, one has
#[#set math.equation(numbering: n => "(3)")
 $ frac(parallel x + t y parallel_K + parallel x - t y parallel_K, 2) gt.eq
   sqrt(1 - theta^2) thin parallel x parallel_K + frac(t theta, 2) parallel y parallel_K
   wide \( 0 lt.eq theta lt.eq 1 / 2 \) . $ <eq:pair-inequality>]

]
] <thm:constrained-paired>

#proof[
  Choose a head test $f$ with $f \( x \) = parallel x parallel_K$ and an arbitrary test $g$.
    We construct two inward increment families from $g$. On each component of $T \\ D$,
    let $r$ be its last ancestor in $D$, put $c = P_f \( r \)$, and use the relative potential
  $ R \( s \) = P_g \( s \) - P_g \( r \) \, wide \| R \( s \) \| lt.eq 2 . $
  Let $sigma = - 1$ if $c gt.eq 0$ and $sigma = 1$ if $c < 0$, and write $xi_(+) = max { xi \,
    0 }$ for $xi in bb(R)$. Define
  $ U \( s \) = sigma \( sigma R \( s \) \)_(+) \, wide V \( s \) = sigma \( - sigma R \( s \) \)_(+) \, $
  and set $U = V = 0$ on $D$. Thus both $U$ and $V$ point inward from $c$, and $U - V = R$.
    Let $u \, v$ be their edge increments, with root coefficient zero if the root is a coordinate.
  Taking a signed positive part is $1$-Lipschitz and fixes zero.
    Along an edge within a component the reference ancestor is unchanged;
    on an edge leaving $D$ its parent has relative potential zero. It follows in both cases that
  $ \| u_s \| lt.eq \| g_s \| \, wide \| v_s \| lt.eq \| g_s \| quad \( s in.not D \) \, wide u_s - v_s =
    g_s quad \( s in.not D \) . $
  Each quadratic constraint on $u$ or $v$ is therefore at most one,
    using the same coordinate groups as in the chosen row of the table.
    Their potentials are bounded by two, so $u \/ 2 \, v \/ 2 in K$.
    Thus $u$ and $v$ extend to continuous functionals on $X_K$ with norm at most two.
    Coefficient domination also preserves finite support for $K_(upright(a))$ and square summability for
    $K_(upright(g))$. The coefficient identity gives $\( u - v \) \( y \) =
    g \( y \)$ first on finite tails and then, by continuity, on $F_D$.
  Put $a = sqrt(1 - theta^2)$. We claim $a f + theta u \, a f + theta v in K$.
    On a tail component their potentials are $a c + theta U \( s \)$ and $a c + theta V \( s \)$.
    If $c gt.eq 0$, each lies between $a c - 2 theta$ and $a c$; if $c < 0$, each lies between $a c$ and $a c +
    2 theta$. Both intervals lie in $\[ - 1 \, 1 \]$ because $a lt.eq 1$ and $2 theta lt.eq 1$.
    On $D$ the potentials are simply those of $a f$. For any quadratic group $B$,
    the head and tail supports are disjoint, so
  $ sum_(s in B) \| a f_s + theta u_s \|^2 = a^2 sum_(s in B ∩ D) \| f_s \|^2 +
    theta^2 sum_(s in B \\ D) \| u_s \|^2 lt.eq a^2 + theta^2 = 1 . $
  The same calculation applies to $v$; all support requirements remain satisfied.
    This proves the claim for all four rows without identifying any two of their norming sets.
  Evaluate $x + t y$ against $a f + theta u$, and $x - t y$ against $a f + theta v$.
    Since $f$ vanishes on tails and $u \, v$ vanish on the head, adding gives
  $ frac(parallel x + t y parallel_K + parallel x - t y parallel_K, 2) gt.eq a parallel x parallel_K +
    frac(t theta, 2) \( u - v \) \( y \) = a parallel x parallel_K + frac(t theta, 2) g \( y \) . $
  Take the supremum over $g in K$ to obtain (3). ◻
]

The main gain from pairing is that neither endpoint must be chosen in advance.
  A tail potential which is unfavorable for one endpoint supplies an inward test for the other.
  The argument does not lose the tail norm by first choosing one of the two clipped pieces.

#proof[
  Fix $t in \( 0 \, 1 \)$. For a finite unit center $x$ and any $y in F_D$ with $parallel y parallel_K gt.eq 1$,
    choose $theta = t \/ sqrt(4 + t^2) < 1 \/ 2$ in Lemma 2. Its right side becomes $sqrt(1 + t^2 \/ 4)$.
    Now let $x_0$ be any unit vector in the completion. For every $epsilon > 0$,
    choose a finite unit vector $x$ with $parallel x - x_0 parallel_K < epsilon$,
    then choose $D$ containing its support. The triangle inequality loses at most $epsilon$ in the average,
    uniformly over all $y in F_D$ of norm at least one. Therefore
  $ sup_(F in "cof" \( X_K \)) inf_(y in F\
parallel y parallel_K gt.eq 1) (frac(parallel x_0 + t y parallel_K + parallel x_0 - t y parallel_K, 2) - 1) gt.eq
  sqrt(1 + t^2 \/ 4) - 1 - epsilon . $
  The subspace is allowed to depend on $epsilon$. Letting $epsilon arrow.b
    0$ and then taking the infimum over $x_0$ proves (2). ◻
]

The common bound is quadratic: for $0 < t < 1$,

$ sqrt(1 + t^2 \/ 4) - 1 = frac(t^2, 4 \( sqrt(1 + t^2 \/ 4) + 1 \)) gt.eq t^2 / 16 . $

It follows from the same admissibility argument for all four test sets;
  no equality of their norms or optimality of their moduli is asserted.

=== 2.1 Why every equivalent norm still has bounded branches <why-every-equivalent-norm-still-has-bounded-branches>

It remains to rule out every equivalent AUC norm. The next lemma uses the one-sided modulus defined in (1).
  Its mechanism is simple: an AUC norm would force a fixed multiplicative increase at every step along a suitably
  chosen path.

#thm([Lemma 2.3.])[
  #emph[Let $X$ be a real Banach space. Suppose $0 < m lt.eq M < oo$ and $c > 0$, and, for every integer $h gt.eq
    1$, $X$ contains a tree $\( p_s \)_(s in bb(N)^(lt.eq h))$ with $m lt.eq parallel p_s parallel lt.eq M$.
    For every nonterminal $s$, suppose the child increments $d_(s \, n) = p_(s^frown n) -
    p_s$ are weakly null as $n arrow.r oo$ and $parallel d_(s \, n) parallel gt.eq c$.
    If $N$ is an equivalent norm with $alpha parallel dot.op parallel lt.eq N lt.eq
    beta parallel dot.op parallel$ for constants $0 < alpha lt.eq beta < oo$,
    then $overline(delta)_N \( alpha c \/ \( 2 beta M \) \) = 0$.]
] <lem:bounded-tree>

#proof[
  Write $t_0 = alpha c \/ \( 2 beta M \)$ and suppose $0 < gamma < overline(delta)_N \( t_0 \)$.
    At any current node $p_s$, the definition supplies a finite-codimensional $F$ such that
  $ N \( p_s + w \) gt.eq \( 1 + gamma \) N \( p_s \) quad \( w in F \, med N \( w \) = t_0 N \( p_s \) \) . $
  The same inequality holds when $N \( w \) gt.eq t_0 N \( p_s \)$.
    To see this, write a shorter point on the ray as a convex combination of $p_s$ and $p_s + w$;
    convexity gives $N \( p_s + r w \) - N \( p_s \) gt.eq r \[ N \( p_s + w \) - N \( p_s \) \]$ for $r gt.eq 1$.
  The quotient $X \/ F$ is finite dimensional. Since $d_(s \, n)$ is weakly null,
    choose $w_n in F$ with $N \( w_n - d_(s \, n) \) arrow.r 0$.
    Eventually $N \( w_n \) gt.eq alpha c \/ 2 gt.eq t_0 N \( p_s \)$.
    Choosing the approximation error at most $gamma N \( p_s \) \/ 2$ gives a child satisfying
  $ N \( p_(s^frown n) \) gt.eq \( 1 + gamma \/ 2 \) N \( p_s \) . $
  Choose $h$ large enough that $alpha m \( 1 + gamma \/ 2 \)^h > beta M$,
    and perform the selection in a tree of height $h$. Repeating it $h$ times yields a path whose last vector has
    $N$-norm at least $alpha m \( 1 + gamma \/ 2 \)^h$. This exceeds the uniform bound $beta M$, a contradiction.
    Finally, $overline(delta)_N \( t_0 \) gt.eq 0$: at a unit center intersect any candidate subspace with the
    kernel of a norming functional, on which the perturbed norms are at least one. This proves equality to zero. ◻
]

#proof[
  #emph[Completion of Theorem 1.] The coordinate vectors are linearly independent,
    so each space is infinite dimensional. Finite rational coordinate combinations are dense,
    so each space is separable. For $s in I$, set $p_s = sum_(u in I \, med u prec.curly.eq s) e_u$.
    Its norm is one: the path condition gives the upper bound, and a singleton test gives the lower bound.
    In the rootless model begin at any fixed nonroot node $v$ and use the subtree $\( p_(v^frown s) \)_s$ so that
    the initial vector is nonzero. In all four models,
  $ ∥sum_(n in A) a_n e_(s^frown n)∥_K lt.eq (sum_(n in A) \| a_n \|^2)^(1 \/ 2)
    quad \( A subset bb(N) upright(" finite") \) . $
  This is the sibling constraint in the first two models. Siblings form an antichain in the third and are part of
    the globally constrained family in the fourth. If $phi.alt in X_K^(*)$, use $a_n =
    phi.alt \( e_(s^frown n) \)$ in this inequality to obtain
  $ sum_(n in A) \| phi.alt \( e_(s^frown n) \) \|^2 lt.eq parallel phi.alt parallel^2 . $
  Thus the child increments are weakly null, and each has norm one. Lemma 3 applies with $m = M = c = 1$.
    In particular, for every equivalent norm as in that lemma, $overline(delta)_N \( alpha \/ \( 2 beta \) \) = 0$. ◻
]

== 3 Selecting tail tests <sec:selections>

The paired argument uses both parts of every relative potential.
  Sometimes one needs a single test, or wants to decide separately which exit components contribute to each
  endpoint. We give these choices explicitly. They preserve more information about the witnessing test,
  although their numerical midpoint bounds are weaker than Theorem 1.
  The later path and segment arguments do not depend on this section;
  the numerical estimates below illustrate what each selection of a witness retains.

Throughout this section, $K$ is one of the four norming sets of Section 2, with coordinate set $I$.
  Let $D$ be a finite initial set and let $f in K$ be supported in $D ∩ I$.
  An exit component is a subtree whose first vertex lies outside $D$ and whose parent $r$ lies in $D$.
  Its inherited head value is $c = P_f \( r \)$. Given an arbitrary test $g in K$,
  define its relative potential on that component by $R = P_g - P_g \( r \)$. Thus $\| R \| lt.eq 2$.
  The test $g$ is chosen to evaluate a vector $y in F_D$; it is not assumed to be supported outside $D$.

We first reuse the inward increment families $u \, v$ from Lemma 2.
  That proof establishes $u \/ 2 \, v \/ 2 in K$, so their evaluations are continuous on $X_K$,
  and extends $\( u - v \) \( y \) = g \( y \)$ from finite tails to every $y in F_D$.

=== 3.1 One of two inward parts <sec:two-part-selection>

Let $u \, v$ be the inward increments constructed in that proof.
  In addition to the tests used there, for $0 lt.eq lambda lt.eq 1 \/ 2$ we have

#[#set math.equation(numbering: n => "(4)")
 $ frac(f + lambda u, sqrt(1 + lambda^2)) \, wide frac(f + lambda v, sqrt(1 + lambda^2)) med
   in K . $ <eq:normalized-inward>]

Indeed $c + lambda U$ and $c + lambda V$ already lie in $\[ - 1 \, 1 \]$.
  Each quadratic sum is at most $1 + lambda^2$, because the supports of the head and tail increments are disjoint.
  Dividing enforces the quadratic bound and preserves the path bound and support requirements.

The identity $\( u - v \) \( y \) = g \( y \)$ shows that one of these two inward parts retains at least half the
  evaluation:

$ max { \| u \( y \) \| \, \| v \( y \) \| } gt.eq \| g \( y \) \| \/ 2 wide \( y in F_D \) . $

This is the single-part choice, available in all four models.
  To see two quantitative specializations, suppose $parallel x parallel_K = 1$, $x$ is supported in $D$,
  $f \( x \) = 1$, $y in F_D$, and $parallel y parallel_K gt.eq 1$. Evaluation of (4) at the favorable endpoint gives

$ max_plus.minus parallel x plus.minus t y parallel_K gt.eq
  frac(1 + lambda t \| g \( y \) \| \/ 2, sqrt(1 + lambda^2)) . $

For $0 < t < 1$, set $lambda = t \/ 2$ and take the supremum over $g$.
  The maximum is at least $sqrt(1 + t^2 \/ 4)$; each endpoint is at least one by the head test.
  Thus this selection yields average gain $D \( t \) = \( sqrt(1 + t^2 \/ 4) - 1 \) \/ 2$ at finite centers.
  Approximation of a unit center by a finite unit center within $D \( t \) \/ 2$ gives the gain $D \( t \) \/ 2$.
  This proves the rootless sibling estimate directly using a single chosen tail part.

The square-root normalization can also be replaced by the test $sqrt(1 - theta^2) f + theta q$,
  where $q$ is a chosen member of ${ u \, v }$. If $\| g \( y \) \| gt.eq parallel y parallel_K \/ 2$,
  then $\| q \( y \) \| gt.eq parallel y parallel_K \/ 4$. Taking $theta = t \/ 8$ gives

$ max_plus.minus parallel x plus.minus t y parallel_K gt.eq sqrt(1 - theta^2) +
  t theta parallel y parallel_K \/ 4 gt.eq 1 + t^2 \/ 64 . $

Both endpoints remain at least one. In the globally constrained space this gives finite-center average gain
  $t^2 \/ 128$, and approximation within $t^2 \/ 256$ gives the completed-space gain $t^2 \/ 256$.
  The continuity established above applies also when the global test has infinite support.

=== 3.2 Four pieces classified by attachment sign <sec:four-piece-selection>

For each $i in { - 1 \, 1 }$, consider those exit components with $i = 1$ when $c gt.eq 0$ and $i = -
  1$ otherwise. On these components take the potentials $R_(+)$ and $\( - R \)_(+)$,
  and take zero on all other components and on $D$. This produces four nonnegative potentials $G_(i \, +) \,
  G_(i \, -)$, all bounded by two. Their increments $g_(i \, +) \, g_(i \, -)$ satisfy coordinatewise

$ \| g_(i \, plus.minus) \( s \) \| lt.eq \| g \( s \) \| \, wide g upright(bold(1))_(T \\ D) =
  sum_(i = plus.minus 1) \( g_(i \, +) - g_(i \, -) \) . $

The coefficient bounds hold also on exit edges because the relative potential there starts at zero.
  Consequently $g_(i \, plus.minus) \/ 2 in K$. The displayed coefficient identity holds on finite tails and
  extends to every $y in F_D$ by continuity. One of the four pieces therefore has evaluation of magnitude at least
  $\| g \( y \) \| \/ 4$. In particular, when $\| g \( y \) \| gt.eq parallel y parallel_K \/ 2$,
  it retains at least $parallel y parallel_K \/ 8$.

This four-piece choice is also available in all four models.
  In the root-inclusive sibling model, it gives a direct argument at an arbitrary unit center $x$. Fix $0 < t < 1$, put

$ lambda = t \/ 16 \, wide a = sqrt(1 - lambda^2) \, wide eta = t^2 \/ 2048 \, $

and choose a finite $x_0$ with $parallel x - x_0 parallel lt.eq eta$.
  Take $D$ containing its support and a test $f$ supported in $D$ with $f \( x_0 \) gt.eq parallel x_0 parallel -
  eta gt.eq 1 - 2 eta$. Choose a norming functional $phi.alt$ for $x$, and impose in addition $phi.alt \( y \) =
  0$ on the tail space. This is still a closed finite-codimensional subspace.
  For $y$ in this subspace with $parallel y parallel gt.eq 1$,
  choose $g in K_(upright(p))$ with $\| g \( y \) \| gt.eq parallel y parallel \/ 2$.
  Select a four-piece increment $q$ as above and multiply it by the sign that points inward from its attachment
  class. Then $a f + lambda q$ is admissible: its head and tail quadratic budgets are $a^2$ and $lambda^2$,
  and its tail potential changes the inherited value inward by at most $2 lambda$.
  This test evaluates $x$ at least at $a - 3 eta$, since it has norm at most one and agrees with $a f$ on $x_0$. Hence

$ max_plus.minus parallel x plus.minus t y parallel gt.eq 1 - lambda^2 - 3 eta + t lambda \/ 8 = 1 +
  5 t^2 \/ 2048 gt.eq 1 + t^2 \/ 512 . $

The functional $phi.alt$ gives the lower bound one for both endpoints.
  Their average therefore has gain at least $t^2 \/ 1024$.

There is a different useful normalization of the same four-piece selection in the global model.
  For a unit $x in X_(K_(upright(g)))$, put $alpha = t \/ 64$ and $eta = alpha^2 \/ 10$;
  approximate $x$ by a vector $x_0$ supported in $D$ within $eta \/ 10$.
  A head norming test for $x_0$ has $f \( x \) gt.eq 1 - eta$.
  For $y in F_D$ with $parallel y parallel gt.eq 1$, choose an inward piece $q$ with $\| q \( y \) \| gt.eq
  1 \/ 8$. Its functional norm is at most two, so $\| q \( x \) \| lt.eq 2 eta \/ 10$. The test

$ H = frac(f + alpha q, sqrt(1 + alpha^2)) $

is admissible by disjoint global square sums and the inward path bound. Both endpoint norms are at least $1 - eta$, and

#[#set math.equation(numbering: n => "(5)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq
   frac(1 - eta - 2 alpha eta \/ 10 + alpha t \/ 8, sqrt(1 + alpha^2)) gt.eq 1 +
   2 alpha^2 . $ <eq:global-four-piece-estimate>]

For the last inequality, $alpha t \/ 8 = 8 alpha^2$ and $sqrt(1 + alpha^2) lt.eq 1 + alpha^2 \/ 2$.
  The numerator is $1 + \( 79 \/ 10 \) alpha^2 - alpha^3 \/ 50$,
  which dominates $\( 1 + 2 alpha^2 \) \( 1 + alpha^2 \/ 2 \)$ for $0 lt.eq alpha lt.eq 1 \/ 64$.
  The two endpoint bounds yield average gain at least $19 alpha^2 \/ 20 = 19 t^2 \/ 81920$.

=== 3.3 Independent component selection <sec:component-selection>

For $K = K_(upright(a))$ every test has finite support. Thus only finitely many exit components carry nonzero
  increments, and we can choose pieces component by component.
  We first describe the two choices and their evaluation guarantees, then give their numerical specializations.

For the first choice, take $g in K_(upright(a))$ and split its relative potential as

$ R = 2 \( R_(+) \/ 2 - \( - R \)_(+) \/ 2 \) . $

The two increment families $g^(+) \, g^(-)$ have coefficients bounded by $\| g_s \| \/
  2$ and component potentials in $\[ 0 \, 1 \]$, so both belong to $K_(upright(a))$.
  All component sums below are finite. The coefficient identity $g upright(bold(1))_(T \\ D) =
  2 \( g^(+) - g^(-) \)$ shows that one family, denoted $k$,
  satisfies $\| k \( y \) \| gt.eq \| g \( y \) \| \/ 4$. Let $q_j$ be its evaluation on the $j$th exit component.
  Then $sum_j \| q_j \| gt.eq \| g \( y \) \| \/ 4$. Choose on each component a sign $d_j$ pointing inward from
  its inherited head value. For $0 < t < 1$, put $r = t \/ 32$ and $s = sqrt(1 - r^2)$.
  Adjoining either $r d_j k$ or zero on each component to $s f$ gives a test.
  The path value moves inward by at most $r$, and every antichain receives square sum at most $s^2 + r^2 = 1$.
  Retain the components with $d_j q_j > 0$ for the plus endpoint and those with $d_j q_j <
  0$ for the minus endpoint. For a vector $x_0$ supported in $D$, the resulting pair of tests gives

$ frac(parallel x_0 + t y parallel + parallel x_0 - t y parallel, 2) gt.eq s f \( x_0 \) +
  frac(t r, 2) sum_j \| q_j \| gt.eq s f \( x_0 \) + t r \| g \( y \) \| \/ 8 . $

For the second choice, split the relative potential of $g$ into its positive and negative parts on each exit
  component. Select the part whose evaluation has magnitude at least half the magnitude of the full component
  evaluation, and orient it inward. If the selected increments are $h_j$, then

$ sum_j \| h_j \( y \) \| gt.eq \| g \( y \) \| \/ 2 . $

Retain either all positively evaluating pieces or all negatively evaluating pieces,
  according to which group has greater total magnitude. Their sum $h$ satisfies $\| h \( y \) \| gt.eq \|
  g \( y \) \| \/ 4$, $\| h_s \| lt.eq \| g_s \|$, and $h \/ 2 in K_(upright(a))$. All these arrays are finite.
  For $0 lt.eq alpha lt.eq 1 \/ 2$, the single test $sqrt(1 - alpha^2) f +
  alpha h$ is admissible by the same antichain budget and inward path argument.

We now recover the two completed-space estimates. First fix $0 < t < 1$ and a unit $x$ in $X_(K_(upright(a)))$.
  Set $r = t \/ 32$, $s = sqrt(1 - r^2)$, and $eta = t^2 \/ 10000$.
  Choose a finite $x_0$ within $eta$ of $x$ and a test $f$ supported in a finite initial $D$ with $f \( x_0 \)
  gt.eq 1 - 2 eta$. For $y in F_D$ of norm at least one choose $g in K_(upright(a))$ with $g \( y \) gt.eq
  1 \/ 2$. The first choice gives

$ frac(parallel x_0 + t y parallel + parallel x_0 - t y parallel, 2) gt.eq s \( 1 - 2 eta \) + t r \/ 16 . $

Returning to $x$ loses at most $eta$. Since $s gt.eq 1 - r^2$, the final excess is at least

#[#set math.equation(numbering: n => "(6)")
 $ t r \/ 16 - r^2 - 3 eta = 433 / 640000 t^2 > 0 . $ <eq:antichain-component-bound>]

The subspace was fixed before $y$, as required by the modulus.

For the single-test specialization put $alpha = t \/ 16$ and $epsilon = t^2 \/ 2048$.
  Choose finite $x_0$ within $epsilon$ of $x$ and a finite test $f$ with $f \( x \) > 1 - epsilon$;
  enlarge $D$ to contain both supports. For $y in F_D$ of norm at least one choose $g in
  K_(upright(a))$ with $g \( y \) > parallel y parallel \/ 2$.
  The second choice gives an inward $h$ with $\| h \( y \) \| gt.eq 1 \/ 8$.
  Since $h$ vanishes on $D$ and has functional norm at most two, $\| h \( x \) \| lt.eq 2 epsilon$.
  Evaluating $sqrt(1 - alpha^2) f + alpha h$ at a favorable endpoint bounds it below by

$ 1 - alpha^2 - \( 1 + 2 alpha \) epsilon + alpha t \/ 8 \, $

while the head test bounds the other by $1 - epsilon$. The average excess is consequently at least

$ frac(alpha t \/ 8 - alpha^2 - \( 2 + 2 alpha \) epsilon, 2) gt.eq frac(5 t^2, 4096) gt.eq t^2 / 1024 . $

This last choice keeps the full coefficient domination of $g$ and uses only one inward test at the favorable
  endpoint. The common paired proof and these selection proofs therefore provide different witnesses under the
  same explicitly stated antichain constraint.

== 4 A free root and a planar perturbation <fr:section>

We now study an edge norm defined by bounded scalar potentials whose root value is free.
  The root-inclusive sibling model also permits such a root value, but records it as a root coefficient;
  here it contributes no coordinate. The rootless model $K_(upright(s))$ instead fixes the root potential at zero.
  We give a direct construction of witnesses in the edge coordinates:
  inward jumps detect the first edges beyond a finite head,
  and a perturbation in the Euclidean plane detects the remaining edges.

Let $T = bb(N)^(< omega)$, with root $o$, and let $T^(+) = T \\ { o }$.
  Identify $s in T^(+)$ with the edge from its parent $s^(-)$ to $s$,
  and write $"ch" \( v \)$ for the children of $v$. Define

#[#set math.equation(numbering: n => "(7)")
 $ cal(B) = {b : T arrow.r \[ - 1 \, 1 \] : sum_(w in "ch" \( v \)) \| b_w - b_v \|^2 lt.eq
   1 quad \( v in T \)} . $ <fr:tests>]

For $b in cal(B)$ and $x in c_00 \( T^(+) \)$ put

#[#set math.equation(numbering: n => "(8)")
 $ f_b \( x \) = sum_(s in T^(+)) x_s \( b_s - b_(s^(-)) \) \, wide parallel x parallel_(upright(e)) =
   sup_(b in cal(B)) f_b \( x \) \, $ <fr:norm>]

and let $X_(upright(e))$ be the completion. In particular, there is no dummy edge above $o$ and no condition $b_o = 0$.

Every increment in (7) has absolute value at most one. For each $s in T^(+)$,
  the potential equal to one on the subtree rooted at $s$ and zero elsewhere has just one nonzero increment,
  at $s$. Together with symmetry of $cal(B)$, these observations give

$ \| x_s \| lt.eq parallel x parallel_(upright(e)) lt.eq sum_(u in T^(+)) \| x_u \| \, wide
  parallel e_s parallel_(upright(e)) = 1 . $

Thus (8) is a norm and all coordinate functionals are continuous.
  Each $f_b$ extends to $X_(upright(e))$ with norm at most one, and the same supremum formula remains valid there:
  both sides are $1$-Lipschitz and agree on the dense space $c_00 \( T^(+) \)$.

Call $D subset T$ a finite initial subtree if it is finite, contains $o$,
  and contains every predecessor of each of its nodes. Given a potential $b$,
  retain its labels on $D$ and freeze them at the last node in $D$ along every path leaving $D$.
  This preserves admissibility and sets precisely the increments outside $D$ to zero.
  Consequently the coordinate projection

$ P_D x = sum_(s in D ∩ T^(+)) x_s e_s $

is contractive, and $Q_D = I - P_D$ has norm at most two. The space

#[#set math.equation(numbering: n => "(9)")
 $ F_D = ker P_D = overline("span") { e_s : s in.not D } $ <fr:tail>]

is closed and has finite codimension. For the second equality,
  apply $Q_D$ to finite approximants of a vector in $ker P_D$.
  Finally, a finite vector supported in $D$ has a norming potential frozen outside $D$.
  Indeed the possible labels on $D$ form a compact set: they lie in $\[ - 1 \, 1 \]^D$ and satisfy the finitely
  many closed child constraints within $D$; freezing gives an admissible extension of every such choice.

#thm([Theorem 4.1.])[
  #emph[The real Banach space $X_(upright(e))$ defined by (7) and (8) satisfies
#[#set math.equation(numbering: n => "(10)")
 $ hat(delta)_(parallel dot.op parallel_(upright(e))) \( t \) gt.eq
   frac(sqrt(1 + t^2 \/ 576) - 1, 4) wide \( 0 < t < 1 \) . $ <fr:modulus>]

 It admits no equivalent AUC norm. More precisely, if $alpha parallel dot.op parallel_(upright(e)) lt.eq N lt.eq
   beta parallel dot.op parallel_(upright(e))$, where $0 < alpha lt.eq beta < oo$,
   then $overline(delta)_N \( alpha \/ \( 4 beta \) \) = 0$.]
] <thm:free-root-modulus>

The midpoint estimate is proved first for finite centers and tails.
  The head norming potential already gives a lower bound for both endpoints.
  We therefore need only increase one endpoint by an amount depending on $t$.
  The first-exit and deeper-edge cases supply this increase by different extensions of that potential.

#proof[
  Fix $0 < t < 1$. Let $x$ be a finite unit vector supported in an initial subtree $D$,
    and choose a norming potential $b^0$ frozen outside $D$. For every $y in F_D$,
  #[#set math.equation(numbering: n => "(11)")
   $ f_(b^0) \( x \) = 1 \, wide f_(b^0) \( y \) = 0 \, wide parallel x + t y parallel_(upright(e)) \, med
     parallel x - t y parallel_(upright(e)) gt.eq 1 . $ <fr:two-lower-bounds>]
  Suppose first that $y in F_D$ is finite and $parallel y parallel_(upright(e)) = 1$.
    Let $E = { r in.not D : r^(-) in D }$ be the first-exit nodes.
    Split $y = y_E + y_L$ into its coordinates on $E$ and on the deeper edges.
  #emph[First-exit case.] Suppose some $c in cal(B)$ satisfies $\| f_c \( y_E \) \| gt.eq 1 \/ 2$. For each $v in D$ set
  $ L_v = (sum_(r in "ch" \( v \) \\ D) \| y_r \|^2)^(1 \/ 2) . $
  Cauchy–Schwarz in each sibling group gives $sum_(v in D) L_v gt.eq 1 \/ 2$.
    Choose the inward sign $sigma_v = - 1$ when $b_v^0 gt.eq 0$ and $sigma_v = 1$ when $b_v^0 < 0$.
    For $epsilon in { - 1 \, 1 }$ define
  $ L_(v \, epsilon) = (sum_(r in "ch" \( v \) \\ D\
epsilon sigma_v y_r > 0) \| y_r \|^2)^(1 \/ 2) . $
  Since $L_(v \, 1) + L_(v \, - 1) gt.eq L_v$, one common sign $epsilon$ has $sum_v L_(v \, epsilon) gt.eq 1 \/ 4$.
  For $0 < h < 1$, multiply all head labels by $1 - h^2$. At a selected exit $r$ from $v$, assign the jump
  $ d_r = frac(epsilon h y_r, L_(v \, epsilon)) \; $
  assign zero at the other exits, omit groups with $L_(v \, epsilon) = 0$,
    and freeze each exit label throughout its descendant subtree.
    Every nonzero jump has sign $sigma_v$ and magnitude at most $h$.
    It points toward zero from the head label; if it crosses zero, its resulting magnitude is at most $h < 1$.
    Thus all labels remain in $\[ - 1 \, 1 \]$. At a parent in $D$ the internal and exit increments have total
    square sum at most
  $ \( 1 - h^2 \)^2 + h^2 lt.eq 1 \, $
  and outside $D$ all further increments vanish. This is an admissible potential.
    Its evaluations on $x$ and $y$ are respectively $1 - h^2$ and $epsilon h sum_v L_(v \, epsilon)$. Hence
  #[#set math.equation(numbering: n => "(12)")
   $ max { parallel x + t y parallel_(upright(e)) \, parallel x - t y parallel_(upright(e)) } gt.eq 1 - h^2 +
     t h \/ 4 . $ <fr:exit>]
  Taking $h = t \/ 8$ gives the lower bound $1 + t^2 \/ 64$.
  #emph[Deeper-edge case.] If the preceding case fails, every admissible test has $\| f_c \( y_E \) \| < 1 \/ 2$.
    Choose $c in cal(B)$ with $f_c \( y \) > 5 \/ 6$; then $f_c \( y_L \) > 1 \/ 3$.
    We shall preserve the norming head on the horizontal axis and use the vertical coordinate to detect this
    deeper contribution.
  Consider labels $B_v in bb(R)^2$ satisfying
  #[#set math.equation(numbering: n => "(13)")
   $ \| B_v \|_2 lt.eq 1 \, wide sum_(w in "ch" \( v \)) \| B_w - B_v \|_2^2 lt.eq 1 . $ <fr:plane-admissibility>]
  Every scalar projection of $B$ onto a unit vector belongs to $cal(B)$. Therefore the linear map
  $ A_B z = sum_(s in T^(+)) z_s \( B_s - B_(s^(-)) \) $
  satisfies $\| A_B z \|_2 lt.eq parallel z parallel_(upright(e))$ for finite $z$,
    and extends contractively to $X_(upright(e))$.
  Set $B_v = \( b_v^0 \, 0 \)$ on $D$. For each first-exit node $r$, put $u = b_(r^(-))^0$ and,
    throughout the subtree rooted at $r$, define
  #[#set math.equation(numbering: n => "(14)")
   $ k = 1 / 8 \, wide z_v = k \( c_v - c_r \) \, wide B_v = #scale(x: 120%, y: 120%)[\(] u sqrt(1 - z_v^2) \,
     z_v #scale(x: 120%, y: 120%)[\)] . $ <fr:plane-extension>]
  The first-exit increment is zero because $z_r = 0$. Also $\| z_v \| lt.eq 2 k = 1 \/ 4$, and $\| B_v \|_2^2 =
    u^2 \( 1 - z_v^2 \) + z_v^2 lt.eq 1$. For fixed $u$ and $c_r$, the map
  $ H \( a \) = #scale(x: 120%, y: 120%)[\(] u sqrt(1 - k^2 \( a - c_r \)^2) \,
    k \( a - c_r \) #scale(x: 120%, y: 120%)[\)] \, wide - 1 lt.eq a lt.eq 1 \, $
  has
  #[#set math.equation(numbering: n => "(15)")
   $ \| H' \( a \) \|_2^2 = k^2 + frac(u^2 k^4 \( a - c_r \)^2, 1 - k^2 \( a - c_r \)^2) lt.eq
     frac(k^2, 1 - 4 k^2) = 1 / 60 . $ <fr:plane-lipschitz>]
  It is consequently $1$-Lipschitz. At a parent outside $D$ this same map applies to all its children,
    so the child-increment constraint follows from that for $c$.
    At a parent in $D$, the original head increments remain admissible and all first-exit increments are zero.
    This verifies (13) at the boundary as well as in every descendant subtree.
  Now $A_B x = \( 1 \, 0 \)$, whereas the second coordinate of $A_B y$ is $k f_c \( y_L \) > 1 \/ 24$.
    The first exits contribute zero to that coordinate. The parallelogram identity gives
  #[#set math.equation(numbering: n => "(16)")
   $ max { parallel x + t y parallel_(upright(e))^2 \, parallel x - t y parallel_(upright(e))^2 } & gt.eq
     frac(\| A_B x + t A_B y \|_2^2 + \| A_B x - t A_B y \|_2^2, 2)\
 & gt.eq 1 + t^2 \/ 576 . $ <fr:deep>]
  #emph[Completion and arbitrary centers.] Put $G \( t \) = sqrt(1 + t^2 \/ 576) - 1$.
    Since $G \( t \) lt.eq t^2 \/ 1152 < t^2 \/ 64$, both cases give a maximum endpoint norm at least $1 +
    G \( t \)$. Combining this with (11) yields an average at least $1 + G \( t \) \/ 2$.
    Finite unit vectors are dense in the unit sphere of $F_D$, by (9) followed by normalization,
    so continuity gives this same estimate for every unit $y in F_D$. For a unit $u in F_D$, the function
  $ r mapsto frac(parallel x + r u parallel_(upright(e)) + parallel x - r u parallel_(upright(e)), 2) $
  is convex and even, hence nondecreasing on $\[ 0 \, oo \)$.
    The estimate therefore also holds for every $y in F_D$ with $parallel y parallel_(upright(e)) gt.eq 1$.
    Given an arbitrary unit center, choose a finite unit center within $G \( t \) \/
    4$ and use its subspace $F_D$. The reverse triangle inequality loses at most $G \( t \) \/ 4$ in the average.
    Taking the infimum over these tail directions, the supremum over finite-codimensional subspaces,
    and then the infimum over unit centers proves (10), with the direction convention of (1).
  #emph[The renorming obstruction.] For nonroot $s$, let $p_s$ be the sum of the edges on the path from $o$ to
    $s$. Telescoping gives $f_b \( p_s \) = b_s - b_o$, and the singleton increment test gives the lower bound in
  #[#set math.equation(numbering: n => "(17)")
   $ 1 lt.eq parallel p_s parallel_(upright(e)) lt.eq 2 . $ <fr:paths>]
  For every fixed parent $s$ and finite scalar family $\( a_n \)$,
  #[#set math.equation(numbering: n => "(18)")
   $ ∥sum_(n = 1)^m a_n e_(s^frown n)∥_(upright(e)) lt.eq (sum_(n = 1)^m \| a_n \|^2)^(1 \/ 2) . $ <fr:siblings>]
  This follows directly from the sibling constraint in (7).
    If $phi in X_(upright(e))^(*)$, applying (18) with $a_n = phi \( e_(s^frown n) \)$ shows
  $ sum_(n = 1)^m \| phi \( e_(s^frown n) \) \|^2 lt.eq parallel phi parallel^2 \; $
  thus $e_(s^frown n) arrow.r 0$ weakly against the whole continuous dual.
    These increments have norm one, and $p_(s^frown n) = p_s + e_(s^frown n)$.
    Start at any fixed nonroot $v$ and use the tree $\( p_(v^frown s) \)_(s in T)$.
    By (17) and (18), Lemma 3 applies with $m = 1$, $M = 2$ and $c = 1$.
    Its obstruction scale is exactly $alpha c \/ \( 2 beta M \) = alpha \/ \( 4 beta \)$, proving the final assertion. ◻
]

== 5 Linear costs of root paths <sec:linear-paths>

The global constraint on a test has a concrete dual meaning.
  A vector can be paid for either as a Hilbert vector or as a sum of root paths;
  the norm is the least sum of these two costs. We first prove this exact identification.
  We then use its two descriptions in different ways: clipping controls dual tests,
  whereas removal and prediction control signed path coefficients.

=== 5.1 The norm and its finite heads <the-norm-and-its-finite-heads>

For an integer $n gt.eq 1$, let $T_n = union.big_(j = 0)^n bb(N)^j$, with root $o =
  diameter$ and prefix order $prec.curly.eq$. The root belongs to every root path.
  On the real Hilbert space $H_n = ell_2 \( T_n \)$ put

$ b_s = sum_(r prec.curly.eq s) e_r \, wide B_n mu = sum_(s in T_n) mu_s b_s quad \( mu in ell_1 \( T_n \) \) . $

Since $parallel b_s parallel_2 lt.eq sqrt(n + 1)$, the series defining $B_n
  mu$ converges absolutely in $H_n$ and $parallel B_n parallel lt.eq sqrt(n + 1)$. Define

#[#set math.equation(numbering: n => "(19)")
 $ L_n \( x \) & = inf_(x = h + B_n mu) #scale(x: 120%, y: 120%)[\(] parallel h parallel_2 +
   parallel mu parallel_1 #scale(x: 120%, y: 120%)[\)] \,\
p_n \( f \) & = max {parallel f parallel_2 \, sup_(s in T_n) lr(|sum_(r prec.curly.eq s) f_r|)} . $ <eq:linear-cost>]

The infimum ranges over $h in H_n$ and $mu in ell_1 \( T_n \)$; attainment is not assumed.
  Restricting $mu$ to finite support gives the same infimum:
  truncate an arbitrary $mu$ in $ell_1$ and absorb the vanishing remainder $B_n \( mu - mu^(\( k \)) \)$ into $h$.

#thm([Proposition 5.1.])[
  (Exact duality for the linear cost).  #emph[The space $X_n = \( H_n \, L_n \)$ is complete and
$ frac(parallel x parallel_2, sqrt(n + 1)) lt.eq L_n \( x \) lt.eq parallel x parallel_2 \, wide L_n \( x \) =
  sup_(p_n \( f \) lt.eq 1) chevron.l f \, x chevron.r . $

 Every coordinate satisfies $\| x_s \| lt.eq L_n \( x \)$.
   Its continuous dual is $H_n$, under the Hilbert pairing, with norm $p_n$.
   In particular $L_n$ is exactly the global test norm on $T_n$.]
] <prop:linear-duality>

#proof[
  The choice $h = x$, $mu = 0$ proves the upper bound. Every representation of $x$ satisfies
  $ parallel x parallel_2 lt.eq parallel h parallel_2 + sqrt(n + 1) parallel mu parallel_1 lt.eq
    sqrt(n + 1) \( parallel h parallel_2 + parallel mu parallel_1 \) \, $
  which proves the lower bound. Scaling and adding representations,
    chosen within an arbitrary error of their infima, prove homogeneity and the triangle inequality.
    The lower bound gives definiteness; norm equivalence gives completeness and density of finite arrays.
  For $p_n \( f \) lt.eq 1$, absolute convergence allows us to write
  $ \| chevron.l f \, x chevron.r \| lt.eq parallel h parallel_2 +
    sum_s \| mu_s \| lr(|sum_(r prec.curly.eq s) f_r|) lt.eq parallel h parallel_2 + parallel mu parallel_1 . $
  Thus the displayed supremum is at most $L_n \( x \)$. Conversely, Hahn–Banach gives, for $x eq.not 0$,
    a functional $phi$ such that $phi \( x \) = L_n \( x \)$ and $\| phi \( z \) \| lt.eq L_n \( z \)$.
    Since $L_n \( z \) lt.eq parallel z parallel_2$, it has the form $phi \( z \) = chevron.l f \,
    z chevron.r$ with $parallel f parallel_2 lt.eq 1$. The representation $b_s =
    B_n e_s$ gives $L_n \( b_s \) lt.eq 1$, hence $\| sum_(r prec.curly.eq s) f_r \| = \| phi \( b_s \) \| lt.eq
    1$. This proves equality, including the trivial case $x = 0$.
  For an arbitrary $f in H_n$, the representation estimate gives dual norm at most $p_n \( f \)$.
    The Hilbert unit ball and every $plus.minus b_s$ belong to the $L_n$ unit ball.
    Testing on these vectors gives both reverse bounds in (19), and therefore the exact dual norm. ◻
]

A set $A subset.eq T_n$ is an #emph[initial set] if it contains every prefix of each of its vertices;
  the empty set is allowed. Write $P_A$ for coordinate restriction to $A$.
  Restricting a root path to $A$ gives either zero or the root path ending at its last vertex in $A$.
  Grouping coefficients by this endpoint cannot increase their $ell_1$ norm.
  Therefore $P_A$ is contractive on $X_n$. It is also contractive on its dual:
  restriction freezes every prefix sum at its last retained vertex and decreases the Hilbert norm.

For a finite initial set $A$, the unit ball of the induced norm on $bb(R)^A$ is

#[#set math.equation(numbering: n => "(20)")
 $ "conv" (B_(ell_2 \( A \)) union { b_s \, - b_s : s in A }) . $ <eq:linear-finite-ball>]

Indeed this is a compact convex symmetric set whose polar is precisely the set of tests in (19) supported on $A$.
  Finite-dimensional separation and Proposition 5 identify the balls.
  The assertion of compactness concerns the finite head only.
  On the whole block the ball is the norm-closed convex hull of the Hilbert ball and the signed paths:
  one inclusion follows from convexity, and an almost optimal representation of a vector in the unit ball,
  followed by finite truncation and a scaling tending to one, proves the other.

At height one, this closed convex hull is exactly the unit ball used by Dilworth et al.:
  the paths are the root singleton $e_o$, already in the Hilbert ball, and the vectors $e_o +
  e_s$ for children $s$. Under the identification of $o$ with their first coordinate,
  $p_1$ is also their dual formula #cite(label("DKRRZ2016")) Lemma 2.5.
  The higher blocks retain this path geometry through arbitrarily many generations.

We use the outer Hilbert sum

#[#set math.equation(numbering: n => "(21)")
 $ X = (xor.big_(n gt.eq 1) X_n)_(ell_2) \, wide parallel x parallel^2 =
   sum_n L_n \( x_n \)^2 . $ <eq:linear-outer-sum>]

A finite initial subset of the disjoint union of the $T_n$ will be called a #emph[finite head].
  Its restriction $P_A$ is contractive on $X$, and such restrictions converge strongly to the identity along an
  exhaustion. To see the latter assertion, first truncate the block sum,
  then approximate the remaining coordinates by finite arrays and enlarge their support to an initial set.
  If $A subset.eq C$ are initial sets, then the window projection

$ R_(C \\ A) = P_C - P_A quad upright("satisfies") quad parallel R_(C \\ A) parallel lt.eq 2 . $

In particular the complementary projection $I - P_A$ has norm at most two; its contractivity is not needed.

#thm([Proposition 5.2.])[
  (Duality and branching in the outer sum).  #emph[The space $X$ is reflexive, has separable dual,
    and its dual is the Hilbert sum of the spaces $\( H_n \, p_n \)$, with pairing
$ f \( x \) = sum_n chevron.l f_n \, x_n chevron.r \, wide parallel f parallel_(*)^2 = sum_n p_n \( f_n \)^2 . $

 Every coordinate vector $e_(n \, s)$ and every root path $b_(n \, s)$ has norm one.
   For fixed $n$ and $\| s \| < n$, the children $\( e_(n \, s^frown j) \)_(j gt.eq 1)$ are weakly null.
   If $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$, with $0 < alpha lt.eq beta$,
   then $overline(delta)_N \( t \) = 0$ for every $0 < t lt.eq alpha \/ beta$.
   In particular no equivalent norm on $X$ is asymptotically uniformly convex.]
] <prop:linear-geometry>

#proof[
  Each block is an equivalently normed Hilbert space and hence reflexive.
    For completeness of the sum, a Cauchy sequence has a limit in each block;
    its norm bounds and Cauchy estimates pass to the limit first on finite sets of blocks and then by increasing
    those sets. Cauchy–Schwarz shows that each displayed dual family defines a bounded functional.
    Conversely, restrict an arbitrary functional to finitely many blocks, choose almost norming vectors there,
    and weight them proportionally to the block dual norms. This proves that the sum of their squares is bounded
    by the square of the original functional norm. Density of finite-block vectors proves the representation and
    equality of norms. Applying the same argument to the dual sum proves surjectivity of the canonical map into
    the bidual. Finite arrays are dense in the dual by the same block truncation and Hilbert equivalence,
    so it is separable.
  The cost formula gives $L_n \( e_s \) \, L_n \( b_s \) lt.eq 1$.
    The dual vector $e_s$ has $p_n \( e_s \) = 1$ and evaluates to one on both vectors, giving equality.
    The weak nullity assertion follows from square summability of every fixed dual array on the $n$th block.
  For clarity we give the renorming argument with its scale and gain.
    Suppose $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$, where $0 < alpha lt.eq
    beta$, and suppose $d = overline(delta)_N \( t \) > 0$ for some $0 < t lt.eq alpha \/ beta$.
    Choose $0 < eta < d \/ 2$. For each unit center $u$ there is a finite-codimensional closed subspace $F$ such
    that $N \( u + t v \) gt.eq 1 + 2 eta$ on its unit sphere.
    Convexity on a ray gives $N \( u + v \) gt.eq 1 + 2 eta$ whenever $v in F$ and $N \( v \) gt.eq t$.
  At an internal vertex $s$ take $u = b_(n \, s) \/ N \( b_(n \, s) \)$ and $z_j =
    e_(n \, s^frown j) \/ N \( b_(n \, s) \)$. These vectors are weakly null and $N \( z_j \) gt.eq
    alpha \/ beta gt.eq t$. Their quotient images in $X \/ F$ tend to zero,
    since that quotient is finite-dimensional. Choose $v_j in F$ with $N \( v_j - z_j \) arrow.r 0$.
    If $N \( v_j \) < t$, replace $v_j$ by $t v_j \/ N \( v_j \)$; for large $j$ this is defined,
    and the extra change is at most $N \( v_j - z_j \)$. Thus $z_j$ is approximated by vectors in $F$ of norm at
    least $t$. For a sufficiently large child index,
  $ N \( b_(n \, s^frown j) \) gt.eq \( 1 + eta \) N \( b_(n \, s) \) . $
  Iterating to depth $n$ gives $alpha \( 1 + eta \)^n lt.eq beta$, impossible for all $n$.
    The asymptotic modulus is nonnegative: the kernel of a norming functional at a unit center has
    $N \( u + t v \) gt.eq 1$. This proves the claimed zero value at every indicated scale.
    Taking $eta = d \/ 4$ gives the often useful growth factor $1 + d \/ 4$. ◻
]

Two distinctions about the model will matter below. The global test norm on the infinite-height tree restricts to
  $L_n$ on $T_n$: restrict an admissible test in one direction, and extend by zero in the other,
  which freezes all longer prefix sums. This identifies the completed finite-height block,
  but does not identify the infinite-height completion with (21). Also the quadratic cost

$ Q_n \( x \) = inf_(x = h + B_n mu) #scale(x: 120%, y: 120%)[\(] parallel h parallel_2^2 +
  parallel mu parallel_1^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) $

satisfies $Q_n lt.eq L_n lt.eq sqrt(2) Q_n$ and is different from $L_n$:
  $L_n \( e_o \) = 1$, whereas $Q_n \( e_o \) = 1 \/ sqrt(2)$.
  The upper bound in the last equality comes from splitting the root coordinate equally;
  the lower bound follows from $1 lt.eq parallel h parallel_2 + parallel mu parallel_1 lt.eq
  sqrt(2) \( parallel h parallel_2^2 + parallel mu parallel_1^2 \)^(1 \/ 2)$.
  Thus constants proved for one cost cannot be transferred by identifying the two norms.

=== 5.2 Clipping the tail of a dual test <subsec:linear-clipping>

A head test has a constant prefix sum after leaving the head.
  We split the coefficients of a second test outside the head into two pieces whose prefix sums point towards zero
  relative to this constant. Hilbert orthogonality pays for their coefficients,
  and the inward direction pays for the prefix constraint.

#thm([Lemma 5.3.])[
  (Inward decomposition for the linear polar).  #emph[Let $A$ be a finite head.
    Suppose $h \, g in X^(*)$ have norms at most one and $P_A h = h$.
    There are $r_1 \, r_2 in X^(*)$, vanishing on $A$, such that
$ r_1 - r_2 = \( I - P_A \) g \, wide parallel r_l parallel_(*) lt.eq 2 \, wide parallel lambda h +
  mu r_l parallel_(*)^2 lt.eq lambda^2 + 4 mu^2 $

 for $l = 1 \, 2$ and $lambda \, mu gt.eq 0$.]
] <lem:linear-inward>

#proof[
  In block $n$ write $A_n = A ∩ T_n$ and set
  $ H \( s \) = sum_(r prec.curly.eq s) h_(n \, r) \, wide V \( s \) = sum_(r prec.curly.eq s\
r in.not A_n) g_(n \, r) \, wide a_n = p_n \( h_n \) \, quad c_n = p_n \( g_n \) . $
  Here $\| H \| lt.eq a_n$. The sum $V$ is a difference of two prefix sums of $g_n$,
    or a single prefix sum if the path misses $A_n$, so $\| V \| lt.eq 2 c_n$. It vanishes on $A_n$. Define
  $ \( V_1 \, V_2 \) =
    cases(delim: "{", \( min \( V \, 0 \) \, - max \( V \, 0 \) \) \, & H gt.eq 0 \,, \( max \( V \, 0 \) \, -
    min \( V \, 0 \) \) \, & H < 0 .) $
  Let $r_(l \, n \, s) = V_l \( s \) - V_l \( s^(-) \)$, with predecessor value zero at the root.
    These coefficients vanish on $A_n$. Outside $A_n$, the head sum $H$ is constant along each remaining branch,
    and both scalar clipping maps are $1$-Lipschitz. Therefore
  $ \| r_(l \, n \, s) \| lt.eq \| g_(n \, s) \| quad \( s in.not A_n \) . $
  At a first exit vertex this follows from the zero predecessor value of $V_l$.
    Moreover the prefix sums of $r_(l \, n)$ are $V_l$, and $V_1 - V_2 = V$, proving the claimed difference.
  The supports of $h_n$ and $r_(l \, n)$ are disjoint. Hence their Hilbert norm satisfies
  $ parallel lambda h_n + mu r_(l \, n) parallel_2^2 lt.eq lambda^2 a_n^2 + mu^2 c_n^2 . $
  The products $H V_l$ are nonpositive, so each prefix sum satisfies
  $ \| lambda H + mu V_l \| lt.eq max { lambda a_n \, 2 mu c_n } . $
  These two estimates give $p_n \( lambda h_n + mu r_(l \, n) \)^2 lt.eq lambda^2 a_n^2 + 4 mu^2 c_n^2$.
    Summing over $n$ proves the asserted inequality; taking $lambda = 0$, $mu =
    1$ proves $r_l in X^(*)$ and its norm bound. ◻
]

#thm([Theorem 5.4.])[
  (Clipping estimate on a head and its complement).  #emph[If $x \, y in X$, $P_A x = x$ and $P_A y =
    0$ for a finite head $A$, then, for every $c > 0$,
#[#set math.equation(numbering: n => "(22)")
 $ max { parallel x + y parallel \, parallel x - y parallel } gt.eq
   frac(parallel x parallel + c parallel y parallel \/ 2, sqrt(1 + 4 c^2)) . $ <eq:linear-clipping-family>]

 In particular the left side is at least $sqrt(parallel x parallel^2 + parallel y parallel^2 \/ 16)$.]
] <thm:linear-head-tail-clipping>

#proof[
  Choose norming dual vectors $h \, g$ for $x \, y$, with norms at most one, and replace $h$ by $P_A h$.
    The projection preserves its evaluation at $x$ and does not increase its norm.
    Lemma 7 gives $r_1 \( y \) - r_2 \( y \) = parallel y parallel$,
    so at least one of $\| r_1 \( y \) \| \, \| r_2 \( y \) \|$ is at least $parallel y parallel \/ 2$.
    For this index choose a sign $epsilon$ with $epsilon r_l \( y \) gt.eq parallel y parallel \/ 2$.
    Because $h \( y \) = r_l \( x \) = 0$, evaluation of $h + c r_l$ on $x + epsilon y$ proves (22).
    Its supremum over $c > 0$ is the displayed square root, by Cauchy–Schwarz in two dimensions;
    endpoint cases follow by a limit. ◻
]

The next result has an arbitrary center and no chosen head in its statement.
  Weak nullity removes the head coordinates of the moving vectors;
  the approximation of the center must be made before taking the lower limit.

#thm([Theorem 5.5.])[
  (Clipping along a weakly null sequence).  #emph[Let $x in
    X$ and let $\( y_j \)$ be a bounded weakly null sequence in $X$. If $L = liminf_j parallel y_j parallel$, then
$ liminf_j max { parallel x + y_j parallel \, parallel x - y_j parallel } gt.eq
  sqrt(parallel x parallel^2 + L^2 \/ 16) . $

]
] <thm:linear-weak-sequence>

#proof[
  Fix $eta > 0$ and choose a finite head $A$ with $parallel x - P_A x parallel lt.eq eta$,
    using the strong head exhaustion. Put $z_j = \( I - P_A \) y_j$.
    Since $P_A$ has finite rank and $y_j$ is weakly null, $parallel P_A y_j parallel arrow.r 0$. In particular,
  $ \| parallel z_j parallel - parallel y_j parallel #scale(x: 120%, y: 120%)[\|] lt.eq
    parallel P_A y_j parallel arrow.r 0 . $
  Apply Theorem 8 to $P_A x$ and $z_j$. The triangle inequality then gives
  $ max { parallel x + y_j parallel \, parallel x - y_j parallel } gt.eq
    sqrt(parallel P_A x parallel^2 + parallel z_j parallel^2 \/ 16) - eta - parallel P_A y_j parallel . $
  Keep this head fixed while taking the lower limit in $j$.
    The result is at least $sqrt(parallel P_A x parallel^2 + L^2 \/ 16) - eta$.
    Finally let $eta arrow.b 0$, choosing the heads along the strong exhaustion,
    so that $parallel P_A x parallel arrow.r parallel x parallel$. This proves the stated bound. ◻
]

=== 5.3 Path coefficients on complementary forests <sec:linear-positive-mass>

The clipping estimate already controls a displacement supported outside a head.
  We now examine the path representations in (19) themselves.
  The deficit between representation cost and the value of a head norming functional on the represented vector
  bounds the mass whose sign opposes that functional. The remaining endpoint coefficients in each complementary
  tree have one sign. Positive-mass monotonicity uses that sign directly;
  the next subsection removes a controlled amount of mass so that the remainder is small in Hilbert norm.
  These arguments record their own tail bounds and expose coefficient mechanisms that will reappear in the
  variation and stopping arguments.

Fix one tree $T_n$, a head $A$, and $U = T_n \\ A$. The set $U$ is a forest whose roots are the first vertices
  outside $A$. Define its intrinsic path vectors and norm by

$ b_t^U & = sum_(v in U \, med v prec.curly.eq t) e_v \, & B_U alpha & = sum_(t in U) alpha \( t \) b_t^U \,\
L_U \( z \) & = inf_(z = h + B_U alpha) \( parallel h parallel_2 + parallel alpha parallel_1 \) . $

All paths have at most $n + 1$ vertices, so these expressions define a bounded map from $ell_1 \( U \)$ to
  $ell_2 \( U \)$ and a Hilbert-equivalent norm. If $v$ is supported in $U$, then

#[#set math.equation(numbering: n => "(23)")
 $ L_n \( v \) lt.eq 2 L_U \( v \|_U \) . $ <eq:linear-forest-comparison>]

Indeed, after extension by zero, $b_t^U = b_t - P_A b_t$, of cost at most two,
  while a Hilbert residual extends without changing its cost.
  Changing sign on any collection of whole trees of $U$ is an isometry for $L_U$.

#thm([Lemma 5.6.])[
  (Monotonicity of positive path mass).  #emph[If $0 lt.eq nu lt.eq mu$ in $ell_1 \( U \)$,
    then $L_U \( B_U nu \) lt.eq L_U \( B_U mu \)$.]
] <lem:linear-positive-monotonicity>

#proof[
  Choose a norming functional $phi.alt in ell_2 \( U \)$ for $B_U nu$.
    Its dual norm is at most one, hence $parallel phi.alt parallel_2 lt.eq 1$ and $F_t :=
    sum_(v in U \, thin v prec.curly.eq t) phi.alt \( v \)$ satisfies $\| F_t \| lt.eq 1$.
    At a root set the value at its nonexistent parent equal to zero, and put
  $ psi \( v \) = \| F_v \| - \| F_("par" \( v \)) \| . $
  Then $\| psi \( v \) \| lt.eq \| phi.alt \( v \) \|$, and the prefix sums of $psi$ are $\| F_t \|$.
    Thus $psi$ also has dual norm at most one: pairing it with a decomposition $h +
    B_U alpha$ costs at most $parallel h parallel_2 + parallel alpha parallel_1$.
    Absolute convergence of the coefficient sums gives
  $ L_U \( B_U nu \) = sum_t nu \( t \) F_t lt.eq sum_t mu \( t \) \| F_t \| = chevron.l B_U mu \,
    psi chevron.r lt.eq L_U \( B_U mu \) . $
  The claim concerns positive path coefficients; it asserts no general coordinatewise monotonicity of the norm. ◻
]

#thm([Theorem 5.7.])[
  (A tail estimate from positive mass).  #emph[Let $C = 6 \( sqrt(2) + 1 \)$.
    In one component, if $P_A x = x$, $P_A y = 0$, and $L_n \( x plus.minus y \) lt.eq 1$, then
#[#set math.equation(numbering: n => "(24)")
 $ L_n \( y \) lt.eq C sqrt(1 - L_n \( x \)) . $ <eq:linear-positive-unit>]

 For arbitrary $x \, y$ satisfying $P_A x = x$ and $P_A y = 0$, writing $beta = max { L_n \( x + y \) \,
   L_n \( x - y \) }$ and $r = L_n \( x \)$, one has
#[#set math.equation(numbering: n => "(25)")
 $ L_n \( y \)^2 lt.eq C^2 beta \( beta - r \) lt.eq C^2 \( beta^2 - r^2 \) . $ <eq:linear-positive-scaled>]

 Consequently, for a finite head projection $P$ on $X$,
#[#set math.equation(numbering: n => "(26)")
 $ parallel y parallel^2 lt.eq C^2 #scale(x: 120%, y: 120%)[\(] parallel x + y parallel^2 + parallel x -
   y parallel^2 - 2 parallel x parallel^2 #scale(x: 120%, y: 120%)[\)] quad \( P x = x \, med P y = 0 \) .
   $ <eq:linear-positive-outer>]

]
] <thm:linear-positive-tail>

#proof[
  For the unit estimate set $r = L_n \( x \)$ and choose a norming functional $g = g P_A$, of norm at most one,
    with $g \( x \) = r$; use zero if $x = 0$. For each sign choose $x plus.minus y = h_plus.minus +
    B_n alpha_plus.minus$ of cost at most $1 + eta$, where $eta > 0$. Put $d = 1 + eta - r$.
    Subtracting the value of $g$ from the cost gives nonnegative terms with sum at most $d$:
  $ parallel h_plus.minus parallel_2 - g \( h_plus.minus \) +
    sum_t #scale(x: 120%, y: 120%)[\(] \| alpha_plus.minus \( t \) \| -
    alpha_plus.minus \( t \) g \( b_t \) #scale(x: 120%, y: 120%)[\)] lt.eq d . $
  In particular,
  $ parallel h_plus.minus \|_U parallel_2 lt.eq sqrt(2 \( 1 + eta \) d) . $
  For this bound, use $\| g \( h_plus.minus \) \| lt.eq parallel P_A h_plus.minus
    parallel_2$ and factor the difference of squares. Its other factor is at most $2 \( 1 + eta \)$.
    The coefficients satisfying $alpha_plus.minus \( t \) g \( b_t \) lt.eq 0$ have total mass at most $d$.
  Retain only the other coefficients ending in $U$, and call their intrinsic forest contributions $v_plus.minus$. Then
  $ y \|_U = v_(+) + w_(+) \, wide - y \|_U = v_(-) + w_(-) \, wide L_U \( w_plus.minus \) lt.eq K :=
    sqrt(2 \( 1 + eta \) d) + d . $
  Within each tree of $U$, the value $g \( b_t \)$ is constant, since the head of every such path is the same.
    If that value is zero, no coefficient is retained there. Otherwise both retained arrays have its sign.
    One isometric change of signs makes both arrays nonnegative. Lemma 10 now gives
  $ L_U \( v_(+) \) lt.eq L_U \( v_(+) + v_(-) \) = L_U \( w_(+) + w_(-) \) lt.eq 2 K . $
  It follows that $L_U \( y \|_U \) lt.eq 3 K$ and $L_n \( y \) lt.eq 6 K$.
    Letting $eta arrow.b 0$, and using $0 lt.eq 1 - r lt.eq sqrt(1 - r)$, proves (24).
    Scaling gives the first bound in (25) when $beta > 0$; when $beta = 0$, both vectors are zero.
    Contractivity of $P_A$ gives $r lt.eq beta$ and the second bound.
    In each component both endpoint norms are at least the center norm.
    Thus the maximum of their squared differences from $r^2$ is at most their sum.
    Summing over components proves (26), including components with empty heads. ◻
]

=== 5.4 Removing mass by subtree quotas <sec:linear-quota-removal>

There is another way to use the consistent signs outside a head.
  Instead of changing a norming functional, remove a small portion of the path coefficients.
  The remaining path sum can then be bounded in Hilbert norm.
  The following finite selection fact is the common combinatorial step.

#thm([Lemma 5.8.])[
  (Subtree quotas).  #emph[On a forest of finite height, let $mu \,
    nu$ be nonnegative finitely supported endpoint masses. For a vertex $v$, let $K_v$ be its descendant set,
    and put $G \( v \) = mu \( K_v \)$, $W \( v \) = nu \( K_v \)$. There is $0 lt.eq rho lt.eq mu$ such that
$ rho \( K_v \) gt.eq min { G \( v \) \, W \( v \) } quad upright("for every ") v \, wide
  parallel rho parallel_1 lt.eq parallel nu parallel_1 . $

 The last inequality also holds separately in each tree of the forest.]
] <lem:linear-subtree-quota>

#proof[
  Only the finite ancestor hull of the supports matters. Write $q \( v \) = min { G \( v \) \, W \( v \) }$.
    Nonnegativity gives
  $ q \( v \) lt.eq G \( v \) \, wide sum_(w upright(" child of ") v) q \( w \) lt.eq q \( v \) . $
  Process vertices from the leaves towards the roots. At $v$,
    the mass already marked in its child subtrees totals $sum_w q \( w \)$.
    Mark enough additional, previously unmarked mass of $mu$ below $v$ to make the marked total there equal to
    $q \( v \)$; fractions of an endpoint mass are allowed. The two displayed inequalities make this possible.
    Later steps can only increase a previously met quota. The total finally marked in a tree equals its root quota
    and is at most its total $nu$-mass. Take $rho$ to be the marked mass. ◻
]

#thm([Theorem 5.9.])[
  (The bottom-up tail estimate).  #emph[Suppose $0 lt.eq epsilon lt.eq 1$, $P_A x = x$, $P_A y = 0$,
    $L_n \( x plus.minus y \) lt.eq 1$, and $L_n \( x \) gt.eq 1 - epsilon$. Then
#[#set math.equation(numbering: n => "(27)")
 $ L_n \( y \) lt.eq 3 sqrt(2 epsilon) + 8 epsilon . $ <eq:linear-bottom-up-explicit>]

 Moreover the following uniform implication holds on $X$: for any sequence of finite head projections $P_j$ and
   vectors satisfying
$ P_j x_j = x_j \, quad P_j y_j = 0 \, quad parallel x_j plus.minus y_j parallel lt.eq 1 \, quad
  parallel x_j parallel arrow.r 1 \, $

 one has $parallel y_j parallel arrow.r 0$.]
] <thm:linear-bottom-up-tail>

#proof[
  Choose $g = g P_A$ norming $x$, and finite path representations of both endpoints with cost at most $1 + eta$.
    Put $d = 1 + eta - L_n \( x \) lt.eq epsilon + eta$. As in the preceding proof,
    their Hilbert tails have lengths $K_plus.minus lt.eq sqrt(2 \( 1 + eta \) d)$,
    and their coefficient masses $B_plus.minus$ with $alpha_plus.minus \( t \) g \( b_t \) lt.eq
    0$ satisfy $B_plus.minus lt.eq d$. Call these coefficients bad and the others good.
  In a complementary tree where the common value $c = g \( b_t \)$ is zero, there are no good coefficients.
    Otherwise put $𝜍 = "sign" \( c \)$. All good coefficients have sign $𝜍$,
    and all bad nonzero coefficients have sign $- 𝜍$. Apply Lemma 12 to the combined good mass $mu$ and combined
    bad mass $nu$ in each tree, and mark the selected portions with their originating endpoint representation.
    Denote the selected good mass by $rho$, and put $G \( v \) = mu \( K_v \)$, $W \( v \) = nu \( K_v \)$.
    At a vertex in a tree with $c eq.not 0$, the vanishing sum of the two endpoint tails reads
  $ h_(+) \( v \) + h_(-) \( v \) + 𝜍 #scale(x: 120%, y: 120%)[\(] G \( v \) -
    W \( v \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Consequently, in every complementary tree, including those with no good mass,
  $ \( G \( v \) - W \( v \) \)_(+) lt.eq \| h_(+) \( v \) + h_(-) \( v \) \| wide \( v in.not A \) . $
  After removal, the good tail in either one of the representations has absolute coordinate at most $G \( v \) -
    rho \( K_v \) lt.eq \( G \( v \) - W \( v \) \)_(+)$. Its Hilbert norm is therefore at most $K_(+) + K_(-)$.
    The total removed mass is at most $B_(+) + B_(-)$, and each complementary path costs at most two in $L_n$.
    Decomposing the plus endpoint tail into its Hilbert, bad, removed-good, and remaining-good parts gives
  $ L_n \( y \) lt.eq 2 K_(+) + K_(-) + 2 B_(+) + 2 \( B_(+) + B_(-) \) lt.eq 3 sqrt(2 \( 1 + eta \) d) + 8 d . $
  Let $eta arrow.b 0$. This proves (27), including its endpoint cases.
  We give the outer-sum passage explicitly. For the $j$-th pair set
  $ a_(j \, n)^plus.minus & = L_n \( x_(j \, n) plus.minus y_(j \, n) \) \, & r_(j \, n) & = L_n \( x_(j \, n) \) \,\
c_(j \, n) & = 1 / 2 \( a_(j \, n)^(+) + a_(j \, n)^(-) \) \, & a_(j \, n) & =
  max \( a_(j \, n)^(+) \, a_(j \, n)^(-) \) . $
  Convexity gives $c_(j \, n) gt.eq r_(j \, n)$, and the endpoint assumptions give $parallel a_j^plus.minus
    parallel_2 lt.eq 1$. Hence $parallel c_j parallel_2 arrow.r 1$. The Hilbert parallelogram identity then gives
  $ parallel a_j^(+) - a_j^(-) parallel_2^2 = 2 parallel a_j^(+) parallel_2^2 + 2 parallel a_j^(-) parallel_2^2 -
    4 parallel c_j parallel_2^2 lt.eq 4 \( 1 - parallel x_j parallel^2 \) arrow.r 0 . $
  Since $a_j = c_j + \| a_j^(+) - a_j^(-) \| \/ 2$, we also have $parallel a_j parallel_2 arrow.r 1$.
    Ignore coordinates with $a_(j \, n) = 0$, whose vectors are zero, and put $delta_(j \, n) = 1 -
    r_(j \, n) \/ a_(j \, n) in \[ 0 \, 1 \]$. Then
  $ sum_n a_(j \, n)^2 delta_(j \, n) lt.eq sum_n \( a_(j \, n)^2 - r_(j \, n)^2 \) arrow.r 0 . $
  Applying the component estimate after division by $a_(j \, n)$ gives $L_n \( y_(j \, n) \) \/ a_(j \, n) lt.eq
    3 sqrt(2 delta_(j \, n)) + 8 delta_(j \, n)$; the same ratio is at most one by the triangle inequality.
    For fixed $tau > 0$, the squared outer norm is therefore at most
  $ \( 3 sqrt(2 tau) + 8 tau \)^2 sum_n a_(j \, n)^2 + tau^(- 1) sum_n a_(j \, n)^2 delta_(j \, n) . $
  First let $j arrow.r oo$, then $tau arrow.b 0$. ◻
]

The preceding argument emphasizes uniform decay. A different threshold in the same selection procedure gives a
  convenient homogeneous squared estimate, without an outer limiting argument.

#thm([Theorem 5.10.])[
  (A squared estimate by quota removal).  #emph[For a finite head projection $P$ on $X$,
#[#set math.equation(numbering: n => "(28)")
 $ parallel y parallel^2 lt.eq 242 #scale(x: 120%, y: 120%)[\(] parallel x + y parallel^2 + parallel x -
   y parallel^2 - 2 parallel x parallel^2 #scale(x: 120%, y: 120%)[\)] wide \( P x = x \, med P y = 0 \) .
   $ <eq:linear-trimming-242>]

 The same assertion, with $L_n$ in place of $parallel dot.op parallel$, holds in each component.]
] <thm:linear-trimming-242>

#proof[
  Work first in one component. Set $r = L_n \( x \)$ and $M_plus.minus = L_n \( x plus.minus y \)$,
    so $M_plus.minus gt.eq r$. Use a supported norming functional $g$ and finite representations of costs at most
    $M_plus.minus + eta$. Put $d_plus.minus = M_plus.minus + eta - r$.
    Here a path coefficient is good when $"sign" \( alpha_plus.minus \( t \) \) g \( b_t \) > 1 \/ 2$,
    and bad otherwise. The deficit calculation gives
  #[#set math.equation(numbering: n => "(29)")
   $ B_plus.minus lt.eq 2 d_plus.minus \, wide K_plus.minus lt.eq
     sqrt(2 \( M_plus.minus + eta \) d_plus.minus) . $ <eq:linear-quota-deficits>]
  Write $c = g \( b_t \)$ for the common value on one complementary tree.
    If $\| c \| lt.eq 1 \/ 2$, that tree has no good coefficients.
    Otherwise put $𝜍 = "sign" \( c \)$; good coefficients have sign $𝜍$, and bad nonzero coefficients have sign $-
    𝜍$. Let $G_(+) \( v \) \, G_(-) \( v \)$ be the subtree masses of the good coefficients from the two
    representations, and let $W \( v \)$ be the subtree mass of all bad coefficients.
    In a tree with $\| c \| > 1 \/ 2$, the endpoint tails satisfy
  $ h_(+) \( v \) + h_(-) \( v \) + 𝜍 #scale(x: 120%, y: 120%)[\(] G_(+) \( v \) + G_(-) \( v \) -
    W \( v \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  For the quota selection take $G = G_(+)$. Since $G_(-) gt.eq 0$, the identity gives the following bound,
    which is also immediate in a tree with no good mass:
  $ \( G \( v \) - W \( v \) \)_(+) lt.eq \| h_(+) \( v \) + h_(-) \( v \) \| . $
  Lemma 12 removes at most $B_(+) + B_(-)$ from the plus good coefficients.
    The remaining plus good tail has Hilbert norm at most $K_(+) + K_(-)$;
    the removed tail has $L_n$-norm at most $2 \( B_(+) + B_(-) \)$. Adding the plus Hilbert and bad tails yields
  $ L_n \( y \) & lt.eq 2 \( K_(+) + K_(-) \) + 4 \( B_(+) + B_(-) \)\
 & lt.eq 11 sum_(sigma in { + \, - }) sqrt(\( M_sigma + eta \) d_sigma) . $
  Here $d_sigma lt.eq M_sigma + eta$ and $2 sqrt(2) + 8 < 11$.
    Squaring the last sum costs at most a factor two, and $\( M_sigma + eta \) d_sigma
    lt.eq \( M_sigma + eta \)^2 - r^2$. Letting $eta arrow.b 0$ proves the component estimate with $2 dot.op
    11^2 = 242$. Summation gives (28). Empty heads cause no exception; their centers are zero. ◻
]

=== 5.5 Stopping at the first excess of wrong-sign mass <sec:linear-stopped-fibers>

For a displacement supported in a larger finite head, its part in the smaller head need not vanish.
  We now average the endpoint decompositions before choosing signs,
  and measure the mass disagreeing with this average in each head fibre.
  Stopping where that mass exceeds one quarter of the total gives an estimate for the new coordinates alone.

#thm([Theorem 5.11.])[
  (A fresh-layer squared estimate).  #emph[Let $A subset.eq
    A'$ be finite ancestor-closed subsets of the disjoint union of the $T_n$, and put $E = A' \\ A$.
    If $P_A x = x$ and $P_(A') y = y$, then
#[#set math.equation(numbering: n => "(30)")
 $ parallel P_E y parallel^2 lt.eq
   400 (frac(parallel x + y parallel^2 + parallel x - y parallel^2, 2) - parallel x parallel^2) .
   $ <eq:linear-fresh-layer-400>]

 There is no condition on $P_A y$.]
] <thm:linear-fresh-layer-400>

#proof[
  Write $x^s = x + s y$, $s in { - 1 \, 1 }$, and denote averages over $s$ by a bar. Fix $lambda > 0$.
    In each nonzero component choose
  $ x_n^s = z_n^s + B_n alpha_n^s \, wide r_n^s = parallel z_n^s parallel_2 +
    M_n^s lt.eq \( 1 + lambda \) L_n \( x_n^s \) \, wide M_n^s = parallel alpha_n^s parallel_1 . $
  Use zero decompositions in zero components. Project to $A'$:
    truncate the Hilbert terms and push each path endpoint to its last ancestor in $A'$,
    discarding endpoints with no such ancestor. Both costs decrease, so all arrays may be taken supported in $A'$.
  In a fixed $T_n$, let $pi_A \( t \)$ be the last ancestor of $t$ in $A$,
    or a dummy symbol $perp$ if none exists. For each fibre set
  $ L_b = sum_(pi_A \( t \) = b) macron(alpha)_n \( t \) \, wide l_b in { - 1 \, 1 } \, quad l_b L_b = \| L_b \| . $
  Either choice is allowed at zero. Introduce the mass on pairs $\( s \, t \)$ given by $m_n \( s \, t \) = \|
    alpha_n^s \( t \) \| \/ 2$, and let $h \( s \, t \)$ be the coefficient’s sign, chosen arbitrarily at zero.
    Its wrong-sign mass is
  $ W_n = sum_(s \, t : thin h \( s \, t \) eq.not l_(pi_A \( t \))) m_n \( s \, t \) . $
  Separating the two signs in each fibre, including the dummy fibre, gives $macron(M)_n - sum_b \| L_b \| =
    2 W_n$. Since $x_n = P_(A ∩ T_n) \( macron(z)_n + B_n macron(alpha)_n \)$,
    its component norm is at most $overline(parallel P_A z_n^s parallel_2) + sum_b \| L_b \|$;
    the dummy term is a harmless nonnegative addition to this cost. It follows that
  #[#set math.equation(numbering: n => "(31)")
   $ Delta_n := macron(r)_n - L_n \( x_n \) gt.eq 2 W_n + 1 /
     2 overline(frac(parallel P_E z_n^s parallel_2^2, parallel z_n^s parallel_2)) gt.eq 0 \,
     $ <eq:linear-stopped-deficit>]
  A quotient with zero denominator means zero. The Hilbert estimate used here is
  $ parallel z parallel_2 - parallel P_A z parallel_2 gt.eq
    frac(parallel P_E z parallel_2^2, 2 parallel z parallel_2) quad \( z eq.not 0 \, med P_(A') z = z \) . $
  The quantity $Q = sum_n macron(r)_n Delta_n$ controls both Hilbert leakage and wrong-sign mass.
    For an array on the disjoint union of the trees, $parallel dot.op parallel_2$ denotes its Hilbert norm,
    including summation over components. Since $parallel z_n^s parallel_2 lt.eq 2 macron(r)_n$,
  #[#set math.equation(numbering: n => "(32)")
   $ parallel P_E macron(z) parallel_2^2 & lt.eq overline(parallel P_E z^s parallel_2^2) lt.eq 4 Q \, wide
     sum_n Delta_n^2 lt.eq Q \,\
Q & lt.eq sum_n \( macron(r)_n \)^2 - parallel x parallel^2 lt.eq \( 1 + lambda \)^2
  overline(parallel x^s parallel^2) - parallel x parallel^2 . $ <eq:linear-stopped-Q>]
  The first line follows from (31) and $0 lt.eq Delta_n lt.eq macron(r)_n$; the second uses $L_n \( x_n \) lt.eq
    macron(r)_n$ and $\( macron(r)_n \)^2 lt.eq overline(\( r_n^s \)^2)$.
  It remains to recover the norm of $P_E y$ from this budget. The zero case is immediate.
    Otherwise take a norming functional for $P_E y$ and precompose it with $P_E = P_(A') - P_A$.
    Its coefficient array $phi.alt$, supported in $E$, satisfies
  #[#set math.equation(numbering: n => "(33)")
   $ chevron.l y \, phi.alt chevron.r = parallel P_E y parallel \, wide parallel phi.alt parallel_2 lt.eq 2 \,
     wide #scale(x: 180%, y: 180%)[\(] sum_n c_n^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq 2 \, quad c_n =
     sup_(t in T_n) lr(|sum_(v prec.curly.eq t) phi.alt \( v \)|) . $ <eq:linear-stopped-dual>]
  The functional has norm at most two. Testing against Hilbert vectors gives the first coefficient bound.
    Testing against finite sums of one root path in each component, with arbitrary scalar multipliers,
    gives the second by the outer Hilbert norm. Approximate each supremum if it is not attained.
  The Hilbert part of $chevron.l y \, phi.alt chevron.r = overline(s chevron.l x^s \, phi.alt chevron.r)$ has
    absolute value at most $4 sqrt(Q)$, by (32) and (33). For the path part write $g \( t \) =
    sum_(v prec.curly.eq t) phi.alt \( v \)$ and
  $ I_n = integral s thin h \( s \, t \) thin g \( t \) thin d m_n \( s \, t \) . $
  For $v in E ∩ T_n$, let $m \( v \)$ be the mass of pairs with $t succ.curly.eq v$,
    and $w \( v \)$ its wrong-sign part. The entire subtree below $v$ is in a single $pi_A$-fibre.
    Its coefficients therefore satisfy
  $ #scale(x: 120%, y: 120%)[\(] B_n macron(alpha)_n #scale(x: 120%, y: 120%)[\)] \( v \) =
    l_(pi_A \( v \)) #scale(x: 120%, y: 120%)[\(] m \( v \) - 2 w \( v \) #scale(x: 120%, y: 120%)[\)] = -
    macron(z) \( v \) \, $
  where the last equality uses $x \( v \) = 0$ on $E$. Thus, whenever $w \( v \) lt.eq m \( v \) \/ 4$,
  $ m \( v \) lt.eq 2 \| #scale(x: 120%, y: 120%)[\(] B_n macron(alpha)_n
    #scale(x: 120%, y: 120%)[\)] \( v \) \| = 2 \| macron(z) \( v \) \| . $
  Call a vertex $v in E$ retained if this inequality’s condition holds at $v$ and at every preceding vertex of its
    path in $E$. Split $g \( t \)$ into its sum over retained vertices and the remainder.
    The remainder starts at the first vertex satisfying $w \( v \) > m \( v \) \/ 4$.
    Such first vertices form an antichain, so their disjoint descendant sets have total mass at most $4 W_n$.
    The remainder is the difference of two prefix sums and has absolute value at most $2 c_n$.
    It therefore contributes at most $8 c_n W_n$ to $\| I_n \|$.
    The retained contribution is at most $2 sum_(v in E ∩ T_n) \| phi.alt \( v \) \| thin \|
    macron(z) \( v \) \|$. Summing over components and using $2 W_n lt.eq Delta_n$, we obtain
  $ sum_n \| I_n \| & lt.eq 4 parallel P_E macron(z) parallel_2 + 4 sum_n c_n Delta_n\
 & lt.eq 8 sqrt(Q) + 8 sqrt(Q) = 16 sqrt(Q) . $
  Together with the Hilbert part this proves $parallel P_E y parallel lt.eq 20 sqrt(Q)$.
    Apply (32), square, and let $lambda arrow.b 0$ to obtain (30). ◻
]

== 6 Energy on newly exposed coordinates <sec:linear-energy>

Throughout this section $X$ is the outer Hilbert sum in (21), with block norm $L_n$ on $H_n = ell_2 \( T_n \)$,
  root-path vectors $b_u$, and path map $B_n$. Proposition 5 identifies $L_n$ with the supremum over the tests

#[#set math.equation(numbering: n => "(34)")
 $ parallel a parallel_2 lt.eq 1 \, wide \| chevron.l b_u \, a chevron.r \| lt.eq
   1 quad \( u in T_n \) . $ <eq:linear-energy-tests>]

All coordinate sets below lie in the disjoint union of the trees.
  A set is #emph[initial] if it contains the ancestors of each of its vertices.
  We write $R_A = P_A$ for coordinate restriction to $A$. Recall that $R_A$ is contractive for initial $A$, and that

#[#set math.equation(numbering: n => "(35)")
 $ L_n \( R_(B \\ A) b_u \) lt.eq 2 wide \( A subset.eq B upright(" initial") \) . $ <eq:linear-window-path>]

Indeed, a root path meets $B \\ A$ in an interval, whose indicator is the difference of two root-path indicators,
  with a missing endpoint interpreted as zero.

The estimates in this section measure how much of a dyadic martingale can appear on successive new layers.
  Predictability means that the layer is chosen before the sign producing the new martingale value.
  It is this timing, together with the coherence of path coefficients,
  that makes the estimates uniform in the tree heights. We first prove a bound for martingales supported on
  predictable heads. We then give a second proof using variation,
  and two estimates that allow leakage of the parent vector into the new window.
  The first proof establishes a signed comparison for its child and parent mixtures,
  using the same positive-mass idea as above in a direct polar argument.
  The variation proof applies the subtree-quota lemma to its collapsed coefficients.

=== 6.1 Predicting the coefficient of one random path <predicting-the-coefficient-of-one-random-path>

Fix an integer $m gt.eq 1$. On $Omega = { - 1 \, 1 }^m$, with uniform probability,
  let $cal(F)_i$ be the sigma-field generated by the first $i$ signs,
  and write $bb(E)_i$ for conditional expectation. An $X$-valued dyadic martingale is a sequence $x_i = bb(E)_i x_m$.

#thm([Theorem 6.1.])[
  (Predictable-layer energy).  #emph[Let $x_0 \, dots.h \, x_m$ be an $X$-valued dyadic martingale.
    Let $P_0$ be a fixed finite initial set, and, for $1 lt.eq i lt.eq m$,
    let $P_i$ be a finite initial set measurable with respect to $cal(F)_(i - 1)$. Suppose, on every history, that
$ P_(i - 1) subset.eq P_i quad \( 1 lt.eq i lt.eq m \) \, wide
  "supp" x_i subset.eq P_i quad \( 0 lt.eq i lt.eq m \) \, wide parallel x_m parallel lt.eq C . $

 Then, for $Delta_i = P_i \\ P_(i - 1)$,
#[#set math.equation(numbering: n => "(36)")
 $ sum_(i = 1)^m bb(E) parallel R_(Delta_i) x_i parallel^2 lt.eq 495 C^2 . $ <eq:linear-energy-495>]

]
] <thm:linear-predictable-energy>

#proof[
  There are only finitely many relevant coordinates, since there are finitely many sign histories and all the sets
    $P_i$ are finite. We first represent the terminal value by one random atom in each component.
    The finite-head unit ball is exactly the convex hull in (20).
    This description provides finite random representations by a Hilbert-ball vector or a signed root path.
  For each terminal history and each component, apply this description with $P = P_m ∩ T_n$,
    rescaled by $L_n \( x_m^n \)$. On a finite extension of the probability space we may therefore choose $h_n \,
    c_n \, u_n$ so that
  #[#set math.equation(numbering: n => "(37)")
   $ bb(E) \[ h_n + c_n b_(u_n) divides cal(F)_m \] = x_m^n \, wide
     sum_n \( parallel h_n parallel_2^2 + \| c_n \|^2 \) lt.eq C^2 . $ <eq:linear-one-atom>]
  For each component the sample is either a Hilbert-ball vector $h_n$, with $c_n = 0$,
    or a signed root path with $h_n = 0$ and $\| c_n \| = L_n \( x_m^n \)$.
    Zero components use both coefficients zero. An arbitrary root can be used for $u_n$ when $c_n = 0$.
    The sigma-fields $cal(F)_i$ still record only the original signs.
    In particular $x_i = bb(E)_i \( h_n + c_n b_(u_n) \)_n$.
  Let $v_i^n$ be the deepest vertex of the path to $u_n$ in $P_i$,
    or a symbol $partial$ if this intersection is empty; set $b_partial = 0$. The path trace on the new layer is
  $ I_i^n = R_(Delta_i ∩ T_n) b_(u_n) = b_(v_i^n) - b_(v_(i - 1)^n) \, wide L_n \( I_i^n \) lt.eq 2 . $
  The sigma-fields $cal(G)_i^n = sigma \( cal(F)_i \, v_i^n \)$ increase:
    from $v_i^n$ and the previous sign history one recovers $v_(i - 1)^n$ by truncating its path to $P_(i - 1)$.
    Set $a_i^n = bb(E) \[ c_n divides cal(G)_i^n \]$. Orthogonality of scalar martingale increments gives
  #[#set math.equation(numbering: n => "(38)")
   $ sum_n sum_(i = 1)^m bb(E) \| a_i^n - a_(i - 1)^n \|^2 lt.eq sum_n bb(E) \| c_n \|^2 lt.eq
     C^2 . $ <eq:linear-coefficient-energy>]
  We split the new layer into its Hilbert contribution, its old predicted path coefficient,
    and the change in that prediction:
  $ R_(Delta_i) x_i & = H_i + M_i + W_i \,\
H_i & = bb(E)_i R_(Delta_i) \( h_n \)_n \,\
M_i & = bb(E)_i \( a_(i - 1)^n I_i^n \)_n \,\
W_i & = bb(E)_i \( \( a_i^n - a_(i - 1)^n \) I_i^n \)_n . $
  The identity follows because $I_i^n$ is $cal(G)_i^n$-measurable,
    so $c_n$ may be replaced by $a_i^n$ inside its conditional expectation.
    Conditional Jensen, the disjointness of the $Delta_i$ on each outcome, and (38) show that
  #[#set math.equation(numbering: n => "(39)")
   $ sum_i bb(E) parallel H_i parallel^2 lt.eq C^2 \, wide sum_i bb(E) parallel W_i parallel^2 lt.eq
     4 C^2 . $ <eq:linear-HW-energy>]
  Here we use $L_n lt.eq parallel dot.op parallel_2$ for the first inequality.
    Denote conditional expectations given $cal(F)_(i - 1)$ by primes.
    Predictability of $Delta_i$, together with the support of $x_(i - 1)$, gives $H'_i + M'_i + W'_i =
    R_(Delta_i) x_(i - 1) = 0$. Consequently
  #[#set math.equation(numbering: n => "(40)")
   $ sum_i bb(E) parallel M'_i parallel^2 lt.eq 10 C^2 . $ <eq:linear-old-M-energy>]
  It remains to compare the old-coefficient contribution on a child history with its average on the parent history.
  We prove $parallel M_i parallel lt.eq 4 parallel M'_i parallel$ pointwise.
    Fix a component and a history through time $i - 1$. For $v in Delta_i ∩ T_n$,
    let $r \( v \)$ be the first vertex of $Delta_i$ on its root path.
    If $v_i^n = v$, then $v_(i - 1)^n$ is the parent of $r \( v \)$,
    or $partial$ when this first vertex is the root. Thus the value of $a_(i - 1)^n$ on these outcomes is a scalar
    $q_(r \( v \))$ depending only on this first vertex. It is the conditional mean on the old trace cell
    determined by the parent history and $v_(i - 1)^n = r \( v \)^(-)$,
    with the root case interpreted as $partial$. On a null old trace cell put $q_(r \( v \)) = 0$;
    all its parent and child trace probabilities then vanish.
    Let $mu \( v \)$ and $tilde(mu) \( v \)$ be the probabilities of $v_i^n =
    v$ conditional on this parent history and on a specified child history, respectively.
    Since both children have probability $1 \/ 2$, $tilde(mu) \( v \) lt.eq 2 mu \( v \)$.
  Put $I \( v \) = b_v - b_(r \( v \)^(-))$, interpreting the second term as zero when $r \( v \)$ is the root.
    Outcomes with $v_i^n in.not Delta_i$ have zero path trace. The two conditional mixtures are therefore
  $ M_i^n & = sum_(v in Delta_i ∩ T_n) q_(r \( v \)) tilde(mu) \( v \) I \( v \) \,\
\( M'_i \)^n & = sum_(v in Delta_i ∩ T_n) q_(r \( v \)) mu \( v \) I \( v \) . $
  For an admissible test $a$, put $A_v = sum_(w in \[ r \( v \) \, v \]) a_w$. We have
  $ \| chevron.l M_i^n \, a chevron.r \| lt.eq 2 sum_(v in Delta_i ∩ T_n) \| q_(r \( v \)) \| mu \( v \) \| A_v \| . $
  Define a test candidate $f$, zero off $Delta_i ∩ T_n$, by
  $ f_v = "sign" \( q_(r \( v \)) \) \( \| A_v \| - \| A_(v^(-)) \| \) \, $
  where $A_(v^(-)) = 0$ at the first vertex of each interval and $"sign" \( 0 \) = 0$.
    The reverse triangle inequality gives $parallel f parallel_2 lt.eq parallel a parallel_2$.
    Each root path meets $Delta_i$ in at most one interval. Summing $f$ on that interval telescopes to a signed
    $\| A_v \|$, which is at most $2$, since $A_v$ is the difference of two root-path sums of $a$.
    Hence $f \/ 2$ is admissible. Moreover
  $ chevron.l \( M'_i \)^n \, f chevron.r = sum_(v in Delta_i ∩ T_n) \| q_(r \( v \)) \| mu \( v \) \| A_v \| . $
  Taking the supremum over $a$ proves $L_n \( M_i^n \) lt.eq 4 L_n \( \( M'_i \)^n \)$.
    Summing the component squares proves the required comparison.
    By (40), the total energy of $M_i$ is at most $160 C^2$. Finally, $parallel H_i + M_i + W_i parallel^2 lt.eq
    3 \( parallel H_i parallel^2 + parallel M_i parallel^2 + parallel W_i parallel^2 \)$,
    giving $3 \( 1 + 160 + 4 \) C^2 = 495 C^2$. ◻
]

=== 6.2 Variation and removal of positive mass <variation-and-removal-of-positive-mass>

A different argument keeps all terminal path coefficients rather than sampling one path.
  The quantity that telescopes is then the variation of their collapsed coefficients.
  Its gain controls the amount of positive mass that must be removed to make a child layer small in the Hilbert norm.

For a finite initial $R subset T_n$, define

$ d_R \( z \, u \) = z \( u \) - sum_(v upright(" child of ") u\
v in R) z \( v \) \, wide V_R \( z \) = sum_(u in R) \| d_R \( z \, u \) \| \, wide V_diameter \( z \) = 0 . $

Finite summation up the tree gives

#[#set math.equation(numbering: n => "(41)")
 $ R_R z = sum_(u in R) d_R \( z \, u \) b_u \, wide V_R \( B_n c \) lt.eq
   parallel c parallel_1 . $ <eq:linear-variation-representation>]

For the second inequality, each collapsed coefficient sums the $c_v$ whose deepest ancestor in $R$ is its label;
  these classes are disjoint.

#thm([Lemma 6.2.])[
  (Removing excess mass).  #emph[Let $S subset.eq T subset T_n$ be finite initial sets, let $z^(+) \,
    z^(-) in H_n$, and put $z = \( z^(+) + z^(-) \) \/ 2$. Put $U = T \\ S$ and
$ g = 1 / 2 #scale(x: 120%, y: 120%)[\(] V_T \( z^(+) \) + V_T \( z^(-) \) #scale(x: 120%, y: 120%)[\)] -
  V_S \( z \) . $

 Then $g gt.eq 0$ and, for either sign,
#[#set math.equation(numbering: n => "(42)")
 $ L_n \( R_U z^plus.minus \) lt.eq 2 parallel R_U z parallel_2 + 4 g . $ <eq:linear-mass-removal>]

]
] <lem:linear-mass-removal>

#proof[
  If $S = diameter$, then $L_n \( R_T z^plus.minus \) lt.eq V_T \( z^plus.minus \) lt.eq 2 g$,
    so the conclusion follows. Otherwise $S$ contains the root.
    For $u in T$, write $pi \( u \)$ for its deepest ancestor in $S$.
    Choose $sigma_s in { - 1 \, 1 }$ so that $sigma_s d_S \( z \, s \) = \| d_S \( z \, s \) \|$. Write
  $ d_T \( z^plus.minus \, u \) = sigma_(pi \( u \)) \( p_u^plus.minus - q_u^plus.minus \) \, wide
    p_u^plus.minus \, q_u^plus.minus gt.eq 0 \, $
  using the positive and negative parts. Collapsing the refined path coefficients to $S$ shows that
  #[#set math.equation(numbering: n => "(43)")
   $ g = 2 sum_(u in T) 1 / 2 \( q_u^(+) + q_u^(-) \) gt.eq 0 . $ <eq:linear-variation-gap>]
  For $u in U$, all descendants in $T$ have the same $pi$-label.
    Let $P_u^plus.minus \, Q_u^plus.minus$ be the respective sums of $p_v^plus.minus \,
    q_v^plus.minus$ over these descendants. Since $z^plus.minus \( u \) =
    sigma_(pi \( u \)) \( P_u^plus.minus - Q_u^plus.minus \)$,
  #[#set math.equation(numbering: n => "(44)")
   $ P_u^plus.minus lt.eq 2 "av" P_u^plus.minus lt.eq 2 \| z \( u \) \| + 2 "av" Q_u^plus.minus \,
     $ <eq:linear-positive-domination>]
  where $"av"$ means the average of the two signs.
  Fix one sign and apply Lemma 12 on the finite forest $U$ to the endpoint masses $mu_u =
    p_u^plus.minus$ and $nu_u = q_u^(+) + q_u^(-) = 2 "av" q_u^plus.minus$.
    Initiality of $S$ ensures that all descendants in $T$ of a vertex in $U$ remain in $U$.
    The corresponding subtree masses are therefore $P_u^plus.minus$ and $2 "av" Q_u^plus.minus$.
    The lemma gives $0 lt.eq r_u lt.eq p_u^plus.minus$ with
  $ sum_(v succ.curly.eq u) r_v gt.eq min { P_u^plus.minus \, 2 "av" Q_u^plus.minus } \, wide
    sum_(u in U) r_u lt.eq 2 sum_(u in U) "av" q_u^plus.minus lt.eq g . $
  By (44), the remaining mass satisfies
  $ P_u^plus.minus - sum_(v succ.curly.eq u) r_v lt.eq #scale(x: 120%, y: 120%)[\(] P_u^plus.minus -
    2 "av" Q_u^plus.minus #scale(x: 120%, y: 120%)[\)]_(+) lt.eq 2 \| z \( u \) \| . $
  Also $sum_(u in U) q_u^plus.minus lt.eq g$, by (43). The remaining positive mass defines
  $ v \( u \) = sigma_(pi \( u \)) sum_(w succ.curly.eq u) \( p_w^plus.minus - r_w \) quad \( u in U \) \, wide
    v = 0 upright(" off ") U . $
  Its coordinates satisfy $\| v \( u \) \| lt.eq 2 \| z \( u \) \|$. The exact decomposition
  $ R_U z^plus.minus = v + sum_(u in U) sigma_(pi \( u \)) \( r_u - q_u^plus.minus \) R_U b_u $
  therefore costs at most $2 parallel R_U z parallel_2 + 2 \( g + g \)$, as required. ◻
]

#thm([Theorem 6.3.])[
  (Variation energy).  #emph[Under all hypotheses of Theorem 16,
#[#set math.equation(numbering: n => "(45)")
 $ sum_(i = 1)^m bb(E) parallel R_(Delta_i) x_i parallel^2 lt.eq 252 C^2 . $ <eq:linear-energy-252>]

 In particular the bound is $1008$ when $parallel x_m parallel lt.eq 2$.]
] <thm:linear-variation-energy>

#proof[
  For each terminal history choose, componentwise,
  $ x_m^n = h_n + B_n c_n \, wide parallel h_n parallel_2 + parallel c_n parallel_1 lt.eq 2 L_n \( x_m^n \) \, $
  with both terms zero in a zero component. Only finitely many components are needed.
    Put $h_i = bb(E)_i \( h_n \)_n$, $b_i = \( B_n bb(E)_i c_n \)_n$; then $x_i = h_i + b_i$.
    The terminal Hilbert and coefficient budgets are each at most $4 C^2$:
  $ bb(E) parallel \( h_n \)_n parallel_(ell_2 \( product.co T_n \))^2 lt.eq 4 C^2 \, wide
    bb(E) sum_n parallel c_n parallel_1^2 lt.eq 4 C^2 . $
  At time $i - 1$, apply Lemma 17 in each component to $S = P_(i - 1) ∩ T_n$, $T = P_i ∩ T_n$,
    and the two values of $b_i^n$. These sets are fixed before the sign at time $i$.
    If $g_(i \, n)$ is the variation gain in the lemma, then
  $ V_(P_(i - 1) ∩ T_n) \( b_(i - 1)^n \)^2 + g_(i \, n)^2 lt.eq bb(E)_(i - 1) V_(P_i ∩ T_n) \( b_i^n \)^2 . $
  Indeed, the average variation equals the previous variation plus the nonnegative number $g_(i \, n)$;
    square and apply scalar Jensen. Telescoping and (41) give
  $ sum_(i \, n) bb(E) g_(i \, n)^2 lt.eq 4 C^2 . $
  Since $R_(Delta_i) x_(i - 1) = 0$, the lemma and the outer Euclidean norm imply
  $ parallel R_(Delta_i) x_i parallel lt.eq parallel R_(Delta_i) h_i parallel_2 +
    2 parallel R_(Delta_i) h_(i - 1) parallel_2 + 4 #scale(x: 180%, y: 180%)[\(] sum_n g_(i \, n)^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $
  For $j = i - 1$ and $j = i$, predictability gives $R_(Delta_i) h_j = bb(E)_j R_(Delta_i) \( h_n \)_n$.
    Conditional Jensen followed by pathwise disjointness of the layers bounds each of the two unscaled Hilbert
    energies by $4 C^2$. Squaring the last three-term inequality and summing now gives $3 \( 1 + 4 + 16 \) 4 C^2 =
    252 C^2$. ◻
]

=== 6.3 Outcome-dependent path measures and sign prediction <outcome-dependent-path-measures-and-sign-prediction>

The next estimate permits an error on the parent window. Here both the positive path mass and its sign may depend
  on the entire outcome. We place them on one measure space of outcome–path pairs.
  The scalar martingale of conditional signs then pays for changes of sign prediction,
  while a stopping antichain controls the remaining positive path mass.

#thm([Theorem 6.4.])[
  (Adaptive-window energy).  #emph[There is an absolute constant $K$ with the following property.
    Let $x_t = bb(E)_t x_m$, $0 lt.eq t lt.eq m$, be an $X$-valued dyadic martingale.
    For $0 lt.eq t < m$, let $A_t subset.eq D_t$ be finite initial sets measurable with respect to $cal(F)_t$,
    and suppose $D_t subset.eq A_(t + 1)$ whenever $t + 1 < m$. Put $U_t = D_t \\ A_t$. Then
#[#set math.equation(numbering: n => "(46)")
 $ sum_(t = 0)^(m - 1) bb(E) parallel R_(U_t) x_(t + 1) parallel^2 lt.eq
   K (bb(E) parallel x_m parallel^2 + sum_(t = 0)^(m - 1) bb(E) parallel R_(U_t) x_t parallel^2) .
   $ <eq:linear-sign-energy>]

 No support condition on $x_t$ is imposed.]
] <thm:linear-sign-energy>

#proof[
  For every terminal outcome and component choose
  $ x_m^n = h_n + B_n lambda_n \, wide parallel h_n parallel_2 + parallel lambda_n parallel_1 lt.eq
    2 L_n \( x_m^n \) . $
  Write $lambda_n = epsilon.alt_n mu_n$, where $mu_n = \| lambda_n \|$, $\| epsilon.alt_n \| lt.eq 1$, and $M_n =
    mu_n \( T_n \)$. Thus $mu_n$ is a positive measure on path endpoints,
    allowed to depend on the terminal outcome. The two budgets satisfy
  #[#set math.equation(numbering: n => "(47)")
   $ bb(E) sum_n \( parallel h_n parallel_2^2 + M_n^2 \) lt.eq
     4 bb(E) parallel x_m parallel^2 . $ <eq:linear-sign-budgets>]
  On outcome–endpoint pairs put the finite positive measure
  $ nu_n \( { omega } times { u } \) = 2^(- m) mu_n \( omega \, { u } \) . $
  This need not be a probability measure; conditional means on its positive-mass cells have their usual meaning.
    On null cells set them to zero. The operators $bb(E)_t$ still use the original uniform law on sign histories,
    whereas the conditional means of $epsilon.alt_n$ below use $nu_n$,
    which need not give equal mass to the two sign children. Let $a_(t \, n)^(-)$ be the conditional mean of
    $epsilon.alt_n$ given the first $t$ signs and the truncation of the root path to $A_t$.
    Let $a_(t \, n)^(+)$ be its conditional mean given the first $t + 1$ signs and its truncation to $D_t$.
    Empty truncations are recorded by a dummy symbol. The conditioning partitions, ordered as
  $ \( 0 \, - \) \, \( 0 \, + \) \, \( 1 \, - \) \, \( 1 \, + \) \, dots.h \, \( m - 1 \, - \) \, \( m - 1 \, + \) \, $
  refine successively: the known sign history and truncation of a deeper trace to the earlier head recover the
    preceding data. Define
  $ q_(t \, n) = bb(E)_(t + 1) integral \| a_(t \, n)^(+) - a_(t \, n)^(-) \| thin d mu_n . $
  We first establish the weighted sign estimate
  #[#set math.equation(numbering: n => "(48)")
   $ sum_(t < m) bb(E) q_(t \, n)^2 lt.eq 4 bb(E) M_n^2 . $ <eq:linear-weighted-sign>]
  For clarity fix $n$ temporarily. Conditional Cauchy–Schwarz gives
  $ q_t^2 lt.eq \( bb(E)_(t + 1) M \) thin bb(E)_(t + 1) integral \| a_t^(+) - a_t^(-) \|^2 thin d mu . $
  Under the original sign law the children are fair, so $M gt.eq 0$ gives $bb(E)_(t + 1) M lt.eq 2 bb(E)_t M$. Put
  $ R_t = max_(0 lt.eq j lt.eq t) bb(E)_j M \, wide R_(- 1) = 0 . $
  The conversion from the sign law to the pair measure is
  $ bb(E) [\( bb(E)_t M \) thin bb(E)_(t + 1) integral \| a_t^(+) - a_t^(-) \|^2 thin d mu] =
    integral \( bb(E)_t M \) \| a_t^(+) - a_t^(-) \|^2 thin d nu \, $
  because $bb(E)_t M$ is measurable at time $t + 1$. Hence the sum of the integrated right sides is at most
  $ 2 sum_(t < m) integral R_t \| a_t^(+) - a_t^(-) \|^2 thin d nu . $
  Expand $R_t = sum_(j lt.eq t) \( R_j - R_(j - 1) \)$. Each nonnegative increment is constant on each cell $C$ of
    the partition defining $a_j^(-)$. Orthogonality of successive conditional-mean increments under $nu$ gives
  $ sum_(t = j)^(m - 1) integral_C \| a_t^(+) - a_t^(-) \|^2 thin d nu & lt.eq integral_C \| epsilon.alt -
    a_j^(-) \|^2 thin d nu\
 & = integral_C \| epsilon.alt \|^2 thin d nu - nu \( C \) \| a_j^(-) \|^2 lt.eq nu \( C \) . $
  The left side uses only some increments of the refining sequence; omitting the others preserves the bound.
    Multiply by the cell-constant value of $R_j - R_(j - 1)$, then sum over cells and $j$.
    The weighted sum $2 sum_(t < m) integral R_t \| a_t^(+) -
    a_t^(-) \|^2 thin d nu$ is consequently at most $2 integral R_(m - 1) thin d nu = 2 bb(E) \( M R_(m - 1) \)$.
  The scalar input is the finite-horizon form of Doob’s $L_2$ maximal inequality #cite(label("Doob1953")).
    We include its first-crossing proof:
  $ parallel max_(j lt.eq m) bb(E)_j M parallel_2 lt.eq 2 parallel M parallel_2 . $
  Indeed, if $R = max_(j lt.eq m) bb(E)_j M$, partitioning the event ${ R gt.eq
    u }$ according to its first crossing gives $u bb(P) \( R gt.eq u \) lt.eq
    bb(E) \[ M upright(bold(1))_({ R gt.eq u }) \]$. Integrating in $u$ yields $bb(E) R^2 lt.eq
    2 bb(E) \( M R \)$; Cauchy–Schwarz proves the claim. Thus $2 bb(E) \( M R_(m - 1) \) lt.eq 4 bb(E) M^2$,
    proving (48).
  We next compare a child window with its parent window, keeping the component $n$ fixed.
    For a vertex $s$, write $C_s = { u : s prec.curly.eq u }$ for the cone of endpoints whose paths pass through
    $s$. Define the signed endpoint measures
  $ lambda'_(t + 1) = bb(E)_(t + 1) \( a_t^(-) mu_n \) \, wide rho_(t + 1) =
    bb(E)_(t + 1) \( \( a_t^(+) - a_t^(-) \) mu_n \) . $
  For $s in U_t$, the child sign history together with membership in $C_s$ is measurable for the partition
    defining $a_t^(+)$. Hence
  $ bb(E)_(t + 1) integral_(C_s) epsilon.alt_n thin d mu_n = bb(E)_(t + 1) integral_(C_s) a_t^(+) thin d mu_n =
    lambda'_(t + 1) \( C_s \) + rho_(t + 1) \( C_s \) . $
  Thus their sum represents the path part of $x_(t + 1)^n$ on the window $U_t$.
    The error measure satisfies $parallel rho_(t + 1) parallel_1 lt.eq q_(t \, n)$.
    Let $h_(t \, n) = bb(E)_t h_n$, $lambda'_t = bb(E)_t lambda'_(t + 1)$, and $rho_t = bb(E)_t rho_(t + 1)$.
    Averaging gives, at each $s in U_t$,
  #[#set math.equation(numbering: n => "(49)")
   $ x_t^n \( s \) = h_(t \, n) \( s \) + lambda'_t \( C_s \) + rho_t \( C_s \) . $ <eq:linear-parent-path>]
  Fix a history through time $t$. On every cone $C_s$ with $s in U_t$, truncation to $A_t$ is fixed.
    Thus $a_t^(-)$ is constant on that cone, including all completions of the fixed sign history.
    There is no cancellation within the cone in either $lambda'_t$ or $lambda'_(t + 1)$.
    With $phi.alt_s = \| lambda'_t \( C_s \) \|$, fair binary conditioning therefore gives
  #[#set math.equation(numbering: n => "(50)")
   $ \| lambda'_(t + 1) \| \( C_s \) lt.eq 2 phi.alt_s . $ <eq:linear-positive-path-comparison>]
  Choose another path decomposition, now only for the parent window:
  $ R_(U_t) x_t^n = d + B_n theta \, wide parallel d parallel_2 + parallel theta parallel_1 lt.eq 2 r_(t \, n) \,
    wide r_(t \, n) = L_n \( R_(U_t) x_t^n \) . $
  If $beta = \| theta \| + \| rho_t \|$, then (49) gives
  #[#set math.equation(numbering: n => "(51)")
   $ phi.alt_s lt.eq \| d \( s \) - h_(t \, n) \( s \) \| + beta \( C_s \) \, wide parallel beta parallel_1 lt.eq
     parallel theta parallel_1 + bb(E)_t q_(t \, n) . $ <eq:linear-stopping-domination>]
  Stop along each descending line at the first vertex $s in U_t$ where $beta \( C_s \) gt.eq phi.alt_s \/ 2$.
    These first vertices form an antichain, so their endpoint cones are disjoint.
    At window vertices neither stopped nor below a stop, $phi.alt_s lt.eq 2 \| d \( s \) - h_(t \, n) \( s \) \|$.
    By (50), the vector formed by the child’s path coordinates at these vertices has Hilbert norm at most
    $4 \( parallel d parallel_2 + parallel R_(U_t) h_(t \, n) parallel_2 \)$.
    On the remaining part of the window, every contributing endpoint lies in a stopping cone.
    Its total $\| lambda'_(t + 1) \|$-mass is at most $4 parallel beta parallel_1$, using the stopping inequality,
    the factor $2$ in (50), and disjointness of the cones. Each path contributes there on an interval,
    of $L_n$-norm at most $2$. This part therefore costs at most $8 parallel beta parallel_1$.
    The error measure $rho_(t + 1)$ costs at most $2 q_(t \, n)$.
    Combining these estimates gives the explicit component bound
  #[#set math.equation(numbering: n => "(52)")
   $ L_n \( R_(U_t) x_(t + 1)^n \) lt.eq  & parallel R_(U_t) h_(t + 1 \, n) parallel_2 +
     4 parallel R_(U_t) h_(t \, n) parallel_2\
 & + 16 r_(t \, n) + 8 bb(E)_t q_(t \, n) + 2 q_(t \, n) . $ <eq:linear-sign-window>]
  Here $4 parallel d parallel_2 + 8 parallel theta parallel_1 lt.eq 16 r_(t \, n)$.
  We have reduced the vector estimate to square summation. Conditional Jensen and predictability of $U_t$ give,
    for $j = t \, t + 1$,
  $ bb(E) parallel R_(U_t) h_(j \, n) parallel_2^2 lt.eq bb(E) parallel R_(U_t) h_n parallel_2^2 . $
  The windows are disjoint on every outcome, so summing over $t \,
    n$ bounds either Hilbert energy by $bb(E) sum_n parallel h_n parallel_2^2$.
    The same summation for $q_(t \, n)$ and $bb(E)_t q_(t \, n)$ is bounded by $4 bb(E) sum_n M_n^2$,
    by (48) and Jensen. Square the five terms in (52), bounding their sum’s square by five times the sum of
    squares, and use (47). This proves (46) with an absolute constant.
    All sums over components involve nonnegative terms; Tonelli’s theorem justifies them even when the terminal
    vectors have infinitely many nonzero components. ◻
]

=== 6.4 Fixed windows and a direct leakage estimate <fixed-windows-and-a-direct-leakage-estimate>

For fixed heads, a simpler collapse of the terminal signed masses gives an explicit leakage constant.
  It uses the mass whose sign disagrees with the previous collapsed coefficient,
  rather than a martingale of predicted signs. Unlike Theorem 16,
  the conclusion pays for the actual parent contribution to each window.

#thm([Theorem 6.5.])[
  (Energy with leakage).  #emph[Let $W_i = bb(E)_i W_m$, $0 lt.eq i lt.eq m$, be an $X$-valued dyadic martingale.
    Let $A_0 subset.eq dots.h.c subset.eq A_m$ be fixed finite initial sets and put $Delta_i = A_i \\ A_(i - 1)$. Then
#[#set math.equation(numbering: n => "(53)")
 $ sum_(i = 1)^m bb(E) parallel R_(Delta_i) W_i parallel^2 lt.eq
   1024 (bb(E) parallel W_m parallel^2 + sum_(i = 1)^m bb(E) parallel R_(Delta_i) W_(i - 1) parallel^2) .
   $ <eq:linear-leakage-1024>]

]
] <thm:linear-leakage-energy>

#proof[
  We first work in one component, suppressing $n$ and restricting each set to its tree. At each terminal outcome choose
  $ W_m = H + B_n c \, wide parallel H parallel_2 + parallel c parallel_1 lt.eq 2 L_n \( W_m \) \, $
  and let $H_i = bb(E)_i H$. For an endpoint $s$, let $pi_i \( s \)$ be its deepest ancestor in $A_i$,
    or $partial$ if none exists. Set $pi_i \( partial \) = partial$ and $b_partial = 0$. Define
  $ c_r^i = bb(E)_i sum_(pi_i \( s \) = r) c_s \, wide v_i = sum_(r in A_i union { partial }) \| c_r^i \| . $
  The dummy coefficient is kept in this last sum even though its path vector vanishes.
    This ensures the exact refinement identity
  #[#set math.equation(numbering: n => "(54)")
   $ bb(E)_(i - 1) sum_(pi_(i - 1) \( r \) = q) c_r^i = c_q^(i - 1) quad \( q in A_(i - 1) union { partial } \) .
     $ <eq:linear-collapsed-refinement>]
  The child window itself has the representation
  $ R_(Delta_i) W_i = R_(Delta_i) H_i + sum_r c_r^i R_(Delta_i) b_r . $
  Orient each refined coefficient by its old collapsed coefficient:
  $ sigma_r = "sign" \( c_(pi_(i - 1) \( r \))^(i - 1) \) \, wide c_r^i = sigma_r \( g_r - q_r \) \, wide g_r \,
    q_r gt.eq 0 \, $
  where sign at zero is chosen to be $+ 1$, and $g_r \, q_r$ are the positive and negative parts of $sigma_r
    c_r^i$. The signs are known on the parent history. By (54),
  $ beta_i := bb(E)_(i - 1) sum_r q_r = 1 / 2 \( bb(E)_(i - 1) v_i - v_(i - 1) \) gt.eq 0 . $
  The elementary inequality $\( bb(E)_(i - 1) v_i - v_(i - 1) \)^2 lt.eq bb(E)_(i - 1) v_i^2 -
    v_(i - 1)^2$ therefore telescopes to
  #[#set math.equation(numbering: n => "(55)")
   $ sum_i bb(E) beta_i^2 lt.eq 1 / 4 bb(E) v_m^2 lt.eq 1 / 4 bb(E) parallel c parallel_1^2 .
     $ <eq:linear-bad-mass-energy>]
  Fix a step and a parent history. For $t in Delta_i$, all its descendant labels in $A_i$ have the same old
    ancestor and therefore the same sign $sigma_t$. Set $g \( t \) = sum_(r succ.curly.eq t) g_r$ and $q \( t \) =
    sum_(r succ.curly.eq t) q_r$, with the dummy omitted. Averaging the coordinate formula gives
  $ W_(i - 1) \( t \) = H_(i - 1) \( t \) + sigma_t \( bb(E)_(i - 1) g \( t \) - bb(E)_(i - 1) q \( t \) \) . $
  Decompose the leaked parent window once more:
  $ Y = R_(Delta_i) W_(i - 1) = L + B_n d \, wide parallel L parallel_2 + parallel d parallel_1 lt.eq 2 L_n \( Y \) . $
  There are two equally likely children and $g \( t \) gt.eq 0$, so
  $ g \( t \) lt.eq 2 bb(E)_(i - 1) g \( t \) lt.eq
    2 (\| L \( t \) \| + \| H_(i - 1) \( t \) \| + sum_(s succ.curly.eq t) \| d_s \| + bb(E)_(i - 1) q \( t \)) . $
  Call $t in Delta_i$ large when $g \( t \) > 4 \( \| L \( t \) \| + \| H_(i - 1) \( t \) \| \)$. At a large node,
  $ g \( t \) lt.eq 4 (sum_(s succ.curly.eq t) \| d_s \| + bb(E)_(i - 1) q \( t \)) . $
  The minimal large nodes form an antichain. Mark every coefficient label in $A_i$ below one of them.
    Their descendant sets are disjoint, so the total marked positive mass is at most
    $4 \( parallel d parallel_1 + beta_i \)$. The total negative mass satisfies $sum_r q_r lt.eq 2 beta_i$,
    again by fair binary averaging. Using $L_n \( R_(Delta_i) b_r \) lt.eq 2$,
    all marked positive terms together with all negative terms cost at most $8 parallel d parallel_1 + 12 beta_i$.
  It remains to estimate the unmarked positive part. Its coordinate is zero at every large vertex,
    since all descendant labels there are marked. At other vertices its absolute value is at most $g \( t \) lt.eq
    4 \( \| L \( t \) \| + \| H_(i - 1) \( t \) \| \)$. Its Hilbert norm is consequently at most
    $4 \( parallel L parallel_2 + parallel R_(Delta_i) H_(i - 1) parallel_2 \)$. Including the child Hilbert term yields
  #[#set math.equation(numbering: n => "(56)")
   $ L_n \( R_(Delta_i) W_i \) lt.eq  & parallel R_(Delta_i) H_i parallel_2 +
     4 parallel R_(Delta_i) H_(i - 1) parallel_2 + 12 beta_i\
 & + 16 L_n \( R_(Delta_i) W_(i - 1) \) . $ <eq:linear-leakage-one-step>]
  The last coefficient follows from $4 parallel L parallel_2 + 8 parallel d parallel_1 lt.eq 16 L_n \( Y \)$.
  For $j = i - 1 \, i$, conditional Jensen and the fixed, disjoint windows give $sum_i bb(E) parallel R_(Delta_i)
    H_j parallel_2^2 lt.eq bb(E) parallel H parallel_2^2$. Squaring the four terms in (56),
    using four times their squared sum, and applying (55), gives
  $ sum_i bb(E) L_n \( R_(Delta_i) W_i \)^2 lt.eq 68 bb(E) parallel H parallel_2^2 +
    144 bb(E) parallel c parallel_1^2 + 1024 sum_i bb(E) L_n \( R_(Delta_i) W_(i - 1) \)^2 . $
  The first two terms are at most $144 bb(E) \( parallel H parallel_2 + parallel c parallel_1 \)^2 lt.eq
    576 bb(E) L_n \( W_m \)^2$. Finally sum over the components and replace $576$ by $1024$ in the terminal term.
    This proves (53). ◻
]

== 7 Quadratic path costs <qp:section>

=== 7.1 The quotient norm and its normalization <the-quotient-norm-and-its-normalization>

For an integer $n gt.eq 1$, let $T_n = bb(N)^(lt.eq n)$, including the empty sequence $o$,
  with the initial-segment order $prec.curly.eq$. Work over the real field. In $H_n = ell_2 \( T_n \)$ put

$ p_t = sum_(s prec.curly.eq t) e_s \, wide J_n lambda = sum_(t in T_n) lambda_t p_t
  quad \( lambda in ell_1 \( T_n \) \) . $

The series converges absolutely in $H_n$, since $parallel p_t parallel_2 lt.eq sqrt(n + 1)$.
  Thus $\( J_n lambda \) \( s \) = sum_(t succ.curly.eq s) lambda_t$ and $parallel J_n parallel lt.eq
  sqrt(n + 1)$. Define $Z_n$ to be $H_n$ with the norm

#[#set math.equation(numbering: n => "(57)")
 $ \| z \|_n = inf_(z = h + J_n lambda) #scale(x: 120%, y: 120%)[\(] parallel h parallel_2^2 +
   parallel lambda parallel_1^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, wide h in H_n \, quad
   lambda in ell_1 \( T_n \) \, $ <qp:norm>]

and set

$ X_(upright(q)) = #scale(x: 180%, y: 180%)[\(] xor.big_(n gt.eq 1) Z_n #scale(x: 180%, y: 180%)[\)]_2 \, wide
  parallel z parallel_(upright(q))^2 = sum_n \| z_n \|_n^2 . $

In the notation of Section 5, $p_t = b_t$, $J_n = B_n$, and $\| z \|_n = Q_n \( z \)$.
  To bound midpoint tails, we compare the costs of two endpoint representations with the cost of their average
  restricted to a finite head.

#thm([Proposition 7.1.])[
  #emph[The spaces $Z_n$ and $X_(upright(q))$ are Banach and reflexive,
    and finite node support is dense in $X_(upright(q))$. For $z in H_n$,
#[#set math.equation(numbering: n => "(58)")
 $ frac(parallel z parallel_2, sqrt(n + 2)) lt.eq \| z \|_n lt.eq parallel z parallel_2 \, wide \| z_t \| lt.eq
   sqrt(2) thin \| z \|_n . $ <qp:comparison>]

 In particular $1 \/ sqrt(2) lt.eq \| p_t \|_n \, \| e_t \|_n lt.eq 1$, and $\| e_o \|_n = 1 \/ sqrt(2)$.
   For $f in ell_2 \( T_n \)$ the dual norm is
#[#set math.equation(numbering: n => "(59)")
 $ \| f \|_(n \, *) = (parallel f parallel_2^2 + sup_(t in T_n) lr(|sum_(s prec.curly.eq t) f_s|)^2)^(1 \/ 2) .
   $ <qp:dual>]

]
] <qp:construction>

#proof[
  Scaling and adding representations in (57) proves homogeneity and the triangle inequality.
    Every representation satisfies
  $ parallel z parallel_2 lt.eq parallel h parallel_2 + sqrt(n + 1) parallel lambda parallel_1 lt.eq
    sqrt(n + 2) #scale(x: 120%, y: 120%)[\(] parallel h parallel_2^2 +
    parallel lambda parallel_1^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \; $
  the choice $h = z$ gives the upper bound. This proves positive definiteness, completeness,
    and equivalence to the Hilbert norm. The dual and bidual therefore have the same underlying continuous linear
    functionals as for $H_n$, so $Z_n$ is reflexive. For each coordinate, $\| z_t \| lt.eq parallel h parallel_2 +
    parallel lambda parallel_1$, which gives the second assertion of (58).
    A single atomic mass represents $p_t$ with cost one. For $e_t$ use its Hilbert representation.
    At the root, the representation $e_o = e_o \/ 2 + J_n \( delta_o \/ 2 \)$ attains the matching cost $1 \/ sqrt(2)$.
  The quotient map $\( h \, lambda \) mapsto h + J_n lambda$ has domain $H_n xor_2 ell_1 \( T_n \)$.
    Pulling the functional $f$ back gives $\( f \, J_n^(*) f \)$,
    whose norm is $#scale(x: 120%, y: 120%)[\(] parallel f parallel_2^2 +
    parallel J_n^(*) f parallel_oo^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)$.
    Indeed the upper bound is Cauchy–Schwarz, and the reverse bound follows by choosing the Hilbert vector in the
    direction of $f$, an atomic coordinate arbitrarily close to the supremum for $J_n^(*) f$,
    and then optimizing their two nonnegative lengths. The pullback and quotient functional norms agree:
    a representation bounds the functional by its cost, and representations can have cost arbitrarily close to $\|
    z \|_n$. Since $\( J_n^(*) f \) \( t \) = sum_(s prec.curly.eq t) f_s$,
    this proves (59) without requiring a maximizing endpoint.
  For completeness of the outer sum, a Cauchy sequence converges in each $Z_n$;
    its Cauchy bounds pass first to every finite sum and then to the whole sum,
    proving membership and convergence of the limit. A bounded functional on this sum restricts to functionals
    $f_n in Z_n^(*)$ with $sum_n parallel f_n parallel^2 < oo$.
    To prove the bound on this sum, test on finite collections of almost norming unit vectors multiplied by
    arbitrary Euclidean unit scalar vectors. Conversely such $\( f_n \)$ defines a functional by Cauchy–Schwarz.
    Density of finite component sums shows that these constructions are inverse and isometric.
    Applying the same description to the bidual and using component reflexivity proves reflexivity of
    $X_(upright(q))$. Finally truncate the outer sum and then the Hilbert coordinates in each remaining component
    to obtain finite node support. ◻
]

Write

$ H = #scale(x: 180%, y: 180%)[\(] xor.big_n H_n #scale(x: 180%, y: 180%)[\)]_2 \, wide L =
  #scale(x: 180%, y: 180%)[\(] xor.big_n ell_1 \( T_n \) #scale(x: 180%, y: 180%)[\)]_2 . $

The componentwise map $J : L arrow.r X_(upright(q))$ and the coordinate inclusion $H arrow.r
  X_(upright(q))$ are contractions, and

#[#set math.equation(numbering: n => "(60)")
 $ parallel z parallel_(upright(q)) = inf_(z = h + J lambda) #scale(x: 120%, y: 120%)[\(] parallel h
   parallel_H^2 + parallel lambda parallel_L^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <qp:global-quotient>]

For the reverse inequality in this formula choose component representations with total error in the squared costs
  less than any prescribed positive number. This also produces $h in H$ and $lambda in L$.
  The map $J$ here takes values in $X_(upright(q))$; no uniform bound $L arrow.r H$ is used.

A #emph[finite ancestral head] is a finite set $A$ of nodes in the disjoint union of the $T_n$,
  closed under taking ancestors within each component. This is the closure condition called initial in the
  preceding sections. Its intersection $A_n$ with $T_n$ may be empty.
  Let $P_A$ retain the coordinates in $A$ and let $Q_A = I - P_A$.
  For $t in T_n$ denote its longest ancestor in $A_n$ by $r \( t \)$, using $perp$ when there is none,
  and put $p_perp = 0$.

#thm([Lemma 7.2.])[
  #emph[The operator $R_A$ which sends the mass $lambda_t$ to $r \( t \)$ and discards it when $r \( t \) =
    perp$ is contractive on $L$. Moreover
$ P_A J = J R_A \, wide parallel P_A parallel lt.eq 1 \, wide parallel Q_A parallel lt.eq 2 \,
  wide \| Q_A J_n lambda \|_n lt.eq 2 parallel lambda parallel_1 . $

 Here the last formula is in a single component. In particular the path $p_t -
   p_(r \( t \))$ outside the head has norm at most two.]
] <qp:head>

#proof[
  The triangle inequality bounds the absolute sum in every fiber of $r$,
    so $R_A$ contracts each $ell_1$ component and hence $L$. Coordinate restriction gives $P_A p_t =
    p_(r \( t \))$ and thus $P_A J = J R_A$. Projecting $h$ orthogonally in $H$ and folding $lambda$ in (60)
    proves contractivity of $P_A$. The remaining bounds follow from $Q_A = I -
    P_A$ and $parallel J lambda parallel_(upright(q)) lt.eq parallel lambda parallel_L$. ◻
]

#thm([Proposition 7.3.])[
  #emph[No equivalent norm on $X_(upright(q))$ is asymptotically uniformly convex.
    More precisely, if $a parallel z parallel_(upright(q)) lt.eq N \( z \) lt.eq
    b parallel z parallel_(upright(q))$, with $0 < a lt.eq b < oo$, then $overline(delta)_N \( t_0 \) =
    0$ at $t_0 = a \/ \( sqrt(2) b \)$.]
] <qp:no-auc>

#proof[
  For each fixed nonterminal $s in T_n$, the coordinate vectors $e_(s^frown j)$ are weakly null in $Z_n$,
    by its equivalence to $H_n$, and therefore in $X_(upright(q))$.
    Their norms and the norms of $p_s$ are at least $1 \/ sqrt(2)$,
    while $parallel p_s parallel_(upright(q)) lt.eq 1$. Suppose $overline(delta)_N \( t_0 \) > 0$ and choose $c >
    0$ with $2 c < overline(delta)_N \( t_0 \)$. At $u = p_s \/
    N \( p_s \)$ choose a closed finite-codimensional subspace $F$ such that $N \( u + t_0 v \) > 1 +
    2 c$ for every $v in F$ with $N \( v \) = 1$. The normalized sequence $v_j =
    e_(s^frown j) \/ N \( e_(s^frown j) \)$ is weakly null, because its denominators are bounded below.
    Its image in $X_(upright(q)) \/ F$ is norm null. Approximation in $F$, followed by normalization,
    gives vectors of $F ∩ S_N$ whose $N$-distance from $v_j$ tends to zero.
    Consequently $N \( u + t_0 v_j \) > 1 + c$ for all sufficiently large $j$.
  For a convex function $r mapsto N \( u + r v_j \)$ with value one at zero,
    a lower bound greater than one at $t_0$ persists for $r gt.eq t_0$.
    Apply this with $r = N \( e_(s^frown j) \) \/ N \( p_s \) gt.eq
    a \/ \( sqrt(2) b \)$ to obtain $N \( p_(s^frown j) \) gt.eq \( 1 + c \) N \( p_s \)$.
    Choosing successors for $n$ steps gives $b gt.eq \( 1 + c \)^n a \/ sqrt(2)$,
    impossible for arbitrarily large $n$. The asymptotic modulus is nonnegative:
    for each unit center one may restrict to the kernel of a norming functional. It is therefore zero. ◻
]

=== 7.2 What is lost by averaging and restricting <what-is-lost-by-averaging-and-restricting>

Fix a finite ancestral head $A$, write $P = P_A$, $Q = Q_A$, and suppose $P x = x$. Choose representations

$ x plus.minus y = h^plus.minus + J lambda^plus.minus . $

We will always choose finite total squared cost, as allowed by (60). Put

$ macron(h) = 1 / 2 \( h^(+) + h^(-) \) \, quad tilde(h) = 1 / 2 \( h^(+) - h^(-) \) \, quad sigma = 1 /
  2 \( lambda^(+) + lambda^(-) \) \, quad tau = 1 / 2 \( lambda^(+) - lambda^(-) \) \, $

and, in each component, put

$ M_n = 1 / 2 \( parallel lambda_n^(+) parallel_1 + parallel lambda_n^(-) parallel_1 \) \, wide
  nu_n = \( R_A sigma \)_n \, wide q_n = parallel nu_n parallel_1 \, wide d_n = M_n - q_n . $

Thus $x = P macron(h) + J nu$ and $d_n gt.eq 0$. To separate the two sources of this loss,
  view $m_n = \( \| lambda_n^(+) \| + \| lambda_n^(-) \| \) \/
  2$ as a nonnegative endpoint measure and $sigma_n$ as a signed endpoint measure.
  Let $C_r = { t : r \( t \) = r }$ for $r in A_n union { perp }$. Absolute convergence gives

$ d_n = sum_(r in A_n) #scale(x: 120%, y: 120%)[\(] m_n \( C_r \) - \| sigma_n \( C_r \) \|
  #scale(x: 120%, y: 120%)[\)] + m_n \( C_perp \) . $

Each term is nonnegative. The first sum records cancellation during averaging and folding within retained fibres;
  the last term records the mass discarded when the head is empty in that component.

#thm([Lemma 7.4.])[
  #emph[Let
$ C = 1 /
  2
  sum_(epsilon.alt in { + \, - }) \( parallel h^epsilon.alt parallel_H^2 + parallel lambda^epsilon.alt
  parallel_L^2 \) \, wide E = C - parallel x parallel_(upright(q))^2 . $

 Then
#[#set math.equation(numbering: n => "(61)")
 $ parallel Q macron(h) parallel_H^2 + parallel tilde(h) parallel_H^2 + sum_n \( M_n^2 - q_n^2 \) & lt.eq E \,\
1 / 2 \( parallel Q h^(+) parallel_H^2 + parallel Q h^(-) parallel_H^2 \) + sum_n d_n^2 & lt.eq E . $ <qp:energy-mean>]

]
] <qp:energy>

#proof[
  The Hilbert parallelogram identity and the scalar square inequality give $C gt.eq
    parallel macron(h) parallel_H^2 + parallel tilde(h) parallel_H^2 + sum_n M_n^2$.
    On the other hand the displayed representation of $x$ has squared cost $parallel P macron(h) parallel_H^2 +
    sum_n q_n^2 gt.eq parallel x parallel_(upright(q))^2$. Subtract, using the orthogonal decomposition in $H$,
    to prove (61). Now $M_n^2 - q_n^2 gt.eq \( M_n - q_n \)^2$ and
  $ 1 / 2 \( parallel Q h^(+) parallel_H^2 + parallel Q h^(-) parallel_H^2 \) =
    parallel Q macron(h) parallel_H^2 + parallel Q tilde(h) parallel_H^2 . $
  These identities imply (61). ◻
]

To convert this loss into a bound for the vector tail, we need an elementary representation of a positive array on
  the outside forest. Its importance is that the bound is independent of the height and allows countably many children.

#thm([Lemma 7.5.])[
  (Stopped flows).  #emph[Let $O = T_n \\ A_n$, let $cal(R)$ be the roots of its connected subtrees,
    and suppose $V : O arrow.r \[ 0 \, oo \)$ satisfies
$ V \( t \) gt.eq sum_(c upright(" child of ") t) V \( c \) \, wide B := sum_(c in cal(R)) V \( c \) < oo . $

 For any signs $epsilon_t$ constant on each connected subtree of $O$, the vector $epsilon_t V \( t \)$ on $O$,
   extended by zero on $A_n$, has norm at most $2 B$ in $Z_n$.
   The pointwise minimum of two arrays satisfying the child inequality also satisfies it.]
] <qp:flow>

#proof[
  Set $alpha_t = V \( t \) - sum_(c upright(" child of ") t) V \( c \) gt.eq 0$.
    Induction from the last level, using nonnegative sums, gives $V \( t \) =
    sum_(s succ.curly.eq t) alpha_s$ and $sum_(t in O) alpha_t = B$.
    This induction is over the finite height, not over a finite set of children. Hence the required vector is
  $ sum_(t in O) epsilon_t alpha_t \( p_t - p_(r \( t \)) \) . $
  The series is absolutely convergent in $Z_n$ by Lemma 22 and has norm at most $2 B$.
    Continuity of the coordinates identifies its sum with the stated array. Finally
  $ sum_c min \( V \( c \) \, W \( c \) \) lt.eq min #scale(x: 180%, y: 180%)[\(] sum_c V \( c \) \,
    sum_c W \( c \) #scale(x: 180%, y: 180%)[\)] lt.eq min \( V \( t \) \, W \( t \) \) \, $
  which proves the assertion about minima. ◻
]

=== 7.3 Clipping one endpoint against the minority mass <clipping-one-endpoint-against-the-minority-mass>

#thm([Theorem 7.6.])[
  #emph[Let $A$ be a finite ancestral head in $X_(upright(q))$ and let $P_A x = x$.
    For every $y in X_(upright(q))$ and $R gt.eq 0$,
#[#set math.equation(numbering: n => "(62)")
 $ parallel x + y parallel_(upright(q)) \, med parallel x - y parallel_(upright(q)) lt.eq R quad
   arrow.r.double quad parallel Q_A y parallel_(upright(q)) lt.eq
   8 sqrt(R^2 - parallel x parallel_(upright(q))^2) . $ <qp:tail-eight>]

 The displacement $y$ need not vanish on the head.]
] <thm:quadratic-tail>

#proof[
  Convexity gives $parallel x parallel_(upright(q)) lt.eq R$, so the right side is defined.
    The case $R = 0$ is immediate. Choose the representations above with each squared cost at most $R^2 + eta$,
    where $eta > 0$. Then $E lt.eq D := R^2 + eta - parallel x parallel_(upright(q))^2$.
  Fix a component. For every fiber of $r \( t \)$ choose its majority sign $epsilon_r$ among the coefficients of
    both labeled arrays $lambda^(+) \, lambda^(-)$. If the positive and negative masses in a nondiscarded fiber
    are $a_r \, b_r$, its contribution to $d_n$ is $min \( a_r \, b_r \)$;
    for a discarded fiber its contribution is $\( a_r + b_r \) \/ 2 gt.eq min \( a_r \, b_r \)$.
    Thus the total minority mass over the two arrays is at most $d_n$.
  Outside $A_n$, each descendant has the same $r \( t \)$ as its ancestor.
    For $epsilon.alt in { + \, - }$ define the majority and minority occupancies
  $ U^epsilon.alt \( t \) = sum_(s succ.curly.eq t) \( epsilon_(r \( s \)) lambda_n^epsilon.alt \( s \) \)_(+) \,
    wide V^epsilon.alt \( t \) =
    sum_(s succ.curly.eq t) \( - epsilon_(r \( s \)) lambda_n^epsilon.alt \( s \) \)_(+) \, wide V = V^(+) + V^(-) . $
  Here $a_(+) = max \( a \, 0 \)$. All these arrays satisfy the child inequality of Lemma 25,
    and the total initial mass of $V$ is at most $d_n$. Since $x$ vanishes outside the head,
  $ epsilon_(r \( t \)) \( U^(+) \( t \) + U^(-) \( t \) - V \( t \) \) = - h_n^(+) \( t \) - h_n^(-) \( t \) . $
  Let $S \( t \) = min \( U^(+) \( t \) \, V \( t \) \)$. It is a stopped flow with initial mass at most $d_n$, and
  $ 0 lt.eq U^(+) \( t \) - S \( t \) lt.eq \( U^(+) \( t \) + U^(-) \( t \) - V \( t \) \)_(+) lt.eq \|
    h_n^(+) \( t \) + h_n^(-) \( t \) \| . $
  Consequently the tail of $y_n$, which agrees with that of $x_n + y_n$, is the sum of the signed flows $S \, -
    V^(+)$ and the Hilbert vector $h_n^(+) + epsilon_r \( U^(+) - S \)$, all restricted to the outside. Lemma 25 gives
  $ \| Q_A y_n \|_n lt.eq 4 d_n + parallel Q_A h_n^(+) parallel_2 + parallel Q_A \( h_n^(+) + h_n^(-) \) parallel_2 . $
  Take the outer Euclidean norm and use (61). The three terms are at most $4 sqrt(D)$, $sqrt(2 D)$,
    and $2 sqrt(D)$, respectively. Thus $parallel Q_A y parallel_(upright(q)) lt.eq \( 6 + sqrt(2) \) sqrt(D)
    lt.eq 8 sqrt(D)$. Let $eta arrow.b 0$. No minimizing representation was assumed. ◻
]

The next corollary quantifies the symmetric-lens geometry in the characterization of AMUC by Dilworth et
  al. #cite(label("DKRRZ2016")) Theorem 2.1.

#thm([Corollary 7.7.])[
  #emph[If $x in X_(upright(q))$ and an infinite sequence $\( y_j \)$ satisfies $parallel x plus.minus y_j
    parallel_(upright(q)) lt.eq R$ and $parallel y_i - y_j parallel_(upright(q)) gt.eq
    epsilon > 0$ for $i eq.not j$, then
$ parallel x parallel_(upright(q))^2 + epsilon^2 / 256 lt.eq R^2 . $

]
] <qp:lens-eight>

#proof[
  Approximate $x$ within $rho > 0$ by $x_0$ supported in a finite ancestral head $A$.
    Theorem 26 bounds each $Q_A y_j$ by $8 sqrt(\( R + rho \)^2 - parallel x_0 parallel_(upright(q))^2)$.
    The sequence $\( y_j \)$ is bounded, and $P_A$ has finite rank,
    so two distinct head projections can be arbitrarily close.
    Their difference and the two tail bounds give $epsilon lt.eq
    16 sqrt(\( R + rho \)^2 - parallel x_0 parallel_(upright(q))^2)$. Let $rho arrow.b 0$. ◻
]

The arbitrary-tail estimate controls the complement of a head without requiring the displacement to vanish on the
  head. The remaining arguments organize the same cancellation budget for other purposes:
  symmetric clipping keeps the average of the two squared endpoint norms;
  stopping and majority pruning retain different parts of the signed mass;
  and a componentwise passage produces a finite-codimensional midpoint estimate.

=== 7.4 A symmetric clipping estimate <a-symmetric-clipping-estimate>

The proof clips both endpoint arrays while keeping the two Hilbert variables separate.

#thm([Proposition 7.8.])[
  #emph[For a finite ancestral head $A$, $P_A x = x$, and $P_A y = 0$,
#[#set math.equation(numbering: n => "(63)")
 $ parallel x parallel_(upright(q))^2 + frac(parallel y parallel_(upright(q))^2, 144) lt.eq
   frac(parallel x + y parallel_(upright(q))^2 + parallel x - y parallel_(upright(q))^2, 2) . $ <qp:symmetric-144>]

]
] <qp:symmetric-twelve>

#proof[
  It suffices to prove the assertion in one component, since the result can then be summed.
    Choose endpoint representations whose squared costs exceed $\| x plus.minus y \|_n^2$ by at most $eta > 0$,
    and use the notation of Lemma 24, omitting the component index.
    Put $E = \( \| x + y \|_n^2 + \| x - y \|_n^2 \) \/ 2 + eta - \| x \|_n^2$. Then
  $ parallel Q macron(h) parallel_2^2 + parallel tilde(h) parallel_2^2 + M^2 - q^2 lt.eq E . $
  Orient each nondiscarded fiber by the sign of its folded mean coefficient $nu_(r \( t \))$, choosing $+
    1$ when it is zero, and choose either sign in ${ - 1 \, 1 }$ on a discarded fiber.
    Define half-weighted positive and negative endpoint masses by
  $ alpha_t^epsilon.alt = 1 / 2 \( epsilon_(r \( t \)) lambda_t^epsilon.alt \)_(+) \, wide beta_t^epsilon.alt =
    1 / 2 \( - epsilon_(r \( t \)) lambda_t^epsilon.alt \)_(+) \, quad epsilon.alt in { + \, - } . $
  Let $beta = beta^(+) + beta^(-)$. In a nondiscarded fiber the positive mass minus negative mass is the absolute
    folded coefficient. The discarded fiber contributes zero to $q$.
    It follows that $parallel beta parallel_1 lt.eq M - q lt.eq sqrt(E)$.
  For $t in.not A_n$ put $A^epsilon.alt \( t \) = sum_(s succ.curly.eq t)
    alpha_s^epsilon.alt$ and $B^epsilon.alt \( t \) = sum_(s succ.curly.eq t) beta_s^epsilon.alt$,
    and let $A_(upright("tot")) = A^(+) + A^(-)$, $B_(upright("tot")) = B^(+) + B^(-)$. The endpoint identities give
  $ 0 = macron(h) \( t \) + epsilon_(r \( t \)) \( A_(upright("tot")) \( t \) - B_(upright("tot")) \( t \) \) \,
    wide y \( t \) = tilde(h) \( t \) +
    epsilon_(r \( t \)) \( A^(+) \( t \) - A^(-) \( t \) - B^(+) \( t \) + B^(-) \( t \) \) . $
  For each sign put $S^epsilon.alt = min \( A^epsilon.alt \, B_(upright("tot")) \)$ and $V^epsilon.alt =
    A^epsilon.alt - S^epsilon.alt$. Then $0 lt.eq V^epsilon.alt
    lt.eq \( A_(upright("tot")) - B_(upright("tot")) \)_(+) lt.eq \| macron(h) \|$ outside the head.
    Each $S^epsilon.alt$ is a stopped flow of initial mass at most $parallel beta parallel_1$,
    and the same bound applies to each $B^epsilon.alt$. Lemma 25 estimates their four signed vectors by $8
    parallel beta parallel_1$ in total. The remaining terms have Hilbert norm at most $parallel Q tilde(h)
    parallel_2 + 2 parallel Q macron(h) parallel_2$. Since $y$ vanishes on the head,
  $ \| y \|_n lt.eq parallel Q tilde(h) parallel_2 + 2 parallel Q macron(h) parallel_2 +
    8 parallel beta parallel_1 lt.eq 12 sqrt(E) . $
  Let $eta arrow.b 0$, and sum the resulting component inequalities. Empty heads cause no exception:
    their entire mass is in the discarded fiber, and the same bounds hold. ◻
]

#thm([Corollary 7.9.])[
  #emph[If $parallel x plus.minus y_j parallel_(upright(q)) lt.eq r$ and $parallel y_i -
    y_j parallel_(upright(q)) gt.eq 2 d > 0$ for $i eq.not j$ in an infinite sequence, then
$ parallel x parallel_(upright(q))^2 + d^2 \/ 144 lt.eq r^2 . $

]
] <qp:lens-twelve>

#proof[
  Choose $x_0$ of finite node support with $parallel x - x_0 parallel_(upright(q)) < epsilon.alt$,
    and a finite ancestral head $A$ supporting it. Finite rank and boundedness give distinct $i \,
    j$ with $parallel P_A z parallel_(upright(q)) < epsilon.alt$ for $z = \( y_i - y_j \) \/ 2$.
    Convexity gives $parallel x plus.minus z parallel_(upright(q)) lt.eq r$,
    while $parallel z parallel_(upright(q)) gt.eq d$. Apply (63) to $x_0 \, Q_A z$.
    These vectors have endpoint norms at most $r + 2 epsilon.alt$, and $parallel Q_A z parallel_(upright(q)) gt.eq
    d - epsilon.alt$. Let $epsilon.alt arrow.b 0$. ◻
]

=== 7.5 Stopping where signed mass cancels <stopping-where-signed-mass-cancels>

Instead of orienting the coefficients, one can stop where their signed sum is less than half of their absolute
  mass. The discarded subtrees are disjoint, so their total mass is paid for by the same loss $d_n$.
  This gives a smaller numerical constant by a different decomposition.

#thm([Proposition 7.10.])[
  #emph[Under the hypotheses of Theorem 26,
$ parallel Q_A y parallel_(upright(q)) lt.eq 7 sqrt(R^2 - parallel x parallel_(upright(q))^2) . $

]
] <qp:tail-seven>

#proof[
  Choose the endpoint representations with squared costs at most $\( R + eta \)^2$.
    In the notation preceding Lemma 24 define the nonnegative endpoint measure
    $m_n = \( \| lambda_n^(+) \| + \| lambda_n^(-) \| \) \/ 2$.
    Both $\| sigma_n \|$ and $\| tau_n \|$ are bounded pointwise by $m_n$, and $parallel m_n parallel_1 = M_n$.
    The lemma gives
  #[#set math.equation(numbering: n => "(64)")
   $ parallel Q macron(h) parallel_H^2 + parallel tilde(h) parallel_H^2 + sum_n d_n^2 lt.eq \( R + eta \)^2 -
     parallel x parallel_(upright(q))^2 = : E . $ <qp:seven-energy>]
  Write $S_t = { s : s succ.curly.eq t }$ for a descendant set.
    Mark a node $t in.not A_n$ when $\| sigma_n \( S_t \) \| < m_n \( S_t \) \/ 2$,
    and retain only the first marked nodes on each path outside the head.
    Every marked node has such a first ancestor, since it has finitely many ancestors.
    The retained descendant sets are pairwise disjoint.
  Each retained set lies in a single fiber of $r$. If disjoint subsets $S_j$ lie in a nondiscarded fiber $C$, then
  $ sum_j #scale(x: 120%, y: 120%)[\(] m_n \( S_j \) - \| sigma_n \( S_j \) \| #scale(x: 120%, y: 120%)[\)] lt.eq
    m_n \( C \) - \| sigma_n \( C \) \| . $
  Indeed $\| sigma_n \( C \) \|$ is at most the sum of the displayed absolute sums plus the $m_n$-mass of the
    remaining set. This argument also holds for countably many subsets by absolute convergence.
    Discarded fibers are bounded by their whole $m_n$-mass. Summing over fibers yields
  $ sum_(t upright(" first marked")) #scale(x: 120%, y: 120%)[\(] m_n \( S_t \) - \| sigma_n \( S_t \) \|
    #scale(x: 120%, y: 120%)[\)] lt.eq d_n \, wide sum_(t upright(" first marked")) m_n \( S_t \) lt.eq 2 d_n . $
  Split $tau_n = tau_n^(upright(r)) + tau_n^(upright(k))$ by restricting the first part to the union of these
    descendant sets. Then $parallel tau_n^(upright(r)) parallel_1 lt.eq 2 d_n$ and
  $ parallel Q J tau^(upright(r)) parallel_(upright(q)) lt.eq
    4 #scale(x: 180%, y: 180%)[\(] sum_n d_n^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $
  If an outside node has a first marked ancestor, the occupancy of $tau_n^(upright(k))$ there is zero.
    Otherwise it is unmarked, and
  $ \| \( J_n tau_n^(upright(k)) \) \( t \) \| lt.eq m_n \( S_t \) lt.eq 2 \| sigma_n \( S_t \) \| =
    2 \| macron(h)_n \( t \) \| . $
  The last equality uses $Q x = 0$ in $x = macron(h) + J sigma$.
    Thus $Q J tau^(upright(k)) in H$ and has Hilbert norm at most $2 parallel Q macron(h) parallel_H$.
    Since $y = tilde(h) + J tau$,
  $ parallel Q y parallel_(upright(q)) lt.eq parallel Q tilde(h) parallel_H + 2 parallel Q macron(h) parallel_H +
    4 #scale(x: 180%, y: 180%)[\(] sum_n d_n^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq 7 sqrt(E) . $
  Let $eta arrow.b 0$. ◻
]

#thm([Corollary 7.11.])[
  #emph[For $0 < c lt.eq 1$ put $delta = c^2 \/ 2000$. If $parallel x plus.minus y_j parallel_(upright(q)) lt.eq
    1$ and $parallel y_i - y_j parallel_(upright(q)) gt.eq 2 c$ for all distinct indices of an infinite sequence,
    then $parallel x parallel_(upright(q)) lt.eq 1 - delta$.]
] <qp:lens-seven>

#proof[
  If $parallel x parallel_(upright(q)) > 1 - delta$, choose a finite-support $x_0$ within $delta$ of $x$,
    and an ancestral head $A$ for $x_0$. Then $parallel x_0 parallel_(upright(q)) > 1 -
    2 delta$ and $parallel x_0 plus.minus y_j parallel_(upright(q)) lt.eq 1 + delta$. Proposition 30 gives
  $ parallel Q_A y_j parallel_(upright(q)) < 7 sqrt(\( 1 + delta \)^2 - \( 1 - 2 delta \)^2) lt.eq
    7 sqrt(6 delta) < c \/ 2 . $
  Two bounded head projections are less than $c$ apart, contradicting the assumed separation of the full vectors. ◻
]

=== 7.6 Pruning by a majority sign <pruning-by-a-majority-sign>

This argument tracks the labeled majority terms before cancellation in the half-difference.
  It keeps those terms until their occupancy is comparable with the minority occupancy,
  separating removed mass from a remaining occupancy bounded in Hilbert norm.
  This decomposition will also be used after approximating an arbitrary center.

#thm([Proposition 7.12.])[
  #emph[Under the hypotheses of Theorem 26,
$ parallel Q_A y parallel_(upright(q)) lt.eq 9 sqrt(R^2 - parallel x parallel_(upright(q))^2) . $

]
] <qp:tail-nine>

#proof[
  Use representations with squared costs at most $R^2 + eta$ and write $E = R^2 + eta -
    parallel x parallel_(upright(q))^2$. In each nondiscarded fiber $C_r$,
    orient the coefficients by the sign of the folded coefficient $nu_n \( r \)$, choosing $+ 1$ when it is zero;
    use either sign in ${ - 1 \, 1 }$ in a discarded fiber. Let $g_n \,
    b_n$ be half the total absolute masses of coefficients agreeing and disagreeing with this sign, respectively,
    counting both labeled endpoint representations. Then $parallel b_n parallel_1 lt.eq d_n$.
    More precisely, if $A_n eq.not diameter$, all nodes have an ancestor in $A_n$ and $2 parallel b_n parallel_1 =
    d_n$; when $A_n = diameter$, simply $d_n = M_n$.
  On the outside put $G \( t \) = g_n \( S_t \)$ and $B \( t \) = b_n \( S_t \)$.
    Constancy of the orientation along each outside subtree gives
  $ \| \( J_n sigma_n \) \( t \) \| = \| G \( t \) - B \( t \) \| = \| macron(h)_n \( t \) \| . $
  In the labeled half-difference $tau_n = \( lambda_n^(+) - lambda_n^(-) \) \/ 2$,
    remove every minority term and every majority term whose endpoint has an outside ancestor $t$ with $G \( t \)
    lt.eq 2 B \( t \)$. Denote the removed and kept arrays by $tau_n^(upright(r)) \, tau_n^(upright(k))$.
    The first such stopping nodes have disjoint descendant sets.
    The removed majority mass is at most $2 parallel b_n parallel_1$;
    hence $parallel tau_n^(upright(r)) parallel_1 lt.eq 3 d_n$.
    This accounting is on the labeled endpoint terms, before any cancellation in their half-difference,
    so it bounds that difference as well.
  At a node having a stopping ancestor the kept occupancy vanishes.
    At every other outside node, $G \( t \) > 2 B \( t \)$ and
  $ \| \( J_n tau_n^(upright(k)) \) \( t \) \| lt.eq G \( t \) lt.eq 2 \| G \( t \) - B \( t \) \| =
    2 \| macron(h)_n \( t \) \| . $
  Therefore
  $ \| Q y_n \|_n lt.eq parallel Q tilde(h)_n parallel_2 + 2 parallel Q macron(h)_n parallel_2 + 6 d_n . $
  Lemma 24 and the triangle inequality in the outer Euclidean sum give $parallel Q y parallel_(upright(q)) lt.eq
    9 sqrt(E)$. Let $eta arrow.b 0$. ◻
]

#thm([Corollary 7.13.])[
  #emph[For every $rho > 0$, choose $0 < gamma < 1 \/ 2$ such that
$ 9 sqrt(\( 1 + gamma \)^2 - \( 1 - 2 gamma \)^2) < rho \/ 3 . $

 If $parallel x parallel_(upright(q)) gt.eq 1 - gamma$, its symmetric lens ${ y :
   parallel x plus.minus y parallel_(upright(q)) lt.eq 1 }$ has no infinite $rho$-separated subset.]
] <qp:lens-nine>

#proof[
  Approximate $x$ within $gamma$ by a finite-support $x_0$, and choose a finite ancestral head for it.
    The tail of every point in the lens has norm less than $rho \/ 3$ by Proposition 32.
    The points in the lens have norm at most one, so in an infinite sequence two head projections are less than
    $rho \/ 3$ apart. Their full distance is less than $rho$. ◻
]

The next formulation chooses one head from a nonzero center and a relative endpoint excess before any displacement
  is supplied. It therefore controls every admissible displacement at that center with the same head.
  This is the form needed when several displacements are compared with one center.

#thm([Proposition 7.14.])[
  #emph[For every nonzero $x in X_(upright(q))$ and $0 < delta lt.eq 1$ there is a finite ancestral head $A$,
    depending only on $x \, delta$, such that for every $u in X_(upright(q))$,
$ parallel x + u parallel_(upright(q)) \, med parallel x -
  u parallel_(upright(q)) lt.eq \( 1 + delta \) parallel x parallel_(upright(q)) quad arrow.r.double quad
  parallel Q_A u parallel_(upright(q)) lt.eq 72 sqrt(delta) thin parallel x parallel_(upright(q)) . $

]
] <qp:relative-seventytwo>

#proof[
  Scale to $parallel x parallel_(upright(q)) = 1$. Choose $x_0$ of finite node support with $parallel x -
    x_0 parallel_(upright(q)) lt.eq delta$ and an ancestral head $A$ containing its support.
    Then $parallel x_0 plus.minus u parallel_(upright(q)) lt.eq 1 + 2 delta$.
    Choose representations $x_0 plus.minus u = h^plus.minus +
    J lambda^plus.minus$ with each squared cost at most $\( 1 + 3 delta \)^2$.
    Using the notation above for these representations, let $C$ be their average squared cost and set
  $ cal(D) = C - (parallel P macron(h) parallel_H^2 + sum_n q_n^2) . $
  The parallelogram identity and the scalar square inequality used in Lemma 24 give,
    before comparing the center representation with its norm,
  $ parallel Q macron(h) parallel_H^2 + parallel tilde(h) parallel_H^2 + sum_n \( M_n^2 - q_n^2 \) & lt.eq cal(D) \,\
1 / 2 \( parallel Q h^(+) parallel_H^2 + parallel Q h^(-) parallel_H^2 \) + sum_n d_n^2 & lt.eq cal(D) . $
  The second inequality uses $M_n^2 - q_n^2 gt.eq d_n^2$ and the parallelogram identity for $Q h^plus.minus$.
    The center representation has cost at least $parallel x_0 parallel_(upright(q))$, so
  #[#set math.equation(numbering: n => "(65)")
   $ 0 lt.eq cal(D) lt.eq \( 1 + 3 delta \)^2 - parallel x_0 parallel_(upright(q))^2
     lt.eq \( 1 + 3 delta \)^2 - \( 1 - delta \)^2 lt.eq 16 delta . $ <qp:seventytwo-energy>]
  Orient each nondiscarded fiber $C_r$ by the sign of $nu_n \( r \)$, using $+
    1$ for a zero folded coefficient or a discarded fiber. This time use the full, rather than half,
    outside absolute masses: let $p_n^plus.minus$ agree with the orientation and $b_n^plus.minus$ disagree with
    it, and put $B_n = parallel b_n^(+) + b_n^(-) parallel_1$.
    The outside minority mass is at most the total cancellation bound, giving $B_n lt.eq 2 d_n$ and
  #[#set math.equation(numbering: n => "(66)")
   $ sum_n B_n^2 lt.eq 4 cal(D) . $ <qp:outside-bad>]
  For outside nodes let $G \( t \) = \( p_n^(+) + p_n^(-) \) \( S_t \)$ and
    $V \( t \) = \( b_n^(+) + b_n^(-) \) \( S_t \)$. Since the averaged represented vector vanishes there,
  $ \| G \( t \) - V \( t \) \| = \| h_n^(+) \( t \) + h_n^(-) \( t \) \| . $
  Stop at the first outside nodes satisfying $G \( t \) > 0$ and $V \( t \) gt.eq G \( t \) \/ 2$.
    Their descendant sets are disjoint, and the total majority mass in them is at most $2 B_n$.
    Remove all these majority terms and all minority terms from the outside part of $lambda_n^(+)$;
    denote what remains by $lambda_n^(upright(k))$ and what was removed by $lambda_n^(upright(r))$.
    Then $parallel lambda_n^(upright(r)) parallel_1 lt.eq 3 B_n$ and, by (66),
  $ parallel lambda^(upright(r)) parallel_L lt.eq 6 sqrt(cal(D)) \, wide
    parallel Q J lambda^(upright(r)) parallel_(upright(q)) lt.eq 12 sqrt(cal(D)) . $
  Every outside node either has a stopping ancestor, has $G \( t \) = 0$,
    or satisfies $V \( t \) < G \( t \) \/ 2$. In all cases the kept occupancy is at most $2 \| G \( t \) -
    V \( t \) \|$ in absolute value. Thus
  $ parallel Q J lambda^(upright(k)) parallel_H lt.eq 2 parallel Q \( h^(+) + h^(-) \) parallel_H lt.eq
    4 sqrt(cal(D)) . $
  The atomic terms whose endpoints belong to $A$ have zero tail.
    The representation of $x_0 + u$, together with $parallel Q h^(+) parallel_H lt.eq sqrt(2 cal(D))$, now gives
  $ parallel Q u parallel_(upright(q)) lt.eq \( 12 + 4 + sqrt(2) \) sqrt(cal(D)) lt.eq 18 sqrt(cal(D)) lt.eq
    72 sqrt(delta) . $
  All stopping decisions use a first ancestor, so infinite coefficient support and countably many children cause
    no change. The choice of $A$ preceded the choice of $u$, as required. ◻
]

=== 7.7 From a component estimate to the Hilbert sum <qp:rec:section>

We now obtain a finite-codimensional midpoint estimate from normalized component bounds.
  The proof applies a local lens estimate on components with controlled relative endpoint excess and estimates the
  remaining components by their contribution to the total squared excess.

#thm([Lemma 7.15.])[
  (Component estimate).  #emph[Let $A subset T_n$ be a finite nonempty ancestral head, with $P_A x = x$, $P_A y =
    0$, and $\| x \|_n = 1$. If $0 lt.eq e lt.eq 1$ and $\| x plus.minus y \|_n lt.eq 1 + e$, then
#[#set math.equation(numbering: n => "(67)")
 $ \| y \|_n lt.eq \( 6 + sqrt(2) \) sqrt(\( 1 + e \)^2 - 1) lt.eq 13 sqrt(e) . $ <qp:rec:component-bound>]

]
] <qp:rec:component>

#proof[
  Apply the proof of Theorem 26 in this single component, retaining the coefficient $6 +
    sqrt(2)$ before its final rounding to $8$. Here $Q_A y = y$.
    Explicitly, approximate endpoint representations of cost below $1 + e +
    epsilon$ give $kappa = \( 1 + e + epsilon \)^2 - 1$, Hilbert tails at most $sqrt(2 kappa)$,
    combined Hilbert tail at most $2 sqrt(kappa)$, and folded-mass loss at most $sqrt(kappa)$ by Lemma 24.
    Because the head contains the root, no fiber is discarded:
    the combined minority mass is exactly this folded-mass loss.
    Grouping by the common truncated endpoint and clipping one majority occupancy against the combined minority
    occupancy gives two signed stopped flows of norm at most $2 sqrt(kappa)$ each, by Lemma 25.
    The remaining majority occupancy is bounded in Hilbert norm by $2 sqrt(kappa)$.
    Adding the original Hilbert tail gives $\( 6 + sqrt(2) \) sqrt(kappa)$.
    These are the same decomposition and signed path representations used in that theorem,
    so no invariance of $\| dot.op \|_n$ under arbitrary coordinate sign changes is needed.
    Let $epsilon arrow.b 0$. Finally $\( 1 + e \)^2 - 1 lt.eq 3 e$ and $3 \( 6 + sqrt(2) \)^2 = 114 +
    36 sqrt(2) < 169$. ◻
]

The component estimate controls a lens after normalization by the center norm.
  In a Hilbert sum that norm can be very small or zero. The next argument separates the components carrying a
  large relative endpoint excess before making any such division.

#thm([Proposition 7.16.])[
  (Finite centers in the Hilbert sum).  #emph[Let $x in X_(upright(q))$ be a unit vector with finite coordinate
    support. For each $n$ with $x_n eq.not 0$, choose a finite nonempty ancestor-closed $A_n subset
    T_n$ containing its support, and set
$ Y_x = { y in X_(upright(q)) : P_(A_n) y_n = 0 upright(" whenever ") x_n eq.not 0 } . $

 Then $Y_x$ is a closed finite-codimensional subspace. If $0 < e lt.eq 1 \/ 8$, $y in Y_x$, and $parallel x +
   y parallel_(upright(q)) \, parallel x - y parallel_(upright(q)) lt.eq 1 + e$, then
#[#set math.equation(numbering: n => "(68)")
 $ parallel y parallel_(upright(q))^2 lt.eq 519 / 2 e^(1 \/ 3) \, wide parallel y parallel_(upright(q)) lt.eq
   17 e^(1 \/ 6) . $ <qp:rec:outer-bound>]

]
] <qp:rec:finite-center>

#proof[
  The conditions defining $Y_x$ involve only finitely many continuous coordinate functionals,
    so the assertion about codimension follows. Put
  $ a_n = \| x_n \|_n \, quad b_n = \| x_n + y_n \|_n \, quad c_n = \| x_n - y_n \|_n \, quad v_n =
    frac(b_n^2 + c_n^2, 2) \, quad d_n = v_n - a_n^2 . $
  The triangle inequality gives $a_n \, \| y_n \|_n lt.eq \( b_n + c_n \) \/ 2$. Therefore
  #[#set math.equation(numbering: n => "(69)")
   $ d_n gt.eq 0 \, wide \| y_n \|_n^2 lt.eq v_n \, wide sum_n a_n^2 = 1 \, wide sum_n d_n lt.eq \( 1 + e \)^2 -
     1 lt.eq 3 e . $ <qp:rec:outer-energy>]
  Fix $0 < eta lt.eq 1$. Write
  $ E_eta = { n : d_n > eta a_n^2 } . $
  On these components $v_n = a_n^2 + d_n lt.eq \( 1 + 1 \/ eta \) d_n$, and hence
  #[#set math.equation(numbering: n => "(70)")
   $ sum_(n in E_eta) \| y_n \|_n^2 lt.eq 3 e \( 1 + 1 \/ eta \) . $ <qp:rec:exceptional>]
  If $a_n = 0$ and $y_n eq.not 0$, then $d_n = v_n = \| y_n \|_n^2 > 0$, so $n in E_eta$.
    If both vectors vanish in that component, its contribution is zero.
    Thus every remaining nonzero contribution has $a_n > 0$.
  Now assume additionally that $eta lt.eq 1 \/ 4$. For $n in.not E_eta$ with $a_n > 0$,
    let $m_n = \( b_n + c_n \) \/ 2$. We have $m_n gt.eq a_n$ and
  $ m_n^2 + (frac(b_n - c_n, 2))^2 = v_n lt.eq \( 1 + eta \) a_n^2 . $
  It follows that
  $ frac(max \( b_n \, c_n \), a_n) lt.eq sqrt(1 + eta) + sqrt(eta) = 1 + delta_eta \, wide delta_eta :=
    sqrt(1 + eta) + sqrt(eta) - 1 lt.eq 3 / 2 sqrt(eta) lt.eq 1 . $
  Apply Lemma 35 to $x_n \/ a_n$ and $y_n \/ a_n$. Summing its squared estimate gives
  #[#set math.equation(numbering: n => "(71)")
   $ sum_(n in.not E_eta) \| y_n \|_n^2 lt.eq 169 delta_eta sum_(n in.not E_eta) a_n^2 lt.eq 507 /
     2 sqrt(eta) . $ <qp:rec:regular>]
  Take $eta = e^(2 \/ 3)$, which is at most $1 \/ 4$ when $e lt.eq 1 \/ 8$. Combining (70) and (71),
  $ parallel y parallel_(upright(q))^2 lt.eq 507 / 2 e^(1 \/ 3) + 3 e + 3 e^(1 \/ 3) lt.eq 519 / 2 e^(1 \/ 3) . $
  The second assertion follows from $519 \/ 2 < 17^2$. ◻
]

#thm([Corollary 7.17.])[
  (Completed centers).  #emph[For every $x in X_(upright(q))$ with $parallel x parallel_(upright(q)) =
    1$ and $0 < e lt.eq 1 \/ 16$, there is a closed finite-codimensional subspace $Y subset X_(upright(q))$ such that
#[#set math.equation(numbering: n => "(72)")
 $ y in Y \, quad parallel x + y parallel_(upright(q)) \, parallel x - y parallel_(upright(q)) lt.eq 1 + e quad
   arrow.r.double quad parallel y parallel_(upright(q)) lt.eq 17 \( 2 e \)^(1 \/ 6) . $ <qp:rec:complete-bound>]

 In particular, for every $t > 0$ there is an $e_t > 0$, independent of the unit center $x$,
   for which some closed finite-codimensional $Y$ satisfies
$ inf_(u in S_Y) max { parallel x + t u parallel_(upright(q)) \, parallel x - t u parallel_(upright(q)) } gt.eq
  1 + e_t . $

 Here $S_Y = { u in Y : parallel u parallel_(upright(q)) = 1 }$.
   Thus the maximum asymptotic midpoint modulus is positive at every positive radius.]
] <qp:rec:all-centers>

#proof[
  By finite-coordinate density, choose a finitely supported unit vector $x^0$ with $parallel x -
    x^0 parallel_(upright(q)) < e$. Such unit vectors are dense:
    approximate $x$ by a nonzero finitely supported vector and normalize it.
    Use the finite coordinate exclusions for $x^0$ from Proposition 36. If $y$ satisfies the hypotheses of (72), then
  $ parallel x^0 + y parallel_(upright(q)) \, parallel x^0 - y parallel_(upright(q)) lt.eq 1 + 2 e . $
  Since $2 e lt.eq 1 \/ 8$, Proposition 36 proves (72). Given $t > 0$, choose $0 < e_t lt.eq
    1 \/ 16$ with $17 \( 2 e_t \)^(1 \/ 6) < t$. For $u in S_Y$,
    both endpoint norms at $t u$ cannot be at most $1 + e_t$, by (72).
    Each corresponding maximum is therefore greater than $1 + e_t$, giving the displayed infimum bound. ◻
]

== 8 Charging segments at their starting nodes <sm:s:section>

We now allow an atom to start at any node of a tree. Its cost depends on where it starts:
  masses on one branch add, whereas masses entering distinct child subtrees combine in Euclidean norm.
  The resulting quotient norm has a squared midpoint estimate.
  The proof matches opposite signed segments at their first node outside a finite head and charges the discarded
  part to the later of their two starting nodes.

=== 8.1 The cost and the completed space <the-cost-and-the-completed-space>

For each integer $n gt.eq 1$, let $cal(T)_n = bb(N)^(lt.eq n)$, including its root $diameter$.
  Give nodes their component label, so the trees are disjoint.
  Write $t prec.curly.eq v$ when $t$ is an initial segment of $v$, and $\[ t \, v \] = { s :
  t prec.curly.eq s prec.curly.eq v }$. All scalars in this section are real.
  For a nonnegative array $m$ on $cal(T)_n$, define, upwards from the leaves,

#[#set math.equation(numbering: n => "(73)")
 $ q_t \( m \) = m_t + #scale(x: 180%, y: 180%)[\(] sum_(s upright(" child of ") t) q_s \( m \)^2
   #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \, wide M_n \( m \) = q_diameter \( m \) . $ <sm:s:cost>]

Empty sums are zero; infinite values are allowed in this definition. On the disjoint union $cal(T)$ of the trees put

$ M \( m \) = #scale(x: 180%, y: 180%)[\(] sum_(n gt.eq 1) M_n \( m \|_(cal(T)_n) \)^2
  #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $

Thus $M_n$ is a cost for nonnegative start masses, before any vector norm has been defined.

#thm([Lemma 8.1.])[
  #emph[The costs are monotone, positively homogeneous and subadditive. On $cal(T)_n$ they satisfy
#[#set math.equation(numbering: n => "(74)")
 $ parallel m parallel_2 lt.eq M_n \( m \) lt.eq sum_(d = 0)^n parallel m \|_(bb(N)^d) parallel_2 lt.eq
   sqrt(n + 1) thin parallel m parallel_2 \, wide sum_(t prec.curly.eq v) m_t lt.eq
   M_n \( m \) . $ <sm:s:cost-comparisons>]

 For nonnegative forest arrays of finite total cost,
#[#set math.equation(numbering: n => "(75)")
 $ M \( m + r \)^2 gt.eq M \( m \)^2 + M \( r \)^2 . $ <sm:s:positive-energy>]

]
] <sm:s:cost-properties>

#proof[
  Monotonicity and homogeneity follow directly by induction through the levels.
    The same induction and the triangle inequality in $ell_2$ give subadditivity.
    Squaring (73) and discarding its nonnegative cross term proves the lower bound in (74).
    The $ell_2$ norm of the $q_t$ on level $d$ is at most the $ell_2$ norm of the $m_t$ on that level plus the
    $ell_2$ norm of the $q_s$ on level $d + 1$. Iterating gives the middle bound;
    Cauchy–Schwarz gives the last one. Keeping only the child on the path to $v$ at each step gives the path bound.
  For the energy inequality, induction proves $q_t \( m + r \)
    gt.eq \( q_t \( m \)^2 + q_t \( r \)^2 \)^(1 \/ 2)$. Indeed,
    let $A$ and $B$ be the $ell_2$ norms of the child values for $m$ and $r$. The induction hypothesis gives
  $ q_t \( m + r \) gt.eq m_t + r_t + sqrt(A^2 + B^2) gt.eq sqrt(m_t^2 + r_t^2) + sqrt(A^2 + B^2) gt.eq
    sqrt(\( m_t + A \)^2 + \( r_t + B \)^2) . $
  The last inequality is the triangle inequality in $bb(R)^2$. Summing its square over the roots proves (75).
    These arguments apply to countably many children: all sums are nonnegative,
    and the $ell_2$ inequalities hold for finite partial sums and then by monotone convergence.
    This also shows that each cost commutes with increasing limits of nonnegative arrays. ◻
]

A segment representation on $cal(T)_n$ is an array $a = \( a_(t v) \)_(t prec.curly.eq v)$ with start masses

$ m_t \( a \) = sum_(v succ.curly.eq t) \| a_(t v) \| quad upright("and") quad M_n \( m \( a \) \) < oo . $

Its output is

#[#set math.equation(numbering: n => "(76)")
 $ \( P a \)_s = sum_(t prec.curly.eq s) sum_(v succ.curly.eq s) a_(t v) . $ <sm:s:output>]

Each coefficient $a_(t v)$ contributes its value on the entire segment $\[ t \, v \]$.
  The sums at a fixed coordinate converge absolutely, by the path bound in (74).

#thm([Proposition 8.2.])[
  #emph[On $ell_2 \( cal(T)_n \)$ the formula
$ parallel x parallel_(S \, n) = inf { M_n \( m \( a \) \) : P a = x } $

 defines a complete reflexive norm, with
#[#set math.equation(numbering: n => "(77)")
 $ frac(parallel x parallel_2, n + 1) lt.eq parallel x parallel_(S \, n) lt.eq
   sqrt(n + 1) thin parallel x parallel_2 . $ <sm:s:norm-comparisons>]

 Consequently
$ X_S =
  #scale(x: 180%, y: 180%)[\(] xor.big_(n gt.eq 1) \( ell_2 \( cal(T)_n \) \, parallel dot.op parallel_(S \, n) \)
  #scale(x: 180%, y: 180%)[\)]_(ell_2) $

 is a reflexive Banach space. Write $parallel dot.op parallel_S$ for its norm.
   Equivalently, $parallel x parallel_S$ is the infimum of $M \( m \( a \) \)$ over all forest representations of
   $x$. Finite-support vectors are dense.]
] <sm:s:space>

#proof[
  First we bound the output of a representation. Fix an output level $d$ and a start level $h lt.eq d$.
    Segments starting at a single node $t$ of level $h$ contribute total absolute mass at most $m_t \( a \)$ to
    level $d$; starts at different nodes of level $h$ have disjoint descendants.
    Therefore the $ell_2$ norm of this part of the output is at most $parallel m \( a \) \|_(bb(N)^h) parallel_2$.
    Summing over $h lt.eq d$ bounds the norm on level $d$ by $sqrt(n + 1) thin M_n \( m \( a \) \)$.
    Summing the squares over $d$ gives
  #[#set math.equation(numbering: n => "(78)")
   $ parallel P a parallel_2 lt.eq \( n + 1 \) M_n \( m \( a \) \) . $ <sm:s:output-bound>]
  Conversely, the singleton representation $a_(t t) = x_t$ has cost at most $sqrt(n + 1) parallel x parallel_2$.
    This proves finiteness and the comparisons. Homogeneity is immediate.
    Adding representations and using monotonicity and subadditivity of the cost proves the triangle inequality;
    the lower comparison proves definiteness. The norm is equivalent to the Hilbert norm,
    and hence is complete and reflexive.
  The countable $ell_2$ sum is complete. Its dual is isometrically the $ell_2$ sum of the component duals:
    restriction of a functional gives the component functionals,
    finite collections of approximate norming vectors give the lower bound for their $ell_2$ norm,
    and Cauchy–Schwarz gives the reverse bound. Finite-component vectors are dense,
    so restrictions determine the functional. Applying this identification twice and using the reflexivity of
    every component proves reflexivity of $X_S$.
  A forest representation bounds each component norm by its component cost,
    and therefore bounds $parallel x parallel_S$ by its total cost.
    Conversely, for $eta > 0$ choose a representation in component $n$ with cost at most $parallel x \|_(cal(T)_n)
    parallel_(S \, n) + eta 2^(- n)$. Minkowski’s inequality makes its total cost less than $parallel x
    parallel_S + eta$. Finally, finite support is dense in each component by (77),
    and finite-component vectors are dense in the sum. ◻
]

We will keep separate entries on identical segments when convenient.
  More precisely, one may use a countable list of signed segment weights whose absolute start masses have finite
  cost. Combining entries on each segment only decreases the start masses and gives a representation in the
  preceding sense. Splitting a weight into pieces of the same sign preserves the masses.
  These observations allow the matching argument below without any assumption that an infimum is attained.

A subset of $cal(T)$ is #emph[ancestral] if it contains every ancestor of each of its nodes.

#thm([Lemma 8.3.])[
  #emph[For every node $v$ and $x in X_S$, $\| x_v \| lt.eq parallel x parallel_S$.
    The coordinate vector $e_v$ and every root-to-node path vector have norm one.
    If $C$ is a finite ancestral subset of $cal(T)$, then its coordinate projection $P_C$ is contractive and
    $parallel I - P_C parallel lt.eq 2$. For a nonterminal node $t$,
    the sequence of its child coordinate vectors is weakly null.]
] <sm:s:coordinates>

#proof[
  The absolute value of the output at $v$ is at most the sum of start masses on the ancestor path to $v$,
    which is bounded by $M \( m \( a \) \)$. Take the infimum over representations.
    A singleton or a root-to-node path has a representation of cost one,
    and its nonzero coordinate gives the matching lower bound.
  Restrict each representing segment to $C$. Since $C$ contains every ancestor of its nodes,
    this restriction is empty or a segment with the same start. The start masses cannot increase.
    Taking infima proves $parallel P_C x parallel_S lt.eq parallel x parallel_S$; the bound for $I -
    P_C$ follows by the triangle inequality. The child vectors lie in a fixed component and are weakly null there,
    because its norm is equivalent to the Hilbert norm. They remain weakly null under its inclusion in $X_S$. ◻
]

The unit path vectors in arbitrarily tall trees, together with their weakly null unit increments,
  satisfy the hypotheses of Lemma 3. Thus $X_S$ admits no equivalent asymptotically uniformly convex norm.
  More explicitly, if $alpha parallel x parallel_S lt.eq N \( x \) lt.eq
  beta parallel x parallel_S$ and the modulus of $N$ were positive at $t_0 = alpha \/ \( 2 beta \)$,
  the lemma would extend a path with a factor $1 + overline(delta)_N \( t_0 \) \/ 4$ at every step.
  Its $N$ norm would eventually exceed $beta$, although every such path has $parallel dot.op parallel_S$ norm one.

=== 8.2 A squared estimate across a finite cut <a-squared-estimate-across-a-finite-cut>

The next theorem is the geometric estimate supplied by this model.
  Unlike a root-path cost, the present cost records the starting node of each segment.
  Removing one of two opposite crossing segments saves the mass charged at its later start.
  The positive energy inequality then turns that saved mass into a squared gain.

#thm([Theorem 8.4.])[
  #emph[Let $C$ be a finite ancestral subset of $cal(T)$. If $p in X_S$ is supported in $C$ and $y in
    X_S$ satisfies $y \|_C = 0$, then
#[#set math.equation(numbering: n => "(79)")
 $ max { parallel p + y parallel_S \, parallel p - y parallel_S }^2 gt.eq parallel p parallel_S^2 +
   frac(parallel y parallel_S^2, 64) . $ <sm:s:tail>]

 The conclusion includes $C = diameter$, $p = 0$ and $y = 0$.]
] <thm:segment-start-tail>

#figure(
  [#grid(
    columns: (0.48fr, 0.48fr,),
    column-gutter: 4%,
    [
      #strong[(a) Recover the center]
      #cetz.canvas({
  import cetz.draw: *
  rect((-0.252, 0.2), (3.36, 3.04), fill: rgb("#f2f2f2"), stroke: none)
  line((3.36, 0.2), (3.36, 3.04), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.344, 2.88), [#text(size: 9pt)[head $C$]])
  content((4.368, 2.88), [#text(size: 9pt)[outside]])
  content((0, 2.4), [#text(size: 9pt)[$a$]])
  content((0.84, 2.4), [#text(size: 9pt)[$t^-$]])
  content((1.68, 2.4), [#text(size: 9pt)[$t$]])
  content((2.856, 2.4), [#text(size: 9pt)[$s^-$]])
  content((3.864, 2.4), [#text(size: 9pt)[$s$]])
  line((0, 1.92), (5.04, 1.92), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0, 1.92), radius: 0.04939, fill: black, stroke: none)
  circle((5.04, 1.92), radius: 0.04939, fill: black, stroke: none)
  content((4.2, 1.92), [#text(size: 9pt)[$+c$]], anchor: "south", padding: 0.1176cm)
  content((5.04, 1.92), [#text(size: 9pt)[$v_1$]], anchor: "west", padding: 0.1176cm)
  line((1.68, 1.32), (5.04, 1.32), stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  circle((1.68, 1.32), radius: 0.04939, fill: black, stroke: none)
  circle((5.04, 1.32), radius: 0.04939, fill: black, stroke: none)
  content((2.352, 1.32), [#text(size: 9pt)[$-c$]], anchor: "south", padding: 0.1176cm)
  content((5.04, 1.32), [#text(size: 9pt)[$v_2$]], anchor: "west", padding: 0.1176cm)
  line((0, 0.6), (0.84, 0.6), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0, 0.6), radius: 0.04939, fill: black, stroke: none)
  circle((0.84, 0.6), radius: 0.04939, fill: black, stroke: none)
  content((0.42, 0.6), [#text(size: 9pt)[$+c$]], anchor: "south", padding: 0.1176cm)
  content((1.008, 0.6), [#text(size: 9pt)[retain $[a,t^-]$]], anchor: "west", padding: 0.1176cm)
  content((2.52, -0.16), [#text(size: 9pt)[Discard the later piece;#linebreak()shorten the earlier piece.]])
})
    ],
    [
      #strong[(b) Recover one exterior piece]
      #cetz.canvas({
  import cetz.draw: *
  rect((-0.252, 0.2), (2.94, 3.04), fill: rgb("#f2f2f2"), stroke: none)
  line((2.94, 0.2), (2.94, 3.04), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.344, 2.88), [#text(size: 9pt)[head $C$]])
  content((4.2, 2.88), [#text(size: 9pt)[outside]])
  content((0, 2.4), [#text(size: 9pt)[$t$]])
  content((2.352, 2.4), [#text(size: 9pt)[$s^-$]])
  content((3.528, 2.4), [#text(size: 9pt)[$s$]])
  content((5.04, 2.4), [#text(size: 9pt)[$v$]])
  line((0, 1.92), (5.04, 1.92), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0, 1.92), radius: 0.04939, fill: black, stroke: none)
  circle((5.04, 1.92), radius: 0.04939, fill: black, stroke: none)
  content((1.176, 1.92), [#text(size: 9pt)[$c$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.32), (2.352, 1.32), stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  circle((0, 1.32), radius: 0.04939, fill: black, stroke: none)
  circle((2.352, 1.32), radius: 0.04939, fill: black, stroke: none)
  content((1.176, 1.32), [#text(size: 9pt)[$-c$]], anchor: "south", padding: 0.1176cm)
  line((3.528, 0.6), (5.04, 0.6), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((3.528, 0.6), radius: 0.04939, fill: black, stroke: none)
  circle((5.04, 0.6), radius: 0.04939, fill: black, stroke: none)
  content((4.284, 0.6), [#text(size: 9pt)[$c$]], anchor: "south", padding: 0.1176cm)
  content((2.52, -0.16), [#text(size: 9pt)[$bold(1)_([t,v])- bold(1)_([t,s^-])$ $= bold(1)_([s,v])$]])
})
    ],
  )],
  caption: [Figure 1: Segment matching in the representative case $a prec t prec.curly.eq s^(-)$, where $a$ and $t$ are the earlier and later starts and $s$ is the first node outside the head. Each row represents a segment; its labels through $s$ refer to the common ancestor chain. In (a), the displayed signs are opposite coefficient signs, with $c > 0$; they are independent of the $+$ and $-$ endpoint-origin labels. In (b), a piece from the $+$ endpoint can have either sign of $c$. Its exterior is reproduced using at most two segments starting at $t$. The proof also covers coincident starts, $t = s$, and roots outside $C$. ],
) <fig:segment-matching>

#proof[
  Fix $eta > 0$ and put $R = max { parallel p + y parallel_S \, parallel p - y parallel_S } + eta$.
    Choose representations of $p + y$ and $p - y$ of cost at most $R$.
    Halve every coefficient and concatenate the two lists, retaining the labels $+$ and $-$ that record their
    origins. These labels are independent of the signs of the coefficients.
    The combined list has output $p$ and start mass $m$ with $M \( m \) lt.eq R$.
    Figure 1 illustrates the two uses of a matched pair.
  A first node outside $C$ means a node $s in.not C$ whose parent lies in $C$, or a root outside $C$.
    Every segment is then of exactly one of three kinds: it lies wholly in $C$;
    it contains one first node outside $C$; or its start lies strictly below a first node outside $C$.
    The second kind includes segments starting at that first node.
    At each such $s$, match the positive and negative weights of all segments containing $s$ in pieces of equal
    absolute weight. Their total positive and total negative masses are finite and equal,
    since their sum is the output $p_s = 0$. For completeness,
    place the positive weights consecutively on an interval of their total length,
    do the same with the absolute negative weights, and use the intersections of these intervals as matching
    pieces. This produces a countable matching that uses every weight.
    A segment contains at most one first node outside $C$, so the matchings do not interfere.
  In each matched pair, both starts are ancestors of its first outside node $s$.
    Call the piece with deeper start the later piece, breaking a tie arbitrarily.
    Define $r_t$ to be the sum of the sizes of later pieces starting at $t$,
    together with the sizes of all original pieces starting strictly below a first node outside $C$.
    These are disjoint portions of the list; hence $0 lt.eq r lt.eq m$.
  We first recover $p$ at cost at most $M \( m - r \)$. Delete all pieces starting strictly below a first outside
    node. For a matched pair with coincident starts, discard both pieces.
    Otherwise discard the later piece and shorten the earlier piece to end immediately before the later start.
    The remaining part lies in $C$. On $C$ the removed overlapping parts had equal opposite coefficients and
    therefore canceled. Segments wholly inside $C$ are unchanged.
    The modified list consequently represents $p$, and its start masses are at most $m - r$. By (75),
  #[#set math.equation(numbering: n => "(80)")
   $ parallel p parallel_S^2 + M \( r \)^2 lt.eq M \( m - r \)^2 + M \( r \)^2 lt.eq M \( m \)^2 . $ <sm:s:saved-mass>]
  It remains to control $y$ by the saved mass. The output of the $+$ list outside $C$ is $y \/ 2$.
    We represent it using start masses at most $4 r$. Include each $+$ piece starting strictly below a first
    outside node without change. For a $+$ piece in a pair at $s$,
    let $t$ be the pair’s later start and $v$ the endpoint of this piece.
    Replace its exterior part by the segment $\[ t \, v \]$ with its original coefficient.
    If $t in C$, also include the segment from $t$ to the parent of $s$ with the opposite coefficient.
    These two segments leave precisely the desired output from $s$ to $v$. If $t = s$, no subtraction is needed.
    Each pair has at most two $+$ pieces, and each uses at most two segments of the matched size,
    all starting at $t$. Their total start mass is therefore at most four times the later piece’s mass.
    No segment wholly in $C$ is needed. Thus
  #[#set math.equation(numbering: n => "(81)")
   $ parallel y parallel_S lt.eq 2 M \( 4 r \) = 8 M \( r \) . $ <sm:s:tail-recovery>]
  All the modified lists are legitimate: their absolute start masses have finite cost,
    and each coordinate has only finitely many ancestors. Combining (80) and (81) gives $parallel p parallel_S^2 +
    parallel y parallel_S^2 \/ 64 lt.eq R^2$. Finally let $eta arrow.b 0$. ◻
]

#thm([Corollary 8.5.])[
  #emph[For every $x in X_S$ with $parallel x parallel_S = 1$,
    every $t > 0$ and every $epsilon > 0$ there is a closed finite-codimensional subspace $F subset X_S$ such that
$ inf_(y in F\
parallel y parallel_S = 1) max { parallel x + t y parallel_S \, parallel x - t y parallel_S } gt.eq
  sqrt(1 + t^2 \/ 64) - epsilon . $

 In particular, define the maximum form of the asymptotic midpoint modulus by
$ delta_(X_S)^max \( t \) = inf_(parallel x parallel_S = 1) sup_(F subset X_S upright(" closed")\
dim \( X_S \/ F \) < oo) inf_(y in F\
parallel y parallel_S gt.eq 1) #scale(x: 120%, y: 120%)[\(] max_plus.minus parallel x plus.minus t y parallel_S -
  1 #scale(x: 120%, y: 120%)[\)] . $

 Then $delta_(X_S)^max \( t \) gt.eq sqrt(1 + t^2 \/ 64) - 1$.]
] <sm:s:midpoint-consequence>

#proof[
  Choose a finite-support $p$ arbitrarily close to $x$, let $C$ be its finite ancestral closure and set $F =
    ker P_C$. Theorem 41 gives, uniformly for $y in F$ with $parallel y parallel_S gt.eq 1$,
  $ max_plus.minus parallel x plus.minus t y parallel_S gt.eq sqrt(parallel p parallel_S^2 + t^2 \/ 64) -
    parallel x - p parallel_S . $
  As $parallel x - p parallel_S arrow.r 0$, the right side tends to $sqrt(1 + t^2 \/ 64)$.
    Coordinate continuity makes $F$ closed and finite-codimensional, proving the assertion. ◻
]

== 9 Incomparable segments <sm:i:section>

In this section, arrays are tested by families of segments in which every node of one segment is incomparable with
  every node of another. The resulting dual space has unit root paths of arbitrarily large finite height.
  When both endpoints lie in the unit ball, a midpoint close to the unit sphere forces small displacement beyond
  any finite prefix supporting that midpoint. We prove the latter assertion by replacing the coefficients of
  segment atoms with the sums of a norming test along their segments.
  Opposite signs can then be controlled by shortening segments without violating their incomparability.

=== 9.1 The norm and its dual atoms <the-norm-and-its-dual-atoms>

For an integer $h gt.eq 1$, let $T_h = bb(N)^(lt.eq h)$, including the empty sequence as its root,
  and take disjoint copies when forming $cal(T) = union.sq.big_(h gt.eq 1) T_h$.
  Nodes in the same tree are ordered by extension, denoted by $s prec.curly.eq t$;
  nodes in different trees are incomparable. If $s prec.curly.eq t$,
  the segment $\[ s \, t \]$ consists of every node between $s$ and $t$, including both endpoints.
  A finite family $\( S_i \)_(i = 1)^m$ of nonempty segments is #emph[incomparable] if, for $i eq.not j$,
  every node of $S_i$ is incomparable with every node of $S_j$.
  In particular, the segments are disjoint, but disjointness alone is not this condition.

For a finitely supported real array $g$ on $cal(T)$, set

#[#set math.equation(numbering: n => "(82)")
 $ parallel g parallel_(Y_(upright(I))) = sup_(\( S_i \) upright(" incomparable"))
   (sum_(i = 1)^m lr(|sum_(v in S_i) g \( v \)|)^2)^(1 \/ 2) \, $ <sm:i:norm>]

and let $Y_(upright(I))$ be its completion. This is a finite norm on $c_00 \( cal(T) \)$:
  the triangle inequality follows from the Euclidean triangle inequality, singleton tests separate points,
  and disjointness bounds every test by $sum_v \| g \( v \) \|$.
  Each coordinate and each finite segment evaluation extends continuously to $Y_(upright(I))$.
  Formula (82) remains valid in the completion. Indeed, the supremum of the extended tests is at most the
  completion norm and is Lipschitz with constant one; approximation by finitely supported arrays gives the reverse
  inequality.

Quadratic aggregation over incomparable segment families also appears in the $ell_2$-Baire-sum construction of
  Argyros and Dodos #cite(label("ArgyrosDodos2007")) author version, Section 4.1.
  There each segment contributes the norm of a sum in a Schauder tree basis;
  here it contributes the absolute scalar sum in (82).

#thm([Proposition 9.1.])[
  #emph[Let $Y_(upright(I) \, h)$ be the completion of the arrays supported on $T_h$ in the norm (82). Then
#[#set math.equation(numbering: n => "(83)")
 $ frac(parallel g parallel_2, sqrt(h + 1)) lt.eq parallel g parallel_(Y_(upright(I) \, h)) lt.eq
   sqrt(h + 1) thin parallel g parallel_2 \, wide g in c_00 \( T_h \) \, $ <sm:i:hilbert>]

 and
$ Y_(upright(I)) = (xor.big_(h gt.eq 1) Y_(upright(I) \, h))_(ell_2) . $

 Both $Y_(upright(I))$ and $X_(upright(I)) := Y_(upright(I))^(*)$ are reflexive.]
] <sm:i:reflexivity>

#proof[
  At each fixed level of $T_h$, the singleton segments form an incomparable family.
    Hence the squared norm of $g$ dominates the sum of $\| g \( v \) \|^2$ over that level.
    Summing over the $h + 1$ levels gives the lower bound in (83).
    For the upper bound, every segment has at most $h + 1$ nodes, so Cauchy–Schwarz and disjointness give
  $ sum_i lr(|sum_(v in S_i) g \( v \)|)^2 lt.eq \( h + 1 \) sum_i sum_(v in S_i) \| g \( v \) \|^2
    lt.eq \( h + 1 \) parallel g parallel_2^2 . $
  Thus $Y_(upright(I) \, h)$ is isomorphic to the Hilbert space $ell_2 \( T_h \)$ and is reflexive.
  A test family separates into families on the individual trees.
    Conversely, the union of finitely many such families, one in each of distinct trees, is incomparable.
    Choosing each component family arbitrarily close to its supremum proves
  $ parallel g parallel_(Y_(upright(I)))^2 = sum_h parallel g \|_(T_h) parallel_(Y_(upright(I) \, h))^2 $
  for finitely supported $g$, and then the asserted sum decomposition follows by completion.
    For completeness, the dual of an $ell_2$-sum of Banach spaces is the $ell_2$-sum of their duals:
    Cauchy–Schwarz bounds the sum of the pairings, while finitely many nearly norming component vectors with
    suitable scalar weights give the opposite norm inequality.
    Restrictions to the components determine a functional by density.
    Applying this description twice, componentwise reflexivity shows that the canonical map into the bidual is
    onto. Thus $Y_(upright(I))$ is reflexive, as is its dual $X_(upright(I))$. ◻
]

Write $e_v in X_(upright(I))$ for evaluation at $v$, and put $z_S = sum_(v in S) e_v$, with $z_diameter = 0$.
  We denote the dual norm by $parallel dot.op parallel_(upright(I))$.
  The coordinate evaluations are linearly independent, so $X_(upright(I))$ is infinite dimensional.
  An #emph[atom] is a vector together with a representation

#[#set math.equation(numbering: n => "(84)")
 $ A = sum_(i = 1)^m a_i z_(S_i) \, wide sum_(i = 1)^m a_i^2 lt.eq 1 \,
   wide \( S_i \)_(i = 1)^m upright(" incomparable") . $ <sm:i:atoms>]

The representation will matter when its coefficients are replaced below.

#thm([Lemma 9.2.])[
  #emph[The unit ball of $X_(upright(I))$ is the norm-closed convex hull of the atoms (84).
    In particular, finite linear combinations of the coordinate evaluations are dense in $X_(upright(I))$.]
] <sm:i:atom-hull>

#proof[
  Every atom has norm at most one, by Cauchy–Schwarz and (82), and for every $g in Y_(upright(I))$,
  $ sup_(A upright(" atom")) A \( g \) = parallel g parallel_(Y_(upright(I))) . $
  If the closed convex hull of the atoms missed a point of the dual unit ball,
    Hahn–Banach separation would give a separating functional in $X_(upright(I))^(*) = Y_(upright(I))$,
    using Proposition 43. The displayed identity rules out such a separation.
    Each atom has finite support, which gives the density assertion. ◻
]

=== 9.2 Unit paths and finite prefixes <unit-paths-and-finite-prefixes>

The root paths give the one-sided obstruction; finite prefixes will separate the head of a midpoint from its
  remaining coordinates. For $s in T_h$, define

$ v_s = z_(\[ diameter_h \, s \]) \, $

where $diameter_h$ denotes the root of that copy of $T_h$. Each $v_s$ is an atom of norm one:
  its norm is at most one by Lemma 44, and testing it against the array which equals one at $s$ and zero elsewhere
  gives the reverse inequality. The same argument gives $parallel e_t parallel_(upright(I)) =
  1$ for every node $t$. If $\| s \| < h$ and $t_j = s^frown j$, then

#[#set math.equation(numbering: n => "(85)")
 $ v_(t_j) = v_s + e_(t_j) \, wide parallel v_s parallel_(upright(I)) = parallel e_(t_j) parallel_(upright(I)) =
   1 \, wide e_(t_j) arrow.r 0 upright(" weakly") . $ <sm:i:paths>]

To verify weak convergence, singleton tests at the children show that $sum_j \| g \( t_j \) \|^2 lt.eq
  parallel g parallel_(Y_(upright(I)))^2$ for each $g in Y_(upright(I))$.
  Thus $g \( t_j \) arrow.r 0$, and these are all the functionals on $X_(upright(I))$ by reflexivity.

#thm([Corollary 9.3.])[
  #emph[The real reflexive space $X_(upright(I))$ admits no equivalent asymptotically uniformly convex norm.]
] <sm:i:auc-obstruction>

#proof[
  The trees (85) exist at every finite height and satisfy Lemma 3 with path bounds and increment lower bound all
    equal to one. More explicitly, for an equivalent norm $N$ with $a parallel u parallel_(upright(I)) lt.eq
    N \( u \) lt.eq b parallel u parallel_(upright(I))$, that lemma uses $t_0 = a \/ \( 2 b \)$.
    If $delta = overline(delta)_N \( t_0 \) > 0$, its finite-codimensional approximation and convexity argument
    selects a child at every nonterminal node for which
  $ N \( v_(t_j) \) gt.eq \( 1 + delta \/ 4 \) N \( v_s \) . $
  Iteration to height $h$ gives $a \( 1 + delta \/ 4 \)^h lt.eq b$, a contradiction for sufficiently large $h$. ◻
]

A set $E subset cal(T)$ is #emph[prefix closed] if it contains every ancestor of each of its nodes,
  within that node’s tree. Let $P_E$ be coordinate restriction to $E$, and let $Q_E = I - P_E$.

#thm([Lemma 9.4.])[
  #emph[For every finite prefix-closed $E$, both $P_E$ and $Q_E$ act contractively on $Y_(upright(I))$ and,
    by adjoints, on $X_(upright(I))$. On $X_(upright(I))$, $P_E$ has finite rank and retains exactly the
    coordinates indexed by $E$. For every $x in X_(upright(I))$ and every $eta > 0$,
    there is such an $E$ with $parallel Q_E x parallel_(upright(I)) < eta$.]
] <sm:i:projections>

#proof[
  The nonempty intersections of an incomparable segment family with $E$ are again incomparable segments;
    the same is true of the portions outside $E$. Here prefix closure ensures that a segment is cut into an
    initial part and a terminal part. Applying these restricted tests to the original array proves both
    contraction inequalities on $Y_(upright(I))$, first on finite arrays and then on the completion.
    The adjoints are contractions and act as the stated coordinate projections on each $e_v$,
    hence on $X_(upright(I))$ by Lemma 44. The range of $P_E$ is contained in the span of the finitely many $e_v$
    with $v in E$. Finally, approximate $x$ by a finitely supported vector and let $E$ contain its support and all
    its ancestors. The contraction bound for $Q_E$ gives the last assertion. ◻
]

=== 9.3 Replacing coefficients and controlling cancellation <replacing-coefficients-and-controlling-cancellation>

The following estimate is uniform in the finite prefix and allows an arbitrary displacement.
  Its tail-supported case is the symmetric splitting estimate for this model.

#thm([Theorem 9.5.])[
  #emph[Let $E subset cal(T)$ be finite and prefix closed. If $x \, y in X_(upright(I))$ satisfy
$ P_E x = x \, wide parallel x + y parallel_(upright(I)) lt.eq 1 \, wide parallel x -
  y parallel_(upright(I)) lt.eq 1 \, $

 then
#[#set math.equation(numbering: n => "(86)")
 $ parallel Q_E y parallel_(upright(I)) lt.eq \( sqrt(2) + sqrt(6) \) sqrt(1 - parallel x parallel_(upright(I))) .
   $ <sm:i:tail-bound>]

 In particular, if $Q_E y = y$, the same bound holds for $parallel y parallel_(upright(I))$.]
] <sm:i:tail-estimate>

#proof[
  Convexity gives $parallel x parallel_(upright(I)) lt.eq 1$. Choose $f in Y_(upright(I))$ supported on $E$ such that
  $ parallel f parallel_(Y_(upright(I))) lt.eq 1 \, wide x \( f \) = parallel x parallel_(upright(I)) . $
  Indeed, Hahn–Banach gives a norming element of $X_(upright(I))^(*)$;
    reflexivity identifies it with an element of $Y_(upright(I))$,
    and applying $P_E$ preserves its pairing with $x$ without increasing its norm.
    If $x = 0$, we may simply take $f = 0$.
  For an atom with representation (84), define
  $ p_i^A = z_(S_i) \( f \) \, wide d \( A \) = 1 - A \( f \) = 1 - sum_i a_i p_i^A gt.eq 0 . $
  Both coefficient vectors $\( a_i \)$ and $\( p_i^A \)$ have Euclidean norm at most one. The identity
  $ 2 d \( A \) = sum_i \( a_i - p_i^A \)^2 + (1 - sum_i a_i^2) + (1 - sum_i \( p_i^A \)^2) $
  therefore gives
  #[#set math.equation(numbering: n => "(87)")
   $ sum_i \( a_i - p_i^A \)^2 lt.eq 2 d \( A \) \, wide 1 - sum_i \( p_i^A \)^2 lt.eq 2 d \( A \) . $ <sm:i:defect>]
  Replace the coefficients on the terminal pieces by setting
  $ hat(A) = sum_i p_i^A z_(S_i \\ E) . $
  Those nonempty terminal pieces remain incomparable. The atom norm bound and (87) imply
  #[#set math.equation(numbering: n => "(88)")
   $ parallel hat(A) - Q_E A parallel_(upright(I)) lt.eq sqrt(2 d \( A \)) . $ <sm:i:replacement>]
  Let $cal(R)$ be the minimal nodes of $cal(T) \\ E$. They form an antichain and their descendant subtrees
    partition the complement. If $p_i^A eq.not 0$ and $S_i \\ E$ is nonempty,
    the original segment meets $E$ and exits it through exactly one $q in cal(R)$.
    For a fixed $q$, at most one segment in an incomparable family can do this,
    since two such segments would both contain $q$. We may write
  #[#set math.equation(numbering: n => "(89)")
   $ hat(A) = sum_(q in cal(R)) r_q^A z_(\[ q \, t_q^A \]) . $ <sm:i:exits>]
  Only finitely many coefficients are nonzero. When $r_q^A eq.not 0$,
    let $s_q^A in E$ be the starting node of the original segment and let $t_q^A succ.curly.eq
    q$ be its terminal node. Then $r_q^A$ is the sum of $f$ from $s_q^A$ to the predecessor of $q$.
    For zero coefficients choose $t_q^A = q$; no starting node is needed.
  We next show that opposite coefficients in two atoms consume their norming defects:
  #[#set math.equation(numbering: n => "(90)")
   $ sum_(q : thin r_q^A r_q^(A') < 0) \| r_q^A r_q^(A') \| lt.eq 1 /
     2 (1 - sum_i \( p_i^A \)^2 + 1 - sum_i \( p_i^(A') \)^2) lt.eq d \( A \) + d \( A' \) . $ <sm:i:cancellation>]
  For any exit occurring in this sum, the two starting nodes lie on the same ancestor path of $q$.
    They are distinct, since identical starts would give identical sums of $f$, rather than opposite signs.
    Consider first the exits for which $s_q^A prec s_q^(A')$.
    Shorten the corresponding segment of $A$ to the interval from $s_q^A$ to the predecessor of $s_q^(A')$.
    This interval is nonempty and is a subsegment of the original segment.
    Distinct exits correspond to distinct segments, so all these shortenings can be made simultaneously.
    Every modified family is still incomparable. Its corresponding squared evaluation changes from $\( r_q^A \)^2$
    to $\( r_q^A - r_q^(A') \)^2$, an increase of
  $ \( r_q^(A') \)^2 + 2 \| r_q^A r_q^(A') \| gt.eq 2 \| r_q^A r_q^(A') \| . $
  All its squared evaluations sum to at most one. Thus the sum of these products is at most $1 /
    2 \( 1 - sum_i \( p_i^A \)^2 \)$. For the exits with the opposite ordering,
    shorten the segments of $A'$ instead and obtain the other half of (90). The final inequality follows from (87).
  We have controlled the replacement error for one atom and opposite exit coefficients for two atoms.
    It remains to apply these facts to convex combinations approximating the two endpoints $x + y$ and $x - y$.
    Fix $epsilon > 0$. By Lemma 44, choose a finite probability distribution of atoms for each endpoint whose mean
    differs from that endpoint in norm by at most $epsilon$. Choose $sigma in { - 1 \,
    1 }$ with equal probabilities, then choose $A$ from the distribution for $x + sigma y$. Consequently
  $ parallel bb(E) A - x parallel_(upright(I)) lt.eq epsilon \, wide parallel bb(E) \( sigma A \) -
    y parallel_(upright(I)) lt.eq epsilon \, wide 0 lt.eq macron(d) := bb(E) d \( A \) lt.eq 1 -
    parallel x parallel_(upright(I)) + epsilon . $
  Contractivity of $Q_E$, the identity $Q_E x = 0$, and Cauchy–Schwarz applied to (88) give
  #[#set math.equation(numbering: n => "(91)")
   $ parallel bb(E) hat(A) parallel_(upright(I)) lt.eq epsilon + sqrt(2 macron(d)) \, wide
     parallel bb(E) \( sigma hat(A) \) - Q_E y parallel_(upright(I)) lt.eq epsilon +
     sqrt(2 macron(d)) . $ <sm:i:mixture-errors>]
  Put $m_q = bb(E) r_q^A$ and $b_q = bb(E) \| r_q^A \|$. Apply (90) to independent copies $A \,
    A'$ of the unconditional atom distribution. With $r_(+) = max \( r \, 0 \)$ and $r_(-) = max \( - r \, 0 \)$,
    independence gives
  $ 2 sum_q bb(E) \[ \( r_q^A \)_(+) \] thin bb(E) \[ \( r_q^A \)_(-) \] lt.eq 2 macron(d) . $
  Since $b_q^2 - m_q^2 = 4 bb(E) \[ \( r_q^A \)_(+) \] thin bb(E) \[ \( r_q^A \)_(-) \]$,
  #[#set math.equation(numbering: n => "(92)")
   $ sum_q b_q^2 lt.eq sum_q m_q^2 + 4 macron(d) . $ <sm:i:unsigned-mass>]
  At this fixed $epsilon$, the distributions are finite and their atoms have finite support.
    Thus all sums of $m_q$ and $b_q$ above are finite, even though $cal(R)$ can be infinite.
  An array supported on the antichain $cal(R)$ has $Y_(upright(I))$-norm equal to its Euclidean norm:
    a segment meets at most one of its support nodes, and singleton segments realize the Euclidean test.
    The coefficient of $bb(E) hat(A)$ at $q$ is $m_q$, so duality gives
  #[#set math.equation(numbering: n => "(93)")
   $ (sum_q m_q^2)^(1 \/ 2) lt.eq parallel bb(E) hat(A) parallel_(upright(I)) . $ <sm:i:signed-mass>]
  For $g in Y_(upright(I))$ with $parallel g parallel_(Y_(upright(I))) lt.eq 1$, define
  $ L_q = sup_(t succ.curly.eq q) \| z_(\[ q \, t \]) \( g \) \| . $
  For each finite subset of exits, choose segments approaching these suprema.
    The chosen segments are incomparable, so their squared evaluations sum to at most one.
    Passing to the suprema and then taking the supremum over finite subsets proves $sum_q L_q^2 lt.eq 1$;
    no supremum need be attained. It follows that
  $ \| bb(E) \( sigma hat(A) \) \( g \) \| lt.eq sum_q b_q L_q lt.eq (sum_q b_q^2)^(1 \/ 2) . $
  Taking the supremum over $g$, and using (91)–(93), yields
  $ parallel Q_E y parallel_(upright(I)) lt.eq epsilon + sqrt(2 macron(d)) +
    (\( epsilon + sqrt(2 macron(d)) \)^2 + 4 macron(d))^(1 \/ 2) . $
  The right-hand side is increasing in $macron(d)$. Substitute $macron(d) lt.eq 1 -
    parallel x parallel_(upright(I)) + epsilon$ and let $epsilon arrow.b 0$.
    The two limiting contributions are $sqrt(2 \( 1 - parallel x parallel_(upright(I)) \))$ and
    $sqrt(6 \( 1 - parallel x parallel_(upright(I)) \))$, proving (86). ◻
]

=== 9.4 Separated midpoint families <separated-midpoint-families>

The next corollary removes the finite-prefix condition on the center:
  if $x plus.minus u_j$ lie in the unit ball for an infinite separated family $\( u_j \)$,
  then the norm of the common midpoint $x$ is bounded away from one.

#thm([Corollary 9.6.])[
  #emph[Let $0 < c lt.eq 1$ and let $x \, u_j in X_(upright(I))$, $j in bb(N)$, satisfy
$ parallel x + u_j parallel_(upright(I)) \, med parallel x - u_j parallel_(upright(I)) lt.eq 1 \, wide
  parallel u_j - u_k parallel_(upright(I)) gt.eq 2 c quad \( j eq.not k \) . $

 Then, with $K = sqrt(2) + sqrt(6)$,
#[#set math.equation(numbering: n => "(94)")
 $ parallel x parallel_(upright(I)) lt.eq 1 - \( c \/ K \)^2 < 1 . $ <sm:i:separation-bound>]

]
] <sm:i:separated-midpoints>

#proof[
  Fix $0 < eta < c$ and use Lemma 46 to choose $E$ with $parallel Q_E x parallel_(upright(I)) < eta$.
    The sequence $\( u_j \)$ is bounded, since $u_j = \( \( x + u_j \) - \( x - u_j \) \) \/ 2$.
    The range of $P_E$ is finite dimensional, so there are distinct $j \, k$ such that,
    for $w = \( u_j - u_k \) \/ 2$, one has $parallel P_E w parallel_(upright(I)) < eta$.
    The separation assumption gives $parallel w parallel_(upright(I)) gt.eq c$.
    Moreover, $x + w$ is the midpoint of $x + u_j$ and $x - u_k$, and $x -
    w$ is the midpoint of the other two endpoints. Hence $parallel x plus.minus w parallel_(upright(I)) lt.eq 1$.
    Therefore
  $ parallel P_E x plus.minus Q_E w parallel_(upright(I)) lt.eq 1 + 2 eta \, wide
    parallel Q_E w parallel_(upright(I)) gt.eq c - eta . $
  Apply Theorem 47 after dividing both vectors by $1 + 2 eta$:
  $ frac(c - eta, 1 + 2 eta) lt.eq K sqrt(1 - frac(parallel P_E x parallel_(upright(I)), 1 + 2 eta)) . $
  Since $parallel P_E x - x parallel_(upright(I)) < eta$, letting $eta arrow.b 0$ gives $c lt.eq
    K sqrt(1 - parallel x parallel_(upright(I)))$, which is (94). ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
