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

#align(center)[#text(size: 16pt, weight: "bold")[Close Separable $C^(*)$-Algebras \
Without Spatial Conjugacy]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

For $C^(*)$-algebras $A \, B subset.eq cal(B) \( H \)$, write $A_1$ and $B_1$ for their closed unit balls. Their Kadison–Kastler distance is

#[#set math.equation(numbering: n => "(1)")
 $ d_(upright("KK")) \( A \, B \) = max {sup_(a in A_1) inf_(b in B_1) ∥a - b∥ \, thin sup_(b in B_1) inf_(a in A_1) ∥b - a∥} . $ <eq:kk>]

The spatial form of the perturbation problem asks whether sufficiently close algebras must be related by $u A u^(*) = B$ for a unitary $u in cal(B) \( H \)$. Kadison and Kastler initiated this problem in [6]. In its separable $C^(*)$-algebraic form, one asks for a constant $delta > 0$ valid for all norm-separable $C^(*)$-algebras on separable Hilbert spaces; no bound on $∥u - I∥$ is required. The following theorem resolves negatively this separable $C^(*)$-algebraic spatial form of the Kadison–Kastler conjecture, even for unital algebras with a common identity.

#thm([Theorem 1.1.])[
  #emph[For every $epsilon > 0$ there are a separable complex Hilbert space $H$ and unital, norm-separable $C^(*)$-algebras $A \, B subset.eq cal(B) \( H \)$ with common identity $I_H$ such that 
$ d_(upright("KK")) \( A \, B \) < epsilon \, #h(2em) A'' = B'' \, $

 but no unitary $u in cal(B) \( H \)$ satisfies $u A u^(*) = B$.]
] <thm:main>

The scope of this statement is important. Johnson constructed arbitrarily close separable nuclear algebras for which implementing unitaries cannot be chosen close to the identity [5]; those examples are nevertheless spatially conjugate. Choi and Christensen constructed arbitrarily close nonisomorphic algebras [2], but norm nonseparability is essential to those examples. These distinctions, and the resulting separable spatial formulation, are discussed in [3]. In the positive direction, Christensen, Sinclair, Smith, White, and Winter proved spatial conjugacy for sufficiently close separable nuclear $C^(*)$-algebras on a separable Hilbert space [3] Theorem 4; see [4] Theorem 5.4 for the full proof. Theorem 1 imposes no nuclearity assumption. It makes no assertion of abstract nonisomorphism and does not give a counterexample for von Neumann algebras.

===== 1.1 The construction. <the-construction.>

We first isolate a way to turn an obstruction for inclusions into an obstruction to arbitrary spatial conjugacy. Let $D subset.eq cal(B) \( L \)$ be unital, norm-separable, and have scalar center. For unital subalgebras $P \, Q subset.eq D$, consider the algebra

$ cal(E)_D \( P \) = { \( x_n \) : x_n in D \, med x_n arrow.r p in P upright(" in norm") } $

acting diagonally on $xor.big_(n gt.eq 1) L$. Changing $P$ changes only the condition at the limit. The coordinate projections are intrinsic minimal central projections of this algebra. Consequently, a unitary conjugating $cal(E)_D \( P \)$ onto $cal(E)_D \( Q \)$ must permute the coordinates and normalize $D$ on every coordinate. Pulling back constant sequences then forces each finite family in $Q$ to be a simultaneous norm limit of families in unitary conjugates of $P$ by normalizers of $D$.

Write $D'$ for the commutant of $D$ on $L$, consisting of the bounded operators commuting with every element of $D$. The obstruction we use is the equality

#[#set math.equation(numbering: n => "(2)")
 $ ∥sum_i p_i z_i∥_(cal(B) \( L \)) = ∥sum_i p_i ⊗ z_i∥_(cal(B) \( L ⊗ L \)) \, #h(2em) p_i in P \, quad z_i in D' . $ <eq:intro-test>]

This equality is invariant under normalizers of $D$ and passes to simultaneous finite-family norm limits. We construct very close subalgebras $P_0 \, P_t subset.eq D$ for which it holds for $P_0$ but fails for $P_t$. In fact, $P_0$ and $P_t$ themselves are conjugate by a unitary close to the identity. The obstruction concerns their positions inside $D$, and the sequence construction makes it an obstruction to every spatial conjugacy of the resulting algebras.

