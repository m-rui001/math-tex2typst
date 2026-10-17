#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Lipschitz Equivalent Separable Banach Spaces \
Need Not Be Linearly Isomorphic]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A Banach-space norm defines both a linear topology and a metric. A bounded linear isomorphism preserves the metric up to multiplicative constants, but a map with that metric property need not preserve addition or scalar multiplication. The Lipschitz-isomorphism problem asks whether a #emph[bijection] with two-sided Lipschitz bounds nevertheless forces two Banach spaces to be linearly isomorphic. We consider the separable real case and obtain a negative answer.

Throughout, $ell_2$ denotes the real separable Hilbert space of square-summable scalar sequences. For a Banach space $H$, set

$ c_0 \( H \) = { \( v_i \)_(i gt.eq 1) : v_i in H \, med parallel v_i parallel arrow.r 0 } \, #h(2em) parallel \( v_i \) parallel = sup_i parallel v_i parallel . $

Ordinary $c_0$ means $c_0 \( bb(R) \)$. A linear embedding means a bounded linear map that is bounded below; its range is consequently closed.

#thm([Theorem 1.1.])[
  #emph[There are separable real Banach spaces $X \, Y$ and a bijection $Psi : X arrow.r Y$ such that, for every $s \, t in X$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ 4 / 21 parallel s - t parallel_X lt.eq parallel Psi \( s \) - Psi \( t \) parallel_Y lt.eq 76 / 25 parallel s - t parallel_X . $ <eq:main-bounds>]

 The space $X$ contains a linearly isometric copy of $c_0 \( ell_2 \)$, while $Y$ contains no closed subspace linearly isomorphic to $c_0 \( ell_2 \)$. In particular, $X$ and $Y$ are not linearly isomorphic.]
] <thm:main>

The obstruction in this theorem is deliberately block-valued: each coordinate of $c_0 \( ell_2 \)$ is an entire Hilbert space. It does not say that $Y$ contains no ordinary $c_0$. The Hilbert block in each coordinate is essential to the obstruction proved below.

=== Historical setting <historical-setting>

Ribe proved that uniformly homeomorphic normed spaces have the same finite-dimensional linear structure up to a uniform distortion bound #cite(label("Ribe76")) Theorem 1. That result shows how much linear information can survive even a weaker form of metric equivalence. At the same time, Aharoni and Lindenstrauss constructed Lipschitz equivalent, nonisomorphic nonseparable Banach spaces and explicitly asked for separable examples #cite(label("AL78")) pp. 281–282. Ribe later constructed separable uniformly homeomorphic, nonisomorphic spaces #cite(label("Ribe84")). Aharoni and Lindenstrauss then gave uniform pairs that are not Lipschitz equivalent #cite(label("AL85")), while Johnson, Lindenstrauss and Schechtman developed further separable uniform examples and left the separable Lipschitz question open #cite(label("JLS96")) Theorem 5.8 and Section 8(3). These developments make the global two-sided estimate in (1.1) a substantive requirement, rather than a reformulation of a uniform counterexample.

Several positive results explain why the separable question resists a direct transfer of those examples. Godefroy, Kalton and Lancien proved that a Banach space Lipschitz isomorphic to $c_0$ is linearly isomorphic to $c_0$, and that being linearly isomorphic to a subspace of $c_0$ is invariant under Lipschitz isomorphism #cite(label("GKL00")) Theorems 2.1–2.2. Godefroy and Kalton’s lifting theorem places every separable Banach space linearly and isometrically inside its Lipschitz-free space; their quotient corollary converts a Lipschitz right inverse of a linear quotient onto a separable space into a bounded linear right inverse #cite(label("GK03")) Theorem 3.1 and Corollary 3.2. The construction below uses free spaces; 8 explains the distinction between the lift used here and a right inverse of the linearized correction.

In the quasi-Banach setting, Albiac and Kalton obtained separable counterexamples for every $0 < p < 1$ #cite(label("AK09")) Theorem 5.4. The strict inequality $p < 1$ is part of that theorem, so it does not settle the Banach-norm case. Kalton recorded the separable Lipschitz-isomorphism question as Problem 3 in his 2008 survey #cite(label("Kalton08")) Section 2.2; Albiac, Ansorena, Bíma and Cúth still described the Banach case as open in the first paragraph of their paper published online in December 2025 #cite(label("AABC26")). Theorem 1 resolves that question negatively for separable real Banach spaces. It asserts neither reflexivity nor a complex-scalar analogue.

For comparison, every surjective isometry between the unit spheres of nonzero real Banach spaces extends uniquely to a surjective real-linear isometry #cite(label("OpenAITingley")) Theorem 1.1. That result concerns exact distances on unit spheres; here we allow fixed multiplicative distortion but require a bijection of the whole spaces.

=== Proof overview <proof-overview>

The proof separates the metric construction from the linear obstruction. Its intermediate map acts between Hilbert spaces:

$ M = U xor_2 V \, #h(2em) V = ell_2 \, #h(2em) h : M arrow.r U . $

Here $U = \( xor.big_(n gt.eq 1) U_n \)_2$ is a Hilbert sum of finite-dimensional coordinate blocks. The map $h$ is an onto bi-Lipschitz change of variables fixing zero, close to an isometry. Its relevant nonlinear part is

$ D \( u \, v \) = h \( u \, v \) - u . $

The construction arranges that, near any finite family of distinct points of $M$, the sufficiently high output coordinates of $D$ lie in mutually orthogonal coordinate subspaces. The cutoff index and the neighborhoods may depend on that finite family. We call this property #emph[local orthogonality].

To turn this geometry into a linear obstruction, use the Lipschitz-free space $E = cal(F) \( M \)$, the closed linear span of evaluation functionals on real zero-preserving Lipschitz functions. The evaluation map $delta : M arrow.r E$ preserves distances. Every zero-preserving Lipschitz map has a bounded linearization, so $D$ determines $q : E arrow.r U$ by

$ q delta \( u \, v \) = h \( u \, v \) - u . $

Section 4 proves that local orthogonality makes $q$ #emph[completely continuous]: a weakly null sequence in $E$ has norm-null image. This is the one place where the local coordinate geometry enters the Banach-space obstruction.

The linearization is also what makes the metric change of variables possible. Give $E xor V$ its sum norm and put

$ Q_1 \( e \, v \) = \( q e \, v \) \, #h(2em) B \( e \, v \) = e + delta \( q e \, v \) . $

The identity $q B = h Q_1$ is triangular: applying $q$ to the new variable records $h$ of the old output. Given $z in E$, one first recovers $x = h^(- 1) \( q z \)$ and then subtracts $delta \( x \)$; this yields the explicit inverse of $B$. Section 3 proves both inverse identities and keeps track of the sum norm.

For a bounded linear $Q : A arrow.r H$, the graph space used in the final step consists of sequences $s = \( s_i \)$ for which $sum_i 2^(- i) parallel s_i parallel < oo$ and $\( Q s_i \) in c_0 \( H \)$, with norm

$ parallel s parallel_(Z_Q) = max {sum_i 2^(- i) parallel s_i parallel \, med sup_i parallel Q s_i parallel} . $

Set $X = Z_(Q_1)$ and $Y = Z_q$. Applying $B$ in each coordinate gives the desired bijection: $q B = h Q_1$ controls the second part of the graph norm, and the Lipschitz bounds for $B$ control the weighted sum. The $V$ coordinates embed $c_0 \( V \)$ isometrically in $X$. By contrast, complete continuity of $q$ makes each fixed output coordinate tend to zero along an orthonormal sequence in any Hilbert block of a proposed $c_0 \( ell_2 \)$ copy in $Y$. A disjoint-support argument then finds a unit vector in each block with arbitrarily small full $c_0 \( U \)$ output. A surviving copy would embed ordinary $c_0$ into $ell_1 \( E \)$. Section 2 excludes this because $E = cal(F) \( M \)$ is weakly sequentially complete.

Two analytic steps supply the inputs just described. For localized linearization, a hypothetical non-null image of a weakly null sequence produces uniformly Lipschitz scalar tests $d_i$. Orthogonality allows only finitely many points where their limiting local Lipschitz constants remain large. Cutoffs remove neighborhoods of those points; a shrinking-ball lemma shows that the removed tests pair negligibly with the weakly null sequence. The compact reduction theorem of Aliaga, Noûs, Petitjean and Procházka #cite(label("ANPP21")) Theorem 2.3 then reduces the remainder to a compact set, where a finite cover controls its Lipschitz constant.

For the Hilbert map, a unit vector in each block is designated as a slot. With the slots frozen, perpendicular components stay in their blocks, old slot coordinates move to even blocks, and the additional $ell_2$ coordinates fill odd blocks. This is an onto linear isometry. The slots are then allowed to depend on the input so that near different points they eventually use disjoint coordinates. Finite approximants freeze all but finitely many slots and have uniform global inverse bounds. Section 5 constructs the slots with a common radial derivative budget, proves global invertibility of the finite approximants, and passes to an onto limit. Its decisive estimate bounds every tail of the inverse images by the corresponding tail of a fixed output, with an exact cancellation of slot terms. Section 6 combines the results and computes the constants in (1.1).

== 2 Free spaces and the graph-space obstruction <sec:free-graph>

The metric construction will provide a bounded linear operator $q : E arrow.r U$ that is completely continuous, with $E$ weakly sequentially complete. This section explains why those two properties exclude $c_0 \( ell_2 \)$ from the associated graph space. We first record the free-space facts that produce $E$, then prove the obstruction without assuming compactness of any operator into $c_0 \( U \)$.

=== 2.1 Free-space facts and the two external inputs <free-space-facts-and-the-two-external-inputs>

For a pointed metric space $\( M \, d \, 0 \)$, let $"Lip"_0 \( M \)$ be the Banach space of real Lipschitz functions $f : M arrow.r bb(R)$ with $f \( 0 \) = 0$, normed by $"Lip" \( f \)$. Let $delta \( x \) in "Lip"_0 \( M \)^(*)$ be evaluation at $x$, and define

$ cal(F) \( M \) = overline("span") { delta \( x \) : x in M } subset "Lip"_0 \( M \)^(*) . $

The evaluation and molecule construction goes back to Arens and Eells #cite(label("AE56")) Sections 2–3; the notation here is the later Lipschitz-free formulation. In particular, $delta \( 0 \) = 0$. When a Lipschitz function $f$ need not vanish at $0$, the pairing $chevron.l f \, mu chevron.r$ means $chevron.l f - f \( 0 \) \, mu chevron.r$.

The evaluation map preserves distances:

#[#set math.equation(numbering: n => "(2.1)")
 $ parallel delta \( x \) - delta \( y \) parallel = d \( x \, y \) . $ <eq:delta-isometry>]

The Lipschitz inequality gives the upper bound. For the reverse bound, test against $t mapsto d \( t \, y \) - d \( 0 \, y \)$, which has Lipschitz constant at most one. If $M$ is separable, choose a countable dense set $D_0 subset M$. Equation (2.1) shows that finite rational linear combinations of $delta \( D_0 \)$ are dense in $cal(F) \( M \)$; hence $cal(F) \( M \)$ is separable.

