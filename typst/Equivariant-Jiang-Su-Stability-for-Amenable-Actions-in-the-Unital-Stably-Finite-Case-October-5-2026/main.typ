#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Equivariant Jiang--Su Stability \
for Amenable Actions \
in the Unital Stably Finite Case]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

Jiang–Su stability is a regularity property of a $upright(C)^(*)$-algebra that also has a dynamical counterpart:
  an action should absorb the trivial action on the Jiang–Su algebra up to cocycle conjugacy.
  The theorem below establishes this implication for all amenable actions in the simple, nuclear,
  finite unital setting. Throughout, tensor products are minimal, and $cal(Z)$ denotes the Jiang–Su algebra.

#thm([Theorem 1.1.])[
  #emph[Let $A$ be a simple, separable, unital, infinite-dimensional, nuclear,
    stably finite complex $upright(C)^(*)$-algebra satisfying $A tilde.equiv A ⊗ cal(Z)$.
    Let $G$ be a countable discrete amenable group and let $alpha : G arrow.r "Aut" \( A \)$ be any action. Put
$ B = A ⊗ cal(Z) \, wide beta_g = alpha_g ⊗ "id"_(cal(Z)) . $

 There are a unital $*$-isomorphism $Phi : A arrow.r B$ and unitaries $u_g in B$, $g in G$, such that
#[#set math.equation(numbering: n => "(1.1)")
 $ u_e & = 1 \, & u_(g h) & = u_g beta_g \( u_h \) \,\
Phi \( alpha_g \( a \) \) & = u_g beta_g \( Phi \( a \) \) u_g^(*) &  & \( g in G \, med a in A \) . $ <eq:cocycle>]

]
] <thm:main>

Here stable finiteness means that every isometry in every matrix algebra over $A$ is unitary.
  Amenability is used in its Følner form: for every finite $H subset G$ and $delta > 0$,
  some nonempty finite $F subset G$ satisfies $\| h F triangle.stroked.t F \| < delta \| F \|$ for $h in H$.
  Theorem 1 imposes no outerness, Rokhlin, or UCT assumption,
  and no condition on the extreme tracial boundary or on trace orbits.
  In particular, it includes finite groups and trivial actions.

=== 1.1 Context and scope <context-and-scope>

Szabó formulated automatic equivariant Jiang–Su stability for amenable actions on separable simple nuclear
  Jiang–Su-stable algebras as Conjecture A of [2]. Theorem 1 resolves its unital, stably finite case.
  The original formulation also includes nonunital algebras, which lie beyond the scope of the present theorem.
  Earlier affirmative cases include finite algebras with finitely many rays of extremal traces and very weak
  comparison [2] Theorem C.

Szabó and Wouters proved that equivariant uniform property Gamma characterizes equivariant Jiang–Su stability in
  the setting used here [3] Corollary C. Their theorem supplies the absorption step of the proof.
  Our task is to construct the required invariant central trace splittings for an arbitrary action.
  These splittings are uniform over the entire trace space, even when the action moves traces.

=== 1.2 Construction and proof structure <construction-and-proof-structure>

The technical argument has three parts. First, tensorial absorption supplies countably many commuting #emph[orbit
  algebras] inside the uniform tracial central sequence algebra.
  Under every extreme trace on the algebra they generate, distinct orbit algebras are independent.
  This intrinsic independence is useful because the traces under consideration need not extend to the ambient
  algebra. We then prove a joint central limit statement for normalized sums and their empirical covariances,
  allowing the extreme trace to vary with the number of rows.

Second, the covariance is incorporated into a quadratic Gaussian construction.
  For a Følner set $F$, its Gram vectors define a positive operator $P_F$ of trace one.
  Taking a polynomial approximation to $P_F^(1 \/ 2)$ gives a quadratic form whose variance stays bounded away
  from zero and whose change under translation is small. This square-root normalization handles covariance
  matrices of arbitrary rank, including highly correlated ones.
  Empirical covariances turn the same formula into exactly equivariant noncommutative polynomials.
  Compactness of the finite covariance space then promotes the scalar moment limits to estimates uniform over
  every tracial state.

Finally, weighting traces by elements of $A$ yields a central invariant unitary with Haar distribution relative to
  $A$. Two explicit diagonal selections give this unitary and then equal trace projections.
  The construction of the rows appears in Section 3, the uniform unitary estimates in Section 4,
  and the diagonal selections and absorption argument in Section 5.
  All parts of this construction are proved below; the final absorption theorem is stated separately in Theorem 3.

Several ingredients can be used separately under their stated hypotheses:
  intrinsic independence for commuting rows (Lemma 5), moment estimates under varying tracial states
  (Proposition 6), and convergence of scalar spectral laws against bounded continuous functions without uniform
  operator-norm bounds (Lemma 10).

== 2 Traces and the absorption criterion <sec:preliminaries>

For a unital $upright(C)^(*)$-algebra $D$, write $"T" \( D \)$ for its tracial-state space.
  For $tau in "T" \( D \)$, set

$ parallel x parallel_(2 \, tau) = tau \( x^(*) x \)^(1 \/ 2) . $

Under the assumptions of Theorem 1, $"T" \( A \)$ is a nonempty compact convex set.
  Indeed, nuclearity implies exactness, and a unital stably finite exact algebra has a tracial state;
  moreover its $2$-quasitraces are traces [1] Theorem 5.11 and Corollary 5.12.
  Every tracial state on the simple algebra $A$ is faithful:
  its null space ${ a : tau \( a^(*) a \) = 0 }$ is a closed two-sided ideal that does not contain $1$.

Fix a free ultrafilter $omega$ on $bb(N) = { 1 \, 2 \, dots.h }$. Define

#[#set math.equation(numbering: n => "(2.1)")
 $ parallel a parallel_(2 \, u) = sup_(tau in "T" \( A \)) parallel a parallel_(2 \, tau) \, wide A^omega =
   ell^oo \( bb(N) \, A \) \/ I_omega \, wide I_omega = { \( a_j \) :
   lim_(j arrow.r omega) parallel a_j parallel_(2 \, u) = 0 } . $ <eq:ultrapower>]

The inequalities $parallel a b parallel_(2 \, u) lt.eq parallel a parallel parallel b
  parallel_(2 \, u)$ and $parallel b a parallel_(2 \, u) lt.eq
  parallel a parallel parallel b parallel_(2 \, u)$ show that $I_omega$ is a closed two-sided ideal.
  Faithfulness of traces embeds $A$ as the constant sequences in $A^omega$.
  For any sequence $\( tau_j \)$ in $"T" \( A \)$, the formula

$ tau \( \[ \( a_j \) \] \) = lim_(j arrow.r omega) tau_j \( a_j \) $

defines a tracial state on $A^omega$, since $\| tau_j \( a_j \) \| lt.eq parallel a_j parallel_(2 \, tau_j)$.
  These are the #emph[limit traces], denoted $"T"_omega \( A \)$.
  We do not identify them with all tracial states on $A^omega$.

Automorphisms permute $"T" \( A \)$ and therefore preserve $parallel dot.op parallel_(2 \, u)$.
  Applying $alpha_g$ to representative sequences defines an action $macron(alpha) : G arrow.cw.half A^omega$.
  It preserves $A^omega ∩ A'$. The quotient in Equation (2.1) is also the quotient of the norm ultrapower by its
  uniform trace-kernel ideal, since norm-null sequences belong to $I_omega$.

#prodef([Definition 2.1.])[
  The action $alpha$ has #emph[equivariant uniform property Gamma] if, for every integer $k gt.eq 2$,
    there are pairwise orthogonal projections $p_1 \, dots.h \, p_k in \( A^omega ∩ A' \)^(macron(alpha))$ with
  #[#set math.equation(numbering: n => "(2.2)")
   $ tau \( a p_i \) =
     frac(tau \( a \), k) wide \( a in A \, med tau in "T"_omega \( A \) \, med 1 lt.eq i lt.eq k \) . $ <eq:gamma>]
] <def:gamma>

This is the unital simple formulation in [3] Definition A. Our construction also gives $sum_i p_i = 1$.
  We use the following established theorem.