For the close inclusions we use a real-parameter deformation of the regular representation of the free group on countably many generators. This representation-theoretic ingredient belongs to the Pytlik–Szwarc family [7]; its uniform-topology behavior at the regular representation is discussed by Burger, Ozawa, and Thom [1] Theorem 4.6. We give a direct tree construction and prove the uniform estimate needed here. The additional mechanism is the combination of the relative tensor-norm test with the convergent-sequence reduction. The reduction is stated separately, so it can be used for other pairs of inclusions.

Section 2 proves the reduction. Section 3 constructs the representations, and Section 4 establishes the tensor-norm obstruction. Section 5 assembles the counterexamples. All Hilbert spaces are complex, and all operator tensor products below act on the indicated Hilbert-space tensor products. No abstract choice of $C^(*)$-tensor norm is needed. Unital subalgebras are understood to contain the identity of their ambient operator algebra.

== 2 A convergent-sequence obstruction <sec:sequences>

We explain how the limit condition records an inclusion $P subset.eq D$. The resulting algebras preserve the distance between limit algebras, but their spatial conjugacies are constrained by the coordinate algebra $D$.

#thm([Proposition 2.1.])[
  #emph[Let $L$ be a nonzero separable Hilbert space, let $D subset.eq cal(B) \( L \)$ be a unital norm-separable $C^(*)$-algebra with $Z \( D \) = bb(C) I_L$, and let $P \, Q subset.eq D$ be unital $C^(*)$-subalgebras containing $I_L$. On $H = xor.big_(n gt.eq 1) L$, define 
#[#set math.equation(numbering: n => "(3)")
 $ cal(E)_D \( P \) = { \( x_n \)_(n gt.eq 1) : x_n in D \, med x_n arrow.r p in P upright(" in norm") } \, $ <eq:sequence-definition>]

 and define $cal(E)_D \( Q \)$ similarly. Then:]
  + #emph[These are unital norm-separable $C^(*)$-algebras with common identity, and 
#[#set math.equation(numbering: n => "(4)")
 $ d_(upright("KK")) \( cal(E)_D \( P \) \, cal(E)_D \( Q \) \) = d_(upright("KK")) \( P \, Q \) . $ <eq:distance-equality>]

]
  + #emph[If a unitary conjugates $cal(E)_D \( P \)$ onto $cal(E)_D \( Q \)$, there are unitaries $U_n in cal(B) \( L \)$ with $U_n D U_n^(*) = D$ such that, for every $b in Q$, some $p_b in P$ satisfies 
#[#set math.equation(numbering: n => "(5)")
 $ ∥b - U_n p_b U_n^(*)∥ arrow.r 0 . $ <eq:pointwise-normalizers>]

 The same sequence $\( U_n \)$ works for every $b$.]
  + #emph[The two algebras have the same commutant, and hence the same von Neumann closure.]
] <prop:sequences>

