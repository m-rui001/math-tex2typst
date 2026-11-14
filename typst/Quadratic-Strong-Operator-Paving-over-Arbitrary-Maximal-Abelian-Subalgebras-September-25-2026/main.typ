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

#align(center)[#text(size: 16pt, weight: "bold")[Quadratic Strong-Operator Paving over Arbitrary Maximal Abelian Subalgebras]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $M subset.eq cal(B) \( H \)$ be a von Neumann algebra on a complex Hilbert space,
  and let $A subset.eq M$ be a maximal abelian unital $*$-subalgebra, or #emph[masa].
  A finite partition $P = \( p_1 \, dots.h \, p_r \)$ in $A$ consists of mutually orthogonal projections with sum
  $1$. Its associated pinching is

$ S_P \( x \) = sum_(i = 1)^r p_i x p_i \, wide x in M . $

Paving asks how small this operator can be made after subtracting a diagonal element of $A$.
  Requiring a small norm for $S_P \( x \) - a$ itself is norm paving,
  which fails for general masas [12] Theorem 3.3. The following strong-operator formulation instead permits a
  compression whose complement is arbitrarily small in the strong operator topology.

#prodef([Definition 1.1.])[
  (Strong-operator paving).  Let $x = x^(*) in M$, $epsilon > 0$, and $r gt.eq 1$ be an integer.
    We say that $x$ is #emph[$\( epsilon \, r \)$ so-pavable over $A$] if for every finite $F subset
    H$ and every $delta > 0$ there are a partition $P = \( p_1 \, dots.h \, p_r \)$ in $A$, an element $a =
    a^(*) in A$ with $parallel a parallel lt.eq parallel x parallel$, and a projection $q in M$ such that
  $ parallel \( 1 - q \) xi parallel < delta quad \( xi in F \) \, wide
    parallel q \( S_P \( x \) - a \) q parallel lt.eq epsilon parallel x parallel . $
  The integer $r$ is fixed before $F$ and $delta$ are chosen.
] <def:so-paving>

#thm([Theorem 1.1.])[
  #emph[For every $0 < epsilon < 1$, set
$ r_epsilon = ⌈400000000 epsilon^(- 2)⌉ + ⌈4 \/ epsilon⌉ + 1 lt.eq 500000000 epsilon^(- 2) . $

 For every masa $A subset.eq M subset.eq cal(B) \( H \)$ and every $x = x^(*) in M$,
   the element $x$ is $\( epsilon \, r_epsilon \)$ so-pavable over $A$.
   In particular, the number of projections is fixed before the inclusion, operator, and strong neighborhood.
   No separability or conditional-expectation assumption is imposed on the inclusion.]
] <thm:main>

Theorem 1 proves the quadratic so-paving conjecture of Popa and Vaes [12] Conjecture 2.8(2).
  Their definition of so-paving uses arbitrary strong neighborhoods of zero;
  Definition 1 gives the equivalent finite-vector formulation [12] Definition 2.2.
  For self-adjoint $x$, allowing a general diagonal element in their definition gives the same condition,
  since taking its real part preserves the norm bound and the compression estimate.

For countably decomposable expected masas, the uniform bound also yields norm paving in the associated ultrapower.

#thm([Corollary 1.2.])[
  (Quadratic norm paving in Ocneanu ultrapowers).  #emph[Let $A subset.eq M$ be a masa.
    Suppose that $A$ is countably decomposable and is the range of a normal conditional expectation from $M$.
    Let $omega$ be a free ultrafilter on $bb(N)$, and let $A^omega subset.eq
    M^omega$ be the associated inclusion in the Ocneanu von Neumann ultrapower.
    For every $0 < epsilon < 1$ and every $x = x^(*) in M^omega$, there are a partition $p_1 \, dots.h \,
    p_(r_epsilon) in A^omega$ and an element $a = a^(*) in A^omega$ such that
$ parallel a parallel lt.eq parallel x parallel \, wide ∥sum_(i = 1)^(r_epsilon) p_i x p_i - a∥ lt.eq
  epsilon parallel x parallel . $

 Here $r_epsilon$ is the same integer as in Theorem 1.]
] <cor:ultrapower-paving>

#proof[
  Theorem 1 makes every self-adjoint element of $M$ $\( epsilon \, r_epsilon \)$ so-pavable.
    The forward transfer in [12] Theorem 2.7(3) gives the stated norm paving in $M^omega$ with the same error and
    number of projections. Taking the real part of the diagonal element preserves both estimates. ◻
]

=== 1.1 History and significance <history-and-significance>

The classical Kadison–Singer paving problem concerns the diagonal masa in $cal(B) \( ell^2 bb(N) \)$.
  Marcus, Spielman, and Srivastava resolved it by their mixed-characteristic-polynomial method [9].
  For general masas, norm paving is much more restrictive: when $M$ has separable predual,
  it holds exactly when $M$ is type I and $A$ is the range of a normal conditional expectation [12] Theorem 3.3.
  Strong-operator paving retains a uniform partition count while allowing a compression that approaches the
  identity strongly.

Popa’s $upright("II")_1$-factor approach established paving for singular-masa ultraproducts [11].
  Popa and Vaes then obtained so-paving bounds of order $epsilon^(- 4)$ for arbitrary masas in type I algebras
  with separable predual, for Cartan masas in amenable algebras,
  and for the Cartan inclusions associated with essentially free ergodic probability-measure-preserving profinite
  actions of countable groups [12] Proposition 3.2 and Theorem 4.1.
  In contrast, their theorem for tracial ultraproducts of singular masas in finite algebras gives a common
  norm-paving partition of order $epsilon^(- 2)$ for each finite family of centered self-adjoint contractions [12]
  Theorem 5.1. Their later work gives the optimal uniform error for singular-masa ultraproducts [13] Theorem 4.1.
  They explicitly identified the need to unite the Cartan and singular arguments [12] Remark 2.9(ii).
  On the finite-dimensional side, Ravichandran and Srivastava obtained asymptotically optimal multipaving bounds
  from mixed determinantal polynomials [15]; these supply the finite input used here.

A previous combination result illustrates the quantitative issue.
  For an intermediate inclusion $A subset.eq N subset.eq M$ with a faithful normal tracial state,
  Popa and Vaes assume that $L^2 \( M ⊖ N \)$ has no nonzero $A$–$N$ subbimodule finitely generated on the right.
  Their bound uses at most $400 epsilon^(- 2)$ times the so-paving count for $A subset.eq N$ at error $epsilon \/
  2$ [12] Remark 5.3. Inserting their quartic Cartan bound gives order $epsilon^(- 6)$.
  The present argument treats the normalizer algebra through a nonsingular measured equivalence relation and uses
  a single partition for both terms in the normalizer decomposition of one operator. This retains quadratic order.
  The finite-family obstruction in [12] Remark 5.2 concerns the stronger requirement of a common partition for
  arbitrarily many separately prescribed operators in a finite ambient algebra.

The exponent two is forced already by the $L^2$ obstruction in a $upright("II")_1$ factor from [12]
  Proposition 5.4. Fix an integer $1 lt.eq n < epsilon^(- 2)$, choose $epsilon < eta < n^(- 1 \/ 2)$,
  and use the centered self-adjoint unitary $x$ from that proposition at threshold $eta$.
  Write $tau$ for the normalized trace and $parallel b parallel_2 = tau \( b^(*) b \)^(1 \/ 2)$.
  For every partition $P$ with $n$ pieces and every $a in A$, trace orthogonality gives

$ parallel S_P \( x \) - a parallel_2^2 = parallel S_P \( x \) parallel_2^2 + parallel a parallel_2^2 . $

If $parallel a parallel lt.eq 1$, set $z = S_P \( x \) - a$, so $parallel z parallel lt.eq 2$.
  Whenever $parallel q z q parallel lt.eq epsilon$, the two discarded corner terms give

$ parallel S_P \( x \) parallel_2 lt.eq parallel z parallel_2 lt.eq epsilon + 4 tau \( 1 - q \)^(1 \/ 2) . $

In the trace representation, a strong neighborhood can force $tau \( 1 - q \) < \( \( eta - epsilon \) \/ 4 \)^2$.
  The displayed estimate would then contradict the proposition’s lower bound $parallel S_P \( x \) parallel_2 >
  eta$, which holds for every such $P$. Thus its obstruction persists with the varying diagonals and compressions
  allowed here. The exponent in Theorem 1 is optimal, although its numerical constant is not optimized.

Theorem 1 controls a compression of the pinching of the original $x$.
  A separate expectation-free approximation-paving theorem instead supplies self-adjoint approximants $y$ near $x$
  strongly, with $parallel y parallel lt.eq 3 parallel x parallel$,
  and norm-paves them with error measured against $parallel y parallel$ [10] Theorem 1.1.
  Its arbitrary-masa conclusion has a finite $epsilon$-dependent count but states no quadratic rate.
  The two proofs are independent.

=== 1.2 Outline of the proof <outline-of-the-proof>

Let $p in A$ be the supremum of the supports of all normal positive functionals $rho$ satisfying $rho \( b z \) =
  rho \( z b \)$ for $b in A$ and $z in M$. After the finite vector tests are fixed,
  we choose one such support $e lt.eq p$ so that $p - e$ is small on those vectors.
  When $e eq.not 0$, the corner $e M e$ carries a faithful normal state central over $e A e$.
  On $\( 1 - p \) M \( 1 - p \)$, a symmetric Haagerup $L^2$ estimate and two randomizations give a paving with
  $O \( epsilon^(- 1) \)$ colors; a positive-cone overlap estimate converts the symmetric estimate into a
  compression of arbitrarily large prescribed state mass. The corner $p - e$ is discarded.
  Since $p$ and $e$ need not be central in $M$, the construction uses disjoint palettes on these corners so that
  pinching removes cross-corner terms and the counts add. A separable reduction on the faithful-state corner then
  permits measured-space methods. These reductions are proved in Section 2.

In the presence of this central state, let $N$ be the algebra generated by the partial normalizers of $A$.
  There are $phi$-preserving conditional expectations $E_A : M arrow.r A$ and $E_N : M arrow.r N$,
  and $A subset.eq N$ is Cartan. We use the decomposition

$ x - E_A x = \( E_N x - E_A x \) + \( x - E_N x \) . $

Section 3 proves a structural fact about the second term:
  for $y in ker E_N$, the positive map $f mapsto E_A \( y^(*) f y \)$ on $A$ is represented by an atomless kernel.
  This is the input needed to remove coincidences in the later moment transfer.

The Cartan term is treated on a relative Bernoulli extension of the measured equivalence relation representing $A
  subset.eq N$. Each relation class receives independent site labels.
  We construct a measurable coloring there that has uniform conditional color marginals and makes the pinched
  matrix small on any prescribed finite-radius ball with arbitrarily high probability. This is Theorem 18.
  Its proof occupies Sections 4–6.

The finite-dimensional input to this construction is the mixed determinantal bound of [15] Theorem 25.
  For a partial coloring, a real-rooted polynomial uses both signs of the matrix and shifts determined by the
  assigned sites; the sum of its positive roots is the total cost.
  At the chosen shift, the upper mixed bound makes the all-unassigned cost zero,
  while the lower comparison for the two signs makes excessive norm on a fully assigned finite set force positive
  cost. Rooted spectral measures allocate this cost to vertices,
  and a single-site assignment inequality controls its increase.
  For a nonsingular relation, an invariant lift with an extra real coordinate makes mass transport available.
  A deletion estimate controls large weights uniformly, so joint cutoff limits give homogeneous costs on the
  original probability space. Random assignment times produce a partial coloring of arbitrarily small total cost
  for which any prescribed ball is fully assigned with high probability.
  Completing the remaining sites preserves the estimate on those balls.
  The uniform cutoff estimates and the order of conditioning on the assignment times are part of the construction.

To combine the two operator terms, we place $M$ and the Bernoulli extension of $N$ in their amalgamated free
  product over $N$. Uniform conditional color marginals give a free compression bound on $ker E_N$,
  while the same color projections provide the Cartan estimate.
  Section 7 transfers each fixed mixed scalar moment from this model to actual projections of $A$.
  Its proof uses finite-symbol evaluation, modular analytic approximation,
  and a shortest-pair argument in cyclic words. The atomless kernels make the remaining collision terms vanish.

Finally, Section 8 converts the local Cartan estimates to bounded approximants by clipping,
  controls continuous calculus for the resulting varying sequences,
  and transfers a sufficiently high fixed moment. A spectral cut produces the required projection $q$.
  All approximation parameters are chosen after the number of colors, and the corner assembly completes Theorem 1.

=== 1.3 Conventions <conventions>

We allow zero projections in a partition and use $1$ also for the identity of a corner when that corner is
  regarded as an algebra. Except when restoring scale in the final proof,
  the operators to be paved are self-adjoint contractions. Maximal abelianness implies that $A$ is weakly closed
  and that $A' ∩ M = A$: its weak closure is abelian, and any self-adjoint element of the relative commutant could
  otherwise be adjoined. In particular, corners by projections in $A$ are again masas in the corresponding corners
  of $M$.

For a normal positive functional $phi$, write $parallel z parallel_phi = phi \( z^(*) z \)^(1 \/ 2)$.
  When $phi$ is a faithful normal state, its centralizer is the algebra of elements fixed by its modular
  automorphism group. Measurable statements are understood modulo null sets.
  Whenever a countable nonsingular relation is present, a null exceptional set can be enlarged to its null saturation.

== 2 Reduction to a faithful central state <sec:reductions>

We first remove the obstruction to using a normal conditional expectation:
  the original masa need not be the range of one. A normal positive functional $rho$ on $M$ is #emph[$A$-central] if

$ rho \( b z \) = rho \( z b \) wide \( b in A \, med z in M \) . $

The supremum $p$ of their support projections lies in $A$, as proved in the corner assembly below.
  Given finite vector tests, that assembly chooses one support $e lt.eq p$ so that $p -
  e$ acts arbitrarily small on those vectors. It uses a faithful central state on $e M e$,
  a direct randomization on $\( 1 - p \) M \( 1 - p \)$, and discards $p - e$.
  The projections $p$ and $e$ need not be central in $M$; disjoint palettes make the pinching remove all
  cross-corner terms, so the numbers of colors add. We then reduce the faithful-state case to separable predual.
  All these reductions retain a bound on the number of projections that is independent of the prescribed strong
  neighborhood.

=== 2.1 The part without central normal functionals <the-part-without-central-normal-functionals>

For the first reduction we use Haagerup’s $L^p$ spaces for an arbitrary von Neumann algebra,
  constructed with a normal semifinite faithful weight; see [5] Section 1.
  If $phi$ is a normal positive functional, its density $h_phi in
  L^1 \( M \)_(+)$ represents it under the isometric identification $L^1 \( M \) = M_(*)$.
  The pairing is denoted by $"Tr"$. The space $L^2 \( M \)$,
  with left and right multiplication and its positive cone, is a standard form of $M$.
  In particular its cone vector for $phi$ is $h_phi^(1 \/ 2)$.
  We use Hölder’s inequality, cyclicity of the $L^p$–$L^(p')$ pairing, and polar decomposition,
  whose partial isometry belongs to $M$.

The positive-cone estimate below is Haagerup’s standard-form inequality [4] Lemma 2.10;
  see also the earlier work of Powers and Størmer [14] Lemma 4.1 and Araki [2] Theorem 4(8), equation (5.10),
  and Section 8, Remark 2. We include its proof so that no faithfulness assumption on the two functionals is
  implicit. For normal positive $phi \, psi$,

#[#set math.equation(numbering: n => "(2.1)")
 $ parallel h_phi^(1 \/ 2) - h_psi^(1 \/ 2) parallel_2^2 lt.eq parallel phi -
   psi parallel . $ <eq:positive-cone-estimate>]

Indeed, put $xi_1 = h_phi^(1 \/ 2)$, $xi_2 = h_psi^(1 \/ 2)$ and $D = xi_1 - xi_2$.
  Its sign $s in M$ satisfies $parallel s parallel lt.eq 1$ and $s D = D s = \| D \|$.
  Writing $D = D_(+) - D_(-)$, cyclicity gives

$ "Tr" #scale(x: 120%, y: 120%)[\(] s \( h_phi - h_psi \) #scale(x: 120%, y: 120%)[\)] & =
  "Tr" #scale(x: 120%, y: 120%)[\(] s \( D xi_1 + xi_2 D \) #scale(x: 120%, y: 120%)[\)] =
  "Tr" #scale(x: 120%, y: 120%)[\(] \| D \| \( xi_1 + xi_2 \) #scale(x: 120%, y: 120%)[\)]\
 & = parallel D parallel_2^2 + 2 "Tr" \( D_(-) xi_1 \) + 2 "Tr" \( D_(+) xi_2 \) gt.eq parallel D parallel_2^2 . $

The last two pairings are nonnegative by self-duality of the positive cone,
  and the first expression is at most $parallel phi - psi parallel$.

#thm([Lemma 2.1.])[
  #emph[Let $A subset.eq M$ be a masa such that $M$ has no nonzero $A$-central normal positive functional.
    Let $x = x^(*) in M$ satisfy $parallel x parallel lt.eq 1$, and let $0 < epsilon < 1$.
    Put $r_(upright(p)) = ceil.l 4 \/ epsilon ceil.r$. For every normal state $phi$ on $M$ and every $rho >
    0$ there are a partition $p_1 \, dots.h \, p_(r_(upright(p)))$ in $A$, an $a =
    a^(*) in A$ with $parallel a parallel lt.eq 1$, and a projection $q in M$ such that
$ phi \( 1 - q \) < rho \, wide ∥q (sum_(i = 1)^(r_(upright(p))) p_i x p_i - a) q∥ lt.eq epsilon . $

]
] <lem:no-central>

#proof[
  Write $xi = h_phi^(1 \/ 2)$ and introduce the symmetric map
  $ T \( z \) = h_phi^(1 \/ 4) z h_phi^(1 \/ 4) : M arrow.r L^2 \( M \) . $
  It is bounded and takes weak-star convergence to weak convergence:
    testing against $zeta in L^2 \( M \)$ uses the $L^1$ element $h_phi^(1 \/ 4) zeta^(*) h_phi^(1 \/ 4)$.
    For a finite partition $P$ in $A$, the pinching $S_P = sum_(e in P) e \( thin dot.op thin \)
    e$ also acts on $L^2 \( M \)$. There it is an orthogonal projection.
    These projections decrease under refinement to the projection onto the $A$-central vectors.
    Such a vector must be zero: otherwise its left vector functional would be a nonzero $A$-central normal
    positive functional. To see centrality, move a unitary of $A$ from the left of the vector to its right,
    where it commutes with the left action of $M$. Consequently
  $ parallel S_P \( xi \) parallel_2 arrow.r 0 . $
  For $z in M$, cyclicity and Hölder’s inequality give
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_(e \, f in P) parallel T \( e z f \) parallel_2^2 =
     "Tr" #scale(x: 120%, y: 120%)[\(] z^(*) S_P \( xi \) z S_P \( xi \) #scale(x: 120%, y: 120%)[\)] lt.eq
     parallel z parallel^2 parallel S_P \( xi \) parallel_2^2 . $ <eq:symmetric-block-sum>]
  In particular $parallel T \( e z e \) parallel_2^2 lt.eq parallel e xi e parallel_2^2$ when $parallel z parallel
    lt.eq 1$.
  Fix $kappa > 0$ and a coarse partition $P_0$ with $parallel S_(P_0) \( xi \) parallel_2 < kappa$.
    A weak-star convergent subnet of $S_P \( x \)$, as $P$ refines $P_0$,
    has a self-adjoint contraction limit $b in A$: the limit commutes with every partition in $A$,
    hence belongs to the masa. Since the weak and norm closures of a convex subset of a Hilbert space agree,
    there are refinements $P^1 \, dots.h \, P^d$ of $P_0$ and probabilities $t_1 \, dots.h \, t_d$ such that
  $ ∥sum_(j = 1)^d t_j T \( S_(P^j) \( x \) \) - T \( b \)∥_2 < kappa . $
  For each $e in P_0$, independently choose $j_e$ with this distribution and use the partition $P^(j_e)$ inside
    $e$. The resulting partition $R$ refines $P_0$. The mean of $T \( S_R \( x \) \)$ is the displayed convex
    combination. Independence and Equation (2.2) bound its variance by
  $ sum_(e in P_0) parallel e xi e parallel_2^2 = parallel S_(P_0) \( xi \) parallel_2^2 < kappa^2 . $
  Thus one realization satisfies $parallel T \( S_R \( x \) - b \) parallel_2 < sqrt(2) kappa$.
  Now color the pieces of this fixed $R$ independently and uniformly with $r_(upright(p))$ colors,
    and let $S_(upright("col"))$ be the resulting color pinching. Its mean is
  $ bb(E) S_(upright("col")) \( x \) = x / r_(upright(p)) + (1 - 1 / r_(upright(p))) S_R \( x \) . $
  The indicators of equal colors for distinct unordered pairs of pieces are uncorrelated,
    even when the pairs share a piece. Applying $parallel u + v parallel_2^2 lt.eq 2 parallel u parallel_2^2 +
    2 parallel v parallel_2^2$ and Equation (2.2), the variance after applying $T$ is at most $2 parallel
    S_R \( xi \) parallel_2^2 < 2 kappa^2$. Therefore a coloring can be chosen so that the self-adjoint element
  $ y = S_(upright("col")) \( x \) - (1 - 1 / r_(upright(p))) b - x / r_(upright(p)) $
  satisfies $parallel T \( y \) parallel_2 < 2 sqrt(2) kappa$. Also $parallel y parallel lt.eq 2$.
    Since $kappa$ is arbitrary, this gives arbitrarily small symmetric seminorm with the number of colors already fixed.
  It remains to convert this seminorm into a large compression.
    Set $t = parallel T \( y \) parallel_2$ and $psi \( z \) = phi \( y^(*) z y \)$.
    Small $t$ need not control $parallel y parallel_phi$, so we first seek $q_0$ with both $phi \( 1 - q_0 \)$ and
    $psi \( q_0 \)$ small; these bounds will control $parallel q_0 y q_0 parallel_phi$ for the spectral cut.
    Polar decomposition gives $h_psi = y h_phi y^(*)$ and $h_psi^(1 \/ 2) =
    y xi u^(*)$ for a partial isometry $u in M$. Hence
  $ 0 lt.eq "Tr" \( xi h_psi^(1 \/ 2) \) lt.eq parallel xi y xi parallel_1 =
    parallel h_phi^(1 \/ 4) T \( y \) h_phi^(1 \/ 4) parallel_1 lt.eq t . $
  Here the first inequality uses the positive cone, and the last uses $parallel h_phi^(1 \/ 4) parallel_4 = 1$.
    Let $q_0$ support the positive part in the Jordan decomposition of $phi - psi$. Equation (2.1) implies
  #[#set math.equation(numbering: n => "(2.3)")
   $ phi \( 1 - q_0 \) + psi \( q_0 \) = frac(phi \( 1 \) + psi \( 1 \) - parallel phi - psi parallel, 2) lt.eq
     t . $ <eq:jordan-overlap>]
  Moreover
  $ parallel q_0 y q_0 xi parallel_2 lt.eq parallel q_0 y xi parallel_2 +
    parallel q_0 y \( 1 - q_0 \) xi parallel_2 lt.eq psi \( q_0 \)^(1 \/ 2) + 2 phi \( 1 - q_0 \)^(1 \/ 2) lt.eq
    3 sqrt(t) . $
  Inside $q_0 M q_0$, let $q$ be the spectral projection of $q_0 y
    q_0$ for $\[ - epsilon \/ 2 \, epsilon \/ 2 \]$. The spectral Markov inequality gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ phi \( 1 - q \) lt.eq phi \( 1 - q_0 \) + 4 / epsilon^2 phi \( \( q_0 y q_0 \)^2 \) lt.eq
     (1 + 36 / epsilon^2) t . $ <eq:symmetric-large-projection>]
  Taking $kappa$ sufficiently small makes this less than $rho$.
    With $a = \( 1 - 1 \/ r_(upright(p)) \) b$, we have $parallel a parallel lt.eq 1$ and
  $ parallel q \( S_(upright("col")) \( x \) - a \) q parallel lt.eq epsilon / 2 + 1 / r_(upright(p)) lt.eq
    frac(3 epsilon, 4) . $
  This proves the lemma. ◻
]

=== 2.2 Assembly of corners <assembly-of-corners>

#thm([Proposition 2.2.])[
  #emph[Fix $0 < epsilon < 1$ and an integer $R gt.eq 1$. Suppose that for every masa $A subset.eq
    M$ admitting a faithful $A$-central normal state $phi$, every self-adjoint contraction $x in M$,
    and every $rho > 0$, there exist a partition of $1$ into $R$ projections of $A$,
    a self-adjoint $a in A$ of norm at most one, and a projection $q in M$ with $phi \( 1 - q \) < rho$ and
$ ∥q (sum_(i = 1)^R p_i x p_i - a) q∥ lt.eq epsilon . $

 Then every masa in every represented von Neumann algebra has the strong-operator paving property of Theorem 1 at
   error $epsilon$, with
$ r = R + ceil.l 4 \/ epsilon ceil.r + 1 . $

 In particular this number is chosen before the finite vector set and the strong-neighborhood tolerance.]
] <prop:state-reduction>

#proof[
  Let $p$ be the supremum of the supports of the $A$-central normal positive functionals on $M$.
    Each support belongs to $A$, since conjugation by every unitary of $A$ preserves the functional and its
    support. These supports form a directed family: the support of a sum is the join of the supports.
    The corner $\( 1 - p \) M \( 1 - p \)$ has no nonzero $A \( 1 - p \)$-central normal positive functional,
    since compression would extend one to an $A$-central functional on $M$.
  Given a finite $F subset H$ and $delta > 0$, set
  $ chi \( z \) = sum_(xi in F) chevron.l z xi \, xi chevron.r . $
  Normality supplies a support $e lt.eq p$ in the directed family with $chi \( p - e \)$ as small as desired.
    On the nonzero corner $e M e$, the corresponding functional restricts, after normalization,
    to a faithful normal state central on $A e$.
  For any faithful normal state $omega$, small $omega$-mass on projections implies uniformly small mass for each
    fixed normal positive functional. Indeed, a contrary sequence in the positive unit ball would have a weak-star
    convergent subnet whose limit has zero $omega$-mass but positive mass for that functional.
    Faithfulness forces the positive limit to be zero, a contradiction.
    Apply the assumed result on $e M e$, using this observation to make the lost $chi$-mass small.
    On $\( 1 - p \) M \( 1 - p \)$ apply Lemma 3 to the normalized restriction of $chi$ if it is nonzero;
    otherwise take $q = 0$ on this corner. Empty corners require no construction.
  Use disjoint palettes for the two corner partitions, and the additional projection $p - e$ as the last piece.
    Take corner sums of the two diagonal terms and of the two large projections, with zero on $p - e$.
    Every pinching piece is supported in one of the three corners, so all off-corner terms of $x$ disappear.
    Thus the compressed operator norm is at most $epsilon$, and the diagonal norm is at most one.
    The choices can ensure $chi \( 1 - q \) < delta^2$, which gives
  $ parallel \( 1 - q \) xi parallel^2 lt.eq chi \( 1 - q \) < delta^2 wide \( xi in F \) . $
  Zero projections pad either palette when necessary. The total number is the stated $r$,
    independently of $F$ and $delta$. Scaling handles an arbitrary nonzero self-adjoint $x$; for $x =
    0$ the assertion is immediate. ◻
]