#thm([Theorem 2.2.])[
  (Szabó–Wouters).  #emph[Let a countable discrete amenable group act on a separable, unital, simple, nuclear,
    $cal(Z)$-stable $upright(C)^(*)$-algebra with nonempty tracial-state space.
    If the action has equivariant uniform property Gamma, it is cocycle conjugate to its tensor product with the
    trivial action on $cal(Z)$.]
] <thm:absorption>

Theorem 3 is the implication of [3] Corollary C needed here.
  Thus it remains to construct the projections required by Definition 2.
  The next two sections work inside a separable subalgebra $C$ of $A^omega ∩ A'$.
  There we use #emph[all] traces in $"T" \( C \)$; this will allow weighted restrictions of limit traces in Section 5.

== 3 Commuting orbit rows and joint moments <sec:rows>

Throughout this section, $A$, $G$, and $alpha$ satisfy the hypotheses of Theorem 1.
  Only countability of $G$ is needed for the constructions in this section.

#thm([Proposition 3.1.])[
  (Commuting orbit rows).  #emph[There are unital embeddings $iota_i : cal(Z) arrow.r A^omega$, $i gt.eq 1$,
    for which the unital orbit algebras
$ C_i = C^(*) #scale(x: 120%, y: 120%)[\(] macron(alpha)_g \( iota_i \( cal(Z) \) \) :
  g in G #scale(x: 120%, y: 120%)[\)] $

 commute with $A$ and commute pairwise. In particular,
$ C = C^(*) #scale(x: 180%, y: 180%)[\(] union.big_(i gt.eq 1) C_i #scale(x: 180%, y: 180%)[\)] subset.eq A^omega ∩ A' $

 is unital, separable, and $macron(alpha)$-invariant, and $"T" \( C \) eq.not diameter$.]
  #emph[Moreover, there are self-adjoint elements $x_(i \, g) in C_i$, $i gt.eq 1$, $g in G$,
    and a constant $M < oo$, such that
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel x_(i \, g) parallel lt.eq M \, wide phi \( x_(i \, g) \) = 0 \, wide phi \( x_(i \, g)^2 \) = 1 quad
   #scale(x: 120%, y: 120%)[\(] phi in "T" \( C \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:row-normalization>]

 and
#[#set math.equation(numbering: n => "(3.2)")
 $ macron(alpha)_h \( x_(i \, g) \) = x_(i \, h g) wide \( i gt.eq 1 \, med g \, h in G \) . $ <eq:row-equivariance>]

]
] <prop:rows>

#proof[
  The Jiang–Su algebra is simple, unital, uniquely tracial, and isomorphic to its infinite tensor power;
    see [4] Example 1.14(iv) and Corollary 1.11. Write $rho$ for its unique tracial state.
    Since $A$ is $cal(Z)$-stable, fix an identification
  $ A tilde.equiv A ⊗ ⨂_(l = 1)^oo cal(Z) . $
  We use the increasing finite tensor stages in this identification.
  We first show that every norm-separable $C^(*)$-subalgebra $D subset.eq A^omega$ admits a unital embedding
  #[#set math.equation(numbering: n => "(3.3)")
   $ cal(Z) arrow.r A^omega ∩ D' . $ <eq:relative-tail-embedding>]
  Choose a norm-dense sequence $\( d_s \)_(s gt.eq 1)$ in $D$,
    and choose bounded representative sequences $d_s = \[ \( d_(s \, j) \)_(j gt.eq 1) \]$.
    For each $j$, choose a finite tensor stage containing elements within $1 \/ j$ in norm of $d_(1 \, j) \,
    dots.h \, d_(j \, j)$. Let $theta_j : cal(Z) arrow.r A$ be the embedding into a tensor factor strictly after
    this stage. For $j gt.eq s$ and $z in cal(Z)$,
  $ parallel \[ theta_j \( z \) \, d_(s \, j) \] parallel lt.eq frac(2 parallel z parallel, j) . $
  The coordinatewise homomorphisms therefore induce a unital $*$-homomorphism $z
    mapsto \[ \( theta_j \( z \) \)_j \]$ into $A^omega ∩ D'$.
    It is injective because $cal(Z)$ is simple and the unit of $A^omega$ is nonzero. This proves Equation (3.3).
  Set $D_0 = A$. Inductively, suppose that $D_(i - 1)$ is a separable, unital,
    $macron(alpha)$-invariant subalgebra of $A^omega$ containing $A$ and the preceding orbit algebras.
    Apply Equation (3.3) to obtain $iota_i \( cal(Z) \) subset.eq D'_(i - 1)$, define $C_i$ as in the statement, and put
  $ D_i = C^(*) \( D_(i - 1) \, C_i \) . $
  For $b in iota_i \( cal(Z) \)$, $d in D_(i - 1)$, and $g in G$,
  $ \[ macron(alpha)_g \( b \) \, d \] =
    macron(alpha)_g #scale(x: 120%, y: 120%)[\(] \[ b \, macron(alpha)_(g^(- 1)) \( d \) \]
    #scale(x: 120%, y: 120%)[\)] = 0 \, $
  since $D_(i - 1)$ is invariant. Thus $C_i$ commutes with $D_(i - 1)$.
    Countability of $G$ preserves separability at each stage.
    This gives the required algebras and their commutation properties.
    A limit trace on $A^omega$ restricts to a tracial state on $C$, so $"T" \( C \)$ is nonempty.
  The trace $rho$ is faithful by simplicity of $cal(Z)$. Choose a non-scalar self-adjoint element $c in cal(Z)$.
    Then $rho \( \( c - rho \( c \) 1 \)^2 \) > 0$, so rescaling $c -
    rho \( c \) 1$ gives a self-adjoint $b in cal(Z)$ with $rho \( b \) = 0$ and $rho \( b^2 \) = 1$. Set
  $ x_(i \, g) = macron(alpha)_g \( iota_i \( b \) \) \, wide M = parallel b parallel . $
  Every $phi in "T" \( C \)$ restricts along each translated unital embedding of $cal(Z)$ to $rho$.
    This proves Equation (3.1), and Equation (3.2) follows from the action law. ◻
]

The following independence statement is intrinsic to the algebra generated by the rows.
  In particular, it applies to traces of $C$ that do not extend to the ambient ultrapower.

#thm([Lemma 3.2.])[
  (Independence at extreme traces).  #emph[Let $B$ be a unital $C^(*)$-algebra generated by pairwise commuting
    unital $C^(*)$-subalgebras $B_i$, $i gt.eq 1$. If $phi in partial_(upright(e)) "T" \( B \)$, then
$ phi \( b_1 dots.h.c b_s \) = product_(j = 1)^s phi \( b_j \) $

 whenever $b_j in B_(i_j)$ and the indices $i_1 \, dots.h \, i_s$ are distinct.]
] <lem:factor-independence>