#proof[
  A norm-convergent sequence is bounded, so (3) defines a diagonal operator on $H$, with norm $sup_n ∥x_n∥$. Algebra operations and adjoints preserve the limit condition, and the constant identity belongs to the algebra. To check norm closedness, suppose $x^(\( k \)) arrow.r x$ in the supremum norm, with coordinate limits $p_k in P$. Then
  $ ∥p_k - p_j∥ lt.eq sup_n ∥x_n^(\( k \)) - x_n^(\( j \))∥ . $
  Thus $p_k arrow.r p in P$. The estimate
  $ ∥x_n - p∥ lt.eq ∥x_n - x_n^(\( k \))∥ + ∥x_n^(\( k \)) - p_k∥ + ∥p_k - p∥ $
  shows that $x_n arrow.r p$. Moreover,
  #[#set math.equation(numbering: n => "(6)")
   $ cal(E)_D \( P \) = c_0 \( bb(N) \, D \) + { \( p \, p \, dots.h \) : p in P } . $ <eq:sum-decomposition>]
  The two summands are norm-separable: $P$ is a subspace of the separable metric space $D$, and finite-support sequences from a countable dense subset of $D$ are dense in $c_0 \( bb(N) \, D \)$. Their sum is norm-separable.
  For the metric assertion, write $alpha \( P \, Q \) = sup_(p in P_1) "dist" \( p \, Q_1 \)$. Given a contraction $x in cal(E)_D \( P \)$ with limit $p$ and $eta > 0$, choose $q in Q_1$ with $∥p - q∥ < alpha \( P \, Q \) + eta$, and choose $N$ so that $sup_(n > N) ∥x_n - p∥ < eta$. Keeping the first $N$ entries of $x$ and putting $q$ thereafter gives a contraction $y in cal(E)_D \( Q \)$ with $∥x - y∥ < alpha \( P \, Q \) + 2 eta$. This proves the upper bound for the directed distance. Conversely, for a constant contraction $\( p \, p \, dots.h \)$ and any contraction $y in cal(E)_D \( Q \)$ with limit $q in Q_1$,
  $ ∥\( p \, p \, dots.h \) - y∥ = sup_n ∥p - y_n∥ gt.eq ∥p - q∥ gt.eq "dist" \( p \, Q_1 \) . $
  Taking infima and suprema proves equality of the directed distances. Interchanging $P \, Q$ gives (4).
  Let $e_n$ be the projection onto the $n$th copy of $L$. Every $e_n$ is a central element of $cal(E)_D \( P \)$. Conversely, a central element $\( x_n \)$ commutes with all finite-support $D$-valued sequences, so each $x_n$ lies in $Z \( D \) = bb(C) I_L$. Thus the center consists exactly of convergent scalar sequences. Every nonzero central projection contains an $e_n$, and hence the minimal nonzero central projections are precisely the $e_n$. The same holds for $cal(E)_D \( Q \)$.
  If $S cal(E)_D \( P \) S^(*) = cal(E)_D \( Q \)$, conjugation by $S$ therefore permutes the projections $e_n$. Its restriction from the $n$th coordinate to its image is a unitary $U_n : L arrow.r L$. The corresponding coordinate corners of both algebras are exactly $D$, since every finitely supported $D$-valued sequence is allowed. Consequently $U_n D U_n^(*) = D$. For $b in Q$, pull back the constant sequence $\( b \, b \, dots.h \)$ under $S$. Its $n$th entry is $U_n^(*) b U_n$, regardless of the coordinate permutation. It belongs to $cal(E)_D \( P \)$, so its entries converge in norm to some $p_b in P$. This is equivalent to (5) and proves (ii).
  Finally, an operator commuting with $cal(E)_D \( P \)$ commutes with all $e_n$, so it is block diagonal. Commutation with the finite-support $D$ corners means that each block lies in $D'$. These conditions are also sufficient, and do not depend on $P$. Thus both commutants equal
  $ { \( z_n \) : z_n in D' \, med sup_n ∥z_n∥ < oo } . $
  This proves (iii). ◻
]

We next give a concrete condition preserved by the approximation in Proposition 2(ii).

#prodef([Definition 2.2.])[
  For a unital inclusion $P subset.eq D subset.eq cal(B) \( L \)$, say that $P$ has the #emph[spatial tensor-norm identity relative to $D$] if
  #[#set math.equation(numbering: n => "(7)")
   $ ∥sum_(i = 1)^m p_i z_i∥_(cal(B) \( L \)) = ∥sum_(i = 1)^m p_i ⊗ z_i∥_(cal(B) \( L ⊗ L \)) $ <eq:tensor-property>]
  for every positive integer $m$, all $p_1 \, dots.h \, p_m in P$, and all $z_1 \, dots.h \, z_m in D'$.
] <def:tensor>

#thm([Lemma 2.3.])[
  #emph[Let $P \, Q subset.eq D subset.eq cal(B) \( L \)$ be unital $C^(*)$-algebras. The identity in Definition 3 is preserved by conjugating $P$ with any unitary normalizing $D$. If $\( U_n \)$ is a sequence of unitaries in $cal(B) \( L \)$ satisfying $U_n D U_n^(*) = D$ and every $b in Q$ admits the approximation (5), then the identity for $P$ implies the identity for $Q$.]
] <lem:invariant>

#proof[
  If $U D U^(*) = D$, then $U D' U^(*) = D'$. For $q_i = U p_i U^(*)$ and $z_i in D'$, apply (7) to $p_i$ and $U^(*) z_i U$. Conjugate its product sum by $U$ and its tensor sum by $U ⊗ U$. This gives (7) for $q_i \, z_i$.
  Now fix finite families $b_i in Q$ and $z_i in D'$. Put $q_(i \, n) = U_n p_(b_i) U_n^(*)$. For each $n$, the first part gives the identity for the entire list $\( q_(i \, n) \)_i$, since its entries all lie in $U_n P U_n^(*)$. Both errors
  $ ∥sum_i \( q_(i \, n) - b_i \) z_i∥ \, #h(2em) ∥sum_i \( q_(i \, n) - b_i \) ⊗ z_i∥ $
  are at most $sum_i ∥q_(i \, n) - b_i∥ ∥z_i∥$, which tends to zero. Taking the limit proves the identity for the prescribed families in $Q$ and $D'$. ◻
]