=== 2.3 State norm and separable reduction <state-norm-and-separable-reduction>

We now work with a faithful $A$-central normal state $phi$. Write

$ parallel z parallel_phi = phi \( z^(*) z \)^(1 \/ 2) \, wide M_phi = { b in M : phi \( b z \) =
  phi \( z b \) upright(" for all ") z in M } . $

The centralizer $M_phi$ is the fixed algebra of the modular group $sigma^phi$. In particular $A subset.eq M_phi$.
  We first obtain approximation by diagonal pinchings in the state norm,
  then use it to construct a separable inclusion containing the operator.

#thm([Lemma 2.3.])[
  #emph[Let $A subset.eq M$ be a masa and $phi$ a faithful $A$-central normal state.
    There is a faithful normal $phi$-preserving conditional expectation $E_A : M arrow.r A$.
    On bounded subsets of $M$, convergence to zero in $parallel dot.op
    parallel_phi$ is equivalent to strong convergence in the faithful GNS representation. For every $z in M$,
#[#set math.equation(numbering: n => "(2.5)")
 $ parallel S_P \( z \) - E_A \( z \) parallel_phi arrow.r 0 $ <eq:pinching-limit>]

 as the finite partitions $P$ of $A$ refine. The same conclusion holds along any increasing sequence of finite
   partitions generating $A$.]
] <lem:pinching>

#proof[
  Takesaki’s Conditional Expectation Theorem [17] applies because the modular group fixes $A$ pointwise;
    both the state and its restriction are faithful, normal, and finite. Let $Omega$ be the GNS state vector.
    It is separating and therefore cyclic for the commutant. If a bounded net $z_j$ satisfies $z_j Omega arrow.r
    0$, then $z_j c' Omega = c' z_j Omega arrow.r 0$ for every commutant element $c'$.
    Density and boundedness give strong convergence. The converse follows by testing on $Omega$.
  Since the partition projections lie in the centralizer, $S_P$ induces an orthogonal projection on the GNS space;
    equivalently, it is the state-preserving conditional expectation onto the commutant in $M$ of the projections
    of $P$. These Hilbert-space projections decrease under refinement.
    On the vector $z Omega$, let their limit be $eta$. A bounded weak-star cluster point $b$ of $S_P \( z \)$
    commutes with every partition of $A$ and hence lies in $A$. Its state vector is $eta$.
    Moreover $E_A S_P \( z \) = E_A \( z \)$, so $b = E_A \( z \)$. This proves Equation (2.5).
    If an increasing sequence generates $A$, its limit commutes with the generating projections,
    and the same argument applies. ◻
]

#thm([Lemma 2.4.])[
  #emph[Let $A subset.eq M$ be a masa with a faithful $A$-central normal state $phi$, and let $x = x^(*) in M$.
    There exist unital von Neumann subalgebras $A_0 subset.eq A$ and $M_0 subset.eq M$ such that $x in M_0$,
    $M_0$ has separable predual, $A_0$ is a masa in $M_0$, and $E_A \( M_0 \) subset.eq A_0$.
    The restriction of $phi$ is faithful, normal, and $A_0$-central.
    Thus a uniform faithful-state paving result for inclusions with separable predual implies the same result
    without that restriction.]
] <lem:separable-reduction>

#proof[
  Start with $D_1 = W^(*) \( 1 \, x \)$. Inductively, choose a countable $parallel dot.op
    parallel_phi$-dense subset $cal(D)_j$ of the unit ball of $D_j$.
    Such a set exists for every countably generated $D_j$: the separable C\*-algebra of its generators has dense
    state vectors by Kaplansky’s Density Theorem. Its GNS representation is faithful and normal on a separable
    Hilbert space, so $D_j$ has separable predual. Let $D_(j + 1)$ be generated by $D_j$,
    all $E_A \( z \)$ for $z in cal(D)_j$, and the projections of finite partitions $P \( z \, k \) subset A$ satisfying
  $ parallel S_(P \( z \, k \)) \( z \) - E_A \( z \) parallel_phi < 1 \/ k
    wide \( z in cal(D)_j \, med k gt.eq 1 \) . $
  Lemma 5 supplies these partitions. Only countably many generators have been added.
  Put $M_0 = W^(*) \( union.big_j D_j \)$ and let $A_0$ be generated unitally by all the adjoined elements of $A$.
    Bounded Kaplansky approximation by the union algebra, followed by approximation from the sets $cal(D)_j$,
    shows that their union is state-norm dense in the unit ball of $M_0$.
    Here one may first approximate in the norm closure of the union and then make a norm approximation and a
    harmless rescaling to preserve the bound. Since $E_A$ is state-norm contractive,
    every $E_A \( z \)$ for $z in M_0$ is a bounded state-norm limit of elements of $A_0$.
    Lemma 5 and strong closedness imply $E_A \( z \) in A_0$.
  If a unit-ball element $z in M_0$ commutes with $A_0$, each selected partition satisfies $S_P \( z \) = z$.
    For $z' in cal(D)_j$ and its selected partition $P = P \( z' \, k \)$, contractivity gives
  $ parallel z - E_A \( z \) parallel_phi lt.eq 2 parallel z - z' parallel_phi + parallel S_P \( z' \) -
    E_A \( z' \) parallel_phi . $
  The right side can be made arbitrarily small; faithfulness gives $z = E_A \( z \) in A_0$.
    Thus $A_0$ is maximal abelian in $M_0$. The algebra $M_0$ is countably generated and has separable predual by
    the same GNS argument. All the assertions about the restricted state are immediate.
    Any paving produced in $M_0$ has the same operator-norm bound and the same lost $phi$-mass when regarded in
    $M$. This is the faithful-state estimate required by Proposition 4. ◻
]

== 3 The normalizing algebra and atomless kernels <sec:kernels>

For the rest of the structural argument, $M$ has separable predual, $A subset.eq M$ is a masa,
  and $phi$ is a faithful $A$-central normal state. Lemma 6 permits these assumptions.
  We separate the algebra generated by normalizers from its orthogonal complement with respect to a
  state-preserving expectation. The former has a measured-relation description.
  On the latter, we prove that the positive maps $f mapsto E_A \( y^(*) f y \)$ have atomless kernels.
  This atomlessness will make fine-partition collision terms vanish in the moment comparison.

=== 3.1 Normalizers and the measured relation <normalizers-and-the-measured-relation>

A #emph[groupoid normalizer] of $A$ is a partial isometry $v in M$ such that $v^(*) v \, v v^(*) in A$ and

$ v A v^(*) = A v v^(*) \, wide v^(*) A v = A v^(*) v . $

Let $N$ be the von Neumann algebra they generate. For every such $v$,
  the modular transform $sigma_t^phi \( v \)$ induces the same isomorphism between the two corners of $A$,
  since $sigma_t^phi$ fixes $A$ pointwise. Consequently $v^(*) sigma_t^phi \( v \)$ is a unitary in $A v^(*) v$.
  These unitaries form a strongly continuous one-parameter group:
  the cocycle identity becomes the group identity because the modular group fixes $A v^(*) v$.
  Thus there is a positive nonsingular operator $h_v$ affiliated with $A v^(*) v$ such that

#[#set math.equation(numbering: n => "(3.1)")
 $ sigma_t^phi \( v \) = v h_v^(i t) wide \( t in bb(R) \) . $ <eq:normalizer-modular>]

In particular $N$ is invariant under $sigma^phi$. Takesaki’s Theorem [17] gives a faithful normal $phi$-preserving
  conditional expectation

$ E_N : M arrow.r N \, wide M^compose = ker E_N . $

The normalizers $v 1_(\[ - k \, k \]) \( log h_v \)$ are entire analytic for $sigma^phi$ and converge strongly-\*
  to $v$. Indeed Equation (3.1) extends on this cut to $v h_v^(i z) 1_(\[ - k \, k \]) \( log h_v \)$ for $z in
  bb(C)$, a norm-entire function.

Identify $A = L^oo \( X \, mu \)$ on a standard probability space, with $phi \|_A$ given by integration.
  A groupoid normalizer induces a measure-class preserving isomorphism between measurable subsets of $X$.
  Its restriction to the fixed points belongs to $A$. The remaining domain can be partitioned into countably many
  measurable pieces each disjoint from its image: use a countable family separating distinct points to obtain a
  countable cover by such pieces, and then disjointize the cover. On one piece let the cut normalizer be $v'$.
  Its initial and final projections are orthogonal, and

$ v' + v'^(*) + \( 1 - v'^(*) v' - v' v'^(*) \) $

is a unitary normalizer. Recovering $v'$ by a corner cut and summing strongly shows that full unitary normalizers
  also generate $N$. The pair $A subset.eq N$ is therefore Cartan:
  $A$ is maximal abelian, regular, and the range of the faithful normal expectation $E_A \|_N$.

The Feldman–Moore Representation Theorem [3] Theorem 1 realizes this pair as the algebra of a countable
  nonsingular measured equivalence relation $cal(R)$ on $\( X \, mu \)$, possibly twisted by a scalar $2$-cocycle.
  The separably acting hypothesis holds in the faithful state GNS representation.
  We use the right counting representation

#[#set math.equation(numbering: n => "(3.2)")
 $ L^2 \( cal(R) \, nu_(upright(r)) \) = integral_X^xor ell^2 \( \[ v \]_(cal(R)) \) thin d mu \( v \) \, wide
   integral f thin d nu_(upright(r)) = integral_X sum_(u tilde.op v) f \( u \, v \) thin d mu \( v \) .
   $ <eq:right-counting-space>]

Here $A$ acts diagonally by the function of the left site.
  With a normalized cocycle $s$, a kernel $a$ acts in the fiber rooted at $v$ by the matrix

$ \( a \( u \, w \) s \( u \, w \, v \) \)_(u \, w in \[ v \]_(cal(R))) . $

The identity

$ s \( u \, w \, v \) s \( u \, v \, v' \) = s \( u \, w \, v' \) s \( w \, v \, v' \) $

shows that rerooting identifies these matrices by diagonal unitary conjugacy.
  Thus their norms and their conjugacy-invariant principal matrix data do not depend on the chosen root.

Partial isomorphisms with graphs in $cal(R)$ lift to kernel groupoid normalizers.
  Their finite sums with bounded base coefficients form a weakly dense \*-algebra, denoted $N_(upright("alg"))$;
  see [3] Section 2. The canonical expectation to $A$ takes the diagonal. It agrees with $E_A \|_N$:
  on the fixed part of a normalizer both maps retain its diagonal value,
  and on pieces with disjoint initial and final supports both vanish by $A$-bimodularity.
  The identity extends by normality. Therefore $phi \|_N$ is diagonal integration,
  represented in Equation (3.2) by the unit site vectors $delta_v$.
  All data are understood modulo null sets, with Borel versions on standard spaces.
  Countably many null exceptions may be discarded along with their relation saturation,
  which remains null by nonsingularity.

=== 3.2 A type I observation <a-type-i-observation>

The kernel proof will produce an intertwiner whose initial projection is not yet known to belong to $A$.
  The following observation is the step that turns this intertwiner into a groupoid normalizer.
  Its state hypothesis excludes the diffuse masas that can occur in a type I algebra without a normal conditional
  expectation. The importance of that expectation hypothesis is also reflected in the type I criterion of [1]
  Theorem 4.1; we prove the precise normalizer and abelian-projection consequences needed here.

#thm([Lemma 3.1.])[
  #emph[Let $D$ be a type I von Neumann algebra with separable predual, and let $C subset.eq D$ be a masa.
    Suppose $D$ admits a faithful $C$-central normal state. Then the groupoid normalizers of $C$ generate $D$.
    Every abelian projection of $D$ is Murray–von Neumann equivalent in $D$ to a projection of $C$.]
] <lem:type-i-normalizers>

#proof[
  Use the standard direct integral decomposition of a type I algebra over its center into full operator algebras;
    see [6] Sections 6.6 and 14.1–14.2. Integrating ordinary fiber traces against a probability measure in the
    center measure class gives a faithful normal semifinite trace $tau$.
    The given state has a positive trace density $h$ of full support, with $tau \( h \) = 1$;
    this is the predual identification in the semifinite case [5] Proposition 1.5 and Theorem 2.1.
    Every unitary of $C$ preserves the state and hence its density.
    Thus $h$ commutes with $C$ in the affiliated-operator sense,
    and its spectral projections belong to $C$ by maximal abelianness. The increasing projections
  $ f_n = 1_(\[ 1 \/ n \, oo \)) \( h \) \, wide n gt.eq 1 \, $
  exhaust $1$ and satisfy $tau \( f_n \) lt.eq n$. Their successive differences form a countable partition of $1$
    in $C$ into trace-finite projections. Such a projection has finite rank almost everywhere in the type I
    fibers. Split it further by central projections according to its rank.
    Each resulting corner is a measurable field of fixed finite matrix size, with its compressed $C$ a masa.
  We justify explicitly the measurable diagonalization needed in these finite corners.
    Trivialize the finite-rank field and choose countably many commuting self-adjoint measurable matrix fields
    generating the compressed $C$. In each fiber, the algebras generated by the first $j$ fields eventually equal
    the algebra generated by the whole list, since their dimensions are nondecreasing bounded integers.
    The first index attaining the limiting dimension is measurable:
    each finite dimension is determined by ranks of finite lists of polynomial matrices,
    and the limiting dimension is their countable supremum. Split the center according to this first index.
    On each piece, successive eigenspace decompositions measurably diagonalize the finite commuting list.
    Ordered eigenvalues give measurable spectral projections,
    and Gram–Schmidt applied to fixed coordinate vectors gives measurable orthonormal bases of their ranges.
    The resulting rank-one projection fields commute with all generators, not just the chosen initial list.
    As bounded elements of the ambient field algebra, they therefore belong to the masa.
  We have obtained countably many rank-one fields $e_j in C$, allowing zero outside their central domains,
    with $sum_j e_j = 1$. On $e_j D e_j$ the algebra $C e_j$ consists precisely of the center scalars over that
    domain, since the center of $D$ is contained in $C$. Measurable matrix units between $e_j$ and $e_k$ on their
    common central domain therefore partially normalize $C$. These matrix units and center coefficients generate
    $D$: compress a bounded field first by finite sums of the $e_j$, express its matrix entries using these units,
    and pass to the strong limit.
  Finally, an abelian projection $e in D$ has rank one almost everywhere on its central support $z$.
    Choose, fiber by fiber on $z$, the first nonzero $e_j$ from the countable decomposition.
    This gives a projection $e' in C$ with the same central support and rank.
    Measurable unit vectors spanning the ranges of $e$ and $e'$ give a partial isometry $w in D$ with $w w^(*) =
    e$ and $w^(*) w = e'$. The assertion also holds for $e = 0$. ◻
]

=== 3.3 Atomless kernels off the normalizing algebra <atomless-kernels-off-the-normalizing-algebra>

A positive kernel on $X$ means a measurable family of finite positive Borel measures $K \( v \, d u \)$.
  It represents a positive normal map $K : A arrow.r A$ if

$ \( K f \) \( v \) = integral_X f \( u \) thin K \( v \, d u \) wide \( f in L^oo \( X \, mu \) \) \, $

where for each fixed $mu$-null Borel set $S$, $K \( v \, S \) = 0$ for almost every $v$.
  This condition makes the formula well defined on equivalence classes;
  it does not assert that every row measure is absolutely continuous with respect to $mu$.

#thm([Proposition 3.2.])[
  #emph[In the setting of this section, for every $y in M^compose$ the map
$ K_y \( f \) = E_A \( y^(*) f y \) \, wide f in A \, $

 has a positive kernel whose mass is at most $parallel y parallel^2$ and which is atomless for almost every output
   point $v in X$. For $k gt.eq 1$ and $y_1 \, dots.h \, y_k in M^compose$, the composition $K_(y_1) compose
   dots.h.c compose K_(y_k)$ has a positive kernel whose mass is at most $product_(j = 1)^k parallel y_j
   parallel^2$ and which is atomless almost everywhere. If $p_(upright("at")) in
   A$ is the projection of the atomic part of $A$, then
$ p_(upright("at")) y = y p_(upright("at")) = 0 wide \( y in M^compose \) . $

]
] <prop:atomless-kernels>

#proof[
  Let $Omega$ be the standard state vector for $phi$. The commuting left and right actions of $A$ have a joint
    spectral measure on $X times X$ on the vector $y Omega$. Since $A subset.eq M_phi$,
    the right action of $f in A$ on this vector is $y f Omega$. Thus the joint vector measure $lambda$ satisfies
  #[#set math.equation(numbering: n => "(3.3)")
   $ lambda \( S times T \) = phi \( y^(*) 1_S y 1_T \) = integral_T E_A \( y^(*) 1_S y \) thin d mu
     $ <eq:joint-kernel-measure>]
  for Borel $S \, T subset.eq X$. Disintegrating relative to the right coordinate gives a kernel for $K_y$ with
    mass $E_A \( y^(*) y \) \( v \) lt.eq parallel y parallel^2$.
    Choose a Borel version and set its rows to zero on a Borel null exceptional set so that this mass bound holds
    for every row. For every fixed $mu$-null $S$, Equation (3.3) gives $K_y \( v \, S \) = 0$ almost everywhere.
    This construction uses the joint spectral measure and does not require product-measure absolute continuity.
  Suppose this kernel is not almost everywhere atomless. The function $\( v \, u \) mapsto
    K_y \( v \, { u } \)$ is measurable: express it as the decreasing limit of the masses of the pieces containing
    $u$ in an increasing sequence of finite Borel partitions that separates points.
    For some integer $k gt.eq 1$, the Borel set where this function is at least $1 \/
    k$ has finite vertical sections and a projection of positive measure.
    The Lusin–Novikov Theorem [7] Theorem 18.10 supplies a measurable selection $s : T arrow.r
    X$ on a positive-measure Borel set $T$ such that
  #[#set math.equation(numbering: n => "(3.4)")
   $ K_y \( v \, { s \( v \) } \) gt.eq 1 \/ k wide \( v in T \) . $ <eq:selected-atom>]
  For a fixed $mu$-null Borel set $S$, this implies
  $ mu \( { v in T : s \( v \) in S } \) lt.eq k integral_T K_y \( v \, S \) thin d mu \( v \) = 0 . $
  Consequently
  $ theta \( f \) = 1_T \( f compose s \) : A arrow.r A 1_T $
  is a well-defined unital \*-homomorphism into the corner. It is normal:
    the pushforward under $s$ of any finite measure with an $L^1$ density on $T$ is absolutely continuous with
    respect to $mu$, and its Radon–Nikodym density gives the preadjoint of $theta$.
  Choose increasing finite Borel partitions $P_j$ of $X$ which generate $A$ and separate points, and put
  #[#set math.equation(numbering: n => "(3.5)")
   $ b_j = sum_(e in P_j) e y theta \( e \) . $ <eq:graph-intertwiner-cuts>]
  The left support projections and the right support projections are orthogonal families,
    so $parallel b_j parallel lt.eq parallel y parallel$. Also $E_N \( b_j \) = 0$ by $N$-bimodularity of $E_N$.
    Their state vectors are the decreasing joint projection cuts of $y
    Omega$ to the sets where the left coordinate and $s$ of the right coordinate lie in the same piece of $P_j$,
    with the right coordinate in $T$. Their limit $eta$ therefore satisfies
  $ parallel eta parallel^2 = integral_T K_y \( v \, { s \( v \) } \) thin d mu \( v \) > 0 . $
  A weak-star convergent subnet of the bounded $b_j$ has a limit $b in M^compose$ with $b Omega = eta$.
    Indeed testing the vectors against $z Omega$, $z in M$, gives the normal functionals $phi \( z^(*) b_j \)$,
    so their vector and weak-star limits agree. In particular $b eq.not 0$. We have $b = b 1_T$ and
  #[#set math.equation(numbering: n => "(3.6)")
   $ f b = b theta \( f \) wide \( f in A \) . $ <eq:graph-intertwiner>]
  For partition step functions this follows from refinement in Equation (3.5);
    bounded strong approximation and normality of $theta$ extend it to all $f in A$.
  We show that Equation (3.6) forces $b in N$. Write its polar decomposition as $b = u \| b \|$.
    The intertwining relations imply
  $ \| b^(*) \| in A \, wide f u = u theta \( f \) quad \( f in A \) \, wide e := u^(*) u in D :=
    theta \( A \)' ∩ 1_T M 1_T . $
  Indeed $b b^(*)$ commutes with $A$, while $b^(*) b$ commutes with $theta \( A \)$,
    and polar decomposition preserves the resulting intertwining relation.
    For $d in e D e$, the element $u d u^(*)$ commutes with $A$ and belongs to $M$, so lies in $A$.
    It follows that $e$ is an abelian projection in $D$. Let $z$ be its central support in $D$.
    The abelian-projection characterization of type I algebras [6] Sections 6.4–6.6 shows that $D z$ is type I:
    every nonzero central part of $D z$ meets $e$ and hence contains a nonzero abelian projection.
    Moreover $A 1_T$ is a masa in $D$, so its center, and in particular $z$, belongs to $A 1_T$.
  The restricted state on $D z$, after normalization, is faithful, normal, and central on the masa $A z$.
    By Lemma 7, the algebra $D z$ is generated by groupoid normalizers of $A z$.
    These also normalize $A$ partially: their supports lie in $A z$,
    and every element of $A$ restricts on $z$ to an element of $A z$. Therefore $D z subset.eq N$.
    The same lemma supplies $w in D z$ and $e' in A z$ with
  $ w w^(*) = e \, wide w^(*) w = e' . $
  Set $v = u w$. Its range projection $u u^(*) = "supp" \| b^(*) \|$ and its initial projection $e'$ belong to
    $A$. Since $w$ commutes with $theta \( A \)$,
  $ v^(*) A v = w^(*) u^(*) A u w = theta \( A \) e' subset.eq A e' . $
  The left side is a masa in $e' M e'$, by conjugating the masa on the range corner with $v$.
    Hence the inclusion is equality, and $v$ is a groupoid normalizer of $A$. We conclude
  $ u = v w^(*) in N \, wide b = \| b^(*) \| u in N \, $
  contrary to $0 eq.not b in ker E_N$. The kernel is therefore atomless almost everywhere.
  For the composition assertion, let $K_1 \, K_2$ be two of the kernels.
    Choose one fixed $mu$-null Borel set $S_0$ outside which every row of $K_2$ is atomless.
    For almost every $v$, $K_1 \( v \, S_0 \) = 0$. For each such $v$ the measure
  $ \( K_1 compose K_2 \) \( v \, E \) = integral_X K_2 \( u \, E \) thin K_1 \( v \, d u \) $
  vanishes on every singleton $E$; the conclusion holds for all singletons simultaneously because the integrand
    row measures are atomless off $S_0$. The mass bound and the fixed-null-set property also pass to this
    composition. Iteration proves the assertion for any finite composition.
  Finally the atomic part of the standard probability space can be represented by a countable set of positive-mass
    points. Atomlessness gives $E_A \( y^(*) p_(upright("at")) y \) = 0$;
    faithfulness then gives $p_(upright("at")) y = 0$. Applying the same argument to $y^(*) in M^compose$ gives $y
    p_(upright("at")) = 0$. ◻
]

== 4 Finite polynomials and the cost of assigning a color <sec:polynomials>

We develop a finite-dimensional estimate for assigning colors to the sites of a Hermitian matrix.
  The polynomial associated with a partial coloring will average over the remaining color choices and over
  independent signs. We use the sum of the positive roots after a negative diagonal shift as a cost.
  Assigning a color restricts the average and makes the shift more negative at the chosen site;
  we will show that some color increases this cost by at most a fixed multiple of a quantity attached to that
  site. The locality and uniform bounds proved alongside this estimate will permit its use on measured graphs.

=== 4.1 Finite data and mixed determinantal bounds <finite-data-and-mixed-determinantal-bounds>

Fix a finite set $I$, a zero-diagonal Hermitian matrix $T = \( T_(u v) \)_(u \, v in I)$ with $parallel T parallel
  lt.eq 1$, an integer $r gt.eq 1$, and $t > 0$. Throughout the coloring argument we use

$ beta = 80 . $

A partial coloring is a function $c : I arrow.r { 0 \, 1 \, dots.h \, r }$, where $0$ means unassigned.
  Give each site a weight $W_v > 0$, and put

$ tau_v = cases(delim: "{", t \, & c \( v \) = 0 \,, beta t \, & c \( v \) > 0 \,) wide a_v = tau_v W_v . $

At site $v$, the allowed pairs of color and sign are

$ cal(A)_v =
  cases(delim: "{", { 1 \, dots.h \, r } times { + 1 \, - 1 } \, & c \( v \) = 0 \,, { c \( v \) } times { +
  1 \, - 1 } \, & c \( v \) > 0 .) $

Choose a pair $omega_v$ uniformly from $cal(A)_v$, independently over sites, and write $k_v = \| cal(A)_v \|$.
  For $j = \( i \, sigma \) in { 1 \, dots.h \, r } times { + 1 \, - 1 }$, set

$ U_j = { v in I : j in cal(A)_v } \, wide B_j = sigma D_W T D_W - "diag" \( a_v \)_(v in I) \, wide D_W =
  "diag" \( sqrt(W_v) \)_(v in I) . $

For a realization $omega$, let $I_j \( omega \) = { v : omega_v = j }$.
  Its outcome matrix is the direct sum of the principal matrices $B_j \|_(I_j \( omega \))$,
  placed on these subsets of $I$; its entries between different subsets are zero. Denote this matrix by $B_omega$.
  With $Z = "diag" \( z_v \)_(v in I)$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ P_I \( Z \) = bb(E)_omega det \( Z - B_omega \) \, wide P_I \( z \) =
   P_I \( z \, dots.h \, z \) . $ <eq:poly-definition>]