#proof[
  Let $\( H_phi \, pi \, Omega \)$ be the tracial GNS representation of $phi$, and put
  $ cal(M) = pi \( B \)'' \, wide cal(M)_i = pi \( B_i \)'' . $
  We first record the relevant properties of this representation, allowing $phi$ to have a nonzero kernel on $B$.
    On the dense subspace of vectors $\[ a \]$, $a in B$, right multiplication $R_b \[ a \] = \[ a b \]$ is
    bounded with norm at most $parallel b parallel$, by traciality.
    It commutes with $pi \( B \)$, while the vectors $R_b Omega = \[ b \]$ are dense.
    If $T in cal(M)$ satisfies $T Omega = 0$, then
  $ T R_b Omega = R_b T Omega = 0 wide \( b in B \) \, $
  so $T = 0$. Thus $Omega$ is separating for $cal(M)$. The normal vector state $tau \( T \) = chevron.l T Omega \,
    Omega chevron.r$ is consequently faithful: for $T gt.eq 0$, $tau \( T \) = 0$ implies $T^(1 \/ 2) Omega = 0$.
    Its traciality extends from $pi \( B \)$ to $cal(M)$ by separate ultraweak continuity.
    Hence $cal(M)$ is a finite von Neumann algebra with faithful normal tracial state $tau$.
  Extremality of $phi$ implies that $cal(M)$ is a factor. Indeed,
    a nontrivial central projection $p in cal(M)$ would give the convex decomposition
  $ phi \( a \) = tau \( p \) frac(tau \( p pi \( a \) \), tau \( p \)) +
    tau \( 1 - p \) frac(tau \( \( 1 - p \) pi \( a \) \), tau \( 1 - p \)) . $
  The two normalized functionals are tracial states on $B$. They are distinct:
    if, for instance, the first equalled $phi$, equality of the corresponding normal functionals would extend from
    $pi \( B \)$ to $cal(M)$, and evaluation at $p$ would give $1 = tau \( p \)$.
    This contradicts $0 < tau \( p \) < 1$.
  The algebras $cal(M)_i$ commute and generate $cal(M)$. Every element of the center of $cal(M)_i$ therefore
    commutes with all of $cal(M)$, so
  $ Z \( cal(M)_i \) subset.eq Z \( cal(M) \) = bb(C) 1 . $
  The restriction of $tau$ makes each $cal(M)_i$ a finite factor with a faithful normal tracial state.
  Fix $i$, and let $y gt.eq 0$ belong to the von Neumann algebra generated by the other $cal(M)_j$’s.
    It commutes with $cal(M)_i$. The functional
  $ psi_y \( x \) = tau \( y^(1 \/ 2) x y^(1 \/ 2) \) = tau \( x y \) \, wide x in cal(M)_i \, $
  is normal and positive: sandwiching by $y^(1 \/ 2)$ preserves suprema of bounded increasing nets of positive
    operators. Commutation of $y$ with $cal(M)_i$ makes it tracial, and $0 lt.eq psi_y lt.eq
    parallel y parallel tau$. The Radon–Nikodym Theorem for normal functionals on a finite von Neumann algebra
    therefore gives a density $h in cal(M)_i$, $0 lt.eq h lt.eq parallel y parallel 1$, with $psi_y \( x \) =
    tau \( h x \)$. Invariance of $psi_y$ under unitary conjugation forces $h$ to commute with every unitary in
    $cal(M)_i$. Hence $h$ is central and thus scalar. Evaluating at the unit identifies that scalar as
    $tau \( y \)$. It follows that
  $ tau \( x y \) = tau \( x \) tau \( y \) . $
  Linearity extends this identity to arbitrary $y$ in the algebra generated by the other rows.
    Applying it successively proves the required product formula. ◻
]

We now fix the algebras and elements from Proposition 4. For $N gt.eq 1$ and $g \, h in G$, set

#[#set math.equation(numbering: n => "(3.4)")
 $ z_(N \, g) = 1 / sqrt(N) sum_(i = 1)^N x_(i \, g) \, wide k_(N \; g \, h) = 1 /
   N sum_(i = 1)^N frac(x_(i \, g) x_(i \, h) + x_(i \, h) x_(i \, g), 2) . $ <eq:empirical-variables>]

The last two subscripts of $k_(N \; g \, h)$ are covariance indices.
  These elements are self-adjoint, $k_(N \; g \, h) = k_(N \; h \, g)$, and

#[#set math.equation(numbering: n => "(3.5)")
 $ macron(alpha)_l \( z_(N \, g) \) = z_(N \, l g) \, wide macron(alpha)_l \( k_(N \; g \, h) \) =
   k_(N \; l g \, l h) quad \( l \, g \, h in G \) . $ <eq:empirical-equivariance>]

#thm([Proposition 3.3.])[
  (Joint ordered moment limit).  #emph[Let $J subset.eq G$ be nonempty and finite.
    Let $N_j arrow.r oo$ be a sequence of positive integers, and let $phi_j in partial_(upright(e)) "T" \( C \)$.
    Suppose that
#[#set math.equation(numbering: n => "(3.6)")
 $ phi_j \( k_(N_j \; g \, h) \) arrow.r R_(g \, h) wide \( g \, h in J \) . $ <eq:covariance-convergence>]

 Then $R = \( R_(g \, h) \)_(g \, h in J)$ is a real positive semidefinite matrix with diagonal entries one.
   Choose unit vectors $v_g$, $g in J$, spanning a finite-dimensional real Euclidean space $L$,
   with $chevron.l v_g \, v_h chevron.r = R_(g \, h)$. If $W$ is a standard Gaussian vector in $L$ and $xi_g =
   chevron.l v_g \, W chevron.r$, then
$ #scale(x: 120%, y: 120%)[\(] \( z_(N_j \, g) \)_(g in J) \, \( k_(N_j \; g \, h) \)_(g \, h in J)
  #scale(x: 120%, y: 120%)[\)] arrow.r
  #scale(x: 120%, y: 120%)[\(] \( xi_g \)_(g in J) \, \( R_(g \, h) \)_(g \, h in J) #scale(x: 120%, y: 120%)[\)] $

 in all ordered joint moments under $phi_j$. Equivalently,
   for every noncommutative $*$-polynomial $P$ in these self-adjoint variables,
#[#set math.equation(numbering: n => "(3.7)")
 $ phi_j #h(-0.16667em)
   (P #scale(x: 120%, y: 120%)[\(] \( z_(N_j \, g) \)_g \, \( k_(N_j \; g \, h) \)_(g \, h)
   #scale(x: 120%, y: 120%)[\)]) arrow.r bb(E) thin P #scale(x: 120%, y: 120%)[\(] \( xi_g \)_g \, \( R_(g \,
   h) \)_(g \, h) #scale(x: 120%, y: 120%)[\)] . $ <eq:joint-polynomial-limit>]

 For every sequence $\( N_j \, phi_j \)$ as above, a subsequence satisfying Equation (3.6) exists.]
] <prop:joint-clt>