#thm([Corollary 2.4.])[
  #emph[Under the hypotheses of Proposition 2, suppose that $P$ has the spatial tensor-norm identity relative to $D$, whereas $Q$ does not. Then $cal(E)_D \( P \)$ and $cal(E)_D \( Q \)$ are not spatially conjugate. If $W in cal(B) \( L \)$ is unitary and $W P W^(*) = Q$, then nevertheless 
$ d_(upright("KK")) \( cal(E)_D \( P \) \, cal(E)_D \( Q \) \) lt.eq 2 ∥W - I_L∥ . $

]
] <cor:obstruction>

#proof[
  A spatial conjugacy would give the unitaries in Proposition 2(ii), contradicting Lemma 4. For the distance bound, $p mapsto W p W^(*)$ bijects the closed unit balls and
  $ ∥W p W^(*) - p∥ lt.eq 2 ∥p∥ ∥W - I_L∥ . $
  Apply Proposition 2(i). ◻
]

The unitary $W$ used for the distance estimate is not required to normalize $D$. Indeed, under the stated tensor-norm obstruction, no unitary normalizing $D$ can conjugate $P$ onto $Q$.

== 3 A uniformly small free-group deformation <sec:tree>

We now construct the representations used to produce the inclusions in Corollary 5. Let $G$ be the free group on the countable set ${ s_1 \, s_2 \, dots.h }$, let $e$ denote its identity, and put $K = ell^2 \( G \)$. On its usual orthonormal basis define

#[#set math.equation(numbering: n => "(8)")
 $ lambda \( g \) delta_x = delta_(g x) \, #h(2em) rho \( g \) delta_x = delta_(x g^(- 1)) . $ <eq:regular>]

Both are unitary representations, and every left translation commutes with every right translation. The group $G$ is countable, so $K$ is separable.

The following elementary version of the real Pytlik–Szwarc deformation [7,1] records exactly the coefficient and uniform estimate that the proof needs.

#thm([Lemma 3.1.])[
  #emph[For every $0 < t < 1$, there is a unitary representation $pi_t : G arrow.r cal(B) \( K \)$ such that, with $r = sqrt(1 - t^2)$, 
#[#set math.equation(numbering: n => "(9)")
 $ ⟨pi_t \( s_i \) delta_e \, delta_e⟩ & = t quad \( i gt.eq 1 \) \,\
sup_(g in G) ∥pi_t \( g \) - lambda \( g \)∥ & lt.eq c \( t \) \, #h(2em) c \( t \) = 2 \( 1 - r \) + frac(t, 1 - t) + t . $ <eq:coefficient>]

 In particular, $c \( t \) arrow.r 0$ as $t arrow.b 0$.]
] <lem:tree>