If $K subset M$ contains $0$, the closed span of $delta \( K \)$ in $cal(F) \( M \)$ is isometric to $cal(F) \( K \)$. To see this, a real $L$-Lipschitz function $f$ on $K$ extends with the same Lipschitz constant by the McShane formula #cite(label("Kalton04")) Lemma 3.1 and the following paragraph

$ tilde(f) \( x \) = inf_(z in K) #scale(x: 120%, y: 120%)[\(] f \( z \) + L thin d \( x \, z \) #scale(x: 120%, y: 120%)[\)] . $

For $L = 0$ use the constant extension. For $L > 0$, the Lipschitz inequality on $K$ makes the displayed infimum equal to $f$ there, and the triangle inequality gives the $L$-Lipschitz bound on $M$. The infimum is finite because $0 in K$ supplies an upper bound and the triangle inequality supplies a lower bound. Thus the suprema defining the two free-space norms agree on finite evaluation sums supported in $K$, and then on their closures. In particular,

#[#set math.equation(numbering: n => "(2.2)")
 $ \| chevron.l f \, nu chevron.r \| lt.eq "Lip" \( f \|_K \) parallel nu parallel #h(2em) \( nu in cal(F) \( K \) \) . $ <eq:compact-pairing>]

For any Banach space $H$ and any Lipschitz map $D : M arrow.r H$ with $D \( 0 \) = 0$, there is a unique bounded linear map

#[#set math.equation(numbering: n => "(2.3)")
 $ hat(D) : cal(F) \( M \) arrow.r H \, #h(2em) hat(D) delta \( x \) = D \( x \) \, #h(2em) parallel hat(D) parallel = "Lip" \( D \) . $ <eq:linearization>]

Indeed, for a finite evaluation sum, define $hat(D) \( sum_j a_j delta \( x_j \) \) = sum_j a_j D \( x_j \)$. Testing the latter vector against a norm-one functional in $H^(*)$ and using the free-space norm gives

$ ∥sum_j a_j D \( x_j \)∥ lt.eq "Lip" \( D \) ∥sum_j a_j delta \( x_j \)∥ . $

This inequality makes the definition independent of the chosen representation and extends it continuously to $cal(F) \( M \)$. Testing the extension on $delta \( x \) - delta \( y \)$ proves the reverse norm bound. This metric-domain linearization is recorded in #cite(label("Kalton04")) Lemma 3.2; for Banach-space domains see also Godefroy and Kalton #cite(label("GK03")) Lemma 2.5.

A bounded linear operator is #emph[completely continuous] if it sends each weakly null sequence to a norm-null sequence. A Banach space is #emph[weakly sequentially complete] if each weakly Cauchy sequence has a weak limit in the space. We use the following two external results with exactly the displayed hypotheses.

#thm([Theorem 2.1.])[
  (Compact reduction for a weakly null sequence).  #emph[Let $\( M \, d \, 0 \)$ be a complete pointed metric space, and let $mu_i arrow.r 0$ weakly in $cal(F) \( M \)$. For every $tau > 0$, there is a compact $K subset M$, with $0 in K$, such that 
$ "dist" \( mu_i \, cal(F) \( K \) \) < tau #h(2em) upright("for every ") i . $

]
] <thm:compact-reduction>

This is the sequential consequence of the tightness theorem of Aliaga, Noûs, Petitjean and Procházka #cite(label("ANPP21")) Theorem 2.3, arXiv version cited in the bibliography. Their theorem states that every weakly precompact subset $W$ of $cal(F) \( M \)$, for complete $M$, is tight: for each $epsilon.alt > 0$ there is compact $K_0 subset M$ with $W subset cal(F) \( K_0 \) + epsilon.alt B_(cal(F) \( M \))$, where for an arbitrary subset $K_0$ this notation means its closed evaluation span inside $cal(F) \( M \)$. Here weak precompactness means that every sequence in $W$ has a weakly Cauchy subsequence. The set ${ 0 \, mu_1 \, mu_2 \, dots.h }$ has that property: any sequence in it has either a constant subsequence or a subsequence whose indices tend to infinity, which converges weakly to zero. Apply the theorem with $epsilon.alt = tau \/ 2$ and enlarge $K_0$ by $0$. This gives the strict inequality above. Kalton’s finite-radius localization lemma #cite(label("Kalton04")) Lemma 4.5 is a precursor to this complete-space compact reduction.

#thm([Theorem 2.2.])[
  (Weak sequential completeness of a free space).  #emph[If $M$ is a superreflexive real Banach space, then $cal(F) \( M \)$ is weakly sequentially complete. In particular, this applies to every real Hilbert space $M$.]
] <thm:free-wsc>

This is #cite(label("ANPP21")) Corollary 2.5, arXiv version cited in the bibliography. Its compact-set input is the Main Theorem of Kochanek and Pernecká #cite(label("KP18")), which concerns free spaces over compact subsets of superreflexive Banach spaces, not directly the whole Hilbert space.

=== 2.2 Weighted graph spaces <weighted-graph-spaces>

Let $A \, H$ be real Banach spaces and $Q : A arrow.r H$ bounded and linear. Define

#[#set math.equation(numbering: n => "(2.4)")
 $ Z_Q = { s = \( s_i \)_(i gt.eq 1) :  & s_i in A \, quad sum_(i gt.eq 1) 2^(- i) parallel s_i parallel < oo \, quad \( Q s_i \)_(i gt.eq 1) in c_0 \( H \) #scale(x: 120%, y: 120%)[}] \,\
parallel s parallel_(Z_Q) =  & max {sum_(i gt.eq 1) 2^(- i) parallel s_i parallel \, sup_(i gt.eq 1) parallel Q s_i parallel} . $ <eq:graph-space>]

The membership condition is part of the definition; finiteness of the displayed maximum alone would not require the $Q$-images to tend to zero.

#thm([Lemma 2.3.])[
  #emph[$Z_Q$ is a Banach space, and it is separable if $A \, H$ are separable. The coordinate map $p_i : Z_Q arrow.r A$, $p_i \( s \) = s_i$, has norm at most $2^i$, and 
$ J_Q : Z_Q arrow.r c_0 \( H \) \, #h(2em) J_Q \( s \) = \( Q s_i \)_i \, $

 has norm at most one.]
] <lem:graph-banach>

#proof[
  Let $ell_1 \( 2^(- i) \; A \)$ denote the weighted sum space with norm $sum_i 2^(- i) parallel s_i parallel$. The map $s mapsto \( 2^(- i) s_i \)_i$ is an isometry from this space onto $ell_1 \( A \)$, so it is complete. The map
  $ s mapsto #scale(x: 120%, y: 120%)[\(] s \, \( Q s_i \)_i #scale(x: 120%, y: 120%)[\)] $
  identifies $Z_Q$ isometrically with a subspace of $ell_1 \( 2^(- i) \; A \) xor_oo c_0 \( H \)$. This subspace is closed. In fact, suppose $\( s^(\( k \)) \, \( Q s_i^(\( k \)) \)_i \)$ converges there to $\( s \, y \)$. For each fixed $i$,
  $ parallel s_i^(\( k \)) - s_i parallel lt.eq 2^i parallel s^(\( k \)) - s parallel_(ell_1 \( 2^(- j) \; A \)) arrow.r 0 . $
  Continuity of $Q$ gives $Q s_i^(\( k \)) arrow.r Q s_i$, whereas convergence in $c_0 \( H \)$ gives $Q s_i^(\( k \)) arrow.r y_i$. Thus $y_i = Q s_i$ for all $i$, as required. Completeness follows.
  If $A \, H$ are separable, truncating a sequence in $Z_Q$ gives convergence in both parts of (2.4): the weighted sum has a vanishing tail, and the $Q$-image is norm-null. Choose a fixed countable dense subset of $A$. The finitely supported sequences with entries in that subset form a countable dense subset of $Z_Q$, because each of their finitely many entries may be approximated in $A$ and $Q$ is continuous. Finally, the two claimed operator bounds are immediate from (2.4). ◻
]

The next lemma records exactly the consequence of weak sequential completeness that the graph obstruction needs. It does not assert that every operator into a $c_0$-sum is compact.

#thm([Lemma 2.4.])[
  #emph[If $E$ is a weakly sequentially complete real Banach space, then $ell_1 \( E \)$ contains no closed subspace linearly isomorphic to ordinary $c_0$.]
] <lem:no-c0-sum>

#proof[
  Every finite direct sum of $E$ is weakly sequentially complete: the coordinates of a weakly Cauchy sequence are weakly Cauchy in $E$, hence have weak limits, and the finite list of limits is the weak limit in the sum. The property also passes to a closed linear subspace $F$ of a weakly sequentially complete space $G$. Indeed, a weakly Cauchy sequence in $F$ is weakly Cauchy in $G$; its weak limit lies in $F$, since a closed linear subspace is weakly closed by Hahn–Banach separation. Every functional on $F$ extends to $G$ by Hahn–Banach, so the same limit is weak in $F$.
  Ordinary $c_0$ is not weakly sequentially complete. If $\( e_k \)$ is its usual unit basis, the partial sums $e_1 + dots.h.c + e_n$ are weakly Cauchy: for every $\( a_k \) in c_0^(*) = ell_1$, their pairings are the Cauchy partial sums $sum_(k lt.eq n) a_k$. A weak limit would have every coordinate equal to one, which is not an element of $c_0$.
  Suppose now that $A : c_0 arrow.r ell_1 \( E \)$ is a linear embedding with $parallel A x parallel gt.eq b parallel x parallel$, where $b > 0$. Let $P_N$ be projection onto the first $N$ coordinates, with $P_0 = 0$. No $P_N A$ is bounded below, because otherwise its closed range would be a copy of $c_0$ in the weakly sequentially complete finite sum $E^N$.
  Starting with $N_0 = 0$, choose unit vectors $x_j in c_0$ and integers $N_j > N_(j - 1)$ recursively so that
  $ parallel P_(N_(j - 1)) A x_j parallel < b \/ 8 \, #h(2em) parallel \( I - P_(N_j) \) A x_j parallel < b \/ 8 . $
  The first inequality is possible because $P_(N_(j - 1)) A$ is not bounded below; after choosing $x_j$, its $ell_1 \( E \)$ tail gives the second. Put $z_j = \( P_(N_j) - P_(N_(j - 1)) \) A x_j$. Then
  $ parallel A x_j - z_j parallel < b \/ 4 \, #h(2em) parallel z_j parallel > 3 b \/ 4 . $
  The $z_j$ have disjoint coordinate supports. For any finite scalar family $\( alpha_j \)$,
  $ ∥sum_j alpha_j A x_j∥ & gt.eq ∥sum_j alpha_j z_j∥ - sum_j \| alpha_j \| parallel A x_j - z_j parallel\
 & = sum_j \| alpha_j \| parallel z_j parallel - sum_j \| alpha_j \| parallel A x_j - z_j parallel gt.eq b / 2 sum_j \| alpha_j \| . $
  Consequently,
  $ frac(b, 2 parallel A parallel) sum_j \| alpha_j \| lt.eq ∥sum_j alpha_j x_j∥_(c_0) lt.eq sum_j \| alpha_j \| . $
  The finite-sum map therefore extends by completeness to a bounded linear embedding of $ell_1$ into $c_0$, with closed range. This is impossible. If $F$ is any closed subspace of $c_0$, the restriction map $c_0^(*) = ell_1 arrow.r F^(*)$ is onto by Hahn–Banach, so $F^(*)$ is separable. A subspace isomorphic to $ell_1$ would instead have dual isomorphic to $ell_oo$, which is nonseparable: the uncountable set of all $0$-$1$ sequences is pairwise separated by distance one. This contradiction proves the lemma. ◻
]