#proof[
  For a tracial state $phi$ and self-adjoint $x \, y$,
  $ phi \( x y \) = phi \( y x \) = overline(phi \( x y \)) . $
  Thus all the second moments under consideration are real and symmetric. For real scalars $a_g$,
  $ sum_(g \, h in J) a_g a_h phi_j \( k_(N_j \; g \, h) \) = 1 /
    N_j sum_(i = 1)^(N_j) phi_j #h(-0.16667em) ((sum_(g in J) a_g x_(i \, g))^2) gt.eq 0 . $
  The diagonal entries are one by Equation (3.1). Cauchy–Schwarz bounds every entry in absolute value by one.
    Consequently these covariance matrices lie in a compact set of real symmetric matrices;
    their limits have the asserted properties, and the final subsequence assertion follows.
    A Gram representation of the positive semidefinite matrix $R$ supplies $L$ and the vectors $v_g$.
  The empty word is immediate. We first consider a word of length $d gt.eq 1$ in the fluctuation variables.
    At one term of the given sequence write $N = N_j$ and $phi = phi_j$. Expanding the sums gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ phi \( z_(N \, g_1) dots.h.c z_(N \, g_d) \) = N^(- d \/ 2) sum_(i_1 \, dots.h \, i_d = 1)^N
     phi \( x_(i_1 \, g_1) dots.h.c x_(i_d \, g_d) \) . $ <eq:fluctuation-expansion>]
  Partition the positions $1 \, dots.h \, d$ according to equality of their row labels $i_a$.
    Since distinct rows commute, we may group the factors belonging to each row,
    preserving their order within that row. Lemma 5 then factors the expectation over the distinct rows.
    A singleton block gives zero by Equation (3.1). Each remaining summand has absolute value at most $M^d$.
  A partition with $b$ blocks has at most $N^b$ choices of distinct row labels.
    Its contribution to Equation (3.8) is therefore bounded by $M^d N^(b - d \/ 2)$.
    Among partitions without singleton blocks, $b lt.eq floor.l d \/ 2 floor.r$.
    It follows that odd moments tend to zero, and, when $d = 2 q$,
    only partitions into $q$ pairs can have a nonzero limit.
  Fix such a pairing, writing its pairs as $\( a_l \, b_l \)$, $1 lt.eq l lt.eq q$, with $a_l < b_l$.
    Its contribution is
  $ N^(- q) sum_(1 lt.eq i_1 \, dots.h \, i_q lt.eq N\
i_1 \, dots.h \, i_q med upright("distinct")) product_(l = 1)^q phi \( x_(i_l \, g_(a_l)) x_(i_l \, g_(b_l)) \) . $
  Dropping the distinctness condition changes this by $O_(d \, M) \( N^(- 1) \)$:
    there are at most $binom(q, 2) N^(q - 1)$ tuples with a collision, and each product is bounded by $M^(2 q)$.
    The unrestricted sum factors, and traciality identifies its factors with the empirical covariances:
  $ product_(l = 1)^q (1 / N sum_(i = 1)^N phi \( x_(i \, g_(a_l)) x_(i \, g_(b_l)) \)) =
    product_(l = 1)^q phi \( k_(N \; g_(a_l) \, g_(b_l)) \) . $
  All error estimates depend only on $d$ and $M$, so they hold uniformly for the moving traces $phi_j$.
    By Equation (3.6), the limiting even moment is the sum over pairings of the corresponding products of entries
    of $R$. This is the Gaussian moment: the moment-generating function of $\( xi_g \)_(g in J)$ is
  $ bb(E) exp #h(-0.16667em) (sum_(g in J) t_g xi_g) = exp #h(-0.16667em)
    (1 / 2 sum_(g \, h in J) t_g t_h R_(g \, h)) \, $
  whose Taylor expansion gives precisely this pairing formula.
  It remains to include the covariance variables in arbitrary positions of a word. For $g \, h in J$, define
  $ s_(i \; g \, h) = frac(x_(i \, g) x_(i \, h) + x_(i \, h) x_(i \, g), 2) \, wide y_(j \, i \; g \, h) =
    s_(i \; g \, h) - phi_j \( s_(i \; g \, h) \) 1 . $
  This is centering separately in each row, at the current trace. In particular,
  $ phi_j \( y_(j \, i \; g \, h) \) = 0 \, wide parallel y_(j \, i \; g \, h) parallel lt.eq 2 M^2 \, $
  and there is the exact identity
  #[#set math.equation(numbering: n => "(3.9)")
   $ k_(N_j \; g \, h) - phi_j \( k_(N_j \; g \, h) \) 1 = 1 /
     N_j sum_(i = 1)^(N_j) y_(j \, i \; g \, h) . $ <eq:rowwise-covariance-centering>]
  Let $U_j$ be an ordered word having $d$ fluctuation factors and $r gt.eq
    1$ factors of the form on the left of Equation (3.9). Expand all its sums.
    Each of its $d + r$ row factors is centered under $phi_j$, and a singleton row again gives zero by Lemma 5.
    A surviving term therefore uses at most $floor.l \( d + r \) \/ 2 floor.r$ distinct row labels.
    The products within any one row have absolute expectation bounded by the product of the operator norms of
    their factors. There are only finitely many partitions of the $d + r$ positions.
    Together with the normalization $N_j^(- d \/ 2 - r)$, these observations give
  #[#set math.equation(numbering: n => "(3.10)")
   $ lr(|phi_j \( U_j \)|) lt.eq C_(d \, r \, M) thin N_j^(floor.l \( d + r \) \/ 2 floor.r - d \/ 2 - r) lt.eq
     C_(d \, r \, M) thin N_j^(- r \/ 2) arrow.r 0 \, $ <eq:centered-mixed-word-bound>]
  where the constant is independent of $j$ and $phi_j$.
  Finally, replace each covariance factor in a general word by its scalar $phi_j$-mean plus the centered factor in
    Equation (3.9). Every term containing a centered covariance factor tends to zero by Equation (3.10).
    The remaining terms converge by the fluctuation calculation and Equation (3.6).
    This proves convergence of every ordered word. Since all generators are self-adjoint,
    linearity also gives the $*$-polynomial formulation in Equation (3.7). ◻
]

== 4 Gaussian quadratics over Følner sets <sec:gaussian>

We retain the algebra $C$, its invariant commuting orbit algebras $C_i$, and the variables $x_(i \, g)$,
  $z_(N \, g)$, and $k_(N \; g \, h)$ from Section 3. In particular, $"T" \( C \)$ is nonempty,
  the $x_(i \, g)$ are uniformly bounded by $M$, and Proposition 6 applies to arbitrary sequences of extreme
  traces. All traces of finite-dimensional matrices in this section are unnormalized.
  For a matrix $B$, we write $parallel B parallel_(upright("HS")) = \( "Tr" \( B^(*) B \) \)^(1 \/ 2)$ and
  $parallel B parallel_1 = "Tr" \| B \|$.

#thm([Proposition 4.1.])[
  (Uniform approximately invariant unitaries).  #emph[For every finite set $H subset G$, every $epsilon > 0$,
    and every integer $m gt.eq 1$, there are $t > 0$ and a self-adjoint element $Q in C$ such that $V =
    exp \( upright(i) t Q \)$ satisfies
#[#set math.equation(numbering: n => "(4.1)")
 $ sup_(phi in "T" \( C \)) parallel macron(alpha)_h \( V \) - V parallel_(2 \, phi) & < epsilon &  & \( h in H \) \,\
sup_(phi in "T" \( C \)) \| phi \( V^ell \) \| & < epsilon &  & \( 1 lt.eq ell lt.eq m \) .
  $ <eq:uniform-unitary-invariance>]

]
] <prop:uniform-unitaries>

We first record the matrix and probability estimates used in the proof.

#thm([Lemma 4.2.])[
  (Square-root perturbation bound).  #emph[If $S \, T$ are positive matrices of the same size, then
$ parallel S^(1 \/ 2) - T^(1 \/ 2) parallel_(upright("HS"))^(thin 2) lt.eq parallel S - T parallel_1 . $

]
] <lem:square-root-trace>

#proof[
  Set $a = S^(1 \/ 2)$, $b = T^(1 \/ 2)$, $d = a - b$, and $u = "sign" \( d \)$, with $"sign" \( 0 \) = 0$.
    Since $a^2 - b^2 = a d + d b$, cyclicity of the trace gives
  $ "Tr" #scale(x: 120%, y: 120%)[\(] u \( a^2 - b^2 \) #scale(x: 120%, y: 120%)[\)] =
    "Tr" #scale(x: 120%, y: 120%)[\(] \| d \| \( a + b \) #scale(x: 120%, y: 120%)[\)] . $
  In a basis diagonalizing $d$, positivity gives $a_(j j) + b_(j j) gt.eq \| a_(j j) - b_(j j) \| = \| d_j \|$. Thus
  $ "Tr" #scale(x: 120%, y: 120%)[\(] \| d \| \( a + b \) #scale(x: 120%, y: 120%)[\)] =
    sum_j \| d_j \| \( a_(j j) + b_(j j) \) gt.eq sum_j d_j^2 = "Tr" \( d^2 \) . $
  On the other hand, $u$ is a contraction, so trace-norm duality gives
  $ "Tr" #scale(x: 120%, y: 120%)[\(] u \( a^2 - b^2 \) #scale(x: 120%, y: 120%)[\)] lt.eq "Tr" \| a^2 - b^2 \| . $
  These two inequalities prove the assertion. ◻
]

#thm([Lemma 4.3.])[
  (Gaussian quadratic estimates).  #emph[Let $W$ be a standard Gaussian vector in a finite-dimensional real
    Euclidean space, and let $B$ be a real symmetric operator on that space. Put
$ q_B = chevron.l W \, B W chevron.r - "Tr" \( B \) . $

 Then
#[#set math.equation(numbering: n => "(4.2)")
 $ parallel q_B parallel_(L^2) = sqrt(2) thin parallel B parallel_(upright("HS")) \,
   wide \| bb(E) exp \( upright(i) s q_B \) #scale(x: 120%, y: 120%)[\|] lt.eq #scale(x: 120%, y: 120%)[\(] 1 +
   4 s^2 parallel B parallel_(upright("HS"))^2 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 4) quad \( s in bb(R) \) .
   $ <eq:quadratic-variance-characteristic>]

 Its law has an exponential moment of its absolute value and is determined by its moments.]
] <lem:gaussian-quadratic>