We write $P = P_I$ when $I$ is fixed. Restriction to a subset always means principal restriction of all the finite
  data, with the same laws at the remaining sites. In particular $P_(- v) = P_(I \\ { v })$, and $P_diameter = 1$.
  These conventions also apply to all polynomials introduced below.

We shall use the following two bounds from mixed determinantal polynomial theory.
  We state their precise normalization because both signs of $T$ will enter our application.

#thm([Lemma 4.1.])[
  (Mixed determinantal bounds).  #emph[For a $k$-tuple of Hermitian matrices $A_1 \, dots.h \,
    A_k$ on a common nonempty finite set, let
$ chi \[ A_1 \, dots.h \, A_k \] \( z \) = bb(E) product_(j = 1)^k det \( z I - A_j \|_(S_j) \) \, $

 where each site is independently assigned uniformly to one of the $k$ sets $S_j$,
   and the determinant of an empty matrix is $1$. This polynomial is real-rooted.
   If $k gt.eq 2$ and the $A_j$ are zero-diagonal contractions, then
#[#set math.equation(numbering: n => "(4.2)")
 $ lambda_max chi \[ A_1 \, dots.h \, A_k \] < frac(3 sqrt(2), sqrt(k)) . $ <eq:poly-mixed-upper>]

 For any zero-diagonal Hermitian matrix $L$, without a norm restriction,
#[#set math.equation(numbering: n => "(4.3)")
 $ lambda_max chi \[ L \, - L \] gt.eq frac(parallel L parallel, 2) . $ <eq:poly-mixed-lower>]

 Consequently, on a nonempty finite set, if every site is unassigned,
   the unit-weight polynomial without diagonal shifts has largest root $< 3 \/ sqrt(r)$.
   If every site is assigned, that unit-weight unshifted polynomial is
$ product_(i = 1)^r chi \[ T \|_(c^(- 1) \( i \)) \, - T \|_(c^(- 1) \( i \)) \] \, $

 where factors on empty color classes are $1$.]
] <lem:mixed-bounds>

#proof[
  The normalization agrees with Definition 5 of [15]. Real-rootedness is part of the mixed determinantal theory
    and also follows from Lemma 10 below. Equation (4.2) is [15] Theorem 25,
    whose hypotheses are zero-diagonal Hermitian contractions and $k gt.eq 2$.
  By [15] Proposition 16 and Theorem 15, for a tuple of zero-diagonal Hermitian matrices,
    replacing one member by zero cannot increase its largest root. Expansion in principal minors gives
  $ chi \[ L \, 0 \] \( z \) = det \( z I - L \/ 2 \) : $
  a fixed principal minor on $S$ occurs with probability $2^(- \| S \|)$.
    Applying monotonicity while retaining either $L$ or $- L$ proves Equation (4.3).
    The all-unassigned case uses the tuple containing $r$ copies each of $T$ and $- T$, so $k = 2 r$.
    For a fully assigned coloring, independence between the color classes gives the stated factorization. ◻
]

=== 4.2 Stable quotients and rooted spectral measures <stable-quotients-and-rooted-spectral-measures>

The next lemma provides the interlacing needed to measure the effect of one site.
  Its half-plane assertion also allows non-Hermitian matrices:
  this extension will later control analytic perturbations of the data.
  For a matrix $B$, write $"Im" B = \( B - B^(*) \) \/ \( 2 i \)$.

#thm([Lemma 4.2.])[
  (Polynomial quotients).  #emph[For the finite data above,
#[#set math.equation(numbering: n => "(4.4)")
 $ P_I \( Z \) = (product_(v in I) frac(1, k_v !) partial_(z_v)^(thin k_v - 1)) product_j det
   #scale(x: 120%, y: 120%)[\(] \( Z - B_j \) \|_(U_j) #scale(x: 120%, y: 120%)[\)] \, wide partial_(z_v) P_I =
   P_(- v) . $ <eq:poly-differential>]

 More generally, use any matrices $B_j$ on $U_j$ in the same independent-choice construction.
   If $"Im" B_j lt.eq h I$ for a real number $h$, then $P_I \( Z \)$ and every deletion polynomial are nonzero
   whenever $"Im" z_v > h$ at every remaining site. In this region,
#[#set math.equation(numbering: n => "(4.5)")
 $ "Im" frac(P_I \( Z \), P_(- v) \( Z \|_(I \\ { v }) \)) gt.eq "Im" z_v - h . $ <eq:poly-half-plane>]

]
  #emph[Return to the Hermitian data in Equation (4.1). For $v in I$, set
$ Q_v = P_(- v) \, wide F_v \( z \) = frac(P_I \( z \), Q_v \( z \)) \, wide G_v \( z \) =
  frac(Q_v \( z \), P_I \( z \)) . $

 These rational functions are analytic in the upper half-plane, and
#[#set math.equation(numbering: n => "(4.6)")
 $ F_v \( z \) = z + a_v - sum_lambda frac(b_(v \, lambda), z - lambda) \, wide b_(v \, lambda) gt.eq 0 \,
   $ <eq:poly-arrow-quotient>]

 where $lambda$ ranges over the distinct roots of $Q_v$. Let $Lambda_v$ be the diagonal matrix listing those roots
   with multiplicity. There is a vector $g_v$, with squared coordinate $b_(v \, lambda)$ on one copy of each
   $lambda$ and zero on its other copies, such that
#[#set math.equation(numbering: n => "(4.7)")
 $ H_v = mat(delim: "(", - a_v, g_v^(*); g_v, Lambda_v) $ <eq:poly-arrow>]

 has characteristic polynomial $P_I$. Its first-coordinate spectral measure $rho_v$ is a probability measure satisfying
#[#set math.equation(numbering: n => "(4.8)")
 $ G_v \( z \) = integral_(bb(R)) frac(1, z - x) thin rho_v \( d x \) \, wide sum_(v in I) rho_v =
   sum_(P_I \( x \) = 0) delta_x . $ <eq:poly-root-measures>]

 The roots on the right are counted with multiplicity, and $Q_v$ interlaces $P_I$.]
] <lem:polynomial-quotients>

#proof[
  Each determinant factor is affine in any of its diagonal variables.
    When differentiating $k_v - 1$ times in $z_v$, every surviving Leibniz term leaves $v$ in exactly one of its
    $k_v$ available factors and deletes it from the others. The multiplicity $\( k_v - 1 \) !$,
    divided by $k_v !$, gives probability $1 \/ k_v$. Processing all vertices gives the outcome average,
    and differentiation once more in $z_v$ deletes that site.
    This proves Equation (4.4), including for the more general matrices.
  If $"Im" z_v > h$, each matrix $Z - B_j$ on $U_j$ has strictly positive imaginary part and is invertible.
    Its determinant is therefore nonzero. Differentiation preserves nonvanishing in the specified half-plane by
    the Gauss–Lucas Theorem. Here the degree cannot drop at a specialization of the other variables:
    after any subset of the vertex operations has been performed,
    the leading coefficient of degree $k_v$ in an unprocessed variable $z_v$ is the corresponding partially
    processed expression with $v$ deleted. Induct simultaneously over the processed vertices and all principal
    restrictions. That leading coefficient is nonzero by the induction hypothesis,
    so every required derivative has its indicated degree and is nonzero in the half-plane.
    This also proves the assertion for all deletion polynomials.
  For fixed other coordinates in that region, $P_I \/ P_(- v) = z_v + zeta_0$,
    by the derivative identity and multiaffineness. Its zero has imaginary part at most $h$. This gives Equation (4.5).
  For Hermitian data, the uniform-variable polynomials have real coefficients;
    half-plane nonvanishing and conjugation therefore show that all their roots are real.
    Equation (4.5) with $h = 0$ implies that $F_v \( z \) - z$ has nonnegative imaginary part.
    Its constant at infinity is $a_v$, since every outcome has $v$ diagonal $- a_v$.
    A nonremovable real pole of a real rational function with nonnegative imaginary part must be simple with
    nonpositive residue: approach the pole from different angles in the upper half-plane to exclude higher orders,
    and then approach vertically to determine the sign. This proves Equation (4.6).
  The Schur complement of $z - Lambda_v$ in $z - H_v$ is $F_v \( z \)$.
    Thus $det \( z - H_v \) = Q_v \( z \) F_v \( z \) = P_I \( z \)$,
    and its first resolvent entry is $1 \/ F_v \( z \) = G_v \( z \)$.
    The spectral theorem proves the first identity in Equation (4.8),
    and principal-matrix interlacing proves the interlacing assertion.
    Finally, uniform specialization of Equation (4.4) gives
  $ sum_(v in I) G_v \( z \) = frac(P'_I \( z \), P_I \( z \)) . $
  The right side is the Cauchy transform of the root-counting measure.
    Uniqueness of partial fractions proves the second identity in Equation (4.8). ◻
]

We will compare two modifications at an unassigned site $v$.
  For $i in { 1 \, dots.h \, r }$, first condition its pair on color $i$,
  keeping both signs uniformly distributed and retaining its shift $tau_v = t$.
  Denote the resulting polynomial and quotient by $P_(v \, i)^0$ and $F_(v \, i)^0 = P_(v \, i)^0 \/ Q_v$.
  Next increase that site’s shift to $beta t$, as required by a permanent assignment.
  Denote these by $P_(v \, i)$ and $F_(v \, i)$. All other site data remain fixed,
  and deletion of $v$ gives the same polynomial $Q_v$ in each case. Consequently

#[#set math.equation(numbering: n => "(4.9)")
 $ 1 / r sum_(i = 1)^r F_(v \, i)^0 = F_v \, wide F_(v \, i) =
   F_(v \, i)^0 + \( beta - 1 \) t W_v . $ <eq:poly-options>]

The arrow representation and rooted measures apply to these modified data as well.
  In particular the residues of $F_(v \, i)^0$ are nonnegative and average to the residues of $F_v$.

=== 4.3 Positive-root costs and locality <positive-root-costs-and-locality>

For a monic real-rooted polynomial $P$, define

$ s \( P \) = sum_(P \( x \) = 0) x_(+) \, wide x_(+) = max { x \, 0 } \, wide s \( 1 \) = 0 . $

The roots in this sum are counted with multiplicity. For the finite site data,
  define the rooted cost and the deletion increment by

#[#set math.equation(numbering: n => "(4.10)")
 $ m_v = integral x_(+) thin rho_v \( d x \) \, wide d_v = s \( P_I \) - s \( P_(- v) \) . $ <eq:poly-costs>]

Thus $sum_v m_v = s \( P_I \)$. Superscripts $0 \, i$ and $i$ will indicate, respectively,
  the conditioned and permanently assigned options at $v$. For example, $d_v^(thin i) = s \( P_(v \, i) \) -
  s \( Q_v \)$.

The initial shift $t > 3 \/ sqrt(r)$ gives zero cost before any assignment.
  For a fully assigned block, excessive pinched norm forces positive cost.
  The following finite statement makes these two roles precise.

#thm([Lemma 4.3.])[
  (Initial cost and detection of excessive norm).  #emph[For the finite data of this section, the following hold.]
  + #emph[If every site is unassigned and $t > 3 \/ sqrt(r)$, then $P_I \( x \) > 0$ for every $x gt.eq 0$,
    and $s \( P_I \) = 0$. This includes $I = diameter$, with $P_diameter = 1$.]
  + #emph[Suppose $I eq.not diameter$ and every site is assigned, and put
$ T_c = sum_(i = 1)^r 1_({ c = i }) T 1_({ c = i }) . $

 For every $alpha > 0$, if $parallel T_c parallel > 2 beta t + alpha$, then
$ lambda_max P_I gt.eq alpha / 2 min_(v in I) W_v \, wide s \( P_I \) gt.eq alpha / 2 min_(v in I) W_v . $

]
] <lem:finite-cost-endpoints>

#proof[
  For $J subset.eq I$, let $P_J^(upright("un")) \( Z \)$ be the expected polynomial with the same pair laws,
    all weights equal to one, and all diagonal shifts removed.
    Factoring the weight matrix from every outcome determinant gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ P_J \( x \) = (product_(v in J) W_v) P_J^(upright("un"))
     #scale(x: 120%, y: 120%)[\(] \( tau_v + x \/ W_v \)_(v in J) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:poly-remove-weights>]
  Both sides equal one for $J = diameter$. We also use the following consequence of multiaffineness and the
    deletion identity in Equation (4.4). For real coordinates $b = \( b_v \)_(v in I)$ and increments $h_v gt.eq 0$,
  $ P_J^(upright("un")) \( \( b + h \) \|_J \) = sum_(S subset.eq J)
    P_(J \\ S)^(upright("un")) \( b \|_(J \\ S) \) product_(v in S) h_v . $
  Thus positivity of all principal evaluations at $b$ is preserved when any coordinates are increased.
  If every site is unassigned and $t > 3 \/ sqrt(r)$, Lemma 9 puts $t$ strictly above the largest root of every
    nonempty $P_J^(upright("un")) \( z \)$. All principal evaluations at the common coordinate $t$ are therefore
    positive. For $x gt.eq 0$, the coordinates $t + x \/ W_v$ in Equation (4.11) are at least $t$,
    so $P_I \( x \) > 0$. Real-rootedness then gives $s \( P_I \) = 0$.
  Now suppose every site is assigned and $parallel T_c parallel > 2 beta t + alpha$.
    The fully assigned factorization and the lower bound in Lemma 9 show that $P_I^(upright("un")) \( z \)$ has a
    root greater than $beta t + alpha \/ 2$. Set $x_0 = \( alpha \/ 2 \) min_(v in I) W_v > 0$.
    If the largest root of $P_I$ were smaller than $x_0$, repeated interlacing would put $x_0$ strictly above
    every root of every nonempty principal restriction. Thus $P_J \( x_0 \) > 0$ for all $J subset.eq I$.
    By Equation (4.11), all the corresponding unweighted principal evaluations are positive at
  $ b_v = beta t + x_0 \/ W_v lt.eq beta t + alpha \/ 2 . $
  Increasing these coordinates to any common value $q gt.eq beta t + alpha \/ 2$ preserves that positivity.
    In particular $P_I^(upright("un")) \( q \) > 0$ for every such $q$, contradicting the root above $beta t +
    alpha \/ 2$. Hence the largest root of $P_I$ is at least $x_0$,
    which also gives the stated lower bound for $s \( P_I \)$. ◻
]

#thm([Lemma 4.4.])[
  (Deletion costs and their tails).  #emph[For the finite Hermitian data above, let $n_P \( x \) = \# { lambda :
    P \( lambda \) = 0 \, med lambda > x }$, with multiplicity. Then, for every $v in I$,
#[#set math.equation(numbering: n => "(4.12)")
 $ 0 & lt.eq n_(P_I) \( x \) - n_(Q_v) \( x \) lt.eq 1 \,\
d_v & = integral_0^oo \( n_(P_I) - n_(Q_v) \) \( x \) thin d x \,\
integral_B^oo \( n_(P_I) - n_(Q_v) \) \( x \) thin d x & lt.eq
  2 integral \( x - B \)_(+) thin rho_v \( d x \) + \( a_v + B \) rho_v \( \( B \, oo \) \) \, wide B gt.eq
  0 . $ <eq:poly-interlacing-count>]

 In particular $0 lt.eq d_v lt.eq 2 m_v + a_v$. All these conclusions hold for either modification at $v$,
   with its own shift and rooted measure.]
] <lem:positive-cost>

#proof[
  Equation (4.12) follows from the principal interlacing in Lemma 10; integration gives Equation (4.12).
    To prove the tail estimate, write $H = H_v$, $Lambda = Lambda_v$, $a = a_v$, and $L = H - B I$.
    Let $E$ be the first-coordinate projection, $D = 1 - E$, and $R = 1_(\( 0 \, oo \)) \( L \)$.
    The compression $D R D$ is a positive contraction on the deletion coordinates.
    The variational formula for the positive trace therefore gives
  $ "Tr" \( Lambda - B I \)_(+) gt.eq "Tr" #scale(x: 120%, y: 120%)[\(] \( Lambda - B I \) D R D
    #scale(x: 120%, y: 120%)[\)] . $
  Since $L - D L D = E L + L E - E L E$, it follows that
  $ "Tr" \( H - B I \)_(+) - "Tr" \( Lambda - B I \)_(+) & lt.eq
    "Tr" #scale(x: 120%, y: 120%)[\(] \( E L + L E - E L E \) R #scale(x: 120%, y: 120%)[\)]\
 & = 2 chevron.l e_0 \, L R e_0 chevron.r + \( a + B \) chevron.l e_0 \, R e_0 chevron.r\
 & = 2 integral \( x - B \)_(+) thin rho_v \( d x \) + \( a + B \) rho_v \( \( B \, oo \) \) . $
  Here $e_0$ is the first unit vector of the arrow matrix. The left side is the tail integral in Equation (4.12).
    Taking $B = 0$ and using that $rho_v$ is a probability measure gives the last assertion. ◻
]

The deletion increment is defined using all roots of a polynomial, whereas $m_v$ is attached to one site.
  We next record the locality which relates these finite quantities to graph neighborhoods.
  A graph supporting $T$ means an undirected graph on $I$, without loops, such that $T_(u v) =
  0$ whenever $u eq.not v$ are not adjacent.

#thm([Lemma 4.5.])[
  (Rooted locality and bounds).  #emph[Let a graph support the finite zero-diagonal Hermitian contraction $T$.
    The coefficient of $z^(- 1 - k)$ in $G_v \( z \)$ is $integral x^k thin
    rho_v \( d x \)$ and is determined by the data on the radius-$k$ ball about $v$.
    The Laurent coefficients of $F_v \( z \)$, and of the two options $F_(v \, i)^0 \( z \)$ and
    $F_(v \, i) \( z \)$ at an unassigned site, likewise depend only on a radius bounded by their order. Moreover,
#[#set math.equation(numbering: n => "(4.13)")
 $ integral x^2 thin rho_v \( d x \) = a_v^2 + sum_(u eq.not v) W_v W_u \| T_(v u) \|^2
   bb(P) \( omega_u = omega_v \) \, wide sum_lambda b_(v \, lambda) =
   sum_(u eq.not v) W_v W_u \| T_(v u) \|^2 bb(P) \( omega_u = omega_v \) . $ <eq:poly-second-moment>]

 The same identities hold for either site option, using the corresponding law of the pairs and diagonal shift.]
  #emph[If neighboring weights have ratios in $\[ K^(- 1) \, K \]$, $K gt.eq 1$, then for all these data
#[#set math.equation(numbering: n => "(4.14)")
 $ integral x^2 thin rho_v \( d x \) lt.eq #scale(x: 120%, y: 120%)[\(] \( beta t \)^2 +
   K #scale(x: 120%, y: 120%)[\)] W_v^2 \, quad m_v lt.eq C_0 W_v \, quad d_v lt.eq \( 2 C_0 + beta t \) W_v \,
   quad C_0 = sqrt(\( beta t \)^2 + K) . $ <eq:poly-weight-bounds>]

 If all weights are at most $H_0$, every polynomial and every principal restriction has all its roots in
#[#set math.equation(numbering: n => "(4.15)")
 $ \[ - L \, L \] \, wide L = \( 1 + beta t \) H_0 . $ <eq:poly-root-support>]

 The rooted measures have the same support bound.]
] <lem:rooted-locality>

#proof[
  Put $u_v = z_v^(- 1)$ and consider the formal polynomial
  $ cal(H)_I \( u \) = P_I \( Z \) product_(v in I) u_v = sum_(S subset I) c_S product_(v in S) u_v . $
  The coefficient $c_S$ is the expected determinant of the negative outcome matrix restricted to $S$.
    If $S$ splits into graph components, the restricted outcome matrix splits into the same blocks,
    and their choices are independent. Hence $c_S$ factors over the components.
    Since $cal(H)_I \( 0 \) = 1$, its formal logarithm is defined.
    A coefficient in this logarithm depends only on its supported subset.
    On a disconnected subset $cal(H)_I$ factors, so its logarithm is a sum over components.
    Thus every nonconstant monomial in $log cal(H)_I$ has connected support.
  By Equation (4.4),
  $ G_v \( Z \) = partial_(z_v) log P_I \( Z \) . $
  Apart from the term $1 \/ z_v$, its monomials arise from connected supports containing $v$.
    After uniform specialization, the coefficient of order $z^(- 1 - k)$ therefore uses only the radius-$k$ ball
    at $v$. The Cauchy-transform expansion identifies that coefficient with the $k$-th rooted moment.
    Formal inversion of the series with leading term $1 \/ z$ gives the same locality statement for $F_v$.
    Conditioning or changing the shift at $v$ preserves this argument.
  For singleton and two-point sets the coefficients are
  $ c_({ v }) = a_v \, wide c_({ u \, v }) = a_u a_v - W_u W_v \| T_(u v) \|^2 bb(P) \( omega_u = omega_v \) . $
  Expanding the logarithmic derivative to order $z^(- 3)$ gives the first identity in Equation (4.13).
    Alternatively, the arrow matrix has first diagonal $- a_v$ and off-diagonal squared norm $sum_lambda
    b_(v \, lambda)$; comparison with its second rooted moment gives the second identity.
  Under the neighboring-ratio hypothesis, the sum in Equation (4.13) is at most
  $ K W_v^2 sum_(u eq.not v) \| T_(v u) \|^2 lt.eq K W_v^2 . $
  This holds for each conditioned law as well, since every collision probability is at most one.
    Also $a_v lt.eq beta t W_v$. Cauchy–Schwarz for the probability measure $rho_v$, followed by Lemma 12,
    proves Equation (4.14).
  Finally every outcome has norm at most $\( 1 + beta t \) H_0$,
    because principal compression and pinching preserve the contraction bound of $T$.
    For real $z > L$, all its characteristic determinants are positive; for $z < - L$,
    all have sign $\( - 1 \)^(\| I \|)$. Their average therefore has no root outside $\[ - L \, L \]$.
    Real-rootedness proves Equation (4.15). The same reasoning applies after restriction or a site option,
    and the spectral representation gives the assertion for rooted measures. ◻
]

=== 4.4 The single-site assignment estimate <the-single-site-assignment-estimate>

We now compare the cost of leaving a site unassigned with the costs of permanently assigning its possible colors.
  The comparison depends only on the arrow matrix and the averaging of its nonnegative residues.
  This is the finite estimate that will govern the coloring procedure.

#thm([Lemma 4.6.])[
  (Assigning one color).  #emph[For a finite zero-diagonal Hermitian contraction $T$, arbitrary positive weights,
    $r gt.eq 1$, $t > 0$, and a partial coloring as above, let $v$ be unassigned.
    With $beta = 80$, there is $i in { 1 \, dots.h \, r }$ such that
#[#set math.equation(numbering: n => "(4.16)")
 $ d_v^(thin i) - d_v lt.eq 24 m_v . $ <eq:poly-assignment>]

 The bound is independent of the finite set and its weights.]
] <lem:assignment>

#proof[
  Write $a = a_v = t W_v > 0$, $m = m_v$, $d = d_v$, and
  $ H = mat(delim: "(", - a, g^(*); g, Lambda) $
  for the old arrow matrix. By Equation (4.9), the color-conditioned residues $b_(i \, lambda)$ are nonnegative
    and have average $b_lambda$. A permanent assignment replaces these residues by $b_(i \, lambda)$ and the first
    diagonal by $- beta a$. All deletion eigenvalues $Lambda$ stay fixed.
  Separate the deletion coordinates into those with $lambda > 0$ and those with $lambda lt.eq 0$,
    and use subscripts $+$ and $-$ for these two blocks. Write $H = H_(+) -
    H_(-)$ for its positive and negative parts; subscripts on $H_plus.minus$ below specify compressions to the
    deletion blocks, not additional positive or negative parts. Set
  $ e_(+) = "Tr" \( H_(-) \)_(+ +) \, wide e_(-) = "Tr" \( H_(+) \)_(- -) . $
  Since the first diagonal of $H_(+)$ is $m$, comparison of the diagonal blocks in $H = H_(+) - H_(-)$ gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ d = m + e_(+) + e_(-) \, wide \( H_(-) \)_00 = m + a . $ <eq:poly-error-decomposition>]
  We treat separately the cases in which the rooted cost is at least the shift and in which it is smaller.
  #emph[Case $m gt.eq a$.] Consider the two side arrows obtained by retaining the first coordinate and just one
    deletion block, initially with first diagonal $- a$. For the positive block there is exactly one negative
    eigenvalue, say $- L_0$, and
  $ L_0 = a + sum_(lambda > 0) frac(b_lambda, L_0 + lambda) \, wide d^(+) = L_0 - a . $
  Here $d^(+)$ is its positive-trace increment over its deletion block.
    The formulas remain valid for an empty positive block, with $L_0 = a$.
    For the nonpositive block there is at most one positive eigenvalue.
    Let $s_0$ denote that eigenvalue if present, and put $s_0 = 0$ otherwise. Its increment is $d^(-) = s_0$, and
  #[#set math.equation(numbering: n => "(4.18)")
   $ sum_(lambda lt.eq 0) frac(b_lambda, s_0 + \| lambda \|) lt.eq s_0 + a . $ <eq:poly-nonpositive-test>]
  If $s_0 = 0$, all residues at $lambda = 0$ must vanish; otherwise the side quotient would have a positive zero.
    Omit those terms in Equation (4.18). If the remaining sum at zero were greater than $a$,
    continuity and the behavior at infinity would again produce a positive zero,
    which proves the displayed inequality also in this case.
  Pinching off the other coupling in $H$ cannot increase its positive trace.
    The uncoupled block contributes exactly its own positive trace, so $d^(+) lt.eq d$ and $d^(-) lt.eq d$.
    By averaging the residues, at least three quarters of the colors satisfy
  $ sum_(lambda > 0) frac(b_(i \, lambda), L_0 + lambda) lt.eq 4 d^(+) \, $
  and at least three quarters satisfy
  $ sum_(lambda lt.eq 0) frac(b_(i \, lambda), s_0 + \| lambda \|) lt.eq 4 \( s_0 + a \) . $
  Thus some color satisfies both bounds. A zero old residue is zero for every color by nonnegativity,
    so the omitted zero-denominator terms remain absent.
  For this color, the positive-block arrow with first diagonal $- a$ has increment at most $4 d^(+)$.
    Indeed, if its negative eigenvalue magnitude is at most $L_0$, the assertion is immediate;
    otherwise its root equation bounds the increment by the preceding test sum.
    The nonpositive-block arrow with first diagonal $- 4 a$ has increment at most $4 s_0$.
    If it had a positive root $s > 4 s_0$, its decreasing residue sum would be at most its value at $s_0$,
    hence at most $4 \( s_0 + a \)$, whereas its root equation would require that sum to be $s + 4 a > 4 \( s_0 + a \)$.
  Extend the two side arrows by zero and add them. The resulting full arrow has first diagonal $- 5 a$.
    Subadditivity of positive trace, which follows from its variational formula,
    shows that its increment is at most $4 d^(+) + 4 d^(-)$. Decreasing the first diagonal further to $-
    beta a$ can only decrease positive trace. Therefore
  $ d_v^(thin i) lt.eq 4 \( d^(+) + d^(-) \) lt.eq 8 d \, wide d_v^(thin i) - d lt.eq 7 d lt.eq
    7 \( 2 m + a \) lt.eq 21 m \, $
  where Lemma 12 was used in the last step.
  #emph[Case $m < a$.] The positive and negative parts of $H$ give more useful residue bounds in this case.
    For a positive block matrix, the outer product of its first coupling column is bounded by its first diagonal
    entry times its remaining block. Apply this to $H_(+)$ and $H_(-)$, and use $\( p - q \) \( p - q \)^(*) lt.eq
    2 p p^(*) + 2 q q^(*)$ for the difference of their coupling columns.
    As $\( H_(+) \)_(+ +) = Lambda_(+) + \( H_(-) \)_(+ +)$ and $\( H_(-) \)_(- -) = \|
    Lambda_(-) \| + \( H_(+) \)_(- -)$, this gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ g_(+) g_(+)^(*) & lt.eq 2 m Lambda_(+) + \( 4 m + 2 a \) \( H_(-) \)_(+ +) \,\