#thm([Lemma 2.5.])[
  #emph[Let $E \, U$ be real Banach spaces, with $E$ weakly sequentially complete, and let $q : E arrow.r U$ be a completely continuous bounded linear operator. Then $Z_q$ contains no closed subspace linearly isomorphic to $c_0 \( ell_2 \)$.]
] <lem:graph-obstruction>

#proof[
  Suppose that $S : c_0 \( ell_2 \) arrow.r Z_q$ is a linear embedding with $parallel S x parallel_(Z_q) gt.eq b_0 parallel x parallel$, $b_0 > 0$. We will select a scalar copy of $c_0$ on which the $c_0 \( U \)$ part of $S$ has norm at most $b_0 \/ 2$. The weighted sum part of the graph norm must then retain the lower bound $b_0$, giving a copy of $c_0$ in $ell_1 \( E \)$, contrary to 5.
  Write $I_n : ell_2 arrow.r c_0 \( ell_2 \)$ for injection into the $n$th coordinate and put
  $ T_n = J_q S I_n : ell_2 arrow.r c_0 \( U \) . $
  We first prove that each $T_n$ fails to be bounded below.
  Fix $n$ and an orthonormal sequence $\( e_k \)$ in $ell_2$. It is weakly null, since the scalar coefficients of a fixed Hilbert vector against an orthonormal sequence are square summable. For each fixed $i$, boundedness of $p_i S I_n$ therefore gives $p_i S I_n e_k arrow.r 0$ weakly in $E$. Complete continuity of $q$ implies
  $ parallel \( T_n e_k \)_i parallel = parallel q thin p_i S I_n e_k parallel arrow.r 0 #h(2em) upright("for each fixed ") i . $
  Set $y_k = T_n e_k$, so $parallel y_k parallel lt.eq parallel T_n parallel$. Choose $k_j$ increasing and integers $0 = m_0 < m_1 < m_2 < dots.h.c$ as follows. Having chosen $m_(j - 1)$, choose $k_j$ so large that
  $ max_(i lt.eq m_(j - 1)) parallel \( y_(k_j) \)_i parallel < 2^(- j) . $
  The maximum over no coordinates is zero. Then choose $m_j > m_(j - 1)$ so large that $sup_(i > m_j) parallel \( y_(k_j) \)_i parallel < 2^(- j)$, using $y_(k_j) in c_0 \( U \)$. Let $z_j$ be the restriction of $y_(k_j)$ to coordinates $m_(j - 1) < i lt.eq m_j$. Thus
  $ parallel y_(k_j) - z_j parallel < 2^(- j) \, #h(2em) parallel z_j parallel lt.eq parallel T_n parallel . $
  Because the $z_j$ have disjoint coordinate supports, for all $N$
  $ ∥sum_(j = 1)^N T_n e_(k_j)∥ lt.eq ∥sum_(j = 1)^N z_j∥ + sum_(j = 1)^N 2^(- j) lt.eq parallel T_n parallel + 1 . $
  The corresponding input sum has Hilbert norm $sqrt(N)$. No positive lower bound for $T_n$ is compatible with these two estimates.
  Choose a unit vector $t_n in ell_2$ such that $parallel T_n t_n parallel lt.eq b_0 thin 2^(- n - 1)$. The map
  $ R : c_0 arrow.r c_0 \( ell_2 \) \, #h(2em) R \( a \) = \( a_n t_n \)_n $
  is a linear isometry. For finitely supported $a$,
  $ parallel J_q S R a parallel lt.eq sum_n \| a_n \| parallel T_n t_n parallel lt.eq b_0 / 2 parallel a parallel_oo . $
  Truncation in $c_0$ and continuity extend this estimate to every $a in c_0$. On the other hand $parallel S R a parallel_(Z_q) gt.eq b_0 parallel a parallel_oo$. The second part of the maximum in (2.4) is at most $\( b_0 \/ 2 \) parallel a parallel_oo$, so the first part must satisfy
  $ sum_i 2^(- i) parallel \( S R a \)_i parallel gt.eq b_0 parallel a parallel_oo . $
  For $a = 0$ this is immediate; for $a eq.not 0$ it follows because the second part is strictly below the required lower bound for the maximum. Hence
  $ a mapsto #scale(x: 120%, y: 120%)[\(] 2^(- i) \( S R a \)_i #scale(x: 120%, y: 120%)[\)]_i $
  is a bounded linear embedding of $c_0$ into $ell_1 \( E \)$. Boundedness comes from $sum_i 2^(- i) parallel \( S R a \)_i parallel lt.eq parallel S R a parallel_(Z_q)$, and the displayed lower bound makes the range closed. This contradicts 5. ◻
]

== 3 A triangular change of variables <sec:triangular>

An onto bi-Lipschitz Hilbert-space change of variables $h$ will produce a bi-Lipschitz equivalence between two weighted graph spaces. The triangular map below has an explicit inverse obtained from $h^(- 1)$. The identities involving $h$ and $h^(- 1)$ control the $c_0$-output, while direct Lipschitz estimates control the weighted sum. Complete continuity of the linearization of $h - pi_U$ enters only at the final step: the preceding obstruction then shows that the two graph spaces are not linearly isomorphic.

Triangular changes of variables also appear in the quotient-section construction of Aharoni and Lindenstrauss #cite(label("AL78")) pp. 281–282 and in the free-space splitting of Godefroy and Kalton #cite(label("GK03")) Theorem 2.12. Here the argument uses the locally verified identity $q B = h Q_1$.

#thm([Proposition 3.1.])[
  (Weighted graph criterion).  #emph[Let $U$ be a separable real Hilbert space, $V = ell_2$, and $M = U xor_2 V$, with projections $pi_U \, pi_V$. Suppose $h : M arrow.r U$ is a bijection with $h \( 0 \) = 0$ and, for all $x \, x' in M$, 
$ a parallel x - x' parallel lt.eq parallel h \( x \) - h \( x' \) parallel lt.eq b parallel x - x' parallel \, #h(2em) 0 < a lt.eq b < oo . $

 Let $E = cal(F) \( M \)$ and let $q : E arrow.r U$ be the linearization of $D = h - pi_U$. Suppose $q$ is completely continuous. Give $E xor V$ the sum norm, define 
$ Q_1 : E xor_1 V arrow.r M \, quad Q_1 \( e \, v \) = \( q e \, v \) \, #h(2em) X = Z_(Q_1) \, #h(2em) Y = Z_q \, $

 and put $L_q = parallel q parallel$, $K_q = max { L_q \, 1 }$. Then $X \, Y$ are separable real Banach spaces and there is a bijection $Psi : X arrow.r Y$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ "Lip" \( Psi \) lt.eq max { 1 + K_q \, b } \, #h(2em) "Lip" \( Psi^(- 1) \) lt.eq max { 1 + 2 L_q \/ a \, 1 \/ a } . $ <eq:criterion-bounds>]

 Moreover, $X$ contains $c_0 \( V \)$ isometrically and $Y$ contains no closed subspace linearly isomorphic to $c_0 \( V \)$.]
] <prop:criterion>