#proof[
  Orthogonal diagonalization of $B$ gives
  $ q_B med =^(upright("law")) sum_(j = 1)^d lambda_j \( U_j^2 - 1 \) \, $
  where $lambda_j$ are its eigenvalues and $U_j$ are independent standard real normal variables.
    The summands are centered and have variances $2 lambda_j^2$, proving the first formula.
    The one-dimensional Gaussian integral gives
  $ \| bb(E) exp \( upright(i) s q_B \) #scale(x: 120%, y: 120%)[\|] =
    product_(j = 1)^d \( 1 + 4 s^2 lambda_j^2 \)^(- 1 \/ 4) . $
  For nonnegative numbers $a_j$, one has $product_j \( 1 + a_j \) gt.eq 1 + sum_j a_j$.
    Applying this inequality with $a_j = 4 s^2 lambda_j^2$ proves the second formula in Equation (4.2).
  Choose $c > 0$ so that $2 c max_j \| lambda_j \| < 1$; if $B = 0$, any $c > 0$ will do. The pointwise estimate
  $ exp #h(-0.16667em) (c lr(|sum_j lambda_j \( U_j^2 - 1 \)|)) lt.eq
    exp #h(-0.16667em) (c sum_j \| lambda_j \|) product_j exp \( c \| lambda_j \| U_j^2 \) $
  and the Gaussian integral show that $bb(E) exp \( c \| q_B \| \) < oo$.
  For completeness, let $nu$ be another probability measure with the same moments as $q_B$.
    By the nonnegative power series for $cosh$ and monotone convergence,
  $ integral_(bb(R)) cosh \( c x \) thin d nu \( x \) = sum_(r = 0)^oo frac(c^(2 r), \( 2 r \) !)
    bb(E) \( q_B^(2 r) \) = bb(E) cosh \( c q_B \) < oo . $
  Since $e^(c \| x \|) lt.eq 2 cosh \( c x \)$, the measure $nu$ also has an exponential moment.
    The characteristic functions of $nu$ and of $q_B$ extend analytically to the strip ${ z in bb(C) : \| "Im"
    z \| < c }$. Their Taylor coefficients at zero agree, so the Identity Theorem makes these analytic functions
    equal. Uniqueness of characteristic functions proves that $nu$ is the law of $q_B$. ◻
]

The purpose of square-root normalization is already visible for a positive real symmetric matrix $P$ with
  $"Tr" \( P \) = 1$. Equation (4.2) gives

$ "Var" \( q_(P^(1 \/ 2)) \) = 2 \, wide "Var" \( q_P \) = 2 "Tr" \( P^2 \) . $

The latter variance is $2$ when $P$ is a rank-one projection, but $2 \/ n$ when $P = n^(- 1) I_n$.
  The exact square root therefore prevents the variance from vanishing as the rank grows.
  Lemma 8 simultaneously controls its change under perturbation.
  The proof below replaces this exact square root by a polynomial with an explicitly controlled error.

#thm([Lemma 4.4.])[
  (From moments to bounded continuous functions).  #emph[Let $X_j =
    X_j^(*)$ belong to unital $upright(C)^(*)$-algebras equipped with states $phi_j$.
    Let $q_B$ be a centered Gaussian quadratic as in Lemma 9. Suppose that
$ phi_j \( X_j^d \) arrow.r bb(E) \( q_B^d \) wide \( d = 0 \, 1 \, 2 \, dots.h \) . $

 Then, for every bounded continuous function $f : bb(R) arrow.r bb(C)$,
$ phi_j \( f \( X_j \) \) arrow.r bb(E) f \( q_B \) . $

 No uniform bound on $parallel X_j parallel$ is needed.]
] <lem:quadratic-moment-transfer>

#proof[
  Let $mu_j$ be the spectral probability law of $X_j$ under $phi_j$.
    The second moments of $mu_j$ are bounded, so the sequence is tight.
    Fix an integer $d gt.eq 0$, and choose an even integer $2 r > d$.
    Moment convergence supplies a constant $C_r < oo$ such that $integral \| x \|^(2 r) thin d mu_j \( x \) lt.eq
    C_r$ for all $j$. Consequently
  #[#set math.equation(numbering: n => "(4.3)")
   $ integral_(\| x \| > K) \| x \|^d thin d mu_j \( x \) lt.eq
     C_r K^(d - 2 r) wide \( K > 0 \) . $ <eq:spectral-moment-tail>]
  Consider any weakly convergent subsequence, with limit $mu$.
    Lower semicontinuity gives $integral \| x \|^(2 r) thin d mu \( x \) lt.eq C_r$,
    so the same tail bound holds for $mu$. Multiply $x^d$ by a continuous cutoff which equals one on
    $\[ - K \, K \]$ and zero outside $\[ - 2 K \, 2 K \]$. Weak convergence applies to this bounded continuous
    function. Letting $K$ tend to infinity and using Equation (4.3) shows that
  $ integral x^d thin d mu \( x \) = bb(E) \( q_B^d \) . $
  This holds for every $d$. Lemma 9 therefore identifies $mu$ with the law of $q_B$.
    Tightness now shows that the whole sequence $mu_j$ converges weakly to that law:
    every subsequence has a weakly convergent further subsequence, and all such limits have just been identified.
    This is precisely the claimed convergence for $f$. ◻
]

#proof[
  #strong[Step 1. Choice of parameters.] Fix $H \, epsilon \, m$ as in the statement. Choose $t > 0$ so that
  #[#set math.equation(numbering: n => "(4.4)")
   $ \( 1 + t^2 \)^(- 1 \/ 4) < epsilon \/ 4 . $ <eq:gaussian-t-choice>]
  Next choose $delta > 0$ and $0 < eta < 1 \/ 2$ so that
  #[#set math.equation(numbering: n => "(4.5)")
   $ t sqrt(2) thin \( sqrt(delta) + 2 eta \) < epsilon \/ 4 . $ <eq:gaussian-error-choice>]
  Amenability gives a nonempty finite $F subset G$ satisfying
  $ \| h F triangle.stroked.t F \| < delta \| F \| wide \( h in H \) . $
  Set
  $ n = \| F \| \, wide J = F union union.big_(h in H) h F . $
  Finally, choose a real polynomial
  #[#set math.equation(numbering: n => "(4.6)")
   $ p \( s \) = sum_(r = 1)^D c_r s^r \, wide sup_(0 lt.eq s lt.eq 1) \| p \( s \) -
     sqrt(s) \| < eta \/ sqrt(n) . $ <eq:square-root-polynomial>]
  Such a polynomial exists: first approximate $sqrt(s)$ on $\[ 0 \, 1 \]$ by a real polynomial to within
    $eta \/ \( 2 sqrt(n) \)$, then subtract its value at zero.
    Thus $t \, delta \, eta \, F \, n \, J$, and $p$, including its degree and coefficients,
    are all fixed before $N$ tends to infinity. None is chosen using a trace or a limiting covariance.
  #strong[Step 2. Uniform Gaussian comparison.] Let $R = \( R_(g \, g') \)_(g \, g' in J)$ be any real positive
    semidefinite matrix with diagonal one. Choose unit vectors $v_g$ with Gram matrix $R$,
    spanning a finite-dimensional real Euclidean space $L$, and let $W$ be standard Gaussian in $L$.
    Write $xi_g = chevron.l v_g \, W chevron.r$. For $E = F$ or $E = h F$, define
  $ P_E = 1 / n sum_(g in E) v_g v_g^(sans(T)) \, wide B_E = p \( P_E \) \, wide q_E = chevron.l W \,
    B_E W chevron.r - "Tr" \( B_E \) . $
  The operator $P_E$ is positive with trace one, so its spectrum lies in $\[ 0 \, 1 \]$; its rank is at most $n$.
    Because $p \( 0 \) = 0$, the operator $p \( P_E \) - P_E^(1 \/ 2)$ vanishes on the kernel of $P_E$.
    The scalar approximation in Equation (4.6) therefore gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel B_E - P_E^(1 \/ 2) parallel_(upright("HS"))^2 lt.eq "rank" \( P_E \) thin eta^2 \/ n lt.eq eta^2 \,
     wide parallel P_E^(1 \/ 2) parallel_(upright("HS"))^2 = "Tr" \( P_E \) = 1 . $ <eq:gaussian-rank-control>]
  In particular,
  #[#set math.equation(numbering: n => "(4.8)")
   $ 1 - eta lt.eq parallel B_E parallel_(upright("HS")) lt.eq 1 + eta . $ <eq:gaussian-nondegeneracy>]
  The summands indexed by $F ∩ h F$ cancel when subtracting $P_F$ and $P_(h F)$.
    Each remaining $v_g v_g^(sans(T))$ has trace norm one. Hence Lemma 8 implies
  $ parallel P_F^(1 \/ 2) - P_(h F)^(1 \/ 2) parallel_(upright("HS"))^2 lt.eq parallel P_F -
    P_(h F) parallel_1 lt.eq frac(\| F triangle.stroked.t h F \|, n) < delta . $
  Combining this with Equation (4.7) yields
  $ parallel B_F - B_(h F) parallel_(upright("HS")) lt.eq sqrt(delta) + 2 eta . $
  Both forms $q_F \, q_(h F)$ are evaluated on the same $W$,
    so their difference is the centered quadratic associated with $B_(h F) - B_F$. Lemma 9 gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ parallel q_(h F) - q_F parallel_(L^2) lt.eq sqrt(2) thin \( sqrt(delta) + 2 eta \) .
     $ <eq:gaussian-translation-bound>]
  Also, Equation (4.8) and $eta < 1 \/ 2$ give, for every integer $ell gt.eq 1$,
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| bb(E) exp \( upright(i) ell t q_F \) #scale(x: 120%, y: 120%)[\|] lt.eq #scale(x: 120%, y: 120%)[\(] 1 +
     4 ell^2 t^2 parallel B_F parallel_(upright("HS"))^2 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 4)
     lt.eq \( 1 + t^2 \)^(- 1 \/ 4) . $ <eq:gaussian-fourier-bound>]
  All these bounds hold for every such $R$, including singular matrices.
    No invariance of $R$ under translation of its indices has been used.
  #strong[Step 3. Equivariant polynomial prescription.] For $r gt.eq 1$,
    direct multiplication of the rank-one summands gives
  $ P_E^r = 1 / n^r sum_(g_1 \, dots.h \, g_r in E) R_(g_1 \, g_2) dots.h.c R_(g_(r - 1) \, g_r) v_(g_1)
    v_(g_r)^(sans(T)) . $
  Taking its quadratic form and its trace, respectively, shows that
  #[#set math.equation(numbering: n => "(4.11)")
   $ q_E = sum_(r = 1)^D c_r / n^r sum_(g_1 \, dots.h \, g_r in E) R_(g_1 \, g_2) dots.h.c R_(g_(r - 1) \, g_r)
     #scale(x: 120%, y: 120%)[\(] xi_(g_1) xi_(g_r) - R_(g_r \, g_1) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:gaussian-covariance-polynomial>]
  The product of covariance entries is interpreted as $1$ when $r = 1$.
  Use the same prescription in $C$ by setting
  #[#set math.equation(numbering: n => "(4.12)")
   $ tilde(Q)_(N \, E) & = sum_(r = 1)^D c_r / n^r sum_(g_1 \, dots.h \, g_r in E) k_(N \; g_1 \, g_2) dots.h.c
     k_(N \; g_(r - 1) \, g_r) #scale(x: 120%, y: 120%)[\(] z_(N \, g_1) z_(N \, g_r) -
     k_(N \; g_r \, g_1) #scale(x: 120%, y: 120%)[\)] \,\