g_(-) g_(-)^(*) & lt.eq 2 \( m + a \) \| Lambda_(-) \| + \( 4 m + 2 a \) \( H_(+) \)_(- -) . $ <eq:poly-positive-block>]
  Conjugate Equation (4.19) by $\( 32 a + Lambda_(+) \)^(- 1 \/ 2)$ and take the operator norm.
    The left side has rank at most one, so its norm is the corresponding residue sum.
    The first term on the right has norm at most $2 m$, and the error term has norm at most its trace.
    Since $4 m + 2 a lt.eq 6 a$,
  #[#set math.equation(numbering: n => "(4.20)")
   $ sum_(lambda > 0) frac(b_lambda, 32 a + lambda) lt.eq 2 m + 6 / 32 e_(+) . $ <eq:poly-positive-test>]
  Put $L_1 = e_(-)$. If $L_1 > 0$, conjugating Equation (4.19) by $\( L_1 + \| Lambda_(-) \| \)^(- 1 \/ 2)$ in the
    same way gives
  #[#set math.equation(numbering: n => "(4.21)")
   $ sum_(lambda lt.eq 0) frac(b_lambda, L_1 + \| lambda \|) lt.eq 2 \( m + a \) + \( 4 m + 2 a \) lt.eq
     10 a . $ <eq:poly-negative-test>]
  Indeed the trace of $\( H_(+) \)_(- -)$ is $L_1$, so its conjugated norm is at most $1$.
    If $L_1 = 0$, positivity implies $\( H_(+) \)_(- -) = 0$.
    Equation (4.19) then forces zero coupling on the kernel of $\| Lambda_(-) \|$.
    Use its inverse only on its nonzero support and omit the zero residues at $lambda = 0$;
    Equation (4.21) remains valid.
  Choose a color for which both residue sums in Equations (4.20) and (4.21) are at most four times their indicated
    upper bounds. Such a color exists by the same averaging argument.
    For that color, the positive-block arrow with diagonal $-
    32 a$ has negative eigenvalue magnitude at least $32 a$; its root equation therefore bounds its positive-trace
    increment by
  $ 8 m + 24 / 32 e_(+) . $
  The nonpositive-block arrow with diagonal $- 40 a$ has increment at most $L_1$.
    Indeed a positive root $s > L_1$ would have residue sum at most its test value $40 a$,
    whereas its root equation requires $s + 40 a > 40 a$. This also covers $L_1 = 0$,
    with zero residues omitted as above.
  Adding the side arrows gives the full arrow with diagonal $- 72 a$.
    Subadditivity of positive trace and then decreasing the diagonal to $- 80 a$ yield
  $ d_v^(thin i) lt.eq 8 m + 3 / 4 e_(+) + e_(-) . $
  Together with Equation (4.17), this gives
  $ d_v^(thin i) - d lt.eq 7 m - 1 / 4 e_(+) lt.eq 7 m . $
  Both cases imply Equation (4.16). All arguments allow empty deletion blocks and empty sums,
    so they include a one-site matrix and every zero-residue case. ◻
]

== 5 Rooted costs on invariant measured graphs <sec:invariant>

The preceding finite polynomial estimates control the effect of assigning a single vertex.
  We now pass from finite sets to measured graphs, where many vertices must be changed simultaneously.
  There are two points to establish. First, the integral of the rooted positive cost changes by the integral of
  the single-vertex deletion increments, evaluated in an ordered sequence of comparison environments.
  Second, deleting vertices outside a fixed weight band has a small effect on the transforms within that band,
  with a bound independent of the largest weight anywhere in the graph.
  The latter uniformity will allow us to remove weight cutoffs in the next section.

Let $\( X \, nu \)$ be a standard finite measure space, and let $cal(R)$ be a countable measured equivalence
  relation preserving $nu$. Thus each measurable partial isomorphism whose graph lies in $cal(R)$ preserves
  measure. Let $G subset cal(R)$ be a measurable undirected graph without loops, of degree at most $D_0 < oo$.
  On its orbit spaces suppose that we are given measurable Hermitian matrices $T$ of norm at most one,
  with zero diagonal and entries supported on $G$. As before,
  changing the root may conjugate these matrices by diagonal unitaries.
  All the constructions below are invariant under those conjugacies.
  Null exceptions are discarded along their $cal(R)$-saturations.

Fix an integer $r gt.eq 1$, $t > 0$, and $beta = 80$. A partial coloring is a measurable map $c : X arrow.r { 0 \,
  1 \, dots.h \, r }$, where $0$ denotes an unassigned vertex.
  Use the shifts and polynomial choices of Section 4, and let $W :
  X arrow.r \( 0 \, H_0 \]$ be a measurable weight, where $H_0 < oo$.
  When a measurable set of vertices has been deleted, take the principal restrictions of the graph and matrix,
  retaining the original graph to measure distances. At absent vertices every rooted cost or transform is set
  equal to zero, and the rooted measure is the zero measure. On a finite principal set $I$ we use the notation

$ P_I \, quad Q_(I \, v) = P_(I \\ { v }) \, quad F_(I \, v) = P_I / Q_(I \, v) \, quad G_(I \, v) = 1 /
  F_(I \, v) \, quad rho_(I \, v) \, quad m_(I \, v) \, quad d_(I \, v) $

from the preceding section. In particular, with roots counted with multiplicity,

$ m_(I \, v) = integral x_(+) thin rho_(I \, v) \( d x \) \, wide d_(I \, v) = s \( P_I \) - s \( Q_(I \, v) \) \,
  wide s \( P \) = sum_(P \( x \) = 0) x_(+) . $

We write $a_v = tau_v W_v$ and set

#[#set math.equation(numbering: n => "(5.1)")
 $ L = \( 1 + beta t \) H_0 . $ <inv:spectral-bound>]

All roots and rooted spectral measures in these finite calculations lie in $\[ - L \, L \]$,
  including the virtual color choices at an unassigned vertex.

Measure invariance gives the mass transport identity

#[#set math.equation(numbering: n => "(5.2)")
 $ integral_X sum_(u in \[ v \]_(cal(R))) h \( v \, u \) thin d nu \( v \) =
   integral_X sum_(v in \[ u \]_(cal(R))) h \( v \, u \) thin d nu \( u \) $ <inv:mass-transport>]

for nonnegative measurable $h$, and for integrable complex-valued $h$.
  Indeed, partition $cal(R)$ into countably many graphs of partial one-to-one maps and change variables on each graph.

=== 5.1 Limits on bounded weighted graphs <limits-on-bounded-weighted-graphs>

#thm([Lemma 5.1.])[
  #emph[For the invariant measured graph data on the finite measure space $\( X \, nu \)$ specified above,
    the rooted measures, transforms, and costs have limits as finite principal subsets exhaust the graph component
    of the root. Denote them by $rho_v$, $G_v$, $F_v$, $m_v$, and $d_v$.
    They are independent of the exhaustion and are measurable in $v$.
    At each present vertex, $rho_v$ is a probability measure supported on $\[ - L \, L \]$, and,
    for $z$ in the open upper half-plane,
$ G_v \( z \) = integral frac(1, z - x) thin rho_v \( d x \) \, wide F_v \( z \) = frac(1, G_v \( z \)) . $

 The same assertions hold after conditioning the color at one unassigned vertex,
   with either its original shift or its increased shift.]
  #emph[For fixed $D_0 \, H_0 \, r \, t$, the costs $m_v \, d_v$ and the virtual shifted costs $d_v^(thin i)$,
    $1 lt.eq i lt.eq r$, are uniformly approximable by calculations on a ball of finite radius about $v$.
    The approximation radius is independent of the particular graph, weights, partial coloring,
    and set of deleted vertices. These statements apply to a finite-measure restriction of an invariant measured
    relation as well.]
] <lem:bounded-costs>

#proof[
  By Lemma 13, each moment $integral x^k thin rho_(I \, v) \( d x \)$ is determined by a bounded neighborhood of
    $v$, and is unchanged once $I$ contains that neighborhood.
    Compactness of the probability measures on $\[ - L \, L \]$ and uniqueness from their moments therefore give
    an exhaustion-independent weak limit $rho_v$. Its Cauchy transform is the limit of $G_(I \, v)$,
    locally uniformly on the upper half-plane. Moreover,
  $ - "Im" G_v \( z \) = \( "Im" z \) integral \| z - x \|^(- 2) thin rho_v \( d x \) > 0 \, $
  so this limit can be inverted. Hence $F_(I \, v)$ converges to $F_v$ there.
    The same argument applies to the altered color law or shift at the root. The finite quotients also have the form
  $ F_(I \, v) \( z \) - z - a_v = - integral frac(1, z - x) thin kappa_(I \, v) \( d x \) \, $
  where the positive residue measure $kappa_(I \, v)$ is supported on $\[ - L \, L \]$.
    Its mass is at most $H_0^2$ by the second-moment formula in Lemma 13;
    the same bound holds for the conditional color laws. Compactness and uniqueness of Cauchy transforms therefore
    give a limiting residue measure as well. This also justifies taking the local Laurent-coefficient limits of
    the quotients below. Since $x_(+)$ is continuous on $\[ - L \, L \]$, the costs $m_(I \, v)$ converge as well.
    Polynomial approximation on this interval, together with moment locality,
    makes this convergence uniformly approximable by finite neighborhood calculations.
  Deletion increments require a different approximation, because their definition involves the roots at every
    vertex of a finite set. For a real polynomial $f$, put
  $ d_(I \, v) \[ f \] = sum_(P_I \( x \) = 0) f \( x \) - sum_(Q_(I \, v) \( x \) = 0) f \( x \) . $
  The identity that the sum of the rooted measures counts all polynomial roots gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ d_(I \, v) \[ f \] =
     sum_(u in I) (integral f thin d rho_(I \, u) - 1_({ u eq.not v }) integral f thin d rho_(I \\ { v } \, u)) .
     $ <inv:polynomial-increment>]
  Each summand is local. It vanishes unless $u$ lies within a radius depending only on $deg f$ of $v$.
    Thus the entire increment can be computed in a sufficiently large finite neighborhood of $v$,
    independently of the ambient finite set. This defines its value on the infinite graph.
  To pass from polynomials to $x_(+)$, for an absolutely continuous real function $f$ on $\[ - L \, L \]$ use
    interlacing in the form
  #[#set math.equation(numbering: n => "(5.4)")
   $ d_(I \, v) \[ f \] = f \( - L \) + integral_(- L)^L f' \( x \) #scale(x: 120%, y: 120%)[\(] n_(P_I) \( x \) -
     n_(Q_(I \, v)) \( x \) #scale(x: 120%, y: 120%)[\)] thin d x \, wide 0 lt.eq n_(P_I) \( x \) -
     n_(Q_(I \, v)) \( x \) lt.eq 1 . $ <inv:ac-increment>]
  Here $n_P \( x \)$ counts roots strictly greater than $x$.
    The formula follows by writing $f \( lambda \) = f \( - L \) +
    integral_(- L)^lambda f' \( x \) thin d x$ for each root; the difference in degrees is one. Consequently
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| d_(I \, v) \[ f \] - d_(I \, v) \[ g \] \| lt.eq \| f \( - L \) - g \( - L \) \| + parallel f' -
     g' parallel_(L^1 \( \[ - L \, L \] \)) . $ <inv:increment-approximation>]
  Approximate $f'$ in $L^1$ by polynomials and integrate them with prescribed initial value $f \( - L \)$.
    This gives polynomial approximants with both uniform function error and the increment error in Equation (5.5)
    tending to zero. Apply this to $f \( x \) = x_(+)$. The local polynomial increments are eventually constant,
    and their approximation error is uniform in every finite set.
    Hence $d_(I \, v)$ has the stated limit and uniform locality property.
    The same proof works for each of the finitely many virtual options at $v$.
  Finally, finite balls in a measurable bounded-degree graph, their finite matrix data,
    and their conjugacy-invariant polynomial calculations are measurable.
    The limiting constructions above are therefore measurable.
    Deleting vertices or restricting the relation does not change the argument:
    use the original graph for the locality radius and the retained vertices for each principal calculation. ◻
]

=== 5.2 Integral change under ordered updates <integral-change-under-ordered-updates>

We next compare two global partial colorings, allowing deletion of vertices.
  The order in which vertices are compared need not have a first element.
  Only finitely many comparisons occur in any given polynomial local calculation,
  which is enough for the following identity.

#thm([Lemma 5.2.])[
  #emph[Under the bounded finite-measure hypotheses of Lemma 15,
    let the old and new data differ only by changes of partial coloring or deletion at a measurable set $E_0$ of
    vertices. Fix a measurable real-valued function that is injective on $E_0$ in each relation class,
    and order these vertices by its values. At $u in E_0$, use new data at all earlier vertices and old data at
    all later vertices. Let $delta d_u$ be the new-minus-old difference of the single-vertex deletion cost at $u$
    in this environment, with cost zero when $u$ is absent. Then
#[#set math.equation(numbering: n => "(5.6)")
 $ integral_X \( m_v^(upright("new")) - m_v^(upright("old")) \) thin d nu \( v \) =
   integral_(E_0) delta d_u thin d nu \( u \) . $ <inv:integral-change>]

 In particular, deletion alone cannot increase the integral of $m_v$.]
] <lem:integral-change>

#proof[
  An injective measurable point code supplies such an ordering if none has already been specified.
    Begin with a real polynomial $f$ in place of $x_(+)$. Write $m_v \[ f \] =
    integral f thin d rho_v$ at present vertices and zero at absent ones.
    For each root $v$, this quantity depends only on a fixed finite-radius neighborhood.
    List the finitely many vertices of $E_0$ in that neighborhood in their specified order and telescope its
    change over this list. Each term agrees with the change produced at that vertex in the global comparison
    environment: changes outside the neighborhood have no effect on this polynomial rooted datum.
    Thus no well-ordering or infinite telescoping at an individual root is being assumed.
  Integrate the resulting finite local sum and apply Equation (5.2) to interchange the root and the changed
    vertex. For a fixed changed vertex $u$, the sum over affected roots equals the change in $d_u \[ f \]$.
    Indeed, this can be checked on a sufficiently large finite principal neighborhood using Equation (5.3):
    the old and new polynomials have the same deletion polynomial at $u$.
    If the vertex is deleted, the new rooted datum there and the new deletion increment are both zero by
    convention. Bounded degree, bounded spectral support, and finite total measure justify all integrals for this
    fixed polynomial. We have proved
  $ integral_X \( m_v^(upright("new")) \[ f \] - m_v^(upright("old")) \[ f \] \) thin d nu \( v \) =
    integral_(E_0) delta d_u \[ f \] thin d nu \( u \) . $
  Choose the polynomial approximants to $x_(+)$ constructed in the proof of Lemma 15.
    Uniform function approximation controls the two rooted terms on the left;
    the $L^1$ derivative bound in Equation (5.5) controls both comparison increments on the right.
    Finite measure then permits passage to the limit and proves Equation (5.6).
    For a deletion the comparison increment is $- d_u lt.eq 0$, by interlacing. This proves the last assertion. ◻
]

=== 5.3 Deletion estimates independent of the largest weight <deletion-estimates-independent-of-the-largest-weight>

The preceding arguments allow constants depending on $H_0$.
  To pass later to unbounded weights, we need a comparison on a fixed band that is uniform as $H_0$ increases.
  Cauchy transforms provide this comparison. Besides $G_v$,
  we must control the conditional color choices used in the single-vertex assignment inequality.

At an unassigned vertex $v$, let $F_(v \, i)^0$ be the quotient obtained by conditioning its color to be $i$ while
  leaving its shift equal to $t$. The permanent option has quotient

$ F_(v \, i) \( z \) = F_(v \, i)^0 \( z \) + \( beta - 1 \) t W_v . $

Define the auxiliary analytic field

#[#set math.equation(numbering: n => "(5.7)")
 $ J_i \( v \, z \) = #scale(x: 120%, y: 120%)[\(] F_(v \, i)^0 \( z \) - z -
   a_v #scale(x: 120%, y: 120%)[\)] G_v \( z \) \, wide c \( v \) =
   0 upright(" and ") v upright(" present") . $ <inv:J-definition>]

Set $J_i \( v \, z \) = 0$ at all other vertices. At present unassigned vertices the reciprocal transforms here
  are nonzero by Lemma 15. The residue formula of Lemma 13 shows that these analytic fields are bounded on
  upper-half-plane compact sets when the root weight and its neighbors’ weight ratios are bounded.

#thm([Lemma 5.3.])[
  #emph[Consider the invariant measured graph data on the finite measure space $\( X \, nu \)$ specified above and
    assume, in addition, that neighboring weights have ratios in $\[ K^(- 1) \, K \]$, where $K gt.eq 1$.
    Fix $0 < b_1 < b_2 < oo$ and the band
$ cal(U) = { v : b_1 lt.eq W_v lt.eq b_2 } . $

 Delete a measurable set $E_(upright("hi"))$ disjoint from $cal(U)$,
   without changing the coloring at retained vertices. Let $delta_(upright("tot"))$ denote the difference between
   the original and the deleted configurations, in either orientation.
   For each compact set $Omega$ in the open upper half-plane there is a constant $C$ such that,
   for every $z in Omega$ and $1 lt.eq i lt.eq r$,
#[#set math.equation(numbering: n => "(5.8)")
 $ integral_(cal(U)) \| delta_(upright("tot")) G_v \( z \) \| thin d nu \( v \) +
   integral_(cal(U) ∩ { c = 0 }) \| delta_(upright("tot")) J_i \( v \, z \) \| thin d nu \( v \) lt.eq
   C nu \( E_(upright("hi")) \) . $ <inv:rank-comparison>]

 Only band vertices present before deletion are included in these integrals.
   The constant may depend on $Omega \, r \, t \, beta \, D_0 \, K \, b_1 \, b_2$, but not on $H_0$,
   the measure or its total mass, the partial coloring, the graph itself, or the deleted set.]
] <lem:rank-comparison>

#proof[
  We may discard initially absent vertices from $E_(upright("hi"))$:
    this leaves both configurations unchanged and only decreases its measure.
    Thus every deletion vertex below is present before the deletions begin.
    We first prove bounds for one deletion in a finite principal set.
    We then pass these bounds to infinite bounded graphs and integrate them using an analytic counterpart of the
    ordered-change identity.
  #emph[A single deletion and the field $G$.] Fix a finite principal set $I$, $u in I$, and $z$ with $y =
    "Im" z > 0$. For arbitrary complex numbers $lambda_v$ satisfying $\| lambda_v \| lt.eq 1$,
    perturb the diagonal variables to $z + zeta lambda_v$, $v in I$.
    On the disk $\| zeta \| < y \/ 2$ they remain in the upper half-plane.
    By Lemma 10, the quotient $P_I \/ P_(I \\ { u })$ in these variables has positive imaginary part.
    Its logarithm has a holomorphic branch with imaginary part in $\( 0 \, pi \)$ throughout the disk.
  We use the elementary derivative estimate that a holomorphic function on a disk of radius $R$,
    with bounded imaginary part, has derivative at the center bounded by a numerical constant times the
    oscillation of that imaginary part divided by $R$. To see this,
    restrict to a concentric circle of radius $R \/ 2$ and recover the first Taylor coefficient from the first
    Fourier coefficient of the imaginary part. Applied to the logarithm just described,
    it bounds its derivative at zero by $C_0 \/ y$. Logarithmic differentiation of $P_I$ in a diagonal variable
    gives $G_(I \, v)$, so this derivative is
  $ sum_(v in I) lambda_v #scale(x: 120%, y: 120%)[\(] G_(I \, v) \( z \) -
    G_(I \\ { u } \, v) \( z \) #scale(x: 120%, y: 120%)[\)] \, $
  where the second transform at $v = u$ is zero. Choosing the phases of $lambda_v$ to make all summands
    nonnegative real yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ sum_(v in I) \| G_(I \, v) \( z \) - G_(I \\ { u } \, v) \( z \) \| lt.eq C_0 \/ y . $ <inv:single-G>]
  This estimate contains no bound on the weights.
  #emph[A single deletion and the conditional color field.] Now assume $u in.not cal(U)$, and take $lambda_v =
    0$ except at unassigned vertices in $cal(U)$. Perturb the off-diagonal parts of both pair matrices of color
    $i$ by left and right diagonal scaling with entries $1 + zeta lambda_v$.
    There is no conjugation of $zeta$ in the right scaling, and the fixed diagonal shift is left unchanged.
    This gives an analytic perturbation, though its matrices need not be Hermitian for complex $zeta$.
  Let $D_lambda = "diag" \( lambda_v \)$ and $D_W = "diag" \( sqrt(W_v) \)$ on one of the two relevant
    allowed-site sets. With the sign suppressed, its off-diagonal matrix is $C_i = D_W T D_W$,
    restricted to this set. The perturbation of this matrix equals
  $ zeta \( D_lambda C_i + C_i D_lambda \) + zeta^2 D_lambda C_i D_lambda . $
  In the first row term only band rows and their graph neighbors occur.
    The row weights are at most $b_2$, and these neighboring column weights are at most $K b_2$.
    Factoring the diagonal weights on those row and column sets and using $parallel T parallel lt.eq
    1$ gives $parallel D_lambda C_i parallel lt.eq sqrt(K) b_2$. The same argument applies to $C_i D_lambda$.
    In the quadratic term both indices lie in the band, giving norm at most $b_2$.
    The estimates apply to every principal restriction. Consequently the full matrix perturbation has norm at most
  #[#set math.equation(numbering: n => "(5.10)")
   $ 2 \| zeta \| sqrt(K) b_2 + \| zeta \|^2 b_2 . $ <inv:perturbation-bound>]
  Choose a disk of positive radius depending only on $y \, b_2 \,
    K$ on which Equation (5.10) is less than $y \/ 2$. The imaginary parts of all perturbed pair matrices are then
    bounded above by $\( y \/ 2 \) I$. With diagonal variable still equal to $z$,
    the non-Hermitian version of Lemma 10 shows that the quotient $P_I \/
    P_(I \\ { u })$ has positive imaginary part. Once again its logarithm has imaginary part in $\( 0 \, pi \)$,
    and the derivative estimate is uniform in the upper weight bound $H_0$.
  The derivative of $log P_I$ in this perturbation is
  #[#set math.equation(numbering: n => "(5.11)")
   $ 2 / r sum_(v in I) lambda_v J_i \( v \, z \) . $ <inv:color-derivative>]
  For completeness, consider the permutation expansion of an outcome determinant.
    At a target vertex $v$ whose selected color is $i$, a nontrivial permutation cycle through $v$ uses one row
    factor and one column factor, hence has derivative multiplier $2 lambda_v$.
    A fixed point contributes $z + a_v$ and is unchanged because $T$ has zero diagonal.
    Conditional on color $i$ at $v$, the sum of the nontrivial terms through $v$ is
  $ P_(I \\ { v }) \( z \) #scale(x: 120%, y: 120%)[\(] F_(v \, i)^0 \( z \) - z - a_v #scale(x: 120%, y: 120%)[\)] . $
  The probability of that color at an unassigned vertex is $1 \/ r$.
    Dividing by $P_I$ proves Equation (5.11), including the contribution of both signs.
    The same formula holds after deleting $u$. Apply the derivative bound to the logarithm of the quotient and
    choose the directions $lambda_v$ as before. We obtain
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(v in I ∩ cal(U) ∩ { c = 0 }) \| J_i^I \( v \, z \) - J_i^(I \\ { u }) \( v \, z \) \| lt.eq
     C_1 \( y \, b_2 \, K \, r \) . $ <inv:single-J>]
  The constants in Equations (5.9) and (5.12) can be chosen uniformly for $z$ in any fixed upper-half-plane compact set.
  #emph[Passage to bounded infinite graphs.] Exhaust the graph component of $u$ by finite principal sets.
    The transforms converge by Lemma 15, including the conditional transforms in Equation (5.7).
    Fatou’s Lemma therefore passes both single-deletion estimates to the infinite graph.
    Their sums can be taken over the entire relation class: there is no effect on other graph components.
    Moreover, the bounds hold in every comparison environment formed by deleting other vertices first.
  The single-deletion estimates are now uniform in the largest weight.
    It remains to convert them into a comparison for a measurable set of deletions.
    Directly summing pointwise changes in an arbitrary infinite order would not justify that step.
    We instead establish the integrated identity first for the local Laurent coefficients and then for the
    analytic transforms.
  #emph[The analytic integral change identity.] Fix measurable complex directions $lambda_v$,
    $\| lambda_v \| lt.eq 1$, supported on the band targets: on $cal(U)$ for $G$, and on $cal(U) ∩ { c =
    0 }$ for $J_i$. Let $Z_v \( z \)$ denote the respective field, extended by zero off those targets.
    Order $E_(upright("hi"))$ measurably and injectively along each class.
    At a deletion vertex $u$, let $delta_u Z_v$ mean presence-minus-absence at $u$,
    with earlier vertices already deleted and later vertices still present.
    In the following formula orient $delta_(upright("tot"))$ as before-minus-after. We claim that
  #[#set math.equation(numbering: n => "(5.13)")
   $ integral_X lambda_v delta_(upright("tot")) Z_v \( z \) thin d nu \( v \) =
     integral_(E_(upright("hi"))) (sum_(v in \[ u \]_(cal(R))) lambda_v delta_u Z_v \( z \)) d nu \( u \) .
     $ <inv:analytic-change>]
  The left side contains one rooted term, whereas the right side sums over targets in the class of the deleted vertex.
  To prove the identity, initially work near infinity in the upper half-plane.
    Every target is present in both configurations, since the deleted set is disjoint from the band and initially
    absent band vertices are excluded. At such a target, the bounded spectral support gives
  $ G_v \( z \) = z^(- 1) sum_(k gt.eq 0) h_k \( v \) z^(- k) \, wide \| h_k \( v \) \| lt.eq L^k . $
  At a $J_i$ target, the corresponding expansion is
  $ F_(v \, i)^0 \( z \) - z - a_v = - sum_(k gt.eq 0) b_k \( v \, i \) z^(- k - 1) \,
    wide \| b_k \( v \, i \) \| lt.eq B_(v \, i) L^k \, $
  where $B_(v \, i)$ is the total mass of the limiting residue measure.
    These bounds hold because the finite quotients are the negative Cauchy transforms of their residue measures,
    all supported in $\[ - L \, L \]$. The total residue mass is uniformly bounded in this bounded setting by
    Lemma 13. These expansions persist in the limit: each coefficient is eventually fixed by a finite
    neighborhood, the coefficient bounds are uniform, and the series converge to the limiting transforms for
    sufficiently large $\| z \|$. The product defining $J_i$ therefore also has exponentially bounded Laurent
    coefficients. The coefficient at each order in either field depends on a neighborhood of radius at most a
    constant times that order, by Lemma 13 and multiplication of the series.
  For each individual coefficient the ordered local telescoping argument from Lemma 16,
    followed by Equation (5.2), proves the coefficient version of Equation (5.13).
    The bounded degree ensures that the number of affected roots at a fixed deletion vertex grows at most
    exponentially in the coefficient order. Combining this with the coefficient bounds just obtained gives
    absolute summability of the resulting series for sufficiently large $\| z \|$.
    Finite measure then allows the sums and integrals to be interchanged.
    This proves Equation (5.13) on a nonempty open region of the upper half-plane.
    The region may depend on $H_0$, which causes no problem for the analytic continuation that follows.
  Both sides of Equation (5.13) are holomorphic on the full upper half-plane.
    On the right, the sum over $v$ converges absolutely at each $z$, by the single-deletion estimates.
    Its analytic partial sums, for example over increasing neighborhoods,
    are locally bounded uniformly by those same estimates. Normal-family convergence therefore makes the sum
    holomorphic. The outer integral is over the finite measure set $E_(upright("hi"))$,
    and the bounds are uniform on compact sets, so it too is holomorphic.
    On the left, $\| G_v \( z \) \| lt.eq \( "Im" z \)^(- 1)$;
    the residue bound on the band similarly bounds $J_i \( v \, z \)$ on compact sets.
    These estimates and the finite band measure justify holomorphy of that integral.
    The identity theorem now proves Equation (5.13) everywhere in the upper half-plane.
  Finally fix $z$ and choose the measurable directions $lambda_v$ so that $lambda_v delta_(upright("tot"))
    Z_v \( z \) = \| delta_(upright("tot")) Z_v \( z \) \|$, with arbitrary value when the difference is zero.
    These are fixed directions for the just-proved identity; they need not depend analytically on $z$.
    Its right side is bounded by the single-deletion constant times $nu \( E_(upright("hi")) \)$.
    Apply this argument separately to $G$ and $J_i$ and add the estimates.
    Their constants were independent of $H_0$ and of the comparison environments,
    which proves Equation (5.8) with the stated uniformity. ◻
]