#proof[
  Use the tree of reduced words with edges given by right multiplication by a generator or its inverse, rooted at $e$. Its distance is $d \( x \, y \) = \| x^(- 1) y \|$, so left translations preserve distance. For $x eq.not e$, let $p \( x \)$ be the neighbor of $x$ toward $e$, obtained by deleting the last letter of its reduced word. Recursively define
  #[#set math.equation(numbering: n => "(10)")
   $ xi_e = delta_e \, #h(2em) xi_x = t xi_(p \( x \)) + r delta_x quad \( x eq.not e \) . $ <eq:xi>]
  These are unit vectors supported on their root paths. If $z$ is the last common vertex of the root paths to $x$ and $y$, the common-support components are $t^(d \( x \, z \)) xi_z$ and $t^(d \( y \, z \)) xi_z$, respectively. The remaining supports are disjoint. Hence
  #[#set math.equation(numbering: n => "(11)")
   $ ⟨xi_x \, xi_y⟩ = t^(d \( x \, y \)) . $ <eq:gram>]
  Also $delta_e = xi_e$ and $delta_x = \( xi_x - t xi_(p \( x \)) \) \/ r$ for $x eq.not e$, so their span is dense. The assignment $xi_x mapsto xi_(g x)$ preserves every finite Gram matrix by (11). It therefore defines an isometry on the span, and the inverse assignment for $g^(- 1)$ makes the extension unitary. Denote this unitary by $pi_t \( g \)$. The representation law holds on the dense span and hence on $K$. Since $pi_t \( s_i \) delta_e = xi_(s_i) = t delta_e + r delta_(s_i)$, (9) follows.
  It remains to prove that the perturbation is uniformly small over all group elements, rather than just over the generators. Fix $g eq.not e$, write $h_0 = e \, h_1 \, dots.h \, h_l = g$ for its root path, and put $T = pi_t \( g \) lambda \( g \)^(*)$. For $y eq.not g$, (10) gives
  #[#set math.equation(numbering: n => "(12)")
   $ T delta_y = frac(xi_y - t xi_(g p \( g^(- 1) y \)), r) . $ <eq:Ty>]
  The vertex $g p \( g^(- 1) y \)$ is the neighbor of $y$ toward $g$. If $y$ is off the path $\[ e \, g \]$, this neighbor is also $p \( y \)$, the neighbor toward $e$; see Figure 1. Thus $T delta_y = delta_y$ off that path. On the path, the neighbor toward $g$ of $h_k$, for $k < l$, is $h_(k + 1)$, so
  #[#set math.equation(numbering: n => "(13)")
   $ T delta_(h_k) = r xi_(h_k) - t delta_(h_(k + 1)) quad \( 0 lt.eq k < l \) \, #h(2em) T delta_(h_l) = xi_(h_l) . $ <eq:path-action>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (7.8, 0), stroke: (paint: rgb("#000080"), thickness: 1.2pt, miter-limit: 10))
  line((2.6, 0), (2.6, 0.9), (3.9, 1.8), (3.9, 2.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.6, 0.9), (1.3, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.29, 1.75), (3.12, 0.95), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((4.42, 1.35), [same first step#linebreak()toward $e$ and $g$], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$e=h_0$], anchor: "north")
  circle((1.3, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((1.3, -0.03528), [$h_1$], anchor: "north")
  circle((2.6, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((2.6, -0.03528), [$h_j$], anchor: "north")
  content((3.9, 0.2), [$dots.h$])
  circle((6.5, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((6.5, -0.03528), [$h_(l-1)$], anchor: "north")
  circle((7.8, 0), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((7.8, -0.03528), [$g=h_l$], anchor: "north")
  circle((2.6, 0.9), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((2.565, 0.9), [$p(y)$], anchor: "east")
  circle((3.9, 1.8), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.875, 1.825), [$y$], anchor: "south-east")
})],
    caption: [Figure 1: Off the geodesic $\[ e \, g \]$, the first edges toward $e$ and $g$ coincide. Hence $pi_t \( g \) lambda \( g \)^(*)$ fixes all basis vectors outside the finite path span. Only a finite part of the tree is shown. ],
  ) <fig:tree>
  Let $M_g = "span" { delta_(h_k) : 0 lt.eq k lt.eq l }$. On this space define the truncated shift $S delta_(h_k) = delta_(h_(k + 1))$ for $k < l$ and $S delta_(h_l) = 0$, and put $X delta_(h_k) = xi_(h_k)$. For $R = "diag" \( 1 \, r \, dots.h \, r \)$, the recursion gives
  #[#set math.equation(numbering: n => "(14)")
   $ X = R \( I - t S^(*) \)^(- 1) . $ <eq:X>]
  Indeed, its $k$th column is $t^k delta_e + r sum_(j = 1)^k t^(k - j) delta_(h_j)$. Since $∥S∥ lt.eq 1$ and $∥R∥ = 1$,
  #[#set math.equation(numbering: n => "(15)")
   $ ∥X - I∥ lt.eq ∥R - I∥ + ∥R∥ sum_(j = 1)^oo t^j lt.eq 1 - r + frac(t, 1 - t) . $ <eq:Xbound>]
  Writing $R' = "diag" \( r \, dots.h \, r \, 1 \)$, (13) becomes $T \|_(M_g) = X R' - t S$. Therefore
  $ ∥T \|_(M_g) - I∥ & lt.eq ∥\( X - I \) R'∥ + ∥R' - I∥ + t ∥S∥\
 & lt.eq 2 \( 1 - r \) + frac(t, 1 - t) + t = c \( t \) . $
  The same bound holds on $K$, since $T$ is the identity on $M_g^perp$. Multiplication by $lambda \( g \)$ proves (9). For $g = e$ the difference is zero, so the supremum includes this case as well. ◻
]

#prodef([Remark 3.2.])[
  Only the operator $X$ on a single finite path is used in the estimate. On this infinitely branching tree, the global map $delta_x mapsto xi_x$ need not be bounded: the vectors $xi_(s_i)$ all have root coefficient $t$. The Gram-matrix construction of $pi_t$ does not require such a global bounded map.
]

== 4 Close inclusions distinguished by a tensor norm <sec:inclusions>

Fix $0 < t < 1$, let $pi_t$ be given by Lemma 6, and write $pi_0 = lambda$. We construct a common coordinate algebra $D$ and subalgebras $P_0 \, P_t$ satisfying Corollary 5. First we record the absorption calculation that will be used both for closeness and for the tensor-norm estimate.

#thm([Lemma 4.1.])[
  (Absorption).  #emph[Let $sigma$ be a unitary representation of $G$ on a nonzero Hilbert space $J$. The operator 
$ W_sigma \( delta_x ⊗ v \) = delta_x ⊗ sigma \( x \) v quad \( x in G \, med v in J \) $

 is unitary on $K ⊗ J$ and satisfies 
#[#set math.equation(numbering: n => "(16)")
 $ W_sigma \( lambda \( g \) ⊗ I_J \) W_sigma^(*) = lambda \( g \) ⊗ sigma \( g \) quad \( g in G \) . $ <eq:absorption>]

]
] <lem:absorption>