#proof[
  The space $E$ is separable because $M$ is separable. The two operators $Q_1$ and $q$ are bounded: in the sum norm,
  #[#set math.equation(numbering: n => "(3.2)")
   $ parallel Q_1 \( e \, v \) parallel_M = #scale(x: 120%, y: 120%)[\(] parallel q e parallel^2 + parallel v parallel^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq K_q \( parallel e parallel + parallel v parallel \) . $ <eq:q1-bound>]
  Thus 4 applies to $X$ and $Y$.
  Define the zero-preserving map
  #[#set math.equation(numbering: n => "(3.3)")
   $ B : E xor_1 V arrow.r E \, #h(2em) B \( e \, v \) = e + delta \( q e \, v \) . $ <eq:B-definition>]
  The defining identity $q delta \( u \, v \) = h \( u \, v \) - u$ gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ q B \( e \, v \) = q e + h \( q e \, v \) - q e = h \( Q_1 \( e \, v \) \) . $ <eq:diagram>]
  For $z in E$, the inverse of $h$ is defined at $q z$; set $x = h^(- 1) \( q z \)$ and
  #[#set math.equation(numbering: n => "(3.5)")
   $ C \( z \) = #scale(x: 120%, y: 120%)[\(] z - delta \( x \) \, thin pi_V x #scale(x: 120%, y: 120%)[\)] . $ <eq:B-inverse>]
  Since
  $ q \( z - delta \( x \) \) = q z - #scale(x: 120%, y: 120%)[\(] h \( x \) - pi_U x #scale(x: 120%, y: 120%)[\)] = pi_U x \, $
  we have $Q_1 C \( z \) = x$, and substitution in (3.3) gives $B \( C \( z \) \) = z$. Conversely, if $z = B \( e \, v \)$, then (3.4) and injectivity of $h$ give $h^(- 1) \( q z \) = Q_1 \( e \, v \) = \( q e \, v \)$. Formula (3.5) therefore returns $\( e \, v \)$. Thus $C = B^(- 1)$ and
  #[#set math.equation(numbering: n => "(3.6)")
   $ Q_1 B^(- 1) = h^(- 1) q . $ <eq:inverse-diagram>]
  Only the inverse of $h$ was used. In particular, this argument does not require $q$ to be onto.
  We next keep track of the two norms. For $w = \( e \, v \)$ and $w' = \( e' \, v' \)$, the isometry of $delta$ and (3.2) yield
  $ parallel B \( w \) - B \( w' \) parallel lt.eq parallel e - e' parallel + parallel Q_1 \( w - w' \) parallel lt.eq \( 1 + K_q \) parallel w - w' parallel_(E xor_1 V) . $
  For $z \, z' in E$, put $x = h^(- 1) \( q z \)$, $x' = h^(- 1) \( q z' \)$. The lower bound for $h$ implies
  $ parallel x - x' parallel_M lt.eq L_q / a parallel z - z' parallel . $
  Using the #emph[sum] norm in (3.5), rather than a Hilbert sum norm on $E xor V$, gives
  $ parallel B^(- 1) \( z \) - B^(- 1) \( z' \) parallel_(E xor_1 V) & lt.eq parallel z - z' parallel + parallel delta \( x \) - delta \( x' \) parallel + parallel pi_V \( x - x' \) parallel\
 & lt.eq parallel z - z' parallel + 2 parallel x - x' parallel_M\
 & lt.eq \( 1 + 2 L_q \/ a \) parallel z - z' parallel . $
  Neither estimate divides by $L_q$; they remain valid as written when $L_q = 0$. In the present setting $V = ell_2 eq.not 0$, that case cannot in fact occur under the hypotheses, since $q = 0$ would give $h \( u \, v \) = u$, contradicting injectivity.
  Define $Psi$ coordinatewise by
  #[#set math.equation(numbering: n => "(3.7)")
   $ Psi \( s \)_i = B \( s_i \) #h(2em) \( s in X \) . $ <eq:Psi-coordinatewise>]
  Because $B \( 0 \) = 0$, the bound for $B$ makes $sum_i 2^(- i) parallel B \( s_i \) parallel$ finite. Also $Q_1 s_i arrow.r 0$ in $M$; by (3.4) and continuity of $h$ at zero, $q B \( s_i \) = h \( Q_1 s_i \) arrow.r 0$. Hence $Psi \( s \) in Y$. Likewise $B^(- 1) \( 0 \) = 0$ controls the weighted sum for the coordinatewise inverse, and (3.6) shows that if $q z_i arrow.r 0$, then $Q_1 B^(- 1) \( z_i \) = h^(- 1) \( q z_i \) arrow.r 0$. Thus the coordinatewise inverse maps $Y$ into $X$, and the pointwise inverse identities make $Psi$ a bijection.
  For clarity, the estimates apply to every difference of graph sequences. For $s \, t in X$,
  $ sum_i 2^(- i) parallel B \( s_i \) - B \( t_i \) parallel & lt.eq \( 1 + K_q \) sum_i 2^(- i) parallel s_i - t_i parallel \,\
sup_i parallel q B \( s_i \) - q B \( t_i \) parallel & lt.eq b sup_i parallel Q_1 \( s_i - t_i \) parallel . $
  Taking the maximum proves the first inequality in (3.1). For $z \, z' in Y$, the corresponding two bounds for $B^(- 1)$ and $Q_1 B^(- 1) = h^(- 1) q$ are
  $ \( 1 + 2 L_q \/ a \) sum_i 2^(- i) parallel z_i - z'_i parallel \, #h(2em) a^(- 1) sup_i parallel q \( z_i - z'_i \) parallel \, $
  which prove the second. These are global two-point estimates, not only estimates at the origin.
  Finally, define
  $ iota : c_0 \( V \) arrow.r X \, #h(2em) iota \( \( v_i \) \) = \( \( 0 \, v_i \) \)_i . $
  The sequence belongs to $X$, and
  $ parallel iota \( \( v_i \) \) parallel_X = max {sum_i 2^(- i) parallel v_i parallel \, med sup_i parallel v_i parallel} = sup_i parallel v_i parallel \, $
  because $sum_(i gt.eq 1) 2^(- i) = 1$. This is a linear isometry. The Hilbert space $M$ is superreflexive, so 3 makes $E = cal(F) \( M \)$ weakly sequentially complete. By hypothesis $q$ is completely continuous, and 6 therefore excludes a linear copy of $c_0 \( V \)$ from $Y$. A linear isomorphism from $X$ onto $Y$ would carry the displayed closed copy to one in $Y$, which is impossible. ◻
]

#prodef([Remark 3.2.])[
  The identities $q B = h Q_1$ and $Q_1 B^(- 1) = h^(- 1) q$ involve nonlinear maps on both sides. They do not exhibit a map $s : U arrow.r E$ with $q s = "id"_U$, Lipschitz or otherwise. In particular, the quotient splitting corollary of Godefroy and Kalton #cite(label("GK03")) Corollary 3.2 cannot be invoked from these identities.
] <rem:no-section>

== 4 Local orthogonality forces complete continuity <sec:localization>

The graph criterion requires complete continuity of a free-space linearization. The following theorem obtains it from a local coordinate condition on the original Lipschitz map. The neighborhoods are chosen around an arbitrary #emph[finite family of distinct points], and the orthogonality is required only after a common tail cutoff. Neither a global partition nor uniform tail decay on bounded sets is assumed.

#thm([Theorem 4.1.])[
  (Localized linearization).  #emph[Let $\( M \, rho \, 0 \)$ be a complete separable pointed metric space, and let 
$ U = (xor.big_(n gt.eq 1) U_n)_2 $

 be a real Hilbert space with finite-dimensional blocks. Fix an orthonormal basis in every $U_n$, and write $Pi_(gt.eq l)$ for projection onto $U_(gt.eq l) = \( xor.big_(n gt.eq l) U_n \)_2$. Suppose $D : M arrow.r U$ is Lipschitz with $D \( 0 \) = 0$, and that for every $m gt.eq 1$ and every distinct $z_1 \, dots.h \, z_m in M$ there are open neighborhoods $O_j$ of $z_j$, an integer $l gt.eq 1$, and mutually orthogonal coordinate subspaces $H_j subset U_(gt.eq l)$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ Pi_(gt.eq l) D \( O_j \) subset H_j #h(2em) \( 1 lt.eq j lt.eq m \) . $ <eq:local-orthogonality>]

 A coordinate subspace means the closed span of a subset of the fixed orthonormal basis. Then 
$ q = hat(D) : cal(F) \( M \) arrow.r U $

 is completely continuous.]
] <thm:localized-linearization>

The proof tests $D$ against weakly null unit vectors. After passage to a subsequence, only finitely many points can retain local Lipschitz constants above a fixed positive threshold. We first prove an independent metric lemma that controls tests concentrated in shrinking balls around those points. Compact reduction will then control the remainder.

#thm([Lemma 4.2.])[
  (Tests in shrinking balls).  #emph[Let $\( M \, rho \, 0 \)$ be a pointed metric space, let $z in M$, and let $mu_i arrow.r 0$ weakly in $cal(F) \( M \)$. Suppose $r_i > 0$, $r_i arrow.r 0$, and $f_i : M arrow.r bb(R)$ satisfy 
$ f_i \( z \) = 0 \, #h(2em) "Lip" \( f_i \) lt.eq C \, #h(2em) f_i \( x \) = 0 quad upright("when ") rho \( x \, z \) gt.eq r_i \, $

 where $C$ does not depend on $i$. Then $chevron.l f_i \, mu_i chevron.r arrow.r 0$.]
] <lem:shrinking-tests>

#proof[
  For $s > 0$, define
  $ phi.alt_(z \, s) \( x \) = max { 0 \, min { 1 \, thin 2 - 2 rho \( x \, z \) \/ s } } . $
  This cutoff is one on $B \( z \, s \/ 2 \)$, zero outside $B \( z \, s \)$, takes values in $\[ 0 \, 1 \]$, and has Lipschitz constant at most $2 \/ s$. Whenever $f \( z \) = 0$ and $"Lip" \( f \) lt.eq C$, we claim
  #[#set math.equation(numbering: n => "(4.2)")
   $ "Lip" \( f phi.alt_(z \, s) \) lt.eq 3 C \, #h(2em) "Lip" \( f \( 1 - phi.alt_(z \, s) \) \) lt.eq 3 C . $ <eq:cutoff-products>]
  Let $psi$ be either cutoff in this claim. If $psi \( x \) = psi \( y \)$, the difference of the products is at most $C rho \( x \, y \)$. Otherwise at least one endpoint lies in $B \( z \, s \)$; call it $x$. Then $\| f \( x \) \| lt.eq C s$, and
  $ f \( x \) psi \( x \) - f \( y \) psi \( y \) = psi \( y \) \( f \( x \) - f \( y \) \) + f \( x \) \( psi \( x \) - psi \( y \) \) $
  has absolute value at most $C rho \( x \, y \) + C s \( 2 \/ s \) rho \( x \, y \) = 3 C rho \( x \, y \)$. Thus (4.2) needs no global bound on $f$.
  Suppose the conclusion fails. Passing to a subsequence, assume
  $ \| chevron.l f_i \, mu_i chevron.r \| gt.eq epsilon.alt > 0 #h(2em) \( i gt.eq 1 \) . $
  Then $C > 0$. We recursively select increasing indices $i_j$, numbers $0 < s_j < r_(i_j)$, and functions
  $ h_j = f_(i_j) \( 1 - phi.alt_(z \, s_j) \) $
  such that
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| chevron.l h_j \, mu_(i_j) chevron.r \| > epsilon.alt \/ 2 \, #h(2em) "Lip" \( h_j \) lt.eq 3 C \, #h(2em) r_(i_(j + 1)) < s_j \/ 2 . $ <eq:annular-selection>]
  After choosing $i_j$, approximate $mu_(i_j)$ by a finite sum of evaluations
  $ nu_j = sum_(k = 1)^(N_j) a_(j k) delta \( x_(j k) \) \, #h(2em) parallel mu_(i_j) - nu_j parallel < frac(epsilon.alt, 6 C) . $
  Choose $s_j in \( 0 \, r_(i_j) \)$ smaller than every positive distance from $z$ to a member of ${ 0 \, x_(j 1) \, dots.h \, x_(j N_j) }$. If that finite set has no positive such distances, impose only $s_j < r_(i_j)$. The function $p_j = f_(i_j) phi.alt_(z \, s_j)$ vanishes at every one of these points: outside the ball the cutoff is zero, and at a point equal to $z$ the factor $f_(i_j)$ is zero. Including the basepoint is essential when $z eq.not 0$. It gives
  $ chevron.l p_j \, nu_j chevron.r = sum_(k = 1)^(N_j) a_(j k) #scale(x: 120%, y: 120%)[\(] p_j \( x_(j k) \) - p_j \( 0 \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  By (4.2),
  $ \| chevron.l p_j \, mu_(i_j) chevron.r \| lt.eq 3 C parallel mu_(i_j) - nu_j parallel < epsilon.alt \/ 2 . $
  Subtracting from the original pairing proves the first inequality in (4.3); the second is (4.2). Finally choose $i_(j + 1) > i_j$ so large that $r_(i_(j + 1)) < s_j \/ 2$. This completes the recursion.
  The nonzero set of $h_j$ lies in
  $ { x : s_j \/ 2 < rho \( x \, z \) < r_(i_j) } . $
  These annuli are pairwise disjoint. Every finite signed sum $H = sum_(j in A) sigma_j h_j$, with $sigma_j in { - 1 \, 1 }$, therefore satisfies $"Lip" \( H \) lt.eq 6 C$. Indeed, at a point at most one summand is nonzero. If two points lie in the same nonzero set, the $3 C$ bound for that summand applies. If they lie in different nonzero sets, each of the two contributing functions vanishes at the other point, and their $3 C$ bounds add. The cases where one or both points lie in no nonzero set are included. Subtracting $H \( 0 \)$ does not change this Lipschitz bound.
  For every $mu in cal(F) \( M \)$ and finite $A subset bb(N)$, real signs give
  $ sum_(j in A) \| chevron.l h_j \, mu chevron.r \| = max_(sigma_j in { - 1 \, 1 }) lr(|⟨sum_(j in A) sigma_j h_j \, mu⟩|) lt.eq 6 C parallel mu parallel . $
  Taking increasing finite sets shows that
  $ T : cal(F) \( M \) arrow.r ell_1 \, #h(2em) T mu = \( chevron.l h_j \, mu chevron.r \)_(j gt.eq 1) $
  is a bounded linear operator of norm at most $6 C$. Thus $T mu_(i_j) arrow.r 0$ weakly in $ell_1$. By the Schur property of $ell_1$, its norms tend to zero. But its $j$th coordinate has absolute value greater than $epsilon.alt \/ 2$ by (4.3), a contradiction. ◻
]