The integral change identity controls the total positive cost under color assignments and deletions.
  The transform comparison gives a different control: the effect of distant large weights on any fixed weight band
  is bounded by the measure of the deleted vertices. Together these are the two estimates needed to define
  normalized costs on a nonsingular base by passage through invariant restrictions of finite measure.

== 6 Coloring a nonsingular measured graph <sec:coloring>

The polynomial calculations of Sections 4 and 5 will now produce a measurable coloring on a probability extension
  of a nonsingular measured graph. The conclusion concerns the operator norm on a prescribed finite ball,
  with an arbitrarily small probability of failure. We will also preserve the uniform distribution of each color
  conditional on the original base point. This latter condition will be needed when the coloring is used inside a
  von Neumann algebra.

There are two steps in passing from the preceding invariant calculations to this conclusion.
  We first construct costs on the nonsingular probability space by adding a real height coordinate and then
  removing upper and lower weight cutoffs. We then assign colors at a small random fraction of the remaining
  vertices at each step. An estimate for the integrated difference of the limiting costs,
  on the set where two colorings agree on a large ball, will control the interaction between these simultaneous
  assignments.

=== 6.1 The probability extension and the coloring theorem <the-probability-extension-and-the-coloring-theorem>

Let $\( X \, mu \)$ be a standard probability space, and let $cal(R)$ be a countable nonsingular measured
  equivalence relation on $X$. We use Borel representatives after discarding null sets when necessary.
  Write the Radon–Nikodym cocycle in the orientation

#[#set math.equation(numbering: n => "(6.1)")
 $ mu \( gamma S \) = integral_S Delta \( gamma v \, v \) thin d mu \( v \) $ <eq:coloring-cocycle>]

for measurable partial isomorphisms $gamma$ with graph in $cal(R)$ and measurable sets $S$ in their domains.
  Versions can be chosen off a saturated null set so that the cocycle identity holds.
  For example, one first uses countably many partial isomorphisms covering $cal(R)$;
  the chain rule gives the identity for their compositions,
  and derivatives agree on sets where two such maps coincide.
  Throughout this Section, null sets arising along the countable relation may be discarded together with their
  saturations, which are null by nonsingularity.

Let $G$ be an undirected measurable graph contained in $cal(R)$, without loops,
  and with degree at most $D_0 < oo$. Its radius-$m$ ball at $v$ is denoted by $B_G \( v \, m \)$. Suppose that

#[#set math.equation(numbering: n => "(6.2)")
 $ K^(- 1) lt.eq Delta \( u \, v \) lt.eq K wide upright("on every edge of ") G \, wide K gt.eq
   1 . $ <eq:coloring-edge-ratios>]

We consider a measurable field of Hermitian matrices $T$ on the orbit spaces $ell^2 \( \[ v \]_(cal(R)) \)$,
  with norm at most $1$, zero diagonal, and entries supported on $G$.
  Upon changing the root within an orbit, the matrices are identified up to conjugacy by a diagonal unitary.
  All quantities used below, including principal norms and the polynomial costs, are invariant under these conjugacies.

The #emph[relative Bernoulli extension] of $\( X \, mu \, cal(R) \)$ is the space

$ tilde(X) = { \( v \, omega \) : v in X \, med omega in \[ 0 \, 1 \]^(\[ v \]_(cal(R))) } \, wide
  pi \( v \, omega \) = v \, $

equipped with the probability measure $tilde(mu)$ whose conditional measure over $v$ is the product of Lebesgue
  measures, denoted by $kappa_v$. The equivalence relation on this extension identifies $\( v \, omega \)$ with
  $\( u \, omega \)$ whenever $\( u \, v \) in cal(R)$, regarding $omega$ as one function on the common class.
  Each extended orbit thus projects bijectively onto a base orbit.
  The graph and matrices are pulled back along this identification.

These are standard measurable spaces and fields: enumerate the base relation by countably many partial
  isomorphisms, and use one coordinate for each distinct site in a class.
  Changing the root reindexes a product family and preserves its conditional product measure.
  Consequently the lift of a base partial isomorphism has the same Radon–Nikodym derivative as that base map.
  These lifts enumerate the extended relation. Cutting their domains by extension-measurable sets and taking
  countable disjoint unions therefore shows, by conditional integration,
  that the cocycle on the extension is the pullback of $Delta$.
  A single Lebesgue coordinate at a site will be used to encode countably many independent random coordinates
  whenever needed.

For an integer $r gt.eq 1$ and a coloring $c : tilde(X) arrow.r { 1 \, dots.h \, r }$,
  its value at a site $u$ in the orbit of $\( v \, omega \)$ means $c \( u \, omega \)$.
  On a finite principal set $I$ in this orbit, let

$ T_(I \, c) = sum_(i = 1)^r 1_({ c = i } ∩ I) thin T \|_I thin 1_({ c = i } ∩ I) $

be the matrix obtained by retaining entries joining vertices of the same color.

#thm([Theorem 6.1.])[
  (Bernoulli coloring).  #emph[Let $\( X \, mu \, cal(R) \)$, $G$, $Delta$, and $T$ satisfy the assumptions above:
    $cal(R)$ is countable and nonsingular on a standard probability space, $G$ is undirected, has no loops,
    has degree at most $D_0 < oo$, and satisfies Equation (6.2),
    and $T$ is a measurable Hermitian contraction with zero diagonal and support on $G$,
    allowing diagonal unitary conjugacy under a change of root.
    Fix an integer $r gt.eq 1$ and a real number $t > 3 \/ sqrt(r)$, and put $beta = 80$.]
  #emph[For every integer $m gt.eq 1$ and every $alpha \, eta > 0$, there is a measurable coloring $c :
    tilde(X) arrow.r { 1 \, dots.h \, r }$ on the relative Bernoulli extension such that
#[#set math.equation(numbering: n => "(6.3)")
 $ kappa_v { omega : c \( v \, omega \) = i } = 1 / r quad upright("for every ") i in { 1 \, dots.h \, r } quad
   upright("and almost every ") v in X \, $ <eq:coloring-marginal>]

 and
#[#set math.equation(numbering: n => "(6.4)")
 $ tilde(mu) {\( v \, omega \) : parallel T_(B_G \( v \, m \) \, c) parallel lt.eq 2 beta t + alpha} > 1 -
   eta . $ <eq:coloring-ball-conclusion>]

]
] <thm:bernoulli-coloring>

We prove the theorem after constructing the cost that will control the assignments.
  Until the final proof, the probability base may already include some Bernoulli coordinates.
  We continue to denote this current base by $\( X \, mu \)$ and its relation by $cal(R)$;
  the cocycle and all graph and matrix bounds remain as above.

=== 6.2 Homogeneous costs from an invariant lift <homogeneous-costs-from-an-invariant-lift>

A partial coloring is a measurable function $c : X arrow.r { 0 \, 1 \, dots.h \, r }$,
  with $0$ indicating an unassigned site. Recall the finite-site data of Section 4: the diagonal shift at a site is

$ tau_v = cases(delim: "{", t \, & c \( v \) = 0 \,, beta t \, & c \( v \) > 0 \,) $

and the allowed polynomial choices are both signs of all $r$ colors at an unassigned site,
  or both signs of its assigned color otherwise. Choices are uniform among the allowed pairs and independent
  across sites. With positive weights $W_v$, the outcome matrix on a choice block is the corresponding principal
  restriction of

$ "diag" \( sqrt(W) \) \( plus.minus T \) "diag" \( sqrt(W) \) - "diag" \( tau W \) . $

For the expected characteristic polynomial $P$ and its single-site deletion $Q = P_(- v)$,
  we use the notation of that Section:

$ F_v = P \/ Q \, wide G_v = 1 \/ F_v \, wide m_v = integral x_(+) thin rho_v \( d x \) \, wide d_v = s \( P \) -
  s \( Q \) \, $

where $rho_v$ is the rooted probability measure with Cauchy transform $G_v$, $x_(+) = max \( x \, 0 \)$,
  and $s \( P \)$ is the sum of the positive parts of the roots, counted with multiplicity.
  At an unassigned site the superscript $i$ denotes permanent assignment to color $i$,
  including the increase in the shift. The quotient $F_(v \, i)^0$ denotes conditioning on color $i$ without
  increasing that shift, whereas

$ F_(v \, i) = F_(v \, i)^0 + \( beta - 1 \) t W_v $

includes the increase. We set the virtual fields $d_v^i$ to zero on already assigned sites.
  On bounded invariant measured graphs the same notation refers to the limits supplied by Lemma 15.

The original measure need not be invariant, so the integral change formula cannot yet be applied there.
  We use the Maharam invariant lift [8]; for the multiplicative-coordinate formula, see [16] Section 2,
  before Theorem 2.1. Here we use logarithmic height, with multiplicative coordinate $y = e^s$;
  the cocycle verification and subsequent homogeneous-cost construction are given below.
  Adjoin a height $s in bb(R)$ and set

#[#set math.equation(numbering: n => "(6.5)")
 $ d nu \( v \, s \) = d mu \( v \) e^s thin d s \, wide W \( v \, s \) = e^(- s) . $ <eq:coloring-lift>]

In the lifted relation, the site corresponding to $u$ at a root $\( v \, s \)$ is

#[#set math.equation(numbering: n => "(6.6)")
 $ #scale(x: 120%, y: 120%)[\(] u \, s - log Delta \( u \, v \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:coloring-height-change>]

The measure $nu$ is invariant. Indeed, the factor $Delta \( u \, v \)$ from Equation (6.1) cancels the factor
  $e^(- log Delta \( u \, v \))$ from the height density. The destination weight is $Delta \( u \, v \)
  W \( v \, s \)$, so neighboring weights have ratios in $\[ K^(- 1) \, K \]$.
  The coloring and matrix data are independent of height.

For $0 < l < H < oo$, retain only the sites with $l lt.eq W lt.eq H$, using the restricted relation, graph,
  and principal matrix data. The retained measure is finite, since

$ nu { l lt.eq W lt.eq H } = l^(- 1) - H^(- 1) . $

All results of Section 5 therefore apply. Denote the resulting cost fields by $m^(l \, H) \,
  d^(l \, H) \, \( d^i \)^(l \, H)$. The next lemma removes both cutoffs,
  while retaining control uniform enough for later changes of coloring.

#thm([Lemma 6.2.])[
  (Homogeneous costs).  #emph[Fix $D_0 \, K \, r \, t$ and $beta = 80$, and let the probability space, relation,
    graph, matrix data, and partial coloring satisfy the assumptions above.
    For each field $f$ in the finite list $m \, d \, d^1 \, dots.h \, d^r$,
    there is a bounded measurable function $macron(f)$ on $X$ such that, on every fixed band
$ cal(U)_(b_1 \, b_2) = { \( v \, s \) : b_1 lt.eq W \( v \, s \) lt.eq b_2 } \, wide 0 < b_1 < b_2 < oo \, $

 one has
#[#set math.equation(numbering: n => "(6.7)")
 $ f^(l \, H) / W arrow.r macron(f) \( v \) quad upright("in ") L^1 \( cal(U)_(b_1 \, b_2) \, nu \) quad
   upright("jointly as ") l arrow.b 0 \, H arrow.t oo . $ <eq:coloring-band-limit>]

 The errors tend to zero uniformly over all such probability bases and configurations with the fixed parameters
   and bounds. There is a constant $C_0$, depending only on those parameters,
   such that all the normalized cutoff fields on retained sites and all their limits have absolute value at most
   $C_0$. The limit fields are independent of height and satisfy
#[#set math.equation(numbering: n => "(6.8)")
 $ min_(1 lt.eq i lt.eq r) macron(d)^i - macron(d) lt.eq 24 macron(m) quad upright("almost everywhere on ") { c =
   0 } . $ <eq:coloring-limit-assignment>]

]
] <lem:homogeneous-costs>

#proof[
  The two cutoffs use different controls. The set of weights above $H$ has invariant measure $H^(- 1)$,
    so the rank comparison controls the upper end. With the upper cutoff fixed,
    the edge-ratio bound makes sufficiently small weights invisible in any chosen finite neighborhood of a fixed
    band. We first prove uniform convergence on the band $1 lt.eq W lt.eq e$.
    The same argument applies to any fixed band bounded away from zero.
    Keep the lower cutoff $l$ fixed and compare upper cutoffs $H_2 gt.eq H_1 gt.eq e$.
    Passing from $H_2$ to $H_1$ deletes a set of invariant measure at most $1 \/ H_1$.
    Lemma 17 gives, on the appropriate sites of the band, integrated absolute differences of order $1 \/ H_1$ for
  $ G_v \( z \) quad upright("and") quad J_i \( v \, z \) = #scale(x: 120%, y: 120%)[\(] F_(v \, i)^0 \( z \) -
    z - a_v #scale(x: 120%, y: 120%)[\)] G_v \( z \) \, wide a_v = tau_v W_v . $
  For $J_i$ the targets are the unassigned band sites. The constants are uniform in $l \, H_1 \, H_2$,
    the configuration, and $z$ on each compact subset of the open upper half-plane.
  The second-moment estimate of Lemma 13 is
  #[#set math.equation(numbering: n => "(6.9)")
   $ integral x^2 thin rho_v \( d x \) lt.eq #scale(x: 120%, y: 120%)[\(] \( beta t \)^2 +
     K #scale(x: 120%, y: 120%)[\)] W_v^2 . $ <eq:coloring-second-moment>]
  It also holds for each of the altered site choices used here.
    In particular, these second moments are uniformly bounded on the band.
    They give a uniform positive lower bound for $\| G_v \( z \) \|$ on each compact subset of the upper
    half-plane: a fixed bounded interval carries a uniformly positive amount of the probability measure, and
  $ - "Im" G_v \( z \) = \( "Im" z \) integral \| z - x \|^(- 2) thin rho_v \( d x \) . $
  The residue bound in Lemmas 10 and 13 also bounds $J_i$ uniformly on these compact sets.
    Division is thus controlled in the identities
  $ F_v = 1 \/ G_v \, wide F_(v \, i)^0 = z + a_v + J_i \/ G_v \, wide F_(v \, i) =
    F_(v \, i)^0 + \( beta - 1 \) t W_v . $
  The integrated differences of these quotients consequently tend to zero as $H_1 arrow.r oo$,
    uniformly in the lower cutoff.
  We next recover the costs from these transform comparisons.
    Probability measures with the uniform second-moment bound form a weakly compact family,
    and integration of $x_(+)$ is continuous on this family by uniform integrability.
    Cauchy transforms on a countable dense subset of the upper half-plane separate probability measures.
    Compactness therefore implies that, for any prescribed accuracy of $m_v$,
    comparisons of the transforms at finitely many arguments to sufficiently small accuracy suffice.
    The integrated transform estimates, together with the uniform bound on $m_v$,
    give the desired integrated comparison for $m$.
  For deletion costs we use the argument of the quotient. In a finite restriction,
    let $n_P \( x \)$ and $n_Q \( x \)$ count roots strictly greater than $x$, with multiplicity.
    Interlacing and the quotient properties give, for $y > 0$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ arg F \( x + i y \) = integral_(bb(R)) frac(y, \( x - u \)^2 + y^2) \( n_P - n_Q \) \( u \) thin d u \, wide
     0 lt.eq arg F lt.eq pi . $ <eq:coloring-argument>]
  This follows by writing the arguments of the individual root factors; the branch is fixed by $"Im" F > 0$.
    The spectral-shift function $n_P - n_Q$ takes values between zero and one. Lemma 12 and Equation (6.9) imply that
  #[#set math.equation(numbering: n => "(6.11)")
   $ integral_B^oo \( n_P - n_Q \) \( x \) thin d x = O \( B^(- 1) \) quad \( B arrow.r oo \) \,
     $ <eq:coloring-shift-tail>]
  uniformly on the band, including for the shifted virtual options. Indeed, the bound in that lemma is
  $ 2 integral \( x - B \)_(+) thin rho_v \( d x \) + \( a_v + B \) rho_v { x > B } \, $
  whose two terms are controlled by the second moment and the band bound on $a_v$.
  On $\[ 0 \, B \]$, the integral of the spectral-shift function is approximated by
  #[#set math.equation(numbering: n => "(6.12)")
   $ 1 / pi integral_0^B arg F \( x + i y \) thin d x quad upright("as ") y arrow.b 0 \, $ <eq:coloring-shift-poisson>]
  uniformly over these finite calculations. To see uniformity, interchange the integrals in Equation (6.10);
    the error is at most the $L^1 \( bb(R) \)$ error in the Poisson approximation to $1_(\[ 0 \, B \])$,
    because $0 lt.eq n_P - n_Q lt.eq 1$. More precisely, put
  $ p_y \( u \) = frac(y, pi \( u^2 + y^2 \)) \, wide delta_B \( y \) = parallel p_y * 1_(\[ 0 \, B \]) -
    1_(\[ 0 \, B \]) parallel_(L^1 \( bb(R) \)) . $
  For fixed $B$, one has $delta_B \( y \) arrow.r 0$ as $y arrow.b 0$.
    Combining the smoothing error with Equation (6.11) gives, uniformly for the finite rooted calculations on the band,
  #[#set math.equation(numbering: n => "(6.13)")
   $ lr(|d_v - 1 / pi integral_0^B arg F_v \( x + i y \) thin d x|) lt.eq C / B + delta_B \( y \) \, wide B gt.eq
     1 . $ <eq:coloring-cut-cost-recovery>]
  The same estimate holds for each shifted virtual option. For fixed $B \, y$,
    convergence of the costs and locally uniform convergence of the quotients in Lemma 15 pass this estimate to
    every present band vertex of a bounded infinite cut, and to present unassigned band vertices for the virtual
    options. The quotient has imaginary part at least $y$, so its argument is continuous throughout this passage.
    We use this estimate in terms of the cost and quotient on the infinite cut.
    For fixed $B \, y$, the arguments in its integral are controlled by the integrated quotient comparisons
    already proved. First choose $B$ large, then $y$ small for that $B$,
    and finally the upper cutoff $H_1$ large for the fixed segment $\[ 0 \, B \] + i y$.
    This proves the high-cutoff comparison for $d$ and every $d^i$.
  It remains to remove the lower cutoff. For a fixed finite upper cutoff,
    Lemma 15 approximates the costs uniformly by bounded neighborhood calculations.
    A radius-$R$ neighborhood of a root in the fixed band cannot contain a vertex of weight below $K^(- R)$.
    Thus a sufficiently small lower cutoff is invisible to any one of these fixed neighborhood calculations.
    This proves uniform convergence as $l arrow.b 0$ with that upper cutoff fixed.
    For joint convergence, first compare both large upper cutoffs to one sufficiently large fixed upper cutoff by
    the preceding estimates, and then compare the lower cutoffs there.
    This gives uniform joint $L^1$-Cauchy estimates. Division by $W$ does not change convergence on a fixed band.
  The uniform bound asserted in the lemma follows directly from Equation (6.9) and Lemma 12:
    $m_v \/ W_v$ is uniformly bounded, and $d_v lt.eq 2 m_v + a_v$. The same bounds hold for all virtual options.
    In particular they are independent of the band, the cutoff, and the configuration.
  We have constructed limits on every fixed band. To identify their height dependence,
    translate height by a real number $b$. This scales every weight by $e^(- b)$ and changes the cutoffs
    correspondingly. All outcome matrices and all costs scale by the same positive factor. Thus
  $ frac(f^(l \, H) \( v \, s + b \), W \( v \, s + b \)) = frac(f^(e^b l \, e^b H) \( v \, s \), W \( v \, s \)) . $
  Joint convergence makes the limiting normalized field invariant almost everywhere under every rational height
    translation, simultaneously. A measurable function on $bb(R)$ invariant almost everywhere under all rational
    translations is constant almost everywhere; this follows, for example, by convolution.
    Applying this on almost every base fiber gives the functions $macron(f) \( v \)$ and their asserted
    independence of height. Their measurability also follows from the band limits,
    for instance by integrating a representative over a fixed height interval.
  Finally Lemma 14 gives the single-site inequality on finite restrictions.
    Lemma 15 passes it to each bounded cut. Joint band convergence then permits a pointwise convergent subsequence
    for the finite list of normalized fields. Dividing by the positive root weight and taking this limit yields
    Equation (6.8). ◻
]

We record two compatibility properties of this construction for later use.
  Suppose $\( hat(X) \, hat(mu) \, hat(cal(R)) \)$ is a standard nonsingular extension with a measurable map $pi :
  hat(X) arrow.r X$ such that $pi_(*) hat(mu) = mu$, each relation class projects bijectively onto an original
  class, and its Radon–Nikodym cocycle is $hat(Delta) \( hat(u) \, hat(v) \) =
  Delta \( pi \( hat(u) \) \, pi \( hat(v) \) \)$. Pull back the partial coloring, graph, and matrix data.
  This includes adjoining independent Bernoulli coordinates that the current coloring does not use.
  Every bounded-cut ball calculation is then exactly a pullback.
  Since $pi$ preserves the base probability, the corresponding band $L^1$ error norms agree.
  Uniqueness of the limits in Lemma 19 therefore gives the same pullback identity almost everywhere for each
  normalized limit field.

For a permutation $sigma$ of the color names, extended by $sigma \( 0 \) = 0$,
  the finite polynomial laws are relabeled by the same permutation.
  The bounded-cut costs and their unique limits consequently satisfy

$ macron(m) \( sigma compose c \) = macron(m) \( c \) \, wide macron(d) \( sigma compose c \) =
  macron(d) \( c \) \, wide macron(d)^i \( sigma compose c \) =
  macron(d)^(sigma^(- 1) \( i \)) \( c \) quad \( 1 lt.eq i lt.eq r \) $

almost everywhere. The first two identities express invariance of the cost,
  while the last records how the virtual color options are renamed.

Define the nonnegative total cost of a partial coloring on the probability base by

#[#set math.equation(numbering: n => "(6.14)")
 $ cal(S) \( c \) = integral_X macron(m) \( v \) thin d mu \( v \) . $ <eq:coloring-total-cost>]

The preceding construction gives a uniform bound for this quantity.
  The next lemma records the two approximation properties that will allow us to use it:
  convergence after averaging over a long height strip, and small integrated changes when two colorings agree on a
  large ball.

#thm([Lemma 6.3.])[
  (Strip averages and locality).  #emph[Under the assumptions of Lemma 19, put
$ Sigma_n = { e^(- n) lt.eq W lt.eq e^n } \, wide f_(Sigma_n) = f^(e^(- n) \, e^n) . $

 For every field $f$ in the list $m \, d \, d^1 \, dots.h \, d^r$,
#[#set math.equation(numbering: n => "(6.15)")
 $ frac(1, 2 n) integral_(Sigma_n) \| f_(Sigma_n) - W macron(f) \| thin d nu arrow.r 0 quad \( n arrow.r oo \) \,
   $ <eq:coloring-strip>]

 uniformly over the configurations and probability bases with the fixed parameters.]
  #emph[If $c_1 \, c_2$ are two partial colorings on the same base with the same graph, matrix, and cocycle data,
    and $E_R$ is the set where they agree on the radius-$R$ graph ball, then