#proof[
  The operator is the orthogonal direct sum of the unitaries $sigma \( x \)$. On $delta_x ⊗ v$, the left side of (16) equals
  $ delta_(g x) ⊗ sigma \( g x \) sigma \( x \)^(*) v = delta_(g x) ⊗ sigma \( g \) v . $
  ◻
]

On $L = K ⊗ K$, put

#[#set math.equation(numbering: n => "(17)")
 $ Q_a \( g \) = lambda \( g \) ⊗ pi_a \( g \) \, #h(2em) P_a = C^(*) \( Q_a \( g \) : g in G \) quad \( a = 0 \, t \) . $ <eq:P>]

For the matrix units $E_(x y) delta_z = upright(bold(1))_({ z = y }) delta_x$ on $K$, define $D subset.eq cal(B) \( L \)$ to be generated by

#[#set math.equation(numbering: n => "(18)")
 $ lambda \( g \) ⊗ I_K \, quad I_K ⊗ pi_0 \( g \) \, quad I_K ⊗ pi_t \( g \) quad \( g in G \) \, #h(2em) I_K ⊗ E_(x y) quad \( x \, y in G \) . $ <eq:D>]

The generators include the identity, and $P_0 \, P_t subset.eq D$. All three algebras are norm-separable, since their generating sets are countable.

#thm([Lemma 4.2.])[
  #emph[The algebra $D$ in (18) has scalar center, and 
#[#set math.equation(numbering: n => "(19)")
 $ D' = { Y ⊗ I_K : Y in lambda \( G \)' } . $ <eq:commutant>]

 There is a unitary $W in cal(B) \( L \)$ such that 
#[#set math.equation(numbering: n => "(20)")
 $ W P_0 W^(*) = P_t \, #h(2em) ∥W - I_L∥ lt.eq c \( t \) . $ <eq:close-W>]

]
] <lem:ambient>

#proof[
  Commutation with all $I_K ⊗ E_(x y)$ forces a bounded operator to be $Y ⊗ I_K$: commutation with the diagonal matrix units removes off-diagonal blocks, and commutation with the remaining units makes the diagonal blocks identical. The first-factor generators then impose exactly $Y in lambda \( G \)'$. Such operators commute with all the second-factor generators, proving (19). In particular, $rho \( g \) ⊗ I_K in D'$.
  If $Y ⊗ I_K in Z \( D \)$, then $Y$ commutes with $lambda \( G \)$ by (19). It also commutes with $rho \( G \)$, since $Y ⊗ I_K$ belongs to $D$ and the right translations belong to $D'$. Thus $Y delta_e$ is invariant under $lambda \( g \) rho \( g \)$, which acts on the basis by conjugation $x mapsto g x g^(- 1)$. Every nonidentity conjugacy class in $G$ is infinite: conjugate a fixed nonidentity reduced word by distinct generators absent from that word. A square-summable vector invariant under conjugation must therefore be supported at $e$. Write $Y delta_e = alpha delta_e$. Commuting with left translations gives $Y delta_x = alpha delta_x$ for every $x$, proving $Z \( D \) = bb(C) I_L$.
  For the final assertion, Lemma 8 shows that $W = W_(pi_t) W_(pi_0)^(*)$ sends every $Q_0 \( g \)$ to $Q_t \( g \)$ by conjugation. Moreover, the direct-sum description of these unitaries gives
  $ ∥W - I_L∥ = ∥W_(pi_t) - W_(pi_0)∥ = sup_(x in G) ∥pi_t \( x \) - lambda \( x \)∥ lt.eq c \( t \) . $
  ◻
]