#proof[
  Let $E = cal(F) \( M \)$ and $L = "Lip" \( D \) = parallel q parallel$. If $L = 0$, then $D = 0$ because $D \( 0 \) = 0$, and $q = 0$. Assume $L > 0$. If $q$ were not completely continuous, after taking a subsequence there would be $mu_i arrow.r 0$ weakly in $E$ and $parallel q mu_i parallel gt.eq epsilon.alt_0 > 0$ for all $i$. Set
  $ b_i = frac(q mu_i, parallel q mu_i parallel) \, #h(2em) d_i \( x \) = chevron.l D \( x \) \, b_i chevron.r \, #h(2em) M_0 = sup_i parallel mu_i parallel < oo . $
  The unit vectors $b_i$ are weakly null. For each $b in U$,
  $ \| chevron.l b_i \, b chevron.r \| lt.eq epsilon.alt_0^(- 1) \| chevron.l q mu_i \, b chevron.r \| arrow.r 0 \, $
  since a bounded linear map preserves weak convergence. Consequently
  #[#set math.equation(numbering: n => "(4.4)")
   $ d_i \( 0 \) = 0 \, #h(2em) "Lip" \( d_i \) lt.eq L \, #h(2em) chevron.l d_i \, mu_i chevron.r = parallel q mu_i parallel gt.eq epsilon.alt_0 . $ <eq:scalar-tests>]
  The functions $d_i$ tend uniformly to zero on every compact subset of $M$. They tend pointwise to zero by weak nullity of $b_i$. Given a compact set and a positive error, take a finite sufficiently fine metric net; pointwise convergence on that net and the common Lipschitz bound control all points of the compact set.
  #emph[Only finitely many points can retain a large local Lipschitz constant.] Choose a countable base $cal(B)$ for $M$, which exists by separability. Take the Lipschitz constant on a set of at most one point to be zero. For each $O in cal(B)$, $"Lip" \( d_i \|_O \) in \[ 0 \, L \]$. Successively take subsequences for the countably many $O$, then take a diagonal subsequence. Relabeling, we may assume that all limits
  $ a_O = lim_(i arrow.r oo) "Lip" \( d_i \|_O \) #h(2em) \( O in cal(B) \) $
  exist. This subsequence is fixed before the next parameter is chosen.
  Fix $eta > 0$ and define
  $ Z = { z in M : a_O gt.eq eta med upright("for every ") O in cal(B) upright(" containing ") z } . $
  Take any finite family of distinct $z_1 \, dots.h \, z_m in Z$. Apply (4.1) and shrink the resulting neighborhoods to base neighborhoods $O_j$ containing $z_j$. Let $P_j$ be projection onto $H_j$, and put $Pi_(< l) = I - Pi_(gt.eq l)$. For $x \, y in O_j$, the tail $Pi_(gt.eq l) \( D \( x \) - D \( y \) \)$ lies in $H_j$. Hence
  $ \| d_i \( x \) - d_i \( y \) \| lt.eq L rho \( x \, y \) #scale(x: 120%, y: 120%)[\(] parallel P_j b_i parallel + parallel Pi_(< l) b_i parallel #scale(x: 120%, y: 120%)[\)] . $
  The first $l - 1$ blocks are finite dimensional. Weak nullity of $b_i$ makes each of its finitely many coordinates there tend to zero, so $parallel Pi_(< l) b_i parallel arrow.r 0$. Since $a_(O_j) gt.eq eta$, the preceding inequality gives
  $ liminf_(i arrow.r oo) parallel P_j b_i parallel gt.eq eta \/ L . $
  The $P_j$ have mutually orthogonal ranges, and $parallel b_i parallel = 1$. It follows that
  $ m eta^2 / L^2 lt.eq liminf_(i arrow.r oo) sum_(j = 1)^m parallel P_j b_i parallel^2 lt.eq 1 . $
  The same conclusion holds for every finite family of distinct points of $Z$, so $Z$ is finite and
  #[#set math.equation(numbering: n => "(4.5)")
   $ \| Z \| lt.eq L^2 \/ eta^2 . $ <eq:exceptional-cardinality>]
  #emph[Remove small neighborhoods of those finitely many points.] Choose $r_0 > 0$ so that the balls $B \( z \, r \)$, $z in Z$, are pairwise disjoint for every $0 < r < r_0$. If $Z$ has at most one point, any $r_0 > 0$ suffices. With the cutoffs used in 10, put
  $ f_(i \, z \, r) = phi.alt_(z \, r) \( d_i - d_i \( z \) \) \, #h(2em) g_(i \, r) = sum_(z in Z) f_(i \, z \, r) \, #h(2em) R_(i \, r) = d_i - g_(i \, r) . $
  An empty sum is zero. Equation (4.2) gives $"Lip" \( f_(i \, z \, r) \) lt.eq 3 L$. Their nonzero sets lie in disjoint balls, so the two-point argument for finite signed sums in the proof of 10 gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ "Lip" \( g_(i \, r) \) lt.eq 6 L \, #h(2em) "Lip" \( R_(i \, r) \) lt.eq 7 L . $ <eq:global-remainder>]
  These constants do not depend on $r$ or on $\| Z \|$.
  For each fixed $z in Z$, we have the ordered limit
  #[#set math.equation(numbering: n => "(4.7)")
   $ lim_(r arrow.b 0) limsup_(i arrow.r oo) \| chevron.l f_(i \, z \, r) \, mu_i chevron.r \| = 0 . $ <eq:one-shrinking-limit>]
  If this failed, some $a > 0$ and radii $r_j arrow.b 0$ would satisfy $limsup_i \| chevron.l f_(i \, z \, r_j) \, mu_i chevron.r \| gt.eq 2 a$. Choose increasing $i_j$ with $\| chevron.l f_(i_j \, z \, r_j) \, mu_(i_j) chevron.r \| gt.eq a$. These tests vanish at $z$, have Lipschitz constants at most $3 L$, and vanish outside $B \( z \, r_j \)$. The weakly null subsequence $mu_(i_j)$ and 10 give a contradiction. Because $Z$ is finite, the triangle inequality and (4.7) imply
  #[#set math.equation(numbering: n => "(4.8)")
   $ lim_(r arrow.b 0) limsup_(i arrow.r oo) \| chevron.l g_(i \, r) \, mu_i chevron.r \| = 0 . $ <eq:shrinking-limit>]
  If $Z$ is empty, (4.8) is immediate.
  The removed part is now controlled. It remains to show that the remainder has small pairing. This is where completeness of $M$ enters through compact reduction.
  #emph[Estimate the remainder on one compact set.] Fix $tau > 0$. By 2, choose a compact $K subset M$, $0 in K$, and $nu_i in cal(F) \( K \)$ with
  $ parallel mu_i - nu_i parallel < tau \, #h(2em) parallel nu_i parallel lt.eq M_0 + tau . $
  The set $K$ depends on $tau$ and the sequence, but not on $r$. Now fix $0 < r < r_0$ while taking the sequence limit. Write $m = \| Z \|$ and
  $ Phi_r = sum_(z in Z) phi.alt_(z \, r) \, #h(2em) epsilon.alt_i = sup_(x in K union Z) \| d_i \( x \) \| . $
  The compact set $K union Z$ contains $0$, so $epsilon.alt_i arrow.r 0$, including when $Z$ is empty. Disjointness of the balls gives $0 lt.eq Phi_r lt.eq 1$, and
  #[#set math.equation(numbering: n => "(4.9)")
   $ R_(i \, r) = \( 1 - Phi_r \) d_i + sum_(z in Z) phi.alt_(z \, r) d_i \( z \) . $ <eq:remainder-identity>]
  For $x in K$ the right side is a convex combination of values bounded in absolute value by $epsilon.alt_i$. Therefore
  #[#set math.equation(numbering: n => "(4.10)")
   $ sup_(x in K) \| R_(i \, r) \( x \) \| lt.eq epsilon.alt_i . $ <eq:remainder-sup>]
  On each inner ball $B \( z \, r \/ 2 \)$, the remainder is the constant $d_i \( z \)$.
  At any point $p in.not Z$, choose $O in cal(B)$ containing $p$ with $a_O < eta$. For $x \, y in K ∩ O$, expansion of (4.9) gives
  $ R_(i \, r) \( x \) - R_(i \, r) \( y \) =  & \( 1 - Phi_r \( x \) \) \( d_i \( x \) - d_i \( y \) \)\
 & + sum_(z in Z) #scale(x: 120%, y: 120%)[\(] phi.alt_(z \, r) \( x \) - phi.alt_(z \, r) \( y \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] d_i \( z \) - d_i \( y \) #scale(x: 120%, y: 120%)[\)] . $
  The last factors have absolute value at most $2 epsilon.alt_i$, and $"Lip" \( phi.alt_(z \, r) \) lt.eq 2 \/ r$. Thus
  #[#set math.equation(numbering: n => "(4.11)")
   $ "Lip" \( R_(i \, r) \|_(K ∩ O) \) lt.eq "Lip" \( d_i \|_O \) + frac(4 m, r) epsilon.alt_i . $ <eq:local-remainder>]
  The radius is fixed here, so the second term tends to zero with $i$.
  The inner balls at points of $Z$, together with the chosen base neighborhoods at points outside $Z$, cover $K$. Choose a finite subcover $V_1 \, dots.h \, V_N$. The Lebesgue-number property supplies $lambda > 0$ such that any pair of points of $K$ at distance less than $lambda$ belongs to some one $V_t$. For an inner ball put $c_(i \, t) = 0$; for a chosen base neighborhood put
  $ c_(i \, t) = "Lip" \( d_i \|_(V_t) \) + \( 4 m \/ r \) epsilon.alt_i . $
  For pairs at distance less than $lambda$, the Lipschitz quotient of $R_(i \, r)$ is at most $max_t c_(i \, t)$, by constancy on inner balls and (4.11). For pairs at distance at least $lambda$, (4.10) bounds it by $2 epsilon.alt_i \/ lambda$. Therefore
  $ "Lip" \( R_(i \, r) \|_K \) lt.eq max {max_(1 lt.eq t lt.eq N) c_(i \, t) \, frac(2 epsilon.alt_i, lambda)} . $
  If $K$ has only one point, its Lipschitz constant is zero and the same conclusion holds. There are finitely many $V_t$, and for each base neighborhood $a_(V_t) < eta$. Taking the upper limit gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ limsup_(i arrow.r oo) "Lip" \( R_(i \, r) \|_K \) lt.eq eta . $ <eq:compact-remainder>]
  Use (2.2) for $nu_i in cal(F) \( K \)$, and use the global bound (4.6) for the approximation error. We obtain
  $ \| chevron.l R_(i \, r) \, mu_i chevron.r \| & lt.eq \| chevron.l R_(i \, r) \, nu_i chevron.r \| + \| chevron.l R_(i \, r) \, mu_i - nu_i chevron.r \|\
 & lt.eq \( M_0 + tau \) "Lip" \( R_(i \, r) \|_K \) + 7 L tau . $
  With $eta \, tau \, K \, r$ fixed, (4.12) implies
  $ limsup_(i arrow.r oo) \| chevron.l R_(i \, r) \, mu_i chevron.r \| lt.eq eta \( M_0 + tau \) + 7 L tau . $
  The right side is independent of $r$. Since $d_i = R_(i \, r) + g_(i \, r)$, we may now let $r arrow.b 0$ and use (4.8) to get
  #[#set math.equation(numbering: n => "(4.13)")
   $ limsup_(i arrow.r oo) \| chevron.l d_i \, mu_i chevron.r \| lt.eq eta \( M_0 + tau \) + 7 L tau #h(2em) upright("for every ") eta > 0 \, med tau > 0 . $ <eq:final-local-bound>]
  The quantifier order is as follows: the diagonal subsequence is fixed first; for each $eta$ choose $Z \, r_0$; for each $tau$ choose $K$; for a fixed $r < r_0$ take $i arrow.r oo$; then take $r arrow.b 0$, $tau arrow.b 0$, and finally $eta arrow.b 0$. No uniform convergence in both $i$ and $r$ has been used. The last two limits in (4.13) make its right side zero, contradicting (4.4). ◻
]