Q_(N \, E) & = 1 / 2 #scale(x: 120%, y: 120%)[\(] tilde(Q)_(N \, E) +
  tilde(Q)_(N \, E)^(thin *) #scale(x: 120%, y: 120%)[\)] . $ <eq:empirical-quadratic-polynomial>]
  Multiplication in Equation (4.12) is in the displayed order.
    The entries of the empirical covariance array need satisfy no matrix positivity condition:
    this is a finite polynomial in elements of $C$, whereas square-root functional calculus was applied only to
    $P_E$ in the Gaussian comparison.
  The exact relabeling in Equation (3.5) carries each tuple in the sum for $F$ to its left translate in the sum
    for $h F$. It preserves the order of all factors, and taking self-adjoint parts commutes with
    $macron(alpha)_h$. Consequently
  #[#set math.equation(numbering: n => "(4.13)")
   $ Q_(N \, h F) = macron(alpha)_h \( Q_(N \, F) \) wide \( h in H \, med N gt.eq 1 \) .
     $ <eq:quadratic-exact-equivariance>]
  #strong[Step 4. Transfer of moments and scalar laws.] Consider now any sequence $N_j arrow.r
    oo$ and extreme traces $phi_j in "T" \( C \)$ such that
  $ phi_j \( k_(N_j \; g \, g') \) arrow.r R_(g \, g') wide \( g \, g' in J \) . $
  Proposition 6 gives convergence of every ordered mixed moment of the empirical variables.
    Any moment of the polynomials in Equations (4.12)–(4.12) is a finite linear combination of such moments.
    Since the limiting variables commute and Equation (4.11) is real-valued,
    it follows that the $Q_(N_j \, E)$ converge jointly in moments under $phi_j$ to the $q_E$. In particular,
  #[#set math.equation(numbering: n => "(4.14)")
   $ parallel Q_(N_j \, h F) - Q_(N_j \, F) parallel_(2 \, phi_j) arrow.r parallel q_(h F) -
     q_F parallel_(L^2) . $ <eq:quadratic-difference-limit>]
  Lemma 10 also gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ phi_j #scale(x: 120%, y: 120%)[\(] exp \( upright(i) s Q_(N_j \, F) \) #scale(x: 120%, y: 120%)[\)] arrow.r
     bb(E) exp \( upright(i) s q_F \) wide \( s in bb(R) \) . $ <eq:quadratic-exponential-limit>]
  This use of scalar spectral laws is pertinent because the operator norms of the $Q_(N \, E)$ may grow with $N$.
    Indeed, the elementary estimates $parallel k_(N \; g \, g') parallel lt.eq
    M^2$ and $parallel z_(N \, g) parallel lt.eq sqrt(N) thin M$ yield only
  $ parallel Q_(N \, E) parallel lt.eq \( N + 1 \) sum_(r = 1)^D \| c_r \| M^(2 r) . $
  Convergence of the scalar moments, together with the tail estimate Equation (4.3), is sufficient for Equation (4.15).
  #strong[Step 5. Uniformity over all traces.] Set $V_N = exp \( upright(i) t Q_(N \, F) \)$.
    For any self-adjoint $X \, Y$ in a unital $upright(C)^(*)$-algebra and any tracial state $phi$,
    differentiation gives
  $ frac(d, d s) #scale(x: 120%, y: 120%)[\(] e^(upright(i) \( 1 - s \) t X) e^(upright(i) s t Y)
    #scale(x: 120%, y: 120%)[\)] = e^(upright(i) \( 1 - s \) t X) thin upright(i) t \( Y - X \) thin
    e^(upright(i) s t Y) . $
  The tracial $2$-seminorm is unchanged by left and right unitary multiplication.
    Integration and the triangle inequality therefore give
  #[#set math.equation(numbering: n => "(4.16)")
   $ parallel e^(upright(i) t X) - e^(upright(i) t Y) parallel_(2 \, phi) lt.eq t parallel X -
     Y parallel_(2 \, phi) . $ <eq:tracial-duhamel>]
  In view of Equations (4.13), (4.14), and (4.9), every sequence of traces and indices with convergent covariance
    as above satisfies
  #[#set math.equation(numbering: n => "(4.17)")
   $ limsup_(j arrow.r oo) parallel macron(alpha)_h \( V_(N_j) \) - V_(N_j) parallel_(2 \, phi_j) & lt.eq
     t sqrt(2) thin \( sqrt(delta) + 2 eta \) < epsilon \/ 4 \,\