#thm([Lemma 4.3.])[
  #emph[The inclusion $P_0 subset.eq D$ has the spatial tensor-norm identity.]
] <lem:good-inclusion>

#proof[
  Define a unitary on $L$ by
  $ V \( v ⊗ delta_x \) = lambda \( x \)^(*) v ⊗ delta_x . $
  It commutes with every element of $D'$ by (19). On elementary vectors one computes
  $ V Q_0 \( g \) V^(*) \( v ⊗ delta_x \) = v ⊗ delta_(g x) . $
  Thus $V P_0 V^(*) = I_K ⊗ C^(*) \( lambda \( G \) \)$. Given finite families $p_i in P_0$ and $z_i in D'$, write
  $ V p_i V^(*) = I_K ⊗ X_i \, #h(2em) z_i = Y_i ⊗ I_K . $
  Conjugation by $V$ gives
  $ ∥sum_i p_i z_i∥ = ∥sum_i Y_i ⊗ X_i∥ . $
  On $L ⊗ L = K^(⊗ 4)$, conjugation by $V ⊗ I_L$ gives
  $ ∥sum_i p_i ⊗ z_i∥ = ∥sum_i I_K ⊗ X_i ⊗ Y_i ⊗ I_K∥ = ∥sum_i Y_i ⊗ X_i∥ . $
  The last equality permutes the four tensor factors and uses the fact that tensoring with a nonzero identity operator does not change norm. This proves (7). ◻
]

For $P_t$, the identity will fail because the product norm has a lower bound linear in the number of generators, while absorption gives a square-root upper bound on the tensor norm.

#thm([Lemma 4.4.])[
  #emph[For every positive integer $m$, 
#[#set math.equation(numbering: n => "(21)")
 $ ∥sum_(i = 1)^m lambda \( s_i \)∥ lt.eq 2 sqrt(m) . $ <eq:free-norm>]

]
] <lem:free-norm>

#proof[
  Let $F_i$ be the orthogonal projection onto the closed span of words beginning with $s_i^(- 1)$. The $F_i$ are pairwise orthogonal. Write $lambda \( s_i \) = A_i + B_i$, where
  $ A_i = lambda \( s_i \) \( I_K - F_i \) \, #h(2em) B_i = lambda \( s_i \) F_i . $
  There is no cancellation when $s_i$ is prepended to a word not beginning with $s_i^(- 1)$. Thus the range of $A_i$ consists of vectors supported on words beginning with $s_i$, and these ranges are mutually orthogonal. For every $v in K$,
  $ ∥sum_i A_i v∥^2 = sum_i ∥\( I_K - F_i \) v∥^2 lt.eq m ∥v∥^2 \, $
  while
  $ ∥sum_i B_i v∥ lt.eq sum_i ∥F_i v∥ lt.eq sqrt(m) (sum_i ∥F_i v∥^2)^(1 \/ 2) lt.eq sqrt(m) ∥v∥ . $
  Adding the two bounds proves (21). ◻
]

#thm([Lemma 4.5.])[
  #emph[For every $0 < t < 1$, the inclusion $P_t subset.eq D$ fails the spatial tensor-norm identity.]
] <lem:bad-inclusion>

#proof[
  Choose an integer $m > 4 \/ t^2$, so $m t > 2 sqrt(m)$, and take
  $ p_i = Q_t \( s_i \) \, #h(2em) z_i = rho \( s_i \) ⊗ I_K \, #h(2em) 1 lt.eq i lt.eq m . $
  These belong to $P_t$ and $D'$, respectively. Since $lambda \( s_i \) rho \( s_i \) delta_e = delta_e$, (9) implies
  #[#set math.equation(numbering: n => "(22)")
   $ ∥sum_i p_i z_i∥ gt.eq lr(|⟨(sum_i p_i z_i) \( delta_e ⊗ delta_e \) \, delta_e ⊗ delta_e⟩|) = m t . $ <eq:large-norm>]
  On the other hand, the tensor sum on $L ⊗ L$ is
  $ sum_(i = 1)^m lambda \( s_i \) ⊗ pi_t \( s_i \) ⊗ rho \( s_i \) ⊗ I_K . $
  Apply Lemma 8 to the representation $sigma = pi_t ⊗ rho ⊗ 1$ on $K^(⊗ 3)$, where $1$ is the trivial representation on the last copy of $K$. Together with Lemma 11, it gives
  #[#set math.equation(numbering: n => "(23)")
   $ ∥sum_i p_i ⊗ z_i∥ = ∥sum_(i = 1)^m lambda \( s_i \)∥ lt.eq 2 sqrt(m) < m t . $ <eq:small-norm>]
  Equations (22) and (23) contradict the identity for this finite list. ◻
]