#[#set math.equation(numbering: n => "(6.16)")
 $ integral_(E_R) \| macron(f) \( c_1 \) - macron(f) \( c_2 \) \| thin d mu lt.eq gamma \( R \) \, wide
   gamma \( R \) arrow.r 0 \, $ <eq:coloring-locality>]

 where the same function $gamma$ may be used for the finite list of fields and is uniform over these configurations.]
  #emph[Both assertions hold after taking a product with an auxiliary probability space and keeping the auxiliary
    parameter fixed along the equivalence relation. The cost fields may be chosen measurably on such product spaces.]
] <lem:strip-locality>

#proof[
  In the strip integral there is the identity
  $ \| f_(Sigma_n) - W macron(f) \| thin d nu = \| f_(Sigma_n) \/ W - macron(f) \| thin d mu thin d s . $
  Divide the height interval $\[ - n \, n \]$ into unit intervals.
    Translating each to a fixed interval uses the homogeneity proved in Lemma 19.
    For intervals a sufficiently large fixed distance from both strip ends,
    the translated lower and upper cutoffs are uniformly close to zero and infinity, respectively.
    Uniform joint convergence on the fixed band bounds their average errors by any prescribed positive number.
    The remaining bounded number of end intervals has uniformly bounded error,
    and its contribution divided by $2 n$ tends to zero. This proves Equation (6.15).
  For Equation (6.16), first approximate both limiting normalized fields on a fixed unit height band in $L^1$ by
    common, fixed lower and upper cutoffs. The errors are uniform by Lemma 19.
    On this bounded cut, Lemma 15 approximates each field uniformly by a finite-radius calculation.
    Agreement of the base colorings on a sufficiently large ball makes these lifted local data identical.
    Since the normalized limit fields are independent of height,
    integration on the unit band bounds the required base integral.
    Choosing the cutoff and then the radius for each prescribed accuracy gives Equation (6.16).
  Finally, all bounded-cut calculations are measurable, being limits of rooted finite calculations.
    They remain so with additional measurable parameters. An auxiliary parameter held fixed along the relation
    does not alter the degree, edge ratios, or any spectral estimate.
    The preceding uniform estimates therefore hold on its product probability space as well,
    and the $L^1$ limit construction gives jointly measurable limit fields there. ◻
]

=== 6.3 The cost detects balls with excessive norm <the-cost-detects-balls-with-excessive-norm>

We next relate $cal(S)$ to the norm conclusion in Theorem 18. The all-unassigned configuration has zero cost.
  Once a ball is fully assigned, a violation of the desired norm bound forces a definite positive-root cost in
  that ball. The invariant lift allows us to sum this contribution without assuming that the original probability
  measure is invariant.

#thm([Lemma 6.4.])[
  (Initial cost and bad balls).  #emph[Assume the hypotheses and parameter choices of Theorem 18.
    The all-unassigned partial coloring has $cal(S) = 0$. Fix $m gt.eq 1$ and $alpha > 0$.
    For any measurable partial coloring $c$, let $"Bad"_m \( c \)$ be the set of vertices $v$ for which every
    vertex of $B_G \( v \, m \)$ is assigned and
$ parallel T_(B_G \( v \, m \) \, c) parallel > 2 beta t + alpha . $

 There is a finite constant $C_4$, depending only on $m \, D_0 \, K \, alpha$, such that
#[#set math.equation(numbering: n => "(6.17)")
 $ mu \( "Bad"_m \( c \) \) lt.eq C_4 cal(S) \( c \) . $ <eq:coloring-bad-balls>]

 The same assertions hold on probability extensions with the pulled-back graph, matrix, and cocycle data.]
] <lem:bad-balls>

#proof[
  For the all-unassigned coloring, Lemma 11 gives zero cost on every finite principal restriction.
    Finite restriction limits and Lemma 19 therefore give $cal(S) = 0$.
  To prove Equation (6.17), partition the bad centers into a bounded finite number of measurable classes so that
    two distinct centers in one class have graph distance greater than $2 m + 1$.
    Here is a measurable construction. A bounded-degree Borel graph has a countable measurable partition into
    independent sets: assign to each vertex a finite prefix of an injective standard-space code long enough to
    separate it from all of its neighbors, and include the prefix length in the assigned code.
    Equal assigned codes cannot occur at adjacent vertices. Visit these independent sets in sequence,
    and give each vertex the first color not already used by one of its previously colored neighbors,
    from a palette of one more than the degree bound. This is a measurable proper coloring.
    Apply this construction to the graph whose edges join vertices at distance at most $2 m + 1$,
    and intersect its color classes with $"Bad"_m \( c \)$. The number of resulting classes is bounded in terms of
    $D_0 \, m$.
  Fix one such class $C$ of bad centers. In the invariant lift retain the strip $Sigma_n$,
    and select the lifted centers above $C$ whose height is at distance at least $m log
    K$ from both ends of $\[ - n \, n \]$. Every radius-$m$ ball around a selected center lies entirely in the
    strip. Moreover these balls are disjoint and nonadjacent along each lifted orbit.
    Indeed Equation (6.6) and the cocycle law give exactly one lifted site above each base site in a fixed lifted
    orbit. Distinct centers there therefore project to distinct centers of $C$,
    whose distance is greater than $2 m + 1$.
  Delete every strip site outside these balls. By Lemma 16, deletion cannot increase the total integrated cost, so
  #[#set math.equation(numbering: n => "(6.18)")
   $ integral_(Sigma_n) m_(Sigma_n) thin d nu gt.eq integral m_(upright("retained")) thin d nu .
     $ <eq:coloring-ball-deletion>]
  Each retained graph component is one of the selected finite balls.
    Invariant mass transport sends the rooted costs in each such ball to its center,
    and hence the right side of Equation (6.18) equals the integral over the selected lifted centers of
    $s \( P_(upright("ball")) \)$.
  For a bad ball, the second part of Lemma 11 gives $s \( P_(upright("ball")) \) gt.eq \( alpha \/ 2 \)
    min_(upright("ball")) W$. The edge-ratio bound then gives
  #[#set math.equation(numbering: n => "(6.19)")
   $ s \( P_(upright("ball")) \) gt.eq alpha / 2 K^(- m) W_(upright("center")) . $ <eq:coloring-ball-root-cost>]
  Divide Equation (6.18) by $2 n$ and let $n arrow.r oo$. Equation (6.15) makes the left side tend to
    $cal(S) \( c \)$. On the right, $W thin d nu = d mu thin d s$,
    and the allowed height interval has length $2 n - 2 m log K$ for all sufficiently large $n$.
    Thus Equation (6.19) gives
  $ alpha / 2 K^(- m) mu \( C \) lt.eq cal(S) \( c \) . $
  Summing over the bounded number of classes proves Equation (6.17).
    Every part of the argument uses only the stated probability-space, cocycle, degree, and matrix bounds,
    so it applies unchanged to the indicated extensions. ◻
]

=== 6.4 Assigning a small fraction of the remaining vertices <assigning-a-small-fraction-of-the-remaining-vertices>

We now use Equation (6.8) to choose colors. Changing one site has a controlled cost,
  but simultaneous changes must be compared in their intermediate environments.
  Independent uniform times provide an order for those comparisons.
  We first perform the comparison on a bounded height strip,
  where the costs have deterministic definitions by finite-neighborhood limits.
  Only then do we pass to the homogeneous costs. This order of operations will avoid evaluating a version of an
  $L^1$ limit at a random value of its parameter.

Fix a current partial coloring $c$ determined by coordinates already used, and let $E_0 = { c = 0 }$.
  At every site in $E_0$, choose a color $i \( v \)$ minimizing $macron(d)^i \( v \)$.
  Break ties by a fresh uniform random permutation of the colors, independently at each site,
  taking the first minimizer in that permutation. The costs of $c$ are first defined on the space carrying the old
  coordinates and then pulled back to the space carrying the extra tie coordinates.
  The bounded-cut definitions and their limits commute with this pullback.
  In particular, the choices $i \( v \)$ use only old and tie coordinates.

Now add fresh independent uniform times $U_v in \( 0 \, 1 \)$ at the sites,
  independent of both the old and the tie coordinates. For $0 lt.eq theta < 1$,
  define $c^theta$ by assigning $i \( v \)$ at each site $v in E_0$ with $U_v <
  theta$ and leaving all other sites as in $c$. All these definitions are measurable on the relative Bernoulli
  extension. Null exceptions can be filled by measurable default values before adding the next independent
  coordinates; their saturations are negligible. We use this convention throughout the finite sequence of steps below.

#thm([Lemma 6.5.])[
  (One assignment step).  #emph[Under the hypotheses of Theorem 18,
    let $c$ be any partial coloring determined before the fresh times,
    and choose $i \( v \)$ and $c^theta$ as just described. There is a nonnegative function $g$,
    depending only on the fixed graph and polynomial parameters, such that $g \( h \) arrow.r
    0$ as $h arrow.b 0$ and, for every $0 < h < 1 \/ 2$,
#[#set math.equation(numbering: n => "(6.20)")
 $ cal(S) \( c^h \) lt.eq \( 1 + 24 h \) cal(S) \( c \) + h g \( h \) . $ <eq:coloring-step-bound>]

 The same function $g$ works for all such steps and current configurations.]
] <lem:hazard-step>

#proof[
  Apply Lemma 16 to the change from $c$ to $c^h$ on the invariant lift restricted to $Sigma_n$.
    Order the changed sites by their times $U_v$. These times are almost surely distinct along every countable
    orbit, after discarding a saturated null set. The order need not be a well-order, as allowed in that lemma.
    At a comparison site $v$ the pre-change configuration is the restriction of $c^(U_v)$,
    with the number $U_v$ held fixed as a threshold along that orbit.
  We claim that the resulting integral of the single-site increments is
  #[#set math.equation(numbering: n => "(6.21)")
   $ & integral_(Sigma_n) #scale(x: 120%, y: 120%)[\(] m_(Sigma_n) \( c^h \) -
     m_(Sigma_n) \( c \) #scale(x: 120%, y: 120%)[\)] thin d nu\
 & quad = integral_0^h frac(d theta, 1 - theta) integral_(Sigma_n) 1_({ v in E_0 \, med U_v gt.eq theta })
   [d_(Sigma_n)^(i \( v \)) \( c^theta \) - d_(Sigma_n) \( c^theta \)] d nu . $ <eq:coloring-finite-strip-step>]
  Here $nu$ includes all label laws as well as the height measure,
    and $v$ denotes the current base site of a lifted root.
  To justify the claim, condition at a root in $E_0$ on the old coordinates, all tie coordinates,
    and every fresh time except the time at that root. Hold the height fixed as well.
    For a fixed threshold $theta$, leave the root site unassigned,
    and denote the bracketed difference in Equation (6.21) by $D \( theta \)$ for these fixed other data.
    Whenever the root time $u_0$ is at least $theta$, this difference is independent of its actual value.
    The chosen colors were determined before the fresh times,
    other sites use only their own fresh times in the threshold test,
    and neither the graph nor the restricted weight data use this new root coordinate.
    This independence holds for the deterministic rooted finite-subset calculations and hence for the
    bounded-strip costs obtained from them. The same description applies at $u_0 =
    theta$ because the update condition is strict.
  When $u_0 < h$, the ordered comparison increment at the root is therefore $D \( u_0 \)$,
    outside the null event of a tie with another site. Integrating over this last uniform time uses precisely the
    identity
  $ integral_0^h D \( u_0 \) thin d u_0 = integral_0^h frac(d theta, 1 - theta) integral_theta^1 D \( theta \)
    thin d u_0 . $
  The bounded-strip computations are measurable jointly in the threshold and in the remaining data,
    again by their finite rooted definitions. Fubini’s Theorem,
    first for almost every root and height and then over the remaining coordinates, proves Equation (6.21).
    This argument takes place entirely before choosing any homogeneous limit version depending on $theta$.
  We can now pass to that limit in an integrated expression. Divide Equation (6.21) by $2 n$ and use Lemma 20.
    For the right side, adjoin $theta$ with normalized Lebesgue probability on $\[ 0 \, h \]$,
    holding it fixed along the equivalence relation, and regard $c^theta$ as one configuration on this augmented
    base. The lemma applies uniformly there. Its absolute integrated errors also control the errors after
    multiplication by the displayed mask, after selection among the finite list of options $i \( v \)$,
    and after multiplication by $\( 1 - theta \)^(- 1) lt.eq 2$.
    For a height-independent limit field, cancellation of $W$ against the height density leaves a height interval
    of length exactly $2 n$. Consequently
  #[#set math.equation(numbering: n => "(6.22)")
   $ cal(S) \( c^h \) - cal(S) \( c \) = integral_0^h frac(d theta, 1 - theta) integral_X
     1_({ v in E_0 \, med U_v gt.eq theta }) [macron(d)^(i \( v \)) \( c^theta \) - macron(d) \( c^theta \)] d
     mu . $ <eq:coloring-limit-step>]
  All fields in this formula have jointly measurable versions on the augmented space.
    No evaluation of an unspecified limit at the random diagonal $theta = U_v$ has been used.
  It remains to compare the intermediate costs with the old costs, for which $i \( v \)$ was chosen.
    Let $D_R$ be a finite bound, depending only on $D_0 \, R$, for the cardinality of a radius-$R$ graph ball.
    On the event that this ball has no update from $c$ to $c^theta$, the two partial colorings agree there.
    Equation (6.16) controls the integrated difference of their cost fields on that event;
    summing over the finite option list also controls the selected field.
    Conditional on the old and tie coordinates, the probability of an update anywhere in the ball is at most $D_R
    h$, by the union bound for the fresh uniform times. On the event that an update does occur,
    the cost differences are uniformly bounded by Lemma 19.
  These observations apply either for each fixed $theta$, or jointly with normalized measure on $\[ 0 \, h \]$ as
    above. They show that replacing the two costs in the brackets of Equation (6.22) by their values at $c$
    creates an error in absolute value at most
  #[#set math.equation(numbering: n => "(6.23)")
   $ C h #scale(x: 120%, y: 120%)[\(] gamma \( R \) + D_R h #scale(x: 120%, y: 120%)[\)] \, $ <eq:coloring-step-error>]
  where $C$ depends only on the fixed parameters. The factor $\( 1 - theta \)^(- 1)$ is bounded by $2$.
  The old costs and the minimizing choice $i \( v \)$ are independent of the fresh root time.
    The survival probability $1 - theta$ therefore cancels the denominator in Equation (6.22).
    By Equation (6.8), the resulting old-cost contribution is at most
  $ h integral_(E_0) #scale(x: 120%, y: 120%)[\(] macron(d)^(i \( v \)) \( c \) -
    macron(d) \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( v \) lt.eq
    24 h integral_(E_0) macron(m) \( c \) thin d mu lt.eq 24 h cal(S) \( c \) . $
  For each prescribed accuracy in Equation (6.23), first take $R$ large enough to control $gamma \( R \)$ and then
    take $h$ small enough to control $D_R h$. Equivalently, taking the infimum of these uniform error bounds over
    integer $R$ gives a nonnegative function $g \( h \) arrow.r 0$.
    This proves Equation (6.20) uniformly over the current configurations. ◻
]

=== 6.5 Completion of the coloring <completion-of-the-coloring>

The estimates now have the two features needed for a finite construction.
  Repeated small assignment steps can cover any prescribed ball with high probability, and,
  for a fixed total assignment time, their accumulated cost tends to zero with the step size.
  The bad-ball estimate then supplies the norm conclusion.

#proof[
  Work on the relative Bernoulli extension of the original base,
    reserving independent coordinates at every site for each step.
    Start with the all-unassigned coloring, whose cost is zero by Lemma 21.
    Choose $T_0 > 0$ and $h in \( 0 \, 1 \/ 2 \)$, and apply the construction of Lemma 22 with independent fresh
    coordinates for
  $ N = ceil.l T_0 \/ h ceil.r $
  steps. Write $S_j$ for the cost after $j$ steps. Iterating Equation (6.20) gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ S_N lt.eq frac(g \( h \), 24) #scale(x: 120%, y: 120%)[\(] \( 1 + 24 h \)^N -
     1 #scale(x: 120%, y: 120%)[\)] . $ <eq:coloring-iteration>]
  For fixed $T_0$ this tends to zero as $h arrow.b 0$, since $\( 1 + 24 h \)^N lt.eq exp \( 24 \( T_0 + h \) \)$.
  An unassigned site receives a color at its first successful hazard.
    Conditional on the original base point, its probability of remaining unassigned after all $N$ steps is
    $\( 1 - h \)^N lt.eq e^(- T_0)$. This conclusion does not depend on the color selected at a successful step.
    If $D_m$ bounds the size of a radius-$m$ ball, the conditional probability that any site in that ball remains
    unassigned is at most $D_m e^(- T_0)$. The unconditional probability that the ball is fully assigned but
    violates the required norm bound is at most $C_4 S_N$, by Lemma 21.
    First choose $T_0$ large, and then $h$ small, so that
  $ D_m e^(- T_0) + C_4 S_N < eta . $
  Complete the partial coloring by fresh independent uniform colors at the remaining sites.
    Every previously complete ball is unchanged. The resulting coloring therefore satisfies Equation (6.4).
  It remains to verify the conditional marginals. Fix a permutation $sigma$ of ${ 1 \, dots.h \, r }$,
    and let $Theta_sigma$ apply it to the color names in every tie-breaking permutation and every final uniform
    color input, leaving all times unchanged. This transformation fixes the original base point,
    commutes with rerooting, and preserves each conditional product measure $kappa_v$.
    On the height lift it also fixes the height, so it acts isometrically on every band $L^1$ space.
  Suppose inductively that the current coloring satisfies $c compose Theta_sigma = sigma compose c$.
    Exact pullback of the finite-cut calculations and their color covariance give
  $ #scale(x: 120%, y: 120%)[\(] \( d^(sigma \( i \)) \)^(l \, H) \( c \) #scale(x: 120%, y: 120%)[\)] compose
    Theta_sigma = \( d^i \)^(l \, H) \( c \) \, wide 1 lt.eq i lt.eq r . $
  The band $L^1$ isometry and uniqueness of the homogeneous limits give $\( macron(d)^(sigma \( i \)) \( c \) \)
    compose Theta_sigma = macron(d)^i \( c \)$ almost everywhere.
    Thus the set of minimizing colors at the transformed input is the $sigma$-image of the original minimizing
    set. The transformed permutation tie-breaker chooses the corresponding color,
    and the update test is unchanged because the times are unchanged.
  There are only finitely many color permutations and, with $T_0 \, h$ fixed, finitely many steps.
    Choose a common conull set for the required identities, intersect its images under the finite color action,
    and discard the saturation of its complement under the relation.
    The induction just described then holds throughout the construction on that set,
    starting from the all-unassigned coloring. The final uniform color inputs transform in the same way,
    so the completed coloring also obeys $c compose Theta_sigma = sigma compose c$.
  Since $Theta_sigma$ preserves the conditional product measure over each original base point,
    disintegration shows that all output colors at the root have equal conditional probabilities for almost every
    base point. They sum to one, which proves Equation (6.3) and completes the proof. ◻
]

== 7 A Bernoulli model and transfer of state moments <sec:transfer>

Throughout this Section, $A subset M$ is a maximal abelian subalgebra, $M$ has separable predual,
  and $phi$ is a faithful normal state with $A subset M_phi$. We retain the notation of Section 3:
  $N$ is the algebra generated by the groupoid normalizers of $A$, $E_N : M arrow.r
  N$ is the $phi$-preserving conditional expectation, $M^compose = ker E_N$,
  and $N_(upright("alg"))$ is the algebra of finite sums of base functions times kernel groupoid normalizers.
  The Cartan inclusion $A subset N$ is represented by a countable nonsingular measured equivalence relation
  $cal(R)$ on $\( X \, mu \)$, with its scalar cocycle.

The coloring constructed in Section 6 belongs to the Bernoulli extension of this relation.
  We first place that extension and $M$ in a common von Neumann algebra.
  The resulting model gives a norm bound for the part of an operator in $M^compose$.
  We then show that every fixed scalar moment involving finitely many model cylinder functions is a limit of
  averaged moments in $M$. This is the step that will bring the model color projections back into $A$.

=== 7.1 The model and a free compression bound <the-model-and-a-free-compression-bound>

Let $tilde(X)$ be the relative Bernoulli extension of $\( X \, mu \, cal(R) \)$ from Section 6,
  with one Lebesgue label at each site of a relation class.
  Write $tilde(mu)$ for its probability measure and $B = L^oo \( tilde(X) \, tilde(mu) \)$.
  Re-rooting preserves the label assignment as a function on the sites.
  In particular, each extended relation class projects bijectively onto its base class.
  Let $tilde(N)$ be the von Neumann algebra of the extended relation,
  with the scalar cocycle of $N$ pulled back to the extension.

#thm([Lemma 7.1.])[
  (The Bernoulli free-product model).  #emph[The pullback of base kernel operators identifies $N$ with a von
    Neumann subalgebra of $tilde(N)$. There is a faithful normal conditional expectation
$ tilde(E)_N : tilde(N) arrow.r N $

 whose restriction to $B$ integrates labels conditional on the base point.
   If $tilde(phi)$ denotes integration of the diagonal in $tilde(N)$, then
$ \( phi \|_N \) compose tilde(E)_N = tilde(phi) . $

 Moreover, the reduced amalgamated free product
$ cal(K) = M *_N tilde(N) $

 has a faithful normal conditional expectation $E_N^(cal(K))$ onto $N$, restricting to $E_N$ and $tilde(E)_N$. The state
$ Phi = \( phi \|_N \) compose E_N^(cal(K)) $

 is faithful and normal, restricts to $phi$ and $tilde(phi)$ on the two constituent algebras,
   and satisfies $B subset cal(K)_Phi$. The two constituent algebras are free over $N$:
   the expectation of every alternating product of letters from $ker E_N$ and $ker tilde(E)_N$ is zero.]
] <lem:bernoulli-model>

#proof[
  Use the right-counting direct-integral representations recalled in Section 3.
    Under the bijection between extended and base classes, a pulled-back base kernel acts by the same orbit
    operator on each fiber. Pullback is a normal faithful representation:
    it is an amplification over the conditional probability spaces of labels.
    Equivalently, matrix coefficients against vector fields on the extension disintegrate to normal functionals on
    the original decomposable algebra. The pulled-back copy of $N$ lies in $tilde(N)$,
    since this holds for the generating kernel normalizers.
  The isometry from the original representation space to the extension space that makes a vector field constant in
    the labels intertwines these copies of $N$ and sends the original diagonal state vector to the new one.
    Compression by this isometry maps $tilde(N)$ normally into $N$.
    To see the range assertion, first consider finite sums of $B$-functions times lifted base groupoid
    normalizers. Compression integrates the coefficient functions over the labels at the relevant sites and hence
    has its range in $N$. These finite sums form a weakly dense $*$-algebra:
    the lifted partial isomorphisms enumerate the extended relation, and their cuts by extension-measurable sets,
    together with scalar phase functions, give its kernel normalizers.
    Normality of compression and weak closure of $N$ give the range assertion for all of $tilde(N)$.
  The compression is unital, $N$-bimodular, and equal to the identity on $N$,
    so it gives the asserted normal conditional expectation. It preserves the diagonal state.
    That state is faithful by the faithful normal diagonal expectation for a countable nonsingular relation
    algebra. Consequently $tilde(E)_N$ is faithful as well. The diagonal expectation is $B$-bimodular and $B$ is
    abelian, so $B subset tilde(N)_(tilde(phi))$.
  Both expectations onto $N$ are faithful and normal, and the constituent algebras are $sigma$-finite.
    The von Neumann algebra reduced amalgamated free-product construction therefore gives $cal(K)$,
    $E_N^(cal(K))$, generation by the two copies, and their freeness over $N$;
    see [18] Section 2 and [19] Section 2. These hypotheses are the faithful-normal conditional-expectation
    hypotheses of that construction, and do not require tracial states.
    Faithfulness and normality of $Phi$ follow from those of the expectation and of $phi \|_N$.
  For completeness, the product has $Phi$-preserving conditional expectations onto each constituent algebra.
    Fix one constituent and compress the state representation of $cal(K)$ to the closure of its state vectors.
    The linear span of $N$ and alternating centered words is weakly dense.
    Every reduced word containing a centered letter from the other constituent compresses to zero:
    test between vectors from the retained algebra, expand at the two ends,
    and absorb the resulting $N$-coefficients into adjacent letters; freeness then applies.
    The retained algebra acts normally and faithfully on its state-vector space.
    Compression is thus a normal bimodular state-preserving map onto that represented algebra.
    By Takesaki’s Theorem [17], the modular group of $Phi$ restricts to the modular group of each constituent.
    This also agrees with [19] Equation (2.1). Since $B$ is in the centralizer of $tilde(phi)$, it is in $cal(K)_Phi$. ◻
]

#thm([Lemma 7.2.])[
  (Free compression).  #emph[In the model of Lemma 23, let $p in
    B$ be a projection such that $tilde(E)_N \( p \) = lambda 1$, where $0 lt.eq lambda lt.eq 1$.
    For every $w in M^compose$,
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel p w p parallel lt.eq \( lambda + 2 sqrt(lambda) \) parallel w parallel . $ <eq:free-compression>]

]
] <lem:free-compression>

#proof[
  In $L^2 \( cal(K) \, Phi \)$, let $P$ be the orthogonal projection onto the closed span of reduced-word vectors
    whose first letter is a centered $M$-letter. The orthogonal complement is spanned densely by the $N$-vectors
    and the reduced-word vectors whose first letter is a centered $tilde(N)$-letter.
    Both the spanning assertion and the orthogonality follow from generation and freeness over $N$.
  Left multiplication by $w$ sends each of these generators of the orthogonal complement into the range of $P$. Thus
  $ \( 1 - P \) w \( 1 - P \) = 0 . $
  On a word beginning with a centered $M$-letter, left multiplication by $p -
    lambda 1$ inserts a centered $tilde(N)$-letter at the beginning. Its image is orthogonal to the range of $P$. Hence
  $ P p P = lambda P \, wide parallel P p parallel^2 = parallel P p P parallel lt.eq lambda . $
  Insert $P + \( 1 - P \)$ on both sides of $w$ in $p w p$. The term with $\( 1 - P \) w \( 1 - P \)$ vanishes.
    The remaining three terms have norms at most $lambda parallel w parallel$, $sqrt(lambda) parallel w parallel$,
    and $sqrt(lambda) parallel w parallel$, respectively. This proves Equation (7.1). ◻
]

=== 7.2 Finite symbols and their evaluation in the masa <finite-symbols-and-their-evaluation-in-the-masa>

We now specify the model functions that can be evaluated inside $A$.
  Fix an integer $s gt.eq 2$, and partition each Lebesgue label into $s$ equally likely symbols,
  identified with the $s$th roots of unity. A finite dyadic symbol partition, with $s$ a power of two,
  will suffice when we later approximate arbitrary labels.