== 5 A localized change of variables in Hilbert space <sec:hilbert>

We now construct the Hilbert-space map required by Proposition 7. The main issue is to let the output coordinates separate input neighborhoods without losing global invertibility.

#thm([Theorem 5.1.])[
  #emph[There are finite-dimensional Euclidean coordinate spaces $U_n$, $U = \( xor.big_(n gt.eq 1) U_n \)_2$, and a bijection $h : U xor_2 ell_2 arrow.r U$ fixing zero, such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ 24 / 25 parallel x - x' parallel lt.eq parallel h \( x \) - h \( x' \) parallel lt.eq 26 / 25 parallel x - x' parallel . $ <eq:h-bounds>]

 Moreover, $D = h - pi_U$ has local orthogonality: for every finite family of distinct points $x_1 \, dots.h \, x_m$ there are neighborhoods $O_j$ of $x_j$, an integer $l$, and mutually orthogonal coordinate subspaces $H_j subset \( xor.big_(n gt.eq l) U_n \)_2$ such that 
$ P_(gt.eq l) D \( O_j \) subset H_j #h(2em) \( 1 lt.eq j lt.eq m \) . $

 Here $P_(gt.eq l)$ is the projection onto blocks with index at least $l$, and a coordinate subspace is the closed span of a subset of the specified orthonormal coordinates.]
] <thm:hilbert-map>

We begin with an onto isometric rearrangement determined by one unit vector in each block. Allowing these vectors to depend on the input will produce $h$. The rearrangement identifies the two requirements on their motion: a weighted derivative bound will control metric distortion, and separation of their coordinate supports will give local orthogonality. We then construct the vectors, prove global invertibility of finite approximants, and use an inverse-tail estimate to show that their limiting map is onto.

=== 5.1 The frozen rearrangement <the-frozen-rearrangement>

For the moment let $U = \( xor.big_(n gt.eq 1) U_n \)_2$ have arbitrary nonzero finite-dimensional real Hilbert blocks, let $V = ell_2$, and put $M = U xor_2 V$. Choose a unit vector $xi_n in U_n$ for each $n$. For $x = \( u \, v \) in M$, write

$ alpha_n = chevron.l xi_n \, u_n chevron.r \, #h(2em) u_n^perp = u_n - alpha_n xi_n \, #h(2em) C_(2 m) = alpha_m \, quad C_(2 m - 1) = v_m . $

Define

#[#set math.equation(numbering: n => "(5.2)")
 $ \( L_xi x \)_n = u_n^perp + C_n xi_n . $ <eq:frozen-map>]

Thus the perpendicular component stays in block $n$; the old slot coefficient $alpha_m$ moves to the slot in block $2 m$, and $v_m$ fills the slot in block $2 m - 1$. Figure 1 shows this rearrangement.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.7), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_n^ perp in xi_n^ perp$]]])])
  content((0, 0.35), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[old slot $alpha_m$]]])])
  content((0, -1), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[extra coordinate $v_m$]]])])
  content((7, 1.7), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_n^ perp$ in block $n$]]])])
  content((7, 0.35), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$alpha_m xi_2m$ in block $2m$]]])])
  content((7, -1), [#box(width: 4cm, height: 0.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_m xi_(2m-1)$ in block $2m-1$]]])])
  line((2, 1.7), (5, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.5, 1.7), [#text(size: 9pt)[unchanged]], anchor: "south", padding: 0.1176cm)
  line((2, 0.35), (5, 0.35), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.5, 0.35), [#text(size: 9pt)[even slots]], anchor: "south", padding: 0.1176cm)
  line((2, -1), (5, -1), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.5, -1), [#text(size: 9pt)[odd slots]], anchor: "south", padding: 0.1176cm)
  content((0, 2.5), [#text(size: 9pt)[Input: $U plus.o_2 ell_2$]])
  content((7, 2.5), [#text(size: 9pt)[Output: $U$]])
})],
  caption: [Figure 1: The frozen map $L_xi$. The perpendicular components and the two scalar sequences form orthogonal coordinates. The picture describes the frozen linear isometry; when the slots depend on the input, it gives the pointwise norm identity but not preservation of distances between distinct inputs. ],
) <fig:slots>

#thm([Lemma 5.2.])[
  #emph[$L_xi : M arrow.r U$ is an onto linear isometry. If $y = \( y_n \) in U$ and $beta_n = chevron.l xi_n \, y_n chevron.r$, its inverse is 
#[#set math.equation(numbering: n => "(5.3)")
 $ \( L_xi^(- 1) y \)_(U_m) = y_m - beta_m xi_m + beta_(2 m) xi_m \, #h(2em) \( L_xi^(- 1) y \)_(V_m) = beta_(2 m - 1) . $ <eq:frozen-inverse>]

]
] <lem:frozen-inverse>

#proof[
  All formulas are linear for fixed $xi$. Since $u_n^perp perp xi_n$, the squared norm of (5.2) is
  $ parallel L_xi x parallel^2 & = sum_n parallel u_n^perp parallel^2 + sum_n \| C_n \|^2\
 & = sum_n #scale(x: 120%, y: 120%)[\(] parallel u_n parallel^2 - \| alpha_n \|^2 #scale(x: 120%, y: 120%)[\)] + sum_m \| alpha_m \|^2 + sum_m \| v_m \|^2 = parallel x parallel_M^2 . $
  This also proves the output belongs to $U$.
  For $y in U$, $\| beta_n \| lt.eq parallel y_n parallel$, so $\( beta_n \) in ell_2$. The first two terms $y_m - beta_m xi_m$ in (5.3) are perpendicular to its last term. The prescribed vector therefore belongs to $M$, since
  $ & sum_m (parallel y_m - beta_m xi_m + beta_(2 m) xi_m parallel^2 + \| beta_(2 m - 1) \|^2)\
 & #h(2em) = sum_m #scale(x: 120%, y: 120%)[\(] parallel y_m parallel^2 - \| beta_m \|^2 #scale(x: 120%, y: 120%)[\)] + sum_m \| beta_(2 m) \|^2 + sum_m \| beta_(2 m - 1) \|^2 = parallel y parallel^2 . $
  For this input the old slot coefficient is $beta_(2 m)$, and the perpendicular component in block $m$ is $y_m - beta_m xi_m$. The even and odd output slots consequently recover every $beta_n$, so (5.2) returns $y$. This proves surjectivity and the inverse formula. ◻
]

=== 5.2 What the moving slots must satisfy <what-the-moving-slots-must-satisfy>

Given continuously differentiable unit-vector maps $w_n : M arrow.r U_n$, define $h \( x \) = L_(w \( x \)) x$. Explicitly,

#[#set math.equation(numbering: n => "(5.4)")
 $ h \( x \)_n & = u_n + w_n \( x \) #scale(x: 120%, y: 120%)[\(] C_n \( x \) - chevron.l w_n \( x \) \, u_n chevron.r #scale(x: 120%, y: 120%)[\)] \,\
C_(2 m) \( x \) & = chevron.l w_m \( x \) \, u_m chevron.r \, #h(2em) C_(2 m - 1) \( x \) = v_m . $ <eq:h-formula>]

The frozen isometry shows that this is well-defined and gives

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel h \( x \) parallel = parallel x parallel . $ <eq:pointwise-norm>]

This identity does not yet compare distinct inputs, whose slots may differ. To control that difference, fix $c = 1 \/ 100$ and define the nonnegative weights

#[#set math.equation(numbering: n => "(5.6)")
 $ a_n \( x \)^2 = parallel u_n parallel^2 + parallel u_(ceil.l n \/ 2 ceil.r) parallel^2 + \| v_(ceil.l n \/ 2 ceil.r) \|^2 . $ <eq:weights-radii>]

These weights follow the routing in (5.4): $\| C_n \( x \) \| lt.eq a_n \( x \)$ and $parallel u_n parallel lt.eq a_n \( x \)$, so the scalar coefficient multiplying $w_n \( x \)$ has absolute value at most $2 a_n \( x \)$. We shall choose the slots so that

#[#set math.equation(numbering: n => "(5.7)")
 $ sum_(n gt.eq 1) a_n \( x \)^2 parallel D w_n \( x \) parallel^2 lt.eq c^2 #h(2em) \( x in M \) . $ <eq:slot-budget>]

We shall show that each derivative of a finite approximant is within $4 c$ of a frozen isometry.

The second requirement concerns the coordinate supports. For every finite family of distinct input points, we shall find neighborhoods whose slots use disjoint coordinates in all sufficiently high blocks. Indeed, the $n$th block of $D \( x \) = h \( x \) - u$ is a scalar multiple of $w_n \( x \)$, so this separation gives the required local orthogonality of $D$. We now choose the block dimensions and construct slots satisfying both requirements.

=== 5.3 Finite stages and separating coordinates <finite-stages-and-separating-coordinates>

Choose a nonnegative smooth function $psi : bb(R) arrow.r bb(R)$ that is positive on $\( - 1 \, 1 \)$ and zero outside $\[ - 1 \, 1 \]$. For $k gt.eq 1$, put

$ cal(A)_k = { - k \, - k + 1 \, dots.h \, k }^k . $

For $a = \( a_1 \, dots.h \, a_k \) in cal(A)_k$, define

$ G_(k \, a) \( t \) = product_(j = 1)^k psi \( k t_j - a_j \) #h(2em) \( t in \[ - 1 \, 1 \]^k \) . $

Every point of $\[ - 1 \, 1 \]$ is within $1 \/ \( 2 k \)$ of some $a_j \/ k$ with $- k lt.eq a_j lt.eq k$. Thus $G_k \( t \) = \( G_(k \, a) \( t \) \)_(a in cal(A)_k)$ is never zero on the cube. Its Euclidean norm has a positive minimum there. Each factor $t mapsto psi \( k t - a_j \)$ is supported on an interval of length $2 \/ k$.

Give $U_n$ an orthonormal basis consisting of a single stage-zero vector and a separate set of coordinates indexed by $cal(A)_k$ for each $1 lt.eq k lt.eq n$. Different stages are orthogonal. In particular, we may take

#[#set math.equation(numbering: n => "(5.8)")
 $ dim U_n = 1 + sum_(k = 1)^n \( 2 k + 1 \)^k . $ <eq:block-dimensions>]

From now on, use these blocks in the separable Hilbert spaces

$ U = (xor.big_(n gt.eq 1) U_n)_2 \, #h(2em) V = ell_2 \, #h(2em) M = U xor_2 V $

on which the slots will be constructed. Enumerate the scalar coordinates of $M$ and apply $tanh$ to each of them. This gives smooth Lipschitz functions $p_j : M arrow.r \[ - 1 \, 1 \]$ that separate points.

Let $W_(n \, 0)$ be the constant stage-zero unit vector. For $1 lt.eq k lt.eq n$, let $W_(n \, k) \( x \)$ be the vector supported on stage $k$ with coordinates