== 5 The counterexamples <sec:assembly>

#proof[
  Given $epsilon > 0$, choose $0 < t < 1$ so small that $2 c \( t \) < epsilon$. Use the algebras $P_0 \, P_t subset.eq D subset.eq cal(B) \( L \)$ from Section 4, and put
  $ H = xor.big_(n gt.eq 1) L \, #h(2em) A = cal(E)_D \( P_0 \) \, #h(2em) B = cal(E)_D \( P_t \) . $
  The space $H$ is separable. Lemma 9 supplies the scalar center of $D$, so Proposition 2 shows that $A \, B$ are unital norm-separable $C^(*)$-algebras with common identity and that $A'' = B''$. The same lemma supplies a unitary $W$ with $W P_0 W^(*) = P_t$ and $∥W - I_L∥ lt.eq c \( t \)$. By Corollary 5,
  $ d_(upright("KK")) \( A \, B \) lt.eq 2 c \( t \) < epsilon . $
  Finally, Lemmas 10 and 12 show that the relative tensor-norm identity holds for $P_0$ but not for $P_t$. Corollary 5 therefore excludes every unitary conjugating $A$ onto $B$. ◻
]

The common ideal $c_0 \( bb(N) \, D \)$ makes the von Neumann closures agree, while the norm-limit condition retains the distinction between the two inclusions.

#heading(level: 1)[References]
#bibitem([1])[M. Burger, N. Ozawa, and A. Thom, #emph[On Ulam stability], Israel J. Math. #strong[193] (2013), 109--129. #link("https://doi.org/10.1007/s11856-012-0050-z")[doi:10.1007/s11856-012-0050-z].]
#bibitem([2])[M.-D. Choi and E. Christensen, #emph[Completely order isomorphic and close $C^(*)$-algebras need not be $*$-isomorphic], Bull. London Math. Soc. #strong[15] (1983), no.~6, 604--610. #link("https://doi.org/10.1112/blms/15.6.604")[doi:10.1112/blms/15.6.604].]
#bibitem([3])[E. Christensen, A. M. Sinclair, R. R. Smith, S. A. White, and W. Winter, #emph[The spatial isomorphism problem for close separable nuclear $C^(*)$-algebras], Proc. Natl. Acad. Sci. USA #strong[107] (2010), no.~2, 587--591. #link("https://doi.org/10.1073/pnas.0913281107")[doi:10.1073/pnas.0913281107].]
#bibitem([4])[E. Christensen, A. M. Sinclair, R. R. Smith, S. A. White, and W. Winter, #emph[Perturbations of nuclear $C^(*)$-algebras], Acta Math. #strong[208] (2012), no.~1, 93--150. #link("https://doi.org/10.1007/s11511-012-0075-5")[doi:10.1007/s11511-012-0075-5].]
#bibitem([5])[B. E. Johnson, #emph[A counterexample in the perturbation theory of $C^(*)$-algebras], Canad. Math. Bull. #strong[25] (1982), no.~3, 311--316. #link("https://doi.org/10.4153/CMB-1982-043-4")[doi:10.4153/CMB-1982-043-4].]
#bibitem([6])[R. V. Kadison and D. Kastler, #emph[Perturbations of von Neumann algebras. I. Stability of type], Amer. J. Math. #strong[94] (1972), no.~1, 38--54. #link("https://doi.org/10.2307/2373592")[doi:10.2307/2373592].]
#bibitem([7])[T. Pytlik and R. Szwarc, #emph[An analytic family of uniformly bounded representations of free groups], Acta Math. #strong[157] (1986), 287--309. #link("https://doi.org/10.1007/BF02392596")[doi:10.1007/BF02392596].]