A #emph[finite cylinder function] is a bounded function on $tilde(X)$ that depends measurably on the base point
  and on these symbols at a fixed finite list of translated sites.
  Each translated site is specified by a partial isomorphism with graph in $cal(R)$;
  the function may also depend on whether the base point belongs to that map’s domain.
  Let $cal(Y)$ be the algebra of finite sums of such functions times lifted base kernel groupoid normalizers.
  Covariance and composition show that this is a $*$-algebra. Conditional label integration gives

$ tilde(E)_N \( cal(Y) \) subset N_(upright("alg")) . $

Choose increasing finite Borel partitions $cal(P)_j$ of $X$ that generate $A$ and separate points outside the
  fixed null exceptions. For one such partition write $cal(P) = { e_a }_a$,
  identifying its pieces with their projections in $A$. For independent uniform $s$th roots of unity $z_a$, define

$ u_(cal(P)) = sum_a z_a e_a in A . $

Replace the symbol at a translated site by the value of $u_(cal(P))$ at that site,
  and replace every lifted base normalizer by its original normalizer in $N$.
  This defines an evaluation map, denoted by $upright("ev")_(cal(P)) : cal(Y) arrow.r N_(upright("alg"))$.
  Finite cylinder functions themselves evaluate to elements of $A$.

This evaluation respects multiplication and adjoints and fixes $N_(upright("alg"))$.
  Substitution is consistent under re-rooting and therefore with covariance.
  It also respects almost-everywhere identities. Indeed, conditional on almost every base point,
  each assignment of symbols to any finite list of distinct sites has positive probability.
  An identity of cylinder functions therefore holds for every such assignment outside a null set of base points,
  including the assignments produced by $u_(cal(P))$. The same reasoning applies to identities between finite sums
  of cylinder coefficients times normalizers: check the finitely supported root columns in the counting
  representations, including the common cocycle phases. Equality of these columns almost everywhere gives equality
  of the operators by faithfulness of the diagonal state. In particular,
  the definition does not depend on the chosen finite expression.

The norm of an evaluated cylinder coefficient is bounded by its original essential bound.
  For every fixed finite normalizer sum, its expression consequently gives a uniform bound on all evaluations.
  No uniform bound over arbitrary finite expressions will be needed.

Before stating the transfer result, we isolate the uniform approximation estimate needed for its fixed scalar
  words. It holds for any faithful normal state and will also be used in the final clipping argument.

#thm([Lemma 7.3.])[
  (Uniform right multiplication in the state norm).  #emph[Let $phi$ be a faithful normal state on a von Neumann
    algebra $M$. For every $C < oo$, every fixed $z in M$, and every $eta > 0$, there is $delta > 0$ such that
#[#set math.equation(numbering: n => "(7.2)")
 $ parallel D parallel lt.eq C \, quad parallel D parallel_phi < delta quad arrow.r.double quad
   parallel D z parallel_phi < eta . $ <eq:uniform-fixed-right>]

 The choice of $delta$ is uniform over all such $D$. For $U \, D in M$ and $b in M_phi$,
#[#set math.equation(numbering: n => "(7.3)")
 $ parallel U D parallel_phi lt.eq parallel U parallel parallel D parallel_phi \, wide
   parallel D b parallel_phi lt.eq parallel b parallel parallel D parallel_phi . $ <eq:state-left-centralizer>]

 More generally, the right multiplier bound is uniform when $z$ ranges over a norm-bounded set that is precompact
   in state norm. Consequently, a bounded family of errors tending uniformly to zero in state norm remains so
   after right multiplication by a fixed finite word whose factors range over such precompact sets or over bounded
   subsets of the centralizer. In particular, any specified bounded sequence converging to a fixed operator in
   state norm can be used as a right factor uniformly over its entire sequence.
   These conclusions permit bounded strong-\* approximation of fixed letters in fixed-length scalar words,
   uniformly in the intervening bounded centralizer factors and in the independently varying indices of other
   specified approximation sequences.]
] <lem:state-multipliers>

#proof[
  Let $Omega$ be the GNS state vector. Faithfulness makes it separating and hence cyclic for $M'$.
    For any $alpha > 0$, choose $c' in M'$ with $parallel z Omega - c' Omega parallel < alpha$.
    Then every $parallel D parallel lt.eq C$ satisfies
  $ parallel D z parallel_phi lt.eq C alpha + parallel D c' Omega parallel = C alpha +
    parallel c' D Omega parallel lt.eq C alpha + parallel c' parallel parallel D parallel_phi . $
  Choosing $alpha$ first proves the uniform assertion (7.2), including families indexed by additional parameters.
  The left multiplier bound is immediate. For $b in M_phi$ and $D_0 gt.eq 0$,
    centrality gives $phi \( b^(*) D_0 b \) = phi \( D_0 b b^(*) \)$.
    The functional $c mapsto phi \( D_0 c \)$ is positive on $M_phi$, since for $c gt.eq
    0$ there it equals $phi \( c^(1 \/ 2) D_0 c^(1 \/ 2) \)$.
    It follows that $phi \( b^(*) D_0 b \) lt.eq parallel b parallel^2 phi \( D_0 \)$, proving Equation (7.3).
  For a norm-bounded state-norm precompact set $cal(C)$, take a finite state-norm approximation $z_1 \, dots.h \,
    z_m$ at a prescribed accuracy. If $z in cal(C)$ is close to $z_i$, then
  $ parallel D z parallel_phi lt.eq parallel D z_i parallel_phi + C parallel z - z_i parallel_phi . $
  The finitely many fixed-factor moduli give one modulus for $cal(C)$.
    The set consisting of a convergent sequence and its limit is precompact,
    so this applies to every bounded sequence $z_j$ with $parallel z_j - z parallel_phi arrow.r 0$.
    Apply the right multiplier bounds successively in the order in which the factors occur.
    At each step the errors remain uniformly bounded in operator norm, so the next modulus continues to apply.
    For a scalar word with a middle error $D$, the estimate
  $ \| phi \( U D V \) \| lt.eq parallel U parallel thin parallel D V parallel_phi $
  and telescoping reduce the approximation to the preceding bounds.
    Strong-\* approximation ensures state-norm convergence of a replaced letter and its adjoint whenever both
    occur. For each fixed approximant the finite right words may be expanded as needed;
    its approximation index can then be sent to infinity after the uniform error estimates. ◻
]

#thm([Proposition 7.4.])[
  (Transfer of fixed scalar moments).  #emph[Let $A subset M$, $phi$, and $cal(K)$ be as in Lemma 23.
    Fix a finite symbol size $s$, the corresponding cylinder algebra $cal(Y)$,
    and the generating partition sequence $\( cal(P)_j \)$ just described.
    For any fixed integer $k gt.eq 1$ and fixed factors $Z_1 \, dots.h \, Z_k$, each chosen in $M$ or in $cal(Y)$,
    define $Z_h^(\( j \)) = Z_h$ for a factor chosen in $M$ and $Z_h^(\( j \)) =
    upright("ev")_(cal(P)_j) \( Z_h \)$ for a factor chosen in $cal(Y)$.
    Use the same independent symbols for all evaluations in a word. Then
#[#set math.equation(numbering: n => "(7.4)")
 $ lim_(j arrow.r oo) bb(E)_({ z_a }) phi #scale(x: 120%, y: 120%)[\(] Z_1^(\( j \)) dots.h.c Z_k^(\( j \))
   #scale(x: 120%, y: 120%)[\)] = Phi \( Z_1 dots.h.c Z_k \) . $ <eq:moment-transfer>]

]
] <prop:moment-transfer>

#proof[
  We first record how operator approximation will be used. We then reduce to centered cyclic words.
    Their label averages are sums of terms with prescribed equality relations among partition indices.
    A shortest pair of linked occurrences will give a state Cauchy–Schwarz estimate whose small factor is
    controlled by Proposition 8.
  ===== 7.2.1 Uniform approximation in fixed words. <uniform-approximation-in-fixed-words.>
  Lemma 25 controls bounded errors in the state norm when the right word is formed from fixed operators and
    bounded varying $A$-functions. Expanding each fixed finite normalizer sum when needed, telescoping and
  $ \| phi \( U D V \) \| lt.eq parallel U parallel thin parallel D V parallel_phi $
  bound scalar word errors uniformly over the evaluated diagonal functions.
    If a fixed $N$-letter is approximated by a bounded strongly convergent sequence from $N_(upright("alg"))$,
    that sequence and its limit form a set precompact in the state norm,
    so the lemma applies to the whole sequence as right factors.
    Each normalizer sum is expanded only after that approximant is fixed;
    no uniform bound on all such expansions is needed. The order is to fix an approximant,
    pass to the partition limit, and then let its approximation error tend to zero.
    The same statements apply in the model, with $Phi$ and bounded factors from $B$, which lies in its centralizer.
  ===== 7.2.2 Reduction to centered alternating words. <reduction-to-centered-alternating-words.>
  We induct on the number of factors. A word of length one in $M$ gives an identity.
    For one factor in $cal(Y)$, average its cylinder coefficients.
    At almost every base point, distinct sites in a fixed finite translated list eventually belong to distinct
    atoms of $cal(P)_j$. The averaged coefficient thus converges boundedly almost everywhere to its conditional
    label average. This is also state-norm convergence, and the fixed normalizers are allowed right multipliers.
    It proves Equation (7.4) in length one.
  Adjacent factors from the same algebra can be folded into one factor.
    For an alternating word, subtract and add the $N$-expectation of each factor in the model.
    Make this same expansion on the evaluated side; it is not necessary that a centered model factor remain
    centered after evaluation. The expectations of $cal(Y)$-factors lie in $N_(upright("alg"))$ and are fixed by
    evaluation. Every term containing an expectation can be reduced in length by folding it into a neighbor.
    If an arbitrary $N$-element from the expectation of an $M$-factor must be multiplied into a $cal(Y)$-factor,
    first approximate it boundedly in the strong-$*$ topology by $N_(upright("alg"))$.
    Such approximation follows from generation and Kaplansky density,
    and is legitimate on both sides by the uniform word estimates above.
    The induction hypothesis therefore handles all terms except fully centered alternating words.
    Their model expectation is zero by freeness.
  We may approximate each centered $M$-factor boundedly in the strong-$*$ topology by an entire analytic element
    for $sigma^phi$ belonging to $M^compose$. For example, convolve its modular orbit with Gaussian approximate
    identities; complex translations of the Gaussian give the entire continuation.
    The expectation $E_N$ commutes with the modular group, so the convolutions remain centered.
    Their complex modular translates also remain in $M^compose$, by analytic continuation after applying $E_N$.
  Each centered $cal(Y)$-factor is a finite sum of terms $v b$,
    where $v$ is a base kernel groupoid normalizer and $b$ is a cylinder function whose conditional label average
    is zero. To obtain this form, move each coefficient to the right of its normalizer by covariance on the
    relevant supports, incorporating bounded base coefficients into $b$,
    and subtract the expectation of each summand. The sum of the subtracted expectations is zero.
    Cut the initial support of each $v$ as in Section 3 to make it entire analytic.
    These cuts preserve centering of the cylinder coefficients and have arbitrarily small state errors in the
    fixed words. The cylinder functions and their evaluations belong to the respective centralizers.
    Hence complex modular shifts of $v b$ are compatible with evaluation:
    the shift only changes the cut normalizer by the same bounded base formula in both algebras.
    We fix these analytic approximants before passing to the partition limit;
    their complex-shift norms may enter all subsequent bounds.
  For an odd alternating word of length at least three, the first and last factors lie in the same constituent
    algebra. Apply the KMS identity
  $ phi \( Z Y \) = phi #scale(x: 120%, y: 120%)[\(] Y sigma_(- i)^phi \( Z \) #scale(x: 120%, y: 120%)[\)] $
  to the first evaluated analytic factor, and the corresponding identity for $Phi$ in the model.
    Fold the last factor with the shifted first factor and apply the induction hypothesis to the shorter word.
    Its model value equals that of the original centered word and is therefore zero.
  For an even alternating word, rotate in the same way if necessary to start in $M^compose$.
    Expand the other-side factors as $v b$ and absorb each $v$ into the preceding centered $M$-factor.
    Modular shifts of normalizers, if present, only add fixed base coefficients.
    Writing the length of this word as $2 m$, it remains to prove that the averaged evaluations of
  #[#set math.equation(numbering: n => "(7.5)")
   $ phi \( y_1 d_1 dots.h.c y_m d_m \) $ <eq:cyclic-centered-word>]
  tend to zero. Here the $y_h$ are fixed bounded entire analytic elements of $M^compose$,
    and each $d_h in A$ is the substitution in a centered finite cylinder function.
    All constants below may depend on this fixed word and on the fixed analytic approximants.
  ===== 7.2.3 Fourier expansion and index equalities. <fourier-expansion-and-index-equalities.>
  Split each cylinder domain according to the domains of its translated sites and the equality pattern among those
    sites. On each piece, its distinct label symbols are independent.
    Fourier expansion on the finite product of cyclic groups expresses the centered coefficient as a finite sum of
    monomials with fixed bounded $A$-coefficients. Centering removes the constant Fourier term.
    Delete occurrences having exponent zero modulo $s$. Each remaining monomial has at least one occurrence,
    and all its exponents are nonzero modulo $s$. Within each diagonal block $d_h$,
    the sites of its occurrences are pointwise distinct on that block’s indicated support.
  We may, after further finite splitting, regard every translation used at an occurrence as an automorphism of the
    full abelian algebra $A$. Here the extension away from the specified support need not belong to $cal(R)$.
    Proposition 8 shows that the $y_h$ annihilate the atomic part of $A$ on both sides,
    so only diffuse supports contribute to Equation (7.5). The partial isomorphisms map these supports into the
    diffuse part modulo null sets. Split a nonnull common domain piece of a block into two positive-measure
    pieces. On either smaller piece, both its domain and the range of each restricted map have nonnull diffuse
    complements in the diffuse part: the other piece and its image provide such complements.
    Normalize the measures on each pair of complements separately and use the isomorphism theorem for atomless
    standard probability spaces [7] Theorem 17.41. It extends each restricted map to a measure-class automorphism
    of the diffuse part. Use the identity on the atomic part.
    This gives finitely many terms, and for an occurrence $o$ we can write its translation as
  $ lambda_o \( f \) = f compose gamma_o \, wide f in A \, $
  where $gamma_o$ is a nonsingular measurable bijection modulo null sets.
  Expand Equation (7.5) in partition indices $a_o$, one for each occurrence.
    Averaging the independent symbols $z_a$ keeps precisely the index equality patterns for which the sum of the
    Fourier exponents in each equality class is zero modulo $s$.
    Since individual exponents are nonzero, every such class has at least two occurrences.
    Inclusion–exclusion over the finitely many possible coarsenings removes inequalities between distinct classes.
    Thus it suffices to prove vanishing for a sum with prescribed equalities within the classes of a partition of
    the occurrences, every class having size at least two, and with no inequalities imposed between classes.
    An occurrence contributes the projection $lambda_o \( e_(a_o) \)$.
  We will keep selected pair equalities as explicit summation indices.
    Whenever the selected pairs form a forest in each equality class,
    extend them to a spanning tree of that class. Encode the other tree edges with independent auxiliary phases.
    For an edge between indices $a \, b$, its equality indicator is
  $ upright(bold(1))_({ a = b }) = bb(E)_(bold(zeta)) #scale(x: 120%, y: 120%)[\(] zeta_a overline(zeta_b)
    #scale(x: 120%, y: 120%)[\)] \, $
  where the $zeta_a$ are independent uniform circle phases; use a fresh phase vector for each edge.
    At an occurrence $o$, let $w_o \( a \)$ be the product of its incident auxiliary edge phases,
    with conjugates according to their orientations and with empty product one. Thus $\| w_o \( a \) \| = 1$. Set
  $ U_o = sum_a w_o \( a \) lambda_o \( e_a \) . $
  The projections ${ lambda_o \( e_a \) }_a$ form a partition, so $U_o$ is a diagonal unitary.
    Summing an unretained index gives $U_o$, while at a retained index $j$ one has
  $ w_o \( j \) lambda_o \( e_j \) = U_o lambda_o \( e_j \) . $
  Thus each $U_o$, as an operator, is independent of the retained numerical indices.
    Different $U_o$ may be correlated through the auxiliary phases;
    the estimates below hold uniformly over their joint realizations as diagonal unitaries before averaging.
    Products of these factors commute within each diagonal block.
  ===== 7.2.4 A pair in one diagonal block. <a-pair-in-one-diagonal-block.>
  Suppose two occurrences in one equality class belong to the same block.
    Retain their pair equality and encode the remaining tree edges as just described.
    Summing the pair index produces the projection
  $ p_(cal(P)) = upright(bold(1))_(upright("support")) sum_a lambda_o \( e_a \) lambda_(o') \( e_a \) . $
  The two sites are distinct on the fixed support, while the partitions separate points.
    Hence $mu \( p_(cal(P)) \) arrow.r 0$. Use KMS rotation to place this projection first in the word.
    Only fixed analytic letters are shifted; diagonal factors are in the centralizer and remain unchanged.
    The rotated word has the form $phi \( p_(cal(P)) Z \)$ with a uniform norm bound on $Z$. Centrality gives
  $ \| phi \( p_(cal(P)) Z \) \| = \| phi \( p_(cal(P)) Z p_(cal(P)) \) \| lt.eq
    parallel Z parallel thin mu \( p_(cal(P)) \) \, $
  so these sums tend to zero uniformly in the auxiliary phases.
  ===== 7.2.5 A shortest pair between different blocks. <a-shortest-pair-between-different-blocks.>
  It remains to treat equality patterns with at most one occurrence of any class in each diagonal block.
    This case has $m gt.eq 2$. Number the blocks by $bb(Z) \/ m bb(Z)$, and for distinct positions $h \, k$ define
  $ d_m \( h \, k \) = min { \( k - h \) med mod med m \, \( h - k \) med mod med m } \, $
  where both residues are taken in ${ 1 \, dots.h \, m - 1 }$.
    Among pairs of occurrences in the same class, choose one minimizing this cyclic distance,
    and call the minimum $ell$. Choose the endpoint order so that one shortest arc runs forward in the cyclic
    order of the word, and label its blocks $0 \, 1 \, dots.h \, ell$;
    either endpoint order is allowed in an antipodal tie.
  For each interior block $h = 1 \, dots.h \, ell - 1$, choose one occurrence and one other occurrence of its
    class. Its mate lies outside the entire chosen arc, including the endpoints.
    Indeed, a mate in another block $k$ on that arc would satisfy $d_m \( h \, k \) lt.eq \| h - k \| < ell$,
    contradicting minimality. The same inequality shows that the interior classes are distinct from each other and
    from the endpoint class. When $ell = 1$ there are no interior blocks.
  Retain the endpoint pair and these interior-to-mate pairs.
    These pairs lie in distinct equality classes, so they form a forest and can be included in the spanning trees
    used above. The retained indices are $J = \( j_0 \, j_1 \, dots.h \, j_(ell - 1) \)$,
    with $j_0$ linking the endpoints. Write
  $ E_0 = lambda_0 \( e_(j_0) \) \, wide E'_ell = lambda_ell \( e_(j_0) \) \, wide E_h =
    lambda_h \( e_(j_h) \) quad \( 1 lt.eq h < ell \) . $
  Each $j_h$ for $h gt.eq 1$ occurs in one further retained projection in an exterior block.
    Several such mate projections may lie in the same exterior block.
  Rotate the summands by KMS to begin at $E_0$, and insert $E_0$ at the far end inside the state,
    using centrality. Absorb fixed diagonal coefficients into neighboring fixed letters.
    More explicitly, within a diagonal block place the retained projections first, then the auxiliary unitaries,
    then its fixed coefficient; absorb that coefficient into the following intervening letter.
    The fixed intervening letters, including any modular translates created by rotation,
    remain bounded analytic elements of $M^compose$. Relabel them as $y_h$,
    and write $V_h in A$ for the auxiliary unitaries, which are independent of the explicit indices.
    Split the word at $E'_ell$ using $\( E'_ell \)^2 = E'_ell$.
    Before averaging the auxiliary unitaries, the resulting summands have the form $phi \( X_J Y_J \)$, where
  #[#set math.equation(numbering: n => "(7.6)")
   $ X_J & = E_0 V_0 (product_(h = 1)^(ell - 1) y_h E_h V_h) y_ell E'_ell \,\
Y_J & = E'_ell V_ell B_(j_1 \, dots.h \, j_(ell - 1)) E_0 . $ <eq:shortest-pair-factors>]
  The product in $X_J$ is in increasing order and is omitted when $ell = 1$.
    In $B_(j_1 \, dots.h \, j_(ell - 1))$, each exterior mate projection for these indices occurs exactly once;
    every other factor is independent of them. Diagonal factors in the same block commute.
  Figure 1 illustrates the selected links in one allowed cyclic pattern.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.5), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_0$]]])])
  content((2, 1.5), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_1$]]])])
  content((4, 1.5), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_2$]]])])
  content((6, 1.5), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_3$]]])])
  content((6, -1), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_4$]]])])
  content((4, -1), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_5$]]])])
  content((2, -1), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_6$]]])])
  content((0, -1), [#box(width: 1.1cm, height: 0.75cm, inset: 0.07056cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$d_7$]]])])
  line((0.55, 1.5), (1.45, 1.5), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((2.55, 1.5), (3.45, 1.5), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((4.55, 1.5), (5.45, 1.5), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((6, 1.125), (6, -0.625), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((5.45, -1), (4.55, -1), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((3.45, -1), (2.55, -1), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((1.45, -1), (0.55, -1), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  line((0, -0.625), (0, 1.125), stroke: (thickness: 0.35pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: black)))
  bezier((0, 1.875), (6, 1.875), (1.433e-16, 4.215), (6, 4.215), stroke: (thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  content((3, 3.63), [#text(size: 9pt)[$j_0$]], anchor: "south", padding: 0.1176cm)
  bezier((2, 1.125), (3.8, -0.625), (2.414, 0.2376), (3.465, 0.295), stroke: (thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.823, 0.3258), [#text(size: 9pt)[$j_1$]], anchor: "east", padding: 0.1176cm)
  bezier((4, 1.125), (4.2, -0.625), (4.235, 0.4795), (4.435, 0.02051), stroke: (thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.259, 0.3329), [#text(size: 9pt)[$j_2$]], anchor: "west", padding: 0.1176cm)
  circle((0, 1.875), radius: 0.04939, fill: black, stroke: none)
  circle((6, 1.875), radius: 0.04939, fill: black, stroke: none)
  circle((2, 1.125), radius: 0.04939, fill: black, stroke: none)
  circle((4, 1.125), radius: 0.04939, fill: black, stroke: none)
  circle((3.8, -0.625), radius: 0.04939, fill: black, stroke: none)
  circle((4.2, -0.625), radius: 0.04939, fill: black, stroke: none)
  content((3, 2.1), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[short arc: $X_J$]]])])
  content((3, -1.7), [#text(size: 9pt)[complementary arc: $Y_J$]])
})],
    caption: [Figure 1: Selected equality links in one fixed cyclic word with eight diagonal blocks and $ell = 3$. The short arc $0 arrow.r 1 arrow.r 2 arrow.r 3$ and its complement indicate the positions contributing to $X_J$ and $Y_J$. The two marks in block $5$ are distinct mate occurrences. Further occurrences and equality links are omitted; distinct prescribed classes may use equal numerical partition indices after inequalities between classes have been removed. ],
  ) <fig:shortest-pair>
  State Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ lr(|sum_J phi \( X_J Y_J \)|) lt.eq (sum_J phi \( X_J X_J^(*) \))^(1 \/ 2)
     (sum_J phi \( Y_J^(*) Y_J \))^(1 \/ 2) . $ <eq:shortest-pair-cs>]
  The second square sum is uniformly bounded. First drop $E'_ell$ from the positive operator bound for $Y_J^(*)
    Y_J$. Order the exterior mate occurrences from left to right,
    using commutativity for those in one diagonal block. Write
    $upright(bold(j)) = \( j_1 \, dots.h \, j_(ell - 1) \)$. At the first remaining mate occurrence, factor
  $ B_(upright(bold(j))) = C_0 F_j B'_(upright(bold(j))') \, $
  where $j$ is that occurrence’s index, $upright(bold(j))'$ lists the others,
    ${ F_j }_j$ is its projection partition, and $C_0 \, B'_(upright(bold(j))')$ are independent of $j$. Then
  $ sum_j B_(upright(bold(j)))^(*) B_(upright(bold(j))) = B'_(upright(bold(j))')^(*) (sum_j F_j C_0^(*) C_0 F_j)
    B'_(upright(bold(j))') lt.eq parallel C_0 parallel^2 B'_(upright(bold(j))')^(*) B'_(upright(bold(j))') . $
  Iterating over the remaining mate occurrences, with the fixed norm bounds on the intervening multipliers, gives
  $ sum_(j_1 \, dots.h \, j_(ell - 1)) B_(j_1 \, dots.h \, j_(ell - 1))^(*) B_(j_1 \, dots.h \, j_(ell - 1)) lt.eq
    C thin 1 $
  for a fixed constant $C$. When $ell = 1$, this is simply the fixed norm bound for the exterior word.
    Finally sum the $E_0$ corners in the state. As ${ lambda_0 \( e_(j_0) \) }_(j_0)$ is a partition in the
    centralizer, this leaves a bound independent of $cal(P)$ and of all auxiliary unitaries.
  We have reduced the moment estimate to the first square sum in Equation (7.7).
    Its smallness will come from a collision between the two endpoint indices.
    The interior pinchings first converge at fixed coarse endpoint data;
    only afterward will those coarse endpoint data be refined.
  Remove $V_0$ from the state by centrality and sum the interior indices in $X_J X_J^(*)$. The result is
  #[#set math.equation(numbering: n => "(7.8)")
   $ sum_(j_0) phi #h(-0.16667em)
     (lambda_0 \( e_(j_0) \) C_(cal(P)) #scale(x: 120%, y: 120%)[\(] lambda_ell \( e_(j_0) \)
     #scale(x: 120%, y: 120%)[\)] lambda_0 \( e_(j_0) \)) \, $ <eq:endpoint-collision>]
  where the positive map $C_(cal(P)) : A arrow.r M$ is given by the nested operations
  $ C_(cal(P)) \( f \) & = L_1 \,\
L_ell & = y_ell f y_ell^(*) \,\
L_h & = y_h S_(lambda_h \( cal(P) \)) \( V_h L_(h + 1) V_h^(*) \) y_h^(*) wide \( h = ell - 1 \, dots.h \, 1 \) . $
  For $ell = 1$ this means simply $C_(cal(P)) \( f \) = y_1 f y_1^(*)$.
  Fix a coarse partition $cal(Q)$ from the generating sequence and let $cal(P)$ refine it.
    Positivity permits each input projection in Equation (7.8) to be enlarged to its coarse piece.
    Regrouping the output corners by centrality then bounds that expression by
  #[#set math.equation(numbering: n => "(7.9)")
   $ sum_(e in cal(Q)) phi #h(-0.16667em)
     (lambda_0 \( e \) C_(cal(P)) #scale(x: 120%, y: 120%)[\(] lambda_ell \( e \) #scale(x: 120%, y: 120%)[\)]
     lambda_0 \( e \)) . $ <eq:coarse-endpoint-bound>]
  For each fixed $f in A$, the nested expression defining $C_(cal(P)) \( f \)$ converges in state norm to the
    expression in which each pinching is replaced by $E_A$ and the $V_h$ disappear.
    This convergence is uniform over the auxiliary unitaries. Indeed, work from the innermost pinching outward.
    Each translated sequence $lambda_h \( cal(P)_j \)$ is generating,
    so Lemma 5 gives its state-norm convergence to $E_A$ on a fixed input.
    Conjugation by $V_h$ commutes with the pinching, preserves the state norm,
    and fixes the limiting $A$-valued datum. Pinching is contractive in the state norm.
    Its error can thus be propagated through the fixed left and right multipliers $y_h \, y_h^(*)$ using Lemma 25,
    uniformly over all the remaining phases. This proves the asserted inside-out convergence.
  Define positive kernel maps on $A$ by
  $ K_h \( f \) = E_A \( y_h f y_h^(*) \) wide \( 1 lt.eq h lt.eq ell \) . $
  For each fixed input $f = lambda_ell \( e \)$, $e in cal(Q)$, the preceding convergence applies.
    Since $cal(Q)$ is finite, the limit of Equation (7.9), with $cal(Q)$ fixed, is
  #[#set math.equation(numbering: n => "(7.10)")
   $ sum_(e in cal(Q)) integral_X lambda_0 \( e \) \( K_1 compose dots.h.c compose K_ell \)
     #scale(x: 120%, y: 120%)[\(] lambda_ell \( e \) #scale(x: 120%, y: 120%)[\)] thin d mu .
     $ <eq:coarse-kernel-collision>]
  Proposition 8, applied to the adjoints of the $y_h$, says that these kernels and their composition are atomless
    almost everywhere. In taking compositions, a preceding kernel avoids the fixed null exceptional set where a
    following kernel may fail to be atomless.
  Finally refine $cal(Q)$ along the generating sequence. The integrand sum in Equation (7.10) tests whether
    $gamma_0$ of the output site and $gamma_ell$ of the input site lie in the same partition piece.
    These conditions decrease to equality of those two points.
    Since $gamma_ell$ is one-to-one, this is a graph having zero conditional mass for each atomless row of the
    composed kernel. Nonsingularity makes all fixed null exceptions irrelevant.
    The kernel masses are bounded, so bounded convergence shows that Equation (7.10) tends to zero.
  For each fixed coarse $cal(Q)$, the limsup of the first square sum,
    even after taking the supremum over the auxiliary unitaries at each fine $cal(P)$,
    was bounded by Equation (7.10). First take that fine-partition limsup and then refine $cal(Q)$.
    The first square sum therefore vanishes uniformly in the auxiliary phases.
    The second square sum was uniformly bounded, so Equation (7.7) proves vanishing of the equality-pattern sum.
    Averaging the auxiliary phases, undoing the finite inclusion–exclusion and Fourier expansions,
    and then removing the fixed analytic approximations proves the required vanishing in Equation (7.5).
    The induction now proves Equation (7.4). ◻
]

The moment-transfer statement uses a fixed finite symbol alphabet.
  The following approximation allows it to be applied to the measurable color partitions supplied by Theorem 18.

#thm([Lemma 7.5.])[
  (Cylinder approximation of projection partitions).  #emph[In the Bernoulli extension of Lemma 23, let $p_1 \,
    dots.h \, p_r in B$ be projections with $sum_i p_i = 1$ and $p_i p_h = 0$ for $i eq.not h$.
    For every $delta > 0$ there is a projection partition $b_1 \, dots.h \, b_r in B$,
    each of whose members is a finite cylinder function for one common finite dyadic symbol size, such that
$ parallel b_i - p_i parallel_Phi < delta wide \( 1 lt.eq i lt.eq r \) . $

 Every evaluation of this cylinder partition by the preceding finite-symbol substitution gives a projection
   partition of $1$ in $A$, modulo the fixed null sets of its definition.]
] <lem:cylinder-partitions>