lim_(j arrow.r oo) \| phi_j \( V_(N_j)^ell \) \| & = \| bb(E) exp \( upright(i) ell t q_F \)
  #scale(x: 120%, y: 120%)[\|] lt.eq \( 1 + t^2 \)^(- 1 \/ 4) < epsilon \/ 4 . $ <eq:sequential-invariance-estimate>]
  Here $h in H$ and $1 lt.eq ell lt.eq m$, and the strict inequalities are Equations (4.5) and (4.4).
  It follows that, for all sufficiently large $N$, every extreme trace $phi in "T" \( C \)$ satisfies
  #[#set math.equation(numbering: n => "(4.18)")
   $ parallel macron(alpha)_h \( V_N \) - V_N parallel_(2 \, phi) < epsilon \/ 2 quad \( h in H \) \,
     wide \| phi \( V_N^ell \) \| < epsilon \/ 2 quad \( 1 lt.eq ell lt.eq m \) . $ <eq:extreme-uniform-estimates>]
  Indeed, otherwise choose $N_j arrow.r oo$ and an extreme trace $phi_j$ for which one of these finitely many
    tests fails. Passing to a subsequence fixes the failed test. The matrices
  $ #scale(x: 120%, y: 120%)[\(] phi_j \( k_(N_j \; g \, g') \) #scale(x: 120%, y: 120%)[\)]_(g \, g' in J) $
  belong to the compact set of real positive semidefinite matrices with diagonal one.
    A further subsequence has a limiting covariance $R$, and Equation (4.17) or Equation (4.17) contradicts the
    failure at tolerance $epsilon \/ 2$. Only the finite covariance matrices were extracted;
    no compactness of the extreme trace boundary is needed. Nor is a convergence rate uniform in $R$ required:
    each putative sequence of failures supplies one limiting $R$, to which the preceding moment argument applies.
    Moment determinacy is used after that $R$ has been fixed,
    so no common exponential-moment radius over all covariance matrices is required.
  Fix an $N$ for which Equation (4.18) holds. For each $h in H$, the squared seminorm
  $ phi mapsto phi
    #scale(x: 120%, y: 120%)[\(] \( macron(alpha)_h \( V_N \) - V_N \)^(*) \( macron(alpha)_h \( V_N \) - V_N \)
    #scale(x: 120%, y: 120%)[\)] $
  is weak-star continuous and affine on $"T" \( C \)$. For each $1 lt.eq ell lt.eq m$,
    the map $phi mapsto \| phi \( V_N^ell \) \|$ is weak-star continuous and convex.
    The sublevel sets with bounds $epsilon^2 \/ 4$ and $epsilon \/ 2$, respectively,
    are closed and convex and contain all extreme traces. By the Krein–Milman Theorem they contain $"T" \( C \)$.
    Thus the suprema in Equations (4.1) and (4.1) are at most $epsilon \/ 2$,
    and in particular strictly less than $epsilon$. Taking $Q = Q_(N \, F)$ and $V = V_N$ completes the proof. ◻
]

== 5 Invariant trace splittings and absorption <sec:splittings>

We pass from Proposition 7 to exact relations in $A^omega$.
  We first record the coordinate-selection fact used in both passages.

#thm([Lemma 5.1.])[
  (Coordinate selection).  #emph[If $x = \[ \( x_j \) \] in A^omega$ has a bounded representative, then
#[#set math.equation(numbering: n => "(5.1)")
 $ sup_(tau in "T"_omega \( A \)) parallel x parallel_(2 \, tau) & =
   lim_(j arrow.r omega) sup_(sigma in "T" \( A \)) parallel x_j parallel_(2 \, sigma) \,\
sup_(tau in "T"_omega \( A \)) \| tau \( x \) \| & = lim_(j arrow.r omega) sup_(sigma in "T" \( A \)) \|
  sigma \( x_j \) \| . $ <eq:coordinate-two>]

 Consequently, finitely many such tests can be realized simultaneously at a single coordinate with any prescribed
   positive slack above their ultralimit bounds.]
] <lem:coordinate>

#proof[
  Every sequence of traces gives the upper bound in each identity.
    Conversely, for each $j$, choose $sigma_j in "T" \( A \)$ within $1 \/
    j$ of the supremum for the test in question. Its limit trace realizes the reverse inequality;
    square roots and absolute values commute with ultralimits of bounded scalar sequences.
    For finitely many tests, the coordinates satisfying each individual bound with positive slack form a set in
    $omega$. Their intersection is again in $omega$, hence nonempty and indeed contains arbitrarily large
    coordinates. The maximizing trace may be different for every test. ◻
]

=== 5.1 A weighted Haar unitary <a-weighted-haar-unitary>

Keep the invariant separable algebra $C subset A^omega ∩ A'$ from Proposition 4.
  For $a in A_(+)$ and $tau in "T"_omega \( A \)$, define on $C$

#[#set math.equation(numbering: n => "(5.2)")
 $ tau_a \( c \) = tau \( a c \) . $ <eq:weighted-trace>]

This is a positive tracial functional. Positivity follows from $a c = a^(1 \/ 2) c a^(1 \/ 2)$ when $c gt.eq 0$,
  since $a$ commutes with $C$. For $c \, d in C$, traciality and the same commutation give $tau \( a c d \) =
  tau \( d a c \) = tau \( a d c \)$. Its norm is $tau \( a \)$.
  If $tau \( a \) > 0$, its normalization is therefore an element of $"T" \( C \)$; if $tau \( a \) = 0$,
  the functional is zero. Proposition 7 thus gives, for its unitary $V$,

#[#set math.equation(numbering: n => "(5.3)")
 $ \| tau \( a V^ell \) \| < epsilon thin tau \( a \) lt.eq epsilon quad #scale(x: 120%, y: 120%)[\(] 0 lt.eq
   a lt.eq 1 \, med tau in "T"_omega \( A \) \, med 1 lt.eq ell lt.eq m \, med
   tau \( a \) > 0 #scale(x: 120%, y: 120%)[\)] \, $ <eq:weighted-small-moments>]

with zero left side when $tau \( a \) = 0$. The approximate invariance estimates apply to limit traces by
  restriction to $C$.

#thm([Proposition 5.2.])[
  (A weighted Haar unitary).  #emph[There is a unitary $w in \( A^omega ∩ A' \)^(macron(alpha))$ such that,
    for every $a in A$, $tau in "T"_omega \( A \)$, and $f in C \( bb(T) \)$,
#[#set math.equation(numbering: n => "(5.4)")
 $ tau \( a f \( w \) \) = tau \( a \) integral_(bb(T)) f thin d mu \, $ <eq:haar>]

 where $bb(T) = { z in bb(C) : \| z \| = 1 }$ and $mu$ is normalized Haar measure.]
] <prop:haar>

#proof[
  Choose increasing finite sets $H_m subset G$ whose union is $G$, and a sequence $a_1 \, a_2 \,
    dots.h$ dense in the positive unit ball of $A$, with $a_1 = 1$.
    Apply Proposition 7 with $\( H \, epsilon \, m \) = \( H_m \, 1 \/ m \, m \)$,
    and denote its exponential unitary by $V^(\( m \)) in C$.
    It has a representative $\( v_j^(\( m \)) \)_j$ consisting of unitaries in $A$:
    lift its self-adjoint exponent to a bounded self-adjoint sequence and exponentiate coordinatewise.
    The bounds for these self-adjoint lifts may depend on $m$, whereas the unitary representatives always have norm one.
  Since $V^(\( m \))$ commutes with $A$, Lemma 11, Equation (5.3),
    and the invariance estimates allow a coordinate $j \( m \) gt.eq m$ at which $w_m =
    v_(j \( m \))^(\( m \))$ satisfies
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel \[ w_m \, a_r \] parallel_(2 \, u) & < 2 \/ m &  & \( 1 lt.eq r lt.eq m \) \,\
parallel alpha_h \( w_m \) - w_m parallel_(2 \, u) & < 2 \/ m &  & \( h in H_m \) \,\
sup_(sigma in "T" \( A \)) \| sigma \( a_r w_m^ell \) \| & < 2 \/ m &  & \( 1 lt.eq r \, ell lt.eq m \) .
  $ <eq:first-diagonal>]
  For the last line, apply Equation (5.1) to the class $a_r \( V^(\( m \)) \)^ell$.
    All coordinate tests are finite in number, and their suprema already range over all traces.
  The class $w = \[ \( w_m \) \]$ is a unitary. The first two lines of Equation (5.5), density,
    and $parallel \[ w_m \, a - a_r \] parallel_(2 \, u) lt.eq 2 parallel a -
    a_r parallel$ show that it is central relative to $A$ and fixed by $macron(alpha)$.
    The last line, first for every $a_r$, then by norm density for positive contractions,
    and then by linearity for $a in A$, gives
  $ tau \( a w^ell \) = 0 wide \( a in A \, med tau in "T"_omega \( A \) \, med ell gt.eq 1 \) . $
  The same holds for negative powers, because $tau \( a w^(- ell) \) = overline(tau \( a^(*) w^ell \))$.
    The zeroth power has trace $tau \( a \)$. Thus Equation (5.4) holds for trigonometric polynomials.
    Uniform approximation on $bb(T)$ and $\| tau \( a f \( w \) \) \| lt.eq
    parallel a parallel parallel f parallel_oo$ prove it for every continuous $f$. ◻
]