#[#set math.equation(numbering: n => "(5.9)")
 $ W_(n \, k) \( x \)_a = frac(G_(k \, a) \( p_1 \( x \) \, dots.h \, p_k \( x \) \), parallel G_k \( p_1 \( x \) \, dots.h \, p_k \( x \) \) parallel_2) . $ <eq:normalized-stage>]

It is a smooth unit-vector map. Compactness of the cube, the positive lower bound for the denominator, and boundedness of the derivatives of the $p_j$ give

$ sup_x parallel D W_(n \, k) \( x \) parallel lt.eq L_k < oo . $

The same $L_k$ works for every $n gt.eq k$, since their stage-$k$ coordinate formulas are identical. Put $L_0 = 0$. No bound uniform in $k$ is needed.

=== 5.4 A common budget for motion <a-common-budget-for-motion>

To obtain (5.7), use the tails of the weights (5.6) as nonnegative radii:

$ r_n \( x \)^2 = sum_(j gt.eq n) a_j \( x \)^2 . $

Every input coordinate in the second and third terms of (5.6) is counted twice, so

#[#set math.equation(numbering: n => "(5.10)")
 $ r_1 \( x \)^2 = 3 parallel u parallel^2 + 2 parallel v parallel^2 \, #h(2em) a_n \( x \)^2 = r_n \( x \)^2 - r_(n + 1) \( x \)^2 . $ <eq:radii-identities>]

Each $r_n$ is the norm of a bounded linear map into a Hilbert space. It is $sqrt(3)$-Lipschitz, smooth where positive, and tends to zero at every fixed $x$.

With the fixed constant $c = 1 \/ 100$, set

#[#set math.equation(numbering: n => "(5.11)")
 $ gamma \( r \) = cases(delim: "{", frac(c, r log \( 1 \/ r \)) \, & 0 < r < e^(- 2) \,, 0 \, & r gt.eq e^(- 2) .) $ <eq:gamma>]

This function is nonincreasing as $r$ increases. It has an infinite first integral near zero but a finite weighted square integral:

#[#set math.equation(numbering: n => "(5.12)")
 $ integral_0^b gamma \( r \) thin d r = oo quad \( b > 0 \) \, #h(2em) integral_0^oo 2 r gamma \( r \)^2 thin d r = 2 c^2 integral_2^oo t^(- 2) thin d t = c^2 . $ <eq:gamma-integrals>]

The infinite first integral permits arbitrarily many rotations; the second estimate will bound their total effect on the derivative.

Choose successive compact intervals $\[ a'_k \, b'_k \] subset \( 0 \, e^(- 2) \)$ for the transitions from stage $k - 1$ to stage $k$, with

$ b'_(k + 1) < a'_k \, #h(2em) b'_k < 2^(- k) \, #h(2em) gamma \( r \) \/ 2 gt.eq L_(k - 1) + L_k quad \( 0 < r lt.eq b'_k \) . $

They can be chosen together with smooth nonincreasing angles $theta_k : \[ 0 \, oo \) arrow.r \[ 0 \, pi \/ 2 \]$ such that

#[#set math.equation(numbering: n => "(5.13)")
 $ theta_k \( r \) = pi \/ 2 med \( r lt.eq a'_k \) \, #h(2em) theta_k \( r \) = 0 med \( r gt.eq b'_k \) \, #h(2em) \| theta'_k \( r \) \| lt.eq gamma \( r \) \/ \( 2 sqrt(3) \) \, $ <eq:angle-bounds>]

and the angles are constant near the interval endpoints. Here is a direct construction. First choose $b'_k$ small enough for the derivative bound and the preceding interval. By (5.12), a sufficiently small $a'_k > 0$ makes the integral of $gamma \/ \( 2 sqrt(3) \)$ over $\( a'_k \, b'_k \)$ larger than $pi \/ 2$. A smooth nonnegative function supported inside this interval, bounded above by $gamma \/ \( 2 sqrt(3) \)$ and with integral larger than $pi \/ 2$, exists by approximation from below. Rescale it to integral $pi \/ 2$ and integrate from $r$ to $+ oo$ to obtain $theta_k$.

For each $n$, define a unit-vector map $P_n \( x \, r \)$ by following these same timings through stages $0 \, dots.h \, n$ and then stopping. On the $k$th transition interval, $k lt.eq n$, put

$ P_n \( x \, r \) = cos theta_k \( r \) thin W_(n \, k - 1) \( x \) + sin theta_k \( r \) thin W_(n \, k) \( x \) . $

Between intervals use the intervening single stage; use $W_(n \, 0)$ above $b'_1$ and $W_(n \, n)$ below $a'_n$, including at $r = 0$. Orthogonality of the stages makes this a unit vector. The endpoint choices make $P_n$ continuously differentiable. On a transition, (5.13) and the bounds for $L_k$ give

#[#set math.equation(numbering: n => "(5.14)")
 $ parallel partial_x P_n \( x \, r \) parallel lt.eq gamma \( r \) \/ 2 \, #h(2em) parallel partial_r P_n \( x \, r \) parallel lt.eq gamma \( r \) \/ \( 2 sqrt(3) \) #h(2em) \( r > 0 \) . $ <eq:P-derivatives>]

Between transitions the first bound follows from monotonicity of $gamma$, and the second derivative is zero. Stage zero is constant, so both bounds also hold where $gamma = 0$.

Set

#[#set math.equation(numbering: n => "(5.15)")
 $ w_n \( x \) = P_n \( x \, r_n \( x \) \) . $ <eq:moving-slot>]

Although $r_n$ need not be differentiable where it vanishes, $w_n$ is continuously differentiable there: in a neighborhood of any such point, $r_n < a'_n$ and $w_n = W_(n \, n)$. At a point with $r_n > 0$, the chain rule and (5.14) give $parallel D w_n \( x \) parallel lt.eq gamma \( r_n \( x \) \)$. These slots satisfy the required budget (5.7). Indeed, when $r_n > 0$, monotonicity gives

$ \( r_n^2 - r_(n + 1)^2 \) gamma \( r_n \)^2 lt.eq integral_(r_(n + 1))^(r_n) 2 r gamma \( r \)^2 thin d r \, $

and summing uses (5.12). When $r_n = 0$, also $a_n = 0$, so that term in (5.7) is zero.

The derivative budget controls metric distortion. We still need the independent locality property that will make the free-space linearization completely continuous.

=== 5.5 Local orthogonality of the slots <local-orthogonality-of-the-slots>

#thm([Lemma 5.3.])[
  #emph[For every finite family of distinct points of $M$ there are neighborhoods $O_j$ and an integer $l$ such that the coordinate supports of ${ w_n \( x \) : x in O_j \, med n gt.eq l }$ are disjoint for different $j$.]
] <lem:slot-locality>

#proof[
  For an empty family, take $l = 1$ and the empty family of neighborhoods. For a singleton, take $l = 1$ and $O_1 = M$. In either case there is no disjointness condition to check. Now consider two distinct points. Some $p_j$ has different values at them. Choose $k_0 gt.eq j$ sufficiently large and neighborhoods on which all values of that $p_j$ on the two sides are separated by more than $2 \/ k_0$. At any stage $k gt.eq k_0$, a coordinate label that occurs on both sides would require the $j$th factor $psi \( k p_j - a_j \)$ to be nonzero at points $x \, y$ on opposite sides. Then both $p_j \( x \)$ and $p_j \( y \)$ would lie in $\( \( a_j - 1 \) \/ k \, \( a_j + 1 \) \/ k \)$, contradicting $\| p_j \( x \) - p_j \( y \) \| > 2 \/ k_0 gt.eq 2 \/ k$. Thus the unions of the supports on the two neighborhoods are disjoint at every common stage $k gt.eq k_0$.
  Fix $0 < rho < a'_(k_0)$, below the completed transition into stage $k_0$. Choose $l gt.eq k_0$ so that $r_l$ at each center is less than $rho \/ 2$, and shrink both neighborhoods to have radius less than $rho \/ \( 2 sqrt(3) \)$. Since $r_n lt.eq r_l$ for $n gt.eq l$ and $r_l$ is $sqrt(3)$-Lipschitz, we have $r_n \( x \) < rho$ throughout either neighborhood whenever $n gt.eq l$. Only stages $k gt.eq k_0$ are then active in $w_n \( x \)$. Distinct stages are orthogonal, and supports at the same stage are disjoint by the first paragraph. This proves the two-point assertion. For finitely many points, intersect the neighborhoods obtained for every pair and take the largest cutoff. ◻
]

The use of small neighborhoods here is essential: pointwise decay of the $r_n$ and their common Lipschitz bound suffice. Uniform decay on bounded subsets of $M$ is neither claimed nor needed.

The constructed slots now satisfy both the derivative budget and local separation. Use them in (5.4) to define $h$. It remains to prove the two-point bounds and surjectivity; the pointwise norm identity alone does not give either conclusion.

=== 5.6 Finite approximants and global inverses <finite-approximants-and-global-inverses>

Let $h_N$ be the same rearrangement with slots

$ w_n^(\( N \)) \( x \) = cases(delim: "{", w_n \( x \) \, & n lt.eq N \,, W_(n \, 0) \, & n > N .) $

Let $A_0$ denote the isometry with all slots equal to $W_(n \, 0)$. Only output blocks $n lt.eq 2 N$ of $h_N - A_0$ can be nonzero, and their formulas are continuously differentiable. Thus $h_N$ is a continuously differentiable map between Hilbert spaces. It also satisfies $parallel h_N \( x \) parallel = parallel x parallel$.

#thm([Lemma 5.4.])[
  #emph[Each $h_N : M arrow.r U$ is a continuously differentiable bijection with continuously differentiable inverse, and 
#[#set math.equation(numbering: n => "(5.16)")
 $ \( 1 - 4 c \) parallel x - x' parallel lt.eq parallel h_N \( x \) - h_N \( x' \) parallel lt.eq \( 1 + 4 c \) parallel x - x' parallel . $ <eq:hN-bounds>]

]
] <lem:approximant-inverse>