#proof[
  The extension $sigma$-algebra is generated by base measurable sets and countably many label-coordinate readings
    along the partial graphings. Dyadic approximations to the label coordinates therefore show that the finite
    cylinder set algebra, allowing arbitrary base measurable sets, is dense in probability.
    Approximate each of the measurable sets corresponding to the $p_i$ by sets in this algebra.
    Disjointize the approximations in order and put the remaining complement into one piece,
    retaining exactly $r$ pieces and covering the identity. The resulting symmetric-difference measures can be
    made arbitrarily small, which gives the displayed state-norm bounds for their projections.
    There are only finitely many pieces and coordinates, so all of them use one common finite dyadic symbol size
    after refinement.
  The resulting identities $b_i = b_i^(*) = b_i^2$, $b_i b_h = 0$ for $i eq.not h$, and $sum_i b_i =
    1$ are identities of finite cylinder functions. The full-support argument in the construction of
    $upright("ev")_(cal(P))$ shows that substitution preserves all these identities.
    Thus their evaluations form a genuine projection partition in $A$. ◻
]

== 8 Completion of the paving argument <sec:completion>

We now combine the coloring theorem and moment transfer. The coloring estimates apply to finite-support
  approximations of a Cartan operator. Before transferring a fixed moment,
  we must return to the original operator without requiring a rate of approximation depending exponentially on the
  moment order. A clipping argument accomplishes this. Its use in a nontracial state requires the following
  elementary observation about varying right multipliers.

=== 8.1 Continuous calculus for varying sequences <continuous-calculus-for-varying-sequences>

#thm([Lemma 8.1.])[
  #emph[Let $cal(L)$ be a von Neumann algebra with a faithful normal state $omega$.
    Let $cal(R)_omega$ consist of all uniformly bounded sequences $\( R_n \)$ in $cal(L)$ such that
$ parallel D_n R_n parallel_omega arrow.r 0 $

 whenever $\( D_n \)$ is uniformly bounded and $parallel D_n parallel_omega arrow.r 0$.
   Then $cal(R)_omega$ is an algebra, closed for the supremum operator norm.
   It contains all constant sequences and all uniformly bounded sequences in the centralizer of $omega$.
   It is also closed under adding uniformly bounded sequences converging to zero in $parallel dot.op parallel_omega$.]
  #emph[If $\( U_n \) \, \( V_n \) in cal(R)_omega$ are self-adjoint, uniformly bounded, and $parallel U_n -
    V_n parallel_omega arrow.r 0$, then for every continuous function $f$ on a compact interval containing their
    spectra,
$ \( f \( U_n \) \) \, \( f \( V_n \) \) in cal(R)_omega \, wide parallel f \( U_n \) -
  f \( V_n \) parallel_omega arrow.r 0 . $

]
] <lem:multiplier-calculus>

#proof[
  The assertions for constant sequences and centralizer sequences follow from Lemma 25.
    If $\( R_n \) \, \( S_n \) in cal(R)_omega$ and $\( D_n \)$ is a bounded state-norm-null sequence,
    then $\( D_n R_n \)$ is another such sequence, so $parallel D_n R_n S_n parallel_omega arrow.r 0$.
    Addition is immediate. Closure in the supremum norm follows by approximating the right multiplier uniformly
    before taking the limit in $n$.
  For the perturbation assertion, if $\( E_n \)$ is bounded and state-norm-null, then
  $ parallel D_n E_n parallel_omega lt.eq parallel D_n parallel thin parallel E_n parallel_omega arrow.r 0 . $
  Thus $\( R_n + E_n \) in cal(R)_omega$ whenever $\( R_n \) in cal(R)_omega$.
  For a polynomial $f$, the assertion about membership follows from the algebra property.
    Polynomial differences are controlled by the telescoping identity
  $ U_n^j - V_n^j = sum_(h = 0)^(j - 1) U_n^h \( U_n - V_n \) V_n^(j - 1 - h) . $
  Every right multiplier on the right belongs to $cal(R)_omega$, while the left multipliers are uniformly bounded.
    Each summand therefore tends to zero in state norm. Uniform polynomial approximation on the common spectral
    interval proves both assertions for continuous $f$. ◻
]

=== 8.2 Paving in the presence of a central state <paving-in-the-presence-of-a-central-state>

#thm([Proposition 8.2.])[
  #emph[Let $A subset.eq M$ be a masa and let $phi$ be a faithful normal state on $M$ with $A$ in its centralizer.
    For $0 < epsilon < 1$, put
$ r_(upright(e)) = ⌈20000^2 epsilon^(- 2)⌉ . $

 For every self-adjoint contraction $x in M$ and every $rho > 0$,
   there are a partition $P = \( p_1 \, dots.h \, p_(r_(upright(e))) \)$ in $A$ and a projection $q in M$ such that
$ phi \( 1 - q \) < rho \, wide parallel q \( S_P \( x \) - E_A x \) q parallel lt.eq epsilon . $

 Here $E_A$ is the $phi$-preserving conditional expectation onto $A$.]
] <prop:expected>

#proof[
  By Lemma 6, it suffices to work with separable predual. The conditional expectation in that reduction is the
    restriction of $E_A$, so proving the stated diagonal choice in the smaller inclusion proves it in the original
    one. We henceforth use the notation of Sections 3 and 7.
  Fix $r = r_(upright(e))$ and write
  $ a = E_A x \, wide y = E_N x - E_A x in N \, wide w = x - E_N x in ker E_N . $
  The three elements are self-adjoint, $parallel a parallel lt.eq 1$, and $parallel y parallel \,
    parallel w parallel lt.eq 2$. Moreover $E_A y = 0$: uniqueness of the $phi$-preserving expectation onto $A$
    gives $E_A E_N = E_A$.
  ===== 8.2.1 Finite-support Cartan approximations. <finite-support-cartan-approximations.>
  Choose self-adjoint contractions in $N_(upright("alg"))$ converging strongly to $E_N x$.
    To obtain them, first apply Kaplansky density to the norm closure of the finite normalizer algebra,
    then approximate its self-adjoint contractions in norm by self-adjoint elements of $N_(upright("alg"))$ and
    rescale. Bounded strong approximation can be taken sequentially in the faithful separable state representation.
  For each approximant, only finitely many partial isomorphisms occur in its support.
    We may also arrange a bound on their edge Radon–Nikodym ratios.
    Indeed, for such a finite list of maps $gamma$, remove from $X$ each domain set where
    $Delta \( gamma v \, v \)$ lies outside $\[ b^(- 1) \, b \]$,
    and let $e_b in A$ be the indicator of the remaining set.
    As $b arrow.r oo$, these projections increase strongly to $1$.
    Compressing the approximant by $e_b$ preserves self-adjointness and its contraction bound,
    and restricts every surviving edge to the required ratio range.
    Enlarge the finite list by its inverses if necessary. Choosing $b$ sufficiently large for each approximant
    preserves strong convergence.
  Subtracting the diagonal now gives a sequence
  #[#set math.equation(numbering: n => "(8.1)")
   $ y_n = y_n^(*) in N_(upright("alg")) \, wide E_A y_n = 0 \, wide parallel y_n parallel lt.eq 2 \, wide
     parallel y_n - y parallel_phi arrow.r 0 . $ <eq:cartan-approximants>]
  Each $y_n \/ 2$ is represented by measurable zero-diagonal Hermitian contractions on orbit $ell^2$ spaces,
    supported on an undirected graph of finite degree with bounded edge cocycle ratios.
    These bounds may depend on $n$. Theorem 18 permits this dependence: it does not affect $r$.
  ===== 8.2.2 One partition for the two operator terms. <one-partition-for-the-two-operator-terms.>
  Use the fixed relative Bernoulli extension $tilde(N)$ and amalgamated product
  $ cal(K) = M *_N tilde(N) \, wide Phi = phi \|_N compose E_N^(cal(K)) \, $
  from Lemma 23. Apply Theorem 18 to $y_n \/ 2$ with
  #[#set math.equation(numbering: n => "(8.2)")
   $ t = 4 / sqrt(r) \, wide alpha = epsilon / 32 \, wide m = n \, wide eta =
     (epsilon / 16)^(2 n) . $ <eq:coloring-parameters>]
  Denote the color projections by $p_1^n \, dots.h \, p_r^n in B$.
    They form a partition, belong to the centralizer of $Phi$, and satisfy
  #[#set math.equation(numbering: n => "(8.3)")
   $ tilde(E)_N \( p_i^n \) = r^(- 1) 1 wide \( 1 lt.eq i lt.eq r \) . $ <eq:color-marginals-completion>]
  With $beta = 80$, the norm bound supplied by the coloring theorem, after restoring the factor two, obeys
  #[#set math.equation(numbering: n => "(8.4)")
   $ 2 \( 2 beta t + alpha \) = 1280 / sqrt(r) + epsilon / 16 lt.eq 253 / 2000 epsilon < epsilon /
     4 . $ <eq:cartan-numerical-bound>]
  Put
  $ hat(Y)_n = sum_(i = 1)^r p_i^n y_n p_i^n in tilde(N) . $
  At a root where the radius-$n$ ball has the asserted pinching bound,
    $hat(Y)_n^n$ applied to the root vector agrees with the $n$th power of that principal matrix applied to the
    same vector. Every path of length $n$ starting at the root stays in its radius-$n$ ball.
    At all other roots, $parallel hat(Y)_n parallel lt.eq 2$. Integrating the squared norms of these vectors gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ Phi \( hat(Y)_n^(2 n) \) lt.eq (epsilon / 4)^(2 n) + 2^(2 n) (epsilon / 16)^(2 n) . $ <eq:cartan-high-moment>]
  This uses diagonal integration in the relation representation, not a trace on the nonsingular relation algebra.
  For the original operators set
  $ Y_n = sum_(i = 1)^r p_i^n y p_i^n \, wide W_n = sum_(i = 1)^r p_i^n w p_i^n . $
  Pinching by a centralizer partition is contractive in the state norm, so Equation (8.1) implies
  #[#set math.equation(numbering: n => "(8.6)")
   $ parallel Y_n - hat(Y)_n parallel_Phi arrow.r 0 . $ <eq:pinched-approximation>]
  By Lemma 24 and Equation (8.3),
  #[#set math.equation(numbering: n => "(8.7)")
   $ parallel W_n parallel lt.eq 2 (1 / r + 2 / sqrt(r)) lt.eq 40001 / 200000000 epsilon < epsilon /
     4 . $ <eq:free-numerical-bound>]
  Here orthogonality of the $p_i^n$ makes the norm of the block sum the maximum of its block norms.
    Thus the same $r$ projections control the complementary term; there is no second partition refinement.
  ===== 8.2.3 Clipping before fixing a transferred moment. <clipping-before-fixing-a-transferred-moment.>
  Let $f : bb(R) arrow.r \[ - epsilon \/ 2 \, epsilon \/ 2 \]$ be the continuous clipping function
  $ f \( s \) = max { - epsilon \/ 2 \, min { s \, epsilon \/ 2 } } . $
  Spectral calculus and Equation (8.5) show that
  $ Phi #scale(x: 120%, y: 120%)[\(] 1_({ \| hat(Y)_n \| > epsilon \/ 2 }) #scale(x: 120%, y: 120%)[\)] lt.eq
    (2 / epsilon)^(2 n) Phi \( hat(Y)_n^(2 n) \) lt.eq 2^(- 2 n) + 4^(- 2 n) . $
  Since $parallel hat(Y)_n parallel lt.eq 2$, it follows that
  #[#set math.equation(numbering: n => "(8.8)")
   $ parallel hat(Y)_n - f \( hat(Y)_n \) parallel_Phi arrow.r 0 . $ <eq:approximate-clipping>]
  We apply Lemma 28 in $cal(K)$. Each sequence $\( p_i^n \)$ lies in $cal(R)_Phi$, and $r$ is fixed.
    Hence $\( Y_n \)$ and $\( W_n \)$ belong to that algebra,
    being finite sums of products of centralizer sequences and fixed operators.
    Equation (8.6) also places $\( hat(Y)_n \)$ in it. Equations (8.6)–(8.8) and the continuous-calculus
    conclusion of the lemma yield
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel Y_n - f \( Y_n \) parallel_Phi arrow.r 0 . $ <eq:original-clipping>]
  The self-adjoint operators
  $ Z_n = Y_n + W_n = sum_(i = 1)^r p_i^n \( x - a \) p_i^n $
  therefore differ by a bounded state-norm-null sequence from
  $ Q_n = f \( Y_n \) + W_n \, wide parallel Q_n parallel lt.eq frac(3 epsilon, 4) . $
  Both sequences belong to $cal(R)_Phi$. For every fixed integer $k gt.eq 1$, telescoping their powers gives
  #[#set math.equation(numbering: n => "(8.10)")
   $ limsup_(n arrow.r oo) Phi \( Z_n^(2 k) \) lt.eq (frac(3 epsilon, 4))^(2 k) . $ <eq:fixed-model-moment>]
  Only a fixed power is used at this stage. In particular, Equation (8.1) required no prescribed rate of convergence.
  ===== 8.2.4 Transfer and the final spectral cut. <transfer-and-the-final-spectral-cut.>
  Fix $rho > 0$. First choose $k$ so large that $\( 3 \/ 4 \)^(2 k) < rho \/ 4$.
    Then choose $n$ sufficiently large in Equation (8.10) that
  $ Phi \( Z_n^(2 k) \) < rho / 2 epsilon^(2 k) . $
  With $n$ and $k$ fixed, approximate the partition $\( p_i^n \)$ in $B$ by a finite-symbol cylinder partition,
    using Lemma 27. Bounded state-norm approximation of these self-adjoint projections is strong-\* approximation,
    so the fixed polynomial moment changes arbitrarily little.
    We may retain the strict upper bound $rho epsilon^(2 k)$ with positive slack.
  Proposition 26 applies to the expansion of this moment. For a sufficiently fine base partition,
    its averaged evaluated moment remains strictly less than $rho epsilon^(2 k)$.
    Every evaluation is a genuine projection partition in $A$, and its even moment is nonnegative.
    Some deterministic evaluation consequently gives a partition $P = \( p_1 \, dots.h \, p_r \)$ with
  $ phi ([sum_(i = 1)^r p_i \( x - a \) p_i]^(2 k)) < rho epsilon^(2 k) . $
  Let $z = sum_i p_i \( x - a \) p_i = z^(*)$ and take $q = 1_(\[ - epsilon \, epsilon \]) \( z \) in M$. Then
  $ phi \( 1 - q \) lt.eq epsilon^(- 2 k) phi \( z^(2 k) \) < rho \, wide parallel q z q parallel lt.eq epsilon . $
  Because $a in A$ commutes with the partition, $z = S_P \( x \) - a$.
    This proves the proposition with the number of colors fixed before $rho$. ◻
]

=== 8.3 Arbitrary inclusions <arbitrary-inclusions>

#proof[
  If $x = 0$, take $p_1 = 1$, $p_2 = dots.h.c = p_(r_epsilon) = 0$, $a = 0$, and $q = 1$.
    Otherwise replace $x$ by $x \/ parallel x parallel$. Proposition 29, together with Proposition 4,
    supplies the required paving in the original representation using
  $ r = ⌈400000000 epsilon^(- 2)⌉ + ⌈4 \/ epsilon⌉ + 1 $
  projections. This number depends only on $epsilon$. The supporting corner and all partitions, diagonal elements,
    and compression projections may depend on $F$ and $delta$, as permitted in Definition 1.
    The construction has diagonal norm at most one, and
  $ r lt.eq 400000000 epsilon^(- 2) + 4 epsilon^(- 1) + 3 lt.eq 400000007 epsilon^(- 2) < 500000000 epsilon^(- 2) . $
  Multiplying the diagonal by the original $parallel x parallel$ restores scale and gives every assertion of
    Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Charles A. Akemann and David Sherman, #emph[Conditional expectations onto maximal abelian
  star-subalgebras], Journal of Operator Theory #strong[68] (2012), no.~2, 597--607.
  #link("https://jot.theta.ro/jot/archive/2012-068-002/2012-068-002-013.pdf")[Published article].]
#bibitem([2])[Huzihiro Araki, #emph[Some properties of modular conjugation operator of von Neumann algebras and a
  non-commutative Radon--Nikodym theorem with a chain rule], Pacific Journal of Mathematics #strong[50] (1974),
  no.~2, 309--354. #link("https://msp.org/pjm/1974/50-2/pjm-v50-n2-p02-p.pdf")[Published article].]
#bibitem([3])[Jacob Feldman and Calvin C. Moore, #emph[Ergodic equivalence relations, cohomology,
  and von Neumann algebras. II], Transactions of the American Mathematical Society #strong[234] (1977), 325--359.
  #link("https://doi.org/10.1090/S0002-9947-1977-0578730-2")[doi:10.1090/S0002-9947-1977-0578730-2].]
#bibitem([4])[Uffe Haagerup, #emph[The standard form of von Neumann algebras],
  Mathematica Scandinavica #strong[37] (1975), 271--283.
  #link("https://doi.org/10.7146/math.scand.a-11606")[doi:10.7146/math.scand.a-11606].]
#bibitem([5])[Uffe Haagerup, #emph[$L^p$-spaces associated with an arbitrary von Neumann algebra],
  in #emph[Algèbres d'opérateurs et leurs applications en physique mathématique] (Marseille, 1977),
  Colloques Internationaux du C.N.R.S. #strong[274], C.N.R.S., Paris, 1979, pp.~175--184.
  #link("https://math.berkeley.edu/~pavlov/scans/haagerup.pdf")[Original paper].]
#bibitem([6])[Richard V. Kadison and John R. Ringrose, #emph[Fundamentals of the Theory of Operator Algebras],
  Vol.~II: #emph[Advanced Theory], Pure and Applied Mathematics #strong[100], Academic Press, Orlando, FL, 1986.
  #link("https://shop.elsevier.com/books/fundamentals-of-the-theory-of-operator-algebras-v2/kadison/978-0-12-393302-7")[Publisher
  information].]
#bibitem([7])[Alexander S. Kechris, #emph[Classical Descriptive Set Theory],
  Graduate Texts in Mathematics #strong[156], Springer-Verlag, New York, 1995.
  #link("https://doi.org/10.1007/978-1-4612-4190-4")[doi:10.1007/978-1-4612-4190-4].]
#bibitem([8])[Dorothy Maharam, #emph[Incompressible transformations], Fundamenta Mathematicae #strong[56] (1964),
  no.~1, 35--50. #link("https://doi.org/10.4064/fm-56-1-35-50")[doi:10.4064/fm-56-1-35-50].]
#bibitem([9])[Adam W. Marcus, Daniel A. Spielman, and Nikhil Srivastava, #emph[Interlacing families II:
  Mixed characteristic polynomials and the Kadison--Singer problem],
  Annals of Mathematics (2) #strong[182] (2015), no.~1, 327--350.
  #link("https://doi.org/10.4007/annals.2015.182.1.8")[doi:10.4007/annals.2015.182.1.8].]
#bibitem([10])[OpenAI, #emph[Approximation Paving over Arbitrary Maximal Abelian Subalgebras],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Approximation-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026/Approximation-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026.pdf")[OAI:Approximation-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026],
  2026, Theorem~1.1.]
#bibitem([11])[Sorin Popa, #emph[A $upright(I I)_1$ factor approach to the Kadison--Singer problem],
  Communications in Mathematical Physics #strong[332] (2014), 379--414.
  #link("https://doi.org/10.1007/s00220-014-2055-4")[doi:10.1007/s00220-014-2055-4].]
#bibitem([12])[Sorin Popa and Stefaan Vaes, #emph[Paving over arbitrary MASAs in von Neumann algebras],
  Analysis & PDE #strong[8] (2015), no.~4, 1001--1023.
  #link("https://doi.org/10.2140/apde.2015.8.1001")[doi:10.2140/apde.2015.8.1001].]
#bibitem([13])[Sorin Popa and Stefaan Vaes, #emph[On the optimal paving over MASAs in von Neumann algebras],
  Contemporary Mathematics #strong[671] (2016), 199--208.
  #link("https://doi.org/10.1090/conm/671/13511")[doi:10.1090/conm/671/13511].]
#bibitem([14])[Robert T. Powers and Erling Størmer, #emph[Free states of the canonical anticommutation relations],
  Communications in Mathematical Physics #strong[16] (1970), 1--33.
  #link("https://doi.org/10.1007/BF01645492")[doi:10.1007/BF01645492].]
#bibitem([15])[Mohan Ravichandran and Nikhil Srivastava, #emph[Asymptotically optimal multi-paving],
  International Mathematics Research Notices #strong[2021] (2021), no.~14, 10908--10940.
  #link("https://doi.org/10.1093/imrn/rnz111")[doi:10.1093/imrn/rnz111]\;
  numbered theorem locators refer to #link("https://arxiv.org/abs/1706.03737v2")[arXiv:1706.03737v2].]
#bibitem([16])[Parthanil Roy and Gennady Samorodnitsky, #emph[Maharam extension for nonsingular group actions],
  2006, #link("https://arxiv.org/abs/math/0611891v1")[arXiv:math/0611891v1].]
#bibitem([17])[Masamichi Takesaki, #emph[Conditional expectations in von Neumann algebras],
  Journal of Functional Analysis #strong[9] (1972), no.~3, 306--321.
  #link("https://doi.org/10.1016/0022-1236(72)90004-3")[doi:10.1016/0022-1236(72)90004-3].]
#bibitem([18])[Yoshimichi Ueda, #emph[Amalgamated free product over Cartan subalgebra],
  Pacific Journal of Mathematics #strong[191] (1999), no.~2, 359--392.
  #link("https://doi.org/10.2140/pjm.1999.191.359")[doi:10.2140/pjm.1999.191.359].]
#bibitem([19])[Yoshimichi Ueda, #emph[Some analysis of amalgamated free products of von Neumann algebras in the
  non-tracial setting], Journal of the London Mathematical Society (2) #strong[88] (2013), no.~1, 25--48.
  #link("https://doi.org/10.1112/jlms/jds081")[doi:10.1112/jlms/jds081].]