=== 5.2 Equal trace projections <equal-trace-projections>

#thm([Proposition 5.3.])[
  (Equal trace projections).  #emph[The action $alpha$ has equivariant uniform property Gamma.
    The projections in Definition 2 can be chosen to sum to $1$.]
] <prop:gamma>

#proof[
  Fix $k gt.eq 2$ and let $w = \[ \( w_j \) \]$ be the unitary of Proposition 12,
    represented by unitaries $w_j in A$. Partition $bb(T)$ into $k$ half-open arcs $I_1 \, dots.h \,
    I_k$ of Haar measure $1 \/ k$, and write $chi_i = 1_(I_i)$.
    Choose continuous functions $f_i^(\( r \)) : bb(T) arrow.r \[ 0 \, 1 \]$ satisfying
  $ e_r := max_(1 lt.eq i lt.eq k) parallel f_i^(\( r \)) - chi_i parallel_(L^2 \( mu \)) arrow.r 0 . $
  For example, replace each indicator near its two endpoints by linear ramps,
    with the total lengths of the transition arcs tending to zero.
    For this proof fix $r$, and write $f_i = f_i^(\( r \))$ and $e = e_r$.
    Pointwise bounds and the triangle inequality imply
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel f_i^2 - f_i parallel_(L^2 \( mu \)) & lt.eq e \,\
parallel f_i f_j parallel_(L^2 \( mu \)) & lt.eq 2 e &  & \( i eq.not j \) \,\
parallel sum_i f_i - 1 parallel_(L^2 \( mu \)) & lt.eq k e \,\
\| integral_(bb(T)) f_i thin d mu - 1 / k \| & lt.eq e . $ <eq:arc-bounds>]
  For the first inequality, use $\| f_i^2 - f_i \| lt.eq \| f_i - chi_i \|$ almost everywhere.
    For the second, expand $f_i f_j - chi_i chi_j = \( f_i - chi_i \) f_j +
    chi_i \( f_j - chi_j \)$ and use $chi_i chi_j = 0$ almost everywhere.
    The remaining inequalities follow from $sum_i chi_i = 1$ almost everywhere and the $L^1$–$L^2$ inequality for
    a probability measure.
  Set $y_i^(\( r \)) = f_i^(\( r \)) \( w \)$. These are central, invariant positive contractions,
    since continuous functional calculus respects commutation and automorphisms.
    Equation (5.4) with $a = 1$, applied to the squared modulus of each continuous function in Equation (5.6),
    gives the corresponding $2$-norm bounds for $y_i^(\( r \))$, uniformly over $tau in "T"_omega \( A \)$.
    For every positive contraction $a in A$, it also gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ lr(|tau \( a y_i^(\( r \)) \) - frac(tau \( a \), k)|) =
     tau \( a \) lr(|integral_(bb(T)) f_i^(\( r \)) thin d mu - 1 / k|) lt.eq e_r . $ <eq:arc-weighted>]
  Represent $y_i^(\( r \))$ by $f_i^(\( r \)) \( w_j \)$. Use $H_r$ and $a_1 \, dots.h \,
    a_r$ from the proof of Proposition 12. For this fixed $r$, Lemma 11 gives a coordinate $j \( r \) gt.eq
    r$ such that the positive contractions $y_(i \, r) = f_i^(\( r \)) \( w_(j \( r \)) \)$ satisfy,
    simultaneously for all indicated indices,
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel y_(i \, r)^2 - y_(i \, r) parallel_(2 \, u) & < e_r + 1 \/ r \,\
parallel y_(i \, r) y_(j \, r) parallel_(2 \, u) & < 2 e_r + 1 \/ r &  & \( i eq.not j \) \,\
parallel sum_i y_(i \, r) - 1 parallel_(2 \, u) & < k e_r + 1 \/ r \,\
parallel \[ y_(i \, r) \, a_s \] parallel_(2 \, u) & < 1 \/ r &  & \( s lt.eq r \) \,\
parallel alpha_h \( y_(i \, r) \) - y_(i \, r) parallel_(2 \, u) & < 1 \/ r &  & \( h in H_r \) \,\
sup_(sigma in "T" \( A \)) lr(|sigma \( a_s y_(i \, r) \) - frac(sigma \( a_s \), k)|) & < e_r +
  1 \/ r &  & \( s lt.eq r \) . $ <eq:second-diagonal>]
  This is a coordinate choice after $f_i^(\( r \))$ has been fixed.
    It therefore needs no uniform continuity modulus, as $r$ varies, for these increasingly sharp arc approximations.
  Let $p_i = \[ \( y_(i \, r) \)_r \] in A^omega$. Their representatives are uniformly bounded positive
    contractions. The first three lines of Equation (5.8) imply that $p_i$ are orthogonal projections summing to
    $1$; the next two lines imply centrality and invariance by density.
    For every sequence $\( sigma_r \)$ in $"T" \( A \)$, the last line gives
  $ lim_(r arrow.r omega) sigma_r \( a_s y_(i \, r) \) = 1 / k lim_(r arrow.r omega) sigma_r \( a_s \) . $
  This is Equation (2.2) for $a_s$, for every limit trace. Norm density and linearity extend it to all $a in A$.
    Thus the projections satisfy Definition 2. ◻
]

=== 5.3 The cocycle equations <the-cocycle-equations>

#proof[
  The trace hypotheses were checked in Section 2, and Proposition 13 supplies equivariant uniform property Gamma.
    All assumptions of Theorem 3 hold. It follows that $alpha$ and $beta =
    alpha ⊗ "id"_(cal(Z))$ are cocycle conjugate. We spell out the orientation to obtain the exact equations of
    the theorem.
  An isomorphism $Phi : A arrow.r B$ is automatically unital, since it is surjective between unital algebras.
    Put $gamma_g = Phi alpha_g Phi^(- 1)$. If cocycle conjugacy is supplied in the form $gamma_g =
    "Ad" \( u_g \) beta_g$ for a $beta$-cocycle $u$, then Equations (1.1) and (1.1) follow directly.
    In the reverse orientation, suppose
  $ beta_g = "Ad" \( v_g \) gamma_g \, wide v_(g h) = v_g gamma_g \( v_h \) . $
  Here the unitaries lie in $B$, whose multiplier algebra is $B$ itself. Set $u_g = v_g^(*)$. Then
  $ u_g beta_g \( u_h \) = v_g^(*) v_g gamma_g \( v_h^(*) \) v_g^(*) = gamma_g \( v_h^(*) \) v_g^(*) =
    v_(g h)^(*) = u_(g h) \, wide "Ad" \( u_g \) beta_g = gamma_g . $
  Thus either orientation gives the required $beta$-cocycle.
    Its identity relation $u_e = u_e^2$, together with unitarity, forces $u_e = 1$.
    This proves both displayed equations and hence the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[U.~Haagerup, #emph[Quasitraces on exact $C^(*)$-algebras are traces], C.~R. Math. Rep. Acad. Sci.
  Canada #strong[36] (2014), no.~2--3, 67--92. #link("https://arxiv.org/abs/1403.7653")[arXiv:1403.7653].]
#bibitem([2])[G.~Szabó, #emph[Equivariant property (SI) revisited], Anal.
  PDE #strong[14] (2021), no.~4, 1199--1232.
  #link("https://doi.org/10.2140/apde.2021.14.1199")[doi:10.2140/apde.2021.14.1199].
  #link("https://arxiv.org/abs/1904.10897v4")[arXiv:1904.10897v4].]
#bibitem([3])[G.~Szabó and L.~Wouters, #emph[Equivariant property Gamma and the tracial local-to-global principle
  for $C^(*)$-dynamics], Anal. PDE #strong[18] (2025), no.~6, 1385--1432.
  #link("https://doi.org/10.2140/apde.2025.18.1385")[doi:10.2140/apde.2025.18.1385].
  #link("https://arxiv.org/abs/2301.12846v3")[arXiv:2301.12846v3].]
#bibitem([4])[A.~S. Toms and W.~Winter, #emph[Strongly self-absorbing $C^(*)$-algebras], Trans. Amer. Math. Soc.
  #strong[359] (2007), no.~8, 3999--4029. #link("https://arxiv.org/abs/math/0502211v2")[arXiv:math/0502211v2].]