#proof[
  Fix a point and a unit direction, and abbreviate the approximant slots $w_n^(\( N \)) \( x \)$ and their directional derivatives by $w_n \, dot(w)_n$; the slots with $n > N$ have derivative zero. Differentiating the inputs in (5.4) with the slots frozen gives the onto isometry $L_(w^(\( N \)) \( x \))$. The remaining terms in output block $n$ are
  $ dot(w)_n \( C_n - chevron.l w_n \, u_n chevron.r \) + w_n #scale(x: 120%, y: 120%)[\(] dot(C)_n - chevron.l dot(w)_n \, u_n chevron.r #scale(x: 120%, y: 120%)[\)] \, #h(2em) dot(C)_(2 m) = chevron.l dot(w)_m \, u_m chevron.r \, quad dot(C)_(2 m - 1) = 0 . $
  Put $R^2 = sum_n a_n \( x \)^2 parallel dot(w)_n parallel^2 lt.eq c^2$. Since $\| C_n - chevron.l w_n \, u_n chevron.r \| lt.eq 2 a_n$, the first term has Hilbert norm at most $2 R$. Each of the scalar sequences $\( dot(C)_n \)_n$ and $\( chevron.l dot(w)_n \, u_n chevron.r \)_n$ has $ell_2$ norm at most $R$, because $a_n gt.eq parallel u_n parallel$. Therefore
  #[#set math.equation(numbering: n => "(5.17)")
   $ parallel D h_N \( x \) - L_(w^(\( N \)) \( x \)) parallel lt.eq 4 c . $ <eq:derivative-perturbation>]
  A Neumann-series perturbation of the isometry gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ parallel D h_N \( x \) parallel lt.eq 1 + 4 c \, #h(2em) parallel D h_N \( x \)^(- 1) parallel lt.eq \( 1 - 4 c \)^(- 1) . $ <eq:derivative-bounds>]
  We next establish global bijectivity before using the lower Lipschitz estimate. Put $F_N = xor.big_(n lt.eq 2 N) U_n$ and let $P$ project onto $F_N^perp$. We have
  $ P h_N = P A_0 . $
  For a fixed $b in F_N^perp$, the map $h_N$ thus restricts to
  #[#set math.equation(numbering: n => "(5.19)")
   $ A_0^(- 1) \( b \) + A_0^(- 1) \( F_N \) arrow.r b + F_N . $ <eq:fiber-map>]
  These affine spaces have the same finite dimension. The derivative is an isomorphism between their tangent spaces. Indeed it maps $A_0^(- 1) \( F_N \)$ into $F_N$; conversely, for $z in F_N$, the vector $t = D h_N \( x \)^(- 1) z$ satisfies $P A_0 t = P D h_N \( x \) t = 0$. Thus (5.19) is a local diffeomorphism. It is proper, since an inverse image of a compact set is closed and norm-bounded by $parallel h_N \( x \) parallel = parallel x parallel$, hence compact in this finite-dimensional source fiber.
  A proper local diffeomorphism between affine Euclidean spaces of the same dimension is bijective. To recall the topological argument, its image is open by local invertibility and closed by properness, so it is the entire target. Each fiber is compact and discrete, hence finite. Local inverse neighborhoods, together with properness to exclude further preimages nearby, make it a covering map. A covering of a simply connected Euclidean space with connected source has one sheet. Applying this to (5.19) proves that $h_N$ is bijective on each fiber and therefore on all of $M$.
  The local inverses supplied by the inverse function theorem agree and form a global continuously differentiable inverse. Integrating the two bounds in (5.18) along line segments, for $h_N$ and for its now-defined inverse, proves (5.16). ◻
]

=== 5.7 Passing to an onto limit <passing-to-an-onto-limit>

#proof[
  #emph[Completion of the proof of Theorem 11.] For fixed $x = \( u \, v \)$, the first $N$ output blocks of $h_N \( x \)$ and $h \( x \)$ agree. Indeed, their own slots agree in those blocks, and the old slot used in an even block $2 m lt.eq N$ has $m lt.eq N$. For either list $zeta = w \( x \)$ or $zeta = w^(\( N \)) \( x \)$, write
  $ C_(2 m)^zeta = chevron.l zeta_m \, u_m chevron.r \, #h(2em) C_(2 m - 1)^zeta = v_m . $
  Then $\( L_zeta x \)_n - u_n = zeta_n \( C_n^zeta - chevron.l zeta_n \, u_n chevron.r \)$. Since $\| C_n^zeta \| lt.eq a_n \( x \)$ and $parallel u_n parallel lt.eq a_n \( x \)$, each difference from $u_n$ has norm at most $2 a_n \( x \)$. For the remaining blocks, the difference between the two maps has norm at most $4 a_n \( x \)$. Hence
  #[#set math.equation(numbering: n => "(5.20)")
   $ parallel h_N \( x \) - h \( x \) parallel lt.eq 4 r_(N + 1) \( x \) arrow.r 0 . $ <eq:h-pointwise-limit>]
  For fixed $x \, x'$, take $N arrow.r oo$ in (5.16). This proves the two-sided bounds (5.1), since $1 - 4 c = 24 \/ 25$ and $1 + 4 c = 26 \/ 25$. In particular, $h$ is injective. It fixes zero by (5.5).
  We now prove surjectivity. Fix $y = \( y_n \) in U$ and, using 14, put
  $ x_N = h_N^(- 1) \( y \) . $
  Freeze the slots of $h_N$ at this particular input:
  $ xi_n^(\( N \)) = w_n^(\( N \)) \( x_N \) \, #h(2em) beta_n^(\( N \)) = chevron.l xi_n^(\( N \)) \, y_n chevron.r . $
  The directions may vary with $N$. Nevertheless $y = L_(xi^(\( N \))) x_N$ is an exact equality for each $N$, so 12 gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ \( x_N \)_(U_m) = y_m - beta_m^(\( N \)) xi_m^(\( N \)) + beta_(2 m)^(\( N \)) xi_m^(\( N \)) \, #h(2em) \( x_N \)_(V_m) = beta_(2 m - 1)^(\( N \)) . $ <eq:xN-inverse>]
  The component $y_m - beta_m^(\( N \)) xi_m^(\( N \))$ is perpendicular to $xi_m^(\( N \))$. Thus its squared norm is $parallel y_m parallel^2 - \| beta_m^(\( N \)) \|^2$, and the last term in the $U_m$ formula adds orthogonally.
  For every integer $s gt.eq 1$, it follows that
  #[#set math.equation(numbering: n => "(5.22)")
   $ & sum_(m gt.eq s) (parallel \( x_N \)_(U_m) parallel^2 + \| \( x_N \)_(V_m) \|^2)\
 & quad = sum_(m gt.eq s) (parallel y_m parallel^2 - \| beta_m^(\( N \)) \|^2 + \| beta_(2 m)^(\( N \)) \|^2 + \| beta_(2 m - 1)^(\( N \)) \|^2)\
 & quad = sum_(n gt.eq s) parallel y_n parallel^2 - sum_(n = s)^(2 s - 2) \| beta_n^(\( N \)) \|^2 lt.eq sum_(n gt.eq s) parallel y_n parallel^2 . $ <eq:inverse-tail>]
  Here $\| beta_n^(\( N \)) \| lt.eq parallel y_n parallel$, so all squared-coefficient series converge. The last equality is exact: the even and odd indices $2 m \, 2 m - 1$ for $m gt.eq s$ partition the integers $n gt.eq 2 s - 1$; their sum cancels that tail of $sum_(n gt.eq s) \| beta_n^(\( N \)) \|^2$. The only uncancelled negative terms have $s lt.eq n lt.eq 2 s - 2$. This finite sum is empty when $s = 1$. Keeping it is what avoids double counting the output’s perpendicular and slot components.
  The right side of (5.22) tends to zero with $s$, independently of $N$. At $s = 1$ the equality gives $parallel x_N parallel = parallel y parallel$. For each $s$, the heads
  $ #scale(x: 120%, y: 120%)[\(] \( x_N \)_(U_m) \, \( x_N \)_(V_m) #scale(x: 120%, y: 120%)[\)]_(m < s) $
  lie in a bounded subset of the finite-dimensional space $xor.big_(m < s) \( U_m xor bb(R) \)$. By successive subsequence selection in these finite-dimensional spaces and a diagonal choice, there is an increasing sequence $N_j$ for which every fixed head converges.
  This diagonal subsequence is Cauchy in the full norm. Given $epsilon.alt > 0$, choose $s$ so that $sum_(n gt.eq s) parallel y_n parallel^2 < \( epsilon.alt \/ 4 \)^2$. By (5.22), the tail of each of $x_(N_j)$ and $x_(N_k)$ has norm less than $epsilon.alt \/ 4$. For sufficiently large $j \, k$, convergence of the fixed head makes its difference smaller than $epsilon.alt \/ 2$. The triangle inequality then gives $parallel x_(N_j) - x_(N_k) parallel < epsilon.alt$. Completeness of $M$ yields $x_(N_j) arrow.r x$ in norm for some $x in M$.
  Finally, apply the pointwise convergence estimate at this fixed limit $x$, and use the common upper Lipschitz bound for $h_(N_j)$:
  $ parallel h \( x \) - y parallel & lt.eq parallel h \( x \) - h_(N_j) \( x \) parallel + parallel h_(N_j) \( x \) - h_(N_j) \( x_(N_j) \) parallel\
 & lt.eq 4 r_(N_j + 1) \( x \) + \( 1 + 4 c \) parallel x - x_(N_j) parallel arrow.r 0 . $
  Thus $h \( x \) = y$. Since $y$ was arbitrary, $h$ is onto.
  The local orthogonality asserted in the theorem follows from 13. For its neighborhoods $O_j$ and cutoff $l$, let $H_j$ be the closed span of the union of coordinate supports of $w_n \( x \)$ with $x in O_j$ and $n gt.eq l$. These are mutually orthogonal coordinate subspaces of $U_(gt.eq l)$. Each block $D \( x \)_n$ is a scalar multiple of $w_n \( x \)$ by (5.4). Its convergent tail therefore belongs to $H_j$ for every $x in O_j$, because $H_j$ is closed. This verifies exactly (4.1) and completes the proof. ◻
]

== 6 The counterexample <sec:assembly>

The Hilbert construction supplies the geometric hypotheses of localized linearization. The resulting completely continuous operator then meets the weighted graph criterion.

#proof[
  Take the real Hilbert spaces $U$, $V = ell_2$, $M = U xor_2 V$ and the map $h : M arrow.r U$ from 11. The blocks $U_n$ are finite dimensional, so $U$ and $M$ are separable; as Hilbert spaces they are complete. Put
  $ E = cal(F) \( M \) \, #h(2em) D = h - pi_U \, #h(2em) q = hat(D) : E arrow.r U . $
  The map $D$ is Lipschitz, $D \( 0 \) = 0$, and it has the finite-family tail-coordinate orthogonality required by 9. That theorem makes $q$ completely continuous. By (2.3) and (5.1),
  $ parallel q parallel = "Lip" \( D \) lt.eq "Lip" \( h \) + parallel pi_U parallel lt.eq 26 / 25 + 1 = 51 / 25 . $
  Set
  $ Q_1 : E xor_1 ell_2 arrow.r M \, #h(2em) Q_1 \( e \, v \) = \( q e \, v \) \, #h(2em) X = Z_(Q_1) \, #h(2em) Y = Z_q . $
  All hypotheses of 7 hold with $a = 24 \/ 25$, $b = 26 \/ 25$. It supplies the coordinatewise bijection $Psi : X arrow.r Y$, an isometric copy of $c_0 \( ell_2 \)$ in $X$, and exclusion of every linearly isomorphic copy from $Y$. In particular $X$ and $Y$ are not linearly isomorphic.
  Since $L_q lt.eq 51 \/ 25$ and $K_q = max { L_q \, 1 } lt.eq 51 \/ 25$, (3.1) gives
  $ "Lip" \( Psi \) & lt.eq max {1 + 51 / 25 \, 26 / 25} = 76 / 25 \,\
"Lip" \( Psi^(- 1) \) & lt.eq max {1 + frac(2 \( 51 \/ 25 \), 24 \/ 25) \, 25 / 24} = 21 / 4 . $
  The latter inequality is equivalent to the lower bound $parallel Psi \( s \) - Psi \( t \) parallel_Y gt.eq \( 4 \/ 21 \) parallel s - t parallel_X$. Both bounds hold for all pairs $s \, t in X$, exactly as in (1.1). ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
